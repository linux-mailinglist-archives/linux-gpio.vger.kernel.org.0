Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCD8233FB30
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Mar 2021 23:30:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbhCQW3l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Mar 2021 18:29:41 -0400
Received: from mail-bn8nam11on2047.outbound.protection.outlook.com ([40.107.236.47]:16096
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229545AbhCQW3i (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 17 Mar 2021 18:29:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5rBNEleLlzcx8mkRB3mWhdCn6/RJUktK3FB/ktsb/jWsRXDWmCwgGfy7YXhsluWuH47HKzXX5O/az2pxWM5nexlGKDDpFzjuiIJyMYL6UocU1LbpSQJIsROtEFRo21O+2adjgL9CW7WjzLupNYBPM7R8pkjADZRPmknxiWYflUVLKyos4qL/OPRojif1AIjBSwBWtKjwZ0BxtmvMSI/Yam/+fzGSaMM7kn2iOkmHXekRCfHwfTRnDClFIpMt5ANK4OwH++srPxMjbTs+oIdsFyOcrFX5oazPnis2HsDs+4l/7cKZ1lJ3Iyp5gxmYFlQjHOesmts1g+iXMu0isPiTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CE/5aI3x0IukZ8lZtMm6uFSK7C6vi7rmu3cHKSvVgTU=;
 b=gXdIjJdL8kjPVw5f0cAZVGSOrKAycb08zOVl/j+RYBeDENXl/3ncYNCA+/tYniVXHm5v52EO+saTJkHtbsGSzNDDnCjbaYdm3GeSiL5bqFB29TKQa2akw4TQfyvkfXKeT4VgYAN/tfkwYRln8t66ECSMmcH39jaF/XS8e/f5foO35AS0N38D+nIWg39n/4z6gn3XFjErbzFqOjyvBwVcn1f5ZF3YyU4opma1yR8znCrPmNHmRbB/yxXu/fS+Nx9Cw6/GNjRgPXs/4TkmrEGZ3kul/tEnRxVLJJmYdEWCtDo259mnRfuqO2OxT2nY1Rm6JAEwgV9NUVWxze9pmXM98g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CE/5aI3x0IukZ8lZtMm6uFSK7C6vi7rmu3cHKSvVgTU=;
 b=nukjLn+WCGG9WhDTsRxr3olOj/ntDs0eYdroGIcSPnBGB0kcerom+9onGF0kybyNEuVTATJioQQvlQh/G8Ay8WrceRmVpcFT+gUz7zCtXyazRkEXwz6m3CGOKbXKKvieqdArWdFfg0tdQgCyZkxcJmlLgUzKiMuNhYOGQywz1r/oAxhqoUgTTgmS3RaR81keYMmNQdABjGbG3xowWr3tKPhAl6+9xrtoLv6U8k3WKbeABvktNQvrHQw9mpHcPKkmBs7Uenrki7redA6v+934/Qm5+Ek9SWuss/2/4U2ACYpu9XpD57PNqb+mp0ps9/codIMBA7M9JZY+OCWa4Hz7aA==
Received: from DM5PR04CA0060.namprd04.prod.outlook.com (2603:10b6:3:ef::22) by
 BL1PR12MB5269.namprd12.prod.outlook.com (2603:10b6:208:30b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 17 Mar
 2021 22:29:36 +0000
Received: from DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ef:cafe::94) by DM5PR04CA0060.outlook.office365.com
 (2603:10b6:3:ef::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Wed, 17 Mar 2021 22:29:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 DM6NAM11FT039.mail.protection.outlook.com (10.13.172.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 22:29:35 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 17 Mar
 2021 22:29:35 +0000
Received: from [172.17.173.69] (172.20.145.6) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Wed, 17 Mar 2021 22:29:34 +0000
X-Nvconfidentiality: public
To:     <linux-kernel@vger.kernel.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <linux-gpio@vger.kernel.org>
CC:     <linux-tegra@vger.kernel.org>
From:   Dipen Patel <dipenp@nvidia.com>
Subject: GTE - The hardware timestamping engine
Message-ID: <4c46726d-fa35-1a95-4295-bca37c8b6fe3@nvidia.com>
Date:   Wed, 17 Mar 2021 15:33:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18812a2e-be0a-4d0b-0a19-08d8e994251b
X-MS-TrafficTypeDiagnostic: BL1PR12MB5269:
X-Microsoft-Antispam-PRVS: <BL1PR12MB5269F45729FEB090E93A400EAE6A9@BL1PR12MB5269.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pOFYI86gjEI4x/Ri/X9nThrp1Vieh6UDCLampAG7n2LFYIcu4dSzDNbyAdhjBS9PoFmr4y8+RUzpTnBhpyeakjrZQ/JyraKUQ+WMn4jB25XSzpqdpSODcknGwW7vBTS1oIHUd/IowSrrDyqtHEnZGgFmkphrwSyxQCe9k09uzWtIm1UGk2/B9HGzj8yZmA8+7WTkHdSjijVqaxFWrrVIHfJlDsjt0HVWEm6j0mPqHU59MFwmd3doqwSgCwgA/Mt7kGBvOWDn/tkT7sGoq2+2E+tdN2cu/YrLHUQNjJOD5P6en42+1WPoP9rSRXiwROH4UIBz2QtpIzbZyLFFkO03kwu4eZdzxuVGO0Lb9iq3MVxUnJq8Mzrl/M4di4am6+l8gg5R2uTinFVWGozIzFrJuieciYID0mB6z8BPpjIt8mIjIKqxucHX0gFfN6GRgtxQE+qniSxFUTIpJRKCIk9MYQNQNmaT0JkPl41bv6QwWGCy7GAVOu/NnBddoEEvzjfnKO+n+ckgFZoipx7HFYaul83G9PpFMPeNwklcrgzZ7+YfiGzoNXLqm040RO2sClzbi/99efdRzOS3t3SE72hgAmNDV5VNeJ7+hNRX0Fsi3VCCyn6DK3rWntNjamOnvUT3A8g7mlfkirpwzi0Em6OsN/ECqHsiWZBm1cz/e7ZnMhRvamXG1d8oGiwLOHaHWaV3gzruPpkYyttqwN/nW7ZuTR8lvbAyoe/e/sE6T7mW7ZY=
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid04.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(396003)(39860400002)(46966006)(36840700001)(336012)(82310400003)(2616005)(4326008)(36756003)(316002)(34020700004)(36860700001)(426003)(8676002)(83380400001)(36906005)(8936002)(86362001)(47076005)(82740400003)(70206006)(5660300002)(478600001)(26005)(186003)(7636003)(70586007)(110136005)(2906002)(16576012)(6666004)(31696002)(31686004)(356005)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 22:29:35.8836
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18812a2e-be0a-4d0b-0a19-08d8e994251b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5269
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi All,

I wanted to discuss few implementation details regarding the GTE module and
wanted to know your feedback on certain aspects as below.

==================
GTE introductions:
==================
Nvidia Tegra SoCs have generic timestamping engine (GTE) hardware module which
can monitor SoC signals like IRQ lines and GPIO lines for state change, upon
detecting the change, it can timestamp and store in its internal hardware FIFO.
The advantage of the GTE module can be realized in applications like robotics
or autonomous vehicle where it can help record events with precise timestamp.

The GTE module however complicates the thing for GPIO monitoring compare to
IRQ lines as it has dependency on GPIO controller and that is where I will
probably will need your feedback to figure few things out before sending the
patches for the review. The below is the rough sequence to enable the hw
timestamp for a given signal using GTE module to put things into perspective.

============
For GPIO:
============
1.  GPIO has to be configured as input and IRQ must be enabled.
2.  Ask GPIO controller driver to set corresponding timestamp bit in the
    specified GPIO config register.
3.  Translate GPIO specified by the client to its internal bitmap.
3.a For example, If client specifies GPIO line 31, it could be bit 13 of GTE
    register.
4.  Set internal bits to enable monitoring in GTE module
5.  Additionally GTE driver can open up lanes for the user space application
    as a client and can send timestamping events directly to the application.

============
For IRQ:
============
x. Client sends IRQ line number to GTE driver
y. There is no need to translate as there is one to one correspondence with its
   internal bitmap, for example, IRQ line 31 will be bit 31 of the GTE internal
   register.
z. Set the required bits.

====================================================================
Doubts (specifically for the bullet 1,2,3 from GPIO section above):
====================================================================
b. Should GTE driver expect its client to send GPIO number as per the GPIO
   controller/framework numbering/namespace scheme?
b.1 The possible issues with this approach are:
b.1.1  It hast to make of_find_gpiochip_by_node function public which GTE driver
	   can use to confirm GPIO number that client sent is indeed belongs to the
	   controller which supports the timestamp functions as not all the GPIO
	   controllers support it.
b.1.2  GTE driver will need GPIO controller node either passed through its own
       device tree or through some other methods (if at all exist) to
	   facilitate b.1.1
c.  How GTE driver can talk to GPIO framework regarding bullet 2?
c.1 If it is through some callbacks then have to add "timestamp_control" like
    function hook in the gpio framework structure. This is under assumption
	bullet b is GPIO numbering scheme, we can then pass the same GPIO number to
	this hook to enable timestamp bit in GPIO controller.
d   GPIO logical numbering happens at the run time so GTE driver has to take
    care b.1.1, b.1.2 and c.1.
e.  Using above b.1.1, b.1.2 and c.1, GTE module can do bullet 1 and 2 for its
    clients or at least bullet 2.

f.  The other alternative is to have GTE its own GPIO numbering for its clients.
f.1 This approach completely decouples GPIO controller and GTE, where client
    will be responsible for bullet 1 and gpio controller driver will be
	responsible for the bullet 2 and possibly set timestamp bit of all the GPIOs
	it supports during probe as real timestamping starts anyway after GTE driver
	programs its corresponding registers so can be considered harmless.
f.2. I am more leaning towards this approach.

===============================================
Doubts regarding the place it in the kernel:
===============================================
g. Does GTE deserve its own subsystem or should it be consumed as part of some
   other subsystems?
g.1 GTE GPIO timestamp monitoring comes very close to what we already have in
    the gpiolib, more specifically lineevent part. Having said that however if
	I were to add GTE inside GPIO framework "somehow", it will require
	non-trivial gpio framework changes and at the same time it will make GTE
	module fragmented since GTE also timestamps other signals besides GPIO like
	IRQ as mentioned previously.
h. I am more leaning towards having its own subsystem.

Best Regards,
Dipen Patel
