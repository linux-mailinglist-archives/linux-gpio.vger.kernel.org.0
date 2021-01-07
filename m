Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 670392ECE38
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jan 2021 11:53:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbhAGKxq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Jan 2021 05:53:46 -0500
Received: from mail-bn7nam10on2085.outbound.protection.outlook.com ([40.107.92.85]:52224
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726754AbhAGKxp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 7 Jan 2021 05:53:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EAV0566HGQKrmkMBFXErWZyAbV0kklt0X4JMGgoklPpGD07CoklKKNDnHfgmdWhdVLUQs4uzfiuQ9FbrjmHtzR4Heebnu71DKVaERTSjbHrgnJFTinBSrp67k4Ea/37MhCAjHYCMRRXCBa0ZP8wsgK2h6Yq/D9TPq/jRaVJPVr7A2xbp0SuEh+E946pJjeTwkC8BZMdhITJ+FvmqatL+681fGyQULt3q168fI8jbs+eEN2PgfoSDxpClBuMS4GXMfiu3wGe+YkCj2nyz4DwYeo8tPS8EhiadWgvpQ2zTQHZAOSCrxv7corMa/Y9QF5O/0C7PtXtBRnvC7IiZwfr8fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJueBPyjk2WHR6hZj/d9U+OQZnSCbnt2h+voCDE4fgM=;
 b=BnzFHvhhquA/BaQ7e0c9jVa9jloeIWkh3cjlln9YFQkdH2aOG9h6PuHj8VU17y5hkqlLMeCAEK4JfUif3DnvX3/cBb7I7L6zLWaoQh2j0A1g3X+bddLEEj/BGttRaj7lDDXQso9dvVXpvDlCtI0i9lX2E7jbP7WaCkJTLQGMzpjoTeDjhClzgPhihTE7JUirPNB7Wwko2e7z0bY99M3yMy/0teVipmRtDnHlmMAFlyRJgkR7NQJHpacvTNIqIk2KDtE3BVTk8ddrdUzsNVjY0j4P9DzV0VIoFZt0ILI9tBLKiLkLxVWH4Z9/xZa4SxlbbhQ2Tq0m42Gf+w06CJUBIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJueBPyjk2WHR6hZj/d9U+OQZnSCbnt2h+voCDE4fgM=;
 b=YNe9zxJUVAiK3Uo+QYmOR3QYZKh51wEh+2AXy6AK4Dn33gIO9x9568ZvdItgy+JPUkGJ78L2LErX0Jx1kc0gs+KTeTpPg8PNFtv2xlF/Mms6rrqPKCllRV4IO7JoM0SftXbfFPSXNexi+D89NWeCvYVvCmoHpBKHh3D3Dsq9OM0=
Received: from BL1PR13CA0100.namprd13.prod.outlook.com (2603:10b6:208:2b9::15)
 by DM6PR02MB4650.namprd02.prod.outlook.com (2603:10b6:5:26::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.23; Thu, 7 Jan
 2021 10:52:51 +0000
Received: from BL2NAM02FT064.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:2b9:cafe::3f) by BL1PR13CA0100.outlook.office365.com
 (2603:10b6:208:2b9::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.16 via Frontend
 Transport; Thu, 7 Jan 2021 10:52:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT064.mail.protection.outlook.com (10.152.77.119) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 10:52:50 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 7 Jan 2021 02:52:45 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 7 Jan 2021 02:52:45 -0800
Envelope-to: git@xilinx.com,
 michal.simek@xilinx.com,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org,
 syednwaris@gmail.com,
 vilhelm.gray@gmail.com,
 hancock@sedsystems.ca,
 bgolaszewski@baylibre.com,
 linus.walleij@linaro.org
Received: from [172.30.17.109] (port=48692)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1kxSuK-0004s4-OB; Thu, 07 Jan 2021 02:52:44 -0800
Subject: Re: [PATCH V4 5/5] gpio: gpio-xilinx: Add check if width exceeds 32
To:     Linus Walleij <linus.walleij@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>
CC:     Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        <sgoud@xilinx.com>, Robert Hancock <hancock@sedsystems.ca>,
        William Breathitt Gray <vilhelm.gray@gmail.com>,
        Syed Nayyar Waris <syednwaris@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        <git@xilinx.com>
References: <1609936000-28378-1-git-send-email-srinivas.neeli@xilinx.com>
 <1609936000-28378-6-git-send-email-srinivas.neeli@xilinx.com>
 <CACRpkdZrBXJSo_kicWKQ_wtFTZvkOUNyjP6UHZfY7xwRSNZBRw@mail.gmail.com>
 <11abb0f7-407a-3509-ad50-cc7698147ee5@xilinx.com>
 <CACRpkdZ7rbPyppatnBhuf9m89XuAhZ1h_JQ-JVs786YbN3tYxg@mail.gmail.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <f260347f-bc97-6065-ece4-299b72f0aedb@xilinx.com>
Date:   Thu, 7 Jan 2021 11:52:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdZ7rbPyppatnBhuf9m89XuAhZ1h_JQ-JVs786YbN3tYxg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c6c37ed-ef39-442f-6ca9-08d8b2fa60de
X-MS-TrafficTypeDiagnostic: DM6PR02MB4650:
X-Microsoft-Antispam-PRVS: <DM6PR02MB465007250CFF8D96EF05009BC6AF0@DM6PR02MB4650.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VMWBS3HzoIMMQ+rMm+ZyXE+HrJITJ9E2y1/xlI/bRIwU/rlW5WYlSxL2vbrD+j2kpMHXICU4OZO0/8AADTaOAJ5zIXVxMVES5k0L09IiHjokHIwV1CFLj2T3zbwPFKjLvViQElPGKideh6nMANu3EGxYyzLsnjf5DGighqAFLWiqmmXcykx3Hrpd2lGRL9OCze5aQjyYI0cbVgoiFup+Y1yMEI6Q2AneCRT/7Fh69KUFl1QlZjtJ0E3JTKLiUhdE7UKOOgGMmopLeWuGbHADmi8LbVQryRM/ueRjxi+ik8acEZ9WMni+9ZKNhlljilnGqXphcvaGZBE8GeGd8WVNhsNG4//6zjpyTEeKoP8HflhwbgqN4SDTrikW7yKtD19/ryxKV5gF9ca/CoLff601UMEG3n+27Wt5lG5VO2SJluRSWnYP0enupWUBhc+MClpB2gP/x0vdQFkqPfnfC1rbzB1fkfWZpSrfB85zI1DgeXjQIOjqdvfWjalaCsp04rwsT+pgQptU/Pb28HlmNuFoZZuimiecIsjLs+m3QXAYzAI=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(136003)(376002)(46966006)(31696002)(9786002)(186003)(82740400003)(356005)(70586007)(4326008)(44832011)(34070700002)(70206006)(2616005)(8936002)(107886003)(47076005)(336012)(5660300002)(53546011)(82310400003)(8676002)(316002)(26005)(31686004)(7636003)(83380400001)(36906005)(426003)(54906003)(6666004)(110136005)(2906002)(478600001)(36756003)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 10:52:50.8195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c6c37ed-ef39-442f-6ca9-08d8b2fa60de
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT064.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4650
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 07. 01. 21 11:47, Linus Walleij wrote:
> On Thu, Jan 7, 2021 at 11:29 AM Michal Simek <michal.simek@xilinx.com> wrote:
>> On 07. 01. 21 11:17, Linus Walleij wrote:
>>> On Wed, Jan 6, 2021 at 1:27 PM Srinivas Neeli <srinivas.neeli@xilinx.com> wrote:
> 
>>>> @@ -591,6 +591,9 @@ static int xgpio_probe(struct platform_device *pdev)
>>>>         if (of_property_read_u32(np, "xlnx,gpio-width", &chip->gpio_width[0]))
>>>>                 chip->gpio_width[0] = 32;
>>>
>>> This xlnx,gpio-width seems very much like the standard ngpios property
>>> from Documentation/devicetree/bindings/gpio/gpio.txt
>>> but I guess not much to do about that now. :/
>>>
>>> Do you think you can add support for both?
>>
>> support for both is definitely possible but we need to handle also gpio
>> width for second channel referenced by xlnx,gpio2-widht now.
>>
>> It means we could end up in situation which can be misleading for users
>> where ngpios will be 10 and xlnx,gpio2-width another 10 and in total we
>> have 20 gpios.
> 
> OK that is confusing. Let's not do that then.
> 
>> I think that it is better not to start to mess with ngpios property not
>> to confuse people which are coming from other SOCs because ngpios can
>> suggest all gpios assigned to this controller.
> 
> OK I agree.
> 
>>>> +       if (chip->gpio_width[0] > 32)
>>>> +               return -EINVAL;
>>>
>>> This looks OK.
>>
>> Does it mean ack for this patch?
> 
> Yeah after explanations this patch is fine:
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> It's just that this hardware with paired controllers is a bit weird so it will
> lead to discussions all the time because it's hard to understand.

Maybe it should be described a little bit differently in DT.
Just to have gpio node and every bank could be described as a child node
where standard properties could be used and irq will be shared.

Thanks,
Michal






