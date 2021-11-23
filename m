Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A403345AC41
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Nov 2021 20:29:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234048AbhKWTcW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Nov 2021 14:32:22 -0500
Received: from mail-mw2nam10on2051.outbound.protection.outlook.com ([40.107.94.51]:4193
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229768AbhKWTcV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Nov 2021 14:32:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nq3bk4o1forDgYmllV0KjBqsXziwIDQz7zXpJks6+uk1w/Juvlh/9lyRI09VdT7TAIMyCDWgC0QaKy/m+vqHxBxz39CZH87aX/BlY5Ou68YAXTXoYymHLYZKRVAeuy8glGwfRIyLXRlBU/LNX0BPT5jtdsgTdth4VoiFDgmCFOMfZ9Cwp8tvV8Z5WvHHcep+W9nKE0d55Ua/jT+CdnARQatwEeSopTgjeh/mMAt6ZeZ/w7lzQuq/6FyJB4+cNSEmN+ithsjUn2pV1pgtkSkuaEvXKQfE45MDmrJVEL00SGbAoHDMGhVsfoHE8cd/vWPg3NnoIsoH3p781ZObDwVfYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DMRP2ojEqVtJLumDv8GhIHDihCk8Mmn7kWFQoD+okNM=;
 b=fRWKy6vV6YFB1pEDGhp2OONkktNtrkkE7iqZ9j25S2t6pPx9FhtqpBS5wHEwCqichL7uCG5OeKawslPovOCS2ssGns2F5hesblUna3NsZviwU+mo6KopJyJesh9YhFSjnRKp4o1A/qLHDa5QHQnK2w8o+3H2FMqp6pDmXBZvAQanXULFsoRKFAcgG02MghuvMtx67cUawAlsh/TqlRwbomRi7Kgj+ViIB/JuzpXONLV5lsPT1O/d+magjd0CmWXuCEhXnbeBtvHAggSJiJ3T9bceuEk6bS/jqbZQZPsXwRDklWFNGFiGrz/nKBeRBObKhIrYLiH8QTXMiByDuVoryQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DMRP2ojEqVtJLumDv8GhIHDihCk8Mmn7kWFQoD+okNM=;
 b=HhzQ7AdG6rqJS+4HcTUyCbpPlklCp+PNSr+JJPGBQi34u2EAFzZXWACrRm5vHmcE+Xiw0qxtcIofeO8z/YH8t51itB+na3ny3yW01QqW9O4QWpyDMAI93JMSsj48I3LK/e81IF0Wkx9fzae6TbbaJCFqWV9FLPV0k8MhvWwWCbxqEOdoSNmWP5YH9Obg3mMJyR9Za1n1PGMN+prtiFViQeG5HZUyW++j83Cz75RA96lsCJdZBwd3SAR0jobH2P3dDU1IKfK7+LzA/jaAqQqbwnSzLuK0rYKFOlkccnBvU0nFhoPB/Apoe6wg5/eFQoGX6viduWA3qBvyASZpl12EaQ==
Received: from CO2PR04CA0165.namprd04.prod.outlook.com (2603:10b6:104:4::19)
 by CH2PR12MB4940.namprd12.prod.outlook.com (2603:10b6:610:65::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Tue, 23 Nov
 2021 19:29:11 +0000
Received: from CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:4:cafe::20) by CO2PR04CA0165.outlook.office365.com
 (2603:10b6:104:4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Tue, 23 Nov 2021 19:29:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT018.mail.protection.outlook.com (10.13.175.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Tue, 23 Nov 2021 19:29:10 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 23 Nov
 2021 19:29:10 +0000
Received: from dipenp.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 23 Nov 2021 19:29:10 +0000
From:   Dipen Patel <dipenp@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh+dt@kernel.org>
CC:     Dipen Patel <dipenp@nvidia.com>
Subject: [RFC v3 00/12] Intro to Hardware timestamping engine
Date:   Tue, 23 Nov 2021 11:30:27 -0800
Message-ID: <20211123193039.25154-1-dipenp@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47e5a767-133c-4679-6c56-08d9aeb78651
X-MS-TrafficTypeDiagnostic: CH2PR12MB4940:
X-Microsoft-Antispam-PRVS: <CH2PR12MB4940739DABDE5DE12915133AAE609@CH2PR12MB4940.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T54Ma4vmWdwAZtqUHsFHOyEDcW1uOCVv47sjJabng1GNJvzGH4uaSbNakyhz0OBMzkmbUE9ju3lj9EhjMM1TVsx0S0xUCo90GnhZBXOnVBYHgUeE9OjltmybfVKXR3P+Cybhcc/mpWwixE9VOR88ko4xEmhtuTZ24rJjgiVYuJLVZDoxnruZjHG2kp1QNaq8L0z7OOKdBByxEilE/A5AiH1/alI/lYD7Ni8Afa1r6FoFiZMdPENO4532zFa0pYMC8ce5bEbSvcptNKomAXBMczeTay1TGa3h7xeySCfNB6d/LBa/z4ZL8XfFqUtunkAXHXP8y2bP7dl3N6s/cZ/EvpEEFcpqxytLMrFE2oqClr70btCYz4jH8Am6s6NziG5cbZQzPVdTqopFR0u3T7AIMNLIQmnruOLgD/6oAyjCCojWc3Y22S9vhNRuZRMs0ZFJS14WcMTK6o8udm23ofPXSMtYvpgE8P9fLAj/ssRPoZJAgXjzYSzKazxV18DLXe/cEOgaaj5A3nE8XvPZtU3orqR6q/DEw+fhX5qucocNSkJyNb3jpY78DQsxBkn7YCPCy6nMsa+I/W01OwdczhXZpSvjDxWhKnrB2fglaXhZyUCsiHbp06WNeNOr3I8qeTGyuETFcAboT0HPrY8L9YuW7i7WVMXyXX/v/SrkAJIxpL+A1s8Qx56CR63gaSrIl4em37nfDMWCFOzurgSShpgfmi3sIgb2v3tBsv4QnHtumptA3ESbsQ2TD3DHXzAIarDD5H9BG+nFXrAjIr6sD2sMTD5rVGy49d2PaiMRoIid+PlQb+t9HExUotZsJqOO52KjSCJtemHqPX2gQp5pBnO3wtPyMmvzzq0s6VPWKYNmUd8=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(8676002)(426003)(2906002)(316002)(508600001)(2616005)(110136005)(6666004)(47076005)(7696005)(7416002)(82310400004)(1076003)(336012)(8936002)(921005)(36860700001)(26005)(186003)(5660300002)(36756003)(966005)(86362001)(107886003)(7636003)(83380400001)(70206006)(4326008)(356005)(70586007)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 19:29:10.4397
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47e5a767-133c-4679-6c56-08d9aeb78651
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4940
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch series introduces new subsystem called hardware timestamping
engine (HTE). It offers functionality such as timestamping through hardware
means in realtime. The HTE subsystem centralizes HTE provider and consumers
where providers can register themselves and the consumers can request
interested entity which could be lines, GPIO, signals or buses. The
HTE subsystem provides timestamp in nano seconds, having said that the provider
need to convert the timestamp if its not in that unit. There was upstream
discussion about the HTE at
https://lore.kernel.org/lkml/4c46726d-fa35-1a95-4295-bca37c8b6fe3@nvidia.com/

To summarize upstream discussion:
- It was heavily favoured by Linus and Kent to extend GPIOLIB and supporting
GPIO drivers to add HTE functionality and I agreed to experiment with it.
This patch series implements and extends GPIOLIB, GPIOLIB-CDEV and GPIO tegra
driver.
- Discussed possibility to add HTE provider as irqchip instead which
was argued against as HTE devices are not necessarily event emitting
devices. This RFC version 2 however tries to emulate threaded irq style
implementation.
- Discussed other possibility if HTE device can be added as posix clock
type like PTP clocks. That was also argues against since HTE devices
are not necessarily tightly coupled with hardware clock.

Typical HTE provider does following:
- Register itself with HTE subsystem
- Provide request, release, enable, disable timestamp and
get_clk_src_info callbacks to HTE subsystem.
- Provide optional xlate callback to the subsystem which can translate
consumer provided logical ids into actual ids of the entity, where entity here
is the provider dependent and could be GPIO, in chip lines or signals, buses
etc...This converted id will be used between HTE subsystem and the provider for
below bullet point.
- Push timestamps to the subsystem. This happens when HTE provider has
timestamp data available and willing to push it to HTE subsystem.
- Unregister itself on exit.

Typical HTE consumer does following:
- Request interested entity it wishes to timestamp in realtime to the
subsystem.
- The subsystem does necessary communications with the provider to
complete the request, which includes translating logical id of the entity to
provider dependent physical/actual id and enabling hardware timestamping on
requested id.
- The request includes callbacks, it will be used to push timestamps.
Optionally, the consumer can provided threaded callback, if specified, the HTE
subsystem will create kernel thread responsible executing the threaded callback.
- Release entity and its resources.

HTE and GPIOLIB:
- For the HTE provider which can timestamp GPIO lines.
- For the GPIO consumers, either in kernel or userspace, The GPIOLIB and its
CDEV framework are extended as frontend to the HTE by introducing new APIs.
- Tegra194 AON GPIO controller has HTE support known as GTE
(Generic Timestamping Engine). The tegra gpio driver is modified to accommodate
HTE functionality.

Changes in V2:
- Removed buffer management and related APIs from the HTE core.
- Removed timestamp retrieve APIs from the HTE core.
- Modified request API with two callbacks, second callback is invoked in thread
context and is optional, while first callback is mandatory and used to push
timestamp data to consumers.
- Replaced hte with hardware-timestamping in DT bindings as hte appeared too
short according to review comments.

Changes in V3:
- Corrected grammatical errors in HTE documentation and its bindings documents
- Removed multi-plural words in the HTE DT bindings
- Reflected changes done in DT bindings in the respective source codes
- Separated previous patch 07 into two patches in this series as 07 and 08
- Corrections in MAINTAINERS file

Dipen Patel (12):
  Documentation: Add HTE subsystem guide
  drivers: Add hardware timestamp engine (HTE)
  hte: Add tegra194 HTE kernel provider
  dt-bindings: Add HTE bindings
  hte: Add Tegra194 IRQ HTE test driver
  gpiolib: Add HTE support
  dt-bindings: gpio: Add hardware-timestamp-engine property
  gpio: tegra186: Add HTE in gpio-tegra186 driver
  gpiolib: cdev: Add hardware timestamp clock type
  tools: gpio: Add new hardware clock type
  hte: Add tegra GPIO HTE test driver
  MAINTAINERS: Added HTE Subsystem

 .../devicetree/bindings/gpio/gpio.txt         |   8 +
 .../bindings/gpio/nvidia,tegra186-gpio.txt    |   7 +
 .../hte/hardware-timestamps-common.yaml       |  29 +
 .../devicetree/bindings/hte/hte-consumer.yaml |  48 +
 .../bindings/hte/nvidia,tegra194-hte.yaml     |  80 ++
 Documentation/hte/hte.rst                     |  84 ++
 Documentation/hte/index.rst                   |  22 +
 Documentation/hte/tegra194-hte.rst            |  57 ++
 Documentation/index.rst                       |   1 +
 MAINTAINERS                                   |   8 +
 drivers/Kconfig                               |   2 +
 drivers/Makefile                              |   1 +
 drivers/gpio/gpio-tegra186.c                  |  89 ++
 drivers/gpio/gpiolib-cdev.c                   | 161 +++-
 drivers/gpio/gpiolib.c                        |  73 ++
 drivers/gpio/gpiolib.h                        |  12 +
 drivers/hte/Kconfig                           |  50 +
 drivers/hte/Makefile                          |   5 +
 drivers/hte/hte-tegra194-gpio-test.c          | 252 +++++
 drivers/hte/hte-tegra194-irq-test.c           | 169 ++++
 drivers/hte/hte-tegra194.c                    | 545 +++++++++++
 drivers/hte/hte.c                             | 907 ++++++++++++++++++
 include/linux/gpio/consumer.h                 |  19 +-
 include/linux/gpio/driver.h                   |  14 +
 include/linux/hte.h                           | 248 +++++
 include/uapi/linux/gpio.h                     |   1 +
 tools/gpio/gpio-event-mon.c                   |   6 +-
 27 files changed, 2886 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hte/hardware-timestamps-common.yaml
 create mode 100644 Documentation/devicetree/bindings/hte/hte-consumer.yaml
 create mode 100644 Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml
 create mode 100644 Documentation/hte/hte.rst
 create mode 100644 Documentation/hte/index.rst
 create mode 100644 Documentation/hte/tegra194-hte.rst
 create mode 100644 drivers/hte/Kconfig
 create mode 100644 drivers/hte/Makefile
 create mode 100644 drivers/hte/hte-tegra194-gpio-test.c
 create mode 100644 drivers/hte/hte-tegra194-irq-test.c
 create mode 100644 drivers/hte/hte-tegra194.c
 create mode 100644 drivers/hte/hte.c
 create mode 100644 include/linux/hte.h


base-commit: 5191249f880367a4cd675825cd721a8d78f26a45
-- 
2.17.1

