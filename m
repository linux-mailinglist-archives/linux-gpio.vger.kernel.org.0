Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E070F2E9788
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jan 2021 15:45:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbhADOo4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jan 2021 09:44:56 -0500
Received: from os.inf.tu-dresden.de ([141.76.48.99]:42446 "EHLO
        os.inf.tu-dresden.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725889AbhADOo4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jan 2021 09:44:56 -0500
Received: from erwin.inf.tu-dresden.de ([141.76.48.80] helo=os.inf.tu-dresden.de)
        by os.inf.tu-dresden.de with esmtps (TLS1.3:TLS_AES_256_GCM_SHA384:256) (Exim 4.94)
        id 1kwR5X-0006T1-5s; Mon, 04 Jan 2021 15:44:03 +0100
Date:   Mon, 4 Jan 2021 15:43:58 +0100
From:   Adam Lackorzynski <adam@l4re.org>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        linusw@kernel.org, Imre Kaloz <kaloz@openwrt.org>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 5/6] gpiolib: Fix return check of __irq_domain_alloc_irqs
Message-ID: <X/MprlJnhAEeWOns@os.inf.tu-dresden.de>
References: <20210102175859.335447-1-adam@l4re.org>
 <20210102175859.335447-5-adam@l4re.org>
 <CAMpxmJVc=DQm7NSVAdLYWbrLSkHgpXy8HsJWQp17hAePF_=r=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <CAMpxmJVc=DQm7NSVAdLYWbrLSkHgpXy8HsJWQp17hAePF_=r=g@mail.gmail.com>
User-Agent: Mutt/2.0.2 (2020-11-20)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Mon Jan 04, 2021 at 14:57:31 +0100, Bartosz Golaszewski wrote:
> On Sat, Jan 2, 2021 at 6:59 PM Adam Lackorzynski <adam@l4re.org> wrote:
> >
> > 0 is not a proper IRQ number and also indicates failure.
> >
> > Signed-off-by: Adam Lackorzynski <adam@l4re.org>
> > ---
> >  drivers/gpio/gpiolib.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index b02cc2abd3b6..9667e1a62626 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -1003,7 +1003,7 @@ static void gpiochip_set_hierarchical_irqchip(struct gpio_chip *gc,
> >                                                       &fwspec,
> >                                                       false,
> >                                                       NULL);
> > -                       if (ret < 0) {
> > +                       if (ret <= 0) {
> >                                 chip_err(gc,
> >                                          "can not allocate irq for GPIO line %d parent hwirq %d in hierarchy domain: %d\n",
> >                                          i, parent_hwirq,
> > --
> > 2.30.0.rc2
> >
> 
> Does this commit depend in any way on others in this series or can I
> apply it directly for fixes?

It is independent, you can directly apply it.


Thanks, Adam
