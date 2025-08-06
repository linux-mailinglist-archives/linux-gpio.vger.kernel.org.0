Return-Path: <linux-gpio+bounces-24054-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5061BB1CCC2
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 21:57:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77A73174ECA
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 19:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43B622BDC24;
	Wed,  6 Aug 2025 19:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OkkYbou1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E322BEC3F;
	Wed,  6 Aug 2025 19:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754510173; cv=none; b=am54M0zc6WLimqUejoWmCsqPa81poHX3LC5Av42VVH/YneMU305GkZnmaMhbPjUHQLCLflFViG6W0hy1+ui4chjEOr90whnWtpuEybs1WZRzszR9j2J7m+1bpYA/etTB7VcN/BYkgGFZrdGGXtsS5NH7faXOqg75+ujD17HcMjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754510173; c=relaxed/simple;
	bh=u+wgEpA11a0WizPMgrYnN2F8G9FZUmr59dDLFbxv79s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IA3W6fv6crD7YodpJPGK1Enug0Y5JBizijuHs2uGmJhKKL3rU3AlMumTdthF9ILIdk6LHTi7AkeDHTBLN+WujGq5FikwNMxckac38brxm+pEgsJCS7a5STEyhxdnI0XlKzMDMBSFmtNcvTLzH/ANG5/DK5opBwYJaS/cSjCh4io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OkkYbou1; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-451d3f72391so2571445e9.3;
        Wed, 06 Aug 2025 12:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754510169; x=1755114969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PbkN4BhrUNR9E4GJEQthARrz+nfO86VQLi/BD9FfAa0=;
        b=OkkYbou1jIRnlVNOIWIxsNgepGv3fg3Vbi6V6G7bTiB1JRqSwaPSYv3leiGK6i3hxG
         P+LmwBd4jFk3icrdE4u0YIsvhw0j3/B/pVTHqg/PrHP9lNvtolah+WA4fOiG8JhYAMzM
         Y8sK1cldv/Tk5ommGqDh5f5XlcItQ2+hqnMRidaJZIauL3kPfmLxMbqUUyl+OtfBl4E3
         TL9omX97LSGOz1O7GL+f+pwDg2aU9Wg1WdCxsf7xx1gGAz5vFpD0L6SWeFZRccPq8Li4
         t2y2ZXZdbVZYFto3IiEsZVVuWmZbYT8APnTvGLOz8vZ9C/ccaSCKuITuQ4c9oRYyeX87
         a6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510169; x=1755114969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PbkN4BhrUNR9E4GJEQthARrz+nfO86VQLi/BD9FfAa0=;
        b=Rk1cr+1GJCiGpnb2kxxNs1ptACmSQmJt2Ur/Wh3nVAHMwvq4XbzWooViVmhdFK6K94
         J/TGTjdPI/cfJgqEXBE27v9gnoCZOWDj2fpsrxqY1OMHfpqjzF/0khbhCKgLsRUBaD9v
         kqlHLVhhsI7wfrIOYpxCEwdA8MK3n4Li/dKtQtXLO7XfAVRkEPQXcvvUQ0WIXq/NCyoi
         tjcs9pVOOHrKjEckUKJLqpy9/0n2duh4IZGwArxO7BcIrlu81V/djDaunUKKsKZJuSXF
         LLSXYpP2hLk/mhO0bAbD+/tN3f9vs6JPUiNPxdEsWFxb6ODZZ7ti3zOlDQoS1ke1DzeQ
         zFCg==
X-Forwarded-Encrypted: i=1; AJvYcCWUyRTz1nG2+Aktth35OhZT67YBHId1Cd9bCt1N3yD8AXI4iV95eTuWJMKRxMI5za1M/P36FTVQ17+94WM7@vger.kernel.org, AJvYcCXtqqP/FjNKAKj0gHeUHbRyyOlZMmNTxyoJ9e3MlozxqlxVh5zA/FihjjfDZTKH7++VdXcpDr0aF7Q4@vger.kernel.org
X-Gm-Message-State: AOJu0YxMFx6e6pQO+Zgb2meS4L0LSBgrc4Z9O4kOweD066eaeo/eQiON
	Vv/vNnVQ+NHK3fH9PJekgwwCJ+TnrQoSHZf0opG2QUUDAFLcDRa84qtQ
X-Gm-Gg: ASbGncsPSdlMxHlPBiEHSQqWWnQiDraxW+DoB7TI3/JZRpOxnA7wgGkEV+iJ6ah1gyR
	JZ6rD0MKlZvuhg241HFUwsrSPOVr1KFtOjigl/odwZxg7GNP/ylS8Xb8Z7iT9wgBb1wOPlt+6Bx
	+WBv8BYhH/lmz3pUKm3S0RwTwHqQ7nVpYuWyqT0ULZ4hV1N0m6UnhvpPwOZN6GLSt06N2q47a8V
	b1z0GUQSiu5qEVqOcJQe9YCAIA0wwJsjTzEml7XSgvkbTp6lvU+OTMH7FCYP6rrSHhFFSYBE7Ns
	KfDCSt5btZgrVyOFvoJxWs6iH2v7pNRC2yLmGrAxHhBtPTTHz0yzdBtoRIxgbSZeUKIa4H/yBZA
	zBoQmpOcOsux4lTTiGE96SR6NvvpDYdRrCptWK6W6y2VyZIbaA3VCsCO1xv31/goxwL4BMEdcGQ
	==
X-Google-Smtp-Source: AGHT+IGay4WEXtWFUqoVl9hyQQCW+KtZRQ7roM1fcWrmvyC+gSHOQw7TeJKDk81uIMMDZvg0RF4ZTg==
X-Received: by 2002:a05:600c:524e:b0:458:bfe1:4a91 with SMTP id 5b1f17b1804b1-459e70d8261mr33201325e9.20.1754510169038;
        Wed, 06 Aug 2025 12:56:09 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3bf93dsm24137782f8f.27.2025.08.06.12.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 12:56:08 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 7/7] pinctrl: renesas: rzg2l: Drop oen_read and oen_write callbacks
Date: Wed,  6 Aug 2025 20:55:55 +0100
Message-ID: <20250806195555.1372317-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250806195555.1372317-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250806195555.1372317-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3:
- Added Reviewed-by tag from Geert.

v1->v2:
- New patch
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 35 +++++++------------------
 1 file changed, 9 insertions(+), 26 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 9fb9e6d2c6d5..5eebe12c4595 100644
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
@@ -1092,16 +1090,16 @@ static int rzg2l_pin_to_oen_bit(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
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
@@ -1115,7 +1113,7 @@ static int rzg2l_write_oen(struct rzg2l_pinctrl *pctrl, unsigned int _pin, u8 oe
 	int bit;
 
 	if (!pctrl->data->pin_to_oen_bit)
-		return -EINVAL;
+		return -EOPNOTSUPP;
 
 	bit = pctrl->data->pin_to_oen_bit(pctrl, _pin);
 	if (bit < 0)
@@ -1298,11 +1296,10 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
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
@@ -1461,9 +1458,7 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
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
@@ -3300,8 +3295,6 @@ static struct rzg2l_pinctrl_data r9a07g043_data = {
 	.pwpr_pfc_lock_unlock = &rzg2l_pwpr_pfc_lock_unlock,
 	.pmc_writeb = &rzg2l_pmc_writeb,
 	.pin_to_oen_bit = &rzg2l_pin_to_oen_bit,
-	.oen_read = &rzg2l_read_oen,
-	.oen_write = &rzg2l_write_oen,
 	.hw_to_bias_param = &rzg2l_hw_to_bias_param,
 	.bias_param_to_hw = &rzg2l_bias_param_to_hw,
 };
@@ -3318,8 +3311,6 @@ static struct rzg2l_pinctrl_data r9a07g044_data = {
 	.pwpr_pfc_lock_unlock = &rzg2l_pwpr_pfc_lock_unlock,
 	.pmc_writeb = &rzg2l_pmc_writeb,
 	.pin_to_oen_bit = &rzg2l_pin_to_oen_bit,
-	.oen_read = &rzg2l_read_oen,
-	.oen_write = &rzg2l_write_oen,
 	.hw_to_bias_param = &rzg2l_hw_to_bias_param,
 	.bias_param_to_hw = &rzg2l_bias_param_to_hw,
 };
@@ -3335,8 +3326,6 @@ static struct rzg2l_pinctrl_data r9a08g045_data = {
 	.pwpr_pfc_lock_unlock = &rzg2l_pwpr_pfc_lock_unlock,
 	.pmc_writeb = &rzg2l_pmc_writeb,
 	.pin_to_oen_bit = &rzg3s_pin_to_oen_bit,
-	.oen_read = &rzg2l_read_oen,
-	.oen_write = &rzg2l_write_oen,
 	.hw_to_bias_param = &rzg2l_hw_to_bias_param,
 	.bias_param_to_hw = &rzg2l_bias_param_to_hw,
 };
@@ -3359,8 +3348,6 @@ static struct rzg2l_pinctrl_data r9a09g047_data = {
 	.pwpr_pfc_lock_unlock = &rzv2h_pwpr_pfc_lock_unlock,
 	.pmc_writeb = &rzv2h_pmc_writeb,
 	.pin_to_oen_bit = &rzg3e_pin_to_oen_bit,
-	.oen_read = &rzg2l_read_oen,
-	.oen_write = &rzg2l_write_oen,
 	.hw_to_bias_param = &rzv2h_hw_to_bias_param,
 	.bias_param_to_hw = &rzv2h_bias_param_to_hw,
 };
@@ -3383,8 +3370,6 @@ static struct rzg2l_pinctrl_data r9a09g056_data = {
 	.pwpr_pfc_lock_unlock = &rzv2h_pwpr_pfc_lock_unlock,
 	.pmc_writeb = &rzv2h_pmc_writeb,
 	.pin_to_oen_bit = &rzv2h_pin_to_oen_bit,
-	.oen_read = &rzg2l_read_oen,
-	.oen_write = &rzg2l_write_oen,
 	.hw_to_bias_param = &rzv2h_hw_to_bias_param,
 	.bias_param_to_hw = &rzv2h_bias_param_to_hw,
 };
@@ -3408,8 +3393,6 @@ static struct rzg2l_pinctrl_data r9a09g057_data = {
 	.pwpr_pfc_lock_unlock = &rzv2h_pwpr_pfc_lock_unlock,
 	.pmc_writeb = &rzv2h_pmc_writeb,
 	.pin_to_oen_bit = &rzv2h_pin_to_oen_bit,
-	.oen_read = &rzg2l_read_oen,
-	.oen_write = &rzg2l_write_oen,
 	.hw_to_bias_param = &rzv2h_hw_to_bias_param,
 	.bias_param_to_hw = &rzv2h_bias_param_to_hw,
 };
-- 
2.50.1


