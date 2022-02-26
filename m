Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 207774C539B
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Feb 2022 05:01:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbiBZECa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Feb 2022 23:02:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbiBZEC3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Feb 2022 23:02:29 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A9631B45CA
        for <linux-gpio@vger.kernel.org>; Fri, 25 Feb 2022 20:01:56 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id a5so5539450pfv.9
        for <linux-gpio@vger.kernel.org>; Fri, 25 Feb 2022 20:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kdz3BJMDlCqv4pYaFlck6ZSbBaZ8VkmHTBkJkaMfYLQ=;
        b=IR9b5kKSPzXNEJ52o88mO7oYUQI49AhO5bTInoaicvomTPbWk+3l5Mll3LxR1XOqCw
         Vld6vIr55y1Q/fNzEdVHv6sEFamk8Wfaxovgey6VjLnh6ez0jU6KSHnu/iYVORbHUyb0
         A6EjCBzG0JU9633hRlhGStgzb//CpOqPxQ2rBWODR2dztlGrk5XxdgRuIY7xv0UbldKL
         iC5PjdO/fzbSsbNGRQjA3Xq5Y/0Ml19sZiAkvbFWAr4jXD/FMx6d0wA0UE4sfEWOt3yM
         uuK+sGf2SfLNeMXRHxmwpJkl8p3NMwwxp3AgoQr1MVOezJ0QI2ICUwOKVk4trnlJyLDy
         I9zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kdz3BJMDlCqv4pYaFlck6ZSbBaZ8VkmHTBkJkaMfYLQ=;
        b=bXqUHs+nE19TTyLMRWPHfhRONCeq65u+2FoFFqUBpp9+UOq+Ia7+Q7yYStOZwPhQrW
         CsJlZCLdyT4iVQXR24i/JL3J4stQwm19FHPJfl2IyjNXlHqjmurWjegpgWJ/kQ1e2Mke
         C5ej8hI9nj/dw2Yu0BgtQ9MVj3rnT7IuFK8jKsXjiX9pXrKEff8pognOoifH0HwrGCP9
         DErnMDwoBJonwwtMkrN+Xy3lZtuFPaBMAbY8TyQuThadBs7Y70kddYhD3PdYchdHb7x0
         cuySwU52Q1guaKOy46ylACp1caT36qbRt10T0kkd/AlZ5Qhm+Vqdv1Gb9kxGsCdxsE4p
         +3Mg==
X-Gm-Message-State: AOAM531hczYj5sSGMeXvfOdxTam+VbP0OOVSgR2S4cawezibJpzxW6/b
        6onJvMlmFIHNL2pozsn/70YTOIvBycEkfQ==
X-Google-Smtp-Source: ABdhPJzHAKs+vH4qYZpgS5uPKwHHx+yQg8z/tTxWbFTdgeGWMbEPM1vH1GKPXFFbHZiHqpYpy5r3Zg==
X-Received: by 2002:a62:7846:0:b0:4c7:f23e:1fd7 with SMTP id t67-20020a627846000000b004c7f23e1fd7mr10972016pfc.67.1645848115292;
        Fri, 25 Feb 2022 20:01:55 -0800 (PST)
Received: from sol (60-242-155-106.static.tpgi.com.au. [60.242.155.106])
        by smtp.gmail.com with ESMTPSA id h11-20020a056a001a4b00b004f0f7936bdesm4691642pfv.134.2022.02.25.20.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 20:01:54 -0800 (PST)
Date:   Sat, 26 Feb 2022 12:01:50 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Joel Stanley <joel@jms.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod PATCH] core: Fix line_bulk_foreach_line invalid memory
 access
Message-ID: <20220226040150.GA6586@sol>
References: <20220202114204.31918-1-joel@jms.id.au>
 <CAMRc=MdJX0H1i=UjvHS15+yi+LYgYEyw3puavCwL878gsQWivA@mail.gmail.com>
 <CAMRc=McUht0K+=86VfV7Z8kOU+DMoaYbX65_CrA8WVVE9XhxvA@mail.gmail.com>
 <CACPK8XeN9Ym8wGVmZ15HprGb+UePY51tmcptC2o9zbUgTcP6HQ@mail.gmail.com>
 <CAMRc=McSdV9pxxyiHWeD-nr0VKcchEG7LnT=Z8f8f8pqd_USOQ@mail.gmail.com>
 <20220225150801.GA179640@sol>
 <CAMRc=MfmvyCg+Xpir_+6HUjcpgtmRx9FjG3Fx4iG55X8NP=UNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfmvyCg+Xpir_+6HUjcpgtmRx9FjG3Fx4iG55X8NP=UNQ@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 25, 2022 at 10:55:25PM +0100, Bartosz Golaszewski wrote:
> On Fri, Feb 25, 2022 at 4:08 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> 
> [snip]
> 
> > > >
> > > > That's a bit frustrating.
> > > >
> > >
> > > I know and I'm sorry. I admit that this is not the best time to try to
> > > get new features in.
> > >
> > > > Perhaps you could make the master branch contain the code you're
> > > > working on (instead of next), if you plan on abandoning the current
> > > > code base?
> > >
> > > I can't just yet. I want to keep the codebase bisectable and only
> > > merge the new API into master once it's complete for the C, C++ and
> > > Python parts. The branch called next/libgpiod-2.0 contains the WIP
> > > changes but they are not complete yet. I just posted the test suite
> > > for C and plan on posting the complete C++ bindings soon.
> > >
> > > In fact - we discussed it with Kent and Linus and I expect to be able
> > > to release the v2 in around two months and merge the new API into
> > > master in a month.
> > >
> > > You can base your work on next/libgpiod-2.0 but could you just hold
> > > off the new features until after the new API is in master?
> > >
> >
> > I'm thinking that we should be re-visting the tools as part of the
> > switch to libgpiod v2, as a major version bump is our only opportunity
> > to make sweeping changes.
> >
> 
> Yes and no. I'm not very happy about making the very command-line
> users that we managed to convince to switch away from sysfs to using
> gpio-tools angry again with totally incompatible changes in v2.
> 

Oh, I know - I've made that same point myself.
But it cuts both ways - if you don't fix things now you never will.
Make current users angry, or make future users confused and angry.
Your call.

Of course my prefered option is an interface that will satisfy both
current and future users, but I seriously doubt we can get there if we
maintain backward compatibility for the sake of current users.

> > I have to admit I was not initially in favour of the by-name option, as
> > it is hideously inefficient compared to the offset version.  What was
> > one or two ioctl calls could now be dozens, if not more.
> > And the thought of that happening everytime a user wants to toggle a
> > single line makes my skin crawl.
> >
> > However, in light of our recent discussions, I think we need it as an
> > option.  But I would prefer to revise the tool command lines so lines
> > can be identified by name or offset.  The named option should be the
> > simplest, and so not require a --by-name flag.
> > My current thinking is that the chip should become an optional arg,
> > rather than a positional arg.
> > So [-c <chip>] <line>...
> > e.g.
> >     gpioset GPIO17=active GPIO22=1
> > or
> >     gpioset -c gpiochip0 17=1 LED=off
> >
> > similarly get:
> >
> >     gpioget GPIO17 GPIO22
> > or
> >     gpioget -c gpiochip0 17 LED
> >
> > If the chip is not specified then the line identifier must be a name.
> > If the chip is specified then the line identifier is interpreted as an
> > offset if it parses as an int, else a name.
> > Either way, if multiple lines are provided then they must be on the one
> > chip.
> > That all hinges on the assumption that line names are never simply
> > stringified integers, or at least if they are then it matches the
> > offset.  Is that viable?
> >
> 
> We cannot make that assumptions and I would prefer to stay both
> compatible AND explicit here. As in: work with offsets by default and
> with names as an option. On the other hand - if we specify --by-name,
> I'm fine with skipping the chip parameter and let the program look up
> the line among all chips.
> 

I'm thinking that most users would prefer to work with names.
And that preference will only grow stronger over time.
I'm starting to lean that way myself.

So you are happy with positional chip by default, but optional when
--by-name is set?  That is going to make command line parsing even more
fun, but ok.

So your acceptible forms would be (using get for brevity):
    gpioget gpiochip0 16 17 23
    gpioget --by-name GPIO16 GPIO17 GPIO23
    gpioget --by-name -c gpiochip0 GPIO16 GPIO17 GPIO23
 
?

> > The sets should also accept a set of true/false variants, such as the
> > on/off, active/inactive in the examples above.
> 
> Why though? What do we gain from accepting all kinds of different
> strings? IMO it just makes the interface less clear.
> 

All kinds?  I suggested two variants.  That is all, not the whole thesaurus.
I explicitly avoid 0/1 and low/high, cos line levels.
Could be convinces to accept 0/1 for backward compatibility.

Users can then use a nomenclature that best suits their application.
That makes their scripts more readable.  And much more meaningful than
0/1. I mean 0/1 is literally the least amount of information you could
possibly provide.

While the active-low option exists, setting line=1 will always be
confusing.  Dropping the active-low option for set would mean it
operates with physical levels, while the other commands use logical,
so don't really want to go there either....

(I have also wondered if having the active-low option in the uAPI
is actually beneficial in general, but that bird has flown.)

> > The gets should return active/inactive to make it clear they refer to
> > logical values, not physical values.
> >
> 
> What's wrong with 1/0?
> 

As stated, that can easily be misinterpreted as meaning physical line levels.
And the logical and physical levels are not the same if active-low,
and the get command gives no indication if the active-low is set or not.

> > I am also wondering why the tools are separate, instead of being merged
> > into a single tool.  Is there a reason for that?
> >
> 
> You mean like busybox' single executable with multiple links under
> different names internally redirecting to different main() functions
> or really a single tool with multiple commands?
> 

One advantage of a single tool is that when you add a new one, say
watch, it just gets added to the tool and pops up in the tool help.
So it aids discoverabilty.

And adding commands doesn't automatically require an extra binary to be
built and installed - just upgrading the one.

The busy-box command-link approach is an option, with the link name
determining the subcommand. Or it can be called directly with subcommands.
e.g. gpiodctl set gpiochip0 16=0

Wrt backward compatibility, perhaps add an option to behave as per v1,
so current users can just add that until they migrate to the v2 command
line?
When called directly it could use the v2 command line, but when called
via a link, it could enable the v1 option and support the v1 command line.
Or is that just confusing too?

> The reason for having separate tools is that they really are tiny, the
> little code they share and statically link to is negligible and it's
> simply clearer as to which tool does what. I didn't want the tools to
> be this swiss-knife do-it-all program that requires studying the
> README for a long time.
> 

Who needs the README - the tool help should be sufficient.
If not then fix the help.

They might be tiny, but collectively they can't be smaller than a unified
executable.
Are there cases where only a subset of commands is deployed?
Though even that could be addressed with build options to drop subcommands
from the tool.

> > I've got a bunch of other minor changes that I've been trialing in my
> > Rust library.  So I have a working prototype of the set --interactive
> > that I had mentioned.  I scrapped the batch option - it doesn't
> > add much that the interactive mode and a named pipe doesn't already give
> > you.
> >
> 
> gpioset --interactive is definitely something I'm interested in.
> 

Yeah, it also solves most of my discomfort with the named option - it
only does the find once and caches the offset for subsequent sets.
The best of both worlds.

Would adding a find ioctl to the uAPI be worthwhile?

> > But I digress.  The main thing I want to achieve here is to determine
> > where you want to go with the tools for v2, and what any contraints
> > might be.  Then we can take it from there.
> >
> 
> While the total overhaul of the library is understandable, I would
> prefer to keep the tools mostly backward compatible. I plan on adding
> gpiowatch for watching info events but that's it. Do you see any
> things that are obviously wrong in how the tools work that would
> justify the sweeping changing you mention?
> 

Other than the named mode...

The set is the one that bothers me the most.
The --mode is a bit confusing. Most of them map to the same thing,
and I can get the same effect with --interactive and/or a hold period.
(the hold period being a forced sleep after a set.  That comes in handy
in the interactive mode where you can just hammer out sets and the hold
period defines the rate they will be applied, so blinking or even
bit-bashing becomes super easy)

Time periods should be a single option that includes the time units, 
e.g. -p 10ms is more readable than -u 10000000 (how many zeros is that??)

And I'm pondering a toggle/blink mode, which would toggle the requested
lines at the rate defined by the hold period.  So a simple blinker would
be:
    gpioset --by-name --blink -p 1s LED=on

And a corresponding toggle command for the interactive mode.
(which could specify a subset of lines to toggle, or toggle the whole
set)

If you want to retain backward compatibility then adding these
features, without removing the old, will produce a cluttered, messy
and really confusing gpioset interface.  And that is the tool most
likely to see use :(.

Wrt gpioinfo, I'm not sure the quotes on the name and consumer in the
output helps.  And I'd restrict the chip option to a single chip, else
all chips.  No subset option, to be consistent with other tools
and to allow the option of selecting the line or a subset of lines,
either by offset or name.
e.g. who is consuming the LED line?
    gpioinfo --by-name LED

gpiofind should have a chip option to limit searching (names are only
unique within chips, right, or is even that still not guaranteed?),
and an option to provide the info for found lines - since we have it in
hand anyway.

gpiodetect could get a chip option, so only get the info for the chip
of interest (to ignore those orphaned gpio-sims ;-).

gpiomon should provide sequence numbers.  Maybe an option to return the
whole event in JSON?

Anyway, in short, if backward compatibility is a requirement then I'm
really not sure how best to proceed - except now I need another coffee.

Cheers,
Kent.
