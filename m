Return-Path: <linux-gpio+bounces-28548-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC17C61965
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Nov 2025 18:17:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 548E629207
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Nov 2025 17:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11E4830FC03;
	Sun, 16 Nov 2025 17:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OOSA0BYf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z3l320S3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4004330F93A
	for <linux-gpio@vger.kernel.org>; Sun, 16 Nov 2025 17:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763313450; cv=none; b=LBybBKcWAmad11doKUqeK4Az7xUD1AiTEdaVPl+uEWdwjVSsSWqpum/MwOKRSqEoTqJ9aWOrln7D57ACQV47BQ30tEgy+gh/5NsAsh/4Jp8BEhdquUrxpzb4blmN0M8rR/RlTis0iIs2mWhfr9lRglKJc003prbiNFhZ/xyEQ64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763313450; c=relaxed/simple;
	bh=qVQ7MgLwMoRb19gZqOj0mnM+YUBQQZt1A4iGUiPqPd0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P1o+pPNNL8tNTuCePff9sPMjS7+B//aniZAfFdpm3IMtyCgtM8s8JAVcJrK1vVLY3FrWPx8WWFlg2sQA4IwI+ZLrZF84qRKRaCwYipn0wLebWmiWiRce2f30dbFW/toB2vdAOL4qPw/dkB4W89wEr4EWuHd2MU4IB1UCkXod5us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OOSA0BYf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z3l320S3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AGFD5pV1263795
	for <linux-gpio@vger.kernel.org>; Sun, 16 Nov 2025 17:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nUHorLzPKsp
	Z4LAzPRajtYXr+jD+rV3DcddI5DNygq4=; b=OOSA0BYfnRLXkabtrgG9Ag8zSf1
	+1eMRlFCB5xrT6XgijJMG39iKjVlvxVHYJsRTMWiNiEHTlg8vqSBuu5H1kXEcRag
	a8gU22icBuhPUzUMY1w6bIQcPp9QI6/6jLlF9eyNSIwnGzkHyexLsCw9jla8Bq+/
	gAF5tv2jt2//VswNLJabCjjUwoE+edb4rZ0hsz+jRfrIrXCM6BbRmwNyIpWFS6q8
	di+hA6aw15/Pd0+amAo7N7MnW7MebmLZ+nG9HZdOw8idhZX45mqHtB//EvU6VXUk
	hfs05XLphTry62/Zy19qRCTk/96fyuRjkrt73RL54IQTkfYenoQnHPaJLAg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejgcadfc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sun, 16 Nov 2025 17:17:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297e66542afso116503225ad.3
        for <linux-gpio@vger.kernel.org>; Sun, 16 Nov 2025 09:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763313448; x=1763918248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nUHorLzPKspZ4LAzPRajtYXr+jD+rV3DcddI5DNygq4=;
        b=Z3l320S3w5J6PfKS7fOyAwn0Y+LQOmZ6PvMql6mtLEtmqp+skXeer6OKlvg3C1Bw8f
         rv++HXe6guszZtgUEWpVkyRBVeO32R8OYYANDhgUw+Yy7Exz+dfkiKJ53vI0zWSxxR0a
         pBqF58/NLFEA5aZW/lIpi4yHm/F6wn5o01GXAy3JlaDl9Um7Il53mYAABWgbm6cMpIvX
         KDsaXu6UEc8j0KWPqqS/DG9iWVaJKej5FBA/9cYtBJtyLwAasdudTaiSEFAhH0+bTwV6
         xP/ChNkJy/16wD40o5TzkXTKpXkgnyenrVZ5J8wgGWn5qybAqilanIDZ4jvHtw+kesMU
         5u+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763313448; x=1763918248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nUHorLzPKspZ4LAzPRajtYXr+jD+rV3DcddI5DNygq4=;
        b=Qmcr6e3J37XItsePwN4KDJgCbf56DTdWfQuuOcDPHmXhZyNrU64GfaNsNliD/4vkvU
         KgTvuL4LsHGZfPEaZKsAJ8kc1euFTyPPkLNylXtgwa1qRmVUT75hYpFJ4sMBmViiXfu6
         8oLGM54XOP36y3YZB9yQmhC+7Hefjja9q2v7haU3rogxQkJo0ydGgVJQcV40PNnjDgg4
         h8R18qJ3SUeA0GC7OGFEqM6rZymfplDc5py92QTYs6TrjjnwafFD4Ut41s90/HcpRwsJ
         h7qVDNdUOeNaEpzI3NlnJl0FDWxU9W4kdqhx2N9jJbwXNspyY0cZSothtRFkFw48V4Gw
         5pWg==
X-Forwarded-Encrypted: i=1; AJvYcCW0xNEf1v2ARrgHlmEEVtSBYEaYivLshbSXq9/HX4CUfVIL6lnz2PvUdb0qKTzxXBO9AA4ptl/Q0OlW@vger.kernel.org
X-Gm-Message-State: AOJu0YwAMILwEsYLlq2NiuP+7afVLOGHCxAL0FU/nr9VQjssRN/ACutC
	t2HnW11vFSj8aq57ixMbokur3/r+nSQRDzEDEbsT5tSV64vUjR9OwX92C1etOtBbMusTmPiLDB2
	Oi3eRiIQb6Ia+wlORVr2yTPZplnrLjDXi3PL0JKEz4+vOoi/5ItGUwR5gXe/jPBwJ
X-Gm-Gg: ASbGncunrHCuCY4P05Y4mEIQrF5IqEIvlLrYYa8n5WMdeLu85mlNHa9Jhyslwn4JKRs
	cacB0FhuHGJdT627r5HZl/kbqa4LwSB3QrqeK1j0//xbCpFE69tlViPVvlKYK8/JVUDuACCFNXA
	PGd+z2Jzr+Z15196gsWcnLNVhGDSiA3dqbu2cfeZqVasooa8OAtwB8EDLZ6iHnthRHjXTsrDWjS
	UPTxaRRFiof90DovVaxrOgwB470tmaXfc8DezlumeU5EphgHT/Lct0sQg6HEPZmtLNuWggLJ+af
	tp0w0QDtx69bbe7q0fR//SsLrNy7zLHXv+eoJ/IzB+yk8dkO+1Jt/TRd+idr+U3DcIqI1iaj7rN
	hd/Zzuy5qDVOP6Rn/lh4kR+X1Lb/r/s5Wd4Q=
X-Received: by 2002:a17:903:1a83:b0:24c:c8e7:60b5 with SMTP id d9443c01a7336-2986a6d0be5mr103796515ad.16.1763313447616;
        Sun, 16 Nov 2025 09:17:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMosf+0OrK8gxy5TROtRytIqoJko6uovacw6wQn8WBNdTZ4LXvAxVD9pe6pbBePVNyn89vxQ==
X-Received: by 2002:a17:903:1a83:b0:24c:c8e7:60b5 with SMTP id d9443c01a7336-2986a6d0be5mr103796225ad.16.1763313447126;
        Sun, 16 Nov 2025 09:17:27 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b1055sm114415105ad.59.2025.11.16.09.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 09:17:26 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com,
        ravi.hothi@oss.qualcomm.com
Subject: [PATCH v1 1/2] dt-bindings: pinctrl: qcom,sa8775p-lpass-lpi-pinctrl: Add SA8775P LPASS pinctrl
Date: Sun, 16 Nov 2025 22:46:55 +0530
Message-Id: <20251116171656.3105461-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251116171656.3105461-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20251116171656.3105461-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: oPt2_Sr5BO5w1XnIb5dnOR0nVE6cgRWy
X-Proofpoint-GUID: oPt2_Sr5BO5w1XnIb5dnOR0nVE6cgRWy
X-Authority-Analysis: v=2.4 cv=PJECOPqC c=1 sm=1 tr=0 ts=691a0728 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=CaveSyEksWnKhASb3GUA:9
 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE2MDE0MyBTYWx0ZWRfXx0dtbMDe2rx5
 KFKLHm7SmP66EBWJEL5eFRlnnfLimxkKqo7pIWQYWHzOdiC+E+jR6U3wajO3UqCS+qY343XTpjD
 rQNmIklt4Xxxl/11ExGJQhPUerXAEYw5eT/GUmfM+vd7CrCMfw46ridblZQ0RfvrEvUNJ6AeAjV
 yBFnM26dCIKVZDGsKnBlQOyEwcqaX5dgP7X0gLMcycq2ne6GepzOt58qO0+6hiwi+diL370DhVh
 6pRREG6bQtoAJbr/zwRj4jKCHXIgKL7aFbUbl/TNrw4e2dn9qPExeMwoTYBsipRcX0ZspaZSzpZ
 B+AFgXUSHxeidTZXE9AanM7pmXm0k/v0dVTRdm+M+mGQwicuVmiTzxn+uGkHdzFWZJ4BFUMzi9n
 p76ExUhnoovzhlI48eM8OHzJ1t8C9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-16_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1011 spamscore=0 phishscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511160143

Add bindings for the pin controller in Low Power Audio SubSystem (LPASS)
of Qualcomm SA8775P SoC.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../qcom,sa8775p-lpass-lpi-pinctrl.yaml       | 106 ++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-lpass-lpi-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-lpass-lpi-pinctrl.yaml
new file mode 100644
index 000000000000..01a56dbeaeff
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-lpass-lpi-pinctrl.yaml
@@ -0,0 +1,106 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,sa8775p-lpass-lpi-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SA8775P SoC LPASS LPI TLMM
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in the Low Power Audio SubSystem
+  (LPASS) Low Power Island (LPI) of Qualcomm SA8775P SoC.
+
+properties:
+  compatible:
+    const: qcom,sa8775p-lpass-lpi-pinctrl
+
+  reg:
+    items:
+      - description: LPASS LPI TLMM Control and Status registers
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
+      - $ref: "#/$defs/qcom-sa8775p-lpass-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-sa8775p-lpass-state"
+        additionalProperties: false
+
+$defs:
+  qcom-sa8775p-lpass-state:
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
+          pattern: "^gpio([0-9]|1[0-9]|2[0-2])$"
+
+      function:
+        enum: [dmic1_clk, dmic1_data, dmic2_clk, dmic2_data, dmic3_clk,
+               dmic3_data, dmic4_clk, dmic4_data, ext_mclk1_a, ext_mclk1_b,
+               ext_mclk1_c, ext_mclk1_d, ext_mclk1_e, i2s1_clk, i2s1_data,
+               i2s1_ws, i2s2_clk, i2s2_data, i2s2_ws, i2s3_clk, i2s3_data,
+               i2s3_ws, i2s4_clk, i2s4_data, i2s4_ws, qua_mi2s_sclk,
+               qua_mi2s_data, qua_mi2s_ws, slimbus_clk, slimbus_data,
+               swr_rx_clk, swr_rx_data, swr_tx_clk, swr_tx_data, wsa_swr_clk,
+               wsa_swr_data, wsa2_swr_clk, wsa2_swr_data]
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
+    lpass_tlmm: pinctrl@3440000 {
+        compatible = "qcom,sa8775p-lpass-lpi-pinctrl";
+        reg = <0x0 0x03440000 0x0 0x20000>;
+
+        clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+                 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+        clock-names = "core", "audio";
+
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&lpass_tlmm 0 0 23>;
+
+        tx-swr-sleep-clk-state {
+            pins = "gpio0";
+            function = "swr_tx_clk";
+            drive-strength = <2>;
+            bias-pull-down;
+        };
+    };
-- 
2.34.1


