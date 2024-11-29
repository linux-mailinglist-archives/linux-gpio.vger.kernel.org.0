Return-Path: <linux-gpio+bounces-13362-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E219DE857
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Nov 2024 15:20:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 599BB281D56
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Nov 2024 14:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71FF920B22;
	Fri, 29 Nov 2024 14:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JOMqAl2f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C3F1DA23;
	Fri, 29 Nov 2024 14:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732890022; cv=none; b=AH6ua8IJnQr/DYVZR1+QsW+gbQmtPYpCE3GnZ547fCmnEWz05olOVpu0n6Kn/KWskcq6C7BPTsX5sgnxctrkx8VtCU9AdHXlj6YmL/27WFdEQe++lwHDKPkBI+nK4IZKozhZFWYJqz98Zf6lWO0lecqNgFJ4zGYG6TL3gV+Hh10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732890022; c=relaxed/simple;
	bh=w2C7AMm2XJxhaGZh98+ZDzegMpHXnTHBvBTfwUUgzQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fv3Sl4rQ9HL7jdiQM3yDuxk+xXAEwCAPVND/4dX9nt5dZOSXu1wY0ijkgbQPl+PwmPJPh4qhfezdJMI8m1dF/19TuqbKNBV08xBZoOjJ5LCM/b8XqcxEMvYpRNX/muG0LX+TmftA/7goJBCYVxH2Ao5w95osnvMSbeF2/dUQsko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JOMqAl2f; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732890020; x=1764426020;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=w2C7AMm2XJxhaGZh98+ZDzegMpHXnTHBvBTfwUUgzQo=;
  b=JOMqAl2fERkXIdLFenwfOdsXYvEa76TooH6s7eFBqYCQc33agPpuLt+c
   yjbBormKpG0NoiKROX6FCLYP69/SZK80NDORVVg5DzogEfcKgzpihfvdX
   xEl7cnz11NBF9WeVsLSvghq7VHR+HoAsz+FsP8FVmjHS0DVyY2um6p3AK
   zyLf3Tl4nTbF4ArE+oBwhkVLDHR/d7H5k+ijcXU40dKjJrwwFrsn1hOYZ
   mhlA3b/7xcZEKFteQ6HORml2ZnBZ74ZGsU+wmCX1UvSKafqCfdvhYTMCE
   p4YzE9OOxsfs/T+EqBFb2WGf/pWDLoU4ZPtSlgvSV8lbmrkt8sdG2NQH6
   Q==;
X-CSE-ConnectionGUID: YvFGfsV1SVGZz4MHRPNxPw==
X-CSE-MsgGUID: rrBndm2BQAm6StbIUnZTNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="44509317"
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="44509317"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 06:20:19 -0800
X-CSE-ConnectionGUID: XqT4cv0EQga54wfI/T5UMg==
X-CSE-MsgGUID: wE5/+BkeTb28hl7pJ0eRzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="92306652"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 06:20:17 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tH1qw-00000002G7V-1LHj;
	Fri, 29 Nov 2024 16:20:14 +0200
Date: Fri, 29 Nov 2024 16:20:14 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Raag Jadav <raag.jadav@intel.com>, gregkh@linuxfoundation.org,
	mika.westerberg@linux.intel.com, dmitry.torokhov@gmail.com,
	broonie@kernel.org, pierre-louis.bossart@linux.dev,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 0/6] Introduce devm_kmemdup_array() helper
Message-ID: <Z0nNnsmYIil0OZpy@smile.fi.intel.com>
References: <20241126172240.6044-1-raag.jadav@intel.com>
 <CACRpkdZqdE8gQCre=zR2cN17oKfwBSnWuVwzQsbRO7-ENVnPNg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZqdE8gQCre=zR2cN17oKfwBSnWuVwzQsbRO7-ENVnPNg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Nov 29, 2024 at 11:17:02AM +0100, Linus Walleij wrote:
> On Tue, Nov 26, 2024 at 6:22 PM Raag Jadav <raag.jadav@intel.com> wrote:
> 
> > This series introduces a more robust and cleaner devm_kmemdup_array()
> > helper and uses it across drivers.
> 
> For the series:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> It seems like Andy will push it to me which is excellent.

Yep, that's the plan after we get all necessary ACKs.

-- 
With Best Regards,
Andy Shevchenko



