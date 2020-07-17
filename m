Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC6A6223DDB
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 16:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726344AbgGQONx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 10:13:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:58986 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726090AbgGQONx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Jul 2020 10:13:53 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3E2B320717;
        Fri, 17 Jul 2020 14:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594995233;
        bh=0vXgDBDYlt7UxEihc32ZQjGeglsTllhEDcIkY6n/ZfU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wx38iT7WUFuCSbU+kkpm7v/fkfnbQy9OpadwXgeeR+ZAOQDbAwSWuF7abbH45xRKF
         gwXVFLOSvsGMkiY6lmwN67BZwbIjM/0Vc+NgIrk/pE947gZ4fiOyziNQ0i7MJwhayh
         iHVGoKwMXHE+W+/IMFfmncxN0GPDEy95J9Fnk118=
Date:   Fri, 17 Jul 2020 16:13:44 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>,
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
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 1/3] gpio: mxc: Support module build
Message-ID: <20200717141344.GA2992942@kroah.com>
References: <CACRpkdYP4J+MZjxWUnkM-XGaMmFFZfMCfY13r7G6r2=v3F6zQw@mail.gmail.com>
 <DB3PR0402MB39168FEA9306CBF90A596E31F5630@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <DB3PR0402MB3916FB27846F462C2210C3BFF57E0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CACRpkda2gdu8FsSM0MC6g8C1mebmVc5dFWJZwNvQUPXNi5bnkQ@mail.gmail.com>
 <DB3PR0402MB39167A4BB808A0679257DEF9F57F0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CACRpkdbCVZaHqijqMck+jLAJuCAT31HA=9wwcV_EnQc=hsXLwg@mail.gmail.com>
 <20200717121436.GA2953399@kroah.com>
 <CAMuHMdWdaQ_jK1T_ErJ36pJbUUS3SFBcqQmyvtufaKha2C76Gg@mail.gmail.com>
 <20200717132101.GA2984939@kroah.com>
 <CAK8P3a3fwwx-2gQTXZ9dbko+DuLELGm=nKrYFXfwcJJOf0Xz5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a3fwwx-2gQTXZ9dbko+DuLELGm=nKrYFXfwcJJOf0Xz5g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 17, 2020 at 03:54:49PM +0200, Arnd Bergmann wrote:
> > And look at the driver core work for many driver subsystems to be fixed
> > up just to get a single kernel image to work on multiple platforms.
> > Just because older ones did it, doesn't mean it actually works today :)
> 
> Can you give a specific example? The only problem I'm aware of for
> those SoCs is drivers being outside of the mainline kernel. Clearly
> having support for loadable modules helps SoC vendors because it
> allows them to support a new platform with an existing binary kernel
> by shipping third-party driver modules, but for stuff that is already
> in mainline, we could in theory support all hardware in a single gigantic
> binary kernel with no support for loadable modules at all.

That did not work for many drivers for some reason, look at all the work
Saravana had to do in the driver core and device tree code for it to
happen correctly over the past year.

thanks,

greg k-h
