Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 875743D3BA5
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 16:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235274AbhGWNaE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 09:30:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235094AbhGWNaE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jul 2021 09:30:04 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB26FC061575
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 07:10:37 -0700 (PDT)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <a.fatoum@pengutronix.de>)
        id 1m6vso-0008EK-EL; Fri, 23 Jul 2021 16:10:34 +0200
Subject: Re: [Linux-stm32] [PATCH 5/7] ARM: dts: stm32: add STM32MP13 SoCs
 support
To:     Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Linus Walleij <linus.walleij@linaro.org>, arnd@arndb.de,
        Olof Johansson <olof@lixom.net>, robh+dt@kernel.org,
        Russell King <linux@armlinux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20210723132810.25728-1-alexandre.torgue@foss.st.com>
 <20210723132810.25728-6-alexandre.torgue@foss.st.com>
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <048b94a6-438d-d2ee-0d93-67541c962076@pengutronix.de>
Date:   Fri, 23 Jul 2021 16:10:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723132810.25728-6-alexandre.torgue@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Alex,

On 23.07.21 15:28, Alexandre Torgue wrote:
> Add initial support of STM32MP13 family. The STM32MP13 SoC diversity is
> composed by:
> -STM32MP131:
>   -core: 1*CA7, 17*TIMERS, 5*LPTIMERS, DMA/MDMA/DMAMUX
>   -storage: 3*SDMCC, 1*QSPI, FMC
>   -com: USB (OHCI/EHCI, OTG), 5*I2C, 5*SPI/I2S, 8*U(S)ART
>   -audio: 2*SAI
>   -network: 1*ETH(GMAC)
> -STM32MP133: STM32MP131 + 2*CAN, ETH2(GMAC), ADC1
> -STM32MP135: STM32MP133 + DCMIPP, LTDC
> 
> A second diversity layer exists for security features:
> -STM32MP13xY, "Y" gives information:
>  -Y = A/D means no cryp IP and no secure boot.
>  -Y = C/F means cryp IP + secure boot.
> 
> This commit adds basic peripheral.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 
> diff --git a/arch/arm/boot/dts/stm32mp131.dtsi b/arch/arm/boot/dts/stm32mp131.dtsi
> new file mode 100644
> index 000000000000..86126dc0d898
> --- /dev/null
> +++ b/arch/arm/boot/dts/stm32mp131.dtsi
> @@ -0,0 +1,283 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (C) STMicroelectronics 2021 - All Rights Reserved
> + * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
> + */
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {

Could you add aliases for mmc0-2?
That way /dev/mmcblk* numbering is fixed from the start and
doesn't depend on which devices are enabled.

Cheers,
Ahmad

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
