Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC62869C427
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Feb 2023 03:34:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbjBTCeB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 19 Feb 2023 21:34:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbjBTCeA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 19 Feb 2023 21:34:00 -0500
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2084.outbound.protection.outlook.com [40.107.8.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AD45A5F4;
        Sun, 19 Feb 2023 18:33:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WsmQqXrBKtWdGbQq7nuSh9oHcrNmDHqNlZ7Bg+/C6G/kgfEFCV3CO46X6RVsWkl4f60CTnZcnULNp/GAT3VSw/HDaYzzymYBpuerCLhR9oR0KxBrfTslNOQz0N8LKKL3zhlE7kAACLxWRm0Tt3jX9RQNgF6BJnLEn8EHI4HWK2wixklKhdH1NOUD8guGgMdzY8b/uoWzMklkFE0yFPlyBi36Ybs9wgSfoM/YBzpkzMwq+7snvAfFYUt1y1qT+CL5GdCzelgCHuXGKJSRGbr6B4pyQNW5M65tsJ/Xux+beGHv0SpX1e2MDqZMuLH7fCgBdX1jLTvG5t62fsrOQGJiZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CI5xQnqXazhW9RRh2D62QNGQAEwxUbtY1s2Syfci1g=;
 b=QJWEfZ83vB1th3PFYCuFJ1I1D7y/4AxNS+bkXD7lkwhDRMym2ZOjREbQ3V/w4RzfdswXu3LOqJbg2XXonQ/z/8EPfdmDiyUGy9LiOpczX1+qRI8QWSIj73mnxaDwCJ/N3bb9Y/kreRlwU5qtdvdxhj+c3GNYf+bNzAtSmOJABePVsgMVXHJIsNm+dp1+ITI2169GKcN6Q7QR7VeBDKuOAGrWU6HWJbXsJNWdfVg7DkagPAqGq92lFyOJe1qMYJuMrJAgrYPrDiv/EyCUu0CwVthULL4dvUkPdUTHsOW3f10d5p0TFNz2x/Q9FrGV2NYppnzxnHHP6AW6r2nPZidVNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CI5xQnqXazhW9RRh2D62QNGQAEwxUbtY1s2Syfci1g=;
 b=APDNYb/4M2r4ZX6DTMA2fXVpCT7+lOpgoV8GuH/Xo3CMgYnTLnK6s2UAuREABgYdO/+oBUCujkahXWzGmhbB/0+yxAwKpNjJU4hkccS5sQCCwPab65RtYa+WkRFdLig5vYd6wm51JUEu5nEP0CtU5smA/wrjSNZW3aPSesjPD6je6wXd9+4cW1Kld4CVrX8WPo85gbNUKRHiZ7OJZBphVRasIQOoD6tHRYKbLBwXa26HkChAPOQ9Ku+PK5mpdOM0jt6OTpFbOMDci4FqAA2CdotBP3q+9I92hmAeNGvX5FXE6HA8ZVrqmB4ZmGgiwlZy/9aXtE7ziWdCzBTbEeyO6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from AM0PR0402MB3428.eurprd04.prod.outlook.com
 (2603:10a6:208:1a::25) by AM8PR04MB7762.eurprd04.prod.outlook.com
 (2603:10a6:20b:241::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Mon, 20 Feb
 2023 02:33:50 +0000
Received: from AM0PR0402MB3428.eurprd04.prod.outlook.com
 ([fe80::4157:bcf7:8f05:fab3]) by AM0PR0402MB3428.eurprd04.prod.outlook.com
 ([fe80::4157:bcf7:8f05:fab3%6]) with mapi id 15.20.6111.019; Mon, 20 Feb 2023
 02:33:50 +0000
From:   Chester Lin <clin@suse.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Cc:     Chester Lin <clin@suse.com>, s32@nxp.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Larisa Grigore <larisa.grigore@nxp.com>,
        Ghennadi Procopciuc <Ghennadi.Procopciuc@oss.nxp.com>,
        Andrei Stefanescu <andrei.stefanescu@nxp.com>,
        Radu Pirea <radu-nicolae.pirea@nxp.com>,
        Matthias Brugger <mbrugger@suse.com>,
        Matthew Nunez <matthew.nunez@nxp.com>,
        Phu Luu An <phu.luuan@nxp.com>,
        Stefan-Gabriel Mirea <stefan-gabriel.mirea@nxp.com>
Subject: [PATCH v5 2/3] pinctrl: add NXP S32 SoC family support
Date:   Mon, 20 Feb 2023 10:33:19 +0800
Message-Id: <20230220023320.3499-3-clin@suse.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230220023320.3499-1-clin@suse.com>
References: <20230220023320.3499-1-clin@suse.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0191.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::16) To AM0PR0402MB3428.eurprd04.prod.outlook.com
 (2603:10a6:208:1a::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3428:EE_|AM8PR04MB7762:EE_
X-MS-Office365-Filtering-Correlation-Id: 0de0e7a9-3457-4bb0-d3ab-08db12eae660
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6eP27ocXGhl1qwaJ1SJ7qQdvYltnNNWdCUPcgJTGKEQzLbdHXuShN6Iq6pQI6IX7yWsgo207LXsYdc8tW8v3iWsx7xufnlJFo/pj8UNjyMiGlWSSSAhvBUQrWxhZ4dN4jOxM7hxtsvEvRXUdwRFCTR9kdcMp82eW6EPhj0wzwR+IvyrFkO5LYX6qImXGQUsUz5hvu0/xuxMDSONeqdoV5ez9PNub7KCxISFdAxUdGw61g3QM+29XRyfu3eVzA2xTwdU9J23kuFCpBOmjGPE6xQzjpLKQ/aqaX+rxU48SUZKNcajJQJpmUcDZuX4ggHAZQDBJXqNHeRZMwKKWDpGC2kWkexqrbzrulRS8tQTfeoLhzEiUqzFpFLrEMu8s/rfQ+ZmD07IFDgQMigdt8HOineri6lcH2R3IpQ5eck7Hut5oYLFQ7jmMC9S3x6Ekho1uVZOCqzIMHDgo1ZE1t3EuFv2zRNHPetp04OYmbuuuLz5NOAmaejxi3NqVNPqeAxp5hD9fAgfYdvzaBig0hBKxtH3ku54TNBda7ckaCdfG+wCZdyr9iiDs8WzagmvIZUGEYW7TP7bPKQLHtih4KRDfIOLS/XKyVfcEEA/Pmo9lmXgm/ZhctRJdwFRTAMaxLgL1
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3428.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(366004)(39860400002)(376002)(396003)(346002)(451199018)(6486002)(186003)(26005)(966005)(6512007)(66556008)(4326008)(8676002)(66476007)(5660300002)(6666004)(7416002)(83380400001)(8936002)(2616005)(66946007)(6506007)(1076003)(36756003)(316002)(478600001)(110136005)(41300700001)(19627235002)(54906003)(38100700002)(86362001)(30864003)(2906002)(579004)(559001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/QbO1VheuyZS5XZiyRN/atX3iiGXwgzzjLTCWIYkVa/aoydK62LIfwzJy7BN?=
 =?us-ascii?Q?KE3ve9R0EC6zkSBlqUS8WdFC0R5mP2RTYPjFRB+dQJXoac7Pl/pIWzFcdpMP?=
 =?us-ascii?Q?Yng7lUH71eiPY6PqsA2rwzI77rWLjwRHtNcIuhnj9klYEfmGPec6OttTQl15?=
 =?us-ascii?Q?AlJnXvQZ++4OOArEbYmW+nTihId2t9TyRnIOgPbYe1/xF5w4pZC9Bb3UwUnj?=
 =?us-ascii?Q?wTuQR9Qs3EzlJ7UrvkhMHHbxLUizqd0lkrzg9BLNs2uecghs4kCdDoMmdbBW?=
 =?us-ascii?Q?2q3Mj+EFjBNluj7fzFg3StkBPj6o4uOJ3kta9SY31WfzFnR7vDEWZKdu354u?=
 =?us-ascii?Q?GmASl+JxRWI6juGtBEZPdk+BEjaFr8O/WBJwGOceh28fQZLK+/QYdo6leGDK?=
 =?us-ascii?Q?NiH9St4HnJMvn1pQiFDjH0rKLEfPcVQsnmSWvavAmehTBKsvQdvzk+RoLT3C?=
 =?us-ascii?Q?osBt8hjFzIISg8cGaGcII1nwk+WTy6GPcZf5T9KVD4pkqoEkwkk824ub8lWz?=
 =?us-ascii?Q?0sD6yytLLhVi3z0lstL/09RLsIxB8zghh/dC782QZI99rL8TAJdTcd9O0bgF?=
 =?us-ascii?Q?BbdbhuXPk8mmmhgztqbiqhMHCuWVfdxoaUC6JTi2zBd2IxaI28aHK6mzeW/V?=
 =?us-ascii?Q?QaH7I9yv7BZ9n+unWmtsERyLFVywvM/nJiSBZhmJKNKNnFblUeJQ7IVunKNo?=
 =?us-ascii?Q?NFTV+W7Vj7bbQOhYMep7q67So0AlbhxO7UtOIOV/H1SNVAPfRUN1Mi34Dvqm?=
 =?us-ascii?Q?geznBzqDtRSTHHuCYkWljOfoiJI4IrJtxSXHzQ9Mj/TQEO9Czn6u1fJ/G1kj?=
 =?us-ascii?Q?bQB3pLVc5I2lRKohmnSwCLtDJWpMbDumaBbDbalGuVS8lp6mWW2Ln9uId3kM?=
 =?us-ascii?Q?EZ0FAuaMr0owAcYxMLCZfdf77Zs3aFtxuv8HpF6VLoIGAdHtLPwIHfPGv2XO?=
 =?us-ascii?Q?HVt/M507VN7t5rhnnAEK5z5ZipiB+R8mtzuVkeWnd/vNJyqd2+/EIbIZ6ijJ?=
 =?us-ascii?Q?VfWOUpmuk37534vn5JJtyUEJpp++x07kVp49QuHtkQnp4paHDhr82ju9wCXm?=
 =?us-ascii?Q?fpSuOuGtHLbnQY8qdq13L4Aksjr3onBgx4xLE7hY/K4vKA1SgOywz0DNQ/4/?=
 =?us-ascii?Q?YLwiUDRNB6kMMxQcUgJN6KkmkV22Lg4K9h5HtkJQ4JSLxaI3Ur/l9iOWb1Db?=
 =?us-ascii?Q?RpAsv2Gy450aw0zjiFGraAIFsWTWdPOz6nXJLNIgJsoruxartfYk483oGo5N?=
 =?us-ascii?Q?czzA03/xY+9NhnT+TKqrtFmNHf2ZaEsHkn5Of4GmFzEIo085lnjO1peTsC4f?=
 =?us-ascii?Q?vwbzjBk3vFdtEOZ96PVCatKuyodkS6lVeZiNYbSld2WaZdsPPM+z8DuHCqMY?=
 =?us-ascii?Q?uV9nJ236bgUtII5lDwZDPMQZRXqFZVUEoc9xz6zM8EM+CIpuAgbmwKXmXDdX?=
 =?us-ascii?Q?c06ojQCsp+F5teP7hC+dfzVplQtVEZon4owoWlv8OQEv/bYjOo4tZV7ob9es?=
 =?us-ascii?Q?Zgafm81xKfqkQCo8gUNUG69yKCIGz6PO0BLWmIXCPWNJv0Sy2MKUKtdwp4Dr?=
 =?us-ascii?Q?5hKFJAawIvc/iMQqi4Y=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0de0e7a9-3457-4bb0-d3ab-08db12eae660
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3428.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 02:33:50.4028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CahJmbR7+Eu/ht6EduxaPXnzjodDzwVYWc8qg3WNYEPEYwOhzyv0+l9JO9Nj21IT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7762
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the pinctrl driver for NXP S32 SoC family. This driver is mainly based
on NXP's downstream implementation on nxp-auto-linux repo[1].

[1] https://github.com/nxp-auto-linux/linux/tree/bsp35.0-5.15.73-rt/drivers/pinctrl/freescale

Signed-off-by: Matthew Nunez <matthew.nunez@nxp.com>
Signed-off-by: Phu Luu An <phu.luuan@nxp.com>
Signed-off-by: Stefan-Gabriel Mirea <stefan-gabriel.mirea@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@oss.nxp.com>
Signed-off-by: Andrei Stefanescu <andrei.stefanescu@nxp.com>
Signed-off-by: Radu Pirea <radu-nicolae.pirea@nxp.com>
Signed-off-by: Chester Lin <clin@suse.com>
---

Changes in v5:
- Refactor register r/w access based on REGMAP_MMIO and regmap APIs.
- Tag PM functions with '__maybe_unused'.
- Add mask check while parsing pin ID from a pinmux value.
- Simplify s32_pinconf_mscr_* functions.

Changes in v4:
- Add a mapping table for converting the slew rates to register
  settings.
- Move driver files into an independent folder drivers/pinctrl/nxp

 drivers/pinctrl/Kconfig             |   1 +
 drivers/pinctrl/Makefile            |   1 +
 drivers/pinctrl/nxp/Kconfig         |  15 +
 drivers/pinctrl/nxp/Makefile        |   4 +
 drivers/pinctrl/nxp/pinctrl-s32.h   |  75 +++
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 945 ++++++++++++++++++++++++++++
 drivers/pinctrl/nxp/pinctrl-s32g2.c | 773 +++++++++++++++++++++++
 7 files changed, 1814 insertions(+)
 create mode 100644 drivers/pinctrl/nxp/Kconfig
 create mode 100644 drivers/pinctrl/nxp/Makefile
 create mode 100644 drivers/pinctrl/nxp/pinctrl-s32.h
 create mode 100644 drivers/pinctrl/nxp/pinctrl-s32cc.c
 create mode 100644 drivers/pinctrl/nxp/pinctrl-s32g2.c

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 7d5f5458c72e..2ac142884b98 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -535,6 +535,7 @@ source "drivers/pinctrl/meson/Kconfig"
 source "drivers/pinctrl/mvebu/Kconfig"
 source "drivers/pinctrl/nomadik/Kconfig"
 source "drivers/pinctrl/nuvoton/Kconfig"
+source "drivers/pinctrl/nxp/Kconfig"
 source "drivers/pinctrl/pxa/Kconfig"
 source "drivers/pinctrl/qcom/Kconfig"
 source "drivers/pinctrl/ralink/Kconfig"
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index d5939840bb2a..c40397af024b 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -64,6 +64,7 @@ obj-$(CONFIG_PINCTRL_MESON)	+= meson/
 obj-y				+= mvebu/
 obj-y				+= nomadik/
 obj-y				+= nuvoton/
+obj-y				+= nxp/
 obj-$(CONFIG_PINCTRL_PXA)	+= pxa/
 obj-$(CONFIG_ARCH_QCOM)		+= qcom/
 obj-$(CONFIG_PINCTRL_RALINK)	+= ralink/
diff --git a/drivers/pinctrl/nxp/Kconfig b/drivers/pinctrl/nxp/Kconfig
new file mode 100644
index 000000000000..abca7ef97003
--- /dev/null
+++ b/drivers/pinctrl/nxp/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config PINCTRL_S32CC
+	bool
+	depends on ARCH_S32 && OF
+	select GENERIC_PINCTRL_GROUPS
+	select GENERIC_PINMUX_FUNCTIONS
+	select GENERIC_PINCONF
+	select REGMAP_MMIO
+
+config PINCTRL_S32G2
+	depends on ARCH_S32 && OF
+	bool "NXP S32G2 pinctrl driver"
+	select PINCTRL_S32CC
+	help
+	  Say Y here to enable the pinctrl driver for NXP S32G2 family SoCs
diff --git a/drivers/pinctrl/nxp/Makefile b/drivers/pinctrl/nxp/Makefile
new file mode 100644
index 000000000000..c1cff4870b02
--- /dev/null
+++ b/drivers/pinctrl/nxp/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+# NXP pin control
+obj-$(CONFIG_PINCTRL_S32CC)	+= pinctrl-s32cc.o
+obj-$(CONFIG_PINCTRL_S32G2)	+= pinctrl-s32g2.o
diff --git a/drivers/pinctrl/nxp/pinctrl-s32.h b/drivers/pinctrl/nxp/pinctrl-s32.h
new file mode 100644
index 000000000000..b6d530a62051
--- /dev/null
+++ b/drivers/pinctrl/nxp/pinctrl-s32.h
@@ -0,0 +1,75 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * S32 pinmux core definitions
+ *
+ * Copyright 2016-2020, 2022 NXP
+ * Copyright (C) 2022 SUSE LLC
+ * Copyright 2015-2016 Freescale Semiconductor, Inc.
+ * Copyright (C) 2012 Linaro Ltd.
+ */
+
+#ifndef __DRIVERS_PINCTRL_S32_H
+#define __DRIVERS_PINCTRL_S32_H
+
+struct platform_device;
+
+/**
+ * struct s32_pin_group - describes an S32 pin group
+ * @name: the name of this specific pin group
+ * @npins: the number of pins in this group array, i.e. the number of
+ *         elements in pin_ids and pin_sss so we can iterate over that array
+ * @pin_ids: an array of pin IDs in this group
+ * @pin_sss: an array of source signal select configs paired with pin_ids
+ */
+struct s32_pin_group {
+	const char *name;
+	unsigned int npins;
+	unsigned int *pin_ids;
+	unsigned int *pin_sss;
+};
+
+/**
+ * struct s32_pmx_func - describes S32 pinmux functions
+ * @name: the name of this specific function
+ * @groups: corresponding pin groups
+ * @num_groups: the number of groups
+ */
+struct s32_pmx_func {
+	const char *name;
+	const char **groups;
+	unsigned int num_groups;
+};
+
+/**
+ * struct s32_pin_range - pin ID range for each memory region.
+ * @start: start pin ID
+ * @end: end pin ID
+ */
+struct s32_pin_range {
+	unsigned int start;
+	unsigned int end;
+};
+
+struct s32_pinctrl_soc_info {
+	struct device *dev;
+	const struct pinctrl_pin_desc *pins;
+	unsigned int npins;
+	struct s32_pin_group *groups;
+	unsigned int ngroups;
+	struct s32_pmx_func *functions;
+	unsigned int nfunctions;
+	unsigned int grp_index;
+	const struct s32_pin_range *mem_pin_ranges;
+	unsigned int mem_regions;
+};
+
+#define S32_PINCTRL_PIN(pin)	PINCTRL_PIN(pin, #pin)
+#define S32_PIN_RANGE(_start, _end) { .start = _start, .end = _end }
+
+int s32_pinctrl_probe(struct platform_device *pdev,
+			struct s32_pinctrl_soc_info *info);
+#ifdef CONFIG_PM_SLEEP
+int __maybe_unused s32_pinctrl_resume(struct device *dev);
+int __maybe_unused s32_pinctrl_suspend(struct device *dev);
+#endif
+#endif /* __DRIVERS_PINCTRL_S32_H */
diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
new file mode 100644
index 000000000000..2c945523af80
--- /dev/null
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -0,0 +1,945 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Core driver for the S32 CC (Common Chassis) pin controller
+ *
+ * Copyright 2017-2022 NXP
+ * Copyright (C) 2022 SUSE LLC
+ * Copyright 2015-2016 Freescale Semiconductor, Inc.
+ */
+
+#include <linux/bitops.h>
+#include <linux/err.h>
+#include <linux/gpio/driver.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/pinctrl/machine.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/regmap.h>
+#include <linux/seq_file.h>
+#include <linux/slab.h>
+
+#include "../core.h"
+#include "../pinconf.h"
+#include "../pinctrl-utils.h"
+#include "pinctrl-s32.h"
+
+#define S32_PIN_ID_MASK		GENMASK(31, 4)
+
+#define S32_MSCR_SSS_MASK	GENMASK(2, 0)
+#define S32_MSCR_PUS		BIT(12)
+#define S32_MSCR_PUE		BIT(13)
+#define S32_MSCR_SRE(X)		(((X) & GENMASK(3, 0)) << 14)
+#define S32_MSCR_IBE		BIT(19)
+#define S32_MSCR_ODE		BIT(20)
+#define S32_MSCR_OBE		BIT(21)
+
+static struct regmap_config s32_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+static u32 get_pin_no(u32 pinmux)
+{
+	return (pinmux & S32_PIN_ID_MASK) >> __ffs(S32_PIN_ID_MASK);
+}
+
+static u32 get_pin_func(u32 pinmux)
+{
+	return pinmux & GENMASK(3, 0);
+}
+
+struct s32_pinctrl_mem_region {
+	struct regmap *map;
+	const struct s32_pin_range *pin_range;
+	char name[8];
+};
+
+/*
+ * Holds pin configuration for GPIO's.
+ * @pin_id: Pin ID for this GPIO
+ * @config: Pin settings
+ * @list: Linked list entry for each gpio pin
+ */
+struct gpio_pin_config {
+	unsigned int pin_id;
+	unsigned int config;
+	struct list_head list;
+};
+
+/*
+ * Pad config save/restore for power suspend/resume.
+ */
+struct s32_pinctrl_context {
+	unsigned int *pads;
+};
+
+/*
+ * @dev: a pointer back to containing device
+ * @pctl: a pointer to the pinctrl device structure
+ * @regions: reserved memory regions with start/end pin
+ * @info: structure containing information about the pin
+ * @gpio_configs: Saved configurations for GPIO pins
+ * @gpiop_configs_lock: lock for the `gpio_configs` list
+ * @s32_pinctrl_context: Configuration saved over system sleep
+ */
+struct s32_pinctrl {
+	struct device *dev;
+	struct pinctrl_dev *pctl;
+	struct s32_pinctrl_mem_region *regions;
+	struct s32_pinctrl_soc_info *info;
+	struct list_head gpio_configs;
+	spinlock_t gpio_configs_lock;
+#ifdef CONFIG_PM_SLEEP
+	struct s32_pinctrl_context saved_context;
+#endif
+};
+
+static struct s32_pinctrl_mem_region *
+s32_get_region(struct pinctrl_dev *pctldev, unsigned int pin)
+{
+	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct s32_pin_range *pin_range;
+	unsigned int mem_regions = ipctl->info->mem_regions;
+	unsigned int i;
+
+	for (i = 0; i < mem_regions; ++i) {
+		pin_range = ipctl->regions[i].pin_range;
+		if (pin >= pin_range->start && pin <= pin_range->end)
+			return &ipctl->regions[i];
+	}
+
+	return NULL;
+}
+
+static inline int s32_check_pin(struct pinctrl_dev *pctldev,
+				unsigned int pin)
+{
+	return s32_get_region(pctldev, pin) ? 0 : -EINVAL;
+}
+
+static inline int s32_regmap_read(struct pinctrl_dev *pctldev,
+			   unsigned int pin, unsigned int *val)
+{
+	struct s32_pinctrl_mem_region *region;
+	unsigned int offset;
+
+	region = s32_get_region(pctldev, pin);
+	if (!region)
+		return -EINVAL;
+
+	offset = (pin - region->pin_range->start) *
+			regmap_get_reg_stride(region->map);
+
+	return regmap_read(region->map, offset, val);
+}
+
+static inline int s32_regmap_write(struct pinctrl_dev *pctldev,
+			    unsigned int pin,
+			    unsigned int val)
+{
+	struct s32_pinctrl_mem_region *region;
+	unsigned int offset;
+
+	region = s32_get_region(pctldev, pin);
+	if (!region)
+		return -EINVAL;
+
+	offset = (pin - region->pin_range->start) *
+			regmap_get_reg_stride(region->map);
+
+	return regmap_write(region->map, offset, val);
+
+}
+
+static inline int s32_regmap_update(struct pinctrl_dev *pctldev, unsigned int pin,
+			     unsigned int mask, unsigned int val)
+{
+	struct s32_pinctrl_mem_region *region;
+	unsigned int offset;
+
+	region = s32_get_region(pctldev, pin);
+	if (!region)
+		return -EINVAL;
+
+	offset = (pin - region->pin_range->start) *
+			regmap_get_reg_stride(region->map);
+
+	return regmap_update_bits(region->map, offset, mask, val);
+}
+
+static int s32_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct s32_pinctrl_soc_info *info = ipctl->info;
+
+	return info->ngroups;
+}
+
+static const char *s32_get_group_name(struct pinctrl_dev *pctldev,
+				      unsigned int selector)
+{
+	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct s32_pinctrl_soc_info *info = ipctl->info;
+
+	return info->groups[selector].name;
+}
+
+static int s32_get_group_pins(struct pinctrl_dev *pctldev,
+			      unsigned int selector, const unsigned int **pins,
+			      unsigned int *npins)
+{
+	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct s32_pinctrl_soc_info *info = ipctl->info;
+
+	*pins = info->groups[selector].pin_ids;
+	*npins = info->groups[selector].npins;
+
+	return 0;
+}
+
+static void s32_pin_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
+			     unsigned int offset)
+{
+	seq_printf(s, "%s", dev_name(pctldev->dev));
+}
+
+static int s32_dt_group_node_to_map(struct pinctrl_dev *pctldev,
+				    struct device_node *np,
+				    struct pinctrl_map **map,
+				    unsigned int *reserved_maps,
+				    unsigned int *num_maps,
+				    const char *func_name)
+{
+	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
+	struct device *dev = ipctl->dev;
+	unsigned long *cfgs = NULL;
+	unsigned int n_cfgs, reserve = 1;
+	int n_pins, ret;
+
+	n_pins = of_property_count_elems_of_size(np, "pinmux", sizeof(u32));
+	if (n_pins < 0) {
+		dev_warn(dev, "Unable to find 'pinmux' property in node %s.\n",
+			np->name);
+	} else if (!n_pins) {
+		return -EINVAL;
+	}
+
+	ret = pinconf_generic_parse_dt_config(np, pctldev, &cfgs, &n_cfgs);
+	if (ret) {
+		dev_err(dev, "%pOF: could not parse node property\n", np);
+		return ret;
+	}
+
+	if (n_cfgs)
+		reserve++;
+
+	ret = pinctrl_utils_reserve_map(pctldev, map, reserved_maps, num_maps,
+					reserve);
+	if (ret < 0)
+		goto free_cfgs;
+
+	ret = pinctrl_utils_add_map_mux(pctldev, map, reserved_maps, num_maps,
+					np->name, func_name);
+	if (ret < 0)
+		goto free_cfgs;
+
+	if (n_cfgs) {
+		ret = pinctrl_utils_add_map_configs(pctldev, map, reserved_maps,
+						    num_maps, np->name, cfgs, n_cfgs,
+						    PIN_MAP_TYPE_CONFIGS_GROUP);
+		if (ret < 0)
+			goto free_cfgs;
+	}
+
+free_cfgs:
+	kfree(cfgs);
+	return ret;
+}
+
+static int s32_dt_node_to_map(struct pinctrl_dev *pctldev,
+			      struct device_node *np_config,
+			      struct pinctrl_map **map,
+			      unsigned int *num_maps)
+{
+	unsigned int reserved_maps;
+	struct device_node *np;
+	int ret = 0;
+
+	reserved_maps = 0;
+	*map = NULL;
+	*num_maps = 0;
+
+	for_each_available_child_of_node(np_config, np) {
+		ret = s32_dt_group_node_to_map(pctldev, np, map,
+					       &reserved_maps, num_maps,
+					       np_config->name);
+		if (ret < 0)
+			break;
+	}
+
+	if (ret)
+		pinctrl_utils_free_map(pctldev, *map, *num_maps);
+
+	return ret;
+
+}
+
+static const struct pinctrl_ops s32_pctrl_ops = {
+	.get_groups_count = s32_get_groups_count,
+	.get_group_name = s32_get_group_name,
+	.get_group_pins = s32_get_group_pins,
+	.pin_dbg_show = s32_pin_dbg_show,
+	.dt_node_to_map = s32_dt_node_to_map,
+	.dt_free_map = pinctrl_utils_free_map,
+};
+
+static int s32_pmx_set(struct pinctrl_dev *pctldev, unsigned int selector,
+		       unsigned int group)
+{
+	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct s32_pinctrl_soc_info *info = ipctl->info;
+	int i, ret;
+	struct s32_pin_group *grp;
+
+	/*
+	 * Configure the mux mode for each pin in the group for a specific
+	 * function.
+	 */
+	grp = &info->groups[group];
+
+	dev_dbg(ipctl->dev, "set mux for function %s group %s\n",
+		info->functions[selector].name, grp->name);
+
+	/* Check beforehand so we don't have a partial config. */
+	for (i = 0; i < grp->npins; ++i) {
+		if (s32_check_pin(pctldev, grp->pin_ids[i]) != 0) {
+			dev_err(info->dev, "invalid pin: %d in group: %d\n",
+				grp->pin_ids[i], group);
+			return -EINVAL;
+		}
+	}
+
+	for (i = 0, ret = 0; i < grp->npins && !ret; ++i) {
+		ret = s32_regmap_update(pctldev, grp->pin_ids[i],
+					S32_MSCR_SSS_MASK, grp->pin_sss[i]);
+	}
+
+	return ret;
+}
+
+static int s32_pmx_get_funcs_count(struct pinctrl_dev *pctldev)
+{
+	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct s32_pinctrl_soc_info *info = ipctl->info;
+
+	return info->nfunctions;
+}
+
+static const char *s32_pmx_get_func_name(struct pinctrl_dev *pctldev,
+					 unsigned int selector)
+{
+	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct s32_pinctrl_soc_info *info = ipctl->info;
+
+	return info->functions[selector].name;
+}
+
+static int s32_pmx_get_groups(struct pinctrl_dev *pctldev,
+			      unsigned int selector,
+			      const char * const **groups,
+			      unsigned int * const num_groups)
+{
+	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct s32_pinctrl_soc_info *info = ipctl->info;
+
+	*groups = info->functions[selector].groups;
+	*num_groups = info->functions[selector].num_groups;
+
+	return 0;
+}
+
+static int s32_pmx_gpio_request_enable(struct pinctrl_dev *pctldev,
+				       struct pinctrl_gpio_range *range,
+				       unsigned int offset)
+{
+	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
+	struct gpio_pin_config *gpio_pin;
+	unsigned int config;
+	unsigned long flags;
+	int ret;
+
+	ret = s32_regmap_read(pctldev, offset, &config);
+	if (ret != 0)
+		return -EINVAL;
+
+	/* Save current configuration */
+	gpio_pin = kmalloc(sizeof(*gpio_pin), GFP_KERNEL);
+	if (!gpio_pin)
+		return -ENOMEM;
+
+	gpio_pin->pin_id = offset;
+	gpio_pin->config = config;
+
+	spin_lock_irqsave(&ipctl->gpio_configs_lock, flags);
+	list_add(&(gpio_pin->list), &(ipctl->gpio_configs));
+	spin_unlock_irqrestore(&ipctl->gpio_configs_lock, flags);
+
+	/* GPIO pin means SSS = 0 */
+	config &= ~S32_MSCR_SSS_MASK;
+
+	return s32_regmap_write(pctldev, offset, config);
+}
+
+static void s32_pmx_gpio_disable_free(struct pinctrl_dev *pctldev,
+				      struct pinctrl_gpio_range *range,
+				      unsigned int offset)
+{
+	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
+	struct list_head *pos, *tmp;
+	struct gpio_pin_config *gpio_pin;
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&ipctl->gpio_configs_lock, flags);
+
+	list_for_each_safe(pos, tmp, &ipctl->gpio_configs) {
+		gpio_pin = list_entry(pos, struct gpio_pin_config, list);
+
+		if (gpio_pin->pin_id == offset) {
+			ret = s32_regmap_write(pctldev, gpio_pin->pin_id,
+						 gpio_pin->config);
+			if (ret != 0)
+				goto unlock;
+
+			list_del(pos);
+			kfree(gpio_pin);
+			break;
+		}
+	}
+
+unlock:
+	spin_unlock_irqrestore(&ipctl->gpio_configs_lock, flags);
+}
+
+static int s32_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
+				      struct pinctrl_gpio_range *range,
+				      unsigned int offset,
+				      bool input)
+{
+	unsigned int config;
+	unsigned int mask = S32_MSCR_IBE | S32_MSCR_OBE;
+
+	if (input) {
+		/* Disable output buffer and enable input buffer */
+		config = S32_MSCR_IBE;
+	} else {
+		/* Disable input buffer and enable output buffer */
+		config = S32_MSCR_OBE;
+	}
+
+	return s32_regmap_update(pctldev, offset, mask, config);
+}
+
+static const struct pinmux_ops s32_pmx_ops = {
+	.get_functions_count = s32_pmx_get_funcs_count,
+	.get_function_name = s32_pmx_get_func_name,
+	.get_function_groups = s32_pmx_get_groups,
+	.set_mux = s32_pmx_set,
+	.gpio_request_enable = s32_pmx_gpio_request_enable,
+	.gpio_disable_free = s32_pmx_gpio_disable_free,
+	.gpio_set_direction = s32_pmx_gpio_set_direction,
+};
+
+/* Set the reserved elements as -1 */
+static const int support_slew[] = {208, -1, -1, -1, 166, 150, 133, 83};
+
+static int s32_get_slew_regval(int arg)
+{
+	int i;
+	/* Translate a real slew rate (MHz) to a register value */
+	for (i = 0; i < ARRAY_SIZE(support_slew); i++) {
+		if (arg == support_slew[i])
+			return i;
+	}
+
+	return -EINVAL;
+}
+
+static int s32_get_pin_conf(enum pin_config_param param, u32 arg,
+			    unsigned int *mask, unsigned int *config)
+{
+	int ret;
+
+	switch (param) {
+	/* All pins are persistent over suspend */
+	case PIN_CONFIG_PERSIST_STATE:
+		return 0;
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+		*config |= S32_MSCR_ODE;
+		*mask |= S32_MSCR_ODE;
+		break;
+	case PIN_CONFIG_OUTPUT_ENABLE:
+		if (arg)
+			*config |= S32_MSCR_OBE;
+		else
+			*config &= ~S32_MSCR_OBE;
+		*mask |= S32_MSCR_OBE;
+		break;
+	case PIN_CONFIG_INPUT_ENABLE:
+		if (arg)
+			*config |= S32_MSCR_IBE;
+		else
+			*config &= ~S32_MSCR_IBE;
+		*mask |= S32_MSCR_IBE;
+		break;
+	case PIN_CONFIG_SLEW_RATE:
+		ret = s32_get_slew_regval(arg);
+		if (ret < 0)
+			return ret;
+		*config |= S32_MSCR_SRE((u32)ret);
+		*mask |= S32_MSCR_SRE(~0);
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		if (arg)
+			*config |= S32_MSCR_PUS;
+		else
+			*config &= ~S32_MSCR_PUS;
+		fallthrough;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		if (arg)
+			*config |= S32_MSCR_PUE;
+		else
+			*config &= ~S32_MSCR_PUE;
+		*mask |= S32_MSCR_PUE | S32_MSCR_PUS;
+		break;
+	case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
+		*config &= ~(S32_MSCR_ODE | S32_MSCR_OBE | S32_MSCR_IBE);
+		*mask |= S32_MSCR_ODE | S32_MSCR_OBE | S32_MSCR_IBE;
+		fallthrough;
+	case PIN_CONFIG_BIAS_DISABLE:
+		*config &= ~(S32_MSCR_PUS | S32_MSCR_PUE);
+		*mask |= S32_MSCR_PUS | S32_MSCR_PUE;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int s32_pinconf_mscr_update(struct pinctrl_dev *pctldev,
+				   unsigned int pin_id,
+				   unsigned long *configs,
+				   unsigned int num_configs)
+{
+	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
+	unsigned int config = 0, mask = 0;
+	int i, ret;
+
+	if (s32_check_pin(pctldev, pin_id) != 0)
+		return -EINVAL;
+
+	dev_dbg(ipctl->dev, "pinconf set pin %s with %d configs\n",
+		pin_get_name(pctldev, pin_id), num_configs);
+
+	for (i = 0; i < num_configs; i++) {
+		ret = s32_get_pin_conf(pinconf_to_config_param(configs[i]),
+				       pinconf_to_config_argument(configs[i]),
+				       &mask, &config);
+		if (ret)
+			return ret;
+	}
+
+	if (!config && !mask)
+		return 0;
+
+	ret = s32_regmap_update(pctldev, pin_id, mask, config);
+
+	dev_dbg(ipctl->dev, "update: pin %d cfg 0x%x\n", pin_id, config);
+
+	return ret;
+}
+
+static int s32_pinconf_get(struct pinctrl_dev *pctldev,
+			   unsigned int pin_id,
+			   unsigned long *config)
+{
+	return s32_regmap_read(pctldev, pin_id, (unsigned int *)config);
+}
+
+static int s32_pinconf_set(struct pinctrl_dev *pctldev,
+			   unsigned int pin_id, unsigned long *configs,
+			   unsigned int num_configs)
+{
+	return s32_pinconf_mscr_update(pctldev, pin_id, configs,
+				       num_configs);
+}
+
+static int s32_pconf_group_set(struct pinctrl_dev *pctldev, unsigned int selector,
+			       unsigned long *configs, unsigned int num_configs)
+{
+	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct s32_pinctrl_soc_info *info = ipctl->info;
+	struct s32_pin_group *grp;
+	int i, ret;
+
+	grp = &info->groups[selector];
+	for (i = 0; i < grp->npins; i++) {
+		ret = s32_pinconf_mscr_update(pctldev, grp->pin_ids[i],
+					      configs, num_configs);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static void s32_pinconf_dbg_show(struct pinctrl_dev *pctldev,
+				 struct seq_file *s, unsigned int pin_id)
+{
+	unsigned int config;
+	int ret = s32_regmap_read(pctldev, pin_id, &config);
+
+	if (!ret)
+		seq_printf(s, "0x%x", config);
+}
+
+static void s32_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
+				       struct seq_file *s, unsigned int selector)
+{
+	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct s32_pinctrl_soc_info *info = ipctl->info;
+	struct s32_pin_group *grp;
+	unsigned int config;
+	const char *name;
+	int i, ret;
+
+	seq_puts(s, "\n");
+	grp = &info->groups[selector];
+	for (i = 0; i < grp->npins; i++) {
+		name = pin_get_name(pctldev, grp->pin_ids[i]);
+		ret = s32_regmap_read(pctldev, grp->pin_ids[i], &config);
+		if (ret)
+			return;
+		seq_printf(s, "%s: 0x%x\n", name, config);
+	}
+}
+
+static const struct pinconf_ops s32_pinconf_ops = {
+	.pin_config_get = s32_pinconf_get,
+	.pin_config_set	= s32_pinconf_set,
+	.pin_config_group_set = s32_pconf_group_set,
+	.pin_config_dbg_show = s32_pinconf_dbg_show,
+	.pin_config_group_dbg_show = s32_pinconf_group_dbg_show,
+};
+
+#ifdef CONFIG_PM_SLEEP
+static bool s32_pinctrl_should_save(struct s32_pinctrl *ipctl,
+				    unsigned int pin)
+{
+	const struct pin_desc *pd = pin_desc_get(ipctl->pctl, pin);
+
+	if (!pd)
+		return false;
+
+	/*
+	 * Only restore the pin if it is actually in use by the kernel (or
+	 * by userspace).
+	 */
+	if (pd->mux_owner || pd->gpio_owner)
+		return true;
+
+	return false;
+}
+
+int __maybe_unused s32_pinctrl_suspend(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct s32_pinctrl *ipctl = platform_get_drvdata(pdev);
+	const struct pinctrl_pin_desc *pin;
+	const struct s32_pinctrl_soc_info *info = ipctl->info;
+	struct s32_pinctrl_context *saved_context = &ipctl->saved_context;
+	int i;
+	int ret;
+	unsigned int config;
+
+	for (i = 0; i < info->npins; i++) {
+		pin = &info->pins[i];
+
+		if (!s32_pinctrl_should_save(ipctl, pin->number))
+			continue;
+
+		ret = s32_regmap_read(ipctl->pctl, pin->number, &config);
+		if (ret)
+			return -EINVAL;
+
+		saved_context->pads[i] = config;
+	}
+
+	return 0;
+}
+
+int __maybe_unused s32_pinctrl_resume(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct s32_pinctrl *ipctl = platform_get_drvdata(pdev);
+	const struct s32_pinctrl_soc_info *info = ipctl->info;
+	const struct pinctrl_pin_desc *pin;
+	struct s32_pinctrl_context *saved_context = &ipctl->saved_context;
+	int ret, i;
+
+	for (i = 0; i < info->npins; i++) {
+		pin = &info->pins[i];
+
+		if (!s32_pinctrl_should_save(ipctl, pin->number))
+			continue;
+
+		ret = s32_regmap_write(ipctl->pctl, pin->number,
+					 saved_context->pads[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+#endif
+
+static void s32_pinctrl_parse_groups(struct device_node *np,
+				     struct s32_pin_group *grp,
+				     struct s32_pinctrl_soc_info *info)
+{
+	const __be32 *p;
+	struct device *dev;
+	struct property *prop;
+	int i, npins;
+	u32 pinmux;
+
+	dev = info->dev;
+
+	dev_dbg(dev, "group: %s\n", np->name);
+
+	/* Initialise group */
+	grp->name = np->name;
+
+	npins = of_property_count_elems_of_size(np, "pinmux", sizeof(u32));
+
+	if (npins < 0) {
+		dev_err(dev, "Failed to read 'pinmux' property in node %s.\n",
+			np->name);
+		return;
+	}
+	if (!npins) {
+		dev_err(dev, "The group %s has no pins.\n", np->name);
+		return;
+	}
+
+	grp->npins = npins;
+
+	grp->pin_ids = devm_kcalloc(info->dev, grp->npins,
+				    sizeof(unsigned int), GFP_KERNEL);
+	grp->pin_sss = devm_kcalloc(info->dev, grp->npins,
+				    sizeof(unsigned int), GFP_KERNEL);
+
+	if (!grp->pin_ids || !grp->pin_sss) {
+		dev_err(dev, "Failed to allocate memory for the group %s.\n",
+			np->name);
+		return;
+	}
+
+	i = 0;
+	of_property_for_each_u32(np, "pinmux", prop, p, pinmux) {
+		grp->pin_ids[i] = get_pin_no(pinmux);
+		grp->pin_sss[i] = get_pin_func(pinmux);
+
+		dev_dbg(info->dev, "pin-id: 0x%x, sss: 0x%x",
+			grp->pin_ids[i], grp->pin_sss[i]);
+		i++;
+	}
+}
+
+static void s32_pinctrl_parse_functions(struct device_node *np,
+					struct s32_pinctrl_soc_info *info,
+					u32 index)
+{
+	struct device_node *child;
+	struct s32_pmx_func *func;
+	struct s32_pin_group *grp;
+	u32 i = 0;
+
+	dev_dbg(info->dev, "parse function(%d): %s\n", index, np->name);
+
+	func = &info->functions[index];
+
+	/* Initialise function */
+	func->name = np->name;
+	func->num_groups = of_get_child_count(np);
+	if (func->num_groups == 0) {
+		dev_err(info->dev, "no groups defined in %s\n", np->full_name);
+		return;
+	}
+	func->groups = devm_kzalloc(info->dev,
+			func->num_groups * sizeof(char *), GFP_KERNEL);
+
+	for_each_child_of_node(np, child) {
+		func->groups[i] = child->name;
+		grp = &info->groups[info->grp_index++];
+		s32_pinctrl_parse_groups(child, grp, info);
+		i++;
+	}
+}
+
+static int s32_pinctrl_probe_dt(struct platform_device *pdev,
+				struct s32_pinctrl *ipctl)
+{
+	struct s32_pinctrl_soc_info *info = ipctl->info;
+	struct device_node *np = pdev->dev.of_node;
+	struct device_node *child;
+	struct resource *res;
+	struct regmap *map;
+	void __iomem *base;
+	int mem_regions = info->mem_regions;
+	u32 nfuncs = 0;
+	u32 i = 0;
+
+	if (!np)
+		return -ENODEV;
+
+	if (mem_regions == 0) {
+		dev_err(&pdev->dev, "mem_regions is 0\n");
+		return -EINVAL;
+	}
+
+	ipctl->regions = devm_kzalloc(&pdev->dev,
+				      mem_regions * sizeof(*(ipctl->regions)),
+				      GFP_KERNEL);
+	if (!ipctl->regions)
+		return -ENOMEM;
+
+	for (i = 0; i < mem_regions; ++i) {
+		base = devm_platform_get_and_ioremap_resource(pdev, i, &res);
+		if (IS_ERR(base))
+			return PTR_ERR(base);
+
+		snprintf(ipctl->regions[i].name,
+			 sizeof(ipctl->regions[i].name), "map%u", i);
+
+		s32_regmap_config.name = ipctl->regions[i].name;
+		s32_regmap_config.max_register = resource_size(res) -
+						 s32_regmap_config.reg_stride;
+
+		map = devm_regmap_init_mmio(&pdev->dev, base,
+						&s32_regmap_config);
+		if (IS_ERR(map)) {
+			dev_err(&pdev->dev, "Failed to init regmap[%u]\n", i);
+			return PTR_ERR(map);
+		}
+
+		ipctl->regions[i].map = map;
+		ipctl->regions[i].pin_range = &info->mem_pin_ranges[i];
+	}
+
+	nfuncs = of_get_child_count(np);
+	if (nfuncs <= 0) {
+		dev_err(&pdev->dev, "no functions defined\n");
+		return -EINVAL;
+	}
+
+	info->nfunctions = nfuncs;
+	info->functions = devm_kzalloc(&pdev->dev,
+				       nfuncs * sizeof(struct s32_pmx_func),
+				       GFP_KERNEL);
+	if (!info->functions)
+		return -ENOMEM;
+
+	info->ngroups = 0;
+	for_each_child_of_node(np, child)
+		info->ngroups += of_get_child_count(child);
+	info->groups = devm_kzalloc(&pdev->dev,
+				    info->ngroups * sizeof(struct s32_pin_group),
+				    GFP_KERNEL);
+	if (!info->groups)
+		return -ENOMEM;
+
+	i = 0;
+	for_each_child_of_node(np, child)
+		s32_pinctrl_parse_functions(child, info, i++);
+
+	return 0;
+}
+
+int s32_pinctrl_probe(struct platform_device *pdev,
+		      struct s32_pinctrl_soc_info *info)
+{
+	struct s32_pinctrl *ipctl;
+	int ret;
+	struct pinctrl_desc *s32_pinctrl_desc;
+#ifdef CONFIG_PM_SLEEP
+	struct s32_pinctrl_context *saved_context;
+#endif
+
+	if (!info || !info->pins || !info->npins) {
+		dev_err(&pdev->dev, "wrong pinctrl info\n");
+		return -EINVAL;
+	}
+
+	info->dev = &pdev->dev;
+
+	/* Create state holders etc for this driver */
+	ipctl = devm_kzalloc(&pdev->dev, sizeof(*ipctl), GFP_KERNEL);
+	if (!ipctl)
+		return -ENOMEM;
+
+	ipctl->info = info;
+	ipctl->dev = info->dev;
+	platform_set_drvdata(pdev, ipctl);
+
+	INIT_LIST_HEAD(&ipctl->gpio_configs);
+	spin_lock_init(&ipctl->gpio_configs_lock);
+
+	s32_pinctrl_desc =
+		devm_kmalloc(&pdev->dev, sizeof(*s32_pinctrl_desc), GFP_KERNEL);
+	if (!s32_pinctrl_desc)
+		return -ENOMEM;
+
+	s32_pinctrl_desc->name = dev_name(&pdev->dev);
+	s32_pinctrl_desc->pins = info->pins;
+	s32_pinctrl_desc->npins = info->npins;
+	s32_pinctrl_desc->pctlops = &s32_pctrl_ops;
+	s32_pinctrl_desc->pmxops = &s32_pmx_ops;
+	s32_pinctrl_desc->confops = &s32_pinconf_ops;
+	s32_pinctrl_desc->owner = THIS_MODULE;
+
+	ret = s32_pinctrl_probe_dt(pdev, ipctl);
+	if (ret) {
+		dev_err(&pdev->dev, "fail to probe dt properties\n");
+		return ret;
+	}
+
+	ipctl->pctl = devm_pinctrl_register(&pdev->dev, s32_pinctrl_desc,
+					    ipctl);
+
+	if (IS_ERR(ipctl->pctl)) {
+		dev_err(&pdev->dev, "could not register s32 pinctrl driver\n");
+		return PTR_ERR(ipctl->pctl);
+	}
+
+#ifdef CONFIG_PM_SLEEP
+	saved_context = &ipctl->saved_context;
+	saved_context->pads =
+		devm_kcalloc(&pdev->dev, info->npins,
+			     sizeof(*saved_context->pads),
+			     GFP_KERNEL);
+	if (!saved_context->pads)
+		return -ENOMEM;
+#endif
+
+	dev_info(&pdev->dev, "initialized s32 pinctrl driver\n");
+
+	return 0;
+}
diff --git a/drivers/pinctrl/nxp/pinctrl-s32g2.c b/drivers/pinctrl/nxp/pinctrl-s32g2.c
new file mode 100644
index 000000000000..7dd0b4f8904d
--- /dev/null
+++ b/drivers/pinctrl/nxp/pinctrl-s32g2.c
@@ -0,0 +1,773 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * NXP S32G pinctrl driver
+ *
+ * Copyright 2015-2016 Freescale Semiconductor, Inc.
+ * Copyright 2017-2018, 2020-2022 NXP
+ * Copyright (C) 2022 SUSE LLC
+ */
+
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-s32.h"
+
+enum s32_pins {
+	S32G_MSCR_PA_00 =  0,
+	S32G_MSCR_PA_01 =  1,
+	S32G_MSCR_PA_02 =  2,
+	S32G_MSCR_PA_03 =  3,
+	S32G_MSCR_PA_04 =  4,
+	S32G_MSCR_PA_05 =  5,
+	S32G_MSCR_PA_06 =  6,
+	S32G_MSCR_PA_07 =  7,
+	S32G_MSCR_PA_08 =  8,
+	S32G_MSCR_PA_09 =  9,
+	S32G_MSCR_PA_10 =  10,
+	S32G_MSCR_PA_11 =  11,
+	S32G_MSCR_PA_12 =  12,
+	S32G_MSCR_PA_13 =  13,
+	S32G_MSCR_PA_14 =  14,
+	S32G_MSCR_PA_15 =  15,
+	S32G_MSCR_PB_00 =  16,
+	S32G_MSCR_PB_01 =  17,
+	S32G_MSCR_PB_02 =  18,
+	S32G_MSCR_PB_03 =  19,
+	S32G_MSCR_PB_04 =  20,
+	S32G_MSCR_PB_05 =  21,
+	S32G_MSCR_PB_06 =  22,
+	S32G_MSCR_PB_07 =  23,
+	S32G_MSCR_PB_08 =  24,
+	S32G_MSCR_PB_09 =  25,
+	S32G_MSCR_PB_10 =  26,
+	S32G_MSCR_PB_11 =  27,
+	S32G_MSCR_PB_12 =  28,
+	S32G_MSCR_PB_13 =  29,
+	S32G_MSCR_PB_14 =  30,
+	S32G_MSCR_PB_15 =  31,
+	S32G_MSCR_PC_00 =  32,
+	S32G_MSCR_PC_01 =  33,
+	S32G_MSCR_PC_02 =  34,
+	S32G_MSCR_PC_03 =  35,
+	S32G_MSCR_PC_04 =  36,
+	S32G_MSCR_PC_05 =  37,
+	S32G_MSCR_PC_06 =  38,
+	S32G_MSCR_PC_07 =  39,
+	S32G_MSCR_PC_08 =  40,
+	S32G_MSCR_PC_09 =  41,
+	S32G_MSCR_PC_10 =  42,
+	S32G_MSCR_PC_11 =  43,
+	S32G_MSCR_PC_12 =  44,
+	S32G_MSCR_PC_13 =  45,
+	S32G_MSCR_PC_14 =  46,
+	S32G_MSCR_PC_15 =  47,
+	S32G_MSCR_PD_00 =  48,
+	S32G_MSCR_PD_01 =  49,
+	S32G_MSCR_PD_02 =  50,
+	S32G_MSCR_PD_03 =  51,
+	S32G_MSCR_PD_04 =  52,
+	S32G_MSCR_PD_05 =  53,
+	S32G_MSCR_PD_06 =  54,
+	S32G_MSCR_PD_07 =  55,
+	S32G_MSCR_PD_08 =  56,
+	S32G_MSCR_PD_09 =  57,
+	S32G_MSCR_PD_10 =  58,
+	S32G_MSCR_PD_11 =  59,
+	S32G_MSCR_PD_12 =  60,
+	S32G_MSCR_PD_13 =  61,
+	S32G_MSCR_PD_14 =  62,
+	S32G_MSCR_PD_15 =  63,
+	S32G_MSCR_PE_00 =  64,
+	S32G_MSCR_PE_01 =  65,
+	S32G_MSCR_PE_02 =  66,
+	S32G_MSCR_PE_03 =  67,
+	S32G_MSCR_PE_04 =  68,
+	S32G_MSCR_PE_05 =  69,
+	S32G_MSCR_PE_06 =  70,
+	S32G_MSCR_PE_07 =  71,
+	S32G_MSCR_PE_08 =  72,
+	S32G_MSCR_PE_09 =  73,
+	S32G_MSCR_PE_10 =  74,
+	S32G_MSCR_PE_11 =  75,
+	S32G_MSCR_PE_12 =  76,
+	S32G_MSCR_PE_13 =  77,
+	S32G_MSCR_PE_14 =  78,
+	S32G_MSCR_PE_15 =  79,
+	S32G_MSCR_PF_00 =  80,
+	S32G_MSCR_PF_01 =  81,
+	S32G_MSCR_PF_02 =  82,
+	S32G_MSCR_PF_03 =  83,
+	S32G_MSCR_PF_04 =  84,
+	S32G_MSCR_PF_05 =  85,
+	S32G_MSCR_PF_06 =  86,
+	S32G_MSCR_PF_07 =  87,
+	S32G_MSCR_PF_08 =  88,
+	S32G_MSCR_PF_09 =  89,
+	S32G_MSCR_PF_10 =  90,
+	S32G_MSCR_PF_11 =  91,
+	S32G_MSCR_PF_12 =  92,
+	S32G_MSCR_PF_13 =  93,
+	S32G_MSCR_PF_14 =  94,
+	S32G_MSCR_PF_15 =  95,
+	S32G_MSCR_PG_00 =  96,
+	S32G_MSCR_PG_01 =  97,
+	S32G_MSCR_PG_02 =  98,
+	S32G_MSCR_PG_03 =  99,
+	S32G_MSCR_PG_04 =  100,
+	S32G_MSCR_PG_05 =  101,
+	S32G_MSCR_PH_00 =  112,
+	S32G_MSCR_PH_01 =  113,
+	S32G_MSCR_PH_02 =  114,
+	S32G_MSCR_PH_03 =  115,
+	S32G_MSCR_PH_04 =  116,
+	S32G_MSCR_PH_05 =  117,
+	S32G_MSCR_PH_06 =  118,
+	S32G_MSCR_PH_07 =  119,
+	S32G_MSCR_PH_08 =  120,
+	S32G_MSCR_PH_09 =  121,
+	S32G_MSCR_PH_10 =  122,
+	S32G_MSCR_PJ_00 =  144,
+	S32G_MSCR_PJ_01 =  145,
+	S32G_MSCR_PJ_02 =  146,
+	S32G_MSCR_PJ_03 =  147,
+	S32G_MSCR_PJ_04 =  148,
+	S32G_MSCR_PJ_05 =  149,
+	S32G_MSCR_PJ_06 =  150,
+	S32G_MSCR_PJ_07 =  151,
+	S32G_MSCR_PJ_08 =  152,
+	S32G_MSCR_PJ_09 =  153,
+	S32G_MSCR_PJ_10 =  154,
+	S32G_MSCR_PJ_11 =  155,
+	S32G_MSCR_PJ_12 =  156,
+	S32G_MSCR_PJ_13 =  157,
+	S32G_MSCR_PJ_14 =  158,
+	S32G_MSCR_PJ_15 =  159,
+	S32G_MSCR_PK_00 =  160,
+	S32G_MSCR_PK_01 =  161,
+	S32G_MSCR_PK_02 =  162,
+	S32G_MSCR_PK_03 =  163,
+	S32G_MSCR_PK_04 =  164,
+	S32G_MSCR_PK_05 =  165,
+	S32G_MSCR_PK_06 =  166,
+	S32G_MSCR_PK_07 =  167,
+	S32G_MSCR_PK_08 =  168,
+	S32G_MSCR_PK_09 =  169,
+	S32G_MSCR_PK_10 =  170,
+	S32G_MSCR_PK_11 =  171,
+	S32G_MSCR_PK_12 =  172,
+	S32G_MSCR_PK_13 =  173,
+	S32G_MSCR_PK_14 =  174,
+	S32G_MSCR_PK_15 =  175,
+	S32G_MSCR_PL_00 =  176,
+	S32G_MSCR_PL_01 =  177,
+	S32G_MSCR_PL_02 =  178,
+	S32G_MSCR_PL_03 =  179,
+	S32G_MSCR_PL_04 =  180,
+	S32G_MSCR_PL_05 =  181,
+	S32G_MSCR_PL_06 =  182,
+	S32G_MSCR_PL_07 =  183,
+	S32G_MSCR_PL_08 =  184,
+	S32G_MSCR_PL_09 =  185,
+	S32G_MSCR_PL_10 =  186,
+	S32G_MSCR_PL_11 =  187,
+	S32G_MSCR_PL_12 =  188,
+	S32G_MSCR_PL_13 =  189,
+	S32G_MSCR_PL_14 =  190,
+
+	S32G_IMCR_QSPI_A_DATA0 = 540,
+	S32G_IMCR_QSPI_A_DATA1 = 541,
+	S32G_IMCR_QSPI_A_DATA2 = 542,
+	S32G_IMCR_QSPI_A_DATA3 = 543,
+	S32G_IMCR_QSPI_A_DATA4 = 544,
+	S32G_IMCR_QSPI_A_DATA5 = 545,
+	S32G_IMCR_QSPI_A_DATA6 = 546,
+	S32G_IMCR_QSPI_A_DATA7 = 547,
+	S32G_IMCR_QSPI_DQS_A = 548,
+	S32G_IMCR_QSPI_B_DATA0 = 552,
+	S32G_IMCR_QSPI_B_DATA1 = 554,
+	S32G_IMCR_QSPI_B_DATA2 = 551,
+	S32G_IMCR_QSPI_B_DATA3 = 553,
+	S32G_IMCR_QSPI_B_DATA4 = 557,
+	S32G_IMCR_QSPI_B_DATA5 = 550,
+	S32G_IMCR_QSPI_B_DATA6 = 556,
+	S32G_IMCR_QSPI_B_DATA7 = 555,
+	S32G_IMCR_QSPI_DQS_B = 558,
+	S32G_IMCR_BOOT_BOOTMOD0 = 560,
+	S32G_IMCR_BOOT_BOOTMOD1 = 561,
+	S32G_IMCR_I2C0_SCL = 566,
+	S32G_IMCR_I2C0_SDA = 565,
+	S32G_IMCR_LIN0_RX = 512,
+	S32G_IMCR_USDHC_CMD = 515,
+	S32G_IMCR_USDHC_DAT0 = 516,
+	S32G_IMCR_USDHC_DAT1 = 517,
+	S32G_IMCR_USDHC_DAT2 = 520,
+	S32G_IMCR_USDHC_DAT3 = 521,
+	S32G_IMCR_USDHC_DAT4 = 522,
+	S32G_IMCR_USDHC_DAT5 = 523,
+	S32G_IMCR_USDHC_DAT6 = 519,
+	S32G_IMCR_USDHC_DAT7 = 518,
+	S32G_IMCR_USDHC_DQS = 524,
+	S32G_IMCR_CAN0_RXD = 513,
+	S32G_IMCR_CAN1_RXD = 631,
+	S32G_IMCR_CAN2_RXD = 632,
+	S32G_IMCR_CAN3_RXD = 633,
+	/* GMAC0 */
+	S32G_IMCR_Ethernet_MDIO = 527,
+	S32G_IMCR_Ethernet_CRS = 526,
+	S32G_IMCR_Ethernet_COL = 525,
+	S32G_IMCR_Ethernet_RX_D0 = 531,
+	S32G_IMCR_Ethernet_RX_D1 = 532,
+	S32G_IMCR_Ethernet_RX_D2 = 533,
+	S32G_IMCR_Ethernet_RX_D3 = 534,
+	S32G_IMCR_Ethernet_RX_ER = 528,
+	S32G_IMCR_Ethernet_RX_CLK = 529,
+	S32G_IMCR_Ethernet_RX_DV = 530,
+	S32G_IMCR_Ethernet_TX_CLK = 538,
+	S32G_IMCR_Ethernet_REF_CLK = 535,
+	/* PFE EMAC 0 MII */
+	/* PFE EMAC 1 MII */
+	S32G_IMCR_PFE_EMAC_1_MDIO = 857,
+	S32G_IMCR_PFE_EMAC_1_CRS = 856,
+	S32G_IMCR_PFE_EMAC_1_COL = 855,
+	S32G_IMCR_PFE_EMAC_1_RX_D0 = 861,
+	S32G_IMCR_PFE_EMAC_1_RX_D1 = 862,
+	S32G_IMCR_PFE_EMAC_1_RX_D2 = 863,
+	S32G_IMCR_PFE_EMAC_1_RX_D3 = 864,
+	S32G_IMCR_PFE_EMAC_1_RX_ER = 860,
+	S32G_IMCR_PFE_EMAC_1_RX_CLK = 859,
+	S32G_IMCR_PFE_EMAC_1_RX_DV = 865,
+	S32G_IMCR_PFE_EMAC_1_TX_CLK = 866,
+	S32G_IMCR_PFE_EMAC_1_REF_CLK = 858,
+	/* PFE EMAC 2 MII */
+	S32G_IMCR_PFE_EMAC_2_MDIO = 877,
+	S32G_IMCR_PFE_EMAC_2_CRS = 876,
+	S32G_IMCR_PFE_EMAC_2_COL = 875,
+	S32G_IMCR_PFE_EMAC_2_RX_D0 = 881,
+	S32G_IMCR_PFE_EMAC_2_RX_D1 = 882,
+	S32G_IMCR_PFE_EMAC_2_RX_D2 = 883,
+	S32G_IMCR_PFE_EMAC_2_RX_D3 = 884,
+	S32G_IMCR_PFE_EMAC_2_RX_ER = 880,
+	S32G_IMCR_PFE_EMAC_2_RX_CLK = 879,
+	S32G_IMCR_PFE_EMAC_2_RX_DV = 885,
+	S32G_IMCR_PFE_EMAC_2_TX_CLK = 886,
+	S32G_IMCR_PFE_EMAC_2_REF_CLK = 878,
+
+	S32G_IMCR_FlexRay0_A_RX = 785,
+	S32G_IMCR_FlexRay0_B_RX = 786,
+	S32G_IMCR_FlexTimer0_CH0 = 655,
+	S32G_IMCR_FlexTimer1_CH0 = 665,
+	S32G_IMCR_FlexTimer0_CH1 = 656,
+	S32G_IMCR_FlexTimer1_CH1 = 666,
+	S32G_IMCR_FlexTimer0_CH2 = 657,
+	S32G_IMCR_FlexTimer1_CH2 = 667,
+	S32G_IMCR_FlexTimer0_CH3 = 658,
+	S32G_IMCR_FlexTimer1_CH3 = 668,
+	S32G_IMCR_FlexTimer0_CH4 = 659,
+	S32G_IMCR_FlexTimer1_CH4 = 669,
+	S32G_IMCR_FlexTimer0_CH5 = 660,
+	S32G_IMCR_FlexTimer1_CH5 = 670,
+	S32G_IMCR_FlexTimer0_EXTCLK = 661,
+	S32G_IMCR_FlexTimer1_EXTCLK = 671,
+	S32G_IMCR_I2C1_SCL = 717,
+	S32G_IMCR_I2C1_SDA = 718,
+	S32G_IMCR_I2C2_SCL = 719,
+	S32G_IMCR_I2C2_SDA = 720,
+	S32G_IMCR_I2C3_SCL = 721,
+	S32G_IMCR_I2C3_SDA = 722,
+	S32G_IMCR_I2C4_SCL = 723,
+	S32G_IMCR_I2C4_SDA = 724,
+	S32G_IMCR_LIN1_RX = 736,
+	S32G_IMCR_LIN2_RX = 737,
+	S32G_IMCR_DSPI0_PCS0 = 980,
+	S32G_IMCR_DSPI0_SCK = 981,
+	S32G_IMCR_DSPI0_SIN = 982,
+	S32G_IMCR_DSPI1_PCS0 = 985,
+	S32G_IMCR_DSPI1_SCK = 986,
+	S32G_IMCR_DSPI1_SIN = 987,
+	S32G_IMCR_DSPI2_PCS0 = 990,
+	S32G_IMCR_DSPI2_SCK = 991,
+	S32G_IMCR_DSPI2_SIN = 992,
+	S32G_IMCR_DSPI3_PCS0 = 995,
+	S32G_IMCR_DSPI3_SCK = 996,
+	S32G_IMCR_DSPI3_SIN = 997,
+	S32G_IMCR_DSPI4_PCS0 = 1000,
+	S32G_IMCR_DSPI4_SCK = 1001,
+	S32G_IMCR_DSPI4_SIN = 1002,
+	S32G_IMCR_DSPI5_PCS0 = 1005,
+	S32G_IMCR_DSPI5_SCK = 1006,
+	S32G_IMCR_DSPI5_SIN = 1007,
+	S32G_IMCR_LLCE_CAN0_RXD = 745,
+	S32G_IMCR_LLCE_CAN1_RXD = 746,
+	S32G_IMCR_LLCE_CAN2_RXD = 747,
+	S32G_IMCR_LLCE_CAN3_RXD = 748,
+	S32G_IMCR_LLCE_CAN4_RXD = 749,
+	S32G_IMCR_LLCE_CAN5_RXD = 750,
+	S32G_IMCR_LLCE_CAN6_RXD = 751,
+	S32G_IMCR_LLCE_CAN7_RXD = 752,
+	S32G_IMCR_LLCE_CAN8_RXD = 753,
+	S32G_IMCR_LLCE_CAN9_RXD = 754,
+	S32G_IMCR_LLCE_CAN10_RXD = 755,
+	S32G_IMCR_LLCE_CAN11_RXD = 756,
+	S32G_IMCR_LLCE_CAN12_RXD = 757,
+	S32G_IMCR_LLCE_CAN13_RXD = 758,
+	S32G_IMCR_LLCE_CAN14_RXD = 759,
+	S32G_IMCR_LLCE_CAN15_RXD = 760,
+	S32G_IMCR_USB_CLK = 895,
+	S32G_IMCR_USB_DATA0 = 896,
+	S32G_IMCR_USB_DATA1 = 897,
+	S32G_IMCR_USB_DATA2 = 898,
+	S32G_IMCR_USB_DATA3 = 899,
+	S32G_IMCR_USB_DATA4 = 900,
+	S32G_IMCR_USB_DATA5 = 901,
+	S32G_IMCR_USB_DATA6 = 902,
+	S32G_IMCR_USB_DATA7 = 903,
+	S32G_IMCR_USB_DIR = 904,
+	S32G_IMCR_USB_NXT = 905,
+
+	S32G_IMCR_SIUL_EIRQ0 =  910,
+	S32G_IMCR_SIUL_EIRQ1 =  911,
+	S32G_IMCR_SIUL_EIRQ2 =  912,
+	S32G_IMCR_SIUL_EIRQ3 =  913,
+	S32G_IMCR_SIUL_EIRQ4 =  914,
+	S32G_IMCR_SIUL_EIRQ5 =  915,
+	S32G_IMCR_SIUL_EIRQ6 =  916,
+	S32G_IMCR_SIUL_EIRQ7 =  917,
+	S32G_IMCR_SIUL_EIRQ8 =  918,
+	S32G_IMCR_SIUL_EIRQ9 =  919,
+	S32G_IMCR_SIUL_EIRQ10 =  920,
+	S32G_IMCR_SIUL_EIRQ11 =  921,
+	S32G_IMCR_SIUL_EIRQ12 =  922,
+	S32G_IMCR_SIUL_EIRQ13 =  923,
+	S32G_IMCR_SIUL_EIRQ14 =  924,
+	S32G_IMCR_SIUL_EIRQ15 =  925,
+	S32G_IMCR_SIUL_EIRQ16 =  926,
+	S32G_IMCR_SIUL_EIRQ17 =  927,
+	S32G_IMCR_SIUL_EIRQ18 =  928,
+	S32G_IMCR_SIUL_EIRQ19 =  929,
+	S32G_IMCR_SIUL_EIRQ20 =  930,
+	S32G_IMCR_SIUL_EIRQ21 =  931,
+	S32G_IMCR_SIUL_EIRQ22 =  932,
+	S32G_IMCR_SIUL_EIRQ23 =  933,
+	S32G_IMCR_SIUL_EIRQ24 =  934,
+	S32G_IMCR_SIUL_EIRQ25 =  935,
+	S32G_IMCR_SIUL_EIRQ26 =  936,
+	S32G_IMCR_SIUL_EIRQ27 =  937,
+	S32G_IMCR_SIUL_EIRQ28 =  938,
+	S32G_IMCR_SIUL_EIRQ29 =  939,
+	S32G_IMCR_SIUL_EIRQ30 =  940,
+	S32G_IMCR_SIUL_EIRQ31 =  941,
+};
+
+/* Pad names for the pinmux subsystem */
+static const struct pinctrl_pin_desc s32_pinctrl_pads_siul2[] = {
+
+	/* SIUL2_0 pins. */
+
+	S32_PINCTRL_PIN(S32G_MSCR_PA_00),
+	S32_PINCTRL_PIN(S32G_MSCR_PA_01),
+	S32_PINCTRL_PIN(S32G_MSCR_PA_02),
+	S32_PINCTRL_PIN(S32G_MSCR_PA_03),
+	S32_PINCTRL_PIN(S32G_MSCR_PA_04),
+	S32_PINCTRL_PIN(S32G_MSCR_PA_05),
+	S32_PINCTRL_PIN(S32G_MSCR_PA_06),
+	S32_PINCTRL_PIN(S32G_MSCR_PA_07),
+	S32_PINCTRL_PIN(S32G_MSCR_PA_08),
+	S32_PINCTRL_PIN(S32G_MSCR_PA_09),
+	S32_PINCTRL_PIN(S32G_MSCR_PA_10),
+	S32_PINCTRL_PIN(S32G_MSCR_PA_11),
+	S32_PINCTRL_PIN(S32G_MSCR_PA_12),
+	S32_PINCTRL_PIN(S32G_MSCR_PA_13),
+	S32_PINCTRL_PIN(S32G_MSCR_PA_14),
+	S32_PINCTRL_PIN(S32G_MSCR_PA_15),
+	S32_PINCTRL_PIN(S32G_MSCR_PB_00),
+	S32_PINCTRL_PIN(S32G_MSCR_PB_01),
+	S32_PINCTRL_PIN(S32G_MSCR_PB_02),
+	S32_PINCTRL_PIN(S32G_MSCR_PB_03),
+	S32_PINCTRL_PIN(S32G_MSCR_PB_04),
+	S32_PINCTRL_PIN(S32G_MSCR_PB_05),
+	S32_PINCTRL_PIN(S32G_MSCR_PB_06),
+	S32_PINCTRL_PIN(S32G_MSCR_PB_07),
+	S32_PINCTRL_PIN(S32G_MSCR_PB_08),
+	S32_PINCTRL_PIN(S32G_MSCR_PB_09),
+	S32_PINCTRL_PIN(S32G_MSCR_PB_10),
+	S32_PINCTRL_PIN(S32G_MSCR_PB_11),
+	S32_PINCTRL_PIN(S32G_MSCR_PB_12),
+	S32_PINCTRL_PIN(S32G_MSCR_PB_13),
+	S32_PINCTRL_PIN(S32G_MSCR_PB_14),
+	S32_PINCTRL_PIN(S32G_MSCR_PB_15),
+	S32_PINCTRL_PIN(S32G_MSCR_PC_00),
+	S32_PINCTRL_PIN(S32G_MSCR_PC_01),
+	S32_PINCTRL_PIN(S32G_MSCR_PC_02),
+	S32_PINCTRL_PIN(S32G_MSCR_PC_03),
+	S32_PINCTRL_PIN(S32G_MSCR_PC_04),
+	S32_PINCTRL_PIN(S32G_MSCR_PC_05),
+	S32_PINCTRL_PIN(S32G_MSCR_PC_06),
+	S32_PINCTRL_PIN(S32G_MSCR_PC_07),
+	S32_PINCTRL_PIN(S32G_MSCR_PC_08),
+	S32_PINCTRL_PIN(S32G_MSCR_PC_09),
+	S32_PINCTRL_PIN(S32G_MSCR_PC_10),
+	S32_PINCTRL_PIN(S32G_MSCR_PC_11),
+	S32_PINCTRL_PIN(S32G_MSCR_PC_12),
+	S32_PINCTRL_PIN(S32G_MSCR_PC_13),
+	S32_PINCTRL_PIN(S32G_MSCR_PC_14),
+	S32_PINCTRL_PIN(S32G_MSCR_PC_15),
+	S32_PINCTRL_PIN(S32G_MSCR_PD_00),
+	S32_PINCTRL_PIN(S32G_MSCR_PD_01),
+	S32_PINCTRL_PIN(S32G_MSCR_PD_02),
+	S32_PINCTRL_PIN(S32G_MSCR_PD_03),
+	S32_PINCTRL_PIN(S32G_MSCR_PD_04),
+	S32_PINCTRL_PIN(S32G_MSCR_PD_05),
+	S32_PINCTRL_PIN(S32G_MSCR_PD_06),
+	S32_PINCTRL_PIN(S32G_MSCR_PD_07),
+	S32_PINCTRL_PIN(S32G_MSCR_PD_08),
+	S32_PINCTRL_PIN(S32G_MSCR_PD_09),
+	S32_PINCTRL_PIN(S32G_MSCR_PD_10),
+	S32_PINCTRL_PIN(S32G_MSCR_PD_11),
+	S32_PINCTRL_PIN(S32G_MSCR_PD_12),
+	S32_PINCTRL_PIN(S32G_MSCR_PD_13),
+	S32_PINCTRL_PIN(S32G_MSCR_PD_14),
+	S32_PINCTRL_PIN(S32G_MSCR_PD_15),
+	S32_PINCTRL_PIN(S32G_MSCR_PE_00),
+	S32_PINCTRL_PIN(S32G_MSCR_PE_01),
+	S32_PINCTRL_PIN(S32G_MSCR_PE_02),
+	S32_PINCTRL_PIN(S32G_MSCR_PE_03),
+	S32_PINCTRL_PIN(S32G_MSCR_PE_04),
+	S32_PINCTRL_PIN(S32G_MSCR_PE_05),
+	S32_PINCTRL_PIN(S32G_MSCR_PE_06),
+	S32_PINCTRL_PIN(S32G_MSCR_PE_07),
+	S32_PINCTRL_PIN(S32G_MSCR_PE_08),
+	S32_PINCTRL_PIN(S32G_MSCR_PE_09),
+	S32_PINCTRL_PIN(S32G_MSCR_PE_10),
+	S32_PINCTRL_PIN(S32G_MSCR_PE_11),
+	S32_PINCTRL_PIN(S32G_MSCR_PE_12),
+	S32_PINCTRL_PIN(S32G_MSCR_PE_13),
+	S32_PINCTRL_PIN(S32G_MSCR_PE_14),
+	S32_PINCTRL_PIN(S32G_MSCR_PE_15),
+	S32_PINCTRL_PIN(S32G_MSCR_PF_00),
+	S32_PINCTRL_PIN(S32G_MSCR_PF_01),
+	S32_PINCTRL_PIN(S32G_MSCR_PF_02),
+	S32_PINCTRL_PIN(S32G_MSCR_PF_03),
+	S32_PINCTRL_PIN(S32G_MSCR_PF_04),
+	S32_PINCTRL_PIN(S32G_MSCR_PF_05),
+	S32_PINCTRL_PIN(S32G_MSCR_PF_06),
+	S32_PINCTRL_PIN(S32G_MSCR_PF_07),
+	S32_PINCTRL_PIN(S32G_MSCR_PF_08),
+	S32_PINCTRL_PIN(S32G_MSCR_PF_09),
+	S32_PINCTRL_PIN(S32G_MSCR_PF_10),
+	S32_PINCTRL_PIN(S32G_MSCR_PF_11),
+	S32_PINCTRL_PIN(S32G_MSCR_PF_12),
+	S32_PINCTRL_PIN(S32G_MSCR_PF_13),
+	S32_PINCTRL_PIN(S32G_MSCR_PF_14),
+	S32_PINCTRL_PIN(S32G_MSCR_PF_15),
+	S32_PINCTRL_PIN(S32G_MSCR_PG_00),
+	S32_PINCTRL_PIN(S32G_MSCR_PG_01),
+	S32_PINCTRL_PIN(S32G_MSCR_PG_02),
+	S32_PINCTRL_PIN(S32G_MSCR_PG_03),
+	S32_PINCTRL_PIN(S32G_MSCR_PG_04),
+	S32_PINCTRL_PIN(S32G_MSCR_PG_05),
+
+	S32_PINCTRL_PIN(S32G_IMCR_QSPI_A_DATA0),
+	S32_PINCTRL_PIN(S32G_IMCR_QSPI_A_DATA1),
+	S32_PINCTRL_PIN(S32G_IMCR_QSPI_A_DATA2),
+	S32_PINCTRL_PIN(S32G_IMCR_QSPI_A_DATA3),
+	S32_PINCTRL_PIN(S32G_IMCR_QSPI_A_DATA4),
+	S32_PINCTRL_PIN(S32G_IMCR_QSPI_A_DATA5),
+	S32_PINCTRL_PIN(S32G_IMCR_QSPI_A_DATA6),
+	S32_PINCTRL_PIN(S32G_IMCR_QSPI_A_DATA7),
+	S32_PINCTRL_PIN(S32G_IMCR_QSPI_DQS_A),
+	S32_PINCTRL_PIN(S32G_IMCR_QSPI_B_DATA0),
+	S32_PINCTRL_PIN(S32G_IMCR_QSPI_B_DATA1),
+	S32_PINCTRL_PIN(S32G_IMCR_QSPI_B_DATA2),
+	S32_PINCTRL_PIN(S32G_IMCR_QSPI_B_DATA3),
+	S32_PINCTRL_PIN(S32G_IMCR_QSPI_B_DATA4),
+	S32_PINCTRL_PIN(S32G_IMCR_QSPI_B_DATA5),
+	S32_PINCTRL_PIN(S32G_IMCR_QSPI_B_DATA6),
+	S32_PINCTRL_PIN(S32G_IMCR_QSPI_B_DATA7),
+	S32_PINCTRL_PIN(S32G_IMCR_QSPI_DQS_B),
+	S32_PINCTRL_PIN(S32G_IMCR_I2C0_SCL),
+	S32_PINCTRL_PIN(S32G_IMCR_I2C0_SDA),
+	S32_PINCTRL_PIN(S32G_IMCR_LIN0_RX),
+	S32_PINCTRL_PIN(S32G_IMCR_USDHC_CMD),
+	S32_PINCTRL_PIN(S32G_IMCR_USDHC_DAT0),
+	S32_PINCTRL_PIN(S32G_IMCR_USDHC_DAT1),
+	S32_PINCTRL_PIN(S32G_IMCR_USDHC_DAT2),
+	S32_PINCTRL_PIN(S32G_IMCR_USDHC_DAT3),
+	S32_PINCTRL_PIN(S32G_IMCR_USDHC_DAT4),
+	S32_PINCTRL_PIN(S32G_IMCR_USDHC_DAT5),
+	S32_PINCTRL_PIN(S32G_IMCR_USDHC_DAT6),
+	S32_PINCTRL_PIN(S32G_IMCR_USDHC_DAT7),
+	S32_PINCTRL_PIN(S32G_IMCR_USDHC_DQS),
+	S32_PINCTRL_PIN(S32G_IMCR_CAN0_RXD),
+	/* GMAC0 */
+	S32_PINCTRL_PIN(S32G_IMCR_Ethernet_MDIO),
+	S32_PINCTRL_PIN(S32G_IMCR_Ethernet_CRS),
+	S32_PINCTRL_PIN(S32G_IMCR_Ethernet_COL),
+	S32_PINCTRL_PIN(S32G_IMCR_Ethernet_RX_D0),
+	S32_PINCTRL_PIN(S32G_IMCR_Ethernet_RX_D1),
+	S32_PINCTRL_PIN(S32G_IMCR_Ethernet_RX_D2),
+	S32_PINCTRL_PIN(S32G_IMCR_Ethernet_RX_D3),
+	S32_PINCTRL_PIN(S32G_IMCR_Ethernet_RX_ER),
+	S32_PINCTRL_PIN(S32G_IMCR_Ethernet_RX_CLK),
+	S32_PINCTRL_PIN(S32G_IMCR_Ethernet_RX_DV),
+	S32_PINCTRL_PIN(S32G_IMCR_Ethernet_TX_CLK),
+	S32_PINCTRL_PIN(S32G_IMCR_Ethernet_REF_CLK),
+
+	/* SIUL2_1 pins. */
+
+	S32_PINCTRL_PIN(S32G_MSCR_PH_00),
+	S32_PINCTRL_PIN(S32G_MSCR_PH_01),
+	S32_PINCTRL_PIN(S32G_MSCR_PH_02),
+	S32_PINCTRL_PIN(S32G_MSCR_PH_03),
+	S32_PINCTRL_PIN(S32G_MSCR_PH_04),
+	S32_PINCTRL_PIN(S32G_MSCR_PH_05),
+	S32_PINCTRL_PIN(S32G_MSCR_PH_06),
+	S32_PINCTRL_PIN(S32G_MSCR_PH_07),
+	S32_PINCTRL_PIN(S32G_MSCR_PH_08),
+	S32_PINCTRL_PIN(S32G_MSCR_PH_09),
+	S32_PINCTRL_PIN(S32G_MSCR_PH_10),
+	S32_PINCTRL_PIN(S32G_MSCR_PJ_00),
+	S32_PINCTRL_PIN(S32G_MSCR_PJ_01),
+	S32_PINCTRL_PIN(S32G_MSCR_PJ_02),
+	S32_PINCTRL_PIN(S32G_MSCR_PJ_03),
+	S32_PINCTRL_PIN(S32G_MSCR_PJ_04),
+	S32_PINCTRL_PIN(S32G_MSCR_PJ_05),
+	S32_PINCTRL_PIN(S32G_MSCR_PJ_06),
+	S32_PINCTRL_PIN(S32G_MSCR_PJ_07),
+	S32_PINCTRL_PIN(S32G_MSCR_PJ_08),
+	S32_PINCTRL_PIN(S32G_MSCR_PJ_09),
+	S32_PINCTRL_PIN(S32G_MSCR_PJ_10),
+	S32_PINCTRL_PIN(S32G_MSCR_PJ_11),
+	S32_PINCTRL_PIN(S32G_MSCR_PJ_12),
+	S32_PINCTRL_PIN(S32G_MSCR_PJ_13),
+	S32_PINCTRL_PIN(S32G_MSCR_PJ_14),
+	S32_PINCTRL_PIN(S32G_MSCR_PJ_15),
+	S32_PINCTRL_PIN(S32G_MSCR_PK_00),
+	S32_PINCTRL_PIN(S32G_MSCR_PK_01),
+	S32_PINCTRL_PIN(S32G_MSCR_PK_02),
+	S32_PINCTRL_PIN(S32G_MSCR_PK_03),
+	S32_PINCTRL_PIN(S32G_MSCR_PK_04),
+	S32_PINCTRL_PIN(S32G_MSCR_PK_05),
+	S32_PINCTRL_PIN(S32G_MSCR_PK_06),
+	S32_PINCTRL_PIN(S32G_MSCR_PK_07),
+	S32_PINCTRL_PIN(S32G_MSCR_PK_08),
+	S32_PINCTRL_PIN(S32G_MSCR_PK_09),
+	S32_PINCTRL_PIN(S32G_MSCR_PK_10),
+	S32_PINCTRL_PIN(S32G_MSCR_PK_11),
+	S32_PINCTRL_PIN(S32G_MSCR_PK_12),
+	S32_PINCTRL_PIN(S32G_MSCR_PK_13),
+	S32_PINCTRL_PIN(S32G_MSCR_PK_14),
+	S32_PINCTRL_PIN(S32G_MSCR_PK_15),
+	S32_PINCTRL_PIN(S32G_MSCR_PL_00),
+	S32_PINCTRL_PIN(S32G_MSCR_PL_01),
+	S32_PINCTRL_PIN(S32G_MSCR_PL_02),
+	S32_PINCTRL_PIN(S32G_MSCR_PL_03),
+	S32_PINCTRL_PIN(S32G_MSCR_PL_04),
+	S32_PINCTRL_PIN(S32G_MSCR_PL_05),
+	S32_PINCTRL_PIN(S32G_MSCR_PL_06),
+	S32_PINCTRL_PIN(S32G_MSCR_PL_07),
+	S32_PINCTRL_PIN(S32G_MSCR_PL_08),
+	S32_PINCTRL_PIN(S32G_MSCR_PL_09),
+	S32_PINCTRL_PIN(S32G_MSCR_PL_10),
+	S32_PINCTRL_PIN(S32G_MSCR_PL_11),
+	S32_PINCTRL_PIN(S32G_MSCR_PL_12),
+	S32_PINCTRL_PIN(S32G_MSCR_PL_13),
+	S32_PINCTRL_PIN(S32G_MSCR_PL_14),
+
+	S32_PINCTRL_PIN(S32G_IMCR_FlexRay0_A_RX),
+	S32_PINCTRL_PIN(S32G_IMCR_FlexRay0_B_RX),
+	S32_PINCTRL_PIN(S32G_IMCR_FlexTimer0_CH0),
+	S32_PINCTRL_PIN(S32G_IMCR_FlexTimer1_CH0),
+	S32_PINCTRL_PIN(S32G_IMCR_FlexTimer0_CH1),
+	S32_PINCTRL_PIN(S32G_IMCR_FlexTimer1_CH1),
+	S32_PINCTRL_PIN(S32G_IMCR_FlexTimer0_CH2),
+	S32_PINCTRL_PIN(S32G_IMCR_FlexTimer1_CH2),
+	S32_PINCTRL_PIN(S32G_IMCR_FlexTimer0_CH3),
+	S32_PINCTRL_PIN(S32G_IMCR_FlexTimer1_CH3),
+	S32_PINCTRL_PIN(S32G_IMCR_FlexTimer0_CH4),
+	S32_PINCTRL_PIN(S32G_IMCR_FlexTimer1_CH4),
+	S32_PINCTRL_PIN(S32G_IMCR_FlexTimer0_CH5),
+	S32_PINCTRL_PIN(S32G_IMCR_FlexTimer1_CH5),
+	S32_PINCTRL_PIN(S32G_IMCR_FlexTimer0_EXTCLK),
+	S32_PINCTRL_PIN(S32G_IMCR_FlexTimer1_EXTCLK),
+	S32_PINCTRL_PIN(S32G_IMCR_I2C1_SCL),
+	S32_PINCTRL_PIN(S32G_IMCR_I2C1_SDA),
+	S32_PINCTRL_PIN(S32G_IMCR_I2C2_SCL),
+	S32_PINCTRL_PIN(S32G_IMCR_I2C2_SDA),
+	S32_PINCTRL_PIN(S32G_IMCR_I2C3_SCL),
+	S32_PINCTRL_PIN(S32G_IMCR_I2C3_SDA),
+	S32_PINCTRL_PIN(S32G_IMCR_I2C4_SCL),
+	S32_PINCTRL_PIN(S32G_IMCR_I2C4_SDA),
+	S32_PINCTRL_PIN(S32G_IMCR_LIN1_RX),
+	S32_PINCTRL_PIN(S32G_IMCR_LIN2_RX),
+	S32_PINCTRL_PIN(S32G_IMCR_DSPI0_PCS0),
+	S32_PINCTRL_PIN(S32G_IMCR_DSPI0_SCK),
+	S32_PINCTRL_PIN(S32G_IMCR_DSPI0_SIN),
+	S32_PINCTRL_PIN(S32G_IMCR_DSPI1_PCS0),
+	S32_PINCTRL_PIN(S32G_IMCR_DSPI1_SCK),
+	S32_PINCTRL_PIN(S32G_IMCR_DSPI1_SIN),
+	S32_PINCTRL_PIN(S32G_IMCR_DSPI2_PCS0),
+	S32_PINCTRL_PIN(S32G_IMCR_DSPI2_SCK),
+	S32_PINCTRL_PIN(S32G_IMCR_DSPI2_SIN),
+	S32_PINCTRL_PIN(S32G_IMCR_DSPI3_PCS0),
+	S32_PINCTRL_PIN(S32G_IMCR_DSPI3_SCK),
+	S32_PINCTRL_PIN(S32G_IMCR_DSPI3_SIN),
+	S32_PINCTRL_PIN(S32G_IMCR_DSPI4_PCS0),
+	S32_PINCTRL_PIN(S32G_IMCR_DSPI4_SCK),
+	S32_PINCTRL_PIN(S32G_IMCR_DSPI4_SIN),
+	S32_PINCTRL_PIN(S32G_IMCR_DSPI5_PCS0),
+	S32_PINCTRL_PIN(S32G_IMCR_DSPI5_SCK),
+	S32_PINCTRL_PIN(S32G_IMCR_DSPI5_SIN),
+	S32_PINCTRL_PIN(S32G_IMCR_LLCE_CAN0_RXD),
+	S32_PINCTRL_PIN(S32G_IMCR_LLCE_CAN1_RXD),
+	S32_PINCTRL_PIN(S32G_IMCR_LLCE_CAN2_RXD),
+	S32_PINCTRL_PIN(S32G_IMCR_LLCE_CAN3_RXD),
+	S32_PINCTRL_PIN(S32G_IMCR_LLCE_CAN4_RXD),
+	S32_PINCTRL_PIN(S32G_IMCR_LLCE_CAN5_RXD),
+	S32_PINCTRL_PIN(S32G_IMCR_LLCE_CAN6_RXD),
+	S32_PINCTRL_PIN(S32G_IMCR_LLCE_CAN7_RXD),
+	S32_PINCTRL_PIN(S32G_IMCR_LLCE_CAN8_RXD),
+	S32_PINCTRL_PIN(S32G_IMCR_LLCE_CAN9_RXD),
+	S32_PINCTRL_PIN(S32G_IMCR_LLCE_CAN10_RXD),
+	S32_PINCTRL_PIN(S32G_IMCR_LLCE_CAN11_RXD),
+	S32_PINCTRL_PIN(S32G_IMCR_LLCE_CAN12_RXD),
+	S32_PINCTRL_PIN(S32G_IMCR_LLCE_CAN13_RXD),
+	S32_PINCTRL_PIN(S32G_IMCR_LLCE_CAN14_RXD),
+	S32_PINCTRL_PIN(S32G_IMCR_LLCE_CAN15_RXD),
+	S32_PINCTRL_PIN(S32G_IMCR_CAN1_RXD),
+	S32_PINCTRL_PIN(S32G_IMCR_CAN2_RXD),
+	S32_PINCTRL_PIN(S32G_IMCR_CAN3_RXD),
+	S32_PINCTRL_PIN(S32G_IMCR_USB_CLK),
+	S32_PINCTRL_PIN(S32G_IMCR_USB_DATA0),
+	S32_PINCTRL_PIN(S32G_IMCR_USB_DATA1),
+	S32_PINCTRL_PIN(S32G_IMCR_USB_DATA2),
+	S32_PINCTRL_PIN(S32G_IMCR_USB_DATA3),
+	S32_PINCTRL_PIN(S32G_IMCR_USB_DATA4),
+	S32_PINCTRL_PIN(S32G_IMCR_USB_DATA5),
+	S32_PINCTRL_PIN(S32G_IMCR_USB_DATA6),
+	S32_PINCTRL_PIN(S32G_IMCR_USB_DATA7),
+	S32_PINCTRL_PIN(S32G_IMCR_USB_DIR),
+	S32_PINCTRL_PIN(S32G_IMCR_USB_NXT),
+	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_1_MDIO),
+	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_1_CRS),
+	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_1_COL),
+	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_1_RX_D0),
+	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_1_RX_D1),
+	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_1_RX_D2),
+	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_1_RX_D3),
+	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_1_RX_ER),
+	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_1_RX_CLK),
+	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_1_RX_DV),
+	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_1_TX_CLK),
+	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_1_REF_CLK),
+	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_2_MDIO),
+	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_2_CRS),
+	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_2_COL),
+	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_2_RX_D0),
+	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_2_RX_D1),
+	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_2_RX_D2),
+	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_2_RX_D3),
+	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_2_RX_ER),
+	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_2_RX_CLK),
+	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_2_RX_DV),
+	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_2_TX_CLK),
+	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_2_REF_CLK),
+	S32_PINCTRL_PIN(S32G_IMCR_SIUL_EIRQ0),
+	S32_PINCTRL_PIN(S32G_IMCR_SIUL_EIRQ1),
+	S32_PINCTRL_PIN(S32G_IMCR_SIUL_EIRQ2),
+	S32_PINCTRL_PIN(S32G_IMCR_SIUL_EIRQ3),
+	S32_PINCTRL_PIN(S32G_IMCR_SIUL_EIRQ4),
+	S32_PINCTRL_PIN(S32G_IMCR_SIUL_EIRQ5),
+	S32_PINCTRL_PIN(S32G_IMCR_SIUL_EIRQ6),
+	S32_PINCTRL_PIN(S32G_IMCR_SIUL_EIRQ7),
+	S32_PINCTRL_PIN(S32G_IMCR_SIUL_EIRQ8),
+	S32_PINCTRL_PIN(S32G_IMCR_SIUL_EIRQ9),
+	S32_PINCTRL_PIN(S32G_IMCR_SIUL_EIRQ10),
+	S32_PINCTRL_PIN(S32G_IMCR_SIUL_EIRQ11),
+	S32_PINCTRL_PIN(S32G_IMCR_SIUL_EIRQ12),
+	S32_PINCTRL_PIN(S32G_IMCR_SIUL_EIRQ13),
+	S32_PINCTRL_PIN(S32G_IMCR_SIUL_EIRQ14),
+	S32_PINCTRL_PIN(S32G_IMCR_SIUL_EIRQ15),
+	S32_PINCTRL_PIN(S32G_IMCR_SIUL_EIRQ16),
+	S32_PINCTRL_PIN(S32G_IMCR_SIUL_EIRQ17),
+	S32_PINCTRL_PIN(S32G_IMCR_SIUL_EIRQ18),
+	S32_PINCTRL_PIN(S32G_IMCR_SIUL_EIRQ19),
+	S32_PINCTRL_PIN(S32G_IMCR_SIUL_EIRQ20),
+	S32_PINCTRL_PIN(S32G_IMCR_SIUL_EIRQ21),
+	S32_PINCTRL_PIN(S32G_IMCR_SIUL_EIRQ22),
+	S32_PINCTRL_PIN(S32G_IMCR_SIUL_EIRQ23),
+	S32_PINCTRL_PIN(S32G_IMCR_SIUL_EIRQ24),
+	S32_PINCTRL_PIN(S32G_IMCR_SIUL_EIRQ25),
+	S32_PINCTRL_PIN(S32G_IMCR_SIUL_EIRQ26),
+	S32_PINCTRL_PIN(S32G_IMCR_SIUL_EIRQ27),
+	S32_PINCTRL_PIN(S32G_IMCR_SIUL_EIRQ28),
+	S32_PINCTRL_PIN(S32G_IMCR_SIUL_EIRQ29),
+	S32_PINCTRL_PIN(S32G_IMCR_SIUL_EIRQ30),
+	S32_PINCTRL_PIN(S32G_IMCR_SIUL_EIRQ31),
+};
+
+static const struct s32_pin_range s32_pin_ranges_siul2[] = {
+	/* MSCR pin ID ranges */
+	S32_PIN_RANGE(0, 101),
+	S32_PIN_RANGE(112, 122),
+	S32_PIN_RANGE(144, 190),
+	/* IMCR pin ID ranges */
+	S32_PIN_RANGE(512, 595),
+	S32_PIN_RANGE(631, 909),
+	S32_PIN_RANGE(942, 1007),
+};
+
+static struct s32_pinctrl_soc_info s32_pinctrl_info = {
+	.pins = s32_pinctrl_pads_siul2,
+	.npins = ARRAY_SIZE(s32_pinctrl_pads_siul2),
+	.mem_pin_ranges = s32_pin_ranges_siul2,
+	.mem_regions = ARRAY_SIZE(s32_pin_ranges_siul2),
+};
+
+static const struct of_device_id s32_pinctrl_of_match[] = {
+	{
+
+		.compatible = "nxp,s32g2-siul2-pinctrl",
+		.data = (void *) &s32_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, s32_pinctrl_of_match);
+
+static int s32g_pinctrl_probe(struct platform_device *pdev)
+{
+	const struct of_device_id *of_id =
+		of_match_device(s32_pinctrl_of_match, &pdev->dev);
+
+	if (!of_id)
+		return -ENODEV;
+
+	return s32_pinctrl_probe
+			(pdev, (struct s32_pinctrl_soc_info *) of_id->data);
+}
+
+static const struct dev_pm_ops s32g_pinctrl_pm_ops = {
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(s32_pinctrl_suspend,
+				     s32_pinctrl_resume)
+};
+
+static struct platform_driver s32g_pinctrl_driver = {
+	.driver = {
+		.name = "s32g-siul2-pinctrl",
+		.owner = THIS_MODULE,
+		.of_match_table = s32_pinctrl_of_match,
+		.pm = &s32g_pinctrl_pm_ops,
+		.suppress_bind_attrs = true,
+	},
+	.probe = s32g_pinctrl_probe,
+};
+
+builtin_platform_driver(s32g_pinctrl_driver);
+
+MODULE_AUTHOR("Matthew Nunez <matthew.nunez@nxp.com>");
+MODULE_DESCRIPTION("NXP S32G pinctrl driver");
+MODULE_LICENSE("GPL");
-- 
2.37.3

