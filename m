Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59848E3468
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2019 15:38:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388589AbfJXNiu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Oct 2019 09:38:50 -0400
Received: from mga14.intel.com ([192.55.52.115]:21369 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733296AbfJXNiu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 24 Oct 2019 09:38:50 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Oct 2019 06:38:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,224,1569308400"; 
   d="scan'208";a="202303360"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006.jf.intel.com with ESMTP; 24 Oct 2019 06:38:47 -0700
Received: from andy by smile with local (Exim 4.92.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iNdKA-0004SI-Qr; Thu, 24 Oct 2019 16:38:46 +0300
Date:   Thu, 24 Oct 2019 16:38:46 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH] RFC: pinctrl: cherryview: Pass irqchip when adding
 gpiochip
Message-ID: <20191024133846.GW32742@smile.fi.intel.com>
References: <20190813070123.17406-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190813070123.17406-1-linus.walleij@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 13, 2019 at 09:01:23AM +0200, Linus Walleij wrote:
> We need to convert all old gpio irqchips to pass the irqchip
> setup along when adding the gpio_chip. For more info see
> drivers/gpio/TODO.
> 
> This driver is something of a special case, so we need to
> discuss it.
> 
> It picks a number of IRQ descriptors before setting up
> the gpio_irq_chip using devm_irq_alloc_descs() giving a
> fixed irq base in the IRQ numberspace. It then games the
> irqchip API by associating IRQs from that base and upward
> with as many pins there are in the "community" which is a
> set of pins. Then after each gpio_chip is registered, it
> fills in the pin to IRQ map for each GPIO range inside
> that "community" with irq_domain_associate_many() which
> works fine since the descriptors were allocated
> previously.
> 
> This is actually a hierarchical irq_chip as far as I can
> tell. The problem is that very likely the Intel root IRQ
> chip is not hierarchical so it does not support using the
> facilities for hierarchical irqdomains.
> 
> I will soon merge the patch providing hierarchical irqchip
> support in gpiolib:
> https://lore.kernel.org/linux-gpio/20190808123242.5359-1-linus.walleij@linaro.org/
> 
> Will we need to bite the bullet and convert the root
> irqchip for the intels to support hierarcical irqdomain?

We have few fixes for this driver, perhaps you can send a new version based on
them when they appear in your tree.

-- 
With Best Regards,
Andy Shevchenko


