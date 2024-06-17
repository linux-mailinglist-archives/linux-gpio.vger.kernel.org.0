Return-Path: <linux-gpio+bounces-7504-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBA590AEDF
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 15:16:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 798F71C20442
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 13:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66EBE194C6B;
	Mon, 17 Jun 2024 13:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dc12OSKV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDAC17FAA2;
	Mon, 17 Jun 2024 13:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718630152; cv=none; b=AjNRjnOeMTMKzs26UAszQ6iyvp9ddiw8ugQkt0l2OZZWjiT2lqnI7NQSpiXsoaC23Y3MfhmO/pfxtfVZrRwXeO0yks2+InnYz52EUVquEuOLeCJ7t1GYNPTrBvo00GUlRcGUXhi8nIt3sRZf9f2HgGmZOL4m/p3qEj89JOCTVzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718630152; c=relaxed/simple;
	bh=jgVGBIyV8U78GjJm/qsVjrw68d4BbzUuCGW9a4ZyVEI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G3tcDKIb+P2eMQid11T8PLi2WEyrYjNsnvQQMOge4++EU0hKtpAMSANsAa/EZgxp+ftftKwAZVodLTRtxNOlUJptG3x2o0Z9Dl0mgBiMRnnbx87/CAMVyiDeOGz5Xfp26r61J6uY+rDFN7I5tv2Q5Kq8cNas6hpeatIcS0UtLe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dc12OSKV; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-421bb51d81aso33109205e9.3;
        Mon, 17 Jun 2024 06:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718630149; x=1719234949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mPMFdlSwh1iRDl9l7BoWP6h98w3/zXzLfYpprwi7Xb0=;
        b=Dc12OSKVUm01GRbfvHgcPS8yoZytv9hzZUegSDtunMjSO5cnSwLBoa9iF34vjGrwDR
         dAL2O+YJpfOWCqqZeVDxjiIbZC/0FqhVfJ6xljxAc5Z7kndV8LQ88kDigkbVZ4RLj2NZ
         PvU2gAA3/vUMn0i+RpynXQ/9sZ2g7O3Wglb+78kPjSf9jdrEGrJubBm7DjONj2zPMalL
         bL9ZV4W8zpi9tbbC9USk5sAwgWybPjX0+EAnmhaQ5V1S+EZoINKwh1gQtTO30jgXnDsN
         5CfuZNCxmgyOkqoVWW3Axk1JzRNOtRX6smLY49LHXjPc5n4hL1/gchYW6hJV1wGbT/PJ
         UgJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718630149; x=1719234949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mPMFdlSwh1iRDl9l7BoWP6h98w3/zXzLfYpprwi7Xb0=;
        b=iNDLdiRiYTCsSSW2mlrcmby3LibHKzd1gtbkxfTaQDzy2g8UBTvmQNy/Ph1K9q4IDC
         ph0vEkCEPXe3h44O3yCUEjgtJFv0wv9aUz1pIAY0S0fWg93Rz3R8t2vCGLPoDjMePsAw
         3T6sKHHOh8nlwDA3zB3Ybw5GTkdIXE7IhzgeHpb63ZqO69iJeKI/DEBBBVHk8nYCdOkD
         IW2tXCWhjACzCUjNrlbBaHGZVdd9r6JF5lgborNO2JWm49gdbVlCNF8g3bG0yGxXJwIW
         CVe3VCHM7W/wvo7Zd9+Tflcu8Xqzga+KWUvwn7huD4uAZj5pbsEJTBD7icIhN5+jxeUc
         oqtw==
X-Forwarded-Encrypted: i=1; AJvYcCWGBqxMmXD+pQLPUvYjAiSbBGTfi4bxIJRmck8YWNoOk3LWSAIhAiiCmjlare3GbOPM2CS2ccuY0XSdvelgnZqtBoup0aW85krewToYpBSKgFtM0qWxTAsudgRug7Sph9JZ2x54UidZbg==
X-Gm-Message-State: AOJu0Yz4JzRmLcI/h428q1D29tZJ8HQjeHbvuzr6uxTQHzAGiTV1/yru
	Gy/jlxORwqjOj7RCctikzHz16NxE7WehpACSiL6fx/VEiI6ddBBRTRg/kQ9qHgA=
X-Google-Smtp-Source: AGHT+IFGCFsrqw0+5k8TDt8YIEGW3eqMyCMz1G2qBXtk+mw7wxBBMHBBkPVv07qeULCqam6yIAgV0g==
X-Received: by 2002:a05:600c:1912:b0:421:fc5b:b8f4 with SMTP id 5b1f17b1804b1-423048229b5mr85432015e9.2.1718630148599;
        Mon, 17 Jun 2024 06:15:48 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:92ee:d46e:5619:8184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286fe92c6sm196452825e9.18.2024.06.17.06.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:15:47 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] pinctrl: renesas: rzg2l: Use BIT_ULL for PIN_CFG_* macros
Date: Mon, 17 Jun 2024 14:15:11 +0100
Message-Id: <20240617131511.160877-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Commit 13a8cae6e561 ("pinctrl: renesas: rzg2l: Drop struct
rzg2l_variable_pin_cfg") introduced a Smatch static checker warning:

    drivers/pinctrl/renesas/pinctrl-rzg2l.c:374 rzg2l_pinctrl_get_variable_pin_cfg()
    warn: was expecting a 64 bit value instead of '~((((1))) << (16))'

The function `rzg2l_pinctrl_get_variable_pin_cfg` attempts to mask out
`PIN_CFG_VARIABLE` using `BIT(16)`. However, since `pincfg` is a `u64`,
this inadvertently masks the high 32 bits as well, which is unintended
(on non 64-bit platforms). To correct this, `PIN_CFG_VARIABLE` should
be defined using `BIT_ULL(16)`, ensuring proper 64-bit masking.

To avoid such issues, update `PIN_CFG_*` macros to use `BIT_ULL()`.

Fixes: 13a8cae6e561 ("pinctrl: renesas: rzg2l: Drop struct rzg2l_variable_pin_cfg")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/5c1bf20b-7e94-4b06-95e5-da9f99750203@moroto.mountain/
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 44 ++++++++++++-------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 32945d4c8dc0..d5eee98f6085 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -41,28 +41,28 @@
 #define MUX_FUNC_MASK		GENMASK(31, 16)
 
 /* PIN capabilities */
-#define PIN_CFG_IOLH_A			BIT(0)
-#define PIN_CFG_IOLH_B			BIT(1)
-#define PIN_CFG_SR			BIT(2)
-#define PIN_CFG_IEN			BIT(3)
-#define PIN_CFG_PUPD			BIT(4)
-#define PIN_CFG_IO_VMC_SD0		BIT(5)
-#define PIN_CFG_IO_VMC_SD1		BIT(6)
-#define PIN_CFG_IO_VMC_QSPI		BIT(7)
-#define PIN_CFG_IO_VMC_ETH0		BIT(8)
-#define PIN_CFG_IO_VMC_ETH1		BIT(9)
-#define PIN_CFG_FILONOFF		BIT(10)
-#define PIN_CFG_FILNUM			BIT(11)
-#define PIN_CFG_FILCLKSEL		BIT(12)
-#define PIN_CFG_IOLH_C			BIT(13)
-#define PIN_CFG_SOFT_PS			BIT(14)
-#define PIN_CFG_OEN			BIT(15)
-#define PIN_CFG_VARIABLE		BIT(16)
-#define PIN_CFG_NOGPIO_INT		BIT(17)
-#define PIN_CFG_NOD			BIT(18)	/* N-ch Open Drain */
-#define PIN_CFG_SMT			BIT(19)	/* Schmitt-trigger input control */
-#define PIN_CFG_ELC			BIT(20)
-#define PIN_CFG_IOLH_RZV2H		BIT(21)
+#define PIN_CFG_IOLH_A			BIT_ULL(0)
+#define PIN_CFG_IOLH_B			BIT_ULL(1)
+#define PIN_CFG_SR			BIT_ULL(2)
+#define PIN_CFG_IEN			BIT_ULL(3)
+#define PIN_CFG_PUPD			BIT_ULL(4)
+#define PIN_CFG_IO_VMC_SD0		BIT_ULL(5)
+#define PIN_CFG_IO_VMC_SD1		BIT_ULL(6)
+#define PIN_CFG_IO_VMC_QSPI		BIT_ULL(7)
+#define PIN_CFG_IO_VMC_ETH0		BIT_ULL(8)
+#define PIN_CFG_IO_VMC_ETH1		BIT_ULL(9)
+#define PIN_CFG_FILONOFF		BIT_ULL(10)
+#define PIN_CFG_FILNUM			BIT_ULL(11)
+#define PIN_CFG_FILCLKSEL		BIT_ULL(12)
+#define PIN_CFG_IOLH_C			BIT_ULL(13)
+#define PIN_CFG_SOFT_PS			BIT_ULL(14)
+#define PIN_CFG_OEN			BIT_ULL(15)
+#define PIN_CFG_VARIABLE		BIT_ULL(16)
+#define PIN_CFG_NOGPIO_INT		BIT_ULL(17)
+#define PIN_CFG_NOD			BIT_ULL(18)	/* N-ch Open Drain */
+#define PIN_CFG_SMT			BIT_ULL(19)	/* Schmitt-trigger input control */
+#define PIN_CFG_ELC			BIT_ULL(20)
+#define PIN_CFG_IOLH_RZV2H		BIT_ULL(21)
 
 #define RZG2L_MPXED_COMMON_PIN_FUNCS(group) \
 					(PIN_CFG_IOLH_##group | \
-- 
2.34.1


