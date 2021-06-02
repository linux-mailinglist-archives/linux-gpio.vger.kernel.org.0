Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83B16398AD5
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jun 2021 15:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbhFBNhn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Jun 2021 09:37:43 -0400
Received: from mail-yb1-f179.google.com ([209.85.219.179]:42920 "EHLO
        mail-yb1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbhFBNhn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Jun 2021 09:37:43 -0400
Received: by mail-yb1-f179.google.com with SMTP id x6so3828249ybl.9
        for <linux-gpio@vger.kernel.org>; Wed, 02 Jun 2021 06:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7y54rKSNGdkrAUoqhpn2Fjw3daxbe/zgPvjMo8fDxkE=;
        b=AODZrLfxfp66ey27tmS+muPaAjACfDUTxc4po/MAna8MQA+SUqwFY+DzYotk5VQmFz
         A3uFbRcWP9hFFVGGMpKUZKnsPwRbPAuDjUX83+Tjm3eWOBxXAeIaQqR9dM0/caOKFXsr
         7BrGLNaqcoajWLB8cpZhAoZKJGS4dKkgWhHXMO0TDTMlQ3wSdtJjEHJlXnqv/+mDcmZ9
         Fn8DwMbbCRh3s33NwVhPfYVn30y3iIVD/Kq/bC+McVp3V98WqlYrnVXe00J0I0pdTAv/
         Xs4Za4E8yUTxeN+/N4vOcdSzHzY4r52v1FSk+JmRwmtAakNERCGEAvmt6ga6QlvwuCey
         YOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7y54rKSNGdkrAUoqhpn2Fjw3daxbe/zgPvjMo8fDxkE=;
        b=CehD91019QwD47mpPViVvfusDKz8Ra2MTON3vRrEdY3QpwtLkg8SjuL/G9W7GTq5Hc
         sJ9Oy4En6ZY7bR7mC7EhG+2cflya9DtLKVFX6NKZyKqMTHc8xUIsV77zv/7YRN14aK2a
         3hhP8NRQQguk3ru3IyIcc27KsTdsl5A/sSauiEBKfYwSe5DN1WBsX9tipInvUaMsJeOv
         skvGwVFU23/vE1d+uj6HeGUkl3ZxVWvctKEcxSV9oK3PyIMG13ntj4R4peF/tBb/mMGs
         EnHMivDlpSwEWnizjVvySOJAE8Kp7kQ0xqL+04XVP5EBo/ZT+5NN5c9GG4hPHwFXEoXx
         mXRg==
X-Gm-Message-State: AOAM530pvQe0iiF85VKL/7N8kXYPi4pX7f/rSb5Jl7g1G8zdIM+VCaVJ
        W6u0473mTjaQEGnBDm6VXymjifg41glsomEUbCijKVDsqOE=
X-Google-Smtp-Source: ABdhPJwkyaLtGdIx4nMxydwWEO4QUlZ0SxgiPZQ9ls0Flty1oFgxtpYosn6RTHF4g6tKQlJ+IcVK7yH6YgU5Oe3D8R0=
X-Received: by 2002:a25:1b0b:: with SMTP id b11mr48646766ybb.302.1622640900244;
 Wed, 02 Jun 2021 06:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210601162128.35663-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210601162128.35663-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 2 Jun 2021 15:34:49 +0200
Message-ID: <CAMpxmJUogbSKEnm=c_s=yYwgCiLD6g56_k30jg84J+=v-=47yw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpio: dwapb: Drop redundant check in dwapb_irq_set_type()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 1, 2021 at 6:21 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> For more than 15 years we may not get into ->irq_set_type()
> without any meaningful type provided.
>
> Drop redundant check in dwapb_irq_set_type().
>
> See the commit e76de9f8eb67 ("[PATCH] genirq: add SA_TRIGGER support")
> out of curiosity.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-dwapb.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index d3233cc4b76b..939701c1465e 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -297,9 +297,6 @@ static int dwapb_irq_set_type(struct irq_data *d, u32 type)
>         irq_hw_number_t bit = irqd_to_hwirq(d);
>         unsigned long level, polarity, flags;
>
> -       if (type & ~IRQ_TYPE_SENSE_MASK)
> -               return -EINVAL;
> -
>         spin_lock_irqsave(&gc->bgpio_lock, flags);
>         level = dwapb_read(gpio, GPIO_INTTYPE_LEVEL);
>         polarity = dwapb_read(gpio, GPIO_INT_POLARITY);
> --
> 2.30.2
>

Applied, thanks!

Bart
