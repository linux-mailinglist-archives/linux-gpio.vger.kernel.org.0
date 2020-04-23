Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6A311B5C3D
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2020 15:17:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbgDWNQ7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Apr 2020 09:16:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726429AbgDWNQ7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 23 Apr 2020 09:16:59 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC4C1C08E934;
        Thu, 23 Apr 2020 06:16:58 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id g13so6795034wrb.8;
        Thu, 23 Apr 2020 06:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XpdNKfJoHYgU72M4JXWT2tifVV3ixcA1zo52dixVMjA=;
        b=bUt4lvr+hwAUNw0QFxf6mmZLWBQAFA31IBQRDMO+DG7r/dUrF0eUsZ+fqXWRkYMkic
         AJOyW906egGOf3v8AV4xDSy79iHXKWkxzeAS+PZ7tWexTQ5UFTgkO4b7bQazgbG1mTyp
         F9yTAqElhffW/OPJSocDQvpu0CblzYvW0NNwEVb7QdX742Dn8RTFFK3JO+YWUMkxShNO
         mlorzUuSgflJH8kw3IkL8AcI6WDleLKoXYwbqCE+An6h5tA4vLcLGa9aEMrTrXq6cVJm
         Nne/YVeH4QkHNETFoshjs6Zadbd3NVd5Sn7L5uFYNld4bEhQbvtGn455sI+3PK6+e0hL
         9+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=XpdNKfJoHYgU72M4JXWT2tifVV3ixcA1zo52dixVMjA=;
        b=X92SqaIigbuN5JrS7BNlRpTf801+GFK/sJPXnYPBeaFEWIHCGlRywt+hOp87khWEcS
         RhiES91zsxSk09p7srJLRM3wSXxPjGEGtmxIuw2eXtRefLuZQqlZlETTd19qYjlbYvLH
         7DDZk/6x23YrlD7d6IrquvGuwFFKUUJGuj/bMEGRRBxcO+g0kBgY1N7Z0Dfk6mNbBjHc
         eqJpZLeYO9oI6ctoH92NM7eheorOqT4ASVGIS8tSHBIZhKd4Qa6WW5gJKanSCpg47f/S
         n2XTtOH2rlLoFo1EuVvPiojrUKzhcNu/jbpi8FbYuL+Pxe0gXcjTVAZ0Gt6xz8aJNNa9
         rsKw==
X-Gm-Message-State: AGi0PubtH/6ry03+Qr3ITwG+8j4TzJSOorAFCZ9yt27Qi4N8tuo23HLo
        QsTQEYvkXwOBpNW943jVIpU=
X-Google-Smtp-Source: APiQypIJM+T2B/a+R+KzzjxZIuBrkfj75YkUcJWrzLSJZdNz9OtpX3vVivwEbipMXmV71LD2+yftag==
X-Received: by 2002:a5d:4ac9:: with SMTP id y9mr5200334wrs.182.1587647817328;
        Thu, 23 Apr 2020 06:16:57 -0700 (PDT)
Received: from x1 (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id r20sm3459821wmh.26.2020.04.23.06.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 06:16:56 -0700 (PDT)
Date:   Thu, 23 Apr 2020 15:17:38 +0200
From:   Drew Fustini <drew@pdp7.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Robert Nelson <robertcnelson@gmail.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: gpio-omap: add support gpiolib bias (pull-up/down) flags?
Message-ID: <20200423131738.GA16584@x1>
References: <CACRpkdaPoMGZ7jGh6j4dYexx+qCcoMQ37vS7kbpf=3TtcA9zQQ@mail.gmail.com>
 <CAEf4M_B_sxOiKFnEVUrx00RE2MaMA98LpijNhp0EVY11eRAXHg@mail.gmail.com>
 <CAD6h2NT840zMfwaJatfKzai8QjZEQmF5v0xgE+9ngSJJ+Qy+6g@mail.gmail.com>
 <20200413123921.GA32586@x1>
 <578a51c3-9cb4-91f9-4735-c512bf75553c@ti.com>
 <CAOCHtYg=rM_zP6Wr3bWKfvGpeK7sXLj6GLN3DXSh8JgfqDTcCA@mail.gmail.com>
 <db5e49dc-41b4-2ba5-87b3-f345749d7984@ti.com>
 <CAOCHtYgNH-OUWdKgKLr7U8Zy2OZb=P9Rpsv4mFii+VwU7h-vGA@mail.gmail.com>
 <20200415233712.GA16167@x1>
 <20200416163215.GH37466@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200416163215.GH37466@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 16, 2020 at 09:32:15AM -0700, Tony Lindgren wrote:
> Hi,
> 
> * Drew Fustini <drew@pdp7.com> [200415 23:37]:
> > As Robert described, I wanted to make us of the new support for bias
> > flags in the gpiolib uapi which allows userspace libraries like libgpiod
> > set pull-up or pull-down on lines [0].
> > 
> > Is there no way for gpio-omap to call into the pinctrl-single backend to
> > set the bias bits (PULLUDEN and PULLTYPESEL) in pad control registers?
> 
> It sure would be nice to improve some of this :) You should be able to
> do this using the gpio-ranges binding with the following steps:
> 
> 1. Add gpio-ranges to dts files
> 
> This should be done for all the pins that need handling, here's
> just one line version:
> 
> gpio-ranges = <&pmx_core 0 15 1>;
>                          |  | |
> 			 |  | +-- number of pins
> 			 |  +---- pin start
> 			 +------- gpio start
> 
> Some mappings can use larger ranges, while some pins just need
> to be added separately.
> 
> 2. Implement parsing of gpio-ranges to pinctrl-single.c
> 
> The following test patch I did a while back should get you started.
> 
> From what I recall, the issue here the addressing. The addressing
> ends up using an artiticial index of pin entries in the dts, while
> it should use the read pinctrl device padconf offset.

Thanks, Tony.  I was able to apply your patch cleanly to 5.5.9 kernel
and boot it ok on the PocketBeagle (AM3358) which is what I'm currently
testing with.  I can switch to 5.7.x but I just happened to be on 5.5.x
because that is when bias flags were added to gpiolib uapi.

I'm a somewhat confused about the difference between the "gpio-ranges"
property for the gpio[0-3] nodes and the "pinctrl-single,gpio-range"
property for the am33xx_pinmux node.

For a test, I tried adding "gpio-ranges" to arch/arm/boot/dts/am33xx-l4.dtsi:

                        gpio0: gpio@0 {
                                compatible = "ti,omap4-gpio";
                                gpio-controller;
                                #gpio-cells = <2>;
                                interrupt-controller;
                                #interrupt-cells = <2>;
                                reg = <0x0 0x1000>;
                                interrupts = <96>;
                                gpio-ranges = <&am33xx_pinmux 0 0 1>;
			}

and "pinctrl-single,gpio-range" like this:

                                am33xx_pinmux: pinmux@800 {
                                        compatible = "pinctrl-single";
                                        reg = <0x800 0x238>;
                                        #pinctrl-cells = <1>;
                                        pinctrl-single,register-width = <32>;
                                        pinctrl-single,function-mask = <0x7f>;

                                        pinctrl-single,gpio-range = <&range 0 1 0>;

                                        range: gpio-range {
                                                #pinctrl-single,gpio-range-cells = <3>;
                                        };
                                };

Do you think both of those properties would be needed?

> 
> Maybe Linus has some suggestion on how to deal with that?
> 
> 3. Have gpio-omap.c call gpiod_direction_input(desc) and
>    gpiod_to_irq(desc) for example for gpio interrupt pins
> 
> To do that, you need something like this in gpio-omap.c:
> 
> if (of_property_read_bool(dev->of_node, "gpio-ranges")) {
> 	chips->chip.request = gpiochip_generic_request;
> 	chips->chip.free = gpiochip_generic_free;
> }
> 
> Regards,
> 
> Tony
> 
> 8< -------------------
> diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
> --- a/drivers/pinctrl/pinctrl-single.c
> +++ b/drivers/pinctrl/pinctrl-single.c
> @@ -10,6 +10,7 @@
>   */
>  
>  #include <linux/init.h>
> +#include <linux/gpio.h>
>  #include <linux/module.h>
>  #include <linux/io.h>
>  #include <linux/slab.h>
> @@ -149,6 +150,8 @@ struct pcs_soc_data {
>   * @dev:	device entry
>   * @np:		device tree node
>   * @pctl:	pin controller device
> + * @gc:		optional gpio chip
> + * @nr_gpio:	optional number of gpio pins
>   * @flags:	mask of PCS_FEAT_xxx values
>   * @missing_nr_pinctrl_cells: for legacy binding, may go away
>   * @socdata:	soc specific data
> @@ -178,6 +181,8 @@ struct pcs_device {
>  	struct device *dev;
>  	struct device_node *np;
>  	struct pinctrl_dev *pctl;
> +	struct gpio_chip *gc;
> +	int nr_gpio;
>  	unsigned flags;
>  #define PCS_CONTEXT_LOSS_OFF	(1 << 3)
>  #define PCS_QUIRK_SHARED_IRQ	(1 << 2)
> @@ -1340,6 +1345,8 @@ static int pcs_add_gpio_func(struct device_node *node, struct pcs_device *pcs)
>  		mutex_lock(&pcs->mutex);
>  		list_add_tail(&range->node, &pcs->gpiofuncs);
>  		mutex_unlock(&pcs->mutex);
> +
> +		pcs->nr_gpio += range->npins;
>  	}
>  	return ret;
>  }
> @@ -1599,6 +1606,93 @@ static int pcs_irq_init_chained_handler(struct pcs_device *pcs,
>  	return 0;
>  }
>  
> +static int pcs_gpio_find_by_offset(struct pcs_device *pcs, int offset)
> +{
> +
> +}
> +
> +static int pcs_gpio_request(struct gpio_chip *gc, unsigned offset)
> +{
> +	struct pcs_device *pcs = gpiochip_get_data(gc);
> +
> +	dev_info(pcs->dev, "XXX %s offset: %u\n", __func__, offset);
> +
> +	return 0;
> +}
> +
> +static void pcs_gpio_free(struct gpio_chip *gc, unsigned offset)
> +{
> +	struct pcs_device *pcs = gpiochip_get_data(gc);
> +
> +	dev_info(pcs->dev, "XXX %s offset: %u\n", __func__, offset);
> +}
> +
> +static int pcs_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
> +{
> +	struct pcs_device *pcs = gpiochip_get_data(gc);
> +
> +	dev_info(pcs->dev, "XXX %s offset: %u\n", __func__, offset);
> +
> +	return 0;
> +}
> +
> +static int pcs_gpio_get(struct gpio_chip *gc, unsigned offset)
> +{
> +	struct pcs_device *pcs = gpiochip_get_data(gc);
> +
> +	dev_info(pcs->dev, "XXX %s offset: %u\n", __func__, offset);
> +
> +	return -EINVAL;
> +}
> +
> +static void pcs_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
> +{
> +	struct pcs_device *pcs = gpiochip_get_data(gc);
> +
> +	dev_info(pcs->dev, "XXX %s offset: %u value: %i\n",
> +		 __func__, offset, value);
> +}
> +
> +static int pcs_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
> +{
> +	struct pcs_device *pcs = gpiochip_get_data(gc);
> +
> +	dev_info(pcs->dev, "XXX %s offset: %u\n", __func__, offset);
> +
> +	return 0;
> +}
> +
> +static int pcs_init_gpiochip(struct device_node *np, struct pcs_device *pcs)
> +{
> +	int error;
> +
> +	if (!pcs->nr_gpio || !of_property_read_bool(np, "gpio-controller"))
> +		return 0;
> +
> +	pcs->gc = devm_kzalloc(pcs->dev, sizeof(*pcs->gc), GFP_KERNEL);
> +	if (!pcs->gc)
> +		return -ENOMEM;
> +
> +	pcs->gc->request = pcs_gpio_request;
> +	pcs->gc->free = pcs_gpio_free;
> +	pcs->gc->direction_input = pcs_gpio_direction_input;
> +	pcs->gc->get = pcs_gpio_get;
> +	pcs->gc->set = pcs_gpio_set;
> +	pcs->gc->to_irq = pcs_gpio_to_irq;
> +
> +	pcs->gc->label = pcs->desc.name;
> +	pcs->gc->parent = pcs->dev;
> +	pcs->gc->owner = THIS_MODULE;
> +	pcs->gc->base = -1;
> +	pcs->gc->ngpio = pcs->nr_gpio;
> +
> +	error = devm_gpiochip_add_data(pcs->dev, pcs->gc, pcs);
> +	if (error)
> +		return error;
> +
> +	return 0;
> +}
> +
>  #ifdef CONFIG_PM
>  static int pcs_save_context(struct pcs_device *pcs)
>  {
> @@ -1868,6 +1962,10 @@ static int pcs_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		goto free;
>  
> +	ret = pcs_init_gpiochip(np, pcs);
> +	if (ret < 0)
> +		goto free;
> +
>  	pcs->socdata.irq = irq_of_parse_and_map(np, 0);
>  	if (pcs->socdata.irq)
>  		pcs->flags |= PCS_FEAT_IRQ;
> -- 
> 2.26.1
