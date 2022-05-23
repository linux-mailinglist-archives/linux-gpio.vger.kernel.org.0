Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79160530FAE
	for <lists+linux-gpio@lfdr.de>; Mon, 23 May 2022 15:19:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235917AbiEWNKN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 May 2022 09:10:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235887AbiEWNKM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 May 2022 09:10:12 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2054.outbound.protection.outlook.com [40.107.236.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A70D54039
        for <linux-gpio@vger.kernel.org>; Mon, 23 May 2022 06:10:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AzDOo9p5z5/wdBI+qkhphfaFIrI+09UmixPNcSj/D8NQV2psyFzVVV+KTnwvNe1buLJ//FEYLg2zZ72gTN+oY178JSI3T9PJpt+3ZLjsGX/6kMQfnaqzGpAHtL2vrH1JPWZAGq52bytOJe4XvImd/q2hpyd+hMIKNKoRAI5MHHpoXMD9z3vlZ4UQ1tsIsIHIPZrVmoaJOB9/nqe3fuNESkzAXWaU9/aKA+M5NubBczCJQlmJlPQfOUYE4uheLSHp0wf3kbOZTqaOw11cVglADIZKEd4Q3cibYWA6W7ge5Kqn0y8OH86y31ogZ/H/EfOrmgiVDbZnE7Hak0PiSm6SVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+Ho3esbhtnn1WmbRHTJwbjMe6zERvyO5ERwG+O3/FE=;
 b=CeeIxx8E14L+JZpNE3f8e7sE6GzvMA/7kpgBa0jiXD88Q+zcJfFUfQ5bU9WTXv0g1GWa34c6enFoJrDxQW/fjNJofU41zuJivtLEV7npdsQ9QBaO5SeUZSPXQ+4xi/MWlc9WkZeof8rry8UFyj/IX05ZZCfEVmpO/zQ3ENgQ3oPMpSdFmUjSeVvkURir6xy9nlEdausX97pRWlKJbWLH/I2lD3AbbWLFNJLX7dfOsS916d4mIjmO24/YE2SL8S2j778OBwY05a7dAPL6l7yuYbdZoZfYrGRE6RhhEeEKQpMA4PW9EoFvcr0x0C//5fEuNvQ1oFSx1wJBtdy7zWdzzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h+Ho3esbhtnn1WmbRHTJwbjMe6zERvyO5ERwG+O3/FE=;
 b=QNUKKzIrlBwSA+F4yfJbOO526J2SHvwclCesaxp0pHEXIHdWG8u54/gvqkzv6Ffk24XTX2/ic73Ye/Y322MpoFrDK1HqfbOCC8yNkls/q5ZfsqkhOZTo7p0nSN6ql2sP94eAl7qn1X7j5Y3G12W6sFXxOySCinyPsx7R/xzRjZY=
Received: from MW4PR04CA0373.namprd04.prod.outlook.com (2603:10b6:303:81::18)
 by MN2PR12MB4302.namprd12.prod.outlook.com (2603:10b6:208:1de::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Mon, 23 May
 2022 13:10:07 +0000
Received: from CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:81:cafe::23) by MW4PR04CA0373.outlook.office365.com
 (2603:10b6:303:81::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16 via Frontend
 Transport; Mon, 23 May 2022 13:10:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT038.mail.protection.outlook.com (10.13.174.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Mon, 23 May 2022 13:10:06 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 23 May
 2022 08:10:04 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 0/3] Enhancements to AMD pinctrl and implementation of AMD pinmux  
Date:   Mon, 23 May 2022 18:39:41 +0530
Message-ID: <20220523130944.473416-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c035cf7b-ac70-4b72-720c-08da3cbd8efc
X-MS-TrafficTypeDiagnostic: MN2PR12MB4302:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB43021F789C9295A04472D7FDE6D49@MN2PR12MB4302.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D7beMG7HdDMxb1BXSqf3YyNxGvMneIoDJFzTIW2Lnv5cdpKBAWg/gml7HEPdrgA3iBdxNKMM3O8OhL4ksL8gIgjsX/vqGYhE6UeqnfGJnYK4JLs/HOVBnk2vf5EQOWlJvl38JmwiAjGiVfoFSfRWgRjYHiSXkzy2RlxcIlqLfVNN//W8n9V6xcfuNNUi+mg9WXRpTRHkQ3gfXEa2p7ipUjsHuFL52D0JTkNvHami9LGxMWDWLpkPRMVHEl4WrF6Bd5na9qBuWNEuN6uGWiq0harx4ol4a+Dh2z5/Ooek9rsPEepPaWqSlZ1yL3Xo1UC1XYo2PY7IfYYdnhUIJwWyKiVlTX0NaZUZZuQvpcV4vo+Br7J42++nhSMkfHzElM6Bpwel/qMgTbRk9LOLdlxp/6OmQwd/BDEmhk09Wg75TzCgl46Y6GVu0knxko0c8bT3YieWTEpF+riQs25S5PHdeOW9bD2bhn6aA6kWT856B1gjfY6i97GFn6xgxErwHfU4IOy2hkhEs2QBzDnLkrvvA+hxyIr0IW2zAOpE0nCOA+KsXr31g880qQuNyT3gu1PI91KCQZEvGj6TkYTdRgVlu/YNQhjCJ7FsZUuE3y9ZZyN8bBenVqGarR9+SOA1hAsPhA/p7pHDTjrEIpG9fKfXoP3IKIBkeW/tgPCoaDBA+ld0nZF2BapEm7BwC1Gdn0SQ9pzqdBaxIZe9nqAJdFSJVbrcCCWcAdbK63X6BsNxRLs=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(6666004)(7696005)(426003)(47076005)(2616005)(1076003)(86362001)(16526019)(186003)(336012)(356005)(81166007)(36860700001)(83380400001)(40460700003)(82310400005)(110136005)(316002)(4326008)(8676002)(5660300002)(4744005)(36756003)(70586007)(70206006)(8936002)(508600001)(26005)(2906002)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 13:10:06.8616
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c035cf7b-ac70-4b72-720c-08da3cbd8efc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4302
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Changes include enhancements to pinctrl-amd and implementing
AMD pinmux functionalities.

Basavaraj Natikar (3):
  pinctrl: amd: Define and use PINCTRL_GRP
  pinctrl: amd: Get and update IOMUX details
  pinctrl: amd: Implement pinmux functionality

 drivers/pinctrl/pinctrl-amd.c |  144 +++++
 drivers/pinctrl/pinctrl-amd.h | 1081 ++++++++++++++++++++++++++++++++-
 2 files changed, 1194 insertions(+), 31 deletions(-)

-- 
2.25.1

