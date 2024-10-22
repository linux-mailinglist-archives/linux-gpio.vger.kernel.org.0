Return-Path: <linux-gpio+bounces-11761-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6B69AB316
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 18:00:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82AFC1C2288B
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 16:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 961CE1BBBEA;
	Tue, 22 Oct 2024 15:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Y+iC0y8P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46111B5ED8;
	Tue, 22 Oct 2024 15:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729612787; cv=none; b=XGFmpDzBxqsSXpoitfPNUw3ecBVDtS+aJQ0ULHeuI0CVh8fZLRRX00Jrlu9JL/T57SmBd9kpRbZAhGMPIy9foVaXXrUnnL4KgZDzDsdPKxmJYSOmGszK3fxuIwyu+3gWPRK+FD9qs62PA+mHiuaTlKCYMDxmVC8sLRDfRGjWmvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729612787; c=relaxed/simple;
	bh=xSIxCHXPPElrkvj6WS66ElZgzvvx5KzQNSIeTtqIZmg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZVd+48i9i2LCJ6ow0Kt76NHxuS8/CNMO/FgzUxseRckJW0fNbax4V0NgH49QM+WgFqWW+q5RjoiDH7W7gak3wWNZjrnmWXovuvUD0BHaI9JK0DSR+4UjDa49hZCsTzh60nM2XIIy3XmERPK4tnv/xFekEea3+GihKjXXIEeXJWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Y+iC0y8P; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MBQxXw018502;
	Tue, 22 Oct 2024 17:59:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	kQW+bdk8ydjWN9HExgFvK+Ps3kj+300SslpYdG+7faw=; b=Y+iC0y8PrtPbZ89K
	/6epw9XpGTPUpoNY5tK2C9NmjSfBEmemKdLGhn/GfMA9rUrI/mTdTsoQZD1DPhv5
	JStKquC907ZnyTroOXULGHPaCeX2PWe4ggSiNCwON1mQLr94wU/xpuNoiR9iD9YX
	MfZiTTtmfKM1s2njJqs6gLHwDHjjK0cTXT6ueimrn32uziRmkIz6yTmGZj+0anJg
	oB7/bh0Uw/T17aopXmS0zR8Kxh6/TYVcfNIAtemOsnaA5stXvj2h2xqjcukAHN9A
	rBzhEQMjFtsiOHuLm/MripAOwzsZLOsHRsLPy+q+B3sCXSQf/qyhnmpAvPLojQKl
	3x5xCA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42cpb0v8jn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 17:59:32 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 74B0040049;
	Tue, 22 Oct 2024 17:58:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2705F26E6FE;
	Tue, 22 Oct 2024 17:57:28 +0200 (CEST)
Received: from localhost (10.48.87.33) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 22 Oct
 2024 17:57:27 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        <linux-kernel@vger.kernel.org>,
        =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?=
	<clement.legoffic@foss.st.com>,
        Stephane Danieau
	<stephane.danieau@foss.st.com>,
        Amelie Delaunay
	<amelie.delaunay@foss.st.com>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Valentin Caron <valentin.caron@foss.st.com>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>,
        Cheick Traore <cheick.traore@foss.st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH 01/14] pinctrl: stm32: Declare stm32_pmx_get_mode() as static
Date: Tue, 22 Oct 2024 17:56:45 +0200
Message-ID: <20241022155658.1647350-2-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
References: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

The commit acaa037970f6 ("pinctrl: stm32: Implement .get_direction
gpio_chip callback") exported the function stm32_pmx_get_mode()
and the struct stm32_gpio_bank, but these were never used outside
the file that defines them.

Declare the function as static, drop it from the include file and
drop also the struct, not anymore visible outside the file.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 5 +++--
 drivers/pinctrl/stm32/pinctrl-stm32.h | 4 ----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index a8673739871d8..fc767965d91c6 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -121,6 +121,8 @@ struct stm32_pinctrl {
 	spinlock_t irqmux_lock;
 };
 
+static void stm32_pmx_get_mode(struct stm32_gpio_bank *bank, int pin, u32 *mode, u32 *alt);
+
 static inline int stm32_gpio_pin(int gpio)
 {
 	return gpio % STM32_GPIO_PINS_PER_BANK;
@@ -794,8 +796,7 @@ static int stm32_pmx_set_mode(struct stm32_gpio_bank *bank,
 	return err;
 }
 
-void stm32_pmx_get_mode(struct stm32_gpio_bank *bank, int pin, u32 *mode,
-			u32 *alt)
+static void stm32_pmx_get_mode(struct stm32_gpio_bank *bank, int pin, u32 *mode, u32 *alt)
 {
 	u32 val;
 	int alt_shift = (pin % 8) * 4;
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.h b/drivers/pinctrl/stm32/pinctrl-stm32.h
index 5e5de92ddd58c..8790fef2d58a2 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.h
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.h
@@ -65,11 +65,7 @@ struct stm32_pinctrl_match_data {
 	bool secure_control;
 };
 
-struct stm32_gpio_bank;
-
 int stm32_pctl_probe(struct platform_device *pdev);
-void stm32_pmx_get_mode(struct stm32_gpio_bank *bank,
-			int pin, u32 *mode, u32 *alt);
 int stm32_pinctrl_suspend(struct device *dev);
 int stm32_pinctrl_resume(struct device *dev);
 
-- 
2.34.1


