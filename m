Return-Path: <linux-gpio+bounces-34377-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uG07K4YBymns4AUAu9opvQ
	(envelope-from <linux-gpio+bounces-34377-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 06:52:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B68355630
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 06:52:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED69B302BA7D
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 04:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB9B8313552;
	Mon, 30 Mar 2026 04:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o9DWAo86";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UJsHhCTC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8173815D4
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 04:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774846278; cv=none; b=mcROaxfZTq6C4d9NtL1AE92ObSOfC/Gz/DxEmTX470G6FPWqfzvEB80lA59ypsmeRbBwR1BXt/9608KPXvLNQYnKOXUIrYbnh2/9GFlViJdU7p9V7iSve0Sb7g8diMwNqzWnWsUWBQoFmmQD/iRERS+oym8gB//wpnJ4TJUq+U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774846278; c=relaxed/simple;
	bh=tLchpEgPCkvPm7qfKOSp9d2qNwRW0ilNuzY7CLoJBY4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A2ThtLxo3dcjeR+m7yzX5yOwAOjtPnXeIJu63cdIXawnzUs3ZFhgE+tQ0TJRvVdZtgD8nHn+4DBlQqfQ3Cl10T521ZercfavmRVhjPPt51SA4ahM1+VKyi3Ty8kYYhKshQwBpvHhybSELh4HLGCczvSOmMsKYTHc0IdjKHh7KGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o9DWAo86; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UJsHhCTC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TMF2UM3164030
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 04:51:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lUsVCl0T35eAKz3l0S6xURNNzTPdZMSFqpE5p6qQzeY=; b=o9DWAo86162lVWY0
	hVAL5Rr90b6uQH7hkYUceZCm75BYvQfgcA1ZUKQER672wSg6n5e9h5cU2Qhp61mZ
	ZY3F0ptihIS3K+lumsvXhgV2i45SH9+7666P0R1UnHFg1xEv8wDYk04WCIjDuu/C
	MGuY7sZgQfzELbETsH+kqcf4qm4u/cvLDkY+lGgLfY53AqTPRLeaWoPI6cklRmX5
	czwsTv6r9DlE7ECASiXm1TbEgJn0Wz+vBt4pC5Mgyq4lN+t+qarzQhoIoua6zGOd
	LxS9RPny9NGXoyUYiuU+LpIcjEc7WypNbRwzW8OcSQkC4HaKSGMzKMDanmhpaSMU
	NVGOoA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6ufmjh01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 04:51:15 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c74217894d9so2621279a12.2
        for <linux-gpio@vger.kernel.org>; Sun, 29 Mar 2026 21:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774846274; x=1775451074; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lUsVCl0T35eAKz3l0S6xURNNzTPdZMSFqpE5p6qQzeY=;
        b=UJsHhCTCDErJvZYg1f8bkf15GHoNFy8igoCQ6JxhhdC3OzndBfkuizfDqeDk0C3so5
         Vdx7gwcycu8AQUyzHVCy2xZ1o7tOmD8z9X0QNZQOTERJQ0wnDbZGsdZqCNgHJ8N7GLKm
         2OHHYwAHATx44RZP/yZvPERMNFqpFRryNeVpLt0BkbrkI1IjfiKP0IT7EtMbK7IB9SlU
         nhX9BGx0UJguktWD7cyX+Ry03iNMedCb0g7jBkUV7ICsMGVAAxsIsuSx8l/r61rsfJmP
         gEtYHgrJyv82D//c0E/pnXpq9U0vS7Ae2/7sI23fby9uz78R9OJk+aYGPYdO4C6Kv3QL
         5Dhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774846274; x=1775451074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lUsVCl0T35eAKz3l0S6xURNNzTPdZMSFqpE5p6qQzeY=;
        b=ZZhfrVvgP/uW4ccKCGXl8tOZ3hRYJfq1+qOugM4kc/M4tl8SjQJyqsVKOI0h6RsvQn
         S1ZI0UknHW+p7Jvvm/k2+gJua+bNiTvnTPc4Xb9QuDXZwLi4XDQNtvGhVKUpBMyMgxBN
         RWyqNRPhTpWps8Vas/jCQ+IycV/xjWrZPu18ZdrVSz3lctjnqWvsvnll9G4NMBH1/HpF
         xFQmf5Ljj604Zc3bZ2jaJEr5G48jevNTTeTNpP9lXEDPAdGilabi5nUceij9yxkTQnNx
         IlBjqSjyEv7HCfq9KJKb34Xig1YylGfE8Jv62sejClU7SXYSRgfJFKnZEPx6pXJUnbnl
         btRA==
X-Forwarded-Encrypted: i=1; AJvYcCVY8ZQehciap2fD4mcwJrjJpB8/auywPwnHoODEaq+NJ22WIpPmKLQ/oITTYdqHQGZ2neWhi5/IYiF5@vger.kernel.org
X-Gm-Message-State: AOJu0YxtJuL1JWTgGcAeyidj7AIlXSeZHArUTCdIQVZpP9hizWakRMdI
	yhyf3GqwjuGiynWVeGX0gERGy8lxYhjxtwh2dMPzWo0grOhwTDr29WZFJbRvMPdE+pfGqMxviej
	6IzrJSctqM9ZVvESERG3XCotRC4gEgsGWINpor22DpKEVJxR8DBD+5409gGB4ScWa
X-Gm-Gg: ATEYQzzTZ07neDobAoFmvhqblx8lpn3T96y1ZtSan+e2cvPYxmDSK+ZhekjmzxLUoL8
	yyLcXF5oSgKYxhJTTEkwy9+C+aO40TeY1+jdXpQNeIs6ItYosxcsjMYp24lGLsAvZz2K2uzMRm6
	KnSO0VIYOjwCfXMhkIVb+lCCnsUKyawmOnCowzMxwnjGzM9K+KjjggEOrazNoawQviX3xEdsn/P
	7w+mQt+RgwvkVehp81lxO6QpSqAboqvXyzATT13IfpasC/8a8ppCngw+ZZdKe2fr/+gTXyFWNEc
	t1KMWs5MXUfeuBG4hwyqOhVI0Jpq08xVjYzXT0+wxYXLQEdDY+/MBnUdMrwIM/2BsKX/HfWE4V8
	NOVat3B/s73h89NEYlCQcRcfj5oV6i8fZ1IRPKlue6XSd5awJODBy8UA5ipNl81dpCmi0E3qXH8
	w/szlSTgFsCPSn79Tc28MPIvYfuLR9GYAVifjlohkLQ86iQRlJ5RnvI9ZC
X-Received: by 2002:a05:6a00:10d5:b0:829:88e7:c88b with SMTP id d2e1a72fcca58-82c95e6983cmr10672110b3a.19.1774846274286;
        Sun, 29 Mar 2026 21:51:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:10d5:b0:829:88e7:c88b with SMTP id d2e1a72fcca58-82c95e6983cmr10672092b3a.19.1774846273823;
        Sun, 29 Mar 2026 21:51:13 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843e1desm6776896b3a.4.2026.03.29.21.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 21:51:13 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 10:21:04 +0530
Subject: [PATCH v4 1/2] dt-bindings: pinctrl: qcom: add IPQ5210 pinctrl
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-ipq5210_tlmm-v4-1-b7c40c5429e5@oss.qualcomm.com>
References: <20260330-ipq5210_tlmm-v4-0-b7c40c5429e5@oss.qualcomm.com>
In-Reply-To: <20260330-ipq5210_tlmm-v4-0-b7c40c5429e5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774846266; l=5049;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=tLchpEgPCkvPm7qfKOSp9d2qNwRW0ilNuzY7CLoJBY4=;
 b=vKQzpV8Lorvo3wND4UgxNl1t6Zc8Sb55B66wm7YsURVzoZGmsjHs08+NNK1Gcq89sDLZZdRYF
 LKoYKUiymbTCuhQMprP8tFJe/hoHLIiC3+VaNh52pVIGwWNleLpZptC
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDAzNSBTYWx0ZWRfX5d4K4JECf9hh
 CePpKxB2baQphmRE4PLa12RIoNDu8wF1RarzWuEfgx0127Tp8li5Ppy7v+Au199QR4XXykVLFjE
 IWhEH1GglG/eB+e6HHagt0E1c917Ph1a2WMwCOOOVBQZdVw6uI03PVoHhkQ2Y52unER7dP12DHt
 4HAQiyGaUagRZch2lU2she95CffrbzsIVP93r/fQrOFtNv4KPZghkgNFK0UFMsREPbEE/rvMAUw
 vw5FMe0u3l1qT8ZO1VaLVRkNJvNo0dNtkWOPMxlbmeOipx5cTcIBHkqcw83G16MBCRClb3J6ZsM
 bJYUmTBopGfLG0db0yxewWA4OnL3nsNB9rKdLcRsdl18VEj4FMTQES7jTnJTUL8pIgUR/UTMmV4
 420/JjnIoyVFp462WsOaljHFZGbJRa0ti1SKtVSGwtfnZTjVtuYMwndN3gpJ2vwk2PGqs+Y6o4d
 pgZIa0zNLbR5xUXtCIQ==
X-Authority-Analysis: v=2.4 cv=aOT9aL9m c=1 sm=1 tr=0 ts=69ca0143 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oSdKyVnxDMwtS7CNbvIA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: PZ_Xk8GHyL_M-2Z6zTlw1czvHjmU0nBF
X-Proofpoint-GUID: PZ_Xk8GHyL_M-2Z6zTlw1czvHjmU0nBF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300035
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-34377-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 15B68355630
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add device tree bindings for IPQ5210 TLMM block.

Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,ipq5210-tlmm.yaml        | 123 +++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq5210-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq5210-tlmm.yaml
new file mode 100644
index 000000000000..12c5e76235a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq5210-tlmm.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,ipq5210-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm IPQ5210 TLMM pin controller
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm IPQ5210 SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,ipq5210-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 27
+
+  gpio-line-names:
+    maxItems: 54
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-ipq5210-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-ipq5210-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-ipq5210-tlmm-state:
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
+          pattern: "^gpio([0-9]|[1-4][0-9]|5[0-3])$"
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+        enum: [ atest_char_start, atest_char_status0, atest_char_status1,
+                atest_char_status2, atest_char_status3, atest_tic_en, audio_pri,
+                audio_pri_mclk_out0, audio_pri_mclk_in0, audio_pri_mclk_out1,
+                audio_pri_mclk_in1, audio_pri_mclk_out2, audio_pri_mclk_in2,
+                audio_pri_mclk_out3, audio_pri_mclk_in3, audio_sec,
+                audio_sec_mclk_out0, audio_sec_mclk_in0, audio_sec_mclk_out1,
+                audio_sec_mclk_in1, audio_sec_mclk_out2, audio_sec_mclk_in2,
+                audio_sec_mclk_out3, audio_sec_mclk_in3, core_voltage_0,
+                cri_trng0, cri_trng1, cri_trng2, cri_trng3, dbg_out_clk, dg_out,
+                gcc_plltest_bypassnl, gcc_plltest_resetn, gcc_tlmm, gpio, led0,
+                led1, led2, mdc_mst, mdc_slv0, mdc_slv1, mdc_slv2, mdio_mst,
+                mdio_slv0, mdio_slv1, mdio_slv2, mux_tod_out, pcie0_clk_req_n,
+                pcie0_wake, pcie1_clk_req_n, pcie1_wake, pll_test,
+                pon_active_led, pon_mux_sel, pon_rx, pon_rx_los, pon_tx,
+                pon_tx_burst, pon_tx_dis, pon_tx_fault, pon_tx_sd, gpn_rx_los,
+                gpn_tx_burst, gpn_tx_dis, gpn_tx_fault, gpn_tx_sd, pps, pwm0,
+                pwm1, pwm2, pwm3, qdss_cti_trig_in_a0, qdss_cti_trig_in_a1,
+                qdss_cti_trig_in_b0, qdss_cti_trig_in_b1, qdss_cti_trig_out_a0,
+                qdss_cti_trig_out_a1, qdss_cti_trig_out_b0,
+                qdss_cti_trig_out_b1, qdss_traceclk_a, qdss_tracectl_a,
+                qdss_tracedata_a, qrng_rosc0, qrng_rosc1, qrng_rosc2,
+                qspi_data, qspi_clk, qspi_cs_n, qup_se0, qup_se1, qup_se2,
+                qup_se3, qup_se4, qup_se5, qup_se5_l1, resout, rx_los0, rx_los1,
+                rx_los2, sdc_clk, sdc_cmd, sdc_data, tsens_max ]
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
+    tlmm: pinctrl@1000000 {
+        compatible = "qcom,ipq5210-tlmm";
+        reg = <0x01000000 0x300000>;
+        gpio-controller;
+        #gpio-cells = <0x2>;
+        gpio-ranges = <&tlmm 0 0 54>;
+        interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <0x2>;
+
+        qup-uart1-default-state {
+            pins = "gpio38", "gpio39";
+            function = "qup_se1";
+            drive-strength = <6>;
+            bias-pull-down;
+        };
+    };

-- 
2.34.1


