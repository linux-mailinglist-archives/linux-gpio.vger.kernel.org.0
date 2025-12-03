Return-Path: <linux-gpio+bounces-29232-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 537C7C9F5B2
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Dec 2025 15:51:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 0A2863000751
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Dec 2025 14:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAE3D303A35;
	Wed,  3 Dec 2025 14:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UN0UYRTw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC482FD7D0;
	Wed,  3 Dec 2025 14:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764773456; cv=none; b=Lw95Zg2mM/mm1H88PJgVX0PyExTSVl2aE0Kq4FEw1FKWkq5g/cz/ftMkdZcnW0m3Oq3Yu9Gvn8jVqgIBr8AEAA7bKcV3jGhT84UdkOsLCc7SmFAo8AWnDmhU/aLm4HQmiv1CF8Bmh/PDvvY88a/8nVxG322OkTjM6WxrqUbtl1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764773456; c=relaxed/simple;
	bh=kpKsNuv/M14kMHEwlroh3MkGzoI18xDNnuSoAlkfBr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jvJF0lELF5MjGwj0ppBnNoeWSL74buMtjRDuTm7hhne6+H8Y4pWE5+Ool+0JWC0LXcf0uFsKrHMQHRrAAFlQUsQeUeAvzy1NUaKntSQjpnvy+09raJw0Cb9IgeC5K5snUVL94lVwAZcqHjI96Oo1HhfnlgjmIGNX1vMprisKAmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UN0UYRTw; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764773455; x=1796309455;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kpKsNuv/M14kMHEwlroh3MkGzoI18xDNnuSoAlkfBr0=;
  b=UN0UYRTwzeC7xnoeh38aMhBKqpXCzPjWHRc2HZkGJMt5Zx3bB2XxChfS
   lLbLPLkIrLzTe1sGBgxSUbQOP5PZDcXD6+x7vqE3qnV6XOyjC8bu6N9FN
   U8JCPjD2GYi125yqILM72Fjaz9h4P0yjRbmmPveHlcbbbVCytN9+NQAhh
   +KkhLTarpGmql9Xvx3fnvlGnEdunVHrMMHEtBQAb6XT4EEnB1iHenDTGG
   KlPkeApzCmx85Metpq9cyeLO4DKT5DijodONMSUxIQ0XGBa84XKTzvZLw
   YZfoYD2tPD9OCLw55fp60g/VqihXGHBq/rkU8WyiqnWtIx5oDbyAlOheL
   Q==;
X-CSE-ConnectionGUID: dGtShD1hT5edAdHOcSuFAQ==
X-CSE-MsgGUID: PDv4Svq9RtedbJisoyZprg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66655347"
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; 
   d="scan'208";a="66655347"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 06:50:54 -0800
X-CSE-ConnectionGUID: x359yWRaQVqWnQv/Yr/fRw==
X-CSE-MsgGUID: PeIchV1iRsSSjQ1/fBDIyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; 
   d="scan'208";a="194735353"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.245.81])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 06:50:51 -0800
Date: Wed, 3 Dec 2025 16:50:49 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wentao Guan <guanwentao@uniontech.com>
Cc: brgl@kernel.org, mathieu.dubois-briand@bootlin.com,
	ioana.ciornei@nxp.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, zhanjun@uniontech.com,
	niecheng1@uniontech.com, stable@vger.kernel.org,
	WangYuli <wangyl5933@chinaunicom.cn>
Subject: Re: [PATCH v2] gpio: regmap: Fix memleak in gpio_remap_register
Message-ID: <aTBOSfH9KyI0epZB@smile.fi.intel.com>
References: <20251203141557.2652348-1-guanwentao@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203141557.2652348-1-guanwentao@uniontech.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Dec 03, 2025 at 10:15:58PM +0800, Wentao Guan wrote:
> We should call gpiochip_remove(chip) to free the resource
> alloced by gpiochip_add_data(chip, gpio) after the err path.

> Fixes: 553b75d4bfe9 ("gpio: regmap: Allow to allocate regmap-irq device")

As I told in v1, add the other Fixes tag, to show that the code was modified
and this change has a dependency to that.

...

With that done, it LGTM.

-- 
With Best Regards,
Andy Shevchenko



