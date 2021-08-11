Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 043D23E9072
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 14:22:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237658AbhHKMWY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 08:22:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237639AbhHKMWX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Aug 2021 08:22:23 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22F40C0613D5;
        Wed, 11 Aug 2021 05:21:59 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id c24so5226900lfi.11;
        Wed, 11 Aug 2021 05:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4KUOFyypq+10So6g9be46ycrQC/QhunD2Vt34K5LKwU=;
        b=e4HBU1klgeOsBG3WXQrhLEpTv16b1/3rw3sDbsgLe/Bfmde3afBXMbUtpKDAOf0scw
         88kPqyrhxiTsIp7AqxVmjoy/e/5DFM6d89JaAy1DIv0cjy9M9waNnlAQkFLIhWNSrfCK
         TS2/rJSCj14iC0+vrt/jpPvUglgafGVNt5Ig2LHMQ8Si4ocP5aA7gKDNqfhTszh0PCUR
         4cCNbD5ITHD4LlHkAlwOrOnNr2/W5Z7n29OEgSgP6sn0BWtfBoOoXMmKH0PGLlDLmBao
         I3QU6QHLtuINLtQOlSGyffwz232Ddeefg2gVfZNai7ekAo6Djbnwtf65HVIsM4UOnPPB
         b5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4KUOFyypq+10So6g9be46ycrQC/QhunD2Vt34K5LKwU=;
        b=tuQdlfdBi9D3/wRuZeT7+JWtO5ZyLD2hGhszP1EtX2EYoBhGY7U40GGtPO6g9sBwTn
         5j7yZHe0ah/6flTKem5pPj3+dtDMtpj3mst4u5imKCb6gGS5EKdWQkj9nKfd/HwuIcr8
         vMOTCAhk99YiVrfpcRosZNx+WnLuOf7Z2VkJ07SrC2ZLNQLOBrh1ob8uw7p0qyuFKaKU
         BTdtY5NAKgChy6b7lkFxwE4OTFSu8lapBpSekOtCFjSs/mnAdAwn2h4iT/SP/0sVyPow
         DwyILQRWXfBE3Jz7y03VU0KxpCmN5PsZRwIOZy4Qvn8K73prHBBMjrm1M17FVCxx1fvK
         NNyg==
X-Gm-Message-State: AOAM533twBU4WrIvkYRRISgKYak8KHbCJA4UuKS+2AYG3pIKEXsOxWX1
        Z8chqiAdDONlpmrFHg7aSJbyo3eRUkcBPjJvfw==
X-Google-Smtp-Source: ABdhPJzaJ+0YrNs+2N41pBaFHT0xRNpN4T1esdV8kWvY54gUYHuqki/9kh4LvLKp2R1Uhm4rHMWuMkSuCzOsB2FuE14=
X-Received: by 2002:a05:6512:234a:: with SMTP id p10mr25275553lfu.472.1628684517417;
 Wed, 11 Aug 2021 05:21:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210809201513.12367-1-mario.limonciello@amd.com> <CAEJqkggAQ3=ppMHr7fAirHspOgHRkrDDxCb59MX8Sy=U0qvk0g@mail.gmail.com>
In-Reply-To: <CAEJqkggAQ3=ppMHr7fAirHspOgHRkrDDxCb59MX8Sy=U0qvk0g@mail.gmail.com>
From:   Gabriel C <nix.or.die@googlemail.com>
Date:   Wed, 11 Aug 2021 14:21:31 +0200
Message-ID: <CAEJqkghZOLaEyJz-rahe8O2c-_gCBbwCKcAeTObPxM1BFY43Sg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: amd: Fix an issue with shutdown when system set
 to s0ix
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Raul E Rangel <rrangel@chromium.org>,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am Mi., 11. Aug. 2021 um 10:26 Uhr schrieb Gabriel C
<nix.or.die@googlemail.com>:
>
> Am Mo., 9. Aug. 2021 um 22:15 Uhr schrieb Mario Limonciello
> <mario.limonciello@amd.com>:
> >
> > IRQs are getting armed on shutdown causing the system to immediately
> > wake back up.
> >
> > Link: https://lkml.org/lkml/2021/8/2/1114
> > Reported-by: nix.or.die@googlemail.com
> > CC: Raul E Rangel <rrangel@chromium.org>
> > Fixes: d62bd5ce12d7 ("pinctrl: amd: Implement irq_set_wake")
> > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > ---
> >  drivers/pinctrl/pinctrl-amd.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
> > index a76be6cc26ee..5b764740b829 100644
> > --- a/drivers/pinctrl/pinctrl-amd.c
> > +++ b/drivers/pinctrl/pinctrl-amd.c
> > @@ -444,8 +444,7 @@ static int amd_gpio_irq_set_wake(struct irq_data *d, unsigned int on)
> >         unsigned long flags;
> >         struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> >         struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
> > -       u32 wake_mask = BIT(WAKE_CNTRL_OFF_S0I3) | BIT(WAKE_CNTRL_OFF_S3) |
> > -                       BIT(WAKE_CNTRL_OFF_S4);
> > +       u32 wake_mask = BIT(WAKE_CNTRL_OFF_S0I3) | BIT(WAKE_CNTRL_OFF_S3);
> >
> >         raw_spin_lock_irqsave(&gpio_dev->lock, flags);
> >         pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
> > --
>
> Is working fine again with this fix.
>

Ofc feel free to add:

Tested-by: Gabriel Craciunescu <nix.or.die@gmail.com>

Best Regards
