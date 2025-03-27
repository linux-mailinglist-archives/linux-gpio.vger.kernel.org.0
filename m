Return-Path: <linux-gpio+bounces-18055-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C56A72D98
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 11:16:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E12663B1E2A
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 10:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 576F420E714;
	Thu, 27 Mar 2025 10:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sh1J6YaR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6801F583D;
	Thu, 27 Mar 2025 10:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743070520; cv=none; b=K2+D7h/JMnQTJocjwQLrqsgHA6RAvFXleUe2lPWlPrm8OTTad2N9SS4YBdCEMRcKjOgv65sSIktJ7hWiszh1x7dC9E4sgpomdIDUIcFnSJCZQZmvHmSdzAI+nSE9WpJS2VOy0IrXeppDGaFB+sRPaWYDpkg8Ms9qyTWon2NzRM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743070520; c=relaxed/simple;
	bh=vD6Mia7gpj3n/mHTPdQrkdEU0qmFG1H5qF5ByElT39M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kKVLheMj9yGex4IRxGV8oCY08XCMoy+uAY8RhN12LHnxqyh3iFEmEhXgNjDEPpKXLP7sX/xfagke2Dw7EE36C3nzzuSgZ7WJ8c9E7fJkmK+fqoXY6rZSBSzN0D8v8RUnZh+AcTQcWZom2wSLNiY/XxDsZh0NrxyfwVNE0i91S3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sh1J6YaR; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743070518; x=1774606518;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vD6Mia7gpj3n/mHTPdQrkdEU0qmFG1H5qF5ByElT39M=;
  b=Sh1J6YaRPOFDer84EV4HfbiH7ICguNZOs+vTFU6yMdk2hI+eFlTEesdm
   E43a5iCUSUiLt7sfhZYtsZ3p0hRKOK65tOn8mxls0lFJ+wFWaPN4JyseS
   b42wYyw++/DT2Gfaj5zQCbyvD57sr9zOseRDFofH8b8Unu3D3dVpsPgQh
   TeWFf0OUL9WnEipOAr940to/45Cau3yx6M0ie288grf8GZ2Yevt7W2vv3
   WTkyWlP1QGRGlTLSc6k857xVmQkBipLAD1VcSL9y7Rnl9hCuhdeVhgjSW
   ZDau2x+OPNmoPWW6svaRL12shOJxVRnZSeEnrAe44lwlzFEw3wSWri2wW
   A==;
X-CSE-ConnectionGUID: 2fJMNwUAQ8SBu+jPXQ0ESw==
X-CSE-MsgGUID: HLR6Y0T8RsmJQDxgJDv/vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44114069"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="44114069"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 03:15:18 -0700
X-CSE-ConnectionGUID: ELkNzxC7S2afiLE0mhIWrA==
X-CSE-MsgGUID: p/hiS+5cQo6f6SVAwnWigw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="125309320"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 03:15:15 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1txkGW-00000006Lym-0BdX;
	Thu, 27 Mar 2025 12:15:12 +0200
Date: Thu, 27 Mar 2025 12:15:11 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, krzk@kernel.org,
	lgirdwood@gmail.com, broonie@kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V2 1/2] gpiolib: of: Add polarity quirk for s5m8767
Message-ID: <Z-UlL_zpdAvi0UcK@smile.fi.intel.com>
References: <20250327004945.563765-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327004945.563765-1-peng.fan@oss.nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Mar 27, 2025 at 08:49:44AM +0800, Peng Fan (OSS) wrote:
> 
> This is prepare patch for switching s5m8767 regulator driver to
> use GPIO descriptor. DTS for exynos5250 spring incorrectly specifies
> "active low" polarity for the DVS and DS line. But per datasheet,
> they are actually active high. So add polarity quirk for it.

So, to make this clear: this is simply DTS mistake as driver basically ignores
the polarity or other flags in it, correct?

-- 
With Best Regards,
Andy Shevchenko



