Return-Path: <linux-gpio+bounces-31539-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOU7FqWTimlvMAAAu9opvQ
	(envelope-from <linux-gpio+bounces-31539-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 03:10:45 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF3E11628F
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 03:10:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D04C93025D3A
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 02:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 469EA2D0C9A;
	Tue, 10 Feb 2026 02:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWtnpZh9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E852C235B
	for <linux-gpio@vger.kernel.org>; Tue, 10 Feb 2026 02:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770689437; cv=none; b=mgsXNfv75hmPql9mwew86Sm08XDt91dgXXg5sRya7dOGwe0X2JCXrf573WfAc6ZiXslXu+uVcU/uXXJ+zhLUf93xFnQd4KdMwNLIL0fCQujc8xgXnPjTgQ3zIfnI86EbHyIbRbKLdBJ0w7zW836C5zaBHNphviNVletuqY9dnCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770689437; c=relaxed/simple;
	bh=gAuhlX8TxqpHMMWg03KEEJo34V06DiDhUjyg+cFVFGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FwMjgt7UEByW87MqyGYZ02brK5KNxnzYuz6b6XD0sqSG3TWENf2xu+WQx/eqTesxYKXtidC9/8+cnjWVJ+W7PJgiwTiAbdxsY/5hOvjj/FcQAZfSnGXV6g4+6PQBMJ59vSugGLxgZIt42rdylSXHiOC5qBmuTVew73zPRV/id60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWtnpZh9; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-505aaab61d9so2874871cf.0
        for <linux-gpio@vger.kernel.org>; Mon, 09 Feb 2026 18:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770689435; x=1771294235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WgCet5GEIn/MU9+jS2xsEMyF4DqXP/WKRLxFg70EPyQ=;
        b=VWtnpZh9ZLF36XFgqcb/rMLMK4gqQixmbqFmnTbydzALwDKiKnJ2rwGyufd3Bla/Qc
         Deg4yOX/11hD731sH3LIN4zewkz0aXGHVDmDqWY4ulfwOYrd5gmywKBAc6oOxcnLHohm
         3q5LIGuB7FmwDa3rFVxCVfProGvaEwvxE+YsiSeYLV17i+/nDWY8ngALM82iQFDvVz4x
         hl9GPKL6u7fi8ANLS5Xrh1JZdFYykwNk2JL+zQBvrPdRFwIcRO8N9eBiBVbo+W/Ypfnu
         OgHkq1HJnDI1qRww16B5kF3PgIsn+N8/8xbdZb9VUaAXp0T//6iZ266mLBWKK74FTdE3
         1RNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770689435; x=1771294235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WgCet5GEIn/MU9+jS2xsEMyF4DqXP/WKRLxFg70EPyQ=;
        b=FG5weSDCZQTlJGlm3qLFcYomQLfwAxLs0XzRQtmTyA1jviQo7o6j7ruRJcO9oKUeTu
         VGBOz5kTXXgMNwx4E+924RLK2ynpM49BED8DB0ZmBlKusxizXod8trqifXVUpVpKHvWe
         5Dvx8iZv50qxgfYGqwhZyyZChBkOEmCUe3jawqZ6Ut5Zb34RceE3bVHPOYG1iFEmw7OH
         NhoukJ6pfgS+EJ8ieA6FhR8YCg+7S3/lEgWvzTolha0ZoyMs+txmMmOIJP/bqMB4NBie
         Vi1OdjafmGPFIjwRwioisxxlMtKuG3NeLlaFAcNkKJKcrizPKpSEpJ8CAvkN20sK6OCC
         rnVA==
X-Forwarded-Encrypted: i=1; AJvYcCWRzkLlaBC4BDm4bTtbmEV4tvDm/xOxNPrcs0zrg0xaUQ85URLjdT9Ru69QcMWNaz0kPCUwMuRzQYjJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxcwFDpCnqzqxOOVgx8RjgkGCZ6iUz2eXwz0if8jeM8TscSyRZe
	BkZNyJ8spSzXaa5ynkI0SLUQSuOR5RAwU26ZYqh5Tn++YbOKqSw3GnXfpc5xgg==
X-Gm-Gg: AZuq6aID0Hb6AZkrfWbppHjhl8VyHAI+oe3aV7T6kTms9iwhZ8hpKJ++Yjdqv8Y5R7r
	h4nEiaXpxO5nIfj51X4xy/Q3recQjKYCzyI6u5XkhA21kpsCE3VFJ65TcudLNqo1EAYnppUDqGP
	9RWRfqJPlktvuV/3fKN2QTPnll1gWwzOwnZfdaDqCAAKFoV5zzQAHdnfTrdiA/jkHjIRGnmC58A
	ekhNscIfqTZa78M02v4Vshyn9bdifgXX3r3EfU2IMzDuqsvvI23j0pu2CjR+7A3YWuohZJJnyBB
	rV1oTdXA5ZlRkFVBjfTPKM2haY7JHIs9nIiBkFPDTgg9853hP2Loe8VjhIqwT5uQNpxigoDkdNg
	1DZ4jyANfepQSJ/h8O36n8xtMtrA4Px3QMisshpcLzSkmOK7Foa7IXNiTRr6azP9RUIwZeaWC67
	Xv3644+PspbgBnAVXqN5YvKTRAjsx1SOhgTDl+N1DDeAt3/9nkYkcNxA4WU/bJtxaBjReG22uXW
	p2Jcv6r6Cy6zlk=
X-Received: by 2002:ac8:5acc:0:b0:4f4:ee07:91b9 with SMTP id d75a77b69052e-506399bb6e1mr181615591cf.47.1770689434951;
        Mon, 09 Feb 2026 18:10:34 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89546b09f87sm75306686d6.34.2026.02.09.18.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 18:10:34 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 1/3] dt-bindings: pinctrl: qcom: Add SDM670 LPI pinctrl
Date: Mon,  9 Feb 2026 21:11:07 -0500
Message-ID: <20260210021109.11906-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210021109.11906-1-mailingradian@gmail.com>
References: <20260210021109.11906-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-31539-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,62b40000:email]
X-Rspamd-Queue-Id: EBF3E11628F
X-Rspamd-Action: no action

Add the pin controller for the audio Low-Power Island (LPI) on SDM670.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../qcom,sdm670-lpass-lpi-pinctrl.yaml        | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml
new file mode 100644
index 000000000000..125f365d11fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SDM670 SoC LPASS LPI TLMM
+
+maintainers:
+  - Richard Acayan <mailingradian@gmail.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in the Low Power Audio SubSystem
+  (LPASS) Low Power Island (LPI) of Qualcomm SDM670 SoC.
+
+properties:
+  compatible:
+    const: qcom,sdm670-lpass-lpi-pinctrl
+
+  reg:
+    items:
+      - description: LPASS LPI TLMM Control and Status registers
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-sdm670-lpass-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-sdm670-lpass-state"
+        additionalProperties: false
+
+$defs:
+  qcom-sdm670-lpass-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: qcom,lpass-lpi-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          pattern: "^gpio([0-9]|1[0-9]|2[0-9]|3[0-1])$"
+
+      function:
+        enum: [ gpio, comp_rx, dmic1_clk, dmic1_data, dmic2_clk, dmic2_data,
+                lpi_cdc_rst, mclk0, pdm_tx, pdm_clk, pdm_rx, pdm_sync, sec_tdm,
+                sec_tdm_din, sec_tdm_dout ]
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+allOf:
+  - $ref: qcom,lpass-lpi-common.yaml#
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    lpi_tlmm: pinctrl@62b40000 {
+        compatible = "qcom,sdm670-lpass-lpi-pinctrl";
+        reg = <0x62b40000 0x20000>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&lpi_tlmm 0 0 32>;
+
+        cdc_comp_default: cdc-comp-default-state {
+            pins = "gpio22", "gpio24";
+            function = "comp_rx";
+            drive-strength = <4>;
+        };
+    };
-- 
2.53.0


