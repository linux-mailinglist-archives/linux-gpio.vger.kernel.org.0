Return-Path: <linux-gpio+bounces-29570-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8724FCBF07A
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 17:52:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7A403095E5E
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 16:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E076A336ED5;
	Mon, 15 Dec 2025 16:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="iUsJpGZX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9B23346B6
	for <linux-gpio@vger.kernel.org>; Mon, 15 Dec 2025 16:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816725; cv=none; b=VjdYYP4iXjTu82Cdh0NP819Nq5Nmh1aGnpS1Hduqso0o1kxyYNjwWsFK+LjLS3DVdG+ksL5iuBVNxOxbTCwOiC9yqH8QPucxiEvdSKZBx5BiyCNh7kqca2kiWq3sP17H4QJ9ok2DDmPTtOaQpSrfrT3Dk9DJwm1nQidOof5Pn5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816725; c=relaxed/simple;
	bh=Mw38vMoCtsN1M3uLp9FBjOW1Fc/flVcfne0jEO3XE6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jJnwinBYFC/Pci2Iu4NqNrsZNmbjhjjKpVtcUe7W4tzcozXqyv/9xLhcsvSVKKw4yCm3Bc5hZ08SmD7Ro+Ng/iy+rEJlTCK+Yq5ekQUsLQBErA5+04oPnAU3fLrnqZjSL0ZYZYRY94NbeyBsHyY09ET/4D6GXxkSU+wc9M352jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=iUsJpGZX; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so38776215e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 15 Dec 2025 08:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765816719; x=1766421519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7cr536UDgS92jlWZeDNjEl4kPxUbLD36ZKIS2o6rIwQ=;
        b=iUsJpGZX682GOZg0dTxwZ4ZZoHNesPQ7M7vW2QQE12+WBjlxzK8UMiYx4T/uOclL2u
         R7l3gYGEDTWZa0KjaLP6cY1JNsNcO6sQbhXW/KDZqDBGTUK4HqRWEb2+dndM4yJx+NUd
         JK1nf1td7frr+LoBRNFWq2NRbuQVh5lys3XUdBySClcaJ7DBrR+LczNnwj55gd5LdyN3
         OHBDwsF3ahAzySoppmxMd5CnOO/W5Bx1Jqtm//wBShRyCSmFkbIbX1qHi8MkHHZrsXrR
         0mjNYd/Hi/SnMzY9/aNvWBb4FCHtW2jCue7iG7l7Vnz38IeIOXuncaXMsVTud1bGbIcR
         ixGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765816719; x=1766421519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7cr536UDgS92jlWZeDNjEl4kPxUbLD36ZKIS2o6rIwQ=;
        b=j6NeFILpk9fMDDbSogdce7eSdMSrKndSli8EtKb2SOHcHAoezeWdlOP93QC8CzGTEi
         577OMndCKSlTASLm0bnG5Zbt4hufSQ3Kc4pRqlN5CfkDKe6qZHoH2rIP8S6LQ3aG3vfU
         O+cCr9EdiP7pkb0bcDhFG07vUSeVw/zMqv6ssQNVuCFTQhwiMYM4DkBQyGI5dDNQW/3b
         tee1SdWELK1f9ubQVn07mMpAD1Te1rdbRNt00xpJn6tRH4yojmGE3ZW4lTAx4j+VI/5G
         qJesc1qinKNl+1UxgN8BSflpNZTFhWOlvbKsoEnNFxarAMaZna0brGus2+oE+sR/2TxL
         IuZA==
X-Forwarded-Encrypted: i=1; AJvYcCV/ueWZKyD7Oh32JmKW6VOqXL7eiraroSvgjDg17yawjtqCvbW3mCC47CQXgu5Zz56l8zwjNLxZR+mj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2N90mHUELNMdblpgEFu0p0+LlY7ZFtY+1cJAEunqHJT9CYjOI
	DgQ+g2fFdiH/Ahx9boB0Uey/reaTRp1FU1UBjSBq8OB8yWQ1Tb1tgWF9mwPh5by4xFc=
X-Gm-Gg: AY/fxX4G2+7lN8dnMB3YIB53QBsAjJrGUArwC5r0fBdjIaRiFk8DT8Umu4L8/90ykb3
	YpR3whPBq8KvXWTzaGt5Cy3Cwep21PgEEng+qafAXdRAm7W0SLJ1LAaevQYGePgCgNWReox8wTe
	Gx2gCf3OHo22uLiGex1fw3vbCI8EQzGC2EO74LuzKsaZoAlcf0rt1IhN89MrQw2dIxMRv71NdgE
	IiHounC1DZuh0dWKBGaHbXC1rBLpEKTbqnXiYOlNV8D+xPOwinpsdMwSa2PrMocKNSzBGL/kJ9U
	Bl2zva0MFRk0QhvjY+QxUPDmbly+tkhUARE22f6j6SIECfyH1zpWs74Wa8fCCMbBYgr4H38fV1p
	DvcWZ6xrYRgic4p2ob7zg12PBEltCQr9KmgCwBtf6uZFieCAQE+eqhOuT78wqlSontFTT/xMTRE
	GFWxuUnw4nYRzVipU7dVAEtwUlpwsHsKSJ6XynnDv0oB/7
X-Google-Smtp-Source: AGHT+IGvG/TSfxfhjYvvmATvH3ZbvzWkRJjCKvDqMhA7t3M2U7NK4AtPk3nLm/dPEELgL3u0/Oj/YQ==
X-Received: by 2002:a05:600c:524e:b0:46e:48fd:a1a9 with SMTP id 5b1f17b1804b1-47a8f915c70mr115135515e9.33.1765816718894;
        Mon, 15 Dec 2025 08:38:38 -0800 (PST)
Received: from fedora (cpezg-94-253-146-254-cbl.xnet.hr. [94.253.146.254])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47a8f74b44csm192209725e9.3.2025.12.15.08.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:38:38 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	linux@roeck-us.net,
	andi.shyti@kernel.org,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linusw@kernel.org,
	olivia@selenic.com,
	radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	richardcochran@gmail.com,
	wsa+renesas@sang-engineering.com,
	romain.sioen@microchip.com,
	Ryan.Wanner@microchip.com,
	lars.povlsen@microchip.com,
	tudor.ambarus@linaro.org,
	charan.pedumuru@microchip.com,
	kavyasree.kotagiri@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org,
	mwalle@kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 05/19] dt-bindings: arm: microchip: move SparX-5 to generic Microchip binding
Date: Mon, 15 Dec 2025 17:35:22 +0100
Message-ID: <20251215163820.1584926-5-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215163820.1584926-1-robert.marko@sartura.hr>
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that we have a generic Microchip binding, lets move SparX-5 as well as
there is no reason to have specific binding file for each SoC series.

The check for AXI node was dropped.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 .../bindings/arm/microchip,sparx5.yaml        | 67 -------------------
 .../devicetree/bindings/arm/microchip.yaml    | 22 ++++++
 2 files changed, 22 insertions(+), 67 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/microchip,sparx5.yaml

diff --git a/Documentation/devicetree/bindings/arm/microchip,sparx5.yaml b/Documentation/devicetree/bindings/arm/microchip,sparx5.yaml
deleted file mode 100644
index 9a0d54e9799c..000000000000
--- a/Documentation/devicetree/bindings/arm/microchip,sparx5.yaml
+++ /dev/null
@@ -1,67 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/arm/microchip,sparx5.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Microchip Sparx5 Boards
-
-maintainers:
-  - Lars Povlsen <lars.povlsen@microchip.com>
-
-description: |+
-   The Microchip Sparx5 SoC is a ARMv8-based used in a family of
-   gigabit TSN-capable gigabit switches.
-
-   The SparX-5 Ethernet switch family provides a rich set of switching
-   features such as advanced TCAM-based VLAN and QoS processing
-   enabling delivery of differentiated services, and security through
-   TCAM-based frame processing using versatile content aware processor
-   (VCAP)
-
-properties:
-  $nodename:
-    const: '/'
-  compatible:
-    oneOf:
-      - description: The Sparx5 pcb125 board is a modular board,
-          which has both spi-nor and eMMC storage. The modular design
-          allows for connection of different network ports.
-        items:
-          - const: microchip,sparx5-pcb125
-          - const: microchip,sparx5
-
-      - description: The Sparx5 pcb134 is a pizzabox form factor
-          gigabit switch with 20 SFP ports. It features spi-nor and
-          either spi-nand or eMMC storage (mount option).
-        items:
-          - const: microchip,sparx5-pcb134
-          - const: microchip,sparx5
-
-      - description: The Sparx5 pcb135 is a pizzabox form factor
-          gigabit switch with 48+4 Cu ports. It features spi-nor and
-          either spi-nand or eMMC storage (mount option).
-        items:
-          - const: microchip,sparx5-pcb135
-          - const: microchip,sparx5
-
-  axi@600000000:
-    type: object
-    description: the root node in the Sparx5 platforms must contain
-      an axi bus child node. They are always at physical address
-      0x600000000 in all the Sparx5 variants.
-    properties:
-      compatible:
-        items:
-          - const: simple-bus
-
-    required:
-      - compatible
-
-required:
-  - compatible
-  - axi@600000000
-
-additionalProperties: true
-
-...
diff --git a/Documentation/devicetree/bindings/arm/microchip.yaml b/Documentation/devicetree/bindings/arm/microchip.yaml
index 3c76f5b585fc..910ecc11d5d7 100644
--- a/Documentation/devicetree/bindings/arm/microchip.yaml
+++ b/Documentation/devicetree/bindings/arm/microchip.yaml
@@ -10,6 +10,7 @@ maintainers:
   - Alexandre Belloni <alexandre.belloni@bootlin.com>
   - Claudiu Beznea <claudiu.beznea@microchip.com>
   - Nicolas Ferre <nicolas.ferre@microchip.com>
+  - Lars Povlsen <lars.povlsen@microchip.com>
 
 properties:
   $nodename:
@@ -238,6 +239,27 @@ properties:
           - const: microchip,lan9668
           - const: microchip,lan966
 
+      - description: The Sparx5 pcb125 board is a modular board,
+          which has both spi-nor and eMMC storage. The modular design
+          allows for connection of different network ports.
+        items:
+          - const: microchip,sparx5-pcb125
+          - const: microchip,sparx5
+
+      - description: The Sparx5 pcb134 is a pizzabox form factor
+          gigabit switch with 20 SFP ports. It features spi-nor and
+          either spi-nand or eMMC storage (mount option).
+        items:
+          - const: microchip,sparx5-pcb134
+          - const: microchip,sparx5
+
+      - description: The Sparx5 pcb135 is a pizzabox form factor
+          gigabit switch with 48+4 Cu ports. It features spi-nor and
+          either spi-nand or eMMC storage (mount option).
+        items:
+          - const: microchip,sparx5-pcb135
+          - const: microchip,sparx5
+
       - description: Kontron KSwitch D10 MMT series
         items:
           - enum:
-- 
2.52.0


