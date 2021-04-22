Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34907367C8B
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Apr 2021 10:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235420AbhDVIbV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Apr 2021 04:31:21 -0400
Received: from mail-bn8nam12on2075.outbound.protection.outlook.com ([40.107.237.75]:31937
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235362AbhDVIbT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 22 Apr 2021 04:31:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WGHdH486fEC0MuV7J1Oh+QDtdZ08whIrIF18wWgoHXKdmAt1rNxReyNd3ccSIJQ41gq6bWdlk2PgUh8BcBCLXXQdVtGFlvXfseGxqUwlFOs6VJsQQ/2t1I6tOx7RApDsQ0WNqc6p8ds36zqw8qY91193N+D/wIa4cZRRupbSAGs5AxjMzwEXs7Opwa08Jn9SI6MKaDAo52gNts9d9Ef6PV/jyYDTbI7lMcTmzikoGqQDzvzt4Khkk7soul2iZS+aroMEhbWxRpttS8HBiim1KX6bEUTQzZemg7kF6x1qCgiUfY+i4Qb5lWtO1xJCkprDYfhyGBsSEHZFDsvIftJXSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PlkBQ+qSdPrg0ELhn9cSNu292fTvfe03J0a3sAyMFo0=;
 b=AJiEKTteg5szckojF2/oa6HLVyx+cyYNnGHLQG76pE5CbjZA5bAUpTMRCyvHHssmwiDDxcC6ZnO4LADFZVco0SwUNu9BFoWxmKc8ktRGzGgaZF/lVIvmwgpneU5IsoUGErv/Ly7lHKCGpVGX1YvDcld4fpenS9SXROzbvp37S+au/9SKxVLSd2Ja/cR48TOPeH9vJ7lJ/Ej0Q3vWR6+Ti07Dul05iXI4Eas2sQIlTVg3xMJgRKJuSUVtqJy5c7Eof+q7+nMfBQDQlA5Pw/g3ZLgUwGrIrmKNF7xiNau3wQIiJfLMwwX3pblNEpPKgUNGVd50bM8H9DdyeegirEe8kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PlkBQ+qSdPrg0ELhn9cSNu292fTvfe03J0a3sAyMFo0=;
 b=s5ZPZYMDIPeEhsU6xo8Q+DE4By1QioTP6bFtpS3YkmaOzPYJElyzGwy6lx06cWIGjSaMhMCnLurGwkYUXYuKE/Qa1pJv+6swXa++9DPEGewrOWHblzHPIDcZzfUYvXks4ygIKB7u1CUU8ZybdnwY7+r0hDY1nqSK2n3QqEKPKSs=
Received: from DM6PR03CA0029.namprd03.prod.outlook.com (2603:10b6:5:40::42) by
 PH0PR02MB7205.namprd02.prod.outlook.com (2603:10b6:510:1a::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.31; Thu, 22 Apr 2021 08:30:42 +0000
Received: from CY1NAM02FT008.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:40:cafe::18) by DM6PR03CA0029.outlook.office365.com
 (2603:10b6:5:40::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22 via Frontend
 Transport; Thu, 22 Apr 2021 08:30:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT008.mail.protection.outlook.com (10.152.75.59) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4065.21 via Frontend Transport; Thu, 22 Apr 2021 08:30:41 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 22 Apr 2021 01:30:27 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Thu, 22 Apr 2021 01:30:27 -0700
Envelope-to: git@xilinx.com,
 saikrishna12468@gmail.com,
 robh+dt@kernel.org,
 linus.walleij@linaro.org,
 gregkh@linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.106] (port=49357 helo=xhdvnc125.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <lakshmi.sai.krishna.potthuri@xilinx.com>)
        id 1lZUjB-0005IC-Gj; Thu, 22 Apr 2021 01:30:26 -0700
Received: by xhdvnc125.xilinx.com (Postfix, from userid 14964)
        id A904A121663; Thu, 22 Apr 2021 14:00:10 +0530 (IST)
From:   Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <git@xilinx.com>,
        <saikrishna12468@gmail.com>,
        Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
Subject: [PATCH v6 1/3] firmware: xilinx: Add pinctrl support
Date:   Thu, 22 Apr 2021 14:00:00 +0530
Message-ID: <1619080202-31924-2-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1619080202-31924-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
References: <1619080202-31924-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b2628ff-7c45-45f0-eddc-08d90568ea8d
X-MS-TrafficTypeDiagnostic: PH0PR02MB7205:
X-Microsoft-Antispam-PRVS: <PH0PR02MB7205E0A1A8AF3AD5062AE6DABD469@PH0PR02MB7205.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vOAA2yLUS3ZNExqupRbOMgsng6C1DfvtroTs6uh1sfirJXEGo8DFQL9nN/XzAorqW1BHxfAF1MtbU858AZRzTE5/1oSwS3kYviuyw8cQ22nikmx5a8Y1vbOCtJwK3vTvz/WzUzlXL0yZVG1tIUERYaIO3qi1QdB+liNwP9lUs4S0MhJonFzJNFshpN3ewA1ba5WNwM78rai8B7kT0RieAFPi4JJZjMQf59wND00y/dzQPYRQ9w2amxqO8h55d+/9qUfXvcC2JK98RRTy1SuFwFPHRE0RpIBCgu+vH09xs/B8rU9sT9a0fFuF/SruO/eF3HcmXUJ4I+uLtezxvhd9wKZRbrm+Poo/6Clhj+foPMpsX40Fus6BwgsaHiiuClO6GCq9uct54cESZWpd+0PxFd8DIFN2RFU57sxvUzIPkhJ5Txh6fkKX27/xJGPdZteJdZsbvNuWj/TyI0e0anSmPdM+DiywBJmrfBqxjxGAXhT6o2PgXbOO8lDX4WlxTDPBYabzJ1Nzq24Q/3eCh2KE5Kgf3e6hJkAbBhpLM2VC6hfcVUJr0+AMHZVmrvHXrYc9FjBVYOxwv5abaefrfp9Wu7MXEtUwpGqjuMgqDCWpcL7UM/Z7RYdcQuCMP6Jb8aASzwIFb2qACoeSRCr+m/IHEEjN83ELDm/zq8zWeqbnpu5HIqcx31xeDMbzha4o8bhp
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(39860400002)(136003)(46966006)(36840700001)(356005)(426003)(54906003)(186003)(82310400003)(6666004)(7636003)(26005)(47076005)(336012)(8936002)(2906002)(36906005)(110136005)(42186006)(316002)(83380400001)(2616005)(5660300002)(36860700001)(6266002)(82740400003)(478600001)(8676002)(70206006)(70586007)(4326008)(107886003)(36756003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 08:30:41.8913
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b2628ff-7c45-45f0-eddc-08d90568ea8d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT008.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7205
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Adding pinctrl support to query platform specific information (pins)
from firmware.

Signed-off-by: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
Acked-by: Michal Simek <michal.simek@xilinx.com>
---
 drivers/firmware/xilinx/zynqmp.c     | 114 +++++++++++++++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h |  90 +++++++++++++++++++++
 2 files changed, 204 insertions(+)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index 7eb9958662dd..fc01a3632815 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -811,6 +811,120 @@ int zynqmp_pm_fpga_get_status(u32 *value)
 }
 EXPORT_SYMBOL_GPL(zynqmp_pm_fpga_get_status);
 
+/**
+ * zynqmp_pm_pinctrl_request - Request Pin from firmware
+ * @pin: Pin number to request
+ *
+ * This function requests pin from firmware.
+ *
+ * Return: Returns status, either success or error+reason.
+ */
+int zynqmp_pm_pinctrl_request(const u32 pin)
+{
+	return zynqmp_pm_invoke_fn(PM_PINCTRL_REQUEST, pin, 0, 0, 0, NULL);
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_pinctrl_request);
+
+/**
+ * zynqmp_pm_pinctrl_release - Inform firmware that Pin control is released
+ * @pin: Pin number to release
+ *
+ * This function release pin from firmware.
+ *
+ * Return: Returns status, either success or error+reason.
+ */
+int zynqmp_pm_pinctrl_release(const u32 pin)
+{
+	return zynqmp_pm_invoke_fn(PM_PINCTRL_RELEASE, pin, 0, 0, 0, NULL);
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_pinctrl_release);
+
+/**
+ * zynqmp_pm_pinctrl_get_function - Read function id set for the given pin
+ * @pin: Pin number
+ * @id: Buffer to store function ID
+ *
+ * This function provides the function currently set for the given pin.
+ *
+ * Return: Returns status, either success or error+reason
+ */
+int zynqmp_pm_pinctrl_get_function(const u32 pin, u32 *id)
+{
+	u32 ret_payload[PAYLOAD_ARG_CNT];
+	int ret;
+
+	if (!id)
+		return -EINVAL;
+
+	ret = zynqmp_pm_invoke_fn(PM_PINCTRL_GET_FUNCTION, pin, 0,
+				  0, 0, ret_payload);
+	*id = ret_payload[1];
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_pinctrl_get_function);
+
+/**
+ * zynqmp_pm_pinctrl_set_function - Set requested function for the pin
+ * @pin: Pin number
+ * @id: Function ID to set
+ *
+ * This function sets requested function for the given pin.
+ *
+ * Return: Returns status, either success or error+reason.
+ */
+int zynqmp_pm_pinctrl_set_function(const u32 pin, const u32 id)
+{
+	return zynqmp_pm_invoke_fn(PM_PINCTRL_SET_FUNCTION, pin, id,
+				   0, 0, NULL);
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_pinctrl_set_function);
+
+/**
+ * zynqmp_pm_pinctrl_get_config - Get configuration parameter for the pin
+ * @pin: Pin number
+ * @param: Parameter to get
+ * @value: Buffer to store parameter value
+ *
+ * This function gets requested configuration parameter for the given pin.
+ *
+ * Return: Returns status, either success or error+reason.
+ */
+int zynqmp_pm_pinctrl_get_config(const u32 pin, const u32 param,
+				 u32 *value)
+{
+	u32 ret_payload[PAYLOAD_ARG_CNT];
+	int ret;
+
+	if (!value)
+		return -EINVAL;
+
+	ret = zynqmp_pm_invoke_fn(PM_PINCTRL_CONFIG_PARAM_GET, pin, param,
+				  0, 0, ret_payload);
+	*value = ret_payload[1];
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_pinctrl_get_config);
+
+/**
+ * zynqmp_pm_pinctrl_set_config - Set configuration parameter for the pin
+ * @pin: Pin number
+ * @param: Parameter to set
+ * @value: Parameter value to set
+ *
+ * This function sets requested configuration parameter for the given pin.
+ *
+ * Return: Returns status, either success or error+reason.
+ */
+int zynqmp_pm_pinctrl_set_config(const u32 pin, const u32 param,
+				 u32 value)
+{
+	return zynqmp_pm_invoke_fn(PM_PINCTRL_CONFIG_PARAM_SET, pin,
+				   param, value, 0, NULL);
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_pinctrl_set_config);
+
 /**
  * zynqmp_pm_init_finalize() - PM call to inform firmware that the caller
  *			       master has initialized its own power management
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index 71177b17eee5..8285a4bcfc2d 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -72,6 +72,12 @@ enum pm_api_id {
 	PM_FPGA_LOAD = 22,
 	PM_FPGA_GET_STATUS = 23,
 	PM_GET_CHIPID = 24,
+	PM_PINCTRL_REQUEST = 28,
+	PM_PINCTRL_RELEASE = 29,
+	PM_PINCTRL_GET_FUNCTION = 30,
+	PM_PINCTRL_SET_FUNCTION = 31,
+	PM_PINCTRL_CONFIG_PARAM_GET = 32,
+	PM_PINCTRL_CONFIG_PARAM_SET = 33,
 	PM_IOCTL = 34,
 	PM_QUERY_DATA = 35,
 	PM_CLOCK_ENABLE = 36,
@@ -122,6 +128,12 @@ enum pm_query_id {
 	PM_QID_CLOCK_GET_FIXEDFACTOR_PARAMS = 3,
 	PM_QID_CLOCK_GET_PARENTS = 4,
 	PM_QID_CLOCK_GET_ATTRIBUTES = 5,
+	PM_QID_PINCTRL_GET_NUM_PINS = 6,
+	PM_QID_PINCTRL_GET_NUM_FUNCTIONS = 7,
+	PM_QID_PINCTRL_GET_NUM_FUNCTION_GROUPS = 8,
+	PM_QID_PINCTRL_GET_FUNCTION_NAME = 9,
+	PM_QID_PINCTRL_GET_FUNCTION_GROUPS = 10,
+	PM_QID_PINCTRL_GET_PIN_GROUPS = 11,
 	PM_QID_CLOCK_GET_NUM_CLOCKS = 12,
 	PM_QID_CLOCK_GET_MAX_DIVISOR = 13,
 };
@@ -285,6 +297,44 @@ enum dll_reset_type {
 	PM_DLL_RESET_PULSE = 2,
 };
 
+enum pm_pinctrl_config_param {
+	PM_PINCTRL_CONFIG_SLEW_RATE = 0,
+	PM_PINCTRL_CONFIG_BIAS_STATUS = 1,
+	PM_PINCTRL_CONFIG_PULL_CTRL = 2,
+	PM_PINCTRL_CONFIG_SCHMITT_CMOS = 3,
+	PM_PINCTRL_CONFIG_DRIVE_STRENGTH = 4,
+	PM_PINCTRL_CONFIG_VOLTAGE_STATUS = 5,
+	PM_PINCTRL_CONFIG_TRI_STATE = 6,
+	PM_PINCTRL_CONFIG_MAX = 7,
+};
+
+enum pm_pinctrl_slew_rate {
+	PM_PINCTRL_SLEW_RATE_FAST = 0,
+	PM_PINCTRL_SLEW_RATE_SLOW = 1,
+};
+
+enum pm_pinctrl_bias_status {
+	PM_PINCTRL_BIAS_DISABLE = 0,
+	PM_PINCTRL_BIAS_ENABLE = 1,
+};
+
+enum pm_pinctrl_pull_ctrl {
+	PM_PINCTRL_BIAS_PULL_DOWN = 0,
+	PM_PINCTRL_BIAS_PULL_UP = 1,
+};
+
+enum pm_pinctrl_schmitt_cmos {
+	PM_PINCTRL_INPUT_TYPE_CMOS = 0,
+	PM_PINCTRL_INPUT_TYPE_SCHMITT = 1,
+};
+
+enum pm_pinctrl_drive_strength {
+	PM_PINCTRL_DRIVE_STRENGTH_2MA = 0,
+	PM_PINCTRL_DRIVE_STRENGTH_4MA = 1,
+	PM_PINCTRL_DRIVE_STRENGTH_8MA = 2,
+	PM_PINCTRL_DRIVE_STRENGTH_12MA = 3,
+};
+
 enum zynqmp_pm_shutdown_type {
 	ZYNQMP_PM_SHUTDOWN_TYPE_SHUTDOWN = 0,
 	ZYNQMP_PM_SHUTDOWN_TYPE_RESET = 1,
@@ -353,6 +403,14 @@ int zynqmp_pm_write_pggs(u32 index, u32 value);
 int zynqmp_pm_read_pggs(u32 index, u32 *value);
 int zynqmp_pm_system_shutdown(const u32 type, const u32 subtype);
 int zynqmp_pm_set_boot_health_status(u32 value);
+int zynqmp_pm_pinctrl_request(const u32 pin);
+int zynqmp_pm_pinctrl_release(const u32 pin);
+int zynqmp_pm_pinctrl_get_function(const u32 pin, u32 *id);
+int zynqmp_pm_pinctrl_set_function(const u32 pin, const u32 id);
+int zynqmp_pm_pinctrl_get_config(const u32 pin, const u32 param,
+				 u32 *value);
+int zynqmp_pm_pinctrl_set_config(const u32 pin, const u32 param,
+				 u32 value);
 #else
 static inline struct zynqmp_eemi_ops *zynqmp_pm_get_eemi_ops(void)
 {
@@ -537,6 +595,38 @@ static inline int zynqmp_pm_set_boot_health_status(u32 value)
 {
 	return -ENODEV;
 }
+
+static inline int zynqmp_pm_pinctrl_request(const u32 pin)
+{
+	return -ENODEV;
+}
+
+static inline int zynqmp_pm_pinctrl_release(const u32 pin)
+{
+	return -ENODEV;
+}
+
+static inline int zynqmp_pm_pinctrl_get_function(const u32 pin, u32 *id)
+{
+	return -ENODEV;
+}
+
+static inline int zynqmp_pm_pinctrl_set_function(const u32 pin, const u32 id)
+{
+	return -ENODEV;
+}
+
+static inline int zynqmp_pm_pinctrl_get_config(const u32 pin, const u32 param,
+					       u32 *value)
+{
+	return -ENODEV;
+}
+
+static inline int zynqmp_pm_pinctrl_set_config(const u32 pin, const u32 param,
+					       u32 value)
+{
+	return -ENODEV;
+}
 #endif
 
 #endif /* __FIRMWARE_ZYNQMP_H__ */
-- 
2.17.1

