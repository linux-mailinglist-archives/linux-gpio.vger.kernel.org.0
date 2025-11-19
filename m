Return-Path: <linux-gpio+bounces-28724-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 019FAC6CF79
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 07:41:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 28ED34F2FAC
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 06:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04C5F319608;
	Wed, 19 Nov 2025 06:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e04KQdO8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491B231813A;
	Wed, 19 Nov 2025 06:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763534431; cv=none; b=pEC5DOrBJcnkVMaIJLqjoaiXJyYTROjnzCi3mu+thjxu0nXjYf16gGpjmN5MzJ/RxPSAvJXiZ+2IL/ca+hsZHINMibIiPOMWJB/Ylo/Ffp+vTTo/B9tzWOJkaFWPrLBlQrqseMP7Xk3LAR+SRRYGrBb5iWl0qwGHmpTecsT2rLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763534431; c=relaxed/simple;
	bh=AzJ23ocOEs/G8t43bKLw3uS2a08bdk7p/f/pF4YGsow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VOpA6Dg1NrbQrNgIXvTH18ywhtqiRqP2pYsEIhwZbzxMugRhlpQ94HEYAjmCt3PZ8bh/+GVMuM2pW5g7BtxYMeRu+8sEkImGH1ht1H3Hne8f0FnvlbIWGAOLu/fIbDV23LQOMpGzzLr8F4MyESUz6YFChWq/Nlcgk5tvGnaZ+F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e04KQdO8; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763534430; x=1795070430;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AzJ23ocOEs/G8t43bKLw3uS2a08bdk7p/f/pF4YGsow=;
  b=e04KQdO8LJc7bqHWDe5/sSU7REmLF1UhCFsFGVeeYRYxaa61tCnQbq5U
   2tvwoOw2hhBK+s1jDjA95uxBxLG91kMnOPTM7HFFJnV1WKxuQIVt8tsKZ
   mYCGbagb7aqPKwF4cyBnhMdwzDMe5GZFEBWcaWJAQusxVFv0J+9fveqVd
   fwwYpJ0q3AwkfFfo5YGR/NNwhx33XX7SYz610iWgxtE4G4eUnPW33xgYL
   12roRMi+0PAHNkmk3XbKTTQ7tOr/ZM1ezcmBX44Q82UXqqxHUipACfGAJ
   FgjsVoZG8XCAKOQ76yaw3qFnBIVMLGzc5K8CwH+lWibILS0XJo0PBODAD
   Q==;
X-CSE-ConnectionGUID: /LCBMKn9T5uZ/lXLRWnBvA==
X-CSE-MsgGUID: T+UNjv51REecQSz59EHMug==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65507162"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65507162"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 22:40:29 -0800
X-CSE-ConnectionGUID: Yvd3jY+NTdGrX3yRapiuuA==
X-CSE-MsgGUID: JCf8SZO4RO+mqo/gJFo2Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="191413479"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 22:40:27 -0800
Date: Wed, 19 Nov 2025 07:40:25 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	andriy.shevchenko@linux.intel.com, linus.walleij@linaro.org,
	platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Introduce Intel Elkhart Lake PSE I/O
Message-ID: <aR1mWeLBlahs6RG-@black.igk.intel.com>
References: <20251112034040.457801-1-raag.jadav@intel.com>
 <CAMRc=MfYZq8vKxb736RRc17Ufu1A+6YDMuKDSME3Ly73y1ZRvw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfYZq8vKxb736RRc17Ufu1A+6YDMuKDSME3Ly73y1ZRvw@mail.gmail.com>

On Wed, Nov 12, 2025 at 04:14:11PM +0100, Bartosz Golaszewski wrote:

...

> When this goes into the x86 tree, can you make it available on an
> immutable branch for me to pull into the GPIO tree? Either just patch
> 1/2 or both of them with my Ack.

Anything I can do to move this forward?

Raag

