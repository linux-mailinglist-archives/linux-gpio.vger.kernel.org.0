Return-Path: <linux-gpio+bounces-28090-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D3921C34E28
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 10:37:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 946E04FDF04
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 09:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67B9C3093BD;
	Wed,  5 Nov 2025 09:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="c7TTK7uV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021143.outbound.protection.outlook.com [52.101.70.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E5B3081AF;
	Wed,  5 Nov 2025 09:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762335085; cv=fail; b=AuK0Qi+HmTh0nvz9u9HnoFQoAsn3oFenZk+O7pu4TlGlMGWNN67oA6tD3lXXynODhvOsNenPazBXT6vCSiIet6yfxReLmdGwz6BUF9y+zRHNfzAmjK+x5U3JdL9SuitHcTBY6CTX8gdy4q1cPkki/75Sbmd4qWCu7zAIIYP3ewI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762335085; c=relaxed/simple;
	bh=+lEgKwfA0joXXLbrsqNIQbtxPv42WOqbwZRuB6H7xqw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=q6WTd769pI5wtUr1gmP459ikic4jumIUauXD14HuYWdEImXc2IgUfwQZkHyQUowPhkx4pHZFxbJIxABP6s3JurswKlnRc1U3CslALnmnpb9djXth5xtn/czm8X108OUmgT+Lr7fY4AwGIQ13o/a8fzcv8qVzFDr7sr3Ucknf0g0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axentia.se; spf=pass smtp.mailfrom=axentia.se; dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b=c7TTK7uV; arc=fail smtp.client-ip=52.101.70.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axentia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axentia.se
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lFnjINIBk9JiLxkVHwn/pmAQw4TxFaJ1LpJ8VyOy6/z4Y6EgoDY/YS9Vu2Liu+Axx0spO7NEMhpIt+3pbQIH6bWL+jj2/xPou280HaLwhXy1DaPb+bR1JdJOWM+rybpqlXfd/gMtZqHhSonRTvizJnL3tLCFT83ui1XIdsYgCpn54k9uvWCIV37bAd02tZIJGEgD+C0Dhm9LGmuN0aAl2uqMe8H6CoW47lcfpgrOYjDPmRnA17+jZIrzwfXMyBjd5Yvpsm1LFhC0/3ZGML2f+Gz83WebreUNSCRmobI+lF8d81rnkWHf+riQDU51qq0n+GL2JrcRagcQMLQxI9puEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Br7Y2JKkx43eY7KyowQeN/979Vlyyo/PdA3nhTWwN3U=;
 b=KcdNGMo85OL9wfUUQ+y58NNlQrK7l7HKpDPBiEHp2ptoEu9D+cizBm90P6ddvLBXjxbYkeBnbQYA7OJEuI5ge+WWCmEdiU8acnfb+0G3Y8mw5quZNOiF/Fs3XLX7l6eKH35b/mcAZve6WGRi8Zhdyw8lTCw3u9t2POFDkJ29hKZpgGfZ6765SGxbbRyPIkJOw8YM885qWLOD4PxNUUW5BwfWP+uOBLEd0rr5KVsTicoDupixogTMtEXU7ov0tyNb+klqwoCj5pksIVgcKfFLpYX2OwkAH2J7tKZN6/aSD3WAPySg4AGPp9aw7O1I03356jqIhFqsXIiZeDEoZbdphg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Br7Y2JKkx43eY7KyowQeN/979Vlyyo/PdA3nhTWwN3U=;
 b=c7TTK7uVAHQvVQ+1IKnc1TRLueuF3YQYi68yjsGX84dn72HMgKrTkcGkb8oW4+EXwZyHpkiiFMHQy6JeAW/5Gw3THW4c6jy1zZxXcssZ2msKTS01cGoGg0SLrZzyMnENwOi6Yrh0VH2sAR+Almq+DjB4Y7SM/s+i1uMIDCh9Kkw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AS8PR02MB9235.eurprd02.prod.outlook.com (2603:10a6:20b:5c1::5)
 by DU0PR02MB8316.eurprd02.prod.outlook.com (2603:10a6:10:3bc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 09:31:15 +0000
Received: from AS8PR02MB9235.eurprd02.prod.outlook.com
 ([fe80::32a9:a9e6:ded:5714]) by AS8PR02MB9235.eurprd02.prod.outlook.com
 ([fe80::32a9:a9e6:ded:5714%5]) with mapi id 15.20.9298.006; Wed, 5 Nov 2025
 09:31:15 +0000
Message-ID: <717fd31b-94b6-c873-c829-ba6c859277e7@axentia.se>
Date: Wed, 5 Nov 2025 10:31:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 2/2] gpio: add gpio-line-mux driver
Content-Language: sv-SE
To: Jonas Jelonek <jelonek.jonas@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Richard <thomas.richard@bootlin.com>
References: <20251104210021.247476-1-jelonek.jonas@gmail.com>
 <20251104210021.247476-3-jelonek.jonas@gmail.com>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <20251104210021.247476-3-jelonek.jonas@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3PEPF00002E47.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::15) To AS8PR02MB9235.eurprd02.prod.outlook.com
 (2603:10a6:20b:5c1::5)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR02MB9235:EE_|DU0PR02MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: d6469503-6158-49e2-2687-08de1c4e10d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bkdsTWdGZVo2d2lEUC9pRjlJUmpnNzFTVnE2cWFyTHJoSkJNVlRxZVBrU1dm?=
 =?utf-8?B?aU1Cc2hJbDdmSzR2T2NZT3VSR0FGako5TlhHNWtkRE1xNmVza0pFMDM1ZEh0?=
 =?utf-8?B?clEycDVFQXR4Y09mTENla2FiOHpReGJXMlV1TkhtcEZQYXJsV0JYU3lkWEtK?=
 =?utf-8?B?Tm4xWE1sbk4zTlEyTEhaQXhSK2ZyQ3RxaUdRU3RGY1ZiQTBEUDkrY25rTzND?=
 =?utf-8?B?eCtwRkp2ZlJWUEY3MUdmQ2NOKzFXYlM1MFU4b1VYcHNmcjNNNXJxYm1KV3Bs?=
 =?utf-8?B?aWY5Yk80TkJyYXBlTmJVRW55dVMyV1IvYzZCN21xZ3MrOGJ3bVpnL0hQc0pJ?=
 =?utf-8?B?ZW1HSWFTZFdML1RLL2t2eGlTa0c4YjQ3dzRZRjFjMk1aa3R6V3paWVpESWF2?=
 =?utf-8?B?eExwSzlGeE1XdmRIS1FKY2hHSXp6OTRCRk8wV0U0SE1YMDh0V3Z6aXdPWjJR?=
 =?utf-8?B?Umk5WmphTU52dXM2WUJDSlpMczArUG94dWliSHFRZ2dFTmdXUDE2OUM4Z3BT?=
 =?utf-8?B?SlZzcFIyS04vdGM2dUhwQTFISjFseU1JSHZJblVjcDlDTjIwRmk2YVRweEQw?=
 =?utf-8?B?R0xSNjY4a0Q3UkV4YlRGNkRtbDJlVWwrK3pjODRrMXY3MzdRaG5oVjdYRnFi?=
 =?utf-8?B?RW9QL2ovaWFvZ3ROMjBDSzJQQW9BR1E5WXhWU3QwbHVySERxeTNHdTVzZ3dG?=
 =?utf-8?B?Q0FDOGN3TkZ3QzVoYytMZ1ZPZzA4ZnRKOWVBVDNFYVlyaFpVZUtoeUtRRkFL?=
 =?utf-8?B?RW9FSDRXRXUrN08rUWJjaWQ5c08yeHBnaDh5cllpdGlhQk5zWkluODZpNk5s?=
 =?utf-8?B?alBBQWJKenFKZ2I2RGFENEtQSWMzRmQ4MkFwZlFXUGJEcjNpcXhvejQzMEJD?=
 =?utf-8?B?ZTBuSmxRa1NIczgzSTJoamtpTlBkdkhVY0wyV1Rpd00vQmhBbFFDaHc0ZUd2?=
 =?utf-8?B?RC90RWs1UitCRUYySkozYzJkWG5jVFY5T2ZFNzFGbXoybytWKzV6ekF3SHpt?=
 =?utf-8?B?YjRNSUd5TWVWRldVdkpHZWtENEUvZlpzakY0M1FybEpCa3A0QzdkWWprZzYr?=
 =?utf-8?B?bjNEb2ZWWXhjMVlTUFdVSlEzRS9kZng0aXExUGJEZDYwUDJzbWpOT3RzdmJY?=
 =?utf-8?B?d2dQTUpXTzkzM25ZcG1rd3VZRkVESkQzaW9Qd1BhdE9hRFluKzlYWVZLaW04?=
 =?utf-8?B?R1EyZmplTmJkU3dIWVE3SDAweHZDTVBRaS9MMzhjUjg4MkhvQU9lL1VHSy9Z?=
 =?utf-8?B?d0NialVVUEdnNVRCRE9LVENvdUlOcU5hV1BNY0hHd1Q0VmZlOHhsWE9GakFN?=
 =?utf-8?B?OGNFcW9iNzEyVml4VXlyUkpKYzhqZHB6NklRRWtubEpjeE1iUWw2Q3EwV3Zt?=
 =?utf-8?B?dW5xNW9zcGUraTVVM3liVE5EdmZRdDhhbEcwYzhjVzc5d2t5M0ZGRGhhVUw1?=
 =?utf-8?B?aCtwQ0lsT0U2akRhenliSHVOMXhZeU1MMHFzU2VWbGx4bVl0MHNLenA1Z01k?=
 =?utf-8?B?M2Z5TkErVEZJczdrekdMMG9Tajh4aUtjU25ZVkY2SSt4SkVMZlN6eVRGZ2dB?=
 =?utf-8?B?OG4zbkpmWG9VOG1QSlJuQ05ZcW0zS3VtSGVSWGNkSlF3OFdKaU5CREJrL3ds?=
 =?utf-8?B?aFlzbmEzekU0Ky9yYkp1c2Z6aVFBOUpDNzgxMWkxOEFWZWJ3YjBUMWJhTFo1?=
 =?utf-8?B?am9VdHY2OVBaaUhjeUllNnhka1ZneTROWFNOdWhINzdQUUNZVEd1U2doSXdt?=
 =?utf-8?B?dzE5RUlMcmtzOVZDMHRHY04rVHUrbEVxZkovTmgzZzQxTEtZYzJ0NFI2NTV3?=
 =?utf-8?B?RzJHUithTWNDUVFXQkJpaFk0MzVwSGJOMzlmQkw2UThsK3YyL1dTajljb2tn?=
 =?utf-8?B?ak9UT1BoS2NZcUZ3WDVESXgvZXpTZFV1cWt6TXF4VE0vUFkvd1RoNXNJSzd5?=
 =?utf-8?Q?6Ev32ZO5RaulTBrK7o6kz+2Svq5XVK3p?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB9235.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlJZT0JkWGV3dERuZGl4dE9jWjVvaUdkempyYkJkOXE0OHR5K1ZZZzJSSmhU?=
 =?utf-8?B?ZlJyU0szVHJTR0V0MjRoQ0VWVjlsMEY1NE1oVUZzVkFDaGZxWXkxblF3Wm5n?=
 =?utf-8?B?QWgrTFo3eWN1NmdNdDc4VzNZQ3c0bzNsKzFOa0w2RHlSQk5SYTJ2VTNDQVph?=
 =?utf-8?B?dFlqaEpsaHhrdGhJa1k3cTR0NnpFcG1SdnlFKzlXNnhlOSs5TzNPb1BKYllk?=
 =?utf-8?B?M2ptM25SWW1sVkl6c0QzT3RSbHdhTDNKd0tKM3BlVFlmdFFFdVpRRFhPZXky?=
 =?utf-8?B?M0pyRG5xMFFZNDBOeGlNQ0pzU09ycmhMQU1xWk5uTUFkbkFIblFiWGdRY2hW?=
 =?utf-8?B?clcyTG1Zbng3bFllWFJyb3U1dW81UXo3V1NzeGRnSXRWQzdzeFlRa2l0RExB?=
 =?utf-8?B?WnM5bDdHWCs4OTM1QVNFMGtwWmNvOHdoQlIzcHhwZHdhWklTV0NvSFVkQzR2?=
 =?utf-8?B?ZDZwVzZrbDBEVUFCR3poSDR6bnNoNkJFY0pXRzhxL1hDYTJWcDdYVUNmL2RJ?=
 =?utf-8?B?Wk1uWXRBblMzMUFKaUhlbk8zdjh4RkdmTTYrUnErZENRREhCOForNU5vVW5o?=
 =?utf-8?B?Y1IwbkdLTDhpTE9xWmZTa2tIRkdVVzBNQ2x5NEh4M1pMZGRiRW9XSk1yWnZn?=
 =?utf-8?B?ZUtXeHE4YnJTNzVhcjhVTjJON3VVZW4wcGwzcTV0YUY2M2RuMnhodzVGVzd5?=
 =?utf-8?B?UlBHTWVKK0t6NXA3Uk5OUXlOWWkvY2FrQlUzMFIxL2YvZmF5TmJCTG0rc25Q?=
 =?utf-8?B?dXdEWEF0M2Z2SlppdHdEbHovb2NZYmlFWmxGTld2ZkRDdHZrYmVaU0dKY0Zv?=
 =?utf-8?B?S0JucXVYTVNYRWhZVExiS3psOElKK1o3Sy9WeWJWTENRb3RwM1ZLa0VqWFpV?=
 =?utf-8?B?YlpaVzFGbUs2U0ZuYkZvUzFZS3pSbFlSTitMRWIyYXJUM1ErT3pOOTN1MnFX?=
 =?utf-8?B?Ymo4cCtSR2NzL2xtYW9KdE9jWWQ2Z1AvM244U2FxekI3Um0ySjc3dXhjSHZH?=
 =?utf-8?B?bEc2R3VCelZacGtlWGJMc2tDMllJSStJaW5NeGs1NzFaT2FHSjhldnZHb0Rl?=
 =?utf-8?B?WmlhNktMakorWTRtcjhreXk3c0dSTWVqK2d6WDFBZERWQzJZNEx0Q1NXa3ZQ?=
 =?utf-8?B?U21MOXRCVVp3ZXYxZXRVYTcxWEUxZld0MnVuUTh0d05LRDBGVWRaUDg2R0FB?=
 =?utf-8?B?b1g1VC9iY2FRYzJBN0lLMm9VRG5xdmFPRGRVbmVtRFhMcVBOdGM4cjJOMlVv?=
 =?utf-8?B?d2ljYnlKb3o0bXMwSGdVVkdWcHkrdStYWXdXeS9zSlNkR0xZUVpRdjdST21W?=
 =?utf-8?B?NmFFMHJtTnhWclFxT1dKbVJhUjNsTUMxZjJvMGdQZTd6T2c4TTI1UFdKUjJ0?=
 =?utf-8?B?YU54YUUyM1l5TVpkUlNoNjRMWjVvSkFocXh6ZW5nMFFsS0JFVFRpeXc5ZlVY?=
 =?utf-8?B?UnB4b1NZY2FsZWpEQ0VPV0NmVTBkTGUyd2tXVUJtWU4zSUJMVkRqTnFyUDYw?=
 =?utf-8?B?QmY5c1J0U0dOWVdaelFMZnhIQjNjVVoxZDFEc3Azc3cyanlUOVN5OHZaZ1Vs?=
 =?utf-8?B?QzhzM205LzRiZUl3Zk9YZzlPaVJ0YlUrdmFxMlVEOEo4TTRnakMzSzNLc0hy?=
 =?utf-8?B?ZExETDhhTUNwazVCZ1VhNUYraXVlWi9jZ0hFRTZLK0FDNlkvMlBXNXhrY3Zl?=
 =?utf-8?B?b21GMDlSV2JaZm50ZDZidThzbDBYUXJLVUJkbWJNRmhLY3pKVTRnNnpROTRV?=
 =?utf-8?B?MjhLZUI3eUx6VzcvNm1HcXVyV3ExQ1dPOEczV3Q2Z2IzYkdqeVlEbDY0YS8z?=
 =?utf-8?B?TEptb0c4d29zQnlGWlhiRFhzbU1DTEVtaFd6bVlwSHArUnBrSHRYdGNNYmNW?=
 =?utf-8?B?L3NHMjVpeHEwTFp2aHJkUG1Mc0IzOHBqdk5vMExvd1QxeXZhUVRkSmoyc3Zq?=
 =?utf-8?B?eERKU0tQOXZ5cEJDdi8wRXE0SnFXcEVjNW1YRm1ZRDdmUUdtTHhkaGtkNHFw?=
 =?utf-8?B?dzRtUnVjcEFWNUNxTWN0RVp5Y0J4ZTlDZHhXK1FvUnBzc3ZlNStQR0hOaFZG?=
 =?utf-8?B?ZS9sejVUNGVVMzdCcjJhMnhGU2VraTZidzZCVG9yL2NEQ1R4am1mc1lFMzRi?=
 =?utf-8?Q?O8YbOpRbaMPhPkq8X7Pl2BJqm?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: d6469503-6158-49e2-2687-08de1c4e10d8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB9235.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 09:31:15.3470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8mrhuN3+OiJkpHyxf8yEQQ/ndySh1v1sCN44QYtthx9K9GvJ5S304WrHqcSJWKON
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB8316

Hi!

2025-11-04 at 22:00, Jonas Jelonek wrote:
> Add a new driver which provides a 1-to-many mapping for a single real
> GPIO using a multiplexer. Each virtual GPIO corresponds to a multiplexer
> state which, if set for the multiplexer, connects the real GPIO to the
> corresponding virtual GPIO.
> 
> This can help in various usecases. One practical case is the special
> hardware design of the Realtek-based XS1930-10 switch from Zyxel. It
> features two SFP+ ports/cages whose signals are wired to directly to the

wired directly

> switch SoC. Although Realtek SoCs are short on GPIOs, there are usually
> enough the fit the SFP signals without any hacks.
> 
> However, Zyxel did some weird design and connected RX_LOS, MOD_ABS and
> TX_FAULT of one SFP cage onto a single GPIO line controlled by a
> multiplexer (the same for the other SFP cage). The single multiplexer
> controls the lines for both SFP and depending on the state, the
> designated 'signal GPIO lines' are connected to one of the three SFP
> signals.
> 
> Because the SFP core/driver doesn't support multiplexer but needs single
> GPIOs for each of the signals, this driver fills the gap between both.
> It registers a gpio_chip, provides multiple virtual GPIOs and sets the
> backing multiplexer accordingly.
> 
> Due to several practical issues, this is input-only and doesn't support
> IRQs.
> 
> Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>

*snip*

> diff --git a/drivers/gpio/gpio-line-mux.c b/drivers/gpio/gpio-line-mux.c
> new file mode 100644
> index 000000000000..3a9fe899c041
> --- /dev/null
> +++ b/drivers/gpio/gpio-line-mux.c
> @@ -0,0 +1,137 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * GPIO line mux which acts as virtual gpiochip and provides a 1-to-many
> + * mapping between virtual GPIOs and a real GPIO + multiplexer.
> + *
> + * Copyright (c) 2025 Jonas Jelonek <jelonek.jonas@gmail.com>
> + */
> +
> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/mutex.h>
> +#include <linux/mux/consumer.h>
> +#include <linux/mux/driver.h>

This mux/driver.h include can be dropped as this driver is not
a mux driver and only uses the consumer side of the mux
interface. Unless I overlook something...

> +#include <linux/platform_device.h>
> +
> +#define MUX_SELECT_DELAY_US	100
> +
> +struct gpio_lmux {
> +	struct gpio_chip gc;
> +	struct mux_control *mux;
> +	struct mutex lock;

This lock can be dropped completely. It is only used where the
pair mux_control_select_delay()/mux_control_deselect() already
provides sufficient locking.

Cheers,
Peter

