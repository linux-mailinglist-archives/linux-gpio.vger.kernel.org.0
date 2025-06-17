Return-Path: <linux-gpio+bounces-21678-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEE7ADBF6D
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 05:02:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55B593B77D4
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 03:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8F1622AE7A;
	Tue, 17 Jun 2025 03:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AQrfX77s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012020.outbound.protection.outlook.com [52.101.71.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF01218A6AE;
	Tue, 17 Jun 2025 03:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750129353; cv=fail; b=eGCNrjhAUbact6PPb91PQU80cTlEjWMkppNP8+oDT0NZZdU377OU2JFB4jiaXS9Iz8fBCGeQE1CwfYXlkmpy+TZg7FeMXrO3CBwU8znxhs9z17FyRkmITWqcxTptdq7jMiNNgaHq+E//zChjnyj3B/TFp9DqDNnFBOaziTRf/2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750129353; c=relaxed/simple;
	bh=GT8ehacHPIqK3j+wqNPhGe1ZnohdhhP8kJq0VwoF+wo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rBfgbUMcIVqPwIpbn+9GTO8nq25JeD//6CpDO843+t7tjyHO5BbLmy+/D5zfAEZrvZSl78OR15dLTQMj4kvrJcWgcgqDJcmINyP3GpcNPEKOAzGoDhSQH3GqVtaf6Fy3KwwGyeSNyloVP1v9foXGX3ATDqBQvN81r5RfZsTgcUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AQrfX77s; arc=fail smtp.client-ip=52.101.71.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TQnNsGciJY4RpTHt3B+Bt9++lv/WNKn5TI9mdUWgMhmFmRdp8wzTvp5zYzUfhXBqmDT9bDLUd6BRdQxddWnZ24FO+WP6IVx7mAxh4sJsv1qERudd9Y9qNc6hyb1W+0XgIGq/OU0mtV79qfnBMJ8vT/zxEGiSrM1o4RrhDQYKP3xDQ8fClEPgA39WJ3xt4AIbNB3GWhvBdnzrxlFgpGuc3WWZTzmUlRjnEzJ0jsfS6iRCeedT4PBCK4Mov3t6Psgmj0B8yeS5kTXBBQwop4aeI5NboVtbEAXcAIA1MgaEE1pI0dVchNCqBNOKkbebQf369XvXfHWNVLNgdkDzVeJJPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GT8ehacHPIqK3j+wqNPhGe1ZnohdhhP8kJq0VwoF+wo=;
 b=c0zjGfFRUCVGmcsTg/wELxrddt/e2DaTFVQFEVFKfYTVZPrHPAYViejKUgGwGisXa/yStIwB2WIazk9cleUsg90vu9I4c0oynZUkJ9ei/W28rYsO75v3C6SkoS+vbsB5ytuKX3GfMHCd0Pu/Kh2FNO97KlevzxeXEi8Gb39L8EaWYT816f+cNRcHFwCPrS/DyEuEA4IyJxIKrOzah1FrQngNQSN5BQrPiGbSpNJX5G02xon0QKmoCq/gJlVBlTKZgVGjOsDTsiNzAOZBSxCyeyTPuwf0pRWCm88eIJSphn3sNInX0koUqko4/qB/gRzjvIO8iKG0Tk0Dv08gMzDdLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GT8ehacHPIqK3j+wqNPhGe1ZnohdhhP8kJq0VwoF+wo=;
 b=AQrfX77smefjVIgjm/Z+2tSczVj56NBKVnCs5sp4c32DeuabiuCZHz1MrE8CpX73XZQZze4mvd9eOspITl6x4x92hM7gHGzQak4bXbV0ZbjARhbcz2oLTqmuLwgUSbmM0k8VrawXJNKDeKKXjRKfWl91sOQjS9bmvBgXBpZexUdX2nAbBmD3EkyIOTqpNurXY0LLwVpr6z7hzQj5kSEQfJvgKpbGEibhoiZug3H7Eg17kTYV/AJXhzkdEvmocSorZRMMIwEf45f8PqMEvhBQOn4fKG3EotN59KULlJldJDIbqyXiEKiKVulMzBVt5yzxWU8Ks/ei9YdtwQxWXD4xlA==
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by PR3PR04MB7340.eurprd04.prod.outlook.com (2603:10a6:102:93::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 03:02:28 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334%3]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 03:02:28 +0000
From: Bough Chen <haibo.chen@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Stefan Agner
	<stefan@agner.ch>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>, "wahrenst@gmx.net"
	<wahrenst@gmx.net>, "conor@kernel.org" <conor@kernel.org>, Frank Li
	<frank.li@nxp.com>
Subject: RE: [PATCH v3 2/3] ARM: dts: add ngpios for vf610 compatible gpio
 controllers
Thread-Topic: [PATCH v3 2/3] ARM: dts: add ngpios for vf610 compatible gpio
 controllers
Thread-Index: AQHbyTmPXN6lWx3ma0ucOlyNfYHW1bQG1ZLQ
Date: Tue, 17 Jun 2025 03:02:27 +0000
Message-ID:
 <DU0PR04MB9496215BE9F775745E082CB19073A@DU0PR04MB9496.eurprd04.prod.outlook.com>
References: <20250520-gpio-dts-v3-0-04771c6cf325@nxp.com>
 <20250520-gpio-dts-v3-2-04771c6cf325@nxp.com>
In-Reply-To: <20250520-gpio-dts-v3-2-04771c6cf325@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9496:EE_|PR3PR04MB7340:EE_
x-ms-office365-filtering-correlation-id: af5a2975-8394-4f7a-73b2-08ddad4b64ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TG50eXJBSzJmUW81RmNTcEdlUlJCSy9aWC82NnQyVWNyOGl2N2w1SXo3MndF?=
 =?utf-8?B?bnZuQkg5VW5nMnVEODNlOXNIeEFOdHhta1Q0cWwvcG96NXZuY21VVGlrQUlW?=
 =?utf-8?B?R082aCtNYkYxVCtpcTh1QjRGWmZMdnFsUk5LNWFoQnliS3ZHZnlZVnJERmVM?=
 =?utf-8?B?Uy9kV1hYeTNmeFVRa1dPWGRYMllPN2s1cEpVTGE2R01YNm5pYit5WEU4L20w?=
 =?utf-8?B?WTdEWXc1UXduMWd1NXdXdU5wOWNkRWZDTU14bVM1cCtCM0FNOWxSbXdEMEZQ?=
 =?utf-8?B?K0FCeFFCNUVjSVZSNE5DRjQ1VWl2VWt5UW1EanlXL1ZRbEF5b0pCWmQwTzdJ?=
 =?utf-8?B?QmxRNmV4eVhMYXJVL2JPMkxOQS9NVVB0c0dUeFJIYjVWWkNhRFpHZFl1R2Vr?=
 =?utf-8?B?NThWS3BLQ3YxelVjOFNhUnlwQWY0amxJOUNXNmF4UXU1QXFPazNRanhsazF0?=
 =?utf-8?B?SUxVZVFKV1dLSjV2SVFGWEJubkwzaW1uUFRXMXlRalV4NS9HREtibDMwOHRT?=
 =?utf-8?B?VWYybkhPNW5uM0NEbk1jRC9Hd2Q1RkV4TTBJYUVUVlJ0M3gxWWl6SjB0NXhO?=
 =?utf-8?B?TFZwTmNCa2hlTEtyWEEzVmV2cUZzVk1TYWx6NHFmOTRmQmMwcEtHaDFlK0Rq?=
 =?utf-8?B?LzBYaXFMRGFvTUxjbUZ2blAvYlkzb2xVcWV3R3BMaWdFNXJidW91QlZHRnIv?=
 =?utf-8?B?UTlIZDlFampScy9XOE5rcUJuc0MraExqVlNUcVBCdERUUEl1RGZ2MUJHOU5l?=
 =?utf-8?B?SnhHcG4wbjRpZktVUDFzbWMyRDZnQzRsbG85Zi9NRDByeWYwMkdobVRZVEJj?=
 =?utf-8?B?WStpQ01zdGRidlpjcytsUnJQanByZG01YlkxV3ZKZzEyaDRzUWNNKytTMC9H?=
 =?utf-8?B?Z0lKMEY3TE15MXZOV1FHY3dkMU9VMHkyMjVRZUdab0hJdEIvRlFPNzg3K1JZ?=
 =?utf-8?B?QzBFR0l6ZE4wUGlkVUYzdlB4RCttS1crTWJMNDBsNUhiVVJXTmtBSnhxbjFk?=
 =?utf-8?B?TEE0ZC8yWDlUbnNZTkpTTFhqcEQydEJGeFpRbllMSy9wY3BxTURRTUZ1eDU1?=
 =?utf-8?B?OHBGUHkwQkZwU1J5ME1FOG1SUE90bDBUZWNxMUl6VVdXNXB5RmROc1NuR2Zy?=
 =?utf-8?B?aFRqMWRtRFdLeUtyUE5sOUpSeDBRYzNiMEVRZnhMNzdzRTRKMitDTTlnWkZD?=
 =?utf-8?B?WWFzVGFUUTlJaEwwcjJUUWZVaUtRVHo4VWV0V1ZrQnB4RGV0NVpndExuQWR0?=
 =?utf-8?B?L1gvV1pPZjhDK2RXdEZCWDVHNjIwQW8vUHZ3QkJ4THlkejhkU2dpV3E5a21j?=
 =?utf-8?B?YjBsaUhmRjIzbFZKaGsvdmMxc3F4S0o4R3loWnJJcyt4RXQzbzNtb2hBcTBm?=
 =?utf-8?B?bmkrNjZpc0RHZEJ2UFJqbnRpT056SyszKzNocFV3UkFHT2o0anhJVVlONnRp?=
 =?utf-8?B?QVBWWTEwQUhIVzdkckxQUlA2TklGSW1hSkgwVWZZdnhYdlpKQ1lwdTRwdjhp?=
 =?utf-8?B?QXpwd0xkSHdlUUU2TkQwZDhCUnZLUnFzcWxGZkt1ckdEUVZMVmdPM2RaTlNj?=
 =?utf-8?B?Ump1eUdjQUNzWXpTV28vWkhCejlEaFF2anJhcHJya3dkeTc0cU8wTmw0WnI0?=
 =?utf-8?B?Tnk4Ukt4NElNeXF4QStzQU9JWnVnQjhSZHdiYUdPdlZCbUhnTDFLQzIrUEZV?=
 =?utf-8?B?b2tYU1pDeitHUjNvYjQ2bW1DaEE0b0EwS0c1UjZac0JnazYvNFNEU1RLYVJB?=
 =?utf-8?B?Y2hKQzJsL0pkbmRaQ3VqS2ltZ0J6ZktDd3Uvd25SLzkzYXljK3pTWWxWZGhx?=
 =?utf-8?B?NXdVSTRHQnM2cFhQaEQvSy9SY3JtWGhyQ2ZHZ1hOUVRVMjNPY2lHN2dOM01s?=
 =?utf-8?B?Mmg1RnlvQzMxVUZRdlIyb29URHhFbm50Qkl5NnhzZllmamhUbWg1UzhLaXlE?=
 =?utf-8?B?eVo1Q25lNVEwSXZzOU9wK1JyVEM4MUdqUzl3NE9lNk5YdGl5MjdkcG4zRlRt?=
 =?utf-8?Q?/7BJ28PiLYRantpJ994o5ptXZ0xJog=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QnVxb2E5djZ1azlzNHljaUdHcUxLR2RRWFlINkNyKzh5VkpsbVptMkxseHlM?=
 =?utf-8?B?MU5mZlFWRlQvUjBvUjk1a1lXL1VLdXBkL01UNDl1SldsWFBtRmpSNmRMaUpa?=
 =?utf-8?B?akkvMHRDaGZPL0xJbzNpQ3VtRVVuMllPbEZNQkNrTFlURmVhZ2k5WUxJYkph?=
 =?utf-8?B?MFdZZU5QNGFFYk15VWhGRWhXK2VXeG1LUG9qZ2hqSllJQi83QkdhQm12NUlv?=
 =?utf-8?B?VUZzUzlnZFRsai83NGk4QnBQTk10V0wvRTBRZG5wOHZSRDRZMmViUEgrS0hY?=
 =?utf-8?B?NW84VzVkRG9zT05KYTdHZzdyd1k2YWR2c3g0QTh0YXBhMUpPZVgxdjlTQ0FX?=
 =?utf-8?B?UlhLc0dpc2ZJc3BEdEpLK1YwNEE1Tk1iNlJHQ1laS1l6MmlRT2NuY1hhS0VK?=
 =?utf-8?B?NTlLUHQ0d3NxMG90b05sUnhObStUaWZPWElBemJ0SUVuSldTaXVKaE9XQTEz?=
 =?utf-8?B?by9rNVhXMktBdEg3aGFLb1J4TXZGaktTdHNJWkNqaVpOOFhWbWZGRmo2SmtK?=
 =?utf-8?B?dFluM0wrRXF3aGw3WHh3eFU0SFNSOTdJRzhxU3BRU0Y2b1NxVWVJTTdOdTJr?=
 =?utf-8?B?OVlFYW9lN0pSZnZkU3BFK3Vkb20zdjRPbUZEMzlsSGFjT0t2VWhvM2M4ZlpU?=
 =?utf-8?B?dXR1YzVhcnZHLzBDcnhFQm11TmdpRG5ML0pJQ2dmbGZ0Mlk1M3JyTWVVTUlQ?=
 =?utf-8?B?Zk5uU3pUeXBCOVpqd0I2L25vVy9QMi84U3JlL0tyV0FqQzN6RE1BNCtPS0dE?=
 =?utf-8?B?QVYvQnptR0J4R2JaK1ltc3hxNldKVFJYWFc0WWVvaVdqWWVja1pTOStpVXh5?=
 =?utf-8?B?dzdlNzlqRm1KZ2F1WnlvVW10c2E1cTJLWWQxbUVOcUJZQnZNS1hVaDdlRU81?=
 =?utf-8?B?NWZGWUx1bTd1TUp2V0NnVzAzUEZoTFRYbThXSXdNdHFsZThXZ3d0ZnNKYXFM?=
 =?utf-8?B?YVJnWXFpOVNGUnhoU2s2Zyt4c1I4OTh4aW91QlZzQzFCRGFMbFBsYVowdDBt?=
 =?utf-8?B?MU9UemcxZy9UNTIwOW5jeklGL0h4WWg4eXlKTzhRMzdXODk0NVBKRktxQUtq?=
 =?utf-8?B?aUE0dUt1Q1FVYlNISTMrVzhndVJub2RwQXdndnF2dUxuSFpyeDNtTlZYL2V6?=
 =?utf-8?B?ZEVIYlJraUlCRXE4bVVsK2htUStZOEgxeEVuZGpTc2lmVitqekN2S2hWMnFQ?=
 =?utf-8?B?NHYxZUhwdGduMm1UdTRSaG54ODRRUEVWVlNWSW9HbDhhUzhYTlBTdTh4cFJF?=
 =?utf-8?B?TWNCQ1VtZXpHSk1VdC8xNjFyZTMyenlRbXRMNE9BNnd4TVhkb0Irb1N4YUw1?=
 =?utf-8?B?bG1yU2pTb1B1d0JVbVVya09Vc2VkMm9BTU1XL29QTmdaQ0VPdEpNdDAxZ09n?=
 =?utf-8?B?WTgzK3F1em9IY1B3QUQ0cDJ2OURNUnhEMmpaS0ZhTUFUUGUyQmsyL2hyVlIx?=
 =?utf-8?B?azlFbXI5V0FMa0I4d3RYRzNNMkRteVg1b3huQmo3U3JxT2VjNksweTk4bGcr?=
 =?utf-8?B?SDY2Uy9LVUw3MkRMcDFUVVdkWlJUeHFBRWFZRXYwazlqM0lOZGN3M29rbGpq?=
 =?utf-8?B?bG9TVHJKOUduMkpQN0FyQjRwN2lxNnBTcnc3bE14N2RyeUpYalRqOWp0NzQ4?=
 =?utf-8?B?UmIzYXJabVllVTdVM3hFcEFHcWl1ZGFOenNOeG5rU2pWNlZ6RG5VQzVNaytM?=
 =?utf-8?B?TWo2bG5ZR1RJZ3JqU3pReTd3VDltTzB2MXNyUTljWlVUdWhOSmZyQ2kxSjBL?=
 =?utf-8?B?ZlNTMm1ZcXJlbk9jbzJPbDF6VXFmOXArOHhCbDF4OE85MHZWeXhNUkhobHhk?=
 =?utf-8?B?WXBPdUkwMUlMbEk1akhJaThDclZFZmJ0bE0vU2YzRjQxQ1FrajVoREs5Qlds?=
 =?utf-8?B?aktIbmRSak1uT01vUnVBclJyZ2JJamFSWGhuUGZIT2hHcDJaMW5ZUHFVdGYy?=
 =?utf-8?B?dEtxVWJhRCt4dmJHa1c0cU1CTWMycjIyRS9TVkRqV0dDejl5MjhoQTJuOXFB?=
 =?utf-8?B?d1dBV1FXM2JSTmNDSXN0MU56TndmSWJkdzdSSStCZ2FzR3FwYmcvRzB6bEJ2?=
 =?utf-8?B?ejF5NWt3RlMvSVFXRzZBdkZ4eHRHTlE3azVQZ3I4ZnQwb3ZEWm1XWUUwS1dh?=
 =?utf-8?Q?hT2c=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af5a2975-8394-4f7a-73b2-08ddad4b64ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2025 03:02:27.9142
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cP9uDB+Z/EhOurtGuVON2Pu92hyOY9mHktXhsMBLdPUHnRYXLl+smcATsKy1X2qqC9l95z4rdvyKVkYSDv2Ctw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7340

R2VudGxlIHBpbmcuLi4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBC
b3VnaCBDaGVuIDxoYWliby5jaGVuQG54cC5jb20+DQo+IFNlbnQ6IDIwMjXlubQ15pyIMjDml6Ug
MTE6NDYNCj4gVG86IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YgS296
bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+Ow0KPiBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtl
cm5lbC5vcmc+OyBTaGF3biBHdW8gPHNoYXduZ3VvQGtlcm5lbC5vcmc+Ow0KPiBTYXNjaGEgSGF1
ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+OyBQZW5ndXRyb25peCBLZXJuZWwgVGVhbQ0KPiA8
a2VybmVsQHBlbmd1dHJvbml4LmRlPjsgRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29t
PjsgU3RlZmFuDQo+IEFnbmVyIDxzdGVmYW5AYWduZXIuY2g+OyBMaW51cyBXYWxsZWlqIDxsaW51
cy53YWxsZWlqQGxpbmFyby5vcmc+OyBCYXJ0b3N6DQo+IEdvbGFzemV3c2tpIDxicmdsQGJnZGV2
LnBsPg0KPiBDYzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGlteEBsaXN0cy5saW51eC5k
ZXY7DQo+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc7IEJvdWdoIENo
ZW4gPGhhaWJvLmNoZW5AbnhwLmNvbT47IFBlbmcgRmFuDQo+IDxwZW5nLmZhbkBueHAuY29tPjsg
d2FocmVuc3RAZ214Lm5ldDsgY29ub3JAa2VybmVsLm9yZzsgRnJhbmsgTGkNCj4gPGZyYW5rLmxp
QG54cC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCB2MyAyLzNdIEFSTTogZHRzOiBhZGQgbmdwaW9z
IGZvciB2ZjYxMCBjb21wYXRpYmxlIGdwaW8NCj4gY29udHJvbGxlcnMNCj4gDQo+IEFmdGVyIGNv
bW1pdCBkYTVkZDMxZWZkMjQgKCJncGlvOiB2ZjYxMDogU3dpdGNoIHRvIGdwaW8tbW1pbyIpLCB0
aGUgdmY2MTANCj4gR1BJTyBkcml2ZXIgbm8gbG9uZ2VyIHVzZXMgdGhlIHN0YXRpYyBudW1iZXIg
MzIgZm9yDQo+IGdjLT5uZ3Bpby4gVGhpcyBhbGxvd3MgdXNlcnMgdG8gY29uZmlndXJlIHRoZSBu
dW1iZXIgb2YgR1BJT3MNCj4gcGVyIHBvcnQuDQo+IA0KPiBBbmQgc29tZSBncGlvIGNvbnRyb2xs
ZXJzIGRpZCBoYXZlIGxlc3MgcGFkcy4gU28gYWRkICduZ3Bpb3MnIGhlcmUsIHRoaXMgY2FuIHNh
dmUNCj4gc29tZSBtZW1vcnkgd2hlbiByZXF1ZXN0IGJpdG1hcCwgYW5kIGFsc28gc2hvdyB1c2Vy
IG1vcmUgYWNjdXJhdGUNCj4gaW5mb3JtYXRpb24gd2hlbiB1c2UgZ3BpbyB0b29scy4NCj4gDQo+
IFJldmlld2VkLWJ5OiBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4NCj4gU2lnbmVkLW9mZi1i
eTogSGFpYm8gQ2hlbiA8aGFpYm8uY2hlbkBueHAuY29tPg0KPiAtLS0NCj4gIGFyY2gvYXJtL2Jv
b3QvZHRzL254cC9pbXgvaW14N3VscC5kdHNpIHwgNCArKysrDQo+ICBhcmNoL2FybS9ib290L2R0
cy9ueHAvdmYvdmZ4eHguZHRzaSAgICB8IDUgKysrKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgOSBp
bnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvbnhwL2lt
eC9pbXg3dWxwLmR0c2kNCj4gYi9hcmNoL2FybS9ib290L2R0cy9ueHAvaW14L2lteDd1bHAuZHRz
aQ0KPiBpbmRleA0KPiAzYzZlZjdiZmJhNjA5ODZiNzk3YmIwMWI4NDM4MzBkMzY0Yzk2ZDQ1Li44
ODBiOWE0ZjMyYjA4NDZhNzczZGJmOWENCj4gZDMwNzE1Yzg0YWMyZmRhNiAxMDA2NDQNCj4gLS0t
IGEvYXJjaC9hcm0vYm9vdC9kdHMvbnhwL2lteC9pbXg3dWxwLmR0c2kNCj4gKysrIGIvYXJjaC9h
cm0vYm9vdC9kdHMvbnhwL2lteC9pbXg3dWxwLmR0c2kNCj4gQEAgLTM5OSw2ICszOTksNyBAQCBn
cGlvX3B0YzogZ3Bpb0A0MGFlMDAwMCB7DQo+ICAJCQkJIDwmcGNjMyBJTVg3VUxQX0NMS19QQ1RM
Qz47DQo+ICAJCQljbG9jay1uYW1lcyA9ICJncGlvIiwgInBvcnQiOw0KPiAgCQkJZ3Bpby1yYW5n
ZXMgPSA8JmlvbXV4YzEgMCAwIDIwPjsNCj4gKwkJCW5ncGlvcyA9IDwyMD47DQo+ICAJCX07DQo+
IA0KPiAgCQlncGlvX3B0ZDogZ3Bpb0A0MGFmMDAwMCB7DQo+IEBAIC00MTMsNiArNDE0LDcgQEAg
Z3Bpb19wdGQ6IGdwaW9ANDBhZjAwMDAgew0KPiAgCQkJCSA8JnBjYzMgSU1YN1VMUF9DTEtfUENU
TEQ+Ow0KPiAgCQkJY2xvY2stbmFtZXMgPSAiZ3BpbyIsICJwb3J0IjsNCj4gIAkJCWdwaW8tcmFu
Z2VzID0gPCZpb211eGMxIDAgMzIgMTI+Ow0KPiArCQkJbmdwaW9zID0gPDEyPjsNCj4gIAkJfTsN
Cj4gDQo+ICAJCWdwaW9fcHRlOiBncGlvQDQwYjAwMDAwIHsNCj4gQEAgLTQyNyw2ICs0MjksNyBA
QCBncGlvX3B0ZTogZ3Bpb0A0MGIwMDAwMCB7DQo+ICAJCQkJIDwmcGNjMyBJTVg3VUxQX0NMS19Q
Q1RMRT47DQo+ICAJCQljbG9jay1uYW1lcyA9ICJncGlvIiwgInBvcnQiOw0KPiAgCQkJZ3Bpby1y
YW5nZXMgPSA8JmlvbXV4YzEgMCA2NCAxNj47DQo+ICsJCQluZ3Bpb3MgPSA8MTY+Ow0KPiAgCQl9
Ow0KPiANCj4gIAkJZ3Bpb19wdGY6IGdwaW9ANDBiMTAwMDAgew0KPiBAQCAtNDQxLDYgKzQ0NCw3
IEBAIGdwaW9fcHRmOiBncGlvQDQwYjEwMDAwIHsNCj4gIAkJCQkgPCZwY2MzIElNWDdVTFBfQ0xL
X1BDVExGPjsNCj4gIAkJCWNsb2NrLW5hbWVzID0gImdwaW8iLCAicG9ydCI7DQo+ICAJCQlncGlv
LXJhbmdlcyA9IDwmaW9tdXhjMSAwIDk2IDIwPjsNCj4gKwkJCW5ncGlvcyA9IDwyMD47DQo+ICAJ
CX07DQo+ICAJfTsNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9ueHAvdmYv
dmZ4eHguZHRzaQ0KPiBiL2FyY2gvYXJtL2Jvb3QvZHRzL254cC92Zi92Znh4eC5kdHNpDQo+IGlu
ZGV4DQo+IDU5N2YyMGJlODJmMWVlMDQ0ZTE0YmZhZjNiZDA1Y2ZmMzdhOGFkMzkuLmEyNzU4MjFj
MzVkNDFlOTdlYjIxMzlhMDgNCj4gMWVmNTc2NWQwNzY3MmFhIDEwMDY0NA0KPiAtLS0gYS9hcmNo
L2FybS9ib290L2R0cy9ueHAvdmYvdmZ4eHguZHRzaQ0KPiArKysgYi9hcmNoL2FybS9ib290L2R0
cy9ueHAvdmYvdmZ4eHguZHRzaQ0KPiBAQCAtMzE4LDYgKzMxOCw3IEBAIGdwaW8wOiBncGlvQDQw
MDQ5MDAwIHsNCj4gIAkJCQlpbnRlcnJ1cHQtY29udHJvbGxlcjsNCj4gIAkJCQkjaW50ZXJydXB0
LWNlbGxzID0gPDI+Ow0KPiAgCQkJCWdwaW8tcmFuZ2VzID0gPCZpb211eGMgMCAwIDMyPjsNCj4g
KwkJCQluZ3Bpb3MgPSA8MzI+Ow0KPiAgCQkJfTsNCj4gDQo+ICAJCQlncGlvMTogZ3Bpb0A0MDA0
YTAwMCB7DQo+IEBAIC0zMjksNiArMzMwLDcgQEAgZ3BpbzE6IGdwaW9ANDAwNGEwMDAgew0KPiAg
CQkJCWludGVycnVwdC1jb250cm9sbGVyOw0KPiAgCQkJCSNpbnRlcnJ1cHQtY2VsbHMgPSA8Mj47
DQo+ICAJCQkJZ3Bpby1yYW5nZXMgPSA8JmlvbXV4YyAwIDMyIDMyPjsNCj4gKwkJCQluZ3Bpb3Mg
PSA8MzI+Ow0KPiAgCQkJfTsNCj4gDQo+ICAJCQlncGlvMjogZ3Bpb0A0MDA0YjAwMCB7DQo+IEBA
IC0zNDAsNiArMzQyLDcgQEAgZ3BpbzI6IGdwaW9ANDAwNGIwMDAgew0KPiAgCQkJCWludGVycnVw
dC1jb250cm9sbGVyOw0KPiAgCQkJCSNpbnRlcnJ1cHQtY2VsbHMgPSA8Mj47DQo+ICAJCQkJZ3Bp
by1yYW5nZXMgPSA8JmlvbXV4YyAwIDY0IDMyPjsNCj4gKwkJCQluZ3Bpb3MgPSA8MzI+Ow0KPiAg
CQkJfTsNCj4gDQo+ICAJCQlncGlvMzogZ3Bpb0A0MDA0YzAwMCB7DQo+IEBAIC0zNTEsNiArMzU0
LDcgQEAgZ3BpbzM6IGdwaW9ANDAwNGMwMDAgew0KPiAgCQkJCWludGVycnVwdC1jb250cm9sbGVy
Ow0KPiAgCQkJCSNpbnRlcnJ1cHQtY2VsbHMgPSA8Mj47DQo+ICAJCQkJZ3Bpby1yYW5nZXMgPSA8
JmlvbXV4YyAwIDk2IDMyPjsNCj4gKwkJCQluZ3Bpb3MgPSA8MzI+Ow0KPiAgCQkJfTsNCj4gDQo+
ICAJCQlncGlvNDogZ3Bpb0A0MDA0ZDAwMCB7DQo+IEBAIC0zNjIsNiArMzY2LDcgQEAgZ3BpbzQ6
IGdwaW9ANDAwNGQwMDAgew0KPiAgCQkJCWludGVycnVwdC1jb250cm9sbGVyOw0KPiAgCQkJCSNp
bnRlcnJ1cHQtY2VsbHMgPSA8Mj47DQo+ICAJCQkJZ3Bpby1yYW5nZXMgPSA8JmlvbXV4YyAwIDEy
OCA3PjsNCj4gKwkJCQluZ3Bpb3MgPSA8Nz47DQo+ICAJCQl9Ow0KPiANCj4gIAkJCWFuYXRvcDog
YW5hdG9wQDQwMDUwMDAwIHsNCj4gDQo+IC0tDQo+IDIuMzQuMQ0KDQo=

