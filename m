Return-Path: <linux-gpio+bounces-9863-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8538796E0F8
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 19:17:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C02B1F26F12
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 17:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770FD1A01B7;
	Thu,  5 Sep 2024 17:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JPZBbe6i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA64714EC71;
	Thu,  5 Sep 2024 17:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725556670; cv=none; b=iXJ739Z4iwBIyI8dMnrk1Y1FLxqn9jJ8/g7l6YlKZJs5H3zj8sfKix+QuSt9aMA5jARXSgQjnIH1e2h+eTDCJxDwCNKhZPKoqO6Nu2C3d+pYcKyxZK+tEvz2AR8hoYKiK+oa4DwsPeANv2SVkBBxR7Vs6bepMj4afvtMSFfG+Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725556670; c=relaxed/simple;
	bh=BgVjIo1LAyRPzUhdMYx4Dbq4U5GxHoqaL500xBsu2qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lXDplwV4VjiGnL0+GLj0+/r9RdEKgAlQrDWm7P9xheaqouMuqJ6AJoUXAkHcyzw21TwUR7vbkqpWS49dfWMNz+k63/jODy72g9sE9e6vj7+XJjXHbasEVkxSj/lP0Vstsqlv0fjbD5RImxQ6qjM3g8xIYPhZ3Cx3byNVv2Oilck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JPZBbe6i; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725556669; x=1757092669;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BgVjIo1LAyRPzUhdMYx4Dbq4U5GxHoqaL500xBsu2qg=;
  b=JPZBbe6ixwj1UhS/VX/1TwhP61Kw7YvG1BN8ImNch518xSu59cpRkkPy
   prTEy9bfF9tnw7CeqCa0cnDfgqVudSdRNq3h6jTMvP4YDH8svoSSfiWjp
   vZS3aey2eS9aAiAn2pEJR4W6kWfA1PDpZP47ZWPc5nx2yUCqjDvtSpWlM
   uVktIXriXjsosZlTIviT+uWOvENF6zdSlsRSPgvMzibpUckYyFXSvGXaC
   n/GtTlC6xNWtfBGQAIxMeyR5B8bZGp+/tdihz8NMIIkc02+8dzscMi9de
   5nbAi5ZJd3guXot5metHy///6wnRAZmTb14IgxrxwYnLqnD16qzblve5T
   w==;
X-CSE-ConnectionGUID: ciRAEbaBRFmaaKC+nhNtdQ==
X-CSE-MsgGUID: JR3n5Ad7R1+eQLeLS7z06A==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24406322"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="24406322"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 10:17:25 -0700
X-CSE-ConnectionGUID: IlkxwLUtQ16Z1dyOGyWwCA==
X-CSE-MsgGUID: KQtnG4GgT0ubAyIeCv0VsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="66239769"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 05 Sep 2024 10:17:23 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 297C631E; Thu, 05 Sep 2024 20:17:22 +0300 (EEST)
Date: Thu, 5 Sep 2024 20:17:22 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/1] pinctrl: intel: Constify struct intel_pinctrl
 parameter
Message-ID: <20240905171722.GA275077@black.fi.intel.com>
References: <20240905142249.707556-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240905142249.707556-1-andriy.shevchenko@linux.intel.com>

On Thu, Sep 05, 2024 at 05:21:38PM +0300, Andy Shevchenko wrote:
> There are a few functions that do not and should not change
> the state of the pin control object. Constify the respective
> parameter.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

