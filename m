Return-Path: <linux-gpio+bounces-30772-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5B9D3C4FC
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 11:21:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A6F1B569AEF
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 09:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 194DB3D2FF2;
	Tue, 20 Jan 2026 09:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fCVZiF7X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J9ZxKABe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5812C3D3339
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 09:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768903027; cv=none; b=gQOfbCf22K4zWtS6LPbeAC9tQ+gU4pG4JQ3Xx/yQ1FXrGdRj0NL3Ha3xLXq0Mhc9aCp3cm5Dr9XqD8yTtXbrHXkegLGFQUUZRG1DSbqjefCU8hIeVqFeyeOOKpQnRMasiNR8ZNtgHN0+woYMZx7AcIlESVbCYfAMrNK+z4CQqrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768903027; c=relaxed/simple;
	bh=e1Ei+Vg6/eqnOVvDJH79AZ/tLbgMbADWxoq4raCL2dQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jLppH5pkUNoG9EtTV8BTximt8s7eeb2QPrBmYdMS58SfJP/G9PdynEgw73DNepC0CEnydtdGeG+MvXIlWhWrVN0pvHDRHScHgKMNJJUvHAW9SVQdWiPtLe6llc+ujn/4EvTzGlQR2KWySdWuikTF0ZrmSgGtYZhduD0qAo595LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fCVZiF7X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J9ZxKABe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K9Uuln3177315
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 09:57:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uzm1SobnY00hEMmsJKkt8iXWNak+ayoq8nsnUXqD3Io=; b=fCVZiF7XllNuSkNU
	EcyFZqaihgZNxcxrWHWf5W/BT/B7deIyFPP8YSyZ8X9d717Ku0NqA9fDdtpVzegE
	g4IrKDEY5yZ/rEdegsBIncdMba4xkzEW14yVG+tGMrOUJy17I/mz7ZAQ8HLh1NJf
	YuU1C3RbjwcSBRi0O7JQTIim+yugQBg13E2mMVmb21hH9C0YeYgZ+bEqaFzw2v5A
	5+ec9/nFOgZdSfcYcSyHBhuXqqn0HPVo1cz+8zeh9jCcZ1x5lN9Pg119H3cF3U+9
	nPRULbygZW+rgGOgD6aG66QBUe+QZEg8uoAa5Wsmt768SWGuWP1TelYMX3gLvI7p
	HZ6cAA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt0p2h9r8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 09:57:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5014c9ee70bso133239401cf.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 01:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768903022; x=1769507822; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uzm1SobnY00hEMmsJKkt8iXWNak+ayoq8nsnUXqD3Io=;
        b=J9ZxKABeJqkn9aQwARmi2AnF599T/L5ZKHkczwi64jB3NPftswkDMnnCbFKF4v6v3l
         3nJVvqOmEvh8xiMv3Mqdxs2VHdU9i4jqV6WjPeIvhgwbPq1ZFrYpEamJm7Af+CMjRyzU
         RYj0p0kqwmw/KFGhkjUjkktutOfr1bhZLDeYp0y1DZ4jLa83O+cFw1u8GIa445tVRHaE
         3fz8VqLgbIdccR74PsVhrgZrha08XeFmG0SiPrrqaWqoj3fVo6jWt/M3HX7Wk61FjnDo
         EWOTDJ3ruI1JV1MWXCw+v5ESeMh3qvpi7QFM4eqdwm+O9gT+gNVIZM6xXf2dKqOppf9M
         OiBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768903022; x=1769507822;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Uzm1SobnY00hEMmsJKkt8iXWNak+ayoq8nsnUXqD3Io=;
        b=BdFwvPmteTrwrH00v5IGBY0d1bfgeqehRu4VxQYZNZPmeLIsNYvGrUegEqtoIRFoP3
         tdCOBgdXsecO+fM8MKBBie5TNu0Z21XNGkWgx7QVyoRO5+/ugqHaWVRJEXmVPrVt1wbg
         A6qRCphexXmjT4PeICxMEaTx4eumlyNKsiT6QfGBGuH7/pYmlw3ogd+CHBNqsF1EUqPk
         jSuXa3s/ZZNfKfaSKl6jb16myu+TjAynozSFmrersrAlpvmRkYnmgCkusYzwhXb5sOKa
         4Tn8LVq8t8MfsbZ5HPBlge9p/jeRZCp4wBWWSzb9lqJrkJA+TuotYTcYyTPy0oeZYBQt
         5d9w==
X-Forwarded-Encrypted: i=1; AJvYcCUcwfLCm7kmHu1UicObD8kuEDZmtjHrMQsrwW/JrlHErcK7ENXt5+BY7BQ/TWhHezUjbNMfAH7fzHco@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+/x3n1bCLirSxxHjD4L8L7r3hIex1vOiBpbuX1Alx6ewCNRn5
	ycu7f295TfqQBmeczUDfrwgBOEWfM3aS0cBZ2QELSgkZb0UYvAnb1kHZzDG7JvgAYctnxIC4LiN
	jV9PS0nTZadn9697J8OP7PHERc/CgWSvtKPIzKFwsFRJfVtRhxCSYPnLA5cBwU4lL
X-Gm-Gg: AY/fxX4Z5FazoyycB+K+zngYbWqd3x/2dtbz1AXyewrHu18SQOxyh6Y2p8DfK8gNDFH
	S0aezjT31aRziD1GkzDzuucj658OK8iak2lOihfvrK8QOJPCGwfiTn94MCB5yS26/ddhvUdVC0W
	uxYQMvnD89+QKkMOw0/x8Je/aYWCOq4vKwhWlPLVW9OO57vWYXStvEt1QOGSbgCsNWl1NtZgzE0
	ofbrxa6sav9YYSb2Pcfs4hkWQcxDjOHbAmS0EBAOFyq1RPKMEr//mcUbATQAvnSM9t6Y4/iswOf
	xnUzEKSActAJ6tmI4n6eFZP+WsJeg3Y05rfxmE4pyNHX5zvRgm1v2ghYvsdJ6kkui5RvBDkLDbn
	Vl64wFTSjkPc9cM1QdA==
X-Received: by 2002:ac8:7dc3:0:b0:502:9f6b:a3b3 with SMTP id d75a77b69052e-502a1e60bbamr183631911cf.37.1768903021441;
        Tue, 20 Jan 2026 01:57:01 -0800 (PST)
X-Received: by 2002:ac8:7dc3:0:b0:502:9f6b:a3b3 with SMTP id d75a77b69052e-502a1e60bbamr183631621cf.37.1768903020805;
        Tue, 20 Jan 2026 01:57:00 -0800 (PST)
Received: from hackbox.lan ([86.121.163.152])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654533cc543sm12697032a12.20.2026.01.20.01.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 01:57:00 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 11:56:40 +0200
Subject: [PATCH 1/3] dt-bindings: pinctrl: document the Eliza Top Level
 Mode Multiplexer
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-eliza-pinctrl-v1-1-b31c3f85a5d5@oss.qualcomm.com>
References: <20260120-eliza-pinctrl-v1-0-b31c3f85a5d5@oss.qualcomm.com>
In-Reply-To: <20260120-eliza-pinctrl-v1-0-b31c3f85a5d5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=5286;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=e1Ei+Vg6/eqnOVvDJH79AZ/tLbgMbADWxoq4raCL2dQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpb1FmHh6EVn8GDdgqbPM71dQ+Xv3++cIXfnARy
 jf8+kqCvdeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaW9RZgAKCRAbX0TJAJUV
 VvBLD/9UyWk4DMA2oAPjtdWJ0tobHcrWrxyAUyWuz01JkkW9LpiG1B0EyL6vQcQz+AULg2O2JXM
 +ZIEeUubKdgu+p3tZEH71npEiNksOCb97dZSuYeAuN/KCbraba3JdXNO21bei/myowEy9svl18m
 Vi4FlV3ug9P5sMD3kXh/7ZLKXf5PsIwiSK+0hQHBiBKvdA/54SreTCtRFRXR8jbucRZ9DrBbopt
 eu/Oc/hjT/FFNT7eVK7JTsEacxJXvge3DatfeHfWtq3qqPNWPuhebVrF+pQtBHTBINRvDaSEiBw
 tZ4KoUItsY1t531frY+k3I+1SD4ItYPwWPR03sSF8GjHg4OguzQtADLwqNRbgaSCXvut+YlDcli
 4bIuOb6RAObDRVDk0KNBedZDR6GxIwlTg5PKH7/W8f4Hjy25e4YW4rt2VLiRKSqWu3Ap3S3HavW
 VrlwhYXZWyxbcnlib+86ZBsJyRNPxKMTUoxFEd8f26SebzUlNZsfuo3Uan77sgdUnYyBJHviGH1
 rBcDFRK3M+3nIdZrc4Mu73r+775CL7cIJz8I3h6TxCWyvdkJJev4w7KgZFemNWiAaBaep5A6iS/
 B8oaDz2aS2rEKLd67TsSNmskdaHIJXZYPysj9wqb5ABtWY3v12ec1pcJ3sGc+ZtPTJkmI7N9BAO
 Jj78uiSmkdamcKg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: pauducCX-kXgHNnyLVXBRktmaduFJjUF
X-Authority-Analysis: v=2.4 cv=drTWylg4 c=1 sm=1 tr=0 ts=696f516e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=RUlelSpolvTNyr7Sls5SJA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=RS--hHaVoNrYE_hnkMsA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: pauducCX-kXgHNnyLVXBRktmaduFJjUF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA4MiBTYWx0ZWRfX9ouLeabIro/K
 iqoBZaOAG56x6AypNQ91Qf27ejrMpoo79xmDw9dFMt8PUSyNYjX4CIv2kDyXsZcBYOqvL20jA5S
 J0SUOk2UNO2F11/JlCnuYYRnHttk/ZyqHFryPeC3DHVPqMWILsSE072GM04oxmsTQkX0COuq+mt
 AbgH6Sn5Hi3y4T2OLBjamzlEXwNI1gncuhsrgq6R3wwU8UTQx0bEJoyZW9vFeK57wdnqhJR0X/K
 5xlbQdKR3LuVPv+USizLG1Q1jib47HZwPSrp9AI4+A1L7KgV3gSoEHuPh1O8/iEU0TsyhkT+cK0
 FvPrJHvXcba9agRI/CjiMecwavFKxD8ewr4H50B4n2vexSM9ujfYGf9AwjHo/U1UJXeCwNBPljI
 gGzGqIbjdYHDG59BgH1kib3k9Q+euV6rFZmo/waSyKAZD+Pmi+khXty9+wT8P2xpubB17F3v3XZ
 aM4Awr0E4WFEsgrBCgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 clxscore=1011 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200082

Document the Top Level Mode Multiplexer on the Eliza Platform.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,eliza-tlmm.yaml          | 138 +++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml
new file mode 100644
index 000000000000..3a07ee8d7218
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
+    maxItems: 167
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
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-5][0-9]|16[0-7])$"
+            - enum: [ ufs_reset, sdc2_clk, sdc2_cmd, sdc2_data ]
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
+        gpio-ranges = <&tlmm 0 0 184>;
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


