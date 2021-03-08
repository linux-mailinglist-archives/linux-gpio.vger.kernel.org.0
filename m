Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56023330C9E
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Mar 2021 12:45:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbhCHLpL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Mar 2021 06:45:11 -0500
Received: from mga12.intel.com ([192.55.52.136]:50435 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229604AbhCHLpK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Mar 2021 06:45:10 -0500
IronPort-SDR: zMLxAtgMNZTdZYY5WHzhjgk4eahQIj3cxWZ8BRXI3FddeJ4DWrzKyzCRjH+Syn5cDHR8nSyMbW
 f63hEZ9RX+Sg==
X-IronPort-AV: E=McAfee;i="6000,8403,9916"; a="167283889"
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; 
   d="scan'208";a="167283889"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2021 03:45:10 -0800
IronPort-SDR: lnUJFFXJ6/McTO6eNQriqJBp7TBvHjcQbyf9rXe9zb9M61dzhj4ClGP6Wj1daydc9wc72yPJVe
 4Lowz5WDtg6w==
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; 
   d="scan'208";a="508900360"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2021 03:45:08 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lJEJu-00Ao5j-9c; Mon, 08 Mar 2021 13:45:06 +0200
Date:   Mon, 8 Mar 2021 13:45:06 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek Vasut <marex@denx.de>,
        Roman Guskov <rguskov@dh-electronics.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Read "gpio-line-names" from a firmware
 node
Message-ID: <YEYOQqFch8yTE2SZ@smile.fi.intel.com>
References: <20210305120240.42830-1-andriy.shevchenko@linux.intel.com>
 <CAMpxmJVjdeW5978U--4KDCVr9gtu603gq04j2Zo0ohRi1rURZg@mail.gmail.com>
 <CAHp75Vf9XbZ4S-2aqfQafaw8jJrW3oVQYEw06roi3zOBKRMmOA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vf9XbZ4S-2aqfQafaw8jJrW3oVQYEw06roi3zOBKRMmOA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Mar 07, 2021 at 06:14:49PM +0200, Andy Shevchenko wrote:
> On Sun, Mar 7, 2021 at 4:22 PM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> > On Fri, Mar 5, 2021 at 1:02 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On STM32MP1, the GPIO banks are subnodes of pin-controller@50002000,
> > > see arch/arm/boot/dts/stm32mp151.dtsi. The driver for
> > > pin-controller@50002000 is in drivers/pinctrl/stm32/pinctrl-stm32.c
> > > and iterates over all of its DT subnodes when registering each GPIO
> > > bank gpiochip. Each gpiochip has:
> > >
> > >   - gpio_chip.parent = dev,
> > >     where dev is the device node of the pin controller
> > >   - gpio_chip.of_node = np,
> > >     which is the OF node of the GPIO bank
> > >
> > > Therefore, dev_fwnode(chip->parent) != of_fwnode_handle(chip.of_node),
> > > i.e. pin-controller@50002000 != pin-controller@50002000/gpio@5000*000.
> > >
> > > The original code behaved correctly, as it extracted the "gpio-line-names"
> > > from of_fwnode_handle(chip.of_node) = pin-controller@50002000/gpio@5000*000.
> > >
> > > To achieve the same behaviour, read property from the firmware node.

...

> > Did you run the OF unit tests on this? The check for the parent dev
> > was added after a bug was reported that was only triggered in unit
> > tests.
> 
> Parent is not used anymore. But I can run unittests next week (or if
> you know that they are failing now, can you please show the failure?).

For the record:
[   40.587868] ### dt-test ### end of unittest - 190 passed, 0 failed

If you have tests failed, we need more information about what line fails, etc.

-- 
With Best Regards,
Andy Shevchenko


