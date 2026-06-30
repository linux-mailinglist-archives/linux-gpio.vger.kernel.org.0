Return-Path: <linux-gpio+bounces-39225-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2YeMFvfGQ2o4hgoAu9opvQ
	(envelope-from <linux-gpio+bounces-39225-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 15:39:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E96166E4EF8
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 15:39:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=YRsQ0xUP;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39225-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39225-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 46B5C300ECBA
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 13:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42A5A325483;
	Tue, 30 Jun 2026 13:34:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010049.outbound.protection.outlook.com [52.101.228.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3392FDC28;
	Tue, 30 Jun 2026 13:34:10 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782826453; cv=fail; b=Bh4Jype5SVlzUGFWZpgdVomf/nkkPZBbZpELkLt0zLr4V5iwTevYzWtsaoI6XuPv6BTUXIKDvxIJE5ZRfv5nzwPa47AdySQ11YRpdlnwiYieEm/c/9xRFEU/p7+V/LnVkxBWRjjWYyptNmKcvcI5LvZlXqjNvFiBrWjmQJpvHiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782826453; c=relaxed/simple;
	bh=9wAhNvpwGo6STTmPXs6ns1vl+IpatBfui3VtzeK5Dvw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=awJA04wRiDhRnUhk8v42fwJQlNL63BJuOKB5kezECYzVeOSXIvVlaqb74QKsuoDbFAo6Mo6qg7awPFhpuwZHLvkyDekq9YwMMcL+alYXUo6uFxyPTKfZgt5S3atLlrpGPzIqE1U98oCSZQLNSg6FAOqnmJFy/fszV98haCre5Kk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=YRsQ0xUP; arc=fail smtp.client-ip=52.101.228.49
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KOR0vCTdb01mSLpVL5p06Fwwfw04gZEy/7yDitaT5kHQ4saM3MNwMP86hJwig5e24Et6HnjV0Kf1dRFyANkbcTVBnG0OiDCFC6RBMooddPVQWgmm8q9ETUIGn4XxyukomAbK/sPMackb8dUCfolKvD9lPBtLqRmuC8gbqlu960EjhIYjF5zJ+PG2TF63FehpEnIqKmRDIeMikdsT2At8JUv4Zleru9fBc70rmp2QO3ZhxhcqoOu70k46dcap6KwH9roBCY/Yw+VA+u8wZxJQjN2cipxMKBP8NfQwwnlxuhhQe7Sf5Z934S9H6Lj/v9Pw/TRWCY1XWKSuq1sHXi93KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9wAhNvpwGo6STTmPXs6ns1vl+IpatBfui3VtzeK5Dvw=;
 b=vkOgqlcZt0RTO65VIU5dPWH9gLMQuSJyWChfrBYopkmj6u9ujaBsmxGjEPfEhvzLzvrm/jhuUowBC7VxBxBe/ThwKOBnNRKTamhNqJO2xphcCnRTOR+qJ7dQ+HZ/kKZFng8iz4r4hNvnXGXPNM28VRrvxCFfQzE+SNs10TcHqFRU1CNHqryQ0YGKFVTrcIDm6Yaxnviob5v6tglpShvOtm0k+NaKdHx92y8SBmXSckAXXK2ZNvqs2orZKZU40yZs687/kQef/QobDjg1CtTQNYexI2eqGuh+8R7yWuleaoQAQxa+Xr84o3iPJZmnNraYSsqOZLHm/kol9KJ8t/aGKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9wAhNvpwGo6STTmPXs6ns1vl+IpatBfui3VtzeK5Dvw=;
 b=YRsQ0xUPhHj2nicjofw9Oj7bCL3JC5A5qwqz1wqEEn9C2hSYWGCwD+H/AdmbwaaRsN5OnchFouphq07oAN/Ieav1efxsxK/tYIfSlYekkaRp9jvAUpw7CtFA+ME5Y4nPOCkrgsLg+asatTlfPaWw92qQeeZQys11h25SwOASEOg=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB13939.jpnprd01.prod.outlook.com (2603:1096:405:1f9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 13:34:07 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 13:34:07 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Linus Walleij <linusw@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v18 1/4] pinctrl: renesas: rzg2l: Add SD channel POC
 support for RZ/G3L
Thread-Topic: [PATCH v18 1/4] pinctrl: renesas: rzg2l: Add SD channel POC
 support for RZ/G3L
Thread-Index: AQHdAmb0JMax2/iAzEKTkgpYkhgM/LZXI/uAgAAAdIA=
Date: Tue, 30 Jun 2026 13:34:07 +0000
Message-ID:
 <TY3PR01MB1134697FF483EB5F34B39370386F72@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260622164819.184674-1-biju.das.jz@bp.renesas.com>
 <20260622164819.184674-2-biju.das.jz@bp.renesas.com>
 <CAD++jLnQ2ty7DtJLOt_FskG18ZsChttswhf=T_Vo4wLhq12_cQ@mail.gmail.com>
In-Reply-To:
 <CAD++jLnQ2ty7DtJLOt_FskG18ZsChttswhf=T_Vo4wLhq12_cQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB13939:EE_
x-ms-office365-filtering-correlation-id: 0158a0a6-917e-41bb-4c18-08ded6ac4295
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|11063799006|18002099003|4143699003|22082099003|56012099006|38070700021;
x-microsoft-antispam-message-info:
 I/Qw3grk4PPORXTVUiEudzuCUkqKwWwDmLj7XRoIZVYOnXDyECsTVD4CZjc8ZkYjtebLNzmiAdDztGWIfdRGYeEVOF9uMqgPfA5apbD7GvYPKfCuXO9X3/iVGNIX/uXSwBhswBpq95IHMJxacOHZ3ifOMlzc9A8g60KDYhqOCL9koAp8DE9agXSeU4wO3fQV+H5GXYYji3xA83cTxKwRDPFTVS/XO/RDHjykW268bITunAKaEcs/aFT1VJlIRw5ZbJmRPY6UcQjqOgHntVrdHPmSQA280cnujR4pL0fQomlk8ppL4lPKHojnibCXowslfxSQ1gMx/ifQKiM6nnhyPPxqoo43hRxNczrq0ROOrXaZY8b17ty4sIWSMvcpi9NUxn/d5wkzYk5vS06n9phyaNKivfj6FKaWWRDBWpdftmR/nsfuXhQGVYmBv7L0V3akExPt/mMRpnwTO46kJfh/z9qC78cQdhVOpUqxKQZxwYTEt8qob6Apxbu/DUUm/gorycIvCuRnO+BMd0YqY98jwl2LuLfsxFJthKNaL1tbjxIgo0mCH6glU8MSZolElirq47yl1aVJUyNX6kg5p2hqXk/e20IYaE+4E8TPZKBAwPPRRXW7AOTwbvFKECIwA7LawQeP7A0wVqplx2bpDzk9U2v7rLVTYdmzPd1WS0TQSpxYENGgl2JvuCJyRhugr1AnBaMnTUxOHn6b2963bEiHUNVJIsqf87QyTYer6vGVOvI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(11063799006)(18002099003)(4143699003)(22082099003)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Sk9hTzZMeHJvalN0Tlk4aHVnNlVZTEhUT2swOUtEUFRlOE0wY0I2VEhLZlIy?=
 =?utf-8?B?LzR6TFJ6TXVaZlZVckhyUzRwY0ZaeEwycFR3dUF4TWlZOG1jYmEySmxlaVpZ?=
 =?utf-8?B?S3QrWXNtMUFCbGhvV1JlYzdnQ2lpL1E5Rm54TTdqY1VuZDRxbUlnRURMaVkx?=
 =?utf-8?B?L1l2SjUyMzZXOFIwTkF5RS8yeUpENFJVaU1NbThSK3p3MXVkTDN1eWdaVzJC?=
 =?utf-8?B?cGNlTlZXbzN3dGdta2orRWVhMldsUXREVGVlSWNaY2RVS1F4OW96NEpHTnFv?=
 =?utf-8?B?UVIyVHlrVDY3YUNsRlpzL24wWk41Zmk2WVNvZVhKNkNXbzRJQjRNaFlyaXN4?=
 =?utf-8?B?b0ZLQkt3TzI5Q01tRVN5WjlmV2kzM0lHcWNJb1l5aTRkb3JIOHB5YjdRbVQ3?=
 =?utf-8?B?cTQ0WVI3NXFCRkFKdmFtU29ja3k0T3VoSjlWMGdPWDFsQ3FEYzE2QXFzRE10?=
 =?utf-8?B?Rnk1Q3RyTnFHRVc3c1dNVHdEaGhlL216bUt5UDhjUm1EWUxXV1MxZXo5djlt?=
 =?utf-8?B?Y3NtMkpWdFFvQTVLVlUwaVBzN0kzcDFOZCt2NlpSUDUyK3NqdklSUGFEY0p3?=
 =?utf-8?B?c1NsL2t6SjRpOVBvQ1hHTHdkQnJFSHpDc09ldlZRS25LSUlhR1FaYzhsZE5h?=
 =?utf-8?B?TVpERytZRDVWdW1qWG5uUGQ4ekhXWS94bzNtS0ZzM01jd0krOUtET3Nwbk5l?=
 =?utf-8?B?WFpZajJNbktaeHZ4N2VVNkxHNmtCZCs1bE14Wjd3ZmhtbG5qU3VtelRJakpD?=
 =?utf-8?B?RHdLd2lnTDQ5SEt1NVFjdURoZ1lDWGV6aTJ4Qkt5RVloVlFHN01ySWJrekNh?=
 =?utf-8?B?cTRzY2ZQYVFiQzFOMVBiOEF6SkpDOEloSnc5aDN6WHZkeHdhZS9wUFJrWWs0?=
 =?utf-8?B?b3V1VDI5Snc0blFpN2cvZzkyRmdnZ3lnb0tYb1Q1V3VZa2gzZEQvWXlObUtj?=
 =?utf-8?B?bW9JaGwzV2RGWHlyM1R2RkVXOWcxdHdVek1yVE84aFVuZHkzclN4OGJtSkQ2?=
 =?utf-8?B?RnEzR1JmZHZ6MTFab2ZxNk1HR0pwREU0U29UWTFhY2VNbWVTNUdOOWREbTQ2?=
 =?utf-8?B?M3l0bzlBbEVvTjNRbUFyZ0RYNkRCRDFMNVBpSHF0ZW8xclVkOTg4RWR2TXlo?=
 =?utf-8?B?b0hYbEZoYUF6ZEZhQnV2VllqMG9VeFBEZUVyV2xPSVg3eUplT09uemNGQ1ZC?=
 =?utf-8?B?WUNwRTVGVkVDb0lQS1NOY0EweWZXU2VPcWU0aEJOVmN5d0pkUDMxRko4czNw?=
 =?utf-8?B?UWkzZEhpZ2NzMVh6SFRRc3F2S3B0OUJVVUhGWjNVRDBRekw5US9lMUJEeDI1?=
 =?utf-8?B?ZytaZWdncXJjdkkyWXFHblNMTnVxZzFDUG5kMkZ5RXZ5Tkp6aDRaSUVMdFJO?=
 =?utf-8?B?VmpBaXNDOVNoTi9RUjlTU2pEenJGVzIrTEU2cXN4M29wN0VteGthU0NKWlk0?=
 =?utf-8?B?L3hhZVV1YjVOODUvdHl6b3ZNMVpsb2VuNzU5Z2JkektITW1valFsbUhmb25M?=
 =?utf-8?B?WW9aT1pneWpyWGtmYlpJaWFtZ0xYalZhcGhGaitneFhBdm1WU3djenRqdWcx?=
 =?utf-8?B?d1FMUHBvVGowZXRGbXNqYjE2KzlkSDZCMTh1TTYxcnhJUzVEWEZZSHp3N0F6?=
 =?utf-8?B?YVRySkRkdnlCdlRHQ0xPQmJXbXloNDJJbDJxdys2NlRmSW5NVGZzVGx6NGk4?=
 =?utf-8?B?Y1Y4Y3BwOCtld1loUDhaSTRyRnVKdUFNaEFWNzFGbmNDMEFFZG1kczErQUlV?=
 =?utf-8?B?eXpyLzhkd2JhRWZMV1BvM2NKU0hjeEI0SEs5K3YyRzUrcTYrV2VyNml2NElE?=
 =?utf-8?B?Um1TWlI4U01qdlRyK2RyR1lRVm5FKzF0ZDNFRVBkQ1lOZ0IyUzNZUDJGcU1S?=
 =?utf-8?B?bjZqenI5QkRmejRSdUJ1NGp3aFBSeWd6ZHNJSkhJc0M5d0I3d3djSWRVeDRU?=
 =?utf-8?B?dDVzdVBNZnBQeW5SbUpGWHc1T1ROVXpkUUFFaGZFTUZVVitMVzhtQVhKN1Nj?=
 =?utf-8?B?REZGWmJUaUhMeUsvWEovYVJvL3Vra21LcGJpM1RTMERObEcxNjdvRkMxYktl?=
 =?utf-8?B?ck1jL2dDQ1VMcG9ZZGtIWTd6enRWOGdabUFOaUNucDFEQ1VreUIyY01IK1Np?=
 =?utf-8?B?bDJJNnJiYUtGK1lhNjY1cnB5RGNoeUpMNUtwOGJDYzZOYzk5dzJsVmZQWUNQ?=
 =?utf-8?B?SkJjWlVlbWZ2UHRSbXRqL1NiVG5zcndvSHVnYU5rUWs3WmdOVzNGVHBxR3F3?=
 =?utf-8?B?TVI2UU9TNHFYNnp1R0xIZC9IUlhxOTM5NUMrWVN4eS9VUnYrTk44S2VSUW00?=
 =?utf-8?B?dXM1SWFrS1BMdmliRjZYMkZGcVIvQzhUZXRFKytQMXRVMzk2eWZHZz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0158a0a6-917e-41bb-4c18-08ded6ac4295
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2026 13:34:07.2697
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WxHzS3u2KSSpaKdtIkvVIfhaqy8pYFmL+rRTNebalwPeK3KKpo4Y65Lw4cKuzvQObq0xl+bfXSJngjTLq7GBJVSk7d6hKOEDAYudx19Z4CY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13939
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39225-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:biju.das.au@gmail.com,m:geert+renesas@glider.be,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,vger.kernel.org:from_smtp,bp.renesas.com:dkim,bp.renesas.com:from_mime,renesas.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E96166E4EF8

SGkgTGludXMgV2FsbGVpaiwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBMaW51cyBXYWxsZWlqIDxsaW51c3dAa2VybmVsLm9yZz4NCj4gU2VudDogMzAgSnVuZSAyMDI2
IDE0OjI5DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjE4IDEvNF0gcGluY3RybDogcmVuZXNhczog
cnpnMmw6IEFkZCBTRCBjaGFubmVsIFBPQyBzdXBwb3J0IGZvciBSWi9HM0wNCj4gDQo+IEhpIEJp
anUsDQo+IA0KPiB0aGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiBPbiBNb24sIEp1biAyMiwg
MjAyNiBhdCA1OjQ44oCvUE0gQmlqdSA8YmlqdS5kYXMuYXVAZ21haWwuY29tPiB3cm90ZToNCj4g
DQo+ID4gRnJvbTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+DQo+
ID4gQWRkIHBvd2VyLW9uIGNvbnRyb2wgKFBPQykgc3VwcG9ydCBmb3IgU0QgY2hhbm5lbHMgMSBh
bmQgMiBvbiB0aGUNCj4gPiBSWi9HM0wgU29DIChyOWEwOGcwNDYpLg0KPiA+DQo+ID4gSW50cm9k
dWNlIFBJTl9DRkdfSU9fVk1DX1NEMiBjYXBhYmlsaXR5IGZsYWcgKGJpdCAyMikgYW5kIFNEX0NI
Ml9QT0MNCj4gPiByZWdpc3RlciBvZmZzZXQgKDB4MzAyNCkuIEV4dGVuZCByemcybF9jYXBzX3Rv
X3B3cl9yZWcoKSB0byByZXR1cm4NCj4gPiBTRF9DSDJfUE9DIHdoZW4gUElOX0NGR19JT19WTUNf
U0QyIGlzIHNldC4NCj4gPg0KPiA+IFJlcGxhY2UgUlpHM0xfTVBYRURfUElOX0ZVTkNTKCkgd2l0
aCBSWkcyTF9NUFhFRF9DT01NT05fUElOX0ZVTkNTKCkNCj4gPiBmb3IgcG9ydCBQRyBhbmQgUEgg
cGlucywgZHJvcHBpbmcgUElOX0NGR19TT0ZUX1BTIHdoaWNoIGlzDQo+ID4gaW5hcHByb3ByaWF0
ZSBmb3IgU0QgcGlucywgYW5kIGFubm90YXRlIHRoZW0gd2l0aCBQSU5fQ0ZHX0lPX1ZNQ19TRDEN
Cj4gPiBhbmQgUElOX0NGR19JT19WTUNfU0QyIHJlc3BlY3RpdmVseS4NCj4gPg0KPiA+IEFubm90
YXRlIGFsbCBSWi9HM0wgU0QwIGRlZGljYXRlZCBwaW5zIChDTEssIENNRCwgUlNUIywgRFMsIERB
VDDigJNEQVQ3KQ0KPiA+IHdpdGggUElOX0NGR19JT19WTUNfU0QwIHNvIHRoYXQgcG93ZXItc291
cmNlIHJlZ2lzdGVyIGxvb2t1cHMgd29yaw0KPiA+IGNvcnJlY3RseSBmb3IgdGhvc2UgcGlucy4N
Cj4gPg0KPiA+IEFkZCBzZF9jaDIgZmllbGQgdG8gcnpnMmxfcmVnaXN0ZXJfb2Zmc2V0cyBhbmQg
cnpnMmxfcGluY3RybF9yZWdfY2FjaGUNCj4gPiB0byBzYXZlIGFuZCByZXN0b3JlIHRoZSBTRF9D
SDJfUE9DIHJlZ2lzdGVyIGFjcm9zcyBzdXNwZW5kL3Jlc3VtZSBjeWNsZXMuDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0K
PiBJcyB0aGlzIHBhdGNoIEdlZXJ0IGNhbiBhcHBseSBzZXBhcmF0ZWx5IGZvciBwaW4gY29udHJv
bCBpbiB0aGUgZW5kPw0KDQpZZXMsIEdlZXJ0IHdpbGwgYXBwbHkgdGhpcyBwYXRjaCB0byByZW5l
c2FzLXBpbmN0cmwgdHJlZSBhbmQNCnRoZW4gcHVsbCByZXF1ZXN0IHRvIHlvdS4NCg0KQ2hlZXJz
LA0KQmlqdQ0K

