Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3446E2FB27C
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jan 2021 08:11:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730589AbhASHIA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Jan 2021 02:08:00 -0500
Received: from mail-dm6nam11on2042.outbound.protection.outlook.com ([40.107.223.42]:50884
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2390252AbhASF2p (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 19 Jan 2021 00:28:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NWBHPBABbU6ei02mevF8exMuUKpbIUs8/D8uwmR8nxGdkVJdiIsAv8ZUBs5R+qv3xRpDfrKPxkNLXV4rN8MXC53E137ETRrJOPBPtTMtCsSE9asWsB4RWU1qbGZONFwchApgNuCOHtDX7EEFKx3fssPJB8rLTz/1v4cXpTeeLA45iFK4ZxT3L6bI9lZQ+t6JA7hCXlvERlCj2Y4IAseoj6yFTDiXO3YqqcRjpFWipba5iqJijH/TyEBau1HiLBFI1hCm0K7I3vOZYi28lank1rX7RvCLXoTlxLXeZb0ZSoPus04oTScSUrzCC1tmP7ysG08CDM24lFqTbUhc3DhPSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/DbIy2PfTLqdgulH+VIgo9g3JsEtTLgh4puN30z2p4=;
 b=OVe2RFT51AHe/1K4zqM7mbBQZFD5nQv5M/m/O0Kep7AjYJV4jFLgSln7ACmSZ4WeoArvAMyveW0S9nPcICUjxcrTffxewFiETMnP4fKsyJ+2cY8M152dmT5582Xm0fkRn6Q/FXFA6oj3QcDP9ohtx/u09jTEKXA6FSgguTYzq2HQ1nrFC/8X4K7+fGyDzLkbYq2QNyHQO7VfVuG+L5MmDPjoUbfQVXWk8F9tHNrEEPr2OoYXEyndNycKLC95nYyCLSr1eHOGeWFIOz4U102Fi8Kuwg09BcblqWwcrOdcCNGsXtnS2+ceTVV/U9xIg1SO9eHgJ+0wtZsKra0+G7FRSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/DbIy2PfTLqdgulH+VIgo9g3JsEtTLgh4puN30z2p4=;
 b=NOgXmc3d3xVkaWGuD9aC56vFpI809dqWV2vsNp9cWoI4coLFYOcNGO3umYq2XjxmT2wdJ0QcLTTBEivmWfeX2tTSHdfV6+eOr+2PTtXWuET8RiBALmTf353GFFQn1GfMu2LRK8vOf+UN93IKpt9JjDZc7AsE2HyMxBm2xFSwKG4=
Received: from SN7PR04CA0012.namprd04.prod.outlook.com (2603:10b6:806:f2::17)
 by CH2PR02MB6070.namprd02.prod.outlook.com (2603:10b6:610:6::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.14; Tue, 19 Jan
 2021 05:27:50 +0000
Received: from SN1NAM02FT005.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:f2:cafe::a0) by SN7PR04CA0012.outlook.office365.com
 (2603:10b6:806:f2::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12 via Frontend
 Transport; Tue, 19 Jan 2021 05:27:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT005.mail.protection.outlook.com (10.152.72.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3763.12 via Frontend Transport; Tue, 19 Jan 2021 05:27:50 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 18 Jan 2021 21:27:45 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 18 Jan 2021 21:27:45 -0800
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
Received: from [172.23.64.106] (port=37100 helo=xhdvnc125.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <lakshmi.sai.krishna.potthuri@xilinx.com>)
        id 1l1jYO-0003Z5-Pf; Mon, 18 Jan 2021 21:27:45 -0800
Received: by xhdvnc125.xilinx.com (Postfix, from userid 14964)
        id E2FCC1222CE; Tue, 19 Jan 2021 10:57:43 +0530 (IST)
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
Subject: [PATCH v2 0/3] Added ZynqMP pinctrl driver
Date:   Tue, 19 Jan 2021 10:57:31 +0530
Message-ID: <1611034054-63867-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e09fbb85-8e1c-4d97-7287-08d8bc3af680
X-MS-TrafficTypeDiagnostic: CH2PR02MB6070:
X-Microsoft-Antispam-PRVS: <CH2PR02MB6070CBAE84DB6A2A06B1BC71BDA30@CH2PR02MB6070.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oQpztlArkFSIItJSZ5MgkeKEdz03zJoQaBdQ0YkTxiNkakO7oq5VdqCyCgmPkVEST1Vewq6GGCFymREqfLiBha3kubzTSf9hfqj8bfoXSIw05R0KRRDfEuL6lCzceuQrYFjfjLieGpbzsucKpgj489OeaTp5860MCSUDtCapXYh6iEzSLZ94RZzlflM2ZNCX7Xj4VbRer6kh6WWDf7gI1e8LhHVZkORfO3sgzo2wc2ql5agZrAfIC08GdBYG8It2WsSKGKH6kzRb+ePi5WD3tsAeywgq1FlMnYMSkSlwdoVlkCabW6iwUw+x1OFIRog153/0tFdCyTJI5njccZBcuJFXTjaUWgT1z+5TL75aeLcqjvWX1DIPsOXqp/rtzbTeaD/aQjaLt9tX1aO4tcRaDtomM4WtefP4Sv9yah5V4mo1GJTxIEzP1B/2cTifmWIgMHP1o5abPupW+I85O9UT8wymwP1rRU+3vYSS1/QQCVr5EocQghLWOXLVE/PRFzDB
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(46966006)(5660300002)(6266002)(426003)(2616005)(26005)(186003)(36756003)(4326008)(336012)(42186006)(107886003)(36906005)(478600001)(8936002)(6666004)(316002)(110136005)(54906003)(7636003)(356005)(82310400003)(70586007)(83380400001)(47076005)(2906002)(82740400003)(8676002)(70206006)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 05:27:50.1849
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e09fbb85-8e1c-4d97-7287-08d8bc3af680
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT005.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6070
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Added support for Xilinx ZynqMP pinctrl driver support and also
updated the Xilinx firmware driver to support pinctrl functionality.
This driver will query the pin information from the firmware and
allow configuring the pins as per the request.

changes in v2:
- Use pattern for pin names in yaml file.
- Updated to support multiple groups and pins.
- Added type ref for the vendor specific properties.
- Removed 'schmitt-cmos', instead used common properties.
- Removed macros for drive-strength property.

This might be resend for some people, as i had some trouble with my
email server earlier.

Sai Krishna Potthuri (3):
  firmware: xilinx: Added pinctrl support
  dt-bindings: pinctrl: Added binding for ZynqMP pinctrl driver
  pinctrl: Added Xilinx ZynqMP pinctrl driver support

 .../bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml |  337 ++++++
 drivers/firmware/xilinx/zynqmp.c              |  114 ++
 drivers/pinctrl/Kconfig                       |   13 +
 drivers/pinctrl/Makefile                      |    1 +
 drivers/pinctrl/pinctrl-zynqmp.c              | 1031 +++++++++++++++++
 include/dt-bindings/pinctrl/pinctrl-zynqmp.h  |   23 +
 include/linux/firmware/xlnx-zynqmp.h          |   90 ++
 7 files changed, 1609 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
 create mode 100644 drivers/pinctrl/pinctrl-zynqmp.c
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-zynqmp.h

-- 
2.17.1

