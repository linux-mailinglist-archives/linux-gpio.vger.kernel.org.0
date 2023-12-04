Return-Path: <linux-gpio+bounces-967-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 938A78034B8
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 14:26:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0DD3B20EEF
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 13:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3941E2557A;
	Mon,  4 Dec 2023 13:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eCPAlddx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61F2710C2;
	Mon,  4 Dec 2023 05:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701696279; x=1733232279;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VXxTq0Pwhb4MhOFBAy4e98giPRfKzaM6kTgk9BDeYq0=;
  b=eCPAlddx68oTNLHJNpU3BL6DWy6VRetVXethiHKu9gC+EFKkNN5stQ/H
   U2hDHssmcEFkrpgOCP21kRgBnbbyklifnT2UbXzO0DncoaDjPvElJrPST
   YxXIJgtVDbKM8aLqh4jkgMKmoBYuePemlHx5RuzqaoLyWcgKOo/zwGg/Z
   0m2S1tPhVp/s13UevhoHtivkjR6HGVV1pNzr/OcQCnDvutB1XYSD1RX+4
   UfmbyqvCTK0EInjih45zjiJ6NOp9BGhif7Rd4kBKN3/HGjS4rz+WowRdH
   KMxup1uL8S2gxQ0/pbB+DoQuLd1Mq8BsgMWfdUugIxAeJ9YrihCPj4wVp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="378764990"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="378764990"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 05:24:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="888524755"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="888524755"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 05:24:36 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rA8w5-00000001l5x-3Jn8;
	Mon, 04 Dec 2023 15:24:33 +0200
Date: Mon, 4 Dec 2023 15:24:33 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 09/10] gpiolib: use gpiochip_dup_line_label() in
 for_each helpers
Message-ID: <ZW3TEQok8Ri-epw8@smile.fi.intel.com>
References: <20231204093509.19225-1-brgl@bgdev.pl>
 <20231204093509.19225-10-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204093509.19225-10-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Dec 04, 2023 at 10:35:08AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Rework for_each_requested_gpio_in_range() to use the new helper to
> retrieve a dynamically allocated copy of the descriptor label and free
> it at the end of each iteration. We need to leverage the CLASS()'
> destructor to make sure that the label is freed even when breaking out
> of the loop.

...

> -		if ((label = gpiochip_is_requested(chip, base + i)) == NULL) {} else

I see, but...

> +		if ((*_data.label =							\
> +			gpiochip_dup_line_label(_chip, _base + *_data.i)) == NULL) {}	\

...can we drop this NULL check by using !(...) notation?


-- 
With Best Regards,
Andy Shevchenko



