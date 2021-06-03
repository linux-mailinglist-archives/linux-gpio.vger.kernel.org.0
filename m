Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D66C439A461
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jun 2021 17:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231923AbhFCPWB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Jun 2021 11:22:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231909AbhFCPWA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Jun 2021 11:22:00 -0400
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68389C06174A
        for <linux-gpio@vger.kernel.org>; Thu,  3 Jun 2021 08:20:15 -0700 (PDT)
Received: from [IPv6:2a02:a03f:eafb:ee01:eb34:edf2:c0ff:9e88] (unknown [IPv6:2a02:a03f:eafb:ee01:eb34:edf2:c0ff:9e88])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 4D1C82081DF;
        Thu,  3 Jun 2021 17:20:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1622733613;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=C3soFR1tkb3QWtEaQ45qX8n9gA+coVmmtAY/2wAgXEY=;
        b=0MUMf/C8N2OijrODvrYxGdaBX4Duppo962UNbWKD2iDNM102o2qAjAyfPvnAg63ojfdyFY
        Yc0wK13qZXd8uMYqGOIw33D0OfUJhoqhhn2GwYqy6t28I8R4uKrzY5YSaFLShQMOUQfNEN
        z4BBI3dQlnD0/J58iDfsRczdMCs5zGzO+p21a2as2VKg8CkQiRzz/VlIE5khKCIRE9hZAO
        xKLxDdU3oXHk/r/B6q0lM7MFrg5KQWOSasO1g2QrT9UiLDJ0ozVRKPnxeTreMEfBI+7rAK
        08TWndr2fn4Ku0kTThR2gMVNqPxIYvn+kRj+PHD3ZIkZz29pn2BXQAhfh+u88w==
Message-ID: <983cb8ef005f93b650f3228256babaf7680fc0fc.camel@svanheule.net>
Subject: Re: [PATCH v4 3/5] mfd: Add RTL8231 core device
From:   Sander Vanheule <sander@svanheule.net>
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Thu, 03 Jun 2021 17:20:09 +0200
In-Reply-To: <YLjhT1zL/6okGP3p@lunn.ch>
References: <cover.1620735871.git.sander@svanheule.net>
         <cover.1622713678.git.sander@svanheule.net>
         <56fb027587fa067a249237ecaf40828cd508cdcc.1622713678.git.sander@svanheule.net>
         <CAHp75VeLUufwYagvQ2M+VKsivUzmnHHHQeH4E8-uN2avRWmBag@mail.gmail.com>
         <acc18a3b1c02b8f89023451d816031e70bec9320.camel@svanheule.net>
         <YLjhT1zL/6okGP3p@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 2021-06-03 at 16:03 +0200, Andrew Lunn wrote:
> > I wanted to make the masking explicit, but since regmap-mdio currently
> > requires
> > a register address width of 5 bit, it could move there.
> > 
> > Actually, can we safely assume that any MDIO driver implementing clause-22
> > access (5-bit register address width) will just ignore higher bits? In that
> > case, I could just drop these functions and not even modify regmap-mdio. It
> > appears to work for bitbanged MDIO.
> 
> How are C45 addresses handled? The API to the MDIO bus driver uses a
> register value which is 32 bits in width. Bit 30 indicates the address
> is a C45 address, and then you have 21 bits of actual address.
> regmap-mdio needs to be generic and support both C22 and C45.

Currently regmap-mdio will only accept regmap_config structs where the register
width is 5 bit, but this is not enforced for the reg_read/reg_write functions
and the regnum is passed verbatim to mdiobus_read/mdiobus_write.

So, if I understand correctly:
 * for a regmap configured for C22 access, register addresses should be masked
   with 0x1f to create a C22 regnum
 * for a regmap configured for C45 access, register addresses should be masked
   and formatted with 
   (MII_ADDR_C45 | (mdiodev->addr << MII_DEVADDR_C45_SHIFT) | (reg_addr 0xffff))

I would think that a device that supports both C22 and C45 access, can then just
be set up to have two regmaps. If they can be considered to be independent
register spaces, one regmap for each access type would make sense to me.

I'll cook up a patch for this.

Best,
Sander

