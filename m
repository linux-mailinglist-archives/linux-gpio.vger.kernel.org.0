Return-Path: <linux-gpio+bounces-13860-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CAF9F0C3F
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 13:29:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FB6716964B
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 12:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E5FE1DF968;
	Fri, 13 Dec 2024 12:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="ymJrehah"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2064.outbound.protection.outlook.com [40.107.20.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA7A1DF728;
	Fri, 13 Dec 2024 12:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734092977; cv=fail; b=Rx/xd7NPqmawPGR9Bt9xvob+oCu+J+ZecZOlgWjPvCZBx7XBiMFebuCD7Apl5jvRS4NUt61BOBv84UNPUaH3rlHBFOAqIhuU4bTdadecjZSdjQukPJ1ARTkvs3NeFQ7JjNjXx9FuQMhR82OHct5GkdVI2e9H7C5WZO3Pa8RWKTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734092977; c=relaxed/simple;
	bh=33EU+ey7xj26+CcGYmHiJnWgW9JxWIAcvWDiXrTFuvo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dBgRaQ7pk+kYenfT4+VJ7CaY//Ycfv97v9JM9fE7IINHI3CQXNiyrw+VJXcgtRd+KkZ5aTe2zuT7wJaj3PBPhzNnGqsCtVbmUrXYx+Trsd6QyiwO0E+rwETkr9v4Gn2bGlsxnbOxPxuqlbGKZRTQ72tNUUHr+3rylnUEAr5eT/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=ymJrehah; arc=fail smtp.client-ip=40.107.20.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dc5hue1vhFJjU5PoFNh8hJggu3LszrevpJdzI0Jip54oZ2q2vOAyNa8PRVSRFavWem2QqK0pNo0PhfE/71qS49sAorI5umjTcb65P+C6ln1NQTWEeddS/VZ6rqslS7p8cfrXjPtKK7S1g3NMJSa/IIqY8fEfv8NclfdxCU/aZdz2z+0ZXs4jnIp7MxOoc0mdgP5Le7+zSrx431PBDcFDj6DmVDhwG6AcQOOanMBDIZF2zZdU9dKaxnfiZQmFVc8q/O2Ts1RtxkTzbguohebfEMX5MLfiLY4nTT713O7wBXz0d7dY6KO9j3gLShiQHTpVXNp5QNfMJ3+Je4lpdEPmgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=33EU+ey7xj26+CcGYmHiJnWgW9JxWIAcvWDiXrTFuvo=;
 b=eoYiLJR4W/AFpH4Mc4/l6ggNGRMkj0gVcH1QQdMGES3sIPvP079pHACIJK25yMF49qsr6UxCWDKUKgW1Lfoea9DIoSTqve6nJhpLkNLTHqn/XD/cHgS+k//FR/OfEgHslvhO/iSpA1x/Mh+joDsh35L/FQe9B9+/U9Hx/eeLuG1eOkGL0rvcyK39dAu6wO/Ke2uM5EBSSf2z88/9Ux401zsVinPB/RaySPRoRl1nMsc8vE5ArduTbjb8JBae3KNe5HN8TikmfQLs6mj3kT640fnbcG1qr56sCc12BazwHrEr7ANi/U+PxuRCPU3FnmdE3Ey//RSBSPPGP9DBLWIEzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33EU+ey7xj26+CcGYmHiJnWgW9JxWIAcvWDiXrTFuvo=;
 b=ymJrehahltwFSeyAhheREGRj4PDbeOCR7i4/hzAQMzNChXZGLsVPC1knTgLjnOnWsefFXsLmxVwrx/p4F8IjbexXGeIu1i0XeTD0GH2/oQJSPjtUbHuNwuNf6qRnK4bUOcaGd45ZJFSLmfEQfQxNZM+TKiKNMFIQM2VbWoyZzTzPfcSMNuYchAJtMqgM134TAgavQzsR9Yi2hPrWhBT0Z1ctJNyEx5nMrhHy6gtaROkpkRs7jx+y6t0rrsIP3R6kJIoASIUWWR73KLpPap8UiD7hZNeem4VGrhUDt/5bJIOgTemKyCeoa6XuXp1h5zO2/49E+l+eMPdqPkFZLqsp2A==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by PAXPR10MB5406.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:286::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.5; Fri, 13 Dec
 2024 12:29:32 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%7]) with mapi id 15.20.8251.008; Fri, 13 Dec 2024
 12:29:32 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
	"ssantosh@kernel.org" <ssantosh@kernel.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>,
	"khilman@kernel.org" <khilman@kernel.org>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "grygorii.strashko@ti.com"
	<grygorii.strashko@ti.com>
CC: "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "tony@atomide.com"
	<tony@atomide.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "linux-omap@vger.kernel.org"
	<linux-omap@vger.kernel.org>
Subject: Re: [PATCH 2/2] gpio: omap: save two lines by using
 devm_clk_get_prepared()
Thread-Topic: [PATCH 2/2] gpio: omap: save two lines by using
 devm_clk_get_prepared()
Thread-Index: AQHbRaJCThPj1tY640qXcJUSCr5fNbLkJk8AgAADvYA=
Date: Fri, 13 Dec 2024 12:29:32 +0000
Message-ID: <0bf97a477f1c547b960c63607395b82d92986ef3.camel@siemens.com>
References: <20241203164143.29852-1-brgl@bgdev.pl>
	 <20241203164143.29852-2-brgl@bgdev.pl>
	 <a21531a7-13ae-45f5-a60d-dd80b3ef9834@gmail.com>
In-Reply-To: <a21531a7-13ae-45f5-a60d-dd80b3ef9834@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|PAXPR10MB5406:EE_
x-ms-office365-filtering-correlation-id: cf4aabb4-c47b-456b-616e-08dd1b71cbdd
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZGhkRVcyaElKOWgrMG9kTCtncXRkVXVIeUZuMTRxOTh6TWpBcHNDbXJXK3hW?=
 =?utf-8?B?UTBTM09DOUI3bEZxdzREdzVxbFhtaEpDaG8ydThVOU9WUTAzQXREVThMbk12?=
 =?utf-8?B?MUVkUGNzVDlzV21OcUVOQS9hZmxrL3dhMWZWVEQxQWtpUFYvclQ3LzQvMDhD?=
 =?utf-8?B?SkVjQ3pNUnRydmJoTTR0ZG5WNGIxdHFGUFVxUFF6YXo3eHZoOVRBTUlKSDN2?=
 =?utf-8?B?OVpmTWVmRGtzOVF2TzFuTkIvVkhhcVZIV2h6NldkejZuaHdVaWFsNDZpVzhm?=
 =?utf-8?B?b0JKZnJaaXBPaFhSa1lEMTdGdngrM082b09wUmErWGlESWk4VXhtWUtSa0xK?=
 =?utf-8?B?TkYrdTBJQ2oxS1k4aVhQVHhSVmVjQnFTSTFoOUdhN1RibFJGUy9QaHVka1ZN?=
 =?utf-8?B?Q3NNVTlGZUtZNjhhN2NoNXAxeWxPc3pUR1pia3ByakIyYll2d01DbEJPREFC?=
 =?utf-8?B?R1ExM2tLWGxzakZZaHFXdHE3NDVVSXVBd3ZCV3ZVd2RIQnpHMG8xSmlhRnBS?=
 =?utf-8?B?T2lyZ0V5c1ZkNU1oTVRNVytveHdNSmZlVHJESG9Rc0NhMDRRalloemQxb2Fz?=
 =?utf-8?B?R3pGWkxBUVhtaTAyNkxKVVNuWm51OWthZW1tME84OWwrV2dlUXBPbERkeUZk?=
 =?utf-8?B?ZDI1RVBOS1pkeWVtdVdnNmRPL1ZEZmdaeURqTmViSnNvRGMvcW8xOE9JaWJl?=
 =?utf-8?B?ZXAzTUdlQUpxUWdONzhmOEU5WUZ0bXgvNmRRcTlCcko5Y3BWNENaVzdiOW5w?=
 =?utf-8?B?ZjlyS1hPRExDSC9qZzJINE5NZDRCT1RuRGRSUnV2TGtScnRFaTU1NmFQUFFz?=
 =?utf-8?B?T0lYQlRoN2IxdnM4djlxR2pEa3FUMURTYUdYWkdoVmlBOHRNcEdNd01HckV0?=
 =?utf-8?B?cStRMStQdWFLNTIwNnkwY3dJeVE3YVoxTThOL2FGMGl4YmlDb0UzdlZ4WFZU?=
 =?utf-8?B?L0U4SHQ2d1lHdXZwTEl5N3Q5cDhJWlcvUmwyOVFiQURvQmNOQjY0TTNjdnhC?=
 =?utf-8?B?YTZDVGVHZEVDeVVUUHlqZmtLd056SEh0eEhHVFVpSUpkREprME1keXdveHd0?=
 =?utf-8?B?WG9raXhjUUJSSXJ0NkFiWEhWYzJnNDNyblFpdmd5MXdlb3RVL09aL0ZQY3VQ?=
 =?utf-8?B?NE85cWoxNGxraTZqME4xVWRKU21WaEdFalpoNFZ5Z0pFY05mTlRnQUQ4aHp0?=
 =?utf-8?B?blJ1THdZSUFyNnZGQjlabzBsUXhhZGwxZndERXR3QzFYQ2JWMWk5T0tNMW1n?=
 =?utf-8?B?aUkrdjBjZDdiYUErOFpjNndxWk1lU2FlbkUvdGN3VmFHNVVvN1k1MCt3SGxm?=
 =?utf-8?B?enV5M1BCR2VvU2xONHZuajJHcnVpQlJQZ1FaaC9oUDU4MXZ5NHVnUk1YaWJQ?=
 =?utf-8?B?Ym9oei9CU1Ixelh6Uzk1akxXWExIaGZWczVPc0pIYmR3WjBEbFNtMWsxdjAv?=
 =?utf-8?B?TXlUMXA2bnlvVFdvR1hWNFRhUEFQU0FzeThIcWg1NUhWNVFGR3l5ZG9hdmVy?=
 =?utf-8?B?ZUt4M2l2RVU1eUNrR3Rza0owZmVYV3hEeFdWaHYxVTUwbmNCOXMzdWJHbTk5?=
 =?utf-8?B?enlHZTdyWEdUMUdIS0xCL3Q3bUd6dVBLTGQ4Q2Nad1l4eC8veHFJZVJ1dlF6?=
 =?utf-8?B?UE5CVVY0TzZNb213KzVWWFpPSGc3N0VheGp1YWdybXhEaThjelJ1REJ2aXpm?=
 =?utf-8?B?S0hHQ3pKdGhuU1llVm0yNlBIbVJTSjdnMkNxSHk4T25sSi9CN2lZTFR2cHNV?=
 =?utf-8?B?MWtMYnkxK3A3aTJNSWhpUmxKWjNCTzEyWHQzT3RaN1pUQ0xpNWt6cjRvekJ3?=
 =?utf-8?Q?pd6JWLV0C6YkrwkvRr8HgEUCft2ff2skSHZes=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y1dlTEc0RkdpMk80WEFaYmJVUVMrRHdQZG5PZ1REWVlHTFgyZHMvQWR0UnZ2?=
 =?utf-8?B?QjVtM2NZMHhJN2lvT2xrQ0RwOUVLZHhVVUpnRE0vb3hEdExvVVZ2dTk2cUNp?=
 =?utf-8?B?Ymp4RXpyTlBRWE91dGpYb1RDWkZ4Z3puSU1SKzZ3dU9CRkRBSUdzOEhTZ0dh?=
 =?utf-8?B?S1owby9LdWQrdDNsUmVVZWFnQTB0WU1xOUZsM2U3SUlMTlBwWWttVU51Y2VQ?=
 =?utf-8?B?OEJPRERzcXpJWnZLaWhXYW1VQk5YQlhzZDNIRC9OakRKbVhQWW02bm5IOXpq?=
 =?utf-8?B?MXJGT3gzS3ovSzRJUWNOZGRQc29RUFpDNjFHTU12cXZWNnhqUnJqT3R3WFh6?=
 =?utf-8?B?bjFEeHpJZS9qTnBFOVhVMXNaYU1zaWRkQ0hvblBrYTN4KzY5bTcxZnNxQ0RK?=
 =?utf-8?B?Mk9hbnZ2NGZkR2UyYTJrb0NZSzZxdDRUVXpIN0dHWW5SdHRXR3lnRkVlK3hM?=
 =?utf-8?B?aHZ5cW1aZ1pLdkhUbC91ZHovSFN3RWVWcDZoZUFPSDFpc0FQOGRnenNJRmZI?=
 =?utf-8?B?M0wrTkNHVlZuaEl3Q3N6NUpzZmtGZjNsSG55LzgwbUUvdThUMDVVcjkrc0lC?=
 =?utf-8?B?cHBUSmJIVm9pa1pwMTU1R1BNYloxczhHbGgwKzNzcE9FVzZOQmpLbXY2bTRP?=
 =?utf-8?B?WmpVb3FxcDc2bTYzNnBNeEJYSHp5ZG9IUG10VnF0OUVMeENTb1ZpeFd4YVBZ?=
 =?utf-8?B?cXJWVVI3aE5HVkZ5Qzc4NkIwaEJaZVZ3S09uREs5UW5MNGFLcDJKRjRuMXl6?=
 =?utf-8?B?QklXeDl1NW8ydXF5LzEvWHVTL08zRkVuRDVPYjZtK3lKcXRQSHRzYTRjUTdh?=
 =?utf-8?B?cWk1ZVZ3dW1XY25xL202UWNRZWpvSDFvc0JLZTYvcDhSazIzNTQ0endMczRv?=
 =?utf-8?B?UTBxMTluanM2d3Rvd3hFeDhjVUlyZDZWQmpxS24rN0g5Zkg2UUdIT044R2w3?=
 =?utf-8?B?eWdWaDFXZmVHR1U2VVl3bE5TN01penZDZU9obkRGWlE3NnR5UlM5YXErQkpH?=
 =?utf-8?B?YVBkSTc3ckJQRHJtcGt3cmY3OWQ0bHFjRWpOZ2Y5UXM2U1dDNklPWFZyNVhS?=
 =?utf-8?B?TC9EMUs2bm55Q2hUeGRKQ1RPVjNpNWttRmNOem9tNHhPbTlvalFRakw5UGdz?=
 =?utf-8?B?QnRUTlh2bkZFUUtmRnRRYzFOVktBUEdnVnhwa01KaGJpQ0xpQ0lEZ0syeStL?=
 =?utf-8?B?R3FvSXVKZFpmMllQdGF6NXd3SUJzc1RiczhwY2dENmM2cnIvK2tGUFZPdzFa?=
 =?utf-8?B?b2F1djFQU2RaWXVTN2x0bnN4ZTcwOVRqY2EvNUlPVW1meUxPeDN6NkJKRnlQ?=
 =?utf-8?B?czI4bFc4V25RckxZTHl4cWM3T0MxKy83QVA3LzRpMzhJaUtSMjUzMmpaSG5l?=
 =?utf-8?B?d2QzL2JPUllIUFluTVIxWTVRdHBFdTNmRzN3d3NKb1Y3d2YyZ2JpQnZ6TDRH?=
 =?utf-8?B?bVEwU2c0M09JQkxSSDEwVFZDTVNpcnE0dTkyYXJXaWZZMzBTL1pxQjVjTUNG?=
 =?utf-8?B?MnhKend6N2YxcXpIWHUrMDQzeGVtQU5OVmFYbjFqWndSV2hZUjhZWEFIR0xB?=
 =?utf-8?B?LzJBZ0psMnl0NGZmWHFwcFpDTkcxdUZkYzVBeS9PdlNiYm1zc3A3T1ZDKytm?=
 =?utf-8?B?MWNWand0d1UrRGFwaDgrNkVOcUpsWm05d0toYzhJbHk4d1lHNzRKWFJWV1pI?=
 =?utf-8?B?QWR3SlhJVUJvYVlkcFFjMk5yTXNwcjRoSEt6OERjOHhldkZDSWtOZXFGNjlx?=
 =?utf-8?B?cWdDYlkxa05FMmJVYjhrNVgyUDlzbWVib011ZXlOYzZUeUtUOTFRMzlTb0FO?=
 =?utf-8?B?ZUxUQXJPZmI2UC9nQkppVzlQMEpNNDZNaHEvOEg4SU1DS1huMG9OV0h2bmRK?=
 =?utf-8?B?ak9wTmJ2Yk9yc05PTjNsRjJwTU1EcURWQnRUL1JVQ3dLaFN5QXVjL2ZTMmZ0?=
 =?utf-8?B?ZVE4U2tLODdpb2lJbmd6dlIrMW91TU5xcEYxRlhHemQzS2h5WXZMWFFsSTZO?=
 =?utf-8?B?NHBpVlJMQTN4Q3NqbjNwVE1KUURtUDRFSm9NL1A0VXNaeE56Tk5RTVZsbkh6?=
 =?utf-8?B?WTkyc1BaTEN0MEF2QlZoellJOE1DckY4VnlobE5JRW4rdTVGd1d6eEdlNUQw?=
 =?utf-8?B?TjgrNWdsejAreGduYkFVMEVuUndKdGFrYUpPOVM5Q3Z1UngzMUkzanBFc1da?=
 =?utf-8?Q?rzdzZwLiJCvyMyOMkDviSis=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F11766BBE7949648A9079DB6F807EF1A@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cf4aabb4-c47b-456b-616e-08dd1b71cbdd
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2024 12:29:32.1841
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 712yScE5wcROORxwheT0g73MCeLSPRbcMV81obCcniIzM1T8LGztCpJeq/LFWhFKtn0gDH7FqwmEprDZB5myWOiRWQk1rY+g07cl4HC2nqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5406

SGV5IE1hdHRpLCBob3cgYXJlIHlvdT8NCg0KT24gRnJpLCAyMDI0LTEyLTEzIGF0IDE0OjE2ICsw
MjAwLCBNYXR0aSBWYWl0dGluZW4gd3JvdGU6DQo+ID4gRnJvbTogQmFydG9zeiBHb2xhc3pld3Nr
aSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPg0KPiA+IA0KPiA+IFdlIGNhbiBkcm9w
IHRoZSBlbHNlIGJyYW5jaCBpZiB3ZSBnZXQgdGhlIGNsb2NrIGFscmVhZHkgcHJlcGFyZWQgdXNp
bmcNCj4gPiB0aGUgcmVsZXZhbnQgaGVscGVyLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEJh
cnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz4NCj4gPiAt
LS0NCj4gDQo+IEJvb3RpbmcgYSBiZWFnbGVib25lIGJsYWNrIHdpdGggdGhlIGxpbnV4LW5leHQg
ZnJvbSBUb2RheSBmYWlscyANCj4gKG5leHQtMjAyNDEyMTMpLiBFbmFibGluZyBlYXJseWNvbiAr
IGRlYnVnIHlpZWxkcyBiZWxvdyBzcGxhdCB0byBiZSANCj4gcHJpbnRlZCB0byB0aGUgY29uc29s
ZToNCj4gDQo+IFvCoMKgwqAgMi42MjgwMTldIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0t
LS0tLS0tLQ0KPiBbwqDCoMKgIDIuNjMyNzkzXSBXQVJOSU5HOiBDUFU6IDAgUElEOiAzNCBhdCBk
cml2ZXJzL2Nsay9jbGsuYzoxMjU0IA0KPiBjbGtfY29yZV9lbmFibGUrMHhiNC8weDFiMA0KPiBb
wqDCoMKgIDIuNjQxMTU2XSBFbmFibGluZyB1bnByZXBhcmVkIGw0LXdrdXAtY2xrY3RybDowMDA4
OjE4DQo+IFvCoMKgwqAgMi42NDY1MzBdIE1vZHVsZXMgbGlua2VkIGluOg0KPiBbwqDCoMKgIDIu
NjQ5Njg4XSBDUFU6IDAgVUlEOiAwIFBJRDogMzQgQ29tbToga3dvcmtlci91NDozIE5vdCB0YWlu
dGVkIA0KPiA2LjEzLjAtcmMyLW5leHQtMjAyNDEyMTMtMDAwMDItZ2YyZDRiMjljODMzMCAjMTUN
Cj4gW8KgwqDCoCAyLjY2MDI1Nl0gSGFyZHdhcmUgbmFtZTogR2VuZXJpYyBBTTMzWFggKEZsYXR0
ZW5lZCBEZXZpY2UgVHJlZSkNCj4gW8KgwqDCoCAyLjY2NjUzMV0gV29ya3F1ZXVlOiBldmVudHNf
dW5ib3VuZCBkZWZlcnJlZF9wcm9iZV93b3JrX2Z1bmMNCj4gW8KgwqDCoCAyLjY3MjU1M10gQ2Fs
bCB0cmFjZToNCj4gW8KgwqDCoCAyLjY3MjU3MF3CoCB1bndpbmRfYmFja3RyYWNlIGZyb20gc2hv
d19zdGFjaysweDEwLzB4MTQNCj4gW8KgwqDCoCAyLjY4MDU3OF3CoCBzaG93X3N0YWNrIGZyb20g
ZHVtcF9zdGFja19sdmwrMHg1MC8weDY0DQo+IFvCoCA3IDIuNjg1Nzg4XcKgIGR1bXBfc3RhY2tf
bHZsIGZyb20gX193YXJuKzB4YzAvMHgxMzANCj4gW8KgwqDCoCAyLjY5MDczNF3CoCBfX3dhcm4g
ZnJvbSB3YXJuX3Nsb3dwYXRoX2ZtdCsweDgwLzB4MWEwDQo+IFvCoMKgwqAgMi42OTU5NDRdwqAg
d2Fybl9zbG93cGF0aF9mbXQgZnJvbSBjbGtfY29yZV9lbmFibGUrMHhiNC8weDFiMA0KPiBbwqDC
oMKgIDIuNzAxOTYzXcKgIGNsa19jb3JlX2VuYWJsZSBmcm9tIGNsa19jb3JlX2VuYWJsZV9sb2Nr
KzB4MTgvMHgyYw0KPiBbwqDCoMKgIDIuNzA4MTU5XcKgIGNsa19jb3JlX2VuYWJsZV9sb2NrIGZy
b20gDQo+IHN5c2NfZW5hYmxlX29wdF9jbG9ja3MucGFydC45KzB4MjgvMHg4NA0KPiBbwqDCoMKg
IDIuNzE1NjExXcKgIHN5c2NfZW5hYmxlX29wdF9jbG9ja3MucGFydC45IGZyb20gDQo+IHN5c2Nf
ZW5hYmxlX21vZHVsZSsweDI1NC8weDJkYw0KPiBbwqDCoMKgIDIuNzIzMDUyXcKgIHN5c2NfZW5h
YmxlX21vZHVsZSBmcm9tIHN5c2NfcnVudGltZV9yZXN1bWUrMHgxN2MvMHgxYzANCj4gW8KgwqDC
oCAyLjcyOTU5OV3CoCBzeXNjX3J1bnRpbWVfcmVzdW1lIGZyb20gX19ycG1fY2FsbGJhY2srMHg0
Yy8weDEzMA0KPiBbwqDCoMKgIDIuNzM1NzA5XcKgIF9fcnBtX2NhbGxiYWNrIGZyb20gcnBtX2Nh
bGxiYWNrKzB4NTAvMHg1NA0KPiBbwqDCoMKgIDIuNzQxMDk2XcKgIHJwbV9jYWxsYmFjayBmcm9t
IHJwbV9yZXN1bWUrMHg2MTQvMHg2NjANCj4gW8KgwqDCoCAyLjc0NjMwNF3CoCBycG1fcmVzdW1l
IGZyb20gX19wbV9ydW50aW1lX3Jlc3VtZSsweDRjLzB4NjQNCj4gW8KgwqDCoCAyLjc1MTk2MF3C
oCBfX3BtX3J1bnRpbWVfcmVzdW1lIGZyb20gX19kZXZpY2VfYXR0YWNoKzB4ZDAvMHgxODgNCj4g
W8KgwqDCoCAyLjc1ODE1NV3CoCBfX2RldmljZV9hdHRhY2ggZnJvbSBidXNfcHJvYmVfZGV2aWNl
KzB4ODgvMHg4Yw0KPiBvcl90aHJlYWQgZnJvbSBrdGhyZWFkKzB4MTg4LzB4MjRjDQo+IFvCoMKg
wqAgMi43ODk0NzZdwqAga3RocmVhZCBmcm9tIHJldF9mcm9tX2ZvcmsrMHgxNC8weDIwDQo+IFvC
oMKgwqAgMi43OTQzMjddIEV4Y2VwdGlvbiBzdGFjaygweGUwMDkxZmIwIHRvIDB4ZTAwOTFmZjgp
DQo+IFvCoMKgwqAgMi43OTk1MjhdIDFmYTA6wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDAwMDAwMDAwIA0KPiAw
MDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMA0KPiBbwqDCoMKgIDIuODA3OTQ3XSAxZmMwOiAwMDAw
MDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCANCj4gMDAwMDAwMDAgMDAw
MDAwMDAgMDAwMDAwMDANCj4gW8KgwqDCoCAyLjgxNjM2NV0gMWZlMDogMDAwMDAwMDAgMDAwMDAw
MDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMTMgMDAwMDAwMDANCj4gW8KgwqDCoCAyLjgyMzE3
M10gLS0tWyBlbmQgdHJhY2UgMDAwMDAwMDAwMDAwMDAwMCBdLS0tDQo+IFvCoMKgwqAgMi44Mjgw
NzBdIHRpLXN5c2MgNDRlMDcwMDAudGFyZ2V0LW1vZHVsZTogT3B0aW9uYWwgY2xvY2tzIGZhaWxl
ZCANCj4gZm9yIGVuYWJsZTogLTEwOA0KPiBbwqDCoMKgIDIuODM1OTk4XSAtLS0tLS0tLS0tLS1b
IGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0NCj4gDQo+IHJldmVydGluZw0KPiBiN2JiYWZmOGMxYmMg
KCJncGlvOiBvbWFwOiBzYXZlIHR3byBsaW5lcyBieSB1c2luZyBkZXZtX2Nsa19nZXRfcHJlcGFy
ZWQoKSIpDQo+IA0KPiBmaXhlcyB0aGUgYm9vdCBmb3IgbWUuDQo+IA0KPiANCj4gPiDCoMKgIGRy
aXZlcnMvZ3Bpby9ncGlvLW9tYXAuYyB8IDQgKy0tLQ0KPiA+IMKgwqAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwaW8vZ3Bpby1vbWFwLmMgYi9kcml2ZXJzL2dwaW8vZ3Bpby1vbWFwLmMNCj4gPiBp
bmRleCA1NGM0YmZkY2NmNTY4Li41N2QyOTlkNWQwYjE2IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZl
cnMvZ3Bpby9ncGlvLW9tYXAuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3Bpby9ncGlvLW9tYXAuYw0K
PiA+IEBAIC0xNDQ5LDEzICsxNDQ5LDExIEBAIHN0YXRpYyBpbnQgb21hcF9ncGlvX3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gwqDCoMKgCX0NCj4gPiDCoMKgIA0KPiA+
IMKgwqDCoAlpZiAoYmFuay0+ZGJja19mbGFnKSB7DQo+ID4gLQkJYmFuay0+ZGJjayA9IGRldm1f
Y2xrX2dldChkZXYsICJkYmNsayIpOw0KPiA+ICsJCWJhbmstPmRiY2sgPSBkZXZtX2Nsa19nZXRf
cHJlcGFyZWQoZGV2LCAiZGJjbGsiKTsNCj4gPiDCoMKgwqAJCWlmIChJU19FUlIoYmFuay0+ZGJj
aykpIHsNCj4gPiDCoMKgwqAJCQlkZXZfZXJyKGRldiwNCj4gPiDCoMKgwqAJCQkJIkNvdWxkIG5v
dCBnZXQgZ3BpbyBkYmNrLiBEaXNhYmxlIGRlYm91bmNlXG4iKTsNCj4gPiDCoMKgwqAJCQliYW5r
LT5kYmNrX2ZsYWcgPSBmYWxzZTsNCj4gPiAtCQl9IGVsc2Ugew0KPiA+IC0JCQljbGtfcHJlcGFy
ZShiYW5rLT5kYmNrKTsNCj4gPiDCoMKgwqAJCX0NCj4gPiDCoMKgwqAJfQ0KPiA+IMKgwqAgDQo+
IA0KPiBJIGNhbiBvbmx5IHNwb3QgYSBtaW5vciBmdW5jdGlvbmFsIGNoYW5nZS4gVGhlIGNvZGUg
cHJpb3IgdGhpcyBjb21taXQgDQo+IGRvZXMgbm90IGNoZWNrIHRoZSByZXN1bHQgb2YgY2xrX3By
ZXBhcmUoKSwgYW5kIGRvZXMgbmVpdGhlciBzZXQgDQo+IGJhbmstPmRiY2tfZmxhZyA9IGZhbHNl
OyBub3IgY2FsbCBjbGtfcHV0KCk7DQo+IA0KPiBPdGhlciB0aGFuIHRoYXQsIHRpbWluZyBpcyBs
aWtlbHkgdG8gYmUgY2hhbmdlZC4gTm90IHN1cmUgd2hhdCBpcyB0aGUgDQo+IHRoaW5nIGhlcmUu
DQoNClRoZSBuZXcgY29kZSBsb29rcyBtb3JlIGNvcnJlY3QsIHdpdGggdGhlIHJldHVybiBjb2Rl
IGNoZWNrIGZyb20gY2xrX3ByZXBhcmUoKS4NCkNvdWxkIGl0IGJlIHRoYXQgdHdvIHByb2JsZW1z
IGVsaW1pbmF0ZWQgdGhlbXNlbHZlcyBpbiB5b3VyIGNhc2UgYmVmb3JlPyA7LSkNCldvdWxkIGl0
IGJlIHBvc3NpYmxlIGZvciB5b3UgdG8gcHJvdmlkZSB0aGUgbG9ncyB3aXRoICJpbml0Y2FsbF9k
ZWJ1ZyIgd2l0aA0KYW5kIHdpdGhvdXQgdGhlIHBhdGNoIGluIHF1ZXN0aW9uPw0KDQotLSANCkFs
ZXhhbmRlciBTdmVyZGxpbg0KU2llbWVucyBBRw0Kd3d3LnNpZW1lbnMuY29tDQo=

