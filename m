Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 689BF82F8C
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Aug 2019 12:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728845AbfHFKOP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Aug 2019 06:14:15 -0400
Received: from mga05.intel.com ([192.55.52.43]:28318 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726713AbfHFKOP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 6 Aug 2019 06:14:15 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Aug 2019 03:14:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,353,1559545200"; 
   d="scan'208";a="192633500"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 06 Aug 2019 03:14:12 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 06 Aug 2019 13:14:12 +0300
Date:   Tue, 6 Aug 2019 13:14:12 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1] pinctrl: intel: Use NSEC_PER_USEC for debounce
 calculus
Message-ID: <20190806101412.GJ2548@lahna.fi.intel.com>
References: <20190723155431.65095-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190723155431.65095-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 23, 2019 at 06:54:31PM +0300, Andy Shevchenko wrote:
> Replace hard coded constants with self-explanatory names, i.e.
> use NSEC_PER_USEC for debounce calculus.
> 
> While here, add a unit suffix to debounce period constant.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-intel.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index 3a7876efd4a6..99c5bca789eb 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -8,12 +8,13 @@
>   */
>  
>  #include <linux/acpi.h>
> -#include <linux/module.h>
>  #include <linux/interrupt.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/log2.h>
> +#include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
> +#include <linux/time.h>
>  
>  #include <linux/pinctrl/pinctrl.h>
>  #include <linux/pinctrl/pinmux.h>
> @@ -71,7 +72,7 @@
>  #define PADCFG2_DEBOUNCE_SHIFT		1
>  #define PADCFG2_DEBOUNCE_MASK		GENMASK(4, 1)
>  
> -#define DEBOUNCE_PERIOD			31250 /* ns */
> +#define DEBOUNCE_PERIOD_NS		31250

Should this be called DEBOUNCE_PERIOD_NSEC to be consistent with
NSEC_PER_USEC?

Otherwise looks good.

>  
>  struct intel_pad_context {
>  	u32 padcfg0;
> @@ -566,7 +567,7 @@ static int intel_config_get(struct pinctrl_dev *pctldev, unsigned int pin,
>  			return -EINVAL;
>  
>  		v = (v & PADCFG2_DEBOUNCE_MASK) >> PADCFG2_DEBOUNCE_SHIFT;
> -		arg = BIT(v) * DEBOUNCE_PERIOD / 1000;
> +		arg = BIT(v) * DEBOUNCE_PERIOD_NS / NSEC_PER_USEC;
>  
>  		break;
>  	}
> @@ -683,7 +684,7 @@ static int intel_config_set_debounce(struct intel_pinctrl *pctrl,
>  	if (debounce) {
>  		unsigned long v;
>  
> -		v = order_base_2(debounce * 1000 / DEBOUNCE_PERIOD);
> +		v = order_base_2(debounce * NSEC_PER_USEC / DEBOUNCE_PERIOD_NS);
>  		if (v < 3 || v > 15) {
>  			ret = -EINVAL;
>  			goto exit_unlock;
> -- 
> 2.20.1
