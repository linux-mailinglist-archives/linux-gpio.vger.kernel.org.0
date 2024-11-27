Return-Path: <linux-gpio+bounces-13322-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3309DA98D
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 15:04:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDC5F164AA4
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 14:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A07751FCF41;
	Wed, 27 Nov 2024 14:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="qCqt5vyW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from USG02-BN3-obe.outbound.protection.office365.us (mail-bn3usg02on0046.outbound.protection.office365.us [23.103.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B1C3232
	for <linux-gpio@vger.kernel.org>; Wed, 27 Nov 2024 14:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=23.103.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732716280; cv=fail; b=t+vudhaj2xlLWoIVSmX2mmXCS9tPRAO16RDfnSoOPs7JVRW+snzYoxM71o/vYSGbnaWREUEEnahz8/xeRb8nMnq6ow8Zf0Ur25gxpLsa+XgznxEwbctwklUmPL19Mfa4rBveYIfCgH0fOAZPzcyHVL4JO0V+8q9WP4W84HXGTrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732716280; c=relaxed/simple;
	bh=8iqdkCmUbzN/hcHXCDLwNtHzmrzRcrR5hl5y13eajxU=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=RT5/dlqkT0zPCg15IICOk8bFHyFtBQHjU6oN06Vkcj0TdCe5SNJBPBsaJ4FbHpSpRsKFaSDwQrj1fhNwaAEye0nZXydCcq1WJ4OwqhY5yfxbwqa73YlRTU6O8sBDcYVC5yXv/wHbqE0masZ/rePKHHNJC2k9t+hFMm3Vo+Bb4ao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=qCqt5vyW; arc=fail smtp.client-ip=23.103.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=xZUKotEcLuf1DrtTzD6m2iiOjHNCcDPC22Q9jjtzPEv/G3NTJxIzj32ubAQvq9EzNXfMk5GGGC0QbqE2zYwVaRlcB78fvW4/tHcEOEk5Fw36mcaZpx6xKMF0yBeAgre3xefPjDLufeXSE0i6g2jQBqwRksurbMISKI6Ac6/m/zOXgo4VfzUGKaNiWWjkKfqnn98Um2Sq95xGTrTdF1P+maJ/t557aZfMVKLDgBuFggF7Td9lh9wk10749XDp+a1iPwKhwZkZOMKh/092up3YSNE0fMHybVGKgGJ7+gtugOZmLUpmWryTaW0KVbrHlydwa3aMf1ZoJym9kB6ngANLGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8iqdkCmUbzN/hcHXCDLwNtHzmrzRcrR5hl5y13eajxU=;
 b=x9w7hCmmmW2oWKIvk3KWkQJprwkN1HTFs4EvM9W3iFTMCliOsupQPnp4L9V9HaxJNkO9PPPP7/WYWJQYBdjMA1lC7+jMMOCrmarO5f6wNKp8Besbf5tS2K76oB27KDkkCM5ibDl19X26OFs5ZPSKTiBedG1BJYJIWEG6pezSos2DgPgqQkwTBudVfimfH6pt/4az/kFV3nXvVfD4zboNKpPcrhnlzDXzjjX/Mg4Cq2eKaMJzIc0hrYiyy4HRkor6Pw6kJnMTKlLb1DK1MauNSdTiqkSUGcGhdRxyJpgBMXon+KbisFehIb5oDUFv2bN7H4i39bqES5ycZQrKuzhZsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8iqdkCmUbzN/hcHXCDLwNtHzmrzRcrR5hl5y13eajxU=;
 b=qCqt5vyWrxTc1NpTLPBwt4VJpJ7Uh51mgCUSq1lVSqejoD2AsS6H1LAygQCB9uJoSaG7UB+Rpm9gyHp/hGjm884Sq4aKLqe/gmzSTTDrV2GVPKvQJxSnwL8RO1iFeCW5mNZ9ZABU54094egcLTulDg7F+bSdBgBQd66IIWwlNVqo8lrYvqLfCTR4TQV9sPbjvgfZrXspK8VLZ0bkH+Kl/vD/kdRuc9oz5Z0QaFZmb1voesK2RTamaf9spnjRMCSOAJxgYn9WG39H96qwZy3yXi/nTAhSBOefrlIKkozvDuVmJUAnOXpvpY2c7Cm2zTnjppMtmTYXi5iL7rop9ekwFw==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1668.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Wed, 27 Nov
 2024 13:48:34 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%4]) with mapi id 15.20.8158.024; Wed, 27 Nov 2024
 13:48:33 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Phil Howard <phil@gadgetoid.com>,
	Kent Gibson <warthog618@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>
Subject: RE: [libgpiod][PATCH] bindings: python: relax the verbosity
 adjustment in build_tests.sh
Thread-Topic: [libgpiod][PATCH] bindings: python: relax the verbosity
 adjustment in build_tests.sh
Thread-Index: AdtA0xy70HQ7IXkNS02q1JyHWe3wbQ==
Date: Wed, 27 Nov 2024 13:48:33 +0000
Message-ID:
 <PH1P110MB1603F19B14E9BE9781EC61939F28A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1668:EE_
x-ms-office365-filtering-correlation-id: 20b4d539-e151-47d7-5156-08dd0eea2f84
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|41320700013|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?iwCknioMnMnb4nXvug9B4zdmWo1Yb79k4SQ0H7lAbfIUv/TfAmTLhOf1bHAk?=
 =?us-ascii?Q?iZPfYeLwNKUurR2QyyjXMwt0oLmZVHnAOit2Oo99vb6JYbLjqAAAgpVysUph?=
 =?us-ascii?Q?jcIoAHLJAhzX5LDeEdcIcprbugpZjyGbV8Xdt2+whHXuFyjjCTG9qRCbveLK?=
 =?us-ascii?Q?vwNOVpGH8p4aA//RWh3idU5Ao4uBqAxUN5UPsVG4+bEAiGyPKe7RlEDvvhv1?=
 =?us-ascii?Q?XAtVK8eTi9cRiqnlBuRK1IB/8NM3NeGl1aJiDdutgqrnxRk6Vm3eSdr3a2Wa?=
 =?us-ascii?Q?szzbHBkfxxnKEBD/A5O55kbwMiQFEGbk1PDm08LkX5jaZwrhZ5ZxqWKuQ9Kk?=
 =?us-ascii?Q?lMPnvRR782Ow1tAaX0jVt6/xHoicndFumOlWfzl3uaN5JT+GSf3ioeoYyA86?=
 =?us-ascii?Q?W4MwLBbXcVX9fuA04vSShmsI4octAnmdscd3Uw+7hsM0cfS7nTTMSDqsz8ZZ?=
 =?us-ascii?Q?PO1Q9SAqAy3HplzrPxZGmOZIxhLfFUu3y9K3eQcMhM5LUEjTGAvFzpRNRvSW?=
 =?us-ascii?Q?8R3X/7cyjrgwvrQV6u0eOHp4WNrJjM1hajVLexKmE09r89LhrFeLpjc9qBYl?=
 =?us-ascii?Q?J5shJnd/sVlJ4Bj8+TtqqY3TQeRKDBCl9P9ULG2XvUdcrUEfholfxCvfPL/r?=
 =?us-ascii?Q?3u7F3KKJD/N2f66xm/9yqclMadO5cbH5WFffKjQcv1AZ8Q/4cXYzF8w3cL+H?=
 =?us-ascii?Q?ymNDWwe46ekeGC0t4Ij6N5+t7TWEk834VbO1PzMttCVmALuWnSvtESqdu0XN?=
 =?us-ascii?Q?GWNjoNJKpp4YNb5TGk1weYUYZgKzFudMDi2Ix7+iZh/AimIhMRchFjD/Nbuv?=
 =?us-ascii?Q?IzY2+xzcgF0CbHZUkLAyHpRGnlyxMScwmneU3HgMrUsWLZSnSFMXnE4XrL00?=
 =?us-ascii?Q?tLw43Z8jIojZs4tZmNBbqtcC5LT8CHm/b5vYsNDkeH6O9lMIXIK209YXQ0Wk?=
 =?us-ascii?Q?BsytXOpP1ebmbELqeZmgNBjtVDkPvbjsUpEuBwF+wPMCdo76dm6UDMcYn4bN?=
 =?us-ascii?Q?Gs4GV5UtVfZeUzzhAMzwKBSAvTBvvsAcu013Sd1mUSyw6H/DkWO5/woqmexY?=
 =?us-ascii?Q?hRqskoDSmckf2eWZNbdEQVcIHKUaK718zhaCOLbHQgIZ02pkVf4tmOb0V/b/?=
 =?us-ascii?Q?yNpeFdOvJmons+4DWaLI66hscAZrtQnOvv9x0AV/LKfPB7BrwKb6szhZyypA?=
 =?us-ascii?Q?1DeeBdbQ/XqV18lQWSGd3R/7D69A4Jd493LQHiQ79GldWsNFkj5N+py4+5Bz?=
 =?us-ascii?Q?wppwR/a62JqSr+qR8JtaZJa6RP/Ppzy4tRha29mUF/PMyHq2JA18NjDCE9/w?=
 =?us-ascii?Q?lCEE6b8PhzcJsuLd17qYdzD0wBHN3k3pnmwevXIwRqUj5SCnkIi6k0uZ3E0C?=
 =?us-ascii?Q?Oi2qtuFNLHR0xtGEG+VRaq1BsdxMuvK6EwEdbQaNFJfamf2u/g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(41320700013)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?X74b/vmEXks1IB3Dz2JctGQ4is+zfRSQygeVkMDg4DyXvEVQL+bzZN1WfwtS?=
 =?us-ascii?Q?2UFvIeaXxlZfDnu0+HHhM3Pa+KgYyJZCv+amQdwYaRY7jkyMbjF/LIwszYJD?=
 =?us-ascii?Q?Vmwd1zKg6iOnSHNbf8gnOHYShfBWCq/sMPEpXs4kM5kmcyMMFwtQBRoaAnvY?=
 =?us-ascii?Q?lxhdZCwOM+KCk0IuCrx1HuJW6lwmFidUUGMExSnXjuWKWjMr/gExzSfaXla6?=
 =?us-ascii?Q?uusy5VetG8nFCav1EvSPqRZ/ceEbUobiBkJ/dC1EoB8IDfTPlgxEbPj0pZ0h?=
 =?us-ascii?Q?IRrvqyNSgytv+TQKkzta+NLWEez7TsCUEMOWRIALNvM3D8twCeq2r2y/DmBv?=
 =?us-ascii?Q?nOdMVo3EoyKFNFd9/PclOKYzUqNPNdhSwb/P4of/OW28Jqs/4JfJ0IljkK5+?=
 =?us-ascii?Q?DjKZTRABZhD2bXSrgAhJ7WWNH9x+j4DlMkYuOdM9dchBFM/JuhaS7pziDL/O?=
 =?us-ascii?Q?+/g4hPXPAOF6i0wdi0el4SZLZpGD9I60T9g4bwZqNbZSIj9vDW9/ygLV/yvF?=
 =?us-ascii?Q?pknupZ7GmjZNZauZ+5//WpR37Uzdwpjh4O38BR8eN9ehIuB5h/3o7DNqD1SF?=
 =?us-ascii?Q?rPlX3gz0NaHpLFXHnUKJjCP668V6eoAS3sLOq7xR+7cfoioBlmgw+r91hChP?=
 =?us-ascii?Q?caedvEyIl7hsEfKGoElZqtN7RWFnaxlXq2XW9am/wZZDy9vxkdzi4NL4xtjy?=
 =?us-ascii?Q?36HbQa4V5ISH1IYh6ubeAqLpeJNSnAYsiv5yF/Ikeg/5jNlZIfzho+O010DJ?=
 =?us-ascii?Q?sXjf4lVzn3XjodlVXCOZ4G9VRVvcnzlrENk9ipi5XUIbQRkPogVZw47ig4Ak?=
 =?us-ascii?Q?MCFx9/FV1Zlx2r0bAd6m5Tn0w7E62Af0Yr4nXFJMVJSSOAG67t0+JsezHYet?=
 =?us-ascii?Q?Tu4GwlSyc6Cf9c6reL5IcTKk2mHNcMwxIHRNu2lhFKPM7U86mVxxxq0mWpqV?=
 =?us-ascii?Q?N7F2qh9MYAgIRB+O8CeoKiwLeWFNMj41+7JyY+thQobJAPu8vNs6xskGpDPT?=
 =?us-ascii?Q?JFySJ2QD4DMPBm2Twa+VMiKXKotqTTGdlIry3L+3hsgiMVBqtQVzs6jubzrT?=
 =?us-ascii?Q?vgrSLjg10l3m9gEABG5mNDPPtQeL5yxyGD1QiSUEXg8Ekj6wtQAsngACvItc?=
 =?us-ascii?Q?wEEGDEeZtP6EV4CTscaWpzeuq2TpxIPkwKIqsU1TyMAo22T4TkpAX3xlYsVX?=
 =?us-ascii?Q?caoWb+tEhwLl7ctsRpYzrkTM+VkMA7C2gzgCaIHBRqoxQ7r5D4cNINrejFzB?=
 =?us-ascii?Q?IncojYeyDnZW4OJbCC7/mNYexi8HnWmKCRtT43plp4n2t7P2s4OnB+NqLePz?=
 =?us-ascii?Q?tn+GeRY8/J7T4KcW/LWvEusAHMAqleAKUM/kXggqvm4zrW9tmER7a3d/TYqn?=
 =?us-ascii?Q?QKgF1vmc1reF2YTUD18oy3sDcx6RGgRz8ke+H45YjxvesQ7mnbyIMVaVV0mb?=
 =?us-ascii?Q?vbRieDUIFeD07Ph6Lxu8Z+CtPbDqiWLKPR1D1w4HGMJr+bnqXMkWPZD0eLXY?=
 =?us-ascii?Q?ArPygnKFYn2agPI=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b4d539-e151-47d7-5156-08dd0eea2f84
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2024 13:48:33.8512
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1668



> -----Original Message-----
> From: Bartosz Golaszewski <brgl@bgdev.pl>
> Sent: Wednesday, November 27, 2024 7:32 AM
> To: Vincent Fazio <vfazio@xes-inc.com>; Phil Howard <phil@gadgetoid.com>;
> Kent Gibson <warthog618@gmail.com>; Linus Walleij
> <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org; Bartosz Golaszewski
> <bartosz.golaszewski@linaro.org>
> Subject: [libgpiod][PATCH] bindings: python: relax the verbosity
> adjustment in build_tests.sh
>=20
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> When building tests using the build_tests.py script, we try to increase t=
he
> verbosity using setuptools.logging.configure() preferably but falling bac=
k to
> distutils.log.set_verbosity() if the former is missing.
>=20
> This however creates a hard dependency on distutils on older environments
> missing the recently added setuptools method. The build however, can work
> fine even with default (low) verbosity so instead of bailing out if the s=
econd
> import fails, just keep going.
>=20
> Closes: https://github.com/brgl/libgpiod/issues/109
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Vincent Fazio <vfazio@xes-inc.com>

