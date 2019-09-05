Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97774A9AB6
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2019 08:34:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731147AbfIEGeQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Sep 2019 02:34:16 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:56396 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725290AbfIEGeQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 5 Sep 2019 02:34:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=yWByamN8dUTbjA9RNtOkNSZ+0GTSwhLgNi2wQcbzaek=; b=6QPOQ4iqvPALDXmn7Rc424Ce8X
        nC+0+btlrBpXo6h5eUdR7DWOyvEgQmIFeTvr74WV9pOSg6HaJk5jF4n3X8iKY53jGe/d+k6fsLWsC
        OUZyKwOJLgGo8eQphFRMlewBsv5hZqNkCL58P8ED6Ws+x/u85onT5cv5EztWpj5Ic1AY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
        (envelope-from <andrew@lunn.ch>)
        id 1i5lLO-0000C9-95; Thu, 05 Sep 2019 08:34:10 +0200
Date:   Thu, 5 Sep 2019 08:34:10 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Patrice Chotard <patrice.chotard@st.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Joel Stanley <joel@jms.id.au>,
        Thierry Reding <treding@nvidia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] gpio: Initialize the irqchip valid_mask with a callback
Message-ID: <20190905063410.GA415@lunn.ch>
References: <20190904140104.32426-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190904140104.32426-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 04, 2019 at 04:01:04PM +0200, Linus Walleij wrote:
> diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
> index 07050cdbadb9..a3109bcaa0ac 100644
> --- a/drivers/gpio/gpio-tqmx86.c
> +++ b/drivers/gpio/gpio-tqmx86.c
> @@ -214,6 +214,17 @@ static const struct dev_pm_ops tqmx86_gpio_dev_pm_ops = {
>  			   tqmx86_gpio_runtime_resume, NULL)
>  };
>  
> +static void tqmx86_init_irq_valid_mask(struct gpio_chip *chip,
> +				       unsigned long *valid_mask,
> +				       unsigned int ngpios)
> +{
> +	/* Only GPIOs 4-7 are valid for interrupts. Clear the others */
> +	clear_bit(0, valid_mask);
> +	clear_bit(1, valid_mask);
> +	clear_bit(2, valid_mask);
> +	clear_bit(3, valid_mask);
> +}

Hi Linus

The change looks good. But a minor naming nit-pick. The code here
assumes valid_mask has already been initialised, all valid gpios have
had their bit set to 1 by the core. What we are actually doing here is
masking the mask to fit the hardware.

So maybe a better name would be tqmx86_mask_irq_valid_mask()?

For gpio-tqmx86.c
Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
