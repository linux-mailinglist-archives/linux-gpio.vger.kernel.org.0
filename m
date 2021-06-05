Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 816E439C7AE
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Jun 2021 13:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbhFELJg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Jun 2021 07:09:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbhFELJg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Jun 2021 07:09:36 -0400
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 403A2C061767
        for <linux-gpio@vger.kernel.org>; Sat,  5 Jun 2021 04:07:48 -0700 (PDT)
Received: from [IPv6:2a02:a03f:eafb:ee01:578f:7526:5a0:96d5] (unknown [IPv6:2a02:a03f:eafb:ee01:578f:7526:5a0:96d5])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 4411A20907C;
        Sat,  5 Jun 2021 13:07:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1622891266;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UFmqQDr1GHxA/eAjSwi6GL9nIZuMpYiXeJXZ70OTXsk=;
        b=55gawZN8Lm9MfXTMFG5Gc8TsY44sUdRvZ351PiFdgxZ/gs2TvofEsqFOHXLm7gt1sdD9+G
        tnXtlKDpv5LiAvAB9p/m6HSJ+OeI7mHzYozRPSHastEb84xtvB8eu5Cq8hGZ329hkWYchN
        MHOiGluIBMkzuU+J8mGh4Uj3QeIuP60N0KZi9LZ9duYsvQWuiSwo4L2WmMoGBnfsPH7CxN
        QYwZF7e+kxigdWZAdrTkgqRPRcwMfuLsj3puSB3B674NtpDWdW9ufEyHUbNZu3aE/OpTcp
        TE6xAJJmKGP95Wp0qe2Xd06UWMIE0HRllzfrzI1b4ioLWsOMCuORpSfJdMoQFw==
Message-ID: <76c058318f5c5d984ade4f65bb359e686836b0b4.camel@svanheule.net>
Subject: Re: [PATCH v4 3/5] mfd: Add RTL8231 core device
From:   Sander Vanheule <sander@svanheule.net>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>
Date:   Sat, 05 Jun 2021 13:07:44 +0200
In-Reply-To: <CAHp75VeLUufwYagvQ2M+VKsivUzmnHHHQeH4E8-uN2avRWmBag@mail.gmail.com>
References: <cover.1620735871.git.sander@svanheule.net>
         <cover.1622713678.git.sander@svanheule.net>
         <56fb027587fa067a249237ecaf40828cd508cdcc.1622713678.git.sander@svanheule.net>
         <CAHp75VeLUufwYagvQ2M+VKsivUzmnHHHQeH4E8-uN2avRWmBag@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 2021-06-03 at 13:58 +0300, Andy Shevchenko wrote:
> On Thu, Jun 3, 2021 at 1:01 PM Sander Vanheule <sander@svanheule.net> wrote:
> > +static int rtl8231_reg_read(void *context, unsigned int reg, unsigned int
> > *val)
> > +{
> > +       struct mdio_device *mdio_dev = context;
> > +       int ret;
> > +
> > +       ret = mdiobus_read(mdio_dev->bus, mdio_dev->addr,
> > RTL8231_REAL_REG(reg));
> > +
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       *val = ret & 0xffff;
> > +
> > +       return 0;
> > +}
> > +
> > +static int rtl8231_reg_write(void *context, unsigned int reg, unsigned int
> > val)
> > +{
> > +       struct mdio_device *mdio_dev = context;
> > +
> > +       return mdiobus_write(mdio_dev->bus, mdio_dev->addr,
> > RTL8231_REAL_REG(reg), val);
> > +}
> 
> Hmm... Maybe we can amend regmap-mdio to avoid duplication of the
> above? Something like xlate in gpio-regmap or so?

(+Cc Mark for the regmap discussion)

It turns out that I can't use both devm_regmap_init_mdio and the overrides
regmap_config.reg_read/write. This appears to be in contrast to what the
documentation for these two overrides suggest. devm_regmap_init_mdio provides a
bus for the regmap, which causes the overrides to be ignored in regmap.c

Then I tried to use the paging support provided by regmap, by adding the
following config:
   
      static struct regmap_range_cfg rtl8231_reg_ranges[] = {
             {
                     /* Specify an unused register with an empty mask */
                     .selector_reg = 0x1f,
                     .selector_mask = 0x00,
                     .selector_shift = 0,
                     .range_min = 0x00,
                     .range_max = RTL8231_VREG(RTL8231_REG_COUNT - 1),
                     .window_start = 0x00,
                     .window_len = 0x20,
             },
      };


This also doesn't work, because the used _regmap_bus_reg_read/write don't
resolve register pages. The patch below fixes this, but maybe this missing
functionality is intentional, and I should actually implement
regmap_bus.read/write?

----8<----
diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index 0d185ec018a5..20b6a2e0d2e3 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -1881,6 +1881,15 @@ static int _regmap_bus_reg_write(void *context, unsigned
int reg,
                                 unsigned int val)
 {
        struct regmap *map = context;
+       struct regmap_range_node *range;
+       int ret;
+
+       range = _regmap_range_lookup(map, reg);
+       if (range) {
+               ret = _regmap_select_page(map, &reg, range, 1);
+               if (ret != 0)
+                       return ret;
+       }
 
        return map->bus->reg_write(map->bus_context, reg, val);
 }
@@ -2651,6 +2660,15 @@ static int _regmap_bus_reg_read(void *context, unsigned
int reg,
                                unsigned int *val)
 {
        struct regmap *map = context;
+       struct regmap_range_node *range;
+       int ret;
+
+       range = _regmap_range_lookup(map, reg);
+       if (range) {
+               ret = _regmap_select_page(map, &reg, range, 1);
+               if (ret != 0)
+                       return ret;
+       }
 
        return map->bus->reg_read(map->bus_context, reg, val);
 }

--
Best,
Sander

