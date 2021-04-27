Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DCF536C242
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Apr 2021 11:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbhD0KAg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Apr 2021 06:00:36 -0400
Received: from mail-co1nam11on2058.outbound.protection.outlook.com ([40.107.220.58]:19809
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235133AbhD0KAf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 27 Apr 2021 06:00:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a4nH0ndjbMl3OJ7cqkDPhwZiirA2VcJXdQ2nz8WIhPhNleOxBwRGiX/xjlq263wxUUoEBGtG1APe/bfDjWu+ONIGPOlfFTLU87NJcY8eLaKL+QwIbdhbWXq1X+rFRaFBSw6kxwxEeja+7OOLZ8r4uCKuFI/4vaUZ31jqshQ04kPnQhk85HnRN324ngV3MJ8J+UMZyhrF9RmRpNa60T0dDekhTlHtDFcSMquEcIwNpJzZpld2QQkKsCcZJa6kAZ/pmdoqK0h0PygbdsQy8c9n44FG1DlL7zJIhFd4rD5QwqMDvA2bDHnK1nm57ybeC3LG+Fl8RFhWiflRt8bC6i/KKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDQNJUJOtTOdz6UZ6vUOda1gaGdWmXJFaqPbkUzU4bE=;
 b=RKaaTk8vD3rS8QjKJa6cBTklqzKq3uq8z3MMh96VWzdw7bO98C5SJPRInFgQXaGoMgIJUMVH6O25HxWloNWtYTDwSmzr2LZldqdaE7yU0vnCOnQfWT21T5vGJ1ewwcqb7IBHfn1lKa4XdKdLxOeSkXmiYSyxr3Dsax0dyGzaOr8bYx3APSJjYFLXeBL2Q+JGrCMVPUsKZaLRzMrAYRj3wq4RsP2SaI1Ivlr/e1W7/VqF215fKxJqPxevpGlQIYf5JVVu1DW+/HckiAOJ2OSDLBeTVsS1+ImlWIUyiqG9oYIe7HVFqohU46Hn/ANXiP63tByQQlH4LN0F44K3cQKvMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDQNJUJOtTOdz6UZ6vUOda1gaGdWmXJFaqPbkUzU4bE=;
 b=PBpg5lC3DNHUlGP6GQ1W0DNOCQZUclvOOs7gGA9OpSkbQ+3lfDNEcX48LJodaH0OEcDsKA8nlV2uXTiOBjMEgz2eAbSE2DDS0q6f/LpybHyLo9Km879/0Y5oQAEHMyaFxCUgvd/VPUJED3yd9kbRqIDOtA6zdmHv7CPHA5SsD8c=
Received: from MN2PR10CA0020.namprd10.prod.outlook.com (2603:10b6:208:120::33)
 by MN2PR02MB5774.namprd02.prod.outlook.com (2603:10b6:208:110::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25; Tue, 27 Apr
 2021 09:59:50 +0000
Received: from BL2NAM02FT038.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:120:cafe::dd) by MN2PR10CA0020.outlook.office365.com
 (2603:10b6:208:120::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22 via Frontend
 Transport; Tue, 27 Apr 2021 09:59:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT038.mail.protection.outlook.com (10.152.77.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4065.21 via Frontend Transport; Tue, 27 Apr 2021 09:59:49 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 27 Apr 2021 02:59:45 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 27 Apr 2021 02:59:45 -0700
Envelope-to: git@xilinx.com,
 saikrishna12468@gmail.com,
 linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 gregkh@linuxfoundation.org,
 robh+dt@kernel.org,
 linus.walleij@linaro.org,
 joe@perches.com,
 andy.shevchenko@gmail.com
Received: from [172.30.17.109] (port=53288)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1lbKVM-0005PJ-AS; Tue, 27 Apr 2021 02:59:44 -0700
Subject: Re: [PATCH v6 3/3] pinctrl: Add Xilinx ZynqMP pinctrl driver support
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Joe Perches <joe@perches.com>
CC:     Sai Krishna Potthuri <lakshmis@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        git <git@xilinx.com>,
        "saikrishna12468@gmail.com" <saikrishna12468@gmail.com>
References: <1619080202-31924-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1619080202-31924-4-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <CAHp75VfCbbnN-TBJiYFb=6Rhf30jA-Hz1p1UORsubF7UG6-ATw@mail.gmail.com>
 <DM5PR02MB3877B234F85F3B4887DF3A95BD429@DM5PR02MB3877.namprd02.prod.outlook.com>
 <CAHp75VfugGqLNU8LKJ_K3dPr=-eh6LHx75eV=33jH9OnryBoGA@mail.gmail.com>
 <d1220d39-4be4-a375-042f-e7bb0264ed35@xilinx.com>
 <CAHp75Vejqe3r6s5eoOfza0DjXEwN-hK73FWkxx6VNpx0y1ms2w@mail.gmail.com>
 <180ca47b-d627-2d7b-1d18-5557bfcf5875@xilinx.com>
 <CAHp75Ve1MY6wms7d1e2cByzV0Zy-rRs-qNMk=6X_fw=zu4rbgw@mail.gmail.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <67cef577-0965-2fad-7d61-17181d692003@xilinx.com>
Date:   Tue, 27 Apr 2021 11:59:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Ve1MY6wms7d1e2cByzV0Zy-rRs-qNMk=6X_fw=zu4rbgw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6362f5fa-4732-4be7-82a3-08d909633251
X-MS-TrafficTypeDiagnostic: MN2PR02MB5774:
X-Microsoft-Antispam-PRVS: <MN2PR02MB5774A8F56DDCFDD886795093C6419@MN2PR02MB5774.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mSP/nVnwvTahMz5HiJTNfmU3eUGUGsGXpdZu5EjKKEi47OePZJBQBWgi1WdPIqZrvSk5s0iSRPg12lsEsUY1p5UXu12WlNKv3ueWw/ryAUZYVzG/HM9OMhWJ8OhQYTSFy3yXkhIk2bzLpcUtiKKVR7NKBbPRr8rVGiYMsKue+gdQrEoiuu2hNo6HN0xA4PpgGRgfSaVTiYSoi7jC8jOIweaTCUeyy+kqXKQbmIwoX4WQaOI//h07Gd9p5yO2w+Pilp907vYxgPuenrb9fd9LGotX5DjxzVgEjjm5dY7Re/kJXEEPiHBRxeB/vvjMErN44A91kZVuPuLv+Ydrt5eTvCl/3/SAMi9ehh8kPBM10gbMqlGWcHR1p5bmCP3PuqO/+Lfen5Yw0HSFX/vLDzAA3XuyOjX06JW7rk4+D1YZtl4W9OsNEtXOH3veciUxfHkvLXG+H6Ljm3O554Wt4TbL8nVcYUbBVk8ZV3RTiNyXkzSr6kmEtc5/yNtZXI32yF+Awb95Jc51IZ3fiKDwa9QCts6fh8meShVZJjNBgZV9c4ySiOfch+xA/rJku+XzOVQAUM8giUYON6PwMUUIe+v24MiVt8jTiZYSIAKIXdYTTGmik6Iu9lusPeGqZ0dqei53vkuahjRGye8RyYHmkaoUMoP367HapmH2Y+gxpyAj64dfAmvSQmeeF0XTFvrzL/rP0QT++m4+qrAdrwHHstuVUg==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(39850400004)(376002)(36840700001)(46966006)(47076005)(44832011)(7416002)(82740400003)(7636003)(8936002)(31696002)(478600001)(5660300002)(82310400003)(70206006)(53546011)(31686004)(336012)(70586007)(2906002)(186003)(316002)(83380400001)(36756003)(26005)(110136005)(54906003)(9786002)(426003)(36860700001)(8676002)(36906005)(6666004)(356005)(4326008)(2616005)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 09:59:49.8813
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6362f5fa-4732-4be7-82a3-08d909633251
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT038.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB5774
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 4/27/21 10:39 AM, Andy Shevchenko wrote:
> On Tue, Apr 27, 2021 at 10:38 AM Michal Simek <michal.simek@xilinx.com> wrote:
>> On 4/27/21 9:31 AM, Andy Shevchenko wrote:
>>> On Tue, Apr 27, 2021 at 10:23 AM Michal Simek <michal.simek@xilinx.com> wrote:
>>>> On 4/26/21 4:04 PM, Andy Shevchenko wrote:
>>>>> On Mon, Apr 26, 2021 at 4:20 PM Sai Krishna Potthuri
>>>>> <lakshmis@xilinx.com> wrote:
>>>>>>> From: Andy Shevchenko <andy.shevchenko@gmail.com>
>>>>>>> Sent: Friday, April 23, 2021 9:24 PM
>>>>>>> On Thu, Apr 22, 2021 at 11:31 AM Sai Krishna Potthuri
>>>>>>> <lakshmi.sai.krishna.potthuri@xilinx.com> wrote:
> 
> ...
> 
>>>>>>>> +       help
>>>>>>>> +         This selects the pinctrl driver for Xilinx ZynqMP platform.
>>>>>>>> +         This driver will query the pin information from the firmware
>>>>>>>> +         and allow configuring the pins.
>>>>>>>> +         Configuration can include the mux function to select on those
>>>>>>>> +         pin(s)/group(s), and various pin configuration parameters
>>>>>>>> +         such as pull-up, slew rate, etc.
>>>>>>>
>>>>>>> Missed module name.
>>>>>> Is this (module name) a configuration option in Kconfig?
>>>>>
>>>>> It's a text in a free form that sheds light on how the module will be
>>>>> named in case the user will choose "m".
>>>>
>>>> Is this described somewhere in documentation that module name should be
>>>> the part of symbol description? I was looking at pinctrl Kconfig and I
>>>> can't see any description like this there that's why I want to double
>>>> check.
>>>
>>> I dunno if it is described, the group of maintainers require that for some time.
>>> I personally found this as a good practice.
>>
>> I don't think it is a big deal to add it but it is a question if this
>> information is useful because module names should correspond target in
>> Makefile which can be considered as additional information.
> 
> For you as a *developer* — yes, for me as a *user* — no. You are
> telling me something like "hey, if you want to know more you must dig
> into kernel sources". No, this is not how we should treat users,
> should we?

As I said it is not big deal but we should care about consistency on
this. Adding Joe here if we can extend checkpatch to report a warning
about it. Then it will be visible and can be checked.

>>>> Also if this is a rule checkpatch should be extended to checking this.
>>>
>>> There was a discussion at some point to add a check that help
>>> description shouldn't be less than 3 lines. Not sure what the outcome
>>> of it.
>>
>> This check is likely there because I have definitely seen these messages
>> coming but never seen any name checking.
> 
> Yeah, it was about insisting developers to be more verbose in the help
> descriptions, but the name is, as I said, an activity "de facto"
> rather than "de jure". Just look around for the latest new driver
> contributions (I follow IIO, I2C, SPI, GPIO, pin control) for how they
> provide their help descriptions (I admit that not everybody follows
> that practice).
> 

I have seen some on linux-next but really when any rule/recommendation
like this is introduced it should be more visible and checked by
standard tools (checkpatch or by bots) then people will start to do it.

Thanks,
Michal

