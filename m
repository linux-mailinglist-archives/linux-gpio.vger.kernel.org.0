Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0EA0455FC9
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Nov 2021 16:46:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232596AbhKRPtd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Nov 2021 10:49:33 -0500
Received: from mga04.intel.com ([192.55.52.120]:50661 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232226AbhKRPtc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 18 Nov 2021 10:49:32 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10172"; a="232927631"
X-IronPort-AV: E=Sophos;i="5.87,245,1631602800"; 
   d="scan'208";a="232927631"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2021 07:44:12 -0800
X-IronPort-AV: E=Sophos;i="5.87,245,1631602800"; 
   d="scan'208";a="455083095"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2021 07:44:11 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mnja0-008DOR-FN;
        Thu, 18 Nov 2021 17:44:04 +0200
Date:   Thu, 18 Nov 2021 17:44:04 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] gpiolib: check the 'ngpios' property in core
 gpiolib code
Message-ID: <YZZ0xPU207qDaOpX@smile.fi.intel.com>
References: <20211118132317.15898-1-brgl@bgdev.pl>
 <20211118132317.15898-2-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211118132317.15898-2-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 18, 2021 at 02:23:17PM +0100, Bartosz Golaszewski wrote:
> Several drivers read the 'ngpios' device property on their own, but
> since it's defined as a standard GPIO property in the device tree bindings
> anyway, it's a good candidate for generalization. If the driver didn't
> set its gc->ngpio, try to read the 'ngpios' property from the GPIO
> device's firmware node before bailing out.

Thanks for update, my comment below.

...

>  	if (gc->ngpio == 0) {
> -		chip_err(gc, "tried to insert a GPIO chip with zero lines\n");
> -		ret = -EINVAL;
> -		goto err_free_descs;
> +		ret = device_property_read_u32(&gdev->dev, "ngpios", &ngpios);
> +		if (ret) {
> +			chip_err(gc, "tried to insert a GPIO chip with zero lines\n");

> +			ret = -EINVAL;

Sorry, forgot to ask, why this is needed?

> +			goto err_free_descs;
> +		}
> +
> +		gc->ngpio = ngpios;
>  	}

-- 
With Best Regards,
Andy Shevchenko


