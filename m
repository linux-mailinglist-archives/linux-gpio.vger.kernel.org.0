Return-Path: <linux-gpio+bounces-12489-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F294D9BAA91
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 02:52:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7897A2816CF
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 01:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B87FF14E2F5;
	Mon,  4 Nov 2024 01:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="uD6eu8gr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01olkn2055.outbound.protection.outlook.com [40.92.102.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDFE3214;
	Mon,  4 Nov 2024 01:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.102.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730685156; cv=fail; b=VADqlPeMarsTAy9aiWWk8W1pSS+r/78mZf1gNUtwX94AhiG7H+6IBjGlfP2vnr8gPQBZAU5+H/stk9JVD/c/Wuwlz2OoxZ1+XS8YsKhitgaGmVwxoyXp53C4EcanTp20HrA0vduEFd0B+yp/eMBgR/l3gz/bf5sah0b9Rlal1GU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730685156; c=relaxed/simple;
	bh=5+zl9DdtTVHMK8xzAJekkshdnMUNt9ouWHNi5QdTy70=;
	h=Message-ID:Date:Subject:To:References:Cc:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IBSGJP3Hduovg59plAI+wrWdV1H2so/0DpDNUx/Des8oYftAzcE76dE34fjZ6xsxRxZkOjEc/QZM0MduyyASQAoFPd87q+7+RIXFYit+bA0UvzDSfTyk072fI+hyn67caUzeH3ERch+lxmDHSQEkR5MkcDu8V97FQVIBSGSlffk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=uD6eu8gr; arc=fail smtp.client-ip=40.92.102.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fQnBfYAajEorqceASbLvdYTAq9aHrpp1rGFLme1/LQQc/RiI14phylO64UAEpCIaltLRnVZPMwxY0LFanWJqeeHTZ2yf3l3Im0Z4fySvqh9P1xiSgszzl+5CH/IFycAE32w0ENCToEOJAjhvALucmqofHmEasOYtnbdzaCFsbxjhHE2uur+yjDxR20O3vukO8SOcAllwi5BR5rUbK1xL0QrJvzf/z1Fd4xH/ghMxuDXlMhkdbf/bK510o1/8vLGYEYjue/LLOBFyv6ZrZEG24UnDBQeAPUSxb3pIc6nYYfi1cq8VUOR1ooOiXPIwqnLfT5eiSLsZ94bhXv3FRmuetA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ribg8ry+qlez4CGBoS4CvJ3yp6GR4Fl4+l6MU7LLFQ=;
 b=ZwvLitvQ6akVOPyxNM+Y7zW6lF8hj4BvdE8ug96jV6MNtD4Fv2wGKkiDEgONWRjLfQa5O1yYDC+u+MtYnsuEDoOoBFgaXj/VmzxHhmvSgTC3kGRuJhmAbjYrxC4lpw9QSpOvX2f6LcyInRabeGf04nSO6JC+nuk9tZdokERUDc4piY7ddtKHnbX2AxRg0gIy/diVf1tfi7h3yH1ucAU5yFiLE4RXm2leGAWbdV2K8vcRhoSUPLq9dYRU12d3EKSuvW5zDR1mPrpQSM7CGGQsd6+L4mEAlo3S1IwRTVrHKxbIHzrAixjxHo2oaQ9r9icOHf33SeH0sEi1UiTThvELXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ribg8ry+qlez4CGBoS4CvJ3yp6GR4Fl4+l6MU7LLFQ=;
 b=uD6eu8gr96V6bdvQUJE56OShfvczd8o6BV7wHUE26QTUG1iLNh7xk6yP1/o4jxEAKw1wBxRkGYbxLgc1N4FTvIWw7E1KXNpp41KF0YAtved1xjfXkVkJBTIZhMcUQtM833Z7tGgez5Ci7EuugqxbSgm05NTTRalEMFmhUIeLV5vEoEodVntwkSVNg2w4Jq8PTK/dUJ5wMbfP45hQy/x3Uy7C4Nsu1ECytn34UnuT/Tk19KkZYX7Ox8kd7Wj2dbQN/Rm+d6PI4sGxrw2DqGOrqlEFRwlDS8iu5KWxF3NPw08PXArmR7ZbE/mx9fuOrksT/YPDOxyrUViIEUxwnfn4mQ==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN2P287MB0456.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:119::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 01:52:29 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%3]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 01:52:29 +0000
Message-ID:
 <MA0P287MB282298E7A00528040BBEC5DEFE512@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Mon, 4 Nov 2024 09:52:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: pinctrl: correct typo of description for
 cv1800
To: linus.walleij@linaro.org
References: <20241029012312.3448287-1-unicornxw@gmail.com>
Cc: Chen Wang <unicornxw@gmail.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, inochiama@outlook.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20241029012312.3448287-1-unicornxw@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYAPR01CA0181.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::25) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID:
 <61187d45-204b-4a82-ab1a-0bf2eb7e5a9c@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN2P287MB0456:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b4bc81d-fb68-49d6-5ca9-08dcfc735559
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|7092599003|15080799006|8022599003|8060799006|19110799003|5072599009|6090799003|461199028|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YVB6RXJiZUg5cExhU0ZWL0l5cDV0OExPbk1GN3YvWWJ5dXQyZ21venArL2Vt?=
 =?utf-8?B?ais1UUxwYTl3QTJrZDR0QjM0bUdMMEVZYlRqbHVuejhhSUQ1VTQ5Zm1pR3da?=
 =?utf-8?B?R0pBY2VRVUF5U2p3Ti9VTHZZa1ZqWm9FbU1XNGhld2pjTHp2VksxbXJWRHcz?=
 =?utf-8?B?cEZEeXlySDNWeUlLc2JVT0VkSEJ6Z0ZSeHgvMVRSVjlFMkpHWVJtRXdyQU5a?=
 =?utf-8?B?Y1B0MzhXU0JwZUt0U2lyQnRJN0VwKyt6dVJ4akpGM0pSNmZIRWF4VHJWN1Y0?=
 =?utf-8?B?S25QQWl4aXJhdDE0NHFvbUNkSUoxYW1zcTlBT3l3K1RGTU9zOXloSmw5a1d6?=
 =?utf-8?B?VkxSbGZDU05OdDFKbTRaNTF5amtKSENaL2xqbDVxaXRhZFhVSnhpa0hOSkhY?=
 =?utf-8?B?NkkzTUFZNkZaYUZJZ1dxSVVpYkFNMG4rdlBqd2VaUWt3cG9rT1kzc0pxSzBC?=
 =?utf-8?B?dnh6R2ZaY0JqRDJleFFoQ0hDMDUwNWV3Wjh5Z1UvbGdzTmJrVVhQRHUraHJJ?=
 =?utf-8?B?UUFSRENVMExWc1Fidzk2YnhuZkkwbTllbzhDK1BabW82SzJzKzB3V0R5V25F?=
 =?utf-8?B?NlVPYzY3dU50dUJVMjJ1YUxZdWNzS2grT1FyRTFEMURJYkYxeDBVQ25jYUpl?=
 =?utf-8?B?bUk3RDNKdmhoOE1BUEVlV1BEeFNWckpSQmx6NDZMYlExTDZLNnVlL0pSMU5z?=
 =?utf-8?B?WlQ5YnFhS0ZTWkFHRWF2S1FuSWVLWk01Y1RDTVNyWHc0Vk84Y1MyT0FLQVVz?=
 =?utf-8?B?dStHajRCcWhjNnZVV2NVMlFjdGtVZzJCeER3M0E1aDA2UGF2ekhYa1diZnVq?=
 =?utf-8?B?TVphdzBqR0VudHU2SGxvSEczNnRuVnRiM0RDUmUzdXh6OE5yWTl0Qm5IeTh2?=
 =?utf-8?B?WG5Dczd1blM3ZDJsSDlseDVUdlViUHhtd3lRVzRla2V3Skw0ZDk2ejRlaFB4?=
 =?utf-8?B?dUtsRStTVDlZeHZZVlVLLzY1a1NMT2RPbitUYWpVNFpJak02Q0FjN2JLcmRu?=
 =?utf-8?B?SkpuZG9iUjYvc2Q1RzZiR3c4VE56WmdLbjJNdVVhbzNtSkVmNnhwMWthRG1j?=
 =?utf-8?B?b2taMVRvaWRZVGRtVVlUazcvZklEU3lHMlhDMC8rRWg1QzduQUlOWmlDYlYw?=
 =?utf-8?B?M0VVRkJwUmpZUmxGaG5jbERDQW1MQjdCa2lid21YTUZIa0JxWHhseTdjKysw?=
 =?utf-8?B?TU5qS2FQWmtZYTNCQ1dsWU5pZ0o3bzZBdURLa1U5VkR0RFZiNkJJTG8wdk9T?=
 =?utf-8?B?Q3BWRFUzZGR6VHJEUHVWU3JDQXNzMjdkcUJuOEZpQnpOdXJCa2l4WFVERnBh?=
 =?utf-8?B?YXRDalIzNEZKaUFrVWg3OEI2b0xGV0VxSzUxTHBad2ZhendEK055QkJCOE04?=
 =?utf-8?B?M3l5bEk2L1R0dXQ2REIyWXJIWCs0OHgzbTlCbC9WcXhGVWhFQlBET1k4N0lq?=
 =?utf-8?B?OENBMUl3aFI1VHdVTWhzOU1USURMYTNRbzZCQVh4WktIdmkxTUQ2akZnRkRS?=
 =?utf-8?Q?/Rw0V8=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWlkdGE4SElWY05rc2JPUUR6VnRNRzFGbVBvSGVxVXphOXRVMldMbWlZajAz?=
 =?utf-8?B?bm1LNXVScmJSWE9DY1FJNEw2dExSeGhmLzI2bDlHRVRJREVUVms1dVpxVHBI?=
 =?utf-8?B?L09zdE9Ua2UzWUNCdUdjSTJhRzhoUGgzQkcrblkwdmYxU0hvM3VxUnIybEZT?=
 =?utf-8?B?YkJMQVJGSnlpejlyRk9mclFNNlpEbzFhNXhEWjRuaGptOUwrdHF2QTV0Q25W?=
 =?utf-8?B?Tk1ZVXUxaDBhUFBBdVRrVXdSNGpNbUxVSGxDazBST0xGNVVEWHJGZmY1SkVr?=
 =?utf-8?B?TXc0QXZYVjJ3RnJJcnVoYm9FQWt6YVBOMWtNTnVmM1Y2TVVTVUpDTjZmNHZa?=
 =?utf-8?B?ZloxMkpnUGgzUEFNMHpzeUUxK2ZtK1NCbmIxOUxhRndvajVIMnd6UVpiaWhl?=
 =?utf-8?B?dkh2VXdBcFYyYUQzSGkyd3J3bmk2aWo0Vml4MjZLWWduWG1ZdHdjWjNhS3lU?=
 =?utf-8?B?aEVneE1kbG1YREhKVFpFOE8yM0JXQ0lwa2hSWGhZeTBGa3ZxRk8xYnUwdUpW?=
 =?utf-8?B?QmpNOGJiS0k4RHRKMVY0NE5zdFlNbEhwbXB1UE56dlVjaW5RakhnRFRHTGNs?=
 =?utf-8?B?aXhMaHZ1VmlFN29jaVNIOWpkOGVrUi9ORU50R3RNWXQvSmRVUStHVjJFQmVH?=
 =?utf-8?B?c041clZoOWxoZlZ3RXcrb2xGVTBWZkFTK1dkblNNVXNzWlJhTE9Eb0FZNnhs?=
 =?utf-8?B?dS9ya3pjTjM3TFNXY2FPZC93VVNGc3M4N3paYytZMmhMQW9tRlBRNXFzMit3?=
 =?utf-8?B?WWVoNU9tN1R0QWJ2cFRNZi9MdDc2c0Zuc3pFRzRNd09EWXhjeTJhMGpNck1q?=
 =?utf-8?B?Y1NGS0lDZGRHZ3FFdlZjRXFUZVhSTkwrUk9FN20xcTBqYXpyWTFMNzdzOHFX?=
 =?utf-8?B?OEJEWUY5cG4wbGYzb0MzZ1ZtZTdsVFovSE85Y0JwWnJuVHVaYUlFU2pKQ09h?=
 =?utf-8?B?dnk1QWhjU2hvM0Z6Z0RsVWZleTJEWi9ackhzWWQ3T3RtbUYxNEtCb1hEdHBQ?=
 =?utf-8?B?UlRtSVdsVy9UY1haOVkwSSs0ejBtc0F3UUVrcXNmdjRPc0VJU0tTdDh3VmVV?=
 =?utf-8?B?R3NSbmx6TVZtbDVtUEcxNDk5dVArTkNMY0Rhcno0NldNOUJzNllwYTdjYVZH?=
 =?utf-8?B?a3JnNnlRajZzem1EL05sRUdVeHBwSlpIWUdWWHo2RGJGa05LenJvblFLbjdC?=
 =?utf-8?B?Q2c2UlZuN2JTY2ZLc0NDMXJpUUlsajlhajlFRjNYaXljWm1JNGdkNTI0bVVI?=
 =?utf-8?B?YmxhbzNWUG9vRjA3ZEJmTlhaTW8zeEhiOURpeU5hSkk1Y1JyTFZaTmtLZUFn?=
 =?utf-8?B?QW5vYmg5ODZ5NS85cFdyNis2eXZGUkdxaFhsQ05ZUHZaQll6WDdINTBrME5K?=
 =?utf-8?B?VmVUMGY1RHBDTUU3UWNzYkxYckRKSVl0c1oya2o3VHRGaElvc2cyZllRaTZ0?=
 =?utf-8?B?aVBTRTJTM3lrSFpSR1RlQnBjdXU1VXdiU3c2ZUhTbXBPNElpdzFqY0M2OHRl?=
 =?utf-8?B?VFpWRzhnOW5Sa1NKdWhDQXdkT0dmL3VpWTlrOWZZWkZ3UUpWU0doREhNbFA3?=
 =?utf-8?B?eUdSaXI0NmE2aGM2a1R1R0ZPWTY0R09TS2ZXbS9iS01hNC9ydzAwYndzVUFo?=
 =?utf-8?B?UjZ1NGhDTENvTXo5WDQ4cC9SV2ZaK3NFRjN6Rmg4c3N0M1gyZGJxK2RzeXlF?=
 =?utf-8?Q?xstAbf44xgh/gB7dcXhO?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b4bc81d-fb68-49d6-5ca9-08dcfc735559
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 01:52:28.0853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0456

Hi, Linus Walleij,

Will you pick this fixes and PR for 6.12?

Or I will take this over and PR this for 6.13 due to it is a minor text 
change.

Thanks,

Chen

On 2024/10/29 9:23, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
>
> It should be PINMUX/PINMUX2, not GPIOMUX/GPIOMUX2, see
> <dt-bindings/pinctrl/pinctrl-cv1800b.h>.
>
> Fixes: 64aa494de6fa ("dt-bindings: pinctrl: Add pinctrl for Sophgo CV1800 series SoC.")
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>   .../devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml      | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
> index 1e6a55afe26a..feb4785a3fac 100644
> --- a/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
> @@ -58,7 +58,7 @@ patternProperties:
>             pinmux:
>               description: |
>                 The list of GPIOs and their mux settings that properties in the
> -              node apply to. This should be set using the GPIOMUX or GPIOMUX2
> +              node apply to. This should be set using the PINMUX or PINMUX2
>                 macro.
>   
>             bias-pull-up:
>
> base-commit: 81983758430957d9a5cb3333fe324fd70cf63e7e

