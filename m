Return-Path: <linux-gpio+bounces-31267-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GimLzYke2nXBgIAu9opvQ
	(envelope-from <linux-gpio+bounces-31267-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 10:11:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6239CADF52
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 10:11:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B9E8130055AB
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 09:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B572A37C0E7;
	Thu, 29 Jan 2026 09:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GW1Ecmuk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C5327B50F
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 09:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769677874; cv=none; b=Oe0LqsUbOy1+M5AfRYIxXz/m8d2TlgrObfWBn0Z79keQGRY9925YYRYI7Q3IYqFqxNO87xE4KtVJ7JM9Nx6TyNLccv+/CTomt+wm1rJsf/Abm8/RzwoGwphai3JTlw9va4UaLuCGf3vPQ6i7pUsrkxP06XvJ7sa8hK29AAHwFaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769677874; c=relaxed/simple;
	bh=whCqMCitloN4wFu7Cr4vtyiSLqxphxXk2OMNZa0+7lw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CSHtR4LDN2NR6oTHvHtSzeYvwfO39HI8sohhDNH/seXwdOas5VSHECL2/0zIw2XDxuXoPQ2Nk8uiatyl1r46JHByg66eLZY5oL4Z4O8PixgeLWExjXyK8ghqGI4r6GEpfbcoFtB+uIzgK1d87kwsbhQXzJqSr0FCqtKfe590km0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GW1Ecmuk; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4806e0f6b69so5078405e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 01:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769677871; x=1770282671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLhqjdXh9Y6qAyHzZ9r5IyywkiPoN7iN9AMjJ8Bl+Nw=;
        b=GW1EcmukRParFNqhT8RDoGZefOnN2Cbe36mDf/ZZTlfMPQI20vtpE+BtzNN4q/9NHE
         GzRnpJRvl3e94jhHEezfwpCGnupBY4JYexP68NODVlOMgYWUAijfmuysJ475KC37nDRZ
         ljAMVos3VYx5jyGi01WC09BkbFBSX1kmStVEm7g+p7y0Yi7NJ4gfVRKOEch6HQ6bKmaM
         Y28N2vTvh+ULbrlNVlCa12SD1BS0tijhkjI60bHFk91pCj3gxBPckrmPPQFnmLxnAIRz
         cgqdCYB5Ek2gXr3TS8ui47eQGxor5CMiARMJFeS/fVZ1Fu4GMS0w/35QxXoUbByNf0ND
         /xZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769677871; x=1770282671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wLhqjdXh9Y6qAyHzZ9r5IyywkiPoN7iN9AMjJ8Bl+Nw=;
        b=CbdygnOR3nnsO1FkmieIso8JjGamTraS8hlovCAvTw83bEm8UQ0DrJx/Hn4x6ZDJWm
         dcHle+kRZgNuO7vyDHPdqkIsClB9zTn1jXNEOgSnp0DTwUUUDG0dZLnn8rW/JFupWiTw
         4pK4dbh7pnsB2wgae1haZ4sXgyYLT5PV71exM2pBcWcgZF5mdPRdZBULQNEv0qYhwdhD
         IbEbavNvoIgXXzlQiK2ZfwWel01qWOXfUbCtb9ACHViJC1MfH84hyEoCVIblRYxhmqVR
         8zQIvm/dUQwyZLJ8g7bc22Z3qg3ld+zyIjCXddGIqUYhr8sTCoQI93aBtbzpgPY4FztC
         m1dg==
X-Forwarded-Encrypted: i=1; AJvYcCX2j7vDnjiYTq4i8c3Zx7+XufOzQci8dNy4E9m7dhaZuU9MQwucUdfA+z9JCPCZ4Q3ohisSS5RVMboq@vger.kernel.org
X-Gm-Message-State: AOJu0YywhHZeD9bb4cIBEtYUjhbT9xvN+SNzb9AOyC7bNlj0rUsrPIan
	GjJCxkW4vM18OItbpZAssNtYSBp+dQvqJ5ngDJ3+zKzVTTroqIz9Ry6f
X-Gm-Gg: AZuq6aKbkzjTjFK+4aYxTVOzUP0TmB2CYEHA/MqkAPDIwwIsU26jkhuz9J8ptkwKWfh
	gaDIIbNiwPenk+78k28DeuTXZwIgwBFAwm0b8A9Gz+XUl0lwyG9vll73xyhQANwok8vluw70qmy
	beNz4n8QWY36KPg59aPDLEHs2vrjCT+hnoiLy4wTxC4kzADByPEjvuSDwmel1lLNPXP1PW+tyBC
	ofTKqa98MuWhyIKeNSuix+EgxbHcsYc2DYiKm/cJ2AmIWlTBrAcvGXD5rDpf5GP/F0SlfSDqcqP
	9Vdwze8FX6MPBdwryGYa+1uZ8CYwfA51c64bkFnP+OahwtYylRtBUoHC0TBQrm1VbZwHz8Fq7L2
	cdcw7PbAYKrxSTngyrmbTI1xVZsUePzsZn5XyJOc6CjsuyCmjIaO0eC2JitJAzSRBPyvcUXK+sw
	zrVMRT/G+thN8EtToD
X-Received: by 2002:a05:600c:154c:b0:475:de12:d3b5 with SMTP id 5b1f17b1804b1-48069c6136fmr86663635e9.34.1769677871157;
        Thu, 29 Jan 2026 01:11:11 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm175338875e9.2.2026.01.29.01.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 01:11:10 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 1/9] dt-bindings: pinctrl: renesas: Document reset-names
Date: Thu, 29 Jan 2026 09:10:52 +0000
Message-ID: <20260129091108.95277-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129091108.95277-1-biju.das.jz@bp.renesas.com>
References: <20260129091108.95277-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-31267-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.168.156.16:email,0.180.91.224:email,0.158.255.32:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,110a0000:email,renesas.com:email,bp.renesas.com:mid,0.158.216.16:email,0.168.77.240:email]
X-Rspamd-Queue-Id: 6239CADF52
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

All SoCs has multiple resets. Document reset-names property.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml   | 15 +++++++++++++++
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi        |  1 +
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi        |  1 +
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi        |  1 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi        |  1 +
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi        |  1 +
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi        |  1 +
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi        |  1 +
 8 files changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
index 00c05243b9a4..fbbba53cde9b 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
@@ -78,6 +78,16 @@ properties:
           - description: PFC main reset
           - description: Reset for the control register related to WDTUDFCA and WDTUDFFCM pins
 
+  reset-names:
+    oneOf:
+      - items:
+          - const: rstn
+          - const: port
+          - const: spare
+      - items:
+          - const: main
+          - const: error
+
 additionalProperties:
   anyOf:
     - type: object
@@ -152,10 +162,14 @@ allOf:
       properties:
         resets:
           maxItems: 2
+        reset-names:
+          maxItems: 2
     else:
       properties:
         resets:
           minItems: 3
+        reset-names:
+          maxItems: 3
 
 required:
   - compatible
@@ -187,6 +201,7 @@ examples:
             resets = <&cpg R9A07G044_GPIO_RSTN>,
                      <&cpg R9A07G044_GPIO_PORT_RESETN>,
                      <&cpg R9A07G044_GPIO_SPARE_RESETN>;
+            reset-names = "rstn", "port", "spare";
             power-domains = <&cpg>;
 
             scif0_pins: serial0 {
diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
index 593c66b27ad1..ded4f1f11d60 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
@@ -604,6 +604,7 @@ pinctrl: pinctrl@11030000 {
 			resets = <&cpg R9A07G043_GPIO_RSTN>,
 				 <&cpg R9A07G043_GPIO_PORT_RESETN>,
 				 <&cpg R9A07G043_GPIO_SPARE_RESETN>;
+			reset-names = "rstn", "port", "spare";
 		};
 
 		dmac: dma-controller@11820000 {
diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 29273da81995..cb0c9550aa03 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -1017,6 +1017,7 @@ pinctrl: pinctrl@11030000 {
 			resets = <&cpg R9A07G044_GPIO_RSTN>,
 				 <&cpg R9A07G044_GPIO_PORT_RESETN>,
 				 <&cpg R9A07G044_GPIO_SPARE_RESETN>;
+			reset-names = "rstn", "port", "spare";
 		};
 
 		irqc: interrupt-controller@110a0000 {
diff --git a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
index 0dee48c4f1e4..7a3e5b6a685f 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
@@ -1025,6 +1025,7 @@ pinctrl: pinctrl@11030000 {
 			resets = <&cpg R9A07G054_GPIO_RSTN>,
 				 <&cpg R9A07G054_GPIO_PORT_RESETN>,
 				 <&cpg R9A07G054_GPIO_SPARE_RESETN>;
+			reset-names = "rstn", "port", "spare";
 		};
 
 		irqc: interrupt-controller@110a0000 {
diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 997e6cf0bb82..3a69bb246bab 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -533,6 +533,7 @@ pinctrl: pinctrl@11030000 {
 			resets = <&cpg R9A08G045_GPIO_RSTN>,
 				 <&cpg R9A08G045_GPIO_PORT_RESETN>,
 				 <&cpg R9A08G045_GPIO_SPARE_RESETN>;
+			reset-names = "rstn", "port", "spare";
 		};
 
 		irqc: interrupt-controller@11050000 {
diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index cbb48ff5028f..66f40cb1464d 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -265,6 +265,7 @@ pinctrl: pinctrl@10410000 {
 			interrupt-parent = <&icu>;
 			power-domains = <&cpg>;
 			resets = <&cpg 0xa5>, <&cpg 0xa6>;
+			reset-names = "main", "error";
 		};
 
 		cpg: clock-controller@10420000 {
diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index 9fb15ca24984..e85daef4e42d 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -288,6 +288,7 @@ pinctrl: pinctrl@10410000 {
 			gpio-ranges = <&pinctrl 0 0 96>;
 			power-domains = <&cpg>;
 			resets = <&cpg 0xa5>, <&cpg 0xa6>;
+			reset-names = "main", "error";
 		};
 
 		cpg: clock-controller@10420000 {
diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 80cba9fcfe7b..38793b948c02 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -270,6 +270,7 @@ pinctrl: pinctrl@10410000 {
 			interrupt-parent = <&icu>;
 			power-domains = <&cpg>;
 			resets = <&cpg 0xa5>, <&cpg 0xa6>;
+			reset-names = "main", "error";
 		};
 
 		cpg: clock-controller@10420000 {
-- 
2.43.0


