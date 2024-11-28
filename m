Return-Path: <linux-gpio+bounces-13332-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7239DB0BD
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Nov 2024 02:31:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13F91163D15
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Nov 2024 01:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FA7E1B813;
	Thu, 28 Nov 2024 01:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CEqEpewC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2051.outbound.protection.outlook.com [40.107.20.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFFF42AA5;
	Thu, 28 Nov 2024 01:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732757474; cv=fail; b=pvC3fW4EttlXqJbKmHRnOhLErUmWtL48bpSIOD7fKiGTeujh7o9wgpNtFrXvdE2yMYklbQll4Q9guOAj0VurPbgHUUXrJyqV9Zvh1pEkm0dOikhMTPNmMGEx4m9SQ/X/zRxaXFb/RIbEkasaex6JTP/4gU31/ib6GP01F1XGcLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732757474; c=relaxed/simple;
	bh=rxafLXtdm8nJk6Gf5+bjIFAPjUU1R0ErzItprAuw9cc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GtXsR5wPk7uaDBCh4VkkgNhKgvDwVI+qrFAFoCpZurpTads5JE3/s3PLtjFwpkBmwGDzX6ZajZIM8yNQ9gNVRkk/xFzYBoEXM5NrNVtIprgTZ2y9/UPnkqWWSzrDc1MGFI7ZTT1R1aLodHLpOTLID+nmTr+qT1UkjU2eOiszUzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CEqEpewC; arc=fail smtp.client-ip=40.107.20.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hk9+N+8w+TNnaytmb8v4MeRTWn5sT30q7kJPIqwLYUkWGWM6sM0H1vWCDAdd2shK/J9VSqZeIj9Bc5DCMU4HlOwXFVaavC3fZyEfnuc8tfZQHbRY4YiFXmnirSo+XKi91sJfvSqpO/99vDupzF40jU597185JWVAaKBN1a5cdcyyyjEy6X3Ox4sPMlQlDqRqktS6u7bYPEYL3+jL5Wv/1vi2qrQKGH3CQLJT5DujFEAcAvcxg25ssyrfjnNXIyub3L5PGQr+tTJVBZoGX1aqGWKJ0sFcuIppo0l6DxZMc4BmjZtS3ls3Ovq+KlX+IEEDlVzM2JPL8r94ZdOZP5FCAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxafLXtdm8nJk6Gf5+bjIFAPjUU1R0ErzItprAuw9cc=;
 b=TFblcscd8HLtebDs4KeCW7Nnf7NHzxxUcOSTmayF2s5Mt39GJQ1G33lC5+lC4uojqoaUpfpbfQLnecX7EVMgihqGAGQVUcQ2Kmqb+1lAXzS1rQWyGYQJ0t+ubFZMNXPJw4W6vd+ejDn5IH6dr3xvJ+K65JvGqoeKgmayf004m88h5AaZOTO4r75HZqi6qyXlLEMld3La13kyfiCnWc6Nu9KXqfla4WujHIn35In0pSGbxRfuT2DLgeo/e2Gelatn+a7PFK8U5j03iBnUU8CnIyl41nk3NXuglPhe1hL1DXMsqMd0WzDRfR8dT312FjXT4CPseLsKNSxUQ0Q/jHoj7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxafLXtdm8nJk6Gf5+bjIFAPjUU1R0ErzItprAuw9cc=;
 b=CEqEpewChjZ/WxR62C+fDDtpVshRSAzgu6Lj1wsVmI3lCuy4Ar5j7feZipBIzaiRpl/sEtmPsbmQr/naSCLdknQKU46tZ4jjJ/fRwJx3vH4O0UljQs/ZqsByWZ4mvtyfE0NckDDoXkVmSv9HY53whl3i6wE2ADmSx1pwafpWu8arIuWGzkM3CEx9MPaD1c++3DBZ3g5o/jYzJsPBp1maDGRgvloWhXGg7oDqfktwc1RPRTw6JXuS303tDYSMVwPIacYOt5pjdJQZ9d5bW3hsLtNacKY5Tc3Dh9DYB6H/mNyVJo6OJEe7rdo94W5HcmM3H20BliJsZ7jaAP8Y4j4qKw==
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by VI0PR04MB10903.eurprd04.prod.outlook.com (2603:10a6:800:265::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Thu, 28 Nov
 2024 01:31:08 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334%5]) with mapi id 15.20.8182.018; Thu, 28 Nov 2024
 01:31:08 +0000
From: Bough Chen <haibo.chen@nxp.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"marek.vasut@gmail.com" <marek.vasut@gmail.com>
Subject: RE: [PATCH] gpio: gpio-pca953x: do not enable regmap cache when there
 is no regulator
Thread-Topic: [PATCH] gpio: gpio-pca953x: do not enable regmap cache when
 there is no regulator
Thread-Index: AQHbQJwT8Q7vvC2fjkSmYoCNmuKahLLLGMQAgADP3yA=
Date: Thu, 28 Nov 2024 01:31:08 +0000
Message-ID:
 <DU0PR04MB94961DC24122BFAB4B58A03F90292@DU0PR04MB9496.eurprd04.prod.outlook.com>
References: <20241127071450.3082761-1-haibo.chen@nxp.com>
 <CAMRc=McQ8J_x40YEUQSN7prGovHoTqvoePq-HznUdpjYqO_cCw@mail.gmail.com>
In-Reply-To:
 <CAMRc=McQ8J_x40YEUQSN7prGovHoTqvoePq-HznUdpjYqO_cCw@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9496:EE_|VI0PR04MB10903:EE_
x-ms-office365-filtering-correlation-id: d9e765b8-7cb4-49cf-b16f-08dd0f4c55bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UTUvc0xsVlBvbW1pOVF2SGpnbEpnT3JzOWhDa0piTFhPbHE0V1B1Y0NVczdk?=
 =?utf-8?B?bnhYYzNpMnBuSlhmUkg3VGo0RFovQmE1WWs0elYvNFM2UFh3cmc4cmp2NU4x?=
 =?utf-8?B?WkpORVhFMG9WSEQxRERCaWUvSXNGQW5NSUlsSFdLeFFPNlhrMjZTVkJTdDA3?=
 =?utf-8?B?SmpSSTU3c2s5Zk9wL21iNTZVamNkNU9YQVNyekYxa3hHUmF0WGxtM0hpVjhj?=
 =?utf-8?B?ZVJqUU9BYkpyYVNvaVl1Tm96VzZrLzBlVElQbHFQenk1SzViK0Z0aGRqNExV?=
 =?utf-8?B?OG1COExIazF0ZlplZ2VzR0o4WS90d2pXa3B0VDl3WnA4SVRUNGM2Uk9TTUdN?=
 =?utf-8?B?dTBZd2RoeDJBUCswcEgrOHV3cUh2M014QjZmaGJLZFNFZEVnT2pueHlrS0Vu?=
 =?utf-8?B?YzJEVVpGbjNGdWxuYTZabng1bmVDWFhrSkp5VnQ5ZlBKMzNZTnpwcG9kWjVF?=
 =?utf-8?B?azBMZVg4R0szeTI1NTlOaHg2T2JvYUNGSkdtaThCSFBHTW5HVVlRMEhRbU5t?=
 =?utf-8?B?UTBQTXE0UEpJRHl2a1NjTXNJMlFBUmFGNjFDTEYzL01JcllCMExlanF5aFJu?=
 =?utf-8?B?bSthV2twNk1BQVg3SCt2dS85bzZhL3FGZ2hwQmNmVy9GYnFsU1RYc282bGhB?=
 =?utf-8?B?czJLcWxTMFFkMzRvMld3VUFWbWJRYnlVRmYwRVZBU0w0VUhUNktQaWdXOW05?=
 =?utf-8?B?czFnTmFQOU96MjZUSUlsMGlCZ2RQWmVTS0Z4cVVOUWtaUDlmdGVXbEoycHZX?=
 =?utf-8?B?Vk83SjBIeDR0dmUxQXd6ZnVSeEk5eTA3aHFJOHNhUnBqRHluTTdjSEJHYUtK?=
 =?utf-8?B?S0ZTQkJLVW5pSmJUSHQ3MDB4bDdLVXBIUnU1U0JDUzUxNHhsWk9pbnNGZm5m?=
 =?utf-8?B?d0prZkkrZ0RnOHhoK3o4YW5MRW8rS0hsVjVPNnpkNHJaOFllUUhRZ2grdnR5?=
 =?utf-8?B?NHlWYURXWkNPNnozQzNwRWRFSnNaeThKR2NURTRsZmF2Q2lpemhFYlhKcCs3?=
 =?utf-8?B?WTlaSGJncTQ2SXJvemM2SjNqNklUTjFPcnZGb2QrK0hUR0I3VHV6Q2ExL0ts?=
 =?utf-8?B?QmFwR2p4ZlRlRmJXVytWSkljcncyMWNReDlpNFhwdmVNdWIvSmZLa29JRXBF?=
 =?utf-8?B?bFIyVUxRanhPS0VnUHo0em8vWk1rdHFJWGhzY2lGazFqc1pIN25zVVZ1Q051?=
 =?utf-8?B?UWV2QjVWZzZVS3JMM3pKRjJwYnFnUE4rbkZMUnVuRXcyKzBNaHhGbUIrQ2t4?=
 =?utf-8?B?YUc3WkJRNURYV1BWNXNSNm9kdGplQmhpaE5WYmlsek85bVdHK1pGTndPaXhj?=
 =?utf-8?B?UHBZamdHL1JHdHc4dVIycWFZVDZuU2dzbTgzT2EvMVlrckd3K3E1OG9jeGd5?=
 =?utf-8?B?YXVJTFRzck5hUUJ1S2pQeW5OamVQZTRVR2x0bkVTYWdic0JrcFNJM09MYUc0?=
 =?utf-8?B?MmRvNTFIMzdKMUtDbzAwSzFMajU5Y2JXdTU5enlVOCtNS3VxbW1Iak1hd2xT?=
 =?utf-8?B?NXFUalRZSGVZa0VYcGJxb0dQM3RkSnJXcElKVkJTY2VhbjA5ZG1abm1jbHRy?=
 =?utf-8?B?Szk1RUpFSS82U0M1TUhzYXFscGFIUXR1b0lzaDVOUHdJNXhMNzhRc2FLWkFi?=
 =?utf-8?B?SEFNQnYrUURZOWZNOXB3ZVhXMUpPR3pVOGs1Mk9ySVJvNXFpNkZoVGxyd3Z2?=
 =?utf-8?B?ZzlDTXpITW0yY3djdytIVWxlUWN3VzRrVkJ4T0ZlTVNrU0NSczNSa0ZVVy8v?=
 =?utf-8?B?WFJrc0FmY1BrODE2YWovNVhPZ29hN1JKdllXcDZLS1FHeC8wMDJYRmRybzh0?=
 =?utf-8?B?Nzl3eEU0ZGhaUVhYOUppSHVpcmx0YkZzZzhIZmZDSm11bFozSmRObndPSXVJ?=
 =?utf-8?B?Rk5BRXVpTkpwYnFuMS9qUzZCNHNSdHIwano5RUtEQllYV3c9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RGt3cCt4Qm1tVFVRWmp6T3pHditPQjJ6N3J5RmFLVEVWTGg2T0QvcFUyRzBG?=
 =?utf-8?B?STJZeE9yZngvMnJ2MS9wVEtXUWRUNWg4cWVrd0xmclhqOWlycUREMmwrSXhy?=
 =?utf-8?B?aUp3Q2ZvMFNrNjdCMHdWYlhzeFliSVRWbmdOczR4WmU2dVRjU1VkcmVHM3ll?=
 =?utf-8?B?ZllzbGp1Q0xicnQrTGJYRWNPRmlHK1NQOVo2MG9uOStpZGw4U3RKREFOc0dN?=
 =?utf-8?B?a0RSSWNBOWlYWjg0bk9KdWJLM01ORTcrSjJyQ25GSk8rRndXLzA1WFdqUVhx?=
 =?utf-8?B?MGVZN3ZmK1BoNGdUaXVZSGN4eVNNSUxSZkRoaExvUmV1b2RDbXYzZ3ozdmFK?=
 =?utf-8?B?cy9jckI3UXZzYTRua3VCUUxOVEhGV2JINmtZMnprcnlDWWs3TDBMeUM4cVE0?=
 =?utf-8?B?RjlnWVV5WnZkcld6d0FLb0l5b2tFWEk5N3JsZG9jcFA0U1NhOE1tL01IbXlG?=
 =?utf-8?B?ZUp0Z2wvdUp1MFNJRXpQU3lqUUJPMzBMOUNrYklGL2tQMk95VnlZOVFDaWQw?=
 =?utf-8?B?bm5BUWJ4bURZZmtqZzIxTlp3SDZqdnFuN3FkdGhEK2pXd1VELzk4Wjh0U2Jl?=
 =?utf-8?B?SEYvWk04NXFnQVVsSWw2cWF5ZnVmTGJTU3V1NU9QTjM0SUNqelh3aFNvdXBK?=
 =?utf-8?B?UjRRR1kraEFGUTYxRm5xb1c5UnFjRjI4dXl3L1VIRTgzOWF4TWIzTmJ2MDVN?=
 =?utf-8?B?QnI4eE1EQTE4QkdENC9Vc2IzOUx0eXluMHJlTERUdFJBQXZJRmFTYkN6THN2?=
 =?utf-8?B?RFByOGhyRURpYnAyZkc3YlpScVk1SmhmM1FKdytUclVLOVNUamUwaDIzUGtu?=
 =?utf-8?B?SnkyT1hiWFZjWjh3eFVRRXBxbWF5L0g1bm02R05zMW4xemM4ZXluV0VXR3Iw?=
 =?utf-8?B?dFkzeENDdjNKalJGdE1IU2lzSFRlMmtDaWZYbjRqdURQZVE4eW9ZcHZWWm53?=
 =?utf-8?B?bmpPNXdWREFYZ3d0SEkyczE2QlArbjFhVmdTWllkSVM1VGtJMmhjejJ4NzhG?=
 =?utf-8?B?c3VhaHFkN2JnbWMvUks1MFNFZmlBLzE3b1Fnc1BjR1FpRXM1Ujk5SW1WNSt1?=
 =?utf-8?B?c3daWk42UnlqdXVUbmNkUHRxRVhyYy9pNkJzTUxiUkxTQmloMElWZ2lHTEdw?=
 =?utf-8?B?RHBobVNQOTRJL3F1RW10WnFyWGdDVEFVM2FsOXk0UGN3RXIyaFkzNEFJaHlH?=
 =?utf-8?B?YTlIUFY1K0dCMzI2emNIY3krZFdnUjhXelcwQUpBSEw4L2hsTGNsU3pCLy8r?=
 =?utf-8?B?YzVubE02ZUpGaUs0RXkrSnBnN3dLaWE2MFhFZ0tFY09MR2M2Y0thMlV6blJB?=
 =?utf-8?B?MTZHenIrSHp2aE14bDE3UHF0eVh0ekIzWFF3a3BkT2RlQzNLanBWNFFhWE1s?=
 =?utf-8?B?MjNlTlpMRytNaEQrNHN4c3VIdVRWYkdJbUFJeEJ6MElvc3pZUlJDc1V1cFB3?=
 =?utf-8?B?V3lFcFRQbU5xeHFGVHEydnkvTFFUdkVuK3VuTWhzVk04dmpVZjJQUmtyamZQ?=
 =?utf-8?B?STNqMWYzZEtMNVc5UGtPRmpLV3d3WEJTQ3BIUk5ibEY3V0JLZDBoVkZjdlhy?=
 =?utf-8?B?UFRnMGdtR3F3U2JQMEVjMkVXSlcvc2hJR1plYmdpVHErUzFDWGRsZnZ2b1ZF?=
 =?utf-8?B?MTNTWUFFSUJMZ1hNdE1SemoxVjZPY0RYV2hPaUFZaEpSNHNadXRYbVh0TDVH?=
 =?utf-8?B?WXZ0bVE1SzRTVzVEN1YwdHpPSEFUK3VndmFQeXRJNFR1azNJNDlHSFc2RXpZ?=
 =?utf-8?B?ZHN5M2UzUXByenlsVENJTHFHc0VndEo0OFhWaDY1YXFUeGp1N3lySTFmTjht?=
 =?utf-8?B?MXlRZGJCQ2lzeEhDVVRORllDWHYyRnJxYVYzbG15RmUxR01HL3M2YmcraThS?=
 =?utf-8?B?bjF5MmgyNi9uQXhoalFkbHB6RmxjZTJrYjZmTWpMcUVqeGpub21oMU1qUnhF?=
 =?utf-8?B?MWJMNTMxVzdpTVZYbjlPdndVYWkwaGV5RE5WdWJaWFBhd0VsbnU3eE5mdUZo?=
 =?utf-8?B?Z2V2eXUyZjUwK3Rhcmk0TXR6aFgvSDhZVmRiQTdSSkhsendQZC9uVFlJbDNZ?=
 =?utf-8?B?Q043dG12YzRoMmVjUjd2U1lIQ3ZIUFBzMTZJNHc4K01iek5KMGplQlp1anA5?=
 =?utf-8?Q?y4Yw=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d9e765b8-7cb4-49cf-b16f-08dd0f4c55bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2024 01:31:08.6185
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KzQB4w6cjPh8zy2+0FwTh3wFWtDDjLJ0rCpWtMjXz2AKkGalDcGjdC+JQoy/Wd913lsmATUYsV6Qlu7izP3SCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10903

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tp
IDxicmdsQGJnZGV2LnBsPg0KPiBTZW50OiAyMDI05bm0MTHmnIgyN+aXpSAyMTowNQ0KPiBUbzog
Qm91Z2ggQ2hlbiA8aGFpYm8uY2hlbkBueHAuY29tPg0KPiBDYzogbGludXMud2FsbGVpakBsaW5h
cm8ub3JnOyBsZ2lyZHdvb2RAZ21haWwuY29tOyBicm9vbmllQGtlcm5lbC5vcmc7DQo+IGxpbnV4
LWdwaW9Admdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBpbXhA
bGlzdHMubGludXguZGV2Ow0KPiBtYXJlay52YXN1dEBnbWFpbC5jb20NCj4gU3ViamVjdDogUmU6
IFtQQVRDSF0gZ3BpbzogZ3Bpby1wY2E5NTN4OiBkbyBub3QgZW5hYmxlIHJlZ21hcCBjYWNoZSB3
aGVuDQo+IHRoZXJlIGlzIG5vIHJlZ3VsYXRvcg0KPiANCj4gT24gV2VkLCBOb3YgMjcsIDIwMjQg
YXQgODoxNeKAr0FNIDxoYWliby5jaGVuQG54cC5jb20+IHdyb3RlOg0KPiA+DQo+ID4gRnJvbTog
SGFpYm8gQ2hlbiA8aGFpYm8uY2hlbkBueHAuY29tPg0KPiA+DQo+ID4gUmVnbWFwIGNhY2hlIG1l
Y2hhbmlzbSBpcyBlbmFibGVkIGluIGRlZmF1bHQuIFRodXMsIElPIGV4cGFuZGVyDQo+ID4gd291
bGRuJ3QgaGFuZGxlIEdQSU8gc2V0IHJlYWxseSBiZWZvcmUgcmVzdW1pbmcgYmFjay4NCj4gPg0K
PiA+IEJ1dCB0aGVyZSBhcmUgY2FzZXMgbmVlZCB0byB0b2dnbGUgZ3BpbyBpbiBOT19JUlEgc3Rh
Z2UuDQo+ID4gZS5nLiBUbyBhbGlnbiB3aXRoIFBDSWUgc3BlY2lmaWNhdGlvbiwgUEVSU1QjIHNp
Z25hbCBjb25uZWN0ZWQgb24gdGhlDQo+ID4gSU8gZXhwYW5kZXIgbXVzdCBiZSB0b2dnbGVkIGR1
cmluZyBQQ0llIFJDJ3MgTk9fSVJRX1JFU1VNRS4NCj4gPg0KPiA+IERvIG5vdCBlbmFibGUgdGhl
IHJlZ21hcCBjYWNoZSB3aGVuIElPIGV4cGFuZGVyIGRvZXNuJ3QgaGF2ZSB0aGUNCj4gPiByZWd1
bGF0b3IgZHVyaW5nIHN5c3RlbSBQTS4gVGhhdCBtZWFucyB0aGUgcG93ZXIgb2YgSU8gZXhwYW5k
ZXIgd291bGQNCj4gPiBiZSBrZXB0IG9uLCBhbmQgdGhlIEdQSU9zIG9mIHRoZSBJTyBleHBhbmRl
ciBjYW4gYmUgdG9nZ2xlZCByZWFsbHkgZHVyaW5nDQo+IHN5c3RlbSBQTS4NCj4gPg0KPiA+IFNp
Z25lZC1vZmYtYnk6IEhhaWJvIENoZW4gPGhhaWJvLmNoZW5AbnhwLmNvbT4NCj4gPiAtLS0NCj4g
DQo+IFRoZSBjb21taXQgdGl0bGUgc2hvdWxkIGJlOiAiZ3BpbzogcGNhOTUzeDogLi4uIg0KPiAN
Cj4gVGhpcyBkZXNjcmlwdGlvbiBtYWtlcyBpdCBzb3VuZCBsaWtlIGEgZml4LCBjYW4geW91IGFk
ZCBhIEZpeGVzOiB0YWc/DQoNCk9rYXksIHdpbGwgYWRkIGluIG5leHQgdmVyc2lvbg0KDQpSZWdh
cmRzDQpIYWlibyBDaGVuDQo+IA0KPiBCYXJ0DQo=

