Return-Path: <linux-gpio+bounces-29993-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C8ECE7D9F
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Dec 2025 19:42:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5352C3005022
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Dec 2025 18:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B6733CE9B;
	Mon, 29 Dec 2025 18:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="LyRSbbrq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247C933BBAF
	for <linux-gpio@vger.kernel.org>; Mon, 29 Dec 2025 18:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767033638; cv=none; b=HE3xwWYbrkgRM4GrL7aQnJ0qFdEW44um1fTazQAjdkkpnlkyPqoFjyyhFrKb+i0o1yJtAk1tMcDOcxjTIHd1oSh89/BH3RRD2JEMyJ6LwI9ZCQGKgFYgxQqGTSnqyH6/cP7ESIdAQlP2MVgvvzR14RMVg5EcJdfUOTJPAn6I5TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767033638; c=relaxed/simple;
	bh=Q1obzpbb74AZt0ukfBT7/Xcte4bERP/uv0lOi/h0us8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u6WP/2VowfyLdBxsL5xEtetv4KBOf4NCsHTw136kA9l1oXeF/NxUtJrjLGTeQHx3diexkgJ5/YlrhF6mYDkBH8B9zGdXi2wHdbPXfgVKg34Pt6jQFSpz3oNmS3sMb2dTwlz8jGKcMPJHfuZ5yx5MKy0eYj090QwfHGFHwu13KD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=LyRSbbrq; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so68343735e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 29 Dec 2025 10:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1767033634; x=1767638434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fD3TOo20gfVbUTTrRVEjhVDMuAvx6I5y/UndE2JGgIM=;
        b=LyRSbbrqhsYCVMar6TnbNq5OwUK6vM5vLOubw24DS+DHtGNV+bJd9Ws4YLFLcIaAk7
         HWPCtBIRseMv3/cnK5UmboWJt/jYxd0RuJWmcbt2Yc58+DpXPQwFcYmx5ERXgyz/VGnj
         V9qPrIkX8CwYabWmv/ku38VSqUqR3RGC4o789At+xV4gIlr9J+R+B5MA6mEnjByrB5D9
         6AGB6F9TcKy1iuVMGebdlKSCHbuE+vyg+Q01p4WIc/CbgEApewqay4CiCCRYEI2Eypo0
         a4p8Uo/of/KtQ63rWWRF9/G+a3GHxhBtDB30wW9cC//iynv4tt2gWEPfDR5IAzePQaxD
         wR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033634; x=1767638434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fD3TOo20gfVbUTTrRVEjhVDMuAvx6I5y/UndE2JGgIM=;
        b=fPFE7g5f/KfkF1KSgTlAF1pItWBgvpdXnbEoejOBhgQ4IsLNiNXpUsSZQhuRHtmpJ0
         z27ouptAePUgkLj4m0AjQjpwd/otQTFyOBwBB2vbeOe+3SybbK85+zU3BArs/fkYsvtd
         12Sea3vTxv3nBNHmyL2dZquwmwaZIS9odlzeSw/ZrvxwJv5AHMJdD3LN+9QYiHdPy+4T
         /J4BJAGD5YmbIXGFyrbWKs3cXfU1ByWhgKIk6HI0zhlBjzE+w+sYRENxvMIEOMeT+bLs
         fJkJHWz+GymSwBzQ3BokdlDy6l8G6I8oGPTxfbhQvuYobOEREROGHU6l1JhYRxK9ib9s
         2y6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWR0Ej9s82Y3Kgwj2+vJuXooeVYO9o2qJDVSFwQyQ7TFUyhghp1a0yL0tWdQmG9lCVIoRZPbmtX4Qs3@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxk/IZ31Bhr1JwElyGSlUhmWrJj4HBWAYYtAiCxeTk41VbwFct
	sBaLkFcbQ/PDC2it7lhdBTyFiRmrR5wwymcDiwNjyzwzsyuLvUF2A/lXr4+nnEFMMg0=
X-Gm-Gg: AY/fxX71/gpXEye/MDNGeZoqYtHPR3atCiidmbU+j4lqhxZmQ+XQv7Su7LUvKgW1EoS
	C1NmlZJeep7veFgy6gR+sp/AAR+/vCOCQlsnhF3gnk0p8PlffzA8eC0ExjphOS1hGTy5jt2aK6R
	Q51kXNLe6vK7XNTkpUS4CytNl/+VsGfVCl6gefzSSDCfrY6kUrb6kUlbFX6vQSb2M0oE95oa/OS
	BQJ7yk5GumJqZxQrB/13caTFBlm6eJQxZmwIHoB3F5Aa9jQRcvc72MrYIxkyDlM1pKZ2Ltelyld
	zrBs3/goOIKiOBM+3JQ/TYg1ncAvxXuGaf6lruzq28tVCivj3Nv3Tc9fWVVV0D9R9TmCtOgsA6q
	MYQ58BG9aFygOhWYebDutEbXQsSshTK/M5Ivk7eqj8oittAOknNH+HA1osZuYgvQzHPSG6wqZiT
	46IzlfSxnPzRtYLNWV558NgZsspNgkM/x60IR34F7WNrfdoyEoCiOSvncH34cB9dyInsDchMm7B
	lIA/7dPqF8c1uGlCIu91uiMoTWm
X-Google-Smtp-Source: AGHT+IEOW1WMqA9XyyxJdu/NN+RbiiVAdkX9+5SQ+X2Sm6Ndg4Ati/iuxawV+Wvcj48RXpcfvKGVGw==
X-Received: by 2002:a05:600c:c115:b0:47d:3ead:7439 with SMTP id 5b1f17b1804b1-47d3ead7574mr139091495e9.37.1767033634253;
        Mon, 29 Dec 2025 10:40:34 -0800 (PST)
Received: from fedora (cpezg-94-253-146-116-cbl.xnet.hr. [94.253.146.116])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm604907455e9.12.2025.12.29.10.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:40:33 -0800 (PST)
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
	linux-usb@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 11/15] dt-bindings: pinctrl: pinctrl-microchip-sgpio: add LAN969x
Date: Mon, 29 Dec 2025 19:37:52 +0100
Message-ID: <20251229184004.571837-12-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229184004.571837-1-robert.marko@sartura.hr>
References: <20251229184004.571837-1-robert.marko@sartura.hr>
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
---
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


