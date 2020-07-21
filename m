Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4749D2283FA
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 17:39:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728281AbgGUPjj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 11:39:39 -0400
Received: from mga09.intel.com ([134.134.136.24]:14971 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726654AbgGUPjj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 21 Jul 2020 11:39:39 -0400
IronPort-SDR: XCa/noFIRXuNE0ReLLro2wOLIWpmRruhhAGvq2tIcXymV8mor+q+vfFc2XIMH/JkkESv+L0hxu
 SBBacGzgw7YA==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="151492813"
X-IronPort-AV: E=Sophos;i="5.75,379,1589266800"; 
   d="scan'208";a="151492813"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2020 08:39:38 -0700
IronPort-SDR: MnfR+3ae0O3PCic83mfosBw9YuY/t/ZbxHJCILH+GeJw8b3+36boSE8Z3iA123kuXkuMc9Tp22
 gUy82o8/XTEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,379,1589266800"; 
   d="scan'208";a="283898654"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003.jf.intel.com with ESMTP; 21 Jul 2020 08:39:36 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jxuMi-0035mv-Q1; Tue, 21 Jul 2020 18:39:36 +0300
Date:   Tue, 21 Jul 2020 18:39:36 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2] gpio: crystalcove: Use irqchip template
Message-ID: <20200721153936.GL3703480@smile.fi.intel.com>
References: <20200721140153.369171-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200721140153.369171-1-linus.walleij@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 21, 2020 at 04:01:53PM +0200, Linus Walleij wrote:
> This makes the driver use the irqchip template to assign
> properties to the gpio_irq_chip instead of using the
> explicit calls to gpiochip_irqchip_add_nested() and
> gpiochip_set_nested_irqchip(). The irqchip is instead
> added while adding the gpiochip.

Took this version instead.

I dunno if Hans can come with some comments / testing results, I would like to
send a PR today or tomorrow.

-- 
With Best Regards,
Andy Shevchenko


