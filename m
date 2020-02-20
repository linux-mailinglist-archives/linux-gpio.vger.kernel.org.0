Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 613A0166619
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2020 19:19:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728480AbgBTSTT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Feb 2020 13:19:19 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:35700 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727553AbgBTSTT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Feb 2020 13:19:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=1KiLvVtdTJR08lV/a34E5gQuMJ2KUL9LQ6F89vXsum0=; b=zp9UMwZdckhNFcCl8erkEJXK9
        5tIcna2TJdIQFd8JU2hRRsOEpFKGz1GqKM3w270neVuhiPBlCj1GWZWMo2nTIrv93zEEJx9mc1ttu
        uX8XzuYd0PLXSF3hLiVSnkwIxGPcn3xSb16zAi6rB/oeotzKathridIKV8n97g1XVePisctZn1T4e
        sFQxPBEo1xZUZzmNgGDUfSAcWtQv1jGefwoAgkq2JYfy+Xh5EBzaXtOnW7cLbQDSzYwWn/tOHjai4
        y9egWVNm5mfDx9Q9E/xinXsAbyY/5iYRuU/QNxuUJm0UsP2whRIwz8+moZn21m/SDqiPYBomi140F
        y3fiTvylw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54628)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1j4qPq-0004se-4M; Thu, 20 Feb 2020 18:19:14 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1j4qPo-0002jJ-1o; Thu, 20 Feb 2020 18:19:12 +0000
Date:   Thu, 20 Feb 2020 18:19:12 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [REGRESSION] gpio hogging fails with pinctrl gpio drivers
Message-ID: <20200220181911.GD25745@shell.armlinux.org.uk>
References: <20200206173247.GX25745@shell.armlinux.org.uk>
 <CACRpkdbzjBnaeXJg3XvZ6G2FdtQQa0u7MPy9bgN-uo-F1vSpbQ@mail.gmail.com>
 <CAHQ1cqFeMKrb-MxnifVJXfGciQH8wsjS1dSSeTTc0R06jLT+Cw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHQ1cqFeMKrb-MxnifVJXfGciQH8wsjS1dSSeTTc0R06jLT+Cw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 20, 2020 at 09:28:14AM -0800, Andrey Smirnov wrote:
> On Thu, Feb 20, 2020 at 12:18 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > On Thu, Feb 6, 2020 at 6:33 PM Russell King - ARM Linux admin
> > <linux@armlinux.org.uk> wrote:
> >
> > > It seems that sometime between 4.20 and 5.5, something has broken the
> > > ability to specify gpio-hogs in DT for GPIOs that are written around
> > > pinctrl drivers.
> > (explanation that makes perfect sense)
> > > Consequently, adding a gpio-hog to DT for this driver results in the
> > > driver endlessly returning -EPROBE_DEFER.
> >
> > I suspect this is sx150x-specific and suspect these two commits:
> >
> > 1a1d39e1b8dd pinctrl: sx150x: Register pinctrl before adding the gpiochip
> > b930151e5b55 pinctrl: sx150x: Add a static gpio/pinctrl pin range mapping
> >
> > I suppose people weren't using hogs very much with the sx150x and
> > it didn't turn up in testing so far.
> >
> > I don't think for example pinctrl-stmfx.c has this problem, as it registers
> > the pin ranges from the device tree as part of the core code.
> > But other drivers calling gpiochip_add_pin_range() may be experiencing
> > this.
> >
> > Peter/Andrey, do you have some idea? Have you tested this usecase (hogs)
> > with the sx150x?
> >
> 
> Haven't done any GPIO hogging on sx150x, unfortunately. My use-cases were:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/vf610-zii-dev-rev-c.dts
> 
> and
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/vf610-zii-scu4-aib.dts
> 
> which didn't have any hogs so far (there's a chance Russell is using
> the former for his experiments, so maybe that'll change). I don't any
> useful input on this regression, sorry. I do have Rev C. board readily
> available, so I can provide Tested-by's if I am CC'd on fixes.

The ZII dev rev C is where I had the hog as a means of kicking the
88x3310 PHY out of reset.

I've now converted it to a proper MDIO bus-level reset, so I no
longer have the hog, and I no longer care about the regression - but
that's not to say it shouldn't be fixed, as the code is wrong.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
