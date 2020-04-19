Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD071AFC79
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Apr 2020 19:10:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726022AbgDSRK3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 19 Apr 2020 13:10:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726116AbgDSRK3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 19 Apr 2020 13:10:29 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4CA2C061A0F
        for <linux-gpio@vger.kernel.org>; Sun, 19 Apr 2020 10:10:28 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1jQDSP-0006Do-2m; Sun, 19 Apr 2020 19:10:13 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1jQDSM-00007s-Ga; Sun, 19 Apr 2020 19:10:10 +0200
Date:   Sun, 19 Apr 2020 19:10:10 +0200
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, geert+renesas@glider.be,
        thierry.reding@gmail.com, jonathanh@nvidia.com, jun.nie@linaro.org,
        stephan@gerhold.net, linux-gpio@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] pinctrl: fix several typos
Message-ID: <20200419171010.sxat34iapakdsqpj@pengutronix.de>
References: <20200419164956.3484-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200419164956.3484-1-zhengdejin5@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

On Mon, Apr 20, 2020 at 12:49:56AM +0800, Dejin Zheng wrote:
> use codespell to fix lots of typos over frontends.
> 
> CC: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> ---
>  drivers/pinctrl/freescale/pinctrl-imx1-core.c    | 2 +-
>  drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c | 2 +-
>  drivers/pinctrl/pinctrl-lantiq.c                 | 2 +-
>  drivers/pinctrl/pinctrl-sx150x.c                 | 2 +-
>  drivers/pinctrl/sh-pfc/pfc-sh7269.c              | 2 +-
>  drivers/pinctrl/tegra/pinctrl-tegra-xusb.c       | 2 +-
>  drivers/pinctrl/zte/pinctrl-zx.c                 | 2 +-
>  7 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
> index c00d0022d311..ec0b1a273f7b 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
> @@ -60,7 +60,7 @@ struct imx1_pinctrl {
>  
>  /*
>   * IMX1 IOMUXC manages the pins based on ports. Each port has 32 pins. IOMUX
> - * control register are seperated into function, output configuration, input
> + * control register are separated into function, output configuration, input

Either s/register/registers/ or s/are/is/


>   * configuration A, input configuration B, GPIO in use and data direction.
>   *

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
