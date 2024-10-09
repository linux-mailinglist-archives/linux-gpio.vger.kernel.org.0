Return-Path: <linux-gpio+bounces-11107-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB07C996F90
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 17:25:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32AB42845D0
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 15:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF7E71D61B5;
	Wed,  9 Oct 2024 15:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f2yn1ons"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AE41A255A;
	Wed,  9 Oct 2024 15:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728486806; cv=none; b=SPzK3t7xfJAMNyEcTFwTQeAxuWpw2MjQ3TpgdpL3xQFpUtjlZucy2c/UCviMx/u7F3OUCDzdQ6KNJc7sUZ9dCNoRlZ8iFhpEKHV5ixZAEn/DPcO7HKKtJklZWMGALDYzy4jugkDR2E8x6eR6f5VXpum1BgYg48Smx5cVwPTLPVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728486806; c=relaxed/simple;
	bh=26zmDy5UoqTQK1n1AxRlDvukOxufHLjRuP41pT2T73I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pxPMObnWqFX4Z6aIjrEdobjKnFvYHGlJhLLLfIAR1/0Jy5/5azUVAL8xTmrRqYQrggJk4/jgEVig8QHU5S8Qq9oiqbdHKLQW3gh8OqNp/AaQnYPC18+SuNpFusdhWN6u4CyaGcxvR2nfsw4OND0HOn8dRaLpYHX75A2VmhKLa34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f2yn1ons; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fad100dd9fso102680621fa.3;
        Wed, 09 Oct 2024 08:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728486803; x=1729091603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QdvWDk26/ZZBHPKCvwS0MvPf2U6fD5rvA9Tcc+fXWXk=;
        b=f2yn1onsFAmgfolFtMNyKGoBrF0C+t89rk0GuFSdSAgTVk8h/Dgu1Smo+j/x12KPSz
         W/YTbv2AX1zxiwrtp77815HWaI6saYUzPPqQeAFUyGYkbqUbCrh1cYK2N1CpkkMHDRPV
         +A7+9P68U/gq8/W7mK8TXsALrl3jBGlryQUAYl2EyPPPeutYYhYKdQ1SoV9kjgmbx5kg
         iKHexvu28dn1l+R6i0GSh9KzTOPBJ/FEQI9N6LjafFRi3+YMcJTMHXoUYj9Dxvy81BEd
         6rwMV5u3I1d74XBlwugk+AUd2o+pzjkuuVwicLN9Aypddyg/WzNO0Rcdnvka6P4Q+Vsc
         y+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728486803; x=1729091603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QdvWDk26/ZZBHPKCvwS0MvPf2U6fD5rvA9Tcc+fXWXk=;
        b=afSxKlxwaZpSrLgKZqwEUCEwlCyLC1HQJkRIKNYpLpAjq6v6wXsqe6aOJXC0imOmZJ
         b7YY80KWdsAHtGzN50Rq1CuRPyZ094bw+sHG+xuKDp+jotP/Q3W5OYwUdse25tDmoBzH
         WNK35GOhEp9iafI2p0tGZGipfpSws3B+BYicC6HmnSC5FGp6Gl6rPUQgVpGIdbdDNeSI
         tGjc4Fp0K5f4YA8vguCakEvQt106u62ginI/UjDWsa0GVOF2NMtje7JD05VC7DJ6ANbd
         B8uJITL4C3omZhmzuUZJ2v+LB5czR6MVpjnGPTPCk3/lEILeQYcSzvQrh0JwuCxJvbuR
         kNRA==
X-Forwarded-Encrypted: i=1; AJvYcCX5DEU/TQ4SFYGBRvbAnVtNNc/OCauv0+4u3UP9GKWiJ2ilYctbrzXiEc8GKGCbRWZFMCR0nDX42WvX@vger.kernel.org, AJvYcCXvNCUkrft718SoOPMQFg83xErzWmmhP7QEn5nygOZmFL6XkEHXuN9IY9qYwfiSnMpnsPy86i+6Q96cRJLB@vger.kernel.org
X-Gm-Message-State: AOJu0YyEeG9pL6LHXJUnsSDUPPwOWqFgaoOjAFr6vp3q2XM0OkQ+teNV
	ldcy4opigoQ2ocCYicWG8SsQow0su8Bbqns4sXVHAslLDZ8qbZf+gquk3A==
X-Google-Smtp-Source: AGHT+IGAJI8bmysyk5Gsawk7h9nq4HXgCUZCOWp7QPaaj/2p02RU3yRJQwet8iHkONBs68wZSMJzCg==
X-Received: by 2002:a2e:802:0:b0:2fb:cff:b535 with SMTP id 38308e7fff4ca-2fb1872fc57mr21823551fa.13.1728486802933;
        Wed, 09 Oct 2024 08:13:22 -0700 (PDT)
Received: from mfe-desktop.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a992e7864besm666367366b.113.2024.10.09.08.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 08:13:22 -0700 (PDT)
From: marc.ferland@gmail.com
X-Google-Original-From: marc.ferland@sonatest.com
To: Basavaraj.Natikar@amd.com
Cc: Shyam-sundar.S-k@amd.com,
	linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marc Ferland <marc.ferland@sonatest.com>
Subject: [PATCH] pinctrl: amd: Fix two small typos
Date: Wed,  9 Oct 2024 11:12:49 -0400
Message-Id: <20241009151249.2086702-1-marc.ferland@sonatest.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marc Ferland <marc.ferland@sonatest.com>

Found those two while reading the code:

EDGE_TRAGGER -> EDGE_TRIGGER
BOTH_EADGE -> BOTH_EDGES

No functional changes, compile tested only.

Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
---
 drivers/pinctrl/pinctrl-amd.c | 2 +-
 drivers/pinctrl/pinctrl-amd.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 7f66ec73199a..fbeab2ddef82 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -506,7 +506,7 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	case IRQ_TYPE_EDGE_BOTH:
 		pin_reg &= ~BIT(LEVEL_TRIG_OFF);
 		pin_reg &= ~(ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
-		pin_reg |= BOTH_EADGE << ACTIVE_LEVEL_OFF;
+		pin_reg |= BOTH_EDGES << ACTIVE_LEVEL_OFF;
 		irq_set_handler_locked(d, handle_edge_irq);
 		break;
 
diff --git a/drivers/pinctrl/pinctrl-amd.h b/drivers/pinctrl/pinctrl-amd.h
index cf59089f2776..667be49c3f48 100644
--- a/drivers/pinctrl/pinctrl-amd.h
+++ b/drivers/pinctrl/pinctrl-amd.h
@@ -60,12 +60,12 @@
 #define DB_TYPE_PRESERVE_HIGH_GLITCH      0x2UL
 #define DB_TYPE_REMOVE_GLITCH             0x3UL
 
-#define EDGE_TRAGGER	0x0UL
+#define EDGE_TRIGGER	0x0UL
 #define LEVEL_TRIGGER	0x1UL
 
 #define ACTIVE_HIGH	0x0UL
 #define ACTIVE_LOW	0x1UL
-#define BOTH_EADGE	0x2UL
+#define BOTH_EDGES	0x2UL
 
 #define ENABLE_INTERRUPT	0x1UL
 #define DISABLE_INTERRUPT	0x0UL
-- 
2.34.1


