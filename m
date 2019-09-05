Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF4BCA9B37
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2019 09:08:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730937AbfIEHIc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Sep 2019 03:08:32 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:37742 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730767AbfIEHIb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Sep 2019 03:08:31 -0400
Received: by mail-pl1-f196.google.com with SMTP id b10so844295plr.4;
        Thu, 05 Sep 2019 00:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=PwzRRjHAyauE5ygGFHxAxEXfzZozrZL9TYYXfKwo6ww=;
        b=PDkAL9nH5jqUhNHP6Y7eT8x0B7kuGD5XK0dTinVzbocINTNmJMN2J6IBLGHuOIap0/
         q+7HYZo1xoxoRvz5ZYQADiURHIXbhYgOybtLWyLD8MKkfUPItM6LDnQEiWuUccGmZzAa
         OrWPTgVkNPaIAo4WLjXJ7ZLgnpJva7V13i6FFyeSMy+DaK8uQsk5RwpchEAIUOQtE/Yy
         /feaBcwjeYWYNyru3hGPghhZ4fdFqfI3RHW458Xw1fswaousMGKu2NaKPZa+LIxsqatz
         rvYH2AtizjnJqd1HIWf1DyocVmkKfKcklO9EbvAm+zLKEoJ/9gfRn1bmZBaqfGASaGZk
         bgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=PwzRRjHAyauE5ygGFHxAxEXfzZozrZL9TYYXfKwo6ww=;
        b=KKtkRxRJTh6lIDqphmraqOD/oJHByrXfNLcus5PJCI+T3DwFx1yhd8OfggApoZYYKu
         CuqfhhDt5UbPxzZivxc6/sGhVX5EPHI2v87FmI6nP8QJTDBTwub6/uEM8twKL+xqKH2j
         qC5RYyJZbrVnzL4u1iTotw/fUMke483m78sEa5Xd/Krx+8dRG4DavfimObPKerj10djK
         fjQL8JJ7Tlb0K2JF+hN9Ao9R/qw6CuPnQTNPZ2GBvJnHS2UKW6+nStgHy5oerXlUG40j
         s+LN1hmbFEmGaPcjbG6z4yAq21NVN8nm0nbXqvrZSyKwXKKeCDjoGnJyzP6DXhuXk7Oy
         yFQA==
X-Gm-Message-State: APjAAAVOYxlqPVPny5Mn3w+WGSV+d+7Ahj8L8FNQM+FIqSh+bCUiIAHG
        K0bIGrOkh98hHnznOk3KQXsgXHPvE2Y=
X-Google-Smtp-Source: APXvYqxDU4O5RR5ccOAyRtGejxYvGW4X25EjIdd2LIc3b+4GZaBaRTzhGiT16qy7APgYJPZZniNa1g==
X-Received: by 2002:a17:902:f301:: with SMTP id gb1mr1755357plb.249.1567667310708;
        Thu, 05 Sep 2019 00:08:30 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
        by smtp.googlemail.com with ESMTPSA id v27sm2714757pgn.76.2019.09.05.00.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2019 00:08:30 -0700 (PDT)
Message-ID: <aa7bf455b3ef834fb4e965a6cfc594dc1f7ddb1c.camel@gmail.com>
Subject: Re: [PATCH v2 3/4] gpio: Add in ast2600 details to Aspeed driver
From:   Rashmica Gupta <rashmica.g@gmail.com>
To:     Andrew Jeffery <andrew@aj.id.au>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Joel Stanley <joel@jms.id.au>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date:   Thu, 05 Sep 2019 17:08:24 +1000
In-Reply-To: <40601711-5fcf-40a0-bfc2-ae5043948a41@www.fastmail.com>
References: <20190905011732.16059-1-rashmica.g@gmail.com>
         <40601711-5fcf-40a0-bfc2-ae5043948a41@www.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 2019-09-05 at 13:27 +0930, Andrew Jeffery wrote:
> 
> On Thu, 5 Sep 2019, at 10:47, Rashmica Gupta wrote:
> > The ast2600 is a new generation of SoC from ASPEED. Similarly to
> > the
> > ast2400 and ast2500, it has a GPIO controller for it's 3.6V GPIO
> > pins.
> > Additionally, it has a GPIO controller for 36 1.8V GPIO pins. These
> > voltages are fixed and cannot be configured via pinconf, so we need
> > two
> > separate drivers for them.
> 
> Working backwards, we don't really have multiple drivers, just
> different
> configurations for the same driver. So I think this should be
> reworded.
> 
> Also it's not really the voltage differences that are driving the
> different
> configurations but rather that there are two separate sets of
> registers
> in the 2600 with overlapping bank names (they happen to be split into
> 3.3V and 1.8V groups). The key point being that there aren't just
> more
> GPIO registers tacked on the end of the original 3.3V group.
> 

Good point! I'll reword this. Also they are 3.3V, I'm not sure why I
wrote 3.6V in my patches.

> > Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
> > ---
> >  drivers/gpio/gpio-aspeed.c | 30 ++++++++++++++++++++++++++++--
> >  1 file changed, 28 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-
> > aspeed.c
> > index 16c6eaf70857..4723b8780a8c 100644
> > --- a/drivers/gpio/gpio-aspeed.c
> > +++ b/drivers/gpio/gpio-aspeed.c
> > @@ -662,12 +662,14 @@ static void aspeed_gpio_irq_handler(struct
> > irq_desc *desc)
> >  	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
> >  	struct irq_chip *ic = irq_desc_get_chip(desc);
> >  	struct aspeed_gpio *data = gpiochip_get_data(gc);
> > -	unsigned int i, p, girq;
> > +	unsigned int i, p, girq, banks;
> >  	unsigned long reg;
> > +	struct aspeed_gpio *gpio = gpiochip_get_data(gc);
> >  
> >  	chained_irq_enter(ic, desc);
> >  
> > -	for (i = 0; i < ARRAY_SIZE(aspeed_gpio_banks); i++) {
> > +	banks = DIV_ROUND_UP(gpio->config->nr_gpios, 32);
> > +	for (i = 0; i < banks; i++) {
> >  		const struct aspeed_gpio_bank *bank =
> > &aspeed_gpio_banks[i];
> >  
> >  		reg = ioread32(bank_reg(data, bank, reg_irq_status));
> > @@ -1108,9 +1110,33 @@ static const struct aspeed_gpio_config
> > ast2500_config =
> >  	/* 232 for simplicity, actual number is 228 (4-GPIO hole in
> > GPIOAB) */
> >  	{ .nr_gpios = 232, .props = ast2500_bank_props, };
> >  
> > +static const struct aspeed_bank_props ast2600_bank_props[] = {
> > +	/*     input	  output   */
> > +	{5, 0xffffffff,  0x0000ffff}, /* U/V/W/X */
> > +	{6, 0xffff0000,  0x0fff0000}, /* Y/Z */
> > +	{ },
> > +};
> > +
> > +static const struct aspeed_gpio_config ast2600_config =
> > +	/* 208 3.6V GPIOs */
> > +	{ .nr_gpios = 208, .props = ast2600_bank_props, };
> > +
> > +static const struct aspeed_bank_props ast2600_1_8v_bank_props[] =
> > {
> > +	/*     input	  output   */
> > +	{1, 0x0000000f,  0x0000000f}, /* E */
> 
> If there are 36 GPIOs then this configuration is suggesting that all
> of them
> are capable of input and output. A handy observation here is that the
> first
> 36 GPIOs of the 3.3V GPIO controller in the 2600 also have both
> capabilities,
> so we can re-use the 3.3V configuration if we can limit the number of
> GPIOs
> somehow.
> 
> The devicetree binding already describes an `ngpios` property so
> perhaps
> we could make use of this to use the same properties struct instance
> for both
> controllers in the 2600: Require that the property be present for
> 2600-
> compatible devicetree nodes and test for its presence in probe(),
> then fall
> back to the hard-coded value in the config struct if it is not (this
> keeps
> devicetree compatibility for the 2400 and 2500 drivers).
> 
> This way we can eliminate the aspeed,ast2600-1-8v-gpio compatible
> string
> below (we just use aspeed,ast2600-gpio for both controllers).
> 
> Thoughts?

I like this idea. Once I have confirmation that all the 1.8V pins are
indeed input and output capable I'll send out a v3.

> 
> Andrew
> 
> > +	{ },
> > +};
> > +
> > +static const struct aspeed_gpio_config ast2600_1_8v_config =
> > +	/* 36 1.8V GPIOs */
> > +	{ .nr_gpios = 36, .props = ast2600_1_8v_bank_props, };
> > +
> >  static const struct of_device_id aspeed_gpio_of_table[] = {
> >  	{ .compatible = "aspeed,ast2400-gpio", .data = &ast2400_config,
> > },
> >  	{ .compatible = "aspeed,ast2500-gpio", .data = &ast2500_config,
> > },
> > +	{ .compatible = "aspeed,ast2600-gpio", .data = &ast2600_config,
> > },
> > +	{ .compatible = "aspeed,ast2600-1-8v-gpio",
> > +	  .data = &ast2600_1_8v_config, },
> >  	{}
> >  };
> >  MODULE_DEVICE_TABLE(of, aspeed_gpio_of_table);
> > -- 
> > 2.20.1
> > 
> > 

