Return-Path: <linux-gpio+bounces-37937-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fW8pK5VKIWqhCgEAu9opvQ
	(envelope-from <linux-gpio+bounces-37937-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 11:51:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB4B63EB0A
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 11:51:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=Jyq+GXrk;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37937-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37937-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C4273019045
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2026 09:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B7F37756F;
	Thu,  4 Jun 2026 09:39:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010028.outbound.protection.outlook.com [52.101.229.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BFD326D4A;
	Thu,  4 Jun 2026 09:39:31 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780565974; cv=fail; b=XSeXPqDOE43sT1Pind0zTEQd85OvrrGxHjDQeN62CfurksJGQlAJ5ez1C/ZdtBkknTRUc+Gj7DGukmcfkgMJT8rvNkMde9LHi2cZ8+UvSS4ib+bJWqf3J93CR2UKiYqjOQltBODZwW1Jaolp4h3PxP52Ue5BwAVkI7bQqmk4xfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780565974; c=relaxed/simple;
	bh=2FjluqDexHwd1RgC4iECLiWFRrPHGZpiIjKQy1SleQc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EwNv3Kt4nkN1Wf3kUCxsVtsdf0CxW+bdRGe2hcjL09OQZ35+t780o3iy+9glMM/4Z2JR3UQQpOoJSLLNS2Q1PEvc4GQtwZkJHMosx8L5FhTy1n9ps+YCVt8PlNQjLgD0HH5ByrLnVHG/ZyeF6fpZ1CVcoHZS7bmYv0dQreHMKGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Jyq+GXrk; arc=fail smtp.client-ip=52.101.229.28
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NzrvdZAeTegRUUGMNyRCMhvKUwE6yeJ1QYuVPin4xTv0IV6xioSinpdMziTq+JhV+INauOsPTVAviK9V+7tZhnwt08BECRFOY5PkEoMAZ819tQstWriGcyYQdOoeoD7mSTUn/tsT7C6bfvTqjexAIorleS2k4d98mbanCr65bUE4VTttm2SL+23/RbKgOD7freKmVwUM5U7nFe0rAqyTxrDduzsLJ+p52Vov5fXq1nQCafEeTsdXVEnut3ZdBqq5vRAu6juSvVsjb6dC/bYI6aZi30bGUgayHFQ/3l9VgLJa9g8YGTSlCAoQGQ8/pHqTytOj37arMryXoXV/B3yzCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2FjluqDexHwd1RgC4iECLiWFRrPHGZpiIjKQy1SleQc=;
 b=oi40RDCJaLby1UWAAcxgPjpdTEpnwnBgq9vGYGFO/3k26mkHLtlib21bRAu9qKF7jDC7wrIgY/FepYqARLrgfNQ2unyMz5+uKxg5jpjF1XBhWIW9DKpWuCQEjxHfZ9aqeVm42cv9V9kR81hxJNzyDeaV+oNGKHCcUAyX3MCxs28KJoWq/N4UgopFPDqDHebKwUtemlrqA2yRVv4m1o5NVu42hi4vj00SOyNhr/CK6asK2fjeytepONn/vzeRaBE9JtHf9dVuyyl1jgkZeQbn0d7alJJzF1V6rWTl7NIiopYkAQsySQARU0Tfvwcf1CZuHw0LGdhLG2Z0RDf9D5BP1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2FjluqDexHwd1RgC4iECLiWFRrPHGZpiIjKQy1SleQc=;
 b=Jyq+GXrkjbQHoFz4jsCf3DUhfzO5M0n4Vf9dA78wXsoeLMldyuYUrtRy0TUTx1g44Fheo5JG6lQAHr4Aq+k7Ft1b/RPrb93cz/GIGeuBZXPQZNrxaaqpWyl3MlHDUlOBP7yiaeY7LrFGSQzRg0B/56q2G+WJO+KTa6KQKkkdRvI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB12904.jpnprd01.prod.outlook.com (2603:1096:405:15e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 09:39:29 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 09:39:28 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Linus Walleij <linusw@kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v17 03/17] pinctrl: renesas: rzg2l: Add SD channel POC
 support for RZ/G3L
Thread-Topic: [PATCH v17 03/17] pinctrl: renesas: rzg2l: Add SD channel POC
 support for RZ/G3L
Thread-Index: AQHc8yZIoAtVoRsHYkuwZIp4sst3fLYuI9yAgAAAv0A=
Date: Thu, 4 Jun 2026 09:39:28 +0000
Message-ID:
 <TY3PR01MB113463445C123FC4CF0DB083E86102@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
 <20260603065731.93243-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdWKygm2zG88Pj6HYeotmteMAvqZOrSFo4DLScHLmzN_gA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWKygm2zG88Pj6HYeotmteMAvqZOrSFo4DLScHLmzN_gA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB12904:EE_
x-ms-office365-filtering-correlation-id: 79fce9f8-4bde-4b72-db4d-08dec21d2bff
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|18002099003|22082099003|56012099006|4143699003|11063799006;
x-microsoft-antispam-message-info:
 9JYNWB/hnDoDmMl+XkG6qFeJQVpgsnTUNwEYqJdpF3WjAtNl5ryH5493A4DiHXZoIx/NbdlqD8tVZ+ZpXjCRg+GgSlGRCbkP4ORMizYBk/I3G7nZj1OnTEqgSNLfSBcB86J4SfQshI5S19U5DfhOFCVs3U3koNRuyo5yrvcVSGUgpuR6ksetfPsm0dHCYwkDcn128fHl6qHlIlKsg83dCFnSADNYZ8QX5Sz108R9/6LvLlgUOVrEB2HEcPCU+O0vgM0MrpseR3RUmY1gW1AiqMMl5UR/0U43s9LuchLkIgLfjezJB/0FD3gzAomsPdoaKv18Gy5Ku7KHT7T6fz4XTYHEo4vpiezZz8KUmHZD6blni1C+5Ea8zH7fvI7yH9cRALh+EnzwWpRJRTMnnNN3wL6FaWx0LbniEwnRFGkOEkmvfi3PGdSUiSljyVCXZStWBIuXKCJaIkydYl/yCz46Xt/GRRFMqw7sH1x43WRrI1h3f2mQ5AGcgAPEnDRaeAZ7Muj9Zyzd6nzQxyXJ2/rbNXucIba2mZ3Qt8RYk72lPJ8i+vofID425BS2/GlYCijQTEBA+lVzooM5K6dJRCB0qPgo0ioItriYrPIJm8rR9a4gNlsD1bUYVQ/tmFeBG25339rFHvhrkOXQPTnd2sqU0l7Bm7tgcE6fyuuNvstJ0sDfPphwlIbg4/FKs3mDW4/hgErydzbOUdKNVNqEP+Nl8bh4z3+id7VBFjXw6YmB2WH/vSNjJ1jPBigRmC6UV0Jw
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MW1zTjhNb0VVYjFhWXFtWlV1SDQ4SE5EVVh3ZnRNa1JhcjBNa2QvaDlHZmJX?=
 =?utf-8?B?T215aXBWUjB1NVcxSkY2WUc5ZTFBNit4UW1hUWx5NU5EeC9SdWFkLzE2MU5j?=
 =?utf-8?B?VGFYVldEcEJuS3dXdWhxaWVLTEFUS1M4Vnlkdlk2T0NlcDI0bjNzZVVsQzRM?=
 =?utf-8?B?d0puSUFCclZGeWlUMit0blhPeEFhNjFyU2J0elA5MHEzOU9DbVNQb1dDN201?=
 =?utf-8?B?cHFDTzRMOGEvN0I5TlF0cmpRM25pTHh6L2V1Z3FscUlESTNEVGpyQ1lBd2l3?=
 =?utf-8?B?aVRlODRqbXZIZ1QvQXVmcndkSTdEQzF6ckdaaC9uOGZiZmhRaDhDSS9SRXA4?=
 =?utf-8?B?VDVNSTcyWTNqRFJFcG9ENU0zS1RjT2YzYU56djBHNzdsN2hDa3BJTHZjRGZy?=
 =?utf-8?B?WDUrZm1RVFFIcWxJRC9KOFo5azlBUVRuNlZNUEVFZWU2NVF0SGVhb2VMZXdi?=
 =?utf-8?B?Qngvb3lkZ3BMd0tOdXNRVks2MXh4VTFJVFpORDU3WDh0TTYycDdzVzRoeDBq?=
 =?utf-8?B?TDJ0ZHZkdWxMcmplTTFKSDlEOUsydG5NVTN3dEtrRjY0YmtsSVA4MzVXejhn?=
 =?utf-8?B?TGlQVUd2ZVpIQzNxMkZsMEY1ZHYxcjVib2hFcHlXUXYvNEJqWlRudUhSTXk0?=
 =?utf-8?B?MDVNOUQvODBGRUM0L25yUFZBR1Q3THIvVGt2TURwenNXSXJlZzhEaVZiaUtk?=
 =?utf-8?B?ZFczdDJQNzVWeEVnL0VRTmtURTRnYnRMb2w4WnhGcXlPbm9WaHlLYjNpNlZL?=
 =?utf-8?B?OTBFYU1ObXAvYzhSZXN0aW1MRWpwUFpSUGM2OVUzMUtmVUFJdGVLS0ZmZzBQ?=
 =?utf-8?B?QlZ5bG5GQWJtNmJnZXhjVGFqaS93aU04c2l5ZktuL3psdEZ2UGlFbGF6MUY2?=
 =?utf-8?B?U3ZWeHhkZFJab1lBTGh2VnFaM2ZmZXZ5Q0lNVTdzNEpXQko4Mm14d1lRK0lI?=
 =?utf-8?B?WWlXaGp5eE5zOURIaldXazB6WmpvTm1zaUd2RW9yM3NaaDN6MGF6c2YzUGta?=
 =?utf-8?B?UEszR2U0bnN2ODBSOVVFZEhmMC8yWGVZdDlqaGkyUGZzTTdLdWZ0VmVoZTBH?=
 =?utf-8?B?RHhGNEUwbDFCWDJHZUdJY3Q4aE9DSUo5VmVJT3BhbGZOWW5nQU5SRDlqTjFD?=
 =?utf-8?B?bUE2bThCT2lWdTFKQmxob3JXTnRXaytIcUtNRUJ0QWVzSnh0cnZpYW1uSDVo?=
 =?utf-8?B?UGorb0RRdEJ1WFE1R295dGpjc1JoYkxaVElpZEpBeXNRUllIVzNqQnp3dUE1?=
 =?utf-8?B?dmVNKzVQcXkxSUorWndsdG9CVTYyR2VUYXI3dnM0Tmc3TFI1YVkrRUQ2TUFC?=
 =?utf-8?B?NEQxeHNPaS9ZSnlvRlc5bStxSWU2TTJzcDJqOUFXdFUrU3JlS2NwdkRkL0Vr?=
 =?utf-8?B?UDZDanYvdVIrMEpwYXozMGRUOElaRHBINWZIdXBiQTkyRUhWaC93LzloeExY?=
 =?utf-8?B?SDFVcDlsa1hXWnZiYkhGYWpoT2piaHc4S0ZDdGpVM0pwaVQ3ekJwdFJ0OEk1?=
 =?utf-8?B?MG5uaTViWDc5SWtvbWJQR1RuUnBPa3FMdExNZ2J6anJtRDYrM1VSRlVwRjBv?=
 =?utf-8?B?MU1lNVdIZXFRSDNtUDV0Z2NzNWJaZVlKTHM3NU9Kc0ZzZE4rMEtnbStBb3dB?=
 =?utf-8?B?eW91akJhSS93ZHFGank1Z2NBM05HbEtrc2oxenUrR2x0N0tsNTdTNWhUdUZo?=
 =?utf-8?B?NDR0dnZlYkJBWGQyM3VHMzJRYytFaVV6TXhFRVIvL2Z3MkZMaFZkWFNRWEpS?=
 =?utf-8?B?U0w2NkdWZTVkV0o2Z2oyOVpZd1JKSWlZNlNrcnRjWWVsSExSSHZIY0Q5MkJm?=
 =?utf-8?B?czNDWE9CaEhBeUs1WWJQQUxqc3ZQVFdpQTEyT1MyaVBuM2RvYlRsYmk1S3NI?=
 =?utf-8?B?N3RYUWlPYzNKZUhwZFo5bTNiTXdmbUNBQjQ3bFBFNFNqb0FSNldHWVVRWjFS?=
 =?utf-8?B?L21BbVFJVU5CK1BaYjVWUFIxRHpvcStlaXNUN0dMdmhVYi9iWi9lK0VRZzU4?=
 =?utf-8?B?VW5IZFBtdXpkV0J5azROVVZxTk44cmt4b0ZMaHl3VFo0V25tOVZ5dnFGWmxy?=
 =?utf-8?B?c1lDL3puc1dEU2xnTFdEZW4yQVNXUloyZC9NR08yL3lKcEU1SGxnNVl3TStW?=
 =?utf-8?B?SDRFWXMwZ3g1b1B6Y1J6cnk3MVVIWFNZZy92eEZCLzVFTC85ZTh2eFhmSUc5?=
 =?utf-8?B?UlF1WjloNDNBWXlCbHkyNU5xMFh0VjNRR1FJbVVNd3pCZnV4dFNTYnhDZTA4?=
 =?utf-8?B?NFg3WWpIZjUyWXVGMzN4ekxOejlHK1hxeE94Vjd2cjMyajdmMXFVN3ROeHNU?=
 =?utf-8?B?S25xN24rbm85c3UweXdsTkZqa1ZBd2NKZzlZanRHcDFVTmFSM2huUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 79fce9f8-4bde-4b72-db4d-08dec21d2bff
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2026 09:39:28.0953
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iQigJgd1LeS7NQILsf8q9IjNFXz62kHASRtiIpgXcYJ0eqS9oQ3ZBXwDPno5wTuLij9h14vg7TMLQzD2UzorScLps6iiRnqN/vc1k0PjFK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12904
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37937-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:biju.das.au@gmail.com,m:linusw@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,bp.renesas.com:from_mime,bp.renesas.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3EB4B63EB0A

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDA0IEp1bmUgMjAyNiAxMDozMw0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IHYxNyAwMy8xN10gcGluY3RybDogcmVuZXNhczogcnpnMmw6IEFkZCBTRCBjaGFubmVsIFBPQyBz
dXBwb3J0IGZvciBSWi9HM0wNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBXZWQsIDMgSnVuIDIw
MjYgYXQgMDg6NTcsIEJpanUgPGJpanUuZGFzLmF1QGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4gRnJv
bTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+DQo+ID4gQWRkIHBv
d2VyLW9uIGNvbnRyb2wgKFBPQykgc3VwcG9ydCBmb3IgU0QgY2hhbm5lbHMgMSBhbmQgMiBvbiB0
aGUNCj4gPiBSWi9HM0wgU29DIChyOWEwOGcwNDYpLg0KPiA+DQo+ID4gSW50cm9kdWNlIFBJTl9D
RkdfSU9fVk1DX1NEMiBjYXBhYmlsaXR5IGZsYWcgKGJpdCAyMikgYW5kIFNEX0NIMl9QT0MNCj4g
PiByZWdpc3RlciBvZmZzZXQgKDB4MzAyNCkuIEV4dGVuZCByemcybF9jYXBzX3RvX3B3cl9yZWco
KSB0byByZXR1cm4NCj4gPiBTRF9DSDJfUE9DIHdoZW4gUElOX0NGR19JT19WTUNfU0QyIGlzIHNl
dC4NCj4gPg0KPiA+IFJlcGxhY2UgUlpHM0xfTVBYRURfUElOX0ZVTkNTKCkgd2l0aCBSWkcyTF9N
UFhFRF9DT01NT05fUElOX0ZVTkNTKCkNCj4gPiBmb3IgcG9ydCBQRyBhbmQgUEggcGlucywgZHJv
cHBpbmcgUElOX0NGR19TT0ZUX1BTIHdoaWNoIGlzDQo+ID4gaW5hcHByb3ByaWF0ZSBmb3IgU0Qg
cGlucywgYW5kIGFubm90YXRlIHRoZW0gd2l0aCBQSU5fQ0ZHX0lPX1ZNQ19TRDENCj4gPiBhbmQg
UElOX0NGR19JT19WTUNfU0QyIHJlc3BlY3RpdmVseS4NCj4gPg0KPiA+IEFubm90YXRlIGFsbCBS
Wi9HM0wgU0QwIGRlZGljYXRlZCBwaW5zIChDTEssIENNRCwgUlNUIywgRFMsIERBVDDigJNEQVQ3
KQ0KPiA+IHdpdGggUElOX0NGR19JT19WTUNfU0QwIHNvIHRoYXQgcG93ZXItc291cmNlIHJlZ2lz
dGVyIGxvb2t1cHMgd29yaw0KPiA+IGNvcnJlY3RseSBmb3IgdGhvc2UgcGlucy4NCj4gPg0KPiA+
IEFkZCBzZF9jaDIgZmllbGQgdG8gcnpnMmxfcmVnaXN0ZXJfb2Zmc2V0cyBhbmQgcnpnMmxfcGlu
Y3RybF9yZWdfY2FjaGUNCj4gPiB0byBzYXZlIGFuZCByZXN0b3JlIHRoZSBTRF9DSDJfUE9DIHJl
Z2lzdGVyIGFjcm9zcyBzdXNwZW5kL3Jlc3VtZSBjeWNsZXMuDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3Mg
Zm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvcGluY3RybC9yZW5lc2FzL3Bp
bmN0cmwtcnpnMmwuYw0KPiA+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BpbmN0cmwt
cnpnMmwuYw0KPiA+IEBAIC02OSw2ICs2OSw3IEBADQo+ID4gICNkZWZpbmUgUElOX0NGR19QVkRE
MTgzM19PVEhfQVdPX1BPQyAgIEJJVCgxOSkgLyoga25vd24gb24gUlovRzNMIG9ubHkgKi8NCj4g
PiAgI2RlZmluZSBQSU5fQ0ZHX1BWREQxODMzX09USF9JU09fUE9DICAgQklUKDIwKSAvKiBrbm93
biBvbiBSWi9HM0wgb25seSAqLw0KPiA+ICAjZGVmaW5lIFBJTl9DRkdfV0RUT1ZGX05fUE9DICAg
ICAgICAgICBCSVQoMjEpIC8qIGtub3duIG9uIFJaL0czTCBvbmx5ICovDQo+ID4gKyNkZWZpbmUg
UElOX0NGR19JT19WTUNfU0QyICAgICAgICAgICAgIEJJVCgyMikgLyoga25vd24gb24gUlovRzNM
IG9ubHkgKi8NCj4gPg0KPiA+ICAjZGVmaW5lIFJaRzJMX1NJTkdMRV9QSU4gICAgICAgICAgICAg
ICBCSVRfVUxMKDYzKSAgICAgLyogRGVkaWNhdGVkIHBpbiAqLw0KPiA+ICAjZGVmaW5lIFJaRzJM
X1ZBUklBQkxFX0NGRyAgICAgICAgICAgICBCSVRfVUxMKDYyKSAgICAgLyogVmFyaWFibGUgY2Zn
IGZvciBwb3J0IHBpbnMgKi8NCj4gPiBAQCAtMjU4LDYgKzI1OSw3IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgcGluX2NvbmZpZ19pdGVtIHJlbmVzYXNfcnp2MmhfY29uZl9pdGVtc1tdID0gew0KPiA+
ICAgKiBAb2VuOiBPRU4gcmVnaXN0ZXIgb2Zmc2V0DQo+ID4gICAqIEBxc3BpOiBRU1BJIHJlZ2lz
dGVyIG9mZnNldA0KPiA+ICAgKiBAb3RoZXJfcG9jOiBPVEhFUl9QT0MgcmVnaXN0ZXIgb2Zmc2V0
DQo+ID4gKyAqIEBzZF9jaDI6IFNEX0NIMl9QT0MgcmVnaXN0ZXIgb2Zmc2V0DQo+ID4gICAqLw0K
PiA+ICBzdHJ1Y3QgcnpnMmxfcmVnaXN0ZXJfb2Zmc2V0cyB7DQo+ID4gICAgICAgICB1MTYgcHdw
cjsNCj4gPiBAQCAtMjY2LDYgKzI2OCw3IEBAIHN0cnVjdCByemcybF9yZWdpc3Rlcl9vZmZzZXRz
IHsNCj4gPiAgICAgICAgIHUxNiBvZW47DQo+ID4gICAgICAgICB1MTYgcXNwaTsNCj4gPiAgICAg
ICAgIHUxNiBvdGhlcl9wb2M7DQo+ID4gKyAgICAgICB1MTYgc2RfY2gyOw0KPiANCj4gTml0OiB5
b3VyIHNlcmllcyB3b3VsZCBjYXVzZSBsZXNzIGNvbmZsaWN0cyB3aXRoIENsYXVkaXUncyAiW1BB
VENIIHYzIDAvNl0gcGluY3RybDogcmVuZXNhczogcnpnMmw6DQo+IEFkZCBzdXBwb3J0IGZvciBS
Wi9HM1MgSTNDIg0KPiBpZiB5b3Ugd291bGQgYWRkIHNkX2NoMiBhZnRlciB0aGUgZXhpc3Rpbmcg
c2RfY2guDQoNCk9LLCB3aWxsIG1vdmUgc2RfY2gyIGFmdGVyIHNkX2NoLg0KDQpDaGVlcnMsDQpC
aWp1DQoNCg==

