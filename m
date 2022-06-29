Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB0AB55FA3D
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jun 2022 10:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbiF2IUa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jun 2022 04:20:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbiF2IU3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2022 04:20:29 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0183C3BBD1
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 01:20:28 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id g16-20020a17090a7d1000b001ea9f820449so18571570pjl.5
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 01:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AYS//Bqz000jGoeMpecKzBIqVnJgMYJudKwyObTDuyU=;
        b=Y3JVNBPBeCWYlSIaXnPoNVu9F4R8BmLCnT2qf71vMOIE48I6fqDowpDeycmDQik//4
         HSdsnF5epcXMEtE4vab2Q8tHQEPVoy9y9JO5jiINfajmuaVRR7/1n4izvuWO1EP72uUe
         kjuGZwX9HGS1z8xT8ussA+fA1Nn9rUyX//TpemDYvOdrU6HFl8qHUO9efBJnfPFZhJiX
         0WJVOiksNZqctoVK1XOQG7SkN/ZIQIfo9l1OspPkuom4otXgGmvDMiir3YO+HoLixx4v
         /7zF0sJ6y6mwAeVA1BWQ4gakJ1D2v/a8s70pP/rAajiEJCmGf0seOVn3MEFK8WuTQnAU
         Y/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AYS//Bqz000jGoeMpecKzBIqVnJgMYJudKwyObTDuyU=;
        b=30ZqMrsHWEgKtiKDOKEmBeAirqF+iTJtMVLRq5TuRfcqphQgM1EmE5W+x211kvjaQe
         jRRNFxIXUcE50LHIFITxPmCc6kyVbMNTa1Tuaqvbko/7Hudm6G+Z0Gs5w8mAIA8v3TI0
         Wv7zvhEArOUefD6anSsrgTm/fGUBo9hKUEy8YolokpP+EJLvQ+IrbYjobaj3KvsR6GKr
         FkHp4P6zZiqiiSrk6sIe4H+4dmexiSwTX1SyaR9VmD94ZNM1vVz5KfCRPpE3rYSMMGEb
         le9r6BH2KLK1Q5yiNENhBGNJBqeZQo/cYNaY+eBU6LlQBk8daZmilEoeJyUPQM+7/C36
         ABZg==
X-Gm-Message-State: AJIora9FjzV7XvaxVQ0/77zTNqEwml2m/Os/NpO2T9qN8GUytmrK5UDG
        ZVYJkMX8X3gZGw1JrsH7xYk=
X-Google-Smtp-Source: AGRyM1toZjPTx5cg7PnAqsTJafDm0r+Bn1xh0Wf8Qt8EiK7H2PEdjCXfgBG7G9qWifMboNGHdg/l8Q==
X-Received: by 2002:a17:902:6b42:b0:15d:3603:6873 with SMTP id g2-20020a1709026b4200b0015d36036873mr9070035plt.30.1656490827424;
        Wed, 29 Jun 2022 01:20:27 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id x5-20020a1709029a4500b001678e9670d8sm10768834plv.2.2022.06.29.01.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 01:20:26 -0700 (PDT)
Date:   Wed, 29 Jun 2022 16:20:21 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     Linux GPIO List <linux-gpio@vger.kernel.org>, brgl@bgdev.pl,
        andy.shevchenko@gmail.com
Subject: Re: Reading current output value
Message-ID: <20220629082021.GA24434@sol>
References: <CAGm1_kvsAir70H41RJ5vzAGeBLBAFByHyR3fWfFeq3RW5O7cBA@mail.gmail.com>
 <20220622102632.GA37027@sol>
 <CAGm1_kvf1RC7fHBy65PkRcS=a5eUgpVYyHM+6NmOvWv6YusTEA@mail.gmail.com>
 <20220628045253.GA18105@sol>
 <20220629021446.GB8799@sol>
 <CAGm1_kubUyw1oSn2wFYVReCB5KcUnQ4KrGP_jEHuQ0fPLYEvXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGm1_kubUyw1oSn2wFYVReCB5KcUnQ4KrGP_jEHuQ0fPLYEvXg@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 29, 2022 at 09:50:54AM +0200, Yegor Yefremov wrote:
> Hi Kent,
> 
> On Wed, Jun 29, 2022 at 4:14 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Tue, Jun 28, 2022 at 12:52:53PM +0800, Kent Gibson wrote:
> > > On Mon, Jun 27, 2022 at 12:37:46PM +0200, Yegor Yefremov wrote:
> > > > Hi Kent,
> > > >
> > > > On Wed, Jun 22, 2022 at 12:26 PM Kent Gibson <warthog618@gmail.com> wrote:
> > > > >
> > > > > On Wed, Jun 22, 2022 at 09:54:41AM +0200, Yegor Yefremov wrote:
> > > > > > On a am335x based board I have a GPIO pin that enables/disables power
> > > > > > of an external device (the bootloader sets this pin to output and 1,
> > > > > > and the kernel is instructed to not change it). Using kernel
> > > > > > 5.19.0-rc2 and sysfs interface, I can read the current status as
> > > > > > follows:
> > > > > >
> > > > > > echo 68 > /sys/class/gpio/export
> > > > > > cat /sys/class/gpio/gpio68/value
> > > > > >
> > > > > > As a result, I read 1.
> > > > > >
> > > > > > Using gpioget (libgpiod) v1.6.3, the line will be configured to
> > > > > > "input" and the value is set to 0:
> > > > > >
> > > > > > # gpioget 2 4
> > > > > > 0
> > > > > >
> > > > > > So, how can I read the state without changing it? I am mostly
> > > > > > interested in using the kernel userspace API directly.
> > > > > >
> > > > >
> > > > > The API itself supports it, but it isn't exposed in gpioget v1.6.3.
> > > > > The gpioget in libgpiod master has a --dir-as-is option for exactly
> > > > > this case, but that hasn't made its way into a libgpiod release yet.
> > > > > (commit 3a912fbc1e2 tools: gpioget: add new --dir-as-is option for GPO read-back)
> > > > > Can you try master?
> > > >
> > > > # gpioget -v
> > > > gpioget (libgpiod) v2.0-devel
> > > > Copyright (C) 2017-2018 Bartosz Golaszewski
> > > > License: LGPLv2.1
> > > > This is free software: you are free to change and redistribute it.
> > > > There is NO WARRANTY, to the extent permitted by law.
> > > >
> > > > Now, I get my "1", but as soon as gpioget exits, the pin goes at "0".
> > > >
> > >
> > > Is that line the only line used (i.e. exported) on that chip?
> > > If that is the case, can you request another unused line first (e.g.
> > > using gpiomon in the background, or, and only since you've already
> > > mentioned sysfs, exporting using sysfs), then try the gpioget?
> > >
> >
> > Just to expand on that a little, when the GPIO subsystem is finished
> > with a chip, so it no longer has any lines requested, it calls free on
> > the device driver.  What happens then depends on the device driver.
> > In this case the device driver (I'm assuming gpio-omap.c is the driver
> > for your am335x) reverts all the GPIO lines to inputs.
> >
> > Any libgpiod tool will request the chip and then on exit, as no lines are
> > requested, the chip will be freed - resulting in what you are seeing.
> > Btw, the same would occur in you exported and unexported a line via sysfs.
> >
> > Hence the suggestion to request/export a line to prevent the chip being
> > freed.  Or to switch to an approach where you hold the line and don't
> > release it.
> >
> > Neither libgpiod nor the kernel gpio subsystem are explicitly requesting
> > a change to the line - it is an unfortunate quirk of the GPIO chip
> > driver interface.
> >
> > I hope that helps.
> 
> Thanks for your thorough explanations. I see your point and the
> similarity with sysfs export/unexport semantics.
> 
> So inputs are no problem and some real physical GPIOs can be handled
> this way as well.
> 
> The only thing that I'd like to handle differently would be our mPCIe
> VCC enable pin. It has a function of a regulator. AFAIK, the best way
> is to use a userspace-consumer driver [1] like described here [2]. As
> there is still no support for such a regulator in Device Tree, one
> needs a dummy device as a consumer. So far, I couldn't find a suitable
> example describing the whole setup. Do you have an idea how to
> implement this function?
> 

Sorry outside my domain.

But if it is just the enable pin you need to control and the pin is
accessible to the GPIO subsystem then you can control it like any
other GPIO line.

That might not give you any of the advantages of integrating with the
voltage and current regulator framework, but it could get your lights
on.

Cheers,
Kent.

