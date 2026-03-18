Return-Path: <linux-gpio+bounces-33722-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPv1NExmumklWAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33722-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 09:46:04 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA062B8567
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 09:46:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5798B31779D4
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 08:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48CCE388372;
	Wed, 18 Mar 2026 08:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NIytY478";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Agk/XF/i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776F3387374
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 08:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773823227; cv=none; b=n+kmlFR9Y2o50XLobuHQwdaz1hIBRMYosGpMYnzw6T36OOsOScesekI+UwWEWjvtCw1chUQJG0k1D1nsXCec4QPWa8UZJM1BqQFzdTcgqZBSdwL7oVoLMcdVkheAXmQwm3eThxZoGVsA7YKrBuOxkBecSumyowql/O/PW2xHdzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773823227; c=relaxed/simple;
	bh=63b1q6DFnNBfUK8tBPC1sduaKTHJcO58e08owdOjdjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Eb+2mu6iStYOHnRxpXCbM/k4gqItB6bBODnT3BhuFeXkDGhLGseRVndX/pTYu6Tne6QUT9ge4c7vv89+0nBlcnQUvh3MzyQIv8prnblg6NAZusT8asDfABnExY9NdAPpC8z7jlgjvMKuHiAoA1/ZuFZP+zzobkwnplD1lh/1bYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NIytY478; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Agk/XF/i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I2o7lC2730161
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 08:40:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zXR1cbEDzRYF/CJFSmdAw4FqsX2Mg+zIMl3t7FS0EXc=; b=NIytY478vWXiTXTl
	flld8w/oofPxcc7pjH1exZ8bqGPEtfN/EJhilvfbzAUU5tTruLWv1UjTRLM/27/q
	XwKGDNZHkyERwl1biIeiK59DsZGXUTg500ALbGPlFKznrl5kL7YRe93eeSUxV84O
	MUpEHRSIiwLJLG4Q+RSUUF1SZ2N9frBqWsFDx+zLS22HL/hDPXC0wQ0J4nf9j9Cy
	LsbdNCOfSegVdI4NYJb539euky28KPLU/y+dSbHO+Yyx8bK3qKOF2syKrgv8lrMQ
	8aBEUDXrgoebTGbrvIgek8S4h8JkVRcar6JaF3hxzEzQST1YW7ix0RnQmMnWV5RK
	7CSzfg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy8kjuxbk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 08:40:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-829942cf9deso5734400b3a.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 01:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773823223; x=1774428023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zXR1cbEDzRYF/CJFSmdAw4FqsX2Mg+zIMl3t7FS0EXc=;
        b=Agk/XF/iPjLo1K0Z/d33ufq54rGxM7gD403Mame2kYFJ9tn9Jr5+hj4C8UOI3Z/g/j
         MzBkPboW8tiCwddpGzTryWbjXVtw4yMGacacn+/6padxj5psP+aKqnKpTLAWmesInNpi
         4EjIQbICvH4xFU0k9+ZZKTckRc4oDSjV0T3v5vlZ56OgY+0IDg4QyGk4mo1R2OnIoSAl
         uVnR0lA67RhT2pSun6xOrVYwDgdPf0gcpnKjM4AM7Ey1crw94pnZnIt2qL6YNB11LwMr
         mbrufYFreDDyXIaobVw6ynu0TxlMPUmXahTtdApeTIYj3Ra1Fg+j6hhynS1gys4ZQD5+
         p6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773823223; x=1774428023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zXR1cbEDzRYF/CJFSmdAw4FqsX2Mg+zIMl3t7FS0EXc=;
        b=AlZKsGTZ1D94uBkxRzeAeLPIQ6Wx43B/eVUQH00i2ko3VJfxIKsawqcrzlzQe0S9wm
         PbM+VZTZE3l3DEPLdoEsB7tX3RQ+KZj8kOdzJW/ihfgBFHnL+u76PmCQ//jRmMjSlp1S
         gZhxoB4oFapO4qIf509mzFMjeJmjwenva2AzP8yvloZpOp5fN8XKSel6YoGQ0BXcUOhP
         cEXrrV3GllwW+M2a6JWpnyUheCtiP05cmNeaLv0Kt7eMl2xE6qK1EMuNtLsPJMlLFAxy
         CAZlqXRasyc7g5HxV4Tkf6BAdqWeiOwk/nwg+OEZxZWfW6tSI4sEg67vRgCND0rJwV9H
         OLYw==
X-Forwarded-Encrypted: i=1; AJvYcCW40MiGP8EUSShSEtRXEo/NmHI+G+8xHJRM69k7AkBjaKhi6dgJhsJcFlHNUOCVA0BJvXbN68BMhmsf@vger.kernel.org
X-Gm-Message-State: AOJu0YwShjU+Z5RzKg9YLY9seSskCZRXnS4+MyqyM6vEAIE3yjuQXe9J
	Y/vHuICiHAsHK2oPVhLmdKG90xd2AqfJu2pcDqjIhEsTV6a7jJIupu0rHaXaxnjBz8xcyiACHLT
	d6wP8R1tXT8UAaIS1FgNWctX8HlOWdZc9hMQaJ7NBgPkTQpxy90H9KSKI17Z67/Laau3qDU3J
X-Gm-Gg: ATEYQzwFK3xtng+SlRj0qRWJR0Z5pdzVwqKRg32Wl5W5q7kk1NqqRweUYuLyKYKEn0a
	Rxe6W0KRw36EZ45/fYLoBPpzpLeZkCyJlv8dEk34JYxd4OZApooXOBfIP3yRGcJLEeFlFFH0vGd
	o4ij4YcUkQHgOy0MX/mBHZYeIWYnamoZOSHqrnAdHUA0F2S/PiJFGPAjtt79JY3bBGadifE7vkw
	YRPq4xiaBNiEwaoX1ClOmT/WU2Krbgc+UefFzPcdpZIdEqHk9QxxFMSrCFtVUYzjAMOgv6nbIrU
	z5yY5YkFhaWaWomTisZ2mxD1e7D7DKYsNMlywoQKH+3cuAuqJk9Tvj0tkbnnUeM74+oGcJa6Y0s
	+W+xdIlxJ3AM7zVGFnPTi/AhgRsKnYW/QeGD5nAttoUEMKl1eytrNOzWNFa2Z+B4alKKU1ljMJI
	g4DR25uig0PHtqEBW8d8IPrmgZMTuc4DvtAO1WlmIxInYZsAMz0uToNSH+
X-Received: by 2002:a05:6a00:1708:b0:829:81ef:df10 with SMTP id d2e1a72fcca58-82a6ac399a1mr2216935b3a.13.1773823223311;
        Wed, 18 Mar 2026 01:40:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:1708:b0:829:81ef:df10 with SMTP id d2e1a72fcca58-82a6ac399a1mr2216902b3a.13.1773823222688;
        Wed, 18 Mar 2026 01:40:22 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6bbb2802sm1863498b3a.31.2026.03.18.01.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 01:40:22 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 14:09:47 +0530
Subject: [PATCH v2 5/6] arm64: dts: qcom: add IPQ5210 SoC and rdp504 board
 support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-ipq5210_boot_to_shell-v2-5-a87e27c37070@oss.qualcomm.com>
References: <20260318-ipq5210_boot_to_shell-v2-0-a87e27c37070@oss.qualcomm.com>
In-Reply-To: <20260318-ipq5210_boot_to_shell-v2-0-a87e27c37070@oss.qualcomm.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773823188; l=10437;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=63b1q6DFnNBfUK8tBPC1sduaKTHJcO58e08owdOjdjA=;
 b=Kh6smhLLb7ySC8q09E0QuTyfo8hsu2J7ii1cOFBVqcT5lx1BIst2r52gkUBu8xUE5BKj5WGIu
 VgsA+R9twuJAlhDC/MSo+1pRHvwvVNE3qyj7l+LUaqmJ5I4bzHy+/kw
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA3MSBTYWx0ZWRfXytHMC04WhOkP
 BLf0YbB2mpfRR0ROkeYC8wT8tjS8n1s39HTArFOBESUnDfmpmS9er8wVWjQJlqk7D7qLzPnCxdh
 QgfrjRQdIHk8pzc9Y1EV2xmi/udmOg9H+FnOgar8f1ETnhZj2pVFJpu70i2ZkrzOFBXP89A0ya2
 4ZaS1L3eMG1Vg1pQ4KSsvRMWt5IvgXDGOJFEV6nSP/l3sm9XASXPd/pL6yyEcA9M6DIQtgMHGzg
 Z28Nvqq4GBBheD9WEukwpY4hmPh+oTveu6n4Rongf+j2OgN5kG0yrDpalrLMOtxgJJtxUCTWZ4s
 /nKASqIIjmpck51fI5r8lGgO9vD3Dsjv2UYmt9UOho18NPKbfWU894dIldRSorJsgu4YNHP5C+Y
 q2N6zSUFK3YnyqWilZRFLYTwXbNmQMnzzAKimvWu3jYj/mjdIHtzwXw8KTljss0v9WsmCiCF3h7
 De9zrJZaWpzxa528Vcg==
X-Authority-Analysis: v=2.4 cv=P8I3RyAu c=1 sm=1 tr=0 ts=69ba64f8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=fBkTXTPqfNaV2XDYC8MA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: gyHiVDxhb2FBzBN8KAJpNc6O_fenbzqB
X-Proofpoint-GUID: gyHiVDxhb2FBzBN8KAJpNc6O_fenbzqB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180071
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33722-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,pengutronix.de,gmail.com,gurudas.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 7FA062B8567
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add initial device tree support for the Qualcomm IPQ5210 SoC and
rdp504 board.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile           |   1 +
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts |  86 ++++++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 311 ++++++++++++++++++++++++++++
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
index 0000000000000000000000000000000000000000..d4d4ef7948a5a710752da0169ce4462592920320
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -0,0 +1,86 @@
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
+&uart1 {
+	pinctrl-0 = <&qup_uart1_default_state>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&xo_board {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..b04bc84ac4521a918f75180d9467c8599bdc3d05
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


