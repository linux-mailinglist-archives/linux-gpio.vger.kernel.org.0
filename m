Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30D72402E6E
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Sep 2021 20:34:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345949AbhIGSfi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Sep 2021 14:35:38 -0400
Received: from mail-dm6nam11on2081.outbound.protection.outlook.com ([40.107.223.81]:26976
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240131AbhIGSfi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 7 Sep 2021 14:35:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GahJuvwskE0taxxKoIxdMstqx5YD9PlQm4GaCUc2ij1z6EoJ/9sV6l9lglknxjwjlJdFwcCSeBa6+5iKcqJX6VPJZAevPpF7xN4zcy9Ay7PChvwLlQjh7ljkCRcaipzsPOCInPKwyUDYn0nNF7cr/XOHFlsH5UzpJgNEKp1uqvqUToJl6E1YtEJIZyyw5QrO0o9FGJmAbzogQtQbwBm2NVTmbO4jL9DuvEgDdj4MRQjq6cxOSZW7PupGkj9Tx3JlS2+fhmU307L79Kothj+7zdqd9YY5n/M6j9U8Xup3qDlZCTcRc/bSTl00tonWC1Zg2nLLfJyszzWzGQYWka7mxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=0yhj36tiemFS1k0SOGdy7B8ldsWg53AhIawFn6ZzX+4=;
 b=Gny2H73o/EUMRzU7hOPS4GRTOrmgMKUlMxWTLVqOFbHksHDKDvd4ezRMYx4yn0mpaoQpS09EIyxwW5hXM4txG756p+ptUkIPMzXTonOyNkEtQj1Z4/VGhI8zJmVIG3MKfL7X6ed31rSbPrz98ZcqaHwi+B1FGqCiIqKcVQQ9iokjrq/caPKCa2AxPUoGPEyO5eHTab5OC2knuB480EOqULpRRSavTa9CFrq/WVfXkFPLuKv1GhZ01FYQcbqIN34cCkhKs2ezV5wxMbnWWHNNhFTE0DJwTt/hhzHHIfKVtFOt6EkaSWTxiWzREL47xAhjmAsTQzoYBvI2t7bN/1e6YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0yhj36tiemFS1k0SOGdy7B8ldsWg53AhIawFn6ZzX+4=;
 b=JGSG+NsWOC6pQNpvGEhJm4r9qidPPHnNI4opZJrhbK6hwH3Fp2deQ1augkpzvXaeJM+w8JdLhr0w9IO4qJ0DWaREKpQulFnL+DVSM/7fsMY62GK7R41/W/0Eqhpb35NYlqZNCqizsEyi5zLMDPJjD1VCDKS/iHHHxZVqBhB57ic=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8)
 by SN6PR12MB2685.namprd12.prod.outlook.com (2603:10b6:805:67::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.24; Tue, 7 Sep
 2021 18:34:30 +0000
Received: from SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::f909:b733:33ff:e3b1]) by SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::f909:b733:33ff:e3b1%4]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 18:34:30 +0000
Subject: Re: [PATCH 0/2] Add irq PM wakeup
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        linus.walleij@linaro.org, linux-gpio@vger.kernel.org
References: <20210831120613.1514899-1-Basavaraj.Natikar@amd.com>
 <65cb2134-c209-6381-fccd-43f252af6f9f@amd.com>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
Message-ID: <9c3a0ce4-efbc-e5b7-c51c-317b89ca8d52@amd.com>
Date:   Tue, 7 Sep 2021 13:34:27 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <65cb2134-c209-6381-fccd-43f252af6f9f@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:806:f2::25) To SA0PR12MB4510.namprd12.prod.outlook.com
 (2603:10b6:806:94::8)
MIME-Version: 1.0
Received: from [10.228.28.227] (165.204.78.2) by SN7PR04CA0020.namprd04.prod.outlook.com (2603:10b6:806:f2::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend Transport; Tue, 7 Sep 2021 18:34:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d8796a1-c9ce-4c7c-189c-08d9722e211a
X-MS-TrafficTypeDiagnostic: SN6PR12MB2685:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2685260EF37E2EEF7DEA0464E2D39@SN6PR12MB2685.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t2WqDPnlGd7SNmr6kFz0NzJEa/PqMKCkPnakQ2zKheUXmsg9eAPkPorrgrNh3OA/GP3TjPUMZcx6vhDHSoM67CAKnwKjoRmtzJqfYHz4NCfF1bqUxK6XM1tzO4zQKWKW85tuOMge2Ge2ux/jrA3sRI7M25mKgyYG2UTrV34b+5grerjtmsplNWaaZ3Wa5rdFNwUmrQzpcC6+W1su/eAPkz5z31bB9SaD0Ki/0XzTVJcMYTFjfGn8OUTwofrzfskfjppAUIZ/Iumx7X2JpwXD0g15d50ER/n1xtvgy78lWtgk78ud2OfLs7dNQBQoYOsEMuN77u3WDI9Xrqp/V/fJC2J10LG/ZVWQq6ckfWIk9PCeh4j+M4ZOQ/5CeoJiQdyqXlBqis2cmh6ZnJJBiiIbHrkF+wSRfkJAUwflSsSj2+lFDrJ8a617eji40NCEF7zN95lq2wM0Crrij1ssy0ayCmfge0ks/J2GMqFRWEDkHTcvN/gMqtBMlH1HPCzZhoWt9c6pYxJJI86L9CDLNKIba91H6464GhsivOTN1ThwO1iewottndYvYZgNtmu9IWEg941+d7VQR+tl2vp97w/50imG6hKzoEVnmCUtnmlSVaYGbn1+oyD1fRSthZrzaaVPog9r2WgScOf+wcOt95tGArI3hBg9cUbIZcBskRBt5beZFGbMwRDCzV8Lyc9pEnSiCCdsk10jUIzAtWOdfzAiDhnXGGFvIZ+N23p1/hA1PSh4OkoaJbpR5UWiVHOemgqW
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4510.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(366004)(136003)(39860400002)(478600001)(4744005)(16576012)(316002)(8676002)(6486002)(186003)(5660300002)(53546011)(26005)(2616005)(66946007)(66476007)(66556008)(31686004)(83380400001)(36756003)(110136005)(956004)(86362001)(31696002)(8936002)(38100700002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODJsc0YyaU5rZzRWaTQvVC85dEozcit6QUxuYnYwRFVzUjVYU05uTndMdUIz?=
 =?utf-8?B?aVNMYzhrUzVjdHhNdFIwQlBiNEp4dFo0dFVyQi9CSXc4K1grV3VKTUIwdlpZ?=
 =?utf-8?B?WDdDS0lTMnI4dnB6K3hWVE5LWldEM1p2MHV6M2RRc1pqUURKYnRBZnQyUity?=
 =?utf-8?B?OENDQzRsNzBqSWRwV2JveWkyeThkd3FTQUZVdUFaaFhzZW5wRXlPcVlOWVQx?=
 =?utf-8?B?bm5nbnhpNTk3Nm85QUpnZTVXY1hWNmhqM1k4Mld2d1g2SVpRck5VRURmd3Qr?=
 =?utf-8?B?bHFyY2NOcHNTY1NjQzBkTTNIUkZkSWIxTzYvdWRHQUR6U044ZndRdHN3bXk1?=
 =?utf-8?B?L3hSRWNSeE9QNDNkWmZRY01uNDBjQzFONHNNMnAzWDhzTnBCZStXNzd6YVRQ?=
 =?utf-8?B?SVlGT2lBbTc5dUhSTkg5MUd0TXJnWHNESkVzMjV2TWk2Mk80YXY2QXhIbU03?=
 =?utf-8?B?T1l3SnozdVRtc3pvUm1vaTk2Z0tYeVJhWkpCVXhaSVBzWHZDbFFzdHJRWnR2?=
 =?utf-8?B?bStNY3RVWVgweEkwY254TkJZaHo3YzBmREZ2eE5WdjJYU3JkUXcwalh0bTY1?=
 =?utf-8?B?MTZZQTJQL2JvRnpadUVoQzBjdEFndTFLMlhJWk9JaEpuV1hHWTZWbFBXV1BO?=
 =?utf-8?B?YTN2emluUitqZDFOYlZFbUVlZXU2clZQazhNV1RhRmF6RGUzSFBrdjd2b09E?=
 =?utf-8?B?TjVFNDhVUG5lbjB5SlBoRitaNU9zeXpMRlQraGNOVWxzUWptVHVjVFF4L21h?=
 =?utf-8?B?VzQ2TVJoa2UweXd5dHk1MUM0WDFVUVIvSERxRnc2d0VaellzWFFzQlJIL2Nt?=
 =?utf-8?B?cmp5YWJ6WlB1MSs4K01kc21pZGJJMndpenAyL3E3QmZEOXFnczVGM0VQbmkx?=
 =?utf-8?B?SHdQU2tYVEVHWXEraklIQm9Fc1p6T3NFc0s2UmJ4cU5ZSmZycVdLN21MemNh?=
 =?utf-8?B?QW9ncjdVYVRCeDNtbTRiTk1DdzlaUjNQT0hhMzZjQjdOVExNQmJ0WUZmZjVv?=
 =?utf-8?B?aUdVb2VjZ0xQUEhLTEdMSnM2V2xsZ3NrY1NsZFJGWWEvdlhHQTlJQ202RjVH?=
 =?utf-8?B?YWFOVEtFajdVeE9hWEwxb0tBVmdiUFhlM0NvRUttUEpCS0pTMWZ4OXpWNnlv?=
 =?utf-8?B?ZHk4dEhQSldRRWgxeFAxd3B1b1RJajAzY2Vma1krbHJSZFQyeW9sc0xUdjRp?=
 =?utf-8?B?MEs4amtxeldodzdxQW1ybklDRDJGZHVKTDA4QmhqYjF1R2JLaGQ1Mk95NUgr?=
 =?utf-8?B?UkE3YVNEY0VJWWIzVGZHNlVlb05UN0tyQ2YwdUYyak5PWUZnd3VXTm5uVXdv?=
 =?utf-8?B?aTVhdVBLQTNENVpVUGxMNnc3Y3cxUkFiQ2JOcmZ3a2JPUXBZeXNEaXd4QjZR?=
 =?utf-8?B?bSt0RW5keU1OS3JUZm5Hb3ZOT2pvaDY4WmNZT2xmVURCN1Eva0theFl5bGVZ?=
 =?utf-8?B?K1h6djVacXNVcUc3OFRMb0hCa1Y2MWJQZXNVdGRLYUl0bUhacmc4dkZOaGVF?=
 =?utf-8?B?ZG9oOG9jM2dVVVRHd1d0QWc5T0tMQmZXZHhEK25JeG9INFcwUzBEVEhvanVu?=
 =?utf-8?B?dWoyRGVkTnVVTnN2UWdxby9qa0VxN1hHdjY5TnpPa1grc3RSdzcyeE5iRHoy?=
 =?utf-8?B?Y1ZyR1pSbWE1V2xZR3BFSXB1ckVjRzk5WGFrRGdLOCtNQXRZczBWT1dKRDR1?=
 =?utf-8?B?SDMyY3FCb1kwZlVPanlSSlQ2cm5CWVQ5OW16VUJXbEFuWnIrR0tFU2JHOXMx?=
 =?utf-8?Q?PpLDD7tWn/xCTCmpudfrjo1Q0dThfkA+Q5pjQuc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d8796a1-c9ce-4c7c-189c-08d9722e211a
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4510.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 18:34:30.0738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1cfhCtc8sqS5A2RC5Cn2oU49Sq8B6lBPSkN+mQgQspSMpdbU7UuNafOGeIES695PGyGXz4VQrcVElOFCHujLZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2685
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 9/7/2021 02:42, Shyam Sundar S K wrote:
> 
> 
> On 8/31/2021 5:36 PM, Basavaraj Natikar wrote:
>> Changes include to handle IRQ wakeup mode wake the system from sleep
>> states like "suspend to RAM".
>>
>> Basavaraj Natikar (2):
>>    pinctrl: amd: Add irq field data
>>    pinctrl: amd: Handle wake-up interrupt
>>
>>   drivers/pinctrl/pinctrl-amd.c | 19 ++++++++++++++-----
>>   drivers/pinctrl/pinctrl-amd.h |  1 +
>>   2 files changed, 15 insertions(+), 5 deletions(-)
>>
> 
> Series Looks good to me.
> 
> Acked-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> 

I've confirmed this helps wake-ups on some problematic systems as well 
myself.

Tested-by: Mario Limonciello <mario.limonciello@amd.com>
