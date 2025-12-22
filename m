Return-Path: <linux-gpio+bounces-29790-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A069FCD5EC7
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Dec 2025 13:06:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB28D302F80D
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Dec 2025 12:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65B31218AC4;
	Mon, 22 Dec 2025 12:05:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBEB10E3;
	Mon, 22 Dec 2025 12:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766405143; cv=none; b=B7h2NaN5ze1pNhCNIaSNII3pASpzWnEF0o/SjtCImMQjoVeWSpmluyyjcv2I2dwAUWStCXKTHcsQH/dmzp7/qzkz0cYXDNKxms7nuaPvfThMAY+ugGrLvR28acDCpO3ANjTHAoa/eb+iFcjMay47BoFM/Glxuh2YzdoPmlMR8ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766405143; c=relaxed/simple;
	bh=1vs5PnqoRJopA2dwgDUvGNiB2XTPfNa8BYVIucjFDdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=K15pYhhYiNTj1KxM/A042khK8rkn61X0dyuPCkpYCPUWee/E6baNhnkIyxxTQWNXLa005hOIyrPkkG/oo7gwISKuu6biSgU8Qf4NRsy7OviMpGbJMaHZuwyPxahywWFYPdPolHvm6H8xN1lKsBbi/HGSbyYhapGxQ0X+DERKjak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 22 Dec
 2025 20:04:30 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 22 Dec 2025 20:04:30 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Mon, 22 Dec 2025 20:04:28 +0800
Subject: [PATCH 3/3] pinctrl: single: unify pinconf offset mapping with
 pinmux
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251222-upstream_pinctrl_single-v1-3-e4aaa4eeb936@aspeedtech.com>
References: <20251222-upstream_pinctrl_single-v1-0-e4aaa4eeb936@aspeedtech.com>
In-Reply-To: <20251222-upstream_pinctrl_single-v1-0-e4aaa4eeb936@aspeedtech.com>
To: Tony Lindgren <tony@atomide.com>, Haojian Zhuang
	<haojian.zhuang@linaro.org>, Linus Walleij <linusw@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<andrew@codeconstruct.com.au>, <BMC-SW@aspeedtech.com>, Billy Tsai
	<billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766405069; l=1379;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=1vs5PnqoRJopA2dwgDUvGNiB2XTPfNa8BYVIucjFDdw=;
 b=KPPJme3U6fkIHn1FtT3kd0ih6nuPj9XAYNVxDGeebdVJtoiz39Ypx6Fzt78wYNSm94fzGkf3v
 V1Cj+XpbGsODELMs4OPPSxgBvlLairl/eNgDFxv1bvycjWzTWyMGQvB
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=

Use the same register offset calculation for pinconf as pinmux to
properly handle bit-per-mux configurations. Ensures consistent and
correct offset mapping for pin configuration operations.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/pinctrl/pinctrl-single.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index e65ae737b4c5..aaf830315c5d 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -505,7 +505,8 @@ static int pcs_pinconf_get(struct pinctrl_dev *pctldev,
 			continue;
 		}
 
-		offset = pin * (pcs->width / BITS_PER_BYTE);
+		/* Use the same offset mapping as pinmux (handles bit-per-mux) */
+		offset = pcs_pin_reg_offset_get(pcs, pin);
 		data = pcs->read(pcs->base + offset) & func->conf[i].mask;
 		switch (func->conf[i].param) {
 		/* 4 parameters */
@@ -573,7 +574,8 @@ static int pcs_pinconf_set(struct pinctrl_dev *pctldev,
 			if (param != func->conf[i].param)
 				continue;
 
-			offset = pin * (pcs->width / BITS_PER_BYTE);
+			/* Use the same offset mapping as pinmux (handles bit-per-mux) */
+			offset = pcs_pin_reg_offset_get(pcs, pin);
 			data = pcs->read(pcs->base + offset);
 			arg = pinconf_to_config_argument(configs[j]);
 			switch (param) {

-- 
2.34.1


