Return-Path: <linux-gpio+bounces-36408-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GuDGJLm/GmGVAAAu9opvQ
	(envelope-from <linux-gpio+bounces-36408-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 21:22:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EBB4EDF59
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 21:22:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 79AD63038943
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 19:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 083BD47DF98;
	Thu,  7 May 2026 19:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QFkhuJ0O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dIhV5zuN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBABF3E92AC
	for <linux-gpio@vger.kernel.org>; Thu,  7 May 2026 19:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778181741; cv=none; b=eS5NX0x/OTqKwXwDqXahs5wH8SfRmJU7UFUJzPd306xKSdZB3+rs09eSoIZmqXnyafYRhW9LbaKMR7/ccY6hQ9PJrHDxDsV6WU7+wWyVLqwXua/4evEeuRcwWgK+GvL+pqK9UFiQd/wvlTyFXpOLIev4toVQJk8y23Va2/3Pp30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778181741; c=relaxed/simple;
	bh=jvyJCe0RN8MCcynlAWEz42sn7roJV11eMx4pxGp1l2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=omufZAcI3hs1ETxmLE7nF262rDMJAaVJTt+Y34f/xwCplhrO3i1k0+yo+8gxhYm8/tNP+qVijwWuudbmlmN9dv1osQycfpfwC/FGPMVUmVfcMtE9Hwi8spuf4vw9WycqbnNQOwYfgBbyuhMd4Kg6uHFeg19VRvKXjE0zHjgJPfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QFkhuJ0O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dIhV5zuN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647HKGl91971721
	for <linux-gpio@vger.kernel.org>; Thu, 7 May 2026 19:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YhLEBhs95oU5wNJOrtgYV7oafT0Q2U0L+BmVD6j5Hy8=; b=QFkhuJ0OeUIUMPyt
	UGFMIiDGQ4W3iggEOm8OmRhMYuJyge+2KxH9CWK1XZ9Iv0aMqpSHg4ZJIdzD7OJY
	NJZDS5L3WC5JhwBlFIrSbPzpm6RJiHtbsn1Id6qe9nUFhBoICoixbIptHPNaonMc
	56Bp7afpF4Zjtf5PUKSDViCvE88geejTn9bSGmu40ERKr93l/emOACqP4IB0HT94
	s2b9eYFYhAqowkgajJptQVrOXYNEJ1/UwSSAF8NNlg/1iPiiy/ZdhQEcAdH9Pzbx
	m8CkIVIwQOaHhtAPjouE32j4Fopbw9ToDA+0IHH19+LVftc4rcN0QnGWH0PYL8OM
	w/SRtw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0tej9snw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 19:22:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2eba42b8dso14120615ad.0
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 12:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778181739; x=1778786539; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YhLEBhs95oU5wNJOrtgYV7oafT0Q2U0L+BmVD6j5Hy8=;
        b=dIhV5zuNwrg6cZUqxQPlrV2y+2cQjMe0miCsIS1J3wsm5NCG6uShh8brlVHlpWcXm5
         76Vz6hgYSXsRuo4vG/xzGFh9AYyVe4eYkR3/yPQv4HqoA3b4In7OFe69JLwmibwBHaEN
         xLxPB6NopdYqyGgP8Jul8pxgvgtzCYES1cEQCrvDb/nOiAKm68SKtpYKLl+XKsEokTOt
         vSt/RVx8z66LxmDy7ktdDlFExgIYOenUNjugfZA7HV8M8Zln/8laKtaxqZvQ0a/BPKmB
         YoYSie+AgLKO4LJs1EPcuZ9C/b7P/KewQJH2lk4Ew+UKxnAjCdrYdIqZLb8FSflsXBaG
         l2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778181739; x=1778786539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YhLEBhs95oU5wNJOrtgYV7oafT0Q2U0L+BmVD6j5Hy8=;
        b=nTEcr4/8iGQT332y/vGQxffCeKQ+KIRDSrs2+EE0vz91UhF7DTlFAv0ruUu4pKoxv+
         GitJrhH6t8KsUtol8snfPNftxgU4zd1gzEFAMKRsGTcXGh5tQaNraTjX12mXdTPMS+co
         G/s/U/+oVDB8KcknnpRU12U3kJnIy8YPYbdfOezUhwuwl30sOABOomXVjRXSS2nGaNJx
         P5vgJAmiI5J9maaBYK8ZxsqvTfWL7bw5m/NV4NwKmdkjVNcTpGEnckdGH9aPbPenG0rg
         tn27xQCqnbxL/N+IxQ/msBN4G+NLK+1G1n3BmcLERacB/AJ0lYuxc7AiQHN4Vsa4c9ml
         n5xA==
X-Forwarded-Encrypted: i=1; AFNElJ+efAh2DsItVWXkBMTI1qCopCAWyioWXZk3RJHyMA/zjww1VIlR0fW1NL1xGSuzHvD87U3QJ7yjWXsy@vger.kernel.org
X-Gm-Message-State: AOJu0YxTV7d2yoiW6oNzCc0LDAdoKXaH4m3uThCbEKiBcu/h8JHdSwvz
	u14foAkLanBfpOER+WhcmR/UVPIOEMvPD87Rol91NyslmkaGfNaasY9ACvgMhVUAOsjdRr7bPoh
	YeytTxDlkKyaB6RN0PeWkfDFOVUBeyiBUcqSN/+/OLpjcSuDY07uWxvBCzwGQ+/fp
X-Gm-Gg: Acq92OEaTJFk9ITtKvxc5jgQm3qf2OVuY33bM5wLUx0i9SO5QF7Y0t//xroe1JzIeE5
	Xl6ETSGSwUgrZb/pGDxGNqjsTpwuaSUSxLD47k9K8kHRrJ4udlUzn8u8UsweTDbMc8N/JIIk97q
	+Pu0/o5lPEJetO0k+VIDPspi3kR+4myi55Kz3Aczv9dIUjw4Bey8e5Fjl/uYSV98nwZQje/+7XY
	B8o9H7CHVUItQk+pRRzndQbhN2V67YrQ8242lzUsh1vsqHNODsj9EoMS6nWQHu49FgYoifr0jke
	R+ev9SI7lWUyrPunM5ByFUop/ur5ND6ohe5EncK8zH12qo3QxwCAk8Ww+BZH/rfdGoBF7yq7RXY
	fXVSqfpYh6bKhPisfpy/9e8Yll/TaCwdvb5SS
X-Received: by 2002:a17:903:1b4f:b0:2b7:88d8:efee with SMTP id d9443c01a7336-2ba7a340633mr92494715ad.28.1778181738303;
        Thu, 07 May 2026 12:22:18 -0700 (PDT)
X-Received: by 2002:a17:903:1b4f:b0:2b7:88d8:efee with SMTP id d9443c01a7336-2ba7a340633mr92494455ad.28.1778181737773;
        Thu, 07 May 2026 12:22:17 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bae7874767sm6012535ad.72.2026.05.07.12.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 12:22:17 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 08 May 2026 00:52:00 +0530
Subject: [PATCH v3 1/2] dt-bindings: pinctrl: qcom: Document Shikra Top
 Level Mode Multiplexer
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-shikra-pinctrl-v3-1-771144cdc411@oss.qualcomm.com>
References: <20260508-shikra-pinctrl-v3-0-771144cdc411@oss.qualcomm.com>
In-Reply-To: <20260508-shikra-pinctrl-v3-0-771144cdc411@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778181728; l=4519;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=jvyJCe0RN8MCcynlAWEz42sn7roJV11eMx4pxGp1l2E=;
 b=Me/o864+36S2EWlBKzGgNBLGitpdPK9s7G6zjHfL7l03B1xlVBUrlrGdLVKlfQjTxV0et/HsC
 RF9S7bNs+00AyJyIpeRf8ZTRW00EL46dnu9GAmBAqznQMNzuDcDDuWC
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE5NSBTYWx0ZWRfXwqFIRJmjaVsl
 v1cqubCHx4Y+Q6UnKPNib9GHjzukot9BKEbclMprnMvup0YoQ6/XhNkd/pnGwDzM/tkHY3E8wyA
 d6vmZ8j8+yoPnhxBfaump0TXcIvKy4YkRsHj5Jrb2Q9ECl/l6fKCvFuqJh43yUUcqnyXLmyVnd3
 9U5fyC/4UZgXzoPldNaYgS3DG/e10k+nEPArt9MKlF2lLwDpELW348on2b3CxcPbXeKzgIvaL8P
 wDI3FfvzHe13hXE5sKr4B6H7044H4U2HvwHK6m7OahVlbNP3RKlSgDDjXb4YtDGmQTNXBRcYvOF
 pog1jqb05aV+rTVg//k3uG0s/lZ8goljLEU9Qec5P2imdaf0xnTsnDJUBEZguJufUeGGrEcuog8
 szpgBAiHJfjKla7uNvVmUVzvvLGtqizgYtfRhVknyB2t1rdvQi+ULeVEcrV4P1IVarY+XaWI9ae
 iYRlXRmB9sr2cwgG0Bw==
X-Proofpoint-GUID: 4IdSV8gAxWiiaTZumGomCa4QKNwWVJeN
X-Authority-Analysis: v=2.4 cv=VNbtWdPX c=1 sm=1 tr=0 ts=69fce66b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=bT5XQOCXPleopHcqzpYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: 4IdSV8gAxWiiaTZumGomCa4QKNwWVJeN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070195
X-Rspamd-Queue-Id: 22EBB4EDF59
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-36408-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,devicetree.org:url,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.7.161.32:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
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


