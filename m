Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0782D32ACE9
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:10:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383783AbhCBVSG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:18:06 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:55848 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1838142AbhCBJ3P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 04:29:15 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1229RZbM117601;
        Tue, 2 Mar 2021 03:27:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1614677255;
        bh=VKa9ZLInAy2XzS1IUg7DGYoE6OxMM/zNE7tI2sgufOA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=nBxjVUfBlRsYk2MpVi97OJS/jowTlC6jCid6bRscRLGZNrHe9wRt63lIkr+MNtN2/
         mqpHAEBGhvoT+ATAls/rEJsUrJKGrwFzUwUkHVVPQ772inAhNxvcin5ohos0G17bEg
         fCGWJqE0kk3NsU8vEwXtP+cQ/zMx7skQSzb/+OpU=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1229RZtZ004151
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 2 Mar 2021 03:27:35 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 2 Mar
 2021 03:27:34 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 2 Mar 2021 03:27:34 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1229RVZf054243;
        Tue, 2 Mar 2021 03:27:32 -0600
Subject: Re: [PATCH] gpio: omap: Honor "aliases" node
To:     Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        <linux-omap@vger.kernel.org>
CC:     Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20210302011813.2331879-1-alexander.sverdlin@gmail.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <eb34f303-4d05-4fcd-fb18-e304d06e6e2d@ti.com>
Date:   Tue, 2 Mar 2021 11:27:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210302011813.2331879-1-alexander.sverdlin@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 02/03/2021 03:18, Alexander Sverdlin wrote:
> Currently the naming of the GPIO chips depends on their order in the DT,
> but also on the kernel version (I've noticed the change from v5.10.x to
> v5.11). Honor the persistent enumeration in the "aliases" node like other
> GPIO drivers do.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
> Yes, I noticed checkpatch "WARNING: DT binding docs and includes should be
> a separate patch."
> However, the parts below are tiny and barely make sense separately.
> 
>   Documentation/devicetree/bindings/gpio/gpio-omap.txt | 6 ++++++
>   drivers/gpio/gpio-omap.c                             | 5 +++++
>   2 files changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-omap.txt b/Documentation/devicetree/bindings/gpio/gpio-omap.txt
> index e57b2cb28f6c..6050db3fd84e 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-omap.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio-omap.txt
> @@ -30,9 +30,15 @@ OMAP specific properties:
>   - ti,gpio-always-on: 	Indicates if a GPIO bank is always powered and
>   			so will never lose its logic state.
>   
> +Note: GPIO ports can have an alias correctly numbered in "aliases" node for
> +persistent enumeration.
>   
>   Example:
>   
> +aliases {
> +	gpio0 = &gpio0;
> +};
> +
>   gpio0: gpio@44e07000 {
>       compatible = "ti,omap4-gpio";
>       reg = <0x44e07000 0x1000>;
> diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
> index 41952bb818ad..dd2a8f6d920f 100644
> --- a/drivers/gpio/gpio-omap.c
> +++ b/drivers/gpio/gpio-omap.c
> @@ -1014,6 +1014,11 @@ static int omap_gpio_chip_init(struct gpio_bank *bank, struct irq_chip *irqc)
>   			bank->chip.parent = &omap_mpuio_device.dev;
>   		bank->chip.base = OMAP_MPUIO(0);
>   	} else {
> +#ifdef CONFIG_OF_GPIO
> +		ret = of_alias_get_id(bank->chip.of_node, "gpio");
> +		if (ret >= 0)
> +			gpio = ret * bank->width;
> +#endif
>   		label = devm_kasprintf(bank->chip.parent, GFP_KERNEL, "gpio-%d-%d",
>   				       gpio, gpio + bank->width - 1);
>   		if (!label)
> 

You're not the first one, this was not accepted. See [1]
[1] https://patchwork.kernel.org/project/linux-omap/patch/1465898604-16294-1-git-send-email-u.kleine-koenig@pengutronix.de/


-- 
Best regards,
grygorii
