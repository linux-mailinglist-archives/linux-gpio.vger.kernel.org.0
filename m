Return-Path: <linux-gpio+bounces-1365-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 388818113D3
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 14:57:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E281B1F22B75
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 13:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E83D42E405;
	Wed, 13 Dec 2023 13:57:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A271E49E2;
	Wed, 13 Dec 2023 05:55:40 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="2104255"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="2104255"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 05:54:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="864636987"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="864636987"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 05:54:56 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rDPhO-00000005XYC-0NhR;
	Wed, 13 Dec 2023 15:54:54 +0200
Date: Wed, 13 Dec 2023 15:54:53 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, brgl@bgdev.pl,
	linus.walleij@linaro.org
Subject: Re: [PATCH 1/4] gpiolib: cdev: relocate debounce_period_us from
 struct gpio_desc
Message-ID: <ZXm3rayrcvfO1t1Z@smile.fi.intel.com>
References: <20231212054253.50094-1-warthog618@gmail.com>
 <20231212054253.50094-2-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212054253.50094-2-warthog618@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Dec 12, 2023 at 01:42:50PM +0800, Kent Gibson wrote:
> Store the debounce period for a requested line locally, rather than in
> the debounce_period_us field in the gpiolib struct gpio_desc.
> 
> Add a global tree of lines containing supplemental line information
> to make the debounce period available to be reported by the
> GPIO_V2_GET_LINEINFO_IOCTL and the line change notifier.

...

>  struct line {
>  	struct gpio_desc *desc;
> +	struct rb_node node;

If you swap them, would it benefit in a code generation (bloat-o-meter)?

>  };

...

> +struct supinfo {
> +	spinlock_t lock;
> +	struct rb_root tree;
> +};

Same Q.

...

> +static struct supinfo supinfo;

Why supinfo should be a struct to begin with? Seems to me as an unneeded
complication.

...

> +			pr_warn("%s: duplicate line inserted\n", __func__);

I hope at bare minimum we have pr_fmt(), but even though this is poor message
that might require some information about exact duplication (GPIO chip label /
name, line number, etc). Generally speaking the __func__ in non-debug messages
_usually_ is a symptom of poorly written message.

...

> +out_unlock:
> +	spin_unlock(&supinfo.lock);

No use of cleanup.h?

...

> +static inline bool line_is_supplemental(struct line *line)
> +{
> +	return READ_ONCE(line->debounce_period_us) != 0;

" != 0" is redundant.

> +}

...

>  	for (i = 0; i < lr->num_lines; i++) {
> -		if (lr->lines[i].desc) {
> -			edge_detector_stop(&lr->lines[i]);
> -			gpiod_free(lr->lines[i].desc);
> +		line = &lr->lines[i];
> +		if (line->desc) {

Perhaps

		if (!line->desc)
			continue;

?

> +			edge_detector_stop(line);
> +			if (line_is_supplemental(line))
> +				supinfo_erase(line);
> +			gpiod_free(line->desc);
>  		}
>  	}

...

> +static int __init gpiolib_cdev_init(void)
> +{
> +	supinfo_init();
> +	return 0;
> +}

It's a good practice to explain initcalls (different to the default ones),
can you add a comment on top to explain the choice of this initcall, please?

> +postcore_initcall(gpiolib_cdev_init);

-- 
With Best Regards,
Andy Shevchenko



