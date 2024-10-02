Return-Path: <linux-gpio+bounces-10725-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 033A298DE74
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 17:09:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB859282D4C
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 15:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE7BF1D0434;
	Wed,  2 Oct 2024 15:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="aPCXHX13"
X-Original-To: linux-gpio@vger.kernel.org
Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11021127.outbound.protection.outlook.com [52.101.129.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2871CFEA3;
	Wed,  2 Oct 2024 15:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727881777; cv=fail; b=WNCEW7VZ2Hd1oQVC3Fsw2AVeGg++dM+pVsrSb9YsCzVSwCG943aISFMIsAiiZ/3G7hAqtM2nQYTNQDGZGRe/pRKVTnLtU4W/jmG5d7P4c2g/0tuikwBIqBnvnTrZHYXCS+SYfp+axuN0HzBGayOSq+zo2zpGcjvuSZW9ko0gnNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727881777; c=relaxed/simple;
	bh=kgRdHo/XhTOEKr5+2I71LdD82XM9Vx5NVaKN0h83xHc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bDhU7A7f4ApnWzSmL0imRCM4K9pbIit/Zk034ObXAw8j6bJlTvzw0hVY7KxO3pCvc1NGv8GttXm6UB2XK/pp4ToL0sTzxb0ZRQGZ3MhgKNpJSMhdtva4AN0e4GjKWhkZl6/KWbfXiJEeqCPDGaligAEOHcoPGaCC+aDGk2tW5L4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=aPCXHX13; arc=fail smtp.client-ip=52.101.129.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wC4QrVLbcz19pcPCAwKk/dOB2iWfsqzMgkisnI0Aod3jHTOOB/uwNrkjx0m+D5sJ8Mxq+IxLaCoIexVfbYisiYhbCfWDW/koXa8dT4c8vxoE0vScq8jxmypbr676DL4gkzm8nFGcWnkVs5uoHtPKOuksCwxKUXSCX3LEO4GOO3eyoC7kQxNUdbMOx+BWPqRqnDB6qQtSnLIUhCeFNaqAEydUgKs8xCY28KtVy4xq8HGLlnKeEahaMaEa1EqMHxPkqME1D5NT3IXSpEV7Sy+9ltG3eFxdJg9HUPM6VPpE8bzHpqIdeMk2WaZAXpALxOWLsp4FkRG0fVVwtBj4btBc6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kgRdHo/XhTOEKr5+2I71LdD82XM9Vx5NVaKN0h83xHc=;
 b=dBqOzM1kEzQda/cGFTRjFN8SgEqHk5wVAI1PgOBTkuDy06XVpgpue+jdA+pxRnM/meR0Et737y0z/HMnoo39Se/kaj427m2YGhxKnXIvjQwiOCGJ1RnrkMdPL1ga+IZxJfPGeIJb4FdvsR5zBAMZw+wIbGwtbnNH0Z6NrdmE8tTmQOc5ecs1eWaCvJ4DJ/np+huSxmNqqX6pKVIp/2ZNmYcev9QqcbhC2baQZBUiZEyZx9M5pSVUk4OrCiI3DZWEWmtEEHpCd/S+CCrWAmIO2gN+QCiWuZnuAQX2w6L/6IlAbjcA407af0Y1GeQJQWgKje5Y71LGB8sQ4M6wPA/wPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kgRdHo/XhTOEKr5+2I71LdD82XM9Vx5NVaKN0h83xHc=;
 b=aPCXHX13y5Ac7gLOYo4eDu3Rk3AAIyOouQk4DystZU+3AN9/EFqeBD5m5stQfBIxy6hplFdwREfiLIU496RaE/CA6LjkTIRwMPv50YQaaDesw48tb6axH0/zToPzARkFqJR9S1jBxdsXgIv1/LELV1YQ6v1L4QkN0qet9aY0zdbmnMs+VZEbbMGyDASXqjCUO4HiuSyRO4EcRKtZdVSGrKIH0f79uje2B7g6/5tFvIqdEOrqxhM95y5VRRIKrEgkI9YN9jPKg/y/m/ChD96kbqc5bX8o9yFKEWnAheGoVtqh0wRglMe+rHvBIM9w7ajvnko7Wrd4qRpnbClS2TZmwA==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by TYSPR06MB6314.apcprd06.prod.outlook.com (2603:1096:400:417::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Wed, 2 Oct
 2024 15:09:29 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448%7]) with mapi id 15.20.8026.016; Wed, 2 Oct 2024
 15:09:29 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
	<linus.walleij@linaro.org>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>,
	"Peter.Yin@quantatw.com" <Peter.Yin@quantatw.com>, "Jay_Zhang@wiwynn.com"
	<Jay_Zhang@wiwynn.com>
Subject: Re: [PATCH v4 6/6] gpio: aspeed: Add the flush write to ensure the
 write complete.
Thread-Topic: [PATCH v4 6/6] gpio: aspeed: Add the flush write to ensure the
 write complete.
Thread-Index: AQHbCnhxj9zpVgrVIEm0MBTx4OQN67JyBIQAgAFR3ICAAEyvuw==
Date: Wed, 2 Oct 2024 15:09:29 +0000
Message-ID:
 <OSQPR06MB7252DF4BB404D5C01785BB5B8B702@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20240919094339.2407641-1-billy_tsai@aspeedtech.com>
 <20240919094339.2407641-7-billy_tsai@aspeedtech.com>
 <CACRpkdbFD9CiqVwQ5xxZ9SfQtVvDJGCr=8spxBG4u-JQ0PKJ3w@mail.gmail.com>
 <CAMRc=MdvV7Z2yPpoR9mXLH6UCF5uA=TbkC_qUSj=akP_09M0WQ@mail.gmail.com>
In-Reply-To:
 <CAMRc=MdvV7Z2yPpoR9mXLH6UCF5uA=TbkC_qUSj=akP_09M0WQ@mail.gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|TYSPR06MB6314:EE_
x-ms-office365-filtering-correlation-id: 49a93680-0a87-42a2-79a1-08dce2f43651
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Rm5DMUFmTFFmQ3pLam1mYU5RQ2tiQVYzeGdGOGZ3NzZCNnNmbkRkNnB0TFVC?=
 =?utf-8?B?QVJHTnBZVVcrNFljYkljYnE4dmZnQjN6OUJmM3J3NnhSbndFZkRuWlY2eTN2?=
 =?utf-8?B?VHVpUzk4clFYd1A5UGIxSFVtN2U5cllBbHZCRWJWR09oSFBaTitTSHRJMnNK?=
 =?utf-8?B?TUhmTDN1Uzhvb3o2dWQ2TzZtWTh1c21RUHJ6RWhEb2lPNi9wcDg5QWhQT212?=
 =?utf-8?B?MVgwaU50WVdKZkd2RjdBazA1RUVjWWZRblZXVXBRMGpYT0JlU2FpZVZTUlZ3?=
 =?utf-8?B?clQwRG1BMktUQTR4THh6a01nVzk1UnZlWGRMbWgxT0QwWjgrL1cyeE0zVzAz?=
 =?utf-8?B?aXVIZUJ0TFlSaXhxMlJLdlhHRWR5MWpVK0U4c1cxZXBScEpsTFdROWdYdVBM?=
 =?utf-8?B?ZFNnc2VFMmNubWMyWXhEcThhT3VOUGdvMmZMSmdmN0d0STU5eDBpdUh5bTN4?=
 =?utf-8?B?YWNLNGtJSFRYb0VOb3VQRlhsTEFHRTVpUHBzeVorUXFDeFRhYks2TnM5OXk0?=
 =?utf-8?B?UE5QNVNRNDQxdEN1WEhQQ3NXcTIrNHdCdWNOZ0VzeTlrREU3T3dCUjJoZWhZ?=
 =?utf-8?B?cU9VZUlZY1Q3Ni9ndDdRVmVFNFpoTFpEUUlaSlAxcjNYVXRRYU5saXVSLzBy?=
 =?utf-8?B?c1NQS1pyUXRZQi83Zzk2aTN2RTZMSFUxMjl2TGxKUVU1QWpMVWdCQ3JyY0Rx?=
 =?utf-8?B?dktkdDJVN2RXTk5yOHFzRzNuMU1uS25YbWVOR1VDN2tTb21walc4YkREMk14?=
 =?utf-8?B?c3dTZzRha2U2Rzc2cFlodGVOVjN4Q0Nlb3U1SFFiZjROVDVnY3V1VE44cHBt?=
 =?utf-8?B?c2kvcXh3WUpSczlnMmJwTXFHRi9tOEF0ZVZTMkR0c0wxNXFoUGYwMW53Y1lL?=
 =?utf-8?B?OUpTUDBXVkRZVHpjVnpMSHdqUTY0UThNajJLNXdvdk56Ykp2emlwbWo1M0xo?=
 =?utf-8?B?K3Y0UUtIakZTU002WWpnUzNmVU5EQWtSRDVMMGJpZzN1K3hSMmZhcndjcm41?=
 =?utf-8?B?dnV4N1FVZzJzR3h0bThuTkU2V2VMSXpMOTVOVWRneTd4M3kzTndmSVZMU0xw?=
 =?utf-8?B?TUovZjltL3FrVklYVnBSazVmQ0pUeTJ0STdZZHYvb3hCeFhCbmZMNS9xVGR2?=
 =?utf-8?B?ZlZLN1cyV2wxUFVMaWlWeUpBWGZsZnhDQ0h3Szk1bUpobU1iQjlYWTNiYXJB?=
 =?utf-8?B?ajJIWFppVmxjaXFmZURBTkFISXlPMW1yMitEempqSU9oOURNU0QvNkZIRmlk?=
 =?utf-8?B?TXhFTXlqTzRUQWFSYU9tYUZFMHAzRXpWd3ltY25iRGhRNFVvZjN0RkR1d25I?=
 =?utf-8?B?UXBQeTExdGVlb3hINEx0TUNFY3pVVzZESzU4cFNJdEQ1YzA2NlpiNXBXdi9Z?=
 =?utf-8?B?T3RUVDVlSjRacFE1MVV4Uk5Qc1BwWlpRMEJONFd6ekdUMlk4RjdLb1dDakRs?=
 =?utf-8?B?c3UzTGJpMnM1K0tvWmhSLzhZR2ppTjM0UjYrNUt5czdDdnJHMmhaZnBidlNX?=
 =?utf-8?B?WEN5OXQyNExpZG1JRU1Fc0ZMUmk0RUU3UlNWb0YyUHZUSzBDRHlreFhGb3Jv?=
 =?utf-8?B?VVZmc1VwaUpkT1Zkb2hRUFZUL2IwTys0cnRXa2loQkd4a0lFRGZ3V1VQRlBv?=
 =?utf-8?B?MWlZV3ZrVEpxS0k5SmVSLzAzTFMyT2p0RWZmVjVsajhxMndWcnVPZGMrenln?=
 =?utf-8?B?U0pHQnpua1llQ281aDBvVDdIMERuVHFSZU1BaU94SmdBcFhlT2pxWFlXdGt2?=
 =?utf-8?B?Z3VWOVozbUpZc1JuUzRnMndzT2ZlaHBIMHlSSmpsRWpzc3R5ZFIvcGhVbWFo?=
 =?utf-8?B?cFZqU3pDVWZiNlN6UFppdz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NXFxUXNUYjZ0U2Q1RU50eXcxaW5MUWUwdWk4TWFMU0lKTjBIWUpIVVFKaTU3?=
 =?utf-8?B?NDNtbmFVUzJkS1ptMUNyMnN2dGFDdm5UK1EyK1hVaWNHMDhxRTlnYlJLT2tD?=
 =?utf-8?B?ZFRFYkFvRWpXRjc1WGx4L3UyZ01vUC9nb1Z5RDUvQjRJdWhVdytzRmw1QnZS?=
 =?utf-8?B?V0p1Tkl3L3JJZTFmaFE5anRiZVkvbEJSaWhQTkZ0VThNUEFKMTBCMUxQeXVF?=
 =?utf-8?B?OGZIcUg5UzF2NVV6QktwQi9IUHo3ZjhGbmprY3BKTWx0eFplSWhsTlZ2VU5n?=
 =?utf-8?B?eDNwczFYZkFER0loNVRPN3ozTW1MVnlwQkNUYnN6N2FHc2NWbmpxWGl0RlNQ?=
 =?utf-8?B?UlBUZDFnbWUxMTJUekFONHJwR2toNVhnak5GMzJqeDNldnRKbkxPNndrcVFU?=
 =?utf-8?B?bFlMdUtjeDZ6M0wzbE1obE5acHl6Y1prdzdGVWswQnIrY2FGRWZUSm1Jekla?=
 =?utf-8?B?VVpGSlFTWEE3UTlGTnFkWCt1VXJYTEU5RjIrRWxaQ1ZQTUcxSTNpRWlNZlJt?=
 =?utf-8?B?ZUtXRWdKanhicWNlbVF5L3FrcjRYc1BpMnFpRnNaV0lhRUJnL0t1M0F0K0U0?=
 =?utf-8?B?ZE9yc0RMdGdwM1RJMExDTzJ2MGcyMml3eStzM3hLc1c2bFAxVnVqVTdDNmZm?=
 =?utf-8?B?cUdEangxaVBiY2p4S1JIdm4vQUlRb0dRRFNTOHFJQTM1eldFRWJmM2hSYVdR?=
 =?utf-8?B?NDFxa0tGQVFqYU9JUEFqSitLOHRBKzZvS1dEd2NDWjE1MDZkNUQzMm9IcXpT?=
 =?utf-8?B?d1lmRFo4cVM2YVJyZXpkUmRNQll1Q29pQ1NMbXdETHZDeC8vNlhMTG1aUWdt?=
 =?utf-8?B?YmNIeWlLTTZEMTJ5ZEhBRnc5RDdIQ1lZWld1ejFKc3ZZcVRZY3RiQzhMTkF2?=
 =?utf-8?B?c3BiOWNqeXdGZlBJNEFKWm83eVg4Znp3b09hbHdlSWtDZWJ0REk0ME5TZzhp?=
 =?utf-8?B?Z1FBTEcyQmVkNGlXZ3Npc0VrbFhJZFdZWHdQUEJwdmJNNWZvMlNCMUVjQzJi?=
 =?utf-8?B?eGNVYSsweTdaUWwybFJMeHloemJGMTRYKytmV1hZOEl5ZmVDdUdDNzJGWmJo?=
 =?utf-8?B?dEpuL0xBYkVpalNaNVpsbHJxbnZmUlVPTnhBU3RDa3E0RVFpUjhLMmFteE9r?=
 =?utf-8?B?THlmQ2JiUlBVYXA4ZERYc3JHRFZBbmQ4RkVCTnZVVVBtd3VOcmEyNTBZc3RR?=
 =?utf-8?B?b2pNb0ZISFlVN3I2dW9qZ3BTNEkydXYxV0czbUVQSDgrcVVQMWZMS1NRMEl2?=
 =?utf-8?B?N0hPUXFDWnRUNTZORC81ZjF6a1JMSXU0WEpjS3h4NGxHeCtVbDd5cjMwaDJQ?=
 =?utf-8?B?NmZFSldvYS91cTVwZFNLZTFWb0FlMDRYazVYZnJBMklaL2dYaHI1aTNEWU50?=
 =?utf-8?B?bytSUXdYRFhOMWhicnBHT1owOStEemdtd1NnV3NzT0laVVdFQy9tU1p0OWU0?=
 =?utf-8?B?Y3Q5dG9LdVdMWkg0bWlNTVJVRTkxRWZhY05oaVNobURrNGo1bHpxcEN2NlhD?=
 =?utf-8?B?bHI4anIwclJZQVVkcmNGNXdhWlZMMEpZWE9ySWhwNzdFZm4rZVBnWERvKy9p?=
 =?utf-8?B?eEhudUc3OWErc0JBS2wrRmNKb25FQ3crYjZXOG5vQU5zVklZNXBzampFT08z?=
 =?utf-8?B?MG1rbWovaHFmeE9tdm9scXIrOWVDUDJsQUJ5dHNkbFZiTEdrVjVsb3lGK2h0?=
 =?utf-8?B?a2p4aGxHNUNHaHhsOUxFNld2ZGdGRXU4REI2NWdSUUJNZFpYOVBsMVNqdUR0?=
 =?utf-8?B?NTJBajU2d3R5MmVCVnA4b1MyYk5LV2txZU4ra3hCbCttNEgyaTBGYnM4NmRi?=
 =?utf-8?B?M3dHQkVqa1dWOWRIR1lvazl5N3BaeDBtRFppTE1BZE9NYVpwcmgvdS9zSTFB?=
 =?utf-8?B?Tlp2Vmd4elJROE5zTHB5ZTMrSmgwekdoeTZtYkoveitNUTFENVp2UzN2NE96?=
 =?utf-8?B?ekJSNW5taGxBL1R2SHZMSE9FUzhHNnRYMTB2R0huYVVjbnk0eG1EaHdYMGtC?=
 =?utf-8?B?NWRtVUtlTXEwUVRFalVRQzJvb1NiTkNSVWs1akZGY1RuNmZma3dCRHpBU0Fm?=
 =?utf-8?B?d0VpMGpGallFVnVhdC9jZWZPV1ZsWXIrVTY5ekttbWNna010T01BSFdCcjFy?=
 =?utf-8?Q?eIj/IzuASbwVfWe8eL9JjLuHZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a93680-0a87-42a2-79a1-08dce2f43651
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2024 15:09:29.0824
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i6VxcfYRKTG2bSNZkRlYutV2jV58WtJwhpFsUSO4YymG7O9cguYwi6tfZ94HHA9KyYmFNQFVXUNjjL1N4XB9lZ8KL4UvewxDbLptiLBBve0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6314

PiA+Cj4gPiBPbiBUaHUsIFNlcCAxOSwgMjAyNCBhdCAxMTo0M+KAr0FNIEJpbGx5IFRzYWkgPGJp
bGx5X3RzYWlAYXNwZWVkdGVjaC5jb20+IHdyb3RlOgo+ID4KPiA+ID4gUGVyZm9ybWluZyBhIGR1
bW15IHJlYWQgZW5zdXJlcyB0aGF0IHRoZSByZWdpc3RlciB3cml0ZSBvcGVyYXRpb24gaXMgZnVs
bHkKPiA+ID4gY29tcGxldGVkLCBtaXRpZ2F0aW5nIGFueSBwb3RlbnRpYWwgYnVzIGRlbGF5cyB0
aGF0IGNvdWxkIG90aGVyd2lzZSBpbXBhY3QKPiA+ID4gdGhlIGZyZXF1ZW5jeSBvZiBiaXRiYW5n
IHVzYWdlLiBFLmcuLCBpZiB0aGUgSlRBRyBhcHBsaWNhdGlvbiB1c2VzIEdQSU8gdG8KPiA+ID4g
Y29udHJvbCB0aGUgSlRBRyBwaW5zIChUQ0ssIFRNUywgVERJLCBURE8sIGFuZCBUUlNUKSwgYW5k
IHRoZSBhcHBsaWNhdGlvbgo+ID4gPiBzZXRzIHRoZSBUQ0sgY2xvY2sgdG8gMSBNSHosIHRoZSBH
UElP4oCZcyBoaWdoL2xvdyB0cmFuc2l0aW9ucyB3aWxsIHJlbHkgb24KPiA+ID4gYSBkZWxheSBm
dW5jdGlvbiB0byBlbnN1cmUgdGhlIGNsb2NrIGZyZXF1ZW5jeSBkb2VzIG5vdCBleGNlZWQgMSBN
SHouCj4gPiA+IEhvd2V2ZXIsIHRoaXMgY2FuIGxlYWQgdG8gcmFwaWQgdG9nZ2xpbmcgb2YgdGhl
IEdQSU8gYmVjYXVzZSB0aGUgd3JpdGUKPiA+ID4gb3BlcmF0aW9uIGlzIFBPU1RlZCBhbmQgZG9l
cyBub3Qgd2FpdCBmb3IgYSBidXMgYWNrbm93bGVkZ21lbnQuCj4gPiA+Cj4gPiA+IFNpZ25lZC1v
ZmYtYnk6IEJpbGx5IFRzYWkgPGJpbGx5X3RzYWlAYXNwZWVkdGVjaC5jb20+Cj4gPgo+ID4gSWYg
dGhpcyBhcHBsaWVzIGNsZWFubHkgb24gbWFpbmxpbmUgSSB0aGluayBpdCBzaG91bGQgZ28gaW50
byBmaXhlcyBhcy1pcy4KPiA+Cj4gPiBSZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMu
d2FsbGVpakBsaW5hcm8ub3JnPgo+ID4KPiA+IFlvdXJzLAo+ID4gTGludXMgV2FsbGVpagoKPiBJ
IGFncmVlIGJ1dCBpdCBkb2Vzbid0LiA6KAoKPiBCaWxseTogcGxlYXNlIHNlbmQgaXQgc2VwYXJh
dGVseSBhbmQgLSB3aGlsZSBhdCBpdCAtIHVzZSBhIEMtc3R5bGUgY29tbWVudC4KCj4gQmFydAoK
SGkgTGludXMgV2FsbGVpaiBhbmQgQmFydCwKClNvcnJ5LCBJIGRvbuKAmXQgcXVpdGUgdW5kZXJz
dGFuZCB0aGUgbWVhbmluZyBvZiDigJxzZW5kIGl0IHNlcGFyYXRlbHku4oCdIApEb2VzIHRoaXMg
bWVhbiBJIG5lZWQgdG8gc2VuZCB0aGlzIHBhdGNoIGluZGl2aWR1YWxseSBhZnRlciB0aGUgR1BJ
TyBwYXRjaCBzZXJpZXMgaGFzIGJlZW4gYWNjZXB0ZWQ/CgpUaGFua3MKCkJpbGx5IFRzYWk=

