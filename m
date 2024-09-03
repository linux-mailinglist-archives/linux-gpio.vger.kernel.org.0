Return-Path: <linux-gpio+bounces-9605-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E79499692F0
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 06:55:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E98BB21CDA
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 04:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A7A21CDFCD;
	Tue,  3 Sep 2024 04:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sgn/VxMK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E721CDA02;
	Tue,  3 Sep 2024 04:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725339302; cv=none; b=eLDKed6pzJ1wUC+4yiHWVNeYq6w3QhikynuT37ZkASg1MQzBshqK1Q9GRwL/ZeZhDBLM/cNIA3agL6GtMiDmU8ij3lPpfy/Ep73B8yM8aGr9PMfTx8Rxx2iqPQUWL4xl3Ay5lSb0gsFdfdgYPKSWRDWRDYBionBUdmznXAiiG+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725339302; c=relaxed/simple;
	bh=vaxKRkPuxjPUT/MIG2CzhQ8FcCd//sUpnWKwLuJjzYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qA/wj8vDvKW+NYRzMD09r8xee63hqyxRg/v8rcHqdnQY+XiU1kqPNGiwJlR8GJNOAd9rqm35/ew3dpejeWBXxEW3DC0Kkeiaf/C1nMh5PHV6aeqI7sA9F0lcNdThKNq6AHqc5V6jAHQYWA5M38O6fAdUm52O0Dr/UEWK+28XDPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sgn/VxMK; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725339301; x=1756875301;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vaxKRkPuxjPUT/MIG2CzhQ8FcCd//sUpnWKwLuJjzYI=;
  b=Sgn/VxMKg9RGCCSZpTn3/oL1SO6/UlHCGLDHkp05yzYuPuZRj5jLJ1VR
   hGSkEu4yTV5cYLmoRaln9U9Hh5O+/mXDncVfkMRgVvP8AMEjUIkD2jHLL
   kcFOz12la/jCWuu+FkQ6kkj9guM0ZSHOzSH2WFCAiCn5go8UlQujqBfgO
   rXd8sA2di+yJILDBqBDM2dIV9X9+lLY1WztnvYBToDWuUP/+SPyqXUBK1
   cNwzz/viAqk80EhBHqD+AO+PckjhmHO3gnriH0CcR6fRvuE32TQImKb7e
   WnLXANwO1tLEVpkSBl6uXKblk4SXNqwUg2LhPgRJZyegG6AVK0z7c89jm
   A==;
X-CSE-ConnectionGUID: AQF/6/VGTweEd0eib88wWw==
X-CSE-MsgGUID: CyS3xfeOSj6qY+rBrom/Fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="23790338"
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="23790338"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 21:55:00 -0700
X-CSE-ConnectionGUID: i+bqkZBzQ5yxLEPhcdumfA==
X-CSE-MsgGUID: z4wWJ35MQmidfZMETKBISw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="88025042"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 02 Sep 2024 21:54:58 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 504A31FA; Tue, 03 Sep 2024 07:54:57 +0300 (EEST)
Date: Tue, 3 Sep 2024 07:54:57 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: Inline
 intel_gpio_community_irq_handler()
Message-ID: <20240903045457.GX1532424@black.fi.intel.com>
References: <20240902141441.2683122-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240902141441.2683122-1-andriy.shevchenko@linux.intel.com>

On Mon, Sep 02, 2024 at 05:14:41PM +0300, Andy Shevchenko wrote:
> Since we have for_each_intel_pad_group() helper, there is
> no advantage of having intel_gpio_community_irq_handler().
> Inline it into intel_gpio_irq().
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

