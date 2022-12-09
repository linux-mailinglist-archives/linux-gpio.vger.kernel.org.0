Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35BFF64889A
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Dec 2022 19:46:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbiLISqg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Dec 2022 13:46:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbiLISqf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Dec 2022 13:46:35 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2071.outbound.protection.outlook.com [40.107.243.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6072DA56D1
        for <linux-gpio@vger.kernel.org>; Fri,  9 Dec 2022 10:46:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YD9jsDziRn5VvIvPeBqf3hw5uq3luhlM3zE9+ToBHnX4DP1dGp4iIYCRJxuDxYdKn8KvStvZMIYiITnQ001qpxmuMGxTdfIqN0bceoeyWbFgtSJotMUjSsBdpKVgRZdriWzoNCLdKfWKvwBgXLG/WaNWpyIvKMwrL++Ake8Wq7BkXWWlF9QVSHF2ShX9sHBAsOobMC5tJmqHS8JLlAB8Iccxm5tuR95xD6VP4hYyUoFe+fHmjHBzUll42vsdwgdDO/1Acl5hiodvr/owY24sobGpkS6A7Nps72VIFs4f4mB5lFnDj86PhjmiBdv1J8yy0lxkQeZwD7TDxKDjnkoUHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0s2tsB27UNs+VuSJee9vMtB5Mug8Dhug3sGQFklgZU=;
 b=Ql/p1s9aKEZG1dnlmvObBRuxkgNozFetTA3//0GdAbjlFp3XjzOTd/VMHDMr0A17cm1vKhoFWL1APf9ZTWBRY8h1arcvXDip+2sNTx9+mT+55s7l+0tG0qhJEg7a1b9RRg9I7SF0uz8w21BKIqqcKcv+G+BOU0H5ztr8NTWhPrI4S6etIQX+O2Myif22X5iVH2hUsHTpXs2LqD04/NG8oYppIarRnmM0f5i7/nMEvewZCf0b2cOts2xgIbftAj7lR9SmqNDt6wr2JZOV+jIWw/cWlNYDZ+E72i/YBMxtTRUs2f0k4xkv+RGgaAa9mYZW6pdQGS4nWj6KVJOA6voFOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0s2tsB27UNs+VuSJee9vMtB5Mug8Dhug3sGQFklgZU=;
 b=atV/NiZNrk1Kb8RQPVul9S2g7AsU4xzexUz3LpP5Q1xH2JgP0hUFSg9Vk3OptSKKr++fw/wcEyFBn+i8Pm2TBJi4I/aJDLP0B85ZZM/kz4T4E8f9EAzxSCufQzuuU4i969Ls2tKsMlpoU5LUP8LCiCG5A0PnqwgpkbMI6lSHCEY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by SJ2PR12MB7798.namprd12.prod.outlook.com (2603:10b6:a03:4c0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Fri, 9 Dec
 2022 18:46:29 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::3fb9:3266:7937:44fc]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::3fb9:3266:7937:44fc%9]) with mapi id 15.20.5880.016; Fri, 9 Dec 2022
 18:46:29 +0000
Message-ID: <71d2d5fb-df50-5930-5e7c-ad7f8f060921@amd.com>
Date:   Sat, 10 Dec 2022 00:16:12 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] pinctrl: amd: Add Z-state wake control bits
To:     Linus Walleij <linus.walleij@linaro.org>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     Shyam-sundar.S-k@amd.com, linux-gpio@vger.kernel.org,
        Rajesh1.Kumar@amd.com,
        Mario Limonciello <mario.limonciello@amd.com>,
        Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
References: <20221208093704.1151928-1-Basavaraj.Natikar@amd.com>
 <CACRpkdZZY8B5iicQ4rddC0j455Cuj=aXBGtUjHfXDsViCMbTFg@mail.gmail.com>
Content-Language: en-US
From:   Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <CACRpkdZZY8B5iicQ4rddC0j455Cuj=aXBGtUjHfXDsViCMbTFg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::18) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|SJ2PR12MB7798:EE_
X-MS-Office365-Filtering-Correlation-Id: af32ad62-94ea-4f87-efbf-08dada15aea3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: awQND/BhWVvCJo7b4zsWnmSkHwwALZgw4ql4xxs7Ie0Learmvevs/PoWi0tPw8WPumFyCcSWBqcex44QcKFUggwVSXoRmRWadZrXMbMly4ssFvDyCpvsaEVa2ze3EhP968C50qDNu23VhhOObK/PjL3E9u10jbCWY+69gIKpQtuzb4wjKNsGnPDVmVrEqLMlm/73g9UlmlGxsENSmI8JcP1j+jORkKiZLx31NE2Dc0BDoBAkAPpfgwHc5m4yw0+HJKY0U6UPLFrMTIqZCbsJov2EN4cBY/18pe+rP81DMWTa6Dt09hfhDynWjXGIE1RnPViLhUqNXfk0j6gJhN3/XZvmpmzpdo8/9wtuopE6e5QpshHVMe82ujNFE2PTzfB7hxv5AVVED6sgfppGiDngwDbCWIU0N+Mh8NVlLXDXa0lGpB/d2g+SoAL/xXXEAgUjZKBophjSCM3rg6V4aIoaaDC47tqn3/sVVYl0JUN/PXsski1uOBVBfKwDKJBALNWEKcNfFPMYtsjdW3RW6JGJsp/pH3BLRBNYdrJjjReLsiyAWvi1rum3EiKy2IYcbVlwNv1RxY2PeTj5yGi65ue4qsvB37KoNIZTc3p0ggM9sd7B85Ns1igeaRuQ7oRyvS+L8Kocfr8bnD++t5Cn6grcFHupIqkxUf3sZbHubhgU8YaVA4mD7UUHPFN5LjfvylMTj8zIZx/j7SFLDiqzyj4qwcpF61PrcZkvrpZ4rTOlOyo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(451199015)(36756003)(31686004)(2616005)(5660300002)(41300700001)(83380400001)(38100700002)(8936002)(2906002)(6486002)(478600001)(6666004)(6512007)(6636002)(316002)(54906003)(66556008)(110136005)(4326008)(66476007)(8676002)(66946007)(6506007)(31696002)(26005)(53546011)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFQ0SVBvaFFZOW5VZDMwVGtnNVJEbjR4UXJReFJiNGY4dndxNFpBQkRIN1B1?=
 =?utf-8?B?NzlYZS9uUVJ2QnFqM2FhYnc2SVFDQkpoTFpUV2JJYkpsQVI5Q3hBM1pDWEtF?=
 =?utf-8?B?RDVDZHZnV2VXK05vc3hYTFF5c2ZzSmQrM21CbDJtSkk1UW9BZU5BVkcxV3ND?=
 =?utf-8?B?R3FqQVRYajRvdlUwRzhCZVFDTm1lK1AwVDlWVUdaMVVHeDJHMFdGdkNVOVg4?=
 =?utf-8?B?ZE1NQXg1RUJpR05wOGZKVmVIbFRyeXNQZ1ZsVmpSeHVFUy96OThGTDFqRml1?=
 =?utf-8?B?aWdIM1dxZlBhTmNDWXhpOGxnb2Jxc3pCYjZRcXJweThSd25mblhwZ0R2czkz?=
 =?utf-8?B?RXgyR2c5eWJoNS9aUGd6R1ErY2dxQTE1cmk2bnd5cGdWMDIvd3lEK1paaWtE?=
 =?utf-8?B?Zmh5cWZ6ZlFaaWtwZXR1WHZqR0dvYjFWWTRsRlFMSXA5bUxRbmsweGljODZM?=
 =?utf-8?B?Y0p3dGUyVHFJM3ZkbE1zY3hsOVhPRlBEUDY4djRuMlNESjBZenpHNXRERDVP?=
 =?utf-8?B?NkRabW16UlJpcngrTVA0dlF3TkFQdDNUbDFDV1RrZ25QTmI4ZXAvU1drWmlB?=
 =?utf-8?B?ZE9ZRFdDNkFGRkdRWVZWeHZtYW8zM2UxR1hOd0RmMmVIUEhlRUNqNXcxVXVx?=
 =?utf-8?B?cDcyYVJSaXdYSldNL2hyTzUvSnpUUlFZRFBGQjNiaXVhNHJobXY3OVdVdSt6?=
 =?utf-8?B?Z1EwdUd4RnFMWGhHYUNhY2xuRGhGZklaaFlCQks0d0dBZ1VMM056QStZMFJL?=
 =?utf-8?B?Qk5nam9hTmFUTXVCcTUrazBpd1laTlNrU1B6L1hoOG04M0d0WWkxR2hDclJt?=
 =?utf-8?B?VHF2RUlkUktDNFJGdUdHa0FhTmVrM1NvQ1B0engzb2NEYWh2VUVBbktlNWE1?=
 =?utf-8?B?K3plZGtIaDNXaGVFeFQwbnptZDFKVUVQVHBDMUxtK21vODlUNXdyd0w5bWts?=
 =?utf-8?B?cE05OWk2VEMraU9jYVJUVGUyRFNRQnR3cGZ6VzJJRjlmZ1dybXB2emNONmhm?=
 =?utf-8?B?cGNnUlJ2U3BFQytZUFB0TDhxZnRYajBrZkVVZzdDSEZqZmVJV251WGpFWUp1?=
 =?utf-8?B?RUg1bEFRYlMxTWV4MHVrT3BYYjNwUDhDUFpDS0hvUHJpU2tFdERyVUxvVXdq?=
 =?utf-8?B?R2gyYkZRY202RHpac2YwWmVZMU1VV3lUWEx0Qm5HYlIyeGVEblh2OVhTc0ZW?=
 =?utf-8?B?L011WGQxc2tvSFJyT3lsY2ZabzU0eHU5WUdHZ0lFTmNDMHNlVzVLdUdnVit4?=
 =?utf-8?B?blBQeG1leVIvaW1hUTlJL2xIMTAwY0JQZXlCcWYwWTVQUk5LMS9hQllKTzl0?=
 =?utf-8?B?NXJITmpTMHN1V3pkUjAremltMmpkTlFzNi9melhuRFNlOCtQaVJNbWZkVFB5?=
 =?utf-8?B?cWpGZ0YzSHZjelJVcUJwUlJ1eXJkaERPQjRjR09LTXRjbFlKTzIvNFJsbk1W?=
 =?utf-8?B?NzFKRzZBVVFhSnl1TThMOHFLY3duaDFCZ1ByUjZFVkU2bHlTaUExWHFnbmNE?=
 =?utf-8?B?eFRaR25rMmtVRTZVY3c4VkRYbEU2NzlKTDR3ZUlMMWdheVd5NGZGMzJiRHVj?=
 =?utf-8?B?SHp3Uy9yMmQwcVBDaFFhc2s0RVB0M3RHdVM4dWJmSVlLMk05anhQRVNObDRY?=
 =?utf-8?B?OS9ENm1HUVJXb1Y0WGxXZ0Y3Ty9RV0FJaEtEZVYwTlUrNDZTaExvSDZ2dXZL?=
 =?utf-8?B?M0pYSlNVUElVYXNzOXVqd1l6QXY0Z0JqKzdodUZLYUJRVTJCVDdIN3hoV1VZ?=
 =?utf-8?B?RXJ2eWpLNVJRbWltQ1FtMkV3c2ZUb25rdmFVeFIzdWwyc1BYb2NMYUNYZUFU?=
 =?utf-8?B?Wjh2akN5VGtxbDBLY3AvR29PV3JibS9MR3l4Ykl3ODk1ZDlyUE5WdG84cklO?=
 =?utf-8?B?T2Y2RFp1bERxeHRCUXBBNjkzZHRxSDFndzRka3RhV1RIYVN1UEVKRThhekhs?=
 =?utf-8?B?b1BDZkdHY2FxYzlJWEZkSmlHZ0dwVERyb0pPMnFTcUJ1YUxzdEVJWnlFVjM1?=
 =?utf-8?B?OC9jcXoxYm5oZDZQcHpMUmx6aWd3ZWR0OW94b3A0Q1pEdHJGNXVwekdhM0NY?=
 =?utf-8?B?TTNzOUFqeWtBSmRiV0h2b1dPL0pkbTJkVURjVXVNeTZjSTEvNkpyR3ZaVTVL?=
 =?utf-8?Q?saT0Miu0tIb6TGIiGvyJV/dXO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af32ad62-94ea-4f87-efbf-08dada15aea3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2022 18:46:29.0961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4/eQm7I7I6oVoUaQ4oBNZJmEXZ/zqgbhsXmvh2TLpRSUw42xTmVbdLJcfZ4CaF9xmNsmc1pypxHOAhFhTf/Dsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7798
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 12/9/2022 3:51 AM, Linus Walleij wrote:
> Hi Basavaraj,
>
> thanks for your patch!
>
> On Thu, Dec 8, 2022 at 10:37 AM Basavaraj Natikar
> <Basavaraj.Natikar@amd.com> wrote:
>
>> GPIO registers include Bit 27 for WakeCntrlZ used to enable wake in
>> Z state. Hence add Z-state wake control bits to debugfs output to
>> debug and analyze Z-states problems.
>>
>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>> Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
>> Tested-by: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
> The patch is overall fine, but as debug-only patch hardly urgent
> so it will wait until kernel v6.3.

Sure

>
> What I want to ask is how this bit:
>
> +#define WAKECNTRL_Z_OFF                        27
>
> Relates to this:
>
> static int amd_gpio_irq_set_wake(struct irq_data *d, unsigned int on)
> {
>         u32 pin_reg;
>         unsigned long flags;
>         struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>         struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
>         u32 wake_mask = BIT(WAKE_CNTRL_OFF_S0I3) | BIT(WAKE_CNTRL_OFF_S3);
>         int err;
> (...)
>
> if this is some wake up control that is unrelated to GPIO, such
> that this can wake up on say I2C traffic on that pin or similar,
> is this something we actually need a new define for in
> include/linux/pinctrl/pinconf-generic.h
> so that you can also implement methods to manipulate it
> for real, like setting this from a pin control state or so?

we are not going to manipulate using pinconf_to_config_param
explicitly, setting will be taken care by BIOS. We need only
for debugging purpose to check bit status

Thanks,
--
Basavaraj

