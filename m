Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 571C616233B
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 10:18:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgBRJSl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 04:18:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:41174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726186AbgBRJSl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 Feb 2020 04:18:41 -0500
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1331321D7D;
        Tue, 18 Feb 2020 09:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582017520;
        bh=WDLKT1u/eZpoRYcR0EZB25T+ZUURdxqfLJomoJXA9B8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KxQdcdNXE9bbEEapbGIJeH6RMZTaUyfg/N5Fkb7XCzkcHvbvoCuiux3AOFlStTllp
         VdH2Eae5w/YC8wsB+61k+X/nVXRVnnJgMrzdnfD/PkPk/WoVCGW4ebxw1mv6jl00Sg
         BB5FUHHRvBZNYeWhnQvTaqpZg+oMj4uXwVEx61Ys=
Date:   Tue, 18 Feb 2020 17:18:32 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Leonard Crestez <leonard.crestez@nxp.com>
Cc:     Aisheng Dong <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Anson Huang <anson.huang@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        Franck Lenormand <franck.lenormand@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:PIN CONTROLLER - FREESCALE" <linux-gpio@vger.kernel.org>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH] firmware: imx: Align imx SC msg structs to 4
Message-ID: <20200218091831.GB6075@dragon>
References: <3a8b6772a1edffdd7cdb54d6d50030b03ba0bebb.1581455751.git.leonard.crestez@nxp.com>
 <20200217062129.GB6790@dragon>
 <VI1PR04MB7023CDE9E4AD086F2E926495EE160@VI1PR04MB7023.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI1PR04MB7023CDE9E4AD086F2E926495EE160@VI1PR04MB7023.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 17, 2020 at 08:37:45PM +0000, Leonard Crestez wrote:
> On 17.02.2020 08:21, Shawn Guo wrote:
> > On Tue, Feb 11, 2020 at 11:24:33PM +0200, Leonard Crestez wrote:
> >> The imx SC api strongly assumes that messages are composed out of
> >> 4-bytes words but some of our message structs have sizeof "6" and "7".
> >>
> >> This produces many oopses with CONFIG_KASAN=y:
> >>
> >> 	BUG: KASAN: stack-out-of-bounds in imx_mu_send_data+0x108/0x1f0
> >>
> >> It shouldn't cause an issues in normal use because these structs are
> >> always allocated on the stack.
> >>
> >> Cc: stable@vger.kernel.org
> > 
> > Should we have a fixes tag and send it for -rc?
> 
> I haven't check but this would probably have to be split into multiple 
> patches because the structs were not added all at once.

Or maybe we can just drop the stable tag, as it addresses a corner
case issue which could concern very few people?

Shawn
