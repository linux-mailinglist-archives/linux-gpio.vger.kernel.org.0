Return-Path: <linux-gpio+bounces-24527-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FFDB2BC08
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 10:40:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C57CF5E46A9
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 08:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 443B43115A9;
	Tue, 19 Aug 2025 08:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OjVwMI/M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68286221FD4;
	Tue, 19 Aug 2025 08:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755592828; cv=none; b=ifQlEa6kixvY5k6EBq5pDQmN58zziteqHnQqj3eyIEuvj0RyixUwEgtdgBgbxvKCtE1bo/4V0WULl/ifDmwWCLeBIk1i0fMfI8hLKVp9u/Hbo11Zb6iF73asIup2V3Dk9UwY3SyD7iIFfLwddjBKfL9SGct4RgPOhBpa8OqD7AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755592828; c=relaxed/simple;
	bh=empdr60v+2Uql+3EL8V6FDzYMeaEXq4MpvGqceYYH84=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lpHU/7jXzkuw/lhg6SD4yrGFf9u7wZO2oSvEfAXuVIHXryLkwAQuvkiJfqlNPeXZeqcssWL1Wo41fu+X8iF7oaSd3JfxkTaF2dqp4oa4e3PLTN55NDWy9Eye2iLPeQILshU53CDFr4syk0Q8yqYwJNgUws/dS7ynn1idYKt/OL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OjVwMI/M; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45a286135c8so12141105e9.0;
        Tue, 19 Aug 2025 01:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755592825; x=1756197625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pJpA359eG0b9Ks8j3opG1XWCGaxB+D6I1gp5oSK+e6E=;
        b=OjVwMI/MTbfkRdnHektMm8hTyJ+cbTMZ/sZ74XXAU6QY1kE4ebCAnI7JOKyBtF+nS7
         JHSQzi3edEaav0qC1iTbb+GKTxsIjMAT1ThUaoQPG+qb+Ct3tT62QHglCnh2yVr3yJFC
         3I7F2xFRzbeMny2+CRy/7NHWYvhnVvbuH7GDfN97SlAn5loIwvgxFKjI/civX1JtBqHz
         0BpzlJeGLKA/lLI0zSO6lhgbHr/uBHALkrH7xOTDXnBNnG+jJHiKkvKWzZaf36oXSEwG
         TW7wSdOVUkTj2D3zN+PONCfgEWCVFzc+hJC/JMvzs6uG5yztuLeC/tJ0bUt/ekkOXkqC
         lYxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755592825; x=1756197625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pJpA359eG0b9Ks8j3opG1XWCGaxB+D6I1gp5oSK+e6E=;
        b=NdwE3Q1J8s8AaIzxFZKhL4M9eEMermg3Ctb7+l+ru2C2TdIgQtNUenrUK+yVPmfH6X
         nuDP3prQWi1jZ3MSD0s7GJ8NVuBzGVU/epmJjFr8yewjua7XX4dc33z7KdkPZa2Z0o1B
         vV2dKfwx4kZs0NtybM9X3gX41hcZzpUXBEkk/R/nAbbYlCkxZ/7dJcLw6zNmAOsal1Mk
         e4cw4V7/CM1SOGsmd6AMPRgJDPDmAVCnAqloJyLN71BJGg8+THqxKogadzrdyV4OwySy
         +bLveMX3PldID0/taMteQhPDJ92e6nB7PEUE1sh7K+alnRuqV/8SYbo70iBjC/OiClSb
         4HWA==
X-Forwarded-Encrypted: i=1; AJvYcCUgZXXuVSvGz3p/6rtiKc7zIAcvHAie+J7vzez/osg7rGnjGo9oxnikzSuzW6OSKXzzCHYU5G1SAUWFkfuK@vger.kernel.org, AJvYcCWiNhOa0vZiuYSoNTnE/EAF0sjPhiaLzvbpXad4Xz1q7nZ97ugAKVIP3Vxz/7T3dSrF8ZJiBs2U0e/c@vger.kernel.org, AJvYcCXpmYxBnQldAaSeDBxPMNEo6q3/0atzhA51dY3x24AUpL5IPVBf7qtN/+5nR0YCEO5AYbcFRR7irlYXO2ihxtdZEYI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk0NmZ06GxcOSInAuAO7zhszzQ6VwFSdXe48gDynR5z7IvoZio
	dW2dTS//OvLhmAAr3gA5oWpzULvbbc5sAKn/cKWOJCTAABNqBgxyWvZ8
X-Gm-Gg: ASbGnctgQRIugZ4560Z+o1wiperrS2rrT2bZiBcN5aJA+tLGS8RVn68tEKc51k1IL92
	PVv7Cs/z/50PeNVUpEqcWHd3vrqmr5TeKG5LGE8U2nJwW5/Ko6jwyIM01IRZBJS9Zxs5iV5WHs5
	bGY7mWC+66bvXBSvFtQCf75xke+DQXfWwk/EYZkSDUDq1gg+AZCKADWw+96IlL0v+dcFoGf3Mmn
	870/f+ut/AP8mh0B/HmbNElvUiPoil9wEzWd9TkcEFRD1zjiJP1urNCuWjXF6mWXWPzAGBICL2h
	m0xgvKqJ8C5uvcOWC/UtlP23482ScKryolPWNs4/Lq0nwTddbhlldg/4zGPy8uLzFAtwM34/aRt
	yNLKj75fGgrj7bWLkT8fFeCkXQzPessSVP7LJLv43V33PdogkwndZ/WM3xBM42Sqeqe27Y2xK9u
	L89eDuFVZF
X-Google-Smtp-Source: AGHT+IEGy3sdqE03Pv2GZCwYc38JDfpKrn5DxztIAZ2aHStWAim31GPjOqX/WqFWMKVlJUhBglzggg==
X-Received: by 2002:a05:600c:1ca2:b0:456:ed3:a488 with SMTP id 5b1f17b1804b1-45b43f61f49mr11950505e9.1.1755592824682;
        Tue, 19 Aug 2025 01:40:24 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c61a66esm203895015e9.0.2025.08.19.01.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 01:40:24 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] pinctrl: renesas: rzg2l: Add suspend/resume support for Schmitt control registers
Date: Tue, 19 Aug 2025 09:40:20 +0100
Message-ID: <20250819084022.20512-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The Renesas RZ/G3E supports a power-saving mode where power to most of
the SoC components is lost, including the PIN controller.  Save and
restore the Schmitt control register contents to ensure the
functionality is preserved after a suspend/resume cycle.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
This patch is on top of [1]
[1] https://lore.kernel.org/all/20250817143024.165471-1-biju.das.jz@bp.renesas.com/
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 8422a5429ca3..8ba6d82f335f 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -321,6 +321,7 @@ struct rzg2l_pinctrl_pin_settings {
  * @iolh: IOLH registers cache
  * @pupd: PUPD registers cache
  * @ien: IEN registers cache
+ * @smt: SMT registers cache
  * @sd_ch: SD_CH registers cache
  * @eth_poc: ET_POC registers cache
  * @oen: Output Enable register cache
@@ -334,6 +335,7 @@ struct rzg2l_pinctrl_reg_cache {
 	u32	*iolh[2];
 	u32	*ien[2];
 	u32	*pupd[2];
+	u32	*smt;
 	u8	sd_ch[2];
 	u8	eth_poc[2];
 	u8	oen;
@@ -2707,6 +2709,10 @@ static int rzg2l_pinctrl_reg_cache_alloc(struct rzg2l_pinctrl *pctrl)
 	if (!cache->pfc)
 		return -ENOMEM;
 
+	cache->smt = devm_kcalloc(pctrl->dev, nports, sizeof(*cache->smt), GFP_KERNEL);
+	if (!cache->smt)
+		return -ENOMEM;
+
 	for (u8 i = 0; i < 2; i++) {
 		u32 n_dedicated_pins = pctrl->data->n_dedicated_pins;
 
@@ -2968,7 +2974,7 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
 	struct rzg2l_pinctrl_reg_cache *cache = pctrl->cache;
 
 	for (u32 port = 0; port < nports; port++) {
-		bool has_iolh, has_ien, has_pupd;
+		bool has_iolh, has_ien, has_pupd, has_smt;
 		u32 off, caps;
 		u8 pincnt;
 		u64 cfg;
@@ -2981,6 +2987,7 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
 		has_iolh = !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IOLH_B | PIN_CFG_IOLH_C));
 		has_ien = !!(caps & PIN_CFG_IEN);
 		has_pupd = !!(caps & PIN_CFG_PUPD);
+		has_smt = !!(caps & PIN_CFG_SMT);
 
 		if (suspend)
 			RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->base + PFC(off), cache->pfc[port]);
@@ -3019,6 +3026,9 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
 							 cache->ien[1][port]);
 			}
 		}
+
+		if (has_smt)
+			RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->base + SMT(off), cache->smt[port]);
 	}
 }
 
-- 
2.43.0


