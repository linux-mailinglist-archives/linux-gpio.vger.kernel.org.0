Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A14C343D32
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Mar 2021 10:47:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbhCVJqr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Mar 2021 05:46:47 -0400
Received: from mail-db8eur05on2134.outbound.protection.outlook.com ([40.107.20.134]:18016
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230125AbhCVJq2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Mar 2021 05:46:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PbVsre3qBGDSoeWHgcT45aRDyxXv/Xs9DQfkcrUR7xDSh/IWRN/LPPbwaQNm26o8xbcZ4PX1KguLNi1eXGYv+mfQwqHfCzktkbsT+GH5sI4CzYONle/OBx7TvNNQc5UA3HZ/0sCG1NdYFe/T1/EoDLHShYMQndlBAsa1ZllfGUE8+uUNvleg76GJkpflaxQN98e53WeIhIrWe3bvZSBeep6uOW2yC/eCsLZbInAN7umFfgJlweqZnsEFSCIHJHPB2hzTAmRPKl5vwTrB/kmebKAqo7vjvdxY9R3zoN+ZlqcA5FQ3zwtyRcsIdh3EpzhHiGSVW1B1270MOKPX5NZCgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IuGiX4eDS+uzbTZAGdzAry4diL2E3oOXRbLgbKKDBHc=;
 b=gT83bdOtS6bOOsJyP54qiXzgL3jdbtOF0qPVG2KZPcdjM7YE8ncofMRT3wJE2hBTp61WQyAl1G1LWzjaVFw5UygT6y1Ik4aYMhR9mOFc6JKOTphmm6Fulck7jqkyj9Swcf8fV1DSaUgWgGrqIun2ROMEpW5xg+BSW+7MnmcP9cgrvnguFgIYdAQjqT2CizZlK73q/3TSZyIR1jyCY5fYrbfyR2roHkHXLXVBywTF5G0LumvNMsm6UpeIU0aMuMiswfJFJavTtWvgHh5qDF+uHXHwUWjzGuKZs5hlGoQqW/ZnZ+SQT7EoRfO/SwWWAOfL0TZ66nOvzIKgm4KrRxzs+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IuGiX4eDS+uzbTZAGdzAry4diL2E3oOXRbLgbKKDBHc=;
 b=edVlG8tn8Qh+zWKEKXeWC6qHfF+auiQC2JzkHA5wepE/iHIntYfKhlj4nBKeTi8GccDDVa2ARlpdpL9LmO8bAn0OuACsxqLRMfnlnWmu0wgBviwbOjsQtu8BL6OxPFy6bmh3VWTpyfgxo9zWtChHy5EgchCemrNihNtGQld54gs=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=nokia.com;
Received: from AM0PR07MB4531.eurprd07.prod.outlook.com (2603:10a6:208:6e::15)
 by AM9PR07MB7842.eurprd07.prod.outlook.com (2603:10a6:20b:300::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.9; Mon, 22 Mar
 2021 09:46:26 +0000
Received: from AM0PR07MB4531.eurprd07.prod.outlook.com
 ([fe80::7c49:66bd:9795:1a3f]) by AM0PR07MB4531.eurprd07.prod.outlook.com
 ([fe80::7c49:66bd:9795:1a3f%3]) with mapi id 15.20.3977.019; Mon, 22 Mar 2021
 09:46:26 +0000
Subject: Re: [PATCH] gpio: pl061: Support implementations without GPIOINTR
 line
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Marc Zyngier <maz@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20210317155919.41450-1-alexander.sverdlin@nokia.com>
 <20210317155919.41450-2-alexander.sverdlin@nokia.com>
 <CACRpkdbnc2UHM8w85DjsoMKoim-pSX7-7c2YOUnUDdthNc9Vpw@mail.gmail.com>
 <5a163661-ec37-c8d0-24ce-440336e32c33@nokia.com>
 <CACRpkdYoK03nYRYCHS-0Fj=i3pTuN1-EyrVW2jaG92AyVogYJw@mail.gmail.com>
From:   Alexander Sverdlin <alexander.sverdlin@nokia.com>
Message-ID: <ee619663-80e7-f6c0-9f73-d3ff7438773f@nokia.com>
Date:   Mon, 22 Mar 2021 10:46:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <CACRpkdYoK03nYRYCHS-0Fj=i3pTuN1-EyrVW2jaG92AyVogYJw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [131.228.32.167]
X-ClientProxiedBy: AM3PR05CA0139.eurprd05.prod.outlook.com
 (2603:10a6:207:3::17) To AM0PR07MB4531.eurprd07.prod.outlook.com
 (2603:10a6:208:6e::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ulegcpsvhp1.emea.nsn-net.net (131.228.32.167) by AM3PR05CA0139.eurprd05.prod.outlook.com (2603:10a6:207:3::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 09:46:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5cb134cc-154e-491f-a921-08d8ed175c5a
X-MS-TrafficTypeDiagnostic: AM9PR07MB7842:
X-Microsoft-Antispam-PRVS: <AM9PR07MB7842DE982D17CFD64E8E94C688659@AM9PR07MB7842.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yUIEVXgWYotH8lru96DBo4GNLrrGmHaRlct/Z6deaLUV55Q8jxabHcgrdhby8wdyLwO7HHN6UDeRt0Dq8mcpfG3zS8216Jih1iAtfMevPH+vNIebB4+kXD7ARH5iZPKnO2SbBywPLZFnEmrNvViyNFENBzPRAF2Zx/vsTQwwAP9N3jvkMcl4yd6FGVMp+8U+2MhXceIbFtyiuV/RXwyDMB/ixaVEbjr17MLq6FafxV0XI5oxhI70wDy+w4xV1IK1Ab1XHNkW3bYur642K9FmfG3OI8XlFj124t4w5tXtwzEXv8+FeraGALUB71yfX85DNCeTUiCAvmDTNG1gcWLut5gxMgh/M8nb1OCqpsh5J+ymIMEqXfxphZQ6s+FpJhDo70ETTE5fwhDVjucCJZ5ej54PZ1GgAKW4JNKM/AK72A/4XC0XgpT6KOe+2zNW9pZu99JtCHyzGPLWOQCXTq2CJ8WWPdR1HhQiukZ1rJc1+WZWvZe24qb4j9bzzJ1zHID/6P6gqJzgEa9o661yGXCyZFHHO1rZ6IDLD6hdXulJ9k/ICe9DmYJYZ3+plo0NCLgmgfKR5wnCO01gJ4XAo1vVYD9eMyHGBk3pL6FB9Z+vx4AxkzjiLcwXVL1GAeZHl4bXir1SgMJruZWSNfpJ+4Q3Eo3EQPYeLsevSMKNcBCn4E8UNZBT4j/ealmUz7wLraTndsiGpiglj7cwnzDUBFaChEx8hi1Ut+Iysi6r82fEuROLu7qnDJs0g8MlzFg/cam3nUb6HNK1qeFSM0sBruNyOm2PvcxZci3GlxpBcjm2mLqXBPi/0dojGXQ6DefrNG6B
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB4531.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(396003)(366004)(346002)(53546011)(26005)(44832011)(8936002)(6486002)(5660300002)(16526019)(186003)(6506007)(316002)(54906003)(36756003)(4326008)(2906002)(66946007)(38100700001)(956004)(86362001)(31696002)(478600001)(66476007)(66556008)(52116002)(8676002)(6916009)(966005)(83380400001)(2616005)(6512007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dENjcnJjSFNLM0hldWpCKzZyUitlNENpcXNnZWFXeU94QXYzTVd1L2xhZUF2?=
 =?utf-8?B?K09OVUJXWVJQamF1WFhPako3TSszQWFqQ1JYQk1aV0JObHEyZm5hdE1jOGJO?=
 =?utf-8?B?REREeFRiT0NHOXl0dWEvY21uOXhjZXF4cTQ1OUM5bS9XYlhJdnpwMTJ0L1Vn?=
 =?utf-8?B?MEtJUjZUT1ZDejMzVzJmbFRwU01hUmExOENKUXpWZG96OXQrNlNTMnc1WVFa?=
 =?utf-8?B?YlhLQzBXT05LdE5hUmRJQmpiZjhFZkZ3dXRTalNSK1FUdmt4YmgxWCtqaVk2?=
 =?utf-8?B?cklPaDVOWFJIaW93V29QcVdGbG1mTjFmRDFNMy9lb0NTejNQZ2x3UVlQeWYx?=
 =?utf-8?B?NTFOamVvcmhFWmo4b0loeG5vejgzOFFzQ25sTjlERW53dkgrbkVobTE0K0ZV?=
 =?utf-8?B?WnJ0NTZFWEtBa2dXL2dzUVFJUVJXdHdDRWNOMXY0L2NqajRSNTJZTUpQSzZK?=
 =?utf-8?B?enBPNVFhMXpkWU4yb3I5S0F0TytpN0hIMmFqbWF1LzdEUzlqQXorUU5pK3Bn?=
 =?utf-8?B?bmNHZy9WM3h4dEJRUEcxcE5EV0tDRVhxUG9vZ2ZVL3F4bDdWM3M3bXJNdU51?=
 =?utf-8?B?bFdTWi9vNS9aeGZxNnA2QW5uQzNLVG5Hd05hRis3L0ZmN2dMTUZmRE1ibnI5?=
 =?utf-8?B?SDFPMGY4UXpxUlhlWHBQNWpkb3ZLVk9SQXJpeVdOTEFLSWY4ZnpPam1MWEZX?=
 =?utf-8?B?N3lmUTAzNzViUmFiSGM3TlFvTk8zRmR2OHNBcmFIRlF2K1VjYVBnODlMZ0Q0?=
 =?utf-8?B?emJ0R0VnRXhROFVxd2MvWWZXeU83N0thcHBVbmVQQ2RDNTZPUFVwcXdPRkJk?=
 =?utf-8?B?YnNjTEFobU9obU1pQUdMd1psT3VLQjR0Q3d0U3RTRlBkb1dhMmtkOFB1WTYw?=
 =?utf-8?B?bnJlcUd3eVYxQlMyZ3VPSitXaGxxMG5ubGd0akhNa2ZDdXBld0ozd2orUnhu?=
 =?utf-8?B?MFhvQlBFcE9MNU05U2RxWDhoQldTWjArVVJiY0hnMFhCM2d1dGlNRjRYaE9a?=
 =?utf-8?B?VUJKNjVqeDdCQ21zSy9JR2JkVmtxZFFNME1SWFl1MnRTWHRxQnlTUXhpUzZi?=
 =?utf-8?B?a0VxWW9sbTl4YjJSSW8xR3c3bm9XenpKT2loY0NURnBBdVBHNVZKcHBOR2ty?=
 =?utf-8?B?VVNNNW1LZGxmb1A5WW94UDR1c3JiVDRRUnJVdjh2dFhtVVNmRVBpZUxSZWJ0?=
 =?utf-8?B?OHpIS1U3R3E1TWFXTHE3cjMxSjBnLzRLZXZNbmkzZXZxRXNaWnNIYkpYRXor?=
 =?utf-8?B?YTFHYkxDdjFUNHJ5cUdqemFvVFN4Ykx4U1I2czAxK1I2ODBCS0svVHFzV3d6?=
 =?utf-8?B?bXN5MVRadkVLME8zRVFpMWdtTHgwVHhhUUtBYTdEQU5GZEhKVVdIc1c5cGNn?=
 =?utf-8?B?cVJrN1lnUTJudTZUSk0wL055Q2kwREgvb05NV1hWS1M5WDRVb2N3ZGlaWXBP?=
 =?utf-8?B?Q3M1VlI2b0RhSk9QRHdCdTY1SGhING1McERrZGZ5dXBtWWFMdzg3VDR4YStM?=
 =?utf-8?B?WU5HaE0yTGQ4bHhqN0Y1enhOUHVZL2tNaXVEY083ODhnQUhkYjlFTk1jeElx?=
 =?utf-8?B?V0QzZEJkcVNLRy9ySm1EK0xESEEzZkFrdmUzNFE3MUhmQUUzSW9JQXhSTXE2?=
 =?utf-8?B?VlhWM2lDS25WY281bkE2OGtKY2tWRWpWYkwxQnYwZmhGWS9ZVGU2U2xUMlVR?=
 =?utf-8?B?Szd4bFRTbUJSK25McmRpaU1WNmh2dVlhamhGdVJhNktZN3J0SGlkRU9TQUhX?=
 =?utf-8?Q?/3Oo+nxG4ANQwQjbjJJTdVf23YHukbP6aJ+YVVu?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cb134cc-154e-491f-a921-08d8ed175c5a
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB4531.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 09:46:26.6623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Pww5IuGES5y1zr+KK5Y1oivDksYCvN3RnA0QuZ2d91CK+/2kHd4OCbvsCphh9hwIo+UjGVoDm7uT9EYoTXHhNHjTUjPhnNKMcwWUs2xvZ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR07MB7842
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi!

On 22/03/2021 10:32, Linus Walleij wrote:
> I think it should be something like
> 
> compatible = "lsi,<soc-name>-pl061", "arm,primecell";
> 
> Where <soc-name> is something reasonable for this
> SoC unless LSI have their own name for this modified
> block on this SoC. I think it needs to be SoC-unique
> since I bet it will be routing the IRQs to different HW IRQs
> every time a new SoC is made.
> 
> Then augment the behaviour in the PL061 driver accordingly
> when this new compatible is found, using the HW offsets
> for this SoC.

But there are standard PL061 and these without common IRQ line within one SoC.
Are you sure that's what we want, that same DTS will contain different compatible
string for this? Sounds non-obvious and error-prone to me.

And this is really something we can auto-detect. We even discussed this already:
https://lore.kernel.org/linux-gpio/CACRpkdZpYzpMDWqJobSYH=JHgB74HbCQihOtexs+sVyo6SRJdA@mail.gmail.com/

"I would make a patch that:

- If the device has 1 IRQ line, assume it is GPIOINTR and work
  as before.

- If the component has 8 IRQ lines, create a hierarchical IRQdomain
  and chip using a gpiolib core helper.

- If not 1 or 8 lines, bail out with an error.

Yours,
Linus Walleij" 

-- 
Best regards,
Alexander Sverdlin.
