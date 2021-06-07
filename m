Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79C7639D89A
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jun 2021 11:23:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230203AbhFGJZJ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Mon, 7 Jun 2021 05:25:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbhFGJZI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Jun 2021 05:25:08 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F297AC061766
        for <linux-gpio@vger.kernel.org>; Mon,  7 Jun 2021 02:23:17 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1lqBTX-0005oV-76; Mon, 07 Jun 2021 11:23:15 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1lqBTU-0000Ic-HL; Mon, 07 Jun 2021 11:23:12 +0200
Message-ID: <df76ecd3748a055085fe62f3119eaebc7f2c16bd.camel@pengutronix.de>
Subject: Re: [PATCH v4 4/6] reset: Add Delta TN48M CPLD reset controller
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Robert Marko <robert.marko@sartura.hr>, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, robh+dt@kernel.org,
        lee.jones@linaro.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     luka.perkov@sartura.hr, jmp@epiphyte.org, pmenzel@molgen.mpg.de,
        buczek@molgen.mpg.de
Date:   Mon, 07 Jun 2021 11:23:12 +0200
In-Reply-To: <20210602122439.2084775-4-robert.marko@sartura.hr>
References: <20210602122439.2084775-1-robert.marko@sartura.hr>
         <20210602122439.2084775-4-robert.marko@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Robert,

On Wed, 2021-06-02 at 14:24 +0200, Robert Marko wrote:
> Delta TN48M CPLD exposes resets for the following:
> * 88F7040 SoC
> * 88F6820 SoC
> * 98DX3265 switch MAC-s
> * 88E1680 PHY-s
> * 88E1512 PHY
> * PoE PSE controller
> 
> Controller supports only self clearing resets.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  drivers/reset/Kconfig       |   9 +++
>  drivers/reset/Makefile      |   1 +
>  drivers/reset/reset-tn48m.c | 128 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 138 insertions(+)
>  create mode 100644 drivers/reset/reset-tn48m.c
> 
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 4171c6f76385..14e179cda58c 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -237,6 +237,15 @@ config RESET_TI_SYSCON
>  	  you wish to use the reset framework for such memory-mapped devices,
>  	  say Y here. Otherwise, say N.
>  
> +config RESET_TN48M_CPLD
> +	tristate "Delta Networks TN48M switch CPLD reset controller"
> +	depends on MFD_TN48M_CPLD

Let's make this

	depends on MFD_TN48M_CPLD || COMPILE_TEST
	default MFD_TN48M_CPLD

unless there is a reason not to enable the reset driver by default when
the MFD driver is activated.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
