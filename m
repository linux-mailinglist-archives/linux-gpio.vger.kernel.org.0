Return-Path: <linux-gpio+bounces-29861-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C193DCDA89C
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 21:35:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A20C030AA940
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 20:32:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAB553590D9;
	Tue, 23 Dec 2025 20:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="tqNu0iNX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930563590B3
	for <linux-gpio@vger.kernel.org>; Tue, 23 Dec 2025 20:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521306; cv=none; b=ncCd3ZCuwwfq1O0wbwhALUZ9Tq0gn3wTMoI2j0RMIAqY6ferdRC4D7Ueh1viiYZ3bil2/5rkEhuzWSSltdlD5y3y5tnfR2hEOIhNE0EcIuYPJEibWmDN5B2ajmf9gTPrDD5MCEWkRePQbu17eA2r3us7q5LlbqKwZ9lYyKzsjTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521306; c=relaxed/simple;
	bh=XoF0Eovrxm1txLTrLfP7MB7ayo4/Y25gdep/95xkk5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FU2IzPNR7ZbDuTKXj6cy1fZtBDxHHe2JJySBYfBndPzdyp646QjELWbhL2nTCuvV62ixUW3Oj1Q7myRqAQlIdqDZPkLHzdYQhdw7aYd61H207ZlPxPskonenMryRDY0+pXemudZ4VDdMghafuQ6YQKBEk/xKnSetgkbtEKqpdDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=tqNu0iNX; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso5383500b3a.3
        for <linux-gpio@vger.kernel.org>; Tue, 23 Dec 2025 12:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521304; x=1767126104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfMU7MT4/V4GUajmsYnn75DFErJTnupop06HbanZvHw=;
        b=tqNu0iNX/T8f4ZQ0j/Yobjqpzb43xMAQ24m5BfCOWvdzq3IHmLjeqTBOAgIiE7d5S2
         N5fBPe5y3gl9uLYGhAi4647HW/5fN5LATqcvMhv8qLSObvDo519o4bPtPTd0HcrOtJNL
         +yrIM8SMF0AMAun4zHRZJCoFTQvESD1JZ71NTG7XBB+JBmw6GT/ko8ZiqfMcvI7AT3/T
         fYOEil8UzahtCc/HfhugBjuEHq4Pcujmr1Visr30t0FPiD0JQG5z8cnjJpuD0T4CGuh4
         AzOo/BgdB+0KcAyjo3REQrPASQFRboUdXtpZEUsvwTEelTK2a6yQ1+FXxnZACDRLKtDD
         LFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521304; x=1767126104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qfMU7MT4/V4GUajmsYnn75DFErJTnupop06HbanZvHw=;
        b=BbRaG52w5EmFtUSEIl/8Z0tbyrHs0wirGLIsB6c3hIz61yCqRH0IO2JboMX9WVC+vr
         +EXkJwVGQ9HV9sqPGPShmFvXZy1LTvk2aIKmY2gpauP7OiEJ+woCCxN4u2SyPYdOMIG/
         SMvqIDbrK6IFfyAeZ0zG5eXCJ6I60oXAcgAv71ll9dRU/S8IxenWDQRhOMr5SFcDnJM7
         knwgFucLzDBkAM8a+3mtac9fjTeU0EZtDV05knI6L/8khs62kdJZiSssDnNPIDQ39zBM
         oUKd3kMzsDaUh9M/oZxTiCw/COIZsu6t6WTFygGzaOwdx7JRcMvn+w/aMRruSBUKCvCO
         VFvQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7qzB5/6JsRXoIi6oixBofg+8v9RsWvVX5sZemaExwORXhOGZkMS8Eh5Utl3loJ3MNX0pnBlicfxdF@vger.kernel.org
X-Gm-Message-State: AOJu0YwO/ocB+BHRAElvUHNPyrOT/c/dCpw3Pbzi+9KZHxZCaKE49qX8
	BKW1xykqsyYeOBQdxIRcdk8Mi+oJuCW01+yZ5+cD2QlniEFQ2winTEHz55+riaKwTg8=
X-Gm-Gg: AY/fxX4ctzrbNUF5KW4G2pyoGzCMCmaw79+YoaRT+1LCFZLMBMWyDUHa9Vuzq+pg1yx
	k5mDS7hkCHdfc3P/pJnMPO7hhaOeoSJ3ulSol1+g7Va+RD4+NXgr9J3S8Mo892cxKt4Pr6jFg5D
	mXp8S4Mv0FeEQm0xHnUy0cgJvJzuiKdnSBFCzGPCBSsAvutJf0cFE71qafDLrji1UwxpbP/E9S8
	5e9kPmkDiGc0WbsC4NrQGeQw0pFsIvS5SHg4uQHb9TG/tZ5XXHKqus17L4c0TOeQr+ojYLT5jSd
	E4g/Sdd38QuunCbwzGlFJkPUFyJx7SjeLVV1ZlG5o7uGpZSMiY9boF3pmhYVJFREh80zURpEi+F
	lJ9YMKE6wYfogEa2+Qw7xzgvZ+9sw+iDakcSA16KK4cR7gFOdsBqRM11dyJ/gN3S7rBgh0vut2w
	DSxb7CsfZYS3+qkktKXx7jFiBs5HCGwSSteWTWFtxkqQLt8w5gcJuHNDTJhkaQQN2ZHVBwMFy2p
	h3Y2f30
X-Google-Smtp-Source: AGHT+IFrLV1OA+vGIt1Qeh3SInjG9m4lWsVJ7UMsa9ff7itN29HXneV9Wlv0pR5HcnrOBgJnEjlG2A==
X-Received: by 2002:a05:6a20:9392:b0:364:14f3:22a7 with SMTP id adf61e73a8af0-376a9de5935mr12020799637.42.1766521304022;
        Tue, 23 Dec 2025 12:21:44 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:21:43 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linusw@kernel.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	olivia@selenic.com,
	radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	broonie@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	lars.povlsen@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v3 14/15] dt-bindings: arm: AT91: document EV23X71A board
Date: Tue, 23 Dec 2025 21:16:25 +0100
Message-ID: <20251223201921.1332786-15-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223201921.1332786-1-robert.marko@sartura.hr>
References: <20251223201921.1332786-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Microchip EV23X71A board is an LAN9696 based evaluation board.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 Documentation/devicetree/bindings/arm/atmel-at91.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
index 3a34b7a2e8d4..b0065e2f3713 100644
--- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
+++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
@@ -241,6 +241,12 @@ properties:
           - const: microchip,lan9668
           - const: microchip,lan966
 
+      - description: Microchip LAN9696 EV23X71A Evaluation Board
+        items:
+          - const: microchip,ev23x71a
+          - const: microchip,lan9696
+          - const: microchip,lan9691
+
       - description: Kontron KSwitch D10 MMT series
         items:
           - enum:
-- 
2.52.0


