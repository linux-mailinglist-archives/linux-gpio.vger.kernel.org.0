Return-Path: <linux-gpio+bounces-19633-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F43AAB0B0
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 05:44:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 479AE188E871
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 03:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72533326BF1;
	Tue,  6 May 2025 00:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dMvr6oxX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B47375309;
	Mon,  5 May 2025 22:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746485261; cv=none; b=dBX0VwH2jZWEZZRfrHmvM+8VpIEnv4Qp5TMPP/SqY58EDjZYykqa6kIYL6yY+1eCj5zRuPMYvDicnYAfjZkaLkl1HTioDAJWd9S+sgFjBdbWPsBVHnyuKASWCmZ/7lLl44tmLh1sILAxfQa3PzFdp5sQ6eTOK9JwvqIIf5LBeEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746485261; c=relaxed/simple;
	bh=1j4dgteCUSZ7Abj/VzXKM8PzCdf0Yf0zwcztFml+q24=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n7l5yBeNfrp6DxCsd0JX7/EFGlOiFsA+mP7ohtenEbwkOGzMEgdftTgDnFUFSwX1ofCD9RfOfif5qsoM/pXtu2WVS7YsGTUzzze2ZkAtAbPx5edr/Lp6STXugHmgLAazSC+YzlAgV9ql/pbToEXxSRw5Yd88R/ITc9xu8EbFUDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dMvr6oxX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A955C4CEE4;
	Mon,  5 May 2025 22:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485261;
	bh=1j4dgteCUSZ7Abj/VzXKM8PzCdf0Yf0zwcztFml+q24=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dMvr6oxXpYDLuoyY9B9Jwx57JC1S8d/kZv8HixNa6Ull97iRhBl3C0XMYo8CjfTx7
	 op6OBVFdOCW6mupn+DDAIZjiuEP03wLxrADakKSl89eb3YZtI9LRoJJ3+uzYpHm6q3
	 nlF7Y88UejbzwNXn0t9+alc4/ICiozFVcBjQmJSNxQu20b7kwTfqASY1XhDInxYWU5
	 Xv2mJuVnHSG1MS/o0joVsT+dgOBz6jEnStAw5hNEpW5e2/g7a9j6m/il40dz/ei0ZG
	 F18wrUfEbN07szCrf2mxFu2TuwX1jPsh+mbkfH+J+RlBv+KosbTOYaQRuLtbEoSpIk
	 puKxO9NbFvIQA==
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
Subject: [PATCH AUTOSEL 6.12 240/486] pinctrl: sophgo: avoid to modify untouched bit when setting cv1800 pinconf
Date: Mon,  5 May 2025 18:35:16 -0400
Message-Id: <20250505223922.2682012-240-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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


