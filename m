Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 087328635E
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Aug 2019 15:44:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733222AbfHHNoH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Aug 2019 09:44:07 -0400
Received: from mga07.intel.com ([134.134.136.100]:51011 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733220AbfHHNoH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 8 Aug 2019 09:44:07 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Aug 2019 06:44:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,361,1559545200"; 
   d="scan'208";a="203578945"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2019 06:44:04 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hvii2-0003ox-QJ; Thu, 08 Aug 2019 16:44:02 +0300
Date:   Thu, 8 Aug 2019 16:44:02 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Stefan Roese <sr@denx.de>
Cc:     linux-serial@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pavel Machek <pavel@denx.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/2] gpiolib: Add for_each_gpio_suffix() helper
Message-ID: <20190808134402.GX30120@smile.fi.intel.com>
References: <20190808132543.26274-1-sr@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190808132543.26274-1-sr@denx.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 08, 2019 at 03:25:42PM +0200, Stefan Roese wrote:
> Add a helper macro to enable the interation over all supported GPIO
> suffixes (currently "gpios" & "gpio"). This will be used by the serial
> mctrl code to check, if a GPIO property exists before requesting it.

Thanks! My comments below.

> +#define for_each_gpio_suffix(idx, suffix)				\
> +	for (idx = 0;							\
> +	     idx < ARRAY_SIZE(gpio_suffixes) &&				\
> +		     (suffix = gpio_suffixes[idx]) != NULL;		\
> +	     idx++)

I think we can use comma here, like

	for (idx = 0; idx < ARRAY_SIZE(...), suffix = ...; idx++;)

however, this needs to be checked, b/c I think the last operation makes a
return code, and probably we have to assign suffix first.

(and perhaps switch to one letter for idx makes it fit one line)

-- 
With Best Regards,
Andy Shevchenko


