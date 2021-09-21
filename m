Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2A2F413D92
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 00:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235978AbhIUWcS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Sep 2021 18:32:18 -0400
Received: from mail-am6eur05on2078.outbound.protection.outlook.com ([40.107.22.78]:44000
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229804AbhIUWcR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 21 Sep 2021 18:32:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jAeYPN18xDgFzwzrjNujwtbByRcEkcNhP9T40qOBHoo=;
 b=xTiwbEB6DHTMG7BQLMbjYg3YWK0YH42maSDRuUJar44wgcoTHi/ifwjx8aH28G2uR0AaGz4vCtpCda6Xz1Mcz75azDmmbJsaeCodq8NFZ/6kWhLK+GZ50V+iAmpEIzgfwNfm7Vg6B2JXJLPElfl2HKYhkZLF1TQrxUI6+nUb16M=
Received: from DB6PR0802CA0047.eurprd08.prod.outlook.com (2603:10a6:4:a3::33)
 by AM5PR0801MB1827.eurprd08.prod.outlook.com (2603:10a6:203:3c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Tue, 21 Sep
 2021 22:30:39 +0000
Received: from DB5EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::55) by DB6PR0802CA0047.outlook.office365.com
 (2603:10a6:4:a3::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Tue, 21 Sep 2021 22:30:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT008.mail.protection.outlook.com (10.152.20.98) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 21 Sep 2021 22:30:39 +0000
Received: ("Tessian outbound c21c48fbc857:v103"); Tue, 21 Sep 2021 22:30:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f61e1587fb672bd8
X-CR-MTA-TID: 64aa7808
Received: from 288cc18e1f5d.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 27A3D24E-A576-4904-AD94-C18ED8095C20.1;
        Tue, 21 Sep 2021 22:30:27 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 288cc18e1f5d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 21 Sep 2021 22:30:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wo6ugoovdtgkmVrPhhnzgOzOXKPvA8zZrlstWDgfO8q4zvjL/lpxv+Ri5VFoc3LeT1m3CZUT+cYeY/5J2WTlySHsR2XR7pqTheaVoZQjZmLPk53v5mSxKi3w24kpEZ7BRyffJK0gSpqsxyFL0wITiBvMQ+uwWwAjc/sqjVhWHEqbrslR5naFVjqhONQ8lEKD99+PjgHVpvbDjezrvl2xBXnttZm3bZNYWB2ucVGRes7A3hr0goCuKDvGy67d/3dB+7A1heCWIb14yDDsUlpPUf36STvJCKaEZWgKKpfWg+Z8u4mxpnooOw2239uAWvjc8Aq0IP67Ikof3IPLL4Vv3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=jAeYPN18xDgFzwzrjNujwtbByRcEkcNhP9T40qOBHoo=;
 b=ctqlSk+GY08WmyX8kkSLoYPOjpSqmK8EEp5z/Wv/xs6oFfwOrfyqSOoQOjBhmDSZpeFMoiKEch54ok3Bf9T71jI1bRCVilLNnwKQeU+RX7ihMVwUsR+OXvW98qNqp6zgHO57Q40bLfQvePQnxo0am8yX+wASXpiFvfuQNw//wDJ/ONLndDtFdsHlw4rAaWovyehrsS/T9i8+jHFCii3gd7TX7jF++hIXRP02mSp8oeikSq30gNYmiMd5Ek7cmT3+Y38uj3sLSeTMPGZHZOKMcc1/XF2SglefFDwc+2NeYAweer+d5zX0qNihYX/PYGRHa3HKdoQbvwxDjgdemkbVZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jAeYPN18xDgFzwzrjNujwtbByRcEkcNhP9T40qOBHoo=;
 b=xTiwbEB6DHTMG7BQLMbjYg3YWK0YH42maSDRuUJar44wgcoTHi/ifwjx8aH28G2uR0AaGz4vCtpCda6Xz1Mcz75azDmmbJsaeCodq8NFZ/6kWhLK+GZ50V+iAmpEIzgfwNfm7Vg6B2JXJLPElfl2HKYhkZLF1TQrxUI6+nUb16M=
Received: from AM6P193CA0037.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::14)
 by DB8PR08MB4171.eurprd08.prod.outlook.com (2603:10a6:10:a4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 21 Sep
 2021 22:30:23 +0000
Received: from AM5EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8e:cafe::23) by AM6P193CA0037.outlook.office365.com
 (2603:10a6:209:8e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Tue, 21 Sep 2021 22:30:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT045.mail.protection.outlook.com (10.152.17.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4523.14 via Frontend Transport; Tue, 21 Sep 2021 22:30:23 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 21 Sep
 2021 22:30:15 +0000
Received: from e124191.cambridge.arm.com (10.11.7.12) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Tue, 21 Sep 2021 22:30:14 +0000
From:   Joey Gouly <joey.gouly@arm.com>
To:     <linux-gpio@vger.kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Hector Martin <marcan@marcan.st>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sven Peter <sven@svenpeter.dev>, <nd@arm.com>,
        Joey Gouly <joey.gouly@arm.com>
Subject: [PATCH v1 0/1] pinctrl/GPIO driver for Apple SoCs
Date:   Tue, 21 Sep 2021 23:29:55 +0100
Message-ID: <20210921222956.40719-1-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ac1cee8-621f-4b7c-6a55-08d97d4f7083
X-MS-TrafficTypeDiagnostic: DB8PR08MB4171:|AM5PR0801MB1827:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1827337F12A018418222E01094A19@AM5PR0801MB1827.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: zridZjOgFT/LP5evp2zZWc6EHl2uUXgg4hNMNohoxG5FuIp7kCJ92uu2PUR0CzGODQRNVeU9o83Hbk/Sun9iON+mVcIcItWEp9TgswvrK/z1hk5NBUf5A8XobRmkQwnYNZ2GLomhzzwhuCNWFG+bu/ZCMHJnQUspm+bVLBvMZ7oYCZt1ps8JzlIw7sVxQLqoNR+PmEjDwiskX8VpqoodMAa/SaUrJsKCf8VAJd2ziZNKnt4wfQYuDrVsWqglRwcyzcunP1wJm5q25CrmYJVXjpAovwqYMVUhxmIZavDWCbUfTKlBYanbCjRlxWox0WYlIWOQ/hXi3va8CwEot1ej4ZZWThwlo844ns78Y3PPJoCF+KD5CTxr5izB5u6HlPlcXDFmtjpDx4K1TW9t1gN2YZAP3ICSY0Yehqc4VGB61EATRqmx1gXY7fSfcJqYw2EUijW65YSSjrTIApCow202FD+09tjzuLYQL3DI7FAG6Ns6Ni3BfIV0yRxeUaIoijGsFx0oDdmypZKDEnf+ecMSDq5VA1kWo2s/+sMGRr7zjKtSuIjy5D+OYa1+ha21K4wHh3mECIlgqT3eXa8c/ze+fsgaujNl6NlW9xu1oWIupFa7yRi8RmjI3sQF3qpb+2RVafA1t/ZASYIBoBXiODpzEKrpfsy0D77hnHX/uA2vOzJzIvDbhY1VYz7k1jsyc/nke/c8+5dvEIrze2PuuUt/t1w7F0nA0nCp2MFexgA52231h6xKdvAk0goub1nKykDqkEvY25oMCe8vv5H8i8WRJK7wfBL4MNy8xChiz5PvPj/iYBH6QH75TfXk7R9bhL3RXfK0ioB021HC3Jx5FByWqkG/T6z+KIqxR5Q5HMKPyv9ouHz7gh23gl8XB4ROazKSGXLxn5zWP3QWFukepz7UcQ==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(6029001)(4636009)(47660400002)(46966006)(36840700001)(82310400003)(4326008)(8936002)(54906003)(26005)(2906002)(44832011)(2616005)(8676002)(83380400001)(70206006)(7696005)(6666004)(6916009)(86362001)(508600001)(1076003)(316002)(47076005)(966005)(186003)(70586007)(36756003)(5660300002)(36860700001)(356005)(426003)(81166007)(336012)(46800400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4171
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 25310906-ed98-4cd1-e11d-08d97d4f66ea
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LUnwaEpGW1IeaQdsbcT64zsAAA9Svp/hoLgIFheczkA70YTffUFly8z26/J6cSye1ndW8o09zaCenHTiHSmZ4Fujj3KXeZuLHgn09ss9RLGFZz190Dp4jduMrx4kw8ru8rdz5UapLkwHXKY2N6Yjn/GzBnLIXMJ7XPI4BjKmnIGIhkyi31Z04q0w8E1FAt1nA9AXDyCnPN+MuNKID+YY7EQvUE4p9tXjBV/ndWTj4dG8GhDre6WZESa82l2o4LiO/sPEWmYm/MUiB1kakr+LnPQ/X8dXxI6xLvHhuCvs48bvmOcy62QkZ1qGjNfgtQQ4pZEwWMSBJi7cG0R4mdEBsz0FrXxUYoKugqn1RdXj2ysqEPbf/spBRTBl/5UZfIWV6ok0/cdXsyaut3LpxUTXvMn/fu2qKgRF+r+YKv7Ao6Qf05O3xUBX+rZkhQ/rzQJWX3wpzGSAmBGegh4kEcJqTm2PhcHB2UvHA4gHq3z0iJw7m9UTLV/xOQkMQQbxV8g2PrPNxEau7N74BNufENHMuul12xIJFgIMdYDotfNj7PZy8zT/hbAKyZThHzWKH4g5OetbZ1QhFaIoXu6HTRXV8lqFczu3NUM3yhJBgLzsfB7wI7MmulzZ7xRxSoQR9dYG/cXqR7FyxiJ3GuE5OBJCnukPDNp95zpxI9Iq9bB8X0gh0MOtRvc4VBfwRPPXQNl8HZTlAzKpyJlEBhmetUq/A1MEsReTYhlbwGUptt4bgruPdreoda2SXh5mnOPITt0gnhmScQoePtX8qgIJP4UwuFLCPNwZQKczvyiQ0r7chEaLXHON2umdIRaep/1NCmibvK0cGRoJtqGyK5TBpKN7Ow==
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(6029001)(4636009)(47660400002)(36840700001)(46966006)(426003)(336012)(26005)(82310400003)(186003)(1076003)(86362001)(44832011)(6666004)(54906003)(83380400001)(966005)(47076005)(316002)(36860700001)(8936002)(6916009)(8676002)(36756003)(81166007)(2906002)(5660300002)(70586007)(7696005)(508600001)(70206006)(4326008)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 22:30:39.3114
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ac1cee8-621f-4b7c-6a55-08d97d4f7083
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1827
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi all,

This is a driver for the combined pinctrl / GPIO hw in the Apple M1 computers.
The driver is based on Corellium's driver [1], and has been rebased and cleaned up.
The bindings are in Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml

This has been tested with out-of-tree patches for the keyboard on the Macbook
Air, it has also been tested with i2c for the USB PD driver and PCIe (all
out-of-tree drivers currently).

I left two defines at the top 'USE_PINMUX_GENERIC_FN' and
'USE_PINCTRL_GENERIC_FN', I wasn't sure if I should use the generic functions for
getting the groups/functions, so I left both approaches in and will remove one
of them for the next version! Which approach should I use?

There is a branch here with the driver:
  https://gitlab.arm.com/linux-arm/jg-open/-/commits/pinctrl_apple_v1

There is also a branch which contains all the commits as I was
developing here (and keyboard drivers):
  https://gitlab.arm.com/linux-arm/jg-open/-/commits/m1-keyboard

I look forward to feedback!

Thanks,
Joey

note: I'm sending this from my arm work e-mail address, however it was done on
personal time.

note2: For those that have been testing this with PCIe etc, you will probably
want to also include the last commit in the following branch, as I dropped the
clock references in the code (due to the switch to power domains):
https://gitlab.arm.com/linux-arm/jg-open/-/commits/pinctrl_apple_v1_clock

[1]
https://github.com/corellium/linux-m1/blob/d5ec2a737e64de23a21025f9eddc554588deb23f/drivers/pinctrl/pinctrl-apple-gpio.c

Stan Skowronek (1):
  pinctrl: add pinctrl/GPIO driver for Apple SoCs

 MAINTAINERS                          |   1 +
 drivers/pinctrl/Kconfig              |  13 +
 drivers/pinctrl/Makefile             |   1 +
 drivers/pinctrl/pinctrl-apple-gpio.c | 652 +++++++++++++++++++++++++++
 4 files changed, 667 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-apple-gpio.c

-- 
2.17.1

