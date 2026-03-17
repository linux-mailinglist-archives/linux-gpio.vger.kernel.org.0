Return-Path: <linux-gpio+bounces-33668-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMbkDuqhuWn9LQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33668-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 19:48:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6022B124B
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 19:48:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D10B43129F03
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 18:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 301503F7873;
	Tue, 17 Mar 2026 18:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJrbz4+V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD59364E9E
	for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 18:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773773163; cv=none; b=vGOr9EetBoCIB6JNaZANOkdxjlhQl0FUEZMfNOQOUk6t0jT6CYh1T/XPdbk3yD/0/G/oky20/jsl7yq5Ap72YNyRWeVJGdlcO5QBaM3uB91SjXmGDpNozR9qQlDkvPH7TNxL/3mABSsCFy1vrQOdo/kyNgtb6GzRjA434O+Zu/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773773163; c=relaxed/simple;
	bh=thcobMH5AohzT7xRyuc5K4LYMZMaJStuFgRXIHH+5Jg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IABl7hwLH5LiDS+GBEOlNlLDdYLpogHGgD2AkU+VJk5P/GJuXQcJyjfXDXPS4gGJtN+pb26CdxW96pRuYVhwRKHtm28ErdSEMqZvZZdhI6bdfFi6kDOb5MhZgPWv9qlHinoVQVAOBXEq+HAOW1h5zAG9Gvh6y0lz6CVQescvDYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJrbz4+V; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486507134e4so12226615e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 11:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773773160; x=1774377960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mlws9kV83sZ5c0sE5Qh/W7eCQPao3h3DdhO6uIW9QdQ=;
        b=LJrbz4+V6t6zI0YcZVQlhMTKXxJdmCxMbIAEDik6a7gqL1XW8TrnsSVj7VRuulQFWC
         u5GqsmNmnsNRTPVAsoz8eNKZlxECjiIY3Jc0eG61PTW5Sm13kCUyw6IYAGJabGXwQeLu
         d340fLKQIrsXr/aSEDX+ohzfv5sUPYlHnumk5CeUQOhJAnPeiGg/W325Sk9OtDUweHwR
         OKcf6V7A0wzeyWDWtc2uGj00hzC7k4fZMiEfoeQnEfd0+eO4dRNGSPQWNOnw5fldCsjB
         XYmolrhRp+4DeKO+YnXUyFMojuWvl41VEGuaH+aQyXvFcY0Irx/+iw5wZvWhlDns+19I
         sTlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773773160; x=1774377960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mlws9kV83sZ5c0sE5Qh/W7eCQPao3h3DdhO6uIW9QdQ=;
        b=dJopOXFOdmfK44yBY0B3iaUHvllDRLz19aiBt968Qbb5Nz0RjFYVXWZ84K2DFZs+0k
         4IITEHAQ0NPL3qB6X9AlvBY3LulldlO0VIjKCRJEHS5H+SnkhYW1oSDEWWmdotMI4U1h
         nXP01028vDBlnkik5T/6AzXcHds+b1Kn5akmjAx8s+xh7vNOamXIRNUvQhNhgUJR2yXJ
         l6FtgfUbJR1JkHzPnwLrlHeM3GSr45SlIC6GOgAVviaLKkCfNB9d35sdWGuP8Snqpdia
         5xabOLCqPwpDyJ4ZuNStQbFdpo1zJdsirBz7BDGQ+eHlYkrnidtLOeHBh5VC1Y2zaLvV
         S22w==
X-Forwarded-Encrypted: i=1; AJvYcCVsgVIC6DV1ojZHJ52nBYWRokXCdM89+Fx+lGvcT88BUkia4B5wkGh8FMs/ROGkLc1nwZpgKiE4mhgS@vger.kernel.org
X-Gm-Message-State: AOJu0YzjMivkYsnFrtTPOiLwmwdLtJGGPknvgPJDMBN+R8wm1toy3I5L
	7sh3akocxI1EQN3z57k6r3yDMjf7gWF+Mar64MX7gCsmBCWfVC0GDoyQ
X-Gm-Gg: ATEYQzyeMOF+Lx1MwA2gOX828/2GTUvz9ILqROcnLDDYQA5x0z9/dxel/aPtVDrKOMG
	6fg5ZKjOR3vCZZHJXGL1IIaemBcffwRUHVSnD52EYrNEsy2SvZVjT7SDU6pX1hP4DI8pWqCHC/E
	5jQInfrJkY6dhmJ50gt1RJrRBDT9sgwOCiOWHfgmxFyw1HacnXLr1nLmN01O5Z089NRINHOaI9U
	B3CasEdDYuMXsrzaNJ2+Q0mIftDmg619XyoZblo4sNwnOtSdU7QbvjbpSy6eRiYO0v0w7gmWXEc
	bvGvN8YTaFVkiavI0TkBu074IM9Sbz/R00n1dSibxz+wCFsJlcUo4o75aguVgnsseHWU+KiC51U
	+ziP9V4wvaQTOuOP4C4RCMo+10751+ig5GEimj2H9ev6LyUSOU7V1rcuyWKCan9Cj5GKHWgLp1i
	HqsK0xFf9vcAGh57DYSAA=
X-Received: by 2002:a05:600c:3111:b0:483:7903:c3b1 with SMTP id 5b1f17b1804b1-486f44435bdmr12289585e9.20.1773773159683;
        Tue, 17 Mar 2026 11:45:59 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4ba760esm102725e9.24.2026.03.17.11.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 11:45:59 -0700 (PDT)
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
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 3/9] dt-bindings: regulator: Document MediaTek MT6392 PMIC Regulators
Date: Tue, 17 Mar 2026 18:43:06 +0000
Message-ID: <20260317184507.523060-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317184507.523060-1-l.scorcia@gmail.com>
References: <20260317184507.523060-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33668-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,mediatek.com,collabora.com,packett.cool,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[27];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CE6022B124B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add bindings for the regulators found in the MediaTek MT6392 PMIC,
usually found in board designs using the MediaTek MT8516/MT8167 SoCs.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../regulator/mediatek,mt6392-regulator.yaml  | 318 ++++++++++++++++++
 .../regulator/mediatek,mt6392-regulator.h     |  24 ++
 2 files changed, 342 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
 create mode 100644 include/dt-bindings/regulator/mediatek,mt6392-regulator.h

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
new file mode 100644
index 000000000000..fa4aad2dcbe8
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
@@ -0,0 +1,318 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6392-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6392 Regulator
+
+description:
+  Regulator node of the PMIC. This node should under the PMIC's device node.
+  All voltage regulators provided by the PMIC are described as sub-nodes of
+  this node.
+
+properties:
+  compatible:
+    items:
+      - const: mediatek,mt6392-regulator
+
+patternProperties:
+  "^(buck_)?v(core|proc|sys)$":
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
+  "^(ldo_)?v(adc18|camio|cn18|io18)$":
+    description: LDOs with fixed 1.8V output
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
+  "^(ldo_)?v(xo22)$":
+    description: LDOs with fixed 2.2V output
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
+  "^(ldo_)?v(m25)$":
+    description: LDOs with fixed 2.5V output
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
+  "^(ldo_)?v(aud28|io28)$":
+    description: LDOs with fixed 2.8V output w/ mode
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
+  "^(ldo_)?v(cama)$":
+    description: LDOs with fixed 2.8V output w/o mode
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^(ldo_)?vusb$":
+    description: LDOs with fixed 3.3V output
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
+  "^(ldo_)?v(aud22|camaf|camd|cn35|efuse|emc3v3|gp1|gp2|m|mc|mch)$":
+    description: LDOs with variable output
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
+    mt6392_regulators: regulators {
+        compatible = "mediatek,mt6392-regulator";
+
+        mt6392_vproc_reg: buck_vproc {
+            regulator-name = "vproc";
+            regulator-min-microvolt = <700000>;
+            regulator-max-microvolt = <1350000>;
+            regulator-ramp-delay = <12500>;
+            regulator-always-on;
+            regulator-boot-on;
+        };
+
+        mt6392_vsys_reg: buck_vsys {
+            regulator-name = "vsys";
+            regulator-min-microvolt = <1400000>;
+            regulator-max-microvolt = <2987500>;
+            regulator-ramp-delay = <25000>;
+            regulator-always-on;
+            regulator-boot-on;
+        };
+
+        mt6392_vcore_reg: buck_vcore {
+            regulator-name = "vcore";
+            regulator-min-microvolt = <700000>;
+            regulator-max-microvolt = <1350000>;
+            regulator-ramp-delay = <12500>;
+            regulator-always-on;
+            regulator-boot-on;
+        };
+
+        mt6392_vxo22_reg: ldo_vxo22 {
+            regulator-name = "vxo22";
+            regulator-min-microvolt = <2200000>;
+            regulator-max-microvolt = <2200000>;
+            regulator-enable-ramp-delay = <110>;
+            regulator-always-on;
+            regulator-boot-on;
+        };
+
+        mt6392_vaud22_reg: ldo_vaud22 {
+            regulator-name = "vaud22";
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <2200000>;
+            regulator-enable-ramp-delay = <264>;
+            regulator-always-on;
+            regulator-boot-on;
+        };
+
+        mt6392_vcama_reg: ldo_vcama {
+            regulator-name = "vcama";
+            regulator-min-microvolt = <2800000>;
+            regulator-max-microvolt = <2800000>;
+            regulator-enable-ramp-delay = <264>;
+        };
+
+        mt6392_vaud28_reg: ldo_vaud28 {
+            regulator-name = "vaud28";
+            regulator-min-microvolt = <2800000>;
+            regulator-max-microvolt = <2800000>;
+            regulator-enable-ramp-delay = <264>;
+            regulator-always-on;
+            regulator-boot-on;
+        };
+
+        mt6392_vadc18_reg: ldo_vadc18 {
+            regulator-name = "vadc18";
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <1800000>;
+            regulator-enable-ramp-delay = <264>;
+            regulator-always-on;
+            regulator-boot-on;
+        };
+
+        mt6392_vcn35_reg: ldo_vcn35 {
+            regulator-name = "vcn35";
+            regulator-min-microvolt = <3300000>;
+            regulator-max-microvolt = <3600000>;
+            regulator-enable-ramp-delay = <264>;
+        };
+
+        mt6392_vio28_reg: ldo_vio28 {
+            regulator-name = "vio28";
+            regulator-always-on;
+            regulator-boot-on;
+            regulator-min-microvolt = <2800000>;
+            regulator-max-microvolt = <2800000>;
+            regulator-enable-ramp-delay = <264>;
+            regulator-always-on;
+            regulator-boot-on;
+        };
+
+        mt6392_vusb_reg: ldo_vusb {
+            regulator-name = "vusb";
+            regulator-min-microvolt = <3300000>;
+            regulator-max-microvolt = <3300000>;
+            regulator-enable-ramp-delay = <264>;
+            regulator-always-on;
+            regulator-boot-on;
+        };
+
+        mt6392_vmc_reg: ldo_vmc {
+            regulator-name = "vmc";
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <3300000>;
+            regulator-enable-ramp-delay = <264>;
+            regulator-boot-on;
+        };
+
+        mt6392_vmch_reg: ldo_vmch {
+            regulator-name = "vmch";
+            regulator-min-microvolt = <3000000>;
+            regulator-max-microvolt = <3300000>;
+            regulator-enable-ramp-delay = <264>;
+            regulator-boot-on;
+        };
+
+        mt6392_vemc3v3_reg: ldo_vemc3v3 {
+            regulator-name = "vemc3v3";
+            regulator-min-microvolt = <3000000>;
+            regulator-max-microvolt = <3300000>;
+            regulator-enable-ramp-delay = <264>;
+            regulator-boot-on;
+        };
+
+        mt6392_vgp1_reg: ldo_vgp1 {
+            regulator-name = "vgp1";
+            regulator-min-microvolt = <1200000>;
+            regulator-max-microvolt = <3300000>;
+            regulator-enable-ramp-delay = <264>;
+        };
+
+        mt6392_vgp2_reg: ldo_vgp2 {
+            regulator-name = "vgp2";
+            regulator-min-microvolt = <1200000>;
+            regulator-max-microvolt = <3300000>;
+            regulator-enable-ramp-delay = <264>;
+        };
+
+        mt6392_vcn18_reg: ldo_vcn18 {
+            regulator-name = "vcn18";
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <1800000>;
+            regulator-enable-ramp-delay = <264>;
+        };
+
+        mt6392_vcamaf_reg: ldo_vcamaf {
+            regulator-name = "vcamaf";
+            regulator-min-microvolt = <1200000>;
+            regulator-max-microvolt = <3300000>;
+            regulator-enable-ramp-delay = <264>;
+        };
+
+        mt6392_vm_reg: ldo_vm {
+            regulator-name = "vm";
+            regulator-min-microvolt = <1240000>;
+            regulator-max-microvolt = <1390000>;
+            regulator-enable-ramp-delay = <264>;
+            regulator-always-on;
+            regulator-boot-on;
+        };
+
+        mt6392_vio18_reg: ldo_vio18 {
+            regulator-name = "vio18";
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <1800000>;
+            regulator-enable-ramp-delay = <264>;
+            regulator-always-on;
+            regulator-boot-on;
+        };
+
+        mt6392_vcamd_reg: ldo_vcamd {
+            regulator-name = "vcamd";
+            regulator-min-microvolt = <1200000>;
+            regulator-max-microvolt = <1800000>;
+            regulator-enable-ramp-delay = <264>;
+        };
+
+        mt6392_vcamio_reg: ldo_vcamio {
+            regulator-name = "vcamio";
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <1800000>;
+            regulator-enable-ramp-delay = <264>;
+        };
+
+        mt6392_vm25_reg: ldo_vm25 {
+            regulator-name = "vm25";
+            regulator-min-microvolt = <2500000>;
+            regulator-max-microvolt = <2500000>;
+            regulator-enable-ramp-delay = <264>;
+        };
+
+        mt6392_vefuse_reg: ldo_vefuse {
+            regulator-name = "vefuse";
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <2000000>;
+            regulator-enable-ramp-delay = <264>;
+        };
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


