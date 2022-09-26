Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95B385E9950
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Sep 2022 08:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233095AbiIZGNo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Sep 2022 02:13:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233314AbiIZGNe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Sep 2022 02:13:34 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D599B31235;
        Sun, 25 Sep 2022 23:13:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i4QUoRZOnNaf8gZkFcSeLuUDSBLeIxVn2mnKZB/jPff7qaGUWYdBxxZV3W4oztW45LRpVuSQjxfB2grIA6+LRqbOHvRq2uEy407STlFQ1rckQtpWHmmZ7d85rMd2IycnGJiO6xVlWAVGRISdMOXaTX+XKpTZKNrSs2u6a7pnyxVte5w9aouy9KLhtnfVjDy48qLZ6VVaP0eO8IZM6mh1j2zQo2EcPbZIftsrPpajABL+/PduTKqZ7458Ooh3iGCEij7OEDvVa7gcFUrVmqwF38UxYbYopbm0nJHfu3ccBiOF1xyoGL8xEAKD07pie5YFHPCIueVkE5hTzk11WinL1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v9BBzoJOFSKuwBAOKgEhxQBZ4rkPF2OSeX64urUKvSs=;
 b=fGVhQiQ4J9blpIw2k69ZGI5n/xrlQ7mg4zd+ZOLVU0SvuoHKp/BQANICgD+dytKz37Y1ByejSoc8XADi3mUegMsJNqza3mpTR2nYeBLSMBZTtwchI/rHscHjc8fBPDyqOC55KBCI4bwoHBQS0IukmDCQwxskINaBSZNKzgp2xrsAF3e4+tiJWv7JAPd0RSnnJfQ7h0tiqZ4s1k4Wp0As4U2V+0b9zKcMw1BmmPD3SuZvU6lgy2lanyWjKB1igKBvxvvZpG7rCU2HEbcU/l9TwsvL3rELQmcvbMd7L59747nMHNyqdLCSRfpjwJQPittwdhA6Fi7WdDYgVJMphgjjVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9BBzoJOFSKuwBAOKgEhxQBZ4rkPF2OSeX64urUKvSs=;
 b=C9Cqp5Rxm6GgV6TjMfFUGpNVhzmxC9cHHjZApVkyLn4YPH7APX9z62NXnDv9X/dl4tA2yqZv993bcEO1v+0hxBRqA19YsPrc9/RfLXN6yxVNgAQg/ns1uLpTqWqZzQ/guXCN15ftawA2GW5/BE7+KYMtpg9agut2paOYFgL3GvM=
Received: from MW4PR04CA0086.namprd04.prod.outlook.com (2603:10b6:303:6b::31)
 by IA1PR12MB7662.namprd12.prod.outlook.com (2603:10b6:208:425::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 06:13:28 +0000
Received: from CO1NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6b:cafe::2a) by MW4PR04CA0086.outlook.office365.com
 (2603:10b6:303:6b::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25 via Frontend
 Transport; Mon, 26 Sep 2022 06:13:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT006.mail.protection.outlook.com (10.13.174.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Mon, 26 Sep 2022 06:13:28 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 26 Sep
 2022 01:13:19 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Mon, 26 Sep 2022 01:13:00 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-gpio@vger.kernel.org>
CC:     <git@amd.com>, <devicetree@vger.kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <robh+dt@kernel.org>,
        <brgl@bgdev.pl>, <linus.walleij@linaro.org>
Subject: [PATCH v3 0/2] gpio: pca9570: add slg7xl45106 support
Date:   Mon, 26 Sep 2022 11:42:56 +0530
Message-ID: <20220926061259.13491-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT006:EE_|IA1PR12MB7662:EE_
X-MS-Office365-Filtering-Correlation-Id: ceb13699-ea8e-4b56-4df2-08da9f863ab0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sccVuHkMGgy7O7G+ukqMeMJdDkRxelnJSqb01Y0Jcb0B+cw4TtNua/efhAH6h1Nd5DC67c63/aQEG8zeK8DeXMeasZWvGzFuDOvQKByNZuhTJYWTdO5FO4ilbYTFF5Rsn0oXH9JK3m43pgoIA1ywEOyj+vWvfnkAspS2ebOtgBxLAIL0SQ92W4fLfmTDFbDWBgT9kEfOOmLIeOxaZHCKkRw4chNCaAMinjg1CCwcJezK1keMH4YaYf4YaWAd++cdyBdTIoUVaAeN6UifZeQVUNMzMpZY9NCpc9hbj2hWI+9S6ERD+uiQPDqTn66M/JtKQhMIpl7HJwlspgV32D7bYElAz3vdsbSXBqMYtDBoY1w4rZipMPDwlfI4nGkjVYA5C5LsmSqnnO9Gosl3ZJD18T08+Ng870T2hIcT4Yrpqm7sbWef7LOOO8PngRWBQiXfvB3+QadtKtlYi2Q52o7gFwS+0di7084DAuZqw8y0WsZ5Xc1XxQPf/zCqZ5xaVrSejbRaqZaMI0RDhwfRwKKdjii9fWmze/7LoAwym0sSnWdBzlXBsM6zfmQqx3kIzertgJgOqgUBU1pk1wtnAzFXt6DKo0Ar0Z0NN8ivr4b9H2bZgL86LAkuwy6Myn7j/6iclVp8JlUqSyAbJPlnypwqmPZMW/iGSWZvu3aJjf+Nxdgq6MfxPAxkBgXu4zeR524GSG1UrwbBfv9MSmS1oQcvQhE2nxRQls9j+W64TyST9f5KWYlZjXjnFP3XQYSRed+IJfHerUG22jmcCwI11HObG9DdMZpAnl501SV7Jq3r49rOqEdi4wZ8CqKnHWJSs8OQ
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199015)(46966006)(40470700004)(36840700001)(2616005)(47076005)(83380400001)(426003)(186003)(336012)(1076003)(81166007)(356005)(82740400003)(36860700001)(5660300002)(4744005)(2906002)(8936002)(40480700001)(40460700003)(82310400005)(478600001)(41300700001)(26005)(6666004)(4326008)(8676002)(44832011)(70586007)(70206006)(316002)(6916009)(54906003)(36756003)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 06:13:28.3538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ceb13699-ea8e-4b56-4df2-08da9f863ab0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7662
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

