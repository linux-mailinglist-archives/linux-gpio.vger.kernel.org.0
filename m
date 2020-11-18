Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDB4D2B8010
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Nov 2020 16:04:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727006AbgKRPDn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Nov 2020 10:03:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:40716 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726672AbgKRPDn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 18 Nov 2020 10:03:43 -0500
Received: from sekiro (lfbn-mar-1-625-225.w90-118.abo.wanadoo.fr [90.118.2.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6624D24740;
        Wed, 18 Nov 2020 15:03:40 +0000 (UTC)
Date:   Wed, 18 Nov 2020 16:03:36 +0100
From:   Ludovic Desroches <ludovic.desroches@microchip.com>
To:     cristian.birsan@microchip.com
Cc:     alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 0/3] ARM: dts: at91: add pincontrol node for USB Host
Message-ID: <20201118150336.g3u3ljuhrbrn2cko@sekiro>
References: <20201118120019.1257580-1-cristian.birsan@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201118120019.1257580-1-cristian.birsan@microchip.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Cristi,

Adding the gpio list.

On Wed, Nov 18, 2020 at 02:00:16PM +0200, cristian.birsan@microchip.com wrote:
> From: Cristian Birsan <cristian.birsan@microchip.com>
> 
> The pincontrol node is needed for USB Host since Linux v5.7-rc1. Without
> it the driver probes but VBus is not powered because of wrong pincontrol
> configuration. The patch was tested on SAM9x60EK, SAMA5D4-EK and SAMA5D3-EK. 
> 

No problem on my side with this set of patches, it's consistent with what we
have.
Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>

I just want to share the full picture leading to this situation. You told me the
breakage appears after this commit:

commit 2ab73c6d8323fa1eb02c16c07c40ba2ed17da729
Author: Thierry Reding <treding@nvidia.com>
Date:   Thu Mar 19 13:27:29 2020 +0100

    gpio: Support GPIO controllers without pin-ranges

    Wake gpiochip_generic_request() call into the pinctrl helpers only if a
    GPIO controller had any pin-ranges assigned to it. This allows a driver
    to unconditionally use this helper if it supports multiple devices of
    which only a subset have pin-ranges assigned to them.

    Signed-off-by: Thierry Reding <treding@nvidia.com>
    Link: https://lore.kernel.org/r/20200319122737.3063291-2-thierry.reding@gmail.com
    Tested-by: Vidya Sagar <vidyas@nvidia.com>
    Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

We were used to defining pinctrl for all our pins. That is somewhat redundant
when the pin is requested through the gpiolib.

The pinctrl-at91 driver doesn't register any pin range. After this commit, the
gpio_generic_request() fails. The consequence is if we forgot to define the
pinctrl, the pin won't be muxed as a gpio.

At first glance, there is no trivial way to register the pin range in the
pinctrl-at91 driver. There is one driver for the pinctrl and one for the gpio.
I am open to suggestions to fix it in the pinctrl-at91 driver as well if there
is an elegant way (I have some in mind, but there are not) without having to
refactor the driver.

Regards

Ludovic


> Cristian Birsan (3):
>   ARM: dts: sam9x60: add pincontrol for USB Host
>   ARM: dts: at91: sama5d4_xplained: add pincontrol for USB Host
>   ARM: dts: at91: sama5d3_xplained: add pincontrol for USB Host
> 
>  arch/arm/boot/dts/at91-sam9x60ek.dts        | 9 +++++++++
>  arch/arm/boot/dts/at91-sama5d3_xplained.dts | 7 +++++++
>  arch/arm/boot/dts/at91-sama5d4_xplained.dts | 7 +++++++
>  3 files changed, 23 insertions(+)
> 
> -- 
> 2.25.1
> 
