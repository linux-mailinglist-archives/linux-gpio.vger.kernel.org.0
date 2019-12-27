Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8B4C12BB6B
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2019 22:44:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726075AbfL0Voj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Dec 2019 16:44:39 -0500
Received: from mail-wr1-f48.google.com ([209.85.221.48]:32914 "EHLO
        mail-wr1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbfL0Voj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Dec 2019 16:44:39 -0500
Received: by mail-wr1-f48.google.com with SMTP id b6so27328904wrq.0
        for <linux-gpio@vger.kernel.org>; Fri, 27 Dec 2019 13:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=hmEaNZMLg2AD0HOHvNo1zhiG1OIqkJp7qvMu5uKF2Ew=;
        b=sj88QYIlNlcSMRE2J8HGxBlDk5ODzIyu2cTj040hHOwYJQpw1+YeeGSxlDyAGK1Tpq
         px2K/A/RZOZRoNdfc09tAZKkprUA3uBqysBstJtFRarzG1q9uinzuRB+CsarKDrUn73q
         KRcrhzYoRGFQQQkfGqFtvYxqa3tWEYePohBI1m1FsR+9fgoZjJ6oyde0tPk2a/9lAHm+
         WjhkUOkxhr8M6ZVDulZi2htazKyrRJAlAdF9grdBhazDmKNctM6KswSyeXZETXkRM8kW
         CXLHBTWbyqJeem38NwviShxxYUZI1T3MokG6hnwUCxdHYniK0IOW9xy9PyiVxZDwD72T
         Ubww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=hmEaNZMLg2AD0HOHvNo1zhiG1OIqkJp7qvMu5uKF2Ew=;
        b=tWd+qsEfVE+jQowcaZvqIu4XJKccoUXBPt2pCYsvbBd5lEgYdiYOVrQxQZ8dLPE8uq
         NUjPAqENmGAyheMFFQHnLGhzJD/vnzS3EP1+FfFwu3jjr09tPhKCI3FMiC5r+RAj1nqe
         iZqBPvpMQD5f26eoZ7O15zSwiH1QLquM1zpQKC+LlppEp5zUn6nLvv4VXzpv9bd+aW8a
         /JhaFtPeL788+jgvN3VH0Wt1Ne/aLy+/Fp/pxccITtuyLC0xgLql4lpIq8nRfYn1styB
         MIw+IRdCzEMMaACK9CEMUbbKSmyO3YfZv2+9DrIl6DZurxSbsyZjZoe+c8zNuv3rKtkB
         S7iA==
X-Gm-Message-State: APjAAAXMSdjBJ0rr6PzdbIt36XH2i7oa0tonHlxBJfkb5zfAEfrjkpMy
        dwXJ60emERR+K7ozvs6oZ/BTq1LP82856zVnn5P4+Sav
X-Google-Smtp-Source: APXvYqwZLhIXfBWzYTYHrVHtzmotsKmormcgeD2uNyvgeZpTg8CUvKLdDndBq3eC9BSVrmPjHh5Ry/2TUYtmLFauVDA=
X-Received: by 2002:a5d:5403:: with SMTP id g3mr52363695wrv.302.1577483077586;
 Fri, 27 Dec 2019 13:44:37 -0800 (PST)
MIME-Version: 1.0
From:   John Rose <ohimg801@gmail.com>
Date:   Fri, 27 Dec 2019 15:44:26 -0600
Message-ID: <CAEzB2cvnh4SGVv8y0_roK=mngHGR=GBzKkwn9ATxF2+9K4SD3Q@mail.gmail.com>
Subject: [libgpiod] segfault with function gpiod_chip_get_all_lines(chip, &bulk);
To:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SBC:    HardKernel Odroid N2 4Gb.
OS:     Ubuntu 18.04.3 Mate' DE.
        Linux odroid_N2 4.9.196-63 #1 SMP PREEMPT Thu Oct 17 00:44:03
-03 2019 aarch64 aarch64 aarch64 GNU/Linux
------------------------------------------------------
A basic test of the gpiod_chip_get_all_lines function.
------------------------------------------------------
/*--+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+
 * libgpio_test_03
 *
 *
 *
 */
/*******gdb debugger
error********************************************************************************************************
t3st3r1@odroid_N2:~$ sudo gdb c_projects/libgpio_test_03/main
GNU gdb (Ubuntu 8.1-0ubuntu3.2) 8.1.0.20180409-git
Copyright (C) 2018 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "aarch64-linux-gnu".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
<http://www.gnu.org/software/gdb/documentation/>.
For help, type "help".
Type "apropos word" to search for commands related to "word"...
Reading symbols from c_projects/libgpio_test_03/main...done.
(gdb) run
Starting program: /home/t3st3r1/c_projects/libgpio_test_03/main
OdroidN2 -- Ubuntu 18.04.3 LTS
libgpio_test_03

gpiod_chip_open() OK.


Program received signal SIGSEGV, Segmentation fault.
0x0000007fb7fa48d0 in gpiod_line_bulk_add (line=0x555556a910,
bulk=0x7ffffff2a0) at ../include/gpiod.h:578
578 bulk->lines[bulk->num_lines++] = line;
(gdb)
*********************************************************************************************************************************/

#include "main.h"

#ifndef HIGH
#define HIGH 1
#endif

#ifndef LOW
#define LOW 0
#endif

//--+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+
// Main function.
//
int main(int argc, char** argv) {
fprintf(stdout, "OdroidN2 -- Ubuntu 18.04.3 LTS\nlibgpio_test_03\n\n");

struct  gpiod_chip*     chip;
struct gpiod_line_bulk bulk;
struct gpiod_line      *line;
int offset;
const char *string;
// Open/access a specific gpiochip.
// GPIOX_0 ...GPIOX_19
//
chip = gpiod_chip_open("/dev/gpiochip1");
if (!chip) {
perror("gpiod_chip_open()");
return -1;
}
else
fprintf(stdout, "gpiod_chip_open() OK.\n\n");
// Bulk get of all gpiochip1 lines.
//********************************
// ***** Generates a segfault ****
//********************************
//
if (gpiod_chip_get_all_lines(chip, &bulk) != 0) {
perror("gpiod_chip_get_all_lines()");
return -1;
}

gpiod_chip_close(chip);
fprintf(stdout, "Exiting.\n");
return EXIT_SUCCESS;
}
