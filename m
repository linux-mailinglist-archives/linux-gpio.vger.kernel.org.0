Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0A5932E69B
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Mar 2021 11:45:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbhCEKov (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Mar 2021 05:44:51 -0500
Received: from mga07.intel.com ([134.134.136.100]:54492 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229520AbhCEKoe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Mar 2021 05:44:34 -0500
IronPort-SDR: 1ZjJxcUBJlZkqBwzEGMCoaNJvxfnNEKX05TRWoc0ZYrKpePXGuL09nMfnR8BqH4qWhpbBV+fpi
 z+I4kc7EEm9Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="251658632"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="251658632"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2021 02:44:34 -0800
IronPort-SDR: 3WxBmA0m4azpUyWvCNMjMFZWeXdVG2IcObc7515smr5HAqX2calvj+9WBelndpIvJGEnfrHoM8
 u9/SLxDXcPkQ==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="436567014"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2021 02:44:32 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lI7wb-00A6HH-LX; Fri, 05 Mar 2021 12:44:29 +0200
Date:   Fri, 5 Mar 2021 12:44:29 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-gpio@vger.kernel.org,
        Roman Guskov <rguskov@dh-electronics.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] Revert "gpiolib: generalize devprop_gpiochip_set_names()
 for device properties"
Message-ID: <YEILjTOApl2gMw4P@smile.fi.intel.com>
References: <20210304230956.154626-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210304230956.154626-1-marex@denx.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 05, 2021 at 12:09:56AM +0100, Marek Vasut wrote:
> This reverts 7cba1a4d5e162 ("gpiolib: generalize devprop_gpiochip_set_names()
> for device properties") because this breaks OF "gpio-line-names" behavior on
> STM32MP1 platform.
> 
> On STM32MP1, the GPIO banks are subnodes of pin-controller@50002000, see
> arch/arm/boot/dts/stm32mp151.dtsi. The driver for pin-controller@50002000
> is in drivers/pinctrl/stm32/pinctrl-stm32.c and iterates over all of its DT
> subnodes when registering each GPIO bank gpiochip. Each gpiochip has:
> - gpio_chip.parent = dev where dev is the device node of the pin controller
> - gpio_chip.of_node = np which is the OF node of the GPIO bank
> Therefore, dev_fwnode(chip->parent) != of_fwnode_handle(chip.of_node) , i.e.
> pin-controller@50002000 != pin-controller@50002000/gpio@5000*000.
> 
> The original code behaved correctly, as it extracted the "gpio-line-names"
> from of_fwnode_handle(chip.of_node) = pin-controller@50002000/gpio@5000*000.
> This patch reinstates the original correct behavior.

> Signed-off-by: Marek Vasut <marex@denx.de>
> Reported-by: Roman Guskov <rguskov@dh-electronics.com>

Thanks for the report and a fix!
However I think the revert is not an option. We may do much better.



-- 
With Best Regards,
Andy Shevchenko


