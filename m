Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5395D56932C
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Jul 2022 22:20:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233690AbiGFUUS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jul 2022 16:20:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233552AbiGFUUR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jul 2022 16:20:17 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3043E1E3DC
        for <linux-gpio@vger.kernel.org>; Wed,  6 Jul 2022 13:20:12 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id h23so28920967ejj.12
        for <linux-gpio@vger.kernel.org>; Wed, 06 Jul 2022 13:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xhlHr+7itddCoC0uLLgL3pQq9YGxaAQXWIBuSWb/M84=;
        b=jqGhCfUpWO79nFzzEpkLVV65orUx0IqNFjsK6JrODC6GkdSkM5OCCWBnB/0vVV7iHJ
         9FzSXxsZiOUEntAGqoo2h0BKvl8rlY3o4eVn055MVHyH9RKqKHjm6mfZzt0q3j282tnV
         mPd92huIYkUB1JbQmDuCexxazARt8zaU5dJabWMR0GSYyTKaMMVF3aXkoTsH/31jTJRl
         i3rNSqEk2IDFdy/uDGACBMsfioP7EaLOjEvsPi1ewL9F0Mp7I3CShqBBcyZm3nYWxU6o
         q3O5oT95Z+ImWAf6ZNY8xRE+b158+kwdmJL0eIC/toU36nQpNxuDR0QiQiUH6BiPhFt5
         zOsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xhlHr+7itddCoC0uLLgL3pQq9YGxaAQXWIBuSWb/M84=;
        b=WPof9WjahKxtnRDD/0BwvFMtPK1qZqNUHaK1lHW1rdxpYPcdC0pInkr+duBDci1RzM
         bHzXpGrIylXHTcQalV1H05L9ZSmUq9MZdO0f0VnO2zVduMZVooXBpk79pYS+7KafQhL2
         8NOXQSRLDWlZj61BvLUhorc2zWpmw9BsJluh40XCu93EBR7Wl3E0q/e61H+3w9mioJUR
         eNyHucImkZ+7r8PQE3m1sFLPNLwTLYPVW1b/NF3TfQD6H2HE1jfivZfJXmttofqDxXil
         /gzuEgJbvsnd0IBvvHfVM8yhbpqvzM1IifwbI3qe7KbGZ7CxUKie0V6XAHPWRtTnJo6j
         N8zA==
X-Gm-Message-State: AJIora9VymeEayZN8eELdEwEpVQLNf/qTPtOLCADLyDwpel5pd//wEZV
        1atsEf/Kd8f7NfD742rw1DH7f/PmQVgv1QgT0Q2pEw==
X-Google-Smtp-Source: AGRyM1ttaKWBB4r6L4AEhYi+By1pk0zYaoEgLc6L4U4PcRgtf4zvGWK1wT5VqUeB0vRlrkHbs1xRJEuFRY+WJ3jVFWM=
X-Received: by 2002:a17:907:2c4b:b0:72a:f83b:35e7 with SMTP id
 hf11-20020a1709072c4b00b0072af83b35e7mr5330098ejc.636.1657138810680; Wed, 06
 Jul 2022 13:20:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220627134447.81927-1-warthog618@gmail.com> <20220627134447.81927-2-warthog618@gmail.com>
In-Reply-To: <20220627134447.81927-2-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 6 Jul 2022 22:20:00 +0200
Message-ID: <CAMRc=Mf_WKcTNq0o8AbcBWzdMa=-D_=A5S_Y3ZJ40wimhMUwXw@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH 1/4] tools: line name focussed rework
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

We could potentially extend it by allowing multiple --chip arguments
for multiple chips but let's not go there unless requested.

> The updated tools are intentionally NOT backwardly compatible with the
> previous tools. Using old command lines with the updated tools will
> almost certainly fail, though migrating old command lines is generally as
> simple as adding a '-c' before the chip.
>
> In addition the individual tools are modified as follows:
>
> gpiodetect:
>
> Add the option to select individual chips.
>

We discussed at some point that gpiodetect should also check if any of
the files it iterates over is a symbolic link to a GPIO device and
print some info accordingly (e.g. foobar [link to /dev/gpiochip2])-
are you thinking about adding this too?

> gpiofind:
>
> Add the option to display the info for found lines.
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
> Remove the --mode, --sec, and --usec options.
> The combination of hold period and interactive mode provide functionality
> equivalent to the old --mode options.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  configure.ac         |   9 +-
>  tools/gpiodetect.c   | 108 ++++--
>  tools/gpiofind.c     | 126 +++++--
>  tools/gpioget.c      | 200 ++++++----
>  tools/gpioinfo.c     | 356 ++++++++----------
>  tools/gpiomon.c      | 493 +++++++++++++++----------
>  tools/gpioset.c      | 861 +++++++++++++++++++++++++++++++------------
>  tools/tools-common.c | 640 +++++++++++++++++++++++++++++---
>  tools/tools-common.h |  59 ++-
>  9 files changed, 2011 insertions(+), 841 deletions(-)
>
> diff --git a/configure.ac b/configure.ac
> index ab03673..c7e353c 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -105,14 +105,15 @@ AC_DEFUN([FUNC_NOT_FOUND_TOOLS],
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
> +       AC_CHECK_HEADERS([readline/readline.h], [], [HEADER_NOT_FOUND_TOOLS([readline/readline.h])])
> +       AC_CHECK_LIB([readline], readline, [], [LIB_NOT_FOUND_TOOLS([readline])])

readline is licensed under GPLv3 - this bleeds into gpioset and will
make a lot of companies bounce off of it. Any chance you could use
libedit instead? It's supposed to be a drop-in replacement for
readline but I have never used it first hand.

>  fi
>
>  AC_ARG_ENABLE([tests],
> diff --git a/tools/gpiodetect.c b/tools/gpiodetect.c
> index 8f6e8b3..18b6e95 100644
> --- a/tools/gpiodetect.c
> +++ b/tools/gpiodetect.c
> @@ -1,7 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
> -// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
> +// SPDX-FileCopyrightText: 2017-2022 Bartosz Golaszewski <bartekgola@gmail.com>

This should have your copyright, not mine. Same elsewhere.

[snip]

I will try to get back to this one later but it's so big I just kept
losing focus. Do you think you could submit it the way I did for the
bindings - remove the existing code and then apply the new
implementations?

Just a general note on coding style: I would prefer that you use /* */
style comments for the sake of consistency with the rest of the code
and if you tried to keep the lines limited to 80 characters wherever
it doesn't significantly impact readability? A sprinkle of newlines
here and there separating logical blocks of code would be nice too.

We may not agree on the above but after all I will maintain that code
and would prefer to keep it so that it stays easy for my brain to
parse it.

Bart
