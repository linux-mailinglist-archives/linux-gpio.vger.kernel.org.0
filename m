Return-Path: <linux-gpio+bounces-9294-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8735A963160
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 22:01:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44370284834
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 20:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21FB91AB52F;
	Wed, 28 Aug 2024 20:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EsjS0otU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199673AC2B;
	Wed, 28 Aug 2024 20:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724875260; cv=none; b=cuzL9c0y5u8YCWwn0qakt9RuKWsV7kleYOuvrGmbH22iq092eAgHORDWHWLgcSFo/aCSdtIHX2p8O+FhD9vltnAOLpdhRLgJBXHzK+7FBi+omKE0iAZZ4MnpX4XDgfDeu5NJIaVU4YusIJDRSVya+8+438/QsI4ti9sKsITMinM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724875260; c=relaxed/simple;
	bh=+VW7xZep5DJcygKlPPQd7cNrCB46UZbpfqn8U7UTBsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bb8u9PLUGb7EBOOmYCa6XQEzoqd67rBFll8dkmliXuu2GkchhaSGviuaoZa4i9728NwpicJEHO5CQv9fUPqPKNjqNjVv9JNXC197tx+Z3s7781AKMAvlZuui/a9kFpqariEmzmvUZNRZwIygp/8nvSUa7i92iCcOEEvoJjZXybs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EsjS0otU; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724875259; x=1756411259;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+VW7xZep5DJcygKlPPQd7cNrCB46UZbpfqn8U7UTBsk=;
  b=EsjS0otUmV/9Gii2WGJywCoyj5V7wcNSYQnSeY3/ettngi8Ceabo3N8y
   Ezci8Fg0yQ1S/XddzIYZ3Ou4N1WdidxxhWxUtUk7J7ti8oBQlOS9NG7cD
   5ONzFJ+r2A2ZEfIA3psl0v66RLGpq4ULT8HR5vxhZ3MNGGWJ7ocbl2sgC
   2h9bV2n+WGcrcpkIfzxd/5aYC8yh8y+uXQGwMQGy+BF3oKflCGYD2LVT1
   4Vf5OC7vMmIXHrRjA8lheFmfyk/ye6lRbYPgrRwe8UuxTwWEHWVtfKspm
   KSD386q+ANDRSQKEYfzHsVE5tBeOQdEeQyJ8FbHyZQVXVSjJr5zQFesvW
   A==;
X-CSE-ConnectionGUID: bHoOpHN9SoGrEYMqhw5J5A==
X-CSE-MsgGUID: mdsDA1OTQuSRYRVCiDVKJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="34840715"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="34840715"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 13:00:58 -0700
X-CSE-ConnectionGUID: vska6vuMRcKmm/dR8shkIg==
X-CSE-MsgGUID: stj4xmFwSamnh6LOZ6IJTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="63176830"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 13:00:57 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sjOqc-00000002m9T-2AFw;
	Wed, 28 Aug 2024 23:00:54 +0300
Date: Wed, 28 Aug 2024 23:00:54 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 0/5] pinctrl: intel: High impedance impl. and cleanups
Message-ID: <Zs-B9m4jO9x3wX4d@smile.fi.intel.com>
References: <20240828184018.3097386-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828184018.3097386-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

+Cc: Heiner

On Wed, Aug 28, 2024 at 09:38:33PM +0300, Andy Shevchenko wrote:
> We would need a high impedance implementation for a quirk, so here it
> is. While doing this series I also noticed a couple of opportunities
> to clean up, hence two more patches (1st and 5th).

Sorry it took a while to actually start implementing the quirk for your case.
Here I'm asking for the following things:

1) what is the marketing name of the device you have problems with?
(I believe it's available on the free market, correct?);

2) does it have any BIOS updates and, if it has, does it fix the issue?

3) can you apply patches 2,3,4,5 from this series (the first one is buggy and
not needed for you) and replace the hack I mentioned earlier with

	ret = intel_gpio_set_high_impedance(pctrl, 3);
	if (ret)
		return ret;

somewhere at the end of intel_pinctrl_probe()?

Does it still work as expected?


-- 
With Best Regards,
Andy Shevchenko



