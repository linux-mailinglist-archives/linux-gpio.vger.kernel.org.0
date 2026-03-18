Return-Path: <linux-gpio+bounces-33708-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCqoBfhQumkAUQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33708-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 08:15:04 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 823E52B6C2F
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 08:15:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 61DA33056B75
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 07:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 226DB369232;
	Wed, 18 Mar 2026 07:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a6QZMq3S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SHup0Xr8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BA5369202
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 07:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773818084; cv=none; b=akNm+5F620aOqtlypsch8W8yw4SnCmbQN36BCjNjA8Au90aYc7Q6qwYDI3Ej2QjTn7pXG7y+N6ivmEkDQY7wgJnIcHuofijBpJZj7CoN8Vg0gE5LGkapR6y81dAWRjf44JKBqBoUTwnYt9sdDGWbhmPduNSkkvfBL8ugimv/yj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773818084; c=relaxed/simple;
	bh=VscofhmW8W5TCQyG/6Nf33e/Z1Qdxj7p1k3JP0RwNfk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kEU9xL516La0u5viBumog/J4ZgzlqX3XedDFnHNPm4ggBW7DYy5OqmSYljroa0XP3NbkQ/RFgldKYjEXvim2AF3XPxjtPjT34f4JndgZtqFk/lMEAce0SiT4R+kZ/lGwNPljtmi3eStDv9PkQv7PmV7tCmPePBXpSznJNMjJeB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a6QZMq3S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SHup0Xr8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I3L4Ag1145459
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 07:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Iy8Iv59/RmrJCraBElActxMlxNVkSji7r87Ih+f63s=; b=a6QZMq3SRHWxCGvP
	oNB+j5i5IW9PQIVbKWJgD+XSYxkbFO8TyXBE22DW+PysUAc6h6rM7J/qaIorvwZl
	qqzOikn+p3W+97eetNPGMtmUI5Z7j/7sMtRKd2qdZ4XRnrM3Y+lqhGMn0E4TKs6W
	p1DfGjN6hG6sZ6FdgoViyzacsNGPaMdfAmAC3Msm25hUOOfacVexJGuoSZ/cdN9T
	9QJRFyaFnsSVuJHvVz3D4IrEdwejVPN8S8wfGsJUn2IURHCruJD/25EPNnLoIM00
	nbB4JEvbPbYsRyHKjhoO/IEvx9oNSpu+dHXl3zg30WVmAbFPKDruXzZMd9fo9DYi
	4eOhkA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyak3tvpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 07:14:42 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82a6906e35fso772276b3a.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 00:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773818081; x=1774422881; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Iy8Iv59/RmrJCraBElActxMlxNVkSji7r87Ih+f63s=;
        b=SHup0Xr8pkLB5nF3rMYJwg3S5Th1u63L+/lAf4wi3ut5gn85vGnbTrGajrPPEv2JTP
         IngmMbAMtnIzVZjzHGsiSZipMif0lVEmoXkk80xFYx2yi++turedNzD1U1wBSEieFSRs
         QYIWXEV3SiXc/gMN0+9FoeaxH0mzeJ+G9R6+cvwMR02Bp0jo2WNkatwXaEod9djfpXJI
         LVMFmcSdhNoB5tB7nT4zk5TucCB89uUihXrfnGHEx7dSzBkGSw8MsyDPk3WChCEEq0A0
         4QkzLc+wZjAc5Z+ETtPcHkLpECUDVs11G1dxdPx/0uV7bBTRvsHMA9tfbB+w5rTIYahl
         r/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773818081; x=1774422881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7Iy8Iv59/RmrJCraBElActxMlxNVkSji7r87Ih+f63s=;
        b=D+cUACUtLOTa2wj6EXZ/QPZxgmXYX6LON1OVrB4yPhnfguNWoXE/JcFuVjMUphekrY
         n8T5txraQlmS0dnf7931ltI3yPFDtiis6FZQtJGVtktpZrzZC8u5dUMtxEMhkUBo+N+C
         snd4nxE5/Yox2cEBhRYRjTJZOYidXTnN6hwNpfKwlZTUQIxoGot+o6nWK6SEyyGrsXXO
         K6BFLMW0g38mv2/qmZAzvWasi5MvCKjyiKx1fIH5s63R0bHHl0PjQMcvKlurBvTI0Zcp
         pDN3bnbUBouQUUjt1/TTqRli1PUy6HPsLguZUbq2qPiqiGg1FzpyBp+4UjERCbapaFs3
         GUyA==
X-Forwarded-Encrypted: i=1; AJvYcCUydrIdb/mGXlslzjvAuvheKZzkcg70DhAsPeAB+HnuTqx+vb0WEV59aGK3aU9lB//BPO7yV0SMQwnn@vger.kernel.org
X-Gm-Message-State: AOJu0YyG0fuImis/P2d0lwIcqJz0ct3LanlnonGqrTe7O5x0uoLzcsLO
	1GJLT41cUezvxSHXG6vefNf7PhxxT+NM+YQkYILdy1bp2wMURn+JgEy/L7L2WEg69tH7mDX4Eb7
	8bB1wDIk4y79aPXrj9LSvStGk1HWsmY/iJ8P71R/0VrXiu28PE/QBxByFTzz5vM0k
X-Gm-Gg: ATEYQzxInFY2TKq7XlXT1ZO3GjP+lnwcPlZ0HgYEbLxtbKPL6Hcwv0yvzlvWG1sOY6i
	GHnVvoc9u06bSCEnX96VbNr8UkC1wXTZ41Tq/tzN3GadpA/EWKuoJMqOekywHPhCvJsgJ1JN+4P
	r9zKg7OpWUHPB6CA8BijhdXq5rhNc0xMg89G3auJvPuc8mumgEnyAeQHJ+JpfMjTKXzavJnpQto
	0H2r5xHqkCWDoGLGec8H4tLd3bV5fpiD4M/2bl84DyQVVbvG7ZqCr+7JuYc39kcRTopqNH7xs+b
	rpa1ls8EQQ1qEkZDikxMy9Ycxv3FAtyCK6iGaLTNfBVMSX33Ef4STnPEOVpdErpolS2/JqFdbN/
	yvAS/Bkd9Ed+uZluLNp7qQw7ZhtJ6wHUsnwPZSykK2VqczFL9d2wnCGESJfw3NCGuTvXtoiG4PL
	w1HuT4NQE0WRrbx9bRTzLLLanAH0AY/XBTJyzwH0LXNa+wtGzgzQdYLgdB
X-Received: by 2002:a05:6a00:1a92:b0:827:33cb:c7a3 with SMTP id d2e1a72fcca58-82a5603a9demr5580109b3a.10.1773818081337;
        Wed, 18 Mar 2026 00:14:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:1a92:b0:827:33cb:c7a3 with SMTP id d2e1a72fcca58-82a5603a9demr5580080b3a.10.1773818080853;
        Wed, 18 Mar 2026 00:14:40 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6bbe801csm1575768b3a.46.2026.03.18.00.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 00:14:40 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:44:30 +0530
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: qcom: add IPQ5210 pinctrl
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-ipq5210_tlmm-v2-1-182d47b3d540@oss.qualcomm.com>
References: <20260318-ipq5210_tlmm-v2-0-182d47b3d540@oss.qualcomm.com>
In-Reply-To: <20260318-ipq5210_tlmm-v2-0-182d47b3d540@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773818072; l=5620;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=VscofhmW8W5TCQyG/6Nf33e/Z1Qdxj7p1k3JP0RwNfk=;
 b=tnx5seOcqk3LcgGFsWtrt7qOpsD47WGrdatpAZgHM7V0LA07/56TKUhjFwGrlE3NgqP21siCJ
 D06h+VoUJ9RDTOqVYU92qbLLNZpKd5CMXN7zFBA3rEG3OUcCsPGEFCu
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=A7Zh/qWG c=1 sm=1 tr=0 ts=69ba50e2 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=hD0fcazERHGK-ooIS8AA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 8Q1jF5VaCKSVjEX5Zp-3MjtKMHpY9VfN
X-Proofpoint-ORIG-GUID: 8Q1jF5VaCKSVjEX5Zp-3MjtKMHpY9VfN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA1OSBTYWx0ZWRfXy6n6Jr/SUDSw
 EtFVx0nMi9RrpRc9qKsY3RccFw9a45QSLPagiMyzd8B21u/xaHShIxyhk8XB+a67R+12Er9aXvw
 wR1E184SwXFNjD9ptnUp2ldO+xJGTm1k6Lu4bMJggP9Pzu56TRMql5kC3JNlC2nzaeNc8hG0t60
 MOzJ+OJrBblnf5fvRLTAMRtgWU+B+gG+YvAwicnc8m66VG+aGs6PCB14/RANZy0oJe5JMamaIte
 6U5PaVCZfiLx/o3kyXXa/S3FHfwn01P17fhaz6IOGKd8/pQh3HSxXOFG8HSUAwBaWBO/wYMxBv7
 ol1wbIQX+R68UBjfd0/SDUK4BFbDVf+4jZLDaByo9XU7GkVTLHHsnHifl1n27HSKoTDtxkLsoz1
 s79kOgTnC5Ysxmk46vV7imgbRyjM5eUqQHeXESQ3iQdvUPPna6BWWYvapXK81dwyNsE603gUXYo
 Sa86pX5EXiJN26Tw9YA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180059
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,devicetree.org:url,0.15.66.64:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33708-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 823E52B6C2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add device tree bindings for IPQ5210 TLMM block.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,ipq5210-tlmm.yaml        | 137 +++++++++++++++++++++
 1 file changed, 137 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq5210-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq5210-tlmm.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a6e2c41049aac26b2a2ffb579dc217ffa4113e31
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq5210-tlmm.yaml
@@ -0,0 +1,137 @@
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
+                atest_char_status2, atest_char_status3, atest_tic_en, audio_pri0,
+                audio_pri1, audio_pri2, audio_pri3, audio_pri_d0, audio_pri_d1,
+                audio_pri_fsync, audio_pri_pclk, audio_sec0, audio_sec1,
+                audio_sec2, audio_sec3, audio_sec_d0, audio_sec_d1,
+                audio_sec_fsync, audio_sec_pclk, core_voltage_0, cri_trng0,
+                cri_trng1, cri_trng2, cri_trng3, dbg_out_clk, dg_out,
+                gcc_plltest_bypassnl, gcc_plltest_resetn, gcc_tlmm, gpio, led0,
+                led1, led2, mdc_mst, mdc_slv0, mdc_slv1, mdc_slv2, mdio_mst,
+                mdio_slv0, mdio_slv1, mdio_slv2, mux_tod_out, pcie0_clk_req_n,
+                pcie0_wake, pcie1_clk_req_n, pcie1_wake, pll_test,
+                pon_active_led, pon_mux_sel, pon_rx, pon_rx_los, pon_tx,
+                pon_tx_burst, pon_tx_dis, pon_tx_fault, pon_tx_sd, gpn_rx_los,
+                gpn_tx_burst, gpn_tx_dis, gpn_tx_fault, gpn_tx_sd, pps,
+                pwm, qdss_cti_trig_in_a0, qdss_cti_trig_in_a1,
+                qdss_cti_trig_in_b0, qdss_cti_trig_in_b1, qdss_cti_trig_out_a0,
+                qdss_cti_trig_out_a1, qdss_cti_trig_out_b0,
+                qdss_cti_trig_out_b1, qdss_traceclk_a, qdss_tracectl_a,
+                qdss_tracedata_a, qrng_rosc0, qrng_rosc1, qrng_rosc2,
+                qspi_data, qspi_clk, qspi_cs_n, qup_se0_l0, qup_se0_l1,
+                qup_se0_l2, qup_se0_l3, qup_se0_l4, qup_se0_l5, qup_se1_l0,
+                qup_se1_l1, qup_se1_l2, qup_se1_l3, qup_se2_l00, qup_se2_l01,
+                qup_se2_l10, qup_se2_l11, qup_se2_l2, qup_se2_l3, qup_se3_l0,
+                qup_se3_l1, qup_se3_l2, qup_se3_l3, qup_se4_l0, qup_se4_l1,
+                qup_se4_l2, qup_se4_l3, qup_se4_l4, qup_se4_l5, qup_se5_l00,
+                qup_se5_l01, qup_se5_l10, qup_se5_l11, qup_se5_l2, qup_se5_l3,
+                qup_se5_l4, qup_se5_l5, resout, rx_los00, rx_los01, rx_los10,
+                rx_los11, rx_los20, rx_los21, sdc_clk, sdc_cmd, sdc_data,
+                tsens_max ]
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
+            tx-pins {
+                pins = "gpio39";
+                function = "qup_se1_l2";
+                drive-strength = <6>;
+                bias-pull-down;
+            };
+
+            rx-pins {
+                pins = "gpio38";
+                function = "qup_se1_l3";
+                drive-strength = <6>;
+                bias-pull-down;
+            };
+        };
+    };

-- 
2.34.1


