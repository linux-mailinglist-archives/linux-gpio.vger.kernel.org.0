Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD38C5697F4
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jul 2022 04:27:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234723AbiGGC1i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jul 2022 22:27:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234687AbiGGC1i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jul 2022 22:27:38 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C2A21CFC8
        for <linux-gpio@vger.kernel.org>; Wed,  6 Jul 2022 19:27:35 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id bh13so9988551pgb.4
        for <linux-gpio@vger.kernel.org>; Wed, 06 Jul 2022 19:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fnpve7PSl8/JEJ8yUnSeCGl1TqWP5RcW7MtocC82bEc=;
        b=Rl4wFFn0zmwG5TDiikUGiJZTZ9dpVxkx8f0ftFBAvttA3pxJBCISeRXOCXztjbZGzQ
         hZpx/Rn/XE8syyVVgoxmt19V/WYGRZj9GCMdOgBHBmpVI2rLvtZpKNmslrW/uNSkVmkK
         PSClVVkM6MX31Ik76SyO7wssBLUh16NIbDpG4ebeaXXWnDn4kIFhSSE4m+sLoVjef+Ab
         ElA5vQgJHWCHIf62zyoW0q84m3othkRj8U8ei6H4tten4foYrTeKemp21zLTYFDkwvzD
         Td250bZzwVWMKr0P7NjmnGYbfHYldTCd+uvNMIk5heW43OK6y7yv+nabFEDdRBCXQ3+c
         VkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fnpve7PSl8/JEJ8yUnSeCGl1TqWP5RcW7MtocC82bEc=;
        b=7RgCFAgvasNGz92l47A8JzXeEQIcQu2Z/H8SGgkpkWwE7qDbeitQ46rgh3eMd15XcA
         Qjk+0jur8nA+f/Pa57i+x7C+0sVSr1uBS/PkSpqt6Iea7nXtRZRGDThLBpTQ1LGUuFHF
         qJUXfkHQvjKk8jpIlfThnPEveqRwMfHfVXGdinyoRqR2dTMasEk+HV/4YfymJuF5Kw8h
         O5MDlribNnUe9M7FVaGP9ZASSbbqqLx75cemSxjAldpzqnl5bqamLWMTHprT3xlo/oVj
         xniBaT0YcyC3UaCntzreAu0p0+l/kXdZ8+r1gvXm1tezuU30mi0BqdBnpuHpmhFoijh0
         e4BA==
X-Gm-Message-State: AJIora+JYJ3ArUYYb7hHEttbwbnzvuGLKeAySaOQjhoys0gAnRYKIVKo
        +Dyfa4MsKHZC5cV+SPD71yV4yvpsDH0=
X-Google-Smtp-Source: AGRyM1sJu+sM42MTVzY+Ohl9PB9ekFUyOwULmy5MTvQmOyhZbLK3CzRgA+KgbjbU2aXgtiLBkNhs5Q==
X-Received: by 2002:a63:d614:0:b0:411:acdb:5c55 with SMTP id q20-20020a63d614000000b00411acdb5c55mr30574180pgg.245.1657160855020;
        Wed, 06 Jul 2022 19:27:35 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id z3-20020a1709027e8300b0016bf0200cd8sm4881982pla.296.2022.07.06.19.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 19:27:34 -0700 (PDT)
Date:   Thu, 7 Jul 2022 10:27:30 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod v2][PATCH 3/4] tools: add gpiowatch
Message-ID: <20220707022730.GB7250@sol>
References: <20220627134447.81927-1-warthog618@gmail.com>
 <20220627134447.81927-4-warthog618@gmail.com>
 <CAMRc=Mf1ux1o9BEOhEAWoVkren-wH-nuPPvvKOisxtqiNyrfOA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mf1ux1o9BEOhEAWoVkren-wH-nuPPvvKOisxtqiNyrfOA@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 06, 2022 at 10:46:28PM +0200, Bartosz Golaszewski wrote:
> On Mon, Jun 27, 2022 at 3:46 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Add a gpiowatch tool, based on gpiomon, but reporting line info change
> > events similar to the gpio-watch tool in the linux kernel.
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > ---
> >  man/Makefile.am   |   2 +-
> >  tools/.gitignore  |   1 +
> >  tools/Makefile.am |   4 +-
> >  tools/gpiowatch.c | 214 ++++++++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 219 insertions(+), 2 deletions(-)
> >  create mode 100644 tools/gpiowatch.c
> >
> > diff --git a/man/Makefile.am b/man/Makefile.am
> > index 4d2c29b..3badd3b 100644
> > --- a/man/Makefile.am
> > +++ b/man/Makefile.am
> > @@ -3,7 +3,7 @@
> >
> >  if WITH_MANPAGES
> >
> > -dist_man1_MANS = gpiodetect.man gpioinfo.man gpioget.man gpioset.man gpiofind.man gpiomon.man
> > +dist_man1_MANS = gpiodetect.man gpioinfo.man gpioget.man gpioset.man gpiofind.man gpiomon.man gpiowatch.man
> >
> >  %.man: $(top_builddir)/tools/$(*F)
> >         help2man $(top_builddir)/tools/$(*F) --include=$(srcdir)/template --output=$(builddir)/$@ --no-info
> > diff --git a/tools/.gitignore b/tools/.gitignore
> > index 0d53de9..6175e26 100644
> > --- a/tools/.gitignore
> > +++ b/tools/.gitignore
> > @@ -7,3 +7,4 @@ gpioget
> >  gpioset
> >  gpiomon
> >  gpiofind
> > +gpiowatch
> > diff --git a/tools/Makefile.am b/tools/Makefile.am
> > index 4a13266..8bb2cac 100644
> > --- a/tools/Makefile.am
> > +++ b/tools/Makefile.am
> > @@ -9,7 +9,7 @@ libtools_common_la_SOURCES = tools-common.c tools-common.h
> >
> >  LDADD = libtools-common.la $(top_builddir)/lib/libgpiod.la
> >
> > -bin_PROGRAMS = gpiodetect gpioinfo gpioget gpioset gpiomon gpiofind
> > +bin_PROGRAMS = gpiodetect gpioinfo gpioget gpioset gpiomon gpiofind gpiowatch
> >
> >  gpiodetect_SOURCES = gpiodetect.c
> >
> > @@ -23,6 +23,8 @@ gpiomon_SOURCES = gpiomon.c
> >
> >  gpiofind_SOURCES = gpiofind.c
> >
> > +gpiowatch_SOURCES = gpiowatch.c
> > +
> >  EXTRA_DIST = gpio-tools-test gpio-tools-test.bats
> >
> >  if WITH_TESTS
> > diff --git a/tools/gpiowatch.c b/tools/gpiowatch.c
> > new file mode 100644
> > index 0000000..e6bfeb6
> > --- /dev/null
> > +++ b/tools/gpiowatch.c
> > @@ -0,0 +1,214 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +// SPDX-FileCopyrightText: 2017-2022 Bartosz Golaszewski <bartekgola@gmail.com>
> > +
> > +#include <getopt.h>
> > +#include <gpiod.h>
> > +#include <inttypes.h>
> > +#include <poll.h>
> > +#include <stdio.h>
> > +#include <stdlib.h>
> > +#include <string.h>
> > +#include <time.h>
> > +
> > +#include "tools-common.h"
> > +
> > +static int by_name;
> > +static int event_clock_mode;
> > +static int banner;
> > +
> > +static const struct option longopts[] = {
> > +       { "banner",             no_argument,            &banner,        1 },
> > +       { "by-name",            no_argument,            &by_name,       1 },
> > +       { "chip",               required_argument,      NULL,   'c' },
> > +       { "help",               no_argument,            NULL,   'h' },
> > +       { "localtime",          no_argument,            &event_clock_mode,      2 },
> > +       { "strict",             no_argument,            NULL,   's' },
> > +       { "utc",                no_argument,            &event_clock_mode,      1 },
> > +       { "version",            no_argument,            NULL,   'v' },
> > +       { GETOPT_NULL_LONGOPT },
> > +};
> > +
> > +static const char *const shortopts = "+c:shv";
> > +
> > +static void print_help(void)
> > +{
> > +       printf("Usage: %s [OPTIONS] <line> ...\n", get_progname());
> > +       printf("\n");
> > +       printf("Wait for changes to info on GPIO lines and print them to standard output.\n");
> > +       printf("\n");
> > +       printf("Lines are specified by name, or optionally by offset if the chip option\n");
> > +       printf("is provided.\n");
> > +       printf("\n");
> > +       printf("Options:\n");
> > +       printf("      --banner\t\tdisplay a banner on successful startup\n");
> > +       printf("      --by-name\t\ttreat lines as names even if they would parse as an offset\n");
> > +       printf("  -c, --chip <chip>\trestrict scope to a particular chip\n");
> > +       printf("  -h, --help\t\tdisplay this help and exit\n");
> > +       printf("      --localtime\treport event time as a local time (default is monotonic)\n");
> > +       printf("  -s, --strict\t\tabort if requested line names are not unique\n");
> > +       printf("      --utc\t\treport event time as UTC (default is monotonic)\n");
> > +       printf("  -v, --version\t\toutput version information and exit\n");
> > +       print_chip_help();
> > +}
> > +
> > +struct config {
> > +       bool strict;
> > +       const char *chip_id;
> > +};
> 
> Let's either have all options in a local config struct (preferred) or
> all of them as global variables, otherwise it's confusing. If you want
> to use flags in long opts you can always define that structure within
> the function calling getopt().
> 

Agreed.  I wasn't keen on moving the struct into the function, but will
do.

Btw I prefer the long only options for the corner case options to avoid
poluting the short space.  The common options get a short form as well.

> > +
> > +int parse_config(int argc, char **argv, struct config *cfg)
> > +{
> > +       int opti, optc;
> > +
> > +       memset(cfg, 0, sizeof(*cfg));
> > +
> > +       for (;;) {
> > +               optc = getopt_long(argc, argv, shortopts, longopts, &opti);
> > +               if (optc < 0)
> > +                       break;
> > +
> > +               switch (optc) {
> > +               case 'c':
> > +                       cfg->chip_id = optarg;
> > +                       break;
> > +               case 's':
> > +                       cfg->strict = true;
> > +                       break;
> > +               case 'h':
> > +                       print_help();
> > +                       exit(EXIT_SUCCESS);
> > +               case 'v':
> > +                       print_version();
> > +                       exit(EXIT_SUCCESS);
> > +               case '?':
> > +                       die("try %s --help", get_progname());
> > +               case 0:
> > +                       break;
> > +               default:
> > +                       abort();
> > +               }
> > +       }
> > +
> > +       return optind;
> > +}
> > +
> > +static void print_banner(int num_lines, char **lines)
> > +{
> > +       int i;
> > +
> > +       if (num_lines > 1) {
> > +               printf("Watching lines ");
> > +               for (i = 0; i < num_lines - 1; i++)
> > +                       printf("%s, ", lines[i]);
> > +               printf("and %s...\n", lines[i]);
> > +       } else {
> > +               printf("Watching line %s ...\n", lines[0]);
> > +       }
> > +}
> > +
> > +static void event_print(struct gpiod_info_event *event, const char *chip_id)
> > +{
> > +       struct gpiod_line_info *info;
> > +       uint64_t evtime, before, after, mono;
> > +       char *evname;
> > +       int evtype;
> > +       struct timespec ts;
> > +
> > +       info = gpiod_info_event_get_line_info(event);
> > +       evtime = gpiod_info_event_get_timestamp_ns(event);
> > +       evtype = gpiod_info_event_get_event_type(event);
> > +
> > +       switch (evtype) {
> > +       case GPIOD_INFO_EVENT_LINE_REQUESTED:
> > +               evname = "REQUESTED";
> > +               break;
> > +       case GPIOD_INFO_EVENT_LINE_RELEASED:
> > +               evname = "RELEASED ";
> > +               break;
> > +       case GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED:
> > +               evname = "RECONFIG ";
> > +               break;
> > +       default:
> > +               evname = "UNKNOWN  ";
> > +       }
> 
> Newline for readability, please.
> 
> > +       if (event_clock_mode) {
> 
> C-style comments only except for SPDX headers please.
> 

Yeah, sorry - lazy habit.  I don't even notice I'm doing it.

> > +               // map clock monotonic to realtime, as uAPI only supports CLOCK_MONOTONIC
> > +               clock_gettime(CLOCK_REALTIME, &ts);
> > +               before = ts.tv_nsec + ts.tv_sec * 1000000000;
> > +               clock_gettime(CLOCK_MONOTONIC, &ts);
> > +               mono = ts.tv_nsec + ts.tv_sec * 1000000000;
> > +               clock_gettime(CLOCK_REALTIME, &ts);
> > +               after = ts.tv_nsec + ts.tv_sec * 1000000000;
> > +               evtime += (after/2 - mono + before/2);
> > +       }
> 
> Moar newlines, I really like between blocks of code, it really helps me, thanks.
> 

Oh, ok, I see this as being one block.  Where would you like the splits?

> > +       print_event_time(evtime, event_clock_mode);
> > +       printf(" %s", evname);
> > +       if (chip_id)
> > +               printf(" %s %d", chip_id, gpiod_line_info_get_offset(info));
> > +       print_line_info(info);
> > +       printf("\n");
> > +}
> > +
> > +int main(int argc, char **argv)
> > +{
> > +       int i, j;
> > +       struct gpiod_chip **chips;
> > +       struct pollfd *pollfds;
> > +       struct gpiod_chip *chip;
> > +       struct line_resolver *resolver;
> > +       struct gpiod_info_event *event;
> > +       struct config cfg;
> > +
> > +       i = parse_config(argc, argv, &cfg);
> > +       argc -= optind;
> > +       argv += optind;
> > +
> > +       if (argc < 1)
> > +               die("at least one GPIO line must be specified");
> > +
> > +       if (argc > 64)
> > +               die("too many lines given");
> > +
> > +       resolver = resolve_lines(argc, argv, cfg.chip_id, cfg.strict, by_name);
> > +       chips = calloc(resolver->num_chips, sizeof(*chips));
> > +       pollfds = calloc(resolver->num_chips, sizeof(*pollfds));
> > +       if (!pollfds)
> > +               die("out of memory");
> > +       for (i = 0; i < resolver->num_chips; i++) {
> > +               chip = gpiod_chip_open(resolver->chip_paths[i]);
> > +               if (!chip)
> > +                       die_perror("unable to open chip %s", resolver->chip_paths[i]);
> > +
> 
> Don't other tools do the same thing basically (resolving and opening
> chips)? Can't we fold it into tools-common.c so that we get a list of
> open chips?
> 

Yes and no.  I wasn't keen on opening all the chips at once in the
common code as in general the chips are immediately closed once the lines
are requested. And the request is tool specific.
Watch is a bit of an aberation in that regard - it holds the chips open
indefinitely.

> > +               for (j = 0; j < resolver->num_lines; j++)
> > +                       if (resolver->lines[j].chip_path == resolver->chip_paths[i])
> > +                               if (!gpiod_chip_watch_line_info(chip, resolver->lines[j].offset))
> > +                                       die_perror("unable to watch line on chip %s",
> > +                                                  resolver->chip_paths[i]);
> > +
> > +               chips[i] = chip;
> > +               pollfds[i].fd = gpiod_chip_get_fd(chip);
> > +               pollfds[i].events = POLLIN;
> > +       }
> > +
> > +       if (banner)
> > +               print_banner(argc, argv);
> > +
> > +       for (;;) {
> > +               if (poll(pollfds, resolver->num_chips, -1) < 0)
> > +                       die_perror("error polling for events");
> > +
> > +               for (i = 0; i < resolver->num_chips; i++) {
> > +                       if (pollfds[i].revents == 0)
> > +                               continue;
> > +
> > +                       event = gpiod_chip_read_info_event(chips[i]);
> > +                       event_print(event, cfg.chip_id);
> > +               }
> > +       }
> > +       for (i = 0; i < resolver->num_chips; i++)
> > +               gpiod_chip_close(chips[i]);
> > +       free(chips);
> > +       free_line_resolver(resolver);
> > +
> > +       return EXIT_SUCCESS;
> > +}
> > --
> > 2.36.1
> >
> 
> Looks good to me, I would have probably added a machine-readable
> output formatting like gpiomon but we can always extend it later.
> 

You mean the format option?

Cheers,
Kent.
