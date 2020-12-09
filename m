Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43C2B2D3DBD
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 09:43:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727885AbgLIImG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 03:42:06 -0500
Received: from mail-mw2nam10on2072.outbound.protection.outlook.com ([40.107.94.72]:29856
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727218AbgLIImF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 9 Dec 2020 03:42:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MzSDu1QV3VLGGqI3taTx1NwXO1cwn5Tnv25XINfJdXh7vfEIKrnAPTDCCgcZ9tEZf43hO0J+dvqe4Jk7qaJD+JNArTjzdGdFGGtyu3KscrfhrcJA9TZlkp6nyZICx5Bc+fL6z+HdCjLlYeYsGLUKPAKL29W3yVU3cWuTNDVeoewhQyb8+AkoDy+Nw4HEuXgYkqHk3irfXiRXMpF5MQ3P1Tk3cPVWxMbou1Vo6AMjRiue5cd/VfV/I0ofy9MU7GHluSgIbEFNS/Q5tL7EAI33BqlkLjK0G+CmncKobg8PNvj+NzIlpPIDBcfBsv6eA1+MigpofMmW0kgtSv5grie1GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZQL3EU54eQDSMQdOqm8eIojTn/YopMcFFfutxyoHu0=;
 b=PQZDEn4r181nFcSQBrejz28giOrEsOQhoboTsQOCg/wtssdKX5IYs1pWwGDZCxmDi77UofvIj1pQNcXbF2Og5klAFcRMYJI00bBdGg9fSAQ06U61R9ndSHUPVeeYN8sog6BQopsHyu23TWpGB6j6eCAZBInZcj2R3aZSjdLTU8EOYySi85UiPzEqK7TeQP5/SK1vm8mesxZpWhGHvUBwjPZpzwRrHfj8mhsjaLwVmC5BWfSG4HEP03Qy6jivxlAhLxn7C4ZIKmVrOF0lHgEtIysV2CAtgBg9EAXUGRt+kwlBaxarG4IuBkSkEb9Gl83c4q/jIuuKS8biTnTmE/TNQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZQL3EU54eQDSMQdOqm8eIojTn/YopMcFFfutxyoHu0=;
 b=FTDybxLfSxy/brvrVDTzpk8sVEMBtuZpOgDBa8aO4l9nPTgAIwdfpo93+GTHTOZOTdT7qd69jTglfEChLqN8sOyUBqI0wX6zUo+t3++Ie/hgNNTGwXwbJAEbf/dxOyjH+tjt8iYIdm02OyTW9Fhx04XjCJeTwNUVIXxoOvLtWPc=
Received: from SN4PR0401CA0006.namprd04.prod.outlook.com
 (2603:10b6:803:21::16) by BYAPR02MB4199.namprd02.prod.outlook.com
 (2603:10b6:a02:fa::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Wed, 9 Dec
 2020 08:41:12 +0000
Received: from SN1NAM02FT063.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:21:cafe::f3) by SN4PR0401CA0006.outlook.office365.com
 (2603:10b6:803:21::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 9 Dec 2020 08:41:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT063.mail.protection.outlook.com (10.152.72.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3632.21 via Frontend Transport; Wed, 9 Dec 2020 08:41:11 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 9 Dec 2020 00:41:05 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 9 Dec 2020 00:41:05 -0800
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
Received: from [10.140.6.35] (port=50856 helo=xhdsaipava40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <lakshmi.sai.krishna.potthuri@xilinx.com>)
        id 1kmv21-0004Mw-0n; Wed, 09 Dec 2020 00:41:05 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14964)
        id C027F13C043D; Wed,  9 Dec 2020 14:15:20 +0530 (IST)
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
Subject: [PATCH 0/3] pinctrl: Added ZynqMP pinctrl driver
Date:   Wed, 9 Dec 2020 14:14:11 +0530
Message-ID: <1607503454-26503-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 208b8168-f1c5-4412-0b28-08d89c1e2eb4
X-MS-TrafficTypeDiagnostic: BYAPR02MB4199:
X-Microsoft-Antispam-PRVS: <BYAPR02MB4199648F146F1A59CA007A67BDCC0@BYAPR02MB4199.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: atsdzKB9fVSSejpDabL3lxONpWBA0zJkiNluZAz+IqzCOS3tQD9zVHyw2gGeSRw705T3QuqAXZJtVKAaFWfwcn4BGjUky8sB+9oPvXp78VR/vprhsE9yF2UZxb9lLmkuI+kZ2kPY7upCa6ymWD5iKF9xjeM8RCaNtIROAS75oPz0YDWvRliWEosNK4wDpvxzdjgiTPworcxJoHv9Rka3Yd78IHGEjMz4lkbQdZdQh2uTf8bDdOpurHiS5H7IgpYjmTE1v0T1hgrqqw5rNhuS3QDT6Dnd11FtZUJNW7+4f1Smd++fZ3XIMWe14tG9OU4ErvsV4y8P7QoHjG5um/54PI9Ql+fhlYpV6BeDcBYAksIyOj3vRxSV87i2jiTzPgXcK0SlBvI/3tkJqILHn9XTdYKalnaQd5U139fUtkRnzf0=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(46966005)(36906005)(186003)(107886003)(47076004)(6666004)(2616005)(8936002)(70206006)(110136005)(8676002)(42186006)(83380400001)(426003)(508600001)(5660300002)(356005)(4744005)(36756003)(336012)(2906002)(6266002)(7636003)(26005)(82310400003)(54906003)(70586007)(4326008)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 08:41:11.8618
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 208b8168-f1c5-4412-0b28-08d89c1e2eb4
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT063.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4199
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Added support for Xilinx ZynqMP pinctrl driver support and
also updated the Xilinx firmware driver to support pinctrl
functionality.
This driver will query the pin information from the firmware
and allow configuring the pins as per the request.

Sai Krishna Potthuri (3):
  firmware: xilinx: Added pinctrl support
  dt-bindings: pinctrl: Added binding for ZynqMP pinctrl driver
  pinctrl: Added Xilinx ZynqMP pinctrl driver support

 .../bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml |  329 ++++++
 drivers/firmware/xilinx/zynqmp.c              |  114 ++
 drivers/pinctrl/Kconfig                       |   13 +
 drivers/pinctrl/Makefile                      |    1 +
 drivers/pinctrl/pinctrl-zynqmp.c              | 1031 +++++++++++++++++
 include/dt-bindings/pinctrl/pinctrl-zynqmp.h  |   29 +
 include/linux/firmware/xlnx-zynqmp.h          |   90 ++
 7 files changed, 1607 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
 create mode 100644 drivers/pinctrl/pinctrl-zynqmp.c
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-zynqmp.h

-- 
2.17.1

