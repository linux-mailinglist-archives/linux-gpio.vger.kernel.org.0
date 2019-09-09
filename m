Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 900E1AD592
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Sep 2019 11:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728861AbfIIJWQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Sep 2019 05:22:16 -0400
Received: from mga18.intel.com ([134.134.136.126]:9306 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728706AbfIIJWP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Sep 2019 05:22:15 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Sep 2019 02:22:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,484,1559545200"; 
   d="scan'208";a="213859213"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002.fm.intel.com with ESMTP; 09 Sep 2019 02:22:13 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1i7FsB-00061C-QA; Mon, 09 Sep 2019 12:22:11 +0300
Date:   Mon, 9 Sep 2019 12:22:11 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Chris Chiu <chiu@endlessm.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] pinctrl: intel: mark intel_pin_to_gpio
 __maybe_unused
Message-ID: <20190909092211.GN2680@smile.fi.intel.com>
References: <20190906185231.1081695-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190906185231.1081695-1-arnd@arndb.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 06, 2019 at 08:51:59PM +0200, Arnd Bergmann wrote:
> The intel_pin_to_gpio() function is only called by the
> PM support functions and causes a warning when those are disabled:
> 
> drivers/pinctrl/intel/pinctrl-intel.c:841:12: error: unused function 'intel_pin_to_gpio' [-Werror,-Wunused-function]
> 
> Mark it __maybe_unused to suppress the warning.
> 

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: use __maybe_unused instead of moving the code
> ---
>  drivers/pinctrl/intel/pinctrl-intel.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index d66fe2b4221b..1f13bcd0e4e1 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -838,7 +838,7 @@ static int intel_gpio_to_pin(struct intel_pinctrl *pctrl, unsigned int offset,
>   *
>   * Translate the pin number of pinctrl to GPIO offset
>   */
> -static int intel_pin_to_gpio(struct intel_pinctrl *pctrl, int pin)
> +static __maybe_unused int intel_pin_to_gpio(struct intel_pinctrl *pctrl, int pin)
>  {
>  	const struct intel_community *community;
>  	const struct intel_padgroup *padgrp;
> -- 
> 2.20.0
> 

-- 
With Best Regards,
Andy Shevchenko


