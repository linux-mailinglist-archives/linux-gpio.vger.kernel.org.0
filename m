Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0BEF60E449
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 17:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234489AbiJZPQW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 11:16:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233378AbiJZPQV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 11:16:21 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3C0211DAA3;
        Wed, 26 Oct 2022 08:16:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJddlv3VQb7Of55+Uqd+QioxStyKCHxP2Guu4RISTd7bERqYGrAi0sVuQ/xzB3BsVPBFlm+16/mvIhEUqqRwraSOMNx9MfYYpr/ss+12H2NjfP8ojD2oCIoeOTOk7pAYQe5nlvzyx7Uqv+m5HpccGgvfuCkSmaVstaNmgO/SG4NS0G+Xcc6HlEmtdXNvhOszxvtccItM/q4aYRpc1KdEtYEvzdI1wokRxO1ZB0LN80obdGgsUWUdM6KTZPegZZJlkA9eRab43ljXLReV2f/3mrxKC7fCmdoo+WS714K0MHLOgC0PwYLcR9QITRZT4Cqr9fORwlNqy8vWQjpb0ngggQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uayaKzliWFGFd1fiVivIsu8CLKJj+cmxb4IpX+5da5g=;
 b=eJ06wbk7Atcr8gDsa2IZ7Swy9ctC4Y10B4ZtOxmRDNkQPp2JRfSxcTfztNhh6Q9788gS9ThZkO9DQ0ybc4/IfbXdbYm6Rwgq0wkbdYUHS835lQfIl0IKh7IAxJEBlVRj1YxLCr9ZGe3NV+WE3EarsJClb5cYUYl4J4RxaNniw1RmD6T0jLcYs545RWeQtAziP6HHSuTJnxgizoGseLodcw8p1l6HCIyj5pA62f6hYQVDIRgvm4siaqfpK0UAIpjKkrx3RR3Nusx/aFiuGUl/6ggQsGcYhA2QOW2JgFeZz086+pu/qEEqQTJQje8FeJK+HbepfnZ+0GpuJp4AboLH/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uayaKzliWFGFd1fiVivIsu8CLKJj+cmxb4IpX+5da5g=;
 b=1zmeuStYQthReLVCd9L0AR3LbMT6KLY/EltCF4at5/xI3c56R+mpK5CmXBSH5fgJWh4+YYa+dYtRUmtBkGRKXaRsvZa4KuvUH2pQ9hIBUfMz2Lo56JpyH65I+4Js1AAi4tzFRYOCVLwzUkelOyDNuleZEp0UhD3Svdgr+bYjVY8=
Received: from BN9PR03CA0927.namprd03.prod.outlook.com (2603:10b6:408:107::32)
 by MN0PR12MB6001.namprd12.prod.outlook.com (2603:10b6:208:37d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Wed, 26 Oct
 2022 15:16:16 +0000
Received: from BN8NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:107:cafe::7) by BN9PR03CA0927.outlook.office365.com
 (2603:10b6:408:107::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28 via Frontend
 Transport; Wed, 26 Oct 2022 15:16:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT006.mail.protection.outlook.com (10.13.177.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Wed, 26 Oct 2022 15:16:16 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 26 Oct
 2022 10:16:12 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 26 Oct
 2022 08:15:46 -0700
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Wed, 26 Oct 2022 10:15:44 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-gpio@vger.kernel.org>
CC:     <git@amd.com>, <devicetree@vger.kernel.org>,
        <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <geert@linux-m68k.org>
Subject: [PATCH v6 0/3] gpio: pca9570: add slg7xl45106 support
Date:   Wed, 26 Oct 2022 20:45:40 +0530
Message-ID: <20221026151543.20695-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT006:EE_|MN0PR12MB6001:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dbd98db-1396-4f73-3672-08dab765071d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oLkJZrH0OHnwDQSdknvVeIwMjamZJ3gqLqMj0oWvLwFzDKGhaNPAwv78Ckf2dpalzg85zwd2070+dVMj/wN9NADhUNsO6tjQamDuwol9GclnokBWFKJ0ERekpBVYkm1e18ZMo2OcG3eLCb3XpubVRQNj5smaG5fdetwlVZUo299mVhsgiVJxopQZfADNBZfkqMeqBBIbcxge+VqYgsW4ln6FL299Ixq+rIPvvRtKkN8HktPA85oyMJcHyOqnNg6JmGMBnPP8UoQfpOs8XdoAgltcOAmNMlvvdyakvuaAFoeZXEpSU0ft2VsateI6CbzYkocqRhbKDl4Z4RXEufEaq/QrlX4H7rXl+TEhqNp9gJjCZ25vxQa97mkCtYx/gx2b4pLzyFSfix5qtaDbxEU7soDcnwYz2GWRSKxIq+zYzbAqRLG7A6IP+pVFlB5b0Ym+8NEk6eigrtRs47G16Pai5zZZotLRDTM1cKLGKW8OXNDT863ymFzovQRPQOlTKqId0aqbuDFpygIQEItgDYVKmFdo4vaeQfSyKh7nGjkrNOFnyPSxY1WBFj4fPYDEYYbkiB0jl60mb2M7RR45uFqNiXhaG6Aa13leJAT7GVLIc0gbuFUibGI4W8UXNN+Vrb1UkDvpm+H4+PWXJCDrpfYSVozpt5QhaLPS/C71et9+/pntZg31lDWHlbY5xYmEqDcCycIpkxNKuP4xmkA98CAwJn+Lem06dIB4ExE+pO+13NMYOYQ7/Mv03boKhlagbk16FmfY0Cr+NP7MAdaNGU5ztcqh71dQf/D42gutOIE9qvs=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(136003)(396003)(376002)(451199015)(46966006)(40470700004)(36840700001)(86362001)(82740400003)(2906002)(54906003)(70206006)(83380400001)(1076003)(2616005)(8936002)(47076005)(356005)(4744005)(81166007)(82310400005)(186003)(44832011)(40480700001)(8676002)(41300700001)(426003)(316002)(336012)(6916009)(478600001)(70586007)(5660300002)(4326008)(26005)(6666004)(40460700003)(36756003)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 15:16:16.4812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dbd98db-1396-4f73-3672-08dab765071d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6001
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Add Dialog semiconductors SLG7XL45106 GPO expander


Changes in v6:
Fix the bisectablity reported by Geert Uytterhoeven

v4 and v5:
Resend as the patches were mangled.

Changes in v3:
Add ack
split the new patch
Suggested by Andy Shevchenko

Changes in v2:
add alphabetically

Shubhrajyoti Datta (3):
  dt-bindings: gpio: pca9570: Add compatible for slg7xl45106
  gpio: pca9570: add a platform data structure
  gpio: pca9570: add slg7xl45106 support

 .../bindings/gpio/gpio-pca9570.yaml           |  1 +
 drivers/gpio/gpio-pca9570.c                   | 49 ++++++++++++++++---
 2 files changed, 44 insertions(+), 6 deletions(-)

-- 
2.17.1

