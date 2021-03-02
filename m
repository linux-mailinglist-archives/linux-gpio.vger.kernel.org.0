Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D05B32AD25
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:15:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381705AbhCBVZn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:25:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1579713AbhCBQ7r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 11:59:47 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0CA1C061223;
        Tue,  2 Mar 2021 08:59:05 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id a18so12427614wrc.13;
        Tue, 02 Mar 2021 08:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4Joww5io5viqVSd+UaO00H+TGmki8RVfz8V1MqY5mi0=;
        b=uHjpRKRatRGXDcfmWtRFHrTty6gZLOwbV05D5+PgwhxXieWmboEhWb9oCuo2mf8Cal
         chyejxSSlf/xnEBNHTXKi6Uu/VbDmGHhXc3epIErNbioCkJeiZgmpNZ/ud3BAtpX5zkB
         cpRvn+afCYEIVtx1NiWCsY9Zdah4XgY3iKYAh5PdVbbqgE+SvDx2EmDderC6pojqlgjd
         H06bRpdyCLbDsVmYy1el6oR8QRakJOJlCRpHBgYoA1iKO5OyoxQ2psRNPzrpiaAWOXjZ
         /U9lncSItvOExk7cXbhxNBMgnIiVeL8i9FNuNpr/9U7BhrtccJld7/87RN8ks5Ll/qKv
         4pkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4Joww5io5viqVSd+UaO00H+TGmki8RVfz8V1MqY5mi0=;
        b=kSzYAYka3DNFasECOve4UoXILQmq5WmsSUeweQAN36C/9R9Sfw7FaqN5MEyl2pvhD1
         nSnAAA3WQc53835j4HllyhIl1RWTily2vA+yAk1nohdOGX6mroZrJaa6iN/EudltjqzT
         ERoM4f+vxSSXoaZaOPfHL3VdwAFhe5U7pYSEnzMY7PGRJu3xZ4JMWZT0JPaGhRdprDr2
         m+n4lEmNDu/3x+Lv1I5rcNRuW9zPpYWtLTa1r4t4GBARX3dJFVK4gazj67RFbkIF4JnO
         +BS68Tw3CCcmQCCXA6gbTRnEV7FyG1s2x8rB+BbLAJaSgy6XGh6bD/uk5nY5TmaUeLGa
         QiUA==
X-Gm-Message-State: AOAM530beVzS5BcXDyV63XYrpFUB5uuaOm3PWxo+UB0lAjN3XjemmWuW
        ONz7oz98iYJz4HIuUGE79TbcFg1ZJZU55Q==
X-Google-Smtp-Source: ABdhPJxpIru1wVIoyQ17r07Hfbqpw4hvbjSdewNavsZrC1MH1cmBgWG6rFnA5vK1nzsIUmR6S8rD8A==
X-Received: by 2002:adf:b611:: with SMTP id f17mr22460111wre.8.1614704344489;
        Tue, 02 Mar 2021 08:59:04 -0800 (PST)
Received: from [192.168.1.10] (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id s84sm3220552wme.11.2021.03.02.08.59.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Mar 2021 08:59:04 -0800 (PST)
Subject: Re: [PATCH 02/12] pinctrl: add a pincontrol driver for BCM6328
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20210225164216.21124-1-noltari@gmail.com>
 <20210225164216.21124-3-noltari@gmail.com>
 <CACRpkdbxAQTft8dapGqBDxM8nbkPvK4i95ND0JBFb_riafZSSg@mail.gmail.com>
From:   =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>
Message-ID: <3959f3be-19bd-c9c4-36ee-e93959a7f8e1@gmail.com>
Date:   Tue, 2 Mar 2021 17:59:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdbxAQTft8dapGqBDxM8nbkPvK4i95ND0JBFb_riafZSSg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

El 02/03/2021 a las 16:20, Linus Walleij escribió:
> Hi Álvaro,
> 
> thanks for your patch!
> 
> On Thu, Feb 25, 2021 at 5:42 PM Álvaro Fernández Rojas
> <noltari@gmail.com> wrote:
> 
>> Add a pincontrol driver for BCM6328. BCM628 supports muxing 32 pins as
>> GPIOs, as LEDs for the integrated LED controller, or various other
>> functions. Its pincontrol mux registers also control other aspects, like
>> switching the second USB port between host and device mode.
>>
>> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
>> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> 
> Thanks for working on this. This SoC definitely need to come upstream.

I will try my best :).

> 
> I think this driver can be simplified a bit and reuse some core infrastructure
> to make it more maintainable. It might be a bit of challenge but definitely
> worth it!
> 
>> +config PINCTRL_BCM6328
>> +       bool "Broadcom BCM6328 GPIO driver"
>> +       depends on OF_GPIO && (BMIPS_GENERIC || COMPILE_TEST)
>> +       select PINMUX
>> +       select PINCONF
>> +       select GENERIC_PINCONF
>> +       select MFD_SYSCON
>> +       default BMIPS_GENERIC
>> +       help
>> +          Say Y here to enable the Broadcom BCM6328 GPIO driver.
> 
> I suggest
> 
> select GPIO_REGMAP
> select GPIOLIB_IRQCHIP
> select IRQ_DOMAIN_HIERARCHY
> 
> see below.
> 
> (...)
>> +#include <linux/bitops.h>
> 
> Just <linux/bits.h> maybe, if you only use BIT() and GENMASK().
> 
>> +#include <linux/gpio.h>
>> +#include <linux/of_gpio.h>
> 
> Do not include these, just:
> #include <linux/gpio/driver.h>
> 
>> +#define BCM6328_DIROUT_REG     0x04
>> +#define BCM6328_DATA_REG       0x0c
>> +#define BCM6328_MODE_REG       0x18
> 
> This looks very much like it could use GPIO_REGMAP.
> Can you look at:
> drivers/gpio/gpio-regmap.c
> drivers/gpio/gpio-sl28cpld.c
> 
> And see if you can do what that driver is doing and reuse
> this core infrastructure?

I've just checked drivers/gpio/gpio-regmap.c and it seems that "struct 
gpio_regmap" should be declared in include/linux/gpio/regmap.h.
Right now devm_gpio_regmap_register() is returning a pointer to a 
structure which none except gpio-regmap knows. Does that make any sense?
I need to access gpio_regmap->gpio_chip in order to gather 
gpio_chip.base and pass it to pinctrl_add_gpio_range().

> 
>> +static inline unsigned int bcm6328_bank_pin(unsigned int pin)
>> +{
>> +       return pin % PINS_PER_BANK;
>> +}
> 
> I am generally reluctant about registering several banks/instances
> of the GPIO if it is possible to just use more devices in the
> device tree, like one for each instance.
> 
>> +static inline unsigned int bcm6328_reg_off(unsigned int reg, unsigned int pin)
>> +{
>> +       return reg - (pin / PINS_PER_BANK) * BANK_SIZE;
>> +}
> 
> Because it leads to this kind of weirdness to split out the devices
> from the main device in practice.
> 
>> +static int bcm6328_gpio_direction_input(struct gpio_chip *chip,
>> +                                       unsigned int pin)
>> +{
> (...)
>> +       /*
>> +        * Check with the pinctrl driver whether this pin is usable as
>> +        * an input GPIO
>> +        */
>> +       ret = pinctrl_gpio_direction_input(chip->base + pin);
>> +       if (ret)
>> +               return ret;
> 
> This is very nice.
> 
>> +static int bcm6328_gpio_to_irq(struct gpio_chip *chip, unsigned gpio)
>> +{
>> +       char irq_name[7];
>> +
>> +       sprintf(irq_name, "gpio%d", gpio);
>> +
>> +       return of_irq_get_byname(chip->of_node, irq_name);
>> +}
> 
> This is a clear indication that we are dealing with a hierarchical irqchip.
> 
> My assumption is that you have one IRQ per GPIO line, so each
> GPIO has a dedicated IRQ on the interrupt controller. Correct?
> 
> This means:
> 
> - Do not add all the interrupts into the device tree by name.
> 
> - In Kconfig select GPIOLIB_IRQCHIP, select IRQ_DOMAIN_HIERARCHY
> 
> - Populate a simple struct gpio_irq_chip, if no local registers need
>    updating on interrupts, just pass interrupts through
>          .irq_mask       = irq_chip_mask_parent,
>          .irq_unmask     = irq_chip_unmask_parent,
>    etc.
> 
> - Implement bcm6328_gpio_child_to_parent_hwirq() for this chip
>    with hardcoded mappings between the hardware GPIO and interrupt
>    lines, using the parent interrupt controller hierarchically. This mapping
>    is determined from the compatible-string, and part of the property
>    of how the GPIO block is integrated with the SoC. If need be to
>    tell different chips apart, more precise compatible strings are needed.
> 
> - Examples:
>    drivers/gpio/gpio-ixp4xx.c
>    drivers/gpio/gpio-sifive.c
> 
> If you do this you will notice the core is more helpful to cut down on the
> code.
> 
> Yours,
> Linus Walleij
> 

Best regards,
Álvaro.
