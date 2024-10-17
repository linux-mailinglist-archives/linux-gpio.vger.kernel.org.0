Return-Path: <linux-gpio+bounces-11524-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0479A212A
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 13:40:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2C2C288AEB
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 11:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C00D1DD0FE;
	Thu, 17 Oct 2024 11:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OAH1y3p7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5911DA619;
	Thu, 17 Oct 2024 11:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729165197; cv=none; b=MelSkDGZRovLux43Pu0ntpMw/t0VjcVq1t/nHf+9vuafI77LaDICuj8PQkH66L01Xh3hJ5izc3EL9MAJPfWOTLN/yCFQAKTvLN2rzbRvsBvTFqicETheJIVviA/TB/JQsRvWjM7X5yUXFAr9QFqQOOvX4+0Eq9iLiRgFaMQLPAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729165197; c=relaxed/simple;
	bh=OrcepXx4xODgS8EEORLedQ7ezdiPNjZqltCvPaIPAps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i9bQQ6bcUysrR0bjJIkGEBc9d55R1S/ufr8QBSQeKyj9aR76L3C+Eg0Rxh235YBamYa0EN/PjkJ9fHDTrp/re2jSu6eFhurp8iVnq7Dyyk+eo0en8yb/7Etg+sAO5/AmQEAcE+Fq928t3IqsGNcPtWTEHfRW5mCxy9Xz1sbxwJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OAH1y3p7; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4314c4cb752so8852765e9.2;
        Thu, 17 Oct 2024 04:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729165193; x=1729769993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7WSyi+mFYZzs8o+DRhZ+V8E9XgyLLZbtn/4WYfTbRE=;
        b=OAH1y3p7ibkAOS/o+Fza3Kk2LfUmODuoQSsel+2d4MVP/9G5wNK6VDeiArdljjV8QQ
         b42CCMv9CAkcQaVsqPCoLxT1KCJEQfSu7QC7g6NM8+FnvYw4cevSl7SMzThW+Tb19sN5
         xs9K1DiT8Kmlwoxax37fVt4fXd0Taxmb8akKZK4As3EJIhvN6LtRTVNUBtuFntzz9P5V
         ZJCBDUcBH9H3q9aJwxGh16pvncjtuyDTNhtl/GjmhPyCul6uK6bxIRu8j8dr3f0sVBtI
         lUF0AIKoIIPCn4A9lh6ZHxXoW5lNCs8EznRtcB/HOsSzrHdTtPISL5IOcqbA4nPhUbw9
         RawA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729165193; x=1729769993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V7WSyi+mFYZzs8o+DRhZ+V8E9XgyLLZbtn/4WYfTbRE=;
        b=KL7ygfSA98aAITsjPxADh+08FBOBW+9t2BbiPXHuoHMSuCaDbG/W+cjDDRLc5PNvbc
         OF/jpq4Dopxgabwi+SqKowRwH6GZPKKo0td/hRKieE5tyr2CsB/ufmxljWkXKdB6o7hu
         GYsxeW+zBsznouXTi8lX1n7spD8CmEoN/jb39zdquMaLqFwDht3WrLZLotgmGfoV0HwH
         8WR/SoYwcM9kKIVTxRBJyWbcONIIw++5/W0Ah+flqhfnzrIyln8GGjLLE154Ygw4fckO
         xAzDN93t5tlJLE0XlREzHb/2aeEvU29TZrjPE16M5c4qlKF51ouYg+XCG4Tiv9CzKMDp
         es+A==
X-Forwarded-Encrypted: i=1; AJvYcCUNjJ/Z3KgStdjkUHEFPW1k9GRs1hfezeBn+YN0dH1IPn8fSRKsvZbUDC10B7p2/zrHY/ClJ+lBaDOA@vger.kernel.org, AJvYcCX1ibyG06owa0b97/NvZb2A6EpjBQFXzugHaANVpmHA3CeGPLXJhQzkxTARqopTF2fD+iw3NjnkQgLHTA==@vger.kernel.org, AJvYcCXkHBCYYJFan7om0JjVpeQWL7pjRDPVadTqqHOAICCit/x/eiIP/zFOk762Nq7JtA40yMti5ymhQzOiCWxCXNL1Fkg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzni1VCELoMdF/ldZvPPlm3eOzWd6ghq1gtj0hDpQZH5KKp5GBq
	gB2uYWXPKV/CTaSoQyQHMeJH5RPAAE6mbjqewaDPN5K/G4imA3F6
X-Google-Smtp-Source: AGHT+IGQzALL8gJ0LUU0w64wb3YMwN9fdRLEJntNWKAwYoYNkK/HAMUuoJ0RjlIdqF68Aq1q/+LxDQ==
X-Received: by 2002:a05:600c:3ba9:b0:42c:b52b:4335 with SMTP id 5b1f17b1804b1-4311decaa31mr191141305e9.10.1729165192389;
        Thu, 17 Oct 2024 04:39:52 -0700 (PDT)
Received: from prasmi.Home ([2a02:c7c:e309:f400:f6f5:4306:392d:908d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fbf82b1sm7060399f8f.72.2024.10.17.04.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 04:39:51 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/7] pinctrl: renesas: rzg2l: Release all the virq's in free callback
Date: Thu, 17 Oct 2024 12:39:38 +0100
Message-ID: <20241017113942.139712-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241017113942.139712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241017113942.139712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The `free` callback in `struct irq_domain_ops` expects to free
nr_irqs interrupts starting from virq.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 39 ++++++++++++++-----------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 8ffb9430a134..1a09ccbfebad 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -2477,25 +2477,30 @@ static void rzg2l_gpio_irq_restore(struct rzg2l_pinctrl *pctrl)
 static void rzg2l_gpio_irq_domain_free(struct irq_domain *domain, unsigned int virq,
 				       unsigned int nr_irqs)
 {
+	struct rzg2l_pinctrl *pctrl;
+	irq_hw_number_t hwirq;
+	struct gpio_chip *gc;
+	unsigned long flags;
 	struct irq_data *d;
+	unsigned int i, j;
 
-	d = irq_domain_get_irq_data(domain, virq);
-	if (d) {
-		struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-		struct rzg2l_pinctrl *pctrl = container_of(gc, struct rzg2l_pinctrl, gpio_chip);
-		irq_hw_number_t hwirq = irqd_to_hwirq(d);
-		unsigned long flags;
-		unsigned int i;
-
-		for (i = 0; i < RZG2L_TINT_MAX_INTERRUPT; i++) {
-			if (pctrl->hwirq[i] == hwirq) {
-				rzg2l_gpio_irq_endisable(pctrl, hwirq, false);
-				rzg2l_gpio_free(gc, hwirq);
-				spin_lock_irqsave(&pctrl->bitmap_lock, flags);
-				bitmap_release_region(pctrl->tint_slot, i, get_order(1));
-				spin_unlock_irqrestore(&pctrl->bitmap_lock, flags);
-				pctrl->hwirq[i] = 0;
-				break;
+	for (j = 0; j < nr_irqs; j++) {
+		d = irq_domain_get_irq_data(domain, virq + j);
+		if (d) {
+			gc = irq_data_get_irq_chip_data(d);
+			pctrl = container_of(gc, struct rzg2l_pinctrl, gpio_chip);
+			hwirq = irqd_to_hwirq(d);
+
+			for (i = 0; i < RZG2L_TINT_MAX_INTERRUPT; i++) {
+				if (pctrl->hwirq[i] == hwirq) {
+					rzg2l_gpio_irq_endisable(pctrl, hwirq, false);
+					rzg2l_gpio_free(gc, hwirq);
+					spin_lock_irqsave(&pctrl->bitmap_lock, flags);
+					bitmap_release_region(pctrl->tint_slot, i, get_order(1));
+					spin_unlock_irqrestore(&pctrl->bitmap_lock, flags);
+					pctrl->hwirq[i] = 0;
+					break;
+				}
 			}
 		}
 	}
-- 
2.43.0


