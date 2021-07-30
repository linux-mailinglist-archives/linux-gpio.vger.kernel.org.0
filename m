Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BE7B3DB11C
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 04:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235753AbhG3CYg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Jul 2021 22:24:36 -0400
Received: from mail-sn1anam02on2082.outbound.protection.outlook.com ([40.107.96.82]:27766
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230200AbhG3CYf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 29 Jul 2021 22:24:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ijo/rLkkTnYhbSjcyA0Fahei3c2fZrYW7Q1brLyOplWtTsqMYvrbapUh4dDwRx84BWUdC1LJEE+04wVx5hH8w1LSMsQEMZ8+5997cfyoqQZpqud/4o73Nsc7N/X52QVXMVJZU0zbmomJQSqwErOs0SvmZtTrmbKX4pRXiXONTFuz9xTYHsf8DU8bSLV0qD72KDDMa9f9hwndai6YTQ7bim/W+SDHsU0BUJOriwWpdUcIhp6uonNZy/cE1dAN4f+J5S6rWX4bNrgfkTvzTwDPYiLfxsxbRgK2SYMYCbkX23AiE7Nfr7mPp0HJhM77b3RiurSSSq9k0jO1LfM12cxNLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6bLH62oPK0In5jLU8GOHpbm8NdW9jUhBJjfr0+yQu4=;
 b=J+3W+nrs/E8lH7HN9HabRWomBefqvtEhsEHn5TO52T2LWGq7+ikayqKzfv9OsCc73c7a7R7Hg0hUlBopth0m+8h1liol/itDql1+UWobw9hIPz3pcbQ05hWgLrHy0HaEswekk7j21CAuvXQiHRjBDNDpWTiHUiSBvaFyau4x+wk2UR+TrNFKlHk4AYObHU7a7AOOB+Sxb/s6G1jm94S2ZZUhe6oGIX1agLZtMZdHp4ow2wUaC8DZ6WGDGaNASAaiySdIaEpBoanmv6k/IuTKjfcdL5XX2UKeRKhmfXtSF5zXxvr67L+i8yD0XuuduLJvLVf777ki83tTyQEFiA/R/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6bLH62oPK0In5jLU8GOHpbm8NdW9jUhBJjfr0+yQu4=;
 b=LUn2uFYFmRC+GP/vb+pE8Kwv+e0hwYhwV1GFroDMp1SmE1IkEDyIxXqVVHAqM8iHGxiw99L1vWMmG3BrPj7GmwL6/KJy57T+sza70dtJ6CCHqAHJkt3qEqk6bTPGYHg8k/20Rmzlg446wGApg5RXDEPXpmH5X/sEmjTPQspyt5C6Xas8JFq7gCBUtSRwLuAEXVQoczp0/7WqdajKDImqXEsnZLsbTPUYy0h+47Gqww75zrmRUJcKFUplJ+737Ckwx/TjGiLK8OxF976QL30httV3qo8hfZwKZxppmD3tExFcRluMIZO67KWL8jtSoxXOHfK0A9QWVvu9XVnVfowOcg==
Received: from MWHPR11CA0021.namprd11.prod.outlook.com (2603:10b6:301:1::31)
 by DM6PR12MB3579.namprd12.prod.outlook.com (2603:10b6:5:11f::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Fri, 30 Jul
 2021 02:24:29 +0000
Received: from CO1NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:1:cafe::8c) by MWHPR11CA0021.outlook.office365.com
 (2603:10b6:301:1::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Fri, 30 Jul 2021 02:24:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT068.mail.protection.outlook.com (10.13.175.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4373.18 via Frontend Transport; Fri, 30 Jul 2021 02:24:29 +0000
Received: from [172.17.173.69] (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 30 Jul
 2021 02:24:28 +0000
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
X-Nvconfidentiality: public
From:   Dipen Patel <dipenp@nvidia.com>
Message-ID: <65bf01e1-66e1-7eec-0052-4d707f4a3f6b@nvidia.com>
Date:   Thu, 29 Jul 2021 19:33:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <7e49e6a9-bd7c-1b97-50e6-bc803addc27f@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db8727ad-2e9c-43f6-33fd-08d9530128b3
X-MS-TrafficTypeDiagnostic: DM6PR12MB3579:
X-Microsoft-Antispam-PRVS: <DM6PR12MB357971BE3BC4C437A6A98EA5AEEC9@DM6PR12MB3579.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qgiv6Lgzvk7qCccjJ9TlVL3fCwgSUuvMyJc6R/2IrcWvl5BS+CfdISyHTMI7fOCTS1iUXvChwKKJ9/fBffhoOVf6kUowymD8VTBUIz5BahyVZOvaZFD43yydjN36tehr+4d9E4oTASLGPNDP+6PbynMbV9y9nyU6+MxWFuaG2BhDbFz4xyUUgQpBW6xM5cxpw4w1OnHIOblANO3ZcMBdCdlPRfoW3mB3v5TeUxx0GTzrOEh/KsGkIstxV5E4EdjLAwWFgNL+U4jJOi66/Ce16sF/RXcCTqkB7AS6CuAkIO2JHASQp7jL+ACRip4aRNLXKvMkqHQgCYedgs+3grsP9EmjVmdrZ7sMm0owfRiEvDsl4wCvD8aLv/jBex5b32542XO6siLHKjE5LDWAZm9L0SRtNwR2PyGH/YNG4GEto5CgOO+QROa9kdTLo6RjEpKp+XVBL44uU+Bw8wtv8xwTPmM4nyxUUMUCO70panbty+t83M/66X0GLqwb3iSa7hcA6VQ2ztBdi1l9gc0Kl6pWKfnrmGmx+5vO1PgrLR2m7aVbsNSnBq6miw2OwOCldZfq6wTjSA0S9UuBjbfn7x2zmGe/0dEZg3DwcLJbVu4Jkj97xH0J8qsGW7c6pc0fvi2wrSkgrAUNOle6d9nXI0AGf7aZ+mBfn+eSy/AEgWI3lpYc+CeHF77ttdK+CGQpnr7rsC2fmmWH0wF9w4PiyVLI+RVpmcbSCZ8ZBzjxntyl4sO9EilWB/Oz/i4+uu3C4GKygkA4HK3e9iPfusKQZvFpeZ7N2jPz5fgqi5A4tvk3o+o=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(36840700001)(46966006)(26005)(426003)(2906002)(336012)(47076005)(16526019)(186003)(83380400001)(478600001)(8676002)(82310400003)(7636003)(36860700001)(2616005)(36756003)(7416002)(82740400003)(53546011)(110136005)(86362001)(31686004)(5660300002)(70586007)(70206006)(36906005)(921005)(8936002)(316002)(356005)(31696002)(16576012)(43740500002)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 02:24:29.1512
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db8727ad-2e9c-43f6-33fd-08d9530128b3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3579
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 7/9/21 1:30 AM, Jon Hunter wrote:
> On 26/06/2021 00:55, Dipen Patel wrote:
>> This patch adds new clock type for the GPIO controller which can
>> timestamp gpio lines using hardware means. To expose such
>> functionalities to the userspace, code has been added in this patch
>> where during line create call, it checks for new clock type and if
>> requested, calls hardware timestamp related API from gpiolib.c.
>> During line change event, it retrieves timestamp in nano seconds by
>> calling gpiod_get_hw_timestamp API from gpiolib.c. At the line release,
>> it disables this functionality by calling gpiod_hw_timestamp_control.
>>
>> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
>> ---
>>  drivers/gpio/gpiolib-cdev.c | 65 +++++++++++++++++++++++++++++++++++--
>>  include/uapi/linux/gpio.h   |  1 +
>>  2 files changed, 64 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
>> index 1631727bf0da..9f98c727e937 100644
>> --- a/drivers/gpio/gpiolib-cdev.c
>> +++ b/drivers/gpio/gpiolib-cdev.c
>> @@ -518,6 +518,7 @@ struct linereq {
>>  	 GPIO_V2_LINE_DRIVE_FLAGS | \
>>  	 GPIO_V2_LINE_EDGE_FLAGS | \
>>  	 GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME | \
>> +	 GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE | \
>>  	 GPIO_V2_LINE_BIAS_FLAGS)
>>  
>>  static void linereq_put_event(struct linereq *lr,
>> @@ -540,9 +541,20 @@ static void linereq_put_event(struct linereq *lr,
>>  
>>  static u64 line_event_timestamp(struct line *line)
>>  {
>> +	bool block;
>> +
>>  	if (test_bit(FLAG_EVENT_CLOCK_REALTIME, &line->desc->flags))
>>  		return ktime_get_real_ns();
>>  
>> +	if (test_bit(FLAG_EVENT_CLOCK_HARDWARE, &line->desc->flags)) {
>> +		if (irq_count())
>> +			block = false;
>> +		else
>> +			block = true;
>> +
>> +		return gpiod_get_hw_timestamp(line->desc, block);
>> +	}
>> +
>>  	return ktime_get_ns();
>>  }
>
> Looking at line_event_timestamp() and the callers of this function, it
> appears that this should always return nanoseconds. Does
> gpiod_get_hw_timestamp() return nanoseconds?
Yes, it returns in ns to align with line_event_timestamp.
>
> Jon
>
