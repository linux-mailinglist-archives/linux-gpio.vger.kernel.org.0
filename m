Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D63A346ADE
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Mar 2021 22:16:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233461AbhCWVPl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Mar 2021 17:15:41 -0400
Received: from mail-dm6nam12on2080.outbound.protection.outlook.com ([40.107.243.80]:20352
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233409AbhCWVPS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Mar 2021 17:15:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E/Mn6jj+HJ93UqerDlh5b8Kv2l90fgV6SDbHeEAkkYG8XZrXmtiIY1lKxyEMs6J1r2nMeVTqmAFa0IOOt9b5h6X2ZtCuWaZEuP4H0pPlkE+J8lejzyAmTecCuLVh1fclV5rY9XaNgxQiRyEoHQObWZVS7/aZh+G2Bq3mtlA3rTJdvSphle2h0WltB/t1Wd9xJscyNlPdzmGA6sHegooLdr9iU0HPlSu+JjqOMwaM89KsXAE55cHZQ0yhr8k+lORs1izNEKnvJHDuT5jw8qJod8ZvnTXf+lSJZgmJbMUkLVK9mSbQvTIsgQ+GbVAUbZXbXPL81FRHCGo0Mj+29Ziqzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIxlxaYx318NiUbUyULMx8+KswuUqP01mm9WI9/o3fU=;
 b=YZtwlu/dP9IVrrlJvecGJZ/DlJAx6Za9jSgwRi1UBxgqu8VkDxmZ+KZ4JaJUZJybmIYGgDwM2eW2usPr/CNkhsdUXeH2Tv6FWxtiiYEOhBbr/O24NceDH7//15zPL2yzehPO1evnu7NhsfnOtaKGMxojc3Q00Iz6+ChWkrxTdM2F9dXn2COkyYgzcE7Jj6EU9Kd0/cIH/fTBcMlCbIvtTvEVwMFEbP33UxSTXvzbhBcPtaYFXwTLNHgjJ2BWRLZtlv33k4S9H/4FoH2lPd8iB7/QZh/mkst7QkdCpdmY/3PnAW/CmXtdNCqQQ45GALjMzlcXKu8hkFxoWDxJdIpPuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIxlxaYx318NiUbUyULMx8+KswuUqP01mm9WI9/o3fU=;
 b=NVCaR6dSFUqkFjeVwzeMLVxJIUs1YZQZr9FQ1sWVVSuEUemEhZmx5SU9GP/mYO3YKBAvAO4TMSuOzDAFDIR0V0Xliu5uaeYB0PJnz8Gl7Ci5gmoTKLdoy5E34lci/HXnzxQ6nEijh4ln3gCmoTqbBa5g2I6AMWdwUBHOhQXjCXwuZNGUA049LAf52G+21HZNON2rsKibWfr3akVeD5Eo5fTYxR83nEEPK/5A/8XKMuvFdQtFSen0afh6pgawsJIjczLMrpkapcJJcqqccgzFAC9dHuFPkEIDLclS4350Rxducb9VoRLeytAAZaNbtuXBVEec1UXFOAB9Dee/2+ot7Q==
Received: from DM6PR06CA0063.namprd06.prod.outlook.com (2603:10b6:5:54::40) by
 DM6PR12MB3947.namprd12.prod.outlook.com (2603:10b6:5:148::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18; Tue, 23 Mar 2021 21:15:15 +0000
Received: from DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:54:cafe::4e) by DM6PR06CA0063.outlook.office365.com
 (2603:10b6:5:54::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Tue, 23 Mar 2021 21:15:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 DM6NAM11FT050.mail.protection.outlook.com (10.13.173.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 21:15:14 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 23 Mar
 2021 14:15:14 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 23 Mar
 2021 21:15:14 +0000
Received: from [172.17.173.69] (172.20.145.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Tue, 23 Mar 2021 14:15:12 -0700
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
Message-ID: <727d9529-4f36-37cf-cdb2-9401079c9ec7@nvidia.com>
Date:   Tue, 23 Mar 2021 14:19:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YFm9r/tFkzVlYDEp@orome.fritz.box>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c125ffe6-aa9f-40b2-9003-08d8ee40c0a9
X-MS-TrafficTypeDiagnostic: DM6PR12MB3947:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3947F11444201DE619867C0FAE649@DM6PR12MB3947.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pVNbssuu8naOUoJXpBOG4AkTqRwSU+3PAjs0ZsxJnXmTNjb2nsHjg19MdyEt7YTeQEkUYZLkQQECcST+cIA3QAj+fhVOKP3Ld5pAMTDBkGh9C/8UEvB7PRJfTW2sh5C6x/fjNujcVyGvImqYRPC/r0CI/3SILUeYRacKCmXZ4m0Zcoa806V8ycCIHHvMQETmrpZfNXK3TiOI/xyrcKIYW/BNO0/O/gonETzV85mR/W1qqoLJK7JxRQFzmrsqBl06wCnJ3dHXBIBf4FYbsVxRdScsRAWCH+E9rUykCnQyDQ9whvHIQ3UqETwads2CMlVZNazfnhfJvryo8SKt6KQ9sylDAQGHoUhzBydTFMP224UuX8D8ZlnWDbESfOh/QHjgFZX17QwCeXyqcvmErzAXO8WdoEj/hie6asvVE7BhgHZvH1NJq/k7VcSwpF/60lWYNYsxpO/VMA6R6+xxGsHn9udI/y68uy46Mm+a3niBOcoW+8qO+HAD1hiHCcZhr0iHLYsJ2BRCSXJWxNN/leo0L8YAxKN1hAs/OIbcP1UOkHkN8chWPWsNcp7ioertlFoAaoRz5TBbZ77IrKCwkSLglSm2ndBfECkigMIOqJbesoVAKIde93W3tLRtDAMBXHOWbKXMyhbMT4iAwi/LaNG5YjQF55c82Ls23irbCgWwtVBZh7LucIdRtqOBcoIzmAN6
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(376002)(346002)(36840700001)(46966006)(36756003)(31696002)(7636003)(2906002)(8676002)(31686004)(356005)(36860700001)(70206006)(8936002)(5660300002)(70586007)(86362001)(53546011)(82740400003)(82310400003)(186003)(16576012)(336012)(47076005)(7416002)(426003)(4326008)(316002)(6666004)(110136005)(83380400001)(478600001)(54906003)(26005)(2616005)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 21:15:14.9391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c125ffe6-aa9f-40b2-9003-08d8ee40c0a9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3947
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
> All of that said, I wonder if perhaps hierarchical IRQ domains can
> somehow be used for this. We did something similar on Tegra not too long
> ago for wake events, which are basically IRQs exposed by a parent IRQ
> chip that allows waking up from system sleep. There are some
> similarities between that and GTE in that the wake events also map to a
> subset of GPIOs and IRQs and provide additional functionalities on top.
> 

Possibly similarities just ends there, since these wakes are actually an
events, it would make sense for them to be implemented in hierarchical IRQ
domains. GTE does not generate event or be a cause of generating any event
besides its own IRQ.

> I managed to mess up the implementation and Marc stepped in to clean
> things up, so Cc'ing him since he's clearly more familiar with the topic
> than I am.
> 
> Thierry
> 
