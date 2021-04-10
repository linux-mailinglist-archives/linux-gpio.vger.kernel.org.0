Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F2E635AC4E
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Apr 2021 11:15:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234320AbhDJJPg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Apr 2021 05:15:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:35690 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234306AbhDJJPg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 10 Apr 2021 05:15:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B0DE60233;
        Sat, 10 Apr 2021 09:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1618046121;
        bh=ylacISelC0n5uq3LcWny5QQY5S3oyLsn0/lLqR99PSk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c30pMcHbUE6mjml6G9xJuol9fJbGrG9PZ/sQEkACfNmUFQoVpZcR6CY5GUTzQE7ny
         uV2CfIQZ9LeGAY+2hDpqNmF/aQi2BqqUqEXHtZSeShPTLIwnzMmqrIyvnjXzBE0BZK
         Fg5Xr+wYncoviVx+GxxqA2FBwjom/Uk7f5KoMxXA=
Date:   Sat, 10 Apr 2021 11:15:19 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        stable@vger.kernel.org, Marek Vasut <marex@denx.de>,
        Roman Guskov <rguskov@dh-electronics.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH stable] gpiolib: Read "gpio-line-names" from a firmware
 node
Message-ID: <YHFsp1Q0rcqQwz3t@kroah.com>
References: <20210410090919.3157-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210410090919.3157-1-brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Apr 10, 2021 at 11:09:19AM +0200, Bartosz Golaszewski wrote:
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> On STM32MP1, the GPIO banks are subnodes of pin-controller@50002000,
> see arch/arm/boot/dts/stm32mp151.dtsi. The driver for
> pin-controller@50002000 is in drivers/pinctrl/stm32/pinctrl-stm32.c
> and iterates over all of its DT subnodes when registering each GPIO
> bank gpiochip. Each gpiochip has:
> 
>   - gpio_chip.parent = dev,
>     where dev is the device node of the pin controller
>   - gpio_chip.of_node = np,
>     which is the OF node of the GPIO bank
> 
> Therefore, dev_fwnode(chip->parent) != of_fwnode_handle(chip.of_node),
> i.e. pin-controller@50002000 != pin-controller@50002000/gpio@5000*000.
> 
> The original code behaved correctly, as it extracted the "gpio-line-names"
> from of_fwnode_handle(chip.of_node) = pin-controller@50002000/gpio@5000*000.
> 
> To achieve the same behaviour, read property from the firmware node.
> 
> Fixes: 7cba1a4d5e162 ("gpiolib: generalize devprop_gpiochip_set_names() for device properties")
> Cc: stable@vger.kernel.org
> Reported-by: Marek Vasut <marex@denx.de>
> Reported-by: Roman Guskov <rguskov@dh-electronics.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Tested-by: Marek Vasut <marex@denx.de>
> Reviewed-by: Marek Vasut <marex@denx.de>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
> Hi Greg,
> 
> This patch somehow got lost and never made its way into stable. Could you
> please apply it?

What is the git commit id of it in Linus's tree?

thanks,

greg k-h
