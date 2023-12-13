Return-Path: <linux-gpio+bounces-1124-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE5980A51C
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 15:06:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2974B1F211A1
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 14:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAFD41DDCE;
	Fri,  8 Dec 2023 14:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UxBTc+G5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B34B6A9;
	Fri,  8 Dec 2023 06:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702044387; x=1733580387;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pSB/e/wx1Z8iT7xq+6W0PyzyzGdY+5HEvmD3D79YMRY=;
  b=UxBTc+G5aEra4TP4XCPBJoUwJXfOwSwHkP23P6XNnsKyX1IW1QqeFKxB
   Yu1xzKlCJyLkjEvfIfroAGAuRkUyK87hS4BQvVMScAnnI54gwXY1vrvU+
   gmoegmF1UL+I3zo7ctRNMG5v4Br2FoB/5ZaphNPcaVOdUITaLNUafg7IT
   5eNl/Gh3VM4yYxdyCoFeEreghBMbwGT0xnpndMJrWGp3AGgc4+sxM9PhX
   0FUO+TBFHKNPc6VCfG5m/tV4wdTZ0Lk0N8sMIC3GYsBJRENthFXi66+CG
   7+HRqQUJyRHN+Jmv55RvftsuRV6Ribp9ANthTN3VP2lAnbNlMLtnp4NwC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="398275334"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="398275334"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 06:06:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="895546456"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="895546456"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 06:06:25 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rBbUk-000000045rp-36hl;
	Fri, 08 Dec 2023 16:06:22 +0200
Date: Fri, 8 Dec 2023 16:06:22 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 1/2] gpiolib: rename static functions that are called
 with the lock taken
Message-ID: <ZXMi3lga6v4JA8FT@smile.fi.intel.com>
References: <20231208102020.36390-1-brgl@bgdev.pl>
 <20231208102020.36390-2-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208102020.36390-2-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Dec 08, 2023 at 11:20:19AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Rename two functions that read or modify the global GPIO device list but
> don't take the lock themselves (and need to be called with it already
> acquired). Use the _unlocked() suffix which seems to be used quite
> consistently across the kernel despite there also existing the _locked()
> suffix for the same purpose.

Okay,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



