Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C5F155F987
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jun 2022 09:51:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbiF2HvK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jun 2022 03:51:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbiF2HvJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2022 03:51:09 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EAC1255B1
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 00:51:06 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-3176b6ed923so139766197b3.11
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 00:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D/7xvTk7Tns6xC4zH7M0fNCtWsqsLEW32cihU2vl9VU=;
        b=MFBYYziA/dF87SJ3JV0ibKv4ZjauVMwkX9cHxWGFVYbDyjsKRktWcRWucQZe1gXBzN
         z58LGaETLnArmKYqRQ7eibhUVuwu2On5g0xK+07XmjnX8ttptFQU3G+2xoXVamni9ZFz
         JnIM4I7wykMqw7Sx9PmrP/MrpFPL9hioWfXxMoXPbPx656/xbMQ9LANiFPCI5vqj4ztI
         9OASfW9d/i3yLAlse6tkfe2L7tvFILD3UnisOKetuF9Wv5H9wZNA86Tk3bZWDCuQGnbx
         eaIJGeBC0nCXcf7Pxz5KG65CcuDNC+LxeVTOaXV1NIM/db1pw8PVJxmxt2DYQmWxaX/H
         VKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D/7xvTk7Tns6xC4zH7M0fNCtWsqsLEW32cihU2vl9VU=;
        b=HzCFmKzA7wox4J5p4P2D8LcD62+0Z+csRe42fLgCQHmEn7fXKWFDD7Z3yE/JLhW9N1
         WefvLqKNbMx+fMjfdP0zw4I/Sae0pMCL6EWw1cUnRM2+P3IONn2BLudKvBEJMYPV4+Wq
         HlMX+T2DyG3lurNjMH4eNUnTHmmnZBYGNEO4ePSzz6RXHcSfjsc9QS8O+RoWJV+s3ZRd
         aat8CLIxvFDhac5k90fRgDWrHwk39T3i1HoZXXCClvO2InAD9zQoZsatHFfixN6uvXto
         /g9qvQu9lFkRIOoMgOGVHS0c9C5KJR4NqRYpoByLfYx+Rzb/9AWcPdxFyRx17FYzBx1H
         jkHA==
X-Gm-Message-State: AJIora+mPKqfrXg0qJ2SimtQ6JPuaavmIRtE4lEIbZFcxuznQ1A8Cf/i
        r1XJR0bSyGumtID0NyAnCMQYXtL6dajIfaMRlqWiZqfAgJ4mEQ==
X-Google-Smtp-Source: AGRyM1uDMXQ4JMI0fucrOehvL1ktmOyVdsJz7N1dq8r33of+urvLNmFymeSun53utrQzxuInxjNzEYllD+GD8YzdQdc=
X-Received: by 2002:a05:690c:102:b0:2ef:48d8:24c3 with SMTP id
 bd2-20020a05690c010200b002ef48d824c3mr2382689ywb.153.1656489065640; Wed, 29
 Jun 2022 00:51:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_kvsAir70H41RJ5vzAGeBLBAFByHyR3fWfFeq3RW5O7cBA@mail.gmail.com>
 <20220622102632.GA37027@sol> <CAGm1_kvf1RC7fHBy65PkRcS=a5eUgpVYyHM+6NmOvWv6YusTEA@mail.gmail.com>
 <20220628045253.GA18105@sol> <20220629021446.GB8799@sol>
In-Reply-To: <20220629021446.GB8799@sol>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Wed, 29 Jun 2022 09:50:54 +0200
Message-ID: <CAGm1_kubUyw1oSn2wFYVReCB5KcUnQ4KrGP_jEHuQ0fPLYEvXg@mail.gmail.com>
Subject: Re: Reading current output value
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linux GPIO List <linux-gpio@vger.kernel.org>, brgl@bgdev.pl,
        andy.shevchenko@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Kent,

On Wed, Jun 29, 2022 at 4:14 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Tue, Jun 28, 2022 at 12:52:53PM +0800, Kent Gibson wrote:
> > On Mon, Jun 27, 2022 at 12:37:46PM +0200, Yegor Yefremov wrote:
> > > Hi Kent,
> > >
> > > On Wed, Jun 22, 2022 at 12:26 PM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > On Wed, Jun 22, 2022 at 09:54:41AM +0200, Yegor Yefremov wrote:
> > > > > On a am335x based board I have a GPIO pin that enables/disables power
> > > > > of an external device (the bootloader sets this pin to output and 1,
> > > > > and the kernel is instructed to not change it). Using kernel
> > > > > 5.19.0-rc2 and sysfs interface, I can read the current status as
> > > > > follows:
> > > > >
> > > > > echo 68 > /sys/class/gpio/export
> > > > > cat /sys/class/gpio/gpio68/value
> > > > >
> > > > > As a result, I read 1.
> > > > >
> > > > > Using gpioget (libgpiod) v1.6.3, the line will be configured to
> > > > > "input" and the value is set to 0:
> > > > >
> > > > > # gpioget 2 4
> > > > > 0
> > > > >
> > > > > So, how can I read the state without changing it? I am mostly
> > > > > interested in using the kernel userspace API directly.
> > > > >
> > > >
> > > > The API itself supports it, but it isn't exposed in gpioget v1.6.3.
> > > > The gpioget in libgpiod master has a --dir-as-is option for exactly
> > > > this case, but that hasn't made its way into a libgpiod release yet.
> > > > (commit 3a912fbc1e2 tools: gpioget: add new --dir-as-is option for GPO read-back)
> > > > Can you try master?
> > >
> > > # gpioget -v
> > > gpioget (libgpiod) v2.0-devel
> > > Copyright (C) 2017-2018 Bartosz Golaszewski
> > > License: LGPLv2.1
> > > This is free software: you are free to change and redistribute it.
> > > There is NO WARRANTY, to the extent permitted by law.
> > >
> > > Now, I get my "1", but as soon as gpioget exits, the pin goes at "0".
> > >
> >
> > Is that line the only line used (i.e. exported) on that chip?
> > If that is the case, can you request another unused line first (e.g.
> > using gpiomon in the background, or, and only since you've already
> > mentioned sysfs, exporting using sysfs), then try the gpioget?
> >
>
> Just to expand on that a little, when the GPIO subsystem is finished
> with a chip, so it no longer has any lines requested, it calls free on
> the device driver.  What happens then depends on the device driver.
> In this case the device driver (I'm assuming gpio-omap.c is the driver
> for your am335x) reverts all the GPIO lines to inputs.
>
> Any libgpiod tool will request the chip and then on exit, as no lines are
> requested, the chip will be freed - resulting in what you are seeing.
> Btw, the same would occur in you exported and unexported a line via sysfs.
>
> Hence the suggestion to request/export a line to prevent the chip being
> freed.  Or to switch to an approach where you hold the line and don't
> release it.
>
> Neither libgpiod nor the kernel gpio subsystem are explicitly requesting
> a change to the line - it is an unfortunate quirk of the GPIO chip
> driver interface.
>
> I hope that helps.

Thanks for your thorough explanations. I see your point and the
similarity with sysfs export/unexport semantics.

So inputs are no problem and some real physical GPIOs can be handled
this way as well.

The only thing that I'd like to handle differently would be our mPCIe
VCC enable pin. It has a function of a regulator. AFAIK, the best way
is to use a userspace-consumer driver [1] like described here [2]. As
there is still no support for such a regulator in Device Tree, one
needs a dummy device as a consumer. So far, I couldn't find a suitable
example describing the whole setup. Do you have an idea how to
implement this function?

[1] https://www.kernel.org/doc/html/latest/power/regulator/consumer.html
[2] https://community.nxp.com/t5/i-MX-Processors-Knowledge-Base/regulator-userspace-consumer/ta-p/1389948

Yegor
