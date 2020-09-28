Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9B8627AE86
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 15:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgI1NAd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Sep 2020 09:00:33 -0400
Received: from mga09.intel.com ([134.134.136.24]:2358 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725290AbgI1NAd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 28 Sep 2020 09:00:33 -0400
IronPort-SDR: DSgf+qwEPBOKjnP4pNvuUgZPpSgaklzSgyxENdAlfOT8j85YYSgWVz1k+DExt0BqYpDyIywCzx
 LYwh9khPYWog==
X-IronPort-AV: E=McAfee;i="6000,8403,9757"; a="162870664"
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; 
   d="scan'208";a="162870664"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2020 06:00:31 -0700
IronPort-SDR: bKZ6s57xkqmVewKhpx53S+93hRUANHEiIHt9FYzTw98LSRexWTy3Wv4yivfJ4ZMIJcORZSVisP
 GtRIuPiLm8fQ==
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; 
   d="scan'208";a="350713488"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2020 06:00:29 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kMslT-002Z72-Vt; Mon, 28 Sep 2020 16:00:23 +0300
Date:   Mon, 28 Sep 2020 16:00:23 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 7/9] gpio: mockup: pass the chip label as device
 property
Message-ID: <20200928130023.GJ3956970@smile.fi.intel.com>
References: <20200928104155.7385-1-brgl@bgdev.pl>
 <20200928104155.7385-8-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200928104155.7385-8-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 28, 2020 at 12:41:53PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> While we do check the "chip-name" property in probe(), we never actually
> use it. Let's pass the chip label to the driver using device properties
> as we'll want to allow users to define their own once dynamically
> created chips are supported.
> 
> The property is renamed to "chip-label" to not cause any confusion with
> the actual chip name which is of the form: "gpiochipX".
> 
> If the "chip-label" property is missing, let's do what most devices in
> drivers/gpio/ do and use dev_name().

...

> +		snprintf(chip_label, sizeof(chip_label),
> +			 "gpio-mockup-%c", i + 'A');
> +		properties[prop++] = PROPERTY_ENTRY_STRING("chip-label",
> +							   chip_label);

You added new property, now count is up to 4. But at the same time

	#define GPIO_MOCKUP_MAX_PROP  4

how do you avoid overflow?

-- 
With Best Regards,
Andy Shevchenko


