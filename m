Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18F85115691
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Dec 2019 18:33:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbfLFRdu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Dec 2019 12:33:50 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:45844 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726317AbfLFRdu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Dec 2019 12:33:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=I5DvSSUq8kBmzZvYKJavtYFkUBKlP3+nbcIZ+mewhp8=; b=1VwSy8ykjbEMabTB7ELm4Qgpg
        GpcDhQiyMp/9vzKyNtwmiFAntC1d4Heie8TuaYq9avhyZeeNU0qqGaf+p/rw1P0OHKRSqqr5+UkIA
        SMtxLhU9/sYY4+ygfoOz5KAf833aZ26Jt9GZATurl4FR2IXkSrW/DsOsA57a2EQ/K2ynFxbNsN4qm
        EgsAyuYIhe/bgqmREgvhrLrdMys0w+rHERM2Dm5G197Dt6gpBKDC6pynqqlpDh0oHFn0vJFlKtT7V
        LYVpY9ppSnXHkDBM0ozxzL2xusCCw6thn4HE6m3eJ2331DA5qGJrCIU2i5wRy2/9dNC29Bsbx1Z/I
        hMH7R++5Q==;
Received: from shell.armlinux.org.uk ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:45226)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1idHU8-00020S-MW; Fri, 06 Dec 2019 17:33:44 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1idHU7-0000qM-If; Fri, 06 Dec 2019 17:33:43 +0000
Date:   Fri, 6 Dec 2019 17:33:43 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: pinctrl states vs pinmux vs gpio (i2c bus recovery)
Message-ID: <20191206173343.GX25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

There seems to be a problem in pinctrl land when pinctrls interact with
GPIOs.

If, for example, an I2C driver wants to attempt bus recovery, and needs
to use GPIO mode to control the I2C bus pins to do this, then one may
expect code such as found in i2c_imx_init_recovery_info() to work.

However, consider that devm_gpiod_get() may invoke
pinctrl_gpio_request(), which changes the pinmux settings independently
of the pinctrl layer.

The result is that after devm_gpiod_get() has completed, the I2C bus
pins are in GPIO mode.

One may expect:

	pinctrl_select_state(i2c_imx->pinctrl, i2c_imx->pinctrl_pins_default);

to change them back to the default state, but that would be incorrect.
The first thing that pinctrl_select_state() does is check whether

	p->state == state

which it will do, as the pinctrl layer hasn't been informed of the
change that has happened behind its back at the pinmux level.

The result is, one needs to switch the state to gpio mode, and then
back to default to ensure that the pins are muxed back to the I2C
controller while the I2C controller is supposed to be operational.

GPIO mode is only used to recover the bus when a bus hang has happened
due to a slave device holding SDA low - and the only way that can be
recovered is by toggling the SCL signal. If the controller provides no
means to do this other than switching to GPIO mode, the above is
necessary.

I spotted this while trying out this method of i2c bus recovery on a
different I2C controller.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
