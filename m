Return-Path: <linux-gpio+bounces-23353-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C45B071B3
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 11:31:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 255F8501A3D
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 09:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA23034545;
	Wed, 16 Jul 2025 09:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="avVxyJa3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218AE1FC7E7;
	Wed, 16 Jul 2025 09:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752658255; cv=none; b=bGbD9cfZwYPgVT6+NOxoWrJlkfrTYN8HLFDNorsSPLxIg1pE4gXKJXLyHweRjJsZJ1tx9vn9QXoJuWSbeUsZEt3lpTkSAFtOjFPhCWgXLMqOMScTA1M570giutbqggDNieP1dxLdNB7B++u1kTPG7RTl7HFXa1hBt4yEp2pI0Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752658255; c=relaxed/simple;
	bh=/hsKJp0veEH4CIuPm2ndhfjo7cUmN/Vqzu8v6XUYoSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FJpRHTdTrzxooDNOWExf75gFrKQ6DQmLjr8Ns/H/4F6Nt7cBnFHKiN1ID7d/bI/sOh2VYRgvMrJXogdqUDaHAnDfA6ICOs0yKKnrKRZ5NNNY7O13nRgov+XCwREoAmjJ3jb9ZT+44BoCJtiQo8uen/I+z8EU+UBEAEd8zTUzAnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=avVxyJa3; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752658254; x=1784194254;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=/hsKJp0veEH4CIuPm2ndhfjo7cUmN/Vqzu8v6XUYoSU=;
  b=avVxyJa3jBm/8lAqLuWqmOdp/MdLblWP7HO/WmbNtoLEBq82L0j6Eq21
   9sO/zxJQU/X+MA7+G4Dinl1eXAJulNjmjkkVvzEdgsnyZgZHLwU0r9lQY
   V2pIkGpExO+G1GbAMkSSHtA/5NTKFgaPbG2coPwF1jo9hqJSvjUt+ZrOp
   D2PHjp3XS6LuzfGjZNqdJ9MF6QNQVutRFMZC/r4U6l7F95OMY7/J0Yw5A
   LG/9/MV4brYHmkYrPeEl6owNOZaak+sy6M38XPHNUKotcMFCCUdohnlpV
   vKQh1DFR5lSMYf7aadOiZiTfYJPbp24t42cILaiUO2UHlY8OPeK/3he5P
   Q==;
X-CSE-ConnectionGUID: 2S1o9mjqQgKmXwtuY0ob8g==
X-CSE-MsgGUID: V32a81dCQ8iidn6udVgydw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54835494"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="54835494"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 02:30:53 -0700
X-CSE-ConnectionGUID: BkPsUiPzQyGbtum9ng9Gsg==
X-CSE-MsgGUID: fY1IOsDsQYCXy7pfFCUQKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="157553881"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 02:30:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ubyTP-0000000FtlP-0IQk;
	Wed, 16 Jul 2025 12:30:47 +0300
Date: Wed, 16 Jul 2025 12:30:46 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: devres: release GPIOs in devm_gpiod_put_array()
Message-ID: <aHdxRvJ6fCEiQ6Rn@smile.fi.intel.com>
References: <20250715-gpiolib-devres-put-array-fix-v1-1-970d82a8c887@linaro.org>
 <175265695302.15922.15433902408963854171.b4-ty@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <175265695302.15922.15433902408963854171.b4-ty@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jul 16, 2025 at 11:09:31AM +0200, Bartosz Golaszewski wrote:
> On Tue, 15 Jul 2025 17:00:20 +0100, André Draszik wrote:
> > devm_gpiod_put_array() is meant to undo the effects of
> > devm_gpiod_get_array() - in particular, it should release the GPIOs
> > contained in the array acquired with the latter. It is meant to be the
> > resource-managed version of gpiod_put_array(), and it should behave
> > similar to the non-array version devm_gpiod_put().
> > 
> > Since commit d1d52c6622a6 ("gpiolib: devres: Finish the conversion to
> > use devm_add_action()") it doesn't do that anymore, it just removes the
> > devres action and frees associated memory, but it doesn't actually
> > release the GPIOs.

[...]

> Thanks for catching it, I queued it for v6.16-rc7.

Yeah, I used the release function in parameter, but not changed the call.
Thanks for a good catch!

-- 
With Best Regards,
Andy Shevchenko



