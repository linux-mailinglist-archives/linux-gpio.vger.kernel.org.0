Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7481E319DEE
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Feb 2021 13:12:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbhBLMJm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Feb 2021 07:09:42 -0500
Received: from mail-bn7nam10on2071.outbound.protection.outlook.com ([40.107.92.71]:46336
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230291AbhBLMJg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Feb 2021 07:09:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lu5+bcG6ueG/XKnTYSSKssehRmbPKLlLtLYYHUD+xKJfsR9xjxofOLjUZdKV4LIYg61mGC5cu6E4PoWDKvjVvu7rCPebekMRs04Zsj0AhPUL5CrOCp6uecaAEGi6Kv759WEtP750YTe/MHnZOH+CM2VF6WSO8mulBSUPPcUku6R8Rhs7qqi8kNKbN45CdSHnEEssQI2Ocflp1h/7Vl/XsZVq6H0rRKCWT1JJDoF3LXewLI+CkbT3RmDZJBINtf8MaWlVHjpXGLEPNUjiI4WAswGWC3kgjIKUO1u2VQTeW0ZHprMxBV/d72FUIqh7dyAi6n3QLZPpQ0+yUfp5Yp7QVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKfbL98kJOR7zZyGmAelGNS2XEaKVhy9s2DcMA730TY=;
 b=Tks0VaoboDoSmbP65rbrBFkc9UJuNLNcwck/aEYp0t9+US/K+oEN+161KXsUD+PGI0Zn2yH/wy6PwzLPjxrLVXJp/muNbqpSCUI/hPcDZust1x3X+Xy8o7QxMFLgEoJxK9ize7lr5O7PK1u8Zp2ZrHIk1lm54ikk5eJjOGfvqD0nOEYQOkxe2O8cSEn492H2LK+9oZC5IE3IbnK43/ZnQLfckPfOOgxD6X51ukb/gquv92euZaDAYEile/vIvo35SK8BR9sP/BlVarKTDyFyIWmDXVeYmb52BfBLDepRKZP81F+QwI8YcCr1XKxEj+9RZWXGN1redgVn+MY+wNQMsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKfbL98kJOR7zZyGmAelGNS2XEaKVhy9s2DcMA730TY=;
 b=Zb5/iptZ1QnBd9/K5ViX3FxLOFkHuHSeRjpLBt9q4w9qNEawWpdypkacUI1f8CEgatA//m0UXscdEtQZLwRPsGRLuRENhSaW7GweViu1Rz2qyvYnaUaUJcO3BYpfbG0mcIq0Z40NXS76XJWFA9OdQgSyQ2icyjgIZx4yh6+/Xas=
Received: from MN2PR01CA0066.prod.exchangelabs.com (2603:10b6:208:23f::35) by
 DM5PR0201MB3464.namprd02.prod.outlook.com (2603:10b6:4:77::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.23; Fri, 12 Feb 2021 12:08:42 +0000
Received: from BL2NAM02FT056.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:23f:cafe::44) by MN2PR01CA0066.outlook.office365.com
 (2603:10b6:208:23f::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Fri, 12 Feb 2021 12:08:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT056.mail.protection.outlook.com (10.152.77.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3846.25 via Frontend Transport; Fri, 12 Feb 2021 12:08:42 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Fri, 12 Feb 2021 04:08:24 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Fri, 12 Feb 2021 04:08:24 -0800
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
Received: from [172.23.64.106] (port=53731 helo=xhdvnc125.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <lakshmi.sai.krishna.potthuri@xilinx.com>)
        id 1lAXFH-000339-BQ; Fri, 12 Feb 2021 04:08:24 -0800
Received: by xhdvnc125.xilinx.com (Postfix, from userid 14964)
        id 429BA121056; Fri, 12 Feb 2021 17:38:09 +0530 (IST)
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
Subject: [PATCH v3 1/3] firmware: xilinx: Add pinctrl support
Date:   Fri, 12 Feb 2021 17:37:21 +0530
Message-ID: <1613131643-60062-2-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1613131643-60062-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
References: <1613131643-60062-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3fe5d2d6-41a4-459e-b21c-08d8cf4ef07d
X-MS-TrafficTypeDiagnostic: DM5PR0201MB3464:
X-Microsoft-Antispam-PRVS: <DM5PR0201MB34644B2BDE0FEAD4AB3D0AEFBD8B9@DM5PR0201MB3464.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4KbcJ2i8+6tMkfTRMf4LkrR3WJRp+k3j/4B7grWdOyRpERBjEbQDr0uVns3gpMUJ5PNlXsF3tF7AwYhRaZKyc3jdGpjHqjIZ+9y2uONEeKlmsm1lKeDyzi4F0bihGkugg17tdvWso9WauChTOtEPGQVG2D9v3eOwubIf/UzZx7bG9bUYLInTFfQX9YocNzPN6HzH7d2CkVPyzRq9e1S2JyOpvzdtkn0hvIrqPRvTOtPqYlhvv92pxwleZmz7u5+a4+BOsQejRthfhO1U64oNL/TZXhOVxQUrlbGlSPOvCkG/Rcvpgz1p0FXxIH9S25shLQK3NZxpJyoa1Rj+WWkb6NoXK6jfgwD+nlYsO4F1fh9YvFfrVnKysM5JTSXOuR8YDGX5WSX6Dxx158YEF0XDRPDP4mBuR2vaA/oPKr4MgJZWLBDgPHfWsXnk5NdfjSi5qjafZUV255PAY2AapibZhtUr75fJIPHEbm/pGXMNIN9xZUOEz10vfKd3wfSYZsX+pi7+F4YZBizLBWu+nsJjLD77+guWm0LSBAT1TfWc80UfbSghQOmjVkUjThshtAs+GcCH6W8anJAjdmETB9yQ1ufzBUUvnAeSnnR1tFKRSAbklbH5BZMsadH+crBP+uSSY/RK4HEqbDdH4OMSw2npPmhXrrq1vkIiNC+10N3pRw1wXLiuRjS5P20mlxRINpVw
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(36840700001)(46966006)(47076005)(6266002)(2906002)(4326008)(8676002)(54906003)(107886003)(356005)(70586007)(83380400001)(82310400003)(82740400003)(70206006)(6666004)(186003)(2616005)(36860700001)(26005)(5660300002)(478600001)(110136005)(36906005)(316002)(426003)(42186006)(336012)(8936002)(7636003)(36756003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2021 12:08:42.0684
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fe5d2d6-41a4-459e-b21c-08d8cf4ef07d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT056.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0201MB3464
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

