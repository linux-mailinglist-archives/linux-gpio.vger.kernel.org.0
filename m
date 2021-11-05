Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B125F446229
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Nov 2021 11:24:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233081AbhKEK1R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Nov 2021 06:27:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233043AbhKEK1R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Nov 2021 06:27:17 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40F39C061203
        for <linux-gpio@vger.kernel.org>; Fri,  5 Nov 2021 03:24:38 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id f9so9991314ioo.11
        for <linux-gpio@vger.kernel.org>; Fri, 05 Nov 2021 03:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QpRU87aczKNt8pCnpW5GQbPMrLgRV+FWXIAVVwm+1ks=;
        b=bT9B1fITwmYV+PY51N96GYVFaPX1+Ee8OXYGq3NGAzRwfxbvfVtiKEhsTuCxhaNa26
         DAesW421GTbjotZLvw9sFznn3tBe3sdlDCthVOw4xfzhbtAbcLIEQAXwnMkiRB82Wkv8
         v8+jYchHaNGnC1LMcCaRQsvDK7gprwpoJdFT/YfNrrCPjFY0neNLSIR11MiUJVERzYDI
         8AvdPPOIWLjgR/+NGSAYO4HCpvOBTRIoLJ6mqex2svUQPUjFrmth4TLBmO3/GrHNXhxu
         o3wM7xPf+8Q3KjT3DmTnrx4ln6ZAiGGHVoYBsRlz2RLsUegGSt4192axrycJ/X7cDpbl
         S+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QpRU87aczKNt8pCnpW5GQbPMrLgRV+FWXIAVVwm+1ks=;
        b=0fOBmaMQqqy2AiOQRdh1E+JLYMTVm+hsPXTUsrY8Px3XHhw4RvmryJbD6gQoPcyBLw
         NuoFDFJBrkqljOVEIBauZh/XX4j7Tl40YXltXNTB/jmGhSKyQSrvTHydt19mDWIadDxE
         0l4NEfOdszxFHUfO9sNz5Kn75DBzlEkHhPVZatAO2N/II8atPRn+L4DvxslPbhz6G3dh
         Vo7wgsRPAKQn/iybep2u0RvXLCGLHhNeE5GjJkNH4WyRcttsZsAQuLQ4yKSXFuK8o21B
         CFGIXDW1u/2aEtCghWW7bixLpeegFzUnqwBgXOElgl4R8wMzYodkNIS/WQRGjiue+1jz
         2Pqw==
X-Gm-Message-State: AOAM531/0UYMAUH73vfo4fGD357PYF2vZ+kX/v3rFV6yztKRngQltd+f
        Jym31Edwr9KKvsYkXEadM3h6jlJwm46euCUX+Bglhw==
X-Google-Smtp-Source: ABdhPJyaebHYRKyKjlBGJs0I9gVjv5cj397Ne2wgaB9n13zhgHwjy5GNMT1op+EiiCWDE9VyF4Mwh5lMIkRgnTIRRNI=
X-Received: by 2002:a05:6602:3350:: with SMTP id c16mr12909576ioz.43.1636107877555;
 Fri, 05 Nov 2021 03:24:37 -0700 (PDT)
MIME-Version: 1.0
References: <20211102165657.3428995-1-robert.marko@sartura.hr>
 <20211102165657.3428995-4-robert.marko@sartura.hr> <CAHp75VcWWBHDpM9+POPMUmWuGmdbyH0wCGXvqFH3znbZnTht+w@mail.gmail.com>
In-Reply-To: <CAHp75VcWWBHDpM9+POPMUmWuGmdbyH0wCGXvqFH3znbZnTht+w@mail.gmail.com>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Fri, 5 Nov 2021 11:24:27 +0100
Message-ID: <CA+HBbNEp7-aheGr3jNbV_EYYVSmekp_AFc4hR8gVekjmRE-Y8A@mail.gmail.com>
Subject: Re: [PATCH v7 4/6] reset: Add Delta TN48M CPLD reset controller
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 2, 2021 at 8:31 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Nov 2, 2021 at 6:57 PM Robert Marko <robert.marko@sartura.hr> wrote:
> >
> > Delta TN48M CPLD exposes resets for the following:
> > * 88F7040 SoC
> > * 88F6820 SoC
> > * 98DX3265 switch MAC-s
> > * 88E1680 PHY-s
> > * 88E1512 PHY
> > * PoE PSE controller
> >
> > Controller supports only self clearing resets.
>
> ...
>
> > +#include <linux/device.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
>
> > +#include <linux/of.h>
>
> I haven't found any user of this header, but mod_devicetable.h is missing.

Hi,
thanks will fix up in v8.

>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/reset-controller.h>
>
> > +#include <dt-bindings/reset/delta,tn48m-reset.h>
>
> Shouldn't this go before linux/* as it provides more generic definitions?

I have looked at other drivers and I would say that almost all of them
do it this way,
putting it after other includes.
I also personally prefer it this way.

>
> ...
>
> > +#define TN48M_RESET_TIMEOUT    125000
> > +#define TN48M_RESET_SLEEP      10
>
> In which units? (both)

Its microseconds, will make it clear in v8.

Regards,
Robert
>
> --
> With Best Regards,
> Andy Shevchenko



-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
