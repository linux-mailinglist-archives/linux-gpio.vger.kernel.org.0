Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EFAA547FAF
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jun 2022 08:44:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233743AbiFMGnh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jun 2022 02:43:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237588AbiFMGnV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jun 2022 02:43:21 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2047.outbound.protection.outlook.com [40.107.244.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 539DD101FA
        for <linux-gpio@vger.kernel.org>; Sun, 12 Jun 2022 23:43:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RWmn/XKCuVCL7I63eCvSoc5+TLQh/fHWnxEI4T6Dv824xJgh6ZjyjVw5AZFzTTGzHufm0VpyF6ayZ6VztQ99Mn8p4AFNCgf8XGniyUI2KFY21qWi48HIxuEmC4pR1p5Jx7tacx/g4JKVL+i0+RjqG8L7zZw6X8O7f/GRSjDaO7OQkgWQgGKpm77MnNIlfaYn/RqqknY6MHZGjVbxN6iubGtaW3+Vuc0c54sHGSEqI/bY2LW0OoMubaU+eI9Y5REH+3p+4poI6I7d00N7eiAchxqXZs4adbRMTmRXZ9qmmDxotXBRmBBVL6Lhf6V9aLiFNiYKQ2/R/ubI8QOF3lOd4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUxAKRCJkMJUkqHTNTIlx3Q02et+RaffajMptbl5LUo=;
 b=HwAo5jwLnCfitW9F7bWv9RclnmUBRAlslsAniodIxNXbq7KaBNtMBDCE/PsQpl7a96MjwYfcT93lM49gAUxuA79vXXQnPHReEHgA/odVO/uzRjLkq7ji+bsBSSg3EcdlheT71dYyDc7U9soKHjdL+9wMFGe4YCAcX1Rs9uachpD0F8PnhJZ5lkvCwlh5TajS09CsNur1ZY0UO6InFv6jxCe79p90khANBlvKZs82CY2Vl53zsELDVNh42wizw06PgnUOpP8tVy1YQSo1HsgPSRvBI3W8KnGqN6Tz24zpLY6kkOUsd8Af8Eoigxd1XMXPe8lIBo0znBqNwVAZaVx3zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUxAKRCJkMJUkqHTNTIlx3Q02et+RaffajMptbl5LUo=;
 b=wEFusVITRC1y85bxTOMOnNB3AevUbM2tBZYsCk8SiKpCWzj+/MbJkA70/TvCypTbPifVdVHh52GAvA5CLWC/uK8ZwEo92Qq7zB5f26KPLgL2Op3FDOgqyhLmP7bBedcEuRY3kRwwML40G70DCJ7RFgZBb1bNC3Rkvh0/jvlQfIg=
Received: from BN9PR03CA0287.namprd03.prod.outlook.com (2603:10b6:408:f5::22)
 by MN2PR12MB3888.namprd12.prod.outlook.com (2603:10b6:208:162::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Mon, 13 Jun
 2022 06:43:15 +0000
Received: from BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f5:cafe::90) by BN9PR03CA0287.outlook.office365.com
 (2603:10b6:408:f5::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13 via Frontend
 Transport; Mon, 13 Jun 2022 06:43:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT022.mail.protection.outlook.com (10.13.176.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5332.12 via Frontend Transport; Mon, 13 Jun 2022 06:43:15 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 13 Jun
 2022 01:43:13 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
        <Shyam-sundar.S-k@amd.com>
CC:     <mario.limonciello@amd.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 0/3] Fixes and updates to pinctrl-amd
Date:   Mon, 13 Jun 2022 12:11:24 +0530
Message-ID: <20220613064127.220416-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1813ba44-94fb-4698-a56f-08da4d07fe75
X-MS-TrafficTypeDiagnostic: MN2PR12MB3888:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB388808BFF1738DBA11F114CFE6AB9@MN2PR12MB3888.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8y5ONLBVtKGzX3nBkuZllI8T51im98IQpF3ZIhtbYlRY9E8nUBKPyeAXihWZ7dDSX378dDqW58xtTSKwUCUebD3EuMqFM7PpyfauKSGSdMCKNZSeKEatibiHFL22fAGdG+bGe9c1yMsAVjg9BiDPAkbx8VLWeOeZrDAP6Cs78vsGvZu5NbIUaxFZHNjuSKlpmIS3qp094Ar/JyeInbMRMf8r1FIsbBBTDtKQbzhOnZKCfDiygST+8rqGQHH+ZUxiYSyCPbSKS32wli+MR65CkgXaPDggHvzP/9vGO86ibYjWLnOkUwAg4ekAQMUy3gSQOKoOqxRS90TKdukCiOWDixQNqn6iv9HyItD8PKy1QRz4HKoG5qyj1TcKHsDWeCoJi09RxWgvuFFaNtOs7lkc6ZzMZ6wswl/1s6ZV+QFR/6Iysnb5SNbvu4BhxwCXa8frPS751/IBUPvOXHT9FXfiUFpMoAZZ+WWKfpHOL0VDgxpBFprgEb/RJBretilnML6FKel61V+fhy12vBcK+WsO9G5l5Z7jodTFwuehuqseZXDMsivyb7Io41c/x1/OT6ManldNFAh+/Phd9w9ZYz/fYuIOgcWifPYPkd7GqGa//VUsfYnKiFuuIB3zWvT3v+SDOlGfikA6NEP5sGZ41g5EBlJiwaoDxDm9YgimqKZBMljldGrIo27WmXZ5A9KPkoBW2QRXZ+1dYErsgXvhF8caER0nOkNIDbsigglOdxZ58SE=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(36840700001)(46966006)(40470700004)(2906002)(4744005)(70206006)(16526019)(70586007)(47076005)(186003)(4326008)(110136005)(54906003)(36756003)(5660300002)(8676002)(508600001)(6636002)(2616005)(426003)(83380400001)(40460700003)(36860700001)(86362001)(7696005)(82310400005)(6666004)(356005)(316002)(26005)(8936002)(81166007)(336012)(1076003)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 06:43:15.4173
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1813ba44-94fb-4698-a56f-08da4d07fe75
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3888
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Changes include use of devm_platform_get_and_ioremap_resource,
save/restore pending irq bits and removing of
contact information.

Basavaraj Natikar (3):
  pinctrl: amd: Use devm_platform_get_and_ioremap_resource
  pinctrl: amd: Don't save/restore interrupt status and wake status bits
  pinctrl: amd: Remove contact information

 drivers/pinctrl/pinctrl-amd.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

-- 
2.25.1

