Return-Path: <linux-gpio+bounces-8352-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07ADD939861
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2024 04:46:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B58A1C219D0
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2024 02:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85BEA1384BF;
	Tue, 23 Jul 2024 02:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="kDwpU3sE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012017.outbound.protection.outlook.com [52.101.66.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5AC2F32;
	Tue, 23 Jul 2024 02:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721702760; cv=fail; b=hMw/AsUD/YnZcFAWaffDmKzinZ9tU1NBk2dbVIJ5ImaBbDkHcL7SVoFrib5B0tcDYzl9tVDj5JI+tV60J5Xq3HGl4IS6oy89YXHz4X6X8wHtFbsQeCUbYSwBA7MXOK2MBfLkJFSBDBOrn2pbDKTLqBH96lBKLi8wxOJCXrrX6Kg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721702760; c=relaxed/simple;
	bh=nHBa1bYvrwskRyDA8aaJDAZZGLTW7YJp4Q4EkP0WiN4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VtuI1xuwdpjASxqGlbgjP++oA42zlZqMTw1nR8mO/hJhQcgg/BgnEQ9ChomLahvAkD/PzbQuFeEHnZCtgUVzclsmrlf6ukGi4+4XYyqaujHkqmYzqbWs11YmsjHN1CV2Usyfs0lagwO31PSXO2n2POxL9jVxO0S27FU+lroOjMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=kDwpU3sE; arc=fail smtp.client-ip=52.101.66.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BOzYAjeZ0JXG8LkNctgynnJBzRqUJpfzdQzR6wp38gcri4q0IJI9FEguCWzCEeli3mhS2qAfpmoDGSpvNC4k+mHS5ACcs2ihQKrK2N6tIGV0LletHN+TPKmyChlN9aIWHeLH9NliSO5KebrDZHLo3aTOF3h42i/TCFrsi4xewr59ltfhe3Qw0VKrtTmz5rFMD0JZIa2dRvTkegMspRvxtx4XY21YKqrxfj/mp0LU06g1KJf/29ohgaxnoOe1HXsXv5hWbNe7pZjouITgTPRKv4DWWWn9n54IVctUO7piFQcAJYtQ/F9AN+MaEx9mzkTwQQakqoZERd0FP8NSUM1eEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHBa1bYvrwskRyDA8aaJDAZZGLTW7YJp4Q4EkP0WiN4=;
 b=xMktuWAnk1CNfx0v9EETEXVq4OQvkHs5pEPHrcFHd/gmiwt2Qu/gWt2HqvuzpF2cxNHZPn2jO4/UjdkUTfncHbBeOmjticpzPeSYwg5KZuedHr+hu/v5qRvJ3yLAeSBeiCsWVpF3uX2jD7f9mKeSVQDuz+CFIYVm42l9r+1rtYVAH5mEhFikqZrjxZLG+zviFaEDiVxfaOEyYP09jy6qHu+lWICdygxPin9ln+Hc9vuC5B7+kQQc4wE51d+0hdPXlOeDQEfgO5K2mcd/u5f2Ea8FET3wAV7a3ue2JxoMouovDTNLbwQZH3wRd/kiXiC7usgGQoufoY5sfqwz9L3ofg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHBa1bYvrwskRyDA8aaJDAZZGLTW7YJp4Q4EkP0WiN4=;
 b=kDwpU3sEa25DyIzwsTR4ybPbWJvHYhDLZMBxi3g4RIkNCB4bxn6aGQlTM1jo38XMQo9Uql7iIjpv3yOvqHIOQ7yra+YQEVFjHAC7LOZCmL441DJ/oJGf84g5Azo7JL+rEH9nBhmyqgV3VDsyeIw+h0LFqaR5pBT0Z5QAe+58vkY=
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by VE1PR04MB7295.eurprd04.prod.outlook.com (2603:10a6:800:1ac::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Tue, 23 Jul
 2024 02:45:54 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334%4]) with mapi id 15.20.7762.027; Tue, 23 Jul 2024
 02:45:54 +0000
From: Bough Chen <haibo.chen@nxp.com>
To: Stefan Wahren <wahrenst@gmx.net>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH] gpio: vf610: add get_direction() support
Thread-Topic: [PATCH] gpio: vf610: add get_direction() support
Thread-Index: AQHa3ABYED/wT9salUWzrJ9K49lL77ICjNaAgAEGUPA=
Date: Tue, 23 Jul 2024 02:45:54 +0000
Message-ID:
 <DU0PR04MB9496B93A0336D50B8545660890A92@DU0PR04MB9496.eurprd04.prod.outlook.com>
References: <20240722062809.915867-1-haibo.chen@nxp.com>
 <8ebb5430-93fa-4239-b09a-59f35b0dd94d@gmx.net>
In-Reply-To: <8ebb5430-93fa-4239-b09a-59f35b0dd94d@gmx.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9496:EE_|VE1PR04MB7295:EE_
x-ms-office365-filtering-correlation-id: de5a348e-5bfe-43fb-fad3-08dcaac192da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Z01QcWtla0wydTNxeHFDL2RUTnNTUXVxNWttaHhPbU1OVDJsRzJteXdiZ1oz?=
 =?utf-8?B?aTRIZ09oY0NpSG8wVVJZYmN0TzhZLyt2eWliR2R4KzRqUzMwNHRtaVYxQ0Jz?=
 =?utf-8?B?Z0xaUk1VaGEzSitHTkNoVjdjRnRpOEpPSzk1U0dBM2cxQXN4cTlCNHpsZnJp?=
 =?utf-8?B?SlBtS0VCdDB4L3haa2x3MWlNM0NJWGNOTlFRMzY4UW5TeVU3dDVlSFVkSyt2?=
 =?utf-8?B?d3dZZkt0TEpibm5rY09IV0dCRnRFbWtQQUY0dlBiWXJrd3lJdS9RUnRKcnlV?=
 =?utf-8?B?MXVSYkJGdmQxRk9qd3hsYjJ2M0t5ZjZycmtmVHYzb1M3aEdadlBKc0IzZWtu?=
 =?utf-8?B?Y2JIWXB3U3lZbDhOa1lNRmZMeXJRWVV0WlVCZUM2ZjFNY1VRZUZBT1AzemM3?=
 =?utf-8?B?RVhscUtIY1NVVXc5QVd2b3ppQzNQb1N1WW1nNjJCZDFpbkoxV3pBSFhEbDVN?=
 =?utf-8?B?N1luaDNXdlVpSml6VGlTcENyODgrL3VTMmZTYUFxTU9UdmxVUE9tYjkyOGxo?=
 =?utf-8?B?eEdDaysxTWZmaEdvNUF4eVd3ZGpvdUJLTEtucE9vS0VtMXc2Y1d6YVZ2RXhF?=
 =?utf-8?B?UTg4TmszUlRXZ0JwOWd2bmR4aWhyTkp6bmNjWUZVMWpSSnMzQzlBdXlYd25v?=
 =?utf-8?B?NlhEVzcwT1RwRUpDbGRGL2s3dGllMEp3UmpRNUlmSm9YdFk5NEpycVg5c2l0?=
 =?utf-8?B?OGZ5WUVVeFZiMS9Pa3MrS2xFMHJjZEVxZkFPSnN2bXV4V3RJQ0NURWFZRmFp?=
 =?utf-8?B?d1JOUWl4cGxhWVJ1L0tOR3pvRjduT1J3Um96SjBSQk5XUXlYakZ1TkpVeGRj?=
 =?utf-8?B?VmlQT2plZnU2bzVnS2c4elRYQlV4dGFZOEQ3alc4OVlWVi9kOXBMRWliZVMx?=
 =?utf-8?B?cjVTdmxFeFc5emNMSEE0NkJmeUcvT1RlMURFc29PbzhuRlNjUUl0MnA2L3Uy?=
 =?utf-8?B?eHhEQlJJTnJ5RXB4UU5YTVRaSWpma0VxQ1hUU1REUnhWZEVXK3NOV3BEOGZw?=
 =?utf-8?B?TFV5SWJ1ODBOM3lKT2lnckREbmNUOEZZeVJBcWhYallCUVh3c0h0YVp5c0tm?=
 =?utf-8?B?cnVWTlJQdW9RUGVMbnBMT0w1OWJzSm5kS0wxNE1kOTZaNlAweG1LNnQ5QnE0?=
 =?utf-8?B?dGQ0NFpDcVQ1RHhxZU5tSEVPQnpiLytlTGNZbEZYZ0RwM1dIbDI3RFp1UEY5?=
 =?utf-8?B?bU1WZ1JHZXNxOVNPaHd1VTNpdXlUVEV5ZzVEK0piZ1N1MklCanF4UUFJaWhN?=
 =?utf-8?B?cElmV3l5NDdBQnlxbVJ6RVNuTnZ1YUZsMnFFTWlQN014T1N2R0FIWVFUTzFD?=
 =?utf-8?B?YVdIMk1vNTkxeTZZN1RaWTRyaDAyenA0ZHRpS3A2dGRNcnlhSGRCZVlxeERO?=
 =?utf-8?B?cjhmK0Rad1M5bkhnbUkxbjRWamVlT3lvQVg3MlFrMkFzMVdhd3ZFQkozd2ph?=
 =?utf-8?B?WlZBdmlnNjhTQzNnN0Fha2hZajBCd3NmTDRhVGc1Z25IZVVtcGFKNXIvUkFl?=
 =?utf-8?B?WXdQaUZXQWxuTmNNajJaU1orWmcxbkNIaTlicXo3c3hVRWc0ZksyR2RRVW1i?=
 =?utf-8?B?aEJYT0ZpM3VvWHQ5bElTemN2TTZiM2dSNjByV0VhSjRKdnBxVm5IVktCQ3dt?=
 =?utf-8?B?VGdEZ0lSTE11R3J5R21COW9qTDFJaUR1V09rQ3FxNFNLU3hJT012OHEzRkw2?=
 =?utf-8?B?MGVWUWlCdjJLcVc4L0FBNnZoQVlWQldnUjFFOHkvYjBhMFczSzhGSUpGMlZl?=
 =?utf-8?B?K2FKU3Z5cUh4RU5UdmhISUNxN2FseDlKSU5BRmlXL1VmTUgrei9EUURNYXg5?=
 =?utf-8?B?ZTRGcjVSL1Y5ankvRG9MaDJtQ084NC8vWVZ2TS9XMzlEanZGTDVGYjZYUUV1?=
 =?utf-8?B?R3ZHUzBsUFJaZ3d2SUthc25oZkdCY2owL1hPWmVCNDNiTXc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cmtlU2Vyb1F1dFVjLzcvQmcxaEErSUN0eXlBUUU0UEFLSHBVNWg5UWJ0YjB2?=
 =?utf-8?B?ZytvK2lLOXp5T2VtWllNOEYrRmlkTTd6b2NvamJRa1dNdEQyRVBiUjN6d1M2?=
 =?utf-8?B?L2k4NXdvK2N3eURkQ0J0M29UQTVjUWI1TEl6UGoxdTVIN2c5Z1JLZ0Q4aVlu?=
 =?utf-8?B?TU1XdGFzL01QaTFpWEszK24vSlU1cUFBUktWN3RwV1RmMGtzd05mZnJiYXNa?=
 =?utf-8?B?V3QxRElNaHdxS0V5UDlYT1pYWVJIdTZLUG5iL0F5NHZoN3BCUldPZG9zam92?=
 =?utf-8?B?N0xSTWM3L0wySldCekN6TXdTNmZTQkRXMDNVOXlYSzViaWtDbG9uSERVWWND?=
 =?utf-8?B?amcwc1pLaGc0dHp6c0ZRUGk5Mml5SDJKNDY4eVNib0dEbDZzWFAzWi9sSWU4?=
 =?utf-8?B?SkdRcW4xdFFlUTFkMUh1WERpWFY4ck5SUmFlVjc2bkRBeS9UN1hXVlBodFVp?=
 =?utf-8?B?Mng0ODgyQUhlUnpmSG5ET082MlZlSXc1KzdvZUhHOWlHMXRxYUJ6bnRQKzVR?=
 =?utf-8?B?K0U4dnZDZUlQeFFHd2JQNEhvSTE1L1Zkb25CRXNwNU52SlF2QUxFeGpnYTRV?=
 =?utf-8?B?QTZaU1NCejl1NVA1a3U5YjNkYjF4L01nYmFRckJUT2dSS1h3UzhkVkxFUjJD?=
 =?utf-8?B?dWtrSWNzRmNKVlRZZmRxT2V0Vi9wRUJxdkIyb0lyWEZCVUp2SWtqajZlZ1d0?=
 =?utf-8?B?SDNZRUppa2ttMEVIMnlSUERkNjJCODEwak1MWmtkQnYydGZ0Z3MySmxZdGZh?=
 =?utf-8?B?L3pMUmp5WHdVc0FaazR0c1UybzVXeG1keHljZXo3Si81TjNpd1FKTExxL1NL?=
 =?utf-8?B?Ym53SFNtNE1EOEJDc2ExVFQxaGNOd1VaNlBJTkxidngvZ1Ryd0EvTFluUkkv?=
 =?utf-8?B?MXhZaW1KSWJnaEtRMzg5YkMrWmpnRy9aa2psZ2FhSHN0b0lobFppMVdSYXls?=
 =?utf-8?B?bEdBQ21OZ2lmcXl2MHYvMURESG9mYWg2eW82NXhHZ2ROSlNqZ1poWGhtb1d5?=
 =?utf-8?B?bmptREJNMjlqZUxScmxNaWdFZFpCbi9jVnFpbm9HdDU5VW43S3FHVUt3RUcv?=
 =?utf-8?B?UXAvVXdUVndpUFU2MjlpaWNPNFRSM2hDSG8wYlJkeFdkRXRrWHQ2UE9ZSE5Y?=
 =?utf-8?B?UUV1SXRsdWFEdDJ3bFJQbTI5OHdzN2ZPZzRHRjBzQzFkTUtILy9kZEJPTVJ0?=
 =?utf-8?B?YmJ5UDErQndJZHNPOWhadFdZNXUxOGxBNHk4eVMxcy9pTFUwQWRhdjdENkgv?=
 =?utf-8?B?NU5nNjdOUmZHZXZWOUMrOFREUnJ4bUsxdHFlUzljeHU1c0VBSDFLL29xWUhQ?=
 =?utf-8?B?QTBGN0ZSZ2VGQTM1aG5MMW1yRVBGbzd0eDVDTTQ3MTRRVXRlbWJxOTlmOUcy?=
 =?utf-8?B?Z0xxVU9NOFBwUVZBQ3Y0dDhSY09IOFA0VTRvMHU4TEdZSmZJY1RJSFJPSk1B?=
 =?utf-8?B?cVVGdDRsRThsMzZIUHZDMm9pQU5yYXNxa0JXS2wxT2dYQnU1OC9xT21TNUMy?=
 =?utf-8?B?Q2hrc3g5M25yUzlaR1lQcXZIcEQ4b1ZrVFo1dTIyenFYeDBJS01FV09tdkIw?=
 =?utf-8?B?UFNmTzBtS2wyRHJhVzlvbWpFYXhxelU1ejcvbmdWMGdpb0Z6amVCK2FZZVlO?=
 =?utf-8?B?RURWVlNPOGxVVTlzTUhITkNVdVU5ZEQrZ3Vxa3g1K0Zpa0tMa3ozcXg4Ym53?=
 =?utf-8?B?Mms3UkdBdE95QnJIRzlVMk5hZkNnanNZWmFYdVFXOWoxZmhmLzNpTDlnKy82?=
 =?utf-8?B?MW5wTWhtaTZZbTlXQjRXTUxLam9ZTTQvMjR4Ukh0c3NCbzEvTGJMWVdjSWRn?=
 =?utf-8?B?aFFhZXNjK1BFVkNQNnNrbFhlZFg2R0tVVGhpT2hnWDNXR0lNZ0xtNnZRNnd2?=
 =?utf-8?B?MFhHeWh3ZTB3ZmxWOGlQT29qcElOZEVNT051ejk3a016UTFRdnJ4SDBtWklF?=
 =?utf-8?B?SkVRZEZYWFFyaTZ0WWYza0JweTFSaXpjM3MwWUVhZjRCdjlVUndIRmNEY0d6?=
 =?utf-8?B?WVJTMUVwY3YzN3BoT284N0QvZlFFWEJFOE0wM2YyeXYvcHNjQ3RXVVVWSm8y?=
 =?utf-8?B?eUh4YTFVdjR1cW1hQTBaV0UxbjljR05wS3VUL2M0aUdRWjdUbko0NU5ITm02?=
 =?utf-8?Q?j4Pg=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: de5a348e-5bfe-43fb-fad3-08dcaac192da
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2024 02:45:54.8679
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 43VMvqRwznXD4UWYEwejRsBoknNTq88X1OTprlpQL+dtkqzmxDz5FI3Pp2r4cX5XM++RvbCfS4FUnvbEqjx5Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7295

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVmYW4gV2FocmVuIDx3YWhy
ZW5zdEBnbXgubmV0Pg0KPiBTZW50OiAyMDI05bm0N+aciDIy5pelIDE4OjMyDQo+IFRvOiBCb3Vn
aCBDaGVuIDxoYWliby5jaGVuQG54cC5jb20+OyBsaW51cy53YWxsZWlqQGxpbmFyby5vcmc7DQo+
IGJyZ2xAYmdkZXYucGwNCj4gQ2M6IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnOyBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiBpbXhAbGlzdHMubGludXguZGV2DQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0hdIGdwaW86IHZmNjEwOiBhZGQgZ2V0X2RpcmVjdGlvbigpIHN1cHBvcnQNCj4g
DQo+IEhpIEhhaWJvLA0KPiANCj4gQW0gMjIuMDcuMjQgdW0gMDg6Mjggc2NocmllYiBoYWliby5j
aGVuQG54cC5jb206DQo+ID4gRnJvbTogSGFpYm8gQ2hlbiA8aGFpYm8uY2hlbkBueHAuY29tPg0K
PiA+DQo+ID4gRm9yIElQIHdoaWNoIGRvIG5vdCBjb250YWluIFBERFIsIGN1cnJlbnRseSB1c2Ug
dGhlIHBpbm11eCBBUEkNCj4gPiBwaW5jdHJsX2dwaW9fZGlyZWN0aW9uX2lucHV0KCkgdG8gY29u
ZmlnIHRoZSBvdXRwdXQvaW5wdXQsIHBpbm11eA0KPiA+IGN1cnJlbnRseSBkbyBub3Qgc3VwcG9y
dCBnZXRfZGlyZWN0aW9uKCkuIFNvIGhlcmUgYWRkIHRoZSBHUElPDQo+ID4gZ2V0X2RpcmVjdGlv
bigpIHN1cHBvcnQgb25seSBmb3IgdGhlIElQIHdoaWNoIGhhcyBQb3J0IERhdGEgRGlyZWN0aW9u
DQo+ID4gUmVnaXN0ZXIgKFBERFIpLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogSGFpYm8gQ2hl
biA8aGFpYm8uY2hlbkBueHAuY29tPg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy9ncGlvL2dwaW8t
dmY2MTAuYyB8IDE5ICsrKysrKysrKysrKysrKysrKysNCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAx
OSBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncGlvL2dwaW8t
dmY2MTAuYyBiL2RyaXZlcnMvZ3Bpby9ncGlvLXZmNjEwLmMNCj4gPiBpbmRleCAwN2U1ZTYzMjNl
ODYuLjA4Y2E4Mzc3YjE5YyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwaW8vZ3Bpby12ZjYx
MC5jDQo+ID4gKysrIGIvZHJpdmVycy9ncGlvL2dwaW8tdmY2MTAuYw0KPiA+IEBAIC0xNTEsNiAr
MTUxLDE5IEBAIHN0YXRpYyBpbnQgdmY2MTBfZ3Bpb19kaXJlY3Rpb25fb3V0cHV0KHN0cnVjdA0K
PiBncGlvX2NoaXAgKmNoaXAsIHVuc2lnbmVkIGdwaW8sDQo+ID4gICAJcmV0dXJuIHBpbmN0cmxf
Z3Bpb19kaXJlY3Rpb25fb3V0cHV0KGNoaXAsIGdwaW8pOw0KPiA+ICAgfQ0KPiA+DQo+ID4gK3N0
YXRpYyBpbnQgdmY2MTBfZ3Bpb19nZXRfZGlyZWN0aW9uKHN0cnVjdCBncGlvX2NoaXAgKmdjLCB1
bnNpZ25lZA0KPiA+ICtpbnQgZ3Bpbykgew0KPiA+ICsJc3RydWN0IHZmNjEwX2dwaW9fcG9ydCAq
cG9ydCA9IGdwaW9jaGlwX2dldF9kYXRhKGdjKTsNCj4gPiArCXVuc2lnbmVkIGxvbmcgbWFzayA9
IEJJVChncGlvKTsNCj4gdGhhbmtzIGZvciBzZW5kaW5nIHRoaXMgcGF0Y2guIEknbSBmaW5lIHdp
dGggdGhpcyBwYXRjaCwgYnV0IGNvdWxkIHdlIHVzZSB1MzIgdG8NCj4gbWFrZSBpdCBjbGVhciBh
Ym91dCB0aGUgcmFuZ2Ugb2YgdGhlIG1hc2s/DQoNClllcywgdTMyIHNlZW1zIG1vcmUgY2xlYXIg
aGVyZSwgYnV0IEkgbm90aWNlIGFsbCBvdGhlciBwbGFjZSB1c2UgdW5zaWduZWQgbG9uZywgc28g
SSBrZWVwIHRoZSBzYW1lIGNvZGUgc3R5bGUuDQpJIGdvIHRocm91Z2ggdGhlIGhpc3Rvcnkgb2Yg
dGhpcyBkcml2ZXIsIHNlZW1zIG5vIHNwZWNpZmljIGV4cGxhbmF0aW9uIGFib3V0IHRoZSB1bnNp
Z25lZCBsb25nLiANCklmIGFueW9uZSBrbm93IHRoZSByZWFzb24sIHBsZWFzZSBjb21tZW50Lg0K
DQpCZXN0IFJlZ2FyZHMNCkhhaWJvIENoZW4gDQo+IA0KPiBSZWdhcmRzDQo+ID4gKw0KPiA+ICsJ
bWFzayAmPSB2ZjYxMF9ncGlvX3JlYWRsKHBvcnQtPmdwaW9fYmFzZSArIEdQSU9fUEREUik7DQo+
ID4gKw0KPiA+ICsJaWYgKG1hc2spDQo+ID4gKwkJcmV0dXJuIEdQSU9fTElORV9ESVJFQ1RJT05f
T1VUOw0KPiA+ICsNCj4gPiArCXJldHVybiBHUElPX0xJTkVfRElSRUNUSU9OX0lOOw0KPiA+ICt9
DQo+ID4gKw0KPiA+ICAgc3RhdGljIHZvaWQgdmY2MTBfZ3Bpb19pcnFfaGFuZGxlcihzdHJ1Y3Qg
aXJxX2Rlc2MgKmRlc2MpDQo+ID4gICB7DQo+ID4gICAJc3RydWN0IHZmNjEwX2dwaW9fcG9ydCAq
cG9ydCA9DQo+ID4gQEAgLTM2Miw2ICszNzUsMTIgQEAgc3RhdGljIGludCB2ZjYxMF9ncGlvX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4gKnBkZXYpDQo+ID4gICAJZ2MtPmdldCA9IHZm
NjEwX2dwaW9fZ2V0Ow0KPiA+ICAgCWdjLT5kaXJlY3Rpb25fb3V0cHV0ID0gdmY2MTBfZ3Bpb19k
aXJlY3Rpb25fb3V0cHV0Ow0KPiA+ICAgCWdjLT5zZXQgPSB2ZjYxMF9ncGlvX3NldDsNCj4gPiAr
CS8qDQo+ID4gKwkgKiBvbmx5IElQIGhhcyBQb3J0IERhdGEgRGlyZWN0aW9uIFJlZ2lzdGVyKFBE
RFIpIGNhbg0KPiA+ICsJICogc3VwcG9ydCBnZXQgZGlyZWN0aW9uDQo+ID4gKwkgKi8NCj4gPiAr
CWlmIChwb3J0LT5zZGF0YS0+aGF2ZV9wYWRkcikNCj4gPiArCQlnYy0+Z2V0X2RpcmVjdGlvbiA9
IHZmNjEwX2dwaW9fZ2V0X2RpcmVjdGlvbjsNCj4gPg0KPiA+ICAgCS8qIE1hc2sgYWxsIEdQSU8g
aW50ZXJydXB0cyAqLw0KPiA+ICAgCWZvciAoaSA9IDA7IGkgPCBnYy0+bmdwaW87IGkrKykNCg0K

