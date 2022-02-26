Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9806F4C56E3
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Feb 2022 17:47:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232378AbiBZQsA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 26 Feb 2022 11:48:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232377AbiBZQr7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 26 Feb 2022 11:47:59 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1531926D
        for <linux-gpio@vger.kernel.org>; Sat, 26 Feb 2022 08:47:23 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id w37so7622831pga.7
        for <linux-gpio@vger.kernel.org>; Sat, 26 Feb 2022 08:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=cerHX73EjX5oUYliqR78hPtg/KEqPlGreVp5vgOAjrc=;
        b=qNSjcvRMcxwL4Fv29fvqxXx25qorwMksM5gV8xUklbruXzoBg+PSxM/tnB9f1bQkVi
         DEjX4vBxseh2tR6rsErrf3kjpu6rSV1vENAE62/LHtHp6746+ynphQUz/ZC0FVlyvENf
         bysLzR4IfKBwvsybTOoCnEUxXSOycyZOoZgtnDdMrnCUtHAJDyZX3LVnEI7nvTFcCg59
         G5PoBUCNarvF58fuYsWIaes4WPOzb8fEYjlsozSWgH4kJlXZOkcphH4lyupvUQ9iLyu4
         FVDWB4tcznc9VvUEIklY6e3zZfNEtYkCZ9YsxCReBITd9GbV4B+X3GBiZId5pcuX31NY
         y9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=cerHX73EjX5oUYliqR78hPtg/KEqPlGreVp5vgOAjrc=;
        b=r67miCgT6wedKw8ZQEzYxEosfZBn/3lX//44mifNzmO42X87z9P1MNOrgwGd7sLrbY
         CSLx8cNnAnLJWsm2wWulDCVQI8XfUhQKwuLdlfNij1BCZ3pVinQaJCcK8xIM8j0pFugI
         v8pGOEqRIfq8FOVEv0QG4boU8c/WTh4hyCv/J2McySKJBVHtoiKRv82bw8T0YVVlIdM3
         i14PGoZIu3grpVaabjcqf3rFvfcjsbbaCWIhEWlAdDhtjvRDl+5VzIlzMiVFZkCiBhqf
         C9SiRisBzyViWOwCdaHsau9TqvsJQbkRfEO4i19Faco/lRcmE9hbTqk55o3kp4QxAujW
         UbYA==
X-Gm-Message-State: AOAM5327gBuUuQ7kbtrTJ8l0vXgH7WND8lNd4GBhkAp1ooNw8T39ZO3e
        J2yGtxEbyUZt+lK4z1/9Pms=
X-Google-Smtp-Source: ABdhPJwdxtUYXBonxX83qko3q0JSSic3g/ApKiNFxqmCZ/z+gwVn62xyEK4dYe7OJfK9FjYcHj/Ezg==
X-Received: by 2002:a05:6a00:15d5:b0:4f0:fbeb:6007 with SMTP id o21-20020a056a0015d500b004f0fbeb6007mr13499217pfu.17.1645894042093;
        Sat, 26 Feb 2022 08:47:22 -0800 (PST)
Received: from sol (60-242-155-106.static.tpgi.com.au. [60.242.155.106])
        by smtp.gmail.com with ESMTPSA id lp5-20020a17090b4a8500b001b95890248fsm5953058pjb.27.2022.02.26.08.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Feb 2022 08:47:21 -0800 (PST)
Date:   Sun, 27 Feb 2022 00:47:17 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Joel Stanley <joel@jms.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod PATCH] core: Fix line_bulk_foreach_line invalid memory
 access
Message-ID: <20220226164717.GA43372@sol>
References: <20220202114204.31918-1-joel@jms.id.au>
 <CAMRc=MdJX0H1i=UjvHS15+yi+LYgYEyw3puavCwL878gsQWivA@mail.gmail.com>
 <CAMRc=McUht0K+=86VfV7Z8kOU+DMoaYbX65_CrA8WVVE9XhxvA@mail.gmail.com>
 <CACPK8XeN9Ym8wGVmZ15HprGb+UePY51tmcptC2o9zbUgTcP6HQ@mail.gmail.com>
 <CAMRc=McSdV9pxxyiHWeD-nr0VKcchEG7LnT=Z8f8f8pqd_USOQ@mail.gmail.com>
 <20220225150801.GA179640@sol>
 <CAMRc=MfmvyCg+Xpir_+6HUjcpgtmRx9FjG3Fx4iG55X8NP=UNQ@mail.gmail.com>
 <20220226040150.GA6586@sol>
 <CAMRc=Mfv99=5dj1Dot8iQsVt7K0VtsEz32MAvpMwFarSuUjTQg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mfv99=5dj1Dot8iQsVt7K0VtsEz32MAvpMwFarSuUjTQg@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Feb 26, 2022 at 03:34:19PM +0100, Bartosz Golaszewski wrote:
> On Sat, Feb 26, 2022 at 5:01 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Fri, Feb 25, 2022 at 10:55:25PM +0100, Bartosz Golaszewski wrote:
> > > On Fri, Feb 25, 2022 at 4:08 PM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > >
> > > [snip]
> > >
> > > > > >
> > > > > > That's a bit frustrating.
> > > > > >
> > > > >
> > > > > I know and I'm sorry. I admit that this is not the best time to try to
> > > > > get new features in.
> > > > >
> > > > > > Perhaps you could make the master branch contain the code you're
> > > > > > working on (instead of next), if you plan on abandoning the current
> > > > > > code base?
> > > > >
> > > > > I can't just yet. I want to keep the codebase bisectable and only
> > > > > merge the new API into master once it's complete for the C, C++ and
> > > > > Python parts. The branch called next/libgpiod-2.0 contains the WIP
> > > > > changes but they are not complete yet. I just posted the test suite
> > > > > for C and plan on posting the complete C++ bindings soon.
> > > > >
> > > > > In fact - we discussed it with Kent and Linus and I expect to be able
> > > > > to release the v2 in around two months and merge the new API into
> > > > > master in a month.
> > > > >
> > > > > You can base your work on next/libgpiod-2.0 but could you just hold
> > > > > off the new features until after the new API is in master?
> > > > >
> > > >
> > > > I'm thinking that we should be re-visting the tools as part of the
> > > > switch to libgpiod v2, as a major version bump is our only opportunity
> > > > to make sweeping changes.
> > > >
> > >
> > > Yes and no. I'm not very happy about making the very command-line
> > > users that we managed to convince to switch away from sysfs to using
> > > gpio-tools angry again with totally incompatible changes in v2.
> > >
> >
> > Oh, I know - I've made that same point myself.
> > But it cuts both ways - if you don't fix things now you never will.
> > Make current users angry, or make future users confused and angry.
> > Your call.
> >
> > Of course my prefered option is an interface that will satisfy both
> > current and future users, but I seriously doubt we can get there if we
> > maintain backward compatibility for the sake of current users.
> >
> 
> You opened a can of worms below. :)
> 

Well everyone should be good at something.

> > > > I have to admit I was not initially in favour of the by-name option, as
> > > > it is hideously inefficient compared to the offset version.  What was
> > > > one or two ioctl calls could now be dozens, if not more.
> > > > And the thought of that happening everytime a user wants to toggle a
> > > > single line makes my skin crawl.
> > > >
> > > > However, in light of our recent discussions, I think we need it as an
> > > > option.  But I would prefer to revise the tool command lines so lines
> > > > can be identified by name or offset.  The named option should be the
> > > > simplest, and so not require a --by-name flag.
> > > > My current thinking is that the chip should become an optional arg,
> > > > rather than a positional arg.
> > > > So [-c <chip>] <line>...
> > > > e.g.
> > > >     gpioset GPIO17=active GPIO22=1
> > > > or
> > > >     gpioset -c gpiochip0 17=1 LED=off
> > > >
> > > > similarly get:
> > > >
> > > >     gpioget GPIO17 GPIO22
> > > > or
> > > >     gpioget -c gpiochip0 17 LED
> > > >
> > > > If the chip is not specified then the line identifier must be a name.
> > > > If the chip is specified then the line identifier is interpreted as an
> > > > offset if it parses as an int, else a name.
> > > > Either way, if multiple lines are provided then they must be on the one
> > > > chip.
> > > > That all hinges on the assumption that line names are never simply
> > > > stringified integers, or at least if they are then it matches the
> > > > offset.  Is that viable?
> > > >
> > >
> > > We cannot make that assumptions and I would prefer to stay both
> > > compatible AND explicit here. As in: work with offsets by default and
> > > with names as an option. On the other hand - if we specify --by-name,
> > > I'm fine with skipping the chip parameter and let the program look up
> > > the line among all chips.
> > >
> >
> > I'm thinking that most users would prefer to work with names.
> > And that preference will only grow stronger over time.
> > I'm starting to lean that way myself.
> >
> 
> Ok, I may get convinced but we'd need something that behaves
> consistently and predictably. A GPIO line name can still parse as an
> unsigned integer so we cannot make assumptions here. Maybe --by-name
> or --by-offset should always be required?
> 

Agreed, that is why I've been kicking around alternatives.

There really are cases of lines with integer names?
That don't match the offset?
Then we would need an option to force --by-name, even if the name parses
as an integer.

Don't like the mandatory option idea - the most common use case
shouldn't require options.

If you are going to have mandatory options then you might as well have
two separate subcommands, such as set_by_name and set_by_offset.
Not that I am suggesting that - just saying.
 
> > So you are happy with positional chip by default, but optional when
> > --by-name is set?  That is going to make command line parsing even more
> > fun, but ok.
> >
> > So your acceptible forms would be (using get for brevity):
> >     gpioget gpiochip0 16 17 23
> >     gpioget --by-name GPIO16 GPIO17 GPIO23
> >     gpioget --by-name -c gpiochip0 GPIO16 GPIO17 GPIO23
> >
> > ?
> >
> > > > The sets should also accept a set of true/false variants, such as the
> > > > on/off, active/inactive in the examples above.
> > >
> > > Why though? What do we gain from accepting all kinds of different
> > > strings? IMO it just makes the interface less clear.
> > >
> >
> > All kinds?  I suggested two variants.  That is all, not the whole thesaurus.
> > I explicitly avoid 0/1 and low/high, cos line levels.
> > Could be convinces to accept 0/1 for backward compatibility.
> >
> > Users can then use a nomenclature that best suits their application.
> > That makes their scripts more readable.  And much more meaningful than
> > 0/1. I mean 0/1 is literally the least amount of information you could
> > possibly provide.
> >
> 
> Do you think we should also use this naming in the library? As in:
> 
> enum {
>     GPIOD_LINE_STATE_ACTIVE = 1,
>     GPIOD_LINE_STATE_INACTIVE = 0
> };
> 

Yup, though all the functions return ints, so the user is free to
overlook that enum.

OTOH, my Rust library returns one of these from a get_value():

pub enum Value {
    /// The line is inactive.
    Inactive,
    /// The line is active.
    Active,
}

So no 0 or 1 anywhere, and no possible confusion.
Well, hopefully.

> And corresponding scoped enums in C++ and Python?
> 
> > While the active-low option exists, setting line=1 will always be
> > confusing.  Dropping the active-low option for set would mean it
> > operates with physical levels, while the other commands use logical,
> > so don't really want to go there either....
> >
> > (I have also wondered if having the active-low option in the uAPI
> > is actually beneficial in general, but that bird has flown.)
> >
> > > > The gets should return active/inactive to make it clear they refer to
> > > > logical values, not physical values.
> > > >
> > >
> > > What's wrong with 1/0?
> > >
> >
> > As stated, that can easily be misinterpreted as meaning physical line levels.
> > And the logical and physical levels are not the same if active-low,
> > and the get command gives no indication if the active-low is set or not.
> >
> 
> Right.
> 
> > > > I am also wondering why the tools are separate, instead of being merged
> > > > into a single tool.  Is there a reason for that?
> > > >
> > >
> > > You mean like busybox' single executable with multiple links under
> > > different names internally redirecting to different main() functions
> > > or really a single tool with multiple commands?
> > >
> >
> > One advantage of a single tool is that when you add a new one, say
> > watch, it just gets added to the tool and pops up in the tool help.
> > So it aids discoverabilty.
> >
> > And adding commands doesn't automatically require an extra binary to be
> > built and installed - just upgrading the one.
> >
> > The busy-box command-link approach is an option, with the link name
> > determining the subcommand. Or it can be called directly with subcommands.
> > e.g. gpiodctl set gpiochip0 16=0
> >
> 
> I can work with that.
> 
> > Wrt backward compatibility, perhaps add an option to behave as per v1,
> > so current users can just add that until they migrate to the v2 command
> > line?
> > When called directly it could use the v2 command line, but when called
> > via a link, it could enable the v1 option and support the v1 command line.
> > Or is that just confusing too?
> >
> > > The reason for having separate tools is that they really are tiny, the
> > > little code they share and statically link to is negligible and it's
> > > simply clearer as to which tool does what. I didn't want the tools to
> > > be this swiss-knife do-it-all program that requires studying the
> > > README for a long time.
> > >
> >
> > Who needs the README - the tool help should be sufficient.
> > If not then fix the help.
> >
> > They might be tiny, but collectively they can't be smaller than a unified
> > executable.
> > Are there cases where only a subset of commands is deployed?
> > Though even that could be addressed with build options to drop subcommands
> > from the tool.
> >
> 
> Indeed.
> 
> > > > I've got a bunch of other minor changes that I've been trialing in my
> > > > Rust library.  So I have a working prototype of the set --interactive
> > > > that I had mentioned.  I scrapped the batch option - it doesn't
> > > > add much that the interactive mode and a named pipe doesn't already give
> > > > you.
> > > >
> > >
> > > gpioset --interactive is definitely something I'm interested in.
> > >
> >
> > Yeah, it also solves most of my discomfort with the named option - it
> > only does the find once and caches the offset for subsequent sets.
> > The best of both worlds.
> >
> > Would adding a find ioctl to the uAPI be worthwhile?
> >
> 
> I don't think so and the reason for that is this: if you want maximum
> performance, you should be ready to spend time and use the C API. The
> command line tools aren't meant to be fast. I suppose you spend more
> time forking and execing than looking up names frankly. The DBus API
> and gpioset --interactive will most likely solve this issue anyway.
>

Yeah, or they can switch to --by-offset.  Good call.

> > > > But I digress.  The main thing I want to achieve here is to determine
> > > > where you want to go with the tools for v2, and what any contraints
> > > > might be.  Then we can take it from there.
> > > >
> 
> Ok, let's think about what we must do before v2 and what can be
> implemented later without breaking compatibility again.
> 

I think this is doable in the timeframe you have in mind, so I would be
hoping to have it completed for v2.  The big sticking point is agreeing on
the command line options and behaviours.  The implementation should be
pretty straight forward given that.

> > >
> > > While the total overhaul of the library is understandable, I would
> > > prefer to keep the tools mostly backward compatible. I plan on adding
> > > gpiowatch for watching info events but that's it. Do you see any
> > > things that are obviously wrong in how the tools work that would
> > > justify the sweeping changing you mention?
> > >
> >
> > Other than the named mode...
> >
> > The set is the one that bothers me the most.
> > The --mode is a bit confusing. Most of them map to the same thing,
> > and I can get the same effect with --interactive and/or a hold period.
> > (the hold period being a forced sleep after a set.  That comes in handy
> > in the interactive mode where you can just hammer out sets and the hold
> > period defines the rate they will be applied, so blinking or even
> > bit-bashing becomes super easy)
> 
> Given that - as someone pointed out recently - some users find it
> difficult to "gpioget `gpiofind GPIO0`" (hence the whole --by-name
> idea) I expect they would find it even harder to fiddle with pipes and
> other shellnanigans.
> 

Different use cases.  They just wanted to get a line by name.

Whereas I'm talking about someone wanting to quickly prototype a driver
for an LED string or stepper motor or something.
So a more complex use case and so more likely to put in the extra effort.
And helping to cover the ground where pulling out a full on programming
language API feels like overkill.

> >
> > Time periods should be a single option that includes the time units,
> > e.g. -p 10ms is more readable than -u 10000000 (how many zeros is that??)
> >
> > And I'm pondering a toggle/blink mode, which would toggle the requested
> > lines at the rate defined by the hold period.  So a simple blinker would
> > be:
> >     gpioset --by-name --blink -p 1s LED=on
> >
> > And a corresponding toggle command for the interactive mode.
> > (which could specify a subset of lines to toggle, or toggle the whole
> > set)
> >
> > If you want to retain backward compatibility then adding these
> > features, without removing the old, will produce a cluttered, messy
> > and really confusing gpioset interface.  And that is the tool most
> > likely to see use :(.
> >
> 
> Doesn't really look like it to me for the three examples above, but
> I'm not entirely against non-compatible changes. I would just prefer
> to keep a similar look and feel.
> 
> > Wrt gpioinfo, I'm not sure the quotes on the name and consumer in the
> > output helps.
> 
> You mean for programmatic parsing? For a human reader this doesn't
> really matter, does it?
> 

I am actually concerned about the human reader.
Is this easy to read:

	line  41:  "PWM1_MOSI"       unused   input  active-high
	line  42: "STATUS_LED_G_CLK" "led0" output active-high [used]
	line  43: "SPIFLASH_CE_N" unused input active-high
	line  44:       "SDA0"       unused   input  active-high
	line  45:       "SCL0"       unused   input  active-high
	line  46: "RGMII_RXCLK" unused input active-high

As unquoted unnamed and unused are possible, parsing the current
line is non-trivial.
Is there actually a use case for parsing the name and consumer?

I replaced the quotes with tabs in my gpioinfo.  It is easier for a
human to parse, and programmatically as well:

	line  41:	PWM1_MOSI       	unused      [input]
	line  42:	STATUS_LED_G_CLK	led0        [output, used]
	line  43:	SPIFLASH_CE_N   	unused      [input]
	line  44:	SDA0            	unused      [input]
	line  45:	SCL0            	unused      [input]
	line  46:	RGMII_RXCLK     	unused      [input]

Or are there names containing tabs?
Any lines named "unnamed" and consumers called "unused" could be
problematic, but anyone doing that deserves what they get.

Oh, and I find the left alignment is more readable for lines with the
same prefix, e.g. SPI_xxx

> > And I'd restrict the chip option to a single chip, else
> > all chips.  No subset option, to be consistent with other tools
> > and to allow the option of selecting the line or a subset of lines,
> > either by offset or name.
> > e.g. who is consuming the LED line?
> >     gpioinfo --by-name LED
> >
> > gpiofind should have a chip option to limit searching (names are only
> > unique within chips, right, or is even that still not guaranteed?),
> > and an option to provide the info for found lines - since we have it in
> > hand anyway.
> >
> > gpiodetect could get a chip option, so only get the info for the chip
> > of interest (to ignore those orphaned gpio-sims ;-).
> >
> 
> Touché.
> 
> > gpiomon should provide sequence numbers.  Maybe an option to return the
> > whole event in JSON?
> >
> 
> Sure, sequence numbers are already on my TODO list just like any other
> new information that's passed over v2 ABI.
> 
> > Anyway, in short, if backward compatibility is a requirement then I'm
> > really not sure how best to proceed - except now I need another coffee.
> >
> 
> Let's say that I'm open to breaking changes but I would like to limit
> them wherever we can unlike the library.
> 
> I won't get to it though before we merge v2 API into master, so going
> back to writing C++ tests. :)
> 

Fair enough.  I wasn't expecting you to work on it - I was thinking it
was something that I would work on in parallel.  Or that maybe Joel
would be interested in chipping in on.  Even getting feedback on the
command line options from Joel or other gpiod users would be helpful.
I suppose we should hash out a proposal that we are ok with and then
post an RFC for general comment?

Cheers,
Kent.
