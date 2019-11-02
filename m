Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4DC7ECCED
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Nov 2019 03:55:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727272AbfKBCzO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Nov 2019 22:55:14 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:34801 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727067AbfKBCzO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Nov 2019 22:55:14 -0400
Received: by mail-pg1-f196.google.com with SMTP id e4so7608543pgs.1;
        Fri, 01 Nov 2019 19:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7ZNNTe5mkOuzZ1b3W8Xkq2eMV4qjyE7CsioiQ3occ8s=;
        b=JgBG/edDtW18OFtkSYrEnJo1YamRpxQlTLQnoYLDbIDMyNZv3mVxKQzwAEE3KI9Cz0
         iBJWao3C2C8VQJZrubB5eHV4+I4iKNohnhwjQJnnnjeVNOS1yRtI/7JuCO+vfwFDIzcw
         npNswin/PMLjK5R9h/kE9NHOP2G4O3PJqiJJ3R1yy5zPY7JAQYidXb4UtSGO5Hapv70t
         4aPLzEN9KCBVaK7EaUuWLb3SOKddLqc7A12/va8N2IoCRCShOy+M2MIq/H0v11X9TB/2
         5+UdFuAo4sAX3kn5gIFCdgGvUd5585gtZybpTc0wdozCAp0DqtWFVeC/fTjcvYbuvdZk
         RW0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7ZNNTe5mkOuzZ1b3W8Xkq2eMV4qjyE7CsioiQ3occ8s=;
        b=kltTa3xW/1BHZmpVhFCBtqjKtprBffxn6PG9Z6zan/qqTBbMrFxFUEaQ0uSTsdlVsd
         YkrdsTHwCGjkBkL7NUI0ImbVBP0oSYuC8Q0O1HZwBUKux1RT9ome5swOSlN/Zr/ui7n5
         omH2lKuzTGd6YExULRIKjj1LmtPmBDtGkGehWAJFLDugGydi1cEYZrTLXDFGz+LDsqwi
         2vpbNjmCovaqa+824WIrz9hNhSm+zWMGifGEu0kJ9LoDqseYQmoGFRtP26aWjTFYnR3J
         t9b3FaJlqE/QVFEIDbULuPLAWmg3n4qma4tKARBdRm8EYJAMfXFwf+eogOGSIDohalin
         g0Sg==
X-Gm-Message-State: APjAAAVWNUhZ865KwnefAzO8tZl0CLasX6UFngWZJoAqHB7xGWrk5swA
        xRyYP0CJK/tlr5QXUiXX2nk=
X-Google-Smtp-Source: APXvYqxg4OgJaYUyM3OKDwg+WHMVAXgkfTOYP2+s9ay3+BRTVdfbTd4PGssEzC8VuRD1mvWisVejHg==
X-Received: by 2002:aa7:9639:: with SMTP id r25mr17314826pfg.17.1572663313252;
        Fri, 01 Nov 2019 19:55:13 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
        by smtp.gmail.com with ESMTPSA id z14sm5449440pfq.66.2019.11.01.19.55.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2019 19:55:12 -0700 (PDT)
Subject: Re: [PATCH 1/2] pinctrl: bcm: nsp: use gpiolib infrastructure for
 interrupts
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linus.walleij@linaro.org, rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20191101015621.12451-1-chris.packham@alliedtelesis.co.nz>
 <20191101015621.12451-2-chris.packham@alliedtelesis.co.nz>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <b681ed9d-a31a-e5cc-04ba-6f38a5cc745b@gmail.com>
Date:   Fri, 1 Nov 2019 19:55:11 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191101015621.12451-2-chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 10/31/2019 6:56 PM, Chris Packham wrote:
> Use more of the gpiolib infrastructure for handling interrupts. The
> root interrupt still needs to be handled manually as it is shared with
> other peripherals on the SoC.
> 
> This will allow multiple instances of this driver to be supported and
> will clean up gracefully on failure thanks to the device managed APIs.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---

Just a couple of comments below:

[snip]

> +		irqc->name = dev_name(dev);

The irq_chip used to be named "gpio-a" now it most likely will contain
the address.unit-name notation from Device Tree, since this is visible
in /proc/interrupts one might consider this to be an ABI breakage.

> +		irqc->irq_ack = nsp_gpio_irq_ack;
> +		irqc->irq_mask = nsp_gpio_irq_mask;
> +		irqc->irq_unmask = nsp_gpio_irq_unmask;
> +		irqc->irq_set_type = nsp_gpio_irq_set_type;
>  
> -			irq_set_chip_and_handler(irq, &nsp_gpio_irq_chip,
> -						 handle_simple_irq);
> -			irq_set_chip_data(irq, chip);
> -		}
> +		val = readl(chip->base + NSP_CHIP_A_INT_MASK);
> +		val = val | NSP_CHIP_A_GPIO_INT_BIT;
> +		writel(val, (chip->base + NSP_CHIP_A_INT_MASK));
>  
>  		/* Install ISR for this GPIO controller. */
> -		ret = devm_request_irq(&pdev->dev, irq, nsp_gpio_irq_handler,
> -				       IRQF_SHARED, "gpio-a", chip);
> +		ret = devm_request_irq(dev, irq, nsp_gpio_irq_handler,
> +				       IRQF_SHARED, "gpio-a", &chip->gc);
>  		if (ret) {
>  			dev_err(&pdev->dev, "Unable to request IRQ%d: %d\n",
>  				irq, ret);
> -			goto err_rm_gpiochip;
> +			return ret;
>  		}
>  
> -		val = readl(chip->base + NSP_CHIP_A_INT_MASK);
> -		val = val | NSP_CHIP_A_GPIO_INT_BIT;
> -		writel(val, (chip->base + NSP_CHIP_A_INT_MASK));
> +		girq = &chip->gc.irq;
> +		girq->chip = irqc;
> +		/* This will let us handle the parent IRQ in the driver */
> +		girq->parent_handler = NULL;
> +		girq->num_parents = 0;
> +		girq->parents = NULL;
> +		girq->default_type = IRQ_TYPE_NONE;
> +		girq->handler = handle_simple_irq;

It might be worth creating a helper that can be called to initialize all
relevant members to the values that indicate: let me manage the
interrupt. This would make us more future proof with respect to
assumptions being made in gpiolib as well as if new fields are added in
the future. This would be a separate patch obviously.

Other than that:

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
