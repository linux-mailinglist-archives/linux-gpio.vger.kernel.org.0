Return-Path: <linux-gpio+bounces-15273-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E518FA25AA4
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 14:17:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D7993A7516
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 13:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F30B72066FB;
	Mon,  3 Feb 2025 13:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FiKRW/l9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D22205E1C;
	Mon,  3 Feb 2025 13:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738588518; cv=none; b=qrq4THYv+13WjQxT4Uuzs+tCImYxRwD3lITYK77Fn3o31/KsxzGDhGzG762AJCF3q3vBnEdtiI6m5xizs35FaY9/zOwZpkNZACAIRBmK2jDuhTEhcLXUe2ZZDtotNsMRNavdqkiHR5DBWAawpAqIS1XhDY7gcDKPkmb1to2doYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738588518; c=relaxed/simple;
	bh=YTFqR0EQoACqXNuAPbiycPs8gfcRkIcqcIwXkdJK0ro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KN1k6xmm8Lah+swXgz9omXccofGes0J37gyR75El5MjjG2JjVijtnaEAHBMDdJcetVQuim9RLmjwAUHs4xuOmSEJZ5C8XGyh8Xdxd9O2FiEWQLvZbL+zemVWpW9uFySAW8tUKoxoa3Ax1QK9GYGbTVNYpF+jvCu1dU36VuhzSRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FiKRW/l9; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738588517; x=1770124517;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YTFqR0EQoACqXNuAPbiycPs8gfcRkIcqcIwXkdJK0ro=;
  b=FiKRW/l96sutMtxkG+TB9vKg2bdglOEEWWUkFEo2lD1B/cjGZBSx9u69
   fk3Ffo8/UapfphTm1wrlkgnsXX1AEm1MHL3E6MqsrMzLKWR97lekeL4NI
   +mUeKr0sPmohjwYFJb/6P5rUKDaDVZFf8+YcsNSSMa6Q3BmqOyig2HxNO
   wtPjEe2RjoKHvJxMYAibRquN3R+XV16z8CSjkRg6dgjtMnu/4ucNSn2NK
   2EYDMwAC8NZoJ9zqD/K0re4ttXtvF8Y3HPre8dB9USgSBonvqinF5K6S/
   PPIByC+kigpaDWTah4i/u0rDXzyeVG22I0LGc+vs8yrhOHaa8wlM8sc0c
   g==;
X-CSE-ConnectionGUID: noG5CmAfR9acs0Pa4HFNbw==
X-CSE-MsgGUID: pS+mzCTiTUanOLLWABQ5IA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39217699"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="39217699"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:15:13 -0800
X-CSE-ConnectionGUID: y2XlsW9BTRGcOJMR5rkV9w==
X-CSE-MsgGUID: 4SKSjhtOSV22Q2W6rNW2Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="115287403"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 03 Feb 2025 05:15:12 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 438567DD; Mon, 03 Feb 2025 15:15:08 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 14/14] pinctrl: cy8c95x0: Fix comment style
Date: Mon,  3 Feb 2025 15:10:40 +0200
Message-ID: <20250203131506.3318201-15-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250203131506.3318201-1-andriy.shevchenko@linux.intel.com>
References: <20250203131506.3318201-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

One comment style is not aligned with the rest. Fix that.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index f03775341b60..96e34b9eba4a 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -502,7 +502,8 @@ static int cy8c95x0_regmap_update_bits_base(struct cy8c95x0_pinctrl *chip,
 	if (ret < 0)
 		return ret;
 
-	/* Mimic what hardware does and update the cache when a WC bit is written.
+	/*
+	 * Mimic what hardware does and update the cache when a WC bit is written.
 	 * Allows to mark the registers as non-volatile and reduces I/O cycles.
 	 */
 	if (cy8c95x0_wc_register(reg) && (mask & val)) {
-- 
2.43.0.rc1.1336.g36b5255a03ac


