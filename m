Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1259B688115
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Feb 2023 16:06:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbjBBPG2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Feb 2023 10:06:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232096AbjBBPGN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Feb 2023 10:06:13 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF6D641081
        for <linux-gpio@vger.kernel.org>; Thu,  2 Feb 2023 07:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675350372; x=1706886372;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=E+wGx5zRDu7tKAFP+EfF6mWhZurTm9hj8VJCLSbRA9c=;
  b=b7NRgNw0JJwDZO2RSFUYL78AcwzY3NT1e+VMQIfOG6VD9TaS4f59k7gt
   YJvz218x3IrAUZUBVivC6YtNbFMreZLe5JINRP2by0qHWlOubXmMq5x/a
   +QEnYHxOvY3Qwc2pqmbXetVgLK3UHnY3q0rMXbo4su6U9+MyLxd/ct4eL
   EI//n13mIwsDX2I3xn2YY7AHTssF5W9ta0SupnhuSbRv2WGBvWPlgibZo
   GTgUenkbe7g6jkyoo8SkRXGGjroJLmqWkWL0ZbaHuZUJJlnDeC3mqki4P
   MlOrAqFgSLIHDxG03NUKJSxTxRPJ3hVpbveNJOSzOXqlno/I6EhivcAF1
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="327114203"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="327114203"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 07:04:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="728906076"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="728906076"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 02 Feb 2023 07:04:13 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pNb8F-001E0K-16;
        Thu, 02 Feb 2023 17:04:11 +0200
Date:   Thu, 2 Feb 2023 17:04:10 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Levente =?iso-8859-1?B?Uul26XN6?= <levente.revesz@eilabs.com>
Cc:     Martyn Welch <martyn.welch@collabora.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Haibo Chen <haibo.chen@nxp.com>, Puyou Lu <puyou.lu@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Nate Drude <nate.d@variscite.com>, linux-gpio@vger.kernel.org,
        Peter Robinson <pbrobinson@gmail.com>
Subject: Re: [RFC PATCH 2/3] gpio: pca953x: Describe register maps with enums
Message-ID: <Y9vQ6sR283B4RItv@smile.fi.intel.com>
References: <fbd33cdb-6942-e1ac-57ad-b7f3faf7eba5@eilabs.com>
 <73a0ab72-1189-0b87-6b26-5525645a591d@eilabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <73a0ab72-1189-0b87-6b26-5525645a591d@eilabs.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 30, 2023 at 09:59:48PM +0100, Levente Révész wrote:
> The driver supports 8 chip types, 6 of which have extended registers
> with various functions, e.g. pull-up and pull-down bias for the gpio
> lines or interrupt masking. To allow supporting these functions, the
> driver has to be able to calculate the addresses of these registers.
> 
> Replace the register maps with an enum for each chip type. These do not
> contain the same numeric values as the old defines, but the new address
> calculating functions (in the next patch) use them appropriately.
> 
> Add currently used registers to struct pca953x_reg_config.
> 
> Create a reg_config struct for each chip type.

...

> +enum xra120x_reg {
> +};

>  static const struct pca953x_reg_config pca953x_regs = {
> +};

Make those enums and reg_config definitions to be sorted by their
respective names.

...

> +	case TYPE_PCA950X:
> +		registers = BIT(PCA950X_REG_INPUT) |
> +			    BIT(PCA950X_REG_OUTPUT) |
> +			    BIT(PCA950X_REG_INVERT) |
> +			    BIT(PCA950X_REG_DIRECTION) |
> +			    BIT(PCA950X_REG_INT_MASK);
> +		break;

Can't it be simplified if you define something like REG_MAX in each of
the enums and use here simply GENMASK(MAX, 0); ?

...

> +	case TYPE_PCA950X:
> +		registers = BIT(PCA950X_REG_OUTPUT) |
> +			    BIT(PCA950X_REG_INVERT) |
> +			    BIT(PCA950X_REG_DIRECTION) |
> +			    BIT(PCA950X_REG_INT_MASK);

Something similar, maybe with a definition of the volatile registers?

> +		break;

...

>  	if (chip->type == TYPE_PCA957X) {
> -		chip->regs = &pca957x_regs;
>  		ret = device_pca957x_init(chip, invert);
>  	} else {
> -		chip->regs = &pca953x_regs;
>  		ret = device_pca95xx_init(chip, invert);
>  	}

After this the {} may be dropped as well.

-- 
With Best Regards,
Andy Shevchenko


