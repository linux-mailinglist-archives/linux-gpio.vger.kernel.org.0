Return-Path: <linux-gpio+bounces-3555-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F1E85D97C
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 14:19:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDAC51F215AB
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 13:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B41DD73161;
	Wed, 21 Feb 2024 13:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RvehUlpq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C43C29AB;
	Wed, 21 Feb 2024 13:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708521551; cv=none; b=YSDTb48kN+AxDZ0RmbIpASzPUyWseEXB1CzUYonCrXP9Mqw80bszgCWFRc5M7TnUQOE7D0WNJmOtvCewRsqc/HcS+Wg/p0euOmPA2UeDpSeCm05gl5T8Olr80NmuuL0k8BXxDa5pRc8sgFDhk9xoKMosAbArrghMoA5tLmJncT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708521551; c=relaxed/simple;
	bh=6TRnG5oJ9Tu9+OBVZM51AqkToWO2w1+1t68qgwfHb4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o+DhLTx0PW2j9tKfQ7FRkPGKN1rc4ydcxDj/jvjQELIOA825LkqjQ803gmfNpwW1RrUhUKaKLMxqz3M1NeBwZW8xmsF95CZpP2Yg3EzMCMaQMujumlEuZQPZvGKO8hCmcWRTplpY9FxjM/NDzMqkCZ+WPV4wMlmm3AzSKWLiJCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RvehUlpq; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708521549; x=1740057549;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6TRnG5oJ9Tu9+OBVZM51AqkToWO2w1+1t68qgwfHb4Y=;
  b=RvehUlpq9r1cQVDUPtxdyE/G33GlkZha61zNxWBwGGJWyTz1uA+y5glK
   JrTsNqij0K1JCZJaJ1pq0wTlnM77GoMPRFVmw4p+VLO+8BNP+IunluK5m
   GgSWLsXeL3BX5WBrS0m/OHXKO4a+3z/sAcrhY78kBW0VP8lsdNUrBj7gH
   qk6cZSwddql+5IxQXKwH5jGM2r/9c/X1uMmbics90MvUAJPaHfjU/7t9r
   p+TLCES8FUgJcc6ZwbbRCxiCaWeHxTAwiDJI4g6nosX8M7YvqHquMzcN+
   RgxyqSspmM29eJ+/oWNC06+VNkAOU9JPqYqgZnnZjbh9UGwwPCQy8iW5N
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="6454891"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="6454891"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 05:19:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="913302609"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="913302609"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 05:19:07 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rcmV6-00000006M9O-1Vq8;
	Wed, 21 Feb 2024 15:19:04 +0200
Date: Wed, 21 Feb 2024 15:19:04 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: renesas: Allow the compiler to optimize away
 sh_pfc_pm
Message-ID: <ZdX4SFXv53QyF49N@smile.fi.intel.com>
References: <6238a78e32fa21f0c795406b6cba7bce7af92577.1708513940.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6238a78e32fa21f0c795406b6cba7bce7af92577.1708513940.git.geert+renesas@glider.be>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Feb 21, 2024 at 12:13:59PM +0100, Geert Uytterhoeven wrote:
> The conversion to DEFINE_NOIRQ_DEV_PM_OPS() lost the ability of the
> compiler to optimize away the struct dev_pm_ops object when it is not
> needed.
> 
> Fix this by replacing the use of pm_sleep_ptr() by a custom wrapper.
> 
> Fixes: 727eb02eb753375e ("pinctrl: renesas: Switch to use DEFINE_NOIRQ_DEV_PM_OPS() helper")

Is this a new requirement (I mean more than 12 digits of SHA)?

...

> ---
> To be queued in renesas-pinctrl for v6.9.
> 
> Alternatively, one could add a unified definition:
> 
>     #define pm_psci_sleep_ptr(_ptr)        PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP) && \
> 					  IS_ENABLED(CONFIG_ARM_PSCI_FW), (_ptr))
> 
> Since there are already separate sections for CONFIG_ARM_PSCI_FW enabled
> vs. disabled, I split in two and simplified the definition.

I'm fine with current approach, IIUC we discussed this that time and the
727eb02eb753 was not the first version (or I can be mistaken, I don't remember
exact driver that the discussion was about during the DEFINE_NOIRQ_DEV_PM_OPS()
conversions).


FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



