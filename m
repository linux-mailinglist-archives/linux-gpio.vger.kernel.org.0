Return-Path: <linux-gpio+bounces-12083-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D23129B01A1
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 13:49:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57CD01F237EA
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 11:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 679F62036E6;
	Fri, 25 Oct 2024 11:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i74DvA2B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0391A1B6D1E;
	Fri, 25 Oct 2024 11:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729856972; cv=none; b=CzybyxPCHyfRf6IbkbA1TafGhj6kTiH4HY8tUTBcrJwnp77AYboyuYApKSkyqdY1cP5CpsqxxXf8UZBxZWwW20cdHcia1vEpUZVnpUws9g5ZVec//fCajF1xjol0C4XlVbk3on1/H64Y+AMoNJTKwWfu1TDhxKShf/DAT4E30/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729856972; c=relaxed/simple;
	bh=IFSN6+NQRn4+PSD8DPcmwIxzRIX23QVqKcE5ou+fGs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LUXR1C4d7eMqzM+vvLBv6gUN4ECjxxDQ/yAxZ9TIWWvHPPCmTY9rsvQjuPaGMwrR9vzLUXoATYLsw7/na4qgWUXGl9H6f0Mh/k0QyouJfNcRcayTP3XDTok5Zg++wxpU9APUQqb/WvWboMbtWd2dybKoOmFmL1KEUkIy5VnXH4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i74DvA2B; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fb5be4381dso21455701fa.2;
        Fri, 25 Oct 2024 04:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729856968; x=1730461768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VoaXpDJ6rPqnyL6hF8gNhqswIJFFWm8mj5yKDECTdeg=;
        b=i74DvA2BwM6BX1ahGQhniEZlQlgGHrgLlvWx1QFvIQjesrfb5sckwCLAjYxr3A/14e
         QGH2LmwMTn3AbnqOIhUjS4or06/6YXmPBAhMcqMf+AXNPWTq4g0lhRXMG02Z7I86DpgZ
         B4A1k6ivxzfIOGa1AufXTqjcyMCxEI+y7+CjTDXH9DVdAbMsS5hsPdWwPRdH1UIEedpT
         tZpS9CT3g2ZbONklc14ooCoy4Hz7WPOY7BgIE9yfVaN8LbDDFGGxIuOu02OW2L5Y2iUM
         OglXcLhvOlhyOGgIPQwGb4KtkuqvW8NyKgEvLhrYzOQzi78uAXU2PAgbILhnfpEbGUAc
         3zdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729856968; x=1730461768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VoaXpDJ6rPqnyL6hF8gNhqswIJFFWm8mj5yKDECTdeg=;
        b=jvROhYRjwYxw7UHNWwCO/MMb4QhULgX+TNZWBFS/T9zfBhd8X7znDPEM60lONRWPiv
         WURbvVICAtdPONu6MywzR8zxd/den4uegAV20+k85A+Yq0qYP/OBQOvSMvwUiOtAIC7w
         HPswWEPi/vqd5eYuRl0YJmLzmRqLKFabce/ad/wRJLCajRzWbu8/OYYvF5apzQLbs1i7
         9/390CDv89K/6Epq0lnyOqTg0H4ynj4Sv1qoZT0NlWh3wmarrFhnmQR9eG0iB8PmHoZr
         jK5vp+meTaVhIdUke5O14TiZim1gMtDACPs6UCY0zHpXDsIhh3OtjcGW/Yw1/P/Icsce
         HgZA==
X-Forwarded-Encrypted: i=1; AJvYcCWinq7vQt+By87MAzOXBIB22mzt9ADHSIvWjPG3MPTYHeB9NoWY6NrfutJcaaLR7Mrgdn81YDqJXvBv@vger.kernel.org, AJvYcCWzSUyC8sfnF6WG3XqdeMo4L7rjXpexC7fc+qx8RI1VGNcyJrC4xDpUCYZ6QQiukJvC1/t4jhgwJrmYxhfS@vger.kernel.org, AJvYcCX0h1o1VTtyy6/6za7WDfs1TzWwvJ52G0PRQpAXNNXaTyKAV2+R0bQBsdmqoAtAtv0I6Yys06ZM8wSXLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YylenuYHCZfl3YfRcU9Ama20Lz/4YDlD6BdZEU6LzRNCFlt4pip
	E12UeVjNhgipum7QY0S8JMwOOMRwGB6A5ecEZEFBCZ4bQmr4n07z
X-Google-Smtp-Source: AGHT+IGESHwlJsvcSXD1bLP1IU57Xc9KbIJiPx3bBZPlSWTwuUrwyBvfZrtGqcRbDk/MbXVPN5SB5g==
X-Received: by 2002:a2e:4a11:0:b0:2fa:cc50:41b with SMTP id 38308e7fff4ca-2fca81c3d61mr27258271fa.5.1729856967601;
        Fri, 25 Oct 2024 04:49:27 -0700 (PDT)
Received: from prasmi.Home ([2a06:5906:61b:2d00:1044:9cc9:b89d:54cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b56741fsm45109785e9.22.2024.10.25.04.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 04:49:27 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/6] pinctrl: renesas: rzg2l: Release all the virq's in free callback
Date: Fri, 25 Oct 2024 12:49:10 +0100
Message-ID: <20241025114914.714597-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241025114914.714597-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241025114914.714597-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v1->v2
- No change
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


