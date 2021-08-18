Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F28083EFFC6
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Aug 2021 11:00:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230253AbhHRJAu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Aug 2021 05:00:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbhHRJAs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Aug 2021 05:00:48 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0600EC0613CF
        for <linux-gpio@vger.kernel.org>; Wed, 18 Aug 2021 02:00:14 -0700 (PDT)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <a.fatoum@pengutronix.de>)
        id 1mGHQc-0002M3-OJ; Wed, 18 Aug 2021 11:00:06 +0200
Subject: Re: [PATCH V3 2/3] dt-bindings: gpio: zynqmp: Add binding
 documentation for modepin
To:     Piyush Mehta <piyush.mehta@xilinx.com>, arnd@arndb.de,
        zou_wei@huawei.com, gregkh@linuxfoundation.org,
        linus.walleij@linaro.org, michal.simek@xilinx.com,
        wendy.liang@xilinx.com, iwamatsu@nigauri.org,
        bgolaszewski@baylibre.com, robh+dt@kernel.org,
        rajan.vaja@xilinx.com
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        git@xilinx.com, sgoud@xilinx.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20210818081018.2620544-1-piyush.mehta@xilinx.com>
 <20210818081018.2620544-3-piyush.mehta@xilinx.com>
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <5e44ee87-f727-99fd-9860-d3d58a035dc4@pengutronix.de>
Date:   Wed, 18 Aug 2021 11:00:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210818081018.2620544-3-piyush.mehta@xilinx.com>
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

On 18.08.21 10:10, Piyush Mehta wrote:
> This patch adds DT binding document for zynqmp modepin GPIO controller.
> Modepin GPIO controller has four GPIO pins which can be configurable
> as input or output.
> 
> Modepin driver is a bridge between the peripheral driver and GPIO pins.
> It has set and get APIs for accessing GPIO pins, based on the device-tree
> entry of reset-gpio property in the peripheral driver, every pin can be
> configured as input/output and trigger GPIO pin.
> 
> For more information please refer zynqMp TRM link:
> Link: https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-ultrascale-trm.pdf
> Chapter 2: Signals, Interfaces, and Pins
> Table 2-2: Clock, Reset, and Configuration Pins - PS_MODE
> 
> Signed-off-by: Piyush Mehta <piyush.mehta@xilinx.com>
> Acked-by: Michal Simek <michal.simek@xilinx.com>
> ---
> Changes in v2:
> - Addressed review comments: Update commit message
> 
> Review Comments:
> https://lore.kernel.org/linux-arm-kernel/20210615080553.2021061-2-piyush.mehta@xilinx.com/T/#mbd1fbda813e33b19397b350bde75747c92a0d7e1
> https://lore.kernel.org/linux-arm-kernel/20210615080553.2021061-2-piyush.mehta@xilinx.com/T/#me82b1444ab3776162cdb0077dfc9256365c7e736
> 
> Changes in v3:
> - Addressed Rob and Michal review comments:
>   - Update DT example. 
> 
> Review Comments:
> https://lore.kernel.org/linux-arm-kernel/YRbBnRS0VosXcZWz@robh.at.kernel.org/
> https://lore.kernel.org/linux-arm-kernel/d71ad7f9-6972-8cc0-6dfb-b5306c9900d0@xilinx.com/
> ---
>  .../bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml    | 41 ++++++++++++++++++++++
>  .../bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml    | 43 ++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml b/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml
> new file mode 100644
> index 0000000..1442815
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml
> @@ -0,0 +1,43 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/gpio/xlnx,zynqmp-gpio-modepin.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: ZynqMP Mode Pin GPIO controller
> +
> +description:
> +  PS_MODE is 4-bits boot mode pins sampled on POR deassertion. Mode Pin
> +  GPIO controller with configurable from numbers of pins (from 0 to 3 per
> +  PS_MODE). Every pin can be configured as input/output.
So, at Linux runtime, someone decides to boot the system into e.g. a USB
recovery mode and then toggles the appropriate GPIOs and does a system
reset?

If so, are you aware of the reboot mode[1] infrastructure?

A reboot-mode-gpio driver on top of this GPIO controller would allow you
to describe the supported reboot modes in the device tree and instead of
exporting GPIOs to userspace, users can then just do

	systemctl restart recovery

to toggle the appropriate bits.

Also to be sure: PS_MODE are actual GPIO pins that you could toggle
board level components with, right? i.e. it's not just a register that
overrides the values read from the boot mode pins? (In the latter case
a syscon-reboot-mode without GPIO controller would be the correct
abstraction).

[1]: drivers/power/reset/reboot-mode.c

Cheers,
Ahmad

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
