Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B36472E9679
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jan 2021 14:59:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727012AbhADN6Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jan 2021 08:58:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726950AbhADN6Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jan 2021 08:58:24 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F517C061574
        for <linux-gpio@vger.kernel.org>; Mon,  4 Jan 2021 05:57:43 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id 6so36886986ejz.5
        for <linux-gpio@vger.kernel.org>; Mon, 04 Jan 2021 05:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BeeP3yRk/bhHZ1V+qH5FaZ6R48/gq1ft7J6mv0Fv7Es=;
        b=bxVREjl008NlXkrcsGITPmtwm3U/vTWeQQ2XVFbViSYwTwY/ilzgkuCejwHrlT/vHw
         Wah9OJufGICOV/7FRPd5CnCMSL4u1dEJ4CSc3lrWMJ+kZgkqXEZnuqLrGTA/KTEAmkfs
         7C+OtX8TGxeDNkEudrpVrbbXGvYvMweoPgOc5s8N02VGKq8gMl3bxyzBLAg2kVWwg6Y1
         cWrua9UMFi1CcWi83XlUHxVjR2YLqieXsnGqF0uDVbS1hvDVdJTwcjYdJbx9n6HS6o3d
         A8iRqqpLYznfOLGFYtBpxuVK9pn6oKHv/IiqA8W0KtOcdWfRN7TATXHn9fiZUe7Jbb8x
         owbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BeeP3yRk/bhHZ1V+qH5FaZ6R48/gq1ft7J6mv0Fv7Es=;
        b=TU/nvUjmCc+vS/kHBJ6Itjb1/nTK/qC6TuLix3fpffA87pKgLiAA3NQ5JvY/7XGrc5
         xjA8Ghn09VoMxuhvwa11gAMgmVzMqe8eAeAfBQo7QSP8iMivcwejUYHCSUhFKnLxqRn6
         cl1udlb9Iw8UrjE3vgoZT4STTpThH4b2dK4ttbdKN5lP0orPKHPfZJ0VkIW8gXSBljC2
         u9rAzQpuylqyeh2q4bQvXTav2nA2fOprlpcGPLmfaSGytQFKWx1W1Ofmk/a3OQ06u2vx
         V7LLGmz+uWO8iTHTMj+n5qA8S2ojLUtYtjAd6/XTPLEPZXbcSBGL0VU4SZwLkYyMsBpE
         nmlg==
X-Gm-Message-State: AOAM531b0oFhVnKiN+oAbLr1mxOuNroPgVurJaM9sKHRBnBxv635+5EV
        REguXZt8f0qq272a+oMO6LtuLQL+DJxBrKE8bJqv3Q==
X-Google-Smtp-Source: ABdhPJwygjQYaVyXYYsYfO/RFaWPlqe9Q/K8xUaV/B6Q5vmHbEe1KZKCW2FjL19LEBDIuFXdKT1SPuuFMmDMj6Sd4uQ=
X-Received: by 2002:a17:907:b09:: with SMTP id h9mr67907347ejl.155.1609768662442;
 Mon, 04 Jan 2021 05:57:42 -0800 (PST)
MIME-Version: 1.0
References: <20210102175859.335447-1-adam@l4re.org> <20210102175859.335447-5-adam@l4re.org>
In-Reply-To: <20210102175859.335447-5-adam@l4re.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 4 Jan 2021 14:57:31 +0100
Message-ID: <CAMpxmJVc=DQm7NSVAdLYWbrLSkHgpXy8HsJWQp17hAePF_=r=g@mail.gmail.com>
Subject: Re: [PATCH 5/6] gpiolib: Fix return check of __irq_domain_alloc_irqs
To:     Adam Lackorzynski <adam@l4re.org>
Cc:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        linusw@kernel.org, Imre Kaloz <kaloz@openwrt.org>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jan 2, 2021 at 6:59 PM Adam Lackorzynski <adam@l4re.org> wrote:
>
> 0 is not a proper IRQ number and also indicates failure.
>
> Signed-off-by: Adam Lackorzynski <adam@l4re.org>
> ---
>  drivers/gpio/gpiolib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index b02cc2abd3b6..9667e1a62626 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1003,7 +1003,7 @@ static void gpiochip_set_hierarchical_irqchip(struct gpio_chip *gc,
>                                                       &fwspec,
>                                                       false,
>                                                       NULL);
> -                       if (ret < 0) {
> +                       if (ret <= 0) {
>                                 chip_err(gc,
>                                          "can not allocate irq for GPIO line %d parent hwirq %d in hierarchy domain: %d\n",
>                                          i, parent_hwirq,
> --
> 2.30.0.rc2
>

Hi Adam,

Does this commit depend in any way on others in this series or can I
apply it directly for fixes?

Bart
