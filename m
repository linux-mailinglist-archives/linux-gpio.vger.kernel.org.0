Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EB6168D60E
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Feb 2023 12:57:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231252AbjBGL5C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Feb 2023 06:57:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231128AbjBGL5A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Feb 2023 06:57:00 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DAC41C336;
        Tue,  7 Feb 2023 03:56:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dz9ZFviqzag7KSNy069mvzpXE1ck1GdzUugIUnZekK1ZSDRwioSycymVWeygymqGGDdjBHNADZHdBUvVKzMtOn6OpKOgvZDULLhzS31LiFLQa9jG0oxIybMk6v5r26Zfte0Mod9k4ZTQkqeZz2coSnk1sTWoMbdSbUJ/W1L5EZjSQim2GvgVXDZkXcT0z9VbQHHApuR9SzPL5d1F4dRVqC1sCq24KJwn+eQGRsvt9igYwOgf2guO1SgduJ1ONkcsXr57n1XmluESmoTrgAyoTf0OidRjJrR0GQd81tVjQCo1hMrmbRQHyIvVU3BC4abwWH4LNksHBfmFny1g3huctw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/fv94bXGqowcpUqmgiyPmAVAaYsqOBE/G8JIApidXQc=;
 b=VUHvTlV+bZhhZRKrECBiaVK2335A4KSB7i8j3dQtHs/3HU1oeunX/AW0RWY8jJLNrEEo9TOVYwZ3uzBm35DxD1+wKTxYo4vODZ4GuNQrY0x6gZtcq6beTlGPnGYLIG7up6fZj5Bjieqf0w8P77zRwAio88ax3Il/RX8cho1UyEwCUKrzINbbP/bYB8ybtTr1CdJBW7EuuptCJFno1l5m8tm6l6glUbp8i2mCwfvfRC+IQPQMbpnC83RBP4p+Y9mquzAwQBNCGXwCSz4lbo7SzXEuIf/qLNFcczng8EVWC0ICO2J4wCKfR8Qe0/SyK050Whm+NFUVH0pTiDt5ITpKBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/fv94bXGqowcpUqmgiyPmAVAaYsqOBE/G8JIApidXQc=;
 b=R6qmBTOS6D4EeH3b2OAzVUOjPPW+otdFaOQenpv+e5ZSYacMZTeqElRtu8GFlpoRqzTj1s1LDqtcx4bmmjAOXg/i6wpC3RZDPvai+vdkgphgi3fNh7BjbqAq4XDqZI1zU7hNvtc2bDyB6Jjze3j0hMNoH6MzyJRbdIiW5spNurLszyh5PvOlyz3g7tJ91nHQDEV7QB+rR+JwpdEYsBNljmcjyo2jWGXz8cgc7wvsm8csQKzj8svuAJ6AIE69kXPDSoxU6q5mWPX+aia1r84FIIkDNh38XQvi9I7X1iHPhiiSdMsHZ0iD8M16mzZIB0HDW09CnTXyetlQ4CQDAmfKww==
Received: from DS7PR03CA0339.namprd03.prod.outlook.com (2603:10b6:8:55::18) by
 DM6PR12MB4944.namprd12.prod.outlook.com (2603:10b6:5:1ba::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.36; Tue, 7 Feb 2023 11:56:55 +0000
Received: from DM6NAM11FT075.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:55:cafe::1f) by DS7PR03CA0339.outlook.office365.com
 (2603:10b6:8:55::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36 via Frontend
 Transport; Tue, 7 Feb 2023 11:56:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DM6NAM11FT075.mail.protection.outlook.com (10.13.173.42) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.16 via Frontend Transport; Tue, 7 Feb 2023 11:56:55 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 7 Feb 2023
 03:56:49 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 7 Feb 2023 03:56:48 -0800
Received: from pshete-ubuntu.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Tue, 7 Feb 2023 03:56:46 -0800
From:   Prathamesh Shete <pshete@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-gpio@vger.kernel.org>
CC:     <smangipudi@nvidia.com>, <pshete@nvidia.com>
Subject: [PATCH 3/3] arm64: tegra: Add Tegra234 pinmux device
Date:   Tue, 7 Feb 2023 17:26:17 +0530
Message-ID: <20230207115617.12088-3-pshete@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230207115617.12088-1-pshete@nvidia.com>
References: <20230207115617.12088-1-pshete@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT075:EE_|DM6PR12MB4944:EE_
X-MS-Office365-Filtering-Correlation-Id: c93d694e-ed8a-407c-282f-08db090268a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s7FFf5UaNore8BFnKVLJFAUN3UIVt049eA/dhsSj3mqc3iuakeTRFvkJIpx7hQvRvO7cr9xxtTjsM79lgKeaNUNULjhapWiUnERqvUXwQCBHGY3obavlHQdZ2P1KJtqvAotBfR2R+VDfZZoW8dLdl/q33iS1s9XDFgFXzi0LVQGmPeBuAx0pA7HWU/wqFjWtC6m6BYFSoYFrZ/nSe2cLrXr4Nv3kLEVS0u907kHVX7KYHdPlvvKtDA+G7OjcUEHQZtU9rJLNQjtaa59KR4XedmaW1DgD8/WZVS2c2u09dfwpPWEBXad1fhPV97hZ69JrSTZMvdVsC+PR+Cw7Jtvk9GjMAkamADBCR6GwskSEFQaQdpwAzhaxajtBKNrjitNaVW4kOkcDY7F68GDkHBolJTZYrWDnjA0MrmXf/Wm/u15AwTGP6IGheSV60g1u/gjCaYGF5Kd02bKR0nd4kQ4JT3a8SUGvWvhrCy2C30I9rwZ1AkTEQ78gtRkxu7huTSvEWwumnYeT0VyYKp4Wzhev0j4/ta1faNDAkJ5QyTZpROTsfbP0erdof27Abc+rWD1IbUwBd7ENKHenHmfBepkuq9rublucLMqOLgV6b01YbTnoJmdnWWXuuEnpwhr2nXomerzcocVpJh7pSE0Qu5QQMf7HETXJIMLndjzQvm0yzNGUPdE1SnKrEcGr9YvrbgVgv7SIntW8WUqNAJJ52aFtig==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199018)(40470700004)(36840700001)(46966006)(86362001)(8936002)(41300700001)(4744005)(5660300002)(70206006)(4326008)(70586007)(8676002)(316002)(110136005)(54906003)(82310400005)(40480700001)(36756003)(2906002)(40460700003)(47076005)(426003)(1076003)(26005)(186003)(6666004)(107886003)(336012)(2616005)(7636003)(356005)(36860700001)(82740400003)(7696005)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 11:56:55.1562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c93d694e-ed8a-407c-282f-08db090268a0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT075.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4944
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This change adds pinmux node for Tegra234.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index eaf05ee9acd1..c91b88bc56d1 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -701,6 +701,13 @@
 			interrupt-controller;
 			#gpio-cells = <2>;
 			gpio-controller;
+			gpio-ranges = <&pinmux 0 0 164>;
+		};
+
+		pinmux: pinmux@2430000 {
+			compatible = "nvidia,tegra234-pinmux";
+			reg = <0x2430000 0x19100>;
+			status = "okay";
 		};
 
 		mc: memory-controller@2c00000 {
@@ -1664,6 +1671,13 @@
 			interrupt-controller;
 			#gpio-cells = <2>;
 			gpio-controller;
+			gpio-range = <&pinmux_aon 0 0 32>;
+		};
+
+		pinmux_aon: pinmux@c300000 {
+			compatible = "nvidia,tegra234-pinmux-aon";
+			reg = <0xc300000 0x4000>;
+			status = "okay";
 		};
 
 		pwm4: pwm@c340000 {
-- 
2.17.1

