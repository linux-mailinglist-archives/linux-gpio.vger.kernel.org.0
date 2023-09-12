Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8906E79BA72
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 02:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239911AbjIKUzn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Sep 2023 16:55:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236543AbjIKK4w (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Sep 2023 06:56:52 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D915BF3;
        Mon, 11 Sep 2023 03:56:46 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38BAJOiZ026737;
        Mon, 11 Sep 2023 10:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=msfzexrhLMT2BxtHXMw5Jpj9V9JE6/kAkVTtbr3R0Kk=;
 b=bNtLJVYLqAEM4FOG16e8LEjRWWtisuTF2KO6JOqZHfef5Twjl4E2c7qcPHGfZFM9oWeG
 nIB6dJmA6tT024PxoYneGXqFl2r+2YcQzSraXUcv+JU2FaNDJshZlK6Bs6xgVdwnI0mv
 8l+wzqomr9SrsQ0jhvCILMZFBFDMSFiSZlojwTkXG8+aAbcEsIunP6/iTuP6gjfkico2
 R8P8jIhkGgq+bykv5Ir/cAkgBEd9+k287sKANTKMD6bhSOZ1dOFztfNWEAV7jYwlpMQL
 aTcbohMYzzblLBY5HDOtlIrXG0nKJsF0gbl3ACfB5cM57aHrW3bKorwZn1Uf+Q+jATCi lg== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t0gx9uj8d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Sep 2023 10:56:13 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
        by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38BAuCVu006051
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Sep 2023 10:56:13 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Mon, 11 Sep 2023 03:55:45 -0700
From:   Mukesh Ojha <quic_mojha@quicinc.com>
To:     <corbet@lwn.net>, <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <keescook@chromium.org>, <tony.luck@intel.com>,
        <gpiccoli@igalia.com>, <mathieu.poirier@linaro.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <linus.walleij@linaro.org>, <andy.shevchenko@gmail.com>,
        <vigneshr@ti.com>, <nm@ti.com>, <matthias.bgg@gmail.com>,
        <kgene@kernel.org>, <alim.akhtar@samsung.com>,
        <bmasney@redhat.com>, <quic_tsoni@quicinc.com>
CC:     <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_mojha@quicinc.com>
Subject: [REBASE PATCH v5 11/17] qcom_minidump: Register ramoops region with minidump
Date:   Mon, 11 Sep 2023 16:23:53 +0530
Message-ID: <1694429639-21484-12-git-send-email-quic_mojha@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1694429639-21484-1-git-send-email-quic_mojha@quicinc.com>
References: <1694429639-21484-1-git-send-email-quic_mojha@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: sy675XrFSPHqgkW1yxA5mIuOqMWp9rE4
X-Proofpoint-GUID: sy675XrFSPHqgkW1yxA5mIuOqMWp9rE4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_06,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309110099
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Register all the pstore frontend with minidump, so that they can
be dumped as default Linux minidump region to be collected on
SoC where minidump is enabled.

Helper functions is written in separate file and built along with
the minidump driver, since it is client of minidump and also call
it at appropriate place from minidump probe so that they always
get registered.

While at it also rename the out minidump module object name during
build as qcom_apss_minidump which basically depicts as Qualcomm
Application processor subsystem minidump.

Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
 drivers/soc/qcom/Kconfig                 |  1 +
 drivers/soc/qcom/Makefile                |  3 +-
 drivers/soc/qcom/qcom_minidump.c         |  4 ++
 drivers/soc/qcom/qcom_ramoops_minidump.c | 88 ++++++++++++++++++++++++++++++++
 drivers/soc/qcom/qcom_ramoops_minidump.h | 10 ++++
 5 files changed, 105 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/qcom/qcom_ramoops_minidump.c
 create mode 100644 drivers/soc/qcom/qcom_ramoops_minidump.h

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 0ac7afc2c67d..9f1a1e128fef 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -306,6 +306,7 @@ config QCOM_MINIDUMP
 	tristate "QCOM APSS Minidump driver"
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on QCOM_SMEM
+	depends on PSTORE
 	help
 	  This config enables linux core infrastructure for Application
 	  processor subsystem (APSS) minidump collection i.e, it enables
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index 4b5f72f78d3c..69df41aba7a9 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -33,4 +33,5 @@ obj-$(CONFIG_QCOM_ICC_BWMON)	+= icc-bwmon.o
 qcom_ice-objs			+= ice.o
 obj-$(CONFIG_QCOM_INLINE_CRYPTO_ENGINE)	+= qcom_ice.o
 obj-$(CONFIG_QCOM_RPROC_MINIDUMP)	+= qcom_rproc_minidump.o
-obj-$(CONFIG_QCOM_MINIDUMP)		+= qcom_minidump.o
+obj-$(CONFIG_QCOM_MINIDUMP)		+= qcom_apss_minidump.o
+qcom_apss_minidump-objs			+= qcom_minidump.o qcom_ramoops_minidump.o
diff --git a/drivers/soc/qcom/qcom_minidump.c b/drivers/soc/qcom/qcom_minidump.c
index 4ce36f154e89..7930a80b9100 100644
--- a/drivers/soc/qcom/qcom_minidump.c
+++ b/drivers/soc/qcom/qcom_minidump.c
@@ -23,6 +23,7 @@
 #include <soc/qcom/qcom_minidump.h>
 
 #include "qcom_minidump_internal.h"
+#include "qcom_ramoops_minidump.h"
 
 /**
  * struct minidump_ss_data - Minidump subsystem private data
@@ -688,6 +689,8 @@ static int qcom_apss_minidump_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	qcom_ramoops_minidump_register(md->dev);
+
 	mutex_lock(&md_plist.plock);
 	platform_set_drvdata(pdev, md);
 	qcom_apss_register_pending_regions(md);
@@ -701,6 +704,7 @@ static int qcom_apss_minidump_remove(struct platform_device *pdev)
 	struct minidump *md = platform_get_drvdata(pdev);
 	struct minidump_ss_data *mdss_data;
 
+	qcom_ramoops_minidump_unregister();
 	mdss_data = md->apss_data;
 	memset(mdss_data->md_ss_toc, cpu_to_le32(0), sizeof(struct minidump_subsystem));
 	md = NULL;
diff --git a/drivers/soc/qcom/qcom_ramoops_minidump.c b/drivers/soc/qcom/qcom_ramoops_minidump.c
new file mode 100644
index 000000000000..eb97310e3858
--- /dev/null
+++ b/drivers/soc/qcom/qcom_ramoops_minidump.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pstore.h>
+#include <linux/slab.h>
+#include <soc/qcom/qcom_minidump.h>
+
+#include "qcom_ramoops_minidump.h"
+
+static LIST_HEAD(ramoops_region_list);
+
+struct md_region_list {
+	struct qcom_minidump_region md_region;
+	struct list_head list;
+};
+
+static int qcom_ramoops_region_register(struct device *dev, int type)
+{
+	struct qcom_minidump_region *md_region;
+	struct md_region_list *mdr_list;
+	struct pstore_record record;
+	unsigned int max_dump_cnt;
+	phys_addr_t phys;
+	const char *name;
+	void *virt;
+	size_t size;
+	int ret;
+
+	record.type = type;
+	record.id = 0;
+	max_dump_cnt = 0;
+	name = pstore_type_to_name(record.type);
+	do {
+		ret = pstore_region_defined(&record, &virt, &phys, &size, &max_dump_cnt);
+		if (ret < 0)
+			break;
+
+		mdr_list = devm_kzalloc(dev, sizeof(struct md_region_list), GFP_KERNEL);
+		if (!mdr_list)
+			return -ENOMEM;
+
+		md_region = &mdr_list->md_region;
+		scnprintf(md_region->name, sizeof(md_region->name) - 1, "K%s%llu", name, record.id);
+		md_region->virt_addr = virt;
+		md_region->phys_addr = phys;
+		md_region->size = size;
+		ret = qcom_minidump_region_register(md_region);
+		if (ret) {
+			pr_err("failed to register minidump region\n");
+			break;
+		}
+
+		list_add(&mdr_list->list, &ramoops_region_list);
+	} while (record.id < max_dump_cnt && ++record.id);
+
+	return ret;
+}
+
+void qcom_ramoops_minidump_register(struct device *dev)
+{
+	int type_arr[4] = { PSTORE_TYPE_DMESG, PSTORE_TYPE_CONSOLE,
+			    PSTORE_TYPE_FTRACE, PSTORE_TYPE_PMSG,
+			  };
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(type_arr); i++)
+		qcom_ramoops_region_register(dev, type_arr[i]);
+}
+
+void qcom_ramoops_minidump_unregister(void)
+{
+	struct md_region_list *mdr_list, *tmp;
+
+	list_for_each_entry_safe(mdr_list, tmp, &ramoops_region_list, list) {
+		struct qcom_minidump_region *region;
+
+		region = &mdr_list->md_region;
+		qcom_minidump_region_unregister(region);
+		list_del(&mdr_list->list);
+	}
+}
diff --git a/drivers/soc/qcom/qcom_ramoops_minidump.h b/drivers/soc/qcom/qcom_ramoops_minidump.h
new file mode 100644
index 000000000000..6086342cd398
--- /dev/null
+++ b/drivers/soc/qcom/qcom_ramoops_minidump.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __QCOM_RAMOOPS_MINIDUMP_H__
+#define __QCOM_RAMOOPS_MINIDUMP_H__
+
+#include <linux/types.h>
+
+void qcom_ramoops_minidump_register(struct device *dev);
+void qcom_ramoops_minidump_unregister(void);
+
+#endif
-- 
2.7.4

