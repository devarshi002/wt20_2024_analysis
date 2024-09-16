# Import necessary libraries
import pandas as pd
import matplotlib.pyplot as plt


# Load the dataset
file_path = 'matches.csv'  # Update with your actual file path
matches_df = pd.read_csv("matches.csv")

# Define a color palette with 16 different colors
colors = ['#ff9999', '#66b3ff', '#99ff99', '#ffcc99', '#ffb3e6', '#c2c2f0', '#ff6666', 
          '#c4e17f', '#76d7c4', '#f7cac9', '#f7786b', '#ffeb3b', '#29b6f6', 
          '#ab47bc', '#26a69a', '#ff7043']

#---------------------------- 1. Top Teams with the Most Wins--------------------------------------#

team_wins = matches_df['winner'].value_counts()
print("Top 5 Teams with the Most Wins:")
print(team_wins)
plt.figure(figsize=(10,6))
team_wins.plot(kind='bar', color=colors[:16])
plt.title('Top 5 Teams with the Most Wins')
plt.xlabel('Teams')
plt.ylabel('Number of Wins')
plt.xticks(rotation=45, ha='right')
plt.tight_layout()
plt.show()




#------------------------------------------ 2. Number of Matches Each Season -----------------------------------#

matches_per_season = matches_df['season'].value_counts()
print("Number of Matches Each Season:")
print(matches_per_season)
plt.figure(figsize=(10,6))
matches_per_season.plot(kind='bar', color=colors[:len(matches_per_season)])
plt.title('Number of Matches Each Season')
plt.xlabel('Season')
plt.ylabel('Number of Matches')
plt.xticks(rotation=45, ha='right')
plt.tight_layout()
plt.show()


#------------------------------------------------- 3. Team Toss Decisions (Bat vs. Field) ------------------------#

toss_decisions = matches_df.groupby('toss_decision').size()
print("Toss Decisions (Bat vs. Field):")
print(toss_decisions)
plt.figure(figsize=(6,6))
toss_decisions.plot(kind='pie', autopct='%1.1f%%', startangle=90, colors=colors[:2])
plt.title('Toss Decisions (Bat vs. Field)')
plt.ylabel('')
plt.tight_layout()
plt.show()


#------------------------------------------------ 4. Most 'Player of the Match' Awards ---------------------------------------#

player_of_match_awards = matches_df['player_of_match'].value_counts()
print("Top 5 Players with Most 'Player of the Match' Awards:")
print(player_of_match_awards)
plt.figure(figsize=(10,6))
player_of_match_awards.plot(kind='bar', color= "purple")
plt.title('Top 5 Players with Most "Player of the Match" Awards')
plt.xlabel('Players')
plt.ylabel('Number of Awards')
plt.xticks(rotation=45, ha='right')
plt.tight_layout()
plt.show()

#-------------------------------------------------5. Matches Played at Each Venue --------------------------------------#

matches_per_venue = matches_df['venue'].value_counts().head(10)  # Top 10 venues for better clarity
print("Matches Played at Each Venue:")
print(matches_per_venue)
plt.figure(figsize=(12,6))
matches_per_venue.plot(kind='bar', color = colors[0:10])
plt.title('Matches Played at Top 10 Venues')
plt.xlabel('Venues')
plt.ylabel('Number of Matches')
plt.xticks(rotation=45, ha='right')
plt.tight_layout()
plt.show()
