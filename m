Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D8E8AF91C
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 11:39:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727289AbfIKJj1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 05:39:27 -0400
Received: from pandora.armlinux.org.uk ([78.32.30.218]:56436 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726657AbfIKJj1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 05:39:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=qH4aLi8vNU39JraY+mjqNDssJCjJu1mgK8p4TLwqn00=; b=uCZyJThrDP5rjKd/qs2xLpGwe
        9yvVGxNsyY0RQ83xsZXFZT/qjQUbZpp7P4CwojrxlXGV//jGMU6Z8RnYDeEgB4h3WIHRAKBJdJMpW
        JF3w6dvN+84fIAtnmdMwc7sWqPD2/t+zNaNPV2gatjWVEh7bQbbsU1c8KDg8k8VoPHOVwbRYJXu09
        ZXnDLhRbcQY6FbqVN4eg4OBbaZGFwYkGY4HYK5yf4RrhZPSwPJq9VpMN+sT+lW3YFOJktRaaWAntb
        jvXzijNKeiEh8lBEQCE1VqfwvVxxF92UCQ/4i91/Rsj8TL1zQV+MdjYdHd7gGFTMj5MhT85DCeVsl
        6q9TwrtrQ==;
Received: from shell.armlinux.org.uk ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:38164)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1i7z5p-0005VM-K5; Wed, 11 Sep 2019 10:39:17 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1i7z5m-0003qS-QY; Wed, 11 Sep 2019 10:39:14 +0100
Date:   Wed, 11 Sep 2019 10:39:14 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Andrew Lunn <andrew@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org
Subject: Re: [PATCH 04/11] net: phylink: switch to using
 fwnode_gpiod_get_index()
Message-ID: <20190911093914.GT13294@shell.armlinux.org.uk>
References: <20190911075215.78047-1-dmitry.torokhov@gmail.com>
 <20190911075215.78047-5-dmitry.torokhov@gmail.com>
 <20190911092514.GM2680@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190911092514.GM2680@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 11, 2019 at 12:25:14PM +0300, Andy Shevchenko wrote:
> On Wed, Sep 11, 2019 at 12:52:08AM -0700, Dmitry Torokhov wrote:
> > Instead of fwnode_get_named_gpiod() that I plan to hide away, let's use
> > the new fwnode_gpiod_get_index() that mimics gpiod_get_index(), bit
> > works with arbitrary firmware node.
> 
> I'm wondering if it's possible to step forward and replace
> fwnode_get_gpiod_index by gpiod_get() / gpiod_get_index() here and
> in other cases in this series.

No, those require a struct device, but we have none.  There are network
drivers where there is a struct device for the network complex, but only
DT nodes for the individual network interfaces.  So no, gpiod_* really
doesn't work.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
