Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C3D7455969
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Nov 2021 11:51:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343560AbhKRKyA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Nov 2021 05:54:00 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:50317 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343499AbhKRKxQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Nov 2021 05:53:16 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id D895E40002;
        Thu, 18 Nov 2021 10:50:13 +0000 (UTC)
Date:   Thu, 18 Nov 2021 11:50:13 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Kavyasree.Kotagiri@microchip.com
Cc:     robh+dt@kernel.org, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com
Subject: Re: [PATCH 2/2] pinctrl: ocelot: Extend support for lan966x
Message-ID: <YZYv5aPqDyFIQibj@piout.net>
References: <20211029092703.18886-1-kavyasree.kotagiri@microchip.com>
 <20211029092703.18886-3-kavyasree.kotagiri@microchip.com>
 <YZWJZzCuzXTVzIJ+@piout.net>
 <CO1PR11MB4865BC4DCB3C0E542EF2D7EA929B9@CO1PR11MB4865.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO1PR11MB4865BC4DCB3C0E542EF2D7EA929B9@CO1PR11MB4865.namprd11.prod.outlook.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 18/11/2021 09:24:56+0000, Kavyasree.Kotagiri@microchip.com wrote:
> > > +      * but it doesn't matter much for now.
> > > +      * Note: ALT0/ALT1/ALT2 are organized specially for 78 gpio targets
> > > +      */
> > > +     regmap_update_bits(info->map, REG_ALT(0, info, pin->pin),
> > > +                        BIT(p), f << p);
> > > +     regmap_update_bits(info->map, REG_ALT(1, info, pin->pin),
> > > +                        BIT(p), (f >> 1) << p);
> > > +     regmap_update_bits(info->map, REG_ALT(2, info, pin->pin),
> > > +                        BIT(p), (f >> 2) << p);
> > > +
> > 
> > I would have thought the hardware would be fixed because you now have 78
> > pins and this probably will get worse over time. This is really a poor
> > choice of interface as now you will get two transient states instead of
> > one.
> > 
> Sorry, I couldn't get you. please elaborate what you meant by this comment?
> 

Not mush you can do on your side, this was just a rant. I raised the
issue to Allan, hoping that this will get fixed in the next SoCs ;)


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
