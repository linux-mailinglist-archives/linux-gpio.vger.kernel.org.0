Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 434683E1A9D
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Aug 2021 19:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240434AbhHERnU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Aug 2021 13:43:20 -0400
Received: from mail-bn8nam08on2045.outbound.protection.outlook.com ([40.107.100.45]:38625
        "EHLO NAM04-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240220AbhHERnO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 5 Aug 2021 13:43:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UIquILNDoRz+r4YVBHfXURDqyTAgMAeMNFx9lBrommmuzyXcArjYArc/qV9Z2W30ZlGlC+SlsAs0eamKw7mNmqBhMsIhYwKtkM6N2QslJUmAwxMzOLpmUvbSr96PJqIYNXLAbGvqpImKtDrCcLlueO6H3GDadq6estVxR/N8XCzv1OMMF01kmVRQSwEe3KHCSc+Cofzgcm5oLdjhDYgbLNT6c+Q1evgpw9sTnCyelZausYJOvoOKuGfldaW2v17Tydcp3dr8T3hHBHtZo5nrSxwuwLhhUtCNUQhHrdJpBM4hOg2iEmbXHdlK4wG8csfa7SAY6NCYcnbD4G2e1NBdUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGgrylPFRlZDl0LlZm5Ykwzr9e81ByYC48TKKUSOQeQ=;
 b=jzQJORI6C1/Tp3ApQRAr1HOIGJPeq4nkAeYk5Ql8lN4IRnZ2fLUkxP7EkrdP8GCc1/IZHhBZmYr4dhDuoJzxBbHguxIAHADWHV0ISRMs4kth4HENjEA48lJDhcZsNXHw0aimfz9yGQrz9FphT+mC0hG4wp/kiQuO9nMk6AIlIFxi1Z4smjFFELkHaXiNVFAJ+e3TsrFz6tM29gfSntthlzqRzN0Aw+BXCX54TJaIskOSrd0K7xPIAZCAAMAwm9MX38T1N1sdTOohrX/3QBkRxUz6nAKvM0s0i2xwl5G70yj9z7QqpQwRfWplmUAZnJX3/XFRhvwoTXFIl1wBgivXoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=arndb.de smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGgrylPFRlZDl0LlZm5Ykwzr9e81ByYC48TKKUSOQeQ=;
 b=dDYGcqMsyMHmEGtIeTblkPYe7ZcjVFAU9u9dqwpjuSA+qbCf9m7PBmnk8aIyDUIWAHTDz4+xSlCKuE+C+JtPAU/yVkJKrF1siym5pY1iL672w2rVVLPZJ0zSkHzYVDzslJc4zVBdSucXyTdLGMKfsvSniFPbH8AstOU9Ch/Tf9o=
Received: from SN4PR0501CA0105.namprd05.prod.outlook.com
 (2603:10b6:803:42::22) by CY4PR02MB2679.namprd02.prod.outlook.com
 (2603:10b6:903:126::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.25; Thu, 5 Aug
 2021 17:42:57 +0000
Received: from SN1NAM02FT0046.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:42:cafe::9b) by SN4PR0501CA0105.outlook.office365.com
 (2603:10b6:803:42::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.5 via Frontend
 Transport; Thu, 5 Aug 2021 17:42:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; arndb.de; dkim=none (message not signed)
 header.d=none;arndb.de; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0046.mail.protection.outlook.com (10.97.5.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4394.16 via Frontend Transport; Thu, 5 Aug 2021 17:42:57 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 5 Aug 2021 10:42:50 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 5 Aug 2021 10:42:50 -0700
Envelope-to: git@xilinx.com,
 arnd@arndb.de,
 zou_wei@huawei.com,
 gregkh@linuxfoundation.org,
 linus.walleij@linaro.org,
 iwamatsu@nigauri.org,
 bgolaszewski@baylibre.com,
 robh+dt@kernel.org,
 linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Received: from [10.140.6.35] (port=51088 helo=xhdsaipava40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <piyush.mehta@xilinx.com>)
        id 1mBhOL-0005Bw-Cf; Thu, 05 Aug 2021 10:42:49 -0700
From:   Piyush Mehta <piyush.mehta@xilinx.com>
To:     <arnd@arndb.de>, <zou_wei@huawei.com>,
        <gregkh@linuxfoundation.org>, <linus.walleij@linaro.org>,
        <michal.simek@xilinx.com>, <wendy.liang@xilinx.com>,
        <iwamatsu@nigauri.org>, <bgolaszewski@baylibre.com>,
        <robh+dt@kernel.org>, <rajan.vaja@xilinx.com>
CC:     <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <git@xilinx.com>, <sgoud@xilinx.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Piyush Mehta <piyush.mehta@xilinx.com>
Subject: [PATCH V2 1/3] firmware: zynqmp: Add MMIO read and write support for PS_MODE pin
Date:   Thu, 5 Aug 2021 23:12:17 +0530
Message-ID: <20210805174219.3000667-2-piyush.mehta@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210805174219.3000667-1-piyush.mehta@xilinx.com>
References: <20210805174219.3000667-1-piyush.mehta@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ceffa2d-5aec-457c-6e09-08d958387658
X-MS-TrafficTypeDiagnostic: CY4PR02MB2679:
X-Microsoft-Antispam-PRVS: <CY4PR02MB2679893027085783B22320B2D4F29@CY4PR02MB2679.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xXEO5Mch5j/c1D1r0HhvlvMt3Fnnuoh4BgYZNTDNVWRL20F9lw5oxrcRFTpZjC6GnRGgJSJ/EU783sLYVELMnuJarrQ61/CDSM72KBGXT6T1bHS659pPsIous2SEEeZIpP1F3S0hlyqzIrZOJ3KHexu4BCwORq7oH4T9wfoDUyI+RmMa562FRkmk9PNoaxbIYRRVs4Px7ow9TVpH2fUIuBW903EFUDXshXqaAQg9w2HR7cZcA5DdUB25ihwFPG9P+jI2dHmnvZPH7i3uQQ+LO8oFS0x17AVDzGI/ZpDs6ZcYYR6uaht8hr9KlDODoApWXl1CYxwfIiGZ58df7+0eFs7fD2F/DqDDM+GbZTH/RHKxl4Shb9dCTheRLtunOGo/LVucwc0craYuN/CDsKWzgru9NEWSuFExqbwQ7AFywBlJOeWPRINswoAXOa7kkPnPryRWFAXielwPi5pKiJaShmqthxI9pLS/XEraPhkeqnMjG4g34QNruF8kSWbBfb6p2S1FqYneObCEcGUubt17ntFp3qszjMdHPD0Hz0EM0sJtU7JnoQkfuSws595Hg6p5hNRjFwTuWlVrxibxOvRMCAUz2IUHvR+eehbINqXBaROdCWuA65W2lB9l64/N835xYRrr5rFOTHdonUKPS7lovNQhuhBrwL3/fLoJ9NOo0TyObbbMwbnOK6q19mF81ltAq+XkvHVN46qraMbZb2StX3Au4sKlu27VYOxLsmQv+okX/YFuRfIdA2MM41o7Wes4fciVLtUMZFhur6zwNWSdEH4ZCHq5SBZuHD+t+OXH50o=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(36840700001)(46966006)(4326008)(2906002)(356005)(336012)(36756003)(7416002)(44832011)(6666004)(426003)(478600001)(9786002)(82740400003)(1076003)(5660300002)(70586007)(47076005)(316002)(83380400001)(2616005)(110136005)(70206006)(186003)(82310400003)(26005)(54906003)(36906005)(8936002)(921005)(6636002)(36860700001)(8676002)(7696005)(107886003)(7636003)(102446001)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 17:42:57.5735
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ceffa2d-5aec-457c-6e09-08d958387658
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0046.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2679
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add Xilinx ZynqMP firmware MMIO APIs support to set and get PS_MODE
pins value and status. These APIs create an interface path between
mode pin controller driver and low-level API to access GPIO pins.

Signed-off-by: Piyush Mehta <piyush.mehta@xilinx.com>
---
Changes in v2:
- Added Xilinx ZynqMP firmware MMIO API support to set and get pin
  value and status.
---
 drivers/firmware/xilinx/zynqmp.c     | 46 ++++++++++++++++++++++++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h | 14 +++++++++++
 2 files changed, 60 insertions(+)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index 15b13832..0234423 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -28,6 +28,13 @@
 /* Max HashMap Order for PM API feature check (1<<7 = 128) */
 #define PM_API_FEATURE_CHECK_MAX_ORDER  7
 
+/* CRL registers and bitfields */
+#define CRL_APB_BASE			0xFF5E0000U
+/* BOOT_PIN_CTRL- Used to control the mode pins after boot */
+#define CRL_APB_BOOT_PIN_CTRL		(CRL_APB_BASE + (0x250U))
+/* BOOT_PIN_CTRL_MASK- out_val[11:8], out_en[3:0] */
+#define CRL_APB_BOOTPIN_CTRL_MASK	0xF0FU
+
 static bool feature_check_enabled;
 static DEFINE_HASHTABLE(pm_api_features_map, PM_API_FEATURE_CHECK_MAX_ORDER);
 
@@ -926,6 +933,45 @@ int zynqmp_pm_pinctrl_set_config(const u32 pin, const u32 param,
 EXPORT_SYMBOL_GPL(zynqmp_pm_pinctrl_set_config);
 
 /**
+ * zynqmp_pm_bootmode_read() - PM Config API for read bootpin status
+ * @ps_mode: Returned output value of ps_mode
+ *
+ * This API function is to be used for notify the power management controller
+ * to read bootpin status.
+ *
+ * Return: status, either success or error+reason
+ */
+unsigned int zynqmp_pm_bootmode_read(u32 *ps_mode)
+{
+	unsigned int ret;
+	u32 ret_payload[PAYLOAD_ARG_CNT];
+
+	ret = zynqmp_pm_invoke_fn(PM_MMIO_READ, CRL_APB_BOOT_PIN_CTRL, 0,
+				  0, 0, ret_payload);
+
+	*ps_mode = ret_payload[1];
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_bootmode_read);
+
+/**
+ * zynqmp_pm_bootmode_write() - PM Config API for Configure bootpin
+ * @ps_mode: Value to be written to the bootpin ctrl register
+ *
+ * This API function is to be used for notify the power management controller
+ * to configure bootpin.
+ *
+ * Return: Returns status, either success or error+reason
+ */
+int zynqmp_pm_bootmode_write(u32 ps_mode)
+{
+	return zynqmp_pm_invoke_fn(PM_MMIO_WRITE, CRL_APB_BOOT_PIN_CTRL,
+				   CRL_APB_BOOTPIN_CTRL_MASK, ps_mode, 0, NULL);
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_bootmode_write);
+
+/**
  * zynqmp_pm_init_finalize() - PM call to inform firmware that the caller
  *			       master has initialized its own power management
  *
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index 9d1a5c1..dc6f39f 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -68,6 +68,8 @@ enum pm_api_id {
 	PM_SET_REQUIREMENT = 15,
 	PM_RESET_ASSERT = 17,
 	PM_RESET_GET_STATUS = 18,
+	PM_MMIO_WRITE = 19,
+	PM_MMIO_READ = 20,
 	PM_PM_INIT_FINALIZE = 21,
 	PM_FPGA_LOAD = 22,
 	PM_FPGA_GET_STATUS = 23,
@@ -386,6 +388,8 @@ int zynqmp_pm_sd_dll_reset(u32 node_id, u32 type);
 int zynqmp_pm_reset_assert(const enum zynqmp_pm_reset reset,
 			   const enum zynqmp_pm_reset_action assert_flag);
 int zynqmp_pm_reset_get_status(const enum zynqmp_pm_reset reset, u32 *status);
+unsigned int zynqmp_pm_bootmode_read(u32 *ps_mode);
+int zynqmp_pm_bootmode_write(u32 ps_mode);
 int zynqmp_pm_init_finalize(void);
 int zynqmp_pm_set_suspend_mode(u32 mode);
 int zynqmp_pm_request_node(const u32 node, const u32 capabilities,
@@ -515,6 +519,16 @@ static inline int zynqmp_pm_reset_get_status(const enum zynqmp_pm_reset reset,
 	return -ENODEV;
 }
 
+static inline unsigned int zynqmp_pm_bootmode_read(u32 *ps_mode)
+{
+	return -ENODEV;
+}
+
+static inline int zynqmp_pm_bootmode_write(u32 ps_mode)
+{
+	return -ENODEV;
+}
+
 static inline int zynqmp_pm_init_finalize(void)
 {
 	return -ENODEV;
-- 
2.7.4

