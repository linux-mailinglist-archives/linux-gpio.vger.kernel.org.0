Return-Path: <linux-gpio+bounces-15641-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EFAA2E7AA
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 10:31:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 241AF3A3933
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 09:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEDC01B6547;
	Mon, 10 Feb 2025 09:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ME7JZ1Cw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A3C15B543
	for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 09:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739179866; cv=none; b=Pgzw5FbWGU642qfTgNjG0a+y06zKMDQV5JOrUPmy0aFDDnMnD/gAuL6864EX9/Axs4fp0Mf8z+iw7hXvlaMcfOV4Qm+PxgbJCcjdbCYJ+6Ton1QNCnaKJ6QgtZFHKKe0iib8PwHxo6l6mPN7b6SFKZ9pv7KCGmXJwVfaZelz+o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739179866; c=relaxed/simple;
	bh=dU1ZGYtGo23ECUoIJpiTQJ5ZN2YFY6h3itl9zUPLf7w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hKEpZXqW6PIXrhpV00YPE0qnswKC5XpEbWnSqmfSxH99cd/OQ8qrBfQs4J6JfXiU0WBFIY6ytIWy1ymOTihewH+9akptOftfjiiu6N3c/UoD5NAayrPDlEa8blmeLs3G1k29D+9wLg4y7Kb/WlGBObEb9iDy0hHgNsgv35ciq20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ME7JZ1Cw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739179866; x=1770715866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dU1ZGYtGo23ECUoIJpiTQJ5ZN2YFY6h3itl9zUPLf7w=;
  b=ME7JZ1Cw883NAJT0Au5cMPVxl57oCnYnF9L4HljIEN3DHZGWULjjkvl8
   1SeZurtXJbAnq6xKSZuurrJFjywIl/A8HtmHx3TEkxY08Kr7Uoy/auFUg
   zsf8l5S7grtXLE2V7SUbH1ojImbw7/ut+rIT6c5y4KW6xM0s217w5WDhp
   ARMMMmr46744KTByrMTXQ/HbYkywmrdfm1uCZLVsePSjOVbyWPlCpuVQY
   ICWCA/bKbLuMHy1NVcfSiIIhDdwe5E6hWBRle6B+LxX+iFbI18jylpkhz
   vwMVut3P/fMaCAKnfCD7jWZjuK24p8W7g6yeoHtFGaLqS6m2hR2C6zXEG
   w==;
X-CSE-ConnectionGUID: LCoaPFqcT5iGknir7ESTwQ==
X-CSE-MsgGUID: 7rrmvyu3Rf+CZH9tlDvu8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="57167164"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="57167164"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 01:31:05 -0800
X-CSE-ConnectionGUID: 1J+suDOlTEePwk+xOoiahA==
X-CSE-MsgGUID: dJZxONf/TXGPsZHJdeflmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="112073905"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 01:31:03 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1thQ85-0000000A7lv-05FX;
	Mon, 10 Feb 2025 11:31:01 +0200
Date: Mon, 10 Feb 2025 11:31:00 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: small brainstorm for the problem I have
Message-ID: <Z6nHVEB85AQE-rQE@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo


I have a device that uses SPI bitbang (which is physically represented by bunch
of GPIOs). I want to have a driver of that device to use SPI GPIO driver, but...

1) SPI GPIO has an established DT schema and hardcoded GPIO line names in the
driver.

2) The firmware for the device uses already some names for the GPIO lines that
not compatible with SPI GPIO schema.

So, what would be the best approach here?

I was thinking about the following:
1) Use GPIO aggregator to fake the chip that will provide necessary names.

2) Hack the GPIO library to add a quirk for this specific device to translate
the line names.

3) ...your variant...

-- 
With Best Regards,
Andy Shevchenko



