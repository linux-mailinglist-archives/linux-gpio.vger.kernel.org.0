Return-Path: <linux-gpio+bounces-19032-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 140B4A92333
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 18:56:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E37319E718C
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 16:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18F1F2550D7;
	Thu, 17 Apr 2025 16:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e6VKhY5B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FBB22371B;
	Thu, 17 Apr 2025 16:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744908997; cv=none; b=NWfLoXX1Hph9pPIAr4A4UZfKBtf3kkraAt/czHu+3JSU9WX4U9MPqLU1X7+EL2fxMk0STwTsSetnR/4945rUyUPYyXPWyzlsgk5ei9N6rnsWrXld7iJVUoN3Vk4sVMUnxK7uYPJNLbAkfqVhjbdtYIrkrlY0zgYBfCkprs8ISj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744908997; c=relaxed/simple;
	bh=4RwGMZJyXUFQYYJLHKZLA/+7xXIdW6IxadkdFOttjdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dpYzGBAleSwe5dgvhnllpoTxgScrznCXhaS6nDG1OtZM2qcH0vArvREtRGjMJTsK5/Urdf8034wdyT6IFFniuEU2iWSFhoJ8dtl2VT3J1GSb/6ACgE0O6gHa26ugLdDW1u4mf8/iZ6nsWEWjZ2a1OeLnSCpQbhBYeAndDh0TSR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e6VKhY5B; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744908996; x=1776444996;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4RwGMZJyXUFQYYJLHKZLA/+7xXIdW6IxadkdFOttjdU=;
  b=e6VKhY5BENg82WPc6C5dEeQCoQVpZPADnZ4AYHPqP57DsU0OdMvM3hI3
   bkInVf+jDMvl2oxFRYyvjDD78MGjgX01RMuMBW9OJwmSk+/x+SSzEyLUQ
   r5JVzgmPPFC3g6AHWSEG6CjRrSxXWCiM+bc9ZWPbtEJRMLbhBSOFTSrnW
   6iA+fyS2E+Srg4p70/1B5TJypdigMuP08Kk0uSpVwANDc6CphqI6TX9Sm
   bIT2zNNwOTMSdLIfpUH4tyfRGHmGluJjiIEoka5x9XNcVXfIVctULs4vU
   G65yJQPdyMOWe1AN5pyKu6VfA22i400Xv0O6h8P9Xq0Nb/N3Mrb9XT8Lc
   w==;
X-CSE-ConnectionGUID: N0t4QqjxRiGukyKwzsWg4A==
X-CSE-MsgGUID: v+aOh6PtRdaxCmeVCcrGOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="57178474"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="57178474"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 09:56:34 -0700
X-CSE-ConnectionGUID: KIH8hSMLQ7+oprfKBdgOyg==
X-CSE-MsgGUID: eq5n0YrIQ8Cco5cBfq0zVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="136035844"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 09:56:31 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u5SXM-0000000DG8T-2ZNL;
	Thu, 17 Apr 2025 19:56:28 +0300
Date: Thu, 17 Apr 2025 19:56:28 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu,
	GaryWang@aaeon.com.tw
Subject: Re: [PATCH v3 03/10] gpio: aggregator: move GPIO forwarder
 allocation in a dedicated function
Message-ID: <aAEyvOaE0bEOCu5k@smile.fi.intel.com>
References: <20250416-aaeon-up-board-pinctrl-support-v3-0-f40776bd06ee@bootlin.com>
 <20250416-aaeon-up-board-pinctrl-support-v3-3-f40776bd06ee@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-aaeon-up-board-pinctrl-support-v3-3-f40776bd06ee@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 16, 2025 at 04:08:11PM +0200, Thomas Richard wrote:
> Move the GPIO forwarder allocation and static initialization in a dedicated
> function.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

> +	fwd = devm_kzalloc(dev, struct_size(fwd, tmp, fwd_tmp_size(ngpios)),
> +			   GFP_KERNEL);

You can keep it one line.

> +	if (!fwd)
> +		return ERR_PTR(-ENOMEM);


-- 
With Best Regards,
Andy Shevchenko



