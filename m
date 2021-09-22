Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74390414B21
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 15:53:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232213AbhIVNz1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 09:55:27 -0400
Received: from mail-mw2nam12on2073.outbound.protection.outlook.com ([40.107.244.73]:17248
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232199AbhIVNz1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Sep 2021 09:55:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NVDEh97ExFhIFbu61eVlzPqGYv8spPnbQtnyzoaLagf/6PKCsLiJJ1ZgesFaUtsfYRf5G9UOGM3wl9ZoLAeD7y9H1Ukb0VNCwklZfcCwGnndbEoJy0OgeGf8V1ySw3GXmmGQSIwgxt8SWFsb9JWVYJsowgYMsQpAZ5TL+ET3WFexqRPvHeMzZ2FI7LKUBPksjx+yeFbzWanSxUXbfTKVZOsbE2hemtlxrWhA4r8ZMSQeEPLPu7KoOEIgBS27Gnej6jKn6qTvFrOV6EOyinUO2KhygEHhFR7L5D+BJ44p/7rDQfog87jgeykWk//0YkueK4eqpdeBIG9XZ5XhSACvSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=S4hWtuuxmFNfOJvjIReNI5CbCH1IdQRaIgDfvtPWlOA=;
 b=Sx5Ey7C2+gstCYcoBxrTd1l2yL30BiQT2HgRyi/GdKEuJyL54+8qEn9N5eXZcsI7fck+MRZB/8qyLat6A1ZdZrttqsFsqrnhtIThXalVEBeweQdurPWUssasos9j/yTQAXfJ9Lx/tclm4JNkZsr+N4TbDawbykaS48HvKrl7RRILkG0FkE3JpB+ueARaqZW3Kp45RN77daqY0QXfuOJy3ODDIC8/Y6zPOQH0I8IA1xFz7QeflrkBl6Pgu8fq3FMpwpgIyLoWSafMDscjZ2sYCpa2wUZRBdvN6TcCWmT0bjPwrLpzgx/E126CwUNOCCQbvt2k8QqhLO4rM1SX8cOCog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=arndb.de smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S4hWtuuxmFNfOJvjIReNI5CbCH1IdQRaIgDfvtPWlOA=;
 b=j8gSugDMWgxwcAW6+7rR/kk6YUsYr/ap18aBt75eHD1SfpaKvDOcA6mWLXf0BMIqbyj2lszZJTsTEeTwS//1eDggAZbHsKkYzmL1MRXyEwr7GEghab8goSYOiPhcGgDpQHFZgEH3QVV+KgIKehCvq5CvF3dejHgGf0TkmsvbS6U=
Received: from BN6PR19CA0078.namprd19.prod.outlook.com (2603:10b6:404:133::16)
 by BN6PR02MB2241.namprd02.prod.outlook.com (2603:10b6:404:2f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Wed, 22 Sep
 2021 13:53:54 +0000
Received: from BN1NAM02FT015.eop-nam02.prod.protection.outlook.com
 (2603:10b6:404:133:cafe::42) by BN6PR19CA0078.outlook.office365.com
 (2603:10b6:404:133::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Wed, 22 Sep 2021 13:53:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; arndb.de; dkim=none (message not signed)
 header.d=none;arndb.de; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT015.mail.protection.outlook.com (10.13.2.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4523.14 via Frontend Transport; Wed, 22 Sep 2021 13:53:54 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 22 Sep 2021 06:53:33 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 22 Sep 2021 06:53:33 -0700
Envelope-to: git@xilinx.com,
 arnd@arndb.de,
 zou_wei@huawei.com,
 gregkh@linuxfoundation.org,
 linus.walleij@linaro.org,
 iwamatsu@nigauri.org,
 bgolaszewski@baylibre.com,
 robh+dt@kernel.org,
 linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Received: from [10.140.6.35] (port=53850 helo=xhdsaipava40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <piyush.mehta@xilinx.com>)
        id 1mT2gm-0000im-9P; Wed, 22 Sep 2021 06:53:32 -0700
From:   Piyush Mehta <piyush.mehta@xilinx.com>
To:     <arnd@arndb.de>, <zou_wei@huawei.com>,
        <gregkh@linuxfoundation.org>, <linus.walleij@linaro.org>,
        <michal.simek@xilinx.com>, <wendy.liang@xilinx.com>,
        <iwamatsu@nigauri.org>, <bgolaszewski@baylibre.com>,
        <robh+dt@kernel.org>, <rajan.vaja@xilinx.com>
CC:     <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <git@xilinx.com>, <sgoud@xilinx.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Piyush Mehta <piyush.mehta@xilinx.com>
Subject: [PATCH V4 0/3] gpio: modepin: Add driver support for modepin GPIO controller
Date:   Wed, 22 Sep 2021 19:23:16 +0530
Message-ID: <20210922135319.3128153-1-piyush.mehta@xilinx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38a5ab98-3089-4d24-8e5c-08d97dd06ac6
X-MS-TrafficTypeDiagnostic: BN6PR02MB2241:
X-Microsoft-Antispam-PRVS: <BN6PR02MB2241E4246A8023601F28E695D4A29@BN6PR02MB2241.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:785;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zjS9bDzGV1hrkxqOMNvAWuSrblUQp9d+DixgokveBghfd7nuRXcTaD4zdAYA1fmx/06cxtVIBQ2Mky5J1q5iU/dUPmiM1ryyTQKMtsgZ0gzK3epZU9/xeQo87JLiRkjSCn2sGfHzMmOOVPP7oZkcOjtkeNPVcq4HTmaUOLxHT6qweJFIREFxY5AQ9Q1m9AT/pORaF5JKbCgeWN5i5SiSAY7AX6lpgSkvdW5Pva3ZezKnVE4Gpkc6ikVfD0GD2ol/qE/zRPD0CQi5Wx9vhdKwYcWejXRxXHrefjP5OBYBCmkCBj5k1Q7tqwXCTshWjS8ZKkNE5c/5geDyvAXM6YXrKH1PSur9YgzM4lgqUKBbtoVSg03jvd9wC2wKNboFBwQDjAwaSNRCsRerbtnKmWoTLia3PAIuTqmggGRTignpTnxh0U44BZsU38zHgMrbDw9fXOLSxwgH8AB8DZ3EzY14VMw8Pkdn8jTP5e6pBNsdbpEyufWa9Y2FsW0XLf6JJ08o3yFlfKedKcjw44he32Yt9ERh73u9Lipah/XADwwB0RmIleiOMavHABG59awmko7R2sVrlP55gK4gcw9MLTzS1cijYt1YEaZoQkARyoQPcVlHthEA6Bxau8ckDREqKZvu8ArntwZQxvbBL+znRovb//73weOH2zHXV5mTYlD/8iDYTkkp2hhtxKFhz+jYA1JMc3FmwRT6kVWT8FbfpObiwygeuBAsMXwi2Tr/7yxVRYI3O1zEk9GbLjZeQ0BmpUOvt42SDRf0s5SqMuL7RSSOopzoXX7bwcZJI1wG/l+2D45qz2zm9fFhoEXbIwxdoSWrnl7bJ1mFm+LwrNj8pitwjKkrBT0oD8jzZn+UnYU+9M5NCYWmFgkR+WhjKNqHxw5XDx7klMwTsqiZOl5Tq3pgI0T0Q4bAoTEBGlQZSVvhKds=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(36756003)(2616005)(186003)(107886003)(70586007)(6666004)(7416002)(336012)(82310400003)(5660300002)(36860700001)(356005)(7696005)(110136005)(54906003)(9786002)(2906002)(7636003)(1076003)(70206006)(26005)(508600001)(8676002)(83380400001)(316002)(426003)(36906005)(6636002)(4326008)(921005)(44832011)(966005)(47076005)(8936002)(102446001)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 13:53:54.6303
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38a5ab98-3089-4d24-8e5c-08d97dd06ac6
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT015.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2241
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds support for the zynqmp modepin GPIO controller and
documented for the same. GPIO modepin driver set and get the value and
status of the PS_MODE pin, based on device-tree pin configuration.
These four-bits boot-mode pins are dedicated configurable as input/output.
After the stabilization of the system,these mode pins are sampled.

To access GPIO pins, added Xilinx ZynqMP firmware MDIO API support to
set and get PS_MODE pins value and status. These APIs are interface
APIs, between the mode pin controller driver and low-level API.

---
Changes in v2:
- Added Xilinx ZynqMP firmware MMIO API support to set and get pin
  value and status.
- DT Documentation- Addressed review comments: Update commit message
- Modepin driver- Addressed review comments:
  - Update APIs
  - Removed unwanted variables
  - Handle return path for probe function

Review Comments:
https://lore.kernel.org/linux-arm-kernel/20210624205055.GA1961487@robh.at.kernel.org/T/#u

Changes in v3:
- Update example in dt-bindings documentation
- Update probe function return value
- Remove unnecessary print and header file

Review Comments:
https://lore.kernel.org/linux-arm-kernel/20210805174219.3000667-1-piyush.mehta@xilinx.com/#t

Changes in v4:
- Added input pin read status in modepin_gpio_get_value.
- Updated modepin control bit for out configuration.

Review Comments:
https://lore.kernel.org/linux-arm-kernel/554508f5-8cb5-3840-9f61-f6cd6e5745d2@xilinx.com/T/#u
---

Piyush Mehta (3):
  firmware: zynqmp: Add MMIO read and write support for PS_MODE pin
  dt-bindings: gpio: zynqmp: Add binding documentation for modepin
  gpio: modepin: Add driver support for modepin GPIO controller

 .../bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml    |  43 ++++++
 drivers/firmware/xilinx/zynqmp.c                   |  46 ++++++
 drivers/gpio/Kconfig                               |  12 ++
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-zynqmp-modepin.c                 | 162 +++++++++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h               |  14 ++
 6 files changed, 278 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml
 create mode 100644 drivers/gpio/gpio-zynqmp-modepin.c

-- 
2.7.4

