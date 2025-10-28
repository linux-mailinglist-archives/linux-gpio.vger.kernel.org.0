Return-Path: <linux-gpio+bounces-27764-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 600E1C1400B
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Oct 2025 11:09:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6667019C5497
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Oct 2025 10:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4713A302170;
	Tue, 28 Oct 2025 10:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="FTSFb0Dy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021079.outbound.protection.outlook.com [52.101.65.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC6E29ACD1;
	Tue, 28 Oct 2025 10:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761646155; cv=fail; b=C+wiRrIgVU0KVkczSU4heMg91tlcPn4x+X5H2v9D9cOYup77D6nf9amPCD5zDZ5xB7qy5xANRNVNdGabez20QtdoTKoOPhQipz1O+I6DS7sLy/gfY1WGdlx62TaNDGroUex9g0iWEViYo+p1ySUhM8Yc9RZmgAwzgUwA7GRCOPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761646155; c=relaxed/simple;
	bh=zjAoBzdydbVlrotGbMwFIpGBFue8hFkvfwfPA6+7uTc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ajhsqR17xLNg/NrDeGfKTT1xADPoWVgPOqFXRp/lLIQmHsjfBhIrRUTbrhY/7iNFI7eS66f6c7sbs/KU0uWoMTeoOcg0qN6fczOO1hjSIIo8mHuBsFrHGz26HhXXKJskpYvc3fYsZFpx0h3shdEz++A4xGZrxwO1Xn2GVDrU5no=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axentia.se; spf=pass smtp.mailfrom=axentia.se; dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b=FTSFb0Dy; arc=fail smtp.client-ip=52.101.65.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axentia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axentia.se
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mi1cVaUkIj6HyfZAZNvqk+uxh9QlbgzCYIzH7jOVg+iRcmg28y9L1aODE8XQmwCV8W+4UxiaNaB3O5Q96gvZO1K42rM9VkFWT5aYAii/SgFWXaEs51SPcT3VejeAwfDBOv2/EaTYmh2fgtWYT2Xmuym9RBRTVUBMLjnpdMZeCzpLKSVi3Mtv1zR6ZdCCHIMBs3jxwHzuQldnz+fidcIRdpVvkx9H3CpcwSCUffgkeN4n7iOd9FSgJ8K5rwovnvzv9hvKlMhuX0rF8nXSd+yNk6kb8+TiwYlXt6PyMSQzKt7atDTU+D2YadRH/E5DIEanIYBescdjJkYMveg5elBi2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZsDoUHc23WrlKm+a6fnjeSsbbWe8sa+MgydSJ6K3t7k=;
 b=WaVXFxSpgJEnjnGu24nvvkQFJ93EljNgdAPu9DE7/dd/YEcqNXqm2gJAZYQNW51OTbFv5Xc+l5XsQxVBJhzV0YwXSk+8uDYbYh61Jx6umz2IiTluMxsO1INBYO9elXpzb54QAg8f9ae+HsquklQqbU2IgBGCPsshYTBXhfirV9moo76NwVdSyGxM/vzIh+GQJSM+jSfRNYbikYsh7m4qXfjNyZNbRVQvzKsebuOFz8+Foc+2ZmkbVZgAclh8bte0zYO1uMtgTb0IgamiPHhc9ylR3WTRsq+FLIS0uM4X4UmlKwcq00G8la4/YAxDSD8Ea6dSV1XpFNEJYFwDWt8qgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZsDoUHc23WrlKm+a6fnjeSsbbWe8sa+MgydSJ6K3t7k=;
 b=FTSFb0DysfeIW5S0iquahbjxreNsVuIRP8kDO2KLYMVjG5D6+M8BzSFh5xtcInx8To/ZU94raiuwZ/MGYmM+vdZNakVif7JZGV8hUUe8IPHjCgvr3RYpWAvcRnfYySAmxhLVlw/DezYuxxP2HVY+bjv6oVzzLeO5iTn2ijarwqA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AS8PR02MB9235.eurprd02.prod.outlook.com (2603:10a6:20b:5c1::5)
 by AS8PR02MB7254.eurprd02.prod.outlook.com (2603:10a6:20b:3fb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 10:09:09 +0000
Received: from AS8PR02MB9235.eurprd02.prod.outlook.com
 ([fe80::32a9:a9e6:ded:5714]) by AS8PR02MB9235.eurprd02.prod.outlook.com
 ([fe80::32a9:a9e6:ded:5714%5]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 10:09:07 +0000
Message-ID: <db36ee25-8a1e-f95c-4ac9-867379a1a5e3@axentia.se>
Date: Tue, 28 Oct 2025 11:09:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 2/2] gpio: add gpio-line-mux driver
Content-Language: sv-SE
To: Thomas Richard <thomas.richard@bootlin.com>,
 Jonas Jelonek <jelonek.jonas@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251026231754.2368904-1-jelonek.jonas@gmail.com>
 <20251026231754.2368904-3-jelonek.jonas@gmail.com>
 <50646b88-5746-4665-8085-09e394aa291f@bootlin.com>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <50646b88-5746-4665-8085-09e394aa291f@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV2PEPF00006631.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::3c7) To AS8PR02MB9235.eurprd02.prod.outlook.com
 (2603:10a6:20b:5c1::5)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR02MB9235:EE_|AS8PR02MB7254:EE_
X-MS-Office365-Filtering-Correlation-Id: 85810a76-d440-404f-acc2-08de160a07d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWc4d3VRMDN6VGRNcWFJbDVPang5T0ZlM3l1OXFJQVRaYUpxcUtpYWMxRWF3?=
 =?utf-8?B?R0tOc2Q0cGJjeHZRaHBKYitya2VlbkhhekRUQnRFQTlwT0pxMDFkVUtsMUM2?=
 =?utf-8?B?WHlyWTRCS2hmTHpUY0lmMWZ5R1ByNTU4TGYzWW1NdnphOXh5Z0tpamtzaVlE?=
 =?utf-8?B?dGtCVCs3S1loUDZxa2FkSWFBdU1zbGZzZ3BPbWZ2SHJGTi9WY2lQQ0hqcFJD?=
 =?utf-8?B?TFZSY1FpRXZ4c3dWdkdVMStYbWNFOUROYTd3VU0zU3ZyY0w2d0dHNFJoUkR5?=
 =?utf-8?B?bjJXZ0RXaXhpK2xMNW5Ma2hnLytiMmd1NDdrWk01b3FFdDNBalFLQm1ULytu?=
 =?utf-8?B?UHpDcUJLbmt1R2ZId1EzK2drZUExVlNteFEvQlE3bmdZK29pcHVuUk1KQXpV?=
 =?utf-8?B?YVk5NHRidUN5S2U3MVBteWlWVkJEVTR3VFhvdzZwREFFUHJvYmlTbGNFQTNK?=
 =?utf-8?B?eGEzYnVySExSMVpEV0JUN01vM1FEVDMwZ0V4K0FVdGxJdWtiYTBwL0ZSeWRX?=
 =?utf-8?B?SjlXOTJ1bWo0TENTMllhWTc2YXlwNG1IeGpvMmtNNDRORFFYNGdXN3VVWFcx?=
 =?utf-8?B?Q2srRElzQ1ViaTZZRzNLV0dkVkovOUJ6Nm16akVzVHhIOVhVVzd0eTQrQ0xn?=
 =?utf-8?B?TVdsRnFvZDBQbmIrUGo1RGgwS3FWOEduT1hPRnZRMCtWbzBrM2RrczdhcW8r?=
 =?utf-8?B?dzZIb0Jub1VHeGVoZEU5Mk5wb0I2aGxqL3lYdGIxd2FTaGo5TFpsU0IwOWhG?=
 =?utf-8?B?UEhUdkRaZGFncjFEOWhwbWhmZmdGUi9tK0RRYzJESWJ3cWV6eGxxWFZNVFAv?=
 =?utf-8?B?R1NHS1RMQitPQlBEM25YRkhJai95cEl0RkZMK0xvdWJqSXlzVjdINGlQNFcr?=
 =?utf-8?B?OWlHQjZ6N0k2S3o2Y3NGK1VBKzk4Y2NWdDN0dWJYWVlYWlBDR2dZdmR4RFVE?=
 =?utf-8?B?bUVhQlR0SjRmRFhnMFZ1aWwzTy8xN1JsUlRaeVhYaW9ObENldDg4U3hQU0F1?=
 =?utf-8?B?QXpDUkdPc2hBclhDcFRDMmthSVowSnk5akhVQWtZWUQxajUzNGF5NHdNbFNp?=
 =?utf-8?B?V0JCTHdxS25Bbm1xVWpTSEpUcmFLK05iVVY4cEhMMVJOdTVRd2xBT2V4d2Er?=
 =?utf-8?B?TG1iVjJ0THJZQmVJYm8rYnJ0SDdUc3ppV09MQVdid2E3aG5KWUJoVUZ2M0xK?=
 =?utf-8?B?NVdVSDdBN2pmOG5ZMXhjWmpLUnJBQmx6NnJVMC83TnM3dWF4ZVRydVdnV0pn?=
 =?utf-8?B?K1lkdzBqRktMeFppRVEwVk5zMlRlSVdkOFVqMEpaZ2l6M2xQM2FYOWUwNFlZ?=
 =?utf-8?B?aHBzRDRyWk1nVU9ST1dLd3hzRDlNekgzWjlsUnhvVzVjaDErOXYrQTI3WVRm?=
 =?utf-8?B?RHhLVjVTVWFXeTFGUDFkdUlabzZjMDlYL1RlczFINGdNOEVHVmQvbVQ5Tk1K?=
 =?utf-8?B?SnJuZ2RkQlpZaHRlb1hZS3k1eEJETWFnMFp5TlBCZ2R2aDdwSFBqSlFNWk9K?=
 =?utf-8?B?UWJRWHJwSzNPQkNVc3BINWxvNGRSS20vZ3krajVIU2FWSzFqUytZTExGVXpz?=
 =?utf-8?B?SG5nVWdBY0k5dkNvQXhDVDZ6RXJhWjY5NGxtU1AyUzNHbFhsdXhwTTlEZlVW?=
 =?utf-8?B?ZlZleFRVNVFpR3NzK0ZGRW1NWGdIMmh3U0ZMNVVFdW10V3k2RzJJVXFBNDFU?=
 =?utf-8?B?ME5MSWJsRVhnL1JaR1dsaW81Q3BnajIvMkpWdCt2TnJ0Q3d4RS80NXV1S3JG?=
 =?utf-8?B?blFKSUlqbittUyttbVJGbVhLeFFzWkQ5WFVocFM0REJvVlM2YnJadEhBRlZJ?=
 =?utf-8?B?RTZYRUVkR3N4bndjdm5WZVh3VCtFUFlKZ09YNnlRbG5zT3U1Q3lLV0UvOFJZ?=
 =?utf-8?B?bE0wMXZuSENVZ3hUUkg0MkpLaVVyVXpBL2IrRVZEWjRRNDREamFieExFWTRR?=
 =?utf-8?Q?UQNFiZFB926Vo/unaEcLes8PhjzZcF+q?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB9235.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTVzUTFxcW8xNDcrdFdZMUZZRzN6YzFZVFljbnJGNjVSTU5BaE5YQ2ExSDZW?=
 =?utf-8?B?STY0dUt4b0xBY2w1WjRqcVY4bXRCekRXSnFsMFMyVVpGTGlrbnZNQXk3a0Rw?=
 =?utf-8?B?ZWRwM3FDSDJCaXZobU1SaGFGNTRlenJHSG1ZeGlwMnh2Rm42SUI2aWxNSlhl?=
 =?utf-8?B?bk9ORUpyV2xwUHkzVzAyZW1CbFViSmxrOUYyUjNRdDBSZXVoZVdQMXEySnVX?=
 =?utf-8?B?ZWEvZ1JrTktWUE1LUUhlTmE1V25MT3dzWCtJNndUKzJhM0F4QUZ5a2NMdFl0?=
 =?utf-8?B?cEdNbXl2cm1wK3dvb0l6aEZpSlpzbFpnL1Q3enJySUREMHdSTzB3Nlc1RXhH?=
 =?utf-8?B?d2k5UGlmOG5mdllDaGdnZmZkaXI5TnFVcUdMVDJrQzJvOUVBVmNZSGQzTWtz?=
 =?utf-8?B?aXR0SUtWNHp3WFI4ckpOaGFVakoxVE9vYkNmaDZuaFFpekx5bW5Fc2dKdjFS?=
 =?utf-8?B?dzF3OVlBV2VvRmpxMFg2LzE0aGs4bHZ3dTRoUlV1VlRnQWxaaEErSmc4bk02?=
 =?utf-8?B?ZnVHRmpSOEVLendvaUloZVYrVHNTY3hibWw3ZFMrMkVkUGhFN3hNVThtMVdh?=
 =?utf-8?B?bW9odWZaTjBUVllsbk11d0RjaXlkNUs3dXVlTmNjZmVGTWdMbS9WMWd6ekhS?=
 =?utf-8?B?MUUvN011cFYxdkI5TGREbTFhYzNXNXpBYVZ3OWpvTDFFak9KNUVnbmZHMG5B?=
 =?utf-8?B?M2J0YXJ5bmJqOU9oM2pRKzhFNXNMeTNWcTZBTjFLZi9EOVZKUDZ4cFFXb21n?=
 =?utf-8?B?dVdVaUE4YWVmZG9HU2FQN29ucEx1NFZoTHVCeHBVaGhQdTNKNFJIb1p2dGhB?=
 =?utf-8?B?TlhMZHlBWndqYXNnNWNjdGRBOFh3T2I0WG53eEVsKzFjRkU2TDNaRnBlbEVK?=
 =?utf-8?B?amZ3QXdSbXNBZCs4dmZDTnh4cEFDQ3c2OUVXTm03VGQ2SElYV0o0SklkR2NM?=
 =?utf-8?B?V3Y3V3hjeDBrY2tMT1JaSUNhZFVpeldvUnhaMEp1VkhNZ0NsU2d1L3NLenU5?=
 =?utf-8?B?UGtyYUhXQk1WVWRpUmVWd0ltVWVkWHJsMk5YMDFaR0FwTGpLSE01clhjQUg5?=
 =?utf-8?B?U2JEWVNhRXZWZUtpbUdnK0NGb0xWbDRSUDU0TUVXRmJkQzh1ekM3SVVtekl2?=
 =?utf-8?B?R1VZbm4zWm1wZWtUMkI4VlF4ajFXdStsbE5XbmtTeGljMUkrUjE5VExkd3Qr?=
 =?utf-8?B?Z1dzSld2SHZwY1g1YitoWjMvMTlMQ3Jid3hEZWdTSVh1UExkcEJjNGRoMEpk?=
 =?utf-8?B?aXJGN3VHNWYvSVZIM2ZMMGtWN2dyL3lWZ3BiOWNDVHhPTGlmUk1za29YL0NG?=
 =?utf-8?B?K1hrdWFDSUd2OE11anZsN215RFozZlgxSVMwK3YyUFd6ajdsOVhOWFBJNWt1?=
 =?utf-8?B?QXpqd1dONE9RaU0yd1JDWkpUMUc2azVhRmczSzlQQkVXVW9YTTlwMXFlTUhY?=
 =?utf-8?B?eHpXUzkxTFJMeXY2YWpuRUxwZzNZdWVqRTA3Y25mNHovYitRa0w1K0Q0dWpp?=
 =?utf-8?B?cCt0eWxpK2dMNElaTzlaeVE0UzQvbGVMYlQxUlBWekJvOGtBcWV3TUorUnp4?=
 =?utf-8?B?TGt1MzgvblF1SGhhMUkzTUtzVVVmWHFtTHVpTEN6UHdpelVLaFZ1N2E0V1dL?=
 =?utf-8?B?cHNsYmNUdEJQazV6MzNCZVVLbFdHSU1aVnU0czdxMUdoRUtwQnBKYnhKVEJP?=
 =?utf-8?B?ZFNwdUQxaGI1YWtVY21SdVNBdVdpbjJMdWxqOXZNK3c5d0RhYU1TRzRoQm9n?=
 =?utf-8?B?anQxNUhsSjZtUEg4Zi9xU3d2clM1eWlrYldtSmxpTnJmTy9HcHBKUGlva3Y2?=
 =?utf-8?B?cFpYWUYraWg1WTR5QXdJMzc5QmtWaWtKY2NRTllqM0VvMzBVR2FjbG9KWjhK?=
 =?utf-8?B?WDNSQTdIU3dBZmEyWGpKTHQvWThTR1BuS3lGM2gzbWE1SjU5MkorTnIxNVNR?=
 =?utf-8?B?diswaktxNnB0ZElVUEx0eEorRXN4TW80OTgvdjc2K0k5SkhLdWhGV3hYQlpx?=
 =?utf-8?B?M1czY3MyYmhoWEduWHkzN2VieWhSYlY3TXc4U3V0VjRIV3VScHZtS2NpQmZG?=
 =?utf-8?B?cS9haTdHa2JGcktvVTNHZTNRcHVneHI5UFpBSEtVOFBtaExtWW4rYk5wQnJk?=
 =?utf-8?Q?9E1VUyuQly72I6z0MCSZtX5P3?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 85810a76-d440-404f-acc2-08de160a07d4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB9235.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 10:09:07.1748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WJw/JHWSYpg88ihoBq4OjcMoqH4V/xYvD5g4MdOIQdP3W1kYSfDLGC5m0RZeT0fa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7254

Hi!

2025-10-28 at 10:45, Thomas Richard wrote:
> On 10/27/25 12:17 AM, Jonas Jelonek wrote:
>> +	ret = mux_control_select(glm->mux, glm->gpio_mux_states[offset]);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = gpiod_get_raw_value_cansleep(glm->shared_gpio);
> 
> Why ignoring ACTIVE_LOW status ?
> And cansleep depends on your shared_gpio line, maybe it is not the case.
> 
>> +	mux_control_deselect(glm->mux);

*snip*

>> +	glm->gc.can_sleep = true;
> 
> depends on your shared_gpio line.

Does it? In this case, the gpio will always need to be able to
sleep, since mux_control_select() may sleep. Or, what am I
missing?

>                                   Use gpiod_cansleep() like in the
> gpio-aggregator driver to know if your shared_gpio can sleep.

Cheers,
Peter

