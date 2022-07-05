Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C55A15667C9
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Jul 2022 12:22:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232087AbiGEKWI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Jul 2022 06:22:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231167AbiGEKVo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jul 2022 06:21:44 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2050.outbound.protection.outlook.com [40.107.93.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 643F7140BF
        for <linux-gpio@vger.kernel.org>; Tue,  5 Jul 2022 03:21:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0Vmqy76RMNq4+6Y1tlO8JlXZvoZaqKEB+O9vVHZXjPyLheHPhyU6igzWD7sWFD2O1YZyhNUMNXecspdJBeCWhqzkDJ4Ri9ZHdKKlZ5KgE7Hs8jwDq4OAEByn7ggAQNrAe0S4eKRIxlBlWMefH3y0Fe/70U+bV3YJneV16evBf45qNyT6ow9BRNUzn76mz85reY+F+eLDPOir1rGte0Inv4Xhg/4UWcsheIoBziro+hZbZUf/CLI/r3tl3Db5kwn9RcSLqC7HjeEml46RPeVB0KuEeegOQpUTiVRFDNwCfZgayHBkrPFrewfouRyHQfNrn2J5TA/geZDJdxenKQ87g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GarChYSC2xyFm8gggBtbeq9t/fubx+Tbti+3FbyW7MQ=;
 b=G+MKu3luF2/hVEYyXdtBt2EwvneqsnUq+7vvNrtCC4cMgziYBf7n6o9DuoGDO69FllaQKZLsDpbqgY9fodF/8GIaHaVuTAK1ArQ//oSfqTN1gC0kAo/xIz9krQ/W6fk2d4ZARO0KsFAjYqzFO741uW8cIyO6dj6xr2dScG87Y7fzqVwaS/YCIf8ZcHroHLAt9QDcqHlvWtXx44BWQkIok5Kdm9XsB1q2PhkPCcXLBw7hEew9/cYuohWoZZtUqPimjIB1hEb1aV+AIc65Y/JFdyAQeILkkDBa2Rubj+3D5tWwwpM2PPUxXEjK0q4zFZjvIMgVE9iJwnaCjgYIrIhoCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=nxp.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GarChYSC2xyFm8gggBtbeq9t/fubx+Tbti+3FbyW7MQ=;
 b=HPM1DOhLQqnhL4FBv7BCBMEuD/lqqonh2kLPPeOojZ8AA/xRk2Yw9BYNCBQkIs+KdLZJ6xFiLTh84qMWKWLTD67DvxSO+s+oUryhgL3IlKbMFcLC9/Tjrev8fvMuTByZzDNHcJI2XNRua2IkcMfTCBZyMST7ICIe6r8RlC2tKfnSuDJ43WHzkxI0r+XhUtfFuAKTHFmuuBwx/5g9ODBUXNbtFKYX84/b7g5d6vPafF7LVIgTWcYySqII4S5HYR8lw9nF0gZYytaKL+bqjQmJFXFJpo03ZswQAzqRREdL+bIVwOi+RYOMIH43FkJ2WUD9qnUF5EPGSSR9DRz9kg458Q==
Received: from BN9P222CA0006.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::11)
 by BN8PR12MB3235.namprd12.prod.outlook.com (2603:10b6:408:6e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Tue, 5 Jul
 2022 10:21:42 +0000
Received: from BN8NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10c:cafe::85) by BN9P222CA0006.outlook.office365.com
 (2603:10b6:408:10c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15 via Frontend
 Transport; Tue, 5 Jul 2022 10:21:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 BN8NAM11FT006.mail.protection.outlook.com (10.13.177.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5395.14 via Frontend Transport; Tue, 5 Jul 2022 10:21:41 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Tue, 5 Jul
 2022 10:21:35 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Tue, 5 Jul 2022
 03:21:34 -0700
Received: from vdi.nvidia.com (10.127.8.14) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server id 15.2.986.26 via Frontend Transport; Tue, 5 Jul
 2022 03:21:30 -0700
From:   Tariq Toukan <tariqt@nvidia.com>
To:     <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        Peng Fan <peng.fan@nxp.com>,
        "Andy Shevchenko" <andy.shevchenko@gmail.com>
CC:     Tariq Toukan <tariqt@nvidia.com>,
        Ran Rozenstein <ranro@nvidia.com>, <gal@nvidia.com>,
        Leon Romanovsky <leonro@nvidia.com>,
        Saeed Mahameed <saeedm@nvidia.com>
Subject: [PATCH gpio] gpio: vf610: fix compilation error
Date:   Tue, 5 Jul 2022 13:21:14 +0300
Message-ID: <20220705102114.2067-1-tariqt@nvidia.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38fef9a7-16f9-43ea-021b-08da5e70277d
X-MS-TrafficTypeDiagnostic: BN8PR12MB3235:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kw8YSQyML1GRPE7p3xH88h4D8WAR/pufAAmh1l70tLoHmek06j5e10FCiMShz6rxhbBGxjRceP2w3Fh4+qMBa1Jg1HEk+SP8v6VmX5zIVe6cFy/DnXcEw8CfxAvxTLjhjxYnXGckQSH5svfLeidCaIqe6/35FVPx/a8PLmO6Rq/1276//HZb/j0R3a042wc8TMm7A5hi5j8wxaUKrw0TzHoEAcLeFxYB/A8HqJYviVlXL+jU+rQwAuaFTr0TBT+qMazg52NATH/vsgkdaE1CkBpkF0IFN9tWV/iiruGEDaBTRHsUqUlHQYemgW9OafJ0wYlQ8QAzsopgCd4BWjf61bUiaBWh0Y74pitA/HXmuDPC+7GAU+kb+qL5nFcq6si3s8VJX0keDlhoQOpztlTh6zGZRx7Fw+cEh+NuEXVFDsz0kMxcSD8UQfvS388/I5nGgyWSKddsvuy1NAaErdhmEgaGdYeDteuy1XR9oCu1XChpyZmC+TlhGrBJWS1Q1qG0nyEEFjmQ/QSNea44uWuQwDgn+wH7xl4MwKqLLs2HBKy0OaCVdkPyFCeTooZkk44a+vkFNkDc5Vs8UGEL5rWs8FXard1pNZ8bTC7qklNaAS7p5IaxJPES3a52AUuTkyueoC2EAeU2muFjW+psIS/Hzi2HDtUVfBLYZ5jW37FOx0KeGGnJ08LVAwtI6b+fATx0xHGjufj3F98R8beq/7ZXOFR4AnqruUYb1R0Pwif2lSU3ckS6ghEA8shpFlOUvxnBUB+Buk5LQg+RE+Jz/U4S/U1pPPGcWldkwoDh9NBoYIRE+7BhzpVee49uEDgOkGM1ttkHQ94N7Oivt0PGqoBr6PEv1KXUcpLGxJdewk6/cEw=
X-Forefront-Antispam-Report: CIP:12.22.5.235;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(136003)(376002)(396003)(40470700004)(46966006)(36840700001)(1076003)(186003)(426003)(336012)(47076005)(5660300002)(2616005)(86362001)(36756003)(40480700001)(2906002)(4326008)(70586007)(36860700001)(70206006)(26005)(40460700003)(356005)(7696005)(8936002)(6666004)(41300700001)(8676002)(107886003)(54906003)(82310400005)(316002)(110136005)(82740400003)(478600001)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 10:21:41.6636
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38fef9a7-16f9-43ea-021b-08da5e70277d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.235];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3235
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Leon Romanovsky <leonro@nvidia.com>

Fix compilation error by explicitly adding the missing include.

drivers/gpio/gpio-vf610.c: In function ‘vf610_gpio_direction_input’:
drivers/gpio/gpio-vf610.c:120:9: error: implicit declaration of function ‘pinctrl_gpio_direction_input’; did you mean ‘vf610_gpio_direction_input’? [-Werror=implicit-function-declaration]
  120 |  return pinctrl_gpio_direction_input(chip->base + gpio);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |         vf610_gpio_direction_input

Fixes: 30a35c07d9e9 ("gpio: vf610: drop the SOC_VF610 dependency for GPIO_VF610")
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
Signed-off-by: Tariq Toukan <tariqt@nvidia.com>
---
 drivers/gpio/gpio-vf610.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 23cddb265a0d..9db42f6a2043 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -19,6 +19,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_irq.h>
+#include <linux/pinctrl/consumer.h>
 
 #define VF610_GPIO_PER_PORT		32
 
-- 
2.21.0

