Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8653C33EB61
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Mar 2021 09:26:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbhCQIZz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Mar 2021 04:25:55 -0400
Received: from mail-mw2nam10on2051.outbound.protection.outlook.com ([40.107.94.51]:4929
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229602AbhCQIZm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 17 Mar 2021 04:25:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fXO+zQ4YZNGK/EpyXGOHjtyVxfRGV46T9QONS0S3qPOi9XDc5MfuUgfrmkX3SQ9sMeNYaj2GB1OXWtWsXEVZbDzae7BX9rozwmIr/q+hQP4nnaSxg6nyaPYHEyHLjon4MOnO40zblTlCHXzA1FQT4zCLgSIc9ntGLo6R0BFcEdYSkCstafRVaXGVvHUUPAeitGjQd82pLPdkUJSj0aPug07UAnICMMzdBY4+oOmUQk+tLjZr+s0eEUoRAF5VfUefbzNBlWJQb4HprC51DT0kXz0TlH/f03us5Wxyk+AxMtF1CWyDf2RR1c4Mp8RzcNwyVG3pjqKKX788gYdMOcDerg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0uC5FQA1HrZxPbiJ9jx4uIGmMpLSK0JquihA654HSEc=;
 b=JB34IrmLWb00i5gZ/2RPEx5bY6dga3kuY6C6m2aKlQIMvDf+5xuly5IH3EF5diuO3EK3ozEafaFiOzhiDgNsAnHTxp1hZm9XO9cRfNhsGTVUzGzg5Ggo2ecyA6k9yLUOiUh0t/Dv20PV+D/qg8AljO7BUL+9InoeJ8lNwSLLI/tzQG6yMZ17VumL2NStCdpn18tp0+3xn01jB7y2OlcG5pYaP0VuXreylPcf463MVWsf8IndyYvxRBXHVwxfN6DneYf80Ayzwsriur8q+8aLeoB1S4Y3XXOJ6O29CIJtWapqIcvVPz9IK8WucIFfjZOx3BtBfEws50gAvkBjhuRC0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0uC5FQA1HrZxPbiJ9jx4uIGmMpLSK0JquihA654HSEc=;
 b=TVbQtpy5ZC6g47f9z2AjT2im1IudxdsOjJf4iA/HxpcCZiXpyDC091FYW8mVyxxynxtF3HL7Y/Lk+Bl4h1Lrj0TuPtozVfQNU+uxjXOkNFDJvtDS48qTNRTHV1X6wqyLXnbsEW/MuPW6tFIperV0VCC++ppsr5kqXukEwiTPLGU=
Received: from CY4PR04CA0038.namprd04.prod.outlook.com (2603:10b6:903:c6::24)
 by BYAPR02MB5078.namprd02.prod.outlook.com (2603:10b6:a03:6e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 08:25:29 +0000
Received: from CY1NAM02FT036.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:c6:cafe::62) by CY4PR04CA0038.outlook.office365.com
 (2603:10b6:903:c6::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Wed, 17 Mar 2021 08:25:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT036.mail.protection.outlook.com (10.152.75.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3933.32 via Frontend Transport; Wed, 17 Mar 2021 08:25:29 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 17 Mar 2021 01:25:27 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Wed, 17 Mar 2021 01:25:27 -0700
Envelope-to: git@xilinx.com,
 saikrishna12468@gmail.com,
 robh+dt@kernel.org,
 linus.walleij@linaro.org,
 gregkh@linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.106] (port=50123 helo=xhdvnc125.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <lakshmi.sai.krishna.potthuri@xilinx.com>)
        id 1lMRUb-0002Vn-Hd; Wed, 17 Mar 2021 01:25:25 -0700
Received: by xhdvnc125.xilinx.com (Postfix, from userid 14964)
        id B953F1211FE; Wed, 17 Mar 2021 13:55:24 +0530 (IST)
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
Subject: [PATCH v4 0/3] Add ZynqMP pinctrl driver
Date:   Wed, 17 Mar 2021 13:55:13 +0530
Message-ID: <1615969516-87663-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3596221-884d-4b9a-9b1b-08d8e91e3956
X-MS-TrafficTypeDiagnostic: BYAPR02MB5078:
X-Microsoft-Antispam-PRVS: <BYAPR02MB507862D543F20F7C03697F43BD6A9@BYAPR02MB5078.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:469;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: leeWYN+zG+TMMFK7vgc+AuQbX8jhavPn9VLPHs8jbR+wviScmbaQNf1P9/0dk6E0e8G8bUXRuArZaTwGf+SKuQ2tHNb9S1QWFoTTMVTMktaVPPMmDEetsujkzbn45rytrqVL1EVB1Ywwukx6xlRflNmSegrKxL1cMa7Hpyrxn4KXAaH29SSUdl5dFrhN808OyBi6RMEAOD0ZvCN4JnSRyO1IICBvxNZyAin4S9Ka+3XaSpNG5LPDaYMhJmXoi0Rcgs7nED014hYoUDIbhzmPlJHuwUZRfbU4WdXj2BvKWRMDa1FbdCrYTyNn1N6aJBF2vEx0jQOQZ6CSeAjchFZxcBdK/aV6DfLSGInEZL41/xQYR18v7ikZMNzxUprhN0SOvVDWPQNxxDL7OInJyKLl5OMfbxj5nSczppHCjAJtATs7ibDxLcy6h7bh3Q0EEO5ACRO45KX/2d3/LfzYIi4MvAFTGV+pKmcP6vVwEtV//88bZPMzQ8WCcpvp+pp7q3E8fY+Kp00ikVXcjf3Hl7H8oCjtbTAV5LMIen4dRRTQWkdJHOdE9ofd/Xc9hk5xRxSblf6MY56YgS3ZEkOQbiBe1fHxFBoPiUQ0izlWQF49QDfKSkqdSp+rzqApCn/2mU1uG956LOuPGl/LvPfkDfDXRh0g3VdilMUNmHumns5c1oUyyt5LanromFmnJVR2kOWq
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(136003)(376002)(36840700001)(46966006)(356005)(54906003)(82310400003)(110136005)(6666004)(107886003)(26005)(82740400003)(2616005)(70206006)(7636003)(8676002)(8936002)(36906005)(5660300002)(70586007)(316002)(47076005)(36756003)(336012)(426003)(6266002)(478600001)(83380400001)(36860700001)(4326008)(186003)(42186006)(2906002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 08:25:29.2563
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3596221-884d-4b9a-9b1b-08d8e91e3956
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT036.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5078
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for Xilinx ZynqMP pinctrl driver and also update the Xilinx
firmware driver to support pinctrl functionality.
This driver queries the pin information from the firmware and allow
configuring the pins as per the request.

changes in v4:
- Added comment for ignoring the return value for GET_FUNCTION_NAME qid.
- Updated the zynqmp_pinctrl_get_function_name() API prototype to void
as it always returns zero.

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

 .../bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml |  339 ++++++
 drivers/firmware/xilinx/zynqmp.c              |  114 ++
 drivers/pinctrl/Kconfig                       |   13 +
 drivers/pinctrl/Makefile                      |    1 +
 drivers/pinctrl/pinctrl-zynqmp.c              | 1030 +++++++++++++++++
 include/dt-bindings/pinctrl/pinctrl-zynqmp.h  |   19 +
 include/linux/firmware/xlnx-zynqmp.h          |   90 ++
 7 files changed, 1606 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
 create mode 100644 drivers/pinctrl/pinctrl-zynqmp.c
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-zynqmp.h

-- 
2.17.1

