Return-Path: <linux-gpio+bounces-22111-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0B8AE7398
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 02:04:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1F1E1881E82
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 00:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A60213FD1;
	Wed, 25 Jun 2025 00:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="nwjjnuNg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2129.outbound.protection.outlook.com [40.107.223.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E634A800;
	Wed, 25 Jun 2025 00:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750809834; cv=fail; b=OXfHRfRf+HCihmP4xNTn9J7AAU1kfSXbYTGGmYz1JarlhxWQbvzAENlkv2B+C2SWu3+sy6X6oPKvCwWciF3ffhGLN2umn2f+ZkCsAzQNpD74wCANKeOu8JsewHS4y2ouHm8Yo1CWidTEiD+5DtuhKjaXpUzLqsJPY+FpSQWtHNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750809834; c=relaxed/simple;
	bh=pIJpKyik5wVXJ+37Bc0YBu7IdpRKuLYF5oeR5BUcnvY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=P4p1mNQgYBTsLmkQN0OnAFaJaroR5RV+fNuWcLIAQxdiGwD5ElivQE7BqGV2nAd2T/qqWT6RY6EnqGWDSTtF0s1oLHwyGGSQLvuRap1KARwzG2jx7T0w1UN5sq+MCiGJiEMOcEXXa+Tx+dzAsWE4kDUkUQXP+WFg7bHV/7SzIcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=nwjjnuNg; arc=fail smtp.client-ip=40.107.223.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EPrcOD/rF8zinPC8dfX2zOLcalmRhRNQda6NF3v9fcQetnGKkFySLYK6CnQvvulwFRT8eL5GxB04AaW2qMocANnW2S5m3MhyxbceRoN6r9ds3/OkRHlxJi9hfhpu+8fo93xtxOFGNgGImfABQH5JidWzKBxiT8dyl5OTvxqWaveJ7l4K5H7Qk3lA45UyB69DXxrcOp13NQx2ACjNlAGOv96SyBVBDQQ74VP2gGssZvxVG1+V05CLUogkbNfxyyfji2AGS2jM8mt5Vag98MmMcKiXMLbpkFo3nhHd2jp0IvatgdD0XOLYPUbtG1VHmyYKbpDzOu9DmBf1VU7ciVUHtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pIJpKyik5wVXJ+37Bc0YBu7IdpRKuLYF5oeR5BUcnvY=;
 b=ixYk4oEf383xrax+G/EGESnZnp9jlZDPN8NaLVk4Z2uNwnb/hPY6RvkW+L6JeVRQ1bGakTYzbemkAJ5mCMH4iOXWaxwZs7XQkEQOD+AyNVWihnNSThUiF4XiDdrKDU9aktq/vkb2v3pXj+cNd0P19vvVZDBhIfLS+hmrgDIGym3aTBE6UafV4gZYJoMns/4czDkW8LIADU5rwy/eIYg69nFzhaUbUjwLxZknml0w19mmq29CoRIsz+2CWOdcUdG7Se1pFTqEd5JD3h9L7YIwTRTezoG3ojJ1OLg68X7XfOG1vw79MT8SKstJhbs/KITE6Xf/4HE2mYf/SKJASoFWjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pIJpKyik5wVXJ+37Bc0YBu7IdpRKuLYF5oeR5BUcnvY=;
 b=nwjjnuNgxfuv3Dy71NPfkOCMsBLTK6FIY3SrZkTDEAszqfFdH1miEdnZUbj/ZpoJRKvu8ucraJ3gNneTo9LgRcc7+HaurM0zH8oWVBFx6r9uWTPmz5lyzq9ky+i6NLbQEI5l+ftsb4Z9g9uPuGTlyQV5RHkBoEb0o1ckooL6gzqORl8M54t2lSKBENv6vwVhUSvnMTcFnQ8ykAq/pYc2o9Gh7+mMoeyGRG88jItJBg6MwI7+Ghs/2BlylltkCjur0+R97goq7NtcRr+hJLHqzhJSnCaS+2zvkKom88c9Z5O4Y+e8wtHs8Ix6P2kXATA+XAYqYqx3nMNV/MeFqZALkQ==
Received: from IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 (2603:10b6:20f:fc04::c3d) by MW3PR18MB3547.namprd18.prod.outlook.com
 (2603:10b6:303:2e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.37; Wed, 25 Jun
 2025 00:03:47 +0000
Received: from IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 ([fe80::ca34:e235:13d9:3f5d]) by IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 ([fe80::ca34:e235:13d9:3f5d%5]) with mapi id 15.20.8769.031; Wed, 25 Jun 2025
 00:03:47 +0000
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
Subject: Re: [PATCH v3 4/7] arm64: add Axiado SoC family
Thread-Topic: [PATCH v3 4/7] arm64: add Axiado SoC family
Thread-Index: AQHb5GRDcU+gXuhxdUexCCnNl65TzLQR25wAgAEk2oA=
Date: Wed, 25 Jun 2025 00:03:47 +0000
Message-ID: <e5f0d70e-ccce-4261-bb94-1d468fd8bd38@axiado.com>
References:
 <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-0-b3e66a7491f5@axiado.com>
 <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-4-b3e66a7491f5@axiado.com>
 <2554a571-0b00-41f1-abd4-00bdd34e6834@kernel.org>
In-Reply-To: <2554a571-0b00-41f1-abd4-00bdd34e6834@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PPFBEC4B1F8E:EE_|MW3PR18MB3547:EE_
x-ms-office365-filtering-correlation-id: 91aa3e6a-c80f-41b4-0e4a-08ddb37bc1fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|366016|376014|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?aVlTL0lBQm9GTkF5cHZ0eUU0dkNnT2l3TnQ2MmkxbDNwMXk5QWJxQzJuTmNt?=
 =?utf-8?B?bjhvN0IwM2RCZTlaRlFJTSs5T2s0Mkl1RkM4WTVXVnZ6N3pwWXdiVTRxQjZj?=
 =?utf-8?B?U3pOcnRvZDFrNFRuQmE0Um1kclJtdGFZL1h4UzRBK1k2UnZmS3RzREdlbUh4?=
 =?utf-8?B?TEVHTVljMkl3L0dSUDJRMGdMNFJSMzlnbnV3U2RQN3BFUWVZSTFqM3BJV0JY?=
 =?utf-8?B?U2Vmam5qdDFhNU1hUEU3U2xjVnFJUWwyTzZHOTdvNWtzVHNBdzhXRk1jT2hs?=
 =?utf-8?B?VmRDTzlGSk9TSHdmNm9uNzE2eDVQT3FUSlhXbVdkNy9IL3BuQ0NmalN2Z2FE?=
 =?utf-8?B?MHM1ZUxDZ1A3MytWQ2FhL2JPU2ZLSnArb1Z1ejIvdjVTUHI3ZjV5R2VsSU9N?=
 =?utf-8?B?SDMxRDJ3WFh3aWJtVCtmRjNsWTR1ek9mMFhLTWQ0OUVESEEwZnlXYXdqV0My?=
 =?utf-8?B?R3Mxb2t2NzdhQ20vV3QrQjFPS3JPbkVzS29hTlRRV1JhNU13K0NHeW9ybU5x?=
 =?utf-8?B?WnpkUndpUlV4RVF1b0ViNWdZbVFYQjhQbHVTdFZ3czVlQUQ1QVpQTWtRR2dV?=
 =?utf-8?B?WUJWTDdEOWZEcmJ2Y0lLcHZOWWZsQWh2N0l6cEFqU01SeGNSNWlzcjBiWW5p?=
 =?utf-8?B?MktOTzB4emlSdmc2azBDR01JZXM5c2ZqVUNqVnpsdDNVUHdJVENRNm45bDM1?=
 =?utf-8?B?Ui9jRldRMWxJbStyQXBTSW1qcDlhNncvY0JoQTBXbkVYNGUwU3JLc0FJYk1N?=
 =?utf-8?B?MzBaVjIwZ0M3TGJFcnpLNXhSQWhFSndWdzZLSmNBZHdVNWRJRVNGR2hZdnZB?=
 =?utf-8?B?UUpMdVlTTkJuQmUvQXB6SDlLVk5mcllHaUx4WTR6aHpXdFVPWjhVd0lKUnRz?=
 =?utf-8?B?WEtiREdGZTI3ZzZHd2NscWg3WWRKdkdPOWNTYXYxTnk1V1h4NUdKTnFQWTZz?=
 =?utf-8?B?cjhrdFVpNEVpY0lmZWk5MGVSZ242R0p5V1FlQmZvTHUwWHZSUEkxbkg5VlJ4?=
 =?utf-8?B?dGEyUnpsQkF5YzdialFOYXpKeGtSU00zZXZQdy9kUnIvMXA2QldEd1dCKzNn?=
 =?utf-8?B?blpwcElYazlCdnAwVEFxeGFyZ1ZsdG9FaWNBcHJia1RkVndSQWduRWw0OXdO?=
 =?utf-8?B?b2VsVmJCWkJCUjhnV0RFSngrV2p3Y3F4ekNPVWZJSHNxOW9sUXF3d1Zic3Ja?=
 =?utf-8?B?R0xQSnN3dGUrMFVMUnBrbEc5RFcycDcvOEJiQTVVWGpvd2JTR2tYeVVqOU5z?=
 =?utf-8?B?Z0tNRndNSEYrNGxlSUFBYzM0LzNnVFVsQnA2VmJySzU1bWNyYWZNaU5OZG45?=
 =?utf-8?B?NU8zNGFQSDQrbnN1V2NBYk1OcXdpWXlaZWR2ZGwxNWlESllmUVBMOFl2QVpn?=
 =?utf-8?B?dVFiMDJZTXBEcHp1S0tOM0N6NEN3Wk5jQ1ZsWkFja3dzbi9CLzhsQVZnMDNO?=
 =?utf-8?B?YnpKbHNzN0p6bWdXMEhRWE1RSmVwTWJuMytkSE9GM2lzNUJPaE9EajMycFY0?=
 =?utf-8?B?Vnd3RDQrbjBueEN5S3grYStqZ29DYU53cWFLM28zQzJqSGF2ek1ha1MvV0xu?=
 =?utf-8?B?elQ4WDA1NmdZOXV3QnNFWGNPMWJ2dzFjalBQelhaV1ZNQjlJRjRQUWNVZExt?=
 =?utf-8?B?Q1dJUDBMZzJJR1p0VDFubWlNRC9hemFhZm1penRQaXIvek9LWWs0emVnNHhw?=
 =?utf-8?B?dlZCcU5qSjZrb0k1ejVKTmRLVjNIUlRUVVRIaFUra3ZOQkttM2ZTY0pub21W?=
 =?utf-8?B?Ynh0MjhpRlU2dHpoYTFFL0pTZnhNVlRyWkdaWnBkalhPY2JZNXBHcDRwSVhE?=
 =?utf-8?B?ajZYRm9NdUpmM2xCOEtYemZKTG5sclovVzZpR2d6b2xaY0YvSUxCODE2YUdl?=
 =?utf-8?B?Mnk5amF5TTVUeVBGZnZ2TW9GKzczZjZzTGhPOWdYeUxxa2VMako0THJsdzBK?=
 =?utf-8?Q?tcXbUBvKBk1EXv+pQMXOHeADZW7LIUDP?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PPFBEC4B1F8E.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U2N0YlRKWkNRRTVCbG5OWkdjejQ5STJBKzhpUEZEVWFCalhaRUpCNVBTdGxH?=
 =?utf-8?B?MzdEdXZ4N2d3dGMzTG82ckdiWFJwdHc3dVVKWStuSkdqM3ljMEd4RHVBbldp?=
 =?utf-8?B?Ujk4bXFuOWJwSWxTdnVxZ0tqYXRaY01ESUJ0R1hYRlRRaFJJeDNiZFdzKzVX?=
 =?utf-8?B?K0lRQVF1MjJjRVBYeWZ2N1lkWHRXWUlyeVIwYWRyVTBPZUZjTTJCK1FPR0Jy?=
 =?utf-8?B?TjEwckt4cjBFdWQvaVRvdHFsTUVzalVHYkxVd29CNlFVdlB5RytnQTdUV1RX?=
 =?utf-8?B?aU9zblFlRnEzdHRMLy9nVzRlcllock0yQUw1WHA2emc2QWgwRFAzVzh6dkFV?=
 =?utf-8?B?NU9aNXNwc0EvSzNjNG1QY0t3cFJUQlhvOEJ2YU11cGF4K1Z0SkRHK2laWDBy?=
 =?utf-8?B?UmFPK0xoWldGN1ZTL2JqTVVkTm9ObnBWUjVqTEN3cGRKQ09uNkR5RDVISnhh?=
 =?utf-8?B?MWNDeFlrWkpWY2xNb3lEaWIwNis0eXZuWmxDWk15OUpxTEt0dUN4bE9yK1Bp?=
 =?utf-8?B?N002MER3RjhvZ0RvQ21WUUUwdW50NnJrUEhWVXZrWGpaVnhmZHNxbHRUN1RQ?=
 =?utf-8?B?NTRTdWhkVFBLTCt3TFpSd29FTFRRSk1IUlVuOU1mazJUem5UZlFxN09nSHk0?=
 =?utf-8?B?WDJvV0pYTzhucXJVNXdUb243VDFTenl0NXJCSmZya3lxM0UrekxRdUdJMVdh?=
 =?utf-8?B?UUZINnU4ZkoxR1RuSU5zdzNWZFhSTWp1Ly9mcW9XbTBDZ1dGYmdaaG5IS1cr?=
 =?utf-8?B?cldUYTFhRGlhMVI4Qnc5RVFZNUNYeklyZWhEWVNSdkc0TC9zNS9aWmdieThQ?=
 =?utf-8?B?eGVVRXA1bmV0ZS8weDVpTE5oOHJ5Z1RkdjU0NEQ4c1d6WVpVSTlURm9Nek1y?=
 =?utf-8?B?V0J2OW9oajF6eVlac3BwdUtPQ2IwRWFlNW1mTlV0WmMrU0NLaEw1SytHTHFa?=
 =?utf-8?B?MGRDNmZyalhIczgwRTNBYWhtSjY4cGhLRFhMVWt3R1RJTkQvNFhhaGg4Q3hF?=
 =?utf-8?B?VmFnREdQb2pWT0kyb3c0aVJ0ek1UYmlFVXVyWlR1ZWxFQ2VNWEZ2YzM0R21E?=
 =?utf-8?B?NkRuZU9abml6bzFlckFKTDQxTU14MW9heGJRaHpBRlE3d21CTktBcUk5RW1k?=
 =?utf-8?B?VzExemt5elhvOGcvdXN5amd2NnE1bVBaa2duekNVK3FRTHVRUVpSRGJETlZh?=
 =?utf-8?B?eCs2eDFiMEhXZGYxVEN6RzdpRkJmWVRJNG9zeitRUE1md29WRGl0by84bzJX?=
 =?utf-8?B?UWtoVjhWK1dQbFBwc0syc2ZDTFo4Zm1UL0FneDB1U2c0MXhUb1RxcStFTGhh?=
 =?utf-8?B?VmpPYnp1QmpaZnEwWXZ2THR6eDAvZWJtRzV0M2F6M1dsYmpPRlljTkRTVFFT?=
 =?utf-8?B?K1ZKM2JWSXdnUmNhMkFPZVU5c3NCRlZhc2ttcGRJempUcUFZS29xenhoZ1B6?=
 =?utf-8?B?QVBtZ3BiRjNDRTdha1VNVGU3OTJ1c0R0YjNsSU9aUmtsbHBRdkFHdzNyQzJ0?=
 =?utf-8?B?M1k5Nmt3YUkyMTk5c3Uxem5BR084NWJGQzhKRmdRY3ZzSEZHRythVnhnMG9P?=
 =?utf-8?B?dUlab3NNQXJGQkNPU1V1UnFicGovdEp2U0JZRmpiRXFIQWdCbGJJWkk4dG16?=
 =?utf-8?B?MG5rejByVW1vVGhQcGE3YlVyOFI0QzJxbkI1dVZPTTFJS0lHajJOa0NLejFT?=
 =?utf-8?B?MVlxWVVSNjhYcWtoWVptYlFmeDVCYTc3djJDV1lCNCtQWXdMVUpJUXdHSUwr?=
 =?utf-8?B?ZFh0Y3FjSnhDMjgrekVmZDIyYVZTUUlBRmtyelNMWUd6STJLenozUXlRekky?=
 =?utf-8?B?VE9rNDM4d1J1L2Yxc1dpZnQwTlU1SHNuUXFzU2pTcWhyZGFLYXRmeGpacWEr?=
 =?utf-8?B?dDZXOXQ2VWlDNUg2WTYwcnZYZVMzUnZkNHBldGJ2TndIanNqSFJUUDBla1Vq?=
 =?utf-8?B?UGJKTFdsQXMrQ3FYcjVPUHVXNE1tWnd1RlJ1b0NZZnY4M3RHMHBTbWFCcGdD?=
 =?utf-8?B?dHN1TyszY1ZNYWxGVldJSjVrVHZGSVQ4Vk11d296Y0psQ2NxMDFmaU81c0lw?=
 =?utf-8?B?T05hazU4TnpTZ3B2WURTcGVZOWtzYmNCOHA5citVRWhRelRTcHd1dlFvMEhk?=
 =?utf-8?Q?4Cl4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F1DAA97208754B43BCA74BE506B711D8@namprd18.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 91aa3e6a-c80f-41b4-0e4a-08ddb37bc1fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 00:03:47.3037
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sTOfPIJfaaqfKjrkOWG8T+6lZS4aRTncwUsLQWXv03+KIo/6CLt5c9Vfqt95k29WcRlDLDBygN4Qnbbr0e3qOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR18MB3547

T24gNi8yMy8yMDI1IDExOjM1IFBNLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPiBDQVVU
SU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6YXRp
b24uIERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVj
b2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4NCj4NCj4g
T24gMjMvMDYvMjAyNSAxOToyOCwgSGFyc2hpdCBTaGFoIHdyb3RlOg0KPj4gVGhpcyBwYXRjaCBp
bnRyb2R1Y2UgQVJDSF9BWElBRE8gdG8gYWRkIHRoZSBzdXBwb3J0IG9mIHRoZSBBeGlhZG8NCj4N
Cj4gUGxlYXNlIGRvIG5vdCB1c2UgIlRoaXMgY29tbWl0L3BhdGNoL2NoYW5nZSIsIGJ1dCBpbXBl
cmF0aXZlIG1vb2QuIFNlZQ0KPiBsb25nZXIgZXhwbGFuYXRpb24gaGVyZToNCj4gaHR0cHM6Ly9l
bGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMTcuMS9zb3VyY2UvRG9jdW1lbnRhdGlvbi9wcm9j
ZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3QjTDk1DQpBZ3JlZWQuIEkgd2lsbCB1cGRhdGUgdGhp
cy4NCj4NCj4+IFNvQyBmb3IgYXJtNjQgYXJjaGl0ZWN0dXJlLg0KPj4NCj4+IFNpZ25lZC1vZmYt
Ynk6IEhhcnNoaXQgU2hhaCA8aHNoYWhAYXhpYWRvLmNvbT4NCj4+IC0tLQ0KPj4gICBhcmNoL2Fy
bTY0L0tjb25maWcucGxhdGZvcm1zIHwgNiArKysrKysNCj4gUmV2aWV3ZWQtYnk6IEtyenlzenRv
ZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4NCg0KTm90ZWQg
d2l0aCB0aGFua3MuIEkgd2lsbCB0YWtlIGNhcmUgZnJvbSBuZXh0IHBhdGNoc2V0Lg0KDQpSZWdh
cmRzLA0KDQpIYXJzaGl0Lg0KDQoNCg==

