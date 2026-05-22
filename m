Return-Path: <linux-gpio+bounces-37321-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOTcOuwIEGpXSwYAu9opvQ
	(envelope-from <linux-gpio+bounces-37321-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 09:42:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A26FF5B01A9
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 09:42:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A18A7301DED8
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 07:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7A383A5439;
	Fri, 22 May 2026 07:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SHhh9CrS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aH6bcbhT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52899397B15
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 07:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779435744; cv=none; b=QSlDeVh5M6orb8TNp1XPP6FbhtdSKqlyn08a+qJczaZcWnKpazO0tQlsCE9t7LF25/EsELBy9sS4/etc4JWBGkr1wDybP1mFhSovidkuL6v30Z+90oVgidNo3CGp9onhD8BLaqHu2EAK7bgYX0JMuixUZBEqq3g04+duk7Y5QD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779435744; c=relaxed/simple;
	bh=/5S8FqTn9pprwXUrTw5EcMaoaeRaeApvN7NoS/Sm3W0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LzVgD9GrEmuqioN17D/qZ3NRoIhYTGm09R3mMeH6LR8XMJVeW19++OsTLqAvBMJ/0jhE3dupf1vtVI0iVZIvzlda87L9mgESD+O1st5WX/OzaZ6KK5d2A5wKW0cx2OY4c8vJt7D5hXTSxtuM8tZ45KL5bE3W52KbuiNdxZ8/8OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SHhh9CrS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aH6bcbhT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M37c9O2765185
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 07:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QOVLEge7q3wg6yuYsAC2DLouZrauU5mLa0267pI9bTg=; b=SHhh9CrSHj9tU6AU
	q6Z7zXXkOx2hkcjTpI8Df+InWnb+XSHrggjjLAZGWak+2mIHapibQ/Orxkq8MVAB
	4498h54UYwQr9Y7EQlzHOI/gxvOsH8ri+QYSfGgP7ciUneUTY3/lMCmT/1eVUmtx
	yRLj2Ge6XQ3oclMKHKDTA7HONShzBmDoZaxjquCiTdyZQ5qvxZH2L+5V9c/f300Z
	LD94uu7/8hasu9IRb27Uy6BNCHbN5uh0RfP/6Hd6CUYuKwfxecNF2v5y1nlekn8D
	OfpFsxg/mxP0PHh/kOfgsuv9JbauxMxVRozm9bBF8QktYsfKe2dgAxCh/yIvMdZp
	p3iBLg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea3u7unwv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 07:42:22 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ee5b73c5f2so6494169eec.0
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 00:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779435741; x=1780040541; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QOVLEge7q3wg6yuYsAC2DLouZrauU5mLa0267pI9bTg=;
        b=aH6bcbhTFvlAMQCXqw5VuyiSm5nhNQO+IzYlCzTeJwH9D63xp1Y0NmtvdnlgZLYhD6
         0xpf9JX3Fyi9l1FC8ia6pgpYCoWT+/t9FqtvLnQHdnksgN4fmfPh8Wje3FBjW+ZgOIF8
         /cmmPZSqJqaWUIXBbgf+b0cHXArJ9f4MlLpD9cHnxHbPXnCyn4lRs196+KMV+a4RrUjt
         4Enjak04rD7QKn2peW4GVEv2DAmxYWIbZiL+Eu2Tx5sNowe4SC5krDPMESN4XHzMOGI5
         pcGiM0kwp3jvauBLE3qo+XTq9rItpRGBzGrur4y0OvSn9V4vrAm6scLntTdKoKV63AEo
         Pb6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779435741; x=1780040541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QOVLEge7q3wg6yuYsAC2DLouZrauU5mLa0267pI9bTg=;
        b=iLfnAfssRrNziBEJHIFIE2TMMYGbchvmegcCilwmfBRPOmSaGYJG3B6zKJ4zVmU30E
         5NJxUDpPW1tRn/W/9fzTL8A++616jgMzTApAeSPKej9S8vekEEl2Cuh4YgyP7i1yA7W7
         FlJzbfTtip8DDR6TfxpWXiq2gItg8ddYAjvCzGdRhSYvska6nj3aqVJCvqfxPgdMxkN7
         siJVwjLlkynWqIwYFT/UGoZOawILy4QsXz2YuWQP4kEW3gZbsoMnP3FtNr0gHadY/nU6
         PoYqe9CzexTfR6Y2Z0LRW7EKT3d56khCRPVj1oftajkm+8DpPy/eSVgWSBKsm6/PX4Wz
         8R1Q==
X-Forwarded-Encrypted: i=1; AFNElJ+9v0tXLyjW9OfZ4FUMwRLY8s3YvRHgWD6mnXpItZJ/1vd5XshBIABLY//gLznna/m5zSYUULaTPFLY@vger.kernel.org
X-Gm-Message-State: AOJu0YxrpY1XVu9Btidxuz7jUwPuQajbccjPLrHhQ/x/i29r4JO6Wt0n
	EUFPev9EyNt2iqFwqiu9D14cmRYs3CLjETqmJaYSWqDK53nQ8vffKxb90ZGRqowEgIPwswK8J8S
	IDvBv6qCNKJL8sSBmLwpKGKWRHtEAqyIYOv/V09ATmppOQNt/fdzw6vDLJ/mvDJhFd+L5jTHF
X-Gm-Gg: Acq92OE7oODw+bdLdeqvGAtTixE4xrKdAKnnUQoxihfWDVatAj82KYBszbqDBFt65yE
	VGSBkvqNfh4YLNY0IoDRiflLlQCcPyAt6yiW994/cJZdX3M7lSo7yFrX6Fauto9QxbWkn5kpuJw
	NrbsV3p0Qt6mX71PU5YA1cIqGpI+ZLDeFT9ju3Mp1fx+XPQfzrCq8HFluNtiY85urSqEB6lmCTZ
	Su5+3Vz6POwt3bGwfgF7VapqrkavqWKH5zznPZLJrEvXfM+GX24ZiBs6yKLGY8E+IK8xlSyEKtj
	SmQZ5xt7YC7gDUdn7bIx1oVIUmy7T2o0JCkcBztx1XvbQjrLao1eVXJoJ3g3TzXfnN4LsLtTUse
	IpuJchg0A5CT9EtDzBaDG73kB79v6pBbeJudKIU1Qh3Iwuj4wBzTGRvtCQGNxcosdPv/HioN6
X-Received: by 2002:a05:7300:434a:b0:2f0:c8b5:3dc7 with SMTP id 5a478bee46e88-30449101ddamr1430072eec.22.1779435741086;
        Fri, 22 May 2026 00:42:21 -0700 (PDT)
X-Received: by 2002:a05:7300:434a:b0:2f0:c8b5:3dc7 with SMTP id 5a478bee46e88-30449101ddamr1430056eec.22.1779435740554;
        Fri, 22 May 2026 00:42:20 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3045225b7b6sm529725eec.25.2026.05.22.00.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 00:42:20 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Fri, 22 May 2026 00:42:08 -0700
Subject: [PATCH 1/2] dt-bindings: pinctrl: qcom: Describe Maili TLMM block
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-maili-pinctrl-v1-1-0a6636f5c277@oss.qualcomm.com>
References: <20260522-maili-pinctrl-v1-0-0a6636f5c277@oss.qualcomm.com>
In-Reply-To: <20260522-maili-pinctrl-v1-0-0a6636f5c277@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779435738; l=4883;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=/5S8FqTn9pprwXUrTw5EcMaoaeRaeApvN7NoS/Sm3W0=;
 b=P41PQmslQj4SATL8zGudBanA5Pw9Yw0Y9NyaAUWhl/scyGiL6ld/o3Fv2bREf1h3ZDRaclbEi
 r5fUB6EI6EIDUcoU7vLbjzHqitZwFLLMzQuGWh3luK0pXGWujiEaa26
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=aIXAb79m c=1 sm=1 tr=0 ts=6a1008de cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=bT5XQOCXPleopHcqzpYA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: VEL4HLhErXo3jdH7VXdEJ1mBuaH4OXrS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA3NSBTYWx0ZWRfX4RzB/hzs5BrE
 I241P5OjeTbYHxen6Fp1MQ68MfJU1tEXB+T6lI+YQKipMqcGBAo67Sdt4iZOG9a8AqN6NDX9hAs
 lfq4YTNj/FpMu42FLzVfMHu/Fgya27e2ZTLTxLriaDxgMBSymdJuYGn6eH5pWFtxlxMdiETh8ea
 cPeSq0BWfGhOx/SRlhDUXVA8VIyBfIc4JjXxmS3WDl1DmZDjrLVRiLJVHfa/JzNvBjl1aF5WtNy
 +0YwveMft32MDdWr5iRGHArceUWJkSRFDM2WYyEr1HQKgA015ZwiqhxiH3oWsrH2Hi2QYCWAK1T
 ZcelVWXRaV9SDmWzuxFKJzK05hfvAjb+3o+qA5tJfByM48WCTzRF67JwTzY2vgiqK6+ur0s3Nnd
 j9/IZTsBfCnpb8tcvSG48kr3B40XbzhaQLlh4Bdvqr4tN64LPMdabaagxrmL8Nxh6K1WyHQUQqv
 x9VVzVFxx0j6qENqVtw==
X-Proofpoint-ORIG-GUID: VEL4HLhErXo3jdH7VXdEJ1mBuaH4OXrS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1011 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220075
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-37321-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A26FF5B01A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Top Level Mode Multiplexer (TLMM) in the Qualcomm Maili SoC provides
GPIO and pinctrl functionality for UFS, SDC and 226 GPIO pins.

Add a DeviceTree binding to describe the TLMM block on Qualcomm's Maili
SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,maili-tlmm.yaml          | 120 +++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,maili-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,maili-tlmm.yaml
new file mode 100644
index 000000000000..64fe90b2391b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,maili-tlmm.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,maili-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Maili TLMM block
+
+maintainers:
+  - Jingyi Wang <jingyi.wang@oss.qualcomm.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm Maili SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,maili-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 113
+
+  gpio-line-names:
+    maxItems: 226
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-maili-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-maili-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-maili-tlmm-state:
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
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|20[0-9]|21[0-9]|22[0-5])$"
+            - enum: [ ufs_reset, sdc2_clk, sdc2_cmd, sdc2_data ]
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+        enum: [ gpio, aoss_cti, atest_char, atest_usb, audio_ext_mclk,
+                audio_ref_clk, cam_mclk, cci_async_in, cci_i2c0, cci_i2c1,
+                cci_i2c2, cci_i2c3, cci_timer, coex_espmi, coex_uart1_rx,
+                coex_uart1_tx, dbg_out_clk, ddr_bist, ddr_pxi, dp_hot, egpio,
+                gcc_gp, gnss_adc, host2wlan_sol, host_rst, i2chub0_se0,
+                i2chub0_se1, i2chub0_se2, i2chub0_se3, i2chub0_se4, i2s0, i2s1,
+                ibi_i3c, ibi_i3c_qup5_se0, jitter_bist, mdp_esync0, mdp_esync1,
+                mdp_esync2, mdp_vsync, mdp_vsync_e, mdp_vsync_p, mdp_vsync0_out,
+                mdp_vsync1_out, mdp_vsync2_out, mdp_vsync3_out, mdp_vsync5_out,
+                modem_pps_in, modem_pps_out, nav_gpio, nav_gpio0, nav_gpio3,
+                nav_rffe, pcie0_clk_req_n, pcie1_clk_req_n, pcie1_rst_n,
+                phase_flag, pll_bist_sync, pll_clk_aux, qdss_cti, qlink, qspi,
+                qspi_clk, qspi_cs, qup1_se0, qup1_se1, qup1_se2, qup1_se3,
+                qup1_se4, qup1_se5, qup1_se6, qup1_se7, qup2_se0, qup2_se1,
+                qup2_se2, qup2_se3, qup2_se4_01, qup2_se4_23, qup3_se0,
+                qup3_se1, qup3_se2, qup3_se3, qup3_se4, qup3_se5, qup4_se0,
+                qup4_se1, qup4_se2, qup4_se3_01, qup4_se3_23, qup4_se3_l3,
+                qup4_se4_01, qup4_se4_23, qup4_se4_l3, qup5_se0, rng_rosc,
+                sd_write_protect, sdc2_clk, sdc2_cmd, sdc2_data, sdc2_rclk,
+                sdc4_clk, sdc4_cmd, sdc4_data, sys_throttle, tb_trig_sdc,
+                tmess_rng, tsense_clm, tsense_pwm, uim0, uim1, usb0_hs, usb_phy,
+                vfr, vsense_trigger_mirnat, wcn_sw ]
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
+    tlmm: pinctrl@f100000 {
+        compatible = "qcom,maili-tlmm";
+        reg = <0x0f100000 0x300000>;
+        interrupts = <GIC_ESPI 272 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 227>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        qup-uart7-state {
+          pins = "gpio62", "gpio63";
+          function = "qup1_se7";
+        };
+    };
+...

-- 
2.34.1


