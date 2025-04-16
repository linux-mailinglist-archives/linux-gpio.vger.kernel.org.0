Return-Path: <linux-gpio+bounces-18936-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E09D6A8B62C
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 11:57:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 659C85A000E
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 09:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C4A7238C3D;
	Wed, 16 Apr 2025 09:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LBK3tsEy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFE6237706;
	Wed, 16 Apr 2025 09:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744797413; cv=none; b=hS4ubstTB1I3McQJeNZykw4DkAoJTeYyO0ebd5minxuPLuZnZ0CbEZTvL+KUzy8DHxlX9GiOpYRcLyiiVvGVX5VO5LgncVDAXZzUbCiGH8E5EDAwD5xBSXQ10/OJde3PvU0bvhb+0VTv8iEW/GqeWIcAHF3mI4BWUIVPChReeZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744797413; c=relaxed/simple;
	bh=k9n/ezhu8Aw4adIPWZ4ZtwBcLA1fpAALYRR39++QcWA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iY09rFmwOtbksTdZbVrCViWUeHK0UMTtTMotGo94pZBAWCVu5Ct7T05otgXxngDlMSbbUOCO9Rbk1AdJ+TOoTYpmB+zEGDD/tfViknjY7Rw2apftt9wAq6aZVsA3Oc9/MeBwZL1UIQ+SU4jr46p3yOOY80OJlhdw3sbCxklvcws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LBK3tsEy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744797411; x=1776333411;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=k9n/ezhu8Aw4adIPWZ4ZtwBcLA1fpAALYRR39++QcWA=;
  b=LBK3tsEyFS11IlW0GROxf4t8iY2cXJQjn7ZGL05uJaoazZYUvQnftFNd
   /4kwedorl9hF3d4UivdDPTSTiw9ZRjHoY4fo7FFMeYAZDqa8ZlbzdhrbD
   UYKBrCe0/Tp0L6DDSBpmBTlJCnQ8Q5NPdVd2IsZvjiMKmUBVpwtECO02o
   IQTiT5Gu80ml5x80tpauIyMr6fjWbl8DULMiMIBSnX6V9emW802KpVits
   dbOnjzpqkcBLfvuuHuQ8I6Td+uZZ61dB7M3keimjRprULYj03114FVLSg
   FRhy9/M6CtlgrP5D+HQtRXy3iKCQYPeBeV5h7uyTSWxykqwqUOe1HH1w2
   Q==;
X-CSE-ConnectionGUID: 7ra6NdRXRUGmRG0r3Nw0MQ==
X-CSE-MsgGUID: aTOnsbTqQsWRWStjoWWewA==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="63743634"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="63743634"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 02:56:49 -0700
X-CSE-ConnectionGUID: 3jJhxwHdQlqxDVr9VNAiWg==
X-CSE-MsgGUID: /uHhI4WeQvy5wadEBv58Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="131323319"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 16 Apr 2025 02:56:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id CE09DF4; Wed, 16 Apr 2025 12:56:46 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 0/8] gpiolib: Some cleanups
Date: Wed, 16 Apr 2025 12:55:08 +0300
Message-ID: <20250416095645.2027695-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Just a three groups of cleanups (some of them may be dependent to the previous
ones compile and logically wise, but I am only aware about couple of patches,
i.e. 3 & 4).

In v2:
- split one patch to two (Linus)
- added tags (Linus)

Andy Shevchenko (8):
  gpiolib: Make taking gpio_lookup_lock consistent
  gpiolib: Convert to use guard()() for gpio_machine_hogs_mutex
  gpiolib: Print actual error when descriptor contains an error pointer
  gpiolib: Revert "Don't WARN on gpiod_put() for optional GPIO"
  gpiolib: Move validate_desc() and Co upper in the code
  gpiolib: Call validate_desc() when VALIDATE_DESC() can't be used
  gpiolib: Reuse return variable in gpiod_to_irq()
  gpiolib: Remove redundant assignment of return variable

 drivers/gpio/gpiolib.c | 123 ++++++++++++++++++-----------------------
 1 file changed, 53 insertions(+), 70 deletions(-)

-- 
2.47.2


