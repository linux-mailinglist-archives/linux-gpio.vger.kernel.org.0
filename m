Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AFFF62120E
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Nov 2022 14:13:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234342AbiKHNNl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Nov 2022 08:13:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233838AbiKHNNk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2022 08:13:40 -0500
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73556A1B6
        for <linux-gpio@vger.kernel.org>; Tue,  8 Nov 2022 05:13:33 -0800 (PST)
Received: by mail-vs1-xe34.google.com with SMTP id k1so13545139vsc.13
        for <linux-gpio@vger.kernel.org>; Tue, 08 Nov 2022 05:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rvACu44NtnEd1xe63xRSohmm37je6EIhuG9V082j3js=;
        b=QCERMT0lsA+7yt4OLIGOdREyUA86JPhj7e22FBmI2P40J6moXbq1pyScBJRYTXj7dj
         YbHO7vVSsUgyUVtyOf9iGNp7g0T+wMnpRTiKU9YF+VYvGLrz+jkFZtEMUghAZnRH7+6d
         tySzrrQYjvMp8S7OI0rFgYXdQ9S/MNNm6gkuKLgN3VriluYbjd1rlUpf9/k965L9nUSa
         yH4g+HP/40AlYE7lfyPJNQ3DaSeMlZT/xMT2WXZKZ+Pg4KmOGJYjqqU8y/N/yGWWpUBW
         ypN9sE+V/96QaUMCBy5YtFdDWK+/NlFLcto7LYFkO6mspv0fOyp1swdNBnI3uaQcg632
         xZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rvACu44NtnEd1xe63xRSohmm37je6EIhuG9V082j3js=;
        b=oj5zmriLmkWCSD8x0xWmL9QDKA4vZSKBpOpxR/yXXqtE7uHBtuBBLsjIXEIu9beFfE
         qovZwim++9BTAXdPaqiLu/Mo2GQE1XTN7g8v8sP5/v0g9efIAvqa5CKmyMjvZZ6NG6X9
         fInvd0urXz5FQeBGssWYoKl3AMebI2knemv3v0B8pspjBYClr9k07VWdiwZ1p7l3K73L
         6zKbb+0xWV/WDCOK8KiUMdKMmv9kjEfXsjQMnARzeCWfIM30ZkJEo5P6JYCGOtdeP22o
         ZccqPvh09OO20B8yfE7ydyC5zv6Kh3F3nwEGfRwLAgfXGoal20n6eLLhkMB8OCy013jX
         KHmg==
X-Gm-Message-State: ACrzQf0rI9j1UssrQZNGeLBHfBospMa8AXB4NZpQKz1N/pZH6DLhrznk
        vrUWJxqz3s6dUonlidxn05M9JbBRSYoXqO1NHf1qKyEfP+/V7A==
X-Google-Smtp-Source: AMsMyM6l63FTHkPb+ivHNU8PoBS5wkEErFHb2Jq3DCWM2EgX4KyWDnKj3RiUF4mlB3OHZZhzgTeKFTYJxX0YukvYf44=
X-Received: by 2002:a67:ac0e:0:b0:3aa:86c3:e6fc with SMTP id
 v14-20020a67ac0e000000b003aa86c3e6fcmr28212625vse.9.1667913212213; Tue, 08
 Nov 2022 05:13:32 -0800 (PST)
MIME-Version: 1.0
References: <20221011002909.26987-1-warthog618@gmail.com> <20221011002909.26987-3-warthog618@gmail.com>
In-Reply-To: <20221011002909.26987-3-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 8 Nov 2022 14:13:20 +0100
Message-ID: <CAMRc=Mf=x3iKyvzj63CX1Jgj4fsQKXbHHwcSpLbsvF-teb8Rag@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH v3 2/5] tools: line name focussed rework
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

 On Tue, Oct 11, 2022 at 2:29 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Rework the tool suite to support identifying lines by name and to
> support operating on the GPIO lines available to the user at once, rather
> than on one particular GPIO chip.
>
> All tools, other than gpiodetect, now provide the name to (chip,offset)
> mapping that was previously only performed by gpiofind. As names are not
> guaranteed to be unique, a --strict option is provided for all tools to
> either abort the operation or report all lines with the matching name, as
> appropriate.
> By default the tools operate on the first line found with a matching name.
>
> Selection of line by (chip,offset) is still supported with a --chip
> option, though it restricts the scope of the operation to an individual
> chip.  When the --chip option is specified, the lines are assumed to be
> identified by offset where they parse as an integer, else by name.
> To cater for the unusual case where a line name parses as an integer,
> but is different from the offset, the --by-name option forces the lines
> to be identified by name.
>
> The updated tools are intentionally NOT backwardly compatible with the
> previous tools. Using old command lines with the updated tools will
> almost certainly fail, though migrating old command lines is generally as
> simple as adding a '-c' before the chip.
>

While at it: how about adding the --consumer/-C switch to specify a
consumer string other than the name of the program?

> In addition the individual tools are modified as follows:
>
> gpiodetect:
>
> Add the option to select individual chips.
>
> gpioinfo:
>
> Change the focus from chips to lines, so the scope can be
> an individual line, a subset of lines, all lines on a particular chip,
> or all the lines available to the user.  For line scope a single line
> summary is output for each line.  For chip scope the existing format
> displaying a summary of the chip and each of its lines is retained.
>
> Line attributes are consolidated into a list format, and are extended
> to cover all attributes supported by uAPI v2.
>

One change in the output that bothers me is the removal of quotation
marks around the line name and consumer. I did that in v1 to visually
distinguish between unnamed/unused lines and those that are named. I
know it's highly unlikely that a line would be named "unnamed" (sic!)
but still:

line 0: "foo"
line 1: unnamed

looks more intuitive to me. Same for the consumer as with your current
version, if the consumer string has spaces in it, it will look like
this: consumer=foo bar. I think consumer="foo bar" would be easier to
parse.

> gpioget:
>
> The default output format is becomes line=value, as per the
> input for gpioset, and the value is reported as active or inactive,
> rather than 0 or 1.
> The previous format is available using the --numeric option.
>
> Add an optional hold period between requesting a line and reading the
> value to allow the line to settle once the requested configuration has
> been applied (e.g. bias).
>
> gpiomon:
>
> Consolidate the edge options into a single option.
>
> Add a debounce period option.
>
> Add options to report event times as UTC or localtime.
>
> Add format specifiers for GPIO chip path, line name, stringified event
> type, and event time as a datetime.
>
> Rearrange default output format to place fields with more predicable
> widths to the left, and to separate major field groups with tabs.
> Lines are identified consistent with the command line.
>
> gpioset:
>
> Add a hold period option that specifies the minimum period the line
> value must be held for.  This applies to all set options.
>
> Support line values specified as active/inactive, on/off and
> true/false, as well as 1/0.
>
> Add a toggle option that specifies a time sequence over which the
> requested lines should be toggled.  If the sequence is 0 terminated then
> gpioset exits when the sequence completes, else it repeats the sequence.
> This allows for anything from simple blinkers to bit bashing from the
> command line. e.g. gpioset -t 500ms LED=on
>
> Add an interactive option to provide a shell-like interface to allow
> manual or scripted manipulation of requested lines.  A basic command set
> allows lines to be get, set, or toggled, and to insert sleeps between
> operations.
>

As discussed elsewhere - it would be great if this part was optional
and configurable at build-time so that the dependency on libedit could
be dropped if unavailable.

> Remove the --mode, --sec, and --usec options.
> The combination of hold period and interactive mode provide functionality
> equivalent to the old --mode options.
>

I have one problem with that - I think the basic functionality of:
"take a line, set its value and wait for a signal" would still be
useful. As it is now, I'm not sure how to make gpioset just hold a
line without calling the GPIO_V2_LINE_SET_VALUES_IOCTL ioctl
periodically.

> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  configure.ac         |   8 +-
>  tools/Makefile.am    |   2 +-
>  tools/gpiodetect.c   | 113 +++++-
>  tools/gpioget.c      | 204 ++++++++++-
>  tools/gpioinfo.c     | 223 +++++++++++-
>  tools/gpiomon.c      | 450 +++++++++++++++++++++++-
>  tools/gpioset.c      | 815 ++++++++++++++++++++++++++++++++++++++++++-
>  tools/tools-common.c | 713 ++++++++++++++++++++++++++++++++++++-
>  tools/tools-common.h |  99 +++++-
>  9 files changed, 2585 insertions(+), 42 deletions(-)
>
> diff --git a/configure.ac b/configure.ac
> index 6ac1d8e..c8033c5 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -106,14 +106,14 @@ AC_DEFUN([FUNC_NOT_FOUND_TOOLS],
>  AC_DEFUN([HEADER_NOT_FOUND_TOOLS],
>         [ERR_NOT_FOUND([$1 header], [tools])])
>
> +AC_DEFUN([LIB_NOT_FOUND_TOOLS],
> +       [ERR_NOT_FOUND([lib$1], [tools])])
> +
>  if test "x$with_tools" = xtrue
>  then
>         # These are only needed to build tools
> -       AC_CHECK_FUNC([basename], [], [FUNC_NOT_FOUND_TOOLS([basename])])
>         AC_CHECK_FUNC([daemon], [], [FUNC_NOT_FOUND_TOOLS([daemon])])
> -       AC_CHECK_FUNC([signalfd], [], [FUNC_NOT_FOUND_TOOLS([signalfd])])
> -       AC_CHECK_FUNC([setlinebuf], [], [FUNC_NOT_FOUND_TOOLS([setlinebuf])])
> -       AC_CHECK_HEADERS([sys/signalfd.h], [], [HEADER_NOT_FOUND_TOOLS([sys/signalfd.h])])
> +       PKG_CHECK_MODULES(LIBEDIT, libedit)
>  fi
>
>  AC_ARG_ENABLE([tests],
> diff --git a/tools/Makefile.am b/tools/Makefile.am
> index fc074b9..c956314 100644
> --- a/tools/Makefile.am
> +++ b/tools/Makefile.am
> @@ -7,7 +7,7 @@ AM_CFLAGS += -Wall -Wextra -g -std=gnu89
>  noinst_LTLIBRARIES = libtools-common.la
>  libtools_common_la_SOURCES = tools-common.c tools-common.h
>
> -LDADD = libtools-common.la $(top_builddir)/lib/libgpiod.la
> +LDADD = libtools-common.la $(top_builddir)/lib/libgpiod.la $(LIBEDIT_LIBS)
>
>  bin_PROGRAMS = gpiodetect gpioinfo gpioget gpioset gpiomon
>
> diff --git a/tools/gpiodetect.c b/tools/gpiodetect.c
> index 30bde32..910fe9e 100644
> --- a/tools/gpiodetect.c
> +++ b/tools/gpiodetect.c
> @@ -1,8 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
> +// SPDX-FileCopyrightText: 2022 Kent Gibson <warthog618@gmail.com>
>
> -#include <dirent.h>
> -#include <errno.h>
>  #include <getopt.h>
>  #include <gpiod.h>
>  #include <stdio.h>
> @@ -11,3 +10,113 @@
>
>  #include "tools-common.h"
>
> +static void print_help(void)
> +{
> +       printf("Usage: %s [OPTIONS] [chip]...\n", get_progname());
> +       printf("\n");
> +       printf("List GPIO chips, print their labels and number of GPIO lines.\n");
> +       printf("\n");
> +       printf("Chips may be identified by number, name, or path.\n");
> +       printf("e.g. '0', 'gpiochip0', and '/dev/gpiochip0' all refer to the same chip.\n");
> +       printf("\n");
> +       printf("If no chips are specified then all chips are listed.\n");
> +       printf("\n");
> +       printf("Options:\n");
> +       printf("  -h, --help\t\tdisplay this help and exit\n");
> +       printf("  -v, --version\t\toutput version information and exit\n");
> +}
> +
> +int parse_config(int argc, char **argv)
> +{
> +       int optc, opti;
> +       const char *const shortopts = "+hv";
> +       const struct option longopts[] = {
> +               { "help",       no_argument,    NULL,   'h' },
> +               { "version",    no_argument,    NULL,   'v' },
> +               { GETOPT_NULL_LONGOPT },
> +       };

This can be static as there are no addresses of flag variables assigned.

> +
> +       for (;;) {
> +               optc = getopt_long(argc, argv, shortopts, longopts, &opti);
> +               if (optc < 0)
> +                       break;
> +
> +               switch (optc) {
> +               case 'h':
> +                       print_help();
> +                       exit(EXIT_SUCCESS);
> +               case 'v':
> +                       print_version();
> +                       exit(EXIT_SUCCESS);
> +               case '?':
> +                       die("try %s --help", get_progname());
> +               default:
> +                       abort();
> +               }
> +       }
> +       return optind;
> +}
> +
> +int print_chip_info(const char *path)
> +{
> +       struct gpiod_chip *chip;
> +       struct gpiod_chip_info *info;
> +
> +       chip = gpiod_chip_open(path);
> +       if (!chip) {
> +               print_perror("unable to open chip '%s'", path);
> +               return 1;
> +       }
> +
> +       info = gpiod_chip_get_info(chip);
> +       if (!info)
> +               die_perror("unable to read info for '%s'", path);
> +
> +       printf("%s [%s] (%zu lines)\n",
> +              gpiod_chip_info_get_name(info),
> +              gpiod_chip_info_get_label(info),
> +              gpiod_chip_info_get_num_lines(info));
> +
> +       gpiod_chip_info_free(info);
> +       gpiod_chip_close(chip);
> +       return 0;
> +}
> +
> +int main(int argc, char **argv)
> +{
> +       int num_chips, i;
> +       char **paths;
> +       char *path;
> +       int ret = EXIT_SUCCESS;
> +
> +       i = parse_config(argc, argv);
> +       argc -= i;
> +       argv += i;
> +
> +       if (argc == 0) {
> +               num_chips = all_chip_paths(&paths);
> +               for (i = 0; i < num_chips; i++) {
> +                       if (print_chip_info(paths[i]))
> +                               ret = EXIT_FAILURE;
> +
> +                       free(paths[i]);
> +               }
> +               free(paths);
> +       }
> +
> +       for (i = 0; i < argc; i++) {
> +               if (chip_path_lookup(argv[i], &path)) {
> +                       if (print_chip_info(path))
> +                               ret = EXIT_FAILURE;
> +
> +                       free(path);
> +               } else {
> +                       print_error(
> +                               "cannot find GPIO chip character device '%s'",
> +                               argv[i]);
> +                       ret = EXIT_FAILURE;
> +               }
> +       }
> +
> +       return ret;
> +}
> diff --git a/tools/gpioget.c b/tools/gpioget.c
> index 1b3e666..7a26066 100644
> --- a/tools/gpioget.c
> +++ b/tools/gpioget.c
> @@ -1,12 +1,214 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
> +// SPDX-FileCopyrightText: 2022 Kent Gibson <warthog618@gmail.com>
>
>  #include <getopt.h>
>  #include <gpiod.h>
> -#include <limits.h>
>  #include <stdio.h>
>  #include <stdlib.h>
>  #include <string.h>
> +#include <unistd.h>
>
>  #include "tools-common.h"
>
> +static void print_help(void)
> +{
> +       printf("Usage: %s [OPTIONS] <line>...\n", get_progname());
> +       printf("\n");
> +       printf("Read values of GPIO lines.\n");
> +       printf("\n");
> +       printf("Lines are specified by name, or optionally by offset if the chip option\n");
> +       printf("is provided.\n");
> +       printf("\n");
> +       printf("Options:\n");
> +       printf("  -a, --as-is\t\tleave the line direction unchanged, not forced to input\n");
> +       print_bias_help();
> +       printf("      --by-name\t\ttreat lines as names even if they would parse as an offset\n");
> +       printf("  -c, --chip <chip>\trestrict scope to a particular chip\n");
> +       printf("  -h, --help\t\tdisplay this help and exit\n");
> +       printf("  -l, --active-low\ttreat the line as active low\n");
> +       printf("  -p, --hold-period <period>\n");
> +       printf("\t\t\twait between requesting the lines and reading the values\n");
> +       printf("      --numeric\t\tdisplay line values as '0' (inactive) or '1' (active)\n");
> +       printf("  -s, --strict\t\tabort if requested line names are not unique\n");
> +       printf("  -v, --version\t\toutput version information and exit\n");
> +       print_chip_help();
> +       print_period_help();
> +}
> +struct config {
> +       bool active_low;
> +       bool strict;
> +       int bias;
> +       int direction;
> +       unsigned int hold_period_us;
> +       const char *chip_id;
> +       int by_name;
> +       int numeric;
> +};
> +
> +int parse_config(int argc, char **argv, struct config *cfg)
> +{
> +       int opti, optc;
> +       const char *const shortopts = "+ab:c:hlp:sv";
> +       const struct option longopts[] = {
> +               { "active-low", no_argument,            NULL,   'l' },
> +               { "as-is",      no_argument,            NULL,   'a' },
> +               { "bias",       required_argument,      NULL,   'b' },
> +               { "by-name",    no_argument,            &cfg->by_name,  1 },
> +               { "chip",       required_argument,      NULL,   'c' },
> +               { "help",       no_argument,            NULL,   'h' },
> +               { "hold-period", required_argument,     NULL,   'p' },
> +               { "numeric",    no_argument,            &cfg->numeric,  1 },
> +               { "strict",     no_argument,            NULL,   's' },
> +               { "version",    no_argument,            NULL,   'v' },
> +               { GETOPT_NULL_LONGOPT },
> +       };
> +
> +       memset(cfg, 0, sizeof(*cfg));
> +       cfg->direction = GPIOD_LINE_DIRECTION_INPUT;
> +
> +       for (;;) {
> +               optc = getopt_long(argc, argv, shortopts, longopts, &opti);
> +               if (optc < 0)
> +                       break;
> +
> +               switch (optc) {
> +               case 'a':
> +                       cfg->direction = GPIOD_LINE_DIRECTION_AS_IS;
> +                       break;
> +               case 'b':
> +                       cfg->bias = parse_bias_or_die(optarg);
> +                       break;
> +               case 'c':
> +                       cfg->chip_id = optarg;
> +                       break;
> +               case 'l':
> +                       cfg->active_low = true;
> +                       break;
> +               case 'p':
> +                       cfg->hold_period_us = parse_period_or_die(optarg);
> +                       break;
> +               case 's':
> +                       cfg->strict = true;
> +                       break;
> +               case 'h':
> +                       print_help();
> +                       exit(EXIT_SUCCESS);
> +               case 'v':
> +                       print_version();
> +                       exit(EXIT_SUCCESS);
> +               case '?':
> +                       die("try %s --help", get_progname());
> +               case 0:
> +                       break;
> +               default:
> +                       abort();
> +               }
> +       }
> +
> +       return optind;
> +}
> +
> +int main(int argc, char **argv)
> +{
> +       int i, num_lines, ret, *values;
> +       struct gpiod_line_settings *settings;
> +       struct gpiod_request_config *req_cfg;
> +       struct gpiod_line_request *request;
> +       struct gpiod_line_config *line_cfg;
> +       struct gpiod_chip *chip;
> +       unsigned int *offsets;
> +       struct line_resolver *resolver;
> +       struct resolved_line *line;
> +       struct config cfg;
> +
> +       i = parse_config(argc, argv, &cfg);
> +       argc -= i;
> +       argv += i;
> +
> +       if (argc < 1)
> +               die("at least one GPIO line must be specified");
> +
> +       resolver = resolve_lines(argc, argv, cfg.chip_id, cfg.strict,
> +                                cfg.by_name);
> +       validate_resolution(resolver, cfg.chip_id);
> +
> +       offsets = calloc(resolver->num_lines, sizeof(*offsets));
> +       values = calloc(resolver->num_lines, sizeof(*values));
> +       if (!offsets || !values)
> +               die("out of memory");
> +
> +       settings = gpiod_line_settings_new();
> +       if (!settings)
> +               die_perror("unable to allocate line settings");
> +
> +       gpiod_line_settings_set_direction(settings, cfg.direction);
> +
> +       if (cfg.bias)
> +               gpiod_line_settings_set_bias(settings, cfg.bias);
> +
> +       if (cfg.active_low)
> +               gpiod_line_settings_set_active_low(settings, true);
> +
> +       req_cfg = gpiod_request_config_new();
> +       if (!req_cfg)
> +               die_perror("unable to allocate the request config structure");
> +
> +       line_cfg = gpiod_line_config_new();
> +       if (!line_cfg)
> +               die_perror("unable to allocate the line config structure");
> +
> +       gpiod_request_config_set_consumer(req_cfg, "gpioget");
> +       for (i = 0; i < resolver->num_chips; i++) {
> +               chip = gpiod_chip_open(resolver->chips[i].path);
> +               if (!chip)
> +                       die_perror("unable to open chip '%s'",
> +                                  resolver->chips[i].path);
> +
> +               num_lines = get_line_offsets_and_values(resolver, i, offsets,
> +                                                       NULL);
> +
> +               gpiod_line_config_reset(line_cfg);
> +               ret = gpiod_line_config_add_line_settings(line_cfg, offsets,
> +                                                         num_lines, settings);
> +               if (ret)
> +                       die_perror("unable to add line settings");
> +
> +               request = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
> +               if (!request)
> +                       die_perror("unable to request lines");
> +
> +               if (cfg.hold_period_us)
> +                       usleep(cfg.hold_period_us);
> +
> +               ret = gpiod_line_request_get_values(request, values);
> +               if (ret)
> +                       die_perror("unable to read GPIO line values");
> +
> +               set_line_values(resolver, i, values);
> +
> +               gpiod_line_request_release(request);
> +               gpiod_chip_close(chip);
> +       }
> +       for (i = 0; i < resolver->num_lines; i++) {
> +               line = &resolver->lines[i];
> +               if (cfg.numeric)
> +                       printf("%d", line->value);
> +               else
> +                       printf("%s=%s", line->id,
> +                              line->value ? "active" : "inactive");
> +
> +               if (i != resolver->num_lines - 1)
> +                       printf(" ");
> +       }
> +       printf("\n");
> +
> +       free_line_resolver(resolver);
> +       gpiod_request_config_free(req_cfg);
> +       gpiod_line_config_free(line_cfg);
> +       gpiod_line_settings_free(settings);
> +       free(offsets);
> +       free(values);
> +
> +       return EXIT_SUCCESS;
> +}
> diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
> index ae368fa..5dc28f8 100644
> --- a/tools/gpioinfo.c
> +++ b/tools/gpioinfo.c
> @@ -1,8 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
> +// SPDX-FileCopyrightText: 2022 Kent Gibson <warthog618@gmail.com>
>
> -#include <dirent.h>
> -#include <errno.h>
>  #include <getopt.h>
>  #include <gpiod.h>
>  #include <stdarg.h>
> @@ -12,3 +11,223 @@
>
>  #include "tools-common.h"
>
> +static void print_help(void)
> +{
> +       printf("Usage: %s [OPTIONS] [line]...\n", get_progname());
> +       printf("\n");
> +       printf("Print information about GPIO lines.\n");
> +       printf("\n");
> +       printf("Lines are specified by name, or optionally by offset if the chip option\n");
> +       printf("is provided.\n");
> +       printf("\n");
> +       printf("If no lines are specified than all lines are displayed.\n");
> +       printf("\n");
> +       printf("Options:\n");
> +       printf("      --by-name\t\ttreat lines as names even if they would parse as an offset\n");
> +       printf("  -c, --chip <chip>\trestrict scope to a particular chip\n");
> +       printf("  -h, --help\t\tdisplay this help and exit\n");
> +       printf("  -s, --strict\t\tcheck all lines - don't assume line names are unique\n");
> +       printf("  -v, --version\t\toutput version information and exit\n");
> +       print_chip_help();
> +}
> +
> +struct config {
> +       bool strict;
> +       const char *chip_id;
> +       int by_name;
> +};
> +
> +int parse_config(int argc, char **argv, struct config *cfg)
> +{
> +       int opti, optc;
> +       const char *const shortopts = "+c:hsv";
> +       const struct option longopts[] = {
> +               { "by-name",    no_argument,    &cfg->by_name,  1 },
> +               { "chip",       required_argument,      NULL,   'c' },
> +               { "help",       no_argument,    NULL,           'h' },
> +               { "strict",     no_argument,    NULL,           's' },
> +               { "version",    no_argument,    NULL,           'v' },
> +               { GETOPT_NULL_LONGOPT },
> +       };
> +
> +       memset(cfg, 0, sizeof(*cfg));
> +
> +       for (;;) {
> +               optc = getopt_long(argc, argv, shortopts, longopts, &opti);
> +               if (optc < 0)
> +                       break;
> +
> +               switch (optc) {
> +               case 'c':
> +                       cfg->chip_id = optarg;
> +                       break;
> +               case 's':
> +                       cfg->strict = true;
> +                       break;
> +               case 'h':
> +                       print_help();
> +                       exit(EXIT_SUCCESS);
> +               case 'v':
> +                       print_version();
> +                       exit(EXIT_SUCCESS);
> +               case '?':
> +                       die("try %s --help", get_progname());
> +               case 0:
> +                       break;
> +               default:
> +                       abort();
> +               }
> +       }
> +
> +       return optind;
> +}
> +
> +
> +// minimal version similar to tools-common that indicates if a line should be
> +// printed rather than storing details into the resolver.
> +// Does not die on non-unique lines.

C-style comments only please. Same elsewhere.

<snip>

I like the new tools in general. I don't have many issues with the
code - you are a much better coder than I am. I would change the
coding style here and there but I will probably just spend some time
on a good clang-format config and use it indiscriminately like I did
with black for Python.

Bart
