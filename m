Return-Path: <linux-gpio+bounces-19050-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBEBA933AA
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Apr 2025 09:47:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C904F8E305F
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Apr 2025 07:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 889E525A35A;
	Fri, 18 Apr 2025 07:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fCZf3cmf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012030.outbound.protection.outlook.com [52.101.66.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3B620FAB1;
	Fri, 18 Apr 2025 07:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744962425; cv=fail; b=EXwnw7GuVr/7Mkt4wttrBybb+ofd6+hROBrEu7Go9OQF2v4qEKzdHms9MANjvDxItHLOkoMvKuEEfsult+/KRWOlIvSIsqWXgX+7SOAzOGI8mAyQriO7v4JS+J7BgougdTcj8a90qIv9WVBMtNHgEPL2XvhHcZeiuLZI7Nf5aug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744962425; c=relaxed/simple;
	bh=ddqx5fa8qAjWbA/Cv1vPVCYUM50WMroI+4uuNERBJkI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cqEUgNtPi3+4o7liV+0gIBygi9o1qG3zezXb8m1qQAVpNsTS2/dPK2RarX09R0xBa8tlwTdROcErj2zzgYR+nU/gEYUKs0YzKRuMMCibxcvr3UIk6DgWYmSxRjAAMbJw4dXlCV3WPa8oLTcdTba+OvXzxwYRkibodlkgwguX/D0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fCZf3cmf; arc=fail smtp.client-ip=52.101.66.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wN6eYQWTEb3e+fua5vEsqhEuMc78Arlyc3VzMACUVUqTLugtlFDW7rldX9aXS5bxGS/0JqflEuNyIFZghrsgH6lqcJ66+2y9QvyZO8pq5JY0hH+ymNxOoK8qBpFLqcMh2L3peZUAqWsTJvqabWPTi5+Abvsl+23+xUS18mgfZPqtFjQ1AiokcMocrdWzsfOkjraCv8PYHbnB8RU95i7bZnvRrOp8i/0NymAqupiSDhHjDQs/ZyLKkrEKA3s3J0QsiXPPfXbEyrfz8FoEt+4Oc7+iUMAumf9ZfWFnBGnyFVgBJ9hjhlvj0Nz2X8weNyGDgMwhTTK0n8AsDValy/GRgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ddqx5fa8qAjWbA/Cv1vPVCYUM50WMroI+4uuNERBJkI=;
 b=kNG19VtlCh6z2vuRsmZMwPqZYe0sA9WAPojs31MFTUpmt1wISkLT/vwGMwQknFQRrfc+yhhTPWf9MA/zfXHxiy5QA2x84dP8hZpfhVLsNz6jn2rsw8usrWTy8cD56oY8Srpydj7sSPb19SlFA/Fuwx9aOAIpQBFpYA4QN18jzaiTiq+3GC0EkVUHmu5cjzDctWfcP96RlnQjLavUTTsi5961O5l+WtdkWsxcjsSJZd9h6Pdrj8OIq1LIAUQD0949ztjNJC9o1PGCBu+NVc6UEKN7RkHwMvFexzK+zUPPLKDthP0ZpP6NLYJt1+k6ykUxpZZcz5rezMER0KvxKBkQtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ddqx5fa8qAjWbA/Cv1vPVCYUM50WMroI+4uuNERBJkI=;
 b=fCZf3cmf403hMEeeecl+2u+99Nd6bkhDOtktX2TF0d4A6uqVVIs/jBD6xJFtGfqM3RWwFPcXJSKHOiwtyDEB07VH5Qao89ei0/wv28sKXJhTzoYKVOyBt5WOu7cHjuv2/zZNbzBJbaIXZ2lALdNUXoFpVTSn3J7M5ypf0oUoml9NKkBirQoBhG1p/E3kmEFQPswD5sGyA9RnWkFrnkcuN8dAwIRIz45pz1r7Qkdxj5x01/VNKCltj4WO8ezl+e4ccvNT9fhWYKNAWCoLMVn1ONTcaAMiTd26B6Ox4gryS3GNX2YApFc1OrgSe2yMUJsPbKR2F2rnpy5stCN74DpNVQ==
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by FRWPR04MB11104.eurprd04.prod.outlook.com (2603:10a6:d10:173::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Fri, 18 Apr
 2025 07:47:00 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%4]) with mapi id 15.20.8655.022; Fri, 18 Apr 2025
 07:46:59 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"cristian.marussi@arm.com" <cristian.marussi@arm.com>, Aisheng Dong
	<aisheng.dong@nxp.com>, "festevam@gmail.com" <festevam@gmail.com>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>
Subject: RE: [PATCH RFC] pinctrl: freescale: Add support for imx943 pinctrl
Thread-Topic: [PATCH RFC] pinctrl: freescale: Add support for imx943 pinctrl
Thread-Index: AQHbotdOAVMZdfAD0kCJ1YWhT8J4qLOkcUeAgASz8AA=
Date: Fri, 18 Apr 2025 07:46:59 +0000
Message-ID:
 <AS8PR04MB8642E2E7247C6B627508210987BF2@AS8PR04MB8642.eurprd04.prod.outlook.com>
References: <20250401072725.1141083-1-ping.bai@nxp.com>
 <CACRpkdY5XdzVxbNhw-nv5EL00NNqrJLiwc0B4O6somUo1gjNxA@mail.gmail.com>
In-Reply-To:
 <CACRpkdY5XdzVxbNhw-nv5EL00NNqrJLiwc0B4O6somUo1gjNxA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8642:EE_|FRWPR04MB11104:EE_
x-ms-office365-filtering-correlation-id: c38e5e55-7d18-4741-28b0-08dd7e4d331d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TUMxSWdRY3E2d05VVWlXdXFEMFUvaEViU29MNjZiRWxUUDBIa0U2SnJ4VjJw?=
 =?utf-8?B?S0pwREJ6WldtRnlOcE93TURFaHZQRmhOU1luL0lWRklybTljR3VHb3RteGtM?=
 =?utf-8?B?OGFtdnlyeHZIeUk5ZUQyQ2xUWG13dnBVNyt3Vk90VzcrT2NSVEd4azhxZWlw?=
 =?utf-8?B?aTZwWmZOdFpiTExSbXQrRzlwczVGU2ExemdwajdIZVFKelVtNmZpVm1Ca1hu?=
 =?utf-8?B?Mkp5dDE4M0VXdVdyQWNqQTcwV1d3TnpsdVY1b2p5YmlhT1Z0WUhFSFpWdWty?=
 =?utf-8?B?Z2EwNWcwd2NBRHZ6SEJ0R0JZZGpuTlo1TVRYV29uRjNSamtraGNpMUE1WHJa?=
 =?utf-8?B?Y3FYaGg2bFZBSWowcmh3em53S3l4TWk4RTBhQjV3K0EycUw0REpKSmQzMlVX?=
 =?utf-8?B?NXNUN0xwdm1pZ1FGSmkvRXE4bW11NmROdXQ2VHRBeVE4aXUrb251WUlYMkRk?=
 =?utf-8?B?ekZHTU9PWDFqeGxFR0FTL3FqU3RZVFhTUEI5ZDl6enRNU29HQzQ0SjYzblFP?=
 =?utf-8?B?emZWL3g2eGlUME14NnNCbVQwTWhRNEw4YTR5U21YWCtGelBlaUtQM1dvM1FK?=
 =?utf-8?B?Um9PZ1UwalFPWnJSMVhYT2Z1NFNzZW1zWk03bmpmYXFOaXgrODd1ZHcxaUsv?=
 =?utf-8?B?K3NxbTVybHB1SDZCK2tvc0prc1M2Tk5uaHBYeUE5YndFUlV6aE82L1FKcDcv?=
 =?utf-8?B?enU0R2pnbldtaW5taUlZOXpKQjNUNlBhdWc4QjR1QTdHbVQxUWU1bDdnQ1c2?=
 =?utf-8?B?b0RkUlJwNmFGZ3ZmblVkSDRnYkY2amNyNFBmT0JDTWIzKzU3dm9ZWTVkZjls?=
 =?utf-8?B?WG51VlZaTkN3Zm1XQi9sNkxYM09zTzNQZEZSN2grWHhNOWlCWWdZQlRhMVNu?=
 =?utf-8?B?MWNRU0tlODQzZTM0d2NCbHFMV2dMejUrRFJGQVlaUWVKWFRKUVpLMzBZT2hX?=
 =?utf-8?B?aCtuUjlJSkdjS3NLdXQyZ3FFMkdSZEtCSWx4Mm1reHpTTnBBaytOcStpUEw0?=
 =?utf-8?B?NWxmU1F6YmppTStERnp1eEJBb2VqaFJCVG5DVk1vcDJ2c1pYdStVTE8zU0g3?=
 =?utf-8?B?TmVpbSs1U1RDTWJNMGQ0REdjMHRpT1pDUFlCb3AxaWh6RmhBMTVJck1haGZX?=
 =?utf-8?B?RFJHVzMzWUREenIxN28vTDdkZ0xEQmp3aGp4bWJtTXowaUxjRUJNd1MwZW5h?=
 =?utf-8?B?cXlhOWZEcW9MTkhKWGtMVUZuWVY0YnZpMmY0VHhERGZXUnVqQWVsZGxtTVNo?=
 =?utf-8?B?SWRkWGRoSm9kMENEMWgrb2l1MzlyZkhMVmRpek41ME5VZmxvRWRsamFMV2NY?=
 =?utf-8?B?bm40VjJvdzkvaXBFWCtjRXNHd1JvZm9KQTliSk9UUnZ5eTJxdmZ4WS8xOTVs?=
 =?utf-8?B?MmtReGNoaTJtWElEc3liV1hSaGQ2bGswRjlETlhiZUhNT1E5aFBGTWhJQXFt?=
 =?utf-8?B?NGNnU1BVUWJXTyttNUE5S0d5citmOW5rL1lTelFrK2R5RVZXazFOSktsbGpH?=
 =?utf-8?B?dC9aSUc1a1o5S0RFZXJKcDZkb1JRNkszNGtzT3BwdTI2aVFOVG9EYzNGdFVC?=
 =?utf-8?B?Vk5VU2J3UjgyNldmZkFNdlZIejN0NG1UcnI1K1l6UVM3cFV6emhWcjZiUU16?=
 =?utf-8?B?VzF3RWZtQkpVeElrRkxmYlZOb1NubHk2ZlFxNUZ6bFMzckVXNVNscS96dVMz?=
 =?utf-8?B?V2Q4VzIwdjk1NU1SL251eFR5cTJreE9ZWGdjbHd6eVlLdkpKbDJUSm1QUWNR?=
 =?utf-8?B?L2ltVkd4WnU5bmhva2NWT09zTGczWDNUaGZpN2drak1DbGZBdDdyUEdZKzZM?=
 =?utf-8?B?NzhsMlBNZUlTRnJML0VtT1loSTRVUm5pVjVaOTE0cm50Q3BVbElPR012d01U?=
 =?utf-8?B?TGYxWHJqY3Rvb1R0WU1aU2V2YjlTV1lOaHFsRHhwUTgvcGpSMHU1Tnltckx5?=
 =?utf-8?B?ZWN3eUpGT1NWZGFyRWN4NWRrWW1uZmEvb1pac1o1TUh6N2t2MmdNWVNQYTht?=
 =?utf-8?Q?fzTvYVfKaaHFf7C3DaqK9RAqrs1IiQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b0ZrQTNRVFVOeHFRbnk0R21DMHRucVpsRHl6UEcwQWwvbEtDQ3gvc09XTXoz?=
 =?utf-8?B?Z0lrVW1iV2ZaVTVwWklJbnVPb2pCOU5RRTl5N0lWTHVwVkNpRWR4UWZ5MmlM?=
 =?utf-8?B?a05UcUhUS2NxR0QxQVNpenhXZHhneEJrMjdjcEZ4bzR0a05JQ1ZIUUV6cmRj?=
 =?utf-8?B?dkdDZDZ3a255dmNqaDZma2FWTkRScjVIcnZqZW5kQk5RTDVESFFKSXBoQ0Fl?=
 =?utf-8?B?cWx2TVQ2Uis3L3hvY3RpdjZQMThRWjY2cGVGWTM4bFd0cGhucWxSdS9yYlBK?=
 =?utf-8?B?TGFXdnlwWVlsRVpFblQ1SlQ0ZG1yK084UTdNUTI2cGFPeFdJRUxRRDRjanM0?=
 =?utf-8?B?b2M0ZGxONERXL2RobFdzclNndnM1YWdQY3VwVVZ5cDFrdVJuZ2J6VFY3ZUJL?=
 =?utf-8?B?UjE1YnNMd0dKZEZJZ1ZvYzFMSGJlZWp2QWx0aTU4emFtNVpTcTBhaU1NSTNj?=
 =?utf-8?B?dHFEK0Q1K2oxc0NZdlZObEVXUGVwRlZTZlduTmFJNkUzZ3kzOHR1S0RteWFa?=
 =?utf-8?B?TUFBYzFCNXdra1Fja2IvN3ZSK3A0L2pTYnpKWFE0UmI1ZnEyRTk0K3ZTbHVL?=
 =?utf-8?B?Vjg1Y1hTUno3Mi80ZmpkbE82dlU1N2p3VmNxRG1uS2RXYjM5K0ZhTkMrRzU2?=
 =?utf-8?B?RGpYNm9waFNiamQ0eWVWWnEwOG5qOVFzdUh0cEZCdmNESmdSQlpKNm00bDdq?=
 =?utf-8?B?a1c4dDJTczZ0WElIRnVmSTZuVHIycTE4eXpwcnhxNGFXSHpHZ1VBNC9EM0pQ?=
 =?utf-8?B?N29id2UzelA2Vi9qZW1YMWdISjBoMGxudnh0dEFFL21ibCtuWmNXRlMwdDhK?=
 =?utf-8?B?ZHp1MWVESDh3V1h4V3oyWUVQR21ncElJcHJCankva2xIcEtMMjVtYUdUZTcy?=
 =?utf-8?B?MjJCMFVlYUdOU0kycU1pa3lwQ2ZqOHFTWEVkM2l2bHFWV0Z2Ykt0R2ovRCtl?=
 =?utf-8?B?eVkxNGMwOTBwWTh3ODZGNWFudnZ1Q0JGRkhYVjNsbXYyaWtkTW9nKzgzY0l4?=
 =?utf-8?B?UlhoV3IrcHlvSlpjN3BiK1F0SkswWS93M1NwVTFiTHJXS3lRVVlFY3dKL0pz?=
 =?utf-8?B?bVV6d0JJUXFERDd6ajFoZmNOUU9SK0l4dW1kZE84MSsxZ2Eza09nV1lCU2ZT?=
 =?utf-8?B?cUZHcTk1N2I4MjlWbC9WZXpnTFdaL1dxRHJlMlVOM3JpQjVmcGZHRFZ5bHdD?=
 =?utf-8?B?N1JHUjM2ZnlyOGNZTmVPY1E4Qjk0bXFNRkozMitHTFBLcWZZMnpiNm1rR09C?=
 =?utf-8?B?QUR3Y0QzLzhUdmZUcG5BUU9WR3hiSytnaUF0WFFGODlUVGE2NFlrRFVadUZ4?=
 =?utf-8?B?VTdBc1YzS3F1dU1VdDd2dEdJblZXV3piNTk0QWREa0JEazUvU3B2Y2M2UEJV?=
 =?utf-8?B?NlVnRDVjMnVKNmFqU3FObVFIemFNanRYYTZvVTRqYmFqZWFoc2JOODk0MGN6?=
 =?utf-8?B?Ym5ZQmMwK015TmZ0SjRIZGhQTlFiejNYVUloTUd2bDRkMGFMN0ZNOHdKc296?=
 =?utf-8?B?ZzdFU0xCZEowN25NN0pPRWZVUzFFYVdYbndtMkpPcUFkL3JuamR3M3dIRUVI?=
 =?utf-8?B?WU5xR1BuR3dWbmVtQ29KSjZYUHBvd05oem9WOTBGeXhtTHdkb3Q0QlFwdys0?=
 =?utf-8?B?L0pMN0pDNzFDaXdyYlpEOUxQcGFnQTB5M3VoZnRJcDl5THVVNTZVc0NQRGZp?=
 =?utf-8?B?TXFvYkhUS2ZCZTdSLytMeHhRK25CazZ1eDVCRS9JS0ZkQ1Yxa1I3b0RCZ0FK?=
 =?utf-8?B?QmJqL3dyZDN6czZpd3NJK2IyWnZ3RmZZSjZxN00xeEVpMFJ5aEhkZDBMT0h2?=
 =?utf-8?B?YnZhR1pGSW9WYmN4Z3NERyt2d0lVTVc3VFNBcm54cGxVRk55SmJJQS9maHVy?=
 =?utf-8?B?eElVRC9DRi9yYzJuWGFyRFJIUWRScm4zTjZvVStFN1pQZ2xOOWJWeDRyNWdK?=
 =?utf-8?B?aWR4U2d1LzBoSjY4Q2M0YWtHMDR1YkNXT2Y0UVlEWG4zODllMWRrQUk3cEZn?=
 =?utf-8?B?L1FsakYzR1JoNjhFTTFVTTlkKy9HcWpqZGRzQm9ISCtNK1pRaklra1A5R1hi?=
 =?utf-8?B?TTZYZ1ZDbnYyTlNVejNZN3NkZmU2S2VZN1JETHF1YlVhTjUvdmlPdlpFUGhL?=
 =?utf-8?Q?UKks=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c38e5e55-7d18-4741-28b0-08dd7e4d331d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2025 07:46:59.1209
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TrauXJ46+D+oO6fmS0YKVB/Xj0AtrykDb8E/AWZcJsQanHBGNASMZnnKwBV3oAKX5MlKOjplrWWbMLFyFNWt5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11104

SGkgTGludXMsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCBSRkNdIHBpbmN0cmw6IGZyZWVzY2Fs
ZTogQWRkIHN1cHBvcnQgZm9yIGlteDk0MyBwaW5jdHJsDQo+IA0KPiBIaSBKYWNreSwNCj4gDQo+
IE9uIFR1ZSwgQXByIDEsIDIwMjUgYXQgOToyNeKAr0FNIEphY2t5IEJhaSA8cGluZy5iYWlAbnhw
LmNvbT4gd3JvdGU6DQo+IA0KPiA+IEFkZCBzdXBwb3J0IGZvciBpLk1YOTQzIHBpbmN0cmwuDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKYWNreSBCYWkgPHBpbmcuYmFpQG54cC5jb20+DQo+ICgu
Li4pDQo+ID4gIHN0YXRpYyBjb25zdCBjaGFyICogY29uc3Qgc2NtaV9waW5jdHJsX2lteF9hbGxv
d2xpc3RbXSA9IHsNCj4gPiAgICAgICAgICJmc2wsaW14OTUiLA0KPiA+ICsgICAgICAgImZzbCxp
bXg5NCIsDQo+IA0KPiBUaGlzIGJpbmRpbmcgaXMgbWlzc2luZyB1cHN0cmVhbSwgY2FuIHlvdSBz
ZW5kIGEgcGF0Y2ggdG8gYWRkIHRoaXMgY29tcGF0aWJsZSB0bw0KPiB0aGUgcmlnaHQgeWFtbCBm
aWxlIGFzIHdlbGw/DQo+IA0KDQpUaGUgY29tcGF0aWJsZSB5YW1sIGNoYW5nZXMgaXMgdW5kZXIg
cmV2aWV3IGluIGFub3RoZXIgcGF0Y2hzZXQgYW5kDQphZGRlZCBpbiBodHRwczovL3BhdGNod29y
ay5rZXJuZWwub3JnL3Byb2plY3QvaW14L3BhdGNoLzIwMjUwNDEwMDYyODI2LjMzNDQ1NDUtMi1w
aW5nLmJhaUBueHAuY29tLyANCg0KDQpCUg0KDQo+IFlvdXJzLA0KPiBMaW51cyBXYWxsZWlqDQo=

