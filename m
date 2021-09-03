Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D09C83FFE0A
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Sep 2021 12:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349010AbhICKQO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Sep 2021 06:16:14 -0400
Received: from mail-dm6nam08on2057.outbound.protection.outlook.com ([40.107.102.57]:53234
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1348987AbhICKQN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 3 Sep 2021 06:16:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWUREdyj/4r59gBGd18GVswfwH7YfXCBeEqPt3SlLzn5GMUieMaQcxR6ipbzHpkqkiugfSQIl5kychz3FuxidK3ezIFVUlLZlbjidF5SP1J40RJUuJ9A1Bylw/IIpzPyqtDLJZ4dtE4J+LgcbZ0mxATlodY3biMW5KIf4kql5AGCs8iTRYqrymrygAk9dxwI3LyV2VvATIG2LRipuEdcxBc9ltZ/cYSEQ+s/33O52uCbCXerSLVv7H7tBe9SVCMjzbx3CKOlEDLwQXWUgN4a2/L5Zmjad2/J5YL/jwJIK94kcC63dTe4ATz+x2eqipOM45nVjw+YtMSgYRxihWZ0eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=VuIk28lCjfp02OHJsIQ3CXgUwRgOgKb0IbeATEFDDKw=;
 b=c2V6Htu28EpamUq2JpUaUZEtJYKB3oDCeuj/JeUX3C8Np1rMVwJaaw+ZdMjX27MsGif4ZYM2KEHp4JZcxg4fNfyYDIwryx+vMhbSh6mQGyc0n/KCpO6ooTJxzYgMhcccjMeDy5iWcsClcFeEdXaZ0NOMT2rJ5nMKYhyOEEfZbHaDsvOQtZfkGBDfO9w5CZ11KP/oyKPF/F3O0ON3m6WD70CCroRsJg7jlTuoqAuuCdbhCTN0ewJCnLDoWjH/UI59ISk+FwANs0k5yIehL3Yz27WSohEZTC90O4qs10eUYCfu5Vn7ufyH5P4JOylPRQp8QMoCCaUkOkxHRB+bOt1bBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VuIk28lCjfp02OHJsIQ3CXgUwRgOgKb0IbeATEFDDKw=;
 b=c+yEfesYhgK1X4XITTEPHGxaR7luwjkPI57OzPK3GfPPy2f6xxpILlXLKTTumbT7n9mQ0aE1tbx7wRJcuRpiPaoNzu+F+LT777mNumJLq7i6vYiDwXyY8+4YbfeEj8ZgDrO534sTgf3ueE3V61WyOGuTyBRQRBiQJsQ9J1ONjCsN7nsP19rwV1fUMz9zJztKYCm2pU9OtE6mmprTIaoIczgRjKjxUHjMXSgCdy7tgukSOGmcK1spaEwjXD5et9G70kGzZ49OmV1VudyG9fIn4rQrS0r7+Qftq+zVyq89AV4Kd1anaHb4URcvupoCp19vGMG5K/s2EEJjcTDYkIKHLg==
Received: from MWHPR17CA0052.namprd17.prod.outlook.com (2603:10b6:300:93::14)
 by BN9PR12MB5338.namprd12.prod.outlook.com (2603:10b6:408:103::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Fri, 3 Sep
 2021 10:15:12 +0000
Received: from CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:93:cafe::8f) by MWHPR17CA0052.outlook.office365.com
 (2603:10b6:300:93::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Fri, 3 Sep 2021 10:15:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 CO1NAM11FT003.mail.protection.outlook.com (10.13.175.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4478.19 via Frontend Transport; Fri, 3 Sep 2021 10:15:11 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 3 Sep
 2021 10:15:10 +0000
Received: from pshete-ubuntu.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Fri, 3 Sep 2021 10:15:08 +0000
From:   Prathamesh Shete <pshete@nvidia.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <smangipudi@nvidia.com>, <pshete@nvidia.com>
Subject: [PATCH v2 0/2] gpio: tegra: add multiple interrupt support
Date:   Fri, 3 Sep 2021 15:45:10 +0530
Message-ID: <20210903101512.32430-1-pshete@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4131ab1-de0e-478b-9487-08d96ec3b704
X-MS-TrafficTypeDiagnostic: BN9PR12MB5338:
X-Microsoft-Antispam-PRVS: <BN9PR12MB53385B309F49BCC7ABC22A1DB7CF9@BN9PR12MB5338.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nP464lFHJcVWWAiKAUeqcVsBLeN9rmKDkobZlBQ8JyQ/osZqUnom/53BD7YnwiuFUal9JCYP46K/qzW15pp44E6YPIkZwaQDV5Pc05MsKrTxwwvOtVA9d96ylaaSLSDlkUglojaZ0CFTwbb9b3TePcfFISxPQ/778B8X+6knUN4ahL/H5am15zEH64t+1rgUG9tXlA1atWl0sqVmCDKsHV1XOqGpwntmSbU1HqemOsHwVTI0UvCKVWOncRvc2ENxVfYOIOGElNwh4XBbekrpu+79cSGjrN8LrQRE7lCN5VkZpI3RmXMXrE+CQiJ9QCv+iygowqT6nSLwDVG9Htvf0r2Bf/0SiZJGs7v832mvSEfVKcRA1C6Wa4sLO1iVsRskixckbvv92ODIp/hQzwEdmkMA0IQomFdBWxU1VGnaNxr4Eg4qCQ36AOxC6DvNbhQ1Qq34NL9pE4o0zYczrQmoMWcKECV+py2MwP8x6axiP36eEBZ6Yxd7nmg3M5cyZwspoeP17y99ZsK03yibwRRyvRmCVc6d6JdsGPWxooGv1luc/GdR5QPW/aNWG043QlWNNFkwCDAAr5CdCBglF99DQyNe7XAaCbH5FPGnDZPcEPX6FyGbHukjx9wCyJznMzLjLcPdOCC/xLiqeABr8tjz5C7zz8ZC5EP6nrysDM765GXXK9S3dIUDhgCYxGU1T6p4IJdGXbaSR2dVcVR4xyZr/Q==
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(2906002)(7696005)(8676002)(426003)(82310400003)(54906003)(8936002)(70206006)(5660300002)(508600001)(4744005)(336012)(2616005)(6666004)(83380400001)(110136005)(70586007)(26005)(7636003)(47076005)(316002)(4326008)(36756003)(36860700001)(356005)(186003)(1076003)(86362001)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2021 10:15:11.6795
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4131ab1-de0e-478b-9487-08d96ec3b704
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5338
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

