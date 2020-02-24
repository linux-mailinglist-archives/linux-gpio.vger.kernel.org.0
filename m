Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD1DA169F37
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2020 08:28:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727193AbgBXH21 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Feb 2020 02:28:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:43402 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726216AbgBXH21 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 24 Feb 2020 02:28:27 -0500
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8670E20578;
        Mon, 24 Feb 2020 07:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582529306;
        bh=UT7o8ME45O3oydZx0f3nD0anAxSyiu7DWY6wmBELUBA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=j04XlkcVj7zGetH++iayWjjYxOZJ6TuagInHORm/L8ezdhWhwK5tvleP8j9hg4NaN
         ODgGM+9xSSijf9ZYzpMasj1Mghc6fCfUOAcNZIYwnAo9rbo+F1wPt5Du+AGf9bwXEH
         V9yAmS3gstkQ+TP2/Tjrk/FD28w6IhK6QA/eG/Fs=
Date:   Mon, 24 Feb 2020 15:28:17 +0800
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
Subject: Re: [PATCH v2 3/8] firmware: imx: misc: Align imx sc msg structs to 4
Message-ID: <20200224072816.GT27688@dragon>
References: <cover.1582216144.git.leonard.crestez@nxp.com>
 <582b80361beb66bd1844fda785aac2e800155d64.1582216144.git.leonard.crestez@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <582b80361beb66bd1844fda785aac2e800155d64.1582216144.git.leonard.crestez@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 20, 2020 at 06:29:34PM +0200, Leonard Crestez wrote:
> The imx SC api strongly assumes that messages are composed out of
> 4-bytes words but some of our message structs have odd sizeofs.
> 
> This produces many oopses with CONFIG_KASAN=y:
> 
>     BUG: KASAN: stack-out-of-bounds in imx_mu_send_data+0x108/0x1f0
> 
> It shouldn't cause an issues in normal use because these structs are
> always allocated on the stack.
> 
> Fixes: 15e1f2bc8b3b ("firmware: imx: add misc svc support")
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>

Applied, thanks.
