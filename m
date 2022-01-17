Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5068490959
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jan 2022 14:20:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240190AbiAQNTm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jan 2022 08:19:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240196AbiAQNTi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jan 2022 08:19:38 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93A20C061574
        for <linux-gpio@vger.kernel.org>; Mon, 17 Jan 2022 05:19:37 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id g22so18969280edu.1
        for <linux-gpio@vger.kernel.org>; Mon, 17 Jan 2022 05:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IxUqdkrB03qbYhYuHFWlu2efipfhSAmvjjxMHHkbVxM=;
        b=dBlIuWZAuOfikzlsjwqbQNe67U4gG/OPgnx6Mp3cjciVzUbosp7YfjXAlTxg/8Q4wU
         eg2+f82vVEo5voCTPWazcYPHiyAGP/F8Xgp9DF6jnr/C+Ls1Gzsh0VzPH6FnJPmxwJYV
         LUvl3AaN5aiCKtt+ACCLUEh8C27bcoYLN62RI3mTt+iGlbjvSBKYitr0YzDb663AYlSA
         8XTIK6y7Q/KbiEMWoy0KNGo20n45XaLd1+ogfLHRiGcpA0K1TDNTj1zkVAvEhVEqA4oZ
         D7k4nxhoD7dmhQSL6L1sAof1bxraUoMtStTjHRRjKQZ9XFiClHSQEcL6+wZo2hrYOawI
         f9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IxUqdkrB03qbYhYuHFWlu2efipfhSAmvjjxMHHkbVxM=;
        b=WmY188Vwr9OajjP03bkHgtPTQPOtaKj40tYJzE1am7/yAeaiZBsvRT+hMNLL2CZBXw
         IEwgTRrnum88iI4r6jQCpsXI6IPMKZEX8Ol5KKsCwdEctyKiqlTkNAR55w2QLHHJ3Qi4
         J4hhJk9UYJHr9VxXJLcL0ew52O8Wl976c5YgNslOZDE9Lk77bmTG94eCLbsTAYm6kq/M
         P6lI7eGv+9DFzIJBd0qTLprkF7tBzR61DaZYaTsH1mXmki9g9jKQnAFfcC3Z8ynflHxz
         hAhcMb44giL9CV5Xmw3+pT+UZTDooI8YP3da68Riz3TYmubcwW9XbJrH4GHjKvybEx0T
         PlAw==
X-Gm-Message-State: AOAM533FWfSlzcjd7IlkRzKtFkYBRS1Wn9gZPzE4P0ejzHUodLpfeO99
        32gUZBQJpk8Gn6WcbeDG9CNDea7pVzh1Ai6Ec7dxf0w89ykvPQ==
X-Google-Smtp-Source: ABdhPJzV65XYave/zqi1u2Cgz1Qk+KhaEhxJR6isTs/bztiOlugFj3597cvcgQrOGcspRUnOYNHXr7GL03uSYjG3N5M=
X-Received: by 2002:a05:6402:7cc:: with SMTP id u12mr4850867edy.373.1642425576203;
 Mon, 17 Jan 2022 05:19:36 -0800 (PST)
MIME-Version: 1.0
References: <20220114065125.21208-1-linmq006@gmail.com>
In-Reply-To: <20220114065125.21208-1-linmq006@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 17 Jan 2022 14:19:25 +0100
Message-ID: <CAMRc=MfN1zybtDcR882GtqkYivCE-pPUCxM9aNgs9EN8vohYNA@mail.gmail.com>
Subject: Re: [PATCH] gpio: idt3243x: Fix IRQ check in idt_gpio_probe
To:     Miaoqian Lin <linmq006@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 14, 2022 at 7:51 AM Miaoqian Lin <linmq006@gmail.com> wrote:
>
> platform_get_irq() returns negative error number instead 0 on failure.
> And the doc of platform_get_irq() provides a usage example:
>
>     int irq = platform_get_irq(pdev, 0);
>     if (irq < 0)
>         return irq;
>
> Fix the check of return value to catch errors correctly.
>
> Fixes: 4195926aedca ("gpio: Add support for IDT 79RC3243x GPIO controller")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  drivers/gpio/gpio-idt3243x.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-idt3243x.c b/drivers/gpio/gpio-idt3243x.c
> index 50003ad2e589..08493b05be2d 100644
> --- a/drivers/gpio/gpio-idt3243x.c
> +++ b/drivers/gpio/gpio-idt3243x.c
> @@ -164,8 +164,8 @@ static int idt_gpio_probe(struct platform_device *pdev)
>                         return PTR_ERR(ctrl->pic);
>
>                 parent_irq = platform_get_irq(pdev, 0);
> -               if (!parent_irq)
> -                       return -EINVAL;
> +               if (parent_irq < 0)
> +                       return parent_irq;
>
>                 girq = &ctrl->gc.irq;
>                 girq->chip = &idt_gpio_irqchip;
> --
> 2.17.1
>

Queued for fixes, thanks!

Bart
