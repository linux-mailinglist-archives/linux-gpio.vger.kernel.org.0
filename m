Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B77E22CFF6A
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Dec 2020 22:59:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbgLEV7Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Dec 2020 16:59:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbgLEV7P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Dec 2020 16:59:15 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6910C0613D1
        for <linux-gpio@vger.kernel.org>; Sat,  5 Dec 2020 13:58:34 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id v14so12666611lfo.3
        for <linux-gpio@vger.kernel.org>; Sat, 05 Dec 2020 13:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RnPGsL5UhnsbJbtboy0u0w8SIQMnUnd3u3mXFgk0BlA=;
        b=QBDKffSizXw3Hne63nOrGQEVY1jTsatKuzYz/ZZAe7RQYOSvnIoaJLEzZBzhQ1uI/z
         6wVwVDC+RIe487zU3QdIrUBpCk+moQ2SZOImnzjY3LV7XzHads9Mh1f7pykctTONzltR
         pT8yQiRVAZLzY956t8SsBL3SqhroH2BrbZntifNT+Y0r1Kv+1fG15IM/1h+IWnQzeUdG
         +Mm3RZajawmJRelq2YD5fxrnRI7fJbj7V6BaVwUyjdBRDtKNHlKy3ad5b52Ff8Z/VY0h
         0itvfWPNsAscc/54pl09Yudf/S1Vl2+vsJQJq4QJ2MzqCpjbguoiirONGR85sHpByFkK
         sabw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RnPGsL5UhnsbJbtboy0u0w8SIQMnUnd3u3mXFgk0BlA=;
        b=oOPGBUOgJCLxj3UwUzZae9yfUrwNBqitLzkyOWnuiOJGDjWxHtvMw2h67OF1HcdWQP
         M0DT989AYVpLYBjX5AnUjTMj7Cuy/M5/4OVclgbg4qMX4vbJY4Q0/8OEU0fU8qZK3sJ3
         WjouFyWQWJQQwvtBAmcoD8NYyYmBgH9HsvpydjdiID4qqvnN781wfZagI6lq/yENcj7j
         H4vbPD11DsgAutV0SstfuN95hOMLcNUUrau42i5ATJdi8mrIZBJXz26Z5faft/oWekEb
         hpdZeBtBD+wPR5ny8A/gdR7+yp5TQLMAreCKVft1KBg86JiyBNoC7OY4a8Lr5wqiBlmO
         YBQw==
X-Gm-Message-State: AOAM532pU4Uto7QwPC2EuuASci7VLnoVC6RpKgvAqonvUy5UZ2ll3Jf0
        9Ayhd34eGClcI3xqQZnsaijGEpvdD5ugkhrHZEd9Uw==
X-Google-Smtp-Source: ABdhPJwyPx9/r6qzY58psYRAFjHSLkxI2GHCv8E+MfetPUoFGKekPaidZ09OmQtM1M3PxAVy71eLiVzibOFtJywv5Y8=
X-Received: by 2002:a05:6512:3e7:: with SMTP id n7mr5356188lfq.585.1607205512973;
 Sat, 05 Dec 2020 13:58:32 -0800 (PST)
MIME-Version: 1.0
References: <1606728979-44259-1-git-send-email-luojiaxing@huawei.com>
In-Reply-To: <1606728979-44259-1-git-send-email-luojiaxing@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 5 Dec 2020 22:58:22 +0100
Message-ID: <CACRpkdYHAecm3ygaze80SsXzNMYSA9p+p6JY4BKO2D+vArb-WA@mail.gmail.com>
Subject: Re: [PATCH v1] gpio: dwapb: mask/unmask IRQ when disable/enable it
To:     Luo Jiaxing <luojiaxing@huawei.com>, Marc Zyngier <maz@kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linuxarm <linuxarm@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Sorry for top posting but I need the help of the irqchip maintainer
Marc Z to hash this out.

The mask/unmask/disable/enable semantics is something that
you need to work with every day to understand right.

Yours,
Linus Walleij

On Mon, Nov 30, 2020 at 10:36 AM Luo Jiaxing <luojiaxing@huawei.com> wrote:
>
> The mask and unmask registers are not configured in dwapb_irq_enable() and
> dwapb_irq_disable(). In the following situations, the IRQ will be masked by
> default after the IRQ is enabled:
>
> mask IRQ -> disable IRQ -> enable IRQ
>
> In this case, the IRQ status of GPIO controller is inconsistent with it's
> irq_data too. For example, in __irq_enable(), IRQD_IRQ_DISABLED and
> IRQD_IRQ_MASKED are both clear, but GPIO controller do not perform unmask.
>
> Signed-off-by: Luo Jiaxing <luojiaxing@huawei.com>
> ---
>  drivers/gpio/gpio-dwapb.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 2a9046c..ca654eb 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -270,6 +270,8 @@ static void dwapb_irq_enable(struct irq_data *d)
>         u32 val;
>
>         spin_lock_irqsave(&gc->bgpio_lock, flags);
> +       val = dwapb_read(gpio, GPIO_INTMASK) & ~BIT(irqd_to_hwirq(d));
> +       dwapb_write(gpio, GPIO_INTMASK, val);
>         val = dwapb_read(gpio, GPIO_INTEN);
>         val |= BIT(irqd_to_hwirq(d));
>         dwapb_write(gpio, GPIO_INTEN, val);
> @@ -284,6 +286,8 @@ static void dwapb_irq_disable(struct irq_data *d)
>         u32 val;
>
>         spin_lock_irqsave(&gc->bgpio_lock, flags);
> +       val = dwapb_read(gpio, GPIO_INTMASK) | BIT(irqd_to_hwirq(d));
> +       dwapb_write(gpio, GPIO_INTMASK, val);
>         val = dwapb_read(gpio, GPIO_INTEN);
>         val &= ~BIT(irqd_to_hwirq(d));
>         dwapb_write(gpio, GPIO_INTEN, val);
> --
> 2.7.4
>
