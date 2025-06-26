Return-Path: <linux-gpio+bounces-22239-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8A5AE93C1
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 03:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6ADB73AE91B
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 01:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F2B21ADC93;
	Thu, 26 Jun 2025 01:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="Rdi8eXaz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2094.outbound.protection.outlook.com [40.107.92.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF1B1885AB;
	Thu, 26 Jun 2025 01:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750901521; cv=fail; b=eZ/sMjCjkcB7KWdg+IGawwE0DAoVB/ij1ziacJu1u/UlSsTWhxc+QvpeRGNNMCyREX5ynJkS9jdZzhOmW/Znx+7ZaPJ4kCfDF9JqcpYvIffW0IWdpLiL4nDIUsrkQC6Xz4X6iDkEu5UnIm9ltLwCV0zQDBbq0mR3NdlUysX8g/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750901521; c=relaxed/simple;
	bh=L1HkfPIW48Dy7KMFGgK2SH2tXq8SP4Yn/vJ87N2eejI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=l/pG4XKSOc8fIqrYknPfK16matcxEt3coe4IguwoRvMBLC0FaMkUOYqLh7Cz5G7mSHeOsmNQgkqK35rQbDEwgHXRAl9PBLU/13Aqr1yQlXSaVLMubn9BaYoDUcwf0taEr72XcBklwaoDv2K5SgyqbCme+lcNByaVTD+Pq4LREV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=Rdi8eXaz; arc=fail smtp.client-ip=40.107.92.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=keuRQvJKgT2H2O+rdfPo6o4D2mWzgKLuI8PwelK0s8kUuWnmQU3/3oenLaagmMmMoQHFSyUMKCC/RCgcCwIfFhQrxFdoQE14/IwdqDkaVc1eN8kQ06mYJzxu3syyF692CjzODXOL689nFXLqkzOrmt3BX/buwKZNIfZRXz6UkBO6a8EPG/fSYj1rsizl+O6qcLM2fQmHTRdgDdCT727Fft0kZbwsBohZv3GXzqHfZRkTTN0+Oledj1z4fYlncoF/yZBZ5jbVWAS0/LZF8J6n0lem0oIUQs11kE0ADRCL15h9ovdMdTTT3coanYs7Z6XQO4NfEsl5pTLBKoJw9F2CrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L1HkfPIW48Dy7KMFGgK2SH2tXq8SP4Yn/vJ87N2eejI=;
 b=SwyTRZZCgbNZlULHu/eoqp8FXtwx9GFskJp7vkTX3g0CHfjHtwp+pTwVFca2w520pCFWYMDlaYBuW+YdRt/diCj9qwuL/HYRm4pu6lxyjiT28B5Voj3z7PIbOk43QI2fwXDm52kRt1MNI+gaag2eITBSpp29TazE3TdvJvSNw35wfUtHz2hqOnku83qCsl/DOI8nhkwZQeVTIKXoXia085gadxJibx1hP4iQYUHaqmc1Xr2KZ+lRpnlSDHeadVagh5XZqG7GHL74B7ZbfeuYalCO7n0yRq4pA8q2RKDYyXr4oIjHk8p9hh0QsExjEX+/yiVAN/fWSHXrHcJqKsswpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1HkfPIW48Dy7KMFGgK2SH2tXq8SP4Yn/vJ87N2eejI=;
 b=Rdi8eXazNI1nEOrALgDM0eSqyUlBYVySCEYKwcl6cd2mHI35dOT1zOzyScbIFlSw43+TdK9/vV5e5ccexJIvyb24+VYCZxofY47jI8f8pKBFeGApP2xWxvbIn7g+SYBcudybaPDIwxBM4nDIPgn5WT68oiDL+amPtycbB4W9x2u87Qpje5CC5r1AzGvrBaYpJOlpbdv+JO7PO4NQvU87ZpPZZJJUqhSgag/+zMQNsmCUkpVwoHNeU81KPO9V76++YDgaQVjVkPxlmh5bq+h+mHSIZP5Jxj1eOO1ah82pAj20oRvQzHidKh2uqHk0sbEmT0sSlIXLYmBahPpJPM0kVw==
Received: from IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 (2603:10b6:20f:fc04::c3d) by SJ4PPF797E39E53.namprd18.prod.outlook.com
 (2603:10b6:a0f:fc02::f27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Thu, 26 Jun
 2025 01:31:54 +0000
Received: from IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 ([fe80::ca34:e235:13d9:3f5d]) by IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 ([fe80::ca34:e235:13d9:3f5d%5]) with mapi id 15.20.8769.031; Thu, 26 Jun 2025
 01:31:48 +0000
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
Thread-Index: AQHb5GREkMWleVUwnEujC+sUqBlKs7QR3j8AgAFHOACAAEApAIABRb8A
Date: Thu, 26 Jun 2025 01:31:47 +0000
Message-ID: <a6e27c0e-0703-4444-b6e7-d4db1340e802@axiado.com>
References:
 <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-0-b3e66a7491f5@axiado.com>
 <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-5-b3e66a7491f5@axiado.com>
 <0709a0a6-1313-452c-85e7-2926a6a03741@kernel.org>
 <19d78e69-4a38-420b-b9f8-d0eb90cdcaf6@axiado.com>
 <a0feb67f-3a73-4247-8383-7255616cb22b@kernel.org>
In-Reply-To: <a0feb67f-3a73-4247-8383-7255616cb22b@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PPFBEC4B1F8E:EE_|SJ4PPF797E39E53:EE_
x-ms-office365-filtering-correlation-id: bc88910c-febc-457e-92dc-08ddb45137e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?d1cydTVKbFpDWEIreXVXSUNlVWNVT0FTRUQxR1VSRXRnNU9YOHc1NjJpVDJw?=
 =?utf-8?B?Zm1iQ0xxbWl3My9UWFM2bTBpaGgyRG9sQ0Z4YXE2dEhkd0JFME42aGwvamlE?=
 =?utf-8?B?Y0grZldJYnY1YzZwdVRxNVFiU0Z0NkpUemJDRkRibUZoUVZDYVova1lTdDZO?=
 =?utf-8?B?ZWFrL2NmOW9SQk14ZjV4djROanBKVytMVVNKOTZQVHkyRFQwZjl1dHVianYx?=
 =?utf-8?B?VFl1VmFFKy9KYlpqOGZ1ZEM1WURJWis2Q0IrbE1MK0paYkQvOFlESUxlUnFv?=
 =?utf-8?B?Vkg0d1F5b2ZhOEZmT2FPQ0NpRHVmSmlaVWQrMkV3c2kxRXVIOWlGL3loVCtB?=
 =?utf-8?B?NitFY0F1NWRqTlFxVThKMnVkT1NYQTNiN0hNTnpsbU0xSUk1ZU93T2VEa1Np?=
 =?utf-8?B?WXdERlNPTDQ5SUtCcS8xbEdCdGlGcE1YS0VTcnk4eGFtRzgrTzRuM0NvbVgw?=
 =?utf-8?B?dEkyb2ZmLzN0bWhPMVh5dWNhcnJnOThibUowSGZTaTM2bjV1TnhOMUJLc3pp?=
 =?utf-8?B?eWpOSlJ6dlMwWXJlSkxkQ0VHalFVRGpTQitmVVBYQ05LaWllLzc3NTMxVXJr?=
 =?utf-8?B?OFc2eTdIbHZmY0RObjNjckJDblhiVEZwNSt2dTcvbVNyNytiZHFaUmJhL0h0?=
 =?utf-8?B?U0ZZZVl3amVaSnMwQnJoU1hEdGdUbmJrTTQzOHdBVUpDdGxaT29xdnFKSnZ5?=
 =?utf-8?B?U2dLMHVDaTRFN1lHNlhMWHkvelB3RlJrSUlsYjJ3cVpIUVZDL2xKN2h2SjdP?=
 =?utf-8?B?TzFxOEs2U2lwWGQ3Ny9Sa3NuR2NLS0M2Y3UyOFE1dTY5K3lodjlIUFByeUg4?=
 =?utf-8?B?aGY2dlByU1I3ZGE0NHhnUG1hTmphMTFCQUJPVG0rRGdRQ3p5M09scmtNZ3VS?=
 =?utf-8?B?VFg5aEVRQzVsbSsrc1BISEtmN3dmRVNvclpJVzFRaVlHL0t3ZkY1bDYwTHQv?=
 =?utf-8?B?dkdyUmk2ckg0SWRuZzhrZ2V2cW9icTVlaGpHUWtmOHlFOVZpUkVtUzdWenNB?=
 =?utf-8?B?MnFMSzBCUk5paVZDK1lWS2R2Ni8wNzFjcFBJOVc4bisrZHV2WVZiNHBCdDR6?=
 =?utf-8?B?eGNVNDZQMFcwT3N4ck9kQWtEL2wwcHJjc2x0eVMzd2RSekxVM1JmaEZza2Vh?=
 =?utf-8?B?R3EwdFl4UDVoM0V3cUxmNXNTVDRJa0VNZTZmNkNBcGs0d2FvS1IrL1FYNmhn?=
 =?utf-8?B?Uy9pRjNYS1ViUEZWUFJLWllBZVhDTnBtNWxNTk9GTWJ0L1VtMzhBVXRNOUFa?=
 =?utf-8?B?S1UrL2Rva3pFQWxUczNQMmZXM0w3TDhXRFRKSjBDYzdnTi9lK0NBWGdtcWRL?=
 =?utf-8?B?UzkxcFhIUUpjOTVIL3RMVDNldW9LK2FpRlNPekNmK254aFp4MUVWeTArRTZq?=
 =?utf-8?B?aWxSVkk2alo3SEtUOGs3R21kUzlvb3dTUnpFV2pYWng0QXRBaGIxQXpVOTNy?=
 =?utf-8?B?OUtWSUl2c241UTltSU81WStTbE5HZ1dMRUNrVVRVQXRIdnF4ZVJUTEp2aDVh?=
 =?utf-8?B?U3V2cUUrNGRuV2g4azNvaUJKVzUzUFNjYVA2VzgrRkNVYnd0dUUzQUI2OEUv?=
 =?utf-8?B?cGZWNEQ1dFFBZUI5aXBZYnQxamVxa0hreDUrUEpxSWdUZGdOcnRaRUVVU1NI?=
 =?utf-8?B?U0lGZmpiVzgzNGduYTUrcmdrUlk1bGdZblpqYXB4Q0RieXc1cGtiaVdWa3hG?=
 =?utf-8?B?WENRTlNiZGptNU9wblE0OHVyaFZ6VGg2bm02ZXlwcmNrMEF0azNKMFJ3Q091?=
 =?utf-8?B?KzVZV0JIMHRTMHNPRXJub2FHR2h5SkFvQ3BjV0RtUnZLT2dUN09xOVh1NnVj?=
 =?utf-8?B?dnRtM3B4NnFmMVQ3aStTanM3ZThXdlRhYkNwRThIRlduMThqQXFXS21IdzdL?=
 =?utf-8?B?VTlqT2N2YmQxRTlja012UTQ5Nm14bDIwYWtQZGREL293YkkwaEQzS3RoNys1?=
 =?utf-8?B?VEJ3ZEM1YTYxanltbVN3aGJXNXlJRGtiYWpBMnB4YlB1QVpMcWdkTHl5UVJS?=
 =?utf-8?Q?11zbKOyrZnV9OTg5qIXyroXXsCBO38=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PPFBEC4B1F8E.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Smg3cUtYR0pBV0NjZStBamhmNnh1aUZXV1g4MHRRS1pvWmwreGIrbnozbGhp?=
 =?utf-8?B?ZHdhMXkrUmQ0UWpmMTQxQUlKOTVuTHNNcXdUNlh1QzZlQ0QwMWlPQ2lNNnNz?=
 =?utf-8?B?TXUwaG92cHJxTWw1ckxqbkVpYTdHUnFiRUwrNTRQd2hsOFo4VWVMWWk4NTNz?=
 =?utf-8?B?NHpoclAxRHdJSStNRXczZDF1dy9ueHBCdXFnWlpkYmlEOTNodE0xcTVTY0Rt?=
 =?utf-8?B?OEg4a2RJQi9UTDFSc3l0dzZ5NkZrZThRdzBvYmJXU1dSUHl6QnppbjVYS2Jq?=
 =?utf-8?B?MEZ6WGxXQ0tvK3RZN1JidlU2bTI1TnBSZEJPWUVqMEloYnRHcDRXVDB2SjZZ?=
 =?utf-8?B?OUlIUWYxMlhmWG0wdzJkUDdCQmlUUlRraFJ6SjFCVjJCdmNDM1kvclJjbWVM?=
 =?utf-8?B?dEZhb0lhT3JCTG9qekpiRVNieEhmRUNkZlpGQlNYakRsb0VoeXZkUDV3TElU?=
 =?utf-8?B?Tit4Z01DVFpadkpZdlJ6dEVHcCtCaUN5KzUvWGlQbGNYaGp2UmpVYWIzQVV1?=
 =?utf-8?B?TkNrOUk2eURKMVR5M2ZPUnQwZWhPbFBocURHQkZHNFpNVXhkbkxmN2EzZWwy?=
 =?utf-8?B?LzUxcVJLdVgwbjU1aGMxdmdpeCtSWWM5YWFDckhsTWxrYVpkeXIxQXNzNmFr?=
 =?utf-8?B?TkdJVkhFZDFqSDVEVnhsT0VvNElUUmU1QmNlaWpBVUV3TGxLRmxvWkx1Qm9F?=
 =?utf-8?B?SnB4VVl0NXJRM3JnUFNLODBad285Q0JlalBaTzZPcENnMStnbHdjQ1BqVjR0?=
 =?utf-8?B?UjBiZmVsZkhLbms1MFhMRk5kL0RURERsYkxhTU4vRWpIMmdtenJTRkFFYlQr?=
 =?utf-8?B?aEFnV3JucW1NTWFmM21YbHhZdjVJNERIek9qTy9JSStITUZ2MlYxM2xXT3M5?=
 =?utf-8?B?dzJMQ05LVS9obk5FcHlQMVRkbEkvTm0rZVpRYzhwS0NlTC9UcDVjb0JlbXB6?=
 =?utf-8?B?N2x0RktkcExwQmVEUDVDUkcwODJuV0JsU3UvMDExd2I1VnZtZFNBYTFsc002?=
 =?utf-8?B?SEEyRnNJaTlCeW5EMlp6d2VyZEJVOThDRHNlYzFVVnRLTWZvLzBzMUYxZndN?=
 =?utf-8?B?SGpwRkpyWkVqOWJ4UlZta0cxWDBDVWx1OVNmbDJySHkyRmhHMXZ1VU1DdC90?=
 =?utf-8?B?L0Z3WGRaa2Q5VGd5VlJicUZFRWxKTWEvZU94MU13U1oyd1gzMkcxc0pWY0U2?=
 =?utf-8?B?M1Z2bFhTK0wySWwvcm5zT3ROV1pUVktaN045RnBESHJLeWduZHNOd3FzY296?=
 =?utf-8?B?UmtGZWJ6YnRXQkE1NHV0aFlpcGZiVnM3SDNCUEc5bEFmQVFkQlFidVBKT0Zo?=
 =?utf-8?B?K09KMk8rU083NkkxUjRGUFpyeU5hUFlHTmZnbVp4OEV1YitXNmxsZGp5NGNy?=
 =?utf-8?B?TXBoRW9RL0Zic051YXZRNlVGL3FsTjdlTjByKzNuaXo2eFgreXFvUWhsUFR5?=
 =?utf-8?B?NW5kOVBORWl3V0l6dlBUWUVENEhHbloxRU9oZmw1Z0tQcDM0M2YxQ1pQVWJt?=
 =?utf-8?B?cXlvUXJ3VE4xeklKWUJ0Uk8rZHcvRU9jRGFiTVNvSTB6NFd4ckV0Yi9HM0lC?=
 =?utf-8?B?MG9sVVN5ZStwVUJ3ZTNOTXZ3WFhRYUI4cnZYU1p5dllvSUxpZm1kQ1BKcFFp?=
 =?utf-8?B?TVFqOXR5RnA2eS9BNHIwd3RTV3Y4T3czcHNocGM2MExXeEl2clpNNlYyaUZ2?=
 =?utf-8?B?ZjIwMDQxUTl5MWJ5Q0NRdVM3RHFaa093djJCWDlnNUtkbFozRWkvWngrY2NX?=
 =?utf-8?B?ejJUMGp5d1dUYXY2eVZ4dUZBL1JUZHNlNUlCcnh1dHZQa1hsSldzYlFyakNQ?=
 =?utf-8?B?RlhRTVdGK1QyZHozTFZmbFNoZWVKVHBBVzJTa0QrQTc2V01hUlRITUJ4QmF1?=
 =?utf-8?B?MGlRSXI4QkR2QlRhMEZWWkg1M3dZQnl2UkRycGRtd0ZON21pd2xiV0RpanhM?=
 =?utf-8?B?MWNHQTBkM1pwWFFwSkU0bURTQ21ueDlTdndhWG90aTUrQkRiT3ZDS3hPcFNh?=
 =?utf-8?B?a2J2V1BGcGN4dThNdUFtQ2l0dUhDTlpKZXNudFFZVzRQS1Jva0NiaklkcGNk?=
 =?utf-8?B?SnIycU9RRGkrVDEvUU9vUGEvN0o5R0pJV1dZWW1nV3o2WXB5dnREK1ZIeWp1?=
 =?utf-8?Q?92hI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <26D394620C25FF4CAF8C3A28E4788005@namprd18.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bc88910c-febc-457e-92dc-08ddb45137e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2025 01:31:47.9334
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vwelGIlb6vYcuyK5lPb+G1FmzDXMEu9WOcUUvx6Qxd+PZoN56bhReOuo/Q3pqeTmPN+CWgdgKSG06/8RZ8EAyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPF797E39E53

T24gNi8yNC8yMDI1IDExOjA1IFBNLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPj4NCj4+
DQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInhsbngsenlucW1wLXVh
cnQiLCAiY2Rucyx1YXJ0LXIxcDEyIjsNCj4+PiBOQUssIHlvdSBkbyBub3QgaGF2ZSB4bG54IGhl
cmUuIExvb2sgYXQgeW91ciBTb0M6IG5hbWUgb2YgdmVuZG9yIGlzDQo+Pj4gYXhpYWRvLiBOb3Qg
eGxueC4gSG93IGlzIHlvdXIgU29DIGNhbGxlZD8gQWxzbyB6eW5xbXA/IFlvdSBjYW5ub3QganVz
dA0KPj4+IHJhbmRvbWx5IHBpY2sgYW55IGNvbXBhdGlibGVzIGFuZCBzdHVmZiB0aGVtIGFyb3Vu
ZC4NCj4+Pg0KPj4+IFBsZWFzZSBjYXJlZnVsbHkgcmVhZCB3cml0aW5nIGJpbmRpbmdzIGZyb20g
RFQgZGlyZWN0b3J5Lg0KPj4NCj4+IFdlIGFyZSB1c2luZyB0aGUgImNkbnMsdWFydC1yMXAxMiIg
Zm9yIHRoZSBVQVJULiBIb3dldmVyLCB0aGF0IGFsb25lDQo+PiBjYW4ndCBiZSBhZGRlZCBhbG9u
ZSBpbiB0aGUgY29tcGF0aWJsZSBhcyBwZXIgdGhlIERUIGJpbmRpbmdzIGRvYy4NCj4gRXhhY3Rs
eS4gU2VlIHdyaXRpbmcgYmluZGluZ3MuLi4gb3IgYW55IGd1aWRlcy90YWxrcy4NCg0KV2Ugd2ls
bCBhZGQgdGhlICJjb21wYXRpYmxlID0gImF4aWFkbyxheC11YXJ0IiwgImNkbnMsdWFydC1yMXAx
MiIuIFdlIA0Kd2lsbCBhcHBlbmQgaW4gdGhlIGR0LWJpbmRpbmdzIGRvYyBhbmQgZHJpdmVyLg0K
DQpJcyB0aGlzIG5hbWUgbG9vayBnb29kPw0KDQo=

