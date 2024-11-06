Return-Path: <linux-gpio+bounces-12648-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC679BF430
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 18:19:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7010D1C234CA
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 17:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC1F20651A;
	Wed,  6 Nov 2024 17:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="p05HpYbf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010032.outbound.protection.outlook.com [52.101.229.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AFC204F96;
	Wed,  6 Nov 2024 17:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730913583; cv=fail; b=BErjtGX9UJHNJQDYcQtftQHjnVyeBcu49Er63E3oAbKcBfJcMoVZcz7ejV+tFi6/earnz2AO71EAueHaL4SkzH8zdrcmrYt8no82WptKbBQtVZwsR5xqbDpv6dPIuA7wZM1tyXzDoZL+3pnkB0XHaYI3wFYnL7ghnq2nbQqVh4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730913583; c=relaxed/simple;
	bh=2cicAjwGRGeoGlkH3ceVLxruVJeV8oVS9FdYPraw3M8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UcJQzhehGaaKcUoxAj5cTDyOm95cVePaCPUQ7+Ap9I0JK8YzxLu7LVUOtwII5HAEUAR9yJGOxemewvQBTwzC49QX8m38COqGdrezRHN4ZJRoJli6tMY1I1QRfGslqlPMJSRTMQL+76cqlqGRww9HULt5TQazQFl4aRdr0kCoADE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=p05HpYbf; arc=fail smtp.client-ip=52.101.229.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v1BN2rZIjmWhbbUUZjRzQUtIucoqAIyoiR2SMiLmhaZT8uwgZcxA3i8GC2lxRGxNHYnlhjjXSu3vtxAQy+Iq+8dzD+iY7aEZ/obabtXhYfTdARLxtF2HSCcvpczwkJY9xUST7cdwuLoWwYi+RyhQnghqyvNET2CNyXAklz0bmJsQiXXIzssB0QvuCVWzmHTWBl7rlck6jY8bZ5d/U22AY0ZvZNUcaCLhHUhXN+mQjAcxTMeWE+flOTizcqf6VOERs1eWWkII2QJD9zzOsceznqNImbAHJiDt4wurq1Cd8eya64+y+YAlRFaGrm7YTykNTvLreUn7NPf/ZnkAxh0dOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2cicAjwGRGeoGlkH3ceVLxruVJeV8oVS9FdYPraw3M8=;
 b=Qymj2Vi3thZzrxUNkfcjq9VQUFEzzYHf+KJcRRZfUiY71I5JN9lpwMYjNomK7phUl/Qz46vzEuam4TreN33R2xZh2Bw77J5AFrNAsznxUlxWCkWTl2i5C5ukpyBjG/+VJQ6JJfQOFChCDctLxexoHLC5MKD3ddZ+W8/jbYSV6KMsPoLWHUqTg4Er8f4hr7YN298UGuXCNGjvR2L8LMSE3kLqnXXCtNiZdZUf5cHn3Xl4t+7HTATIkqo841meIcLsljnxNq0H8lVvphLELVXt4bwOxYoO4PqjmxPbMsDYSNxMNqtp3J06kMxk5dmT1fqR8dLOwgL8tEP4BQ5ejEQARQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2cicAjwGRGeoGlkH3ceVLxruVJeV8oVS9FdYPraw3M8=;
 b=p05HpYbfGE9UTiVNxccU2pWcGPprXivZ3mWkdz0KEjC2abAgd7mhe7LqkH1IbhRnmFfuLoNZvVgQxxOdHKp10IAOSaul3q38KTKd14WvDwNubP2bdZyk/kXmDDq6EdWmJBw6Lkro8hdKvaTzTUBH7+9HNL0ytEpAHUzD6w41UHw=
Received: from OS9PR01MB12389.jpnprd01.prod.outlook.com
 (2603:1096:604:2e2::10) by OS3PR01MB9864.jpnprd01.prod.outlook.com
 (2603:1096:604:1eb::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 17:19:36 +0000
Received: from OS9PR01MB12389.jpnprd01.prod.outlook.com
 ([fe80::d85d:3169:70e9:6a3f]) by OS9PR01MB12389.jpnprd01.prod.outlook.com
 ([fe80::d85d:3169:70e9:6a3f%5]) with mapi id 15.20.8137.018; Wed, 6 Nov 2024
 17:19:35 +0000
From: Chris Paterson <Chris.Paterson2@renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Mark Brown <broonie@kernel.org>
CC: "geert+renesas@glider.be" <geert+renesas@glider.be>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, Biju Das
	<biju.das.jz@bp.renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"support.opensource@diasemi.com" <support.opensource@diasemi.com>,
	"perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"Adam.Thomson.Opensource@diasemi.com" <Adam.Thomson.Opensource@diasemi.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>
Subject: RE: [PATCH 22/31] ASoC: da7213: Populate max_register to
 regmap_config
Thread-Topic: [PATCH 22/31] ASoC: da7213: Populate max_register to
 regmap_config
Thread-Index: AQHbMCVZjQuHAso13k2Di8sgESUG2LKqQ3OAgAADnACAADdkMA==
Date: Wed, 6 Nov 2024 17:19:35 +0000
Message-ID:
 <OS9PR01MB12389111288DF75C0D5C2907AB7532@OS9PR01MB12389.jpnprd01.prod.outlook.com>
References: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
 <20241106081826.1211088-23-claudiu.beznea.uj@bp.renesas.com>
 <d3c28a8b-878c-4894-aa23-5b360153b85d@sirena.org.uk>
 <bfe67d69-66ad-4121-8c54-a874c7727002@tuxon.dev>
In-Reply-To: <bfe67d69-66ad-4121-8c54-a874c7727002@tuxon.dev>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9PR01MB12389:EE_|OS3PR01MB9864:EE_
x-ms-office365-filtering-correlation-id: ebaaa2fa-2ae9-46aa-a63b-08dcfe872ffc
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MDA5aW5LQlhKN0tVUm15aVRKdTlQTWZsRkY3V3JBUUpWWG1IWkc4WjNwVWw2?=
 =?utf-8?B?NmdjV3B0c3dmdWhEV3NtenRuNkgvYllmNkN2MW84U3JFMmVXR0lGdVFFSytI?=
 =?utf-8?B?L25WdnhvbDB0aDlmK1FNTjE5eHd6TVFjODZYQzNyL1Q0dVpWQUxZUEZDZ0NV?=
 =?utf-8?B?aWFISGxaUDg3N08xMGxyMXVrWmVCM3VhRnN4V0t2UHBEaU11cFh3eEVMZ1By?=
 =?utf-8?B?UlZ5aittUENhYytCSW5xMmc2UTJlM0tZdFlQZzhpc2pZSWU4KzhxaFFZL3Ja?=
 =?utf-8?B?VVgxNGNpczZyaCtyb2I3MlN4VDJQeFBoSG52YkduRFlXRkZZYWVlKytRYzdt?=
 =?utf-8?B?aUUrOU9JNVZlSm5rMnVFWDZBZkR3S2drK29ScUZhcDNILzRiM2RJd3d4dGVn?=
 =?utf-8?B?cCtTaGpKSVQyWEJnams2S3Zka0ZDbXpLd2tuUWpkL0lZR2cxL0dSK2hUcDl2?=
 =?utf-8?B?UVRMejRnQ05ENTE4ZVBTT28yZVh1VVhEQWE2SFdyTmNRTDlaajhZZk1BdVVy?=
 =?utf-8?B?QThLKzlGYU55NjgvcnA5QWppcFlpMCtjYkM2a3U5QUFKdFUrQ3k2VERJdlRu?=
 =?utf-8?B?Sm5xZ3VNT0tCRDk2Z2N5K3NZeExKVmZNWUF5aS9rcjI0RnpDSnY4MnpaVzYz?=
 =?utf-8?B?bHBUQ1RvVUxIL3gyU1dlQVNsSW9RdnFFWWJSYTFNQzBXUkZUZFlWUkZScjRS?=
 =?utf-8?B?S1F2Y1p5ZzlkQUd3Y3hFMTR3UzdBNHpLN1B6N1JRRXVEVmdhZVU3Q1FRMy9p?=
 =?utf-8?B?QnJuUVFkeG56TUhjcmNFWXFydzRoeEV3M2Q3cmxPTWdSTmhYSmJNbmNSZUhh?=
 =?utf-8?B?YU9QZzFZSUpZT0doNy9VTUowUXJpYUxHNVNtNTFCSFI5cklvZUF2bXJYQjg5?=
 =?utf-8?B?aEQ4Y2pMdjJ3blpCVDhNcHJHM2M2Q0I3cHRSUkp5QzFaUG51N2JGMnloVml2?=
 =?utf-8?B?L2d5ZHlud1NybjFaWjB1S0MyWDk0VVk1eGk1MXdrOElrU296RzB0Y3NwcWJE?=
 =?utf-8?B?YW5PSnZpODNDZlBvL2pGUkpLZ3VaaW1EZ1YrVDVrTXZCcXJpeUQ5Z0Uvc01v?=
 =?utf-8?B?NU1LSjFXcDZmdnV6S1ZqT2hlS1lVTEVRK1lRQjdaWE1kOVc0Mk5uUjhGWTJQ?=
 =?utf-8?B?dEJGTU1QR0J0Z3F3MS9tOWRFVldMbjBTeUJvY3hNR3ZISXlnQy9xMWxPTklx?=
 =?utf-8?B?bE9hWThGdFBCYUdLM0s4dXo1dWkyNUU4RU9NM3V2T3pqeGxROEF0UXE0NDFH?=
 =?utf-8?B?UUZsZ28xTGd5L1A5YkFXNENKNzNpaEhvNnRkRCtOdVpuMUMrMkJxRGlqM1lR?=
 =?utf-8?B?cDNJV1R4T3Y5NU1MYnBYcjAyOXUyd2M0cFVNcGNpbjdWd3hlM0lBUkFiTWto?=
 =?utf-8?B?bXU1YWVGTk1LRGxNYTVwYTJITjdxN3VOd2ZXYjBMVlVVUmhLamhNODhaZHJs?=
 =?utf-8?B?aGM0NC9SUk5YTUdDOUg1MXRyVWIzUGVOd2o5T2JwWEltcnBZUWVjbCtvN1NP?=
 =?utf-8?B?LzZ3a2VBL0FiYURHNVV0a3daVmJlMFAycDdtbU1RR1lpV3pod0tpdzMvc1RN?=
 =?utf-8?B?Um16RlZrSzBIcVBZWFNMejRQVStJdUtuRVlZeUtIZk1Sem1lYWtRQXdRUFNR?=
 =?utf-8?B?cDMzSEY1NlNqYmd1VnlnaHYwMFo3MEZvd2VDMllEWnB4SzJkN01yYXg5aFRa?=
 =?utf-8?B?UHgwMjZ5WktUMTI1ejNsRGxvaGhKU1RFblMxa2ZuMVRja1lhSHROS2c5R1Fl?=
 =?utf-8?B?MldFZUdiQTBGcjB2WGpJVUQ3ZUJZRENMc2ZubFZZWmZkSDBaWEt2cFlqZHFh?=
 =?utf-8?Q?FhnC6JPBzBbzh7LakWgqxD+EqpiFGVKSscVoo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB12389.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WitVZElPaGlteXRTT2RWRS94QjgyS2kwaE1qeERBaXAwRklLQlhiTDUwZnhY?=
 =?utf-8?B?R25xWUNtVnpuSkwwKzhHSnh1Rk51NnZtbWdvbXN2SUszTW00UlppZ0kwS3VM?=
 =?utf-8?B?WGZqa2VwNzYxc3NpUTJDeGZGWVUwemlmNTBTczV3SEVBZ1JROFZMRkVqTjhD?=
 =?utf-8?B?cmxKbCsxRVhYeHFVc1hoNGdxNDFUemtvNTRZZGRSQ21QRTJ6L2pvS01PM0Jr?=
 =?utf-8?B?QVlaaEx5YllONWJFMTUrZExZNW1pZFBxL3pvNGFyVHRnMk9Ba1JYNkVnaXJy?=
 =?utf-8?B?U2M2OVRyamNlVnNOUU1iVUtCczlHMS8wV1FuaThoR0NXK0FaY1JwaXM0dmsy?=
 =?utf-8?B?dFpoNDRnZ2phR3Ftdk85NHBRS2t0dVFPN1k5ZHZQTEc2VTE0N1B6RjRpSWVF?=
 =?utf-8?B?L3d1UGs1M2VZMXVMazFRd01aNm8zQWlrc2NKcW5oTXg3aFhTOHpFaWN5dkth?=
 =?utf-8?B?RStIWkJPdGFzb1gvTGVxSkFtc2E3Nm9ENk1tc0FCM3dMb0VNREpUTzczN2xU?=
 =?utf-8?B?WmV1QklCTHJqS0dYWExyUnVDMGEzS3o1VitMYUV5NENwZXZ0SHVQayt0MEp4?=
 =?utf-8?B?U3VnMkQ3TThVM2hXZ2w3RXYyWHY3NDRjcWtQak90eTNEYThyQWo5Q3NkZWs0?=
 =?utf-8?B?a0RoVEdkRGNpNzJKMDhYeWZwaDgvMkdUQkVBaE1lbDM2akpDWnA4Ly94K2oz?=
 =?utf-8?B?RXZYV3FNNVpDU1VWZEhzMnpFSldaMUU0UjhZVERXMERrV3lBeDlLWFB4SDhW?=
 =?utf-8?B?REVkSWZsUmRiTmdma1oyZEZLK1EyS2lVaUZNa1Q1NkF5UXJUVkllWnhOOU0y?=
 =?utf-8?B?N1lEVmtheXUxTVpZWVR1WnpSeTFqRzZrSkNTNGhJQzFjMWR0SktGSWVXbWpu?=
 =?utf-8?B?Q2xDajBKL2thZURVUFFlb3VYN1NqaFp5SlVLUGw2eUdVbi9kWCtkUCtBYkZa?=
 =?utf-8?B?S0dZZW9qSjBJM29MSTZicCtGV1h4TjVHZlA2dVJaSzdXMzhTZ3YvWDBvT3pU?=
 =?utf-8?B?dk5xemZLRDd2b0tXdUdOTzZueHd3K0FpNU5Oeno1NkdDNy85QlZvcTRMKzg0?=
 =?utf-8?B?NzVJRFlOUDh2V1pERHRSQWcvM0l0L2FSWnRJQUJUSkVlYUJDOUV3eXZsZW1r?=
 =?utf-8?B?U2h3Q0UwaXMvdGNRcXc1OXZWYWhqS0twTmhTVllPY3Rwdlk2VDBlRmhhRlBv?=
 =?utf-8?B?ay9BZE00OGRFbmxEZGl2M1AxdnFPM1I0cFI2NUFDMkpMMVpxTzNWajJGSk4v?=
 =?utf-8?B?MTRQYVM2UDVnekNXK3BDaDRJemlOOWVwcG0zNFNBdWQzNlRCNHh6aG9kUUJa?=
 =?utf-8?B?dmh4Qm9ja0ZXeC91RXg1NjZ2eHhBVE5FQzdCWlBMZ3NzMWE2UWJyU1FtK05k?=
 =?utf-8?B?YVd4cGRRTEozT1JjWCt2QzNqdWhaYVFqWW9vZ3o5T3o3TXBkRTI3MG4rb3Ey?=
 =?utf-8?B?Ui9VWkpmQVZ1OVZmdW85eGpKWlR2OVVOM0JHUkVVQnlSZWVZQ0pMZmhjZmNn?=
 =?utf-8?B?U1Y0eElsZVcrc1gyTXg3NFhsWHo1enFkWFRTRHNPb0h1cTJZc3BkWEg4T3Nx?=
 =?utf-8?B?OEMzdGJ3SVN0R3pya3pHMzh3Q3BMdnN6bGFiMVRSeDNLSlVJYXI2UnBlWkRj?=
 =?utf-8?B?V0c3eGZrTzdERVVwUlpUWlNLR1h6SVZtRnRhYlNnZVpSWWt3WXRwalkyRXkz?=
 =?utf-8?B?Qll2M2pDUXZpTXZTOTFXaDZkYmFnL3c0bHhYRnVOVUEwR1RGQm80bFJRd2dJ?=
 =?utf-8?B?MlJjYWxrR2ErN2R5WFRuK2xxUCs1TEF6anBIUkRIQ3JSejBaZVYzRTN6bVFS?=
 =?utf-8?B?N0UwTmYxWUljeXBhUEljZjBsVTZYanRVak1VWW1lQ3RJOXNycUp1VTlQQzFa?=
 =?utf-8?B?S2VrWUtFaWRUempFOWlPblF5eWNjZGd5QitYZGVCbXI4eEwxMGxlVTBMV2dX?=
 =?utf-8?B?UzVKUEw0TStWaXA5akd0NXovOVV5dGwrTUVUNDNZN3RRUEZBMC9yWWZKR1BS?=
 =?utf-8?B?TEgzV3ZUa3dDNDl3YVo3YTBlaHFOdys3djB1MGxqWlN0a0JYNy9DNnU5YTZ0?=
 =?utf-8?B?ZWhhM2tyNE4vUmFnaVJJUFVMZ2swNWJuODVjOTIvakFRMHIySmdlaVJKTHJF?=
 =?utf-8?B?UmVnOHg1Um1icWVzaGVpYzJUcXBvOWd0MnluTWhoeWc2T0Z4VXFmWmlWRHpv?=
 =?utf-8?B?QlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB12389.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebaaa2fa-2ae9-46aa-a63b-08dcfe872ffc
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2024 17:19:35.8594
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RI6SrISzOhKZg73EBemvxAy0v4t5AbeDs3ZXA7fFVj4vShEjQvxoDVHcx5/tTjYP7GIQBR427+/xqycvLjfSz1ta6Kul80IroFxb2buDTUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9864

SGkgQ2xhdWRpdSwNCg0KPiBGcm9tOiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4
b24uZGV2Pg0KPiBTZW50OiAwNiBOb3ZlbWJlciAyMDI0IDEzOjU2DQo+IA0KPiBIaSwgTWFyaywN
Cj4gDQo+IE9uIDA2LjExLjIwMjQgMTU6NDMsIE1hcmsgQnJvd24gd3JvdGU6DQo+ID4gT24gV2Vk
LCBOb3YgMDYsIDIwMjQgYXQgMTA6MTg6MTdBTSArMDIwMCwgQ2xhdWRpdSB3cm90ZToNCj4gPj4g
RnJvbTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPg0K
PiA+Pg0KPiA+PiBPbiB0aGUgUmVuZXNhcyBSWi9HM1MgU01BUkMgQ2FycmllciBJSSBib2FyZCBo
YXZpbmcgYSBEQTcyMTIgY29kZWMNCj4gKHVzaW5nDQo+ID4+IGRhNzIxMyBkcml2ZXIpIGNvbm5l
Y3RlZCB0byBvbmUgU1NJRi0yIGF2YWlsYWJsZSBvbiB0aGUgUmVuZXNhcyBSWi9HM1MNCj4gU29D
DQo+ID4+IGl0IGhhcyBiZWVuIGRpc2NvdmVyZWQgdGhhdCB1c2luZyB0aGUgcnVudGltZSBQTSBB
UEkgZm9yIHN1c3BlbmQvcmVzdW1lDQo+ID4+IChhcyB3aWxsIGJlIHByb3Bvc2VkIGluIHRoZSBm
b2xsb3dpbmcgY29tbWl0cykgbGVhZHMgdG8gdGhlIGNvZGVjIG5vdA0KPiA+PiBiZWluZyBwcm9w
ZXJ0bHkgaW5pdGlhbGl6ZWQgYWZ0ZXIgcmVzdW1lLiBUaGlzIGlzIGJlY2F1c2Ugdy9vDQo+ID4+
IG1heF9yZWdpc3RlciBwb3B1bGF0ZWQgdG8gcmVnbWFwX2NvbmZpZyB0aGUgcmVnY2FjaGVfcmJ0
cmVlX3N5bmMoKQ0KPiA+PiBicmVha3Mgb24gYmFzZV9yZWcgPiBtYXggY29uZGl0aW9uIGFuZCB0
aGUgcmVnY2FjaGVfc3luY19ibG9jaygpIGNhbGwNCj4gaXMNCj4gPj4gc2tpcHBlZC4NCj4gPj4N
Cj4gPj4gRml4ZXM6IGVmNWMyZWJhMjQxMiAoIkFTb0M6IGNvZGVjczogQWRkIGRhNzIxMyBjb2Rl
YyIpDQo+ID4+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+ID4NCj4gPiBXaHkgaXMgdGhp
cyBhIHN0YWJsZSBmaXggd2hlbiBpdCBvbmx5IGVuYWJsZXMgZnVydGhlciB3b3JrPw0KPiANCj4g
SSB0aG91Z2h0IHRoYXQgbm90IHN5bmNpbmcgdGhlIGNhY2hlZCByZWdpc3RlcnMgbWlnaHQgaW1w
YWN0IG90aGVyIHNldHVwcw0KPiBhcyB3ZWxsLg0KPiANCj4gQWxzbywgUmVuZXNhcyBpcyBjb250
cmlidXRpbmcgdG8gQ0lQIChDaXZpbCBJbmZyYXN0cnVjdHVyZSBQcm9qZWN0KSB3aGljaA0KPiBp
cyBiYXNlZCBvbiBzdGFibGUgcmVsZWFzZXMuIFRoZSBhdWRpbyBzdXBwb3J0IGluIHRoaXMgc2Vy
aWVzIHdpbGwgYmUNCj4gYmFja3BvcnRlZCB0byBDSVAga2VybmVscy4gTWFya2luZyBpdCBmb3Ig
c3RhYmxlIGVhc2UgdGhlIHdvcmsgdG8gYmFja3BvcnQNCj4gdGhlIFJaL0czUyBhdWRpbyBzdXBw
b3J0IHRvIENJUC4NCg0KV2hpbHN0IHRoZSBhYm92ZSBpcyB0cnVlLCB3ZSBzdGlsbCBtdXN0IGFk
aGVyZSB0byB0aGUgInN0YWJsZSIgcnVsZXMgLSBPbmx5IGJ1ZyBmaXhlcyBldGMuIHNob3VsZCBi
ZSBtYXJrZWQgZm9yIHN0YWJsZS4NCkFueSBleHRyYSBlZmZvcnQgaXMgZm9yIENJUCB0byBkby4N
Cg0KQXMgeW91IHNheSBwZXJoYXBzIHRoaXMgcGF0Y2ggd2lsbCBmaXggY29kZSBmdW5jdGlvbmFs
aXR5IGZvciBvdGhlciB1c2Vycy4NCkknbGwgbGVhdmUgaXQgdG8gdGhlIHJlbGV2YW50IG1haW50
YWluZXJzIHRvIGRlY2lkZSBpZiB0aGlzIGlzIGEgc3VpdGFibGUgYnVnIGZpeCBvciBub3QgOikN
Cg0KS2luZCByZWdhcmRzLCBDaHJpcw0KDQo+IA0KPiBXaXRoIHRoaXMsIHdvdWxkIHlvdSBwcmVm
ZXIgdG8gZHJvcCB0aGUgIkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnIj8NCj4gDQo+IFRoYW5r
IHlvdSwNCj4gQ2xhdWRpdSBCZXpuZWENCg0K

