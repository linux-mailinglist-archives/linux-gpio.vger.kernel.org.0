Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63DD52B1872
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Nov 2020 10:39:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726297AbgKMJj3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Nov 2020 04:39:29 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:17979 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbgKMJj2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Nov 2020 04:39:28 -0500
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 1DB2F240004;
        Fri, 13 Nov 2020 09:39:24 +0000 (UTC)
Date:   Fri, 13 Nov 2020 10:39:24 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: Re: [PATCH v2 16/25] arch: arm: mach-at91: pm: Move prototypes to
 mutually included header
Message-ID: <20201113093924.GI4556@piout.net>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
 <20200713144930.1034632-17-lee.jones@linaro.org>
 <20201112093918.GV2063125@dell>
 <20201112100731.GC4556@piout.net>
 <20201112104810.GH1997862@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201112104810.GH1997862@dell>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 12/11/2020 10:48:10+0000, Lee Jones wrote:
> On Thu, 12 Nov 2020, Alexandre Belloni wrote:
> 
> > Hi,
> > 
> > On 12/11/2020 09:39:18+0000, Lee Jones wrote:
> > > Both the caller and the supplier's source file should have access to
> > > the include file containing the prototypes.
> > > 
> > > Fixes the following W=1 kernel build warning(s):
> > > 
> > >  drivers/pinctrl/pinctrl-at91.c:1637:6: warning: no previous prototype for ‘at91_pinctrl_gpio_suspend’ [-Wmissing-prototypes]
> > >  1637 | void at91_pinctrl_gpio_suspend(void)
> > >  | ^~~~~~~~~~~~~~~~~~~~~~~~~
> > >  drivers/pinctrl/pinctrl-at91.c:1661:6: warning: no previous prototype for ‘at91_pinctrl_gpio_resume’ [-Wmissing-prototypes]
> > >  1661 | void at91_pinctrl_gpio_resume(void)
> > >  | ^~~~~~~~~~~~~~~~~~~~~~~~
> > > 
> > > Cc: Russell King <linux@armlinux.org.uk>
> > > Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> > > Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > > Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > > ---
> 
> [...]
> 
> > > diff --git a/include/soc/at91/pm.h b/include/soc/at91/pm.h
> > > new file mode 100644
> > > index 0000000000000..0fd5093f7f73a
> > > --- /dev/null
> > > +++ b/include/soc/at91/pm.h
> > > @@ -0,0 +1,9 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > +/*
> > > + * atmel platform data
> > > + */
> > > +
> > > +#ifdef CONFIG_PINCTRL_AT91
> > 
> > Shouldn't that be a header guard instead of depending on PINCTRL_AT91 ?
> 
> I copied the same semantics from the header it was taken from.
> 
> Happy to turn it into a proper header file too.

I guess that would be better. How do you expect this patch to be merged?

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
