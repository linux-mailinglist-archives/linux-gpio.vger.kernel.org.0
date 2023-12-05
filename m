Return-Path: <linux-gpio+bounces-1024-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36246805953
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Dec 2023 17:01:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F3A21C21133
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Dec 2023 16:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDE8160BAD;
	Tue,  5 Dec 2023 16:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="grH7XrSu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2E42120;
	Tue,  5 Dec 2023 08:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701792061; x=1733328061;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jKYS+QhpoIvLq7GxMLGJgmwBA/2Fcl2kkmLSM/DkwU4=;
  b=grH7XrSubjOtwEuUM+2eFg1FPpjHYI2mQzPJZClPeb+ZgH9VObZ+b4/+
   F9njKKsorULMZViGdVMWgDYW6PRf1iE264mod7y/Ig+pMFf2RVf6i7hf4
   TSlqNsofWmIrfPmQ7OdEVACOf6DYYeRUuca402aPF+Q4b8i8+hJQlCNDr
   xC3fF/e+HCYOuQ0R5eLk2EP3lBz6e5GoPIlcNm8YCGBx/MqPK8WzKQHfB
   4mamkHtrX2qZ7tbB95bfcVxpmlVzJ6w8NHCni8PAhnVUmioYY+lAVM7Xi
   9wLh1pC8ncdMoi9/axFq2CyytEcykfmaaHpd2Op7cosXzxLjsFiw1gU6w
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="374100187"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="374100187"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 08:01:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="800008703"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="800008703"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 08:00:58 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rAXqx-000000024w4-3d2g;
	Tue, 05 Dec 2023 18:00:55 +0200
Date: Tue, 5 Dec 2023 18:00:55 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] gpio: sim: fix the email address in MODULE_AUTHOR()
Message-ID: <ZW9JN_khy9shJjOd@smile.fi.intel.com>
References: <20231205155430.31761-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205155430.31761-1-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Dec 05, 2023 at 04:54:30PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Fix unterminated angle brackets in the email address in MODULE_AUTHOR().

Wondering if we have some tool to check this, as it's not the first time
I see very similar fixes (missing >).

-- 
With Best Regards,
Andy Shevchenko



