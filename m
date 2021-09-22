Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3DD0414B2C
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 15:54:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233478AbhIVNz7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 09:55:59 -0400
Received: from mail-mw2nam10on2048.outbound.protection.outlook.com ([40.107.94.48]:47937
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233479AbhIVNz6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Sep 2021 09:55:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=deOsC/k0zDvsnBQoU5toZMqG7Q9obVEBcOzN4fHtUUUpyOJFRMBLOwOTg99eqfSaDfJSiNJZzRxGG6k/egFA8v9u99V01EWVyYIZKqNLndZSlu8cPiOJzB4ZMT6zCX10iAK1HYD5Sqwhxih/rnL1ohmhlff5Bka5s/PcqH7HtAwQ2YkCeBIL3N22Zuw8ngKOMtEPpnp8XwXg/qJ7kZw4GkMt06X4lVBw8QF2TAMqZPxX+WF9+CcBBkgxq1Opy5hzH7734ESGJwj2fzCE0gHXJd1o+WaX60zNOGXdsmW9UvXSmaw4XeOg2PINt0HaTO1oBC9n+jezoNpTwu3iBXesuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=pu3+47UxyZ+e9RnBQntw7ZYSZJbD5qM/rZnje6bfzso=;
 b=YqtQHJiU7oFpSGn6NlVgBoJ34lqnRMgTDV4NNBjRMJV82q+skuhu93mKyWSPyus8a6Cw0HUI2d8DKRXKqtbcrIh8qfQ9J024Qp2VMgltmpOL9m7toLl7yK2hD4NvYRoO5a1HKg8Wf1SmtjIC5drPbhSqrAY2sKF+2icZz4BkOzYQBDQdsoel7yS5YAoxwW18CWsWF/aN6bGgxialTp7d/lVaTDExUDJmgQEzDdju47iMN1Y3csLcQbYAJNtJyG6kI/DG2bdwl9u8pqjJEQXZXtRgz0vPXEKZ7JC/ubj5yLd40+j81zNhbBdHBqWkJz4m8GaQ9PV8rxdyWhvFLMMW7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=arndb.de smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pu3+47UxyZ+e9RnBQntw7ZYSZJbD5qM/rZnje6bfzso=;
 b=NVSpouz54oVFvn5VwlzUCxWsLKzIalx/YW/Da2FG5NWeK3zIK9r9YdUJjVcb6NCWpraj5z4ZWcdRYOsPCBVvqTOsURdcheFh4tWJsGJIQTQvW9Uw7TLHUd/L9e5d5y9UPu/ni71mMU71XH9T8t8+74Garb9GQ1htUm2+jyul+8A=
Received: from BN0PR03CA0035.namprd03.prod.outlook.com (2603:10b6:408:e7::10)
 by CH0PR02MB7867.namprd02.prod.outlook.com (2603:10b6:610:110::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 22 Sep
 2021 13:54:25 +0000
Received: from BN1NAM02FT042.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:e7:cafe::ca) by BN0PR03CA0035.outlook.office365.com
 (2603:10b6:408:e7::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Wed, 22 Sep 2021 13:54:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; arndb.de; dkim=none (message not signed)
 header.d=none;arndb.de; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT042.mail.protection.outlook.com (10.13.2.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4523.14 via Frontend Transport; Wed, 22 Sep 2021 13:54:25 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 22 Sep 2021 06:53:38 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 22 Sep 2021 06:53:38 -0700
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
Received: from [10.140.6.35] (port=53850 helo=xhdsaipava40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <piyush.mehta@xilinx.com>)
        id 1mT2gq-0000im-OE; Wed, 22 Sep 2021 06:53:37 -0700
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
Subject: [PATCH V4 1/3] firmware: zynqmp: Add MMIO read and write support for PS_MODE pin
Date:   Wed, 22 Sep 2021 19:23:17 +0530
Message-ID: <20210922135319.3128153-2-piyush.mehta@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922135319.3128153-1-piyush.mehta@xilinx.com>
References: <20210922135319.3128153-1-piyush.mehta@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02cc5326-a7c5-46bc-f01c-08d97dd07cfd
X-MS-TrafficTypeDiagnostic: CH0PR02MB7867:
X-Microsoft-Antispam-PRVS: <CH0PR02MB78674893FCCE4D46206DF454D4A29@CH0PR02MB7867.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oJsZ8YzE5XsQ+436lgsViaDIf7goscNaHSezUBOdwACqVU7d4ATKSFtIsSDUl4lm2K0hgkpHrnDCEb5KBBQNYW1PliB2wT3hNs9yWoKcFgRoPau8F5xdgMtTXMEzSRdC9pkBgzJdKA/pxK8RGrKMS79SGHRVgjf9J9KDoRtanAAB1ad5X0oATslts8fijAb9o8pDxXGQE37YGoBBFhbaPM0mHpJtSxZup86s9O5C3vf87dWhuksnDAtUjUvCmT78obCiIzuVLScnl+2yTKp0q6zVcbywrxV3dTQwxxxbZ5ZUoCbBoZT+556eNpsySX3mnJS6kamjfUrVm61M8L9xiTRl7EvYle9wWRVVfLxsrZYcBX0D7PErzJEqbov43t+wPxuQPoKFbF32TuJyJ6tjSppVgPlYEpvh0gMT9TVyQMiB+axsG735o5tafb99rjDab5Nr2KMEWYM54Npt8nbqW2Ria65KA4tZa8u0IF6NCAvEpD7L9HhMA9OmgJhyP4d8xwpX7cwm8FQCF8Dpp5m3n1xD2NOJKS6TC9JvO1dFcCGhlAwHeWBmKJkhry71WHakTzjzCVslctirWit0fnDRXbhbHxxuYYhB3pkjFzYourLMrA6MSikFUGksD2vy4wLkD9ySCjH+IG53GOVYwVNjjeJb9Ue95pmxVaS3BXoFTd3zp8KsaUsGBxGeO3IN4ljCSHwMPJgE2SNJBXbyxySpRUscAnH5Uc2WYHjLl91dBbFa/scuz4vNA9L/kn/LyMA4owCCacxOzLfw9msEKdXLNRbK5MCopE90REB9E+xpxE4=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(36860700001)(6636002)(70206006)(2906002)(426003)(7696005)(356005)(110136005)(83380400001)(508600001)(1076003)(6666004)(107886003)(70586007)(336012)(7636003)(26005)(82310400003)(8676002)(921005)(316002)(2616005)(44832011)(36906005)(4326008)(5660300002)(36756003)(9786002)(47076005)(7416002)(186003)(8936002)(54906003)(102446001)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 13:54:25.1852
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02cc5326-a7c5-46bc-f01c-08d97dd07cfd
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT042.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB7867
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
index a3cadba..7feba12 100644
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
index 56b426f..3917f89 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -72,6 +72,8 @@ enum pm_api_id {
 	PM_SET_REQUIREMENT = 15,
 	PM_RESET_ASSERT = 17,
 	PM_RESET_GET_STATUS = 18,
+	PM_MMIO_WRITE = 19,
+	PM_MMIO_READ = 20,
 	PM_PM_INIT_FINALIZE = 21,
 	PM_FPGA_LOAD = 22,
 	PM_FPGA_GET_STATUS = 23,
@@ -390,6 +392,8 @@ int zynqmp_pm_sd_dll_reset(u32 node_id, u32 type);
 int zynqmp_pm_reset_assert(const enum zynqmp_pm_reset reset,
 			   const enum zynqmp_pm_reset_action assert_flag);
 int zynqmp_pm_reset_get_status(const enum zynqmp_pm_reset reset, u32 *status);
+unsigned int zynqmp_pm_bootmode_read(u32 *ps_mode);
+int zynqmp_pm_bootmode_write(u32 ps_mode);
 int zynqmp_pm_init_finalize(void);
 int zynqmp_pm_set_suspend_mode(u32 mode);
 int zynqmp_pm_request_node(const u32 node, const u32 capabilities,
@@ -520,6 +524,16 @@ static inline int zynqmp_pm_reset_get_status(const enum zynqmp_pm_reset reset,
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

