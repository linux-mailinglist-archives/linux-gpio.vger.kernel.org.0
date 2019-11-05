Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 510FFEFC54
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 12:27:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730703AbfKEL1P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 06:27:15 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:54914 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730624AbfKEL1P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 06:27:15 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA5BR7lA061552;
        Tue, 5 Nov 2019 05:27:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572953227;
        bh=gVRqoU4DY2RZFqcIAa7kQA6NvFoO5m5yaA/iykLARlc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=jsoCfvmiDdSviAW4wklT+kWNDAUo0ChRzqh3HjEV3DxA+V9+IS0Xjq8YohXSePRX6
         u1FN588Eo6xgEB/i4C9y7vq7kdzRysdPykBFgoETWFhjt958bqsGyGIbCMf489G+y0
         sJWtLPiv+wPsMjYKF9iQjTjqw+ArX2IGVuWSsGMc=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5BR7YV000512;
        Tue, 5 Nov 2019 05:27:07 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 5 Nov
 2019 05:26:52 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 5 Nov 2019 05:26:52 -0600
Received: from [10.250.98.116] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5BR4BI033326;
        Tue, 5 Nov 2019 05:27:05 -0600
Subject: Re: [PATCH 28/62] gpio: gpio-omap: Use new GPIO_LINE_DIRECTION
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        <mazziesaccount@gmail.com>
CC:     Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <linux-omap@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <cover.1572945849.git.matti.vaittinen@fi.rohmeurope.com>
 <b27b35f4db5f05994e64e3bb78f0c632bef61e6f.1572945849.git.matti.vaittinen@fi.rohmeurope.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <90a8b355-8092-38c8-2f7d-a65f0e1ce746@ti.com>
Date:   Tue, 5 Nov 2019 13:27:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b27b35f4db5f05994e64e3bb78f0c632bef61e6f.1572945849.git.matti.vaittinen@fi.rohmeurope.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 05/11/2019 12:25, Matti Vaittinen wrote:
> It's hard for occasional GPIO code reader/writer to know if values 0/1
> equal to IN or OUT. Use defined GPIO_LINE_DIRECTION_IN and
> GPIO_LINE_DIRECTION_OUT to help them out.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>   drivers/gpio/gpio-omap.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
> index d0f27084a942..3bd8adaeed9e 100644
> --- a/drivers/gpio/gpio-omap.c
> +++ b/drivers/gpio/gpio-omap.c
> @@ -805,8 +805,10 @@ static int omap_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
>   {
>   	struct gpio_bank *bank = gpiochip_get_data(chip);
>   
> -	return !!(readl_relaxed(bank->base + bank->regs->direction) &
> -		  BIT(offset));
> +	if (readl_relaxed(bank->base + bank->regs->direction) & BIT(offset))
> +		return GPIO_LINE_DIRECTION_IN;
> +
> +	return GPIO_LINE_DIRECTION_OUT;
>   }
>   
>   static int omap_gpio_input(struct gpio_chip *chip, unsigned offset)
> 

Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>

-- 
Best regards,
grygorii
