Return-Path: <linux-gpio+bounces-37940-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BPYuJndbIWoUFAEAu9opvQ
	(envelope-from <linux-gpio+bounces-37940-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 13:03:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E996763F45D
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 13:03:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=S71bIEXG;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37940-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37940-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A08AA3037EFF
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2026 10:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B58A8409110;
	Thu,  4 Jun 2026 10:58:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011060.outbound.protection.outlook.com [52.101.125.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9C7406297;
	Thu,  4 Jun 2026 10:58:24 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780570706; cv=fail; b=a8PppsLLlkguAiY++8GGfcfvwFj5EH5ip0UOpqKCFLmO+FqHMGnL4LYdXg0B8zcwixZluS+n8DNh4hmAzxD3PgBRUhiKF1rSY9Bg1bX6IDGeARZ5YK9Jz7my6hnmieLL/cWWsM+S+dD/8DyexAth1aUHPChh90aVptrTIW34NjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780570706; c=relaxed/simple;
	bh=ALAQkmzLaW5ZOQcOuF1abHMVG2SwIOSxYN9UgsN+Tbo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LijR5waAbdRke/RUEs8NTPHT4bzvtNY5sY9w0vKM/vqD1XwLKjzYQeWVhqehwYD+p58rbP5FCzKdCSDsjfD4LZWODEGi/ofd1lydlPTuww1l4syPkbvwS4vu4me1Unn1M/rv9pq1bVPbf2aNtiQI58NdxV2Iofnxsn815vZhcO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=S71bIEXG; arc=fail smtp.client-ip=52.101.125.60
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ylIdN8YpKebtG0AWofITH88aGpaJNFqcCZcLauFE5wZSWM4pecsOR53ta0WTCwlsDzanxq5vYGFHakjwLwdqn1ymzo0WP/SccwD6n+hGKJKFy4BGX59tBMOKBogC1KvzjMcdVe1CAjFPDiu/oku43qDePwlXS0iMHtj1tCKuSxE/YaH9htxV0k7xt+jNjV+ubV/VIpuB6lhlNaNJbIjyuqxf3Jp6/lYiCgKvI+BS/NrTl9FFecEiSr3ElJ/TGmQNza59+Hq1Z2sPIkatnYaVh3VeHRRJzNbDMkhU5mOyHBhzCW2GnEdF5zdOtNHk5FJ7aDqnXWU+yiFX6JkpUslDPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ALAQkmzLaW5ZOQcOuF1abHMVG2SwIOSxYN9UgsN+Tbo=;
 b=qb0cPKTJZ39SNa81p80IBUlxEg2LhHhZPWm/p8bgjLytqNXcgRDnY3ER7sFxcLMGL02W5vIc7MdNO/68E4sMgNnHcMousf00t7p9/5lVsqd7xUdiem4MHylxOze93ccnz1tSwjAnxAvz/GNue/A/xQ6zThFCpxEgQ9t2MupWJN+AySlH1fn+dAeXM0MR9pBOkFHoSgAnaB7CP71kIAHRTxoTQX7MNRmEv4K+BlBEnDla54Bmb9E8cFzAC24/ghYZ1LfLF0OJTWROognFYPv80YMukD4muYb8gM0lN3bdBIkNnRBl1unynE2ohXSEmUxGCyOC1LuNDADrFImjTCHiHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ALAQkmzLaW5ZOQcOuF1abHMVG2SwIOSxYN9UgsN+Tbo=;
 b=S71bIEXGWxxZUp6o0CPvPZ37xEJK/EqmLBU0xcvZfUb2gx+UuBiiBGg4HB5gQC4TC9bMC1bRNb/+UOOor65JeVLrTGc6segNtjTsGgVlOLiTP8E48U2x/KS+NrfiJ42OW586rLM4dovt+eLtefdQsLC52TOBzv17hKHfql51d7E=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY7PR01MB14909.jpnprd01.prod.outlook.com (2603:1096:405:252::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Thu, 4 Jun 2026
 10:58:21 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 10:58:21 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, Claudiu Beznea <claudiu.beznea@kernel.org>
CC: "geert+renesas@glider.be" <geert+renesas@glider.be>, "linusw@kernel.org"
	<linusw@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, magnus.damm <magnus.damm@gmail.com>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Claudiu.Beznea
	<claudiu.beznea@tuxon.dev>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>
Subject: RE: [PATCH v3 1/6] pinctrl: renesas: rzg2l: Use
 raw_spinlock_irqsave() on power source update
Thread-Topic: [PATCH v3 1/6] pinctrl: renesas: rzg2l: Use
 raw_spinlock_irqsave() on power source update
Thread-Index: AQHc82wIl3xaircai06rtQdp8q6PcrYuJ9KAgAASdPA=
Date: Thu, 4 Jun 2026 10:58:21 +0000
Message-ID:
 <TY3PR01MB11346903E1B762B66EDB8CB8486102@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260603151642.4075678-1-claudiu.beznea@kernel.org>
 <20260603151642.4075678-2-claudiu.beznea@kernel.org>
 <CAMuHMdU_T=G7os6KBG6xTnphnhQ9pQtd88BUkg61S7286bZmFw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdU_T=G7os6KBG6xTnphnhQ9pQtd88BUkg61S7286bZmFw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY7PR01MB14909:EE_
x-ms-office365-filtering-correlation-id: b47f3116-2031-4a30-93fe-08dec2283144
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|11063799006|56012099006|4143699003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 YNY1TtbAGImaFIEJXzyVjOBqQV4Fk8BrZcJoXJ5mCuW0kDIpa8Yfpc0KQTRgXijCsIGq/YKBMauk7Wb3uzRA7hckgW4HBDhxS/A0RWRaLDa1oW99ggigyTENf1XzeIhN3QuHpo6UnUQffeW0BIUexXsXYBTN7RDX3J4cwGF8WyumRgVN0AJIxbfdE7huiB3rVrKtkeqf50YnOYEgfbWjN6MTIzGDqVsoAOlb5JoASTHMiEFaMc4VQGX29vQU6sIX4O2bUwj2m85G7pTFjw7hzW4qnIss4fWswSEguKzfkj4lTtFuUGAvGAZBPS89xq1hL833bqfRhJ7asTrT3tboneXa94LWW52stBAsKe/3YodSa9kUvsNUKrUs9rwguWKXnBevJjjPpjTszghwXSYFzAN2/iI03mBAi6Rp1BcFhJdYbR/BMCeqUyWvrgKRzAMsnanx9C6LuGFgeUP+Xw/sD4zF7DmS/2bFf9SjW3E1wH46cXmBOrFhNfjC0zGy3LwT2WpDS+CHqACXJxFwZTbfXpschyujAXGfDBiv7Z532yjYmNfG23Audzx565cACUGb38wUvdBCd1BGfPvrAph5V0Oxmh0+44KKjVGj0+i2ZZgaKYg4W2nnA0514EPdv6lW3SjYdD8PmzD8uRUdZiCuaPGeMdohTx4HoU2aVKU15fJ5DYX5TkDGvCMwcEuPYS4IferNo/CXZEZ0lz7l+OaLpIGAZwsQyIxw9WQoN+Swkl7Izf8mRWVpu2BI5CQ2xsO1
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b0FVTTZMcmxBVVVaNTMxaDc1YXZJaTg1eGRnMUxaK3F4ODVnQStGQTltZkRO?=
 =?utf-8?B?N0VCSG9WZFhQV3ZsMmhybFVrbXRQV2FkUXc3K1p5MlNsY1pGbktvS3RsczIy?=
 =?utf-8?B?SERhMDVMSll4aHJ2WTAyNk50bDVCUzhTeVBGUzRiZXdxNnZrcEFKcUs1ckJq?=
 =?utf-8?B?ckFtOXYwOFcydmEzTGRkUHJuMW1keWNXUkN2SkJXdW5OUUNYblJROGdqdDVT?=
 =?utf-8?B?UU9LRGRod3R2M2t6ak5zSGNSenNiR29FSitjYWlGTHJqR0s0V3ZRN0Q4RWFh?=
 =?utf-8?B?cVlGMjlpMXNmMVArLzdld20vck16UG4wMVVLTUtKS0M0QU5KcG4yNVFmRm1r?=
 =?utf-8?B?OWoyRTNYNS9DQjFPRlhhWXR5ZjlMMUdERUxuVlY5QlBBMlp6WmdwaXFYaXZU?=
 =?utf-8?B?emRlcWtpNDd3WHRvL25GVkMzcVl0bGh2N3JNYlplcHZKcyt3WEYvM2pCOEIz?=
 =?utf-8?B?Z1F5Y1BZNXZhS29FdlBJdElYQXVTU3BwVk50QkU1VUdzRzAyZjdmbHU0NEw0?=
 =?utf-8?B?eldaeHJQRXo1V2UvbkVTN0lLUVdYS0R4SzJ3WjJZNFdnZVowQm96UW9FcFRC?=
 =?utf-8?B?K1dNZTVrSjVVZks3cDJ0SkhSSUk1eFpzTi9uNExmd2g0aUc3OENYQzYzdlMw?=
 =?utf-8?B?aXl1SHQ4UWE1T0ptSy9KakpadjFNbFBuTk5uLzBsNUsyQm9vNWhNQ1RpZXdX?=
 =?utf-8?B?OVlsV2d6ekkyb2JJb1dLdGNPcXByT0JyOUduMXNtYjFhV0lmL2diczN6REZU?=
 =?utf-8?B?ZWJrcE9kVmw5SDllbk92VHRDeTd3WmRBOTdRbjMxOXE3dGFzbGVUM1EzSzhI?=
 =?utf-8?B?L0tIWE9DUkViTFBwdmRyMnBaU2dKRTVtU2VpR1N0VDBDYmtudU1vRmRQNVo1?=
 =?utf-8?B?VU5XS25sZlhiZnltUGlSRWZScitIT1lSUzBGNkJMMGhYV3RMSDdzV1NFTlRX?=
 =?utf-8?B?TExaT2htd2owTEQ1dW5YZGRtNUplWmI2dUhpOS9GWW9zb3FHTER1aHd3bzgz?=
 =?utf-8?B?cEpDbVlaM1VHZ212T0tIeGgxWnIyS24rK2tReTgxdVlkb1U3M0hNNlAxYktN?=
 =?utf-8?B?MFpxWEFIUkxUb3pvaTYwMERyNCt0YzEydFBhUnBXZHVFTGF2d1pJWU5xakl4?=
 =?utf-8?B?QzNKWWtKZi9Wb3dsdFVKVmh2QmFMa3ZhVE1vektHVk5XQ1p5VnM1VElnRElZ?=
 =?utf-8?B?Q3pnOEl0L0xVVWRQR0NSZ09zOHVLbVZ3WU02anlDdzBMV0Zod3RUM0ZGbTU2?=
 =?utf-8?B?Sy9IQTRjR040ZUx6anB4WERidEJrWXpCQ0NPT3dYZzhsRmpxOWdKQnRlYmpN?=
 =?utf-8?B?a1hBN3VyTGhrTm1TRWJ0UHY0N2lFUGdLdGk0ejZzcG1xRTZXY2h5WThOd1JR?=
 =?utf-8?B?aUpxUjY3MnRzTmZ2TjdvWGJ0S1g4WWlMaUo5Z1pmVXhsWVpUZEFDeWxVa1dV?=
 =?utf-8?B?NS9LMUVTcXdoRnJPeFR4YVlSeTQwcnZaeXpZMUp5aUtxdm40bk9KQk8vN0ND?=
 =?utf-8?B?SG1FTlZKVzZ0ZXFadktkZFdyV09wUEU3dlg1UEtCMDZDcnlIeEJDVThZM0Rw?=
 =?utf-8?B?cnlUdWU0SjRLRTdNNTIxSERDWUZCamJpay9oYWJCU2o4QTAvaHhWRVpzcWYy?=
 =?utf-8?B?VXZhYncza1RRT0cyWFRTUEZ1YzNBd3h4MUtKeERwL0ZCZTJuQlduL1FGNHVL?=
 =?utf-8?B?aDg5ZGlBWkQ0eU4xd2xtdjNWQ1lsNnNlT1JxRjlLNDBrR25TdUVmaGs3MVdp?=
 =?utf-8?B?aDJwajQxbUZuY3JyV0VzMUVDcGZDWWtkcm03YzJPdS9zNzM2Zy9XaU5lc2p2?=
 =?utf-8?B?YXE5ZGRNKy9hVVFUeHdLRHltM1VrYnhJUzJJanRTY3J2c3JmSWlQRGhYc1lG?=
 =?utf-8?B?czFGYVRCV1V1dythcnN2UW16MXFFRDRlb0FzYjhoSjBqdnJXYk5lbTJ6ckxq?=
 =?utf-8?B?WFBJbEJpV0x0OUJ1bWw0dy9mRnNIb1BJWmMxL0psV25FNkdOYmlDUnpoakkx?=
 =?utf-8?B?SVdOdVF5TW5LWENHNUhDeFl5aDhidExJWElLUVlwWUdQOFVCNWRuR1pzWUFO?=
 =?utf-8?B?UlJVWS9ERWdHOVJrWTRtQUE2SG1qY3ZmajY5eGlBQ2RWTlBKWHA4anVuR0Rm?=
 =?utf-8?B?WkltVG1LcS80ZkNNWUIrRUJvcnRUSjBtcDJZN1Y2MnNaVFV1bGpqc1lrb3Iv?=
 =?utf-8?B?N1YzZURDN3dCWFNrb3kzTjlGWGxoOS91VnpKeGJwQ1FKNEtac21TSEVjc2FJ?=
 =?utf-8?B?QVV4d3VoN012WWZ3SFQ4Q0FBdkE0My9oQVNyTXpkUmFUVkZjK1FuZVhYM1JN?=
 =?utf-8?B?ZDVIVmExbTMwZVI0akF2U20xdndWcllDY3MybysraEx5RXE0TnMrQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b47f3116-2031-4a30-93fe-08dec2283144
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2026 10:58:21.3979
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dC+ivkIuwIyplAy0b4y3RQQmMAbDdDUt0R3s+QZyCm2PpTAzCeYCF9BtPgri5bwaYR5PJTU/lkk/5CByrMwP93CGPzKYzIJ9tRMzf86k3c0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14909
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37940-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:claudiu.beznea@kernel.org,m:geert+renesas@glider.be,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:claudiu.beznea@tuxon.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:stable@vger.kernel.org,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[glider.be,kernel.org,gmail.com,bp.renesas.com,tuxon.dev,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E996763F45D

SGkgR2VlcnQvQ2xhdWRpdSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50OiAwNCBK
dW5lIDIwMjYgMTA6NDkNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAxLzZdIHBpbmN0cmw6IHJl
bmVzYXM6IHJ6ZzJsOiBVc2UgcmF3X3NwaW5sb2NrX2lycXNhdmUoKSBvbiBwb3dlciBzb3VyY2Ug
dXBkYXRlDQo+IA0KPiBPbiBXZWQsIDMgSnVuIDIwMjYgYXQgMTc6MTcsIENsYXVkaXUgQmV6bmVh
IDxjbGF1ZGl1LmJlem5lYUBrZXJuZWwub3JnPiB3cm90ZToNCj4gPiBGcm9tOiBDbGF1ZGl1IEJl
em5lYSA8Y2xhdWRpdS5iZXpuZWEudWpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiBUaGUgcmVz
dCBvZiB0aGUgZHJpdmVyIHVzZXMNCj4gPiByYXdfc3Bpbl9sb2NrX2lycXNhdmUoKS9yYXdfc3Bp
bl91bmxvY2tfaXJxcmVzdG9yZSgpIGZvciBsb2NraW5nLiBUbw0KPiA+IGF2b2lkIGNvbmN1cnJl
bmN5IGlzc3VlcyBvciBkZWFkbG9ja3MsIHVzZSByYXdfc3BpbmxvY2tfaXJxc2F2ZSgpIHZpYQ0K
PiA+IHRoZSBzY29wZWRfZ3VhcmQoKSBoZWxwZXIgZm9yIHBvd2VyIHNvdXJjZSB1cGRhdGVzIGFz
IHdlbGwuDQoNCkp1c3QgYSBxdWVzdGlvbiwgd2lsbCByemcybF9zZXRfcG93ZXJfc291cmNlKCkg
Y2FsbGVkIGZyb20gSVJRIGNvbnRleHQ/DQoNClRoaXMgZHJpdmVyIGRvZXMgbm90IGhhdmUgSVJR
LiBJZiBhbnkgY29uc3VtZXIgY2FsbHMgcnpnMmxfc2V0X3Bvd2VyX3NvdXJjZSgpDQppbiBJUlEg
Y29udGVzdD8NCg0KSGF2ZSB3ZSBzZWVuIGFueSBzdWNoIGRlYWQgbG9ja3MvY29uY3VycmVuY3kg
aXNzdWUgZHVyaW5nIGFueSB0ZXN0aW5nPw0KDQpDaGVlcnMsDQpCaWp1DQo=

