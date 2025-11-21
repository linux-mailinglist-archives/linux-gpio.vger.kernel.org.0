Return-Path: <linux-gpio+bounces-28962-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF65C7ABAC
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 17:10:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F4823A19B9
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 16:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C31350D57;
	Fri, 21 Nov 2025 16:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fShMtjHr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B7E34AB12
	for <linux-gpio@vger.kernel.org>; Fri, 21 Nov 2025 16:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763741337; cv=none; b=NjcgVxBfOo8OxULldRDJE4CSLNXUH9bEZtqk1dpm3ngwWx7TxTApHkYxOzhNNy9trja7CiMmnmvUrduDxwsB/18mdxZM2gTwmVBcUEMkReAkhXI7WqjHledyganKQ7KOt/DnV3uItIexK5RXenhlAcmQXlBiILUbrTFttsyXdT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763741337; c=relaxed/simple;
	bh=SAs0PZaWPeFBSk4KcIri4avonMMoZK50murb/7C0qcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E2knR8ahXn6K4ovEajm63ofYyvIkeUXjuFJ7DPxKpfk48w/mwCUuko/cLAtkgfevCbk+0h6tyTMdgoZs8E6slLaQ19ZeIIgTDN+F3tKuiHRi4XqMSwmfOAwZiYssrGka9calsgAmTLp0QsP83v1ZNhInnhh4C6d5xBKYl7JM44o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fShMtjHr; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so23647395e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 21 Nov 2025 08:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763741332; x=1764346132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R9C+Ue8cMcG+njUQyZUQmHV/igv+sYiQ8hcgoRvKYA4=;
        b=fShMtjHrfXjYqGlQ0l4rhnQdzjLDBKi3che+sZ84/eAXcdXSehHk+fopV7YwAv7CwC
         90Z0+yU7fZVIULSBvyCQe9nINzY8mJ7prjNOBqx24/vQe5LzYJ9RjqgvReiPpWzkdeno
         4gMsy5VaNTZ3lUVzpiDxp6r60Yc1Z/f3Yf+6+fBAUfpqe1iXv4QHhPSNJ5YG/0DO4hCW
         F/3M1Vt1qUQVX/nMQCxDPd5DPXYWUsFOTjO2gZiQ/fMn1vLERSmsHGmkIbI30+tqhMNa
         EFWiZIzB4K4V//LuBZkd0ve3QtPFWffl1naeHzFtcnUVJ4n3Q4LwEOvuKH2m/ppgVQVX
         7p7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763741332; x=1764346132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R9C+Ue8cMcG+njUQyZUQmHV/igv+sYiQ8hcgoRvKYA4=;
        b=QnCV3H+zlAXN33+8PJfnruOBsrEAIqpP4Xrxgdo2Vco+3LNrR879r1cMR56ZSOKU2w
         peAVmW8yfxjlNcYay8zoWhWYR6Uets53QGxIw9RSADkg5CVv4oU1A0+oPM1An+U04+6n
         zV1KzmJdIlX/PP2HPViMolg1CJw0cKM/5A729hbkm9zFmCMbpafU7CzzDrE6DbNpKBck
         x8i3gb6awZ1/e3p/DiPSa17taFPu+TifXOp69iqLBCiUXhVc+pmeUDY7QdLyQyEedCYV
         fm383xrGFWeDhig+z39Hpjbb0doAZjStfLtSZXryr7oCCpHBk6FFfLFJR5gcz3OXNmoE
         eRDg==
X-Forwarded-Encrypted: i=1; AJvYcCWNoR+hswHCd/VVigU66VTFs5lQOT3Xl3hWw7QOiKaBDMYtB7fLUdgwdtTv37naTB2St1ucbJixKQwO@vger.kernel.org
X-Gm-Message-State: AOJu0YwKX5n19ovDuAHYLLOYM2dLwuyeZdV9QaGskgR+kQW10pfOEXMZ
	xOMlMEvJKuCdskYA9i22ITdAqu2yzZD4rl5xWqzkg8CwD5ara80hc06r
X-Gm-Gg: ASbGnctVZN9F85qrhpSM3jmEiDlCvKvzbETIoB2MOmCFeYOQq5MiYnverVmMlCaNzXM
	5nHdaB9CQ4q2Rpq6Jg8aBGXvQklJAhYHWy8ce7OrFIeIz9I+/3n1Su4S69ENZRGPrgQnCMJm81n
	UGxNOskmm8p9YKEAEtrXYYegSvAzvu6Za8Xra1TOhyyS1uCXEyTUJgqZracTGEEKGNbo5OUnmvf
	O3jyxwu+R7IJNaqY8RjmwifIf5LnIJcO5ZHTc10g7yVbqldl9V3K4esi78xzkj9o6e61vHAnMvG
	m0H/wIgBF95W1HNJ43u22p5xokYe6yUQc9HIkhGaIKVZlTeP4r6xP92Sg81Wt/doXADX0GE35kH
	grc6MAXvGEmZqE2qiydp/WgQz4CZprOI0mNvA/ZF5oSVQox1LZFLCQ8/WNri6s6vTlu1062tqoT
	tvWGoo5zUdB5loGFSoXtuLpag1GtDtGY1apHVyge+9ZkcklEGhtlwVFJCnT6IKF5KvOgh96uc=
X-Google-Smtp-Source: AGHT+IH4jxNoAr2KGBsMthVy7F6coCsto3BqmhfkVqtdBgcmZbZrjs/t5yrDang5WvrNZ5Prs+SrBg==
X-Received: by 2002:a05:600c:4f46:b0:477:63a4:88fe with SMTP id 5b1f17b1804b1-477c1103099mr28244585e9.2.1763741332216;
        Fri, 21 Nov 2025 08:08:52 -0800 (PST)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm89496195e9.8.2025.11.21.08.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 08:08:52 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [DO NOT APPLY PATCH v8 10/15] pwm: rzg2l-gpt: Add support for output disable when both output low
Date: Fri, 21 Nov 2025 16:08:17 +0000
Message-ID: <20251121160842.371922-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121160842.371922-1-biju.das.jz@bp.renesas.com>
References: <20251121160842.371922-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

This patch adds support for output disable request from gpt,
when same time output level is low.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pwm/pwm-rzg2l-gpt.c   | 9 +++++++++
 include/linux/pwm/rzg2l-gpt.h | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index 8006c62068b6..a0100e1b948d 100644
--- a/drivers/pwm/pwm-rzg2l-gpt.c
+++ b/drivers/pwm/pwm-rzg2l-gpt.c
@@ -85,6 +85,7 @@
 
 #define RZG2L_GTINTAD_GRP_MASK	GENMASK(25, 24)
 #define RZG2L_GTINTAD_OUTPUT_DISABLE_SAME_LEVEL_HIGH	BIT(29)
+#define RZG2L_GTINTAD_OUTPUT_DISABLE_SAME_LEVEL_LOW	BIT(30)
 
 #define RZG2L_GTST_OABHF			BIT(29)
 #define RZG2L_GTST_OABLF			BIT(30)
@@ -493,6 +494,14 @@ int rzg2l_gpt_poeg_disable_req_both_high(void *dev, u8 grp, bool on)
 }
 EXPORT_SYMBOL_GPL(rzg2l_gpt_poeg_disable_req_both_high);
 
+int rzg2l_gpt_poeg_disable_req_both_low(void *dev, u8 grp, bool on)
+{
+	int id = RZG2L_GTINTAD_OUTPUT_DISABLE_SAME_LEVEL_LOW;
+
+	return rzg2l_gpt_poeg_disable_req_endisable(dev, grp, id, on);
+}
+EXPORT_SYMBOL_GPL(rzg2l_gpt_poeg_disable_req_both_low);
+
 /*
  * This function links a poeg group{A,B,C,D} with a gpt channel{0..7} and
  * configure the pin for output disable.
diff --git a/include/linux/pwm/rzg2l-gpt.h b/include/linux/pwm/rzg2l-gpt.h
index 718aaeca39f2..adb5b9cfc8b3 100644
--- a/include/linux/pwm/rzg2l-gpt.h
+++ b/include/linux/pwm/rzg2l-gpt.h
@@ -7,6 +7,7 @@ u32 rzg2l_gpt_poeg_disable_req_irq_status(void *dev, u8 grp);
 int rzg2l_gpt_poeg_disable_req_clr(void *gpt_device, u8 grp);
 int rzg2l_gpt_pin_reenable(void *gpt_device, u8 grp);
 int rzg2l_gpt_poeg_disable_req_both_high(void *gpt_device, u8 grp, bool on);
+int rzg2l_gpt_poeg_disable_req_both_low(void *gpt_device, u8 grp, bool on);
 #else
 static inline u32 rzg2l_gpt_poeg_disable_req_irq_status(void *dev, u8 grp)
 {
@@ -28,6 +29,11 @@ static inline int rzg2l_gpt_poeg_disable_req_both_high(void *gpt_device, u8 grp,
 	return -ENODEV;
 }
 
+static inline int rzg2l_gpt_poeg_disable_req_both_low(void *gpt_device, u8 grp, bool on)
+{
+	return -ENODEV;
+}
+
 #endif
 
 #endif /* __LINUX_PWM_RENESAS_RZG2L_GPT_H__ */
-- 
2.43.0


