Return-Path: <linux-gpio+bounces-34507-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKtFOHApzGkmQgYAu9opvQ
	(envelope-from <linux-gpio+bounces-34507-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 22:07:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84301370FDE
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 22:07:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 534993039B49
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 20:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F9E63CF02B;
	Tue, 31 Mar 2026 20:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o0h475hA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647573CEBA6
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 20:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774987588; cv=none; b=LGT8rHx9wG45mmTG0dvVQ4b8uOHQADJXZA3O2bzKpAsNVRPEeMt9i5Qviji6ALdH5JbeaH4F0qeJjHWDuDWLjh4cexiPSyjRsoImUuAOX324374Og3wIIRxFrPWYzV7pg5x2zkcZ8JUlch+kETxExKeuhoXB+6RIR8mFL0Sqljc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774987588; c=relaxed/simple;
	bh=UGRFSj5Ba3is397uYXqZUWK6BEHYREPYtCW/7pqYOYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mQZChgRKCBg4qUjDeRPiK9+9BEZIwBeBSsrMEmdnv5lAXFvde6Z+omoQcm0plUYYAtJ+muUqFb7HYCb+UjHKsXiDAq9y8Hp0kti0w6XtCbqtpol0zqdxsKDQdTr+nU1a3IJRU3euGH8fFRNMeFx9fShXNMpGIhWBkbd2hmmzkS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o0h475hA; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8a3342d301aso13375736d6.2
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 13:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774987583; x=1775592383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cbcT5PNKPZsRmJFnWFIOFaq96gfL1gOp/mxwODnDkPQ=;
        b=o0h475hAX+8MaUe9AJ4wqo7v0JXkm2eyPNi6fX44fVKWwlvZ4w8m22eDfHNYqNs6qb
         WDOHQy+TMv+nNHUbjW1OCifupaEFeX0fVEp78zQAp13SDTgqwovGtGmVow9wfaERKPfU
         4o2urNJ/qsR6Oo7pPaCt2sehiP+VcTgXQW35wxH48woJGvMPQ5kn7VFENBwEQhnuBT0+
         ueYgHKizaG6gOh+kiU0UbRBoN6rkNKrOsFFQswdbXflQq/eJFfD6pELyw4G0u21toyv6
         wAPLKF2aK+5NemvHrJN5fY3+JzrH0l/45f48XGP66ph1pTqAVyB+K6X9RRlrgKU62Z7s
         lmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774987583; x=1775592383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cbcT5PNKPZsRmJFnWFIOFaq96gfL1gOp/mxwODnDkPQ=;
        b=m98watubomHSwqvRMMrDJOA0ByU7ca7VK3u/Nrq9gkfygSIVduY2Id+IMkW0sA5KMT
         jRvoN5Cbuh8j0vT5lEDgg30fmAb1/618p+NDblrDbcTq7o3/gLzzU9h94LtDtZYY7iqe
         /EvlIfR8KvA/7lQPXHaUKfYglO/xxQSSO3idtXZ0+aIh1uDDwiv097iSuTYoy3IJGg6Z
         DAZVSW/aAH+ZLo0CDVbbMaBx9i3kkkOeBzXb4TL4UHWpG+fw3LaE643ooMM9SB7vd8ZX
         WFDpwJBq2JJ0hvs4Ya0EsSDYs77N2MEzWJD2vTZMFMIdjFGjRAXKTmny3fcDdVen6Lvc
         M2Cg==
X-Forwarded-Encrypted: i=1; AJvYcCW64luZCakhTX0lwEKkl5lzNVbnU+IhRhtceOcJGpG8WGgeQo5A2D0ltdW0bVU0A9/DE0GSoezDj1c9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6hrye2gGiZTmGOG6zQvgOWAbjHlDNG/5xHos1bX2jOP/tz6nS
	aHlE+S/myeA7dPJH8c/jupyoOWtxGwsyb6svPxJByf3UoC5PE5a6dVjI
X-Gm-Gg: ATEYQzxMhXKlrZVkowQBAdco7LLjx+4AvTp3Ww6XglzxuRP56F8i/rZ+t28mKa7LZHd
	XF4/AIDSXWeuALSRfs+yL2GPtpzywmzqFXv1rzpRGpWy/aRswa6oIJZCo3nVVbHJ8jWHGsuuQY+
	wd//e+Dkrkm8Y2KyUxmbgXJaCcEmfkGCqCAlwV7tbaWsCIfChhcaGFSfUIR24VTBoAANxnSywlj
	5U82xzwC0Av25Cshc4bgvvclc1IoYTJnix5wmBGS1DjFb2AQAgK9FWVVHbDuZh0auojQ3zZalEu
	Tofi7tZ4swlCvaxZ1V7XOV+aFkEGOSmTUocG+gkPK+mpRYOtMnSuJsV8QmkEWq5hkgLL5KmjXo+
	eXA2Qa83dOrmbi4QWFM3m7+pmYtHQhkMUuYJkTOxSUAcVQ2SwKz+hMLnSP6ws2K+hZFZPdPo0Xz
	hWpwScRjYzDrpSb4em3piSpiRb
X-Received: by 2002:a05:6214:4f05:b0:89c:ba96:5fd7 with SMTP id 6a1803df08f44-8a43a945af2mr13969096d6.53.1774987583025;
        Tue, 31 Mar 2026 13:06:23 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89f3ba99abbsm92411166d6.28.2026.03.31.13.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 13:06:22 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v5 2/4] dt-bindings: pinctrl: qcom: Add SDM670 LPASS LPI pinctrl
Date: Tue, 31 Mar 2026 16:06:56 -0400
Message-ID: <20260331200658.1306-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331200658.1306-1-mailingradian@gmail.com>
References: <20260331200658.1306-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34507-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,62b40000:email,qualcomm.com:email]
X-Rspamd-Queue-Id: 84301370FDE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the pin controller for the audio Low-Power Island (LPI) on SDM670.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../qcom,sdm670-lpass-lpi-pinctrl.yaml        | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml
new file mode 100644
index 000000000000..c76ad70e6b9f
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
+                i2s1_clk, i2s_data, i2s_ws, lpi_cdc_rst, mclk0, pdm_rx,
+                pdm_sync, pdm_tx, slimbus_clk ]
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


