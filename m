Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBAE81AA085
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 14:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S369332AbgDOM2V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 08:28:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S369326AbgDOM2S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Apr 2020 08:28:18 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBC70C061A0C
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 05:28:17 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id z26so3394719ljz.11
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 05:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+CUsQfSAFCX5H3BgkvT7LF6qldIpFVwelcMclZMp0tw=;
        b=FQtUpbjZ/We/pwdoG/8bcAL459g/jEA3DuF9czzG8Iyc+ApTI2I7SE4g9E8jswfQFL
         XcxBl8u2nmvw7r8ZP6wmLUx5ZyIBgaMS9jY5SRMo/UdIheKQVKCtHOAI/w5v5Raj7EvY
         x36BiiJpPcUsq1AOAmaU9kM2pkT1yFu370OcrdA4jqrc5pi63h2fr3tkVLxyYeaZAZTh
         I1/mmI9YoDpmQCVCeeYtcYo9UXTC0oGecH7KYEl+zIKf3JRVMrgDtLbgk2zrzBe1ZcN1
         vAs30iGBZWaI86ygwfVM47JA8kWPgi3jGwDDNbjDC9nSxa3d7PI+JC/pL8IsLyWjLf07
         zsHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+CUsQfSAFCX5H3BgkvT7LF6qldIpFVwelcMclZMp0tw=;
        b=F/zP21qi5d5GfodFCAvlwD+8Z9vFSoSQJbYhwjAC8XXvAum4ZjiRhRwdOJMXYL2MwO
         PjSftJtiAh5SuDhdamB8ct5dmHqzunMOoMakl9f73zhpbDhTDE9icmmEvEk/NRW33htL
         ylsd0i6OHo+mrTr9BcanX2wEPeEiKVMEjc5I2CcFmAnvPLD9PTBBkoQ6GyKbbnhjzDU+
         oB31n7WatWYGiaoWOe/8N5jrcF9U8OPXhtdUEr9pN0xAA8ulce9XMP6OdUf3kpFgM3JC
         BOLRZj0iXiZHV0lZIwvHkyaWmgu4Lvti21kdvVhZKICJ8XIKOI390gCILVZtQSZaRAHT
         bvRA==
X-Gm-Message-State: AGi0PuYjIzBnyqSScFRUo4c5WtNWaz8UAfULxyxUKEMTr+NOPBAlzU5K
        KU9pUZ5IFEV6LJrk9pHus60=
X-Google-Smtp-Source: APiQypJwiWGTij84jI2L4uiJKDesxorJiGujQ46+n2W+LwEJPAoBadEH1kvS8xxVF2QgyMjBHPa07Q==
X-Received: by 2002:a2e:2413:: with SMTP id k19mr3226024ljk.134.1586953696311;
        Wed, 15 Apr 2020 05:28:16 -0700 (PDT)
Received: from mobilestation ([176.213.3.142])
        by smtp.gmail.com with ESMTPSA id a26sm11245588ljn.22.2020.04.15.05.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 05:28:15 -0700 (PDT)
Date:   Wed, 15 Apr 2020 15:28:13 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 04/13] gpio: dwapb: Deduplicate IRQ resource management
Message-ID: <20200415122813.6hzghzg45vnhwzx6@mobilestation>
References: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
 <20200409141228.49561-5-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409141228.49561-5-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 09, 2020 at 05:12:19PM +0300, Andy Shevchenko wrote:
> GPIO library provides default IRQ resource management hooks,
> there is no need to repeat this in the individual driver.
> 
> Remove them for good.

Great catch. Thanks.

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-dwapb.c | 27 ---------------------------
>  1 file changed, 27 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 588d5c61ae42..c0c267cddd80 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -250,31 +250,6 @@ static void dwapb_irq_disable(struct irq_data *d)
>  	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>  }
>  
> -static int dwapb_irq_reqres(struct irq_data *d)
> -{
> -	struct irq_chip_generic *igc = irq_data_get_irq_chip_data(d);
> -	struct dwapb_gpio *gpio = igc->private;
> -	struct gpio_chip *gc = &gpio->ports[0].gc;
> -	int ret;
> -
> -	ret = gpiochip_lock_as_irq(gc, irqd_to_hwirq(d));
> -	if (ret) {
> -		dev_err(gpio->dev, "unable to lock HW IRQ %lu for IRQ\n",
> -			irqd_to_hwirq(d));
> -		return ret;
> -	}
> -	return 0;
> -}
> -
> -static void dwapb_irq_relres(struct irq_data *d)
> -{
> -	struct irq_chip_generic *igc = irq_data_get_irq_chip_data(d);
> -	struct dwapb_gpio *gpio = igc->private;
> -	struct gpio_chip *gc = &gpio->ports[0].gc;
> -
> -	gpiochip_unlock_as_irq(gc, irqd_to_hwirq(d));
> -}
> -
>  static int dwapb_irq_set_type(struct irq_data *d, u32 type)
>  {
>  	struct irq_chip_generic *igc = irq_data_get_irq_chip_data(d);
> @@ -428,8 +403,6 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
>  		ct->chip.irq_set_type = dwapb_irq_set_type;
>  		ct->chip.irq_enable = dwapb_irq_enable;
>  		ct->chip.irq_disable = dwapb_irq_disable;
> -		ct->chip.irq_request_resources = dwapb_irq_reqres;
> -		ct->chip.irq_release_resources = dwapb_irq_relres;
>  #ifdef CONFIG_PM_SLEEP
>  		ct->chip.irq_set_wake = dwapb_irq_set_wake;
>  #endif
> -- 
> 2.25.1
> 
