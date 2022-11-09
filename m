Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFA28622188
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 03:00:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbiKICAk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Nov 2022 21:00:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbiKICAg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2022 21:00:36 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBD5768C7B
        for <linux-gpio@vger.kernel.org>; Tue,  8 Nov 2022 18:00:27 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id o7so15427425pjj.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Nov 2022 18:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZL1Y5UTKqoAapLe5Almtm20PAz4W9RFwZ4EtZylDLXw=;
        b=b80UdXVxxSBRdHPRYkXNEgnS+8MsMJzcw/E7Exgw00w/aCw2Y6zIcIQde1+sbZ+r5s
         E86teT3/mmzDPu+CYPpuyfyac9G3dfmaOgfJrfjVGI0Cyzm7pvPoz6FA7yJWVC2I21Ud
         t/tfvia1PIfOV1SShIqkN2gjemHlWhgJ33Zwj4xw6kB9moDqmF2yUDehQ/V90TQBM6jL
         3xLI7fTEbKD6zsE0F6c+MtEVOgyipaqSaYd5EruMMGrARujWLQXQdtddYx6hLYOt4355
         ldE2sXE0YLjSzg2utushvF5iZGvZWGR/+G6Qneb/J2kIjYJ+4mqgtE52BU6plmj7uG/y
         LYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZL1Y5UTKqoAapLe5Almtm20PAz4W9RFwZ4EtZylDLXw=;
        b=pkaDcp2xHFDfGyKjhdFqEJXZACdxHiPOuxjUe8guXaim1I/FErmmgBqs7hSwtRpb0F
         fVxi6FbOoC3cpmSO8YPM95VHEMfacmNzzUJpyBSwY67qdtXnf1CgA3urrYc186Sq2r+n
         An0FNIOJzGQ+KIehVa+arZMCo9sSbdTIbRWBioXvjJmCRrOx+1HhFi4Suywove2sGQBV
         m1msXrFYNqEZ6ytNUdkreeoVxlFd1JVMAVhhrZINnKVRak/7PMiWDMmA/AEpwyl/lh8K
         IM0u2J2H4oW7NTKQdlC67ccLNIGjnULv2z2kSm8D7OGB4bZWSf2sVv2TMabw6UBvgMeO
         T6/w==
X-Gm-Message-State: ACrzQf1oBBWwSLdtTssqUlem5GyrJ0dr66g5N9w3Doe0Yj2Bn5dUpAo9
        CX7KGxNs3lFqlIo+OkhE45xGLQA0pWM=
X-Google-Smtp-Source: AMsMyM7qOCeCHDvMmmCik3lR4obrPwPIHGxMLLiCeicMN7eTqvz5b75ccxrQOtFbjTdKW2vMJIQZPw==
X-Received: by 2002:a17:90b:1bc1:b0:213:e2af:b1f4 with SMTP id oa1-20020a17090b1bc100b00213e2afb1f4mr51296944pjb.47.1667959227201;
        Tue, 08 Nov 2022 18:00:27 -0800 (PST)
Received: from sol (14-200-229-209.tpgi.com.au. [14.200.229.209])
        by smtp.gmail.com with ESMTPSA id h10-20020a17090a2eca00b00205db4ff6dfsm6648457pjs.46.2022.11.08.18.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 18:00:26 -0800 (PST)
Date:   Wed, 9 Nov 2022 10:00:23 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v3 2/5] tools: line name focussed rework
Message-ID: <Y2sJt+IUuBB556+b@sol>
References: <20221011002909.26987-1-warthog618@gmail.com>
 <20221011002909.26987-3-warthog618@gmail.com>
 <CAMRc=Mf=x3iKyvzj63CX1Jgj4fsQKXbHHwcSpLbsvF-teb8Rag@mail.gmail.com>
 <Y2p2u7oCQ/fToeLw@sol>
 <CAMRc=MdYfHpJDfBiG3+F-p+H99wbekmF12VVNhjcMr=Hd9=56w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdYfHpJDfBiG3+F-p+H99wbekmF12VVNhjcMr=Hd9=56w@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 08, 2022 at 07:25:27PM +0100, Bartosz Golaszewski wrote:
> On Tue, Nov 8, 2022 at 4:33 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Tue, Nov 08, 2022 at 02:13:20PM +0100, Bartosz Golaszewski wrote:
> > >  On Tue, Oct 11, 2022 at 2:29 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > Rework the tool suite to support identifying lines by name and to
> > > > support operating on the GPIO lines available to the user at once, rather
> > > > than on one particular GPIO chip.
> > > >
> > > > All tools, other than gpiodetect, now provide the name to (chip,offset)
> > > > mapping that was previously only performed by gpiofind. As names are not
> > > > guaranteed to be unique, a --strict option is provided for all tools to
> > > > either abort the operation or report all lines with the matching name, as
> > > > appropriate.
> > > > By default the tools operate on the first line found with a matching name.
> > > >
> > > > Selection of line by (chip,offset) is still supported with a --chip
> > > > option, though it restricts the scope of the operation to an individual
> > > > chip.  When the --chip option is specified, the lines are assumed to be
> > > > identified by offset where they parse as an integer, else by name.
> > > > To cater for the unusual case where a line name parses as an integer,
> > > > but is different from the offset, the --by-name option forces the lines
> > > > to be identified by name.
> > > >
> > > > The updated tools are intentionally NOT backwardly compatible with the
> > > > previous tools. Using old command lines with the updated tools will
> > > > almost certainly fail, though migrating old command lines is generally as
> > > > simple as adding a '-c' before the chip.
> > > >
> > >
> > > While at it: how about adding the --consumer/-C switch to specify a
> > > consumer string other than the name of the program?
> > >
> >
> > Ironically I added that to the Rust version, for the long lived
> > commands anyway, so it could better emulate the C version for testing
> > purposes.
> > But could be generally useful, so ok.
> >
> > I only used the long form there to avoid confusion with -c (as they are
> > visually very similar) and following the principle that rarely used
> > options only get a long form, so I will omit the short -C option - unless
> > you insist.
> >
> 
> I don't see why it would hurt but I'm fine either way.
> 

It would only be a problem if the consumer name matched with a gpiochip,
and that seems unlikely. And no other use for -C seems likely either, so I
guess you are right - it wouldn't hurt.

> > > > In addition the individual tools are modified as follows:
> > > >
> > > > gpiodetect:
> > > >
> > > > Add the option to select individual chips.
> > > >
> > > > gpioinfo:
> > > >
> > > > Change the focus from chips to lines, so the scope can be
> > > > an individual line, a subset of lines, all lines on a particular chip,
> > > > or all the lines available to the user.  For line scope a single line
> > > > summary is output for each line.  For chip scope the existing format
> > > > displaying a summary of the chip and each of its lines is retained.
> > > >
> > > > Line attributes are consolidated into a list format, and are extended
> > > > to cover all attributes supported by uAPI v2.
> > > >
> > >
> > > One change in the output that bothers me is the removal of quotation
> > > marks around the line name and consumer. I did that in v1 to visually
> > > distinguish between unnamed/unused lines and those that are named. I
> > > know it's highly unlikely that a line would be named "unnamed" (sic!)
> > > but still:
> > >
> > > line 0: "foo"
> > > line 1: unnamed
> > >
> > > looks more intuitive to me.
> >
> > I disagree on this one. In the longer term all lines should be named
> > and then the quotes just become pointless noise, and require more
> > work to parse.
> >
> 
> I insist on this one as just a quick glance at the current values of
> gpio-line-names DT properties in the kernel show all kinds of funky
> names - not only including spaces but also various other characters
> like [, ], #, /, - and that not. I think it makes a lot of sense to
> delimit them visually with quotes.
> 

Good grief, what a mess.  Would've been nice to have some naming
conventions in place, but too late now...

Which reminds me - any guarantees the name, particularly the consumer
name, is valid UTF-8?
If not then need to double check how the Rust bindings deal with that.
Throwing a utf8_error would not be appropriate if it isn't guaranteed to
be UTF-8.

> > >Same for the consumer as with your current
> > > version, if the consumer string has spaces in it, it will look like
> > > this: consumer=foo bar. I think consumer="foo bar" would be easier to
> > > parse.
> >
> > For this very reason, the consumer is explicitly listed last, so the
> > consumer name matches everything between the "consumer=" and end of
> > line.
> >
> > Unless consumer names with spaces are very common in the wild then
> > quotes only add more clutter.
> >
> 
> We can't know, but instead of putting it last, I'd just treat it like
> every other flag and instead delimit the name with "".

It is also last based on length predicatability - more predicatable
first, and the other attributes are more predictable.

> 
> The tool is mostly aimed at humans anyway and if someone's brave
> enough to parse the output with a script then a cut-based one-liner is
> all they need, no?
> 

Sure, but don't underestimate the ability of users to complain when a
tool isn't quite as easy to use as they would like.

Hmmm, how about an option to quote all string attributes?
Say --quoted?
Or if quoted is the default then --unquoted to remove the clutter?

<snip>
> >
> > > > Remove the --mode, --sec, and --usec options.
> > > > The combination of hold period and interactive mode provide functionality
> > > > equivalent to the old --mode options.
> > > >
> > >
> > > I have one problem with that - I think the basic functionality of:
> > > "take a line, set its value and wait for a signal" would still be
> > > useful. As it is now, I'm not sure how to make gpioset just hold a
> > > line without calling the GPIO_V2_LINE_SET_VALUES_IOCTL ioctl
> > > periodically.
> > >
> >
> > I forgot to mention the daemonize option here, so
> >
> > gpioset -z myline=1
> >
> > will do that.
> >
> > (or
> >
> > gpioset -i myline=1
> >
> > if you want to keep the process in the foreground.)
> >
> > I'll add something to the daemonize help to highlight that it will hold
> > the line until killed. Is that sufficient?
> >
> 
> What if I don't want to daemonize the program nor open the interactive
> mode? Why not just make the default behavior of `gpioset foo=active`
> be: stay alive until interrupted? The current immediate exiting is
> mostly useless anyway.
> 

Hmmm, not when used with the --hold-period, so a script could call a
series of gpiosets to generate a waveform.  Though that doesn't work
well, as the line is released between sets, and the whole point of
the toggle option and interactive modes is to provide better
alternatives for doing that.

So yeah, true - I guess I just blindly followed the v1 behaviour on that.
- the standard behaviour should be to not exit.
The only exception being a zero-terminated toggle sequence.

That should also reduce the chance of users complaining that gpioset
doesn't work where they assume the set persists after gpioset exists.
OTOH I'm willing to bet we get at least one complaint that gpioset
hangs... :|.

<snip>
> 
> > > > +
> > > > +// minimal version similar to tools-common that indicates if a line should be
> > > > +// printed rather than storing details into the resolver.
> > > > +// Does not die on non-unique lines.
> > >
> > > C-style comments only please. Same elsewhere.
> > >
> >
> > Yeah - sorry again - I'm so used to that style that I don't even notice
> > I'm doing it.
> >
> > > <snip>
> > >
> > > I like the new tools in general. I don't have many issues with the
> > > code - you are a much better coder than I am.
> >
> > That's being a bit harsh.
> >
> > One thing I was considering was reworking the resolver so it would be
> > more suitable for general use, and move it to core libgpiod so apps
> > could more readily perform line name discovery.
> >
> 
> Hmm, I think it's unnecessary clutter in the library. I was thinking
> about whether to put the upcoming fdinfo parsing into the library and
> figured that it's more of a suitable candidate for a new command-line
> tool as the library should focus on the character device exclusively
> IMO.
> 

I think you were right the first time.  The fdinfo is another aspect of
the cdev GPIO uAPI - it isn't just the ioctls.
If the GPIO uAPI were extended to use AIO, would that not go in libgpiod as
well?

And agreed that fdinfo warrants another tool.

It makes sense to me to add higher level abstractions or functionality
where that greatly simplifies apps.
Speaking from experience, looking up up the line chip/offset based on
name is at best tedious and at worst a serious PITA.
If it isn't available in libgpiod then apps are more likely to do it
out-of-band, such as by using gpioinfo to generate app configuration,
or just stick to specifying lines by chip/offset, which is a bit sad.

But, as per the unified tool binary, this can always be added later.

Cheers,
Kent.
