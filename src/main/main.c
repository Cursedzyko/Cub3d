/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: zyunusov <zyunusov@student.42wolfsburg.de> +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/01/12 12:57:17 by zyunusov          #+#    #+#             */
/*   Updated: 2023/01/12 13:27:17 by zyunusov         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../cub3d.h"

int	main(int argc, char **argv)
{
	if (argc != 2)
		return (allerrors(1));
	if (check_map_exten(argv[1]))
		return (allerrors(3));
}
