Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A83622FB9F
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jul 2020 23:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbgG0VuP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jul 2020 17:50:15 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:45926 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726110AbgG0VuP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jul 2020 17:50:15 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id AF3D08030867;
        Mon, 27 Jul 2020 21:50:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id BaDuD-7nSK_l; Tue, 28 Jul 2020 00:50:12 +0300 (MSK)
Date:   Tue, 28 Jul 2020 00:50:10 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/7] gpio: dwapb: Convert driver to using the
 GPIO-lib-based IRQ-chip
Message-ID: <20200727215010.qzhvavmskfoaapi5@mobilestation>
References: <20200723013858.10766-1-Sergey.Semin@baikalelectronics.ru>
 <20200723013858.10766-5-Sergey.Semin@baikalelectronics.ru>
 <20200723100317.GJ3703480@smile.fi.intel.com>
 <20200724230342.bhdpc32rsjw7rzbl@mobilestation>
 <CAHp75Vdeg6v_yLYjxZPJM7SgDP-fou6SEuaE8+TFCNW4c2r_rA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAHp75Vdeg6v_yLYjxZPJM7SgDP-fou6SEuaE8+TFCNW4c2r_rA@mail.gmail.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 25, 2020 at 03:12:49PM +0300, Andy Shevchenko wrote:
> On Sat, Jul 25, 2020 at 2:03 AM Serge Semin
> <Sergey.Semin@baikalelectronics.ru> wrote:
> > On Thu, Jul 23, 2020 at 01:03:17PM +0300, Andy Shevchenko wrote:
> > > On Thu, Jul 23, 2020 at 04:38:55AM +0300, Serge Semin wrote:

...
 
> > > > +           /* This will let us handle the parent IRQ in the driver */
> > > > +           girq->parents = NULL;
> > > > +           girq->num_parents = 0;
> > > > +           girq->parent_handler = NULL;
> 
> > > Shan't we do this before request_irq() call (at least for consistency with the
> > > rest of the drivers)?
> >
> > Technically we shan't. Please elaborate which drivers you are referring to?
> 
> All of them? Recent patches for IRQ chip template do something like
> 
> girq = &...;
> girq->foo = bar;
> ...
> ret = request_irq(...);
> 
> ...and here no more girq->baz = gaz; lines.
> 
> > Even the recent Linus' series "Use irqchip template" mostly does it in the
> > same order.
> 
> Funny, that's what I;m referring to.

It turns out my "mostly" was wrong in this matter. It's 4 out of 17 patches,
which make the initialization in the same order as mine:
drivers/gpio/gpio-max732x.c
drivers/gpio/gpio-pca953x.c
drivers/gpio/gpio-pcf857x.c
drivers/gpio/gpio-adp5588.c

while the rest of them does it in the order suggested by you:
drivers/gpio/gpio-pci-idio-16.c
drivers/gpio/gpio-pcie-idio-24.c
drivers/gpio/gpio-104-idio-16.c
drivers/gpio/gpio-104-dio-48e.c
drivers/gpio/gpio-ws16c48.c
drivers/gpio/gpio-rcar.c
drivers/gpio/gpio-wcove.c
drivers/pinctrl/pinctrl-amd.c
drivers/gpio/gpio-crystalcove.c
drivers/pinctrl/pinctrl-mcp23s08.c
drivers/pinctrl/pinctrl-sx150x.c
drivers/pinctrl/pinctrl-stmfx.c
drivers/gpio/gpio-tc3589x.c

Then, let's use the same order here as the most of the drivers do just for
consistency.

-Sergey 

> 
> -- 
> With Best Regards,
> Andy Shevchenko
