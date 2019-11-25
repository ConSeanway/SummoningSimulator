% Sean Conway
% Fire Emblem Heroes Summoning Simulator (Target Hero)
% Use simulation to find the average number of orbs it will take to summon
% a certain five star hero

clc;
clear all;
close all;

bannerFocusChance = 0.03;
bannerFiveStarChance = 0.03;
bannerFourStarChance = 0.58;
bannerThreeStarChance = 0.36;

focusCount = 0;
fiveStarCount = 0;
fourStarCount = 0;
threeStarCount = 0;

%setting the initial arrays up, with heroes, colors, and number of stars
hero = {'STiki', 'SCamilla', 'STakumi', 'SLinde', 'Ike', 'Ayra', 'Alm', 'Ares', 'Elincia', 'Eldigan', 'Karla', 'Karel', 'KChrom', 'Gray', 'Sigurd', 'Siegbert', 'Saber', 'Zelgius', 'Soleil', 'TReinhardt', 'Ryoma', 'Lyn', 'Leif', 'Lene', 'Lucina', 'Luke', 'Mia', 'BRoy', 'FCelica', 'YTiki', 'SMEirika', 'Katarina', 'Sanaki', 'Celica', 'MMorgan', 'Leo', 'Azura', 'Ephraim', 'Shigure', 'Shiro', 'Tana', 'Nephenee', 'Hinoka', 'Hardin', 'BLucina', 'Ninian', 'Ishtar', 'Olwen', 'Tailtiu', 'Delthea', 'FMorgan', 'Micaiah', 'LArachel', 'Linde', 'Lute', 'Amelia', 'Dorcas', 'Hector', 'Minerva', 'BIke', 'Kana', 'Myrrh', 'Grima', 'WTOlwen', 'Rhajat', 'Sonya', 'Dierdre', 'FNino', 'Julia', 'Faye', 'Takumi', 'Hanoka', 'Innes', 'BLyn', 'Sothe', 'Jaffar', 'Legault', 'Elise', 'Genny', 'Nanna', 'Mist', 'Athena', 'Ares', 'Eirika', 'Eliwood', 'Ogma', 'Olivia', 'Cain', 'Hana', 'MCorrin', 'Chrom', 'Caeda', 'Seliph', 'Seth', 'Soleil', 'Stahl', 'Draug', 'Palla', 'Hinata', 'Fir', 'Marth', 'Laslow', 'Selena', 'Roy', 'Lonqu', 'ATiki', 'Tharja', 'Sophia', 'Henry', 'MMorgan', 'Lilina', 'Raigh', 'Abel', 'Gwendolyn', 'Est', 'Effie', 'Oscar', 'Oboro', 'Catria', 'Clair', 'Shigure', 'Shanna', 'Jagen', 'Sully', 'Subaki', 'Cordelia', 'Donnel', 'Peri', 'Florina', 'Mathilda', 'Lukas', 'Roderick', 'FCorrin', 'Nowi', 'Odin', 'Tailtiu', 'Mae', 'Reinhardt', 'LArachel', 'MRobin', 'Camilla', 'Gunter', 'Sheena', 'Cherche', 'Titania', 'Arthur', 'Bartre', 'Barst', 'Frederick', 'Beruka', 'Hawkeye', 'Raven', 'Fae', 'Cecilia', 'Soren', 'Nino', 'Boey', 'Merric', 'Klein', 'Gordin', 'Jeorge', 'Setsuna', 'Niles', 'Leon', 'Rebecca', 'Virion', 'Kagero', 'Gaius', 'Saizo', 'Sothe', 'Jakob', 'Kaze', 'Felicia', 'Matthew', 'Legault', 'Azama', 'Clarine', 'Sakura', 'Serra', 'Nanna', 'Priscilla', 'Maria', 'Lachesis', 'Lissa', 'Wrys', 'Lucius', 'Athena', 'Eirika', 'Eliwood', 'Ogma', 'Olivia', 'Cain', 'Hana', 'MCorrin', 'Chrom', 'Caeda', 'Seliph', 'Seth', 'Stahl', 'Draug', 'Palla', 'Hinata', 'Fir', 'Marth', 'Laslow', 'Selena', 'Roy', 'Lonqu', 'ATiki', 'Tharja', 'Sophia', 'Henry', 'Lilina', 'Raigh', 'Abel', 'Gwendolyn', 'Est', 'Effie', 'Oscar', 'Oboro', 'Catria', 'Clair', 'Shanna', 'Jagen', 'Sully', 'Subaki', 'Cordelia', 'Donnel', 'Peri', 'Florina', 'Mathilda', 'Lukas', 'Roderick', 'FCorrin', 'Nowi', 'Odin', 'Mae', 'Reinhardt', 'MRobin', 'Camilla', 'Gunter', 'Sheena', 'Cherche', 'Titania', 'Arthur', 'Bartre', 'Barst', 'Frederick', 'Beruka', 'Hawkeye', 'Raven', 'Fae', 'Cecilia', 'Soren', 'Nino', 'Boey', 'Merric', 'Klein', 'Gordin', 'Jeorge', 'Setsuna', 'Niles', 'Leon', 'Rebecca', 'Virion', 'Kagero', 'Gaius', 'Saizo', 'Jakob', 'Kaze', 'Felicia', 'Matthew', 'Azama', 'Clarine', 'Sakura', 'Serra', 'Priscilla', 'Maria', 'Lachesis', 'Lissa', 'Wrys', 'Lucius'};
heroColor = {'R', 'B', 'C', 'C', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'R', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'B', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'G', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C'};
numberStars = [5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3];
focusCheck = {'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'};

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
     elseif index == 2
         lowerBound(index) = upperBound(1);
         upperBound(index) = lowerBound(index) + charProb(index);
     else
         lowerBound(index) = upperBound(index - 1);
         upperBound(index) = lowerBound(index) + charProb(index);
     end
 end

targetHero = input('Which hero do you want to summon for? ', 's');

for i = 1 : numel(hero)
    if strcmp(targetHero,hero(i))
        targetIndex = i;
    end
end

orbConfidenceResponse = input('Would you like to calculate an orb confidence percentage?  Type Y if yes and N if not: ', 's');

if strcmp(orbConfidenceResponse,'Y')
orbsAvailable = input('How many orbs are you willing to use to summon this hero? ');
end

inputIteration = input('How many different numbers of trials would you like to test? '); %ask user for number of inputs before proceeding

for i = 1 : inputIteration %enter input number of trials
     trials(i) = input('Enter the number of trials to be tested: ');
end

 fprintf('\n');

 for i = 1 : inputIteration %runs through all simulations by their index
     orbs = 0; %refresh all of our variables and set them equal to zero
     totPityBreaks = 0;
     for j = 1 : trials(i) %runs through all individual trials indicated by the index
    %initializes the while loop before it happens
    %need to have hasHero as false and orbs at 0
    hasHero = false;
    rateReset = true;
    totBelowAvg = 0;
    totalSummoned = 0;
    batchSummon = 0;
    orbs = 0;
    sum = 0;
    pityBreak(j) = 0;
    N = 0;
    n = 0;
    tot = 0;
    setsWithoutFiveStar = 0;
    
    %creates the while loop, playing the game until conditions are met
while hasHero == false
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
        elseif numberStars(index) == 4
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
             elseif numberStrs(index) == 5 && strcmp(focusCheck(index),'N')
                 lowerBound(index) = 0;
                 upperBound(index) = initialFiveStarChance;
             elseif numberStars(index) == 4
                 lowerBound(index) = 0;
                 upperBound(index) = initialFourStarChance;
             else
                 lowerBound(index) = 0;
                 upperBound(index) = initialThreeStarChance;
             end
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
bannerFocusChance = 0.03 + (0.0025 * setsWithoutFiveStar);
bannerFiveStarChance = 0.03 + (0.0025 * setsWithoutFiveStar);
bannerFourStarChance = 0.58 - (0.0019 * setsWithoutFiveStar);
bannerThreeStarChance = 0.36 - (0.0031 * setsWithoutFiveStar);

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
 for stoneNumber = 1 : 5
     summon(stoneNumber) = false;
 end

 %count of number of summonable orbs of color of hero we desire
 for stoneNumber = 1 : 5
     cellData = cellstr(heroColor(targetIndex));
     if strcmp(cellData, stoneColor(stoneNumber))
         summonable = summonable + 1;
         summon(stoneNumber) = true;
     end
 end

 %if the number of orbs that we desire is greater than 0, summon as normal
 if summonable > 0 && hasHero == false
 for stone = 1 : 5
     if summon(stone) == true
         if totalSummoned == 0 && roundSummon == 0 && hasHero == false
             orbs = 0;
             summon(stone) = true;
             totalSummoned = totalSummoned + 1;
             roundSummon = roundSummon + 1;
              if strcmp(hero(heroIndices(stone)),hero(targetIndex)) && numberStars(heroIndices(stone)) == 5
                  hasHero = true;
                  arr(i,j) = orbs;
                  rateReset = true;
              elseif numberStars(heroIndices(stone)) == 5 && strcmp(hero(heroIndices(stone)),hero(targetIndex)) == false
                  pityBreak(j) = pityBreak(j) + 1;
                  rateReset = true;
              end
             
         elseif roundSummon == 0 && totalSummoned > 0 && hasHero == false
             orbs = orbs + 5;
             summon(stone) = true;
             totalSummoned = totalSummoned + 1;
             roundSummon = roundSummon + 1;
              if strcmp(hero(heroIndices(stone)),hero(targetIndex)) && numberStars(heroIndices(stone)) == 5
                  hasHero = true;
                  arr(i,j) = orbs;
                  rateReset = true;
              elseif numberStars(heroIndices(stone)) == 5 && strcmp(hero(heroIndices(stone)),hero(targetIndex)) == false
                  pityBreak(j) = pityBreak(j) + 1;
                  rateReset = true;
              end
             
         elseif roundSummon == 1 && hasHero == false
             orbs = orbs + 4;
             summon(stone) = true;
             totalSummoned = totalSummoned + 1;
             roundSummon = roundSummon + 1;              
              if strcmp(hero(heroIndices(stone)),hero(targetIndex)) && numberStars(heroIndices(stone)) == 5
                  hasHero = true;
                  arr(i,j) = orbs;
                  rateReset = true;
              elseif numberStars(heroIndices(stone)) == 5 && strcmp(hero(heroIndices(stone)),hero(targetIndex)) == false
                  pityBreak(j) = pityBreak(j) + 1;
                  rateReset = true;
              end  
             
         elseif roundSummon == 2 && hasHero == false
             orbs = orbs + 4;
             summon(stone) = true;
             totalSummoned = totalSummoned + 1;
             roundSummon = roundSummon + 1;
              if strcmp(hero(heroIndices(stone)),hero(targetIndex)) && numberStars(heroIndices(stone)) == 5
                  hasHero = true;
                  arr(i,j) = orbs;
                  rateReset = true;
              elseif numberStars(heroIndices(stone)) == 5 && strcmp(hero(heroIndices(stone)),hero(targetIndex)) == false
                  pityBreak(j) = pityBreak(j) + 1;
                  rateReset = true;
              end

         elseif roundSummon == 3 && hasHero == false
             orbs = orbs + 4;
             summon(stone) = true;
             totalSummoned = totalSummoned + 1;
             roundSummon = roundSummon + 1; 
              if strcmp(hero(heroIndices(stone)),hero(targetIndex)) && numberStars(heroIndices(stone)) == 5
                  hasHero = true;
                  arr(i,j) = orbs;
                  rateReset = true;
              elseif numberStars(heroIndices(stone)) == 5 && strcmp(hero(heroIndices(stone)),hero(targetIndex)) == false
                  pityBreak(j) = pityBreak(j) + 1;
                  rateReset = true;
              end

         elseif roundSummon == 4 && hasHero == false
             orbs = orbs + 3;
             summon(stone) = true;
             totalSummoned = totalSummoned + 1;
             roundSummon = roundSummon + 1;  
              if strcmp(hero(heroIndices(stone)),hero(targetIndex)) && numberStars(heroIndices(stone)) == 5
                  hasHero = true;
                  arr(i,j) = orbs;
                  rateReset = true;
              elseif numberStars(heroIndices(stone)) == 5 && strcmp(hero(heroIndices(stone)),hero(targetIndex)) == false
                  pityBreak(j) = pityBreak(j) + 1;
                  rateReset = true;
              end
         end 
     end
 end
 
 %but if the number of summonable stones is 0, summon on a random stone
 elseif summonable == 0 && hasHero == false
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
         
         if totalSummoned > 0 && hasHero == false
             orbs = orbs + 5;
             summon(randomSummonIndex) = true;
             roundSummon = roundSummon + 1;
             totalSummoned = totalSummoned + 1;
              if strcmp(hero(heroIndices(randomSummonIndex)),hero(targetIndex)) && numberStars(heroIndices(randomSummonIndex)) == 5
                  hasHero = true;
                  arr(i,j) = orbs;
                  rateReset = true;
              elseif numberStars(heroIndices(randomSummonIndex)) == 5 && strcmp(hero(heroIndices(randomSummonIndex)),hero(targetIndex)) == false
                  pityBreak(j) = pityBreak(j) + 1;
                  rateReset = true;
              end

         elseif totalSummoned == 0 && hasHero == false
             orbs = 0;
             summon(randomSummonIndex) = true;
             roundSummon = roundSummon + 1;
             totalSummoned = totalSummoned + 1;
              if strcmp(hero(heroIndices(randomSummonIndex)),hero(targetIndex)) && numberStars(heroIndexSummoned) == 5
                  hasHero = true;
                  arr(i,j) = orbs;
                  rateReset = true;
              elseif numberStars(heroIndices(randomSummonIndex)) == 5 && strcmp(hero(heroIndices(randomSummonIndex)),hero(targetIndex)) == false
                  pityBreak(j) = pityBreak(j) + 1;
                  rateReset = true;
              end
         end
 end
 
 %computes the number of sets without a five star
 batchSummon = batchSummon + roundSummon;
 if batchSummon >= 5
    setsWithoutFiveStar = setsWithoutFiveStar + 1;
    batchSummon = batchSummon - 5;
 end
end
end
     for j = 1 : trials(i) %sums up all values for an average
         sum = arr(i,j) + sum;
         N = N + 1;
         totPityBreaks = pityBreak(j) + totPityBreaks;
     end
         avg = sum / N; %computes average and prints results
         avgPityBreak = totPityBreaks / N;
         
     if strcmp(orbConfidenceResponse,'Y')
         for j = 1 : trials(i)
             if arr(i,j) <= orbsAvailable
                 totBelowAvg = totBelowAvg + 1;
             end
         end
     end
         
         chanceBelowAvg = (totBelowAvg / N ) * 100;
         
         fprintf('Average orbs required according to trial %i is %.2f\n', i, avg);
         
         if strcmp(orbConfidenceResponse,'Y')
         
         fprintf('You can be %0.2f percent confident that if you use %i orbs that you will get your target\n', chanceBelowAvg, orbsAvailable);
         
         end
         
         fprintf('Average number of pity breaks is %0.4f\n', avgPityBreak)
     for j = 1 : trials(i) %checks for the maximum value in the arrray
         if j == 1 %sets the first value as maximum if there's nothing else to compare to
             max = arr(i,j);
         elseif max < arr(i,j)
             max = arr(i,j);
         end
     end
         fprintf('Maximum orbs needed to summon character for trial %i is %i\n', i, max);
     for j = 1 : trials(i) %does the same thing as the maximum for loop, but with a greater than sign
         if  j == 1
             min = arr(i,j);
         elseif min > arr(i,j)
             min = arr(i,j);
         end
     end
     fprintf('Minimum orbs needed to summon character for trial %i is %i\n', i, min);
     for j = 1 : trials(i) %calculates standard deviation for the sample
         tot = ((arr(i,j) - avg)^2) + tot;
         n = n + 1;
     end
     stdDev = sqrt(tot/(n-1));
     fprintf('Standard Deviation for trial %i is %0.4f\n', i, stdDev);
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
     graph = histfit(L,[],'exponential');  
     xlabel('Orbs Required');
     ylabel('Frequency');
     title(['Trial ' num2str(i) ' Results']);
     
     pd = fitdist(L(j),'exponential');
     mu = pd.mu;
     
     [muhat,muci]= expfit(arr(i));
     fprintf('Mu point estimate of the distribution is %i\n', muhat);
     for x = 1 : 2
         if x == 1
             fprintf('Lower 95 percent Confidence Interval bound is %0.4f\n',muci(x));
         elseif x == 2
             fprintf('Upper 95 percent Confidence Interval bound is %0.4f\n',muci(x));
         end
     end
     
     fprintf('Fit Exponential distribution mu parameter is %i\n',mu);
     
     fprintf('\n');
     
 end