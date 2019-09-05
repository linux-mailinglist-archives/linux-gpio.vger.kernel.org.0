Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65B0EA99E2
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2019 07:01:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731196AbfIEFB2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Sep 2019 01:01:28 -0400
Received: from mga12.intel.com ([192.55.52.136]:28652 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725921AbfIEFB2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 5 Sep 2019 01:01:28 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Sep 2019 22:01:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,469,1559545200"; 
   d="scan'208";a="199195303"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 04 Sep 2019 22:01:24 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 05 Sep 2019 08:01:23 +0300
Date:   Thu, 5 Sep 2019 08:01:23 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Patrice Chotard <patrice.chotard@st.com>,
        Andrew Lunn <andrew@lunn.ch>, Andrew Jeffery <andrew@aj.id.au>,
        Joel Stanley <joel@jms.id.au>,
        Thierry Reding <treding@nvidia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] gpio: Initialize the irqchip valid_mask with a callback
Message-ID: <20190905050123.GT18521@lahna.fi.intel.com>
References: <20190904140104.32426-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190904140104.32426-1-linus.walleij@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 04, 2019 at 04:01:04PM +0200, Linus Walleij wrote:
> After changing the valid_mask for the struct gpio_chip
> to detect the need and presence of a valid mask with the
> presence of a .init_valid_mask() callback to fill it in,
> we augment the gpio_irq_chip to use the same logic.
> 
> Switch all driver using the gpio_irq_chio valid_mask
> over to this new method.
> 
> This makes sure the valid_mask for the gpio_irq_chip gets
> filled in when we add the gpio_chip, which makes it a
> little easier to switch over drivers using the old
> way of setting up gpio_irq_chip over to the new method
> of passing the gpio_irq_chip along with the gpio_chip.
> (See drivers/gpio/TODO for details.)
> 
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Thierry Reding <treding@nvidia.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> All is compile tested on top of the gpio "devel" branch.
> 
> Andy: I guess this would collide with my attempted
> rewrites of some Intel-related drivers, we can either
> merge this first and I will rebase and resend the
> other changes, or you can send me a pull request
> if you think some of my changes are working and I
> will instead rebase this on top of that, thanks.
> 
> Hans de Goede: I actually think that patch
> 48057ed1840fde9239b1e000bea1a0a1f07c5e99
> "gpio: Fix irqchip initialization order" fixes the
> issues you saw with the rewrite of int0002 earlier,
> and we suggested setting up the mask as part of the
> chip addition then, but this change is nice to have
> anyways.
> ---
>  drivers/gpio/gpio-aspeed.c                 | 13 ++++---
>  drivers/gpio/gpio-stmpe.c                  | 36 +++++++++++++------
>  drivers/gpio/gpio-tqmx86.c                 | 21 ++++++-----
>  drivers/gpio/gpiolib.c                     | 12 ++++---
>  drivers/pinctrl/intel/pinctrl-baytrail.c   | 16 ++++++++-
>  drivers/pinctrl/intel/pinctrl-cherryview.c | 42 +++++++++++++---------

For Intel pinctrl driver changes,

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
