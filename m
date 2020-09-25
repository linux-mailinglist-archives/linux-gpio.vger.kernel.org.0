Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4002627836B
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Sep 2020 11:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727151AbgIYJAh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Sep 2020 05:00:37 -0400
Received: from mga07.intel.com ([134.134.136.100]:19406 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727044AbgIYJAh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 25 Sep 2020 05:00:37 -0400
IronPort-SDR: 7OjYIsobAf/PLluLcJdrFiB8zVVyYx/FUIJdbN++1YmgTkm5vYFj+AGXJOAkCjH/e+41BF2d/L
 CVuK6PRouY1g==
X-IronPort-AV: E=McAfee;i="6000,8403,9754"; a="225621530"
X-IronPort-AV: E=Sophos;i="5.77,301,1596524400"; 
   d="scan'208";a="225621530"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2020 02:00:36 -0700
IronPort-SDR: ILA4FS7fJgpNARCSc58njc14jCnhe09EWCz0ihD1wqPoQ8WeuTcHl89HM/ac6imOfHomH7wyYo
 mFHomaURuJ3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,301,1596524400"; 
   d="scan'208";a="339420923"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 25 Sep 2020 02:00:34 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kLjag-001sVF-NX; Fri, 25 Sep 2020 12:00:30 +0300
Date:   Fri, 25 Sep 2020 12:00:30 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 7/9] gpio: mockup: pass the chip label as device property
Message-ID: <20200925090030.GY3956970@smile.fi.intel.com>
References: <20200924113842.11670-1-brgl@bgdev.pl>
 <20200924113842.11670-8-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200924113842.11670-8-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 24, 2020 at 01:38:40PM +0200, Bartosz Golaszewski wrote:
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

> +		properties[prop++] = PROPERTY_ENTRY_STRING("chip-label",
> +							   chip_label);

Forgot to update GPIO_MOCKUP_MAX_PROP?

>  		base = gpio_mockup_range_base(i);
>  		if (base >= 0)
>  			properties[prop++] = PROPERTY_ENTRY_U32("gpio-base",

-- 
With Best Regards,
Andy Shevchenko


