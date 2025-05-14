Return-Path: <linux-gpio+bounces-20154-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DD5AB6C58
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 15:14:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C5001615E1
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 13:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA5CC2798E5;
	Wed, 14 May 2025 13:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="dgH+Lnv8";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="n9p1KVF0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A286270ED7;
	Wed, 14 May 2025 13:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747228436; cv=none; b=M59OXdT5zygiILaa/aBFxJZtb3zXsMk+Va5ZpZOK1qTJAolHnyuO7xFv6LiCOMSTU8YDwgB2QIC8ekQtaUIyFwCyt60hkYhj7rycegUY6lWvCzJL1HIhFva7kAQpJ4FBZ3mAXJBoRUBlmxO0u64pTMCVzURkC4ESZfx+4ZG04S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747228436; c=relaxed/simple;
	bh=or5UfBjLLIq9J/ToAfbKDXbBv+aqPRntotZZWWjW+qI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bawvCj6YoMemytNavS7c+Zdo8LLWIpmjR9aceNIisj0bVsYyRtGutejRHaCOi7yXw9VOGSsyl4nGvGN18SD52XRpUFu5aQcTrF4+Yimv6m4KgdUlCF5PM3bnxDv7WOvYqxhJad2tn9LrL2EJ9cF8YSKhZPxc7EVyikUHtk9Vblw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=dgH+Lnv8; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=n9p1KVF0 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1747228433; x=1778764433;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=E6ZlhwNqkIc8bS8ndqVDEPrpIzYFLHcD4ZpEj+UaKFc=;
  b=dgH+Lnv8dMBH9n/XGWE1DbGD/bt0wPIUjNEIyPLPVXDAKqVlPhdUy8lV
   FVW7foYF/NYR+ILs1t9Yb6zzkISj3y6p8YdyIyl8+90lCcdL6W5raC0Xe
   q1yw/j+feKDNGaxy7btweJmMIxbaXJe5/GCWUGRYKDIxyi+MNEC4zsXg8
   qt4jMTvi0KD80OI7a0+C9V+Ybx/TgFGueb99GCMHEW1MCU4gVyDBWaCdJ
   yLhNIVHzfTqoYdZWoUIaGs53dWbhsEG5LH96AqO5UYx7lqrQq7hYO2/wN
   3Oj7GFu6/cS6fSqw1wNNj3gsFsLcDWFE1nAPZAcp4HH2xVtRDdJen04QO
   A==;
X-CSE-ConnectionGUID: PvQXbft7RuW5guRDsyFfIQ==
X-CSE-MsgGUID: YbPsVIAOSDaMNwCuEVCveQ==
X-IronPort-AV: E=Sophos;i="6.15,288,1739833200"; 
   d="scan'208";a="44072732"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 14 May 2025 15:13:49 +0200
X-CheckPoint: {6824970D-28-C7E25413-F4312D34}
X-MAIL-CPID: 5B977C639CADC4BE1A1787138A311B30_4
X-Control-Analysis: str=0001.0A006370.68249724.005F,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A282D160F91;
	Wed, 14 May 2025 15:13:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1747228425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=E6ZlhwNqkIc8bS8ndqVDEPrpIzYFLHcD4ZpEj+UaKFc=;
	b=n9p1KVF0BjfHIDbIdo44eaJ9KxQ3odmNIDQQVDTOrBzUYl2rttVhtnXFmEDC/xxAuRytyg
	ZebKQ7naGMGsY05prpubHiCUcwd304cie4nPirFii301xutJSGLs44xMr2wvZDRBUCp7EY
	FdiGQRa71dVTirPkgowyMPJbF20bn5LvJdcayCEMpaBC3che3xrr9JBWMi8XIcgCagU7Be
	YJ3ANnXlYLMzgojAHu5EEoD87lS9k4a/EBSr5Dd1J1T1BPNVpUvYBGrLyZQvxo/36ZZu/+
	JQNCzXw/odELuoZseySgA+2qH552Ua6FBGNKIlGoUg14tsVtdvX2qz9ayeudyQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Esben Haabendal <esben@geanix.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] pinctrl: freescale: Depend imx-scu driver on OF
Date: Wed, 14 May 2025 15:13:39 +0200
Message-ID: <20250514131342.755840-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Although the driver itself does not depend on OF itself, it selects
PINCTRL_IMX which depends on OF. So only select PINCTRL_IMX if OF is
already selected to ensure dependencies are met.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v3:
* New patch

This fixes the dependency issues found by the kernel testrobot.
PINCTRL_IMX_SCU selects PINCTRL_IMX unconditionally of OF which is a
hard dependency of the latter one.
Thake this into account.

 drivers/pinctrl/freescale/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index 4c420b21b804d..d1610e2f21427 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -20,6 +20,7 @@ config PINCTRL_IMX_SCMI
 
 config PINCTRL_IMX_SCU
 	tristate
+	depends on OF
 	depends on IMX_SCU || COMPILE_TEST
 	select PINCTRL_IMX
 
-- 
2.43.0


