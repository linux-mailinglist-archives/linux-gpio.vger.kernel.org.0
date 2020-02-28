Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8462017377C
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2020 13:46:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725892AbgB1Mqj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Feb 2020 07:46:39 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:54746 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725877AbgB1Mqj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Feb 2020 07:46:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=JVrtMDeWVXXWxL67rdqwPaefYVGg/iICAKCv5Rj9fDw=; b=Ga7ZMpkkL1zYiD9JaCcIhXo48
        oMnqwhtyFZx7q8Inua3KNFmUjczkigJCXfLOYJEGqsmR71b0zOYOC4f5QX5XtMEeEgKDZpB1CUHPU
        kX8FkwWWZLaIhUpyxIPC1P4/DsNe+1zIcr4l0KNTM8X+1HhipPktgD0v/ZNicb6CLkYm7yc63fM78
        LTJUsSC43IE6ICizfFnsSczt3v6i40cHBna7+ntxgv02JZWIIZzpmrfzhFMLfZnlFc6nKV9NOeHAl
        9vb3aVjyaFDef0+oXYp6vPS2FtKxIQbZZW6uUE03YRHZN9fxVozgZYDRPJtrSKJE0vvGXHCFT5/mf
        hJ7lw6Nsw==;
Received: from shell.armlinux.org.uk ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:46410)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1j7f2H-0003qi-9w; Fri, 28 Feb 2020 12:46:33 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1j7f2F-0001zo-3L; Fri, 28 Feb 2020 12:46:31 +0000
Date:   Fri, 28 Feb 2020 12:46:31 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Ludovic Desroches <ludovic.desroches@microchip.com>
Cc:     Romain Izard <romain.izard.pro@gmail.com>,
        Linux GPIO List <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: GPIOs not correctly exported via sysfs on ATSAMA5D2
Message-ID: <20200228124630.GU25745@shell.armlinux.org.uk>
References: <CAMiSF3BULWkyWTytTBcFfch9YaV_QzuBiawk-ZqEcQnsuGdUiQ@mail.gmail.com>
 <20200228123910.hbf2bnk3w2dbishr@M43218.corp.atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200228123910.hbf2bnk3w2dbishr@M43218.corp.atmel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 28, 2020 at 01:39:10PM +0100, Ludovic Desroches wrote:
> Hello Romain,
> 
> On Fri, Feb 28, 2020 at 11:58:21AM +0100, Romain Izard wrote:
> > 
> > Hello,
> > 
> > While experimenting with a new chip, I connected it on the SDIO
> > interface on my board based on a SAMA5D2 SoC. For a first step, I need
> > to drive the pins on the SDIO bus at a given level to program this new
> > chip. To do so, I tried to control the GPIO lines manually by unbinding
> > the SDHCI controller, and using /sys/class/gpio/export to control the
> > pins, with the following code:
> > 
> > echo a0000000.sdio-host > /sys/bus/platform/drivers/sdhci-at91/unbind
> > echo 4 > /sys/class/gpio/export
> > echo low > /sys/class/gpio/PA4/direction
> > 
> > Unfortunately, the state of the pin does not change and it remains
> > driven to 1. I checked the configuration register with devmem2, and it
> > appeared that the selected function remains the SDIO function even after
> > calling export.
> > 
> > The issue does not appear when I use a GPIO in a driver with an explicit
> > pinctrl configuration in the device tree, which explains why I did not
> > see it until now.
> > 
> > The kernel version used is Linux 5.4.22
> > 
> > Is this a user error from my part, or is there something missing in the
> > AT91 PIO4 pinctrl driver ?
> 
> This is a known issue.
> 
> The AT91 PIO4 pinctrl driver doesn't implement gpio_request_enable()
> contrary to the AT91 PIO pinctrl driver. If we implement it, then you
> would be able to change the pin muxing and configuration from the sysfs.
> The issue is nothing prevent you do this and so to possibly break a
> device.
> 
> There is the strict pinmux_ops property which prevents from this
> situation. The side effect is that we must not declare a pinmux/conf for
> a GPIO so all the DT files have to been updated. That's not a big deal,
> the problem is, at that time, the GPIO subsystem didn't allow to set the
> bias for instance. It may have changed but not sure it covers all the
> possible configurations we have from the pinmuxing subsystem.

There is also the problem of I2C bus recovery, where an I2C driver
may wish to claim the GPIOs for the I2C bus, but keep the I2C bus
connected to the I2C controller except when performing recovery.

I tripped over problems with that on a Marvell SoC, someone else has
recently reported exactly the same problem as a regression compared
to previous kernels for another SoC in the last day.

The assumption that if a GPIO is claimed, we want the pin to be in
GPIO mode is not universally true, a point that has been missed and
is now coming back to bite.  From what Linus said when we discussed
it, it's very difficult to fix in the GPIO/pinctrl layers.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
