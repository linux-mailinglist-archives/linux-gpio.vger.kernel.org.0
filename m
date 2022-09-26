Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A39755E994D
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Sep 2022 08:12:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233445AbiIZGMG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Sep 2022 02:12:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233055AbiIZGME (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Sep 2022 02:12:04 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D46627B1F;
        Sun, 25 Sep 2022 23:12:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WWGtO3W4VXJ1GkzZFKR2Ukvazlc2SGjszHpPSR24MrKYp7z6qyo3dCjwGRQW1OLYlBLt0+J/YH13Og+/5qvoWmRuqg2q8SifveY12mTYLRHqgKSbbd4BuxN9RFQAvjnbk+EKrWTipp3HGSmmu/WBvxoiRRwThuNqnrr7GWiRPBKjeuaY5/QT4ilr7GF5RRJO9YcO4/lw9MaT04FbscWj+NzkguCcQmRU+aSNGEkkRFMAYcUW55N3R+9ifaQFN1UWgiOpGj4Ievs89Kc6d2H15QT/2f6fuwqcsdtkO+F1e1K7q5ZFq2uvhNPtiD7Zl/6x7gNzrI1e3rT0ZgR00Kk48Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v9BBzoJOFSKuwBAOKgEhxQBZ4rkPF2OSeX64urUKvSs=;
 b=cpfR5uFOIlKSKeWBXmB++P7gyKqAJZr+3n21Culf4ROGSfKYVzQYsoVw8XJPeLAqGpBYGscGdGxyKuX1GwmkWI1p0zpr0BGA8lajA7PX+NyZ/aZXeblI+0rCo0hGtNARsvWrsToGYceHIAXU3OL/uibkqQILjaEMzwZoU2AXlKQvSRBnFp1x+7g1Zozzd19HQgbqs7C0urmjN0XgR6kHG9Bwfij5p6Y3v8B4XMLFIn6bB+PVI4/s4bYlccGKS8Kck4D0lU+9jbHYAbwTp1ApLVvp3TxWT/fyk8ki9BmtLwhtAL72FnPMcL7D47mDuJ8OFhzv0rPSvL5sMgmfZN8p5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9BBzoJOFSKuwBAOKgEhxQBZ4rkPF2OSeX64urUKvSs=;
 b=ivI8YCpYYDr5dG1U0iAWRNVrTFYpv0NUOR2oWEW01v8LtQVe5YrC8gG4TJwvDKGTBlILIrAD3ahSwn+1RM6ydzewFVbMs+I0SAOfhbP+mxPEeY0qVhTiPbeXaKjjG/E6rw808kpz1ksww9ynRbrPBHZVgXD/lfSnvSRSVq2dqGk=
Received: from MW2PR16CA0034.namprd16.prod.outlook.com (2603:10b6:907::47) by
 MN0PR12MB6293.namprd12.prod.outlook.com (2603:10b6:208:3c2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.24; Mon, 26 Sep
 2022 06:12:00 +0000
Received: from CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:0:cafe::95) by MW2PR16CA0034.outlook.office365.com
 (2603:10b6:907::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.24 via Frontend
 Transport; Mon, 26 Sep 2022 06:11:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT043.mail.protection.outlook.com (10.13.174.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Mon, 26 Sep 2022 06:11:59 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 26 Sep
 2022 01:11:54 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Sun, 25 Sep
 2022 23:11:26 -0700
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Mon, 26 Sep 2022 01:11:23 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-gpio@vger.kernel.org>
CC:     <git@amd.com>, <devicetree@vger.kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <robh+dt@kernel.org>,
        <brgl@bgdev.pl>, <linus.walleij@linaro.org>
Subject: [PATCH v3 0/2] gpio: pca9570: add slg7xl45106 support
Date:   Mon, 26 Sep 2022 11:41:19 +0530
Message-ID: <20220926061122.13426-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT043:EE_|MN0PR12MB6293:EE_
X-MS-Office365-Filtering-Correlation-Id: a093504a-c46e-41b0-af5c-08da9f8605c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kxy150LRko1Jkv+5+6RDX7qTtXHlwMDFIcYPLg4l6IiugoJE8HnHhSFvp0bskhsKi/zoH/549i/dRePBCH0mJgmKCpstppJkBzAFagZ9j3aiZUe03SsEjnxuhGxvhP0skZhpZcaQDfyBVej+peD/tHQCLVMHEKKVKn09gJ0FBWcEseq1dAxur/XKEy+r94kGMtSRchSplr+TV+ebEAYIfLEpJktbEkmuWZYQl/vkuCUd0AkwtzrxcMKikfjyzCaBpVXgb6fJIs9NTceQgoxHyfeFaK/Gap6iCO4aUs0nDHo3NtGz0dZ6x2MlKphtjE9NFlp4c9i5e8wypZigjF5kX+M6z8k/Q+Lv+Bj5VUCUcMYjaRSw+OQMBMWlyI9JZNVtbyvPmfEWvSDP4zOUJ4SaLzuScgXhuavEc524uCruqsQdh1u4DM9DT2w2aU+DoWRLgN02GxbNOEZzi17L1ZZWzoL9iC+icuO4bdfb+5EsneBGhv6TgdzGFwNLqne+NElmW+2VvmO1ZnlA9lxF/oB9e91F6qWKvZD4NAywygF93nvB0gOe+kEGwF/zFxb4F+hPPffh7o93JagESHpaQAa3vgy/mLixk6Esg8KM9YOYRwfBMZy3Lq8IGIHX54HKKP8l+0WxiOco3awpIk8c1wuUHswTPYS2+vvNtgM65spGwS8PyT5RGnSrbwxOvuE03I06xsA/HypOjkC0qPJYKXD9mI3G2qUj2rGmAi14FNbM3BTe+I7pYdFH5oY5mrWN/uALpNU9Vt7a+wy0nlGUyRZaB8XPQjakhP/0tUSPkw/PANFY9FWj2JG+W6JVu98piNO8
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(376002)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(6666004)(40460700003)(41300700001)(82740400003)(2906002)(478600001)(36860700001)(36756003)(2616005)(5660300002)(26005)(336012)(8936002)(4744005)(186003)(44832011)(1076003)(47076005)(8676002)(316002)(356005)(426003)(86362001)(81166007)(70206006)(82310400005)(70586007)(6916009)(4326008)(54906003)(40480700001)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 06:11:59.5812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a093504a-c46e-41b0-af5c-08da9f8605c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6293
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

Shubhrajyoti Datta (3):
  dt-bindings: gpio: pca9570: Add compatible for slg7xl45106
  gpio: pca9570: add a platform data structure
  gpio: pca9570: add slg7xl45106 support

 .../bindings/gpio/gpio-pca9570.yaml           |  1 +
 drivers/gpio/gpio-pca9570.c                   | 49 ++++++++++++++++---
 2 files changed, 44 insertions(+), 6 deletions(-)

-- 
2.17.1

