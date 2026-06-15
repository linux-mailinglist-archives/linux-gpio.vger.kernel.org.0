Return-Path: <linux-gpio+bounces-38452-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E0jRKZanL2qcEAUAu9opvQ
	(envelope-from <linux-gpio+bounces-38452-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 09:19:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6324168420C
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 09:19:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=seQCll87;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38452-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38452-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 390ED3014536
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 07:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D8803BBFD0;
	Mon, 15 Jun 2026 07:19:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8493E3054EF
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 07:19:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781507970; cv=none; b=eafRf+lculQwFzBJqKdsMs9p556IOxJysk0gdHRsVa8XQC3OLu91eCY9CT/teQrOggWESfT2q1fdVmt9fIJyzCwXX0lUHjTFV9k9lNRG0BooaZroaLvGp4gR3qgbwP+sQmuF+uwX2blcKdwJ8ukAzaSLXFYUcN0Z44xTmHBwYPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781507970; c=relaxed/simple;
	bh=ooC9b9DUGrdoKcnbPeqrS+nCD5slYRIujN5TaIyoun4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hvjFcnolTfS3MZDcf9FfVkO4A6FoWoGx7sZjFgzDi8CYwxMQoXu9tUmP7eoTN5NF4Zobbkd3fC3RXRl0Mj971Ksa3CZ94Q3A1gFajilp1U8+3UoAuLshxfwL4plRewqCDIoeiV3LsB97aZayu+rx+aR8M8MQK+4XpHis91kGQf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=seQCll87; arc=none smtp.client-ip=209.85.128.44
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso25905755e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 00:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781507967; x=1782112767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFsC411FoFwa7HzstTnYY8q7c/bVTqUdSeT+q9H/GKs=;
        b=seQCll87hw5Hs/EiYDtb5cmveDZgam0M3ob/m8bMXykK9+XThtZsaija6G1qikfZbG
         Nz9jL+bstcEjnujeFd3mBNKoGprWBnE+X6q6iopWOKwZF/+Ele/pJ33EU6R+kUwOAQ27
         4HJX/4hV7dTStAuq99JNMQ8Y/g6c96xiNjKI5/juoCti0kGZfB66gC11U7xSB/c9LBqD
         ljlj9hSsIwCDpww1l8ShW+izUgOUqx3azOh6Wc5CgPLAxn0c3NQsbdP4zj6kcIggOxF6
         vOj5WoBC5K8w8Nzsbdg+IZFNDnPeuKKebfRlKokAE2iumfLjMVHruan0Y/vqCih8cteC
         TBRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781507967; x=1782112767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iFsC411FoFwa7HzstTnYY8q7c/bVTqUdSeT+q9H/GKs=;
        b=DS3BvsmbzmxHrUV8qLMgsDu1UljovK+7qsu/mufmi4a01DFvMPgAfN2f//qwWG0Foy
         TovWUPEllNND+7TYGoiuS492avCfJzzUBTkPyx5CUKzMqx2KfOb4P84HhVSoecOdVgni
         +g9NxQInRdQsx+AcHktWEbMQEWjNk7uOeQEktSTDQ8I1Q+aYH6ggPWVuZPI1HHSQTH2j
         eaZrm5twwZQF1ulOGqqvuaMXGaeZ4ZX0oYVAicDgJoF9vLa6x3+kdYISqLTIBEEbSyu0
         nAi4NLrYE89T9MqJsF1ybxwoiuceFhJFMuJvkRQ63HuVGE1ZqibqQ7bNdXlak7RHbQPY
         RzHw==
X-Forwarded-Encrypted: i=1; AFNElJ9sMOspwlZj9zfphYMndFG1arWBnrSjOW7gJnbcRWp3fBdD4mX88tf2/KiUZNrkxdz0Ww5s5tr0BBNM@vger.kernel.org
X-Gm-Message-State: AOJu0YwUnJ5E/XPvrvt5g2Jb9dykrDCAm/yimoR8M0FKtaog9OOPJBPN
	EO3um3CdoOTjkRo+D4VT5PJTm7XpEBPL28ytfBzkGAsQpDTY2HA8Zueg
X-Gm-Gg: Acq92OGElBKJlXL2IKlo/nk4npQxojQZQYzHJMojt7qObCH5uxXU7clPhOpKJ2Wv6Ik
	2yAcoA58InviKg1I8KlF9K6300meujD8IrPH2vRMeGf0lsqXvQhEi9DLvpzyrFSJKu0UsQrZaGn
	SLF/DzYo5E3wPIj6V6y646QyYofiJ105tVqT6Lwo+11Ks997PjGpM9eZfLUfk3W2yLp+HSKvWxe
	B51Tw+fKNRSSGyJm643lkoUXNab2P0KSR/rXhjQk40fF573MWJcEGN8N3r3oy3ci6S49YIQ0Wqz
	w8moY9JkLK+vX5awG3bd2CQGAn1XzC8baPx46iYY7joOXES9bGyZqv8bAAXjmPPXNqpdsj3C0Bm
	JxnwtLagdJ6gl1ofmnS8imE+vxJyaoGQaVUePbCN1zjKViWMCsBF6EtlnnQBgY6e0bZxaCnkW5F
	+BIFSOs/58WZkSWmXt
X-Received: by 2002:a05:600c:6692:b0:48f:e26a:1744 with SMTP id 5b1f17b1804b1-49220061acfmr124397735e9.9.1781507966741;
        Mon, 15 Jun 2026 00:19:26 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203c0801sm200181015e9.10.2026.06.15.00.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:19:26 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Val Packett <val@packett.cool>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v7 3/9] regulator: dt-bindings: Add MediaTek MT6392 PMIC
Date: Mon, 15 Jun 2026 09:16:09 +0200
Message-ID: <20260615071836.362883-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615071836.362883-1-l.scorcia@gmail.com>
References: <20260615071836.362883-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38452-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,mediatek.com,collabora.com,packett.cool,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mediatek@lists.infradead.org,m:l.scorcia@gmail.com,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sen.chu@mediatek.com,m:sean.wang@mediatek.com,m:macpaul.lin@mediatek.com,m:lee@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:linusw@kernel.org,m:val@packett.cool,m:julien.massot@collabora.com,m:louisalexis.eyraud@collabora.com,m:parent.f@gmail.com,m:akkun11.open@gmail.com,m:chen.zhong@mediatek.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:lscorcia@gmail.com,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:parentf@gmail.com,m:akkun11open@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6324168420C

Add bindings for the regulators found in the MediaTek MT6392 PMIC,
usually found in board designs using the MediaTek MT8516/MT8167 SoCs.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../regulator/mediatek,mt6392-regulator.yaml  | 234 ++++++++++++++++++
 .../regulator/mediatek,mt6392-regulator.h     |  24 ++
 2 files changed, 258 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
 create mode 100644 include/dt-bindings/regulator/mediatek,mt6392-regulator.h

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
new file mode 100644
index 000000000000..197041df4ba1
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
@@ -0,0 +1,234 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6392-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6392 regulator
+
+maintainers:
+  - Luca Leonardo Scorcia <l.scorcia@gmail.com>
+
+description:
+  MT6392 is a power management system chip containing three buck converters and
+  23 LDOs. All voltage regulators provided by the PMIC are described as
+  sub-nodes of this node.
+
+properties:
+  compatible:
+    items:
+      - const: mediatek,mt6392-regulator
+
+  vproc-supply:
+    description: Supply for buck regulator vproc
+  vcore-supply:
+    description: Supply for buck regulator vcore
+  vsys-supply:
+    description: Supply for buck regulator vsys
+  avddldo-supply:
+    description: |
+      Supply for AVDD LDOs (vm, vio18, vcn18, vcamd, vcamio). According to the data sheet
+      this is an internal supply derived from vsys.
+  ldo1-supply:
+    description: Supply for LDOs group 1 (vaud28, vxo22, vaud22, vadc18, vcama, vrtc)
+  ldo2-supply:
+    description: Supply for LDOs group 2 (vcn35, vio28, vmc, vmch, vefuse, vdig18)
+  ldo3-supply:
+    description: Supply for LDOs group 3 (vusb, vemc3v3, vcamaf, vgp1, vgp2, vm25)
+
+patternProperties:
+  "^v(core|proc|sys)$":
+    description: Buck regulators
+    type: object
+    $ref: regulator.yaml#
+    properties:
+      regulator-allowed-modes:
+        description: |
+          BUCK regulators can set regulator-initial-mode and regulator-allowed-modes to
+          values specified in dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 1]
+    unevaluatedProperties: false
+
+  "^v(adc18|camio|cn18|io18|xo22|m25|aud28|io28|rtc|usb)$":
+    description: LDOs with fixed output and mode setting
+    type: object
+    $ref: regulator.yaml#
+    properties:
+      regulator-allowed-modes:
+        description: |
+          LDO regulators can set regulator-initial-mode and regulator-allowed-modes to
+          values specified in dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 1]
+    unevaluatedProperties: false
+
+  "^v(cama|dig18)$":
+    description: LDOs with fixed output without mode setting
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^v(aud22|camaf|camd|cn35|efuse|emc3v3|gp1|gp2|m|mc|mch)$":
+    description: LDOs with adjustable output
+    type: object
+    $ref: regulator.yaml#
+    properties:
+      regulator-allowed-modes: false
+    unevaluatedProperties: false
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    regulators {
+      compatible = "mediatek,mt6392-regulator";
+
+      mt6392_vproc_reg: vproc {
+        regulator-min-microvolt = < 700000>;
+        regulator-max-microvolt = <1350000>;
+        regulator-always-on;
+        regulator-boot-on;
+      };
+
+      mt6392_vsys_reg: vsys {
+        regulator-min-microvolt = <1400000>;
+        regulator-max-microvolt = <2987500>;
+        regulator-always-on;
+        regulator-boot-on;
+      };
+
+      mt6392_vcore_reg: vcore {
+        regulator-min-microvolt = < 700000>;
+        regulator-max-microvolt = <1350000>;
+        regulator-always-on;
+        regulator-boot-on;
+      };
+
+      mt6392_vxo22_reg: vxo22 {
+        regulator-min-microvolt = <2200000>;
+        regulator-max-microvolt = <2200000>;
+        regulator-always-on;
+        regulator-boot-on;
+      };
+
+      mt6392_vaud22_reg: vaud22 {
+        regulator-min-microvolt = <1800000>;
+        regulator-max-microvolt = <2200000>;
+        regulator-always-on;
+        regulator-boot-on;
+      };
+
+      mt6392_vcama_reg: vcama {
+        regulator-min-microvolt = <2800000>;
+        regulator-max-microvolt = <2800000>;
+      };
+
+      mt6392_vaud28_reg: vaud28 {
+        regulator-min-microvolt = <2800000>;
+        regulator-max-microvolt = <2800000>;
+        regulator-always-on;
+        regulator-boot-on;
+      };
+
+      mt6392_vadc18_reg: vadc18 {
+        regulator-min-microvolt = <1800000>;
+        regulator-max-microvolt = <1800000>;
+        regulator-always-on;
+        regulator-boot-on;
+      };
+
+      mt6392_vcn35_reg: vcn35 {
+        regulator-min-microvolt = <3300000>;
+        regulator-max-microvolt = <3600000>;
+      };
+
+      mt6392_vio28_reg: vio28 {
+        regulator-min-microvolt = <2800000>;
+        regulator-max-microvolt = <2800000>;
+        regulator-always-on;
+        regulator-boot-on;
+      };
+
+      mt6392_vusb_reg: vusb {
+        regulator-min-microvolt = <3300000>;
+        regulator-max-microvolt = <3300000>;
+        regulator-always-on;
+        regulator-boot-on;
+      };
+
+      mt6392_vmc_reg: vmc {
+        regulator-min-microvolt = <1800000>;
+        regulator-max-microvolt = <3300000>;
+        regulator-boot-on;
+      };
+
+      mt6392_vmch_reg: vmch {
+        regulator-min-microvolt = <3000000>;
+        regulator-max-microvolt = <3000000>;
+        regulator-boot-on;
+      };
+
+      mt6392_vemc3v3_reg: vemc3v3 {
+        regulator-min-microvolt = <3000000>;
+        regulator-max-microvolt = <3300000>;
+        regulator-boot-on;
+      };
+
+      mt6392_vgp1_reg: vgp1 {
+        regulator-min-microvolt = <1200000>;
+        regulator-max-microvolt = <3300000>;
+      };
+
+      mt6392_vgp2_reg: vgp2 {
+        regulator-min-microvolt = <1200000>;
+        regulator-max-microvolt = <3300000>;
+      };
+
+      mt6392_vcn18_reg: vcn18 {
+        regulator-min-microvolt = <1800000>;
+        regulator-max-microvolt = <1800000>;
+      };
+
+      mt6392_vcamaf_reg: vcamaf {
+        regulator-min-microvolt = <1200000>;
+        regulator-max-microvolt = <3300000>;
+      };
+
+      mt6392_vm_reg: vm {
+        regulator-min-microvolt = <1240000>;
+        regulator-max-microvolt = <1390000>;
+      };
+
+      mt6392_vio18_reg: vio18 {
+        regulator-min-microvolt = <1800000>;
+        regulator-max-microvolt = <1800000>;
+        regulator-always-on;
+        regulator-boot-on;
+      };
+
+      mt6392_vcamd_reg: vcamd {
+        regulator-min-microvolt = <1200000>;
+        regulator-max-microvolt = <1800000>;
+      };
+
+      mt6392_vcamio_reg: vcamio {
+        regulator-min-microvolt = <1800000>;
+        regulator-max-microvolt = <1800000>;
+      };
+
+      mt6392_vm25_reg: vm25 {
+        regulator-min-microvolt = <2500000>;
+        regulator-max-microvolt = <2500000>;
+      };
+
+      mt6392_vefuse_reg: vefuse {
+        regulator-min-microvolt = <1800000>;
+        regulator-max-microvolt = <2000000>;
+      };
+    };
diff --git a/include/dt-bindings/regulator/mediatek,mt6392-regulator.h b/include/dt-bindings/regulator/mediatek,mt6392-regulator.h
new file mode 100644
index 000000000000..8bd1a13faad8
--- /dev/null
+++ b/include/dt-bindings/regulator/mediatek,mt6392-regulator.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_REGULATOR_MEDIATEK_MT6392_H_
+#define _DT_BINDINGS_REGULATOR_MEDIATEK_MT6392_H_
+
+/*
+ * Buck mode constants which may be used in devicetree properties (eg.
+ * regulator-initial-mode, regulator-allowed-modes).
+ * See the manufacturer's datasheet for more information on these modes.
+ */
+
+#define MT6392_BUCK_MODE_AUTO		0
+#define MT6392_BUCK_MODE_FORCE_PWM	1
+
+/*
+ * LDO mode constants which may be used in devicetree properties (eg.
+ * regulator-initial-mode, regulator-allowed-modes).
+ * See the manufacturer's datasheet for more information on these modes.
+ */
+
+#define MT6392_LDO_MODE_NORMAL		0
+#define MT6392_LDO_MODE_LP		1
+
+#endif
-- 
2.43.0


