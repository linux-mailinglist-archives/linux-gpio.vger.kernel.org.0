Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 290AC5F096B
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Sep 2022 13:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232155AbiI3LDB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Sep 2022 07:03:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231347AbiI3LCk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Sep 2022 07:02:40 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20600.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::600])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79B9C6AA0F;
        Fri, 30 Sep 2022 03:40:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dHZD/pTudeC7OX9DWt6STekOJqCFPJZpCEynfIY5oKLIHbRQjQFrlv4lAUmc82f4x7NG832ZsM8eHGE3gHc3rSk3hLU1+Gem9zQ6NqdhoMo2V4Aow8upJQnhTPDUXa7MvHPB9ly2PYmUOUVMVj0+4cNny++y8Odp5ZTaxocZaWVBPoqOjWV+2LSM9pleAAJtk6nJj+ONnY4QjsZhssOtgyUQLcE6Kh+kGzeq9YRy8jIV9wol5uwkvDLJwGHYJy7TzjG63HTUkdsWt8s3N5SjUNbnmbuj+XEDiY2xbEG5nzyYjD7B7+mj2lu6rblpD89aNo+w0mkiKT0hdX8FfGPB/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jr8AUKukCZw5cVCjNXjfa8Mr3LAiPSjv/oUnt7iCgIM=;
 b=Jc3piv62Ynmmy/32grpszzhEyebeSaCPnS/CZaPMwHLpVXQ0lkTMu/iHjpWorh/w+aByQK6XxtxpPWoJj+6Ho4px0PeaGCQ9cT5e6ILbX/nTJ7L/1kAYpcKp0EvMog4zk+2ro6vqggAGNjV4pnSb8phHHzCiE1Oe0dIfBlWknxRu0OIGM9iQuhoVHLFvphdfZU0KHOmzhFQSXpGQUn2KpXsfTWcKlkXdjowUc1cU1zvnpC2CeJ6p1qdtX29xiIfoepT3QNNatoEUflL+8QiY8FAhr7BGg9ylavfwnc0DAFfSEJV/bvTVm0QKjby2txn7HO6P51VNcAil9O1Sdq38AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jr8AUKukCZw5cVCjNXjfa8Mr3LAiPSjv/oUnt7iCgIM=;
 b=nLugLghEDlMeu7zf7joofJrGFWIPB9KOxg2wuaO3mGRykHEymP+aYuQatJF7IXdGb2UGfwBLQng8209rtuBZekgmRnO/0/3MHRX5VbDt0BY8CbJpGBeTUc+qoyU8bp4J6Ju33te3vpJG28ufH2PqudPXRfAca/gB7V6vyRdCDw4=
Received: from BN1PR14CA0008.namprd14.prod.outlook.com (2603:10b6:408:e3::13)
 by BY5PR12MB4210.namprd12.prod.outlook.com (2603:10b6:a03:203::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 10:23:04 +0000
Received: from BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e3:cafe::5c) by BN1PR14CA0008.outlook.office365.com
 (2603:10b6:408:e3::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17 via Frontend
 Transport; Fri, 30 Sep 2022 10:23:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT068.mail.protection.outlook.com (10.13.177.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5676.17 via Frontend Transport; Fri, 30 Sep 2022 10:23:03 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 30 Sep
 2022 05:23:03 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 30 Sep
 2022 03:23:02 -0700
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Fri, 30 Sep 2022 05:23:00 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-gpio@vger.kernel.org>
CC:     <git@amd.com>, <devicetree@vger.kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <robh+dt@kernel.org>,
        <brgl@bgdev.pl>, <linus.walleij@linaro.org>
Subject: [PATCH v5 0/3] gpio: pca9570: add slg7xl45106 support
Date:   Fri, 30 Sep 2022 15:52:56 +0530
Message-ID: <20220930102259.21918-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT068:EE_|BY5PR12MB4210:EE_
X-MS-Office365-Filtering-Correlation-Id: 590e334e-1acf-4c81-ab7c-08daa2cdc24e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OmHNsGOJoPR8kIS297SldxqfFFEtBSJNDEJ4xVcp3AjPeXuDj15m5sNUibFTajWCA2hU9Xuov7+YG7iiEBjYAPhnWHCra/MlozIGn2rbwHv/R6gTb4usl3mhnvdvTalbiGGfpHVM/vzrUlIka+ITQI668IWmBOs2oejLCfT1tdAlxRL28mqx0l2fInyjxTJdwjZVQtOhzn1jCFnFFxEf4uZE9+n8YTAWeiqTc+oUSgF2MG85N0zJAZjCU202StsEwaSAH3HPq1dC4wj+mKD/tb9I4GxHWphHLYxiE8ccFhW0ejl5yDbBMHOe8iMJIPMi58dFNxXwsSWaAfp92AwOhjUw8CUhORcyv3vKROfZkJ4IEtTPkYOOmciuMWnSnfOT44a4doOHRjcDtj8xtOkE+HkAvfsvbn2RBRzBuqn3VcRqkCUkYR8TTx4l3iucjy/tw2lF6A9UwN7PQLPACnjpTMO76INXebmhHNFaZeZPop8QhiY42JtvnpLxSGIk97m+Ca2EllILKQRR9cs7/pYWl2l5KbQtbs5bYG/F+DZE48s7T57KCFe5QUAaydSwRv0aDxdgRyIgKBOeL70+fQWhUfN80YIDGzCFQCnQhZMltdFEjEXoaTiO2t8tr5BR5ypGJbGpqj88YvxH5RLcK6S/JjERcsNJbWDV6vxh7oX2VlqRnkYtrwX/QEyVrrZQnY4aPoBNokWv76UtsP8nKYaeQX5g0AluXN2e9BipKBNruX/rg2Wvb+NSaDsOMKhg2YIG8Fu+4a5GAE+R63NWBsQXIHOst1XkWcHc3HOzePaw8es=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(136003)(346002)(396003)(451199015)(40470700004)(36840700001)(46966006)(40480700001)(41300700001)(36756003)(36860700001)(4744005)(44832011)(40460700003)(8936002)(2616005)(5660300002)(70206006)(478600001)(82310400005)(336012)(1076003)(186003)(26005)(6666004)(86362001)(8676002)(70586007)(4326008)(83380400001)(54906003)(426003)(6916009)(47076005)(316002)(82740400003)(2906002)(356005)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 10:23:03.7652
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 590e334e-1acf-4c81-ab7c-08daa2cdc24e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4210
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Add Dialog semiconductors SLG7XL45106 GPO expander


v4 and v5:
Resend as the patches were mangled.

Changes in v3:
Add ack
split the new patch
Suggested by Andy Shevchenko
split the new patch
Suggested by Andy Shevchenko

Changes in v2:
add alphabetically

Shubhrajyoti Datta (3):
  dt-bindings: gpio: pca9570: Add compatible for slg7xl45106
  gpio: pca9570: add a platform data structure
  gpio: pca9570: add slg7xl45106 support

 .../bindings/gpio/gpio-pca9570.yaml           |  1 +
 drivers/gpio/gpio-pca9570.c                   | 49 ++++++++++++++++---
 2 files changed, 44 insertions(+), 6 deletions(-)

-- 
2.17.1

