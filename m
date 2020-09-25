Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69E19278382
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Sep 2020 11:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727704AbgIYJDg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Sep 2020 05:03:36 -0400
Received: from mga04.intel.com ([192.55.52.120]:53248 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727044AbgIYJDf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 25 Sep 2020 05:03:35 -0400
IronPort-SDR: Y8UuPqOfRbxyYUs3u7hEXIMi/43KXTf55d80ZVlDzUKHTOG6n86tL08IMTQT5OrWnChj8opCAE
 5GAZjXTqfQsA==
X-IronPort-AV: E=McAfee;i="6000,8403,9754"; a="158862517"
X-IronPort-AV: E=Sophos;i="5.77,301,1596524400"; 
   d="scan'208";a="158862517"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2020 02:03:35 -0700
IronPort-SDR: F5gP2ztYRMaGx4eu4DU1djISTbNeaq9kk7IueOgojrYz4drfGoYSoVVYtwWaNEvvX0JMuqh28V
 qlLjhK2dbMQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,301,1596524400"; 
   d="scan'208";a="339423961"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 25 Sep 2020 02:03:33 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kLjdZ-001sXb-PK; Fri, 25 Sep 2020 12:03:29 +0300
Date:   Fri, 25 Sep 2020 12:03:29 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 8/9] gpio: mockup: use the generic 'gpio-line-names'
 property
Message-ID: <20200925090329.GZ3956970@smile.fi.intel.com>
References: <20200924113842.11670-1-brgl@bgdev.pl>
 <20200924113842.11670-9-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200924113842.11670-9-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 24, 2020 at 01:38:41PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> GPIO line names are currently created by the driver from the chip label.
> We'll want to support custom formats for line names (for instance: to
> name all lines the same) for user-space tests so create them in the
> module init function and pass them to the driver using the standard
> 'gpio-line-names' property.

...

> +		if (gpio_mockup_named_lines) {
> +			line_names = gpio_mockup_make_line_names(chip_label,
> +								 ngpio);
> +			if (!line_names) {
> +				platform_driver_unregister(&gpio_mockup_driver);
> +				gpio_mockup_unregister_pdevs();
> +				return -ENOMEM;
> +			}

> +			properties[prop++] = PROPERTY_ENTRY_STRING_ARRAY_LEN(
> +						"gpio-line-names",
> +						line_names, ngpio);

Forgot to update GPIO_MOCKUP_MAX_PROP?

> +		}

...

> +		kfree_strarray(line_names, line_names ? ngpio : 0);

Perhaps you may check for NULL pointer in the kfree_strarray() and drop ternary
here?

-- 
With Best Regards,
Andy Shevchenko


