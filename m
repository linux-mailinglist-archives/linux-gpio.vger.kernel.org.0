Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 784494651E6
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Dec 2021 16:40:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351088AbhLAPnm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Dec 2021 10:43:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244098AbhLAPnm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Dec 2021 10:43:42 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36A2EC061574;
        Wed,  1 Dec 2021 07:40:21 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id r11so103578561edd.9;
        Wed, 01 Dec 2021 07:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/wqLGTlNEelQcmJSuEKjsvjTIBGdlso9y91Oc7kqqZ0=;
        b=kjhGYFz29d5/zcNKJ8E4VG/SESzIuGKlMHMKDY+5ceq28gQN/KQn1cF6n6TJgnphMN
         hJYt25rr6aZ+m44RMe+MuQFONeEEPYQJhCGYTpQrrYK61S6YtN6qFlLW9LRypFLlAO6I
         h3aGd22M6pnUBZwdvW6yoKtJ2D8EWdUgFJQfBQg8lNCcB09BaD7PreukhIs6ehKho77m
         JJfDzXLEr4O0b3u3NxGsYQxuo6+Ffc+jk/YOttmZ5sXmEWWphByR8fDFpsigiJV5nsPB
         MqCyxN5iK1aQwkE6J0clkRUaI9b9O0Xl2D2+H/HYHAmUtg9Nqe5muyLaAWmkvNujJEeN
         vY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/wqLGTlNEelQcmJSuEKjsvjTIBGdlso9y91Oc7kqqZ0=;
        b=QjfQ/NHvivD4mKk2TeFN718BNmiEJNk7z3QgPTu9X81e2nvBhg8aaklF4ISbG5nbDY
         qWMSPwiF/7NZtp8awCWpDc18okHswIsSpLiqX1iL65bQ4mntpdxiQnIHFXOnD2/XmiN4
         SrhFqu2jgb0YS0EMZ2ILQNi/vkE7Yzk7KzPZ/ZexzmFqrlWxfoK6FAuUNgn8fHHhwVAb
         wjFlYhLF1QFo1i9GUhDUW20aTX4ZQo/8zFjN1c+gWMTf29HfKEXP4EMGivP/jqDY7ge9
         OxfrOx2uHfLgGPjnk79eFRGR4yY2QF91s7P04a8JPDLaA+mglygQjC6amOwMGBQoGDpe
         p9KA==
X-Gm-Message-State: AOAM5314Nl4BOhc/AMrLtF12WhNY5m+/uUJyDn0ZqDxtpyZ79M+nW81l
        OjihMZ0KSCfmpO+HOhmCyAKWwCTH7rFpRwnuuEo=
X-Google-Smtp-Source: ABdhPJwIBEN1KeyV6K/BVAHxJUrhAx1AF6suLrwAYgl+BgmFg/iTqZMKpraQJCYQrU1vlJtpahYhgHfcyycIup+Iifo=
X-Received: by 2002:a05:6402:270c:: with SMTP id y12mr9497003edd.258.1638373219692;
 Wed, 01 Dec 2021 07:40:19 -0800 (PST)
MIME-Version: 1.0
References: <20211129105556.675235-1-phil@raspberrypi.com> <20211129105556.675235-2-phil@raspberrypi.com>
 <CAHp75Vei9FUY0gGD99gVv_FZzcpN1y_i65BB-auyAFUwqsQxNA@mail.gmail.com> <06345f5a-c8e7-848b-d25f-3f3e32ab5418@raspberrypi.com>
In-Reply-To: <06345f5a-c8e7-848b-d25f-3f3e32ab5418@raspberrypi.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 1 Dec 2021 17:38:43 +0200
Message-ID: <CAHp75VcZNUXxk7rD2sL=AFe4kz+hXX361rp15K8fN1c4x8zhXA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: bcm2835: Change init order for gpio hogs
To:     Phil Elwell <phil@raspberrypi.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-rpi-kernel@lists.infradead.org" 
        <linux-rpi-kernel@lists.infradead.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 1, 2021 at 5:18 PM Phil Elwell <phil@raspberrypi.com> wrote:
> On 01/12/2021 12:06, Andy Shevchenko wrote:
> > On Monday, November 29, 2021, Phil Elwell <phil@raspberrypi.com
> > <mailto:phil@raspberrypi.com>> wrote:
> >
> >     ...and gpio-ranges
> >
> >     pinctrl-bcm2835 is a combined pinctrl/gpio driver. Currently the gpio
> >     side is registered first, but this breaks gpio hogs (which are
> >     configured during gpiochip_add_data). Part of the hog initialisation
> >     is a call to pinctrl_gpio_request, and since the pinctrl driver hasn't
> >     yet been registered this results in an -EPROBE_DEFER from which it can
> >     never recover.
> >
> >     Change the initialisation sequence to register the pinctrl driver
> >     first.
> >
> >     This also solves a similar problem with the gpio-ranges property, which
> >     is required in order for released pins to be returned to inputs.
> >
> >
> > We have a callback in GPIO chip to register pin ranges, why driver does it
> > separately?
>
> A few experiments (this is not my driver) appear to show that the call to
> pinctrl_add_gpio_range can be removed, but only once the gpio-ranges DT property
> has been added if we want to remain functionality throughout a bisect. That tidy
> up might be better done with a followup commit once the DT patch has also
> been accepted, unless it's possible to guarantee the sequencing between
> the pinctrl/gpio tree and the DT tree.

What I meant is why these calls are done in the probe and not in
->add_pin_ranges() callback?
Shouldn't it fix the issue you have observed?

...

> >     Fixes: 73345a18d464b ("pinctrl: bcm2835: Pass irqchip when adding
> >                             gpiochip")
> >     Signed-off-by: Phil Elwell <phil@raspberrypi.com <mailto:phil@raspberrypi.com>>
> >
> > Is it originally so strange indentation or is it only on my side?
>
> The "g" is below the "p" in the patch.

Which is wrong. Tags mustn't be multilines (i.e. split over a single line).

-- 
With Best Regards,
Andy Shevchenko
