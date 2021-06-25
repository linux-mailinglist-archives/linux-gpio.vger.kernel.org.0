Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BCA03B4B1E
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Jun 2021 01:48:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbhFYXu3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Jun 2021 19:50:29 -0400
Received: from mail-dm6nam12on2067.outbound.protection.outlook.com ([40.107.243.67]:22849
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229826AbhFYXu2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 25 Jun 2021 19:50:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5F3mwGU/+ykS0sKNq8zoE1OZpaNuBGwFfCr2Fa3mH97eDnRHy/XA+/KdGr7o00VHyzInDFA6JKaKOvH8gREtiy1l8NwtaRzbmR4LABDckvZUvmqo2XJ49xUebXWoV0PTShg1+HUWHxuiwg7wdxswR5tgUMSO/7cyWYq/U0yLFuAONvO6hBrJMfiYrz91h65HOrv6eKI19UaZmiMYABB/JVLwH6HehX9mI+5fyBlNz24J0OEeZK105UW493gFoF778ZM0Ki2phf22SLOwLHa62Bg+bwGjoee1d0ZlIrmJNFcABWdVowOoDDVwFjCeOn+uMlWPvtKHtnf8i5gDJ4Hew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTdCnpPaJorRryz0GInFofWMgeJwgPioCgWpCAUvDcY=;
 b=IseBqJU6zFJSYhIRsuuirFt0J2wgU9JZm8QERK86g6od50ZoYmpWK62+km+1ChzoANWbuoV751FtAY1yatLXm6RXBpDDBC8tGaL6F05bNLyjIloOLvRrawp9Qr0jaOfPOps7fmdhNXV+EOHEB5QIrCip5SBO3S1v/tbofk2mwKXvW7/kePDvb/vJu7myRAoJ22TLli8ayuSdrObI10YfS/eUdiInhWwCsiGjlLGHrBm3GGoiQ7/g3oLQCZ5mlKW1U3M9piLXtWsXvu8xlIjeDZXOSHYUyici7tAUh0e9vPji7cNwQzq4/CLBli7Mb9rsV5wNG4ekY8/Zde4obAnL9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTdCnpPaJorRryz0GInFofWMgeJwgPioCgWpCAUvDcY=;
 b=ClD94nmzQWzmDuYruDbVyi0myIzwBRfU2bhQRN0LgDzPrGFu7EzgObA1LsfX3NisOEZrpMCJOmq/jtbJyPSmU1XXX6hj1KB27hhu9NPDvdwCuTrERX611Vc+JvCO97dWqytsUHi2MFuz4XFWdzt819Xpr1ROjiPKeeYPTWq9AteQfI5+/qCOz8F6gyYE68sDrSTvkRQToiqMwoPhjjCYNa5rrgo2wzdXcnwCx8ZmWMZwIvGxOY1PztKbkQiIEp0ipm/v8xtZ9WcZBPP+Zv4dafOTdxidb3LFQ+Ybgi+9qQEQgVRB56GG4OJiEnfyVDvvehJuAUs9ntxCj6TuqwbGTg==
Received: from DM6PR03CA0015.namprd03.prod.outlook.com (2603:10b6:5:40::28) by
 BYAPR12MB2872.namprd12.prod.outlook.com (2603:10b6:a03:12e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Fri, 25 Jun
 2021 23:48:03 +0000
Received: from DM6NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:40:cafe::33) by DM6PR03CA0015.outlook.office365.com
 (2603:10b6:5:40::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Fri, 25 Jun 2021 23:48:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 DM6NAM11FT040.mail.protection.outlook.com (10.13.173.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4264.18 via Frontend Transport; Fri, 25 Jun 2021 23:48:02 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 25 Jun
 2021 23:48:01 +0000
Received: from dipenp.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Jun 2021 23:48:01 +0000
From:   Dipen Patel <dipenp@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <dipenp@nvidia.com>, <robh+dt@kernel.org>
Subject: [RFC 00/11] Intro to Hardware timestamping engine
Date:   Fri, 25 Jun 2021 16:55:21 -0700
Message-ID: <20210625235532.19575-1-dipenp@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35b64ad0-19c0-46ef-426d-08d93833abe5
X-MS-TrafficTypeDiagnostic: BYAPR12MB2872:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2872F90C790A49A1E89725AAAE069@BYAPR12MB2872.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OeMe4vaUbZa8dUWTni21dyiuTUN9oOE9sam7kqtaYREt3prYUdSsGhyhRl44jPQj8qjBRKLC6C2rfi3lBX1Llhx/Y8+kC0jOb0PSOfbx6bJfYZYwQNItv3707pcKnIWc0K2M/bkF2GJs2C5ZEqUPwD7q+S+Txid6CuCmjhP/JwbuM2iHMSDDvnmFXQ6/iIs81jFoCj9BDLoUnf6g23obyNRnmxdV2ga3krUoeXjRdb02Lu+6CB0JxMr1/hNauEc9TtBosHMW03KJeyk57QSyGBeeSVbbkTuIiFgomZKPqhfa5H7kXpMIu7J9UUsZNIf7sJPt9sGsV9+GyNs6GwqEmxA9qNtXw9pML8QD5zM4/Ig4tvae9i4zL/59jHwX55GYwyPGdh04LCdL4MghZeCZxRxGyeaW/BDFQ/0YRjLU6pWcyiGHm+YkONMSMwbFHSyAIHDsWLnJAztp8bCuy5YiCYd5ONIctyGoN4Y5L0/N+wxK8YzvelY5G+UUEOHvA1iYTGDixjcJ019dVyI8mMNWWUWBk4pgSwAZJ88p7oheH7LTbjKQEtWix3/RFi57i2pb1iOMmLkqTCdpRuFtuc7fB8gfZUVHN1BNeCY0Unm1m34YycggY/E7p0//xsvZqAfNt0Ef3PbIMaQ+mkmExYktGUWNf4L5GRxrSp76qHL+hTAkObM+vJjb1KYcGwwXS/FXHl41yNRVBdltAKmNOC44Gt+cmI1edE09e0HQQ70PUVetf22RfQyX6e+1lupbGa40QNDMwafRsqnE8Soyuh8fGYNWPCF5DJV8Oqrbbs7jRICJO0LgH5m+e/qxEP49UzjBd0T7OGjB2j2u/oxj8S4lrg==
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(396003)(346002)(136003)(46966006)(36840700001)(478600001)(7416002)(8676002)(8936002)(426003)(7696005)(82310400003)(6666004)(2616005)(966005)(5660300002)(82740400003)(86362001)(83380400001)(26005)(336012)(70586007)(7636003)(356005)(316002)(36756003)(1076003)(47076005)(70206006)(921005)(110136005)(2906002)(36860700001)(186003)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 23:48:02.6952
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b64ad0-19c0-46ef-426d-08d93833abe5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2872
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch series introduces new subsystem called hardware timestamping
engine (HTE). It offers functionality such as timestamping through hardware
means in realtime. The HTE subsystem centralizes HTE provider and consumers
where providers can register themselves with subsystem and the consumers can
request interested entity which could be lines, GPIO, signals or buses. The
HTE subsystem provides timestamp in nano seconds, having said that the provider
need to convert the timestamp if its not in that unit. There was upstream
discussion about the same at
https://lore.kernel.org/lkml/4c46726d-fa35-1a95-4295-bca37c8b6fe3@nvidia.com/

To summarize upstream discussion:
- It was heavily favoured by Linus and Kent to extend GPIOLIB and supporting
GPIO drivers to add HTE functionality and I agreed to experiment with it.
This patch series implements and extends GPIOLIB and GPIO tegra driver.
- Discussed possibility to add HTE provider as irqchip instead which
was argued against as HTE devices are not necessarily event emitting
devices.
- Discussed other possibility if HTE device can be added as posix clock
type like PTP clocks. That was also argues against since HTE devices
are not necessarily tightly coupled with hardware clock.

Typical HTE provider does following:
- Register itself with HTE subsystem
- Provide *request, *release, *enable, *disable timestamp callbacks and
optional get_clk_src_info callback to HTE subsystem.
- Provide optional xlate callback to the subsystem which can translate
consumer provided logical ids into actual ids of the entity, where entity here
is the provider dependent and could be GPIO, in chip lines or signals, buses
etc...This converted id will be used between HTE subsystem and the provider for
below bullet point.
- Push timestamps to the subsystem. This happens when HTE provider has
timestamp data available and willing to push it to HTE subsystem. The HTE
subsystem stores it into software buffer for the consumers.
- Unregister itself

Typical HTE consumer does following:
- Request interested entity it wishes to timestamp in realtime to the
subsystem. During this call HTE subsystem allocates software buffer to
store timestamps data.
- The subsystem does necessary communications with the provider to
complete the request, which includes translating logical id of the entity to
provider dependent physical/actual id and enabling hardware timestamping on
requested id.
- It can optionally specify callback during registration, this cb will
be called when provider pushes timestamps. Once notified through cb, the
consumer can call retrieve API to read the data from the software buffer.
If cb is not provided, the consumers can elect to call blocking version of
retrieve API.
- Manage pre allocated software buffer if needed. It includes changing buffer
length and watermark/threshold. The subsystem automatically sets watermark or
threshold at 1, consumers can later change it to any other value it wishes. The
main purpose for having threshold functionality is to notify consumer either
through callback if provided or unblock waiting consumer when threshold is
reached.
- Retrieve timestamp using various means provided by subsystem.
- Release entity and its resources.

HTE and GPIOLIB:
- For the HTE provider which can timestamp GPIO lines.
- For the GPIO consumers, either in kernel or userspace, The GPIOLIB and its
CDEV framework are extended as frontend to the HTE by introducing new APIs.
- Tegra194 AON GPIO controller has HTE support also known as GTE
(Generic Timestamping Engine). The tegra gpio driver is modified to accommodate
HTE functionality.

Dipen Patel (11):
  Documentation: Add HTE subsystem guide
  drivers: Add HTE subsystem
  hte: Add tegra194 HTE kernel provider
  dt-bindings: Add HTE bindings
  hte: Add Tegra194 IRQ HTE test driver
  gpiolib: Add HTE support
  gpio: tegra186: Add HTE in gpio-tegra186 driver
  gpiolib: cdev: Add hardware timestamp clock type
  tools: gpio: Add new hardware clock type
  hte: Add tegra GPIO HTE test driver
  MAINTAINERS: Added HTE Subsystem

 .../bindings/gpio/nvidia,tegra186-gpio.txt    |    7 +
 .../devicetree/bindings/hte/hte-consumer.yaml |   47 +
 .../devicetree/bindings/hte/hte.yaml          |   34 +
 .../bindings/hte/nvidia,tegra194-hte.yaml     |   83 +
 Documentation/hte/hte.rst                     |  198 +++
 Documentation/hte/index.rst                   |   21 +
 Documentation/hte/tegra194-hte.rst            |   65 +
 Documentation/index.rst                       |    1 +
 MAINTAINERS                                   |    8 +
 drivers/Kconfig                               |    2 +
 drivers/Makefile                              |    1 +
 drivers/gpio/gpio-tegra186.c                  |   78 +
 drivers/gpio/gpiolib-cdev.c                   |   65 +-
 drivers/gpio/gpiolib.c                        |   92 ++
 drivers/gpio/gpiolib.h                        |   11 +
 drivers/hte/Kconfig                           |   49 +
 drivers/hte/Makefile                          |    4 +
 drivers/hte/hte-tegra194-gpio-test.c          |  255 +++
 drivers/hte/hte-tegra194-irq-test.c           |  400 +++++
 drivers/hte/hte-tegra194.c                    |  554 +++++++
 drivers/hte/hte.c                             | 1368 +++++++++++++++++
 include/linux/gpio/consumer.h                 |   21 +-
 include/linux/gpio/driver.h                   |   13 +
 include/linux/hte.h                           |  278 ++++
 include/uapi/linux/gpio.h                     |    1 +
 tools/gpio/gpio-event-mon.c                   |    6 +-
 26 files changed, 3657 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hte/hte-consumer.yaml
 create mode 100644 Documentation/devicetree/bindings/hte/hte.yaml
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

-- 
2.17.1

