Return-Path: <linux-gpio+bounces-30495-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3398D19A41
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 15:56:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3E521300A298
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 14:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 928B62D5C7A;
	Tue, 13 Jan 2026 14:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="L5BUkI5S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from USG02-BN3-obe.outbound.protection.office365.us (mail-bn3usg02on0049.outbound.protection.office365.us [23.103.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310661E230E
	for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 14:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=23.103.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768316192; cv=fail; b=GIx8QCX/ub0ClG3jjJjjdbaWrClLdMH1+xuHHqY8h7WAV/nM97ptlwoJG4zmPlM2ijKLOLnxaP/MfW3g0YRxwWpE/rd6UHJlxTQejznQ1KNYlA51/xPW7RnTJIKOmwJ+yeAvKfGy0L1cXnsAqa+jNBXsOXIwPX44lTkfncu/buA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768316192; c=relaxed/simple;
	bh=KMGu9nepIjSV8rnf7wCrk1gPELTmagLLJuc9ZD4amAU=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=UWcZb9fvmtD7XxROtb5Evy9siVA1Sc21rKkVlCncIajJ5htFMwvcMIMA3f3PIqn1CP/cIUY0vB0y2aX1jpsJ4ph2GH1IkBOj73GAvknRhJAEUGpSfm3oIDsbeuBNbtduHjhei1wjdeA43102qRj+4rF+Ef7BiHY/VGThb1IlD9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=L5BUkI5S; arc=fail smtp.client-ip=23.103.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=Fwsvvvl6XgCUCYOOy6BCMxRc2zlEekZjrjlSGJD0vtEJNnBpF6V9knDkBVyLqi9LqEe3Lkp6SKI5oaCxVGod+igejgZ3cw1sCgnG4rj3qyXuLUVdyTWHvEAIn3r+52kMBI7ke+QVV5tIZFqNUzzVhoVU7GRdDp9DMiTHqSTj1PqhN4W8L1HU1TA1bS10U1M0oP/8zOdm2rb6WGiV2Ris7wb5f+k9cAvszXWl6VMTSQPo63AYjv+hr1mqv946NTAMbpjdn4iXsKj5bjQ5EaqV0jQSG5vES/jVWLAAt2asYhuoR3+EmWfRU0mHD0nYaoyjsyiZbLfuB5r4ELANn9q2NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z8FBUmuwHbvhMgUr/oy5JRHlQ92Cz81y7bn1IBqSfJQ=;
 b=DgiCXg5IyRqlLiNnTDBmWVVVkF4E5flMndGvKg31ZDe4hp1MuitfrX0mFQusuzQJmjGcE43QRhRPQ6fuduSWCNcgjtfL8OGTmZrNI4bLOvhP+xFkh599LTsbxXrZVuYVlXFnIdl/Kzauirf1rgNmgLf9gGq/mjNWQnKKXnJd+07NiENrlAL6DNHFEXcV+dZH/NaiveUdFNJCtM7/AxwlTw/i0t74f/ul4LtKU7EIOAH5lgroMWvSvKK469ZV55X/RhyOy3KucfjlTnRrPTgR55cyP7nW+9DotlVHrD1vFWRpFTkcRSX7MRHT1MMvRkJW85jlaZ62HMkkr2NoFZ9P7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8FBUmuwHbvhMgUr/oy5JRHlQ92Cz81y7bn1IBqSfJQ=;
 b=L5BUkI5SynuaxrimT/1L0YuXvEjEdyvzDgpY9Pu4p15HhnHqR6RsjyPpN0fEJSFJvZp/VJpkxLfg/Tc65pYaD35RVR/yQsE0TZRxD0ZKMm3zRNy6ao6sVkUXS88Wc99temeY/wp+wZIuhg8+yalbnyjdrVtXuimehwUxrr1KXRyCD49aZzdzE733iKEjuxb5KmJPNUUeRcRtM9IA96tP/3Ibjr+zYm0/jRbzlkOCvkcOTQz0vgUY/eOzxABiSBq36AoW4G/n2UJvTB+NPwCARfKiqCkv1+uRD/ju+LOFr9xx/F8KR0JGfWpTte1adnBv6rLfMMFr4lcaALenY8Pl+w==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by SA1P110MB2131.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.9; Tue, 13 Jan
 2026 14:56:21 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%4]) with mapi id 15.20.9456.008; Tue, 13 Jan 2026
 14:56:21 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij
	<linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Pierre Gramme
	<pgramme@gmail.com>
Subject: RE: [PATCH libgpiod] bindings: python: add missing Py_None reference
 increment
Thread-Topic: [PATCH libgpiod] bindings: python: add missing Py_None reference
 increment
Thread-Index: AdyEnHlh0AqHPOlDR0uJ/4/ytZUcbw==
Date: Tue, 13 Jan 2026 14:56:21 +0000
Message-ID:
 <PH1P110MB160325D71D5B0C48247C0BF99F8EA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|SA1P110MB2131:EE_
x-ms-office365-filtering-correlation-id: fca36ffd-20b1-4b16-f9f3-08de52b3ea1a
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|41320700013|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?0CEO8bpWK2I8Vwx8CSE24E18wr06PsV2Sa+q1PEuk4Nq2VPNsA+m24dCkjsR?=
 =?us-ascii?Q?k4MqX2UdxKJOl7wRfnPVuUpk58EEHAOoGl4WNc+MZTbfCXy17Vg3I/2HYo4q?=
 =?us-ascii?Q?3UIZWVFHwBwIz2wpECxN0xj65QFyRZY+IZFkPM4EEAhL+J5R6tD4EbZRMmaO?=
 =?us-ascii?Q?gZj16GFyY86/2xSTYuItbXQSpYAHLy6BQzMN1129Sro36bDKWnF0P0R1jTxO?=
 =?us-ascii?Q?KmmO9m5qOnelGhcI8Y6diQkvr7BZ5Ssmo5WlnRWYjizpIdJXGw8JsQZvKkUD?=
 =?us-ascii?Q?N7wDAqKEXxXCJN0VMaNvveCDH2Ek2k2G/XR3nmeohQYwRLO3prqD9wRACINX?=
 =?us-ascii?Q?mNvm/RuRjNw92wiGGrw9fRbQaDp8uYLqRCyW8QjDeR1OrhuFqZIZU4P7uy7A?=
 =?us-ascii?Q?p/Z5KSyblkmPsIF3SH6VPzny+98/Qaa1iGIPQzA0XNepMHL2ygH8ahv6ayvX?=
 =?us-ascii?Q?VEeWqHUcx8B2TQ1+o84cRW1AdvoXW2EI7elRwV+OQ5mQhC+wySLAXXBWIknr?=
 =?us-ascii?Q?WSdFdHWtb25+ZcCXAl+2IclkKPTZqAtqZquq+U2i5itd7ozHx+4nCeQ89K5P?=
 =?us-ascii?Q?3XJza5RoD4JKY8THx3rVvN8m+gZToKNy27dD9yh+fSu0yBn0N4+Z3Vw5YiIg?=
 =?us-ascii?Q?B15nJN/rrPRS8hAoGSa8G+AAGTCsEQ50/0Yr6ygm6xPUYLd+S111n2wf67Hw?=
 =?us-ascii?Q?T6AGG9tD9oQA0I7tU5klDYcPURyKn+ICuV8WrZ/xgglDkhc2ndJ4HXx/nbhd?=
 =?us-ascii?Q?4IHhcENqrP1rdzXzRBFIkM5/Wbdu4JyQjJ/jiAt87xr6Gzlrb/MLtulAbhFP?=
 =?us-ascii?Q?v1VseKTauHp6VwzDb+zoAaOkKLDxwkPtQ38xu+YftdlU5FBr9s3ihXoQ+oYK?=
 =?us-ascii?Q?PzE9qZzCivNu+FZOZSlPExxFl1zvdD0ReXw+LV11izK0zEMtcJYYBLSAmjPN?=
 =?us-ascii?Q?Spgeh6GAxqya7Aa5BIhYroPOBLJmm0lNOH2VvBs5bEWAUrXz02XOCgnaJ0N5?=
 =?us-ascii?Q?cLwfWzoY0Pv3jCPoGxSKdpa1fCwd/ojeEm3CQLdfUzcE5tN7OleuPy1FyoZ2?=
 =?us-ascii?Q?4NDER4nxLbq+IW5UaR/pdtjlDYQvIdH65VRC2k2c0/ojoYotcIuLuFqx+Mpg?=
 =?us-ascii?Q?qMgSUHduYeQOiGIzgonN+6edmc0DVFwpvjH8151Haz/A/vbrYD54o1iNgP6j?=
 =?us-ascii?Q?TCSalWAsrm7/Hq6giya8UyUEd+k7YH3lw09C3/ToMuIF1SIq7CC1Qg8cioYW?=
 =?us-ascii?Q?iF8doeQ9pNd5JvmH4+4o6DWODthd8tiGWtvTSlRNam2LVp4fPpmoIhCZXMvU?=
 =?us-ascii?Q?G24QFFcCchWJUwy8dHdtz2gxNhPZOGnlpYWcJ2zNMjrW2/Hv7ufGOCwtVd90?=
 =?us-ascii?Q?bnrH/8PPenzMKw58K7Nvz2vqcH02IKytKp+B4SdGQMZBk39ihFwXvTpRnmNK?=
 =?us-ascii?Q?19oCG/xwmUv5/S+TlpEK0pWvluL5H2PzN0U3WD/h1naMGhCy1zbtW3Y6OQh1?=
 =?us-ascii?Q?8iYOCYJR4f0nUygfpuWiQpHwD9f0NYZ+Sxaw?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(41320700013)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ajO8kbeBw9LNkqg9CCQLAQm3Gr8t6jUiaGp3RSW5qiUvC020e/lEU2eP+1aN?=
 =?us-ascii?Q?xzeOyQ/WJ45Ucq2kNSfU12OWk9zGsZ0Ymdfja+u9e9VEGGQYY/kK5lNsVue6?=
 =?us-ascii?Q?KrWIU0qvlfAVfZBzxdRvpTEIf+AnfWC1QRmcNVSQb0xVSnPDCdhF5ee1mNBv?=
 =?us-ascii?Q?uNYGyrdgAYfHqLgglRBWAED9SI69y/6N/JKyVpeOiuW1t4722V2g0xVw760r?=
 =?us-ascii?Q?3NDWy2Qjp1DiMtjdgElSM/Igw3Bxx1YnWSdqFN217VjKk36OP5FFaJ0tJIQ4?=
 =?us-ascii?Q?7D8htdrdrB76YuUdY6yHXrTZhvEvlnmKWpokg8fvn0i6QpDR6Gg8Hdofyd0H?=
 =?us-ascii?Q?iwIOxEiu8E0zD/dQxIZs4AlM958VYB6/VwEep6rVp5cOONtabm8iXtncnvkG?=
 =?us-ascii?Q?LcLsN0Z+bJ37u9W8WlQJ3RaGvyUMl46VGAJ1IY64DSC63vK8oX1QUXsp0bsH?=
 =?us-ascii?Q?DopCzNyf6yihH5tWCjZ/wLjB65laFJj3pAfT7/9M2Z3z3pfwUkVEQRW9wmeJ?=
 =?us-ascii?Q?mTPkVq827zqutWTRr4JWQWka2Y/sM+/HvRcBHyt2eLMlc0tdUQ0yLaCYx/QF?=
 =?us-ascii?Q?Gs+WesBvmOsM31U+AcQg05caWIVlKS7rAbCm4tefKZhRNJtFZWSuJ4ZCQ33u?=
 =?us-ascii?Q?TGFXxEuzfVzob1E51yN9msTqGDA6zBrAjiNGITgNV56vqzR5HStq59RHDDRB?=
 =?us-ascii?Q?RvjMCH1S9N+4+aB8yGgG/rpJ9SefGn1x5uquyHoge/EXQMbQO4pqa/Iu9jdm?=
 =?us-ascii?Q?PM46zqseXPBwJQIeSWstf1+5F6Uc4LrRvLnp0CndXswkevds/j2zThgBRuaI?=
 =?us-ascii?Q?PG6Y6EEdWlOZhRcAhkHNEBXahVD78gjwCoyXkAi0aAVxeH4kM79bwlcZVlsg?=
 =?us-ascii?Q?IkRMOcO/KA1LqYkpPyB9eu6J6xYq6hHH7ggV6Db3wLtkjjaeZbBOQT45MBN4?=
 =?us-ascii?Q?PNqUa80EGyW9HQKqx5rm4UXZtnWoSubG8Kgy7uAzpEz2BrHhd6vXCDEOl3e4?=
 =?us-ascii?Q?/uTiXQMkpsN0vMS56JnIpSbmCU6vVlUrQ7wsL0Cek2bULStNy1L5Xyzgm4Vn?=
 =?us-ascii?Q?0kTDtw5DOzRKAFtZfa9NEn6Z8uy3RvkUccgPZ1wHcNmKY/Fun6v2pWfnenS6?=
 =?us-ascii?Q?D3yPmPLnULVHGbS/5oGK4KSrG6hj/NBaZWKk2QxqhqXVvWgZbsQtshP2ab9m?=
 =?us-ascii?Q?g4/1H2fDcMpP2NLkuF9sj1MLOTiHD+twxEIfZjamyF645whBR3RT52uxAhSR?=
 =?us-ascii?Q?D9zBSYS2ZBarrqYOUh/SGo+jMztoV2eKxdTqJi1b9ycxi8DMstcV3ZdwbYcM?=
 =?us-ascii?Q?BCiS2Krhh5L+aaQPsLLm+427hbzcjb9tixpvbyfoFTXxR0wH2lnVRY9FVZVc?=
 =?us-ascii?Q?+3TEM+EH7ZpjW5aJ7XDQ+6vLXPvOFlptgPJ9tLke07bGb9dZSCyHnoc3BUrt?=
 =?us-ascii?Q?jC+SvrU1pXAu7Rdh/D2YiXEJOG1ai2Be+yKBgKJPW+yJFUNdUOHmblJS0aaJ?=
 =?us-ascii?Q?uNJQ0aCp5tVxrzA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fca36ffd-20b1-4b16-f9f3-08de52b3ea1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 14:56:21.3042
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P110MB2131



> -----Original Message-----
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Sent: Tuesday, January 13, 2026 3:29 AM
> To: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski
> <brgl@kernel.org>; Vincent Fazio <vfazio@xes-inc.com>
> Cc: linux-gpio@vger.kernel.org; Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com>; Pierre Gramme
> <pgramme@gmail.com>
> Subject: [External] - [PATCH libgpiod] bindings: python: add missing Py_N=
one
> reference increment
>=20
> For lines with no name, chip_get_line_name() returns Py_None but does
> not increment its reference count. Do it enough times and the following
> error will occur with cpython before v3.12:
>=20
>   Fatal Python error: none_dealloc: deallocating None: bug likely caused =
by a
> refcount error in a C extension
>=20
> Add the missing Py_INCREF(). It's safe to do even on python >=3D v3.12 as
> Py_INCREF() has no effect on immortal objects in more recent versions.
>=20
> Fixes: 0c0993569c54 ("bindings: python: ext: add ability to query line na=
me")
> Reported-by: Pierre Gramme <pgramme@gmail.com>
> Closes: https://github.com/brgl/libgpiod/issues/166
> Signed-off-by: Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Vincent Fazio <vfazio@xes-inc.com>

