Return-Path: <linux-gpio+bounces-29756-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C800CCF594
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Dec 2025 11:22:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 64AD5305E09B
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Dec 2025 10:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D168631353C;
	Fri, 19 Dec 2025 10:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ngfkvgyr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012021.outbound.protection.outlook.com [52.101.48.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301EE313538;
	Fri, 19 Dec 2025 10:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766139288; cv=fail; b=Hy7ltYwU03c1KFnTvural8oxOVjgBXXCdb6feNXkjTPCILejSMo0bLO9TMguir7KDmbEt2vvl9W5k92zYrNxj0nyhUG7Y7ZnPVeJxDf0sKAzRmJ70INEaw2+AooTwswvy6mNfZ0N2D6BgElALlkxZ5H3+GeCTNlxCPeECQ8o+ZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766139288; c=relaxed/simple;
	bh=dyWl8DlxwAoeYePumllF6Y2vCUrIAQoOBZW06GQTHl4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=W5AWRa5zPhXqg+06/cdV7CE/7/wAl4dPiRP2vP3+XMptmnDfBu7xSaMlTKQISChTspKkgUzkVM2uPkeKaPhu2iePtIG4kKX2Kamg/PvIc0w5AWkhYS2kU9+lYLPXQnPcsl8Z2z4jm9bZPbumsyqHLRC0QOthzx7KraKVpVBZWAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ngfkvgyr; arc=fail smtp.client-ip=52.101.48.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=frF0bR81uf4oHsaiHVP/uc8O41fT24JZIHejGlYD6JGCw7dSFbvD0FgWCCz8reWbo4v4XtB7uSrjTtivEQpqhEFrFlkrGumaWwhoof8ZqXNKnd3uBPV5PS5TIlC0sKZT+d6VsG+U4JtjRpLihr5Hq3iDwlX+/j3GWCzAFfWkRwA7kBCDdh/MlrI+NCecW/0tcXDDOoxuYmov1c2JZPy16P7sWB06lLovgt5J5C1LmxzgxspOV3Sk2unDga2WlfnF8lbeu8zFLfhBvPw+5NLpx1SUQCQmyRESMp4DjIfoX0yi3TofqIJPPan5qYMWZUe32Wcit97kgnyFZMtdVAy40Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zzcIAXQwWPT5JAgIgXY9mpBXdegGaAXCelRcb9PLk58=;
 b=mG0YiopZMr3RIPe9UQA3RyUHbbwPDgYF27c8zFxq2HG+t6l19xSn4MOqVJ9IS+8FPUt91AW+TrcxoDXXadlRzVYeP5e55t6LeErs17M+hsQJGOeRAx36db0/0n8lqDApAgB7cR5pP/MXPtOB01z0zIvGcQlrZhqDWUobZJ6yDLC7zcE0DKoQ9mMqsnd57wcAiFw0zIrVvdPi1D/pcAmDiL8otYNS5fY5zC67u8Qf8MCtnUSA/gFI9WB9rZhJt0Jw/G5qzkKl2HqisorddeySF0vNU1LZ0v+FW5+ZhkJqEtRi9jOteNGtaqozV4+fyR7h0CYaBBtVKM6Udpi1/h1euQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzcIAXQwWPT5JAgIgXY9mpBXdegGaAXCelRcb9PLk58=;
 b=ngfkvgyr2Av4rp/0WrzuU2wXZMqMe+4YcTIY++ck/BC3FlFsucfdX3vQyLQ6GCqZBltutPY8IcIZMae82s8ogiKm8Sp5uynIv6LSnh56S0wRxsUb0L2v7v4IZpcUA+11gbO7euLi359h7HcOXL+9rCFJ/ukAZtRkhxdP2ZWuVPE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by DM4PR12MB5748.namprd12.prod.outlook.com (2603:10b6:8:5f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 10:14:44 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%4]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 10:14:44 +0000
Message-ID: <f9f3feec-2ed0-45c7-8467-2aea3222ffbc@amd.com>
Date: Fri, 19 Dec 2025 11:14:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] gpio: zynq: Simplify with
 of_device_get_match_data()
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 Srinivas Neeli <srinivas.neeli@amd.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
References: <20251219-gpio-of-match-v2-0-5c65cbb513ac@oss.qualcomm.com>
 <20251219-gpio-of-match-v2-3-5c65cbb513ac@oss.qualcomm.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20251219-gpio-of-match-v2-3-5c65cbb513ac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH0PR07CA0116.namprd07.prod.outlook.com
 (2603:10b6:510:4::31) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|DM4PR12MB5748:EE_
X-MS-Office365-Filtering-Correlation-Id: ed642809-3b7f-4ee8-8fed-08de3ee76e54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c3pCWmJCYmRTN1lGVFJmOVlhODBqb3ZSSVBKMXRmeStZa2N4MHdNamY1YkNP?=
 =?utf-8?B?czdBVlVienVzVG1wU3UxRUJsYTlwRDl0NWlmNW92VGtvdjhLQVZITUdpY3BS?=
 =?utf-8?B?dDZpNVR6THFwa0JVV25CUEtOczc0Y1hMdVBUWFB2YlBabjNweUJ0ekVjd0Fn?=
 =?utf-8?B?bXNrWnJJUGN3QUNUakhYWFVsUzl1OGtxdStDU0VSRk1jZWd6NEJYWEUrdVVp?=
 =?utf-8?B?SWI2cGRtYjUweVBwbFNia0VralkvTG1JajlLVmpwUmlwYlRiZ1U0TkcrS1ov?=
 =?utf-8?B?Q0pwcTFERDE5OEZiZU5USDc5Umh2QWZFQzZ1cTdaZG5jaWdmbzk0a21Tc0Ja?=
 =?utf-8?B?bE1FQUVtTUpHQUxsa3lsTFlYbTBNUmxLbUpUTUtUeVg5QndsRzl1ejFHZ2VE?=
 =?utf-8?B?Sk5ISytrbmlLMk1OM1ZaemJON0Y0NVd6L0ZMdVdHRG1zeFVmbEZSMkZDVXNt?=
 =?utf-8?B?Q3BxNnp2YThoajIzUFBEUWFvWmdFM2hTZXZucXRCWnlpbWVBTWxpV0hldk83?=
 =?utf-8?B?Um5sSUUwNlFWV2x6cUJpS29wNEczVHRVbFl5aWdiT3NBU0FmaWxVcFMvTGNB?=
 =?utf-8?B?SWFaR1hnSitVaTRwQTNXWEVibDhSWVg0QjRMQjU1Z3RaVXQ0Z3puREVsNUNE?=
 =?utf-8?B?N0EvZVArREJmemRUME9WS21XSzBoc0FMYVZKSkNjOUxlQy9GSzIxOE5makZD?=
 =?utf-8?B?UFhERmhxTWVBQUEzV2VNRE1RK09iYk52eHpEV2NrU01ZVkpseEd5SlFMS3Jo?=
 =?utf-8?B?TEhkVWZsVEdkUFpLVTdNcnFPUVVVWGVBalRLMThuaStWdzJMenZNUm9JeVVY?=
 =?utf-8?B?RlhGMlZLSWd6WTFsS1dSZ2F3VmJvNVhYVnZLc0g0NzZLWmxFb3ZGcVB0am9Z?=
 =?utf-8?B?cXRFL0kwZWRBMnloS0hLdEJqSjBueTBOS29oYmhSMTBZSG5TZ005a3FxQlMx?=
 =?utf-8?B?RzA0cVZXNlV6MzBrSktCVXR6bE1JS0hLUVpBcnErT1pZekNBQy95OTJDb1hu?=
 =?utf-8?B?T3RSUmZISzhHeXo2Y05oMlZwRTA2T2Vick5XOUZGd1I0T2dEeTEycnRMZjM5?=
 =?utf-8?B?QzdwMHNOWVlBTVJqdzBhVXo2bEtnR0ZaVDZsVjlEMGtobTZvMi9XL3Y5SW01?=
 =?utf-8?B?bVpuSkl2VWUzdy9VMHFuaE5RWkdoeWVTbFgzckJRNTNZV0RDNlcwcm1Mczl1?=
 =?utf-8?B?TW1KSisxVllJbTBGdUxuQ2p4bnJWd3l0OFRnYW1OYnR1cTYvSTZudDRSQmRr?=
 =?utf-8?B?ci9yMnhnRnRaV1VyRGZjRmFhWndYRitIa2pKcU92UEtNL3U4NldKNCtPR1Rx?=
 =?utf-8?B?LzZOd3MwSkRwRk1WdjFHcWJXbmJlRzRCOVk0d0l5eitzaWxXMElObzd0L0lJ?=
 =?utf-8?B?VVZHRmg4NnZFY2RIcjhPSHhxdWZVVnh2MzRNLy84OVFMdEtuVFFNclZCUWE4?=
 =?utf-8?B?aHoyN0V5YnQzMzIyRm0wSkxKdEFnOHF5THNpQXRYZkJNeDliUGRmeTV3d0lT?=
 =?utf-8?B?NVczTXVvd1JEcGtvNnFDS2RVaGRDcW1ucE04VURFS2FOeXpOayt4TGk5aEN2?=
 =?utf-8?B?WGxMdFc2L2hwT2Y0aTA5dmRacng1RjYwSFRuNHZYb2RvZUhGOFMwaXg2aWJq?=
 =?utf-8?B?OU1tbjlZNE9XZjYyYjlCRWk1dmdyWTBzVUN0OTVMblJpRVZUL2pLT1VTS3dT?=
 =?utf-8?B?STZiZXpCQ3gwSkhJNk8zVFNyL3BUTWcybW1GZy94V0pQOFVDQ2pOcyt1ZW1X?=
 =?utf-8?B?RVF5MGRKOG9QaThCTnpGZ01mWGZiZExDeUVDMlhScjVxQzZldXdJTjVCZ2pJ?=
 =?utf-8?B?NmorZHNtRlFqVTFWeUduMnVtd24yL1E2YkFMSXJnNnRzWVJWM2Jmd2pRbDI4?=
 =?utf-8?B?MHdvZWM0Q0dGUHBvZkhUUDNHTEI2TTZQQ3VwVlE2NG9XTnVFaGZhbVIyR1FS?=
 =?utf-8?Q?dSAFLOnivM5EkdF8Kyy2nxTCaTJnltkG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmRScWR2WC9xMjg5M0hCYTF4VytGeWlPamcxdnJPNlJIWnlrNkxEZXRzaFJR?=
 =?utf-8?B?V2p6Qkk1M2IybEdRT0FNY3VBTmNXZU1ETG91ZExaalN2R1ZkWVJuU0UxN3Jk?=
 =?utf-8?B?OFV3eHlJSzVCeGpObU10elA1UWwxNER3Vlpza295QzdGZ2lRbUQxZk9ZUFp4?=
 =?utf-8?B?SGwzekxjYWpFdHoxUDhSVzNvY0xNTjlFeXlLcVBFRXpudit3elFYeTMwTFJS?=
 =?utf-8?B?bGk1RDluR3pCelV2ZmhYVUNZcTdqN2F4cVQ1NjIveHBQOWJKNDBTdFVJZjdp?=
 =?utf-8?B?VUE0dDB5c2ZnbWluR0lFMWNJQmsyOFFvSDN3K2JSUTNVQmtyZWhudXAwUXBs?=
 =?utf-8?B?d05VbFM0U0s4R3BkNzdPYUxLcXYraW5YbGVBODJITXBQeklzN2NjWmRUVW1L?=
 =?utf-8?B?M2tKNHVWV3N2VCt4d1c3NXIzWDI1QmhiMGJVOTByT1pDbEEzUGNPazFvUHkw?=
 =?utf-8?B?OTd6dVlHY0F2OEpqdVBGSVUzTEN2MmMyQ0NKQ21EbWc3TTF1eVBnN1NNQUNS?=
 =?utf-8?B?eC94aFU0am9Ra1paQmZobXlNb0tFb3ZxTDcybjFIUW9OeTF5U2Z0OXRGVTVL?=
 =?utf-8?B?aHhyWUlVb1VIdlhSS1ZkV3FOMjNsN2VHZ3dmdGdpYjlPQmdvck1ONE5CZVhM?=
 =?utf-8?B?a0pXRzV5M1BwUTIvbEw3cGh6aC9Bbld5bVBub1I5ZEVLcE1sUDA2b2NlM0dw?=
 =?utf-8?B?b2NRbURXTWMxWEcydlhsRFBOWEVjR0xLRVB5S0ZDcmJzcXBPWDFWN0ZaNUxv?=
 =?utf-8?B?QlptRjdKRk41NjR5ZElhNkdWNTJRL2RGYlNSVGY5Z0dSTVBFSFZtTFZjQzcv?=
 =?utf-8?B?ckZVaTRZekRHeUhQZlpPaTljSUJFQ3UyVGVTUkFob0FoM3FLQnVFb3lkVXZy?=
 =?utf-8?B?VVFkUzU2UCtlNDY2bWlCblArWXpEWTNibjNqSGdXZ0hsaStUQUZNZ3hFa2sy?=
 =?utf-8?B?M2NCWXc3WXd0U2dhR0h6QUJaaXloWENIb0RJQXA2UXJWajFERHpWTmwwU1E3?=
 =?utf-8?B?bjBkNFUrUUtQdHBkTVpucWZFL1NBdjVSOWdaTFBYK1YyUVVua2krQjJndDBy?=
 =?utf-8?B?cThMMHp2T1JHL3RFNkYrQWFNeWcyVHNYRzBaODhJaVRyTGJJdGVqT2tKbXR0?=
 =?utf-8?B?cjNwUDhsVjYzZVdySitPMG4yMUVuNG52RkhGQTY4WHlKVEczN2JlZW12dkhm?=
 =?utf-8?B?MURQRTZwN1BmS2NrM1p6dTVsMFFCV21MRmZiKzFXNW9ZS2pGY1l4bmNyTDIw?=
 =?utf-8?B?cmhBdkV6MFB1cE1zQzNDd2RuMjJPaXFvZElRYXV5K3Q3M3FBaURGaHp4WFBi?=
 =?utf-8?B?TjRYeDNSYzhyeXQ5bUlHa003K0FFZ3lXNTgxakg2N2VCeUJSRWRiZzdmaWVx?=
 =?utf-8?B?S1JQV3NaNmFpQXlBajk1WEc5QmtTcDVsa1dvMXoxcklrWVJXNFB5c3RlWjlY?=
 =?utf-8?B?R0dLclFiS2FjT1IrbDFORVBMdjAzMEtWbmtaSU12YjFnWXV5M3Joa0RQNVZD?=
 =?utf-8?B?cnFIeEtqTmo0eFhCSm56cTVPNGFONll0L2lrM09LaU9CMjh1SUEvb2sxT1lO?=
 =?utf-8?B?UTlXbGZReUROSzg5MzFhWFJmYlFySUlaUDhIYmFGRjB0K2hJckNtNnNNTjdY?=
 =?utf-8?B?VnV6N3NwRVhQamxKOHFpOEpJQzdkbXV2OENPVUluc1FQMmswMDV4WUhzMEgr?=
 =?utf-8?B?a0pDZ05veEVBejkvWjI5bFhra204Rkw5Z0UzZDg1NW5XcXVRdTNjeGNYZmRq?=
 =?utf-8?B?ZHNqc0w5aHBjNnB4djYxSUdrbUNMWklZcXhjNWs2L3pNejJ3d1k0L25TOVha?=
 =?utf-8?B?WGlBT2wrWlZqbHMyOWkwdmZDdzRVV1g2bTV4VTRUZ2RyekFKZFFsTytra0xJ?=
 =?utf-8?B?NDAwRnBRdkpueHZvV2tZL1RWN212a2gzTjAvK3ZFQXJ3amVMVGw1c3p5bXRo?=
 =?utf-8?B?WTZibWVGdlVUTERlK2xDb2piVXp0RTdyb29kSSt2a0FhSGowbStZaHVqMFBi?=
 =?utf-8?B?bHdVVmZQVXk0SDlOcXJRdzgrR1JSZFRCTXFWdWJxaEpEbm9jQlJmRGpKdUhB?=
 =?utf-8?B?QmhQZms5WTl1aEt2V1B5bk5hMXJ5ckY0dDQ2bWp3Y2NhU2dMMjYwQnZMSGhq?=
 =?utf-8?Q?Eebfq9N/y8pQlMLBGti9z8Vsp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed642809-3b7f-4ee8-8fed-08de3ee76e54
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 10:14:44.3477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g3SiLMSYMzwTmlQpt4hqyZ1HgQLWfD3qqAUQ8jHKIG97Nq+rBKMLKAXiALIEtHv1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5748



On 12/19/25 11:11, Krzysztof Kozlowski wrote:
> Driver's probe function matches against driver's of_device_id table,
> where each entry has non-NULL match data, so of_match_node() can be
> simplified with of_device_get_match_data().

device_get_match_data() right?

> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   drivers/gpio/gpio-zynq.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
> index 97780c57ab56..d69773318888 100644
> --- a/drivers/gpio/gpio-zynq.c
> +++ b/drivers/gpio/gpio-zynq.c
> @@ -903,18 +903,16 @@ static int zynq_gpio_probe(struct platform_device *pdev)
>   	struct zynq_gpio *gpio;
>   	struct gpio_chip *chip;
>   	struct gpio_irq_chip *girq;
> -	const struct of_device_id *match;
>   
>   	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
>   	if (!gpio)
>   		return -ENOMEM;
>   
> -	match = of_match_node(zynq_gpio_of_match, pdev->dev.of_node);
> -	if (!match) {
> -		dev_err(&pdev->dev, "of_match_node() failed\n");
> +	gpio->p_data = device_get_match_data(&pdev->dev);
> +	if (!gpio->p_data) {
> +		dev_err(&pdev->dev, "of_device_get_match_data() failed\n");

device_get_match_data() ?




>   		return -EINVAL;
>   	}
> -	gpio->p_data = match->data;
>   	platform_set_drvdata(pdev, gpio);
>   
>   	gpio->base_addr = devm_platform_ioremap_resource(pdev, 0);
> 

M

