Return-Path: <linux-gpio+bounces-12838-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E8D9C4AE8
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 01:32:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 211311F22F52
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 00:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E551D1F80DF;
	Tue, 12 Nov 2024 00:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Cy6aRnan"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519D91F26FA;
	Tue, 12 Nov 2024 00:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731371372; cv=none; b=tMMPrsstHfbn8gIugQMuc2rYiJyRBdGIOKtoyeq9yuD+U//jVZhDDMqKpeCUTVNrd2hsi4dtGOOBE31jiGJOgkLQUcyU0ZLkja9Moi2K9rgbHOFCWsCHViDCVv5I9OWDj9j7GFlgjYqlFD86bWeW2OxpMJiDKfldj+AMJYoaKQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731371372; c=relaxed/simple;
	bh=jSyE12O57Lrs9g8+QM6mYMr6JFWYLEelLypTw5wuoxg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L0/000LOguwZ0Hz6AMgwtcAXuHOrBiXFRtAmIoLb/eMkaa2eFTStHhF+fjYKeldl+Ya+2iHjBYMWhWW5dMdz+e2QYH2YZ6zQWrTH+s2u4YeVXeqWVQhW6K6KxGe7gMwsstINLnOxcRYE1cT0Nzvo7ZkPbG4sgWCxlqmk0e7/9gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Cy6aRnan; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABBVhZt027992;
	Tue, 12 Nov 2024 00:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G9sUq3T6FP2nU0e0AayAfz6oz0EwGdTxf2a26zjXAvk=; b=Cy6aRnanYTAfg+fW
	c9I+U9LAu2fIDwdmoUviW6S/bEdXJ44nRmPj3ceOn1shi4d6nOpLtB85q1gzEtha
	pt/0W5/yxIQwr+K6LZIxbXkrzbwThtPLiqJ7qPOUvx1fMtsscGeRHBzdcxWuFy71
	Wa5mrF79efsjwlAJFLO557O5CychDX5lyJU1lkwoaiJUXtoneHnx+U9FrNsBFdje
	RNWbI5E2mZ59ToURPobyJMCTv0j0zQ5ejy6z/dy8XVS8n06whrsFcdNl48F2OEhK
	gTxqy146QPVdgGveOdSLHIwFeF9AtZ8FZON6v0wkAElF2AqJi8m7aLGd3SGspTRn
	b9ztYg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42sxpqdrg0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 00:29:22 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AC0TMjZ027399
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 00:29:22 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 11 Nov 2024 16:29:21 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Melody
 Olvera" <quic_molvera@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/2] pinctrl: qcom: Add sm8750 pinctrl driver
Date: Mon, 11 Nov 2024 16:28:43 -0800
Message-ID: <20241112002843.2804490-3-quic_molvera@quicinc.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241112002843.2804490-1-quic_molvera@quicinc.com>
References: <20241112002843.2804490-1-quic_molvera@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: G8JDNPFgbLI7Ens8GaokETkRAoK1FmeH
X-Proofpoint-ORIG-GUID: G8JDNPFgbLI7Ens8GaokETkRAoK1FmeH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 phishscore=0
 suspectscore=0 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411120002

Add TLMM pinctrl driver to support pin configuration with pinctrl
framework for sm8750 SoC.

Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 drivers/pinctrl/qcom/Kconfig.msm      |    8 +
 drivers/pinctrl/qcom/Makefile         |    1 +
 drivers/pinctrl/qcom/pinctrl-sm8750.c | 1729 +++++++++++++++++++++++++
 3 files changed, 1738 insertions(+)
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sm8750.c

diff --git a/drivers/pinctrl/qcom/Kconfig.msm b/drivers/pinctrl/qcom/Kconfig.msm
index 38d44052d3c9..206226318e45 100644
--- a/drivers/pinctrl/qcom/Kconfig.msm
+++ b/drivers/pinctrl/qcom/Kconfig.msm
@@ -413,6 +413,14 @@ config PINCTRL_SM8650
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
 	  Technologies Inc SM8650 platform.
 
+config PINCTRL_SM8750
+	tristate "Qualcomm Technologies Inc SM8750 pin controller driver"
+	depends on ARM64 || COMPILE_TEST
+	help
+	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
+	  Technologies Inc SM8750 platform.
+
 config PINCTRL_X1E80100
 	tristate "Qualcomm Technologies Inc X1E80100 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
index 51bf41c34380..9a23d41d801c 100644
--- a/drivers/pinctrl/qcom/Makefile
+++ b/drivers/pinctrl/qcom/Makefile
@@ -66,6 +66,7 @@ obj-$(CONFIG_PINCTRL_SM8550) += pinctrl-sm8550.o
 obj-$(CONFIG_PINCTRL_SM8550_LPASS_LPI) += pinctrl-sm8550-lpass-lpi.o
 obj-$(CONFIG_PINCTRL_SM8650) += pinctrl-sm8650.o
 obj-$(CONFIG_PINCTRL_SM8650_LPASS_LPI) += pinctrl-sm8650-lpass-lpi.o
+obj-$(CONFIG_PINCTRL_SM8750) += pinctrl-sm8750.o
 obj-$(CONFIG_PINCTRL_SC8280XP_LPASS_LPI) += pinctrl-sc8280xp-lpass-lpi.o
 obj-$(CONFIG_PINCTRL_LPASS_LPI) += pinctrl-lpass-lpi.o
 obj-$(CONFIG_PINCTRL_X1E80100)	+= pinctrl-x1e80100.o
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8750.c b/drivers/pinctrl/qcom/pinctrl-sm8750.c
new file mode 100644
index 000000000000..1af11cd95fb0
--- /dev/null
+++ b/drivers/pinctrl/qcom/pinctrl-sm8750.c
@@ -0,0 +1,1729 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#include "pinctrl-msm.h"
+
+#define REG_SIZE 0x1000
+
+#define PINGROUP(id, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11)	\
+	{					        \
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
+		},					        \
+		.nfuncs = 12,				\
+		.ctl_reg = REG_SIZE * id,                             \
+		.io_reg = 0x4 + REG_SIZE * id,                        \
+		.intr_cfg_reg = 0x8 + REG_SIZE * id,                  \
+		.intr_status_reg = 0xc + REG_SIZE * id,               \
+		.intr_target_reg = 0x8 + REG_SIZE * id,               \
+		.mux_bit = 2,                                         \
+		.pull_bit = 0,                                        \
+		.drv_bit = 6,                                         \
+		.egpio_enable = 12,                                   \
+		.egpio_present = 11,                                  \
+		.oe_bit = 9,                                          \
+		.in_bit = 0,                                          \
+		.out_bit = 1,                                         \
+		.intr_enable_bit = 0,                                 \
+		.intr_status_bit = 0,                                 \
+		.intr_target_bit = 5,                                 \
+		.intr_target_kpss_val = 3,                            \
+		.intr_raw_status_bit = 4,                             \
+		.intr_polarity_bit = 1,                               \
+		.intr_detection_bit = 2,                              \
+		.intr_detection_width = 2,                            \
+	}
+
+#define SDC_QDSD_PINGROUP(pg_name, ctl, pull, drv)                   \
+	{                                                            \
+		.grp = PINCTRL_PINGROUP(#pg_name,                    \
+					pg_name##_pins,              \
+					ARRAY_SIZE(pg_name##_pins)), \
+		.ctl_reg = ctl,                                      \
+		.io_reg = 0,                                         \
+		.intr_cfg_reg = 0,                                   \
+		.intr_status_reg = 0,                                \
+		.intr_target_reg = 0,                                \
+		.mux_bit = -1,                                       \
+		.pull_bit = pull,                                    \
+		.drv_bit = drv,                                      \
+		.oe_bit = -1,                                        \
+		.in_bit = -1,                                        \
+		.out_bit = -1,                                       \
+		.intr_enable_bit = -1,                               \
+		.intr_status_bit = -1,                               \
+		.intr_target_bit = -1,                               \
+		.intr_raw_status_bit = -1,                           \
+		.intr_polarity_bit = -1,                             \
+		.intr_detection_bit = -1,                            \
+		.intr_detection_width = -1,                          \
+	}
+
+#define UFS_RESET(pg_name, ctl, io)			\
+	{					        \
+		.grp = PINCTRL_PINGROUP(#pg_name,	\
+			pg_name##_pins,			\
+			ARRAY_SIZE(pg_name##_pins)),	\
+		.ctl_reg = ctl,				\
+		.io_reg = io,				\
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
+static const struct pinctrl_pin_desc sm8750_pins[] = {
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
+	PINCTRL_PIN(133, "GPIO_133"),
+	PINCTRL_PIN(134, "GPIO_134"),
+	PINCTRL_PIN(135, "GPIO_135"),
+	PINCTRL_PIN(136, "GPIO_136"),
+	PINCTRL_PIN(137, "GPIO_137"),
+	PINCTRL_PIN(138, "GPIO_138"),
+	PINCTRL_PIN(139, "GPIO_139"),
+	PINCTRL_PIN(140, "GPIO_140"),
+	PINCTRL_PIN(141, "GPIO_141"),
+	PINCTRL_PIN(142, "GPIO_142"),
+	PINCTRL_PIN(143, "GPIO_143"),
+	PINCTRL_PIN(144, "GPIO_144"),
+	PINCTRL_PIN(145, "GPIO_145"),
+	PINCTRL_PIN(146, "GPIO_146"),
+	PINCTRL_PIN(147, "GPIO_147"),
+	PINCTRL_PIN(148, "GPIO_148"),
+	PINCTRL_PIN(149, "GPIO_149"),
+	PINCTRL_PIN(150, "GPIO_150"),
+	PINCTRL_PIN(151, "GPIO_151"),
+	PINCTRL_PIN(152, "GPIO_152"),
+	PINCTRL_PIN(153, "GPIO_153"),
+	PINCTRL_PIN(154, "GPIO_154"),
+	PINCTRL_PIN(155, "GPIO_155"),
+	PINCTRL_PIN(156, "GPIO_156"),
+	PINCTRL_PIN(157, "GPIO_157"),
+	PINCTRL_PIN(158, "GPIO_158"),
+	PINCTRL_PIN(159, "GPIO_159"),
+	PINCTRL_PIN(160, "GPIO_160"),
+	PINCTRL_PIN(161, "GPIO_161"),
+	PINCTRL_PIN(162, "GPIO_162"),
+	PINCTRL_PIN(163, "GPIO_163"),
+	PINCTRL_PIN(164, "GPIO_164"),
+	PINCTRL_PIN(165, "GPIO_165"),
+	PINCTRL_PIN(166, "GPIO_166"),
+	PINCTRL_PIN(167, "GPIO_167"),
+	PINCTRL_PIN(168, "GPIO_168"),
+	PINCTRL_PIN(169, "GPIO_169"),
+	PINCTRL_PIN(170, "GPIO_170"),
+	PINCTRL_PIN(171, "GPIO_171"),
+	PINCTRL_PIN(172, "GPIO_172"),
+	PINCTRL_PIN(173, "GPIO_173"),
+	PINCTRL_PIN(174, "GPIO_174"),
+	PINCTRL_PIN(175, "GPIO_175"),
+	PINCTRL_PIN(176, "GPIO_176"),
+	PINCTRL_PIN(177, "GPIO_177"),
+	PINCTRL_PIN(178, "GPIO_178"),
+	PINCTRL_PIN(179, "GPIO_179"),
+	PINCTRL_PIN(180, "GPIO_180"),
+	PINCTRL_PIN(181, "GPIO_181"),
+	PINCTRL_PIN(182, "GPIO_182"),
+	PINCTRL_PIN(183, "GPIO_183"),
+	PINCTRL_PIN(184, "GPIO_184"),
+	PINCTRL_PIN(185, "GPIO_185"),
+	PINCTRL_PIN(186, "GPIO_186"),
+	PINCTRL_PIN(187, "GPIO_187"),
+	PINCTRL_PIN(188, "GPIO_188"),
+	PINCTRL_PIN(189, "GPIO_189"),
+	PINCTRL_PIN(190, "GPIO_190"),
+	PINCTRL_PIN(191, "GPIO_191"),
+	PINCTRL_PIN(192, "GPIO_192"),
+	PINCTRL_PIN(193, "GPIO_193"),
+	PINCTRL_PIN(194, "GPIO_194"),
+	PINCTRL_PIN(195, "GPIO_195"),
+	PINCTRL_PIN(196, "GPIO_196"),
+	PINCTRL_PIN(197, "GPIO_197"),
+	PINCTRL_PIN(198, "GPIO_198"),
+	PINCTRL_PIN(199, "GPIO_199"),
+	PINCTRL_PIN(200, "GPIO_200"),
+	PINCTRL_PIN(201, "GPIO_201"),
+	PINCTRL_PIN(202, "GPIO_202"),
+	PINCTRL_PIN(203, "GPIO_203"),
+	PINCTRL_PIN(204, "GPIO_204"),
+	PINCTRL_PIN(205, "GPIO_205"),
+	PINCTRL_PIN(206, "GPIO_206"),
+	PINCTRL_PIN(207, "GPIO_207"),
+	PINCTRL_PIN(208, "GPIO_208"),
+	PINCTRL_PIN(209, "GPIO_209"),
+	PINCTRL_PIN(210, "GPIO_210"),
+	PINCTRL_PIN(211, "GPIO_211"),
+	PINCTRL_PIN(212, "GPIO_212"),
+	PINCTRL_PIN(213, "GPIO_213"),
+	PINCTRL_PIN(214, "GPIO_214"),
+	PINCTRL_PIN(215, "UFS_RESET"),
+	PINCTRL_PIN(216, "SDC2_CLK"),
+	PINCTRL_PIN(217, "SDC2_CMD"),
+	PINCTRL_PIN(218, "SDC2_DATA"),
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
+DECLARE_MSM_GPIO_PINS(133);
+DECLARE_MSM_GPIO_PINS(134);
+DECLARE_MSM_GPIO_PINS(135);
+DECLARE_MSM_GPIO_PINS(136);
+DECLARE_MSM_GPIO_PINS(137);
+DECLARE_MSM_GPIO_PINS(138);
+DECLARE_MSM_GPIO_PINS(139);
+DECLARE_MSM_GPIO_PINS(140);
+DECLARE_MSM_GPIO_PINS(141);
+DECLARE_MSM_GPIO_PINS(142);
+DECLARE_MSM_GPIO_PINS(143);
+DECLARE_MSM_GPIO_PINS(144);
+DECLARE_MSM_GPIO_PINS(145);
+DECLARE_MSM_GPIO_PINS(146);
+DECLARE_MSM_GPIO_PINS(147);
+DECLARE_MSM_GPIO_PINS(148);
+DECLARE_MSM_GPIO_PINS(149);
+DECLARE_MSM_GPIO_PINS(150);
+DECLARE_MSM_GPIO_PINS(151);
+DECLARE_MSM_GPIO_PINS(152);
+DECLARE_MSM_GPIO_PINS(153);
+DECLARE_MSM_GPIO_PINS(154);
+DECLARE_MSM_GPIO_PINS(155);
+DECLARE_MSM_GPIO_PINS(156);
+DECLARE_MSM_GPIO_PINS(157);
+DECLARE_MSM_GPIO_PINS(158);
+DECLARE_MSM_GPIO_PINS(159);
+DECLARE_MSM_GPIO_PINS(160);
+DECLARE_MSM_GPIO_PINS(161);
+DECLARE_MSM_GPIO_PINS(162);
+DECLARE_MSM_GPIO_PINS(163);
+DECLARE_MSM_GPIO_PINS(164);
+DECLARE_MSM_GPIO_PINS(165);
+DECLARE_MSM_GPIO_PINS(166);
+DECLARE_MSM_GPIO_PINS(167);
+DECLARE_MSM_GPIO_PINS(168);
+DECLARE_MSM_GPIO_PINS(169);
+DECLARE_MSM_GPIO_PINS(170);
+DECLARE_MSM_GPIO_PINS(171);
+DECLARE_MSM_GPIO_PINS(172);
+DECLARE_MSM_GPIO_PINS(173);
+DECLARE_MSM_GPIO_PINS(174);
+DECLARE_MSM_GPIO_PINS(175);
+DECLARE_MSM_GPIO_PINS(176);
+DECLARE_MSM_GPIO_PINS(177);
+DECLARE_MSM_GPIO_PINS(178);
+DECLARE_MSM_GPIO_PINS(179);
+DECLARE_MSM_GPIO_PINS(180);
+DECLARE_MSM_GPIO_PINS(181);
+DECLARE_MSM_GPIO_PINS(182);
+DECLARE_MSM_GPIO_PINS(183);
+DECLARE_MSM_GPIO_PINS(184);
+DECLARE_MSM_GPIO_PINS(185);
+DECLARE_MSM_GPIO_PINS(186);
+DECLARE_MSM_GPIO_PINS(187);
+DECLARE_MSM_GPIO_PINS(188);
+DECLARE_MSM_GPIO_PINS(189);
+DECLARE_MSM_GPIO_PINS(190);
+DECLARE_MSM_GPIO_PINS(191);
+DECLARE_MSM_GPIO_PINS(192);
+DECLARE_MSM_GPIO_PINS(193);
+DECLARE_MSM_GPIO_PINS(194);
+DECLARE_MSM_GPIO_PINS(195);
+DECLARE_MSM_GPIO_PINS(196);
+DECLARE_MSM_GPIO_PINS(197);
+DECLARE_MSM_GPIO_PINS(198);
+DECLARE_MSM_GPIO_PINS(199);
+DECLARE_MSM_GPIO_PINS(200);
+DECLARE_MSM_GPIO_PINS(201);
+DECLARE_MSM_GPIO_PINS(202);
+DECLARE_MSM_GPIO_PINS(203);
+DECLARE_MSM_GPIO_PINS(204);
+DECLARE_MSM_GPIO_PINS(205);
+DECLARE_MSM_GPIO_PINS(206);
+DECLARE_MSM_GPIO_PINS(207);
+DECLARE_MSM_GPIO_PINS(208);
+DECLARE_MSM_GPIO_PINS(209);
+DECLARE_MSM_GPIO_PINS(210);
+DECLARE_MSM_GPIO_PINS(211);
+DECLARE_MSM_GPIO_PINS(212);
+DECLARE_MSM_GPIO_PINS(213);
+DECLARE_MSM_GPIO_PINS(214);
+
+static const unsigned int ufs_reset_pins[] = { 215 };
+static const unsigned int sdc2_clk_pins[] = { 216 };
+static const unsigned int sdc2_cmd_pins[] = { 217 };
+static const unsigned int sdc2_data_pins[] = { 218 };
+
+enum sm8750_functions {
+	msm_mux_gpio,
+	msm_mux_aoss_cti,
+	msm_mux_atest_char,
+	msm_mux_atest_usb,
+	msm_mux_audio_ext_mclk0,
+	msm_mux_audio_ext_mclk1,
+	msm_mux_audio_ref_clk,
+	msm_mux_cam_aon_mclk2,
+	msm_mux_cam_aon_mclk4,
+	msm_mux_cam_mclk,
+	msm_mux_cci_async_in,
+	msm_mux_cci_i2c_scl,
+	msm_mux_cci_i2c_sda,
+	msm_mux_cci_timer,
+	msm_mux_cmu_rng,
+	msm_mux_coex_uart1_rx,
+	msm_mux_coex_uart1_tx,
+	msm_mux_coex_uart2_rx,
+	msm_mux_coex_uart2_tx,
+	msm_mux_dbg_out_clk,
+	msm_mux_ddr_bist_complete,
+	msm_mux_ddr_bist_fail,
+	msm_mux_ddr_bist_start,
+	msm_mux_ddr_bist_stop,
+	msm_mux_ddr_pxi0,
+	msm_mux_ddr_pxi1,
+	msm_mux_ddr_pxi2,
+	msm_mux_ddr_pxi3,
+	msm_mux_dp_hot,
+	msm_mux_egpio,
+	msm_mux_gcc_gp1,
+	msm_mux_gcc_gp2,
+	msm_mux_gcc_gp3,
+	msm_mux_gnss_adc0,
+	msm_mux_gnss_adc1,
+	msm_mux_i2chub0_se0,
+	msm_mux_i2chub0_se1,
+	msm_mux_i2chub0_se2,
+	msm_mux_i2chub0_se3,
+	msm_mux_i2chub0_se4,
+	msm_mux_i2chub0_se5,
+	msm_mux_i2chub0_se6,
+	msm_mux_i2chub0_se7,
+	msm_mux_i2chub0_se8,
+	msm_mux_i2chub0_se9,
+	msm_mux_i2s0_data0,
+	msm_mux_i2s0_data1,
+	msm_mux_i2s0_sck,
+	msm_mux_i2s0_ws,
+	msm_mux_i2s1_data0,
+	msm_mux_i2s1_data1,
+	msm_mux_i2s1_sck,
+	msm_mux_i2s1_ws,
+	msm_mux_ibi_i3c,
+	msm_mux_jitter_bist,
+	msm_mux_mdp_esync0_out,
+	msm_mux_mdp_esync1_out,
+	msm_mux_mdp_vsync,
+	msm_mux_mdp_vsync0_out,
+	msm_mux_mdp_vsync1_out,
+	msm_mux_mdp_vsync2_out,
+	msm_mux_mdp_vsync3_out,
+	msm_mux_mdp_vsync5_out,
+	msm_mux_mdp_vsync_e,
+	msm_mux_nav_gpio0,
+	msm_mux_nav_gpio1,
+	msm_mux_nav_gpio2,
+	msm_mux_nav_gpio3,
+	msm_mux_pcie0_clk_req_n,
+	msm_mux_phase_flag,
+	msm_mux_pll_bist_sync,
+	msm_mux_pll_clk_aux,
+	msm_mux_prng_rosc0,
+	msm_mux_prng_rosc1,
+	msm_mux_prng_rosc2,
+	msm_mux_prng_rosc3,
+	msm_mux_qdss_cti,
+	msm_mux_qlink_big_enable,
+	msm_mux_qlink_big_request,
+	msm_mux_qlink_little_enable,
+	msm_mux_qlink_little_request,
+	msm_mux_qlink_wmss,
+	msm_mux_qspi0,
+	msm_mux_qspi1,
+	msm_mux_qspi2,
+	msm_mux_qspi3,
+	msm_mux_qspi_clk,
+	msm_mux_qspi_cs,
+	msm_mux_qup1_se0,
+	msm_mux_qup1_se1,
+	msm_mux_qup1_se2,
+	msm_mux_qup1_se3,
+	msm_mux_qup1_se4,
+	msm_mux_qup1_se5,
+	msm_mux_qup1_se6,
+	msm_mux_qup1_se7,
+	msm_mux_qup2_se0,
+	msm_mux_qup2_se1,
+	msm_mux_qup2_se2,
+	msm_mux_qup2_se3,
+	msm_mux_qup2_se4,
+	msm_mux_qup2_se5,
+	msm_mux_qup2_se6,
+	msm_mux_qup2_se7,
+	msm_mux_sd_write_protect,
+	msm_mux_sdc40,
+	msm_mux_sdc41,
+	msm_mux_sdc42,
+	msm_mux_sdc43,
+	msm_mux_sdc4_clk,
+	msm_mux_sdc4_cmd,
+	msm_mux_tb_trig_sdc2,
+	msm_mux_tb_trig_sdc4,
+	msm_mux_tmess_prng0,
+	msm_mux_tmess_prng1,
+	msm_mux_tmess_prng2,
+	msm_mux_tmess_prng3,
+	msm_mux_tsense_pwm1,
+	msm_mux_tsense_pwm2,
+	msm_mux_tsense_pwm3,
+	msm_mux_tsense_pwm4,
+	msm_mux_uim0_clk,
+	msm_mux_uim0_data,
+	msm_mux_uim0_present,
+	msm_mux_uim0_reset,
+	msm_mux_uim1_clk,
+	msm_mux_uim1_data,
+	msm_mux_uim1_present,
+	msm_mux_uim1_reset,
+	msm_mux_usb1_hs,
+	msm_mux_usb_phy,
+	msm_mux_vfr_0,
+	msm_mux_vfr_1,
+	msm_mux_vsense_trigger_mirnat,
+	msm_mux_wcn_sw,
+	msm_mux_wcn_sw_ctrl,
+	msm_mux__,
+};
+
+static const char *const gpio_groups[] = {
+	"gpio0",   "gpio1",   "gpio2",	 "gpio3",   "gpio4",   "gpio5",
+	"gpio6",   "gpio7",   "gpio8",	 "gpio9",   "gpio10",  "gpio11",
+	"gpio12",  "gpio13",  "gpio14",	 "gpio15",  "gpio16",  "gpio17",
+	"gpio18",  "gpio19",  "gpio20",	 "gpio21",  "gpio22",  "gpio23",
+	"gpio24",  "gpio25",  "gpio26",	 "gpio27",  "gpio28",  "gpio29",
+	"gpio30",  "gpio31",  "gpio32",	 "gpio33",  "gpio34",  "gpio35",
+	"gpio36",  "gpio37",  "gpio38",	 "gpio39",  "gpio40",  "gpio41",
+	"gpio42",  "gpio43",  "gpio44",	 "gpio45",  "gpio46",  "gpio47",
+	"gpio48", "gpio49", "gpio50", "gpio51", "gpio52", "gpio53",
+	"gpio54", "gpio55", "gpio56", "gpio57", "gpio58", "gpio59",
+	"gpio60", "gpio61", "gpio62", "gpio63", "gpio64", "gpio65",
+	"gpio66",  "gpio67",  "gpio68",	 "gpio69",  "gpio70",  "gpio71",
+	"gpio72",  "gpio73",  "gpio74",	 "gpio75",  "gpio76",  "gpio77",
+	"gpio78",  "gpio79",  "gpio80",	 "gpio81",  "gpio82",  "gpio83",
+	"gpio84",  "gpio85",  "gpio86",	 "gpio87",  "gpio88",  "gpio89",
+	"gpio90",  "gpio91",  "gpio92",	 "gpio93",  "gpio94",  "gpio95",
+	"gpio96",  "gpio97",  "gpio98",	 "gpio99",  "gpio100", "gpio101",
+	"gpio102", "gpio103", "gpio104", "gpio105", "gpio106", "gpio107",
+	"gpio108", "gpio109", "gpio110", "gpio111", "gpio112", "gpio113",
+	"gpio114", "gpio115", "gpio116", "gpio117", "gpio118", "gpio119",
+	"gpio120", "gpio121", "gpio122", "gpio123", "gpio124", "gpio125",
+	"gpio126", "gpio127", "gpio128", "gpio129", "gpio130", "gpio131",
+	"gpio132", "gpio133", "gpio134", "gpio135", "gpio136", "gpio137",
+	"gpio138", "gpio139", "gpio140", "gpio141", "gpio142", "gpio143",
+	"gpio144", "gpio145", "gpio146", "gpio147", "gpio148", "gpio149",
+	"gpio150", "gpio151", "gpio152", "gpio153", "gpio154", "gpio155",
+	"gpio156", "gpio157", "gpio158", "gpio159", "gpio160", "gpio161",
+	"gpio162", "gpio163", "gpio164", "gpio165", "gpio166", "gpio167",
+	"gpio168", "gpio169", "gpio170", "gpio171", "gpio172", "gpio173",
+	"gpio174", "gpio175", "gpio176", "gpio177", "gpio178", "gpio179",
+	"gpio180", "gpio181", "gpio182", "gpio183", "gpio184", "gpio185",
+	"gpio186", "gpio187", "gpio188", "gpio189", "gpio190", "gpio191",
+	"gpio192", "gpio193", "gpio194", "gpio195", "gpio196", "gpio197",
+	"gpio198", "gpio199", "gpio200", "gpio201", "gpio202", "gpio203",
+	"gpio204", "gpio205", "gpio206", "gpio207", "gpio208", "gpio209",
+	"gpio210", "gpio211", "gpio212", "gpio213", "gpio214",
+};
+
+static const char *const egpio_groups[] = {
+	"gpio0",   "gpio1",   "gpio2",	 "gpio3",   "gpio4",   "gpio5",
+	"gpio6",   "gpio7",   "gpio32",	 "gpio33",  "gpio34",  "gpio35",
+	"gpio36",  "gpio37",  "gpio105", "gpio106", "gpio107", "gpio108",
+	"gpio165", "gpio166", "gpio167", "gpio168", "gpio169", "gpio170",
+	"gpio171", "gpio172", "gpio173", "gpio174", "gpio175", "gpio176",
+	"gpio177", "gpio178", "gpio179", "gpio180", "gpio181", "gpio182",
+	"gpio183", "gpio184", "gpio185", "gpio186", "gpio187", "gpio188",
+	"gpio189", "gpio190", "gpio191", "gpio192", "gpio193", "gpio194",
+	"gpio195", "gpio196", "gpio197", "gpio198", "gpio199", "gpio200",
+	"gpio201", "gpio202", "gpio203", "gpio204", "gpio205", "gpio206",
+	"gpio207", "gpio208", "gpio209", "gpio210", "gpio211", "gpio212",
+	"gpio213", "gpio214",
+};
+
+static const char *const aoss_cti_groups[] = {
+	"gpio50", "gpio51", "gpio60", "gpio61",
+};
+
+static const char *const atest_char_groups[] = {
+	"gpio130", "gpio131", "gpio132", "gpio133", "gpio137",
+};
+
+static const char *const atest_usb_groups[] = {
+	"gpio70", "gpio71", "gpio72", "gpio73", "gpio76",
+};
+
+static const char *const audio_ext_mclk0_groups[] = {
+	"gpio125",
+};
+
+static const char *const audio_ext_mclk1_groups[] = {
+	"gpio124",
+};
+
+static const char *const audio_ref_clk_groups[] = {
+	"gpio124",
+};
+
+static const char *const cam_aon_mclk2_groups[] = {
+	"gpio91",
+};
+
+static const char *const cam_aon_mclk4_groups[] = {
+	"gpio93",
+};
+
+static const char *const cam_mclk_groups[] = {
+	"gpio89", "gpio90", "gpio92", "gpio94", "gpio95", "gpio96",
+};
+
+static const char *const cci_async_in_groups[] = {
+	"gpio10", "gpio11", "gpio15",
+};
+
+static const char *const cci_i2c_scl_groups[] = {
+	"gpio114", "gpio116", "gpio118", "gpio120", "gpio153", "gpio164",
+};
+
+static const char *const cci_i2c_sda_groups[] = {
+	"gpio111", "gpio112", "gpio113", "gpio115", "gpio117", "gpio119",
+};
+
+static const char *const cci_timer_groups[] = {
+	"gpio109", "gpio110", "gpio111", "gpio163", "gpio164",
+};
+
+static const char *const cmu_rng_groups[] = {
+	"gpio40", "gpio41", "gpio41", "gpio43", "gpio148", "gpio149",
+	"gpio150", "gpio151",
+};
+
+static const char *const coex_uart1_rx_groups[] = {
+	"gpio148",
+};
+
+static const char *const coex_uart1_tx_groups[] = {
+	"gpio149",
+};
+
+static const char *const coex_uart2_rx_groups[] = {
+	"gpio150",
+};
+
+static const char *const coex_uart2_tx_groups[] = {
+	"gpio151",
+};
+
+static const char *const dbg_out_clk_groups[] = {
+	"gpio78",
+};
+
+static const char *const ddr_bist_complete_groups[] = {
+	"gpio44",
+};
+
+static const char *const ddr_bist_fail_groups[] = {
+	"gpio40",
+};
+
+static const char *const ddr_bist_start_groups[] = {
+	"gpio41",
+};
+
+static const char *const ddr_bist_stop_groups[] = {
+	"gpio45",
+};
+
+static const char *const ddr_pxi0_groups[] = {
+	"gpio54", "gpio55",
+};
+
+static const char *const ddr_pxi1_groups[] = {
+	"gpio44", "gpio45",
+};
+
+static const char *const ddr_pxi2_groups[] = {
+	"gpio43", "gpio52",
+};
+
+static const char *const ddr_pxi3_groups[] = {
+	"gpio46", "gpio53",
+};
+
+static const char *const dp_hot_groups[] = {
+	"gpio47",
+};
+
+static const char *const gcc_gp1_groups[] = {
+	"gpio86", "gpio134",
+};
+
+static const char *const gcc_gp2_groups[] = {
+	"gpio87", "gpio135",
+};
+
+static const char *const gcc_gp3_groups[] = {
+	"gpio88", "gpio136",
+};
+
+static const char *const gnss_adc0_groups[] = {
+	"gpio78", "gpio79",
+};
+
+static const char *const gnss_adc1_groups[] = {
+	"gpio77", "gpio99",
+};
+
+static const char *const i2chub0_se0_groups[] = {
+	"gpio64", "gpio65",
+};
+
+static const char *const i2chub0_se1_groups[] = {
+	"gpio66", "gpio67",
+};
+
+static const char *const i2chub0_se2_groups[] = {
+	"gpio68", "gpio69",
+};
+
+static const char *const i2chub0_se3_groups[] = {
+	"gpio70", "gpio71",
+};
+
+static const char *const i2chub0_se4_groups[] = {
+	"gpio72", "gpio73",
+};
+
+static const char *const i2chub0_se5_groups[] = {
+	"gpio74", "gpio75",
+};
+
+static const char *const i2chub0_se6_groups[] = {
+	"gpio76", "gpio77",
+};
+
+static const char *const i2chub0_se7_groups[] = {
+	"gpio82", "gpio83",
+};
+
+static const char *const i2chub0_se8_groups[] = {
+	"gpio206", "gpio207",
+};
+
+static const char *const i2chub0_se9_groups[] = {
+	"gpio80", "gpio81",
+};
+
+static const char *const i2s0_data0_groups[] = {
+	"gpio127",
+};
+
+static const char *const i2s0_data1_groups[] = {
+	"gpio128",
+};
+
+static const char *const i2s0_sck_groups[] = {
+	"gpio126",
+};
+
+static const char *const i2s0_ws_groups[] = {
+	"gpio129",
+};
+
+static const char *const i2s1_data0_groups[] = {
+	"gpio122",
+};
+
+static const char *const i2s1_data1_groups[] = {
+	"gpio124",
+};
+
+static const char *const i2s1_sck_groups[] = {
+	"gpio121",
+};
+
+static const char *const i2s1_ws_groups[] = {
+	"gpio123",
+};
+
+static const char *const ibi_i3c_groups[] = {
+	"gpio0",  "gpio1",  "gpio4",  "gpio5",	"gpio8",  "gpio9",
+	"gpio12", "gpio13", "gpio28", "gpio29", "gpio32", "gpio33",
+	"gpio36", "gpio37", "gpio48", "gpio49",
+};
+
+static const char *const jitter_bist_groups[] = {
+	"gpio73",
+};
+
+static const char *const mdp_esync0_out_groups[] = {
+	"gpio88",
+};
+
+static const char *const mdp_esync1_out_groups[] = {
+	"gpio100",
+};
+
+static const char *const mdp_vsync_groups[] = {
+	"gpio86", "gpio87", "gpio97", "gpio98",
+};
+
+static const char *const mdp_vsync0_out_groups[] = {
+	"gpio86",
+};
+
+static const char *const mdp_vsync1_out_groups[] = {
+	"gpio86",
+};
+
+static const char *const mdp_vsync2_out_groups[] = {
+	"gpio87",
+};
+
+static const char *const mdp_vsync3_out_groups[] = {
+	"gpio87",
+};
+
+static const char *const mdp_vsync5_out_groups[] = {
+	"gpio87",
+};
+
+static const char *const mdp_vsync_e_groups[] = {
+	"gpio88",
+};
+
+static const char *const nav_gpio0_groups[] = {
+	"gpio154",
+};
+
+static const char *const nav_gpio1_groups[] = {
+	"gpio155",
+};
+
+static const char *const nav_gpio2_groups[] = {
+	"gpio152",
+};
+
+static const char *const nav_gpio3_groups[] = {
+	"gpio154",
+};
+
+static const char *const pcie0_clk_req_n_groups[] = {
+	"gpio103",
+};
+
+static const char *const phase_flag_groups[] = {
+	"gpio10", "gpio11", "gpio14", "gpio15", "gpio16", "gpio17", "gpio18",
+	"gpio19", "gpio20", "gpio21", "gpio22", "gpio23", "gpio24", "gpio25",
+	"gpio26", "gpio27", "gpio28", "gpio29", "gpio31", "gpio64", "gpio65",
+	"gpio66", "gpio67", "gpio68", "gpio69", "gpio82", "gpio83", "gpio85",
+	"gpio101", "gpio102", "gpio103", "gpio104",
+};
+
+static const char *const pll_bist_sync_groups[] = {
+	"gpio104",
+};
+
+static const char *const pll_clk_aux_groups[] = {
+	"gpio95",
+};
+
+static const char *const prng_rosc0_groups[] = {
+	"gpio85",
+};
+
+static const char *const prng_rosc1_groups[] = {
+	"gpio64",
+};
+
+static const char *const prng_rosc2_groups[] = {
+	"gpio65",
+};
+
+static const char *const prng_rosc3_groups[] = {
+	"gpio66",
+};
+
+static const char *const qdss_cti_groups[] = {
+	"gpio27", "gpio31", "gpio72",  "gpio73", "gpio82", "gpio83", "gpio159",
+	"gpio162",
+};
+
+static const char *const qlink_big_enable_groups[] = {
+	"gpio160",
+};
+
+static const char *const qlink_big_request_groups[] = {
+	"gpio159",
+};
+
+static const char *const qlink_little_enable_groups[] = {
+	"gpio157",
+};
+
+static const char *const qlink_little_request_groups[] = {
+	"gpio156",
+};
+
+static const char *const qlink_wmss_groups[] = {
+	"gpio158",
+};
+
+static const char *const qspi0_groups[] = {
+	"gpio52",
+};
+
+static const char *const qspi1_groups[] = {
+	"gpio53",
+};
+
+static const char *const qspi2_groups[] = {
+	"gpio55",
+};
+
+static const char *const qspi3_groups[] = {
+	"gpio56",
+};
+
+static const char *const qspi_clk_groups[] = {
+	"gpio54",
+};
+
+static const char *const qspi_cs_groups[] = {
+	"gpio57", "gpio58",
+};
+
+static const char *const qup1_se0_groups[] = {
+	"gpio32", "gpio33", "gpio34", "gpio35",
+};
+
+static const char *const qup1_se1_groups[] = {
+	"gpio36", "gpio37", "gpio38", "gpio39",
+};
+
+static const char *const qup1_se2_groups[] = {
+	"gpio40", "gpio41", "gpio42", "gpio43", "gpio134", "gpio135", "gpio136",
+};
+
+static const char *const qup1_se3_groups[] = {
+	"gpio44", "gpio45", "gpio46", "gpio47",
+};
+
+static const char *const qup1_se4_groups[] = {
+	"gpio48", "gpio49", "gpio50", "gpio51",
+};
+
+static const char *const qup1_se5_groups[] = {
+	"gpio52", "gpio53", "gpio54", "gpio55",
+};
+
+static const char *const qup1_se6_groups[] = {
+	"gpio56", "gpio57", "gpio58", "gpio59",
+};
+
+static const char *const qup1_se7_groups[] = {
+	"gpio60", "gpio61", "gpio62", "gpio63",
+};
+
+static const char *const qup2_se0_groups[] = {
+	"gpio0", "gpio1", "gpio2", "gpio3",
+};
+
+static const char *const qup2_se1_groups[] = {
+	"gpio4", "gpio5", "gpio6", "gpio7",
+};
+
+static const char *const qup2_se2_groups[] = {
+	"gpio8", "gpio9", "gpio10", "gpio11", "gpio12", "gpio13", "gpio15",
+};
+
+static const char *const qup2_se3_groups[] = {
+	"gpio12", "gpio13", "gpio14", "gpio15",
+};
+
+static const char *const qup2_se4_groups[] = {
+	"gpio16", "gpio17", "gpio18", "gpio19",
+};
+
+static const char *const qup2_se5_groups[] = {
+	"gpio20", "gpio21", "gpio22", "gpio23",
+};
+
+static const char *const qup2_se6_groups[] = {
+	"gpio24", "gpio25", "gpio26", "gpio27",
+};
+
+static const char *const qup2_se7_groups[] = {
+	"gpio28", "gpio29", "gpio30", "gpio31",
+};
+
+static const char *const sd_write_protect_groups[] = {
+	"gpio85",
+};
+
+static const char *const sdc40_groups[] = {
+	"gpio36", "gpio49",
+};
+
+static const char *const sdc41_groups[] = {
+	"gpio37", "gpio51",
+};
+
+static const char *const sdc42_groups[] = {
+	"gpio38", "gpio60",
+};
+
+static const char *const sdc43_groups[] = {
+	"gpio39", "gpio61",
+};
+
+static const char *const sdc4_clk_groups[] = {
+	"gpio50", "gpio150",
+};
+
+static const char *const sdc4_cmd_groups[] = {
+	"gpio48", "gpio151",
+};
+
+static const char *const tb_trig_sdc2_groups[] = {
+	"gpio89",
+};
+
+static const char *const tb_trig_sdc4_groups[] = {
+	"gpio147",
+};
+
+static const char *const tmess_prng0_groups[] = {
+	"gpio85",
+};
+
+static const char *const tmess_prng1_groups[] = {
+	"gpio64",
+};
+
+static const char *const tmess_prng2_groups[] = {
+	"gpio65",
+};
+
+static const char *const tmess_prng3_groups[] = {
+	"gpio66",
+};
+
+static const char *const tsense_pwm1_groups[] = {
+	"gpio57",
+};
+
+static const char *const tsense_pwm2_groups[] = {
+	"gpio57",
+};
+
+static const char *const tsense_pwm3_groups[] = {
+	"gpio57",
+};
+
+static const char *const tsense_pwm4_groups[] = {
+	"gpio57",
+};
+
+static const char *const uim0_clk_groups[] = {
+	"gpio131",
+};
+
+static const char *const uim0_data_groups[] = {
+	"gpio130",
+};
+
+static const char *const uim0_present_groups[] = {
+	"gpio133",
+};
+
+static const char *const uim0_reset_groups[] = {
+	"gpio132",
+};
+
+static const char *const uim1_clk_groups[] = {
+	"gpio37", "gpio55", "gpio71", "gpio135",
+};
+
+static const char *const uim1_data_groups[] = {
+	"gpio134", "gpio36", "gpio54", "gpio70",
+};
+
+static const char *const uim1_present_groups[] = {
+	"gpio137",
+};
+
+static const char *const uim1_reset_groups[] = {
+	"gpio39", "gpio56", "gpio72", "gpio136",
+};
+
+static const char *const usb1_hs_groups[] = {
+	"gpio79",
+};
+
+static const char *const usb_phy_groups[] = {
+	"gpio59", "gpio61",
+};
+
+static const char *const vfr_0_groups[] = {
+	"gpio150",
+};
+
+static const char *const vfr_1_groups[] = {
+	"gpio155",
+};
+
+static const char *const vsense_trigger_mirnat_groups[] = {
+	"gpio59",
+};
+
+static const char *const wcn_sw_groups[] = {
+	"gpio19",
+};
+
+static const char *const wcn_sw_ctrl_groups[] = {
+	"gpio18",
+};
+
+static const struct pinfunction sm8750_functions[] = {
+	MSM_PIN_FUNCTION(gpio),
+	MSM_PIN_FUNCTION(aoss_cti),
+	MSM_PIN_FUNCTION(atest_char),
+	MSM_PIN_FUNCTION(atest_usb),
+	MSM_PIN_FUNCTION(audio_ext_mclk0),
+	MSM_PIN_FUNCTION(audio_ext_mclk1),
+	MSM_PIN_FUNCTION(audio_ref_clk),
+	MSM_PIN_FUNCTION(cam_aon_mclk2),
+	MSM_PIN_FUNCTION(cam_aon_mclk4),
+	MSM_PIN_FUNCTION(cam_mclk),
+	MSM_PIN_FUNCTION(cci_async_in),
+	MSM_PIN_FUNCTION(cci_i2c_scl),
+	MSM_PIN_FUNCTION(cci_i2c_sda),
+	MSM_PIN_FUNCTION(cci_timer),
+	MSM_PIN_FUNCTION(cmu_rng),
+	MSM_PIN_FUNCTION(coex_uart1_rx),
+	MSM_PIN_FUNCTION(coex_uart1_tx),
+	MSM_PIN_FUNCTION(coex_uart2_rx),
+	MSM_PIN_FUNCTION(coex_uart2_tx),
+	MSM_PIN_FUNCTION(dbg_out_clk),
+	MSM_PIN_FUNCTION(ddr_bist_complete),
+	MSM_PIN_FUNCTION(ddr_bist_fail),
+	MSM_PIN_FUNCTION(ddr_bist_start),
+	MSM_PIN_FUNCTION(ddr_bist_stop),
+	MSM_PIN_FUNCTION(ddr_pxi0),
+	MSM_PIN_FUNCTION(ddr_pxi1),
+	MSM_PIN_FUNCTION(ddr_pxi2),
+	MSM_PIN_FUNCTION(ddr_pxi3),
+	MSM_PIN_FUNCTION(dp_hot),
+	MSM_PIN_FUNCTION(egpio),
+	MSM_PIN_FUNCTION(gcc_gp1),
+	MSM_PIN_FUNCTION(gcc_gp2),
+	MSM_PIN_FUNCTION(gcc_gp3),
+	MSM_PIN_FUNCTION(gnss_adc0),
+	MSM_PIN_FUNCTION(gnss_adc1),
+	MSM_PIN_FUNCTION(i2chub0_se0),
+	MSM_PIN_FUNCTION(i2chub0_se1),
+	MSM_PIN_FUNCTION(i2chub0_se2),
+	MSM_PIN_FUNCTION(i2chub0_se3),
+	MSM_PIN_FUNCTION(i2chub0_se4),
+	MSM_PIN_FUNCTION(i2chub0_se5),
+	MSM_PIN_FUNCTION(i2chub0_se6),
+	MSM_PIN_FUNCTION(i2chub0_se7),
+	MSM_PIN_FUNCTION(i2chub0_se8),
+	MSM_PIN_FUNCTION(i2chub0_se9),
+	MSM_PIN_FUNCTION(i2s0_data0),
+	MSM_PIN_FUNCTION(i2s0_data1),
+	MSM_PIN_FUNCTION(i2s0_sck),
+	MSM_PIN_FUNCTION(i2s0_ws),
+	MSM_PIN_FUNCTION(i2s1_data0),
+	MSM_PIN_FUNCTION(i2s1_data1),
+	MSM_PIN_FUNCTION(i2s1_sck),
+	MSM_PIN_FUNCTION(i2s1_ws),
+	MSM_PIN_FUNCTION(ibi_i3c),
+	MSM_PIN_FUNCTION(jitter_bist),
+	MSM_PIN_FUNCTION(mdp_esync0_out),
+	MSM_PIN_FUNCTION(mdp_esync1_out),
+	MSM_PIN_FUNCTION(mdp_vsync),
+	MSM_PIN_FUNCTION(mdp_vsync0_out),
+	MSM_PIN_FUNCTION(mdp_vsync1_out),
+	MSM_PIN_FUNCTION(mdp_vsync2_out),
+	MSM_PIN_FUNCTION(mdp_vsync3_out),
+	MSM_PIN_FUNCTION(mdp_vsync5_out),
+	MSM_PIN_FUNCTION(mdp_vsync_e),
+	MSM_PIN_FUNCTION(nav_gpio0),
+	MSM_PIN_FUNCTION(nav_gpio1),
+	MSM_PIN_FUNCTION(nav_gpio2),
+	MSM_PIN_FUNCTION(nav_gpio3),
+	MSM_PIN_FUNCTION(pcie0_clk_req_n),
+	MSM_PIN_FUNCTION(phase_flag),
+	MSM_PIN_FUNCTION(pll_bist_sync),
+	MSM_PIN_FUNCTION(pll_clk_aux),
+	MSM_PIN_FUNCTION(prng_rosc0),
+	MSM_PIN_FUNCTION(prng_rosc1),
+	MSM_PIN_FUNCTION(prng_rosc2),
+	MSM_PIN_FUNCTION(prng_rosc3),
+	MSM_PIN_FUNCTION(qdss_cti),
+	MSM_PIN_FUNCTION(qlink_big_enable),
+	MSM_PIN_FUNCTION(qlink_big_request),
+	MSM_PIN_FUNCTION(qlink_little_enable),
+	MSM_PIN_FUNCTION(qlink_little_request),
+	MSM_PIN_FUNCTION(qlink_wmss),
+	MSM_PIN_FUNCTION(qspi0),
+	MSM_PIN_FUNCTION(qspi1),
+	MSM_PIN_FUNCTION(qspi2),
+	MSM_PIN_FUNCTION(qspi3),
+	MSM_PIN_FUNCTION(qspi_clk),
+	MSM_PIN_FUNCTION(qspi_cs),
+	MSM_PIN_FUNCTION(qup1_se0),
+	MSM_PIN_FUNCTION(qup1_se1),
+	MSM_PIN_FUNCTION(qup1_se2),
+	MSM_PIN_FUNCTION(qup1_se3),
+	MSM_PIN_FUNCTION(qup1_se4),
+	MSM_PIN_FUNCTION(qup1_se5),
+	MSM_PIN_FUNCTION(qup1_se6),
+	MSM_PIN_FUNCTION(qup1_se7),
+	MSM_PIN_FUNCTION(qup2_se0),
+	MSM_PIN_FUNCTION(qup2_se1),
+	MSM_PIN_FUNCTION(qup2_se2),
+	MSM_PIN_FUNCTION(qup2_se3),
+	MSM_PIN_FUNCTION(qup2_se4),
+	MSM_PIN_FUNCTION(qup2_se5),
+	MSM_PIN_FUNCTION(qup2_se6),
+	MSM_PIN_FUNCTION(qup2_se7),
+	MSM_PIN_FUNCTION(sd_write_protect),
+	MSM_PIN_FUNCTION(sdc40),
+	MSM_PIN_FUNCTION(sdc41),
+	MSM_PIN_FUNCTION(sdc42),
+	MSM_PIN_FUNCTION(sdc43),
+	MSM_PIN_FUNCTION(sdc4_clk),
+	MSM_PIN_FUNCTION(sdc4_cmd),
+	MSM_PIN_FUNCTION(tb_trig_sdc2),
+	MSM_PIN_FUNCTION(tb_trig_sdc4),
+	MSM_PIN_FUNCTION(tmess_prng0),
+	MSM_PIN_FUNCTION(tmess_prng1),
+	MSM_PIN_FUNCTION(tmess_prng2),
+	MSM_PIN_FUNCTION(tmess_prng3),
+	MSM_PIN_FUNCTION(tsense_pwm1),
+	MSM_PIN_FUNCTION(tsense_pwm2),
+	MSM_PIN_FUNCTION(tsense_pwm3),
+	MSM_PIN_FUNCTION(tsense_pwm4),
+	MSM_PIN_FUNCTION(uim0_clk),
+	MSM_PIN_FUNCTION(uim0_data),
+	MSM_PIN_FUNCTION(uim0_present),
+	MSM_PIN_FUNCTION(uim0_reset),
+	MSM_PIN_FUNCTION(uim1_clk),
+	MSM_PIN_FUNCTION(uim1_data),
+	MSM_PIN_FUNCTION(uim1_present),
+	MSM_PIN_FUNCTION(uim1_reset),
+	MSM_PIN_FUNCTION(usb1_hs),
+	MSM_PIN_FUNCTION(usb_phy),
+	MSM_PIN_FUNCTION(vfr_0),
+	MSM_PIN_FUNCTION(vfr_1),
+	MSM_PIN_FUNCTION(vsense_trigger_mirnat),
+	MSM_PIN_FUNCTION(wcn_sw),
+	MSM_PIN_FUNCTION(wcn_sw_ctrl),
+};
+
+/*
+ * Every pin is maintained as a single group, and missing or non-existing pin
+ * would be maintained as dummy group to synchronize pin group index with
+ * pin descriptor registered with pinctrl core.
+ * Clients would not be able to request these dummy pin groups.
+ */
+static const struct msm_pingroup sm8750_groups[] = {
+	[0] = PINGROUP(0, qup2_se0, ibi_i3c, _, _, _, _, _, _, _, _, egpio),
+	[1] = PINGROUP(1, qup2_se0, ibi_i3c, _, _, _, _, _, _, _, _, egpio),
+	[2] = PINGROUP(2, qup2_se0, _, _, _, _, _, _, _, _, _, egpio),
+	[3] = PINGROUP(3, qup2_se0, _, _, _, _, _, _, _, _, _, egpio),
+	[4] = PINGROUP(4, qup2_se1, ibi_i3c, _, _, _, _, _, _, _, _, egpio),
+	[5] = PINGROUP(5, qup2_se1, ibi_i3c, _, _, _, _, _, _, _, _, egpio),
+	[6] = PINGROUP(6, qup2_se1, _, _, _, _, _, _, _, _, _, egpio),
+	[7] = PINGROUP(7, qup2_se1, _, _, _, _, _, _, _, _, _, egpio),
+	[8] = PINGROUP(8, qup2_se2, ibi_i3c, _, _, _, _, _, _, _, _, _),
+	[9] = PINGROUP(9, qup2_se2, ibi_i3c, _, _, _, _, _, _, _, _, _),
+	[10] = PINGROUP(10, qup2_se2, cci_async_in, phase_flag, _, _, _, _, _, _, _, _),
+	[11] = PINGROUP(11, qup2_se2, cci_async_in, phase_flag, _, _, _, _, _, _, _, _),
+	[12] = PINGROUP(12, qup2_se3, ibi_i3c, qup2_se2, _, _, _, _, _, _, _, _),
+	[13] = PINGROUP(13, qup2_se3, ibi_i3c, qup2_se2, _, _, _, _, _, _, _, _),
+	[14] = PINGROUP(14, qup2_se3, phase_flag, _, _, _, _, _, _, _, _, _),
+	[15] = PINGROUP(15, qup2_se3, cci_async_in, qup2_se2, phase_flag, _, _, _, _, _, _, _),
+	[16] = PINGROUP(16, qup2_se4, phase_flag, _, _, _, _, _, _, _, _, _),
+	[17] = PINGROUP(17, qup2_se4, phase_flag, _, _, _, _, _, _, _, _, _),
+	[18] = PINGROUP(18, wcn_sw_ctrl, qup2_se4, phase_flag, _, _, _, _, _, _, _, _),
+	[19] = PINGROUP(19, wcn_sw, qup2_se4, phase_flag, _, _, _, _, _, _, _, _),
+	[20] = PINGROUP(20, qup2_se5, phase_flag, _, _, _, _, _, _, _, _, _),
+	[21] = PINGROUP(21, qup2_se5, phase_flag, _, _, _, _, _, _, _, _, _),
+	[22] = PINGROUP(22, qup2_se5, phase_flag, _, _, _, _, _, _, _, _, _),
+	[23] = PINGROUP(23, qup2_se5, qup2_se5, phase_flag, _, _, _, _, _, _, _, _),
+	[24] = PINGROUP(24, qup2_se6, phase_flag, _, _, _, _, _, _, _, _, _),
+	[25] = PINGROUP(25, qup2_se6, phase_flag, _, _, _, _, _, _, _, _, _),
+	[26] = PINGROUP(26, qup2_se6, phase_flag, _, _, _, _, _, _, _, _, _),
+	[27] = PINGROUP(27, qup2_se6, qdss_cti, phase_flag, _, _, _, _, _, _, _, _),
+	[28] = PINGROUP(28, qup2_se7, ibi_i3c, phase_flag, _, _, _, _, _, _, _, _),
+	[29] = PINGROUP(29, qup2_se7, ibi_i3c, phase_flag, _, _, _, _, _, _, _, _),
+	[30] = PINGROUP(30, qup2_se7, _, _, _, _, _, _, _, _, _, _),
+	[31] = PINGROUP(31, qup2_se7, qdss_cti, phase_flag, _, _, _, _, _, _, _, _),
+	[32] = PINGROUP(32, qup1_se0, ibi_i3c, _, _, _, _, _, _, _, _, egpio),
+	[33] = PINGROUP(33, qup1_se0, ibi_i3c, _, _, _, _, _, _, _, _, egpio),
+	[34] = PINGROUP(34, qup1_se0, _, _, _, _, _, _, _, _, _, egpio),
+	[35] = PINGROUP(35, qup1_se0, _, _, _, _, _, _, _, _, _, egpio),
+	[36] = PINGROUP(36, qup1_se1, uim1_data, ibi_i3c, sdc40, _, _, _, _, _, _, egpio),
+	[37] = PINGROUP(37, qup1_se1, uim1_clk, ibi_i3c, sdc41, _, _, _, _, _, _, egpio),
+	[38] = PINGROUP(38, qup1_se1, sdc42, _, _, _, _, _, _, _, _, _),
+	[39] = PINGROUP(39, qup1_se1, uim1_reset, sdc43, _, _, _, _, _, _, _, _),
+	[40] = PINGROUP(40, qup1_se2, cmu_rng, ddr_bist_fail, _, _, _, _, _, _, _, _),
+	[41] = PINGROUP(41, qup1_se2, cmu_rng, ddr_bist_start, _, _, _, _, _, _, _, _),
+	[42] = PINGROUP(42, qup1_se2, cmu_rng, _, _, _, _, _, _, _, _, _),
+	[43] = PINGROUP(43, qup1_se2, cmu_rng, _, ddr_pxi2, _, _, _, _, _, _, _),
+	[44] = PINGROUP(44, qup1_se3, ddr_bist_complete, ddr_pxi1, _, _, _, _, _, _, _, _),
+	[45] = PINGROUP(45, qup1_se3, ddr_bist_stop, ddr_pxi1, _, _, _, _, _, _, _, _),
+	[46] = PINGROUP(46, qup1_se3, ddr_pxi3, _, _, _, _, _, _, _, _, _),
+	[47] = PINGROUP(47, qup1_se3, dp_hot, _, _, _, _, _, _, _, _, _),
+	[48] = PINGROUP(48, qup1_se4, ibi_i3c, sdc4_cmd, _, _, _, _, _, _, _, _),
+	[49] = PINGROUP(49, qup1_se4, ibi_i3c, sdc40, _, _, _, _, _, _, _, _),
+	[50] = PINGROUP(50, qup1_se4, aoss_cti, sdc4_clk, _, _, _, _, _, _, _, _),
+	[51] = PINGROUP(51, qup1_se4, aoss_cti, sdc41, _, _, _, _, _, _, _, _),
+	[52] = PINGROUP(52, qup1_se5, qspi0, ddr_pxi2, _, _, _, _, _, _, _, _),
+	[53] = PINGROUP(53, qup1_se5, qspi1, _, ddr_pxi3, _, _, _, _, _, _, _),
+	[54] = PINGROUP(54, qup1_se5, qspi_clk, uim1_data, ddr_pxi0, _, _, _, _, _, _, _),
+	[55] = PINGROUP(55, qup1_se5, qspi2, uim1_clk, ddr_pxi0, _, _, _, _, _, _, _),
+	[56] = PINGROUP(56, qup1_se6, qspi3, uim1_reset, _, _, _, _, _, _, _, _),
+	[57] = PINGROUP(57, qup1_se6, qspi_cs, tsense_pwm1, tsense_pwm2, tsense_pwm3, tsense_pwm4,
+			_, _, _, _, _),
+	[58] = PINGROUP(58, qup1_se6, qspi_cs, _, _, _, _, _, _, _, _, _),
+	[59] = PINGROUP(59, qup1_se6, usb_phy, vsense_trigger_mirnat, _, _, _, _, _, _, _, _),
+	[60] = PINGROUP(60, qup1_se7, aoss_cti, sdc42, _, _, _, _, _, _, _, _),
+	[61] = PINGROUP(61, qup1_se7, usb_phy, aoss_cti, sdc43, _, _, _, _, _, _, _),
+	[62] = PINGROUP(62, qup1_se7, _, _, _, _, _, _, _, _, _, _),
+	[63] = PINGROUP(63, qup1_se7, _, _, _, _, _, _, _, _, _, _),
+	[64] = PINGROUP(64, i2chub0_se0, prng_rosc1, tmess_prng1, phase_flag, _, _, _, _, _, _, _),
+	[65] = PINGROUP(65, i2chub0_se0, prng_rosc2, tmess_prng2, phase_flag, _, _, _, _, _, _, _),
+	[66] = PINGROUP(66, i2chub0_se1, prng_rosc3, tmess_prng3, phase_flag, _, _, _, _, _, _, _),
+	[67] = PINGROUP(67, i2chub0_se1, phase_flag, _, _, _, _, _, _, _, _, _),
+	[68] = PINGROUP(68, i2chub0_se2, phase_flag, _, _, _, _, _, _, _, _, _),
+	[69] = PINGROUP(69, i2chub0_se2, phase_flag, _, _, _, _, _, _, _, _, _),
+	[70] = PINGROUP(70, i2chub0_se3, uim1_data, _, atest_usb, _, _, _, _, _, _, _),
+	[71] = PINGROUP(71, i2chub0_se3, uim1_clk, _, atest_usb, _, _, _, _, _, _, _),
+	[72] = PINGROUP(72, i2chub0_se4, uim1_reset, qdss_cti, _, atest_usb, _, _, _, _, _, _),
+	[73] = PINGROUP(73, i2chub0_se4, qdss_cti, jitter_bist, atest_usb, _, _, _, _, _, _, _),
+	[74] = PINGROUP(74, i2chub0_se5, _, _, _, _, _, _, _, _, _, _),
+	[75] = PINGROUP(75, i2chub0_se5, _, _, _, _, _, _, _, _, _, _),
+	[76] = PINGROUP(76, i2chub0_se6, atest_usb, _, _, _, _, _, _, _, _, _),
+	[77] = PINGROUP(77, i2chub0_se6, gnss_adc1, _, _, _, _, _, _, _, _, _),
+	[78] = PINGROUP(78, dbg_out_clk, gnss_adc0, _, _, _, _, _, _, _, _, _),
+	[79] = PINGROUP(79, usb1_hs, gnss_adc0, _, _, _, _, _, _, _, _, _),
+	[80] = PINGROUP(80, i2chub0_se9, _, _, _, _, _, _, _, _, _, _),
+	[81] = PINGROUP(81, i2chub0_se9, _, _, _, _, _, _, _, _, _, _),
+	[82] = PINGROUP(82, i2chub0_se7, qdss_cti, phase_flag, _, _, _, _, _, _, _, _),
+	[83] = PINGROUP(83, i2chub0_se7, qdss_cti, phase_flag, _, _, _, _, _, _, _, _),
+	[84] = PINGROUP(84, _, _, _, _, _, _, _, _, _, _, _),
+	[85] = PINGROUP(85, sd_write_protect, prng_rosc0, tmess_prng0, phase_flag, _, _, _, _, _,
+			_, _),
+	[86] = PINGROUP(86, mdp_vsync, mdp_vsync0_out, mdp_vsync1_out, gcc_gp1, _, _, _, _, _, _,
+			_),
+	[87] = PINGROUP(87, mdp_vsync, mdp_vsync2_out, mdp_vsync3_out, mdp_vsync5_out, gcc_gp2, _,
+			_, _, _, _, _),
+	[88] = PINGROUP(88, mdp_vsync_e, mdp_esync0_out, gcc_gp3, _, _, _, _, _, _, _, _),
+	[89] = PINGROUP(89, cam_mclk, tb_trig_sdc2, _, _, _, _, _, _, _, _, _),
+	[90] = PINGROUP(90, cam_mclk, _, _, _, _, _, _, _, _, _, _),
+	[91] = PINGROUP(91, cam_aon_mclk2, _, _, _, _, _, _, _, _, _, _),
+	[92] = PINGROUP(92, cam_mclk, _, _, _, _, _, _, _, _, _, _),
+	[93] = PINGROUP(93, cam_aon_mclk4, _, _, _, _, _, _, _, _, _, _),
+	[94] = PINGROUP(94, cam_mclk, _, _, _, _, _, _, _, _, _, _),
+	[95] = PINGROUP(95, cam_mclk, pll_clk_aux, _, _, _, _, _, _, _, _, _),
+	[96] = PINGROUP(96, cam_mclk, _, _, _, _, _, _, _, _, _, _),
+	[97] = PINGROUP(97, mdp_vsync, _, _, _, _, _, _, _, _, _, _),
+	[98] = PINGROUP(98, mdp_vsync, _, _, _, _, _, _, _, _, _, _),
+	[99] = PINGROUP(99, gnss_adc1, _, _, _, _, _, _, _, _, _, _),
+	[100] = PINGROUP(100, mdp_esync1_out, _, _, _, _, _, _, _, _, _, _),
+	[101] = PINGROUP(101, phase_flag, _, _, _, _, _, _, _, _, _, _),
+	[102] = PINGROUP(102, phase_flag, _, _, _, _, _, _, _, _, _, _),
+	[103] = PINGROUP(103, pcie0_clk_req_n, phase_flag, _, _, _, _, _, _, _, _, _),
+	[104] = PINGROUP(104, pll_bist_sync, phase_flag, _, _, _, _, _, _, _, _, _),
+	[105] = PINGROUP(105, _, _, _, _, _, _, _, _, _, _, egpio),
+	[106] = PINGROUP(106, _, _, _, _, _, _, _, _, _, _, egpio),
+	[107] = PINGROUP(107, _, _, _, _, _, _, _, _, _, _, egpio),
+	[108] = PINGROUP(108, _, _, _, _, _, _, _, _, _, _, egpio),
+	[109] = PINGROUP(109, cci_timer, _, _, _, _, _, _, _, _, _, _),
+	[110] = PINGROUP(110, cci_timer, _, _, _, _, _, _, _, _, _, _),
+	[111] = PINGROUP(111, cci_timer, cci_i2c_sda, _, _, _, _, _, _, _, _, _),
+	[112] = PINGROUP(112, cci_i2c_sda, _, _, _, _, _, _, _, _, _, _),
+	[113] = PINGROUP(113, cci_i2c_sda, _, _, _, _, _, _, _, _, _, _),
+	[114] = PINGROUP(114, cci_i2c_scl, _, _, _, _, _, _, _, _, _, _),
+	[115] = PINGROUP(115, cci_i2c_sda, _, _, _, _, _, _, _, _, _, _),
+	[116] = PINGROUP(116, cci_i2c_scl, _, _, _, _, _, _, _, _, _, _),
+	[117] = PINGROUP(117, cci_i2c_sda, _, _, _, _, _, _, _, _, _, _),
+	[118] = PINGROUP(118, cci_i2c_scl, _, _, _, _, _, _, _, _, _, _),
+	[119] = PINGROUP(119, cci_i2c_sda, _, _, _, _, _, _, _, _, _, _),
+	[120] = PINGROUP(120, cci_i2c_scl, _, _, _, _, _, _, _, _, _, _),
+	[121] = PINGROUP(121, i2s1_sck, _, _, _, _, _, _, _, _, _, _),
+	[122] = PINGROUP(122, i2s1_data0, _, _, _, _, _, _, _, _, _, _),
+	[123] = PINGROUP(123, i2s1_ws, _, _, _, _, _, _, _, _, _, _),
+	[124] = PINGROUP(124, i2s1_data1, audio_ext_mclk1, audio_ref_clk, _, _, _, _, _, _, _, _),
+	[125] = PINGROUP(125, audio_ext_mclk0, _, _, _, _, _, _, _, _, _, _),
+	[126] = PINGROUP(126, i2s0_sck, _, _, _, _, _, _, _, _, _, _),
+	[127] = PINGROUP(127, i2s0_data0, _, _, _, _, _, _, _, _, _, _),
+	[128] = PINGROUP(128, i2s0_data1, _, _, _, _, _, _, _, _, _, _),
+	[129] = PINGROUP(129, i2s0_ws, _, _, _, _, _, _, _, _, _, _),
+	[130] = PINGROUP(130, uim0_data, atest_char, _, _, _, _, _, _, _, _, _),
+	[131] = PINGROUP(131, uim0_clk, atest_char, _, _, _, _, _, _, _, _, _),
+	[132] = PINGROUP(132, uim0_reset, atest_char, _, _, _, _, _, _, _, _, _),
+	[133] = PINGROUP(133, uim0_present, atest_char, _, _, _, _, _, _, _, _, _),
+	[134] = PINGROUP(134, uim1_data, qup1_se2, gcc_gp1, _, _, _, _, _, _, _, _),
+	[135] = PINGROUP(135, uim1_clk, qup1_se2, gcc_gp2, _, _, _, _, _, _, _, _),
+	[136] = PINGROUP(136, uim1_reset, qup1_se2, gcc_gp3, _, _, _, _, _, _, _, _),
+	[137] = PINGROUP(137, uim1_present, atest_char, _, _, _, _, _, _, _, _, _),
+	[138] = PINGROUP(138, _, _, _, _, _, _, _, _, _, _, _),
+	[139] = PINGROUP(139, _, _, _, _, _, _, _, _, _, _, _),
+	[140] = PINGROUP(140, _, _, _, _, _, _, _, _, _, _, _),
+	[141] = PINGROUP(141, _, _, _, _, _, _, _, _, _, _, _),
+	[142] = PINGROUP(142, _, _, _, _, _, _, _, _, _, _, _),
+	[143] = PINGROUP(143, _, _, _, _, _, _, _, _, _, _, _),
+	[144] = PINGROUP(144, _, _, _, _, _, _, _, _, _, _, _),
+	[145] = PINGROUP(145, _, _, _, _, _, _, _, _, _, _, _),
+	[146] = PINGROUP(146, _, _, _, _, _, _, _, _, _, _, _),
+	[147] = PINGROUP(147, _, tb_trig_sdc4, _, _, _, _, _, _, _, _, _),
+	[148] = PINGROUP(148, coex_uart1_rx, cmu_rng, _, _, _, _, _, _, _, _, _),
+	[149] = PINGROUP(149, coex_uart1_tx, cmu_rng, _, _, _, _, _, _, _, _, _),
+	[150] = PINGROUP(150, _, vfr_0, coex_uart2_rx, cmu_rng, sdc4_clk, _, _, _, _, _, _),
+	[151] = PINGROUP(151, _, coex_uart2_tx, cmu_rng, sdc4_cmd, _, _, _, _, _, _, _),
+	[152] = PINGROUP(152, nav_gpio2, _, _, _, _, _, _, _, _, _, _),
+	[153] = PINGROUP(153, cci_i2c_scl, _, _, _, _, _, _, _, _, _, _),
+	[154] = PINGROUP(154, nav_gpio0, nav_gpio3, _, _, _, _, _, _, _, _, _),
+	[155] = PINGROUP(155, nav_gpio1, vfr_1, _, _, _, _, _, _, _, _, _),
+	[156] = PINGROUP(156, qlink_little_request, _, _, _, _, _, _, _, _, _, _),
+	[157] = PINGROUP(157, qlink_little_enable, _, _, _, _, _, _, _, _, _, _),
+	[158] = PINGROUP(158, qlink_wmss, _, _, _, _, _, _, _, _, _, _),
+	[159] = PINGROUP(159, qlink_big_request, qdss_cti, _, _, _, _, _, _, _, _, _),
+	[160] = PINGROUP(160, qlink_big_enable, _, _, _, _, _, _, _, _, _, _),
+	[161] = PINGROUP(161, _, _, _, _, _, _, _, _, _, _, _),
+	[162] = PINGROUP(162, qdss_cti, _, _, _, _, _, _, _, _, _, _),
+	[163] = PINGROUP(163, cci_timer, _, _, _, _, _, _, _, _, _, _),
+	[164] = PINGROUP(164, cci_timer, cci_i2c_scl, _, _, _, _, _, _, _, _, _),
+	[165] = PINGROUP(165, _, _, _, _, _, _, _, _, _, _, egpio),
+	[166] = PINGROUP(166, _, _, _, _, _, _, _, _, _, _, egpio),
+	[167] = PINGROUP(167, _, _, _, _, _, _, _, _, _, _, egpio),
+	[168] = PINGROUP(168, _, _, _, _, _, _, _, _, _, _, egpio),
+	[169] = PINGROUP(169, _, _, _, _, _, _, _, _, _, _, egpio),
+	[170] = PINGROUP(170, _, _, _, _, _, _, _, _, _, _, egpio),
+	[171] = PINGROUP(171, _, _, _, _, _, _, _, _, _, _, egpio),
+	[172] = PINGROUP(172, _, _, _, _, _, _, _, _, _, _, egpio),
+	[173] = PINGROUP(173, _, _, _, _, _, _, _, _, _, _, egpio),
+	[174] = PINGROUP(174, _, _, _, _, _, _, _, _, _, _, egpio),
+	[175] = PINGROUP(175, _, _, _, _, _, _, _, _, _, _, egpio),
+	[176] = PINGROUP(176, _, _, _, _, _, _, _, _, _, _, egpio),
+	[177] = PINGROUP(177, _, _, _, _, _, _, _, _, _, _, egpio),
+	[178] = PINGROUP(178, _, _, _, _, _, _, _, _, _, _, egpio),
+	[179] = PINGROUP(179, _, _, _, _, _, _, _, _, _, _, egpio),
+	[180] = PINGROUP(180, _, _, _, _, _, _, _, _, _, _, egpio),
+	[181] = PINGROUP(181, _, _, _, _, _, _, _, _, _, _, egpio),
+	[182] = PINGROUP(182, _, _, _, _, _, _, _, _, _, _, egpio),
+	[183] = PINGROUP(183, _, _, _, _, _, _, _, _, _, _, egpio),
+	[184] = PINGROUP(184, _, _, _, _, _, _, _, _, _, _, egpio),
+	[185] = PINGROUP(185, _, _, _, _, _, _, _, _, _, _, egpio),
+	[186] = PINGROUP(186, _, _, _, _, _, _, _, _, _, _, egpio),
+	[187] = PINGROUP(187, _, _, _, _, _, _, _, _, _, _, egpio),
+	[188] = PINGROUP(188, _, _, _, _, _, _, _, _, _, _, egpio),
+	[189] = PINGROUP(189, _, _, _, _, _, _, _, _, _, _, egpio),
+	[190] = PINGROUP(190, _, _, _, _, _, _, _, _, _, _, egpio),
+	[191] = PINGROUP(191, _, _, _, _, _, _, _, _, _, _, egpio),
+	[192] = PINGROUP(192, _, _, _, _, _, _, _, _, _, _, egpio),
+	[193] = PINGROUP(193, _, _, _, _, _, _, _, _, _, _, egpio),
+	[194] = PINGROUP(194, _, _, _, _, _, _, _, _, _, _, egpio),
+	[195] = PINGROUP(195, _, _, _, _, _, _, _, _, _, _, egpio),
+	[196] = PINGROUP(196, _, _, _, _, _, _, _, _, _, _, egpio),
+	[197] = PINGROUP(197, _, _, _, _, _, _, _, _, _, _, egpio),
+	[198] = PINGROUP(198, _, _, _, _, _, _, _, _, _, _, egpio),
+	[199] = PINGROUP(199, _, _, _, _, _, _, _, _, _, _, egpio),
+	[200] = PINGROUP(200, _, _, _, _, _, _, _, _, _, _, egpio),
+	[201] = PINGROUP(201, _, _, _, _, _, _, _, _, _, _, egpio),
+	[202] = PINGROUP(202, _, _, _, _, _, _, _, _, _, _, egpio),
+	[203] = PINGROUP(203, _, _, _, _, _, _, _, _, _, _, egpio),
+	[204] = PINGROUP(204, _, _, _, _, _, _, _, _, _, _, egpio),
+	[205] = PINGROUP(205, _, _, _, _, _, _, _, _, _, _, egpio),
+	[206] = PINGROUP(206, i2chub0_se8, _, _, _, _, _, _, _, _, _, egpio),
+	[207] = PINGROUP(207, i2chub0_se8, _, _, _, _, _, _, _, _, _, egpio),
+	[208] = PINGROUP(208, _, _, _, _, _, _, _, _, _, _, egpio),
+	[209] = PINGROUP(209, _, _, _, _, _, _, _, _, _, _, egpio),
+	[210] = PINGROUP(210, _, _, _, _, _, _, _, _, _, _, egpio),
+	[211] = PINGROUP(211, _, _, _, _, _, _, _, _, _, _, egpio),
+	[212] = PINGROUP(212, _, _, _, _, _, _, _, _, _, _, egpio),
+	[213] = PINGROUP(213, _, _, _, _, _, _, _, _, _, _, egpio),
+	[214] = PINGROUP(214, _, _, _, _, _, _, _, _, _, _, egpio),
+	[215] = UFS_RESET(ufs_reset, 0xe2004, 0xe3000),
+	[216] = SDC_QDSD_PINGROUP(sdc2_clk, 0xdb000, 14, 6),
+	[217] = SDC_QDSD_PINGROUP(sdc2_cmd, 0xdb000, 11, 3),
+	[218] = SDC_QDSD_PINGROUP(sdc2_data, 0xdb000, 9, 0),
+};
+
+static const struct msm_gpio_wakeirq_map sm8750_pdc_map[] = {
+	{ 0, 72 },    { 3, 80 },    { 4, 73 },	  { 7, 74 },	{ 8, 75 },
+	{ 11, 76 },   { 12, 87 },   { 15, 98 },	  { 18, 110 },	{ 19, 79 },
+	{ 23, 82 },   { 24, 83 },   { 27, 84 },	  { 28, 85 },	{ 31, 86 },
+	{ 32, 92 },   { 35, 68 },   { 36, 93 },	  { 39, 94 },	{ 43, 95 },
+	{ 46, 96 },   { 47, 121 },  { 48, 97 },	  { 51, 118 },	{ 54, 102 },
+	{ 55, 71 },   { 56, 103 },  { 57, 104 },  { 59, 105 },	{ 61, 81 },
+	{ 63, 91 },   { 64, 77 },   { 65, 90 },	  { 66, 106 },	{ 67, 99 },
+	{ 68, 112 },  { 69, 113 },  { 75, 114 },  { 78, 115 },	{ 79, 116 },
+	{ 80, 122 },  { 81, 123 },  { 84, 101 },  { 85, 124 },	{ 86, 125 },
+	{ 87, 126 },  { 88, 127 },  { 95, 128 },  { 96, 129 },	{ 97, 100 },
+	{ 98, 117 },  { 99, 78 },   { 102, 130 }, { 103, 131 }, { 104, 132 },
+	{ 108, 133 }, { 133, 134 }, { 137, 67 },  { 148, 135 }, { 150, 136 },
+	{ 152, 137 }, { 154, 138 }, { 155, 89 },  { 156, 139 }, { 159, 140 },
+	{ 162, 109 }, { 163, 108 }, { 166, 141 }, { 169, 142 }, { 171, 143 },
+	{ 172, 144 }, { 174, 145 }, { 176, 146 }, { 177, 120 }, { 181, 147 },
+	{ 182, 148 }, { 185, 149 }, { 188, 111 }, { 190, 88 },	{ 191, 150 },
+	{ 192, 151 }, { 193, 152 }, { 196, 153 }, { 197, 154 }, { 198, 70 },
+	{ 199, 119 }, { 200, 69 },  { 201, 155 }, { 202, 156 }, { 203, 157 },
+	{ 204, 158 }, { 205, 107 }, { 209, 159 },
+};
+
+static const struct msm_pinctrl_soc_data sm8750_tlmm = {
+	.pins = sm8750_pins,
+	.npins = ARRAY_SIZE(sm8750_pins),
+	.functions = sm8750_functions,
+	.nfunctions = ARRAY_SIZE(sm8750_functions),
+	.groups = sm8750_groups,
+	.ngroups = ARRAY_SIZE(sm8750_groups),
+	.ngpios = 216,
+	.wakeirq_map = sm8750_pdc_map,
+	.nwakeirq_map = ARRAY_SIZE(sm8750_pdc_map),
+	.egpio_func = 11,
+};
+
+static int sm8750_tlmm_probe(struct platform_device *pdev)
+{
+	return msm_pinctrl_probe(pdev, &sm8750_tlmm);
+}
+
+static const struct of_device_id sm8750_tlmm_of_match[] = {
+	{ .compatible = "qcom,sm8750-tlmm", },
+	{},
+};
+
+static struct platform_driver sm8750_tlmm_driver = {
+	.driver = {
+		.name = "sm8750-tlmm",
+		.of_match_table = sm8750_tlmm_of_match,
+	},
+	.probe = sm8750_tlmm_probe,
+	.remove = msm_pinctrl_remove,
+};
+
+static int __init sm8750_tlmm_init(void)
+{
+	return platform_driver_register(&sm8750_tlmm_driver);
+}
+arch_initcall(sm8750_tlmm_init);
+
+static void __exit sm8750_tlmm_exit(void)
+{
+	platform_driver_unregister(&sm8750_tlmm_driver);
+}
+module_exit(sm8750_tlmm_exit);
+
+MODULE_DESCRIPTION("QTI SM8750 TLMM driver");
+MODULE_LICENSE("GPL");
+MODULE_DEVICE_TABLE(of, sm8750_tlmm_of_match);
-- 
2.46.1


