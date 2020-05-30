Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D20B71E93E9
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2020 23:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729098AbgE3VTi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 30 May 2020 17:19:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728741AbgE3VTh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 30 May 2020 17:19:37 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0A42C03E969;
        Sat, 30 May 2020 14:19:35 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id n5so7600530wmd.0;
        Sat, 30 May 2020 14:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JfB4DNuQ68MTs5G+tjYP/Y0o2T88viEDp4mQ3OPA+wY=;
        b=gMGCxdD4oSj6Oz9eVnkatd7Q6LBazLnoQKts4mJ5sj8JeyAC6AaVrZyKwrOjqoUe04
         OmEZEF96sfLTQFerQn1xretYuddFf/d2XnWsY3GTMJlMv0mc/k16vA2GS5fuW+aPqPYp
         OuPXhPHdGP/EdfMQ7R3NKUqhrdo9EJgB/5ziuqcHSMuGH6MGA3Ddw4OBVt1rbngIRQNm
         B4o1seK4RxQmwMek6OELdEigwgPmfJz+PpEL/24JOWDj4hrLAWZ2o9taQYyhSzsBuLOk
         PoVJbDvya8XW/pVUyKc7z1h65bS+vHLFMCMBirOwFQxng9Si2nJLtOQTzD8shgOaM6sH
         13Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JfB4DNuQ68MTs5G+tjYP/Y0o2T88viEDp4mQ3OPA+wY=;
        b=SvJqaT50IusNrG4nGm0T7GvkEsPR3zdUYrf2iCZQKtMVq10agGwqDTHyXzN9zIhnd3
         dYgPcta9U02bja+IrO6w+j0kirTGoKaK1mK2laBPTy6KmsEEbDRImJdGP5pIeI3DMh8X
         3lgQhd/+pboFkhOfJJHZYGxOFbKMb9N++bkMVgR/MOaPbRpbTTWwGKR2J7bldN6C2iY/
         A0KGZ8kU4kg5PeF++H2vQBrCEMGhzdYAOgQDH2ky/2tzAMjStmDoLcC+/JosK1lnzj3f
         qqcw4OpN8wg8PWPyvcT+LOYBVUPnEtnJGx5a1rdB4oBCRaG1i67vYjcYBNnMayJ6YqDz
         lXCg==
X-Gm-Message-State: AOAM530XIrflkMlowvwJzXNEpycIsktUd8Fpnz3+hivnwj6SDAB1cqvc
        LVS/9NTOpYoqffyLxaSPk2c=
X-Google-Smtp-Source: ABdhPJy/7BYPburHWA9H7Rtevxa9zyaM7kAm6LVNyLDZBYaUhLm5/f6bb35U1jtDnsKgAc9CyScbcg==
X-Received: by 2002:a1c:cc1a:: with SMTP id h26mr13942437wmb.127.1590873574438;
        Sat, 30 May 2020 14:19:34 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id e10sm14881159wrn.11.2020.05.30.14.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 May 2020 14:19:33 -0700 (PDT)
Subject: Re: [PATCH v2 4/4] pinctrl: bcm2835: Add support for wake-up
 interrupts
To:     Stefan Wahren <stefan.wahren@i2se.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Scott Branden <sbranden@broadcom.com>,
        Ray Jui <rjui@broadcom.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "maintainer:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." 
        <bcm-kernel-feedback-list@broadcom.com>,
        "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" 
        <linux-rpi-kernel@lists.infradead.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
References: <20200529191522.27938-1-f.fainelli@gmail.com>
 <20200529191522.27938-5-f.fainelli@gmail.com>
 <2677905e-a9ad-a44e-93bc-ad185aa269de@i2se.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <bf0ceef7-4015-69f1-336c-4d296f96adae@gmail.com>
Date:   Sat, 30 May 2020 14:19:28 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <2677905e-a9ad-a44e-93bc-ad185aa269de@i2se.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 5/30/2020 12:49 AM, Stefan Wahren wrote:
> Hi Florian,
> 
> Am 29.05.20 um 21:15 schrieb Florian Fainelli:
>> Leverage the IRQCHIP_MASK_ON_SUSPEND flag in order to avoid having to
>> specifically treat the GPIO interrupts during suspend and resume, and
>> simply implement an irq_set_wake() callback that is responsible for
>> enabling the parent wake-up interrupt as a wake-up interrupt.
>>
>> To avoid allocating unnecessary resources for other chips, the wake-up
>> interrupts are only initialized if we have a brcm,bcm7211-gpio
>> compatibility string.
>>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>> ---
>>  drivers/pinctrl/bcm/pinctrl-bcm2835.c | 76 ++++++++++++++++++++++++++-
>>  1 file changed, 75 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
>> index 1b00d93aa66e..1fbf067a3eed 100644
>> --- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
>> +++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
>> @@ -19,6 +19,7 @@
>>  #include <linux/irq.h>
>>  #include <linux/irqdesc.h>
>>  #include <linux/init.h>
>> +#include <linux/interrupt.h>
>>  #include <linux/of_address.h>
>>  #include <linux/of.h>
>>  #include <linux/of_irq.h>
>> @@ -76,6 +77,7 @@
>>  struct bcm2835_pinctrl {
>>  	struct device *dev;
>>  	void __iomem *base;
>> +	int *wake_irq;
>>  
>>  	/* note: locking assumes each bank will have its own unsigned long */
>>  	unsigned long enabled_irq_map[BCM2835_NUM_BANKS];
>> @@ -435,6 +437,11 @@ static void bcm2835_gpio_irq_handler(struct irq_desc *desc)
>>  	chained_irq_exit(host_chip, desc);
>>  }
>>  
>> +static irqreturn_t bcm2835_gpio_wake_irq_handler(int irq, void *dev_id)
>> +{
>> +	return IRQ_HANDLED;
>> +}
>> +
>>  static inline void __bcm2835_gpio_irq_config(struct bcm2835_pinctrl *pc,
>>  	unsigned reg, unsigned offset, bool enable)
>>  {
>> @@ -634,6 +641,34 @@ static void bcm2835_gpio_irq_ack(struct irq_data *data)
>>  	bcm2835_gpio_set_bit(pc, GPEDS0, gpio);
>>  }
>>  
>> +static int bcm2835_gpio_irq_set_wake(struct irq_data *data, unsigned int on)
>> +{
>> +	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
>> +	struct bcm2835_pinctrl *pc = gpiochip_get_data(chip);
>> +	unsigned gpio = irqd_to_hwirq(data);
>> +	unsigned int irqgroup;
>> +	int ret = -EINVAL;
>> +
>> +	if (!pc->wake_irq)
>> +		return ret;
>> +
>> +	if (gpio <= 27)
>> +		irqgroup = 0;
>> +	else if (gpio >= 28 && gpio <= 45)
>> +		irqgroup = 1;
>> +	else if (gpio >= 46 && gpio <= 53)
>> +		irqgroup = 2;
> in case the BCM7211 has 58 GPIOs, but the wake up interrupts are only
> available for the first 54 this should deserve a comment.

irqgroup 2 covers GPIOs 46 through 57, thanks for noticing. Do you have
more comments before I spin a v3? Thank you for reviewing.
-- 
Florian
