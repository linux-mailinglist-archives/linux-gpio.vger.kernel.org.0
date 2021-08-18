Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83FB43EFF9C
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Aug 2021 10:52:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbhHRIwt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Aug 2021 04:52:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbhHRIws (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Aug 2021 04:52:48 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09879C0613CF
        for <linux-gpio@vger.kernel.org>; Wed, 18 Aug 2021 01:52:14 -0700 (PDT)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <a.fatoum@pengutronix.de>)
        id 1mGHIs-0001JE-9s; Wed, 18 Aug 2021 10:52:06 +0200
Subject: Re: [PATCH V3 3/3] gpio: modepin: Add driver support for modepin GPIO
 controller
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
 <20210818081018.2620544-4-piyush.mehta@xilinx.com>
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <b3d718af-6eb7-a212-f599-d0d91273afdc@pengutronix.de>
Date:   Wed, 18 Aug 2021 10:52:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210818081018.2620544-4-piyush.mehta@xilinx.com>
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
> This patch adds driver support for the zynqmp modepin GPIO controller.
> GPIO modepin driver set and get the value and status of the PS_MODE pin,
> based on device-tree pin configuration. These four mode pins are
> configurable as input/output. The mode pin has a control register, which
> have lower four-bits [0:3] are configurable as input/output, next four-bits
> can be used for reading the data  as input[4:7], and next setting the
> output pin state output[8:11].
> 
> Signed-off-by: Piyush Mehta <piyush.mehta@xilinx.com>
> Acked-by: Michal Simek <michal.simek@xilinx.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---

> +/**
> + * modepin_gpio_dir_in - Set the direction of the specified GPIO pin as input
> + * @chip:	gpio_chip instance to be worked on
> + * @pin:	gpio pin number within the device
> + *
> + * Return: 0 always
> + */
> +static int modepin_gpio_dir_in(struct gpio_chip *chip, unsigned int pin)
> +{
> +	return 0;
> +}

You say the gpio controller can configure pins as inputs or outputs.
Yet, .direction_input is doing nothing. So it's not clear to me,
how this sequence could work:

 - set gpio output high (writes bootmode)
 - set gpio to input (no-op, pin will remain high, not high impedance)

I didn't check the previous discussions, but if this indeed works as intended,
the how should be written here into the driver. That is a more useful comment
than kernel doc for a stub function.

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
