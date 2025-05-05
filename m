Return-Path: <linux-gpio+bounces-19616-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4657CAAA470
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 01:29:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EB60188131E
	for <lists+linux-gpio@lfdr.de>; Mon,  5 May 2025 23:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A3672FF291;
	Mon,  5 May 2025 22:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="grVYawDu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103AB2FF281;
	Mon,  5 May 2025 22:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746483982; cv=none; b=h4p0mdXk/BKFa2yo+JAnY4pTRW9eGovJTc8n5PUsiWPamPJejGehLmgcMQfLclfwhKMh38RKpHZ++Y72rm+jt1njmjKxs8JJcjuRCHmBF5EqyESIOKEvNbjaGoPYpYHMda8wIcgwdOjSRrZonDd6yTYlrtcqz+P/lInwN70wz4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746483982; c=relaxed/simple;
	bh=1j4dgteCUSZ7Abj/VzXKM8PzCdf0Yf0zwcztFml+q24=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PCGUA3mcqznfGvEvPR8uetCNzpLm00PS8ICLBoUuJ47H8wqPyUYW8wvcPcdwigteMIwM5qgRXeeiMIUmtNHZ2aggZ2Mqd4sv+sD25+eia07wJHPB8AQtKvdFBZSkrzAkqrPuysuCit6e8h3fy1S48/RYxNbzfaURXoqHRu4EdzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=grVYawDu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9AD3C4CEE4;
	Mon,  5 May 2025 22:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483981;
	bh=1j4dgteCUSZ7Abj/VzXKM8PzCdf0Yf0zwcztFml+q24=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=grVYawDuBYHu5x1u91ICC6o2t8Qm7w1fcwg68QkuhI1BGIipSJUsWJZd0PnzYBlIb
	 xo+5KIADrErRsSO6VlrKnh6DEooS2gEaeain604kSQHNjI0LdePcirDnr/FeyoYvSa
	 ylg5L90N/cCJYFP/vUlNIoqfSOfnIMDfAxxWpszNYDuPHODIbzkYOIfc8Dbvc8nCyV
	 8wCZaeh8VVCD/+UuEcjZN18LWGFpPG40hP/ku7NkO+NSA3q86UIWoE5hYeoPkw7OkP
	 TUxg6KSeCyWj+PoYUH/Ri5WmtKqIrDA9Fh+5ZEsXJyAIo/3KH1eQVLU+J73Gxx9fhK
	 AHXIucN+s9WbA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	unicorn_wang@outlook.com,
	harshit.m.mogalapalli@oracle.com,
	linux-gpio@vger.kernel.org,
	sophgo@lists.linux.dev
Subject: [PATCH AUTOSEL 6.14 303/642] pinctrl: sophgo: avoid to modify untouched bit when setting cv1800 pinconf
Date: Mon,  5 May 2025 18:08:39 -0400
Message-Id: <20250505221419.2672473-303-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit

From: Inochi Amaoto <inochiama@gmail.com>

[ Upstream commit ef1a5121ae3da02372fcb66d9632ed3d47ad5637 ]

When setting pinconf configuration for cv1800 SoC, the driver just writes
the value. It may zero some bits of the pinconf register and cause some
unexpected error. Add a mask to avoid this.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Link: https://lore.kernel.org/20250211051801.470800-2-inochiama@gmail.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/sophgo/pinctrl-cv18xx.c | 33 +++++++++++++++++--------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/sophgo/pinctrl-cv18xx.c b/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
index 57f2674e75d68..84b4850771ce2 100644
--- a/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
+++ b/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
@@ -574,10 +574,10 @@ static int cv1800_pinconf_compute_config(struct cv1800_pinctrl *pctrl,
 					 struct cv1800_pin *pin,
 					 unsigned long *configs,
 					 unsigned int num_configs,
-					 u32 *value)
+					 u32 *value, u32 *mask)
 {
 	int i;
-	u32 v = 0;
+	u32 v = 0, m = 0;
 	enum cv1800_pin_io_type type;
 	int ret;
 
@@ -596,10 +596,12 @@ static int cv1800_pinconf_compute_config(struct cv1800_pinctrl *pctrl,
 		case PIN_CONFIG_BIAS_PULL_DOWN:
 			v &= ~PIN_IO_PULLDOWN;
 			v |= FIELD_PREP(PIN_IO_PULLDOWN, arg);
+			m |= PIN_IO_PULLDOWN;
 			break;
 		case PIN_CONFIG_BIAS_PULL_UP:
 			v &= ~PIN_IO_PULLUP;
 			v |= FIELD_PREP(PIN_IO_PULLUP, arg);
+			m |= PIN_IO_PULLUP;
 			break;
 		case PIN_CONFIG_DRIVE_STRENGTH_UA:
 			ret = cv1800_pinctrl_oc2reg(pctrl, pin, arg);
@@ -607,6 +609,7 @@ static int cv1800_pinconf_compute_config(struct cv1800_pinctrl *pctrl,
 				return ret;
 			v &= ~PIN_IO_DRIVE;
 			v |= FIELD_PREP(PIN_IO_DRIVE, ret);
+			m |= PIN_IO_DRIVE;
 			break;
 		case PIN_CONFIG_INPUT_SCHMITT_UV:
 			ret = cv1800_pinctrl_schmitt2reg(pctrl, pin, arg);
@@ -614,6 +617,7 @@ static int cv1800_pinconf_compute_config(struct cv1800_pinctrl *pctrl,
 				return ret;
 			v &= ~PIN_IO_SCHMITT;
 			v |= FIELD_PREP(PIN_IO_SCHMITT, ret);
+			m |= PIN_IO_SCHMITT;
 			break;
 		case PIN_CONFIG_POWER_SOURCE:
 			/* Ignore power source as it is always fixed */
@@ -621,10 +625,12 @@ static int cv1800_pinconf_compute_config(struct cv1800_pinctrl *pctrl,
 		case PIN_CONFIG_SLEW_RATE:
 			v &= ~PIN_IO_OUT_FAST_SLEW;
 			v |= FIELD_PREP(PIN_IO_OUT_FAST_SLEW, arg);
+			m |= PIN_IO_OUT_FAST_SLEW;
 			break;
 		case PIN_CONFIG_BIAS_BUS_HOLD:
 			v &= ~PIN_IO_BUS_HOLD;
 			v |= FIELD_PREP(PIN_IO_BUS_HOLD, arg);
+			m |= PIN_IO_BUS_HOLD;
 			break;
 		default:
 			return -ENOTSUPP;
@@ -632,17 +638,19 @@ static int cv1800_pinconf_compute_config(struct cv1800_pinctrl *pctrl,
 	}
 
 	*value = v;
+	*mask = m;
 
 	return 0;
 }
 
 static int cv1800_pin_set_config(struct cv1800_pinctrl *pctrl,
 				 unsigned int pin_id,
-				 u32 value)
+				 u32 value, u32 mask)
 {
 	struct cv1800_pin *pin = cv1800_get_pin(pctrl, pin_id);
 	unsigned long flags;
 	void __iomem *addr;
+	u32 reg;
 
 	if (!pin)
 		return -EINVAL;
@@ -650,7 +658,10 @@ static int cv1800_pin_set_config(struct cv1800_pinctrl *pctrl,
 	addr = cv1800_pinctrl_get_component_addr(pctrl, &pin->conf);
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
-	writel(value, addr);
+	reg = readl(addr);
+	reg &= ~mask;
+	reg |= value;
+	writel(reg, addr);
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
 	return 0;
@@ -662,16 +673,17 @@ static int cv1800_pconf_set(struct pinctrl_dev *pctldev,
 {
 	struct cv1800_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	struct cv1800_pin *pin = cv1800_get_pin(pctrl, pin_id);
-	u32 value;
+	u32 value, mask;
 
 	if (!pin)
 		return -ENODEV;
 
 	if (cv1800_pinconf_compute_config(pctrl, pin,
-					  configs, num_configs, &value))
+					  configs, num_configs,
+					  &value, &mask))
 		return -ENOTSUPP;
 
-	return cv1800_pin_set_config(pctrl, pin_id, value);
+	return cv1800_pin_set_config(pctrl, pin_id, value, mask);
 }
 
 static int cv1800_pconf_group_set(struct pinctrl_dev *pctldev,
@@ -682,7 +694,7 @@ static int cv1800_pconf_group_set(struct pinctrl_dev *pctldev,
 	struct cv1800_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	const struct group_desc *group;
 	const struct cv1800_pin_mux_config *pinmuxs;
-	u32 value;
+	u32 value, mask;
 	int i;
 
 	group = pinctrl_generic_get_group(pctldev, gsel);
@@ -692,11 +704,12 @@ static int cv1800_pconf_group_set(struct pinctrl_dev *pctldev,
 	pinmuxs = group->data;
 
 	if (cv1800_pinconf_compute_config(pctrl, pinmuxs[0].pin,
-					  configs, num_configs, &value))
+					  configs, num_configs,
+					  &value, &mask))
 		return -ENOTSUPP;
 
 	for (i = 0; i < group->grp.npins; i++)
-		cv1800_pin_set_config(pctrl, group->grp.pins[i], value);
+		cv1800_pin_set_config(pctrl, group->grp.pins[i], value, mask);
 
 	return 0;
 }
-- 
2.39.5


