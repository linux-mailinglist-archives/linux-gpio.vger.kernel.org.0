Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D07FF44F41F
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Nov 2021 17:30:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235916AbhKMQc4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 13 Nov 2021 11:32:56 -0500
Received: from mail-eopbgr80058.outbound.protection.outlook.com ([40.107.8.58]:51933
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235909AbhKMQc4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 13 Nov 2021 11:32:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ybw7ItDLrCxC2rg2afPPQ4fFzv0XG5eVOPZVPJHJzdE=;
 b=rsomU56ch+PFngQBEciio69Nf7oR672ud3QlByxusX04yQAPAngishmvPrmkphjSvIOSLsVf2VhMMzhZTaO76es/rW2NLMHC6c+zo01U22oNWrpoDbl4sB0M/orL27GJM996w8IPalc+K3XnyYAQffZZ3zYCloASxPbttD0wZw0=
Received: from DB6PR0402CA0014.eurprd04.prod.outlook.com (2603:10a6:4:91::24)
 by PAXPR08MB7294.eurprd08.prod.outlook.com (2603:10a6:102:215::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Sat, 13 Nov
 2021 16:30:01 +0000
Received: from DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:91:cafe::41) by DB6PR0402CA0014.outlook.office365.com
 (2603:10a6:4:91::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.25 via Frontend
 Transport; Sat, 13 Nov 2021 16:30:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT064.mail.protection.outlook.com (10.152.21.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.19 via Frontend Transport; Sat, 13 Nov 2021 16:30:01 +0000
Received: ("Tessian outbound bc35e71e65aa:v109"); Sat, 13 Nov 2021 16:30:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 823869c72cc9b62e
X-CR-MTA-TID: 64aa7808
Received: from 8199b8d1bbea.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 62FDD2C6-C3DB-467D-84EB-F85CBE13DB27.1;
        Sat, 13 Nov 2021 16:29:54 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8199b8d1bbea.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sat, 13 Nov 2021 16:29:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hu4tp/Lb1fFAYvfUOhSYMYA4Dfy+1o/7DmGb8UlUGoWISt3gLFFPiE2t/OrBxcSqchhLxOXh2sU1ahdHSU9ug46S62JfmgXv8YBHnD678RusctFuWcih5j3+CT/TqmOhmrFryP10z74cSyEGklCrTRshtAT7nub4jHAfnaS9F9DVHg6bep2UefnaY7qh4Uqqhm6x06cfImeFXt5Wo4/H9AXhZBzgvipjepClIGyuPa4nFGz6VN92rPzTlSZEp2KSB+jxNU16ci+1xgpWTJvcFvTFSAyrwzGanVNqI+RKzbhof+tuppTprU4ebWrtvAcfNI36OZvXO9tuinu5YPRDIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ybw7ItDLrCxC2rg2afPPQ4fFzv0XG5eVOPZVPJHJzdE=;
 b=JwRdGcOAuvcnWVtSHiqFfQ4UEMitlHUh+VL/e7fEtSZIHmzlM+pB/810hgvarB3N/08vSpgjaELEC5wi4HjgLpJkamuvKiX1tKiEFFRt4DJGa6d2TfTUuPyWP3S6r0OFty+cfKIhlPV9ulGYYrLJwlyyQouoYFyIwSLE4dGkPt0BtEZluIRKXBRF8tRpcuVyJLakNxirRcP4im4NvoZjaEcJFFuGcMjAjEuSNTeRp8uMQAK97T9VF67aD0RoddeIOblIIP9nRomwI2PSqmPhwsO+HuYohY5jPxLKx3gp4SfiPx8bTh7lSPlheJVPr35HHVw2y2xWFR9797YNY41pRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ybw7ItDLrCxC2rg2afPPQ4fFzv0XG5eVOPZVPJHJzdE=;
 b=rsomU56ch+PFngQBEciio69Nf7oR672ud3QlByxusX04yQAPAngishmvPrmkphjSvIOSLsVf2VhMMzhZTaO76es/rW2NLMHC6c+zo01U22oNWrpoDbl4sB0M/orL27GJM996w8IPalc+K3XnyYAQffZZ3zYCloASxPbttD0wZw0=
Received: from AS9PR06CA0416.eurprd06.prod.outlook.com (2603:10a6:20b:461::10)
 by DB9PR08MB7423.eurprd08.prod.outlook.com (2603:10a6:10:370::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.22; Sat, 13 Nov
 2021 16:29:52 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:461:cafe::9d) by AS9PR06CA0416.outlook.office365.com
 (2603:10a6:20b:461::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.18 via Frontend
 Transport; Sat, 13 Nov 2021 16:29:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.20 via Frontend Transport; Sat, 13 Nov 2021 16:29:52 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Sat, 13 Nov
 2021 16:29:51 +0000
Received: from e124191.cambridge.arm.com (10.1.197.45) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Sat, 13 Nov 2021 16:29:50 +0000
From:   Joey Gouly <joey.gouly@arm.com>
To:     <linux-gpio@vger.kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hector Martin <marcan@marcan.st>, <nd@arm.com>,
        Joey Gouly <joey.gouly@arm.com>
Subject: [PATCH v1 0/9] pinctrl: apple: misc fixes from post-commit review 
Date:   Sat, 13 Nov 2021 16:29:35 +0000
Message-ID: <20211113162944.22412-1-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aefa88cc-0c79-4b24-5b75-08d9a6c2d70f
X-MS-TrafficTypeDiagnostic: DB9PR08MB7423:|PAXPR08MB7294:
X-Microsoft-Antispam-PRVS: <PAXPR08MB7294B3D81E0E82606C25EBFE94969@PAXPR08MB7294.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: cpOtu7UWiSpdBh6d5VNGc0Djs8GyD9T+bPNUS/zIyLtwMxVzKH3m2pr9d1NUXpMN/3MG4bLtA9JqdMRdtp4AD38MHh+CUdvIz3PvkVGaWUQz9/56UGuDNogQ9meTGBelkOj+xXw83ZJduNF8D7BX/F+t1d7OyQEJYK4hVn/twhLwN4u7BPVlXzBOcMgzIXCdnjyEiyH3FAa67qftz5n/9bEfdiyEefkAgjSyMwQCQGLh4P5iEglCE0x4g97vJHSKbTelL1jhxGx1SWO/DpQmiXvw0MrR48AJQfC7jwZm2QZRHY5IwtxaFSfA7FNUcREKqW4HDyfvUFxj+6y7Thme98fNp8wWKfYxDMQzWtBqa9++CBH9tjGWpwhiju8tTUk3egFpXsBKxgG1QH6myTCGxtITTfV64/dJNIvNOdHO4WnG9CNC7Hl3ww+n7nc40CBOejTfAGb0LaYMjdD5jhqDF3LuhefuWbjgrzNaaz9g62p2IUrTKzUucGF30K3DYMzshfvD3HFLBscYDIm2G5NDKWPTE76wBXaJ6C81QScJbjVE95JkeGdo+js+Z2Cz2HJWnzo0Xi2jpBGbmMxTuiPuV4vmbxdLDePpS0jHAdFoOtY3GVKyRMEFZuFESAmZ4vAeuFk60eb26bzaA2AYLS0ILHA6Nsv4G89LUnyUmWhsasX33LQfFPelBXlmt9jeCS6Zct6pCY4uQ8kj9oW2Ts4ciHUULLHMMPrpf3zd7TGRNws4y9dt+D+VFzdvfe9E0fce5jR8UOw0AS9Zolj2bhTe+ZdCJf52rMK3DOGUZIcizK2yWdUCjhNHLCRUVW+OPBi39cK2qNjx1E3+aooqI4wcwYjvxaheoJ5NzrplPXDQpT02+mxrm7U+qapLn6FjxAfbpykQghTsHrNP8WeG/xu3KQ==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(47660400002)(36840700001)(46966006)(83380400001)(5660300002)(7696005)(26005)(316002)(2906002)(82310400003)(4326008)(54906003)(8936002)(36756003)(336012)(356005)(81166007)(426003)(6666004)(44832011)(2616005)(508600001)(186003)(70586007)(966005)(47076005)(70206006)(8676002)(6916009)(86362001)(1076003)(36860700001)(4743002)(46800400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7423
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2e94f94d-f566-40f3-2ffa-08d9a6c2d1ea
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EX0xxQOxwmNF3XP7MUv/0lBwWqOtugDUoQ9VPbw1yLNDjReChIH9XF6fIUMFnzJBO5/5AlFxLMlUYWDGk4vZw5EJSCkzKEl2MvMR1ez6hmVjjk34f9N0Bt4ViQRgWj6MIG4FYQzX+F3ThjaOLxHYq+F2n1KTQ8GpuDVKzpMoOsvFybp2FMR5U78BWZjAKVb+ax/CmQ6RYQ7xuwgyJiEkMD183RHjasQFbyWccgOfdFav2rfE2G+WndUDUi7j7GMLliXAA0yYx0K7oD0bJCtdvL1VjDTvKb9FakrxPNd0Keu8+7Cih+raystYv0EPh3VejDviSyXMLgK5d+h/++OhuiuA23WS6JYDHgo+UOsDbYGgcfBipgFlRNoyuhrCwfy40H1ZfQVMPAgVR7OPfawwNuLKdRJDJ++MM9qkXI73PP//6n/XHR+6PjDS1kuL4riGTa2G3J0NFglhsiwbt1YGX+sa0qbYQMfu7J1iGw1nGfwe91Z+kaPdrD0t4BBcAs0FKMoMIfnxm1o/oM1AjRWOFPcUCfGD5YkB480ZerFMWEwWHtHEbT9xDrzu1FJgAEwxyxlzEu3R0XE1kZgZs3yxKbdog9WPjcotH1AdezJaYt9OEwZ92OQJHxqU/3rtfh1v8GZ+F9R6FC9XSZNhSqTUFpVnQx8CxzYotX3tToDhhougu6aVyILpDhNZPsyh3EnUoPS7em5SVX0J0Vrc1WoyEr1voKlN1Hn8BOl3YRt+kwF6GPy5iO20Kio+rR658Y25u/wNrO/Xawp3NE786RfkYsEZGit8EgdTex+EbElxQswYZyardqhG6gWZzs+bNKGfZG6r1wVqhOUbjVluQw9oy2j8KVRKLukKyo+kCgoLwa8=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(47660400002)(36840700001)(46966006)(316002)(5660300002)(6916009)(54906003)(47076005)(8676002)(8936002)(6666004)(508600001)(4326008)(70586007)(70206006)(7696005)(44832011)(426003)(83380400001)(26005)(4743002)(336012)(86362001)(1076003)(2906002)(2616005)(186003)(81166007)(82310400003)(966005)(36860700001)(36756003)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2021 16:30:01.1530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aefa88cc-0c79-4b24-5b75-08d9a6c2d70f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7294
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi all,

Here's a series of small fixes that Andy made comments about, after the driver
was already in the pinctrl tree.

Most of the patches are only a few lines, apart from the first which is a
whitespace only change.

A branch can be found here:
    https://gitlab.arm.com/linux-arm/jg-open/-/tree/pinctrl_apple_fixes_v1

The branch is based on torvald's tree, with Sven's recent fix [1] cherry-picked.
(pinctrl fixes branch didn't have Sven's commit yet)

Thanks,
Joey

[1]
https://lore.kernel.org/linux-gpio/CACRpkdZJVRn9zAC8t=_X=29+kWw2QPKBHd9wiX9C3ms+gte40w@mail.gmail.com/T/

Joey Gouly (9):
  pinctrl: apple: fix some formatting issues
  pinctrl: apple: add missing bits.h header
  pinctrl: apple: handle regmap_read errors
  pinctrl: apple: make apple_gpio_get_direction more readable
  pinctrl: apple: give error label a specific name
  pinctrl: apple: remove gpio-controller check
  pinctrl: apple: don't set gpio_chip.of_node
  pinctrl: apple: use modulo rather than bitwise and
  pinctrl: apple: return an error if pinmux is missing in the DT

 drivers/pinctrl/pinctrl-apple-gpio.c | 103 ++++++++++++---------------
 1 file changed, 46 insertions(+), 57 deletions(-)

-- 
2.17.1

