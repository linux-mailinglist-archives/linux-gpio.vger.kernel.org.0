Return-Path: <linux-gpio+bounces-18183-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF06A7920A
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Apr 2025 17:20:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A1751892B59
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Apr 2025 15:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A8CD23C8A8;
	Wed,  2 Apr 2025 15:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NkOQ6pXD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B61720E70F;
	Wed,  2 Apr 2025 15:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743607208; cv=none; b=VT5pM2lU3u3b/fq1Zm12hcKlWO0q20A8YDleQ0FOJqL5381S1Bkj9ajHa02XLDtNyYEGYkY1uJN9ObcaHn7c2JN1gssbkX6XzbNwwqDprRWIYvy4bQPw+hhQu1PU274XTO6BoRzqldJE6LuwbnujQ3KaDQwIgNxL2z+47vtYAtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743607208; c=relaxed/simple;
	bh=YuiwZ64BLIak85yyhwyjHCS3tbVg/tevpw8kdApePzI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h6qmojW5UEkkLv46vrLB8GejHK7FN/n637yBxM2U3cDImBsYZD4R+i3+fJDMELl5ZYd3OPumG3oVBm+ejp+MhSuuJ8Z/MoQr9xMs9cLwiomg5Bk1NPAUIOZ0wO8VDOLd+Gvo/CrB7ewCTVxTz3/kxot8Hs+uYbivuSeDEsjrQRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NkOQ6pXD; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743607206; x=1775143206;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YuiwZ64BLIak85yyhwyjHCS3tbVg/tevpw8kdApePzI=;
  b=NkOQ6pXDDfkDL2yNMZGtiQ25ZLjIe8qxLgjahlWUiXgGrvrpNeFyqie1
   hKAgLPDiIRIVidvxf84Qr0Sn4vb44xYGcxqG92mKDcx4hI5+vz2h9xjW/
   L07pX5llQ7QT7goExAej+zekvcaTsTHUoOVfkrpsTZ99N1+QYhME1h3Io
   UbATtuyig82Lwtl5MwSIbB9MZ/97y4jvr3rbccyMmnM//y5GbIHG4IaiD
   fmKSFzY4tIUi4uK16wLBq7vgAadAzRpbNaBanL0ZSYFOlWnlNQBZAjVQG
   hDzTnIDBlpNgpfB9XQnAM7v2PQp2EKEBBc6YOC8pvDFc5zhOWARfJazBS
   Q==;
X-CSE-ConnectionGUID: DDfAUHkKQgO0DJFXiZQCsw==
X-CSE-MsgGUID: 1EN8EDv1TJqaU0/s499iaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44988847"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="44988847"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 08:20:06 -0700
X-CSE-ConnectionGUID: fNemeXIIQxmRJ47KaJlkYA==
X-CSE-MsgGUID: mYyU4FEUTJaKF6+Y046OQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="126705784"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 02 Apr 2025 08:20:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 5960026D; Wed, 02 Apr 2025 18:20:02 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] gpiolib: Make gpiod_put() error pointer aware
Date: Wed,  2 Apr 2025 18:20:00 +0300
Message-ID: <20250402152000.1572764-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When non-optional GPIO is requested and failed, the variable that holds
the (invalid) descriptor can contain an error pointer. However, gpiod_put()
ignores that fact and tries to cleanup never requested descriptor.
Make sure gpiod_put() ignores that as well.

While at it, do the same for the gpiod_put_array().

Note, it arguable needs to be present in the stubs as those are usually
called when CONFIG_GPIOLIB=n and GPIOs are requested using gpiod_get_optional()
or similar APIs.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index eda4f51d6bb8..1e96b83d2670 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -5111,8 +5111,10 @@ EXPORT_SYMBOL_GPL(gpiod_get_array_optional);
  */
 void gpiod_put(struct gpio_desc *desc)
 {
-	if (desc)
-		gpiod_free(desc);
+	if (IS_ERR_OR_NULL(desc))
+		return;
+
+	gpiod_free(desc);
 }
 EXPORT_SYMBOL_GPL(gpiod_put);
 
@@ -5124,6 +5126,9 @@ void gpiod_put_array(struct gpio_descs *descs)
 {
 	unsigned int i;
 
+	if (IS_ERR_OR_NULL(descs))
+		return;
+
 	for (i = 0; i < descs->ndescs; i++)
 		gpiod_put(descs->desc[i]);
 
-- 
2.47.2


