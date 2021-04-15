Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A4A3360804
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Apr 2021 13:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbhDOLPt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Apr 2021 07:15:49 -0400
Received: from mail-bn8nam11on2068.outbound.protection.outlook.com ([40.107.236.68]:41408
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230056AbhDOLPt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 15 Apr 2021 07:15:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5q7Vwkt1jGAC85xUNexQQuKfwWOYHMggDqasiSBGeFa/RIfgsZoP/7/9WvknLw0IFrB045lSxJ7+RK0ziv2CyW1N3hhRv2d5ilG3wFXXrz1k3wYS7HoJSCF9VMR9yIM7Nku5MZVDRjbLxjwApkn6g3KBMNcI5HEk4TxqvqXpKeQCj78y0QKEC0bgSkfA7v7TLioTYUaN8r6qnOt9/9S3Ce4hK7n7AgTssehLDGa1refJau3jp/gjBwXRSlhGv1GNwcr0+/N7rH+WB0m7Saytji7xB8ZkkpEaoz4RDsa7ldhc7XoGdwY9zqlNRWeABix4FZxLc/h7llleUVa+6rqTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6q8OXbu41gZb0eKZW1C+sIGXawTVhoURrMpogN6lqG0=;
 b=KZJ66AlVesebAoB3dX/TqJmwky6oO7FSFyJ9qhRVKkrqVpHlUDK694OG0rvCZblI9DqlhEeoG+BbZyWjlTaN4owVSN1NcZm6lyJFnIFPdtW3upaWqt57IqjT1iUIh9klppWOkXy2EW1FO3gi3kG2j6Vu+3BUNao27bDVe59iTpxoBovCeHUwWM+OeixB6O9wIRO4Z0eMgl7le868Km1c4967rd3HRrrXUpBM/WsSShuwwzMPMQQXdfOlSNPhfI4ljRmA5p3n3VbRzfywVDrwtPBXk8AtDy5+4Ff1WjFT3evd0RnSPtc6jYr8y+G1f9ArvPAVmHxw7lr/Px4GS9b/DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6q8OXbu41gZb0eKZW1C+sIGXawTVhoURrMpogN6lqG0=;
 b=TN0ogM8X6gOvnJjFS8rVprZBTL0G7pHL14VAZ/7FEr/huciBZGpCq1iLspiCF5IIyzAyK3Jcu8s2eKj/AqvHE39ToSGyMtIQvgpam0yRgb+kTm/DpSmhsUvqBgKtgxKJuN7Ua29ATWTMNcPFBHNjO6OmBfFN5rNGfb6mfKc3eqU=
Received: from DS7PR03CA0185.namprd03.prod.outlook.com (2603:10b6:5:3b6::10)
 by BYAPR02MB5558.namprd02.prod.outlook.com (2603:10b6:a03:9b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Thu, 15 Apr
 2021 11:15:23 +0000
Received: from CY1NAM02FT003.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:3b6:cafe::a8) by DS7PR03CA0185.outlook.office365.com
 (2603:10b6:5:3b6::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Thu, 15 Apr 2021 11:15:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT003.mail.protection.outlook.com (10.152.74.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4020.17 via Frontend Transport; Thu, 15 Apr 2021 11:15:23 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 15 Apr 2021 04:15:06 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Thu, 15 Apr 2021 04:15:06 -0700
Envelope-to: git@xilinx.com,
 saikrishna12468@gmail.com,
 robh+dt@kernel.org,
 linus.walleij@linaro.org,
 gregkh@linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.106] (port=52540 helo=xhdvnc125.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <lakshmi.sai.krishna.potthuri@xilinx.com>)
        id 1lWzxh-0002yB-4S; Thu, 15 Apr 2021 04:15:05 -0700
Received: by xhdvnc125.xilinx.com (Postfix, from userid 14964)
        id 4D385122169; Thu, 15 Apr 2021 16:45:04 +0530 (IST)
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
Subject: [PATCH v5 0/3] Add ZynqMP pinctrl driver
Date:   Thu, 15 Apr 2021 16:43:10 +0530
Message-ID: <1618485193-5403-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bce30c8c-61bd-47b6-6abd-08d8ffffc397
X-MS-TrafficTypeDiagnostic: BYAPR02MB5558:
X-Microsoft-Antispam-PRVS: <BYAPR02MB55588BC6279BDDD3876FE694BD4D9@BYAPR02MB5558.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DBjoeZ/vFC0pUGoDNk7EcJmKs07vsxcvdlErIfKUmMOXAo+SJnX24c7GB5GXjwUsI8xcUT4YiPClqxw089o/Hz/ZFUXVV8Vaa8moUBgejHzIlcHgcKkoT2Crng8cfRYBJ/npKx25D6tkkPkqDc1dOREkB9XpNytCVSN2rznizL7Ha6SPhyI+D+aHn8aqv7Edr3o7kGEsmNg3vpwKEtpPTRvqJpQdE7dvdrKetReV/hBKdWrYPfM5xYbmDx0CYw2LKB215cjdYnYeiMSR46zkr1CW/n45lJJPr5aKLqP7BPY/F2LPw1vNvUWDMDUruOJ9OwMRf2vwRQZGJRG+1n9y0QcT+x4hheNnZyMZ02jCLM8qOiqo1bzG/l85mizW6vFFrEWWEOawbAVq+rGdJ1bzVmsgkoH5dWBnoUF523AGg0quCZOZPFP8ZNCwqRVrgAruLpHu/eh1HLREgKIZgYataa2XNYhDuqeXQI9wcu8pYaWJxeftsnUhBOa+uJ48xVTF7sO0gPsZ7pbAMDj7fbyN/apoi6gsGLuiYZQ3LRa01xS/y97pLG3A33pCwkl24HAqnfye8cPAEslmzFxaes+pRWUHng3e+mnEPb8JdI+s1T+BYuw/8iUb4/a7nGS46aoMSS0BGciAzeZPnAq+y5iRWNEiuxD4IGrHe/knSyh1MXsRWa7Sf3LCx76rekmU4A8s
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(136003)(376002)(396003)(46966006)(36840700001)(26005)(336012)(4326008)(426003)(110136005)(36860700001)(47076005)(7636003)(54906003)(6266002)(42186006)(83380400001)(186003)(36756003)(8676002)(316002)(82310400003)(36906005)(107886003)(8936002)(478600001)(2906002)(5660300002)(70206006)(82740400003)(2616005)(70586007)(356005)(6666004)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 11:15:23.5355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bce30c8c-61bd-47b6-6abd-08d8ffffc397
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT003.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5558
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for Xilinx ZynqMP pinctrl driver and also update
the Xilinx firmware driver to support pinctrl functionality.
This driver queries the pin information from the firmware and
allow configuring the pins as per the request.

changes in v5:
- Used generic property 'power-source' instead of driver specific for
configuring the IO voltages, updated the same in dt-binding.
- Added support to build driver as a module.
- Used error codes returned by the Xilinx firmware instead of shadowing the
error codes in the driver.
- Fixed comments from Andy related to spell checks, NULL checks, explicit
typecast, header inclusion ordering, removing kernel docs for the
obvious ones.

changes in v4:
- Added comment for ignoring the return value for GET_FUNCTION_NAME qid.
- Updated the zynqmp_pinctrl_get_function_name() API prototype to void as
it always returns zero.

changes in v3:
- Fixed binding doc comments from Rob.
- Used 'maxItems' for groups and pins properties.
- Updated commit subject and description to have present tense statements.

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

 .../bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml | 336 +++++++
 drivers/firmware/xilinx/zynqmp.c              | 114 +++
 drivers/pinctrl/Kconfig                       |  14 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-zynqmp.c              | 906 ++++++++++++++++++
 include/dt-bindings/pinctrl/pinctrl-zynqmp.h  |  19 +
 include/linux/firmware/xlnx-zynqmp.h          |  90 ++
 7 files changed, 1480 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
 create mode 100644 drivers/pinctrl/pinctrl-zynqmp.c
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-zynqmp.h

-- 
2.17.1

