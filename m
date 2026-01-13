Return-Path: <linux-gpio+bounces-30487-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 056D0D18990
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 12:57:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D9E863006E19
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 11:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A893538E12B;
	Tue, 13 Jan 2026 11:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f+A/LmAk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F18438BF9A;
	Tue, 13 Jan 2026 11:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768305453; cv=none; b=BfrGv0OgDY3EgnJBb/pVz9+yYc+y/oFam5AN/SrMKMjrQIYlvbt0BZseHf64NAIvMb5WNQo9nv+5EbIci1tDodwffm8rFQy95ivUnI4I5Hr4wqIS0HjB/EYZjS9F9LJbtYxnnZku1qL8r0hHzTGzt1aXXNteuRbcc4xVSGecC1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768305453; c=relaxed/simple;
	bh=/ojSBZPpJcuSlAY+mGdv6H7WIvQdD04RDuf18kBsclk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DC4Onn8Pqh398Lkgpu/bi1aGVZNgo8+JOdifQZDosO53SwqX9a+A88Pt+n72DnB+DQaaXLlOL3j5IAVv7RnJxYN1jam+7FI4SpntKk/EC1z17+ouc9BGber2he0r8jgx1m6ws6KrG7QPBw1OjXZ6sIxUCnQvYwdn+YuoNBCEFSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f+A/LmAk; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768305452; x=1799841452;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/ojSBZPpJcuSlAY+mGdv6H7WIvQdD04RDuf18kBsclk=;
  b=f+A/LmAknR2NoQHf7grj4CbP256ahNsCYEWbM3UMF/2U/2woZ8cC2yhw
   xr9AbnEUJjjNyuzU5ZLPcAUJXw6DfkgqlgoHuvdBT8/WCFf3xVrZYA/vE
   ZHQhL73eyXY+nvZGR504xmeXAvtJWR3RRO2srzu5PtJgY1FbeYPGBgVm3
   CbYm+c8Kbp2apAyHw80Xd17ILOUMJ2aar+Ehkb95n6/GK70ZY5vjEjcm1
   ujm7TXpFeVmuomzHDkIX1TWMMcaHBeDowvUPkyIMbVjdvraPz5pNEKuSC
   wQdvZG+gnNGlfl9XxTXbhnC6i4QlWAk12VfMCar2vE8kWMM02YhMRszo6
   w==;
X-CSE-ConnectionGUID: C/3DdeXxQ1OFnyWjxd50xA==
X-CSE-MsgGUID: /T2USsyDTBmUyoZv+ZAHxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69496652"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69496652"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 03:57:32 -0800
X-CSE-ConnectionGUID: U9Qo896gQZW2w7lf3FrMXQ==
X-CSE-MsgGUID: PeckAFmdQuK+jttFVWtw+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204971463"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 13 Jan 2026 03:57:31 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 26BA098; Tue, 13 Jan 2026 12:57:29 +0100 (CET)
Date: Tue, 13 Jan 2026 12:57:29 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 1/1] pinctrl: baytrail: Convert to use
 intel_gpio_add_pin_ranges()
Message-ID: <20260113115729.GZ2275908@black.igk.intel.com>
References: <20260113100734.136729-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260113100734.136729-1-andriy.shevchenko@linux.intel.com>

On Tue, Jan 13, 2026 at 11:07:34AM +0100, Andy Shevchenko wrote:
> Driver is ready to use intel_gpio_add_pin_ranges() directly instead of
> custom approach. Convert it now.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

