Return-Path: <linux-gpio+bounces-23287-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A38CB054C0
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 10:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EDC207B5BE0
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 08:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02997274674;
	Tue, 15 Jul 2025 08:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CuBVObZz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEE525F973;
	Tue, 15 Jul 2025 08:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752567753; cv=none; b=pUHODSe04ujh1tmAZNiu32i8ctHE/vAKHPFbSasMdsIhQOgxFJk+RUo/IaFjpdGyCHINh/JxeP39k77pUTrCQcANWc0uz2N5y1vlWIheDpxV/2UNlKPKuT6mlF39MAaq7gdxlZ2N1xHUuAa1eFwoZLD9T8EAKOrhRwVW+E1rpw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752567753; c=relaxed/simple;
	bh=a/QsrXQn2Q+8kG4obINj/xiE+3HXSCctW3/j44bjJvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKu+kGzkxGfqqsDvEUpLNl63a8Sg2GpseyfAPYv0zU/XiWoSc/GwI/YBGUMfmokWvOo775DtpmZ/bm7o8425Bgx7hHqbsrEOWxDaTXviT3K5Sl2P/BS+QPXBCucX0HXJnBg1vr7DdcyOc0CFHKjEtmNDMC/aASk7SGXABnMFUAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CuBVObZz; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752567753; x=1784103753;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a/QsrXQn2Q+8kG4obINj/xiE+3HXSCctW3/j44bjJvA=;
  b=CuBVObZzIIWqjbZehViJd+NfcfXqC2PzWS5AnWm0bv45ltQtcRdejKEt
   1iOg76bygFLYPPZ0znhuom+/tjIvxBwH8f0QuknzD5yHEw6yfyQoh+nMf
   R2o/UkYmPDkqmkgHxSFBMy6HS/kry/DNKNlVYsnRadlIUrCisyqmQqU+v
   BczfAwGFO2B1Ji8KB+6SQDZV4k28gxvrC7OMm6TH0JMPM99LXncfgdYKo
   YOsUwQJh/Ou83OSWFrt4JW3WgThLpvnmmn5kkEHscgSDX/+xuuKBQUyFJ
   ucZY/BqH0DcJJBjq8dy8j8tDBmyE3KGs2M2CnP+6AVe664AUAKt2saR68
   w==;
X-CSE-ConnectionGUID: Ak+qCFB4TT+96rd9KjQQsQ==
X-CSE-MsgGUID: 0FtRcuq+TxKhBSpRZyjnKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54649109"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="54649109"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 01:22:32 -0700
X-CSE-ConnectionGUID: RV8tVbiwSt+C/N3N9A6KLQ==
X-CSE-MsgGUID: l841zr9kQlyZeWDn3U8ydQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="180864523"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 01:22:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ubavh-0000000Fawi-3Sud;
	Tue, 15 Jul 2025 11:22:25 +0300
Date: Tue, 15 Jul 2025 11:22:25 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
	linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 1/2] gpio: wcove: use regmap_assign_bits() in .set()
Message-ID: <aHYPweTatnLC3TUI@smile.fi.intel.com>
References: <20250715-gpiochip-set-rv-gpio-remaining-v2-0-072b4cf06330@linaro.org>
 <20250715-gpiochip-set-rv-gpio-remaining-v2-1-072b4cf06330@linaro.org>
 <aHYPoR5JVP4OO0QZ@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHYPoR5JVP4OO0QZ@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jul 15, 2025 at 11:21:53AM +0300, Andy Shevchenko wrote:
> On Tue, Jul 15, 2025 at 10:19:44AM +0200, Bartosz Golaszewski wrote:

> > Replace the if-else with a direct call to the regmap_assign_bits()
> > helper and save a couple lines of code.

'...a couple of lines of code.'

> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



