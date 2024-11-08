Return-Path: <linux-gpio+bounces-12730-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2948F9C1B59
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 11:53:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5DC91F2267D
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 10:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E1CD1F1309;
	Fri,  8 Nov 2024 10:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="kN2Y67Z1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350151EF954
	for <linux-gpio@vger.kernel.org>; Fri,  8 Nov 2024 10:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731063044; cv=none; b=lT0V+m8+dqOLNUWbcgB4323o1/RDqT6OZMgWb+JTRZM3v4DztOd7xRQkFy4OaPECGD4/pR+1FNzf+d0N0crN8MZC/HZtm8eMF+L+eBOQf73PX8fa4AzobJca87KU7fqRD1UaUrtuWgeLc46ODGMFus02NSzk8xB5xtaSO1LrCKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731063044; c=relaxed/simple;
	bh=K6Cw19VzanRggQJ9ackg58S/cIHnDftQ+AAbWSfLA4w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B9a8uB73bxWadIOmrZtaFFfb+MH5jbabdH1RXjhQ+ZMUU/eqXsFM6HT1ZFyAIVaUoaNVFrGNWe+8daSGghkWFUOvv6jyo7fMbT4zOcNBXKB3UGHIkKIBWoXpVyWXGKugFeewxwm+1uk1TwdC7ltFA0vFc1Jgelq3rCRXWy/FuXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=kN2Y67Z1; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a7aa086b077so268841366b.0
        for <linux-gpio@vger.kernel.org>; Fri, 08 Nov 2024 02:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731063042; x=1731667842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGI8BLotlgYkbPf2kxGSbSSNn1fEysvNxJMS0KOJ8NY=;
        b=kN2Y67Z1k4AnfMFTdK0wWOQ/R7DltDdeQ5KhekuxahpyP9shQhvXSJOhsnOmzO6oSF
         R2Ii2CMdt7NZvKeSTC7xL8JAr41LnQ1XEA68fCrhRZnydP6Qj4VQG0vj5jXi8NpHO1Ke
         8t6J9EKB/Uss8IZYnbg06CMNBDuMclnnvd8vPOUqO93OWIdfo30eJD0gCOwpBRM8rlfg
         KG2NmCUkxJQ3Z/QbQgcjJsGOfk0eYPPoLeQnO+8bvI+KgiwL+ylQ51c8ihHqXFL9m1DJ
         HwFaloAqVp7NohURp7qIk1QvGVhnIzhK7YW2Nyc/mDvWguuxiSwpGx+9Pi8SNM4JXb5y
         y+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731063042; x=1731667842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oGI8BLotlgYkbPf2kxGSbSSNn1fEysvNxJMS0KOJ8NY=;
        b=wSUMzcGK1GqPgqFRNIWzSh1t0SXwRqqI5Ya7GPtr48pxIBitdpKol06/HoVvyzME7C
         cfYSDycRefwZfV2m2Uqd+Z1GAN3Bki431v1s1TQ9oGb2XzieK7QuOXIcUBLiUoIZRZPC
         +W8eVGCeRLQQvPNlOGpghlMt/hYcwiG2JyZ9fVQuVHmKsgpPb81uM4LPKnN4kUwe/ocP
         SqIVoi5CrsVbyvXjjM7I8l576RYQjMsUXQ3RMwhj/vxYWWpaLVC5jYEINGWjgob4xI2b
         K06zifk8gCiEtl4XjLcmUr6KwRBrr6QRYuG93Vx44TN+8HZwYbKCtA7Jp2bbDIYyEYHj
         Y8kw==
X-Forwarded-Encrypted: i=1; AJvYcCX6T/t7I3Za9NUQVCURunIy2gY31Nwd4VGyo4rjBVxpw6tyaQ79eZxAi9NyLZdORf1G2/HGsom1ulAD@vger.kernel.org
X-Gm-Message-State: AOJu0YyUPm969QZAGkcVQXC/tRNfkjkW9b9c46OgEjHYnMXeiF8TLZZF
	x3EFAnu+c6P/F0IVRMlBdGk6zJQbH0ZhBSXaP2upsmJZaNVO5ZUFoFzXVMDFbTY=
X-Google-Smtp-Source: AGHT+IGs/OQqKoJK1pwx5fwra0tyGy3QmPPNa7cuyW1FS4OzMCdTq2C8v+8ndDd64d+x58RAV4CJrA==
X-Received: by 2002:a17:907:e94:b0:a99:f746:385 with SMTP id a640c23a62f3a-a9eefebd439mr210008966b.1.1731063041624;
        Fri, 08 Nov 2024 02:50:41 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc574dsm220464866b.101.2024.11.08.02.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:50:41 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	linus.walleij@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 12/25] ASoC: sh: rz-ssi: Use readl_poll_timeout_atomic()
Date: Fri,  8 Nov 2024 12:49:45 +0200
Message-Id: <20241108104958.2931943-13-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Use readl_poll_timeout_atomic() instead of hardcoding something similar.
While at it replace dev_info() with dev_warn_ratelimited() as the
rz_ssi_set_idle() can also be called from IRQ context and if the SSI
idle is not properly set this is at least a warning for user.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index f230d63339e8..aa175803867f 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -9,6 +9,7 @@
 #include <linux/clk.h>
 #include <linux/dmaengine.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
@@ -307,7 +308,8 @@ static int rz_ssi_clk_setup(struct rz_ssi_priv *ssi, unsigned int rate,
 
 static void rz_ssi_set_idle(struct rz_ssi_priv *ssi)
 {
-	int timeout;
+	u32 tmp;
+	int ret;
 
 	/* Disable irqs */
 	rz_ssi_reg_mask_setl(ssi, SSICR, SSICR_TUIEN | SSICR_TOIEN |
@@ -320,15 +322,9 @@ static void rz_ssi_set_idle(struct rz_ssi_priv *ssi)
 			      SSISR_RUIRQ), 0);
 
 	/* Wait for idle */
-	timeout = 100;
-	while (--timeout) {
-		if (rz_ssi_reg_readl(ssi, SSISR) & SSISR_IIRQ)
-			break;
-		udelay(1);
-	}
-
-	if (!timeout)
-		dev_info(ssi->dev, "timeout waiting for SSI idle\n");
+	ret = readl_poll_timeout_atomic(ssi->base + SSISR, tmp, (tmp & SSISR_IIRQ), 1, 100);
+	if (ret)
+		dev_warn_ratelimited(ssi->dev, "timeout waiting for SSI idle\n");
 
 	/* Hold FIFOs in reset */
 	rz_ssi_reg_mask_setl(ssi, SSIFCR, 0, SSIFCR_FIFO_RST);
-- 
2.39.2


