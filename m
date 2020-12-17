Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 835E92DCBD6
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Dec 2020 06:13:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbgLQFMx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Dec 2020 00:12:53 -0500
Received: from mo-csw1114.securemx.jp ([210.130.202.156]:41798 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbgLQFMx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Dec 2020 00:12:53 -0500
Received: by mo-csw.securemx.jp (mx-mo-csw1114) id 0BH5ARkV031778; Thu, 17 Dec 2020 14:10:27 +0900
X-Iguazu-Qid: 2wGr4wgD0TY3NxKKBP
X-Iguazu-QSIG: v=2; s=0; t=1608181827; q=2wGr4wgD0TY3NxKKBP; m=VS/HNZNDUfKECpOILMhKu5A4oTfVdUJkWsl2uYdhdrc=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
        by relay.securemx.jp (mx-mr1112) id 0BH5AQqs013260;
        Thu, 17 Dec 2020 14:10:26 +0900
Received: from enc01.toshiba.co.jp ([106.186.93.100])
        by imx2.toshiba.co.jp  with ESMTP id 0BH5AQmT023274;
        Thu, 17 Dec 2020 14:10:26 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc01.toshiba.co.jp  with ESMTP id 0BH5AQoc014349;
        Thu, 17 Dec 2020 14:10:26 +0900
Date:   Thu, 17 Dec 2020 14:10:21 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Marc Zyngier <maz@kernel.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Punit Agrawal <punit1.agrawal@toshiba.co.jp>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, yuji2.ishikawa@toshiba.co.jp,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 2/4] gpio: visconti: Add Toshiba Visconti GPIO support
X-TSB-HOP: ON
Message-ID: <20201217051021.x57bigbbdmc7uj7w@toshiba.co.jp>
References: <20201211094138.2863677-1-nobuhiro1.iwamatsu@toshiba.co.jp>
 <20201211094138.2863677-3-nobuhiro1.iwamatsu@toshiba.co.jp>
 <CACRpkdZ-umK4troerSA6S2rvyU5XV+KsFdxuWE5Sy0PCgdfT6A@mail.gmail.com>
 <20201216091148.vmriqt3vsg34pqhj@toshiba.co.jp>
 <1ceac365ff6127c96006ed4570f87b47@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ceac365ff6127c96006ed4570f87b47@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Wed, Dec 16, 2020 at 09:36:17AM +0000, Marc Zyngier wrote:
> On 2020-12-16 09:11, Nobuhiro Iwamatsu wrote:
> 
> [...]
> 
> > > > +       for (i = 0; i < num_irq; i++) {
> > > > +               desc = irq_to_desc(priv->irq[i]);
> > > > +               desc->status_use_accessors |= IRQ_NOAUTOEN;
> > > > +               if (devm_request_irq(dev, priv->irq[i],
> > > > +                                    visconti_gpio_irq_handler, 0, name, priv)) {
> > > > +                       dev_err(dev, "failed to request IRQ[%d]\n", i);
> > > > +                       return -ENOENT;
> > > > +               }
> > > > +       }
> > > 
> > > This should not be needed either when using hiearchical IRQs,
> > > also the irqchip maintainers will beat us up for poking around in the
> > > descs like this.
> > 
> > I understand that the processing equivalent to request_irq() is
> > processed
> > by the irqchip frame work (or GIC driver). Is this correct?
> 
> request_irq() is reserved to endpoint drivers (the driver for the device
> driving the IRQ line). If this is indeed a hierarchical irqchip, the
> line allocation will be driven from the GPIO framework, and request_irq()
> will perform the activation. There isn't anything that this driver should
> do directly other than configuring its own state and passing the request
> along to the parent controller.
> 
> And yes, mucking with the irq descriptor will get you in massive trouble,
> never do that.
> 

I see. Thank you for the explanation.
I got a better understanding.

Best regards,
  Nobuhiro

> -- 
> Jazz is not dead. It just smells funny...
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
