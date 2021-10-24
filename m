Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD9A2438846
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Oct 2021 12:19:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbhJXKVd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Oct 2021 06:21:33 -0400
Received: from mail-am6eur05on2086.outbound.protection.outlook.com ([40.107.22.86]:63488
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231438AbhJXKVc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 24 Oct 2021 06:21:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5icUx35QzKZcpsW4938keMAm+tvoRdIjtUldLcaU/4=;
 b=7Sx7+237xx4XyEjSne6ms74/o8hAFCzSGk+LAXLVVFQz25MiuRfzaCkXAgI9TmoiYBYsVOtBDfUqQmZh76ZeEK6kCh2Y1AkgY8qgkoedGgaPlRtcgXmy+cmCOGZ3pOq2Jui646HVnv2U9bKh1TDnTXHzQBy0qyQK/XHAjmfqgbw=
Received: from AM5P194CA0020.EURP194.PROD.OUTLOOK.COM (2603:10a6:203:8f::30)
 by DBBPR08MB6202.eurprd08.prod.outlook.com (2603:10a6:10:209::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Sun, 24 Oct
 2021 10:19:07 +0000
Received: from VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:8f:cafe::d1) by AM5P194CA0020.outlook.office365.com
 (2603:10a6:203:8f::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Sun, 24 Oct 2021 10:19:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT063.mail.protection.outlook.com (10.152.18.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16 via Frontend Transport; Sun, 24 Oct 2021 10:19:07 +0000
Received: ("Tessian outbound 8e26f7114b75:v103"); Sun, 24 Oct 2021 10:19:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b1d081ee49224fa8
X-CR-MTA-TID: 64aa7808
Received: from 64b2fa31ffce.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id C54EC48C-4809-4641-B3C5-3AD1D9E4B6A9.1;
        Sun, 24 Oct 2021 10:19:00 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 64b2fa31ffce.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sun, 24 Oct 2021 10:19:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZYVjoXlDee9g1nNKEmLNjoFrh28N3CkoVblWDdhD5j9Bhw9AsGRF7ZpQOWRgpZNnmpw0AmHoVZpwVwiBXdKcOWGzvthKEtSUrRn5OD9v2Pyh/YckdOW+OUrxGC4bu4hroRU8yAZPWxQ4T6c7DqpSLCJHMiitMtVhMWzHek5+oc2x1KMYMrXdNg5YyK3Gcl/Y3X1zJsNUPEVZQp3rXoSW7KUtO+e6pXjO9JsKPZy9pR9Wf+ekk+qwGk/MOjzCNbSxKwsiCjHkehq/JddV9HiQcuzzbZ0nqxWPY1lc4ajnIFzOSNMDB7X5RznckAT7YA5KArCIrxsq0MmPW8eifaOnjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5icUx35QzKZcpsW4938keMAm+tvoRdIjtUldLcaU/4=;
 b=kitiN0suQVes+/GuD5/m0ZlrDEwwUA3Mg++THAckQIzMdLsNz6DRxAhf1P/1imPyT7i7okeuaef5mStSQfTYvxjq1uoZ2LTnPrDjY0OKeeOc3HQmPxWhRpXKWeLAXW8adJFRNamRQbAaQsf9MB3Sk+EoJ/aiONIcdNkcZw1flJ2XT8a2ViAguF9UI9YwQkm0uFPpM/7KJnwFlYWmQu+xocmcCH/KPr1PVUANkadVPRcLi1MW4DnuTk7iohdOm0v3CnafT/aPwnOJlk5Kr/E2rlsilIKmnTJa+wMOb9dNwgbbOwjD+kGyQjbOuvtYfPCYdambnBMr7EfGPbec4EqDUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5icUx35QzKZcpsW4938keMAm+tvoRdIjtUldLcaU/4=;
 b=7Sx7+237xx4XyEjSne6ms74/o8hAFCzSGk+LAXLVVFQz25MiuRfzaCkXAgI9TmoiYBYsVOtBDfUqQmZh76ZeEK6kCh2Y1AkgY8qgkoedGgaPlRtcgXmy+cmCOGZ3pOq2Jui646HVnv2U9bKh1TDnTXHzQBy0qyQK/XHAjmfqgbw=
Received: from AS9PR06CA0133.eurprd06.prod.outlook.com (2603:10a6:20b:467::34)
 by VI1PR0801MB1645.eurprd08.prod.outlook.com (2603:10a6:800:4e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Sun, 24 Oct
 2021 10:18:52 +0000
Received: from AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:467:cafe::5d) by AS9PR06CA0133.outlook.office365.com
 (2603:10a6:20b:467::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Sun, 24 Oct 2021 10:18:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT029.mail.protection.outlook.com (10.152.16.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4628.18 via Frontend Transport; Sun, 24 Oct 2021 10:18:52 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Sun, 24 Oct
 2021 10:18:52 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Sun, 24
 Oct 2021 10:18:50 +0000
Received: from e124191.cambridge.arm.com (10.1.197.45) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Sun, 24 Oct 2021 10:18:51 +0000
From:   Joey Gouly <joey.gouly@arm.com>
To:     <linux-gpio@vger.kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Hector Martin <marcan@marcan.st>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sven Peter <sven@svenpeter.dev>, <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Kettenis <kettenis@openbsd.org>, <nd@arm.com>,
        Joey Gouly <joey.gouly@arm.com>
Subject: [PATCH v4 0/5] pinctrl/GPIO driver for Apple SoCs
Date:   Sun, 24 Oct 2021 11:18:33 +0100
Message-ID: <20211024101838.43107-1-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79be0f7f-ab69-4f70-5bbc-08d996d7b695
X-MS-TrafficTypeDiagnostic: VI1PR0801MB1645:|DBBPR08MB6202:
X-Microsoft-Antispam-PRVS: <DBBPR08MB6202197DD7825FE88211924294829@DBBPR08MB6202.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: PRDEX+MSXUaDMl1Ee3OObdrN6dwpLnuSwQKV/LOV4QY6dar+UFCFWPiI5p9smhbVcn1DYeF+euJfnRUBH/H8pCncJIorKpJvlPT8guLqywTh5Eq+EppNtTAlOpLdkOxlWEvwUnbzBJsWTQsT5wpZJEY6Ma3zNErSfE2ZhFhApLeGAkne0J2LK4lSc1imKQWzDkC87coYe5+hLOejTMmXnHry+0lQ7alXx9W9R4GkwqffNtQdNDjl/0VuOtItYFB2JvY7L3ntGqsYL6Xp1MluW/XPRPWa5QLkWjf113lS3LCaMTYK0N3wWITLSNftF15mc1CfhzbHVEcZlR0TB4sPaxtlXnveWqZ9bpdBbUSEKocwRLucW7RchSZVVc0krmxPI/lEVU5czHcGmF4kq3B04uuhqrqsA4esVStOrdSbT5pn1kmwMevus4m4wWwR0q4xJC3CzQBhkJgTAjMX9i0sVFVJYgleml8Rn+C360htXOQFLAP1IwKUhlfKwQNEUsUxIDoRV1FyV+O1hFXJe8M8yINVCyfS03j7IyFDuNKmX2kWMcNX+/T6J0RPPTXNirlV2SurilJsMj33H0WFUAjG80q/vlAIURAZCaWXbwx7Ro++HfwjecnSYGFQVi0PhFswaL0dzcei68XBdbLJ0ZAlAyP1KeExTVJvQtTuKBrwn1V6uG4XtcqHLbNsDWLV5HdYB9LwPI8DpY4zjTJ647P7nnhJs8JrrZGrRM0xN31PLxEPR3Y2Dfuy6O8UFf//xEqBs7vGNL1WBe4cBp5kZta/41PNkJ9bTCytXzkrfCRsbLlhHBBDap796axrCArd3ERtmgxX5luJztUNhMT91fOdfJ+46vcrixN6mNxLhCeKXt9+WE/6seqEZhc7DNvVA6icRcN3GI/XSA0RiH8iVgMu9w==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(6029001)(4636009)(47660400002)(46966006)(36840700001)(8676002)(81166007)(36860700001)(82310400003)(1076003)(36756003)(86362001)(2906002)(47076005)(186003)(54906003)(2616005)(44832011)(6916009)(8936002)(966005)(7696005)(26005)(336012)(316002)(508600001)(5660300002)(6666004)(356005)(83380400001)(4326008)(70586007)(70206006)(426003)(46800400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1645
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8b06d952-fc49-4d31-57f4-08d996d7ada9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7arWh1rDG+O5iGgW1cHvX4XZwz5RzjGeGjqNG+zrsqo+T18OeTPz9etg9845dMyXCFhLZuypgVaqw4vhpwRTWIe5sFPEPIx7DpOtx1MsQBq43pDtYX7BUfyFUUqLi4YC4RG5PXIaTBN0cpSEG1tpQIRLJ6RS6zfAbLvA+Lwdq7XNNRptwFJl12D0o5xRPT4UZzPYERFgIrW2IPBWZjAZFS2Yo0k1C2rHMTQWOT1duy+0+Q24NI3YzSIGg1eGvnHpWvNdq6RzqLVgUG0dtoBWcDNq1AcXZBz6tT+IwNfx797zZg5BSbGNrOo3SrOXtlJXkiP1sZdydQoEUrfXdSFqXWFF9pFAh+E9lKkXv2RDi1WLK9Z1OLomhy8qWNG+fW+kVAfN4bBdui8S3D6ihPq6TkK1VDV+i8lf1Ivs5miIOnr/gjA9slwmZG25mVYaRdaYyGT2ssE3pyHOo2UUPjmLXNV9Qec89Rp6zmixYjvwKoOyMVzYxPSyGSaQmKNkvaXoxN1CsMQuOSdk+K77DtWvC4fBaTRRs/E9M5Lt9G8mX9OKJTb7L1fzp34Yb+gzMepb+pyA6aNq1RFxaCO9LLZAajNIevHnF0yFFl0nMzcjPjqsLO/SF23n+/YYOUn/bmjmr9a2Cg62AK2L/NUQRdWvYAXw8O95w0UQl8CB8qZ/5WWy7BIIVAeHooWGgCK2Acwq3DpdEAHYA+k7JxEepO2jcWN3bzeUMrLv8Rqfzb9EqhiQinY0JdCR3lAav/MIs/PjQa5BRCHZmzIjs1D5X8RxZZX5JbFDqhhACX7hkoHQAMkAjuurrR0yL5VopkxKwMFVw6wx8Jpm0KkBOM/7NWa2uQ==
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(6029001)(4636009)(47660400002)(36840700001)(46966006)(70586007)(336012)(82310400003)(36756003)(26005)(2906002)(5660300002)(2616005)(86362001)(4326008)(83380400001)(81166007)(54906003)(8676002)(8936002)(47076005)(426003)(450100002)(6916009)(966005)(186003)(70206006)(6666004)(7696005)(36860700001)(44832011)(508600001)(1076003)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2021 10:19:07.3545
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79be0f7f-ab69-4f70-5bbc-08d996d7b695
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6202
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi all,

Here is the v4 patchset for the Apple pinctrl/GPIO driver.

Changes since v3 [1]:
  - Applied Marc Zyngier's review/patch (with exception noted below)
  - Removed "apple,t8103-pinctrl" compatible from driver
  - Applied Acks/Review tags


With Marc's changes, the irq_chip was being shared between pinctrl
drivers and I was getting the following warning:

  drivers/gpio/gpiolib.c:1456:

    detected irqchip that is shared with multiple gpiochips: please fix
the driver.


So I applied the following diff to Marc's change, to not share the
irq_chips, while still being cleaner overall:

diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c
b/drivers/pinctrl/pinctrl-apple-gpio.c
index 732c347a2bbc..ce037a5c15c1 100644
--- a/drivers/pinctrl/pinctrl-apple-gpio.c
+++ b/drivers/pinctrl/pinctrl-apple-gpio.c
@@ -35,6 +35,7 @@ struct apple_gpio_pinctrl {

        struct pinctrl_desc pinctrl_desc;
        struct gpio_chip gpio_chip;
+       struct irq_chip irq_chip;
        u8 irqgrps[0];
 };

@@ -369,6 +370,8 @@ static int apple_gpio_gpio_register(struct
apple_gpio_pinctrl *pctl)
                return dev_err_probe(pctl->dev, -ENODEV,
                                     "No gpio-controller property\n");

+       pctl->irq_chip = apple_gpio_irqchip;
+
        pctl->gpio_chip.label = dev_name(pctl->dev);
        pctl->gpio_chip.request = gpiochip_generic_request;
        pctl->gpio_chip.free = gpiochip_generic_free;
@@ -385,7 +388,7 @@ static int apple_gpio_gpio_register(struct
apple_gpio_pinctrl *pctl)
        if (girq->num_parents) {
                int i;

-               girq->chip = &apple_gpio_irqchip;
+               girq->chip = &pctl->irq_chip;
                girq->parent_handler = apple_gpio_gpio_irq_handler;

                girq->parents = kmalloc_array(girq->num_parents,

Marc said that hierarchical IRQ domains should solve this problem, but
I'll let him explain more on the list, maybe that should solved in a different
patch series.

There is a branch here with the driver:
  https://gitlab.arm.com/linux-arm/jg-open/-/tree/pinctrl_apple_v4

Thanks,
Joey

note: For those that have been testing this with PCIe etc, you will
probably want to also include the last commit in the following branch, as I
dropped the clock references in the code (due to the switch to power domains):
https://gitlab.arm.com/linux-arm/jg-open/-/commits/pinctrl_apple_v4_clock

[1]
https://lore.kernel.org/linux-gpio/20211016141839.45460-1-joey.gouly@arm.com/

Joey Gouly (4):
  dt-bindings: pinctrl: add #interrupt-cells to apple,pinctrl
  dt-bindings: pinctrl: Add apple,npins property to apple,pinctrl
  pinctrl: add pinctrl/GPIO driver for Apple SoCs
  MAINTAINERS: add pinctrl-apple-gpio to ARM/APPLE MACHINE

Marc Zyngier (1):
  gpio: Allow per-parent interrupt data

 .../bindings/pinctrl/apple,pinctrl.yaml       |  10 +
 MAINTAINERS                                   |   1 +
 drivers/gpio/gpiolib.c                        |   9 +-
 drivers/pinctrl/Kconfig                       |  16 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-apple-gpio.c          | 535 ++++++++++++++++++
 include/linux/gpio/driver.h                   |  19 +-
 7 files changed, 587 insertions(+), 4 deletions(-)
 create mode 100644 drivers/pinctrl/pinctrl-apple-gpio.c

-- 
2.17.1

