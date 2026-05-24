Return-Path: <linux-gpio+bounces-37418-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOWfHEMeE2qq7wYAu9opvQ
	(envelope-from <linux-gpio+bounces-37418-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 24 May 2026 17:50:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 084CA5C2FEA
	for <lists+linux-gpio@lfdr.de>; Sun, 24 May 2026 17:50:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 39E053002B37
	for <lists+linux-gpio@lfdr.de>; Sun, 24 May 2026 15:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FBB339BFE0;
	Sun, 24 May 2026 15:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CGmD2IDo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D11126C02
	for <linux-gpio@vger.kernel.org>; Sun, 24 May 2026 15:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779637818; cv=none; b=tvmlHf1mvBU6j5Ru25RySLyjvWj+P9dg+hh+qjconQaD3R8MftgdRwqJEP57rQg4O7xm7w4oCsyjtIorO3FnfNRAx3L8LsM7qNRh4WjtVneR40nlZzOUmBqNJf92+lxqzDzeUmfxCUgehDRhNzwcsTc4wzrZkbF4VTYpwiOtEo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779637818; c=relaxed/simple;
	bh=8/mjomMcL/tL01rBMy4OoB6MPyHJ2iOSUQhMgcRC5yk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kS6E+SHnRBGBmjX0gfRvf7Firhf4UN+FpW6o6G8cHFo+Yw/8Hg60J3Yuw9o+5r4h3b+nVZ3vBPe70Z+KUUY4HeBcmnpdD/dYY/38P/v/qiVKSPHU7zieeVc+IOBqadFIxC1lcipRHQ99RCavKy3rw3xkTIPdw8OA6Y/S0hHAyFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CGmD2IDo; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-837b39eb078so6104215b3a.2
        for <linux-gpio@vger.kernel.org>; Sun, 24 May 2026 08:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779637815; x=1780242615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ReOkgoPLdCaHd6CcEsCAqea7Z9/lGvf+pkF1enOHLhw=;
        b=CGmD2IDoKBnonh8gG3rhE30QTkqJGjNlPViueoMlrfByHWL/C3F61i6RuG5eN5Pt3C
         j62OveBck8dtdEpuLt1CenCkuOEVYrPgKQtAF+n8GLk4VSQWU9UE0xE4tFBZBaiOqzGe
         Mmx3Y7YWEOnSAveptf6ZFkuVGwWuxYMD0r+HGqXhlhCnAailqrFDDOnCFDJ0BJlY3InP
         Vysva+BLyCedNTmFDzWXySJD77pZbsTeEDIGO9Bekw4YjBv/9OhlL81JJvYKX9ylfTpN
         m4T2NcVaKhfHkSeeT34eubdvx5glmZMxsqKPCKFkRZKPSX2Q5FBQ68Hb1kfDysoY+o3K
         ntQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779637815; x=1780242615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ReOkgoPLdCaHd6CcEsCAqea7Z9/lGvf+pkF1enOHLhw=;
        b=EHSzbMj6flysKhsD3Hi3h9KcUeVKsu/d6BozJawMeZe4vjJd92o7jMKVQpTcvKwVzc
         vF+l5awadqYyXcQFFRqnq9v22vxki4fAECS7WQzU/bHilU4IlDfu4++NlnyjL7FQMIwB
         CeIRjbN7bkloBjtQKHYBzzqwHL/JDVhNB8zHcxEjoSX5mXFj+CINBuwXNafuVxmybyWr
         TBUG0n/Yks2eK5nGpN7QQG5nHUTi/FfPwK5UQhI5M5awn2+ik0/dRm2cKVPPAJYaC7zd
         DQdLYU5I6ghXVfK5F5GwiwsYyp2aCO2yoy3zYzB2E3nIhyWkw37WRo8a2aTGm6Jplho0
         lYIw==
X-Forwarded-Encrypted: i=1; AFNElJ8hV6yx8nEKFGwJmItgOYzpaMOnS4/jtEvw0G0dX9cKJ5xHJ6ugZXxbkW0XP0140bopMmXDOXSpcUZO@vger.kernel.org
X-Gm-Message-State: AOJu0YwvGRK5vCws4j/a2LsSSPcMuMWe2sMyIeOx1XXQRB+A6/K+lc/L
	pyXBBsGrLpVcA3w9gjij6HcreaPvcRSFca6kiI3DoQd3LwJGhAFI1g+f
X-Gm-Gg: Acq92OEc8TxTYAa270YtxCPTNhf55aXSP6jazLMR7CuFAflTabBop2lr7q5XJLVvbr5
	SqF+aJFwHWQISsN+qNuJ3yGy6hX+MsgBeL6jKKDFWP5VNONjq8QbKn4J8SXJIsuDFppIRFDvMzh
	z0wUYUVHcjglPWOwZg5Z/8YTs05klzSQoODopTaYtyFlYFVZBoKUhPZNAY/PaHwYvq0RuzT9+LQ
	y7CRpxUnJcdlsS4Yh2xFi3cLF2gG7T4f0JkBmsZz0tiqDrVuu7XSoXajgPf1QVNiWu2H2D40fwT
	YlzrfqgYgSbsgDi8O1h5nhLNGTJ5QpkDOE+L/jlhP7iNvwOTepq5ou4m/7qLdZMc7uYB8+iMw/E
	9kWSVuV8osmm9DRTud0ry637yICMyalcN8ggZDXhD5vCpSsayGAcZDER1hz0HYsoYz5oZlu9/2e
	RHfWRjnLkt0WaxzrJFXsDdVczX613Uwa+56IllZTYW5NuyBvv9Aw==
X-Received: by 2002:a05:6a00:2d25:b0:82f:5051:f024 with SMTP id d2e1a72fcca58-8415f5dcc6fmr10442376b3a.27.1779637814974;
        Sun, 24 May 2026 08:50:14 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a5f:4fa1:cc65:18c0:209b:38a4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ac9b74sm6997716b3a.3.2026.05.24.08.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 08:50:14 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: gpio: meson-axg: Fix whitespace issue
Date: Sun, 24 May 2026 23:49:53 +0800
Message-ID: <20260524154954.385778-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37418-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,baylibre.com,googlemail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 084CA5C2FEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Clean up whitespace misalignment in meson-axg-gpio.h

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 include/dt-bindings/gpio/meson-axg-gpio.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/dt-bindings/gpio/meson-axg-gpio.h b/include/dt-bindings/gpio/meson-axg-gpio.h
index 25bb1fffa97a..a0d42bcd9bd3 100644
--- a/include/dt-bindings/gpio/meson-axg-gpio.h
+++ b/include/dt-bindings/gpio/meson-axg-gpio.h
@@ -23,7 +23,7 @@
 #define GPIOAO_11	11
 #define GPIOAO_12	12
 #define GPIOAO_13	13
-#define GPIO_TEST_N 14
+#define GPIO_TEST_N	14
 
 /* Second GPIO chip */
 #define GPIOZ_0		0
@@ -52,7 +52,7 @@
 #define BOOT_12		23
 #define BOOT_13		24
 #define BOOT_14		25
-#define GPIOA_0	    26
+#define GPIOA_0		26
 #define GPIOA_1		27
 #define GPIOA_2		28
 #define GPIOA_3		29
-- 
2.54.0


