Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C1C35697EF
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jul 2022 04:24:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234836AbiGGCYT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jul 2022 22:24:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234806AbiGGCYS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jul 2022 22:24:18 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4448313F5D
        for <linux-gpio@vger.kernel.org>; Wed,  6 Jul 2022 19:24:13 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id l124so6161200pfl.8
        for <linux-gpio@vger.kernel.org>; Wed, 06 Jul 2022 19:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RG4fmSEid/1/8/n8RT1JgO4WslEJvD2jlGN4EOq0ffE=;
        b=QP04uhTPmMYuL2tACTeRQv9/PDOdVGutROUhNmlBl6gd/ZePlfT7r5/9kU4cXJpZEr
         543S1kfuvB+0bxErYjRiWOA9jYv6h+Rgs0/CW3nLm6Mjtyo8OUB9a3uLcDukooBVQZn+
         qnBjZdPD86hzi+aOKU1o/Khy1YbcH4lQr7CFqDVM9zCKSsfB5zM/X9gdleXuBiNZmoMN
         Qz7paHIWwWT/TFMSxvav85a1uOQEnjBJrpAvMUa63T78ORxOAKDgXtviAZbzJKEtZwpb
         J3OCuOSWHcxQfhSMqVuAMxzf8GOhBaF5vauBr3h9rzdIeJ2TAoQr/jfD2bUbXxG/TJbh
         nnAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RG4fmSEid/1/8/n8RT1JgO4WslEJvD2jlGN4EOq0ffE=;
        b=XfWnMyflV075PETTIMNqve5AAKAyyEXibLt25ZcEdKsVGx9yxWnQv2dUDmV/h1tvqP
         xFoCwOah8cUrjyb8qI4QEnw8n7JY8l7WGL9n11EiOe2hGGuVjCV+kcrLHvoYUz5o9mtc
         KI+I/1cSFoYrThddNfe2aDgi7o8DUlNQgH6qXePJBABzFlb5/yjpDRBOFWkzqrcoLoH1
         9wIaeNpVDBDJVkvaLuytGbNZr8QXwuPVF+oHoFqmybPxVI++rIXt6WARu3OkvnR7kOpN
         u7sUDdkGZLJZV9zA0i8EFeYdls+KAfvtPWUYFzsdw9qdv3yk17k3WXWPqRvWUnpWO1fz
         MY5g==
X-Gm-Message-State: AJIora81rjN0lCeozCDa/AHtMW6NHIvQw++8/usv7elYIFdoxKuAbEG6
        oTEREh5deus6AjHkc3WWc2WTcBZCljk=
X-Google-Smtp-Source: AGRyM1s2RwNdXcFzn1AB+gZkdfBAeLSuRCCkvgQ1XQlvjPugzXtWaj3BXwvLsmqXAfm4PWU88VDBeg==
X-Received: by 2002:a17:903:447:b0:16c:9a:7a0c with SMTP id iw7-20020a170903044700b0016c009a7a0cmr6953481plb.137.1657160652564;
        Wed, 06 Jul 2022 19:24:12 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id y137-20020a62ce8f000000b0050dc76281d3sm68757pfg.173.2022.07.06.19.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 19:24:12 -0700 (PDT)
Date:   Thu, 7 Jul 2022 10:24:07 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod v2][PATCH 1/4] tools: line name focussed rework
Message-ID: <20220707022407.GA7250@sol>
References: <20220627134447.81927-1-warthog618@gmail.com>
 <20220627134447.81927-2-warthog618@gmail.com>
 <CAMRc=Mf_WKcTNq0o8AbcBWzdMa=-D_=A5S_Y3ZJ40wimhMUwXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mf_WKcTNq0o8AbcBWzdMa=-D_=A5S_Y3ZJ40wimhMUwXw@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 06, 2022 at 10:20:00PM +0200, Bartosz Golaszewski wrote:
> On Mon, Jun 27, 2022 at 3:46 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Rework the tool suite to support identifying lines by name and to
> > support operating on the GPIO lines available to the user at once, rather
> > than on one particular GPIO chip.
> >
> > All tools, other than gpiodetect, now provide the name to (chip,offset)
> > mapping that was previously only performed by gpiofind. As names are not
> > guaranteed to be unique, a --strict option is provided for all tools to
> > either abort the operation or report all lines with the matching name, as
> > appropriate.
> > By default the tools operate on the first line found with a matching name.
> >
> > Selection of line by (chip,offset) is still supported with a --chip
> > option, though it restricts the scope of the operation to an individual
> > chip.  When the --chip option is specified, the lines are assumed to be
> > identified by offset where they parse as an integer, else by name.
> > To cater for the unusual case where a line name parses as an integer,
> > but is different from the offset, the --by-name option forces the lines
> > to be identified by name.
> >
> 
> We could potentially extend it by allowing multiple --chip arguments
> for multiple chips but let's not go there unless requested.
> 

We could but then we'd have to custom parse the command line.
Or repeatedly apply getopt()?
So yeah, keep it simple for now.

> > The updated tools are intentionally NOT backwardly compatible with the
> > previous tools. Using old command lines with the updated tools will
> > almost certainly fail, though migrating old command lines is generally as
> > simple as adding a '-c' before the chip.
> >
> > In addition the individual tools are modified as follows:
> >
> > gpiodetect:
> >
> > Add the option to select individual chips.
> >
> 
> We discussed at some point that gpiodetect should also check if any of
> the files it iterates over is a symbolic link to a GPIO device and
> print some info accordingly (e.g. foobar [link to /dev/gpiochip2])-
> are you thinking about adding this too?
> 

Did we?  My bad then - I clearly forgot and instead filtered the symlinks
out so it only reports actual chips (btw the v1 tools report the symlinks
by repeating the actual, which is the worst of both worlds).

> > gpiofind:
> >
> > Add the option to display the info for found lines.
> >
> > gpioinfo:
> >
> > Change the focus from chips to lines, so the scope can be
> > an individual line, a subset of lines, all lines on a particular chip,
> > or all the lines available to the user.  For line scope a single line
> > summary is output for each line.  For chip scope the existing format
> > displaying a summary of the chip and each of its lines is retained.
> >
> > Line attributes are consolidated into a list format, and are extended
> > to cover all attributes supported by uAPI v2.
> >
> > gpioget:
> >
> > The default output format is becomes line=value, as per the
> > input for gpioset, and the value is reported as active or inactive,
> > rather than 0 or 1.
> > The previous format is available using the --numeric option.
> >
> > Add an optional hold period between requesting a line and reading the
> > value to allow the line to settle once the requested configuration has
> > been applied (e.g. bias).
> >
> > gpiomon:
> >
> > Consolidate the edge options into a single option.
> >
> > Add a debounce period option.
> >
> > Add options to report event times as UTC or localtime.
> >
> > Add format specifiers for GPIO chip path, line name, stringified event
> > type, and event time as a datetime.
> >
> > Rearrange default output format to place fields with more predicable
> > widths to the left, and to separate major field groups with tabs.
> > Lines are identified consistent with the command line.
> >
> > gpioset:
> >
> > Add a hold period option that specifies the minimum period the line
> > value must be held for.  This applies to all set options.
> >
> > Support line values specified as active/inactive, on/off and
> > true/false, as well as 1/0.
> >
> > Add a toggle option that specifies a time sequence over which the
> > requested lines should be toggled.  If the sequence is 0 terminated then
> > gpioset exits when the sequence completes, else it repeats the sequence.
> > This allows for anything from simple blinkers to bit bashing from the
> > command line. e.g. gpioset -t 500ms LED=on
> >
> > Add an interactive option to provide a shell-like interface to allow
> > manual or scripted manipulation of requested lines.  A basic command set
> > allows lines to be get, set, or toggled, and to insert sleeps between
> > operations.
> >
> > Remove the --mode, --sec, and --usec options.
> > The combination of hold period and interactive mode provide functionality
> > equivalent to the old --mode options.
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > ---
> >  configure.ac         |   9 +-
> >  tools/gpiodetect.c   | 108 ++++--
> >  tools/gpiofind.c     | 126 +++++--
> >  tools/gpioget.c      | 200 ++++++----
> >  tools/gpioinfo.c     | 356 ++++++++----------
> >  tools/gpiomon.c      | 493 +++++++++++++++----------
> >  tools/gpioset.c      | 861 +++++++++++++++++++++++++++++++------------
> >  tools/tools-common.c | 640 +++++++++++++++++++++++++++++---
> >  tools/tools-common.h |  59 ++-
> >  9 files changed, 2011 insertions(+), 841 deletions(-)
> >
> > diff --git a/configure.ac b/configure.ac
> > index ab03673..c7e353c 100644
> > --- a/configure.ac
> > +++ b/configure.ac
> > @@ -105,14 +105,15 @@ AC_DEFUN([FUNC_NOT_FOUND_TOOLS],
> >  AC_DEFUN([HEADER_NOT_FOUND_TOOLS],
> >         [ERR_NOT_FOUND([$1 header], [tools])])
> >
> > +AC_DEFUN([LIB_NOT_FOUND_TOOLS],
> > +       [ERR_NOT_FOUND([lib$1], [tools])])
> > +
> >  if test "x$with_tools" = xtrue
> >  then
> >         # These are only needed to build tools
> > -       AC_CHECK_FUNC([basename], [], [FUNC_NOT_FOUND_TOOLS([basename])])
> >         AC_CHECK_FUNC([daemon], [], [FUNC_NOT_FOUND_TOOLS([daemon])])
> > -       AC_CHECK_FUNC([signalfd], [], [FUNC_NOT_FOUND_TOOLS([signalfd])])
> > -       AC_CHECK_FUNC([setlinebuf], [], [FUNC_NOT_FOUND_TOOLS([setlinebuf])])
> > -       AC_CHECK_HEADERS([sys/signalfd.h], [], [HEADER_NOT_FOUND_TOOLS([sys/signalfd.h])])
> > +       AC_CHECK_HEADERS([readline/readline.h], [], [HEADER_NOT_FOUND_TOOLS([readline/readline.h])])
> > +       AC_CHECK_LIB([readline], readline, [], [LIB_NOT_FOUND_TOOLS([readline])])
> 
> readline is licensed under GPLv3 - this bleeds into gpioset and will
> make a lot of companies bounce off of it. Any chance you could use
> libedit instead? It's supposed to be a drop-in replacement for
> readline but I have never used it first hand.
> 

Hey, you mentioned readline before I implemented it.
Though I don't recall "avoid" being mentioned :-(.

Ok, I'll take a look.  Hopefully it is just a drop-in.

Out of curiosity which aspect of GPLv3 is the problem, for a tool
which is publicly available and they aren't going to modify?
Just having a GPLv3 library on their system?

> >  fi
> >
> >  AC_ARG_ENABLE([tests],
> > diff --git a/tools/gpiodetect.c b/tools/gpiodetect.c
> > index 8f6e8b3..18b6e95 100644
> > --- a/tools/gpiodetect.c
> > +++ b/tools/gpiodetect.c
> > @@ -1,7 +1,6 @@
> >  // SPDX-License-Identifier: GPL-2.0-or-later
> > -// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
> > +// SPDX-FileCopyrightText: 2017-2022 Bartosz Golaszewski <bartekgola@gmail.com>
> 
> This should have your copyright, not mine. Same elsewhere.
> 

Your argument would be stronger for gpiowatch, though even that was
based on your gpiomon.

These files are originally yours, I just modified them, so it wouldn't
be right to replace your copyright.

And as you mention below, you will be maintaining these and to keep it
simple I grant you the copyrights to the content of this series.

> [snip]
> 
> I will try to get back to this one later but it's so big I just kept
> losing focus. Do you think you could submit it the way I did for the
> bindings - remove the existing code and then apply the new
> implementations?
> 

Hey, this is nothing compared to your bindings ;-).

I'm not a huge fan of the remove and replace approach as it loses history,
and while the changes here are substantial they aren't a complete
replacement like the bindings changes were.

If the diff is too confusing I usually refer to the final code for
clarity.

I had originally split it per-tool plus common code, but that didn't
help much.  But I'll take another look at making the patches more
easily digestible.

> Just a general note on coding style: I would prefer that you use /* */
> style comments for the sake of consistency with the rest of the code
> and if you tried to keep the lines limited to 80 characters wherever
> it doesn't significantly impact readability? A sprinkle of newlines
> here and there separating logical blocks of code would be nice too.
> 

Keeping to 80 characters might be tough, I find 100 limiting, but I'll
try.  The kernel has switched to 100, right?

I guess I can break out a green screen terminal.

> We may not agree on the above but after all I will maintain that code
> and would prefer to keep it so that it stays easy for my brain to
> parse it.
> 

Indeed.

Cheers,
Kent.
