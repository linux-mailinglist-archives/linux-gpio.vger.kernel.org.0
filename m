Return-Path: <linux-gpio+bounces-29251-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7482ACA38E8
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Dec 2025 13:11:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36143304C5D8
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Dec 2025 12:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7B572F068A;
	Thu,  4 Dec 2025 12:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JK/eaYYJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144A0330B1D;
	Thu,  4 Dec 2025 12:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764850171; cv=none; b=Kj13B1C6BM/qDJfM0+D9P3Lt8kQAgIzufN5XJaWctgaNcM1h8H/HHyfxsR+k3+O5Hr4Jlgbdon74JiLSzHv9iJNBHKiX/esb0AfQZC2AYfvZbAODdMp+TmN5hRkl1jCfZPzpPcADTRlYTq20NlByVCA7fpcTbh290/GlnPBHmfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764850171; c=relaxed/simple;
	bh=jHeVuSsKkI7/nYW/hWTMZUCy2Lu82FTflczvKpnDlzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qe+ODgFK7HCkCeqvEnTUSNExE09GpjbCdakg40z3vYg/xgkXY44M1NK+YOIUFySKYetr34zmSBGeMTc5efMIWFx0B1J7+Qi4R072o2iFiAeW5s1X6JRBQNw9dAChUt/4jvmatzd/4wNwaqjnxinWsZtMhKW6qLB2ERHK+TxGLCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JK/eaYYJ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764850170; x=1796386170;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jHeVuSsKkI7/nYW/hWTMZUCy2Lu82FTflczvKpnDlzE=;
  b=JK/eaYYJw72qU8q+TIBxK198bBjgxktXthzjs/fmV7Qxj/d5QVxPdJ6l
   SFtC1U11J6kv2VKqTIHQbJuStJNYVmaw2VoEVebH3svczegmnASn3XjV6
   wNmDLlnvPsE7wAcFfWWFPG5cTpDvMV1N5OOwg1fvvqlRjCsqelAt7+Eu/
   IyoHch99SjuyZrhEixbrHAc2M3gZ794m311izATIvxE3nmhMHAFSIR5PX
   ZTm8SzpEvxIR0iR5m8ZbMgXs5KrI7HLSzfHJYkXc07SbI2SPaNp/hHUgc
   Tg2xnzonc06Rmfxx6/Wyepvd+txYidbnWd2WK93EacBJYl1Q7FHqZ9i8J
   w==;
X-CSE-ConnectionGUID: HpwASiZXRI2NP2zE83QYrA==
X-CSE-MsgGUID: MGtYdfLwQiKeZh72zN9CRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77547256"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="77547256"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 04:09:28 -0800
X-CSE-ConnectionGUID: /xZv8DBtTpKYiLUtXr03xg==
X-CSE-MsgGUID: whev+uOlRHOEw/SsIc+BOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="200096436"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.222])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 04:09:25 -0800
Date: Thu, 4 Dec 2025 14:09:22 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wentao Guan <guanwentao@uniontech.com>
Cc: brgl@kernel.org, mathieu.dubois-briand@bootlin.com,
	ioana.ciornei@nxp.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, zhanjun@uniontech.com,
	niecheng1@uniontech.com, stable@vger.kernel.org,
	WangYuli <wangyl5933@chinaunicom.cn>
Subject: Re: [PATCH v3] gpio: regmap: Fix memleak in gpio_remap_register
Message-ID: <aTF58mCw4qk2RIAd@smile.fi.intel.com>
References: <20251204101303.30353-1-guanwentao@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204101303.30353-1-guanwentao@uniontech.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Dec 04, 2025 at 06:13:04PM +0800, Wentao Guan wrote:
> We should call gpiochip_remove(chip) to free the resource
> alloced by gpiochip_add_data(chip, gpio) after the err path.

Thanks, LGTM now
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



