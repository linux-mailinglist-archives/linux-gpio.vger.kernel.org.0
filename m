Return-Path: <linux-gpio+bounces-15552-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 896B6A2C6BE
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 16:19:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACDBA188D379
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 15:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8B6C2405E2;
	Fri,  7 Feb 2025 15:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DukCiBzu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0FD23ED7A;
	Fri,  7 Feb 2025 15:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738941516; cv=none; b=CNpwdngA/uvC0o+O47Bqku1D/UOQNukaSpfdkTPVpMZuqMpx+oateZczHjH2JVFER/1/fo7SqKrGU1TETT84R1Wzwon/DowB+ifNZnsioCGDH6GhoDBk5WV1MFEHS7vXrcpkvN7YxywmmJPgqq7LQj2zTgsP2tZaCcU3qs/PH+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738941516; c=relaxed/simple;
	bh=oYsGlkndwSIdbxMwp9jLVvqe8dsRSKZN34Ak6SuKmJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PxD/+iLl8GdSkSHGUL5kRfBM7rlPtXO23okuaNk4iRTGFD+4nyBJX7JPCdHsG3O9LeMQDJ6c8UNZj00TYQFwE1AP2eEN5Ft4B99CxlcjD6AGig460PSGDYB2rMSF2XoxxSy5QwZY1bHCf5k02iP0XxfxY0G+YFGUdtdGE7dXY6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DukCiBzu; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738941515; x=1770477515;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oYsGlkndwSIdbxMwp9jLVvqe8dsRSKZN34Ak6SuKmJw=;
  b=DukCiBzu5G9gF1eBqCjAy7jNW4U4fZF7uhMtKRcRtcLC3Y9eJQ2ZBmrE
   vmQPrT8Qqdg3B8g8WlSuZfewcWKLtQMShDPQb6PYA9vYGV8mSdHWq3jOE
   qTMGFBih+HRg4BHcUryzu/w4E7zfNWaLZjMHtaJFNMvOgsAFxsKEgvUP1
   mbsY2fMv8dyTPl+UKNRutP45Mm7WgEYSN9PUT2lZpwGsocTkEz7/Ogo0T
   dPC5TszpwAmIIWysndurMLk0qvPFbVgf8MxShN/XD+iJdKp+np4/KhIZW
   E4ALZReWpxx+wNwpouWetLMtZRQPkc8LncoF7FvnL4FL0kbSJ/a3jsI7M
   g==;
X-CSE-ConnectionGUID: Ja+BRg0dQa+ZowHmqXwh3A==
X-CSE-MsgGUID: Nye+7PurQUexkhTkGrz+YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="64941728"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="64941728"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 07:18:33 -0800
X-CSE-ConnectionGUID: qGQlZK9LT4eksl5vlimExg==
X-CSE-MsgGUID: eriNBc3FSSOFv7OlJ3UbYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="112179901"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 07 Feb 2025 07:18:30 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C2FB942B; Fri, 07 Feb 2025 17:18:26 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH v2 6/7] gpio: 74x164: Switch to use dev_err_probe()
Date: Fri,  7 Feb 2025 17:17:13 +0200
Message-ID: <20250207151825.2122419-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250207151825.2122419-1-andriy.shevchenko@linux.intel.com>
References: <20250207151825.2122419-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch to use dev_err_probe() to simplify the error path and
unify a message template.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-74x164.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index ecd691de8539..bbeef03e3797 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -125,10 +125,8 @@ static int gen_74x164_probe(struct spi_device *spi)
 		return ret;
 
 	ret = device_property_read_u32(&spi->dev, "registers-number", &nregs);
-	if (ret) {
-		dev_err(&spi->dev, "Missing 'registers-number' property.\n");
-		return -EINVAL;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Missing 'registers-number' property.\n");
 
 	chip = devm_kzalloc(dev, struct_size(chip, buffer, nregs), GFP_KERNEL);
 	if (!chip)
-- 
2.43.0.rc1.1336.g36b5255a03ac


