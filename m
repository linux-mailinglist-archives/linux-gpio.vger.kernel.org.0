Return-Path: <linux-gpio+bounces-28366-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3468AC4F8D4
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 20:14:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DACA3B99CB
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 19:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A7F830506D;
	Tue, 11 Nov 2025 19:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bZsbwKG+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526BD2FC875;
	Tue, 11 Nov 2025 19:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762888344; cv=none; b=EX0GeOwLp/f5vk7pp1vdP5AIkvWWZivysF/bBD3rpLLD3MglRtO5M2EAMFHSH2ztNwqo29P+64HlzaNe5s6K3S5wIt5yGrjqN1dv73+kCGvupZQGc8oJnJ4PeBMP2u1nahrye9J1B/cCutaPqOdpk6cVKqVHN3mz8hNA7Fd8kYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762888344; c=relaxed/simple;
	bh=Ie6kWyfnBMTImnwaWD6SQMzcS5gBq6ZDPtUGmvuISAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ra8t8oMh2gL4QgmUMfBOoKiuo5kstbRsMI9eMV8OjhJWLk+4thRyyRPTc/HFpHqNlMRHuMWWdEzYixUGWceNPOCAli06zZ/5aHM9LbQrUAHskit1zliEABO6Cs7xD2jH6M0WG9XBnxIA6ug4HoMgfAtqJaS/ZyXgwAtyMdrVtvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bZsbwKG+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762888342; x=1794424342;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ie6kWyfnBMTImnwaWD6SQMzcS5gBq6ZDPtUGmvuISAs=;
  b=bZsbwKG+wd09A+hne39m6shjvyZr2tehGhExoSp1Ed3fTejA4MUb+yf0
   hWKhPLl7CDj9MIa1GIYKzAvVp+O3sJGq2LK0HrpJ48utkSxMXm+I3auk9
   NppLHSMSCRfcYXTbFRBZwDWa39IHZKHz8NDx4p/c8esAUMxCSEt8Hikp/
   jkbqX1BN5Uzq3WEPXx7+Ktv13SUetAzdyVYZ+LCULXkFytgPoQvRHEnCe
   GhjvuDDUVAFOBaL0OuDxsAiM1ZjpGkKdNWNQ0NOwnH2uzcTewB10AigxY
   Mpjdok2qJPJguSrYpgw57qlXgOxRgITIAPwDMVqM4QLZbV6cA0RliOIOC
   A==;
X-CSE-ConnectionGUID: waxIaaV9TBi7us3ooZ4fKQ==
X-CSE-MsgGUID: WJbkD6i+Q7+aXCeF3eL6+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="90425965"
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; 
   d="scan'208";a="90425965"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 11:12:19 -0800
X-CSE-ConnectionGUID: XQyqzU38RYmjXpeKWJwZgQ==
X-CSE-MsgGUID: 8Ce0V5toRWG6CFtvn6N10g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; 
   d="scan'208";a="188334542"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 11 Nov 2025 11:12:18 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 164A39A; Tue, 11 Nov 2025 20:12:15 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 5/5] pinctrl: elkhartlake: Switch to INTEL_GPP() macro
Date: Tue, 11 Nov 2025 20:10:29 +0100
Message-ID: <20251111191214.1378051-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251111191214.1378051-1-andriy.shevchenko@linux.intel.com>
References: <20251111191214.1378051-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace custom macro with the recently defined INTEL_GPP().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-elkhartlake.c | 43 +++++++++------------
 1 file changed, 18 insertions(+), 25 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-elkhartlake.c b/drivers/pinctrl/intel/pinctrl-elkhartlake.c
index ab414e07555a..0e8742f31cd4 100644
--- a/drivers/pinctrl/intel/pinctrl-elkhartlake.c
+++ b/drivers/pinctrl/intel/pinctrl-elkhartlake.c
@@ -21,13 +21,6 @@
 #define EHL_GPI_IS	0x100
 #define EHL_GPI_IE	0x120
 
-#define EHL_GPP(r, s, e)				\
-	{						\
-		.reg_num = (r),				\
-		.base = (s),				\
-		.size = ((e) - (s) + 1),		\
-	}
-
 #define EHL_COMMUNITY(b, s, e, g)			\
 	INTEL_COMMUNITY_GPPS(b, s, e, g, EHL)
 
@@ -106,9 +99,9 @@ static const struct pinctrl_pin_desc ehl_community0_pins[] = {
 };
 
 static const struct intel_padgroup ehl_community0_gpps[] = {
-	EHL_GPP(0, 0, 25),	/* GPP_B */
-	EHL_GPP(1, 26, 41),	/* GPP_T */
-	EHL_GPP(2, 42, 66),	/* GPP_G */
+	INTEL_GPP(0, 0, 25, 0),		/* GPP_B */
+	INTEL_GPP(1, 26, 41, 26),	/* GPP_T */
+	INTEL_GPP(2, 42, 66, 42),	/* GPP_G */
 };
 
 static const struct intel_community ehl_community0[] = {
@@ -245,11 +238,11 @@ static const struct pinctrl_pin_desc ehl_community1_pins[] = {
 };
 
 static const struct intel_padgroup ehl_community1_gpps[] = {
-	EHL_GPP(0, 0, 15),	/* GPP_V */
-	EHL_GPP(1, 16, 39),	/* GPP_H */
-	EHL_GPP(2, 40, 60),	/* GPP_D */
-	EHL_GPP(3, 61, 84),	/* GPP_U */
-	EHL_GPP(4, 85, 112),	/* vGPIO */
+	INTEL_GPP(0, 0, 15, 0),		/* GPP_V */
+	INTEL_GPP(1, 16, 39, 16),	/* GPP_H */
+	INTEL_GPP(2, 40, 60, 40),	/* GPP_D */
+	INTEL_GPP(3, 61, 84, 61),	/* GPP_U */
+	INTEL_GPP(4, 85, 112, 85),	/* vGPIO */
 };
 
 static const struct intel_community ehl_community1[] = {
@@ -286,7 +279,7 @@ static const struct pinctrl_pin_desc ehl_community2_pins[] = {
 };
 
 static const struct intel_padgroup ehl_community2_gpps[] = {
-	EHL_GPP(0, 0, 16),	/* DSW */
+	INTEL_GPP(0, 0, 16, 0),		/* DSW */
 };
 
 static const struct intel_community ehl_community2[] = {
@@ -356,10 +349,10 @@ static const struct pinctrl_pin_desc ehl_community3_pins[] = {
 };
 
 static const struct intel_padgroup ehl_community3_gpps[] = {
-	EHL_GPP(0, 0, 16),	/* CPU */
-	EHL_GPP(1, 17, 18),	/* GPP_S */
-	EHL_GPP(2, 19, 42),	/* GPP_A */
-	EHL_GPP(3, 43, 46),	/* vGPIO_3 */
+	INTEL_GPP(0, 0, 16,  0),	/* CPU */
+	INTEL_GPP(1, 17, 18, 17),	/* GPP_S */
+	INTEL_GPP(2, 19, 42, 19),	/* GPP_A */
+	INTEL_GPP(3, 43, 46, 43),	/* vGPIO_3 */
 };
 
 static const struct intel_community ehl_community3[] = {
@@ -462,10 +455,10 @@ static const struct pinctrl_pin_desc ehl_community4_pins[] = {
 };
 
 static const struct intel_padgroup ehl_community4_gpps[] = {
-	EHL_GPP(0, 0, 23),	/* GPP_C */
-	EHL_GPP(1, 24, 48),	/* GPP_F */
-	EHL_GPP(2, 49, 54),	/* HVCMOS */
-	EHL_GPP(3, 55, 79),	/* GPP_E */
+	INTEL_GPP(0, 0, 23, 0),		/* GPP_C */
+	INTEL_GPP(1, 24, 48, 24),	/* GPP_F */
+	INTEL_GPP(2, 49, 54, 49),	/* HVCMOS */
+	INTEL_GPP(3, 55, 79, 55),	/* GPP_E */
 };
 
 static const struct intel_community ehl_community4[] = {
@@ -493,7 +486,7 @@ static const struct pinctrl_pin_desc ehl_community5_pins[] = {
 };
 
 static const struct intel_padgroup ehl_community5_gpps[] = {
-	EHL_GPP(0, 0, 7),	/* GPP_R */
+	INTEL_GPP(0, 0, 7, 0),		/* GPP_R */
 };
 
 static const struct intel_community ehl_community5[] = {
-- 
2.50.1


