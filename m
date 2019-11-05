Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5E81F04CB
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 19:14:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390569AbfKESOs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 13:14:48 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35812 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390452AbfKESOr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 13:14:47 -0500
Received: by mail-wr1-f66.google.com with SMTP id l10so22577652wrb.2
        for <linux-gpio@vger.kernel.org>; Tue, 05 Nov 2019 10:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Mw8czg66zR2+XmJKwa/SXDogHRiTTqLG37/U0FeQDZg=;
        b=es3U/VTnDu+3ZM21xrCRx4/uVUrsUqwUTRpNRnvLrAbHOVmG+6WQf77+yKNgRhhGMx
         2wlKSomvPnoON7hMHNQ/XyukARpjX6NdkzxmVDIz+I3iDEExZGT65Q93GxMksYMPWqnP
         Aj1BZX+rzUEtq/tgb/h1VhsCsFb+XKeCSV/qc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Mw8czg66zR2+XmJKwa/SXDogHRiTTqLG37/U0FeQDZg=;
        b=LtNzy6KHODO2KemQIHQf62uZ7NSmvT2A4+nG3rNzOn5GRg84CopslBm6Lli1u4nATV
         TshiKP6F+NZ6fzzm2fFQno0EvWeOTdXA1BzzKYIrzvN4tL4x6MEurWztR93qtCDlrkL/
         vTrR5+JBM+soYwg2icDGqaa6RiuXlqoydY7dUSkE7xvmw4zBj5gVSlcT/nZqg0/zx1aZ
         wACZsKilNcrnUgF7RNNXVedg4quIuCyQNM08VF6uq6BzgNqGOmkN6SZIBPwZD1/Ofq0a
         pFsryHIW8SKhSWkCsm4Vh6zTf7OUtle7z/1U1w5ssEFJNTQ5CysEIefIncgRcmyem0gW
         PQVA==
X-Gm-Message-State: APjAAAVB0A9noLKOhy23qpgFkzDPZ76DdTiVd0pkPrJ+HjcRv0uwgF/y
        n2FPT511CL3tRbEmupzSlKYrn26f54DSv2xA
X-Google-Smtp-Source: APXvYqz3lwEhvIyzPTbk4V3OVt/etmjJyMV0E398p2+KNGQJzZjbszoYvSVEBrTbNZbnkL8toT4L5Q==
X-Received: by 2002:adf:da4a:: with SMTP id r10mr30681330wrl.356.1572977685512;
        Tue, 05 Nov 2019 10:14:45 -0800 (PST)
Received: from [10.136.13.65] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id b4sm37107131wrh.87.2019.11.05.10.14.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Nov 2019 10:14:44 -0800 (PST)
Subject: Re: [PATCH 08/62] gpio: gpio-bcm-kona: Use new GPIO_LINE_DIRECTION
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        mazziesaccount@gmail.com
Cc:     Ray Jui <rjui@broadcom.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1572945719.git.matti.vaittinen@fi.rohmeurope.com>
 <47840e5f6268d598ed511dcdefcfeb9435109c21.1572945719.git.matti.vaittinen@fi.rohmeurope.com>
From:   Scott Branden <scott.branden@broadcom.com>
Message-ID: <2820c3aa-0fc0-a18a-7043-00d12d8cf6b4@broadcom.com>
Date:   Tue, 5 Nov 2019 10:14:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <47840e5f6268d598ed511dcdefcfeb9435109c21.1572945719.git.matti.vaittinen@fi.rohmeurope.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Unlike some other opinions I've seen, I like the use of an 
understandable define.

On 2019-11-05 2:13 a.m., Matti Vaittinen wrote:
> t's hard for occasional GPIO code reader/writer to know if values 0/1
> equal to IN or OUT. Use defined GPIO_LINE_DIRECTION_IN and
> GPIO_LINE_DIRECTION_OUT to help them out.
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Acked-by: Scott Branden <scott.branden@broadcom.com>
> ---
>   drivers/gpio/gpio-bcm-kona.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
> index 9fa6d3a967d2..4122683eb1f9 100644
> --- a/drivers/gpio/gpio-bcm-kona.c
> +++ b/drivers/gpio/gpio-bcm-kona.c
> @@ -127,7 +127,7 @@ static int bcm_kona_gpio_get_dir(struct gpio_chip *chip, unsigned gpio)
>   	u32 val;
>   
>   	val = readl(reg_base + GPIO_CONTROL(gpio)) & GPIO_GPCTR0_IOTR_MASK;
> -	return !!val;
> +	return val ? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
>   }
>   
>   static void bcm_kona_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
> @@ -144,7 +144,7 @@ static void bcm_kona_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
>   	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
>   
>   	/* this function only applies to output pin */
> -	if (bcm_kona_gpio_get_dir(chip, gpio) == 1)
> +	if (bcm_kona_gpio_get_dir(chip, gpio) == GPIO_LINE_DIRECTION_IN)
>   		goto out;
>   
>   	reg_offset = value ? GPIO_OUT_SET(bank_id) : GPIO_OUT_CLEAR(bank_id);
> @@ -170,7 +170,7 @@ static int bcm_kona_gpio_get(struct gpio_chip *chip, unsigned gpio)
>   	reg_base = kona_gpio->reg_base;
>   	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
>   
> -	if (bcm_kona_gpio_get_dir(chip, gpio) == 1)
> +	if (bcm_kona_gpio_get_dir(chip, gpio) == GPIO_LINE_DIRECTION_IN)
>   		reg_offset = GPIO_IN_STATUS(bank_id);
>   	else
>   		reg_offset = GPIO_OUT_STATUS(bank_id);

