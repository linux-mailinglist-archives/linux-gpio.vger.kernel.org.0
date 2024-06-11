Return-Path: <linux-gpio+bounces-7335-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 10255902F7B
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 06:21:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7333EB21A12
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 04:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B6B16FF37;
	Tue, 11 Jun 2024 04:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cKLIjBCr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A18F12FF65;
	Tue, 11 Jun 2024 04:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718079696; cv=none; b=s6V3m8gTuqXH6D27Bu3TfmOrdHcQfAd2Ly/n62MX5kNhMWoMpwX54BHqQo+jRJqu9m7aClevy7qatTjFqYEspd7clpdLk09Zv1RI+FPPw20BSG2M6XTDYFMDEiA0uvF6NaaJ3f1q5jhW621chc6Si9Q0MjwUijcde7QAR2Ra6WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718079696; c=relaxed/simple;
	bh=bOlH16yoLLwDhPyqTn87CsAu23WS8AYZapZer14UFwI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=FTJcnNHJDiLmy5nv9PP4UadNUElOZt+lradhh8X24+dwAILgaGi7Dce053trygq+g0//4R9doQGxr5s5fx0I5l5vjPAgJ6HFbVEYRzSuKaO0SC1KADvrUOKpum9qUKr2LfqB5L1QqIIOIocVeLabIY76bEBikatHH4di7+tS0zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cKLIjBCr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45AEUoEq030832;
	Tue, 11 Jun 2024 04:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9wFGZ9NsF1+ExCUmKe+vyw
	6T9qVZ/UfBtzK4uVfJ0t0=; b=cKLIjBCr7c/jfGnoYSND/5+YymwEzwAqaU48FM
	zUEpBDL78G/4LgaOUL3NFZce6k9kxo8zN9ISB85b/Oj1ySKuGFMuz4ChVfw3AN22
	7JW/1mHgHmNQYZI5bNBwbITLt6SeONyIidKkrNp/KdoPjpo8MGthFDhBrLj7Ko6g
	DlteHB2D+jEI+cYDobTrUJISBlqLFLCypTzW6kIzbz1IUPVexEsf7AsKot+q0Fg2
	ECMB+Wpkkm/ZtC3ypRdL7JyQFIj7UvmADDV4AVe2lKW6ut5wrrtDEDM0XxyP0W2Q
	2n1ITIkhragc1kGg7kbJMTdfhpV8TXQZMfIj0lZ6FMQWN+ww==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymevxdaye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 04:21:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45B4L87l001954
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 04:21:08 GMT
Received: from [169.254.0.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Jun
 2024 21:21:07 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Mon, 10 Jun 2024 21:21:05 -0700
Subject: [PATCH] pinctrl: add missing MODULE_DESCRIPTION() macros
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20240610-md-drivers-pinctrl-v1-1-68462e3d960c@quicinc.com>
X-B4-Tracking: v=1; b=H4sIALDQZ2YC/x3MQQqDQAyF4atI1g2M1ip4ldJFnElrQEdJVATx7
 k27enyL959grMIGXXGC8i4mc3aUtwLiQPnDKMkNVajq0JQBp4RJZWc1XCTHVUdsY2jvj5p8GvD
 jovyW4x99vtw9GWOvlOPwS42StwMnspUVrusL7qzNOoMAAAA=
To: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>,
        "Broadcom internal
 kernel review list" <bcm-kernel-feedback-list@broadcom.com>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        "Kevin Hilman" <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>, <kernel-janitors@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qqrK4b4Qf9tpkGOIqUuwSD-AfAKDuLiL
X-Proofpoint-GUID: qqrK4b4Qf9tpkGOIqUuwSD-AfAKDuLiL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_08,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110031

When ARCH=x86, make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pinctrl/bcm/pinctrl-bcm4908.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pinctrl/pinctrl-mcp23s08_i2c.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pinctrl/pinctrl-mcp23s08_spi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pinctrl/pinctrl-mcp23s08.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pinctrl/meson/pinctrl-meson.o

Add the missing invocation of the MODULE_DESCRIPTION() macro to all
files which have a MODULE_LICENSE().

This includes many meson drivers which, although they did not produce
a warning with the x86 allmodconfig configuration, may cause this
warning with ARM or ARM64 configurations.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
Corrections to these descriptions are welcomed. I'm not an expert in
this code so in most cases I've taken these descriptions directly from
code comments, Kconfig descriptions, or git logs.  History has shown
that in some cases these are originally wrong due to cut-n-paste
errors, and in other cases the drivers have evolved such that the
original information is no longer accurate.

Also let me know if any changes need to be split into a separate patch
to go through a separate maintainer tree.
---
 drivers/pinctrl/bcm/pinctrl-bcm4908.c         | 1 +
 drivers/pinctrl/meson/pinctrl-meson-a1.c      | 1 +
 drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c | 1 +
 drivers/pinctrl/meson/pinctrl-meson-axg.c     | 1 +
 drivers/pinctrl/meson/pinctrl-meson-g12a.c    | 1 +
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c    | 1 +
 drivers/pinctrl/meson/pinctrl-meson-gxl.c     | 1 +
 drivers/pinctrl/meson/pinctrl-meson-s4.c      | 1 +
 drivers/pinctrl/meson/pinctrl-meson.c         | 1 +
 drivers/pinctrl/meson/pinctrl-meson8-pmx.c    | 1 +
 drivers/pinctrl/pinctrl-mcp23s08.c            | 1 +
 drivers/pinctrl/pinctrl-mcp23s08_i2c.c        | 1 +
 drivers/pinctrl/pinctrl-mcp23s08_spi.c        | 1 +
 drivers/pinctrl/pinctrl-tb10x.c               | 1 +
 14 files changed, 14 insertions(+)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm4908.c b/drivers/pinctrl/bcm/pinctrl-bcm4908.c
index cdfa165fc033..f190e0997f1f 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm4908.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm4908.c
@@ -559,5 +559,6 @@ static struct platform_driver bcm4908_pinctrl_driver = {
 module_platform_driver(bcm4908_pinctrl_driver);
 
 MODULE_AUTHOR("Rafał Miłecki");
+MODULE_DESCRIPTION("Broadcom BCM4908 pinmux driver");
 MODULE_LICENSE("GPL v2");
 MODULE_DEVICE_TABLE(of, bcm4908_pinctrl_of_match_table);
diff --git a/drivers/pinctrl/meson/pinctrl-meson-a1.c b/drivers/pinctrl/meson/pinctrl-meson-a1.c
index 50a87d9618a8..d2ac9ca72a3e 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-a1.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-a1.c
@@ -936,4 +936,5 @@ static struct platform_driver meson_a1_pinctrl_driver = {
 };
 
 module_platform_driver(meson_a1_pinctrl_driver);
+MODULE_DESCRIPTION("Amlogic Meson A1 SoC pinctrl driver");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c b/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c
index ae3f8d0da05f..cad411d90727 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c
@@ -117,4 +117,5 @@ const struct pinmux_ops meson_axg_pmx_ops = {
 };
 EXPORT_SYMBOL_GPL(meson_axg_pmx_ops);
 
+MODULE_DESCRIPTION("Amlogic Meson AXG second generation pinmux driver");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg.c b/drivers/pinctrl/meson/pinctrl-meson-axg.c
index 6667c9d0238f..8f4e7154b73f 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-axg.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-axg.c
@@ -1091,4 +1091,5 @@ static struct platform_driver meson_axg_pinctrl_driver = {
 };
 
 module_platform_driver(meson_axg_pinctrl_driver);
+MODULE_DESCRIPTION("Amlogic Meson AXG pinctrl driver");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/pinctrl/meson/pinctrl-meson-g12a.c b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
index 2c17891ba6a9..32830269a5b4 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-g12a.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
@@ -1426,4 +1426,5 @@ static struct platform_driver meson_g12a_pinctrl_driver = {
 };
 
 module_platform_driver(meson_g12a_pinctrl_driver);
+MODULE_DESCRIPTION("Amlogic Meson G12A SoC pinctrl driver");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
index f51fc3939252..2867f397fec6 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
@@ -910,4 +910,5 @@ static struct platform_driver meson_gxbb_pinctrl_driver = {
 	},
 };
 module_platform_driver(meson_gxbb_pinctrl_driver);
+MODULE_DESCRIPTION("Amlogic Meson GXBB pinctrl driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
index 51408996255b..a2f25fa02852 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
@@ -871,4 +871,5 @@ static struct platform_driver meson_gxl_pinctrl_driver = {
 	},
 };
 module_platform_driver(meson_gxl_pinctrl_driver);
+MODULE_DESCRIPTION("Amlogic Meson GXL pinctrl driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/meson/pinctrl-meson-s4.c b/drivers/pinctrl/meson/pinctrl-meson-s4.c
index cea77864b880..60c7d5003e8a 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-s4.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-s4.c
@@ -1230,4 +1230,5 @@ static struct platform_driver meson_s4_pinctrl_driver = {
 };
 module_platform_driver(meson_s4_pinctrl_driver);
 
+MODULE_DESCRIPTION("Amlogic Meson S4 SoC pinctrl driver");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 524424ee6c4e..ef002b9dd464 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -767,4 +767,5 @@ int meson_pinctrl_probe(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(meson_pinctrl_probe);
 
+MODULE_DESCRIPTION("Amlogic Meson SoCs core pinctrl driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/meson/pinctrl-meson8-pmx.c b/drivers/pinctrl/meson/pinctrl-meson8-pmx.c
index f767b6923f9f..7f22aa0f8e36 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8-pmx.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8-pmx.c
@@ -101,4 +101,5 @@ const struct pinmux_ops meson8_pmx_ops = {
 	.gpio_request_enable = meson8_pmx_request_gpio,
 };
 EXPORT_SYMBOL_GPL(meson8_pmx_ops);
+MODULE_DESCRIPTION("Amlogic Meson SoCs first generation pinmux driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 38c3a14c8b58..737d0ae3d0b6 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -696,4 +696,5 @@ int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 }
 EXPORT_SYMBOL_GPL(mcp23s08_probe_one);
 
+MODULE_DESCRIPTION("MCP23S08 SPI/I2C GPIO driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/pinctrl-mcp23s08_i2c.c b/drivers/pinctrl/pinctrl-mcp23s08_i2c.c
index 04e8e7d079f0..94e1add6ddd7 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08_i2c.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08_i2c.c
@@ -111,4 +111,5 @@ static void mcp23s08_i2c_exit(void)
 }
 module_exit(mcp23s08_i2c_exit);
 
+MODULE_DESCRIPTION("MCP23S08 I2C GPIO driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/pinctrl-mcp23s08_spi.c b/drivers/pinctrl/pinctrl-mcp23s08_spi.c
index 4a872fff5fe8..54f61c8cb1c0 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08_spi.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08_spi.c
@@ -263,4 +263,5 @@ static void mcp23s08_spi_exit(void)
 }
 module_exit(mcp23s08_spi_exit);
 
+MODULE_DESCRIPTION("MCP23S08 SPI GPIO driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/pinctrl-tb10x.c b/drivers/pinctrl/pinctrl-tb10x.c
index c3b76e6511ac..4f98f72565f4 100644
--- a/drivers/pinctrl/pinctrl-tb10x.c
+++ b/drivers/pinctrl/pinctrl-tb10x.c
@@ -830,4 +830,5 @@ static struct platform_driver tb10x_pinctrl_pdrv = {
 module_platform_driver(tb10x_pinctrl_pdrv);
 
 MODULE_AUTHOR("Christian Ruppert <christian.ruppert@abilis.com>");
+MODULE_DESCRIPTION("Abilis Systems TB10x pinctrl driver");
 MODULE_LICENSE("GPL");

---
base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
change-id: 20240610-md-drivers-pinctrl-7c07354ac076


