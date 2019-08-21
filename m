Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C47D597CD5
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2019 16:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728724AbfHUOZv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Aug 2019 10:25:51 -0400
Received: from atlmailgw2.ami.com ([63.147.10.42]:59600 "EHLO
        atlmailgw2.ami.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726484AbfHUOZu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Aug 2019 10:25:50 -0400
X-AuditID: ac10606f-d11ff70000003324-16-5d5d546dd669
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com [172.16.96.144])
        (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by atlmailgw2.ami.com (Symantec Messaging Gateway) with SMTP id C0.22.13092.D645D5D5; Wed, 21 Aug 2019 10:25:49 -0400 (EDT)
Received: from hongweiz-Ubuntu-AMI.us.megatrends.com (172.16.98.93) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 21 Aug 2019 10:25:49 -0400
From:   Hongwei Zhang <hongweiz@ami.com>
To:     Andrew Jeffery <andrew@aj.id.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>
CC:     Hongwei Zhang <hongweiz@ami.com>, Joel Stanley <joel@jms.id.au>,
        <linux-aspeed@lists.ozlabs.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [v7 2/2] gpio: aspeed: Add SGPIO driver
Date:   Wed, 21 Aug 2019 10:25:21 -0400
Message-ID: <1566397521-987-1-git-send-email-hongweiz@ami.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564603297-1391-3-git-send-email-hongweiz@ami.com>
References: <1564603297-1391-1-git-send-email-hongweiz@ami.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.93]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFLMWRmVeSWpSXmKPExsWyRiBhgm5eSGysQc8WRotdlzksvsw9xWLx
        +/xfZospf5YzWWx6fI3Vonn1OWaLzfP/MFpc3jWHzYHD42r7LnaP9zda2T0ufjzG7HHn2h42
        j81L6j3Oz1jI6PF5k1wAexSXTUpqTmZZapG+XQJXxsvmU+wF30QrDtz4wdrAeEugi5GTQ0LA
        ROLxv1nMXYxcHEICu5gk7j1aAOUcZpQ4+2gSG0gVm4CaxN7Nc5hAbBGBPInD69+yghQxCzxm
        lNj9agNQEQeHsICBxLEVeiA1LAKqEs0nvjGChHkF7CRe9RRCLJOTuHmukxnE5hRwkPh2ZikT
        SImQgL3E1O/VIGFeAUGJkzOfsIDYzAISEgdfvAArFxKQlbh16DETxBgFied9j1kmMArMQtIy
        C0nLAkamVYxCiSU5uYmZOenlRnqJuZl6yfm5mxgh4Z2/g/HjR/NDjEwcjIcYJTiYlUR4K+ZE
        xQrxpiRWVqUW5ccXleakFh9ilOZgURLnXbXmW4yQQHpiSWp2ampBahFMlomDU6qBMaN26021
        Rc+yboS911XPNT16UXBaXcXDd0cdW33z/wiW3y7e53mQ9bWP7vdFc/RWP9X8nXj6/7mjUxdH
        LvvhzjI1N1pLf81hPu0PLUs2+s54UJi+4v1jNu9qHTPPLKG/l3haWosFnNOeOV7w/RLGuitm
        SpBe/II+iZOPdQ5Wisrf/NOret81TomlOCPRUIu5qDgRAOsOQLZdAgAA
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Linus,

Thanks for your review! I just submitted v8 to the list, please help to review it again.

Since you have already merged the dt-binding document [v7 1/2], and I don't have your
update to this file, so to avoid confusion, I only include the driver code in v8.

Regards,
--Hongwei 

P.S. sorry previous response used wrong In-Reply-To ID, so resent it again.

> From:	Linus Walleij <linus.walleij@linaro.org>
> Sent:	Wednesday, August 14, 2019 4:09 AM
> To:	Hongwei Zhang
> Cc:	Andrew Jeffery; open list:GPIO SUBSYSTEM; Joel Stanley; linux-aspeed; Bartosz Golaszewski; 
> linux-kernel@vger.kernel.org; Linux ARM
> Subject:	Re: [v7 2/2] gpio: aspeed: Add SGPIO driver
> 
> Hi Hongwei,
> 
> thanks for your patch!
> 
> I have now merged the bindings so you only need to respin this patch.
> 
> On Wed, Jul 31, 2019 at 10:02 PM Hongwei Zhang <hongweiz@ami.com> wrote:
> 
> > Add SGPIO driver support for Aspeed AST2500 SoC.
> >
> > Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
> > Reviewed-by:   Andrew Jeffery <andrew@aj.id.au>
> 
> I guess I need to go with this, there are some minor things I still want to be fixed:
> 
> > +static void __aspeed_sgpio_set(struct gpio_chip *gc, unsigned int 
> > +offset, int val)
> 
> I don't like __underscore_functions because their semantic is ambiguous.
> 

done, please see v8.

> Rename this something like aspeed_sgpio_commit() or whatever best fits the actual use.
> 
> > +static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
> > +                                  struct platform_device *pdev) {
> (...)
> > +       rc = gpiochip_irqchip_add(&gpio->chip, &aspeed_sgpio_irqchip,
> > +                                 0, handle_bad_irq, IRQ_TYPE_NONE);
> (...)
> > +       gpiochip_set_chained_irqchip(&gpio->chip, &aspeed_sgpio_irqchip,
> > +                                    gpio->irq, 
> > + aspeed_sgpio_irq_handler);
> 
> We do not set up chained irqchips like this anymore, sorry.
> 
> I am currently rewriting all existing chained drivers to pass an initialized irqchip when registering the 
> whole gpio chip.
> See drivers/gpio/TODO.
> 
> Here are examples:
> https://lore.kernel.org/linux-gpio/20190811080539.15647-1-linus.walleij@linaro.org/
> https://lore.kernel.org/linux-gpio/20190812132554.18313-1-linus.walleij@linaro.org/
> 

done, please see v8.

> > +       /* set all SGPIO pins as input (1). */
> > +       memset(gpio->dir_in, 0xff, sizeof(gpio->dir_in));
> 
> Do the irqchip set-up here, before adding the gpio_chip.
> 
> > +       rc = devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
> > +       if (rc < 0)
> > +               return rc;
> > +
> > +       return aspeed_sgpio_setup_irqs(gpio, pdev);
> 
> Yours,
> Linus Walleij
