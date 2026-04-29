Return-Path: <linux-gpio+bounces-35739-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHheDWNa8Wn/gAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35739-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 03:09:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C618D48DE26
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 03:09:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 557223017BF3
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 01:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47878223DE9;
	Wed, 29 Apr 2026 01:09:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2122.outbound.protection.partner.outlook.cn [139.219.17.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8B3218592;
	Wed, 29 Apr 2026 01:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777424988; cv=fail; b=BjWukcvacVb/trUllamb7Hw/PLlwzczphfddRwUCVdNNELW2azTk0WfIa41p+V1DlTMfQzxbshcaEfDlwsxduF9jQLTYSNQD8HIcVQWcQ9qM8Pqkx/NaeQ6uvc2b9bQrjHqtVSx/xHYWJ+A0KTD8zbAH75RmZET8tGSi+mIaQt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777424988; c=relaxed/simple;
	bh=2ad1JqBuAiGEKCS9/PYo/Qne+mfbM0MP8PjVtY6TKuQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kinqGl8LxaXUY2638KvG08MYxHo8SyWnsViEsoH8KgZ3VMXXds0wun3oSajxjJd5bzRAXuDFgxMlR/fa2UHcsyqG3+Ccfz6aBc2Mb2mm5/xCtLLgmCShKKOXQf6jUISb6AUJshkd9toukJJNm1DB+54bHMRst+mWwPrEzKzNp4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kxsLdg/FHj+FRD2Xs3O9QMsf3n9/pbQPhx9RpcEOx20HRg1AkH4MJxOAPSCXr1crHKqDj8yf5Cg1A41Z9KiKtrQwaQ7BKWw+R5pR9MfY3FP4qzdwe77qoXhU4LQ+ebLdQ+4XMDLaLMR48jNHjS5GV1hiIgXoiUjK6C0LakKHL+/3K9hHvFI2YUwAeMSlHI9nXK0ZZLepYSm3Ye5pq+QuhGUbwIersZ4YKJYyzoEmPyJ4FpyX0lVxweiKnno0GVyIOcUoYPOpp7P0TMCIyNVOrAhzqWswf5zmNUtv6oU8UVKxjn0W59rHsqWlrMSZsrFXl+QNhcO8qLFh0ADE5rx87Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ad1JqBuAiGEKCS9/PYo/Qne+mfbM0MP8PjVtY6TKuQ=;
 b=EwVfg5f5uZxHJ5h2QbaqyLkya+Pyexi2yT4KqOX+eOocAwvy/rcUr34WBBao2mt74PfDjoGrWH+T34oJTcpQ8IsOjJMJiAq8H8FFbBCX0wVf5VxV1MC2q/JO9QcIexYmLpA/DtKsjAo6ZdEWRmn/LH/FkUZaNGfV87nkAUWOP+LdvDPi+BJqOGIlXfbrD4EM0kFpihS+0vTXfaaIkJ7MMKlldhjF3ruE4VV53/Zj86BRl/vP+buSz9UmiVQuqtTPai7+XbdOukRRUIIfX+qMmG0hn4I8mvwCitA9mh/YYcIVzdZtQtppUO57v3rUu7h2nddb8YIYWTnxqoahL7ixOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1139.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.28; Wed, 29 Apr
 2026 00:53:43 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9846.026; Wed, 29 Apr 2026 00:53:43 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Linus Walleij <linusw@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Palmer
 Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel
	<p.zabel@pengutronix.de>, Bartosz Golaszewski <brgl@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Lianfeng
 Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v1 00/20] Add basic pinctrl drivers for JHB100 SoC
Thread-Topic: [PATCH v1 00/20] Add basic pinctrl drivers for JHB100 SoC
Thread-Index: AQHc09tmlRkwE0usA0qMi/myV+kzhLX0RxyAgAD2bCA=
Date: Wed, 29 Apr 2026 00:53:43 +0000
Message-ID:
 <ZQ4PR01MB1202710E77C15C369D61D72AF2342@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
 <CAD++jL=tvDBWJHRGGJw4nnox_kcJKn5hwvwz9zxadMRedyvRhw@mail.gmail.com>
In-Reply-To:
 <CAD++jL=tvDBWJHRGGJw4nnox_kcJKn5hwvwz9zxadMRedyvRhw@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1139:EE_
x-ms-office365-filtering-correlation-id: d484f39b-4748-4b45-a3a7-08dea589c32f
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 K+JVDMOLbx4qzTznruUOMjNNd2gkJkI/5n7Lw5+CMlxr1fT13+1CIFnytOc4PHyiwEPtpzw5kHmhX1DUiATS0g2e1IVvjqwnUCcAf0k/JI5DG52RIhduATf4LAZJHF2IIIytDJ4kcrOlFHWVaoXbxkYNRppM1sqSAT6F2B+oK7FuTVYFyxGHMzOAv7DXkiY3BLiUxv/0dQ/pkIWGcGuqo9/fL+ESM0b3nx5aDeSmu+OhsWjCEca4vP4ekruBNYeg2c/k1ICVKqOw7d6RbY+z9ZTKRgnHyCMkdApTz1uHNYnmulhYN5zTLHjdUKdu29zHST/9HgjhLOdbyP+nZcyG0jV6ZlZwxLUK7/Yu1R4an7RIPnM8gYVpZ3PgOeKdY8PH2p17y897yGJ+zaQTl87A95SuTtZW0QNBJom3kRBhW8QUn9Kgn/RTUp/5AR4/QFY6iMwLOSUEDoHxMX8/3TpJ/evXidycrWQEd2/8m/+L7V0StwsW5aEN1tAPYF3P89mOcUPbtemFIxsuFXSRbpIKzHfxc9JpRIV5blKEDH7dbxgbvKVRvN/JQ2psNYl5+OFTwEu1D4Zm0dw2/9HnZr17mg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?amMwN1dVenRtOVI3UWMwVFZCZ3dEdzVXUFg3RDJxVVpKckR2T2ZqZnE5a3V0?=
 =?utf-8?B?bGdpUmVIL0VhZWxGeUkwUCticzlUVnlaNzdGcVNSdStIWVlSRE5vdkR0RCtR?=
 =?utf-8?B?dmF1YVI1VXFUTEtkMjliUzh3UmVIbDd0SGUzOVBLMzVMMFFIeUpjWmZZMFdZ?=
 =?utf-8?B?SW9hYWZiVW0zR1FTWXVUeWhwcTBxZEpkek5GTnFxUy9lUHFqM1pUc1d5UlE5?=
 =?utf-8?B?S3JLbXQvU2x4YzhTdVQ5anhlNHRhZnhweG9vcFA0ZkRXWFBaVnBrc05BSXph?=
 =?utf-8?B?WnBUN0t1Mk10WWFEc0lIaUZEbHRpMEppbUJheFl5TmQ1WXpHZW5vVzU2WVdB?=
 =?utf-8?B?Y2ZmQWk0aGQ2Nmlhb2wxQnlEekVTbjNjb284RDUwendNS0Q0MjJwZXFZRSti?=
 =?utf-8?B?SG9qaTB4MjB3WHZ1WEZZb1ltZmJ6VHNrOWJ3VWtGMTI4eUZJU0k1QUsxR29u?=
 =?utf-8?B?bUZGR3FGRmFIL1lHcmpOM2dwbmZHc0R3eVlVekNOL1lrM3A5bU91d2tjMXF2?=
 =?utf-8?B?SmhOZkJWa3M5R3d2cVNGbHBsdXFESE1JTmZiYWVhckx0aER6STdkUXhsREk5?=
 =?utf-8?B?MmozZHFFT2xxR1E3OHg0elBaUVl0OG5QWmFLN1FGSUc3UlkraThqRXBRY0tq?=
 =?utf-8?B?Zmo0ZzdITkUzRVdJcmRUOGF6RXlxMjE5L2llT0p1QkZlbGpCbnVYM2p2Snhx?=
 =?utf-8?B?ZFFDQXhkaEI4aDFldWp2Z2YwR3VvTi8zd3JaZldzTUJibkUvK0llZ0VQQ3pP?=
 =?utf-8?B?b0RFOCt6dFcrY2NrWDJvVmQ1YXJDWnBrdVl3YWVvS09WRkRTK0JrR1Q2QzZ1?=
 =?utf-8?B?TzA5T3I4WkpEa3RaVEVHakNlREQ4U1BIRDF5aDR4dmROcytNZWh6NmlSUmVL?=
 =?utf-8?B?TG1hK2dQeFVsRCtsalFzeDlhck5jOG5RRitFT080OUJtQ1gzcVlPNTdiaW9U?=
 =?utf-8?B?RmNKeUg2T2w3RDRreFR3ZDd3c3paRDVTbkp2MHA5T2pUbjFQZ3VicTB1QlBp?=
 =?utf-8?B?Rk9peFFEM0pUVWpEcVdHRjllTnprOEVWRUxRRXpyRmRWT1N3K0hQbGZqbkFx?=
 =?utf-8?B?TkhwZmlFTkVXNzNBTVNwTFpxczhtRHZqdFp1U1NrMlphQkNzNVNQczdXK0Uv?=
 =?utf-8?B?eFVkZjNDUktsaFFXRS9oMFZIVlRBRkZ0VjBtREJ0SzBiSEs5ZkhES3A0NTc2?=
 =?utf-8?B?STVqVFJmZ1JMVi9rSDV6TWo0OHFIMWVRN0NFY012UnNyWHBwZmg1K212Vm5U?=
 =?utf-8?B?Q2E2dGlVTnZNSHdLajliUmExcDBQak03ZHFWQlFTdEZ4anJ3aDFDUGJCeGQ4?=
 =?utf-8?B?a1dwb0FXellGZnlOeVVvdjNnNmRnNFpVOVNJN2cvUjFodGhPbjFQR1prMDBj?=
 =?utf-8?B?a3B0RWlTeURxekhDVWZ2RHZ1dkJkYStuV0czVnR4WHlTZ1hnTHplV3BKbzdV?=
 =?utf-8?B?RnhYK0lpU1dodHJBU0ZRWjVkWFppUTAxVy9iaUNXM0dyTHRpQ2QrOURDbEdQ?=
 =?utf-8?B?ZW5MeEMwTVN5Nk52NEdHd3BmSnQ3Ly9NOTNuNWtsRkxYTGw1QXlFYkJRcFJQ?=
 =?utf-8?B?c1V1eHlEUis0Y3o0K1V4R0h2M0dMTVNFb1B6bjQ2R1JKT3VtZUg1Y1BINWcy?=
 =?utf-8?B?QUJicm9qNkdOOVk4aGVBbmdqekxXd3NTUVpmNlNSZngwY3l5T053bngyWHUv?=
 =?utf-8?B?YkRWeGx2THoyMmE3b0RRY0RDSi8yVXNJS203a3Y5ZDFiOTNmUG0wRFhUN0dU?=
 =?utf-8?B?Z29CS0RkRWVoWXJSUzNrN1ltSlBCaldHOEdmOS9ISWlYNFJCelV5Y3Z6UjU5?=
 =?utf-8?B?N3N3ZEhBSEJwU3ZvTlZ0U1B1Q0g2alF6QUlBclhMMzdkQlk2eEJiS0tISVM4?=
 =?utf-8?B?V1BZTmxUdVpxeXNOQ1hKdWYwR05YbEhDVjJRcDc4QTFHMHN6Q1I2ckRPT0xl?=
 =?utf-8?B?NFhvV1YwZUlLeWpuYTVUY0RndElXL2FGZzJZaU0zRHdSaks1MUtRVzFtdU5k?=
 =?utf-8?B?WkpWaUpURW5uYndmdjFpQWlGc3R4OHh2STV6STgzcmFPZzFFN2hLMkFWSjBN?=
 =?utf-8?B?NlUycTZRUERpRGRHSjJZUWRyMFhIMktjaW9HS3Z4L25yUEdHR0Nndk0wcnNV?=
 =?utf-8?B?ZElwWVlzMDduMnZrOTZGREsvZVFhZ3lKVStaNkdlRjBtYUVJb3psZVB6Q3dZ?=
 =?utf-8?B?VThGRDZ2b0w1RWJpQnQ5ZEZmRnhmUUZjV0ZWTGwzcFNZT2hMTy90eFJwSmxL?=
 =?utf-8?B?WURIcURsQXpZU2swZERORW1ic3JOb2pueS80dzJJT3BaM01SUjg2NlZOZ0kz?=
 =?utf-8?B?VjB3SEhwbVhpQ1JYMDVtNHMvQnNXb1JMdWFRcUU2SzNaMklPRU1KWHZuYjly?=
 =?utf-8?Q?mnczaXEoynYVwM5Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: d484f39b-4748-4b45-a3a7-08dea589c32f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2026 00:53:43.6515
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BRUwz+yc5+lfSxTQqhtcatNytKYx0vZfJmm4BCq6tT2LAvYEmS/gUepezms4AsvVHadexV/0jb9Aul2zCzLtbKROCmiErjqpZQJ0Z1mudJnO9yy0FyLcl8ulsAie1/lM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1139
X-Rspamd-Queue-Id: C618D48DE26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.64 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-35739-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.938];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,starfivetech.com:email,ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn:mid]

SGksIGxpbnVzDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldy4NCg0KPiBIaSBDaGFuZ2h1YW5nLA0K
PiANCj4gdGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gT24gRnJpLCBBcHIgMjQsIDIwMjYg
YXQgMToxM+KAr1BNIENoYW5naHVhbmcgTGlhbmcNCj4gPGNoYW5naHVhbmcubGlhbmdAc3RhcmZp
dmV0ZWNoLmNvbT4gd3JvdGU6DQo+IA0KPiA+IFRoZSBKSEIxMDAgU29DIGhhcyAxMyBwaW5jdHJs
IGRvbWFpbnMgLSBzeXMwLCBzeXMwaCwgc3lzMSwgc3lzMiwgcGVyMCwNCj4gPiBwZXIxLCBwZXIy
LCBwZXIycG9rLCBwZXIzLCBhZGMwLCBhZGMxLCBlbW1jLCBhbmQgdmdhLg0KPiA+DQo+ID4gSW4g
dGhlIGN1cnJlbnQgc2VyaWVzLCB3ZSB3aWxsIG9ubHkgYWRkIHRoZSBmb2xsb3dpbmcgcGluY3Ry
bDoNCj4gPiAgLSBzeXMwLCBzeXMwaCwgc3lzMSwgc3lzMg0KPiA+ICAtIHBlcjAsIHBlcjEsIHBl
cjIsIHBlcjJwb2ssIHBlcjMNCj4gPg0KPiA+IFRoZSByZW1haW5pbmcgcGluY3RybCB3aWxsIGJl
IGltcGxlbWVudGVkIGluIGZ1dHVyZSBzZXJpZXMuDQo+ID4NCj4gPiBUaGlzIHNlcmllcyBkZXBl
bmRzIG9uIHRoZSBzZXJpZXM6DQo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYw
NDAyMTA1NTIzLjQ0NzUyMy0xLWNoYW5naHVhbmcubGlhbmdAcw0KPiA+IHRhcmZpdmV0ZWNoLmNv
bS8NCj4gDQo+ICguLi4pDQo+IA0KPiA+ICAuLi4vc3RhcmZpdmUvcGluY3RybC1zdGFyZml2ZS1q
aGIxMDAuYyAgICAgICAgfCAxODIxDQo+ICsrKysrKysrKysrKysrKysrDQo+IA0KPiBUaGF0cyBh
IGJpZyBwYXRjaC4NCj4gDQo+IEkgbmVlZCBhIG1vdGl2YXRpb24gd2h5IHRoZSBleGlzdGluZyBj
b2RlIGluIHBpbmN0cmwtc3RhcmZpdmUtamg3MTEwLmMgYW5kDQo+IHBpbmN0cmwtc3RhcmZpdmUt
amg3MTAwLmMgY2Fubm90IGJlIHJlZmFjdG9yZWQsIHJlcHVycG9zZWQgYW5kIHJlLXVzZWQgb2Yg
dGhpcw0KPiBoYXJkd2FyZSBpcyByZWxhdGVkIHRvIHRoZSBvbGQgaGFyZHdhcmU/DQo+IA0KPiBX
ZSBkb24ndCB3YW50IHNldmVyYWwgY29waWVzIG9mIGVzc2VudGlhbGx5IHRoZSBzYW1lIGRyaXZl
ciwgdGhhdCB3YXkgd2UgZ2V0DQo+IG1haW50ZW5hbmNlIG92ZXJsb2FkLg0KDQpUaGVyZSBhcmUg
cXVpdGUgYSBmZXcgZGlmZmVyZW5jZXMgYmV0d2VlbiB0aGUgY3VycmVudCBqaDcxMTAgYW5kIEpI
QjEwMCBpbXBsZW1lbnRhdGlvbnMuIA0KUmV1c2luZyB0aGUgb2xkIGNvZGUgbWlnaHQgYWxzbyBy
ZXF1aXJlIGV4dGVuc2l2ZSBtb2RpZmljYXRpb25zLCBhbmQgSSdtIG5vdCBzdXJlIGlmIHRoYXQg
DQp3b3VsZCBpbnRyb2R1Y2UgbmV3IGlzc3Vlcy4NCg0KPiBTbyB0aGUgZmlyc3QgcXVlc3Rpb24g
YWJvdXQgdGhpcyBwYXRjaCBzZXQgaXMgaWYgYSBjb21wbGV0ZWx5IG5ldyBkcml2ZXIgaXMgcmVh
bGx5DQo+IG5lZWRlZC4NCj4gDQo+IEEgc2Vjb25kIHF1ZXN0aW9uIHJlZ2FyZHMgImJhbmtzIiBp
biB0aGUgR1BJTyBjb250cm9sbGVyLg0KPiBUaGUgY2FsbGJhY2tzIG9mZnNldHMgYXJlIGV4ZW5z
aXZlbHkgLzMyICUzMiBNT0Q6ZWQgdG8gY2xhbXAgdG8gMzJiaXQgd29yZHMuDQo+IFNob3VsZCB0
aGlzIHJhdGhlciBiZSByZWZsZWN0ZWQgaW4gdGhlIGRldmljZSB0cmVlIG1vZGVsIGFzIGEgMy1j
ZWxsIEdQSU8NCj4gPCZncGlvIGJhbmsgbnVtIGZsYWdzPiByYXRoZXIgdGhhbiAyLWNlbGwgPCZn
cGlvIG51bSBmbGFncz4/IERvaW5nIHRoaXMNCj4gbWFrZXMgaXQgcG9zc2libGUgdG8gdXNlIGdw
aW9saWIgaGVscGVycy4NCg0KVGhpcyBhcHByb2FjaCBsb29rcyB2ZXJ5IGdvb2QuIEkgd2lsbCBh
dHRlbXB0IHRvIGltcGxlbWVudCB0aGUgY2hhbmdlcyBhY2NvcmRpbmdseS4NCg0KQmVzdCBSZWdh
cmRzLA0KQ2hhbmdodWFuZw0K

