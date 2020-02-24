Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93AE5169F21
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2020 08:23:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727185AbgBXHXu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Feb 2020 02:23:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:37032 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726452AbgBXHXu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 24 Feb 2020 02:23:50 -0500
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 67C7420578;
        Mon, 24 Feb 2020 07:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582529030;
        bh=o0jeyadt12zgAsbuQin5BGy34nmDODXNaFHsP/wsmN0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=B30hbfpMvPLhoBfzPQASet/MSSsjARo+qHFxRHniBRloC+LIWJCDxrh8Y8Z71eNAP
         3RsBI//5m/MztiryJmeushxDbfju2Vtfl+FfbFsGJ6IZPwb1unwK3nk7LgZ2z0zgSC
         2ZL5z9ExZFTdgN6U38mYcQ9aD/4xLkhhHjkQwXjs=
Date:   Mon, 24 Feb 2020 15:23:41 +0800
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
Subject: Re: [PATCH v2 2/8] clk: imx: Align imx sc clock parent msg structs
 to 4
Message-ID: <20200224072340.GS27688@dragon>
References: <cover.1582216144.git.leonard.crestez@nxp.com>
 <aad021e432b3062c142973d09b766656eec18fde.1582216144.git.leonard.crestez@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aad021e432b3062c142973d09b766656eec18fde.1582216144.git.leonard.crestez@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 20, 2020 at 06:29:33PM +0200, Leonard Crestez wrote:
> The imx SC api strongly assumes that messages are composed out of
> 4-bytes words but some of our message structs have odd sizeofs.
> 
> This produces many oopses with CONFIG_KASAN=y.
> 
> Fix by marking with __aligned(4).
> 
> Fixes: 666aed2d13ee ("clk: imx: scu: add set parent support")
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>

Applied, thanks.
