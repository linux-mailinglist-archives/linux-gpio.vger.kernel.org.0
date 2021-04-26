Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E71536ABAC
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Apr 2021 06:34:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231667AbhDZEfE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Apr 2021 00:35:04 -0400
Received: from mail-eopbgr30130.outbound.protection.outlook.com ([40.107.3.130]:37653
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229469AbhDZEe7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 26 Apr 2021 00:34:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YfOCyHvhqS2pOOGhYeNGbkjTU8FV5PRBYLM6+2qzT0NUqFLBW3pxymcww0ktTAAIsIs+awhyFXisKhcgIQ+60Noa4bA078qPizTIM0Rl/P6JvHJ+zHUV/XbidOgfzVRT/w638ydPFHJR2qJ28d3TuCWuGo4ZA+XzfIQeiZSuPOjKWpkO10aew12stlfAF/nLAWoZqIYpxkbPpwtVKGcG3QhXDYfHH4WyWDegIj3DzZ34InTMUOXErl5ZCwfmWkZT4e+SFxesLSnTz5cH5HkDviK1VQhDZ1zNaSi8GvxSKHHqkn9hEKXbVGJ37NdDKQ85yfdRmWHcbSCPBvbAAsUCPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGqF/lpSoQskkOnt7MAit3sKQ443fnktX16c8pRviPI=;
 b=kmVeCtKEugz00H1PnsRqVYlImP2uvhM8U9HeP5aZG5pzobyGiNIsSy8x6bGVLHR5kwQnxvvXBegFlpkBI86N1MT7vHfyxhFI/0f0xpKsh7VYI9O+ToZKZDmbEHbd6uX8ENbuDGLreElqDdiWQh1tHz8nxQ729pweveBPk1LCKvIKA1B3lwHkxaA/PybkWvGojaBKoDQO4qt/zHLRzGuAzXkfAy9Z35HF6fxWh2QCKBPZJTgNhoR6gHO/qsU3TS2k0cLcgbB2teeN1FYVvF7SN1uY33j5kF+WnVTVNyaFkj6A4K0PiP8IetDdK8lLM8AQ2zLypsy/dyVnVoB31cDsGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGqF/lpSoQskkOnt7MAit3sKQ443fnktX16c8pRviPI=;
 b=f1Vr4xDytU8Oy2DEMopKldYF6oVg65BGzkyAHPsTBqxjb0nwa+hRlNpHw0seBk7f66We0PxFVbsF5srl08ElyojtVyAnpWu2mdcHuRv6G1Z3xFlSafGxbuvlBmv1VlpWSlSHOkADMfFsisQZDrl7UXQmlRH60GmtM1KMNvpPckg=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB8PR02MB5849.eurprd02.prod.outlook.com (2603:10a6:10:f8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Mon, 26 Apr
 2021 04:34:15 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::d47d:ca8c:4fe6:3908]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::d47d:ca8c:4fe6:3908%3]) with mapi id 15.20.4065.026; Mon, 26 Apr 2021
 04:34:15 +0000
Subject: Re: [libgpiod] Request an output line, without modifying the value
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <6e26b4e5-277b-459f-29e7-7eb7e949e6a5@axentia.se>
 <20210424062132.GA14885@sol>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <ba9021bc-6558-910b-47ce-c2effb821fee@axentia.se>
Date:   Mon, 26 Apr 2021 06:34:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <20210424062132.GA14885@sol>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [85.229.94.233]
X-ClientProxiedBy: HE1PR09CA0051.eurprd09.prod.outlook.com
 (2603:10a6:7:3c::19) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.229.94.233) by HE1PR09CA0051.eurprd09.prod.outlook.com (2603:10a6:7:3c::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend Transport; Mon, 26 Apr 2021 04:34:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d821ff7-040c-44ab-94c2-08d9086c8c69
X-MS-TrafficTypeDiagnostic: DB8PR02MB5849:
X-Microsoft-Antispam-PRVS: <DB8PR02MB584955584FC919E8B5D8F499BC429@DB8PR02MB5849.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EbKWMofio8NMGrdXXG/EixZYolRca6GyReAGzBtylJJqQz3NuMmEFP8bYfxQcDeRpTJ9pXjU3MRTkqChocAEqNQsK6eZGUmrfYjhc740s+GDx20rV8WgrOabbTsH1KW6qDUm+lGIiZGoeKWElVCUiojgn8lfX3ZS9jrCyRFNHw5qQPsy5iJh4H7UA25oVHSnUZ+jHlQBXJFtypOL4C5f0BggKZfejANPLfnfW9Ms4r30Rt0UbsGV6yfIgW215ARNuPrlYU4H+SuVkIDpB6nseA4QcV4dOWu61f4xqtgXPYMsjaNwikSzNwyova5ElepQprye3vI7y2nPQiDkBgF9yHU1TPYqgR9hsNCaTtoFmpPgwsRBCbVU9w0kte2RGZDySkrwaXt0FZ6RIYwaIUtnR5dxp4FyyIw/Vm8LIMH7qdMYXS49E/xxKEwvMhrHA0aC3Q73GR+PletU2GY0Ko4PxpvsTVf30gn0uaE6qHA0UuKKQ/pmI8Q7xIIqedkA/VzqCm8IMUkGXo5K11MSpwUjlc+rV6u+5ATpNfI7keV9oj0Q4vvNwahZT3q236/HGfgHfjiiguBu1meVnqBIFF26lPdvEcxAv1PtkfT+MeNbluSy6+ctgk2D5MBc1s/G3EJy3vC/8/jNE1+X+rebeDhyZSyrApRiZ9pqOMNAF3SIc3yXo2wBnVmF0cagyrx+nYjP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(346002)(39830400003)(136003)(396003)(316002)(8936002)(16576012)(4326008)(8676002)(86362001)(83380400001)(31696002)(478600001)(6486002)(6666004)(186003)(16526019)(6916009)(53546011)(26005)(66946007)(66476007)(38100700002)(31686004)(36756003)(66556008)(4744005)(956004)(2616005)(36916002)(5660300002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ODM5bXc5M1Q3a0NtTHg3b29DN0NaYzFYZ0Vqai9rTDFwbTZKN3ovNWVTWUM0?=
 =?utf-8?B?c2hENkFEZVBHVC9zdDE1NFZrdEJBYXcwNHkwVzJFbk0zb01KUVBuSnhqcllz?=
 =?utf-8?B?UzNGcWJmVDJnUjJjOWhNLzdDTnBWV2hxSE96aUhKYkhoYVM2MmtETjRnK21E?=
 =?utf-8?B?VFgyc3ZOUzBmRTZ6RTNwUW00VE1uVjdobTRneDRac3RON0FBeVBsYklsNGFW?=
 =?utf-8?B?ZnhOR3A4Q0MxNUIwUWZvRStsUFprQm5PTk1NemVvUFB2T2E1MWg2cGs4Z2J1?=
 =?utf-8?B?enFCS3ZuZ0tQejVDbHJCMWM2ZWpleit6UjkwcU94UjNadU1EZmhGT3E1d0dG?=
 =?utf-8?B?WnVmRk45U1p6YUtYcW8wa0s5VEtMa0xPZVVobSt4Um5lYTZhcEJFcnNxVENH?=
 =?utf-8?B?WGF4Yi9xTzJleG9mN0k4K0pYZ2l0REFwc1N1eFNvUG0vQ0JKZ3Q5Q3lCdGtB?=
 =?utf-8?B?cFpPdGdwMnRiSGgwb1UwblZWVEV3dWw4K0RpcGx5NHJlVml4RnJ0bmhhWnZY?=
 =?utf-8?B?L2w0SlB5UXFFMkFBSzl0eUNWUFhleWV3SytyeU9qMlBneHR6cDVSMnVSNmMy?=
 =?utf-8?B?Y0lTcHk5Tlp0TUNPdXlSRjFya0hKM3lMcnpiV3k4ZmJyN2toa2NUU1FlZmhu?=
 =?utf-8?B?Z0VhQ3VzVWo3eDMzdEg2N2NQVzdsWVp1RkZ0ZDJ4WHpIVkQrQjkyaUtSck53?=
 =?utf-8?B?OWxSVVE4ZkVJOEhCek1LMk5Za3l6amJ0STlJVzZ1dFJKd2lobEhMcDc0ZzRR?=
 =?utf-8?B?M3dwV0ZOa0V0cUNJV2VGWk11TzZWcE1Eak5kSDk2TWM4SFJrQURqUjRSNVFK?=
 =?utf-8?B?SVQrOHpSVVFjNHdVNGRuTFBCOTQyQWdIa0o2U1ZWbFIyMmt6Z1VQU2MzU3JD?=
 =?utf-8?B?RlQ5UE5EWlI4YmVGNXNZck4vUW5MYnJMTkhCMEZsdENuTDVwWTEzbGZ6KzUz?=
 =?utf-8?B?MGlBdCtmc1N0dm5nUDREWFBiNnJpR1BHbVdqM2lEcHBjRGlZMEEwUUUxMHY0?=
 =?utf-8?B?aWZadU1HNjl2SDVUbmJyelVMclZ5bVR2bDlVS2JSU3pGUStOWllYMkZhNVl4?=
 =?utf-8?B?dmt3QXIwd0gxTE82MGpXWkRzN1o1LzJHSTJXYmxBRTJiek1aNHorSE1KVnhl?=
 =?utf-8?B?d0NIYWU4U3FmeU8xWVhtdGlGZWtYb1QwK1p6YllYa2NwNkQ0UUE4dHBlUEhP?=
 =?utf-8?B?QlNydXlJL2kyNjNid3Nsc1dRSXVWZG90U3R6Q3BrelpBQ1dTWndMSGt2amYy?=
 =?utf-8?B?QitpQVhqK0FtNkZ1RHlqa0xicHErUnlFNWN4dDJUWFNOOTRpTXR0anZKOXNi?=
 =?utf-8?B?aUh3S0RXMnBTeWcyNUdleGNXZ210ZVg5dENIUmZyZVBKS3lEWVQ2bWtneVY4?=
 =?utf-8?B?ZEYyM3oyK3hYYmZSSXNVTk1Kc2owUXNscThVajdzRitMSWRxdlM4Si9EVXIz?=
 =?utf-8?B?Z0F4RmZDMU53WDZYRnIxM0J4SjBOeDM0RDdqbkhnZm1wYWpVc1BNTTMvQVlC?=
 =?utf-8?B?NTJqbG94VnRvZmJEeVJ2RnptbjZITEVBTkF4aDFNVjRXU1N6T2h1VXYrb1Fr?=
 =?utf-8?B?N0MzNkR3ZVVQMzJtVmFiYVlkanFSMDlNWE4zM3FrOTFDSVc0eUN1SERUMXRo?=
 =?utf-8?B?b0RtL2NvMXV4T1FFN2tMdTZNTDEvb3ZzQ3BlMFZpTmdKNWJLZ2N1VHhjZXBN?=
 =?utf-8?B?ZHI2ZTM0VzI1NzJBdkppbjhveDRjTlVTUVYwc2pxMTI5dGkyb3NweURKdWdw?=
 =?utf-8?Q?TtpOtS38Tlve8I5Vx+17kEoAkJWEgCtZuWoiW3w?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d821ff7-040c-44ab-94c2-08d9086c8c69
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 04:34:15.6874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CW7hIdGJuwQ4qlVIXBds3vo9/bBlmgrIDEdX5DIVPaQws8KSTS/8TD8vRiz5Ch/H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5849
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2021-04-24 08:21, Kent Gibson wrote:
> On Fri, Apr 23, 2021 at 05:32:15PM +0200, Peter Rosin wrote:
>> Hi!
>>
>> I'm wondering if there is a way to request an output line using
>> libgpiod without clobbering the previous value. I would like for
>> an application to take a peek at this previous value of an output
>> gpio and behave slightly different for 0/1.
>>
>> Cheers,
>> Peter
> 
> Assuming it is still an output then GPIOD_LINE_REQUEST_DIRECTION_AS_IS
> should do what you are after.
> But there is no guarantee that the line state is preserved across
> requests, so YMMV.

Excellent suggestion, I'll try that. And now I of course feel silly for
not seeing it myself, it's so obvious...

Thanks a bunch!

Cheers,
Peter
