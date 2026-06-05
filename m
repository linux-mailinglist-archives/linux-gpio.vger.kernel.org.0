Return-Path: <linux-gpio+bounces-38000-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qDhaBOJkImrGWAEAu9opvQ
	(envelope-from <linux-gpio+bounces-38000-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Jun 2026 07:55:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EAB645524
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Jun 2026 07:55:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38000-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38000-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=starfivetech.com (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A020C3006380
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jun 2026 05:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5D2D3FD978;
	Fri,  5 Jun 2026 05:49:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2113.outbound.protection.partner.outlook.cn [139.219.146.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C835248F7C;
	Fri,  5 Jun 2026 05:49:35 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780638579; cv=fail; b=YJDQ45Q6qTK2+ztEqYCgrP6zYl/Fik2Wec9ku7TQELX3NQbAvWfpinBmgF1nyq+ZhmS8XOzxDwq0fhByMQHAigMEjKdhVJBiA9owEJZSyMytv6MCb7/HUyqz5luUP/6abC1hXNMtblsS+ijlqOWH/Bl1ii9Op7TEbKjqbkfASiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780638579; c=relaxed/simple;
	bh=qlh93mY73FLfTQjlxakNeEV/j+N2qIShEXeUgbqETDY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kIAkBvs3wKaOE/kOErEjs18eFBZw8ezJyTgzzEFYHpDwrkTQ2rJbxcIXp0qwxVRdgnv//4+vo+PLxmS0+OXLMWYv/wLMYHi99oR5QJw8Rnk9s0J4Nw/ihx5eImSCrK0PrsJXv7nq13TsRQ+iSqzB3NGeDF52fK4ReXdYysmOGgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.113
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W6+PmphAU8eW5qAxS0YxwUxUXiWpo/LsGGnBvnvWCh+ddMbqr9b1ct93e6XjF24Nz7WZ+fcVX20opZ3j8NCJuXy3Ke1BERb8sYdduIPFqwLpNh0tAxW898HcAUV//eJCcNVSnnJYgrZsJgtcS6FFOLaYn20zOLSJcLsl/HIWLln4VWtihEgB2TdGSoC4ZpZ8+6mZIfKsrC87HJGhY+qV7gS6jN0RBe8W77Pzl9tp3BH+7LGBZzaWtRYmxwAU9kQfrGrLGQ+mKhX4/FaKLZJm7YMp3LMP2CSReP1HRkUdYHRux/vtXSUuvEan3KytHeoAexjPVFlyPXSC5lbt01icLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+UKxmH41eowxW+NnnPbeKBa4Gs8jxfbGTntoNmf410=;
 b=iJ1XNEeDtkbMTEs50X3h8UxPpWBE5vqzOJfzQRWLrEQI6SuPvInkw00Pi0E6cL0fv7adke2W7oMg23L+JaTxIz/iaYXOEQ5Y01K50soCCw5wIcnj7QloyjMJk0rPyXh0np3t5cGBNuinYExl6ljI/p7pEod8XbCkKZ09MCgJEHMAan9e5kkh+f4GqDegAm66dCcDAVvyilVXk1E/3Rwyc9S2V8hOG45bhdpD6SOTK8AUahLqwBjI3cTsD9T3Z5g8vqb7ZdfVkk6OUBFGbfkBlYTKQQ9ar4p+hkH3kOIjhFOdIGZUx01XTgNwmYbw9ZdgPXICcLwxBlUnzzgxlYHZpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1329.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 05:14:49 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0092.007; Fri, 5 Jun 2026 05:14:48 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Lianfeng Ouyang
	<lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v3 09/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys2-pinctrl
Thread-Topic: [PATCH v3 09/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys2-pinctrl
Thread-Index: AQHc8x1mIdqiDFCBRE2a+0InCrGmBbYupKaAgADJk3A=
Date: Fri, 5 Jun 2026 05:14:48 +0000
Message-ID:
 <ZQ4PR01MB12020AA4421025B25132CF01F2112@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260603055347.66845-1-changhuang.liang@starfivetech.com>
 <20260603055347.66845-10-changhuang.liang@starfivetech.com>
 <20260604-veggie-constrain-16a72066e82f@spud>
In-Reply-To: <20260604-veggie-constrain-16a72066e82f@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1329:EE_
x-ms-office365-filtering-correlation-id: 92d3fa01-6266-4e23-c67d-08dec2c15db4
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021|22082099003|18002099003|56012099006|4143699003;
x-microsoft-antispam-message-info:
 7GwtdPoP2Ja/4tvxZ1zg1lD/AlISESPNVPUr0R0Lojd2TtDich62lmAJdy5pCJnmpaZ9PzprylrRZqYHcLGQru8HsTPRZ6TUMQgWGW2S8VUQE3k62RxXMIM0+dneOhd4YvPZo4NUIymKjpNvQdYl0sIf3OaxAx0rcMR5JfPiTBBnVNpDn/KIHXD+mH1414Y8F6oeuvbp54sSFNy9cMT7ak5yAB9rUt//Q9Eboj9j/JWX/7z6UrD41GmDj5pblQ1MWm1Aps/7M9KVg9fNdU4MIfI/cSWSw5qUnkna7/XZ0x4eWRAjac0wUNtF8vvbjkrSiA46yb1GnIMZHNrujRArOoZS6z7ZrBWKJZdqWTewyrHgSQ39LKD6b/5Inv9aoIZtYGLjsJjoUDXo4ICdsUUm7vM2sUC9VvQvvX2ob4T+MDq6z5s61SZMv48+qxGBPjoj061cEtliKqaZ3SJMZNTa9d63i6heuUWymgVmzvt64w3U635TaHa7VeQEZajthIDAHd9TR4l0gyQxR5V9bMRZeh/SIktnIrwQJ2thHxmaizDLRHVUEVZXfpaOCxH8Sxya
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021)(22082099003)(18002099003)(56012099006)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?l/DEaiO5XBnEGN0KBN0NzKcWYOJj0+BZpjFhiS3iYF1TC9SZlgBf1hX10T3H?=
 =?us-ascii?Q?gMZo14PYhm+oTvgyKwTpJYftxQ6TzWlzRGMJHeIzateytQxSrXZ9w4PKkQii?=
 =?us-ascii?Q?3clcEwGBYOC73rK5Wx9LrMIzehOR3E6f8NLIJVTH4o41ytHuKTuRhq2ixOot?=
 =?us-ascii?Q?lT7sVDrayV/dRNWr0rs9X56kUxPAdelL8fZznkS3L2Ddx22fj9I241RuTevH?=
 =?us-ascii?Q?zVcdtelxtOFSMIxf9iABWZIgwIV8Q4Y8Bw1b3DIV3p49BqVTYaWTWpxoPVJ+?=
 =?us-ascii?Q?7OmnDMVD6JFGmXsDoVXVZXXOqTRNfQtaXkhnYQOlr5jzJ0gmy6jxtohbE7f6?=
 =?us-ascii?Q?U9I0v5/g7btXKswZ8Xz4U7sC75qejpLjeh/3ag91emAHYGyuH/g66JKEr7Jd?=
 =?us-ascii?Q?SavoNVj42IKBPSxYrCoaVtJg5tE+7xvs7YMn2sIHqyWCYszmmGz9s5oP3vz5?=
 =?us-ascii?Q?o4Xl4tJvmVt44N4Tn1ZA6jISi2TFPQIysYAxKH9RtR+BlgG9sAhwApcHVus+?=
 =?us-ascii?Q?ZlSh6fJEjIQuh5gs9Qse6IId6hlb/dtdd/wNHqwiLqRoaDJI35vCwdVkNgR5?=
 =?us-ascii?Q?dX1B1WIiHn0ZpNXt9ymsucDO+miDM6oNcHdtfUH8HcXaqLddzF74S9mu9Oc1?=
 =?us-ascii?Q?Pkj6XEvbTGE0d3RQXtDPlq8PgxspsHxJ/q9U20MsZ0EwYoqvE0GgFRPyYiDR?=
 =?us-ascii?Q?Dswj3iWc/uQmkVFeVC3JkIS1SXss4rE3J16S1oeUp3idMZoD2ERblgu5TrhN?=
 =?us-ascii?Q?7azYdxzzXK+XCYzDnorm75NOXqrMkYWOVeI7vNWN6um5KPPIjmn101EYuhjC?=
 =?us-ascii?Q?iW/ZJCjsk0jio5q5RdM/6pLq/5DAPvUHlqINl+STUoMUdraM1hpsz7gkSLyU?=
 =?us-ascii?Q?a5vjJxYio2cM6STnBcO9aUcUFYGg3pR/2G4LcEAZIksGEwexn4X/r9wFL4Bq?=
 =?us-ascii?Q?SW9n4XvO6Lw5vmNTkY3Prf8zgrHiP8wFJfVtXN6i2uylRXHGgZTQofKY6Mxh?=
 =?us-ascii?Q?vMgmX+QVtYZsBHBLHbT5aX8iA5E0URgEWUTaYozCxQzN5kkUdKPrySlxWniL?=
 =?us-ascii?Q?lK611YPDthhYlQcPnhVFjF4nZ4uI+3Pg5kmrDer9qS5AoRlE2bqCdP45rvoB?=
 =?us-ascii?Q?QyyAwjsFoqtopKTfJr9zE4tpHvWnYkO0IhhQ+XHq79yU/RBqIufIycrYYVuG?=
 =?us-ascii?Q?rOu3vDVclF/gbZ3NniPSB2fvCFnYcolUSg0AkiJEdeVK1VK7R0PXEZVsEJBJ?=
 =?us-ascii?Q?X5WBtgIqS2Mza7riFTHoidoufRfSyGyg3dmdVFUp/o8cUlr5rPWeZOXqnvqT?=
 =?us-ascii?Q?mVxrXrXmBeXtPzpHCJoWaH0lqph9X0Q4UDinzQ9RaP+E1NP8p55pVVnDjjUw?=
 =?us-ascii?Q?Zmw5kKWaXFtjFKOZnIGubvpnZ9B+naEOSPr81O6pTWIdyAdX6O9cjAaScAgR?=
 =?us-ascii?Q?iY7Q8DawMpZMmVCIpqjNS7Ag//NHi5oxa3ANcwSA5QTXwEzZTAfY/DHZOHAm?=
 =?us-ascii?Q?6XZjMgHGiL6zwvw7aM4MPGJtFH3ilEI3XAI8ygpo3qjug9THgw2c7bu0UUcS?=
 =?us-ascii?Q?E9kPuLu0SXj6TW7kMUnGMrFR+vE4lq3boYtAGox3x6XcbZTtOmHUL1LohMxn?=
 =?us-ascii?Q?VRx6ZG6E0SjiT86WWANhxMoFXI+qj7AROJCfhOAeMZu7QAlIDsIzlZvlT5G5?=
 =?us-ascii?Q?4GJ4pazv8L+/PwBx8YT+vgVyjwo7fJ9J/e4DnKybOaVgRhkumO3/EI2ZvhBL?=
 =?us-ascii?Q?kH7zdfRf45JaKSzThWWK9Xv0sfeWGZs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d3fa01-6266-4e23-c67d-08dec2c15db4
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2026 05:14:48.9397
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fgIdiiA2rrA4RqCbd1ls+J+reRcr21xN7pkupD8mxaxPzx6QsJG9u559DgWOv6Dchxyq8mFkljAqVo+eFbZl3Jg8IFdlfmlOmDE/Zs6e0PDSXxbehM85MtQTnV4f6caq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1329
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38000-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:conor@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kernel@esmil.dk,m:pjw@kernel.org,m:aou@eecs.berkeley.edu,m:palmer@dabbelt.com,m:alex@ghiti.fr,m:p.zabel@pengutronix.de,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:lianfeng.ouyang@starfivetech.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 62EAB645524

Hi, Conor

Thanks for the review.

> On Tue, Jun 02, 2026 at 10:53:35PM -0700, Changhuang Liang wrote:
> > +          power-source:
> > +            enum: [ 0, 2 ]
> > +            description: |
> > +                0: power supply of 3.3V
> > +                2: power supply of 1.8V
>=20
> I'd rather these were given in e.g. microvolts, rather than what look lik=
e
> register values, that have no meaning when looking at the dts.

OK, I will try this method.

Best Regards,
Changhuang

