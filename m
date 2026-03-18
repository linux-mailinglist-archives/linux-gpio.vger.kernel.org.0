Return-Path: <linux-gpio+bounces-33765-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKmVKdDCumkGbgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33765-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 16:20:48 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3E02BE150
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 16:20:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A5FCE3037901
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 15:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6834B3090D7;
	Wed, 18 Mar 2026 15:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Sut2LwCw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012032.outbound.protection.outlook.com [52.101.66.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B702367D9;
	Wed, 18 Mar 2026 15:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773847033; cv=fail; b=ffRbyd+KmmxiaZMJsiZPfANflv57G+0/D7SE+8ZCaWDwxCousJtvjZniUC+fZtqmEHcTAXub4nUcc1oh4cv3OrQuBGoL1hyWVxB3bWWy27d2/ZjsHp4n+fctgN/G3l0ukrmcQHNkSbBP+F4sjQg3XGcW4gIS8/lR4WV56eHlVos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773847033; c=relaxed/simple;
	bh=c9ojM3iVs5nBFZyR8ClfSQNvomfpb1AXzoElwzpLkNU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Q4X1vfgdDMgjKo2woePoSST0lg2QPdSJgB+bG7fHOPOcasbBlm0d3U7aqPKoZOvBkjNnM9cTXA8TGnHJf27oKBuUkKZvr0og0qroAXUc//3+40HA8TGFS5nqzw6Fo6Kr8heffkXuKKiYaqP8jWR8TWi36kHND537AOU0Icj4mkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Sut2LwCw; arc=fail smtp.client-ip=52.101.66.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NP8iNla2P4Mgu1nmvQMbuHfCm9HqdqgOtg71r5U9P6Y6+NUnCDs7W/OUE5+R6Ufm6jD/qi3lCmJWvO7sXdGWG6QU9i8M44Ft7Gl6JSgzvjRLt5MgAFhOsI1w722iDT3uXf0yBubKXm/pBAqZC9vYSaAIAgN8VvIAHOGjW9cJZWuz+xPw0U7SvJ1S4DnqDxFocYN8k0bSacaEM1Arrf2ofnWUsGO3xehXGaOE6SyZ74gjRiKH8V/lc5PRIsxOgK7GD7cqhbYVCzqNHFGqoU7KDQXKegJOO74vaqSxQEyvISQqKQaQtTzicyS/p4d1SA6heTYGfFfLWeWRHZ+O22F0AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KLr1Cfto2dIv6AANsFGhhEytklokghLOfP3HeCmxBJ4=;
 b=zQ0qrLzksUTP8l31s96zuADTmsj0rx7GhbMnjdX7rTqA1PDy3ZqGgCvVy/f4MqDcpl6ID/hykkAS8xej4U2RVkJ+zKJfDhyYj+Fe3CEOh0H3nWXwWKuZqPTq5V6PYTmWkY8V/rscth9hy6McD3ofLBO+A1EteBj9TqpZpBZ8EiC/l9qkRXD83rZ6hys1QZ/yo47gf5VYrSNE6ApG5AWJPRMVbfZFWDCs4WmiahHyBG+cFsiQEt8rauZjV9G4ty2g+bZevTnOX+IDpOBBBi/2cFiAPe0KZTxBVkfWBg4qgyIgGq65SKa8K/wR8Klb0hW2EZiLgaEIuplhH1cO2kVr1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLr1Cfto2dIv6AANsFGhhEytklokghLOfP3HeCmxBJ4=;
 b=Sut2LwCwa169E80UhIQePrn9xrpPEBHDLOVX5UhxKgcObJbIk0nJ/Hxb8TSdAzbwa8eGzu2T7RZas3jzQx2KvzUz8ke71C2h/rIZ+V3nNJzeAIdPRJ7fMIG9YiGOukVfqtw895llzQdWIMhmKiFDIr9oSs59ncQPx2HU2mGGa9AYxGSpC+8sW/ZOGohFpxABgS6HdFaw0aJbz63/PQIycNRUvbfcFmOGst45os3R6IJ0fcIFswkN3F4sCFcL/DcIqyTdaSXdw8oZeLgkfI7/z3NdcOkJ+R0NVSGJPfKgCGoa8LXyyWqFumCi3DkJQT8WomP0yOMhMbyU/xxHbcvFRg==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DU0PR04MB9323.eurprd04.prod.outlook.com (2603:10a6:10:356::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 15:17:07 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 15:17:05 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Linus Walleij
	<linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li
	<frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH 1/1] gpio: mxc: map Both Edge pad wakeup to Rising Edge
Thread-Topic: [PATCH 1/1] gpio: mxc: map Both Edge pad wakeup to Rising Edge
Thread-Index: AQHctkd84NlNZgrn1Uqpj8qmiIZ63bW0JXmAgABAIlA=
Date: Wed, 18 Mar 2026 15:17:05 +0000
Message-ID:
 <PAXPR04MB918564F8768B5502B53879CE894EA@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260317195116.2301985-1-shenwei.wang@nxp.com>
 <DB9PR04MB8461D0BE47F09CFF41492A60884EA@DB9PR04MB8461.eurprd04.prod.outlook.com>
In-Reply-To:
 <DB9PR04MB8461D0BE47F09CFF41492A60884EA@DB9PR04MB8461.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|DU0PR04MB9323:EE_
x-ms-office365-filtering-correlation-id: 7a72df59-b49e-47c3-eab2-08de85016a27
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|376014|366016|7416014|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 aSIewueXFHFuvzWzc3mE72BTp7klf+XRQgcQbc1vmUf+7EGEkFAypqOSTlLcwveOln+mxP2/sipUOZ8kJGeik9U3f9MjRe3b3giIyW81yaIDEondgjRrqsVGdE+r+U6P4lng54grS+XKZSbEEgwLpZ6tREmF5u8EkCIVRQIrWKtZNnMUTHdnBM3sk8LPka4S+MsUx1+nPOxr/yDLggDVFu5wk6l1ckDmBJjJgj3khk+f6TITdlv86fuanl77RWwB6pWtt2/4GYB4OhKPi40e+lMk+jJhySkW8D52E6fLJW+GFpgnGk/yJDEPxTmVuMIyXulWYiW4CKmnoMsOUVPlOjNmRjUsMg7PKelEHfVtx57gP8bfJbFAT8pTsgJ7Y80uqh89P0dY/koKxBZDMgdH9pivYuaPavRd47/8/UzEL4bMEAndlzjxfRZAUi9odlTOlaZXALOpF0d6fvI1hKw4VDxX2tC27d2+liorlesw5Yr4v8X5SSRQqHdVcUfrxebenJbQX5+gnxAXU7Leos0Qr5oN1WGHy1MDVEoPPEpbMSI6sJ3NXCVYIZLet3GeDJK4YU9KtOniXJWmk411Rdyh/1O3LHTWxWUaRuibDkXhf1bg9boZ7UmxsMVULsrRc+gyrEdwFI38bKYDeDJPs5FmixaBXP4YqqOEBEuFrLp2ELTq4+nZY4m3wp9OWBDXfid+lIiPW7YR5mgh5fZKAQGGUZHucXBjhZWZDjhX4gFJr990IppSDpoD9jZkzJP1+HlWccT6jAeCBZ1LkdMJkVVY5ZHDhjjXApooo0s9JNhlEB8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(366016)(7416014)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?f1sc4Uv2rfEYWqhBlmjDsODdrcgl/UmC9qL7ziMfSTZy474gB4hRhtjP9UZn?=
 =?us-ascii?Q?9N3uG70ziiuaOjCMPwLLhTGstfZ+7YAkJjA0IDQdVcaSXhpsNJ6vsrFxgFXK?=
 =?us-ascii?Q?EANPhiVQh+0bd1SZ3Gnrz3xLDT/pHr8rePIP8stcysSIFHTg4GqiKMiHBIMW?=
 =?us-ascii?Q?Ocw934LBzzJRxGolEh79aQ0OzkEkrkEL3Xx3Un2PgPNRBZ1vbycHLVlWGg76?=
 =?us-ascii?Q?UMAMjdvtXIBUPyJ9OTqhyk6ibV+lpcxsu0Xnwa7dQBSY5zC8rUT89NmowWcO?=
 =?us-ascii?Q?KVyuHxFkkxIhpp4cz5s79riymMN9OOpjtanWx62IbYrS24a8CHQyUKgsS5DC?=
 =?us-ascii?Q?jEF1zMajJo3IYXL7BTHwlqQsDl45Pkf9BWubuLaSLon8Qp1uLMsSYQHoTMpX?=
 =?us-ascii?Q?T8G0mX+SC1yNLiEPQ7NnS69mMTKg1CY8UTSYbkbAnL2py+9/keRUJ1YWNeqP?=
 =?us-ascii?Q?y2aj0/xWMkgF2MS8LiB1pjEbIrlYmkfwGDT8Vxu++mynF9u5zV5n4DrmaBPQ?=
 =?us-ascii?Q?5VcZp+zOQq/IbcZYUgacBbYv3g5Vhi6dG6fzMYIGTm4YfHjq4iAI5O2G260u?=
 =?us-ascii?Q?bWpa7/odPNiK5HXBjSBf72AVYeynigrXvYQHpIYZmVEfPRVt1qYo5We4pwDb?=
 =?us-ascii?Q?IiKCs8kHfI1NF4Ur3n7+Fw9PNnlTkJ3aNaBXW/9zDaVvrD0YLeheeWgI13r9?=
 =?us-ascii?Q?YwB6jg1jP+2vNpzLKFn6MDC48tGrfxiJMLqBmiIqFoZHXm+EL2MivZdncLIi?=
 =?us-ascii?Q?pwVyMc8PAIXeAe2LohxWFXbcOR2S1/ZGZqlyDe4KJPFZ61dcXNyE1JIhyMJq?=
 =?us-ascii?Q?pPCV6e2vToGyWQ1e6gDrQC44mY5KJMuMLhldqhHgMXjKLHZ8tZrLal9lNTyr?=
 =?us-ascii?Q?rzqw+XpWE1RBbIYfPs4jhZemXSycHIJhbd/qJEOAhWXEhgof/TDJnEzxQdtc?=
 =?us-ascii?Q?9ZxRJX5FHfTDcn4hajIoKkQAZCeKOoeNq+Yl/ZmmpvRWFXpGPlazn8nBW99r?=
 =?us-ascii?Q?tSmIET93u+QZgxDmQovWj12KEtfipSvATOJJEuWdsbFA52DihDkT0gNdQHQ0?=
 =?us-ascii?Q?8062cDk+E4Cn8M+Exp9HZzvNO4YcJZD7k5BZe+4ocjdbVALWdtSfUDhEM/C2?=
 =?us-ascii?Q?wSSA/VZ94te7tQ266zRCFGn8WlMYL+bs3wysUBTH6R1Jh6Y8g4HmUM1s+/Ir?=
 =?us-ascii?Q?ySbjkMBXv/MTjJlMKI7SAAVy7LTAvVRQVoJfpXZUFRebKpRNge70toQuOONz?=
 =?us-ascii?Q?Gr3w+/ocb9OnM5HAst3n0seBpvxB9bkRa+AhGHY2TH504Hrx1abYiP8qw5Iz?=
 =?us-ascii?Q?0wSWafQjHmTHgPdTmut5BXP7DB4ASJrnzv7aep2WK5TnD1TPecZiBW8TCplt?=
 =?us-ascii?Q?xInZ/PQ+HkcSat3GJcogY771fhqos4NflQLaAFezDOipDoQDcLMhlRtKs+QN?=
 =?us-ascii?Q?mh8CjAZxp3QOhL76gO4dpdpT/nBWXKMhO7bJx5GWo6bmlCFxrlEDZXe5Rmu5?=
 =?us-ascii?Q?A2FKfCl/h/j4P/my03CmLmRwUllWMoX3GKaNXsSiK64i6cbz1upFPBwiz0ZU?=
 =?us-ascii?Q?86EnRBxuckB5x/NaEuBydXXc2QBnzMWsjJtMiFu4ILNbHSPV4HANB5rfciLU?=
 =?us-ascii?Q?BMx0cL0G7zXDs3o+TA2pzN5qqQddm2/8Dr8pjl6w2tICiYREpcQ3QdQo1sY2?=
 =?us-ascii?Q?phktImGzhYHh9hLD1+V6SHPCyOfLn6bt6CKojHwEwCpPuFmr?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a72df59-b49e-47c3-eab2-08de85016a27
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 15:17:05.5200
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /oUsOTSuS/XHaTnDFr7aK7CGeSw85NsCvKtLkqZIlV1rkEkEGIDknhJPpZJG1g1RWsl4pm9un+m2xJOdUPIymA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9323
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com];
	TAGGED_FROM(0.00)[bounces-33765-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.986];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.dev:email,infradead.org:email,pengutronix.de:email,nxp.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: 1F3E02BE150
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



> -----Original Message-----
> From: Peng Fan (OSS) <peng.fan@oss.nxp.com>
> Sent: Wednesday, March 18, 2026 6:19 AM
> To: Shenwei Wang <shenwei.wang@nxp.com>; Linus Walleij
> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Frank Li
> <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> <festevam@gmail.com>; linux-gpio@vger.kernel.org; imx@lists.linux.dev; li=
nux-
> arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; dl-linux-im=
x
> <linux-imx@nxp.com>; stable@vger.kernel.org
> Subject: RE: [PATCH 1/1] gpio: mxc: map Both Edge pad wakeup to Rising Ed=
ge
>=20
> Hi Shenwei,
>=20
> > Subject: [PATCH 1/1] gpio: mxc: map Both Edge pad wakeup to Rising
> > Edge
> >
> > Suspend may fail on i.MX8QM when Falling Edge is used as a pad wakeup
> > trigger due to a hardware bug in the detection logic.
>=20
> This hardware bug exists on i.MX8QM/QXP/DXL, or just 8QM?
>=20

Only on i.MX8QM, as described. The system fails to enter suspend when
Falling Edge wakeup is selected.

Thanks,
Shenwei

> More information better to add why suspend may fail.
> Do you mean not able to resume back because of failing to detect falling =
edge?
>=20
> Since the
> > hardware does not support Both Edge wakeup, remap requests for Both
> > Edge to Rising Edge by default to avoid hitting this issue.
> >
> > Fixes: f60c9eac54af ("gpio: mxc: enable pad wakeup on i.MX8x
> > platforms")
> > cc: stable@vger.kernel.org
> > Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> > ---
> >  drivers/gpio/gpio-mxc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c index
> > d7666fe9dbf8..f8300690ac05 100644
> > --- a/drivers/gpio/gpio-mxc.c
> > +++ b/drivers/gpio/gpio-mxc.c
> > @@ -589,7 +589,7 @@ static bool mxc_gpio_set_pad_wakeup(struct
> > mxc_gpio_port *port, bool enable)
> >  		IMX_SCU_WAKEUP_OFF,		/* 0 */
> >  		IMX_SCU_WAKEUP_RISE_EDGE,	/*
> > IRQ_TYPE_EDGE_RISING */
> >  		IMX_SCU_WAKEUP_FALL_EDGE,	/*
> > IRQ_TYPE_EDGE_FALLING */
> > -		IMX_SCU_WAKEUP_FALL_EDGE,	/*
> > IRQ_TYPE_EDGE_BOTH */
> > +		IMX_SCU_WAKEUP_RISE_EDGE,	/*
> > IRQ_TYPE_EDGE_BOTH */
>=20
> For IRQ_TYPE_EDGE_BOTH, use IMX_SCU_WAKEUP_RISE_EDGE.
> Do we need to also add a check for IRQ_TYPE_EDGE_FALLING?
> Saying not support IRQ_TYPE_EDGE_FALLING because of xxx.
>=20
> Regards
> Peng.
>=20
> >  		IMX_SCU_WAKEUP_HIGH_LVL,	/*
> > IRQ_TYPE_LEVEL_HIGH */
> >  		IMX_SCU_WAKEUP_OFF,		/* 5 */
> >  		IMX_SCU_WAKEUP_OFF,		/* 6 */
> > --
> > 2.43.0


