%Sean Conway
% Fire Emblem Heroes Summoning Simulator (Greedy Algorithm)
% Use simulation to find the number of five stars you get with a given
% number of orbs, given that all orbs are used to summon

clc;
clear all;
close all;

bannerFocusChance = 0.08;
bannerFiveStarChance = 0;
bannerFourStarChance = 0.58;
bannerThreeStarChance = 0.34;

focusCount = 0;
fiveStarCount = 0;
fourStarCount = 0;
threeStarCount = 0;

%setting the initial arrays up, with heroes, colors, and number of stars
hero = {'LIke', 'LEphraim', 'LLyn', 'LRobin', 'FCelica', 'SMEirika', 'Micaiah', 'PAShigure', 'HHenry', 'PAInigo', 'HJakob', 'Genny', 'Athena', 'Eirika', 'Eliwood', 'Ogma', 'Olivia', 'Cain', 'Hana', 'MCorrin', 'Chrom', 'Caeda', 'Seliph', 'Seth', 'Soleil', 'Stahl', 'Draug', 'Palla', 'Hinata', 'Fir', 'Marth', 'Laslow', 'Selena', 'Roy', 'Lonqu', 'ATiki', 'Tharja', 'Sophia', 'Henry', 'Morgan', 'Lilina', 'Raigh', 'Abel', 'Gwendolyn', 'Est', 'Effie', 'Oscar', 'Oboro', 'Catria', 'Clair', 'Shanna', 'Jagen', 'Sully', 'Subaki', 'Cordelia', 'Donnel', 'Peri', 'Florina', 'Mathilda', 'Lukas', 'Roderick', 'FCorrin', 'Nowi', 'Odin', 'Tailtiu', 'Mae', 'Reinhardt', 'LArachel', 'MRobin', 'Camilla', 'Gunter', 'Sheena', 'Cherche', 'Titania', 'Arthur', 'Bartre', 'Barst', 'Frederick', 'Beruka', 'Hawkeye', 'Raven', 'Fae', 'Cecilia', 'Soren', 'Nino', 'Boey', 'Merric', 'Klein', 'Gordin', 'Jeorge', 'Setsuna', 'Niles', 'Leon', 'Rebecca', 'Virion', 'Kagero', 'Gaius', 'Saizo', 'Sothe', 'Jakob', 'Felicia', 'Matthew', 'Azama', 'Clarine', 'Sakura', 'Serra', 'Nanna', 'Priscilla', 'Maria', 'Lachesis', 'Lissa', 'Wrys', 'Lucius', 'Athena', 'Eirika', 'Eliwood', 'Ogma', 'Olivia', 'Cain', 'Hana', 'MCorrin', 'Chrom', 'Caeda', 'Seliph', 'Seth', 'Stahl', 'Draug', 'Palla', 'Hinata', 'Fir', 'Marth', 'Laslow', 'Selena', 'Roy', 'Lonqu', 'ATiki', 'Tharja', 'Sophia', 'Henry', 'Lilina', 'Raigh', 'Abel', 'Gwendolyn', 'Est', 'Effie', 'Oscar', 'Oboro', 'Catria', 'Clair', 'Shanna', 'Jagen', 'Sully', 'Subaki', 'Cordelia', 'Donnel', 'Peri', 'Florina', 'Mathilda', 'Lukas', 'Roderick', 'FCorrin', 'Nowi', 'Odin', 'Mae', 'Reinhardt', 'MRobin', 'Camilla', 'Gunter', 'Sheena', 'Cherche', 'Titania', 'Arthur', 'Bartre', 'Barst', 'Frederick', 'Beruka', 'Hawkeye', 'Raven', 'Fae', 'Cecilia', 'Soren', 'Nino', 'Boey', 'Merric', 'Klein', 'Gordin', 'Jeorge', 'Setsuna', 'Niles', 'Leon', 'Rebecca', 'Virion', 'Kagero', 'Gaius', 'Saizo', 'Jakob', 'Felicia', 'Matthew', 'Azama', 'Clarine', 'Sakura', 'Serra', 'Priscilla', 'Maria', 'Lachesis', 'Lissa', 'Wrys', 'Lucius'};
heroColor = {'R', 'B', 'G', 'C', 'R', 'R', 'B', 'B', 'G', 'G', 'C', 'C', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C'};
numberStars = [5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3];
focusCheck = {'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'};

x = 0;

focusReds = false;
focusBlues = false;
focusGreens = false;
focusColorless = false;

for index = 1 : numel(numberStars) %Totals up the number of each category on this banner
    if numberStars(index) == 5 && strcmp(focusCheck(index),'Y')
        focusCount = focusCount + 1;
    elseif numberStars(index) == 5 && strcmp(focusCheck(index),'N')
        fiveStarCount = fiveStarCount + 1;
    elseif numberStars(index) == 4
        fourStarCount = fourStarCount + 1;
    else
        threeStarCount = threeStarCount + 1;
    end
end

index = 0;

initialFocusChance = bannerFocusChance/focusCount; %calculates the initial focus, five star, four star, and three star chance
initialFiveStarChance = bannerFiveStarChance/fiveStarCount;
initialFourStarChance = bannerFourStarChance/fourStarCount;
initialThreeStarChance = bannerThreeStarChance/threeStarCount;

for index = 1 : numel(hero)
    if numberStars(index) == 5 && strcmp(focusCheck(index),'Y')
        charProb(index) = initialFocusChance;
    elseif numberStars(index) == 5 && strcmp(focusCheck(index),'N')
        charProb(index) = initialFiveStarChance;
    elseif numberStars(index) == 4
        charProb(index) = initialFourStarChance;
    else
        charProb(index) = initialThreeStarChance;
    end
            
end

% METHOD:  Five Star Color Probability Finder

%resets the sum, bayes probabilities, and total color variables
redSum = 0;
blueSum = 0;
greenSum = 0;
colorlessSum = 0;
totalColor = 0;

redFiveStarProb = 0;
blueFiveStarProb = 0;
greenFiveStarProb = 0;
colorlessFiveStarProb = 0;

for i = 1 : numel(heroColor)
    if strcmp(heroColor(i),'R')
        redSum = redSum + charProb(i);
        if numberStars(i) == 5
            redFiveStarProb = redFiveStarProb + charProb(i);
        end
    elseif strcmp(heroColor(i),'B')
        blueSum = blueSum + charProb(i);
        if numberStars(i) == 5
            blueFiveStarProb = blueFiveStarProb + charProb(i);
        end
    elseif strcmp(heroColor(i),'G')
        greenSum = greenSum + charProb(i);
        if numberStars(i) == 5
            greenFiveStarProb = greenFiveStarProb + charProb(i);
        end
    else
        colorlessSum = colorlessSum + charProb(i);
        if numberStars(i) == 5
            colorlessFiveStarProb = colorlessFiveStarProb + charProb(i);
        end
    end
    totalColor = totalColor + 1;
end

%find stone rates

redStoneRate = redSum / totalColor;
blueStoneRate = blueSum / totalColor;
greenStoneRate = greenSum / totalColor;
colorlessStoneRate = colorlessSum / totalColor;

redFiveStarBayesProb = redFiveStarProb / redStoneRate;
blueFiveStarBayesProb = blueFiveStarProb / blueStoneRate;
greenFiveStarBayesProb = greenFiveStarProb / greenStoneRate;
colorlessFiveStarBayesProb = colorlessFiveStarProb / colorlessStoneRate;

% METHOD:  Lower and Upper Bound Assignment

%assigning upper and lower bound probabilities to heroes

 for index = 1 : numel(hero)
     if index == 1
         if numberStars(index) == 5 && strcmp(focusCheck(index),'Y')
             lowerBound(index) = 0;
             upperBound(index) = initialFocusChance;
         elseif numberStars(index) == 5 && strcmp(focusCheck(index),'N')
             lowerBound(index) = 0;
             upperBound(index) = initialFiveStarChance;
         elseif numberStars(index) == 4
             lowerBound(index) = 0;
             upperBound(index) = initialFourStarChance;
         else
             lowerBound(index) = 0;
             upperBound(index) = initialThreeStarChance;
         end
          copyValue = upperBound(index);
     elseif index == 2
         lowerBound(index) = upperBound(1);
         upperBound(index) = lowerBound(index) + charProb(index);
     else
         lowerBound(index) = upperBound(index - 1);
         upperBound(index) = lowerBound(index) + charProb(index);
     end
 end

orbsAvailable = input('How many orbs will you use to summon? ');

orbConfidenceResponse = input('Would you like to calculate a five star orb confidence percentage?  Type Y if yes and N if not: ', 's');

if strcmp(orbConfidenceResponse,'Y')
orbsForAFiveStar = input('How many orbs are you willing to use to summon a five star on this banner? ');
end

fiveStarMinimumResponse = input('Would you like to calculate a five star quantity confidence percentage?  Type Y if yes and N if not: ', 's');

if strcmp(fiveStarMinimumResponse,'Y')
fiveStarsDesired = input('How many five stars are you hoping to get out of this banner? ');
end

inputIteration = input('How many different numbers of trials would you like to test? '); %ask user for number of inputs before proceeding

for i = 1 : inputIteration %enter input number of trials
     trials(i) = input('Enter the number of trials to be tested: ');
     strategy{i} = input('What strategy would you like to use? ', 's');
end

 fprintf('\n');
 
 x = 0;
 
 %creates summonable color array, to be used in later iteration
 for i = 1 : inputIteration
     if strcmp(strategy(i), 'redOnly')
         colorsToSummon{i,1} = {'R'};
     elseif strcmp(strategy(i), 'blueOnly') 
         colorsToSummon{i,1} = {'B'};
     elseif strcmp(strategy(i), 'greenOnly')
         colorsToSummon{i,1} = {'G'};
     elseif strcmp(strategy(i), 'colorlessOnly')
         colorsToSummon{i,1} = {'C'};
     elseif strcmp(strategy(i), 'summonAll')
         colorsToSummon{i,1} = {'R'};
         colorsToSummon{i,2} = {'B'};
         colorsToSummon{i,3} = {'G'};
         colorsToSummon{i,4} = {'C'};
     else
        for index = 1 : numel(heroColor)
            if numberStars(index) == 5 && strcmp(focusCheck(index),'Y')
                if strcmp(heroColor(index),'R') && focusReds == false
                    x = x + 1;
                    colorsToSummon{i,x} = {'R'};
                    focusReds = true;
                elseif strcmp(heroColor(index),'B') && focusBlues == false
                    x = x + 1;
                    colorsToSummon{i,x} = {'B'};
                    focusBlues = true;
                elseif strcmp(heroColor(index),'G') && focusGreens == false
                    x = x + 1;
                    colorsToSummon{i,x} = {'G'};
                    focusGreens = true;
                elseif strcmp(heroColor(index),'C') && focusColorless == false
                    x = x + 1;
                    colorsToSummon{i,x} = {'C'};
                    focusColorless = true;
                end
            end
        end
     end
 end
 
% THE MAIN BODY OF CODE
 for i = 1 : inputIteration %runs through all simulations by their index
     orbsUsed = 0; %refresh all of our variables and set them equal to zero
     for j = 1 : trials(i) %runs through all individual trials indicated by the index
    %initializes the while loop before it happens
    %need to have hasHero as false and orbs at 0
    hasHero = false;
    rateReset = true;
    totalSummoned = 0;
    batchSummon = 0;
    orbsUsed = 0;
    sum = 0;
    fiveStarTotBelowAvg = 0;
    totBelowAvg = 0;
    fiveStarsSummoned(j) = 0;
    allFiveStarsSummoned = 0;
    N = 0;
    n = 0;
    tot = 0;
    totalOrbsForOneFiveStar = 0;
    setsWithoutFiveStar = 0;
    totalFiveStars = 0;
    
    %creates the while loop, playing the game until conditions are met
while orbsAvailable >= orbsUsed
    roundSummon = 0;
    summonable = 0;
    
    
    %RATE RESET METHOD
if rateReset == true
    
    %rateReset will only occur at start of the program and when user is
    %pity broken.  So, we set the number of sets without a five star to 0
    setsWithoutFiveStar = 0;
    
    %assigns individual probabilities based upon computations, reuse old
    %chances
    for index = 1 : numel(hero)
        if numberStars(index) == 5 && strcmp(focusCheck(index),'Y')
            charProb(index) = initialFocusChance;
        elseif numberStars(index) == 5 && strcmp(focusCheck(index),'N')
            charProb(index) = initialFiveStarChance;
        elseif numberStars(index) == 4 && strcmp(focusCheck(index),'N')
            charProb(index) = initialFourStarChance;
        else
            charProb(index) = initialThreeStarChance;
        end

    end

    %assigns lower and upper bound probabilities based upon stars
     for index = 1 : numel(hero)
         if index == 1
             if numberStars(index) == 5 && strcmp(focusCheck(index),'Y')
                 lowerBound(index) = 0;
                 upperBound(index) = initialFocusChance;
             elseif numberStars(index) == 5 && strcmp(focusCheck(index),'N')
                 lowerBound(index) = 0;
                 upperBound(index) = initialFiveStarChance;
             elseif numberStars(index) == 4
                 lowerBound(index) = 0;
                 upperBound(index) = initialFourStarChance;
             else
                 lowerBound(index) = 0;
                 upperBound(index) = initialThreeStarChance;
             end
              copyValue = upperBound(index);
         elseif index == 2
             lowerBound(index) = upperBound(1);
             upperBound(index) = lowerBound(index) + charProb(index);
         else
             lowerBound(index) = upperBound(index - 1);
             upperBound(index) = lowerBound(index) + charProb(index);
         end
     end

     rateReset = false;
         
end

%sets banner rates according to the number of sets without pulling a five
%star
bannerFocusChance = 0.08 + (0.005 * setsWithoutFiveStar);
bannerFiveStarChance = 0;
bannerFourStarChance = 0.58 - (0.0019 * setsWithoutFiveStar);
bannerThreeStarChance = 0.34 - (0.0031 * setsWithoutFiveStar);

%finds new chances for each block of characters
newFocusChance = bannerFocusChance/focusCount;
newFiveStarChance = bannerFiveStarChance/fiveStarCount;
newFourStarChance = bannerFourStarChance/fourStarCount;
newThreeStarChance = bannerThreeStarChance/threeStarCount;

%reassigns character probabilities
for index = 1 : numel(hero)
    if numberStars(index) == 5 && strcmp(focusCheck(index),'Y')
        charProb(index) = newFocusChance;
    elseif numberStars(index) == 5 && strcmp(focusCheck(index),'N')
        charProb(index) = newFiveStarChance;
    elseif numberStars(index) == 4
        charProb(index) = newFourStarChance;
    else
        charProb(index) = newThreeStarChance;
    end
    
end

%creates lower and upper bounds with reassigned probabilities
for index = 1 : numel(hero)
    if index == 1
      if numberStars(index) == 5 && strcmp(focusCheck(index),'Y')
         lowerBound(index) = 0;
         upperBound(index) = newFocusChance;
      elseif numberStars(index) == 5 && strcmp(focusCheck(index),'N')
          lowerBound(index) = 0;
          upperBound(index) = newFiveStarChance;
      elseif numberStars(index) == 4
         lowerBound(index) = 0;
         upperBound(index) = newFocusChance;
      else
         lowerBound(index) = 0;
         upperBound(index) = newFocusChance;
      end
          copyValue = upperBound(index);
     elseif index == 2
         lowerBound(index) = upperBound(1);
         upperBound(index) = lowerBound(index) + charProb(index);
     else
         lowerBound(index) = upperBound(index - 1);
         upperBound(index) = lowerBound(index) + charProb(index);
     end
end

 
% HERO SELECTION METHOD

 %select the heroes to be summoned
 for stoneNumber = 1 : 5
      heroProb = rand;
      for index = 1 : numel(upperBound)
          if heroProb < upperBound(index) && heroProb > lowerBound(index)
              stoneHeroes(stoneNumber) = hero(index);
              heroIndices(stoneNumber) = index;
          end
      end
      if strcmp(heroColor(heroIndices(stoneNumber)),'R')
              stoneColor(stoneNumber) = 'R';
      elseif strcmp(heroColor(heroIndices(stoneNumber)),'B')
              stoneColor(stoneNumber) = 'B';
      elseif strcmp(heroColor(heroIndices(stoneNumber)),'G')
              stoneColor(stoneNumber) = 'G';
      else
              stoneColor(stoneNumber) = 'C';
 
      end
 end
 
 %set all summon indices to be false (our boolean array)
 for summonIndex = 1 : 5
     summon(summonIndex) = false;
 end

 %count of number of summonable orbs of color of hero we desire
 for stoneNumber = 1 : 5
     if i == 1 && numel(colorsToSummon) == 1
         if strcmp(colorsToSummon,stoneColor(stoneNumber))
            summon(stoneNumber) = true;
            summonable = summonable + 1;
         end
     elseif i == 1 && numel(colorsToSummon) > 1
         for summonableColorsIndex = 1 : numel(colorsToSummon)
             if strcmp(colorsToSummon(summonableColorsIndex),stoneColor(stoneNumber))
                 summon(stoneNumber) = true;
                 summonable = summonable + 1;
             end
         end
     elseif i > 1 && numel(colorsToSummon) == 1
         if strcmp(colorsToSummon(i),stoneColor(stoneNumber))
            summon(stoneNumber) = true;
            summonable = summonable + 1;
         end
     elseif i > 1 && numel(colorsToSummon) > 1
         forLoopCount = numel(colorsToSummon(i));
         for summonableColorsIndex = 1 : numel(colorsToSummon(i))
             if strcmp(colorsToSummon(i,summonableColorsIndex),stoneColor(stoneNumber))
                 summon(stoneNumber) = true;
                 summonable = summonable + 1;
             end
         end
     end
 end

 %if the number of orbs that we desire is greater than 0, summon as normal
 roundSummon = 0;
 if orbsUsed <= orbsAvailable
 for stone = 1 : 5
     if (summonable > 0) && (summon(stone) == true)
         if (totalSummoned == 0) && (roundSummon == 0) && (orbsUsed <= orbsAvailable)
             orbsUsed = 0;
             totalSummoned = totalSummoned + 1;
             roundSummon = roundSummon + 1;
             heroIndexSummoned = heroIndices(stone);
                  if numberStars(heroIndexSummoned) == 5
                      fiveStarsSummoned(j) = fiveStarsSummoned(j) + 1;
                      allFiveStarsSummoned = allFiveStarsSummoned + 1;
                      arr(i,j) = fiveStarsSummoned(j);
                      if fiveStarsSummoned(j) == 1
                          orbsForOneFiveStar(i,j) = orbsUsed;
                      end
                      rateReset = true;
                  end
                 fprintf('A free summon has occurred\n');
         elseif (roundSummon == 0) && (totalSummoned > 0) && (orbsUsed + 5 <= orbsAvailable) && summon(stone) == true
             orbsUsed = orbsUsed + 5;
             totalSummoned = totalSummoned + 1;
             roundSummon = roundSummon + 1; 
             heroIndexSummoned = heroIndices(stone);
                  if numberStars(heroIndexSummoned) == 5
                      fiveStarsSummoned(j) = fiveStarsSummoned(j) + 1;
                      allFiveStarsSummoned = allFiveStarsSummoned + 1;
                      arr(i,j) = fiveStarsSummoned(j);
                                            if fiveStarsSummoned(j) == 1
                          orbsForOneFiveStar(i,j) = orbsUsed;
                      end
                      rateReset = true;
                  end
            fprintf('A new batch summon has occurred\n');
         elseif roundSummon == 1 && (orbsUsed + 4 <= orbsAvailable) && summon(stone) == true
             orbsUsed = orbsUsed + 4;
             totalSummoned = totalSummoned + 1;
             roundSummon = roundSummon + 1;
             heroIndexSummoned = heroIndices(stone);
                  if numberStars(heroIndexSummoned) == 5
                      allFiveStarsSummoned = allFiveStarsSummoned + 1;
                      fiveStarsSummoned(j) = fiveStarsSummoned(j) + 1;
                      arr(i,j) = fiveStarsSummoned(j);
                                            if fiveStarsSummoned(j) == 1
                          orbsForOneFiveStar(i,j) = orbsUsed;
                      end
                      rateReset = true;
                  end
         fprintf('A second summon in a batch has occurred\n');
         elseif roundSummon == 2 && (orbsUsed + 4 <= orbsAvailable) && summon(stone) == true
             orbsUsed = orbsUsed + 4;
             totalSummoned = totalSummoned + 1;
             roundSummon = roundSummon + 1; 
                      heroIndexSummoned = heroIndices(stone);
                  if numberStars(heroIndexSummoned) == 5
                      allFiveStarsSummoned = allFiveStarsSummoned + 1;
                      fiveStarsSummoned(j) = fiveStarsSummoned(j) + 1;
                      arr(i,j) = fiveStarsSummoned(j);
                      if fiveStarsSummoned(j) == 1
                          orbsForOneFiveStar(i,j) = orbsUsed;
                      end
                      rateReset = true;
                  end
                 fprintf('A third summon in a batch has occurred\n');
         elseif roundSummon == 3 && (orbsUsed + 4 <= orbsAvailable) && summon(stone) == true
             orbsUsed = orbsUsed + 4;
             totalSummoned = totalSummoned + 1;
             roundSummon = roundSummon + 1;
                             heroIndexSummoned = heroIndices(stone);
                  if numberStars(heroIndexSummoned) == 5
                      fiveStarsSummoned(j) = fiveStarsSummoned(j) + 1;
                      allFiveStarsSummoned = allFiveStarsSummoned + 1;
                      arr(i,j) = fiveStarsSummoned(j);
                      if fiveStarsSummoned(j) == 1
                          orbsForOneFiveStar(i,j) = orbsUsed;
                      end
                      rateReset = true;
                  end
                 fprintf('A fourth summon in a batch has occurred\n');
         elseif roundSummon == 4 && (orbsUsed + 3 <= orbsAvailable) && summon(stone) == true
             orbsUsed = orbsUsed + 3;
             totalSummoned = totalSummoned + 1;
             roundSummon = roundSummon + 1;
                heroIndexSummoned = heroIndices(stone);
                  if numberStars(heroIndexSummoned) == 5
                      fiveStarsSummoned(j) = fiveStarsSummoned(j) + 1;
                      allFiveStarsSummoned = allFiveStarsSummoned + 1;
                      arr(i,j) = fiveStarsSummoned(j);
                      if fiveStarsSummoned(j) == 1
                          orbsForOneFiveStar(i,j) = orbsUsed;
                      end
                      rateReset = true;
                  end
          fprintf('A fifth summon in a batch has occurred\n');
         end
     elseif summonable == 0 && (orbsUsed <= orbsAvailable)
     randomSummon = rand;
         if randomSummon <= 0.2
             randomSummonIndex = 1;
         elseif randomSummon <= 0.4
             randomSummonIndex = 2;
         elseif randomSummon <= 0.6
             randomSummonIndex = 3;
         elseif randomSummon <= 0.8
             randomSummonIndex = 4;
         else
             randomSummonIndex = 5;
         end
         
         if totalSummoned > 0 && (orbsUsed + 5 <= orbsAvailable)
             orbsUsed = orbsUsed + 5;
             totalSummoned = totalSummoned + 1;
             roundSummon = roundSummon + 1;
             heroIndexSummoned = heroIndices(randomSummonIndex);
               if numberStars(heroIndexSummoned) == 5
                  fiveStarsSummoned(j) = fiveStarsSummoned(j) + 1;
                  allFiveStarsSummoned = allFiveStarsSummoned + 1;
                  arr(i,j) = fiveStarsSummoned(j);
                    if fiveStarsSummoned(j) == 1
                          orbsForOneFiveStar(i,j) = orbsUsed;
                       end
                      rateReset = true;
               end
%               fprintf('A new batch non-target summon has occurred\n');
         elseif totalSummoned == 0 && (orbsUsed <= orbsAvailable)
             orbsUsed = 0;
             totalSummoned = totalSummoned + 1;
             roundSummon = roundSummon + 1;
             heroIndexSummoned = heroIndices(randomSummonIndex);
               if numberStars(heroIndexSummoned) == 5
                  fiveStarsSummoned(j) = fiveStarsSummoned(j) + 1;
                  allFiveStarsSummoned = allFiveStarsSummoned + 1;
                  arr(i,j) = fiveStarsSummoned(j);
                    if fiveStarsSummoned(j) == 1
                          orbsForOneFiveStar(i,j) = orbsUsed;
                      end
                      rateReset = true;
               end
%               fprintf('A non-target free summon has occurred\n');
         end
     end
 end
 end
 
if orbsUsed + 5 > orbsAvailable
     break;
 end
 
 %computes the number of sets without a five star
 batchSummon = batchSummon + roundSummon;
 if batchSummon >= 5
    setsWithoutFiveStar = setsWithoutFiveStar + 1;
    batchSummon = batchSummon - 5;
 end
end
if allFiveStarsSummoned == 0
  fiveStarsSummoned(j) = 0;
  arr(i,j) = fiveStarsSummoned(j);
end

end
     for j = 1 : trials(i) %sums up all values for an average
         sum = arr(i,j) + sum;
         N = N + 1;
     end
     
     if strcmp(orbConfidenceResponse,'Y')
         for j = 1 : trials(i)
             if orbsForOneFiveStar(i,j) <= orbsForAFiveStar
                 totBelowAvg = totBelowAvg + 1;
             end
         end
     end
     
     chanceBelowAvg = (totBelowAvg / N ) * 100;
     
     if strcmp(fiveStarMinimumResponse,'Y')
         for j = 1 : trials(i)
             if arr(i,j) <= fiveStarsDesired
                 fiveStarTotBelowAvg = fiveStarTotBelowAvg + 1;
             end
         end
     end
     
     fiveStarChanceBelowAvg = (fiveStarTotBelowAvg / N) * 100;
     
     if strcmp(strategy{i},'redOnly') == false && strcmp(strategy{i},'blueOnly') == false && strcmp(strategy{i},'greenOnly') == false && strcmp(strategy{i},'colorlessOnly') == false && strcmp(strategy{i},'summonAll') == false
         strategy{i} = 'summonAllFocus';
     end
     
     fprintf('Using strategy %s...\n', strategy{i});
     
         avg = sum / N; %computes average and prints results
         fprintf('Average number of five stars according to trial %i is %0.4f\n', i, avg)
         
         
      if strcmp(orbConfidenceResponse,'Y')
         
         fprintf('You can be %0.2f percent confident that if you use %i orbs that you will get at least one five star\n', chanceBelowAvg, orbsForAFiveStar);
         
      end
     
      if strcmp(fiveStarMinimumResponse,'Y')
         
         fprintf('You can be %0.2f percent confident that you will get at least %i five star characters.\n', fiveStarChanceBelowAvg, fiveStarsDesired);
         
     end
             
     for j = 1 : trials(i) %checks for the maximum value in the arrray
         if j == 1 %sets the first value as maximum if there's nothing else to compare to
             max = arr(i,j);
         elseif max < arr(i,j)
             max = arr(i,j);
         end
     end
         fprintf('Maximum five stars for trial %i is %i\n', i, max);
     for j = 1 : trials(i) %does the same thing as the maximum for loop, but with a greater than sign
         if  j == 1
             min = arr(i,j);
         elseif min > arr(i,j)
             min = arr(i,j);
         end
     end
     fprintf('Minimum five stars for trial %i is %i\n', i, min);
     for j = 1 : trials(i) %calculates standard deviation for the sample
         tot = ((arr(i,j) - avg)^2) + tot;
         n = n + 1;
     end
     stdDev = sqrt(tot/(n-1));
     fprintf('Standard Deviation for trial %i is %0.4f\n', i, stdDev);
     
     if orbsAvailable > 100
     
      for j = 1 : trials(i)
         totalOrbsForOneFiveStar = totalOrbsForOneFiveStar + orbsForOneFiveStar(i,j);
      end
        
     avgOrbsForOneFiveStar = (totalOrbsForOneFiveStar / N) + 5;
     
     fprintf('Average number of orbs for one five star is %0.4f\n', avgOrbsForOneFiveStar);

     end
     
     for j = 1 : trials(i)
         L(j) = arr(i,j);
     end
     
     plotDim2 = sqrt(inputIteration);
     if mod(floor(plotDim2), plotDim2) > 0
         plotDim2 = floor(sqrt(inputIteration)) + 1;
     end
     
     plotDim1 = inputIteration; %Arranges the subplots
     if plotDim1 > (plotDim2 ^ 2) * (plotDim2 - 1)/plotDim2
         plotDim1 = plotDim2;
     else
         plotDim1 = plotDim2 - 1;
     end
     
     subplot(plotDim1, plotDim2,i);
     graph = histfit(L,[],'poisson');
     xlabel('Number of Five Stars Summoned');
     ylabel('Frequency');
     title(['Trial ' num2str(i) ' Results']);
     
     pd = fitdist(L(j),'poisson');
     lambda = pd.lambda;
     
     [l,lci]= poissfit(arr(i));
     fprintf('Lambda point estimate of the Poisson distribution is %0.4f\n', l);
     for x = 1 : 2
         if x == 1
             fprintf('Lower 95 percent Confidence Interval bound is %0.4f\n',lci(x));
         elseif x == 2
             fprintf('Upper 95 percent Confidence Interval bound is %0.4f\n',lci(x));
         end
     end
     
     fprintf('Fit Poisson distribution lambda parameter is %i\n',lambda);
     
     fprintf('\n');
     
 end