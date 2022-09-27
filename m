Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94E575EC275
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Sep 2022 14:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbiI0MVM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Sep 2022 08:21:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232322AbiI0MUr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Sep 2022 08:20:47 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07on2087.outbound.protection.outlook.com [40.107.212.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 681CA15E4D0;
        Tue, 27 Sep 2022 05:19:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gESeBMGdVCARIjPNtn8k8Xxyy0b4kLshRDQCsvku7hbgDGn9ASrJpbXx3CgMgz2cw0ALe8EQNVPSpJMAekQllSzeJ/3nwK+6IAg2UdRcg0m92+bOyEzkIj6XjpjUzKUPx1M85SiO9jIjJQB5hKdV0Bt0K605h9ns2ERt1iefA3Z4mMG+G8POAHoftejCcs4B8q3xsib9qiKzRBGYOwXmvOce0guFUVEC+NyjhbPH05rSri2OrHRv7v+8J3lcordImVYxeuA8CiCkL7h4lCs48vQ2Q0pHyCTOPUS4MeK8EjHZw5Tz+POXOVdmvL42Jtep9fFQmGeZm8cZLTf6OLdx4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+gOgZALRrqKb2s5v4JcsNQETZClG1Yr+Evz0DXa7tg=;
 b=eX8AnLBQamEsml6SwSodJC25WJtyhDvF/G0UtH9tAl4Q+QN5c4r5Vypd0eSVswPOA1hLMlKwNtvQjnZCdBip+d8Y44K3fZ0QC15VG/9cSF7uYInOKA8iPOLDBheQHx7FvXP2nvk7MGB9NC2XLWOihkIXWMyLdFCDewn6P9aMDRd01mom7e35JgjZzWggDwybWgsUqIY5Y4WNHNPRm9hcFgaCtRAzn5uptuc4oRNkgO/EBdZcB6wBkhdr35uRA+OPafkIZaHj3fYWWbKXTs6m+AfsKwIgKEvEUNy8HTTOtdmFshedLYyvcAZQnxofBs/2ZJe6crKCXGHCZdfMv0Lwxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+gOgZALRrqKb2s5v4JcsNQETZClG1Yr+Evz0DXa7tg=;
 b=DfX+mtVQ9FQC19PuawVrPT23r/vV2l9AnxE7dxqm3Cdilf56NC+Zx8SA1rxCXBdcsEbobPs5SOi1TYMdZqSt/VIOWbJHeiHVyiM2OmdJiSpOxpnr+D477z6H4aZE0m8Xw1iacBTsCXCQcGEeiDMMRhnJHWYzn91PMQAuOUC3Wz4=
Received: from DM6PR07CA0091.namprd07.prod.outlook.com (2603:10b6:5:337::24)
 by CO6PR12MB5492.namprd12.prod.outlook.com (2603:10b6:5:35d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 12:19:23 +0000
Received: from DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:337:cafe::9a) by DM6PR07CA0091.outlook.office365.com
 (2603:10b6:5:337::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25 via Frontend
 Transport; Tue, 27 Sep 2022 12:19:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT030.mail.protection.outlook.com (10.13.172.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Tue, 27 Sep 2022 12:19:22 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 27 Sep
 2022 07:19:22 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 27 Sep
 2022 07:19:21 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Tue, 27 Sep 2022 07:19:19 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-gpio@vger.kernel.org>
CC:     <git@amd.com>, <devicetree@vger.kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <robh+dt@kernel.org>,
        <brgl@bgdev.pl>, <linus.walleij@linaro.org>
Subject: [PATCH v4 0/3] gpio: pca9570: add slg7xl45106 support
Date:   Tue, 27 Sep 2022 17:49:15 +0530
Message-ID: <20220927121918.30543-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT030:EE_|CO6PR12MB5492:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f58a5e8-2512-4c2f-89f2-08daa08282bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ep4iak3yzSD7DtAquM+mBjBt3kk8s3tgtEF5Swwsc6Am9jaeVdPPvJNCDE2v6P695shAbze38khOCAdCoMmlcVCUjuqUFgQ7QhbeATEefkHzYCadtpGz5sLnHslu5M2EuQJzbKdhxAdIsT4jNjL+yYpNXxURG3SLkVGRqji1MDtECfBvWy2hQIDc0KSdRx05SznYr4nVwQXjvaaJNsM6dGq6ZszpF0hWZ7nPvuISymCCGYcuM6Ea7Oot3KkZPLWpzqJ4VQ4RMDz3U59/OHME7W6tURz7lgfI/A0sgfrUfUeLWL1BHlB93Tx9VUol+gLRJjRWFc715OUZ468HwQ9iCWC0Jpt8iB92AbEjArjJyYFMyOk5vhxup4+wKQdnm8XfyQl7WVE9V3DVF6e4gNzYGQY4qy0QfrSwHwkS/wGPBXL4TJ9bin0fwlfeMS8R3Nlc9ZFGnZjU42UwuELOQsi+oWQWH0nW3nLkBkwPAUoPzclFA+4HhgBp9FMFEd+YJOQYkOXkf51kVObujXxQ+0aQulDJud8jWrC7D/D7eqgLPm4OCErStf6wX34ihPfuKZExjwngCKywvVharTUXelIt7RdPgJYrkZZRlepFLXkMGtxoyANVi4YJh71Bk1i7Wgldap1k4c9FNFlx2CpCaoeYcJ3EyhaDyI66KZ7hfRqmAo3P7feNMwIl3fc01P58naZmhtKsrEHpqqIkod1qTT1CvMgOWcSRrqbjihy5pt9T8y/Ss/l5P4/yLacQFOlYqT6Kslthp4g+5G44vrJzLyYN+emoVgTsMuWoZiaxREwDrU7yrMYTi/eAjKUqC/4TDnw+
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(39860400002)(136003)(376002)(451199015)(36840700001)(46966006)(40470700004)(5660300002)(4326008)(36756003)(2616005)(2906002)(1076003)(186003)(4744005)(8936002)(336012)(426003)(81166007)(47076005)(41300700001)(26005)(70206006)(44832011)(86362001)(40480700001)(8676002)(70586007)(356005)(82740400003)(40460700003)(316002)(83380400001)(36860700001)(6916009)(54906003)(6666004)(478600001)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 12:19:22.4840
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f58a5e8-2512-4c2f-89f2-08daa08282bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5492
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add SLG7XL45106 GPO expander
 
v2:
Use the platform data check instead of compatible
arrange alphabetically
rebase to the latest kernel

v3:
Reorder the p_data struct
Add ack

v4:
Resend as the v3 sent was doubled and mangled 

Shubhrajyoti Datta (3):
  dt-bindings: gpio: pca9570: Add compatible for slg7xl45106
  gpio: pca9570: add a platform data structure
  gpio: pca9570: add slg7xl45106 support

 .../bindings/gpio/gpio-pca9570.yaml           |  1 +
 drivers/gpio/gpio-pca9570.c                   | 49 ++++++++++++++++---
 2 files changed, 44 insertions(+), 6 deletions(-)

-- 
2.17.1

