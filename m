Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4AA82C96A9
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Dec 2020 06:04:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725899AbgLAFES (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Dec 2020 00:04:18 -0500
Received: from mo-csw1116.securemx.jp ([210.130.202.158]:38624 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725849AbgLAFES (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2020 00:04:18 -0500
Received: by mo-csw.securemx.jp (mx-mo-csw1116) id 0B1527gj002940; Tue, 1 Dec 2020 14:02:08 +0900
X-Iguazu-Qid: 2wHHLA7xMpfc7myY54
X-Iguazu-QSIG: v=2; s=0; t=1606798927; q=2wHHLA7xMpfc7myY54; m=cJHqGlfb1V063hhBREcXiFkKnrnXq0x2hVYSI8uE6DE=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
        by relay.securemx.jp (mx-mr1111) id 0B1526Ji038343;
        Tue, 1 Dec 2020 14:02:07 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
        by imx12.toshiba.co.jp  with ESMTP id 0B1526H1009157;
        Tue, 1 Dec 2020 14:02:06 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 0B1526wY012148;
        Tue, 1 Dec 2020 14:02:06 +0900
Date:   Tue, 1 Dec 2020 14:02:04 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Punit Agrawal <punit1.agrawal@toshiba.co.jp>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, yuji2.ishikawa@toshiba.co.jp,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 2/4] gpio: visoconti: Add Toshiba Visconti GPIO support
X-TSB-HOP: ON
Message-ID: <20201201050204.jlwmkdptrxxptzil@toshiba.co.jp>
References: <20201112084057.1399983-1-nobuhiro1.iwamatsu@toshiba.co.jp>
 <20201112084057.1399983-3-nobuhiro1.iwamatsu@toshiba.co.jp>
 <CACRpkdbtkLjzMqRKzd3ppmwZ9hZESL4+zGOf7-uqjuF==Wm=3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbtkLjzMqRKzd3ppmwZ9hZESL4+zGOf7-uqjuF==Wm=3A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Thanks for your review.

On Tue, Nov 17, 2020 at 09:59:06PM +0100, Linus Walleij wrote:
> Hi Nobuhiro,
> 
> On Thu, Nov 12, 2020 at 12:42 AM Nobuhiro Iwamatsu
> <nobuhiro1.iwamatsu@toshiba.co.jp> wrote:
> 
> > Add the GPIO driver for Toshiba Visconti ARM SoCs.
> >
> > Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> 
> I just noticed this:
> 
> > +config GPIO_VISCONTI
> > +       tristate "Toshiba Visconti GPIO support"
> > +       depends on ARCH_VISCONTI || COMPILE_TEST
> > +       depends on OF_GPIO
> > +       select GPIOLIB_IRQCHIP
> > +       help
> > +         Say yes here to support GPIO on Tohisba Visconti.
> 
> Add:
> select GPIO_GENERIC

OK, I will add this.

> 
> Then all of these:
> 
> > +static int visconti_gpio_get(struct gpio_chip *chip, unsigned int offset)
> > +static void visconti_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
> > +static int visconti_gpio_get_dir(struct gpio_chip *chip, unsigned int offset)
> > +static int visconti_gpio_dir_in(struct gpio_chip *chip, unsigned int offset)
> > +static int visconti_gpio_dir_out(struct gpio_chip *chip, unsigned int offset, int value)
> 
> Can be implemented by the genric MMIO GPIO library.

I see. I will update using generic MMIO GPIO library.

> 
> > +       gpio_chip = &priv->gpio_chip;
> > +       gpio_chip->label = name;
> > +       gpio_chip->owner = THIS_MODULE;
> > +       gpio_chip->parent = dev;
> > +       gpio_chip->request = gpiochip_generic_request;
> > +       gpio_chip->free = gpiochip_generic_free;
> > +       gpio_chip->get = visconti_gpio_get;
> > +       gpio_chip->set = visconti_gpio_set;
> > +       gpio_chip->get_direction = visconti_gpio_get_dir;
> > +       gpio_chip->direction_input = visconti_gpio_dir_in;
> > +       gpio_chip->direction_output = visconti_gpio_dir_out;
> > +       gpio_chip->base = 0;
> > +       gpio_chip->ngpio = VISCONTI_GPIO_NR;
> > +       gpio_chip->irq.init_valid_mask = visconti_init_irq_valid_mask;
> 
> Initialized the generic helpers using the addresses of the
> GPIO registers here by a call to bgpio_init().
> 
> Check this driver for an example:
> drivers/gpio/gpio-ftgpio010.c
> 
> If you get uncertain about the arguments to bgpio_init()
> check drivers/gpio/gpio-mmio.c, there is kerneldoc for the
> function.
> 
> By doing this you get implementations of gpio_[get|set]_multiple()
> for free.


Thanks for your suggestion.
I see. I will check these and update.


> 
> Yours,
> Linus Walleij

Best regards,
  Nobuhiro
