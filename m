Return-Path: <linux-gpio+bounces-30597-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9216AD243EA
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 12:43:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 588323021957
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 11:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C5137FF73;
	Thu, 15 Jan 2026 11:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="HH1xjzbj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E73537C0FD
	for <linux-gpio@vger.kernel.org>; Thu, 15 Jan 2026 11:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768477290; cv=none; b=t6DGPPULRC+cam7+gKazRp3xWomv/Ox/8D4Eu+epO084cy1pASCICqh/pCClV1YO8bFOO2zCoPA/AQYfpLACj3AF3zvnQQ/5wwadOkzApr0b82RDpLiYaRBXz7yHxyfzAP/SQmrR+rulhe7a3Vr1XPFW1/a+pRTYV10HUzz5a5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768477290; c=relaxed/simple;
	bh=93VOl//T1710gnGzUbrxwFAJf93hjOVK3YA9kMeokWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xv7FZGaJ+3seGGpbF6OOXcil7RMh8xT7FEE1Asx4kWZ6tgFav1KyI4TwjTauu41NU10BtZFtZrnMRZi1AAHW85mNAmdFXJJnr0WWBLwUJCL66lHoRY+8uaHXwNUIPrwnu6v73F5nQ2y5FBUADqtDGgaft9EYeLHTxELPg+Y/WGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=HH1xjzbj; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1233c155a42so926009c88.1
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jan 2026 03:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1768477286; x=1769082086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9HFCj5ztGvyCwGgMLXoFCMYjN9FIM/YL2Od2IwlkeWA=;
        b=HH1xjzbjFzEvFTuYaEQ5nW7+KnA4ufCUvTIGdO29F+2BByw6owFoSV5LFqgnJqmNP+
         PzIW/fii97DhSeFAVfcwYuCOKxpaYUsHwiQxuv+UoIrs9wLZiWaLsyIRlMwIarYpuXae
         c/whJBTFucAhJaV2k4amzhKN0SdMGQR3+1hRKwV96f5MKZPVhJGTk7oQu+n3IXxG74+x
         fP/OpGTKm5VSFF8Z0q3KjOfyokSoN65OXNkmggxmxdvt6HdVfaaiV0rPoB7Z+fuuUPNo
         S/eBQHnZ3qh9P/HhTViiSs9a3tqqOd1iDTGx7bUjTM6hGqdbtwlg95BySgWqt9GcdjNN
         kbFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768477286; x=1769082086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9HFCj5ztGvyCwGgMLXoFCMYjN9FIM/YL2Od2IwlkeWA=;
        b=jxjbxjcPtQ7lHyaFld5aSee6FOyQydmdvjR+FOeP+otq7mdayGK/UoFRB4DOY5G/J1
         wcSXfr06+A4It2lOq2C91dZgGyqGj/gmG9Q5YmOWfv1vXhrGxUvfobmFgv5RkfMiAyec
         kyQlDgtXCOVf4G8rq/wV0UeeV3/31hzB/9YepPSYf+Zekw1voBlg3p9Fz3eFo0xY8zbW
         EZSWQOwALKX4Zz3eR1wU/ExTiZiEv24J8Sd0ZuEKJErxbCuZWSaly9FA5wLiwrzM1Jvt
         B30Se2zm/q2slfrWKz0YjPeu3Jz3gVQUW0woU6e42rXzMRakQKdRmau8i3KpznlPzuFk
         4RlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAV9YDZmZJSJBUVO+nC3/+TteckFBgoDodZ9mMpTaszrVTmUI2CJXb80Vkg9H5lHCWJ0JJeSX4TjgC@vger.kernel.org
X-Gm-Message-State: AOJu0YwRiDJ3U2f52YSn1UktiU17XpqZPC2fICV4knWeMBIbjcy0ln+Y
	WxVTaOyxbUCLyv6vBST2jHTk9DiXTwwoOPoyTshbZL3hUCQmoyzcCZcjem1sbbrXG/A=
X-Gm-Gg: AY/fxX49DtsPXe6vdjAcJk0ASB393eM7GuB2bP5rX4+w5TmTAgyCio8WVsIxAxbf1xm
	Sz+daG/WHb6STugY+Du8sXeMkPsbj9CtDYn1UrAHA/ePP+K7AAKtolk6FJRpiEw+Wr5+HQONPHF
	B7kFy3O0S/DSmxL3g/ggMNH/JWZmV+pBZRRieY0LE/hJd24mJuzGyFawt2wl5F1AM2qnthbi9WH
	f8mR/c9RXfYFQOJ+T2AGnUEMYwTG8xT3xmsXxx+s4mw5Y9WGL8pxDx8v/0FZluLdos5/4k2bzpJ
	ViuxR/mFOeBDkA546uVhVwqHWcSsHOF6tgRF8rueGLbA1BbMqAnZgk/REnSZ8BRAquATYYaAtT7
	qG5H6OkWBjHp/oM76Xzh+7B+oB3b6dXwPXR8Cb+PabWgLc+80w1KNsWnzHkAb58M/0pDHFInBAz
	pNui/3z6MQU+PLMzyVd4XcHoENfXzUXGoPulVuPVa2Mk1R8ceTvZq8TZ6f7/2EjPeJSWUxJfuIX
	kTNQu9B
X-Received: by 2002:a05:7022:1719:b0:123:35c4:f39c with SMTP id a92af1059eb24-12336a67900mr5434114c88.26.1768477286121;
        Thu, 15 Jan 2026 03:41:26 -0800 (PST)
Received: from fedora (dh207-14-52.xnet.hr. [88.207.14.52])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-123370a051esm4875347c88.15.2026.01.15.03.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 03:41:25 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	linusw@kernel.org,
	olivia@selenic.com,
	richard.genoud@bootlin.com,
	radu_nicolae.pirea@upb.ro,
	gregkh@linuxfoundation.org,
	richardcochran@gmail.com,
	horatiu.vultur@microchip.com,
	Ryan.Wanner@microchip.com,
	tudor.ambarus@linaro.org,
	kavyasree.kotagiri@microchip.com,
	lars.povlsen@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 06/11] dt-bindings: pinctrl: pinctrl-microchip-sgpio: add LAN969x
Date: Thu, 15 Jan 2026 12:37:31 +0100
Message-ID: <20260115114021.111324-7-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115114021.111324-1-robert.marko@sartura.hr>
References: <20260115114021.111324-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document LAN969x compatibles for SGPIO.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
Changes in v5:
* Pick Reviewed-by from Claudiu

Changes in v3:
* Pick Acked-by from Conor

 .../pinctrl/microchip,sparx5-sgpio.yaml       | 20 ++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
index fa47732d7cef..9fbbafcdc063 100644
--- a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
@@ -21,10 +21,15 @@ properties:
     pattern: '^gpio@[0-9a-f]+$'
 
   compatible:
-    enum:
-      - microchip,sparx5-sgpio
-      - mscc,ocelot-sgpio
-      - mscc,luton-sgpio
+    oneOf:
+      - enum:
+          - microchip,sparx5-sgpio
+          - mscc,ocelot-sgpio
+          - mscc,luton-sgpio
+      - items:
+          - enum:
+              - microchip,lan9691-sgpio
+          - const: microchip,sparx5-sgpio
 
   '#address-cells':
     const: 1
@@ -80,7 +85,12 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: microchip,sparx5-sgpio-bank
+        oneOf:
+          - items:
+              - enum:
+                  - microchip,lan9691-sgpio-bank
+              - const: microchip,sparx5-sgpio-bank
+          - const: microchip,sparx5-sgpio-bank
 
       reg:
         description: |
-- 
2.52.0


