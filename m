Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABA28223DD3
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 16:10:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbgGQOK1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 10:10:27 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:6599 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgGQOK0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2020 10:10:26 -0400
X-Originating-IP: 90.65.108.121
Received: from localhost (lfbn-lyo-1-1676-121.w90-65.abo.wanadoo.fr [90.65.108.121])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 93190240013;
        Fri, 17 Jul 2020 14:10:23 +0000 (UTC)
Date:   Fri, 17 Jul 2020 16:10:23 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: Re: [PATCH 16/25] arch: arm: mach-at91: pm: Move prototypes to
 mutually included header
Message-ID: <20200717141023.GS3428@piout.net>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
 <20200713144930.1034632-17-lee.jones@linaro.org>
 <20200713200244.GA23553@piout.net>
 <20200716134231.GP3165313@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200716134231.GP3165313@dell>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 16/07/2020 14:42:31+0100, Lee Jones wrote:
> > > diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
> > > index 9c52130876597..37997e5ab0538 100644
> > > --- a/drivers/pinctrl/pinctrl-at91.c
> > > +++ b/drivers/pinctrl/pinctrl-at91.c
> > > @@ -22,6 +22,7 @@
> > >  #include <linux/pinctrl/pinmux.h>
> > >  /* Since we request GPIOs from ourself */
> > >  #include <linux/pinctrl/consumer.h>
> > > +#include <linux/platform_data/atmel.h>
> > >  
> > >  #include "pinctrl-at91.h"
> > >  #include "core.h"
> > > diff --git a/include/linux/platform_data/atmel.h b/include/linux/platform_data/atmel.h
> > > index 99e6069c5fd89..666ef482ea8c0 100644
> > > --- a/include/linux/platform_data/atmel.h
> > > +++ b/include/linux/platform_data/atmel.h
> > 
> > The plan is to get rid of that file so you should probably find a better
> > location.
> 
> Suggestions welcome.
> 

Something like include/soc/at91/pm.h so we can also move
at91_suspend_entering_slow_clock there and then kill
platform_data/atmel.h.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
