Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ACC31CC32C
	for <lists+linux-gpio@lfdr.de>; Sat,  9 May 2020 19:27:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727993AbgEIR1l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 9 May 2020 13:27:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727953AbgEIR1l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 9 May 2020 13:27:41 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E20CAC061A0C;
        Sat,  9 May 2020 10:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=eA6zPwUAfsQm1w0Nmrjy4EvhkeArGomb4D8sTfYI5Jw=; b=xfOv35rVdMnTnm7BCEp6i1iyh
        jcn3+drA3NPfXsmhOtc6bzRBpAGWHgT8kI7MEaZEXboVZ610QLsZdYPehF+bRp2FsmdW2CxSev1aM
        YC2+69RqKDmilfvUZJ8DTBnP5J9Mt/T8btEjEpcB3h9vIz4TWpBBNz5F+uWca4jDo0Ltky9cTWbSC
        j2L7bWBwi/Om9bEPBa+NNSuqMujHDspKt2LzjmTrsDs5lRJHHDbUdPgeWyHIIBCGVXz3quhTt0+Q6
        JbxR/uwa9n4EiM/kvI9OILasKYfrEboP8UwYLsop0boLqwNC/jajz+Dw3Ib3brZlWeJwq6bSr3SPx
        9juq4A+mw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58268)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jXTG3-0004dA-Nl; Sat, 09 May 2020 18:27:27 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jXTG0-00031g-UW; Sat, 09 May 2020 18:27:24 +0100
Date:   Sat, 9 May 2020 18:27:24 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Hui Song <hui.song_1@nxp.com>, u-boot@linux.nxdi.nxp.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, jiafei.pan@nxp.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 2/3] armv8: gpio: add gpio feature
Message-ID: <20200509172724.GG1551@shell.armlinux.org.uk>
References: <20200509103956.26038-3-hui.song_1@nxp.com>
 <20200509103956.26038-2-hui.song_1@nxp.com>
 <20200509153315.GR208718@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200509153315.GR208718@lunn.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, May 09, 2020 at 05:33:15PM +0200, Andrew Lunn wrote:
> On Sat, May 09, 2020 at 06:39:55PM +0800, Hui Song wrote:
> > From: "hui.song" <hui.song_1@nxp.com>
> > 
> > add one struct mpc8xxx_gpio_plat to enable gpio feature.
> > 
> > Signed-off-by: hui.song <hui.song_1@nxp.com>
> > ---
> >  .../include/asm/arch-fsl-layerscape/gpio.h    | 22 +++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >  create mode 100644 arch/arm/include/asm/arch-fsl-layerscape/gpio.h
> > 
> > diff --git a/arch/arm/include/asm/arch-fsl-layerscape/gpio.h b/arch/arm/include/asm/arch-fsl-layerscape/gpio.h
> > new file mode 100644
> > index 0000000000..d8dd750a72
> > --- /dev/null
> > +++ b/arch/arm/include/asm/arch-fsl-layerscape/gpio.h
> > @@ -0,0 +1,22 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ */
> > +/*
> > + * Copyright 2014 Freescale Semiconductor, Inc.
> > + */
> > +
> > +/*
> > + * Dummy header file to enable CONFIG_OF_CONTROL.
> > + * If CONFIG_OF_CONTROL is enabled, lib/fdtdec.c is compiled.
> > + * It includes <asm/arch/gpio.h> via <asm/gpio.h>, so those SoCs that enable
> > + * OF_CONTROL must have arch/gpio.h.
> > + */
> 
> This does not seem right. You would expect each sub arch to have a
> subdirectory in arch/arm/include/asm/ when in fact none do.

From what I can tell, these patches are not for the kernel.  The
filenames don't match th kernel layout.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 10.2Mbps down 587kbps up
