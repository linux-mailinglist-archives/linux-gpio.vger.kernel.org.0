Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBF2828092F
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Oct 2020 23:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727017AbgJAVIH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Oct 2020 17:08:07 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:58508 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733038AbgJAVIG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Oct 2020 17:08:06 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 091L7tiQ047257;
        Thu, 1 Oct 2020 16:07:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1601586475;
        bh=2oZBWNZqaZrC4yJS+AwFKzI95TqZ2hXyB25JHxfNJ0c=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=tRHUwCXhcpj8JHtOfpeqiGToyrg3VHbJP7dZ0lHQ8kFFkeNbxeqTbwTUrFuvK9k2p
         FHzZFgL1MAUCZ+57ieWcosHIIk98LS/BbEu6V+3SXXcH/1O/PHe/h1to9Eqn3wrxze
         tdPs0JeDTuq/e7e4OYMGaeKz/Pgbo/G7zxvoAq5M=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 091L7tBR024863
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 1 Oct 2020 16:07:55 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 1 Oct
 2020 16:07:55 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 1 Oct 2020 16:07:55 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 091L7p1k078375;
        Thu, 1 Oct 2020 16:07:52 -0500
Subject: Re: [PATCH] gpio: pca953x: Use irqchip template
To:     Linus Walleij <linus.walleij@linaro.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>
CC:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Adam Ford <aford173@gmail.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
References: <20200717144040.63253-1-linus.walleij@linaro.org>
 <20200930104729.ajufkrklfhf25d55@NiksLab>
 <CACRpkdaOAdcO4P-3MphdV7bq1-CfMr0KR96+iPvJrsEX1nZeNQ@mail.gmail.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <2ced9bd9-9446-5060-18a4-d743238277fc@ti.com>
Date:   Fri, 2 Oct 2020 00:07:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdaOAdcO4P-3MphdV7bq1-CfMr0KR96+iPvJrsEX1nZeNQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

hi Linus,

On 30/09/2020 16:51, Linus Walleij wrote:
> On Wed, Sep 30, 2020 at 12:47 PM Nikhil Devshatwar <nikhil.nd@ti.com> wrote:
> 
>> I am getting a kernel crash on K3 j721e common processor board
>> when HDMI is plugged in. Following is the full log with crash
>> for NULL pointer derefence
>>
>> https://pastebin.ubuntu.com/p/wBPS2ymmqR/
>>
>> Upon inspection, I found that the "irq_find_mapping" call
>> in the "pca953x_irq_handler" returns 0 and the same is passed
>> to "handle_nested_irq"
> 
> This would typically happen if the driver using an IRQ
> from the PCA953x does not properly request it.
> 
> Is this caused by this IRQ 504 from your /proc/interrupts:
> 
> 504:          0          0    4-0021  10 Edge      HPD
> 
> This seems to be requested directly by the HDMI bridge
> and not by the TI display controller.
> 
> I look in the k3-am654-base-board.dts in the upstream
> kernel and I find this:
> 
> &main_i2c0 {
>          pinctrl-names = "default";
>          pinctrl-0 = <&main_i2c0_pins_default>;
>          clock-frequency = <400000>;
> 
>          pca9555: gpio@21 {
>                  compatible = "nxp,pca9555";
>                  reg = <0x21>;
>                  gpio-controller;
>                  #gpio-cells = <2>;
>          };
> };
> 
> This is the GPIO controller used here, right?
> 
> I notice the following:
> - There are no HDMI bridges using this GPIO controller in
>    the upstream kernel.
> - The PCA9555 here lacks necessary attributes such as
>    parent IRQ (another GPIO) and the "interrupt-controller"
>    and "#interrupt-cells".
> 
> So this can not be the device tree you are using.
> 
> Can you point us to:
> - The actual device tree you are booting from?
> - The actual bridge that is requesting the HPD IRQ?
> - The upstream code for this bridge?

We've just got another similar report, don't know the root cause, but it's not HDMI

There is one i see with this patch

-       ret = devm_gpiochip_add_data(&client->dev, &chip->gpio_chip, chip);

[GS] before: GPIO chip fully initialized

+       ret = pca953x_irq_setup(chip, irq_base);

[GS] after: IRQ chip related data initialized and Parent IRQ requested

         if (ret)
                 goto err_exit;
  
-       ret = pca953x_irq_setup(chip, irq_base);
+       ret = devm_gpiochip_add_data(&client->dev, &chip->gpio_chip, chip);

[GS] after: But GPIO chip and IRQ chip are fully initialized only here, so any IRQ before devm_gpiochip_add_data may crash.

         if (ret)
                 goto err_exit;


-- 
Best regards,
grygorii
