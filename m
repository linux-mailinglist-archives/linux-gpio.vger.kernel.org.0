Return-Path: <linux-gpio+bounces-35827-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIiHEcoA82kvwgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35827-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 09:12:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A649949E70B
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 09:12:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 701A63043D1D
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 07:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91E02367F53;
	Thu, 30 Apr 2026 07:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="TxFoCeyO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5917F378814
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 07:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777533054; cv=none; b=pFyYv8bs6ijb//Hvys674rfyMpQk+4rZBmgffumW+iMEsybTM8rQku3vw4WTJjm8vPoUefGQmQ3V3nyVz3+GFC3FVAlvh3VWdbHrLE95TQRqf85Hg1/m1PJG5PP8Ac7DFyttNiKJb55tN/8MKwLjInil4F28ga3dWvxeR1DTz8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777533054; c=relaxed/simple;
	bh=++Zm2pL/MChTSAhZsB+/yIpS7A5i7sldIEDzeeK5d+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QjX3PRVf+XEPNMQ9v+xrfgDNubqlou7WIg2B/HgWUPvt0QdppcuohouEWgehqgMm5ueAcqjUW5zPjm6Sp6nZHxZjU5lnq3q2y+jh00H9hqX75jyBh0UU/ARVrdfdQxc8qggs8EEqBtblCIG7mAA1NCo4y1k9m65H5cNeTe3aVXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=TxFoCeyO; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48909558b3aso6245265e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 00:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777533051; x=1778137851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tBbkcsBOmDIqFMej9O4JHGnof1KdN/ltnqYnyUZPxWc=;
        b=TxFoCeyOQ53bx3xLrUqFiDZ6yQtYm99YrV9s7LWpxVNTOM8/vqoy2YkNR8+ZLjyxB+
         lV8ulJXQQQJBpMekWW3/+v+OHu/bljP6qiBLTcnTNxMi8WTuK2jHY5L2NYBx+JrvHnSM
         K4sDO3DdIrJrC9apq6rvZKbXB8RL0+o5EQgZJA/hob4hier00d+Opj2gANN++dYTT9rd
         I/gEPJZ6KcXDXFGd2lvV9MMpgrHgbnvqM/sqZ2M5aJqfooSo15aB0fQKIUnH1VI5m8HH
         6ulUphi9vpuXGhx1eIZHM2hu/svgJh591GVZHbE5WiwqjklMeN0wbAawplncouWeA6ay
         +4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777533051; x=1778137851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tBbkcsBOmDIqFMej9O4JHGnof1KdN/ltnqYnyUZPxWc=;
        b=hqJBtgAnHsmr4A46TeNNFtIVe9NflYG1+0cX0h6Ggc927pZ1ybAwg8tszRZ3ckScwh
         k88/GLVnmGw4+al9kMBwsmcYTE7rtMSUTGGZSEzY6vMRwXVNJwdwbICpo8yQDSbXZmPY
         xIDV7dDaW8Bbd5naPCxGgh9AVE1r8QMxRAXUO3/bHcjv/c5tE+YhCJftB45vjikpTtg0
         6Gng6qGxD6DLP9dhqyV5wUTSobvRWzW+mj86UK9qYUvzs/71UruK5fuSfWFQ1UYprS/T
         NLOmQ//CjXAq7y6t23aV22HicPzYzdiMkIi4Es6/w3lgbn2VMWY7etJG9XI/ApON5/lt
         /Pug==
X-Forwarded-Encrypted: i=1; AFNElJ+7OPCoGAg0nS6xDZsWExRp3jyuYIlZkCb7d93OUor5Lufv7++ZR5Du0efPlZsecHKMjEE3ZU+VN07R@vger.kernel.org
X-Gm-Message-State: AOJu0YzA94hfffdWCW4+3lTBj+FDxogAGRfXd2J6ibSiV5wsiYimisJa
	Xfy9evc1xrZHWOhoaPkRokxbfRJdDcKwYI1B6gnA45//m4+4+Zqq9P1VVPijG1Kpx9n44ag98zy
	Gzj/QBUI=
X-Gm-Gg: AeBDieufb9u7z357in2+1ZzBlFbNli0aefVWUkECvge4iWSlPHa4L1i3mEvs6bjrMrX
	8tyAKdgO/Wn412pjcChQdhGrDcYC9Ivyzx66NOjow+dsVVph9moND66V3fHoOIJCAnKsPvm2n9i
	NgSXtsJx0sRekMDMXI96ao7Asap8g9rxWJizXSTgRL3qlwWRu2HlBn40aMZrnubhL2lTAaBkzp/
	8/H1aA9FX75qCH0fT49Eft7H751uF8KxtFpnDrnm6KCkgqyzQleP2/Wqw3o8zsA3TOclvYcSt9U
	VkYCdS8+PwZpcHAjqUKZjaxK8/O3dfeWLYjtLKi62tKIiY0PciCpTB3J4ZuOLCUNfLg5t4OI9lS
	R0fZhQS9hCneE3M1TGg5Z0GLGot7pLp8qIchtOoOSYzejZhz6jWp4jY8ZahaoA5MfCfpjaHYDcm
	W0Dz4KYVEcYLtJw2cm0q13O3ZSxz6Tt15MIkPS+l8X+l3ZuBh9BNFDt3THanA/cvnBJu2ua4yy+
	RkX+l3y
X-Received: by 2002:a05:600c:8010:b0:488:b187:3c with SMTP id 5b1f17b1804b1-48a8446d803mr27313725e9.14.1777533050634;
        Thu, 30 Apr 2026 00:10:50 -0700 (PDT)
Received: from [192.168.178.36] (046124200255.public.t-mobile.at. [46.124.200.255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed6b89sm46080825e9.1.2026.04.30.00.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 00:10:50 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 30 Apr 2026 09:10:41 +0200
Subject: [PATCH v2 1/5] dt-bindings: pinctrl: qcom: Add SM6350 LPI pinctrl
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-sm6350-lpi-tlmm-v2-1-81d068025b97@fairphone.com>
References: <20260430-sm6350-lpi-tlmm-v2-0-81d068025b97@fairphone.com>
In-Reply-To: <20260430-sm6350-lpi-tlmm-v2-0-81d068025b97@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777533047; l=4264;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=++Zm2pL/MChTSAhZsB+/yIpS7A5i7sldIEDzeeK5d+0=;
 b=wCxpg9VKhtvBlcsVwO+rhrpLgpZq7Tffn+P+K4ExFHjmHauGEt94udWS7U9SIxL/oWz1gsCD8
 YAwzsMMudU1C45c+O5zWc0Fk9EldsqOPdJRynW98+F78rtn2U4FyM8S
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Queue-Id: A649949E70B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35827-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,fairphone.com:email,fairphone.com:dkim,fairphone.com:mid,33c0000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Add bindings for pin controller in Low Power Audio SubSystem (LPASS).

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../pinctrl/qcom,sm6350-lpass-lpi-pinctrl.yaml     | 124 +++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-lpass-lpi-pinctrl.yaml
new file mode 100644
index 000000000000..4903b2d37d89
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-lpass-lpi-pinctrl.yaml
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,sm6350-lpass-lpi-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM6350 SoC LPASS LPI TLMM
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in the Low Power Audio SubSystem
+  (LPASS) Low Power Island (LPI) of Qualcomm SM6350 SoC.
+
+properties:
+  compatible:
+    const: qcom,sm6350-lpass-lpi-pinctrl
+
+  reg:
+    items:
+      - description: LPASS LPI TLMM Control and Status registers
+      - description: LPASS LPI MCC registers
+
+  clocks:
+    items:
+      - description: LPASS Core voting clock
+      - description: LPASS Audio voting clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: audio
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-sm6350-lpass-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-sm6350-lpass-state"
+        additionalProperties: false
+
+$defs:
+  qcom-sm6350-lpass-state:
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
+          pattern: "^gpio([0-9]|1[0-4])$"
+
+      function:
+        enum: [ dmic1_clk, dmic1_data, dmic2_clk, dmic2_data, dmic3_clk,
+                dmic3_data, gpio, i2s1_clk, i2s1_data, i2s1_ws, i2s2_clk,
+                i2s2_data, i2s2_ws, qua_mi2s_data, qua_mi2s_sclk, qua_mi2s_ws,
+                swr_rx_clk, swr_rx_data, swr_tx_clk, swr_tx_data, wsa_swr_clk,
+                wsa_swr_data ]
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
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+
+    lpass_tlmm: pinctrl@33c0000 {
+        compatible = "qcom,sm6350-lpass-lpi-pinctrl";
+        reg = <0x033c0000 0x20000>,
+              <0x03550000 0x10000>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&lpass_tlmm 0 0 15>;
+
+        clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+                 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+        clock-names = "core",
+                      "audio";
+
+        i2s1_active: i2s1-active-state {
+            clk-pins {
+                pins = "gpio6";
+                function = "i2s1_clk";
+                drive-strength = <8>;
+                bias-disable;
+                output-high;
+            };
+
+            ws-pins {
+                pins = "gpio7";
+                function = "i2s1_ws";
+                drive-strength = <8>;
+                bias-disable;
+                output-high;
+            };
+
+            data-pins {
+                pins = "gpio8", "gpio9";
+                function = "i2s1_data";
+                drive-strength = <8>;
+                bias-disable;
+                output-high;
+            };
+        };
+    };

-- 
2.54.0


