Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8F7B2555E9
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Aug 2020 10:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728455AbgH1IBP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Aug 2020 04:01:15 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:55362 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726825AbgH1IBO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Aug 2020 04:01:14 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07S816o1002531;
        Fri, 28 Aug 2020 03:01:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1598601666;
        bh=Zzyzhv/OQz4cNObFcYrRq4lBDLY/NNdxY6FfGzwHF6w=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=B7nZqXpEi2vKISPyszqTsoXoA3ORDZsL1TGce2O+fB7l6YO+m52sj+eHcGrB8cRDu
         76mYYd0lexFBFeoN/L4T7L1b7eKn5PUFgdQgxwYIGlpZLcd4XMyXmoTLwiirVuuBC4
         m4XnMFLwpkS20QofU6siaQYbatCtsKWSzUfGqUwU=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07S816qf060270
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 28 Aug 2020 03:01:06 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 28
 Aug 2020 03:01:06 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 28 Aug 2020 03:01:06 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07S812qd033416;
        Fri, 28 Aug 2020 03:01:02 -0500
Subject: Re: [PATCH 3/6] gpio: omap: Simplify with dev_err_probe()
To:     Krzysztof Kozlowski <krzk@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Scott Branden <sbranden@broadcom.com>,
        <bcm-kernel-feedback-list@broadcom.com>,
        Keerthy <j-keerthy@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200827200827.26462-1-krzk@kernel.org>
 <20200827200827.26462-3-krzk@kernel.org>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <0013c2d6-6587-3646-35f2-3804fb5b244c@ti.com>
Date:   Fri, 28 Aug 2020 11:01:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200827200827.26462-3-krzk@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 27/08/2020 23:08, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>   drivers/gpio/gpio-omap.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
> index 7fbe0c9e1fc1..2dc12f4addbd 100644
> --- a/drivers/gpio/gpio-omap.c
> +++ b/drivers/gpio/gpio-omap.c
> @@ -1394,10 +1394,7 @@ static int omap_gpio_probe(struct platform_device *pdev)
>   	if (bank->irq <= 0) {
>   		if (!bank->irq)
>   			bank->irq = -ENXIO;
> -		if (bank->irq != -EPROBE_DEFER)
> -			dev_err(dev,
> -				"can't get irq resource ret=%d\n", bank->irq);
> -		return bank->irq;
> +		return dev_err_probe(dev, bank->irq, "can't get irq resource\n");
>   	}
>   
>   	bank->chip.parent = dev;
> 

Acked-by: Grygorii Strashko <grygorii.strashko@ti.com>

-- 
Best regards,
grygorii
