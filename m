Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD003E8BC6
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 10:27:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233424AbhHKI1W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 04:27:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233167AbhHKI1W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Aug 2021 04:27:22 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F531C061765;
        Wed, 11 Aug 2021 01:26:59 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id z2so4060219lft.1;
        Wed, 11 Aug 2021 01:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/lpMhbnC21FDHMR8xdirHpqvXJQ09kwRN9ZI2UrfoaE=;
        b=AagWYMqEQmScnLi/04lKwMs5IijtId6QepuX6prnIW7y0a8HLJ1itsMdQVQQATpXMh
         7AaH0jXHllX1MNdqvzg8wbNbYvTqO78U4qXnIneQoNDb+Y4qCvpjDiXGzMGeXtVddJtT
         ZgFmUYnZPtgJJjitP25266SAR7S/bfd7ZyRVPdDCEWfjN5DOiTN+Hx8wr+baXxaHOHfw
         oA58g+5vZHx9xkMw4ooyCSmTgrRNjx2GMAYsuoyYMsWsIWAp5GhxY3LUKxQIaFMM/QOa
         oHPsQd2S4wH/UbwNL/gCfuTqv5Ed0J9WKxSkTtMzcUhJC4vMiWMyVVppUfmkIo/Q/lJS
         +gTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/lpMhbnC21FDHMR8xdirHpqvXJQ09kwRN9ZI2UrfoaE=;
        b=ueRzV9hE4qYwb6CSxfnlqrhIUHcYwL3ukKQzYyEds5hO+VHk58StrdeG1Z9pMjlltR
         WLnxUWwfW94lZadhK0UmJe9ontBlvk42G2WfpsPsNqKharoJ1BL4hVswVaJ6/iO20LJl
         xMxnHTzgjpNeAg2Q7D62ESAt25dR5fBX0PW0P7mxF/2TMuVLAVTGPxSYi7XhsKYjhahN
         qu5qCT/TD+VkIWvWjfihM5YddUDJDnU/V+R9DKBXUDFni/N5tP6r8sc9p/nvZUUJtARI
         rbalEAX5hvL88i9jT7hSkjXpwpbLYl3B7bvs0r3EFaDvSXDZTppCaSP/1rbcAzCuDLwi
         C4cw==
X-Gm-Message-State: AOAM533ltFvntPz12h2niWqIk7ttF5MrdFr9VZXsP/9yhyrKMft+aKtL
        p5Dek87pDt1JG21I9iNxyXarTr8+VlmqgMAJng==
X-Google-Smtp-Source: ABdhPJypw8J2sfflG+rWDduystYK9AowmnMyHSeBge1bqXX74mpiRmG15rJmYR0IvlGjxDWR6eeWp+/TEcDvUHh6/V0=
X-Received: by 2002:a05:6512:2292:: with SMTP id f18mr3492166lfu.148.1628670417383;
 Wed, 11 Aug 2021 01:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210809201513.12367-1-mario.limonciello@amd.com>
In-Reply-To: <20210809201513.12367-1-mario.limonciello@amd.com>
From:   Gabriel C <nix.or.die@googlemail.com>
Date:   Wed, 11 Aug 2021 10:26:31 +0200
Message-ID: <CAEJqkggAQ3=ppMHr7fAirHspOgHRkrDDxCb59MX8Sy=U0qvk0g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: amd: Fix an issue with shutdown when system set
 to s0ix
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Raul E Rangel <rrangel@chromium.org>,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am Mo., 9. Aug. 2021 um 22:15 Uhr schrieb Mario Limonciello
<mario.limonciello@amd.com>:
>
> IRQs are getting armed on shutdown causing the system to immediately
> wake back up.
>
> Link: https://lkml.org/lkml/2021/8/2/1114
> Reported-by: nix.or.die@googlemail.com
> CC: Raul E Rangel <rrangel@chromium.org>
> Fixes: d62bd5ce12d7 ("pinctrl: amd: Implement irq_set_wake")
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/pinctrl/pinctrl-amd.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
> index a76be6cc26ee..5b764740b829 100644
> --- a/drivers/pinctrl/pinctrl-amd.c
> +++ b/drivers/pinctrl/pinctrl-amd.c
> @@ -444,8 +444,7 @@ static int amd_gpio_irq_set_wake(struct irq_data *d, unsigned int on)
>         unsigned long flags;
>         struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>         struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
> -       u32 wake_mask = BIT(WAKE_CNTRL_OFF_S0I3) | BIT(WAKE_CNTRL_OFF_S3) |
> -                       BIT(WAKE_CNTRL_OFF_S4);
> +       u32 wake_mask = BIT(WAKE_CNTRL_OFF_S0I3) | BIT(WAKE_CNTRL_OFF_S3);
>
>         raw_spin_lock_irqsave(&gpio_dev->lock, flags);
>         pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
> --

Is working fine again with this fix.

Best Regards,

Gabriel C
