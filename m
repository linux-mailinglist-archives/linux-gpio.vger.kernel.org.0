Return-Path: <linux-gpio+bounces-20405-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92709ABEF06
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 11:04:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A257016B47A
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 09:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3F5A2356CE;
	Wed, 21 May 2025 09:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QvuB28B/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDAF230268
	for <linux-gpio@vger.kernel.org>; Wed, 21 May 2025 09:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747818233; cv=none; b=NVr3KsZKCbuXedq4sOCX7/u34jWr6ICYErAMJpZleHO2/WabWbVpvtDSgiQJ0+REjTUqFM1l/HpyP2hitvQaoZTjbRUVQiDcXeCSkeRppkKwZ25W5E44pIYHOQR5zRKbSK/BD+wB/6p7+a3a1JyWZ29ygyd223Gzc1XdhPBtTXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747818233; c=relaxed/simple;
	bh=BlonuLn3K/huJJPUddG0kcFCaN8hGvkizURgcY6TFZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gMTJoP3eOVdxzsylE4IRmyVt+iJ7iYVYJMDsiYPJ9UxbnGh8pG45h3kVgKvPxryvqabJa1pccr1m/gnfMAB3TPxhhcRc8LZ9UW/3GKvI+dStV6eZq82r8jGbIZHax0h12Ymiy2I1ojnRpSLUTLLRmdyH/7yDn+HIjhhmAmyxnYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QvuB28B/; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747818232; x=1779354232;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=BlonuLn3K/huJJPUddG0kcFCaN8hGvkizURgcY6TFZI=;
  b=QvuB28B/agflLAtJ9paysM6xosXwEmxqOmXUvLJaNQSbLtnQulAMVAMW
   /16f2cJU5x1e995WlJvTbnJnbO2azgJtQ2LQ08QZGxdoiT8urGLN/eDmr
   MapC4CCNXCS2BP96aw5pTid7pBf+RRgVvKIgIs+Xw7Ge38P1QIC8hsHAL
   em+P2egNaPbwn6RzEGsRcVfJWtdpLuCEZ8G6MmW9gFPuw1y8sJUNQHn5N
   1fVRcacOf8EmxCNFP+w2BGJUujm3OEhCYHC1Xh0s1hIuEXhq0nkehGwzB
   rzo1Apyn6xcLEIvgnnkKGAL5emJFzXV7bsGp5PI4dHfYfse0dvgEGnvnw
   A==;
X-CSE-ConnectionGUID: gOwy4axJQSCTGEpRYdFqFQ==
X-CSE-MsgGUID: r22WJVMeTymub/fGnpO02g==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49690276"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="49690276"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 02:03:51 -0700
X-CSE-ConnectionGUID: Tduyk/dvS0iPhCIzKbcvDg==
X-CSE-MsgGUID: 9gQCukbdSxSMs1upzwO3PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="170845458"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 02:03:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uHfMZ-00000003Z9A-3A3Q;
	Wed, 21 May 2025 12:03:47 +0300
Date: Wed, 21 May 2025 12:03:47 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linux GPIO <linux-gpio@vger.kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [GIT PULL] intel-gpio for 6.16-1
Message-ID: <aC2W84mKGzgbRsL9@smile.fi.intel.com>
References: <aCzbya_FW7hg1Wkr@black.fi.intel.com>
 <CAMRc=McMOH_S8Kf1TPV3Z0QYPz+cfS9hxZh++fNvMc_U+TssLQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McMOH_S8Kf1TPV3Z0QYPz+cfS9hxZh++fNvMc_U+TssLQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 21, 2025 at 10:44:16AM +0200, Bartosz Golaszewski wrote:
> On Tue, May 20, 2025 at 9:45 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
...

> > Bartosz Golaszewski (2):
> >       gpio: graniterapids: use new line value setter callbacks
> >       gpio: ich: use new line value setter callbacks
> 
> These have been in my gpio/for-next branch for a long time and the
> ones in your PR have different commit hashes. Please remove them. I
> don't see any notification about you having picked those up neither in
> my inbox.

Really? I though I commented a few weeks ago that I prefer to take them
when Stephen complained on dups. After that there were no dups noticed.
Since you haven't answered to that email, I (rightfully) assumed you are
okay with the proposed course of actions.

-- 
With Best Regards,
Andy Shevchenko



