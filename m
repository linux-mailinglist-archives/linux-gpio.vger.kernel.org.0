Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C558622A07
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 12:17:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbiKILQ7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 06:16:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbiKILQn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 06:16:43 -0500
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BD1D3BA
        for <linux-gpio@vger.kernel.org>; Wed,  9 Nov 2022 03:16:34 -0800 (PST)
Received: by mail-vs1-xe36.google.com with SMTP id 128so16235908vse.6
        for <linux-gpio@vger.kernel.org>; Wed, 09 Nov 2022 03:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xrX7I/9VNLYSXITQnZ7kEaRTUTUazlj54WVvZt4J2cA=;
        b=Bzlc0fgZxftf6k076BuGuXOCFa9li9SXHLwzY/cT8KX3J4RXrTrAVfd2uIGYqR3hBY
         AjVB6yReooSmP+VFfkUkzl8sqOG+M4rHhJdVFiHFwutepxZjk1pdOijtqHUiPv3yzpe0
         ifMabPCUcppVRrbChqAb1QNdEsba3XL99BvmLJ4CjBQvIPAG3Id/yNrfKpDFViZMzdMf
         VKcPrQaUiMQWM3mJMvP0Sum6bzej5mpkacTVS+V18VGV7QoOJlRftu7htMqp7eMRj4pU
         H8JI2AtebXOuIsO1ceVObqvWwV6D1I58Hl7LQH7u0ZW6YbLVJjPwk1Mvy8IequxYfXRN
         s3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xrX7I/9VNLYSXITQnZ7kEaRTUTUazlj54WVvZt4J2cA=;
        b=NQm12f9IiJEORhlJ0DeRPqSzYWwtu4bO+mOGvEtmyCfrCAzgI4vdYZaitqtkkExOwd
         gOS2fXFOaRP9D0uGVg4/cN4qmk8SDLD1ZyBsgOTCo50q3fhl7RhNHEWQfQOKei/L7n/e
         5LZUB3YjA3+NTtn3g6XLJJQVlDTzmgv/5Y+kQtOg0A/xWfqiNuBTcJjt+n0TtAn7cGEh
         4I+6YGZds2wg38Vz0uDS52g0HyE47uOp2zwjwkVw3rNaqYqDBG4DJm6BQlmccu5T2z5l
         5mLhO2pEdCi5d/FUJouPrbmKV+cAU+wtee7T0JHqKixfBFGc5GhtXvgD5ruEZ8grhM/W
         JxoQ==
X-Gm-Message-State: ACrzQf0kg+Oo89vC9CByCQJsQIhX4qjsccdBg/IdZseJF2W/b3GUmANs
        3vJo0u566UzKV3/ock8psLlsv5TBclJh8VmeI1/7Sw==
X-Google-Smtp-Source: AMsMyM5BIXKBMbK+1jzWdWxmZiHNp91BPZlKaSGDfNLoDunt4mwmDcOH8EOiq+zAU4f8/N7Eip2aoSZZhQCu1EsQmgw=
X-Received: by 2002:a67:ac0e:0:b0:3aa:86c3:e6fc with SMTP id
 v14-20020a67ac0e000000b003aa86c3e6fcmr31150616vse.9.1667992593254; Wed, 09
 Nov 2022 03:16:33 -0800 (PST)
MIME-Version: 1.0
References: <20221011002909.26987-1-warthog618@gmail.com> <20221011002909.26987-3-warthog618@gmail.com>
 <CAMRc=Mf=x3iKyvzj63CX1Jgj4fsQKXbHHwcSpLbsvF-teb8Rag@mail.gmail.com>
 <Y2p2u7oCQ/fToeLw@sol> <CAMRc=MdYfHpJDfBiG3+F-p+H99wbekmF12VVNhjcMr=Hd9=56w@mail.gmail.com>
 <Y2sJt+IUuBB556+b@sol>
In-Reply-To: <Y2sJt+IUuBB556+b@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 9 Nov 2022 12:16:22 +0100
Message-ID: <CAMRc=MdF6=T_kRGHuxCPK0oO+bPfLFaa=VQd8t=4d9JBKEjoPQ@mail.gmail.com>
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

On Wed, Nov 9, 2022 at 3:00 AM Kent Gibson <warthog618@gmail.com> wrote:
>

[snip]


> >
> > I insist on this one as just a quick glance at the current values of
> > gpio-line-names DT properties in the kernel show all kinds of funky
> > names - not only including spaces but also various other characters
> > like [, ], #, /, - and that not. I think it makes a lot of sense to
> > delimit them visually with quotes.
> >
>
> Good grief, what a mess.  Would've been nice to have some naming
> conventions in place, but too late now...
>
> Which reminds me - any guarantees the name, particularly the consumer
> name, is valid UTF-8?
> If not then need to double check how the Rust bindings deal with that.
> Throwing a utf8_error would not be appropriate if it isn't guaranteed to
> be UTF-8.
>

There's nothing that technically prohibits anyone from using non-UTF8
characters and also current libgpiod seems to be handling such chars
just fine (just tested to make sure).

> > > >Same for the consumer as with your current
> > > > version, if the consumer string has spaces in it, it will look like
> > > > this: consumer=foo bar. I think consumer="foo bar" would be easier to
> > > > parse.
> > >
> > > For this very reason, the consumer is explicitly listed last, so the
> > > consumer name matches everything between the "consumer=" and end of
> > > line.
> > >
> > > Unless consumer names with spaces are very common in the wild then
> > > quotes only add more clutter.
> > >
> >
> > We can't know, but instead of putting it last, I'd just treat it like
> > every other flag and instead delimit the name with "".
>
> It is also last based on length predicatability - more predicatable
> first, and the other attributes are more predictable.
>
> >
> > The tool is mostly aimed at humans anyway and if someone's brave
> > enough to parse the output with a script then a cut-based one-liner is
> > all they need, no?
> >
>
> Sure, but don't underestimate the ability of users to complain when a
> tool isn't quite as easy to use as they would like.
>
> Hmmm, how about an option to quote all string attributes?
> Say --quoted?
> Or if quoted is the default then --unquoted to remove the clutter?
>

I don't feel like it's necessary. How would you handle line names with
spaces? It would add an additional column? That would be actually
harder to parse than quoted names IMO.

> <snip>
> > >
> > > > > Remove the --mode, --sec, and --usec options.
> > > > > The combination of hold period and interactive mode provide functionality
> > > > > equivalent to the old --mode options.
> > > > >
> > > >
> > > > I have one problem with that - I think the basic functionality of:
> > > > "take a line, set its value and wait for a signal" would still be
> > > > useful. As it is now, I'm not sure how to make gpioset just hold a
> > > > line without calling the GPIO_V2_LINE_SET_VALUES_IOCTL ioctl
> > > > periodically.
> > > >
> > >
> > > I forgot to mention the daemonize option here, so
> > >
> > > gpioset -z myline=1
> > >
> > > will do that.
> > >
> > > (or
> > >
> > > gpioset -i myline=1
> > >
> > > if you want to keep the process in the foreground.)
> > >
> > > I'll add something to the daemonize help to highlight that it will hold
> > > the line until killed. Is that sufficient?
> > >
> >
> > What if I don't want to daemonize the program nor open the interactive
> > mode? Why not just make the default behavior of `gpioset foo=active`
> > be: stay alive until interrupted? The current immediate exiting is
> > mostly useless anyway.
> >
>
> Hmmm, not when used with the --hold-period, so a script could call a
> series of gpiosets to generate a waveform.  Though that doesn't work
> well, as the line is released between sets, and the whole point of
> the toggle option and interactive modes is to provide better
> alternatives for doing that.
>
> So yeah, true - I guess I just blindly followed the v1 behaviour on that.
> - the standard behaviour should be to not exit.
> The only exception being a zero-terminated toggle sequence.
>
> That should also reduce the chance of users complaining that gpioset
> doesn't work where they assume the set persists after gpioset exists.
> OTOH I'm willing to bet we get at least one complaint that gpioset
> hangs... :|.
>
> <snip>
> >
> > > > > +
> > > > > +// minimal version similar to tools-common that indicates if a line should be
> > > > > +// printed rather than storing details into the resolver.
> > > > > +// Does not die on non-unique lines.
> > > >
> > > > C-style comments only please. Same elsewhere.
> > > >
> > >
> > > Yeah - sorry again - I'm so used to that style that I don't even notice
> > > I'm doing it.
> > >
> > > > <snip>
> > > >
> > > > I like the new tools in general. I don't have many issues with the
> > > > code - you are a much better coder than I am.
> > >
> > > That's being a bit harsh.
> > >
> > > One thing I was considering was reworking the resolver so it would be
> > > more suitable for general use, and move it to core libgpiod so apps
> > > could more readily perform line name discovery.
> > >
> >
> > Hmm, I think it's unnecessary clutter in the library. I was thinking
> > about whether to put the upcoming fdinfo parsing into the library and
> > figured that it's more of a suitable candidate for a new command-line
> > tool as the library should focus on the character device exclusively
> > IMO.
> >
>
> I think you were right the first time.  The fdinfo is another aspect of
> the cdev GPIO uAPI - it isn't just the ioctls.
> If the GPIO uAPI were extended to use AIO, would that not go in libgpiod as
> well?
>
> And agreed that fdinfo warrants another tool.
>

I was thinking that both gpioinfo could use that (e.g.
consumer="foobar",consumer_pid=12345) and we could have something
like:

# gpioowner foobar
12345

> It makes sense to me to add higher level abstractions or functionality
> where that greatly simplifies apps.
> Speaking from experience, looking up up the line chip/offset based on
> name is at best tedious and at worst a serious PITA.
> If it isn't available in libgpiod then apps are more likely to do it
> out-of-band, such as by using gpioinfo to generate app configuration,
> or just stick to specifying lines by chip/offset, which is a bit sad.
>
> But, as per the unified tool binary, this can always be added later.
>

Ok, I'm buying this. Let's think about adding this to the core library.

Bart
