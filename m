Return-Path: <linux-gpio+bounces-31163-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMWjCkfpeGmHtwEAu9opvQ
	(envelope-from <linux-gpio+bounces-31163-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 17:35:19 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F29D97D44
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 17:35:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 64A8630892EE
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 15:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B152B35DD13;
	Tue, 27 Jan 2026 15:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i/xoNqlK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RGXf+KHx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415D735CBC6
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 15:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769528870; cv=none; b=JsnkiyHrc1Th8QPXHTm0/2MTOFiYdn5IHm4WQ4afdcxXD2xIUKyL/0TfA1etDwOYL63KtECCq2+TdgLlMOOg+CuKhUaVJ3hkeUxcK7AHb5FDIig5ta36NGq1GKOZGv+Zqazgq5fUp4Ws4aQTW0eUjWDPq7ZwTf86r5uNmSPJLis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769528870; c=relaxed/simple;
	bh=btLjZKbRLBmL6B22+eSZjzaQzdAIEk75myjZbhNfse4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IZ/VbwF5IjB+D6pNGHKfOmYPL0/dbww/HBDwefKzjUFVp8IT62ffnototVV8IIYMrwpkiwgmjU2BwMc+SR/dBxN9TxVtl4nVPOtM8zfCW/WZCIxIaXVisXdXZFAelCYcdZtX8hVVwJB+HeYR3JcpBIq58FkxLunr+sjUbxOUqUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i/xoNqlK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RGXf+KHx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RA35q9171530
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 15:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N6cshVERWzUvY/NIyt6rQ5hqeOfdBV7Vm5kV4VlEHFA=; b=i/xoNqlKPklwJmK9
	BjnChEcLx0fpzZPm2MOPAevJtqygt60kF1bEoie5DKqgFBSZ3ZdBsDZLTFwmMXrq
	yNQmivqqz0dyR/MytYz3pgsej9ycyPWTkj0ekpCyD2u4gnT9+vIAzX6qnwgYwMhp
	rIal4EFTnb1egbh78st0yrsz8hsUplKB3mFeTl6udlf0Sz2MDbUul8EaSlG/YEBq
	D3lP9cSUEk95GSE1tgAPXLtY1dKbO7FcpOygcmLJxl4+4e5Gz16JNqb6nPHFjBsj
	c2sDQscGaKy5BPvle8EtDbjMVcY0CT5eNDYlu0pdwU/cVCOBzZ1z6aCuRTOGRfqy
	HURfog==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxf3a3e7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 15:47:47 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a2f8e7d8dso196742006d6.1
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 07:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769528867; x=1770133667; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N6cshVERWzUvY/NIyt6rQ5hqeOfdBV7Vm5kV4VlEHFA=;
        b=RGXf+KHxP54EbUpufGhDFrmlavnhaWzM+A5zC7TQACpS5GlzOV7Q8XUhOnFPAOz2/c
         cICDsWB9Xh7GOZW3f+IcvE2h9tITc6PekGP6iE2SHLeQTiDsGelIEoB1DRU9CqO7NZFW
         KWuTXnG5aPLvg6uWAnlVcrckimmWx6GNcoBt1Mr+q1/Uf6YPQUWym8rfme7d/Y9em1Ad
         H680qKckjpHHL7peXxu4bUxy5Wt//QxZCRk/KnDAmDF7kxtuCLn1x0VQHBO9ClhpMhkO
         tL5p9sdUv0x+ULjgcMnYWzu3lvHnsgOmp7loBjdKtiFznLJewSd6QhEDTUUZ3xmVXDK4
         0tyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769528867; x=1770133667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N6cshVERWzUvY/NIyt6rQ5hqeOfdBV7Vm5kV4VlEHFA=;
        b=u4rL56O0fwId17Gna4PjflTZt+zt99WMYThTVE/HqDLHcJ+LEHzf9VoMkeh0VvgcEV
         tcACdByT8ItS//TLZLKEt0c39DwMSdDkLQok9BJSwsTFw2167DDKTSiVZ6fsPIBYpol+
         47/GaMAQnat8y6rsCVrqKzsSN7cP18jxzfDX+FZTHi/ZBbUnFsoMO6+3O0Ck1yzt4PtX
         QVfEgeEbp0iQzARV5nX3lB8z0Q8ea4+L/Qeii5xxHRQYbchrAQRLol2qVxYghfnIwhjF
         K8p6QLtaABSp68tux7gKn9CcoGgHn324HUyHWcHRdY2fO0PUuE0mI181psMp4oGhqYll
         udoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdTto0jbSvDAQz5jJSfJ4VkP5kh0iR+zHzpJxuFp6QDBoY9CjaSdNglth1djtVET4MCo9N12fCqWeH@vger.kernel.org
X-Gm-Message-State: AOJu0YzTZ9mk7brHhvtkNcZ440b49LTrYfy68HqyVC4mQyGrvFM5o7G0
	3SQJZN2L4RVUMn1mX5qbg7sNhvoVCOxodHt+8wrQll+8yOY7s3ztLs008BkaObn0DljCd65HkSf
	7VzElSAI8Z7hdz3+hCs8sQRoXw36Eo1v5agpyCM7JdoCM/fupYlDChw2aU8syL+Yg
X-Gm-Gg: AZuq6aJguDZivqGzRenRSklvwB4l0Si5n4bW02EHgAjO6TAbzjNj/voKZGWFoUu1D66
	8iLDvhfSn8HaaDkb3xrdnWsdbKZ92COkpgF2dUu28FqWqBBsWAhmo3AcPfXTF0Pn1GE9zrlTgM+
	lxmMTH3BqPnEgypkiGVf6t+tutm8n6ArHr0lKxLgtmGLmc9K66zNvZOD5br7/uBVEn6EjYbGZJk
	KSb7yj3st/KJ+pqiwl/teAeLE/SE9JmjMjbtWtb/RGy9UZBNRaKImc7IdUXAKqIrEG0y4jol4hp
	/47F2xkNKBAZb9cAStoDQFxxnuJOtAi7//C+PpUu5XWg/X/MnMh+G74Vwu+EOapLQ5P59OUcEbW
	f95RxYKBI4T/q+25bog==
X-Received: by 2002:a05:620a:1908:b0:8c5:2f70:c62b with SMTP id af79cd13be357-8c70b92d7cdmr249640585a.85.1769528866215;
        Tue, 27 Jan 2026 07:47:46 -0800 (PST)
X-Received: by 2002:a05:620a:1908:b0:8c5:2f70:c62b with SMTP id af79cd13be357-8c70b92d7cdmr249635785a.85.1769528865507;
        Tue, 27 Jan 2026 07:47:45 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24bf8sm38096465f8f.11.2026.01.27.07.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 07:47:44 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 17:47:36 +0200
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: document the Eliza Top Level
 Mode Multiplexer
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-eliza-pinctrl-v2-1-1faf78efdc2e@oss.qualcomm.com>
References: <20260127-eliza-pinctrl-v2-0-1faf78efdc2e@oss.qualcomm.com>
In-Reply-To: <20260127-eliza-pinctrl-v2-0-1faf78efdc2e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=5255;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=btLjZKbRLBmL6B22+eSZjzaQzdAIEk75myjZbhNfse4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpeN4cHcoLLxMKyq0/69Lkx9zC9v7VY44dAVY33
 q2ABsy88kyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaXjeHAAKCRAbX0TJAJUV
 VmBVD/wPgBJI1Sy28m1KNHnUhLLSp1nwgiIJQbT/7Bh7EzSVeZaW47jWsZMj9jxMJ5rkqduTyHx
 208mCuceS55gFwQOIIcxq0Y40UUbuYmNzNiudRDGd7Ycnz0N4E1/vQAt5QAoWlmi5280E1Wuek5
 MsL5o9e+J7NGJdt/DEq4C4rhPFflb16M/clme0FpGKFU5CK/0SlIp01+7ziMZSL1jIC/iofqMq0
 vaZnQiLFkPW+HZPU1TNF9sqKf+S34vLweHVvOPVDQvsWzIrw92If664TM/dLP519Bts5Q9Vfzz6
 ioFv1GoCWx5wp3+c0B/IuFu22UDT65XqLFOMBMwhJf2kLTZHu6du8NbzVkLrigrUTQ0Nz5OGSRk
 Cw1BpKgEhqCoZnFf4/EXkJwlCN48aUSDnFRQzSYithg8+N+xctqsniPv/8F4VV+dGoGYempUcx3
 MxBVkMSf2aLZAiHEs7kWdQtr2xK3vEvsi7NyzM+fiuq7A5Hmn+SAxo6Pr2lEK1CY3oeKkWCaVrI
 CabXdWH8bfhHkzXtIpYJU3XfFK6Y2XvbzcDhFsyp5BI1dJicrTL+j/+K40LUHqT7EYtc8VgD4KA
 xiBtrN2SsNpK+zaRPj/QIsd2+HpSEnHVsoB8zqUilaDE3Bq2PfHcBN287VE9xAFdukak23mYPTw
 JrYwAQJpRVEAUuw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEyOSBTYWx0ZWRfX8gAJQnpXdeA5
 06823D3bO7+dqWgkP977j2gjA2PWpyddbX7dz/SKexz6hLlsTL7VvxD1bMuV3agLhCRkw+GNm5t
 KQyD1Kw6z9JyaTUQ5AFVgX9xvntePrGz3T6AeyLY0gltjhFw0YqJxa8+SOrh1iyvvgOrCDtJhzF
 4TVWaIzd2Gqwxv5vcittdPuOs+2U1MFeXXLSppOZVifmYiPAKXXQdv4y48Sq3/2BrViMcaE/zwe
 gAbR9jjdqyQxan9ZZTa2ZuTuugdtT5x3TqFdY0/dP8fPlhvXbrbTwAFwWHeaqNFbTKmIFxLA1e8
 R2NYyi7pcj1rpoO+A4E5kj4l8DmG0RmoCv+xvGimE37CUx94yxg13lQ957J2809JmRwgqeOiIAr
 nZvbB/rFdSj1M4G/jmPH5AeafR0zTo01HTdEH4nkK74jrXpxVmasOcUj5GlkAS+Y0RnX+zNc1w3
 iihLumP/MerXNYZ2rHg==
X-Proofpoint-ORIG-GUID: i__r0L-p58cD_vbSDrDD2QqNEwKMKdHt
X-Proofpoint-GUID: i__r0L-p58cD_vbSDrDD2QqNEwKMKdHt
X-Authority-Analysis: v=2.4 cv=a6k9NESF c=1 sm=1 tr=0 ts=6978de23 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=RS--hHaVoNrYE_hnkMsA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270129
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31163-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5F29D97D44
X-Rspamd-Action: no action

Document the Top Level Mode Multiplexer on the Eliza Platform.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,eliza-tlmm.yaml          | 138 +++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml
new file mode 100644
index 000000000000..d8b6591caf57
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml
@@ -0,0 +1,138 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,eliza-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Eliza TLMM block
+
+maintainers:
+  - Abel Vesa <abel.vesa@oss.qualcomm.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm Eliza SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,eliza-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 84
+
+  gpio-line-names:
+    maxItems: 185
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-eliza-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-eliza-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-eliza-tlmm-state:
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
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-7][0-9]|18[0-5])$"
+            - enum: [ ufs_reset ]
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+        enum: [ gpio, aoss_cti, atest_char, atest_usb, audio_ext_mclk0,
+                audio_ref_clk, cam_mclk, cci_async_in, cci_i2c_scl,
+                cci_i2c_sda, cci_timer, coex_uart1_rx, coex_uart1_tx,
+                coex_uart2_rx, coex_uart2_tx, dbg_out_clk,
+                ddr_bist_complete, ddr_bist_fail, ddr_bist_start,
+                ddr_bist_stop, ddr_pxi0, ddr_pxi1, dp0_hot, egpio,
+                gcc_gp1, gcc_gp2, gcc_gp3, gnss_adc0, gnss_adc1,
+                hdmi_ddc_scl, hdmi_ddc_sda, hdmi_dtest0, hdmi_dtest1,
+                hdmi_hot_plug, hdmi_pixel_clk, hdmi_rcv_det, hdmi_tx_cec,
+                host2wlan_sol, i2s0_data0, i2s0_data1, i2s0_sck, i2s0_ws,
+                ibi_i3c, jitter_bist, mdp_esync0_out, mdp_esync1_out,
+                mdp_vsync, mdp_vsync0_out, mdp_vsync11_out,
+                mdp_vsync1_out, mdp_vsync2_out, mdp_vsync3_out,
+                mdp_vsync_e, nav_gpio0, nav_gpio1, nav_gpio2, nav_gpio3,
+                pcie0_clk_req_n, pcie1_clk_req_n, phase_flag,
+                pll_bist_sync, pll_clk_aux, prng_rosc0, prng_rosc1,
+                prng_rosc2, prng_rosc3, qdss_cti, qdss_gpio_traceclk,
+                qdss_gpio_tracectl, qdss_gpio_tracedata, qlink_big_enable,
+                qlink_big_request, qlink_little_enable,
+                qlink_little_request, qlink_wmss, qspi0, qspi_clk,
+                qspi_cs, qup1_se0, qup1_se1, qup1_se2, qup1_se3, qup1_se4,
+                qup1_se5, qup1_se6, qup1_se7, qup2_se0, qup2_se1,
+                qup2_se2, qup2_se3, qup2_se4, qup2_se5, qup2_se6,
+                qup2_se7, resout_gpio, sd_write_protect, sdc1, sdc2,
+                sdc2_fb_clk, tb_trig_sdc1, tb_trig_sdc2, tmess_prng0,
+                tmess_prng1, tmess_prng2, tmess_prng3, tsense_pwm1,
+                tsense_pwm2, tsense_pwm3, tsense_pwm4, uim0_clk,
+                uim0_data, uim0_present, uim0_reset, uim1_clk, uim1_data,
+                uim1_present, uim1_reset, usb0_hs, usb_phy, vfr_0, vfr_1,
+                vsense_trigger_mirnat, wcn_sw_ctrl ]
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
+        compatible = "qcom,eliza-tlmm";
+        reg = <0x0f100000 0x300000>;
+
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        gpio-ranges = <&tlmm 0 0 186>;
+
+        gpio-wo-state {
+            pins = "gpio1";
+            function = "gpio";
+        };
+
+        qup-uart14-default-state {
+            pins = "gpio18", "gpio19";
+            function = "qup2_se5";
+            drive-strength = <2>;
+            bias-disable;
+        };
+    };
+...

-- 
2.48.1


