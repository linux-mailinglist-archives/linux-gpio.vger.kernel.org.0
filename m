Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73D131CC0F8
	for <lists+linux-gpio@lfdr.de>; Sat,  9 May 2020 13:28:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728463AbgEIL1i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 9 May 2020 07:27:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727980AbgEIL1i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 9 May 2020 07:27:38 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1892C061A0C;
        Sat,  9 May 2020 04:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=YUdChrOZQNPx7l/p1mjJOCHERADDlB8MQg4GwZPVIJI=; b=Oc4KF42B3UBTaTTeKm0O8iDlY
        BxrB2iSGe8nhReKz/aLMlNyR+IkQ8zQ6tXmmjSOdlqrONefjvAO1GQRKzZptDBMtJS8uLaTVrkjQQ
        NnaIKY+vcVZRs5gAT1XtUOxskcn9GThB54Xf1MOHeyw1AFkMyyucZYIfJQNHKq8XjetID6psBur7s
        ulKyC98yB8Au9WlSlDmgmckLzEj+H4vLxHIUQRdkUyLs7giCsXydRFzs8YHMeYsgpaAx9oUJ7c7Af
        6PiNdckPz1KifuC2ivsulw/9Ik0YTZXPR/+QfSdkadBizG/ozlmrg8RmdlNLhrQaglDXtpgJIL0Nn
        S7mKGKy5g==;
Received: from shell.armlinux.org.uk ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:37982)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jXNdg-0003eW-Au; Sat, 09 May 2020 12:27:28 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jXNdd-0002nq-Vf; Sat, 09 May 2020 12:27:26 +0100
Date:   Sat, 9 May 2020 12:27:25 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Hui Song <hui.song_1@nxp.com>
Cc:     jagdish.gediya@nxp.com, priyanka.jain@nxp.com,
        pramod.kumar_1@nxp.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 1/3] gpio: mpc8xxx: support fsl-layerscape platform.
Message-ID: <20200509112725.GA1551@shell.armlinux.org.uk>
References: <20200509103537.22865-1-hui.song_1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200509103537.22865-1-hui.song_1@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, May 09, 2020 at 06:35:35PM +0800, Hui Song wrote:
> From: "hui.song" <hui.song_1@nxp.com>
> 
> Make the MPC8XXX gpio driver to support the fsl-layerscape.
> 
> Signed-off-by: hui.song <hui.song_1@nxp.com>
> ---
>  drivers/gpio/mpc8xxx_gpio.c | 59 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)

What project are these for?  There is no such file in the kernel tree.

I think you've sent these patches to the wrong people and mailing lists.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 10.2Mbps down 587kbps up
