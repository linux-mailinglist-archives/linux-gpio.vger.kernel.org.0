Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5305C3E8E97
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 12:27:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237218AbhHKK1u (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 06:27:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237259AbhHKK1u (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Aug 2021 06:27:50 -0400
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46B7AC0617BD;
        Wed, 11 Aug 2021 03:27:02 -0700 (PDT)
Received: by mail-ua1-x92a.google.com with SMTP id x21so963125uau.0;
        Wed, 11 Aug 2021 03:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p1Ky2vPG07eH4lgjI7fl813x1tcTIOy41jGBLt6fr3c=;
        b=cJDiynRL3h9JNsYQgjXb+qaX8bVmqJeOr+v3pikqaCw7O5V7pDRaEPf47RURbPp+tS
         U13qUbQ9Se7vvon1Bu6ddsIDQ5H3ZvdryoESfynad2mDVXQikAT1tOf8Lna9CrSDo6oJ
         pfbnhIo5o/PyXHgEyKrONGEMMyhhCr+WUxgpC+pPs/Ht11pVoO6T1JIxRTekU/ktAcXB
         yE4AHrWgdIUpuQ8XIbQ58uZ6mOTGze72FvIM3oPGrZ+2ic6+LRfvRz3hFKK6doPrKYXx
         zBdHwgbA9OE3mLlHx+Hy8CODLiVcVjRpJB0aDGldyGxGJQ+OMkva9PrUpamN8x5cbB/J
         jupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p1Ky2vPG07eH4lgjI7fl813x1tcTIOy41jGBLt6fr3c=;
        b=NwxQdCjrQfOPa5usI3c7Ump+ZA3qDKHl9TTJkfGVpn01G5VaZGv+R5a2QOrM7VY8Oj
         PYWY6VXymcmvk5Y9zhhfvAz7O0uQ76zKGGIfZ5JDgY3quAvMAXPF1cWZIY6Y48gJN7lQ
         XJ0QIATUeVFG2shVYCVV4Al3qjGeqj4Tk2867Q9e4hfZSVl0Mlf5DSQneKL2n160qaW/
         eGnt22Ne7+Yywda6lHHjX+rcgi/aQQgQ6QlOZTmmIf98+kFaRbZQ8pJPJXCfW0dZhNoc
         CTdRTQ9Ee7/CPH5iOBTXIq/zcWD3d0MRqKWvsImA0p57hS66a36hOqpwo9uiHPqTg95p
         Hbqw==
X-Gm-Message-State: AOAM531GZWfcgzquLCe40RnfnsCHRKk/MlOeSs39jHHpgOQ6TgSYMf6F
        37w1MP1En82I2Mu/4HXEDS45GI7vYsi6+dpbKaA=
X-Google-Smtp-Source: ABdhPJyHF4jG0uFnPkKsmItTX7DmGBWg49hVMAVsoycngSPyWscu+aTXXTNLHWoDfBKKtJwGolHxuSMNK7q7YlY2KDM=
X-Received: by 2002:ab0:771a:: with SMTP id z26mr1184058uaq.0.1628677621550;
 Wed, 11 Aug 2021 03:27:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210728041253.15382-1-sergio.paracuellos@gmail.com>
 <CAMpxmJUnXpOhvaQuNPbFt3TY363vrsEWV1KXxhyBm7cJ-PWvwQ@mail.gmail.com> <CACRpkdbHzdCnHB8358Wi6zojMhfi5urhdm2XOiPmhph7q_L1ew@mail.gmail.com>
In-Reply-To: <CACRpkdbHzdCnHB8358Wi6zojMhfi5urhdm2XOiPmhph7q_L1ew@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Wed, 11 Aug 2021 12:26:50 +0200
Message-ID: <CAMhs-H-+yiWitOkMCwmqrMAh6sLPViT0VRXz=YV_F4-vRQH6sw@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] gpiolib: convert 'devprop_gpiochip_set_names' to
 support multiple gpiochip banks per device
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Gregory Fong <gregory.0xf0@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        John Thomson <git@johnthomson.fastmail.com.au>,
        NeilBrown <neil@brown.name>,
        Nicholas Mc Guire <hofrat@osadl.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Wed, Aug 11, 2021 at 11:03 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Jul 29, 2021 at 7:43 PM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> > On Wed, Jul 28, 2021 at 6:12 AM Sergio Paracuellos
> > <sergio.paracuellos@gmail.com> wrote:
>
> > Patches queued for next. Thanks!
>
> Thanks to all for fixing this hairy situation with composite
> GPIO controllers. I think there are some more controllers
> that need this actually.

I was searching for clear patterns that were using a similar approach
to this new stuff inside the gpio folder and I was not able to
properly be sure which other drivers can get the same change that I
did for mt7621 and broadcom applied... If you point me out to which
drivers can also use this, I am ok in sending patches for all of them
when I come back from a little rest time on August 23th.

Thanks,
    Sergio Paracuellos
>
> Yours,
> Linus Walleij
