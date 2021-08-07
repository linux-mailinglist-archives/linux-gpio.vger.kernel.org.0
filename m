Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C52E73E33A2
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Aug 2021 07:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231184AbhHGFjB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 7 Aug 2021 01:39:01 -0400
Received: from mail-bn7nam10on2052.outbound.protection.outlook.com ([40.107.92.52]:36385
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230377AbhHGFi6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 7 Aug 2021 01:38:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iTSEpDG30Iwk0VuUWRdf8LW1RGiws1MnUnnPfisuTDc/8048VQmOegVtkV3ajb33D3FnbIfwbohyXmQTPFxzfkrXI5TcqPS/NqDTaIrbnjP4RZtPMDBRZbM4ntsl1C92OLv8fPBh4f19YthSGOtzLIYxtnbncR22KmXkrhbB5PwamG/flGLpLqcGuKIKHCG9YG2djU5lmTGh+57MXnkkDehPFgSNE1KD86NiwYqmB4obL4mnPCOoA3KoUe8YVJmqNzz4J7r7BHRc6LY+0/5CK+YQjDAgLq+1hmE5ViPOy7a9qinXzMDaJNKcgDizKNpY0MoKDZcbcqOZAWzhYNcUCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAZ9+KjApYlM9FuNyMMzdyj9tbqad0yFBRQrAhDiL4I=;
 b=nHGOkfzHy+ak0DaSRe+CRSbpjd47dBtUDRxrx2UabYBJdbdNRj1p4qXIpLeU/0LX6sUs9BZzpnchekZTJvj43iVC583GLrXFbB/QdkL8KrF6rqkbcfwYy3e0uNeJjrxbF8S63vpjNmFxrofSehrx7lpBj47Keb0NmoezbBgug/HkVrKJ+LG6PCdBdkahqSeEbPWt08xPhg2HGVH2H49YmV//uv4pGG0/EFODdDd+D1Jt9ZFdJOhH1gCWzdYyYrolrlgXF6QDOZl2yu0zC5HJYFOwkAZ51/I/iEgThjdsJOPhRkodiNoyRUedAFEOGpko9yixZLJLnmTCFx12fLzedQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAZ9+KjApYlM9FuNyMMzdyj9tbqad0yFBRQrAhDiL4I=;
 b=tlmr4U8cmbddigSQlUwqoIotVdOE7nmbyfuWetbeaYYyMbEmSoQ+6XPKfdX8gFKhE7Jeu/p7E5CdiddAYRqlpeMBGBDccVrhXE0upBxi1mJDsPZzAnqX50DfWE8PZuRfDy124N+x8aBxN/E25bB1Eo2FoNhUjnlACZPk/RkmaBUReWoLhpCpR57CFigEHR+kDKjAbErGyCD25e6+Uf/hU3SPWYNAS//ALwn9LGmg1HYfxltGbHJq0KX2mHD+9KIKv+5AAaGBDNz6PrnIVSuWno2tlvlh8pcJr9bSDOBkbjTUk+pJylxJDA1UV87Zkna/Ul0S9A/wpslL4Gs+GMgq7Q==
Received: from MWHPR20CA0041.namprd20.prod.outlook.com (2603:10b6:300:ed::27)
 by BN8PR12MB2946.namprd12.prod.outlook.com (2603:10b6:408:9d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Sat, 7 Aug
 2021 05:38:40 +0000
Received: from CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ed:cafe::1f) by MWHPR20CA0041.outlook.office365.com
 (2603:10b6:300:ed::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend
 Transport; Sat, 7 Aug 2021 05:38:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT066.mail.protection.outlook.com (10.13.175.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4394.16 via Frontend Transport; Sat, 7 Aug 2021 05:38:39 +0000
Received: from [172.17.173.69] (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Sat, 7 Aug
 2021 05:38:39 +0000
Subject: Re: [RFC 03/11] hte: Add tegra194 HTE kernel provider
From:   Dipen Patel <dipenp@nvidia.com>
To:     Kent Gibson <warthog618@gmail.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <robh+dt@kernel.org>
References: <20210625235532.19575-1-dipenp@nvidia.com>
 <20210625235532.19575-4-dipenp@nvidia.com> <20210701142156.GA34285@sol>
 <52768891-6c01-7588-e557-5c9eae5375b6@nvidia.com>
 <20210731154323.GA24906@sol>
 <1ff6df66-9895-bd42-322a-515327f30366@nvidia.com> <20210807030746.GA9850@sol>
 <91a173b3-18dc-5d6b-002f-893e7478717b@nvidia.com>
 <20210807045116.GA13675@sol>
 <7f6a2591-c264-e005-18ae-242320d4a22e@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <b0e18731-f96d-2558-c7df-56be380ff67a@nvidia.com>
Date:   Fri, 6 Aug 2021 22:47:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <7f6a2591-c264-e005-18ae-242320d4a22e@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d90c387-53f6-4a97-3c19-08d959659c54
X-MS-TrafficTypeDiagnostic: BN8PR12MB2946:
X-Microsoft-Antispam-PRVS: <BN8PR12MB29462D64C9D2395E78017299AEF49@BN8PR12MB2946.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nclH+0Xj0oYMplATMx1OGqDl9lWRdyU7zbT8ybaJqkcgJvpgdR5W3wsZbOsQraV7XyNKYyoz+rehCkIUa2r4B4xFwZEJzH487SwLK5uSfYI3ZaQKdnDoOtsmGHJhFyYbfsRg3hKHQzmXhE5sTagO1qIZxPoSFwxiIlir+pAxEw9oYIG4Tb3T83PMbBJgUxtY5PJlnbFqKld3jVNH56hr41DZVeaX2y36WYALEQe3yKT1rhC69VwqFoH9ALg6jzyKVm4S2maSsWmk6MYcHp5kfjM9pHMkBSEl8M2pJS/rxMLOfAUT40koEQMGVGbJcwi0YmZKeBPd8NeXsV+jlvzpM3FBaHYRx70SSlOwkNWXqpaYrNWbH7UTWDrH1LyYe4+nALjZR362/jv3WA3IJEINdoXW1PW9CLEMkfD9nv/H/yZZ0yjVvMU6yeckvyCC47xqfYjRz8460O/b3mYCocG4SWBtNFP2gTxS1RWSdXUoVtYz+siMnrBWqstUaLvz5ZUTm1eUkIdLrGOxhWFYc5iIWwhh5aQTupF2XCWGIvY7Vb8hY8CTrFI7Bqd+XiNiH6LyKanYwc6Z6k4rYMrsGU9ytAteMlJCGNb6EYjcVjHrD5sQzuReI2Ih2YKOCJjie3ydhhkRC4zdfpdMaMDMPGhR8JHNTpcO/eYEzLwvqS70cgGTpTn6IOX4Dh+TUNcCKCgE02zx7I1kRvZTRlb5Ha4Ws95xg5E2vkIL+/83QdG9wgLLp4Xa8t0DZsPqs/4d+qQSpQgDzR9ZczAW7wIzHyAk9IswFzGVd3cTolMlgESwZC1Tq/FsCHUk00lAMRUHW482mU8/ORqUiMfurzBW4Go4qkB/ZGSKV4wuJIU3trRUUEU=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(46966006)(36840700001)(86362001)(426003)(2616005)(16526019)(336012)(82310400003)(54906003)(316002)(966005)(16576012)(8676002)(7636003)(6666004)(5660300002)(36906005)(7416002)(186003)(478600001)(70206006)(82740400003)(26005)(70586007)(83380400001)(31696002)(47076005)(36756003)(31686004)(53546011)(36860700001)(4326008)(6916009)(8936002)(2906002)(356005)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2021 05:38:39.7721
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d90c387-53f6-4a97-3c19-08d959659c54
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2946
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 8/6/21 10:35 PM, Dipen Patel wrote:
> On 8/6/21 9:51 PM, Kent Gibson wrote:
>> On Fri, Aug 06, 2021 at 09:52:54PM -0700, Dipen Patel wrote:
>>> On 8/6/21 8:07 PM, Kent Gibson wrote:
>>>> On Fri, Aug 06, 2021 at 07:41:09PM -0700, Dipen Patel wrote:
>>>>> On 7/31/21 8:43 AM, Kent Gibson wrote:
>>>>>> On Wed, Jul 28, 2021 at 04:59:08PM -0700, Dipen Patel wrote:
>>>>>>> Thanks Kent for the review comment. My responses inline.
>>>>>>>
>> <snip>
>>
>>>>> 2. Does hte handler solution create race between two handlers? i.e. edge_irq_handler and
>>>>>
>>>>> hte_handler, for the worst case scenario as below?
>>>>>
>>>> No.  If hardware timestamp is selected then no irq is requested from the
>>>> irq subsystem for that line - only from the hte subsystem instead.
>>>> So there will be no edge_irq_handler call for that line, so no possible race.
>>> That is not possible for certain providers, for example the one I am dealing
>>>
>>> with which requires GPIO line to be requested as input and IRQ needs to
>>>
>>> be enabled on them.
>>>
>> So, for your hte subsystem to work, the consumer has to also request
>> a line from the irq subsystem?
> Yes
>
>>   That makes sense to you?
> Its not me, its peculiarity of the hardware that I am dealing with.
>> Have hte do that, rather than the consumer.
> Sure, for cdev it would mean to duplicate (most of) the edge* or line_create
>
> code in HTE.

Ignore code duplicate comment, shouldn't be big deal.


> For such hardware, my initial doubt remains the same about
>
> the worst case scenario between two handlers, but perhaps that's
>
> implementation details for hte to handle.
>
>> And another reason it makes sense to integrate this with irq...
> Alright, will explore this route as well. I remember both Thierry[1] and
>
> Marc[2] raised some doubts (time to revive that discussion).
>
>
> [1]: https://lore.kernel.org/lkml/YFm9r%2FtFkzVlYDEp@orome.fritz.box/
>
> [2]: https://lore.kernel.org/lkml/87h7l1k9yi.wl-maz@kernel.org/
>
>> Cheers,
>> Kent.
