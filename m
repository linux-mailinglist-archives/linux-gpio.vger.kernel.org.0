Return-Path: <linux-gpio+bounces-6302-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CF08C286B
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 18:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B59AA2840FF
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 16:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B76B9171E75;
	Fri, 10 May 2024 16:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OuzbwB8S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D840086AC9;
	Fri, 10 May 2024 16:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715357140; cv=none; b=OHECm2hEPte0/CcbX6NKNSTI7iY24G5hSgDLjFuErY/a8Q3hDKs3+zW2nfmhl8OUB32wnOgSsc89I7TZgX86b8lqZawnZJNZUduoi2he+4wjL+ucZ/LdxZmt7V3mAxgi29PdOMiCht9v3L0AvTBz/txpMlGbdbYfXBpEk7vYZDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715357140; c=relaxed/simple;
	bh=ckj5we4N/Mr2/EJ4drL/UB/mvFMDyVnjq5odoSR/r48=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qrJIE9PXKQmGUj9UVm3qhsWWOaTRodmO+OkyeTJr0ezLKXWlCfNZyzkgm8jGTW8EXCsopFf4QnkQTU3h1B9B17BSrrQzItW362JZjlPe0gVIwcciQ/AJGrSk330DeBDYERzORHX1YbcGWys7fXz+SDJLDew1IsXL1SAIE9WR67Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OuzbwB8S; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715357139; x=1746893139;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ckj5we4N/Mr2/EJ4drL/UB/mvFMDyVnjq5odoSR/r48=;
  b=OuzbwB8SznXv3GQLnvcPsdiCcYe8pdQjjfg04raJ06VjyhvymYsYb8tR
   sGDlwmfFrYbzzyfQc4QNmmQtnrN4rbQRIgTHtDEQLMZCKFRUTIuS+4cxM
   GC8O8ZSXoM0DYvVXz2ZLFXhqNiz5JB/n2CBLZOkIjinp/Eyv6U383I3UG
   MZb5Q4MMVpSRzbRFF/4HNpRseTP+NP6mz0cYOTgl/+qbfZg5cHqcSWLQ1
   JJI4xEBhX8SWMlfUfn+x1q7AVXfsoSwwqpDQgoGDt27CO2DTg2p02IWRg
   AJDomh5FohAnRHGF4nHSvJhfYdFikcpPeqrBp7GVElVQXVj3wJZEpoVvF
   g==;
X-CSE-ConnectionGUID: QqZyACbDSlmk8yP7KSX9ZA==
X-CSE-MsgGUID: 6ZYm18FZS7KPo4wK3Q0PyQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15138974"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="15138974"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 09:05:38 -0700
X-CSE-ConnectionGUID: nx/gAas6R2K029o6hJO2eQ==
X-CSE-MsgGUID: 4UEzSVr8RWmxHesvKJGPZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="34099315"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 10 May 2024 09:05:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 5D5D41AC; Fri, 10 May 2024 19:05:35 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] gpiolib: Show more info for interrupt only lines in debugfs
Date: Fri, 10 May 2024 19:04:46 +0300
Message-ID: <20240510160534.2424281-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Show more info for interrupt only lines in debugfs. It's useful
to monitor the lines that have been never requested as GPIOs,
but IRQs.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

For the reference. May be applied together with
20240508144741.1270912-1-andriy.shevchenko@linux.intel.com
as a precursor.

 drivers/gpio/gpiolib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 1f1673552767..4cd7e05f3e5b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4801,11 +4801,11 @@ static void gpiolib_dbg_show(struct seq_file *s, struct gpio_device *gdev)
 
 	for_each_gpio_desc(gc, desc) {
 		guard(srcu)(&desc->srcu);
-		if (test_bit(FLAG_REQUESTED, &desc->flags)) {
+		is_irq = test_bit(FLAG_USED_AS_IRQ, &desc->flags);
+		if (is_irq || test_bit(FLAG_REQUESTED, &desc->flags)) {
 			gpiod_get_direction(desc);
 			is_out = test_bit(FLAG_IS_OUT, &desc->flags);
 			value = gpio_chip_get_value(gc, desc);
-			is_irq = test_bit(FLAG_USED_AS_IRQ, &desc->flags);
 			active_low = test_bit(FLAG_ACTIVE_LOW, &desc->flags);
 			seq_printf(s, " gpio-%-3u (%-20.20s|%-20.20s) %s %s %s%s\n",
 				   gpio, desc->name ?: "", gpiod_get_label(desc),
-- 
2.43.0.rc1.1336.g36b5255a03ac


