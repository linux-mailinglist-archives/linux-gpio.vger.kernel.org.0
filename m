Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 477BBAB4A8
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2019 11:12:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390934AbfIFJMU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Sep 2019 05:12:20 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:57273 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730704AbfIFJMU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Sep 2019 05:12:20 -0400
X-Originating-IP: 86.207.98.53
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 768CD6000B;
        Fri,  6 Sep 2019 09:12:17 +0000 (UTC)
Date:   Fri, 6 Sep 2019 11:12:12 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     David Laight <David.Laight@aculab.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        "Claudiu.Beznea@microchip.com" <Claudiu.Beznea@microchip.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] pinctrl: at91-pio4: implement .get_multiple and
 .set_multiple
Message-ID: <20190906091212.GF21254@piout.net>
References: <20190905144849.24882-1-alexandre.belloni@bootlin.com>
 <2261eadf98584d13a490f2abd8777d4a@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2261eadf98584d13a490f2abd8777d4a@AcuMS.aculab.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 06/09/2019 09:05:36+0000, David Laight wrote:
> From: Alexandre Belloni
> > Implement .get_multiple and .set_multiple to allow reading or setting
> > multiple pins simultaneously. Pins in the same bank will all be switched at
> > the same time, improving synchronization and performances.
> 
> Actually it won't 'improve synchronisation', instead it will lead to
> random synchronisation errors and potential metastability if one
> pin is used as a clock and another as data, or if the code is reading
> a free-flowing counter.
> 

It does improve gpio switching synchronisation when they are in the same
bank as it will remove the 250ns delay. Of course, if you need this
delay between clk and data, then the consumer driver should ensure the
delay is present.

> It will improve performance though.
> 
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
