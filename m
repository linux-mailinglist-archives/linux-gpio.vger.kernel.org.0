Return-Path: <linux-gpio+bounces-28374-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC1EC50A2B
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 06:49:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C4BC1895843
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 05:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 928252D7385;
	Wed, 12 Nov 2025 05:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q9fHBmIZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C365E56A;
	Wed, 12 Nov 2025 05:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762926554; cv=none; b=C59cC+27NB7leOJeZmg0Uu40LZq50McjqG/u38EQYWIPsotoocaVz/AhF2aL85gmQDFaasBv9x1rXZCtgdfJxj2NHL69kf+Z1gNQmNK1Gd3XyG6ZLwMp91dkNxtdr5pPigep5rdnXnrc3t2NGXx7Ylq6TKkDy36/jxweHK9ZkwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762926554; c=relaxed/simple;
	bh=iZmM2FF+G1/UpdqPTAdn+NZztP/wj/gLmLsFhKokDWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TlGVmnKmRBDfjEk/hvgmkl5po9vkfiJErYDy1vn4WwFLQy+pGRA+3BKvBJksOlo48Em40lD9XEz7NWqDXAbowGyawRvKLPWdi/i8AzAik2LNtMIg1rtWI6SCZ8fgrpsWUgSRndXA1+RVpZCbnWCN1gWyEYVDnBkTn79E971rs10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q9fHBmIZ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762926553; x=1794462553;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iZmM2FF+G1/UpdqPTAdn+NZztP/wj/gLmLsFhKokDWA=;
  b=Q9fHBmIZ3iMWzAnUzHXFukvj4ADAIsW9AMksOD2brG8cslBhyTsX6HZB
   odyxpU8XMLjlcpWQ8h4OhCGy/x+RsLZAzvohjcGGZELAoVxLry6JRM1kZ
   P+anRvgr5TV4WSl5u6IkqdyG47RoSO03pjWsJsgJdH5d6tJM492ucxNqv
   F251LcPu1ZqsykhbrH/RV44THIlx0QCf2tueK4GYU1SqqmscNfcJLiurB
   CuDo4NLJvko2zkNITLGFIQ9Lck18twLrtt/AusZs6NMEpm1p/RFtWiJlF
   pSH29FMmP/RfYE4/MqORlY4TAsAXBRZjA4gw2M1PlQmpKs5XbTm7c5UMw
   g==;
X-CSE-ConnectionGUID: qRA4M+kMSc+TKnBMTnUTyA==
X-CSE-MsgGUID: HqkVXIriSBmx9y2VQUqjhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="68621278"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="68621278"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 21:49:12 -0800
X-CSE-ConnectionGUID: nzMbUg4iTeudBofjjAJDMw==
X-CSE-MsgGUID: fYAeX9G0TyG+HQ/bL8yVnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="188974596"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 11 Nov 2025 21:49:10 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 143EC95; Wed, 12 Nov 2025 06:49:09 +0100 (CET)
Date: Wed, 12 Nov 2025 06:49:09 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 0/5] pinctrl: intel: Convert the rest to use
 INTEL_GPP()
Message-ID: <20251112054909.GW2912318@black.igk.intel.com>
References: <20251111191214.1378051-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251111191214.1378051-1-andriy.shevchenko@linux.intel.com>

On Tue, Nov 11, 2025 at 08:10:24PM +0100, Andy Shevchenko wrote:
> A few drivers use the more customised versions of INTEL_GPP().
> Convert them to use INTEL_GPP() directly.
> 
> Andy Shevchenko (5):
>   pinctrl: cedarfork: Switch to INTEL_GPP() macro
>   pinctrl: denverton: Switch to INTEL_GPP() macro
>   pinctrl: emmitsburg: Switch to INTEL_GPP() macro
>   pinctrl: cherryview: Switch to INTEL_GPP() macro
>   pinctrl: elkhartlake: Switch to INTEL_GPP() macro

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

