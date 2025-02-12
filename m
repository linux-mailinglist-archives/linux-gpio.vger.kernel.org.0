Return-Path: <linux-gpio+bounces-15857-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5B5A327D7
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 14:59:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F0B57A1F82
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 13:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C55420F08A;
	Wed, 12 Feb 2025 13:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=BLAIZE.COM header.i=@BLAIZE.COM header.b="StFRaGfm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-0063e101.pphosted.com (mx07-0063e101.pphosted.com [205.220.184.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE2020E310;
	Wed, 12 Feb 2025 13:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739368718; cv=fail; b=SJ0WDN/YWivrwJV9wOqzgfXmZ+1XQUywFkCyDSTcF1DYFV8Uk0ZlPYCVsz0f3os5SGtNZ7mHQIEtmjPlLd+OsKHW7LwitKOwIEgNz4K3q7wCvwreEzzoSn9CLK9/lbBRpCgRmQD1ZG0b3nKMhmL4zFgE8oiEcyLce3DQjCjGUVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739368718; c=relaxed/simple;
	bh=awUHMfuL8rTISk+QYJBUgTicy8I93tjlNXUdV9Qo06g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=U3M1RfKM1AjS5Fqdk3qFWp4EedIvndzd3p4xpJiY5ai7010ZvHRBHrY/adBhhq6IGPSkE3ZyjrjDvAa8/I+AWiIU4SX64OoSALjVVs+RNm0iL+d21mxxbl0eCX73fs7GLnNeAfmOrkh0j0o7ATVM7laSl3bG6pPLRB328Gf5Dt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blaize.com; spf=pass smtp.mailfrom=blaize.com; dkim=pass (1024-bit key) header.d=BLAIZE.COM header.i=@BLAIZE.COM header.b=StFRaGfm; arc=fail smtp.client-ip=205.220.184.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blaize.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blaize.com
Received: from pps.filterd (m0247495.ppops.net [127.0.0.1])
	by mx08-0063e101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CDLEpW031943;
	Wed, 12 Feb 2025 13:47:01 GMT
Received: from ma0pr01cu009.outbound.protection.outlook.com (mail-southindiaazlp17010006.outbound.protection.outlook.com [40.93.131.6])
	by mx08-0063e101.pphosted.com (PPS) with ESMTPS id 44qwtd8sy3-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 13:47:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DkdmXdb9ucw6yUw5Z84A7DXQa2ybHGrI7Cez59DokFNZ0b/gwEOnYPmiz8St6BYd6Gq+U+ywQmb7KiUCmo+/WglNCdCyGPOCjal/NFJSW1dIiVQxeXi3AJBmeNsOeIODcYE4Xb0+gHKnWOfaUWw1yB0CFIOPr3XA6aM/feNb/7OOIIrE9LHRNScFvQj22TOtDZg8nqoGeP2GK9as8s6AltS2dbpy3+tb9vrL5MWaM2XCjuvMuMGzuW89BjRAeBktRGCazzfi/Zt4P+Pyhftiv4JRcgv0VFnujhNtrczvqinN+FEs5o6+pPRDkODaJmJZ/d7ZOCQnvx/+4fU2Q6trdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=awUHMfuL8rTISk+QYJBUgTicy8I93tjlNXUdV9Qo06g=;
 b=S+6xdYt480dHg4Itcj8nEFpZX+lXqZwAw40SQ7Tbi62EFk2kNT8DKRHL9dnznSjM5RDgSWjKUShyQaaFtpaZg7xWfnNvqDpcQ6MKxJYz9oOQafH2sgih5JQ6MUlFrTBwO1QJlFEVJ/ma+PjEgLMYol7H64ZilIxC5HmZrWbGnBBI5GI9B0eB7AocLHl5/gTYNJVmRpXnYzBUStMf4ZOgRospPH/2DE1hfFKt5hyCM61TgkQRbIQ7/Q9P2D4SDwKuuHLZ6wltwS6gcjGhOEQiXEtTQBTzAYuczKi9D06/Amv13v7adHmKVsN5LHowpudd3a5HE1RltLsiw8/tpxO/MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=blaize.com; dmarc=pass action=none header.from=blaize.com;
 dkim=pass header.d=blaize.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=BLAIZE.COM;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awUHMfuL8rTISk+QYJBUgTicy8I93tjlNXUdV9Qo06g=;
 b=StFRaGfmnk3HEcAHF3SvIKwfGA7jXwePHwJv0evYy6rQbmWRNzmn4UegyS7m6aY1sqTG5apOwwrMqFVhAULmP1XVc7NA5gK3RCOh2foDTNQBWYhIThRrNflsU5Ffj2cMsqccfypEDSH/S/A/HvNTP0djwCkaEhh+tsMVgyIO9pY=
Received: from MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:12a::5)
 by MA0PR01MB10196.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:127::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Wed, 12 Feb
 2025 13:46:52 +0000
Received: from MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::309a:12cf:74a4:5655]) by MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::309a:12cf:74a4:5655%4]) with mapi id 15.20.8445.011; Wed, 12 Feb 2025
 13:46:52 +0000
From: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        James Cowgill <james.cowgill@blaize.com>,
        Matt Redfearn <matthew.redfearn@blaize.com>,
        Neil Jones
	<neil.jones@blaize.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz
 Golaszewski <brgl@bgdev.pl>,
        Matt Redfearn <matthew.redfearn@blaize.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        Nikolaos Pasaloukos
	<nikolaos.pasaloukos@blaize.com>
Subject: [PATCH 2/5] dt-bindings: Document VeriSilicon APB GPIO driver
Thread-Topic: [PATCH 2/5] dt-bindings: Document VeriSilicon APB GPIO driver
Thread-Index: AQHbfVSSTpvyU60QdUO68FRWGQydSw==
Date: Wed, 12 Feb 2025 13:46:52 +0000
Message-ID:
 <20250212-kernel-upstreaming-add_gpio_support-v1-2-080e724a21f3@blaize.com>
References:
 <20250212-kernel-upstreaming-add_gpio_support-v1-0-080e724a21f3@blaize.com>
In-Reply-To:
 <20250212-kernel-upstreaming-add_gpio_support-v1-0-080e724a21f3@blaize.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0PR01MB10184:EE_|MA0PR01MB10196:EE_
x-ms-office365-filtering-correlation-id: 2b16f719-fc19-448f-2fe5-08dd4b6bb4b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?USt1cDJCK04yZk4xYVl4My9aVll5T0dkSGs2K2IrcUVmaGxPL0VBMFNPNmRH?=
 =?utf-8?B?cGpTY0JkYVJFbFRzMGVkZ0xtTzFJbE5WUTdFM0xNQjc5eFlLNDExSjUzSWhl?=
 =?utf-8?B?YnVTYTF5c3FaaDFoK3gvbHF5WnI0OWhXVFZhNnM3bHVobjJuWlA4UEFqRlp6?=
 =?utf-8?B?cGQzTU94eWVwaW1SUGR0TFRXbUJKOEtrZ3kvQnc2ZmhVbG1oZDNHeDZ2Zit6?=
 =?utf-8?B?VDh2Z21BOXFTbGtod2xoT2tIdnQ4d1FiTFk3Z1BCc2xNOEYzVTRHWW45M002?=
 =?utf-8?B?UkJRVDV0OEUzWEhsa0Z2VG5MWlN3eDF0dllCOFBWb2pramcwQWQxdzRyOVFq?=
 =?utf-8?B?T1BvbTBWVEorK0szeTg0TVE4Z2RzNGhNWnVyMjdXNFpFOHRBS3JnRzBFeHBx?=
 =?utf-8?B?d1ZCYTB0WHBRRUx5ZUl3bFJtZnM2Yjh1YjFRT3JYbG9qZkd3MVFmR1RMMHlE?=
 =?utf-8?B?dEpMc3RyOFhuczlld3Rja1FNNFpiTVhzNXU3OTlzWEJXQUZXeSs4eURqYUZT?=
 =?utf-8?B?aDZBNElQUFVKNzhTWTVFblBlbzY2dENTdDZWL2xHdDF2SHlqWVpaYUtXN3VS?=
 =?utf-8?B?SU56dmJyU1NzTHQ3Mkcyd1BVWStBaXkwSEpnVFY4WGxzUlVKek1WNW1DaU5l?=
 =?utf-8?B?ODRFYUpVcDhGeTF2cjVERkpMTkdpa1BSRWZpUEtHdmt3eUVKdEROWDVzc2N5?=
 =?utf-8?B?Q3RuOTA3MDlmUnJaT3pvUTQwUGpFNkdxSXhKV2JZQnJJYkNFRXpKVzBLNTZr?=
 =?utf-8?B?ZWIzMlNSQTB2bmJ0SUtJYW5USnFINGVJdmpLMHgySkFjK21IblZTUUpONHZu?=
 =?utf-8?B?VGgwOHJNNlQ1Zkw2U1FjNmlZRzc2M2czVFVjWWc5c1BnQU1SOVRyR1hZQWpl?=
 =?utf-8?B?VVVJVXRDVXNleHl3em1teHA1OWVBRVhIblBzTkptR0d1SmFtdndzODlEdGF5?=
 =?utf-8?B?M3hnRkRHeHdBb01XMGZocHZwc1M2RnRuSmVGVU9kUG9PWWYzVkNuQjRER0Uz?=
 =?utf-8?B?WVVCSGU1NjRhcEM1TDl2bTduUktQMDVQUGlYVER3U3RHb0YvNElmazRpRjY1?=
 =?utf-8?B?MU1vbWh3dWQ1aUJQcFAwampOQVdlelRTUGUxMk9Rd2dIMDZTdURPQ2E4ZEZR?=
 =?utf-8?B?NXowV0FUcVdTUVdpSEZESUQraTFrVnRkVUN1LzB6WE9oMVN2TUhiZEpxS1Z5?=
 =?utf-8?B?Wm1uZHZqcXFiM2tyZ3lkWURRN0hnb2ErVDFFS2J0ZHlTK0FyTGFRSnZZeTJP?=
 =?utf-8?B?bWpLcGY3MUxzVXJMZ2dXdGRTUzVmMlRqbDJoM0NuRDBxTnVyR1drcDFPcG5x?=
 =?utf-8?B?Z0JpN0NDbTBOQmdBMVdJR0ltZlFpQnRXeVorN010ME5sNWRDK1Fac0UrTUln?=
 =?utf-8?B?NmMwNENGMlNPbHNLb3A1d0FRbGd2MjB5Vy9oT3VKbkFKNWJRcHB4Y0JPVnBj?=
 =?utf-8?B?RGhtNjJzWGdwMklRbURHd2Z2MFNOdG5qWEhMc3c2TFpkaE41dDdhTlQ2aWta?=
 =?utf-8?B?TUtodlZvTkZMamM0blNpeWVqcGFPY2xYeWJtMEg5TXdtZXhjRzZDVU0xNFBI?=
 =?utf-8?B?T3lIeXRhbHA0UitsWGt4MXRTdXpBOEpBdGI1R2xSK1RxRkw2aWc2SkROSWY3?=
 =?utf-8?B?UlVBMDdmSC9CWnFuNUpiSlY0UTY3L0FEZjJyek5mQ1hWV1JJWDI3NjBnTE1N?=
 =?utf-8?B?QTAyZkRsbnNieUY2QmNKMUJUbzI4eVpYVkZOcHlzTitRSlU3Z2FVWm1yVHV0?=
 =?utf-8?B?c1FPNVpkdzU1bDZPUU1ZdFc3eEhQeFNtZzh5c3dnQWNUcEN0U2Jjd3N4blQ4?=
 =?utf-8?B?ZlE1aktmeEZtMk9mdXRrSmRoK1JqdHBRR2RsNWEwRXEwaXoyL0ZjVTB2STZv?=
 =?utf-8?B?ci9mUjBva3hieXhybVQzK2Fab3NncndxTWt2cDNFRW9MeWc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T1Awb3NLU052VU9mNmc2YW5ZdmRjMXpiMHZham5MQllCS0FoeEdVWUtXaVlo?=
 =?utf-8?B?bmZUSVFVQUlPcmNJV2JPRHdHeHRtalRTRFp6cmJBbXo2eUVSRFZFYkxlQ1pX?=
 =?utf-8?B?TmIxMUhxRWpWM0VoYXdEV1ZOS1dKeG8yNDM2V3liSS93dHFZNEhYQUN5R2Ez?=
 =?utf-8?B?ZXZ2dG95SXZSRHVWNktxdHdOaE1xYVVHcmxSV05YS1Z3OGFabVNXSG9vbFN3?=
 =?utf-8?B?TURJSWdEQmFGQXpTUm9rL2E3RC9tTjA4dUdEaEJWSVBSZnhuakpFamN1MEgy?=
 =?utf-8?B?NHM5UmtrK1BTVGN0WWtkZTRyQ0pUemZ4dGxtSkV1cVM3cEhaN05WS1dzYXZY?=
 =?utf-8?B?RVR6ZnM0Q2xKM2c3aVp6aENKa0VNMWcxS0k2K3dSZDRFWmhsdCt0NG5RVzJw?=
 =?utf-8?B?SWpiZllxN3FNNUxRd2VZa1JhNDVCTjI2bEFKc1FnbDM3d2RNZjROd2tIWWxr?=
 =?utf-8?B?R3pYa2xPb0xzbzlIYzQ1bUQvZGVEUkxoaGNtdGhDekNqdTd5anlDS2VDaEVv?=
 =?utf-8?B?MUZhQXdTeEllSHVTS1BsakhpNTc1dlpLWHBYdnVHWTM0ZzhlQ0VWSmRFdzZZ?=
 =?utf-8?B?bXhUbkZiVERJY3dlenlUQ3lZY2pVd1BjNk5tbTRGL3hYSFNnWDlWamdveTdC?=
 =?utf-8?B?LzRxa0puZzhjTkNRdjlxTEtnN0hzQ0ZGY0dROFY0US9adTE4V256cXdBc3lY?=
 =?utf-8?B?T3BIZURyZUxmcnU5NTZFd25qQlBZTnEyb0Z5OTdTa0lORlBqNEU2TVZRSk9N?=
 =?utf-8?B?L3BWdzFVSHNCSkJaNjZHVzdTRFc3MnBxZG1DakFQVHpKQjVUUFFJS3FGTVMr?=
 =?utf-8?B?cy9zd3VqZmJSWVFWTUVFK2dxNytnTjNoTk5xV0s3dVozbkpuMGN4UkFTd25E?=
 =?utf-8?B?VHZRc2R3ZkZkeHdlOTBUc3d5QVpZUFJJZmNoVEtLaHNjRlFJMlpvUDNwNU0z?=
 =?utf-8?B?TGpNVGlWUCtDZXlVTWdiQ2ZHMDFubGIvVzY0WVIxWEFMVnlucXgzZzZlYUhk?=
 =?utf-8?B?U2dCcEh0dzlobXhnZy9YSFk4UUR0NnoxWmY0anVmb0ZRQzlyczhvbWplbnM0?=
 =?utf-8?B?OUErWkQzSnFFNVU1OXlndFlEdDVySFQ5M29YdjJRdk1NVUt0UTAyWXZGczJS?=
 =?utf-8?B?VEI5aW50UDE0TThobmc3Wjc4Qlc5YUpuZ2FJNHpUM3d2aDdMbk9zSk1xekdH?=
 =?utf-8?B?d2hpdzlFNnZaRE9rRU5uOGU3KzZXR0tOa3lpcTR4anlRRTBwRHZIL1VZYklQ?=
 =?utf-8?B?b29ISTMrclg1ZlFmODNWNkd0R0NyRVNybk1KK0NOa3doRXVVOVpxZWsvNkZ2?=
 =?utf-8?B?cHVUZ0NWbS83WGFxWVdwUXZnWC9OR1Z3eVpTcXpQUHpzUURZKzg4TTNjVHda?=
 =?utf-8?B?V3AyYkwvWkxLVE83SjNNTTB0Y1RRRmREaytyMWRPeDNyNld4WFNWN3JYYkZi?=
 =?utf-8?B?U3pRcVA4S0dyS3lsdDFiRmZNTi9uRXNycDRJUmlFVjA2Y3JjbWhSVkV2cExx?=
 =?utf-8?B?RVhNN0NPaUVIb2J3ZGhJam5EVzM2dnZXNjVtR1BzTnlXT0JVQ2R6SkQ3dmRI?=
 =?utf-8?B?dkQyUW13QkN0MnVHS0s0NTBoUDNLcXRlTUNEK055MWFmejZYVWR5WTJXL3Jm?=
 =?utf-8?B?NlpDREJPeFh4WTQrZGZPVm9URi9wM1JNODd1WkpuK1d0d0d2SWlZV2k3d1I3?=
 =?utf-8?B?LzFYSDNhWkJ5a1JIclJIdkxRSlNhQnV5SEhmam1wYTBEKzBNa2xJVy9mWVVj?=
 =?utf-8?B?SUlLblNHNjFXUS9SdUFKWVBCY2dCN1dSL2R0aHJNRUNaY2lSUjc2UFJ0Vk10?=
 =?utf-8?B?L3BDVE5ibUZQakJkWm9pZUJMZ05WeVBhbERRRm1VTHBzcFpTOXhXMW1QenV5?=
 =?utf-8?B?Rm5CaGhLZHJkVWxEQlVLWG1vb1phUVRhLyt4a1F4SU1hUGxHbkVwdW5Ed3dr?=
 =?utf-8?B?anF0dEY3SzNWTVpCQWp1LzhOM2hGaG9MODdhbmV5OXlxcU90SjFTc2kxWmo1?=
 =?utf-8?B?ZWJYTGdjb3VEekhCdGkybFExVHVzaGhRbGtyc2IwZUdBa2VyTEFlYitNSWR5?=
 =?utf-8?B?Y2hSRUVQZ0lwNlI4UVZhd21SaVBsdWFJZEVkcExZcm1xK3hIOSs2TG00bG5x?=
 =?utf-8?B?b0RMNEh6MnlaM0t0ZEl5Rm03YUJjTEh3Q2cvUWtOZDI0eXdHRGo0QjZZaUV0?=
 =?utf-8?B?bGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D0F18ADD85B0214BA3C8ECFFB7405E90@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: blaize.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b16f719-fc19-448f-2fe5-08dd4b6bb4b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 13:46:52.1755
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9d1c3c89-8615-4064-88a7-bb1a8537c779
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r+yqskJTblfVnxaFsgxU64pWjDQod3ubsWJgMqI4o/UUPiuSVgQfEHl7GoIwH/5Zq1kll4GHTWz2EPJ1eibT4JhOWGq7Otg6H5g9h2/7Rlc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB10196
X-Authority-Analysis: v=2.4 cv=ALxkcdDx c=1 sm=1 tr=0 ts=67aca654 cx=c_pps a=TXs1g+7sIME2BPo3OSn30g==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=4MthsM0t3ikA:10
 a=-5LYVjoNHPMA:10 a=gEfo2CItAAAA:8 a=SrsycIMJAAAA:8 a=TTxV7h_1yqWNZ0CMU5MA:9 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=zapPnUM7SFj2ezx6rUw-:22
X-Proofpoint-GUID: av7BiCyyUm606-CvkNxytzdiJRG3wYay
X-Proofpoint-ORIG-GUID: av7BiCyyUm606-CvkNxytzdiJRG3wYay
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_04,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Reason: orgsafe

VGhpcyBpcyBhIGN1c3RvbSBzaWxpY29uIEdQSU8gZHJpdmVyIHByb3ZpZGVkIGZyb20gVmVyaVNp
bGljb24NCk1pY3JvZWxlY3Ryb25pY3MuIEl0IGhhcyAzMiBpbnB1dC9vdXRwdXQgcG9ydHMgd2hp
Y2ggY2FuIGJlDQpjb25maWd1cmVkIGFzIGVkZ2Ugb3IgbGV2ZWwgdHJpZ2dlcmVkIGludGVycnVw
dHMuIEl0IGFsc28gcHJvdmlkZXMNCmEgZGUtYm91bmNlIGZlYXR1cmUuDQoNClNpZ25lZC1vZmYt
Ynk6IE5pa29sYW9zIFBhc2Fsb3Vrb3MgPG5pa29sYW9zLnBhc2Fsb3Vrb3NAYmxhaXplLmNvbT4N
Ci0tLQ0KIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwaW8vdnNpLGFwYi1ncGlvLnlhbWwgICAg
IHwgODMgKysrKysrKysrKysrKysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCA4MyBpbnNlcnRp
b25zKCspDQoNCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
Z3Bpby92c2ksYXBiLWdwaW8ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9ncGlvL3ZzaSxhcGItZ3Bpby55YW1sDQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uNGEyOTNiNDRlMDM4OTViNmE0
NWNiODVmNDJjNDdjNDZiNjRmNTYzOA0KLS0tIC9kZXYvbnVsbA0KKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwaW8vdnNpLGFwYi1ncGlvLnlhbWwNCkBAIC0wLDAgKzEs
ODMgQEANCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBCU0QtMi1DbGF1
c2UpDQorJVlBTUwgMS4yDQorLS0tDQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1h
cy9ncGlvL3ZzaSxhcGItZ3Bpby55YW1sIw0KKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9y
Zy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KKw0KK3RpdGxlOiBWZXJpU2lsaWNvbiBBUEIgR1BJ
TyBjb250cm9sbGVyDQorDQorZGVzY3JpcHRpb246IHwNCisgIFZlcmlTaWxpY29uIEdQSU8gY29u
dHJvbGxlcnMgaGF2ZSBhIGNvbmZpZ3VyYWJsZSBudW1iZXIgb2YgcG9ydHMsIGVhY2gNCisgIG9m
IHdoaWNoIGFyZSBpbnRlbmRlZCB0byBiZSByZXByZXNlbnRlZCBhcyBjaGlsZCBub2RlcyB3aXRo
IHRoZSBnZW5lcmljDQorICBHUElPLWNvbnRyb2xsZXIgcHJvcGVydGllcyBhcyBkZXNjcmliZWQg
aW4gdGhpcyBiaW5kaW5ncyBmaWxlLg0KKw0KK21haW50YWluZXJzOg0KKyAgLSBOaWtvbGFvcyBQ
YXNhbG91a29zIDxuaWtvbGFvcy5wYXNhbG91a29zQGJsYWl6ZS5jb20+DQorICAtIEphbWVzIENv
d2dpbGwgPGphbWVzLmNvd2dpbGxAYmxhaXplLmNvbT4NCisgIC0gTWF0dGhldyBSZWRmZWFybiA8
bWF0dGhldy5yZWRmZWFybkBibGFpemUuY29tPg0KKyAgLSBOZWlsIEpvbmVzIDxuZWlsLmpvbmVz
QGJsYWl6ZS5jb20+DQorDQorcHJvcGVydGllczoNCisgICRub2RlbmFtZToNCisgICAgcGF0dGVy
bjogIl5ncGlvQFswLTlhLWZdKyQiDQorDQorICBjb21wYXRpYmxlOg0KKyAgICBvbmVPZjoNCisg
ICAgICAtIGRlc2NyaXB0aW9uOiBWZXJpc2lsaWNvbiBBUEIgR1BJTyBjb250cm9sbGVyDQorICAg
ICAgICBpdGVtczoNCisgICAgICAgICAgLSBlbnVtOg0KKyAgICAgICAgICAgICAgLSB2c2ksYXBi
LWdwaW8tMC4yDQorDQorICByZWc6DQorICAgIG1heEl0ZW1zOiAxDQorDQorICBncGlvLWNvbnRy
b2xsZXI6IHRydWUNCisNCisgICcjZ3Bpby1jZWxscyc6DQorICAgIGNvbnN0OiAyDQorDQorICBu
Z3Bpb3M6DQorICAgIGRlZmF1bHQ6IDMyDQorICAgIG1pbmltdW06IDENCisgICAgbWF4aW11bTog
MzINCisNCisgIGludGVycnVwdHM6DQorICAgIGRlc2NyaXB0aW9uOiB8DQorICAgICAgVGhlIGlu
dGVycnVwdHMgdG8gdGhlIHBhcmVudCBjb250cm9sbGVyIHJhaXNlZCB3aGVuIEdQSU9zIGdlbmVy
YXRlDQorICAgICAgdGhlIGludGVycnVwdHMuIFNwZWNpZnkgYSBzaW5nbGUgaW50ZXJydXB0IHNp
bmNlIHRoZSBjb250cm9sbGVyDQorICAgICAgcHJvdmlkZXMgb25lIGNvbWJpbmVkIGludGVycnVw
dCBmb3IgYWxsIEdQSU9zLg0KKyAgICBtYXhJdGVtczogMQ0KKw0KKyAgZ3Bpby1saW5lLW5hbWVz
OiB0cnVlDQorDQorICBpbnRlcnJ1cHQtY29udHJvbGxlcjogdHJ1ZQ0KKw0KKyAgJyNpbnRlcnJ1
cHQtY2VsbHMnOg0KKyAgICBjb25zdDogMg0KKw0KK3JlcXVpcmVkOg0KKyAgLSBjb21wYXRpYmxl
DQorICAtIHJlZw0KKyAgLSBncGlvLWNvbnRyb2xsZXINCisgIC0gJyNncGlvLWNlbGxzJw0KKw0K
K2RlcGVuZGVuY2llczoNCisgIGludGVycnVwdC1jb250cm9sbGVyOiBbIGludGVycnVwdHMgXQ0K
Kw0KK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KKw0KK2V4YW1wbGVzOg0KKyAgLSB8DQor
ICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hcm0tZ2ljLmg+
DQorDQorICAgIGdwaW86IGdwaW9ANGMwMDAwIHsNCisgICAgICBjb21wYXRpYmxlID0gInZzaSxh
cGItZ3Bpby0wLjIiOw0KKyAgICAgIHJlZyA9IDwweDAwNGMwMDAwIDB4MTAwMD47DQorICAgICAg
Z3Bpby1jb250cm9sbGVyOw0KKyAgICAgICNncGlvLWNlbGxzID0gPDI+Ow0KKyAgICAgIG5ncGlv
cyA9IDwzMj47DQorICAgICAgaW50ZXJydXB0LWNvbnRyb2xsZXI7DQorICAgICAgI2ludGVycnVw
dC1jZWxscyA9IDwyPjsNCisgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMyBJUlFfVFlQRV9M
RVZFTF9ISUdIPjsNCisgICAgfTsNCisuLi4NCg0KLS0gDQoyLjQzLjANCg0K

