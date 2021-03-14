Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CFCB33A204
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Mar 2021 01:11:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231329AbhCNALW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 13 Mar 2021 19:11:22 -0500
Received: from ssl.serverraum.org ([176.9.125.105]:58185 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231205AbhCNAKu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 13 Mar 2021 19:10:50 -0500
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id EA3E2221E7;
        Sun, 14 Mar 2021 01:10:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1615680649;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CArUhgccz60akY+iGfaPxRA2rkQkB7wW1PNA5bfPIJY=;
        b=UV/DZF1/fu9sw+NakBSFkOpJPhMyQnvXsZDsqKGMf3m8uSofTKuxz6aHY33zr11Cdmy3eY
        dWyqv8zspqtgblBF2aYNjzDawBika4tl+pkVfN4STk308vsUXwW+07GBsgHbpT+RyNiMEG
        dyH2nt6JOKBkbaDNeGCR0HGXN21dH/Q=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sun, 14 Mar 2021 01:10:48 +0100
From:   Michael Walle <michael@walle.cc>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Ran Wang <ran.wang_1@nxp.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpio: mpc8xxx: Add ACPI support
In-Reply-To: <CAMpxmJUjzL_6rU+45qWLABBFjkXoS3hBz3TzoP3VJErNOTFdWQ@mail.gmail.com>
References: <20210312065855.37072-1-ran.wang_1@nxp.com>
 <CAMpxmJUjzL_6rU+45qWLABBFjkXoS3hBz3TzoP3VJErNOTFdWQ@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <2c27e99e22169304c8fa5d3f42084b20@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2021-03-12 12:07, schrieb Bartosz Golaszewski:
> On Fri, Mar 12, 2021 at 7:51 AM Ran Wang <ran.wang_1@nxp.com> wrote:
>> 
>> Current implementation only supports DT, now add ACPI support.
>> 
>> Note that compared to device of 'fsl,qoriq-gpio', LS1028A and
>> LS1088A's GPIO have no extra programming, so simplify related 
>> checking.
>> 
>> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
>> ---
>>  drivers/gpio/gpio-mpc8xxx.c | 50 
>> +++++++++++++++++++++++++++----------
>>  1 file changed, 37 insertions(+), 13 deletions(-)
>> 
>> diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
>> index 6dfca83bcd90..de5b7e17cde3 100644
>> --- a/drivers/gpio/gpio-mpc8xxx.c
>> +++ b/drivers/gpio/gpio-mpc8xxx.c
>> @@ -9,6 +9,7 @@
>>   * kind, whether express or implied.
>>   */
>> 
>> +#include <linux/acpi.h>
>>  #include <linux/kernel.h>
>>  #include <linux/init.h>
>>  #include <linux/spinlock.h>
>> @@ -292,8 +293,6 @@ static const struct of_device_id 
>> mpc8xxx_gpio_ids[] = {
>>         { .compatible = "fsl,mpc5121-gpio", .data = 
>> &mpc512x_gpio_devtype, },
>>         { .compatible = "fsl,mpc5125-gpio", .data = 
>> &mpc5125_gpio_devtype, },
>>         { .compatible = "fsl,pq3-gpio",     },
>> -       { .compatible = "fsl,ls1028a-gpio", },
>> -       { .compatible = "fsl,ls1088a-gpio", },
> 
> Why are you removing support for those?

I guess because it doesn't matter because usually
  compatible = "fsl,ls1028a-gpio", "fsl,qoriq-gpio";
is used. But I just had a look at the dt binding and it doesn't
mandate it. So please keep it.

-michael

> 
> Bart
> 
>>         { .compatible = "fsl,qoriq-gpio",   },
>>         {}
>>  };
>> @@ -303,10 +302,19 @@ static int mpc8xxx_probe(struct platform_device 
>> *pdev)
>>         struct device_node *np = pdev->dev.of_node;
>>         struct mpc8xxx_gpio_chip *mpc8xxx_gc;
>>         struct gpio_chip        *gc;
>> -       const struct mpc8xxx_gpio_devtype *devtype =
>> -               of_device_get_match_data(&pdev->dev);
>> +       const struct mpc8xxx_gpio_devtype *devtype;
>> +       const struct acpi_device_id *acpi_id;
>>         int ret;
>> 
>> +       if (pdev->dev.of_node) {
>> +               devtype = of_device_get_match_data(&pdev->dev);
>> +       } else {
>> +               acpi_id = 
>> acpi_match_device(pdev->dev.driver->acpi_match_table,
>> +                                               &pdev->dev);
>> +               if (acpi_id)
>> +                       devtype = (struct mpc8xxx_gpio_devtype *) 
>> acpi_id->driver_data;
>> +       }
>> +
>>         mpc8xxx_gc = devm_kzalloc(&pdev->dev, sizeof(*mpc8xxx_gc), 
>> GFP_KERNEL);
>>         if (!mpc8xxx_gc)
>>                 return -ENOMEM;
>> @@ -315,14 +323,14 @@ static int mpc8xxx_probe(struct platform_device 
>> *pdev)
>> 
>>         raw_spin_lock_init(&mpc8xxx_gc->lock);
>> 
>> -       mpc8xxx_gc->regs = of_iomap(np, 0);
>> +       mpc8xxx_gc->regs = devm_platform_ioremap_resource(pdev, 0);
>>         if (!mpc8xxx_gc->regs)
>>                 return -ENOMEM;
>> 
>>         gc = &mpc8xxx_gc->gc;
>>         gc->parent = &pdev->dev;
>> 
>> -       if (of_property_read_bool(np, "little-endian")) {
>> +       if (device_property_read_bool(&pdev->dev, "little-endian")) {
>>                 ret = bgpio_init(gc, &pdev->dev, 4,
>>                                  mpc8xxx_gc->regs + GPIO_DAT,
>>                                  NULL, NULL,
>> @@ -369,10 +377,14 @@ static int mpc8xxx_probe(struct platform_device 
>> *pdev)
>>          * associated input enable must be set (GPIOxGPIE[IEn]=1) to 
>> propagate
>>          * the port value to the GPIO Data Register.
>>          */
>> -       if (of_device_is_compatible(np, "fsl,qoriq-gpio") ||
>> -           of_device_is_compatible(np, "fsl,ls1028a-gpio") ||
>> -           of_device_is_compatible(np, "fsl,ls1088a-gpio"))
>> -               gc->write_reg(mpc8xxx_gc->regs + GPIO_IBE, 
>> 0xffffffff);
>> +       if (pdev->dev.of_node) {
>> +               if (of_device_is_compatible(np, "fsl,qoriq-gpio"))
>> +                       gc->write_reg(mpc8xxx_gc->regs + GPIO_IBE, 
>> 0xffffffff);
>> +       } else {
>> +               if 
>> (acpi_match_device(pdev->dev.driver->acpi_match_table,
>> +                                       &pdev->dev))
>> +                       gc->write_reg(mpc8xxx_gc->regs + GPIO_IBE, 
>> 0xffffffff);
>> +       }
>> 
>>         ret = gpiochip_add_data(gc, mpc8xxx_gc);
>>         if (ret) {
>> @@ -381,12 +393,15 @@ static int mpc8xxx_probe(struct platform_device 
>> *pdev)
>>                 goto err;
>>         }
>> 
>> -       mpc8xxx_gc->irqn = irq_of_parse_and_map(np, 0);
>> +       mpc8xxx_gc->irqn = platform_get_irq(pdev, 0);
>>         if (!mpc8xxx_gc->irqn)
>>                 return 0;
>> 
>> -       mpc8xxx_gc->irq = irq_domain_add_linear(np, MPC8XXX_GPIO_PINS,
>> -                                       &mpc8xxx_gpio_irq_ops, 
>> mpc8xxx_gc);
>> +       mpc8xxx_gc->irq = 
>> irq_domain_create_linear(dev_fwnode(&pdev->dev),
>> +                                                  MPC8XXX_GPIO_PINS,
>> +                                                  
>> &mpc8xxx_gpio_irq_ops,
>> +                                                  mpc8xxx_gc);
>> +
>>         if (!mpc8xxx_gc->irq)
>>                 return 0;
>> 
>> @@ -425,12 +440,21 @@ static int mpc8xxx_remove(struct platform_device 
>> *pdev)
>>         return 0;
>>  }
>> 
>> +#ifdef CONFIG_ACPI
>> +static const struct acpi_device_id gpio_acpi_ids[] = {
>> +       {"NXP0031",},
>> +       { }
>> +};
>> +MODULE_DEVICE_TABLE(acpi, gpio_acpi_ids);
>> +#endif
>> +
>>  static struct platform_driver mpc8xxx_plat_driver = {
>>         .probe          = mpc8xxx_probe,
>>         .remove         = mpc8xxx_remove,
>>         .driver         = {
>>                 .name = "gpio-mpc8xxx",
>>                 .of_match_table = mpc8xxx_gpio_ids,
>> +               .acpi_match_table = ACPI_PTR(gpio_acpi_ids),
>>         },
>>  };
>> 
>> --
>> 2.25.1
>> 

-- 
-michael
