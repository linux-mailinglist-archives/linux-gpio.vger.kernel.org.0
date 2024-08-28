Return-Path: <linux-gpio+bounces-9290-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F90963041
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 20:41:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E68DC1C22A6D
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 18:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 945961AB536;
	Wed, 28 Aug 2024 18:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I+1DFvmZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF4F1AB53A;
	Wed, 28 Aug 2024 18:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724870433; cv=none; b=J+qriP31eimSWagCqZt5OSTF9QBIK8rSP2hym00BIZ4aPfmWZFFCJgNGT0Tn695V2bmnPggrNWsoJW7c3wCtpa1N3+JCbS+dlGlv0ftrOfvWItPZYssJrNyJSdEmgRpeTWV6TCaOZQ3byZXdvOIn1P/DS19zuy33Tch3kWQSxKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724870433; c=relaxed/simple;
	bh=CxkKV4EjanC1PtR7M+dsh2r5J/NuGl7RXTh5v9l41Ig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jcSqpLnE+ZnnOEui5qIrTs6rOFF1zyR5MqC5AEr/Z7QlhN6KxvwQ3L3N0Tx4ykpHTAUg+sb2rUaHfTHiW83/wAF9zr4V3lxkl/fQGUyzd4Sj/p8EkykI2YPuS3v5tvfSXROSim8C/jQeICMJbBGjiyiYb1awudqRdXojY5IDlHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I+1DFvmZ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724870432; x=1756406432;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CxkKV4EjanC1PtR7M+dsh2r5J/NuGl7RXTh5v9l41Ig=;
  b=I+1DFvmZCYulf30ZJtPW4LHnOh3uAOe/QxLhb2MBGNJQmIBuntBeFfwi
   K1oTVqQDyd/pUoUB0hfzrLywk6iv+xQmQKx8XZHVSMG2q4j+BWCei4Mwu
   ai57bYAj+JMYY7Kmaxm+i0BmhlsUkjEhFJeT7CaZPrQU/bjcGQYoinFP7
   uVhhWyii2Uawfz1zBnScAg9bIl58197c0sdPENHKFoefzTlajI5uiQTrF
   /rLDDcPelRA6JtxYiapvSXWZr2sNRm7sOdZCUnd3T85/jysZlpSlpoKrt
   jH7WPzZPDEsZ9AuOmAh/E9WKtOgJ/NfFG7jWsCl7kNVuT13SJBxSeKxuk
   w==;
X-CSE-ConnectionGUID: CcLHHfEURVigLgGT74ERSg==
X-CSE-MsgGUID: muj+smxvQh2m5LhJ7XOmzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="13265384"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="13265384"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 11:40:27 -0700
X-CSE-ConnectionGUID: +omAr0YoRQ6lof6hPG85bw==
X-CSE-MsgGUID: wENC106gQ4+ekMmJatB9VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="63376486"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 28 Aug 2024 11:40:26 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D0EFC142; Wed, 28 Aug 2024 21:40:24 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 1/5] pinctrl: intel: Move debounce validation out of the lock
Date: Wed, 28 Aug 2024 21:38:34 +0300
Message-ID: <20240828184018.3097386-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240828184018.3097386-1-andriy.shevchenko@linux.intel.com>
References: <20240828184018.3097386-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no need to validate debounce value under the lock.
Move it outside.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 89bd7ce6711a..371b21d8f90b 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -758,6 +758,15 @@ static int intel_config_set_debounce(struct intel_pinctrl *pctrl,
 {
 	void __iomem *padcfg0, *padcfg2;
 	u32 value0, value2;
+	unsigned long v;
+
+	if (debounce) {
+		v = order_base_2(debounce * NSEC_PER_USEC / DEBOUNCE_PERIOD_NSEC);
+		if (v < 3 || v > 15)
+			return -EINVAL;
+	} else {
+		v = 0;
+	}
 
 	padcfg2 = intel_get_padcfg(pctrl, pin, PADCFG2);
 	if (!padcfg2)
@@ -770,21 +779,15 @@ static int intel_config_set_debounce(struct intel_pinctrl *pctrl,
 	value0 = readl(padcfg0);
 	value2 = readl(padcfg2);
 
-	/* Disable glitch filter and debouncer */
-	value0 &= ~PADCFG0_PREGFRXSEL;
-	value2 &= ~(PADCFG2_DEBEN | PADCFG2_DEBOUNCE_MASK);
-
-	if (debounce) {
-		unsigned long v;
-
-		v = order_base_2(debounce * NSEC_PER_USEC / DEBOUNCE_PERIOD_NSEC);
-		if (v < 3 || v > 15)
-			return -EINVAL;
-
+	if (v) {
 		/* Enable glitch filter and debouncer */
 		value0 |= PADCFG0_PREGFRXSEL;
 		value2 |= v << PADCFG2_DEBOUNCE_SHIFT;
 		value2 |= PADCFG2_DEBEN;
+	} else {
+		/* Disable glitch filter and debouncer */
+		value0 &= ~PADCFG0_PREGFRXSEL;
+		value2 &= ~(PADCFG2_DEBEN | PADCFG2_DEBOUNCE_MASK);
 	}
 
 	writel(value0, padcfg0);
-- 
2.43.0.rc1.1336.g36b5255a03ac


