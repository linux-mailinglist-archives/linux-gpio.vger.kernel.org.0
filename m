Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 307D6346776
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Mar 2021 19:22:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231401AbhCWSVn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Mar 2021 14:21:43 -0400
Received: from mail-co1nam11on2053.outbound.protection.outlook.com ([40.107.220.53]:29664
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231426AbhCWSVb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Mar 2021 14:21:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RPFHZkSR0+I3YC2/kXOAydJfCs3EQQmf2m1ztV8JROHmI1fXHwFpUT8bQty4HTTEdFC5FD/BsiVbghutGLMmgdp5znevJzjqWz8kOrDeyhSeovr0I5dQynzp361WiW7DAy4q1k/kiMeoI6hHx2YGQQb0AXocG8bkrZwOpQPNEXnMGYupIR9K75s04ZSFXTXA4uFFYV1rMf/h1bRMNWM4hjjaK1Bde/hcbwmwUq5vNyqWA8hIklvBCFq8ycT0ERnmltLoZUVgjr1kz1RImRa26Voq3eOCnpo0SIsVuxruV8xB92p1aOc3rKV8vEHjcB95ffvGXx9JZB2TNtO1wP279w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O7vH3teZCek7pgh0YYJfHUQtV6irGT8W3XyI15JfdSY=;
 b=l6YhmUr+o0BqzfslcjhTXdjwazV6GunPYpAPRtUrH4v9Hnwo1t3N3nRQN8lcqdfh4/KRVv8NQY/7+5DVjLLy2GLHG0tfesdcOcZGn7YdARWaD0ac9zS+fXnwsRVj/vc5Qo86QXFVzofRxZZ1Qsd9hY094H3qtMhvq1uS7KW8c42ErYf8NJ7ZNSOlHvOVvQ/j6EXyReGdZE6s5l31yKTXnDdx5vIcvsUWn7Sne8fgrMMhpHqaylEkSRoTJkBj94gJ/2CxDvalkVRrx9K7B6amvLPfRcafK7rVG4cItjAGfLSSqeBe6xrUQucE+0sybLjRY3E53vbwtGInA07yYUxc/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O7vH3teZCek7pgh0YYJfHUQtV6irGT8W3XyI15JfdSY=;
 b=HUM8sZITPCElWckV9YI8CKmI3v3PiMRXeVaB9vGsBOWP4fSqG/wmpxS8XLRZ/o5QV8M8k1seGATQWAJ5M41aw3cQq/o53SOqEUmhqSwl3fKu0G1e8wi1DefFPBeATGPONcsgAwPxITwUbRQVOkcOhiCngG5hnUI1CXqU21EOhpxJYMUjPdR7omY3Eb9ECMxReoreMJXHG2RYoE4FuswRppK168csB0zq3MTKWr6uoVqatqIeIn/JlpmJZjbrv0ZDeJ++KAwxgdzj/FhL0T8ExrB3I5wE4nlNp2zGFPb0zMKAN8VXZDybJi2AM/mVVOZwfqgTLwJmmkdnYZF++J04hw==
Received: from DM5PR19CA0003.namprd19.prod.outlook.com (2603:10b6:3:151::13)
 by MN2PR12MB4656.namprd12.prod.outlook.com (2603:10b6:208:182::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.23; Tue, 23 Mar
 2021 18:21:28 +0000
Received: from DM6NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:151:cafe::18) by DM5PR19CA0003.outlook.office365.com
 (2603:10b6:3:151::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Tue, 23 Mar 2021 18:21:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 DM6NAM11FT015.mail.protection.outlook.com (10.13.172.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 18:21:28 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 23 Mar
 2021 11:21:27 -0700
Received: from [172.17.173.69] (172.20.145.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Tue, 23 Mar 2021 18:21:27 +0000
Subject: Re: GTE - The hardware timestamping engine
To:     Thierry Reding <thierry.reding@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     Kent Gibson <warthog618@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        "Richard Cochran" <richardcochran@gmail.com>,
        Marc Zyngier <maz@kernel.org>
References: <4c46726d-fa35-1a95-4295-bca37c8b6fe3@nvidia.com>
 <CACRpkdbmqww6UQ8CFYo=+bCtVYBJwjMxVixc4vS6D3B+dUHScw@mail.gmail.com>
 <20210322060047.GA226745@sol>
 <d48fa7b5-8c17-c3d7-10a9-a9811c410a39@nvidia.com>
 <CACRpkdbkmwuAJzD-CpWKqmL3_n1xkvv_2M_DsNs+ZquiaRkKgA@mail.gmail.com>
 <YFm9r/tFkzVlYDEp@orome.fritz.box>
X-Nvconfidentiality: public
From:   Dipen Patel <dipenp@nvidia.com>
Message-ID: <ccbc3854-b513-34b5-b989-31e23e8540ac@nvidia.com>
Date:   Tue, 23 Mar 2021 11:25:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YFm9r/tFkzVlYDEp@orome.fritz.box>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 249287d9-2269-452e-c6ab-08d8ee2879ca
X-MS-TrafficTypeDiagnostic: MN2PR12MB4656:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4656962727D3F913642273C3AE649@MN2PR12MB4656.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y3aYweWm+JWDBPQGVW8xRM4Nd/ziYemuNcvqjN+BqpTBtWO51oi2qIguFKLDuYzN2g0pGVFVQW6FrVizjUYML8bWFDcljL6U+TunMAX77n+9WH7Gos1r3RIN2qFzuEofOYNHdTNdFxYsp+wQAE3IE0j+vF1naQRmnUy4P5cdin+VR+LvvK309BWodMW9gthnTNNpMMAZZWVtqDGnNU6+DTX1YsqyHn5EtkkWjR2OC2sU/Ww+w8xvJI/WssXfHqwSDC+hwqx+Z4FcOGg4GHvsz4gOflNes4NukjguhbtT0lxDtmUGo5wwliPR2bGSBW1zRUkdQBbPxCgcZgmlcB9Vxbr71mqudh8ZmvXQnaaDDs5wl7WmvnF/F38nuR3koBWeVPjjCRm1AkNy+jNs2QR1eOE/jYVrV3NlNAuXgh7LHhy+PsO+eLaox1Vj221OXgdQeeolReVyxDyODIwIciiqpHVvifeAv6LWN7FK1MdQpDu/YRmBCLjxJ9x5utpn2vM/7GrAyVvBuuL6t1C3zroL7DPV5DLVas4ga55pX5l5ChBAW5unicIcrO6PQ5Pv867e9EnUr4yUO6VMnY+VzX9MPCZrpk28cP1tKnySXMgdxWqMXyD8e4CqqbJC2pwIjjn5VKDqAmuDVC5cOBGlAFhIbEOB52h0Uk6ccrEuNlxI91p1y+Av62U+ghQL6ZWLG5/R
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(39850400004)(36840700001)(46966006)(16576012)(36756003)(82740400003)(8676002)(53546011)(2906002)(83380400001)(26005)(7636003)(110136005)(316002)(54906003)(186003)(6666004)(478600001)(70206006)(70586007)(7416002)(31696002)(31686004)(356005)(47076005)(8936002)(5660300002)(36860700001)(2616005)(336012)(426003)(82310400003)(4326008)(86362001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 18:21:28.1210
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 249287d9-2269-452e-c6ab-08d8ee2879ca
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4656
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 3/23/21 3:06 AM, Thierry Reding wrote:
> On Tue, Mar 23, 2021 at 10:08:00AM +0100, Linus Walleij wrote:
>> On Mon, Mar 22, 2021 at 9:17 PM Dipen Patel <dipenp@nvidia.com> wrote:
>>
>>> My follow-up concerns on both Linus's and Kent's feedback:
>>>
>>> 1.  Please correct me if I am wrong, lineevent in the gpiolib* is only
>>>     serves the userspace clients.
>>> 1.a What about kernel drivers wanting to use this feature for monitoring its
>>>     GPIO lines, see gyroscope example somewhere below. In that regards,
>>>     lineevent implementation is not sufficient.
>>> 1.b Are you also implying to extend lineevent implementation to kernel
>>>     drivers?
>>
>> I was talking about lineevent because you mentioned things like
>> motors and robotics, and those things are traditionally not run in
>> kernelspace because they are not generic hardware that fit in the
>> kernel subsystems.
>>
>> Normally industrial automatic control tasks are run in a userspace
>> thread with some realtime priority.
>>
>> As Kent says, in-kernel events are exclusively using IRQ as
>> mechanism, and should be modeled as IRQs. Then the question
>> is how you join the timestamp with the IRQ. GPIO chips are
>> just some kind of irqchip in this regard, we reuse the irqchip
>> infrastructure in the kernel for all GPIO drivers that generate
>> "events" in response to state transitions on digital lines.
> 
> One potential problem I see with this is that Kent's proposal, if I
> understand correctly, would supplant the original IRQ of a device with
> the GTE IRQ for the corresponding event. I'm not sure that's desirable
> because that would require modifying the device tree and would no longer
> accurately represent the hardware. Timestamping also sounds like
> something that drivers would want to opt into, and requiring people to
> update the device tree to achieve this just doesn't seem reasonable.
> 
> This proposal would also only work if there's a 1:1 correspondence
> between hardware IRQ and GTE IRQ. However, as Dipen mentioned, the GTE
> events can be configured with a threshold, so a GTE IRQ might only
> trigger every, say, 5th hardware IRQ. I'm not sure if those are common
> use-cases, though.
> 
> Obviously if we don't integrate this with IRQs directly, it becomes a
> bit more difficult to relate the captured timestamps to the events
> across subsystem boundaries. I'm not sure how this would be solved
> properly. If the events are sufficiently rare, and it's certain that
> none will be missed, then it should be possible to just pull a timestamp
> from the timestamp FIFO for each event.
> 
Just to clarify, I am getting impression that GTE is viewed or made to be
viewed as "event" generating device, which it is not. You can consider GTE
as "person in a middle" type of device which can monitor configured events
and on seeing state change, it will just record timestamp and store it.

I agree with Thierry's point.

> All of that said, I wonder if perhaps hierarchical IRQ domains can
> somehow be used for this. We did something similar on Tegra not too long
> ago for wake events, which are basically IRQs exposed by a parent IRQ
> chip that allows waking up from system sleep. There are some
> similarities between that and GTE in that the wake events also map to a
> subset of GPIOs and IRQs and provide additional functionalities on top.
> 
> I managed to mess up the implementation and Marc stepped in to clean
> things up, so Cc'ing him since he's clearly more familiar with the topic
> than I am.
> 
> Thierry
> 
