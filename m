Return-Path: <linux-gpio+bounces-27999-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB95C2F5EC
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 06:25:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8AB8B4E5C17
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 05:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEFD22C029E;
	Tue,  4 Nov 2025 05:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TFLBjI6J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E17E286885;
	Tue,  4 Nov 2025 05:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762233946; cv=none; b=LCijWon8pEgVGsC+Plpyw16s5Szq8/z72L06JqNsmkD7ZdqqSoP3u2ZCwsyaEdAQAsnkSIbRpLXr8WbkAc5U6PhPlHursFs6fJR1YiDrYHMtqry6aVLEqorvUivDYHj7Ry9dURqHOFNt3NjowE99xkiLnU7udvkL/tQBW+bLHEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762233946; c=relaxed/simple;
	bh=O9jQ9RG4Snm/WXV0wdgEuzbv7+LCQop7+T+faHf011g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pSGc8+kGMBzDkeGYuM1WHLRcGiXHzN3YrNYRS5+Xkm0VZtxhXvLEKzjjqZQI/dMxnJn3WbkEWx5+hpul3mxZriV4Mf1lv3H8iKVQROWzlWsNdf3sEqcKXHLstwkpNeccOOJP3jzaJ3u2kE7rcyZdz4CGp/Z0nqF9+Tn2pRitSpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TFLBjI6J; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762233941; x=1793769941;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O9jQ9RG4Snm/WXV0wdgEuzbv7+LCQop7+T+faHf011g=;
  b=TFLBjI6JspiAc5Ke5Q16Ui2Ie+V0V4/LsREVxVifnCTUQxRBtjM5ZQA1
   2TtLKsXwDfkpQGIc11C5cnIqMBu9aOkxEuNrFaODIqC7XCCFUsoQLgvrz
   rPZVgR5NgOM6Py9ntF37E5jSdGoPX0tW2fO8qqHy821Vk16QXdwynRRZL
   L3yf8KQgSN+dZTxFaPdAnRp/BYLat/sUq4tHORNS+ZMiSsTjBCktVYngt
   0NoyTFA0hWpxLo6bXMX4F90UeYNMh8+GCTpKLNYQl+yq/djFE3iX3XwRg
   oKVfLcjiWgKawQf64XL5kFPA7dtBoNMgQQGLbkDHzZrMU2rA2YqX4cZu0
   Q==;
X-CSE-ConnectionGUID: fR6ygbqUSuqX5XXfRSboPQ==
X-CSE-MsgGUID: ZcHlj/j7SoWlZXnCnDlbDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64360287"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="64360287"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 21:25:41 -0800
X-CSE-ConnectionGUID: Lgh0UUMtQJClmh7XjdmItA==
X-CSE-MsgGUID: zJSbmmbkQlS4R0vNsh1mSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="186741457"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 03 Nov 2025 21:25:40 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 19D7B95; Tue, 04 Nov 2025 06:25:39 +0100 (CET)
Date: Tue, 4 Nov 2025 06:25:39 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 0/4] pinctrl: intel: Unify error messages
Message-ID: <20251104052539.GK2912318@black.igk.intel.com>
References: <20251103200235.712436-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251103200235.712436-1-andriy.shevchenko@linux.intel.com>

On Mon, Nov 03, 2025 at 08:58:27PM +0100, Andy Shevchenko wrote:
> Unify error messages with help of dev_err_probe(). This brings
> a common pattern with error code printed as well. While at it,
> make the text message the same for the same reasons across
> the Intel pin control drivers.
> 
> Andy Shevchenko (4):
>   pinctrl: baytrail: Unify messages with help of dev_err_probe()
>   pinctrl: cherryview: Unify messages with help of dev_err_probe()
>   pinctrl: intel: Unify messages with help of dev_err_probe()
>   pinctrl: tangier: Unify messages with help of dev_err_probe()

For the series,

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

