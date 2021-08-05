Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFF0E3E1A9B
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Aug 2021 19:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239656AbhHERnM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Aug 2021 13:43:12 -0400
Received: from mail-dm3nam07on2086.outbound.protection.outlook.com ([40.107.95.86]:12480
        "EHLO NAM02-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232410AbhHERnM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 5 Aug 2021 13:43:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bk2x/4ioWt/2JfMmdHwdAh9oNqD6VbpH9hWiSfSKvNEcHeMm2zqPJTHfST4TgCN9VjAacZW4z8NGXOzOAoOpAW+GZ/A/1p6RbjxI9TTB9MlkJI+XzEmts6jXnD+c4ygmJOjuQewkIdmo+YbLI/d6aT9u/CY49tJEA38Q8eA6mGdJdgSioPZ9+VSncIoagKGO+Txp2Yb5AGapYjIZbGr+BdYUm9GzEG/nBbUX+wTyEMOGxPBMVglwo4ZvthhsG3YuUsxauNf1BNFZBw4JBfPKryPXC5sSdqRs8ESlgw0BGqoPtofSejyJcjR+JfqHX8uHnviCMmDg9N1fqQpFaTdmiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQOvpshLD6RPuD9ApWEkAWQbRGq1hT3UsN/U+jTyRGg=;
 b=COhlygLonUiJ756IbNBOSQHlyy18ttlcoYnhm/xkT+Cogq7W3D4XeGkE6w+HfqfxejQEAlyVFrwh02/6qeV7mAbIOGOOVTC5GPIeIp6S8MmTE1MGB+fAjtShiwAMyOzHkzAvnwCAWVE5fxnAXhu18MJOSQkYqGpfER/KCFtNN7uMIzjke97qcGkSg5d2uc69fI20GWWWxotza9LcYfY+wQUcbJ4gOJWViSQinV4a6wC4mNzgsMEyJ7zpo+K5HE3RJfHnxXONZBfVvGVVgfjZZjy7J/UB3lzGD503z2mWeVHO8LEXmDR4FVDR1o5sRpzrgupf1hdYWSJbcqN/b8/kiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=arndb.de smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQOvpshLD6RPuD9ApWEkAWQbRGq1hT3UsN/U+jTyRGg=;
 b=PXRDuhVUpQE219piMI8AGzDj7dEdC7W73cAcJbknzsn15qbvgexJvikt5LAgdd5ZbebHbTUcJTga/z6T2vFMmgjW+0bGtReP5DIL9PvxbqMt3UTJYzixyx/PpegaVuMLPmhUagSXLuNKnqW2MVHKqWALew5wY2QKBHpJiZs2KUI=
Received: from SN4PR0501CA0113.namprd05.prod.outlook.com
 (2603:10b6:803:42::30) by PH0PR02MB7589.namprd02.prod.outlook.com
 (2603:10b6:510:5a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Thu, 5 Aug
 2021 17:42:55 +0000
Received: from SN1NAM02FT0046.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:42:cafe::19) by SN4PR0501CA0113.outlook.office365.com
 (2603:10b6:803:42::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.5 via Frontend
 Transport; Thu, 5 Aug 2021 17:42:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; arndb.de; dkim=none (message not signed)
 header.d=none;arndb.de; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0046.mail.protection.outlook.com (10.97.5.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4394.16 via Frontend Transport; Thu, 5 Aug 2021 17:42:55 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 5 Aug 2021 10:42:46 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 5 Aug 2021 10:42:46 -0700
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
Received: from [10.140.6.35] (port=51088 helo=xhdsaipava40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <piyush.mehta@xilinx.com>)
        id 1mBhOH-0005Bw-0L; Thu, 05 Aug 2021 10:42:45 -0700
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
Subject: [PATCH V2 0/3] gpio: modepin: Add driver support for modepin GPIO controller
Date:   Thu, 5 Aug 2021 23:12:16 +0530
Message-ID: <20210805174219.3000667-1-piyush.mehta@xilinx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be715b52-313e-4461-5a71-08d9583874dc
X-MS-TrafficTypeDiagnostic: PH0PR02MB7589:
X-Microsoft-Antispam-PRVS: <PH0PR02MB7589B97E53E20EBD8366A744D4F29@PH0PR02MB7589.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n7z5RppScppR8JamlBEvn2l6wSBlDlGFpzGVrPEPjVEXeru2asLMe67dewTTxNLDTwhF2RsYZzY8NLrh0UjyGNwygA19/zrBjLnS2gFg9vWjsLlE5a6OcYIhgexzZuk1/gej0zngh9ZGBFjrzup+1FdiecZM7f9qzlrIjBgpZMZ0pyqI3yi6IQN4PhGW1K9c4ZXRzqQqvk4W4qiE7rI3FXNPRJRISMktYH0i7IO50US5pJb8GSolBrmNg7eGLqyJXe3Qlk2IXwkXM2s9AmNXEjO+/Ruq6L+XbQR0wtc3QPY9HaHnapSp12Rchj0e6MnO2I6LZR9STiMvkdjugmYmKXBNctN5BQeoT1D+PvnYz4BkyJwPFroWYrVpApMxhw0ZGoJtjEwh47cu2+Dv/7GjIjXkszm6yy21gI1IGgN4I7owTKmMkx0/2avzRmD6/TruAhi5KQIquVCGDBf5DEhHAFGex5XhWp3gughdEsxEMPrMV/JOm5kapmidmUxHtyY45f9dPGai9g2TdsWbob2PCHqrpfdvDZRucw71Q1lo6nvALxt6AyqpD1YaSIcWFMc8xXT5srpTS7haqxhif/3ycEaQQ7BfmkN0o7NOWPl7dOEf0frskJFrJrYAllVXie6AGNC5pPVuQ/+NIL7Kh8k418ddkE0eujtxhY9bEoG+bGeBiatRWF5FUT5ne8D5p0fGMfTLKDEe+eGcSXY7H3l6cerGLYWlFW46Abq+bPIhPFZREtmCvloNjx59NKM4z1lsUm4FTsNgtJoCqMxGHhRH9rEan7msHjh+gndaNdonKlqE5I+g+uO08cnVyxYKyqu4luoWIy+yeH32x6F1jQoo3Q0tknysg/UlK1/Ou52KLhWDwuaHJCa9VEa0qXXLY5Na
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(921005)(316002)(7416002)(44832011)(82310400003)(47076005)(6666004)(8676002)(186003)(2906002)(110136005)(107886003)(426003)(36860700001)(70586007)(83380400001)(2616005)(356005)(70206006)(1076003)(508600001)(9786002)(54906003)(4326008)(966005)(336012)(7636003)(5660300002)(36906005)(8936002)(26005)(7696005)(6636002)(36756003)(102446001)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 17:42:55.0847
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be715b52-313e-4461-5a71-08d9583874dc
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0046.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7589
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
---

Piyush Mehta (3):
  firmware: zynqmp: Add MMIO read and write support for PS_MODE pin
  dt-bindings: gpio: zynqmp: Add binding documentation for modepin
  gpio: modepin: Add driver support for modepin GPIO controller

 .../bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml    |  41 ++++++
 drivers/firmware/xilinx/zynqmp.c                   |  46 ++++++
 drivers/gpio/Kconfig                               |  12 ++
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-zynqmp-modepin.c                 | 158 +++++++++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h               |  14 ++
 6 files changed, 272 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml
 create mode 100644 drivers/gpio/gpio-zynqmp-modepin.c

-- 
2.7.4

