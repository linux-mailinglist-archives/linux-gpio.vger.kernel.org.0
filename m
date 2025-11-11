Return-Path: <linux-gpio+bounces-28363-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D84C4F8CB
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 20:13:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D22D73B2DAC
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 19:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FE852F6923;
	Tue, 11 Nov 2025 19:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L0J8p8ps"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2854F2E7645;
	Tue, 11 Nov 2025 19:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762888341; cv=none; b=L05K3pCM5xBACEiphxwmBlGOmMiFVGk0J6nhVGX64DsZX3vxmyeo0O7ih5Ux5Kj4WeZyejnTNWy/Ms6j8fIXYHMJviBgRggiyEcrBEq5mYotADtZ11uEFIA5NjquaVw3OTwywXcEcccpg9yllIMnBuZzt34ektU/EgmUkFVBjNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762888341; c=relaxed/simple;
	bh=kx9Y7mw6sSF1tNsMAw0yacCJQ+yNsyoX/REz0l+rzYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QRXVVY/IUy6LvodbhQ9Ozvt6MqIz/bdG8s69M6GXOgtAcrZ4LWXg9Hy+RzUQmBxywVO6HBXSTOs4N5PP1HSwXvgDTyKDUFKd9CW+RKwb4QRioP2HKvF8QoRKW5Y7BkmVI+oXGWhDhRM5ijn/e75cutXX9FI8z0DbzEM2FQMa5r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L0J8p8ps; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762888340; x=1794424340;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kx9Y7mw6sSF1tNsMAw0yacCJQ+yNsyoX/REz0l+rzYo=;
  b=L0J8p8pskICxWOdVmcTDQe6Rwsj3vShHbk7y2M4MwupNOa2bJHDkOA4+
   rmo4RtpIq7BNaqUyxKrk1ROX0LmOkYxj3jJGGalGlSKpOfURFlMJPt0zJ
   kWLSFoVbOl/8Rz+yQKc6Oegf3HRMYJjmaB+zNf+w/PuLMDZ1se6vVOZAw
   LaJ9Z7UIYkoNW0bEM1ljFUM7VUf6LPUuBpVW2KFPAaAa1YiGzqrV3uZpJ
   9tcXAwSPKER0G4NspxQBaMkRXTN47BnI6IM0t5nac91gcHXgjfJEAaU39
   fbUujlaSZQOdr/wFgUZ8taf5yhGdsU3HAUNoY7bojixK8rgMXx47Ng+mP
   A==;
X-CSE-ConnectionGUID: 0tEFngWKQE+GGE+E7wlTsQ==
X-CSE-MsgGUID: vAqGvOClQJ6uQqWA7lM61Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="90425959"
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; 
   d="scan'208";a="90425959"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 11:12:17 -0800
X-CSE-ConnectionGUID: lNVIA7VqT2Wj0h9H2QKPdw==
X-CSE-MsgGUID: 6riAh6MrQVG/TkSN0kV2/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; 
   d="scan'208";a="188334540"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 11 Nov 2025 11:12:16 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 11ED699; Tue, 11 Nov 2025 20:12:15 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 4/5] pinctrl: cherryview: Switch to INTEL_GPP() macro
Date: Tue, 11 Nov 2025 20:10:28 +0100
Message-ID: <20251111191214.1378051-5-andriy.shevchenko@linux.intel.com>
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
 drivers/pinctrl/intel/pinctrl-cherryview.c | 46 ++++++++++------------
 1 file changed, 20 insertions(+), 26 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 9c89ccc3b59d..9c353e1ebe4a 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -92,12 +92,6 @@ struct intel_community_context {
 
 #define PINMODE(m, i)		((m) | ((i) * PINMODE_INVERT_OE))
 
-#define CHV_GPP(start, end)			\
-	{					\
-		.base = (start),		\
-		.size = (end) - (start) + 1,	\
-	}
-
 #define CHV_COMMUNITY(g, i, a)			\
 	{					\
 		.gpps = (g),			\
@@ -258,13 +252,13 @@ static const struct intel_function southwest_functions[] = {
 };
 
 static const struct intel_padgroup southwest_gpps[] = {
-	CHV_GPP(0, 7),
-	CHV_GPP(15, 22),
-	CHV_GPP(30, 37),
-	CHV_GPP(45, 52),
-	CHV_GPP(60, 67),
-	CHV_GPP(75, 82),
-	CHV_GPP(90, 97),
+	INTEL_GPP(0, 0, 7, 0),
+	INTEL_GPP(1, 15, 22, 15),
+	INTEL_GPP(2, 30, 37, 30),
+	INTEL_GPP(3, 45, 52, 45),
+	INTEL_GPP(4, 60, 67, 60),
+	INTEL_GPP(5, 75, 82, 75),
+	INTEL_GPP(6, 90, 97, 90),
 };
 
 /*
@@ -354,11 +348,11 @@ static const struct pinctrl_pin_desc north_pins[] = {
 };
 
 static const struct intel_padgroup north_gpps[] = {
-	CHV_GPP(0, 8),
-	CHV_GPP(15, 27),
-	CHV_GPP(30, 41),
-	CHV_GPP(45, 56),
-	CHV_GPP(60, 72),
+	INTEL_GPP(0, 0, 8, 0),
+	INTEL_GPP(1, 15, 27, 15),
+	INTEL_GPP(2, 30, 41, 30),
+	INTEL_GPP(3, 45, 56, 45),
+	INTEL_GPP(4, 60, 72, 60),
 };
 
 /*
@@ -406,8 +400,8 @@ static const struct pinctrl_pin_desc east_pins[] = {
 };
 
 static const struct intel_padgroup east_gpps[] = {
-	CHV_GPP(0, 11),
-	CHV_GPP(15, 26),
+	INTEL_GPP(0, 0, 11, 0),
+	INTEL_GPP(1, 15, 26, 15),
 };
 
 static const struct intel_community east_communities[] = {
@@ -526,12 +520,12 @@ static const struct intel_function southeast_functions[] = {
 };
 
 static const struct intel_padgroup southeast_gpps[] = {
-	CHV_GPP(0, 7),
-	CHV_GPP(15, 26),
-	CHV_GPP(30, 35),
-	CHV_GPP(45, 52),
-	CHV_GPP(60, 69),
-	CHV_GPP(75, 85),
+	INTEL_GPP(0, 0, 7, 0),
+	INTEL_GPP(1, 15, 26, 15),
+	INTEL_GPP(2, 30, 35, 30),
+	INTEL_GPP(3, 45, 52, 45),
+	INTEL_GPP(4, 60, 69, 60),
+	INTEL_GPP(5, 75, 85, 75),
 };
 
 static const struct intel_community southeast_communities[] = {
-- 
2.50.1


