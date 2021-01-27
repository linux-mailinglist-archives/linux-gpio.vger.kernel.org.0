Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC93305B3B
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 13:25:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236438AbhA0MYv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 07:24:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237866AbhA0MWF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2021 07:22:05 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CB6AC061788;
        Wed, 27 Jan 2021 04:21:25 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id i9so1474087wmq.1;
        Wed, 27 Jan 2021 04:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=6wzhM0vYiCJZX/iFlWpvlgaHX6fMT0ar8DkHkOnklLo=;
        b=qszFMFNNVkARa3XOYQlsRtBUli5kzHIrCzcp2oQdStspXx8PAIPcTP+JEPWh1BhcWp
         WYkQsi9hSMJw/etFq3lcDCJ6pmmBtdJGuxVf5nBSUjYEu0HLti1RKsqkx1CliSE+Fzpg
         vXp6gkCxWJMgg5gPSI3U8hofi/EkeQQMloTty5cQPidk3NDgE7Z0iUvCtGl0UahH8ATA
         ocyTarVDhEEtuSWTYyehDTClnk+2FS19wHFGO5ftJtCgWQnq4daQoI0abAnscpL4dRPU
         oERI6tCpdGqmNWWpWbCFevVHXplpGSaIhWdZ+CXP9SIsiSX8W8miLtXiRklPdp+jWzRQ
         qqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=6wzhM0vYiCJZX/iFlWpvlgaHX6fMT0ar8DkHkOnklLo=;
        b=K8SUK0LQrZqEORrNNTYEGC2Qk4KHTcXNDGDMWCMwTZ4Yeg3gkldmuS2hgsZxES+Zcw
         h+ZWqI+fwTnUuM68XbPw5qzYL7HSky1S1pl8SpRs5IBg7+DiWpoqzY5ye9Oj4+VnlPqH
         u+bjvYSb9xhwcY8JtmECLzn5ALQ3s6fYlPeA0W76/3xnKTzaaukZlqP2cXZPrLiowXnX
         JOERJWwHu+hxTh5rP9xNaifVUuIhI2kqMm+DrQbnWfACJup9j3qT+mnPannPbWNZFjFC
         ikJFvtzmByf5/t/4H559bq05V/+bC928UgMGS+F0gykw7GQl41htYmMGZdJHOMqSRthd
         AsXw==
X-Gm-Message-State: AOAM53093p1zFjClAgZcS5vXa0uad5aJvYmSXbvplp2nMsqGzdG0Dg/V
        2OEsUXktfKoEeFJqNgXwD+I=
X-Google-Smtp-Source: ABdhPJydU2J+Sg2HOmDomq+Z5srxSDfdoZgIvjYqDKBoALGWhkkabAj7a7Opbx3wxAk3eQpIpLKOBA==
X-Received: by 2002:a05:600c:3515:: with SMTP id h21mr3976949wmq.179.1611750083788;
        Wed, 27 Jan 2021 04:21:23 -0800 (PST)
Received: from [192.168.1.21] ([195.245.17.255])
        by smtp.gmail.com with ESMTPSA id n125sm2438268wmf.30.2021.01.27.04.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 04:21:22 -0800 (PST)
Message-ID: <00f0e7a1d276b0efe5005d0645fdc9d9e86376c0.camel@gmail.com>
Subject: Re: [PATCH v2 4/9] gpio: ep93xx: drop to_irq binding
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 27 Jan 2021 13:21:22 +0100
In-Reply-To: <20210127104617.1173-5-nikita.shubin@maquefel.me>
References: <20201228150052.2633-1-nikita.shubin@maquefel.me>
         <20210127104617.1173-1-nikita.shubin@maquefel.me>
         <20210127104617.1173-5-nikita.shubin@maquefel.me>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi!

On Wed, 2021-01-27 at 13:46 +0300, Nikita Shubin wrote:
> As ->to_irq is redefined in gpiochip_add_irqchip, having it defined
> in
> driver is useless, so let's drop it.
> 
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
>  drivers/gpio/gpio-ep93xx.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
> index 9c3d049e5af7..dee19372ebbd 100644
> --- a/drivers/gpio/gpio-ep93xx.c
> +++ b/drivers/gpio/gpio-ep93xx.c
> @@ -337,11 +337,6 @@ static int ep93xx_gpio_set_config(struct
> gpio_chip *gc, unsigned offset,
>         return 0;
>  }
>  
> -static int ep93xx_gpio_f_to_irq(struct gpio_chip *gc, unsigned
> offset)
> -{
> -       return EP93XX_GPIO_F_IRQ_BASE + offset;
> -}
> -
>  static void ep93xx_init_irq_chips(struct ep93xx_gpio *epg)
>  {
>         int i;
> @@ -429,7 +424,6 @@ static int ep93xx_gpio_add_bank(struct gpio_chip
> *gc,
>                 }
>                 girq->default_type = IRQ_TYPE_NONE;
>                 girq->handler = handle_level_irq;
> -               gc->to_irq = ep93xx_gpio_f_to_irq;
>                 girq->first = EP93XX_GPIO_F_IRQ_BASE;
>         }
>  

-- 
Alexander Sverdlin.


