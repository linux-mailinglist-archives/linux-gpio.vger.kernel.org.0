Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32384169F3A
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2020 08:28:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726216AbgBXH2r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Feb 2020 02:28:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:43656 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725792AbgBXH2r (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 24 Feb 2020 02:28:47 -0500
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D20C120578;
        Mon, 24 Feb 2020 07:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582529326;
        bh=J6d4/zQ5bokX/jh/q9nTSIwMW4JfTe9fU6cuuaY23cg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=07M6sgQeO+jrmTc2UQUXKvxaz4sx2Kyf2yM0DVDS6/pCs+YBq3lFcVvTmGT2VVfmx
         Lp1QIiWp5RsUhOcqipXCfV74BpQvMfLf9j0hXSr8BfTkGl9bsu4dbNvmu/CpD1APNA
         /AyXbNMSEiXjK9kzNNdv3BTFC9mizsSlATiycpPc=
Date:   Mon, 24 Feb 2020 15:28:38 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Leonard Crestez <leonard.crestez@nxp.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Anson Huang <anson.huang@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        Franck LENORMAND <franck.lenormand@nxp.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 4/8] firmware: imx: scu-pd: Align imx sc msg structs
 to 4
Message-ID: <20200224072837.GU27688@dragon>
References: <cover.1582216144.git.leonard.crestez@nxp.com>
 <23b7eb459829d088fb4da188aa8063c2011fc2ac.1582216144.git.leonard.crestez@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23b7eb459829d088fb4da188aa8063c2011fc2ac.1582216144.git.leonard.crestez@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 20, 2020 at 06:29:35PM +0200, Leonard Crestez wrote:
> The imx SC api strongly assumes that messages are composed out of
> 4-bytes words but some of our message structs have odd sizeofs.
> 
> This produces many oopses with CONFIG_KASAN=y.
> 
> Fix by marking with __aligned(4).
> 
> Fixes: c800cd7824bd ("firmware: imx: add SCU power domain driver")
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>

Applied, thanks.
