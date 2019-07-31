Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0DF57CE4A
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2019 22:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728292AbfGaU1Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Jul 2019 16:27:16 -0400
Received: from atlmailgw2.ami.com ([63.147.10.42]:60257 "EHLO
        atlmailgw2.ami.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728136AbfGaU1Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Jul 2019 16:27:16 -0400
X-AuditID: ac10606f-d11ff70000003324-75-5d41f9a38aec
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com [172.16.96.144])
        (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by atlmailgw2.ami.com (Symantec Messaging Gateway) with SMTP id AC.A0.13092.3A9F14D5; Wed, 31 Jul 2019 16:27:15 -0400 (EDT)
Received: from hongweiz-Ubuntu-AMI.us.megatrends.com (172.16.98.93) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 31 Jul 2019 16:27:14 -0400
From:   Hongwei Zhang <hongweiz@ami.com>
To:     Andrew Jeffery <andrew@aj.id.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Joel Stanley <joel@jms.id.au>
CC:     linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Hongwei Zhang <hongweiz@ami.com>
Subject: [v6 2/2] gpio: aspeed: Add SGPIO driver
Date:   Wed, 31 Jul 2019 16:25:45 -0400
Message-ID: <1564604745-1639-1-git-send-email-hongweiz@ami.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564500268-2627-3-git-send-email-hongweiz@ami.com>
References: <1564500268-2627-3-git-send-email-hongweiz@ami.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.93]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDLMWRmVeSWpSXmKPExsWyRiBhgu7in46xBqv3KVjsusxh8WXuKRaL
        3+f/MltM+bOcyWLT42usFs2rzzFbbJ7/h9Hi8q45bA4cHlfbd7F7vL/Ryu5x8eMxZo871/aw
        eWxeUu9xfsZCRo/Pm+QC2KO4bFJSczLLUov07RK4Mto+/GYruCtRcfn/ctYGxgvCXYycHBIC
        JhKtS84wdTFycQgJ7GKSeLtsCQuEc5hRYue3u4wgVWwCahJ7N88BqxIRmMUocevJLDaQBLPA
        HUaJDd3ZILawgIHEz8VP2bsYOThYBFQltj2SAgnzCthLXOg8wASxTU7i5rlOZhCbU8BBYv6V
        frC4EEjNi3UsEPWCEidnPmGBGC8hcfDFC2aIGlmJW4ceQ81RkHje95hlAiPQMQgts5C0LGBk
        WsUolFiSk5uYmZNebqSXmJupl5yfu4kREuL5Oxg/fjQ/xMjEwXiIUYKDWUmEd7G4fawQb0pi
        ZVVqUX58UWlOavEhRmkOFiVx3lVrvsUICaQnlqRmp6YWpBbBZJk4OKUaGNk0O9+mbH/U0dLm
        9kJg8hLdiVrTQ+senJu/PCgv4FhQ+xbZf7Yin2esuST96fnD15oz7MwXzPzsu7h5d3i69pV9
        9Tybvx7KYBVzSfdeJCr9xEq4YWbwHssw/6cpnZ/SI03YJlzQmaQ2/ap37OPVxwOUOX7O32OT
        k514jvf3ti9R6l/3Xb+Y2qzEUpyRaKjFXFScCAD4HFqxXwIAAA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Andrew,
Thanks so much for your help.

> From:	Andrew Jeffery <andrew@aj.id.au>
> Sent:	Tuesday, July 30, 2019 8:19 PM
> To:	Hongwei Zhang; Linus Walleij; linux-gpio@vger.kernel.org
> Cc:	Joel Stanley; linux-aspeed@lists.ozlabs.org; Bartosz Golaszewski; linux-kernel@vger.kernel.org; 
> linux-arm-kernel@lists.infradead.org
> Subject:	Re: [v6 2/2] gpio: aspeed: Add SGPIO driver
> 
> 
> 
> On Wed, 31 Jul 2019, at 00:55, Hongwei Zhang wrote:
> > Add SGPIO driver support for Aspeed AST2500 SoC.
> > 
> > Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
> > ---
> >  drivers/gpio/sgpio-aspeed.c | 521 
> > ++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 521 insertions(+)
> >  create mode 100644 drivers/gpio/sgpio-aspeed.c
> > 
> > diff --git a/drivers/gpio/sgpio-aspeed.c b/drivers/gpio/sgpio-aspeed.c 
> > new file mode 100644 index 0000000..9a17b1a
> > --- /dev/null
> > +++ b/drivers/gpio/sgpio-aspeed.c
> > @@ -0,0 +1,521 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Copyright 2019 American Megatrends International LLC.
> > + *
> > + * Author: Karthikeyan Mani <karthikeyanm@amiindia.co.in>  */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/clk.h>
> > +#include <linux/gpio/driver.h>
> > +#include <linux/hashtable.h>
> > +#include <linux/init.h>
> > +
> > +static void aspeed_sgpio_set(struct gpio_chip *gc, unsigned int
> > offset, int val)
> > +{
> > +	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
> > +	const struct aspeed_sgpio_bank *bank = to_bank(offset);
> > +	unsigned long flags;
> > +	void __iomem *addr;
> > +	u32 reg = 0;
> > +
> > +	spin_lock_irqsave(&gpio->lock, flags);
> > +
> > +	addr = bank_reg(gpio, bank, reg_val);
> > +
> > +	if (val)
> > +		reg |= GPIO_BIT(offset);
> > +	else
> > +		reg &= ~GPIO_BIT(offset);
> 
> reg is zero-initialised above and you haven't read from addr to assign to reg, so the else branch is 
> redundant (reg is already zeroed). This path has a bug - you're clearing the state of all GPIOs associated 
> with addr rather than just the GPIO associated with offset.
> 

you're correct, this is fixed in v7.

> > +
> > +	iowrite32(reg, addr);
> > +
> > +	spin_unlock_irqrestore(&gpio->lock, flags); }
> > +
> > +
> > +static int aspeed_sgpio_dir_out(struct gpio_chip *gc, unsigned int
> > offset, int val)
> > +{
> > +	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&gpio->lock, flags);
> > +	gpio->dir_in[GPIO_BANK(offset)] &= ~GPIO_BIT(offset);
> > +	spin_unlock_irqrestore(&gpio->lock, flags);
> > +
> > +	aspeed_sgpio_set(gc, offset, val);
> 
> In this case you should probably have an unlocked variant of aspeed_sgpio_set() so you can call it inside 
> the the critical section above instead of needing to acquire/release the lock twice (once above and again 
> in aspeed_sgpio_set() as it stands).
> 

moved _sgpio_set() so only one pair of acquire/release lock used.

> Cheers,
> 
> Andrew
> 

Thanks,
--Hongwei

> > +
> > +	return 0;
> > +}
> > +
> > --
> > 2.7.4
> > 
> >
