Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0E413AEC00
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jun 2021 17:07:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbhFUPKH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Jun 2021 11:10:07 -0400
Received: from mail-bn8nam12on2041.outbound.protection.outlook.com ([40.107.237.41]:37409
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229747AbhFUPKH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 21 Jun 2021 11:10:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T00HV84hoWf0JvE1Nd4R0wTlgIo9p7D/e7z0ba9mIYmSvkGmUxBuxzH2eKneQXb+q68lYsPM5sjKhDRuehl+f8jtdKj155kjFPxj4mUQqiKI0sieP0E05QC42C1c29wpFH12Ro7jUGtr6UslbAs3mjrYdRQZ3POk/1pUJewcmTTj84OQzNlywlm8cacqf3I4WRcmN143/1R/w9ddFQTdT24hdXr7EOE9iViTVcvg4hc9w64DIIfD+zlvQtvUkB7XpnzF5KHoCqkmnJFePw3HXsM7zbncp7aHEl24EYTn+7tvvvytqX1ME0lIuCldvVUqP6Z2oE8yPtQWzMpAmLqh0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FF/KNHmvI2t390kvAJBAdUJkBPIqws1VqiHmnCuR1aQ=;
 b=NBJAzYsq47zF5YoCOm4FJwg34WbM2Qq1VtAsSxMdXkunOaOkOFrTBsEiX04oO/JwBuG0hgQPjwkc4yhalJ7QEqHjLP87FeKl/ZCCvJGTWvccOTTQuZT7QkX90NMBw3HpuLSWG9+dWZPOM3JUammML8BWdA+bmKdhrRlBXvonkGTlD9vpR68Fs+tYAoG0r0sqytmCayP9hwO55P5T9QbfoIYxVwaFMeWknNBUD6Dlf8HVUtuX3lG52/z0vDJlCe7JS3t4B0vdPQB3FRPc31jMvDM8HFzt2kofV3nGci020D2D/TcQ4v76HG18RllOR20KuEpqxC8RjSTpJQ/xWMcjfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FF/KNHmvI2t390kvAJBAdUJkBPIqws1VqiHmnCuR1aQ=;
 b=WEX531AiY5gFqpBEkKkispoVUpI7z/pVovo/uTXqi2E05JOntud0CEueSjqaCk92xVg/wpY6mQ9opOw3pcU3b2R833zHQgc60rHYJQFANB0QHrgPhJibsPE176eTPpjX6w7r2ARWj3y4l3FwtL6ppIVirF92oTdvXIG1M10CRDtxqsmvvI+Mb1rrZSmHdeDTVJnasEB3dSTFesiDDXQbyc+UxjZBIdxav0mivmusDUaIR4NdPEqDcZfvXfwRyCbKgi2TIauNCieSgwiaaid9+GuhNLUKFy7lOUamf6J5ZQeT001tXgV4K0H2k1yVXwGu6rA4oGeUwxSPtKlg+t904Q==
Received: from DM3PR12CA0058.namprd12.prod.outlook.com (2603:10b6:0:56::26) by
 DM6PR12MB2859.namprd12.prod.outlook.com (2603:10b6:5:15d::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.19; Mon, 21 Jun 2021 15:07:51 +0000
Received: from DM6NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:56:cafe::a0) by DM3PR12CA0058.outlook.office365.com
 (2603:10b6:0:56::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16 via Frontend
 Transport; Mon, 21 Jun 2021 15:07:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT026.mail.protection.outlook.com (10.13.172.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4242.16 via Frontend Transport; Mon, 21 Jun 2021 15:07:50 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 21 Jun
 2021 15:07:50 +0000
Received: from kyarlagadda-linux.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Jun 2021 15:07:46 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <andy.shevchenko@gmail.com>
CC:     <akhilrajeev@nvidia.com>, <bgolaszewski@baylibre.com>,
        <jonathanh@nvidia.com>, <kyarlagadda@nvidia.com>,
        <ldewangan@nvidia.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <mperttunen@nvidia.com>,
        <smangipudi@nvidia.com>, <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] gpio: tegra186: Add ACPI support
Date:   Mon, 21 Jun 2021 20:38:09 +0530
Message-ID: <1624288089-15278-1-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CAHp75Vf+8t78NbYeCh+VLEAzcYJxDP9Pz7DPW_MC9D-K_Ff8uA@mail.gmail.com>
References: <CAHp75Vf+8t78NbYeCh+VLEAzcYJxDP9Pz7DPW_MC9D-K_Ff8uA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38cf5f20-90b1-4d18-1fa9-08d934c6568d
X-MS-TrafficTypeDiagnostic: DM6PR12MB2859:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2859EEAD95A17C42E132DA95C00A9@DM6PR12MB2859.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GlPdjBs6aS0srCIz2fLtIz4ED2bULvqKH2wes9LdHsgN0K6WRsHIV25QxQyrB9pSPCFSCXlqe8SdArjZiIUSZWrZSq51Thsrsbve/GkZ4pu6/ip/kCPYxhCNqjfn8FwGlQKpH2ZyiR8vtoNXOy9hD1WVflyHJZ3mfPXl88gDMS0rOAFVcn9wxKc0U0xEDCT22mUhAhIYani7yV0vxJnU8BTJNK9NZa++yu9GMCVLCH8y7TyYdcZn0yvGLb1/Zh6u5ri+I/X69uTJiJu8S4g8Srt/x5P/0fUvnDIkm+ljfQjpq5Cby1kgF2eED/4uOU8bhEmcDAI+ma3wdZK8AHqZz7Qzoe7pIVjTCmjltwtQHagbIl6dIVqR2SH1zDjWBMv7WJ+9Nwf8rVjWNp3PIFIzTAap8jSKIf6g2VZA/Kr9EVeImxp+cJKdbce/ad4BSq7dcV8ww4WLMPEj1rkLmoi9Q6xvWZT+PQpsaNyle0c8oAbzIT6dXtGO3YGBs3Qt/Ky8bMYXN4GrJcEtiWxxBOcFI/Ru2ISU5aXxrcbnub+HEugxaeH6C0TOxtxjsKQgY2jUFE0MvbgZUX1c8tCwXKThrMvpUk/jfVxB9qCaYzfJDm8Dre2DfyeqqGcuxRetNRRHQS7tNl7JKV9kAjsHDmcFQ0OWL09z0C9DAOYO65lbS0k=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(376002)(39860400002)(346002)(396003)(46966006)(36840700001)(426003)(316002)(82740400003)(478600001)(36906005)(7696005)(8676002)(36756003)(5660300002)(86362001)(4326008)(6916009)(36860700001)(2616005)(47076005)(8936002)(6666004)(336012)(83380400001)(70206006)(70586007)(54906003)(82310400003)(2906002)(186003)(26005)(356005)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2021 15:07:50.8674
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38cf5f20-90b1-4d18-1fa9-08d934c6568d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2859
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Thanks Andy for the suggestions. Few thoughts I have below.

>What about doing like

>      gpio->secure = devm_platform_ioremap_resource_byname(pdev, "security");
>      if (IS_ERR(gpio->secure))
>              gpio->secure = devm_platform_ioremap_resource(pdev, 0);
>      if (IS_ERR(gpio->secure))
>              return PTR_ERR(gpio->secure);
>
>and similar for gpio->base?

Wouldn't this cause a redundant check if it had already succeeded in getting
the resource by name? Also, could it happen that if the device tree is
incorrect, then one of the resource is fetched by name and other by the index,
which I guess, would mess things up. Just my random thoughts, not sure if it
is valid enough.

>Wouldn't the following be enough?
>
>-       gpio->intc.name = pdev->dev.of_node->name;
>+       gpio->intc.name = devm_kasprintf(&pdev->dev, "%pfw",
>dev_fwnode(&pdev->dev));
>+       if (!gpio->intc.name)
>+

How about this way? I feel it would be right to add the OF functions conditionally.

+   if (pdev->dev.of_node) {
+       gpio->gpio.of_node = pdev->dev.of_node;
+       gpio->gpio.of_gpio_n_cells = 2;
+       gpio->gpio.of_xlate = tegra186_gpio_of_xlate;
+   }

+   gpio->intc.name = gpio->soc->name;

--
Best Regards,
Akhil
