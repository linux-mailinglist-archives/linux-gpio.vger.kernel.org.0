Return-Path: <linux-gpio+bounces-35794-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wL72OVkE8mlYmgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35794-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 15:15:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2544149499C
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 15:15:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1A60730241DA
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 13:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7B593FCB2B;
	Wed, 29 Apr 2026 13:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XnbW4eR9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SoOp0auG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CBD3FBED9
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 13:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777468334; cv=none; b=DYrGGWrl+TnPbfqQvy3qyOgPTB6vsDQhZ5GQYNlqlejdVrqDpmDJako+9QRo29rvGz+azXGFXsKXAEflVH/USMQ+YVyCk3irq2E+OPAoY1w+jgha0VLJSOMf2hre+Yx7gSvxj6aij5+6M49Hf6ixTxpbwW5iHZSiVILb7P/Qoss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777468334; c=relaxed/simple;
	bh=5FeJwkn0w0hoFaU+H21wk2uMRmNaRakanqYwZuX9Z0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FnIM63nq+BdsmBZVJiNtGnNv/2mmynZo61XZBVjUTeYAwAMOO6Z46Z5S/iLY0wgD+AzT64dh9riwVIyJ7HPi9G1PchFeduKUvwlFIH1S0gBmL3O04vveCfzoXiiMVFlHT2xOQGQK/9JvtXhblpXokkKVYciPn5sKNbUr9I4Acx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XnbW4eR9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SoOp0auG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pnIE901599
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 13:12:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TGkFDtlKiI2veKivqw5MXYpsgYHsHTZr/F0pOrS2oiE=; b=XnbW4eR9hu6wr+fe
	tuUGGpL30RjI7YIXVnBBO8gCaPnnk25pwLjpn++ktExQuXoe6sEdEmnuvDXrJDes
	/JqlqSlu7n0XuiCU0GDs9wZkVxvK2dvS9ApeIz3RPPjZe/UAf8jWwkLiy49ygtwc
	oHcB1hXrmfIYI9R/QVn5KLTrXnXw9+hkg6U6lJUtt+CytORtWNAPGZDhJXaoRwRo
	xq/qWi94ReW6Vf9WN3PsFqZT2dh1RtJhi94bP6ZlCZ4lDVqXGcibJxvbCVB583oO
	nis8Etx6bwV+ChTESz4UJPqkR9hIUh/6QI+yl0lysLcfB6fomK7ajuxvfOiUo36V
	Nyg8IA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dubq9hssq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 13:12:12 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c70ea91bfe1so6699794a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 06:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777468331; x=1778073131; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TGkFDtlKiI2veKivqw5MXYpsgYHsHTZr/F0pOrS2oiE=;
        b=SoOp0auGAZwej7lGyjw5AfMiCljTTdmzUgQqlL6go/gnUyVG52Y4N6Y+0tygDCurQU
         Ma56JuDfEA4I3hpRVJrjyyVUF1FngWZ7mpjXLoJL3MhihwM+FCpb5Vmte4WykC3JMO7K
         gaT1MLIeedw73irkgMcS3pXgn+ncJkt6PApqGCbu3RFDv1z9xz54uARO1C/a+ZcIEYc3
         1+W2IcbOp7vNPRYfJfwNJcR0JXfY0T/khybB+MMkN43t3PjmYVFH2AcQu3RVAgj4RJWH
         R7ExcKPS04CcKUzTWJYuN+oQF4h7BOdhQiNuGp4QJemTAvORwhFIooCXLArLebEelaQN
         iJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777468331; x=1778073131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TGkFDtlKiI2veKivqw5MXYpsgYHsHTZr/F0pOrS2oiE=;
        b=H3Yi/AaCvI7534ZGTAl7dV7PMfGbqvKtNN8hsfzHy+D9gGsQsNFEHMyfnPE1rQ7IIE
         xIxezwUNpsavsU7/2mzhtmW++tf+VZHOU0las1/qXECmcUf6qrqJ5syRkou2idJZ8MiK
         oCgWCsXOvOuUZW1qXQPYEFNNIarO2uWfNIstoJ8RhHtTSXnHV6Mmwj/QAMRiod96V7hm
         unlI6imjkil5blZ59bITRmYaBztIg1X47cFQHN4fXsYndWC3lcGUy+zQKWVXmTcPILui
         2tOl5p8xgDVv/8WdRlkirqxQfm7/7dUPvUQqLS5xGLF7pM5DucPOoufnSvwJJgUDGJyz
         kNJg==
X-Forwarded-Encrypted: i=1; AFNElJ8+GkMO/ZaIjfC4jmxqVClpaqVoZGYDPEQR+ZiA7MQyIc1KFL65cM3NQktPC1WwTM75e+QWQVfJm6CI@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa6AhGn19LgV1npAlFYGRidOBlOfYQuNP8hBMCR+ty+NkaZQ1f
	gO8QiyVxczVLczDv1rZMIuh5uDkgvXb8F5I4kHwgfkRMdke/WSDGagyOY5scmy9D5HE2JVVeRTq
	JVxMk3u/Ks98TmY/qXkd7jmpvvPwhzJRdMZ1fpcHSvztffoUtOm1+6196OGvpm4Oe
X-Gm-Gg: AeBDieux7sp6W3hPE9mWbsxYk8ZV0xn5faAaJuxcdn8DX8RvoLQRwziCx+R9dwzgRAz
	Dtg/BnlqgxXDjgOSwmkHIgnzNUQaDU7CYxWVIOa/hlegmGUgthziydPLprZDtsCwNZUPaZF4Mri
	CXu2h8F7EYa7KUZzU4QTld1r0DmyBQMJQ8ectzAEdlUgsbhrzwcCBmG4mtgM0YJq+eXWBjXkCv4
	BVdMKJyWOkxnyxJbVucgAmF71f9WBcUWKT7c6du3RQ31JicVRd/Pm8LTfXg3M2cvO0Kh6Un+nE0
	3IocTiX/dHp6e03nhUaYyMAPCXnFSLFF9FsCHixSY4odEUgG2r4y/jpYDG9aOq3F1FgEVHNhBaS
	YexOvcVuXwk4IrAEfftI+r034UPtFT+6NftIY4aiiPIqgEZU=
X-Received: by 2002:a05:6a21:33a7:b0:39b:dea7:5626 with SMTP id adf61e73a8af0-3a3af625869mr4368767637.35.1777468331255;
        Wed, 29 Apr 2026 06:12:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:33a7:b0:39b:dea7:5626 with SMTP id adf61e73a8af0-3a3af625869mr4368698637.35.1777468330599;
        Wed, 29 Apr 2026 06:12:10 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed6decf3sm2063025b3a.31.2026.04.29.06.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:12:10 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 18:41:56 +0530
Subject: [PATCH 1/2] dt-bindings: pinctrl: qcom: Document Shikra Top Level
 Mode Multiplexer
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-shikra-pinctrl-v1-1-1b4bb2b3a8d6@oss.qualcomm.com>
References: <20260429-shikra-pinctrl-v1-0-1b4bb2b3a8d6@oss.qualcomm.com>
In-Reply-To: <20260429-shikra-pinctrl-v1-0-1b4bb2b3a8d6@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777468321; l=4446;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=5FeJwkn0w0hoFaU+H21wk2uMRmNaRakanqYwZuX9Z0c=;
 b=5jYkUxcG5qPe/fWWUGltzwDAgJLZr6glLKzLyJP+03Re8Cc4tJBsVZ9G9sEMEt6u+w9eaRTWw
 V+XLS/mm+G9AuFu3CCoI/hgR3eMkZjKVQcDn8YkI3I5xRZWPMyf3+Ol
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: nyB0iznwLxSUIZbxaUauE5cEFEaHqa0x
X-Proofpoint-ORIG-GUID: nyB0iznwLxSUIZbxaUauE5cEFEaHqa0x
X-Authority-Analysis: v=2.4 cv=Wak8rUhX c=1 sm=1 tr=0 ts=69f203ac cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=bT5XQOCXPleopHcqzpYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEzNCBTYWx0ZWRfX5eST+fxizbLX
 qsDd96F40Dn6ksR3F4wlwpZXgQSBGXP34UI5u6jpShgNuV3vj9NnJRBbtic+OwW8eyvkIbWw5CA
 ifJaZ4HB7EMDJtEcJcdhKJrJTd/9idkpForu4en3qeAcMv/sQy/59A3dELuGSdlbkxqGbCO90bv
 09hAgzeSG2rX4R2xYA3yICuRGu7+beANiFGwuGMHA48HprhDQgFRStqFD6tt1kzBxcl48mmwG/m
 53CkbdaQf3QaJ4FdKUprtKTUNU2u4eZwLWD1T0KyhbRPUGjV/B7qlVKZN4jtT0uxhHD0QHhJZeV
 th4gTilnyWR/uH1c8lB7FHHFCGuTsOHD0Mz5ONvSXoTd7K+liqj+QfSWgfocproNojwVbSc3Ika
 XWDEaHX7Oy7jHMX69Wyt93+btUrZ0LmsEmJ/mxwRCUU8U8iE4KmRCWKAlUjZzB5lUchCTcrgOU5
 90jGDLgsGjCatMT/hKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1011
 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290134
X-Rspamd-Queue-Id: 2544149499C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35794-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,devicetree.org:url,0.7.161.32:email];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add a DeviceTree binding to describe the TLMM block on Qualcomm's
Shikra SoC.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,shikra-tlmm.yaml         | 123 +++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml
new file mode 100644
index 000000000000..896fbe461ef9
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,shikra-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Shikra TLMM block
+
+maintainers:
+  - Komal Bajaj <komal.bajaj@oss.qualcomm.com>
+
+description: |
+  Top Level Mode Multiplexer pin controller in Qualcomm Shikra SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,shikra-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 83
+
+  gpio-line-names:
+    maxItems: 165
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-shikra-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-shikra-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-shikra-tlmm-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          oneOf:
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-5][0-9]|16[0-5])$"
+            - enum: [ sdc1_rclk, sdc1_clk, sdc1_cmd, sdc1_data,
+                      sdc2_clk, sdc2_cmd, sdc2_data ]
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+        enum: [ gpio, agera_pll, atest_bbrx, atest_char, atest_gpsadc,
+                atest_tsens, atest_usb, cam_mclk, cci_async, cci_i2c0,
+                cci_i2c1, cci_timer, char_exec, cri_trng, dac_calib,
+                dbg_out_clk, ddr_bist, ddr_pxi, dmic, emac_dll, emac_mcg,
+                emac_phy, emac0_ptp_aux, emac0_ptp_pps, emac1_ptp_aux,
+                emac1_ptp_pps, ext_mclk, gcc_gp, gsm0_tx, i2s0, i2s1,
+                i2s2, i2s3, jitter_bist, m_voc, mdp_vsync_e, mdp_vsync_out0,
+                mdp_vsync_out1, mdp_vsync_p, mdp_vsync_s, mpm_pwr, mss_lte,
+                nav_gpio, pa_indicator_or, pbs_in, pbs_out, pcie0_clk_req_n,
+                phase_flag, pll, prng_rosc, pwm, qdss_cti, qup0_se0,
+                qup0_se1, qup0_se1_01, qup0_se1_23, qup0_se2, qup0_se3_01,
+                qup0_se3_23, qup0_se4_01, qup0_se4_23, qup0_se5, qup0_se6,
+                qup0_se7_01, qup0_se7_23, qup0_se8, qup0_se9, qup0_se9_01,
+                qup0_se9_23, rgmii, sd_write_protect, sdc_cdc, sdc_tb_trig,
+                ssbi_wtr, swr0_rx, swr0_tx, tgu_ch_trigout, tsc_async,
+                tsense_pwm, uim1, uim2, unused_adsp, unused_gsm1, usb0_phy_ps,
+                vfr, vsense_trigger_mirnat, wlan ]
+
+    required:
+      - pins
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    tlmm: pinctrl@500000 {
+        compatible = "qcom,shikra-tlmm";
+        reg = <0x00500000 0x800000>;
+
+        interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        gpio-ranges = <&tlmm 0 0 166>;
+
+        qup-uart0-default-state {
+            pins = "gpio0", "gpio1";
+            function = "qup0_se1";
+            drive-strength = <2>;
+            bias-disable;
+        };
+    };
+...

-- 
2.34.1


