Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF1401581DE
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2020 18:59:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727254AbgBJR7c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Feb 2020 12:59:32 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:47088 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726809AbgBJR7b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Feb 2020 12:59:31 -0500
Received: by mail-pl1-f193.google.com with SMTP id y8so3099031pll.13
        for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2020 09:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:subject:in-reply-to:cc:to:message-id:mime-version
         :content-transfer-encoding;
        bh=pCOOvs7wgP9Kvj4DJOrAWEYZ2o8fXqpYVG+BiTgHmVc=;
        b=tHwli6sFHuojuCLon0/ryBewWROo+uN/yAbgmkGqIZJwRPwdmOdkYmng+ZvxsWshbl
         l6w0lKjgiDnA/24zxy5knJ7PId2iOUUUUEmLt0CbOBZ2/wuBqK/KLXjqgbQavyCPNoKL
         VkBPLORv4g4y6amBeTKwSxSkgTLGMS5gfvwcIH1PD0nVXmVg2CP/y3EpeMzGpv8nKjDA
         AIYFitsGZqHcHUQtcAjGvONsQu04Fre4sYAZQTK3B+h95lcT0GJSBrSxv+0thd/OKw7+
         xDnKk4C0Msz914E775JW3VP4y2f3cWfZgMUyWySGjAcY+NWRNiN7yBxVNxasWwN0sK2D
         RYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:subject:in-reply-to:cc:to:message-id
         :mime-version:content-transfer-encoding;
        bh=pCOOvs7wgP9Kvj4DJOrAWEYZ2o8fXqpYVG+BiTgHmVc=;
        b=ZFq3hlh6n19Quqf1XxTyT5jVnmXd0gNQ0rBzdQkvmaJpckgQ7Gk5BMCoUcRibdPF8Z
         qrOy9M2ZyxL9JjSN4dv+0AlA1Bl7zxByZv/iEysvoneblp6K44oH2qDdhhB8XY7pR+81
         id3hRtw9zn2tic3QmEJ1UR5fpzvaDC83OY5L+SawC61p9hn6Qza3oVR2YlcwfMgAFyCq
         uApDVHlFA80GuMQSgrIErnfEN1lix07zGb9Ffs3v9RV7kJ62m/V2OKXtZc0Fw5+mr8tp
         aagreadg4+Bj+8ZYIMxOWVdHihjcte38QOhATSSjbN6sfG2o49SiA/1YfGL9OeFzPoIv
         soqA==
X-Gm-Message-State: APjAAAVNz1JxXHxm1SfrkOGTdpI5y8nzFU/Oq0GGIJ/MzB7js1DoeQRu
        xj7SYVQ8WPn1JchMOBoGHcKg3S/Hfqs=
X-Google-Smtp-Source: APXvYqxAGmn4pRH4Znxw5xSkc/iSQ1uQ/8XO5AmkDzcftwKPqsBPYgIQRIhjSDhHSj++pUTaroWIGw==
X-Received: by 2002:a17:90a:fb45:: with SMTP id iq5mr237107pjb.93.1581357570204;
        Mon, 10 Feb 2020 09:59:30 -0800 (PST)
Received: from localhost (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id g13sm979000pfo.169.2020.02.10.09.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 09:59:28 -0800 (PST)
Date:   Mon, 10 Feb 2020 09:59:28 -0800 (PST)
X-Google-Original-Date: Mon, 10 Feb 2020 06:57:59 PST (-0800)
From:   Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject:     Re: [PATCH] gpio/sifive: fix static checker warning
In-Reply-To: <1580189061-14091-1-git-send-email-yash.shah@sifive.com>
CC:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Atish Patra <Atish.Patra@wdc.com>, wesley@sifive.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        yash.shah@sifive.com, sachin.ghadi@sifive.com,
        Mark Zyngier <maz@kernel.org>, linux-riscv@lists.infradead.org
To:     yash.shah@sifive.com
Message-ID: <mhng-5d97135c-42fa-437e-93e4-339b97d0123b@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 27 Jan 2020 21:24:21 PST (-0800), yash.shah@sifive.com wrote:
> Typcasting "irq_state" leads to the below static checker warning:
> The fix is to declare "irq_state" as unsigned long instead of u32.
>
> 	drivers/gpio/gpio-sifive.c:97 sifive_gpio_irq_enable()
> 	warn: passing casted pointer '&chip->irq_state' to
> 	'assign_bit()' 32 vs 64.
>
> Fixes: 96868dce644d ("gpio/sifive: Add GPIO driver for SiFive SoCs")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  drivers/gpio/gpio-sifive.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
> index 147a1bd..c54dd08 100644
> --- a/drivers/gpio/gpio-sifive.c
> +++ b/drivers/gpio/gpio-sifive.c
> @@ -35,7 +35,7 @@ struct sifive_gpio {
>  	void __iomem		*base;
>  	struct gpio_chip	gc;
>  	struct regmap		*regs;
> -	u32			irq_state;
> +	unsigned long		irq_state;
>  	unsigned int		trigger[SIFIVE_GPIO_MAX];
>  	unsigned int		irq_parent[SIFIVE_GPIO_MAX];
>  };
> @@ -94,7 +94,7 @@ static void sifive_gpio_irq_enable(struct irq_data *d)
>  	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>
>  	/* Enable interrupts */
> -	assign_bit(offset, (unsigned long *)&chip->irq_state, 1);
> +	assign_bit(offset, &chip->irq_state, 1);
>  	sifive_gpio_set_ie(chip, offset);
>  }
>
> @@ -104,7 +104,7 @@ static void sifive_gpio_irq_disable(struct irq_data *d)
>  	struct sifive_gpio *chip = gpiochip_get_data(gc);
>  	int offset = irqd_to_hwirq(d) % SIFIVE_GPIO_MAX;
>
> -	assign_bit(offset, (unsigned long *)&chip->irq_state, 0);
> +	assign_bit(offset, &chip->irq_state, 0);
>  	sifive_gpio_set_ie(chip, offset);
>  	irq_chip_disable_parent(d);
>  }

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

I'm assuming this is going to go in via some other tree (as I don't even have
gpio-sifive.c yet), but LMK if you want it via the RISC-V tree.

Thanks!
