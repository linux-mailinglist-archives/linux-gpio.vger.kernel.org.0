Return-Path: <linux-gpio+bounces-1477-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC6D8133D5
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 16:03:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDCF71C218F0
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 15:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9213B5B5C6;
	Thu, 14 Dec 2023 15:03:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B57E115;
	Thu, 14 Dec 2023 07:03:09 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="375285976"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="375285976"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 07:03:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="750560273"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="750560273"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 07:03:06 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rDnEt-00000005sDd-1JJ6;
	Thu, 14 Dec 2023 17:03:03 +0200
Date: Thu, 14 Dec 2023 17:03:03 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, brgl@bgdev.pl,
	linus.walleij@linaro.org
Subject: Re: [PATCH v2 2/5] gpiolib: cdev: relocate debounce_period_us from
 struct gpio_desc
Message-ID: <ZXsZJ9z7iln8uMf8@smile.fi.intel.com>
References: <20231214095814.132400-1-warthog618@gmail.com>
 <20231214095814.132400-3-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231214095814.132400-3-warthog618@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Dec 14, 2023 at 05:58:11PM +0800, Kent Gibson wrote:
> Store the debounce period for a requested line locally, rather than in
> the debounce_period_us field in the gpiolib struct gpio_desc.
> 
> Add a global tree of lines containing supplemental line information
> to make the debounce period available to be reported by the
> GPIO_V2_GET_LINEINFO_IOCTL and the line change notifier.

...

> +/*
> + * Used to populate gpio_v2_line_info with cdev specific fields not contained
> + * in the struct gpio_desc.
> + * A line is determined to contain supplemental information by
> + * line_is_supplemental().
> + */
> +static struct {
> +	/* a rbtree of the struct lines containing the supplemental info */
> +	struct rb_root tree;
> +	/* covers tree */
> +	spinlock_t lock;
> +} supinfo;

...

> +static void supinfo_init(void)
> +{
> +	supinfo.tree = RB_ROOT;
> +	spin_lock_init(&supinfo.lock);
> +}

Can it be done statically?

supinfo = {
	.tree = RB_ROOT,
	.lock = __SPIN_LOCK_UNLOCKED(supinfo.lock),
};

...

> +static int __init gpiolib_cdev_init(void)
> +{
> +	supinfo_init();
> +	return 0;
> +}

A comment why it's postcore initcall?

/* postcore initcall is chosen because ... */

> +postcore_initcall(gpiolib_cdev_init);

-- 
With Best Regards,
Andy Shevchenko



