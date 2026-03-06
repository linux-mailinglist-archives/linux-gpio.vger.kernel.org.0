Return-Path: <linux-gpio+bounces-32629-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cM2UBcF+qmlhSgEAu9opvQ
	(envelope-from <linux-gpio+bounces-32629-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 08:14:09 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AB11E21C4F4
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 08:14:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0ED4D302490D
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2026 07:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98F9A372B32;
	Fri,  6 Mar 2026 07:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YdO0GjZt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012019.outbound.protection.outlook.com [52.101.66.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DE5EEBA;
	Fri,  6 Mar 2026 07:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772781244; cv=fail; b=Zo9K2VnPBbNUpHfDi2d09eJpMsCXAeyH79mK7ww0fO1tS9Jz7U+w1OWPAJMM96fTHbb9cR1ynBdgC//I/Sgwu5py5W3AJUh3uwxkMitOhEHgksPg+YPfcXVWGZXIAd+h0PZvImEMDrNwJvdzuktkgwtSM6I8ml5+mk6RyX0/nNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772781244; c=relaxed/simple;
	bh=c8RERvrNFVXu+J+2v69DAU5iMgqAPJFJjxX2TKt/Opk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=U7XIdp3XStYHASm86J5OBBzsZ8n3SojEsp8G0Q6ekTkbxFMwK1JijYoxu2dkuiIqbtIHJs2wGJzeJgwR+y+vJgIh4pyPCGFDjtmFLBw9i2bv9DGUjIMgroWxVmmKt01EKVgX6+89i2IeM8yG79TEW8P5WQTbrLST9arwY2ZMnsM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YdO0GjZt; arc=fail smtp.client-ip=52.101.66.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d1AP5a4Njb/J5AvAydjuGirZEYVbsR1Kia0JsgSF0vhdlLnY8NQa0fkjobjYmKEwjdrg5SystxDWVUZYD6B3taY6epnNDyrW2ZemCtbeeRWDMiac4zaL8rvAD1PgbwI1918d9wucM2G+P9APApn3KYmM/7EAna+WTdsGnOoPieFVXyFf5BO0EPHLz7axHHPlcbkqJJigE2pfuetIRzLxHcsi/zyu+o9Ok8rvNmbVz6ahDImUhOPGCOQqb4mBe8iRLj43YEfuw+GNN0BvHrLJvCQLQFLi7HYayEWAIHwUW3+/I/jatrtl1ag5BDvWMibo2TKlbaAzqDjdYZypWTK8BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c8RERvrNFVXu+J+2v69DAU5iMgqAPJFJjxX2TKt/Opk=;
 b=pHXc2JAiNdR9mpY1EM9GVCKghx86cn+aDmmp9toCDvBRYVoah+WFvDvZh8VzyCk76pL3YRZMzqlM3Cn7ItLRDhQ7Bq7Mz/ujcloeHajtPisPu0IxpXuqnM6iFTAPWRedqPYjs5EN0p+9/DJM1t907slus7oC0PctjBUzqubdzqX4JCoMEGJSCcpL4MjVlDKPhKfgJNoZsX9PgddIcn/X6bqYIoYQp3P9Dq8G2zVwiqSSTHj4isni84wSuFOfOk1XaDKUumG30umUdY6uWp7BNt4P5lt1prFvOgZbtDevPaGZFyNqJK79+6GERLcGd45ZvGtaqH8L2wG4HbmEw/dHew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c8RERvrNFVXu+J+2v69DAU5iMgqAPJFJjxX2TKt/Opk=;
 b=YdO0GjZtEzK7qSMfFv0xNFTLw0SZlgfY+3/JBDt4rfEOdihf86hakKpk4uVYNlGCdDsEn+CDZcF33ebs/NLm0T+Ovhs2WIYL5tofthEo9/TijYCy0ZSm19S0Db40Al5jUhbCT7bs3pbh9OMA+jnb/a1bp1ObsbN0u7JLReQ6TUDMuDZzXrMuJAYwasA0hOuNRjNic2A+x2wN8P3yLFOgR1rHmjfBv6VvYjOnNbksEFXolj4x6rZ6ueWYnouNrTxJdkAUn1txsPlz6G3gyVpQD9bz0n7ozlH7geWtKb6A1iJOQeyr9jIHaQoMJsjKqdZ4YqxxRlz3viXUn4CQRIf7Wg==
Received: from DU0PR04MB9299.eurprd04.prod.outlook.com (2603:10a6:10:356::7)
 by AM0PR04MB11996.eurprd04.prod.outlook.com (2603:10a6:20b:6fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 07:13:59 +0000
Received: from DU0PR04MB9299.eurprd04.prod.outlook.com
 ([fe80::43b2:647b:5320:225a]) by DU0PR04MB9299.eurprd04.prod.outlook.com
 ([fe80::43b2:647b:5320:225a%6]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 07:13:59 +0000
From: Aisheng Dong <aisheng.dong@nxp.com>
To: Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky
 Bai <ping.bai@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	dl-S32 <S32@nxp.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, Linus Walleij <linusw@kernel.org>
Subject: RE: [PATCH RESEND] pinctrl: s32: correct kernel-doc bad line warning
Thread-Topic: [PATCH RESEND] pinctrl: s32: correct kernel-doc bad line warning
Thread-Index: AQHcrTNBYPJjVMuAl0iT2+OjSQqZm7WhFwzw
Date: Fri, 6 Mar 2026 07:13:59 +0000
Message-ID:
 <DU0PR04MB929989AC3592BAF25298F213807AA@DU0PR04MB9299.eurprd04.prod.outlook.com>
References: <20260306063411.2041232-1-rdunlap@infradead.org>
In-Reply-To: <20260306063411.2041232-1-rdunlap@infradead.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9299:EE_|AM0PR04MB11996:EE_
x-ms-office365-filtering-correlation-id: 16b58468-1eb7-4808-8d48-08de7b4ff004
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|38070700021;
x-microsoft-antispam-message-info:
 HBvjxRb6BofNRlQU0q+IOMU2XRHouwuV6u/7cKPduePJuYJu+Vr5tPWksKrb6yWv9y5BJwzgcoQ3N5foXjrxiVXzTrV7H2KwT48iu4C+6cXCOXxqtH3L2E67cg+YwpkSewDHQuOg9Yv+its59gzXy1l9xChYU12Olu+GOKNA7iVWKkzVmgI79TUR7ZeQl/3TRwthtMFGrydCfFwQeoEwLULjXPEKFFsenXVYEEdEr9O0jk9f4IAvRsnoxq7SBSLsQO+Q8kym0KL6SCCDlDmQiXGwN91QhdFPqB8bLIhoE8afeUPwTVoUycgbJQ5h5rF+ygqpm98og81xQYD+ry1y2EGlllffFX8V2MEYkcaTzmoXhEp8LIVc1CtXfijfiyaRjvQqr2+tLtPNinEX6Q3zLdIzNrB4URrmILrZ0wlIADV24g8OP2nSoVKiu+SR77OyRH3hdHRkdXiAjxNXojtxEtqlXFYAPCmi+SRknguVGRvgDZ4IXOR93WKm3lPg/W9wRMwEOa2Rb4w0r2i9/ifAk6vvx1/qWS4I0mPkyitw5zd0RN7b9J+/1Z1BnenVF8wAQpDmu79UnF4FUaW3RJSGj85aNCXu2fMzJNdgqwHVXHh0FETkWs6kPHBXLJaMJgJOUBqS9EnHp7Ktm1ITqsjzgGxCbV1NwA8Lw55ZbtFUmdKVFsUJia7ZC2clC7ZGdR+WIcw347pptrWnd2sdyn1euly2sI4dOnVpC1JLBS4xkBbJlKu4uykQMAydn9y1Bz2zN80xqdnK9yzyhdA9HAisEAvbnPzfioBNAhb+vr0lTxc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9299.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?yDDQkSxc7HLw/Ps8KXMg+BvZG9SbnkPbKVVj3DVc4GOSBo1Cb49i418trNd6?=
 =?us-ascii?Q?YX2SRv2mC37zYGe9movwHtVsptcjuiDBYvSs8e/vnuarIaVFGXj5TDMgfhCt?=
 =?us-ascii?Q?lr67HjffD9HNti1i5UZSLx2wHB0V+wUwmNwk3YNmupvtnS8fxp8mvI9ng8Ng?=
 =?us-ascii?Q?l14l/g8qeNHkwMrRGZIkU/BEs9GcBw4DlngLJCHPF0WSjYfG2FC6d/TVvLpR?=
 =?us-ascii?Q?4tCMWSmU4hPz9hwWvzBNIxITNrndzrphIEMumdS61fix9XGbgKl+EuuZGmsn?=
 =?us-ascii?Q?7N5JGYO5VhCglhABu7hwCtu7EAymqmkCdto3TTfxB6tc/mfojorEdia9F9Mw?=
 =?us-ascii?Q?ATorTlJ4Gnpb6dvw/U3Lf/zdCAV9p5yZVkLUknInPJy9FhloQ6SHh2+u17FN?=
 =?us-ascii?Q?OANl+wvXXRMn1j4U1wgNnkeXxPK+VrjzSM9Hkx/U+WO6PhRTtBVdmVE6y7nq?=
 =?us-ascii?Q?u8gWHsBfCaoo9WmyzNJvebIsQq+82GQtFfuOCMBrsYL2mMtfy9etsN+75PCG?=
 =?us-ascii?Q?3pIWzU2IDvnOU87RhrhY15eZ40MKAN4agc00xv8e1+7Lv/srpcZHYf6cqY4N?=
 =?us-ascii?Q?5YS8d2L1iX95HjJ0nMRc3mZ7YB2ZYSTBYDugO84as3JW7ilDv7h+0DZZpni4?=
 =?us-ascii?Q?/NdVIn0OWzXRDwJeiflT0Uxls5j12dnhnwCyIfcDjx3GF8eXm5MDRvJjIi3N?=
 =?us-ascii?Q?8DUcRMngaOS/7L2xLybW7yfpQd0WWIFKtmntSkKN9xcXyUtN6sQeuGX3K91R?=
 =?us-ascii?Q?ekGMlsPqCQ9D9QcIlh7MktsjxBPsb2zZqUp4/3GR8gKJbhtUaY2qsXNWU5io?=
 =?us-ascii?Q?FrXEgOxVY7ChfSiK9PBikjr7arJpL/52Z8YDNkpphIF3wZD9+J8rF34d4OC+?=
 =?us-ascii?Q?q3aZL13VNynjLGG8Bb877Rkn05FsURvlHnqy3Ys/UAoDFp02qs9XylvTnTvq?=
 =?us-ascii?Q?5iyAy5mRvpwu6EuQ4bH0ULKAipmil9K8tW0cLLNA/f6UIJBd6x1FSkmOCQ4x?=
 =?us-ascii?Q?LpNvpWlJAsCFm/kkG5FkVeMeQMak8Q07YZgk/T+hG6j45TLNfOHk1PJu/Hvd?=
 =?us-ascii?Q?admBJMXhWGZ9pJ9PwlKuzRgmNdRzPvR9IOT9q5j2x+LojLQWR0W9QBK2Hq32?=
 =?us-ascii?Q?cC2WloHNKGmylh03X9OifFA0T5tU22Yj5cDoPWNxtZFjUqKo3ZgqEOvJzE6b?=
 =?us-ascii?Q?j4TCEslb9oUUST6uR6oXyGxmaBBGd8ddVmHGv4yOQVTMAz//qkSzPufo9UO8?=
 =?us-ascii?Q?JP1uYYePvx6GE1TvbUw7x63YElmDgfYzIrW5ZP7e03owkVeqrw7V0zmiWILo?=
 =?us-ascii?Q?GGZ4U7eVZkwO3/y8plqBjQZvwsTDNBDMiFMDjyHOkw8TAE+DaUWoHZe/AY/x?=
 =?us-ascii?Q?rZX4kr3B2xOGDvChJQ4Rak0C2DoMX1sv5oWkqmNR2+52mmSPdh+7Y+1hXDXa?=
 =?us-ascii?Q?1NmkVx2i8EHwgHod3LTAbzoPff0DpNQjbU+9xm4rbv1UF4C/MTV5riyys16k?=
 =?us-ascii?Q?gH/4K5G/id+gygFb8Is58oMbxjDtaI6rZB2G1aOfhMtuQyfUqYyKHgT+v0Mb?=
 =?us-ascii?Q?RnCAt/B9NBMoT6W3U9IXM+3ZdT7+xliQBJNmEQOxECPeQlyFu/aDhyBqGzvZ?=
 =?us-ascii?Q?OctYwBRvNFleIllBpzfVNn3ol1t/owUGXgWpj/3lwyBP2z0oQH/qpJMNhOhI?=
 =?us-ascii?Q?dJ13q2d7H3InHPK0OTqbKSOWEn9AOtpsxb+vz3BtExX8gd03?=
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
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9299.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b58468-1eb7-4808-8d48-08de7b4ff004
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2026 07:13:59.2314
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dgn6FsrWaqaNeh5xw3IrB/M2x4gF54h9CVIgcL1zkWQ4qxI0Mqu3a6rfI+AIXLRdZDK/y0JQZhkvBVVCl7XOcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11996
X-Rspamd-Queue-Id: AB11E21C4F4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,nxp.com,pengutronix.de,lists.infradead.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-32629-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aisheng.dong@nxp.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,nxp.com:dkim,nxp.com:email,DU0PR04MB9299.eurprd04.prod.outlook.com:mid]
X-Rspamd-Action: no action

> From: Randy Dunlap <rdunlap@infradead.org>
> Sent: Friday, March 6, 2026 2:34 PM
> To: linux-kernel@vger.kernel.org
>=20
> Insert a "*" in the kernel-doc line to resolve a warning:
>=20
> Warning: drivers/pinctrl/nxp/pinctrl-s32.h:18 bad line: this group.
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Acked-by: Dong Aisheng <Aisheng.dong@nxp.com>

Regards
Aisheng

