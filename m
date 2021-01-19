Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF132FC3E2
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jan 2021 23:41:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403921AbhASObw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Jan 2021 09:31:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391068AbhASKwo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Jan 2021 05:52:44 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31D19C061575
        for <linux-gpio@vger.kernel.org>; Tue, 19 Jan 2021 02:52:02 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id f1so6820593edr.12
        for <linux-gpio@vger.kernel.org>; Tue, 19 Jan 2021 02:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S5vcWLYKoGwyM8t/8S/E9AoWHkff5piFNbt11pwE+L4=;
        b=OYNL7Mmt90KQttNu8O6EHRPz5gOXvj4jjK26OTEkQyAIdkbb3CaAZLJ/fjlvehiHDt
         04W6iTXTXisPI2DB1+3MVgnjCmzCL8H1S/2u9tNewftXOUjpEYamX3kHCzDeYOvLjZHc
         yRLV30F9RQsz7tLFFqL1mVQC9TUmaxG/SJk0qcxZMhQM4o6uNVuL6uf49rriGVZbxL49
         ENHNohylxEmqORe94erBKgn4OI/3yNyZKcXkEM2mxzLbC4QPb4tBOb3p80Xc2QM0VM7T
         LZAxtcITNI29oCCWjJiFLOq+hulglwVJR1AgopBDac1b2Sb3cDeRlC1u7zv83pntoz+j
         zN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S5vcWLYKoGwyM8t/8S/E9AoWHkff5piFNbt11pwE+L4=;
        b=gGsDsPwCvfaJ+0PwuBvVjGFYo3VMg7oouj2QQ8U2aJKKbCxYVM/Zz5cvxYgsUqvY5D
         8kLfkQvh1a5umRg6jvYGXRRxrNN5Ufi168sxeeB+br9bzJUWuT6V/mu/UF7DkGBnfqz6
         5L1i/Y5rTnLCr2rDkuW0VMq7LxNqnJpoIXOfespAmnrSdB4TTDoteYnTkKiq0uqc11AC
         ViJI3kl97+SyT1tA8o1FdRNJrPrTvXBV0zH/ickjs8bAE8qnX0CqW+v8liRjkv9op1Vf
         gBHj7zXNAQf7ilmMiXt7R5Ly0E2vvDS3RcQe/bsDDl4OdRpdxOr/l942BUw/orbFRmNa
         Wgxg==
X-Gm-Message-State: AOAM533pgwu2/rOc9eSEAppT5XFkg7fJh3aAF29rPcz3hjlMi8l+Mboq
        QnNQ8hw/QoljLqaCoL/crKt3DXLbKVYf8Ifsgusqpg==
X-Google-Smtp-Source: ABdhPJxOZhnu32XzKOnT4zurXFOW0ag856sfqQAup+T3PYxZupUS6s1eH8MU80S2ZdVx6TdwG9mQZKiOmEqlueTrCxA=
X-Received: by 2002:aa7:ca13:: with SMTP id y19mr2817438eds.59.1611053520922;
 Tue, 19 Jan 2021 02:52:00 -0800 (PST)
MIME-Version: 1.0
References: <20201228150052.2633-1-nikita.shubin@maquefel.me> <20210118090508.21686-1-nikita.shubin@maquefel.me>
In-Reply-To: <20210118090508.21686-1-nikita.shubin@maquefel.me>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 19 Jan 2021 11:51:50 +0100
Message-ID: <CAMpxmJVrYS1FT0DUdY40D0AZFtjRqrSihj6CO-Z+RCLpZ82t3Q@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: warning on gpiochip->to_irq defined
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

On Mon, Jan 18, 2021 at 10:05 AM Nikita Shubin
<nikita.shubin@maquefel.me> wrote:
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
> v1->v2:
> - Change chip_err to chip_warn
> ---
>  drivers/gpio/gpiolib.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 5ce0c14c637b..5a9410c2537d 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1489,6 +1489,9 @@ static int gpiochip_add_irqchip(struct gpio_chip *gc,
>                 type = IRQ_TYPE_NONE;
>         }
>
> +       if (gc->to_irq)
> +               chip_warn(gc, "to_irq is redefined in %s and you shouldn't rely on it\n", __func__);
> +
>         gc->to_irq = gpiochip_to_irq;
>         gc->irq.default_type = type;
>         gc->irq.lock_key = lock_key;
> --
> 2.29.2
>

Applied to fixes, thanks!

Bartosz
