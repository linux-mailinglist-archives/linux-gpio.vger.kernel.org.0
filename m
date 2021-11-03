Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CFE0443C73
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Nov 2021 06:06:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbhKCFJN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Nov 2021 01:09:13 -0400
Received: from mail-dm6nam08on2089.outbound.protection.outlook.com ([40.107.102.89]:11201
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229946AbhKCFJM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 3 Nov 2021 01:09:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lffYjCiTTedBZq2qUljIWwkzxBX4/8ox3c3MKjJ7eLacr5U9R/ccs1nHHxMa3MIo5pAPAdC4wwsAIzbZrLaIxQl0MBgRSoq+/7kpPr7ZFAU/wSLln23Ffc/bKQII4x701Ni28EEZ7lOL8U5NvKcSV9GLjtv0luYTk8U+H1KxHUFA3A1C+Y354pa9wly4h4dlIuNRumCaeajSxwbLPNB0633rAqBAuPgPLVdW7ovURbfTRpH8DqVzqvG4YyyKOv14QPK5M4lPaCs3DgmOPr6Ld9Dkk4yo3AaaKTUJapL30A1QkoqV5ktvQgeyzk0nPQNty8JLwjH/LuZvdJfjF9N9/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3jNrfdc9ejRRrgTtoTgt/qBEOLuyPKWeanAvL9chkYA=;
 b=SQjQHS7fEh96xTnqK0cPU9tbtIGSr36/LJukSYcsdO9EuJTADcRzhYfUouUgbgNIEUONVEVYXwe+Gg2eASEBQ368PNCHZSzNTZSOzBLBn78e59j1hp1IU0u62hutDU7Phom2hqORaac1pGiR0gRNBj4/iz46jRjXHv8MpyXqKi+UICRiPq6SXhaK8hXk0cSj2yjwoUbWcy3QBujP+KdougyM51FZk6OREsIuvbbYfUOtcYjwHAysT6p5/wlGS7n6HfPMcJLJ/uBmMPNmKEQHVSPRGSBwNuFrVvJqIXeSPxGMZ79Ng6bYPUY0A3XwvMtHjZ4BkmQdRPGCNcJBoybC3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3jNrfdc9ejRRrgTtoTgt/qBEOLuyPKWeanAvL9chkYA=;
 b=b4vtGzAaEI30AvwDbiK5k1H1TLg1mZM0jrK667zsdp1XYGYL1qtQ9jJfZm/+jm7gF9xOEuRu4PweEI51E5UEQalCRyBB2lDkt/+FCr4ASM17RIpvE4jDh/2RFDdCbqesUL1I/N+I8i6fAiTsj/R75rlqVFCKkJMzXMF7NhSVP+PkQ27huz/BVzeRPk8C8vv4Svsw5eiOPvnrA7tfzv3npVbbApm8pV+Ni0zWdvfo6xL53vttwUD9MYwcjgFTqEy3F2p03Swxk794HiAdoXCFwXElafEfxN6XG5v+QgpSiNQBgAuxLEhpImyvibijPnpDex9+S5FaD5C5brp4xJaBvA==
Received: from BN0PR04CA0188.namprd04.prod.outlook.com (2603:10b6:408:e9::13)
 by CY4PR1201MB2517.namprd12.prod.outlook.com (2603:10b6:903:da::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.18; Wed, 3 Nov
 2021 05:06:34 +0000
Received: from BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e9:cafe::c7) by BN0PR04CA0188.outlook.office365.com
 (2603:10b6:408:e9::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Wed, 3 Nov 2021 05:06:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT068.mail.protection.outlook.com (10.13.177.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 05:06:33 +0000
Received: from [172.17.173.69] (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 3 Nov
 2021 05:06:31 +0000
Subject: Re: [RFC v2 10/11] hte: Add tegra GPIO HTE test driver
To:     Randy Dunlap <rdunlap@infradead.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <warthog618@gmail.com>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <robh+dt@kernel.org>
References: <20210930232617.6396-1-dipenp@nvidia.com>
 <20210930232617.6396-11-dipenp@nvidia.com>
 <466cf944-4eae-ad4c-dcf5-42e2e043b754@infradead.org>
X-Nvconfidentiality: public
From:   Dipen Patel <dipenp@nvidia.com>
Message-ID: <26baa410-7df7-901e-00e2-0b3cca3491c8@nvidia.com>
Date:   Tue, 2 Nov 2021 22:07:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <466cf944-4eae-ad4c-dcf5-42e2e043b754@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40428d34-a220-46d4-61f1-08d99e87b4b5
X-MS-TrafficTypeDiagnostic: CY4PR1201MB2517:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB25171D160BC2A01576C0876BAE8C9@CY4PR1201MB2517.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w57TyBiGJPEu3ZSR9mA11Y5H1yq237zqNDa2h1R3pZmmMdhfyJso2qLo7ZOUifHvKMeSl4BndMrIMPQsv2fDOB+A7wDjm3krKjHvxK8/uiMrovs9tFRUn/5XMFvCLwT3ZEeA3upfxJ6zfShgVCiYH15cwlC+ZdMcFXlhRvN3rBbJml3qQX5o58ccVSnvMnuAS0ZiJUsUD9lF+3ahUt2grk22llsN/bdcw/5ILouj12JKxQNqgb8grJqDSY1CYNISmfUTU7/9EjICiu782RlNxHK7mOhTu9LZ/UrDEQ1nvAPNq6WI2donsejSzcT+fxPiV0/azzFXX4pZ/OxBuV2c9FuoLYbMFjqK/DxvK05PDkwCsoUsDzeYfqNpCuz+YFd3ibhislLVm0VphfZjjFe45VxLTwhkAedzGeI5wZYxMW5gY1ZO6zAD/ZfAiTSYvEVri2l8KDyxX8OmCCnbAVuSfXhTa/U8LAXZnlJ39hwBDQwvLfeWp/dvNNmsRYfBtj0ZpaEll12vMotOgWhI7nzpAiyfSp3EePhKNpxMK7ru07851A7yYyCuJ8A6ujTwt00OW0I6tkvIVGi7ZIG0+jToHCd2VK+j+kQV2sGrqCDb1j99dDm+fX1L7bUVjdh6kVojTWPkg2qfiES++tnZF3PHh0axi0gaJY8EVmDZuWa6+5TW0tBD0pQNjcZPbqDOjtZu/GzYIoO71/FZiCgbywlCYiZ7YKm8fyryaeMBrDg8ZVTmmAn56ozyIacjcvL2jPin3pqhNNgyudPf9JpgfIkxDP1mVhsAqs/GdiezoqDZ4UY=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(70206006)(110136005)(5660300002)(36860700001)(8936002)(86362001)(426003)(921005)(2616005)(7416002)(31696002)(26005)(70586007)(36906005)(16576012)(6666004)(82310400003)(47076005)(7636003)(2906002)(336012)(316002)(31686004)(16526019)(186003)(508600001)(356005)(36756003)(53546011)(8676002)(2101003)(83996005)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 05:06:33.7456
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40428d34-a220-46d4-61f1-08d99e87b4b5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2517
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,


On 10/1/21 4:47 PM, Randy Dunlap wrote:
> Hi,
>
> On 9/30/21 4:26 PM, Dipen Patel wrote:
>> diff --git a/drivers/hte/Kconfig b/drivers/hte/Kconfig
>> index eb339526f141..57c97034d187 100644
>> --- a/drivers/hte/Kconfig
>> +++ b/drivers/hte/Kconfig
>> @@ -38,4 +38,13 @@ config HTE_TEGRA194_IRQ_TEST
>>         The NVIDIA Tegra194 GTE IRQ test driver demonstrates HTE subsystem
>>         usage for the LIC IRQ hardware timestamp.
>>   +config HTE_TEGRA194_GPIO_TEST
>> +        tristate "NVIDIA Tegra194 HTE GPIO Test"
>> +        depends on HTE_TEGRA194
>> +        help
>> +      The NVIDIA Tegra194 GTE GPIO test driver demonstrates how to use HTE
>
>                                                                 to use the HTE
>
>> +      subsystem indirectly through gpiolib API calls for GPIO line for the
>
>                                                               lines
>
>> +      hardware assisted timestamping.
>
>       hardware-assisted
>
>> +
>>   endif
>
> Also:
>
> Please follow coding-style for Kconfig files:
>
> (from Documentation/process/coding-style.rst, section 10):
>
> For all of the Kconfig* configuration files throughout the source tree,
> the indentation is somewhat different.  Lines under a ``config`` definition
> are indented with one tab, while help text is indented an additional two
> spaces.
>
> Some of the lines above are indented with spaces instead of one tab.
>
I will double check this. From the RFCv1 comments, I did correct formatting according

to above coding style i.e. everything 1 tab except help which is 1 tab + 2 spaces.

>
> thanks.
