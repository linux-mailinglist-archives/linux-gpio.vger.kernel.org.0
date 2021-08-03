Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8088D3DF306
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Aug 2021 18:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234623AbhHCQmy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Aug 2021 12:42:54 -0400
Received: from mail-sn1anam02on2056.outbound.protection.outlook.com ([40.107.96.56]:25031
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234271AbhHCQmx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 3 Aug 2021 12:42:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UEajfggEKDTfbN8FHxKOncQcxHBsi4+ZAGXor2JvEs/geYwMCsc3Ols/kNMVj4mYgXwys8SduOszendV71SjNtk6DZCED0ljazsIuHjbQM0dqh/inFerfCc3FOo1l+lz7k/PwogvmVhJjY5qrK03g8VZqvDbMcLucJTXAO0aB2se6gNFCNUmoqD+obDmLJu4gc6ywbSkMlsWlUzTXuivuvfiXBIY4q+JIscCDljrLwiQHRmpz2YwvrtaQ9B4v/LFfPZHADjd2DsKjRsb1wWdjXTCXNSHfcDNSVmqb0wWGvSCIFHCdFTDQyebY8cLXmETgQsK4Fjgjph2G2JNwCOC7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYAxFss/rHV0AyqyoZ8N3Hyzhw5w+9NpH1zIm6LWCL4=;
 b=fSPlQJyaWJ4tyk3zzXKy4t/xbVTgfRvtcgeu6no9q+niPvcyhpw5DOcojIk5qHCIwtPU6WJSUWo+jRoy6E2DE8p6U2nNaffTvULKHTXuS+tKcH1meNBIo8/geY3j39F43F7Yj5HlyIQXGYvDBoI9SFcSEhrffBeVEgABpqLkGuYyY6AoQU88rLjjjrT5isFw/vy3H6j050u+JPV8CXuL6FwW4wSijjfmyjR6GO1KrMYoVgxY9Q5qCa+C9hNxRvT54UZEkgRP3Lk17+2RZJPKjQ396efq9HziufBLHXjhL4Bpk3iVMA8cZJPj/XM7fiz6XEgTdiwELrN0PH0pwNvr8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYAxFss/rHV0AyqyoZ8N3Hyzhw5w+9NpH1zIm6LWCL4=;
 b=pLbFLHvyYTPEL8nzAPDKzOwxcVl29jOZX/Yo5crCS9Aa8UWsaiZ8q9SFLWszhSo/uSACUXS+uc9a/nV7Bdpzg1GIqKXLiDOtZom9rOkgP/+k/6gk6kPdPDacYcppxqt3uP97j6J6L78tew/80yGGEizNlA5qkgOZkTmjLBmmGGWhCJmOFViHZ0zv9m0Cav5mzRjO0nSafFx5fU2nh2G7jV8CprJ5NLM5rx6V93qfzy3kAWzKnaRWPheQJfkr+VEKafGLd5Yp8wN29a+jveXm1LIjGhXLDK8U3hSqU0msRh7FZcCv/OM1n7XFlqfMSJeAkP/4oc0q8lyOjk8ouzBS2A==
Received: from DM5PR20CA0004.namprd20.prod.outlook.com (2603:10b6:3:93::14) by
 DM4PR12MB5197.namprd12.prod.outlook.com (2603:10b6:5:394::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.19; Tue, 3 Aug 2021 16:42:40 +0000
Received: from DM6NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:93:cafe::8e) by DM5PR20CA0004.outlook.office365.com
 (2603:10b6:3:93::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend
 Transport; Tue, 3 Aug 2021 16:42:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 DM6NAM11FT067.mail.protection.outlook.com (10.13.172.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4373.18 via Frontend Transport; Tue, 3 Aug 2021 16:42:40 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 3 Aug
 2021 09:42:40 -0700
Received: from [10.2.59.40] (172.20.187.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 3 Aug 2021
 16:42:39 +0000
Subject: Re: [RFC 08/11] gpiolib: cdev: Add hardware timestamp clock type
To:     Dipen Patel <dipenp@nvidia.com>, <thierry.reding@gmail.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh+dt@kernel.org>
References: <20210625235532.19575-1-dipenp@nvidia.com>
 <20210625235532.19575-9-dipenp@nvidia.com>
 <7e49e6a9-bd7c-1b97-50e6-bc803addc27f@nvidia.com>
 <65bf01e1-66e1-7eec-0052-4d707f4a3f6b@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <8d3257f3-54b1-e658-245d-3a070aba44c4@nvidia.com>
Date:   Tue, 3 Aug 2021 17:42:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <65bf01e1-66e1-7eec-0052-4d707f4a3f6b@nvidia.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0dcc4978-3157-4870-a5fc-08d9569db5bb
X-MS-TrafficTypeDiagnostic: DM4PR12MB5197:
X-Microsoft-Antispam-PRVS: <DM4PR12MB519745CBD4D3C998294C04F6D9F09@DM4PR12MB5197.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ItN4P9u1dP25ftP39RGx3+v5HPVQv0HGmG0cPlCbkAQsxupHrxO+zUDdh31cAB17VoTrlScycYadgi42fU7BeCFswxaJ66D80h9zZy8hXnWVOg2AN+1CDlT4q165bfOVs7Db/jBYBvdy9MqFHHwVwkF+ZJDC1lzUOHf0tDj6zcY3GUVzJa8YTLfrJjosDY99TRaOT4KxfeymDjYriOSZSNtv2oZVlzJYSArkZXaKHEPDWrMOGyjSm4fpkdaoehPd3b+SxkZ980PK4NBlcneuVIedfYL7ZOkcM+y+EB94uspW7gq2sFsZH5gyrEYjslg4/xkevm9EXyYaZz7hW4LhLlTzlAy10du7Hxz284qya4v8KA9VuxkAaS9hvzWeloDXFyn9Xl/EW0wh6ZqtpbvOlG3tuJPgLytGwvkiRVqkW8i6aMkZd2cnw8GXX4cU3Z5Jq7M8uVl7Nblj2rD3HqYafactQ1GCeaT6PpMdqJ1mpmoGUcBcmz0+M4vHmIRhovhGDcWJ3mF03O+wNRm0l5H1uocBeEafFRn2urQdJvggb32oAlKfxB67nO6tBjlvJxeABqFAAUppmEwwAmZVTI04Ji1xkrR+bwGU9g4ysLt6okLwCx+vYu+2F7U0Zv7up76bVfd6G/pzL8Hp9B7K5vfH+egN9qpRVEsc7mCwg/gHk/S+1gki+AQ0Ut/ti/zEDMq4dDS9RxdQbH0OSXhgfUGMGk3wRlX+W6dG3iaa6l7Vqol7Ee5QDdrW96gngPCLQ9RJg7RkY7tccudHv/E9gBBHt8B5ppUjxm6TOEociEtrcjc=
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(46966006)(36840700001)(921005)(82310400003)(70206006)(426003)(8936002)(26005)(7416002)(356005)(83380400001)(8676002)(16576012)(316002)(2616005)(86362001)(70586007)(36860700001)(16526019)(110136005)(186003)(36756003)(53546011)(82740400003)(5660300002)(47076005)(336012)(478600001)(2906002)(7636003)(31696002)(31686004)(43740500002)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 16:42:40.7394
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dcc4978-3157-4870-a5fc-08d9569db5bb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5197
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 30/07/2021 03:33, Dipen Patel wrote:
> 
> On 7/9/21 1:30 AM, Jon Hunter wrote:
>> On 26/06/2021 00:55, Dipen Patel wrote:
>>> This patch adds new clock type for the GPIO controller which can
>>> timestamp gpio lines using hardware means. To expose such
>>> functionalities to the userspace, code has been added in this patch
>>> where during line create call, it checks for new clock type and if
>>> requested, calls hardware timestamp related API from gpiolib.c.
>>> During line change event, it retrieves timestamp in nano seconds by
>>> calling gpiod_get_hw_timestamp API from gpiolib.c. At the line release,
>>> it disables this functionality by calling gpiod_hw_timestamp_control.
>>>
>>> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
>>> ---
>>>   drivers/gpio/gpiolib-cdev.c | 65 +++++++++++++++++++++++++++++++++++--
>>>   include/uapi/linux/gpio.h   |  1 +
>>>   2 files changed, 64 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
>>> index 1631727bf0da..9f98c727e937 100644
>>> --- a/drivers/gpio/gpiolib-cdev.c
>>> +++ b/drivers/gpio/gpiolib-cdev.c
>>> @@ -518,6 +518,7 @@ struct linereq {
>>>   	 GPIO_V2_LINE_DRIVE_FLAGS | \
>>>   	 GPIO_V2_LINE_EDGE_FLAGS | \
>>>   	 GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME | \
>>> +	 GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE | \
>>>   	 GPIO_V2_LINE_BIAS_FLAGS)
>>>   
>>>   static void linereq_put_event(struct linereq *lr,
>>> @@ -540,9 +541,20 @@ static void linereq_put_event(struct linereq *lr,
>>>   
>>>   static u64 line_event_timestamp(struct line *line)
>>>   {
>>> +	bool block;
>>> +
>>>   	if (test_bit(FLAG_EVENT_CLOCK_REALTIME, &line->desc->flags))
>>>   		return ktime_get_real_ns();
>>>   
>>> +	if (test_bit(FLAG_EVENT_CLOCK_HARDWARE, &line->desc->flags)) {
>>> +		if (irq_count())
>>> +			block = false;
>>> +		else
>>> +			block = true;
>>> +
>>> +		return gpiod_get_hw_timestamp(line->desc, block);
>>> +	}
>>> +
>>>   	return ktime_get_ns();
>>>   }
>>
>> Looking at line_event_timestamp() and the callers of this function, it
>> appears that this should always return nanoseconds. Does
>> gpiod_get_hw_timestamp() return nanoseconds?
> Yes, it returns in ns to align with line_event_timestamp.


It might be worth updating the function name to 
gpiod_get_hw_timestamp_ns() so that this is clear.

Jon

--
nvpublic
