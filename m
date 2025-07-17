Return-Path: <linux-gpio+bounces-23425-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F52B098A2
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 01:48:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD9A4A40107
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jul 2025 23:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0FD7247284;
	Thu, 17 Jul 2025 23:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="L71Dl1HI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2134.outbound.protection.outlook.com [40.107.243.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E272417C8;
	Thu, 17 Jul 2025 23:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752796093; cv=fail; b=FGkU+gydAlR4hXu6UNLrzQZKiv+jNCctD05hE2gpgL10h12vTqM2O48NIQyaZRFIGBo0eSwAMU31WnX+w22GbEkWowfh3vzEvUFb0dRNDiPua18hCrXux1GC7oiAMuVxTnT4rywv6fHmn+zsxwCOIGbBn8v85mn/3ksK1kBogSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752796093; c=relaxed/simple;
	bh=UESTmwa0ArcC9DNycDa8dhlKCmAN0isTBlNpvMFjL/I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=r5fSsS6v9vUt2B5gs99R9sloz6KZO0+HETJcSkgm9WYmia9lDE/y7zDsjMN4JQkl90ZBlrwYp8p7qH/7DOmYXGOFGYGMGba40tF66GZstsyEJbYrD5ls7JcHk/UL7S5CXwRxAShzRXJuQ96VCejt1ltbiXprRPumdDBJp3vebCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=L71Dl1HI; arc=fail smtp.client-ip=40.107.243.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rP4R3ieqQL7T8ASkifvSHU3h9nkQAun/5SHkD9AG0UWy3LdFHFIpTiCkkiHOVVmaJN83caUzI1Ptcc5YUnHLXmnVssG/X3E+p9mtyRLsU+jz1M3UzHIDXUmvRpjI1Pxmo+6pUjwVq9sog+1fu1781CYKIMHR/nER0cKaIwzZOkRu8gWzLegQR4ESo6MMDlVS2VBvzBDIb/4doO81b4VuZGj9YotyA2mQIH1bC2ulGoOpmlZOJHS1OXt9ig3em+heRvYfpCugvffZhYOSwYB6WW5whD1S3X5vhHSzaI6Z/7SyPCGH8rr3KrzJgTp9tDzzNEA747ed0ym7MHLmjN4CbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UESTmwa0ArcC9DNycDa8dhlKCmAN0isTBlNpvMFjL/I=;
 b=jld5UzpmhulOkTacYWDvJ3Bb64qG8vf1FxCw2CB8UF8PRJgSQu4T1l3o+4SXgSPmBiaPJoX9idqoFudIR3prpMgzXbfx5MkFgXRfArP2OF7QyaPn8erS++Jka/4/r4T9Q+IoOeeghkyrf0HGKTLQmp6wG2kMl2zfI83ZCFqCiHEOUCJy/ADCeCFQsQwqlmtGoTyn6odDShTm/eX90qhf1i+HG/AgWS3Uyxx9qAGHyNiAv0LOoxtvmTDcc4OvlqLqC615Ym0SVukBhzHTwduvOxFMZiS2SDoBZ39RhBO5BxdZup71JMJZh8H8hRdihhBcihXBF+HKgIHNYK66cWwEsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UESTmwa0ArcC9DNycDa8dhlKCmAN0isTBlNpvMFjL/I=;
 b=L71Dl1HIjUj8Krl8xnsH0EnSfPDJxaDMWtasQdDjrktf7ULY3MXI8fTFQ5cI7/LHKW/BkU4Qkmm4OLjwIGbe/xetYKj+RV90AmBPgC+m7qJOQHWv4BAt4xdoVuV5bJJ2XEBIjJUAbzqwpR+hmFPJC4+gXfik7pUDayY6YulVYsvmLhEfHN/vE54BQ5ZlVuz6KOp5NZ+zxwQubXJfqSbxaavxq25PxKh2TlosPoZ1cgPGafKvljC0HyQOOqz9Qr9pC+X6vfZkalmGlrs7XjBn5xYI2XRldIAL3CRh672oeTkKWEKIu5w+TCm9t8KtDZ5WBqqvoatiPoYlB6AmhtDsOw==
Received: from IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 (2603:10b6:20f:fc04::c3d) by LV1PR18MB6399.namprd18.prod.outlook.com
 (2603:10b6:408:2b4::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 23:48:07 +0000
Received: from IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 ([fe80::ca34:e235:13d9:3f5d]) by IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 ([fe80::ca34:e235:13d9:3f5d%5]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 23:48:07 +0000
From: Harshit Shah <hshah@axiado.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Jan Kotas
	<jank@cadence.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri
 Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>,
	=?utf-8?B?UHJ6ZW15c8WCYXcgR2Fq?= <pgaj@cadence.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Boris Brezillon
	<bbrezillon@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "soc@lists.linux.dev" <soc@lists.linux.dev>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 00/10] Axiado AX3000 SoC and Evaluation Board Support
Thread-Topic: [PATCH v6 00/10] Axiado AX3000 SoC and Evaluation Board Support
Thread-Index: AQHb7Ec2EpmYZb1fLEiBSh0CfO/MD7Q3Ee0A
Date: Thu, 17 Jul 2025 23:48:07 +0000
Message-ID: <b7322d03-2ff9-48a3-bdc6-0e95382ed83f@axiado.com>
References:
 <20250703-axiado-ax3000-soc-and-evaluation-board-support-v6-0-cebd810e7e26@axiado.com>
In-Reply-To:
 <20250703-axiado-ax3000-soc-and-evaluation-board-support-v6-0-cebd810e7e26@axiado.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PPFBEC4B1F8E:EE_|LV1PR18MB6399:EE_
x-ms-office365-filtering-correlation-id: 4e2c3a0b-a438-46b1-f909-08ddc58c6154
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?ak5NaHRINFM1VjA3OXc1bjE0cUhpclI1V3Nkd2FDbHJkMmxvS2laZ0ZQT0hC?=
 =?utf-8?B?bkdaZHlhU29Xayt0NWFhQnRXN3QxblhRbXlveWEzeVlURktzVWNuUFJiWE0v?=
 =?utf-8?B?SlRxOWdpaXV3TmFnMUpYb200RWppQk81RzhGUTF6WVlCNndneFVITFBKV05o?=
 =?utf-8?B?U3FjclpDbFJFaU9TaUtHaXNHQXhzUXRoSkFKKzJaNTQvbmlDeWp4aFNNYTkx?=
 =?utf-8?B?alM0Y0FEV2dId0Q1bHNwNVFQYkVSb3V0em9sRFhqOFJQRER0ZmVCTlRrMXRE?=
 =?utf-8?B?TGFUYTQvL3ErbWRIaEFDQ3NBTys5SWFnWXBFMjA2c2RFSE5JcDJQTDBxZkFW?=
 =?utf-8?B?bElnZnpOL3BwNjdWeFRGeCtXYktyb2loR3JjbkJlaDV2aTRwaVVwcUFIRWdr?=
 =?utf-8?B?YzBnWUNSNi9oLzdMNExReXdIcHBreWNwQVF6bG1yNFZuVjgwcTcyd0N5Wi9U?=
 =?utf-8?B?TDJDcWo2Z2NHZ1BGdzczSEZLdDc0UWdpRHZjd2JlRUNLMURXdFZHL040eUZT?=
 =?utf-8?B?SFlCZ29XMVM1b2J6Qmx3SkNOMDB5VWpUTWNyVm1URmw4RzQ2OG1wb0QxK29G?=
 =?utf-8?B?V3F1VU9pQjNTNVZ4cjIvcVFNVldUeVNsUzV1RGNUNUgyYi8rM0hTcnBKUEJp?=
 =?utf-8?B?NVV1MFNYZldQZlRUeTRwT09PUndSVmh3WGxOSFhYTUVqejZ1b1JJcWNXcDZG?=
 =?utf-8?B?QTNzV0dmb1hwQ3hqUjVmMFlVQWp4S2hzbHRxNk8yN1UrZEpCMUVNUDhUQlFm?=
 =?utf-8?B?aTg2RTE5aXc1NUhqQkdhaTJBdjJJQlRWcGpoa1NtTEdNNGRJU0pTdS9LTXNR?=
 =?utf-8?B?YlV1Nk1ZZUM2YWwraVlKd29ZeWxjMlo4Yjl6NXJZK3R5TW9Dd29sNjRnc3Fv?=
 =?utf-8?B?OFZrejJkd1Zod3FpVDBKTkpqYmdyZTh3dUJmR1lzRXZjQ05TdW1hWHZxbHho?=
 =?utf-8?B?VWVPRWlWdFJpNldWeTFxOVl0dWc0YXVZUlFHclJjTHNiSnJwRW9BdEtPTzd5?=
 =?utf-8?B?YkRzNnR2TjlnRkRxWk1HYno5cjVET2RHMEFvVU5iWmo2U2t1bVZLMDVWNFJu?=
 =?utf-8?B?SW5oS2ZFdHVJbFppR0RicWo4MWpDWTIzZStXUEREQUxwV09GQXFtL0VrNUZB?=
 =?utf-8?B?dVQ1VmorZUtvRThLaVlTbEVHZ1R2TlhVbG5neHN3YXVPd3NkYXIwS29OaGhQ?=
 =?utf-8?B?aUh2SDRMK3dWeGYrYVJMK1A1d3dmOVY4SnIvejdyamtxQWZHcENMaURscjFm?=
 =?utf-8?B?TEZSS2JpZ1lFc1hFdTlTYStuTG1QY09UaFdlclAvanhNbkpNbjliMkdORUVq?=
 =?utf-8?B?cWpodnRkYTAvV1hyMmwxazhBQ1RhVWpyVWNMQmR3OC96VjBvYmlGSExrQTht?=
 =?utf-8?B?L1o4UVA1ejBKUDdyQXNFMS9ma1VuMnBBRGFpdkEybTdxMlZEanN4Yk5ma3Ji?=
 =?utf-8?B?bEFKNWpEQkpsYW9FbjRqbGQ3ZlczZ3hrMkNHUE9wN3FVWXR3eVB2Sldka3lE?=
 =?utf-8?B?Nm9TaHZYZHdLbTg1QWJBVzE5eFdtZWdvZnVGeXEwcWhDZGNsVlMvblRSRERD?=
 =?utf-8?B?b3ZIU3RnaUFtcXRISStJZ2gzSkphNVRtcER0bDVieldJRnZXWjBidFRWYkdN?=
 =?utf-8?B?Q2ZsV2NuM0E5cXdHUzFhTWFYdkgwcWRKM05xK0h3M0Iza25KM3pOU0RGZ0gy?=
 =?utf-8?B?a3g1aUg5aVdzK1VrOXlsZUdJNkxTdEc3Sk5qU2V0Rnh4QU0xTnkvVC81TStY?=
 =?utf-8?B?N3NEajNyejQ5czFpMm5pcWJZZStyVU56eENjZWtOcittbmpxVXlGY0xTNjlG?=
 =?utf-8?B?TStHUjI5bTU2Y0Jnay9panpNWW4zZml4ZUZSbnNTNVRtcEpieHI3VXVlS2NQ?=
 =?utf-8?B?OHNsVUwweVNaOHBVRWFwenFERk9pdjFHS1J4bGl3dzJJNUMxRktiK0lBWHhU?=
 =?utf-8?B?QjJPN01WUUtTWnVTVExNWEhWa1RYOG5Ma2ZZZ2FxVXRtd2Jmd2syYnNSdXY4?=
 =?utf-8?Q?2SMijx4YGuylZ6R2xMJceZJJZkaC5k=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PPFBEC4B1F8E.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bENGQXRob0Z6Z1BTZVpzWG9nMXIvWW01NmZ0YVh1b3hBSjFFNnEydTN0bmNz?=
 =?utf-8?B?N09pOGdhVG5Iems5K3dRUGJSUkt3eGRxcjREUEJJeTAyVmY1dlVRZDVOWER5?=
 =?utf-8?B?VG8zc0dJNW1OYlJKUHpNV29HRGFkS1BMYlQvSEFYOWFJKzc1Wm1ZSXc2UEVF?=
 =?utf-8?B?b2J0bm1EMVZhU3p1STJUTkM5NHV2Ty9TSmNTZ21rdXo4VEFPZkNkdlFaNENJ?=
 =?utf-8?B?WTBiLzlIbmYranozVUNxN1dkMml4bm9iNktsSmlYZ0RubVQ4bzMwSnY4Q1k1?=
 =?utf-8?B?ZEl2VGg0NDZVNVB0aDBXY3pqdlJ1MVVlMEcvbzhhcE5EdjFmdXVKWnduNnNV?=
 =?utf-8?B?ZVd2eURIQ1ZEOUs4YVlIVDI2VFRkNmpwVDZTZTI0dUYybWpHM2RVNWNoak81?=
 =?utf-8?B?cXdhaWlCcXhUY2dIdkRkR0xZQWFGS3lBeHp6L2hqUXc3U3JCWkRuNGU1ZmYy?=
 =?utf-8?B?Ui85Y24yTGk1VWc5V21VV2FvK25NV0JFMkc1eGRRTm8zVnh5RkQ0MnZkLy91?=
 =?utf-8?B?WFN1MVFORkcvSEV2cCtWc0taMVdweDVITTI3WmRqc0tjL3p0by80dEZVYmlT?=
 =?utf-8?B?SzJieGhLVFNlUHk0S3ozdDVrcC9qTVZneUNzWXpFbllXekV5Tjc2TW82cDJw?=
 =?utf-8?B?MWk3OUJwR3FtTDVmL3g0dHVUdmxON3VGQnlRY3JqWmRqcGdMdWNNOFlNVTV2?=
 =?utf-8?B?V0cyQ25SczgzMFcyeDBhTUphdGJ0ZlhZSS9MYmJrOVZ5akZBVG83Vm1mdUxW?=
 =?utf-8?B?aGhWV1ZETm5vSzc2N3ErN3o5TDJhbW45cVhQVEtBN3NMdzJxam1uSnROWWNh?=
 =?utf-8?B?VlhZU2NoWGFKUTk0d043SG42TDJSTmx4WXViL0txdS9mcXpWZ1dwNDg5OGdn?=
 =?utf-8?B?akd1UERrVGQvRE5vRTJwZVZXTXF1bUwvRGd1N01uU1ptRmdNNlVBNCtSUU1o?=
 =?utf-8?B?UVMzZ05ReVBkaSt0Umw2V2dUd09TRG8zOSsvMFcrS2MzWWlhSE1UaklJa3V5?=
 =?utf-8?B?T1N3SGZsbFUvUTNKN1M4RHZQczBJdjY5VEhHTzVpc01OWGJuWW1oang2NVdh?=
 =?utf-8?B?cXlTMTBoSU5pK01zWE1PbTR2bllGdktOMG1qdnROYUpZRGl3VWN5dGpRNElD?=
 =?utf-8?B?NXZ4T0wwMU5Ya1Y3SlNsNlNyWjJCV1krZStkUVhTMkwrL1RFTG5sMEVIMUwv?=
 =?utf-8?B?Z2ovVmhVNEh1SmlqdXhwN1I3SW5RK2dTNGxQSUtwb0VqaDJuQnJsTnpUeGRH?=
 =?utf-8?B?cS9sMmdQNndORmkyN3Q5dkQvLzFYbFdDeHZjVXRCZk5pY3RwTDNlMnRWRXkv?=
 =?utf-8?B?N0N3UmNSa0ZMK0x0OW5OMGdRV0VQNlErS3crdFpXSFhkeFJFUEE2K0N6T1dR?=
 =?utf-8?B?eVp5WTVCNmJkUkNEMUJpZHpyMW9IcjVOZVk4UytjVkxWK0NMU0MxVkR3QXEr?=
 =?utf-8?B?U01XN2RydUR5dEc1RzBCdm95b2UzVitva0tHVkFnQlNWWGxZTEpyRE41WEs5?=
 =?utf-8?B?MVJ4dkR1NUd6R2dwcTNhdGVWNllPWlIrVHBwMEorTWV1T3Q0L0hUVHZlMFZC?=
 =?utf-8?B?dWlOZHBkVHN0NU5kUDRISUZ4MlIxem5OQ3RoMG55STFZWWpaMjJZQkFVQUk2?=
 =?utf-8?B?L2V1NHBXTHYzOWpsWkExL0s4Nm5LbFJseHgrRUdmL3QrcEZFb3RjdmJjTjRq?=
 =?utf-8?B?ZTJ5UlBVZHhLblpCdGc2TlAvdHpHdkNLZkNhZHV2eWVrSTRqT051aitaQ1hX?=
 =?utf-8?B?dXZIQTVCT1M3UnZkNDdSVEU1U1lobEp6UERhU3FCUDdOL1I3aE9wNG1LUUtp?=
 =?utf-8?B?QW91WGdkZklIWVA1QzZ3UTJMRk1vakpjc2ZQWmtpZlNYQ09KNHE2RENFZ2FM?=
 =?utf-8?B?Q3JGdDYwZUZZb3A2N2hBOTZTdXhjNEZQaGJXaVBuSTZnL1ZLblN4YTVUTnZL?=
 =?utf-8?B?U01lRFF6UWtlUnpEdk9tbmt5enNidUJMcWc1NjNuWndLejVNMTBHc2w3Ni9C?=
 =?utf-8?B?NFVzQXp2WlpMMEp1SytPRDVsQllmUUdXU1lhL1ZFSkdQTVdEdWJUZlllSFds?=
 =?utf-8?B?eEJaOG9nY3JVa3ZOZDVpR1VUL0QvUm9CakovSkpQVjRrWDFOQzJiQjg2ZEp5?=
 =?utf-8?Q?apiI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <90141539B03E894F8B025875798023A4@namprd18.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e2c3a0b-a438-46b1-f909-08ddc58c6154
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2025 23:48:07.5215
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BkO/MPpFHrccWZhaNBhdh0cSc/VuCMQJvWWUAJGs5brSGgC3eNAE7yyr/CGwZrt90Td8DGIpzV3tuWiBF4Q0eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR18MB6399

T24gNy8zLzIwMjUgMTE6MjAgQU0sIEhhcnNoaXQgU2hhaCB3cm90ZToNCj4gQ0FVVElPTjogVGhp
cyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0aGUgb3JnYW5pemF0aW9uLiBEbyBu
b3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IHJlY29nbml6ZSB0
aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+DQo+DQo+IFRoaXMgcGF0
Y2ggc2VyaWVzIGFkZHMgaW5pdGlhbCBzdXBwb3J0IGZvciB0aGUgQXhpYWRvIEFYMzAwMCBTb0Mg
YW5kIGl0cw0KPiBldmFsdWF0aW9uIGJvYXJkLg0KPg0KPiBUaGUgQVgzMDAwIGlzIGEgbXVsdGkt
Y29yZSBzeXN0ZW0tb24tY2hpcCBmZWF0dXJpbmcgZm91ciBBUk0gQ29ydGV4LUE1Mw0KPiBjb3Jl
cywgc2VjdXJlIHZhdWx0LCBoYXJkd2FyZSBmaXJld2FsbCwgYW5kIEFJIGFjY2VsZXJhdGlvbiBl
bmdpbmVzLiBUaGlzDQo+IGluaXRpYWwgc3VwcG9ydCBlbmFibGVzIGJhc2ljIGJyaW5nLXVwIG9m
IHRoZSBTb0MgYW5kIGV2YWx1YXRpb24gcGxhdGZvcm0NCj4gd2l0aCBDUFUsIHRpbWVyLCBVQVJU
LCBhbmQgSTNDIGZ1bmN0aW9uYWxpdHkuDQo+DQo+IFRoZSBzZXJpZXMgYmVnaW5zIGJ5IGFkZGlu
ZyB0aGUgImF4aWFkbyIgdmVuZG9yIHByZWZpeCBhbmQgY29tcGF0aWJsZQ0KPiBzdHJpbmdzIGZv
ciB0aGUgU29DIGFuZCBib2FyZC4gSXQgdGhlbiBpbnRyb2R1Y2VzIHRoZSBkZXZpY2UgdHJlZSBm
aWxlcw0KPiBhbmQgbWluaW1hbCBBUkNIX0FYSUFETyBwbGF0Zm9ybSBzdXBwb3J0IGluIGFybTY0
Lg0KPg0KPiBQYXRjaCBicmVha2Rvd246DQo+ICAgIC0gUGF0Y2ggMSBhZGQgdGhlIHZlbmRvciBw
cmVmaXggZW50cnkNCj4gICAgLSBQYXRjaCAyIGRvY3VtZW50IHRoZSBTb0MgYW5kIGJvYXJkIGJp
bmRpbmdzDQo+ICAgIC0gUGF0Y2ggMyBjb252ZXJ0IGNkbnMsZ3Bpby50eHQgdG8gZ3Bpby1jZG5z
LnlhbWwNCj4gICAgLSBQYXRjaCA0IGFkZCBiaW5kaW5nIGZvciBheDMwMDAgZ3BpbyBjb250cm9s
bGVyDQo+ICAgIC0gUGF0Y2ggNSBhZGQgYmluZGluZyBmb3IgYXgzMDAwIHVhcnQgY29udHJvbGxl
cg0KPiAgICAtIFBhdGNoIDYgYWRkIGJpbmRpbmcgZm9yIGF4MzAwMCBpM2MgY29udHJvbGxlcg0K
PiAgICAtIFBhdGNoIDcgYWRkIEF4aWFkbyBTb0MgZmFtaWx5DQo+ICAgIC0gUGF0Y2ggOCBhZGQg
ZGV2aWNlIHRyZWUgZm9yIHRoZSBheDMwMDAgJiBheDMwMDAtZXZrDQo+ICAgIC0gUGF0Y2ggOSBh
ZGQgQVJDSF9BWElBRE8gaW4gZGVmY29uZmlnDQo+ICAgIC0gUGF0Y2ggMTAgdXBkYXRlIE1BSU5U
QUlORVJTIGZpbGUNCg0KSGkgYWxsLA0KDQpUaGlzIHBhdGNoIHNlcmllcyB3YXMgcmV2aWV3ZWQg
YnkgS3J6eXN6dG9mLCBhbmQgSSBhbSB3b25kZXJpbmcgaWYgaXTigJlzIA0KcXVldWVkIGZvciB0
aGUgbmV4dCBtZXJnZSB3aW5kb3cuIFRoYW5rcyBpbiBhZHZhbmNlIQ0KDQpCZXN0IHJlZ2FyZHMs
DQoNCkhhcnNoaXQNCg==

