Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B7FD2E96F6
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jan 2021 15:16:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727169AbhADOQA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jan 2021 09:16:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726779AbhADOP7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jan 2021 09:15:59 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 463F7C061574
        for <linux-gpio@vger.kernel.org>; Mon,  4 Jan 2021 06:15:19 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id r5so27436326eda.12
        for <linux-gpio@vger.kernel.org>; Mon, 04 Jan 2021 06:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CCxd/PUSwUofs28XjI+jmkN/DEXzfHZxj/dT0gyHcnk=;
        b=VHjNnt2s4dQeSW9LopBNt9rWpaKMF9XN+LBbbACmtxwZnGiBIurK/5FsVB5AzmS+Mc
         0yRYeWtNDGAsC+owrj+8qKPfsDTGYhutapyGAfMsAgmECMtKlzJm+pHQsK8Aic1qNvRs
         SkrqF2XydKJz3jDPCOeh23IfQvNWOVSvMRbKwGy+nMbEEHGjPs9W7AolHvo//KUmxFpa
         X4Cj/5PEqiCdYomqICsT63KOwTqLdyNK/i/gISskuKBd+lkcO6CmGiNzgja5MC7xCxiZ
         L+yUkxqYre2hA515uEllcPlA853IVtamqZMKAUWWXVzWEmIz/v076EAhiwlGmhHHmz/J
         nC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CCxd/PUSwUofs28XjI+jmkN/DEXzfHZxj/dT0gyHcnk=;
        b=Xf77WzvmxsKva214ExE4N9QY0IUUv+KL7/iefQyN7lulW8AfXHs9ivmY9YudsZTkAX
         rqjU5bK5P1XZBl1fni7vcWDDd4ezR35x12KKthH6j5FcNc4YkKpCHZfklicWJw7GN106
         /o7PYIvGx34HpZX/i4e1m5m4dZvBYWPvDd/xOfj3iyTeEGgLrZfbVF5i3ltlChN6vp+7
         Ggrcm6OvHw4v9xJqX13sDe0NpaM+HSmozgWRI4FdSowz75zGoX3Fe46/kCeVkOzS7/Lb
         C49KX3l8EP4Eh5ktoR10SSjUW0dS9TRraTqet1QAFctgNYKRQIOco42K/2FuShQMejEo
         qUEw==
X-Gm-Message-State: AOAM532x9r02r7lDVWnHQKIqtRJyu4UTYds60rcqrRrYx3UrZGalx2mK
        kODSNaEjBrlfAB2QH5Qab/kxV0JKL6PqTwzydpPSNQ==
X-Google-Smtp-Source: ABdhPJz0E/ceV53tnHAH+mJe21UbyhmOoq/FdVVavN6bd1kaBMjWKHYRGo2gMkT45CeYjc24r4lPRbQOZ0OZdkh2UiA=
X-Received: by 2002:a50:b742:: with SMTP id g60mr70299542ede.113.1609769718075;
 Mon, 04 Jan 2021 06:15:18 -0800 (PST)
MIME-Version: 1.0
References: <20201228150052.2633-1-nikita.shubin@maquefel.me>
In-Reply-To: <20201228150052.2633-1-nikita.shubin@maquefel.me>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 4 Jan 2021 15:15:07 +0100
Message-ID: <CAMpxmJVN8bH5KJ1-W76Ac6MOH3fy5Xo_B1ozsWkLVacJhxOHsA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: warning on gpiochip->to_irq defined
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Thierry Reding <treding@nvidia.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 28, 2020 at 4:02 PM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
>
> gpiochip->to_irq method is redefined in gpiochip_add_irqchip.
>
> A lot of gpiod driver's still define ->to_irq method, let's give
> a gentle warning that they can no longer rely on it, so they can remove
> it on ocassion.
>
> Fixes: e0d8972898139 ("gpio: Implement tighter IRQ chip integration")
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> ---
>  drivers/gpio/gpiolib.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 5ce0c14c637b..44538d1a771a 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1489,6 +1489,9 @@ static int gpiochip_add_irqchip(struct gpio_chip *gc,
>                 type = IRQ_TYPE_NONE;
>         }
>
> +       if (gc->to_irq)
> +               chip_err(gc, "to_irq is redefined in %s and you shouldn't rely on it\n", __func__);
> +
>         gc->to_irq = gpiochip_to_irq;
>         gc->irq.default_type = type;
>         gc->irq.lock_key = lock_key;
> --
> 2.29.2
>

I know Linus suggested using chip_err() here but since this doesn't
cause the function to fail, I'd say this should be chip_warn().

Unless Linus has any objections, please change it.

Bartosz
