Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77AE53EFEC5
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Aug 2021 10:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239756AbhHRILi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Aug 2021 04:11:38 -0400
Received: from mail-bn8nam12on2061.outbound.protection.outlook.com ([40.107.237.61]:44640
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239740AbhHRILh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 18 Aug 2021 04:11:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=StoUJZMzKly7xIFRTP+AaPr8w/TXGsedZaD7Bwa3f0mCu8ND1K4I0GKvGJBXAVWXFhQhGQgUfbpdxtio6wXwXpIW3zfstIHJP348YW/HNzWLxCOIR1tLPg4whb01AMH9VKbs5e4/mvyht5GCir10RugX3jD3kDs9QvDaKeqEOj5Y5dDtiP2b48uYBdjACsWPSi+lmxgmtAdyyo493CdmUF15wsTiUEUWoCizC23oO7jFKARwzqJxWYl+ZKsrUFTC5tB8PZNlmnH35Kj8B5OhM1ggfPE/yky60m/N/YNyMHY+XZT0DIoPIFaBw+yUMgUNMoAIufhAUG3WeW0HTPWrBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0PTryo1w1nA8oQ7ssbscDWKl5AOLpyHskPDdahDATI=;
 b=TqOC+PmbCbSscgCb34C9DRFaSU2F9q3s4my6h2+AZaCvIwd7r4uFCSDkM4seFY0Ipqozh/rMjnX7bio3YsPKvfo3fp2hdtCINOE7FsTPLuFc9Intx9LoahqVvb7IYEg162hvNvqXYPmJoeq60vs4EkVOj9r+lcwqzNyPeUzzxJjj+SdHOORl67RQt7+7FLKPWMfF4Tx2A4VyC06eK0t8FRkRAe1187tHK4gZSn+6AGYGiLTUKBWfuGooqonZ/5Z29ywaz/TOThU7DDVuFsQG3+7sXTkMtLS1KQNNXamMwDGFr5fJFBpLlVAfFmjkCPTVxHjzCMRFOdy5PwLjWh0PAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=arndb.de smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0PTryo1w1nA8oQ7ssbscDWKl5AOLpyHskPDdahDATI=;
 b=m7Br/za/uw6mAcGLNR+I8jMM+Moru1c/W1DVhYgEIzchDsOpI5//arVyaMf0hMUTlN4iYyJlgN9jrVbKvNOmghaPb2fffoyyN709PILW8BSjujhumyby6WBMm5zJY9jGxFC9CgwhsHvmVSuIQxjLnlrgxDRTgpSJswRD87reumw=
Received: from BN9P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::12)
 by BN6PR02MB2836.namprd02.prod.outlook.com (2603:10b6:404:fd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Wed, 18 Aug
 2021 08:11:00 +0000
Received: from BN1NAM02FT054.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:13e:cafe::fe) by BN9P220CA0007.outlook.office365.com
 (2603:10b6:408:13e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 18 Aug 2021 08:11:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; arndb.de; dkim=none (message not signed)
 header.d=none;arndb.de; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT054.mail.protection.outlook.com (10.13.2.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Wed, 18 Aug 2021 08:11:00 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 18 Aug 2021 01:10:36 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 18 Aug 2021 01:10:36 -0700
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
Received: from [10.140.6.35] (port=57498 helo=xhdsaipava40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <piyush.mehta@xilinx.com>)
        id 1mGGeg-0008z4-Ut; Wed, 18 Aug 2021 01:10:35 -0700
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
Subject: [PATCH V3 1/3] firmware: zynqmp: Add MMIO read and write support for PS_MODE pin
Date:   Wed, 18 Aug 2021 13:40:16 +0530
Message-ID: <20210818081018.2620544-2-piyush.mehta@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818081018.2620544-1-piyush.mehta@xilinx.com>
References: <20210818081018.2620544-1-piyush.mehta@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9215f8b-220c-4c2f-510f-08d9621fb72a
X-MS-TrafficTypeDiagnostic: BN6PR02MB2836:
X-Microsoft-Antispam-PRVS: <BN6PR02MB28364AE1CD23E27F95422DDDD4FF9@BN6PR02MB2836.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uyl7lqKZsJFAiqunRXOsiEbLAy3LKfUqH/zChsvAsmyKeUlZEjjGPcqD7BvrMvSnATYOwEkhkrNmLqFqcPxSmF9YGYGeJcO9MN33fr1s8I6ctvEp7TsC6W1NiDyQynwOGsSVznSpwdXyZPXqk1BvBZQQ3bLzwcMg0P4JX4l+OGyneh4r8M7O/R5DXU6lNFBL+wrAMW4NjDciMV1xBbPBEo8n+Yj+IeTWvRuAGKQ3ZX+sAa5FeL/d2I83Pn6zbQDVwb3pngk3jEaY+KdIC55cnkx23LzXRrz0/duNYqlo5lCFtbZHlxLYGST8+NvacNeaG08LlMBoBo3FACwhsquPC+ysoPJZLxoarPVUdMI4SHhQHCWV8eNZRfCAHuQ9k1b7AHVemnt3ovlvZZG1NsZGcRP4a4JZKl1pci2wFda7WL5PI92xrsrFfygN4YtyBx0B8VwnV+kcAGnn/pzAt1nkk8Z46UokAfdPnXQldhKupRBHpybDUDB0yuyMhRR0pnB7ZO4l5/gVqaHcODf1AtRuMjquO2ZLj1e4q1PEWJDVyN0PFt6ayt2QLMahpvH9jqH4ttp3XlPOAGrvmd0gjm6u61CgWe8pioTuZqtVst1ZtD3NLR0XC3Gcpg6kwBz4ypVU7Sw3K+5j7i7KqcYZb3AkBux/zLHwdJIT/y2mCoGCi8dRaGzOoAJnFrQdrJ+ejJj8713DmBaT9pPk35DoXTWVpSb4dxQfX030zT3ADb25aTjQGhDsdisHXEK7QyFnm2CS0KiNTzgpH3+0wCDCRQpfhWwzC/BTU0Y7JTsyFtuoh4Y=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(136003)(39860400002)(36840700001)(46966006)(6666004)(82740400003)(83380400001)(7636003)(36756003)(6636002)(7696005)(107886003)(2616005)(9786002)(426003)(356005)(44832011)(47076005)(478600001)(36906005)(36860700001)(5660300002)(26005)(921005)(336012)(82310400003)(8936002)(70206006)(70586007)(110136005)(316002)(8676002)(7416002)(54906003)(186003)(2906002)(1076003)(4326008)(102446001)(2101003)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 08:11:00.4818
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9215f8b-220c-4c2f-510f-08d9621fb72a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT054.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2836
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add Xilinx ZynqMP firmware MMIO APIs support to set and get PS_MODE
pins value and status. These APIs create an interface path between
mode pin controller driver and low-level API to access GPIO pins.

Signed-off-by: Piyush Mehta <piyush.mehta@xilinx.com>
Acked-by: Michal Simek <michal.simek@xilinx.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
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

