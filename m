Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DCD01E3DCC
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2020 11:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbgE0JoF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 May 2020 05:44:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbgE0JoE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 May 2020 05:44:04 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 768E3C03E96E
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2020 02:44:04 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id x11so8958075plv.9
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2020 02:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=awlaMQxYcrWZ+y35tNsqCu+m6+L2nOp+p5IYqcH4jSs=;
        b=S4JtBKVy7hNG1X43FKaF2Ca7I/E8fFPqNBs8HF+GuDwR7ijsU+VoviQHpVSeX5hVOJ
         pW1MG0+xPVb32wophvE8HkYzNNrlOYf8XaRBt3coCBIZ7VF/abNRMLozYx2slClzcjLW
         lgI1KisANNImp12uyhhbYxkMPXngQ3aPvfsY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=awlaMQxYcrWZ+y35tNsqCu+m6+L2nOp+p5IYqcH4jSs=;
        b=hsWTyD7wLiENtJvY2XE3MYV8thmmdbM8YfeiY4BcU8Elxk7PoZ6JoYf5wUMuuBrbga
         WobGdNhlhYyuGkGxDH39S1UlP0DVQioJcV9OdCwseD7rdTleNeDL0Z8FOTD2hYL/+J/G
         Ou6l4MHmFgvsRZsPMLwnWHTuK6v5lNx+qGL1oY0y8qxN7K/HYbnAvU84Jj4xnpkwnius
         hzkyvs6b3zY4b6+u1PJCL2Knk+lMIBvkyN5L7+kiqysZZS0RbuhAulkJ98dnpccigNdS
         0+bsFGI+U2zefQmUdlKAhQg64ouXT+esHHERJAEZIr36HLiVirnFE4sNphHzlToNgIum
         D+bw==
X-Gm-Message-State: AOAM531SRdJkJkqTVTKP1JUZ6UVk3ddPO6VGaiV8TmyEgTBelMMwi7R9
        vNog+enBrDTPt7JBpwJ5q2sgPw==
X-Google-Smtp-Source: ABdhPJxbNROSi0VGdE9OOJ9to01YkQqHSCDiJrVCpOSg+S2t+wr9Q12IB2h39kYxFJP2CAs3B7ekWw==
X-Received: by 2002:a17:90a:2009:: with SMTP id n9mr3628561pjc.81.1590572643896;
        Wed, 27 May 2020 02:44:03 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id k18sm1648198pfg.217.2020.05.27.02.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 02:44:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1590253873-11556-2-git-send-email-mkshah@codeaurora.org>
References: <1590253873-11556-1-git-send-email-mkshah@codeaurora.org> <1590253873-11556-2-git-send-email-mkshah@codeaurora.org>
Subject: Re: [PATCH v2 1/4] gpio: gpiolib: Allow GPIO IRQs to lazy disable
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org, tglx@linutronix.de,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, linus.walleij@linaro.org, maz@kernel.org,
        mka@chromium.org
Date:   Wed, 27 May 2020 02:44:02 -0700
Message-ID: <159057264232.88029.4708934729701385486@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Maulik Shah (2020-05-23 10:11:10)
> With 'commit 461c1a7d4733 ("gpiolib: override irq_enable/disable")' gpiol=
ib
> overrides irqchip's irq_enable and irq_disable callbacks. If irq_disable
> callback is implemented then genirq takes unlazy path to disable irq.
>=20
> Underlying irqchip may not want to implement irq_disable callback to lazy
> disable irq when client drivers invokes disable_irq(). By overriding
> irq_disable callback, gpiolib ends up always unlazy disabling IRQ.
>=20
> Allow gpiolib to lazy disable IRQs by overriding irq_disable callback only
> if irqchip implemented irq_disable. In cases where irq_disable is not
> implemented irq_mask is overridden. Similarly override irq_enable callback
> only if irqchip implemented irq_enable otherwise irq_unmask is overridden.
>=20
> Fixes: 461c1a7d47 (gpiolib: override irq_enable/disable)

This isn't a proper Fixes line. Should have quotes

Fixes: 461c1a7d4733 ("gpiolib: override irq_enable/disable")

> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/gpio/gpiolib.c      | 55 +++++++++++++++++++++++++++++----------=
------
>  include/linux/gpio/driver.h | 13 +++++++++++
>  2 files changed, 49 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index eaa0e20..3810cd0 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2465,32 +2465,37 @@ static void gpiochip_irq_relres(struct irq_data *=
d)
>         gpiochip_relres_irq(gc, d->hwirq);
>  }
> =20
> +static void gpiochip_irq_mask(struct irq_data *d)
> +{
> +       struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +
> +       if (gc->irq.irq_mask)
> +               gc->irq.irq_mask(d);
> +       gpiochip_disable_irq(gc, d->hwirq);

How does this work in the lazy case when I want to drive the GPIO? Say I
have a GPIO that is also an interrupt. The code would look like

 struct gpio_desc *gpio =3D gpiod_get(...)
 unsigned int girq =3D gpiod_to_irq(gpio)

 request_irq(girq, ...);

 disable_irq(girq);
 gpiod_direction_output(gpio, 1);

In the lazy case genirq wouldn't call the mask function until the first
interrupt arrived on the GPIO line. If that never happened then wouldn't
we be blocked in gpiod_direction_output() when the test_bit() sees
FLAG_USED_AS_IRQ? Or do we need irqs to be released before driving
gpios?

> +}
> +
> +static void gpiochip_irq_unmask(struct irq_data *d)
> +{
> +       struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +
> +       gpiochip_enable_irq(gc, d->hwirq);
> +       if (gc->irq.irq_unmask)
> +               gc->irq.irq_unmask(d);
> +}
> +
