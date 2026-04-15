Return-Path: <linux-gpio+bounces-35167-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BaWO/J332kATgAAu9opvQ
	(envelope-from <linux-gpio+bounces-35167-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 13:35:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 865ED403DF6
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 13:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 97FDE311D897
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 11:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E58437F728;
	Wed, 15 Apr 2026 11:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B8R2VLDS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XgZHSVd/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176E437DEA7
	for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2026 11:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776252590; cv=none; b=vBViXBOqBxODYLxfz66VaLjicDYGpUhJ7UNt99e/JJQYtKJG6p2sa5X9edIdRvhJuVLsGg9CRm55kPFmM+Ea75/BgEMsIp629nAZwamFJVPFlFNRg6sHuIuXQSG2KwnA3/qK/8sLwbMFtn4oKPVVuKZNQtdHBvNby3+8haPWfG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776252590; c=relaxed/simple;
	bh=Kw7qLT5MhFXRMxGuny+FowYlCESO4Y+NTzQw2T7ofD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z0CmeIglpkqt4qZxl5rxcXfULkQwK/MA28d/qu8SexyntSMM16MMPkYl+HE2icGEIysrnL91ngGAYCAUKUOlwt3W2BGCuX4ruxG+DpOOlbSEp+aDJg/ONsuvb6OVmlmCMGnCqtoitC0Vhn3zDMr55DITmlXUFCI7b1Bu546KrZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B8R2VLDS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XgZHSVd/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F8NYj02972410
	for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2026 11:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dGbMTA0vTAbpSe432K7wxx+b2nfGZSxHUs6IcUD3ETk=; b=B8R2VLDS5hMPvKNN
	9JlMW2gHy8eokyof1el8lE4S3nCuaoaz64XZ1atuudmgEIwO/mmjFf9kTjIXgRaH
	2f4N4Q9Ts/uw6oqCqr2v4LLHREifDWlGLChnbAEHcDDqaVD5TVPis7b609r94wzC
	wmnpBAVlx5dUetjuAK1AyYgrqWJ5kIyJfON1n/IPURSHkDnoAXRjHQatUchPCCXU
	cg/5VC2VDpT77hk+GTsb/Gq12KSOpJat9j1IhRMPwYPgYRAoQZFHziJttsed86/g
	pWdvjxhD75YmYJZT5fsDQao5rNNw8XDN6r8EC1hd+7EqkLJZZU12z5rbmSyOkoEI
	WLfEnA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj74g8kf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2026 11:29:47 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c76bb22a8ceso6995944a12.2
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2026 04:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776252586; x=1776857386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dGbMTA0vTAbpSe432K7wxx+b2nfGZSxHUs6IcUD3ETk=;
        b=XgZHSVd/VCV28zAAsptHvBLVTStvy3bu4M/bf1rzByRl+nOGD4fj9pSjccJtl6QPXV
         82RpZvO6HkeT+VAhibCG5GZAFqZAc4meV9DMOJGKzNim0Zg0JBVKOFDj8hkZeNrdaIOO
         sXtgsBp7xCpFsyR19HFsNMcXcfNpGoTF08H8KlW2WgsZMfn29lYBR/Dmqq+ujJeGCNIK
         iUFGpSeU3amjfNTs8zMg7mnJqMTDO7Ua9w332wolnd9Pjl1qaSzHjXmPmLAOsSFO20Kt
         vSpKAfncIrpdNzA2M76NA5pjfs76BczBZdUsMfGUbQ7nr8FslNYQi1F8nkBKGRkxU/mK
         82Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776252586; x=1776857386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dGbMTA0vTAbpSe432K7wxx+b2nfGZSxHUs6IcUD3ETk=;
        b=Sv02RKtWJ4RiQy4OxFAopx3WKeJ1vbHax6toms4nYpYXwdzymXf5vE8bYiZVw3NR42
         DBRfmXT7FClCiW6MvzHSi7C10/Q+NvC8n+gwUI107qUH/WWZ8zt8ySOMIGZKtBXjp0NT
         646GO1TrYzcehqWUtgrjFZNpiZpahzixCr3VlCeVF+OjJGqQEu2nPVtLAGyWg02bHDa4
         HgxsSuay3LDVkITZpgfxGH6p4lAIXdnwY3eVdb42bZLrGrpK8mzCbC2aCtHzwaIamlxY
         FYNl87qEWxgIDRTKLIZPzBDQl3x/2IGf5Bq5rzdK6PjxxmSlTpQEIBVMdhQJXj0etu1x
         E31A==
X-Forwarded-Encrypted: i=1; AFNElJ+4FIuldUr3oLzmiHuuAWqqpGf/k+8w+qtM1hqSZ+VmDcMq+zAB78gIRSPpm7RmyJF07oEzApf+eWt6@vger.kernel.org
X-Gm-Message-State: AOJu0YzAsEsU/xQqtjS+T8cbHpmn5wMKfBeBjHn3dVLoxNS2V/x0KmYD
	H4vnGO2PJP9NX7zAoEH0PyuObQl9CI69jnkUl+AUhcmiT0dv0TvFG5Az5PVjEPeap2YXlw4x2he
	och1jC0jEcw16rPxuUq/QP3mUmXEeVWTzUu5JnFmpm/mZTe2emWSt/sTRTryY+QuE
X-Gm-Gg: AeBDieu8yLztUONbtwpBaXTRrSIPCzxxC33muY/TxmG+mCtsYU8DcKUa0xW0Ow0l24a
	FTbUSi44lhvv5LYHPSEMs5WmYJRvKo4sfmXrltH9GP9OptGZfYtjMItfup1qo5bDuGWefegnNqI
	EPgzacft8ru3Ly84k/8VC7gRaweRBSP051icA3YYemJhzULF7HXY2k+TPW7uvPqSlN6hJJ0i3vq
	8upJfAAKe2e9YyHAlYqrVf042Ce1Iy9Twcc2P2i8WuJfEWreBvJt5AbkGmqdMhHb381rrdQLI0A
	s0AongAiHdtrurD6jfiFOF2UdOZpUGcjn0Jdl3B4HBnP/mScKrvmMbgyOeRv9PqzCjsgo4FHYcx
	FOqoX8naSVA7aR4OAy0w77GPDW2/DyMALIey2aM0I7KDdOymuAaf6Ic/t71dbNhlRnjeW7NpfE0
	8YvtAntCw0sjIz4QQ1HXPx9MpfjTsRcKF195KAnzm50NicjVgXD3iIYiG7
X-Received: by 2002:a05:6300:6a02:b0:39f:3dbf:b0d5 with SMTP id adf61e73a8af0-39fe3f5b42dmr17221259637.36.1776252586042;
        Wed, 15 Apr 2026 04:29:46 -0700 (PDT)
X-Received: by 2002:a05:6300:6a02:b0:39f:3dbf:b0d5 with SMTP id adf61e73a8af0-39fe3f5b42dmr17221234637.36.1776252585535;
        Wed, 15 Apr 2026 04:29:45 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7957ecee24sm1417183a12.1.2026.04.15.04.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 04:29:44 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 16:59:24 +0530
Subject: [PATCH 1/2] dt-bindings: pinctrl: qcom: add IPQ9650 pinctrl
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-ipq9650_tlmm-v1-1-bd16ccb06332@oss.qualcomm.com>
References: <20260415-ipq9650_tlmm-v1-0-bd16ccb06332@oss.qualcomm.com>
In-Reply-To: <20260415-ipq9650_tlmm-v1-0-bd16ccb06332@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776252577; l=4547;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=Kw7qLT5MhFXRMxGuny+FowYlCESO4Y+NTzQw2T7ofD0=;
 b=1rRUE+fuFkcnI51aMj/2eYvRE8Uo0OjJ0Ci/HAGR4XE2U8RtvvHKzKv0pA37hwQDOguw6fB5x
 WFgUG2IfYj6BeNcGi8JHCHBEAxgNe1xR/y0OfbwkjK2OTWS0+Iz8upx
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEwNSBTYWx0ZWRfXyfFjL5LVBFKN
 J2c8NCapIwmdh/lVBYQ8aX0rJrmmumIpA7pKE7BrSHx6ksSkhv0s8ZG9nAzof2nYzPJk0AqSLZn
 hc6SoZSnKB6eN5neNDJtmTZP84FrNKGtmA7YwT8JycOFzRcqxShIWeRqezOnOzZJIPNiNiBRiUs
 JttRj8Oq13x5BObRMZHtWGsnjMBJ6zNSTHDiFcby9SXkO/39NLqiMlOMXre4zJ9WNLq9hdq7zYk
 EXE1fUyjUDzdVTy0fdCfsa+7G11qhEYJxv4LounWlAIpNXKgB1RaN4BIf1WXlZFGHInpOYBoSu9
 O1nDXK1qkuh2m7ixsDVs/o7o0OaSWkGXHBAYc/bkyr8WkM7G60DyU/1VPNJi7LeNC7eWos1oOfU
 korB9nG5ErfEQMqnOOVEzctglG9KOzFxN0KoRs6psGKQJqVeAhVH3Kl219AEBI3ldhMHFt3CWcP
 KCtAexZS+P4DySYS8oA==
X-Proofpoint-ORIG-GUID: SrCkVOnFu4SCwLEq_Gzl4ExDUlJ4IGyc
X-Authority-Analysis: v=2.4 cv=ZIfnX37b c=1 sm=1 tr=0 ts=69df76ab cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=N690yQSzLXC5e7GKbG4A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: SrCkVOnFu4SCwLEq_Gzl4ExDUlJ4IGyc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150105
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.15.66.64:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35167-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 865ED403DF6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add device tree bindings for IPQ9650 TLMM block.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,ipq9650-tlmm.yaml        | 118 +++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq9650-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq9650-tlmm.yaml
new file mode 100644
index 000000000000..549eaa6aa11b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq9650-tlmm.yaml
@@ -0,0 +1,118 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,ipq9650-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm IPQ9650 TLMM pin controller
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm IPQ9650 SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,ipq9650-tlmm
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
+      - $ref: "#/$defs/qcom-ipq9650-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-ipq9650-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-ipq9650-tlmm-state:
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
+                atest_char_status2, atest_char_status3, atest_tic_en,
+                audio_pri_mclk_in0, audio_pri_mclk_out0, audio_pri_mclk_in1,
+                audio_pri_mclk_out1, audio_pri, audio_sec, audio_sec_mclk_in0,
+                audio_sec_mclk_out0, audio_sec_mclk_in1, audio_sec_mclk_out1,
+                core_voltage_0, core_voltage_1, core_voltage_2, core_voltage_3,
+                core_voltage_4, cri_rng0, cri_rng1, cri_rng2, dbg_out_clk,
+                gcc_plltest_bypassnl, gcc_plltest_resetn, gcc_tlmm, gpio,
+                mdc_mst, mdc_slv0, mdc_slv1, mdio_mst, mdio_slv, mdio_slv0,
+                mdio_slv1, pcie0_clk_req_n, pcie0_wake, pcie1_clk_req_n,
+                pcie1_wake, pcie2_clk_req_n, pcie2_wake, pcie3_clk_req_n,
+                pcie3_wake, pcie4_clk_req_n, pcie4_wake, pll_bist_sync,
+                pll_test, pwm, qdss_cti_trig_in_a0, qdss_cti_trig_in_a1,
+                qdss_cti_trig_in_b0, qdss_cti_trig_in_b1, qdss_cti_trig_out_a0,
+                qdss_cti_trig_out_a1, qdss_cti_trig_out_b0, qdss_cti_trig_out_b1,
+                qdss_traceclk_a, qdss_tracectl_a, qdss_tracedata_a, qspi_data,
+                qspi_clk, qspi_cs_n, qup_se0, qup_se1, qup_se2, qup_se3,
+                qup_se4, qup_se5, qup_se6, qup_se7, resout, rx_los0, rx_los1,
+                rx_los2, sdc_clk, sdc_cmd, sdc_data, tsens_max, tsn ]
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
+        compatible = "qcom,ipq9650-tlmm";
+        reg = <0x01000000 0x300000>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 54>;
+        interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        qup-uart1-default-state {
+            pins = "gpio43", "gpio44";
+            function = "qup_se6";
+            drive-strength = <8>;
+            bias-pull-down;
+        };
+    };

-- 
2.34.1


