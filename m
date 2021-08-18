Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B24A3EFEBF
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Aug 2021 10:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239560AbhHRIL3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Aug 2021 04:11:29 -0400
Received: from mail-mw2nam08on2069.outbound.protection.outlook.com ([40.107.101.69]:17587
        "EHLO NAM04-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238692AbhHRIL3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 18 Aug 2021 04:11:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AfpZN+AZ+w5wn2A23ey8t3SEMIrReskJlGU0wMCwy+OFAwHZnqHdyN1/ARxu4xEfM9LTMcKEqKc/WpUq1krdmttYuw2q0g3n8RVx8EmsPFo4VuI5Urgx0xjMKj3GnxqM60km6cvMbGngSmeghUO7ILpSrLUHxxbkGfyDULG9MhvWQexL496En5/UkZPHiLBtfIJ3GZ1VqY4qYpmW3pxEVGBZvf4inRFY6HPzU29jzIRyfFqj69LyUgw32uqo2BjP44Cmx6GMOP/RIT37K6hA+fJ88C3NdArTiVp267wvn66dgSEWNUCmkieR2VEg8MwIIZIsRZqLvK+WFq6m/nTmjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZmrnu+YrNtvnJ4HajfbEtC8rrcah/XjYpgICo7nqkg=;
 b=h4SK+NZD9cL1/JtImZtdiuzsDxRj+qnHaC30dL1mnxHXZhkTpANy0tyDR45+ghld0JMN1NjDOOcYzCtBEGkM5JdV3QC08G4aPL9VjO69rY0Fd1dMOtH+svv4PYeH1VEMjk6mU0rkGT70+VLpDN+TTq+98OsZNT9fk9l6MORpQa9CL3UVZ+iIZ6X/zQ+g4OgkUd4Sh02LbpoSgEn1y5kQWimxPBRbDIa9TSTXKt7R6BlTb8trKix7Ri95YxpmayXNE0VQ2Sg5yXVyIt7qt7btCHi8xHSipheDISLmOj6iQ9P6vBrwQ+KnpGO8/19hlyFEVxgrmxlyYrhGNoOeZ+MSrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=arndb.de smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZmrnu+YrNtvnJ4HajfbEtC8rrcah/XjYpgICo7nqkg=;
 b=HPKEMiyotOvV/e7csRA/QwJwa7EE/Bo16+uaZmLHp8x1AtWSYaFnZgycqd9Q3Oo8T01SeVizmPTcpEJVQtqPnIWwwQGSxpjx2BCu8XMO09tRHO7qKFSNHJnxPm4aQ2MllAI34IKaid039s9jUc5I4dR0Seo9hOEp7dxKR6SQAps=
Received: from BN9PR03CA0930.namprd03.prod.outlook.com (2603:10b6:408:107::35)
 by PH0PR02MB7208.namprd02.prod.outlook.com (2603:10b6:510:19::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.18; Wed, 18 Aug
 2021 08:10:53 +0000
Received: from BN1NAM02FT004.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:107:cafe::b7) by BN9PR03CA0930.outlook.office365.com
 (2603:10b6:408:107::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Wed, 18 Aug 2021 08:10:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; arndb.de; dkim=none (message not signed)
 header.d=none;arndb.de; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT004.mail.protection.outlook.com (10.13.2.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Wed, 18 Aug 2021 08:10:52 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 18 Aug 2021 01:10:31 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 18 Aug 2021 01:10:31 -0700
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
Received: from [10.140.6.35] (port=57498 helo=xhdsaipava40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <piyush.mehta@xilinx.com>)
        id 1mGGec-0008z4-GU; Wed, 18 Aug 2021 01:10:30 -0700
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
Subject: [PATCH V3 0/3] gpio: modepin: Add driver support for modepin GPIO controller
Date:   Wed, 18 Aug 2021 13:40:15 +0530
Message-ID: <20210818081018.2620544-1-piyush.mehta@xilinx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44bb71aa-3740-49d4-dd43-08d9621fb280
X-MS-TrafficTypeDiagnostic: PH0PR02MB7208:
X-Microsoft-Antispam-PRVS: <PH0PR02MB72087BC35264C5A2A8D2F47AD4FF9@PH0PR02MB7208.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:785;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JNNDaeTve4PgMzBRTbdd3rmR6JQo2/bbr7k6xpu1mvkGG7PJD9Q4ZZ/kt78kIij/iL5aMJErfBulIi1BJRqZXujY+Y8bQkD+VLbeEZW2vTrn+vF/rhDpkrenVZ1MpXZBwBQW6FK3sunDrBk2WWzv9ckf6ljKG2pM/qwgjD4FTxc8gPYiXI9gP/h/fQn5yK13VCXeeq4pMgAZVxYwdBgvyjoGQR2/aq6j6HGCCNdsBDwlipFX/Sye3dyK7d8mMfj6O9Oj5Hz44LNgXZrcVwrjqHKhT6vtfeiwAY/ZWA8D9lxS8gSj3FY8Ljx/rzGhkLK7ChawmHMP7qO4noEXB4Vly+hhfq41H3Etc3D9Kkh5ivXYUxARYnkO5FwjOFq5/mv2H9TWCkPIB0ARkJ8UNG55D/q6PcmPOWYfKI/jHaDc2w3ppHoQAM1Zf7XFX74NLAKkjdWOqTPNyT/uHHlGQYlUQZ4D4CeCvU3z6dH3xc2/0iBQFZOvwAWERrg2+Tlklk//lEjvkPVZMv+Y7msRnWFrD8skwKjQCmbHBygHOHrw+U5HBinD/ZnKbrTyHH9p+PRDPi0kdymmBr91GsObiLpqbvPMyFDsgyNZ4AVAlBGXrMF90BTiLbuObPukySP3zUqEGHlG28uuvhFfF+YgozUs2YUCU8DOXVrYAxDuupIVKJiXc4HspmyKblsr7FEhV0HXwkm+t6S2zb9sq3WzWwYrvrJeS8c+wKN8m9lBVWeLuZQ2SyZOPsYuo6DsgUefWeNoMCSrxSRVNDPkFhWJmiLZkTKlrx+/cwQm5e85tQijx8nnTRQQ2IxYMaVyMPiGKA8cXHkWpUkQ12nO/ZZmR7+S1l/B8/6v2lq79rqSVZHrsU0Tg3IbZcRkFarZEeD0BEpasAh8Q9INU4GAqNYCmZ9EfOULlymPcpdQJL4cteWhV3w=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(39860400002)(396003)(46966006)(36840700001)(5660300002)(36860700001)(36906005)(44832011)(478600001)(26005)(54906003)(186003)(47076005)(8936002)(36756003)(6636002)(7636003)(316002)(356005)(2906002)(6666004)(4326008)(110136005)(7416002)(83380400001)(966005)(70206006)(8676002)(7696005)(82740400003)(426003)(9786002)(336012)(82310400003)(921005)(2616005)(1076003)(107886003)(70586007)(102446001)(2101003)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 08:10:52.6604
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44bb71aa-3740-49d4-dd43-08d9621fb280
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT004.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7208
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
---

Piyush Mehta (3):
  firmware: zynqmp: Add MMIO read and write support for PS_MODE pin
  dt-bindings: gpio: zynqmp: Add binding documentation for modepin
  gpio: modepin: Add driver support for modepin GPIO controller

 .../bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml    |  43 ++++++
 drivers/firmware/xilinx/zynqmp.c                   |  46 +++++++
 drivers/gpio/Kconfig                               |  12 ++
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-zynqmp-modepin.c                 | 153 +++++++++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h               |  14 ++
 6 files changed, 269 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml
 create mode 100644 drivers/gpio/gpio-zynqmp-modepin.c

-- 
2.7.4

