Return-Path: <linux-gpio+bounces-1162-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B75F980B7D4
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Dec 2023 00:32:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB9841C20849
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Dec 2023 23:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20837249EC;
	Sat,  9 Dec 2023 23:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o31ziQaa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4EDD171F
	for <linux-gpio@vger.kernel.org>; Sat,  9 Dec 2023 15:31:28 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40b5155e154so40171325e9.3
        for <linux-gpio@vger.kernel.org>; Sat, 09 Dec 2023 15:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702164687; x=1702769487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vCEASn12FKDQVcaKLklq1cpwGIzIXESUDgNj0x2vEcU=;
        b=o31ziQaax9WtDZpcgLnalu6/aAytWBWPC8nYIkStzbWCz/szO9QQYTuR6RHk2VHpyE
         0C8QLCmc94LQfqMaQJFecyWS4o/vEBreNcm89n50cQanj91BkGH5jjhzCTEVp06TqgDx
         1rbkMKkJ0+/PjkC69/3L1BH+77rWctMi0Dm75MLuDvEvsGtc/q7psqUWxOaZ5hZBSJjP
         ohum3umMXdgrQqxLoKC7YFoHgYP59gVHk567WYEM9L31uJ4GVVv49E0W6PVxuUlUprYp
         530vDO+02+i8zpjg/U/RqviR0oibx2LMTHgHBPgATC4plikqs1FEYeHbuCLneVy7tqzh
         z6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702164687; x=1702769487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vCEASn12FKDQVcaKLklq1cpwGIzIXESUDgNj0x2vEcU=;
        b=EwRx9xgrCM0iQ946QDM58IUqZ7moculI1yPyJcLiVUW/jHITw+fEEgn+5yqheNkVgm
         WQXqIxgorKDhZK1orDsp0zTA38hGehlHoOc+8OND4q5dyQUrSOKe/V3SfORrrSrfGl4l
         Ju6VZvClFOHrXrGOwgaTOME+iTGu2B7MNsVBgRoj61CAb14uf95HTGoxo3HAYr3xAkOi
         Vkq2UqIWOTd7g6Kbf3+45YmMeLCtcBs5oqIYpKBoqQ/RtUty7m7a/TwbYaJbi4CoWl7G
         lUvMdtf/VWEt9nMYDfXZJ1HlzwgYvxCO3bk/ODy6cGRW4eB4jTeBj17hQkkHUaYNjVR2
         m2dg==
X-Gm-Message-State: AOJu0Ywz5pGsOuZ+6plc+2haqhxQLrCCmslrHBX0nsFqpKIgYM7lq/HR
	EzUR/DRmWPH7980xFoCjI5fykA==
X-Google-Smtp-Source: AGHT+IG9NFKYIPe5rKKomdvC+9wrGq3Vso9mHxrAoxj4nIc2vgbE3n1FjmhUM1gg4j+WKaynUva5/w==
X-Received: by 2002:a7b:ce88:0:b0:408:434c:dae7 with SMTP id q8-20020a7bce88000000b00408434cdae7mr1035594wmj.2.1702164687340;
        Sat, 09 Dec 2023 15:31:27 -0800 (PST)
Received: from gpeter-l.lan (host-92-23-61-173.as13285.net. [92.23.61.173])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c4f8900b0040c41846923sm1875277wmq.26.2023.12.09.15.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 15:31:26 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com
Cc: peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel-team@android.com,
	linux-serial@vger.kernel.org
Subject: [PATCH v6 09/20] dt-bindings: serial: samsung: Make samsung,uart-fifosize a required property
Date: Sat,  9 Dec 2023 23:30:55 +0000
Message-ID: <20231209233106.147416-10-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231209233106.147416-1-peter.griffin@linaro.org>
References: <20231209233106.147416-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Specifying samsung,uart-fifosize in both DT and driver static data is error
prone and relies on driver probe order and dt aliases to be correct.

Additionally on many Exynos platforms these are (USI) universal serial
interfaces which can be uart, spi or i2c, so it can change per board.

For google,gs101-uart make samsung,uart-fifosize a required property.
For this platform fifosize now *only* comes from DT.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../devicetree/bindings/serial/samsung_uart.yaml       | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index ccc3626779d9..65d5d361e8f4 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -133,6 +133,16 @@ allOf:
             - const: uart
             - const: clk_uart_baud0
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - google,gs101-uart
+    then:
+      required:
+        - samsung,uart-fifosize
+
 unevaluatedProperties: false
 
 examples:
-- 
2.43.0.472.g3155946c3a-goog


