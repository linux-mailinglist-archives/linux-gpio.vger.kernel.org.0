Return-Path: <linux-gpio+bounces-28378-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7BCC514F5
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 10:20:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3DE6E4F5C20
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 09:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7839C2FD7A0;
	Wed, 12 Nov 2025 09:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hyJxiRZt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D982D0C9C;
	Wed, 12 Nov 2025 09:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762938950; cv=none; b=ZsUKvPeOud2BvJKdBAGBoCSDzs8O7BtoZ976QmIrfVRgMCiUHTlzKu4tsvZq+bDuIKJ8am0f2+6eDByWmPwQxFPDbKdqvIJ3tlg1Df3ZvYOFIaHA8kFBNoU6AFyYWMJo3gNSZTkLj/6Vo5EtOIOIVdmaZCPGZ4HvoNozoDyU/jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762938950; c=relaxed/simple;
	bh=XbY1+QXZkG156kRPTP5Y/1sq95brW261QGUMPJl1zGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rwxWB4GnCkwsRrfvGNwB1w6H4LcXQkJu2ij2pKPKF8p62xjqcHT6n1wbfwhLYsVvtL7BsUnGJFnv+S/Snl5OdbXrv0r5mbpTnkkxN375AHhDhvNKu8NsNuOgXn27/Zh/+KSaRxDrmYI/6CjGG6L/eovxo7o1fRW07QSedDmN39c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hyJxiRZt; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762938949; x=1794474949;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XbY1+QXZkG156kRPTP5Y/1sq95brW261QGUMPJl1zGc=;
  b=hyJxiRZto1rIiMPjXKcuTWeAQMZ+2zSmXu41mMHctR0pAZF/Vt9HvE67
   IfC9+j1w9B4GJdyul9u3Kk4W9Wr9isCQ2rfec6RfHY6qwWjhcf1r6+8dF
   9g1zYV3M+yB97TuvJrNbxLfKtt7lHa+5Ey6dhg5uNTvvIm54g6pyEVgUR
   k+wbdMjy7rh9jdt9998ZCwLx0Afxi83T7TbjI7GHnlPpd94VnN2IhEFVc
   fWMNGgT2wt4RRBezf2iT8FmML6+6FlrVlmmH1CnuFJOZHqsfBRtH92EyW
   H3pKzG8KAh8AUD0qxorDL48XAy2/MJBo659MPNXGiOFGPRWdY8rVNf0qT
   A==;
X-CSE-ConnectionGUID: oCBg2JEFRBGHL0MI55YDCA==
X-CSE-MsgGUID: FmHX4lPXRrWXSA4Ww9rdxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="68848075"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="68848075"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 01:15:48 -0800
X-CSE-ConnectionGUID: Oxk1tKr+SpKVERawQuJJwQ==
X-CSE-MsgGUID: GueRUBMeQ0amt8bBvXYp8g==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 12 Nov 2025 01:15:44 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 7A86F95; Wed, 12 Nov 2025 10:15:43 +0100 (CET)
Date: Wed, 12 Nov 2025 10:15:43 +0100
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>
Subject: Re: [PATCH v2 0/3] ASoC: codec: Convert to GPIO descriptors for
 tlv320aic32x4
Message-ID: <aRRQPz6xZyHJDps-@black.igk.intel.com>
References: <20250710-asoc-gpio-1-v2-0-2233b272a1a6@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-asoc-gpio-1-v2-0-2233b272a1a6@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Jul 10, 2025 at 08:40:00PM +0800, Peng Fan wrote:
> This patchset is a pick up of patch 1,2 from [1]. And I also collect
> Linus's R-b for patch 2. After this patchset, there is only one user of
> of_gpio.h left in sound driver(pxa2xx-ac97).
> 
> of_gpio.h is deprecated, update the driver to use GPIO descriptors.
> 
> Patch 1 is to drop legacy platform data which in-tree no users are using it
> Patch 2 is to convert to GPIO descriptors
> 
> Checking the DTS that use the device, all are using GPIOD_ACTIVE_LOW
> polarity for reset-gpios, so all should work as expected with this patch.
> 
> [1] https://lore.kernel.org/all/20250408-asoc-gpio-v1-0-c0db9d3fd6e9@nxp.com/

Peng, if you are still interested in continuing this task, you can focus on
converting the drivers that use gpio_request_one() and devm_gpio_request_one().
These are some like a couple of dozens only (in comparison to the gpio_request()
and devm_gpio_request() users). Some of them are resided in the ASoC subsystem.

-- 
With Best Regards,
Andy Shevchenko



