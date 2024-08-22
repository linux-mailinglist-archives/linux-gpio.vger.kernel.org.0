Return-Path: <linux-gpio+bounces-9004-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C389895BF3A
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 21:58:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 420A61F2671A
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 19:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B808F1D1750;
	Thu, 22 Aug 2024 19:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="kgTOBg/A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F691D0DF8;
	Thu, 22 Aug 2024 19:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724356661; cv=pass; b=QvBLM6mdLTJWuRVNo6A0qy1AvfVRy0AgCst/PFHWTzFy91ENx6Xfip1wq4lR4qF1fprKVu+INLxlXqdunQ+692Go2lA5AQjovc8BtnQVA2shy8B2qeIY2+WEBHlWnD0LQ7H+QSqUOwure4hUcFnskx/TbruKHMPT53A4GvtYsP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724356661; c=relaxed/simple;
	bh=1cHTRBiyuT8JZpg7bJLWamSM2dRId+KaBNlsNfACI4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B6jB/ILxfzUf8Vvq4KEkss2PcFfgay+u9j8urGKCruWWZEwq3guZx7w/7UEDhWPRJatxxYq+8LxjAdeWDktv113XgSoqjXE2BJAFwTkqg1es7eZnhn/cAOX6PYjkXGQSn5+B69QW7dJ4cothrI7OPjgCNqdmRU8QOMnOsQ6jXnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=kgTOBg/A; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: sebastian.reichel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724356644; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Z8aYStN88XnrVLqh2BalbJKQLADmLTkpPBDEiWkEqWebpJaFabGa3W2O4lhm7MYEuOYj3y/dqeBft4z/0Y2+uVWLUlQteDXmdsJC3FBjHffn+FXkLIIk3ZGhg1KRo03vIUaevPnK7LB4zQGsSCItq92CU5x3PtOQrDEjtb1jP+4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724356644; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=uyD1jgLYcHCHmk8wrlzBXsw88Lru62jDx3Q42nc0dV0=; 
	b=NuvtUZVk20ZApOS/ylyDj/nY3VDaJwuRbNywS8vMYS0ibmvmaM3R8kX4WGOLtS3cY+qkyZ9cMUjz8bSHNsV6dzNE9gWcwzuZUXiwEC8Ek7669P9/muuKsyWCyjixgtpDcP07FSyZ0ob9lcqbbew2DrIFDwBZ7QrDQUsqkJyF008=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724356644;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=uyD1jgLYcHCHmk8wrlzBXsw88Lru62jDx3Q42nc0dV0=;
	b=kgTOBg/Aob5IBudGhbviRrJBBsjWAvqBHe2hOWZGcdGwkFP9VRAh1YP3kf2g8X7J
	jEey7nJBLWQXX03BxZH6QxyVIbgEC9eDysG6yP9GyWORb4Z56/69H155eaWzqJIrYzX
	zo8/ESWPxoxSfiqgFh1RgadeKCYh4i32H9CAi4ak=
Received: by mx.zohomail.com with SMTPS id 1724356643158395.86992208662514;
	Thu, 22 Aug 2024 12:57:23 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v4 2/4] grf: rk3576: Add default GRF values
Date: Thu, 22 Aug 2024 15:53:37 -0400
Message-ID: <20240822195706.920567-3-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240822195706.920567-1-detlev.casanova@collabora.com>
References: <20240822195706.920567-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Set SW controlled i3c weak pull up and disable JTAG function on SDMMC IO.

The i3c weak pull up is activated to let all gpio banks be controlled
by the pinctrl driver.

Disabling the JTAG function lets the SDMMC core use its full IO width.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/soc/rockchip/grf.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/rockchip/grf.c b/drivers/soc/rockchip/grf.c
index 5fd62046b28a..4607fc0779e7 100644
--- a/drivers/soc/rockchip/grf.c
+++ b/drivers/soc/rockchip/grf.c
@@ -121,6 +121,29 @@ static const struct rockchip_grf_info rk3566_pipegrf __initconst = {
 	.num_values = ARRAY_SIZE(rk3566_defaults),
 };
 
+#define RK3576_SYSGRF_SOC_CON1		0x0004
+
+static const struct rockchip_grf_value rk3576_defaults_sys_grf[] __initconst = {
+	{ "i3c0 weakpull", RK3576_SYSGRF_SOC_CON1, HIWORD_UPDATE(3, 3, 6) },
+	{ "i3c1 weakpull", RK3576_SYSGRF_SOC_CON1, HIWORD_UPDATE(3, 3, 8) },
+};
+
+static const struct rockchip_grf_info rk3576_sysgrf __initconst = {
+	.values = rk3576_defaults_sys_grf,
+	.num_values = ARRAY_SIZE(rk3576_defaults_sys_grf),
+};
+
+#define RK3576_IOCGRF_MISC_CON		0x04F0
+
+static const struct rockchip_grf_value rk3576_defaults_ioc_grf[] __initconst = {
+	{ "jtag switching", RK3576_IOCGRF_MISC_CON, HIWORD_UPDATE(0, 1, 1) },
+};
+
+static const struct rockchip_grf_info rk3576_iocgrf __initconst = {
+	.values = rk3576_defaults_ioc_grf,
+	.num_values = ARRAY_SIZE(rk3576_defaults_ioc_grf),
+};
+
 #define RK3588_GRF_SOC_CON6		0x0318
 
 static const struct rockchip_grf_value rk3588_defaults[] __initconst = {
@@ -132,7 +155,6 @@ static const struct rockchip_grf_info rk3588_sysgrf __initconst = {
 	.num_values = ARRAY_SIZE(rk3588_defaults),
 };
 
-
 static const struct of_device_id rockchip_grf_dt_match[] __initconst = {
 	{
 		.compatible = "rockchip,rk3036-grf",
@@ -158,6 +180,12 @@ static const struct of_device_id rockchip_grf_dt_match[] __initconst = {
 	}, {
 		.compatible = "rockchip,rk3566-pipe-grf",
 		.data = (void *)&rk3566_pipegrf,
+	}, {
+		.compatible = "rockchip,rk3576-sys-grf",
+		.data = (void *)&rk3576_sysgrf,
+	}, {
+		.compatible = "rockchip,rk3576-ioc-grf",
+		.data = (void *)&rk3576_iocgrf,
 	}, {
 		.compatible = "rockchip,rk3588-sys-grf",
 		.data = (void *)&rk3588_sysgrf,
-- 
2.46.0


