Return-Path: <linux-gpio+bounces-33115-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGLLEzo7sWkLswIAu9opvQ
	(envelope-from <linux-gpio+bounces-33115-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 10:51:54 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BF726149D
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 10:51:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EB90B301CC65
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 09:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AAE835A3A5;
	Wed, 11 Mar 2026 09:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ibRKGMNe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZX550CL8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4ED33C7E17
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 09:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773222406; cv=none; b=fhbop0dcbrZiTXy6RTnCOh4uMZ7kzTrP3EApBWtTn7UWO51AlqN8v3k/bHHoBUxs2lIOju6wpKCAt/VCXwmTWpL4e6r35368mtUT93x/1LSy3PZk5TQE/DWhDA0SSeS4f/yzsXEnOTAMVVCXQ6HmW4xE2E/vZNNcFe/ikv8E8PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773222406; c=relaxed/simple;
	bh=dlSRQRF023jUCsl4IbZQYSPJTNojRWXNTDfxc219h60=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m3w+sx6uYLJKz3QYJGgg2NjuKWbCcLMygf5V+ivbEBBuuIeAYeSB7nBNWo1l3bWu0HBTQi6czPt1rV8rFly6P2eE8V5XJBW63rqazLOFratXjQjM002QQNINpZH64YJLxRnIh4hfpHWb1kEVD5scCYsR+uTid+gFC8X8+pwLmAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ibRKGMNe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZX550CL8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B39gOV1572990
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 09:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rTbEoV0hyy7vqrDrUVYYCNskWpUbY7aA9D9UBNlH3PU=; b=ibRKGMNep8PLO3xM
	69xZfy4J8/+5rAqvWC2Nzf3PQxm5gWdYHmXWfPn6Z0bZhcOiVMaLy9saOS4xNLXS
	YhXzNbhOmRVsllbPEORd6eiihYQgYunQz05et8wJhkwz+SkJRdaXvhteJotJRJd1
	awgrG4r0Wt33/02eYmb2dFkf5cy0bfVouQEyUsKEqV9lpunH5RhXjibZsAtA15Lu
	3/eomMbJUZP+pOyimtLIpgoHwf/7kdBgDCNFgJ0grgXyhUrn++GGe3tsXP1JmRa4
	ntZI35p5ZFc0NhDBJoXyKvmMV8ePM4If6EcfTmxMi0mZn/l2rMi5SaMW1/vqnWeK
	ybLLUw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqgkay5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 09:46:41 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-bce224720d8so8033229a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 02:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773222400; x=1773827200; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rTbEoV0hyy7vqrDrUVYYCNskWpUbY7aA9D9UBNlH3PU=;
        b=ZX550CL84rOs0ujnmnnyBWzKEb3t8qXSFByyEo2+F8SQh11fnJ/B823PtWLkQd/jqH
         0NoQKqP/MVbQnLFx+BUCgE1NsWUs7lP8iBUDAJK7S9RvMeM8iaKLSVhx9F/0vbVCGJ9G
         ZJyigsmRntDKVds6SqfyX6ezN6PqB1O++/mCC/TzpbQl0FebdOf6f8nK9HTbGZLO02vo
         5Yg8QRC3SlbvEPxRs9vN6kaDkYzS5l5qz5p3bodLwVmpg9lhAAFIHwxAe84v6zDyhc8x
         2ZbSDMqr9jDRQlQSlGHGMZ8tmSaFUbS+YAzTsJbb6MRxvGbbAdXD3H48gqb8rGVvDpbP
         V4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773222400; x=1773827200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rTbEoV0hyy7vqrDrUVYYCNskWpUbY7aA9D9UBNlH3PU=;
        b=BPYvXwhMHoW7ezv0k2d/L6kLEFNzAaTzTzTnY/pykYxwyRqOvvVRDXJ5KV5KluUn5v
         Hrs87KvCovyedDomt86//jVjnQaAMzwjcPv7WTlFD3AYIr0BWkswd4vvH/I+nDUDmlZI
         6n8kAgLQh6TUCWzdZimqNidjwzEMFCxyy8ZkEjJCVRt3aWWv+CfJTnKUEel+MSotdlmy
         gBFkSScCHT1oj+1yzF9weujKfYqOe8wUvJwXByw136oqYQbXs5ew8vYUot7AERYUqBwK
         4kA5xHsjuWzEGpPlLT5iRxLBnp3Xk84H6SDu8BrfP01V97C5XfpGLntXXzuxow1XEQ4N
         kbBg==
X-Forwarded-Encrypted: i=1; AJvYcCWDJBefqmPRRBqObiudg7ukKWoUXe4K+Ncujv7RvEhJM4or5z5ao6HMy9ESysqn66e0wmhyQnATYi12@vger.kernel.org
X-Gm-Message-State: AOJu0YwLApDIjgQeZEj6Nh3zZI0ORzmotuwjSasosh9FkRHYDhdH/zjh
	AJ9cWg7KdP5756QugZiazsFY6359mn1VqUaaC0P9VBkdZgPO603y5F1EEP2nbKMy+/J/njf7JTn
	cSqBVdSPeDLbi+ULiZsxhCXus3T7TZ4+SiXDqIyUvZf9nJ2w5/hW2gFN/Cl3ENy0R
X-Gm-Gg: ATEYQzzeTFmAnACl0kjeU5UcX1jAEXD7m0KYpecsEKNMdGmbwR3hhuOpjrTVX556yWw
	czoXcX3gw6WespHmYjPeLexvjPe0TCMQ52/9SapZnzngoTblhhmeYEk7weGwOTQWG4bDgALhPih
	kkPcX5Gm0txuVVLSpcs5bIAhngTL/WrN9leOD66wTPFW0t3M9AwcJXIqp0eXtKVItPeV73X30rs
	JHfL8fbmHzdIztWXwpTSt5K3ATdrOnfBXykXbQ4GQsFdu0Qxx9afDwLQLZSnzT4ATWRUjiFnQL+
	jVahRx4T+S7JUw6UvJViq4j/bz/iByY1mDOa7NcmuIiOJW7fQNdxwYXrGPgr/HOFjd2XYroF8UN
	jY3JsMO1Lwz3QvqNY7K8o5uheIoIuwq07F/RE9EP2onbcp45vfTJypkApcTTUbH2lb1n+CTnJ8a
	URBqmOfqicxjh/uCwwQb1dRDSgHMmYK3BgqADfTWqM1iegZztFLA+gPk2q
X-Received: by 2002:a05:6a00:3405:b0:823:3079:7c7 with SMTP id d2e1a72fcca58-829f6ed6de2mr1953823b3a.29.1773222400299;
        Wed, 11 Mar 2026 02:46:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:3405:b0:823:3079:7c7 with SMTP id d2e1a72fcca58-829f6ed6de2mr1953800b3a.29.1773222399737;
        Wed, 11 Mar 2026 02:46:39 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6df5ff0sm1677403b3a.21.2026.03.11.02.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 02:46:39 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 15:15:50 +0530
Subject: [PATCH 8/9] arm64: dts: qcom: add IPQ5210 SoC and rdp504 board
 support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ipq5210_boot_to_shell-v1-8-fe857d68d698@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773222347; l=10487;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=dlSRQRF023jUCsl4IbZQYSPJTNojRWXNTDfxc219h60=;
 b=qIko03d3wIkBuaJSeXL1R9YQKDCjfVPfJVR4ZnzgiUwI6+6g9dbjOoTKOItDFJ4JJ9SbEo2MR
 Q+O+XozkBTODSw38ebYhPY+EpvoEuDKPoxjEHDBoigTr+Y3rArztMz8
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: 3NUX4pOWpRg_s_lseOCRG-TvIBnF8AS0
X-Proofpoint-ORIG-GUID: 3NUX4pOWpRg_s_lseOCRG-TvIBnF8AS0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA4MSBTYWx0ZWRfX6GmRDb7mTmZT
 lf+1+m6/iRW3+pSBse+PRfibr+H2MrmXQS0DvWS/9O9KdsWHfKxk0cJcdPmPhNmJg4YqalwhlsL
 06gYvp5qOlhNtbsqQ0aLtZkSMPRqKbu7vRa1P49Y9IIqghapwDy02U/dX/7wmaSf9II9LYP6IvK
 KvKd3tFaXtrZSynZPfQWJE66emi0L28YM8bDy4UdTkZbGbAYmIIMPkczgIi+YFluE9LLCZ47PFF
 kC0z4GHZFUGZT+IjS/SDIbHPj4Vczs6fqEgZWo2PlQ1BnTU+stCQ2qB1RszGPxha+GtgLfZpObF
 m5wW++GFjYKAUFJlYd9G1suqO4oZJqQoDn4Z3O7apmFja1jdgkksatNCfP+K0BwKqtCBob/EmFG
 Uuyfk5xw9zpzZrpqwB8HKFd33/DEV67zpc+F59WLyjH3aMQ1+yydObPGNXvVzYpOxV88WmVHAuF
 Sy1GSe7TARgucTL9MWw==
X-Authority-Analysis: v=2.4 cv=M4JA6iws c=1 sm=1 tr=0 ts=69b13a01 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=fBkTXTPqfNaV2XDYC8MA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110081
X-Rspamd-Queue-Id: C5BF726149D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33115-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,pengutronix.de,linaro.org,gmail.com,gurudas.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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

Add initial device tree support for the Qualcomm IPQ5210 SoC and
rdp504 board.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile           |   1 +
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts |  93 +++++++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 304 ++++++++++++++++++++++++++++
 3 files changed, 398 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 02921a495b2cbabcbacc74fbbb99eafe1f6478ac..e7748af640cccffa5c83ec82c37aa441444c2b13 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -22,6 +22,7 @@ hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= ipq5210-rdp504.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp441.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp442.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp468.dtb
diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
new file mode 100644
index 0000000000000000000000000000000000000000..3d95939785bc5bd4f510e2f992f0a1e80848c8de
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "ipq5210.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. IPQ5210 RDP504";
+	compatible = "qcom,ipq5210-rdp504", "qcom,ipq5210";
+
+	aliases {
+		serial0 = &uart1;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+
+	soc@0 {
+		qupv3: geniqup@1ac0000 {
+			status = "okay";
+
+			uart1: serial@1a84000 {
+				pinctrl-0 = <&qup_uart1_default_state>;
+				pinctrl-names = "default";
+				status = "okay";
+			};
+		};
+	};
+};
+
+&sdhc {
+	max-frequency = <192000000>;
+	bus-width = <4>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	pinctrl-0 = <&sdhc_default_state>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&sleep_clk {
+	clock-frequency = <32000>;
+};
+
+&tlmm {
+	qup_uart1_default_state: qup-uart1-default-state {
+		tx-pins {
+			pins = "gpio39";
+			function = "qup_se1_l2";
+			drive-strength = <6>;
+			bias-pull-down;
+		};
+
+		rx-pins {
+			pins = "gpio38";
+			function = "qup_se1_l3";
+			drive-strength = <6>;
+			bias-pull-down;
+		};
+	};
+
+	sdhc_default_state: sdhc-default-state {
+		clk-pins {
+			pins = "gpio5";
+			function = "sdc_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		cmd-pins {
+			pins = "gpio4";
+			function = "sdc_cmd";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		data-pins {
+			pins = "gpio0", "gpio1", "gpio2", "gpio3";
+			function = "sdc_data";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+	};
+};
+
+&xo {
+	clock-frequency = <24000000>;
+};
+
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..b959162737c87d8c44fd18cd7e954f85f797085a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -0,0 +1,304 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,ipq5210-gcc.h>
+#include <dt-bindings/reset/qcom,ipq5210-gcc.h>
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	interrupt-parent = <&intc>;
+
+	clocks {
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
+
+		xo: xo {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0>;
+			enable-method = "psci";
+			next-level-cache = <&L2_0>;
+		};
+
+		cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x1>;
+			enable-method = "psci";
+			next-level-cache = <&L2_0>;
+		};
+
+		cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x2>;
+			enable-method = "psci";
+			next-level-cache = <&L2_0>;
+		};
+
+		cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x3>;
+			enable-method = "psci";
+			next-level-cache = <&L2_0>;
+		};
+
+		L2_0: l2-cache {
+			compatible = "cache";
+			cache-level = <0x2>;
+			cache-unified;
+		};
+	};
+
+	firmware {
+		optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+
+		scm {
+			compatible = "qcom,scm-ipq5210", "qcom,scm";
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the size */
+		reg = <0x0 0x80000000 0x0 0x0>;
+	};
+
+	pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		bootloader@87800000 {
+			reg = <0x0 0x87800000 0x0 0x400000>;
+			no-map;
+		};
+
+		smem@87c00000 {
+			compatible = "qcom,smem";
+			reg = <0x0 0x87c00000 0x0 0x40000>;
+			no-map;
+
+			hwlocks = <&tcsr_mutex 3>;
+		};
+
+		tfa@87d00000 {
+			reg = <0x0 0x87d00000 0x0 0x80000>;
+			no-map;
+		};
+
+		optee@87d80000 {
+			reg = <0x0 0x87d80000 0x0 0x280000>;
+			no-map;
+		};
+	};
+
+	soc@0 {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0 0 0 0 0x10 0>;
+
+		tlmm: pinctrl@1000000 {
+			compatible = "qcom,ipq5210-tlmm";
+			reg = <0x0 0x01000000 0x0 0x300000>;
+			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&tlmm 0 0 54>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gcc: clock-controller@1800000 {
+			compatible = "qcom,ipq5210-gcc";
+			reg = <0x0 0x01800000 0x0 0x40000>;
+			clocks = <&xo>,
+				 <&sleep_clk>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		tcsr_mutex: hwlock@1905000 {
+			compatible = "qcom,tcsr-mutex";
+			reg = <0x0 0x01905000 0x0 0x20000>;
+			#hwlock-cells = <1>;
+		};
+
+		qupv3: geniqup@1ac0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0x0 0x01ac0000 0x0 0x2000>;
+			clocks = <&gcc GCC_QUPV3_AHB_MST_CLK>,
+				 <&gcc GCC_QUPV3_AHB_SLV_CLK>;
+			clock-names = "m-ahb", "s-ahb";
+			ranges;
+			#address-cells = <2>;
+			#size-cells = <2>;
+
+			status = "disabled";
+
+			uart1: serial@1a84000 {
+				compatible = "qcom,geni-debug-uart";
+				reg = <0x0 0x01a84000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE1_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+		};
+
+		sdhc: mmc@7804000 {
+			compatible = "qcom,ipq5210-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0x0 0x07804000 0x0 0x1000>,
+			      <0x0 0x07805000 0x0 0x1000>;
+			reg-names = "hc",
+				    "cqhci";
+
+			interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq",
+					  "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
+				 <&gcc GCC_SDCC1_APPS_CLK>,
+				 <&xo>;
+			clock-names = "iface",
+				      "core",
+				      "xo";
+			non-removable;
+			status = "disabled";
+		};
+
+		intc: interrupt-controller@b000000 {
+			compatible = "qcom,msm-qgic2";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			reg = <0x0 0xb000000 0x0 0x1000>,  /* GICD */
+			      <0x0 0xb002000 0x0 0x1000>,  /* GICC */
+			      <0x0 0xb001000 0x0 0x1000>,  /* GICH */
+			      <0x0 0xb004000 0x0 0x1000>;  /* GICV */
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges = <0 0 0 0x0b00c000 0 0x3000>;
+
+			v2m0: v2m@0 {
+				compatible = "arm,gic-v2m-frame";
+				reg = <0x0 0x0 0x0 0xffd>;
+				msi-controller;
+			};
+
+			v2m1: v2m@1000 {
+				compatible = "arm,gic-v2m-frame";
+				reg = <0x0 0x00001000 0x0 0xffd>;
+				msi-controller;
+			};
+
+			v2m2: v2m@2000 {
+				compatible = "arm,gic-v2m-frame";
+				reg = <0x0 0x00002000 0x0 0xffd>;
+				msi-controller;
+			};
+		};
+
+		timer@b120000 {
+			compatible = "arm,armv7-timer-mem";
+			reg = <0x0 0xb120000 0x0 0x1000>;
+			ranges = <0 0 0 0x10000000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			frame@b121000 {
+				frame-number = <0>;
+				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xb121000 0x1000>,
+				      <0xb122000 0x1000>;
+			};
+
+			frame@b123000 {
+				frame-number = <1>;
+				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0b123000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@b124000 {
+				frame-number = <2>;
+				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0b124000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@b125000 {
+				frame-number = <3>;
+				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0b125000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@b126000 {
+				frame-number = <4>;
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0b126000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@b127000 {
+				frame-number = <5>;
+				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0b127000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@b128000 {
+				frame-number = <6>;
+				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0b128000 0x1000>;
+				status = "disabled";
+			};
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+};

-- 
2.34.1


