Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EEB520F6A5
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2020 16:02:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730303AbgF3OBb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jun 2020 10:01:31 -0400
Received: from mga06.intel.com ([134.134.136.31]:48229 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728808AbgF3OBa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 30 Jun 2020 10:01:30 -0400
IronPort-SDR: 8YGCtYurDXBvSTL2y57TNfJYpyOge87cZ+xS0L9K72M4d1tSVKGx7Ox27k3saPUuGvUGx9/GPv
 cC+u9d3QWQOA==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="207750096"
X-IronPort-AV: E=Sophos;i="5.75,297,1589266800"; 
   d="scan'208";a="207750096"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2020 07:01:11 -0700
IronPort-SDR: R0Gwqc2V4F52bCGV31q6QEEjl7oyXFNcUSJzJcUCp7JWplQU9Gi214eTU02coYDsK8LT2JrjJ6
 jedy9DJDsJ2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,297,1589266800"; 
   d="scan'208";a="277435003"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003.jf.intel.com with ESMTP; 30 Jun 2020 07:01:09 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1jqGow-00GrKd-Ty; Tue, 30 Jun 2020 17:01:10 +0300
Date:   Tue, 30 Jun 2020 17:01:10 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH 03/10] gpio: gpio-ml-ioh: Fix missing ':' in 'struct
 ioh_gpio_reg_data
Message-ID: <20200630140110.GT3703480@smile.fi.intel.com>
References: <20200630133345.2232932-1-lee.jones@linaro.org>
 <20200630133345.2232932-4-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200630133345.2232932-4-lee.jones@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 30, 2020 at 02:33:38PM +0100, Lee Jones wrote:
> 'struct ioh_gpio_reg_data's 'ien_reg' property is missing a ':'
> which confuses the kerneldoc tooling/parsers/validators.
> 
> Replacing it squashes the following W=1 warning:
> 
>  drivers/gpio/gpio-ml-ioh.c:63: warning: Function parameter or member 'ien_reg' not described in 'ioh_gpio_reg_data'

Applied, thanks!

> 
> Cc: Andy Shevchenko <andy@kernel.org>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpio/gpio-ml-ioh.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-ml-ioh.c b/drivers/gpio/gpio-ml-ioh.c
> index 92b6e958cfed5..53d4abefa6ff2 100644
> --- a/drivers/gpio/gpio-ml-ioh.c
> +++ b/drivers/gpio/gpio-ml-ioh.c
> @@ -44,7 +44,7 @@ struct ioh_regs {
>  
>  /**
>   * struct ioh_gpio_reg_data - The register store data.
> - * @ien_reg	To store contents of interrupt enable register.
> + * @ien_reg:	To store contents of interrupt enable register.
>   * @imask_reg:	To store contents of interrupt mask regist
>   * @po_reg:	To store contents of PO register.
>   * @pm_reg:	To store contents of PM register.
> -- 
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko


