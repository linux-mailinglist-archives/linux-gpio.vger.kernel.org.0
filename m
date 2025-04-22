Return-Path: <linux-gpio+bounces-19137-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF33DA97288
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 18:24:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E6F4189B8AA
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 16:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3C68293B57;
	Tue, 22 Apr 2025 16:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="YcygCLAb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A308B293B58;
	Tue, 22 Apr 2025 16:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745339015; cv=pass; b=ZQE0ns/2JPQiM9LgUBFgblxaHE+byl1sOUCKx1T9cu8IRW/w5kxKCm6iEzwfMvkO7Y8aObUwrh3BXd7alcZC8Bufh5O55ktsLvyn2wZsGsl2G++SWm4cbQWpMN2GYE/OsjfeSOjjjKDI+g5L1SvQ9tYSb5LBQy8qdn1WeVCcBPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745339015; c=relaxed/simple;
	bh=LKaMT9vBeRkAZJiI1w0aUuTya24bjt8MRRbOVFhzJA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MccBqRIJRFQD1rJnG7ZW5L0/O4g6yGbAXwBLMKVpuM/z+mW1K1T5F9HIyVr9ZGDyAqGzR+faWwUdsJtz99cJY7kAlDoS33FpsPgcHWopBX7LFNAUmrwe/VK75qy8D7GIdSQQmsxzeG4Kj4o6pepUeWxLTyRa7vYipFUn1f6862o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=YcygCLAb; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
ARC-Seal: i=1; a=rsa-sha256; t=1745338999; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=J2saA4O84j+l4Ecqc9rmzPDzZZcpuaCpfGlscOsbakms1sdzshEoppAmtXSEOuqR4QAGMTW/6xI5RYKHgSOzkX5p2JBAPbGizFjZnjxnzGt5tEZqkLlz20P8a1aeMCtPDZA+uWXAilnyNiF46MwgGa1Vu8RJIiwvMO1/nyv/Ftg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745338999; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Z/q9P4yNkvEyR/a62wervKTvXtaUyeMzkuxzKhSQS9k=; 
	b=ltqV//qb+UXQpwgFXTF1LFiEUMT3alV9EDN/86ftR/tH8A32igQEghdZ5bpJbC1cbJpM34bcRilXix2Yw7K0bpXxgdzr+zXjC75DXCQBlfgtdk7egpCE7KQ3Mhglh6IyKUz/WxujrikUi+FB+uon+DGOmXthbix3kY8FUKITVtU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745338999;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Z/q9P4yNkvEyR/a62wervKTvXtaUyeMzkuxzKhSQS9k=;
	b=YcygCLAb5Zj9lEJaRc+SqZ0OMjomD8C5gD0HzUhxTaIY8tXoSnbU0BpmoQeBNfmn
	9VHQC/I2um7lSFm4Zywln0RzhVsDOyBv0thUc5mZP2aZ5iQIsoG4XNTnEb3PmjTaJsb
	o92xN8tRhd7XxbEvYcvbZtrXMsDl3ehMeotT5+9FpdsGTCU++KFkzCjT+QuyV5S5Dox
	+emc2Ed9JWEUJPVLjZuJhjQalo3Ga1ATqaN3fj3FapBvSwtxl5UHKw04T+CqEluo8lt
	WLe+02QuCHOhEqEi4P1yDofP2n8fsoOZt/WO3UH3D2dSyZWCREoRqJyi69WqvZawdO0
	6rfOYnCX5A==
Received: by mx.zohomail.com with SMTPS id 17453389979451012.0408814583301;
	Tue, 22 Apr 2025 09:23:17 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [RFC PATCH 2/3] pinctrl: starfive: jh7110: support forcing inputs to low/high
Date: Wed, 23 Apr 2025 00:22:49 +0800
Message-ID: <20250422162250.436169-3-uwu@icenowy.me>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422162250.436169-1-uwu@icenowy.me>
References: <20250422162250.436169-1-uwu@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The internal input signals inside JH7110 SoC (output of the pin
controller) could be routed to fixed low/high level instead of external
GPIOs.

Support this feature in the pinctrl driver, which is quite useful for
some peripherals (e.g. USB) because of the low GPIO count of JH7110.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 .../starfive/pinctrl-starfive-jh7110.c        | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
index 1d0d6c224c104..5652f9bb658a2 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
@@ -837,6 +837,41 @@ static void jh7110_disable_clock(void *data)
 	clk_disable_unprepare(data);
 }
 
+static int jh7110_force_input_pins(struct jh7110_pinctrl *sfp,
+				   const char *property, u32 forced_input)
+{
+	int i, nforce;
+	int ret;
+	u32 pin, val;
+	unsigned int offset, shift;
+	struct device *dev = sfp->dev;
+	const struct jh7110_pinctrl_soc_info *info = sfp->info;
+
+	nforce = of_property_count_u32_elems(dev->of_node, property);
+
+	if (nforce > 0) {
+		for (i = 0; i < nforce; i++) {
+			ret = of_property_read_u32_index(dev->of_node, property,
+							 i, &pin);
+			if (ret)
+				return ret;
+
+			offset = 4 * (pin / 4);
+			shift  = 8 * (pin % 4);
+
+			val = readl_relaxed(sfp->base +
+					    info->gpi_reg_base + offset);
+			val &= info->gpi_mask << shift;
+			val |= (forced_input & info->gpi_mask) << shift;
+
+			writel_relaxed(val, sfp->base +
+					    info->gpi_reg_base + offset);
+		}
+	}
+
+	return 0;
+}
+
 int jh7110_pinctrl_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -964,6 +999,14 @@ int jh7110_pinctrl_probe(struct platform_device *pdev)
 
 	dev_info(dev, "StarFive GPIO chip registered %d GPIOs\n", sfp->gc.ngpio);
 
+	ret = jh7110_force_input_pins(sfp, "starfive,force-low-inputs", 0);
+	if (ret)
+		return ret;
+
+	ret = jh7110_force_input_pins(sfp, "starfive,force-high-inputs", 1);
+	if (ret)
+		return ret;
+
 	return pinctrl_enable(sfp->pctl);
 }
 EXPORT_SYMBOL_GPL(jh7110_pinctrl_probe);
-- 
2.49.0


