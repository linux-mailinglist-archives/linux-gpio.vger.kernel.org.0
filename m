Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A217D3A78BE
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jun 2021 10:07:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230479AbhFOIJY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Jun 2021 04:09:24 -0400
Received: from mail-co1nam11on2045.outbound.protection.outlook.com ([40.107.220.45]:48641
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230446AbhFOIJV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 15 Jun 2021 04:09:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WA+KVaPv/3aIQmAfHUikAj9c2ExbFxWHGS0ZnoHVSATUncd8fNnoJUgMWg7JgnndOcdwslP+YlqT9EHk7AYzdkYmokxaV6vWOyODmhTuWVal8su8TmUrRpQQau4ATEIDgEmXyh/g4isxlqd94YyZb+G+RbIoSGVFBm6ef6cmtmcyWSn8qfNbMRgwPNJD5yII0vcDZnbcPFLXE5fe4g5psgukNDVpJula1QqwUVYNHkTpded2Ro7E65lMTg3Itlgm9Wj5DdvsncwI+1olUsmArUaOLFEVnKKJ+Qy+zjQ6T5mcBWC3wBHkLoyaFaksdz/vD/3O1aPC6c1ZfN5Y+1JVNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2RIoUWTn5ZoPkrDMOuUzzoXF1yDaaK2EFy2Rc7aEziY=;
 b=Fu30lVfFN5OsrMRFC/eSwnUyf//qf5TnwRfVKP5erxjEqRAhOH8q0xVSmVn/5hPtTmn/CJ6hDeSkMCo1S1Qd+6AL8kQtpGevOALw4aXPR2lAl1l25wdA7D+HhlbMYt4htR9ncxPkdJG4glQXhSN6U6AS7V3XmJOoEboU/pPzK8ajeS/uFGrxtvQehW0pfMKqTRud6yKFOjqL4QpKOKf+JODTvd9DMwflkIQgK9m5GfUEYr2dtXzyAKUAU2+WqzaTRhb+HIMYYjC101d+A9a0kbYhYsEs3y+4md5Sth23tKRl7VDl8fSGkXUj35v7lf0waoVMDh2h+Q0+E4819/Qb4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2RIoUWTn5ZoPkrDMOuUzzoXF1yDaaK2EFy2Rc7aEziY=;
 b=KqG58F/RqrqBg+w33r7cqOBT0ybEYmXps7DWv5s3fFbHzAeOmmpRKY1SdU4FB6YqrNvLegek/RLQatNpVmfwtdFUEqcEN8cNAOJK+wWi1L1tzmxAah8d0sosNSs55BWVTEW//rR+sQGC7mK+9IBv/BwIVYvT+04mW/9Q+KPTpCE=
Received: from BN0PR02CA0044.namprd02.prod.outlook.com (2603:10b6:408:e5::19)
 by BN7PR02MB4177.namprd02.prod.outlook.com (2603:10b6:406:f6::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.23; Tue, 15 Jun
 2021 08:07:14 +0000
Received: from BN1NAM02FT037.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:e5:cafe::40) by BN0PR02CA0044.outlook.office365.com
 (2603:10b6:408:e5::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend
 Transport; Tue, 15 Jun 2021 08:07:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT037.mail.protection.outlook.com (10.13.2.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4219.21 via Frontend Transport; Tue, 15 Jun 2021 08:07:14 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 15 Jun 2021 01:06:36 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 15 Jun 2021 01:06:36 -0700
Envelope-to: git@xilinx.com,
 linus.walleij@linaro.org,
 bgolaszewski@baylibre.com,
 robh+dt@kernel.org,
 linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Received: from [10.140.6.35] (port=43350 helo=xhdsaipava40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <piyush.mehta@xilinx.com>)
        id 1lt45j-0002dn-Hh; Tue, 15 Jun 2021 01:06:35 -0700
From:   Piyush Mehta <piyush.mehta@xilinx.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <robh+dt@kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>, <git@xilinx.com>,
        <sgoud@xilinx.com>, <michal.simek@xilinx.com>,
        Piyush Mehta <piyush.mehta@xilinx.com>
Subject: [PATCH 0/2] gpio: modepin: Add driver support for modepin GPIO controller
Date:   Tue, 15 Jun 2021 13:35:51 +0530
Message-ID: <20210615080553.2021061-1-piyush.mehta@xilinx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba270420-c1d5-49f4-c0c4-08d92fd49602
X-MS-TrafficTypeDiagnostic: BN7PR02MB4177:
X-Microsoft-Antispam-PRVS: <BN7PR02MB4177A24FD462FD702F59F45ED4309@BN7PR02MB4177.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LQVIQMEJ1TBwZ86E/yPGjDEyCt5T7gz1KK2KRUPoKFGFWqo1O8p75mu2bX8zQic3jtRvRT+KYubV7i6rJRYqPL89elPYoKttR1lxVbtqJ+eW1hZuENUX6zkkgQirgxIS/CfSX7avW4/t0s909tyT22CclFTbTRVFtAC8ExTO4g5ZKviQrLvZClxqo7MJz8EHuJo/wdNpHmVnEyR2ruoaLLI438z9CpHp0lcJOUsKG62YQkCjm+oyEA7Vs9datSMY5/068MzVEDmQf0St3zot32UajgyIzCgwowwWeVpIVq5fo0QZv7mg31FG3irzO8NvetLY96NF+G+B1gzgVXLGZ8Wspd1GeFrlTVkVAGug8eU3K9B5/fXOklTBoV1A4GuxJLVuDkuEQ0IzhEefhIpb0ljNW+N413VvA3Zlz40OUvAmxhn21A3OrLKisDTTqlSKiuwFbWwZXA4uJ3xI0DNELWXVKCm47TQK2AfNxyBXm8iZyN4dhVRROZcRKD1Of3LkyMKNeW2Htb4P+vxnGh4vFF+hP0IGbOhhcVpPguThIznbG4N+/08E0uWhpWWvGL5VmblU1OriTy/BxF5w+7RQkinZNaJpzZjgvONJBz4q6gaOew94I1G6I/3xyJWrm71PRDIgp3ysFCklKrwMT0j53v9uDfmd/719wPZB+gKRItAT5itFt2wjYWYeLDloUWg8
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(39850400004)(346002)(36840700001)(46966006)(426003)(356005)(9786002)(2616005)(7636003)(82740400003)(107886003)(316002)(82310400003)(36906005)(47076005)(1076003)(36756003)(186003)(26005)(70206006)(2906002)(36860700001)(478600001)(7696005)(54906003)(4326008)(4744005)(110136005)(336012)(44832011)(70586007)(8676002)(8936002)(6666004)(5660300002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 08:07:14.4411
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba270420-c1d5-49f4-c0c4-08d92fd49602
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT037.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB4177
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds support for the mode pin GPIO controller and documented
for the same. GPIO Modepin driver set and get the value and status of
the PS_MODE pin, based on device-tree pin configuration.
These 4-bits boot-mode pins are dedicated configurable as input/output.
After the stabilization of the system,these mode pins are sampled.

Piyush Mehta (2):
  dt-bindings: gpio: Add binding documentation for modepin
  gpio: modepin: Add driver support for modepin GPIO controller

 .../bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml    |  41 ++++++
 drivers/gpio/Kconfig                               |  12 ++
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-zynqmp-modepin.c                 | 154 +++++++++++++++++++++
 4 files changed, 208 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml
 create mode 100644 drivers/gpio/gpio-zynqmp-modepin.c

-- 
2.7.4

