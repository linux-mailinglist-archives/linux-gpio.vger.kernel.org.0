Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 692BE41913D
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Sep 2021 11:01:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233593AbhI0JDJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Sep 2021 05:03:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233581AbhI0JDI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Sep 2021 05:03:08 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 353D3C061575
        for <linux-gpio@vger.kernel.org>; Mon, 27 Sep 2021 02:01:29 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id ee50so66303286edb.13
        for <linux-gpio@vger.kernel.org>; Mon, 27 Sep 2021 02:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t1PYv/D9wia79o91DLcCnYuIP68eDkGZseLyFeK5IoQ=;
        b=bt5YusDwQM2HiZUwbX/Nsy+oYRZtytyqwt2Y4tOkX1CA5Egj1MAnGW1C7W1bsxLUJ7
         LzJhsZ6Z3o5FTqo4qppGoz5QOjE7XP5Mfrof4+kABQvJvpDsgLA06r27Q6zBapsENWEo
         NQ8TlfFG6bZ+pCyHu45EFpej80+VyeLjoi6KrvlpttTCu/LGwG0Fs0KB/PUWJe27PIQI
         AYqx0c90+LjOJPZ9CV5eVai8jVFN7oLrKF0DeYpIsK7OK7sX2FKf/UNiA1Coxppdw8xF
         rh8nujG3cfNMuTvq1v82kKSd1Qr+REEsVnvA1sPRGzdSKrOPxjLjJqeqxMBeDboZ17Tr
         xugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t1PYv/D9wia79o91DLcCnYuIP68eDkGZseLyFeK5IoQ=;
        b=t36Tq9IrdgxHsXTysjnHjaqlQDYsIppHGCuBKxSsel5qHHhp8cuHkTKnYQpn9ffffR
         QY/JKCmNI7vPZqZBdB0cTl6gdfoddtkTKfxx/+2lXinP50cJ0X7PSZwP0S74oHoAKBFW
         LsnymdudmWbfCHH0ZwuMW/79WuD8hmUh3XNNQLP8QdqSocWKihVTjQ4pg9CO2a6LJogr
         HAsO7WyCBr1F9bYWMHKUr+MZBv1CZZl3JsBqaOYaWRktUhHQomMH2mhCzkvl0hSG6y33
         cDGi+dsQTpVKA6sCmmPoqZ9V2VWxtkeVjW7xqyUJF3Jj7Nsh4RcnVgYKlepGJJmYSD32
         sYoA==
X-Gm-Message-State: AOAM532oPgHTY3fbQ5L+PjfUROD/jBXL8hCoy2fjBKefm1qnr7Kl/r4y
        osMrOBDzOh74YQZsk8/27+DQr23XUoLT3211WA8=
X-Google-Smtp-Source: ABdhPJw43MBxDH1djU9zQw1rNBbczo7kOq/Xu0kIG+uPMwy4uuImjZtl9KhBJPW9J7HDIAaYuV65lVQdNQt/VIQnq/U=
X-Received: by 2002:a17:906:a294:: with SMTP id i20mr4825095ejz.128.1632733287730;
 Mon, 27 Sep 2021 02:01:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210921222956.40719-1-joey.gouly@arm.com> <20210921222956.40719-2-joey.gouly@arm.com>
 <YUrZR/Tl7obfehXP@smile.fi.intel.com> <20210925134425.GA4681@e124191.cambridge.arm.com>
 <CAHp75VecEoUnNLx_tw3Fa=9jaDQaXbaaN=gGfFSXPkvpUOihoQ@mail.gmail.com>
 <CACRpkdY01KsAo1OP=MF0LKWt1r5UDXDW=U0Bce1ZMPQGcXmrjg@mail.gmail.com>
 <50d6a8f0-c515-43dc-af06-b31bf8f863df@www.fastmail.com> <CACRpkdb-TZfjyonddfHjOFqZXuLSGi7ER3_onnom-5VYm5GsgQ@mail.gmail.com>
 <9e7842b6-eff5-440d-b97a-175bd8e37fa6@www.fastmail.com> <CAHp75Vc0CyhuqbVhpO-2xnjM5ZR2px5psZTVsKGdhx++OFB-kg@mail.gmail.com>
 <79b0a69f-bb30-4f7d-afbd-8d635870f6b3@www.fastmail.com>
In-Reply-To: <79b0a69f-bb30-4f7d-afbd-8d635870f6b3@www.fastmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 27 Sep 2021 12:00:51 +0300
Message-ID: <CAHp75Vc+uA-G2+aT_U10BDo8krhahYgTSWdxQt8iffn9angL_w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: add pinctrl/GPIO driver for Apple SoCs
To:     Sven Peter <sven@svenpeter.dev>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
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

+Cc: Hans (just for a bit offtopic comment below)

On Mon, Sep 27, 2021 at 8:46 AM Sven Peter <sven@svenpeter.dev> wrote:
> On Sun, Sep 26, 2021, at 18:28, Andy Shevchenko wrote:
> > On Sun, Sep 26, 2021 at 5:36 PM Sven Peter <sven@svenpeter.dev> wrote:
> >> On Sun, Sep 26, 2021, at 15:10, Linus Walleij wrote:
> >> > On Sun, Sep 26, 2021 at 2:56 PM Sven Peter <sven@svenpeter.dev> wrote:
> >> >> On Sun, Sep 26, 2021, at 14:48, Linus Walleij wrote:

...

> >> I'd prefer to have a single compatible and get the npins from some
> >> property and I don't think that's necessarily over-generalizing.
> >> AFAICT Apple has been using the exact same MMIO interface for years
> >> and I'd expect them to continue using it in the future. The only thing
> >> that seems to change is the number of pins available and their assignment.
> >> If we just have a single compatible we can likely support the M1X/2 or
> >> however Apple calls the next SoCs with just a simple DTB change without
> >> touching any driver code.
> >
> > Hmm... Dunno the details, but at least AOP GPIO is definitely ca[able
> > of waking a system from a deep sleep (that's what SUS == suspend do on
> > Intel). Haven't checked if you implemented ->irq_set_wake() callbacks,
> > though.
>
> I don't think Joey implemented the set_wake callback because we didn't
> even consider that the AOP GPIOs might be able to wake the system from
> deep sleep. I'll see if I can figure out some details about that though.

I have checked Intel drivers and above mentioned do not implement
->irq_set_wake() callback. Hmm... Maybe Hans can share his thoughts
why it's so
(note, the Skylake and newest are all based on pinctrl-intel.c which
implements it. So does Merrifield) and if we also need to consider
adding it.

-- 
With Best Regards,
Andy Shevchenko
