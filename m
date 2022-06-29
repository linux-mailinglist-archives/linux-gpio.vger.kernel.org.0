Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 483E055F34A
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jun 2022 04:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230437AbiF2COy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 22:14:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230387AbiF2COx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 22:14:53 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CECEF5BB
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 19:14:52 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id dw10-20020a17090b094a00b001ed00a16eb4so14581016pjb.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 19:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PJBuTsmBDGPfQGeKAv84qtCGlgJlmTxO55RxEnHOrgo=;
        b=F9kOQiSDnm4bnNY3PJWfDyXk/4cPTQPN0K7ykTB5JnQp85naNOp4dG5ZBJoKjwIxRw
         aA7XAyXuMFF9nR7GEz08xG2BUnuDDHJQMYCekNtf9Cmuin+ueCR2F2SwZS7fq6kyMhBe
         /NuLt+wP8fQpJx49Jdm9b7XVPQXWQTjkrI/ESI7HC5iC5o6KxTPVyKnTnjJRnrUmgVVA
         jKHJ3f4mY8qo+X9sGBB21kFZBlTbJwEoj/pX7qATGZkhCmq426DAHBrQ0ToX1FNZvvxk
         MXaQ7eXU0CFNrJdYucPtB+5uEMWNgiZaLlsJ9jAWcBtxdmyxZa0/dPChcqY2n0ibgpiJ
         UzTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PJBuTsmBDGPfQGeKAv84qtCGlgJlmTxO55RxEnHOrgo=;
        b=gVVa0hIBx6RSmLWvXK8kjmAJfFWT13kAfF25hOG7UzDJOCClnm5+2BEeD3ZavqSYCU
         Ks3wQKVIb3LkLPoPFbGzDzuPBvxDXzZ73NhHCxlVZUFDjOVrEzGZSj4CxPmkIDzz5In2
         Bn6qnLYW+LoGIXFYucaXcLhu4XuGbw+uRukOIdmE1FiVz3Fm8GBjMOYb24T7Hzdm7P4u
         EfEIeMDNPgHclAHFNAqd+sAPgOJAqy4GuF+/N3tExnwRbEvOcRHFdBzbd00dEitKgaYD
         QpSBMNaxs7j/Ymxf8VYhiizwWTE1X7k99AwB4pWjplaT6dlRHzBMu5etWhkhDwinbpSG
         EDmw==
X-Gm-Message-State: AJIora954J0g0UMfGW+2JI+GZQ0laKUW2BjvS1IFBLFvwVXtv5m6ghs3
        S740OpgXGWroyPh2tzibng4=
X-Google-Smtp-Source: AGRyM1t9rHd7m9tWDLCgkHgbElSee2MKaRT9DYGwpIH5XdD52bOU/jt0l27JqUbcs+slGLpQfku50Q==
X-Received: by 2002:a17:90b:3e89:b0:1ee:195e:abaf with SMTP id rj9-20020a17090b3e8900b001ee195eabafmr3138090pjb.112.1656468891825;
        Tue, 28 Jun 2022 19:14:51 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id t4-20020a635f04000000b0040cc830b0cfsm10053220pgb.39.2022.06.28.19.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 19:14:50 -0700 (PDT)
Date:   Wed, 29 Jun 2022 10:14:46 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     Linux GPIO List <linux-gpio@vger.kernel.org>, brgl@bgdev.pl,
        andy.shevchenko@gmail.com
Subject: Re: Reading current output value
Message-ID: <20220629021446.GB8799@sol>
References: <CAGm1_kvsAir70H41RJ5vzAGeBLBAFByHyR3fWfFeq3RW5O7cBA@mail.gmail.com>
 <20220622102632.GA37027@sol>
 <CAGm1_kvf1RC7fHBy65PkRcS=a5eUgpVYyHM+6NmOvWv6YusTEA@mail.gmail.com>
 <20220628045253.GA18105@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220628045253.GA18105@sol>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 28, 2022 at 12:52:53PM +0800, Kent Gibson wrote:
> On Mon, Jun 27, 2022 at 12:37:46PM +0200, Yegor Yefremov wrote:
> > Hi Kent,
> > 
> > On Wed, Jun 22, 2022 at 12:26 PM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > On Wed, Jun 22, 2022 at 09:54:41AM +0200, Yegor Yefremov wrote:
> > > > On a am335x based board I have a GPIO pin that enables/disables power
> > > > of an external device (the bootloader sets this pin to output and 1,
> > > > and the kernel is instructed to not change it). Using kernel
> > > > 5.19.0-rc2 and sysfs interface, I can read the current status as
> > > > follows:
> > > >
> > > > echo 68 > /sys/class/gpio/export
> > > > cat /sys/class/gpio/gpio68/value
> > > >
> > > > As a result, I read 1.
> > > >
> > > > Using gpioget (libgpiod) v1.6.3, the line will be configured to
> > > > "input" and the value is set to 0:
> > > >
> > > > # gpioget 2 4
> > > > 0
> > > >
> > > > So, how can I read the state without changing it? I am mostly
> > > > interested in using the kernel userspace API directly.
> > > >
> > >
> > > The API itself supports it, but it isn't exposed in gpioget v1.6.3.
> > > The gpioget in libgpiod master has a --dir-as-is option for exactly
> > > this case, but that hasn't made its way into a libgpiod release yet.
> > > (commit 3a912fbc1e2 tools: gpioget: add new --dir-as-is option for GPO read-back)
> > > Can you try master?
> > 
> > # gpioget -v
> > gpioget (libgpiod) v2.0-devel
> > Copyright (C) 2017-2018 Bartosz Golaszewski
> > License: LGPLv2.1
> > This is free software: you are free to change and redistribute it.
> > There is NO WARRANTY, to the extent permitted by law.
> > 
> > Now, I get my "1", but as soon as gpioget exits, the pin goes at "0".
> > 
> 
> Is that line the only line used (i.e. exported) on that chip?
> If that is the case, can you request another unused line first (e.g.
> using gpiomon in the background, or, and only since you've already
> mentioned sysfs, exporting using sysfs), then try the gpioget?
> 

Just to expand on that a little, when the GPIO subsystem is finished
with a chip, so it no longer has any lines requested, it calls free on
the device driver.  What happens then depends on the device driver.
In this case the device driver (I'm assuming gpio-omap.c is the driver
for your am335x) reverts all the GPIO lines to inputs.

Any libgpiod tool will request the chip and then on exit, as no lines are
requested, the chip will be freed - resulting in what you are seeing.
Btw, the same would occur in you exported and unexported a line via sysfs.

Hence the suggestion to request/export a line to prevent the chip being
freed.  Or to switch to an approach where you hold the line and don't
release it.

Neither libgpiod nor the kernel gpio subsystem are explicitly requesting
a change to the line - it is an unfortunate quirk of the GPIO chip
driver interface.

I hope that helps.

Cheers,
Kent.
