Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D8F142A6BD
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Oct 2021 16:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237085AbhJLOIi convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Tue, 12 Oct 2021 10:08:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236936AbhJLOIi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Oct 2021 10:08:38 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAC92C06161C
        for <linux-gpio@vger.kernel.org>; Tue, 12 Oct 2021 07:06:36 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1maIQ0-0006DE-Q2; Tue, 12 Oct 2021 16:06:12 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1maIPx-0002gx-Jv; Tue, 12 Oct 2021 16:06:09 +0200
Message-ID: <9446163d07a2ff135965c7bff249f76bd0da5fb8.camel@pengutronix.de>
Subject: Re: [PATCH v1 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Emil Renner Berthing <kernel@esmil.dk>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Drew Fustini <drew@beagleboard.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        linux-kernel@vger.kernel.org
Date:   Tue, 12 Oct 2021 16:06:09 +0200
In-Reply-To: <20211012134027.684712-10-kernel@esmil.dk>
References: <20211012134027.684712-1-kernel@esmil.dk>
         <20211012134027.684712-10-kernel@esmil.dk>
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

Hi Emil,

On Tue, 2021-10-12 at 15:40 +0200, Emil Renner Berthing wrote:
> Add a driver for the StarFive JH7100 reset controller.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> ---
>  MAINTAINERS                           |   7 ++
>  drivers/reset/Kconfig                 |   8 ++
>  drivers/reset/Makefile                |   1 +
>  drivers/reset/reset-starfive-jh7100.c | 164 ++++++++++++++++++++++++++
>  4 files changed, 180 insertions(+)
>  create mode 100644 drivers/reset/reset-starfive-jh7100.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d2b95b96f0ec..f7883377895e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17854,6 +17854,13 @@ F:	Documentation/devicetree/bindings/clock/starfive,jh7100-clkgen.yaml
>  F:	drivers/clk/starfive/clk-starfive-jh7100.c
>  F:	include/dt-bindings/clock/starfive-jh7100.h
>  
> +STARFIVE JH7100 RESET CONTROLLER DRIVER
> +M:	Emil Renner Berthing <kernel@esmil.dk>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
> +F:	drivers/reset/reset-starfive-jh7100.c
> +F:	include/dt-bindings/reset/starfive-jh7100.h
> +
>  STATIC BRANCH/CALL
>  M:	Peter Zijlstra <peterz@infradead.org>
>  M:	Josh Poimboeuf <jpoimboe@redhat.com>
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index be799a5abf8a..8345521744b3 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -92,6 +92,14 @@ config RESET_INTEL_GW
>  	  Say Y to control the reset signals provided by reset controller.
>  	  Otherwise, say N.
>  
> +config RESET_STARFIVE_JH7100
> +	bool "StarFive JH7100 Reset Driver"
> +	depends on SOC_STARFIVE || COMPILE_TEST
> +	depends on OF
> +	default SOC_STARFIVE
> +	help
> +	  This enables the reset controller driver for the StarFive JH7100 SoC.
> +

Please keep these in alphabetical (config symbol name) order.

regards
Philipp
