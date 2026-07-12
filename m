Return-Path: <linux-gpio+bounces-39928-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b5mjLdaqU2q7dAMAu9opvQ
	(envelope-from <linux-gpio+bounces-39928-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 16:55:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D7574508C
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 16:55:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=VrP9Cv+o;
	dmarc=pass (policy=none) header.from=renesas.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39928-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39928-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8464D300F5E1
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 14:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1908A25487C;
	Sun, 12 Jul 2026 14:55:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011013.outbound.protection.outlook.com [52.101.125.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AD41A6816;
	Sun, 12 Jul 2026 14:55:10 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783868112; cv=fail; b=X0c9mv0FKYWZL0cWLtdeQK+ZuRoQAK5wA5jeVl3qDlOGA3Iy7YVA5dmom0fs29JWfOTbYdZUDb5DRJ69tlXfLyPRaXbeuC8CZPSYLmzt9CGOZSNV4qI2BV1rG8oVqv8wzpoP8KYfxGyXi8Mdw80qRhV8XmhwtumjXHThx8TRLvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783868112; c=relaxed/simple;
	bh=1HBMpz8HomzgFQiDn5O8pXrH5Fyh+umvyKtnI6Tvfzk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kZAHRLskU/Cn3em41rf3rpmM8uRNpz0hgE/71lXfjQmyPVl6DbZ0QC9X5FoClYcEI37ePq0+bpqIXAWssqS3n4/gHnua942lB51kXcp90o+Cxt0p1uf0RKIVUD2pVF+mYoAB4AR7d640aLdoyYQ2WVpSL0fMHD7rLHwFkSRWokQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=VrP9Cv+o; arc=fail smtp.client-ip=52.101.125.13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HFYiCU16mM8PsUhtoc5KI19SkVZwuYi1ulpJ7TtnCg0E6qAGKeFvzxEdFaBF7c6MrlyxtQrdS57panoFH4zPv/RGJxpCMKHSoanQldWVXQG9O2/RPeLhl51khEbnAzB+NmfiMAGqcdfNLIcbqNRsQdhynb5s/mMYETNRC51qjTo8i6yOIRM32S8qD8gM81akPETxN5t+6MH7mEglpci7L38//1hUyd6X/42GGGUDERW6yKHNXsFy91FZYaJG4EMsHgs9A01mgIXJaECGdPWBAtAjRKBQv9IvIU0Me0oyiGruuNxaCyYgx309nUUxCRkmvw3fIX2nIET3Z2SjEcj3oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5RCT0qcSeEzWAz53/7LM36s3Zt5rltP7iGFvdN/XfI=;
 b=PQ1DPga2HFyaZt3fNH1myN71Dj5FxmWp1bsvD5PPHqw7QigIJmEl5SA3N6IEp63BRwbPFolkTe1PgN73ZwRsJ208XAA6Tw6DyD2opt7k79DpxyBmww5SQs6X1222o4wIJQ0TciURrS73Qx/HnGjY5U890KsxV9/97ET8lr3fz8M5e+zLc+UmS8l0OMe7xOQV1S94f6Y1P/icOoaZdkwvjrEZNxz2RcxhI/gk0FjTBKNbBL75bhpBku1OBkhQ2kEL9btwZ2XkJPFVTx1ZGV5P2NqrPh7Pqt5ZLPFuHVoHfDcm0PJa3QGHPtQwrynjXw2Z0IQL0cWxXYAmu8xFotwbGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5RCT0qcSeEzWAz53/7LM36s3Zt5rltP7iGFvdN/XfI=;
 b=VrP9Cv+oZvFHMvAGDwlGB2nh5K5K4bU0mum7JAUA1aReCuRlt9UednRWl7xPxxkRKEy2FwA++a69b87CSj+Za607PKbMV+j/QSseWBrAnUfpP00Q4HkTzsP63pVmx11B4/EUJM0+YJOnWNRXJlXiHMgTKzGVpq90n3TR1cFievg=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB11112.jpnprd01.prod.outlook.com (2603:1096:400:3d5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.23; Sun, 12 Jul
 2026 14:55:06 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0181.009; Sun, 12 Jul 2026
 14:55:05 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>, "linusw@kernel.org"
	<linusw@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, magnus.damm <magnus.damm@gmail.com>
CC: Claudiu.Beznea <claudiu.beznea@tuxon.dev>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>
Subject: RE: [PATCH v4 4/5] pinctrl: renesas: rzg2l: Add RZ/G3S support for
 selecting the I3C power source
Thread-Topic: [PATCH v4 4/5] pinctrl: renesas: rzg2l: Add RZ/G3S support for
 selecting the I3C power source
Thread-Index: AQHdEGCEtP5P1ZXBFUyNMEvPaGr4CbZp+qIQ
Date: Sun, 12 Jul 2026 14:55:04 +0000
Message-ID:
 <TY3PR01MB113469434A4393A02DAA45DDF86FB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260710113637.1328000-1-claudiu.beznea+renesas@tuxon.dev>
 <20260710113637.1328000-5-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260710113637.1328000-5-claudiu.beznea+renesas@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB11112:EE_
x-ms-office365-filtering-correlation-id: a75cf8d4-19b5-4a4c-64e8-08dee0258ef5
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|56012099006|11063799006|4143699003|22082099003|18002099003|3023799007|38070700021;
x-microsoft-antispam-message-info:
 0V0D9GkhsxGmCuqSRLGYkD0zYVcSo+cTx3GgeRB3NSMBf2cUhvZok0/s0yF/Fsz3hSJC/NcaxEml3tjRrdqS2+VlnEO1G4n/Yr7NfeahWkw2EPiPGeLeo74KuL6hV0nrRGXIWNoK/p2M91I9Ok1lvfksfXvR44p1fcVBgZiNgEdfhvgkHHA84Vt8hdUuNd90KuUExqRJsRtr8J7C+EMbg8oNdHY7RA0bKSa+RbpdGvee9ETUgc7p663r7t+Nqpc4vAmGv7+zXQgObTAIuZVTQQEKRO2kgw7gGZkY02xao8786ZNr4FnzpUKiL2lgk3XzCLF0LSUwBbaakrmhiu8yvXa08+l8V38TgU75ptZpXXnDGG8gElHZ5sXgV8S85UjepizGPmobcoX9cxRoc6Ix7U4rdwUFBisChBfioiIq6jy0gUMrJwxPuUf7qYZieIqRmhk8ghaAm1RC7+RJsTLf1bb5WeVudRqN+HsTqYzyqjdQPG74K087n+PJwhTB6zaYndAS63LQbiQ3CSPhOVAoIN2PZfGHX5KTjrawj496sAFiHjpr33eDvf9U18Teqd9NJxSvy7j6qaTJ+fbV+MbLrPlbN8nc+7V0XVNOM86GATY6FgszrW8RC3ICHJ+EjavHCVsgZaRx//MO3lS6oGC8GTDREpShatgkQQLVtO0B2KUXRcIWELJl6Srn1wY+GYJrPz5lPC4RKZDnQYtSGHTAiv4BuhbH8gEBAIi2SLsRUjM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(3023799007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?lDfbavzLTCkwVPeMFwe4/h9QXW8gHp0p/P15t3rfA2V4da5zupyKZv0+S4jS?=
 =?us-ascii?Q?wVROPVD+xw832NRtTJk8Jxr6tLRO4ALMckSTmCAI3WBZhxJsTAobrc59+JYt?=
 =?us-ascii?Q?TNu4s3b8MjuWm3hSIyHiW5SgEOMJ9WhCL3/4UmiZy8tW0n2/FxUYVJlG8vOi?=
 =?us-ascii?Q?WFXQ7QzsSJWH9Jl9Cwrw8V7Wf6M15KR42kk4qbI+ZTNFQ+1QG8zNpyo3WYAb?=
 =?us-ascii?Q?cs8I3FhYO57vzpMNaPII1Ieed0RknW6lQwdVWY4GSUXxjW0IHwijkKIC6wT9?=
 =?us-ascii?Q?XXLfy47BwzXrkpoiWufwX+oOvKrJp/cttaW7Df/p5Nt60USzAMhq62xMI4AP?=
 =?us-ascii?Q?gRq8QdgBSt7lJdsUNIog4vwz77GsCP5UEpqKhTWe1fOfK/UHXqm+z5oU8pcj?=
 =?us-ascii?Q?2fTWwbZjl8j/p88O6DRSa97SMrMfT4GqYJ9cU97RprXWv+SVcGASYuaF/1h0?=
 =?us-ascii?Q?V/rCnDQqjS/cW0wgSDurbxcWZtUdqujjMo850+hRS6XrjEksp1nmqocFRDZl?=
 =?us-ascii?Q?M1cQJxlok1kpOkgOLuDXYBjm6NK9/r3JZwX+5xgxhCDoVp1D4fA42DQsv5uX?=
 =?us-ascii?Q?jFDoXFrVhQhBDQ4sQpZlSn6g2QSqQDFSwPV9H16th1gd3jJnxVa8zwGlB20I?=
 =?us-ascii?Q?gZxA3r4GQEAvoJ7spmfeNcSiABUR8rhTVyLaToBoEbbgNs9kYWcjJrOWoc7P?=
 =?us-ascii?Q?+/Y0HxRhfQGiMzvgM7AffOmmC3AE+GC91VFpTlwtGmAlcDbvZMX2AclzoWT1?=
 =?us-ascii?Q?QxOKJ1h87icj3JS4GUoBuJg16x6wfRXA2jHSB8wtU1mJNIa4dpSsnAJwnAHl?=
 =?us-ascii?Q?X4vbz6DFItON5NsNHhz4kcuESv+o3BwO2/92jQeadztFMsRCeI5aY7kTnJTp?=
 =?us-ascii?Q?ruQOsQVjjKpAJ3zTj/8hPPROLXh7fGTkEoXofngXAAS7ptEWbfinUDZhnC0U?=
 =?us-ascii?Q?b5j/8qQLx7OEdrPaURIxaNn9v18wEi6IqDTvx9O6d2m1X9gPP32CHqiduE/x?=
 =?us-ascii?Q?D3kIXUsmV+uUnuxovtkuX8AtrQu0Xj2oH2fCb+mNQvPznBn2O9J6Cf3ylpso?=
 =?us-ascii?Q?9vV7oyVc3kLX5MZwWH2p9UB8W7va7UGx8cpYjnliIFy1OCR1l198grRndUkg?=
 =?us-ascii?Q?Ol7wglu/a67hCxanSPl6GehSfZzk7kWz/nvYXNUSR2Tm26NnuaGUbgzc+77c?=
 =?us-ascii?Q?Yzu8MjYqoYVPkC86lHKds9Mo7vbLOHsk3TagivNqnwMQRx51CFC9Uu70bpSf?=
 =?us-ascii?Q?1k8bRLEA0eYXiT3h7p/76sct7BexTZjDqvzTpyYFcRdQLh2Dy6jlCjIPaExo?=
 =?us-ascii?Q?hgTcLgyNa/yGdnJuVCdIKnS5GHr0qyZXoXNf+vW6puC/tawMVS4i8a7QhBcK?=
 =?us-ascii?Q?xiKMKVXl19BzS6cYvz3PTABfncA7rZmnCXVgDJokNZGLbPitwJ9p1Om2zdO/?=
 =?us-ascii?Q?1OsbFq1HYiNFcIGfe07de8+AEZdFuk1nss9hTkCAfrH68XceGddoYhrGEFZG?=
 =?us-ascii?Q?6O1QRhSOiHp5Qwn1JcEeeeZcoMPQDITlBIFMP374SH//qb9WrqTu/cpWlY2f?=
 =?us-ascii?Q?b6pmLD0kbjKzcnZGYuHb+JIuBBch6UdDWYp0Zoy0zYf+6bAWywqA80vn24Gs?=
 =?us-ascii?Q?AQkcTBIE+WqCAKDb5droTvaU/AH34h4yVEXGvqvOs58FknoAhtBcB6+uqffV?=
 =?us-ascii?Q?gk0IF0P11OExhFLxmLa3sjqd2ahvTWSddfpk+rVXYj6mDT5CR9Ej2pw/l8WY?=
 =?us-ascii?Q?q1UY6qerWA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a75cf8d4-19b5-4a4c-64e8-08dee0258ef5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2026 14:55:04.9438
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dqSZon3Bl/dM6qlFwxZxPCltzrG7N9fMbnXgBvo0zNgW8OFZ4EcH+EgcAmBrfWFtCZrEoJohJGWtkjjG3kKEyIFijAkjD1ScA2clzUo2FMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11112
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39928-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:claudiu.beznea+renesas@tuxon.dev,m:geert+renesas@glider.be,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:claudiu.beznea@tuxon.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:wsa+renesas@sang-engineering.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[tuxon.dev,glider.be,kernel.org,gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:from_mime,bp.renesas.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 17D7574508C

Hi Claudiu,

Thanks for the patch.

> -----Original Message-----
> From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
> Sent: 10 July 2026 12:37
> Subject: [PATCH v4 4/5] pinctrl: renesas: rzg2l: Add RZ/G3S support for s=
electing the I3C power source
>=20
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> The Renesas RZ/G3S I3C pins can be powered at either 1.8V or 1.2V. The pi=
n controller provides a register
> to select between these two options.
> Update the Renesas RZ/G2L pin controller driver to allow selecting the I3=
C power source on RZ/G3S SoC.
>=20
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>=20
> Changes in v4:
> - none
>=20
> Changes in v3:
> - collected tags
>=20
> Changes in v2:
> - none
>=20
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 73 +++++++++++++++++++++++--
>  1 file changed, 68 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/re=
nesas/pinctrl-rzg2l.c
> index b52a85066f63..9a0706fea220 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -69,6 +69,7 @@
>  #define PIN_CFG_PVDD1833_OTH_AWO_POC	BIT(19) /* known on RZ/G3L only */
>  #define PIN_CFG_PVDD1833_OTH_ISO_POC	BIT(20) /* known on RZ/G3L only */
>  #define PIN_CFG_WDTOVF_N_POC		BIT(21) /* known on RZ/G3L only */
> +#define PIN_CFG_IO_VMC_I3C		BIT(22)
>=20
>  #define RZG2L_SINGLE_PIN		BIT_ULL(63)	/* Dedicated pin */
>  #define RZG2L_VARIABLE_CFG		BIT_ULL(62)	/* Variable cfg for port pins */
> @@ -186,6 +187,9 @@
>  #define PVDD_3300		0	/* I/O domain voltage >=3D 3.3V */
>  #define PVDD_MASK		0x3
>=20
> +#define PVDD_I3C_1200		1	/* I3C I/O domain voltage 1.2V */
> +#define PVDD_I3C_1800		0	/* I3C I/O domain voltage 1.8V */
> +
>  #define PWPR_B0WI		BIT(7)	/* Bit Write Disable */
>  #define PWPR_PFCWE		BIT(6)	/* PFC Register Write Enable */
>  #define PWPR_REGWE_A		BIT(6)	/* PFC and PMC Register Write Enable on RZ/=
V2H(P) */
> @@ -257,6 +261,7 @@ static const struct pin_config_item renesas_rzv2h_con=
f_items[] =3D {
>   * @oen: OEN register offset
>   * @qspi: QSPI register offset
>   * @other_poc: OTHER_POC register offset
> + * @i3c_set: I3C_SET register offset
>   */
>  struct rzg2l_register_offsets {
>  	u16 pwpr;
> @@ -265,6 +270,7 @@ struct rzg2l_register_offsets {
>  	u16 oen;
>  	u16 qspi;
>  	u16 other_poc;
> +	u16 i3c_set;


>  };
>=20
>  /**
> @@ -272,6 +278,7 @@ struct rzg2l_register_offsets {
>   * @other_poc_pvdd1833_oth_awo_poc: PVDD1833_OTH_AWO_POC mask
>   * @other_poc_pvdd1833_oth_iso_poc: PVDD1833_OTH_ISO_POC mask
>   * @other_poc_wdtovf_n_poc: WDTOVF_N_POC mask
> + * @i3c_set_poc: I3C_SET_POC mask
>   */
>  struct rzg2l_register_masks {
>  	union {
> @@ -281,6 +288,11 @@ struct rzg2l_register_masks {
>  			u8 other_poc_pvdd1833_oth_iso_poc;
>  			u8 other_poc_wdtovf_n_poc;
>  		};
> +
> +		/* RZ/G3S masks */
> +		struct {
> +			u8 i3c_set_poc;

How this POC is different from Ethernet, SDHI and XSPI POC?
For consistency, can't we handle like others?

Cheers,
Biju

> +		};
>  	};
>  };
>=20
> @@ -391,6 +403,7 @@ struct rzg2l_pinctrl_pin_settings {
>   * @oen: Output Enable register cache
>   * @other_poc: OTHER_POC register cache
>   * @qspi: QSPI registers cache
> + * @i3c_set: I3C_SET register cache
>   */
>  struct rzg2l_pinctrl_reg_cache {
>  	u8	*p;
> @@ -409,6 +422,7 @@ struct rzg2l_pinctrl_reg_cache {
>  	u8	oen;
>  	u8	other_poc;
>  	u8	qspi;
> +	u8	i3c_set;
>  };
>=20
>  struct rzg2l_pinctrl {
> @@ -441,6 +455,7 @@ struct rzg2l_pinctrl {  };
>=20
>  static const u16 available_ps[] =3D { 1800, 2500, 3300 };
> +static const u16 available_i3c_ps[] =3D { 1200, 1800 };
>=20
>  static u64 rzg2l_pinctrl_get_variable_pin_cfg(struct rzg2l_pinctrl *pctr=
l,
>  					      u64 pincfg,
> @@ -1101,12 +1116,28 @@ static int rzg2l_caps_to_pwr_reg(const struct rzg=
2l_register_offsets *regs,
>  			*mask =3D masks->other_poc_wdtovf_n_poc;
>  		return 0;
>  	}
> +	if (caps & PIN_CFG_IO_VMC_I3C) {
> +		*offset =3D regs->i3c_set;
> +		*mask =3D masks->i3c_set_poc;
> +		return 0;
> +	}
>=20
>  	return -EINVAL;
>  }
>=20
>  static int rzg2l_pwr_reg_val_to_ps(u8 val, u32 caps)  {
> +	if (caps & PIN_CFG_IO_VMC_I3C) {
> +		switch (val) {
> +		case PVDD_I3C_1200:
> +			return 1200;
> +		case PVDD_I3C_1800:
> +			return 1800;
> +		}
> +
> +		return -EINVAL;
> +	}
> +
>  	switch (val) {
>  	case PVDD_1800:
>  		return 1800;
> @@ -1121,6 +1152,19 @@ static int rzg2l_pwr_reg_val_to_ps(u8 val, u32 cap=
s)
>=20
>  static int rzg2l_ps_to_pwr_reg_val(u8 *val, u32 ps, u32 caps)  {
> +	if (caps & PIN_CFG_IO_VMC_I3C) {
> +		switch (ps) {
> +		case 1200:
> +			*val =3D PVDD_I3C_1200;
> +			return 0;
> +		case 1800:
> +			*val =3D PVDD_I3C_1800;
> +			return 0;
> +		}
> +
> +		return -EINVAL;
> +	}
> +
>  	switch (ps) {
>  	case 1800:
>  		*val =3D PVDD_1800;
> @@ -1194,12 +1238,21 @@ static int rzg2l_set_power_source(struct rzg2l_pi=
nctrl *pctrl, u32 pin, u32 caps
>  	return 0;
>  }
>=20
> -static bool rzg2l_ps_is_supported(u16 ps)
> +static bool rzg2l_ps_is_supported(u16 ps, u32 caps)
>  {
> -	unsigned int i;
> +	unsigned int i, len;
> +	const u16 *array;
>=20
> -	for (i =3D 0; i < ARRAY_SIZE(available_ps); i++) {
> -		if (available_ps[i] =3D=3D ps)
> +	if (caps & PIN_CFG_IO_VMC_I3C) {
> +		array =3D available_i3c_ps;
> +		len =3D ARRAY_SIZE(available_i3c_ps);
> +	} else {
> +		array =3D available_ps;
> +		len =3D ARRAY_SIZE(available_ps);
> +	}
> +
> +	for (i =3D 0; i < len; i++) {
> +		if (array[i] =3D=3D ps)
>  			return true;
>  	}
>=20
> @@ -1800,7 +1853,7 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl=
_dev *pctldev,
>=20
>  	/* Apply power source. */
>  	if (settings.power_source !=3D pctrl->settings[_pin].power_source) {
> -		ret =3D rzg2l_ps_is_supported(settings.power_source);
> +		ret =3D rzg2l_ps_is_supported(settings.power_source, cfg);
>  		if (!ret)
>  			return -EINVAL;
>=20
> @@ -2498,6 +2551,8 @@ static const struct rzg2l_dedicated_configs rzg3s_d=
edicated_pins[] =3D {
>  	{ "AUDIO_CLK1", RZG2L_SINGLE_PIN_PACK(0x2, 0, PIN_CFG_IEN) },
>  	{ "AUDIO_CLK2", RZG2L_SINGLE_PIN_PACK(0x2, 1, PIN_CFG_IEN) },
>  	{ "WDTOVF_PERROUT#", RZG2L_SINGLE_PIN_PACK(0x6, 0, PIN_CFG_IOLH_A | PIN=
_CFG_SOFT_PS) },
> +	{ "I3C_SDA", RZG2L_SINGLE_PIN_PACK(0x9, 0, (PIN_CFG_IEN | PIN_CFG_IO_VM=
C_I3C)) },
> +	{ "I3C_SCL", RZG2L_SINGLE_PIN_PACK(0x9, 1, (PIN_CFG_IEN |
> +PIN_CFG_IO_VMC_I3C)) },
>  	{ "SD0_CLK", RZG2L_SINGLE_PIN_PACK(0x10, 0, (PIN_CFG_IOLH_B | PIN_CFG_I=
O_VMC_SD0)) },
>  	{ "SD0_CMD", RZG2L_SINGLE_PIN_PACK(0x10, 1, (PIN_CFG_IOLH_B | PIN_CFG_I=
EN |
>  						     PIN_CFG_IO_VMC_SD0)) },
> @@ -3717,6 +3772,8 @@ static int rzg2l_pinctrl_suspend_noirq(struct devic=
e *dev)
>  	cache->oen =3D readb(pctrl->base + pctrl->data->hwcfg->regs.oen);
>  	if (regs->other_poc)
>  		cache->other_poc =3D readb(pctrl->base + regs->other_poc);
> +	if (regs->i3c_set)
> +		cache->i3c_set =3D readb(pctrl->base + regs->i3c_set);
>=20
>  	if (pctrl->syscon) {
>  		int ret;
> @@ -3759,6 +3816,8 @@ static int rzg2l_pinctrl_resume_noirq(struct device=
 *dev)
>  		writeb(cache->qspi, pctrl->base + regs->qspi);
>  	if (regs->other_poc)
>  		writeb(cache->other_poc, pctrl->base + regs->other_poc);
> +	if (regs->i3c_set)
> +		writeb(cache->i3c_set, pctrl->base + regs->i3c_set);
>=20
>  	raw_spin_lock_irqsave(&pctrl->lock, flags);
>  	rzg2l_oen_write_with_pwpr(pctrl, cache->oen); @@ -3871,8 +3930,12 @@ st=
atic const struct
> rzg2l_hwcfg rzg3s_hwcfg =3D {
>  		.pwpr =3D 0x3000,
>  		.sd_ch =3D 0x3004,
>  		.eth_poc =3D 0x3010,
> +		.i3c_set =3D 0x301c,
>  		.oen =3D 0x3018,
>  	},
> +	.masks =3D {
> +		.i3c_set_poc =3D BIT(2),
> +	},
>  	.iolh_groupa_ua =3D {
>  		/* 1v8 power source */
>  		[RZG2L_IOLH_IDX_1V8] =3D 2200, 4400, 9000, 10000,
> --
> 2.43.0
>=20


