Return-Path: <linux-gpio+bounces-12259-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE029B3492
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 16:17:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 047561F2284E
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 15:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 549861DE3DE;
	Mon, 28 Oct 2024 15:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oH2qWQW2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB541DE3AC;
	Mon, 28 Oct 2024 15:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730128646; cv=none; b=kvpt5aUErOdHitnwbnqBDPeIxMdVXdFmnGPp2IVx3EA2pw3Kvg3WMbX15snbx8p9KmFK67mBZuelqU9NUXpzdYuGqswx0lfCtQAGkD5lclBU5CO1QeGHmEKKvzhEhPHSi74ap2nwq9JxqHoKQQ4n3RwILbKBwELVVmQpg3QULYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730128646; c=relaxed/simple;
	bh=YGXlZ5gnAyYWdYxwnCbFJwbSE3vRvAclYuWmrfxjDQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=udX2A76Nfzh/z+nLza1tAN4iSxMKlVReZBLXqhXt8PZvfiBw2HgzKsMWSmkN8tomSKxr0No/rXpRp/JjKCVsjcA+qfcsHJWy750wHaqXcsj++A/oxYTK9p/S/YmHcjM7wiuIpFNKVkmBn9Pc0fvdsyeW5CE7taMOjzhLjRICA6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oH2qWQW2; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730128644; x=1761664644;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YGXlZ5gnAyYWdYxwnCbFJwbSE3vRvAclYuWmrfxjDQE=;
  b=oH2qWQW2z9bG39vJbJSWinu6C22upQpx8yPSbE4fUtCDXFpwdj+qFyoq
   0FPX7dRRE4mMjWMPo2USD791w6sDkwtC97fSuiLR6M0gOyQse6NybYsl1
   v2/GzJarZbZNARZbOoibo3F3PS0KJyRdOU50WDc0qoYKK9NgYiA4wSt9T
   q+5CQ97H3/DZ1UN/x3lAajbsMY51c18Br22ixmzJtI0S6w5Rmr8NrgPPx
   WTw2uZuNwRbCWz934vxVS1dCnKZw9BNOP8bMpWuKafn28RXUpM8spiq1e
   n38FUZfee/ghGxQzufWTYpN9DuxxJNaQyyGS8AV5K65XOXltvDVIxPn9x
   A==;
X-CSE-ConnectionGUID: oBolXnIlT6+J+kmk8HDmEA==
X-CSE-MsgGUID: byIKYWZiTjS9D0ujnODw2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="29160481"
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="29160481"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 08:17:24 -0700
X-CSE-ConnectionGUID: kgpxJf7HT/ipJylIE8GXOw==
X-CSE-MsgGUID: dKDNvMGESbKdvVQ/NWhwbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="81707290"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 28 Oct 2024 08:17:22 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id DF9E023D; Mon, 28 Oct 2024 17:17:20 +0200 (EET)
Date: Mon, 28 Oct 2024 17:17:20 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] pinctrl: elkhartlake: Add support for DSW
 community
Message-ID: <20241028151720.GP275077@black.fi.intel.com>
References: <20241028134318.1156754-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241028134318.1156754-1-andriy.shevchenko@linux.intel.com>

On Mon, Oct 28, 2024 at 03:43:17PM +0200, Andy Shevchenko wrote:
> Hardware has a DSW (Deep Sleep Well) community that might be exposed
> by some BIOSes. Add support for it in the driver.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

