Return-Path: <linux-gpio+bounces-15544-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E76FA2C6A0
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 16:12:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 875143AC1EF
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 15:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA2923ED56;
	Fri,  7 Feb 2025 15:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EosEbuOH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7702E1EB1A4;
	Fri,  7 Feb 2025 15:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738941118; cv=none; b=AsOCtexF6L3ys1l5NgGzsJ3CQXD3DJzFiJFxUtS3Jg5TyBnE4H1xOVysR7vU/Xpsw+OeBDRu+6mU3IasBYoGVrVKa//wTHSftXsifiOTeMeSTbCnfbhuJFqpm/eY62XxftM1xa0rtG0l9lpARDDgXsspKBVIBqL8txX3uCef8A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738941118; c=relaxed/simple;
	bh=MJujtC3ZW+VSXyU6bigjgtlw84B4aNtIkZUpkniiuy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h6s4BK1ymM8qpAlyq5NvZBtj0DJKOolpJw1GZo5PKEjmiwW4mH65dufFRS2/NSpb87HqR82OlsQs0RIrV11B3EBsQVjxrqKrhci2MMEfa9V1wAk/3XMIW8Ae6e0k8fwH7iAz5BEGZkz2xArJEjhj36xrkbANwEAXO9xQ2WmHpfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EosEbuOH; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738941116; x=1770477116;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MJujtC3ZW+VSXyU6bigjgtlw84B4aNtIkZUpkniiuy4=;
  b=EosEbuOHb/GqzRpKTlCe34aHcfoT3zQfl6/1wXvqiaRMO//E+sVHXlq7
   Dy8cbxKs1514Ro3CiqIbRt1BObncG/2HteJgo8H8XuD9dC6UL1IJwJBJE
   tFdbCrk/SYTWpM6Mhevbas0uIq7NFUZj8jOtAK93kRPf9QrXGMS2wajId
   1yjjvQHwkreFgCe8WwsfOYjl1GoQpBiEcJQ3772mOM1uC6udjpC5sg7NW
   p5YpKLB5kLnS+pO1QO1nTfauiIZ7HZ+vL9emHku22DuUWzNz6TiS/vwNQ
   t+6aSO4i45Q8GMCYuqfGCPQhQkEo6Dvf3tfK+kwomClVqHWXzGlVi5oJL
   w==;
X-CSE-ConnectionGUID: DCq4+78gQ5yufGligIL+sA==
X-CSE-MsgGUID: U4/1qoPcTiqLT0bbrZBGKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="57120807"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="57120807"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 07:11:53 -0800
X-CSE-ConnectionGUID: RLZdE5Y9Rfepa10I7zZ9yA==
X-CSE-MsgGUID: ubym+9i3SFCE7/IQLaZHbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="111511667"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 07 Feb 2025 07:11:52 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 38DB938D; Fri, 07 Feb 2025 17:11:50 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 2/3] gpiolib: Simplify implementation of for_each_hwgpio_in_range()
Date: Fri,  7 Feb 2025 17:07:35 +0200
Message-ID: <20250207151149.2119765-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250207151149.2119765-1-andriy.shevchenko@linux.intel.com>
References: <20250207151149.2119765-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The whole purpose of the custom CLASS() is to have possibility
to initialise the counter variable _i to 0. This can't be done
with simple __free() macro as it will be not allowed by C language.
OTOH, the CLASS() operates with the pointers and explicit usage of
the scoped variable _data is not needed, since the pointers are kept
the same over the iterations. Simplify the implementation of
for_each_hwgpio_in_range().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/gpio/driver.h | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 024112ef5a78..ae93f75170f2 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -559,11 +559,9 @@ DEFINE_CLASS(_gpiochip_for_each_data,
  */
 #define for_each_hwgpio_in_range(_chip, _i, _base, _size, _label)			\
 	for (CLASS(_gpiochip_for_each_data, _data)(&_label, &_i);			\
-	     *_data.i < _size;								\
-	     (*_data.i)++, kfree(*(_data.label)), *_data.label = NULL)			\
-		if (IS_ERR(*_data.label =						\
-			gpiochip_dup_line_label(_chip, _base + *_data.i))) {}		\
-		else
+	     _i < _size;								\
+	     _i++, kfree(_label), _label = NULL)					\
+		if (IS_ERR(_label = gpiochip_dup_line_label(_chip, _base + _i))) {} else
 
 /**
  * for_each_hwgpio - Iterates over all GPIOs for given chip.
-- 
2.43.0.rc1.1336.g36b5255a03ac


