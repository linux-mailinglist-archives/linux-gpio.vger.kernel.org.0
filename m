Return-Path: <linux-gpio+bounces-28834-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD48C708E4
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 18:59:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 010FF34EB10
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 17:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFA9133C535;
	Wed, 19 Nov 2025 17:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iIlOq8fW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2352D8DC8;
	Wed, 19 Nov 2025 17:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763574816; cv=none; b=aMAmM77mrNYDjkOM8tK/AcbT3xQr5Qd5CVHexjgegWmiIWLyCzy9oEMP1tLBIz15kikF3GCBcDeaZiJMPQTP9gjql7AJQpoTye5i0NeG4mggLye/CY5cylXMAV8MCxN3JwnBjceDxbEpD9UUMF5OwfBCyjiOscSpyw1YrJNCEfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763574816; c=relaxed/simple;
	bh=9BicpL4nXo+3esO5FwqKJLNBLzof4vRm5DTLtVgfbUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y2VzrROpkk8dCSc+QQVpnDZVk7RxzCaagtS9EaZgWX1jBg8MvWoooilLqOlQh+Z9MyZZbbSId7OOQdr3k+KVIXYX1BggSBgZ5uP6w7UWDuhHZqQ/74sCwLzN7bJBtiE3kyCe/rEih4Hd0MD+SeOKeuCtlt5HVfNRHDBa1IJaE+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iIlOq8fW; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763574812; x=1795110812;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=9BicpL4nXo+3esO5FwqKJLNBLzof4vRm5DTLtVgfbUw=;
  b=iIlOq8fW8RcRTV488k3PrgZ6fkik/jGbwxTpIr32A+hLKK+23yQKGKDC
   MMDqmdgzRy/6s7vHZl2yN5cTkLikgQJ4W78MC1m7sNFN+N9ZqE4PtPr78
   a18CHbH/Zkqo5DXU41IqxsSlW9hnLyque9Fo+x2AfwvWps++5jRxdND9K
   /Wev02Y1xEtYyFIqyNygA50CB4TWAQ3Y2Egv/bckP6j0HBcwdRjt4GtIA
   7UEWEmjc/eX9h91OKwOgVlt6EHXBGEHWFbICopaj3xPtVX05A7RpYgJLu
   t/orlnwM7Y1/y9AZ0fYX2C8U4DV8T84oooR57dCv2oeahD9ZMo2gnFN8g
   Q==;
X-CSE-ConnectionGUID: fhFnjR+ZSuat/+z/wwQzyg==
X-CSE-MsgGUID: +hZiDwpOSlSn/YufmsPI8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="68232125"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="68232125"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 09:53:25 -0800
X-CSE-ConnectionGUID: mcNnxbK0R4CG7P7v7goMgg==
X-CSE-MsgGUID: nVSgWJECT2GFUhpgch5Jww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="195432915"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.245])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 09:53:22 -0800
Date: Wed, 19 Nov 2025 19:53:20 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Michael =?iso-8859-1?Q?B=FCsch?= <mb@bues.ch>
Subject: Re: [PATCH] gpio: dwapb: Fold dwapb_context into dwapb_gpio_port
Message-ID: <aR4EEJO_PeXMKF_h@smile.fi.intel.com>
References: <20251119150049.13537-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251119150049.13537-1-jszhang@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 19, 2025 at 11:00:49PM +0800, Jisheng Zhang wrote:
> Fold dwapb_context into struct dwapb_gpio_port to further simplify
> the code. Sure this brings a tiny 36 bytes data overhead for
> !PM_SLEEP. After grepping the arm/arm64/riscv dts dir, the max dwapb
> gpio port number is 6(the berlin2q soc family), so this means we will

GPIO

*and I believe this is limitation by Synopsys in HW, but I'm not going to check
the datasheet right now.

> waste 216 bytes memory in total which is trivial compared to the
> system memory.
> 
> From another side, as Michael mentioned:
> "The driver currently allocates the struct with kzalloc and stores a
> pointer to it in case of PM=y.
> So this probably has an overhead in the same order of magnitude
> (pointer + malloc overhead/alignment/fragmentation) in case of PM=y
> now."
> 
> So let's Fold dwapb_context into struct dwapb_gpio_port.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

> CC: Michael Büsch <mb@bues.ch>

Please, use --cc or move Cc list below...

> ---

...this cutter line. It will have the same effect on the emails, but it will
reduce the noise in the commit message.

> NOTE: this patch is applied against the following series:
> [PATCH v3 00/15] gpio: Use modern PM macros

It's better to just put a link to lore.kernel.org or at least message-id.

...

I have a mixed feelings about this, but if maintainers go with it,
let it be then.

-- 
With Best Regards,
Andy Shevchenko



