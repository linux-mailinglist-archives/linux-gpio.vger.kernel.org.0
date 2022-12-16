Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCDE564EC70
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Dec 2022 14:58:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230389AbiLPN6A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Dec 2022 08:58:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbiLPN56 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Dec 2022 08:57:58 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D593209B4;
        Fri, 16 Dec 2022 05:57:58 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="383304043"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; 
   d="scan'208";a="383304043"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2022 05:57:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="895252772"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; 
   d="scan'208";a="895252772"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 16 Dec 2022 05:57:53 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1p6BDj-00AskS-0b;
        Fri, 16 Dec 2022 15:57:51 +0200
Date:   Fri, 16 Dec 2022 15:57:50 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Yao Hao <yao.hao@intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 07/11] platform/x86: int3472/discrete: Refactor GPIO
 to sensor mapping
Message-ID: <Y5x5XmIa9nsi8raY@smile.fi.intel.com>
References: <20221216113013.126881-1-hdegoede@redhat.com>
 <20221216113013.126881-8-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221216113013.126881-8-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 16, 2022 at 12:30:09PM +0100, Hans de Goede wrote:
> Add a helper function to map the type returned by the _DSM
> method to a function name + the default polarity for that function.
> 
> And fold the INT3472_GPIO_TYPE_RESET and INT3472_GPIO_TYPE_POWERDOWN
> cases into a single generic case.
> 
> This is a preparation patch for further GPIO mapping changes.

...

> +static void int3472_get_func_and_polarity(u8 type, const char **func, u32 *polarity)

I find a bit strange not making this a function that returns func:

static const char *int3472_get_func_and_polarity(u8 type, u32 *polarity)

> +{
> +	switch (type) {
> +	case INT3472_GPIO_TYPE_RESET:
> +		*func = "reset";
> +		*polarity = GPIO_ACTIVE_LOW;

		return "reset";

etc.

> +		break;
> +	case INT3472_GPIO_TYPE_POWERDOWN:
> +		*func = "powerdown";
> +		*polarity = GPIO_ACTIVE_LOW;
> +		break;
> +	case INT3472_GPIO_TYPE_CLK_ENABLE:
> +		*func = "clk-enable";
> +		*polarity = GPIO_ACTIVE_HIGH;
> +		break;
> +	case INT3472_GPIO_TYPE_PRIVACY_LED:
> +		*func = "privacy-led";
> +		*polarity = GPIO_ACTIVE_HIGH;
> +		break;
> +	case INT3472_GPIO_TYPE_POWER_ENABLE:
> +		*func = "power-enable";
> +		*polarity = GPIO_ACTIVE_HIGH;
> +		break;
> +	default:
> +		*func = "unknown";
> +		*polarity = GPIO_ACTIVE_HIGH;
> +		break;
> +	}
> +}

-- 
With Best Regards,
Andy Shevchenko


