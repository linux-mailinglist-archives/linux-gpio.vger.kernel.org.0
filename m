Return-Path: <linux-gpio+bounces-7443-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 177B49086BF
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jun 2024 10:51:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 315BA1C2236C
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jun 2024 08:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D1D7191497;
	Fri, 14 Jun 2024 08:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="MibdVBdf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2135.outbound.protection.outlook.com [40.107.215.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BC114B940;
	Fri, 14 Jun 2024 08:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718355079; cv=fail; b=uFB4LxJbXQIlchQtgWbekjlrjn6DZcQaqP5SLNSn24tz8p1eitC/+OsP75YK9PP+HkIy19Ajo3Hj07rZo6zJ8CTPQKTSwpvGlI0wpcJH1JxmqJdE6QiNuOHkxkD+y0+nKuiuhrY269e8VB0qIpw5dDmPeEaYvGMIUu85hdvx2Ss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718355079; c=relaxed/simple;
	bh=0JboslFbEHpHvWR6czvc0LuGsI1wAArYt3aG5eTU69c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pd1pORDkTR8lmWzqQPskxqxKJfV4rkJQLbnxl5JKM4h/IwVnzhTzfBYPkUVqawZIGC1lFvIFSf/oDMD36ueipiujOxDPLrErHV0NVpD2zdVHYYTmrkvpQf/8PD1ORI+oc8h+KTN44koPFLr0hTOl9bIFLQyUB9KhrzZ/ByyaEKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=MibdVBdf; arc=fail smtp.client-ip=40.107.215.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YykVoofjVswPN7/GlD7aijF0+6hWrY3R+PB8aZyrGauN1TKuP9XW2smtj+5BQkCXfP9HuApGfYaGSjXxvLt0MuduHqyyhv7D3z0Glmt6HtLbljZMxfUzBuHeTTWtCHNPbSrgpMTdzD0E1GefvIRmDN1EkeV8gFJJETqItPPeaxIf3rCow32s13bSGNbdamb7m4V35ZhOrbxnTB9+WFm7nqHgIwDS0p2tHYKKlvQ0i/J7VlQ58W7OUQ1mVjiz9odhZuJSUEkcPin8oowfgbgQ8F6QwEjZPNwKPgSF/6yczAZMdtgWq3khijftcd4bPzZLzrJNY0qi8Phks6QkEUKGEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8A4p2wwOmIYB5l682T+CgOOXgYJHEKC2CkcqzMAKuw=;
 b=Wy43/zvY2ol6exb2KwwNTD0mAFh/NqVVULJ8SjjOmwyscrOt7BoytVgb02qYsnK1zhAiNCJ9K2YYm6QdiZnCHOi5UbY/uxKdhh4ZAzaAXjKwiNgTApMlRQ+V/E0uRu1JNIU8dZleFORVyLwgoKPkGEPD/tcw5hjt2FCAPqRn7QZRts2QTOzoUuk9gHNEwr5BbIcCTQJrT+CxvTYgBEY+yvwbpZCS310w9LEtapqQQCE353rVbOvQvArCZQ9hFJN6ndoSvoUJ2IWDKHnYStWPy0XtbBvi+1zkLtV70FxE+5DFEnRjVaug66+0lv3UC03r6Wl61RS9Wo8dquRqyAk/RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8A4p2wwOmIYB5l682T+CgOOXgYJHEKC2CkcqzMAKuw=;
 b=MibdVBdf7FT7wuwbjWIPpiTfc22b8zIohSDGYDl0nWhq5E+hNnUGaVoDJddBq2jeXiILNXuJgtCT6xlQ+AjgOIm6U/MRwdm22FjbZ5d4zfH6RLRSE+E+mXTi3koier8ZRXy0Hl6n4jqmVfRrnqD6PTTEnrVvBlCfDjxCUXkMcOteeIL8w2NlI1umYJ9VY/uIU9X+td8eSkTC0K6+drK87/8LWbvmG+AD6jJH3P/O6DmIkdlD+Xil85JYwDRqNyFPO7RZ74BuZjcpmAxICfCWHZjsrSTleHSRquqmV7fZkZSvFXMyHmJNCbbF87mYJXPKRV5h4PXcAuYAIaudT0HaJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SEZPR03MB7193.apcprd03.prod.outlook.com (2603:1096:101:e6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Fri, 14 Jun
 2024 08:51:11 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%7]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 08:51:10 +0000
Message-ID: <42752f1c-fa79-450c-bbf8-f55464db14ae@amlogic.com>
Date: Fri, 14 Jun 2024 16:51:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: Add support for Amlogic A4 SoCs
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240611-a4_pinctrl-v1-0-dc487b1977b3@amlogic.com>
 <20240611-a4_pinctrl-v1-1-dc487b1977b3@amlogic.com>
 <20240613170816.GA2020944-robh@kernel.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20240613170816.GA2020944-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0163.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::19) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SEZPR03MB7193:EE_
X-MS-Office365-Filtering-Correlation-Id: 57bda40a-c10c-4954-2cf9-08dc8c4f237a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|1800799019|7416009|366011|376009;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZU0vSnk3eW5WK3RjQTYrMHdFdGc5cXFSaEJ5VDc5bGpOVEQ5SkVBaFlYS1A4?=
 =?utf-8?B?bUczUmhkekVOcGd2UENkeGVBVEwxZjJ6VGQ3Tzc5TTFIQVE5VmJxTGFCWkRk?=
 =?utf-8?B?SThrSTJTZzVaS1Q0RThyd3JpeXVjUDRiYVVYZC9lMDJVdlRtVVNGb2pwUnhi?=
 =?utf-8?B?QjE1OHRPOExkWngrSTUrWG83bDVuK1pGK0FuZjB3aHAyQVc0WWI3bE9zMzZP?=
 =?utf-8?B?MllUUnFMTEZJV2lCd05sNERTQkE0ZWVweTBIbFpQRXZvR0c3QzA2WThWMDdG?=
 =?utf-8?B?N0N2aERSdUZia3pIOVVZbVI1YUVzVlYyUVREVVZ5SWxkMVRwU3grSHVsMHRW?=
 =?utf-8?B?YjA3MU4rTDJmUGRCUVN1bVFRMVRlRWZ5SldPNDJYNEhRUFJCMHVVZDhjMWJK?=
 =?utf-8?B?RExQeVBVZTBtczNUVFFXUkNkYjQ2Njg5VUtKTTZpSjBLZEpydmNWbk1lakV5?=
 =?utf-8?B?WUJWSmVIS1diNGdLL1VvVVhackRHbVNjUG5xbldjQmkrQ0VQWkYzSHdnZ0hN?=
 =?utf-8?B?Y2NNUmRJdk1zd05RcHQzcHBKYnBtZW1yTE82bjV0NzJHYlRFMXFrL1Q4d3lu?=
 =?utf-8?B?UmhHd0xZQ1E2d0I1Mmk2S3IvdlAyZkF5K0d1aUY5QTBaeGd5ZU5BbXZabUho?=
 =?utf-8?B?aldsZ2JqYUxCREhiOGdNc2dJNGVLVHY1UTZzUXFia3g3ZzRFbFpsam1ZZk04?=
 =?utf-8?B?NW5oNWVud2Z2QU4vcTRGL1pQdHBTd0RyNm1xM1U2RVpteFJ6bUQra2tzSXRZ?=
 =?utf-8?B?ZmdXV2thRVdLeVBDT3R6ZEhzbTN6NS9FdFlnM3dtcFg0TFRMaFpQUTdyTDFp?=
 =?utf-8?B?MXJEQ0wzQ1N4MkJQQmlYMjFkMmw1bWVUWU9pYnRNVUFvOEFtT1d1MjlPejRJ?=
 =?utf-8?B?VHkwRlkzRWZFQ1VuSzNYZ3hXN3J5STJ2REYxODdzL2tiQVhnSzlXUmpMZUM3?=
 =?utf-8?B?RDh6dElKQVZPd0pzUENxMTEzTllVQ0VWbElCTG9Oa2pxU1FmQXNWZkJ6bzU1?=
 =?utf-8?B?LzJlZVQvTVFaV2xUSnNPSjNKZ1ZNV21KQjE2NjlLcXR0QnZrVnR2ck5xRElI?=
 =?utf-8?B?MHBNY0UzK2JqZ1lBN2tGdEo2UWVSQ21iY2dKK2EyM0k2cldYc2VpY1Via1hk?=
 =?utf-8?B?Q0ZUOUJ4aE9YZ0FZa2FQd0NPN1UvaS9TNlpJSlFPaU5qaXM1bHhWb3hSNVA4?=
 =?utf-8?B?QnIvc1pROVlISnpOWFcyQ0ZXRms0QkxpcWlFZlEwaHNvQ2NhcVE1OHBaeTNZ?=
 =?utf-8?B?UGVkcWxraERSdi9sYmJiTS9vTEZNa3hVc0lRMUxqZk1tdHJTYnMwa1BvYlRo?=
 =?utf-8?B?ZTN4QnYxY1FLa3pITzJOZG9CMWRXK1FUbTNkQk5EZE0rcmxmZ3BvY2pQQlZ4?=
 =?utf-8?B?RlRwZS9PTlFvWTdaekJIT0haNUZ3UEt0VWlmNzE5ZHl1OGZROGF1WHV0RFQ5?=
 =?utf-8?B?V2tEeDAwaGw5eW1qVmJUMlY0dlB1U0lyTEVVOU45WWk1bXQvV1VnWExyYVFx?=
 =?utf-8?B?TUlOcVJyK1lGbU0wbWpNUDczR3EyTVhGQjlZakJBSUlHbERlOStTMmpxblJU?=
 =?utf-8?B?NGd3QWMvVFN5YW9raEVDUkxxcWlXanF1Y29NVmU3S2xDbGx5TGFjV3V4Umdl?=
 =?utf-8?B?RE82TmM0cEhXaDZibGZjOWIwZHZjbldZM253SURPdVBRSGZ2T3JvUkdXZkFw?=
 =?utf-8?B?WHRKU09lYlcyVExiRmlXaERBemJuMEsvbURiYWx2V1Z6ejc5V1E4dWhXNTI2?=
 =?utf-8?Q?ioyZUlq/2ktpcWHCSFoffN0GsAM37cDtbriSABN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(1800799019)(7416009)(366011)(376009);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHRvZ2ZxYzNuK2k2bHhBbWMrREdsdkl5bnpwZFdpVWQ5VnJrTkZFU0hFRlhD?=
 =?utf-8?B?L2JqVkdOWWE0R2NuL2hEQnA3U1ExS3FVUmRrVEVTSE1ydHhlS0tsVFNSTkxI?=
 =?utf-8?B?S0lRbzNsRnEzclJGNU9zZ0xIZlBRcmlSbkpNSXVHVVhOWTFQL2M4LzMxNGVB?=
 =?utf-8?B?M0xvckx0dHVaek51TkJVWmFaSUdpTTJjZGV2UUw5a0luWWNYQkRJUGNJNnl6?=
 =?utf-8?B?WmgvVXU0d0lNYjdqTWtxN3cvTmxYYURTTmRhZm15YlhkN0t5TkVSSDVzTGZO?=
 =?utf-8?B?SHNSSE44TVpEeHhBSVp5T3BYa3owcFNaMlUrS0lhU0w4SS9rL2dDUXJ3czJE?=
 =?utf-8?B?UFJoU2Z2L1l4LzltUmI3Z2xDamhkNVVJeXJnWlR3WHNBcW85akZuaWpXODhj?=
 =?utf-8?B?R09CMFFaVUJGY0hmTnlETC9sNjBHZWN5Qy9FeENzUjJYd3pPZmJqQlBrQUMz?=
 =?utf-8?B?WDdzMVhCUzdZU1Jpak9iYWlDdlc4TDUvSWVkVGhoNmhoVG1qUkttaXhHREIw?=
 =?utf-8?B?NmdjczFlSExDU0NLcXJ3RURmWmNWNUV3M2swUDF4WTB0RzJEbmplZkM1Z3ov?=
 =?utf-8?B?aVdXMUJqdk5Eb2RranZMbXpGWkZ5dkhYdlNidThYNWMwZXpMRTZLQ2hvWFJx?=
 =?utf-8?B?cmFtcHdhaWpQYTJKQ1BmalBNTC9lQWxEbndkR0RmczlZL3hvckVrSkNuTjVP?=
 =?utf-8?B?MStibmFrNkJSdllkUDlDSDU3Zi9GemtkZG9JOGY4NmJvWjFOWEhDZFF0WTc3?=
 =?utf-8?B?RDVIeHpQem9SeFdyeEZ0NklrN0VsNE1qOTlWeXg0Q0pwUEJNYjFvYWhzdHQ0?=
 =?utf-8?B?eDJnTkNrVmk1MktWTVNVY3NuSUVVS0grSHN3WUo4aC9jd1V3RjNIOXZBODYz?=
 =?utf-8?B?Y1J4RFNybnNNaTAxNTZIVW5qcUEvMGtCT1NWQ2FidTlqcG81QjBHSCtMbmNy?=
 =?utf-8?B?UDF5OEhpR1dZdStyU3UvS2hKbEw2R3Q0a0pPbjlTa3YzU3NoN0JmQ2tMVHdn?=
 =?utf-8?B?QkY0OVErc3NCMkFldEFGdGFtYWtQQVZNZHo2K0pwRU5HMXRhV3VYMEgrSW1Z?=
 =?utf-8?B?YVhsaGplSVdrRmptK0p2TXJ6bHJrRGJNaHltNTJaRWZQQld3RU1KWmZhVjcz?=
 =?utf-8?B?MzViLzNXMVpVbG9NOHVLZVpxaU83YlF2dE5adHBQM08ycXVYSmhFUEtzbzBq?=
 =?utf-8?B?enZ0ZnJrdXU5QVhhOGlJUzVLV2JVcFBQMWI0ZDV1aTd1bndadUNRTVRPbTZs?=
 =?utf-8?B?TFRPNXIrZzZ5bmdYb0ZUWis2d0svL1RTVEdJMnZ6d0loTmo1QU1WVVZYSWFm?=
 =?utf-8?B?aEFvQ3hnYUt2U09MRkhHNGVGTW1qaWxPLzRTS1V0bDNyYTh5M1pFMklqeUtw?=
 =?utf-8?B?NjUyaXhpRTJoZDYyRVJaN01PRHErSTdKa2pLN21qUmp5Y1JQWVdiaWk0c05z?=
 =?utf-8?B?YXU5VmZMOVVKYk83OVFZYVV4cTRSSUJXTmNzK1o5YTRyZHFmY0M0d0F3cHJE?=
 =?utf-8?B?MDB1cG0xbnJjZFV3dFZubkJWVGNDVzJ1dFlISlFDVXlTTlhZejByWjVOMXR6?=
 =?utf-8?B?SGpWMnlVUXNqNk1iZzhWa1pCd1hLOHJoN1BFeFJLck1vd0pvU1dLcHBDaG1T?=
 =?utf-8?B?dk4weVVYd1QxMUw4a0Jld3J3clBicHAvRUxvenV3NnY4V0tMVHNIM1RyT2hL?=
 =?utf-8?B?dUluR000akN1azBmL0hYYkNsamRTL0g3WU9MT2xsaWVnUTNjTTBRU2ZMREJw?=
 =?utf-8?B?V28xT0lEdllCQU4wVWtzbHZUZUZsb0swcW16cTB5Z0p1SWp5dG4wLzVIaDM1?=
 =?utf-8?B?aUVyUFk3Tm5PMDVmVnJNejc3SzZZdUJYa01lTFpCdUNoU0h3SCtnU1hpd0tW?=
 =?utf-8?B?Q1FIVjZVVTJXWlZmV0dma3pZcCttWlVtcUgydjk5Q0Eza0JzUEo5eE10dlJ1?=
 =?utf-8?B?Z3hDL1NQTHMyTnhML21pVjd4bnNFMnBueW5xM052WnNlKzRwS2VKVWUzV0lW?=
 =?utf-8?B?TE5sU3hVdnVuNlhZRngvQkZFcXRabDdnQ2IxVXFycG4vNURBR2NLN2t5VkY3?=
 =?utf-8?B?L0Y0Rm9IZ1dUZHFmMHViNEdPQm40NTRHNXdWNGRHM1F6aUE2bC9YQjIreUJv?=
 =?utf-8?B?YStIanB5VjNBWTFCMUZiNmhuRmlvOEorQ25OVDNmc2pLRWI2UGRQTnowQ3Zo?=
 =?utf-8?B?alE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57bda40a-c10c-4954-2cf9-08dc8c4f237a
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 08:51:10.7312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k3l4CYE+S+/OucuqLNmMRs/q7Js8lYB/PZwE9M4nPd0Kcm1rK9OA8+443bTCGqQWq52CTJP/0z7e5h80xvgr8fW4i4g9/JBLfRXpJhLJNKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7193

Hi Rob,
      Thanks for your review.

On 2024/6/14 01:08, Rob Herring wrote:
> [ EXTERNAL EMAIL ]
> 
> On Tue, Jun 11, 2024 at 01:10:57PM +0800, Xianwei Zhao wrote:
>> Add the new compatible name for Amlogic A4 pin controller, and add
>> a new dt-binding header file which document the detail pin names.
>>
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> ---
>>   .../bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml |  2 +
>>   .../dt-bindings/gpio/amlogic,a4-aobus-pinctrl.h    | 21 +++++
>>   .../dt-bindings/gpio/amlogic,a4-periphs-pinctrl.h  | 93 ++++++++++++++++++++++
>>   3 files changed, 116 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
>> index d9e0b2c48e84..f5eefa0fab5b 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
>> @@ -15,6 +15,8 @@ allOf:
>>   properties:
>>     compatible:
>>       enum:
>> +      - amlogic,a4-aobus-pinctrl
>> +      - amlogic,a4-periphs-pinctrl
>>         - amlogic,c3-periphs-pinctrl
>>         - amlogic,t7-periphs-pinctrl
>>         - amlogic,meson-a1-periphs-pinctrl
>> diff --git a/include/dt-bindings/gpio/amlogic,a4-aobus-pinctrl.h b/include/dt-bindings/gpio/amlogic,a4-aobus-pinctrl.h
>> new file mode 100644
>> index 000000000000..7c7e746baed5
>> --- /dev/null
>> +++ b/include/dt-bindings/gpio/amlogic,a4-aobus-pinctrl.h
>> @@ -0,0 +1,21 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
>> +/*
>> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
>> + * Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> + */
>> +
>> +#ifndef _DT_BINDINGS_AMLOGIC_A4_AOBUS_PINCTRL_H
>> +#define _DT_BINDINGS_AMLOGIC_A4_AOBUS_PINCTRL_H
>> +
>> +/* GPIOAO */
>> +#define GPIOAO_0                     0
>> +#define GPIOAO_1                     1
>> +#define GPIOAO_2                     2
>> +#define GPIOAO_3                     3
>> +#define GPIOAO_4                     4
>> +#define GPIOAO_5                     5
>> +#define GPIOAO_6                     6
> 
> I find defines with the value of the define in the name pretty
> pointless.
> 
In the driver, this macro definition not only uses its value, but also 
uses this character, for example as following,

MESON_PIN(GPIOE_0),
#define MESON_PIN(x) PINCTRL_PIN(x, #x)

GPIO_GROUP(GPIOE_0),
#define GPIO_GROUP(gpio)                                               \
         {                                                              \
                 .name = #gpio,                                         \
                 .pins = (const unsigned int[]){ gpio },                \
                 .num_pins = 1,                                         \
                 .data = (const struct meson_pmx_axg_data[]){           \
                         PMX_DATA(0),                                   \
                 },                                                     \
         }

>> +
>> +#define GPIO_TEST_N                  7
>> +
>> +#endif
>> diff --git a/include/dt-bindings/gpio/amlogic,a4-periphs-pinctrl.h b/include/dt-bindings/gpio/amlogic,a4-periphs-pinctrl.h
>> new file mode 100644
>> index 000000000000..dfabca4b4790
>> --- /dev/null
>> +++ b/include/dt-bindings/gpio/amlogic,a4-periphs-pinctrl.h
>> @@ -0,0 +1,93 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
>> +/*
>> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
>> + * Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> + */
>> +
>> +#ifndef _DT_BINDINGS_AMLOGIC_A4_PERIPHS_PINCTRL_H
>> +#define _DT_BINDINGS_AMLOGIC_A4_PERIPHS_PINCTRL_H
>> +
>> +/* GPIOE */
>> +#define GPIOE_0                              0
>> +#define GPIOE_1                              1
>> +
>> +/* GPIOD */
>> +#define GPIOD_0                              2
>> +#define GPIOD_1                              3
>> +#define GPIOD_2                              4
>> +#define GPIOD_3                              5
>> +#define GPIOD_4                              6
>> +#define GPIOD_5                              7
>> +#define GPIOD_6                              8
>> +#define GPIOD_7                              9
>> +#define GPIOD_8                              10
>> +#define GPIOD_9                              11
>> +#define GPIOD_10                     12
>> +#define GPIOD_11                     13
>> +#define GPIOD_12                     14
>> +#define GPIOD_13                     15
>> +#define GPIOD_14                     16
>> +#define GPIOD_15                     17
> 
> I'm not really much of a fan of using defines for GPIOs, but if you do,
> wouldn't be better to split banks and lines up rather than a global
> number space. See ASPEED_GPIO() or tegra header.
> For the same reasons described above.
I want to keep the same style as the previous drive.

> Rob

