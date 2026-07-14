Return-Path: <linux-gpio+bounces-40064-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AqhPBT5cVmoJ4AAAu9opvQ
	(envelope-from <linux-gpio+bounces-40064-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 17:56:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6807756B2D
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 17:56:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=advantech.com header.s=selector2 header.b=bWNlKIGQ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40064-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40064-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=advantech.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4CF4311D2FD
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 15:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525994963C5;
	Tue, 14 Jul 2026 15:54:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022139.outbound.protection.outlook.com [52.101.126.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04EC477E58;
	Tue, 14 Jul 2026 15:54:52 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784044495; cv=fail; b=r6evnYShLaHJe6B4ZzZlLBSLKT/7KeVNEAurr+v4dSmHYO65/jYNd9HPZBRxvel126m3yb8gW/8+/jIyQ0CnGKDqD9hZGBEGA9zMHuyViIQhsnPANECZWcQXdGKV9JAjwZbJA0nX5SV0+NtNp/sl192fiytcgoCc0cty7I61BcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784044495; c=relaxed/simple;
	bh=5fqFSVlKcSOCk0ZAGiLrMk7+/9IwudUEG1EYu5BN+EM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=EV7KQQSjyAyxvwjMO4c9pv7FcIT/p0kZFZz6wSROowU0m81ehY/T2DTp9ykdLOJwwfdwqiJWhXstmSjFC0e/wPJp9RaOfrUmCSNy7WNLozvotCzZspHj1sPzoavCT2nIGkK6uewUQJCJVG9Yrff/CIQrvZQyrJ09Kax4oyKJDhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=advantech.com; spf=pass smtp.mailfrom=advantech.de; dkim=pass (2048-bit key) header.d=advantech.com header.i=@advantech.com header.b=bWNlKIGQ; arc=fail smtp.client-ip=52.101.126.139
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LqsJvOk+f9fvbySUkFZhGBCAGHV15oBMVOMCq8oEGq2VbBKo+V+BF8FRfcaV4v5k3Erl/PpSL1Blg2Vb5nsZOSaoJ6uRGCLv5X1cMtqC7x6DwqAelklLWhP87yLcPUMlraCUKBFB82Dm+sjdLHt/FfH4oBYKGFgAtZ/mzVbWaN4Ks4z9d4R4/8eT6SrDG65gj/iuvnwPQni7NH6u/Zwf8CizApfqQwVgoIwoB6xDAfyrBqa3/Rf1M748DbSEk0xNL4Aga8CBf+mAbV/IFiNUzTDvTT4zi7wi2ngiLtKxPgDMr9Y9zm2byHr3bbaVgvG8PUtWX/QHfhfhhDupN06KVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6xXh+eMv3p7Mw2MYpT/fMMYlScBr2JGMK5VDkg/IB8k=;
 b=OjoUjzslrOo0r17V4lnPSqGNb40n8InkxoTJJ69OYQWVLGJmFoAUneQ0u+7YnjHDinlv5wn5USSSPENZOKOUr9Jd3ykMfjKyguG3OHQPvttMQhOwYwNh1hgHINLuf/LgtVy17pPTuR+pvEo+JoK+xmVV2icD8GktPNvSM04OoOyuXlQdbjMDHqWo+hk5utJChGutxO6Q2z5Ops3KOmXk+z3opG8eQ5PADDYN7OXYCOZcOtf6XibFgoRd71qs5yZJhT2t3BeOIXmddhbw44+bfURxCdvWJPCIRJ/w6B8QIPS8nzKh5Nehk0IJwAjbuLaLEvqTKib5Y3hfHhtp3wSIzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.de; dmarc=pass action=none header.from=advantech.com;
 dkim=pass header.d=advantech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6xXh+eMv3p7Mw2MYpT/fMMYlScBr2JGMK5VDkg/IB8k=;
 b=bWNlKIGQUJrrjZBzfDvgYqYGtvDwcOIO3KfbNtC5ICK92s2l1ZODTO8Pj9iR1hs+AUdcKrdszBoyw28s7PY1CBe40vOjEj+ByX++iDPEdDVBXcozGsdCh0xdzAGVw8oH3C3ludGY5kxhc9lZxo9U9Auf4gL0NJMkPihA2Ca5biwQ7r3cvSAhopmAyzU852Qekon/IaT6mmM2Wou0hZeTXKqvV1JbPQO2FUi52AaN1l6tJ+VmBBBGlkVtXGI0DPbDvMUdGP+Zpd2GA/bbjTGwUJvx93VbfVEozVdsxBxxkErE55fyTzpMUpJ4HcWjfi3xPDS4iqV07GLOeHMgWBC7TA==
Received: from PSAPR02MB4502.apcprd02.prod.outlook.com (2603:1096:301:21::6)
 by KL1PR02MB6189.apcprd02.prod.outlook.com (2603:1096:820:bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.20; Tue, 14 Jul
 2026 15:54:47 +0000
Received: from PSAPR02MB4502.apcprd02.prod.outlook.com
 ([fe80::44e6:6433:8000:35aa]) by PSAPR02MB4502.apcprd02.prod.outlook.com
 ([fe80::44e6:6433:8000:35aa%3]) with mapi id 15.21.0202.018; Tue, 14 Jul 2026
 15:54:47 +0000
From: Ramiro Oliveira <ramiro.oliveira@advantech.com>
Date: Tue, 14 Jul 2026 17:54:15 +0200
Subject: [PATCH v2 1/8] Add Advantech EIO driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-upstream-v2-v2-1-76e5e41026db@advantech.com>
References: <20260714-upstream-v2-v2-0-76e5e41026db@advantech.com>
In-Reply-To: <20260714-upstream-v2-v2-0-76e5e41026db@advantech.com>
To: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Andi Shyti <andi.shyti@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-i2c@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-pm@vger.kernel.org, Wenkai Chung <wenkai.chung@advantech.com.tw>, 
 Francisco Aragon-Trivino <francisco.aragon-trivino@advantech.com>, 
 Hongzhi Wang <hongzhi.wang@advantech.com>, 
 Mikhail Tsukerman <mikhail.tsukerman@advantech.com>, 
 Thomas Kastner <thomas.kastner@advantech.com>, 
 Ramiro Oliveira <ramiro.oliveira@advantech.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=22136;
 i=ramiro.oliveira@advantech.com; h=from:subject:message-id;
 bh=5fqFSVlKcSOCk0ZAGiLrMk7+/9IwudUEG1EYu5BN+EM=;
 b=owEB7QES/pANAwAKAc7t0Ke8vbAJAcsmYgBqVlu4nQIxBgJs58vtv8kZc+Pzr2XN42YpXL/KL
 HBM23r2jiuJAbMEAAEKAB0WIQS1Nkng0ZvJmBKh6GLO7dCnvL2wCQUCalZbuAAKCRDO7dCnvL2w
 CXhaDADE7ffeWy/YIPwnpQ9vIZcbbSj04fjnGhogj7Mewz6Wi4KsHrsiTSr/9P2KqX99hCMiQ+M
 mqkDVgCkGD+YSA5WTjH5n2LdUBoVtfPwydMu8y1aNWl7ULndHuMXWolOmDOdio+j1V2hbiwXk3K
 I998scFkta3xN6dr39JHgYjMUAzfC6ifna1BOpqsjk1ajJNJIcUb/k0hU7cJkHD2vOKNsmkmSqW
 764YLuTr+ceeCY/avyHMB5SyCkcHULynA89MphsFyQlOD8r08bSkh+Qh7wmfSUy6ABLwd8iK7SH
 m2xYEsuuKtxdIi6UzeJK2R7kkzpvOKVNCiFHKqiQaFVuPYLRv4xx3BL5S1QX/6irtFzjBya7iON
 d8FkMvyzi2HK/6GSjjf+FsvTlBPnSiwenRzUkXXix55NoeRTSAaqkZFS/v4I45LUfjKg+Aw5bDi
 feVx6wS6ib/arwd1LDnrhzZ5VIU8ov6zfQet/TSvYltqGvX1rfaHvO5kHjnxcDxxDD9mY=
X-Developer-Key: i=ramiro.oliveira@advantech.com; a=openpgp;
 fpr=B53649E0D19BC99812A1E862CEEDD0A7BCBDB009
X-ClientProxiedBy: FR2P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::14) To PSAPR02MB4502.apcprd02.prod.outlook.com
 (2603:1096:301:21::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR02MB4502:EE_|KL1PR02MB6189:EE_
X-MS-Office365-Filtering-Correlation-Id: e46a9163-5707-46fb-1d58-08dee1c03b12
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|7416014|376014|921020|38350700014|3023799007|56012099006|11063799006|6133799003|22082099003|55112099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	o4rzbXB7fgSzMsC3xaRbWrtEbakb0oIaMmcbqcSFdvO1a5k7G/wBUHhmM7F71FZqOz0pM7gGDVqpA8lXZa34co4aJ+tkE6AIltSM9xgzd3cBVk1IqyraypxaivD+dr6dE5M7YQS2CQ6E7MKsrp6XcnbyiKJyITHzIaFNT6IgpKCV6D1VUx4vkYKWJXtPFVAaMG0tEg/y6FPTIS+juOXV8YlZ3UzuzCqRs1StV/pcs5rqX7W5p1bp5aRuzBl8zsjFG/kRCLLOQhcyi9MjTi3RYd38sZu7huK/2roiWTzITLNJz4AtFas7GgqrkFovIS7wjgo6oSaAsXGZ6OuDviEEdfYqRc3CVu5x6LVjc7/7E+6kszR4OWby2QpYhE51ZFQxQSM3yvlm4HI0gOlvXRH2PDZv0JiAdU/fYDKOt1bfZT5WubrDlObAvOINaCW4xQvLa2k5SCacFDla6EPRt0km3hPqUfwQQyfYama5kP6Lz+0ot7QDaC5hP5aUtKrtB0My+GwWltytH0DSVUuPwXFYsj3xOAuhf//vKSh8hn3uSopkkzNR5uijNsGqP2fiVGXEvd+RCdPIZ6mlPl0+5N/L5XG3OA5bTsXg6J1RGoHSWg8RJjtnb5iTyCcE/7+N/ppSJAQTuY1gpOZZOjjaucG7MMxJtYLx5N69cX2g+9YkzgVuqKPFkfnI0+L0IC+uihncGOs0a3Fd/ToPGAy8en0mIxR6bIh+jVkraLboBXi96/gbXagiXoZwMrSr2afNn8nB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR02MB4502.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(7416014)(376014)(921020)(38350700014)(3023799007)(56012099006)(11063799006)(6133799003)(22082099003)(55112099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGVzVFBDWCtCemdxOXFLTTFyTlBpY3Q2Uk93SS9PeERpNlZVTTY5bDBKSFpx?=
 =?utf-8?B?NE5nTUZ1N0hMdGRCaklQV1R3ME9HYTN2WDkyYTd3TUVqOGFzcll1ZzNiUkpO?=
 =?utf-8?B?NG5KOVZ1WGxNYVJMcEJnQjZjUmZvNWMyeXhkSHhNM2FUNGd5UWplL3RsZVo5?=
 =?utf-8?B?cGFXWEVqaE43YkpydkNPdE9IZ3MrNVZCQzhmNDZoeUloclpkL1lFR1oxbXpT?=
 =?utf-8?B?SitKMERyR2h0THZtelhKSjF0WnB5dXRIS2lrVmtSVzZHczFGdEk1Wi84MnNB?=
 =?utf-8?B?N0VwaFFJWkhWM3Nzdzg3OG9OQXN4dVpKTzFzQVpsYmZZWlR5aFJBSDlib2lZ?=
 =?utf-8?B?a2s3dnBkdlFiaC91SUJ3SzZEeGRoc1lzdlI3SUl6MWY4b2RJRFZzeFFCV0Fq?=
 =?utf-8?B?c284US9TQkR5MWpITjRJZkN2L2dHWkFWdE8wWXBOVENFL1FsNlZ6Wkh0a1Mr?=
 =?utf-8?B?REswQ0hSOUswYmttbG15STNXeVhNTElTRUNNOWdhTHoyM3ZMRUNVcU9Va05W?=
 =?utf-8?B?MERlOEFDOFpMN1pyREN4QWRqRzdRaUdvN0JFdzI1WmwrMGxGdEVlQmFUTmEw?=
 =?utf-8?B?dTNoUDQweS9iU0FUTVRxUUFDS3Fod2FnUWl0QmwzcldjcC84SEdENjByakVl?=
 =?utf-8?B?U3EycUtkcUNsekE1b3RmRWJaUm8rOUhlVmJEOHZiUzlWTnpiSjlMajlySHFE?=
 =?utf-8?B?UU5kSFZYZ2d4U2tqSXhVMnRDaEovQnFkajZPRlBiNkloRFJHelJmMFA3L3BW?=
 =?utf-8?B?OTR0RFN6V09kMVhIMEU2WEhzZlRGU0NGYTU0YlhPdDFmTjMrUFFRZ3N0d0NR?=
 =?utf-8?B?UThzV0FXM0x2VEdrQ3BBZEROYjZXMEJMM3YyWmUwNCtTdlVYNFlMU1NNcWti?=
 =?utf-8?B?NUNVRitjV1FXMndtMldzWWNPazJtTjJCeTNtS1JiQnhqVHNUcUk1elY0QkZ6?=
 =?utf-8?B?MU11anJhQk5abHpXSTc3UEhRSGhOd2ZKa2pCUW1DR2VKZEJTWFJ4eGVDblJi?=
 =?utf-8?B?TGRmbGxkT0Q1a3ZGNFNLdEE0ODFtY3RlZitQdjVSbEU5dllJZ1NPMVNrSmR1?=
 =?utf-8?B?N2k4aGpVT1ZtaXJETTR6Ylh5d0UyQm1mOUtYbGt3aTA4a3VzSG53cnpJRnEw?=
 =?utf-8?B?bDNuSEZNWnhIZDV2N2lrTkNRQ0lWL3VkM3pmTVJnRlBaaUl4bVltWWVOeFdE?=
 =?utf-8?B?SWJGd25ILzRrTTVOSDhHdVZVUmU3NVYvd3RyUERQQitRTnlrTXV3aENvRjY1?=
 =?utf-8?B?S3VKRzdCNTd0OUtpem1OUWZKenphZXpNYm14NVRvTStOWlYvY3YxdW5NZHdR?=
 =?utf-8?B?TG9yY2dMMEFCUHVTTkRpc3JPS0NpeWNFZFRTWDhHYm1GRVVySk9TYXF5aHFu?=
 =?utf-8?B?MDc2Mk00dmdVVWxvUEtEQm0zWGpaUS9sWDBaTVNGWlFMVzNhbWRNZzFXZlds?=
 =?utf-8?B?UXlGNC9KTVdjNUt5SHVNQWRDQVFValp0K3NMR3R1WmxXQkdNclcyaVNheGZr?=
 =?utf-8?B?ZFdsQTV6ay9ha1RHNTNZVHQ3R3l0b1luS1Y3SlFnZW9Md1FYVTlkNzlRd0xI?=
 =?utf-8?B?OHJEWk56OGw5eVhWNk1jNjNBQmxBWkoyeDQxcGJlTjl2Y2tYNHpETFMyUGs3?=
 =?utf-8?B?bFY2UWJKSlh5UE9VMWhpWGZQT3N6ajJyWXFTY2cxOTVEWUQ2dnhBV1VGMG9z?=
 =?utf-8?B?UzlVcmJRYkdWRGtZdkdGZTY0SUIzUjkyUzlUb1dwUCtFQjZIdzZGYmdNUDFE?=
 =?utf-8?B?ZHNCMFpyUVZJNlNTZ3ZycTRPV1ppa3BXbGJkcWFPNS85NmZaOTljR1d2QW5D?=
 =?utf-8?B?eVhidTd6SE9BYk12OW9BUTVDaVZUYjlRNXJzcDQ2NWh4eG1BeXBaNXdrMmZF?=
 =?utf-8?B?TVpRZzVWM3JGOEhKWkVqdkVzYklBbitzQnYybnpQL0Mwd2YvdVMwWVFvUUZP?=
 =?utf-8?B?NU40QzQ4ckZUcEJWVlNiMWdFZlhwWk5kb1JMdWtJejk0MDNjeW1keWYvbG1i?=
 =?utf-8?B?VWFtdHoxdTJ5NDRVQkhtOERNSnRWWUxoTUo1c0RYbW5taHpEemVTMUYzRUxF?=
 =?utf-8?B?Uk5KRjFDS1lpaXlzRUpWendRVUF3K2ZLUy9UYXZBTmtvMGtUU0JjZzc3NXhh?=
 =?utf-8?B?Z203bzJWMkFZaGRtQWphdVZCZU84TGo1bm5WNEh1QmFrM0xqbHJNM2FpRXhP?=
 =?utf-8?B?NFRCYVhJNzNvbUt6WmRjU21Ua1luV1NtcklSUG84UEwxSFh6TW44T3JiS3c5?=
 =?utf-8?B?SmorbXAxbWdLaWwrYUVsR29veHBGSXNreVRzbEpFTlZmTE1xc2tTRTIvZVVS?=
 =?utf-8?B?WVZ5S1RmdzdOWVJ5NHNiSVpTREhjWjhQbmxENHVHc1BCVld6dVBua3VvMXhR?=
 =?utf-8?Q?4zyykuSi9KMrkoSM=3D?=
X-OriginatorOrg: advantech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e46a9163-5707-46fb-1d58-08dee1c03b12
X-MS-Exchange-CrossTenant-AuthSource: PSAPR02MB4502.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 15:54:47.5483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l81MH0F2QlYgf33id9ZRy1qa5u+o//U8+MAcXYACZCwu/KrZ6F5DAJfH5SICiK1ncxuf/7Bae06UKXILh/Za5Is8ejrofUTcDEzEeCrt1yc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR02MB6189
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[advantech.com,quarantine];
	R_DKIM_ALLOW(-0.20)[advantech.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-40064-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:linux@roeck-us.net,m:andi.shyti@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:deller@gmx.de,m:wim@linux-watchdog.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:linux-kernel@vger.kernel.org,m:mfd@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-fbdev@vger.kernel.org,m:linux-watchdog@vger.kernel.org,m:linux-pm@vger.kernel.org,m:wenkai.chung@advantech.com.tw,m:francisco.aragon-trivino@advantech.com,m:hongzhi.wang@advantech.com,m:mikhail.tsukerman@advantech.com,m:thomas.kastner@advantech.com,m:ramiro.oliveira@advantech.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,roeck-us.net,gmail.com,gmx.de,linux-watchdog.org,intel.com,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ramiro.oliveira@advantech.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ramiro.oliveira@advantech.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[advantech.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,advantech.com.tw:email,advantech.com:from_mime,advantech.com:mid,advantech.com:email,advantech.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A6807756B2D

Creating the core driver for Advantech EIO, all other drivers depend on this.

This core driver provides register access and coordination for the EIO's
subdevices (GPIO, watchdog, hwmon, thermal, backlight, I2C).
This driver supports EIO-IS200, EIO-201, EIO-210 and EIO-211, these
devices are available in several of Advantech x86-based boards, and
provide several different interfaces like I2C, GPIO, Watchdog, Hardware
Monitoring, Thermal Control, and Backlight control.

Signed-off-by: Ramiro Oliveira <ramiro.oliveira@advantech.com>
---
 MAINTAINERS             |   6 +
 drivers/mfd/Kconfig     |  10 +
 drivers/mfd/Makefile    |   1 +
 drivers/mfd/eio_core.c  | 644 ++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/eio.h | 124 ++++++++++
 5 files changed, 785 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index dcffe9fc54f6..53b5f7412966 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -615,6 +615,12 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/adv_swbutton.c
 
+ADVANTECH EIO DRIVER
+M:	Ramiro Oliveira <ramiro.oliveira@advantech.com>
+S:	Maintained
+F:	drivers/mfd/eio_core.c
+F:	include/linux/mfd/eio.h
+
 ADXL313 THREE-AXIS DIGITAL ACCELEROMETER DRIVER
 M:	Lucas Stankus <lucas.p.stankus@gmail.com>
 S:	Supported
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 35f6e9b76d05..42d133a2eb8d 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -517,6 +517,16 @@ config MFD_DLN2
 	  etc. must be enabled in order to use the functionality of
 	  the device.
 
+config MFD_EIO
+	tristate "Advantech EIO core"
+	select MFD_CORE
+	help
+	  This enables support for the Advantech EIO multi-function device.
+	  This core driver provides register access and coordination for the
+	  EIO's subdevices (GPIO, watchdog, hwmon, thermal, backlight, I2C).
+	  This driver supports EIO-IS200, EIO-201, EIO-210 and EIO-211.
+
+
 config MFD_ENE_KB3930
 	tristate "ENE KB3930 Embedded Controller support"
 	depends on I2C
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index dd4bb7e77c33..2013de45528c 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -19,6 +19,7 @@ obj-$(CONFIG_MFD_CROS_EC_DEV)	+= cros_ec_dev.o
 obj-$(CONFIG_MFD_CS42L43)	+= cs42l43.o
 obj-$(CONFIG_MFD_CS42L43_I2C)	+= cs42l43-i2c.o
 obj-$(CONFIG_MFD_CS42L43_SDW)	+= cs42l43-sdw.o
+obj-$(CONFIG_MFD_EIO)		+= eio_core.o
 obj-$(CONFIG_MFD_ENE_KB3930)	+= ene-kb3930.o
 obj-$(CONFIG_MFD_EXYNOS_LPASS)	+= exynos-lpass.o
 obj-$(CONFIG_MFD_GATEWORKS_GSC)	+= gateworks-gsc.o
diff --git a/drivers/mfd/eio_core.c b/drivers/mfd/eio_core.c
new file mode 100644
index 000000000000..25873c061812
--- /dev/null
+++ b/drivers/mfd/eio_core.c
@@ -0,0 +1,644 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Advantech Embedded Controller base Driver
+ *
+ * This driver provides an interface to access the EIO Series EC
+ * firmware via its own Power Management Channel (PMC) for subdrivers:
+ *
+ * A system may have one or two independent EIO devices.
+ *
+ * Copyright (C) 2025 Advantech Co., Ltd.
+ */
+
+#include <linux/delay.h>
+#include <linux/isa.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/eio.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/regmap.h>
+#include <linux/sysfs.h>
+#include <linux/time.h>
+#include <linux/uaccess.h>
+
+#define DEFAULT_TIMEOUT 5000
+#define SLEEP_MAX	200
+#define NUM_EC		1
+
+struct eio_dev_port {
+	u16 idx_port;
+	u16 data_port;
+};
+
+static struct eio_dev_port pnp_port[] = {
+	{ .idx_port = EIO_PNP_INDEX, .data_port = EIO_PNP_DATA },
+	{ .idx_port = EIO_SUB_PNP_INDEX, .data_port = EIO_SUB_PNP_DATA },
+};
+
+static struct mfd_cell eio_devs[] = {
+	MFD_CELL_NAME("eio_wdt"),
+	MFD_CELL_NAME("gpio_eio"),
+	MFD_CELL_NAME("eio_hwmon"),
+	MFD_CELL_NAME("i2c_eio"),
+	MFD_CELL_NAME("eio_thermal"),
+	MFD_CELL_NAME("eio_fan"),
+	MFD_CELL_NAME("eio_bl"),
+};
+
+static const struct regmap_range eio_range[] = {
+	regmap_reg_range(EIO_PNP_INDEX, EIO_PNP_DATA),
+	regmap_reg_range(EIO_SUB_PNP_INDEX, EIO_SUB_PNP_DATA),
+	regmap_reg_range(0x200, 0x3FF),
+};
+
+static const struct regmap_access_table volatile_regs = {
+	.yes_ranges = eio_range,
+	.n_yes_ranges = ARRAY_SIZE(eio_range),
+};
+
+static const struct regmap_config pnp_regmap_config = {
+	.name = "eio_core",
+	.reg_bits = 16,
+	.val_bits = 8,
+	.volatile_table = &volatile_regs,
+	.io_port = true,
+	.cache_type = REGCACHE_NONE,
+};
+
+static struct {
+	char name[32];
+	int cmd;
+	int ctrl;
+	int dev;
+	int size;
+	enum {
+		HEX,
+		NUMBER,
+		PNP_ID,
+	} type;
+} attrs[] = {
+	{ "board_name", 0x53, 0x10, 0, 16 },
+	{ "board_serial", 0x53, 0x1F, 0, 16 },
+	{ "board_manufacturer", 0x53, 0x11, 0, 16 },
+	{ "board_id", 0x53, 0x1E, 0, 4 },
+	{ "firmware_version", 0x53, 0x21, 0, 4 },
+	{ "firmware_name", 0x53, 0x22, 0, 16 },
+	{ "firmware_build", 0x53, 0x23, 0, 26 },
+	{ "firmware_date", 0x53, 0x24, 0, 16 },
+	{ "chip_id", 0x53, 0x12, 0, 12 },
+	{ "chip_detect", 0x53, 0x15, 0, 12 },
+	{ "platform_type", 0x53, 0x13, 0, 16 },
+	{ "platform_revision", 0x53, 0x04, 0x44, 4 },
+	{ "eapi_version", 0x53, 0x04, 0x64, 4 },
+	{ "eapi_id", 0x53, 0x31, 0, 4 },
+	{ "boot_count", 0x55, 0x10, 0, 4, NUMBER },
+	{ "powerup_hour", 0x55, 0x11, 0, 4, NUMBER },
+	{ "pnp_id", 0x53, 0x04, 0x68, 4, PNP_ID },
+};
+
+static ssize_t info_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	uint i;
+
+	for (i = 0; i < ARRAY_SIZE(attrs); i++) {
+		int ret;
+		char str[32] = "";
+		int val;
+
+		struct pmc_op op = {
+			.cmd = attrs[i].cmd,
+			.control = attrs[i].ctrl,
+			.device_id = attrs[i].dev,
+			.payload = (u8 *)str,
+			.size = attrs[i].size,
+		};
+
+		if (strcmp(attr->attr.name, attrs[i].name))
+			continue;
+
+		ret = eio_core_pmc_operation(dev, &op);
+		if (ret)
+			return ret;
+
+		if (attrs[i].size != 4)
+			return sysfs_emit(buf, "%s\n", str);
+
+		val = *(u32 *)str;
+
+		if (attrs[i].type == HEX)
+			return sysfs_emit(buf, "0x%08X\n", val);
+
+		if (attrs[i].type == NUMBER)
+			return sysfs_emit(buf, "%d\n", val);
+
+		if (attrs[i].type == PNP_ID)
+			return sysfs_emit(buf, "%c%c%c, %X\n",
+				(val >> 14 & 0x3F) + 0x40,
+				((val >> 9 & 0x18) | (val >> 25 & 0x07)) + 0x40,
+				(val >> 20 & 0x1F) + 0x40,
+				val & 0xFFF);
+	}
+
+	return -EINVAL;
+}
+
+
+PMC_DEVICE_ATTR_RO(board_name);
+PMC_DEVICE_ATTR_RO(board_serial);
+PMC_DEVICE_ATTR_RO(board_manufacturer);
+PMC_DEVICE_ATTR_RO(firmware_name);
+PMC_DEVICE_ATTR_RO(firmware_version);
+PMC_DEVICE_ATTR_RO(firmware_build);
+PMC_DEVICE_ATTR_RO(firmware_date);
+PMC_DEVICE_ATTR_RO(chip_id);
+PMC_DEVICE_ATTR_RO(chip_detect);
+PMC_DEVICE_ATTR_RO(platform_type);
+PMC_DEVICE_ATTR_RO(platform_revision);
+PMC_DEVICE_ATTR_RO(board_id);
+PMC_DEVICE_ATTR_RO(eapi_version);
+PMC_DEVICE_ATTR_RO(eapi_id);
+PMC_DEVICE_ATTR_RO(boot_count);
+PMC_DEVICE_ATTR_RO(powerup_hour);
+PMC_DEVICE_ATTR_RO(pnp_id);
+
+static struct attribute *pmc_attrs[] = {
+	&dev_attr_board_name.attr,
+	&dev_attr_board_serial.attr,
+	&dev_attr_board_manufacturer.attr,
+	&dev_attr_firmware_name.attr,
+	&dev_attr_firmware_version.attr,
+	&dev_attr_firmware_build.attr,
+	&dev_attr_firmware_date.attr,
+	&dev_attr_chip_id.attr,
+	&dev_attr_chip_detect.attr,
+	&dev_attr_platform_type.attr,
+	&dev_attr_platform_revision.attr,
+	&dev_attr_board_id.attr,
+	&dev_attr_eapi_version.attr,
+	&dev_attr_eapi_id.attr,
+	&dev_attr_boot_count.attr,
+	&dev_attr_powerup_hour.attr,
+	&dev_attr_pnp_id.attr,
+	NULL
+};
+
+ATTRIBUTE_GROUPS(pmc);
+
+static int eio_pnp_read(struct device *dev, struct eio_dev_port *port, u8 idx, unsigned int *val)
+{
+	struct eio_dev *eio = dev_get_drvdata(dev);
+	int ret;
+
+	ret = regmap_write(eio->map, port->idx_port, idx);
+	if (ret) {
+		dev_err(dev, "Error port write 0x%X\n", port->idx_port);
+		return ret;
+	}
+
+	ret = regmap_read(eio->map, port->data_port, val);
+	if (ret)
+		dev_err(dev, "Error port read 0x%X\n", port->data_port);
+
+	return ret;
+}
+
+static int eio_pnp_write(struct device *dev, struct eio_dev_port *port, u8 idx, u8 data)
+{
+	struct eio_dev *eio = dev_get_drvdata(dev);
+	int ret;
+
+	ret = regmap_write(eio->map, port->idx_port, idx);
+	if (ret) {
+		dev_err(dev, "Error port write 0x%X %X\n", port->idx_port, port->data_port);
+		return ret;
+	}
+
+	ret = regmap_write(eio->map, port->data_port, data);
+	if (ret)
+		dev_err(dev, "Error port write 0x%X %X\n", port->idx_port, port->data_port);
+
+	return ret;
+}
+
+static int eio_unlock_port(struct device *dev, struct eio_dev_port *port)
+{
+	struct eio_dev *eio = dev_get_drvdata(dev);
+	int ret;
+
+	/* Write 0x87 to index port twice to unlock IO port */
+	ret = regmap_write(eio->map, port->idx_port, EIO_EXT_MODE_ENTER);
+	if (ret) {
+		dev_err(dev, "Error entering PNP mode on 0x%X: %d\n", port->idx_port, ret);
+		return ret;
+	}
+
+	ret = regmap_write(eio->map, port->idx_port, EIO_EXT_MODE_ENTER);
+	if (ret)
+		dev_err(dev, "Error entering PNP mode on 0x%X: %d\n", port->idx_port, ret);
+
+	return ret;
+}
+
+static int eio_lock_port(struct device *dev, struct eio_dev_port *port)
+{
+	struct eio_dev *eio = dev_get_drvdata(dev);
+	int ret;
+	/* Write 0xAA to index port once to lock IO port */
+	ret = regmap_write(eio->map, port->idx_port, EIO_EXT_MODE_EXIT);
+	if (ret)
+		dev_err(dev, "Error port write 0x%X\n", port->idx_port);
+
+	return ret;
+}
+
+static int pmc_write_data(struct device *dev, int id, u8 value)
+{
+	struct eio_dev *eio = dev_get_drvdata(dev);
+	int ret;
+
+	ret = eio_core_pmc_wait(dev, id, PMC_WAIT_INPUT);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(eio->map, eio->pmc[id].data, value);
+	if (ret)
+		dev_err(dev, "Error PMC write %X:%X\n",
+			eio->pmc[id].data, value);
+
+	return ret;
+}
+
+static int pmc_write_cmd(struct device *dev, int id, u8 value)
+{
+	struct eio_dev *eio = dev_get_drvdata(dev);
+	int ret;
+
+	ret = eio_core_pmc_wait(dev, id, PMC_WAIT_INPUT);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(eio->map, eio->pmc[id].cmd, value);
+	if (ret)
+		dev_err(dev, "Error PMC write %X:%X\n",
+			eio->pmc[id].cmd, value);
+
+	return ret;
+}
+
+static int pmc_read_data(struct device *dev, int id, u8 *value)
+{
+	struct eio_dev *eio = dev_get_drvdata(dev);
+	unsigned int val;
+	int ret;
+
+	ret = eio_core_pmc_wait(dev, id, PMC_WAIT_OUTPUT);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(eio->map, eio->pmc[id].data, &val);
+	if (ret)
+		dev_err(dev, "Error PMC read %X\n", eio->pmc[id].data);
+	else
+		*value = (u8)(val & 0xFF);
+
+	return ret;
+}
+
+static int pmc_read_status(struct device *dev, int id)
+{
+	struct eio_dev *eio = dev_get_drvdata(dev);
+	unsigned int val;
+
+	if (regmap_read(eio->map, eio->pmc[id].status, &val)) {
+		dev_err(dev, "Error PMC read %X\n",
+			eio->pmc[id].status);
+		return 0;
+	}
+
+	return val;
+}
+
+static void pmc_clear(struct device *dev, int id)
+{
+	struct eio_dev *eio = dev_get_drvdata(dev);
+	unsigned int val;
+
+	/* Check if input buffer blocked */
+	if ((pmc_read_status(dev, id) & EIO_PMC_STATUS_IBF) == 0)
+		return;
+
+	/* Read out previous garbage */
+	if (regmap_read(eio->map, eio->pmc[id].data, &val))
+		dev_err(dev, "Error pmc clear\n");
+
+	usleep_range(10, 100);
+}
+
+int eio_core_pmc_wait(struct device *dev, int id, enum eio_pmc_wait wait)
+{
+	struct eio_dev *eio = dev_get_drvdata(dev);
+	uint val;
+	int timeout = DEFAULT_TIMEOUT;
+
+	if (wait == PMC_WAIT_INPUT)
+		return regmap_read_poll_timeout(eio->map, eio->pmc[id].status,
+						val, (val & EIO_PMC_STATUS_IBF) == 0,
+						SLEEP_MAX, timeout);
+	return regmap_read_poll_timeout(eio->map,
+					eio->pmc[id].status, val,
+					(val & EIO_PMC_STATUS_OBF) != 0,
+					SLEEP_MAX, timeout);
+}
+EXPORT_SYMBOL_GPL(eio_core_pmc_wait);
+
+int eio_core_pmc_operation(struct device *dev, struct pmc_op *op)
+{
+	struct eio_dev *eio = dev_get_drvdata(dev);
+	u8 i;
+	int ret;
+	bool reading = op->cmd & EIO_FLAG_PMC_READ;
+
+	mutex_lock(&eio->mutex);
+
+	pmc_clear(dev, op->chip);
+
+	ret = pmc_write_cmd(dev, op->chip, op->cmd);
+	if (ret)
+		goto err;
+
+	ret = pmc_write_data(dev, op->chip, op->control);
+	if (ret)
+		goto err;
+
+	ret = pmc_write_data(dev, op->chip, op->device_id);
+	if (ret)
+		goto err;
+
+	ret = pmc_write_data(dev, op->chip, op->size);
+	if (ret)
+		goto err;
+
+	for (i = 0; i < op->size; i++) {
+		if (reading)
+			ret = pmc_read_data(dev, op->chip, &op->payload[i]);
+		else
+			ret = pmc_write_data(dev, op->chip, op->payload[i]);
+
+		if (ret)
+			break;
+	}
+
+err:
+	mutex_unlock(&eio->mutex);
+	if (ret)
+		return ret;
+	return 0;
+
+}
+EXPORT_SYMBOL_GPL(eio_core_pmc_operation);
+
+static int get_pmc_port(struct device *dev, int id,
+			struct eio_dev_port *port)
+{
+	struct eio_dev *eio = dev_get_drvdata(dev);
+	struct _pmc_port *pmc = &eio->pmc[id];
+	int ret;
+	unsigned int high, low;
+
+	ret = eio_unlock_port(dev, port);
+	if (ret)
+		return ret;
+
+	/* Switch to PMC device page */
+	ret = eio_pnp_write(dev, port, EIO_LDN, EIO_LDN_PMC1);
+	if (ret)
+		return ret;
+
+	/* Active this device */
+	ret = eio_pnp_write(dev, port, EIO_LDAR, EIO_LDAR_LDACT);
+	if (ret)
+		return ret;
+
+	/* Get PMC data port */
+	ret = eio_pnp_read(dev, port, EIO_IOBA0H, &high);
+	if (ret)
+		return ret;
+	ret = eio_pnp_read(dev, port, EIO_IOBA0L, &low);
+	if (ret)
+		return ret;
+	pmc->data = (high << 8) | low;
+
+	/* Get PMC cmd */
+	ret = eio_pnp_read(dev, port, EIO_IOBA1H, &high);
+	if (ret)
+		return ret;
+	ret = eio_pnp_read(dev, port, EIO_IOBA1L, &low);
+	if (ret)
+		return ret;
+	pmc->cmd = (high << 8) | low;
+
+	/* Disable IRQ */
+	ret = eio_pnp_write(dev, port, EIO_IRQCTRL, 0);
+	if (ret)
+		return ret;
+
+	ret = eio_lock_port(dev, port);
+	if (ret)
+		return ret;
+
+	/* Make sure IO ports are not occupied */
+	if (!devm_request_region(dev, pmc->data, 2, KBUILD_MODNAME)) {
+		dev_err(dev, "Request region %X error\n", pmc->data);
+		return -EBUSY;
+	}
+
+	return 0;
+}
+
+static int eio_init(struct device *dev)
+{
+	struct eio_dev *eio = dev_get_drvdata(dev);
+	u16 chip_id;
+	unsigned int msb, lsb;
+	int tmp;
+	int ret = -ENOMEM;
+
+	for (int chip = 0; chip < ARRAY_SIZE(pnp_port); chip++) {
+		struct eio_dev_port *port = pnp_port + chip;
+
+		if (!devm_request_region(dev, pnp_port[chip].idx_port,
+					 pnp_port[chip].data_port -
+						 pnp_port[chip].idx_port,
+					 KBUILD_MODNAME))
+			continue;
+
+		ret = eio_unlock_port(dev, port);
+		if (ret)
+			return ret;
+
+		ret = eio_pnp_read(dev, port, EIO_CHIPID1, &msb);
+		if (ret)
+			return ret;
+
+		ret = eio_pnp_read(dev, port, EIO_CHIPID2, &lsb);
+		if (ret)
+			return ret;
+
+		chip_id = (msb << 8) | lsb;
+
+		if (chip_id != EIO200_CHIPID && chip_id != EIO201_211_CHIPID)
+			continue;
+
+		/* Turn on the enable flag */
+		ret = eio_pnp_read(dev, port, EIO_SIOCTRL, &tmp);
+		if (ret)
+			return ret;
+
+		tmp |= EIO_SIOCTRL_SIOEN;
+
+		ret = eio_pnp_write(dev, port, EIO_SIOCTRL, tmp);
+		if (ret)
+			return ret;
+
+		ret = eio_lock_port(dev, port);
+		if (ret)
+			return ret;
+
+		ret = get_pmc_port(dev, chip, port);
+		if (ret)
+			return ret;
+
+		if (chip == 0)
+			eio->flag |= EIO_F_CHIP_EXIST;
+		else
+			eio->flag |= EIO_F_SUB_CHIP_EXIST;
+	}
+
+	return ret;
+}
+
+static uint8_t acpi_ram_access(struct device *dev, uint8_t offset)
+{
+	uint8_t val;
+	int ret;
+	struct eio_dev *eio = dev_get_drvdata(dev);
+
+	/* We only store information on primary EC */
+	int chip = 0;
+
+	mutex_lock(&eio->mutex);
+
+	pmc_clear(dev, chip);
+
+	ret = pmc_write_cmd(dev, chip, EIO_PMC_CMD_ACPIRAM_READ);
+	if (ret)
+		goto err;
+
+	ret = pmc_write_data(dev, chip, offset);
+	if (ret)
+		goto err;
+
+	ret = pmc_write_data(dev, chip, sizeof(val));
+	if (ret)
+		goto err;
+
+	ret = pmc_read_data(dev, chip, &val);
+	if (ret)
+		goto err;
+
+	ret = val;
+
+err:
+	mutex_unlock(&eio->mutex);
+	return ret;
+}
+
+static int firmware_code_base(struct device *dev)
+{
+	struct eio_dev *eio = dev_get_drvdata(dev);
+	u8 ic_vendor, ic_code, code_base;
+
+	ic_vendor = acpi_ram_access(dev, EIO_ACPIRAM_ICVENDOR);
+	ic_code = acpi_ram_access(dev, EIO_ACPIRAM_ICCODE);
+	code_base = acpi_ram_access(dev, EIO_ACPIRAM_CODEBASE);
+
+	if (ic_vendor != 'R')
+		return -ENODEV;
+
+	if (ic_code != EIO200_ICCODE && ic_code != EIO201_ICCODE &&
+	    ic_code != EIO211_ICCODE)
+		goto err;
+
+	if (code_base == EIO_ACPIRAM_CODEBASE_NEW) {
+		eio->flag |= EIO_F_NEW_CODE_BASE;
+		return 0;
+	}
+
+	if (code_base == 0 &&
+	    (ic_code != EIO201_ICCODE && ic_code != EIO211_ICCODE)) {
+		dev_info(dev, "Old code base not supported.");
+		return -ENODEV;
+	}
+
+err:
+	/* Codebase error. This should only happen on firmware error. */
+	dev_err(dev,
+		"Codebase check fail: vendor: 0x%X, code: 0x%X, base: 0x%X\n",
+		ic_vendor, ic_code, code_base);
+	return -ENODEV;
+}
+
+static int eio_probe(struct device *dev, unsigned int id)
+{
+	int ret = 0;
+	struct eio_dev *eio;
+
+	eio = devm_kzalloc(dev, sizeof(*eio), GFP_KERNEL);
+	if (!eio)
+		return -ENOMEM;
+
+	eio->dev = dev;
+	mutex_init(&eio->mutex);
+
+	eio->iomem = devm_ioport_map(dev, 0, EIO_SUB_PNP_DATA + 1);
+	if (IS_ERR(eio->iomem))
+		return PTR_ERR(eio->iomem);
+
+	eio->map = devm_regmap_init_mmio(dev, eio->iomem, &pnp_regmap_config);
+	if (IS_ERR(eio->map))
+		return PTR_ERR(eio->map);
+
+	/* Publish instance for subdrivers (dev_get_drvdata(dev->parent)) */
+	dev_set_drvdata(dev, eio);
+
+	if (eio_init(dev))
+		return -ENODEV;
+
+	ret = firmware_code_base(dev);
+	if (ret) {
+		dev_err(dev, "Chip code base check fail\n");
+		return ret;
+	}
+
+	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
+				   eio_devs, ARRAY_SIZE(eio_devs),
+				   NULL, 0, NULL);
+	if (ret)
+		dev_err(dev, "Cannot register child devices (error = %d)\n", ret);
+
+	return ret;
+}
+
+static struct isa_driver eio_driver = {
+	.probe    = eio_probe,
+	.driver = {
+		.name = "eio_core",
+		.dev_groups = pmc_groups,
+	},
+};
+module_isa_driver(eio_driver, NUM_EC);
+
+MODULE_AUTHOR("Wenkai Chung <wenkai.chung@advantech.com.tw>");
+MODULE_AUTHOR("Ramiro Oliveira <ramiro.oliveira@advantech.com>");
+MODULE_DESCRIPTION("Advantech EIO series EC core driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/eio.h b/include/linux/mfd/eio.h
new file mode 100644
index 000000000000..c2daad41318b
--- /dev/null
+++ b/include/linux/mfd/eio.h
@@ -0,0 +1,124 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2025 Advantech Co., Ltd.
+ */
+
+#ifndef _MFD_EIO_H_
+#define _MFD_EIO_H_
+
+#include <linux/io.h>
+#include <linux/regmap.h>
+
+/* CHIP ID versions */
+#define EIO_CHIPID1		0x20
+#define EIO_CHIPID2		0x21
+#define EIO_CHIPVER		0x22
+#define EIO_SIOCTRL		0x23
+#define EIO_SIOCTRL_SIOEN	BIT(0)
+#define EIO_SIOCTRL_SWRST	BIT(1)
+#define EIO_IRQCTRL		0x70
+#define EIO200_CHIPID		0x9610
+#define EIO201_211_CHIPID	0x9620
+#define EIO200_ICCODE		0x10
+#define EIO201_ICCODE		0x20
+#define EIO211_ICCODE		0x21
+
+/* LPC PNP */
+#define EIO_PNP_INDEX		0x299
+#define EIO_PNP_DATA		0x29A
+#define EIO_SUB_PNP_INDEX	0x499
+#define EIO_SUB_PNP_DATA	0x49A
+#define EIO_EXT_MODE_ENTER	0x87
+#define EIO_EXT_MODE_EXIT	0xAA
+
+/* LPC LDN */
+#define EIO_LDN			0x07
+#define EIO_LDN_PMC0		0x0C
+#define EIO_LDN_PMC1		0x0D
+
+/* PMC registers */
+#define EIO_PMC_STATUS_IBF	BIT(1)
+#define EIO_PMC_STATUS_OBF	BIT(0)
+#define EIO_LDAR		0x30
+#define EIO_LDAR_LDACT		BIT(0)
+#define EIO_IOBA0H		0x60
+#define EIO_IOBA0L		0x61
+#define EIO_IOBA1H		0x62
+#define EIO_IOBA1L		0x63
+#define EIO_FLAG_PMC_READ	BIT(0)
+
+/* PMC command list */
+#define EIO_PMC_CMD_ACPIRAM_READ	0x31
+#define EIO_PMC_CMD_CFG_SAVE		0x56
+
+/* OLD PMC */
+#define EIO_PMC_NO_INDEX	0xFF
+
+/* ACPI RAM Address Table */
+#define EIO_ACPIRAM_VERSIONSECTION	(0xFA)
+#define EIO_ACPIRAM_ICVENDOR		(EIO_ACPIRAM_VERSIONSECTION + 0x00)
+#define EIO_ACPIRAM_ICCODE		(EIO_ACPIRAM_VERSIONSECTION + 0x01)
+#define EIO_ACPIRAM_CODEBASE		(EIO_ACPIRAM_VERSIONSECTION + 0x02)
+
+#define EIO_ACPIRAM_CODEBASE_NEW	BIT(7)
+
+/* Firmware */
+#define EIO_F_SUB_NEW_CODE_BASE	BIT(6)
+#define EIO_F_SUB_CHANGED	BIT(7)
+#define EIO_F_NEW_CODE_BASE	BIT(8)
+#define EIO_F_CHANGED		BIT(9)
+#define EIO_F_SUB_CHIP_EXIST	BIT(30)
+#define EIO_F_CHIP_EXIST	BIT(31)
+
+/* Others */
+#define EIO_EC_NUM	2
+
+struct _pmc_port {
+	union {
+		u16 cmd;
+		u16 status;
+	};
+	u16 data;
+};
+
+struct pmc_op {
+	u8  cmd;
+	u8  control;
+	u8  device_id;
+	u8  size;
+	u8  *payload;
+	u8  chip;
+};
+
+enum eio_rw_operation {
+	OPERATION_READ,
+	OPERATION_WRITE,
+};
+
+struct eio_dev {
+	struct device *dev;
+	struct regmap *map;
+	void __iomem  *iomem;
+	struct mutex mutex; /* Protects PMC command access */
+	struct _pmc_port pmc[EIO_EC_NUM];
+	u32 flag;
+};
+
+int eio_core_pmc_operation(struct device *dev, struct pmc_op *operation);
+
+enum eio_pmc_wait {
+	PMC_WAIT_INPUT,
+	PMC_WAIT_OUTPUT,
+};
+
+int eio_core_pmc_wait(struct device *dev, int id, enum eio_pmc_wait wait);
+
+#define PMC_DEVICE_ATTR_RO(_name)                                             \
+	static ssize_t _name##_show(struct device *dev,                       \
+				    struct device_attribute *attr, char *buf) \
+	{                                                                     \
+		return info_show(dev, attr, buf);                             \
+	}                                                                     \
+	static DEVICE_ATTR_RO(_name)
+
+#endif

-- 
2.43.0


