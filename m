Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7361C5B9A21
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Sep 2022 13:55:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbiIOLzJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Sep 2022 07:55:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230316AbiIOLys (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Sep 2022 07:54:48 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20612.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eab::612])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDEAC86054;
        Thu, 15 Sep 2022 04:49:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QE/WdFUFA7G9ig3H4Sx0rTLirSN8qqVCuQqBNVaZ1iLkzMvc2krPT2Q6HBz/1voE8R2+uowclz3aJnbWH1IajAlFXyA92D52zsm02AZLv+sJiQ8JfkQ0lGom8m8QGArkWuvPPGhgp91MgLY5guH4NWD0Bg/EuyMuiewP04UCxtoUxTXYcwiVcssTWhzVCVihJySaCJkRQc45rU7N1mF8pdv6oez5vlLapzKuJAzZ+RUhtZUTRwGVMKi/OP4GVRDfdsSvR9LvhXbvs+e6WAv9Lgh2sCAJvLuInP8Gi7cnuDIzZ6IRarmuxDCMUNyGzNFNwwpNt7kNQ3yXfb5ekKu+PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8LU+kwpcHlcCQe3KaIx7D1+qU042kQqZTBwxLOXmfw=;
 b=CQtuNYhJHjla/RfHscRseYni1gNvH5uwcOC3+MtfKfilx8LAqSwvC3PPFCejM0yYv5Zmgb9RUfi9Tpl6SX/rvja5nufI0XvxQL68eGU9CmCBgLs4q6CSD63bhWSJz2jS9Da/L9/XNPU17em61//JUnOi8VVr1wUq64kKJR/GRwO88wVApBi4BhBaywZqQZwZns6KNEs9GtJ7Mb20s9AqRRoxg9ZfOF3fw3Y0PNLyKxiwh3V4YdwG39UsccNsBjA9ZwtDyzUjLtlifK/1HP+Q9F5WBhk82ItnMNxV+WuGggiybvwk8kfc8lTkVgdGLSoJN57Q57I1OOm5LZjmpVYcoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8LU+kwpcHlcCQe3KaIx7D1+qU042kQqZTBwxLOXmfw=;
 b=Z/JTYsdETqsbTJ4In572EyP/brnwlPS9In51e7K0kzaGoPYa5uoJIEQbpWKCqNg2LVDp2+LwaTfDlIlAVeMYEImhq83lhLz8A5RVlq1PwT0ZRNsPy9xbHCVu76dxlTsGyXK4vhI2pZZ+TppjZACltp8L6630fY0H80nPr9JQYdw=
Received: from MW4PR03CA0129.namprd03.prod.outlook.com (2603:10b6:303:8c::14)
 by DM6PR12MB4140.namprd12.prod.outlook.com (2603:10b6:5:221::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Thu, 15 Sep
 2022 11:48:08 +0000
Received: from CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::77) by MW4PR03CA0129.outlook.office365.com
 (2603:10b6:303:8c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15 via Frontend
 Transport; Thu, 15 Sep 2022 11:48:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT010.mail.protection.outlook.com (10.13.175.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5632.12 via Frontend Transport; Thu, 15 Sep 2022 11:48:08 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 15 Sep
 2022 06:48:07 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 15 Sep
 2022 06:48:06 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 15 Sep 2022 06:48:04 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-gpio@vger.kernel.org>
CC:     <git@amd.com>, <devicetree@vger.kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <robh+dt@kernel.org>,
        <brgl@bgdev.pl>, <linus.walleij@linaro.org>
Subject: [PATCH v2 0/2] gpio: pca9570: add slg7xl45106 support
Date:   Thu, 15 Sep 2022 17:18:01 +0530
Message-ID: <20220915114803.26185-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT010:EE_|DM6PR12MB4140:EE_
X-MS-Office365-Filtering-Correlation-Id: 8637f12c-5467-40a6-d7ce-08da971028d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CEH8sFWgSi2PhX3yvUPMM215PqZTVMa1wUgVFoNybUshu4WyCLw5GFOwCBYwK3ocWuJ9PB4hWZb/dBy/UMlgQ94vEeNF+SwuU71tbFBKgGtY3zWhv7Ml3qah8KPR96Si1RIPDjFXCtzPueGrx1ZNa8FPZK+vImTdj0EqZ1Rtd2o+658jmBre7pjfClM6byMJ7eRlLZmjpuLQHvdxs8JWqkvOWxKDz88N0of8F8A84mqFgTUKOZMCx+KAxGyiRKxqN16WApM9VpnYadnnA1Ue20nVl/gKIPdGIdEkxBh3MqAj/ru6hEmDGe0xbPwLmGRfAyV2F7Z0dzrTDDGj/Koho4HJ3UZPy6fbtIONVF9nHYzZjuQxlI/D20lVHrizIFgmbz44msFzTM61mR1H3oDsqck8+DMOMxqXpJmzwqghSjXJsQd5nwrJtxH8AZpSXXb9c4QO0wb6WcCzAtvNxC/dTL9JSsJytk3EszuG1do5G1vr//F/q/pCdkFuD/6/j5OESunk4x7RbPLvZPHWlGvgDrpvEfUtZG9ktxYk5D7jZJ9Lt0P1yEdJmQfkKJLudoLflHsBEisYHPBQIkRGPnFdnQq07BpikszHX70RqphFWPFyF5r2Ce8jeePdL4btxAFIPUY5nfy8y697lZqaa/vym9BjivZd6C5e9vXQ1SHrVhvTVhb36/0mRk31sXvwUp2Gp4pDIG6KYfTQXxHeo4UlFBq+KGPmQvtpWtEcN2Ff+plFUo49n1R0iYyq5qHVWGm6p6RPBU+3m7jrWbfuQVdhNuzjZ02Qzif4hnjfRl6aTK/QftSQZQL5awbVOHxKjP+o
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199015)(46966006)(40470700004)(36840700001)(8936002)(186003)(47076005)(4744005)(81166007)(40480700001)(356005)(1076003)(41300700001)(86362001)(316002)(478600001)(82740400003)(426003)(54906003)(4326008)(83380400001)(6916009)(2616005)(6666004)(40460700003)(70206006)(70586007)(336012)(36756003)(36860700001)(5660300002)(44832011)(26005)(8676002)(82310400005)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 11:48:08.4583
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8637f12c-5467-40a6-d7ce-08da971028d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4140
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
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


Shubhrajyoti Datta (2):
  dt-bindings: gpio: pca9570: Add compatible for slg7xl45106
  gpio: pca9570: add slg7xl45106 support

 .../bindings/gpio/gpio-pca9570.yaml           |  1 +
 drivers/gpio/gpio-pca9570.c                   | 39 +++++++++++++++++--
 2 files changed, 36 insertions(+), 4 deletions(-)

-- 
2.17.1

