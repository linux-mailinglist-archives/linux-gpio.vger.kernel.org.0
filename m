Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8042739A2C0
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jun 2021 16:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231443AbhFCOF5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Jun 2021 10:05:57 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:43260 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229967AbhFCOF4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 3 Jun 2021 10:05:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=+F4TYRlKaPioKXq/PeE5dbOcDH3xCZTOmCks5Pjeaeg=; b=o1A+oRPk1Yoi2i1p2TF/mhhyl+
        5w9RjXPqbXxgDyv5484mlhlvNJcMAXhKdQ62NSzaiALuAMCrvp00ZyfXs4A1m3NO+o/iWZwJlVbJp
        mSqirkz8AKpsUrIDX/16Zw8lWeX7boE3PwLAHdU+qw2XGEOghKeUVqBvowXiJytPrp/M=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1lonx1-007d6E-Tn; Thu, 03 Jun 2021 16:03:59 +0200
Date:   Thu, 3 Jun 2021 16:03:59 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Sander Vanheule <sander@svanheule.net>
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
Subject: Re: [PATCH v4 3/5] mfd: Add RTL8231 core device
Message-ID: <YLjhT1zL/6okGP3p@lunn.ch>
References: <cover.1620735871.git.sander@svanheule.net>
 <cover.1622713678.git.sander@svanheule.net>
 <56fb027587fa067a249237ecaf40828cd508cdcc.1622713678.git.sander@svanheule.net>
 <CAHp75VeLUufwYagvQ2M+VKsivUzmnHHHQeH4E8-uN2avRWmBag@mail.gmail.com>
 <acc18a3b1c02b8f89023451d816031e70bec9320.camel@svanheule.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acc18a3b1c02b8f89023451d816031e70bec9320.camel@svanheule.net>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> I wanted to make the masking explicit, but since regmap-mdio currently requires
> a register address width of 5 bit, it could move there.
> 
> Actually, can we safely assume that any MDIO driver implementing clause-22
> access (5-bit register address width) will just ignore higher bits? In that
> case, I could just drop these functions and not even modify regmap-mdio. It
> appears to work for bitbanged MDIO.

How are C45 addresses handled? The API to the MDIO bus driver uses a
register value which is 32 bits in width. Bit 30 indicates the address
is a C45 address, and then you have 21 bits of actual address.
regmap-mdio needs to be generic and support both C22 and C45.

   Andrew
