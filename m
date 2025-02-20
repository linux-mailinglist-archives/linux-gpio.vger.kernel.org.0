Return-Path: <linux-gpio+bounces-16342-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FB2A3E89E
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 00:36:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A5B43BC037
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 23:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7214267718;
	Thu, 20 Feb 2025 23:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="BmHDz3kW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010002.outbound.protection.outlook.com [52.103.67.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E14D26463B;
	Thu, 20 Feb 2025 23:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740094570; cv=fail; b=q0IepbFfAhKowu+061jIKaOfRH5rtcSWn8QDcbE27SN70zgvmIBP2BuersyNzUmOfz3EA86ZS57HC6+Oyjsr3x/wNbzGrGlqwShyuvIOtV+FOIv6zPdEgvLQPrjO3cquvxTW5MNyJYv+yL1xNzWrE7Ix17sUl3w4GahYN5C+fvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740094570; c=relaxed/simple;
	bh=Wnef1dDYWFNwDYWBvCMLI1JL8lpF+PAtc6QCi0u+ajE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rhZ7DYHbWCquCZy4Q2Rru7H/IhbqjPWuud25RhdYgINnHvol6ULKUgrWtC/xD8ilnlIlrgQqn4PpB8yKlIURG63+ip0VuLpAQUxFHka2JHVQPIeIl7dNyyjpN/2BHTiNAElUDPzH4/TTmxCXhbVlxdvR7t5A3tGqFAgPBeCev2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=BmHDz3kW; arc=fail smtp.client-ip=52.103.67.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dW4/4PTsOEiWsfi3wmeAF4A9I5IyW12uDLrQeNSEKcxatnZaitFu/PmmKlhkn0R9/xHEAVZCS8kOMMxiIsNM/8Jvk4x1WtMQ2bcw5C4Evv545jN/ZJhW70dNbsj6ZRBLd6VfFYQxIdMTyl4zA//fckTYfjXhVFI+aFG32md3bhn8PeOYeUhEqsc3KV7dfkk3xNz4X/3A7/IessuUcMYXxjLfjibA7exzVNA0uJN3FFTchb27V9E6fwZcKzlH+fPaF1urM95GO4Au42SMhquYLwaizmo9shUOaXqLT/OZle3y91w6GX9GLg85OB1Ed0R3zJlfRWqnoYHsU9MudOet0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CDozBg9EonKG/NVsiEyHP9kQMCUlz9JopVx7Y0CQjBI=;
 b=MROGwu57NgB6cY2Ws9asrD9XoXh+YjgMb2dxRihn93UzpK3PDGP8C54U5OkH42JouyZkNk5XwUbDzACYqxt5b4VS/aSE8ms0rNK3WfopkSbe+vMFRxSP/uDQHef4R32a2Sl+Bw8kW6Sx2tkF7ozCq8jk2NaZWNs4PBAYoczCmcpDiwLLfSB+pyKkfwQxR9BrY4aPzt2kpdMnW+8hY1e2XF8FZw0PYEAnYyHJYLNrci/LI8xExhY4221kkPd6692IKlFJn6nfTYQhGUUQUr+gx/8XAUh6rrsMzAyQ4ek7tZkw5OITUjpfw2NZwZfaGF5dnANBWNkGMctMXCDerBIaYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CDozBg9EonKG/NVsiEyHP9kQMCUlz9JopVx7Y0CQjBI=;
 b=BmHDz3kWunb3/rGj1PIjsBot1ayfV2XpOEPETG7iiHtjgyRWDJAPFsbVp0cLNgWIdJ6n+d7wJ1GD6kG4ZHjRKnYW5VGYJvFORsi1Xf6DnmVGjIKJuPJib8EJ0SYlI34/rgkYym9mL2C+8szALTdYfq9ZD8bFMJfUFTJJ9SeWanZvT39fwagnWywsPHSNJQyJkcLm9Nuh0pMTwpOxtst66qLZD034MLRY/dGkNjTtpg4ak1aHHstgAFzG72Fnl0ryWSJ7yzC7FLytNz57Dpf0YxyZ7kr3SmOVGBMBCUTnYusr2Lv+J9aaywFMmll2jbBpmduQm6nd21KDzj3PPVHx2w==
Received: from MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:6e::9)
 by MA0PR01MB6245.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:78::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Thu, 20 Feb
 2025 23:35:58 +0000
Received: from MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6e06:bc2e:85c0:c2ee]) by MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6e06:bc2e:85c0:c2ee%2]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 23:35:58 +0000
Message-ID:
 <MA0PR01MB567180C0FE89E3BEBAF2B12EFEC42@MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM>
Date: Fri, 21 Feb 2025 07:35:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] gpio: spacemit: add support for K1 SoC
To: Bartosz Golaszewski <brgl@bgdev.pl>, Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>,
 devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Jesse Taube <mr.bossman075@gmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Inochi Amaoto <inochiama@outlook.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org
References: <20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org>
 <20250217-03-k1-gpio-v5-3-2863ec3e7b67@gentoo.org>
 <CAMRc=MdJszmZ8d1MGo=bfJ8TwqOYBPLe2Jfc9MfbErDUCMQktg@mail.gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <CAMRc=MdJszmZ8d1MGo=bfJ8TwqOYBPLe2Jfc9MfbErDUCMQktg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGAP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::32)
 To MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:6e::9)
X-Microsoft-Original-Message-ID:
 <13e71bf1-9339-4cc9-9d14-1878e114d68f@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0PR01MB5671:EE_|MA0PR01MB6245:EE_
X-MS-Office365-Filtering-Correlation-Id: adf6a0c9-06a0-47ed-9589-08dd520752f9
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|12121999004|6090799003|5072599009|19110799003|461199028|15080799006|7092599003|3412199025|4302099013|440099028|10035399004|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OXg5OFQ2N2VFRmg3NDY2NmlrQzA5OUtKd1lacmNuaE1pZHNvQVZDMExoNDln?=
 =?utf-8?B?azB3MDJDcFIzU1RzdTdUN1EvZ3l2c0lMWHRUenkvQVo1bmtXcUZBbzg5cDI2?=
 =?utf-8?B?ODlZVmRKT0RXa1A2SWQzVGpDZm1qdjY0QVFDRXp4TUVuVmorbVV6YVd4dm13?=
 =?utf-8?B?UFRGWXQrVlUwUmp0dW15aTU1RXBzNEpjdnptUlI1Y0IxTjFIblZnQ0ZZaSsz?=
 =?utf-8?B?VjNGQUZmaGdDZXpaNm9aYVRZMWErV2xORkM0TnF6S0FSeUFTaG5KOWRpUzBt?=
 =?utf-8?B?MTI5a0tkQ05wbXVZaHBLUTVTVFpDalg1bFdBWDJCK243U1Z1aTlPbzEwVVZz?=
 =?utf-8?B?cUxsY2RZRVdSdDZnTlNzZ2k4TDcxdWlOYTRxZE5sM2FadjBlcnZzdlRhelNq?=
 =?utf-8?B?TGh4SVRpemN5N1BjTCtrT0xnb2o4N3BMcTZ4VkJla0JScFU5bUxhdTZ0S010?=
 =?utf-8?B?MXc0QkpkZTN6L1FpSW9JeXI2cjRsTXhLOTA3NUNtL3dOdW40Z2h1UjBWZUNS?=
 =?utf-8?B?T3p2TDlJcldkdW1jK3ZGdzlPZWp6ektnb1ZHeFV3RnpwRXR0L3diS0w4ZlV2?=
 =?utf-8?B?S2NKcWp0Uk5tSmFsMlRqUUlJRjduOU5IR2VoK3ZYT2o3c0Q3RDVMeURtV0xL?=
 =?utf-8?B?WElFdU8rcW9vWGFjdktPbWo3M3UrN3J5Y04zNTB1S0VuN2lHTi9GUGl1bE9H?=
 =?utf-8?B?c1ZCRUxNZ21yNFAyS2lTK0EvOVdpSlhFNmRZdEt1WUp2NFF0RU1HMzNxSDFX?=
 =?utf-8?B?em1naXg0Q0F2K2FlaGRqVjVUNWxlTitWbjJnNS9MRWhjdGdnMDhhU1FTS2Ny?=
 =?utf-8?B?aGY3bjZCRnluWHhVb3FFSUdYNlYxcFF6ekp3RVpVQWcwY3JOUVZIWjNyRzVD?=
 =?utf-8?B?MWNIcjlrdkxya0xaanBnZmdrNVhnVnpua1VhK1YxajdqSFhhMkNWWGFoNkRK?=
 =?utf-8?B?TzhZdUpRK3pEdmhZQjNFV3FicUlmQU9NNHVtOFQ4KzA4Vkk1SERkcmRnZkJH?=
 =?utf-8?B?NkkzRHJLbUlVaTU3ckswM3Q0cFlEbGxWQXVjVW5qTi9UeVZJSFZRUWVoRjM0?=
 =?utf-8?B?aFVlN05aY09Fa1hxZ3lPMmhXSGZ1S3g5UnBQTzlGWjFTMzBDVnk1S3J4NlE3?=
 =?utf-8?B?RUxleWRXTGc3S1NXOU1zNFd4eWl5VmtKS25HalB4Vmc3TmZzYU1GVzV3cXh3?=
 =?utf-8?B?SkoxQUEwbG9EelAvUmJTVndlZEkzcXFUTDhXZjFCOXc4dUc1ayt1RFBVdGNP?=
 =?utf-8?B?Vm5PVHBwZmZsbC9nemtzZXFmb09qamJYYnV5b1BzMWhzcURXcWVld3hjL3FP?=
 =?utf-8?B?YjFldzB3Wi93Y0RaY211b25OSkVXcllWcTlhRTdncUZPN09NaENQZnVrZW1R?=
 =?utf-8?B?NXlRNkZOU1dKcXpKWHhadTZab0tIZzlwdXk0QkJWK0d6UXlvaXhndnhmTVd1?=
 =?utf-8?B?OE9PaGlEZHVZUlg5dHl1SFB4Q1FrRXY1a0dDZzRuc1E0T3FDWWRyOFRjT3ph?=
 =?utf-8?B?azFIM0dXTHNhL0syZzRobWs3Ny9mMXpKMUFtVlFtVG9yMUZPNXlodGxyeU1j?=
 =?utf-8?B?YVE1US9xMGdOTmlTS29Iall0OEpFN0kxOFIxaE5pNWRWaHM1L1M4dDdJS1dl?=
 =?utf-8?B?RDF6TXZVMjREYm9HZGhZZGNwQTNzaVdEeWplSnN5YjFZakNDc2RMaGI5a0V5?=
 =?utf-8?Q?E5II+Gwi+AJdSm0G2XIm?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVZMc3IvOU1NTnFFMlgyWWp0ME9TOVBHN0swTEg5c2NpNHB2TVhyZ0xxQVF2?=
 =?utf-8?B?VG0xVVNBb1lGTHBLbk0wK1ROelg4VVRTbEUvdFBpM2p1TjRCVEo2M0RCWVQx?=
 =?utf-8?B?eUw1bmR5UnIwalBhZUEyZC9wWUpKK2RnRzkyS0NPZGZlVVBOTU5LWXFDL1dj?=
 =?utf-8?B?TVROVDJzOWRvMlU5MExRemtwNmNRam9mVUYwSUVGMVhxVlNPaUtWeVlhVlBo?=
 =?utf-8?B?dEIyRzN6TlNES0NhbDVBcFhjMzJDT0xnSUhhOEdrd3RQajNJSjNuYzlUNndN?=
 =?utf-8?B?WjR2aXJjZGM4RjBwZ2t6SWYvcTVoNjVwd3VhQThVRW5aQ250N29ISW5XT0lm?=
 =?utf-8?B?YmJSVjZ1WStsZUNneUhJTmJIVHRtZW9uRmkzNUlFMG42NHhGVlg2SmtLRkZR?=
 =?utf-8?B?dzU4NTlrenNZRmhpZXAwL091ZXBvQ2N4QU8yR3EzQ0FEQTNKN1FPOWQzQkl3?=
 =?utf-8?B?bjRFcEdXZzZrZHFmUG54S04rejN0ZUhkUjVHbTdLbUxNQnMyYno5TTV2a3da?=
 =?utf-8?B?azYwdjRZQVdvb2RublBqK3UzdTBTMEJzLzI3S0l3Q3M1UEJ5bjROWmVXLzh6?=
 =?utf-8?B?VnpNTFRNS2diT1ZmVXcwYWdhay90TUMwcEhRb3M5VXhhblZYL3UyYTJUcHdC?=
 =?utf-8?B?bHVrSVZvVFErU0E1N1N2QmFEYkphZkkzYnNJbEdVWk1RVEgvbkMvSlNSM2pw?=
 =?utf-8?B?N1pYb05tSnVaOVZITDFwQmRVTWlybmlhNjNNT0RNNjdkZGl4OEJPREtUTGlu?=
 =?utf-8?B?V1NjdjFnYUpJdE9TaEpkdnk3NU5zZi93TC96TDZLYVA0SWhweDlyZHdORVE0?=
 =?utf-8?B?QUtHdzdPbkNqWlFqVThhR2RTSnVPNHg5d05pbHF4S1hVaG9ORk84UjVpTW5F?=
 =?utf-8?B?cnltdDI0RFJaK0VldDFQM3g1QWFXejZ6REcvb3pxMUJiV3RpSnlFN2NnNWZF?=
 =?utf-8?B?SXRURThpM0ttS24wSzBQc0ZkSUt2K1hkVExDdXgwdWl3NHRJME1LcDg5UHAr?=
 =?utf-8?B?Ylk2dTVaazlhakVhaU45cm9zbVk3aHRQNTNBWi9EdE9HUkRaQU82Tm12bWlG?=
 =?utf-8?B?V29VMnpraENmc3JFRko0amlTSjQyTjM0cDFwWC92Q1B0WXNOdVFwMXZCNmpD?=
 =?utf-8?B?QVJ3YjU3OFNnMTVnQVJDNk9vMVg0YlNmbGhFU0F1aEljeklTMHFmcmc1YUh2?=
 =?utf-8?B?emIzV25sV3Z4SGJ0bEI4dEZKK3dKQzBOYTRnaGhncGNKRnJuRUxiZHVjMVc1?=
 =?utf-8?B?M2NLaGpLNnNYRkZaUHJXSVdYYmFIZkJ0YStiRUU1VlFNM01tbmhIVVZybG5V?=
 =?utf-8?B?SXRycXB3NG9oU2k3cnlyVTFhV3RHd2lHY1Q0Vkh0UThOMDJveDVTUFhkcXpo?=
 =?utf-8?B?dzVzRXh0SzFzQm16M1hRcU5EcTlGNUZ2NEVDektCWnB0VEZMa2RCZUZRSUpz?=
 =?utf-8?B?NmlVYU5DamNHVGJEV3NTUjgrQURCcjJnalo0ektpMEtTRUtaUXRJenVPNmR3?=
 =?utf-8?B?aFZ3ZUU4Rkw1aEN5K1NaSGRiU0NzaWUvUzU0bmRtSTJzTUxiTmllNUF2ODBB?=
 =?utf-8?B?MWY2SHZFamo3SDRLeTZ5eGJzcURGNGR5RzQ0YWZ6NFdaQUc1aVM0OUxrekhx?=
 =?utf-8?B?bS84b001V2tzekVlZmlmMi8vYVJPd0tDOHNYTU1LQkpxellCUXpBRWY5N0h4?=
 =?utf-8?B?bzkyT1V1QTdOZm5NZFY1c1h5QjZ1VGVFbFdXUzNRZ3p6TXptYU14MHc3VzlU?=
 =?utf-8?Q?1MFK3bWl8ITH+yvDEXkn8ULNnkNIT2EsqNmqhZ2?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adf6a0c9-06a0-47ed-9589-08dd520752f9
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 23:35:57.0430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB6245


On 2025/2/20 21:34, Bartosz Golaszewski wrote:
> On Mon, Feb 17, 2025 at 1:58 PM Yixun Lan <dlan@gentoo.org> wrote:
[......]
>> +#define to_spacemit_gpio_bank(x) container_of((x), struct spacemit_gpio_bank, gc)
>> +
>> +struct spacemit_gpio;
>> +
>> +struct spacemit_gpio_bank {
>> +       struct gpio_chip                gc;
>> +       struct spacemit_gpio            *sg;
>> +       void __iomem                    *base;
>> +       u32                             index;
>> +       u32                             irq_mask;
>> +       u32                             irq_rising_edge;
>> +       u32                             irq_falling_edge;
>> +};
>> +
>> +struct spacemit_gpio {
>> +       struct  device                  *dev;
>> +       struct  spacemit_gpio_bank      sgb[NR_BANKS];
>> +};
> Please don't use tabs in struct definitions.

Why not？I see 
https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#struct-declarations-and-initializers

[......]


> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

