Return-Path: <linux-gpio+bounces-29859-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E87C2CDA860
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 21:33:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A105306984D
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 20:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D3E3570AF;
	Tue, 23 Dec 2025 20:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="vAEdXO3r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA3E3570A3
	for <linux-gpio@vger.kernel.org>; Tue, 23 Dec 2025 20:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521290; cv=none; b=gwG/Ih5wF2OQIKosXNX6SVAV9wjmAQ2KOvIk98SOi1IInvzSFFbqEUaSfsCd758xx+i0KnR5YU3vV6W6cjuhK6SUO97aye9wTnpB8CaEtksoVdTc8885a3/Tec7m/HMKQpViNnub9mMrtT53Xkw31APQRSbNxeAeyefvNGTEwHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521290; c=relaxed/simple;
	bh=Q1obzpbb74AZt0ukfBT7/Xcte4bERP/uv0lOi/h0us8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ixlFSzOmDXPI571CrLoKatWPm7s0DljkaAByw1S7T1+pgcrKXFQjwzQDGp/BeOvkwjTPac1mFBaKFuHXEZj7INEhoU9yy2LpzgMR6mP7h8rFqvq/jNdmT7d6IwA/6V1s95OVq/buMU6Sz6VHtOemswD4Ns0Y2eCcNpIQaceLO58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=vAEdXO3r; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so5324528b3a.2
        for <linux-gpio@vger.kernel.org>; Tue, 23 Dec 2025 12:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521286; x=1767126086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fD3TOo20gfVbUTTrRVEjhVDMuAvx6I5y/UndE2JGgIM=;
        b=vAEdXO3ra/1bm20X8T+iXv1DGUZqKx6guXdgGYlEe09deRwfl5bXIa86Eb9PSV+d1g
         89yhFC4l5+p3HDHL9B4t3HraCiFP2Abre+g5OOymalREUL4ViCVjaMatLcQOi73KgoaO
         su9Z87NmLUKhMW1Z4N3LrDbyJ/2M/2Y3Ff4tCAv8WODcWixujph097B2TZm09bAiaL+z
         5RusNCbtacBZhsJzqltsEvBQ/ROehlt9LNDXxG8a0iqZnYUEOZo/smkMaGNsonZqVIvW
         oB5htBh9H/x4y6/cNqzQFEF9xiV9o1T5FsZ+snE4miTlvCzGO78Af/4SYd4c74sDMOq0
         AwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521286; x=1767126086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fD3TOo20gfVbUTTrRVEjhVDMuAvx6I5y/UndE2JGgIM=;
        b=ZXeh0jnoWaXB7iZTs4tv5PwGgSgxiIsEYlO+wELNRYVk49K6c92QUbqrLHrGzW22Ky
         S6iCNWK2u8UwmoyKJil/Xci7CQ2ZA/R8F/wdCe+u/vuVmPMJsJ0j8rBy3PfPM3woXs74
         +5BuasDI60q44LX58fvggM828cdLvHBmQnaPgQoNccevrKa4JiBhmpZ6Mv3ZHScaKBbc
         4ZtJB385UppIrBTcff0qXHlS4OdtShAmPvsq3XaXD4laVVLTuor/cWF7Je8VeVz+Xx/o
         N5os8onNL6i8ehyG/kg0FHGb3GvszuOTEDs9x2Hrn30BJUrXynBDsiYss9aFyotv8CIG
         GkTA==
X-Forwarded-Encrypted: i=1; AJvYcCV5DDmlkQK7Nwa4ujLwo8kraLas7ILuZapN+mRzrvR3GwRMPT4idIi61hobFhntsdRKJaVFEA9yj29B@vger.kernel.org
X-Gm-Message-State: AOJu0YxImhB/dHBc5ehpOnifZNX5u0UdAjMzHRUiFLQcSjpJutxkfdMh
	OmIrD0K8wOH75Y2fNSKXzOtlJPkw+txEeszZQg+n1/+cTlAsShXwtoUuNVgEqRAgWps=
X-Gm-Gg: AY/fxX5sDdND4rGLKynJd6BG+8JEindGiE+3esMywAnfuagZaJ216h6+kCd/jqPOIWV
	lrQLSqlXBRvUPxgQUSebiM/vCpDL2GQezPEkAUimyRut3ibAOYedpF5E7PR10x9cUrU5rGt/gkO
	bynlNViY0T4A9rLmNWZ2y48Sd/UnV64qp9WsuoLnjBKQfZj0dfkTQWgsUYNF9nsYH/6zx1ICjwr
	5cu2+SAe7xqHpXSDvNNuhyr01zbSesaJb81UmtoqFGLNM6CogOgksXYSF1NyONid9waPpBx1jC1
	3EXYOS2r7d0Ak++wrF+Kq91DtySUzS8Z7RZpUOWzvAdSSOYXfZTTqG24u5r4Cbm1ReTg3O0Sp73
	lqRAF4gGwUXmhfQZjK+aOIUvBMmRVz+qrrxz5VahRbE3rRFPIcFxtxhmew22lQUURKQxL1Y+qsa
	1K6KdgQvvn7H4y+bMRrkd4NzB6N8+nhJPUquKekW5BPvNtKFpNGizDL3DeMFxiI/9UU0JYYGr5C
	xxlm+TX6k9ISj7xAyg=
X-Google-Smtp-Source: AGHT+IGKTAqrl4PGe4SFW7qu0192lJdQVYEzpdtaZXHZbcUYB4ioIiqnmVp7I/qce4lXwOMNJA61Eg==
X-Received: by 2002:a05:6a20:e293:b0:341:d5f3:f1ac with SMTP id adf61e73a8af0-376a9de5b1fmr15092285637.41.1766521286558;
        Tue, 23 Dec 2025 12:21:26 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:21:26 -0800 (PST)
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
	Robert Marko <robert.marko@sartura.hr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 12/15] dt-bindings: pinctrl: pinctrl-microchip-sgpio: add LAN969x
Date: Tue, 23 Dec 2025 21:16:23 +0100
Message-ID: <20251223201921.1332786-13-robert.marko@sartura.hr>
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


