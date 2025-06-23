Return-Path: <linux-gpio+bounces-21972-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCDEAE353B
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 07:56:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6775188F503
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 05:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D371D9346;
	Mon, 23 Jun 2025 05:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="OgcGA7VX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2115.outbound.protection.outlook.com [40.107.92.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A522581;
	Mon, 23 Jun 2025 05:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750658181; cv=fail; b=NVHcTJ0jRiFhwCBeGFfVShfUN37zJ/FtVcRGKDho7aBrYgN9C245cDrsXjwHrZTepOixHYStEkCr58/ZMKkyrSxypx5XFku21EKtk79SKnYYHY+ih6fdFixY++dNaRdjjLhyCHQjDlJABGa2ZKru+bmPMn+0SX8r+FMb8RLq3oA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750658181; c=relaxed/simple;
	bh=q5wITPr0IDXsZXTpMlYmUH9mrWBxNC2YyC44RcQYshY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qgK8RoPKTbrTaaEKHvwy3LacNSSSUTDtHRWcCvVNjjJ+IvqVJvRNYRiYKRzmngWqaOgN3qA7PbxwgxqrV8aWl36PTM7MEw1J7YPnoEmoIN6DgqaQ6DZBdl8UUkY7/jlnI7Wbj3G5tyloz+8TzEhP2+heY2kuMJkQoFUCI6Feg+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=OgcGA7VX; arc=fail smtp.client-ip=40.107.92.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l9DfLP8zP2xQ3+agU1Yg2NJLZuzlPRlj+jjHmdN7fKVAjdGU4LY3Mx+kxK26GAzOF8zRAmpSbYgbZ/R8EWENCp9o0Y3Ccc665QJdHOrUZUhSpHYaoVWPDVinb1ib8kFFbj2uKW/5Yr2vf9vsCB4+UQVmULq6+wyhDXfIY5mJBO1VB6UvpiTezMkErSXX2SkBEoyBxSvN67WZ2ICFNf6ceCrv8VM/A+YmxSnyA0mqERNSBnYlLygsCokG2BYZ2EnxsvfMFY7WHXgmX/8wZESHAVsgKpADrNgrby3qznOe7p45orvD+S1R4AmzbKwrxN5rK7xqjiAbC6bFcXTFYl/CbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5wITPr0IDXsZXTpMlYmUH9mrWBxNC2YyC44RcQYshY=;
 b=u9k4cyjnG9M1B4lk+Jd47hdY3OTq27PlNI3YsudnD064OyQb7sp3znn0yONWEYPPu3mFXr376ZIkqBl1xp6st5Ht/G5aE6rDAcQ2vCt9XgzlYBZ1D8SmrRBjtJ+RSxfUjF0vXZxfR6zGSHpMpCd5KrUxp/Npm2ksbcvk4wqW+2POcUNw6G6Pl0JBBLHBVJqOZ/EIUt1cQm7NKqLEZJTQBZwozJJKFrAPayfNdf8CFie4t5M1JfiH7DMu1Z9SQBJpQkxfG3tayXiHUIb5gNvBa03MkHXEDdzU+qygRMWxgWNHv/P8J9vzTtjRlDId2l7IEGfKdF/aGEbUz5Dlq27HOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5wITPr0IDXsZXTpMlYmUH9mrWBxNC2YyC44RcQYshY=;
 b=OgcGA7VXEnjq2Na5eajg4Ta33WgsuF+2yHy2t3GYtNCBt4opWFvRZ1Rqw/VbhoQxeh7I6u/pUpN94iDoc4DyajksIV5zn9RFFLNxjTdFVkq38D2Ue53Iivu8AKrSFZgaXHU822vMHWy919i7IWO2YiwOioD2UQU3JS1b5LPXEq6oHxmZB2Vb0vkwBvIilPjWCmjy/HD652Z3T6pUUlOmlp7ooDWGdfQOx1++i3lfL4EK+kncKd/LZG6Mt64Hnzf7d3JBDkVkQ9/7lQU93WPptslIraq0zEG/KOiPIxAmK6gej42DhbrSZQsyDJfEK7ssGLqWfZJIavXqn5BsobPThQ==
Received: from IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 (2603:10b6:20f:fc04::c3d) by SN7PR18MB4063.namprd18.prod.outlook.com
 (2603:10b6:806:f4::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 05:56:14 +0000
Received: from IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 ([fe80::ca34:e235:13d9:3f5d]) by IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 ([fe80::ca34:e235:13d9:3f5d%5]) with mapi id 15.20.8769.031; Mon, 23 Jun 2025
 05:56:14 +0000
From: Harshit Shah <hshah@axiado.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
	<brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "soc@lists.linux.dev" <soc@lists.linux.dev>
Subject: Re: [PATCH v2 4/6] arm64: dts: axiado: Add initial support for AX3000
 SoC and eval board
Thread-Topic: [PATCH v2 4/6] arm64: dts: axiado: Add initial support for
 AX3000 SoC and eval board
Thread-Index:
 AQHb3neXHHei+il700ibF96CIekp1rQFTYkAgAXMHACAAHzYAIAA/mOAgAJkJwCAAVEWgA==
Date: Mon, 23 Jun 2025 05:56:14 +0000
Message-ID: <56044658-925d-473c-9859-d4f10aa9330e@axiado.com>
References:
 <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-0-341502d38618@axiado.com>
 <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-4-341502d38618@axiado.com>
 <6ef92d1a-39cc-409f-8ebe-d28ad2006988@kernel.org>
 <bfcde082-270f-4152-b474-7828beab7cb9@axiado.com>
 <9012cc61-b499-4213-9753-54cf4d24c822@kernel.org>
 <bdc4408c-6fe4-48cd-bb40-3a17aed79cb6@axiado.com>
 <5163d9d8-d106-47f3-a0f9-0eaa01f15498@kernel.org>
In-Reply-To: <5163d9d8-d106-47f3-a0f9-0eaa01f15498@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PPFBEC4B1F8E:EE_|SN7PR18MB4063:EE_
x-ms-office365-filtering-correlation-id: 89d524c6-5330-4d38-3515-08ddb21aa9a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|10070799003|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Mit2NTBOTnBSbmV5Sjh5TFFuY0E4TFNKS3lkLzEwdGNCeDF2c0M1Mjdnb1hN?=
 =?utf-8?B?c0ZPalpxWml5TnhiWlZnTjFLdG5hSUIwSWhQMFpSUW53SkZxRzlrMzNiUjJl?=
 =?utf-8?B?NU1WaXJGTzdVNUdZK0E1QmowQTVITGdLK2FpZ2FQR2RaKzROZUx4Tm1wa0do?=
 =?utf-8?B?Sk41L3V6MUQ3ekFnUFhkWHlSS2FreE8zS1JtMEhSbElYY0l4TFNxVm82c0Vz?=
 =?utf-8?B?Qk5SeUZldlNuSmJjZjhST0h1eTdwNGdFZmpWclJ0V1YxS0VaeVU1cjY1dEhV?=
 =?utf-8?B?NnZQL1grMC95TDFZcmtEL0c1cUZnaStQZ1g0SlY1UkhkRWlKK3JIMHEwTmNr?=
 =?utf-8?B?SGlqaVVMbnB3S1pjZHJiUllKcDk5Q3QvVUtZeWdRYzBUNkhPU0dzRjR2TUJI?=
 =?utf-8?B?UWhsaU5nSVdncTFudVdXa3U5ckVMaWFacmZpb3N6OW9jZm1Qa3Zzcy93MDZJ?=
 =?utf-8?B?K2tMWVNNb2d1T3gvZ1BCcUpJakROVnpvdE9qM204cFFKVmtvUFFFUFBkdER5?=
 =?utf-8?B?K21yb0FSU1doQURicGlDdm1OczNBdEM4aUUwVlhUNHgyKzF5Rk91S29VUlov?=
 =?utf-8?B?ZldYRmpUV2tJVU5ZVkIzUEpOTnA0cTRXVDBrUThIUFJlNFFhaTRGMStIdWxJ?=
 =?utf-8?B?VWVMaTEvRUkySEdNMU41QzRISit5TW04WWZqanpQbmxJYkpFcWVWcUFyejJw?=
 =?utf-8?B?d0tnODZhSnMwTjBWN0QwTjQ1Ymx1N2ZZVCtRVnExZVIvUjlJVDFUUjUxdUxM?=
 =?utf-8?B?Qmg5RDVsaTlhRmN4QTNQQTVmVXo0K1Z6TzU5dXdESnBWeVAyeEVHZXI2WkZi?=
 =?utf-8?B?bm9QUHp5YWpCQ0dwUjV3YjlVMDJHQ3FnaE9NZ0gyL0dRS0w0ejdpUEtyVVpC?=
 =?utf-8?B?ZVE1V3gvODE2azhsR2wwaUZXUFZxdEdWcG93cUpwL0drUUdmT0RQNUhta2dO?=
 =?utf-8?B?ZjRKVWIrMmFnbXZoV0dFN1kzTGh6M1R4ZGFNWVFLL3lNN0x1QzUySVZoL1NI?=
 =?utf-8?B?RzhXckVpNTRrUmxGUXJ2NnlUS21INXJMSko3R0Zhdk95cWdyOWhkVXVZYmJZ?=
 =?utf-8?B?TGFBSWpWaXBlWGdmbmpoTSt6TmxlY3h4VTltUG5tcWFsWlFUVG53NWZFYnFY?=
 =?utf-8?B?amlVV3duandoNHczNUtDeU9LZXFBQyt5Z2pqajk2a1R2a1BUOVlPWklOYnFh?=
 =?utf-8?B?aHZUY1VPa1ZMdVMyZlRENTFnclFXU3JIWjRkSlB2MmJaZTBZZXJKOFVYQlFZ?=
 =?utf-8?B?R2ZtakdpaVB4TkluS0ZqUUhTbFliQ1ZaS0s4ek94STJwQUE2R0pmdVdWakNo?=
 =?utf-8?B?TG1BSG5mQ3VTaDhwN1UvempCM1hMZDRyVS9qNHdKVThZcVZzS0p2bko4aWN0?=
 =?utf-8?B?WFhvUzdpWVlvbHI2OFBoMUpxQmwyZU40SkFwTUtHWmVQalJ6bG81djNQdkxX?=
 =?utf-8?B?VWp4Y2lBZ1JqNXhteG1MY2hLQWxOS3VUSkVSV3YvNWFpSngrMzlvRXRyNUl5?=
 =?utf-8?B?S2RmalVSb1JmUkZhbWV2VTNkdi8xNUpjUlpUaFBoeXRKSFN6ekxvQS9IMDVh?=
 =?utf-8?B?NGF3WTFRM3pFN0lFMFo4YWp3QldtaElxTURwaFVBUnRBVldIOU1COFVwRnlj?=
 =?utf-8?B?OVcyMUpTRDYzVWNzSjRlWFpaUytjQit0LzBYMlpwcGxlTExnbjgvWWJDY0ln?=
 =?utf-8?B?VG16M2RIL0FoaU9hMnBnL3F0Z2Q4akxLZjhxMXRQSXFUeWNCYWNsOVJKMHhC?=
 =?utf-8?B?cGZCUkRaZ05yRWNiSjdDUE5EcVV1aGk2VmFiUFdSay9wQnFVQXdmcWt2UHEz?=
 =?utf-8?B?SnorQmF2WkxySEN3VEFvU3JsRkRXTXBOM3NaOSsvSW8wKzE1Vk5wcjhlZlNF?=
 =?utf-8?B?ZzdRMGFKTG5pWm9EM05na0lkdEFkcU4wOEp6SExmMDh6V3AvOE5YeUpoZDNJ?=
 =?utf-8?B?ck9JSCtoOThtWUxrcklqNHZnWmJ5UGJDeWphVFpHM2p6ejhKZERWVUpBM0tI?=
 =?utf-8?B?YzNsOXNPd1hnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PPFBEC4B1F8E.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Lzc2TUtGWU5SdCtzaS9IWTJtTEZSb1ZrSE9EbXRmZEFGbXBORmVqdTlIbHZo?=
 =?utf-8?B?S0lhUGpJRHA1ckRkM2Q4S3d5eUVCZy9Od2ppb3djY21Wb2crV2FhbDd2SGRP?=
 =?utf-8?B?NDlNTTZNdVNwU0VpUVpGZWVCRllpdVVnaVdvZ3dnTGpYY1hodEhhMmlIUnp1?=
 =?utf-8?B?MXA4Zkt0d1ZlNWdudEFHeG1hZ0dBUEkvREZMMkVJY2ZVSlJkUXZDNjhMTytD?=
 =?utf-8?B?N256L2JmNVRmZ01oZHc3ZTgwcHZIelp4ZGRuRitRVmc3b0NxcklPNDRhaTNP?=
 =?utf-8?B?bGorMnNxbG4zVnNTOGt4TWc1ZXUvbVZGYm9iMVR5UFhtb20zTzd6dWJabXpG?=
 =?utf-8?B?dU53TU05Umd3TnVldGd1NE9jWURlVVJRYnlXY0hkVTUvQURpL3VZbTJnc1do?=
 =?utf-8?B?aTR2QktNOHdobzd1SVh3S1JmTlY2OGFGemxsZFZDWndaeldBM0ozM2huUENW?=
 =?utf-8?B?bnYyUnE3QmJSSk5rRjI5aENzRzhWTll6YndnTGlkUVluUVVyNi9tdWFtV3RG?=
 =?utf-8?B?Y3BaZmdndnFEWDJBTmZFcWh0ek9KWE82SXdlVlNGRld1bmh6bUJsbnRDK0lq?=
 =?utf-8?B?RjZoN0pVNTd5M2lOdHpieGU0QXhQWnBkby9udnhWT0FTYVVVVUw0UWM0ZDU5?=
 =?utf-8?B?TTdoUE5SaTQ0cjhUWDd3TEVzeHIrZWV0TmpvenZ1S2xYYVVJb1pDWk1lNkdO?=
 =?utf-8?B?ODVrVG5PYTZyNXh3cGhKUGdqaHorZXV6RWRuZzZTTnpKV1ZoM2VGbkRGaGJt?=
 =?utf-8?B?b0hWaGtoUEpSUWp6OXQxK1ZsZXRuUC9sSHA2TlNyWWtwU01SVmt1NWwrUlYr?=
 =?utf-8?B?L2UwSTJtcjNhQ2hRbFovUWozK3ZiNStXanE0NFY5cjV6OHBqVXp6aENnNkdY?=
 =?utf-8?B?eVIyRFZ4UzBGbVVOVnNuVTdUZnhKWkRIcTJ2RUZoa3J4dThDZGxGSWE3Z2g3?=
 =?utf-8?B?aGdEQ2RvaXNZZ0psVlgyTC8yR0g2YmkzSHZhZTROZHJpYmFabHZtY2lrcnEz?=
 =?utf-8?B?Y0RQYTFVUFhuTkVlaVVpUUc0czlpMjBEZzlGaDJ0NnQxVldtcEgxNGRNZG1L?=
 =?utf-8?B?T3k1NDFFM2xvVHJxTHBZQjFIL1ZQZE1OY09SZGdIcUxIaDdIQ2Y2bTM3V0lP?=
 =?utf-8?B?NDJvU3B4S3FBQjRuenpGM3pQajRWQzZYV0Z5dlJRS3BmMDJOckh1Sy9YY0Fk?=
 =?utf-8?B?NnliU25ocTRENmRhb0NIc0d6RWNYeWh5YWM0NnpremhNc0t6dkU1NEVTVjlW?=
 =?utf-8?B?K1pmcFo3ZVh5VnNkL2RsQWp5QmFCbHVuYzVMTllYU2dQaHVKc0ZyZzlNR3ZU?=
 =?utf-8?B?RTNDYnBoWklsUkt4Vm0wdmY0WXJQbGx3QWxtRnd5SGkxT2pQRHNieW9jNUp6?=
 =?utf-8?B?SUFRaGlPR0hTUUMrOEZQNWdFTVMvOHdKeldLeDYvVG9kUmIxeVFFNzNpT2pq?=
 =?utf-8?B?RFFzWTU5VG90eG1Takd2MFZBbHNlMjRpb21taDlGU3BJVHlqeGMxczRrbHVC?=
 =?utf-8?B?N3lFRWVkak9YZEJYRXdDUjB3eUpwdkZOT3oyd0lFOEpDS3VhYmhyTmZjbzBX?=
 =?utf-8?B?VkNTZmExVTB5Rys3YlhrSjhNeG1wWFpXTVVaLzFTdE5PaW5QWHZYMGdKaXo5?=
 =?utf-8?B?RGRHaXVTT2hteGd2VWI5Z3E3Sk05UTNRL0VaM0NaekZ4UGlVK2VvQUFraXp6?=
 =?utf-8?B?NjVnYjdtY0xGREIwUTU4NDAxNHJRVWdSVDFyU21rK0RRbnk1WDh6eU0wUXJl?=
 =?utf-8?B?c1FJN0J0c1k0dnZUaytLdTZuYnAwSFVPbW1udzJWQ0RxcTBPR3J2YWxPc1ZP?=
 =?utf-8?B?S1dRYlR6YnRIb0lKei9aZXRqVG56MktqNU1QWnA5UlFqWlhkam9wL2dHY0ps?=
 =?utf-8?B?V2FQWTNITHlFREZQejQvTXIzdGMvRXN5bU4wL2JOWHJwZTVabUdkek1hc2hJ?=
 =?utf-8?B?QTBENUphUDl4TFltaWcweCtta2UrWWRXVUdqYU5DT1lBOVJpaXlDN21kZU5r?=
 =?utf-8?B?ZWRFRzFpa2g2MEs5WVBiQ0UyekcwLzMycG1TYjlablFaOWNBZTBIWlRvUnQr?=
 =?utf-8?B?MFpZSHUycUF1WmVISEdtNExvOUREQUVnTUxnR01LYjZIM0hjeTJ6MWRPYklC?=
 =?utf-8?B?dlZZdVhnb090ZDQzMmUwWFFOUFRyQUZvZzY3MktZanIxWTdLOUtxSmVsSEls?=
 =?utf-8?Q?P2kBDNrNrmBDhAzK3PQ9dnI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <98337C1EE9A432429398375118B2E201@namprd18.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 89d524c6-5330-4d38-3515-08ddb21aa9a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2025 05:56:14.0969
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /+dpm4hWXNKscWFChwPLzp2rCExMzb7ifjmnIO2ZRaxgkg6TK/wwiX5ldUPnyNhhEHefwVTnjuX2Cipj3aK2GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR18MB4063

T24gNi8yMi8yMDI1IDI6NDkgQU0sIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IENBVVRJ
T046IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlv
bi4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSByZWNv
Z25pemUgdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPg0KPg0KPiBP
biAyMC8wNi8yMDI1IDIzOjE4LCBIYXJzaGl0IFNoYWggd3JvdGU6DQo+PiBPbiA2LzE5LzIwMjUg
MTE6MDggUE0sIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+Pj4+Pj4gKw0KPj4+Pj4+ICsg
ICAgICAgICAgICAgc3BpX2Nsazogc3BpX2NsayB7DQo+Pj4+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgIGNvbXBhdGlibGUgPSAiZml4ZWQtY2xvY2siOw0KPj4+Pj4+ICsgICAgICAgICAgICAgICAg
ICAgICAjY2xvY2stY2VsbHMgPSA8MD47DQo+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgIGNs
b2NrLWZyZXF1ZW5jeSA9IDwyNTAwMDAwMD47DQo+Pj4+Pj4gKyAgICAgICAgICAgICB9Ow0KPj4+
Pj4+ICsNCj4+Pj4+PiArICAgICAgICAgICAgIGFwYl9wY2xrOiBhcGJfcGNsayB7DQo+Pj4+PiBO
byB1bmRlcnNjb3JlcyBpbiBub2RlIG5hbWVzLCBidXQgYWxsIHRoZXNlIGxvb2sgaW5jb3JyZWN0
IC0gZG9uJ3QgeW91DQo+Pj4+PiBoYXZlIGNsb2NrIGNvbnRyb2xsZXI/DQo+Pj4+IE5vdGVkLCB3
ZSB3aWxsIHJlbW92ZSB0aGUgIl8iIGZyb20gdGhlIG5vZGVzLiBXZSBkbyBoYXZlIGNsb2NrDQo+
Pj4+IGNvbnRyb2xsZXIgaG93ZXZlciB0aGF0IGlzIGJlaW5nIGFjY2Vzc2VkIGJ5IG90aGVyIENQ
VSBiZWZvcmUgTGludXggd2lsbA0KPj4+PiBjb21lLXVwLg0KPj4+IFdoYXQgZG9lcyBpdCBtZWFu
PyBJcyB0aGUgY2xvY2sgY29udHJvbGxlciBub3QgYXZhaWxhYmxlIGF0IGFsbCBmb3INCj4+PiBM
aW51eCBvciBhbnkgb3RoZXIgT1M/DQo+PiBBcG9sb2dpZXMgZm9yIHRoZSBjb25mdXNpb24uIFll
cywgY2xvY2sgY29udHJvbGxlciBpcyBhdmFpbGFibGUgaG93ZXZlcg0KPj4gaXQgaXMgb25seSBh
Y2Nlc3NpYmxlIGJ5IGFub3RoZXIgQ1BVIHdoaWNoIGJvb3RzIHVwIGJlZm9yZSBMaW51eCBjb21l
cyB1cC4NCj4+DQo+PiBUaGlzIGFub3RoZXIgQ1BVIGlzIHNldHRpbmcgdXAgdGhlIHZhcmlvdXMg
b3V0cHV0IGNsb2NrcyAoJiBQTExzKSBiZWZvcmUNCj4+IHRoZSBMaW51eCBjb21lcyB1cC4NCj4+
DQo+PiBTbywgdGhhdCdzIHRoZSByZWFzb24gaGF2ZW4gbm90IGFkZGVkIHRoZSBjbG9jayBjb250
cm9sbGVyIGluIHRoaXMgRFRTDQo+PiBidXQgb25seSB3aWxsIGFkZCBmaXhlZCBjbG9ja3MuDQo+
IEFuZCB3aGF0IGhhcHBlbnMgaWYgdGhhdCBvdGhlciBwYXJ0IGRlY2lkZXMgdG8gY2hhbmdlIGZy
ZXF1ZW5jaWVzPw0KDQpHb29kIHF1ZXN0aW9uLiBUaGUgY3VycmVudCBsaXN0IG9mIHRoZSBwZXJp
cGhlcmFsIGluIHRoZSBkZXZpY2UgdHJlZSBhcmUgDQp1c2luZyB0aGUgY2xvY2sgdGhvc2UgYXJl
IGNvbnN0YW50IGFuZCBjYW4gbm90IGJlIGNoYW5nZWQuDQoNClNvLCBJIGFtIHBsYW5uaW5nIHRv
IGFkZCBvbmx5IGZvbGxvd2luZyBhcyBhIHBhcnQgb2YgdGhpcyBwYXRjaHNldC4NCg0KIMKgIMKg
IMKgY2xvY2tzIHsNCiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsa194aW46IGNsb2NrLTIwMDAw
MDAwMCB7DQogwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0g
ImZpeGVkLWNsb2NrIjsNCiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNjbG9j
ay1jZWxscyA9IDwwPjsNCiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2Nr
LWZyZXF1ZW5jeSA9IDwyMDAwMDAwMDA+Ow0KIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgY2xvY2stb3V0cHV0LW5hbWVzID0gImNsa194aW4iOw0KIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgfTsNCiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZmNsazogY2xvY2stMTI1MDAwMDAw
IHsNCiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAiZml4
ZWQtY2xvY2siOw0KIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI2Nsb2NrLWNl
bGxzID0gPDA+Ow0KIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2stZnJl
cXVlbmN5ID0gPDEyNTAwMDAwMD47DQogwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ow0KIMKgIMKg
IMKgIMKgfTsNCg0KTGF0ZXIsIHdlIHdpbGwgYWRkIG1vcmUgcGF0Y2hlcyBhcyBhIHBhcnQgb2Yg
bmV4dC1zZXBhcmF0ZSBzZXJpZXMgZm9yIA0KdGhlIGNvbnRyb2xsZXIsIGNsb2Nrcyh0aG9zZSBj
YW4gY2hhbmdlKSBhbmQgb3RoZXIgcGVyaXBoZXJhbHMuDQoNCklzIHRoaXMgb2theSB0aGF0IEkg
a2VlcCBvbmx5IGFib3ZlIGZpeGVkIGNsb2NrIGVudHJpZXMgZm9yIHRoaXMgaW5pdGlhbCANCnBh
dGNoLXNldD8NCg0KPg0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KDQpSZWdhcmRzLA0K
DQpIYXJzaGl0Lg0KDQo=

