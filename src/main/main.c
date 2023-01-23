/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: zyunusov <zyunusov@student.42wolfsburg.de> +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/01/12 12:57:17 by zyunusov          #+#    #+#             */
/*   Updated: 2023/01/23 15:14:24 by zyunusov         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../cub3d.h"

void	free_tex(t_cub3d *game)
{
	int i;

	i = -1;
	while (++i < 4)
	{
		if (game->texture[i].file_name)
			free(game->texture[i].file_name);
	}
}

int	cub3d(const char *map, int fd)
{
	t_cub3d	*game;

	game = ft_calloc(sizeof(t_cub3d), 1);
	init_game(game);
	if (parsing_map(game, map, fd))
		exit(EXIT_FAILURE);
	free_map_comp(game);
	free_tex(game);
	free(game);
	return (0);
}

int	main(int argc, char **argv)
{
	int	fd;

	if (argc != 2)
		return (allerrors(1));
	if (check_map_exten(argv[1]))
		return (allerrors(3));
	fd = open(argv[1], O_RDONLY);
	if (fd < 0)
		return (allerrors(2));
	if (cub3d(argv[1], fd))
	{
		// close(fd);
		return (EXIT_FAILURE);
	}
	close(fd);
	return (0);
}
