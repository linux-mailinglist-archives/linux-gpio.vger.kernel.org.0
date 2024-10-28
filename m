Return-Path: <linux-gpio+bounces-12237-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6939B31F5
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 14:43:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC8EF282748
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 13:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6E261DD0F3;
	Mon, 28 Oct 2024 13:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cTpBAQxE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD241DBB38;
	Mon, 28 Oct 2024 13:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730123005; cv=none; b=WmT0UHazGWiGIfhHbvBt31/hgTzAZ3a8Hie7hatsOHQV5/dqnqXxRdgpXXkq4wx7hCUa/GcxqvJyck6Dt3dwfuhjoG2Z+vP1qykwdNlWLRdowYL3FAW3YR/xNSKxOK/01T49dg6W4lIHFK518oKbvccNbtxijADj/Qw9eo6Waws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730123005; c=relaxed/simple;
	bh=iVV4AMHOCixnaEUKzBd+hy5BNPSVaYhfeIQJbV/udtM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CymWn5dL0QslwWfdTZJB358ENLwSs13Q1ozWsU/RKhq77nxz/L1lmKpcv5I3uTJHGE78SrZGlCUKm2t9K0n2vbCr3IzAZj+/VH6cimd6PlcqPwU+8bTzO0FlqP9INR7XiShBeTQBYZiaemTcucbAuJdOpfuC94kwmqtg762uHlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cTpBAQxE; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730123003; x=1761659003;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iVV4AMHOCixnaEUKzBd+hy5BNPSVaYhfeIQJbV/udtM=;
  b=cTpBAQxEJU/eQZYFw4bBKTtxfFdse4lgFUeSJp26e2+gtsZrzzyI/ZVr
   bIFcK74pQGbAwB7eoyG1gDN7o0t7gT0AasjwDXCdhxTmzZR41SL/fLBHt
   Ye9nfFXBv1a4o4N/m/2CEWqvAnv5dRguEfWDOkgj1j3gAxMRMeSNcQl0B
   hiSDtmJDH17OvdXsNtLVYb1DE7QeEJhcnEfqKwOtF1j2aaVZJWnT/P+yf
   0K55XNHH+zCsiLUv55sBKOGE/Tdgo3yUFgrsfnk/R+RESQ7rKXnb6WFB4
   yWrSua4ftCW6RGGr1mvBBQmnNBC4CT3CJBaOif0DVpxAZr9p2PlYE3d89
   A==;
X-CSE-ConnectionGUID: WvKtKrv1QZa0nePIYBLXqQ==
X-CSE-MsgGUID: Rqz4XU9OQ+qU2MDBrk2aOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29581117"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29581117"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 06:43:23 -0700
X-CSE-ConnectionGUID: jvTJM43wTzaasmCiAMV2gQ==
X-CSE-MsgGUID: wPxpB0tSQ1aRc7vUS+z95Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="81723066"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 28 Oct 2024 06:43:21 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 0C45F2DF; Mon, 28 Oct 2024 15:43:19 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 1/1] pinctrl: elkhartlake: Add support for DSW community
Date: Mon, 28 Oct 2024 15:43:17 +0200
Message-ID: <20241028134318.1156754-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hardware has a DSW (Deep Sleep Well) community that might be exposed
by some BIOSes. Add support for it in the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-elkhartlake.c | 38 +++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-elkhartlake.c b/drivers/pinctrl/intel/pinctrl-elkhartlake.c
index 1678634ebc06..3e45d7fb003a 100644
--- a/drivers/pinctrl/intel/pinctrl-elkhartlake.c
+++ b/drivers/pinctrl/intel/pinctrl-elkhartlake.c
@@ -264,6 +264,43 @@ static const struct intel_pinctrl_soc_data ehl_community1_soc_data = {
 	.ncommunities = ARRAY_SIZE(ehl_community1),
 };
 
+static const struct pinctrl_pin_desc ehl_community2_pins[] = {
+	/* DSW */
+	PINCTRL_PIN(0, "BATLOWB"),
+	PINCTRL_PIN(1, "ACPRESENT"),
+	PINCTRL_PIN(2, "LAN_WAKEB"),
+	PINCTRL_PIN(3, "PWRBTNB"),
+	PINCTRL_PIN(4, "SLP_S3B"),
+	PINCTRL_PIN(5, "SLP_S4B"),
+	PINCTRL_PIN(6, "SLP_AB"),
+	PINCTRL_PIN(7, "GPD_7"),
+	PINCTRL_PIN(8, "SUSCLK"),
+	PINCTRL_PIN(9, "SLP_WLANB"),
+	PINCTRL_PIN(10, "SLP_S5B"),
+	PINCTRL_PIN(11, "LANPHYPC"),
+	PINCTRL_PIN(12, "INPUT3VSEL"),
+	PINCTRL_PIN(13, "SLP_LANB"),
+	PINCTRL_PIN(14, "SLP_SUSB"),
+	PINCTRL_PIN(15, "WAKEB"),
+	PINCTRL_PIN(16, "DRAM_RESETB"),
+};
+
+static const struct intel_padgroup ehl_community2_gpps[] = {
+	EHL_GPP(0, 0, 16),	/* DSW */
+};
+
+static const struct intel_community ehl_community2[] = {
+	EHL_COMMUNITY(0, 0, 16, ehl_community2_gpps),
+};
+
+static const struct intel_pinctrl_soc_data ehl_community2_soc_data = {
+	.uid = "2",
+	.pins = ehl_community2_pins,
+	.npins = ARRAY_SIZE(ehl_community2_pins),
+	.communities = ehl_community2,
+	.ncommunities = ARRAY_SIZE(ehl_community2),
+};
+
 static const struct pinctrl_pin_desc ehl_community3_pins[] = {
 	/* CPU */
 	PINCTRL_PIN(0, "HDACPU_SDI"),
@@ -474,6 +511,7 @@ static const struct intel_pinctrl_soc_data ehl_community5_soc_data = {
 static const struct intel_pinctrl_soc_data *ehl_soc_data_array[] = {
 	&ehl_community0_soc_data,
 	&ehl_community1_soc_data,
+	&ehl_community2_soc_data,
 	&ehl_community3_soc_data,
 	&ehl_community4_soc_data,
 	&ehl_community5_soc_data,
-- 
2.43.0.rc1.1336.g36b5255a03ac


