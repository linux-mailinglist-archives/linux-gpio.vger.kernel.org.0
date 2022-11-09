Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D00D622ABD
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 12:41:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbiKILlI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 06:41:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbiKILlF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 06:41:05 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C32F12A26E
        for <linux-gpio@vger.kernel.org>; Wed,  9 Nov 2022 03:41:04 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id d10so16435650pfh.6
        for <linux-gpio@vger.kernel.org>; Wed, 09 Nov 2022 03:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K3pgT8b9s/C/C7NyQ4PY/7JshPMk0htR0Q4sUyjosGs=;
        b=o3Hc793Q0S4AKSeDO3h8U92siMtyStSMQHmph4JxlIMZuNm2oSAC+LVkd4zmE0T0Mi
         pXVud047t+Vcmg8oyr/mqP2GZfun9NJIXuq8W5RpK8EZIi9hHPj8MTcMMQr3Y+MEAF3B
         shMwtOKl9EKJbJL4plM1ImeCyv72EbO61EItJ8wt0rDJwPKrO64F8TrjdfElIEFnXfrQ
         N0VuRIr+UIOxlInzKSSb69ITg67jNTsZwm6NDpVQTmNQjHm8rkg7+qWqOdiX6IZVOvMY
         smV98xP5tOLMxnUz7GX1FOZYEgkB8RjYKSM/cHXZuV8r/Eu9sWxtr56g2KXcgzxZwc0R
         kKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3pgT8b9s/C/C7NyQ4PY/7JshPMk0htR0Q4sUyjosGs=;
        b=7k4n8Chb90JbDC+youSui3y0n8ISKqvdGmK2yMwPRRKboCHnkILUW1XRTgg1S8GYcd
         yH/ElBLcBaSiv4e0Zpe29kr+ZPuOa9hnbrKVUNe4JDlJBF5SR5fkm13UJ1Pxft3Jr6bI
         WDGD8POPuK3PVfsUXgo/Kad2filHe/ZiybiAI1AWpl4MXmkYnqwECoXQz2xMSM4BP2xj
         2fhnjdXN+RSTfzOPBSK6FmY3BUzKEjks44SpewzpYf+AXk0u/bfhp4Jwy+PQOcZyPU5i
         in//OZhboMLwv/NX4VwzFerSOkvc6igTwDChJc50cnCFc/JhtwDuuDePgdk3X/j5JYD+
         BRsA==
X-Gm-Message-State: ACrzQf0EAkMaOtlpVXS1ce8dWY6NZnRuuY5FBlz0aAdA/9CI1Lo3OFi8
        Ouq5iHvDrcDkNp1Jt4c3cw0=
X-Google-Smtp-Source: AMsMyM6bG1uu9yjbEsajb6cJ89+EVx8c63Ssve00Ftd0PCYqsb5HHEG4WMIKSXQbiaAQwaigLPdkag==
X-Received: by 2002:a05:6a00:190a:b0:56c:123e:3e61 with SMTP id y10-20020a056a00190a00b0056c123e3e61mr60233555pfi.47.1667994064108;
        Wed, 09 Nov 2022 03:41:04 -0800 (PST)
Received: from sol (14-200-229-209.tpgi.com.au. [14.200.229.209])
        by smtp.gmail.com with ESMTPSA id b5-20020a170902650500b00180cf894b67sm8840997plk.130.2022.11.09.03.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 03:41:03 -0800 (PST)
Date:   Wed, 9 Nov 2022 19:40:59 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v3 2/5] tools: line name focussed rework
Message-ID: <Y2uRywwaKnIqfwAB@sol>
References: <20221011002909.26987-1-warthog618@gmail.com>
 <20221011002909.26987-3-warthog618@gmail.com>
 <CAMRc=Mf=x3iKyvzj63CX1Jgj4fsQKXbHHwcSpLbsvF-teb8Rag@mail.gmail.com>
 <Y2p2u7oCQ/fToeLw@sol>
 <CAMRc=MdYfHpJDfBiG3+F-p+H99wbekmF12VVNhjcMr=Hd9=56w@mail.gmail.com>
 <Y2sJt+IUuBB556+b@sol>
 <CAMRc=MdF6=T_kRGHuxCPK0oO+bPfLFaa=VQd8t=4d9JBKEjoPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdF6=T_kRGHuxCPK0oO+bPfLFaa=VQd8t=4d9JBKEjoPQ@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 09, 2022 at 12:16:22PM +0100, Bartosz Golaszewski wrote:
> On Wed, Nov 9, 2022 at 3:00 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> 
> [snip]
> 
> 
> > >
> > > I insist on this one as just a quick glance at the current values of
> > > gpio-line-names DT properties in the kernel show all kinds of funky
> > > names - not only including spaces but also various other characters
> > > like [, ], #, /, - and that not. I think it makes a lot of sense to
> > > delimit them visually with quotes.
> > >
> >
> > Good grief, what a mess.  Would've been nice to have some naming
> > conventions in place, but too late now...
> >
> > Which reminds me - any guarantees the name, particularly the consumer
> > name, is valid UTF-8?
> > If not then need to double check how the Rust bindings deal with that.
> > Throwing a utf8_error would not be appropriate if it isn't guaranteed to
> > be UTF-8.
> >
> 
> There's nothing that technically prohibits anyone from using non-UTF8
> characters and also current libgpiod seems to be handling such chars
> just fine (just tested to make sure).
> 

Exactly - AIUI the names are simply 32 bytes - any 32 bytes.

There is also the possibility of UTF-8 being truncated mid-character due
to the 32 byte limit - so even if you put UTF-8 in, it might come out
invalid when you read it back.

> > > > >Same for the consumer as with your current
> > > > > version, if the consumer string has spaces in it, it will look like
> > > > > this: consumer=foo bar. I think consumer="foo bar" would be easier to
> > > > > parse.
> > > >
> > > > For this very reason, the consumer is explicitly listed last, so the
> > > > consumer name matches everything between the "consumer=" and end of
> > > > line.
> > > >
> > > > Unless consumer names with spaces are very common in the wild then
> > > > quotes only add more clutter.
> > > >
> > >
> > > We can't know, but instead of putting it last, I'd just treat it like
> > > every other flag and instead delimit the name with "".
> >
> > It is also last based on length predicatability - more predicatable
> > first, and the other attributes are more predictable.
> >
> > >
> > > The tool is mostly aimed at humans anyway and if someone's brave
> > > enough to parse the output with a script then a cut-based one-liner is
> > > all they need, no?
> > >
> >
> > Sure, but don't underestimate the ability of users to complain when a
> > tool isn't quite as easy to use as they would like.
> >
> > Hmmm, how about an option to quote all string attributes?
> > Say --quoted?
> > Or if quoted is the default then --unquoted to remove the clutter?
> >
> 
> I don't feel like it's necessary. How would you handle line names with
> spaces? It would add an additional column? That would be actually
> harder to parse than quoted names IMO.
> 

Line names are surrounded by tabs, so the actual issue is line names
containing tabs. Are there any of those?

And this is just targetting humans (well me at least) anyway.

<snip>
> > > > One thing I was considering was reworking the resolver so it would be
> > > > more suitable for general use, and move it to core libgpiod so apps
> > > > could more readily perform line name discovery.
> > > >
> > >
> > > Hmm, I think it's unnecessary clutter in the library. I was thinking
> > > about whether to put the upcoming fdinfo parsing into the library and
> > > figured that it's more of a suitable candidate for a new command-line
> > > tool as the library should focus on the character device exclusively
> > > IMO.
> > >
> >
> > I think you were right the first time.  The fdinfo is another aspect of
> > the cdev GPIO uAPI - it isn't just the ioctls.
> > If the GPIO uAPI were extended to use AIO, would that not go in libgpiod as
> > well?
> >
> > And agreed that fdinfo warrants another tool.
> >
> 
> I was thinking that both gpioinfo could use that (e.g.
> consumer="foobar",consumer_pid=12345) and we could have something
> like:
> 
> # gpioowner foobar
> 12345
> 

Both those make sense to me.

> > It makes sense to me to add higher level abstractions or functionality
> > where that greatly simplifies apps.
> > Speaking from experience, looking up up the line chip/offset based on
> > name is at best tedious and at worst a serious PITA.
> > If it isn't available in libgpiod then apps are more likely to do it
> > out-of-band, such as by using gpioinfo to generate app configuration,
> > or just stick to specifying lines by chip/offset, which is a bit sad.
> >
> > But, as per the unified tool binary, this can always be added later.
> >
> 
> Ok, I'm buying this. Let's think about adding this to the core library.
> 

Oh great - I should've kept my trap shut ;-).

Cheers,
Kent.
