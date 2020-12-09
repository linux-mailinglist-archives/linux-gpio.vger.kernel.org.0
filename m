Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6F452D3DB8
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 09:43:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728050AbgLIImT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 03:42:19 -0500
Received: from mail-mw2nam12on2060.outbound.protection.outlook.com ([40.107.244.60]:62688
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727854AbgLIImI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 9 Dec 2020 03:42:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X3owdU9S5gATgnnyUGJpmfbptICxJ0L2zx8dWANLTNu5DmYHz5I4PpdbbOtqBgkeZrWRjdpSoiDpDJEVuGFzXgWO0jsppJEHaBiZ37BYuy1hp5EV/pjaJR5mSGrgZG20LPEPlC5o9xBxnddrSyhuf1gy6IujPHCc5zsHlPQTozQG57sZSJRQvH9UsQgD/OYLdJjn+v5pEBu5fb03++6Q5McgEjFhYk1Nd5+7Cx4LgCoelt0Lj2jJJEEAK70ajTuPy+D2OlxZavGBKv7f3pSH0K77V+EY3PoLD7/t0/ZhANkp+C1KXTrC1KPV4LYNo8+YngcuUl36BYnbNkiP3x9ERA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQuKc6HhhEEWxlv87rZMKTllpVHcejDU0WhNarRb3Qs=;
 b=CHizbIMcIdc6vJPTyziCIbWBBmpJkE6L9oK5jGFwvawceFAiYDLibnEDBrLNJvPGtu+ogiPkEslPA/xgHuLhcYcZCpetT4CmzaCSD87yl4987P9J21OTkmCU/U9rrgLFBSLn4xko9GWufY1YTQCICMLCuDFKu+D+HIVHXM7ggpaIBcvsNk+VZJCC4Fd7YU4QbBx3iyiPmMhW7IkcjizXN5ZRztE7UVzL1KX/HTp0zyL3X01nsn9kMKXZyBW6mkGbg5hHuyMCgYizKMRPcR9m6jwQRnvY0ziLSU1NW576Zfxko8kaOYoEcTPZiyY6aw35SEegqepZ0afyGfooZyQ1wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQuKc6HhhEEWxlv87rZMKTllpVHcejDU0WhNarRb3Qs=;
 b=CzmYgY96cMgOHyqhxEw8VRMmOxWjgjpdi8eSFgt7E783IAwmUqTgS6VDePgwM7ZP7Udda3ZNioNczc9XDvbtHCz31f+UEnSfoKxQMce4XN+bBCaNksNUNV4t/HySwOObsHs9Wy2HwuYeHpbsXHHh91JK3IW0KCFIiHbqncfvdb4=
Received: from SN4PR0401CA0005.namprd04.prod.outlook.com
 (2603:10b6:803:21::15) by SA2PR02MB7674.namprd02.prod.outlook.com
 (2603:10b6:806:149::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Wed, 9 Dec
 2020 08:41:14 +0000
Received: from SN1NAM02FT063.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:21:cafe::8) by SN4PR0401CA0005.outlook.office365.com
 (2603:10b6:803:21::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 9 Dec 2020 08:41:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT063.mail.protection.outlook.com (10.152.72.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3632.21 via Frontend Transport; Wed, 9 Dec 2020 08:41:14 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 9 Dec 2020 00:41:06 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 9 Dec 2020 00:41:06 -0800
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
Received: from [10.140.6.35] (port=50858 helo=xhdsaipava40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <lakshmi.sai.krishna.potthuri@xilinx.com>)
        id 1kmv21-0001cW-11; Wed, 09 Dec 2020 00:41:05 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14964)
        id C3A2A13C0138; Wed,  9 Dec 2020 14:15:20 +0530 (IST)
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
Subject: [PATCH 1/3] firmware: xilinx: Added pinctrl support
Date:   Wed, 9 Dec 2020 14:14:12 +0530
Message-ID: <1607503454-26503-2-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607503454-26503-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
References: <1607503454-26503-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a48e13e8-33a3-4cf8-efa4-08d89c1e3070
X-MS-TrafficTypeDiagnostic: SA2PR02MB7674:
X-Microsoft-Antispam-PRVS: <SA2PR02MB7674C176FC77125D02F239DFBDCC0@SA2PR02MB7674.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y3CTwELP5D+KSBbyJET2yNpBmpoNJjpdVZrucRZ1wl6GbPF5hctU7KmNYb0qIF1qqiBOabVWnko/6CmYlbaGe4BHECri2RcRVEOICkx+uVQpzoQFsjwDk8gurFj3ocWY/X5ACusnCDp+0m1Jr6/BGWUPlc6tZBWyrP6oykjsM9evi9fq0igXER0kAzD/jA0dSNRahHGTXfBaojsMyqobLhRhZ1WzppACK/5/fIb5M/uAupcKP0OHcsdFGeY2qs1KaKIUFYs0rcyI4moy9q43KEBC1nmEXkQJIW9ZKqOu2OmN5av0orStdSoxbePyR7sAJXKQqFdxJoNBxMCkr55MF7Tr8LCvkA2Ab5N5XLZx402W89KHXOg8EdYVYDkUlCUKuRNLGDL6NtOPqli5c5ceqlHl5MuJbv/DsvHNin8BV98=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(46966005)(70206006)(5660300002)(2906002)(47076004)(186003)(107886003)(83380400001)(42186006)(7636003)(36906005)(8936002)(8676002)(4326008)(426003)(356005)(6266002)(54906003)(6666004)(508600001)(110136005)(70586007)(26005)(36756003)(2616005)(82310400003)(336012)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 08:41:14.7775
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a48e13e8-33a3-4cf8-efa4-08d89c1e3070
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT063.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7674
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

