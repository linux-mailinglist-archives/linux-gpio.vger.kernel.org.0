Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0E00343C10
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Mar 2021 09:51:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbhCVIum (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Mar 2021 04:50:42 -0400
Received: from mail-eopbgr00099.outbound.protection.outlook.com ([40.107.0.99]:34927
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229467AbhCVIul (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Mar 2021 04:50:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AJmEzDEaxNCHVBFKVCxBRSB1ttYyMPw9WJLyMcrL9FEZtMo/91ADFwM+TR1TpV2zEPtC7vkd+ENKQFH5NhO/nTz7A8952go+pfhmMoZl6GNQYxo4w93FGNAUA8Ma8lX9jdhaVkykCtG/DgZ5MVyIw2JHIs5grtJVfPmCtifKdpV+n5J3lJmsR05bUVelU3uoP33HKsOOHQldke9Qr/WaJ8pRXI5+pkyjOxhhdK3rOF+kpQBvmuzAMS8QsQx5qiNg6e8cpy8sctpagFnk1hzJbNSnItAku1ZbOh4gbdblvSelEePRql0oIxe5yabu8a6pzxDtPOWoX/DP38kSY68xDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uXP/DyJy7qWXpcJbbtAdXrrAekTqSe5IsS8nqRw1Ej8=;
 b=cndg5lswBKFoPbzS11pfL+IQhpJkSLX9xnb8k3XU53i+54mvv4+73cpP19Ogta5CxTPEZIqh9dWWzCG1jumRWMQwmkbe18BiZUIjcEiA+af22zbxp9tE7We5imUu/Kqe1+t0WAnjVAjHxmAzAhDxbUskxKe7UWP2saxvM7ALsYixDfxKWsrAgrOShCrMt3bUGb9LZQid8wCUoL/pctIeiP5XwaXWvJ2N1OKp9byo/vo3OFKXuP1omuLx523TaPiWb3l4Vhyqf+KlRT/0YcBDojydkybVWlOIqKAzjV0qnRdsydwMdNkHp0Im0kResKJ8jZJK4Ec7NNLsyL+3UsBuhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uXP/DyJy7qWXpcJbbtAdXrrAekTqSe5IsS8nqRw1Ej8=;
 b=Ich/pG1KyHcnjKtH/UQTv+hUdlZR/KjS4auhdXeJJ8pLpDKrCPswLn8F7YkuV2Fw1ToxFylh+zc86nT5TT6AITqnolDr47pEGoCtesE5YKKyLpAzbgXtdJkoe7Tc+8FM0g4UUJCMUyczc1EO2hkWkTkF1p/lxHUwGCmI2TFNxi0=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nokia.com;
Received: from AM0PR07MB4531.eurprd07.prod.outlook.com (2603:10a6:208:6e::15)
 by AM4PR07MB3251.eurprd07.prod.outlook.com (2603:10a6:205:3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.9; Mon, 22 Mar
 2021 08:50:38 +0000
Received: from AM0PR07MB4531.eurprd07.prod.outlook.com
 ([fe80::7c49:66bd:9795:1a3f]) by AM0PR07MB4531.eurprd07.prod.outlook.com
 ([fe80::7c49:66bd:9795:1a3f%3]) with mapi id 15.20.3977.019; Mon, 22 Mar 2021
 08:50:38 +0000
Subject: Re: [PATCH v3] gpio: pl061: Support implementations without GPIOINTR
 line
To:     Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210319131205.62775-1-alexander.sverdlin@nokia.com>
 <CAHp75Vc=HnafsnnJYceBB66k+r9NcZqn7mxjdsc7dsQd_tK=LA@mail.gmail.com>
 <028a836c-9343-f08a-3f1b-22e45f291d1a@nokia.com>
 <CACRpkdbqKmKh0+g92LHJYKO2vt=-TkdTFuSrNwChCbQ-siG53g@mail.gmail.com>
From:   Alexander Sverdlin <alexander.sverdlin@nokia.com>
Message-ID: <f7dcd087-f404-3268-426f-1b33d1419f80@nokia.com>
Date:   Mon, 22 Mar 2021 09:50:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <CACRpkdbqKmKh0+g92LHJYKO2vt=-TkdTFuSrNwChCbQ-siG53g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [131.228.32.167]
X-ClientProxiedBy: AM9P193CA0025.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::30) To AM0PR07MB4531.eurprd07.prod.outlook.com
 (2603:10a6:208:6e::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ulegcpsvhp1.emea.nsn-net.net (131.228.32.167) by AM9P193CA0025.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 08:50:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 04fc2174-e2d4-4bab-3ec1-08d8ed0f90ab
X-MS-TrafficTypeDiagnostic: AM4PR07MB3251:
X-Microsoft-Antispam-PRVS: <AM4PR07MB325153D92C2D90C209E305AE88659@AM4PR07MB3251.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 82TZKQzJPkagD/35wdU/EjdGfLfYL0OtHjwcSqrMwpjs7pWI6Bm9zNFi+HkXBPkDx6At6qc/wrLdDZCUy4lVrPm8CSOltqRQKUVEKwkS3pgVXUttsVdlW6X65sI8IynfPzqku1xFPpjk05MBr1cyGn5buX8Kf3CZWVp3ZNmZ89H1xUbSNir1eP3vaGXQjjcNE+qrMVoaoWZ7uei6GZNd7K292W+7x+CHO6snN6Cs1Bh2/QWWs+EtiL0VV5GplN60bjsMwo7pKTNVSs5Z3C+w0dyBbGvd4tD78aXT/0FQcRIXtHzcU9ef4KZ8MlByORDKfhVGmc2XtjjPoN0QFFEjMkNcwsvMMEnTtc/ilSrZ7BnSz84xjBberbga+gfxc+VRuJ5M5sVsQZSshb9y4oV7bTr7MDEyHxMAHjPQPYPKvN8d+7eiUNg1N557Ho08SrHvTSuWaYMSr+7wnGVMFnD/+RJSXKhdIdtDR121ryrUnEESnjN0ejlgRRyF1Kwu4O3XeR6NqZQyM1n9Y8Es+t2qHTTEcPmNdBb+yohUamM2DFwO26osF8p/HQxjLoijX9lEVN1hy4Y9vuQ8BMjKZ0ZLxLjBdkV8ypCVDwGgXSrtpOXM3+BJezgIz9Mp10gmDUPZGtVbknCUon/m7G4IENw7GZ3JhcFoNpJRRGynBalDLh0y+zP4gw1lKYRJZDhGe4fsBjcyMts3H8n2cLa8X/G00lHAXg8OHRuWijedhMMCGrfps6HHVLjrMGV8XxMSsd1WX7fv+6u9r6pJXO0xiogeZM5t92st2cVVEdGJC5xOsKc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB4531.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(346002)(376002)(396003)(136003)(8676002)(8936002)(478600001)(956004)(2616005)(966005)(186003)(16526019)(86362001)(31686004)(26005)(52116002)(316002)(110136005)(54906003)(6506007)(31696002)(53546011)(2906002)(66556008)(83380400001)(38100700001)(6666004)(6486002)(44832011)(4326008)(36756003)(5660300002)(66476007)(66946007)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c2ZWbEVUbklYblRsZUxuN2FKc2V1YjMwYm9KaUhRSTJJeU5UVnFXSnRuR3VM?=
 =?utf-8?B?YkhkMXpRZ1hQV1FEZzJNVThjL05RVVp1WWFpdWpYM2xrVnRGbHRybU5PYWVw?=
 =?utf-8?B?UjkzU2tNQU9BWFliaStrUDllcW54ZENrRDU4UmxKTkNQRTFUYWMrZzlFN1hO?=
 =?utf-8?B?bFk5MFVsVWx4Qk9lcE9jTFhNU1pqaUt3SGhjbC81QVo4azNQVTVOUXdtekFz?=
 =?utf-8?B?QW9VeEVxNkhuR3h3TlZDcVZXQURhRFdQWnlVRjRTSWQ1V0ZtVy9yWVNjSmRK?=
 =?utf-8?B?RDBZb1Fnc2IrWXVZZG0vSlhORW10cXVQUUdLMHJ1REJQNXpPZW8wZGlGWmtx?=
 =?utf-8?B?eEZwYXpyN1dqUDh3Z25ZeHZwS3BIY1E4ZVFZVmJNdTZLWHpTZEZwWGwybk85?=
 =?utf-8?B?bTluTHZGejVUOHExUnFoRjR5c3BtSnE1Yi9Hdmd3RFg3YVkyQVg4cHlFQzA2?=
 =?utf-8?B?eloyWUJ1VjN1MVB3N0g3NDI2N2tqVlRyTG84dVVoRGdxdE4xK1dEN0xjSFRG?=
 =?utf-8?B?Q1lHUlpiNVp0TllneGtpZjE1VlZWRGFTckMwUjEvS24xbDNhaVYyMSt1M2x3?=
 =?utf-8?B?Z0JiUEM4TGZXY2puS0djanRzWjRqOFludEhlQWUrK2ZiTFpJSDlKTGpoOVhH?=
 =?utf-8?B?ZHExeHh1OTRKSURjWFhXZzU0czRNR0MzellOSUc5UTV2NjZ5b01yYmhJZnRt?=
 =?utf-8?B?OUdvait1QVdVNkJzMnpKMkVlaUJuTEhDd3krYWYrNnVrb1NuL3NtWUc3STBT?=
 =?utf-8?B?cXRnRHlKS3hsUEJxM3dUUWsvb1VrR1VvcXppRlVTSXBoL0ZhaXozYXBTYzVj?=
 =?utf-8?B?cVJXVFdmaUtkTjY3ZmFITkJmR2NYOGJKV3N3ZzZCbDljazhqbTRTRlF2eWhm?=
 =?utf-8?B?aFpRQUZmd1VXbzd3dmE2aTdhRUdINlN3RWQ5Y25JSWVyLzhVTmFXeXBQR2dM?=
 =?utf-8?B?VjRKT2FtS3BpWENWQ0JlTlN6Rmw1K3hBZlBsdDl0MmYyUGZTNDVxMzJaY2xh?=
 =?utf-8?B?MEJoU2FjNVFaNFBKQ1VTZkpQRjRpK3owQmt3UlRHVHVQZ0FEMURPeER2R2Zs?=
 =?utf-8?B?OHhCem1wdUNxOFBNQnNVVXZDOG82N2tXdG1jYjRDaFptMlB1b3hyMlJJdk9u?=
 =?utf-8?B?Z1NCWTU4RWZjMzRKR0NKVFJ3THpiamFoV01YQ1FXTVhlNnBPeWNvalZ5OGo1?=
 =?utf-8?B?eVVyQ0xEOVVlZkxUL0FSVXdkTGdZYUhDSFVFT1lWMjRHYWJtZ2psYzIwVXFU?=
 =?utf-8?B?WVkvMkErTjhaY1FPZ0R4Q09maGV1dU42WlZkY2lZdHpVbm5WR29lZW52N1lN?=
 =?utf-8?B?aUR0WnZlVlo5a00zdTM3T3ltTDVGVnNKR3lucUlWUlY3VUFHNFhmYytoWWVk?=
 =?utf-8?B?QXZ5aUY1c0VUUTRTaVo3bTFuaGhJLzR0NVROVldleXhUcmZjeVFtZzFSc3ho?=
 =?utf-8?B?MDg5ZjJ0T09Ra1VxTjE5VGI3NDVYYXJZamRZUkYwWTdiQllHaTNNK0t2U0Rv?=
 =?utf-8?B?b1VCeWpsRDJrYitUOFFxWW1yeks5dG45M2VEbkUrZkN5M0cwSlBnZW8xZ0cy?=
 =?utf-8?B?WjVlSGM0NUFxZ1pQS3Y3RUNZTi9IbEE4b2kzMnNrejdXd3hyY0g1ZXVsWG9D?=
 =?utf-8?B?WHJVVExuR3FhR2d3b05IbnhsZG9qcjIyZHRKOEE1TGdKVUV0dUczR1krTnZR?=
 =?utf-8?B?UkdrZ1JjUlA2clovUGxvTmdDU3N0ZlRNK3JPUGp5RmVRZ1pJZjFTUldSb01q?=
 =?utf-8?Q?UfzzxZ6AcJkMA7E321MznlSQ83kYI5OZYAvUH2D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04fc2174-e2d4-4bab-3ec1-08d8ed0f90ab
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB4531.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 08:50:38.4232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BNypeByEdyocb4jxhooBLBMfkHDxpHumW164i7Hq5XVapYCVIhGpkNVz6BiN83cBR7kSgy0TPHvV8VxfQw58QokUCUlOOeraeDZGyDsT3Qk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR07MB3251
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Linus, Andy,

On 20/03/2021 12:10, Linus Walleij wrote:
>>> I'm wondering if the GPIO library support for IRQ hierarchy is what
>>> you are looking for.
> It is indeed what should be used.

and what has been used in my patch?
 
>> do you have a better suggestion? That's why I reference the below discussion from 2017, where
>> Linus Walleij suggested to use it. Well, the initial patch was just 11-liner and PL061 is
>> rather counterexample and doesn't fit well into the existing hierarchical infrastructure.
>>
>>>> Link: https://lore.kernel.org/linux-gpio/CACRpkdZpYzpMDWqJobSYH=JHgB74HbCQihOtexs+sVyo6SRJdA@mail.gmail.com/
> Don't trust that guy. He's inexperienced with the new API and talks a lot
> of crap. ;)
>

Yes, that's my impression now as well ;)

[...]

> 4. Implement pl061_child_to_parent_nokia_rock_n_roll()
>    Just use hardcoded hardware IRQ offsets like other drivers such as
>    the ixp4xx does. Do not attempt to read any parent IRQs from
>    the device tree, and assign no IRQ in the device tree.
> 
> This is a side effect of the essentially per-soc pecularities around
> interrupts. The interrupt is not cascaded so it need special
> handling.
> 
> I think it can be done with quite little code.

Guys, have you actually looked onto my patch before these reviews?

-- 
Best regards,
Alexander Sverdlin.
