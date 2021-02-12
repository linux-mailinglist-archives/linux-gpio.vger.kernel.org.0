Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C20B319DEB
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Feb 2021 13:12:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230260AbhBLMJV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Feb 2021 07:09:21 -0500
Received: from mail-dm6nam12on2046.outbound.protection.outlook.com ([40.107.243.46]:49120
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229650AbhBLMJU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Feb 2021 07:09:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NRcdOnIGKWqkDtALKS9PvNVKYQmNCNO1a1dIO5U5q/N+WwRYJaOjfrGrT0KaFfDqOHQBD9GsYzB4c4ZG4wncxHgc08RhFs3NEiVEz2GrlyTRqPgx2/RFfVxqFcTuiNeGxT+isOZxsVocvRuNuGQ0zpZWTYpWtjl0IU3qoeXJxRA8j20/W+FC7z7ZO6hetxvDtGqNRmoO3z/HmaWBMjjtQ30WEbOkK138Eg8yX6drNuhUhIAd5lXKgG3+ZhSZIQ1jLufN2oWaqRdmt9WbK/x0N244xgbL5ULcEOcME7NSyG1UziPbbbyWHd87R9H8l0NiMZAZcgPI86J3T7reqZipdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ETtCIIgTT0lD7mkStZLR4kBDZP6Lp5NBM4hZYdDaPic=;
 b=LETCF7bAZ2oZvgJQ0j6FzRzkl7sqnfAuJeLBpHxZIeEGmPYifa74qSsmeLFUSI9JvDTe8SInTIFxl6QXp76nXF+axcO1pEs5HdK4XBdl7iojcQKiHUP8ftX1YqnbXaJGBVWp/hwl0dzR5ylvBY+Ze8kqjgaHTor4PXT/mUTS5FEcTuxD7XzSxVVmmZYdbkslBGl45MMJ5qYcze2hLUICEF+rrxynyN//0AJsg3feZ//R72h9uZdOCwMg8FIlqv0nCxo3rdRmkjhgU6G3+f9v4d6/Yj1Vh/maQqLpaObaS0cHpdQ6RcGpeOcw/uVuRCt+5rQViL2hCKQJI8kspFaPjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ETtCIIgTT0lD7mkStZLR4kBDZP6Lp5NBM4hZYdDaPic=;
 b=Go3hAnRSrCIvFIzhwn6gmbY/RQWYel8z1ka7JLJmau9zgZ0dgA9RVgJoN5WPt4E5SoxTJr0/IqFc6MGBK5cj7oIJoX7O90lARXms4GOC2vXFbZ7frPOlm47qtul10ZXkEMYCY1qw7ryw4vVDMo/coBA1xQ8uTt0rllxFauUxgNY=
Received: from MN2PR01CA0040.prod.exchangelabs.com (2603:10b6:208:23f::9) by
 SN6PR02MB4416.namprd02.prod.outlook.com (2603:10b6:805:a4::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.26; Fri, 12 Feb 2021 12:08:27 +0000
Received: from BL2NAM02FT056.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:23f:cafe::16) by MN2PR01CA0040.outlook.office365.com
 (2603:10b6:208:23f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Fri, 12 Feb 2021 12:08:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT056.mail.protection.outlook.com (10.152.77.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3846.25 via Frontend Transport; Fri, 12 Feb 2021 12:08:26 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Fri, 12 Feb 2021 04:08:11 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Fri, 12 Feb 2021 04:08:11 -0800
Envelope-to: git@xilinx.com,
 michal.simek@xilinx.com,
 saikrishna12468@gmail.com,
 robh+dt@kernel.org,
 linus.walleij@linaro.org,
 gregkh@linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.106] (port=53718 helo=xhdvnc125.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <lakshmi.sai.krishna.potthuri@xilinx.com>)
        id 1lAXF4-000326-3l; Fri, 12 Feb 2021 04:08:10 -0800
Received: by xhdvnc125.xilinx.com (Postfix, from userid 14964)
        id 3A80B1211F7; Fri, 12 Feb 2021 17:38:09 +0530 (IST)
From:   Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <git@xilinx.com>,
        <saikrishna12468@gmail.com>,
        Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
Subject: [PATCH v3 0/3] Add ZynqMP pinctrl driver
Date:   Fri, 12 Feb 2021 17:37:20 +0530
Message-ID: <1613131643-60062-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b05c541-3d4d-4892-64e2-08d8cf4ee765
X-MS-TrafficTypeDiagnostic: SN6PR02MB4416:
X-Microsoft-Antispam-PRVS: <SN6PR02MB4416A514179131D2EF596740BD8B9@SN6PR02MB4416.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cA9JiqpKzIBCR63F8dvfTKCliGx6E4k6pZpB7OIWbjZUbS7oNxcrDu+4gc4bm+FjfOTNsRCl0PBl+S4eunNbtZ9PRtgT8sfwB9puw9m4ppO1prMXbC9jCQHLEk3LGh6xJ5qQjnbWdgv5WHk9QU9j1Rnyr+jbpOoACLckhGLceOdvyELI433Es360/9yuHYaI0QguIC2joYQ+bAfNcNBP3Q7yRwIGSUH2v2M1s+YmwZ9DfQhipLaxQ6J0R0bri2XjGZwUf0weeyaNRLKFVnJ1Rbvfc5Gwnj4sDYKMyGKX341Z3jW1ci51DcbMeUckMqSo5F4jGzSDDxjjZleH77462Sp3Rh6my4PGse+XpLP336DdYysseoFcKOIeW8/RFzEuCr7SNO2Oda3NsKgwEcFQc0cRTNx2PV9q95ZWh5aj9WKcTeRc8D2d/De96RzlkPnpt8xidjafB/QjnHoj5muLRlPe97gEGpeh23Vy+gV8fZ/lp8jWeKEYmmWIxeBhfkqDg/BzAEvVxIWnXsRQy37z8Z0dnDeKELz23hUKsRuAeIb1W/sA4NdTYInCCq6I7BbqMxUNIqn49gNhvDYlQVr6eih4C3m3AYG8eQEtlEo/bKJlIOklhG6Zxf2LnRF1jLOliXuLgVleqnLpVVlDInQE0ml99yLoq69rBA4UUoZGgEHkptRfBdOyRltZaQaHR0RK
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(346002)(376002)(36840700001)(46966006)(5660300002)(70586007)(36906005)(316002)(70206006)(7636003)(6266002)(2906002)(47076005)(4326008)(36860700001)(107886003)(54906003)(42186006)(110136005)(83380400001)(82740400003)(426003)(336012)(478600001)(6666004)(82310400003)(2616005)(26005)(356005)(8676002)(36756003)(8936002)(186003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2021 12:08:26.8096
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b05c541-3d4d-4892-64e2-08d8cf4ee765
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT056.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4416
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for Xilinx ZynqMP pinctrl driver and also update the
Xilinx firmware driver to support pinctrl functionality.
This driver queries the pin information from the firmware and
allow configuring the pins as per the request.

changes in v3:
- Fixed binding doc comments from Rob.
- Used 'maxItems' for groups and pins properties.
- Updated commit subject and description to have
present tense statements.

changes in v2:
- Use pattern for pin names in yaml file.
- Updated to support multiple groups and pins.
- Added type ref for the vendor specific properties.
- Removed 'schmitt-cmos', instead used common properties.
- Removed macros for drive-strength property.

Sai Krishna Potthuri (3):
  firmware: xilinx: Add pinctrl support
  dt-bindings: pinctrl: Add binding for ZynqMP pinctrl driver
  pinctrl: Add Xilinx ZynqMP pinctrl driver support

 .../bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml |  339 ++++++
 drivers/firmware/xilinx/zynqmp.c              |  114 ++
 drivers/pinctrl/Kconfig                       |   13 +
 drivers/pinctrl/Makefile                      |    1 +
 drivers/pinctrl/pinctrl-zynqmp.c              | 1031 +++++++++++++++++
 include/dt-bindings/pinctrl/pinctrl-zynqmp.h  |   19 +
 include/linux/firmware/xlnx-zynqmp.h          |   90 ++
 7 files changed, 1607 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
 create mode 100644 drivers/pinctrl/pinctrl-zynqmp.c
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-zynqmp.h

-- 
2.17.1

