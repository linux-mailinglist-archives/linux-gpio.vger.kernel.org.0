Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37B53621BD4
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Nov 2022 19:25:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbiKHSZq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Nov 2022 13:25:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbiKHSZp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2022 13:25:45 -0500
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B42E21FCC4
        for <linux-gpio@vger.kernel.org>; Tue,  8 Nov 2022 10:25:39 -0800 (PST)
Received: by mail-vk1-xa2f.google.com with SMTP id g26so9498635vkm.12
        for <linux-gpio@vger.kernel.org>; Tue, 08 Nov 2022 10:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lYKvp8h/lJaB2NhTTG5MOCpjwiDvv9+WdkyPPFqLuCo=;
        b=edXqBvxxmLEA0DIVmgvJkR70zV6oWQEL9REsGG5+/V8+F3Z5X4lyEEVI0UWhdxjNyL
         Go1tS+Jty9jMCpVgy+tQg4JPKKRCDjbfVAPl9oXAFpvuKECbQnuTXHc1GUgH4/M30L1b
         6FmAw71NnYTrOB9Xq3uyEKskswMDPgEbEpzkDuF2RqQMiEmvEydLqmoqWNR3GIU9Qnjo
         ZppCjQ8iKC3itgXj+uJd5ladALERQVrj4kOB0080JrYoonwSn5Wz3M7sSyL5bzKfpLOJ
         xUWlNN3MrX+CmL2EtQAUgb0YHSni74fwvAo9TqgLgiamXBE50dgHJi2Ia3OnEXm1Lole
         Tmjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lYKvp8h/lJaB2NhTTG5MOCpjwiDvv9+WdkyPPFqLuCo=;
        b=VQIc9+KvFwJ1yaRh1IuJ+IRzhvOautCy/DzyyClHaEBbF/5eMVXZGWaxESCAr0VPat
         ODL+mWOJEMxzBJiJLknGVmYq+R4AG9Fz0ZH8+KipPp++/kxLUF+qo8/Mn6y7CXi+vUE4
         TwTeJjXGo9pQ2PiUvR4rBi85EQZN97d2ltUJBb5PcgptbYvrh8ODPCP4BqtWaiBCQ92p
         pZnxMSAIXHJtAGYSq12L45A398rYNhMGoaHu7bs+mn6qjOADUFWZsS9ZpiIAzqk2fcXh
         vblHKN5XYGPBmkDzEJa1xJDNuV2k6dt1EagwYLpWSC8BTGFMbxiC2oC3UfycWHVcrzw9
         6OXQ==
X-Gm-Message-State: ACrzQf2TWPteVTodeIH4JZ5G2CcIYipKhLNlVhxvqtWorkyAJoGA4ViD
        rGs2H7M9z8HSTn6qW32u/60UA6cjnq+zHdmmISErmxY+R70=
X-Google-Smtp-Source: AMsMyM4LIBhmt0cZWhbg5ZrkVdtShBnN7q17yX36mxNDYYPF5ZdJOfYLiN9JD8Nw7/2N1b9rXrqbFzniwdKP1iNicRQ=
X-Received: by 2002:a1f:34d8:0:b0:377:142f:3e2f with SMTP id
 b207-20020a1f34d8000000b00377142f3e2fmr29858444vka.27.1667931938683; Tue, 08
 Nov 2022 10:25:38 -0800 (PST)
MIME-Version: 1.0
References: <20221011002909.26987-1-warthog618@gmail.com> <20221011002909.26987-3-warthog618@gmail.com>
 <CAMRc=Mf=x3iKyvzj63CX1Jgj4fsQKXbHHwcSpLbsvF-teb8Rag@mail.gmail.com> <Y2p2u7oCQ/fToeLw@sol>
In-Reply-To: <Y2p2u7oCQ/fToeLw@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 8 Nov 2022 19:25:27 +0100
Message-ID: <CAMRc=MdYfHpJDfBiG3+F-p+H99wbekmF12VVNhjcMr=Hd9=56w@mail.gmail.com>
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

On Tue, Nov 8, 2022 at 4:33 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Tue, Nov 08, 2022 at 02:13:20PM +0100, Bartosz Golaszewski wrote:
> >  On Tue, Oct 11, 2022 at 2:29 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > Rework the tool suite to support identifying lines by name and to
> > > support operating on the GPIO lines available to the user at once, rather
> > > than on one particular GPIO chip.
> > >
> > > All tools, other than gpiodetect, now provide the name to (chip,offset)
> > > mapping that was previously only performed by gpiofind. As names are not
> > > guaranteed to be unique, a --strict option is provided for all tools to
> > > either abort the operation or report all lines with the matching name, as
> > > appropriate.
> > > By default the tools operate on the first line found with a matching name.
> > >
> > > Selection of line by (chip,offset) is still supported with a --chip
> > > option, though it restricts the scope of the operation to an individual
> > > chip.  When the --chip option is specified, the lines are assumed to be
> > > identified by offset where they parse as an integer, else by name.
> > > To cater for the unusual case where a line name parses as an integer,
> > > but is different from the offset, the --by-name option forces the lines
> > > to be identified by name.
> > >
> > > The updated tools are intentionally NOT backwardly compatible with the
> > > previous tools. Using old command lines with the updated tools will
> > > almost certainly fail, though migrating old command lines is generally as
> > > simple as adding a '-c' before the chip.
> > >
> >
> > While at it: how about adding the --consumer/-C switch to specify a
> > consumer string other than the name of the program?
> >
>
> Ironically I added that to the Rust version, for the long lived
> commands anyway, so it could better emulate the C version for testing
> purposes.
> But could be generally useful, so ok.
>
> I only used the long form there to avoid confusion with -c (as they are
> visually very similar) and following the principle that rarely used
> options only get a long form, so I will omit the short -C option - unless
> you insist.
>

I don't see why it would hurt but I'm fine either way.

> > > In addition the individual tools are modified as follows:
> > >
> > > gpiodetect:
> > >
> > > Add the option to select individual chips.
> > >
> > > gpioinfo:
> > >
> > > Change the focus from chips to lines, so the scope can be
> > > an individual line, a subset of lines, all lines on a particular chip,
> > > or all the lines available to the user.  For line scope a single line
> > > summary is output for each line.  For chip scope the existing format
> > > displaying a summary of the chip and each of its lines is retained.
> > >
> > > Line attributes are consolidated into a list format, and are extended
> > > to cover all attributes supported by uAPI v2.
> > >
> >
> > One change in the output that bothers me is the removal of quotation
> > marks around the line name and consumer. I did that in v1 to visually
> > distinguish between unnamed/unused lines and those that are named. I
> > know it's highly unlikely that a line would be named "unnamed" (sic!)
> > but still:
> >
> > line 0: "foo"
> > line 1: unnamed
> >
> > looks more intuitive to me.
>
> I disagree on this one. In the longer term all lines should be named
> and then the quotes just become pointless noise, and require more
> work to parse.
>

I insist on this one as just a quick glance at the current values of
gpio-line-names DT properties in the kernel show all kinds of funky
names - not only including spaces but also various other characters
like [, ], #, /, - and that not. I think it makes a lot of sense to
delimit them visually with quotes.

> >Same for the consumer as with your current
> > version, if the consumer string has spaces in it, it will look like
> > this: consumer=foo bar. I think consumer="foo bar" would be easier to
> > parse.
>
> For this very reason, the consumer is explicitly listed last, so the
> consumer name matches everything between the "consumer=" and end of
> line.
>
> Unless consumer names with spaces are very common in the wild then
> quotes only add more clutter.
>

We can't know, but instead of putting it last, I'd just treat it like
every other flag and instead delimit the name with "".

The tool is mostly aimed at humans anyway and if someone's brave
enough to parse the output with a script then a cut-based one-liner is
all they need, no?

> >
> > > gpioget:
> > >
> > > The default output format is becomes line=value, as per the
> > > input for gpioset, and the value is reported as active or inactive,
> > > rather than 0 or 1.
> > > The previous format is available using the --numeric option.
> > >
> > > Add an optional hold period between requesting a line and reading the
> > > value to allow the line to settle once the requested configuration has
> > > been applied (e.g. bias).
> > >
> > > gpiomon:
> > >
> > > Consolidate the edge options into a single option.
> > >
> > > Add a debounce period option.
> > >
> > > Add options to report event times as UTC or localtime.
> > >
> > > Add format specifiers for GPIO chip path, line name, stringified event
> > > type, and event time as a datetime.
> > >
> > > Rearrange default output format to place fields with more predicable
> > > widths to the left, and to separate major field groups with tabs.
> > > Lines are identified consistent with the command line.
> > >
> > > gpioset:
> > >
> > > Add a hold period option that specifies the minimum period the line
> > > value must be held for.  This applies to all set options.
> > >
> > > Support line values specified as active/inactive, on/off and
> > > true/false, as well as 1/0.
> > >
> > > Add a toggle option that specifies a time sequence over which the
> > > requested lines should be toggled.  If the sequence is 0 terminated then
> > > gpioset exits when the sequence completes, else it repeats the sequence.
> > > This allows for anything from simple blinkers to bit bashing from the
> > > command line. e.g. gpioset -t 500ms LED=on
> > >
> > > Add an interactive option to provide a shell-like interface to allow
> > > manual or scripted manipulation of requested lines.  A basic command set
> > > allows lines to be get, set, or toggled, and to insert sleeps between
> > > operations.
> > >
> >
> > As discussed elsewhere - it would be great if this part was optional
> > and configurable at build-time so that the dependency on libedit could
> > be dropped if unavailable.
> >
>
> Agreed.
>
> > > Remove the --mode, --sec, and --usec options.
> > > The combination of hold period and interactive mode provide functionality
> > > equivalent to the old --mode options.
> > >
> >
> > I have one problem with that - I think the basic functionality of:
> > "take a line, set its value and wait for a signal" would still be
> > useful. As it is now, I'm not sure how to make gpioset just hold a
> > line without calling the GPIO_V2_LINE_SET_VALUES_IOCTL ioctl
> > periodically.
> >
>
> I forgot to mention the daemonize option here, so
>
> gpioset -z myline=1
>
> will do that.
>
> (or
>
> gpioset -i myline=1
>
> if you want to keep the process in the foreground.)
>
> I'll add something to the daemonize help to highlight that it will hold
> the line until killed. Is that sufficient?
>

What if I don't want to daemonize the program nor open the interactive
mode? Why not just make the default behavior of `gpioset foo=active`
be: stay alive until interrupted? The current immediate exiting is
mostly useless anyway.

> > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > ---
> > >  configure.ac         |   8 +-
> > >  tools/Makefile.am    |   2 +-
> > >  tools/gpiodetect.c   | 113 +++++-
> > >  tools/gpioget.c      | 204 ++++++++++-
> > >  tools/gpioinfo.c     | 223 +++++++++++-
> > >  tools/gpiomon.c      | 450 +++++++++++++++++++++++-
> > >  tools/gpioset.c      | 815 ++++++++++++++++++++++++++++++++++++++++++-
> > >  tools/tools-common.c | 713 ++++++++++++++++++++++++++++++++++++-
> > >  tools/tools-common.h |  99 +++++-
> > >  9 files changed, 2585 insertions(+), 42 deletions(-)
> > >
> > > diff --git a/configure.ac b/configure.ac
> > > index 6ac1d8e..c8033c5 100644
> > > --- a/configure.ac
> > > +++ b/configure.ac
> > > @@ -106,14 +106,14 @@ AC_DEFUN([FUNC_NOT_FOUND_TOOLS],
> > >  AC_DEFUN([HEADER_NOT_FOUND_TOOLS],
> > >         [ERR_NOT_FOUND([$1 header], [tools])])
> > >
> > > +AC_DEFUN([LIB_NOT_FOUND_TOOLS],
> > > +       [ERR_NOT_FOUND([lib$1], [tools])])
> > > +
> > >  if test "x$with_tools" = xtrue
> > >  then
> > >         # These are only needed to build tools
> > > -       AC_CHECK_FUNC([basename], [], [FUNC_NOT_FOUND_TOOLS([basename])])
> > >         AC_CHECK_FUNC([daemon], [], [FUNC_NOT_FOUND_TOOLS([daemon])])
> > > -       AC_CHECK_FUNC([signalfd], [], [FUNC_NOT_FOUND_TOOLS([signalfd])])
> > > -       AC_CHECK_FUNC([setlinebuf], [], [FUNC_NOT_FOUND_TOOLS([setlinebuf])])
> > > -       AC_CHECK_HEADERS([sys/signalfd.h], [], [HEADER_NOT_FOUND_TOOLS([sys/signalfd.h])])
> > > +       PKG_CHECK_MODULES(LIBEDIT, libedit)
> > >  fi
> > >
> > >  AC_ARG_ENABLE([tests],
> > > diff --git a/tools/Makefile.am b/tools/Makefile.am
> > > index fc074b9..c956314 100644
> > > --- a/tools/Makefile.am
> > > +++ b/tools/Makefile.am
> > > @@ -7,7 +7,7 @@ AM_CFLAGS += -Wall -Wextra -g -std=gnu89
> > >  noinst_LTLIBRARIES = libtools-common.la
> > >  libtools_common_la_SOURCES = tools-common.c tools-common.h
> > >
> > > -LDADD = libtools-common.la $(top_builddir)/lib/libgpiod.la
> > > +LDADD = libtools-common.la $(top_builddir)/lib/libgpiod.la $(LIBEDIT_LIBS)
> > >
> > >  bin_PROGRAMS = gpiodetect gpioinfo gpioget gpioset gpiomon
> > >
> > > diff --git a/tools/gpiodetect.c b/tools/gpiodetect.c
> > > index 30bde32..910fe9e 100644
> > > --- a/tools/gpiodetect.c
> > > +++ b/tools/gpiodetect.c
> > > @@ -1,8 +1,7 @@
> > >  // SPDX-License-Identifier: GPL-2.0-or-later
> > >  // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
> > > +// SPDX-FileCopyrightText: 2022 Kent Gibson <warthog618@gmail.com>
> > >
> > > -#include <dirent.h>
> > > -#include <errno.h>
> > >  #include <getopt.h>
> > >  #include <gpiod.h>
> > >  #include <stdio.h>
> > > @@ -11,3 +10,113 @@
> > >
> > >  #include "tools-common.h"
> > >
> > > +static void print_help(void)
> > > +{
> > > +       printf("Usage: %s [OPTIONS] [chip]...\n", get_progname());
> > > +       printf("\n");
> > > +       printf("List GPIO chips, print their labels and number of GPIO lines.\n");
> > > +       printf("\n");
> > > +       printf("Chips may be identified by number, name, or path.\n");
> > > +       printf("e.g. '0', 'gpiochip0', and '/dev/gpiochip0' all refer to the same chip.\n");
> > > +       printf("\n");
> > > +       printf("If no chips are specified then all chips are listed.\n");
> > > +       printf("\n");
> > > +       printf("Options:\n");
> > > +       printf("  -h, --help\t\tdisplay this help and exit\n");
> > > +       printf("  -v, --version\t\toutput version information and exit\n");
> > > +}
> > > +
> > > +int parse_config(int argc, char **argv)
> > > +{
> > > +       int optc, opti;
> > > +       const char *const shortopts = "+hv";
> > > +       const struct option longopts[] = {
> > > +               { "help",       no_argument,    NULL,   'h' },
> > > +               { "version",    no_argument,    NULL,   'v' },
> > > +               { GETOPT_NULL_LONGOPT },
> > > +       };
> >
> > This can be static as there are no addresses of flag variables assigned.
> >
>
> Indeed - and now you mention it I notice a few other things that should be
> static too.
>

<snip>

> > > +
> > > +// minimal version similar to tools-common that indicates if a line should be
> > > +// printed rather than storing details into the resolver.
> > > +// Does not die on non-unique lines.
> >
> > C-style comments only please. Same elsewhere.
> >
>
> Yeah - sorry again - I'm so used to that style that I don't even notice
> I'm doing it.
>
> > <snip>
> >
> > I like the new tools in general. I don't have many issues with the
> > code - you are a much better coder than I am.
>
> That's being a bit harsh.
>
> One thing I was considering was reworking the resolver so it would be
> more suitable for general use, and move it to core libgpiod so apps
> could more readily perform line name discovery.
>

Hmm, I think it's unnecessary clutter in the library. I was thinking
about whether to put the upcoming fdinfo parsing into the library and
figured that it's more of a suitable candidate for a new command-line
tool as the library should focus on the character device exclusively
IMO.

> > I would change the
> > coding style here and there but I will probably just spend some time
> > on a good clang-format config and use it indiscriminately like I did
> > with black for Python.
> >
>
> That could be useful.  Why doesn't the kernel do that?

Probably for the same reason it doesn't use
__attribute__((cleanup(x))) etc. linux kernel inertia. :)

> And that reminds me - I still need to circle back and take another look
> through the Python bindings.
>

Thanks!

Bart
