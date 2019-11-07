Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D5A9F31C0
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2019 15:47:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729810AbfKGOrz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Nov 2019 09:47:55 -0500
Received: from mga09.intel.com ([134.134.136.24]:34112 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726033AbfKGOrz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 7 Nov 2019 09:47:55 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Nov 2019 06:47:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,278,1569308400"; 
   d="scan'208";a="201056938"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008.fm.intel.com with ESMTP; 07 Nov 2019 06:47:52 -0800
Received: from andy by smile with local (Exim 4.93-RC1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iSj4i-00079O-2Z; Thu, 07 Nov 2019 16:47:52 +0200
Date:   Thu, 7 Nov 2019 16:47:52 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/8] pinctrl: lynxpoint: Move GPIO driver to pin
 controller folder
Message-ID: <20191107144752.GY32742@smile.fi.intel.com>
References: <20191106144829.32275-1-andriy.shevchenko@linux.intel.com>
 <20191106144829.32275-2-andriy.shevchenko@linux.intel.com>
 <20191107134842.GM2552@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191107134842.GM2552@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 07, 2019 at 03:48:42PM +0200, Mika Westerberg wrote:
> On Wed, Nov 06, 2019 at 04:48:22PM +0200, Andy Shevchenko wrote:
> > Move Lynxpoint GPIO driver under Intel pin control umbrella
> > for further transformation to a real pin control driver.

> > +config PINCTRL_LYNXPOINT
> > +	tristate "Intel Lynxpoint pinctrl and GPIO driver"
> > +	depends on ACPI
> > +	select GPIOLIB
> > +	select GPIOLIB_IRQCHIP
> > +	help
> > +	  Lynxpoint is the PCH of Intel Haswell. This pinctrl driver
> > +	  provides an interface that allows configuring of PCH pins and
> > +	  using them as GPIOs.
> 
> In order to keep the above (non pinctrl-intel.c based drivers) sorted
> alphabetically, can you move this before PINCTRL_MERRIFIELD?

Fixed in my review branch.

> > +obj-$(CONFIG_PINCTRL_LYNXPOINT)		+= pinctrl-lynxpoint.o
> 
> Here too.

Ditto.

-- 
With Best Regards,
Andy Shevchenko


