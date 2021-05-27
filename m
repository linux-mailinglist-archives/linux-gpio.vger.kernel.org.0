Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69AFB39251F
	for <lists+linux-gpio@lfdr.de>; Thu, 27 May 2021 04:58:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232134AbhE0DAU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 May 2021 23:00:20 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:50547 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229939AbhE0DAU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 May 2021 23:00:20 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 14R2jfcU078610;
        Thu, 27 May 2021 10:45:41 +0800 (GMT-8)
        (envelope-from steven_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 27 May
 2021 10:58:43 +0800
Date:   Thu, 27 May 2021 10:58:37 +0800
From:   Steven Lee <steven_lee@aspeedtech.com>
To:     Jeremy Kerr <jk@ozlabs.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>,
        "Hongweiz@ami.com" <Hongweiz@ami.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH v1 1/4] dt-bindings: aspeed-sgpio: Convert txt bindings
 to yaml.
Message-ID: <20210527025836.GD9971@aspeedtech.com>
References: <20210526094609.14068-1-steven_lee@aspeedtech.com>
 <20210526094609.14068-2-steven_lee@aspeedtech.com>
 <f50dec3a8be8f8254321d22d784eba4f5a032887.camel@ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f50dec3a8be8f8254321d22d784eba4f5a032887.camel@ozlabs.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 14R2jfcU078610
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The 05/27/2021 09:42, Jeremy Kerr wrote:
> Hi Steven,
> 
> > SGPIO bindings should be converted as yaml format.
> > In addition to the file conversion, a new property max-ngpios is
> > added in the yaml file as well.
> > The new property is required by the enhanced sgpio driver for
> > making the configuration of the max number of gpio pins more
> > flexible.
> 
> There are a number of things going on here - you're doing the YAML
> conversion, introducing the max-gpios property, and changing the
> compatible value.
> 
> The first two make sense, but may be better split into separate
> changes, so that the YAML conversion is a "linear" change.
> 

Thanks for your suggestion, I will split them into 2 patches.

> I'm not clear on why you're changing the compatible value though,
> particularly as you're dropping support for the existing compatible
> value anyway. How about we keep the old one, and use the default of 128
> for cases where max-ngpios is absent? That way, we retain support for
> the existing device trees.
> 

AST2600 support both SGPIO master and slave interfaces. So we decide to
rename sgpio to sgpiom as it is the driver for sgpio master interface.
Since Andrew also point out the compatibility issues, I will modify driver
to keep the original design.

> > +  max-ngpios:
> > +    description:
> > +      represents the number of actual hardware-supported GPIOs (ie,
> > +      slots within the clocked serial GPIO data). Since each HW GPIO is both an
> > +      input and an output, we provide max_ngpios * 2 lines on our gpiochip
> > +      device. We also use it to define the split between the inputs and
> > +      outputs; the inputs start at line 0, the outputs start at max_ngpios.
> 
> Most of this description is better suited to the ngpios property, which
> controls the number of lines that the gpiochip will expose.
> 
> Also, minor nit: max_ngpios -> max-ngpios.
> 
> How about something like:
> 
>   ngpios:
>     description:
>       Number of GPIO lines to expose. Since each HW GPIO is an input and an
>       output, we provide ngpios * 2 lines on our chip device. We also use it
>       to define the split between the inputs and outputs; the inputs start at
>       line 0, the outputs start at ngpios.
> 
>   max-ngpios:
>     description:
>       Represents the number of actual hardware-supported GPIOs (ie, slots within
>       the clocked serial GPIO data), and therefore the maximum value for
>       the ngpios property
> 

I will modify the description as you suggested.

> > +    minimum: 0
> > +    maximum: 128
> 
> Will this be the case for all (future) hardware? Can we leave this
> unbound?
> 

Since the future hardware may supports more gpios, I will remove it.

> Cheers,
> 
> 
> Jeremy
> 
