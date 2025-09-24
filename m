Return-Path: <linux-gpio+bounces-26540-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 553ABB99EC9
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 14:48:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D95A1893E2A
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 12:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7E42FDC44;
	Wed, 24 Sep 2025 12:47:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26F02E54DB;
	Wed, 24 Sep 2025 12:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758718077; cv=none; b=WbJwOyzFf75l/CR6rpXLd+Tnx7s0tff/pJt/dLTZ60PSzuRZglM6L7/AFKoJsUIRa/ZHHJhHUq8Xi/2GOr5Uiz3EPIPX5w0zO4Vt3yPS28KhthC9UgSPfSAh7TbLxziZ6oWgQml5r4WUn5JBu0tbZZO0qvF3rKUoEb539xK0AGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758718077; c=relaxed/simple;
	bh=5TSNuzPAg9WHjbXahwqlIx0vxN0mjcIN1EYzs6phRVs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lGXi+HVoOhrK3tCTtyaS+wlESNr+FhjryCHFD2tD4Aq7BSar5GxIfsHO/KgYQrJKLccRrPDejMbNveQGvDHo2SusEtl8c7TecCEFJCfpJYMo6AEE2oT++JAeTlU0t7lnl7KSmSV7qbsMtQkkEVTVSGIspXJypcs4vR0Ho3aCiY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0497C4CEE7;
	Wed, 24 Sep 2025 12:47:55 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: renesas: Remove unneeded semicolons
Date: Wed, 24 Sep 2025 14:47:52 +0200
Message-ID: <99db8c1bfb64980b54a4b5c4988c7935609133e1.1758718027.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Semicolons after end of function braces are not needed, remove them.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-pinctrl for v6.19.

 drivers/pinctrl/renesas/pinctrl-rzt2h.c |  4 ++--
 drivers/pinctrl/renesas/pinctrl-rzv2m.c | 10 +++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzt2h.c b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
index 3872638f5ebb3978..4826ff91cd9060e7 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
@@ -144,7 +144,7 @@ static void rzt2h_pinctrl_set_pfc_mode(struct rzt2h_pinctrl *pctrl,
 	/* Switch to Peripheral pin function with PMC register */
 	reg16 = rzt2h_pinctrl_readb(pctrl, port, PMC(port));
 	rzt2h_pinctrl_writeb(pctrl, port, reg16 | BIT(pin), PMC(port));
-};
+}
 
 static int rzt2h_pinctrl_set_mux(struct pinctrl_dev *pctldev,
 				 unsigned int func_selector,
@@ -182,7 +182,7 @@ static int rzt2h_pinctrl_set_mux(struct pinctrl_dev *pctldev,
 	}
 
 	return 0;
-};
+}
 
 static int rzt2h_map_add_config(struct pinctrl_map *map,
 				const char *group_or_pin,
diff --git a/drivers/pinctrl/renesas/pinctrl-rzv2m.c b/drivers/pinctrl/renesas/pinctrl-rzv2m.c
index dce68f93d2d57f6a..495e7f5d41280dc9 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzv2m.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzv2m.c
@@ -155,7 +155,7 @@ static void rzv2m_pinctrl_set_pfc_mode(struct rzv2m_pinctrl *pctrl,
 	/* Unmask input/output */
 	rzv2m_writel_we(pctrl->base + EN_MSK(port), pin, 0);
 	rzv2m_writel_we(pctrl->base + DI_MSK(port), pin, 0);
-};
+}
 
 static int rzv2m_pinctrl_set_mux(struct pinctrl_dev *pctldev,
 				 unsigned int func_selector,
@@ -186,7 +186,7 @@ static int rzv2m_pinctrl_set_mux(struct pinctrl_dev *pctldev,
 	}
 
 	return 0;
-};
+}
 
 static int rzv2m_map_add_config(struct pinctrl_map *map,
 				const char *group_or_pin,
@@ -551,7 +551,7 @@ static int rzv2m_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 	*config = pinconf_to_config_packed(param, arg);
 
 	return 0;
-};
+}
 
 static int rzv2m_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 				     unsigned int _pin,
@@ -689,7 +689,7 @@ static int rzv2m_pinctrl_pinconf_group_set(struct pinctrl_dev *pctldev,
 	}
 
 	return 0;
-};
+}
 
 static int rzv2m_pinctrl_pinconf_group_get(struct pinctrl_dev *pctldev,
 					   unsigned int group,
@@ -716,7 +716,7 @@ static int rzv2m_pinctrl_pinconf_group_get(struct pinctrl_dev *pctldev,
 	}
 
 	return 0;
-};
+}
 
 static const struct pinctrl_ops rzv2m_pinctrl_pctlops = {
 	.get_groups_count = pinctrl_generic_get_group_count,
-- 
2.43.0


