Return-Path: <linux-gpio+bounces-20312-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8549AABCC7C
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 03:55:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 447E67AF89E
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 01:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7637255227;
	Tue, 20 May 2025 01:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HTAldZwC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2054.outbound.protection.outlook.com [40.107.21.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046F31D8E1A;
	Tue, 20 May 2025 01:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747706100; cv=fail; b=sba4OgN1piXfh8OziYsYGleYvB+XBD+eRUkQJY8mr0FYOBVNArYE2tnlTgJ4y60wagBUkkuFmO6Cabb/x28WiNLSJCFZpibmSaiGqFMCLOlEwIze4rfaW++LoI6/SkxqjRnwcjmRq+OX+5zr9Uj2mGtykJVl/V2//8iIlgmqzG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747706100; c=relaxed/simple;
	bh=jHU/2IIIymsxzv/RYUECo/R/P/APdWRlsqPrkqJuw0o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=S3bjI5hQRExqgt8dBbK2roj1FCHTMcupPx6AlDdbNVC3szHDj/Z8i4/YCDV8ySFrIUdlZo0wMwvzxS2VDUUc0qOFvS8LMID9XAXIrFhpYOyeqIZ5STaglRdoVRfsc7K2Qs1PnRGZTbg4MJsgoirxxEFWRnkLWsAM8BLaTKH4TkM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HTAldZwC; arc=fail smtp.client-ip=40.107.21.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJ3UD2cNEG2uxZBsTGh7jl0JoYlY2xLbFzHGhfa34yHMwRupsEgWBoGu/CpW/Byz19OwCTFriJ0kqvny31F8f39QbiyXvXcJMSU1ndjfa5yun5MDj+40YTp1/kS1fwsYrWj69dqwNzhIJcCHMGjKe29viQtMzE6p0jojM1ZccggUFE/pBOogMUAjxYHzt2tYBDtwpwcJ3RwtCsmB3/jwyWTw8ca13CkiG4BA0JpwD+r6En3OstugP7QaNus6UUxLy4H5hNDqmxaCBB3tKCrqFrSTNKwi9od1lzTKuexFzllZNq5b8UGF3VtNpaaGFOz8YJKowUSxkLx16IhMA/5TdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jHU/2IIIymsxzv/RYUECo/R/P/APdWRlsqPrkqJuw0o=;
 b=gIIZ6lGR0Bf8cNMwGXDgaAMxbkbG4InBP5GEzvChEabQSc2536h6QB31dg9QgffnZEFQUqcAJow51AlxL8cJDs8UHJ1BuM+pVu/4wdxT+ZOcKDluT4QoRArLcGm3Mogcq/+5msyXiTK0rMnDMVhvYm39AHERWDwKJTEvcPrbXnCCPsoq3uiZlCx9KXDjHe+fTbsrV9Ier2+GB/Q95L9PcSaHyBV7N6jOnmxk8bVLvH7hqW/SWEMZXLdujNtq98KID6L1LmfrY/FptgVccjXxn+lzSbehWcRwt+ZflEAnBvq7dpbM6/EfQlSplzZmTtYs81jG0L16O5Igr+z3HzkldA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jHU/2IIIymsxzv/RYUECo/R/P/APdWRlsqPrkqJuw0o=;
 b=HTAldZwCyjE/gfkGe3k51W6Aqb6IeUAW8FiT0pgYJJIfJCI9PAGqULuMA+MOOly38/XNFcIqH3cc35FD9y0MZkyfDc+l61kQfoQd/ya0scv0wtfcpUpncSjmiT8iyBGEQCgfu8AUDceFIqNl2u3/qkOuoQ+sagvjDkUSX2YGZ1BYvHwzlfFulDEu+F8KsaibbYkrJr+i8yEDFz/oN1/FutCTFTd5xrwD5y6gGxlsJd5NKDPhcWz4k8XsTZuN2Cp+JC17gRKsSJgiVuiU1SRnoIbWDWgkim2OWqVXrO2vN/X0OIsldYMoFphtZ8nz7td19TY0ketrvvqnNOq6OAah3Q==
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by PA4PR04MB9487.eurprd04.prod.outlook.com (2603:10a6:102:27c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Tue, 20 May
 2025 01:54:53 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334%4]) with mapi id 15.20.8722.031; Tue, 20 May 2025
 01:54:53 +0000
From: Bough Chen <haibo.chen@nxp.com>
To: Stefan Wahren <wahrenst@gmx.net>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Rob Herring <robh@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>, Linus
 Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] dt-bindings: gpio: vf610: add ngpios and
 gpio-reserved-ranges
Thread-Topic: [PATCH v2 2/2] dt-bindings: gpio: vf610: add ngpios and
 gpio-reserved-ranges
Thread-Index: AQHbyIOJtotboVfnW0K2Klb8iuZMaLPaBXkAgAC9pQA=
Date: Tue, 20 May 2025 01:54:53 +0000
Message-ID:
 <DU0PR04MB949675A358EB06A6C9A4FE1D909FA@DU0PR04MB9496.eurprd04.prod.outlook.com>
References: <20250519-gpio-dts-v2-0-b9e77173e9c5@nxp.com>
 <20250519-gpio-dts-v2-2-b9e77173e9c5@nxp.com>
 <bba21f5c-9644-4563-976a-a4cfdaf2546c@gmx.net>
In-Reply-To: <bba21f5c-9644-4563-976a-a4cfdaf2546c@gmx.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9496:EE_|PA4PR04MB9487:EE_
x-ms-office365-filtering-correlation-id: 6f3b1b00-789e-4bb7-1afe-08dd97415062
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?RDZLMklTQnM0eGtTUjNvZzIwVnNpMmJkN0k2TjBrbldWQ2JibW9uVHJ0WXVB?=
 =?utf-8?B?UUhBSTAxY2hzbFp1QSsrOTEyTUkxQXBTbWtxcnZFMTZ0NVRXcm5Vd2JxK250?=
 =?utf-8?B?a1M5cWtNTC9lQUhXVStvM1FCM1QycEh5dXNRZVB5ZGpiZ2hEeS96RU56dmFE?=
 =?utf-8?B?RHVaKzdrV2xjWVR0MWNBTmZzWU5CdGcvY2lKM2UrMGtGSGFGaDUxbWtyZnBy?=
 =?utf-8?B?K0VDWGlqTm5wR0ZZNVRLVnRXOWtMQ2JnUXA0b3JBZTc3bVc0a0lOTCt2c2Z3?=
 =?utf-8?B?QUtFTGtTVHV6ZlJQckdOclVmWWUvL2hxU24rQ0sxNnZGeVhhdW5PK1lMajVG?=
 =?utf-8?B?RDJZcW9EMGttOFBBSG9zRGZrY3dTelI3L0xLUDdaL1I2QVhxTzRrUWN1SUlO?=
 =?utf-8?B?YmxDYkEyMjZJSlgwQnBhTkRjdnVtaEZzOFRlcW9SZEpkMUZsMkduWVF3ZlRm?=
 =?utf-8?B?REhyb1FOc0F0K25mTEhvK1N0ejJTL3daZHE2clRtbkVzTzZHd0gvTXUyZ2VF?=
 =?utf-8?B?bHJvRWprOFlFM3B5RHE4TkhDWTRjNURidGFJUlQ1UFBpU1ZsbW1UZkZlcUhw?=
 =?utf-8?B?TXpNQUhSSXRXVzdxYjdwQmJBOUY1VjQxNTlCSmRwNzl6U3lPaDNDeWRqR09U?=
 =?utf-8?B?MU5ObnBVbVE2b3hEcTlEbXhsK2J2NWxtc282cG52Q2pWQmNZNHA1VndvcU5N?=
 =?utf-8?B?aDBtMUVnR1VGeG9tNk5PNGtuU3JteVZHVEFTUDVCTE9JNWYzQy82azRnOXlP?=
 =?utf-8?B?TTVVVHpJRExlQ1F4MU1aeHdpSm9aSWxrOFRLUzJTSWJUVHVNZGh5YVdVRWVw?=
 =?utf-8?B?eUFDZzNJT3RTcUFEVzN3dTBsZWtONlBPcG1sWkdVOFgyRmxqOHRFSnltQVhq?=
 =?utf-8?B?eUFHOUpMaFNrWWxZVFhQQVY5UXRzazQ3NFJjOURVR0d4N1lmNmZjU3h4WmpO?=
 =?utf-8?B?bzBSVGsyM1ZKYkJQNGxlNDgwZWFNUytUUUJLc0grMUdibW8yakMwaGVJUVIw?=
 =?utf-8?B?dkswRWdLc3liWXZNamxRWlpjVlJhUmlybk94ZEFERHgvbEVkVXRGb2lXMmd6?=
 =?utf-8?B?UzhqaVAwbXFPNTlHWE9oOTdLRXl3eC9NQU5uUDBWVnJZTjROYk5odm9lSzZQ?=
 =?utf-8?B?R1dmeW9RbUVyRHBKbEJVT24rYWhuL1V6UUZOaWhMeUhReDJMT01ZZ1VTcDk1?=
 =?utf-8?B?Z1FNa2lUa0ZBUlhReEtlSnpoUW5JeEdEU1RmM1FWMC9wcVpQQkRRVVZlZjd1?=
 =?utf-8?B?emRoQm9kVzl3TmQxbDYzWkRlRXBZQjdTM3ZvVXJnR2RMZ05zTXp2UTNxMGRN?=
 =?utf-8?B?OXNmVkxMd2RPMFJ5TDR5WU8rb3UzMUxKQ1ZXandMUXdvWkhnaGpvY1ZRd1Y5?=
 =?utf-8?B?UXltSER2TjFFaDArbHBvZktCVVo5cllxYlN3bWNvTDVZSFdRQXpaY2J2Y1Ev?=
 =?utf-8?B?eXpDSDJUeEE3QTFpVDlwN3E2NXJ4Nm1SME4xbjVycnVwRzVOTWRSTzVZTWg4?=
 =?utf-8?B?eEJyT1I3QWNmcWxGVVR4MTI0MHN3S3oyMFZQQThsZlpXV2pUYVVFcVpCNVJU?=
 =?utf-8?B?emRncWhQVjZEM0owQ2c1TUxXWTMwUjN4dzdiWmpIM1pITEI2R0dhSzRTZmNh?=
 =?utf-8?B?RlpxVTlVZzYyYUxaUlFjS1AwWjYzR0dGSFpocGh3bzd0enJkKzFLNjNMS1hJ?=
 =?utf-8?B?ditTQ1k5bkZhY3NVVGN5cm0rT05pNS9Zano3cC9BNEUrQTltRWVCYk5JdnZZ?=
 =?utf-8?B?dlhyUE9WZEsxR0lnWnNlMVQ5V0xXQkk5UkRXS3RNSEY2NFFCaSsveGdoMEEy?=
 =?utf-8?B?b01PZUZPc3Vna2RyakoyRlBKSXRwS1J2cHVjS3kxbUpuYlZHejdvNVBTOEtv?=
 =?utf-8?B?amxsWWsvRDlnR0FuSFNmb0dMWXlqOTVmUDQzdXhWVFFralQxZDUyYnU2OHZR?=
 =?utf-8?B?blF0bFJ1bmlHdHh2QXdjNGdwbHBUVFE1VXJFVzQ5dVhjaXhrWDloTWZDLzFK?=
 =?utf-8?Q?KjlCgzCsXVp3qBCA6SOk+XRnzBNmZE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a1lmY2lvSXVJN1BWa1JtQVVaTFduMHBiTEZVVzh1UVZVVWJKTkxzNzNwRHNi?=
 =?utf-8?B?NTNwZ1puZk8ybGc3YXRUZ1llSHdZbmc5eWhqMTR6bWFLU1JxTlFKdWw0MU1M?=
 =?utf-8?B?c3F0T1FoU245UDhmWnlRUE52YndlVWVwSlZtdVhXT3o5WUxwcVg3MWc2a096?=
 =?utf-8?B?V2ZFZUNCZVl4Rkd4akYyYXRXcnBtQTR0N0tTL1AxTlBnYTBYYUFiUXl4VHVE?=
 =?utf-8?B?U2pQVnFRbFBNQzlrc1hzc2xkd1N6UERDcG5kM2VFVWZlWk83M0RaZ1dPM1Iz?=
 =?utf-8?B?RS9zOGVOQzBUa2N6ZGpGVGk3c215RlQ5Q2phYmdMVHlpamV5N2FnaDhvdkNE?=
 =?utf-8?B?a1pza2I5eUxDaTVNWEZRYXN0SjdrazhsSlBONlRMMGpTTzlJK0crMHVjV0R2?=
 =?utf-8?B?R3dzN2ZqQVE2eDViTzlNMjNCMVlEaUpNZXZUM0xHWWxqSEc1YU5SRTZEN285?=
 =?utf-8?B?S2FWTkkxV1BPSXRaVGJObnBDVC8zYTMvdDZVQmZPdXVhdHZNTElxaTZ5enZx?=
 =?utf-8?B?MkttcjNtZTAveTdrL0hVRVBITCtqOXVIaFkySC9TMjk1QUdDdEhNcEtaamFT?=
 =?utf-8?B?ajR6ZklJUDhYRXBMWnZ2TFhpUmNEcCtGaFozTlcwdkVad2F4WWloM0ZpV0po?=
 =?utf-8?B?T3hlY3VNU3FONFBEN2Mwd2hTRS9obVltdm9MWHVtVnFtaXdsQjVkMWlwZStZ?=
 =?utf-8?B?SFIvVUNOMlMySXFMbmFiNkhjblh1T2xSeCtpK2kwM2Y3MjVhRzBIWkpCTHBV?=
 =?utf-8?B?UTBDMjRSSWhhR2FBMTZWRVByZlRza25IWEpZeGd5bXoxOWtkK005RmhpREwv?=
 =?utf-8?B?eWhkMjhFLzhCZVB5cko0VENYejdiMm93WURTd1dVaDk4RHIwUW9QczlIb1Nw?=
 =?utf-8?B?Wkk4SGlIQS9MZ2QyYTJDcWpudHVwZ2NkNGc3TS9scW15N09JNXUwRzhIYi9I?=
 =?utf-8?B?NThITEVWb1JoY040cTFKVDlIWGorTUVCNzh3SWFUb25YY2FlVEtjQWh0bDN5?=
 =?utf-8?B?OUZSbWJMeHNqZldiWStJOSs4ZDZkd0FSM1JpRXZzYzkwOWdYblhibEZkanRv?=
 =?utf-8?B?bzN2akM4T1psN3FMZ2lwWmZSc2ExSi9yK2dhdlRCd3ZBc1RMN3JTVjE3dFRo?=
 =?utf-8?B?M01UUFlSTzVTR1JrZmtCTnR3M3ZDSlB0ekxiYkJ5TnpEWXhjKytqUjFzYTNJ?=
 =?utf-8?B?eHpVUzRQRm83MzV0blVuVzBISTJNek8vS0owcDQ3N1owWHduVzlRWGw5QXRn?=
 =?utf-8?B?VUJwMllFalpMYW1nVXdvQmNjcDl1Wmh2aER4QUlJUlcrSzhSWFlLWlV0UW5N?=
 =?utf-8?B?OCt3ZlFlakR1UnpUeGY1bDhoUG1NMEhpVmdWdlg4dE5vaUducjhVSyt3WCtm?=
 =?utf-8?B?Ym9NS2x6VkpITUZub2gxcjNCSDcvSjZIUkxNRDl1c1ZpcnFaUi9XWU9nK2o3?=
 =?utf-8?B?UkFnQXBCL2MxbklRZ1V3ZzdPeHRydmtJUkNXU0JXWUJJa1NGZ2xZVlZ3Y1Fy?=
 =?utf-8?B?M095RGFaVVlaOStRQ0lDbk5iUGd1RkJjODFIYzNPYjhTVUl2RU1MSnVPZWl0?=
 =?utf-8?B?SnRiTEtaaCtzV3dibllpU0FoWm1JOWRpRXg4TTZrMTEvcVdVMVR4MzZzeWdi?=
 =?utf-8?B?MDVmcGw1QXJNcWozRCsrZUtqYy81T1MwYS8xWkNpQXEzS3dQTTZ0QmxvdGYz?=
 =?utf-8?B?LzlDK3VtYm5Kd2NpVTB1SVZZQ0UwV1hmZllheWJ4Nm5vQlJaUUUyempsUC9B?=
 =?utf-8?B?dWJSZmJlQ1BmNVJGcGczd2R1bnhmQUNSUUFDc1dFQVAza2JzRGN1N2hGZVNR?=
 =?utf-8?B?Wnk0SmxFbk04M0htU3NpTEM5ejRVem5mdFlkM2NkYzRpMmNKd3RHOVUwN1lG?=
 =?utf-8?B?aFlGNzdIK0FEaE12MTlvUVNtVE04VytqbzRqNjZnbmgwOHhyeTdDZnJwN0JX?=
 =?utf-8?B?bktiVVJpVW1EQ3l1OFJnb3krQmRLblQ4ZG1jU0F1cm1ralVKMUZWUko5VHhu?=
 =?utf-8?B?T3JVdkpyY2xZbTU4cmtEVlJtRmVjSTMwUFJ1RHZRc0Z1N0hwd3M1bzlQbjZ4?=
 =?utf-8?B?UWc2Uk45bTNlK0xKYitnYllMQkpKbW9icnBXbnd3VS83R1NWMkZIZ2hMM0o5?=
 =?utf-8?Q?lwvI=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f3b1b00-789e-4bb7-1afe-08dd97415062
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 01:54:53.3269
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5ibdXhsjgIBoJX9JEna4rx+W1RZCJRAeKkpYauaGPzQn5/el8aFj1lAt+bu+7lHkWTRjXG2WNZp0ySDhFEsAHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9487

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVmYW4gV2FocmVuIDx3YWhy
ZW5zdEBnbXgubmV0Pg0KPiBTZW50OiAyMDI15bm0NeaciDE55pelIDIyOjM1DQo+IFRvOiBCb3Vn
aCBDaGVuIDxoYWliby5jaGVuQG54cC5jb20+OyBLcnp5c3p0b2YgS296bG93c2tpDQo+IDxrcnpr
K2R0QGtlcm5lbC5vcmc+OyBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBTaGF3
biBHdW8NCj4gPHNoYXduZ3VvQGtlcm5lbC5vcmc+OyBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPjsgU2FzY2hhIEhhdWVyDQo+IDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPjsgUGVuZ3V0cm9u
aXggS2VybmVsIFRlYW0NCj4gPGtlcm5lbEBwZW5ndXRyb25peC5kZT47IEZhYmlvIEVzdGV2YW0g
PGZlc3RldmFtQGdtYWlsLmNvbT47IFN0ZWZhbg0KPiBBZ25lciA8c3RlZmFuQGFnbmVyLmNoPjsg
TGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPjsgQmFydG9zeg0KPiBHb2xh
c3pld3NraSA8YnJnbEBiZ2Rldi5wbD4NCj4gQ2M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3Jn
OyBpbXhAbGlzdHMubGludXguZGV2Ow0KPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVh
ZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWdwaW9Admdlci5r
ZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMi8yXSBkdC1iaW5kaW5nczogZ3Bp
bzogdmY2MTA6IGFkZCBuZ3Bpb3MgYW5kDQo+IGdwaW8tcmVzZXJ2ZWQtcmFuZ2VzDQo+IA0KPiBI
aSBIYWlibywNCj4gDQo+IEFtIDE5LjA1LjI1IHVtIDA4OjAzIHNjaHJpZWIgSGFpYm8gQ2hlbjoN
Cj4gPiBBZGQgb3B0aW9uYWwgbmdwaW9zIGFuZCBncGlvLXJlc2VydmVkLXJhbmdlcyBwcm9wZXJ0
eQ0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogSGFpYm8gQ2hlbiA8aGFpYm8uY2hlbkBueHAuY29t
Pg0KPiBjb3VsZCB5b3UgcGxlYXNlIG1vdmUgdGhlIGJpbmRpbmcgY2hhbmdlcyBiZWZvcmUgdGhl
IERUUyBjaGFuZ2VzLCB0byBhdm9pZA0KPiB0ZW1wb3JhcnkgRFQgYnVpbGQgd2FybmluZ3MuDQoN
Ck9rYXksIHRoYW5rcyBmb3IgdGhpcyBzdWdnZXN0aW9uLg0KDQpSZWdhcmRzDQpIYWlibyBDaGVu
DQo+IA0KPiBUaGFua3MNCj4gPiAtLS0NCj4gPiAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9ncGlvL2dwaW8tdmY2MTAueWFtbCB8IDYgKysrKysrDQo+ID4gICAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwaW8vZ3Bpby12ZjYxMC55YW1sDQo+ID4gYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3Bpby9ncGlvLXZmNjEwLnlhbWwNCj4gPiBpbmRl
eA0KPiA+DQo+IDRmYjMyZTlhZWMwYTM0MWE1MDA4OGYzZTQzNTJlZDRkMzZmNjQ5ZDMuLjViOTgy
Mjg0NjZjNjQxNGJlNjgxYzQ5NA0KPiAxN2JiDQo+ID4gZGQ4MmYyYzQ1NzU2IDEwMDY0NA0KPiA+
IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL2dwaW8tdmY2MTAu
eWFtbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL2dw
aW8tdmY2MTAueWFtbA0KPiA+IEBAIC03MCw2ICs3MCwxMiBAQCBwcm9wZXJ0aWVzOg0KPiA+ICAg
ICAgIG1pbkl0ZW1zOiAxDQo+ID4gICAgICAgbWF4SXRlbXM6IDQNCj4gPg0KPiA+ICsgIGdwaW8t
cmVzZXJ2ZWQtcmFuZ2VzOiB0cnVlDQo+ID4gKw0KPiA+ICsgIG5ncGlvczoNCj4gPiArICAgIG1p
bmltdW06IDENCj4gPiArICAgIG1heGltdW06IDMyDQo+ID4gKw0KPiA+ICAgcGF0dGVyblByb3Bl
cnRpZXM6DQo+ID4gICAgICJeListaG9nKC1bMC05XSspPyQiOg0KPiA+ICAgICAgIHR5cGU6IG9i
amVjdA0KPiA+DQoNCg==

