Return-Path: <linux-gpio+bounces-11090-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1273C996071
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 09:15:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D6B11C23960
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 07:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BFBC185B54;
	Wed,  9 Oct 2024 07:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="c/LqYLMT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECEB17F4F6;
	Wed,  9 Oct 2024 07:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728458061; cv=none; b=smJl7nFmXJMXj8YdBTCG90Mcm1NByvu1pF7NrWMXK65Zg4i/1r+sDrUyZmf4ve3DxxPiy/W4hliAztSTHPK14Ldb9pTTpOPwEVVlQg12kdczINFuidG4/IhtUP7L9sXZWkwHZU92R3hU4gYtHkofjv5F7HY3vS340EyoLw9EY3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728458061; c=relaxed/simple;
	bh=V5JcMX3TWyBE0pi663jCCdvpimQK8W8QOz8cNuoLIUE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=uL4zdCyocS2RlPIRfx/dK0O64DQh2KOuUylqw6KhlBGgoA8de3uUO6NfTlsGXSspX3GXvDWdd2iZt9TO5VWyBYQ+AC/O9g6RDgHO4Kuxtm964Xq7OH/9QvQXS73HrysurcxXV5V9WxsB9RYeP10ETayHRFMgXqze9eUNrGfpwrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=c/LqYLMT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 498JH1Og027775;
	Wed, 9 Oct 2024 07:14:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2K34MYG/QJhq5kr1P7aslKVicTCgR32JgriMoN4bcj8=; b=c/LqYLMTZX1NT5AI
	nal3QUItU+QNVDWuvad42+U09Ppdwuue9/mfgcS7krA+Pj/pOXgX9sSqC09pHvrZ
	qcEtGE+5tZIXt+svj8jnw8GvlORYCv7VOiOlHRwKaqqzHwCtvJ+JomCbEzsMeB9Q
	QZL6Cm61/bwmp5KcjdGggk0ISbZQZsycxRYtJqL8t8ucNBpxPm7VBwKBWsEG3wT4
	Pf5oNS3hS7GH3Z0srBhLn3lOHR8hO28ivvKsw39o4YQUeAXqvdVM7MJCCNg+HySz
	MOuyQuX6b7WuflsVAodmF1+peA4BwzlfHe0VbGeb/XaShukGPNQMXS/ak9rLHR45
	o/z1GA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42513u3au1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 07:14:11 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4997EASd000734
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Oct 2024 07:14:10 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 9 Oct 2024 00:14:05 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
Date: Wed, 9 Oct 2024 15:13:34 +0800
Subject: [PATCH v2 2/2] pinctrl: qcom: add the tlmm driver for QCS8300
 platforms
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241009-qcs8300_tlmm-v2-2-9e40dee5e4f1@quicinc.com>
References: <20241009-qcs8300_tlmm-v2-0-9e40dee5e4f1@quicinc.com>
In-Reply-To: <20241009-qcs8300_tlmm-v2-0-9e40dee5e4f1@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Richard
 Cochran" <richardcochran@gmail.com>
CC: <quic_tengfan@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <quic_aiquny@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        Jingyi Wang
	<quic_jingyw@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728458035; l=43194;
 i=quic_jingyw@quicinc.com; s=20240910; h=from:subject:message-id;
 bh=V5JcMX3TWyBE0pi663jCCdvpimQK8W8QOz8cNuoLIUE=;
 b=wbfyNCt3d30/vXULMgIkAItb+6Q7RrLOk1CtWm/rw27m3lUWIoeTfyw1GvjA6Vx6ZynmIJqSS
 DhetjtFieW5BuqAIFRmz3sZGCh6f9qgNrxmTsQzfrXb1To7VwFUIj+Y
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=ZRP1KgWMhlXXWlSYLoO7TSfwKgt6ke8hw5xWcSY+wLQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: iUUcH4C8gxIGb9vuRF0qYsgtzBU2enqe
X-Proofpoint-GUID: iUUcH4C8gxIGb9vuRF0qYsgtzBU2enqe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410090047

Add support for QCS8300 TLMM configuration and control via the
pinctrl framework.

Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
 drivers/pinctrl/qcom/Kconfig.msm       |    7 +
 drivers/pinctrl/qcom/Makefile          |    1 +
 drivers/pinctrl/qcom/pinctrl-qcs8300.c | 1246 ++++++++++++++++++++++++++++++++
 3 files changed, 1254 insertions(+)

diff --git a/drivers/pinctrl/qcom/Kconfig.msm b/drivers/pinctrl/qcom/Kconfig.msm
index c79f0c3c873d..c5d67539f5c9 100644
--- a/drivers/pinctrl/qcom/Kconfig.msm
+++ b/drivers/pinctrl/qcom/Kconfig.msm
@@ -198,6 +198,13 @@ config PINCTRL_QCS615
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  TLMM block found on the Qualcomm QCS615 platform.
 
+config PINCTRL_QCS8300
+	tristate "Qualcomm Technologies QCS8300 pin controller driver"
+	depends on ARM64 || COMPILE_TEST
+	help
+	  This is the pinctrl, pinmux and pinconf driver for the Qualcomm
+	  TLMM block found on the Qualcomm QCS8300 platform.
+
 config PINCTRL_QDF2XXX
 	tristate "Qualcomm Technologies QDF2xxx pin controller driver"
 	depends on ACPI
diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
index 715c3b5a636a..7c8385e69e90 100644
--- a/drivers/pinctrl/qcom/Makefile
+++ b/drivers/pinctrl/qcom/Makefile
@@ -25,6 +25,7 @@ obj-$(CONFIG_PINCTRL_MSM8998)   += pinctrl-msm8998.o
 obj-$(CONFIG_PINCTRL_QCM2290)	+= pinctrl-qcm2290.o
 obj-$(CONFIG_PINCTRL_QCS404)	+= pinctrl-qcs404.o
 obj-$(CONFIG_PINCTRL_QCS615)    += pinctrl-qcs615.o
+obj-$(CONFIG_PINCTRL_QCS8300)	+= pinctrl-qcs8300.o
 obj-$(CONFIG_PINCTRL_QDF2XXX)	+= pinctrl-qdf2xxx.o
 obj-$(CONFIG_PINCTRL_MDM9607)	+= pinctrl-mdm9607.o
 obj-$(CONFIG_PINCTRL_MDM9615)	+= pinctrl-mdm9615.o
diff --git a/drivers/pinctrl/qcom/pinctrl-qcs8300.c b/drivers/pinctrl/qcom/pinctrl-qcs8300.c
new file mode 100644
index 000000000000..28488b11d883
--- /dev/null
+++ b/drivers/pinctrl/qcom/pinctrl-qcs8300.c
@@ -0,0 +1,1246 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#include "pinctrl-msm.h"
+
+#define REG_SIZE 0x1000
+#define PINGROUP(id, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11)\
+	{						\
+		.grp = PINCTRL_PINGROUP("gpio" #id,	\
+			gpio##id##_pins,		\
+			ARRAY_SIZE(gpio##id##_pins)),	\
+		.funcs = (int[]){			\
+			msm_mux_gpio, /* gpio mode */	\
+			msm_mux_##f1,			\
+			msm_mux_##f2,			\
+			msm_mux_##f3,			\
+			msm_mux_##f4,			\
+			msm_mux_##f5,			\
+			msm_mux_##f6,			\
+			msm_mux_##f7,			\
+			msm_mux_##f8,			\
+			msm_mux_##f9,			\
+			msm_mux_##f10,			\
+			msm_mux_##f11 /* egpio mode */	\
+		},					\
+		.nfuncs = 12,				\
+		.ctl_reg = REG_SIZE * id,		\
+		.io_reg = 0x4 + REG_SIZE * id,		\
+		.intr_cfg_reg = 0x8 + REG_SIZE * id,	\
+		.intr_status_reg = 0xc + REG_SIZE * id,	\
+		.intr_target_reg = 0x8 + REG_SIZE * id,	\
+		.mux_bit = 2,			\
+		.pull_bit = 0,			\
+		.drv_bit = 6,			\
+		.egpio_enable = 12,		\
+		.egpio_present = 11,		\
+		.oe_bit = 9,			\
+		.in_bit = 0,			\
+		.out_bit = 1,			\
+		.intr_enable_bit = 0,		\
+		.intr_status_bit = 0,		\
+		.intr_target_bit = 5,		\
+		.intr_target_kpss_val = 3,	\
+		.intr_raw_status_bit = 4,	\
+		.intr_polarity_bit = 1,		\
+		.intr_detection_bit = 2,	\
+		.intr_detection_width = 2,	\
+	}
+
+#define SDC_QDSD_PINGROUP(pg_name, ctl, pull, drv)	\
+	{						\
+		.grp = PINCTRL_PINGROUP(#pg_name,	\
+			pg_name##_pins,			\
+			ARRAY_SIZE(pg_name##_pins)),	\
+		.ctl_reg = ctl,				\
+		.io_reg = 0,				\
+		.intr_cfg_reg = 0,			\
+		.intr_status_reg = 0,			\
+		.intr_target_reg = 0,			\
+		.mux_bit = -1,				\
+		.pull_bit = pull,			\
+		.drv_bit = drv,				\
+		.oe_bit = -1,				\
+		.in_bit = -1,				\
+		.out_bit = -1,				\
+		.intr_enable_bit = -1,			\
+		.intr_status_bit = -1,			\
+		.intr_target_bit = -1,			\
+		.intr_raw_status_bit = -1,		\
+		.intr_polarity_bit = -1,		\
+		.intr_detection_bit = -1,		\
+		.intr_detection_width = -1,		\
+	}
+
+#define UFS_RESET(pg_name, offset)			\
+	{						\
+		.grp = PINCTRL_PINGROUP(#pg_name,	\
+			pg_name##_pins,			\
+			ARRAY_SIZE(pg_name##_pins)),	\
+		.ctl_reg = offset,			\
+		.io_reg = offset + 0x4,			\
+		.intr_cfg_reg = 0,			\
+		.intr_status_reg = 0,			\
+		.intr_target_reg = 0,			\
+		.mux_bit = -1,				\
+		.pull_bit = 3,				\
+		.drv_bit = 0,				\
+		.oe_bit = -1,				\
+		.in_bit = -1,				\
+		.out_bit = 0,				\
+		.intr_enable_bit = -1,			\
+		.intr_status_bit = -1,			\
+		.intr_target_bit = -1,			\
+		.intr_raw_status_bit = -1,		\
+		.intr_polarity_bit = -1,		\
+		.intr_detection_bit = -1,		\
+		.intr_detection_width = -1,		\
+	}
+
+#define QUP_I3C(qup_mode, qup_offset)			\
+	{						\
+		.mode = qup_mode,			\
+		.offset = qup_offset,			\
+	}
+
+#define QUP_I3C_6_MODE_OFFSET	0xaf000
+#define QUP_I3C_7_MODE_OFFSET	0xb0000
+#define QUP_I3C_13_MODE_OFFSET	0xb1000
+#define QUP_I3C_14_MODE_OFFSET	0xb2000
+
+static const struct pinctrl_pin_desc qcs8300_pins[] = {
+	PINCTRL_PIN(0, "GPIO_0"),
+	PINCTRL_PIN(1, "GPIO_1"),
+	PINCTRL_PIN(2, "GPIO_2"),
+	PINCTRL_PIN(3, "GPIO_3"),
+	PINCTRL_PIN(4, "GPIO_4"),
+	PINCTRL_PIN(5, "GPIO_5"),
+	PINCTRL_PIN(6, "GPIO_6"),
+	PINCTRL_PIN(7, "GPIO_7"),
+	PINCTRL_PIN(8, "GPIO_8"),
+	PINCTRL_PIN(9, "GPIO_9"),
+	PINCTRL_PIN(10, "GPIO_10"),
+	PINCTRL_PIN(11, "GPIO_11"),
+	PINCTRL_PIN(12, "GPIO_12"),
+	PINCTRL_PIN(13, "GPIO_13"),
+	PINCTRL_PIN(14, "GPIO_14"),
+	PINCTRL_PIN(15, "GPIO_15"),
+	PINCTRL_PIN(16, "GPIO_16"),
+	PINCTRL_PIN(17, "GPIO_17"),
+	PINCTRL_PIN(18, "GPIO_18"),
+	PINCTRL_PIN(19, "GPIO_19"),
+	PINCTRL_PIN(20, "GPIO_20"),
+	PINCTRL_PIN(21, "GPIO_21"),
+	PINCTRL_PIN(22, "GPIO_22"),
+	PINCTRL_PIN(23, "GPIO_23"),
+	PINCTRL_PIN(24, "GPIO_24"),
+	PINCTRL_PIN(25, "GPIO_25"),
+	PINCTRL_PIN(26, "GPIO_26"),
+	PINCTRL_PIN(27, "GPIO_27"),
+	PINCTRL_PIN(28, "GPIO_28"),
+	PINCTRL_PIN(29, "GPIO_29"),
+	PINCTRL_PIN(30, "GPIO_30"),
+	PINCTRL_PIN(31, "GPIO_31"),
+	PINCTRL_PIN(32, "GPIO_32"),
+	PINCTRL_PIN(33, "GPIO_33"),
+	PINCTRL_PIN(34, "GPIO_34"),
+	PINCTRL_PIN(35, "GPIO_35"),
+	PINCTRL_PIN(36, "GPIO_36"),
+	PINCTRL_PIN(37, "GPIO_37"),
+	PINCTRL_PIN(38, "GPIO_38"),
+	PINCTRL_PIN(39, "GPIO_39"),
+	PINCTRL_PIN(40, "GPIO_40"),
+	PINCTRL_PIN(41, "GPIO_41"),
+	PINCTRL_PIN(42, "GPIO_42"),
+	PINCTRL_PIN(43, "GPIO_43"),
+	PINCTRL_PIN(44, "GPIO_44"),
+	PINCTRL_PIN(45, "GPIO_45"),
+	PINCTRL_PIN(46, "GPIO_46"),
+	PINCTRL_PIN(47, "GPIO_47"),
+	PINCTRL_PIN(48, "GPIO_48"),
+	PINCTRL_PIN(49, "GPIO_49"),
+	PINCTRL_PIN(50, "GPIO_50"),
+	PINCTRL_PIN(51, "GPIO_51"),
+	PINCTRL_PIN(52, "GPIO_52"),
+	PINCTRL_PIN(53, "GPIO_53"),
+	PINCTRL_PIN(54, "GPIO_54"),
+	PINCTRL_PIN(55, "GPIO_55"),
+	PINCTRL_PIN(56, "GPIO_56"),
+	PINCTRL_PIN(57, "GPIO_57"),
+	PINCTRL_PIN(58, "GPIO_58"),
+	PINCTRL_PIN(59, "GPIO_59"),
+	PINCTRL_PIN(60, "GPIO_60"),
+	PINCTRL_PIN(61, "GPIO_61"),
+	PINCTRL_PIN(62, "GPIO_62"),
+	PINCTRL_PIN(63, "GPIO_63"),
+	PINCTRL_PIN(64, "GPIO_64"),
+	PINCTRL_PIN(65, "GPIO_65"),
+	PINCTRL_PIN(66, "GPIO_66"),
+	PINCTRL_PIN(67, "GPIO_67"),
+	PINCTRL_PIN(68, "GPIO_68"),
+	PINCTRL_PIN(69, "GPIO_69"),
+	PINCTRL_PIN(70, "GPIO_70"),
+	PINCTRL_PIN(71, "GPIO_71"),
+	PINCTRL_PIN(72, "GPIO_72"),
+	PINCTRL_PIN(73, "GPIO_73"),
+	PINCTRL_PIN(74, "GPIO_74"),
+	PINCTRL_PIN(75, "GPIO_75"),
+	PINCTRL_PIN(76, "GPIO_76"),
+	PINCTRL_PIN(77, "GPIO_77"),
+	PINCTRL_PIN(78, "GPIO_78"),
+	PINCTRL_PIN(79, "GPIO_79"),
+	PINCTRL_PIN(80, "GPIO_80"),
+	PINCTRL_PIN(81, "GPIO_81"),
+	PINCTRL_PIN(82, "GPIO_82"),
+	PINCTRL_PIN(83, "GPIO_83"),
+	PINCTRL_PIN(84, "GPIO_84"),
+	PINCTRL_PIN(85, "GPIO_85"),
+	PINCTRL_PIN(86, "GPIO_86"),
+	PINCTRL_PIN(87, "GPIO_87"),
+	PINCTRL_PIN(88, "GPIO_88"),
+	PINCTRL_PIN(89, "GPIO_89"),
+	PINCTRL_PIN(90, "GPIO_90"),
+	PINCTRL_PIN(91, "GPIO_91"),
+	PINCTRL_PIN(92, "GPIO_92"),
+	PINCTRL_PIN(93, "GPIO_93"),
+	PINCTRL_PIN(94, "GPIO_94"),
+	PINCTRL_PIN(95, "GPIO_95"),
+	PINCTRL_PIN(96, "GPIO_96"),
+	PINCTRL_PIN(97, "GPIO_97"),
+	PINCTRL_PIN(98, "GPIO_98"),
+	PINCTRL_PIN(99, "GPIO_99"),
+	PINCTRL_PIN(100, "GPIO_100"),
+	PINCTRL_PIN(101, "GPIO_101"),
+	PINCTRL_PIN(102, "GPIO_102"),
+	PINCTRL_PIN(103, "GPIO_103"),
+	PINCTRL_PIN(104, "GPIO_104"),
+	PINCTRL_PIN(105, "GPIO_105"),
+	PINCTRL_PIN(106, "GPIO_106"),
+	PINCTRL_PIN(107, "GPIO_107"),
+	PINCTRL_PIN(108, "GPIO_108"),
+	PINCTRL_PIN(109, "GPIO_109"),
+	PINCTRL_PIN(110, "GPIO_110"),
+	PINCTRL_PIN(111, "GPIO_111"),
+	PINCTRL_PIN(112, "GPIO_112"),
+	PINCTRL_PIN(113, "GPIO_113"),
+	PINCTRL_PIN(114, "GPIO_114"),
+	PINCTRL_PIN(115, "GPIO_115"),
+	PINCTRL_PIN(116, "GPIO_116"),
+	PINCTRL_PIN(117, "GPIO_117"),
+	PINCTRL_PIN(118, "GPIO_118"),
+	PINCTRL_PIN(119, "GPIO_119"),
+	PINCTRL_PIN(120, "GPIO_120"),
+	PINCTRL_PIN(121, "GPIO_121"),
+	PINCTRL_PIN(122, "GPIO_122"),
+	PINCTRL_PIN(123, "GPIO_123"),
+	PINCTRL_PIN(124, "GPIO_124"),
+	PINCTRL_PIN(125, "GPIO_125"),
+	PINCTRL_PIN(126, "GPIO_126"),
+	PINCTRL_PIN(127, "GPIO_127"),
+	PINCTRL_PIN(128, "GPIO_128"),
+	PINCTRL_PIN(129, "GPIO_129"),
+	PINCTRL_PIN(130, "GPIO_130"),
+	PINCTRL_PIN(131, "GPIO_131"),
+	PINCTRL_PIN(132, "GPIO_132"),
+	PINCTRL_PIN(133, "UFS_RESET"),
+	PINCTRL_PIN(134, "SDC1_RCLK"),
+	PINCTRL_PIN(135, "SDC1_CLK"),
+	PINCTRL_PIN(136, "SDC1_CMD"),
+	PINCTRL_PIN(137, "SDC1_DATA"),
+};
+
+#define DECLARE_MSM_GPIO_PINS(pin) \
+	static const unsigned int gpio##pin##_pins[] = { pin }
+DECLARE_MSM_GPIO_PINS(0);
+DECLARE_MSM_GPIO_PINS(1);
+DECLARE_MSM_GPIO_PINS(2);
+DECLARE_MSM_GPIO_PINS(3);
+DECLARE_MSM_GPIO_PINS(4);
+DECLARE_MSM_GPIO_PINS(5);
+DECLARE_MSM_GPIO_PINS(6);
+DECLARE_MSM_GPIO_PINS(7);
+DECLARE_MSM_GPIO_PINS(8);
+DECLARE_MSM_GPIO_PINS(9);
+DECLARE_MSM_GPIO_PINS(10);
+DECLARE_MSM_GPIO_PINS(11);
+DECLARE_MSM_GPIO_PINS(12);
+DECLARE_MSM_GPIO_PINS(13);
+DECLARE_MSM_GPIO_PINS(14);
+DECLARE_MSM_GPIO_PINS(15);
+DECLARE_MSM_GPIO_PINS(16);
+DECLARE_MSM_GPIO_PINS(17);
+DECLARE_MSM_GPIO_PINS(18);
+DECLARE_MSM_GPIO_PINS(19);
+DECLARE_MSM_GPIO_PINS(20);
+DECLARE_MSM_GPIO_PINS(21);
+DECLARE_MSM_GPIO_PINS(22);
+DECLARE_MSM_GPIO_PINS(23);
+DECLARE_MSM_GPIO_PINS(24);
+DECLARE_MSM_GPIO_PINS(25);
+DECLARE_MSM_GPIO_PINS(26);
+DECLARE_MSM_GPIO_PINS(27);
+DECLARE_MSM_GPIO_PINS(28);
+DECLARE_MSM_GPIO_PINS(29);
+DECLARE_MSM_GPIO_PINS(30);
+DECLARE_MSM_GPIO_PINS(31);
+DECLARE_MSM_GPIO_PINS(32);
+DECLARE_MSM_GPIO_PINS(33);
+DECLARE_MSM_GPIO_PINS(34);
+DECLARE_MSM_GPIO_PINS(35);
+DECLARE_MSM_GPIO_PINS(36);
+DECLARE_MSM_GPIO_PINS(37);
+DECLARE_MSM_GPIO_PINS(38);
+DECLARE_MSM_GPIO_PINS(39);
+DECLARE_MSM_GPIO_PINS(40);
+DECLARE_MSM_GPIO_PINS(41);
+DECLARE_MSM_GPIO_PINS(42);
+DECLARE_MSM_GPIO_PINS(43);
+DECLARE_MSM_GPIO_PINS(44);
+DECLARE_MSM_GPIO_PINS(45);
+DECLARE_MSM_GPIO_PINS(46);
+DECLARE_MSM_GPIO_PINS(47);
+DECLARE_MSM_GPIO_PINS(48);
+DECLARE_MSM_GPIO_PINS(49);
+DECLARE_MSM_GPIO_PINS(50);
+DECLARE_MSM_GPIO_PINS(51);
+DECLARE_MSM_GPIO_PINS(52);
+DECLARE_MSM_GPIO_PINS(53);
+DECLARE_MSM_GPIO_PINS(54);
+DECLARE_MSM_GPIO_PINS(55);
+DECLARE_MSM_GPIO_PINS(56);
+DECLARE_MSM_GPIO_PINS(57);
+DECLARE_MSM_GPIO_PINS(58);
+DECLARE_MSM_GPIO_PINS(59);
+DECLARE_MSM_GPIO_PINS(60);
+DECLARE_MSM_GPIO_PINS(61);
+DECLARE_MSM_GPIO_PINS(62);
+DECLARE_MSM_GPIO_PINS(63);
+DECLARE_MSM_GPIO_PINS(64);
+DECLARE_MSM_GPIO_PINS(65);
+DECLARE_MSM_GPIO_PINS(66);
+DECLARE_MSM_GPIO_PINS(67);
+DECLARE_MSM_GPIO_PINS(68);
+DECLARE_MSM_GPIO_PINS(69);
+DECLARE_MSM_GPIO_PINS(70);
+DECLARE_MSM_GPIO_PINS(71);
+DECLARE_MSM_GPIO_PINS(72);
+DECLARE_MSM_GPIO_PINS(73);
+DECLARE_MSM_GPIO_PINS(74);
+DECLARE_MSM_GPIO_PINS(75);
+DECLARE_MSM_GPIO_PINS(76);
+DECLARE_MSM_GPIO_PINS(77);
+DECLARE_MSM_GPIO_PINS(78);
+DECLARE_MSM_GPIO_PINS(79);
+DECLARE_MSM_GPIO_PINS(80);
+DECLARE_MSM_GPIO_PINS(81);
+DECLARE_MSM_GPIO_PINS(82);
+DECLARE_MSM_GPIO_PINS(83);
+DECLARE_MSM_GPIO_PINS(84);
+DECLARE_MSM_GPIO_PINS(85);
+DECLARE_MSM_GPIO_PINS(86);
+DECLARE_MSM_GPIO_PINS(87);
+DECLARE_MSM_GPIO_PINS(88);
+DECLARE_MSM_GPIO_PINS(89);
+DECLARE_MSM_GPIO_PINS(90);
+DECLARE_MSM_GPIO_PINS(91);
+DECLARE_MSM_GPIO_PINS(92);
+DECLARE_MSM_GPIO_PINS(93);
+DECLARE_MSM_GPIO_PINS(94);
+DECLARE_MSM_GPIO_PINS(95);
+DECLARE_MSM_GPIO_PINS(96);
+DECLARE_MSM_GPIO_PINS(97);
+DECLARE_MSM_GPIO_PINS(98);
+DECLARE_MSM_GPIO_PINS(99);
+DECLARE_MSM_GPIO_PINS(100);
+DECLARE_MSM_GPIO_PINS(101);
+DECLARE_MSM_GPIO_PINS(102);
+DECLARE_MSM_GPIO_PINS(103);
+DECLARE_MSM_GPIO_PINS(104);
+DECLARE_MSM_GPIO_PINS(105);
+DECLARE_MSM_GPIO_PINS(106);
+DECLARE_MSM_GPIO_PINS(107);
+DECLARE_MSM_GPIO_PINS(108);
+DECLARE_MSM_GPIO_PINS(109);
+DECLARE_MSM_GPIO_PINS(110);
+DECLARE_MSM_GPIO_PINS(111);
+DECLARE_MSM_GPIO_PINS(112);
+DECLARE_MSM_GPIO_PINS(113);
+DECLARE_MSM_GPIO_PINS(114);
+DECLARE_MSM_GPIO_PINS(115);
+DECLARE_MSM_GPIO_PINS(116);
+DECLARE_MSM_GPIO_PINS(117);
+DECLARE_MSM_GPIO_PINS(118);
+DECLARE_MSM_GPIO_PINS(119);
+DECLARE_MSM_GPIO_PINS(120);
+DECLARE_MSM_GPIO_PINS(121);
+DECLARE_MSM_GPIO_PINS(122);
+DECLARE_MSM_GPIO_PINS(123);
+DECLARE_MSM_GPIO_PINS(124);
+DECLARE_MSM_GPIO_PINS(125);
+DECLARE_MSM_GPIO_PINS(126);
+DECLARE_MSM_GPIO_PINS(127);
+DECLARE_MSM_GPIO_PINS(128);
+DECLARE_MSM_GPIO_PINS(129);
+DECLARE_MSM_GPIO_PINS(130);
+DECLARE_MSM_GPIO_PINS(131);
+DECLARE_MSM_GPIO_PINS(132);
+
+static const unsigned int ufs_reset_pins[] = { 133 };
+static const unsigned int sdc1_rclk_pins[] = { 134 };
+static const unsigned int sdc1_clk_pins[]  = { 135 };
+static const unsigned int sdc1_cmd_pins[]  = { 136 };
+static const unsigned int sdc1_data_pins[] = { 137 };
+
+enum qcs8300_functions {
+	msm_mux_gpio,
+	msm_mux_aoss_cti,
+	msm_mux_atest_char,
+	msm_mux_atest_usb2,
+	msm_mux_audio_ref,
+	msm_mux_cam_mclk,
+	msm_mux_cci_async,
+	msm_mux_cci_i2c_scl,
+	msm_mux_cci_i2c_sda,
+	msm_mux_cci_timer,
+	msm_mux_cri_trng,
+	msm_mux_dbg_out,
+	msm_mux_ddr_bist,
+	msm_mux_ddr_pxi0,
+	msm_mux_ddr_pxi1,
+	msm_mux_ddr_pxi2,
+	msm_mux_ddr_pxi3,
+	msm_mux_edp0_hot,
+	msm_mux_edp0_lcd,
+	msm_mux_edp1_lcd,
+	msm_mux_egpio,
+	msm_mux_emac0_mcg0,
+	msm_mux_emac0_mcg1,
+	msm_mux_emac0_mcg2,
+	msm_mux_emac0_mcg3,
+	msm_mux_emac0_mdc,
+	msm_mux_emac0_mdio,
+	msm_mux_emac0_ptp_aux,
+	msm_mux_emac0_ptp_pps,
+	msm_mux_gcc_gp1,
+	msm_mux_gcc_gp2,
+	msm_mux_gcc_gp3,
+	msm_mux_gcc_gp4,
+	msm_mux_gcc_gp5,
+	msm_mux_hs0_mi2s,
+	msm_mux_hs1_mi2s,
+	msm_mux_hs2_mi2s,
+	msm_mux_ibi_i3c,
+	msm_mux_jitter_bist,
+	msm_mux_mdp0_vsync0,
+	msm_mux_mdp0_vsync1,
+	msm_mux_mdp0_vsync3,
+	msm_mux_mdp0_vsync6,
+	msm_mux_mdp0_vsync7,
+	msm_mux_mdp_vsync,
+	msm_mux_mi2s1_data0,
+	msm_mux_mi2s1_data1,
+	msm_mux_mi2s1_sck,
+	msm_mux_mi2s1_ws,
+	msm_mux_mi2s2_data0,
+	msm_mux_mi2s2_data1,
+	msm_mux_mi2s2_sck,
+	msm_mux_mi2s2_ws,
+	msm_mux_mi2s_mclk0,
+	msm_mux_mi2s_mclk1,
+	msm_mux_pcie0_clkreq,
+	msm_mux_pcie1_clkreq,
+	msm_mux_phase_flag,
+	msm_mux_pll_bist,
+	msm_mux_pll_clk,
+	msm_mux_prng_rosc0,
+	msm_mux_prng_rosc1,
+	msm_mux_prng_rosc2,
+	msm_mux_prng_rosc3,
+	msm_mux_qdss_cti,
+	msm_mux_qdss_gpio,
+	msm_mux_qup0_se0,
+	msm_mux_qup0_se1,
+	msm_mux_qup0_se2,
+	msm_mux_qup0_se3,
+	msm_mux_qup0_se4,
+	msm_mux_qup0_se5,
+	msm_mux_qup0_se6,
+	msm_mux_qup0_se7,
+	msm_mux_qup1_se0,
+	msm_mux_qup1_se1,
+	msm_mux_qup1_se2,
+	msm_mux_qup1_se3,
+	msm_mux_qup1_se4,
+	msm_mux_qup1_se5,
+	msm_mux_qup1_se6,
+	msm_mux_qup1_se7,
+	msm_mux_qup2_se0,
+	msm_mux_sailss_emac0,
+	msm_mux_sailss_ospi,
+	msm_mux_sgmii_phy,
+	msm_mux_tb_trig,
+	msm_mux_tgu_ch0,
+	msm_mux_tgu_ch1,
+	msm_mux_tgu_ch2,
+	msm_mux_tgu_ch3,
+	msm_mux_tsense_pwm1,
+	msm_mux_tsense_pwm2,
+	msm_mux_tsense_pwm3,
+	msm_mux_tsense_pwm4,
+	msm_mux_usb2phy_ac,
+	msm_mux_vsense_trigger,
+	msm_mux__,
+};
+
+static const char * const gpio_groups[] = {
+	"gpio0", "gpio1", "gpio2", "gpio3", "gpio4", "gpio5", "gpio6", "gpio7",
+	"gpio8", "gpio9", "gpio10", "gpio11", "gpio12", "gpio13", "gpio14",
+	"gpio15", "gpio16", "gpio17", "gpio18", "gpio19", "gpio20", "gpio21",
+	"gpio22", "gpio23", "gpio24", "gpio25", "gpio26", "gpio27", "gpio28",
+	"gpio29", "gpio30", "gpio31", "gpio32", "gpio33", "gpio34", "gpio35",
+	"gpio36", "gpio37", "gpio38", "gpio39", "gpio40", "gpio41", "gpio42",
+	"gpio43", "gpio44", "gpio45", "gpio46", "gpio47", "gpio48", "gpio49",
+	"gpio50", "gpio51", "gpio52", "gpio53", "gpio54", "gpio55", "gpio56",
+	"gpio57", "gpio58", "gpio59", "gpio60", "gpio61", "gpio62", "gpio63",
+	"gpio64", "gpio65", "gpio66", "gpio67", "gpio68", "gpio69", "gpio70",
+	"gpio71", "gpio72", "gpio73", "gpio74", "gpio75", "gpio76", "gpio77",
+	"gpio78", "gpio79", "gpio80", "gpio81", "gpio82", "gpio83", "gpio84",
+	"gpio85", "gpio86", "gpio87", "gpio88", "gpio89", "gpio90", "gpio91",
+	"gpio92", "gpio93", "gpio94", "gpio95", "gpio96", "gpio97", "gpio98",
+	"gpio99", "gpio100", "gpio101", "gpio102", "gpio103", "gpio104",
+	"gpio105", "gpio106", "gpio107", "gpio108", "gpio109", "gpio110",
+	"gpio111", "gpio112", "gpio113", "gpio114", "gpio115", "gpio116",
+	"gpio117", "gpio118", "gpio119", "gpio120", "gpio121", "gpio122",
+	"gpio123", "gpio124", "gpio125", "gpio126", "gpio127", "gpio128",
+	"gpio129", "gpio130", "gpio131", "gpio132",
+};
+
+static const char *const aoss_cti_groups[] = {
+	"gpio37", "gpio38", "gpio39", "gpio40",
+};
+
+static const char * const atest_char_groups[] = {
+	"gpio66", "gpio70", "gpio71", "gpio72", "gpio93",
+};
+
+static const char * const atest_usb2_groups[] = {
+	"gpio63", "gpio83", "gpio92", "gpio74", "gpio84", "gpio87", "gpio67",
+	"gpio75", "gpio85", "gpio65", "gpio68", "gpio80", "gpio64", "gpio69",
+	"gpio81",
+};
+
+static const char * const audio_ref_groups[] = {
+	"gpio105",
+};
+
+static const char * const cam_mclk_groups[] = {
+	"gpio67", "gpio68", "gpio69",
+};
+
+static const char * const cci_async_groups[] = {
+	"gpio63", "gpio64", "gpio65", "gpio29", "gpio30", "gpio31",
+};
+
+static const char * const cci_i2c_scl_groups[] = {
+	"gpio58", "gpio30", "gpio60", "gpio32", "gpio62", "gpio55",
+};
+
+static const char * const cci_i2c_sda_groups[] = {
+	"gpio57", "gpio29", "gpio59", "gpio31", "gpio61", "gpio54",
+};
+
+static const char *const cci_timer_groups[] = {
+	"gpio63", "gpio64", "gpio65", "gpio49", "gpio50", "gpio19",
+	"gpio20", "gpio21", "gpio22", "gpio23",
+};
+
+static const char *const cri_trng_groups[] = {
+	"gpio92", "gpio90", "gpio91",
+};
+
+static const char *const dbg_out_groups[] = {
+	"gpio75",
+};
+
+static const char * const ddr_bist_groups[] = {
+	"gpio53", "gpio54", "gpio55", "gpio56",
+};
+
+static const char *const ddr_pxi0_groups[] = {
+	"gpio68", "gpio69",
+};
+
+static const char *const ddr_pxi1_groups[] = {
+	"gpio49", "gpio50",
+};
+
+static const char *const ddr_pxi2_groups[] = {
+	"gpio52", "gpio83",
+};
+
+static const char *const ddr_pxi3_groups[] = {
+	"gpio80", "gpio81",
+};
+
+static const char *const edp0_hot_groups[] = {
+	"gpio94",
+};
+
+static const char *const edp0_lcd_groups[] = {
+	"gpio48",
+};
+
+static const char *const edp1_lcd_groups[] = {
+	"gpio49",
+};
+
+static const char *const egpio_groups[] = {
+	"gpio110", "gpio111", "gpio112", "gpio113", "gpio114", "gpio115",
+	"gpio116", "gpio117", "gpio118", "gpio119", "gpio120", "gpio121",
+	"gpio122", "gpio123", "gpio124", "gpio125", "gpio126", "gpio127",
+	"gpio128", "gpio129", "gpio130", "gpio131", "gpio132",
+};
+
+static const char *const emac0_mcg0_groups[] = {
+	"gpio10",
+};
+
+static const char *const emac0_mcg1_groups[] = {
+	"gpio11",
+};
+
+static const char *const emac0_mcg2_groups[] = {
+	"gpio24",
+};
+
+static const char *const emac0_mcg3_groups[] = {
+	"gpio79",
+};
+
+static const char *const emac0_mdc_groups[] = {
+	"gpio5",
+};
+
+static const char *const emac0_mdio_groups[] = {
+	"gpio6",
+};
+
+static const char * const emac0_ptp_aux_groups[] = {
+	"gpio24", "gpio31", "gpio32", "gpio79",
+};
+
+static const char * const emac0_ptp_pps_groups[] = {
+	"gpio24", "gpio29", "gpio30", "gpio79",
+};
+
+static const char *const gcc_gp1_groups[] = {
+	"gpio35", "gpio84",
+};
+
+static const char *const gcc_gp2_groups[] = {
+	"gpio36", "gpio81",
+};
+
+static const char *const gcc_gp3_groups[] = {
+	"gpio69", "gpio82",
+};
+
+static const char *const gcc_gp4_groups[] = {
+	"gpio68", "gpio83",
+};
+
+static const char *const gcc_gp5_groups[] = {
+	"gpio76", "gpio77",
+};
+
+static const char * const hs0_mi2s_groups[] = {
+	"gpio106", "gpio107", "gpio108", "gpio109",
+};
+
+static const char * const hs1_mi2s_groups[] = {
+	"gpio45", "gpio46", "gpio47", "gpio48",
+};
+
+static const char * const hs2_mi2s_groups[] = {
+	"gpio49", "gpio50", "gpio51", "gpio52",
+};
+
+static const char * const ibi_i3c_groups[] = {
+	"gpio17", "gpio18", "gpio19", "gpio20", "gpio37", "gpio38",
+	"gpio39", "gpio40",
+};
+
+static const char *const jitter_bist_groups[] = {
+	"gpio97",
+};
+
+static const char *const mdp0_vsync0_groups[] = {
+	"gpio89",
+};
+
+static const char *const mdp0_vsync1_groups[] = {
+	"gpio90",
+};
+
+static const char *const mdp0_vsync3_groups[] = {
+	"gpio91",
+};
+
+static const char *const mdp0_vsync6_groups[] = {
+	"gpio80",
+};
+
+static const char *const mdp0_vsync7_groups[] = {
+	"gpio81",
+};
+
+static const char *const mdp_vsync_groups[] = {
+	"gpio42", "gpio52", "gpio32",
+};
+
+static const char *const mi2s1_data0_groups[] = {
+	"gpio100",
+};
+
+static const char *const mi2s1_data1_groups[] = {
+	"gpio101",
+};
+
+static const char *const mi2s1_sck_groups[] = {
+	"gpio98",
+};
+
+static const char *const mi2s1_ws_groups[] = {
+	"gpio99",
+};
+
+static const char *const mi2s2_data0_groups[] = {
+	"gpio104",
+};
+
+static const char *const mi2s2_data1_groups[] = {
+	"gpio105",
+};
+
+static const char *const mi2s2_sck_groups[] = {
+	"gpio102",
+};
+
+static const char *const mi2s2_ws_groups[] = {
+	"gpio103",
+};
+
+static const char *const mi2s_mclk0_groups[] = {
+	"gpio97",
+};
+
+static const char *const mi2s_mclk1_groups[] = {
+	"gpio109",
+};
+
+static const char *const pcie0_clkreq_groups[] = {
+	"gpio1",
+};
+
+static const char *const pcie1_clkreq_groups[] = {
+	"gpio22",
+};
+
+static const char *const phase_flag_groups[] = {
+	"gpio66", "gpio56", "gpio118", "gpio117", "gpio116",
+	"gpio3", "gpio114", "gpio113", "gpio112", "gpio111",
+	"gpio110", "gpio28", "gpio55", "gpio108", "gpio107",
+	"gpio106", "gpio105", "gpio104", "gpio103", "gpio102",
+	"gpio101", "gpio100", "gpio99", "gpio125", "gpio98",
+	"gpio54", "gpio25", "gpio26", "gpio122", "gpio121",
+	"gpio120", "gpio9",
+};
+
+static const char *const pll_bist_groups[] = {
+	"gpio107",
+};
+
+static const char *const pll_clk_groups[] = {
+	"gpio74",
+};
+
+static const char *const prng_rosc0_groups[] = {
+	"gpio57",
+};
+
+static const char *const prng_rosc1_groups[] = {
+	"gpio58",
+};
+
+static const char *const prng_rosc2_groups[] = {
+	"gpio59",
+};
+
+static const char *const prng_rosc3_groups[] = {
+	"gpio60",
+};
+
+static const char *const qdss_cti_groups[] = {
+	"gpio4", "gpio5", "gpio23", "gpio24", "gpio49", "gpio50",
+	"gpio51", "gpio52",
+};
+
+static const char *const qdss_gpio_groups[] = {
+	"gpio57", "gpio58", "gpio97", "gpio106",
+	"gpio59", "gpio107", "gpio60", "gpio108",
+	"gpio36", "gpio100", "gpio61", "gpio101",
+	"gpio62", "gpio102", "gpio33", "gpio103",
+	"gpio34", "gpio104", "gpio75", "gpio105",
+	"gpio72", "gpio109", "gpio71", "gpio110",
+	"gpio70", "gpio111", "gpio63", "gpio112",
+	"gpio64", "gpio113", "gpio65", "gpio114",
+	"gpio73", "gpio98", "gpio74", "gpio99",
+};
+
+static const char *const qup0_se0_groups[] = {
+	"gpio17", "gpio18", "gpio19", "gpio20",
+};
+
+static const char *const qup0_se1_groups[] = {
+	"gpio19", "gpio20", "gpio17", "gpio18",
+};
+
+static const char *const qup0_se2_groups[] = {
+	"gpio33", "gpio34", "gpio35", "gpio36",
+};
+
+static const char *const qup0_se3_groups[] = {
+	"gpio25", "gpio26", "gpio27", "gpio28",
+};
+
+static const char *const qup0_se4_groups[] = {
+	"gpio29", "gpio30", "gpio31", "gpio32",
+};
+
+static const char *const qup0_se5_groups[] = {
+	"gpio21", "gpio22", "gpio23", "gpio24",
+};
+
+static const char *const qup0_se6_groups[] = {
+	"gpio80", "gpio81", "gpio82", "gpio83",
+};
+
+static const char *const qup0_se7_groups[] = {
+	"gpio43", "gpio44", "gpio43", "gpio44",
+};
+
+static const char *const qup1_se0_groups[] = {
+	"gpio37", "gpio38", "gpio39", "gpio40",
+};
+
+static const char *const qup1_se1_groups[] = {
+	"gpio39", "gpio40", "gpio37", "gpio38",
+};
+
+static const char *const qup1_se2_groups[] = {
+	"gpio84", "gpio85", "gpio86", "gpio87", "gpio88",
+};
+
+static const char *const qup1_se3_groups[] = {
+	"gpio41", "gpio42", "gpio41", "gpio42",
+};
+
+static const char *const qup1_se4_groups[] = {
+	"gpio45", "gpio46", "gpio47", "gpio48",
+};
+
+static const char *const qup1_se5_groups[] = {
+	"gpio49", "gpio50", "gpio51", "gpio52",
+};
+
+static const char *const qup1_se6_groups[] = {
+	"gpio89", "gpio90", "gpio91", "gpio92",
+};
+
+static const char *const qup1_se7_groups[] = {
+	"gpio91", "gpio92", "gpio89", "gpio90",
+};
+
+static const char *const qup2_se0_groups[] = {
+	"gpio10", "gpio11", "gpio12", "gpio13",
+	"gpio14", "gpio15", "gpio16",
+};
+
+static const char *const sailss_emac0_groups[] = {
+	"gpio15", "gpio16",
+};
+
+static const char *const sailss_ospi_groups[] = {
+	"gpio15", "gpio16",
+};
+
+static const char *const sgmii_phy_groups[] = {
+	"gpio4",
+};
+
+static const char *const tb_trig_groups[] = {
+	"gpio14",
+};
+
+static const char *const tgu_ch0_groups[] = {
+	"gpio43",
+};
+
+static const char *const tgu_ch1_groups[] = {
+	"gpio44",
+};
+
+static const char *const tgu_ch2_groups[] = {
+	"gpio29",
+};
+
+static const char *const tgu_ch3_groups[] = {
+	"gpio30",
+};
+
+static const char *const tsense_pwm1_groups[] = {
+	"gpio79",
+};
+
+static const char *const tsense_pwm2_groups[] = {
+	"gpio78",
+};
+
+static const char *const tsense_pwm3_groups[] = {
+	"gpio77",
+};
+
+static const char *const tsense_pwm4_groups[] = {
+	"gpio76",
+};
+
+static const char *const usb2phy_ac_groups[] = {
+	"gpio7", "gpio8",
+};
+
+static const char *const vsense_trigger_groups[] = {
+	"gpio67",
+};
+
+static const struct pinfunction qcs8300_functions[] = {
+	MSM_PIN_FUNCTION(gpio),
+	MSM_PIN_FUNCTION(aoss_cti),
+	MSM_PIN_FUNCTION(atest_char),
+	MSM_PIN_FUNCTION(atest_usb2),
+	MSM_PIN_FUNCTION(audio_ref),
+	MSM_PIN_FUNCTION(cam_mclk),
+	MSM_PIN_FUNCTION(cci_async),
+	MSM_PIN_FUNCTION(cci_i2c_scl),
+	MSM_PIN_FUNCTION(cci_i2c_sda),
+	MSM_PIN_FUNCTION(cci_timer),
+	MSM_PIN_FUNCTION(cri_trng),
+	MSM_PIN_FUNCTION(dbg_out),
+	MSM_PIN_FUNCTION(ddr_bist),
+	MSM_PIN_FUNCTION(ddr_pxi0),
+	MSM_PIN_FUNCTION(ddr_pxi1),
+	MSM_PIN_FUNCTION(ddr_pxi2),
+	MSM_PIN_FUNCTION(ddr_pxi3),
+	MSM_PIN_FUNCTION(edp0_hot),
+	MSM_PIN_FUNCTION(edp0_lcd),
+	MSM_PIN_FUNCTION(edp1_lcd),
+	MSM_PIN_FUNCTION(egpio),
+	MSM_PIN_FUNCTION(emac0_mcg0),
+	MSM_PIN_FUNCTION(emac0_mcg1),
+	MSM_PIN_FUNCTION(emac0_mcg2),
+	MSM_PIN_FUNCTION(emac0_mcg3),
+	MSM_PIN_FUNCTION(emac0_mdc),
+	MSM_PIN_FUNCTION(emac0_mdio),
+	MSM_PIN_FUNCTION(emac0_ptp_aux),
+	MSM_PIN_FUNCTION(emac0_ptp_pps),
+	MSM_PIN_FUNCTION(gcc_gp1),
+	MSM_PIN_FUNCTION(gcc_gp2),
+	MSM_PIN_FUNCTION(gcc_gp3),
+	MSM_PIN_FUNCTION(gcc_gp4),
+	MSM_PIN_FUNCTION(gcc_gp5),
+	MSM_PIN_FUNCTION(hs0_mi2s),
+	MSM_PIN_FUNCTION(hs1_mi2s),
+	MSM_PIN_FUNCTION(hs2_mi2s),
+	MSM_PIN_FUNCTION(ibi_i3c),
+	MSM_PIN_FUNCTION(jitter_bist),
+	MSM_PIN_FUNCTION(mdp0_vsync0),
+	MSM_PIN_FUNCTION(mdp0_vsync1),
+	MSM_PIN_FUNCTION(mdp0_vsync3),
+	MSM_PIN_FUNCTION(mdp0_vsync6),
+	MSM_PIN_FUNCTION(mdp0_vsync7),
+	MSM_PIN_FUNCTION(mdp_vsync),
+	MSM_PIN_FUNCTION(mi2s1_data0),
+	MSM_PIN_FUNCTION(mi2s1_data1),
+	MSM_PIN_FUNCTION(mi2s1_sck),
+	MSM_PIN_FUNCTION(mi2s1_ws),
+	MSM_PIN_FUNCTION(mi2s2_data0),
+	MSM_PIN_FUNCTION(mi2s2_data1),
+	MSM_PIN_FUNCTION(mi2s2_sck),
+	MSM_PIN_FUNCTION(mi2s2_ws),
+	MSM_PIN_FUNCTION(mi2s_mclk0),
+	MSM_PIN_FUNCTION(mi2s_mclk1),
+	MSM_PIN_FUNCTION(pcie0_clkreq),
+	MSM_PIN_FUNCTION(pcie1_clkreq),
+	MSM_PIN_FUNCTION(phase_flag),
+	MSM_PIN_FUNCTION(pll_bist),
+	MSM_PIN_FUNCTION(pll_clk),
+	MSM_PIN_FUNCTION(prng_rosc0),
+	MSM_PIN_FUNCTION(prng_rosc1),
+	MSM_PIN_FUNCTION(prng_rosc2),
+	MSM_PIN_FUNCTION(prng_rosc3),
+	MSM_PIN_FUNCTION(qdss_cti),
+	MSM_PIN_FUNCTION(qdss_gpio),
+	MSM_PIN_FUNCTION(qup0_se0),
+	MSM_PIN_FUNCTION(qup0_se1),
+	MSM_PIN_FUNCTION(qup0_se2),
+	MSM_PIN_FUNCTION(qup0_se3),
+	MSM_PIN_FUNCTION(qup0_se4),
+	MSM_PIN_FUNCTION(qup0_se5),
+	MSM_PIN_FUNCTION(qup0_se6),
+	MSM_PIN_FUNCTION(qup0_se7),
+	MSM_PIN_FUNCTION(qup1_se0),
+	MSM_PIN_FUNCTION(qup1_se1),
+	MSM_PIN_FUNCTION(qup1_se2),
+	MSM_PIN_FUNCTION(qup1_se3),
+	MSM_PIN_FUNCTION(qup1_se4),
+	MSM_PIN_FUNCTION(qup1_se5),
+	MSM_PIN_FUNCTION(qup1_se6),
+	MSM_PIN_FUNCTION(qup1_se7),
+	MSM_PIN_FUNCTION(qup2_se0),
+	MSM_PIN_FUNCTION(sailss_emac0),
+	MSM_PIN_FUNCTION(sailss_ospi),
+	MSM_PIN_FUNCTION(sgmii_phy),
+	MSM_PIN_FUNCTION(tb_trig),
+	MSM_PIN_FUNCTION(tgu_ch0),
+	MSM_PIN_FUNCTION(tgu_ch1),
+	MSM_PIN_FUNCTION(tgu_ch2),
+	MSM_PIN_FUNCTION(tgu_ch3),
+	MSM_PIN_FUNCTION(tsense_pwm1),
+	MSM_PIN_FUNCTION(tsense_pwm2),
+	MSM_PIN_FUNCTION(tsense_pwm3),
+	MSM_PIN_FUNCTION(tsense_pwm4),
+	MSM_PIN_FUNCTION(usb2phy_ac),
+	MSM_PIN_FUNCTION(vsense_trigger),
+};
+
+/*
+ * Every pin is maintained as a single group, and missing or non-existing pin
+ * would be maintained as dummy group to synchronize pin group index with
+ * pin descriptor registered with pinctrl core.
+ * Clients would not be able to request these dummy pin groups.
+ */
+static const struct msm_pingroup qcs8300_groups[] = {
+	[0] = PINGROUP(0, _, _, _, _, _, _, _, _, _, _, _),
+	[1] = PINGROUP(1, pcie0_clkreq, _, _, _, _, _, _, _, _, _, _),
+	[2] = PINGROUP(2, _, _, _, _, _, _, _, _, _, _, _),
+	[3] = PINGROUP(3, phase_flag, _, _, _, _, _, _, _, _, _, _),
+	[4] = PINGROUP(4, sgmii_phy, qdss_cti, _, _, _, _, _, _, _, _, _),
+	[5] = PINGROUP(5, emac0_mdc, qdss_cti, _, _, _, _, _, _, _, _, _),
+	[6] = PINGROUP(6, emac0_mdio, _, _, _, _, _, _, _, _, _, _),
+	[7] = PINGROUP(7, usb2phy_ac, _, _, _, _, _, _, _, _, _, _),
+	[8] = PINGROUP(8, usb2phy_ac, _, _, _, _, _, _, _, _, _, _),
+	[9] = PINGROUP(9, phase_flag, _, _, _, _, _, _, _, _, _, _),
+	[10] = PINGROUP(10, qup2_se0, emac0_mcg0, _, _, _, _, _, _, _, _, _),
+	[11] = PINGROUP(11, qup2_se0, emac0_mcg1, _, _, _, _, _, _, _, _, _),
+	[12] = PINGROUP(12, qup2_se0, _, _, _, _, _, _, _, _, _, _),
+	[13] = PINGROUP(13, qup2_se0, _, _, _, _, _, _, _, _, _, _),
+	[14] = PINGROUP(14, qup2_se0, tb_trig, _, _, _, _, _, _, _, _, _),
+	[15] = PINGROUP(15, qup2_se0, _, sailss_ospi, sailss_emac0, _, _, _, _, _, _, _),
+	[16] = PINGROUP(16, qup2_se0, _, _, sailss_ospi, sailss_emac0, _, _, _, _, _, _),
+	[17] = PINGROUP(17, qup0_se0, qup0_se1, ibi_i3c, _, _, _, _, _, _, _, _),
+	[18] = PINGROUP(18, qup0_se0, qup0_se1, ibi_i3c, _, _, _, _, _, _, _, _),
+	[19] = PINGROUP(19, qup0_se1, qup0_se0, cci_timer, ibi_i3c, _, _, _, _, _, _, _),
+	[20] = PINGROUP(20, qup0_se1, qup0_se0, cci_timer, ibi_i3c, _, _, _, _, _, _, _),
+	[21] = PINGROUP(21, qup0_se5, cci_timer, _, _, _, _, _, _, _, _, _),
+	[22] = PINGROUP(22, pcie1_clkreq, qup0_se5, cci_timer, _, _, _, _, _, _, _, _),
+	[23] = PINGROUP(23, qup0_se5, cci_timer, qdss_cti, _, _, _, _, _, _, _, _),
+	[24] = PINGROUP(24, qup0_se5, emac0_ptp_aux, emac0_ptp_pps, qdss_cti,
+			emac0_mcg2, _, _, _, _, _, _),
+	[25] = PINGROUP(25, qup0_se3, phase_flag, _, _, _, _, _, _, _, _, _),
+	[26] = PINGROUP(26, qup0_se3, phase_flag, _, _, _, _, _, _, _, _, _),
+	[27] = PINGROUP(27, qup0_se3, _, _, _, _, _, _, _, _, _, _),
+	[28] = PINGROUP(28, qup0_se3, phase_flag, _, _, _, _, _, _, _, _, _),
+	[29] = PINGROUP(29, qup0_se4, cci_i2c_sda, cci_async, emac0_ptp_pps,
+			tgu_ch2, _, _, _, _, _, _),
+	[30] = PINGROUP(30, qup0_se4, cci_i2c_scl, cci_async, emac0_ptp_pps,
+			tgu_ch3, _, _, _, _, _, _),
+	[31] = PINGROUP(31, qup0_se4, cci_i2c_sda, cci_async, emac0_ptp_aux, _, _, _, _, _, _, _),
+	[32] = PINGROUP(32, qup0_se4, cci_i2c_scl, emac0_ptp_aux, mdp_vsync, _, _, _, _, _, _, _),
+	[33] = PINGROUP(33, qup0_se2, qdss_gpio, _, _, _, _, _, _, _, _, _),
+	[34] = PINGROUP(34, qup0_se2, qdss_gpio, _, _, _, _, _, _, _, _, _),
+	[35] = PINGROUP(35, qup0_se2, gcc_gp1, _, _, _, _, _, _, _, _, _),
+	[36] = PINGROUP(36, qup0_se2, gcc_gp2, qdss_gpio, _, _, _, _, _, _, _, _),
+	[37] = PINGROUP(37, qup1_se0, ibi_i3c, qup1_se1, aoss_cti, _, _, _, _, _, _, _),
+	[38] = PINGROUP(38, qup1_se0, ibi_i3c, qup1_se1, aoss_cti, _, _, _, _, _, _, _),
+	[39] = PINGROUP(39, qup1_se1, ibi_i3c, qup1_se0, aoss_cti, _, _, _, _, _, _, _),
+	[40] = PINGROUP(40, qup1_se1, ibi_i3c, qup1_se0, aoss_cti, _, _, _, _, _, _, _),
+	[41] = PINGROUP(41, qup1_se3, _, _, _, _, _, _, _, _, _, _),
+	[42] = PINGROUP(42, qup1_se3, _, mdp_vsync, _, _, _, _, _, _, _, _),
+	[43] = PINGROUP(43, qup0_se7, _, tgu_ch0, _, _, _, _, _, _, _, _),
+	[44] = PINGROUP(44, qup0_se7, _, tgu_ch1, _, _, _, _, _, _, _, _),
+	[45] = PINGROUP(45, qup1_se4, hs1_mi2s, _, _, _, _, _, _, _, _, _),
+	[46] = PINGROUP(46, qup1_se4, hs1_mi2s, _, _, _, _, _, _, _, _, _),
+	[47] = PINGROUP(47, qup1_se4, hs1_mi2s, _, _, _, _, _, _, _, _, _),
+	[48] = PINGROUP(48, qup1_se4, hs1_mi2s, edp0_lcd, _, _, _, _, _, _, _, _),
+	[49] = PINGROUP(49, qup1_se5, hs2_mi2s, cci_timer, qdss_cti, edp1_lcd,
+			ddr_pxi1, _, _, _, _, _),
+	[50] = PINGROUP(50, qup1_se5, hs2_mi2s, cci_timer, qdss_cti, _, ddr_pxi1, _, _, _, _, _),
+	[51] = PINGROUP(51, qup1_se5, hs2_mi2s, qdss_cti, _, _, _, _, _, _, _, _),
+	[52] = PINGROUP(52, qup1_se5, hs2_mi2s, qdss_cti, mdp_vsync, ddr_pxi2, _, _, _, _, _, _),
+	[53] = PINGROUP(53, ddr_bist, _, _, _, _, _, _, _, _, _, _),
+	[54] = PINGROUP(54, cci_i2c_sda, phase_flag, ddr_bist, _, _, _, _, _, _, _, _),
+	[55] = PINGROUP(55, cci_i2c_scl, phase_flag, ddr_bist, _, _, _, _, _, _, _, _),
+	[56] = PINGROUP(56, phase_flag, ddr_bist, _, _, _, _, _, _, _, _, _),
+	[57] = PINGROUP(57, cci_i2c_sda, prng_rosc0, qdss_gpio, _, _, _, _, _, _, _, _),
+	[58] = PINGROUP(58, cci_i2c_scl, prng_rosc1, qdss_gpio, _, _, _, _, _, _, _, _),
+	[59] = PINGROUP(59, cci_i2c_sda, prng_rosc2, qdss_gpio, _, _, _, _, _, _, _, _),
+	[60] = PINGROUP(60, cci_i2c_scl, prng_rosc3, qdss_gpio, _, _, _, _, _, _, _, _),
+	[61] = PINGROUP(61, cci_i2c_sda, qdss_gpio, _, _, _, _, _, _, _, _, _),
+	[62] = PINGROUP(62, cci_i2c_scl, qdss_gpio, _, _, _, _, _, _, _, _, _),
+	[63] = PINGROUP(63, cci_timer, cci_async, qdss_gpio, atest_usb2, _, _, _, _, _, _, _),
+	[64] = PINGROUP(64, cci_timer, cci_async, qdss_gpio, atest_usb2, _, _, _, _, _, _, _),
+	[65] = PINGROUP(65, cci_timer, cci_async, qdss_gpio, atest_usb2, _, _, _, _, _, _, _),
+	[66] = PINGROUP(66, phase_flag, _, atest_char, _, _, _, _, _, _, _, _),
+	[67] = PINGROUP(67, cam_mclk, vsense_trigger, atest_usb2, _, _, _, _, _, _, _, _),
+	[68] = PINGROUP(68, cam_mclk, gcc_gp4, atest_usb2, ddr_pxi0, _, _, _, _, _, _, _),
+	[69] = PINGROUP(69, cam_mclk, gcc_gp3, atest_usb2, ddr_pxi0, _, _, _, _, _, _, _),
+	[70] = PINGROUP(70, qdss_gpio, atest_char, _, _, _, _, _, _, _, _, _),
+	[71] = PINGROUP(71, qdss_gpio, atest_char, _, _, _, _, _, _, _, _, _),
+	[72] = PINGROUP(72, qdss_gpio, atest_char, _, _, _, _, _, _, _, _, _),
+	[73] = PINGROUP(73, _, qdss_gpio, _, _, _, _, _, _, _, _, _),
+	[74] = PINGROUP(74, pll_clk, qdss_gpio, atest_usb2, _, _, _, _, _, _, _, _),
+	[75] = PINGROUP(75, _, dbg_out, qdss_gpio, atest_usb2, _, _, _, _, _, _, _),
+	[76] = PINGROUP(76, gcc_gp5, tsense_pwm4, _, _, _, _, _, _, _, _, _),
+	[77] = PINGROUP(77, gcc_gp5, tsense_pwm3, _, _, _, _, _, _, _, _, _),
+	[78] = PINGROUP(78, tsense_pwm2, _, _, _, _, _, _, _, _, _, _),
+	[79] = PINGROUP(79, emac0_ptp_aux, emac0_ptp_pps, emac0_mcg3, _,
+			tsense_pwm1, _, _, _, _, _, _),
+	[80] = PINGROUP(80, qup0_se6, mdp0_vsync6, _, atest_usb2, ddr_pxi3, _, _, _, _, _, _),
+	[81] = PINGROUP(81, qup0_se6, mdp0_vsync7, gcc_gp2, _, atest_usb2, ddr_pxi3, _, _, _, _, _),
+	[82] = PINGROUP(82, qup0_se6, gcc_gp3, _, _, _, _, _, _, _, _, _),
+	[83] = PINGROUP(83, qup0_se6, gcc_gp4, _, atest_usb2, ddr_pxi2, _, _, _, _, _, _),
+	[84] = PINGROUP(84, qup1_se2, gcc_gp1, _, atest_usb2, _, _, _, _, _, _, _),
+	[85] = PINGROUP(85, qup1_se2, _, atest_usb2, _, _, _, _, _, _, _, _),
+	[86] = PINGROUP(86, qup1_se2, _, _, _, _, _, _, _, _, _, _),
+	[87] = PINGROUP(87, qup1_se2, _, atest_usb2, _, _, _, _, _, _, _, _),
+	[88] = PINGROUP(88, qup1_se2, _, _, _, _, _, _, _, _, _, _),
+	[89] = PINGROUP(89, qup1_se6, qup1_se7, mdp0_vsync0, _, _, _, _, _, _, _, _),
+	[90] = PINGROUP(90, qup1_se6, qup1_se7, mdp0_vsync1, cri_trng, _, _, _, _, _, _, _),
+	[91] = PINGROUP(91, qup1_se7, qup1_se6, mdp0_vsync3, cri_trng, _, _, _, _, _, _, _),
+	[92] = PINGROUP(92, qup1_se7, qup1_se6, cri_trng, _, atest_usb2, _, _, _, _, _, _),
+	[93] = PINGROUP(93, atest_char, _, _, _, _, _, _, _, _, _, _),
+	[94] = PINGROUP(94, edp0_hot, _, _, _, _, _, _, _, _, _, _),
+	[95] = PINGROUP(95, _, _, _, _, _, _, _, _, _, _, _),
+	[96] = PINGROUP(96, _, _, _, _, _, _, _, _, _, _, _),
+	[97] = PINGROUP(97, mi2s_mclk0, jitter_bist, qdss_gpio, _, _, _, _, _, _, _, _),
+	[98] = PINGROUP(98, mi2s1_sck, phase_flag, _, qdss_gpio, _, _, _, _, _, _, _),
+	[99] = PINGROUP(99, mi2s1_ws, phase_flag, _, qdss_gpio, _, _, _, _, _, _, _),
+	[100] = PINGROUP(100, mi2s1_data0, phase_flag, _, qdss_gpio, _, _, _, _, _, _, _),
+	[101] = PINGROUP(101, mi2s1_data1, phase_flag, _, qdss_gpio, _, _, _, _, _, _, _),
+	[102] = PINGROUP(102, mi2s2_sck, phase_flag, _, qdss_gpio, _, _, _, _, _, _, _),
+	[103] = PINGROUP(103, mi2s2_ws, phase_flag, _, qdss_gpio, _, _, _, _, _, _, _),
+	[104] = PINGROUP(104, mi2s2_data0, phase_flag, _, qdss_gpio, _, _, _, _, _, _, _),
+	[105] = PINGROUP(105, mi2s2_data1, audio_ref, phase_flag, _, qdss_gpio, _, _, _, _, _, _),
+	[106] = PINGROUP(106, hs0_mi2s, phase_flag, _, qdss_gpio, _, _, _, _, _, _, _),
+	[107] = PINGROUP(107, hs0_mi2s, pll_bist, phase_flag, _, qdss_gpio, _, _, _, _, _, _),
+	[108] = PINGROUP(108, hs0_mi2s, phase_flag, _, qdss_gpio, _, _, _, _, _, _, _),
+	[109] = PINGROUP(109, hs0_mi2s, mi2s_mclk1, qdss_gpio, _, _, _, _, _, _, _, _),
+	[110] = PINGROUP(110, phase_flag, _, qdss_gpio, _, _, _, _, _, _, _, egpio),
+	[111] = PINGROUP(111, phase_flag, _, qdss_gpio, _, _, _, _, _, _, _, egpio),
+	[112] = PINGROUP(112, phase_flag, _, qdss_gpio, _, _, _, _, _, _, _, egpio),
+	[113] = PINGROUP(113, phase_flag, _, qdss_gpio, _, _, _, _, _, _, _, egpio),
+	[114] = PINGROUP(114, phase_flag, _, qdss_gpio, _, _, _, _, _, _, _, egpio),
+	[115] = PINGROUP(115, _, _, _, _, _, _, _, _, _, _, egpio),
+	[116] = PINGROUP(116, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[117] = PINGROUP(117, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[118] = PINGROUP(118, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[119] = PINGROUP(119, _, _, _, _, _, _, _, _, _, _, egpio),
+	[120] = PINGROUP(120, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[121] = PINGROUP(121, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[122] = PINGROUP(122, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[123] = PINGROUP(123, _, _, _, _, _, _, _, _, _, _, egpio),
+	[124] = PINGROUP(124, _, _, _, _, _, _, _, _, _, _, egpio),
+	[125] = PINGROUP(125, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[126] = PINGROUP(126, _, _, _, _, _, _, _, _, _, _, egpio),
+	[127] = PINGROUP(127, _, _, _, _, _, _, _, _, _, _, egpio),
+	[128] = PINGROUP(128, _, _, _, _, _, _, _, _, _, _, egpio),
+	[129] = PINGROUP(129, _, _, _, _, _, _, _, _, _, _, egpio),
+	[130] = PINGROUP(130, _, _, _, _, _, _, _, _, _, _, egpio),
+	[131] = PINGROUP(131, _, _, _, _, _, _, _, _, _, _, egpio),
+	[132] = PINGROUP(132, _, _, _, _, _, _, _, _, _, _, egpio),
+	[133] = UFS_RESET(ufs_reset, 0x92000),
+	[134] = SDC_QDSD_PINGROUP(sdc1_rclk, 0x89000, 15, 0),
+	[135] = SDC_QDSD_PINGROUP(sdc1_clk, 0x89000, 13, 6),
+	[136] = SDC_QDSD_PINGROUP(sdc1_cmd, 0x89000, 11, 3),
+	[137] = SDC_QDSD_PINGROUP(sdc1_data, 0x89000, 9, 0),
+};
+
+static const struct msm_gpio_wakeirq_map qcs8300_pdc_map[] = {
+	{ 0, 169 },   { 1, 174 },   { 2, 221 },   { 3, 176 },   { 4, 171 },
+	{ 9, 198 },   { 10, 187 },  { 11, 188 },  { 13, 211 },  { 16, 203 },
+	{ 17, 213 },  { 18, 209 },  { 19, 201 },  { 20, 230 },  { 21, 231 },
+	{ 22, 175 },  { 23, 170 },  { 24, 232 },  { 28, 235 },  { 29, 216 },
+	{ 31, 208 },  { 32, 200 },  { 36, 212 },  { 37, 177 },  { 38, 178 },
+	{ 39, 184 },  { 40, 185 },  { 42, 186 },  { 44, 194 },  { 45, 173 },
+	{ 48, 195 },  { 51, 215 },  { 52, 197 },  { 53, 192 },  { 56, 193 },
+	{ 66, 238 },  { 67, 172 },  { 68, 182 },  { 69, 179 },  { 70, 181 },
+	{ 71, 202 },  { 72, 183 },  { 73, 189 },  { 74, 196 },  { 75, 190 },
+	{ 76, 191 },  { 77, 204 },  { 78, 206 },  { 79, 207 },  { 83, 214 },
+	{ 84, 205 },  { 87, 237 },  { 89, 225 },  { 90, 217 },  { 91, 218 },
+	{ 92, 226 },  { 93, 227 },  { 94, 228 },  { 95, 236 },  { 97, 199 },
+	{ 98, 229 },  { 99, 180 },  { 100, 220 }, { 101, 239 }, { 102, 219 },
+	{ 103, 233 }, { 104, 234 }, { 105, 223 }, { 129, 210 }, { 130, 222 },
+};
+
+static const struct msm_pinctrl_soc_data qcs8300_pinctrl = {
+	.pins = qcs8300_pins,
+	.npins = ARRAY_SIZE(qcs8300_pins),
+	.functions = qcs8300_functions,
+	.nfunctions = ARRAY_SIZE(qcs8300_functions),
+	.groups = qcs8300_groups,
+	.ngroups = ARRAY_SIZE(qcs8300_groups),
+	.ngpios = 134,
+	.wakeirq_map = qcs8300_pdc_map,
+	.nwakeirq_map = ARRAY_SIZE(qcs8300_pdc_map),
+	.egpio_func = 11,
+};
+
+static int qcs8300_pinctrl_probe(struct platform_device *pdev)
+{
+	return msm_pinctrl_probe(pdev, &qcs8300_pinctrl);
+}
+
+static const struct of_device_id qcs8300_pinctrl_of_match[] = {
+	{ .compatible = "qcom,qcs8300-tlmm", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, qcs8300_pinctrl_of_match);
+
+static struct platform_driver qcs8300_pinctrl_driver = {
+	.driver = {
+		.name = "qcs8300-tlmm",
+		.of_match_table = qcs8300_pinctrl_of_match,
+	},
+	.probe = qcs8300_pinctrl_probe,
+	.remove_new = msm_pinctrl_remove,
+};
+
+static int __init qcs8300_pinctrl_init(void)
+{
+	return platform_driver_register(&qcs8300_pinctrl_driver);
+}
+arch_initcall(qcs8300_pinctrl_init);
+
+static void __exit qcs8300_pinctrl_exit(void)
+{
+	platform_driver_unregister(&qcs8300_pinctrl_driver);
+}
+module_exit(qcs8300_pinctrl_exit);
+
+MODULE_DESCRIPTION("QTI QCS8300 pinctrl driver");
+MODULE_LICENSE("GPL");

-- 
2.25.1


