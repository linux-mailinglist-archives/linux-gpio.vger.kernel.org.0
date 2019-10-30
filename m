Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A897CE9C80
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 14:41:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbfJ3Nlj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 09:41:39 -0400
Received: from mga02.intel.com ([134.134.136.20]:27658 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726465AbfJ3Nlj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Oct 2019 09:41:39 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Oct 2019 06:41:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,247,1569308400"; 
   d="scan'208";a="193971752"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 30 Oct 2019 06:41:36 -0700
Received: from andy by smile with local (Exim 4.92.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iPoEC-0006Sr-B5; Wed, 30 Oct 2019 15:41:36 +0200
Date:   Wed, 30 Oct 2019 15:41:36 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] gpiolib: Switch order of valid mask and hw init
Message-ID: <20191030134136.GX32742@smile.fi.intel.com>
References: <20191030122914.967-1-linus.walleij@linaro.org>
 <677730df-4960-0572-2de9-6c9c8b31a26f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <677730df-4960-0572-2de9-6c9c8b31a26f@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 30, 2019 at 01:43:38PM +0100, Hans de Goede wrote:
> On 30-10-2019 13:29, Linus Walleij wrote:

> But as I guess you are aware, that still leaves us with the third
> problem: "acpi_gpiochip_request_interrupts() gets called before
> gpiochip_add_pin_range() is called from pinctrl-baytrail.c, causing
> the GPIO lookup of any ACPI _AEI handlers to fail, resulting in
> errors like this one:
> 
> byt_gpio INT33FC:02: Failed to request GPIO for pin 0x13: -517
> 
> And none of the _AEI handlers working"

I think we may postpone the Baytrail patches, if we don't find a solution for
the above soon.

Nevertheless, this change on its own good to have.

Hans, thanks for testing!

-- 
With Best Regards,
Andy Shevchenko


