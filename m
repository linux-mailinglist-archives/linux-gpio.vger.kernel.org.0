Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7812A32CEED
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 09:56:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233460AbhCDIzZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 03:55:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236965AbhCDIzV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 03:55:21 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EB15C06175F
        for <linux-gpio@vger.kernel.org>; Thu,  4 Mar 2021 00:54:41 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id e7so41934349lft.2
        for <linux-gpio@vger.kernel.org>; Thu, 04 Mar 2021 00:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kP5j6t3Zqkr2LgOEeBRBMFVkVRAm8OKJCLshXSA1TI4=;
        b=l0ccq17FKG+rl910SUAXFdSYkDGKAWn6LRNNnVPhF4ZkBTqdIiszJaM0d4cB7FgZzb
         pNKtYKkwfYfXs1KtFjNna5InMo0PI/yMP58EQjRs1cP6564F2MPTQxHbEnpS9aqBzMjW
         OZPu+ZwZWh7bPl8hg46ruahBjUNZn1b18xXUvAu6V/LlCRpmezepT+EwGmGXtctYMKLB
         oKm5rgYvCqrS2Fz3wV3vjxWlLhw57HJKPoPqTCAoOoQpe7Uxk6jk51q7w7mSPGfG8sWH
         LFBZv3yIXRV4ClqDpmjVlewQ4RmA6pils0/6ItKbDOGLHtEnjTwDPLkwVsOlulucgAG+
         +4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kP5j6t3Zqkr2LgOEeBRBMFVkVRAm8OKJCLshXSA1TI4=;
        b=oYUagqVd6gPDITkKprN0X3DRh6tTN73Y8592zeE9epm0cujUwDKt+jjRvUi8i5EX+8
         WRhQRHHr2/TPVb1p7gTP3VFccvpI3cE69wT8qKE9i4K/2EwZgGOXY+my0ncVWE5k/xj7
         GXxhs2TEehsfK9VfS/x+t/qTP5OfBrEdIW+/f5cLwioNr87mTT/X7AtIKfvnXvS19rHj
         mY1KYIeu4hgVfnCFYvXuBM3zrK87rmnSjfi2lMTpQm+pV6ixYiKit3MUMPFLUTRV1Gy1
         vh5WGgQp0qxRHetTjP1qdV0OxMjUDp16H+11ZwUEEFHgBVxAz/ikaRppGn8uNSsgtr7X
         g8qA==
X-Gm-Message-State: AOAM531n5ntuQeOojeM7HYCbEQLUfffQ7eWPeQlz2uElBnjggXXaspVc
        deM4yJZv31N9yj09PtkfDs7WiT7xRbvOPRzINcjwxA==
X-Google-Smtp-Source: ABdhPJyJ3ZQg40JTf8jiUADkWPNsIQsIwVVlv8QuxFr+rXY4dQ2nrklxbWJ3cyPdJwlosl/ZOqZ6FG4MXurWNpShgxY=
X-Received: by 2002:a05:6512:10d1:: with SMTP id k17mr1607139lfg.649.1614848079740;
 Thu, 04 Mar 2021 00:54:39 -0800 (PST)
MIME-Version: 1.0
References: <20210304070501.30942-1-noltari@gmail.com> <265ad883fee30b799fd53954876dc567@walle.cc>
In-Reply-To: <265ad883fee30b799fd53954876dc567@walle.cc>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 4 Mar 2021 09:54:28 +0100
Message-ID: <CACRpkdZjHG25g7Tpwi7kZryYO=NJA9hd0qOLg-vfybok8e3o-A@mail.gmail.com>
Subject: Re: [PATCH] gpio: regmap: disable IRQ domain without GPIOLIB_IRQCHIP
To:     Michael Walle <michael@walle.cc>
Cc:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 4, 2021 at 9:29 AM Michael Walle <michael@walle.cc> wrote:
> Am 2021-03-04 08:05, schrieb =C3=81lvaro Fern=C3=A1ndez Rojas:

> > The current code doesn't check if GPIOLIB_IRQCHIP is enabled, which
> > results in
> > a compilation error when trying to build gpio-regmap without having
> > selected
> > CONFIG_GPIOLIB_IRQCHIP.
> >
> > Fixes: ebe363197e52 ("gpio: add a reusable generic gpio_chip using
> > regmap")
> > Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>
> Nice catch.
>
> However, instead of having that ifdef, commit 6a45b0e2589f ("gpiolib:
> Introduce gpiochip_irqchip_add_domain()") could be fixed. That one is
> missing a stub if CONFIG_GPIOLIB_IRQCHIP is not defined.
>
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -624,8 +624,16 @@ void gpiochip_irq_domain_deactivate(struct
> irq_domain *domain,
>   bool gpiochip_irqchip_irq_valid(const struct gpio_chip *gc,
>                                  unsigned int offset);
>
> +#ifdef CONFIG_GPIOLIB_IRQCHIP
>   int gpiochip_irqchip_add_domain(struct gpio_chip *gc,
>                                  struct irq_domain *domain);
> +#else
> +static inline int gpiochip_irqchip_add_domain(struct gpio_chip *gc,
> +                                             struct irq_domain *domain)
> +{
> +       return 0;
> +}
> +#endif /* CONFIG_GPIOLIB_IRQCHIP */
>
> Linus, do you agree?

Oh that is a better fix. Please go with this =C3=81lvaro!

Yours,
Linus Walleij
