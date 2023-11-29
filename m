Return-Path: <linux-gpio+bounces-686-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9080F7FDA66
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 15:52:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AE5D2827C3
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 14:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25A2F34571;
	Wed, 29 Nov 2023 14:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TCGwKfnz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22120130;
	Wed, 29 Nov 2023 06:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701269552; x=1732805552;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=1CJf5Lgu8+XI2dNO/pXx6iv5PIhdqKCUYUilwz1LFD0=;
  b=TCGwKfnzvXs9olpRfHJJr/hR6uvxgI7zGuSD7z9Tc3c6Szs+X9WBII7f
   ymrDX5/pBJ9v1idjpSVWJZi/EaF1JaJlqDKQG/MthKdfusgXFNuh/fRbn
   pyCDvzBn3Gda2xkqXcqmIPxUUsdOEHspLNLNjjzfHWYDsrEeuTT7LFhhR
   39pm7rtm1SjNWMvpxA9kKh6xifTaFH6NRMSw9TkOOJQrBveAuaEr7UBHf
   rKXrVmEPpU08DQwvr+hTOW4vFRievxNX6rnhQoDvpKR9049lgIWXJJHe0
   B8JCrOumasTpM+RghJydmTabEk5aOQTaAh1YVN3AuuGWJRaza282K5DIs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="457499252"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="457499252"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 06:52:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="745281764"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="745281764"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 06:52:30 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r8LvP-00000000SyY-273P;
	Wed, 29 Nov 2023 16:52:27 +0200
Date: Wed, 29 Nov 2023 16:52:27 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 09/10] gpiolib: use gpiochip_dup_line_label() in for_each
 helpers
Message-ID: <ZWdQK1kUe3zLqWIb@smile.fi.intel.com>
References: <20231129142411.76863-1-brgl@bgdev.pl>
 <20231129142411.76863-10-brgl@bgdev.pl>
 <CAMRc=MfL2nHF78TUmRjRSUC-2zyMjWotzU7Tv_27mVJPLET40Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfL2nHF78TUmRjRSUC-2zyMjWotzU7Tv_27mVJPLET40Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Nov 29, 2023 at 03:43:32PM +0100, Bartosz Golaszewski wrote:
> On Wed, Nov 29, 2023 at 3:24 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

...

> Any ideas how to handle this one? I was thinking something like:
> 
>     for (i = 0, char *p __free(kfree) = label; i < size; i++)
> 
> would work but it doesn't.

Probably you want to ask Peter Z for this.

-- 
With Best Regards,
Andy Shevchenko



