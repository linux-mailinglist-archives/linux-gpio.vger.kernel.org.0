Return-Path: <linux-gpio+bounces-28382-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 507B7C5187C
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 11:00:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C15DC3ABA7B
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 09:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A69CC2FD7D0;
	Wed, 12 Nov 2025 09:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UOW3nOvS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FCC2DE71A
	for <linux-gpio@vger.kernel.org>; Wed, 12 Nov 2025 09:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762940603; cv=none; b=MUqEQhH9dMc2oYlyYAZSQDRwl3ubpqbkSasTKDj9EoFKrr3o1vRjazr//94lBAO45JLWACXdlCWfVNP4LCwXLlvaSlt9Mkszu0GTPzt8qfVn4jKcLOidkozyaebfSKTs8C3K9zbV2dfBnlbfajMMmb7daRH1uBMob/5vZQiV+CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762940603; c=relaxed/simple;
	bh=cpokuL7yh4RYc4EDpwrgG6O7/9ygVOYYRrfzNSF+FpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tg1cnnrdYCREVy3BgDB7O2NZuOd9bHPAYCPOemsEjMbA2EtLDNZrSgsT2liBD90pmWh2vf6biGoGSQAML1WVi8aLqHFxZBtHpWmKt2dIRRSpz8A+CkbZ7kJfmjtjThsAHgOzpoH7NB0CiHA/Ejq77s/4EovII1NmGG9I1iU3SFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UOW3nOvS; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762940603; x=1794476603;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=cpokuL7yh4RYc4EDpwrgG6O7/9ygVOYYRrfzNSF+FpU=;
  b=UOW3nOvSgcKl6CmtDg4q5cXzANBbEFF/KdmF293pJ9G7j2psMPlMiiDg
   ZC7gUufRyK73ZZuBJPjPnYczwhAsDNDoV4CNcQYfd+na9GPFikg9Vk/Zv
   4861XQsn7uetsjZn7u+ruX/qC8W2QY+900oxQq9FWn/+vCE9YwIiKj7Mu
   Mr7rr/ZAv2Oe5gLi6CPkAhkaz+DhdlBYnqKEguxRFQ/wKtVjEdYSlAl5/
   EdI8Y27H1bjLCfvbVsR7Gd9qBKRBVUF5FmvNe2sTT8EseGDb0yPq66kif
   AOzdyclEY6lxcoGdxcGogSJ7TzhmzaFw/Y8elgtxjL2X/koNdD0FH2tvf
   A==;
X-CSE-ConnectionGUID: SrnIt1C7R7KZAxj5/AbqVA==
X-CSE-MsgGUID: etrlZHTzQtSVir5vbeRHTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64923783"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64923783"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 01:43:22 -0800
X-CSE-ConnectionGUID: aD8AJX9sTki4Ff409leuZw==
X-CSE-MsgGUID: 8pR3Hw7cSySUlNH4N6wjBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="188472395"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 12 Nov 2025 01:43:21 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 2800295; Wed, 12 Nov 2025 10:43:19 +0100 (CET)
Date: Wed, 12 Nov 2025 10:43:19 +0100
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Dmitry Antipov <dmantipov@yandex.ru>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: virtuser: avoid strlen() in
 gpio_virtuser_direction_do_read()
Message-ID: <aRRWt6NNXkHCT0gH@black.igk.intel.com>
References: <20251101074131.353640-1-dmantipov@yandex.ru>
 <20251101074131.353640-2-dmantipov@yandex.ru>
 <CACRpkdaLSM3jDPSL1oQiMhyoMJ4dkcvdL7hYsCimM6E9+=76Kg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdaLSM3jDPSL1oQiMhyoMJ4dkcvdL7hYsCimM6E9+=76Kg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Nov 10, 2025 at 11:07:22PM +0100, Linus Walleij wrote:
> On Sat, Nov 1, 2025 at 8:41 AM Dmitry Antipov <dmantipov@yandex.ru> wrote:
> 
> > Since 'snprintf()' returns the number of characters emitted and buffer
> > size guarantees that there will be no overflow, an extra call to
> > 'strlen()' in 'gpio_virtuser_direction_do_read()' may be dropped.
> >
> > Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Strictly speaking this is incorrect change due to use of snprintf().
One should have converted that one to scnprintf().

While at it, we also have str_input_output() helper, but this is not
exactly related to the change.

-- 
With Best Regards,
Andy Shevchenko



