Return-Path: <linux-gpio+bounces-28564-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id AE31DC62BF3
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 08:36:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0683A35B59E
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 07:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4C1D31B113;
	Mon, 17 Nov 2025 07:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="UEFH042l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5738031A7F0
	for <linux-gpio@vger.kernel.org>; Mon, 17 Nov 2025 07:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763364977; cv=none; b=c1DljUe3DH4/MOsct7iskUH8sdKVg/Ar8hp4C/X4ouXdW85bbIQyD8nwEPyOL0d+b8PdFhMKZCRPT5KsjS37tWzVw/Oxdl/5qM/mkr/DYyD/DqHYO6lSrWB/C30vBMkA+DyCmCCd8jQIfXe5I7ju/sv5QKEqiXE8ZlXYkpuaZxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763364977; c=relaxed/simple;
	bh=UHZScmHyhXzuJc9TFv4k7XfMWe5fcLRWpORsejkwrIk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=uK3UqejMB28a1JGz2ez9xdOWECfF96KoYl1PSxOedk0KLwZm4r0OocTYfgJnt7PD0CZgzw5sZICo4D99aQ/aNpxz9E6PhegIcCkRHd9MvON8xtl8lLe1mKT39KVh9MfkenSJJ1N5wpL56v1IHqnrlMdQwKpygn7zCMLv6iGj9Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=UEFH042l; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20251117073607epoutp02aba16c9dd3f7d3e1e22df258064550d9~4uxhOcnxb2934929349epoutp02T
	for <linux-gpio@vger.kernel.org>; Mon, 17 Nov 2025 07:36:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20251117073607epoutp02aba16c9dd3f7d3e1e22df258064550d9~4uxhOcnxb2934929349epoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763364967;
	bh=XyvNQNNv23jI9L1LPvT3Avf3sipJVOOQYvHCz1X+IX8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UEFH042lw9mT96Z295z57dfctIn79ezeNITxjvV53wZjK1hZb2/+Fe205fGdPRjsB
	 mGjgaeRHS1Szq7YliajWMSIYlrKJ1huH3DfYAM8dUrPxH0jt5DtGXynow2ZWzYe0ix
	 x4xPCWa14vt5pCAxGpoMQlDfMgQLd0cnBQAnNzFI=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20251117073606epcas2p1e409359c4bdcd3cd455c7c91105a79f0~4uxgsCKtp0038400384epcas2p1C;
	Mon, 17 Nov 2025 07:36:06 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.38.200]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4d900k1Sfkz3hhTB; Mon, 17 Nov
	2025 07:36:06 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20251117073605epcas2p19eac6ba9cf1d4fd2e866e5de6a843802~4uxfxFt7t0038400384epcas2p14;
	Mon, 17 Nov 2025 07:36:05 +0000 (GMT)
Received: from perf.dsn.sec.samsung.com (unknown [10.229.95.91]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251117073605epsmtip23bf90ad7adf80795d0dc135df7adfd41~4uxfsUWf72920629206epsmtip2M;
	Mon, 17 Nov 2025 07:36:05 +0000 (GMT)
From: Youngmin Nam <youngmin.nam@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, peter.griffin@linaro.org,
	semen.protsenko@linaro.org
Cc: ryu.real@samsung.com, d7271.choe@samsung.com,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Youngmin Nam
	<youngmin.nam@samsung.com>
Subject: [RFT PATCH v2 5/5] pinctrl: samsung: rename gs101_pinctrl_* to
 exynos9_pinctrl_*
Date: Mon, 17 Nov 2025 16:41:40 +0900
Message-Id: <20251117074140.4090939-6-youngmin.nam@samsung.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20251117074140.4090939-1-youngmin.nam@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251117073605epcas2p19eac6ba9cf1d4fd2e866e5de6a843802
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251117073605epcas2p19eac6ba9cf1d4fd2e866e5de6a843802
References: <20251117074140.4090939-1-youngmin.nam@samsung.com>
	<CGME20251117073605epcas2p19eac6ba9cf1d4fd2e866e5de6a843802@epcas2p1.samsung.com>

The suspend/resume helpers named gs101_pinctrl_{suspend,resume} are not
GS101-specific. They implement the generic save/restore sequence used by
Exynos9-style controllers that have EINT filter configuration
(eint_fltcon) to preserve.

Rename them to exynos9_pinctrl_{suspend,resume} and update all users:
  - exynos2200, exynos9810, exynos8895, exynos7885, exynos7870,
    exynosautov9, fsd, and gs101 controller tables
  - prototypes in pinctrl-exynos.h
  - definitions in pinctrl-exynos.c

This aligns naming with the earlier macro/doc cleanups (e.g. using
EXYNOS9_PIN_BANK_* and describing eint_fltcon as Exynos9-specific) and
makes the helpers clearly reusable by other Exynos9-like SoCs.

Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 176 +++++++++---------
 drivers/pinctrl/samsung/pinctrl-exynos.c      |   4 +-
 drivers/pinctrl/samsung/pinctrl-exynos.h      |   4 +-
 3 files changed, 92 insertions(+), 92 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index f473a576f58c..3839256ebf80 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -195,16 +195,16 @@ static const struct samsung_pin_ctrl exynos2200_pin_ctrl[] = {
 		.nr_banks	= ARRAY_SIZE(exynos2200_pin_banks0),
 		.eint_gpio_init = exynos_eint_gpio_init,
 		.eint_wkup_init = exynos_eint_wkup_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 1 CMGP data */
 		.pin_banks	= exynos2200_pin_banks1,
 		.nr_banks	= ARRAY_SIZE(exynos2200_pin_banks1),
 		.eint_gpio_init = exynos_eint_gpio_init,
 		.eint_wkup_init = exynos_eint_wkup_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 2 HSI1 data */
 		.pin_banks	= exynos2200_pin_banks2,
@@ -214,36 +214,36 @@ static const struct samsung_pin_ctrl exynos2200_pin_ctrl[] = {
 		.pin_banks	= exynos2200_pin_banks3,
 		.nr_banks	= ARRAY_SIZE(exynos2200_pin_banks3),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 4 HSI1UFS data */
 		.pin_banks	= exynos2200_pin_banks4,
 		.nr_banks	= ARRAY_SIZE(exynos2200_pin_banks4),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 5 PERIC0 data */
 		.pin_banks	= exynos2200_pin_banks5,
 		.nr_banks	= ARRAY_SIZE(exynos2200_pin_banks5),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 6 PERIC1 data */
 		.pin_banks	= exynos2200_pin_banks6,
 		.nr_banks	= ARRAY_SIZE(exynos2200_pin_banks6),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 7 PERIC2 data */
 		.pin_banks	= exynos2200_pin_banks7,
 		.nr_banks	= ARRAY_SIZE(exynos2200_pin_banks7),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 8 VTS data */
 		.pin_banks	= exynos2200_pin_banks8,
@@ -710,8 +710,8 @@ static const struct samsung_pin_ctrl exynos7870_pin_ctrl[] __initconst = {
 		.pin_banks	= exynos7870_pin_banks0,
 		.nr_banks	= ARRAY_SIZE(exynos7870_pin_banks0),
 		.eint_wkup_init = exynos_eint_wkup_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 1 DISPAUD data */
 		.pin_banks	= exynos7870_pin_banks1,
@@ -721,43 +721,43 @@ static const struct samsung_pin_ctrl exynos7870_pin_ctrl[] __initconst = {
 		.pin_banks	= exynos7870_pin_banks2,
 		.nr_banks	= ARRAY_SIZE(exynos7870_pin_banks2),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 3 FSYS data */
 		.pin_banks	= exynos7870_pin_banks3,
 		.nr_banks	= ARRAY_SIZE(exynos7870_pin_banks3),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 4 MIF data */
 		.pin_banks	= exynos7870_pin_banks4,
 		.nr_banks	= ARRAY_SIZE(exynos7870_pin_banks4),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 5 NFC data */
 		.pin_banks	= exynos7870_pin_banks5,
 		.nr_banks	= ARRAY_SIZE(exynos7870_pin_banks5),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 6 TOP data */
 		.pin_banks	= exynos7870_pin_banks6,
 		.nr_banks	= ARRAY_SIZE(exynos7870_pin_banks6),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 7 TOUCH data */
 		.pin_banks	= exynos7870_pin_banks7,
 		.nr_banks	= ARRAY_SIZE(exynos7870_pin_banks7),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	},
 };
 
@@ -819,8 +819,8 @@ static const struct samsung_pin_ctrl exynos7885_pin_ctrl[] __initconst = {
 		.nr_banks	= ARRAY_SIZE(exynos7885_pin_banks0),
 		.eint_gpio_init = exynos_eint_gpio_init,
 		.eint_wkup_init = exynos_eint_wkup_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 1 DISPAUD data */
 		.pin_banks	= exynos7885_pin_banks1,
@@ -830,15 +830,15 @@ static const struct samsung_pin_ctrl exynos7885_pin_ctrl[] __initconst = {
 		.pin_banks	= exynos7885_pin_banks2,
 		.nr_banks	= ARRAY_SIZE(exynos7885_pin_banks2),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 3 TOP data */
 		.pin_banks	= exynos7885_pin_banks3,
 		.nr_banks	= ARRAY_SIZE(exynos7885_pin_banks3),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	},
 };
 
@@ -1175,8 +1175,8 @@ static const struct samsung_pin_ctrl exynos9810_pin_ctrl[] __initconst = {
 		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks0),
 		.eint_wkup_init = exynos_eint_wkup_init,
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend        = exynos_pinctrl_suspend,
-		.resume         = exynos_pinctrl_resume,
+		.suspend        = exynos9_pinctrl_suspend,
+		.resume         = exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 1 AUD data */
 		.pin_banks      = exynos9810_pin_banks1,
@@ -1186,44 +1186,44 @@ static const struct samsung_pin_ctrl exynos9810_pin_ctrl[] __initconst = {
 		.pin_banks      = exynos9810_pin_banks2,
 		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks2),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend        = exynos_pinctrl_suspend,
-		.resume         = exynos_pinctrl_resume,
+		.suspend        = exynos9_pinctrl_suspend,
+		.resume         = exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 3 CMGP data */
 		.pin_banks      = exynos9810_pin_banks3,
 		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks3),
 		.eint_wkup_init = exynos_eint_wkup_init,
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend        = exynos_pinctrl_suspend,
-		.resume         = exynos_pinctrl_resume,
+		.suspend        = exynos9_pinctrl_suspend,
+		.resume         = exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 4 FSYS0 data */
 		.pin_banks      = exynos9810_pin_banks4,
 		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks4),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend        = exynos_pinctrl_suspend,
-		.resume         = exynos_pinctrl_resume,
+		.suspend        = exynos9_pinctrl_suspend,
+		.resume         = exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 5 FSYS1 data */
 		.pin_banks      = exynos9810_pin_banks5,
 		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks5),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend        = exynos_pinctrl_suspend,
-		.resume         = exynos_pinctrl_resume,
+		.suspend        = exynos9_pinctrl_suspend,
+		.resume         = exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 6 PERIC0 data */
 		.pin_banks      = exynos9810_pin_banks6,
 		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks6),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend        = exynos_pinctrl_suspend,
-		.resume         = exynos_pinctrl_resume,
+		.suspend        = exynos9_pinctrl_suspend,
+		.resume         = exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 7 PERIC1 data */
 		.pin_banks      = exynos9810_pin_banks7,
 		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks7),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend        = exynos_pinctrl_suspend,
-		.resume         = exynos_pinctrl_resume,
+		.suspend        = exynos9_pinctrl_suspend,
+		.resume         = exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 8 VTS data */
 		.pin_banks      = exynos9810_pin_banks8,
@@ -1295,8 +1295,8 @@ static const struct samsung_pin_ctrl exynosautov9_pin_ctrl[] __initconst = {
 		.pin_banks      = exynosautov9_pin_banks0,
 		.nr_banks       = ARRAY_SIZE(exynosautov9_pin_banks0),
 		.eint_wkup_init = exynos_eint_wkup_init,
-		.suspend        = exynos_pinctrl_suspend,
-		.resume         = exynos_pinctrl_resume,
+		.suspend        = exynos9_pinctrl_suspend,
+		.resume         = exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 1 AUD data */
 		.pin_banks      = exynosautov9_pin_banks1,
@@ -1306,36 +1306,36 @@ static const struct samsung_pin_ctrl exynosautov9_pin_ctrl[] __initconst = {
 		.pin_banks      = exynosautov9_pin_banks2,
 		.nr_banks       = ARRAY_SIZE(exynosautov9_pin_banks2),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend        = exynos_pinctrl_suspend,
-		.resume         = exynos_pinctrl_resume,
+		.suspend        = exynos9_pinctrl_suspend,
+		.resume         = exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 3 FSYS1 data */
 		.pin_banks      = exynosautov9_pin_banks3,
 		.nr_banks       = ARRAY_SIZE(exynosautov9_pin_banks3),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend        = exynos_pinctrl_suspend,
-		.resume         = exynos_pinctrl_resume,
+		.suspend        = exynos9_pinctrl_suspend,
+		.resume         = exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 4 FSYS2 data */
 		.pin_banks      = exynosautov9_pin_banks4,
 		.nr_banks       = ARRAY_SIZE(exynosautov9_pin_banks4),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend        = exynos_pinctrl_suspend,
-		.resume         = exynos_pinctrl_resume,
+		.suspend        = exynos9_pinctrl_suspend,
+		.resume         = exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 5 PERIC0 data */
 		.pin_banks      = exynosautov9_pin_banks5,
 		.nr_banks       = ARRAY_SIZE(exynosautov9_pin_banks5),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend        = exynos_pinctrl_suspend,
-		.resume         = exynos_pinctrl_resume,
+		.suspend        = exynos9_pinctrl_suspend,
+		.resume         = exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 6 PERIC1 data */
 		.pin_banks      = exynosautov9_pin_banks6,
 		.nr_banks       = ARRAY_SIZE(exynosautov9_pin_banks6),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend        = exynos_pinctrl_suspend,
-		.resume         = exynos_pinctrl_resume,
+		.suspend        = exynos9_pinctrl_suspend,
+		.resume         = exynos9_pinctrl_resume,
 	},
 };
 
@@ -1715,8 +1715,8 @@ static const struct samsung_pin_ctrl exynos8895_pin_ctrl[] __initconst = {
 		.nr_banks	= ARRAY_SIZE(exynos8895_pin_banks0),
 		.eint_gpio_init = exynos_eint_gpio_init,
 		.eint_wkup_init = exynos_eint_wkup_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 1 ABOX data */
 		.pin_banks	= exynos8895_pin_banks1,
@@ -1731,36 +1731,36 @@ static const struct samsung_pin_ctrl exynos8895_pin_ctrl[] __initconst = {
 		.pin_banks	= exynos8895_pin_banks3,
 		.nr_banks	= ARRAY_SIZE(exynos8895_pin_banks3),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 4 FSYS1 data */
 		.pin_banks	= exynos8895_pin_banks4,
 		.nr_banks	= ARRAY_SIZE(exynos8895_pin_banks4),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 5 BUSC data */
 		.pin_banks	= exynos8895_pin_banks5,
 		.nr_banks	= ARRAY_SIZE(exynos8895_pin_banks5),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 6 PERIC0 data */
 		.pin_banks	= exynos8895_pin_banks6,
 		.nr_banks	= ARRAY_SIZE(exynos8895_pin_banks6),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 7 PERIC1 data */
 		.pin_banks	= exynos8895_pin_banks7,
 		.nr_banks	= ARRAY_SIZE(exynos8895_pin_banks7),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	},
 };
 
@@ -1819,15 +1819,15 @@ static const struct samsung_pin_ctrl fsd_pin_ctrl[] __initconst = {
 		.pin_banks	= fsd_pin_banks0,
 		.nr_banks	= ARRAY_SIZE(fsd_pin_banks0),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 1 PERIC data */
 		.pin_banks	= fsd_pin_banks1,
 		.nr_banks	= ARRAY_SIZE(fsd_pin_banks1),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin-controller instance 2 PMU data */
 		.pin_banks	= fsd_pin_banks2,
@@ -1927,16 +1927,16 @@ static const struct samsung_pin_ctrl gs101_pin_ctrl[] __initconst = {
 		.pin_banks	= gs101_pin_alive,
 		.nr_banks	= ARRAY_SIZE(gs101_pin_alive),
 		.eint_wkup_init = exynos_eint_wkup_init,
-		.suspend	= gs101_pinctrl_suspend,
-		.resume		= gs101_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 		.retention_data = &no_retention_data,
 	}, {
 		/* pin banks of gs101 pin-controller (FAR_ALIVE) */
 		.pin_banks	= gs101_pin_far_alive,
 		.nr_banks	= ARRAY_SIZE(gs101_pin_far_alive),
 		.eint_wkup_init = exynos_eint_wkup_init,
-		.suspend	= gs101_pinctrl_suspend,
-		.resume		= gs101_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 		.retention_data = &no_retention_data,
 	}, {
 		/* pin banks of gs101 pin-controller (GSACORE) */
@@ -1951,29 +1951,29 @@ static const struct samsung_pin_ctrl gs101_pin_ctrl[] __initconst = {
 		.pin_banks	= gs101_pin_peric0,
 		.nr_banks	= ARRAY_SIZE(gs101_pin_peric0),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= gs101_pinctrl_suspend,
-		.resume		= gs101_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin banks of gs101 pin-controller (PERIC1) */
 		.pin_banks	= gs101_pin_peric1,
 		.nr_banks	= ARRAY_SIZE(gs101_pin_peric1),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= gs101_pinctrl_suspend,
-		.resume		= gs101_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin banks of gs101 pin-controller (HSI1) */
 		.pin_banks	= gs101_pin_hsi1,
 		.nr_banks	= ARRAY_SIZE(gs101_pin_hsi1),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= gs101_pinctrl_suspend,
-		.resume		= gs101_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	}, {
 		/* pin banks of gs101 pin-controller (HSI2) */
 		.pin_banks	= gs101_pin_hsi2,
 		.nr_banks	= ARRAY_SIZE(gs101_pin_hsi2),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= gs101_pinctrl_suspend,
-		.resume		= gs101_pinctrl_resume,
+		.suspend	= exynos9_pinctrl_suspend,
+		.resume		= exynos9_pinctrl_resume,
 	},
 };
 
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 81fe0b08a9af..a6dd0fa59230 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -906,7 +906,7 @@ void exynos_pinctrl_suspend(struct samsung_pin_bank *bank)
 	}
 }
 
-void gs101_pinctrl_suspend(struct samsung_pin_bank *bank)
+void exynos9_pinctrl_suspend(struct samsung_pin_bank *bank)
 {
 	struct exynos_eint_gpio_save *save = bank->soc_priv;
 	const void __iomem *regs = bank->eint_base;
@@ -961,7 +961,7 @@ void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank)
 	}
 }
 
-void gs101_pinctrl_resume(struct samsung_pin_bank *bank)
+void exynos9_pinctrl_resume(struct samsung_pin_bank *bank)
 {
 	struct exynos_eint_gpio_save *save = bank->soc_priv;
 
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index 24f85ff5ed30..612d9a7e8577 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -225,8 +225,8 @@ void exynosautov920_pinctrl_resume(struct samsung_pin_bank *bank);
 void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank);
 void exynos_pinctrl_suspend(struct samsung_pin_bank *bank);
 void exynos_pinctrl_resume(struct samsung_pin_bank *bank);
-void gs101_pinctrl_suspend(struct samsung_pin_bank *bank);
-void gs101_pinctrl_resume(struct samsung_pin_bank *bank);
+void exynos9_pinctrl_suspend(struct samsung_pin_bank *bank);
+void exynos9_pinctrl_resume(struct samsung_pin_bank *bank);
 struct samsung_retention_ctrl *
 exynos_retention_init(struct samsung_pinctrl_drv_data *drvdata,
 		      const struct samsung_retention_data *data);
-- 
2.39.2


