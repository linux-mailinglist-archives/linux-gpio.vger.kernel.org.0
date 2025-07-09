Return-Path: <linux-gpio+bounces-23030-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D44AFEEB9
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 18:12:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B67DB7B8DB0
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 16:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C403F2EA741;
	Wed,  9 Jul 2025 16:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EI/epiSF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8625D2EA469;
	Wed,  9 Jul 2025 16:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752077322; cv=none; b=dVOliYOy6HfjgvOYgI0H0tmtsYMLK2lHm+tl8j5BLWLA1Do8KxoreevvdIdQuqmRMJPTsTXErrt4WqHNl3HuWFdeZnDScIf6OOSPTEL1FdLjmDJ3mNp01L+Ha/I3WpGLWOWIYyQpQZ7qQCyMagxInVN5WKhYohPhxdcNWI2Ft7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752077322; c=relaxed/simple;
	bh=3KtpilEy3/o3/1qg2G5TextcJcows1HYN0ngbhiNMHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P+Gum9ecHhM+N3evjHsLFPpCtTR4C6e+md1pdzsuvdMVdu4BWzkhzm8gmF0yZfBy6zUS7wDTd3tF/eUfKh0x0CkILpadRRXrT6WT5xUo/ZtDdb3i6Bui0qXPsUk/j09QffFMG/uddW7XgOiLFB2gaFvHzqtZsunJbLGW7zGmo6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EI/epiSF; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so121015e9.2;
        Wed, 09 Jul 2025 09:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752077319; x=1752682119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JyfdpRD0W+iXSmWBFAIa4vA9j53BOrWnzXp955ltOb0=;
        b=EI/epiSFtcAS2inH3pSyyyZN7u4oJ0WxUs7cY5O/v38BuC43qZhTwanOFCS/7yh5vZ
         zBSA5bT2GnfQ/BP6q34f0zwgOaPjBsJMVknD486rnu7pi3V2a1lllcmEIgc8ID05i5jn
         xirH/tFOxxCyv+QEiqpNnH5WIk5RA2SM2Vmxad/ZVvj/drUdiIAt2B3S9Kdt4VDVxndC
         5d+ThXGPNBQTHMUBY5C/EVNOTjgx6a7i2JOFT71VtC/KVY9AR5sm4YQNbhq4MW9TYRnj
         3OiQ6nqUUlEKuxbUN0tzmqtdqdJPp8xm9yGd9Jzq2LV0rHnYubguIk864iYDkyJNqEPK
         ubyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752077319; x=1752682119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JyfdpRD0W+iXSmWBFAIa4vA9j53BOrWnzXp955ltOb0=;
        b=UuD/oYh0aQgEvfBO9kj0M8wDTotmP4UD9P3EiOodzIetmWhCwdaGKnoKonYPcDRHKn
         UnZ8veFVXbf+IIlzjuYbo295O89wMx/hVvn9/TQ2KX8rMzlRXHx4qrs4FhrFBwE1EXe1
         qvYAAIKtQjOfCmgNDf6GyU6bMxhpKbLuq+lWIh41+ccThrfd6tXj6DUAN4ohuBzAC6HA
         zzwlc2rHlVecAIVci2usOF8dI4Qsp6ya3AnghZaobsyu4PvogkKGbOCBgbEzL61ELl2u
         SzzpgTUnv9HvIwhKEjeTBabZ58prx7CE0ZTwSUdzmCrFGLTJinTBK+VAzWRHs6ZETV8S
         yn0Q==
X-Forwarded-Encrypted: i=1; AJvYcCV2Z4CuBzMAbP2oxoXCVHfJRf8DX+xwsOqB2gXmHgJ1rqe6OGOxWwaYb4SPE+NnJNv/2e+xpixjEi90@vger.kernel.org, AJvYcCV5R9ivjJkXYLTkcu2ZYWZvc5fD+vDY3GTSOB72pAMgzICmtBQd1MnGoSYYehUzuhdLjLwZ4wRyd9ejyLdn@vger.kernel.org
X-Gm-Message-State: AOJu0YwUQyh9IeyAEnEa41BxKTI7/A4BLdC8R0yx9LCECm9dq7UOEuo0
	uco0V51s7A/o8mgIlNH7Nr/n7DnmZXf9W8ZndEvUy8ba1Hw87g34aLjQ
X-Gm-Gg: ASbGncs4AQHel8QlggfET5utaS3CskpBvLZO9YlbAjc3HQvnoLm6eDY1k1g0PgeWb9J
	krJFnRO0IPZTAcLUGm9fEC9n/NXTgEGOoRR5id8Xqj8TPoSCA+FFRpWBqsiYTeb6fbwEXjtgNuO
	adOgBEFgGvEb2DQj45qeSwjtL/DE/xpjRwxBCyp7mTMmps92z6gc2POuZ+iMSjRA5JNIf5mQxyv
	z/zEsa3EU20WfAoumM9kObj1DdAOkYICtDdOdovEB3PO6Fb1SkIieyiV6Med3uznyzf9ZDYx2oV
	jym3DnUitqhnJZamt7YgvJvS8AK9iCJHQVefFothjWD5Q+12dyvRhj/1lLg3gEQkK4Gj+aDBCgK
	eMFsZfcXlOBY=
X-Google-Smtp-Source: AGHT+IGEjHlJDStNIwkP8Oi9/D+SsbtVZvx4kJ2veVBMXoB0Q5ZWeA/es6NJMmXbS3ixTLrrN6MvNQ==
X-Received: by 2002:a05:6000:2891:b0:3a3:6e62:d8e8 with SMTP id ffacd0b85a97d-3b5e454564emr3083059f8f.55.1752077318496;
        Wed, 09 Jul 2025 09:08:38 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:c930:b02d:bf60:750b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b471b9671asm16639686f8f.53.2025.07.09.09.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 09:08:37 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	John Madieu <john.madieu.xa@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 7/7] pinctrl: renesas: rzg2l: Drop oen_read and oen_write callbacks
Date: Wed,  9 Jul 2025 17:08:19 +0100
Message-ID: <20250709160819.306875-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250709160819.306875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250709160819.306875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Remove oen_read and oen_write callbacks from rzg2l_pinctrl_data as
all SoCs now use the same rzg2l_read_oen() and rzg2l_write_oen()
functions directly.

Change rzg2l_read_oen() return type to int for proper error reporting
and update callers to handle errors consistently.

This simplifies the code by removing redundant callbacks and ensures
uniform OEN handling across all supported SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 35 +++++++------------------
 1 file changed, 9 insertions(+), 26 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index a6580d06db13..1e4fc4be6713 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -298,8 +298,6 @@ struct rzg2l_pinctrl_data {
 	void (*pwpr_pfc_lock_unlock)(struct rzg2l_pinctrl *pctrl, bool lock);
 	void (*pmc_writeb)(struct rzg2l_pinctrl *pctrl, u8 val, u16 offset);
 	int (*pin_to_oen_bit)(struct rzg2l_pinctrl *pctrl, unsigned int _pin);
-	u32 (*oen_read)(struct rzg2l_pinctrl *pctrl, unsigned int _pin);
-	int (*oen_write)(struct rzg2l_pinctrl *pctrl, unsigned int _pin, u8 oen);
 	int (*hw_to_bias_param)(unsigned int val);
 	int (*bias_param_to_hw)(enum pin_config_param param);
 };
@@ -1092,15 +1090,15 @@ static int rzg2l_pin_to_oen_bit(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
 	return -EINVAL;
 }
 
-static u32 rzg2l_read_oen(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
+static int rzg2l_read_oen(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
 {
 	int bit;
 
 	if (!pctrl->data->pin_to_oen_bit)
-		return 0;
+		return -EOPNOTSUPP;
 	bit = pctrl->data->pin_to_oen_bit(pctrl, _pin);
 	if (bit < 0)
-		return 0;
+		return -EINVAL;
 
 	return !(readb(pctrl->base + pctrl->data->hwcfg->regs.oen) & BIT(bit));
 }
@@ -1114,7 +1112,7 @@ static int rzg2l_write_oen(struct rzg2l_pinctrl *pctrl, unsigned int _pin, u8 oe
 	int bit;
 
 	if (!pctrl->data->pin_to_oen_bit)
-		return -EINVAL;
+		return -EOPNOTSUPP;
 	bit = pctrl->data->pin_to_oen_bit(pctrl, _pin);
 	if (bit < 0)
 		return -EINVAL;
@@ -1296,11 +1294,10 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 	case PIN_CONFIG_OUTPUT_ENABLE:
 		if (!(cfg & PIN_CFG_OEN))
 			return -EINVAL;
-		if (!pctrl->data->oen_read)
-			return -EOPNOTSUPP;
-		arg = pctrl->data->oen_read(pctrl, _pin);
-		if (!arg)
-			return -EINVAL;
+		ret = rzg2l_read_oen(pctrl, _pin);
+		if (ret < 0)
+			return ret;
+		arg = ret;
 		break;
 
 	case PIN_CONFIG_POWER_SOURCE:
@@ -1459,9 +1456,7 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 		case PIN_CONFIG_OUTPUT_ENABLE:
 			if (!(cfg & PIN_CFG_OEN))
 				return -EINVAL;
-			if (!pctrl->data->oen_write)
-				return -EOPNOTSUPP;
-			ret = pctrl->data->oen_write(pctrl, _pin, !!arg);
+			ret = rzg2l_write_oen(pctrl, _pin, !!arg);
 			if (ret)
 				return ret;
 			break;
@@ -3298,8 +3293,6 @@ static struct rzg2l_pinctrl_data r9a07g043_data = {
 	.pwpr_pfc_lock_unlock = &rzg2l_pwpr_pfc_lock_unlock,
 	.pmc_writeb = &rzg2l_pmc_writeb,
 	.pin_to_oen_bit = &rzg2l_pin_to_oen_bit,
-	.oen_read = &rzg2l_read_oen,
-	.oen_write = &rzg2l_write_oen,
 	.hw_to_bias_param = &rzg2l_hw_to_bias_param,
 	.bias_param_to_hw = &rzg2l_bias_param_to_hw,
 };
@@ -3316,8 +3309,6 @@ static struct rzg2l_pinctrl_data r9a07g044_data = {
 	.pwpr_pfc_lock_unlock = &rzg2l_pwpr_pfc_lock_unlock,
 	.pmc_writeb = &rzg2l_pmc_writeb,
 	.pin_to_oen_bit = &rzg2l_pin_to_oen_bit,
-	.oen_read = &rzg2l_read_oen,
-	.oen_write = &rzg2l_write_oen,
 	.hw_to_bias_param = &rzg2l_hw_to_bias_param,
 	.bias_param_to_hw = &rzg2l_bias_param_to_hw,
 };
@@ -3333,8 +3324,6 @@ static struct rzg2l_pinctrl_data r9a08g045_data = {
 	.pwpr_pfc_lock_unlock = &rzg2l_pwpr_pfc_lock_unlock,
 	.pmc_writeb = &rzg2l_pmc_writeb,
 	.pin_to_oen_bit = &rzg3s_pin_to_oen_bit,
-	.oen_read = &rzg2l_read_oen,
-	.oen_write = &rzg2l_write_oen,
 	.hw_to_bias_param = &rzg2l_hw_to_bias_param,
 	.bias_param_to_hw = &rzg2l_bias_param_to_hw,
 };
@@ -3357,8 +3346,6 @@ static struct rzg2l_pinctrl_data r9a09g047_data = {
 	.pwpr_pfc_lock_unlock = &rzv2h_pwpr_pfc_lock_unlock,
 	.pmc_writeb = &rzv2h_pmc_writeb,
 	.pin_to_oen_bit = &rzg3e_pin_to_oen_bit,
-	.oen_read = &rzg2l_read_oen,
-	.oen_write = &rzg2l_write_oen,
 	.hw_to_bias_param = &rzv2h_hw_to_bias_param,
 	.bias_param_to_hw = &rzv2h_bias_param_to_hw,
 };
@@ -3381,8 +3368,6 @@ static struct rzg2l_pinctrl_data r9a09g056_data = {
 	.pwpr_pfc_lock_unlock = &rzv2h_pwpr_pfc_lock_unlock,
 	.pmc_writeb = &rzv2h_pmc_writeb,
 	.pin_to_oen_bit = &rzv2h_pin_to_oen_bit,
-	.oen_read = &rzg2l_read_oen,
-	.oen_write = &rzg2l_write_oen,
 	.hw_to_bias_param = &rzv2h_hw_to_bias_param,
 	.bias_param_to_hw = &rzv2h_bias_param_to_hw,
 };
@@ -3406,8 +3391,6 @@ static struct rzg2l_pinctrl_data r9a09g057_data = {
 	.pwpr_pfc_lock_unlock = &rzv2h_pwpr_pfc_lock_unlock,
 	.pmc_writeb = &rzv2h_pmc_writeb,
 	.pin_to_oen_bit = &rzv2h_pin_to_oen_bit,
-	.oen_read = &rzg2l_read_oen,
-	.oen_write = &rzg2l_write_oen,
 	.hw_to_bias_param = &rzv2h_hw_to_bias_param,
 	.bias_param_to_hw = &rzv2h_bias_param_to_hw,
 };
-- 
2.49.0


