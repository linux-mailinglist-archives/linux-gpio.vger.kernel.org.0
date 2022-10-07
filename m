Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0D35F7A8A
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Oct 2022 17:29:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbiJGP3X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Oct 2022 11:29:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbiJGP3W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Oct 2022 11:29:22 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80080.outbound.protection.outlook.com [40.107.8.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3488E10B7AA
        for <linux-gpio@vger.kernel.org>; Fri,  7 Oct 2022 08:29:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HORcxP1wv3uQ0ju+bO4CMUoqFGzEUQcP4LXwDBkKooml+2rZyxA90+aJ7goEwgqTIa8YJiKqnn1wpcVSZvMC39LbTbKsTwQRaao6V1HRwmJWEmlp2+okBt3usmbjONxcwzhaU8K6vydYPF18ZRMynuBV2e7O1FMOUuUKHf1domLz7GEczU60rWNuZHl0PrNJDQyMjKqQhVIhTg3sQcQbyTN8zH8XWddIXtEFrdvY0HGoOBjcTte06RexdKXXc5UyTs1MTMQWT4LYuGcNlARbdVP2Yq8HzkR+o6pEULJDcKCpyHAlSCaC5jCP1OEbRrX1BtpBN2WLVruuS+0/NKh1QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TaZLBP1qv3EN5dEeO2LsbBxY5s1eK7TKU3sixj+xR4I=;
 b=fu+CBYYmwi39fC/VOF+0RCpwSbcvCnWTAsX8E2GQe2qxBMiGrbEGHKhlbDG9TE5emKN97gOxduZ9/+Xi8q0XV+766WMbLTv+bNhiHSQLC2mRH2piMJViexYbbrVIC9bPC4KaYeX2uSjN/+z2z0b+6nI+jBaRvbr9/9sVmDsypM/Ayz9Dtb8htCSNVtA84pEGiz4QXSiBuGcP4vOzPY9hyRptjeaS8Gxt+8oa4gc3RUyJQICXJ8yuoW6u0eEzkk73Hq8wzk7PDMVxgLCh5JoLRW3/AJDv8EKh64sFgjhPVUaO9qwYoEqYyG+GH3+rrKBScaeMyNkGHGxRURvYt53P0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TaZLBP1qv3EN5dEeO2LsbBxY5s1eK7TKU3sixj+xR4I=;
 b=OdaJ4ryJd3Rfqgw2y5j47peVhvQshglAfP+IOiEpV95U08rlI7hYeexLvZciLk4TSXSEmPYOu8oqv3Gpw/l2O0MEe9LhxNxaHFoePZ4jcZcOAjQKA+8jr9tqmSu2fb6kZsj6bDpiR55BuunPkxLuCrP4PNBi17RDfVp/IpOKOhI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AM0PR04MB6995.eurprd04.prod.outlook.com (2603:10a6:208:18e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.34; Fri, 7 Oct
 2022 15:29:16 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::4d83:404:c74a:7563]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::4d83:404:c74a:7563%5]) with mapi id 15.20.5676.036; Fri, 7 Oct 2022
 15:29:16 +0000
From:   Shenwei Wang <shenwei.wang@nxp.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, imx@lists.linux.dev,
        Shenwei Wang <shenwei.wang@nxp.com>
Subject: [PATCH v2 1/1] gpio: mxc: add suspend/resume support for i.mx8x SoCs
Date:   Fri,  7 Oct 2022 10:28:53 -0500
Message-Id: <20221007152853.838136-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN6PR01CA0033.prod.exchangelabs.com (2603:10b6:805:b6::46)
 To PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|AM0PR04MB6995:EE_
X-MS-Office365-Filtering-Correlation-Id: dbc1c17b-be2e-45b2-16b5-08daa878b058
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DPBQi7kUjSnnwkXfXXtJ7r0QIrjghto627vZx76BzZiuWoog9gXcVvwWgSzkGL1teGopbie/PqhxBhZGqKZ5xE0FCMdaDTZSrKaEOizeWOq34FIlI6Apu7Y4yuKOwAG35xIQpRSlvh44sdw1GefUfZEMKzNqVe5Z5UVIWZb9dLpKUCtrf4kDpAmJP7QnxgdtEB8/tHDu1pg8qDVy53haI83v1QCRQm5m7F23a46MjYw62dScoGCuXN3SDtwtSWw5QxFGyeAJDpn0L80Ua5Oehd+PY5xFiHnBMaSGc//t7mWH7IsQe9B1Hu2fsXx73t0+P7OyeAHN3qjClKklI57YPFwnRoisqpilDt+X2aaPe7PkSbXi8gpBfFo1dMSZ9kaTKJqjuidTs0A0TK29mjxE2rN4WZLbkSCl8QcScciZT14HVnQODDIj7Exjr0yzFmhX/j/Hl6YeTXgGG6yheUOY7442HxTcT+BaSJCNiy9HHPuAfys32ZZG0HtrpK4M1J8JkWo2Ar9ZmndKVwK+lTwsPobHSpbInt45GgnvcIXpFaipcwBc8KP6++of0dMq0fno0iSSdwkvVJBSSZsd65gX/l4kBywMZ3Lz+4H/9Fhq9CilbVC3FPZF8yAjZ9F4aRSoyLRUiMVCYVWEl1p12KpB55i9tRgukIPmobR+y8m9sfyLjqiTfTdO50z7O+G2EWhKPUbiohbK6qyhxaLF1KT/Na7zU0N6OnDXuYt2kDWKwTdt5A/6hJP6zsKLQSOpGcsrQHJB1sPhq/BooSkgVBWvzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(6029001)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199015)(6512007)(6666004)(6506007)(26005)(478600001)(2906002)(30864003)(316002)(4326008)(55236004)(6486002)(110136005)(52116002)(66556008)(8936002)(41300700001)(44832011)(8676002)(15650500001)(66476007)(66946007)(5660300002)(36756003)(2616005)(83380400001)(38100700002)(38350700002)(86362001)(186003)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RAimwZtfuM+nlgjCJZjbuRaGk1TO5ijGl4D7XaHRRmsXZu8uW2zqzpKK6ap2?=
 =?us-ascii?Q?d8hTlLijATv3KMysqG0lccXmV+5zUPCivlcUvVvF+bBqhioJzxtpoUvHbg2r?=
 =?us-ascii?Q?PcO7C7D7tF+M/Zf2ODwYW61d7h0feTgTp4cc5CzyWCB+5lR6xak0WzopBrl+?=
 =?us-ascii?Q?3/TRx1JkcEQ6UzF4yLDmIy0IoKPLp8GsS1nJNdx54bUO5D0GTv3M5WOj1Hro?=
 =?us-ascii?Q?0yoFMhoThAunrlB+fgDZdigvWVOjZ0egWvN6PPdoRr2lAUuhgDbV9rFwW8Az?=
 =?us-ascii?Q?3RG9rl+icDrcz1pOxKNXU2nDFLQQVj+6Z/mA3XwC95vxgWNHNTSi4ez8Go+Z?=
 =?us-ascii?Q?Se1jQO3acPxIaRpE2bvmcJxCrHK5BT4Gy9+Dv+0cE4uSljnI+V9yT2OgsXmy?=
 =?us-ascii?Q?5msHXWVA1n5+Sg8NNsWRQLB4T8xIKpxk/b1O1tmWf290bPkdY9og1YDBLalR?=
 =?us-ascii?Q?jZabzsrWtvncsYpDt/zYAFtQHjF/CEbNmMiIGuPC6sCsSmaJqBtaxJXXf7DW?=
 =?us-ascii?Q?WHmNB+vmpFlJcJ7qJl694VR8j8yiwMalaMDgc9rphbmI75oNfC54H960O8UN?=
 =?us-ascii?Q?pnvBonNDartxqvjRBQgy0b9YQC3y4eg7AG5gNHay0yr4gUIPXzWyCQU+z5Si?=
 =?us-ascii?Q?sMDVibl+I6i/s7PQ0FoH2Ijd7FVYZ24BMsMhBrt15PGiq2u4M9i/F0b9I+7H?=
 =?us-ascii?Q?rgHxG7BqXmpcaRIHcVfzzWP5NwUyEyNU5rCBX2ecJgT4V4Hdn7J4INkcRtog?=
 =?us-ascii?Q?tktDM6AgQsPo+4RnNoL1SRB62pFu2g4X3NwPMo3MGguCIjS0UriaVGgKuEii?=
 =?us-ascii?Q?L8/Cv2Lew8QTPIrYuljI4001850jm8/geS1O+elRZsp6MWKc85ta1MzAV7sC?=
 =?us-ascii?Q?NOokKLWGrMLS+g7lApy5f4Z6KMbE9EUp5tc60Q/yuyRih5PWSKSmFR1Htmmy?=
 =?us-ascii?Q?xZAzjWKW1vkaSGMrHkWKjhyWeBTbSJoxaUMRGD0PWkGbcvTNIGHh7C+SiT/h?=
 =?us-ascii?Q?3X/ArFwZFDhgqAFolyfXOHp/VEsNKQDvaYC2D1SvwGtsuVkQTR6LVr5K73BN?=
 =?us-ascii?Q?SBLIlfx/KCxPsPYOJjS3N31YqJ+XdUdI9h0iMXIrVyPE2ivbITPDaon/c0S/?=
 =?us-ascii?Q?ttLGQHN+H132C6rVIOBOZH3GXUHNz4hL420J8LeXye8juGpGj8wxpzMfBYwR?=
 =?us-ascii?Q?L6IjuAjOclSokqjD5hiYMTGjGYtNCrJJlrvK3bQ9orfeRou8iXcPyq5FMRVw?=
 =?us-ascii?Q?knRp9vpI8TGcvab4XBeTO9M/L91JaxIyBWjYOZRYhxLiymKoRLyomuuBUcoe?=
 =?us-ascii?Q?5XQbpqshz40BU/jsxj3WXkEdpNHlRFr1HF/DoSbOzDdRK17MbwdMObbYK6P1?=
 =?us-ascii?Q?CxysgcOsD5Y8NgYGGEEBU9LdKIXz+1kJrgjO2oTIS/7yPIvhwy+qekft9ga+?=
 =?us-ascii?Q?DbAOyc9Yu3kjOp63IQrOFNxkpz7N4DvLeWHTo4Cqujd9ibmEynCeGGFDbTFF?=
 =?us-ascii?Q?k8h2cxmKrT+KBDEDfIvvPwX5uRImoQ5HIJ6JI3P7RwuD0yb2Wo1GDw7dokG9?=
 =?us-ascii?Q?2wcYc1KbYPXrE0ky1PXq7EJqJ1VAVU2wME6aMpo5l+ahdrtqfdCn4gtKvk+4?=
 =?us-ascii?Q?kw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbc1c17b-be2e-45b2-16b5-08daa878b058
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2022 15:29:16.6491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R94rOgpWVqi5XxR7e8Z3g/wf74X425gd8/1a8uwh5XzLaoLWPszXKJ9jZHRV+3oVDxZIPgL1kfzlBshSlhid6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6995
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,UPPERCASE_50_75 autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On i.MX8QM/QXP/DXL SoCs, even a GPIO is selected as the wakeup source,
the GPIO block will be powered off when system enters into suspend
state. This can greatly reduce the power consumption of suspend state
because the whole partition can be shutdown. This is called PAD wakeup
feature on i.MX8x platform.

This patch enables this wakeup feature on i.MX8QM/QXP/DXL platforms.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 Changes in v2:
 - fix a bug when finding the pad index

 drivers/gpio/gpio-mxc.c | 765 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 751 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index c871602fc5ba..e18af80ce50b 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -24,6 +24,33 @@
 #include <linux/of_device.h>
 #include <linux/bug.h>

+#include <dt-bindings/pinctrl/pads-imx8dxl.h>
+#include <dt-bindings/pinctrl/pads-imx8qxp.h>
+#include <dt-bindings/pinctrl/pads-imx8qm.h>
+#include <linux/firmware/imx/sci.h>
+
+#define IMX_SC_PAD_FUNC_GET_WAKEUP	9
+#define IMX_SC_PAD_FUNC_SET_WAKEUP	4
+#define IMX_SC_IRQ_GROUP_WAKE           3   /* Wakeup interrupts */
+#define IMX_SC_IRQ_PAD			2    /* Pad wakeup */
+
+#define IMX_SC_PAD_WAKEUP_OFF		0
+#define IMX_SC_PAD_WAKEUP_LOW_LVL	4
+#define IMX_SC_PAD_WAKEUP_FALL_EDGE	5
+#define IMX_SC_PAD_WAKEUP_RISE_EDGE	6
+#define IMX_SC_PAD_WAKEUP_HIGH_LVL	7
+
+struct imx_sc_msg_gpio_set_pad_wakeup {
+	struct imx_sc_rpc_msg hdr;
+	u16 pad;
+	u8 wakeup;
+} __packed __aligned(4);
+
+struct mxc_gpio_pad_map {
+	u32 index;
+	u32 pad_index;
+};
+
 /* device type dependent stuff */
 struct mxc_gpio_hwdata {
 	unsigned dr_reg;
@@ -38,6 +65,8 @@ struct mxc_gpio_hwdata {
 	unsigned high_level;
 	unsigned rise_edge;
 	unsigned fall_edge;
+	unsigned pad_map_size;
+	const struct mxc_gpio_pad_map *pad_map;
 };

 struct mxc_gpio_reg_saved {
@@ -61,9 +90,562 @@ struct mxc_gpio_port {
 	u32 both_edges;
 	struct mxc_gpio_reg_saved gpio_saved_reg;
 	bool power_off;
+	int gpio_index;
+	u32 wakeup_pads;
+	bool is_pad_wakeup;
+	u32 pad_type[32];
 	const struct mxc_gpio_hwdata *hwdata;
 };

+const struct mxc_gpio_pad_map imx8qm_pad_map[] = {
+	/* GPIO0 */
+	{  0, IMX8QM_SIM0_CLK},
+	{  1, IMX8QM_SIM0_RST},
+	{  2, IMX8QM_SIM0_IO},
+	{  3, IMX8QM_SIM0_PD},
+	{  4, IMX8QM_SIM0_POWER_EN},
+	{  5, IMX8QM_SIM0_GPIO0_00},
+	{  6, IMX8QM_M40_I2C0_SCL},
+	{  7, IMX8QM_M40_I2C0_SDA},
+	{  8, IMX8QM_M40_GPIO0_00},
+	{  9, IMX8QM_M40_GPIO0_01},
+	{ 10, IMX8QM_M41_I2C0_SCL},
+	{ 11, IMX8QM_M41_I2C0_SDA},
+	{ 12, IMX8QM_M41_GPIO0_00},
+	{ 13, IMX8QM_M41_GPIO0_01},
+	{ 14, IMX8QM_GPT0_CLK},
+	{ 15, IMX8QM_GPT0_CAPTURE},
+	{ 16, IMX8QM_GPT0_COMPARE},
+	{ 17, IMX8QM_GPT1_CLK},
+	{ 18, IMX8QM_GPT1_CAPTURE},
+	{ 19, IMX8QM_GPT1_COMPARE},
+	{ 20, IMX8QM_UART0_RX},
+	{ 21, IMX8QM_UART0_TX},
+	{ 22, IMX8QM_UART0_RTS_B},
+	{ 23, IMX8QM_UART0_CTS_B},
+	{ 24, IMX8QM_UART1_TX},
+	{ 25, IMX8QM_UART1_RX},
+	{ 26, IMX8QM_UART1_RTS_B},
+	{ 27, IMX8QM_UART1_CTS_B},
+	{ 28, IMX8QM_SCU_GPIO0_00},
+	{ 29, IMX8QM_SCU_GPIO0_01},
+	{ 30, IMX8QM_SCU_GPIO0_02},
+	{ 31, IMX8QM_SCU_GPIO0_03},
+
+	/* GPIO1 */
+	{ 32, IMX8QM_SCU_GPIO0_04},
+	{ 33, IMX8QM_SCU_GPIO0_05},
+	{ 34, IMX8QM_SCU_GPIO0_06},
+	{ 35, IMX8QM_SCU_GPIO0_07},
+	{ 36, IMX8QM_LVDS0_GPIO00},
+	{ 37, IMX8QM_LVDS0_GPIO01},
+	{ 38, IMX8QM_LVDS0_I2C0_SCL},
+	{ 39, IMX8QM_LVDS0_I2C0_SDA},
+	{ 40, IMX8QM_LVDS0_I2C1_SCL},
+	{ 41, IMX8QM_LVDS0_I2C1_SDA},
+	{ 42, IMX8QM_LVDS1_GPIO00},
+	{ 43, IMX8QM_LVDS1_GPIO01},
+	{ 44, IMX8QM_LVDS1_I2C0_SCL},
+	{ 45, IMX8QM_LVDS1_I2C0_SDA},
+	{ 46, IMX8QM_LVDS1_I2C1_SCL},
+	{ 47, IMX8QM_LVDS1_I2C1_SDA},
+	{ 48, IMX8QM_MIPI_DSI0_I2C0_SCL},
+	{ 49, IMX8QM_MIPI_DSI0_I2C0_SDA},
+	{ 50, IMX8QM_MIPI_DSI0_GPIO0_00},
+	{ 51, IMX8QM_MIPI_DSI0_GPIO0_01},
+	{ 52, IMX8QM_MIPI_DSI1_I2C0_SCL},
+	{ 53, IMX8QM_MIPI_DSI1_I2C0_SDA},
+	{ 54, IMX8QM_MIPI_DSI1_GPIO0_00},
+	{ 55, IMX8QM_MIPI_DSI1_GPIO0_01},
+	{ 56, IMX8QM_MIPI_CSI0_MCLK_OUT},
+	{ 57, IMX8QM_MIPI_CSI0_I2C0_SCL},
+	{ 58, IMX8QM_MIPI_CSI0_I2C0_SDA},
+	{ 59, IMX8QM_MIPI_CSI0_GPIO0_00},
+	{ 60, IMX8QM_MIPI_CSI0_GPIO0_01},
+	{ 61, IMX8QM_MIPI_CSI1_MCLK_OUT},
+	{ 62, IMX8QM_MIPI_CSI1_GPIO0_00},
+	{ 63, IMX8QM_MIPI_CSI1_GPIO0_01},
+
+	/* GPIO2 */
+	{ 64, IMX8QM_MIPI_CSI1_I2C0_SCL},
+	{ 65, IMX8QM_MIPI_CSI1_I2C0_SDA},
+	{ 66, IMX8QM_HDMI_TX0_TS_SCL},
+	{ 67, IMX8QM_HDMI_TX0_TS_SDA},
+	{ 68, IMX8QM_ESAI1_FSR},
+	{ 69, IMX8QM_ESAI1_FST},
+	{ 70, IMX8QM_ESAI1_SCKR},
+	{ 71, IMX8QM_ESAI1_SCKT},
+	{ 72, IMX8QM_ESAI1_TX0},
+	{ 73, IMX8QM_ESAI1_TX1},
+	{ 74, IMX8QM_ESAI1_TX2_RX3},
+	{ 75, IMX8QM_ESAI1_TX3_RX2},
+	{ 76, IMX8QM_ESAI1_TX4_RX1},
+	{ 77, IMX8QM_ESAI1_TX5_RX0},
+	{ 78, IMX8QM_SPDIF0_RX},
+	{ 79, IMX8QM_SPDIF0_TX},
+	{ 80, IMX8QM_SPDIF0_EXT_CLK},
+	{ 81, IMX8QM_SPI3_SCK},
+	{ 82, IMX8QM_SPI3_SDO},
+	{ 83, IMX8QM_SPI3_SDI},
+	{ 84, IMX8QM_SPI3_CS0},
+	{ 85, IMX8QM_SPI3_CS1},
+	{ 86, IMX8QM_ESAI0_FSR},
+	{ 87, IMX8QM_ESAI0_FST},
+	{ 88, IMX8QM_ESAI0_SCKR},
+	{ 89, IMX8QM_ESAI0_SCKT},
+	{ 90, IMX8QM_ESAI0_TX0},
+	{ 91, IMX8QM_ESAI0_TX1},
+	{ 92, IMX8QM_ESAI0_TX2_RX3},
+	{ 93, IMX8QM_ESAI0_TX3_RX2},
+	{ 94, IMX8QM_ESAI0_TX4_RX1},
+	{ 95, IMX8QM_ESAI0_TX5_RX0},
+
+	/* GPIO3 */
+	{ 96, IMX8QM_MCLK_IN0},
+	{ 97, IMX8QM_MCLK_OUT0},
+	{ 98, IMX8QM_SPI0_SCK},
+	{ 99, IMX8QM_SPI0_SDO},
+	{100, IMX8QM_SPI0_SDI},
+	{101, IMX8QM_SPI0_CS0},
+	{102, IMX8QM_SPI0_CS1},
+	{103, IMX8QM_SPI2_SCK},
+	{104, IMX8QM_SPI2_SDO},
+	{105, IMX8QM_SPI2_SDI},
+	{106, IMX8QM_SPI2_CS0},
+	{107, IMX8QM_SPI2_CS1},
+	{108, IMX8QM_SAI1_RXC},
+	{109, IMX8QM_SAI1_RXD},
+	{110, IMX8QM_SAI1_RXFS},
+	{111, IMX8QM_SAI1_TXC},
+	{112, IMX8QM_SAI1_TXD},
+	{113, IMX8QM_SAI1_TXFS},
+	{114, IMX8QM_ADC_IN0},
+	{115, IMX8QM_ADC_IN1},
+	{116, IMX8QM_ADC_IN2},
+	{117, IMX8QM_ADC_IN3},
+	{118, IMX8QM_ADC_IN4},
+	{119, IMX8QM_ADC_IN5},
+	{120, IMX8QM_ADC_IN6},
+	{121, IMX8QM_ADC_IN7},
+	{122, IMX8QM_MLB_SIG},
+	{123, IMX8QM_MLB_CLK},
+	{124, IMX8QM_MLB_DATA},
+	{125, IMX8QM_FLEXCAN0_RX},
+	{126, IMX8QM_FLEXCAN0_TX},
+	{127, IMX8QM_FLEXCAN1_RX},
+
+	/* GPIO4 */
+	{128, IMX8QM_FLEXCAN1_TX},
+	{129, IMX8QM_FLEXCAN2_RX},
+	{130, IMX8QM_FLEXCAN2_TX},
+	{131, IMX8QM_USB_SS3_TC0},
+	{132, IMX8QM_USB_SS3_TC1},
+	{133, IMX8QM_USB_SS3_TC2},
+	{134, IMX8QM_USB_SS3_TC3},
+	{135, IMX8QM_USDHC1_RESET_B},
+	{136, IMX8QM_USDHC1_VSELECT},
+	{137, IMX8QM_USDHC2_RESET_B},
+	{138, IMX8QM_USDHC2_VSELECT},
+	{139, IMX8QM_USDHC2_WP},
+	{140, IMX8QM_USDHC2_CD_B},
+	{141, IMX8QM_ENET0_MDIO},
+	{142, IMX8QM_ENET0_MDC},
+	{143, IMX8QM_ENET0_REFCLK_125M_25M},
+	{144, IMX8QM_ENET1_REFCLK_125M_25M},
+	{145, IMX8QM_ENET1_MDIO},
+	{146, IMX8QM_ENET1_MDC},
+	{147, IMX8QM_QSPI1A_SS0_B},
+	{148, IMX8QM_QSPI1A_SS1_B},
+	{149, IMX8QM_QSPI1A_SCLK},
+	{150, IMX8QM_QSPI1A_DQS},
+	{151, IMX8QM_QSPI1A_DATA3},
+	{152, IMX8QM_QSPI1A_DATA2},
+	{153, IMX8QM_QSPI1A_DATA1},
+	{154, IMX8QM_QSPI1A_DATA0},
+	{155, IMX8QM_PCIE_CTRL0_CLKREQ_B},
+	{156, IMX8QM_PCIE_CTRL0_WAKE_B},
+	{157, IMX8QM_PCIE_CTRL0_PERST_B},
+	{158, IMX8QM_PCIE_CTRL1_CLKREQ_B},
+	{159, IMX8QM_PCIE_CTRL1_WAKE_B},
+
+	/* GPIO5 */
+	{160, IMX8QM_PCIE_CTRL1_PERST_B},
+	{161, IMX8QM_USB_HSIC0_DATA},
+	{162, IMX8QM_USB_HSIC0_STROBE},
+	{163, IMX8QM_EMMC0_CMD},
+	{164, IMX8QM_EMMC0_DATA0},
+	{165, IMX8QM_EMMC0_DATA1},
+	{166, IMX8QM_EMMC0_DATA2},
+	{167, IMX8QM_EMMC0_DATA3},
+	{168, IMX8QM_EMMC0_DATA4},
+	{169, IMX8QM_EMMC0_DATA5},
+	{170, IMX8QM_EMMC0_DATA6},
+	{171, IMX8QM_EMMC0_DATA7},
+	{172, IMX8QM_EMMC0_STROBE},
+	{173, IMX8QM_EMMC0_RESET_B},
+	{174, IMX8QM_USDHC1_CMD},
+	{175, IMX8QM_USDHC1_DATA0},
+	{176, IMX8QM_USDHC1_DATA1},
+	{177, IMX8QM_USDHC1_DATA2},
+	{178, IMX8QM_USDHC1_DATA3},
+	{179, IMX8QM_USDHC1_DATA4},
+	{180, IMX8QM_USDHC1_DATA5},
+	{181, IMX8QM_USDHC1_DATA6},
+	{182, IMX8QM_USDHC1_DATA7},
+	{183, IMX8QM_USDHC1_STROBE},
+	{184, IMX8QM_USDHC2_CLK},
+	{185, IMX8QM_USDHC2_CMD},
+	{186, IMX8QM_USDHC2_DATA0},
+	{187, IMX8QM_USDHC2_DATA1},
+	{188, IMX8QM_USDHC2_DATA2},
+	{189, IMX8QM_USDHC2_DATA3},
+	{190, IMX8QM_ENET0_RGMII_TXC},
+	{191, IMX8QM_ENET0_RGMII_TX_CTL},
+
+	/* GPIO6 */
+	{192, IMX8QM_ENET0_RGMII_TXD0},
+	{193, IMX8QM_ENET0_RGMII_TXD1},
+	{194, IMX8QM_ENET0_RGMII_TXD2},
+	{195, IMX8QM_ENET0_RGMII_TXD3},
+	{196, IMX8QM_ENET0_RGMII_RXC},
+	{197, IMX8QM_ENET0_RGMII_RX_CTL},
+	{198, IMX8QM_ENET0_RGMII_RXD0},
+	{199, IMX8QM_ENET0_RGMII_RXD1},
+	{200, IMX8QM_ENET0_RGMII_RXD2},
+	{201, IMX8QM_ENET0_RGMII_RXD3},
+	{202, IMX8QM_ENET1_RGMII_TXC},
+	{203, IMX8QM_ENET1_RGMII_TX_CTL},
+	{204, IMX8QM_ENET1_RGMII_TXD0},
+	{205, IMX8QM_ENET1_RGMII_TXD1},
+	{206, IMX8QM_ENET1_RGMII_TXD2},
+	{207, IMX8QM_ENET1_RGMII_TXD3},
+	{208, IMX8QM_ENET1_RGMII_RXC},
+	{209, IMX8QM_ENET1_RGMII_RX_CTL},
+	{210, IMX8QM_ENET1_RGMII_RXD0},
+	{211, IMX8QM_ENET1_RGMII_RXD1},
+	{212, IMX8QM_ENET1_RGMII_RXD2},
+	{213, IMX8QM_ENET1_RGMII_RXD3},
+
+	/* GPIO7 */
+};
+
+const struct mxc_gpio_pad_map imx8qxp_pad_map[] = {
+	/* GPIO0 */
+	{  1, IMX8QXP_ESAI0_FST},
+	{  2, IMX8QXP_ESAI0_SCKR},
+	{  3, IMX8QXP_ESAI0_SCKT},
+	{  4, IMX8QXP_ESAI0_TX0},
+	{  5, IMX8QXP_ESAI0_TX1},
+	{  6, IMX8QXP_ESAI0_TX2_RX3},
+	{  7, IMX8QXP_ESAI0_TX3_RX2},
+	{  8, IMX8QXP_ESAI0_TX4_RX1},
+	{  9, IMX8QXP_ESAI0_TX5_RX0},
+	{ 10, IMX8QXP_SPDIF0_RX},
+	{ 11, IMX8QXP_SPDIF0_TX},
+	{ 12, IMX8QXP_SPDIF0_EXT_CLK},
+	{ 13, IMX8QXP_SPI3_SCK},
+	{ 14, IMX8QXP_SPI3_SDO},
+	{ 15, IMX8QXP_SPI3_SDI},
+	{ 16, IMX8QXP_SPI3_CS0},
+	{ 19, IMX8QXP_MCLK_IN0},
+	{ 20, IMX8QXP_MCLK_OUT0},
+	{ 21, IMX8QXP_UART1_TX},
+	{ 22, IMX8QXP_UART1_RX},
+	{ 24, IMX8QXP_UART1_CTS_B},
+	{ 25, IMX8QXP_SAI0_TXD},
+	{ 26, IMX8QXP_SAI0_TXC},
+	{ 27, IMX8QXP_SAI0_RXD},
+	{ 28, IMX8QXP_SAI0_TXFS},
+	{ 29, IMX8QXP_SAI1_RXD},
+	{ 30, IMX8QXP_SAI1_RXC},
+	{ 31, IMX8QXP_SAI1_RXFS},
+
+	/* GPIO1 */
+	{ 32, IMX8QXP_SPI2_CS0},
+	{ 33, IMX8QXP_SPI2_SDO},
+	{ 34, IMX8QXP_SPI2_SDI},
+	{ 35, IMX8QXP_SPI2_SCK},
+	{ 36, IMX8QXP_SPI0_SCK},
+	{ 37, IMX8QXP_SPI0_SDI},
+	{ 38, IMX8QXP_SPI0_SDO},
+	{ 39, IMX8QXP_SPI0_CS1},
+	{ 40, IMX8QXP_SPI0_CS0},
+	{ 41, IMX8QXP_ADC_IN1},
+	{ 42, IMX8QXP_ADC_IN0},
+	{ 43, IMX8QXP_ADC_IN3},
+	{ 44, IMX8QXP_ADC_IN2},
+	{ 45, IMX8QXP_ADC_IN5},
+	{ 46, IMX8QXP_ADC_IN4},
+	{ 47, IMX8QXP_FLEXCAN0_RX},
+	{ 48, IMX8QXP_FLEXCAN0_TX},
+	{ 49, IMX8QXP_FLEXCAN1_RX},
+	{ 50, IMX8QXP_FLEXCAN1_TX},
+	{ 51, IMX8QXP_FLEXCAN2_RX},
+	{ 52, IMX8QXP_FLEXCAN2_TX},
+	{ 53, IMX8QXP_UART0_RX},
+	{ 54, IMX8QXP_UART0_TX},
+	{ 55, IMX8QXP_UART2_TX},
+	{ 56, IMX8QXP_UART2_RX},
+	{ 57, IMX8QXP_MIPI_DSI0_I2C0_SCL},
+	{ 58, IMX8QXP_MIPI_DSI0_I2C0_SDA},
+	{ 59, IMX8QXP_MIPI_DSI0_GPIO0_00},
+	{ 60, IMX8QXP_MIPI_DSI0_GPIO0_01},
+	{ 61, IMX8QXP_MIPI_DSI1_I2C0_SCL},
+	{ 62, IMX8QXP_MIPI_DSI1_I2C0_SDA},
+	{ 63, IMX8QXP_MIPI_DSI1_GPIO0_00},
+
+	/* GPIO2 */
+	{ 64, IMX8QXP_MIPI_DSI1_GPIO0_01},
+	{ 65, IMX8QXP_PMIC_I2C_SCL},
+	{ 66, IMX8QXP_PMIC_I2C_SDA},
+	{ 67, IMX8QXP_SCU_GPIO0_00},
+
+	/* GPIO3 */
+	{ 96, IMX8QXP_CSI_PCLK},
+	{ 97, IMX8QXP_CSI_MCLK},
+	{ 98, IMX8QXP_CSI_EN},
+	{ 99, IMX8QXP_CSI_RESET},
+	{100, IMX8QXP_MIPI_CSI0_MCLK_OUT},
+	{101, IMX8QXP_MIPI_CSI0_I2C0_SCL},
+	{102, IMX8QXP_MIPI_CSI0_I2C0_SDA},
+	{103, IMX8QXP_MIPI_CSI0_GPIO0_01},
+	{104, IMX8QXP_MIPI_CSI0_GPIO0_00},
+	{105, IMX8QXP_QSPI0A_DATA0},
+	{106, IMX8QXP_QSPI0A_DATA1},
+	{107, IMX8QXP_QSPI0A_DATA2},
+	{108, IMX8QXP_QSPI0A_DATA3},
+	{109, IMX8QXP_QSPI0A_DQS},
+	{110, IMX8QXP_QSPI0A_SS0_B},
+	{111, IMX8QXP_QSPI0A_SS1_B},
+	{112, IMX8QXP_QSPI0A_SCLK},
+	{113, IMX8QXP_QSPI0B_SCLK},
+	{114, IMX8QXP_QSPI0B_DATA0},
+	{115, IMX8QXP_QSPI0B_DATA1},
+	{116, IMX8QXP_QSPI0B_DATA2},
+	{117, IMX8QXP_QSPI0B_DATA3},
+	{118, IMX8QXP_QSPI0B_DQS},
+	{119, IMX8QXP_QSPI0B_SS0_B},
+	{120, IMX8QXP_QSPI0B_SS1_B},
+
+	/* GPIO4 */
+	{128, IMX8QXP_PCIE_CTRL0_PERST_B},
+	{129, IMX8QXP_PCIE_CTRL0_CLKREQ_B},
+	{130, IMX8QXP_PCIE_CTRL0_WAKE_B},
+	{131, IMX8QXP_USB_SS3_TC0},
+	{132, IMX8QXP_USB_SS3_TC1},
+	{133, IMX8QXP_USB_SS3_TC2},
+	{134, IMX8QXP_USB_SS3_TC3},
+	{135, IMX8QXP_EMMC0_CLK},
+	{136, IMX8QXP_EMMC0_CMD},
+	{137, IMX8QXP_EMMC0_DATA0},
+	{138, IMX8QXP_EMMC0_DATA1},
+	{139, IMX8QXP_EMMC0_DATA2},
+	{140, IMX8QXP_EMMC0_DATA3},
+	{141, IMX8QXP_EMMC0_DATA4},
+	{142, IMX8QXP_EMMC0_DATA5},
+	{143, IMX8QXP_EMMC0_DATA6},
+	{144, IMX8QXP_EMMC0_DATA7},
+	{145, IMX8QXP_EMMC0_STROBE},
+	{146, IMX8QXP_EMMC0_RESET_B},
+	{147, IMX8QXP_USDHC1_RESET_B},
+	{148, IMX8QXP_USDHC1_VSELECT},
+	{149, IMX8QXP_USDHC1_WP},
+	{150, IMX8QXP_USDHC1_CD_B},
+	{151, IMX8QXP_USDHC1_CLK},
+	{152, IMX8QXP_USDHC1_CMD},
+	{153, IMX8QXP_USDHC1_DATA0},
+	{154, IMX8QXP_USDHC1_DATA1},
+	{155, IMX8QXP_USDHC1_DATA2},
+	{156, IMX8QXP_USDHC1_DATA3},
+	{157, IMX8QXP_ENET0_RGMII_TXC},
+	{158, IMX8QXP_ENET0_RGMII_TX_CTL},
+	{159, IMX8QXP_ENET0_RGMII_TXD0},
+
+	/* GPIO5 */
+	{160, IMX8QXP_ENET0_RGMII_TXD1},
+	{161, IMX8QXP_ENET0_RGMII_TXD2},
+	{162, IMX8QXP_ENET0_RGMII_TXD3},
+	{163, IMX8QXP_ENET0_RGMII_RXC},
+	{164, IMX8QXP_ENET0_RGMII_RX_CTL},
+	{165, IMX8QXP_ENET0_RGMII_RXD0},
+	{166, IMX8QXP_ENET0_RGMII_RXD1},
+	{167, IMX8QXP_ENET0_RGMII_RXD2},
+	{168, IMX8QXP_ENET0_RGMII_RXD3},
+	{169, IMX8QXP_ENET0_REFCLK_125M_25M},
+	{170, IMX8QXP_ENET0_MDIO},
+	{171, IMX8QXP_ENET0_MDC},
+
+	/* GPIO6 */
+
+	/* GPIO7 */
+};
+
+const struct mxc_gpio_pad_map imx8dxl_pad_map[] = {
+	/* GPIO0 */
+	{  0, IMX8DXL_ENET1_RGMII_TXC},
+	{  1, IMX8DXL_ENET1_RGMII_TXD2},
+	{  2, IMX8DXL_ENET1_RGMII_TX_CTL},
+	{  3, IMX8DXL_ENET1_RGMII_TXD3},
+	{  4, IMX8DXL_ENET1_RGMII_RXC},
+	{  5, IMX8DXL_ENET1_RGMII_RXD3},
+	{  6, IMX8DXL_ENET1_RGMII_RXD2},
+	{  7, IMX8DXL_ENET1_RGMII_RXD1},
+	{  8, IMX8DXL_ENET1_RGMII_TXD0},
+	{  9, IMX8DXL_ENET1_RGMII_TXD1},
+	{ 10, IMX8DXL_ENET1_RGMII_RXD0},
+	{ 11, IMX8DXL_ENET1_RGMII_RX_CTL},
+	{ 12, IMX8DXL_ENET1_REFCLK_125M_25M},
+	{ 13, IMX8DXL_SPI3_SCK},
+	{ 14, IMX8DXL_SPI3_SDO},
+	{ 15, IMX8DXL_SPI3_SDI},
+	{ 16, IMX8DXL_SPI3_CS0},
+	{ 19, IMX8DXL_MCLK_IN0},
+	{ 20, IMX8DXL_MCLK_OUT0},
+	{ 21, IMX8DXL_UART1_TX},
+	{ 22, IMX8DXL_UART1_RX},
+	{ 24, IMX8DXL_UART1_CTS_B},
+
+	/* GPIO1 */
+	{ 36, IMX8DXL_SPI0_SCK},
+	{ 37, IMX8DXL_SPI0_SDI},
+	{ 38, IMX8DXL_SPI0_SDO},
+	{ 39, IMX8DXL_SPI0_CS1},
+	{ 40, IMX8DXL_SPI0_CS0},
+	{ 41, IMX8DXL_ADC_IN1},
+	{ 42, IMX8DXL_ADC_IN0},
+	{ 43, IMX8DXL_ADC_IN3},
+	{ 44, IMX8DXL_ADC_IN2},
+	{ 45, IMX8DXL_ADC_IN5},
+	{ 46, IMX8DXL_ADC_IN4},
+	{ 47, IMX8DXL_FLEXCAN0_RX},
+	{ 48, IMX8DXL_FLEXCAN0_TX},
+	{ 49, IMX8DXL_FLEXCAN1_RX},
+	{ 50, IMX8DXL_FLEXCAN1_TX},
+	{ 51, IMX8DXL_FLEXCAN2_RX},
+	{ 52, IMX8DXL_FLEXCAN2_TX},
+	{ 53, IMX8DXL_UART0_RX},
+	{ 54, IMX8DXL_UART0_TX},
+	{ 55, IMX8DXL_UART2_TX},
+	{ 56, IMX8DXL_UART2_RX},
+
+	/* GPIO2 */
+	{ 65, IMX8DXL_PMIC_I2C_SCL},
+	{ 66, IMX8DXL_PMIC_I2C_SDA},
+	{ 67, IMX8DXL_SCU_GPIO0_00},
+	{ 69, IMX8DXL_SNVS_TAMPER_OUT1},
+	{ 70, IMX8DXL_SNVS_TAMPER_OUT2},
+	{ 71, IMX8DXL_SNVS_TAMPER_OUT3},
+	{ 72, IMX8DXL_SNVS_TAMPER_OUT4},
+	{ 73, IMX8DXL_SNVS_TAMPER_IN0},
+	{ 74, IMX8DXL_SNVS_TAMPER_IN1},
+	{ 75, IMX8DXL_SNVS_TAMPER_IN2},
+	{ 76, IMX8DXL_SNVS_TAMPER_IN3},
+
+	/* GPIO3 */
+	{ 96, IMX8DXL_SPI1_SCK},
+	{ 97, IMX8DXL_SPI1_SDO},
+	{ 98, IMX8DXL_SPI1_SDI},
+	{ 99, IMX8DXL_SPI1_CS0},
+	{105, IMX8DXL_QSPI0A_DATA0},
+	{106, IMX8DXL_QSPI0A_DATA1},
+	{107, IMX8DXL_QSPI0A_DATA2},
+	{108, IMX8DXL_QSPI0A_DATA3},
+	{109, IMX8DXL_QSPI0A_DQS},
+	{110, IMX8DXL_QSPI0A_SS0_B},
+	{112, IMX8DXL_QSPI0A_SCLK},
+	{113, IMX8DXL_QSPI0B_SCLK},
+	{114, IMX8DXL_QSPI0B_DATA0},
+	{115, IMX8DXL_QSPI0B_DATA1},
+	{116, IMX8DXL_QSPI0B_DATA2},
+	{117, IMX8DXL_QSPI0B_DATA3},
+	{118, IMX8DXL_QSPI0B_DQS},
+	{119, IMX8DXL_QSPI0B_SS0_B},
+
+	/* GPIO4 */
+	{128, IMX8DXL_PCIE_CTRL0_PERST_B},
+	{129, IMX8DXL_PCIE_CTRL0_CLKREQ_B},
+	{130, IMX8DXL_PCIE_CTRL0_WAKE_B},
+	{131, IMX8DXL_USB_SS3_TC0},
+	{132, IMX8DXL_USB_SS3_TC1},
+	{133, IMX8DXL_USB_SS3_TC2},
+	{134, IMX8DXL_USB_SS3_TC3},
+	{135, IMX8DXL_EMMC0_CLK},
+	{136, IMX8DXL_EMMC0_CMD},
+	{137, IMX8DXL_EMMC0_DATA0},
+	{138, IMX8DXL_EMMC0_DATA1},
+	{139, IMX8DXL_EMMC0_DATA2},
+	{140, IMX8DXL_EMMC0_DATA3},
+	{141, IMX8DXL_EMMC0_DATA4},
+	{142, IMX8DXL_EMMC0_DATA5},
+	{143, IMX8DXL_EMMC0_DATA6},
+	{144, IMX8DXL_EMMC0_DATA7},
+	{145, IMX8DXL_EMMC0_STROBE},
+	{146, IMX8DXL_EMMC0_RESET_B},
+	{147, IMX8DXL_USDHC1_RESET_B},
+	{148, IMX8DXL_USDHC1_VSELECT},
+	{149, IMX8DXL_USDHC1_WP},
+	{150, IMX8DXL_USDHC1_CD_B},
+	{157, IMX8DXL_ENET0_RGMII_TXC},
+	{158, IMX8DXL_ENET0_RGMII_TX_CTL},
+	{159, IMX8DXL_ENET0_RGMII_TXD0},
+
+	/* GPIO5 */
+	{160, IMX8DXL_ENET0_RGMII_TXD1},
+	{161, IMX8DXL_ENET0_RGMII_TXD2},
+	{162, IMX8DXL_ENET0_RGMII_TXD3},
+	{163, IMX8DXL_ENET0_RGMII_RXC},
+	{164, IMX8DXL_ENET0_RGMII_RX_CTL},
+	{165, IMX8DXL_ENET0_RGMII_RXD0},
+	{166, IMX8DXL_ENET0_RGMII_RXD1},
+	{167, IMX8DXL_ENET0_RGMII_RXD2},
+	{168, IMX8DXL_ENET0_RGMII_RXD3},
+	{169, IMX8DXL_ENET0_REFCLK_125M_25M},
+	{170, IMX8DXL_ENET0_MDIO},
+	{171, IMX8DXL_ENET0_MDC},
+
+	/* GPIO6 */
+	{192, IMX8DXL_ENET1_RGMII_RXD2},
+	{193, IMX8DXL_ENET1_RGMII_RXD1},
+	{194, IMX8DXL_ENET1_RGMII_TXD0},
+	{195, IMX8DXL_ENET1_RGMII_TXD1},
+	{196, IMX8DXL_ENET1_RGMII_RXD0},
+	{197, IMX8DXL_ENET1_RGMII_RX_CTL},
+	{198, IMX8DXL_ENET1_REFCLK_125M_25M},
+	{200, IMX8DXL_FLEXCAN0_RX},
+	{201, IMX8DXL_FLEXCAN0_TX},
+	{202, IMX8DXL_FLEXCAN1_RX},
+	{203, IMX8DXL_FLEXCAN1_TX},
+	{204, IMX8DXL_FLEXCAN2_RX},
+	{205, IMX8DXL_FLEXCAN2_TX},
+	{206, IMX8DXL_UART0_RX},
+	{207, IMX8DXL_UART0_TX},
+	{208, IMX8DXL_UART2_TX},
+	{209, IMX8DXL_UART2_RX},
+	{211, IMX8DXL_SNVS_TAMPER_OUT1},
+	{212, IMX8DXL_SNVS_TAMPER_OUT2},
+	{213, IMX8DXL_SNVS_TAMPER_OUT3},
+	{214, IMX8DXL_SNVS_TAMPER_OUT4},
+	{215, IMX8DXL_SNVS_TAMPER_IN0},
+	{216, IMX8DXL_SNVS_TAMPER_IN1},
+	{217, IMX8DXL_SNVS_TAMPER_IN2},
+	{218, IMX8DXL_SNVS_TAMPER_IN3},
+
+	/* GPIO7 */
+	{224, IMX8DXL_PCIE_CTRL0_PERST_B},
+	{225, IMX8DXL_PCIE_CTRL0_CLKREQ_B},
+	{226, IMX8DXL_PCIE_CTRL0_WAKE_B},
+	{227, IMX8DXL_USB_SS3_TC0},
+	{228, IMX8DXL_USB_SS3_TC1},
+	{229, IMX8DXL_USB_SS3_TC2},
+	{230, IMX8DXL_USB_SS3_TC3},
+	{232, IMX8DXL_USDHC1_RESET_B},
+	{233, IMX8DXL_USDHC1_VSELECT},
+	{234, IMX8DXL_USDHC1_WP},
+	{235, IMX8DXL_USDHC1_CD_B},
+	{240, IMX8DXL_ENET0_MDIO},
+	{241, IMX8DXL_ENET0_MDC},
+};
+
 static struct mxc_gpio_hwdata imx1_imx21_gpio_hwdata = {
 	.dr_reg		= 0x1c,
 	.gdir_reg	= 0x00,
@@ -94,20 +676,35 @@ static struct mxc_gpio_hwdata imx31_gpio_hwdata = {
 	.fall_edge	= 0x03,
 };

-static struct mxc_gpio_hwdata imx35_gpio_hwdata = {
-	.dr_reg		= 0x00,
-	.gdir_reg	= 0x04,
-	.psr_reg	= 0x08,
-	.icr1_reg	= 0x0c,
-	.icr2_reg	= 0x10,
-	.imr_reg	= 0x14,
-	.isr_reg	= 0x18,
-	.edge_sel_reg	= 0x1c,
-	.low_level	= 0x00,
-	.high_level	= 0x01,
-	.rise_edge	= 0x02,
-	.fall_edge	= 0x03,
-};
+#define MXC_GPIO_HWDATA(soc, map, size) \
+	static __maybe_unused struct mxc_gpio_hwdata soc##_gpio_hwdata = { \
+	.dr_reg		= 0x00,	\
+	.gdir_reg	= 0x04,	\
+	.psr_reg	= 0x08,	\
+	.icr1_reg	= 0x0c,	\
+	.icr2_reg	= 0x10,	\
+	.imr_reg	= 0x14,	\
+	.isr_reg	= 0x18,	\
+	.edge_sel_reg	= 0x1c,	\
+	.low_level	= 0x00,	\
+	.high_level	= 0x01,	\
+	.rise_edge	= 0x02,	\
+	.fall_edge	= 0x03,	\
+	.pad_map	= map,	\
+	.pad_map_size	= size,	\
+}
+
+static const u32
+imx8qm_pad_map_size = sizeof(imx8qm_pad_map)/sizeof(struct mxc_gpio_pad_map);
+static const u32
+imx8qxp_pad_map_size = sizeof(imx8qxp_pad_map)/sizeof(struct mxc_gpio_pad_map);
+static const u32
+imx8dxl_pad_map_size = sizeof(imx8dxl_pad_map)/sizeof(struct mxc_gpio_pad_map);
+
+MXC_GPIO_HWDATA(imx35, 0, 0);
+MXC_GPIO_HWDATA(imx8qm, imx8qm_pad_map, imx8qm_pad_map_size);
+MXC_GPIO_HWDATA(imx8qxp, imx8qxp_pad_map, imx8qxp_pad_map_size);
+MXC_GPIO_HWDATA(imx8dxl, imx8dxl_pad_map, imx8dxl_pad_map_size);

 #define GPIO_DR			(port->hwdata->dr_reg)
 #define GPIO_GDIR		(port->hwdata->gdir_reg)
@@ -130,6 +727,9 @@ static const struct of_device_id mxc_gpio_dt_ids[] = {
 	{ .compatible = "fsl,imx31-gpio", .data = &imx31_gpio_hwdata },
 	{ .compatible = "fsl,imx35-gpio", .data = &imx35_gpio_hwdata },
 	{ .compatible = "fsl,imx7d-gpio", .data = &imx35_gpio_hwdata },
+	{ .compatible = "fsl,imx8qm-gpio", .data = &imx8qm_gpio_hwdata },
+	{ .compatible = "fsl,imx8qxp-gpio", .data = &imx8qxp_gpio_hwdata },
+	{ .compatible = "fsl,imx8dxl-gpio", .data = &imx8dxl_gpio_hwdata },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mxc_gpio_dt_ids);
@@ -141,6 +741,32 @@ MODULE_DEVICE_TABLE(of, mxc_gpio_dt_ids);
  */
 static LIST_HEAD(mxc_gpio_ports);

+static int get_gpio_index_on_imx8(struct device_node *np, int base)
+{
+	static const u32 gpio_array[] = {
+		0x5d080000,	/* GPIO 0 */
+		0x5d090000,	/* GPIO 1 */
+		0x5d0a0000,	/* GPIO 2 */
+		0x5d0b0000,	/* GPIO 3 */
+		0x5d0c0000,	/* GPIO 4 */
+		0x5d0d0000,	/* GPIO 5 */
+		0x5d0e0000,	/* GPIO 6 */
+		0x5d0f0000,	/* GPIO 7 */
+	};
+	int i;
+
+	if (of_device_is_compatible(np, "fsl,imx8dxl-gpio") ||
+		of_device_is_compatible(np, "fsl,imx8qxp-gpio") ||
+		of_device_is_compatible(np, "fsl,imx35-gpio")) {
+
+		for (i = 0; i < sizeof(gpio_array)/sizeof(u32); i++)
+			if (base == gpio_array[i])
+				return i;
+	}
+
+	return -1;
+}
+
 /* Note: This driver assumes 32 GPIOs are handled in one register */

 static int gpio_set_irq_type(struct irq_data *d, u32 type)
@@ -203,6 +829,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 	}

 	writel(1 << gpio_idx, port->base + GPIO_ISR);
+	port->pad_type[gpio_idx] = type;

 	return 0;
 }
@@ -306,11 +933,13 @@ static int gpio_set_wake_irq(struct irq_data *d, u32 enable)
 			ret = enable_irq_wake(port->irq_high);
 		else
 			ret = enable_irq_wake(port->irq);
+		port->wakeup_pads |= (1<<gpio_idx);
 	} else {
 		if (port->irq_high && (gpio_idx >= 16))
 			ret = disable_irq_wake(port->irq_high);
 		else
 			ret = disable_irq_wake(port->irq);
+		port->wakeup_pads &= ~(1<<gpio_idx);
 	}

 	return ret;
@@ -368,6 +997,11 @@ static int mxc_gpio_probe(struct platform_device *pdev)

 	port->hwdata = device_get_match_data(&pdev->dev);

+	port->gpio_index = get_gpio_index_on_imx8(np, pdev->resource->start);
+	if (port->gpio_index != -1)
+		imx_scu_irq_group_enable(IMX_SC_IRQ_GROUP_WAKE,
+					 IMX_SC_IRQ_PAD, true);
+
 	port->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(port->base))
 		return PTR_ERR(port->base);
@@ -498,6 +1132,108 @@ static void mxc_gpio_restore_regs(struct mxc_gpio_port *port)
 	writel(port->gpio_saved_reg.dr, port->base + GPIO_DR);
 }

+static int mxc_gpio_get_pad_index(const struct mxc_gpio_pad_map *pad_map,
+				  int size, int idx)
+{
+	const struct mxc_gpio_pad_map *map;
+	int i;
+
+	if (!pad_map)
+		return -1;
+
+	for (i = 0; i < size; i++) {
+		map = pad_map + i;
+		if (map && (map->index == idx))
+			return map->pad_index;
+	}
+
+	return -1;
+}
+
+static void mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
+{
+	struct imx_sc_msg_gpio_set_pad_wakeup msg;
+	struct imx_sc_rpc_msg *hdr = &msg.hdr;
+	struct imx_sc_ipc *ipc_handle;
+	int ret, idx, type;
+	int i;
+
+	static const u32 pad_type_map[] = {
+		IMX_SC_PAD_WAKEUP_OFF,		/* 0 */
+		IMX_SC_PAD_WAKEUP_RISE_EDGE,	/* IRQ_TYPE_EDGE_RISING */
+		IMX_SC_PAD_WAKEUP_FALL_EDGE,	/* IRQ_TYPE_EDGE_FALLING */
+		IMX_SC_PAD_WAKEUP_FALL_EDGE,	/* IRQ_TYPE_EDGE_BOTH */
+		IMX_SC_PAD_WAKEUP_HIGH_LVL,	/* IRQ_TYPE_LEVEL_HIGH */
+		IMX_SC_PAD_WAKEUP_OFF,		/* 5 */
+		IMX_SC_PAD_WAKEUP_OFF,		/* 6 */
+		IMX_SC_PAD_WAKEUP_OFF,		/* 7 */
+		IMX_SC_PAD_WAKEUP_LOW_LVL,	/* IRQ_TYPE_LEVEL_LOW */
+	};
+
+	if (port->gpio_index == -1)
+		return;
+
+	ret = imx_scu_get_handle(&ipc_handle);
+	if (ret) {
+		dev_err(port->gc.parent, "scu error: ret=%d\n", ret);
+		return;
+	}
+
+	hdr->ver = IMX_SC_RPC_VERSION;
+	hdr->svc = IMX_SC_RPC_SVC_PAD;
+	hdr->func = IMX_SC_PAD_FUNC_SET_WAKEUP;
+	hdr->size = 2;
+
+	for (i = 0; i < 32; i++) {
+		if ((port->wakeup_pads & (1<<i))) {
+			idx = mxc_gpio_get_pad_index(port->hwdata->pad_map,
+					       port->hwdata->pad_map_size,
+					       port->gpio_index * 32 + i);
+
+			if (idx < 0)
+				continue;
+
+			type = port->pad_type[i];
+			msg.pad = idx;
+			msg.wakeup = enable ? pad_type_map[type]
+				: IMX_SC_PAD_WAKEUP_OFF;
+			ret = imx_scu_call_rpc(ipc_handle, &msg, true);
+			if (ret < 0)
+				dev_err(port->gc.parent, "set pad %d ret=%d\n",
+					idx, ret);
+		}
+	}
+}
+
+static int __maybe_unused mxc_gpio_noirq_suspend(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct mxc_gpio_port *port = platform_get_drvdata(pdev);
+
+	if (port->wakeup_pads > 0) {
+		mxc_gpio_set_pad_wakeup(port, true);
+		port->is_pad_wakeup = 1;
+	}
+
+	return 0;
+}
+
+static int __maybe_unused mxc_gpio_noirq_resume(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct mxc_gpio_port *port = platform_get_drvdata(pdev);
+
+	if (port->wakeup_pads > 0)
+		mxc_gpio_set_pad_wakeup(port, false);
+	port->is_pad_wakeup = 0;
+
+	return 0;
+}
+
+static const struct dev_pm_ops mxc_gpio_dev_pm_ops = {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(mxc_gpio_noirq_suspend, mxc_gpio_noirq_resume)
+};
+
 static int mxc_gpio_syscore_suspend(void)
 {
 	struct mxc_gpio_port *port;
@@ -537,6 +1273,7 @@ static struct platform_driver mxc_gpio_driver = {
 		.name	= "gpio-mxc",
 		.of_match_table = mxc_gpio_dt_ids,
 		.suppress_bind_attrs = true,
+		.pm = &mxc_gpio_dev_pm_ops,
 	},
 	.probe		= mxc_gpio_probe,
 };
--
2.34.1

