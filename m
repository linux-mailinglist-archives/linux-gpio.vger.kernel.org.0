Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7362456938C
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Jul 2022 22:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232890AbiGFUqn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jul 2022 16:46:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231500AbiGFUqn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jul 2022 16:46:43 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2A7228E18
        for <linux-gpio@vger.kernel.org>; Wed,  6 Jul 2022 13:46:40 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id d2so29129731ejy.1
        for <linux-gpio@vger.kernel.org>; Wed, 06 Jul 2022 13:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yjGjixHzf0EmWaBOF5onHrW9/OyakaMC2KpKf3wReYg=;
        b=MSsUu4bh1HNDUUxTLeL8HUsWEt2ubip4Gshlwrkb2POAymMWqGfSzL3Knuhi7Abs+p
         Smovknvk3b2/O9Kbxi9ELfrg+B8jC7/drVPJ3BdhECuPrQ/Gnm7ZxMpc7GMeLXZt5RHc
         EED9B3tv7Jir0+CpaLGBllYaQkRsYGJK3M78uFPayqLqnviC148QqWAQoXkan3UXcsWh
         XXIRxoKHswUQetW/Uye2+KfHDqBdfqxdw1+Dx2w0WW54gHoWMC7HZX5RCZ1nzV7wrh65
         J7JIylS6HUjEIqHNJkOz9vyVVuh1MXUzm6FWkHlVDoDQLoUVPPw3pRB0JWWAcJsoVlvw
         ks1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yjGjixHzf0EmWaBOF5onHrW9/OyakaMC2KpKf3wReYg=;
        b=sPhwYgS72wWo0D2i4TAKqsSkqTB5byXdCMDtfgAGAtKt6TvpzvrmQo46kfXuJjeqaT
         5wLobJ0CemYvsMDI+Qe/G2JT893CW+wiUDMXp3STTuJtPVvppRRrtXazykyJ6VXslsaL
         21MkZ75/hYKgPcu+6iLlT2Hqfw1cIzNlkQrv1quHWl28hccJayZTVTXJ97PYeOfnh5od
         TfYF1YsYLh6oDLldBqGWGtpdeJgOSJd9UlAmZllTLaSW2xZnEuoqY44sKBqmbAaO5jxo
         51eXnl2a8NDNCumUPX1IJRtQlDNXHSEY4UtSaGzqLqNacU9hkexUrXJkpTv1FsQEkEFB
         OIfw==
X-Gm-Message-State: AJIora/QpyCBtdB+KVFJ1JfHuTC/g0hl4/C2dD9tsTl6XJbT8zwbOqsH
        /9zifDkijD7aR4Z4rSSv1IiJ6511oXWSq0AHW1u/ymMf+8A=
X-Google-Smtp-Source: AGRyM1vPcuLSP6bB0kIsglcU5KE6TYVyB3KFWntFKYeZOka2Rj1Y+UtTWaLr++QV86dp5W74SRNHd+Vas/0Px/ZrVOo=
X-Received: by 2002:a17:907:3e20:b0:726:2c09:3fa4 with SMTP id
 hp32-20020a1709073e2000b007262c093fa4mr41132246ejc.101.1657140399521; Wed, 06
 Jul 2022 13:46:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220627134447.81927-1-warthog618@gmail.com> <20220627134447.81927-4-warthog618@gmail.com>
In-Reply-To: <20220627134447.81927-4-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 6 Jul 2022 22:46:28 +0200
Message-ID: <CAMRc=Mf1ux1o9BEOhEAWoVkren-wH-nuPPvvKOisxtqiNyrfOA@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH 3/4] tools: add gpiowatch
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 27, 2022 at 3:46 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> Add a gpiowatch tool, based on gpiomon, but reporting line info change
> events similar to the gpio-watch tool in the linux kernel.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  man/Makefile.am   |   2 +-
>  tools/.gitignore  |   1 +
>  tools/Makefile.am |   4 +-
>  tools/gpiowatch.c | 214 ++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 219 insertions(+), 2 deletions(-)
>  create mode 100644 tools/gpiowatch.c
>
> diff --git a/man/Makefile.am b/man/Makefile.am
> index 4d2c29b..3badd3b 100644
> --- a/man/Makefile.am
> +++ b/man/Makefile.am
> @@ -3,7 +3,7 @@
>
>  if WITH_MANPAGES
>
> -dist_man1_MANS = gpiodetect.man gpioinfo.man gpioget.man gpioset.man gpiofind.man gpiomon.man
> +dist_man1_MANS = gpiodetect.man gpioinfo.man gpioget.man gpioset.man gpiofind.man gpiomon.man gpiowatch.man
>
>  %.man: $(top_builddir)/tools/$(*F)
>         help2man $(top_builddir)/tools/$(*F) --include=$(srcdir)/template --output=$(builddir)/$@ --no-info
> diff --git a/tools/.gitignore b/tools/.gitignore
> index 0d53de9..6175e26 100644
> --- a/tools/.gitignore
> +++ b/tools/.gitignore
> @@ -7,3 +7,4 @@ gpioget
>  gpioset
>  gpiomon
>  gpiofind
> +gpiowatch
> diff --git a/tools/Makefile.am b/tools/Makefile.am
> index 4a13266..8bb2cac 100644
> --- a/tools/Makefile.am
> +++ b/tools/Makefile.am
> @@ -9,7 +9,7 @@ libtools_common_la_SOURCES = tools-common.c tools-common.h
>
>  LDADD = libtools-common.la $(top_builddir)/lib/libgpiod.la
>
> -bin_PROGRAMS = gpiodetect gpioinfo gpioget gpioset gpiomon gpiofind
> +bin_PROGRAMS = gpiodetect gpioinfo gpioget gpioset gpiomon gpiofind gpiowatch
>
>  gpiodetect_SOURCES = gpiodetect.c
>
> @@ -23,6 +23,8 @@ gpiomon_SOURCES = gpiomon.c
>
>  gpiofind_SOURCES = gpiofind.c
>
> +gpiowatch_SOURCES = gpiowatch.c
> +
>  EXTRA_DIST = gpio-tools-test gpio-tools-test.bats
>
>  if WITH_TESTS
> diff --git a/tools/gpiowatch.c b/tools/gpiowatch.c
> new file mode 100644
> index 0000000..e6bfeb6
> --- /dev/null
> +++ b/tools/gpiowatch.c
> @@ -0,0 +1,214 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// SPDX-FileCopyrightText: 2017-2022 Bartosz Golaszewski <bartekgola@gmail.com>
> +
> +#include <getopt.h>
> +#include <gpiod.h>
> +#include <inttypes.h>
> +#include <poll.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <time.h>
> +
> +#include "tools-common.h"
> +
> +static int by_name;
> +static int event_clock_mode;
> +static int banner;
> +
> +static const struct option longopts[] = {
> +       { "banner",             no_argument,            &banner,        1 },
> +       { "by-name",            no_argument,            &by_name,       1 },
> +       { "chip",               required_argument,      NULL,   'c' },
> +       { "help",               no_argument,            NULL,   'h' },
> +       { "localtime",          no_argument,            &event_clock_mode,      2 },
> +       { "strict",             no_argument,            NULL,   's' },
> +       { "utc",                no_argument,            &event_clock_mode,      1 },
> +       { "version",            no_argument,            NULL,   'v' },
> +       { GETOPT_NULL_LONGOPT },
> +};
> +
> +static const char *const shortopts = "+c:shv";
> +
> +static void print_help(void)
> +{
> +       printf("Usage: %s [OPTIONS] <line> ...\n", get_progname());
> +       printf("\n");
> +       printf("Wait for changes to info on GPIO lines and print them to standard output.\n");
> +       printf("\n");
> +       printf("Lines are specified by name, or optionally by offset if the chip option\n");
> +       printf("is provided.\n");
> +       printf("\n");
> +       printf("Options:\n");
> +       printf("      --banner\t\tdisplay a banner on successful startup\n");
> +       printf("      --by-name\t\ttreat lines as names even if they would parse as an offset\n");
> +       printf("  -c, --chip <chip>\trestrict scope to a particular chip\n");
> +       printf("  -h, --help\t\tdisplay this help and exit\n");
> +       printf("      --localtime\treport event time as a local time (default is monotonic)\n");
> +       printf("  -s, --strict\t\tabort if requested line names are not unique\n");
> +       printf("      --utc\t\treport event time as UTC (default is monotonic)\n");
> +       printf("  -v, --version\t\toutput version information and exit\n");
> +       print_chip_help();
> +}
> +
> +struct config {
> +       bool strict;
> +       const char *chip_id;
> +};

Let's either have all options in a local config struct (preferred) or
all of them as global variables, otherwise it's confusing. If you want
to use flags in long opts you can always define that structure within
the function calling getopt().

> +
> +int parse_config(int argc, char **argv, struct config *cfg)
> +{
> +       int opti, optc;
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
> +static void print_banner(int num_lines, char **lines)
> +{
> +       int i;
> +
> +       if (num_lines > 1) {
> +               printf("Watching lines ");
> +               for (i = 0; i < num_lines - 1; i++)
> +                       printf("%s, ", lines[i]);
> +               printf("and %s...\n", lines[i]);
> +       } else {
> +               printf("Watching line %s ...\n", lines[0]);
> +       }
> +}
> +
> +static void event_print(struct gpiod_info_event *event, const char *chip_id)
> +{
> +       struct gpiod_line_info *info;
> +       uint64_t evtime, before, after, mono;
> +       char *evname;
> +       int evtype;
> +       struct timespec ts;
> +
> +       info = gpiod_info_event_get_line_info(event);
> +       evtime = gpiod_info_event_get_timestamp_ns(event);
> +       evtype = gpiod_info_event_get_event_type(event);
> +
> +       switch (evtype) {
> +       case GPIOD_INFO_EVENT_LINE_REQUESTED:
> +               evname = "REQUESTED";
> +               break;
> +       case GPIOD_INFO_EVENT_LINE_RELEASED:
> +               evname = "RELEASED ";
> +               break;
> +       case GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED:
> +               evname = "RECONFIG ";
> +               break;
> +       default:
> +               evname = "UNKNOWN  ";
> +       }

Newline for readability, please.

> +       if (event_clock_mode) {

C-style comments only except for SPDX headers please.

> +               // map clock monotonic to realtime, as uAPI only supports CLOCK_MONOTONIC
> +               clock_gettime(CLOCK_REALTIME, &ts);
> +               before = ts.tv_nsec + ts.tv_sec * 1000000000;
> +               clock_gettime(CLOCK_MONOTONIC, &ts);
> +               mono = ts.tv_nsec + ts.tv_sec * 1000000000;
> +               clock_gettime(CLOCK_REALTIME, &ts);
> +               after = ts.tv_nsec + ts.tv_sec * 1000000000;
> +               evtime += (after/2 - mono + before/2);
> +       }

Moar newlines, I really like between blocks of code, it really helps me, thanks.

> +       print_event_time(evtime, event_clock_mode);
> +       printf(" %s", evname);
> +       if (chip_id)
> +               printf(" %s %d", chip_id, gpiod_line_info_get_offset(info));
> +       print_line_info(info);
> +       printf("\n");
> +}
> +
> +int main(int argc, char **argv)
> +{
> +       int i, j;
> +       struct gpiod_chip **chips;
> +       struct pollfd *pollfds;
> +       struct gpiod_chip *chip;
> +       struct line_resolver *resolver;
> +       struct gpiod_info_event *event;
> +       struct config cfg;
> +
> +       i = parse_config(argc, argv, &cfg);
> +       argc -= optind;
> +       argv += optind;
> +
> +       if (argc < 1)
> +               die("at least one GPIO line must be specified");
> +
> +       if (argc > 64)
> +               die("too many lines given");
> +
> +       resolver = resolve_lines(argc, argv, cfg.chip_id, cfg.strict, by_name);
> +       chips = calloc(resolver->num_chips, sizeof(*chips));
> +       pollfds = calloc(resolver->num_chips, sizeof(*pollfds));
> +       if (!pollfds)
> +               die("out of memory");
> +       for (i = 0; i < resolver->num_chips; i++) {
> +               chip = gpiod_chip_open(resolver->chip_paths[i]);
> +               if (!chip)
> +                       die_perror("unable to open chip %s", resolver->chip_paths[i]);
> +

Don't other tools do the same thing basically (resolving and opening
chips)? Can't we fold it into tools-common.c so that we get a list of
open chips?

> +               for (j = 0; j < resolver->num_lines; j++)
> +                       if (resolver->lines[j].chip_path == resolver->chip_paths[i])
> +                               if (!gpiod_chip_watch_line_info(chip, resolver->lines[j].offset))
> +                                       die_perror("unable to watch line on chip %s",
> +                                                  resolver->chip_paths[i]);
> +
> +               chips[i] = chip;
> +               pollfds[i].fd = gpiod_chip_get_fd(chip);
> +               pollfds[i].events = POLLIN;
> +       }
> +
> +       if (banner)
> +               print_banner(argc, argv);
> +
> +       for (;;) {
> +               if (poll(pollfds, resolver->num_chips, -1) < 0)
> +                       die_perror("error polling for events");
> +
> +               for (i = 0; i < resolver->num_chips; i++) {
> +                       if (pollfds[i].revents == 0)
> +                               continue;
> +
> +                       event = gpiod_chip_read_info_event(chips[i]);
> +                       event_print(event, cfg.chip_id);
> +               }
> +       }
> +       for (i = 0; i < resolver->num_chips; i++)
> +               gpiod_chip_close(chips[i]);
> +       free(chips);
> +       free_line_resolver(resolver);
> +
> +       return EXIT_SUCCESS;
> +}
> --
> 2.36.1
>

Looks good to me, I would have probably added a machine-readable
output formatting like gpiomon but we can always extend it later.

Bart
