Return-Path: <linux-gpio+bounces-36039-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBjdMAV6+Gm3vgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36039-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 12:50:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 726294BBFF0
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 12:50:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC77D3030E84
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 10:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24A953A6B67;
	Mon,  4 May 2026 10:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iXIhppIg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WiPTwtQX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846D53A6B69
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 10:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777891739; cv=none; b=lko+yhRBdKoKR7fq55a0BgyNVEwaxJZTmqNIyh7TJOqB5NXsBcJGk8O01+BQ0QDS7Mt/SzYQO29yePJdNEu6LBgBHqYYzQ2jdEsnm8s24fDyTPseOQJRhljXtxYTklz8J9FPkn+6dvCslZtGXLYB2dyYJEYEmcVvtGvFoXcXIVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777891739; c=relaxed/simple;
	bh=4L9GSadaTqjS847eLA+jgX3kru06L5o3Zua4WBwh3Bs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mMkmVonWfaJM6AKvgHTolyUCD6iQ3HYj2FHp0Xfrfn4wzQXaTAILJOU1RgxoMCrZUJJySqz+0hfMGqBqaKUuy0Ta1MYZ4kmi1y4GWhjUlBYejPURW/f2yjLfE72Dp3t7WUXnpRO6Op+OagLtYl2xq+ySgAZJ/2gU+IEiXIrM5TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iXIhppIg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WiPTwtQX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644A4mSr1023638
	for <linux-gpio@vger.kernel.org>; Mon, 4 May 2026 10:48:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W/NWoJ86tsBPOoL5OWdYWRw+Uiqwt7SKkRaGiuslUW4=; b=iXIhppIgFnFix+WS
	0NsXHauV2S69GcCnV8W5SNyhw7gOodVik1i5CKzQ0VGT46+fDWSBpU3Uvdtwx9CW
	P7HyLVi15krWk99Qx5JcPIdg0r92vKyYjzYck+Woao8fRSjH8dH8ID1a2HfngkPS
	44mSJSCjwVoQLJnX9JooqlhCWkVTfwoUuDCrmzjCUIVE87GgIYRI02kQ53uGgA9s
	hrzslDk0TF+DNBkEm98jAK0fUivNo4zgiti0d70XerOzWhTH8bZn8BkMvPnY2pPR
	HnCY2iyunjAykASZ+oOIs48/h1QEviPEGMmnOT7iZluK+qTuuYOUKIEyk89pIzWo
	HguVGQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxscy843x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 10:48:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24cd2e2b3so37849945ad.0
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 03:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777891737; x=1778496537; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W/NWoJ86tsBPOoL5OWdYWRw+Uiqwt7SKkRaGiuslUW4=;
        b=WiPTwtQXhw9iRUZ8Jub3JXgh79wFuHpiq47ktgxwlgQ0wOygCBIEjGwtwx3y4ADItp
         8TZInJRl7a495vtsl8r9Q6NPFnBS0d8EXPkAho5VgGOcZCJjI532xZ+Lf7qVuF1xGsTO
         5ZrvuTdr2N1tmyJcL7TZM2BOOpo9np6NENVDae595Fc/y/snUh847mFrPPPwB0xOeDCd
         Ngw6yyizeQqeQl4lD2/LfKGa0pWr7A9mPrN3xYdmp6iFg52NmAFwYMMQVwCvXX7gMple
         Qos5l2n3S8VSOrMjK7LKbsNi1+cc07DScAt5z/JGmtTLhMbaVfq8H9jNfB8pVEGnU/LE
         c3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777891737; x=1778496537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W/NWoJ86tsBPOoL5OWdYWRw+Uiqwt7SKkRaGiuslUW4=;
        b=f+imBiOPmzXA+CN3y5kGgoe/mKb/tnRmaSShqgo81lhne3bnOweDzbEJ536f/PUtEf
         DBOW/bhbGisf2Uv+nsVno3Xem2Qq9uG0k6kjZQ8Nq1n+2JAOJ2xLlJRLDtwughjqoICr
         MFUHVtmII0eB4fpsfwvvWRJk05NA4UehSYbo2OzxBqjHZwVJLBUB9e5LDdCca0G+mscb
         hSx3Sh+JHOl8EVZhDLsjIgrzOAEJ3pRhoe0CFFM8ToToJkME7aA78wx5gMUQaxrcK/kh
         zKh+MBeyWxkTPQq0wiybL7eDmnO3UdKYQjcuj2rh09vIwmH86awUfI9WywFmBVi/4uSf
         w1aA==
X-Forwarded-Encrypted: i=1; AFNElJ9kdb9mUs5eh8qL6P6EWeQdOmxkI3sWEpIJs2I0xTCTpLmRKa4AdOxC5b55A2J/nwBUnz8KBQLJMSLE@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl33Opl+hYLwQiNaqKrmxdNe8HO688ZZHgAPn0M6Eb8ei5HzDz
	HApXPRZLCsag1/BB5IXAC3H62A21oBNkbT8LO3aOmONOE63XUclOobqoVQdxsjHEkRYEVdmBRRF
	jTC8AIGBmxIr5dCQBON9Spfn4r9++OVoRBHtKHtU5FcETN+uZ238F/spEt9Kdj+dl
X-Gm-Gg: AeBDiev3Z5CYJqrIzuzUxO5Ea67FvoE7JFqdrDn1XQWT1ccDqznVRY4cmZkNuyPc5cE
	p3JrallhiW6oT7tYmwAgxskJVKfxJH7s6wB0EpZzD3XY1FPJYCTqjWJoNqfez2ivQQbX3QZ55Uc
	jSEzHlJ+W9ityKjc+wVDyvzYV70gmWgR3wlt+qGO7xr5y7KtwAI5zcj7aH+gXQqKXqEYmzEcMUO
	Uyv829MifUlrmVg15ji+ua6s8/U3ge6cUdMU/qv4CE/aLh7XrDCyGprGxfFYwlhpCoz2IHQiA7q
	mheVHsVr2QQGnLkSq252QZ406OGoV1VurlfG8uV6LHuWiOW1ZOyw5cCUjK7MFpZg1zaI8MS50TS
	GtFXsy0HPoHXn3RtEQdFrMCIGnJBftDdnLb61WoIvadwgt1I=
X-Received: by 2002:a17:903:1984:b0:2b4:689a:e411 with SMTP id d9443c01a7336-2b9f2808d2fmr80450325ad.22.1777891736601;
        Mon, 04 May 2026 03:48:56 -0700 (PDT)
X-Received: by 2002:a17:903:1984:b0:2b4:689a:e411 with SMTP id d9443c01a7336-2b9f2808d2fmr80450085ad.22.1777891736076;
        Mon, 04 May 2026 03:48:56 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae68443sm96799365ad.81.2026.05.04.03.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:48:55 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 04 May 2026 16:18:42 +0530
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: qcom: Document Shikra Top
 Level Mode Multiplexer
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-shikra-pinctrl-v2-1-14e9dcc2d685@oss.qualcomm.com>
References: <20260504-shikra-pinctrl-v2-0-14e9dcc2d685@oss.qualcomm.com>
In-Reply-To: <20260504-shikra-pinctrl-v2-0-14e9dcc2d685@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777891727; l=4446;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=4L9GSadaTqjS847eLA+jgX3kru06L5o3Zua4WBwh3Bs=;
 b=hCr9Bt3CEH+/nEzT5GTj0Qf3eoUBVbeEy5riyuXTkejAUR96lvx1n7PxuNy9rl2ka4dirsAWI
 T/XAjjE5b2FCTwzKYVqkFY0PrUeE3g61WftANgo+R8S9sMf9RNdb7Jo
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDExMiBTYWx0ZWRfX0n0dnRespnjN
 fCMkPC4O3FsYMTUdqWJvFGp9vw4ClzvjS+wqztQ5kiZrwjgB1nuTfK7EEvG5jKvOnkejVIvHJWd
 eBrmCby2mzrDb9NWTqW0tnXj9qynWAUfZFEIh88oBLhW+AhHHOLv5hY+GlN1spaZ18KC1C6Zzky
 t2hgmono1wY14UoOaj+Haqh3w8YZnxrxluaelc38p+I2j+RlmZNePjIDZzcgzP/2Uwa84yWITO0
 x80R6FPXc+lPD2mAGEP95G1RenZnrZKZVh+ZN/fnJfcff859koo37SJaG2qunIkkE8hrVT4NZ61
 nqETnpzJYOCFf1ZGQpDPQglYXeC5jZlGAuoSAAkpSoL5i3JEfaChBI86pnaWoXpcOJUnNKGvGeG
 t9268nMB0SPEw8JIfKuJnNn24lsisMWyjJPTGerjfASzY4kQWnzjLAdVn17pTlYlpc4KJLG8HhF
 VfJ8YnP7vOcdGb4w1vw==
X-Proofpoint-ORIG-GUID: DwImsBkN1qSugWkcqlc2A8TYyJGnyRTz
X-Proofpoint-GUID: DwImsBkN1qSugWkcqlc2A8TYyJGnyRTz
X-Authority-Analysis: v=2.4 cv=C47ZDwP+ c=1 sm=1 tr=0 ts=69f87999 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=bT5XQOCXPleopHcqzpYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040112
X-Rspamd-Queue-Id: 726294BBFF0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36039-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.7.161.32:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

Add a DeviceTree binding to describe the TLMM block on Qualcomm's
Shikra SoC.

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


