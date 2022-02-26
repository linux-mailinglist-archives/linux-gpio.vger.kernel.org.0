Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83FC94C567B
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Feb 2022 15:34:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231360AbiBZOfI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 26 Feb 2022 09:35:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229878AbiBZOfH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 26 Feb 2022 09:35:07 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D92FA5BE59
        for <linux-gpio@vger.kernel.org>; Sat, 26 Feb 2022 06:34:31 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id p14so16224607ejf.11
        for <linux-gpio@vger.kernel.org>; Sat, 26 Feb 2022 06:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bE/tmKXGY4XX6WlO8boG6amZRK2mNNZ7+nlPao52a3w=;
        b=e1fQU8wxqpHxmk7b3WG0m0Qd/ia2DhHE8+G8gxRYPuANNu4aE2J/GQ5NbpqA/f1FyH
         324DupboS/WYkfxsd3aeOygJw56n7ax3MznF/65UriWuz6g3O44Ok/88in6QVN5sc1Xc
         YRnspRJfvhA7ARCoYvygpuRXbmpeSHqYqzIjbMTmytv2vbHI8DEki0enjGLGMZ34yqDv
         rWXevOXcL8KEdcHg+dGJChP1b1I7cxEb60iBwhAdrP4JdpwrJUQRjRBrhvIIVuhHzlKY
         o9P9IG90NZzrmJC4u0HfPoD7xD7AiJ0YCzQRlYRHdkFiJ4H3hBpX4aDaDVxTu5LcETkh
         mz5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bE/tmKXGY4XX6WlO8boG6amZRK2mNNZ7+nlPao52a3w=;
        b=vSRinyvJyBU+L+RzDOUs5q9JMkpnNRXoffzLGf5tY5AiGLjq7cmb0U/6JKY4ciIYLT
         dn0yLSuyh4BhMbfiLdFCDBy28YODjdIGu01mm513tR86vSC6+YP9Mhjb6SCo1sHX2MP/
         HoJ+VNvOJ9M0akJooYk89l1TzsvGMyLL+kyWSI4Qbpw13/KySvnetffL01VcrO3G2J7j
         hycKlzU+XuJb0fcBwsJ67fhzSFDXoZpuoPF1ovipuFIaODrWf0Gi37FLh6/Xe3WFEBaS
         zJrPcizfMOxl6QmM2tXJeTHgaUyHCoU5Vgc6mKVXjNoRBZFtfGPbzdj4StS1Nn/PJsiS
         FgSA==
X-Gm-Message-State: AOAM532Ju+/HFMuD1kjRZCxua/wSD9GA5oCbHpSxH88uUDl2lEcLORy8
        /2tVepz+LJkLVOl3ol418fyB05LHLgsEQWK1ZTQkEV6G6YID5Q==
X-Google-Smtp-Source: ABdhPJxHDdJKcS/4/FADYlEFFmjvxKLPKDH9hkFPpM1VAbtWLGEKuz0MG0kYG9QIc3AMbAe2LUqp4NIXjcjnoyu+wF4=
X-Received: by 2002:a17:907:7618:b0:6cf:5756:26c4 with SMTP id
 jx24-20020a170907761800b006cf575626c4mr9615563ejc.492.1645886070203; Sat, 26
 Feb 2022 06:34:30 -0800 (PST)
MIME-Version: 1.0
References: <20220202114204.31918-1-joel@jms.id.au> <CAMRc=MdJX0H1i=UjvHS15+yi+LYgYEyw3puavCwL878gsQWivA@mail.gmail.com>
 <CAMRc=McUht0K+=86VfV7Z8kOU+DMoaYbX65_CrA8WVVE9XhxvA@mail.gmail.com>
 <CACPK8XeN9Ym8wGVmZ15HprGb+UePY51tmcptC2o9zbUgTcP6HQ@mail.gmail.com>
 <CAMRc=McSdV9pxxyiHWeD-nr0VKcchEG7LnT=Z8f8f8pqd_USOQ@mail.gmail.com>
 <20220225150801.GA179640@sol> <CAMRc=MfmvyCg+Xpir_+6HUjcpgtmRx9FjG3Fx4iG55X8NP=UNQ@mail.gmail.com>
 <20220226040150.GA6586@sol>
In-Reply-To: <20220226040150.GA6586@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 26 Feb 2022 15:34:19 +0100
Message-ID: <CAMRc=Mfv99=5dj1Dot8iQsVt7K0VtsEz32MAvpMwFarSuUjTQg@mail.gmail.com>
Subject: Re: [libgpiod PATCH] core: Fix line_bulk_foreach_line invalid memory access
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Joel Stanley <joel@jms.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Feb 26, 2022 at 5:01 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Fri, Feb 25, 2022 at 10:55:25PM +0100, Bartosz Golaszewski wrote:
> > On Fri, Feb 25, 2022 at 4:08 PM Kent Gibson <warthog618@gmail.com> wrot=
e:
> > >
> >
> > [snip]
> >
> > > > >
> > > > > That's a bit frustrating.
> > > > >
> > > >
> > > > I know and I'm sorry. I admit that this is not the best time to try=
 to
> > > > get new features in.
> > > >
> > > > > Perhaps you could make the master branch contain the code you're
> > > > > working on (instead of next), if you plan on abandoning the curre=
nt
> > > > > code base?
> > > >
> > > > I can't just yet. I want to keep the codebase bisectable and only
> > > > merge the new API into master once it's complete for the C, C++ and
> > > > Python parts. The branch called next/libgpiod-2.0 contains the WIP
> > > > changes but they are not complete yet. I just posted the test suite
> > > > for C and plan on posting the complete C++ bindings soon.
> > > >
> > > > In fact - we discussed it with Kent and Linus and I expect to be ab=
le
> > > > to release the v2 in around two months and merge the new API into
> > > > master in a month.
> > > >
> > > > You can base your work on next/libgpiod-2.0 but could you just hold
> > > > off the new features until after the new API is in master?
> > > >
> > >
> > > I'm thinking that we should be re-visting the tools as part of the
> > > switch to libgpiod v2, as a major version bump is our only opportunit=
y
> > > to make sweeping changes.
> > >
> >
> > Yes and no. I'm not very happy about making the very command-line
> > users that we managed to convince to switch away from sysfs to using
> > gpio-tools angry again with totally incompatible changes in v2.
> >
>
> Oh, I know - I've made that same point myself.
> But it cuts both ways - if you don't fix things now you never will.
> Make current users angry, or make future users confused and angry.
> Your call.
>
> Of course my prefered option is an interface that will satisfy both
> current and future users, but I seriously doubt we can get there if we
> maintain backward compatibility for the sake of current users.
>

You opened a can of worms below. :)

> > > I have to admit I was not initially in favour of the by-name option, =
as
> > > it is hideously inefficient compared to the offset version.  What was
> > > one or two ioctl calls could now be dozens, if not more.
> > > And the thought of that happening everytime a user wants to toggle a
> > > single line makes my skin crawl.
> > >
> > > However, in light of our recent discussions, I think we need it as an
> > > option.  But I would prefer to revise the tool command lines so lines
> > > can be identified by name or offset.  The named option should be the
> > > simplest, and so not require a --by-name flag.
> > > My current thinking is that the chip should become an optional arg,
> > > rather than a positional arg.
> > > So [-c <chip>] <line>...
> > > e.g.
> > >     gpioset GPIO17=3Dactive GPIO22=3D1
> > > or
> > >     gpioset -c gpiochip0 17=3D1 LED=3Doff
> > >
> > > similarly get:
> > >
> > >     gpioget GPIO17 GPIO22
> > > or
> > >     gpioget -c gpiochip0 17 LED
> > >
> > > If the chip is not specified then the line identifier must be a name.
> > > If the chip is specified then the line identifier is interpreted as a=
n
> > > offset if it parses as an int, else a name.
> > > Either way, if multiple lines are provided then they must be on the o=
ne
> > > chip.
> > > That all hinges on the assumption that line names are never simply
> > > stringified integers, or at least if they are then it matches the
> > > offset.  Is that viable?
> > >
> >
> > We cannot make that assumptions and I would prefer to stay both
> > compatible AND explicit here. As in: work with offsets by default and
> > with names as an option. On the other hand - if we specify --by-name,
> > I'm fine with skipping the chip parameter and let the program look up
> > the line among all chips.
> >
>
> I'm thinking that most users would prefer to work with names.
> And that preference will only grow stronger over time.
> I'm starting to lean that way myself.
>

Ok, I may get convinced but we'd need something that behaves
consistently and predictably. A GPIO line name can still parse as an
unsigned integer so we cannot make assumptions here. Maybe --by-name
or --by-offset should always be required?

> So you are happy with positional chip by default, but optional when
> --by-name is set?  That is going to make command line parsing even more
> fun, but ok.
>
> So your acceptible forms would be (using get for brevity):
>     gpioget gpiochip0 16 17 23
>     gpioget --by-name GPIO16 GPIO17 GPIO23
>     gpioget --by-name -c gpiochip0 GPIO16 GPIO17 GPIO23
>
> ?
>
> > > The sets should also accept a set of true/false variants, such as the
> > > on/off, active/inactive in the examples above.
> >
> > Why though? What do we gain from accepting all kinds of different
> > strings? IMO it just makes the interface less clear.
> >
>
> All kinds?  I suggested two variants.  That is all, not the whole thesaur=
us.
> I explicitly avoid 0/1 and low/high, cos line levels.
> Could be convinces to accept 0/1 for backward compatibility.
>
> Users can then use a nomenclature that best suits their application.
> That makes their scripts more readable.  And much more meaningful than
> 0/1. I mean 0/1 is literally the least amount of information you could
> possibly provide.
>

Do you think we should also use this naming in the library? As in:

enum {
    GPIOD_LINE_STATE_ACTIVE =3D 1,
    GPIOD_LINE_STATE_INACTIVE =3D 0
};

And corresponding scoped enums in C++ and Python?

> While the active-low option exists, setting line=3D1 will always be
> confusing.  Dropping the active-low option for set would mean it
> operates with physical levels, while the other commands use logical,
> so don't really want to go there either....
>
> (I have also wondered if having the active-low option in the uAPI
> is actually beneficial in general, but that bird has flown.)
>
> > > The gets should return active/inactive to make it clear they refer to
> > > logical values, not physical values.
> > >
> >
> > What's wrong with 1/0?
> >
>
> As stated, that can easily be misinterpreted as meaning physical line lev=
els.
> And the logical and physical levels are not the same if active-low,
> and the get command gives no indication if the active-low is set or not.
>

Right.

> > > I am also wondering why the tools are separate, instead of being merg=
ed
> > > into a single tool.  Is there a reason for that?
> > >
> >
> > You mean like busybox' single executable with multiple links under
> > different names internally redirecting to different main() functions
> > or really a single tool with multiple commands?
> >
>
> One advantage of a single tool is that when you add a new one, say
> watch, it just gets added to the tool and pops up in the tool help.
> So it aids discoverabilty.
>
> And adding commands doesn't automatically require an extra binary to be
> built and installed - just upgrading the one.
>
> The busy-box command-link approach is an option, with the link name
> determining the subcommand. Or it can be called directly with subcommands=
.
> e.g. gpiodctl set gpiochip0 16=3D0
>

I can work with that.

> Wrt backward compatibility, perhaps add an option to behave as per v1,
> so current users can just add that until they migrate to the v2 command
> line?
> When called directly it could use the v2 command line, but when called
> via a link, it could enable the v1 option and support the v1 command line=
.
> Or is that just confusing too?
>
> > The reason for having separate tools is that they really are tiny, the
> > little code they share and statically link to is negligible and it's
> > simply clearer as to which tool does what. I didn't want the tools to
> > be this swiss-knife do-it-all program that requires studying the
> > README for a long time.
> >
>
> Who needs the README - the tool help should be sufficient.
> If not then fix the help.
>
> They might be tiny, but collectively they can't be smaller than a unified
> executable.
> Are there cases where only a subset of commands is deployed?
> Though even that could be addressed with build options to drop subcommand=
s
> from the tool.
>

Indeed.

> > > I've got a bunch of other minor changes that I've been trialing in my
> > > Rust library.  So I have a working prototype of the set --interactive
> > > that I had mentioned.  I scrapped the batch option - it doesn't
> > > add much that the interactive mode and a named pipe doesn't already g=
ive
> > > you.
> > >
> >
> > gpioset --interactive is definitely something I'm interested in.
> >
>
> Yeah, it also solves most of my discomfort with the named option - it
> only does the find once and caches the offset for subsequent sets.
> The best of both worlds.
>
> Would adding a find ioctl to the uAPI be worthwhile?
>

I don't think so and the reason for that is this: if you want maximum
performance, you should be ready to spend time and use the C API. The
command line tools aren't meant to be fast. I suppose you spend more
time forking and execing than looking up names frankly. The DBus API
and gpioset --interactive will most likely solve this issue anyway.

> > > But I digress.  The main thing I want to achieve here is to determine
> > > where you want to go with the tools for v2, and what any contraints
> > > might be.  Then we can take it from there.
> > >

Ok, let's think about what we must do before v2 and what can be
implemented later without breaking compatibility again.

> >
> > While the total overhaul of the library is understandable, I would
> > prefer to keep the tools mostly backward compatible. I plan on adding
> > gpiowatch for watching info events but that's it. Do you see any
> > things that are obviously wrong in how the tools work that would
> > justify the sweeping changing you mention?
> >
>
> Other than the named mode...
>
> The set is the one that bothers me the most.
> The --mode is a bit confusing. Most of them map to the same thing,
> and I can get the same effect with --interactive and/or a hold period.
> (the hold period being a forced sleep after a set.  That comes in handy
> in the interactive mode where you can just hammer out sets and the hold
> period defines the rate they will be applied, so blinking or even
> bit-bashing becomes super easy)

Given that - as someone pointed out recently - some users find it
difficult to "gpioget `gpiofind GPIO0`" (hence the whole --by-name
idea) I expect they would find it even harder to fiddle with pipes and
other shellnanigans.

>
> Time periods should be a single option that includes the time units,
> e.g. -p 10ms is more readable than -u 10000000 (how many zeros is that??)
>
> And I'm pondering a toggle/blink mode, which would toggle the requested
> lines at the rate defined by the hold period.  So a simple blinker would
> be:
>     gpioset --by-name --blink -p 1s LED=3Don
>
> And a corresponding toggle command for the interactive mode.
> (which could specify a subset of lines to toggle, or toggle the whole
> set)
>
> If you want to retain backward compatibility then adding these
> features, without removing the old, will produce a cluttered, messy
> and really confusing gpioset interface.  And that is the tool most
> likely to see use :(.
>

Doesn't really look like it to me for the three examples above, but
I'm not entirely against non-compatible changes. I would just prefer
to keep a similar look and feel.

> Wrt gpioinfo, I'm not sure the quotes on the name and consumer in the
> output helps.

You mean for programmatic parsing? For a human reader this doesn't
really matter, does it?

> And I'd restrict the chip option to a single chip, else
> all chips.  No subset option, to be consistent with other tools
> and to allow the option of selecting the line or a subset of lines,
> either by offset or name.
> e.g. who is consuming the LED line?
>     gpioinfo --by-name LED
>
> gpiofind should have a chip option to limit searching (names are only
> unique within chips, right, or is even that still not guaranteed?),
> and an option to provide the info for found lines - since we have it in
> hand anyway.
>
> gpiodetect could get a chip option, so only get the info for the chip
> of interest (to ignore those orphaned gpio-sims ;-).
>

Touch=C3=A9.

> gpiomon should provide sequence numbers.  Maybe an option to return the
> whole event in JSON?
>

Sure, sequence numbers are already on my TODO list just like any other
new information that's passed over v2 ABI.

> Anyway, in short, if backward compatibility is a requirement then I'm
> really not sure how best to proceed - except now I need another coffee.
>

Let's say that I'm open to breaking changes but I would like to limit
them wherever we can unlike the library.

I won't get to it though before we merge v2 API into master, so going
back to writing C++ tests. :)

Bart

> Cheers,
> Kent.
