Return-Path: <linux-gpio+bounces-21338-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A729AD4E7C
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 10:33:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1115189D552
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 08:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5205623C4F9;
	Wed, 11 Jun 2025 08:33:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AC82367C0;
	Wed, 11 Jun 2025 08:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749630804; cv=none; b=ktpF0913a1djQ7BaYEW0cpFEo6V1W95NcaV2ESd/nKEEhByamvJ4KbZ9xgE0wpxAIcFx7oknIOYdMc3GLLZf6vasvbJuJcVlH/LPljOclW3CBYeER7f/erJdJ63yVfMR7/prnhUqtkiWt1MKUz8YrLPtuwRDJhrkzTHRiDmn2SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749630804; c=relaxed/simple;
	bh=9qIeq0lwD11SajOmjAAdep/mgqublORICUD/w+3z/6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l8BnZeWrJmExvXXTumjE1Qt+pKS8fTkoNECd1JSrbcifX5Us9qNUyncHy5/wKNkQGx03Wp09C5Yo9brX/r/X/KsIfzgReokhZNzfFSC2ve+RBwIAKM43PnEa/sa5IZfZPMFvB0Cnpumxm1ljL8QhhKmacRaIDv0gJWicpEreymo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: 4Og5Og7SSIGKWX/AB5wX2A==
X-CSE-MsgGUID: JVNGOMfMQjqyrWZmegSZ2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="62045192"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="62045192"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 01:33:22 -0700
X-CSE-ConnectionGUID: YNrDiN87Sw+pTQCPf/h22w==
X-CSE-MsgGUID: A7EgxSrITtOvetlXgx+cXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="152272493"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 01:28:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1uPGoj-00000005aKk-3uEg;
	Wed, 11 Jun 2025 11:28:17 +0300
Date: Wed, 11 Jun 2025 11:28:17 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 0/4] pinctrl: intel: use new GPIO line value setter
 callbacks
Message-ID: <aEk-ISpDdGv5EGJE@smile.fi.intel.com>
References: <20250610-gpiochip-set-rv-pinctrl-intel-v1-0-d7a773ff864e@linaro.org>
 <aEiVsrtfzK1rkgUI@smile.fi.intel.com>
 <20250611043626.GD2063270@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611043626.GD2063270@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Jun 11, 2025 at 07:36:26AM +0300, Mika Westerberg wrote:
> On Tue, Jun 10, 2025 at 11:29:38PM +0300, Andy Shevchenko wrote:
> > On Tue, Jun 10, 2025 at 02:58:46PM +0200, Bartosz Golaszewski wrote:
> > > Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> > > values") added new line setter callbacks to struct gpio_chip. They allow
> > > to indicate failures to callers. We're in the process of converting all
> > > GPIO controllers to using them before removing the old ones. This series
> > > converts all GPIO chips in intel pin control drivers.
> > 
> > I'll wait for Mika's Ack and apply, the material LGTM, thanks!
> 
> Looks good to me too,
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko



