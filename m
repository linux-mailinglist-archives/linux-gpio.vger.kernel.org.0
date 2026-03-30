Return-Path: <linux-gpio+bounces-34394-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uI+mNEs5ymnD6gUAu9opvQ
	(envelope-from <linux-gpio+bounces-34394-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 10:50:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0E7357808
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 10:50:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D337309980D
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 08:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A583A7855;
	Mon, 30 Mar 2026 08:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MzpN8aJe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FAA3AD519
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 08:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774859724; cv=none; b=XvtdiZyNm73S1goHV8LXK5WsoPbvbi2NCaXYGdsQzDMeLcbzn/QfFUzIK63sazYfjjAQ6F6Tlc93ZnUcIFTgdVDe2OC6kvK5ZPgSfFtcHmgRKGdHGCYZjWOfh1ga5TOy2Q990PWg5o1CtxsAQ1V3P9aNzMZ6+BJqkWnzn6vVLBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774859724; c=relaxed/simple;
	bh=sRQA5QLHO2sUZDXytYhE/C8tMIpR3aUH3LvjIZmVSNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JeqGJmgRSEwk2/rlqFIA+PtfujG8QlYUfRXHaSdw2hnZkQiNFlZz0PfHgsDeJbLICKUC9fkVnIq7VskV9DARSWDuvksr78BwkL7VIfzMjQJJxj5RLsDORhrjjE6oai94uxMeeeJA+xr97U6w7dwWfFdoyCd/Tbr1SDqnRDWn8OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MzpN8aJe; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-486fe655187so54350615e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 01:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859721; x=1775464521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZY/r0Q2Y0NxdHq45+egYGlikRLogBMu0oJhE3y/Rf0=;
        b=MzpN8aJeZpXu2RJOLjRHo1Srmmmz9+ALJEZkI2XHIpbr1OR6s3X26O43cYGDechbLp
         fzM7a/DsHbu24VsAMuvHVc1S06HA4lTvItPF0Vge5CS81xqA7A2u1FKsA4REnJbYlAc6
         7qjRMvm9Lx5b1PSlf2T2YMT1P83+y4Roht7+Q6GO8Sj6IMo6Nv15hNgnJegmSD8Z5/qZ
         Vis+K51n2pqurFLni6dS3a9PAoeRK2EASIYtXB4XelzBzifyFDZnLXWKwn7hJqRffwvR
         7pMazMt+zJdGVQiMvZn/qi6iaqohPzNHYKzysXd1t39DtJpDgpE7SpEajC4GsWaKX22n
         oGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859721; x=1775464521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eZY/r0Q2Y0NxdHq45+egYGlikRLogBMu0oJhE3y/Rf0=;
        b=VHtYtDnm6qyruI/vim8ldPed58swJF2ZIoFpL7I8aCWdwx359hsvI6m+gBMZrqtXMM
         r18fQjhW23MQKiTFty203EEuGQ9+9rNvYDDLEAFWp9wVhFR8eq9NZcA14wT7u944ooxF
         V6CKV+1s34vsX3InQJA82aB+BlroUIkfzSk5DIzremgng4R+1cKKtkZREDU4apX85mLY
         +QMOBRb0O6NfPTYh97nN9nGb1DIYQXsNc8ZN7R7UzeeEF8lLPvjg/WLO5tOzYSL9B0Rt
         tmhfWNUbdWpFDTeb5pkmhiA3bqYxC0MnUua6UaDOmDsqGTrQqakpn5vNQK4BC6NwmpmH
         1EJA==
X-Forwarded-Encrypted: i=1; AJvYcCX6niHLlY96T4eORQTcUE5bPH0vni25Hj7Bny5ft9sUUvlBkYXDkMwoXCvoyqVZMBluS5MsBCX+rLJg@vger.kernel.org
X-Gm-Message-State: AOJu0Yyub+49zNwvds/gCdymW5M8X4/1YkINTJzG85hP3bIe9A8p3m6j
	7WViCtC7nEVjCU0P/Qal0Y8mmh0M23Atpft0Tfmzyl/CBiSWdcR53WIM
X-Gm-Gg: ATEYQzwoG7ciMuu+VxvzdM8mqnbBOiaNMrPHkCKFISOI2chqARHmUggPt5qGS75eJJQ
	Tyl/xAqqvHBdBIMP6Z//AubfupaZYa21/4Z2c4rl7/UlEUMPH6uZD79vBnKbYHjTu05ElWd1k+5
	/dY7PZaMzcYleyo4UkeZFhs6irBPmMlN/MsXSvKsJVrh7sX7StFygCF8IhcTH8+M6PFJq3XR+2E
	hBGZtl8dRpWbxKS1DOUgd92UGAVIKDnsFGXqDXGPd0JSS11y3Ch1UyHRF7DER2PXCegPRm1cI0q
	f1tpj618OWzon/IuXmVuWqpVGLuy8yzP7hUA4KiZee7hrArQdNyqvxjbTzpzOKj48p52A2zVdpS
	GAz9M19wgHJDFUDqJ7cbkDEQd0E3OGXXAYhbOg1fxpkKS8OavmENExOes3V04BfzqnmBTNAolzM
	FdqYHGR8okrHsh8YS7aUY=
X-Received: by 2002:a05:600c:4e15:b0:486:ff92:63e5 with SMTP id 5b1f17b1804b1-48727d4583dmr192584345e9.6.1774859720682;
        Mon, 30 Mar 2026 01:35:20 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b495sm508329995e9.2.2026.03.30.01.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:35:20 -0700 (PDT)
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
Subject: [PATCH v4 3/9] regulator: dt-bindings: Add MediaTek MT6392 PMIC
Date: Mon, 30 Mar 2026 09:29:37 +0100
Message-ID: <20260330083429.359819-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330083429.359819-1-l.scorcia@gmail.com>
References: <20260330083429.359819-1-l.scorcia@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34394-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Queue-Id: 8C0E7357808
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add bindings for the regulators found in the MediaTek MT6392 PMIC,
usually found in board designs using the MediaTek MT8516/MT8167 SoCs.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../regulator/mediatek,mt6392-regulator.yaml  | 74 +++++++++++++++++++
 .../regulator/mediatek,mt6392-regulator.h     | 24 ++++++
 2 files changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
 create mode 100644 include/dt-bindings/regulator/mediatek,mt6392-regulator.h

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
new file mode 100644
index 000000000000..24fbaef0e717
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6392-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6392 regulator
+
+description:
+  Regulator node of the PMIC. This node should under the PMIC's device node.
+  MT6392 is a power management system chip containing three buck converters and
+  23 LDOs. All voltage regulators provided by the PMIC are described as
+  sub-nodes of this node.
+
+properties:
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
+  "^v(adc18|camio|cn18|io18|xo22|m25|aud28|io28|rtc|vusb)$":
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
+additionalProperties: false
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


