Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 752A232E821
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Mar 2021 13:25:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbhCEMZP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Mar 2021 07:25:15 -0500
Received: from mga02.intel.com ([134.134.136.20]:39041 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231219AbhCEMZD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Mar 2021 07:25:03 -0500
IronPort-SDR: nJSO2EIz82aZBhBvW+FQOGeDyug3rahERXqXni85n2baigdj6pOBbuViFzmKxpznZ7kCjnOB5/
 p0O1ghV/y/7A==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="174754639"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="174754639"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2021 04:25:02 -0800
IronPort-SDR: F9VsvIGTk9t5fdi8BGF3w5v2svrB0+16BCW3HgSXTwhLkEQReS98mrS5h9fB6HwhDuEeilVy2H
 xTBlkANB0RHw==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="507983703"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2021 04:24:59 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lI9Vp-00A7Rv-1J; Fri, 05 Mar 2021 14:24:57 +0200
Date:   Fri, 5 Mar 2021 14:24:57 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Roman Guskov <rguskov@dh-electronics.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Read "gpio-line-names" from a firmware
 node
Message-ID: <YEIjGcPF9yNnKdSp@smile.fi.intel.com>
References: <20210305120240.42830-1-andriy.shevchenko@linux.intel.com>
 <506c1e48-c648-69d4-8e4f-b42fe02156f7@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <506c1e48-c648-69d4-8e4f-b42fe02156f7@denx.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 05, 2021 at 01:11:39PM +0100, Marek Vasut wrote:
> On 3/5/21 1:02 PM, Andy Shevchenko wrote:
> > On STM32MP1, the GPIO banks are subnodes of pin-controller@50002000,
> > see arch/arm/boot/dts/stm32mp151.dtsi. The driver for
> > pin-controller@50002000 is in drivers/pinctrl/stm32/pinctrl-stm32.c
> > and iterates over all of its DT subnodes when registering each GPIO
> > bank gpiochip. Each gpiochip has:
> > 
> >    - gpio_chip.parent = dev,
> >      where dev is the device node of the pin controller
> >    - gpio_chip.of_node = np,
> >      which is the OF node of the GPIO bank
> > 
> > Therefore, dev_fwnode(chip->parent) != of_fwnode_handle(chip.of_node),
> > i.e. pin-controller@50002000 != pin-controller@50002000/gpio@5000*000.
> > 
> > The original code behaved correctly, as it extracted the "gpio-line-names"
> > from of_fwnode_handle(chip.of_node) = pin-controller@50002000/gpio@5000*000.
> > 
> > To achieve the same behaviour, read property from the firmware node.
> > 
> > Fixes: 7cba1a4d5e162 ("gpiolib: generalize devprop_gpiochip_set_names() for device properties")
> > Reported-by: Marek Vasut <marex@denx.de>
> > Reported-by: Roman Guskov <rguskov@dh-electronics.com>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Tested-by: Marek Vasut <marex@denx.de>
> Reviewed-by: Marek Vasut <marex@denx.de>

Thanks!

> Thanks
> 
> >   static int devprop_gpiochip_set_names(struct gpio_chip *chip)
> >   {
> >   	struct gpio_device *gdev = chip->gpiodev;
> > -	struct device *dev = chip->parent;
> > +	struct fwnode_handle *fwnode = dev_fwnode(&gdev->dev);
> 
> You could make the order here a reverse xmas tree, but that's a nitpick.

They are dependent, can't be reordered.

-- 
With Best Regards,
Andy Shevchenko


