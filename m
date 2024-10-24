Return-Path: <linux-gpio+bounces-11965-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB909AE9F2
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 17:10:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EF171F21E27
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 15:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 591011EABD7;
	Thu, 24 Oct 2024 15:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HM35wlmT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DE81D63EC;
	Thu, 24 Oct 2024 15:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729782650; cv=none; b=vCOLYc72vQaHsZoknqMCP/RIHtlebO0nHG02Vid20D1ky5nARqah1pGavG9syvYCmJBujbetaIVs+3CMP3Z2fb9SIUiYU1rNLL4g1DFrEA1/hgqZ3d3G84vjkbh7oIjLRoR0tenAhQQLDMU0coUctpkwzlozTRU1GuSykjpBnQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729782650; c=relaxed/simple;
	bh=fg2iUjB9ok9T9PqDKLYeVQmlV/E1hoeONZ0ZobczaDI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nspM+PZTmPqf5fIoI1hnzFyAqk76EEUPeahspkqs6bdqbUjL2JQBa0Jg8Lx75bAj68J4/1t6tHujCG9QybqxskD9aqfOaWiuDsx/0K5OhUS3mok2hZ49GdxhwYtMsqAhMOoV5LQycZ0f8N3LcYp5pnsNE8BAWMU2P2/BBEfBMio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HM35wlmT; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729782648; x=1761318648;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fg2iUjB9ok9T9PqDKLYeVQmlV/E1hoeONZ0ZobczaDI=;
  b=HM35wlmTdG9o8PeJm2F0kEcClOUTU0GCrtOySnwfOb1yqVD+hlZ0Z9Lb
   LPEtPEOkZlwkOnhzP2ike3g2A11xcGTZtNFhq08dqIHBzDsz2f3OgYyGK
   dFWtIfTlGs7tBCU2PoW0xstFJnXOy+z0XAwIiAD+nHzuBAyvVsBGqBUhK
   +dLsFHxhl0o2LEgygbVilhOw/O5jevZdlv9LQtaiAheA9YNH571zjBh+M
   6vUQT5C0GRfpeNqqegDg7AbYukYT1kUnwS7VPEYn4/Wo/uChBPvEsnYZr
   myQC+viejqY+rAGxKgda40A16HFqJ24j3nWhifz/xFFvtKyUTQuSdZ0+0
   g==;
X-CSE-ConnectionGUID: 387OYP2aTQ+O8odNVrx0QQ==
X-CSE-MsgGUID: w/X7GDRJRA2M00aNmpSGAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="54816190"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="54816190"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 08:10:48 -0700
X-CSE-ConnectionGUID: Uy38wwZtQYWvaONhTs51WQ==
X-CSE-MsgGUID: vcsXL/HhTgiDkIYxQf6tWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="103933258"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 24 Oct 2024 08:10:46 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id E3472252; Thu, 24 Oct 2024 18:10:44 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 1/1] pinctrl: intel: Add a human readable decoder for pull bias values
Date: Thu, 24 Oct 2024 18:10:44 +0300
Message-ID: <20241024151044.4038250-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a human readable decoder for pull bias values in the comment.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index f6f6d3970d5d..86cabb73904f 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -85,6 +85,18 @@
 #define PADCFG1_TERM_UP			BIT(13)
 #define PADCFG1_TERM_SHIFT		10
 #define PADCFG1_TERM_MASK		GENMASK(12, 10)
+/*
+ * Bit 0  Bit 1  Bit 2			Value, Ohms
+ *
+ *   0      0      0			-
+ *   0      0      1			20000
+ *   0      1      0			5000
+ *   0      1      1			~4000
+ *   1      0      0			1000 (if supported)
+ *   1      0      1			~952 (if supported)
+ *   1      1      0			~833 (if supported)
+ *   1      1      1			~800 (if supported)
+ */
 #define PADCFG1_TERM_20K		BIT(2)
 #define PADCFG1_TERM_5K			BIT(1)
 #define PADCFG1_TERM_4K			(BIT(2) | BIT(1))
-- 
2.43.0.rc1.1336.g36b5255a03ac


