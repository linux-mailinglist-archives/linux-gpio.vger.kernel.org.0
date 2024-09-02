Return-Path: <linux-gpio+bounces-9575-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCF496875D
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 14:18:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04F31B22041
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 12:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2F6119E970;
	Mon,  2 Sep 2024 12:18:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2951219E964;
	Mon,  2 Sep 2024 12:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725279480; cv=none; b=aZ4iUHjv7qS18ercxWrm+wwLZ0fv0diF3sLxCiJsQstu3t+3hw4A0KpdkJKsB36iq0cj+gPhLQcLA2HupFgrGlkQJNIr6/8gpqK3XcX2zRsHVasXJQnJwJs11HdPYRpqyIL2vMPUCYuIyvgQzJsltQUPhvb+x1YFXlBexwBl2P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725279480; c=relaxed/simple;
	bh=qMR/fHZgJhsVQn4PLvqH8jVJYm8UDjDbuJL+1oFzmsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JsZUkErsGG4TdeeKkY30lTJlGNXnwTdG2jj8HEYncZfpwRcEKyIOy09e+QofHJeyrHa8bTqNSq+lVNgE82TxvOyWQRsjppEXWC8WrVZXprU+iSaQSDEHbZ1zUBx37FTvvCZm6p5UY3i+oaPiQR6hK8YwALYcO860jERIqv/czO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: kGT3RtWFSgqLrzkjY+kkTw==
X-CSE-MsgGUID: st0h01ULScOrhmNate5lnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="23427795"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="23427795"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 05:17:58 -0700
X-CSE-ConnectionGUID: h0XQ353rQEqE82BKLnKspg==
X-CSE-MsgGUID: XYdj68w2SpW2/AIXK9L/0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="64634153"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 05:17:57 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1sl60I-00000004M5S-3N8w;
	Mon, 02 Sep 2024 15:17:54 +0300
Date: Mon, 2 Sep 2024 15:17:54 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: kerneldoc fixes for excess members
Message-ID: <ZtWs8kNRHU6WnQw1@smile.fi.intel.com>
References: <20240826161850.74447-1-krzysztof.kozlowski@linaro.org>
 <CAMRc=McgbL5DCu2mr6oWERMQMFQU1Bm-1BkC+XR=-2fPXpOW4A@mail.gmail.com>
 <b67efbc8-ff21-486b-9961-498eae0f85bf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b67efbc8-ff21-486b-9961-498eae0f85bf@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Sep 02, 2024 at 02:10:37PM +0200, Krzysztof Kozlowski wrote:
> On 02/09/2024 14:03, Bartosz Golaszewski wrote:
> > On Mon, Aug 26, 2024 at 6:18 PM Krzysztof Kozlowski

...

> > I have a different patch in my queue that addresses the syscon warning
> > already. Can you resend just the pch part?
> 
> Heh, you just picked up something which was sent week after mine. :/

Whatever you decided, guys, feel free to use my Rb tag for gpio-pch.
Thank you!

-- 
With Best Regards,
Andy Shevchenko



