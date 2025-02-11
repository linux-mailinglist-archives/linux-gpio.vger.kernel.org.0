Return-Path: <linux-gpio+bounces-15688-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 401B0A302C2
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 06:18:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E3AF3A4A14
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 05:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BF9E1D6DC8;
	Tue, 11 Feb 2025 05:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RNtqFo6y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E22A26BDA7;
	Tue, 11 Feb 2025 05:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739251101; cv=none; b=ajBL/6/4n2CX3Ax+UdVQ/L0q0uYIxrzCF6m1qsKNbYe6l6d38VFrg6frcMJf1C8gRO6RbRGnRS6v3NSbhY+x1+f/OZ/QmHirOoHR8ar5MRmYOTLqpfDeTbzVxFrm4nN8TVqq+MNUtdIBd3yGYdjgs2IO9fES5evvPm2stft+b9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739251101; c=relaxed/simple;
	bh=7WC6FLDVf4Hf8vZUlwGGraHwk6TSgM5hySg9xYGyWzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SGlrDL3WinzFlHapWnfsEQD2mQ/tw9vmROVk1pXRi2sL8R8QPpZqYAvowzmd9CEG7ihvn+0qhILMnf4dCUwwfV22nGaXh6KU5aEX/akNbPwdJEXW6e5m86pMHI6L0IGSzhbW/hdsaBnj723Pebfsn15HRpSo+LxUza5VPGnH1rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RNtqFo6y; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-46fcbb96ba9so61676101cf.0;
        Mon, 10 Feb 2025 21:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739251098; x=1739855898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0s2V4LLRLenQ9wtaSUQMyh5fbdoyu5F7c1yyUPQHBKU=;
        b=RNtqFo6y6nW5GO81XK8dVkzk4tYHU6m9a4Z4fay4gB5G/ABj6hTrMPz9y30dyB+ftR
         djL272lCCRraD4eqLW+LobHOaSKoxWiOyiqB8OJh9lfs6FXRE7iFzJdLfcguvc2FRYo1
         UMPiVcTN4ZzBK60WdUUqHpQ/zUgfkeOHRYym8y6iogGiAM1yLaXL8N2k4mk2IaYnN6q0
         wVq1BXgXKQPqIXfLoF6taDe+yV+NLF6qRySQt5oBhpZA9NWF2Fl26B6TC6VXUgkSA4yO
         eCkwTgsmLAYpXpo7OQUgoYaNDCUxDciSyjgV0sjxs1Y511ARGZLoYjj2+xAVCz+fCn0d
         +5WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739251098; x=1739855898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0s2V4LLRLenQ9wtaSUQMyh5fbdoyu5F7c1yyUPQHBKU=;
        b=OV7/DD0SfSQ6yTOQ340BhA5milO9+4UrVkvOSEsvBpC5r31BH5JJwJTDi36D8KrApR
         ybB1VMflmVICVdvhwGWMq5I4fxomOpFGhq3VBRW8a4PrfX67menX9IWINUrdndYv0ovH
         PaahGXQKXT+7CCZkSSjNCCLn5sgFvvwwJodSzz5cnZo+lQZtyvt2HwPdNFMowQGbMeE9
         Jy/Vc59iVwEV5gcNdew10spDQS4tuMQQ4pNYQ73ECAgCJyvuGLUvLupKDVN5acAWzpkq
         dFP23MgWhfKlp5eEYroUUNjDNKDmyrL7ElLXAF17GbH0qqYo3kYgPxtnqbMHefsHRfvP
         XYpA==
X-Forwarded-Encrypted: i=1; AJvYcCVTKf4OUBB53vbF3MVrt9rDm9UGJX4e4QE9vnxv+0w2mTzgM6hW+QVRh8NBKUaG8cXLmAFAa3qzBwYK+hSx@vger.kernel.org, AJvYcCWFKFyaM42C8IWsj5Oi0G0cdQgwt0sW0yzk22FsTqMgjswezoBlyA60B6Ujn1lEYww3anVKuuycuEOLYg==@vger.kernel.org, AJvYcCWurL60nsMpCRrC/nqMYPs/xEYGQA/Kh83QjfcYP6c7I4QsvKDVzBp41xONj4vVjRrF2AwmhYWRbcRJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwnoSPUA1XuxnE3RIDc1yuOfIrUM7EFDVjbxpq1vhVK9rMqKT2/
	jUcLJhwv1SuN1zW/sdtoQh3wvzf+DCHQq/t3AdqdlwefsP3cVddQ
X-Gm-Gg: ASbGncsXPMLcg5u5xHY0JB+3HMrpydtPxIrqPFmL/OtIKxxe/5sUw4DSy1JXUaQBQwr
	0k6etWqNejzcuinq5wllaIic08L4wec/fgOSiTIILlr41gL+AcoUuedEkpfZce6TTswlT48fmlk
	zWrq6n68kNzqIs3yPZBw/sXeStmUGzJyi/To17bDRaX2h5usBBxUanoLihVoRp7YrCr8/8etaQ3
	VGV6fEcxQletQYbIkloPZJFsv6fm7biJmUyNkDFjXFbA/FB+1aNfzjvly5MA/MUz0g=
X-Google-Smtp-Source: AGHT+IE0sgzXr7Llx/28PfETd7C4C8utcmdG2dOhv87WgE3+DjTtw8JROrCY0pmVhK/cU78FbEvf+g==
X-Received: by 2002:a05:622a:8f13:b0:471:843a:6727 with SMTP id d75a77b69052e-471843a9d9cmr110285951cf.32.1739251098177;
        Mon, 10 Feb 2025 21:18:18 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-471a72c7290sm1536191cf.58.2025.02.10.21.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 21:18:17 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 1/8] pinctrl: sophgo: avoid to modify untouched bit when setting cv1800 pinconf
Date: Tue, 11 Feb 2025 13:17:49 +0800
Message-ID: <20250211051801.470800-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211051801.470800-1-inochiama@gmail.com>
References: <20250211051801.470800-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When setting pinconf configuration for cv1800 SoC, the driver just writes
the value. It may zero some bits of the pinconf register and cause some
unexpected error. Add a mask to avoid this.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pinctrl/sophgo/pinctrl-cv18xx.c | 33 +++++++++++++++++--------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/sophgo/pinctrl-cv18xx.c b/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
index 57f2674e75d6..84b4850771ce 100644
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
2.48.1


