Return-Path: <linux-gpio+bounces-26177-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A4408B58113
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 17:44:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B3D6188855E
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 15:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1421657C9F;
	Mon, 15 Sep 2025 15:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HDWs1Muh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E72B19066B
	for <linux-gpio@vger.kernel.org>; Mon, 15 Sep 2025 15:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757950676; cv=none; b=goN43iuthaRfAAKbfE//FThriHdyKKkYROttz6+pRa/OMRTaymxJiE3SdlCy88lVZR7eSeN7oFpLIlOwic2d3YmxWehiqlEaVBCjOX5eoCIfHR8J7T+pWTzgoH4mWHwz6ZbacyCc5xudcIOZLiV673fTU2fegQ4RMfFG63CvPyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757950676; c=relaxed/simple;
	bh=BHTnA/pSz1p9eActp6kGrcSfjSoLyTv3fwQ51kcjV8U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KHtBxZIv2YS3BSNmAwJ9TvP7VP0SmkEISfnFWQSHL3OTP1ycYzWgNmkZR4QTDqmXXvz8jMlNSh3v8Gtmf5WUj5XlIZOgIPaJ8qdYTadRCDYNCkkKc4qzfHcby65CfzOeJDWLz/Wz3UD6r3Wj+q8UcVKXCkWKnYoCq86RPU6ZLOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HDWs1Muh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757950675; x=1789486675;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BHTnA/pSz1p9eActp6kGrcSfjSoLyTv3fwQ51kcjV8U=;
  b=HDWs1Muh8NGvPoxL57tbkj40ZAgdG9y55gBC65bgeMqO0IJCh8iBkuxA
   tROTD7kBSl29gusuuYPiLLMsLhxVtBd6qfcAcQOn/IjCuNXB9NDgT1P05
   +Rm2YTFI6wgkkEsozzbvxy1qSCh3VOgH7IpdJyE4Wv0RkssuDnrGhsKLm
   rS4RMaMfExTglMOr28VfSwgAhp+TVJ6f+FKPwzItTh3DmK9rhcy2KwEfU
   kIENUAW7Y62XaEkQBRpeAaljyofHGuQwX3To4FrU5nQHnKTJOwbsdQtBJ
   cmnFNMxfQVvmzmtrVXNgh8TUU4hDNVbfaxfjxt3wB+prOVMTCjOk6aw4G
   g==;
X-CSE-ConnectionGUID: ahOoeqY9SHuUI6vPzLKbsg==
X-CSE-MsgGUID: EOgFXjTiQrCY5FyQ0H2tvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="60146061"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="60146061"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 08:37:54 -0700
X-CSE-ConnectionGUID: JselV95EREOE14Ko92y+QA==
X-CSE-MsgGUID: RGZg5A86ToiJfJZcQAhI/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="174223989"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 15 Sep 2025 08:37:53 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 2D8FB94; Mon, 15 Sep 2025 17:37:52 +0200 (CEST)
Date: Mon, 15 Sep 2025 17:37:52 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linux GPIO <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-gpio for 6.17-1
Message-ID: <aMgy0K-jpmegAp-d@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

Hi Linux GPIO  maintainers,

This PR contains three fixes for v6.17-rcX, one of which is very important.
Please, pull.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v6.17-1

for you to fetch changes up to 19c839a98c731169f06d32e7c9e00c78a0086ebe:

  gpiolib: acpi: initialize acpi_gpio_info struct (2025-09-15 08:55:40 +0200)

----------------------------------------------------------------
intel-gpio for v6.17-1

* Fix a regression to make GpioInt() by index work again
* Ingnore spurious wakeups from touchpad on GPD G1619-05
* Accept debounce from GpioIo() resources

The following is an automated git shortlog grouped by driver:

gpiolib:
 -  acpi: initialize acpi_gpio_info struct
 -  acpi: Ignore touchpad wakeup on GPD G1619-05
 -  acpi: Program debounce when finding GPIO

----------------------------------------------------------------
Antheas Kapenekakis (1):
      gpiolib: acpi: Ignore touchpad wakeup on GPD G1619-05

Mario Limonciello (AMD) (1):
      gpiolib: acpi: Program debounce when finding GPIO

Sébastien Szymanski (1):
      gpiolib: acpi: initialize acpi_gpio_info struct

 drivers/gpio/gpiolib-acpi-core.c   | 11 +++++++++--
 drivers/gpio/gpiolib-acpi-quirks.c | 12 ++++++++++++
 2 files changed, 21 insertions(+), 2 deletions(-)

-- 
With Best Regards,
Andy Shevchenko



