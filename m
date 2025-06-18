Return-Path: <linux-gpio+bounces-21828-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D29BADF882
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 23:10:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 240E53A46D8
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 21:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63C9425FA0A;
	Wed, 18 Jun 2025 21:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="pzFi57ys"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2123.outbound.protection.outlook.com [40.107.94.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F54A25F7B7;
	Wed, 18 Jun 2025 21:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750280990; cv=fail; b=RLV026BevZinb6mU8msdbZMerr03OGuiRdLgcW7XAeUTlxnwtW6AT7k/aUKbHOBTAnNjgAo2oPCwlK7kumZn7SLidWPXgyyUKfoA4N5tFuQJbuq9EJ+N3pORk4OdRrBST5wiVKUfKurqF3YpmPqjDnh0VaXCy3XhbEhAVjPFV0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750280990; c=relaxed/simple;
	bh=Xra+QulNjCE0RwDYZmnEd+vZsKzxA93d6HonlQ5uqKg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=g+AmRig4djEqq6L9ync2BfhTcc6/xVGhLQsai/eUbJQ9+oJyMCbqW+UmjmnJ7/4m6orhfy49E/0QJcRlHBRQium1gU+rCSCJFMCxwdnLSyAWpQYLPvBdmwZ9Rnmjsr794n+frQsYtUzp2sJ5NPE5qNclvo51qTCq72ltQQt+alM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=pzFi57ys; arc=fail smtp.client-ip=40.107.94.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vqkyh8xVcpa8ANYhQlti4bSOcr+KScSkJ62wrBgdFLO40IXvyipII+BnQwmeaOowSyOUi0EQhkibqBqFeI2XSwH7i2R3kiatFh3WZNSeZX9KhhuAUF+5tfhDSvj8ef4BoHvc5QflqCFwarsKyQDGasIQsgdtl3G9tdfj8R5TLMIS22v9VYUyhvghobT4nlIBwYovONzcrt4kvwg/sBUilJnDcQgwK8MGLErvVMUWm9GORvuiVdyk1oljnQB0aIWWXVcBX6TOPLRuCx0ILM/MgNi7hjkchb+qzeBeklC9eB+7TcBneTFgI6sifzWI/uW+KGPmTtzWGbKHX1xYCZ1WRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xra+QulNjCE0RwDYZmnEd+vZsKzxA93d6HonlQ5uqKg=;
 b=J22BNbYuhPvnFsyKW8h5Fecr1dgxMKs2aefJsBN9clSGm9zDkjteHTGCnNaD0E+FPFukcJuRpQe/RCGXSVRCRPiKRca0cQB9SHOyUJu2pLiUuMyErlQuIDtJRb/i7tly47q5HxmXNUXaEaixQ9HGLDsVgtO+e0UK+SEajOt/7nUyu7yCtfyIwGAcTZZgc4g1s7X+8l9H0NYhVPYYII64VEmuvJHjXyuxEYt+Vb2e5ZaOLih4UfE5qeBAXWxGmK59WjorTqvsbF5eLU5GnZmVeX4opxttp+Jdcr4iCLzHb3R+/An+lYnBUzwzhOc59m19BTi/nOUoZBb5nd2Z75Hz2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xra+QulNjCE0RwDYZmnEd+vZsKzxA93d6HonlQ5uqKg=;
 b=pzFi57ysi3nZy6yosfGhSIBKDtRPm1n2CzdXYVhnj/GjsQrYYIJq9cuJSkrs8LMKSE9apAvbqMc8BOXDel+VbYS47WlGrvadCi0lfqSFnFRMvR3BvkdiXTkd7oiLR0gl8cBj9wR3CC5V4uQnKDcTNjt/6G04b06xKvL7qJwafhJbD2Cx7RnGtpoAgdmqhmO8xcivyTltHv0nsp//1+ACesc+TLfok20q9qz8Sn6VgO6CDbMFM3FUO5w8in/eXX6VwANDkPU4aTf+4UYfB4NjdPMyCOMhqxwSxKXVp5nKi3Eh5A3lil2DbRN+opjBEvr2fNPwOOBf97RhcTON/tM0eA==
Received: from DM3PPFA3B1D0F56.namprd18.prod.outlook.com
 (2603:10b6:f:fc00::6bd) by LV8PR18MB6047.namprd18.prod.outlook.com
 (2603:10b6:408:226::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Wed, 18 Jun
 2025 21:09:44 +0000
Received: from DM3PPFA3B1D0F56.namprd18.prod.outlook.com
 ([fe80::a2ff:34:739c:559b]) by DM3PPFA3B1D0F56.namprd18.prod.outlook.com
 ([fe80::a2ff:34:739c:559b%3]) with mapi id 15.20.8835.025; Wed, 18 Jun 2025
 21:09:44 +0000
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
Subject: Re: [PATCH v2 3/6] dt-bindings: gpio: gpio-cdns: convert to YAML
Thread-Topic: [PATCH v2 3/6] dt-bindings: gpio: gpio-cdns: convert to YAML
Thread-Index: AQHb3neWkjUsHn2Mv0OW/HOo0GZlwbQFTEaAgAQhaoA=
Date: Wed, 18 Jun 2025 21:09:44 +0000
Message-ID: <a50aaebb-eb44-4e49-aea0-7b7aa86cd157@axiado.com>
References:
 <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-0-341502d38618@axiado.com>
 <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-3-341502d38618@axiado.com>
 <67b1a8d3-e695-4ea6-8405-1a8563cbf5f2@kernel.org>
In-Reply-To: <67b1a8d3-e695-4ea6-8405-1a8563cbf5f2@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPFA3B1D0F56:EE_|LV8PR18MB6047:EE_
x-ms-office365-filtering-correlation-id: aa0ebf94-b145-4d63-66b2-08ddaeac7305
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cmRUaSsvaVpybXBqU1ZFZ0VaVi9ZZGEzLzJTaElMTlF6UWFLbGZKWU0zQjkz?=
 =?utf-8?B?ZjlHWXVsbkZnYlpteDhJaHlEcnRqVVNUUXYzQktxbTFvZjRCeHpSRnZpVFdF?=
 =?utf-8?B?MU4xNzFwazl0dUhTSGZvRi9mLzlWNW8yS2xBOXgzdG9Wckw0VURjMDJMUytQ?=
 =?utf-8?B?VnhWMmNMbGFtRDNtWDVKWk8xV2VEZkpYb1ptcG92amFwME9nOVR3WHhSc1h5?=
 =?utf-8?B?MFJybFAyZWFBZW1vRFdidkdZN1A0dVBlbHBwQXF0RjZucDdpSkRwU3BIakZX?=
 =?utf-8?B?cTRBUVBMY2V4NFM4U0xwZEp4WHI0WTM5VDJ6R0xHcXZHd0Q2UFM4WE40SVlM?=
 =?utf-8?B?cWFMY2g4SHBmcGxEVnQxeFhiK0tCYWJFcEpYaWVRT2lTcXlqS2twbXFJVUhj?=
 =?utf-8?B?ZUxoc1E5RHlTNFFKMW9LWVoyTVBzZ0p1YTBEL2QvTGE4bC9pT011MDBKa1pN?=
 =?utf-8?B?ZTR1alB1SkI5Q3g1VTdUMEJTT0htVjIrZ3N6aUxpeER0Ui9DT0t2aDZIQ2p3?=
 =?utf-8?B?SDcyQjNRRjBCcW54T0picG8zN29XRC90UUpJbHZlTGhwYXYwaDMyTm9SS2Fh?=
 =?utf-8?B?RmVBeUpYTlNOYnZBekMyaXNzT0hDTDZibGFHRHVKMndYZHVtV2F4QU1DU1JJ?=
 =?utf-8?B?MTZiQlBsTXl3anhJWmZaTk9KbllGaWY4U1M1UzdrL3NzSlpWbUhwd1REYnNY?=
 =?utf-8?B?ajRkSWlxSTZKdjFyUUYvUGJiWTB1SVZwMGIyMy8xR3IyS2NJY3hnbGwrQnd2?=
 =?utf-8?B?Qm9pZW5VTk01L0J5VEhJSlFtSHdGcEx4eXlsMHNkNXFNWEptNnVsNXBodmVj?=
 =?utf-8?B?d2M3OUxWSjNsUnZ6d2ZJb3lBNmRSSmFCWGx4VHpRem94cmlrYkQ3bXFTWGU1?=
 =?utf-8?B?VWpxN0xsRWJhRkt3R1R0TExzTWt5b3JuTDM5NHY1czdMTmRrT3RWcE9CdVhU?=
 =?utf-8?B?RjZNSEV5diswSkUzb1U1UzR1R0VuOFJQK0dYajBPTGY5QzdBVTh0ZWVaUHJE?=
 =?utf-8?B?YkJHdUxwMUdHRk1CdFZTRVgxWFdhUnVNdzZiRXE5VlRJQjFPV2dFWndic1pS?=
 =?utf-8?B?SnFrdzNYWlJXdThsbk15Zm54MjUzQUpXdzg0VG1MUjFHbnRrQ3VKNzhTVnVt?=
 =?utf-8?B?QytUSld0bk1CazVGUTdFRGpUUXVFNEI2VkZvMWpoK1d1Q29Pdk1EQ1hncWhD?=
 =?utf-8?B?ZktEOWUvSjhCRjBXT1A0V3Z6elRrdVU5NXlZY3hHWHNaTkYrUHRHZHB2L1VU?=
 =?utf-8?B?RkpJQ2RKUGFQMG50alh3OVU3bTJBTjVuU3hUbEcwMlRzaXZVaEJzSFRZZG1T?=
 =?utf-8?B?K2lydStMdnJnMTdzRTllb0VrYjMvVDByczJrSDBnbDQ3N01qVDRvejlyZGVL?=
 =?utf-8?B?c2lRaXRKcFdGNkFHMlkyejYvZnNtYmc2bEFjT2FTKy9LK2VIUi9QU1VmRDZM?=
 =?utf-8?B?b2hhSHNLejdlM1JTUmljUkxqRnFHNS9xMU5EY0I1aTJDWFRVN2cxUkdFR0Q4?=
 =?utf-8?B?WDg3ck0yRDRRV2ZBL3psVWh0M2lBZVVuZnJXU3h3V1JBRW5jcU04L0NVTVUw?=
 =?utf-8?B?S1M4UmZGd0E0ZllvSGV6UERtYkZDUUwycHpRUGx2YklSejRhMEp2bVdWZjQ0?=
 =?utf-8?B?cS9zU1AzenRCSXhUc3JNWTBXMXZ6VTQrdUNDcnE3RVc1SFlJbVdQdGVROG91?=
 =?utf-8?B?aDdjWUYvVDFFM2VyOUozbEpTQXZ0RCtjZnhuY0VlbkxqTUs4U0YyL1h0UmpU?=
 =?utf-8?B?TndJQnV4NjNON1FPTFVBZjl6TUd2N1NWMm12QXQ5YUd0R0RLYXEwRFZ4ZFZI?=
 =?utf-8?B?Wk5UdE9Fbk1GRWlMVzRSWm5MaFJRM29CNSs2SmJUeEY1RU4yZzRpUW4xV0RQ?=
 =?utf-8?B?MzRpRlVIMTBHdnVXSHVvcUZVSVAxUHVwRlNwUU96RUhxNHcxNDRIekFNUzJu?=
 =?utf-8?B?bVJnN3hUUGtseUdJcDV2UWRCYXBZVkdlc01OWTEzYytvY3VjTERRcFRzdSsy?=
 =?utf-8?B?UG9Ra3VreWlBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPFA3B1D0F56.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UFA4Wm9BZ092cGltWFNjT2dpZ1N6OVUzWVJWaFNFQ3o4OFVuSVJNcWZ4MFlR?=
 =?utf-8?B?YUlRWlUwKzFVNFJMUHU1ejRhT0xsM2pBcGJ1L2h5NGJOQzFBNUM1Zm1ZU1JL?=
 =?utf-8?B?M1RuSjA4eWlkV056VW5oQ1dGQzAwdXJYVSttU2lUaFJjQkxNUE1JeldhUkVY?=
 =?utf-8?B?bTBSVjBBUUl1SThHVUlmL0Q5QjI2Vi9zSjFlQXV4aFEwRjIwQVZ2MTNCdFNG?=
 =?utf-8?B?V2xHdHI0YUcvVTZrbk1SUVovb2oyVmtJTTZnWXJMbmpEcDFUZFZFZVc5NXFt?=
 =?utf-8?B?UkFCRUxadHdkZWFybVRlQUhDTXVFb3ZjOHRpMHIraFBhS2lVMTJNVVV6cGo5?=
 =?utf-8?B?MDNSODJvV3dMUGk2WmZ0NVZJNEtjMXFPYzhxbTBpakZJM2wwTGxNTVRLaFZk?=
 =?utf-8?B?Y2lmOTJNV1lhakZjU3lHdU9YZThYckg1N3had0kzQktwdXlHU1g1emJSYWJV?=
 =?utf-8?B?cHpUazRPdi9yQnNLMUR3QTNpdk1PeWZZbzZqMmZpK0szeG1VeG1iZjY5WkJp?=
 =?utf-8?B?L296aHlGMm5lTzhLQmFoNjlFaDV5QXRXNEhmT05JM2NSTTJnYVhKaVM5VDNl?=
 =?utf-8?B?N0hNR0p5V2piQTFhd3d4eFNMV2MvVDVpTE5ocWlobmVsYnNCY2YyUWNLTXFY?=
 =?utf-8?B?ZWhIc1ZWOWR1NUM3SHdmejREdWNSREJITkVPcEtpNlVnVjNBck9rTGRkN0tx?=
 =?utf-8?B?dGJHQTJXZXk4ZjBjQlZSRzJWck9PNEluTkg5cnc3V25BV2dyWXd4VVhPUEhr?=
 =?utf-8?B?alNPbWZZVG9ZR1VDaVR2V3hyZjhRclU1MUhmVU95Y3d5MlVMZTdzdXQxaXJE?=
 =?utf-8?B?L09FNktlaUlWbkZpTEpKTTFqUVgyeUE2MCtGclFYVXNlaTRsNGRUTk5RWm5l?=
 =?utf-8?B?anVOaXpjS2RUUFlMa2E2V0xNZHJORlE5bytIYm5JOTJpTWFCYVVJTWFmNnV4?=
 =?utf-8?B?RGEwZDNGdEhSWlk4UnZlb1dZV2dNWmFUMUFsVEVIeXFsTXY3anVzbVZMTFpw?=
 =?utf-8?B?M0JSQkFscVZ5alBYdzNkWktkNDhKK2JIeVUwRTRyWS9Cbzh2dGtuWE56bkMy?=
 =?utf-8?B?anRjVUhXalRzOWxsNlprK0Z6Y0RpWnlpMFJRRkFYZThFZlhIODk0RzNLc05p?=
 =?utf-8?B?YkNlSkNCQjJvYmN6SFdiVUkwS092akpZdHdGV1RqbGs4SGxWUnJvRXhTTk5U?=
 =?utf-8?B?UjQ0TC80ZUlHNGFoVlBxb3RiNlVhK3hjZ1RLdHl3OFd0RGhuc1BVdCt6c1Jq?=
 =?utf-8?B?L3M4RlFZWXNhRHJjSEhORzhVb1lxSytxL2g4eUlPOG9xTXI5VG1vd1NFallW?=
 =?utf-8?B?L1NhUGx4blp5ZmRIUHZCc3RBbUZEaDd6QjYzeUkrM0t5VXRkWFdyTm9wREI5?=
 =?utf-8?B?RmR4cHVkdkdOS0h2Mnk1OHk5cnRhNFNBYzU1RVloV3RPUHFaRkQ1QXJld3ls?=
 =?utf-8?B?MHhCSXdsZU9lSVltVVZFN3RmWXN1MXBDem96VzlOMUhGcklVYkRaK1luSjBL?=
 =?utf-8?B?aFpjRXU2VUx2ekhvc2ZXOFR6U25KZDhBZnY4QjA0VThtNjJ5MXdnbm5GclFa?=
 =?utf-8?B?bUJJQldXOHRZVXE4a3BtelhRNVJ0c3cxU3lhQytubVZPb3ovbFBmRUZ3QkJu?=
 =?utf-8?B?eVgrMUpGRDlaQmNuVUw4MkVDN1ZPSHRZUTZuZE1ZYlU3MTJIZlEwYnkxSFFG?=
 =?utf-8?B?b3cvWmZwc2RpWGZKQzg4UzZrazFSVENMOTJTTXFyRTRyK0s0RU9kU2phMFZr?=
 =?utf-8?B?Qy9FMG16TmlLZUFjYmpkS0h5YitLL2Z3MmZqWE80TXEvUGZXNkloSEJ5UlNw?=
 =?utf-8?B?Rktud3VkZytOMUlkMWhRamp3ZXQ1TnU1MkZGK1VZWW1mTkhzYm1QNm95c05O?=
 =?utf-8?B?VUl0T3VhSUNXeFVxQVNEaTFORjlSQjdQa0NPOWx6NmlUOEtPVXhuQ2dwdzJB?=
 =?utf-8?B?d3ZGZzEvS1htMVlDRXBua1ZERUNLUWpMV3BIK3NudGJNdlJTdnZOak1JL0lI?=
 =?utf-8?B?NmdPY3ZSVktGa3VJRzZDdjZXbWZ2SXhIV1JDNi9LUUpSLzQxMEpic0luRnN3?=
 =?utf-8?B?QWQycWdxdWVzTWJ4WXpRN25SbFJUaTVpemU3MnBpU1VlVVA4RXVndlhmM3dp?=
 =?utf-8?Q?Px6c=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8F04CA9009853B42B82F329FA924B5F2@namprd18.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPFA3B1D0F56.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa0ebf94-b145-4d63-66b2-08ddaeac7305
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2025 21:09:44.3468
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /UD/fyWq+TuE/hGf8qSKbo/nDUoTBfA3PGGJ0i+PZZXO30HluhGHfwC6oOZ8NZ9U8CvB/VzR/xgpsrcEHIJtvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR18MB6047

T24gNi8xNS8yMDI1IDExOjA1IFBNLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPiBPbiAx
Ni8wNi8yMDI1IDA2OjMxLCBIYXJzaGl0IFNoYWggd3JvdGU6DQo+PiBDb252ZXJ0IENhZGVuY2Ug
ZmFtaWx5IEdQSU8gY29udHJvbGxlciBiaW5kaW5ncyB0byBEVCBzY2hlbWEuDQo+Pg0KPj4gQ2hh
bmdlcyBkdXJpbmcgY29udmVyc2lvbjoNCj4+ICAgICAtIHVwZGF0ZSB0aGUgbmFtaW5nIGFzIHBl
ciB0aGUgb3RoZXIgZmlsZXMuDQo+IFlvdSBtYWRlIGl0IGVudGlyZWx5IGRpZmZlcmVudCB0aGFu
IGV2ZXJ5IG90aGVyIGZpbGUgYW5kIHJldmlldy4NCkdvdCBpdC4gSSB3aWxsIHVwZGF0ZSBpdCB0
byAiY2RucyxncGlvLnlhbWwiDQo+DQo+PiAgICAgLSBhZGQgZ3BpbyBtYWludGFpbmVycw0KPiBO
b3QgcmVhbGx5LCB5b3UgbmVlZCB0byBmaW5kIHNvbWVvbmUgaW50ZXJlc3RlZCBpbiB0aGF0IGhh
cmR3YXJlLCBub3QNCj4gc3Vic3lzdGVtIG1haW50YWluZXJzLg0KVW5kZXJzdG9vZC4gSSBoYXZl
IGNvbm5lY3RlZCB3aXRoIHRoZSBvcmlnaW5hbCBhdXRob3IgYW5kIEkgd2lsbCB1cGRhdGUgDQp0
aGUgc2FtZS4NCj4NCj4+IFNpZ25lZC1vZmYtYnk6IEhhcnNoaXQgU2hhaCA8aHNoYWhAYXhpYWRv
LmNvbT4NCj4+IC0tLQ0KPj4gICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL2NkbnMsZ3Bp
by50eHQgICAgICAgICB8IDQzIC0tLS0tLS0tLS0tLQ0KPj4gICAuLi4vZGV2aWNldHJlZS9iaW5k
aW5ncy9ncGlvL2dwaW8tY2Rucy55YW1sICAgICAgICB8IDgxICsrKysrKysrKysrKysrKysrKysr
KysNCj4gUHJldmlvdXMgZmlsZW5hbWUgd2FzIGNvcnJlY3QuDQpHb3QgaXQuIEkgd2lsbCB1cGRh
dGUgaXQgdG8gImNkbnMsZ3Bpby55YW1sIg0KPg0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDgxIGlu
c2VydGlvbnMoKyksIDQzIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3Bpby9jZG5zLGdwaW8udHh0IGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwaW8vY2RucyxncGlvLnR4dA0KPj4gZGVsZXRlZCBm
aWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRleCA3MDZlZjAwZjVjNjQ5NTFiYjI5Yzc5YTU1NDFkYjQz
OTdlOGIyNzMzLi4wMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwDQo+PiAt
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3Bpby9jZG5zLGdwaW8udHh0
DQo+PiArKysgL2Rldi9udWxsDQo+PiBAQCAtMSw0MyArMCwwIEBADQo+PiAtQ2FkZW5jZSBHUElP
IGNvbnRyb2xsZXIgYmluZGluZ3MNCj4+IC0NCj4+DQo+PiArcHJvcGVydGllczoNCj4+ICsgIGNv
bXBhdGlibGU6DQo+PiArICAgIGNvbnN0OiBjZG5zLGdwaW8tcjFwMDINCj4+ICsNCj4+ICsgIHJl
ZzoNCj4+ICsgICAgbWluSXRlbXM6IDENCj4gV2h5IHRoaXMgaXMgbWluIGFuZCB1bmNvbnN0cmFp
bmVkLi4uDQpNYWtlIHNlbnNlLiBJIHdpbGwgdXBkYXRlIGl0IHRvIG1heEl0ZW1zOiAxDQo+DQo+
PiArDQo+PiArICBjbG9ja3M6DQo+PiArICAgIG1heEl0ZW1zOiAxDQo+IEJ1dCB0aGlzIGlzIG1h
eD8NCj4NCj4gbWF4SXRlbXM6IDEgaW4gYm90aCBjYXNlcyAoc28gY2xvY2tzIGFyZSBjb3JyZWN0
LCBidXQgd2h5IHdyaXRpbmcNCj4gc2ltaWxhciB0aGluZ3MgZW50aXJlbHkgZGlmZmVyZW50Pyku
DQpZZXMgd2lsbCBrZWVwIGl0IHRvIG1heEl0ZW1zOiAxDQo+DQo+PiArDQo+PiArICBuZ3Bpb3M6
DQo+PiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMg0K
Pj4gKyAgICBkZXNjcmlwdGlvbjogTnVtYmVyIG9mIEdQSU8gbGluZXMgc3VwcG9ydGVkLCBtYXhp
bXVtIDMyLg0KPj4gKw0KPj4gKyAgZ3Bpby1jb250cm9sbGVyOiB0cnVlDQo+PiArDQo+PiArICAi
I2dwaW8tY2VsbHMiOg0KPj4gKyAgICBjb25zdDogMg0KPj4gKyAgICBkZXNjcmlwdGlvbjogfA0K
Pj4gKyAgICAgIC0gRmlyc3QgY2VsbCBpcyB0aGUgR1BJTyBsaW5lIG51bWJlci4NCj4+ICsgICAg
ICAtIFNlY29uZCBjZWxsIGlzIGZsYWdzIGFzIGRlZmluZWQgaW4gPGR0LWJpbmRpbmdzL2dwaW8v
Z3Bpby5oPiwNCj4+ICsgICAgICAgIG9ubHkgR1BJT19BQ1RJVkVfSElHSCBhbmQgR1BJT19BQ1RJ
VkVfTE9XIHN1cHBvcnRlZC4NCj4+ICsNCj4+ICsgIGludGVycnVwdC1jb250cm9sbGVyOiB0cnVl
DQo+PiArDQo+PiArICAiI2ludGVycnVwdC1jZWxscyI6DQo+PiArICAgIGNvbnN0OiAyDQo+PiAr
ICAgIGRlc2NyaXB0aW9uOiB8DQo+PiArICAgICAgLSBGaXJzdCBjZWxsIGlzIHRoZSBHUElPIGxp
bmUgbnVtYmVyIHVzZWQgYXMgSVJRLg0KPj4gKyAgICAgIC0gU2Vjb25kIGNlbGwgaXMgdGhlIHRy
aWdnZXIgdHlwZSwgYXMgZGVmaW5lZCBpbg0KPj4gKyAgICAgICAgPGR0LWJpbmRpbmdzL2ludGVy
cnVwdC1jb250cm9sbGVyL2lycS5oPi4NCj4+ICsNCj4+ICsgIGludGVycnVwdHM6DQo+PiArICAg
IG1heEl0ZW1zOiAxDQo+PiArDQo+PiArcmVxdWlyZWQ6DQo+PiArICAtIGNvbXBhdGlibGUNCj4+
ICsgIC0gcmVnDQo+PiArICAtIGNsb2Nrcw0KPj4gKyAgLSBncGlvLWNvbnRyb2xsZXINCj4+ICsg
IC0gIiNncGlvLWNlbGxzIg0KPj4gKw0KPj4gK2lmOg0KPj4gKyAgcmVxdWlyZWQ6IFtpbnRlcnJ1
cHQtY29udHJvbGxlcl0NCj4+ICt0aGVuOg0KPj4gKyAgcmVxdWlyZWQ6DQo+PiArICAgIC0gaW50
ZXJydXB0cw0KPj4gKyAgICAtICIjaW50ZXJydXB0LWNlbGxzIg0KPiBEcm9wIGxhc3Qgb25lLCBj
b3JlIHNjaGVtYSByZXF1aXJlcyBpdC4NCkdvdCBpdC4gSSB3aWxsIHJlbW92ZSB0aGUgIiNpbnRl
cnJ1cHQtY2VsbHMiLg0KPg0KPg0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KDQpUaGFu
ayB5b3UgZm9yIHRoZSByZXZpZXcsIEkgd2lsbCB1cGRhdGUgYXMgcGVyIHRoZSBhYm92ZSBjb21t
ZW50cy4NCg0KSSBoYXZlIHZlcmlmaWVkIHRoYXQgdGhlIGR0X2JpbmRpbmdfY2hlY2sgaXMgcGFz
c2luZyB3aXRob3V0IGVycm9ycy4NCkhvd2V2ZXIsIGNoZWNrX3BhdGNoLnBsIGlzIGdpdmluZyB3
YXJuaW5nIGFib3V0IHRoZSBEVCBiaW5kaW5nIGRvY3MgYW5kIGluY2x1ZGVzLg0KDQpjaGVja3Bh
dGNoLnBsOiBkZXYvbnVsbDoxMDogV0FSTklORzogRFQgYmluZGluZyBkb2NzIGFuZCBpbmNsdWRl
cyBzaG91bGQgYmUgYSBzZXBhcmF0ZSBwYXRjaC4gU2VlOiBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdA0KY2hlY2twYXRjaC5wbDogRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwaW8vZ3Bpby1jZG5zLnlhbWw6LTE6IFdBUk5J
Tkc6IERUIGJpbmRpbmcgZG9jcyBhbmQgaW5jbHVkZXMgc2hvdWxkIGJlIGEgc2VwYXJhdGUgcGF0
Y2guIFNlZTogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3N1Ym1pdHRpbmctcGF0
Y2hlcy5yc3QNCg0KSSBhbSB1bnN1cmUgYWJvdXQgaG93IHRvIHNwbGl0IGZpbGVzIGFzIHN1Z2dl
c3RlZCwgY291bGQgeW91IHBsZWFzZSBhZHZpc2U/DQoNCg==

