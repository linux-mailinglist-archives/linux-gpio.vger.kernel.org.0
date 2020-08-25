Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32A332515CD
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Aug 2020 11:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729534AbgHYJ5c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Aug 2020 05:57:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729529AbgHYJ5b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Aug 2020 05:57:31 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40CC3C061574;
        Tue, 25 Aug 2020 02:57:31 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id 145so3217014lfi.8;
        Tue, 25 Aug 2020 02:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wEKBw3M389lIxYOx03rfrhKFmPG9fhLZHWOc6+bvMWE=;
        b=CH9DqgWz6JIpRA+LVvmYQGUv4L0OM8jNzFLiF60A5MG/s026N+cxOtM3riTQchVoAv
         j5mkSJNyVqUtQlD4ePWX4OfUKEHq5ZTV2k3XgewI/dN7Y6OkLTMaPF5PoO7Qw1CHsWIR
         /jGXV7zPklnrXvKbtofYJh8H/bTZb+qSnRPKqhxqZaih/zsPXgOAfUQcZ8Sy5NfD073/
         2+kc0i28CTrWD9+5+6Kd3uDQdxYl0b9MSm1fEW/bxd876AkwDmDXlP1adEX1K59vp9Sr
         USugqEGf8HXUCwYSX5dj1i3v7443IaqxCvFJLPjfeJPGuYm8d1ci5NdJT5e33d0uSFJ4
         7mmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wEKBw3M389lIxYOx03rfrhKFmPG9fhLZHWOc6+bvMWE=;
        b=gIrFUw4o4eHxZW5WLbOlKats/EN1vqVyU3NSwj+YNoyNJLFS7G5TvmtL44p8b/p+Ja
         39GgmOXTwZHOg3CLuyJmj9EHAmps3DM/J8DcHO6yGUTlUs7x0GT5ObDiUvwVFxhR6UB1
         OoGzdEnTJ8lQfR9UjyqKYbPTJlvrhdUFX7qF4Ei3ytWl9hF4OZg0kwQAhtnUqEUVquan
         7afl+AqMKBCcsS8Sc9UbxNGwhMyQ4lfv3ftJrvo8LN++n8MPLEp4PVbl/Tld7S+U5yJA
         wbvjnziHbJxgTawclLMGdMt3BhsWmo9rpfUt+cLrv5dJUUf/T2ueXpb1E4MnPpmM0bBj
         T8DA==
X-Gm-Message-State: AOAM531W90S/TcHQmGpKButyaN3DCDZFCkuPk+A0PmYYiHaflrsp4Oxn
        qAtJ+RDetZdPyjLbHEYmqOf53QCPDqo=
X-Google-Smtp-Source: ABdhPJzbd+lIxQm9Nw2ZlRd+VhnHVPFZ3HHXOkmncxJnhKoFAzuCClvTtaWmxcbG/a62/g4odWKWuA==
X-Received: by 2002:a19:c80b:: with SMTP id y11mr4517248lff.23.1598349449598;
        Tue, 25 Aug 2020 02:57:29 -0700 (PDT)
Received: from mobilestation ([95.79.127.85])
        by smtp.gmail.com with ESMTPSA id o66sm1473024lff.76.2020.08.25.02.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 02:57:28 -0700 (PDT)
Date:   Tue, 25 Aug 2020 12:57:26 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Ding Tianhong <dingtianhong@huawei.com>
Cc:     hoan@os.amperecomputing.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel.openeuler@huawei.com
Subject: Re: [PATCH] gpio: dwapb: add support for new hisilicon ascend soc
Message-ID: <20200825095726.yvg34q74xy57qhrx@mobilestation>
References: <1598070473-46624-1-git-send-email-dingtianhong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1598070473-46624-1-git-send-email-dingtianhong@huawei.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Ding,
Thanks for the patch. My comments are below.

On Sat, Aug 22, 2020 at 12:27:53PM +0800, Ding Tianhong wrote:
> The hisilicon ascend soc's gpio is based on the synopsys DW gpio,
> and expand the register to support for INTCOMB_MASK, the new
> register is used to enable/disable the interrupt combine features.

I am wondering what does the "Interrupt Combine" feature do? Is it the same as
the GPIO_INTR_IO pre-synthesize parameter of the DW_apb_gpio IP-core? Is it
possible to tune the DW APB GPIO controller at runtime sending up to the IRQ
controller either combined or individual interrupts?

If the later is true, then probably having the "Interrupt Combine" feature
enabled must depend on whether an individual or combined interrupts are supplied
in dts, etc...

Could you explain the way the feature works and the corresponding layout
register in more details?

> 
> Both support for ACPI and Device Tree.
> 
> Signed-off-by: Ding Tianhong <dingtianhong@huawei.com>
> ---
>  drivers/gpio/gpio-dwapb.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 1d8d55b..923b381 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -49,6 +49,8 @@
>  #define GPIO_EXT_PORTC		0x58
>  #define GPIO_EXT_PORTD		0x5c

>  
> +#define GPIO_INTCOMB_MASK	0xffc

If the register is the HiSilicon Ascend SoC specific, then I'd suggest to add
the vendor-specific prefix like: GPIO_HS_INTCOMB_MASK.

Also pay attention to the register naming. Here you define it as "INTCOMB",
later as "INT_COMB". It's better to have the same references everywhere: either
with underscore or without it.

Also please move the new register definition to be after the corresponding
feature macro definition (see the next comment for detailts).

> +
>  #define DWAPB_DRIVER_NAME	"gpio-dwapb"
>  #define DWAPB_MAX_PORTS		4
>  
> @@ -58,6 +60,10 @@
>  
>  #define GPIO_REG_OFFSET_V2	1

>  
> +#define GPIO_REG_INT_COMB	2

Please move this macro to be define after the "GPIO_PORTA_EOI_V2" one, so to
make the blocked-like macro definitions order. Like this:
	#define GPIO_REG_OFFSET_V2	BIT(0)	// Reg V2 Feature macro

	#define GPIO_INTMASK_V2		0x44	// Reg V2-specific macro
	...
	#define GPIO_PORTA_EOI_V2	0x40	// Reg V2-specific macro

	+ #define GPIO_REG_HS_INTCOMB	BIT(1)	// HiSilicon Feature macro
	+ 
	+ #define GPIO_HS_INTCOMB_MASK	0xffc	// HiSilicon-specific macro
	+ 

I missed that in my series, but having the flags defined as decimals isn't good.
Could you convert GPIO_REG_HS_INTCOMB and GPIO_REG_OFFSET_V2 to be defined as BIT(x)?

The same comment about HS_-prefixing. Perhaps GPIO_REG_HS_INTCOMB?

> +#define ENABLE_INT_COMB		1
> +#define DISABLE_INT_COMB	0

I don't really see a point in having these two macros defined. They are basically
just the boolean flags. Please see my next comment.

> +
>  #define GPIO_INTMASK_V2		0x44
>  #define GPIO_INTTYPE_LEVEL_V2	0x34
>  #define GPIO_INT_POLARITY_V2	0x38
> @@ -354,6 +360,20 @@ static irqreturn_t dwapb_irq_handler_mfd(int irq, void *dev_id)
>  	return IRQ_RETVAL(dwapb_do_irq(dev_id));
>  }
>  

> +static void dwapb_enable_inq_combine(struct dwapb_gpio *gpio, unsigned int enable)

inq_combine or int_combine?

"enable" is used here as boolean, then it should be declared as one.

> +{
> +	u32 val;
> +
> +	if (gpio->flags & GPIO_REG_INT_COMB) {
> +		val = dwapb_read(gpio, GPIO_INTCOMB_MASK);
> +		if (enable)
> +			val |= BIT(0);
> +		else
> +			val &= BIT(0);
> +		dwapb_write(gpio, GPIO_INTCOMB_MASK, val);
> +	}
> +}
> +

Do you need to preserve the register content by using the read-modify-write procedure
here? If not, then inlining something like this should be fine:
	if (gpio->flags & GPIO_REG_HS_INTCOMB)
		dwapb_write(gpio, GPIO_HS_INTCOMB_MASK, 1);

>  static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
>  				 struct dwapb_gpio_port *port,
>  				 struct dwapb_port_property *pp)
> @@ -446,6 +466,8 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
>  		irq_create_mapping(gpio->domain, hwirq);
>  
>  	port->gc.to_irq = dwapb_gpio_to_irq;
> +
> +	dwapb_enable_inq_combine(gpio, ENABLE_INT_COMB);
>  }
>  
>  static void dwapb_irq_teardown(struct dwapb_gpio *gpio)
> @@ -618,6 +640,7 @@ static struct dwapb_platform_data *dwapb_gpio_get_pdata(struct device *dev)
>  static const struct of_device_id dwapb_of_match[] = {
>  	{ .compatible = "snps,dw-apb-gpio", .data = (void *)0},
>  	{ .compatible = "apm,xgene-gpio-v2", .data = (void *)GPIO_REG_OFFSET_V2},
> +	{ .compatible = "hisi,ascend-gpio", .data = (void *)GPIO_REG_INT_COMB},
>  	{ /* Sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, dwapb_of_match);
> @@ -626,6 +649,7 @@ static struct dwapb_platform_data *dwapb_gpio_get_pdata(struct device *dev)
>  	{"HISI0181", 0},
>  	{"APMC0D07", 0},
>  	{"APMC0D81", GPIO_REG_OFFSET_V2},
> +	{"HISI19XX", GPIO_REG_INT_COMB},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(acpi, dwapb_acpi_match);

> @@ -713,6 +737,8 @@ static int dwapb_gpio_remove(struct platform_device *pdev)
>  	reset_control_assert(gpio->rst);
>  	clk_bulk_disable_unprepare(DWAPB_NR_CLOCKS, gpio->clks);
>  
> +	dwapb_enable_inq_combine(gpio, DISABLE_INT_COMB);
> +
>  	return 0;
>  }

Note the dwapb_gpio_remove method will be discarded from the driver in the framework
of the next series: https://patchwork.ozlabs.org/project/linux-gpio/list/?series=193334

So if you really need to revert the GPIO_HS_INTCOMB_MASK flag setting, then
you'd need to create and register a dedicated devm-action (see 8 and 9 patch in
my series for example).

BTW Linus, could you take a look at my series? Andy and Rob have finished reviewing
it almost a month ago.

-Sergey

>  
> @@ -794,6 +820,8 @@ static int dwapb_gpio_resume(struct device *dev)
>  			dwapb_write(gpio, GPIO_INTEN, ctx->int_en);
>  			dwapb_write(gpio, GPIO_INTMASK, ctx->int_mask);
>  
> +			dwapb_enable_inq_combine(gpio, ENABLE_INT_COMB);
> +
>  			/* Clear out spurious interrupts */
>  			dwapb_write(gpio, GPIO_PORTA_EOI, 0xffffffff);
>  		}
> -- 
> 1.8.3.1
> 
