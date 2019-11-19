Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23CA610215D
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2019 10:58:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726000AbfKSJ57 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Nov 2019 04:57:59 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:48996 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725280AbfKSJ57 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2019 04:57:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=gZElBFP+ZpH77PfQXR56bEvjt6aoOvjVgweRa6xnEqM=; b=JTI0qAU20VpGo/fITm907fTqS
        TZ52bT2HAr949tARrT+hadXSfUWbZAb+Tu46W7mFWDVijXLEZ6+POf6rXOnay9iUPwhxx6DDANLdc
        On7PMrFnFnkjABHsiv8M8HENcH4iSGyS42/i+/epbkuPDJoeCK/8hpwPK4tCKM1S2B1LRY2vBkt0K
        AIRVsSplF3l0W/B7eEWA9/Vos00yB4ASzAV74ki6deetynL6YobtEpOd1NFAtWrWeOkOLhW8R3O1O
        D2pAN7n9hF64PgKK/KTwcilclE9BKJI1DV7cXhpFJWUwWVpbR2wdE9FEo19asR5FkZIoV64fA8//A
        htRzD9IJw==;
Received: from shell.armlinux.org.uk ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:37516)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1iX0Ge-0000UC-Bm; Tue, 19 Nov 2019 09:57:52 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1iX0Ga-0000ch-Hs; Tue, 19 Nov 2019 09:57:48 +0000
Date:   Tue, 19 Nov 2019 09:57:48 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     GPIO <linux-gpio@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Using a GPIO as an interrupt line
Message-ID: <20191119095748.GX25745@shell.armlinux.org.uk>
References: <f0d383f3-8efa-ae68-62af-68f69cd4143f@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0d383f3-8efa-ae68-62af-68f69cd4143f@free.fr>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 19, 2019 at 10:28:15AM +0100, Marc Gonzalez wrote:
> Hello,
> 
> The board I'm working on provides a TCA9539 I/O expander.
> Or, as the datasheet(*) calls it, a "Low Voltage 16-Bit I2C and
> SMBus Low-Power I/O Expander with Interrupt Output, Reset Pin,
> and Configuration Registers"
> 
> (*) http://www.ti.com/lit/ds/symlink/tca9539.pdf
> 
> The binding is documented in Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
> 
> I have some doubts about the interrupt output, described as:
> 
> Optional properties:
>  - interrupts: interrupt specifier for the device's interrupt output.
> 
> In my board's DT, the I/O expander is described as:
> 
> 	exp1: gpio@74 {
> 		compatible = "ti,tca9539";
> 		reg = <0x74>;
> 		gpio-controller;
> 		#gpio-cells = <2>;
> 		reset-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
> 		pinctrl-names = "default";
> 		pinctrl-0 = <&top_exp_rst>;
> 		interrupt-parent = <&tlmm>;
> 		interrupts = <42 IRQ_TYPE_LEVEL_HIGH>;

This specifies an interrupt signal, number 42, on the tlmm interrupt
controller. It isn't a GPIO specification. Not every interrupt is a
GPIO, and some SoCs can have dedicated interrupt pins that are
exactly that.

Hence, needlessly limiting an external device to requiring a GPIO for
its interrupt is detrimental.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
