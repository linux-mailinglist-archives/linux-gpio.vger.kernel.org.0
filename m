Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE183367C88
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Apr 2021 10:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235232AbhDVIbE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Apr 2021 04:31:04 -0400
Received: from mail-eopbgr690088.outbound.protection.outlook.com ([40.107.69.88]:15010
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235306AbhDVIbA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 22 Apr 2021 04:31:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FkTTHhc7PN+w0X6+9MY202rdxb4GKl5nH/Ej5GWKlNN8V9WRCr+KV9UEeoTEQ4qpkEZqNlHUb9cofmk/XOpKFjR4uwTrnF9OuMnCFhPdoSYqgXKUjw9g2Xifk5cBykLlkJGhkosIj3d2yvlCYJ/b4C/ZkkngEEq6H6pE0ghiVXGJBJDgFQaVcPjWABUzRM68FvxFroYVtOVP81pkPLY/BI4kUPO4/7e9LuMVbLc/7CM/hJ800LxpAZvCpWsBQH//zYDTY5dWgpcwFQJvVMOXo5GT7TzGkPxg6e+wZNveUSdyko5BEYSbisSDwjFdDz0oJNzTmslXW6xOtIlLdbD2TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g587Nr98S0fdn+dAyuMlRNOL9j1vgtV4bVSwZod26sw=;
 b=WCwNZoovG24Jf5rTGdTiHSBWggwmWZ3hPhZYwf1MD/q+u0fSObUKLAJTRZGyorV36tzPyWlQ6/3Q5DYYJ2BITQ5W/jRnrBMqxRyo8wpkI149QfVgCyHsnu9rXQe/+d7d70gsfBIkvX7Lfr0QPtK8omCsFhECRLtvItS5sV4jNnuKsfbOoqvv6VePHl3zeuBUuLklwGWnonX5FuSAQH7cqvyWoFyyvft5PJAxiHqWk6ou//kKz+aIG5ifKKv00K1mgWrxGrxPaSEzAwrvm7iHcIcCarEOoDPwSuNkHxEpV+WxnjDSigp1lyWGMDqWsvcLDK0k4+r2JbTWjTJPsVIrKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g587Nr98S0fdn+dAyuMlRNOL9j1vgtV4bVSwZod26sw=;
 b=F4gTcKRTGhvIMigd9oGNvumMFzTbpA0XFItZbdqBop7J64+0azWMLVCAvA/4WqtwRFQF8QfOjcZlg8BalZ829fLN52rvPjnAR6Gf/YWp0scpCJZgQk+KYyEKlRdXA0jead8YY8M9MmBebGeMBPF9Xym6od61ghXtL/oJxB+AcOs=
Received: from SA0PR13CA0029.namprd13.prod.outlook.com (2603:10b6:806:130::34)
 by DM6PR02MB6889.namprd02.prod.outlook.com (2603:10b6:5:258::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 22 Apr
 2021 08:30:24 +0000
Received: from SN1NAM02FT003.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:130:cafe::99) by SA0PR13CA0029.outlook.office365.com
 (2603:10b6:806:130::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.15 via Frontend
 Transport; Thu, 22 Apr 2021 08:30:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT003.mail.protection.outlook.com (10.152.73.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4065.21 via Frontend Transport; Thu, 22 Apr 2021 08:30:24 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 22 Apr 2021 01:30:13 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Thu, 22 Apr 2021 01:30:13 -0700
Envelope-to: git@xilinx.com,
 saikrishna12468@gmail.com,
 robh+dt@kernel.org,
 linus.walleij@linaro.org,
 gregkh@linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.106] (port=49354 helo=xhdvnc125.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <lakshmi.sai.krishna.potthuri@xilinx.com>)
        id 1lZUix-0005AK-Do; Thu, 22 Apr 2021 01:30:12 -0700
Received: by xhdvnc125.xilinx.com (Postfix, from userid 14964)
        id A2D15121134; Thu, 22 Apr 2021 14:00:10 +0530 (IST)
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
Subject: [PATCH v6 0/3] Add ZynqMP pinctrl driver
Date:   Thu, 22 Apr 2021 13:59:59 +0530
Message-ID: <1619080202-31924-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd4fdca6-ace9-4efc-b830-08d90568e02f
X-MS-TrafficTypeDiagnostic: DM6PR02MB6889:
X-Microsoft-Antispam-PRVS: <DM6PR02MB6889136F2EE5212EF7D36275BD469@DM6PR02MB6889.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:773;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8cQ2b0E9JG8tr6SVkI0SSTSY80c3G3TV2g1m23bd+DIPuhMVsAkF03U1tIW0W3AdD22Fm6+5uUYHY/PC8RZNRiBxGnEzwzOpvOCW2oaGyLE1qxFrGWzcsFtcHjcmJ+/7+kB38QJeLyC63AcRY/LluHRHYVVYfhCUGa088V3BOkDhHyRoiBGS4asyIKwHvYR5TN5P/+4FfpNrrKgv6dnTT9ZFP1TpiOdTzOlN4jx5BCAUowJM6aKIZs4D0+FvLzjdGGbhmh4tdazIzA53v3PmOV56DGir2FBwMRH9lerKwcd8z1fiFbCvljunfudnFLa07bGtCx5ftMEh73ioVtZS9Qu8hiAarxNzjelCQK3F9fbVeQfBPyOM7yQ9BYYRx4dHdMvaZVIyz32wRuhJxfLnyVeGBZOoLVmBWOqDs8B7h94cXf//wP2cqT/N5kQbJXnUL9w4RWMg8zj+x+vBPguD3pT8kh/3IROkopez3u1iiv+BBB88x8Ijt2SyI0aO38wMkg5Z7zJxgaLwFyToDO6gGT2tE8joj7dTo9rmPCdIlVY4tJ55SLOS/7phiSV2QTAbiO2iLnwuNB8AxW3Z9sNLalNBGdKFNx68FsEgUl1/3nL8CBgipYjxogM2OvsxVlh0Xk7GdVsh8CAVdrxMrjUKGKxw0lb+NTIm26WqVng9l5GBnPlt3XhfpTnIuWdAMVp7
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(376002)(136003)(46966006)(36840700001)(82740400003)(478600001)(5660300002)(26005)(6266002)(36756003)(2906002)(186003)(336012)(6666004)(7636003)(36860700001)(70586007)(4326008)(82310400003)(356005)(107886003)(83380400001)(316002)(36906005)(110136005)(8936002)(426003)(8676002)(2616005)(70206006)(54906003)(47076005)(42186006)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 08:30:24.4807
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd4fdca6-ace9-4efc-b830-08d90568e02f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT003.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6889
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for Xilinx ZynqMP pinctrl driver and also update
the Xilinx firmware driver to support pinctrl functionality.
This driver queries the pin information from the firmware and
allow configuring the pins as per the request.

Note:
Patch#2 is already applied but sending in this series for
completeness.

changes in v6:
- Rebased the patche series on 'devel' branch in pinctrl tree and no
functional changes.
 
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

