Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 181CE34568E
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Mar 2021 05:06:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbhCWEF3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Mar 2021 00:05:29 -0400
Received: from mail-mw2nam10on2084.outbound.protection.outlook.com ([40.107.94.84]:44224
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229437AbhCWEFZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Mar 2021 00:05:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nri7GVrhmNLE+nk9f8SEfEknLEdhYS+t3EPFg6QC5mP3hZqk3qZIQ6Na0pCoo2gE061Mlbr3SecFypB+nLvljdnMaUqNSo6li3uf9n15xJamOs9Il6v4+AZPYiy250RUf3v0m+sLchdLhGBLIG5Bwd0bSCHFXjv43Z5UOaOUdcjvOuCGmKDdivduNTSgNM/A6Ok6zepz3xmooWhh6bruP63vKn7AeMJ4nc+pyjbP1dqp4aJbtdm5GTZnLtQnBoT+3rVY6qTpBDlXOtkJkqoihxuaJGY+Hg8fdIO5TufhIOBS1vvZAn55WB2paEHvFk17eJiEgy6OpNBSesPWl6p5FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLFl47n2VcJTWiT8DJoE49hyvlc8M/LVceE76ez0rmo=;
 b=EfS4KBnPhjO7c5lIt1DH7wfcGFb7h6gs+OFG0IoLX5qRrmQJyQMEdvPReJXHK21oSAuphST9jH5bJ2SvFdMTVs5bje+pyANnMpGT8Kh7JyjO7UliwnNpRI8//4SfMLJEgRsbhy2ExVSBHdKYdYy47HjQ8eyoZTLCe0T8WLhScTJtUjDeWgO/vl6Jw82OI62suXH5dW7J5G1J0JicF0+Gf6YHnjtwP3mq15g7eMJNRjqkkYPSWI/ku8vfwrWq3J7S3c7JFUfF3NU7EbjfyhW9veOFlJz9C5VyhPMGjvIbkE/Wn9HLqG7yqTXvaSovuMWnEPeXAu0n+1vQhE76OBcjYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLFl47n2VcJTWiT8DJoE49hyvlc8M/LVceE76ez0rmo=;
 b=V71aiBJPyX1o+iyvDg5G0M8efbrDJ4ji5KAqV7h+KQqx0uivapAFE1U6EWd1tA51RYpZzzA6wfUKs1xp/36+AaabgQWb66XPhAn00YFgIlS9gtIQuMADLZj/sOo/CCFO7tvCXO6YXffZfZ4DAZn85yhSPgzUMnxzTIe1ET4Q4ULpAwl4MPkqy9Ty7aGcrH2jG7jVeQONXWxGEphS7wWPjuIhU5/GZp/irGphbXEkARs3S2vMoMsgsmqSC6znQqU0cdVsTib/S90Rx6vo9lThRdBm4JrGxTdNjV4ixoixE7DQ0EJ3sHOI9hrovLJ9kTNbQPBox1LCCGjkbg3oH6cqhg==
Received: from DM6PR02CA0138.namprd02.prod.outlook.com (2603:10b6:5:1b4::40)
 by BN7PR12MB2723.namprd12.prod.outlook.com (2603:10b6:408:2d::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 04:05:23 +0000
Received: from DM6NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b4:cafe::56) by DM6PR02CA0138.outlook.office365.com
 (2603:10b6:5:1b4::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Tue, 23 Mar 2021 04:05:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 DM6NAM11FT042.mail.protection.outlook.com (10.13.173.165) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 04:05:23 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 22 Mar
 2021 21:05:22 -0700
Received: from [172.17.173.69] (172.20.145.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Tue, 23 Mar 2021 04:05:21 +0000
Subject: Re: GTE - The hardware timestamping engine
To:     Kent Gibson <warthog618@gmail.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        "Richard Cochran" <richardcochran@gmail.com>
References: <4c46726d-fa35-1a95-4295-bca37c8b6fe3@nvidia.com>
 <CACRpkdbmqww6UQ8CFYo=+bCtVYBJwjMxVixc4vS6D3B+dUHScw@mail.gmail.com>
 <20210322060047.GA226745@sol>
 <d48fa7b5-8c17-c3d7-10a9-a9811c410a39@nvidia.com> <20210323003208.GA6105@sol>
 <7961d9df-4120-e37c-d042-528655bd0270@nvidia.com>
 <20210323025933.GA10669@sol>
X-Nvconfidentiality: public
From:   Dipen Patel <dipenp@nvidia.com>
Message-ID: <16ff9b8a-15d9-f2fd-24f4-817a7078c40e@nvidia.com>
Date:   Mon, 22 Mar 2021 21:09:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210323025933.GA10669@sol>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad624d5f-f25d-441a-abce-08d8edb0e218
X-MS-TrafficTypeDiagnostic: BN7PR12MB2723:
X-Microsoft-Antispam-PRVS: <BN7PR12MB27230F4047399FA7B00621E6AE649@BN7PR12MB2723.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YuQFX+gGYAG6C57kkWJk1ARqFM5Q5FyXmNqLF91b08qQEdRbP4MvAQBBZ9x5EDhG2QJfJEMkMX5Uara7wmCjgvEIjV7my2Tj4ug/vK7AMy5atW85TePXYkQWEvVQ0StC6Q22qn5DeTuzlHNKIryhQiMNXvggP+6by/FxZFpHNKW3P0QkRC6j3Gl3oTk+GRxoeJFL3sc56ogMc8bUQZXRX1+9MX8KqGkPfSkbrtN+6z0uOzMEGpayjcYgVtdkTQQfsY9hCiiNYx/HAvQr8cOYkP6M2qDVQPdj06zpCTyRzP0FBZhD6Cj5d5Y7W9CH70N2mk1v1mzP33UDjAUuT6WT2i4hJ5yK2QeTqEe6vLruncar2drgKC7HluC4/A46slXZAkdryQz9+6Xzd9a8PFd1II2rim4VVirpbS91is2c5jkEx1jisbhWKDt9EDAbXKHc9xGM4fwOlJtZ5kk7GgLdBZDMF5Snz3JmMF3UnEjFAoUHbdkKt1eG3N/OJ7Vgg6nG8IqDNM818uT6MWjf+xyBiUZBgLpUPyqqXBYBoiwhe7+IVb9d6U61USDMXgG7urVklOLq8+zSro4mStXaU/k1+bcOb000jxN0nXhcJcxhyjM08Nc/zvUJozj7J9g0u7WaE9XsqwxD+bd50bjyU1UncnlkET6jCDPbCuCedy4W7NA67lVGnBmi3sBzHBRyggy6
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(39860400002)(376002)(36840700001)(46966006)(7636003)(36860700001)(31686004)(83380400001)(8676002)(31696002)(47076005)(36756003)(4326008)(53546011)(8936002)(86362001)(356005)(82740400003)(6666004)(54906003)(82310400003)(70206006)(6916009)(2906002)(5660300002)(186003)(336012)(26005)(316002)(478600001)(7416002)(70586007)(426003)(2616005)(16576012)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 04:05:23.5220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad624d5f-f25d-441a-abce-08d8edb0e218
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2723
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 3/22/21 7:59 PM, Kent Gibson wrote:
> On Mon, Mar 22, 2021 at 06:53:10PM -0700, Dipen Patel wrote:
>>
>>
>> On 3/22/21 5:32 PM, Kent Gibson wrote:
>>> On Mon, Mar 22, 2021 at 01:21:46PM -0700, Dipen Patel wrote:
>>>> Hi Linus and Kent,
>>>>
> 
> [snip]
> 
>>> In response to all your comments above...
>>>
>>> Firstly, I'm not suggesting that other kernel modules would use the
>>> cdev lineevents, only that they would use the same mechanism that
>>> gpiolib-cdev would use to timestamp the lineevents for userspace.
>>>
>> Sure, I just wanted to mention the different scenarios and wanted to know
>> how can we fit all those together. Having said that, shouldn't this serve
>> an opportunity to extend the linevent framework to accommodate kernel
>> drivers as a clients?
>>
>> If we can't, then there is a risk of duplicating lineevent mechanism in all
>> of those kernel drivers or at least in GTE framework/infrastructure as far
>> as GPIO related GTE part is concerned.
>>  
> 
> In-kernel the lineevents are just IRQs so anything needing a "lineevent"
> can request the IRQ directly.  Or am I missing something?
> 

In the GPIO context, I meant we can extend line_event_timestamp to kernel
drivers as well in that way, both userspace and kernel drivers requesting
particular GPIO for the hardware timestamp would be managed by same
lineevent_* infrastructure from the gpiolib. Something like lineevent_create
version of the kernel drivers, so if they need hardware timestamp on the
GPIO line, they can request with some flags. In that way, GTE can leverage
linevent* codes from gpiolib to cover its both the GPIO related use cases i.e.
userspace app and kernel drivers.

>>> As to that mechanism, my current thinking is that the approach of
>>> associating GTE event FIFO entries with particular physical IRQ events is
>>> problematic, as keeping the two in sync would be difficult, if not
>>> impossible.
>>>
>>> A more robust approach is to ignore the physical IRQs and instead service
>>> the GTE event FIFO, generating IRQs from those events in software -
>>> essentially a pre-timestamped IRQ.  The IRQ framework could provide the
>>> timestamping functionality, equivalent to line_event_timestamp(), for
>>> the IRQ handler/thread and in this case provide the timestamp from the GTE
>>> event.
>>>
>>
>> I have not fully understood above two paragraphs (except about
>> lineevent_event_timestamp related part).
>>
>> I have no idea what it means to "ignore the physical IRQs and service the
>> GTE event FIFO". Just like GPIO clients, there could be IRQ clients which
>> want to monitor certain IRQ line, like ethernet driver wanted to retrieve
>> timestamp for its IRQ line and so on.
>>
> 
> I mean that in the IRQ framework, rather than enabling the physical IRQ
> line it would leave that masked and would instead enable the FIFO line to
> service the FIFO, configure the GTE to generate the events for that
> line, and then generate IRQs in response to the FIFO events.
> That way the client requesting the IRQ is guaranteed to only receive an
> IRQ that corresponds to a GTE FIFO event and the timestamp stored in the
> IRQ framework would match.
> 

I do not think we need to do such things, for example, below is
the rough sequence how GTE can notify its clients be it GPIO or IRQ
lines. I believe this will also help understand better ongoing GPIO
discussions.

1. Configure GTE FIFO watermark or threshold, lets assume 1, i.e
   generate GTE interrupt when FIFO depth is 1.
2. In the GTE ISR or ISR thread, drain internal FIFO entries
3. Through GTE driver's internal mapping, identify which IRQ or
   GPIO number this entry belongs to. (This is possible as GTE
   has predefined bits for each supported signals, for example GTE
   supports 40 GPIOs and 352 IRQ lines, and it has multliple GTE instances
   which can take care all of them)
4. GTE driver pushes the event data (in this case it will be timestamp and
   direction of the event ie.rising or falling) to the GTE generic framework
5. GTE framework will store per event data to its per client/event sw FIFO
6. wake up any sleeping client thread
7. Points 3 to 6 are happening in GTE ISR context. 
8. gte_retrieve_event (which can block if no event) at later convenient
   time do whatever it wants with it. We can extend it to non blocking
   version where some sort of client callbacks can be implemented.

> And that is what I mean by this being an IRQ feature.
> We need feedback from the IRQ guys as to whether that makes sense to
> them.
> 
> Cheers,
> Kent.
> 
Best Regards,
Dipen Patel
