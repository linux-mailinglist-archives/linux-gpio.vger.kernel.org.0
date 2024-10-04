Return-Path: <linux-gpio+bounces-10841-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9666299031C
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 14:38:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48DE42832E3
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 12:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 256621D2F47;
	Fri,  4 Oct 2024 12:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iiWD+TyG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395A31D45E2;
	Fri,  4 Oct 2024 12:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728045441; cv=none; b=l+Wb2M9hmlozxswODoIEd7ZcRtl5w4yZ+M4imZtjTLQwy0gO7svTSBCaM5+skJDUIw+FMCLN+uo7SHOT5KMEA0eYQmTuj81meUwT8qJi8HCGVLsrm0dcQ/MCgUT8mZTT+jESv4I13DQpHJnj1lpK1vTUs7F1IFa6MwRGY4ELskc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728045441; c=relaxed/simple;
	bh=5QsFlrsVLsZwdtZp6mO6Us/52BhYyLYRdllWADfop4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uj/QQXr0uimt2DWXTMRkiHThgL0RtiDgRS9cUwU2D4Z5OyJvudbVKVjFJJ6FGOZQsIo8QwJpKUXy2BDgXHjTSLzb6skltyPOIezbZX5jYkUbfjUGBFHgGlMJHVU/yilvvgTMwfKHRXocQ/gQjeCKfxKADFbnuXNQ+crOUsJdaIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iiWD+TyG; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a8d4093722bso295686266b.0;
        Fri, 04 Oct 2024 05:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728045435; x=1728650235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9LcPLLxPDaleyrFMUiTMF5QBxTx4spV5s9XLwwB+E0=;
        b=iiWD+TyGUqMCdR8Mf5U8JDaNZ98Eeiz+4PmWwg1wF3zXAax8jyxIbhHEGnMcuTlavi
         py847D+gHpoBRLaIYlfH0EV1JTl8JuIOSG7NxTS/JcGMhNGjSPSxevH2HKt1k0Qai1Il
         wUBRK9VydnWzdSumRT+DVUA+Wr+O6hWbK+XHc0tzmgCdw4xeCNQ+ZGEy2vQZ9ff8W8zE
         JHibGn7z3llEqh+q0UR7+AmD4jnEzi/io8aAruD2n5AokO613dVzOPbzp5ojdYuOn4lX
         12nK6gYFzJqVO9BCxVtNdyThUV/nnaEiiOY4QDKr0rzyFWGqy0ysf6AnhW4IPc9uaPl2
         knMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728045435; x=1728650235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I9LcPLLxPDaleyrFMUiTMF5QBxTx4spV5s9XLwwB+E0=;
        b=kyCEr+HHFx6a2AxUZtp0Hgvj9SUa3Apzaj4VcYsvEU3iN0K9EwbdAm9LtbES57kjp5
         ZrHVuk6wyGHOs4LT9J0ADzfZGfAyELHIWcOl/tmwBZ5P7ivlaHvRghJxdrOWgchPD6MO
         wpdzjD/0wXdjXMRvTR8m16KkxE416q9EbvBr5+9WK7S6i3HjugTguLaBfhfApWNG1Crv
         10yFs6axVa02IeD0z7M+afqhLW/GkyHyNFJ2+VFtGAPyYy89iTyANFV90RgG3hojnIS4
         /ac3AVFjFyrnDx+rT0Fxq35McwxI2rS2xaV6CYD+7syjq2Lg3yl2VQb9jh/NPDz7jByY
         FNlA==
X-Forwarded-Encrypted: i=1; AJvYcCUhRYcPLfPQnRyu4C2AhDoDs/CWibKG2riNpm0LrUXiMvW+d4atEaL5AEOsBsXaUz1JATBfjAhBEGgu@vger.kernel.org, AJvYcCV37QvoGybm0XwUaYcOtWsqUZLPcYbwpAeGwdGqCLAp5sEHvdnhDEixUaiJ01hFUG8M3G8jK5H9Ryevyq4G9Od9u9U=@vger.kernel.org, AJvYcCWe2dhStzsH9KAtQD2T4fP/Z1fvG7kXiPKvScTvhpf3fV1NEzRuUdlnADyBPHLIgEE8+dwMD9bACEmBv2Id@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj9RXdIwL5SAMrk7IviWvckjnhvZZQs9esGlNg1FBAMeVF7Kma
	jSO5RX14k4cUlYVMvhLr+j7vzKO8dWMctw72ualElMR2riGt+zRIjDXhCA==
X-Google-Smtp-Source: AGHT+IHLKLaCyBdWJkVQ/RWROmiZmQC/XbMI9u2WV+co1SXbpQize0ns7wnFfIKxX37ujJwAkGHsww==
X-Received: by 2002:a17:907:7203:b0:a90:c411:24fd with SMTP id a640c23a62f3a-a991bd052ddmr266321266b.10.1728045435142;
        Fri, 04 Oct 2024 05:37:15 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9910285ad0sm221601166b.34.2024.10.04.05.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 05:37:14 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 3/3] pinctrl: renesas: rzg2l: Add support for configuring schmitt-trigger
Date: Fri,  4 Oct 2024 13:36:58 +0100
Message-ID: <20241004123658.764557-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004123658.764557-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241004123658.764557-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for configuring the multiplexed pins as schmitt-trigger
inputs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2
- Included RB tag
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 8d576cc74003..13708c71f938 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -140,6 +140,7 @@
 #define PUPD(off)		(0x1C00 + (off) * 8)
 #define ISEL(off)		(0x2C00 + (off) * 8)
 #define NOD(off)		(0x3000 + (off) * 8)
+#define SMT(off)		(0x3400 + (off) * 8)
 #define SD_CH(off, ch)		((off) + (ch) * 4)
 #define ETH_POC(off, ch)	((off) + (ch) * 4)
 #define QSPI			(0x3008)
@@ -162,6 +163,7 @@
 #define SR_MASK			0x01
 #define PUPD_MASK		0x03
 #define NOD_MASK		0x01
+#define SMT_MASK		0x01
 
 #define PM_INPUT		0x1
 #define PM_OUTPUT		0x2
@@ -1351,6 +1353,15 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 			return -EINVAL;
 		break;
 
+	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+		if (!(cfg & PIN_CFG_SMT))
+			return -EINVAL;
+
+		arg = rzg2l_read_pin_config(pctrl, SMT(off), bit, SMT_MASK);
+		if (!arg)
+			return -EINVAL;
+		break;
+
 	case RENESAS_RZV2H_PIN_CONFIG_OUTPUT_IMPEDANCE:
 		if (!(cfg & PIN_CFG_IOLH_RZV2H))
 			return -EINVAL;
@@ -1489,6 +1500,13 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 					     param == PIN_CONFIG_DRIVE_OPEN_DRAIN ? 1 : 0);
 			break;
 
+		case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+			if (!(cfg & PIN_CFG_SMT))
+				return -EINVAL;
+
+			rzg2l_rmw_pin_config(pctrl, SMT(off), bit, SMT_MASK, arg);
+			break;
+
 		case RENESAS_RZV2H_PIN_CONFIG_OUTPUT_IMPEDANCE:
 			if (!(cfg & PIN_CFG_IOLH_RZV2H))
 				return -EINVAL;
-- 
2.43.0


