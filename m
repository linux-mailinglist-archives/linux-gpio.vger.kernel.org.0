Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F58DA9820
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2019 03:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730651AbfIEBrs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Sep 2019 21:47:48 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:52383 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727156AbfIEBrs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Sep 2019 21:47:48 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id A511922254;
        Wed,  4 Sep 2019 21:47:46 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Wed, 04 Sep 2019 21:47:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=TxCpelb2dlkqpemAFLly7jkcdpaH6YJ
        ukF29OnIns9o=; b=bRcWOTOHlOkEpOvmm0bOyV1/RFiNn0YwiHOo8lqvyd4aGjM
        ID2zn9qXmRgqNLWrv5yF5dboiTn3J7mCu390IxHr0FsVBSDfV5vHRzWLYEqP3DAx
        5E+rMv40S0dT2FTMpdH2QcEBCNsHRYpTE/i9B7WMva7iJSGV3Qa5YBTM9I/5x3aq
        6XniFAcTxdY7ZqV3PCPwyNogGPLv86RvMBfd2fl/8rf9XM4JdLuY/mcHxYqA1Hx8
        Ph4E8Qv/mqHjbhHVS9PON9qIF1p5Z69Cc9L7JgBHUpqzYBwsTToBDETMFc/eU6YM
        fLa7zr1V8/8zDC6MJ2iOkirdEm3SZevbbUerDLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=TxCpel
        b2dlkqpemAFLly7jkcdpaH6YJukF29OnIns9o=; b=BASVlN4QhfTtYxmmT06cXq
        yVQ1fOvo9FGW9Y9KuRbzaVXygqJKhb9i5fizdCqIHLki2t6QzyiLzn2XbuwLy3AZ
        8Z9YNei+MtcghAA49GLwRX4NvczLgwfiD3uGwfuTeJop5tSZ/BJ8nx8bcOqlm80w
        tVbZ/NChs9/FVQ0WnhyLt8+vfP+9CxZSsj4NiPHhy77TTHsag9tbttSEfyPQ7MrO
        7AKUo7ch4BefvVWsh8EvfaNeAe+OtOKFzAhGgPfGZrpkQ5MZ3Ge6ZfWMozlMyE76
        PE2CcRcYUIfIsNiM6Qstq9eQEgtzwAnSaS+6Oe1fZzYRWVvnDHW+oJNk9rg75mWw
        ==
X-ME-Sender: <xms:PWlwXWEO955NlOFhMDWeOnxe6bhmkhrqy5YM6Kyop4ebT1WtWmNumA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudejiedggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
    rhfuihiivgeptd
X-ME-Proxy: <xmx:PWlwXRVjcXqbNkMBAxV0uaNnkWEhRPzT1MwgtcbVFdHS8mtcRfYzlA>
    <xmx:PWlwXWyc5rY0KSB93Dg-q7sZckXNCN40d2mkS-BTEaU75PttSR-oxw>
    <xmx:PWlwXeSfAc2yRZrJKEZqk24bWsytr_jpks1IyvuLm6U1ZpkDcZ62Rw>
    <xmx:QmlwXXVjhxexS_6OOcSVGg3xhifr-eeBYJJP87N-lrenIw7LJT5NfA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id EBFF3E00B1; Wed,  4 Sep 2019 21:47:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-186-gf4cb3c3-fmstable-20190904v1
Mime-Version: 1.0
Message-Id: <17e6638e-f140-4144-bea5-f7bf0039ead5@www.fastmail.com>
In-Reply-To: <20190904140104.32426-1-linus.walleij@linaro.org>
References: <20190904140104.32426-1-linus.walleij@linaro.org>
Date:   Thu, 05 Sep 2019 11:18:06 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Linus Walleij" <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
        "Patrice Chotard" <patrice.chotard@st.com>,
        "Andrew Lunn" <andrew@lunn.ch>, "Joel Stanley" <joel@jms.id.au>,
        "Thierry Reding" <treding@nvidia.com>,
        "Hans de Goede" <hdegoede@redhat.com>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        "Mika Westerberg" <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] gpio: Initialize the irqchip valid_mask with a callback
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Wed, 4 Sep 2019, at 23:31, Linus Walleij wrote:
> After changing the valid_mask for the struct gpio_chip
> to detect the need and presence of a valid mask with the
> presence of a .init_valid_mask() callback to fill it in,
> we augment the gpio_irq_chip to use the same logic.
> 
> Switch all driver using the gpio_irq_chio valid_mask
> over to this new method.
> 
> This makes sure the valid_mask for the gpio_irq_chip gets
> filled in when we add the gpio_chip, which makes it a
> little easier to switch over drivers using the old
> way of setting up gpio_irq_chip over to the new method
> of passing the gpio_irq_chip along with the gpio_chip.
> (See drivers/gpio/TODO for details.)
> 
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Thierry Reding <treding@nvidia.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> All is compile tested on top of the gpio "devel" branch.
> 
> Andy: I guess this would collide with my attempted
> rewrites of some Intel-related drivers, we can either
> merge this first and I will rebase and resend the
> other changes, or you can send me a pull request
> if you think some of my changes are working and I
> will instead rebase this on top of that, thanks.
> 
> Hans de Goede: I actually think that patch
> 48057ed1840fde9239b1e000bea1a0a1f07c5e99
> "gpio: Fix irqchip initialization order" fixes the
> issues you saw with the rewrite of int0002 earlier,
> and we suggested setting up the mask as part of the
> chip addition then, but this change is nice to have
> anyways.
> ---
>  drivers/gpio/gpio-aspeed.c                 | 13 ++++---
>  drivers/gpio/gpio-stmpe.c                  | 36 +++++++++++++------
>  drivers/gpio/gpio-tqmx86.c                 | 21 ++++++-----
>  drivers/gpio/gpiolib.c                     | 12 ++++---
>  drivers/pinctrl/intel/pinctrl-baytrail.c   | 16 ++++++++-
>  drivers/pinctrl/intel/pinctrl-cherryview.c | 42 +++++++++++++---------
>  drivers/platform/x86/intel_int0002_vgpio.c | 11 ++++--
>  include/linux/gpio/driver.h                | 16 ++++++---
>  8 files changed, 112 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index 9defe25d4721..7bcd83dbc3e3 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -689,8 +689,11 @@ static struct irq_chip aspeed_gpio_irqchip = {
>  	.irq_set_type	= aspeed_gpio_set_type,
>  };
>  
> -static void set_irq_valid_mask(struct aspeed_gpio *gpio)
> +static void aspeed_init_irq_valid_mask(struct gpio_chip *gc,
> +				       unsigned long *valid_mask,
> +				       unsigned int ngpios)
>  {
> +	struct aspeed_gpio *gpio = gpiochip_get_data(gc);
>  	const struct aspeed_bank_props *props = gpio->config->props;
>  
>  	while (!is_bank_props_sentinel(props)) {
> @@ -704,7 +707,7 @@ static void set_irq_valid_mask(struct aspeed_gpio *gpio)
>  			if (i >= gpio->config->nr_gpios)
>  				break;
>  
> -			clear_bit(i, gpio->chip.irq.valid_mask);
> +			clear_bit(i, valid_mask);
>  		}
>  
>  		props++;
> @@ -1203,7 +1206,7 @@ static int __init aspeed_gpio_probe(struct 
> platform_device *pdev)
>  		girq->parents[0] = gpio->irq;
>  		girq->default_type = IRQ_TYPE_NONE;
>  		girq->handler = handle_bad_irq;
> -		girq->need_valid_mask = true;
> +		girq->init_valid_mask = aspeed_init_irq_valid_mask;
>  	}
>  
>  	gpio->offset_timer =
> @@ -1215,10 +1218,6 @@ static int __init aspeed_gpio_probe(struct 
> platform_device *pdev)
>  	if (rc < 0)
>  		return rc;
>  
> -	/* Now the valid mask is allocated */
> -	if (gpio->irq)
> -		set_irq_valid_mask(gpio);
> -
>  	return 0;
>  }

For the Aspeed changes:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
