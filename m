Return-Path: <linux-gpio+bounces-6210-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB858BEAAF
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 19:38:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DBCB1F2603A
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 17:38:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD5916C84A;
	Tue,  7 May 2024 17:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ofcfxa5m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E886E570;
	Tue,  7 May 2024 17:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715103510; cv=none; b=MviX0XFS7nGI12OJ3GrPk86AjHpEprHbdP1rSOvTmbpnpT4mEzBAQeDKqt4GQRkbmfOQ1hRQVBCmMK/9K8M+UsWzY+Oq19VW6Cv/O7ZvOrYMz0baMESSHuwJxm69H7XzgJT4ytmEbBDuJXK7M3nULHeZIFELcPdqWUxa4rVbLi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715103510; c=relaxed/simple;
	bh=ky4yOz8ouS/xKriszP9tvW2GJTNUSiRNmFbQwPvPBWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FoS4hNrZ8j2omhe8Z8rxIffK0ZhtzeqXXDF/HJQeyKzZqU746yhCsatw1kTzU2OaL5vKQ6tKpfV8ezNeBQPlV4miEGcKP/aFbQNgi0B1Y7gBIQiptBUwBZHYyU4XPDRB8x9qq0hDISEwc3DoPbpgt77SrigbdOHaXcPH119nVg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ofcfxa5m; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715103508; x=1746639508;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ky4yOz8ouS/xKriszP9tvW2GJTNUSiRNmFbQwPvPBWg=;
  b=Ofcfxa5mjssfgf4GKiXjcqgrs32eFnI+tfzzrBTPKRpFPohOjYoP+Kgf
   fV3+hBR+FrXqvhALhgXaxhp1pEOIfAz6jnVmRDZR4WpuLn7Cyvae3p3U3
   wMFDQMVrL+imJkNetVPkNAwKjnN1AwCeICFaq5bdFPsN99vx4dnInme4+
   Tx6rodIand71j57811mKXtZ0t3YnW0q8xuM0+ubm9w1OV9NcO9v3cmJ9z
   wuEi3vdIiHxLoIU6pQ3hI+SZDau+GyTqUOiziacOzcAzVjmoMCpsDthvD
   ac08MYWwcSRhKqbFISYCdDowtQX++7d9TO/R0wyHJH40lsHt4642StQdW
   w==;
X-CSE-ConnectionGUID: rUl9Te5FSL+DRxkHLR8DZQ==
X-CSE-MsgGUID: uWXgElVhT+qY5xuANqOxHQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="11414138"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; 
   d="scan'208";a="11414138"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 10:38:27 -0700
X-CSE-ConnectionGUID: Ka8MIClYQl2/10Rx24iguA==
X-CSE-MsgGUID: SJ7gsFyPQnqhxoXyIPeuKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; 
   d="scan'208";a="66029789"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 10:38:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1s4Oli-000000058gR-0AkX;
	Tue, 07 May 2024 20:38:22 +0300
Date: Tue, 7 May 2024 20:38:21 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	"Paul E . McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] gpiolib: fix the speed of descriptor label setting with
 SRCU
Message-ID: <ZjpnDTXUSYCOAFRz@smile.fi.intel.com>
References: <20240507121346.16969-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240507121346.16969-1-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, May 07, 2024 at 02:13:46PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Commit 1f2bcb8c8ccd ("gpio: protect the descriptor label with SRCU")
> caused a massive drop in performance of requesting GPIO lines due to the
> call to synchronize_srcu() on each label change. Rework the code to not
> wait until all read-only users are done with reading the label but
> instead atomically replace the label pointer and schedule its release
> after all read-only critical sections are done.

> To that end wrap the descriptor label in a struct that also contains the
> rcu_head struct required for deferring tasks using call_srcu() and stop
> using kstrdup_const() as we're required to allocate memory anyway.

If there is no label and we assign something like "?" (two bytes) we got
with your patch the allocation of most likely 32 bytes (as next power of
two for the SLAB) instead of 18..24.

OTOH, I dunno if SLAB supports 24-bytes. If not, it means that up to 16 bytes
label there would be no difference. In any case, with a new update (as far
as I understood the next move) it might return to kstrdup_const() or so.

> Just allocate enough for the label string and rcu_head in one go.

-- 
With Best Regards,
Andy Shevchenko



