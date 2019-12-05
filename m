Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA2B4114331
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2019 16:01:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729594AbfLEPB1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Dec 2019 10:01:27 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:54956 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729187AbfLEPB0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Dec 2019 10:01:26 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB5F1N9B113599;
        Thu, 5 Dec 2019 09:01:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1575558083;
        bh=kVjWTkxbTu+ix92FQJsmWGSjvOk5Uq16GRPwyVjnh7A=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Pn2vR5n8xdy2zwk6iPqDo/bY/3FCIMCoNBx6RAnGTmnn2mvTUQcLgT7fdWDUt7TNq
         Ji33bTbJt7oXQUc7MK/dr4O+hULhKbOEnNUxwE4CUHsURzC18sHMPdyJ3S5pH4ehox
         JYEs0JM8NsQpoju+ez2cKwrgrEfnKWH9EvloiDY0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB5F1NQK043567
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 5 Dec 2019 09:01:23 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 5 Dec
 2019 09:01:19 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 5 Dec 2019 09:01:19 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB5F1G3G016343;
        Thu, 5 Dec 2019 09:01:17 -0600
Subject: Re: [PATCH] gpio: pca953x: Read irq trigger type from DT
To:     Vignesh Raghavendra <vigneshr@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20191205144508.31339-1-vigneshr@ti.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <5837a37d-479d-5c33-45b5-c1b32b0cdc52@ti.com>
Date:   Thu, 5 Dec 2019 17:01:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191205144508.31339-1-vigneshr@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 05/12/2019 16:45, Vignesh Raghavendra wrote:
> Instead of hardcoding irq trigger type to IRQF_TRIGGER_LOW, let's
> respect settings specified in DT. Default to IRQF_TRIGGER_LOW,
> if DT does not provide a flag.
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
>   drivers/gpio/gpio-pca953x.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 6652bee01966..e0e2a77ef6ad 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -744,6 +744,7 @@ static int pca953x_irq_setup(struct pca953x_chip *chip, int irq_base)
>   	struct irq_chip *irq_chip = &chip->irq_chip;
>   	DECLARE_BITMAP(reg_direction, MAX_LINE);
>   	DECLARE_BITMAP(irq_stat, MAX_LINE);
> +	unsigned long irqflags;
>   	int ret;
>   
>   	if (!client->irq)
> @@ -768,10 +769,14 @@ static int pca953x_irq_setup(struct pca953x_chip *chip, int irq_base)
>   	bitmap_and(chip->irq_stat, irq_stat, reg_direction, chip->gpio_chip.ngpio);
>   	mutex_init(&chip->irq_lock);
>   
> +	irqflags = irq_get_trigger_type(client->irq);
> +	if (irqflags == IRQF_TRIGGER_NONE)
> +		irqflags = IRQF_TRIGGER_LOW;

I think you can just drop IRQF_TRIGGER_LOW:
- for paltform code it will be set from resources in platform_get_irq_optional()
- for DT code it will be set in __setup_irq()

> +	irqflags |= IRQF_ONESHOT | IRQF_SHARED;
> +
>   	ret = devm_request_threaded_irq(&client->dev, client->irq,
>   					NULL, pca953x_irq_handler,
> -					IRQF_TRIGGER_LOW | IRQF_ONESHOT |
> -					IRQF_SHARED,
> +					irqflags,
>   					dev_name(&client->dev), chip);
>   	if (ret) {
>   		dev_err(&client->dev, "failed to request irq %d\n",
> 

-- 
Best regards,
grygorii
