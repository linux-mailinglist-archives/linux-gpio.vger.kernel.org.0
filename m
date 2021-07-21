Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70A4D3D0E66
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jul 2021 14:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238301AbhGULVQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Jul 2021 07:21:16 -0400
Received: from mail-sn1anam02on2044.outbound.protection.outlook.com ([40.107.96.44]:42871
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238438AbhGULN5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 21 Jul 2021 07:13:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fm6ItjZLJfcY0ZghmuIoDWlGL/BUMkEK5FT9Yh3tMLYcZe4JQa1Hqx9GlmL4E0xOqhK4UaXW9zrnu7IDSILOEvSfFXHcSnZ7/nWtb3ugkDhFrQA/DHOe6qQVZD7GaQmuXw/6Pml23FUrO0m2vZf0c5Erk0Rp6AKNNJ5IuHJ5UsubzlrwX95F+OVaglxj8dXzvoqtW3ZnDuSFZfJVuuMWHIFHGsKmyLunWnm/uL7gLrKqU1RYfIkhE+GvmUiMZLf9jMtly56cAB6l9AaJVMCVgZjqvfb6fVsd5FJ5u1sMsED/IW80dNLP4M2k5/EGE5OPsnvK/cTtbYbw6eASJYiGzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xxpJ6fIAa/zRBwSDqYd243UC1fjkHambavZmlLQuj7k=;
 b=NuuQnkLIG6wN7GQgIWBtuvUSIXOScWYm9GAbJAHaEv18xXoCEnjK8qE4tmJ+akzlszP8ymF/CCc/sr1UjtH6mb39Y8bqGFvOcCYhUc3Uo2mMuuyIFcNvARw6H6jw9piAzZcpjBhqn9WPfKDCbJMAtvzD94jmfN1ZyrKUgqW67hWh4+1nssNtpN+jK1OTHrMQOi3SLTR9Ajmaz8vQ/zRgKPtqbMv1oNWqO1PFkAQlV0yhWPVnX4ifyhxnDNeK8iQRAv+klCv3CjEfRCHyxKJNFpq3czD/jb387Lkl8G+Lvpo79OUWkyV5+hsJfiOd0Eq3u5zkqpaEriq/7qZER+Q6Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xxpJ6fIAa/zRBwSDqYd243UC1fjkHambavZmlLQuj7k=;
 b=O9/Cct3Fn0Vzuue3hDAQ4UdBV39Z+wei/DkLXhgvoWCk0LA1uUVFAJDZh1A07u1eYaVjMgt8GwzcuQK9wfG3N5nuzrNKWhrDPtclHU0Z6EVMcpLv75ul7NbZaE4RNAQrwAdvbApDV7RnQ2iWc7OQEy+A4IEMxSJM1WMyST3Mjx8=
Received: from BN6PR13CA0059.namprd13.prod.outlook.com (2603:10b6:404:11::21)
 by DM6PR02MB5849.namprd02.prod.outlook.com (2603:10b6:5:156::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Wed, 21 Jul
 2021 11:54:32 +0000
Received: from BN1NAM02FT052.eop-nam02.prod.protection.outlook.com
 (2603:10b6:404:11:cafe::92) by BN6PR13CA0059.outlook.office365.com
 (2603:10b6:404:11::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.7 via Frontend
 Transport; Wed, 21 Jul 2021 11:54:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT052.mail.protection.outlook.com (10.13.2.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Wed, 21 Jul 2021 11:54:32 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 21 Jul 2021 04:54:25 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Wed, 21 Jul 2021 04:54:25 -0700
Envelope-to: git@xilinx.com,
 saikrishna12468@gmail.com,
 robh+dt@kernel.org,
 linus.walleij@linaro.org,
 gregkh@linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.106] (port=50891 helo=xhdvnc125.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <lakshmi.sai.krishna.potthuri@xilinx.com>)
        id 1m6Anw-000EUU-EO; Wed, 21 Jul 2021 04:54:24 -0700
Received: by xhdvnc125.xilinx.com (Postfix, from userid 14964)
        id A7339121273; Wed, 21 Jul 2021 17:24:23 +0530 (IST)
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
Subject: [PATCH 0/4] pinctrl: pinctrl-zynq: yaml conversion and minor driver updates
Date:   Wed, 21 Jul 2021 17:22:29 +0530
Message-ID: <1626868353-96475-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71e5cda5-7ca8-4f1a-3f70-08d94c3e4d95
X-MS-TrafficTypeDiagnostic: DM6PR02MB5849:
X-Microsoft-Antispam-PRVS: <DM6PR02MB5849B082447EB34C20FC2198BDE39@DM6PR02MB5849.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rzb+D7CsgZj1/6puUPuulQ+XdWpnucdLDsJQTrBjvvdE7aY/pMZ1eeFTTnoeUeDQHuzkC1NgoYgMijA9QrKtIJK/0rvniQsairidlEQ8aLxqPScm6cZdyw9UuDJHWAj1IUJ3M8/8K+SQkYkqmS9IFiNSAl9rtSX5LPrRocTns5Zc9EAbvIg8ae3/JpqHysi4zG4bj6FmunyRJ6IYOendQ+ZXyoFVcl6o2V6sBT+OcXHgeeMZ9GxJzD+EQ0nqoPTcjWf7Ty6uZ/NG+y4KL9vsmVA79zKd7Z97fSJwDZeyUcb8OqAQmTJcyNKDjo+7tww1mUbtnxpzQextPHIVFtojOgFyvzRKGpSTDUkZbogqa7wClqClxto+XbSDp1N4SKpiJu5bulojbTm08MC3su4KaPNaqJ8AWpNqJBwEjXVhtrG3LN/vfvVbaHfNBXftRkjSVPsjdpS0ssPOvhndv1Y+Q/EUa2D8qnymKU9/aK7xjAzwpkmLMhP63io8BNrT9VTQ9BX94Z5bbgpGMHDDUN9irQz3ee+jnTRc0GzgaOfHW45aKivjvVZ3BIFfo/8VDnsXEO7krWrojZNz3MRmcstiL27z9MhjSTaI+ON+bnLRtCMmT8oxcnqoWEzXO8c1RoanoqKox2m8mVKClTbHIWrnN6yoh7ZgTKIbWC7P5wLQxe9ob/LK4IVvrOdt1jgso/JusMJPblJx/07XNuuXnyYJxU98VLYpBwPRi98ZvD40HOE78oNsm3ArQKQ+Og3XPH9XZyFRBUzfbhTZWSPnDXjOprOyj8s3xs3236XaokYXUN4qZUKju+7qN8smCRs5d/rt
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(136003)(39860400002)(36840700001)(46966006)(47076005)(4326008)(107886003)(26005)(36906005)(36860700001)(2906002)(83380400001)(316002)(82310400003)(42186006)(82740400003)(5660300002)(336012)(426003)(110136005)(186003)(54906003)(70206006)(2616005)(6266002)(478600001)(15650500001)(356005)(70586007)(36756003)(8936002)(8676002)(7636003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 11:54:32.1626
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71e5cda5-7ca8-4f1a-3f70-08d94c3e4d95
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT052.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5849
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch series does the following
- Covert Zynq pinctrl driver binding file to yaml.
- Update the binding for Zynq pinctrl to replace the 'io-standard' with
'power-source' parameter as recommended by Linus during ZynqMP pinctrl
driver review(https://lkml.org/lkml/2021/3/25/278).
- Update the Zynq pinctrl the driver to remove custom pin
parameter(io-standard) and instead use generic parameter(power-source).
- Update Zynq dts files to replace 'io-standard' with 'power-source'.

Reason for adding the generic parameter 'power-source' in Zynq pinctrl driver
is to maintain common pin parameter across Xilinx Zynq and ZynqMP platforms
for power supply configuration.

Sai Krishna Potthuri (4):
  dt-bindings: pinctrl: pinctrl-zynq: Convert to yaml
  dt-bindings: pinctrl-zynq: Replace 'io-standard' with 'power-source'
  pinctrl: pinctrl-zynq: Add support for 'power-source' parameter
  arm: dts: zynq: Replace 'io-standard' with 'power-source' property

 .../bindings/pinctrl/xlnx,zynq-pinctrl.txt    | 105 ---------
 .../bindings/pinctrl/xlnx,zynq-pinctrl.yaml   | 214 ++++++++++++++++++
 arch/arm/boot/dts/zynq-ebaz4205.dts           |   8 +-
 arch/arm/boot/dts/zynq-microzed.dts           |   2 +-
 arch/arm/boot/dts/zynq-zc702.dts              |  20 +-
 arch/arm/boot/dts/zynq-zc706.dts              |  18 +-
 drivers/pinctrl/pinctrl-zynq.c                |   2 +
 include/dt-bindings/pinctrl/pinctrl-zynq.h    |  17 ++
 8 files changed, 257 insertions(+), 129 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/xlnx,zynq-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/xlnx,zynq-pinctrl.yaml
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-zynq.h

-- 
2.17.1

