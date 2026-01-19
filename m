Return-Path: <linux-gpio+bounces-30718-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E712BD39C70
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 03:39:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 22A743001637
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 02:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F51024BBF4;
	Mon, 19 Jan 2026 02:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="oFCx4+2e";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="kZod77qX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022116.outbound.protection.outlook.com [40.107.75.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E379D257854;
	Mon, 19 Jan 2026 02:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768790358; cv=fail; b=l1mEBXEsH+N2b/AG7B64Vk2h/Lpu0NTEhHeJR3JusHbps3ys+7Of3V1YCK1TUBu1QbyI8heb1CPKz1kxC9Tb0SJkII9QL4apIqdkHle2MEcRWAeofpOtD5w7rgoDjzDHA+yzYD3oC3tOwR8IHxVW9w6FnWXpHSfoEkWhpQ27srE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768790358; c=relaxed/simple;
	bh=cMeTnSvjoh+C/Oglk8Lz9NHoM/pRiPf/jC4gMkf9Sio=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dAeENwSmtVML8WADbGeiC0dbWf2CVKJKKYnsPLuVFSngquY1MgREGt/ykTGNYfjcxfAs3KfBq9rkvolxsBezkJuf30YIHvJ4LG2SqXZT1EUPq9H7abem3Oo5pVoNXsjMCorf3TMF4G0cANPB2QOl9TqU8djfaKzGrLepHG28GAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=oFCx4+2e; dkim=fail (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=kZod77qX reason="signature verification failed"; arc=fail smtp.client-ip=40.107.75.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cMeTnSvjoh+C/Oglk8Lz9NHoM/pRiPf/jC4gMkf9Sio=;
 b=oFCx4+2eimWYcUcH/64k4oy8tb+kPG5guo7JPchZws71mZFk1HKhXr+5xIiJcf/hg8bcUrlVedyhSJWm9uB+6GJ2CcdRb96c4vtx9KIx6byQLWNgAoov/iJmVUlEO9PHpq0U5CjPdwyV3HZuOuWfzYI8O9zwobYsWXhZFoAamvekP6765c/pmycSeiq+KJpW2Mop5snnt8XgGUCsiZeXAqOWeRaDTTwabxRohSD/LbWKA15td0cX9G/j9SZwYGqzP4bGF2g9tyOSGowCuY5PfsNzKPrjiq12HaQRKfsQDCKbmfMRUMGNjituRsRHABurkJDyH0OyVAy/DUgyt3qzXg==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by TYZPR06MB6894.apcprd06.prod.outlook.com (2603:1096:405:20::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 02:39:13 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448%3]) with mapi id 15.20.9520.006; Mon, 19 Jan 2026
 02:39:13 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, BMC-SW
	<BMC-SW@aspeedtech.com>
Subject: Re: [PATCH 3/5] gpio: aspeed-sgpio: Create llops to handle hardware
 access
Thread-Topic: [PATCH 3/5] gpio: aspeed-sgpio: Create llops to handle hardware
 access
Thread-Index: AQHch6LbTxZfi00O+EG9xRc0ikvT8LVWgaEAgAI3VL8=
Date: Mon, 19 Jan 2026 02:39:12 +0000
Message-ID:
 <f94ea2f9d0d241509d256d87f02c6de2OSQPR06MB725219B6ED261DBB4E8BC33D8B88A@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20260117-upstream_sgpio-v1-0-850ef3ffb680@aspeedtech.com>
 <20260117-upstream_sgpio-v1-3-850ef3ffb680@aspeedtech.com>
 <55fbb766-12b5-441a-b06c-d807097e5476@lunn.ch>
In-Reply-To: <55fbb766-12b5-441a-b06c-d807097e5476@lunn.ch>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c4a117d-79c7-4b53-4818-08de5703ee73
x-ms-traffictypediagnostic:
 OSQPR06MB7252:EE_|TY0PR06MB5495:EE_|OSQPR06MB7252:EE_|TYZPR06MB6894:EE_
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|14060799003|35042699022|38070700021;
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(14060799003)(35042699022)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: OSQPR06MB7252.apcprd06.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id:
 41541a69-2443-4910-7d04-08de56ffc9b5
x-ms-exchange-crosstenant-originalarrivaltime: 19 Jan 2026 02:09:33.3417 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
x-ms-exchange-transport-crosstenantheadersstamped: TY0PR06MB5495
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
arc-seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WE561qc5RgpX1WoB63qXz/vqyQts3AmU9uzblLEpfRss2spYJuWT2GpICDBM9ksEuqOYxp0mnFDk8EZEKpITyn0idynhlLur+6GGHYI6KF/OH5WvT7F4Sut1+dzl9+lbYigXQdvp2TZVlwwjhW2Kfuvh3D6aZXndy5fqJfbwXkgBxTeBCdtENNyLzdzS04F4gTX3SZ7jlU5gsUXdX6lX/epSLpR0gXJOKd5C24K4CdjxiZIVlGTy2d/+Xj/+mMW3B9YI2XztgnbhaoVmr6XmD6NSzrztjCnbuFikqrySOxXyI9KBjc7FH7d3ICPVHYGqqJst8QDaBngG/zIwRbdRSw==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rx5jmfo2Kbf12nfLFmLe2kMtM06s6zFkPW75bIBG7+I=;
 b=YYCL8nSjpJrJ8bla/w+YQz5scRTxoR9HkZ1aDqpt4nfnvV+cwTnUuMD3Hn3BcTQCkW4P19zd4FUo0PhYOOa2GIfQ9kFSDcH4BevRh+rTOupdBIvVHFNESTsqV3S4ziu2iJSkfJ6DYZq5FtfVDa+FEQNMsWmYQeWaX3JMWEq5Flt/nQ8MUy5yrHYa74Ros/314sXpGimEQNPTckGf8B115+awfBZIaVRPEywz6E79eyYoWob8FV65UXNYB+iQKfRW/QtkStPh1wwZkXlKM69kKsfqpTcPRzVzA3tnh1OEoYQlGCuunMy/m1DdcAzJGrRTelcQS110HtEleHzEJGf40g==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?1f3Fxa9LE9T/6ipiEB9tBlMMtFAEXpioa3nrZWNB6lnJH8mkby/RJXZt?=
 =?Windows-1252?Q?94ODd2wtvNt3s2L2K7LIVJeIwE2iKhp4sDona7GhpF5yUjSH2VoIIHl+?=
 =?Windows-1252?Q?1nBA97EGpaaIG5Kz+Hulgu6XxqzdeoOji1femAs0oVWlwvj29Vpk0bQt?=
 =?Windows-1252?Q?9AOan13HTDGtY7WPGOOHtvJTSzXHGA4wJ+yg6TJcF4PAdXn/Kk59PBfM?=
 =?Windows-1252?Q?chZSrs5UG0ZFWz7ATm4k1+O+0FjYHS7OXHC0wDhDTvjlpNuDsktsUEAr?=
 =?Windows-1252?Q?8TwnZkN+91Ay/n5wxbSPko86XpBEGI7mqA/JGlLiSqHemvt34X0Xulp2?=
 =?Windows-1252?Q?G6z+eqecJ1442CvmX2B8eOJpZ7YFn6q/0VaLBD0yqLl0e6/+f+2eL7zM?=
 =?Windows-1252?Q?85TsJS/jziA+wcMFsVWMihaNRgwAZ5I8KorR2JV58rsLvWZisY6Bc5RW?=
 =?Windows-1252?Q?i4prRv1PO+PB+TG0utA5fSsWaNgZ95mmI/Bkvjv+MdVhUrFCzFOgVE0P?=
 =?Windows-1252?Q?uQxfiMz3IwiP76FSKG0V5LMX5K+dpoE/JP8lNZVUCgIG0Dayq1Rpn+pd?=
 =?Windows-1252?Q?1QiDNW2qE6pZzejwuyj2+dSThQDC+lruD90w1a6Kt1WnMEFRbt3yr3d4?=
 =?Windows-1252?Q?1G3K9v0GhXXCw2omrXdYTYVlnlKQXz/ZJg3yTvbgrQpthXMzYHzVoG7l?=
 =?Windows-1252?Q?8pKSzTLxjykYSaj6Z+dQiBB815zTTAw2pQ3LwGzgGxT0qCN2lYP/yZng?=
 =?Windows-1252?Q?jUmrE+OwdKuR5FUoqi9wVYyeXzIp/Ovnsd4+gghj1cvm22XkVuZpdrQH?=
 =?Windows-1252?Q?lpgJqG2D3qOOnFYtL/p2aLqdOcTIlesDAm/rJrj+up70PWzkzhIybRjF?=
 =?Windows-1252?Q?FFzcJnxxiRmQmzhLirjHAplPmrPwF1FV2ED2qdeGcI0LoR7bFssW1/Mj?=
 =?Windows-1252?Q?3t2vTe9i1haJCO9fMvlR6DUjUa/X4oAE1rZHxG3HdqobIt0z25nW/JQ8?=
 =?Windows-1252?Q?bVHQkR1zB82Nfx+ly0ksWax1Fok1Mekb8jMnRy5ovonBbm2oF+x5J88K?=
 =?Windows-1252?Q?+vo4h3Vmxyi2XgHB/Clq8yzC7TXsldMlMvnyPSi5xHGvEgwqGte5/GZv?=
 =?Windows-1252?Q?1Oz70XNwVxT6jU3Mshuip0hnQVTzfSKuCV47YuE4YLpho5M9vMxAsXrr?=
 =?Windows-1252?Q?kKhTSBUgXO///mVzbQuR7lTlc55XGZMlpOpv4y1I1kunrXY3CVZ8K81o?=
 =?Windows-1252?Q?94r7i8wnBklNYgvvumydMy0lAB7Q76mssZxblK61snyBUA9OwrArjx18?=
 =?Windows-1252?Q?85mMb7vQb/NRP4HTP5sXvtUYc84HHdLaCF9zHrg2txuORKigXKmj8Fbx?=
 =?Windows-1252?Q?gcbAzwsU1vR/ypcKY3iaU4nKWNuTpEQwUn4N7HosjmuExm6FJ/8gEJRE?=
 =?Windows-1252?Q?qWQdY/XF2cUfeiZha+fwrABk9Yj/KoXxBKyDi2cPRIsf265d4DojI7g4?=
 =?Windows-1252?Q?ORPuG7JSWakV7mHN25evZwnCHMIUPjakuDlQpbm2+baKZubnGdeXOp5P?=
 =?Windows-1252?Q?T1DtQOy+iE3XK77UZOBmQWJZnjfQ+REyL7SCbq3L6V0nMNDQGc3aM9hZ?=
 =?Windows-1252?Q?txoHe8n76C/Gi8DSgATPYCLLHOo1uq03PUWfAfv5uEfaONszLBljQvP+?=
 =?Windows-1252?Q?gj7Z6I1YdvHMq+h78c9LaR/PaU1oBozwq1WoGQjq3O5FDkY4aUVFoZg6?=
 =?Windows-1252?Q?oKAXHH/xUomPcp/Q8IQ=3D?=
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname:
 NN5JmIit2OGS4HolIvIXeralEd8ZfoyuQ5V+Ic1ExP2xo0lzP0Ne1JVGgTA4FRtx+29BdpAOLV/QNlcQb1QGPGzJzWwbMA+SM5GqvyJ4cJY=
dkim-signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rx5jmfo2Kbf12nfLFmLe2kMtM06s6zFkPW75bIBG7+I=;
 b=kZod77qXv48jZebobzaaYRIvZyg1aEMOffwiaKKWHaTeDPfvrSE5fZ72Oavcq8XnDOPWolisoAzERft/WR0pqHOjkzW3mLKLRUocI+wJJuA/xSyxfsBGW/GZ5di+QFLPd+hCfHzN/8sh9fIXatfqLxPHKIzTUuMuY/nDYqqgPJDGOvvjlkJ+nfEo99c58hAElT55q4J7fJYPGfp9wIASqGe0symoXU6Gdo+e/q9U1URG+tUWH7mv+h9utpG/v7sKbDdUK/Qor0uuKyt/qqs8+hdjPlihpMcAOOmlFFAQwwAlnwxpq+eqFDf/SdyEjJkMCvt5A499S7MEEDRAQnA4tg==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?GXcFt8S91EJ7ujlTxgb0nhzSV2W0uJsP+FLUqiVMFYYrwW+/UjMtKf2T?=
 =?Windows-1252?Q?uX/dq1hlJiX6iJ5InxQ059jnHGiQUrMkQzavDuvUWeRS64VSBavV86Fw?=
 =?Windows-1252?Q?MyUnvXHlx3Prx2/yvIp10eQgyW011CQuvOQPjcaBD//L4V0PrfAgzJBX?=
 =?Windows-1252?Q?lqsicCFg+9Y88emeYOy6IJFJ9rSfCYC8Ic2tXT2bKaqK1a3s2PAWmM48?=
 =?Windows-1252?Q?jNeSvZyaIL/fiVIj4eJiwi1MFz1XQ3wm76sHYiTarecVhJ0weqBnl+q3?=
 =?Windows-1252?Q?OKemlJcVCcPUW7np0i9xdLYAtcLoyVxgerF8es93LlbSg/Z53UXzFErv?=
 =?Windows-1252?Q?5FUg3Ch/4N499JBoAQnQ+N+rVNfWZoPVmLq1chEp5Ci8E4hUWIHNGVex?=
 =?Windows-1252?Q?p/vhgxp9BP36UP44gZYgHmR0HJ+qpZJRC/PE2YGOeXIOZIb3d+pHf7TJ?=
 =?Windows-1252?Q?0eL89DMCjdodsxe3WY+SmU6FoSbZ/1i3Tez+gE7p3Ldypua36Ps2pOuP?=
 =?Windows-1252?Q?et2IjFv5ppwZNnXX1Bho9auY82yAUYb+CDNmP0Fw/z59E628MhXQbkLR?=
 =?Windows-1252?Q?KVKxMG0oaOOQxAL3TcXvyoa/qTonxjffSgw/ZP+BJ/ST8TLITuU6Vw+P?=
 =?Windows-1252?Q?dccM/KGjYXrvoD7Edq6bibhGS1X0HrLoubI+yVykvw+O0N/d87XaX5iV?=
 =?Windows-1252?Q?7VFCsRFYexvybijNDRQ5AbwNDfSDHDiGb4jbUNpoUOQodxKT71wVYrxV?=
 =?Windows-1252?Q?5F9IQlJosTOFtPa/1HZ7AIbD+Viy5hKxUONqsrDBw0TDN6GNRUPhhqLF?=
 =?Windows-1252?Q?i8e4d70QHpGZKXNyJOcc+rsl4+ymZAHO73lQiK6hHdwCc4N2uh7OFV94?=
 =?Windows-1252?Q?QNOl7bikK3Bd2bbhURiuX/nmEI5eom1lL3reAo8ZiGKcahWOIjOqFmKI?=
 =?Windows-1252?Q?B3+IdT3jCgmxVJI5hpjq0EXieICcq+j3QyUoGzZCb/3qB12AjP4QZlkv?=
 =?Windows-1252?Q?nA9xzYO6APFGT1wRgWjUa16FxENl+2iQLKb3KYJDhLuEgHSf5ejjYAz9?=
 =?Windows-1252?Q?GWta0XOyOERCsSqNJiDZLH0fa6+fQ1I+N6s/+vb3KUCvUT/FnGz/k8gb?=
 =?Windows-1252?Q?9C6Enaq6Bz0+fmMS0+FVNEmG+e8SD5eJVrR3Cie7Yl+kqz1KJiqvmGfn?=
 =?Windows-1252?Q?AgxImn0NSLaGt/HwkJwQlqK3EWDQpQM/Iq6FxWqZm8tc/lv7EG3+TqTG?=
 =?Windows-1252?Q?Lo/3cWMdQ5QWabid/ISl8B944jkcUKO2ShUkbCG/mY0lnY7QwHtCU4Qs?=
 =?Windows-1252?Q?w37G6lk5UK1oLTjpa82kDNfBG2D+CHJWGb9nMk8iMKXx8aY+lVgRYqGC?=
 =?Windows-1252?Q?j56TZOk6GKWi+TNPQ0L15NOo0L6EwrPZhV6PAeosGto5uii5rD9Yiq/M?=
 =?Windows-1252?Q?mccF/szTFuHjA0JAIyEhZxxNW15g1I9a55iKA5GmYYQezH0xuDQxZxpV?=
 =?Windows-1252?Q?/eK1oPxjyxcfF/s9q3GTGSiMgh9iIy+y98xEwCqjoyfFXnY7G4WYnLHY?=
 =?Windows-1252?Q?8lGjzdtSFa1LDYwgF0B66j8slJVIk3VN6bsXCY8K3XRtPEUQdn+Nh7/X?=
 =?Windows-1252?Q?242G3GdLbClcntb7ypWwr7nJFAaffVs92R502CGiPJhQ1JlL+mLDx6cV?=
 =?Windows-1252?Q?7WmjxCXk/QhaI4M7QUWzWg+p1R+hP/+ylUvk3c08IzMdfq/eFDytoWvZ?=
 =?Windows-1252?Q?Lkk5kPJQD/w+08giA1aJMM53e0ejvIEF/SVoBMBUWe0BFw4SCcRGMilR?=
 =?Windows-1252?Q?AfdYzXYeqCKvCzGoPs2U+Zuc8tuOgN8UeTjPfFmyebozGZTLOmUftmP3?=
 =?Windows-1252?Q?MQkL9B/bgFDqVA=3D=3D?=
x-ms-exchange-antispam-relay: 0
x-ms-office365-filtering-correlation-id-prvs:
 41541a69-2443-4910-7d04-08de56ffc9b5
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <BF515AE31A98C542AA9145F25925EFE5@apcprd06.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c4a117d-79c7-4b53-4818-08de5703ee73
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2026 02:39:13.0010
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +48wFlY07IAqc9uzI7v1pVcBVgTg836AmJDDq/vZJmVM4V0kzSG9lYPiYMH21YgAysEI5g6pwXiwQMwx8x35OmreWdxT73p5Yhh0YSEsgpk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6894

=A0=0A=
Thanks for the detailed review =97 your comments are very helpful.=0A=
=A0=0A=
> > Add low-level operations (llops) to abstract the register access for SG=
PIO=0A=
> > registers. With this abstraction layer, the driver can separate the=0A=
> > hardware and software logic, making it easier to extend the driver to=
=0A=
> > support different hardware register layouts.=0A=
=A0=0A=
> With a quick look at the code, it appears the register numbers stay=0A=
> the same? Is that true?=0A=
> I think you have reinvented regmap.=0A=
=A0=0A=
Yes, the register numbers remain unchanged for ASPEED G4 in this patch.=0A=
The intent of introducing the llops abstraction is to decouple the driver l=
ogic=0A=
from the underlying register layout so that we can support SoCs with differ=
ent=0A=
SGPIO register organizations in the future. The actual AST2700-specific sup=
port=0A=
will be added in a subsequent patch.=0A=
=A0=0A=
We did consider regmap. However, llops is intended to abstract not only reg=
ister=0A=
access but also layout-specific bit mapping, which is difficult to express=
=0A=
cleanly with a flat regmap interface.=0A=
=A0=0A=
> > @@ -318,30 +278,25 @@ static int aspeed_sgpio_set_type(struct irq_data =
*d, unsigned int type)=0A=
> >=A0=A0=A0=A0=A0=A0 u32 type0 =3D 0;=0A=
> >=A0=A0=A0=A0=A0=A0 u32 type1 =3D 0;=0A=
> >=A0=A0=A0=A0=A0=A0 u32 type2 =3D 0;=0A=
> > -=A0=A0=A0=A0 u32 bit, reg;=0A=
> > -=A0=A0=A0=A0 const struct aspeed_sgpio_bank *bank;=0A=
> >=A0=A0=A0=A0=A0=A0 irq_flow_handler_t handler;=0A=
> > -=A0=A0=A0=A0 struct aspeed_sgpio *gpio;=0A=
> > -=A0=A0=A0=A0 void __iomem *addr;=0A=
> > -=A0=A0=A0=A0 int offset;=0A=
> > -=0A=
> > -=A0=A0=A0=A0 irqd_to_aspeed_sgpio_data(d, &gpio, &bank, &bit, &offset)=
;=0A=
> > +=A0=A0=A0=A0 struct aspeed_sgpio *gpio =3D irq_data_get_irq_chip_data(=
d);=0A=
> > +=A0=A0=A0=A0 int offset =3D irqd_to_hwirq(d);=0A=
> >=0A=
> >=A0=A0=A0=A0=A0=A0 switch (type & IRQ_TYPE_SENSE_MASK) {=0A=
> >=A0=A0=A0=A0=A0=A0 case IRQ_TYPE_EDGE_BOTH:=0A=
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 type2 |=3D bit;=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 type2 =3D 1;=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 fallthrough;=0A=
> >=A0=A0=A0=A0=A0=A0 case IRQ_TYPE_EDGE_RISING:=0A=
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 type0 |=3D bit;=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 type0 =3D 1;=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 fallthrough;=0A=
> >=A0=A0=A0=A0=A0=A0 case IRQ_TYPE_EDGE_FALLING:=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 handler =3D handle_edge_irq;=
=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> >=A0=A0=A0=A0=A0=A0 case IRQ_TYPE_LEVEL_HIGH:=0A=
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 type0 |=3D bit;=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 type0 =3D 1;=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 fallthrough;=0A=
> >=A0=A0=A0=A0=A0=A0 case IRQ_TYPE_LEVEL_LOW:=0A=
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 type1 |=3D bit;=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 type1 =3D 1;=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 handler =3D handle_level_irq;=
=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
=A0=0A=
> This change is not obviously correct to me. It is not about=0A=
> abstracting register accesses, what you actually write to the=0A=
> registers appears to of changed. Maybe you could add a refactoring=0A=
> patch first which does this change, with a commit message explaining=0A=
> it, and then insert the register abstraction?=0A=
=A0=0A=
You=92re right =97 viewed together, this change is not obviously correct an=
d makes=0A=
the refactoring harder to review.=0A=
=A0=0A=
While the llops interface is designed to handle bit positioning internally=
=0A=
(changing the semantics from passing a bitmask to passing a value), combini=
ng=0A=
this semantic change with the abstraction refactoring increases review=0A=
complexity.=0A=
=A0=0A=
To address this, I will respin the series and split it into:=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1.=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 a preparatory refactoring patch that introduces the llops helpers wi=
thout=0A=
changing behavior, and=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2.=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 a follow-up patch that switches callers to the new value-based inter=
face,=0A=
with a commit message explicitly explaining the semantic change.=0A=
=A0=0A=
> > @@ -374,16 +318,14 @@ static void aspeed_sgpio_irq_handler(struct irq_d=
esc *desc)=0A=
> >=A0 {=0A=
> >=A0=A0=A0=A0=A0=A0 struct gpio_chip *gc =3D irq_desc_get_handler_data(de=
sc);=0A=
> >=A0=A0=A0=A0=A0=A0 struct irq_chip *ic =3D irq_desc_get_chip(desc);=0A=
> > -=A0=A0=A0=A0 struct aspeed_sgpio *data =3D gpiochip_get_data(gc);=0A=
> > +=A0=A0=A0=A0 struct aspeed_sgpio *gpio =3D gpiochip_get_data(gc);=0A=
=A0=0A=
> This rename does not belong in this patch. You want lots of small=0A=
> patches, each doing one logical thing, with a good commit message, and=0A=
> obviously correct. Changes like this make it a lot less obviously=0A=
> correct.=0A=
=A0=0A=
Agreed. I will revert the rename from this patch and handle it separately i=
f=0A=
needed.=0A=
=A0=0A=
> >=A0=A0=A0=A0=A0=A0 /* Disable IRQ and clear Interrupt status registers f=
or all SGPIO Pins. */=0A=
> > -=A0=A0=A0=A0 for (i =3D 0; i < ARRAY_SIZE(aspeed_sgpio_banks); i++) {=
=0A=
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 bank =3D=A0 &aspeed_sgpio_banks[i=
];=0A=
> > +=A0=A0=A0=A0 for (i =3D 0; i < gpio->chip.ngpio; i +=3D 2) {=0A=
=A0=0A=
> Why are ARRAY_SIZE() gone? There probably is a good reason, so doing=0A=
> this in a patch of its own, with a commit message explaining "Why?"=0A=
> would make this easier to review.=0A=
=A0=0A=
The change from ARRAY_SIZE(aspeed_sgpio_banks) to gpio->chip.ngpio is requi=
red=0A=
because AST2700 does not use a fixed bank-based register layout.=0A=
=A0=0A=
Using ngpio removes the dependency on a static bank array and allows the IR=
Q=0A=
handling code to work with SoCs that have different SGPIO organizations.=0A=
I agree this change deserves a dedicated patch with a commit message explai=
ning=0A=
the rationale, and I will split it out accordingly.=0A=
=A0=0A=
Thanks again for the review. I=92ll send a revised version with the changes=
 above.=0A=
=0A=
Billy Tsai=

