Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49229538D13
	for <lists+linux-gpio@lfdr.de>; Tue, 31 May 2022 10:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232246AbiEaInv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 May 2022 04:43:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238352AbiEaInt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 May 2022 04:43:49 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 784C86004E
        for <linux-gpio@vger.kernel.org>; Tue, 31 May 2022 01:43:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kNxIREBfjVB9DqILmkQMaKxpEOrf3GFYz4t8tj6qLoBxWw7ISn1CCLjhj2aKEHUvK/gEfccRTAEgsf8hzU7Dou5KSGi4Q2XlaVl3uQHNqJZbkl9MUYV3mg3jkcqI8x8sTV1qQwfxu+OOiU4WJgKR+9VtxPkbeVZP6rvoULU+u5k+TuuG9WJYTNmI2wYG6AAmm8D7RUljBgbWJfJgKtanyjUh0KkEmdzqKVBdi34q9l7p0RNRsCIJudJoQuFj4pzO/5gHkqi7pSIbuoPLeT7Cy/jtR0LOUA9/8zS6M+xohiEACtjDSVs16dHfnH39Q98EXc0pzU3F8cP6tkq58W4XZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=clvNKWhc/7/DKdhgShgJcD+VERIvkM39xH9vINI0xW0=;
 b=ic8pu0Mk2Lh6y1P0kvdNdoBxjjancA914dvKXz/Ve4NYfdaVvX45jV3BeOF2wbesQh0HXj5GEWgyrVwsgZj/tKCX9WVmoFdcZNNnL/4eD3qofQ/ithLJDa1rYWte7UAxcfbXs0gW+ntG5hDQtzSEaCduN+CuUk7gbPRMRJPAjfvgwRrUehQDgY96KN/JYiJ7XEaT2BnlDTD8CKxLn1tisYrRAf7VSNJ+dZRkSFnhLC2tL5j/Le1yIXBzFERIO+3WKdQar/Lp69kUE1gRVs1xL0XLijAT3Ibc5T+ATzj7NYUKOJwHsWaOJYZZWFxvNpN6rWi3AFT2hus0lsLXNyHLHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=clvNKWhc/7/DKdhgShgJcD+VERIvkM39xH9vINI0xW0=;
 b=jblu5kKfe0ygYwgbPvSNc2sEbA3zGHpI0mWnhIX7mh1lw7/wlMt9sl5SAAeJ/BlMc96jP2mKrzu7XOuHhL4pU3z7dnPqgzNZdeetQOT78QdrD5rsLRIo5i8/rEftkGNIC0zjj6du9E4mxxqp51uGD/HIDg8MgXCUtUgP7L8PNb8=
Received: from DM5PR06CA0090.namprd06.prod.outlook.com (2603:10b6:3:4::28) by
 BN6PR12MB1828.namprd12.prod.outlook.com (2603:10b6:404:108::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13; Tue, 31 May 2022 08:43:46 +0000
Received: from DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:4:cafe::af) by DM5PR06CA0090.outlook.office365.com
 (2603:10b6:3:4::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12 via Frontend
 Transport; Tue, 31 May 2022 08:43:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT055.mail.protection.outlook.com (10.13.173.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Tue, 31 May 2022 08:43:46 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 31 May
 2022 03:43:40 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <mika.westerberg@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v3 0/6] Enhancements to AMD pinctrl and implementation of AMD pinmux
Date:   Tue, 31 May 2022 14:13:16 +0530
Message-ID: <20220531084322.1310250-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6bd204c-d71a-44a2-b973-08da42e1ace1
X-MS-TrafficTypeDiagnostic: BN6PR12MB1828:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB1828BD84A1873B7F241801B4E6DC9@BN6PR12MB1828.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SNv6URMWFEWvJ4EV3/NUGwUym6UtENWaVpzdkNeBdUqkdc2TaZYSVi6S8CXZbMJfuSvhgup15AHwxlDBegnSO67ISrZOe+jlSt1kPeMVRSvTuGsWRoNShYC0JmY8BB8YbPDIvriyHTZmypCKahUDd3P/9TPurhHb3UIq+NARpW5aJMLpS+2WS6mlJaffAUyqscKievhTm/jiINMSmINe4vikcWwIy42kq45tPp2sypObi8Yt1Nlt0ua5S/eYno4z2GhM/mglYG5I1wvCqlOHM17EwZwybMKjsqb53muNArM7BxEpnln4u7/5cN0B8nhRhHhMvOXiFa6KxYclFLdIiL4d0RuNVX+BrXT/B2Z3Tqi//V/4g4qlfd02lw9A7nFoK7vJHJI3nMQMIwDkEroqrCassCdqI7JPLy+96fimEMOiKuZJ0JQytIjuCn5BmfWT5bslOH9E34CaqELfv4y74f8gtiQMeNiaJnO6FLNusDMpIgNHUwTavZe3K9LJlWamN3MBVMRUnml4zTrcau7AyPGlt9NXg9FgMSitXzShK0n1EorIbqhuVdodMdMErrKGOKDm0Y79UXOELaPI5WdFgEMAMBVwjq557BDkXuR+T4P9ISDyO0xGww1tfR3tc/VVI8XJfurcIojUbt5pgVSRVpJ4Rf7o+ZcPjegu9XjO315n0yJHUlyxPZav3RUKYLd7BxMueyvkj6GVy13wKR1k9k59tRmnVQtChvljzmzG7M4TSar/l1j0+Ad9wp4VcDpCf04D6Op7VIIPlsteI66BT9axI360RR1xBUI12VHiKA5T1/jIqiV/R5IQ/0aNM0Av
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(356005)(186003)(16526019)(86362001)(81166007)(966005)(26005)(1076003)(7696005)(4744005)(316002)(47076005)(8936002)(336012)(82310400005)(426003)(40460700003)(110136005)(508600001)(36756003)(4326008)(8676002)(36860700001)(2906002)(70206006)(83380400001)(5660300002)(6666004)(70586007)(2616005)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 08:43:46.0801
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6bd204c-d71a-44a2-b973-08da42e1ace1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1828
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

v3:
        - change amd_pingroup to pingroup and moved to pinctrl.h.
        - Add prefix AMD_ at appropriate places.
        - use _DSD property to get iomux resource.

v2:
        - Fix for initializer element is not a compile-time constant
          on riscv architecture reported by kernel test robot
          <lkp@intel.com>.

Link: https://lore.kernel.org/all/202205240107.bryIFhOh-lkp@intel.com/

Basavaraj Natikar (6):
  pinctrl: Add pingroup and define PINCTRL_GRP
  pinctrl: amd: Remove amd_pingroup and use pingroup
  pinctrl: amd: Use PINCTRL_GRP to manage pingroups
  pinctrl: amd: Define and use AMD_PINS macro
  pinctrl: amd: Add amd_get_iomux_res function
  pinctrl: amd: Implement pinmux functionality

 drivers/pinctrl/pinctrl-amd.c   |  112 +++
 drivers/pinctrl/pinctrl-amd.h   | 1374 ++++++++++++++++++++++++++++++-
 include/linux/pinctrl/pinctrl.h |   20 +
 3 files changed, 1462 insertions(+), 44 deletions(-)

-- 
2.25.1

