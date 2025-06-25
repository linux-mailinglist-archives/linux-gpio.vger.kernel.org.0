Return-Path: <linux-gpio+bounces-22110-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79813AE7393
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 02:02:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24EAD1BC43FB
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 00:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B6E7BA4A;
	Wed, 25 Jun 2025 00:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="tZf0OCcw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2110.outbound.protection.outlook.com [40.107.237.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF4D72614;
	Wed, 25 Jun 2025 00:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750809772; cv=fail; b=M4FMDwI0FWQKMjPpLrnQD7vTdXhsjr1NN0xUE7nZwAzxKi3cZlkgOG2l38d7b+YoMqbqv5xnkSSfXJEgtB+3RwqMq8r8L0V/3qSN8cOmxnXGnQMlVhgl4LJBHAA7cSGh8Dok6cvES/enrsz6gCTXkBD5C+yAugGIfh0A3q5/r0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750809772; c=relaxed/simple;
	bh=NI5Gs1NDGlgcPPQJE6u451ORulDZHJXBThzzU2yAm/w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=f/BVcJGYO14NjAA0/8xFckqurho0/Q9A3PuGo/O+VvuO2R5SHhr1vaV4tyM8euwKQUfR90J+yIRx0GvtSCbMivxqfFF/uIjdcroSxdOe6q33IMSl6LDkhQNXsBb0rgctWg/rKKEtiPS8TfOOD6H5iFirwXkyb4u94dPIiJYDOsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=tZf0OCcw; arc=fail smtp.client-ip=40.107.237.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b4AAo1+g9NEi/hAfSVKCI/NQXEhc5Kv/J2LHnri30Z3KKr3ADREWsNhVHRJeRNFhx+6V5Vu2rumqyv/HFz07rji9r99FkiddrzjOtNq5Tvb3woxw2RooYNZA6GWmdhjoZ0+CH52YqgHFGxE+5tCQzPKS1rMK1afTnKmxE/uYXJX1InOMNHFaAXy24x0F7wJaOmWiVPbgQRckx3RiDZJ5qT7k9to228JKp9t7glSKkp+qxuNZK2E/RNjoIjCk5Z955OKNkd88ue0Wdn2HA7WV3UnPYCFoMtrw/aJm5cUlJHT4uB5FwRwOJgJhu6anysD7IhijqjZ69pm9n5B6VMXi6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NI5Gs1NDGlgcPPQJE6u451ORulDZHJXBThzzU2yAm/w=;
 b=jMGnEIbtMX5EDhD3sNFvZolJXWd2W3MLpqVXGRXLsaMlwsW0su/QsA6ePJUhoGkedikyEE6xaKqHkNsm6hFM+hYuv2uAhJR4KgWd4qIIU+aQfafIJSvXE0DTlcdvabIEWekVCByncMWuheBdwnaz0ESrmQHeRbfX4QDzqbbW1GOo5f5sHbY5L2c0vKar3uk2iH1xlfmwe5Rk0udzDN8srvPFUfX+Lcde6ZKH/FRqhQLlgtAS8gdfWlYA8VX27AijyA0iNNwLYTxUyW14olZ5ouesxFT24SRP+xhseoC5LVBMe7wh3nbewUUU6dtWQNnLktc9iZ74FQfqIlX6nC/saw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NI5Gs1NDGlgcPPQJE6u451ORulDZHJXBThzzU2yAm/w=;
 b=tZf0OCcwfDfNRPGzCmV+LrTki6+FTT78cBA5MF3ZYvB4BnGE+LLW5SU4nAPF+Nl1neZaYPVAjU9RlpbxJIsl7C1QdDDUQvWLAtnE1vQRi6PFArAfAVueYdTUJlCYi9/Nogry0JzNFQSesGvld0/k1gy15DviWHaSSElXutwOHfmHWzRYzlbxUdwJfw3/5FsIfLjJapwN/1s68oegd0UMsI0y/7U1x3o2/56g7FUQOWvz9zU2bxKXEp2IjIKlrT2BEEf9NT/FJd/ME7yRUU6XblHnow6+qrLw3n7TBRcTmy2rBAODUI0i60L6YVxPQ9pxg1KrNWAEc3DpN1YB8nRZLw==
Received: from IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 (2603:10b6:20f:fc04::c3d) by CO1PR18MB4683.namprd18.prod.outlook.com
 (2603:10b6:303:e6::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 25 Jun
 2025 00:02:46 +0000
Received: from IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 ([fe80::ca34:e235:13d9:3f5d]) by IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 ([fe80::ca34:e235:13d9:3f5d%5]) with mapi id 15.20.8769.031; Wed, 25 Jun 2025
 00:02:46 +0000
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
Subject: Re: [PATCH v3 6/7] arm64: defconfig: enable the Axiado family
Thread-Topic: [PATCH v3 6/7] arm64: defconfig: enable the Axiado family
Thread-Index: AQHb5GRFFRWAi+yxQE2uQXYyKYe53bQR3lsAgAEh0YA=
Date: Wed, 25 Jun 2025 00:02:46 +0000
Message-ID: <4097e306-68ce-45cb-b646-8898e5ed8e27@axiado.com>
References:
 <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-0-b3e66a7491f5@axiado.com>
 <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-6-b3e66a7491f5@axiado.com>
 <de124c73-df0f-40a1-91dd-ea5287cb90c7@kernel.org>
In-Reply-To: <de124c73-df0f-40a1-91dd-ea5287cb90c7@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PPFBEC4B1F8E:EE_|CO1PR18MB4683:EE_
x-ms-office365-filtering-correlation-id: 2c88d9a8-9edd-4176-37d1-08ddb37b9d7e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cTVEaDNISFZpSS9lakk3UkZwdmhUb0NIOWlGcVhmRXNOcm03TkljNmZmRmp1?=
 =?utf-8?B?UlJMMjNEdVZQWXpJRU15NWU3QnFMN2hDNzNhcFVNL25maUd6a3M2TCsyeGM5?=
 =?utf-8?B?bXlNMnRuT2xERmJ1WWZ1NWYvbElRYS9pYld1ZUw1eTJJRmFXV2J2STlRVm5R?=
 =?utf-8?B?WVUyT0lLM0c5S1NDS1pKWVJXellFQUMwSUgrTHQycitJMG9laTFyZkFGa0Js?=
 =?utf-8?B?TTVQbFJzL3N4Y2UycmNMd1A0K3dreHFaczFTaS8vWFRNR3A0NmN0NnFndnNT?=
 =?utf-8?B?UTd3T1ZCVVhjbS9ZcFR3c1UxTGVzeENHc0srWnpWUDg1ZzNWVEc2eTFvVEpy?=
 =?utf-8?B?RUVoREcxQ2tBYU94dExCT2xtOUFPRktqTGJUK0NLYnZoZm1FZXZiM29VS3gy?=
 =?utf-8?B?RVAySW1kYUw4QldSczFzOTl2aEhLbHBkSThiNHAyOVQwQ2dreVg2eHJ6V0JT?=
 =?utf-8?B?eS8wN25kN2FCd09oejZ3dUlCa1hRaTlkM3JoY082ZWswek0xUzZHbEsyazVx?=
 =?utf-8?B?cXZ3NVpZS1FpVkdvRmZnWXB0b24rdml6TlBWK0xOZ055bUptRXJKUzJ2bExI?=
 =?utf-8?B?SitMc0JWZlNzUlh3MDIzN2dGd2tvcTFoL0RxamdCOUttTGFoUC9udm01UDBN?=
 =?utf-8?B?Qk5QcVh0T3EwRWNYL0ZHN1FaTUtKbHFFS21ZUTdLeERJTzlWc3ZNWjV4OGtu?=
 =?utf-8?B?R09xMDZnQ25PaHkzU0NrSDVucU9heFJKYVcxUGVnWmgwVGduYzFWMkF3S3pq?=
 =?utf-8?B?R3ZWSGt5ZFpoMnJkeVRnUU5kelJkQVF2SjhXd3VjTkxMTHNZSHRpKzB5S0Nw?=
 =?utf-8?B?aFBCQWZoelBkeForcW5nckFrWTVBZ0dBbU1lTzk1di9lemtWTW9xS21LUGYr?=
 =?utf-8?B?NzQ0ZWdyUmllQlRhOXRKdnh6S2FVQ0tyNWV1eGdvK05IbDJyVGUva0Jmdjh0?=
 =?utf-8?B?Z3h2cERLWDAxeXlTUnMycmFKd0xpNS9YdnkyUEVKYStjQ2JDQ05ETnZrWm02?=
 =?utf-8?B?OC9McktBZEpxMlFaUFE2dUltM0JDSVl1SG1hTTdjSWM1d0xqSWpTZUdSWDRX?=
 =?utf-8?B?bnZ5R1FRZW5GNWRndFRHUXgyVU1RVlphZEpheFZSZXZQSVViTFhOaWE2Znhz?=
 =?utf-8?B?OUhMUnE0dm5FMWRmeTFsbW1CT0Jxc1NWQ25MNHZZU0d3UUxtK25LMTVUZExD?=
 =?utf-8?B?Z29kbGJEUkpFeVBrWjhXSUt6UWxZeUVtUjJYWDZaMWlZTFZPWHorOGtGVnpE?=
 =?utf-8?B?NElvUUJXcTNodFMydmtOTFJPWE8wcjZiT2xtKzFCampWcWlFVS83Szd6YmRH?=
 =?utf-8?B?elRGZTlVcUdFU25CMUVwMjJXSFFydGRJNVp5aVo1RnRHUkhhMDFkeGJYSmw1?=
 =?utf-8?B?MUwwYVRhREQ2TGpIem1RQVNVbzRpa2p2RXhnT0tIZEswYXN6WnByVDRQL1JH?=
 =?utf-8?B?RHptdEovRmwzTWdYV2tBdnNEQWUrUGpIMmV0c3hJWDVCb3htbTRaOGxoUkxD?=
 =?utf-8?B?M2dNdlhHVTZaTDI2dXRUVTFIQjV4ZUxmTE4rbm4xOGpRMnV3WkdNeTVIandi?=
 =?utf-8?B?eGxiOUtOUWdaS0RBbHdRa3lUZkZJM3dzMEFBcWtjTUhUM280M2JMU09ENm0y?=
 =?utf-8?B?a1FTTC95TTlvUS9vNGx1d0NnWUxHWFc0ZDE5aWdubDdueEk0MGxOZmg2ZE1U?=
 =?utf-8?B?Z3FGODE0bWcrVFhPMG9NdGtlMVVYWDlUWTN6Z0JVbWxYL213NGVrZlBQTGJM?=
 =?utf-8?B?TGdCclZNamM1UE5xMkFjSVFSSC9jRlVZa2c4dU4vVHFTUnRZNzhaNDR5VGFz?=
 =?utf-8?B?RFBQQ1BlNUR0SDBHTmQzVUFRRDF5K2xtN2N5a1NBdm5FdzNyRXpMR1ozbEFM?=
 =?utf-8?B?d1F6ZTl0RTJRTERyVWltOWIyMkJDQVNIejhGeHdYME1rekRhTkovdmdtMVZ3?=
 =?utf-8?B?elE5VXl4eTB4RDFVRDBzSHlRb0dtSkZ1d3lnenR4WEdqL0tlU0dpbEZQWmhi?=
 =?utf-8?Q?jCcWy3LF6PjirDKdOcNEMe/Wv632UU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PPFBEC4B1F8E.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a2NoRTRJVzMrVzFwZzNVWExmQW1FcFRJeU4zY2lGdlQ3OTMzdkR3UlRVMlZU?=
 =?utf-8?B?cEViK3gyUER3U3RVNzdUQi9vcUdFKytsR1hvOU9SSUhkWmlyRjl5MHNuaDY0?=
 =?utf-8?B?UHJuTitqbGxEWFRWMVhLWE1KcHcvRGN5U1Fxd2JzS0hPeG5yMGQ5MkEwYzhw?=
 =?utf-8?B?SndxZCttK29FNHNFNkRpY0FXZGVWQUU4MGVBQ0JlYVV0ai9aMURUK3JHdUw1?=
 =?utf-8?B?S214T2c5MW9IeU1BYWhIWWE0bzNrN241OG5Mcnc5UndHVUMvUDZTbzdwRHkz?=
 =?utf-8?B?UTROWWhQaEhsdTNVbm9jSTlPdDZPMGt2YzJZclFSU2w3KzVFSVBGbmFJSEFK?=
 =?utf-8?B?K0ZqWkU5bjc5RXdKN21tclBwS1pmdjRqVC9kMytVNlBMWk50NVhISWZIT1Ar?=
 =?utf-8?B?aW5iRDV0Y2YzckZaUnNxOVlGYkZkT3RsNmFjdURQMGh4YjhqM0dzZHRzSlMy?=
 =?utf-8?B?SlZvdmw5TUlzQXFtaFVEU1dKOHJuVWhKS1FxVWhaaWthdXJxdHNNUE1YZGp5?=
 =?utf-8?B?ZStaZnovakw4dE5KQkJqdEVpYTNLeW1JZnRHNG1aVDBaZkozTjMyVmVyNWFD?=
 =?utf-8?B?L3hyQ0RTNW0walVqMTA5QmlOYi9Tc0traWhZKzNxNUVNaDRyOHppZnVDVEE2?=
 =?utf-8?B?VXFFdk5tZ3FHNEhIY04va2taY01BRUxBSEwzNlNVVXlIZU5tdGtmcU40VTJE?=
 =?utf-8?B?SjB6ODdJSEQ3YnduUXZ4bnhVV2dwa0hoM3AwdmtIajE1TEVhOGswZVVGMmM5?=
 =?utf-8?B?clBaelF4TkZWWE9TWWc4TDVaaHl0M25vbWhzZW1nZ3drbjcxOXczRFVMbEdJ?=
 =?utf-8?B?azJUb2NVRkdhYjZHYWZpOTIxV2dReHlvVjJOdzZaWk0xd1Z2Wjc5dis3MDU3?=
 =?utf-8?B?ejZmclB0YjYrV2xvbTY5Z3g5YS94aDEzdkw1TXlUWHNvSk81ZlY0ODVjTkoz?=
 =?utf-8?B?WFg4TU5mN2lvU09TNE02TG5vaTdCTzZVQmQ0bUhINHFoTUxLQ1hwWFU4bGh1?=
 =?utf-8?B?eHN3dW9GRFdZdnZ1NnVKbFMwSDU1OU5MWVllVjJmejZ3SVdITkVQTjN0eEk4?=
 =?utf-8?B?cmdYbG9NZmUxYVdCU3Z3d3k5MVVuU01ybHVhblZqT1JQaForR2kzbXRES056?=
 =?utf-8?B?ekZJUWVwOTlLWjBiNUMvNi95UEZsUnpXcnlVSnF6OG42a1J3cXpJWFNsSnZP?=
 =?utf-8?B?R2xVTjUzMmJySGthcHJYMEs5dHdQUnR0YWs3VWxKQUtkTU1lWG52aHhEQ2FD?=
 =?utf-8?B?WmRNTjd5djFtblN2bDZlbkszYVgrU2xaNHByb3BrQXBkS2dYVnlsTzJHY3hU?=
 =?utf-8?B?bC8vdEoyVWV0L2dyaUVPUWtsMloxZnVmNkpRc24yYTVUM0kxZVVzRHl3VWRB?=
 =?utf-8?B?Ym9wd05YVm9Rczg4Y2haaGtXS3NReUhDOFYzSEdoTkxycUVGbHBQclNGRXo1?=
 =?utf-8?B?WWw4WVVUcWVXdnpGOXU0WWF2TE5sSzhXNWt3dWtZUzlXZWsxVjh1NTBRc1do?=
 =?utf-8?B?U3hYV2ZoTG1KaDlDT3N6SldwSWUzMUdDMTBnSzZGRit3ekpEeEEwZEN3OWQw?=
 =?utf-8?B?UmtXM2cwNTBxaTkwanV4Ymo4RTNHTzlNejBGK29hWkZRNjcvT29URzhnZ01K?=
 =?utf-8?B?R3VGaTN2MXZWdU9BQ1kwYVhnUHV5empjZ0VkRzVoV0tIU2cxMjdaR0NlbXRT?=
 =?utf-8?B?c1FBRWRraGY3Mm96VmpqMUNqdmFJOVVuK25QZStoOUd1MktpUW1McVNEaGgr?=
 =?utf-8?B?QWVDNjNrR2cyQmRQYncvUHRrZ1Z5K1BNVi9rM0FpNmxLTzFPVEZteFkvdmNX?=
 =?utf-8?B?eElpdnp5UU9XQ0ZKb05rTk4rdjk5bTczV25tbmcxVjZ1bEZMYTlPK3h0WW1h?=
 =?utf-8?B?Y21TTFJMaUgwTjlWTlV2OUZqV3drVWdmN0JNaGw4aDA3YmNuSU9zL0lza0JK?=
 =?utf-8?B?ak9WeHNtbkwyM1dPeW1Md1hIdkVFdGdIRFEzdldCN0NwNG91VUdPK0xCNksr?=
 =?utf-8?B?WTVjdzBwbjJiUm02MGdxTWtVbzJoSjZwMXBsa2hsanQrMDJRcHdtRm5KK25W?=
 =?utf-8?B?cDNlWHFKUXBHcWdEeDdhSzdPd01Sb2RPN200QzVlOEFIb3FoSXA4Y3ZUY1VH?=
 =?utf-8?Q?F5UA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A7524DBEEFD41E4ABC6428E5C9135EB8@namprd18.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c88d9a8-9edd-4176-37d1-08ddb37b9d7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 00:02:46.0970
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SQZ2Mayt6sZcGTQwTzmViZ2AJ+04AXPCMMLZ8EqiL/xNQ12ja1n6TtrxajTbJExASifHGx7kUu7sTsgICsGVuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR18MB4683

T24gNi8yMy8yMDI1IDExOjQ1IFBNLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPiBDQVVU
SU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6YXRp
b24uIERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVj
b2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4NCj4NCj4g
T24gMjMvMDYvMjAyNSAxOToyOCwgSGFyc2hpdCBTaGFoIHdyb3RlOg0KPj4gRW5hYmxlIHRoZSBB
eGlhZG8gU29DIGZhbWlseSBpbiB0aGUgYXJtNjQgZGVmY29uZmlnLg0KPj4NCj4+IFNpZ25lZC1v
ZmYtYnk6IEhhcnNoaXQgU2hhaCA8aHNoYWhAYXhpYWRvLmNvbT4NCj4+IC0tLQ0KPj4gICBhcmNo
L2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnIHwgMSArDQo+DQo+IFJldmlld2VkLWJ5OiBLcnp5c3p0
b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQoNCk5vdGVkIHdp
dGggdGhhbmtzLiBJIHdpbGwgdGFrZSBjYXJlIGZyb20gbmV4dCBwYXRjaHNldC4NCg0KUmVnYXJk
cywNCg0KSGFyc2hpdC4NCg0K

