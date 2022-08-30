Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F40655A614B
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Aug 2022 13:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbiH3LFy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Aug 2022 07:05:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbiH3LFx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Aug 2022 07:05:53 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2AA9AA3E1
        for <linux-gpio@vger.kernel.org>; Tue, 30 Aug 2022 04:05:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZmY6EM9svzkyCHcoiHoteh6GoAy9iz3Emt3I5B1ceGz/02Q2DZu4BpLKXIUcPehMHzigSlCCbv0isSa89MGpfXsNZw2vNWIcusQuWH9PvMmMjRSfsh8g/JuO4m6CsYgFBmmctowvyaAt6jXAoWYIoTvQWtygDj9IbBceW36DjzawV0uPOqPxsasSdSFOQgANgWfkbPzMcuCnI8sYjO6f4qj0lh/2V9OeCQXyxpvYfOmFCqhkOuICSolK4TKaVxllDYCfpkN+kvuK6AFCMDup2u+IuHdM3w5ixoZRrJJqSSZlgKoUqd3wGjmmyEeApWPyUUDzwPLNj4nMM0cnpJq8ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wruM3Alz15cuOCrCYPASsW4hwnhGFU35r4yeMuXV9hw=;
 b=hTMlu7bO9o7hL5w8ABYQSHTuHg2Eldr50do7yPjev/BNHD00G1XEstIdo9w4vwzrjLsBpLZzN4udCJGAa38CVYM1RAfCvqIVRwsjCw6Hfq71RfNNn8D5nsjArPaWm39FRrVccCenXzn2i/Hcl2RhOD/nfL8MNKnnk7KdQQyI4IcEnF1MbP0+kLBBZoZv/XySAdlRV4zuHDVTw2bxFE5bb2x7CiVk7LA+RYkVEQhKh9qC9sDTL7OtGD1Ri54s2A4VLoj8WrxiTTli4iqJ8K6P0k9OBgidoOaYKXrRY49Avuzcl6smExouka6cNf/tPeMjtMUMkbcvce0OdLleby8+pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wruM3Alz15cuOCrCYPASsW4hwnhGFU35r4yeMuXV9hw=;
 b=2MQv2ZoqJXdZFiZRDd4nMQ1MZihZPtynTIF7LhlWy8h86a6irZSwoCZepHH4e9hwUX3Vl41ZUq781DTYSoggbP6RsX2GXEbNQiUBxDIh1v731XorPEIRWGyMvdcSNTjE2egjkvMT0fljW6B9CAlYQGAll2RdP1/UxQySFYrN/Pg=
Received: from BN8PR12CA0032.namprd12.prod.outlook.com (2603:10b6:408:60::45)
 by DM6PR12MB4265.namprd12.prod.outlook.com (2603:10b6:5:211::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Tue, 30 Aug
 2022 11:05:48 +0000
Received: from BN8NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:60:cafe::3b) by BN8PR12CA0032.outlook.office365.com
 (2603:10b6:408:60::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15 via Frontend
 Transport; Tue, 30 Aug 2022 11:05:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT050.mail.protection.outlook.com (10.13.177.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5566.15 via Frontend Transport; Tue, 30 Aug 2022 11:05:48 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 30 Aug
 2022 06:05:44 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
        <Shyam-sundar.S-k@amd.com>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH] pinctrl: amd: change dev_warn to dev_dbg for additional feature support
Date:   Tue, 30 Aug 2022 16:35:25 +0530
Message-ID: <20220830110525.1933198-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7198018-01f3-4df8-c7c9-08da8a77980f
X-MS-TrafficTypeDiagnostic: DM6PR12MB4265:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X1fwT6lZFUgNN9YqA6dajgW4HlaoTOIM/LLxuw/BWW7/jy4Y4UO8LP1rIW5jCJur4wnCxmdcU4e+wg2RSsGYk4GGwVAP7jwwtqhY2krZKgvlRc+rT6rM23rHDAZfN04xf72Z5dmrU2BgwwpF+3E8UF/uuGW/iF/dFLehere5modDW4p/ESY0NPq6OuoVvWjIrrcCfzIhhPkm/q0zHbrwcQJhiZQksKNkF9GaexpRcwj5GEfoUOyLcMnfRor8p1KMKhLbc4fbCoGlgOklioFANyYrw7lholAW+aAk3YPxmMcuaD+SHmN0dXYVptVABT/BTO9L/zW+iWKOKJ0ivaIAHOojbqNLO878scwlDsHnMQV7shOkOgdQZ41ezIEesC4braI6yBIuVVghWGpyafJjzklsJBAyrv/wUJhKnyTTyAtZ7F2VgUTZEPbTA+60/5O0AJKt5XFP5sDbcIEIItCeNu7ZGoN1n3YczGXbelqf2xdhRsl6joSjHreu4OqKVXshIn+HHq87rsDT9JAfn/7TjRvWaCvl0wnwTlpzlIPp1wROH5uwftf4J8RWNuRg+X3Ko5j96gWemhYzRLbgxJYYFPcanUM6oJbkShmKiHEzXdVg0ZlWEL9Kqb8dBSJUM5PoxHrD1cbOiYxrTDvHNNWqesnWZ7pdWSRhHQUU5OVr3PHzi/7NEz/33jPqJ2nyLdAdHguflviu3yMlhjXhzsYQbouiwNLFrAeljz1ZI5x0G8Rj9ViJs8UFh44FXE3tHnVEjsQZnhh0ucMFnpH7t4C7FzdgvfcrkQ9Oh4xuEOUuh7i1QAjBeECLZuHkoiENPJN06gCgwUoT0XAC+D2g6odpHw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(376002)(136003)(396003)(46966006)(36840700001)(40470700004)(40460700003)(36860700001)(81166007)(82740400003)(36756003)(4744005)(8936002)(83380400001)(5660300002)(356005)(16526019)(2616005)(426003)(47076005)(4326008)(8676002)(478600001)(336012)(70206006)(70586007)(40480700001)(186003)(1076003)(82310400005)(6636002)(86362001)(2906002)(316002)(6666004)(7696005)(110136005)(26005)(41300700001)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2022 11:05:48.2633
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7198018-01f3-4df8-c7c9-08da8a77980f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4265
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use dev_dbg instead of dev_warn for additional support of pinmux
feature.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/pinctrl/pinctrl-amd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 4691a33bc374..2a4b3efb7e12 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -1051,13 +1051,13 @@ static void amd_get_iomux_res(struct amd_gpio *gpio_dev)
 
 	index = device_property_match_string(dev, "pinctrl-resource-names",  "iomux");
 	if (index < 0) {
-		dev_warn(dev, "failed to get iomux index\n");
+		dev_dbg(dev, "iomux not supported\n");
 		goto out_no_pinmux;
 	}
 
 	gpio_dev->iomux_base = devm_platform_ioremap_resource(gpio_dev->pdev, index);
 	if (IS_ERR(gpio_dev->iomux_base)) {
-		dev_warn(dev, "Failed to get iomux %d io resource\n", index);
+		dev_dbg(dev, "iomux not supported %d io resource\n", index);
 		goto out_no_pinmux;
 	}
 
-- 
2.25.1

