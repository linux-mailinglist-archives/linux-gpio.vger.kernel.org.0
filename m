Return-Path: <linux-gpio+bounces-17731-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7977DA671F7
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 12:01:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08510422B4C
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 11:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A103B20A5CC;
	Tue, 18 Mar 2025 10:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XwfqJ1zq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3911D20967E;
	Tue, 18 Mar 2025 10:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742295587; cv=none; b=gXXAy2y138Z0L4YDHYpTYI9Nv4Vb+4qr6ooBOIVNgldqtmAXbNFhkAexgWY7HZjKKS6ohF5v2aay482RNUSQIzHEepfGlNy3Zyz2TImgiAs4xTjw8iGDpTTysSn3j1q0QhcZGx3vc4lWDu1q4KUo5caEaEfTr3jxpO0KrubrFqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742295587; c=relaxed/simple;
	bh=g0km+zVxRqwRAs2RLk/084gII6D1iqm+5F4kXCBIEnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k+vunozYuCwsc4R3391GRf2ywP4taxEP57V8BAJXDeIQvalwc9be95YNGyHJijQxfgD5xGfJhCv/ML/WW8mXWEWJ4nQGJIuvZdiWunJX1f2LPOF5FveLrCGV5vqTfswx/TAPXIvVhsDzAUuyOPhZCYZkvPg8EAQldQFYViJXSu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XwfqJ1zq; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742295582; x=1773831582;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=g0km+zVxRqwRAs2RLk/084gII6D1iqm+5F4kXCBIEnY=;
  b=XwfqJ1zqLn+GbsqphCzdyFGXQrnlNxeLdkouSy+3bmPI5rp31dOa8VT0
   FSw9ybOXsWrncup9OtgDsd2O48ZiH4S97yXR23dnOk81QvOqwnpJ51BC1
   2uhRvwMmH9/Aeqbjv5jvjuMupcq+OSOfP5YxM5YOZHs39tM0I1nRpfNhU
   n/TODqEgqY4qkzdPZGVxRcFfkABIGsuvpZrrehtYG/W+ffcq881m41Eej
   Zdecog5LD+XfxQM7HNHg7DfIAPIFA6i4ZxIZjBcabAcrw4SNoSZalWMr7
   O4U7Cu6l1AAHWklx8GgwCkR6qxbiAG/PIKrjaEissmQENRg2x8Nd/XWh8
   w==;
X-CSE-ConnectionGUID: lgu2YV3aQzKiGqzmujaziQ==
X-CSE-MsgGUID: vv/ciJ77Qtm43toCdMxc1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="68781766"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="68781766"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 03:59:38 -0700
X-CSE-ConnectionGUID: nhLIuPdfRqmK4abuoQlihw==
X-CSE-MsgGUID: eQ4VFVtRTIqLSmNCiL8z3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="153215697"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 18 Mar 2025 03:59:35 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D00F3CC; Tue, 18 Mar 2025 12:59:33 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jacky Huang <ychuang3@nuvoton.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Cc: Shan-Chun Hung <schung@nuvoton.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/5] pinctrl: npcm8xx: Fix incorrect struct npcm8xx_pincfg assignment
Date: Tue, 18 Mar 2025 12:57:14 +0200
Message-ID: <20250318105932.2090926-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250318105932.2090926-1-andriy.shevchenko@linux.intel.com>
References: <20250318105932.2090926-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sparse is not happy about implementation of the NPCM8XX_PINCFG()

 pinctrl-npcm8xx.c:1314:9: warning: obsolete array initializer, use C99 syntax
 pinctrl-npcm8xx.c:1315:9: warning: obsolete array initializer, use C99 syntax
 ...
 pinctrl-npcm8xx.c:1412:9: warning: obsolete array initializer, use C99 syntax
 pinctrl-npcm8xx.c:1413:9: warning: too many warnings

which uses index-based assignment in a wrong way, i.e. it missed
the equal sign and hence the index is simply ignored, while the
entries are indexed naturally. This is not a problem as the pin
numbering repeats the natural order, but it might be in case of
shuffling the entries. Fix this by adding missed equal sign and
reformat a bit for better readability.

Fixes: acf4884a5717 ("pinctrl: nuvoton: add NPCM8XX pinctrl and GPIO driver")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index 17825bbe1421..f6a1e684a386 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -1290,12 +1290,14 @@ static struct npcm8xx_func npcm8xx_funcs[] = {
 };
 
 #define NPCM8XX_PINCFG(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q) \
-	[a] { .fn0 = fn_ ## b, .reg0 = NPCM8XX_GCR_ ## c, .bit0 = d, \
+	[a] = {								  \
+			.flag = q,					  \
+			.fn0 = fn_ ## b, .reg0 = NPCM8XX_GCR_ ## c, .bit0 = d, \
 			.fn1 = fn_ ## e, .reg1 = NPCM8XX_GCR_ ## f, .bit1 = g, \
 			.fn2 = fn_ ## h, .reg2 = NPCM8XX_GCR_ ## i, .bit2 = j, \
 			.fn3 = fn_ ## k, .reg3 = NPCM8XX_GCR_ ## l, .bit3 = m, \
 			.fn4 = fn_ ## n, .reg4 = NPCM8XX_GCR_ ## o, .bit4 = p, \
-			.flag = q }
+	}
 
 /* Drive strength controlled by NPCM8XX_GP_N_ODSC */
 #define DRIVE_STRENGTH_LO_SHIFT		8
-- 
2.47.2


