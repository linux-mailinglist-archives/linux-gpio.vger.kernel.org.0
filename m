Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1178B41E4C5
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Oct 2021 01:26:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbhI3X23 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 19:28:29 -0400
Received: from mail-co1nam11on2066.outbound.protection.outlook.com ([40.107.220.66]:60033
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1349300AbhI3X2Q (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 30 Sep 2021 19:28:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O590OjkCkigi71lH430IlAJJikXxrGoZgPrT+HFMPZLUZn8M9XL1ZqrnTa3qa8NVOtWoUUx+GIkuunoRldogl4rz5UUihtgP5SEH2eyKuAmyzPDJygyaBuocSzMWBcokxP2Vu6OnRpipcDdVeCpCRX9c+NfhW1IrDETEV3dVSS9//ceSrF7avWCZqkdIRBep7EQf+lyWUHjLHLncV6Ip0qNHPD8Dq1vdgvIzR2fuZ4ZO3H7wKhBtVukbF1OdfxkW5YX6cjeKlqjK8ZZC4AplKvB5PijGIGiPQVJsWKL2pG2n3XFZojXZKw/dzzSw43jKfxSMLBchN9zEf/GJtHaiMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0Yu5rnU5d8AcmHIYO7BcG/8WZfT60JwfaOajcAeg3A=;
 b=BEAduZ/rkTWaOmdUPMRKWq0UBxrNLBuCyXkCg+FzqrSvsDkV3ZPJIY4PwIVVLRAeyMW+oqgjiq/aC04b62dPVgboAzlrM7fPv93wwTNIH6FPvEAdt+Ubr0oVa0TYh5EsBjenvr0ZEyNA0YqF/i4ttmSHgkNYFfT0XxUshWyO9LStqrACVzCC7zr9Tic7+TWMXZDc4YvklBMy2pdqwmetaVdlXdmPktRM5AZZ31PEQwQW6EzTDWWgkI2uHGJC5EAX8dyYF1GAKC4fIMBVfQNLo43oJNY0xiNIrcdt2p6HTIz4BHSv0xuJrhb6rH+QEPWDXaxVW5143T/qCJ5FCTw2rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0Yu5rnU5d8AcmHIYO7BcG/8WZfT60JwfaOajcAeg3A=;
 b=dwj3x0qJ6Ye4SyDPeAqL1573fWC/psU8/RZBV5B9wwIWPQOggRztHP9ulYHHBwPZVNVSe4bu9S6jBuf0bSOes8saCpVwW07DZ51uuwufscteUKZvO73ryG9j9jyqD3fuZTery3JMMX2Iuwh05JjnG3H14jtgpdNLR0vBP67Aqd/JrDuFZDKKPa/anHUyh2e6SaGNvEVhau36bx/eAre0G28R+9sxjUsTE63ZPB/oORs4JvFmcNYLvt7MNA/uYYcJEmoVq+v449BeLNJeSeEnUENtD25L1sI/KiSaJUPGkC+eCyFkUXtFmQArGXAQdhcr2GJu0Pm/ge2ystzntf2NAQ==
Received: from MWHPR19CA0002.namprd19.prod.outlook.com (2603:10b6:300:d4::12)
 by CH2PR12MB4859.namprd12.prod.outlook.com (2603:10b6:610:62::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.21; Thu, 30 Sep
 2021 23:26:31 +0000
Received: from CO1NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:d4:cafe::70) by MWHPR19CA0002.outlook.office365.com
 (2603:10b6:300:d4::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13 via Frontend
 Transport; Thu, 30 Sep 2021 23:26:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 CO1NAM11FT026.mail.protection.outlook.com (10.13.175.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 23:26:30 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 30 Sep
 2021 23:26:30 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 30 Sep
 2021 23:26:29 +0000
Received: from dipenp.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 30 Sep 2021 23:26:29 +0000
From:   Dipen Patel <dipenp@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh+dt@kernel.org>
CC:     Dipen Patel <dipenp@nvidia.com>
Subject: [RFC v2 00/11] Intro to Hardware timestamping engine
Date:   Thu, 30 Sep 2021 16:26:06 -0700
Message-ID: <20210930232617.6396-1-dipenp@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 307232c6-fbd2-495b-5adb-08d98469bbec
X-MS-TrafficTypeDiagnostic: CH2PR12MB4859:
X-Microsoft-Antispam-PRVS: <CH2PR12MB4859C09F95A22623031F07DCAEAA9@CH2PR12MB4859.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BDLv+XatWDz2YfP7jD2M3op+XvPGM6+WxKAYETceL9HgtUR+CVTtV1OkXdmXpMJHWE7RF0PSmz7OU8Dxp028LQ8SyGuV9YXyKC74cXoIXHW2nAfqLAkLC8KvJeNlBbCc2HUHuz3/3i/9ohU1Y+tdkAqXhEymCbscLTa20Qes/jSXVcqdeQ1erEhZdR04FdhK7fUj2aW4ixJ+BIkkMCNfgWDum3k1TTJFwfLUb3yNus6RhSse4Zqrn2o7nNZcQFsnAeF8WblNdIzyFocvA6XUoVU7H+pfOGC+iy3u+HUukVXBF0I1nbemDhZ4Ve3QUctFL6exyh8WEfub55HZ759b0Gn+cgZTLgNgyoi6FkL5oZd7MoaeBbhRuGvpGPkjvtzAwq8kKEyyQoEBAAt3LBXD1ytY/RhJ5jc6zoQiQvx8SBiHetgH+QWMlewYuWY5/++l0XXltPp+yQWzPNypZ2J/oJHSe9sPihM6a+lB+QoRtFAo2Hwn2oTYpwrBQlV2qnbfy0gutI50026A0qfV+/5UqDRBJywUAcDLUvbc63TAKS6s9yJEtsWAFKHXdpYbuJbgShKSR/ishSahVUi58/hrlK/PYcuJGhK7EVZj6HZgYOCEnhsIy5+zIFc+CEt6iF3GEHDhZrZhBYfg40V2QAgPekhDtqDSj+iEJzuKEy2PIb68KxenNiXnRoeB4FN0eHDGAU1Rg2YHtdL1CnxQy+pEv21CI7WJoZfbJQf+oOtxonlMB1R/zUSd6YsgYsMCk4rNURCajYk+fc3v/Uh2/aN04AuWgjbkkgQqbjwvpD4zDeqgsRe89Sh0auoFP6ddgq39vFQd87Y2gfFLfqJA/9XGUsE+2mFBXuYAFOWWerBz8vQ=
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid04.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(7636003)(2616005)(508600001)(186003)(426003)(47076005)(70586007)(70206006)(6666004)(36756003)(966005)(1076003)(36860700001)(86362001)(83380400001)(336012)(26005)(5660300002)(107886003)(7416002)(316002)(4326008)(7696005)(8936002)(82310400003)(2906002)(110136005)(921005)(8676002)(356005)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 23:26:30.7888
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 307232c6-fbd2-495b-5adb-08d98469bbec
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4859
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

Dipen Patel (11):
  Documentation: Add HTE subsystem guide
  drivers: Add hardware timestamp engine (HTE)
  hte: Add tegra194 HTE kernel provider
  dt-bindings: Add HTE bindings
  hte: Add Tegra194 IRQ HTE test driver
  gpiolib: Add HTE support
  gpio: tegra186: Add HTE in gpio-tegra186 driver
  gpiolib: cdev: Add hardware timestamp clock type
  tools: gpio: Add new hardware clock type
  hte: Add tegra GPIO HTE test driver
  MAINTAINERS: Added HTE Subsystem

 .../bindings/gpio/nvidia,tegra186-gpio.txt    |   7 +
 .../hte/hardware-timestamps-common.yaml       |  29 +
 .../devicetree/bindings/hte/hte-consumer.yaml |  48 +
 .../bindings/hte/nvidia,tegra194-hte.yaml     |  79 ++
 Documentation/hte/hte.rst                     |  83 ++
 Documentation/hte/index.rst                   |  22 +
 Documentation/hte/tegra194-hte.rst            |  56 ++
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
 drivers/hte/hte-tegra194.c                    | 554 +++++++++++
 drivers/hte/hte.c                             | 907 ++++++++++++++++++
 include/linux/gpio/consumer.h                 |  19 +-
 include/linux/gpio/driver.h                   |  14 +
 include/linux/hte.h                           | 248 +++++
 include/uapi/linux/gpio.h                     |   1 +
 tools/gpio/gpio-event-mon.c                   |   6 +-
 26 files changed, 2884 insertions(+), 12 deletions(-)
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


base-commit: 2d02a18f75fc81177a4e30f3aaaed9af06cc3adc
-- 
2.17.1

