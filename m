Return-Path: <linux-gpio+bounces-1474-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F54D8133A6
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 15:53:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52C28282E4C
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 14:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7DBB5B5A0;
	Thu, 14 Dec 2023 14:53:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78F38121;
	Thu, 14 Dec 2023 06:53:39 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="2288515"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="2288515"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 06:53:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="897768617"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="897768617"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 06:53:37 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rDn5i-00000005s64-2QaF;
	Thu, 14 Dec 2023 16:53:34 +0200
Date: Thu, 14 Dec 2023 16:53:34 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, brgl@bgdev.pl,
	linus.walleij@linaro.org
Subject: Re: [PATCH v2 1/5] gpiolib: cdev: adopt scoped_guard()
Message-ID: <ZXsW7hsetst56K-b@smile.fi.intel.com>
References: <20231214095814.132400-1-warthog618@gmail.com>
 <20231214095814.132400-2-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231214095814.132400-2-warthog618@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Dec 14, 2023 at 05:58:10PM +0800, Kent Gibson wrote:
> Use scoped_guard for critical sections rather than distinct

scoped_guard()

> lock/unlock pairs.

...

> -	mutex_lock(&lr->config_mutex);
> -
> -	ret = linereq_set_values_unlocked(lr, &lv);
> -
> -	mutex_unlock(&lr->config_mutex);
> +	scoped_guard(mutex, &lr->config_mutex)
> +		ret = linereq_set_values_unlocked(lr, &lv);
>  
>  	return ret;

In this case it can be guard()

	guard(...)(...);

	return linereq_...

...

> -	mutex_lock(&lr->config_mutex);
> -
> -	ret = linereq_set_config_unlocked(lr, &lc);
> -
> -	mutex_unlock(&lr->config_mutex);
> +	scoped_guard(mutex, &lr->config_mutex)
> +		ret = linereq_set_config_unlocked(lr, &lc);
>  
>  	return ret;

Ditto.

-- 
With Best Regards,
Andy Shevchenko



