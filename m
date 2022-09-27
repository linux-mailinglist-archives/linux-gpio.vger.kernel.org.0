Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A96185EC278
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Sep 2022 14:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232350AbiI0MVR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Sep 2022 08:21:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232347AbiI0MUv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Sep 2022 08:20:51 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAA3B2734;
        Tue, 27 Sep 2022 05:19:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gA7Vq6oqdrFMxzBaDoTo1mGDzZfINs7GUoXPEQeLQsORBTTHYOVIh3iywovck/Qhhh8DttMfp7qT3Qqu5C1qV2EST7+EvAUeelyBztnAeXcBgwLcKnT+U9UQJK935Suj+XCyn596fC3mr8TACxMBVt22yqLyWjEDpBHuGpUuKGxOHj99IwVp6oUahH6TvHk3qkConRe31BllNTcNfVT5IRh5miSPo3eHnSqmS4Q9rov3JVsarNeRk3htQHHbgH5lkuygBbPgrRsqNypNqgOVbnIj6DXDKhl8BcCeHdj6z9FcRExffu9oE+OxnoslaQ+4TtZoRh4K6+s3cAOVYACEQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Pm9o5hKkDBRVM+hrAFWEV41OAURgOqftXtTjXoveQw=;
 b=J8VBJQZOJu4jhlc0rlwKB7RBCleX/VMYou0tba+Fb4NvJGugQZOulkuRSXb8nkqEQ7EGu0lCEDpknp6zFRQGF4RrvDmhI7U4dt6Wo4DGdED2kgFunCvEIyk+E/AYSyLPhepIb+AxBvlUhilqZ+r+TnZ0DEzbxftHs+hYloupUzCfXA38GnXv3ZL30CACb9H3HZGC4ANqsbOLC0mZMAx5FHMnS0G3vEbAl71jAEh1qVhLnjJ2wIgjHm6Q6gKCxoq2vH5kkSNOEq17C4Rsqpgm4pFBGrjsZ23K/3sKsRTYiXfrEsZwovfglzI2GqsRbkLYpHqjIpMITi2dIEh0uCqlng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Pm9o5hKkDBRVM+hrAFWEV41OAURgOqftXtTjXoveQw=;
 b=AUAB7iSwlIXN1OzTxNDwQf33K+42JKCx4NQgGTLbwqRkalbI15Cpz6mDn3b4K4ny46Ke7iogyeMnLHovgOmNhHM4mi6NK+NRFy8SHseRMhj8YMvaahRDDuAeLOoNM0vtYwr4Y21CJnz7Zsws9LRlZ2rOZifGU6okTFGRNtmyXFY=
Received: from BN8PR04CA0029.namprd04.prod.outlook.com (2603:10b6:408:70::42)
 by SN7PR12MB6959.namprd12.prod.outlook.com (2603:10b6:806:261::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.24; Tue, 27 Sep
 2022 12:19:27 +0000
Received: from BN8NAM11FT094.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:70:cafe::f2) by BN8PR04CA0029.outlook.office365.com
 (2603:10b6:408:70::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25 via Frontend
 Transport; Tue, 27 Sep 2022 12:19:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT094.mail.protection.outlook.com (10.13.176.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Tue, 27 Sep 2022 12:19:27 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 27 Sep
 2022 07:19:24 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 27 Sep
 2022 07:19:24 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Tue, 27 Sep 2022 07:19:21 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-gpio@vger.kernel.org>
CC:     <git@amd.com>, <devicetree@vger.kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <robh+dt@kernel.org>,
        <brgl@bgdev.pl>, <linus.walleij@linaro.org>
Subject: [PATCH v4 1/3] dt-bindings: gpio: pca9570: Add compatible for slg7xl45106
Date:   Tue, 27 Sep 2022 17:49:16 +0530
Message-ID: <20220927121918.30543-2-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220927121918.30543-1-shubhrajyoti.datta@amd.com>
References: <20220927121918.30543-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT094:EE_|SN7PR12MB6959:EE_
X-MS-Office365-Filtering-Correlation-Id: 7442a8ed-32f9-426f-37fc-08daa08285b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8jZuaHZ48rnxL2XTZK/nGRGRbsiYrfClL5yv6eknaCCGUklCU4M1Q57HnYcMr+K/PBkPRGu7cONI6688EfyfUf4GZeAHPAZAP0QXE/5QmW5ttrMEo2pmLaxGgEvdiEnLKgsBavHkShzqORrglsj6BC7kkj3fzPsgft8cyXrqv8MDFVFStMLaxL6yIAyv+L04Sc7dXEBssMRDGb2Uf5X6iC3UJfNU9pvP9+Zu2gxitaEoRBxr6xD1ZRoyKBvmc5aG/g/sHudVpYxNi282BVKnrFyJWtpQVfKmTLM0E2G/ONjdhd7lIamJGA/HoxcMeWbMkQpnRL2Z+ZDErAJ1am7Ra72AC/Oh4bBHL4G34PG5Mm5CBkND4JcS84nXNprEmYEYJCBoWJ1o6J/5Kb/AgOAYHdGwd9bxj+gq79+kNXzWgzBqBcdH2OeaYWxJi5PauaFU+ab/UGOlPSK+KiAjJymqswMHLxGiCXc0rY7V+7je0R/DXfdyqDydwSt0pOAhE9ZpXFxH8zINr1XHm4Elm/NB9DB/TcYKzQGJCoi8oHQnQ03OJ4f5/36bPgYfPtkEfTHJGTKwh0/+dqTH9oek1CEiNjI6MYPFRy2j3dHDN5Yr22fR2u66jNmv/MQ8jQKjG8fD7wSlRyvc26JM85ATXISP3vATKH6ZvMSnumKqduUeuaiacHASo16+ksvRHT4eZnH6bPq46h7ecSWjpQrCeD9iJ1gVu667LyNIsW6vgn2ZeNE/txE/4K5FqGB8s9Iw5SG0aXWEX790JpFpjn8ZKXnRxP2mS9kRi5arUPILZsYlweQJoto+LeNtflqshHlSvY8n
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199015)(46966006)(36840700001)(40470700004)(426003)(44832011)(8936002)(5660300002)(4744005)(40460700003)(26005)(36860700001)(8676002)(6916009)(70586007)(70206006)(54906003)(36756003)(2906002)(4326008)(316002)(41300700001)(40480700001)(356005)(47076005)(6666004)(478600001)(336012)(1076003)(86362001)(82310400005)(186003)(81166007)(82740400003)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 12:19:27.4938
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7442a8ed-32f9-426f-37fc-08daa08285b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT094.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6959
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds compatible string for the SLG7XL45106,
I2C GPO expander.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---
v2:
add alphabetically
v3:
Add ack

 Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
index 1acaa0a3d35a..48bf414aa50e 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
@@ -12,6 +12,7 @@ maintainers:
 properties:
   compatible:
     enum:
+      - dlg,slg7xl45106
       - nxp,pca9570
       - nxp,pca9571
 
-- 
2.17.1

