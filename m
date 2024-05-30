Return-Path: <linux-gpio+bounces-6967-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5AE8D5135
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 19:42:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 042431C230F3
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 17:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30B1B4E1C8;
	Thu, 30 May 2024 17:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fu48Eltv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8141C4DA0C;
	Thu, 30 May 2024 17:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717090913; cv=none; b=egMDa6U/WinAoSNxIsxMuVjXM7He0+43P2iSY0FKhTry0vJScaiVZGkSLi6WbPb0OL8pB/+xZJcm/RSVTcrg2p8gaEqMXflH3C7J3Gy9OFU0hjbqCuOwA1pnYwe8wX7le+1YRf/tVF7KcIdgjJVeqMw9EhfgyeF3fWkBLJwkkSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717090913; c=relaxed/simple;
	bh=j9tL9gpfy7OkyOe6iOCK7oh07vHPJnmcOh9104/JG0o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NLcdPRgIulwMsd/FLFRVU55CQ1Jyrkx3pKxse6ZFvjwkQ7cR4GqPMYEsJ/rmOeQFZVBJ6ikrp+zQYQi4/9OFNzJbBNcUP1OteXd+kV5NzidRiXNp24LO6GEs+knnfAS4kpkGW89fdzJtzECpJQUQ+kGCmp4oHEczWVBKpU37ndg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fu48Eltv; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1f480624d04so10463825ad.2;
        Thu, 30 May 2024 10:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717090911; x=1717695711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0V+JT9uI7tYaLEbdfGiVY2aTzIUtUtzYX+9IgVQ/4A=;
        b=fu48Eltv3vqO/OrW0fNsK6OWyRSdbkLq6Cou+ddUjKL4tp0aPJcJT6EZyoSvcl/ZjM
         lsODRxsP7RlN0EDKFujlpIhPN6IxZQ1kE5591ETEv3f+/nZEMir0oYoXNwL3AbDG58y5
         CEG4ezkZd3mjEvCgCBV4FqJx8/L4gofSRpwAFBrcjO1dte7vMh5h+Zz0DN2WJ21ZAWbl
         MWF+ELYfG9l2EWdxK6c9/RmWf5KP0G3n0wa/lRvv7cOD1hEnWlKNYnAgISNz0W1vosfs
         veW31MqalEQ+yth87qbHo0dwQKMfxgNj5Gb+oU1KMSPELMg8aDsJuFXp+MVsBqL5xepX
         QAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717090911; x=1717695711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x0V+JT9uI7tYaLEbdfGiVY2aTzIUtUtzYX+9IgVQ/4A=;
        b=U/XaltW/a57wBXLbshErXeDJY4Lhb+0U1HgMDci543G2ufYO7hhny20vB4s3J/rPCl
         P+4skPlfKIpFPHwBk4KQwYmZTBk/IubNQh5gRgU621VLXEapNbjjwUMdT0+jvXfzgKLZ
         HFGb6rJsbRwnKV/43lKNt3fYWpq/HkVAJjik5vibf8of2QWP8uWfpwsWKMbTIZ6QXv7N
         NIG9AJyAfENCMn1URkNbT8tm69pX4nCIX1mtnrwjI1tkmo547K6YyxlIkmMvAMUqN8Ng
         0TJ25neeRO/SaWtL9JIaTdnTIiDfRV/+/0SZ/DuQHMDaKscu0Ah+ZifEoIM0SDxXuj2a
         Lx6A==
X-Forwarded-Encrypted: i=1; AJvYcCUpZtuhJC0KBA7YYqoxr4wrPwifL6xEx0mzNxp2Gm8NIG2+BO7+zGXT8ST953eBiDTuAOqtUf+5RCkrOTKy/JIjrtNsGOXplkJmt4VF0VoxlhmfxmEAlp0OJLWVUd463XVB3T8bZRJ8gAxHfBQIsLz2wZkXte32qDrDfJ4/LlcgKzzQGDk=
X-Gm-Message-State: AOJu0Yx50n2jrkBUCvYescaUhQNKZrl677MNnCi3AJ8umwYqKVPZgm9D
	Ru/KLWTOap64NcLtXamNe+Cqlob0hiFhKPhu5jUtRUd7IFTTOkJ9
X-Google-Smtp-Source: AGHT+IHvsc5SBJFpJUXgUv4v0815qZj0FyTxP6YUrK6X3vXHGF1PDTeQxjh6AfACXTLjlIeBo5yU/g==
X-Received: by 2002:a17:903:2352:b0:1f4:be9b:d30d with SMTP id d9443c01a7336-1f61960610bmr29089735ad.25.1717090910691;
        Thu, 30 May 2024 10:41:50 -0700 (PDT)
Received: from prasmi.. ([2401:4900:1c07:3bcb:e05d:a577:9add:a9ce])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63240c947sm450105ad.269.2024.05.30.10.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 10:41:50 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 02/15] pinctrl: renesas: pinctrl-rzg2l: Rename B0WI to BOWI
Date: Thu, 30 May 2024 18:38:44 +0100
Message-Id: <20240530173857.164073-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Fix the typo B0WI -> BOWI to match with the RZ/G2L HW manual.

Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3
- New patch
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index f784169abf11..169986022a73 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -131,7 +131,7 @@
 #define PVDD_1800		1	/* I/O domain voltage <= 1.8V */
 #define PVDD_3300		0	/* I/O domain voltage >= 3.3V */
 
-#define PWPR_B0WI		BIT(7)	/* Bit Write Disable */
+#define PWPR_BOWI		BIT(7)	/* Bit Write Disable */
 #define PWPR_PFCWE		BIT(6)	/* PFC Register Write Enable */
 
 #define PM_MASK			0x03
@@ -478,8 +478,8 @@ static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
 	writeb(reg & ~BIT(pin), pctrl->base + PMC(off));
 
 	/* Set the PWPR register to allow PFC register to write */
-	writel(0x0, pctrl->base + regs->pwpr);		/* B0WI=0, PFCWE=0 */
-	writel(PWPR_PFCWE, pctrl->base + regs->pwpr);	/* B0WI=0, PFCWE=1 */
+	writel(0x0, pctrl->base + regs->pwpr);		/* BOWI=0, PFCWE=0 */
+	writel(PWPR_PFCWE, pctrl->base + regs->pwpr);	/* BOWI=0, PFCWE=1 */
 
 	/* Select Pin function mode with PFC register */
 	reg = readl(pctrl->base + PFC(off));
@@ -487,8 +487,8 @@ static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
 	writel(reg | (func << (pin * 4)), pctrl->base + PFC(off));
 
 	/* Set the PWPR register to be write-protected */
-	writel(0x0, pctrl->base + regs->pwpr);		/* B0WI=0, PFCWE=0 */
-	writel(PWPR_B0WI, pctrl->base + regs->pwpr);	/* B0WI=1, PFCWE=0 */
+	writel(0x0, pctrl->base + regs->pwpr);		/* BOWI=0, PFCWE=0 */
+	writel(PWPR_BOWI, pctrl->base + regs->pwpr);	/* BOWI=1, PFCWE=0 */
 
 	/* Switch to Peripheral pin function with PMC register */
 	reg = readb(pctrl->base + PMC(off));
@@ -2520,8 +2520,8 @@ static void rzg2l_pinctrl_pm_setup_pfc(struct rzg2l_pinctrl *pctrl)
 	const struct rzg2l_register_offsets *regs = &hwcfg->regs;
 
 	/* Set the PWPR register to allow PFC register to write. */
-	writel(0x0, pctrl->base + regs->pwpr);		/* B0WI=0, PFCWE=0 */
-	writel(PWPR_PFCWE, pctrl->base + regs->pwpr);	/* B0WI=0, PFCWE=1 */
+	writel(0x0, pctrl->base + regs->pwpr);		/* BOWI=0, PFCWE=0 */
+	writel(PWPR_PFCWE, pctrl->base + regs->pwpr);	/* BOWI=0, PFCWE=1 */
 
 	/* Restore port registers. */
 	for (u32 port = 0; port < nports; port++) {
@@ -2565,8 +2565,8 @@ static void rzg2l_pinctrl_pm_setup_pfc(struct rzg2l_pinctrl *pctrl)
 	}
 
 	/* Set the PWPR register to be write-protected. */
-	writel(0x0, pctrl->base + regs->pwpr);		/* B0WI=0, PFCWE=0 */
-	writel(PWPR_B0WI, pctrl->base + regs->pwpr);	/* B0WI=1, PFCWE=0 */
+	writel(0x0, pctrl->base + regs->pwpr);		/* BOWI=0, PFCWE=0 */
+	writel(PWPR_BOWI, pctrl->base + regs->pwpr);	/* BOWI=1, PFCWE=0 */
 }
 
 static int rzg2l_pinctrl_suspend_noirq(struct device *dev)
-- 
2.34.1


