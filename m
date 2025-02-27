Return-Path: <linux-gpio+bounces-16724-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7539A489EE
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 21:33:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24A58188F86A
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 20:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1225522759D;
	Thu, 27 Feb 2025 20:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FqVhWVHc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B949119DF52
	for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 20:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740688401; cv=none; b=q4iWXdH9bFcYbkdUsTY5J84GJb8OCzSKh4hGa2Fu74Q22+ehAPr1EIJuA/vBEVoYhzWIztu++lF1/vm8SW3BtTs9jSTv6tP8EijUoFKI7lnw/8wP6sc8s+B2xCO4DYVNJk2k34FyY8v4wig514cAs/cwbK2+UsLePV/YF/Ggp3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740688401; c=relaxed/simple;
	bh=vjZY5A0HFZCnZci21XgJX9dZE3TcHozhuKpeEDM+TLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iEgEGA/7iP+Zy5jbiaqwOIaKW50GiwPml05BoYbeTUvy+w0z0DVdm9uLnLOLzvdGTwvf10O2ojpXkFik73NXviQSj1aENTBLvIX8gq1xn1we8r8IrlLwYxf+w/U+zMidQQIE36S2HeQjpGkoyV2vfpE42mzVJqXBdCoYudtDP/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FqVhWVHc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RJNXtu017730
	for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 20:33:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zW9F6rX3lJYI2GbSahJV7W
	NVhALEd2XTat2FT2GxVbQ=; b=FqVhWVHcWo0Krb37/HiMO2aPIl4mNFQ9xm+K9y
	2inpR2EVYxLWZW4Mbhbn4Q/PLDdIWCvibV//BCbPz9bMHQhjWmOOsr3hicAcT8e8
	oXNTrTkO8DSGhlsC/6ejiBenrGANbOVFB2bC8t+XjqGw7MCTN+0Oue8X5cUxa4Sv
	kHMrqNwgOMqw521otWy7P/RMbEsKGMu82yo+H6caWilORXcCs/ijGLsjDkQ898qG
	476y+oj71L4hTxnkd5x7SYSkO4YiK4fYq58hdZ7OFp9xTwDPbOuYCd8vtBFQP7cv
	GEItwHrbqst1fBvX/lvyQtyfdyUC0+kfaQFwa5PZxDi1eYuA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prn70ts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 20:33:18 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-72894df5158so2017822a34.1
        for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 12:33:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740688397; x=1741293197;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zW9F6rX3lJYI2GbSahJV7WNVhALEd2XTat2FT2GxVbQ=;
        b=ampiP6PHc+9jmocbo8nc1baiLwVCcBfk3ysJgT9MZ/B8gsz2sF29NboPslUj7wD4gL
         ye0FYFV3USG74nrxQWDjdH6mlfw71C5guyQnJVmW+Y/jfv9I4CtABeiagRCwdRWJgDQR
         zBQ8g8C99TPR4SSu1qGRKddg2Pt5v2X3AWDfpi3rQCv2Ni2Uw4QHrXxYob7DnHVtUV8k
         Fc33UUwS+JfxMAbiND7IT7p4XEQb23rxbxD5TagSCWgi4RKN8V0fhYev1ue3yxf40Klb
         GYccVE6BaO5vbPGVkxKhpg4WLJYwibINcpebp8kH62U2NdxRa8oHp65fQjK+jqerKpkR
         xGEA==
X-Forwarded-Encrypted: i=1; AJvYcCWpcwE25mobhodXGKQiVOFVWFUBQOHm4g0WriUa+9YYPAOsOFNmc101aLVOdb/4+ICljlMZ6Yaiq0ku@vger.kernel.org
X-Gm-Message-State: AOJu0YzVM7lhdsi5vl3AeaSUSCQx/bEvyXCmXztIXXLllvEmKJJIJtyO
	0nFY6jV91eZCmv+bivzgmSYf3kZGadHS82/kk9g6fRjP7Tq8eeqx1IRwPR+tX9E716Zo0C4Pbv+
	BNxyCf0G6dCJaB6iOqRSDT0mRLRFOznqbvOUSRYPKzD8UPeVHP2EoIOIaQFUd
X-Gm-Gg: ASbGncv+1mLF+xMyBA/yayahWn3/Tqq9QR4yIE7ygMKCuSJ2md1cX4jWHbLOx7NZYZI
	eVwTvGK1q/fE66JyihI8K/PNi1EIW5A9rAcUmI15mH/063yqky8KgDZZpM6COa/+Jy83qqPFfHh
	+A/+KNfnNpdW3OzIKOvGR2nmNGByVV/zjtrShoqZWD9EJZ/xBObR7oLPlKW7OYPHPYnoYu5qeWp
	DqrxUWtM+5iRoLRJJNWH7zruYhghK5AZx/d2hRKv1sPjDt1+SP/IIrKx33ygk07MoqfGx/WWg4K
	XTBBnFfg7udv9qld3ZBW4s3UWzdmq2lZHCvyW5x6X1a+zItgHMu0AOtqFwXBoyGNIwi2aRl0HsA
	DkWoEX9uhpjpVOA4=
X-Received: by 2002:a05:6830:380c:b0:71e:30e:e022 with SMTP id 46e09a7af769-728b7b6bf11mr708301a34.10.1740688397228;
        Thu, 27 Feb 2025 12:33:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIVaPo6sucI1BxgNQah4J7uNj3brQWEe3PKny/rcUFzpxHfnoKD79D2Xlrgr0NmyLoXAicTQ==
X-Received: by 2002:a05:6830:380c:b0:71e:30e:e022 with SMTP id 46e09a7af769-728b7b6bf11mr708285a34.10.1740688396784;
        Thu, 27 Feb 2025 12:33:16 -0800 (PST)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-728afcf58a5sm382416a34.8.2025.02.27.12.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 12:33:16 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Thu, 27 Feb 2025 12:39:30 -0800
Subject: [PATCH] pinctrl: qcom: Add test case for TLMM interrupt handling
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-tlmm-test-v1-1-d18877b4a5db@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIHNwGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyNz3ZKc3FzdktTiEt0k4yRLA7PEtDSjtDQloPqCotS0zAqwWdGxtbU
 AXaP5olsAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=20210;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=vjZY5A0HFZCnZci21XgJX9dZE3TcHozhuKpeEDM+TLE=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBnwM2De3uB4eWjiDA5SzHxymsCXp42jQ7XqJVF0
 Rt6NJ1Czk6JAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZ8DNgxUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcVjmQ//ZlAm30ryw+CHIIz7X7xhkfK1FAvceQlIqNovk2J
 GOyH8ScLwiUa7Lwo1xOWaueNgHgJDuDZpr8h2klMoOqPxy50xwz71tIuUvUVbBwHzMdqt/COLGb
 gT4p4j8vDafys5uQwk5h2+7nJzWjkNfU8xC8eyRlLUGHhK3gwzA1wh3GAZotxifmZoR1f/feA5X
 3c3bUirqYKGx42Vl3XHCeGVXgeFwVh94qA2jujJUZPrYMkDRB60u8yDhK+Kq7RH9awTrWSYMymp
 ZDF/2m7UprdrR9tAGD9nJJPdcvvagn4PAMZKYtwUd4IYYjpIi6zZ9Wlx2lr6ZnngSGD4WFUACXB
 fH1rPpCCQTZBMl5SKP5SdBU06WDpAsxqNRM+9cLnGSlvfBo6N3lYqt+wtFEi7lOqNPWuTeLH6fb
 iIux7sCtxBsWyc1TCMGgkL/Q/zKDDdb647I1SBmTzPyMS2duVOK0eSW06k1xYTNgLP28m2OxXcy
 lJTMmESJI+toNCojuRslaFZjuZZgodyix95tK4DQWwYmfvez/pOeRN/nFzzC1FoSD0HqvWrSGeA
 72yfL22aKMAvyOR+VZ1OqWthIGvi1wwWu8mk3Rv514gM0SbH2AnDTuJ4gX1SZp9XJhRxc/zxkRZ
 fXqDp3VpspmgDlU/LqJue/gNn6H6Jh4g/FuS0evCbxm8=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-ORIG-GUID: CuqNPgjBQPN-D798RAUmVcHz7PMrMpcr
X-Proofpoint-GUID: CuqNPgjBQPN-D798RAUmVcHz7PMrMpcr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_07,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1011 mlxscore=0 adultscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270152

While looking at the X1E PDC GPIO interrupts it became clear that we're
lacking a convenient and accessible way to validate if the TLMM
interrupt code performing as expected.

This introduces a kunit-based "hack" that relies on pin bias/pull
configuration to tickle the interrupt logic in non-connected pins to
allow us to evaluate that an expected number of interrupts are
delivered.

The bias/pull configuration is done with mmio accesses directly from the
test code, to avoid having to programmatically acquire and drive the
pinconf interface for the test pin. This limits the scalability of the
code to targets with a particular register layout, but serves our needs
for now.

The pin to be used for testing is specified by the tester using the
"tlmm-test.gpio" module parameter.

Worth mentioning is that some of the test cases currently fails for
GPIOs that is not backed by PDC (i.e. "non-wakeup" GPIOs), as lingering
latched interrupt state is being delivered at IRQ request time.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/Kconfig.msm |  10 +
 drivers/pinctrl/qcom/Makefile    |   1 +
 drivers/pinctrl/qcom/tlmm-test.c | 626 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 637 insertions(+)

diff --git a/drivers/pinctrl/qcom/Kconfig.msm b/drivers/pinctrl/qcom/Kconfig.msm
index 35f47660a56b..c928452675be 100644
--- a/drivers/pinctrl/qcom/Kconfig.msm
+++ b/drivers/pinctrl/qcom/Kconfig.msm
@@ -437,4 +437,14 @@ config PINCTRL_X1E80100
 	  Say Y here to compile statically, or M here to compile it as a module.
 	  If unsure, say N.
 
+config PINCTRL_TLMM_TEST
+	tristate "Qualcomm TLMM test driver"
+	depends on ARM64 || COMPILE_TEST
+	depends on KUNIT
+	help
+	  This driver provides test cases for the interrupt capabilities of
+	  TLMM driver (pinctrl-msm). Specify a floating gpio to use for testing
+	  using the module parameter "gpio" and execute the kunit suite.
+	  If unsure, say N.
+
 endif
diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
index 5c4100925cf9..954f5291cc37 100644
--- a/drivers/pinctrl/qcom/Makefile
+++ b/drivers/pinctrl/qcom/Makefile
@@ -71,3 +71,4 @@ obj-$(CONFIG_PINCTRL_SM8750) += pinctrl-sm8750.o
 obj-$(CONFIG_PINCTRL_SC8280XP_LPASS_LPI) += pinctrl-sc8280xp-lpass-lpi.o
 obj-$(CONFIG_PINCTRL_LPASS_LPI) += pinctrl-lpass-lpi.o
 obj-$(CONFIG_PINCTRL_X1E80100)	+= pinctrl-x1e80100.o
+obj-$(CONFIG_PINCTRL_TLMM_TEST) += tlmm-test.o
diff --git a/drivers/pinctrl/qcom/tlmm-test.c b/drivers/pinctrl/qcom/tlmm-test.c
new file mode 100644
index 000000000000..9c31798b3c08
--- /dev/null
+++ b/drivers/pinctrl/qcom/tlmm-test.c
@@ -0,0 +1,626 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#define pr_fmt(fmt) "tlmm-test: " fmt
+
+#include <kunit/test.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/platform_device.h>
+
+/*
+ * This TLMM test module serves the purpose of validating that the TLMM driver
+ * (pinctrl-msm) delivers expected number of interrupts in response to changing
+ * GPIO state.
+ *
+ * To achieve this without external equipment the test takes a module parameter
+ * "gpio", which the tester is expected to specify an unused and non-connected
+ * pin. The GPIO state is then driven by adjusting the bias of the pin, at
+ * suitable times through the different test cases.
+ *
+ * Upon execution, the test initialization will find the TLMM node (subject to
+ * tlmm_of_match[] allow listing) and create the necessary references
+ * dynamically, rather then relying on e.g. Devicetree and phandles.
+ */
+
+#define MSM_PULL_MASK		GENMASK(2, 0)
+#define MSM_PULL_DOWN		1
+#define MSM_PULL_UP		3
+#define TLMM_REG_SIZE		0x1000
+
+static int tlmm_test_gpio = -1;
+module_param_named(gpio, tlmm_test_gpio, int, 0600);
+
+static struct {
+	void __iomem *base;
+	void __iomem *reg;
+	int irq;
+
+	u32 low_val;
+	u32 high_val;
+} tlmm_suite;
+
+/**
+ * struct tlmm_test_priv - Per-test context
+ * @intr_count:		number of times hard handler was hit with TLMM_TEST_COUNT op set
+ * @thread_count:	number of times thread handler was hit with TLMM_TEST_COUNT op set
+ * @intr_op:		operations to be performed by the hard IRQ handler
+ * @intr_op_remain:	number of times the TLMM_TEST_THEN_* operations should be
+ *			performed by the hard IRQ handler
+ * @thread_op:		operations to be performed by the threaded IRQ handler
+ * @thread_op_remain:	number of times the TLMM_TEST_THEN_* operations should
+ *			be performed by the threaded IRQ handler
+ */
+struct tlmm_test_priv {
+	atomic_t intr_count;
+	atomic_t thread_count;
+
+	unsigned int intr_op;
+	atomic_t intr_op_remain;
+
+	unsigned int thread_op;
+	atomic_t thread_op_remain;
+};
+
+/* Operation masks for @intr_op and @thread_op */
+#define TLMM_TEST_COUNT		BIT(0)
+#define TLMM_TEST_OUTPUT_LOW	BIT(1)
+#define TLMM_TEST_OUTPUT_HIGH	BIT(2)
+#define TLMM_TEST_THEN_HIGH	BIT(3)
+#define TLMM_TEST_THEN_LOW	BIT(4)
+#define TLMM_TEST_WAKE_THREAD	BIT(5)
+
+static void tlmm_output_low(void)
+{
+	writel(tlmm_suite.low_val, tlmm_suite.reg);
+	readl(tlmm_suite.reg);
+}
+
+static void tlmm_output_high(void)
+{
+	writel(tlmm_suite.high_val, tlmm_suite.reg);
+	readl(tlmm_suite.reg);
+}
+
+static irqreturn_t tlmm_test_intr_fn(int irq, void *dev_id)
+{
+	struct tlmm_test_priv *priv = dev_id;
+
+	if (priv->intr_op & TLMM_TEST_COUNT)
+		atomic_inc(&priv->intr_count);
+
+	if (priv->intr_op & TLMM_TEST_OUTPUT_LOW)
+		tlmm_output_low();
+	if (priv->intr_op & TLMM_TEST_OUTPUT_HIGH)
+		tlmm_output_high();
+
+	if (atomic_dec_if_positive(&priv->intr_op_remain) > 0) {
+		udelay(1);
+
+		if (priv->intr_op & TLMM_TEST_THEN_LOW)
+			tlmm_output_low();
+		if (priv->intr_op & TLMM_TEST_THEN_HIGH)
+			tlmm_output_high();
+	}
+
+	return priv->intr_op & TLMM_TEST_WAKE_THREAD ? IRQ_WAKE_THREAD : IRQ_HANDLED;
+}
+
+static irqreturn_t tlmm_test_intr_thread_fn(int irq, void *dev_id)
+{
+	struct tlmm_test_priv *priv = dev_id;
+
+	if (priv->thread_op & TLMM_TEST_COUNT)
+		atomic_inc(&priv->thread_count);
+
+	if (priv->thread_op & TLMM_TEST_OUTPUT_LOW)
+		tlmm_output_low();
+	if (priv->thread_op & TLMM_TEST_OUTPUT_HIGH)
+		tlmm_output_high();
+
+	if (atomic_dec_if_positive(&priv->thread_op_remain) > 0) {
+		udelay(1);
+		if (priv->thread_op & TLMM_TEST_THEN_LOW)
+			tlmm_output_low();
+		if (priv->thread_op & TLMM_TEST_THEN_HIGH)
+			tlmm_output_high();
+	}
+
+	return IRQ_HANDLED;
+}
+
+static void tlmm_test_request_hard_irq(struct kunit *test, unsigned long irqflags)
+{
+	struct tlmm_test_priv *priv = test->priv;
+	int ret;
+
+	ret = request_irq(tlmm_suite.irq, tlmm_test_intr_fn, irqflags, test->name, priv);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+}
+
+static void tlmm_test_request_threaded_irq(struct kunit *test, unsigned long irqflags)
+{
+	struct tlmm_test_priv *priv = test->priv;
+	int ret;
+
+	ret = request_threaded_irq(tlmm_suite.irq,
+				   tlmm_test_intr_fn, tlmm_test_intr_thread_fn,
+				   irqflags, test->name, priv);
+
+	KUNIT_EXPECT_EQ(test, ret, 0);
+}
+
+static void tlmm_test_silent(struct kunit *test, unsigned long irqflags)
+{
+	struct tlmm_test_priv *priv = test->priv;
+
+	priv->intr_op = TLMM_TEST_COUNT;
+
+	/* GPIO line at non-triggering level */
+	if (irqflags == IRQF_TRIGGER_LOW || irqflags == IRQF_TRIGGER_FALLING)
+		tlmm_output_high();
+	else
+		tlmm_output_low();
+
+	tlmm_test_request_hard_irq(test, irqflags);
+	msleep(100);
+	free_irq(tlmm_suite.irq, priv);
+
+	KUNIT_ASSERT_EQ(test, atomic_read(&priv->intr_count), 0);
+}
+
+/*
+ * Test that no RISING interrupts are triggered on a silent pin
+ */
+static void tlmm_test_silent_rising(struct kunit *test)
+{
+	tlmm_test_silent(test, IRQF_TRIGGER_RISING);
+}
+
+/*
+ * Test that no FALLING interrupts are triggered on a silent pin
+ */
+static void tlmm_test_silent_falling(struct kunit *test)
+{
+	tlmm_test_silent(test, IRQF_TRIGGER_FALLING);
+}
+
+/*
+ * Test that no LOW interrupts are triggered on a silent pin
+ */
+static void tlmm_test_silent_low(struct kunit *test)
+{
+	tlmm_test_silent(test, IRQF_TRIGGER_LOW);
+}
+
+/*
+ * Test that no HIGH interrupts are triggered on a silent pin
+ */
+static void tlmm_test_silent_high(struct kunit *test)
+{
+	tlmm_test_silent(test, IRQF_TRIGGER_HIGH);
+}
+
+/*
+ * Square wave with 10 high pulses, assert that we get 10 rising interrupts
+ */
+static void tlmm_test_rising(struct kunit *test)
+{
+	struct tlmm_test_priv *priv = test->priv;
+	int i;
+
+	priv->intr_op = TLMM_TEST_COUNT;
+
+	tlmm_output_low();
+
+	tlmm_test_request_hard_irq(test, IRQF_TRIGGER_RISING);
+	for (i = 0; i < 10; i++) {
+		tlmm_output_low();
+		msleep(20);
+		tlmm_output_high();
+		msleep(20);
+	}
+
+	free_irq(tlmm_suite.irq, priv);
+
+	KUNIT_ASSERT_EQ(test, atomic_read(&priv->intr_count), 10);
+}
+
+/*
+ * Square wave with 10 low pulses, assert that we get 10 falling interrupts
+ */
+static void tlmm_test_falling(struct kunit *test)
+{
+	struct tlmm_test_priv *priv = test->priv;
+	int i;
+
+	priv->intr_op = TLMM_TEST_COUNT;
+
+	tlmm_output_high();
+
+	tlmm_test_request_hard_irq(test, IRQF_TRIGGER_FALLING);
+	for (i = 0; i < 10; i++) {
+		tlmm_output_high();
+		msleep(20);
+		tlmm_output_low();
+		msleep(20);
+	}
+	free_irq(tlmm_suite.irq, priv);
+
+	KUNIT_ASSERT_EQ(test, atomic_read(&priv->intr_count), 10);
+}
+
+/*
+ * Drive line low 10 times, handler drives it high to "clear the interrupt
+ * source", assert we get 10 interrupts
+ */
+static void tlmm_test_low(struct kunit *test)
+{
+	struct tlmm_test_priv *priv = test->priv;
+	int i;
+
+	priv->intr_op = TLMM_TEST_COUNT | TLMM_TEST_OUTPUT_HIGH;
+	atomic_set(&priv->intr_op_remain, 9);
+
+	tlmm_output_high();
+
+	tlmm_test_request_hard_irq(test, IRQF_TRIGGER_LOW);
+	for (i = 0; i < 10; i++) {
+		msleep(20);
+		tlmm_output_low();
+	}
+	msleep(100);
+	free_irq(tlmm_suite.irq, priv);
+
+	KUNIT_ASSERT_EQ(test, atomic_read(&priv->intr_count), 10);
+}
+
+/*
+ * Drive line high 10 times, handler drives it low to "clear the interrupt
+ * source", assert we get 10 interrupts
+ */
+static void tlmm_test_high(struct kunit *test)
+{
+	struct tlmm_test_priv *priv = test->priv;
+	int i;
+
+	priv->intr_op = TLMM_TEST_COUNT | TLMM_TEST_OUTPUT_LOW;
+	atomic_set(&priv->intr_op_remain, 9);
+
+	tlmm_output_low();
+
+	tlmm_test_request_hard_irq(test, IRQF_TRIGGER_HIGH);
+	for (i = 0; i < 10; i++) {
+		msleep(20);
+		tlmm_output_high();
+	}
+	msleep(100);
+	free_irq(tlmm_suite.irq, priv);
+
+	KUNIT_ASSERT_EQ(test, atomic_read(&priv->intr_count), 10);
+}
+
+/*
+ * Handler drives GPIO high to "clear the interrupt source", then low to
+ * simulate a new interrupt, repeated 10 times, assert we get 10 interrupts
+ */
+static void tlmm_test_falling_in_handler(struct kunit *test)
+{
+	struct tlmm_test_priv *priv = test->priv;
+
+	priv->intr_op = TLMM_TEST_COUNT | TLMM_TEST_OUTPUT_HIGH | TLMM_TEST_THEN_LOW;
+	atomic_set(&priv->intr_op_remain, 10);
+
+	tlmm_output_high();
+
+	tlmm_test_request_hard_irq(test, IRQF_TRIGGER_FALLING);
+	msleep(20);
+	tlmm_output_low();
+	msleep(100);
+	free_irq(tlmm_suite.irq, priv);
+
+	KUNIT_ASSERT_EQ(test, atomic_read(&priv->intr_count), 10);
+}
+
+/*
+ * Handler drives GPIO low to "clear the interrupt source", then high to
+ * simulate a new interrupt, repeated 10 times, assert we get 10 interrupts
+ */
+static void tlmm_test_rising_in_handler(struct kunit *test)
+{
+	struct tlmm_test_priv *priv = test->priv;
+
+	priv->intr_op = TLMM_TEST_COUNT | TLMM_TEST_OUTPUT_LOW | TLMM_TEST_THEN_HIGH;
+	atomic_set(&priv->intr_op_remain, 10);
+
+	tlmm_output_low();
+
+	tlmm_test_request_hard_irq(test, IRQF_TRIGGER_RISING);
+	msleep(20);
+	tlmm_output_high();
+	msleep(100);
+	free_irq(tlmm_suite.irq, priv);
+
+	KUNIT_ASSERT_EQ(test, atomic_read(&priv->intr_count), 10);
+}
+
+/*
+ * Square wave with 10 high pulses, assert that we get 10 rising hard and
+ * 10 threaded interrupts
+ */
+static void tlmm_test_thread_rising(struct kunit *test)
+{
+	struct tlmm_test_priv *priv = test->priv;
+	int i;
+
+	priv->intr_op = TLMM_TEST_COUNT | TLMM_TEST_WAKE_THREAD;
+	priv->thread_op = TLMM_TEST_COUNT;
+
+	tlmm_output_low();
+
+	tlmm_test_request_threaded_irq(test, IRQF_TRIGGER_RISING);
+	for (i = 0; i < 10; i++) {
+		tlmm_output_low();
+		msleep(20);
+		tlmm_output_high();
+		msleep(20);
+	}
+	free_irq(tlmm_suite.irq, priv);
+
+	KUNIT_ASSERT_EQ(test, atomic_read(&priv->intr_count), 10);
+	KUNIT_ASSERT_EQ(test, atomic_read(&priv->thread_count), 10);
+}
+
+/*
+ * Square wave with 10 low pulses, assert that we get 10 falling interrupts
+ */
+static void tlmm_test_thread_falling(struct kunit *test)
+{
+	struct tlmm_test_priv *priv = test->priv;
+	int i;
+
+	priv->intr_op = TLMM_TEST_COUNT | TLMM_TEST_WAKE_THREAD;
+	priv->thread_op = TLMM_TEST_COUNT;
+
+	tlmm_output_high();
+
+	tlmm_test_request_threaded_irq(test, IRQF_TRIGGER_FALLING);
+	for (i = 0; i < 10; i++) {
+		tlmm_output_high();
+		msleep(20);
+		tlmm_output_low();
+		msleep(20);
+	}
+	free_irq(tlmm_suite.irq, priv);
+
+	KUNIT_ASSERT_EQ(test, atomic_read(&priv->intr_count), 10);
+	KUNIT_ASSERT_EQ(test, atomic_read(&priv->thread_count), 10);
+}
+
+/*
+ * Drive line high 10 times, threaded handler drives it low to "clear the
+ * interrupt source", assert we get 10 interrupts
+ */
+static void tlmm_test_thread_high(struct kunit *test)
+{
+	struct tlmm_test_priv *priv = test->priv;
+	int i;
+
+	priv->intr_op = TLMM_TEST_COUNT | TLMM_TEST_WAKE_THREAD;
+	priv->thread_op = TLMM_TEST_COUNT | TLMM_TEST_OUTPUT_LOW;
+
+	tlmm_output_low();
+
+	tlmm_test_request_threaded_irq(test, IRQF_TRIGGER_HIGH | IRQF_ONESHOT);
+	for (i = 0; i < 10; i++) {
+		tlmm_output_high();
+		msleep(20);
+	}
+	free_irq(tlmm_suite.irq, priv);
+
+	KUNIT_ASSERT_EQ(test, atomic_read(&priv->intr_count), 10);
+	KUNIT_ASSERT_EQ(test, atomic_read(&priv->thread_count), 10);
+}
+
+/*
+ * Drive line low 10 times, threaded handler drives it high to "clear the
+ * interrupt source", assert we get 10 interrupts
+ */
+static void tlmm_test_thread_low(struct kunit *test)
+{
+	struct tlmm_test_priv *priv = test->priv;
+	int i;
+
+	priv->intr_op = TLMM_TEST_COUNT | TLMM_TEST_WAKE_THREAD;
+	priv->thread_op = TLMM_TEST_COUNT | TLMM_TEST_OUTPUT_HIGH;
+
+	tlmm_output_high();
+
+	tlmm_test_request_threaded_irq(test, IRQF_TRIGGER_LOW | IRQF_ONESHOT);
+	for (i = 0; i < 10; i++) {
+		tlmm_output_low();
+		msleep(20);
+	}
+	free_irq(tlmm_suite.irq, priv);
+
+	KUNIT_ASSERT_EQ(test, atomic_read(&priv->intr_count), 10);
+	KUNIT_ASSERT_EQ(test, atomic_read(&priv->thread_count), 10);
+}
+
+/*
+ * Handler drives GPIO low to "clear the interrupt source", then high in the
+ * threaded handler to simulate a new interrupt, repeated 10 times, assert we
+ * get 10 interrupts
+ */
+static void tlmm_test_thread_rising_in_handler(struct kunit *test)
+{
+	struct tlmm_test_priv *priv = test->priv;
+
+	priv->intr_op = TLMM_TEST_COUNT | TLMM_TEST_OUTPUT_LOW | TLMM_TEST_WAKE_THREAD;
+	priv->thread_op = TLMM_TEST_COUNT | TLMM_TEST_THEN_HIGH;
+	atomic_set(&priv->thread_op_remain, 10);
+
+	tlmm_output_low();
+
+	tlmm_test_request_threaded_irq(test, IRQF_TRIGGER_RISING);
+	msleep(20);
+	tlmm_output_high();
+	msleep(100);
+	free_irq(tlmm_suite.irq, priv);
+
+	KUNIT_ASSERT_EQ(test, atomic_read(&priv->intr_count), 10);
+	KUNIT_ASSERT_EQ(test, atomic_read(&priv->thread_count), 10);
+}
+
+/*
+ * Handler drives GPIO high to "clear the interrupt source", then low in the
+ * threaded handler to simulate a new interrupt, repeated 10 times, assert we
+ * get 10 interrupts
+ */
+static void tlmm_test_thread_falling_in_handler(struct kunit *test)
+{
+	struct tlmm_test_priv *priv = test->priv;
+
+	priv->intr_op = TLMM_TEST_COUNT | TLMM_TEST_OUTPUT_HIGH | TLMM_TEST_WAKE_THREAD;
+	priv->thread_op = TLMM_TEST_COUNT | TLMM_TEST_THEN_LOW;
+	atomic_set(&priv->thread_op_remain, 10);
+
+	tlmm_output_high();
+
+	tlmm_test_request_threaded_irq(test, IRQF_TRIGGER_FALLING);
+	msleep(20);
+	tlmm_output_low();
+	msleep(100);
+	free_irq(tlmm_suite.irq, priv);
+
+	KUNIT_ASSERT_EQ(test, atomic_read(&priv->intr_count), 10);
+	KUNIT_ASSERT_EQ(test, atomic_read(&priv->thread_count), 10);
+}
+
+static int tlmm_test_init(struct kunit *test)
+{
+	struct tlmm_test_priv *priv;
+
+	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
+
+	atomic_set(&priv->intr_count, 0);
+	atomic_set(&priv->thread_count, 0);
+
+	atomic_set(&priv->intr_op_remain, 0);
+	atomic_set(&priv->thread_op_remain, 0);
+
+	test->priv = priv;
+
+	return 0;
+}
+
+/*
+ * NOTE: When adding compatibles to this list, ensure that TLMM_REG_SIZE and
+ * pull configuration values are supported and correct.
+ */
+static const struct of_device_id tlmm_of_match[] = {
+	{ .compatible = "qcom,sc8280xp-tlmm" },
+	{ .compatible = "qcom,x1e80100-tlmm" },
+	{}
+};
+
+static int tlmm_test_init_suite(struct kunit_suite *suite)
+{
+	struct of_phandle_args args = {};
+	struct resource res;
+	int ret;
+	u32 val;
+
+	if (tlmm_test_gpio < 0) {
+		pr_err("use the tlmm-test.gpio module parameter to specify which GPIO to use\n");
+		return -EINVAL;
+	}
+
+	struct device_node *tlmm __free(device_node) = of_find_matching_node(NULL, tlmm_of_match);
+	if (!tlmm) {
+		pr_err("failed to find tlmm node\n");
+		return -EINVAL;
+	}
+
+	ret = of_address_to_resource(tlmm, 0, &res);
+	if (ret < 0)
+		return ret;
+
+	tlmm_suite.base = ioremap(res.start, resource_size(&res));
+	if (!tlmm_suite.base)
+		return -ENOMEM;
+
+	args.np = tlmm;
+	args.args_count = 2;
+	args.args[0] = tlmm_test_gpio;
+	args.args[1] = 0;
+
+	tlmm_suite.irq = irq_create_of_mapping(&args);
+	if (!tlmm_suite.irq) {
+		pr_err("failed to map TLMM irq %d\n", args.args[0]);
+		goto err_unmap;
+	}
+
+	tlmm_suite.reg = tlmm_suite.base + tlmm_test_gpio * TLMM_REG_SIZE;
+	val = readl(tlmm_suite.reg) & ~MSM_PULL_MASK;
+	tlmm_suite.low_val = val | MSM_PULL_DOWN;
+	tlmm_suite.high_val = val | MSM_PULL_UP;
+
+	return 0;
+
+err_unmap:
+	iounmap(tlmm_suite.base);
+	tlmm_suite.base = NULL;
+	return -EINVAL;
+}
+
+static void tlmm_test_exit_suite(struct kunit_suite *suite)
+{
+	irq_dispose_mapping(tlmm_suite.irq);
+	iounmap(tlmm_suite.base);
+
+	tlmm_suite.base = NULL;
+	tlmm_suite.irq = -1;
+}
+
+static struct kunit_case tlmm_test_cases[] = {
+	KUNIT_CASE(tlmm_test_silent_rising),
+	KUNIT_CASE(tlmm_test_silent_falling),
+	KUNIT_CASE(tlmm_test_silent_low),
+	KUNIT_CASE(tlmm_test_silent_high),
+	KUNIT_CASE(tlmm_test_rising),
+	KUNIT_CASE(tlmm_test_falling),
+	KUNIT_CASE(tlmm_test_high),
+	KUNIT_CASE(tlmm_test_low),
+	KUNIT_CASE(tlmm_test_rising_in_handler),
+	KUNIT_CASE(tlmm_test_falling_in_handler),
+	KUNIT_CASE(tlmm_test_thread_rising),
+	KUNIT_CASE(tlmm_test_thread_falling),
+	KUNIT_CASE(tlmm_test_thread_high),
+	KUNIT_CASE(tlmm_test_thread_low),
+	KUNIT_CASE(tlmm_test_thread_rising_in_handler),
+	KUNIT_CASE(tlmm_test_thread_falling_in_handler),
+	{}
+};
+
+static struct kunit_suite tlmm_test_suite = {
+	.name = "tlmm-test",
+	.init = tlmm_test_init,
+	.suite_init = tlmm_test_init_suite,
+	.suite_exit = tlmm_test_exit_suite,
+	.test_cases = tlmm_test_cases,
+};
+
+kunit_test_suites(&tlmm_test_suite);
+
+MODULE_DESCRIPTION("Qualcomm TLMM test");
+MODULE_LICENSE("GPL");

---
base-commit: be5c7bbb3a64baf884481a1ba0c2f8fb2f93f7c3
change-id: 20250227-tlmm-test-b3b906aff2ff

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


