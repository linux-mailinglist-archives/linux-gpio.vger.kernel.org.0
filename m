Return-Path: <linux-gpio+bounces-9065-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A19095D080
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 16:59:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25AD31C219E9
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 14:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBD9818859A;
	Fri, 23 Aug 2024 14:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f1PtZ2U2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAC51885AB;
	Fri, 23 Aug 2024 14:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724425150; cv=none; b=nJTswgPkFHGdQ2/cAlAcqjtg8IKGV2+d4unU5KuIyypNV2h9ejkKjjEHTLZrPEYIqsw8kUWSnPc6lWm81jD1Hhs5Yg2m3oYxBxbmSi3lmrni6VA4lxZhgUrMbyauQV3zig68ujM1r/DS5GS25YA0XtEaPc6HMlTr+GfqwwbvgOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724425150; c=relaxed/simple;
	bh=dAF4EzAJlty3UqKFmsn5bGOq7/BaOfcncLQBYgpR638=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YzkVfDBAUPbGF8DsHhy65sR1/2mDGe8P6Q2npgaNCG1SwkbWvd3M5ZkOiVOwYNEpizvmXbqsu/xh4DWkxh7qs9M4x7ocRj03Kxc06iife4gEfhvAJ0r3roue370rWvzsDetvbq+bWYvXRhDLnZ+NBJYlJP5283SP2l6f/uQ3+Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f1PtZ2U2; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724425149; x=1755961149;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dAF4EzAJlty3UqKFmsn5bGOq7/BaOfcncLQBYgpR638=;
  b=f1PtZ2U2Oi5fPZAdiknnJMDen0P/rV0euRWr1ilYv7FNVs2QMsJ9i/Vl
   lmm5/4gYrXxiA2JtxJvKpgOeIpGjBMCqpdfpx1mEVjJFbTmHvpZFizHfY
   hR6mjorw2+5aB8nOtycLNanlbJUmKnM5RlQe64cUTNkgqEV1SZmqEVOu4
   J3PEU5dIsay5jYVLy15vMgOZ5dP0sqVcZka8SsO3yooJ2srpWsCEDTJZp
   se+6KkN/ZSdEf4c2Z9bl8zwEHle+VuHqQX5f3XdUpOrkJi3eG1noqqqI+
   K7yMUxIn16Nu71Lw2duAZWeSNCHcZ6bQN0/lfOivS7WGEmt70bUHMsbzJ
   A==;
X-CSE-ConnectionGUID: 23OhWI98TgKy61WKh7H18g==
X-CSE-MsgGUID: wkemRf5/RuetemN02WHMlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="48289605"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="48289605"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 07:59:08 -0700
X-CSE-ConnectionGUID: brUjEvKwQ/WiUdboLXGsbQ==
X-CSE-MsgGUID: 3YXQdEUZSwyvEZeNFk68LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="62334764"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 07:59:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1shVkk-00000000pPA-1D25;
	Fri, 23 Aug 2024 17:59:02 +0300
Date: Fri, 23 Aug 2024 17:59:01 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, heiko@sntech.de,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com, tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com
Subject: Re: [PATCH v2] gpio: rockchip: Set input direction when request irq
Message-ID: <ZsijtURSzEWKCqHk@smile.fi.intel.com>
References: <20240823034314.62305-1-ye.zhang@rock-chips.com>
 <20240823034314.62305-10-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823034314.62305-10-ye.zhang@rock-chips.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Aug 23, 2024 at 11:43:12AM +0800, Ye Zhang wrote:
> Since the GPIO can only generate interrupts when its direction is set to
> input, it is set to input before requesting the interrupt resources.

...

> +	rockchip_gpio_direction_input(&bank->gpio_chip, d->hwirq);
> +
>  	return gpiochip_reqres_irq(&bank->gpio_chip, d->hwirq);

In both cases you want to use irq_hw_number_t and irqd_to_hwirq() at the top of
the function(s).

-- 
With Best Regards,
Andy Shevchenko



