Return-Path: <linux-gpio+bounces-9679-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F87296A393
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 18:04:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE9ED286CF7
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 16:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8997189526;
	Tue,  3 Sep 2024 16:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fVjquy/z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362237462;
	Tue,  3 Sep 2024 16:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725379444; cv=none; b=rXnGuiJ5LgSrvIKDPUgSCXKDXUNcYvc8E0BBHHhU6PP1xZzrOZFWkQXQhqHF94QIW5px+5Feni01ZO011zSXBFY0j/0qet6o7csBMHal0D2qh+YHi6rlz9XG2pyouS6XSZA/lOi4BRs4D7KHRj55pWnNbijKQ8mYZ+/myV73hmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725379444; c=relaxed/simple;
	bh=Mc0S8w2RG3QSElgGbwBKLQz1QJN0TSNiZ8BtMzE0Kmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Df4fa0iCXWW8YopUO9l5yqXhhHRaOVBrTxBU1VuUcRPGlAvqwS0gmtIIlqfO3+tTvovmUc81YjrzJd9+tLaBPtQjmG/em77Mh4hj0bFkGAyjAiGg2Pzy7ljHBBBfPuskRiTjUkKeWlZLNoERSYEvt+wUYmz8V7IWBuPoDBNmg7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fVjquy/z; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725379443; x=1756915443;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Mc0S8w2RG3QSElgGbwBKLQz1QJN0TSNiZ8BtMzE0Kmk=;
  b=fVjquy/zIHZWYWQsyuDBXIVVoDmP/d7pVhK+oTS5CaboNgKg4C1XnrPq
   WxcSJxng6tbJSVdlpiPhJYCdhJwKMB+bwcoyqxFRI0KwA/z/01F1YgXgf
   NymU8E+kRo/3vErWSJEQZiad8753JBvyW04d98jo8BlJx/58JoXQoWuLk
   3/FwHN2aRViHPm7ysfWA4gwM1dvbQbk07oxeBfqqCOHLm6fd2XMzoQd7Q
   1IZQKetQVtMr86tNJkVQI2m25Rc5ytiGZHu5K0Ec/f4r7DHdllZxkrKWu
   IgA0/GL9vwmtlwAagiVrrdG6lvNj90WEYLPQ58XaKbXM0RFOL52qA/Njk
   g==;
X-CSE-ConnectionGUID: xl9GmwfbT7GpOYSStX529g==
X-CSE-MsgGUID: VJhGvPVIRm+591JCnUEDsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="41461125"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="41461125"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 09:04:03 -0700
X-CSE-ConnectionGUID: eqId1xXRQWu/QFPJA3nZiQ==
X-CSE-MsgGUID: iakGxm0qQqWKfafTWs3oxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="65179232"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 09:03:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1slW0M-00000004lL1-1ez1;
	Tue, 03 Sep 2024 19:03:42 +0300
Date: Tue, 3 Sep 2024 19:03:42 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, heiko@sntech.de,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com, tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com
Subject: Re: [PATCH v3 08/12] gpio: rockchip: explan the format of the GPIO
 version ID
Message-ID: <ZtczXu-gnbwBp01w@smile.fi.intel.com>
References: <20240903073649.237362-1-ye.zhang@rock-chips.com>
 <20240903073649.237362-9-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903073649.237362-9-ye.zhang@rock-chips.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Sep 03, 2024 at 03:36:45PM +0800, Ye Zhang wrote:
> Remove redundant comments and provide a detailed explanation of the
> GPIO version ID.

"explain" in the Subject.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
(and maybe others)

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Bart, I think this one is good to go (with spelling fix). And it makes these
values to be described which looks like a win to me.

-- 
With Best Regards,
Andy Shevchenko



