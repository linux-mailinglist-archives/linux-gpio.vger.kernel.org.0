Return-Path: <linux-gpio+bounces-39663-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PhqhGpk5TmoxJQIAu9opvQ
	(envelope-from <linux-gpio+bounces-39663-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 13:50:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B03472605D
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 13:50:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="F28/60K+";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39663-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39663-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7E6AE300F252
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 11:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F2A8437863;
	Wed,  8 Jul 2026 11:49:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AA842A16F;
	Wed,  8 Jul 2026 11:49:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783511393; cv=none; b=i7Bsm6nsQB6l16d6Ntiyqehe423WA0XXdYe331lSFBHqLwerhsnEtuVbJb4wxgUKDKPefI1iPOUI3/EDzPQ2R338uAmFQ3nzVbJ9hcYhD9FR0cE8JOm8rITDVofIBiiebh9AQuuG1T2yNhZGGl4XYEFFyaKa+L3bxoVHzkq5bwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783511393; c=relaxed/simple;
	bh=wETEMVUUn3cqT0N5rzG+JWF3qRKrr0LvQm9ujivrpV0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UO6EBeFyPL7xCZBJpXo1UyVNdpv1NlI+3ha/uuuvBg+nOl5rk4id7VGOa+RZ/xsNyXvx0MCsSsxVkkY4pz6OD4yG+Ul+6crvtGuMTF3i2U03NWRyVIAex7uhpzGtYmDnsDOSsRWmfdLVlVwz1e6BVtV1s23tdlmXFPEHk0NzmrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F28/60K+; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668BSo7D2459138;
	Wed, 8 Jul 2026 11:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=en7fkzazS5l
	h29S+a3oR9DKE2ehDeoRw9xRNNFQCKr0=; b=F28/60K+Op+8b6sco/3jWfJb9u6
	VRSC97OF42EVob6WOmaaejYSMNViqq5K0/ZATOGp7lAGGdMnPK8y7SuTAKSTcguK
	O5Q/8jOkn01UBwHViK+gGYNkDDlpfzXKV1rwPt/CfCh/jJVjXzIsbsTJBlVmRlJH
	95WUT0hpIaaDu2QT/l0mjs7rHdO2a2KuLnVKOAhebSXNTzodegOAkeDStc0SWa9m
	JKkr8uQOqk1NrHvde3lgKnFKAslrwOPLfKVBFIcsRvcU6FoTQeu6zTe6orXcFbuu
	UmHqw+YLMpUR+ItsOFLkdQmJ7KtQjL39/pUWEX2ldVWUZQgwlD6ssWsIplw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f97u1387r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 11:49:31 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 668BnRhD026288;
	Wed, 8 Jul 2026 11:49:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4f6u8k3yj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 11:49:27 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 668BnRFY026258;
	Wed, 8 Jul 2026 11:49:27 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 668BnRxo026250
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 11:49:27 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 4E7A863E; Wed,  8 Jul 2026 17:19:26 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v1 4/4] pinctrl: qcom: hawi-lpass-lpi: add Hawi LPASS LPI TLMM
Date: Wed,  8 Jul 2026 17:19:24 +0530
Message-Id: <20260708114924.1069239-5-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260708114924.1069239-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260708114924.1069239-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: KEFGIM-M9fsJ6ptDMC7AfITGxE9m_-rX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExNSBTYWx0ZWRfXyo1N69+n79cj
 McgsR++r1csjztqJywjrUYwsmCEPOUJcjRbNQzppsWQqlFnbtXjV6teZepTkhzjDJ+guuAcLyxV
 FnDsEL4ih7lKduknvgOAM658SzmMRF0=
X-Authority-Analysis: v=2.4 cv=F9JnsKhN c=1 sm=1 tr=0 ts=6a4e394b cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=RGdtN6rq-GqljJF8V3QA:9
 a=O8hF6Hzn-FEA:10
X-Proofpoint-GUID: KEFGIM-M9fsJ6ptDMC7AfITGxE9m_-rX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExNSBTYWx0ZWRfX4bBto/FU04NY
 DrSL9piEcp6j2XeLXwQAWzYErn5hi77fOs19u+n/vNTgH1f1hub14o9zOspwJsHxMUoKrPUxyOX
 N1cxzZ5/rF+4p/A9mCagt5YEk+6cyiv9OBdz0R+y8P9NKC/44RlUGv68/zZJAc4/G8BO5/fGjC0
 HGpODnVSVXiESgxWnvx8ZCLACM1/SDtfk+eKrdOl4Yt3j9dVvd9x5XDheCKzhWKPrhkVLakW3pf
 X4rC54/ENjb6CHFfWERSev9KEzlh57fa+90Vwdqk1f+oOK119LZTEvxG1/uQ7ilxxnyLVUH54BQ
 dIcdEH1cjg2e6t5nwQ3zFWDNUhrcLf0EHv3HwRee1z5kJguoAeJEZbQSMLSsyyACvrHsAwu/Mjl
 xn2sSZDhUAd5jtamOGCBGl+1K73KsughoVQiIV+UpvJx4HxxU6zRF2H9LD0RDWZLp3S2q3qy1LV
 fL9QiXS+rHFE9Ddht4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080115
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:brgl@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:srini@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:prasad.kumpatla@oss.qualcomm.com,m:krzk@kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39663-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B03472605D

Add pin controller driver for the Low Power Audio SubSystem (LPASS)
Low Power Island (LPI) of Qualcomm Hawi SoC.

The controller has 23 GPIOs with SoundWire, I2S, DMIC, VA I2S,
ext_mclk1 and slimbus mux functions.

Two pins (gpio13, gpio22) require 6 mux slots due to a test_bus
entry occupying a middle hardware slot. Add LPI_PINGROUP6 macro
to pinctrl-lpass-lpi.h to support pins with 5 alternate functions.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/Kconfig                  |  10 +
 drivers/pinctrl/qcom/Makefile                 |   1 +
 drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c | 244 ++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h      |  17 ++
 4 files changed, 272 insertions(+)
 create mode 100644 drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 18db35022..707067b92 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -62,6 +62,16 @@ config PINCTRL_LPASS_LPI
 	  Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
 	  (Low Power Island) found on the Qualcomm Technologies Inc SoCs.
 
+config PINCTRL_HAWI_LPASS_LPI
+	tristate "Qualcomm Technologies Inc Hawi LPASS LPI pin controller driver"
+	depends on ARM64 || COMPILE_TEST
+	depends on PINCTRL_LPASS_LPI
+	help
+	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	  Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
+	  (Low Power Island) found on the Qualcomm Technologies Inc Hawi
+	  platform.
+
 config PINCTRL_MILOS_LPASS_LPI
 	tristate "Qualcomm Milos LPASS LPI pin controller driver"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
index 43ecd246a..987a79f9d 100644
--- a/drivers/pinctrl/qcom/Makefile
+++ b/drivers/pinctrl/qcom/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_PINCTRL_APQ8084)	+= pinctrl-apq8084.o
 obj-$(CONFIG_PINCTRL_ELIZA)	+= pinctrl-eliza.o
 obj-$(CONFIG_PINCTRL_GLYMUR)	+= pinctrl-glymur.o
 obj-$(CONFIG_PINCTRL_HAWI)	+= pinctrl-hawi.o
+obj-$(CONFIG_PINCTRL_HAWI_LPASS_LPI) += pinctrl-hawi-lpass-lpi.o
 obj-$(CONFIG_PINCTRL_IPQ4019)	+= pinctrl-ipq4019.o
 obj-$(CONFIG_PINCTRL_IPQ5018)	+= pinctrl-ipq5018.o
 obj-$(CONFIG_PINCTRL_IPQ8064)	+= pinctrl-ipq8064.o
diff --git a/drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c
new file mode 100644
index 000000000..7036bf4c6
--- /dev/null
+++ b/drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c
@@ -0,0 +1,244 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/gpio/driver.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
+
+#include "pinctrl-lpass-lpi.h"
+
+enum lpass_lpi_functions {
+	LPI_MUX_dmic1_clk,
+	LPI_MUX_dmic1_data,
+	LPI_MUX_dmic2_clk,
+	LPI_MUX_dmic2_data,
+	LPI_MUX_dmic3_clk,
+	LPI_MUX_dmic3_data,
+	LPI_MUX_dmic4_clk,
+	LPI_MUX_dmic4_data,
+	LPI_MUX_ext_mclk1_a,
+	LPI_MUX_ext_mclk1_b,
+	LPI_MUX_ext_mclk1_c,
+	LPI_MUX_ext_mclk1_d,
+	LPI_MUX_ext_mclk1_e,
+	LPI_MUX_i2s0_clk,
+	LPI_MUX_i2s0_data,
+	LPI_MUX_i2s0_ws,
+	LPI_MUX_i2s1_clk,
+	LPI_MUX_i2s1_data,
+	LPI_MUX_i2s1_ws,
+	LPI_MUX_i2s2_clk,
+	LPI_MUX_i2s2_data,
+	LPI_MUX_i2s2_ws,
+	LPI_MUX_i2s3_clk,
+	LPI_MUX_i2s3_data,
+	LPI_MUX_i2s3_ws,
+	LPI_MUX_lpass_lpi_dbg_clk,
+	LPI_MUX_qca_swr_clk,
+	LPI_MUX_qca_swr_data,
+	LPI_MUX_slimbus_clk,
+	LPI_MUX_slimbus_data,
+	LPI_MUX_swr_rx_clk,
+	LPI_MUX_swr_rx_data,
+	LPI_MUX_swr_tx_clk,
+	LPI_MUX_swr_tx_clk1,
+	LPI_MUX_swr_tx_data,
+	LPI_MUX_va_i2s0_clk,
+	LPI_MUX_va_i2s0_data,
+	LPI_MUX_va_i2s0_ws,
+	LPI_MUX_wsa2_swr_clk,
+	LPI_MUX_wsa2_swr_data,
+	LPI_MUX_wsa_swr_clk,
+	LPI_MUX_wsa_swr_data,
+	LPI_MUX_gpio,
+	LPI_MUX__,
+};
+
+static const struct pinctrl_pin_desc hawi_lpi_pins[] = {
+	PINCTRL_PIN(0, "gpio0"),
+	PINCTRL_PIN(1, "gpio1"),
+	PINCTRL_PIN(2, "gpio2"),
+	PINCTRL_PIN(3, "gpio3"),
+	PINCTRL_PIN(4, "gpio4"),
+	PINCTRL_PIN(5, "gpio5"),
+	PINCTRL_PIN(6, "gpio6"),
+	PINCTRL_PIN(7, "gpio7"),
+	PINCTRL_PIN(8, "gpio8"),
+	PINCTRL_PIN(9, "gpio9"),
+	PINCTRL_PIN(10, "gpio10"),
+	PINCTRL_PIN(11, "gpio11"),
+	PINCTRL_PIN(12, "gpio12"),
+	PINCTRL_PIN(13, "gpio13"),
+	PINCTRL_PIN(14, "gpio14"),
+	PINCTRL_PIN(15, "gpio15"),
+	PINCTRL_PIN(16, "gpio16"),
+	PINCTRL_PIN(17, "gpio17"),
+	PINCTRL_PIN(18, "gpio18"),
+	PINCTRL_PIN(19, "gpio19"),
+	PINCTRL_PIN(20, "gpio20"),
+	PINCTRL_PIN(21, "gpio21"),
+	PINCTRL_PIN(22, "gpio22"),
+};
+
+static const char * const gpio_groups[] = {
+	"gpio0", "gpio1", "gpio2", "gpio3", "gpio4", "gpio5", "gpio6", "gpio7",
+	"gpio8", "gpio9", "gpio10", "gpio11", "gpio12", "gpio13", "gpio14",
+	"gpio15", "gpio16", "gpio17", "gpio18", "gpio19", "gpio20", "gpio21",
+	"gpio22",
+};
+
+static const char * const swr_tx_clk_groups[] = { "gpio0" };
+static const char * const i2s0_clk_groups[] = { "gpio0" };
+static const char * const swr_tx_data_groups[] = { "gpio1", "gpio2", "gpio14" };
+static const char * const i2s0_ws_groups[] = { "gpio1" };
+static const char * const swr_rx_clk_groups[] = { "gpio3" };
+static const char * const i2s0_data_groups[] = { "gpio2", "gpio3", "gpio4", "gpio5" };
+static const char * const swr_rx_data_groups[] = { "gpio4", "gpio5" };
+static const char * const ext_mclk1_c_groups[] = { "gpio5" };
+static const char * const dmic1_clk_groups[] = { "gpio6" };
+static const char * const va_i2s0_clk_groups[] = { "gpio6" };
+static const char * const dmic1_data_groups[] = { "gpio7" };
+static const char * const va_i2s0_ws_groups[] = { "gpio7" };
+static const char * const dmic2_clk_groups[] = { "gpio8" };
+static const char * const va_i2s0_data_groups[] = { "gpio8", "gpio9" };
+static const char * const dmic2_data_groups[] = { "gpio9" };
+static const char * const ext_mclk1_b_groups[] = { "gpio9" };
+static const char * const i2s1_clk_groups[] = { "gpio10" };
+static const char * const wsa_swr_clk_groups[] = { "gpio10" };
+static const char * const i2s1_ws_groups[] = { "gpio11" };
+static const char * const wsa_swr_data_groups[] = { "gpio11", "gpio21" };
+static const char * const dmic3_clk_groups[] = { "gpio12" };
+static const char * const i2s3_clk_groups[] = { "gpio12" };
+static const char * const dmic3_data_groups[] = { "gpio13" };
+static const char * const i2s3_ws_groups[] = { "gpio13" };
+static const char * const ext_mclk1_a_groups[] = { "gpio13" };
+static const char * const lpass_lpi_dbg_clk_groups[] = { "gpio13" };
+static const char * const swr_tx_clk1_groups[] = { "gpio14" };
+static const char * const ext_mclk1_d_groups[] = { "gpio14" };
+static const char * const i2s1_data_groups[] = { "gpio15", "gpio16", "gpio21", "gpio22" };
+static const char * const wsa2_swr_clk_groups[] = { "gpio15" };
+static const char * const wsa2_swr_data_groups[] = { "gpio16", "gpio22" };
+static const char * const dmic4_clk_groups[] = { "gpio17" };
+static const char * const i2s3_data_groups[] = { "gpio17", "gpio18" };
+static const char * const dmic4_data_groups[] = { "gpio18" };
+static const char * const i2s2_clk_groups[] = { "gpio19" };
+static const char * const slimbus_clk_groups[] = { "gpio19" };
+static const char * const qca_swr_clk_groups[] = { "gpio19" };
+static const char * const i2s2_ws_groups[] = { "gpio20" };
+static const char * const slimbus_data_groups[] = { "gpio20" };
+static const char * const qca_swr_data_groups[] = { "gpio20" };
+static const char * const i2s2_data_groups[] = { "gpio21", "gpio22" };
+static const char * const ext_mclk1_e_groups[] = { "gpio22" };
+
+static const struct lpi_pingroup hawi_groups[] = {
+	LPI_PINGROUP(0, 11, swr_tx_clk, i2s0_clk, _, _),
+	LPI_PINGROUP(1, 11, swr_tx_data, i2s0_ws, _, _),
+	LPI_PINGROUP(2, 11, swr_tx_data, i2s0_data, _, _),
+	LPI_PINGROUP(3, 11, swr_rx_clk, i2s0_data, _, _),
+	LPI_PINGROUP(4, 11, swr_rx_data, i2s0_data, _, _),
+	LPI_PINGROUP(5, 11, swr_rx_data, ext_mclk1_c, i2s0_data, _),
+	LPI_PINGROUP(6, LPI_NO_SLEW, dmic1_clk, va_i2s0_clk, _, _),
+	LPI_PINGROUP(7, LPI_NO_SLEW, dmic1_data, va_i2s0_ws, _, _),
+	LPI_PINGROUP(8, LPI_NO_SLEW, dmic2_clk, va_i2s0_data, _, _),
+	LPI_PINGROUP(9, LPI_NO_SLEW, dmic2_data, va_i2s0_data, ext_mclk1_b, _),
+	LPI_PINGROUP(10, 11, i2s1_clk, wsa_swr_clk, _, _),
+	LPI_PINGROUP(11, 11, i2s1_ws, wsa_swr_data, _, _),
+	LPI_PINGROUP(12, LPI_NO_SLEW, dmic3_clk, i2s3_clk, _, _),
+	LPI_PINGROUP6(13, LPI_NO_SLEW, dmic3_data, i2s3_ws, ext_mclk1_a, _, lpass_lpi_dbg_clk),
+	LPI_PINGROUP(14, 11, swr_tx_data, swr_tx_clk1, ext_mclk1_d, _),
+	LPI_PINGROUP(15, 11, i2s1_data, wsa2_swr_clk, _, _),
+	LPI_PINGROUP(16, 11, i2s1_data, wsa2_swr_data, _, _),
+	LPI_PINGROUP(17, LPI_NO_SLEW, dmic4_clk, i2s3_data, _, _),
+	LPI_PINGROUP(18, LPI_NO_SLEW, dmic4_data, i2s3_data, _, _),
+	LPI_PINGROUP(19, LPI_NO_SLEW, i2s2_clk, slimbus_clk, qca_swr_clk, _),
+	LPI_PINGROUP(20, LPI_NO_SLEW, i2s2_ws, slimbus_data, qca_swr_data, _),
+	LPI_PINGROUP(21, 11, i2s2_data, _, wsa_swr_data, i2s1_data),
+	LPI_PINGROUP6(22, 11, i2s2_data, ext_mclk1_e, _, i2s1_data, wsa2_swr_data),
+};
+
+static const struct lpi_function hawi_functions[] = {
+	LPI_FUNCTION(gpio),
+	LPI_FUNCTION(dmic1_clk),
+	LPI_FUNCTION(dmic1_data),
+	LPI_FUNCTION(dmic2_clk),
+	LPI_FUNCTION(dmic2_data),
+	LPI_FUNCTION(dmic3_clk),
+	LPI_FUNCTION(dmic3_data),
+	LPI_FUNCTION(dmic4_clk),
+	LPI_FUNCTION(dmic4_data),
+	LPI_FUNCTION(ext_mclk1_a),
+	LPI_FUNCTION(ext_mclk1_b),
+	LPI_FUNCTION(ext_mclk1_c),
+	LPI_FUNCTION(ext_mclk1_d),
+	LPI_FUNCTION(ext_mclk1_e),
+	LPI_FUNCTION(i2s0_clk),
+	LPI_FUNCTION(i2s0_data),
+	LPI_FUNCTION(i2s0_ws),
+	LPI_FUNCTION(i2s1_clk),
+	LPI_FUNCTION(i2s1_data),
+	LPI_FUNCTION(i2s1_ws),
+	LPI_FUNCTION(i2s2_clk),
+	LPI_FUNCTION(i2s2_data),
+	LPI_FUNCTION(i2s2_ws),
+	LPI_FUNCTION(i2s3_clk),
+	LPI_FUNCTION(i2s3_data),
+	LPI_FUNCTION(i2s3_ws),
+	LPI_FUNCTION(lpass_lpi_dbg_clk),
+	LPI_FUNCTION(qca_swr_clk),
+	LPI_FUNCTION(qca_swr_data),
+	LPI_FUNCTION(slimbus_clk),
+	LPI_FUNCTION(slimbus_data),
+	LPI_FUNCTION(swr_rx_clk),
+	LPI_FUNCTION(swr_rx_data),
+	LPI_FUNCTION(swr_tx_clk),
+	LPI_FUNCTION(swr_tx_clk1),
+	LPI_FUNCTION(swr_tx_data),
+	LPI_FUNCTION(va_i2s0_clk),
+	LPI_FUNCTION(va_i2s0_data),
+	LPI_FUNCTION(va_i2s0_ws),
+	LPI_FUNCTION(wsa2_swr_clk),
+	LPI_FUNCTION(wsa2_swr_data),
+	LPI_FUNCTION(wsa_swr_clk),
+	LPI_FUNCTION(wsa_swr_data),
+};
+
+static const struct lpi_pinctrl_variant_data hawi_lpi_data = {
+	.pins = hawi_lpi_pins,
+	.npins = ARRAY_SIZE(hawi_lpi_pins),
+	.groups = hawi_groups,
+	.ngroups = ARRAY_SIZE(hawi_groups),
+	.functions = hawi_functions,
+	.nfunctions = ARRAY_SIZE(hawi_functions),
+	.flags = LPI_FLAG_SLEW_RATE_SAME_REG,
+};
+
+static const struct of_device_id lpi_pinctrl_of_match[] = {
+	{
+		.compatible = "qcom,hawi-lpass-lpi-pinctrl",
+		.data = &hawi_lpi_data,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
+
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
+static struct platform_driver lpi_pinctrl_driver = {
+	.driver = {
+		.name = "qcom-hawi-lpass-lpi-pinctrl",
+		.of_match_table = lpi_pinctrl_of_match,
+		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
+	},
+	.probe = lpi_pinctrl_probe,
+	.remove = lpi_pinctrl_remove,
+};
+
+module_platform_driver(lpi_pinctrl_driver);
+MODULE_DESCRIPTION("Qualcomm Hawi LPI GPIO pin control driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
index 6ba0c4eba..056c4a774 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
@@ -92,6 +92,23 @@ struct pinctrl_pin_desc;
 		.pin_offset = 0,				\
 	}
 
+#define LPI_PINGROUP6(id, soff, f1, f2, f3, f4, f5)		\
+	{							\
+		.pin = id,					\
+		.slew_offset = soff,				\
+		.slew_base_spare_1 = false,			\
+		.funcs = (int[]){				\
+			LPI_MUX_gpio,				\
+			LPI_MUX_##f1,				\
+			LPI_MUX_##f2,				\
+			LPI_MUX_##f3,				\
+			LPI_MUX_##f4,				\
+			LPI_MUX_##f5,				\
+		},						\
+		.nfuncs = 6,					\
+		.pin_offset = 0,				\
+	}
+
 /*
  * Slew rate control is done in the same register as rest of the
  * pin configuration.
-- 
2.34.1


