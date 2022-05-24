Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A166D532441
	for <lists+linux-gpio@lfdr.de>; Tue, 24 May 2022 09:40:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231964AbiEXHkk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 May 2022 03:40:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231262AbiEXHki (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 May 2022 03:40:38 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E74A16FD26
        for <linux-gpio@vger.kernel.org>; Tue, 24 May 2022 00:40:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AuawJgfdVEcNCa1JHAoClWMYm979hDxJYweN6cb1Yza5kZ/5wH1bYO01UW9h58/sxXuEnrY9RLFQiPKUEdjQMs2+kB4fXpn3SddO4Ti2LnPpZswoLyOPr4TTLL9dQAsMEe7qwqVhO1buskmq2JFWjpnMmV9BLhr4W7WfkqyCZ8NhcYR+L6QdQQU6FCWTGHyyfgS+8V9tRNkaVr+RlLGC2OHwzNregRGTSsGjvjvawvNaYKHmfNpvcTh627jbaRCdbBQVwU6rt2H0gWcKKPkKSAhpKKouywICUURtrYsHKWthu+nEixDndSJg7B3qdOHSJ11DcpDgHAJl+8qg2DXWUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmqPslMqx13IhCkGxRK4AVcPHecRydOoTIB8LtS06/g=;
 b=Yg1ZHxh8mLwR5ZlGmNbk2NSXWNf1xQfjroxJv/O7OD2Zzsw8KJHXQGXSpQ0nOxRnzeOS2r50DUctETeWClEy7jsVo9wEbpaIg5b/bUlT5iB8TF5DxIRxeHDEYdkrjZpTo64wnYy1AW4y8uogrTfA4yO5197q/TM//FQ+5wzvDHII5y9H/4w924tuY16KP9eoWBlytVlF2UmHCrBq/vivu3LyrapqYJ7yrRCpLb9ijAczijEVmTUVkMxW69Mujoqbky+g++YO2CgRVV49I3YCSzET5GxyXe5ebPaplaQbsTtXz0OFeYZGYvMdM6wp3eaFdVSCktFdWcqGS4hrI60+rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmqPslMqx13IhCkGxRK4AVcPHecRydOoTIB8LtS06/g=;
 b=JMPaC9m+ihnnc9B5sCyyCEiQr8FZ/Vqyb7j7ndsF8o6pxAVvIg08wSQmcy1Rp9lez0HlX4bzSK4+QQ7nfN6vctTEeWt5F3cEAWCJAN7P+/JyU3tKr4FZzND5ZBACP+baOOkWSMrN9REhL525BG8a8NJpQybArnDCyOPc9M9hC0c=
Received: from CO2PR05CA0075.namprd05.prod.outlook.com (2603:10b6:102:2::43)
 by DM6PR12MB3481.namprd12.prod.outlook.com (2603:10b6:5:11a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 07:40:34 +0000
Received: from CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:102:2:cafe::b5) by CO2PR05CA0075.outlook.office365.com
 (2603:10b6:102:2::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.22 via Frontend
 Transport; Tue, 24 May 2022 07:40:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT050.mail.protection.outlook.com (10.13.174.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Tue, 24 May 2022 07:40:33 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 24 May
 2022 02:40:31 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v2 0/3] Enhancements to AMD pinctrl and implementation of AMD pinmux 
Date:   Tue, 24 May 2022 13:10:04 +0530
Message-ID: <20220524074007.2792445-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be875013-70dd-42c9-3677-08da3d58af77
X-MS-TrafficTypeDiagnostic: DM6PR12MB3481:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB3481F491D96A39406261E435E6D79@DM6PR12MB3481.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KpDDnboGI2tCBxEebKLJbRcQ2FIYYHLEu51gdxdWk5OqgAFw+KXwHBCvxe54UkvXzE3gjFjty/o1gP3z2B7v6GqiDcFe+/ML4RiTtQMcfK1flC41/BAgAX6dSpuyls7mP1dSnIWf/+biEhs+K0KPd8Zc+ts23OgipGzFVTH1CwtV4hYhF0VJi9aKQK5JVsH62c+CQJNz+r3IBHO1j/tiqA3TovNChEFKRrJ4NY7U/FYFCaDgmWS6oMFimrHReLkpoPDxmIv5iV2DAnuIdf7S50dBbGZjQJBT00DffttsI+h7POuPzGNChFcMp53+ZNPKSEOogKyfBYIDfs9QFkL208BT6drw5VYUE+O582Uft5uki0pfEGSPXetrR93lDsKmID00uKP2WG1jFmZM2DLbR/0uR1e6ERIHqZZyij4mR8Y+7Ih6bGn2n0RJI0euNffsn5PJjY309qD8HCxcJe2GdRlZtA4a/Mk/AWOWEBbWmEHUvhy/YLAVC904H3pwWrUF4UmtgibuUEHQwGHl8p+VwVsj9J3ljQS4rewe46xfCRcxkwhglKShDEbZuLUp5RxGrOH+LeRCMqvF4AFaiQ5nTmyYk6nNR9Gidratk/5vKFVmfCCsg6yx9yhA7TimZY6MmnOq5PfBApfArbx/mWwuls5wybztP5NxXH8UBUmcbecWGlZmXf1GF8Oodf39WhTOiLOrU69HVkzZ0zJvzR6dTAWSog+FwUhOZDyN35c8St31FCCKzkYZYbXHlpV0f9jN7YTxt5H6/SYiJB7TA4UFKjMS7ypb41qOwCgASx4tftqewkDjfwA/76OZvOLicctI
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(36756003)(81166007)(1076003)(316002)(36860700001)(2906002)(356005)(110136005)(7696005)(82310400005)(26005)(16526019)(4743002)(4744005)(6666004)(508600001)(47076005)(83380400001)(86362001)(70206006)(70586007)(8676002)(4326008)(186003)(5660300002)(966005)(2616005)(8936002)(336012)(426003)(40460700003)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 07:40:33.4713
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be875013-70dd-42c9-3677-08da3d58af77
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3481
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

v2:
        - Fix for initializer element is not a compile-time constant
          on riscv architecture reported by kernel test robot
          <lkp@intel.com>.

Link: https://lore.kernel.org/all/202205240107.bryIFhOh-lkp@intel.com/

Basavaraj Natikar (3):
  pinctrl: amd: Define and use PINCTRL_GRP
  pinctrl: amd: Get and update IOMUX details
  pinctrl: amd: Implement pinmux functionality

 drivers/pinctrl/pinctrl-amd.c |  144 +++++
 drivers/pinctrl/pinctrl-amd.h | 1079 ++++++++++++++++++++++++++++++++-
 2 files changed, 1192 insertions(+), 31 deletions(-)

-- 
2.25.1

