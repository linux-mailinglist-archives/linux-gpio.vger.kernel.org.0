Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA6553B7507
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Jun 2021 17:17:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234653AbhF2PTp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Jun 2021 11:19:45 -0400
Received: from mail-bn8nam08on2068.outbound.protection.outlook.com ([40.107.100.68]:59699
        "EHLO NAM04-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234627AbhF2PTp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 29 Jun 2021 11:19:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M5xiG06rYw76pYcq7LR/22IO2V6muIm7ZNm2tMaLjQ0d8u/bpInuqXelAezJwHcGi7Q57mMUwPl+eNB3QvBZo/+GMCS2Syc9kIX9ui9QiaNgxcpfK7ULWdfaz94USb4deMlkXnC3vFV/6q/22pTcIh5DmoCfw31WGUlmkPj8BVk7CTlzusFIhJf94204MD9N2MpXJMRariBwOEjFDXoyqlyfyKF8fkqP4gIdRl8hixC0JTGb4DMAm9tPIyuFpN7/09h3b78WlVV8GlQxoZT/nIVAkVrqxkc/LOIuZgzFs+J4K3WYQ8B0jaP/tMfl0S6QbubhmYjEnoi189O+7NvGuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ofmTvR32DBhh8UWD9mewQGu08YvjkEWP2ielW9glrsg=;
 b=Jfoq97nreO7ai0CQJghpTFhleun0kyyFcM7xbWIy5B7VWYxOPa+tmp7FnVocgdXicaAgEDYggLQVVZJAaPA8iXIGzmEoINpn3lxVEsL+mjc7IWmyxtwJN/o+9IyApz+x1Fe1qh1VLkKsxq2PI0Jl7Pr28lGkW7Jzc5JV/7yMfDdqQwaEdQXrKFScee5iL5PuM8ZeAWyZ6ZThG3tjrWOHlFxux7UKiVD/j8N6C6/l+asaDg33GO76ahJmLeoB/EJ+Fw2AN2tIiRfQRa/dIeFMjOjKTTUYUM79Psxz8n3Ul8uM8CsJlc39zbmdit7kYkQdj6oC6tgvEHLVu2VEHqftyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ofmTvR32DBhh8UWD9mewQGu08YvjkEWP2ielW9glrsg=;
 b=VLh962RMui4eQ1dGJJguPP1SlTzF51h77FeLS6qb7ut6JHTKeopuDUHbtQbhxnFXlCACjrZJWwChfWJPxoOxxpThyb/nWU6fZBzFRHMPhPHpDyV3WgszxPj6iGMItB13i8kj4R/uGQ7M1q/8zPftxMUB+JKwnv5+kex0iKVq+NSFoUpBA6jKo7RMkRSoDNfAw0Hvoglh5kCyZknbp2iUaxhufuLmVmCm+C8ZHwRxUZf4P8kWuNWn7MwZxaqbaZn+sgSIrkL+bv9wlSF4U8f1r1S0Pnr+tMO8UhgQJNaSGhlAil3g14dOxL+Bl9CGxbbrpH+v/Epti/MTOe8J6hDW2A==
Received: from BN8PR07CA0006.namprd07.prod.outlook.com (2603:10b6:408:ac::19)
 by MN2PR12MB3488.namprd12.prod.outlook.com (2603:10b6:208:ca::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.25; Tue, 29 Jun
 2021 15:17:16 +0000
Received: from BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ac:cafe::5) by BN8PR07CA0006.outlook.office365.com
 (2603:10b6:408:ac::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.21 via Frontend
 Transport; Tue, 29 Jun 2021 15:17:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT024.mail.protection.outlook.com (10.13.177.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4264.18 via Frontend Transport; Tue, 29 Jun 2021 15:17:16 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 29 Jun
 2021 15:17:15 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 29 Jun
 2021 15:17:14 +0000
Received: from kyarlagadda-linux.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Jun 2021 08:17:11 -0700
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <akhilrajeev@nvidia.com>
CC:     <andy.shevchenko@gmail.com>, <bgolaszewski@baylibre.com>,
        <jonathanh@nvidia.com>, <kyarlagadda@nvidia.com>,
        <ldewangan@nvidia.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <mperttunen@nvidia.com>,
        <smangipudi@nvidia.com>, <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] gpio: tegra186: Add ACPI support
Date:   Tue, 29 Jun 2021 20:47:08 +0530
Message-ID: <1624979828-11699-1-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624288089-15278-1-git-send-email-akhilrajeev@nvidia.com>
References: <1624288089-15278-1-git-send-email-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e41b529f-255e-4b10-00ee-08d93b10fae7
X-MS-TrafficTypeDiagnostic: MN2PR12MB3488:
X-Microsoft-Antispam-PRVS: <MN2PR12MB34889D6E00DD34591557F032C0029@MN2PR12MB3488.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1AZzYYdgjYx6g7iohgvAulGan/LIqdW+XLWqnvwIxW3/BWDl5Dgo2jL92swRUDHVwo5KS1Z6aJtjcYztTkd7TE7DTLTrYb4cWzz4oP6X9umf4fQvmXpyIavcoT4r0kpHxJXkfl8WF0j4avUKFISdMtaYtD8OpkHfDnhVke8RrvAEAfYpRwB3CRwXyB3W/Bj3OVzUy0Mwk4fh0pONprVv3pzpE+5N3ga4c2c+0PRYOp8lHrT343fM2tPSigDjrOsUy6PuvaYQWPtddWkZYb9NKbOiha8n114IdbkEwWjZjF+zsVnOKLGUdKngdrn+6dOgIlMpZ/LG4l8kC+8pN1GnnkUKMTgH0sZKhHSezFW3vFdjyayORlnpERaXN9Ecrd5uO8JjhJvy7hXIbMyO0EOieHaSmC/qYcQ9CWd+drVsgGbDvwSvAtkLWFlVpiORySM1O9Up0fiwA7B0rrR0zDAsv+u++/WFrLQ6GhmOlPGJJHRL4K9MaCfr1vfJN+WKg+yyCVcCW5oaJkNb/wJqQ3tqUecCHBkHR9xFeuUm+lOTkK2ChGyBEqDiAGYu2zVvAF0rLYiJCSOq9nDoo8WzdymfHL2nI5M0JsIn8+5paaHkUs+eBWvhY4OdEUXb5PBmQtqjVUpiMfGsCsuTi/JLBRKhe+ykoIy8fLPHdYcu4TyB7Gf0NlOrdbniXB4qbhIX9IYhTKXaSmNk6chvTCjDu7STNg==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39850400004)(36840700001)(46966006)(70206006)(54906003)(336012)(37006003)(186003)(82310400003)(6862004)(83380400001)(8936002)(2906002)(36906005)(70586007)(8676002)(7049001)(7636003)(36860700001)(86362001)(36756003)(426003)(26005)(6666004)(7696005)(478600001)(558084003)(82740400003)(6200100001)(47076005)(356005)(2616005)(316002)(4326008)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 15:17:16.2815
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e41b529f-255e-4b10-00ee-08d93b10fae7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3488
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

Please let me know if you have any inputs regarding the changes.

--
Best Regards,
Akhil

