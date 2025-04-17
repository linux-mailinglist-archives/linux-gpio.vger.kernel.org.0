Return-Path: <linux-gpio+bounces-19035-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9521A923E5
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 19:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B7123B8D67
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 17:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3AC42550D2;
	Thu, 17 Apr 2025 17:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g47OiLOx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C255139CE3;
	Thu, 17 Apr 2025 17:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744910604; cv=none; b=S/hqdFt2VY9bgzJP2UNsr2bANLOwTxJ91L9scfcBj673v81fycQU7kPT3SecV0EW7g2N6NYUHJMLoIPcd+OSeZYztZMnx9jA6rq86GvvodGiC1tkhuUJbOyOp/E6u4YiIHWQivajwSFsHF2ASyzpVZxDJ4tK4LfGTLvVNmvcIbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744910604; c=relaxed/simple;
	bh=Ba9bansSuU24cs93jMyKbOt/Io9FHgyly4UnAapz2yQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SxdzSEKMPbipKpBNwcc82siIxM3iCztA5YawsUZQs9Al1QGpS2j2sVtWI0KbPE7N7J4QZ0hXXZqN03xYoswVZS7RcaOp0MI+aZoo11v2ogs2Iop0uuWzD3NPvzNJnbYHcz77bBxXW872jnl1Ta9aFp47mtjFY5GNakjgbECBlOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g47OiLOx; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744910604; x=1776446604;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ba9bansSuU24cs93jMyKbOt/Io9FHgyly4UnAapz2yQ=;
  b=g47OiLOxZrbVeN2OhmsLhu+oaAAHg6flps3/0cB7TGfp/3VNx/ea9FRu
   wGYzJvJjMEkb7GeToTQD//niS8BMe73A9mjkkRr832ldW/k7C7e/eHBp3
   U3NHw928EV28vP+up1zwE64NTp0cunYFBLHjWAtIGgVcLZc+4tJdLH5Zp
   zrY7hYviRptGKBO0iPt6ycWKVc2cZKP3aoQg+6d/86LiLRaT7ftIAtwn+
   xo8HV6A7ZolpnQZbj9eRe4MES6P68L57zKnBLjAujvAmGQSKEtSplTlJ9
   6nZMwZMyat39U74yLVAqSo7lrfq/2WSVMANwJYUtbl5dDWC/QDWc0TjU/
   w==;
X-CSE-ConnectionGUID: Og2znqaiQtmXGPeIbc+eNA==
X-CSE-MsgGUID: SspfD+VlRHSHOUHkEVfxvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="46643563"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="46643563"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 10:23:17 -0700
X-CSE-ConnectionGUID: 56Kjorx2R2KyYpheFLdowA==
X-CSE-MsgGUID: H4eEKeDtTX+UEgYBpBxQAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="135990011"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 10:23:15 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u5SxE-0000000DGYE-0zU6;
	Thu, 17 Apr 2025 20:23:12 +0300
Date: Thu, 17 Apr 2025 20:23:12 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu,
	GaryWang@aaeon.com.tw
Subject: Re: [PATCH v3 06/10] gpio: aggregator: update
 gpiochip_fwd_setup_delay_line() parameters
Message-ID: <aAE5ANpQNYwAGhaL@smile.fi.intel.com>
References: <20250416-aaeon-up-board-pinctrl-support-v3-0-f40776bd06ee@bootlin.com>
 <20250416-aaeon-up-board-pinctrl-support-v3-6-f40776bd06ee@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-aaeon-up-board-pinctrl-support-v3-6-f40776bd06ee@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 16, 2025 at 04:08:14PM +0200, Thomas Richard wrote:
> Remove useless parameters of gpiochip_fwd_setup_delay_line().

Makes sense!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



