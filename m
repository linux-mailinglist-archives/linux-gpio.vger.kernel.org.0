Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D8F84878CE
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jan 2022 15:20:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347662AbiAGOU0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jan 2022 09:20:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48066 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231689AbiAGOUZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jan 2022 09:20:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641565225;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YeeyvnFtskdzoeLs8GmtXZAhtTgMNaRwI/ssecxnbnc=;
        b=WJFjNTtAfGzHIM8xLMue8s1YU9Thu6pMj9hMqXcWIo97vg2oUHkr6uM0A2R3DZPWsZN8bF
        maCbDWM8vMpblnMhyOPLLN18QrRPluZ9Uby5DPH4DrQKJZB55Bc/6evBScpnjsG+K4wx6B
        J6T/8b+zbtUDJGQGhQa0R7ZrNSkMAho=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-bl_Q2R9fPFSo2jCvioB1ZQ-1; Fri, 07 Jan 2022 09:20:24 -0500
X-MC-Unique: bl_Q2R9fPFSo2jCvioB1ZQ-1
Received: by mail-ed1-f70.google.com with SMTP id z8-20020a056402274800b003f8580bfb99so4788935edd.11
        for <linux-gpio@vger.kernel.org>; Fri, 07 Jan 2022 06:20:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YeeyvnFtskdzoeLs8GmtXZAhtTgMNaRwI/ssecxnbnc=;
        b=io+v6BsN4TtMq5361XR3K7ulT5Lf/9eTi86z954ILHCq0jKQZ544BZG8j6pup5V9js
         GlDZm/RtVtLb+0upM3BXo7Gwtoaq+NOeHp8cdk2qaMaDX3LTFThVOCEhgA7NXj9TLH8z
         tvn9S3nHGc4BtKRRfGAQyE5N8OCmD7jOHAj7nKzvg3R+mWeSvzyFkATA4hUf6AEFJHkW
         7q1g2fKPikgjWgX/3sMjn0CHsJGFyZHeN8lQq/yIReoYtwyFaS9jAtGisxqA7KP24d64
         DAj2tlN/OpqftmNzN9BJTb4+TSSOO8CG2hUQ6Xs3NW09TN5pAg7ioqKHlQe+EE0WDLfs
         s45A==
X-Gm-Message-State: AOAM531wviZDv+2WwCQPGf+3WWr6v778Iboup4JLboo7ayRS+BsbxII9
        KXRLZjZrq7bUj0aZWjS0rmy7taBzscdb/Xp7T77Mwlc6i/XIA5Zl6BBgGRi2YK1qGcOEeuugMlX
        pIkFDmRWIKgCUfn5vUFDr6w==
X-Received: by 2002:a05:6402:2026:: with SMTP id ay6mr55514706edb.273.1641565222795;
        Fri, 07 Jan 2022 06:20:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx8HlB3HNppUg31auvn2XbLqHvUT2HiaLGJSUw7j1EkZkKV8etJ3YKOCO7Di3j7wCe/uV7YNw==
X-Received: by 2002:a05:6402:2026:: with SMTP id ay6mr55514689edb.273.1641565222572;
        Fri, 07 Jan 2022 06:20:22 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id lb10sm1462401ejc.148.2022.01.07.06.20.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jan 2022 06:20:22 -0800 (PST)
Message-ID: <eb96593c-d186-4e0e-dd81-9ebbcad21e0b@redhat.com>
Date:   Fri, 7 Jan 2022 15:20:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] pinctrl: baytrail: Clear direct_irq_en flag on broken
 configs
Content-Language: en-US
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
References: <20220107141802.32552-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220107141802.32552-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 1/7/22 15:18, Hans de Goede wrote:
> Some boards set the direct_irq_en flag in the conf0 register without
> setting any of the trigger bits. The direct_irq_en flag just means that
> the GPIO will send IRQs directly to the APIC instead of going through
> the shared interrupt for the GPIO controller, in order for the pin to
> be able to actually generate IRQs the trigger flags must still be set.
> 
> So having the direct_irq_en flag set without any trigger flags is
> non-sense, log a FW_BUG warning when encountering this and clear the flag
> so that a driver can actually use the pin as IRQ through gpiod_to_irq().
> 
> Specifically this allows the edt-ft5x06 touchscreen driver to use
> INT33FC:02 pin 3 as touchscreen IRQ on the Nextbook Ares 8 tablet,
> accompanied by the following new log message:
> 
> byt_gpio INT33FC:02: [Firmware Bug]: pin 3: direct_irq_en set without trigger, clearing
> 
> The new byt_direct_irq_sanity_check() function also checks that the
> pin is actually appointed to one of the 16 direct-IRQs which the
> GPIO controller support and on success prints debug msg like these:
> 
> byt_gpio INT33FC:02: Pin 0: uses direct IRQ 0 (APIC 67)
> byt_gpio INT33FC:02: Pin 15: uses direct IRQ 2 (APIC 69)
> 
> This is useful to figure out the GPIO pin belonging to ACPI
> resources like this one: "Interrupt () { 0x00000043 }" or
> the other way around.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/pinctrl/intel/pinctrl-baytrail.c | 36 ++++++++++++++++++++++--
>  1 file changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
> index 4c01333e1406..dfb54804e6e6 100644
> --- a/drivers/pinctrl/intel/pinctrl-baytrail.c
> +++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
> @@ -32,6 +32,7 @@
>  #define BYT_VAL_REG		0x008
>  #define BYT_DFT_REG		0x00c
>  #define BYT_INT_STAT_REG	0x800
> +#define BYT_DIRECT_IRQ_REG	0x980
>  #define BYT_DEBOUNCE_REG	0x9d0
>  
>  /* BYT_CONF0_REG register bits */
> @@ -1465,6 +1466,32 @@ static void byt_gpio_irq_handler(struct irq_desc *desc)
>  	chip->irq_eoi(data);
>  }
>  
> +static bool byt_direct_irq_sanity_check(struct intel_pinctrl *vg, int pin, u32 value)
> +{
> +	void __iomem *reg;
> +	int i, j;
> +
> +	if (!(value & (BYT_TRIG_POS | BYT_TRIG_NEG))) {
> +		dev_warn(vg->dev,
> +			 FW_BUG "pin %i: direct_irq_en set without trigger, clearing\n", pin);
> +		return false;
> +	}
> +
> +	reg = vg->communities->pad_regs + BYT_DIRECT_IRQ_REG;
> +	for (i = 0; i < 16; i += 4) {
> +		value = readl(reg + i);
> +		for (j = 0; j < 4; j++) {
> +			if (((value >> j * 8) & 0xff) == pin) {
> +				dev_dbg(vg->dev, "Pin %i: uses direct IRQ %d (APIC %d)\n",
> +					pin, i + j, 0x43 + i + j);
> +				return true;
> +			}
> +		}
> +	}
> +

Ugh, I just realized that this exit path also needs a dev_warn FW_BUG, I'll prep a v2.

Note I've never seen this path get hit, but still.

Regards,

Hans


> +	return false;
> +}
> +
>  static void byt_init_irq_valid_mask(struct gpio_chip *chip,
>  				    unsigned long *valid_mask,
>  				    unsigned int ngpios)
> @@ -1492,8 +1519,13 @@ static void byt_init_irq_valid_mask(struct gpio_chip *chip,
>  
>  		value = readl(reg);
>  		if (value & BYT_DIRECT_IRQ_EN) {
> -			clear_bit(i, valid_mask);
> -			dev_dbg(vg->dev, "excluding GPIO %d from IRQ domain\n", i);
> +			if (byt_direct_irq_sanity_check(vg, i, value)) {
> +				clear_bit(i, valid_mask);
> +			} else {
> +				value &= ~(BYT_DIRECT_IRQ_EN | BYT_TRIG_POS |
> +					   BYT_TRIG_NEG | BYT_TRIG_LVL);
> +				writel(value, reg);
> +			}
>  		} else if ((value & BYT_PIN_MUX) == byt_get_gpio_mux(vg, i)) {
>  			byt_gpio_clear_triggering(vg, i);
>  			dev_dbg(vg->dev, "disabling GPIO %d\n", i);
> 

