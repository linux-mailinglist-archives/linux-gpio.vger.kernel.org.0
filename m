Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCDC933EB6C
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Mar 2021 09:27:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbhCQI02 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Mar 2021 04:26:28 -0400
Received: from mail-dm6nam08on2050.outbound.protection.outlook.com ([40.107.102.50]:53641
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229623AbhCQI0D (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 17 Mar 2021 04:26:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jlwwZG8kNQtrUPdVaUM5DHQECA2eLvA54pF9C9Gr/poPfpFPsTywxzHE5uVQl5qPWGaAsGVllE1C9ibAWQVuvckDZnVGZxRZa/pgWAGjOMB5GGpP6XXevjee1Dp49Xyudsd3jvGcmsFDYI7pG8gwFYKO+oC7+CMT+lx6o50eKXTtCR6MIBbfHAN0Y5dnrGkThkzAWwKynCM8GqX+88OgrmDck53ds9JSSxapFu0j0RKyJ9loeA9lI6U+tMiBrZ/2jit8bBp7ZGLhYt5gzSs+eqaT3ko/9IAEg9jiBbqKUOSXViH6omvmJ3wAs+QHr1P9svVXqjN5eTnC6kSG6lavzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKfbL98kJOR7zZyGmAelGNS2XEaKVhy9s2DcMA730TY=;
 b=fXnZR+ggeTxUXKYsU1ab4roCQnuX4GJ0lsWlI/axGe7y0QckKZAiiG732QoI4qFOlYErPyRpq6lVp6f4AOr08ZNxtantIZiK8uHTPx4hyXlgdEv/WzxZNBQlY+r/TsyxUIHGthllsFrcPN1WiX7XUR+UyHXvSEMAioRwZ1WDxOpz2bnqNNteReMSj7X9LgFyzx7lDpvAnCyLB2vJ1SVLgs12aC27B44UtcLtW1KEzKgBqMonGHPbX6B0vxtuns2IufnWwRHpI4ARncQNQHTJTi6rDZ7kC1KIajNtIEwh57yY2XLxX+h7nZ7MWtiAh5n0oO3UPmNWuvGd50KPQloz0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKfbL98kJOR7zZyGmAelGNS2XEaKVhy9s2DcMA730TY=;
 b=YSW7tMIuyg0QxCDlhjtFDJzPx7VrrLQVBQeOwFsySEQ8NsUs8tse02URnyR/9Umr8hsD4ZGvDz40OzoN/9XeIsSkVm/+8pSXIAxq9piHfNt0HuiB+KnCBdR7HIj9zVt/GV65JuZ2PGcy6lSaLjmJV49HtkYZh+NBjWQuxJW65Os=
Received: from SN4PR0401CA0033.namprd04.prod.outlook.com
 (2603:10b6:803:2a::19) by SA0PR02MB7337.namprd02.prod.outlook.com
 (2603:10b6:806:ed::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 17 Mar
 2021 08:25:59 +0000
Received: from SN1NAM02FT014.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:2a:cafe::69) by SN4PR0401CA0033.outlook.office365.com
 (2603:10b6:803:2a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Wed, 17 Mar 2021 08:25:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT014.mail.protection.outlook.com (10.152.72.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3933.32 via Frontend Transport; Wed, 17 Mar 2021 08:25:58 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 17 Mar 2021 01:25:40 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Wed, 17 Mar 2021 01:25:40 -0700
Envelope-to: git@xilinx.com,
 saikrishna12468@gmail.com,
 robh+dt@kernel.org,
 linus.walleij@linaro.org,
 gregkh@linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.106] (port=50128 helo=xhdvnc125.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <lakshmi.sai.krishna.potthuri@xilinx.com>)
        id 1lMRUo-0008Bc-Ks; Wed, 17 Mar 2021 01:25:39 -0700
Received: by xhdvnc125.xilinx.com (Postfix, from userid 14964)
        id C154C1210A8; Wed, 17 Mar 2021 13:55:24 +0530 (IST)
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
Subject: [PATCH v4 1/3] firmware: xilinx: Add pinctrl support
Date:   Wed, 17 Mar 2021 13:55:14 +0530
Message-ID: <1615969516-87663-2-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1615969516-87663-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
References: <1615969516-87663-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14f0fae3-1c51-4da2-15f2-08d8e91e4b05
X-MS-TrafficTypeDiagnostic: SA0PR02MB7337:
X-Microsoft-Antispam-PRVS: <SA0PR02MB73379E061C326E25669F1C6FBD6A9@SA0PR02MB7337.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WCbnUD55PLh3Ftq12Z/MJkiV7Lho7Eww3OeF476h/+2ecWiOHU9UnnvvCnAKKakJGRqvoImPs/msprhl3T/4uTvW86W5XA+DRAKmI/I4ete/WaMJTAE9KdBn60/5Fd+wbdT5fuutoQYvUh2pooxurBtO4oTAqYXnmvJkJDOEodvioXsGhffwlfKo77DMvTOD51tUHuRaambgb8qREc3DbBW9q6g7Z/5GwgfZzmvK476gFUljpIB98j2VgGm4fgZd9gTs1VAYqGEPE0izeXh/GcJbmbNcSYIpoGy5GARnwWc/aBSmKYbUQgthnX1z/DtXZVNzt2OZ99ajyQVVdWkWkpg1YW5sBTIpnM+sA8mB+EQmrA883pu2sC2QFDlbdxKXHGzBeeR/4TwkjP8GBpwDwdGBvgxHfsB5eP8aUA8Et5qemClUmmB7edZg/tJ9mAwW5/lKdNcylwNpUGYGgxLF/4Z5BGT78S445BlcTSmYEtGrwbiyv8aZu3asrIs9v0Ng84/asR6DBSIOp2pmZEqSB/Y++4WaHIa2pMYaws9P3CY8aTgU2d5C6hcOSmr8X0KTekiyYav5b8SsPo2mn4VrYY7Wok56a4YbFb6jbrxnuuc49bh+02kfws8Hzlc3tglmCfckkHjWmf92d3O1HK3jo4cBzuwC1nyFq9A2/ZCNNy3bHPqY3Op2F67EQbzmMHle
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(346002)(39860400002)(46966006)(36840700001)(5660300002)(8936002)(478600001)(426003)(26005)(47076005)(36906005)(8676002)(316002)(42186006)(356005)(2616005)(36860700001)(2906002)(36756003)(6266002)(70586007)(54906003)(107886003)(110136005)(83380400001)(82740400003)(336012)(82310400003)(70206006)(7636003)(4326008)(6666004)(186003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 08:25:58.9030
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14f0fae3-1c51-4da2-15f2-08d8e91e4b05
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT014.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7337
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
index efb8a66efc68..299c3d5a9ebd 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -784,6 +784,120 @@ int zynqmp_pm_fpga_get_status(u32 *value)
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
index 5968df82b991..75aa6a5afa28 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -74,6 +74,12 @@ enum pm_api_id {
 	PM_FPGA_LOAD,
 	PM_FPGA_GET_STATUS,
 	PM_GET_CHIPID = 24,
+	PM_PINCTRL_REQUEST = 28,
+	PM_PINCTRL_RELEASE = 29,
+	PM_PINCTRL_GET_FUNCTION = 30,
+	PM_PINCTRL_SET_FUNCTION = 31,
+	PM_PINCTRL_CONFIG_PARAM_GET = 32,
+	PM_PINCTRL_CONFIG_PARAM_SET = 33,
 	PM_IOCTL = 34,
 	PM_QUERY_DATA,
 	PM_CLOCK_ENABLE,
@@ -125,6 +131,12 @@ enum pm_query_id {
 	PM_QID_CLOCK_GET_FIXEDFACTOR_PARAMS,
 	PM_QID_CLOCK_GET_PARENTS,
 	PM_QID_CLOCK_GET_ATTRIBUTES,
+	PM_QID_PINCTRL_GET_NUM_PINS = 6,
+	PM_QID_PINCTRL_GET_NUM_FUNCTIONS = 7,
+	PM_QID_PINCTRL_GET_NUM_FUNCTION_GROUPS = 8,
+	PM_QID_PINCTRL_GET_FUNCTION_NAME = 9,
+	PM_QID_PINCTRL_GET_FUNCTION_GROUPS = 10,
+	PM_QID_PINCTRL_GET_PIN_GROUPS = 11,
 	PM_QID_CLOCK_GET_NUM_CLOCKS = 12,
 	PM_QID_CLOCK_GET_MAX_DIVISOR,
 };
@@ -288,6 +300,44 @@ enum dll_reset_type {
 	PM_DLL_RESET_PULSE,
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
 	ZYNQMP_PM_SHUTDOWN_TYPE_SHUTDOWN,
 	ZYNQMP_PM_SHUTDOWN_TYPE_RESET,
@@ -357,6 +407,14 @@ int zynqmp_pm_write_pggs(u32 index, u32 value);
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
@@ -507,6 +565,38 @@ static inline int zynqmp_pm_set_boot_health_status(u32 value)
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

