Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5CA24191BE
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Sep 2021 11:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233712AbhI0Jpi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Sep 2021 05:45:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233587AbhI0Jpi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Sep 2021 05:45:38 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB29DC061575
        for <linux-gpio@vger.kernel.org>; Mon, 27 Sep 2021 02:44:00 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id x7so52037754edd.6
        for <linux-gpio@vger.kernel.org>; Mon, 27 Sep 2021 02:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kduCctahIZWkzzen605C++kxu515S0/zCkiMMI6ghnk=;
        b=Hjzfxiy6zoiH7FpLHcRcMQYMMnNqe+Lmae68/8r3q0fpWntzaqdzD4VQcy5nxHhxb4
         prscDXsHc2vVePnAURD40AtI2ues9aM7AGLL/1TURbBPBmFFGiMsbeJl6QqLZ1Kc66d0
         QN+CJa8mE0a0w6zE/C7cxhKeFZnFdhHUacY1k2OcO0buSJah+3SvJgOnYQyUn6O878dX
         lUxu2cGUSJx8SH62l4EUd8770dnrI/jpwXFQFQQ6CWGfMXz/IN8lu3MK1S7fy6YwiSJH
         rLEoObZgC7m+kpUmpoCKGspL2vl13reYy24Nbx1mrzrLq3QPzkmoBatTv7kmSBgvtf3O
         QfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kduCctahIZWkzzen605C++kxu515S0/zCkiMMI6ghnk=;
        b=JFOuA2gywVClMHdEDowZaqrWOVWmHdEHjaxN+6cxi49OZ2QR00Gt4cj5727UuyV7+M
         GeLtBQ6/AGvRPfS0UoVkG8KU9r5xahZwv3k4zzO3xIlkiKfFx6eCsM3pG5nuRtXmtFU2
         yREasZ87N2Pkx8p0tcJevZ3jwovCPOa79ggtjE8fr1ifvsFyiRAQyEoZYjVk0S7FJ6pN
         4sXajMg7XRMadgfcwYKBCnR0vjNkugSO89Ina1RiUXIqE4XMrqDcvKdWi5yk3MuKlSWY
         Z1GaL9zzs8ligVqSmVnCJzy6XxTxvwp1vAfrzOOlJan0PJk1MLVJyvjm7GpmKPCH2Y0b
         39qQ==
X-Gm-Message-State: AOAM532grP9k4VTyi2Q3ped7nhyGFSHCkxFOEVIehvfgmDosyLkKTUmb
        Yg5bOAD7REjnwrF7C8Av6vPiSSDvoDCd7rkaK6g=
X-Google-Smtp-Source: ABdhPJwc68sw4tSBoQ0kJISnJURiNd4YRyxper2NE8MhxdI9p5NhncEZ6cvTbUqDgR9B4hcoXCcQ85y5mmUi5ypXWXw=
X-Received: by 2002:a50:e0c8:: with SMTP id j8mr21688273edl.283.1632735839326;
 Mon, 27 Sep 2021 02:43:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210921222956.40719-1-joey.gouly@arm.com> <20210921222956.40719-2-joey.gouly@arm.com>
 <YUrZR/Tl7obfehXP@smile.fi.intel.com> <20210925134425.GA4681@e124191.cambridge.arm.com>
 <CAHp75VecEoUnNLx_tw3Fa=9jaDQaXbaaN=gGfFSXPkvpUOihoQ@mail.gmail.com>
 <CACRpkdY01KsAo1OP=MF0LKWt1r5UDXDW=U0Bce1ZMPQGcXmrjg@mail.gmail.com>
 <50d6a8f0-c515-43dc-af06-b31bf8f863df@www.fastmail.com> <CACRpkdb-TZfjyonddfHjOFqZXuLSGi7ER3_onnom-5VYm5GsgQ@mail.gmail.com>
 <9e7842b6-eff5-440d-b97a-175bd8e37fa6@www.fastmail.com> <CAHp75Vc0CyhuqbVhpO-2xnjM5ZR2px5psZTVsKGdhx++OFB-kg@mail.gmail.com>
 <79b0a69f-bb30-4f7d-afbd-8d635870f6b3@www.fastmail.com> <CAHp75Vc+uA-G2+aT_U10BDo8krhahYgTSWdxQt8iffn9angL_w@mail.gmail.com>
 <7f8e0480-c6af-8a09-86d6-6234429ffa68@redhat.com>
In-Reply-To: <7f8e0480-c6af-8a09-86d6-6234429ffa68@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 27 Sep 2021 12:43:22 +0300
Message-ID: <CAHp75VfQrhZuffP=zfurNSGPzQg+FaOwFWc7jGNgKJ-686pWxw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: add pinctrl/GPIO driver for Apple SoCs
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sven Peter <sven@svenpeter.dev>,
        Linus Walleij <linus.walleij@linaro.org>,
        Joey Gouly <joey.gouly@arm.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hector Martin <marcan@marcan.st>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        nd <nd@arm.com>, Stan Skowronek <stan@corellium.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 27, 2021 at 12:27 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 9/27/21 11:00 AM, Andy Shevchenko wrote:
> > On Mon, Sep 27, 2021 at 8:46 AM Sven Peter <sven@svenpeter.dev> wrote:
> >> On Sun, Sep 26, 2021, at 18:28, Andy Shevchenko wrote:
> >>> On Sun, Sep 26, 2021 at 5:36 PM Sven Peter <sven@svenpeter.dev> wrote:
> >>>> On Sun, Sep 26, 2021, at 15:10, Linus Walleij wrote:
> >>>>> On Sun, Sep 26, 2021 at 2:56 PM Sven Peter <sven@svenpeter.dev> wrote:
> >>>>>> On Sun, Sep 26, 2021, at 14:48, Linus Walleij wrote:

...

> >>> Hmm... Dunno the details, but at least AOP GPIO is definitely ca[able
> >>> of waking a system from a deep sleep (that's what SUS == suspend do on
> >>> Intel). Haven't checked if you implemented ->irq_set_wake() callbacks,
> >>> though.
> >>
> >> I don't think Joey implemented the set_wake callback because we didn't
> >> even consider that the AOP GPIOs might be able to wake the system from
> >> deep sleep. I'll see if I can figure out some details about that though.
> >
> > I have checked Intel drivers and above mentioned do not implement
> > ->irq_set_wake() callback. Hmm... Maybe Hans can share his thoughts
> > why it's so
> > (note, the Skylake and newest are all based on pinctrl-intel.c which
> > implements it. So does Merrifield) and if we also need to consider
> > adding it.
>
> Bay Trail and Cherry Trail always use suspend2idle, which means any
> IRQ is a wake IRQ, since the CPU is in a S0ix (deep-idle, rather
> then full suspended) state.
>
> Drivers still need to make irq_set_irq_wake() calls
> though, to avoid the IRQ code disabling the IRQ on suspend.
>
> To allow those calls to succeed the baytrail and cherryview
> pinctrl drivers set IRQCHIP_SKIP_SET_WAKE in their irqchip.flags.
>
> There are also some more standard (non tablet targetting)
> CPUs which are using the same GPIO IP block, e.g.
> the Celeron N2840 uses the pinctrl-baytrail.c code but
> laptops using this will typically use normal S3 suspend.
>
> I assume that in this case configuring which IRQs are wakeup
> sources is actually controlled the BIOS, since S3 suspend is
> heavily BIOS assisted. I would not even be surprised if the
> BIOS even completely reprograms all IRQ settings (including
> IRQs left enabled) on suspend.

Thank you, Hans!
I will try not to forget this, but it makes me wonder if we may
collect this kind of information in some README-like file inside the
source code.

-- 
With Best Regards,
Andy Shevchenko
