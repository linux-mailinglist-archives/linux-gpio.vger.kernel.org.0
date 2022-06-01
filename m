Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FAE053A5E6
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jun 2022 15:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242692AbiFANXX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jun 2022 09:23:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236812AbiFANXW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2022 09:23:22 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECFB84FC47
        for <linux-gpio@vger.kernel.org>; Wed,  1 Jun 2022 06:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654089801; x=1685625801;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RXjpMuIpFepxgS5CaH3OUPjQ3eMK7Zv6V1dDZjg1lwM=;
  b=GZ0Li63bb1ReA9Uf74UAele11edAtJM8RIMBduLLT1V6icFTrWgaM54w
   VOOWpI+hMhLiePCiNBMSCVd2yNV6mLfwF6o01zf3LWAznq3BHubGhUG0H
   XNa7ld2dj7BjY9ssBgDztQ2sgUsYSUdw2ds0HXmnKmPZtYXXZRI/HsCv4
   wvMx3sUw62hiBS3BdKl92XEwz3c9dTbhBVOOPk6twxKON77yuTK8EKYM5
   p8hvJscJ6hmxHnHDYIBubYv66TI6SeX/Qg8nRq3tC7pO1HZ6DAXdxrlSs
   kFUAoGnE/zRnQrIAMRmelHCEfOQOi7lEbvueOkv2rhwEo/wYlLCHus0HK
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="300938541"
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="300938541"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 06:23:21 -0700
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="530056236"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 06:23:19 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nwOJg-000QfW-I6;
        Wed, 01 Jun 2022 16:23:16 +0300
Date:   Wed, 1 Jun 2022 16:23:16 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     Shyam-sundar.S-k@amd.com, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com
Subject: Re: [PATCH v5 1/6] pinctrl: Add pingroup and define PINCTRL_PINGROUP
Message-ID: <YpdoRFV1SrxbwVDC@smile.fi.intel.com>
References: <20220601121438.999369-1-Basavaraj.Natikar@amd.com>
 <20220601121438.999369-2-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220601121438.999369-2-Basavaraj.Natikar@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 01, 2022 at 05:44:33PM +0530, Basavaraj Natikar wrote:
> Add 'struct pingroup' to represent pingroup and 'PINCTRL_PINGROUP'
> macro for inline use. Both are used to manage and represent
> larger number of pingroups.

LGTM,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Thanks!

> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
>  include/linux/pinctrl/pinctrl.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
> index 70b45d28e7a9..487117ccb1bc 100644
> --- a/include/linux/pinctrl/pinctrl.h
> +++ b/include/linux/pinctrl/pinctrl.h
> @@ -26,6 +26,26 @@ struct pin_config_item;
>  struct gpio_chip;
>  struct device_node;
>  
> +/**
> + * struct pingroup - provides information on pingroup
> + * @name: a name for pingroup
> + * @pins: an array of pins in the pingroup
> + * @npins: number of pins in the pingroup
> + */
> +struct pingroup {
> +	const char *name;
> +	const unsigned int *pins;
> +	size_t npins;
> +};
> +
> +/* Convenience macro to define a single named or anonymous pingroup */
> +#define PINCTRL_PINGROUP(_name, _pins, _npins)	\
> +(struct pingroup){				\
> +	.name = _name,				\
> +	.pins = _pins,				\
> +	.npins = _npins,			\
> +}
> +
>  /**
>   * struct pinctrl_pin_desc - boards/machines provide information on their
>   * pins, pads or other muxable units in this struct
> -- 
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko


