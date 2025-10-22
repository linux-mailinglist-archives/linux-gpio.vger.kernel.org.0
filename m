Return-Path: <linux-gpio+bounces-27477-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8310FBFCDF9
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 17:28:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20A4B3B196A
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 15:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8290634CFC6;
	Wed, 22 Oct 2025 15:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M6BIHJm4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDB130E83A;
	Wed, 22 Oct 2025 15:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761146760; cv=none; b=f4cNHeuJBn4NJC+9co1J+VYXb4FiThC1LwyCSLn9omMt4cxl3pnpOiXJipG1UxYqRmWaYMPtqzHTeQAw/4cZaaZMfY4fClTvcuotEke44AAzOnVwZ7Hjq/91RE4OSSMHnjmLVYpTCOPxMhxALoaDE9/LA/9M/c3wIWPfyM6DO6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761146760; c=relaxed/simple;
	bh=n5qJuWlLlHVuEXG7O8FDK5axC/YJ5rWbYgBY3q+c6wI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fe7TFeUIsfCHKnFpiQcnInh0YKOeKyMVKvCat2ja3Ab8eBKKITvBYYqzWZDKFr8RNF++1UlhQtN3/O27guQEheCO/JdiRtlxEsfh1qY1dFuA7yVuzx1SK9lJj0/vs4OtV0fXHGMhaUvHNWB24sCLi3fRu4sNcev2ldvg0oXBV5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M6BIHJm4; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761146759; x=1792682759;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n5qJuWlLlHVuEXG7O8FDK5axC/YJ5rWbYgBY3q+c6wI=;
  b=M6BIHJm4y8BhAr61yCqk6SCZwHJZZ+xhHRQNIE4iYcLkL1fOyQ0tjzkd
   zUKYJYj/6uORaKpoY8AnLaRFhOHF1+y6ZjCkLi7m/20KbfD6XZ3+r3RFH
   YRhJJ43Nvaupt+dzPtb4g9q1tgnEEkbC86ekmJq6QlTTRACDDrKmbohX5
   oLtfY4D4O40JMZ8xmIGU7YTwh/rVKTx0Sb7kwD8mn1AMZi4/hLjaQ50+I
   E2lDTCJ8cxhmzr8i3cKtLRkZ9y1fCiRhDgrLssVoaoIjury/WCQzOmKIa
   B/fEYwI7MOleXmd/6nHweDZobCL5CLzSS3xdmsSZOXgArs11/JDj33znM
   Q==;
X-CSE-ConnectionGUID: OZIbabj1SmaVnfwa1ZtmQQ==
X-CSE-MsgGUID: y6r16IKrSUyMzYRcsWYo7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73968761"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="73968761"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 08:25:58 -0700
X-CSE-ConnectionGUID: 4nAf6deMREqTFG3FaCY/0Q==
X-CSE-MsgGUID: xAGf+JgZSgmEWj5zMBbbQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="221093692"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.83])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 08:25:53 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vBaii-00000001jE0-3r3l;
	Wed, 22 Oct 2025 18:25:48 +0300
Date: Wed, 22 Oct 2025 18:25:48 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 01/10] string: provide strends()
Message-ID: <aPj3fCYj-NQdDSQT@smile.fi.intel.com>
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-1-d34aa1fbdf06@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022-gpio-shared-v2-1-d34aa1fbdf06@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 22, 2025 at 03:10:40PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Implement a function for checking if a string ends with a different
> string and add its kunit test cases.

...

> +static void string_test_strends(struct kunit *test)
> +{
> +	KUNIT_EXPECT_TRUE(test, strends("foo-bar", "bar"));
> +	KUNIT_EXPECT_TRUE(test, strends("foo-bar", "-bar"));
> +	KUNIT_EXPECT_TRUE(test, strends("foobar", "foobar"));
> +	KUNIT_EXPECT_TRUE(test, strends("foobar", ""));
> +	KUNIT_EXPECT_FALSE(test, strends("bar", "foobar"));
> +	KUNIT_EXPECT_FALSE(test, strends("", "foo"));
> +	KUNIT_EXPECT_FALSE(test, strends("foobar", "ba"));
> +	KUNIT_EXPECT_TRUE(test, strends("", ""));
> +}

Have you checked the binary file? If you want this to be properly implemented,
generate the suffix. (Actually making the function static inline makes my point
really visible)

-- 
With Best Regards,
Andy Shevchenko



