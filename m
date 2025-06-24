Return-Path: <linux-gpio+bounces-22108-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC935AE734C
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 01:34:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A92D17F8DE
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 23:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA7126B74F;
	Tue, 24 Jun 2025 23:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="SGm9+MO6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2108.outbound.protection.outlook.com [40.107.223.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3D025D20D;
	Tue, 24 Jun 2025 23:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750808023; cv=fail; b=mebnnSOL76rUClox5xXytAWAkVabnxBHmiLzyj7O98T6D2FnI3CXxr+BnPesVJurgYrlY3/HKfgnwq65vf7S2gOaiCQd9DaOOCva0JmFI+JlreruM+D/wZIZK1Z5R+DgKkTHpMsJ8C38/+sJTsuvT1916cBiysejOuvodK7KNos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750808023; c=relaxed/simple;
	bh=SQEfUI7PmvRtl+K3pybxaR2klze3XAfxYXi+Im8Vhe0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Cu9M1hra/dGaXqNe6WyrdZrV5zeEt41trNQgXnSHG+RkpazQzYxfFTmwLkEhA1/Wx5iut2qXIZ887RC0+ajESR0OqPg49nZlL+cKET0VxRkvbxRvHQyspsIjrGAJ6J4B3Y8yZU6+rb3bVqm16fTMZtKlhgniwO8bgpLzmpLnsw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=SGm9+MO6; arc=fail smtp.client-ip=40.107.223.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p7mGvXaSFLLTThaZ6bME++xnpUmL0VJO6viJeJhi6Emsh93qyGzE8tHfzBXRGSN68CYc0vEIRv/C97LYvR+vrC+lWJEt3pMEmnQNbn+UpA+49NQzMOV0P1il6N+7SUzrqeL+orX/MaS5fcD7YQIRu57M+K++eJovMcVXMCFfbjQb5dWjwaFucWMbtHZNEvrIXWUrgeYBfzuclXjxHPkm1Bcwrfw/wVsNDMuVrW+IMbCbHBQ/97zmCAbIrqRlkv2tCt2yels0CqOQ6tMFZc6SVxaqH3Vg1ezdlJ71+FxbGjTb2Esgkq7gG2+OwMVt3k1Gh7DQUX1xMf1sWfntlchvtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SQEfUI7PmvRtl+K3pybxaR2klze3XAfxYXi+Im8Vhe0=;
 b=BiAylprxOY7xxu830ikK/YRTIkLtqaRED4we7n+Kv0ysMhPesIMdWM7fuex6R/yFbXZRoQoC9bQr1RnpzFTskc/7rapJE3XLr9cGx9Uug197uOw+BXqJbCvOAAf/B9BO7fQfSkGAWp7SuztlL8ERuDBQDVrZFBySXgASgdZyX2b6gqKzcCoacpmosLUuNhSBFDQhZhibcIASy7BaH9tET1tV7f2GBknsRzoNkLWhtS1ziK3OK3W4EV1klQadGwAx5CsnA5KYERZivF971ZHYlF8GjKkGDLsBs9iEEAK2abt49g7yE2WocUJDJ4+zQYL+jQVtf6CG/qXhyaOo2dFPTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SQEfUI7PmvRtl+K3pybxaR2klze3XAfxYXi+Im8Vhe0=;
 b=SGm9+MO6Tyh9gqWM/YcEv1j9BRrYYSkLcNTA7+/MZ3VnyeswfOJYX7G+gi6SOe6yzKaznGMll9HQP5SlQXwLGTD9ZmVYvEDdlDBBg0w8q20hUYv2GM2HpryQZDDOkIZOI202GhF1SPj2IaRGN1UBOEGKXXAZg/Jbq5ml2rn0Z8mhU3jNXZylh4umCfx5m7dekkJ4/xbRcsiD7DojYnv2ecg69feaHjekJJKZqS51jXhd3MLQj0VUY8gL+xaswjQkJ+hHajsjFg/niVrkHhFA0gP/sgcVyTrW8Jth6rS8U9Y4HADaLQGYH8EsJIQYBbBD73lf3PxQ6tV4kSVpjt2OQA==
Received: from IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 (2603:10b6:20f:fc04::c3d) by MN2PR18MB3525.namprd18.prod.outlook.com
 (2603:10b6:208:26f::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Tue, 24 Jun
 2025 23:33:39 +0000
Received: from IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 ([fe80::ca34:e235:13d9:3f5d]) by IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 ([fe80::ca34:e235:13d9:3f5d%5]) with mapi id 15.20.8769.031; Tue, 24 Jun 2025
 23:33:39 +0000
From: Harshit Shah <hshah@axiado.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
	<brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Jan Kotas
	<jank@cadence.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "soc@lists.linux.dev" <soc@lists.linux.dev>
Subject: Re: [PATCH v3 7/7] MAINTAINERS: Add entry for Axiado
Thread-Topic: [PATCH v3 7/7] MAINTAINERS: Add entry for Axiado
Thread-Index: AQHb5GRHbOI6r4OBw0KU3tf8Bb/bUrQR3nYAgAEZkwA=
Date: Tue, 24 Jun 2025 23:33:39 +0000
Message-ID: <73e7df5e-14d8-4d8d-8e26-55d2ef262f1d@axiado.com>
References:
 <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-0-b3e66a7491f5@axiado.com>
 <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-7-b3e66a7491f5@axiado.com>
 <085d5ebd-515c-4608-825b-b3319bc3bf7d@kernel.org>
In-Reply-To: <085d5ebd-515c-4608-825b-b3319bc3bf7d@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PPFBEC4B1F8E:EE_|MN2PR18MB3525:EE_
x-ms-office365-filtering-correlation-id: c96df7c9-71fc-424d-d5a2-08ddb3778c43
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?cUdaYTVScjZzUWh5TXYzbEFEd3VET3RNY0QvV0tJWkxjRHdzdmptbXRWOG15?=
 =?utf-8?B?cHFYMjJUaHk5b0dtVmVKL2lKVTBtRUZhd0dvMUkydlI1UXBNRllXVm1TdzJ2?=
 =?utf-8?B?K2VVeVkwUW5lVXAxRVo5aWowbnpQTXRrdUlxUzNYWWlXT1U3S0NoQWV2VjYx?=
 =?utf-8?B?VzlWMUhzeVplVFJYd1RlWTI5ZVpiQ2d2b0hVQVBUSXFZcDk0SFo5dEY3UzNh?=
 =?utf-8?B?WFZqcTZKZ2VESzhQaVVEV2ZSZ09kZE9ROFIybTR1eXN0YlNzTDlEcnZhQ0hT?=
 =?utf-8?B?K0V3RkJyakhlRVlGSkthVytWZXo0dEoxUVZHUjRQaGg2aS9PQzdCVjg1dHhn?=
 =?utf-8?B?d2NNRDVXSlkvZm5IRTAzQ1Nmd0lRWXg3Ti91TjM4WFdqWXp6dGR6N204dEZZ?=
 =?utf-8?B?cHBPUzZQdEpmZVBLWEg1dkViTlg1MkxSZ1lBd2ZGbGVDTjN1UVU4RUVhQmxF?=
 =?utf-8?B?elRWMDhzSlIxZFo1akpuL0trTmIrdmZsbmk2dXJBMXh6TzJWWjhRWkhaOTgx?=
 =?utf-8?B?eWtPZUI3SnYxSDB4eVFSQjQ0T1FDYW1YWXAveVpHM0t3UVV2a203dkpHZXZp?=
 =?utf-8?B?eTlISEZza0JyMUhMQTRlS0UzNjBmS2ZTajVMOURrSXEwWHhvWmpjYTd2K0Ra?=
 =?utf-8?B?U1c4QldrRjdGbFd2SWpsbytjbWJWVDFlRUVFTDRiS0l6K3hmTHI5RUhkc1BK?=
 =?utf-8?B?V1M1UUlkVkJMUEZUTjhXNEF1N2hHYXNiSk1uTkQ1cDdNK1crRDloT0M2cTVF?=
 =?utf-8?B?VTlQSFpUK2FDa3k0a0xValZwc1A4YlFwcjlGWTBHUmVLMTUvaWF1eVZ0NmFz?=
 =?utf-8?B?RUQ5cEZUcHVEaHZwSlJEcGlXUG5TYW9GZXVxN2x0NTUrK3RvVzdoY0VGSkxG?=
 =?utf-8?B?RXNucHBndXBkSnpxTVdOUmhJNSs2bzUyNjdNU3Vud1lFcG9NUitJYnNPVFpL?=
 =?utf-8?B?TjFYNmZNTDNvTHBON3R5cmc2TEtKMlg0VW9jMjh2c2FOUVduYXBxSDgzZXRq?=
 =?utf-8?B?M1U4Q3RVeE9JWmwwWjVUOWsyS1pQS1ZQTWpFUGRKY0w2bTVjc1ZtVldRQk5l?=
 =?utf-8?B?WDZVUWJRUmFGMlJrQXhnS3JYdGx4R1kyM1dTamcwTGI3NS9BdnlPREw2SG5R?=
 =?utf-8?B?aFJNb1orNFUxSWpGanYxN2kya3hyU2poem9xMnprSVdHVlMveUR5UnZBdFV1?=
 =?utf-8?B?NzZnc0czbFlmZ0tROXVqK0Fud3Z4MjZmM3dCSWNmQVAyam1iV1hRbTd1Yjcv?=
 =?utf-8?B?c1QvdHBWd1liZSsycUZEZHpoWTJiRUkySTk5V3IvN2NKMGJiRGZybU9YWlEy?=
 =?utf-8?B?TTZVdG9XWGpTaWwzWDlmZUMwQ08rcVhGWUJia2F1OVdGWis2RmRzeEtsS3Ro?=
 =?utf-8?B?TU94b1Y2MjNlalhjblArRThoYlFtL0gzSXArSFk4NDZXOVVYYXNjU2J1MXZh?=
 =?utf-8?B?TkJVMUQwOXZaSWJKMi9pNjVncmlkdTdBY3A2bFlTWTdJaTdqTklucjFFWmht?=
 =?utf-8?B?cUxLQm0xS0JuQ25BeEdIY2JIUDA2QmVJbWtVc1B6UzNWdGZFQXY4TDIrRnFH?=
 =?utf-8?B?NFQ3YnlEenY4MHd3UStsZ3hCbXZESTdUMUxheUowNmlMdXBiVTQzVjRMaG5m?=
 =?utf-8?B?aFNNSnVrcUlLWGRTcHRrRy9ML1pkVXdmcG40bFJNYjA1NjNSeEpMdlBnOGdi?=
 =?utf-8?B?QlVvdVpSMVRHOGF6bGE4TE5nQ3RLS3BFeXNOSlBmMUV3WVk3OGd4UEdMUjhS?=
 =?utf-8?B?Vmo5MkswL1Q0cnlWRVdLbE5zUzhEWWpia0pTN1pTb0xmamRxYmRiMG91RWJX?=
 =?utf-8?B?dTI0N0srRklJd3poRE9McjZtL1dUVXJCNG1yRkd2SHBEZjNuZnF5TXBUNVY2?=
 =?utf-8?B?RU5wSGdXRHlWblFialhNYjRGM3VFenZqSDM3N1RweEdiZXhDMnA0M3BkK055?=
 =?utf-8?B?RGRJNUlPalg4dnlnMnp5TklZaS9DQXBVV3JZL3Z6NE5CNUljelhRbCtxVFMx?=
 =?utf-8?Q?H8DfjYtaVEuu0qOjh/Aiq4GewwXXd8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PPFBEC4B1F8E.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MUtyRWl2d09nZXV3c0JjVTdKU2YzS1paRlpPNWlyS3NpNTNyVWZaQ0ZoUEI3?=
 =?utf-8?B?WnhLK2xHNjV1eEdkTEFuTFVuK1FOUkJCQmJiWWxKbXdnVDY1SDNUWm5OUGww?=
 =?utf-8?B?eGlreDd0Zmc4NEZZTVJoVG5oNVZEalJpMVFvQkF4ZUx6L3pyVjdOQzJqeW10?=
 =?utf-8?B?dTZUYnZLSUo5S296Uk4yTjVBcWdWeWpVRGlrbHpZZVJvcW40bTQzVUlJYkJ5?=
 =?utf-8?B?TUlmaGpFem9pb0x1dXJHZzdHVVcxWGhlQUxMS1ppcjhVTjhVV25GdVkxRHdG?=
 =?utf-8?B?YWNJSkRaWHFrKytBaHNxQlJ6RWhZTS9nUUN2VVlvTHZwY2FjOGlpU05nNWVD?=
 =?utf-8?B?c3FGRHM4eG16QUxZZWpyakhRTDFMMFpTaG9HTWNCMCt3R1R4a2l1c0x5MW5t?=
 =?utf-8?B?bnlBNnplcm0rNFRWbklvbUxWUWZmQ2FwaUJmWnVyaXJ5MnhleG40MkVFTWti?=
 =?utf-8?B?dTBtVUhMdDk1LzMxSWZoWlJKK3lVNVFVVGVWQzkyVjcwSzh1Y3cvR3g3VEpT?=
 =?utf-8?B?UHAwUHZIekpIbjVmUTlGZDBIVjFjQjlSTEtYa1V6WWRKNHJsNk41UnRpTHF3?=
 =?utf-8?B?VktadXBxNG5DbENSWis0bHlmTlBxaDhvMGI3RjV1WWROWDlicTdCZWRlVVlN?=
 =?utf-8?B?NG82dW9Mb2tuTHZXZHQzaG9sd1lNNkpYSGxZVXJtVzQxT1JRTzY1N1RpN0ky?=
 =?utf-8?B?cVBFYi9Jb1c1N09nemJpaDlSZW5SbTdYL0tkTWlIZzVxbWFlNUlWWGFuOUg1?=
 =?utf-8?B?eXJaRHB6b3ozbjVoOXFGQ0tyZXUrckhzdGo5aW45TVZHbGFSd0d5ZzNHZGNT?=
 =?utf-8?B?YVkvTzVKNHJRVEhsSnRNam9vVTJmMGZ0ODlnQzBhR0o5TTREclh1bmIySzlN?=
 =?utf-8?B?WUF2cGFxSElFOW9IdEc4NlIwOWNjZWZHUkdxNGc5RnZMMnFudHBMTi8rQ2tL?=
 =?utf-8?B?cW1wSnRuYU5ETFVEejMzM3pUR1hSS29UUmdEbFpKRisxY3ZvWjZNRXp1QWQw?=
 =?utf-8?B?bkN2RWdxZ1phYW5OLzdHV3pCSHIzTDZyR0dTZkM2cWhlTGU3bVU5VVljcENy?=
 =?utf-8?B?RkV1cHR5YUZJTVQ3Zm8xN3lHTENzTnpnZkg2eDViNWEzUGtXaEliRFFhWHdU?=
 =?utf-8?B?UFJ6VnFnclptZURFdXNobVFYTmFsdU5sKzJBMW9uak1UTXZVYVBPcVZvWDVa?=
 =?utf-8?B?c015TUVqbm1yY2cvZEFyL0JHSHFMUk0xdENOMmMwcTB2Zm5Hd25CL0lNcXUx?=
 =?utf-8?B?M1NQQ20rNnVRWXptNndPTE9xUWZsTjF6SE5ZRUZCNGFSM09RdVc5WDhPQVZ4?=
 =?utf-8?B?dis4d21EWEVQTU5MckNFcEo5cll4b3JNcCtiR1ZpaktoK0hVOWZ1cEVwaHQy?=
 =?utf-8?B?dis3MWlPRXVLVHoxM3BaWXRvZVNPOVp3ai9mSTBkQkxLaXNwTXFHUHZpLzha?=
 =?utf-8?B?WWI0eUl6bG1selFOTDNCQnk2enZPMXl3a29PaThyeGZYbTdESHlrM0xzWTYv?=
 =?utf-8?B?UGZwZlZoL2xFTUxmL0JVSHRWQ0hJcjB0aE1EMFpqeWtZWXhSYytMVFY2NkRZ?=
 =?utf-8?B?a0s3Z3lwbjVkQkRHd1Zsd0RxeERzbklITloyZHh6ZkVZM3RTREJmcFhDZVBj?=
 =?utf-8?B?YXVtTHBuV3o4OEh4cFV6NWRDVXVaTEppMU55dEF2TzJLdHFrelJRb096UHVK?=
 =?utf-8?B?NnFFZ3loR3FJWXF5eER4VVZoQkFScXVMRllqeTdyWHpFWW1UeDB2TWFmeS9F?=
 =?utf-8?B?SVJ4V1YvajhqaWgyS21ZZDd5MEJhejNSNnY5YTd1R3pJbWltZzZLdVN6WVFY?=
 =?utf-8?B?bWpzSFdmWTFQSVpheTdUTkQ3ZkNiZ1RkTlA5cmFVWFFhQXMra3VFSDhvc2sx?=
 =?utf-8?B?Qk80OXJXYkt4REhOZHgxMng5ZnZxb2ZTdFhQZlVxUmxycnQvY0tPaWJyMDY5?=
 =?utf-8?B?UE14bHFQMUFmU2U5Z2lJakd6L0xROHl4ZlZIK2ZmWmErWnpKYlRxWVlCeHd0?=
 =?utf-8?B?S2RzZ0dWOVFVV1lLUzNwSDBCd0xNYUFYTmVpR0FDWUd4RFhZbWdUa0JCNTRT?=
 =?utf-8?B?Vk5mbXd2L1h3aGttZGhTbUFrRVJvWDFubU8yYVdnN3ZyRjJhd1dXbzdwWHV2?=
 =?utf-8?Q?BrUM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7FE41AF28701814DBD2803641BCC09EC@namprd18.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c96df7c9-71fc-424d-d5a2-08ddb3778c43
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 23:33:39.1835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jMtkQpy71BPezo3diDL6h0dXCrKvyxzGvgXwSrWQivRAacMfEe2pPvJxf8980OeH31ZJTP6h+IF6yWIEQS/Kag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3525

T24gNi8yMy8yMDI1IDExOjQ1IFBNLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPiBPbiAy
My8wNi8yMDI1IDE5OjI4LCBIYXJzaGl0IFNoYWggd3JvdGU6DQo+PiBBZGQgZW50cnkgZm9yIEF4
aWFkbyBtYWludGFpbmVyIGFuZCByZWxhdGVkIGZpbGVzDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
SGFyc2hpdCBTaGFoIDxoc2hhaEBheGlhZG8uY29tPg0KPj4gLS0tDQo+PiAgIE1BSU5UQUlORVJT
IHwgOCArKysrKysrKw0KPj4gICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspDQo+Pg0K
PiBSZXZpZXdlZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBs
aW5hcm8ub3JnPg0KDQpUaGFuayB5b3UgS3J6eXN6dG9mLiBJIHdhcyBub3QgYXdhcmUgb2YgdGhp
cyBiZWZvcmUsIGFwb2xvZ2llcyBmb3IgdGhlIA0Kc2FtZS4gSSB3aWxsIGFkZCB0aGlzIGxpbmUg
b2YgdGhpcyBmcm9tIG5leHQgcGF0Y2hzZXQgYXMgcGVyIHlvdXIgDQpzdWdnZXN0aW9uLg0KDQpS
ZWdhcmRzLA0KDQpIYXJzaGl0Lg0KDQoNCg==

