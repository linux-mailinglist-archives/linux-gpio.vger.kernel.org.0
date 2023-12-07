Return-Path: <linux-gpio+bounces-1076-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF4A808166
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Dec 2023 08:08:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19263B2111F
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Dec 2023 07:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E8D1171C6;
	Thu,  7 Dec 2023 07:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="pfhuARPm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 591DF10C6
	for <linux-gpio@vger.kernel.org>; Wed,  6 Dec 2023 23:08:04 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-548f853fc9eso736188a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 06 Dec 2023 23:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1701932883; x=1702537683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bUZ+Xi6iPmzuyCXXhpAA62gGUIVrLESrpvXoWFTaEuQ=;
        b=pfhuARPm3GVHnoU/4zDsTaU9G0Nrv9BxUZo/odlaf10z7EsmErfaRLzJXlSI3yXK0y
         2TXrP4VEB5/otvxhuWEU7U7+eOeerlhImW+7gf7KcpIBbDPLJYau3t8obFTEiOi5XgsU
         GjOi2aLjbVjagj3aupFMbcNlwpEBrn9EBJqigBYTSgTvXUzS5M+0UtEXo0ZNnaoYhkyt
         tWOP7PRdLSSM1nGDse237gAV+7JqI+BFV7QJrHAG+N+0MmdPjB0e15UPQvPWwCh+k3Ub
         9I6jdqTis/NwQqm5T/f38nYjwhT82CvsJGNscZtEM8Qd5hcc/CInsziPy6gWSYVxZAti
         uvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701932883; x=1702537683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bUZ+Xi6iPmzuyCXXhpAA62gGUIVrLESrpvXoWFTaEuQ=;
        b=MNV16qYob7dQVSEy8X9J/DGgaS4+aVH6psvUEntMMaKxZu2DB1NNlcPVt0mBA4y9M4
         jX1BuYjoCMzqa1lZIWOew9iu5TOKsm5GSkQ2so8d4Zs/JqmPAhi86RirOq/Nh8o7+smx
         3SJvUeK9py85UWNOk1z3OGBuHaIYaWqFYdOKxWhy2Qy0O8joFqxZUWuLNVUEu6ceSI04
         ZB0rDYCIareFVEfwZXFcWow3RlZynZqfduZdXdAy0SKHhz3nNsfK9RioRJWy6tCGnkJh
         cs8QTVD0lpkflTSa89eM7DdjRz5HjkZOPlXgoI1jkYZnKwWRQmT26rOAl4V+0nsyH2SK
         82LQ==
X-Gm-Message-State: AOJu0YyDcR/hhizxX0FdNx0M6gglA4N4uZ1iLfnzqBzK/mA3AM28awqv
	lOaFONfKpma+hysjx1A/od7zxw==
X-Google-Smtp-Source: AGHT+IFYgHoezyMBS5pVMBDpau8vEgCGmmvXZ2I9QTiAtdjmWuM1kvPNgWs04XfPEI5GdV69KGuAkA==
X-Received: by 2002:a50:8ad8:0:b0:54c:d1d5:7682 with SMTP id k24-20020a508ad8000000b0054cd1d57682mr523483edk.22.1701932882708;
        Wed, 06 Dec 2023 23:08:02 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.22])
        by smtp.gmail.com with ESMTPSA id b41-20020a509f2c000000b0054cb88a353dsm420818edf.14.2023.12.06.23.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 23:08:02 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linus.walleij@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	biju.das.jz@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 01/11] clk: renesas: rzg2l-cpg: Check reset monitor registers
Date: Thu,  7 Dec 2023 09:06:50 +0200
Message-Id: <20231207070700.4156557-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207070700.4156557-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231207070700.4156557-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The hardware manual of both RZ/G2L and RZ/G3S specifies that the reset
monitor registers need to be interrogated when the reset signals are
toggled (chapters "Procedures for Supplying and Stopping Reset Signals"
and "Procedure for Activating Modules"). Without this, there is a chance
that different modules (e.g., Ethernet) to not be ready after their reset
signal is toggled, leading to failures (on probe or resume from deep sleep
states).

The same indications are available for RZ/V2M for TYPE-B reset controls.

Fixes: ef3c613ccd68 ("clk: renesas: Add CPG core wrapper for RZ/G2L SoC")
Fixes: 8090bea32484 ("clk: renesas: rzg2l: Add support for RZ/V2M reset monitor reg")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- adapted for CPG versions with monbit (e.g., RZ/V2M)
- added a fixes tag for RZ/V2M
- fixed typos in commit description

 drivers/clk/renesas/rzg2l-cpg.c | 59 ++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 3189c3167ba8..1424fe78f09f 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1416,12 +1416,27 @@ static int rzg2l_cpg_assert(struct reset_controller_dev *rcdev,
 	struct rzg2l_cpg_priv *priv = rcdev_to_priv(rcdev);
 	const struct rzg2l_cpg_info *info = priv->info;
 	unsigned int reg = info->resets[id].off;
-	u32 value = BIT(info->resets[id].bit) << 16;
+	u32 mask = BIT(info->resets[id].bit);
+	s8 monbit = info->resets[id].monbit;
+	u32 value = mask << 16;
 
 	dev_dbg(rcdev->dev, "assert id:%ld offset:0x%x\n", id, CLK_RST_R(reg));
 
 	writel(value, priv->base + CLK_RST_R(reg));
-	return 0;
+
+	if (info->has_clk_mon_regs) {
+		reg = CLK_MRST_R(reg);
+	} else if (monbit >= 0) {
+		reg = CPG_RST_MON;
+		mask = BIT(monbit);
+	} else {
+		/* Wait for at least one cyc le of the RCLK clock (@ ca. 32 kHz) */
+		udelay(35);
+		return 0;
+	}
+
+	return readl_poll_timeout_atomic(priv->base + reg, value,
+					 value & mask, 10, 200);
 }
 
 static int rzg2l_cpg_deassert(struct reset_controller_dev *rcdev,
@@ -1430,14 +1445,28 @@ static int rzg2l_cpg_deassert(struct reset_controller_dev *rcdev,
 	struct rzg2l_cpg_priv *priv = rcdev_to_priv(rcdev);
 	const struct rzg2l_cpg_info *info = priv->info;
 	unsigned int reg = info->resets[id].off;
-	u32 dis = BIT(info->resets[id].bit);
-	u32 value = (dis << 16) | dis;
+	u32 mask = BIT(info->resets[id].bit);
+	s8 monbit = info->resets[id].monbit;
+	u32 value = (mask << 16) | mask;
 
 	dev_dbg(rcdev->dev, "deassert id:%ld offset:0x%x\n", id,
 		CLK_RST_R(reg));
 
 	writel(value, priv->base + CLK_RST_R(reg));
-	return 0;
+
+	if (info->has_clk_mon_regs) {
+		reg = CLK_MRST_R(reg);
+	} else if (monbit >= 0) {
+		reg = CPG_RST_MON;
+		mask = BIT(monbit);
+	} else {
+		/* Wait for at least one cycle of the RCLK clock (@ ca. 32 kHz) */
+		udelay(35);
+		return 0;
+	}
+
+	return readl_poll_timeout_atomic(priv->base + reg, value,
+					 !(value & mask), 10, 200);
 }
 
 static int rzg2l_cpg_reset(struct reset_controller_dev *rcdev,
@@ -1449,9 +1478,6 @@ static int rzg2l_cpg_reset(struct reset_controller_dev *rcdev,
 	if (ret)
 		return ret;
 
-	/* Wait for at least one cycle of the RCLK clock (@ ca. 32 kHz) */
-	udelay(35);
-
 	return rzg2l_cpg_deassert(rcdev, id);
 }
 
@@ -1460,18 +1486,21 @@ static int rzg2l_cpg_status(struct reset_controller_dev *rcdev,
 {
 	struct rzg2l_cpg_priv *priv = rcdev_to_priv(rcdev);
 	const struct rzg2l_cpg_info *info = priv->info;
-	unsigned int reg = info->resets[id].off;
-	u32 bitmask = BIT(info->resets[id].bit);
 	s8 monbit = info->resets[id].monbit;
+	unsigned int reg;
+	u32 bitmask;
 
 	if (info->has_clk_mon_regs) {
-		return !!(readl(priv->base + CLK_MRST_R(reg)) & bitmask);
+		reg = CLK_MRST_R(info->resets[id].off);
+		bitmask = BIT(info->resets[id].bit);
 	} else if (monbit >= 0) {
-		u32 monbitmask = BIT(monbit);
-
-		return !!(readl(priv->base + CPG_RST_MON) & monbitmask);
+		reg = CPG_RST_MON;
+		bitmask = BIT(monbit);
+	} else {
+		return -ENOTSUPP;
 	}
-	return -ENOTSUPP;
+
+	return !!(readl(priv->base + reg) & bitmask);
 }
 
 static const struct reset_control_ops rzg2l_cpg_reset_ops = {
-- 
2.39.2


