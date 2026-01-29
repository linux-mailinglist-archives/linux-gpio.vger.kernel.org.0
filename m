Return-Path: <linux-gpio+bounces-31272-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PpJNmE0e2lJCQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31272-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 11:20:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 826A1AE84B
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 11:20:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D71E33014959
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 10:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04A1B31DD97;
	Thu, 29 Jan 2026 10:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H5kIIQo0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E213532AAA3
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 10:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769681814; cv=none; b=Ts4g7P/kRN65uG1qul3flCzH97YZNiTE8NOFecGGpkpDH73Tw5cAKsXehh47jxfcsOTrvujS1CKilCRANPQYfaryq0vpEOnWeEAESMMzuuvFqsEPVowRTlQk+Ya+vbz94w6ZPFVFvf+g1CRoV6o608iQnB5WIJ0z6bEhswVFdEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769681814; c=relaxed/simple;
	bh=whCqMCitloN4wFu7Cr4vtyiSLqxphxXk2OMNZa0+7lw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TVLMsI4/p7MsKRr/VxPSEr4iwkJpz9XXpYspFY/R9hsboaB+zeiMlt3CyO0pUvGsIKYNEIlVIhedk7ETJJupcPFpl6jF6hDH9xo9EYm4R3apL0BXxcWlnEbjRWpbbjZOluMvpFWhyJbv5nW8MGuZBdJMdpWuBz71HumeV7S05MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H5kIIQo0; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so6458115e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 02:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769681811; x=1770286611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLhqjdXh9Y6qAyHzZ9r5IyywkiPoN7iN9AMjJ8Bl+Nw=;
        b=H5kIIQo02eyl9Jb2YKlts27JnItNGBdpm71Eva/EIvVVq+33nsAtIxvR6rM8oLSfiV
         713ioLA0pgse6RmdM0koOSF1xj1fbhsi5d4UncKmZGwt3OT3YHgCPmcp3U8pfh8WxIT0
         RBTDOfFiQIoGKKU4vFdqcVMca9gcXZYhmEDEaFQOOex0JxX3RXLWoe78WPWm3Au+/pKn
         LATiSSgfcXJjKCmFOjRCmknS8ZxplQVbtLY/rCkxQ3FyMNMJQpAnipcViNvG0KPXCJHI
         y9WB3xJMwV/q3giLNpW28ZvIo0wIMAzCEDN+qxPJp34Q1TIpNY/HgcA3koSMU1IA3MdV
         AWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769681811; x=1770286611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wLhqjdXh9Y6qAyHzZ9r5IyywkiPoN7iN9AMjJ8Bl+Nw=;
        b=rDRSYoT+iLx1lMAf30NNsEe/MC5YG67efdfqWn0T6Kbik8mM7rXavmy4Kgt6FVgC28
         ztJoz88q3x+psop7Dlh/uyK4rCUeSMvvn7qHtcU5NbA0BIvEhCE6aTeZ7+1cCDmEzkbc
         IMHH2jKZZbqfjHxBv6mZROAEmxbphNboCxMUZutTBo82I0l545CFDCPXAgsZHdsyUlAx
         tnnA0e3ESoTyCQ5R2NlyqsDp5MM5FwcEr2KS3yqXJ4zhUqJ00MpU7GNt6LEZ7l1/ZvJt
         umkQDMHXlGRJklo17ihc5cTvcujgjkcLzQwaRq+kV5S2N3v4ciqXhuEIPf20jdcCejkV
         C2Xg==
X-Forwarded-Encrypted: i=1; AJvYcCV4CIydHnAzUn2CcDGq1pX/v9WtdbmCY4ZH/1g79aHPO/LJZXjBDDsxSytYwxIU4s2PIm3DxtNFb23t@vger.kernel.org
X-Gm-Message-State: AOJu0YyUKU6k4BVpU+yuqd3LsqeSOI+ng+D5EFemT2NkHKKQGfZd65Mn
	LI4UjZwRMLhowGKYCuCpdCRTaTsFW/HFqNAHou7Frxa1NWdPgbOKzLLl
X-Gm-Gg: AZuq6aK4aJXclQgZ2gl4vFYuoiEzGgqIf3Xl25D4kWCdosqSzpiSp2rcvyg2+rxfDwc
	XdjH/MeyE2gtv6O91DPZl4rcP7Ef+bFxPFNQHwxd1SXOWCd5Y8RnS08Q1uXWsexq8ItKMeqxNX4
	Xl5nBolOfcW7YCni4R8oA0xX7CrYuUZM23woMceJDS6lNh3KAlE2vbYXFXmQAEjPJFZHwoR51Ha
	wrvui8PWDyzsy1uEkXmaeRrIiY/absqMGn0Y/7JAfIQ8v9lwRvNUJcJA1TB1vmilCLqETDOFpfi
	EjvJUMEBo5EXxIYWn2wh3vQuzcUfFCypFhIJJF5cHulPMv7kgSSUGK5FlQW/pHzWo0sPa340p0L
	zTiFv8mRmzoGdcuFiM4MVBTVR/KeJKdSMBXkr/aohhK8VzfXGq4zA42sZT4ix9m2ezjWSYXNzeY
	HGV5B3qSSrmp+PNRwF
X-Received: by 2002:a05:600c:138a:b0:47d:403a:277 with SMTP id 5b1f17b1804b1-4808288f631mr31018225e9.4.1769681811242;
        Thu, 29 Jan 2026 02:16:51 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm178642065e9.2.2026.01.29.02.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 02:16:51 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: biju.das.au@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH RESEND 1/9] dt-bindings: pinctrl: renesas: Document reset-names
Date: Thu, 29 Jan 2026 10:16:36 +0000
Message-ID: <e70c010cb8c599d342807af146bd5c2a6d6cb4c5.1769681553.git.biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769681553.git.biju.das.jz@bp.renesas.com>
References: <cover.1769681553.git.biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31272-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,glider.be,kernel.org,gmail.com,baylibre.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.180.91.224:email,0.168.156.16:email,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.158.216.16:email,110a0000:email,0.168.77.240:email,bp.renesas.com:mid,0.158.255.32:email]
X-Rspamd-Queue-Id: 826A1AE84B
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


