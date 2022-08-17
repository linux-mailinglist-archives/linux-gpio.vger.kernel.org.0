Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DE47596BBC
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Aug 2022 10:56:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233858AbiHQI4D (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Aug 2022 04:56:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbiHQI4C (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Aug 2022 04:56:02 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16F307FFAB;
        Wed, 17 Aug 2022 01:56:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTf62n1aw6Z6zuMfM8knU2l/nwsMNdGQB4qVBAiUjHKlj7Q2w+RvsG82UZ1rcawg2SnklMoSohWnhBQQ6bcP5eFpl2HPqyBDnSiXxIUiJDRoOqdcLQ2Td9HWgic8ssO5pQle12AyCmKOEBUsIN/a2F7F6JljqPr+udr3WWwJn0f04HbIKOW08m/5WtLUdj+8DCMjUIm1i+4zleFSJzCTGhbCB89qxK2rYmAbI7Z8mwdPEqIaSUj8xO+agNjsypyOiM1CVcAfp0BvnuJfMQa3lbt1ImEOaBAglPpTe7AjXWmrDbeY8WEGq9YUYgVOzSdZ+I0B+goMb8T/oVbGhNwj3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hRhbEhpQrQGg4kRiU8T9zT5lQOrLvQ9qJxORqiC6kKY=;
 b=NqVP/YNKNwPPsvYKzNsNb4GjJCTz63OcuMNhUYyTeNaT9k1wBExWIqZWeI1apAAcWTUQ0jizzHVo8twOv7ltuFytCAhUOoE8IGvcMyypfM4nkEegoxDZAdTb78+kCFVRq3K5kSNMEXCHmV4nQFE90WFsMUkugCkFQVMOdEpnC1CaC6jSMStCrjeHrTG+Xcbc/TpY0ncpn96lfjrTDTxuKu4npc3QX+5twQc8LwqOeR+hVbZldFkDjRaWjtxrGVqNUZ2AfJRB0wGB+ytW8UwIq/uPX+/0dXJpwmQg7rIbuLtDdxN9SESCzs55n0orUsZ5yjLcv9FRj8RU3oy2BwI2tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRhbEhpQrQGg4kRiU8T9zT5lQOrLvQ9qJxORqiC6kKY=;
 b=p2lrs9yQsOsF8hcQXZVntEEzZGMKWHN1+fKKMBt2E/j0I7rPNfLcl4PPrCUsku6vudWUgHFYyUPgGAf3nmgVOBHDTReVO03sfhKagZe0mGHpCO2W4PHkZbO3OiH+9cOXhBA3Aq6C3tvner8areX4H2DaItam6h6OnCimNdSAI3k=
Received: from DS7PR03CA0191.namprd03.prod.outlook.com (2603:10b6:5:3b6::16)
 by MN2PR12MB3903.namprd12.prod.outlook.com (2603:10b6:208:15a::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Wed, 17 Aug
 2022 08:55:58 +0000
Received: from DM6NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b6:cafe::b1) by DS7PR03CA0191.outlook.office365.com
 (2603:10b6:5:3b6::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10 via Frontend
 Transport; Wed, 17 Aug 2022 08:55:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT009.mail.protection.outlook.com (10.13.173.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.15 via Frontend Transport; Wed, 17 Aug 2022 08:55:58 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 17 Aug
 2022 03:55:57 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 17 Aug
 2022 03:55:55 -0500
Received: from xhdlakshmis40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Wed, 17 Aug 2022 03:55:52 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-gpio@vger.kernel.org>
CC:     <git-dev@amd.com>, <mans0n@gorani.run>,
        <devicetree@vger.kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <robh+dt@kernel.org>, <linus.walleij@linaro.org>, <brgl@bgdev.pl>,
        <shubhrajyoti.datta@gmail.com>
Subject: [PATCH 0/2] gpio: pca9570: add slg7xl45106 support
Date:   Wed, 17 Aug 2022 14:25:48 +0530
Message-ID: <20220817085550.18887-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c168a9fb-7f3a-4b0c-aa7e-08da802e4d92
X-MS-TrafficTypeDiagnostic: MN2PR12MB3903:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k3U6qR6ziP7e/X1uZgJOD+lIo3LZd87FaMpe57RComE355ZWQNPIyvfnYKFJ7BFX1RrMtVWOJWAlkhlZpAGQKjN5oyaWq7jlciuX51gdT3RiyyXEJ/7u+UorS7a3wDPzupokGNhFBkbvco6wi7wgcAqvyqySpkSzdQpWDKplU3eeESagZDmWIHTlEAVhQmDLkB/35oCUy6K2IdgKiZ04tYRddocARwEA0J7zhte6kXoS0PfUz6cDW/JTUfkIUMGOkHALaRjFAZYfjB10K60P3gwaNUBLfd30+QCI1Eml5Jr7ThwxStEH8wK7+9uDhThYp4NwN/vxwaOISIhMtizV9xK1GpyGeHYx21BIAvxdCLs8sQC2qlfEIx1kxXkcambaSl/DQOpCNKHizndGV/PMqnEwrv3fXRh1llYvO9/NfUZlwgVVg22Djbbmmj6JjO60RuM8QewfNz9h9csE6CGKVJ2XpkBQjCdoMGJcnEk3ZPYDhtP5j7mXQZxlWCgKHYcSfLkTNjmAotzTFyJ4yDnjrOoCTkaelaqxt+TL5x+ZynrULh+xO7stnx0spy2KsE72ElbfBJfaW047sVFk013tj/b+8vqKU5vNisVTn0m+ix7WAp1b15dzAavaQNJD2veTOtQihh5/WtgFksvhf9VL9Xw3e+OYLLY3M49z9V/s1UIcTbCqn6sboS7AGj5XZTYLqB1qQsgbZLgdTlLqHxGPC5UVQCoV4Jj7o80HcTbROuH1wtnqqOGW37/f09Mn/cCjE0DiJ1Nqmn4JYbPhWPSTG9FDbQ02KCo5wtbvH+FA9Kd2EImSfaHRwE0rkt5xQLfEkKbxEfk7FQ+E2JB4/WbWkQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(136003)(39860400002)(346002)(46966006)(40470700004)(36840700001)(2616005)(426003)(336012)(316002)(47076005)(44832011)(8936002)(6916009)(186003)(86362001)(5660300002)(1076003)(40460700003)(4744005)(36860700001)(83380400001)(40480700001)(54906003)(2906002)(70206006)(81166007)(70586007)(82740400003)(4326008)(356005)(478600001)(8676002)(6666004)(41300700001)(82310400005)(26005)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 08:55:58.3717
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c168a9fb-7f3a-4b0c-aa7e-08da802e4d92
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3903
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add SLG7XL45106 GPO expander support

Shubhrajyoti Datta (2):
  dt-bindings: gpio: pca9570: Add compatible for slg7xl45106
  gpio: pca9570: add slg7xl45106 support

 .../devicetree/bindings/gpio/gpio-pca9570.yaml     |  1 +
 drivers/gpio/gpio-pca9570.c                        | 14 +++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

-- 
2.17.1

