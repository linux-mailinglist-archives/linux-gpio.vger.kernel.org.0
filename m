Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CE3A62DBEA
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 13:48:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233502AbiKQMsY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 07:48:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239846AbiKQMsE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 07:48:04 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F0D449081
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 04:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668689248; x=1700225248;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IvmIHQIYxKthG2FGdVo05zuyOfYkJJRH7dNjlUMHhcw=;
  b=gtuNDIBtI8uypLKruHUuZ4eDTyZLoX+qYgXN6n1tgiqX1gfKBohkWBlu
   q9d8p7fZNLR8nBbbIgb164ExKUHDrSsWZu4b1hpahz3bbAE+P3u3F6+yy
   BJOh54/r8vyFS9VuDDLa4rnTmCvOgbnSC4AQUtjzavy/CaBwLCYxGaN+n
   9266PEyH30QgsWZj1ieIQ4uy4p2+WeRQRmF65roPgv3S4ewwS0ChKMfaG
   VJAlD0KsKWjwFiL7svoxcfsn4ShtTNauUypxPGmB+LinEokSbVN8PjLKP
   S3aH54iilsXX9MtQVvP+dnJk1JJnIj+6rnwFnUrkCfSDQZZgdiimnbza/
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="311543981"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; 
   d="scan'208";a="311543981"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2022 04:47:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="639790716"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; 
   d="scan'208";a="639790716"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 17 Nov 2022 04:47:25 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oveIe-00DZdq-1k;
        Thu, 17 Nov 2022 14:47:24 +0200
Date:   Thu, 17 Nov 2022 14:47:24 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Niyas Sait <niyas.sait@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linus.walleij@linaro.org
Subject: Re: [PATCH] pinconf-generic: fix style issues in pin_config_param doc
Message-ID: <Y3YtXKbmNz5cu5I6@smile.fi.intel.com>
References: <20221117123542.1154252-1-niyas.sait@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221117123542.1154252-1-niyas.sait@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 17, 2022 at 12:35:42PM +0000, Niyas Sait wrote:
> Fixes following issues introduced in a  previous commit
> to clarify values for pin config pull up and down types.
> 
> - replace spaces with tabs to be consistent with rest of the doc
> - use capitalization for unit (ohms -> Ohms)

Thank you!

Either folded or separated
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Niyas Sait <niyas.sait@linaro.org>
> ---
>  include/linux/pinctrl/pinconf-generic.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
> index 11e7394bcc70..537064a997a5 100644
> --- a/include/linux/pinctrl/pinconf-generic.h
> +++ b/include/linux/pinctrl/pinconf-generic.h
> @@ -36,7 +36,7 @@ struct pinctrl_map;
>   * @PIN_CONFIG_BIAS_PULL_DOWN: the pin will be pulled down (usually with high
>   *	impedance to GROUND). If the argument is != 0 pull-down is enabled,
>   *	the value is interpreted by the driver and can be custom or an SI unit
> - *  such as ohms.
> + *  	such as Ohms.
>   * @PIN_CONFIG_BIAS_PULL_PIN_DEFAULT: the pin will be pulled up or down based
>   *	on embedded knowledge of the controller hardware, like current mux
>   *	function. The pull direction and possibly strength too will normally
> @@ -48,7 +48,7 @@ struct pinctrl_map;
>   * @PIN_CONFIG_BIAS_PULL_UP: the pin will be pulled up (usually with high
>   *	impedance to VDD). If the argument is != 0 pull-up is enabled,
>   *	the value is interpreted by the driver and can be custom or an SI unit
> - *  such as ohms.
> + *	such as Ohms.
>   * @PIN_CONFIG_DRIVE_OPEN_DRAIN: the pin will be driven with open drain (open
>   *	collector) which means it is usually wired with other output ports
>   *	which are then pulled up with an external resistor. Setting this
> -- 
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko


