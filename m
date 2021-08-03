Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 468FF3DF811
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Aug 2021 00:42:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229942AbhHCWmg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Aug 2021 18:42:36 -0400
Received: from mail-co1nam11on2056.outbound.protection.outlook.com ([40.107.220.56]:3137
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229789AbhHCWmf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 3 Aug 2021 18:42:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PtOSyZH9tqHfyc1JrfCiga1mAMQHhDBozAN+9N8WeMUn9ZxKg83OgwqtQ100OukEkAgzH9mUFcJhEjwP4LuaDpkK/8HP5ud7Djc/HtiAAGQTwn4b8xtXSdHFXlpCFU84pfN5E2EhA2sBMeLgiCrdIyOEU+agT6SNkVP7GFlQKGH8IkcN0uHhcbnwkO9DvoUvnwtiC7V+ADh2d5J6pX7k9DfjbdU0aHH68z7RcP3gJrOgy32FnKrzfpOkblnc0rxWFQ8BbPvVbLdG1hulihO3aaQ8Hve6iojmjB9W77FXmculnyahkzVAAN8CaIOds0UfgXaCfGcqjjwsJVbN13zEfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yNIcm2dWrbyLDF9EtqdjwAylc4XLdnFTGwg1SCLuAs=;
 b=VOgsiaMAAxpC0gBOh5eSSih4fQ0XbnhCvcIzYfppMPmSl2dCha+LgEnZJbMdmiblssY+vVKjAPv7GVe/qb84Srndvx/dFyuy45tZ7+ukn9X/9B3kN9sKZtJGP6bJmMpT8B4jPIpAjbij+x/1p9675t6wfVxKRNIWNJktZJn/VAdhhQtwNq0cagopZ0c2dFYuYZW3zxOR4uSiuus5JqtAm7zyldPAIt3iftKZkwt2NuQE4vF+gLfBkTZqhQbtX6wHn06ApRDKNyMgGEDzKeR0Mn2xmoLPCacvp7FSNydiUWeP4CeMA9z6eW1Ju2ZLB4sEWIs6P08m/6NYF/IihMlyLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yNIcm2dWrbyLDF9EtqdjwAylc4XLdnFTGwg1SCLuAs=;
 b=mAo/dEUD+Lz1olQpfYTQX5yqLS+TevqkE7WJ3ILSk/AGOYQ29ENX2CgMBwLIiUo7Kl99+8VTUx8ZnTsMOZqXxxBjvnkmJ0/sNSpO9GvczUyK1etE8Uq3WNdYhw1H6fUWRzDC7odlWpTvqHO9D3Pvsp8TRki1sdb61jjbAPq5AaYoDiSwKOxZnrz9odnrtcCObZH764JICfdNswHeNIr+JnKP9kSGe9i2zZiKwwMm0rlrr+p2vV2weeYr7+C/TcsIykCIz1Ulz5dE2kBGTJbPZ/iwTL8GwnCvVgDMURx/TaJdv8PHwJ53TuYCgoHcNApl/20s/W2n3VhYR/E24F2mfw==
Received: from DM6PR08CA0002.namprd08.prod.outlook.com (2603:10b6:5:80::15) by
 BN8PR12MB3108.namprd12.prod.outlook.com (2603:10b6:408:40::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.25; Tue, 3 Aug 2021 22:42:22 +0000
Received: from DM6NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:80:cafe::bc) by DM6PR08CA0002.outlook.office365.com
 (2603:10b6:5:80::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Tue, 3 Aug 2021 22:42:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT028.mail.protection.outlook.com (10.13.173.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4373.18 via Frontend Transport; Tue, 3 Aug 2021 22:42:21 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 3 Aug
 2021 22:42:22 +0000
Received: from [172.17.173.69] (172.20.187.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 3 Aug 2021
 22:42:21 +0000
Subject: Re: [RFC 08/11] gpiolib: cdev: Add hardware timestamp clock type
To:     Jon Hunter <jonathanh@nvidia.com>, <thierry.reding@gmail.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh+dt@kernel.org>
References: <20210625235532.19575-1-dipenp@nvidia.com>
 <20210625235532.19575-9-dipenp@nvidia.com>
 <7e49e6a9-bd7c-1b97-50e6-bc803addc27f@nvidia.com>
 <65bf01e1-66e1-7eec-0052-4d707f4a3f6b@nvidia.com>
 <8d3257f3-54b1-e658-245d-3a070aba44c4@nvidia.com>
X-Nvconfidentiality: public
From:   Dipen Patel <dipenp@nvidia.com>
Message-ID: <f0d8da75-6e31-5432-6909-8eab6960b787@nvidia.com>
Date:   Tue, 3 Aug 2021 15:51:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8d3257f3-54b1-e658-245d-3a070aba44c4@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a96896a-f35a-4c04-b994-08d956cff518
X-MS-TrafficTypeDiagnostic: BN8PR12MB3108:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3108180446893CB470A286DFAEF09@BN8PR12MB3108.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: csTcHTB/RAFp/4NvecP0Pdj2wRKj0CySrKYtPrwwzC9kpQdftJvW7lBLlmj1EnBRbKYhr7ZCUAN3KxjfatVnaY/yXtR/LH9g++HJi0wp6yiV6NOtQYfR7oMqE9mj5CrxyrCieIge10sY47q6mHPEHIEry6KlUHMBXduA1ZeWGTx58OJ4UWx3CHq+3S1VPU4yddrx86LY1ZTuC0YSuqckUbTzuxyZZECs5LCe8V9CLYejnBCOAKsyWK32Kns6IaWHowMBgAIOvg65rbCJRg+huoqRZgPas6rGb5bfS8Dn+Ii1iNFa7nI7bwVm+sO8J/0pvmS51HA6C8jYyMG48FITF7dc/B3/y4wKoo6cemoXPavyUVmVZeC3T737ghxgKE/Xk5JQNB8UK8q/lyUwJrbWqx2thj0zZHnQdbL2NxSb6MXctAZqLwSQAB64dF8aNs4rEUG9Wef6XFdsv5bpOeNcBr9oK5UfgzcFoZKGCZ9Zy5kBVIKm9Qbmr4qHmK6/MS61qT7iO4tRpHSWUKBYXWpI8v7CmPGy02NiBu/5W9eM2wgMCo6LcLhAVqwn2/1s2CkmydxzmSs7tmE4FJFX0rhfCw5EI3RINuH5PK99Dol9xViF1krkbB8iz98T2AByq/WFH5vNKo3h8Ajrg0uvQ1Osl+KSBTPQ0QJo68jMkz1WqZWZ9Snxu0+czcfcD4WejhAmZYY07o5XWs3CFR8QwoKrZCzbsi2XzVp5dgGnbRHzRpTLYlmegFUODKL81c6LO747odFM1D7LinLRFnz/BzoREKmkWc1Y253i89wWxT7NYTo=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(376002)(39860400002)(46966006)(36840700001)(7636003)(16526019)(7416002)(53546011)(2906002)(921005)(110136005)(2616005)(36906005)(26005)(8936002)(16576012)(316002)(186003)(426003)(356005)(31696002)(86362001)(336012)(70206006)(70586007)(478600001)(36756003)(5660300002)(31686004)(36860700001)(82740400003)(8676002)(83380400001)(47076005)(6666004)(82310400003)(83996005)(43740500002)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 22:42:21.8903
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a96896a-f35a-4c04-b994-08d956cff518
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3108
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 8/3/21 9:42 AM, Jon Hunter wrote:
>
> On 30/07/2021 03:33, Dipen Patel wrote:
>>
>> On 7/9/21 1:30 AM, Jon Hunter wrote:
>>> On 26/06/2021 00:55, Dipen Patel wrote:
>>>> This patch adds new clock type for the GPIO controller which can
>>>> timestamp gpio lines using hardware means. To expose such
>>>> functionalities to the userspace, code has been added in this patch
>>>> where during line create call, it checks for new clock type and if
>>>> requested, calls hardware timestamp related API from gpiolib.c.
>>>> During line change event, it retrieves timestamp in nano seconds by
>>>> calling gpiod_get_hw_timestamp API from gpiolib.c. At the line release,
>>>> it disables this functionality by calling gpiod_hw_timestamp_control.
>>>>
>>>> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
>>>> ---
>>>>   drivers/gpio/gpiolib-cdev.c | 65 +++++++++++++++++++++++++++++++++++--
>>>>   include/uapi/linux/gpio.h   |  1 +
>>>>   2 files changed, 64 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
>>>> index 1631727bf0da..9f98c727e937 100644
>>>> --- a/drivers/gpio/gpiolib-cdev.c
>>>> +++ b/drivers/gpio/gpiolib-cdev.c
>>>> @@ -518,6 +518,7 @@ struct linereq {
>>>>        GPIO_V2_LINE_DRIVE_FLAGS | \
>>>>        GPIO_V2_LINE_EDGE_FLAGS | \
>>>>        GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME | \
>>>> +     GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE | \
>>>>        GPIO_V2_LINE_BIAS_FLAGS)
>>>>     static void linereq_put_event(struct linereq *lr,
>>>> @@ -540,9 +541,20 @@ static void linereq_put_event(struct linereq *lr,
>>>>     static u64 line_event_timestamp(struct line *line)
>>>>   {
>>>> +    bool block;
>>>> +
>>>>       if (test_bit(FLAG_EVENT_CLOCK_REALTIME, &line->desc->flags))
>>>>           return ktime_get_real_ns();
>>>>   +    if (test_bit(FLAG_EVENT_CLOCK_HARDWARE, &line->desc->flags)) {
>>>> +        if (irq_count())
>>>> +            block = false;
>>>> +        else
>>>> +            block = true;
>>>> +
>>>> +        return gpiod_get_hw_timestamp(line->desc, block);
>>>> +    }
>>>> +
>>>>       return ktime_get_ns();
>>>>   }
>>>
>>> Looking at line_event_timestamp() and the callers of this function, it
>>> appears that this should always return nanoseconds. Does
>>> gpiod_get_hw_timestamp() return nanoseconds?
>> Yes, it returns in ns to align with line_event_timestamp.
>
>
> It might be worth updating the function name to gpiod_get_hw_timestamp_ns() so that this is clear.
Wouldn't be sufficient to right into its description rather embed in API name?
>
> Jon
>
> -- 
> nvpublic
