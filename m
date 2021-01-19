Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC312FB268
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jan 2021 08:06:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730106AbhASHGk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Jan 2021 02:06:40 -0500
Received: from mail-dm6nam10on2073.outbound.protection.outlook.com ([40.107.93.73]:22753
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2390269AbhASF3A (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 19 Jan 2021 00:29:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NjHTA3uXTR/84p9NIybVCicful717H4FUJUUf+dE3q9qNRTTDBdXpRc1dq3UAuo/wB1GN0cy5oxpGTyk3Sc5mfM5+h10naPGFF4OkS4uitX1gQu9naqEjQzvYbm74Wa5VSSmuRJLEyaz+bqo4dcIMu1gmFEjJFWGeCnNQgYC4jv7+A+fZgKgZm0ALz6I2MapewsTBbzksZXOlSzbsHLWk4ZvnZ0e1y7CeCnxzsKxkmAZv7s9VGUkGuMacXlCxh1yf0Dd5QSE6qzqJHqprGn9lWWwvjI7X73QtqWpOLUMtqWYzrTWzE1/9IsrdraRwi6SzSX9UEP6bl/TMdjPnTJTRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQuKc6HhhEEWxlv87rZMKTllpVHcejDU0WhNarRb3Qs=;
 b=K6wRpGBf0B1j5MdUx5OLhgVq99AJQKuSNe0X6UCjiUU8zuVvdnBocYgr8qVVOwfgSubHX9+0I9atdCHTaNaXqhP57/TohUfvF7opJgNFSF1mgqcDkWdj8e10bwwIn4uxS8jjBTftTY17U79ykLztIoT9mCRn5UASBhQ5RX0itSxF3LNSv8rRZyuGeV6indZ8aRZ8HvPjUCL1mxM42VlJQPGengOWNEUaAGy6m7uyJfazQTXbfQUgpV77dZMS3qgrdJd+FFDEKkJ+2szyBedVSNhKKuhaHwLxxPr8+Yqcd//IQvqFeuKqCBKXhunY7y5xbabMhvES3/1fWQYFl/2d3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQuKc6HhhEEWxlv87rZMKTllpVHcejDU0WhNarRb3Qs=;
 b=RThIsdLKw8dXUcbaR7qu8yoaunVwEMQqwfKoE4UBnbjGdwgeO//jE6W/ztQL2hxBTaRNZthuLIeB2hN9opg6/4OCTX+ZnydUCSS5+9L6PQB+nRGLFLKuOzoiGfkihnQRJx44ssLpI4Z1HYxnz0RpYAXW8mMT5C7msbtHiCDOv6I=
Received: from SA0PR11CA0073.namprd11.prod.outlook.com (2603:10b6:806:d2::18)
 by DM6PR02MB6682.namprd02.prod.outlook.com (2603:10b6:5:214::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Tue, 19 Jan
 2021 05:28:04 +0000
Received: from SN1NAM02FT034.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:d2:cafe::df) by SA0PR11CA0073.outlook.office365.com
 (2603:10b6:806:d2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend
 Transport; Tue, 19 Jan 2021 05:28:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT034.mail.protection.outlook.com (10.152.72.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3763.12 via Frontend Transport; Tue, 19 Jan 2021 05:28:03 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 18 Jan 2021 21:27:59 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 18 Jan 2021 21:27:59 -0800
Envelope-to: git@xilinx.com,
 michal.simek@xilinx.com,
 saikrishna12468@gmail.com,
 robh+dt@kernel.org,
 linus.walleij@linaro.org,
 gregkh@linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.106] (port=37103 helo=xhdvnc125.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <lakshmi.sai.krishna.potthuri@xilinx.com>)
        id 1l1jYc-0003ZV-1P; Mon, 18 Jan 2021 21:27:58 -0800
Received: by xhdvnc125.xilinx.com (Postfix, from userid 14964)
        id 1838C1222D6; Tue, 19 Jan 2021 10:57:44 +0530 (IST)
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
Subject: [PATCH v2 1/3] firmware: xilinx: Added pinctrl support
Date:   Tue, 19 Jan 2021 10:57:32 +0530
Message-ID: <1611034054-63867-2-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1611034054-63867-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
References: <1611034054-63867-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54d63138-8e7f-4957-80a8-08d8bc3afeba
X-MS-TrafficTypeDiagnostic: DM6PR02MB6682:
X-Microsoft-Antispam-PRVS: <DM6PR02MB66825309502C545FB76CE7B9BDA30@DM6PR02MB6682.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z9Www9KY9blTIvdnPKRmWZFj0bQP4zojRHQsZsC1CFoXhMmr+qqNa6uCFMuBHSeVyTMxXi0Kz+ATgJGSOARnO4iFghgwwPTnxWKZuBXiSRtb5soYw2PzBBbzKZFO+tsH4m6hqZc79iCwwkPSg4CjFsHjkM8l4HRWIRnFIHUgKrJX6hYOXJrbQlmI1TUx4oqib6SD4S07n2oEWgf3FqSQ1rNwAfRaVfPRh81JV6iIZHhVzHU1F65+kDQVbET8OYqjoQKgnUQgKY5gjex5WfHtSohJYqgHBAltJY/OkvMg/a9JZSp8uEzvyrgeQeLlTSBgYJdL8AKxfcJfXHQhXCE4JsZbBUKcFOeAdEGoKbNWmsQUvABJsRzvbpk8F0Z4s/iFYyYYQrnPN3ofjzOpwhVBGbpsBlszUFZy88xlgzYsElDQPSw/RTLx3lPGySHL7ySHmEf67kxLis7E9BHJ+TH3kceh3KFkVV6R7OVa0MkHLKz+cd2BN0LsdlwMJjnfYJXe
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(376002)(39860400002)(46966006)(2906002)(6666004)(82310400003)(316002)(36906005)(42186006)(8936002)(70206006)(36756003)(110136005)(26005)(5660300002)(70586007)(82740400003)(6266002)(478600001)(83380400001)(426003)(8676002)(4326008)(7636003)(107886003)(47076005)(336012)(2616005)(356005)(54906003)(186003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 05:28:03.9872
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54d63138-8e7f-4957-80a8-08d8bc3afeba
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT034.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6682
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add pinctrl support to query platform specific information (pins)
from firmware.

Signed-off-by: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
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

