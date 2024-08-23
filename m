Return-Path: <linux-gpio+bounces-9062-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B6395D05F
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 16:49:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C86BA281F61
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 14:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AAAB188585;
	Fri, 23 Aug 2024 14:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YKcLg4V4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914A5186E3B;
	Fri, 23 Aug 2024 14:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724424560; cv=none; b=VXeUgHqYG6iWKxW9GzDNO1AE7NdQGeOTUNHULFv/sAo9DsXRC9vHCh+ZhUBBFoCdZAJ7UZKMTCgkvEkTdGD6ILCZooXSZY9crLVz2deUnIg0GBjdS5/4Y4F5H58lTqvA78DjPv563SN6BAISMO1TARt36elNXBK2J28rJ3ictKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724424560; c=relaxed/simple;
	bh=F1xamHkmCiWIgbmGDKsQayOzdfeCChJxTzpDnXIDvGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PG0fnJXUGRx31UiEaQrlPPdcQ0I/EDA0WIR5sJT27d829n7EJMwljpVFqXs98IhDDgqpkDLIrXQGmd+ntphfaI1iZo18JdXqkUf/vJrqivSbfaaXHYVTY8c3yzMqpOesSDJQNyvxHyLfas1a++21fvgnIk8Fiu2Jy+pNpKanw3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YKcLg4V4; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724424560; x=1755960560;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=F1xamHkmCiWIgbmGDKsQayOzdfeCChJxTzpDnXIDvGc=;
  b=YKcLg4V4c9ODGwRoGOUhbwZBFyXMJ1bdIaDsZ1RcCPEYx3JRFphZF6Oe
   9U+Go8yuLpynjUuFesM29PT2BDQwt9Gn4EJgvzMw3I7M/abRDl3mNhnmn
   d2wncx6ui1MJpxRDmDbFfC4bDpus4cJJ8BG6AKlauW379qCJU0IALgSCH
   YKRgzRwhjin03NOn8uddI0cjxwKYbpCa0eHk0ucdQeoZ5SWAx0udVCmUF
   EITDm1oCicl1bcg71nnMRcQjDXBtdujJ/QiRbtKzx/H3ZvuRRkkAhQTyo
   /qL63W6fNeM+7/+cOlTPq+ExHuMx270hheyT1mVTvqSkixUYZL7RjLP5q
   A==;
X-CSE-ConnectionGUID: zeiUCTvwTtSrb3W5pekfmQ==
X-CSE-MsgGUID: RRX3DDf0TeezA6agdOBX1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22861432"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="22861432"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 07:49:19 -0700
X-CSE-ConnectionGUID: NnZPkaVTTAa4ZTeJQ8odGw==
X-CSE-MsgGUID: RN6n3lZNRiCpKSvSSGi7Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="92611103"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 07:49:15 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1shVbF-00000000pFB-1A2I;
	Fri, 23 Aug 2024 17:49:13 +0300
Date: Fri, 23 Aug 2024 17:49:13 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Ye Zhang <ye.zhang@rock-chips.com>, linus.walleij@linaro.org,
	brgl@bgdev.pl, heiko@sntech.de, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com, tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com
Subject: Re: [PATCH v2] gpio: rockchip: resolve overflow issues
Message-ID: <ZsihaV40J6RjJRvl@smile.fi.intel.com>
References: <20240823034314.62305-1-ye.zhang@rock-chips.com>
 <20240823034314.62305-4-ye.zhang@rock-chips.com>
 <f2194489-c637-4034-9077-951f74d621a5@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f2194489-c637-4034-9077-951f74d621a5@rock-chips.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Aug 23, 2024 at 06:59:40PM +0800, Shawn Lin wrote:
> 在 2024/8/23 11:43, Ye Zhang 写道:

...

> > -		max_debounce = (GENMASK(23, 0) + 1) * 2 * 1000000 / freq;
> > +		div = (u64)(GENMASK(23, 0) + 1) * 2 * 1000000;
> > +		max_debounce = DIV_ROUND_CLOSEST_ULL(div, freq);
> 
> can't max_debounce = DIV_ROUND_CLOSEST_ULL((GENMASK(23, 0) + 1) * 2 *
> 1000000, freq) work?

Wouldn't be too long line in this case?

-- 
With Best Regards,
Andy Shevchenko



