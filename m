Return-Path: <linux-gpio+bounces-22312-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E11D1AEABC9
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 02:32:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86F87566577
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 00:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32379D27E;
	Fri, 27 Jun 2025 00:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="fM+Jt46p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2104.outbound.protection.outlook.com [40.107.95.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B678259C;
	Fri, 27 Jun 2025 00:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750984330; cv=fail; b=RxuQ3LYF3gCmBnuIINsp7ojB3vkrguIACNEhDNFoQiDrL/fAAxmmUrCUlKgwwcEX1JUxdk9OIgNvrvaJvCtnDA8rnGeCcA1LPJ7WVJkY9JRwp5rodqbHOkYApda/HNye3pv3NDpImwYfRBIAoqrWuRoRkvcTXEFERScbD8Tws+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750984330; c=relaxed/simple;
	bh=3x9tYc5h6FxW2C0mMAvUDBf1003mGR7fgDTVta8J5uM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SyiCPTmXidDQz/2aMxAbxbmPgcLm8A7iaY+PCctaBffL8UZmMb/R5YtJ4CjPI6AlFyLc05pAbd6Y+oHuQw/soH8a8seL3BvSGJR1ykvDegr9i5d+BUkwLrOA5hzCVcIIgOb5mOLisvLGJ2gZ4b3sGqSh9PVl15ulrzYAqYx5MhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=fM+Jt46p; arc=fail smtp.client-ip=40.107.95.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WJNGsfCN9L6Zg/sdGoE4me5GcuNZLDd4Zhs/py85wBAsvHwaUlKTix5vWLPPqgytxrZW+pilq9AtZn7pNvNNDFX/n7yodq0avubIYzLU642I0O/0u67s1DqKBc+tY+z7lWZvyVH57G3J1ZMfJAukV370pWpqoB3LA5FeeWjP0oG6pCRRx4lBpkCHynnSzSh08Or0CVd1ovo5OB7M9TPV6ZaDhGHYyLPPcnAMRffC7LhSez2TcTP2B4sz0lWrn9kendeRW5ko4IjWQm7NugiTQmRgiZsxyyYFRIOJEy5RtW2j5UFNMB/+jdki0z8HRkPNxb9UUe+aGyDt2DERHyWJgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3x9tYc5h6FxW2C0mMAvUDBf1003mGR7fgDTVta8J5uM=;
 b=T6KWB+irCOo86kIqELoGy6P9X0foJ5cwDExgEhCVUc7KJR+2eaRjdgFyMZFzGI1KbthPfzfvY+Q9hKL8a+u1LkG84ZrQhKRIW70rfoLQVwY6Ru6IpKuZVVGdDt6VBFRZrMsNTnwGXBrYORmEzWsqfYbHJjdjMt6Bap9AVIwpqCN55O7HfNCdcptELlyEsbRYVIMN6i9n5BByoPUjVe14XWYHiYaA0/9LXU+o1roeQqkdV2X7qeQ9k8dG/gyjndZS8stvYlp/qdCIyPmxwTxEjPaP5mqXbi4lTi0c94akR/L9hKQQn3N/QaQ2qGqgbfH+17YvSJzjHjoLG9RXGjgW9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3x9tYc5h6FxW2C0mMAvUDBf1003mGR7fgDTVta8J5uM=;
 b=fM+Jt46pl63u++FEailiD/92uiMYCROqwegcsAPNDUywxaHJnc5QxiGNRXy1iMe5yXjocO6+mV6THeCMl0C5OeHQG3WwkdSb7bBEsBInCPYYkrJMkp8FnvYlx9wpRjRchPefqivQ5W2flON5AvJgNdcxZ7XzslawKS0YDsUdJ0swbradVb14QzSohXeLUyBa9WmNy/LuCQj7gwFulXsy4BtM7JQsemCv/GbTSBxmm4Yyn36rKPVA/fTVwN1Qu1dINtEjmaaZwygIMcrZEfCLH78xNB9dKnNgRYQq8WlRp/dO01a7mYFJTWrQ8INl+LkOf7FfT5GvC+2nr2rIG+ds/w==
Received: from PH3PPFA7616390B.namprd18.prod.outlook.com
 (2603:10b6:518:1::cbe) by PH0PR18MB4008.namprd18.prod.outlook.com
 (2603:10b6:510:49::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Fri, 27 Jun
 2025 00:31:51 +0000
Received: from PH3PPFA7616390B.namprd18.prod.outlook.com
 ([fe80::a2b2:22f9:65da:3161]) by PH3PPFA7616390B.namprd18.prod.outlook.com
 ([fe80::a2b2:22f9:65da:3161%5]) with mapi id 15.20.8769.035; Fri, 27 Jun 2025
 00:31:51 +0000
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
Subject: Re: [PATCH v3 5/7] arm64: dts: axiado: Add initial support for AX3000
 SoC and eval board
Thread-Topic: [PATCH v3 5/7] arm64: dts: axiado: Add initial support for
 AX3000 SoC and eval board
Thread-Index:
 AQHb5GREkMWleVUwnEujC+sUqBlKs7QR3j8AgAFHOACAAEApAIABRb8AgAB6s4CAAQbkAA==
Date: Fri, 27 Jun 2025 00:31:50 +0000
Message-ID: <c36eaba5-5e42-4328-91ad-f25ba6a8e9b5@axiado.com>
References:
 <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-0-b3e66a7491f5@axiado.com>
 <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-5-b3e66a7491f5@axiado.com>
 <0709a0a6-1313-452c-85e7-2926a6a03741@kernel.org>
 <19d78e69-4a38-420b-b9f8-d0eb90cdcaf6@axiado.com>
 <a0feb67f-3a73-4247-8383-7255616cb22b@kernel.org>
 <a6e27c0e-0703-4444-b6e7-d4db1340e802@axiado.com>
 <3660b275-8513-4017-aba4-5c4432eb5b6b@kernel.org>
In-Reply-To: <3660b275-8513-4017-aba4-5c4432eb5b6b@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH3PPFA7616390B:EE_|PH0PR18MB4008:EE_
x-ms-office365-filtering-correlation-id: 11c2c90a-ee80-4869-a67c-08ddb5120253
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?OW1MQ0R6VHRXYmJiYmY5SHBFbWlibVFtWWM5eW9UaGs5a1VDWDlsRXYzWFVC?=
 =?utf-8?B?NGxSS3dMWVN5dzh4ZlZmMHBxZU1KMVRlM2lpc0o2OHlpZWpvWklWS3Y3SVJL?=
 =?utf-8?B?UEJTR3hzelNGY2I1Y0VscVRKOC9pRXFRWlIzQ25WL2plWXIzdGpicHhCYnlW?=
 =?utf-8?B?U1JkQ0R2Q3BwVVdDaUVQZlIvcEVEcWtpSEN0anZNQWExY2M4UWFPVEpqNkRX?=
 =?utf-8?B?bFJadWhIT1RqOGtRWC9kZ0FuZmFNdHQ2WUE0RUNOazl0UGVGcUdJeW1udkxO?=
 =?utf-8?B?ejdjYm4rd0xmQWdJTDJMaTlkZG5ZNGpuL213TjB3UndESzJLbXV4cUFScmI2?=
 =?utf-8?B?ZFRTcG10NlpTaE56dS9IUktoMnN4N0xCcnJkV0hjTkI0ZCt1bkdzUUhOcmpL?=
 =?utf-8?B?SmZCaTVSaEh5aktvSitzdStLL2ZDUG1iYVBiSXlBc203UGY0dEZBU0JiOEpZ?=
 =?utf-8?B?aFJVak5YZzlJdlRaZUU0dEFoUVY2bkFSQUVEL0VwcWdnc3phdkpkNGZFbnI4?=
 =?utf-8?B?cmVvYTliQy9lM0tCRTRqN1hTbWVwSTVkbHZFcndhVlZjdWdzOWhvZ09SZFFP?=
 =?utf-8?B?TUZiZ1UvL1c4TVNvYmFsbE1OcnZ5czBlcEVqOU5QaDhVQWlwYVpZa3htZXRV?=
 =?utf-8?B?WEgrekJnTkovY25reHhraFV2cEM4L3BvQXRucndSWDNDbFdVenFKWWdBck1u?=
 =?utf-8?B?Tk83S1JWQVVTbEh0Q2pDalIweGtqQlJLOGo0WlltUzdGV1l5Qi9VWlduZThS?=
 =?utf-8?B?ak9URy9wWlk2cnREaHdicGROZndncHdFNU8wSXBORm5qNWZwZGdzL1ZUMXdQ?=
 =?utf-8?B?TU56UHE4Z25ZSUwrRlk2c0IrUVdXb2RFNkV0ZEVCTHhiRDJlVzFCMnNweHNG?=
 =?utf-8?B?elRtUkY5RjdJd0RqYk85bnBQQ0JCZjVTYXBrQmkzWVJIVklyVE5EY2x3Rm9Z?=
 =?utf-8?B?VjZkL0thVDNobFU3eXUzaW5nNnE4QWNiU0Y3eFJNVmZiYXZKV1ZSa1cwWnhK?=
 =?utf-8?B?alY1NTdudVdiY00rUG92WlA0Ti82MGVxcGJIaHJRdUNkWmtZZ3RydE5yZURv?=
 =?utf-8?B?WU9MNzJQa0xZcGxJZFpaYWlHb0tIVnB3dTVldFpIZnFzSkZXd3ZIWkJLajhW?=
 =?utf-8?B?Tm1nUzgyVkNVNmhxTGo5aXdscktBdHl6RGpOOUlseXR5MUlwY3RiR1JhSXRs?=
 =?utf-8?B?ODdWU1NJNmh2bStxN3lmZ1Q0ano2bmNKVWRONEN0RUpZd0poWFNwWTVXZy9O?=
 =?utf-8?B?U2U4S09IbG5ZbDc2NWlaUlo1YjRJdTh2SDNueng5YjZMMEhTWHU0V1VJbmIv?=
 =?utf-8?B?L3E2enVIZmFvVEVpc3ZtOU1vd1Z1bTVtVTgzRklaMFNDeEpmNHBndWY5aHZU?=
 =?utf-8?B?N2hPNE9XVk5QZ0FzdkdETi9LS0JSd2Zsd01yakt5TGJqRE1QZFhsbjhXem1a?=
 =?utf-8?B?MStjS2Z4OW9NbnhFU3F4VllQaDZDRGpVQ3pvL2dhUlR0d1Vwd1ZGVUdORGhG?=
 =?utf-8?B?RmtIZmxnQlBaYkFmRmt5ajNyOVFobjZRRldQTnZQV3pna0EwUUp5YjdyMUJP?=
 =?utf-8?B?dmtVcTVNTnlLNnlHZGNSYndIblJ5WkVCQTZvVjAvck83T1dMU0lsUUNyTEQv?=
 =?utf-8?B?ZGRwRk5wM283WjM5ZTl5K29jS2VNS3dNQmxUbEJoQTY1MWhaTEpialFnTGZ0?=
 =?utf-8?B?TzZERHNPeWNHdEdLWnlqN0RPSktOWlZIaisvaTYzWktWQTdDK3dOQWozeW5Z?=
 =?utf-8?B?b3pnTVl3WHUzL3ZDUCtNN2RicTVRMU5sMGhpcVZubTA4YXY2aFVHVXVPT20y?=
 =?utf-8?B?VVhtcm9wU0JRRDBEakF0MTlVQlhOVmVld2Y4K3dwckxFY2lhbVlEYXlaZGtl?=
 =?utf-8?B?aTZ2bUkrS2F2V3FQWC8wWm4yRUNaWldoekdwWHRpS0NwL2hzZDBuRXhYdkZE?=
 =?utf-8?Q?r37tpDK3JvEm8G7pKqVoTB5tT9fzwBzt?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA7616390B.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L0IrRFNnVmJBYnRrMG85blB2VGNVOXVjaHBOOW9pQXA2TjlyZmdzZUQ1STFG?=
 =?utf-8?B?N0QrRHRWTVE0MDhnYnExdSthMFk5TnVvcUdESVYvRUxyQ3BGRWZWWjlZbFpB?=
 =?utf-8?B?Q1BCeFhRYzF6eTFkYW5RR1B0a2pZY1NPb0N6a014a0F3M01YTnhPZXRYYkZ2?=
 =?utf-8?B?R0IrZWZUenF5SUkyek9EaWN5bjU5a3QrWGluc0JGU1gwUld4SEhYbktsVmln?=
 =?utf-8?B?RjBWOWU4L3BLZzdOTWFsamtHYW9XZk04ZkRPVjFRYzErMlNJM2dTZG9jMHds?=
 =?utf-8?B?QlVzcjh1YTc3UXRuVEg1U2tDZXdYbjlHQk9ZUU9mU3NpRkszeGk4cTB5K3ZO?=
 =?utf-8?B?RTlITldSdVRLWXVUUTdGUkZoa0xtQnpoWmpHNnl1MnBrL1Y2cm5jOXNCMDRq?=
 =?utf-8?B?dnhqaEIwUGZ2aDYzakJyYTZMODBhNzVscHA1VkxwNlA5ZDBnZzhoOVNSUm5F?=
 =?utf-8?B?VllHbWovMnlnMHZZRVd3M3hId2lVVThrS0JCdkJuZmZFYjU1cTBBUUdHY0JO?=
 =?utf-8?B?dXVncisyYnlna0NxbHE1TUNWUTZTN0VsWmxSejdnUjIya2J1Rkw3MEdFcVBF?=
 =?utf-8?B?OUQxc3kwMU9vRXNQdFlJMmYzd0JZRHkyeWJ6UG1Ed2FEOVdNQTc4L0w2OVpN?=
 =?utf-8?B?bG0zczJmY0tJalFHWG1CYUpOaDZjWXA1aDM5TmRsNk5iRVhEeUxLakh5RS8v?=
 =?utf-8?B?YVBrRk1SZmVvdFdMWFZIVUkyU1FZcG9UV29qZkFkbU5YMnM4Zmx1ckViL2x3?=
 =?utf-8?B?dG1qNGo2UThhQmRDNW5Fc1J4WDhmdTRxTGdlQ1R4NU5KTHdFeHFNUlNoL0hN?=
 =?utf-8?B?OGdleUR5MWhuMDFoeHR2Z1dPYzQyclZ2R1JLeGhVNmFsc2QyY1djMGFCQUdO?=
 =?utf-8?B?RGZxTU9QVlk2NHY0aWh1SC9tWk5FanlaRUlTM0VEbnltOUhLQTVydVh6WjZL?=
 =?utf-8?B?VTNDUzFBMCtHTElpU3Zja2dmZEhmdnFhQzZLS3ZCMjhvSDZLUXRkYko1WEg1?=
 =?utf-8?B?ajZYdEpzbHhwN0tkMVpsNVRSSkMrcnJsZ2RnQ2dxWi9NdDJJa1Axb2YwcHBl?=
 =?utf-8?B?UWJobDV3Ylg1NUgwK0dNOTFiZmtOOWtjaXJMemlROWc0SWFXV1NGSW5hTkhT?=
 =?utf-8?B?QTNPdzlNaFVMUFFIai9YYWpIRS9FWHd2cWl2R1dONDhBbEUyeGNWbXZZclAv?=
 =?utf-8?B?Ukwzb2hSSCtXekFPaGIzRnhGU0RWRXFTSVpqVzBpeC90bmRSRVdSSlNGNGE0?=
 =?utf-8?B?bFJkWW1IMUlRSGwrcFJWVzN1NUVKOFlTMU0rS3hDQnU4em5JRHFGeU5xeG5J?=
 =?utf-8?B?OHQzTy9yTFVNNDZzQkRQVm53YjZ0a3lkRlNyRHAxb2JNNlM1K1BTQk1rcEtu?=
 =?utf-8?B?cllwazhtbUtyc2g3eFhURlp5NzVrZllpQ2dGNExoK0Zya0RKME1Hc0RBQXZY?=
 =?utf-8?B?TWpOVk10WkJXbnZndEFrS0hpWHMwcmp2NkJnTVFFM1hrbHVweWpYazJwaW5h?=
 =?utf-8?B?cHR3R2hrQ0ZKakx2eWZOdDcwc0VmQmZlS0Vwck13WVJreUVOZ3pld05EcWFi?=
 =?utf-8?B?WFNqQWFScUZFN3lwS05vOXk4M3JxMk9rZys3TkVRQWt0ZWthS05pQkwxM2Rq?=
 =?utf-8?B?RzdpN1NqazZlZVB4L2pVYlc0c3JBMGtLRUdmaURmQklOUjVCdmd0eW13SHc3?=
 =?utf-8?B?bk5GSzRCYm5aNmtZWFJFRlJ0SzFaenB4KzNEWU9RRnRBa2JLelB5eEdGd3F6?=
 =?utf-8?B?ek1JN2o3SHRDZ1ZnZ05WMFhzWjIzU2llbUhSbFc0ZUlnWG5iNzBkbndlS016?=
 =?utf-8?B?THJhTmxvd0dCUDNXU0VzOUk0azFLWENibHVJS1RPbnhyS0FZRzFuTUFNYVl1?=
 =?utf-8?B?V0l1U016RjJxaGw0TjRoRWsrNjZBRmhjc2NmRm9ISFpPMlhEZWFEWElvK2Nu?=
 =?utf-8?B?Zyt6V0x5UnlCbGErdE14NlNmTWZCUjkyN3pCWUNlYUNudyt6TW02WDZoekpj?=
 =?utf-8?B?RE8vbU9icnNqODJyVWRqOVNNTE0rdW1sSkRpaTJkdFB0RHN1cUVGeVR6c2k5?=
 =?utf-8?B?aUZ1bTcxY3ZzUzBlNFZ2Q2g2Wk4waURlRzRwdEx2bFd2cHRaRW5Ncll3ekVF?=
 =?utf-8?Q?/+yw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C129F3D7432C24DA85183D12050CEF4@namprd18.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA7616390B.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11c2c90a-ee80-4869-a67c-08ddb5120253
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2025 00:31:50.9231
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lObFP+xekortxRK9MaBnA6+h0ZJOF2TzpgSKKIV3Kj7mji/DNm5TtmenhU1hZQIgOBis8SWI0xtHaiOvWeHvMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR18MB4008

T24gNi8yNi8yMDI1IDE6NTAgQU0sIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IENBVVRJ
T046IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlv
bi4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSByZWNv
Z25pemUgdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPg0KPg0KPiBP
biAyNi8wNi8yMDI1IDAzOjMxLCBIYXJzaGl0IFNoYWggd3JvdGU6DQo+PiBPbiA2LzI0LzIwMjUg
MTE6MDUgUE0sIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+Pj4+DQo+Pj4+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAieGxueCx6eW5xbXAtdWFydCIsICJjZG5zLHVh
cnQtcjFwMTIiOw0KPj4+Pj4gTkFLLCB5b3UgZG8gbm90IGhhdmUgeGxueCBoZXJlLiBMb29rIGF0
IHlvdXIgU29DOiBuYW1lIG9mIHZlbmRvciBpcw0KPj4+Pj4gYXhpYWRvLiBOb3QgeGxueC4gSG93
IGlzIHlvdXIgU29DIGNhbGxlZD8gQWxzbyB6eW5xbXA/IFlvdSBjYW5ub3QganVzdA0KPj4+Pj4g
cmFuZG9tbHkgcGljayBhbnkgY29tcGF0aWJsZXMgYW5kIHN0dWZmIHRoZW0gYXJvdW5kLg0KPj4+
Pj4NCj4+Pj4+IFBsZWFzZSBjYXJlZnVsbHkgcmVhZCB3cml0aW5nIGJpbmRpbmdzIGZyb20gRFQg
ZGlyZWN0b3J5Lg0KPj4+PiBXZSBhcmUgdXNpbmcgdGhlICJjZG5zLHVhcnQtcjFwMTIiIGZvciB0
aGUgVUFSVC4gSG93ZXZlciwgdGhhdCBhbG9uZQ0KPj4+PiBjYW4ndCBiZSBhZGRlZCBhbG9uZSBp
biB0aGUgY29tcGF0aWJsZSBhcyBwZXIgdGhlIERUIGJpbmRpbmdzIGRvYy4NCj4+PiBFeGFjdGx5
LiBTZWUgd3JpdGluZyBiaW5kaW5ncy4uLiBvciBhbnkgZ3VpZGVzL3RhbGtzLg0KPj4gV2Ugd2ls
bCBhZGQgdGhlICJjb21wYXRpYmxlID0gImF4aWFkbyxheC11YXJ0IiwgImNkbnMsdWFydC1yMXAx
MiIuIFdlDQo+PiB3aWxsIGFwcGVuZCBpbiB0aGUgZHQtYmluZGluZ3MgZG9jIGFuZCBkcml2ZXIu
DQo+Pg0KPj4gSXMgdGhpcyBuYW1lIGxvb2sgZ29vZD8NCj4gTm8sIGFsbCBjb21wYXRpYmxlcyBm
b3IgU29DIG11c3QgYmUgU29DIHNwZWNpZmljLiBUYWtlIGFueSByZWNlbnQNCj4gUXVhbGNvbW0g
U004NjUwIG9yIFNNODc1MCBhcyBleGFtcGxlLg0KPg0KPiBJIGFza2VkIHRvIHJlYWQgd3JpdGlu
ZyBiaW5kaW5ncy4gRGlkIHlvdSByZWFkIGl0PyBJdCBjb3ZlcnMgZXhhY3RseQ0KPiB0aGlzIGNh
c2UuDQo+DQpUaGFuayB5b3UgZm9yIHRoZSByZWZlcmVuY2VzLg0KDQpZZXMsIEkgSSBtaXNzZWQg
dGhlIHBvaW50IGluIHRoZSB3cml0aW5nIGJpbmRpbmdzIGRvYy4gSXQgc2F5cyB0aGUgDQpmb2xs
b3dpbmc6DQoNCiIgRm9yIHN1Yi1ibG9ja3MvY29tcG9uZW50cyBvZiBiaWdnZXIgZGV2aWNlIChl
LmcuIFNvQyBibG9ja3MpIHVzZSANCnJhdGhlciBkZXZpY2UtYmFzZWQgY29tcGF0aWJsZSAoZS5n
LiBTb0MtYmFzZWQgY29tcGF0aWJsZSksIGluc3RlYWQgb2YgDQpjdXN0b20gdmVyc2lvbmluZyBv
ZiB0aGF0IGNvbXBvbmVudC4gRm9yIGV4YW1wbGUgdXNlIA0KInZlbmRvcixzb2MxMjM0LWkyYyIg
aW5zdGVhZCBvZiAidmVuZG9yLGkyYy12MiIuIiAoUmVmOiANCmh0dHBzOi8vZWxpeGlyLmJvb3Rs
aW4uY29tL2xpbnV4L3Y2LjE1LjMvc291cmNlL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy93cml0aW5nLWJpbmRpbmdzLnJzdCNMNzkpIA0KIyBXZSBuZWVkIHRvIGFkZCB0aGUgZnVs
bCBTb0MgbmFtZSBpbnN0ZWFkIG9mIHZlcnNpb25pbmcuIGUuZy4gDQpjb21wYXRpYmxlIHNob3Vs
ZCBjb250YWluIGZ1bGwgU29DIG5hbWUgYXgzMDAwLiBBbm90aGVyIGV4YW1wbGUsIHdlIGhhdmUg
DQpzZWVuIGlzIHRoZSBkZXNpZ253YXJlIEkyQyBJUCBpcyB1c2VkIGJ5IE1TQ0MsIG9jZWxvdCBj
aGlwc2V0LiBJdCBpcyANCnNob3dpbmcgYXMgYmVsb3cgaW4gdGhlIGZvbGxvd2luZzogDQooaHR0
cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTYtcmMzL3NvdXJjZS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL3NucHMsZGVzaWdud2FyZS1pMmMueWFtbCkNCg0K
aTJjQDEwMDQwMCB7IGNvbXBhdGlibGUgPSAibXNjYyxvY2Vsb3QtaTJjIA0KPGh0dHBzOi8vZWxp
eGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjE2LXJjMy9CL2lkZW50L21zY2MlMkNvY2Vsb3QtaTJj
PiIsIA0KInNucHMsZGVzaWdud2FyZS1pMmMgDQo8aHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20v
bGludXgvdjYuMTYtcmMzL0IvaWRlbnQvc25wcyUyQ2Rlc2lnbndhcmUtaTJjPiI7IA0KcmVnID0g
PDB4MTAwNDAwIDB4MTAwPiwgPDB4MTk4IDB4OD47IHBpbmN0cmwtMCA9IDwmaTJjX3BpbnM+OyAN
CnBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7IGludGVycnVwdHMgPSA8OD47IGNsb2NrcyA9IDwm
YWhiX2Nsaz47IH07ICMgDQpXZSB3aWxsIGFkZCB0aGlzIGNvbXBhdGlibGUgaW4gdGhlIGV4aXN0
aW5nIGRyaXZlciANCihkcml2ZXJzL3R0eS9zZXJpYWwveGlsaW54X3VhcnRwcy5jKSAmIGJpbmRp
bmdzIA0KKERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJpYWwvY2Rucyx1YXJ0
LnlhbWwpIHNpbmNlIHRoZSBJUCANCmlzIGNvbW1vbi4gQXMgcGVyIHRoZSBhYm92ZSBleGFtcGxl
cywgSSBzZWUgdHdvIHR5cGVzIG9mIGJpbmRpbmdzLiANCmNvbXBhdGlibGUgPSAiYXhpYWRvLGF4
MzAwMC11YXJ0IiwgImNkbnMsdWFydC1yMXAxMiIgT1IgY29tcGF0aWJsZSA9IA0KImF4aWFkbyxh
eDMwMDAtdWFydCJDYW4geW91IHBsZWFzZSBoZWxwIGZvciB0aGlzIG9wdGlvbj8gQXBvbG9naWVz
IGZvciANCnRoZSBsb25nIHRocmVhZCBhZ2Fpbi4gUmVnYXJkcywgSGFyc2hpdC4NCg0K

