Return-Path: <linux-gpio+bounces-33235-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEdvK3F/sml2NAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33235-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 09:55:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC9426F3C0
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 09:55:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34A0F313EFC4
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 08:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C411538BF67;
	Thu, 12 Mar 2026 08:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dxt0djq5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DE438B13B
	for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 08:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773305617; cv=none; b=DHTar8YsgoSGp50MQousBfCMH1YTtfn+m6+/iSfHJBLdfhvX/HOLVNqS4jSwpDJE9FD4SbPGztAlGLM/Wk/aQtN1Tpb9b35ACjkHcXctb7geCcoR0RP6SiD33fPEqy5vrbe0eOa4ws5S1GLQnB3uGq+kNopLyv9tlvqZXkhtkCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773305617; c=relaxed/simple;
	bh=W5y1CEZ8x3weotGzpcVAX62nHF7LuH3mbybRf8eZOjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=umOGBC0ssv9BgRxajCOiFFhchesfEnwbaI8/ms8YHYd1jhW2VH+Webgwk6j7mGNXhPFldk3vOxbq8QN6S9MZ0Q+6ERwFS46BwnuIpda9GwI9m9/7i8tPhywWnw9V5enzodR5C3/NeoYSPq7269eCnuSVuz+Mn5/thDQIhjqIazo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dxt0djq5; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4327790c4e9so572261f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 01:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773305614; x=1773910414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9h3ep8VhznVsw3SqQhxmTvwP9SBQRNbuVaMM8ratic=;
        b=dxt0djq5Si7/svubjp2K5r70eANWE7Ywu9V+qI0WQ55DtsX4d3zw0MPmlWQSRFNLkQ
         9r9JKi9esaHXp2sJDClQJgcdNW85ZMK6G0md2nN1v5eTUJkA7C9wm2+FZ0uokssUVhjd
         Jq5nRaCRpWEjWji8FT2VvqZiHMFfX4/pBy/MiVFa9D3hyk0KziU6vZ9JrifbNhz8bIJ2
         fhZzxddGA+bJEYnNPC6pHOr0zEL4HAW4PRT4RsuPuTWLNmipeQxPN0d5ozF+AvCOJQzx
         gwb/54h+qc4qFyFMgUs8rhkP2R6KJ10k3mkxxLuWVBBCrk2hZa3yFxT3IsBatO4Uxc3S
         GIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773305614; x=1773910414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l9h3ep8VhznVsw3SqQhxmTvwP9SBQRNbuVaMM8ratic=;
        b=kWAp/5shDI8WXM5DVHbb8H1h2+9JYdu9V2CPcPbR1+Tr8qTbr2oWLPdNExCx3wmNPL
         nqrY+iqiWwn48TUIutqA3uXpQmqIs6qqf14rIkN+hBaFlu3oxKHXghpkucg1k+zhIODV
         PC5F3sUX680IRVE9wT7G/dJ5UqrtLvCL0d1J3lwyKXKw7HlI8D2DKCDforVOTiecHv5x
         WJnty9WfC7gxP57JylZDrmr0nbWWH5A+et+4vTRpGISiSpNCK6mqA7v75uE68T74wajp
         fJ741VImA+Jy+6HtKWu/foBCJ3CJdNI/mAYr7twqbrJk6E2u92jBjyZnHtA1BlOe0xAi
         l8vw==
X-Gm-Message-State: AOJu0Yyj6Hcyz3D0u//XiyN0MxA4jVQg83lN6/HEffzbMDkCbnr8ROmb
	B+tBxcAlk4QQvQtj6QZamJKChDn17rccF+4CaRXIw1cf6BM7/lKkkyWa
X-Gm-Gg: ATEYQzwbR2MxGMukUbdi0DT90Z6OSpYuuiXmF26nuU4Z3LiQphBbET1hBTo3MR5IPnY
	6bZfQbFxkdl2rHvJHLjhSKY21GkjMXGt9EKNF2VSlXh8YfLddSd4w2HLLrk7bXA5P0UCmc65aMv
	1uz9WBAvktJ3GyaQ4ScDPoe2e8zrwn4J0meJRGRHQukk9W65QHVuEE1cybakQNXyDNNW8MxK64G
	l583DdF+ie5kjxkynb8rEwtx07uCEd8UEfLU5DiF2XUcX26/sGLBgxkuDT4h9Jb/4clTmHgzHO9
	C7X7xYHzhCw7VLA5c3r48+PVmQ5FXDvLmK9M/LNIB7wJqipX/2lEEy6UsK4ig2aD9I9JjeSY9pX
	KkoK/P0XtExUqDlMoNCfB9vVJa7rSWmIdPeAcgOps5WkFJS9R1p974tWrzkn1wlNAGXudmRMC4l
	rt9QjpeTFRxi9ECiN5530UjnI=
X-Received: by 2002:a05:6000:381:b0:439:b2d9:cf35 with SMTP id ffacd0b85a97d-439f81dec1bmr10881977f8f.8.1773305613993;
        Thu, 12 Mar 2026 01:53:33 -0700 (PDT)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe226473sm5449162f8f.32.2026.03.12.01.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 01:53:33 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH v4 4/5] dt-bindings: mfd: max77620: document optional RTC address for MAX77663
Date: Thu, 12 Mar 2026 10:52:57 +0200
Message-ID: <20260312085258.11431-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260312085258.11431-1-clamor95@gmail.com>
References: <20260312085258.11431-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	URIBL_MULTI_FAIL(0.00)[sea.lore.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-33235-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com,samsung.com,bootlin.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0FC9426F3C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document an optional second I2C address for the MAX77663 PMIC's RTC
device, to be used if the MAX77663 RTC is located at a non-default I2C
address.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/mfd/maxim,max77620.yaml          | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77620.yaml b/Documentation/devicetree/bindings/mfd/maxim,max77620.yaml
index 85d7fe0f9f85..602711865274 100644
--- a/Documentation/devicetree/bindings/mfd/maxim,max77620.yaml
+++ b/Documentation/devicetree/bindings/mfd/maxim,max77620.yaml
@@ -17,7 +17,17 @@ properties:
       - maxim,max77663
 
   reg:
-    maxItems: 1
+    description:
+      Can contain an optional second I2C address pointing to the PMIC's
+      RTC device. If no RTC address is provided, a default address specific
+      to this PMIC will be used.
+    minItems: 1
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pmic
+      - const: rtc
 
   interrupts:
     maxItems: 1
@@ -192,6 +202,16 @@ allOf:
                 maxim,suspend-fps-time-period-us:
                   enum: [40, 80, 160, 320, 640, 1280, 2560, 5120]
 
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: maxim,max77663
+    then:
+      properties:
+        reg-names: false
+
 required:
   - compatible
   - reg
-- 
2.51.0


