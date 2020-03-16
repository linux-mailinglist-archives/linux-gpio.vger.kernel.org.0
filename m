Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FDA11860C2
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2020 01:25:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729194AbgCPAZk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 15 Mar 2020 20:25:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:49278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729156AbgCPAZk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 15 Mar 2020 20:25:40 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 09175205ED;
        Mon, 16 Mar 2020 00:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584318339;
        bh=oIh/Sa6m0Gp0EyqnU/CsJD/QSJgd+E76JL1QkHOvR9k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZJcAzHSVaZrvJYM4TA2p2uEOIm1WoujFL/C/rw4vVBtUJ6HBnWyiiD5VbBP3YOf2h
         5vErhIKKbcJSk5eBuywr7xipCIQqdexTZ3GbBBRTBiuKUdJ6uuqMN4Tfiv29LackQW
         TxLwGMLJFnyrtw021IcjH64c4tlvEHgw0cXMwbOA=
Date:   Mon, 16 Mar 2020 08:25:29 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Leonard Crestez <leonard.crestez@nxp.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stefan Agner <stefan@agner.ch>, linux-clk@vger.kernel.org,
        Franck LENORMAND <franck.lenormand@nxp.com>,
        linux-gpio@vger.kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 1/8] clk: imx: Align imx sc clock msg structs to 4
Message-ID: <20200316002527.GA16155@dragon>
References: <cover.1582216144.git.leonard.crestez@nxp.com>
 <10e97a04980d933b2cfecb6b124bf9046b6e4f16.1582216144.git.leonard.crestez@nxp.com>
 <20200224072210.GR27688@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200224072210.GR27688@dragon>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 24, 2020 at 03:22:18PM +0800, Shawn Guo wrote:
> On Thu, Feb 20, 2020 at 06:29:32PM +0200, Leonard Crestez wrote:
> > The imx SC api strongly assumes that messages are composed out of
> > 4-bytes words but some of our message structs have odd sizeofs.
> > 
> > This produces many oopses with CONFIG_KASAN=y.
> > 
> > Fix by marking with __aligned(4).
> > 
> > Fixes: fe37b4820417 ("clk: imx: add scu clock common part")
> > Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
> 
> Applied, thanks.

Patch #1 and #2 were dropped from my clk queue, as Stephen hasn't been
convinced by this change.

Shawn
