Return-Path: <linux-gpio+bounces-33108-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFkDNbxCsWlCtAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33108-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 11:23:56 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1022620CC
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 11:23:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCE7F3412635
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 09:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B7DD3B47FA;
	Wed, 11 Mar 2026 09:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvoqHCBZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PzakSXel"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1003AD52C
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 09:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773222363; cv=none; b=qkQQT6CloKyrv94tyi2IKDuqOCd4Tl2lt9nSZTThRvv1ZhDGjDpUd8/jfX1eEg4CGD0dYAfS/sg+oTyV7h88AgrQNETG0mJgq8BkO/DxPK4GRkHC2Eag1y1zyZpK5ymcpuGHD3pOcfZPah04qPh7P1XNAXXsJvfOogwbNa+kHgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773222363; c=relaxed/simple;
	bh=mgL4T4zq8SrqOF5sZUo/cgqZOCX5LCBi8q1BG4HWIBU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rNN+7/pjrkYf8l+Npml5FpRtYKLu9bTN8Te/mGGgruUvSATu95M2iSk/aJtqvL0uNwOvThpp8cOqFhxHy2qJ8lELiShyhDKIOldlsA6FWpuf5HS0JMFlnyvSQklsv6W22F+Hschp44dXiQ4747cJwv/mMU/dsFqWQ8MocrWs+00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvoqHCBZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PzakSXel; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B6ZkFE1439664
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 09:46:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JTqPkA63h/REyVYZEsOXgiUw3wOTyUtNc6lXzIT+I9Y=; b=lvoqHCBZR6ww30Ci
	yrqMq5AjjbUScuMKppWRtLL0PY6n6LMpRVG0B/z5FBjplEdfuZKtD6DkEpcCU74x
	UZmeQ2QC71GtcfBM/E/opdItRGluym9SS2hPweyagCluMzaY2y3EGkpOWJnGNdk4
	IgjRl5hlw+kIy5ibynCjYgDKL2jQIwUGm2H/QcNu2oE4X8mfsvyYv9FuZ2kZKRCX
	iDybS9F0OudnGLcEfq2adzzGow2NuezRoAAr27P8rtSXvsvXacmeIGLCEuuQJGui
	/JlIQ9wWwASavsy6jIxvJ7pIOIyAkWLCsHFIvfwmujHOZ6ZLJWvHq9CinbCAQEP/
	kbo4UA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu38ygp8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 09:46:00 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c73781252edso26001519a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 02:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773222359; x=1773827159; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JTqPkA63h/REyVYZEsOXgiUw3wOTyUtNc6lXzIT+I9Y=;
        b=PzakSXelUyqil4du7gjKGYydiC4RUD5xgjP2Obf5zqIIY623Q4Kx97tEyHjGHu2Q9g
         DDyi/JlCgqZhPHdY5dpXRtnWJZy+BZWkS1R5OlHnfNJQw7TKAEkGm50pL3BhtPmjEcxC
         Qsgc7vSB/qyVmD59vs9hWudpnGbp6CwipiYCHNLHvIwKLFNe9rVm0KZ42VxojAfxpJHN
         V5THT68yHi1L7u3yQuUFo/yJQPJpbIp81my3zM6wbwYu/DJoLBSS1pNXVh1CPiKdwlg6
         8PFsVdS7pDmhrlu8M+o/B87SUDpNagIvyXYulbmi+abrlj8UTFFhHIb5K4eaBMGgoRSQ
         j0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773222359; x=1773827159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JTqPkA63h/REyVYZEsOXgiUw3wOTyUtNc6lXzIT+I9Y=;
        b=KgPGErMx1JLJjyDkFn1YFOnysGs4TZUkN3pPgFeqRUtSNQuM6SA3vpR0cxHvf9pGOI
         xGbR8Uyu1DYWWscuQuiWBrTmrJyIfZqpp1UPqUSrd1LmFfGJKTxdyJ6DIvWtKinnmnwu
         BmhQEPl8z27s6leXoQWx1w2SfM5yOd9hUAknJCGrUv5nkX/gBakN36xGqRsz5NSkosVZ
         u2TswY/upWp4YU3a+yKvNimUXbffkUEBuVJAsU7UfRJBcb2ZMznox8z5j0uKt5+xAoya
         RK0R5R407E+ZJsg8YMyTxZ7ie2MUxEPOaPgF5OiJTd1s728CPOLFOHGCnQukCiDlxMrW
         fEYg==
X-Forwarded-Encrypted: i=1; AJvYcCXGj123AEsjQpVE+F1cZlZ3IAkKN4wvEKk54aJ0l86QqUuaP6I2hYINkCPzM9Oll/Os/XlSg4mogxMR@vger.kernel.org
X-Gm-Message-State: AOJu0YxS8cMiE+xtyh36CXTkQ7Y28eKn5OgcxYDwKBKZV2rGl5mWUm02
	8EZhh16CW95vh3gCza8CpRlug89pQWboJtmj+QZQ8mWkh4P2QSJlKAE6Rp/gVg8bIPLZPYjnnLC
	SkQHefZkuPwxh0JGjVgkpS5RQ6jBM8YAnbNDfU+Xd9MAKrDTbeuLWVI5i8zPFO9psJlkRCwFE
X-Gm-Gg: ATEYQzyKHuJPHS8DEfc/xg7crTpuQtVOHWJBpQb1ZNEN4HOnU1pL/4b/uDQTf90OLjH
	4oYYmuutN3q0l/cOj7itcf1Ts9L/ECrEkMBgxvzYb4fAfiaF3XVGX0z+T/xZUs+DQVyGIKO9JRj
	QuhQyUDoQBDrL7oHdZpq8ZqahnjHdXyRQV0uFh8++ac8xy7I6FfnNWMgf96XvwQR3Unq/kyLUqj
	FrfWHEkTpkk8y5/6jJbWsEMrBOX9gMT0kqbAaIHVlGpF/aDnZNlLDKUFRcBj/GOMEhRfwY9yIAj
	xzdoumlkK/Rh97bRFvp606Z/evYpJBURNB715AvF81wNei4rSyJZ3cVkmfrmiXi8lstXDzpqFzY
	f+WS1SZ6zSTnfOXfzC7uSIdla9o1CB1ny7iaD5pHB2y7NfVE9ifLjeALARtzziMQp2whMqOuUUJ
	m9c5LIu6GyUateoeJQP83lnB6oW41fyrJIVxXmu3rEtzC3wyzIP3f9ca6j
X-Received: by 2002:a05:6a00:2d13:b0:81f:31c3:2e34 with SMTP id d2e1a72fcca58-829f703e38amr1889040b3a.25.1773222359333;
        Wed, 11 Mar 2026 02:45:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d13:b0:81f:31c3:2e34 with SMTP id d2e1a72fcca58-829f703e38amr1889002b3a.25.1773222358826;
        Wed, 11 Mar 2026 02:45:58 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6df5ff0sm1677403b3a.21.2026.03.11.02.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 02:45:58 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 15:15:43 +0530
Subject: [PATCH 1/9] dt-bindings: clock: add Qualcomm IPQ5210 GCC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ipq5210_boot_to_shell-v1-1-fe857d68d698@oss.qualcomm.com>
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
In-Reply-To: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773222347; l=12446;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=mgL4T4zq8SrqOF5sZUo/cgqZOCX5LCBi8q1BG4HWIBU=;
 b=BxsL64DCF52v6B14atw2V1xnuPaNV8aYRauuRv0NHt6OzjE4xTcvUbMWFwzu+NNO6dHynG0Xi
 uRSTdjm1RR9CBConlgtkDettTLCVuakcH/4PRhY+iWZ3EEhYnEw1fWA
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA4MSBTYWx0ZWRfX29t6WTTKmq1X
 IluB4ppVW4aVtxqlaK//NuAiY6E6pczlzl3sXr1UH/8HKtJlYRwS6I2asaxs+fgzKDNeYfcXfIC
 ks7YpA/2bLLQRgv+2q3+FWtYeeJKHihpSpXSDc0RT9BhgvKh4NvzAcx0fPpLHTrESn6HfIdKzfl
 RcKnboxkUMxeNaa69s2K+ukFeXc+udRhaYRdtS7p/WBrssC01EAfhBIsx9cw0OOd5NmDHGJJSN4
 rePjEB5xOEwuhokhQ5TjNTxf7Wizx0h9ozQc7fShB/JFIWRfljeM4aFpG6dt8QBIBg/RmVwIiyR
 9xbqUpLjl3RWFKRoD9SZkVsX990XNLkLp4LBgF8RNgUc8iaSn4dAsFoYwcVLYADwZX1qRAcv/z3
 Tgn9OWvFeslSSGML+cOs1GvHxT4sH1VJfeV9ZEobZlZOo7YOTHeq4/W6MpdzkCvrv2VDnwEF4we
 xgkM8oFv5JXUtb2llMQ==
X-Proofpoint-GUID: MtWw-7XGzajZUVafQy0js6K0Ku0Wk5Yg
X-Proofpoint-ORIG-GUID: MtWw-7XGzajZUVafQy0js6K0Ku0Wk5Yg
X-Authority-Analysis: v=2.4 cv=Cq+ys34D c=1 sm=1 tr=0 ts=69b139d8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=os79_l1IAaEW0h9aLhsA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110081
X-Rspamd-Queue-Id: 3A1022620CC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33108-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,devicetree.org:url,qualcomm.com:dkim,qualcomm.com:email,0.27.119.64:email];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,pengutronix.de,linaro.org,gmail.com,gurudas.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add binding for the Qualcomm IPQ5210 Global Clock Controller.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 .../bindings/clock/qcom,ipq5210-gcc.yaml           |  62 ++++++++++
 include/dt-bindings/clock/qcom,ipq5210-gcc.h       | 126 ++++++++++++++++++++
 include/dt-bindings/reset/qcom,ipq5210-gcc.h       | 127 +++++++++++++++++++++
 3 files changed, 315 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq5210-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq5210-gcc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..aeb5d9a3f8322d5d36d2fd19a1d23b275efc34b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq5210-gcc.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,ipq5210-gcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller on IPQ5210
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
+
+description: |
+  Qualcomm global clock control module provides the clocks, resets and power
+  domains on IPQ5210
+
+  See also::
+    include/dt-bindings/clock/qcom,ipq5210-gcc.h
+    include/dt-bindings/reset/qcom,ipq5210-gcc.h
+
+properties:
+  compatible:
+    const: qcom,ipq5210-gcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Sleep clock source
+      - description: PCIE30 PHY0 pipe clock source
+      - description: PCIE30 PHY1 pipe clock source
+      - description: USB3 PHY pipe clock source
+      - description: NSS common clock source
+
+  '#power-domain-cells': false
+
+  '#interconnect-cells':
+    const: 1
+
+required:
+  - compatible
+  - clocks
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    clock-controller@1800000 {
+      compatible = "qcom,ipq5210-gcc";
+      reg = <0x01800000 0x40000>;
+      clocks = <&xo_board_clk>,
+               <&sleep_clk>,
+               <&pcie30_phy0_pipe_clk>,
+               <&pcie30_phy1_pipe_clk>,
+               <&usb3phy_0_cc_pipe_clk>,
+               <&nss_cmn_clk>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,ipq5210-gcc.h b/include/dt-bindings/clock/qcom,ipq5210-gcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..84116f34ee4d0433a092987e8d189c2aa95da204
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,ipq5210-gcc.h
@@ -0,0 +1,126 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_IPQ_GCC_IPQ5210_H
+#define _DT_BINDINGS_CLOCK_IPQ_GCC_IPQ5210_H
+
+#define GCC_ADSS_PWM_CLK					0
+#define GCC_ADSS_PWM_CLK_SRC					1
+#define GCC_CMN_12GPLL_AHB_CLK					2
+#define GCC_CMN_12GPLL_SYS_CLK					3
+#define GCC_CNOC_LPASS_CFG_CLK					4
+#define GCC_CNOC_PCIE0_1LANE_S_CLK				5
+#define GCC_CNOC_PCIE1_2LANE_S_CLK				6
+#define GCC_CNOC_USB_CLK					7
+#define GCC_GEPHY_SYS_CLK					8
+#define GCC_LPASS_AXIM_CLK_SRC					9
+#define GCC_LPASS_CORE_AXIM_CLK					10
+#define GCC_LPASS_SWAY_CLK					11
+#define GCC_LPASS_SWAY_CLK_SRC					12
+#define GCC_MDIO_AHB_CLK					13
+#define GCC_MDIO_GEPHY_AHB_CLK					14
+#define GCC_NSS_TS_CLK						15
+#define GCC_NSS_TS_CLK_SRC					16
+#define GCC_NSSCC_CLK						17
+#define GCC_NSSCFG_CLK						18
+#define GCC_NSSNOC_ATB_CLK					19
+#define GCC_NSSNOC_MEMNOC_1_CLK					20
+#define GCC_NSSNOC_MEMNOC_BFDCD_CLK_SRC				21
+#define GCC_NSSNOC_MEMNOC_CLK					22
+#define GCC_NSSNOC_MEMNOC_DIV_CLK_SRC				23
+#define GCC_NSSNOC_NSSCC_CLK					24
+#define GCC_NSSNOC_PCNOC_1_CLK					25
+#define GCC_NSSNOC_QOSGEN_REF_CLK				26
+#define GCC_NSSNOC_SNOC_1_CLK					27
+#define GCC_NSSNOC_SNOC_CLK					28
+#define GCC_NSSNOC_TIMEOUT_REF_CLK				29
+#define GCC_NSSNOC_XO_DCD_CLK					30
+#define GCC_PCIE0_AHB_CLK					31
+#define GCC_PCIE0_AUX_CLK					32
+#define GCC_PCIE0_AXI_M_CLK					33
+#define GCC_PCIE0_AXI_M_CLK_SRC					34
+#define GCC_PCIE0_AXI_S_BRIDGE_CLK				35
+#define GCC_PCIE0_AXI_S_CLK					36
+#define GCC_PCIE0_AXI_S_CLK_SRC					37
+#define GCC_PCIE0_PIPE_CLK					38
+#define GCC_PCIE0_PIPE_CLK_SRC					39
+#define GCC_PCIE0_RCHNG_CLK					40
+#define GCC_PCIE0_RCHNG_CLK_SRC					41
+#define GCC_PCIE1_AHB_CLK					42
+#define GCC_PCIE1_AUX_CLK					43
+#define GCC_PCIE1_AXI_M_CLK					44
+#define GCC_PCIE1_AXI_M_CLK_SRC					45
+#define GCC_PCIE1_AXI_S_BRIDGE_CLK				46
+#define GCC_PCIE1_AXI_S_CLK					47
+#define GCC_PCIE1_AXI_S_CLK_SRC					48
+#define GCC_PCIE1_PIPE_CLK					49
+#define GCC_PCIE1_PIPE_CLK_SRC					50
+#define GCC_PCIE1_RCHNG_CLK					51
+#define GCC_PCIE1_RCHNG_CLK_SRC					52
+#define GCC_PCIE_AUX_CLK_SRC					53
+#define GCC_PCNOC_BFDCD_CLK_SRC					54
+#define GCC_PON_APB_CLK						55
+#define GCC_PON_TM_CLK						56
+#define GCC_PON_TM2X_CLK					57
+#define GCC_PON_TM2X_CLK_SRC					58
+#define GCC_QDSS_AT_CLK						59
+#define GCC_QDSS_AT_CLK_SRC					60
+#define GCC_QDSS_DAP_CLK					61
+#define GCC_QDSS_TSCTR_CLK_SRC					62
+#define GCC_QPIC_AHB_CLK					63
+#define GCC_QPIC_CLK						64
+#define GCC_QPIC_CLK_SRC					65
+#define GCC_QPIC_IO_MACRO_CLK					66
+#define GCC_QPIC_IO_MACRO_CLK_SRC				67
+#define GCC_QRNG_AHB_CLK					68
+#define GCC_QUPV3_AHB_MST_CLK					69
+#define GCC_QUPV3_AHB_SLV_CLK					70
+#define GCC_QUPV3_WRAP_SE0_CLK					71
+#define GCC_QUPV3_WRAP_SE0_CLK_SRC				72
+#define GCC_QUPV3_WRAP_SE1_CLK					73
+#define GCC_QUPV3_WRAP_SE1_CLK_SRC				74
+#define GCC_QUPV3_WRAP_SE2_CLK					75
+#define GCC_QUPV3_WRAP_SE2_CLK_SRC				76
+#define GCC_QUPV3_WRAP_SE3_CLK					77
+#define GCC_QUPV3_WRAP_SE3_CLK_SRC				78
+#define GCC_QUPV3_WRAP_SE4_CLK					79
+#define GCC_QUPV3_WRAP_SE4_CLK_SRC				80
+#define GCC_QUPV3_WRAP_SE5_CLK					81
+#define GCC_QUPV3_WRAP_SE5_CLK_SRC				82
+#define GCC_SDCC1_AHB_CLK					83
+#define GCC_SDCC1_APPS_CLK					84
+#define GCC_SDCC1_APPS_CLK_SRC					85
+#define GCC_SDCC1_ICE_CORE_CLK					86
+#define GCC_SDCC1_ICE_CORE_CLK_SRC				87
+#define GCC_SLEEP_CLK_SRC					88
+#define GCC_SNOC_LPASS_CLK					89
+#define GCC_SNOC_PCIE0_AXI_M_CLK				90
+#define GCC_SNOC_PCIE1_AXI_M_CLK				91
+#define GCC_SYSTEM_NOC_BFDCD_CLK_SRC				92
+#define GCC_UNIPHY0_AHB_CLK					93
+#define GCC_UNIPHY0_SYS_CLK					94
+#define GCC_UNIPHY1_AHB_CLK					95
+#define GCC_UNIPHY1_SYS_CLK					96
+#define GCC_UNIPHY2_AHB_CLK					97
+#define GCC_UNIPHY2_SYS_CLK					98
+#define GCC_UNIPHY_SYS_CLK_SRC					99
+#define GCC_USB0_AUX_CLK					100
+#define GCC_USB0_AUX_CLK_SRC					101
+#define GCC_USB0_MASTER_CLK					102
+#define GCC_USB0_MASTER_CLK_SRC					103
+#define GCC_USB0_MOCK_UTMI_CLK					104
+#define GCC_USB0_MOCK_UTMI_CLK_SRC				105
+#define GCC_USB0_MOCK_UTMI_DIV_CLK_SRC				106
+#define GCC_USB0_PHY_CFG_AHB_CLK				107
+#define GCC_USB0_PIPE_CLK					108
+#define GCC_USB0_PIPE_CLK_SRC					109
+#define GCC_USB0_SLEEP_CLK					110
+#define GCC_XO_CLK_SRC						111
+#define GPLL0_MAIN						112
+#define GPLL0							113
+#define GPLL2_MAIN						114
+#define GPLL2							115
+#define GPLL4_MAIN						116
+#endif
diff --git a/include/dt-bindings/reset/qcom,ipq5210-gcc.h b/include/dt-bindings/reset/qcom,ipq5210-gcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..09890a09087c39288683d105437fc68f3d68be4c
--- /dev/null
+++ b/include/dt-bindings/reset/qcom,ipq5210-gcc.h
@@ -0,0 +1,127 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_RESET_IPQ_GCC_IPQ5210_H
+#define _DT_BINDINGS_RESET_IPQ_GCC_IPQ5210_H
+
+#define GCC_ADSS_BCR						0
+#define GCC_ADSS_PWM_ARES					1
+#define GCC_APC0_VOLTAGE_DROOP_DETECTOR_BCR			2
+#define GCC_APC0_VOLTAGE_DROOP_DETECTOR_GPLL0_ARES		3
+#define GCC_APSS_AHB_ARES					4
+#define GCC_APSS_ATB_ARES					5
+#define GCC_APSS_AXI_ARES					6
+#define GCC_APSS_TS_ARES					7
+#define GCC_BOOT_ROM_AHB_ARES					8
+#define GCC_BOOT_ROM_BCR					9
+#define GCC_GEPHY_BCR						10
+#define GCC_GEPHY_SYS_ARES					11
+#define GCC_GP1_ARES						12
+#define GCC_GP2_ARES						13
+#define GCC_GP3_ARES						14
+#define GCC_MDIO_AHB_ARES					15
+#define GCC_MDIO_BCR						16
+#define GCC_MDIO_GEPHY_AHB_ARES					17
+#define GCC_NSS_BCR						18
+#define GCC_NSS_TS_ARES						19
+#define GCC_NSSCC_ARES						20
+#define GCC_NSSCFG_ARES						21
+#define GCC_NSSNOC_ATB_ARES					22
+#define GCC_NSSNOC_MEMNOC_1_ARES				23
+#define GCC_NSSNOC_MEMNOC_ARES					24
+#define GCC_NSSNOC_NSSCC_ARES					25
+#define GCC_NSSNOC_PCNOC_1_ARES					26
+#define GCC_NSSNOC_QOSGEN_REF_ARES				27
+#define GCC_NSSNOC_SNOC_1_ARES					28
+#define GCC_NSSNOC_SNOC_ARES					29
+#define GCC_NSSNOC_TIMEOUT_REF_ARES				30
+#define GCC_NSSNOC_XO_DCD_ARES					31
+#define GCC_PCIE0_AHB_ARES					32
+#define GCC_PCIE0_AUX_ARES					33
+#define GCC_PCIE0_AXI_M_ARES					34
+#define GCC_PCIE0_AXI_S_BRIDGE_ARES				35
+#define GCC_PCIE0_AXI_S_ARES					36
+#define GCC_PCIE0_BCR						37
+#define GCC_PCIE0_LINK_DOWN_BCR					38
+#define GCC_PCIE0_PHY_BCR					39
+#define GCC_PCIE0_PIPE_ARES					40
+#define GCC_PCIE0PHY_PHY_BCR					41
+#define GCC_PCIE1_AHB_ARES					42
+#define GCC_PCIE1_AUX_ARES					43
+#define GCC_PCIE1_AXI_M_ARES					44
+#define GCC_PCIE1_AXI_S_BRIDGE_ARES				45
+#define GCC_PCIE1_AXI_S_ARES					46
+#define GCC_PCIE1_BCR						47
+#define GCC_PCIE1_LINK_DOWN_BCR					48
+#define GCC_PCIE1_PHY_BCR					49
+#define GCC_PCIE1_PIPE_ARES					50
+#define GCC_PCIE1PHY_PHY_BCR					51
+#define GCC_QRNG_AHB_ARES					52
+#define GCC_QRNG_BCR						53
+#define GCC_QUPV3_2X_CORE_ARES					54
+#define GCC_QUPV3_AHB_MST_ARES					55
+#define GCC_QUPV3_AHB_SLV_ARES					56
+#define GCC_QUPV3_BCR						57
+#define GCC_QUPV3_CORE_ARES					58
+#define GCC_QUPV3_WRAP_SE0_ARES					59
+#define GCC_QUPV3_WRAP_SE0_BCR					60
+#define GCC_QUPV3_WRAP_SE1_ARES					61
+#define GCC_QUPV3_WRAP_SE1_BCR					62
+#define GCC_QUPV3_WRAP_SE2_ARES					63
+#define GCC_QUPV3_WRAP_SE2_BCR					64
+#define GCC_QUPV3_WRAP_SE3_ARES					65
+#define GCC_QUPV3_WRAP_SE3_BCR					66
+#define GCC_QUPV3_WRAP_SE4_ARES					67
+#define GCC_QUPV3_WRAP_SE4_BCR					68
+#define GCC_QUPV3_WRAP_SE5_ARES					69
+#define GCC_QUPV3_WRAP_SE5_BCR					70
+#define GCC_QUSB2_0_PHY_BCR					71
+#define GCC_SDCC1_AHB_ARES					72
+#define GCC_SDCC1_APPS_ARES					73
+#define GCC_SDCC1_ICE_CORE_ARES					74
+#define GCC_SDCC_BCR						75
+#define GCC_TLMM_AHB_ARES					76
+#define GCC_TLMM_ARES						77
+#define GCC_TLMM_BCR						78
+#define GCC_UNIPHY0_AHB_ARES					79
+#define GCC_UNIPHY0_BCR						80
+#define GCC_UNIPHY0_SYS_ARES					81
+#define GCC_UNIPHY1_AHB_ARES					82
+#define GCC_UNIPHY1_BCR						83
+#define GCC_UNIPHY1_SYS_ARES					84
+#define GCC_UNIPHY2_AHB_ARES					85
+#define GCC_UNIPHY2_BCR						86
+#define GCC_UNIPHY2_SYS_ARES					87
+#define GCC_USB0_AUX_ARES					88
+#define GCC_USB0_MASTER_ARES					89
+#define GCC_USB0_MOCK_UTMI_ARES					90
+#define GCC_USB0_PHY_BCR					91
+#define GCC_USB0_PHY_CFG_AHB_ARES				92
+#define GCC_USB0_PIPE_ARES					93
+#define GCC_USB0_SLEEP_ARES					94
+#define GCC_USB3PHY_0_PHY_BCR					95
+#define GCC_USB_BCR						96
+#define GCC_PCIE0_PIPE_RESET					97
+#define GCC_PCIE0_CORE_STICKY_RESET				98
+#define GCC_PCIE0_AXI_S_STICKY_RESET				99
+#define GCC_PCIE0_AXI_S_RESET					100
+#define GCC_PCIE0_AXI_M_STICKY_RESET				101
+#define GCC_PCIE0_AXI_M_RESET					102
+#define GCC_PCIE0_AUX_RESET					103
+#define GCC_PCIE0_AHB_RESET					104
+#define GCC_PCIE1_PIPE_RESET					105
+#define GCC_PCIE1_CORE_STICKY_RESET				106
+#define GCC_PCIE1_AXI_S_STICKY_RESET				107
+#define GCC_PCIE1_AXI_S_RESET					108
+#define GCC_PCIE1_AXI_M_STICKY_RESET				109
+#define GCC_PCIE1_AXI_M_RESET					110
+#define GCC_PCIE1_AUX_RESET					111
+#define GCC_PCIE1_AHB_RESET					112
+#define GCC_UNIPHY0_XPCS_ARES					113
+#define GCC_UNIPHY1_XPCS_ARES					114
+#define GCC_UNIPHY2_XPCS_ARES					115
+#define GCC_QDSS_BCR						116
+
+#endif

-- 
2.34.1


