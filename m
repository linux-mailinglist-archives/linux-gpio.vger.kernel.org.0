Return-Path: <linux-gpio+bounces-34117-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDO/J5yqw2nAtAQAu9opvQ
	(envelope-from <linux-gpio+bounces-34117-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 10:27:56 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5CF322362
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 10:27:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 90E6A3131A44
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 09:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A868A39B94D;
	Wed, 25 Mar 2026 09:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dSMWR9Jx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gyg4WPvq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06587351C28
	for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 09:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774430372; cv=none; b=S5O5Il7T/1GStRfQ8ZQ1ziUhNv3GqTutoXEO6SujtfHQIJYWpnvn8WFA4XIvAGy/IpXs9J1H4N532gw/AL7PtoN53cjoHaP/q/tm3I658phZvt14AJVlZB4do/mktp0szJjeH18W0gfcUTCuSrZAAiGOfUh/QvJW5x60laO+tjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774430372; c=relaxed/simple;
	bh=bY0kdgk93iJpCBbfL/J18AveBPoh0X+n44UUVxZE/RI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bFKyM/PZzKywU0C6uGH3WW4xQm5QjwSZgdMOKa4fmefW6CtwN8k51DrPsFw0IJLsdlN59GQjaiXqUvcnBmq5DlYQsldOsI9rp35okwpHoMxUOeLK0e9LaG5j3Vz/CVr9eoi5XxA0mah93Xai4tY9ohZHzPwRnvCSI7D3fLR3O7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dSMWR9Jx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gyg4WPvq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P9D49Y4158270
	for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 09:19:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dIEaXKK4HaDy14ZxhInUo7AaQV7L6stAQBeiMm0zBlA=; b=dSMWR9JxP5EdbPoJ
	zj7peQiiGS+CAxaqXHd77o15tthJgF8oYTVNcl5X+GXovcT1k5cOfCxfivvZXDMK
	tgNmIg1fpQUOSfzQxETGiwn3vv4FZthdIgMel26yVY13GQzIbG+4Nt/G7xsdhy1t
	f6URQEDYQDb1Zq88DIoE0w1kVHbRBKyDjAGdbkPjczhKpSaYTYJ6LWpXI0IktIhy
	4cI5Xv1I+63XGTmRGuwmX1GtSUXUO7Itrxyme4Nd+XRviGPAFMmesHDRDZPx1sMU
	ATsi0EN8VSu2DHY5AdHSwtez3XyC/6XVXnkowYhqLCQpmynqP969zXp3WrPr/XXR
	uzutqA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4cvp00um-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 09:19:30 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82a88a2704fso529485b3a.0
        for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 02:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774430369; x=1775035169; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dIEaXKK4HaDy14ZxhInUo7AaQV7L6stAQBeiMm0zBlA=;
        b=gyg4WPvqOOSBbGuI9jjHIzeXWwHal3cAcT7s93YBcUkJh08QfiAkZef2z/E9ue/ilP
         CgDUV7QmdVR+UzTXfMRvci1ajaT/B8quEPGmFJia84vwOhCxBk257VLh8+UldQt8K6yc
         VZ8yI1hxkifMte7H6O/AILlm7E1vqu2O8+RHfAfef4fnxwZSYQ7g2kEZEZcnDIcG7ZbX
         pnfVtGekiGGarN0Zp7qY03mwkeTQu2e4Wj9n5Mwa9375ZSIlyqHsHC4GQ3GIbfzEd1dj
         bfPhEe0b12tJnx7ujtIqqV+P6qrbg0jACjo0uQVdGJ6BO3dPuRjpALg3phSURHw9Mw/C
         WYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774430369; x=1775035169;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dIEaXKK4HaDy14ZxhInUo7AaQV7L6stAQBeiMm0zBlA=;
        b=o0yfUGGGJXCBJvhK0TYiNnVW58AiNmq40cPv4l7LQlxj5iO20yek8uCaW9MGWVJ++n
         fir/gogHy8x9cuzK3qHKNOw60mf/W7I44fAUWgPPVjnqaWTWuJZxvrptL373CunWwyci
         LQm+63zD40L+UxEmmNGZJ0rM+9VNX+mFtqas5BjxgvFz9qtO91VzYJRwShyyzAiBccoc
         kK0V6n51gTuRw6Y9GBSzIFp5zilPvn4GSZc/bEnMq73KHGjqbkYwauzKhyyvBHcxwKV6
         Kgw8CIirtA3Jr02IJrcSe8WRS+2Dlt5eBHETaEPG3cf6v5wL0lXy18CRuuL+Bhsz3ypV
         1TVw==
X-Forwarded-Encrypted: i=1; AJvYcCXwVqB7Vj3URv6ro8An+ISJM08Ozt25pTaecDr/olNbyTaWm+c703zwcGzA0w7pM2OGlNFLNg/MmGaT@vger.kernel.org
X-Gm-Message-State: AOJu0YxGIcPLU3HvHMwfqrFuRnnvJaIMEXZeNqBrAWsbuaWhfudt4OSk
	ykRjO/vJEoQq4Ouwku202YRPi4YmbEpO7+Y/o+eIgFn1n9dkkLFhJI6IWrQ9/Zwe/pKzy9RYSdl
	8LKbFzgoBnQlA5sRj6AQi2avKJu6umz4ZkUDt5m7Vjo0lzhWwR7CW0vrBfkFIMLuy
X-Gm-Gg: ATEYQzxuGIxc1pkjTQ6qqzp9dBLnpkVS+Mv23i4soOhuP+lV0oARCNhjIOg+SxBDTPO
	iKrUIq/nXYtaBchg0JmwesaUu9F1yzVrIn4Ut2TAoUs6y+8qz70yeaRo42G+FEeLibJcSJgnfzb
	mFtJGtdRkt273MeTkPzXEgarwZ9djwXFgNRF8Gh6AMkjc5w13uFrQMluZOeTIZrxRmZS+jj8sPZ
	qZpie+kQ/dH0sDpdy4jAgxynZXTK9qDJtHMtwATp46fyaDtkJMtTLh3baCPU0KpuOM6gRmLKece
	ZrwmCSUv3Gab2r5xcWeXpqZ4E3PSrjGhHlMvUyBU9IpMshFmZazJNwHX2bN/gVVsMRN5zNArtKp
	LhfOhnmfbTcAbmrUWC6zVgcGFgrA7/zUm0oj3uRDrNJcuXVxcgPIiiQ8Qktfu4iH8usFtFH7DmJ
	GSAVLSHx8aJ6xKUW9zU03TY5T3BHMxuPcgDkmWpg3MXSCznDgXXfkDllyq
X-Received: by 2002:a05:6a00:349b:b0:82c:2104:ccb3 with SMTP id d2e1a72fcca58-82c5be9b0a7mr5777464b3a.17.1774430368956;
        Wed, 25 Mar 2026 02:19:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:349b:b0:82c:2104:ccb3 with SMTP id d2e1a72fcca58-82c5be9b0a7mr5777429b3a.17.1774430368396;
        Wed, 25 Mar 2026 02:19:28 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c38565096sm9643605b3a.51.2026.03.25.02.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 02:19:27 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 14:49:10 +0530
Subject: [PATCH v3 2/2] arm64: dts: qcom: add IPQ5210 SoC and rdp504 board
 support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-ipq5210_boot_to_shell-v3-2-9c7360d19d10@oss.qualcomm.com>
References: <20260325-ipq5210_boot_to_shell-v3-0-9c7360d19d10@oss.qualcomm.com>
In-Reply-To: <20260325-ipq5210_boot_to_shell-v3-0-9c7360d19d10@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774430351; l=10087;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=bY0kdgk93iJpCBbfL/J18AveBPoh0X+n44UUVxZE/RI=;
 b=JWjjCZHoUq17XXE7juuXq0ym17yhxS+WbFa9lxkfp3i9dOE3f7bcpYDz2RlKXJWevZ7uHwuC9
 yx6i+wfBCWGDm7FcB0ZteY1MfWxp4kiBcVsr/VBMae8exOq8MVQNCgo
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: Z78PK63k3dbdDV_KEqS2fPpI0OunHlLN
X-Proofpoint-GUID: Z78PK63k3dbdDV_KEqS2fPpI0OunHlLN
X-Authority-Analysis: v=2.4 cv=Q73fIo2a c=1 sm=1 tr=0 ts=69c3a8a2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Nb4-WWA3gxlMGfkpIFUA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA2NCBTYWx0ZWRfX8BaWSuw+7+MM
 isax3D19F9XCEejN1gZhx22AXWL8sU20C4LR94adLfdfQeSi7LThb95j0/6ELY2lPTLNc4uh90h
 tqxABLafK0m9bxxWOynIzHX26NCaeJr4Ms1Q6o9GrGyHeZVDqCm/eeQH6GgBk48ZQxdJo6VRKg+
 G+Ftpoxx0LbnxujFcAEvTPNNPw3oRByDbz3FRomcn5BSqebo6eHm+hNLbw4FOKwkAhAKJ8vURnS
 lkTp4xDJ2Hz4Txca59hsVSi75DQwLgyYM4LKmMP8bJ8eJl9EeL0A2u8rW05W+CPb3wBbIrRn3AD
 Z4H8VirxTvCOt7UTOWgesTxu3OcqN1UpmBAzEJ8jXMZLkRqLW2Kuu8UrJhNmt3lsYpd68dy02iH
 ts75MgkR3/Hh+IyUlyHaPKQzKeqnW3fzmQZCpb9z1W2zsmcyCT0/6T5BhLijiQsXElecTyl06m4
 UMo5APuwgsKILJgpe6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250064
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34117-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,pengutronix.de,gmail.com,gurudas.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 5C5CF322362
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add initial device tree support for the Qualcomm IPQ5210 SoC and
rdp504 board.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile           |   1 +
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts |  79 +++++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 311 ++++++++++++++++++++++++++++
 3 files changed, 391 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index d69e5f3132c4..c46d94bb6dd5 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -23,6 +23,7 @@ hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= ipq5210-rdp504.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp441.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp442.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp468.dtb
diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
new file mode 100644
index 000000000000..941f866ecfe9
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -0,0 +1,79 @@
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
+};
+
+&sdhc {
+	max-frequency = <192000000>;
+	bus-width = <4>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	pinctrl-0 = <&sdhc_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&sleep_clk {
+	clock-frequency = <32000>;
+};
+
+&tlmm {
+	qup_uart1_default_state: qup-uart1-default-state {
+		pins = "gpio38", "gpio39";
+		function = "qup_se1";
+		drive-strength = <6>;
+		bias-pull-down;
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
+&uart1 {
+	pinctrl-0 = <&qup_uart1_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&xo_board {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
new file mode 100644
index 000000000000..3761eb03ab24
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -0,0 +1,311 @@
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
+		xo_board: xo-board-clk {
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
+			next-level-cache = <&l2_0>;
+		};
+
+		cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x1>;
+			enable-method = "psci";
+			next-level-cache = <&l2_0>;
+		};
+
+		cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x2>;
+			enable-method = "psci";
+			next-level-cache = <&l2_0>;
+		};
+
+		cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x3>;
+			enable-method = "psci";
+			next-level-cache = <&l2_0>;
+		};
+
+		l2_0: l2-cache {
+			compatible = "cache";
+			cache-level = <2>;
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
+		dma-ranges = <0 0 0 0 0x10 0>;
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
+			clocks = <&xo_board>,
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
+			uart1: serial@1a84000 {
+				compatible = "qcom,geni-debug-uart";
+				reg = <0x0 0x01a84000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE1_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
+
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
+				 <&xo_board>;
+			clock-names = "iface",
+				      "core",
+				      "xo";
+			non-removable;
+
+			status = "disabled";
+		};
+
+		intc: interrupt-controller@b000000 {
+			compatible = "qcom,msm-qgic2";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			reg = <0x0 0xb000000 0x0 0x1000>,
+			      <0x0 0xb002000 0x0 0x1000>,
+			      <0x0 0xb001000 0x0 0x1000>,
+			      <0x0 0xb004000 0x0 0x1000>;
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
+			reg = <0x0 0x0b120000 0x0 0x1000>;
+			ranges = <0 0 0 0x10000000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			frame@b121000 {
+				frame-number = <0>;
+				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0b121000 0x1000>,
+				      <0x0b122000 0x1000>;
+			};
+
+			frame@b123000 {
+				frame-number = <1>;
+				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0b123000 0x1000>;
+
+				status = "disabled";
+			};
+
+			frame@b124000 {
+				frame-number = <2>;
+				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0b124000 0x1000>;
+
+				status = "disabled";
+			};
+
+			frame@b125000 {
+				frame-number = <3>;
+				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0b125000 0x1000>;
+
+				status = "disabled";
+			};
+
+			frame@b126000 {
+				frame-number = <4>;
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0b126000 0x1000>;
+
+				status = "disabled";
+			};
+
+			frame@b127000 {
+				frame-number = <5>;
+				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0b127000 0x1000>;
+
+				status = "disabled";
+			};
+
+			frame@b128000 {
+				frame-number = <6>;
+				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0b128000 0x1000>;
+
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


