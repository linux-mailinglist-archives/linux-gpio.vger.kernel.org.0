Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89A2C34E61E
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Mar 2021 13:12:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231602AbhC3LLn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Mar 2021 07:11:43 -0400
Received: from mga14.intel.com ([192.55.52.115]:60023 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231154AbhC3LLW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 30 Mar 2021 07:11:22 -0400
IronPort-SDR: T147fNnDpGseKeAKdPAZAeadieLxQa69KmpeCyI0kqWUnglU8Lyyy7wIjb5FnGinxobyH11tOZ
 zK2/1onWk8bA==
X-IronPort-AV: E=McAfee;i="6000,8403,9938"; a="191215714"
X-IronPort-AV: E=Sophos;i="5.81,290,1610438400"; 
   d="scan'208";a="191215714"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2021 04:11:22 -0700
IronPort-SDR: p3RRmcuFHHmtQjebqBF/5yNGYnT19zCfZa0wFjQoqMr1D1da3UQ/Ww+8T5gDeaAa5nYFPxtl+t
 a2W5Om7GeCTw==
X-IronPort-AV: E=Sophos;i="5.81,290,1610438400"; 
   d="scan'208";a="445079052"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2021 04:11:21 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lRCHG-00HJC0-Hc; Tue, 30 Mar 2021 14:11:18 +0300
Date:   Tue, 30 Mar 2021 14:11:18 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] gpio: sim: actually use the OF module table
Message-ID: <YGMHVlV6Td+TJ/qi@smile.fi.intel.com>
References: <20210330102110.10881-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210330102110.10881-1-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 30, 2021 at 12:21:10PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> We don't assign the of_device_id table to the platform driver resulting
> in the following build warning:
> 
> >> drivers/gpio/gpio-sim.c:388:34: warning: unused variable 'gpio_sim_of_match' [-Wunused-const-variable]
>    static const struct of_device_id gpio_sim_of_match[] = {
> 
> This fixes it.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/gpio/gpio-sim.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> index a1807f518837..ea17289a869c 100644
> --- a/drivers/gpio/gpio-sim.c
> +++ b/drivers/gpio/gpio-sim.c
> @@ -394,6 +394,7 @@ MODULE_DEVICE_TABLE(of, gpio_sim_of_match);
>  static struct platform_driver gpio_sim_driver = {
>  	.driver = {
>  		.name = "gpio-sim",
> +		.of_match_table = gpio_sim_of_match,
>  	},
>  	.probe = gpio_sim_probe,
>  };
> -- 
> 2.30.1
> 

-- 
With Best Regards,
Andy Shevchenko


