Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FC012192B3
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 23:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725964AbgGHVoi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 17:44:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbgGHVoi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 17:44:38 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A45FEC061A0B;
        Wed,  8 Jul 2020 14:44:37 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id q4so16938lji.2;
        Wed, 08 Jul 2020 14:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DKE3Qx4NqqHAmkA79Cwyh3cscqveKce5cBLWkBL9ZD8=;
        b=IXdyyE+PeuUsV96D/O0KARgoOKGVoT74bfHSsdCFeW+/91RGn9Gzixxdetrl9r2EJJ
         JDetKl632XdqCPqRI8GE8gXpS4KzWW/DCBmTNJB9juYM1BCGKzs+I3aIss2D4j+WX2/L
         iFwuOQulk4DCEueDpNTce2nBYBLKjxJf7ydrMMj6JTwDtckUPPZbORbYPNjq/bsrYz8V
         Bwb9ckLWcaKgZhbmRS6RGSmV5pRXHIwzYEsOsxqXvWnjbyy7ew0ZPJZoW4T8jTmEJiK/
         TzbUdVOJa7C8DbjIBZZ9XbWfm4/aVVIRTqXsCIfG8AnTV/3O3MGqui5V+3s4/tBA4NMv
         zvMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DKE3Qx4NqqHAmkA79Cwyh3cscqveKce5cBLWkBL9ZD8=;
        b=mlrewnWNEXQPdURTDNzp5dUytxx4EbZFp0oQJMrsm3JGHt5KtZON1yVg6IiQEhxud+
         TGzdesR45uJs8iVplQ2b3euBD0F5ncUbaHX/0/DmECKWj5AvFBFSndi7vtdKnRXP1fFS
         r5uqOjlA4J/RVtxnK73xOTq6VK3II98qSqsBYqu4ikeK0rfTo00VSaHgElNL2fz3/Q+j
         2W5pMrkeDq+nONRgo3cTGPqjYNRODDR7oR4fVoJ5XGRpe+DMrKuLcInqoWXbs05KEC51
         nzQTrnuR1cbnM8lanGim5Y9RR744vEnhMBw1B23vaGj6ioCFK8CgU2e67CMYaZ4tz1qr
         cB3A==
X-Gm-Message-State: AOAM532dbiNBXQmIzaRwqu3cDFGBucY1QWYT8Ul5qKBua7IxxIj4MqMh
        lV5nkuiBJekGtR8nrSwq+r46XoEN
X-Google-Smtp-Source: ABdhPJwZrbJ+l8PiY3hx9jTjb3F2/yOhxw6lamN9/8C6+B0kV2IEsPE/rw6SArJPQZAoUNtsoXq7rg==
X-Received: by 2002:a2e:9316:: with SMTP id e22mr32722271ljh.393.1594244675696;
        Wed, 08 Jul 2020 14:44:35 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-105.pppoe.mtu-net.ru. [91.79.162.105])
        by smtp.googlemail.com with ESMTPSA id k11sm241618ljg.37.2020.07.08.14.44.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 14:44:35 -0700 (PDT)
Subject: Re: [PATCH v3 3/6] gpio: max77620: Don't set of_node
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20200708202355.28507-1-digetx@gmail.com>
 <20200708202355.28507-4-digetx@gmail.com>
 <CAHp75VejftNuSqdYvd1YE1SdRON6=mQ_iD2dEr4K9D8YGgeRBQ@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <675c4691-d372-4fe1-d515-c86fdba2f588@gmail.com>
Date:   Thu, 9 Jul 2020 00:44:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VejftNuSqdYvd1YE1SdRON6=mQ_iD2dEr4K9D8YGgeRBQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

08.07.2020 23:57, Andy Shevchenko пишет:
> 
> 
> On Wednesday, July 8, 2020, Dmitry Osipenko <digetx@gmail.com
> <mailto:digetx@gmail.com>> wrote:
> 
>     The gpiochip_add_data() takes care of setting the of_node to the
>     parent's
>     device of_node, hence there is no need to do it manually in the driver's
>     code. This patch corrects the parent's device pointer and removes the
>     unnecessary setting of the of_node.
> 
> 
> I gave a second look and I think my suggestion is wrong. Here is an
> interesting propagation of the parent device node to its grand son,
> leaving son’s one untouched. Original code has intentions to do that way.

The [1] says that gpio_chip.parent should point at the "device providing
the GPIOs". That's the pdev->dev.parent in the case of this driver.
MAX77620 is an MFD PMIC device that has virtual sub-devices like GPIO
controller, PINCTRL and RTC. The MFD is the parent device that provides
the GPIOs [2].

[1]
https://elixir.bootlin.com/linux/v5.8-rc3/source/include/linux/gpio/driver.h#L276

[2]
https://elixir.bootlin.com/linux/v5.8-rc3/source/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi#L48

I think the old code was wrong and this patch is correct, please correct
me if I'm missing something.

>     Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com
>     <mailto:andy.shevchenko@gmail.com>>
>     Signed-off-by: Dmitry Osipenko <digetx@gmail.com
>     <mailto:digetx@gmail.com>>
>     ---
>      drivers/gpio/gpio-max77620.c | 5 +----
>      1 file changed, 1 insertion(+), 4 deletions(-)
> 
>     diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
>     index 7f7e8d4bf0d3..39d431da2dbc 100644
>     --- a/drivers/gpio/gpio-max77620.c
>     +++ b/drivers/gpio/gpio-max77620.c
>     @@ -279,7 +279,7 @@ static int max77620_gpio_probe(struct
>     platform_device *pdev)
>             mgpio->dev = &pdev->dev;
> 
>             mgpio->gpio_chip.label = pdev->name;
>     -       mgpio->gpio_chip.parent = &pdev->dev;
>     +       mgpio->gpio_chip.parent = pdev->dev.parent;
>             mgpio->gpio_chip.direction_input = max77620_gpio_dir_input;
>             mgpio->gpio_chip.get = max77620_gpio_get;
>             mgpio->gpio_chip.direction_output = max77620_gpio_dir_output;
>     @@ -288,9 +288,6 @@ static int max77620_gpio_probe(struct
>     platform_device *pdev)
>             mgpio->gpio_chip.ngpio = MAX77620_GPIO_NR;
>             mgpio->gpio_chip.can_sleep = 1;
>             mgpio->gpio_chip.base = -1;
>     -#ifdef CONFIG_OF_GPIO
>     -       mgpio->gpio_chip.of_node = pdev->dev.parent->of_node;
>     -#endif
> 
>             platform_set_drvdata(pdev, mgpio);
>      
>     -- 
>     2.26.0
> 
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

