Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26CB82AF573
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 16:50:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727027AbgKKPug (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 10:50:36 -0500
Received: from mga05.intel.com ([192.55.52.43]:10759 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725995AbgKKPug (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 10:50:36 -0500
IronPort-SDR: ZKYFpEs1MU5Qtt3/dKGCrBmhsGqafgo3gGQAtKgPiMmoIXSeODc1Li9ljRyL2DkJ0TD7yZUQ6q
 7QKwRSWqI6Ow==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="254874031"
X-IronPort-AV: E=Sophos;i="5.77,469,1596524400"; 
   d="scan'208";a="254874031"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 07:50:35 -0800
IronPort-SDR: PpYg4Q4g7277XPg1q9fd4kUjC23FMzZCcg34FSO4y5oBMKH8iPF6WnYvXgxP5lwKUFUIZqR+IW
 Fl/J6hqAEq1A==
X-IronPort-AV: E=Sophos;i="5.77,469,1596524400"; 
   d="scan'208";a="541850489"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 07:50:33 -0800
Received: by lahna (sSMTP sendmail emulation); Wed, 11 Nov 2020 17:50:30 +0200
Date:   Wed, 11 Nov 2020 17:50:30 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v5 13/17] gpiolib: acpi: Make acpi_gpio_to_gpiod_flags()
 usable for GpioInt()
Message-ID: <20201111155030.GH2495@lahna.fi.intel.com>
References: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
 <20201109205332.19592-14-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201109205332.19592-14-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 09, 2020 at 10:53:28PM +0200, Andy Shevchenko wrote:
> GpioInt() implies input configuration of the pin. Add this to
> the acpi_gpio_to_gpiod_flags() and make usable for GpioInt().
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
