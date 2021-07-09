Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE8F23C20D3
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jul 2021 10:31:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231382AbhGIIdm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Jul 2021 04:33:42 -0400
Received: from mail-bn8nam12on2074.outbound.protection.outlook.com ([40.107.237.74]:56385
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229685AbhGIIdm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 9 Jul 2021 04:33:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AkDbxEKpl6+xj2N1DH83u12eIRbba+QaHnLblluKlvesUxNci13ImfSXl9SD3+W5yS/4z0e94QqpeRxyxodJ5FLUicZkyne6fL8mtBzLcJ6yc8WwjFcrdCoBBsmkOtUpibCvZ0walNbslFOLeNSbFlcU0WcnY6W3tCgFbiMHlzdB2bT+CSofcNZ2JobncrbGfm1Wg9Hi6ILjDA2vFZjVAS0uWoDquVm3kWFqAHO9Etmw9ab6PJ4fBjSzJg8mfolz8FkT96AKEu86HPYR1wrXb+1mtXvs0qxsDjX+MNByuXo5yiL4StfDrRoBw7k1aY12PEWQrAq2KDmzArCNwe2l8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WoYoSUXnUf5VxAIIfla5tLu7hcqPV1kaD5+Tt/z98p0=;
 b=hVQUVGVOOo+Fny3stQSrn5ghlPXxngvh8uWZVOU16X71dInpQ5CaDzXxejSy/MDrdBVvbJ2diutAK0TvWqLM1Ry/lT+lIXunjaMDdi3CopXpc5JdQTbBwast0tC6H1XGVMOm/ojWC5uZXWUJwtHJAGyOVjASgvhlGic/ARxO+E25leNqtBOlPK8lJFaZxh/1KOlJxgFMie5Gcj9X1TO1YgwDc1EnWoWy4AKOowUpW0xVclGKLzuHw3UIkNkplbgQmZbCxmvwQuDUWwHTGel5D4C1QTYLa7a9TZTO/HCwvjweedt0UPwMkttyAN3NrN77+Q5VkrgG306KMwIKs7KeJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WoYoSUXnUf5VxAIIfla5tLu7hcqPV1kaD5+Tt/z98p0=;
 b=slpTNI5gniiqj1uY2saiBvyK/ko8PZ9bE7eimBWzCjJII82o5KC4/LceksuYSOhCT2OKLkhsTpFkqLPj1hhjofFsLuxDMBe9YlSqIsuYmF3mYCJzzJeEhDhABfmJxvNoWVs4JgFHDERDgrWgEIVBwpe+DT1KDQglUY6NqDn9PJtFspiNtkyzCjlNn5VPquuJF411sW0s1Lup73a/LcpP0xAG11E536cQ+kjWGlshBYox/F2kLylrI+a0ytJmmQaqzHEjJWnLySkMF2FqVZCU2IrV3fOc+i1gve60/05/e3fwqBsUCKUWTWBfVgVb3mv+jwKpI05zAbc4fPn2vgsd6w==
Received: from MW4PR04CA0015.namprd04.prod.outlook.com (2603:10b6:303:69::20)
 by CH2PR12MB3928.namprd12.prod.outlook.com (2603:10b6:610:23::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.27; Fri, 9 Jul
 2021 08:30:57 +0000
Received: from CO1NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:69:cafe::b) by MW4PR04CA0015.outlook.office365.com
 (2603:10b6:303:69::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Fri, 9 Jul 2021 08:30:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT042.mail.protection.outlook.com (10.13.174.250) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4308.20 via Frontend Transport; Fri, 9 Jul 2021 08:30:57 +0000
Received: from [10.26.49.10] (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 9 Jul
 2021 08:30:54 +0000
Subject: Re: [RFC 08/11] gpiolib: cdev: Add hardware timestamp clock type
To:     Dipen Patel <dipenp@nvidia.com>, <thierry.reding@gmail.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh+dt@kernel.org>
References: <20210625235532.19575-1-dipenp@nvidia.com>
 <20210625235532.19575-9-dipenp@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <7e49e6a9-bd7c-1b97-50e6-bc803addc27f@nvidia.com>
Date:   Fri, 9 Jul 2021 09:30:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625235532.19575-9-dipenp@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85e8c8bb-dba7-41f0-141f-08d942b3dff7
X-MS-TrafficTypeDiagnostic: CH2PR12MB3928:
X-Microsoft-Antispam-PRVS: <CH2PR12MB392823253B4F3C5DD259B74AD9189@CH2PR12MB3928.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AAkisYR6Hgxf3A1WbC3nDnvDNGuf9aIq7J5tPeUrXGk5EXGWJmSnNPOUVNPVPnkKWKRX0z0myTE/Sfbdab7d1I+Dr1LGp10pEImmr3WBBBhgY0ghjjaTs4t3pXBb1HIPT4+IFalYYlYXg7uupR7oSXWhW2yffn9tjG7E2OI3SxvOL6klFqTebutnSkg9mSFVYl8QSPl64+po5anK9Igal5NXhLMmH5ZdI2RHXxsk4yX5HKWoPiStY9B7oASOGIjBToUUdAjbuPb6mEhyMzrkzltMHgeQozVKwTxk+Kl79iaRyhf+KmnMFJkc6VLFigO0GngOfPRcy/0fmITLmGi8zpm7H4XskFN/rBTi0HpUkXwj0nzZ5aXtic0FZ1mwqcfsIFTtbJ1d0+Iv1b5AyZi1B90BIl/HWAa/8Xd8u0Zuk4hGq+ia85TS29tT9SApMOHoQVuumAQcGeIW7qPngfS8IBPdr9kbMcDS2DQU1JG99icoSFuy9LSt2hVBYBamNmzQnZD+tokrQb/54MiLtfEWeFU4E6PcGiPJlwsJDtAEjKOZWth4v/dtWN8ycsmA3qMF0Bpw/GCuGkPwX8uA/BuYnl5nHStHi/81XPYMktn/javKZhWmXZGVMdqEgN3+KROExZfAUbbuyw7wlNRBsIKHdFOGpws74AL772EsG8+soc+HRkdNA8CwAlYgf9Yo78xrgGz77GLFLFKszmU5qusXOrkFVBYpVPX3L1u6ZrpDuM0THM3ZKLeDi3dHNQrDg9tWZGofXeKPtcO6827rS1oHyw5gq69VROXm1uzvoN6po0VNOhuNvsxzxZ+B6Uo5fh728uvDq1oFOgUg55o+AyTLHQ==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(376002)(396003)(46966006)(36840700001)(478600001)(16576012)(82740400003)(186003)(70206006)(921005)(16526019)(70586007)(7636003)(31686004)(36906005)(36860700001)(31696002)(316002)(83380400001)(7416002)(356005)(8676002)(2906002)(82310400003)(86362001)(53546011)(8936002)(2616005)(110136005)(5660300002)(426003)(34070700002)(36756003)(336012)(26005)(47076005)(43740500002)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 08:30:57.2647
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85e8c8bb-dba7-41f0-141f-08d942b3dff7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3928
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 26/06/2021 00:55, Dipen Patel wrote:
> This patch adds new clock type for the GPIO controller which can
> timestamp gpio lines using hardware means. To expose such
> functionalities to the userspace, code has been added in this patch
> where during line create call, it checks for new clock type and if
> requested, calls hardware timestamp related API from gpiolib.c.
> During line change event, it retrieves timestamp in nano seconds by
> calling gpiod_get_hw_timestamp API from gpiolib.c. At the line release,
> it disables this functionality by calling gpiod_hw_timestamp_control.
> 
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> ---
>  drivers/gpio/gpiolib-cdev.c | 65 +++++++++++++++++++++++++++++++++++--
>  include/uapi/linux/gpio.h   |  1 +
>  2 files changed, 64 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index 1631727bf0da..9f98c727e937 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -518,6 +518,7 @@ struct linereq {
>  	 GPIO_V2_LINE_DRIVE_FLAGS | \
>  	 GPIO_V2_LINE_EDGE_FLAGS | \
>  	 GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME | \
> +	 GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE | \
>  	 GPIO_V2_LINE_BIAS_FLAGS)
>  
>  static void linereq_put_event(struct linereq *lr,
> @@ -540,9 +541,20 @@ static void linereq_put_event(struct linereq *lr,
>  
>  static u64 line_event_timestamp(struct line *line)
>  {
> +	bool block;
> +
>  	if (test_bit(FLAG_EVENT_CLOCK_REALTIME, &line->desc->flags))
>  		return ktime_get_real_ns();
>  
> +	if (test_bit(FLAG_EVENT_CLOCK_HARDWARE, &line->desc->flags)) {
> +		if (irq_count())
> +			block = false;
> +		else
> +			block = true;
> +
> +		return gpiod_get_hw_timestamp(line->desc, block);
> +	}
> +
>  	return ktime_get_ns();
>  }


Looking at line_event_timestamp() and the callers of this function, it
appears that this should always return nanoseconds. Does
gpiod_get_hw_timestamp() return nanoseconds?

Jon

-- 
nvpublic
