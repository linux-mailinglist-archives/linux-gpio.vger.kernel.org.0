Return-Path: <linux-gpio+bounces-36674-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YM2uCjotA2oR1QEAu9opvQ
	(envelope-from <linux-gpio+bounces-36674-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 15:38:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6DB5215CD
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 15:38:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 33F8C3090A46
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 13:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0362349CE8;
	Tue, 12 May 2026 13:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BmkQnoOq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b3ZxhPbs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53E83905E4
	for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 13:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778592359; cv=none; b=ne88VloLEYCWpecNYHnRUg8+MlxO18L6IAyivPyeL6QpaZdPfiYCvC+OZuWZaINlc9UiHpTMXvLgWBHq9uxCylAoGsKZjA6KiGbf8TA/DZ+9KKlJV0GdNxnwX2hlZhhS5YLoW5NPUNk4fbUUo3NNdFEWPwTAbRxfn2JpMbpShvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778592359; c=relaxed/simple;
	bh=jvyJCe0RN8MCcynlAWEz42sn7roJV11eMx4pxGp1l2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vDObSM2SH+XiJqg+lyIr0th1f8qrIq8oT0kSROzUVwOxWrZ+ja5TjVS0jsmBx5q6h3NEXjH9JGF6ziFHv+gmIGMfis9uECD5+2gEL2X32WHp1RLdTfIY4U3gON4ikrVoMYfMzCvBDMhoNV5EaDlzmCkiHnasPP4janKR2Nr/wCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BmkQnoOq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b3ZxhPbs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CBxSkW129277
	for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 13:25:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YhLEBhs95oU5wNJOrtgYV7oafT0Q2U0L+BmVD6j5Hy8=; b=BmkQnoOq1PYxbPS3
	DPluOGOgcG7RXff0UDd++BQg0FUa9jIcqku58KBewlhMyqOgQPzmepVLx2sMn8Xg
	sYXKtweqTchadz8va4Fd44G/fBLKfqHbL9kt/bmOaW9cmnK+tY3NVqkQEx6iiYP1
	t4WY1e2R43bFCNXKDuCN0rSOByHk/Y0QGnbVX/62nwg7Eh5maLLnzTnXNmC0FB1r
	oS4DYv3Pddc6mh96JDZbY6iCHCZjPfSaLEYyaewLL3DZDGiSNEsmYxjYR92Lh5F0
	I6Y/n9htwAEvXlwAXSvvHQ0lA3AeWCwajTeey1BNnqoq697M1pep5VMRlReBEiuC
	xG5QPA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43tn0924-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 13:25:56 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7bd5c9e2e4aso13054857b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 06:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778592356; x=1779197156; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YhLEBhs95oU5wNJOrtgYV7oafT0Q2U0L+BmVD6j5Hy8=;
        b=b3ZxhPbspsCtq3hk5dDzA0tGJHTNueIG5aQIE/Komsvkm3VahYulzPYT1jz4FsT1wn
         d4Hx2X1Ql01Z6iT5Kom2JBkbS/t0DlR8Yj9hcaqZfsobAd2Uk1cUme8JXfvgvBja0E6H
         TIoftFqRQARsmN1patkXLKfhVeW6jFFJvwtk5s1sCvOf+JRsl9CWvkh+gWWITK/oIsfr
         MRbIVkfQG7Ri1NU2/OYD0ilgWTSXx9oQ/+CbzKxS3XNp8fCKVVGV6s8zp5IfM+LIFUDS
         3y7WwHAt1OwOYRq6tlq8RWWXfIyd9bitbMlfxbcacRPjeu4t1xR+S4+pI0rMzusM75RM
         0MaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778592356; x=1779197156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YhLEBhs95oU5wNJOrtgYV7oafT0Q2U0L+BmVD6j5Hy8=;
        b=Ws6BghkVwtqVCT7ig5k5gqquaOwO3QFrf59Yiy7BPHvfs5wGJKUUoA39j+P0evy+3A
         +gUvsPUdUa7n+V7jm+R9Jn+eCd5AAPZf0nr+IXR2OTHgu3MgDDmpn1hVsVQCXQ0f9T8q
         5o03u9M6yGQ0YL9skjTE6mg6MR7+xOjukCFEKT1oK4xgPq6OgvYOjHAa0TpxOvU9IxY/
         p5d0Yw67iJHc3Q9m/PsFyDtjc/pSaL4JzBPZGbzdNeDYF3F+FCuWUKLqcQb+6M7lptDZ
         i6eZYVVjCcoS2qroIss3sPKaBe7Vodz49G7VwyMqxWN4cjaqomQLXIz2UPsqeOWqcSEu
         MdxQ==
X-Forwarded-Encrypted: i=1; AFNElJ+L6n5aroEGgw/nZHepI/LHo+0pW9EFUWKjuLMQ5+nbdo6QZ752xaEMdRFrt3KBMQExKeiyJH38K5vD@vger.kernel.org
X-Gm-Message-State: AOJu0Yz84FZbcItCspLHkj5gQj/AN0gWUtMd51FMAyyjPcPSnSaDZtE+
	lUYpVmUNXe6vMbEnNTygY8lfjQwjIrpaaf9MUVN0PjksIRbUws3uZIQRwwXe6GsuVQljRVzJlXL
	BGT5/2Ap+z1oGAfpcBUivj5MElrUSXPXTC7uPfOiiFfsesDK4ndI+VzHVLZjXlXXd
X-Gm-Gg: Acq92OHSvBZUXfcMO92y7NkJ2K5pens4YDGpZaox1FNIEBtqhU3FXZUrI3rcs8rc6Xf
	opMHwy7MbsgcC+nEyiLsNBc6kiFBZfAh8lRO3G8I9Q3fFUjvF11VgOXw3v9gUzWuF3aWVvWTzxk
	iK3rdz/J9okxKcGP0KhkG3Ti/ef4oItrpUBOVoakHZct41VsZBIN4PZuHTGEs3DF5hSf7jx+Tym
	b1RM7Y5gesxxFmeUF6QhrYZT/M+9jrkkk8SGrloiTKo0wU3V6g++rSHQ+WeJHoBopGoVtJq5voo
	RKtNijg2XhsrDWkNBoyJJT3pmAnH0idg/0nkhIESMU6krNvp1MMEeqEK/NKNTpwjQVVAF8TTj6t
	tmsJQRVelUyDzCQhQxoFepbguL1uxt0Cv3KlM
X-Received: by 2002:a05:690c:7106:b0:79f:b903:88c4 with SMTP id 00721157ae682-7c564135cd3mr26425497b3.46.1778592356059;
        Tue, 12 May 2026 06:25:56 -0700 (PDT)
X-Received: by 2002:a05:690c:7106:b0:79f:b903:88c4 with SMTP id 00721157ae682-7c564135cd3mr26425197b3.46.1778592355666;
        Tue, 12 May 2026 06:25:55 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd66861afesm164595757b3.37.2026.05.12.06.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:25:55 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 12 May 2026 18:55:43 +0530
Subject: [PATCH v4 1/2] dt-bindings: pinctrl: qcom: Document Shikra Top
 Level Mode Multiplexer
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-shikra-pinctrl-v4-1-b93c3a2e4c08@oss.qualcomm.com>
References: <20260512-shikra-pinctrl-v4-0-b93c3a2e4c08@oss.qualcomm.com>
In-Reply-To: <20260512-shikra-pinctrl-v4-0-b93c3a2e4c08@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778592345; l=4519;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=jvyJCe0RN8MCcynlAWEz42sn7roJV11eMx4pxGp1l2E=;
 b=JZ27xbj9u0J/O+JVgEh2IxFCnjzqu/GJTSbU8bJK2q44+S99l088Ay1E1e01LwRaDA573fYBZ
 g6n8plQIFB3DcRqpBOnPSuBlLmnm7omgQACytkbK3oAdkGAMoIAmqpg
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: bknshl5KFjuIJkT_CasAvDhAUXjRz7nE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE0MCBTYWx0ZWRfX+XBkFcAtR7an
 yoXXeMgQl7EsIOa18SyrSavrRhhrPL6Sn47YG9u8JlaMgYPiiafe7lI98ZbUtAoeQkTcxHfJCq8
 +VyI8FNDdp37GEUw7zSxrj8B8ngThtYT7BxKq2hUJPG/m6dacZ91uY5oOYmC9zqeRJdu/NlD3xD
 bc19sFSt2Rd66xhw5PlF7MWv7wcL5gcL5n1nbYlJRd7/G9vouMYXDiol9GjcJmkdCU5y3jgWoMm
 zfYCHh5yV7J4H3aCB/nCyHNBq2jyI8GXqT2Bp+IKPhe0ucnARxQ52ve/K6WLBTrnzxaeVRQaIMP
 NEer6X3x2nW55AXjeJgv1+8pRBThpgjySVuz8iAWTagUb44Qg3y0yi2l34hkVrOphME9eCu5gKt
 +XxFwkRS+GMBkP1lMMEeFdUJWHJmAoHoKgH/tXQoiSQGCZtzu+lXI4M+Dn+i6C2FJnUwLSBe//x
 F4uF7/CaPkkt6e5/PGw==
X-Proofpoint-GUID: bknshl5KFjuIJkT_CasAvDhAUXjRz7nE
X-Authority-Analysis: v=2.4 cv=Ebn4hvmC c=1 sm=1 tr=0 ts=6a032a65 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=bT5XQOCXPleopHcqzpYA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120140
X-Rspamd-Queue-Id: DD6DB5215CD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36674-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.7.161.32:email,devicetree.org:url,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add a DeviceTree binding to describe the TLMM block on Qualcomm's
Shikra SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,shikra-tlmm.yaml         | 123 +++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml
new file mode 100644
index 000000000000..411c402f9044
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
+    maxItems: 166
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


