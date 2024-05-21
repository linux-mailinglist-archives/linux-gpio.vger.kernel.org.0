Return-Path: <linux-gpio+bounces-6529-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADFB8CB26E
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 18:48:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C08EF1F2291C
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 16:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04D7F148301;
	Tue, 21 May 2024 16:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jcb0d1Ca"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188A91482F1
	for <linux-gpio@vger.kernel.org>; Tue, 21 May 2024 16:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716310109; cv=none; b=ONhKhZ0M1ZEz10LmpBmK6MPUxLqEbiDwHzZJfJ/qj2A2dDwUiNIc4ANtfL5FyK5Mw2eyaBHesxDXtuBL5rhWDdSPZeurnwkxxrlPCeGHM6+yeORq3hxnC2SrdzKmguauIc1fAfSd1S4UVFe/BKgjcXFDOk3tzrglCOSVf6KXoK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716310109; c=relaxed/simple;
	bh=20VOATDLRsn0OJDx4Nlip92L/g8dIv+dozEDBnBbXLE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q8YeVbm32Qvdi3asawli4jRwPi64N6iiz8jycSdkixnMBFhZtKgqM2clTJ76OrKUIeXnxzcezSn9UhHieGJ08pW9lOK/kCEHLNPFV6Fuc2GsqZJ/rpgmetpIQpWNO68gQhmKIN+8ShgNhJ8FOc6j4drbyyD7HMOW3gO1qdUjr7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jcb0d1Ca; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716310108; x=1747846108;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=20VOATDLRsn0OJDx4Nlip92L/g8dIv+dozEDBnBbXLE=;
  b=Jcb0d1CaM9rOnI4aQL+gqCLLGJDnxwM1iGWWI22Ihzqjk247xjivX40I
   A1bRchgC8U/cf9qc7H03HeOwuSO1iR9I2klDqoySTtP6Zp22qOsXiyOVc
   cs5rj42vv93Tdzhje/MFNtqeghwQvSYYyvn1HhVXYBU/uOJhIKxUsxrLu
   +KPSgrHcQs9yMIjZhR1zj0Ca1e9RWS14cmmSZ4NEh+51IMVK7CgS3iEo+
   vPmTGAIgQUNNLOjeenzABLkJeO6UsvAJpZ7SlI6KVnCMPgWsKwYHTnhNb
   RNZis84lv7jtPXbJngJWDuSEqjTdtVXHX2t4S9CXVb3XU6hgEo5yfel8k
   Q==;
X-CSE-ConnectionGUID: 2j5QxIG9R2GLgri0AEBOew==
X-CSE-MsgGUID: hYS6DU3aTCiz3Cx8lDU5lA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="30044661"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; 
   d="scan'208";a="30044661"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2024 09:48:27 -0700
X-CSE-ConnectionGUID: ePv+3SjSQLSTU8YFMTh8Sw==
X-CSE-MsgGUID: dboaXVzoSF2M5mJ7wehPrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; 
   d="scan'208";a="37812646"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 21 May 2024 09:48:26 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 8DBC43D1; Tue, 21 May 2024 19:48:24 +0300 (EEST)
Date: Tue, 21 May 2024 19:48:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linux GPIO <linux-gpio@vger.kernel.org>,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-gpio for 6.10-2
Message-ID: <ZkzQWCBqagIVsGeB@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linux GPIO maintainers and Linus,

Here is a couple of kinda good to have before v6.10-rc1 is out fixes as one of
the regressions was introduced just in the PR of previous GPIO ACPI work that
landed recently (via GPIO subsystem PR).

Thorsten insisted [1] that it's a good to have flawless v6.10-rc1 than waiting
for a normal process to be taken. Hence I created a tag against the latest
(as of today) snapshot of Linus' tree with two pending fixes. I can't weight
myself the criticalness of the changes, but NULL pointer dereference is kinda
one that better to go via fast track. Hence this PR is sent to GPIO maintainers
and to Linus Torvalds directly.

Note, due to a couple of other regressions (not done by me) [2][3] I wasn't
able to test this PR earlier anyway. But now it's not only compile, but also
HW tested.

Thanks,

With Best Regards,
Andy Shevchenko

Link: https://lore.kernel.org/r/c10a77b6-e7b1-43c0-af38-79092eeb34f1@leemhuis.info [1]
Link: https://lore.kernel.org/r/20240517200534.8EC5F33E@davehans-spike.ostc.intel.com [2]
Link: https://lore.kernel.org/r/20240514190730.2787071-1-andriy.shevchenko@linux.intel.com [3]

The following changes since commit 8f6a15f095a63a83b096d9b29aaff4f0fbe6f6e6:

  Merge tag 'cocci-for-6.10' of git://git.kernel.org/pub/scm/linux/kernel/git/jlawall/linux (2024-05-20 16:00:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v6.10-2

for you to fetch changes up to adbc49a5a8c6fcf7be154c2e30213bbf472940da:

  gpiolib: acpi: Fix failed in acpi_gpiochip_find() by adding parent node match (2024-05-21 18:46:45 +0300)

----------------------------------------------------------------
intel-gpio for v6.10-2

* NULL pointer dereference fix in GPIO APCI library
* Restore ACPI handle matching for GPIO devices represented in banks

The following is an automated git shortlog grouped by driver:

gpiolib:
 -  acpi: Fix failed in acpi_gpiochip_find() by adding parent node match
 -  acpi: Move ACPI device NULL check to acpi_can_fallback_to_crs()

----------------------------------------------------------------
Devyn Liu (1):
      gpiolib: acpi: Fix failed in acpi_gpiochip_find() by adding parent node match

Laura Nao (1):
      gpiolib: acpi: Move ACPI device NULL check to acpi_can_fallback_to_crs()

 drivers/gpio/gpiolib-acpi.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

-- 
With Best Regards,
Andy Shevchenko



