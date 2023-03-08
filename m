Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB2376B0641
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Mar 2023 12:45:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbjCHLpG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Mar 2023 06:45:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjCHLpF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Mar 2023 06:45:05 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2061d.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::61d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 803515D8A0;
        Wed,  8 Mar 2023 03:45:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G4L7rPkShFPhpd5qKnjHLriC+YY4dX7ke/eL9Z0yA7NYcMeTeD93h6xilK38a0gjnBblJLJEF3mT9SQOchrFLBJmUsaJUfPg26rHFW5MoNixhjVQfyDA1PKizv/h7f2g7f34DTBQSD6fGN5lzKYhcOLKxBd2dR2ESd5RU7AyMCXzoKGfqXy70RYJr3PY9x7/GAZeXvU17g2Xo+/2w0JqIi333cNSy8upCpKJ1bJhUzN9sH71tiVV4O3LoB2H/NmIvK59ZhMvn6npg103ZWfqBBprl5ipSH8bUp3cYIGKyP3Mb8MsY5/e8ULEIzcxhlZzIGxHqbl6s+QAjU7wTzNTYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cwuixUyddLHRwyV7byVgf6c8p4DD1k2+Ohz4hmuZOZo=;
 b=NOOPHPQseOoqGYoDKaT9xqbo3ywwGQ1hTdei9MdgsnOgWOwKe7/Wa59hBWUazIrtheQ6p5Cz/p+kPRFK8t0gRYmN88yWFii6YTZsgSrbRcqwB57K4l0F10kOhH7XrmujNz8krwWlnKp0fT0lkOrRqTQ1tno3T9qyskfi1Gvhdx/WDA/FYU/7ZdaPcUy28Oc9Fp9lKaZU6iA4BOfrpLdCuAz/EsBiFvTFosNyKjbeGJPP1tahH0iznzx7TbDgXkponzCkb6nihJOUC3EgE8BJcgxsC8mjlj7Gu9SprU3dmtKxhikw3QCP72Beotdn8cu+bO/PWhscaGobs2hH3LU4pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwuixUyddLHRwyV7byVgf6c8p4DD1k2+Ohz4hmuZOZo=;
 b=FvFyqrA3gxJiTZ/kwA/TjJy4h6VxaTM77jRgujPk7QmY8LNlvM26QXGl7n34FQC09c4F06p5um8HGTI4p/7LZKgGvZcUaWG2qRSU14h2fIpDiVz+o/wo/h5/Xu9wOHVozfrztauTErLOAqAMwcsA99TFslQQMQUIV9uXWr/HrUzJJwnMFuMLSpDOfSDcT+l3zzK0RtsCMFCoOUHY/+OxiXfO9WkaL1WhQiDKEBz+r4wjdc9To+kKgfMdxj2h8ihO7YAGcYgsB9YW/ux5SkB2JUf+hvQeO0csRMtvAODnyBx6oz2ZZnJxaBOi+1zw8P2fvrZP5iypnAgYTZVwnGcUfA==
Received: from BN0PR04CA0071.namprd04.prod.outlook.com (2603:10b6:408:ea::16)
 by CH3PR12MB8878.namprd12.prod.outlook.com (2603:10b6:610:17e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Wed, 8 Mar
 2023 11:45:00 +0000
Received: from BN8NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ea:cafe::88) by BN0PR04CA0071.outlook.office365.com
 (2603:10b6:408:ea::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29 via Frontend
 Transport; Wed, 8 Mar 2023 11:45:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN8NAM11FT059.mail.protection.outlook.com (10.13.177.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.17 via Frontend Transport; Wed, 8 Mar 2023 11:44:59 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Wed, 8 Mar 2023
 03:44:45 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Wed, 8 Mar 2023 03:44:45 -0800
Received: from pshete-ubuntu.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.986.5 via Frontend
 Transport; Wed, 8 Mar 2023 03:44:42 -0800
From:   Prathamesh Shete <pshete@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-gpio@vger.kernel.org>
CC:     <smangipudi@nvidia.com>, <pshete@nvidia.com>
Subject: [PATCH v2 3/3] arm64: tegra: Add Tegra234 pinmux device
Date:   Wed, 8 Mar 2023 17:14:32 +0530
Message-ID: <20230308114432.27133-3-pshete@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230308114432.27133-1-pshete@nvidia.com>
References: <20230308114432.27133-1-pshete@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT059:EE_|CH3PR12MB8878:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f242d2e-d20b-46cf-ac36-08db1fca8c59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tg7tTC2okvhyiVvOck2InPfgv765in+ztqkfzRc7CMfoHsTHH/kMCPiB+DOT5wdKcDHMYTkINNYrz9UnBCfgzPioNPlUnyL+OwhbSjzv3dMYGJWJ3Ax39c76voTUeQTuflBNIa87x3vdhX/gZcoWuYrWThH7cV0K0/rNQ+K1PFUhxeNkp4vaCacUnO5aQMpu5Fol95MBaPeQ+dhr7r+z1YV5ehxlSYekciCjT1MQ1au2AOwkMd4HVoFmhCdLbDpkmQnBNt19TT8qm54Yy+f4Zo/u6weKDf+nM8Sydt4HD83aCKv9KwrF0TG5wrL9PQ0Vecalmx2YalZIdW5ik+DjYCfJQwXFvvN+fIybot2awhX0juc2B3ygn4tzaykJHjArFdXaL9aIc8U/rYieX3Bvj8xfOClYiq8uMqOU7hoaDpkp5Cc6QncLa8LKdG1SVgVsBPgo16u8epaYTgVe6Gpzoeahqp72ndrT6HUv3h+QA0ORRDw/2ijN18jcr4YxNqcIN2ihzmNmkaMFM3ePHNn5QmncLKg76F+kfujtG+Egz5Ql2Hq1GT64nQaYN58Z2lVGx7LO3hi6CUNmJjWDoNg2fFE+hhRk+LSkuLysQMG52Z9I87FTeWIjnCDv5MlcnzSnTcHwnEEcudVGlAwfma8jztOaz24SKnSz6vKRiUQlNr3UdeT53wRF8Mj4tSD+iXj5Dyvk7pTISlzJNr979pV9zw==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(396003)(346002)(39860400002)(451199018)(46966006)(36840700001)(40470700004)(36860700001)(82740400003)(86362001)(7636003)(8936002)(36756003)(40480700001)(356005)(70206006)(1076003)(4326008)(5660300002)(8676002)(70586007)(4744005)(41300700001)(2906002)(82310400005)(186003)(2616005)(40460700003)(336012)(47076005)(426003)(26005)(110136005)(478600001)(107886003)(54906003)(7696005)(316002)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 11:44:59.9724
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f242d2e-d20b-46cf-ac36-08db1fca8c59
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8878
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This change adds pinmux node for Tegra234.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index eaf05ee9acd1..1d52f2d8f1a8 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -701,6 +701,12 @@
 			interrupt-controller;
 			#gpio-cells = <2>;
 			gpio-controller;
+			gpio-ranges = <&pinmux 0 0 164>;
+		};
+
+		pinmux: pinmux@2430000 {
+			compatible = "nvidia,tegra234-pinmux";
+			reg = <0x2430000 0x19100>;
 		};
 
 		mc: memory-controller@2c00000 {
@@ -1664,6 +1670,12 @@
 			interrupt-controller;
 			#gpio-cells = <2>;
 			gpio-controller;
+			gpio-range = <&pinmux_aon 0 0 32>;
+		};
+
+		pinmux_aon: pinmux@c300000 {
+			compatible = "nvidia,tegra234-pinmux-aon";
+			reg = <0xc300000 0x4000>;
 		};
 
 		pwm4: pwm@c340000 {
-- 
2.17.1

