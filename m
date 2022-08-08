Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79AD358CD8D
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Aug 2022 20:21:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232854AbiHHSVO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Aug 2022 14:21:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232098AbiHHSVO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Aug 2022 14:21:14 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07on2051.outbound.protection.outlook.com [40.107.212.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 271D513DEF
        for <linux-gpio@vger.kernel.org>; Mon,  8 Aug 2022 11:21:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n6kv8RqeoETQx2jYBGIvIED3K7ciT0GXIwWws+Ix61xzIcyj8gpd5fwsnO0JJarUeQL9cm4kqpU3gGDk+uL0JOvGy1YMpF33uynEwF8WFswYeG3xrbdSaEdp9Ew2AGssLoCJwBVH2dycEXhgM/uAlUcNPSLcnapzJZnKtByuaVPcsG1+4bZkltlzJo26cZUa0iYxbWf1odGyld92Vj91tpHhKb4fLAUAH/1VfYejoGQZ4CJLbPJFKcZEzq8j/tetGWsO8YVjgaRJy0ZnTKD2Eo1j7yfGCi2MhnZQzqRc1ZEFdiE14vBZXEJrDLNSO8cw2QCRve7TwxX5GPYcosX1cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vewIv4WCmJ80UjTaW61iRqdXLWVXBd1GdWRPdC/z+OE=;
 b=OqKpWZbbLYG7ZMsarksjZpVPDgpl3xIoJ9Beeoo7k9qVgZMOd3++jN38rHeB/c6z9eNmcnPKGV0DKmw+3L3ugHl3Rnwi0Ahqa2ml5CTgmtrtAAgMiYvuZNRmi5hOzNaRjXJGB9bm6lkbU+PP3FASxh2ckwlSRtUJE1xSIKDuEbHCNUsgS18H/Nhc74hQAhsHVAzC8ugDK7CCJq+b4HdoI7DgsxNxdHFuePJtO9ZBQxhAWT69mWhSVjXN0lmqaS2SPyK8HlUXSAOjhF/uxcTu5qB0c/pm57DHEhr0Co42OnP9XDY9ZldCrdDkNmut+Ol90eVGv+SYhgfuS2126k/Cuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vewIv4WCmJ80UjTaW61iRqdXLWVXBd1GdWRPdC/z+OE=;
 b=e6MOyReBhmTp81knQOwkzuCdFyqvkvLDMpBvZzV1vlzDzCa4yVlMfLjpumaSfPzoDHRoK5jSGKKpD09gc3ytrnKOKZbrl67AqN9gOSGdJ86lq4NQLUnhkZBQS1XgDDXnEz5DZYPPsp0Q4W6HcDu06OWuPIIKs4eMvOAk1zkPHkc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by BYAPR12MB3384.namprd12.prod.outlook.com (2603:10b6:a03:d8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 18:21:09 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::4489:9a98:ef82:6c67]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::4489:9a98:ef82:6c67%3]) with mapi id 15.20.5504.018; Mon, 8 Aug 2022
 18:21:09 +0000
Message-ID: <234a1945-d09b-8d55-a6ae-fd5f7e05943a@amd.com>
Date:   Mon, 8 Aug 2022 13:21:07 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [bug report] pinctrl: amd: Use unicode for debugfs output
Content-Language: en-US
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        linux-gpio@vger.kernel.org
References: <YvDlZaydFKN5loe/@kili>
 <e835f5d7-6463-48d2-ac6b-8bf92f4047bc@amd.com> <YvE0dvWCX3raEpwy@sol>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <YvE0dvWCX3raEpwy@sol>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR19CA0067.namprd19.prod.outlook.com
 (2603:10b6:208:19b::44) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92aba5bf-2852-40cc-e193-08da796ac44b
X-MS-TrafficTypeDiagnostic: BYAPR12MB3384:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: atEAXG4kodGeJWppAZ3TDTVhxQPgjhYok5ebzVlp9Sl1Z5++QcySD5D8o5ou0pIsdoAefr68BjRDcSoraMRsk0NZWDcpmwqQcNBJSsaqtIFPVoEixHs7H/CHBZawLkshSMppIUFXX/VhYg3Dua5dYpN/qn8Mj13ML8Rm03UKNYf9LiJM02o1DOl6mCRScGplZ9iAwI6/eEO8YlmSdGVkR5/+GnT89jgfpQYJ+ROHMQcB958TzmOwjldMX6ZCbD03601VgVY+8T9UDsA3wgFdlCb9szHjLcAftJuG8iRKEoropxb/Vj0bfp4FvfX8d39oLTyLh3DVcpEHnLvvKXBevFkE1ySeARjsNDtIpN1pLjLOMIdcW/aB11A2AYNT7VrPrOOOImqv3xFAdLTkBaWbLMoL4WpezofR5OwQtTbdXylvf+6/+evdrz9/h9NNpO+R1RDsQ9eGPpKJ0OuFXp1LaiF+8wXHTQgH9ct/U7CY0gnf2LeFaP44qluBz9tUBz8wUQHRYLBHufdfs30O256BNaeRpxtTYr1dU/WKQBZY5EeAcbmOQv3ZAskepcy2B2vM8Ga8TZKxk33h8i88zB8nU2dMCg+6gGQTGyI2bd6NBYvz1sf8QliBQfuxvCm8BRJhzp7kUgT9rq7kRRahOfqR/ur/iF7RrH+5Nzuf5WUcLtN3nrVpk2MyVKbSMaN6vCZ6KHaKxYh1mHSvZpqO0XA2vuNakxVKc05LhU+O8yiT244nD5jsabkb1ntXowq6AokJvnfM3ebulRz3gxxdwSr1gJPSMlEPlt+p4vxWIo1Kpsp7I1ImCgzZ1G4s6IcUddFhOYz2KPjkqCJ5U0WKay+jHQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(53546011)(2906002)(6916009)(316002)(186003)(2616005)(41300700001)(26005)(6512007)(6506007)(36756003)(83380400001)(86362001)(31686004)(31696002)(6486002)(66556008)(8936002)(66946007)(66476007)(5660300002)(478600001)(4326008)(38100700002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M05DUDNIQkdtdTRLZnNlZ1kyNzkxUWtOTkYzZ1hyVDFqcFNwNHBKQlc5ZVN4?=
 =?utf-8?B?MFVLSjBYQjFDOEljeGw1TUUvTS9pdVZXVEFldjREdnQ2Vjg4Mk9YT2FWRmhh?=
 =?utf-8?B?SXNqRG9HVDlqeFNmMWFsTi9Yem81V1lKbkluNnY2L0J6d1VhMkZzSGs4T2hh?=
 =?utf-8?B?M0l2M1RSNWN2OUZLdmprSjFVWXZqRnIyYXRjN2lZL3Z5YzdETzVYYVRMWkxU?=
 =?utf-8?B?M09UWTVaYlpHVTYwL0FiTTE2ZlY5S1ZDUTdDUGMxV2IrZWdOT3AxSnVNNXNQ?=
 =?utf-8?B?UnRUaW8yWmxZU3JCTnZSRFNudFZvbTYwaVZmYWNmMGM1SFk5N2l3d0MxM2U2?=
 =?utf-8?B?dTMyTkNFb2dsdnFnTUhoQUhvTnBGVk9FNDJuT3ZVOXJXT1NkTVVob25BVkVO?=
 =?utf-8?B?NVlHOENGeGFvK3RDbkFVSFVSd3hRRkZFMmFTa0RneUNqOGJTNk9MTTBwQnpZ?=
 =?utf-8?B?eEF5VGs0WGg4eG4vcGlSNktxRzZWUVBGOVN1SzQzblV4ZGp4TjVBUHZsQVIw?=
 =?utf-8?B?YUs2SG1HZ1NncmEvM3BTYzFsZ29PcFN2UGVDRVVBODBjVmszWG04eENFZEJn?=
 =?utf-8?B?VXNtcFc5OGhvSEkzK284d3dEOGI3ajljbkJxWGs0Y01qNTlPQmpZT1RhdlZR?=
 =?utf-8?B?RUhnMUhTb1J3NGwrOWRiRkVYM041SzNxVUkxNk1tU0NUZGRVSm84THZab096?=
 =?utf-8?B?SkdSVkdGUmVjK0NhUW1pajQ2RngwMmRqZk41ZnRLRmw3NERLb0phaXB4Qk0v?=
 =?utf-8?B?VW1qdmRnMGU0NTNMQUd1YTJNbGZZV2Vlb0RiZ09pYTdiWG1YbnZ0T3gveWJ2?=
 =?utf-8?B?T2M5Wk5RcWY1Nkl0M084enhLenVNeU9mSG9VYVd3RXlkbit1WEMvdHNNU2VT?=
 =?utf-8?B?elBpdThVYmtPSDhCWDZ0MDdoNUIrQ2Iya2luSStpdXY0NHF5UUprR0QwN1RP?=
 =?utf-8?B?Q1BZOGxHeEhyTjQxSGUvQlRYOEVMUVZsMVFjVzAxaURjRzZwR3Nia3JNYjAv?=
 =?utf-8?B?UHpGRlZoNDh2WEkzT3ZVa1RKVjR1RFcyaHFjR2Vud2NMbkNSTTVNOVBqeUFy?=
 =?utf-8?B?MjFFTFZ0WXIvenA1VjNIUEM2RUlETExlRHYva0dNTDRHMDNFdVFaSS9HZVdu?=
 =?utf-8?B?Y05sKytydlBnL0RmTlVzcURZejNHWWNBMGx4QTVKZUl2OStvUnA5TVgvK0Fz?=
 =?utf-8?B?dTV2Q0xkUzZzeGI3QkpYR3ZDMjBsekVKNDBvaWZDQkRZU2dMUk5HOStnb2Vs?=
 =?utf-8?B?T1d1Tjlta3JJdHBXS1d4Ujd0Q0dJSXMxa2xMOC8wTURmZVBsRnYvbmZrVHRl?=
 =?utf-8?B?cUp1b1l3N3VDRzNkeEg0UDRJSlhWVTA4UGJTbzNkUU5ISUJFZHM2Q1FpdEow?=
 =?utf-8?B?aVpQTm5DWkdXZG8wa29rMWMvODZmWCtTYjV3bEZaSWFETzVwZVhydGJIajRt?=
 =?utf-8?B?ZTRhOWZLSlVETHhqOVBRMVRPaXIzeFdjN2xscGNjQmZQMXl3RjFZdk1GUnRa?=
 =?utf-8?B?K0Q4bHpkdTgrcWU2Z0RwTmlVV1htMnFKSzdVZTdZajNWc1Q1K0NmWTlTVjZ0?=
 =?utf-8?B?V2REQ3BMckt2aThBSERGRCt1Tnh2OUpaemMzZndGVTdGOExheFc5ajFGMURO?=
 =?utf-8?B?K052NkFEOTVhY2gyUmNMVXdONm1yclBiMFlOeWJ0OXRJellnMFJwZGlkK1hM?=
 =?utf-8?B?d0FmRzlwVVhMK2JKcHZYcU9tNWQrUFhlaUw1ZXYvam8rU0h4VmJaK0xHUGJC?=
 =?utf-8?B?YWREYmlUTjFGNWNIU1pzczJTTHAvb21aZEVNdzhGanRrMXhkSnlzdXBxM00x?=
 =?utf-8?B?K3Y1NXoyOUlpNHZJbTZCMGluTDZXWDhya2c2WmM2KzFLVER3UFVSQUhqTXBF?=
 =?utf-8?B?aTROTUJUTkwrdUJTbTd2aitheUdBUjhzS2xCbmtRU1dUK2ozWVUvMmI4ZWNB?=
 =?utf-8?B?T0pkU1V5N3U5SzVORnh3WndxbExoeUpsTmlKSGxyaUNFZy9OOWxra2ovcExM?=
 =?utf-8?B?WHhXT3hvUjkyZUNjdE10U2VjRWE2TXM1V0JqZFRBZFFpcmRYM2tkZmxydU4y?=
 =?utf-8?B?andBTStqY2xFZTlCSTROV1VCK3pQMTVxeThxSVM3eHJhVjNPVUJzMkw1NkNE?=
 =?utf-8?Q?MFawBSPrw92oQc04FMSIeHgCQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92aba5bf-2852-40cc-e193-08da796ac44b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 18:21:09.4735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Xu8R1x8lyoGvP9dmJ38d0TGA4tA/pBiD2I3N2aPb7wyDyoztWlFyQnCcf9+WFuoea7aBDRADiuO71scfk7T4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3384
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 8/8/2022 11:06, Kent Gibson wrote:
> On Mon, Aug 08, 2022 at 07:33:07AM -0500, Mario Limonciello wrote:
>> On 8/8/22 05:28, Dan Carpenter wrote:
>>> Hello Mario Limonciello,
>>>
>>> The patch e8129a076a50: "pinctrl: amd: Use unicode for debugfs
>>> output" from Jul 22, 2022, leads to the following Smatch static
>>> checker warning:
>>>
>>> drivers/pinctrl/pinctrl-amd.c:249 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x8c'
>>> drivers/pinctrl/pinctrl-amd.c:288 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x8e'
>>> drivers/pinctrl/pinctrl-amd.c:294 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x85'
>>> drivers/pinctrl/pinctrl-amd.c:300 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x85'
>>> drivers/pinctrl/pinctrl-amd.c:306 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x85'
>>> drivers/pinctrl/pinctrl-amd.c:320 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x86'
>>> drivers/pinctrl/pinctrl-amd.c:326 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x86'
>>> drivers/pinctrl/pinctrl-amd.c:326 amd_gpio_dbg_show() warn: format string contains non-ascii character '\xe2'
>>> drivers/pinctrl/pinctrl-amd.c:370 amd_gpio_dbg_show() warn: format string contains non-ascii character '\xe2'
>>>
>>> I didn't add this Smatch check and I don't know the rules for this so
>>> when someone adds something that basically looks sane, I don't report
>>> it.
>>>
>>
>> All of those are expected to me.  If there are rules against this type of
>> change then we should (unfortunately) revert that patch and the follow on
>> patch that fixed an unused variable.
>>
>>>
>>> drivers/pinctrl/pinctrl-amd.c
>>>       247                 seq_printf(s, "GPIO bank%d\n", bank);
>>>       248                 for (; i < pin_num; i++) {
>>>       249                         seq_printf(s, "📌%d\t", i);
>>>                                                  ^
>>> In Gnome this looks like a thumbtack.
>>
>> Right, it's replacing "Pin".
> 
> Umm, #?

I guess if paired with a heading that is a great suggestion, thanks.

> 
>>
>>>
>>> ...
>>>
>>>       279
>>>       280                         if (pin_reg & BIT(INTERRUPT_MASK_OFF))
>>>       281                                 interrupt_mask = "-";
>>>       282                         else
>>>       283                                 interrupt_mask = "+";
>>>       284                         seq_printf(s, "int %s (🎭 %s)| active-%s| %s-🔫| ",
>>>
>>> Gnome emojis seem difficult to read.  Theatre masks and a water gun?
>>
>> "Mask" and "Trigger"
>>
> 
> 🙈 and 💥?
> 
> If you would consider seperate symbols for masked and unmasked, rather
> than appending "-" or "+", then 😷 and 😛.
> 
Oh duh.

Separate symbols makes perfect sense for mask/unmasked.
I'm not sure that 💥 is any better than 🔫 though.

>>>
>>>       285                                    interrupt_enable,
>>>       286                                    interrupt_mask,
>>>       287                                    active_level,
>>> --> 288                                    level_trig);
>>>       289
>>>       290                         if (pin_reg & BIT(WAKE_CNTRL_OFF_S0I3))
>>>       291                                 wake_cntrl0 = "+";
>>>       292                         else
>>>       293                                 wake_cntrl0 = "∅";
>>>       294                         seq_printf(s, "S0i3 🌅 %s| ", wake_cntrl0);
>>>
>>>
>>> Sunrise emoji?
>>
>> "S0i3 Wakeup"
>>
> 
> Somehow ⏰ makes more sense here to me.

In this context it feels like a timer though, not sure on this one.

> And if you were to use separate symbols then 😴 for wake disabled?
> 
>>>
>>> ...
>>>
>>>       369                         snprintf(debounce_value, sizeof(debounce_value), "%u", time * unit);
>>>       370                         seq_printf(s, "debounce %s (⏰ %sus)| ", debounce_enable, debounce_value);
>>>
>>> Alarm clock.
>>
>> "Debounce time"
>>
> 
> 🕑 or ⏲ or nothing?
> 
> Sorry - couldn't resist chipping in - poor old dan.
> 
> Cheers,
> Kent.
> 

Thanks for your suggestions.  I'll work out something later this week to 
change to some of them and leave you a Suggested-by tag in the commit.

> 
>>>
>>>       371                         seq_printf(s, " 0x%x\n", pin_reg);
>>>       372                 }
>>>       373         }
>>>       374 }
>>>
>>> regards,
>>> dan carpenter
>>
>> Yeah all of those emoji are the ones I intended.  Details above.  The point
>> of this patch was to shrink the length of the line in debugfs output into
>> something more manageable that it didn't need to be imported into a CSV
>> processor to look at the data.  It can be used with something like "less"
>> now.
>>
>> If you (or anyone else) has a better proposal for any of those symbols I'm
>> happy to make a change.  My goal remains to keep the lines ultra short
>> though.

