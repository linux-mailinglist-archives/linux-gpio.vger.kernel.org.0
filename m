Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 929E32B01C4
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 10:10:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbgKLJKX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Nov 2020 04:10:23 -0500
Received: from mga17.intel.com ([192.55.52.151]:54144 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725995AbgKLJKW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Nov 2020 04:10:22 -0500
IronPort-SDR: fFn3QPeURwlpsuf1LDCLorull+SxaRVmfUegmUUOATJvYZmshH2cO+2Zn/m5c6nnqXIugTNesd
 B7MLrXM43jxg==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="150130968"
X-IronPort-AV: E=Sophos;i="5.77,471,1596524400"; 
   d="scan'208";a="150130968"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2020 01:10:22 -0800
IronPort-SDR: bYhYXVdd+E8f4Dz0NuEa9W9y8iluQ4usf/ozyjTLC5OtPUdUZIc2ikq/p4HnJjkzLgHSlTpHz/
 q3MwAN1f494w==
X-IronPort-AV: E=Sophos;i="5.77,471,1596524400"; 
   d="scan'208";a="542186972"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2020 01:10:19 -0800
Received: by lahna (sSMTP sendmail emulation); Thu, 12 Nov 2020 11:10:16 +0200
Date:   Thu, 12 Nov 2020 11:10:16 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Vasile-Laurentiu Stanimir 
        <vasile-laurentiu.stanimir@windriver.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v7 13/18] gpiolib: acpi: Set initial value for output pin
 based on bias and polarity
Message-ID: <20201112091016.GY2495@lahna.fi.intel.com>
References: <20201111222008.39993-1-andriy.shevchenko@linux.intel.com>
 <20201111222008.39993-14-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201111222008.39993-14-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 12, 2020 at 12:20:03AM +0200, Andy Shevchenko wrote:
> From: Vasile-Laurentiu Stanimir <vasile-laurentiu.stanimir@windriver.com>
> 
> GpioIo() resources don't contain an initial value for the output pin.
> Therefore instead of deducting its value solely based on bias field
> we should deduce that value from the polarity and the bias fields.
> Typical scenario is, when pin is defined in the table and its polarity,
> specified in _DSD or via platform code, is defined as active low,
> in the following call chain:
> 
>   -> acpi_populate_gpio_lookup()
>      -> acpi_gpio_to_gpiod_flags()
> 
> it will return GPIOD_OUT_HIGH if bias is set no matter if polarity
> is GPIO_ACTIVE_LOW, so it will return the current level instead of
> the logical level.
> 
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
