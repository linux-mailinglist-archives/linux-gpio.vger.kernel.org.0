Return-Path: <linux-gpio+bounces-13153-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 821DD9D36FC
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2024 10:22:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16A3E1F27213
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2024 09:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5101D199E84;
	Wed, 20 Nov 2024 09:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UkxFGfLy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2071.outbound.protection.outlook.com [40.107.22.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33302177998;
	Wed, 20 Nov 2024 09:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732094485; cv=fail; b=hONrGrNWknVNcBAsqkOYqvyhJB+hyzXw5o40ceApz7xqpryVFRWCO8IEoqMsyAxg64SlX0J/R0UREK4M2LnLrBJ4LWroN4unRrQoqRcH/sdr9+Wq/oCJzRFgy1sYGz5eUeOkQyd2K1qXYJXKjfmb3+sJ4wwUHxt/fmCCw/bT1ng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732094485; c=relaxed/simple;
	bh=6CdPkJTk26kAgFRCb76JQ+t+iy0WZHAndcvW9qeT+CY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WvInUdtqVURz+XRnLVHrQc+pvieXYd0qXFKAtsJ/QEV92uThC4r0VCS4SxoWs3gypXmMyAjO4RSp8oM0HAX30Reo63ktxnKe4DCseedLtl9OK/SRCm7MxNkJCaD/POh5e/bqY82c1QKfsy7P0/ZgfMsuDDL901U8zEQyY1KSSGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UkxFGfLy; arc=fail smtp.client-ip=40.107.22.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IRdvTZdNUvav6A1FoDL3ngmXYaGhXXnFFtS0U6QhSB6Or8pGxCofdAOwK7z62ExWV/vQ59gYcM0nj2oa87cX1Cr2WJVOWhC3o5Fu4xCvldgPMHY+lQRKwvxifa1//fAp2b0sVMNRyTulIzQr45IsxF7qpkWNfjqDkVAxZktVR/1XDlbR9B0aRjOutHXuQRIykRcnQs33hU2fGfAekeLvDUAc0PmTcDf5ds0WOCB/OkZf9S4DUMIG5voWgXrF1vsirVFuG0QB7qx2qks/sJr3+pK2slOZzKgjNXUXVIuG967t34y6EbBnH8J9uueAMezEUF+ttwKZMhDbFcWOqSyItQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XUoLI+m3mX64pE8DPYkjfJL+0QAKBmDPcFpExzcPI2E=;
 b=XVMlCu+HWOVZQSz3n+m5rTOOVBGwA8Y3SK+Kh5nzzK+LIdd2JdFx1DaNlS3HICgA5tmBbzbn9tf1RMVxkn9fYIB70RFVGVHb/xxccXHhPaIQuJZ0+Su2XdnAA8k+EAP8f4vW5fOsXN5x6E16zkHBk6rLEs8b2Es8cMlhj8JoFDqrty0GewXOL7b2A1weDyDgqORWdlNqC2iRlARcgb0jp+SVRYJah1QTd1HMPT5Zmv3SmrnZ7J2oReSHh+e5OsQlsK+7HSHOLGS9CjY9TowlHgKpAB27Nx8d9G3Yzy6XpwXaUFp5iwyGvV5TsAkT7n5t+WLNjQPgPYQ1moQI4cM79Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUoLI+m3mX64pE8DPYkjfJL+0QAKBmDPcFpExzcPI2E=;
 b=UkxFGfLyYBijy5FzyV1mhajdnK6lm59DDRiNZd0K5IFaGlTBH6CNPD3PKsOqHlq/dVCvuSS/TMQEi41OLZsbEPLluZNpn6YHmVW3iRA88FYhothQLSAG0xu0ygOFEfYwxSH2Rkzj+HQjuY1FWLldHx0H1hOstwpaNZR9XOhpNVTSNzFAJUnsHvIMA286XZgxwKt0UEkMF6BrQmOLFECGFnJVNRV4ML2gmX0H1UL+2uJmxfwb6+gEcR2E9MYFfKWXr5j/LrUeuQUDpNvJF6x8f8JWYuKjhijsVXsoYiGTt5iTUG5r1AUnXtU9H6RBRscjUXR8IgKLXR8Wtma/3LWJmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by GVXPR04MB9976.eurprd04.prod.outlook.com (2603:10a6:150:117::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Wed, 20 Nov
 2024 09:21:18 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.8182.013; Wed, 20 Nov 2024
 09:21:18 +0000
Message-ID: <398f1db9-a24e-4062-ac40-657916186251@oss.nxp.com>
Date: Wed, 20 Nov 2024 11:21:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/7] dt-bindings: mfd: add support for the NXP SIUL2
 module
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Lee Jones <lee@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>,
 Jacky Bai <ping.bai@nxp.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev
References: <20241113101124.1279648-1-andrei.stefanescu@oss.nxp.com>
 <20241113101124.1279648-2-andrei.stefanescu@oss.nxp.com>
 <18e7a32c-a8de-4e5a-80aa-248b2090e346@kernel.org>
 <72b3b5e7-739f-4f03-ac40-a9cbd37972b8@oss.nxp.com>
 <gqzwfe6wucn57plnte3g7c5xiri45mnatieviewgchkpeh562t@gha4sfrutjuh>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <gqzwfe6wucn57plnte3g7c5xiri45mnatieviewgchkpeh562t@gha4sfrutjuh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0200.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::7) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|GVXPR04MB9976:EE_
X-MS-Office365-Filtering-Correlation-Id: 382955be-bac1-46d0-c8a2-08dd0944b05a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NVd5Z2ZWcEwvdEl3UHFQZFFmRzRhVDEvTFFqemVldjNBMWxMejZHUlkvcEhL?=
 =?utf-8?B?b1oyY2l3ZVNyTFgrM2c2L0svYy93cXkxVmFQYkQ4UnlpbVBEMzVPL2M2VFgw?=
 =?utf-8?B?TWRDQnpLa0hhc0wzVXlqdEVUckppdDV1UDFHMUwwem1zNzUraWNvYzdqQk9F?=
 =?utf-8?B?ZHhucUhMMGNUYW92WlROR0dCU2FaSmNRR05jKzZzUnAvS1R6L09CbkI5eXBh?=
 =?utf-8?B?Q0FweFZmQUZKSTlaZjRya2wvUEhFeUl6ckt5dFA2R2xxT1NUVnpMVjhnU3hH?=
 =?utf-8?B?bnI1Q2hVNUNQazlNMndkSGF5OVdTMFlZQUFKdVpxczYvSjFVU0ZmKytPUEgz?=
 =?utf-8?B?RWJnYXFYMS9STUVOOEZUMDJFdFZyVm9EQTRodG1jOWc1ODU1cndqdDFRTnBt?=
 =?utf-8?B?ejMzMjRzQTRPWVRqS1JDekJTWi9IUkJZenh3WlhQdk5KMnFlL1RObklEdHlK?=
 =?utf-8?B?QjM2R1N2UmhLUWpFQ29EZlJZS0xYbjVQYUI4WU54L2ZDczBoTjZLTDZPYSta?=
 =?utf-8?B?dDB2OXFuTzBzK1V0Mkx1TVlrMmt0RWZueWxtT2Y5cTJPWDZleUtyNHFWTHBx?=
 =?utf-8?B?eFY2MVhkSXpFRnJCVlBqSHJOOXdObzU2UjJtUUFXaVlKcUE0VjVFZVNTUUFZ?=
 =?utf-8?B?eDFYNmRZajUrU09hR0RlSzV4RklHWCtodTZlVTIrSUJGVHBzKzZDRXh2Z2tH?=
 =?utf-8?B?QWFxSm8xNGpXM29YQ1gva1NvRWpLczVURk5VMW03TnVoQTBxNFRBV1NDSk14?=
 =?utf-8?B?VmhmTmxCUWRhSUNta3h6TTV2UXRWVVNMSFpodEV1QUtYTmdKQW1iR1IwM3dJ?=
 =?utf-8?B?VGREVGhaeFpROUFIekpzSkloUmNvMVFEZVBvQWI1dDNSbjNYdURTc0V5RTl6?=
 =?utf-8?B?ZmNDd2t5MXcvdzFEM2R5Vjh2cjNNb0ErZy92M3dJczZmcEpzd1BYWkxFMko2?=
 =?utf-8?B?YmdYRFVvV3I4K2lnZUg0OUU3M1Q0Tzg0TDhJc0ZKK0xpYjIvWDRVNzJQM3Fa?=
 =?utf-8?B?WlM4YW1BT0ZxTVVTd3VrV2RlTmg3cjBXKzdyaGlnYzYrZ0srd0YvSGhNcElP?=
 =?utf-8?B?ZDFVY1haM051RmdDTVg1T3FzL3B2ZlJSQkhoVmxyVmNMelNzM0VjMkJ0YWxB?=
 =?utf-8?B?QWdVektrUCs4MWJXNXJIYnNDQjRVOU1BZCtrdW9GOXNZcUJCMkFNYkJmbUdm?=
 =?utf-8?B?WHV3Y2UrL0VRNTJEUUJodVVDdnVURWRBMkNldXdHQWhraEpLUlp1YWhLdTIx?=
 =?utf-8?B?VWZHbmZYTTZtYWI1TU01RjJuYSt1aTFtNkRETlpOT2Zyc2JiM0JHTmEwRVNp?=
 =?utf-8?B?eEJhbWM4SGhrb0NibXE1K1VrWFNEQ0xOQmJKMXhiYUVsZVN4SzBZV21sSEt5?=
 =?utf-8?B?bXlsbmRRMXExNkNuRnd5VlVhVkdoUGUwU2pMR013ZUx6dkd6MFo4OGhhYmJu?=
 =?utf-8?B?NU1jRTBsb1BWTjRHMFUzbS9nRkUxNXpzbWVVK29lYlFnV1BzaWNodnhrNVln?=
 =?utf-8?B?SHR2dm5wUlY3cE9TUUtDS2RDY2lwNk4zdEpsZGt5THRLS2JHUVdITDhEaE9h?=
 =?utf-8?B?clFCK1Y1bk85dTVzQmJEaUFkdmxyMnNIL0JibERsc2oyMU1zNGRyUW5pZlFN?=
 =?utf-8?B?RUpta05ESDlubS9FQzhqOVBLUVFPdEZSZDY4L1hLSEF1K3B0MVRvL0NoRTRx?=
 =?utf-8?B?dnY5MXJDelNNaUhrMXozUW1jTUg4OFVVVWtwYXdYaGRLUzd2ZTVOcG9NWUpt?=
 =?utf-8?Q?b+5rPAlpjwDihGyXDokpxnoSFN1g4XRnJxvPJaR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEFjdkt5WDNNbjRORXR0NWREZnRMOEQ3NVhQVmc1eU1UYlBkRVpGVFdIY0Mw?=
 =?utf-8?B?ckdnMGszSnh4TkRBRmRBZ3I1ZmhySThGdFdEOE1MUWNwdnJoVUJmT0ZQbGV2?=
 =?utf-8?B?WFQ0U3Q5dkQwdHpTTlFFNVcySlZjY0k1b2tIdTJFSnZGSDlPWXFFcW5yU1lY?=
 =?utf-8?B?aWQzZTIvalJXc3hKUkh6bjdHM2d1Zzl4OHB6Y3lJOWJoK0pQVEg0UENTb2xr?=
 =?utf-8?B?cTlaaFpKcjNVa3VUMnlZbTNycmJWZGNVYUpZcTRXMEZybFdGajVUQkhabjVM?=
 =?utf-8?B?eS9jbFA4bm5HYURZbklaYnFGUjlHOTR4aXFvSGk5bWY1aERpWGR4eDduMW5r?=
 =?utf-8?B?WEtrdDhMTFgrdTI4Z2RVcm1KbFF1UGI5RUpxMCs2dTljKzJ3Z0dyQWlKc1F5?=
 =?utf-8?B?TWR5Qk5PbFhqRTFrVURBNCtFM3JFc2JobU1nT0dmRU1ESHpDYU5pT0NJWTlI?=
 =?utf-8?B?eDhWeFczcDJrdEFLMlNVL2Q0RFZ2S201bXJkbGUvQVBEZHdRY1Q1N0s5RXZk?=
 =?utf-8?B?SXMrL0ovakMxYm5ESmx2ays3enRqK3pUUTA5Ris3NXZmRVVMN3dmVHJoL3pZ?=
 =?utf-8?B?RzdYUlpucytKWkZsMjJpUHlNNEVrTlZuaVlzWUtnMWc0YnNUNVoyQjlUMGtj?=
 =?utf-8?B?cVhLUUdvQ3ZZcUhPK3NsYnFtclc1NmJpWWdvTnMxWkdhZTU3ZkVDa2JKVDUr?=
 =?utf-8?B?dUJ3RURCV25DdlhNclM4dTlCcExBVE1HTnUrcVNvUjdTZXNZdy9ma2tJa0sx?=
 =?utf-8?B?RWxweXV3MWE3QjdXYW1QNVRTQzRFU3lDeURJV3VlWkRBUm0xb3ZucXVlVm15?=
 =?utf-8?B?aXFRMW9mUWxMZGNNU054U0lsSHQ4MUFvd3IrMnMyM2JJVEdBT3hKMFRKeVBV?=
 =?utf-8?B?c2ozR2RjSndEL2FOOXRDd0QyZ2ZpMTdZckxSVE5ZdHl0Z3NhTHQzSndlVGhz?=
 =?utf-8?B?d1k0SlRwWHd4U1o4QjcvalVobGxtOGdaTEdkTXVqSExYUDY0czZwc3E0ZTlK?=
 =?utf-8?B?S2xEKzRJaHE4b0IzaEMyaEpvREhyRHQxMnlWRmw4ODVmYlBRSEROQUtHZFlu?=
 =?utf-8?B?d1g0enNXQWxTVmNGcDNLZmwvOCtsUFV0aGtvZVEwRmFGRUxaZWhBRjZrRDIv?=
 =?utf-8?B?ZE1QMzBlcnd2cHFDcisxMTZwTXVScUVYL0tHOFFTbG9pK2hxMXAydWltQWE4?=
 =?utf-8?B?dzUyT1RLU0JzSUdpcjJEMEdESkVXSmkyQXRLbzhKdXl6bkFDTnVlSU1IbHYx?=
 =?utf-8?B?NkxkK2ZGdzRpUXFQWnhSSVJpTndjc24xQ2wrRTBEM0R3aUg2RVI2WlRKd1RX?=
 =?utf-8?B?RUQzclh6S1lwQm9LOTF1YWdzNFAxem5aQUQ5MHJmRUdYcnFxWmFBcUErb01p?=
 =?utf-8?B?K212UnhhNWZrSUJTNndUQWlLMTJyV1ZxK2lTZzZCeGtldW9hZEVHaFRuVmsw?=
 =?utf-8?B?VGlUZUJqYk42RjNSQXZzYUtWdy9qQ1ltSTRqRG1VTk9peXBnVnh5RjFIT1BK?=
 =?utf-8?B?MFJKa3pVbEJqNnc0K2paUXFUeGF3OXI2L3hIQWFMT2poWkVrV1U3RGJIRGw0?=
 =?utf-8?B?OFJmQ3RhNDFwankrRHV3QWpOQTkrakY4ZlJjdTNPTWxYbHE1cVRqdzlPQ0Vj?=
 =?utf-8?B?dUorbGF3Sk01OFlZRS9ZRDYrVXNQeXNaODluaUdDWkMrL3RQRnIzcERSVG9I?=
 =?utf-8?B?bkJpa0V4WXJBdUtQcW9Ed01GaE5CZjBpOWdWUTUzVEIyWUNIbllqUjV2RnZG?=
 =?utf-8?B?YVFWSDFYK3V2bEZ0N21JdG9xdUVmVGhQSWhKQVVaaHowNXM3ZzJNaFV1Skxj?=
 =?utf-8?B?cnc5bERwV0tPMjFnNm9QcnlkdTlpeS9TaVZhSXp6WXdjRmQwdjRIM1BlR3JT?=
 =?utf-8?B?ZDREbjFSZzJIclN4Z05qbkNpRXhrQ2U2WkJJRE10a2h6VU0wNDdrSjJUSGUy?=
 =?utf-8?B?ZDhXWmlyYkZXa01hMG1hcHRlTTlHbXNzNVk1ZzFvVkJlMERSZGNqUjhScWRq?=
 =?utf-8?B?L0RWR1BoSkNzUm1OeCtkUURicnNIWVJGeDNlQVJobVphWTlzOG8rUjJJRlpr?=
 =?utf-8?B?TWlLSUxGUTBhd1NNZkcyL25CMHlDL2t0YUhSeXlFeWdpdGFCZkdiSXhNeEFY?=
 =?utf-8?B?Tm4rMkJnWldxeGhjSW9TTmJlbWoxZmhUTEJUTG5HbllFUG5QdzJIcFc4S242?=
 =?utf-8?B?WHc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 382955be-bac1-46d0-c8a2-08dd0944b05a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 09:21:18.0840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oekEmiAVWvweOze3Z9YGD5XtpUQZryM8VL9bz7qIPh2xE/sdSSW5jx+8P0Vx2GLyCdWBmdNuWhytlzObw1k3Po2y/0B+Aff+yVv7cHxHGnM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9976

Hi Krzysztof,

>>>> +
>>>> +  gpio-reserved-ranges:
>>>> +    maxItems: 2

Would it be better if I removed the maxItems constraint? Looking at it now,
I think it should rather be minItems: 2 in order to allow the user to
further remove other GPIOs.

>>>
>>> That's odd to always require two reserved ranges. Does this mean all
>>> devices have exactly the same reserved GPIOs? Then the driver should not
>>> export them.
>>
>> Yes, the driver exports GPIOs from two hardware modules because they are
>> tightly coupled. I export two gpio-ranges, each one corresponding to a
>> hardware module. If I were to export more gpio-ranges, thus avoiding
>> gpio-reserved-ranges, it would be hard to know to which hardware module
>> a gpio-range belongs. I would like to keep the current implementation
>> regarding this problem. Would that be ok?
> 
> I don't understand why this is needed then. If you always export same
> set of GPIOs, why do you export something which is unusable/reserved?
>

I will detail a bit about SIUL2 GPIO ranges here:
SIUL2_0 exports GPIOs 0 - 101
SIUL2_1 exports GPIOs 112 - 122 and 144 - 190

Therefore, we have two gaps: 102 - 111 and 123 - 143. This applies for both
S32G2 and S32G3 SoCs.

AFAIK the only ways to exclude GPIOs from being exported are the following:
- split the gpio-ranges property so it doesn't include those GPIOs
  I thought about doing this but I think this would involve other vendor
  specific properties in order to know the memory region to use for each GPIO range.
  Currently, we have two GPIO ranges and each one maps to its respective
  SIUL2 module.
- using gpio-reserved-ranges which is my current approach because, in my opinion,
  it is the simplest approach.
- registering multiple gpio_chips
  I know this approach is used when dealing with multiple banks. However,
  I think GPIO banks would rather apply to SIUL2 modules and not to our
  valid GPIO ranges.

What are your thoughts about this?

Best regards,
Andrei



