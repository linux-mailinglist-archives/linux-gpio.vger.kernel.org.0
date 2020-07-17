Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DCCB223C47
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 15:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbgGQNVM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 09:21:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:47942 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726090AbgGQNVL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Jul 2020 09:21:11 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9DD8F2064B;
        Fri, 17 Jul 2020 13:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594992071;
        bh=7S1J9y8itEN5wvEhbpYW+BZkO1zoG1KjirrP9G0+mZY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yQngermH9mwpKC/FUGsAks4v6MfDXijifC+rDmR27Bt6uhDtFOYjJ2KSY5xs7PeLr
         RfxRmMNyPT6WW1A8tPdegeS76iTpyS6LyOD1PJPCiz7Jnu+WKTl78eVBCrY3ZKe49Z
         0DU/8yLX/miSAt6IDhdsQd3CEUqZzadR49zfo1Nw=
Date:   Fri, 17 Jul 2020 15:21:01 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Anson Huang <anson.huang@nxp.com>,
        John Stultz <john.stultz@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "oleksandr.suvorov@toradex.com" <oleksandr.suvorov@toradex.com>,
        Adam Ford <aford173@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Leo Li <leoyang.li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Jon Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 1/3] gpio: mxc: Support module build
Message-ID: <20200717132101.GA2984939@kroah.com>
References: <1594164323-14920-1-git-send-email-Anson.Huang@nxp.com>
 <CACRpkdYP4J+MZjxWUnkM-XGaMmFFZfMCfY13r7G6r2=v3F6zQw@mail.gmail.com>
 <DB3PR0402MB39168FEA9306CBF90A596E31F5630@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <DB3PR0402MB3916FB27846F462C2210C3BFF57E0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CACRpkda2gdu8FsSM0MC6g8C1mebmVc5dFWJZwNvQUPXNi5bnkQ@mail.gmail.com>
 <DB3PR0402MB39167A4BB808A0679257DEF9F57F0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CACRpkdbCVZaHqijqMck+jLAJuCAT31HA=9wwcV_EnQc=hsXLwg@mail.gmail.com>
 <20200717121436.GA2953399@kroah.com>
 <CAMuHMdWdaQ_jK1T_ErJ36pJbUUS3SFBcqQmyvtufaKha2C76Gg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWdaQ_jK1T_ErJ36pJbUUS3SFBcqQmyvtufaKha2C76Gg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 17, 2020 at 02:27:43PM +0200, Geert Uytterhoeven wrote:
> Hi Greg,
> 
> On Fri, Jul 17, 2020 at 2:14 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > Android is just finally pushing vendors to get their code upstream,
> > which is a good thing to see.  And building things as a module is an
> > even better thing as now it is finally allowing arm64 systems to be
> > built to support more than one specific hardware platform at runtime.
> 
> Can you please stop spreading this FUD?

For many many SoCs today, this is not true.  Their drivers are required
to be built in and will not work as modules, as we are seeing the
patches try to fix.

> As I said before, Arm64 kernels have supported more than one specific
> hardware platform at runtime from the beginning of the arm64 port
> (assumed the needed platform support has been enabled in the kernel
>  config, of course).
> Even most arm32 kernels support this, since the introduction of the
> CONFIG_ARCH_MULTIPLATFORM option.  In fact every recently
> introduced arm32 platform is usually v7, and must conform to this.
> The sole exceptions are very old platforms, and the v4/v5/v6/v7 split
> due to architectural issues (the latter still support clusters of
> platforms in a single kernel).

I think the confusion here is that this really does not work well, if at
all, on most "high end" SoC chips due to the collection of different
things all of the vendors ship to their customers.  This is the work
that is trying to be fixed up here.

And look at the driver core work for many driver subsystems to be fixed
up just to get a single kernel image to work on multiple platforms.
Just because older ones did it, doesn't mean it actually works today :)

thanks,

greg k-h
