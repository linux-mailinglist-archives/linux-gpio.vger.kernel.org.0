Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A7FA1CC3AA
	for <lists+linux-gpio@lfdr.de>; Sat,  9 May 2020 20:26:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727993AbgEIS05 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 9 May 2020 14:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727950AbgEIS04 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 9 May 2020 14:26:56 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D4EDC061A0C;
        Sat,  9 May 2020 11:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=D7pTyze1SsxRJ8ouALBBELONpy4Mt2F8CjcAqQmMGAk=; b=0ZxtxvLwDVo6IiLVe36gQngnK
        MZgq6PkmUJx8lUfuHOf/zyfGz76TXSr5RuWyLAVWwjheV/GfnvRH2HAIM3s3x1KCoS9X9aalR1RXi
        fS26+me4+JVdX0M+CrtZtbIRuQ5ZThyg7znzx3unmXXrAdjFvL/pBzXs3QY+e7XGbCr6ysRjSFY4H
        0AgR7Zl1+5/SgFAz0/+lEDeRQTXHQ2IuEku2qk+HXFcPo39CVu69FkLxTdnzx6MvYzaAyLIpxk34V
        SYyo8aiLruPZ+XUapPBX1pIJiF1v9Y+eRpfx71FgbWP+5lQTwG31/UZjhhwaM5yFPuEaLQDkOyJbA
        EdDaLyeXw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58292)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jXUBV-0004oU-Bg; Sat, 09 May 2020 19:26:49 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jXUBT-00034O-9f; Sat, 09 May 2020 19:26:47 +0100
Date:   Sat, 9 May 2020 19:26:47 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Amit Tomer <amittomer25@gmail.com>
Cc:     Andrew Lunn <andrew@lunn.ch>, Hui Song <hui.song_1@nxp.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, jiafei.pan@nxp.com,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v1 2/3] armv8: gpio: add gpio feature
Message-ID: <20200509182647.GI1551@shell.armlinux.org.uk>
References: <20200509103956.26038-3-hui.song_1@nxp.com>
 <20200509103956.26038-2-hui.song_1@nxp.com>
 <20200509153315.GR208718@lunn.ch>
 <20200509172724.GG1551@shell.armlinux.org.uk>
 <CABHD4K_tPkCherpY5zUtxV1wcKc=7aj3ayr9yxG-sLFZeMf3Dw@mail.gmail.com>
 <20200509181845.GH1551@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200509181845.GH1551@shell.armlinux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, May 09, 2020 at 07:18:45PM +0100, Russell King - ARM Linux admin wrote:
> On Sat, May 09, 2020 at 11:34:59PM +0530, Amit Tomer wrote:
> > > From what I can tell, these patches are not for the kernel.  The
> > > filenames don't match th kernel layout.
> > 
> > These files looks to be from U-boot, and must be intended for U-boot
> > as I see U-boot mailing address in recipient's address?
> 
> So why is it copied to:
> 
> devicetree@vger.kernel.org - a kernel mailing list
> linux-kernel@vger.kernel.org - the main kernel mailing list
> linux-gpio@vger.kernel.org - the gpio driver kernel mailing list
> linux-arm-kernel@lists.infradead.org - the ARM kernel mailing list
> 
> Given that it includes four kernel mailing lists (ok, devicetree
> may be argued to have a wider application), then I don't think the
> conclusion that "it's for u-boot, because there's _one_ u-boot
> mailing list in the recipients" is particularly obvious.
> 
> The author really needs to state that up front if they're sending
> it to a wide audeience, rather than leaving people to guess, thereby
> potentially wasting their time.
> 
> Not only did Andrew review the patch as if it were for the kernel,
> but I also wasted time on this as well when I double-took the
> ifdefs, and wanted to check the current driver in the kernel.

Oh, and... u-boot@linux.nxdi.nxp.com bounces because that domain is
not resolvable - I guess that is internal to NXP, and this patch
should have remained within NXP and not been posted publically.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 10.2Mbps down 587kbps up
