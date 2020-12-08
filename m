Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E04C62D2D59
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 15:39:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729884AbgLHOia (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 09:38:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729881AbgLHOi3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2020 09:38:29 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B70CAC061793;
        Tue,  8 Dec 2020 06:37:49 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id p4so8184969pfg.0;
        Tue, 08 Dec 2020 06:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hU37JaKaOEirjPmALbrOJWPaTIoFEODaWEDaorKDgWk=;
        b=ooksyxbT1PjBm+Qw586pxEZCow8feSKbTu9+hoWGwrqt6voY7lKdgMXkqFJTzkPrD0
         u2W/c+36L9mvuqAXcHd99wRsVaPda+u1Iz99dYLpv5rcD+M8IZs5zGGpIB1ao2dvdFHz
         IXha0OH3n0CxbHso3a/3Rrn2Jwv7qbN6lpf4gMnk5weob/GNC7GcIP6s+hZbPNc4/NBJ
         KTQ+wMCY621HHwDxQ6N1eoAlKr7Ft4ozFYFEWpi6A0TkoUlhbxwYyh7W2D+1j1Qll38I
         PN55OZPzUbOm1tW89mGL2tv7KZ/aJ2+8AiHdpVh2YuL5dGhx+stfe08TOYkvMTgARCiu
         5RWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hU37JaKaOEirjPmALbrOJWPaTIoFEODaWEDaorKDgWk=;
        b=g2j2I8NeWarSmCjXUxO0jGKjDkE27PJH930bF7kwo9fqhPz5icSkMkloY9cEOUyBpN
         jwTw4Wuefu5cAxDRWVVKxlZVsAEa0CnyB0iNAaciuDV8Ib9UC17tBK9TU60OpjWB0RNb
         SfEO34zClpLL07TN/Uew3Wp4DzBKzAFy0PKgxjvwXR4wUJNSuSgbD5X5HkpiCmMoMLFE
         sa2SAQwOHU1Ub8GLIA/uyvC0krE/JBwmIHvmTg0egWWVlspZLH1vk87cIEGChhGX4Rpq
         0mH6yIhlEybOV49K3tx3ABOFAvD2Fe7N1P9Np9mDLLUABw0YI5a2aEIx3sVTGm5CXQMx
         /aLg==
X-Gm-Message-State: AOAM532PJwP56M4neP9/Axd4V8RpnX9VhSVWwrIWyn21WzaHApd7tx9x
        /xWVQdEsMCY/MjtJRGlHGPUfKsd8CXP8Vocuu00=
X-Google-Smtp-Source: ABdhPJwH1S95yY17kMq1zaeFRIR/l3MZetRGkXNSdN1VTOlgJX4s7caWga2i6PDZLwJGuzmkDhL5Y8enQFKM7H/OKsI=
X-Received: by 2002:a17:90a:c592:: with SMTP id l18mr4614277pjt.228.1607438269286;
 Tue, 08 Dec 2020 06:37:49 -0800 (PST)
MIME-Version: 1.0
References: <20201208141429.8836-1-info@metux.net> <CAHp75VfMKmJ074R2-04be0Ag6OuKcY=_xhhbRKsL2D0H8hZZLg@mail.gmail.com>
In-Reply-To: <CAHp75VfMKmJ074R2-04be0Ag6OuKcY=_xhhbRKsL2D0H8hZZLg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 8 Dec 2020 16:38:37 +0200
Message-ID: <CAHp75VfOjb4Rfo9yPmwEYUDbaPXNjfGs6goM27ZnLdAMtiU+jA@mail.gmail.com>
Subject: Re: [RFC PATCH] RFC: drivers: gpio: helper for generic pin IRQ handling
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        William Breathitt Gray <vilhelm.gray@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        joyce.ooi@intel.com, Andrew Jeffery <andrew@aj.id.au>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>, orsonzhai@gmail.com,
        baolin.wang7@gmail.com, zhang.lyra@gmail.com,
        Andy Shevchenko <andy@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jun Nie <jun.nie@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 8, 2020 at 4:19 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, Dec 8, 2020 at 4:14 PM Enrico Weigelt, metux IT consult
> <info@metux.net> wrote:
> >
> > Many gpio drivers already use gpiolib's builtin irqchip handling
> > (CONFIG_GPIOLIB_IRQCHIP), but still has some boilerplate for retrieving
> > the actual Linux IRQ number and calling into the generic handler.
> > That boilerplate can be reduced by moving that into a helper function.
> >
> > This is an RFC patch to outline how that could be done. Note: it's
> > completely untested yet.
> >
> > Several drivers still have their completely IRQ own implementation and
> > thus can't be converted yet. Some of them perhaps could be changed to
> > store their irq domain in the struct gpio, so the new helper could
> > also be used for those.
> >
> > Having all GPIO drivers doing their IRQ management entirely through the
> > GPIO subsystem (eg. never calling generic_handle_irq() and using the bu=
iltin
> > IRQ handling) would also allow a more direct (eg. callback-based) pin c=
hange
> > notification for GPIO consumers, that doesn't involve registering them =
as
> > generic IRQ handlers.
> >
> > Further reduction of boilerplate could be achieved by additional helper=
s
> > for common patterns like for_each_set_bit() loops on irq masks.
>
> Have you able to test them all?
> As the PCA953x case showed us this is not so simple, besides the name
> which sucks =E2=80=94 we don't *raise* and IRQ we *handle* it.
>
> NAK.

To be on constructive side what I think can help here:
- split patch on per driver basis (and first patch is a simple
introduction of new API)
- rename function
- in each new per-driver patch explain what is the difference in behaviour
- test as many as you can and explain in a cover letter what has been
done and what are the expectations on the ones that you weren't able
to test.

--=20
With Best Regards,
Andy Shevchenko
