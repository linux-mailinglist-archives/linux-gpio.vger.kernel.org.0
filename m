Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 840BA6CC6DF
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Mar 2023 17:41:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234017AbjC1Plk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Mar 2023 11:41:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234010AbjC1PlR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Mar 2023 11:41:17 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8938D11EAB;
        Tue, 28 Mar 2023 08:40:18 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32S84n0S003463;
        Tue, 28 Mar 2023 15:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=UzOkAbo53yU707Z9eFAc6l/Yp8oVbS7bLPnSz7LCwtI=;
 b=lhmNBR6f7ZT0XpnQrLd9KgfkogrxxglK1xxQ1TSrFrXqekUb4ps0ehvJ5BDVKKVy1zhh
 a6qDhd9xCldPqNkX07jnHRI3tnuPdSH6iZZ7l3EfUxQ3T4IRX/hXph7I/eXDzmRLWoOA
 kokzlEdeYy3+xZ0uQQHsjwcU1nwSgAD0fpHefsmfDImmeNVf2OjTkcZrdMnrcFDeRjuC
 2EfanzOlvv6NRKouYWBL4BNiZ4bXgH4esV26+Ogko5GRY1IxIYHrZVGouiDShkWyZSQ5
 Be7wVnTXTVqDUwxcGpU3SIlN5miZ5E+sv+DQjYc49ob7Y4dzku81xdXHIhpoPpogOK+7 pQ== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pkv45h8h2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 28 Mar 2023 15:39:59 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
        by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32SFdwC6004813
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 28 Mar 2023 15:39:58 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 28 Mar 2023 08:39:55 -0700
From:   Mukesh Ojha <quic_mojha@quicinc.com>
To:     <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <linus.walleij@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, Mukesh Ojha <quic_mojha@quicinc.com>
Subject: [PATCH v5 4/5] firmware: qcom_scm: Refactor code to support multiple download mode
Date:   Tue, 28 Mar 2023 21:07:48 +0530
Message-ID: <1680017869-22421-5-git-send-email-quic_mojha@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1680017869-22421-1-git-send-email-quic_mojha@quicinc.com>
References: <1680017869-22421-1-git-send-email-quic_mojha@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ELpYD3cVWphfpG98tnSHFNe6ZLhkNTYR
X-Proofpoint-ORIG-GUID: ELpYD3cVWphfpG98tnSHFNe6ZLhkNTYR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303280121
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Currently on Qualcomm SoC, download_mode is enabled if
CONFIG_QCOM_SCM_DOWNLOAD_MODE_DEFAULT is selected.

Refactor the code such that it supports multiple download
modes and drop CONFIG_QCOM_SCM_DOWNLOAD_MODE_DEFAULT config
instead, give interface to set the download mode from
module parameter.

Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
 drivers/firmware/Kconfig    | 11 ---------
 drivers/firmware/qcom_scm.c | 60 +++++++++++++++++++++++++++++++++++++++------
 2 files changed, 52 insertions(+), 19 deletions(-)

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index b59e304..ff7e9f3 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -215,17 +215,6 @@ config MTK_ADSP_IPC
 config QCOM_SCM
 	tristate
 
-config QCOM_SCM_DOWNLOAD_MODE_DEFAULT
-	bool "Qualcomm download mode enabled by default"
-	depends on QCOM_SCM
-	help
-	  A device with "download mode" enabled will upon an unexpected
-	  warm-restart enter a special debug mode that allows the user to
-	  "download" memory content over USB for offline postmortem analysis.
-	  The feature can be enabled/disabled on the kernel command line.
-
-	  Say Y here to enable "download mode" by default.
-
 config SYSFB
 	bool
 	select BOOT_VESA_SUPPORT
diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 8e39b97..53ee301 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -20,11 +20,11 @@
 #include <linux/clk.h>
 #include <linux/reset-controller.h>
 #include <linux/arm-smccc.h>
+#include <linux/kstrtox.h>
 
 #include "qcom_scm.h"
 
-static bool download_mode = IS_ENABLED(CONFIG_QCOM_SCM_DOWNLOAD_MODE_DEFAULT);
-module_param(download_mode, bool, 0);
+static u32 download_mode;
 
 #define SCM_HAS_CORE_CLK	BIT(0)
 #define SCM_HAS_IFACE_CLK	BIT(1)
@@ -32,6 +32,7 @@ module_param(download_mode, bool, 0);
 
 #define QCOM_DOWNLOAD_MODE_MASK 0x30
 #define QCOM_DOWNLOAD_FULLDUMP	0x1
+#define QCOM_DOWNLOAD_NODUMP	0x0
 
 struct qcom_scm {
 	struct device *dev;
@@ -440,8 +441,9 @@ static int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
 	return qcom_scm_call_atomic(__scm->dev, &desc, NULL);
 }
 
-static void qcom_scm_set_download_mode(bool enable)
+static void qcom_scm_set_download_mode(u32 download_mode)
 {
+	bool enable = !!download_mode;
 	bool avail;
 	int ret = 0;
 
@@ -452,8 +454,7 @@ static void qcom_scm_set_download_mode(bool enable)
 		ret = __qcom_scm_set_dload_mode(__scm->dev, enable);
 	} else if (__scm->dload_mode_addr) {
 		ret = qcom_scm_io_update_field(__scm->dload_mode_addr,
-				QCOM_DOWNLOAD_MODE_MASK,
-				enable ? QCOM_DOWNLOAD_FULLDUMP : 0);
+				QCOM_DOWNLOAD_MODE_MASK, download_mode);
 	} else {
 		dev_err(__scm->dev,
 			"No available mechanism for setting download mode\n");
@@ -1419,6 +1420,49 @@ static irqreturn_t qcom_scm_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+
+static int get_download_mode(char *buffer, const struct kernel_param *kp)
+{
+	int len = 0;
+
+	if (download_mode == QCOM_DOWNLOAD_FULLDUMP)
+		len = sysfs_emit(buffer, "full\n");
+	else if (download_mode == QCOM_DOWNLOAD_NODUMP)
+		len = sysfs_emit(buffer, "off\n");
+
+	return len;
+}
+
+static int set_download_mode(const char *val, const struct kernel_param *kp)
+{
+	u32 old = download_mode;
+
+	if (!strncmp(val, "full", strlen("full"))) {
+		download_mode = QCOM_DOWNLOAD_FULLDUMP;
+	} else if (!strncmp(val, "off", strlen("off"))) {
+		download_mode = QCOM_DOWNLOAD_NODUMP;
+	} else if (kstrtouint(val, 0, &download_mode) ||
+		   !(download_mode == 0 || download_mode == 1)) {
+		download_mode = old;
+		pr_err("qcom_scm: unknown download mode: %s\n", val);
+		return -EINVAL;
+	}
+
+	if (__scm)
+		qcom_scm_set_download_mode(download_mode);
+
+	return 0;
+}
+
+static const struct kernel_param_ops download_mode_param_ops = {
+	.get = get_download_mode,
+	.set = set_download_mode,
+};
+
+module_param_cb(download_mode, &download_mode_param_ops, NULL, 0644);
+MODULE_PARM_DESC(download_mode,
+		 "Download mode: off/full or 0/1 for existing users");
+
 static int qcom_scm_probe(struct platform_device *pdev)
 {
 	struct qcom_scm *scm;
@@ -1512,12 +1556,12 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	__get_convention();
 
 	/*
-	 * If requested enable "download mode", from this point on warmboot
+	 * If "download mode" is requested, from this point on warmboot
 	 * will cause the boot stages to enter download mode, unless
 	 * disabled below by a clean shutdown/reboot.
 	 */
 	if (download_mode)
-		qcom_scm_set_download_mode(true);
+		qcom_scm_set_download_mode(download_mode);
 
 	return 0;
 }
@@ -1525,7 +1569,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
 static void qcom_scm_shutdown(struct platform_device *pdev)
 {
 	/* Clean shutdown, disable download mode to allow normal restart */
-	qcom_scm_set_download_mode(false);
+	qcom_scm_set_download_mode(QCOM_DOWNLOAD_NODUMP);
 }
 
 static const struct of_device_id qcom_scm_dt_match[] = {
-- 
2.7.4

