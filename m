Return-Path: <linux-gpio+bounces-226-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3237EF933
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Nov 2023 22:09:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5BE17B20FFC
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Nov 2023 21:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E027A446DF;
	Fri, 17 Nov 2023 21:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FSlFl9NF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6678EB6;
	Fri, 17 Nov 2023 13:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700255372; x=1731791372;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rKwAssx08c4/5C0TL9gY4TGgIHx3ODz3n6cVa2c/Dkk=;
  b=FSlFl9NFnzTBDcmI0k+GAANt6oXw81j96y1OLxwAzCYWoJH4JUIZELMF
   m7CC+8fJ1IT1ci+KBaOUfn2x5of3j/90vWUiXbcmkUcFO6FI6MTrwdPDv
   +91ACUQnwsC2fa9guDtOe2r+qptk2FHnOdDBS/DPUxWAwRbV8MH82B+N4
   jfJvKXlSY80VHZRBJPaeN8SG87cVa2A0kzFD5pqLuba0hstroCIlmPv1/
   v8KcyHSqC5E7BliUzZgXnABjw2oXKSFpvOF6wHD3wmCJzAeo1fDEs3Gob
   cL+6bEj2u8IN5QuoVCWg2LphHq6qYJHGaidkbe5i7y/8eH/WXEPFBhpjV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="477584003"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="477584003"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 13:09:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="759262393"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="759262393"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 13:09:30 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r465f-0000000Eu4i-3sxx;
	Fri, 17 Nov 2023 23:09:27 +0200
Date: Fri, 17 Nov 2023 23:09:27 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 3/3] pinctrl: don't include GPIOLIB private header
Message-ID: <ZVfWh-LNnBLyQJwo@smile.fi.intel.com>
References: <20231115165001.2932350-1-brgl@bgdev.pl>
 <20231115165001.2932350-4-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231115165001.2932350-4-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Nov 15, 2023 at 05:50:01PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> gpio_to_desc() is declared in linux/gpio.h so there's no need to include
> gpiolib.h directly.

Oh, this is unfortunate we need it...

-- 
With Best Regards,
Andy Shevchenko



