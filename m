Return-Path: <linux-gpio+bounces-21275-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0159AD43BE
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 22:29:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2141189D01A
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 20:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF8892652A4;
	Tue, 10 Jun 2025 20:29:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0225719A2A3;
	Tue, 10 Jun 2025 20:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749587384; cv=none; b=DEgs+OhqZ3umr1wgUmo0ByH31SsZ1CfqxV/NdqJ6ETpFwPgv+Z783gqexXJYCpxvvXkS3zLTOtsv5ThtL/xHJVKbTuO2BISz3zxCDWrIyyIFVkGWHRkP1lwN7qLidrj4Rc3dLEP71lUD2dM1S12Ww3sqjXuwcjvl78KDydLu+Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749587384; c=relaxed/simple;
	bh=aq5F974Dlkt92pheOwdKoezDgvl3GtLIMX/y5CQEgu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CNVIHiXOlWKTT8HNqvJ/Rrfq3rA6iLi3zW3xfOzkHYwl9tFWZDMs4xWnPO2uWdAlVKYXu0/vcQdNkMAkILeoTEnJCkGSrhZTLwMB9GVoUD5w35FQIp5ZpfhSbGiA3WFBCYpqICJef5XG8jo3cloO5VFSrulRhL0BF7ISOUTtQhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: AF76AwIeR92Jmkcs2HLwOA==
X-CSE-MsgGUID: djwHam3cRYahnCg5kfmOkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51812487"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="51812487"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 13:29:43 -0700
X-CSE-ConnectionGUID: FYRiD334TwSSYjtQ/o4Yuw==
X-CSE-MsgGUID: 2eqiYJwhT8WNJAOc8m50Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="146867748"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 13:29:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1uP5bG-00000005RdV-1dmC;
	Tue, 10 Jun 2025 23:29:38 +0300
Date: Tue, 10 Jun 2025 23:29:38 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 0/4] pinctrl: intel: use new GPIO line value setter
 callbacks
Message-ID: <aEiVsrtfzK1rkgUI@smile.fi.intel.com>
References: <20250610-gpiochip-set-rv-pinctrl-intel-v1-0-d7a773ff864e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-gpiochip-set-rv-pinctrl-intel-v1-0-d7a773ff864e@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Jun 10, 2025 at 02:58:46PM +0200, Bartosz Golaszewski wrote:
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts all GPIO chips in intel pin control drivers.

I'll wait for Mika's Ack and apply, the material LGTM, thanks!

-- 
With Best Regards,
Andy Shevchenko



