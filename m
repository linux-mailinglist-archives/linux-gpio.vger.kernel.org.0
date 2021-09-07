Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21285402457
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Sep 2021 09:31:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232056AbhIGHcG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Sep 2021 03:32:06 -0400
Received: from mail-mw2nam10on2083.outbound.protection.outlook.com ([40.107.94.83]:32495
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230261AbhIGHcG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 7 Sep 2021 03:32:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WU1OIN1fZX4vz+RyZnM2Wvg8W9grv+4Z7RLDe1E8Txzux2dNc2AMebL3XINTa1vCqGkXfYqDUtdyhIxrUWPlNe8w9+0XC3D2lH5AuG70QJbVIwMCCa5h5VgbPuBkWLR5NrmujHfU4lNPzLZffCgdLqacdBIDfe7iX+MB4/CqmJ5L6NZaeygam1mWlTS313W1c5Vba8MV6U1H+odFCSXQU0APsMqqSDpWxrDGRup7+BaeVuUKDZR6m7iNNwvc5NsfJJ9FUXrtj7G+bWJ5Oc5C28i1GCExstSngxOkaScmOu+l0exIM2cLUUbh08Lmka8P2gcIf0PmrnlaZff5BAxLwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=VuIk28lCjfp02OHJsIQ3CXgUwRgOgKb0IbeATEFDDKw=;
 b=NlASE/FpHku3HVxOi7SWaeIwUEnZXDnvlKvONe/Yr2S659LcRmIBk4WKv8cnLH+dF0QgVLCObnOqFxXrjuMVadnr4jfvLBizD5/DPZYRbtH06mxhKgb7KBPAx5sjI11NNKcZ4yTNv2hEOPgO1UaPBd6v4eGscqlpUxb3U4X5Ej8ecPBeQdjrlhUzdqh36aGaIj++z4/7BNVa1iJlCDmz4EE87b/nZFK2bZdO6tNKMtnmbbHyswuUPjYBHaP0JZfwBF8Rc9kiNbCeA9qSaj/ItW5MEsvhYkJIvQSGR4BykjU0O1py3o8mi9XN6+f6aOW9EpcGi4ZfwJc/NHXxHtuRrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VuIk28lCjfp02OHJsIQ3CXgUwRgOgKb0IbeATEFDDKw=;
 b=r2J5y9PZA1Dqq+M4BBChD+BU0+b9KyYhT9S1Hxz7xM2b1p8eJ4BB1cqNxPppp4jYcvqPu4t12kDb8/8EEGgHELkbQ+SrHRsbK/+AIcUA8qhPwQxxf5BxlVo62KRP6NGla/jzCLVCIJvfTq10ZMJML2lTJYOSAP7oKPHpmeUf1LXjfXQ8j1xFuUdXjpAnzBIg2HtSMwFOgKYFP/IFm+iGNybDppXCUj4g4ivS6+0PdfcdBKyhgvx9iixnl+B8/XCxXQhK2Ru2uwHEUUU5y4qCmjV8UQTdOPDxcMbRLrd9pBHiRYz0zQWnrsQK5KhmrEvyelKLklH0wriqU5z0Hv4/zw==
Received: from BN9PR03CA0047.namprd03.prod.outlook.com (2603:10b6:408:fb::22)
 by BYAPR12MB4599.namprd12.prod.outlook.com (2603:10b6:a03:107::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Tue, 7 Sep
 2021 07:30:58 +0000
Received: from BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fb:cafe::ef) by BN9PR03CA0047.outlook.office365.com
 (2603:10b6:408:fb::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Tue, 7 Sep 2021 07:30:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 BN8NAM11FT058.mail.protection.outlook.com (10.13.177.58) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 07:30:58 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 7 Sep
 2021 00:30:57 -0700
Received: from pshete-ubuntu.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 7 Sep 2021 07:30:55 +0000
From:   Prathamesh Shete <pshete@nvidia.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <smangipudi@nvidia.com>, <pshete@nvidia.com>
Subject: [PATCH v2 0/2] gpio: tegra: add multiple interrupt support
Date:   Tue, 7 Sep 2021 13:00:36 +0530
Message-ID: <20210907073038.2983-1-pshete@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <YTWeSJ7jGamxx9Uu@orome.fritz.box>
References: <YTWeSJ7jGamxx9Uu@orome.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2dc86926-ffed-46f3-822b-08d971d16fd3
X-MS-TrafficTypeDiagnostic: BYAPR12MB4599:
X-Microsoft-Antispam-PRVS: <BYAPR12MB4599A19FC434FD7A5B6333DAB7D39@BYAPR12MB4599.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NoHM7dg3ATy/bX7I3t0Id5gA2lPxRmotSSOjxZq3h3F6ifcbyv70FVySyKsaXaQTLFjVu9Tbz7ITuNRkrse5K0u8XnQp6UoxBnjfTJw+yh9muvlxfX48j8caNQ0X5LIcUiLbjZQf3NrEIG0A2lqCCz38hQWX/w0JljC9WvEHm2oUlHTA5USs5B84V8xUY4n7bYoeMr/n7nKyI+2eOs9BBcomGbMoYrcU/W+MPrdShiKYKau27U1zd60i960YCtmDwIXMbW2WQOW9GemjRnuktiC1LBDyQWMOPShmK2FWceA0JzTJ/I/RkeW1E17QjKaeSWbbt3z7Syv7idkVluYBB/S4V6MUmTe3Zb9izzTkzzKFSdozvHGysnBHOtiJ5cAg/ik1wcWcJjBMisS3oMq6mmmDEOGRCzmIiBlGH7zHzptvrOiUe5DXycYVU0oTQXTBRrMfry4Jc5CP5sul3HU7v/6JnHg2eEvGeQ/MZROfALwV7qp6CxDjaOOrxkXm7bfNm0lXTprhsm/ly1dwRKQBMNQEcVopiWSRsxNUZglV5u6dRG3sll1jFAssPRxdrTGYruVhHiiH5wtG6X2G2YuJ24++PuonHoUlzELSM84+kCItEL4ss7L24FVYNXvuLs4jyQcXqqzJydiUHShLZHZAllEYAiChojHzwWaYzlT3tGowdE1xVUjB0CLc9NPa6k9K8rEvV7vVByq7O2NpcuQssA==
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(70586007)(70206006)(8936002)(6666004)(5660300002)(83380400001)(8676002)(426003)(336012)(186003)(1076003)(82310400003)(47076005)(4744005)(2906002)(86362001)(4326008)(7696005)(316002)(107886003)(7636003)(54906003)(356005)(2616005)(36860700001)(508600001)(36756003)(110136005)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 07:30:58.6232
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dc86926-ffed-46f3-822b-08d971d16fd3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4599
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: pshete <pshete@nvidia.com>

These patches adds multiple interrupt support.
Each main GPIO is associated with 8 interrupts 
per controller in case of NON-AON GPIO's and 
4 interrupts per controller in AON GPIO.
This is new feature starting T194
The interrupt route map determines which interrupt line is to be used.

pshete (2):
  gpio: tegra: add multiple interrupt support
  arm64: tegra: GPIO Interrupt entries

 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 49 +++++++++++++++++++++++-
 drivers/gpio/gpio-tegra186.c             | 25 ++++++++++--
 2 files changed, 68 insertions(+), 6 deletions(-)

-- 
2.17.1

