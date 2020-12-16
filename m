Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 946462DBDBE
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Dec 2020 10:37:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725944AbgLPJhB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Dec 2020 04:37:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:51494 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725877AbgLPJhB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Dec 2020 04:37:01 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 68BC923102;
        Wed, 16 Dec 2020 09:36:20 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1kpTEI-001jGE-38; Wed, 16 Dec 2020 09:36:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 16 Dec 2020 09:36:17 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Punit Agrawal <punit1.agrawal@toshiba.co.jp>,
        yuji2.ishikawa@toshiba.co.jp,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] gpio: visconti: Add Toshiba Visconti GPIO support
In-Reply-To: <20201216091148.vmriqt3vsg34pqhj@toshiba.co.jp>
References: <20201211094138.2863677-1-nobuhiro1.iwamatsu@toshiba.co.jp>
 <20201211094138.2863677-3-nobuhiro1.iwamatsu@toshiba.co.jp>
 <CACRpkdZ-umK4troerSA6S2rvyU5XV+KsFdxuWE5Sy0PCgdfT6A@mail.gmail.com>
 <20201216091148.vmriqt3vsg34pqhj@toshiba.co.jp>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <1ceac365ff6127c96006ed4570f87b47@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: nobuhiro1.iwamatsu@toshiba.co.jp, linus.walleij@linaro.org, robh+dt@kernel.org, punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020-12-16 09:11, Nobuhiro Iwamatsu wrote:

[...]

>> > +       for (i = 0; i < num_irq; i++) {
>> > +               desc = irq_to_desc(priv->irq[i]);
>> > +               desc->status_use_accessors |= IRQ_NOAUTOEN;
>> > +               if (devm_request_irq(dev, priv->irq[i],
>> > +                                    visconti_gpio_irq_handler, 0, name, priv)) {
>> > +                       dev_err(dev, "failed to request IRQ[%d]\n", i);
>> > +                       return -ENOENT;
>> > +               }
>> > +       }
>> 
>> This should not be needed either when using hiearchical IRQs,
>> also the irqchip maintainers will beat us up for poking around in the
>> descs like this.
> 
> I understand that the processing equivalent to request_irq() is 
> processed
> by the irqchip frame work (or GIC driver). Is this correct?

request_irq() is reserved to endpoint drivers (the driver for the device
driving the IRQ line). If this is indeed a hierarchical irqchip, the
line allocation will be driven from the GPIO framework, and 
request_irq()
will perform the activation. There isn't anything that this driver 
should
do directly other than configuring its own state and passing the request
along to the parent controller.

And yes, mucking with the irq descriptor will get you in massive 
trouble,
never do that.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
