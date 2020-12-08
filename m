Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFAA02D2CF5
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 15:19:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729470AbgLHOTA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 09:19:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729469AbgLHOTA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2020 09:19:00 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1803C061749;
        Tue,  8 Dec 2020 06:18:19 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id e2so3955496pgi.5;
        Tue, 08 Dec 2020 06:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OMSR+hMzcB4dCy9fVjZAuKPwdWZD1h4rKUe3TPr+HH4=;
        b=GDEr4M3xeVwCR65XN9Y3PUuP3W0e+4t3cOtl1sUc9mWjM4tK6sK0ZWxYkCWfHLhHAS
         zsUaAQ8+EKNobiBUsvwIun6fgLNtkufyFJyzL/7yPlBqHSDUQU3PgEYMpYrwj9/ey/9+
         PYlz4yCWKeKYTT8bVKa/mKeMsqbLKU325nn8hv7+zknczPoSLGI4KgTasMirQYO6tEOV
         wrcsSW74IzIx875hGUjRcXPt/NqUvNT2/JiTwH5rUVVpHdwE1gOSjBgnvB/mJodGbu85
         NwEr2YaBoF7NWgaizzR4iG/7Q31XludPpENCMcZNrIXRaqh8+9/dAG+vpydDKFc6Gs+Z
         lidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OMSR+hMzcB4dCy9fVjZAuKPwdWZD1h4rKUe3TPr+HH4=;
        b=ByGOloImI5rkBxbrwzK0su0PnhsemUDuTeoMPXvLBLoZuQUktHy9tplJOL9tVQEVW6
         aAiB1UWgIsCfNuXrXDuU9h4kMNWJH9O9JhpCSgEv78KUgHWC37aFe6TMC9ReG4Ue97at
         FkooQK5RmXdW+kSh0TqPLx1v8rfbZF6Ex0hvYdKw/CXHi2MUz94zCbUO/3mZIBnf777I
         9Z1mWYVCZ4wSwEd50gkqE8c11SFa3BHrBmnmNzoWDaKobRzA6/XP2dSRYI208Y7CSK/k
         9uR7ehVeabRearzCePIqneCPLevw/8txKxpqdI/LWZ9xp5kMf5QNzpZFUOlsgJsegXIe
         tr3w==
X-Gm-Message-State: AOAM533/zs2o72+qH4f4/tcP3KZ3jXjPBRcaq0Y3jcNHb6vIw0/mAyuf
        3GG0s7Wy0z1Ae4s+EamRgEzIBceKQX2Brv4T1/Y=
X-Google-Smtp-Source: ABdhPJzsf8QZY2LQaf818jrjHoTphpxtNI7QUQQZgEjnN8Uga+bBWu9N22EYRNSUQQb8nNpQH61gugM0InXjm0hc5Uc=
X-Received: by 2002:a17:90a:34cb:: with SMTP id m11mr4542310pjf.181.1607437099448;
 Tue, 08 Dec 2020 06:18:19 -0800 (PST)
MIME-Version: 1.0
References: <20201208141429.8836-1-info@metux.net>
In-Reply-To: <20201208141429.8836-1-info@metux.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 8 Dec 2020 16:19:07 +0200
Message-ID: <CAHp75VfMKmJ074R2-04be0Ag6OuKcY=_xhhbRKsL2D0H8hZZLg@mail.gmail.com>
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

On Tue, Dec 8, 2020 at 4:14 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:
>
> Many gpio drivers already use gpiolib's builtin irqchip handling
> (CONFIG_GPIOLIB_IRQCHIP), but still has some boilerplate for retrieving
> the actual Linux IRQ number and calling into the generic handler.
> That boilerplate can be reduced by moving that into a helper function.
>
> This is an RFC patch to outline how that could be done. Note: it's
> completely untested yet.
>
> Several drivers still have their completely IRQ own implementation and
> thus can't be converted yet. Some of them perhaps could be changed to
> store their irq domain in the struct gpio, so the new helper could
> also be used for those.
>
> Having all GPIO drivers doing their IRQ management entirely through the
> GPIO subsystem (eg. never calling generic_handle_irq() and using the buil=
tin
> IRQ handling) would also allow a more direct (eg. callback-based) pin cha=
nge
> notification for GPIO consumers, that doesn't involve registering them as
> generic IRQ handlers.
>
> Further reduction of boilerplate could be achieved by additional helpers
> for common patterns like for_each_set_bit() loops on irq masks.

Have you able to test them all?
As the PCA953x case showed us this is not so simple, besides the name
which sucks =E2=80=94 we don't *raise* and IRQ we *handle* it.

NAK.

--=20
With Best Regards,
Andy Shevchenko
