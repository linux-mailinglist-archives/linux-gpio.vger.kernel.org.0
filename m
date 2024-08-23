Return-Path: <linux-gpio+bounces-9071-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 506D795D15B
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 17:27:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 832841C223F9
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 15:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8696B188A25;
	Fri, 23 Aug 2024 15:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mtwwt6/0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E7B3BBC0;
	Fri, 23 Aug 2024 15:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724426863; cv=none; b=lDD7d8L9ge2AxZnyMjqzPESXwMJcQuqwN//3m9TYbKAJhc4vzXRX6sa8m4f3nVka1qwhtBWs3kWCq0qT+M06bR7G8TuaHgS3KflvQpx7lYWHI2iNdwn+7w1AqhAIgqjWE7A5N3rmfW7U/pafQS4jfl+J1SoioRZSGqvA3KKiWuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724426863; c=relaxed/simple;
	bh=1fhhSiMcOVCBrHV2nvZ8k+28qcf5sCezL/oTB6WVvDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u9OgZRp7bnfLPA9VtcwGBPfbHigXeXXyHlRTMPLbpMAQB86N00LESdn6BGKZ9ZlT77FyISCdSLt9h753zO1A8Deb4hDZLO7I/8fu9KCvbSlguWPv5LyfDRCTQTIcC+5wLR7ZsYidYtmGktuF7RNl7YFA4kQN4YNsx0A28cySwe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mtwwt6/0; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724426862; x=1755962862;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1fhhSiMcOVCBrHV2nvZ8k+28qcf5sCezL/oTB6WVvDg=;
  b=Mtwwt6/0wPa62Iix1e0YMFq8+40G0tQqKGeSKxA3aNRf+I1vOKRhnPxE
   XBAJWMsYbbu59XN5G9yvzuKlvMIMjYujtowJ0m9nNKovqEdG9AlMvdgTO
   xmrlmB0DVcCuVQQiGCnu9mkKR5HH0UH3OXawLKV/5r1xIu1nhu0mOHAqC
   84TR9ImPOv6lTYZ1qAmRtDMcp2czQAKW2/nT0K/xIK5dYz5WVVLZaKey0
   woFKvLPHUuLUzs7s5mAszEHx/xddaPryORCHE9/0pFE3gujLvpsSkV3vu
   5TkQyWfix6aslSCBHU2jJXt+rzpfjvS7smthl6HSENmLoTlA0vAfl9ZH/
   Q==;
X-CSE-ConnectionGUID: F05T85X8Qf6ZqwRXFgfBAw==
X-CSE-MsgGUID: EVjYAWzBQeq/F8gqG4kYcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="26659020"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="26659020"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 08:27:41 -0700
X-CSE-ConnectionGUID: sEwS9gkuTb+aOM0Hr5v5SA==
X-CSE-MsgGUID: hRSd3Dp5QEqPY3byezaBuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="84997674"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 23 Aug 2024 08:27:39 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 5EE4B209; Fri, 23 Aug 2024 18:27:38 +0300 (EEST)
Date: Fri, 23 Aug 2024 18:27:38 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Yu Jiaoliang <yujiaoliang@vivo.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
Subject: Re: [PATCH v1] pinctrl: nomadik: Use kmemdup_array instead of
 kmemdup for multiple allocation
Message-ID: <ZsiqasBNAdVWKrjf@black.fi.intel.com>
References: <20240821064958.4059221-1-yujiaoliang@vivo.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821064958.4059221-1-yujiaoliang@vivo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Aug 21, 2024 at 02:49:58PM +0800, Yu Jiaoliang wrote:
> Let the kememdup_array() take care about multiplication and possible

kmemdup_array()

> overflows.

...

> +	dup_configs = kmemdup_array(configs, num_configs, sizeof(*dup_configs),
> +				    GFP_KERNEL);

I would even make this a single line.

...

> +	dup_configs = kmemdup_array(configs, num_configs, sizeof(*dup_configs),
> +				    GFP_KERNEL);


Ditto.

-- 
With Best Regards,
Andy Shevchenko



