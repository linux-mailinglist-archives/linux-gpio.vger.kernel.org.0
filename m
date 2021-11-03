Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF57443AC5
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Nov 2021 02:15:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230441AbhKCBRj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 21:17:39 -0400
Received: from mail-dm3nam07on2058.outbound.protection.outlook.com ([40.107.95.58]:57696
        "EHLO NAM02-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229844AbhKCBRi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 2 Nov 2021 21:17:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fTyCM1PPK29661OEVx2aXfNqlKO42yuCXkRUTVd9KXWvGlnvYlQrjo8kpA+W2+9oePIOE5VzJd7z+qlhi6qeKTXVQFCWp84Trsk2NB7m/ACu7k1lmYY0m28OzWYiqnpFu8venabiMEh+SnXG/s5lm5HwOYnEj34HIhBlYcNQMC9MNjGYt8jdD6cnK7NU4Nata10jHU++VyLK2DMNIQCfumjQcuOzN2D15WZ7J5I0/XicMYtu2IVD6uSvze/nO4zqd299LwBzYqUtDm/OUvbuFFvGsl5EjPdZAS959rTcbk9MsEGdmSNgk/PkOEnHbZvqzVZHPJcEmjWqkylVa1kfrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eysF3hdINqovqB1I/mex49DDCdkm0yWVTu0rJKpItk8=;
 b=ICNG6af1W+tq6wOpoSSZRfoloiEYfqOFjAZKrY9Q9VBKTFk62tKuNuyl5BFF51/u1gFZex7QuwAAzlOWf8RSiJQFryFNsQFsCa0q35LybEy9+fwS8z3PJ1KHVoc7NSQcBD7XFbaqJrF0cRAzzNDkeasaIPG+Od6TjuL5XQur8Me0mFFpgoK9XTQEbDC6iLC/+o1XqDCbBvOBnOYjUITrPNjvtE1NN/1qR3NGOaURcAQ2jfwYGNPfQFxYTanRlIevhLMWIQg+Lmgn9ob7RYTzAv+TFPqa5sHNxs/expW5Py8FWvA9tBJR8vfP9cE2QMG67iX0iUMyDgjXV9ZlU3Wrqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eysF3hdINqovqB1I/mex49DDCdkm0yWVTu0rJKpItk8=;
 b=CzGPGMKUoqQca5eXXnvhDBx588iW2o8JzNUdKruERjQ9IlLw+AjVrNHhJq2l5wr+cxrzRBwEFs//9blVHUEZrP8fsckCvx+IHWUOWAFt53pfBsscbUK6fbUgr1TbaE6mckXKhSuichpfttIhVTxpvWZJesmmZlNLagXIqMjevJRehu+VIuomxK1QhfnEilrguVpBnrhPbPUc5TL6JTHWSZ2lJn3fOfqYj8bJWFZaO+c18oso/mGD2dqp/FQJcOxOESbM2kqWdBrDBWJYSC66j5SfQiIfDkX/G3SEjqsCduaXxTc4pm3WPCSzfKM/TPSbfrHqS8MUAVdhJqntsOwCYw==
Received: from DS7PR03CA0101.namprd03.prod.outlook.com (2603:10b6:5:3b7::16)
 by DM6PR12MB2761.namprd12.prod.outlook.com (2603:10b6:5:41::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 01:15:00 +0000
Received: from DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b7:cafe::66) by DS7PR03CA0101.outlook.office365.com
 (2603:10b6:5:3b7::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Wed, 3 Nov 2021 01:15:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT038.mail.protection.outlook.com (10.13.173.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 01:15:00 +0000
Received: from [172.17.173.69] (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 3 Nov
 2021 01:14:58 +0000
Subject: Re: [RFC v2 03/11] hte: Add tegra194 HTE kernel provider
To:     Randy Dunlap <rdunlap@infradead.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <warthog618@gmail.com>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <robh+dt@kernel.org>
References: <20210930232617.6396-1-dipenp@nvidia.com>
 <20210930232617.6396-4-dipenp@nvidia.com>
 <c86597f6-495f-5fa1-d7ff-9bd05c8d2788@infradead.org>
X-Nvconfidentiality: public
From:   Dipen Patel <dipenp@nvidia.com>
Message-ID: <be583bc9-0e0f-ed94-6a29-336baaac9d39@nvidia.com>
Date:   Tue, 2 Nov 2021 18:15:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <c86597f6-495f-5fa1-d7ff-9bd05c8d2788@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69341790-74d0-4ac6-a7d6-08d99e675b9f
X-MS-TrafficTypeDiagnostic: DM6PR12MB2761:
X-Microsoft-Antispam-PRVS: <DM6PR12MB27611BBBA09D437F0D624FF4AE8C9@DM6PR12MB2761.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l+uMfv46yzJTchh5mhyPpnEeJGui8+wyrY5UT967W+7e0rFjxG/krBubJgUU7gJhd3yQ3lY/AoNg0wrfwY5w2eDKiLurjP+2tlwjSIJ34OaKvrbEVz+Imeiu1w9kPHZZPaUQhlAGOCC6V1YBNX2jb3IA0uISSKC5FYW8xH/IpEPFASQMogm15MSstL3qz2K8/XCWT/5XXLN/ziDrjKFwG95R+5h28NL4wTyPoZFG4A+GpHFI7B5tHVqxDp1dI87M+V6nU7KQ2XSv4k/SnCTiGJFTZYGSRwp8xsMeaIE+HyF3KuO8OazDFtsqK+fj2m9NLR8AtzDfIDyofTxnfZ7vQiDeUOTjNhuQIlhCrvtTtQGi18RfJlUgNegqY6/j2TSR6JC429fSNEHjOVEGlytJHZBXcUry6JVh4xRowEHt1q63uhsyV6BdOeoYQne26Xz7FVY1ce5NQxCQNBR81h+y3bj2/5aoosklQWiIGyO0L7VwCmjTdqgMzr4KPQhT1vBz6IrpM21KSxwEcKn+wAE5uT+LDZOqY80jQY8Pymr70hN75VBwQpx+8buNRPmre94U0vs2H8cG8nfbsgqRrt+FGEDelxAD7TghoTT17iVnmhygIbR5pvDBuwzCYAi5ImG7fFTm7w3AFYXEdJa6PEPZu7GhOKZ5U3UCV5VY8ThLFRUycqMLRA+CSz8DXvYWaRMAg0u/DBLujuHaSf+NU0xIl/unxHquDpcSHYbxBYjBSWXSaxLqqgO7SiinRlB0x9GTewp53zefw2H5xXIhO85M+UcRIZgEGvd9qPIMtVBw7AA=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(336012)(47076005)(508600001)(8676002)(316002)(82310400003)(36756003)(110136005)(426003)(83380400001)(7416002)(86362001)(2616005)(36906005)(356005)(53546011)(16576012)(31696002)(5660300002)(921005)(70586007)(70206006)(2906002)(31686004)(7636003)(26005)(186003)(36860700001)(16526019)(8936002)(83996005)(43740500002)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 01:15:00.3886
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69341790-74d0-4ac6-a7d6-08d99e675b9f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2761
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Randy,

Thanks for the comments. I will implement changes in RFC V3.

Best Regards,

Dipen Patel

On 10/1/21 5:07 PM, Randy Dunlap wrote:
> On 9/30/21 4:26 PM, Dipen Patel wrote:
>> diff --git a/Documentation/hte/tegra194-hte.rst b/Documentation/hte/tegra194-hte.rst
>> new file mode 100644
>> index 000000000000..fb229bda2408
>> --- /dev/null
>> +++ b/Documentation/hte/tegra194-hte.rst
>> @@ -0,0 +1,56 @@
>> +HTE Kernel provider driver
>> +==========================
>> +
>> +Description
>> +-----------
>> +The Nvidia tegra194 HTE provider driver implements two GTE
>> +(Generic Timestamping Engine) instances 1) GPIO GTE and 2) LIC IRQ GTE. The
>
>                                  instances:                                ^^Drop "The"
>
>> +both GTEs instances get the timestamp from the system counter TSC which has
>
>    Both
>
>> +31.25MHz clock rate, and the driver converts clock tick rate to nano seconds
>
>                                                                    nanoseconds
>
>> +before storing it as timestamp value.
>> +
>> +GPIO GTE
>> +--------
>> +
>> +This GTE instance timestamps GPIO in real time, for that to happen GPIO
>
>                                              time. For
>
>> +needs to be configured as input and IRQ needs to ba enabled. The only always on
>
>                                                     be
>
>> +(AON) gpio controller instance supports timestamping GPIOs in realtime and it
>
>          GPIO                                                    real time {or change
>                            the instance 3 lines above to be "realtime"}
>
>> +has 39 GPIO lines. The GPIO GTE and AON GPIO controller are tightly coupled as
>> +it requires very specific bits to be set in GPIO config register before GPIO> +GTE can be used. The GPIO GTE functionality is accessed from the GPIOLIB
>> +framework for the in kernel and userspace consumers. In the later case,
>
>                      in-kernel                                 latter
>
>> +requests go through GPIOLIB CDEV framework. The below APIs are added in GPIOLIB
>> +framework to access HTE subsystem and GPIO GTE.
>> +
>> +.. kernel-doc:: drivers/gpio/gpiolib.c
>> +   :functions: gpiod_req_hw_timestamp_ns gpiod_rel_hw_timestamp_ns
>> +
>> +There is hte-tegra194-gpio-test.c, located in ``drivers/hte/`` directory, test
>> +driver which demonstrates above APIs for the Jetson AGX platform.
>> +
>> +For userspace consumers, GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE flag must be
>> +specifed during IOCTL calls, refer ``tools/gpio/gpio-event-mon.c``, which
>
>    specified             calls. Refer to
>
>> +returns the timestamp in nano second.
>
>                             nanoseconds.
>
>> +
>> +LIC IRQ GTE
>> +-----------
>> +
>> +This GTE instance timestamp LIC IRQ lines in real time. There are 352 IRQ
>
>                      timestamps                 ^^^^^^^^^ {be consistent}
>   (also (repeating a prior email) define "LIC")
>
>> +lines which this instance can help timestamp realtime. The hte devicetree
>
>                              can add timestamps to in realtime.
>
>> +binding described at ``Documentation/devicetree/bindings/hte/`` gives out
>
>                                                                    provides an
>
>> +example how consumer can request IRQ line, since it is one to one mapping,
>
>    example of how a consumer can request an IRQ line. Since it is a one-to-one mapping,
>
>> +consumers can simply specify IRQ number that they are interested in. There is
>
>                         specify the IRQ number
>
>> +no userspace consumer support for this GTE instance. The sample test code
>> +hte-tegra194-irq-test.c, located in ``drivers/hte/`` directory,
>
>                                     in the
>
>> +demonstrates how to use IRQ GTE instance. The below is sample device tree
>
>                 how to use an IRQ GTE instance.
>
>> +snippet code for the test driver::
>> +
>> + tegra_hte_irq_test {
>> +        compatible = "nvidia,tegra194-hte-irq-test";
>> +        htes = <&tegra_hte_lic 0x19>;
>> +        hte-names = "hte-lic";
>> + };
>> +
>> +The provider source code of both IRQ and GPIO GTE instances is locate at
>
>                                                                   located
>
>> +``drivers/hte/hte-tegra194.c``.
>> +
>
>
