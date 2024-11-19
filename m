Return-Path: <linux-gpio+bounces-13115-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A959D29B2
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 16:34:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9703C281F49
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 15:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF281CF2B2;
	Tue, 19 Nov 2024 15:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="pnb9kE7t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from USG02-BN3-obe.outbound.protection.office365.us (mail-bn3usg02on0081.outbound.protection.office365.us [23.103.208.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC87078C76
	for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2024 15:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=23.103.208.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732030472; cv=fail; b=PLrKzJdQVJJx6W9U4X3qjyw6pFs/ogT6KtQnePxgr/n/rxIpkRR6zOP3VxRSkFhXEbcbZQp3jhI/4rAanNu5r1pZvkJZPAOsAYmWXAisii/UCgc/o617pJQ1hl+W4KeQBh6SMUAexY+U8uyhKFjwNv1pi+bLOSNUC8tIHqzVQeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732030472; c=relaxed/simple;
	bh=vmVLaVTZ8XSuFfIk0wSZR+y34qpBv1UiS1UrThILOaw=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Yk3B0GE8xty4gjsVLLhi/m/twy8iDBUKGcpftt2NZuF1s1AS4bif+rstHqLGrsbhmZ8HqFM/dDOgurxZEDXKaUU7bFRhK2rCpmzKe2d0ncNnG3BrIJdbvgkuWgWCsFzSE9F1NYDlcMgK+mzQUMOUbvtCKtxohGrhTODWO9FkrUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=pnb9kE7t; arc=fail smtp.client-ip=23.103.208.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=vWiN+jNm87j8TE/vqE2V/9QLoskecgmZanEofcSUMrCLGYHh4SvC9e+kRSlCqvMb69KfbMviRm1U676RylpRXjiPqL9wY7DdyDFkO9rRnJdkYcezZE5iX6o4wbf3ZBkx7X3dHAVpojbWAAEOv64wZLGVf5OLOkR/cV/udBUTXxFNJHgpFxWXHzvXh35ZQy4i/wGaOSYsMOtfn820N2/MwScHC6UKSCnTrl7jot4zip4ju8A1b884j3LyN4+/9nwbBuuFUOsBYKxIIAeey9Aj6SbMokv0UweLDAWYr8F6KV/ThXy7as4wbaTouPI8OrPk1XRbgyF6jeGnhqY6PTGDFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FziKeTUaUVAYoIi8pucQFGWAo8L+9Uuk2LY6F8wNwTg=;
 b=A0EC4ZHS41RiZ0lbJcs4ldFR2gLp1/MGAg/kmJr9E+Bn6vBFhR5aED4JG7G0qrrsIx8X6tm6Cx6OueRZ8YwoUWOlYUxzHugvAasEF6d/eJ9rFgBpd/NQwI49UaafiJw35Wqc0FCKfiEjqZ8lurVlWQWza230WQtmXRXJ+In+//zYBFX8wFyPtbPVTxAMkSJDy/Weec8Bi6U7v4TAzo3X7W2YmaDsy6/6UaYcdzsT4MOJ4ru/ACmUZvlBBlVxvKm5vwBaLUay3F0mwjPe0DHD8bz4NpGM0yRs6c6zfuuE6QsKl7H+paYV/9tKN6DqTZoWfhCPdUprad0p4ZIxYgE01g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FziKeTUaUVAYoIi8pucQFGWAo8L+9Uuk2LY6F8wNwTg=;
 b=pnb9kE7t1XWja9C9Ff69YLODX77kCuKMXbgxCAXMpV19tOaUo72m7ZdL2piwlemEv2Vaei3EEQ1pRcPdgYN3/13oHCTJq0EJaIvpFsM+RUGByCHNiMX5iTh6v5UTReYv+Ef8TKgrjrISYNXq+bqssM1ewHEjN3GJE3C92dtnhXMZUF+OqG11CDciDuvq98Ntwy+L8G2CEJbmOgK8ArMHl89wSpdd8gQoRoEwLKQ0+uLdk3gsFwNjyW2FXT3wM+9h1GSuFLD5J8x+5g2mSoEwxSlgFo+rfOLKteFCRotfIKuE89Q80RMzr+6mJ9FlJiBaEiZq9xnHFO4BD5JhqHu5Lw==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1114.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:176::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Tue, 19 Nov
 2024 15:19:12 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%4]) with mapi id 15.20.8158.021; Tue, 19 Nov 2024
 15:19:09 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
	<linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>
Subject: RE: [libgpiod][PATCH] bindings: python: tests: replace LooseVersion
 with packaging.version.Version
Thread-Topic: [libgpiod][PATCH] bindings: python: tests: replace LooseVersion
 with packaging.version.Version
Thread-Index: Ads6kwgVV3/1AKhtRmiI3wLohi4nWQ==
Date: Tue, 19 Nov 2024 15:19:09 +0000
Message-ID:
 <PH1P110MB1603464BE30BA2CD637326CD9F20A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1114:EE_
x-ms-office365-filtering-correlation-id: 7c83c656-247d-46a2-21bc-08dd08ad8433
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|41320700013|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?70lmvUQIZcohsPwxnc2VTAOiWoiCE+Dob+EKRsD66gA2JQ96dIAAmL7b0Ffv?=
 =?us-ascii?Q?YbYc2/8BWCT4bBVmF+kFfZVHVqiI+k6LpeeZcJGridiRx7m2QqwrLYhpSJwn?=
 =?us-ascii?Q?P15oQlra/kSgBPS/lLHZtIfQKNIDh0qgbtnhKMNwOB51GuRfOehfPkFBPxHr?=
 =?us-ascii?Q?jLtGJH9edpdYRs4QH5Dvnq8Lee7AM4vhdq6XfyFFhiZeiZ5fZA3xnX9sfrlo?=
 =?us-ascii?Q?fJvjFT9xzK4xZl2LVSalgbMFuqAypBlxUCI3TPXhOW3SZzILoezmLYprmqD2?=
 =?us-ascii?Q?NuHaNjgM+HnblvxUNu9wf6o8baJ/p6dZGFcjgJSrqsaWTiUsXZnVcx3cm4Sb?=
 =?us-ascii?Q?nvYWEor0SjKsz7TWXK/bx3DGuPfNiGFgh+dvg60gG4kP0ekZKbEKTooTjiJB?=
 =?us-ascii?Q?sR1EuO+a8IkkhgMDacdXb/XZJc7FqLRoSRPmdPLU+4tQr3onpwtE9tH3SpV+?=
 =?us-ascii?Q?9GcsVsVVEVvv4xHmt7TigpicPc2S6JLHwDy5sd1lBZniJexM+3ENwKEGX2FT?=
 =?us-ascii?Q?ZRa0aQST3U7u2yOd6NedRTyHuBeJ6kuS0wm5HOg9CM6fpsX+IklYWL66I9KH?=
 =?us-ascii?Q?J2tf/abVe/QD4obSerCa4sTBFQ2mUZrj1VWrxLgfZayoMKbE3KmE+NZ7r6md?=
 =?us-ascii?Q?S62O4RfwxPH+oaoJo0p5SQN3hJZ43a26iedLwKNFPP8g44Jue1Y26nzpyXW0?=
 =?us-ascii?Q?7/ANF2m6ojdnRY91lSRWhtZPSNz2WG9Sy9gng4mkdOCADCVEpX8RY2qJHPt8?=
 =?us-ascii?Q?m1OAt+ZaXI8WLPyU2tZLuEPOBBDim/nrtfGROoWffQ5ZhVSk4f78kPrqo9WW?=
 =?us-ascii?Q?eUPeYe+hwFGmTBbuVHo/jRTP6f0o9thRbkNShTmHhzWpkFuBgEq5gCRlvFdk?=
 =?us-ascii?Q?8cv1lVuPFdd17/Ih0D8aeqsgerET56KPKpVq/O4BBIHLfJeM8phJpzw+FUG2?=
 =?us-ascii?Q?6yi8oGva5haGr+/PCqsFx6cXyddhirmp1xJCmTAP9NmH59xt7VaW9IqbaBso?=
 =?us-ascii?Q?W3JXiL0I3zg46N9iroFyKsgKqsmj24N4wqO5M9UhIrr5CCD1UrfUwLKAsOku?=
 =?us-ascii?Q?qDZDqptjGfnwhL4dmZlreaS6P4D5HmV367JpQrxuHs9LhYbueROR7gd/tXhp?=
 =?us-ascii?Q?zdzROVvpWl7wCbb2gwBtGOnHHHwQvdTZlj4u+itfIRUZ7V5lGOC8+czTTMaS?=
 =?us-ascii?Q?wz7wpwaumsSUeGFiusmrr9Py8TEUSKCRh+z8kbx098iGIBlyUR+k/TG2XGQJ?=
 =?us-ascii?Q?kePHIfk2WH9KGrqGMUXeuRgDPX1jKFAQvBssezDve8YjWiRTcmhoJ/5QrGVC?=
 =?us-ascii?Q?DvFCew8IurDGY7HT/DwxwkcsByHPpUdOXFhYDmohLQT4l0FHl//VRRNETyVL?=
 =?us-ascii?Q?SQLeKJ0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?sn5TLJe5KKw9UoIBGkCUkYLRbauBMSKpG1ZbkWqkW5U073Z3f5mdjbVeyVeR?=
 =?us-ascii?Q?zBq926bw6ZxW/5KY696Ro0Njw6hkHxmXn5ths7Is4vGM8MRG8bwjhWwuEEse?=
 =?us-ascii?Q?x/7I1kL+yNXeRFqs5lxeW0FekOgQivsEqYN9h9vA4Hfc7Lti+HTAXNRVNuaU?=
 =?us-ascii?Q?p5scT55khB0N36tNk/48VeXndXMCkUkKZM43ORr+QiBUiX1KBT7z6Q9FhUm7?=
 =?us-ascii?Q?tEjEs/VsSOqnhgHX7dHXYGTwwqzPKuZUce9U9Yc8R/5/bUIZNSjiNNc6uvWh?=
 =?us-ascii?Q?iJl0VTOwhOw92KTWxpye3JosGTAIwd8qFnuC8HbZnKAIc2Ix9xZXoO434MR0?=
 =?us-ascii?Q?wfIujQQqgaGuTACIuY5eQ7TL9yBZtFOpIgq0YKovcdBwFhBa/4wUnVrgH0tA?=
 =?us-ascii?Q?nkMlneoBKU8IC1ohWJyJdI1N8hJ1zwBVKv/vNdUkLuVgBTbqRPBpmFBze85X?=
 =?us-ascii?Q?y9bsHg9ZseYuumyGHrZIMDc28sVpTmIN2wVKZ+0DQtVyVKHxM8yadSBzD9SG?=
 =?us-ascii?Q?pMQg7ACvR268XnmYnA3sFN+htElBGIRxpwbX4gppsJl07JPqzs/vr6mKZ+pA?=
 =?us-ascii?Q?Gy5EFjEAr+g2zGskB31euGKO2w3UrfN910kgMhM9znf1fwyEDgqNvrBJD26+?=
 =?us-ascii?Q?rovJR6nOfGMFPZCX/7dm1R53TB3Idz7ZppfpGI7pNZzXWE+//7DpiBWIWwSy?=
 =?us-ascii?Q?yk6MJcevexuxC7lH4ED4YZuSuTJUNUo1BihmwrquXKef1MMFOYpEsonJqy/Z?=
 =?us-ascii?Q?huL0kqaviYF760fIxFnKhakAm2DxkYzZAOS9dAFvyiumOtUFOOcPWqVveRDm?=
 =?us-ascii?Q?kdwid+B7kNgBvVoTFLfqbXrUzXgFjYB4QIiQajH06AxYuKlH0Q3Rzdm918xf?=
 =?us-ascii?Q?CBomYxFt3jDysy4CguBrsn+O5fHmt41nWW74wjbWMcOiXPUZgnC8YmTqHeiD?=
 =?us-ascii?Q?oL5ifL9c5UR0LyOwc8mOyxcDjrvVEfhjUdHdOt76EMO9EtsxgwmVP5z6LC6j?=
 =?us-ascii?Q?W7sr+yrZm8JyS/1LPg59m/nfbRvUn5rk9wMHzHnUSNmiuEd1A3fwSYIaT7Wh?=
 =?us-ascii?Q?kziIyW9x0DslTBm7JAjLwFUovlBTFiLl+ycVw8bGtXb+e0rfqgynHloFa4Wu?=
 =?us-ascii?Q?0ptn0aTflSi0hZt8O2A3psvN0Mf6dxPLQAxr+c3Nul7zclO1zvl2dNyIP9Wg?=
 =?us-ascii?Q?LE2oyNVUd/PWmG6QSJyqgL7yPEBaXn8ZBrrV8DX2TisI5HlIT19Z1njCGxdi?=
 =?us-ascii?Q?3aXf+qq7Xmso/L6w7/rYPBcUQSBUcyiSnJRwPyZQGW+knPMzM+kTxxuUJk9s?=
 =?us-ascii?Q?6hW26FZItPKmVcNYqmO8FnInKB64jg30ogTZx9MwQEezXo04kUL4Ez+gQ5Vi?=
 =?us-ascii?Q?FstL3CrYCzG6xzUj9DHLrBnF7tj8ebAm/MvMRBAi5AlQnapsUeMxKKpG66B/?=
 =?us-ascii?Q?0MwDamP85rpv9L8q4KXICpMLAWbvN3boTPpsMT9IN/vIpe8U50HAVLCSIUK9?=
 =?us-ascii?Q?+HeCvQJRjeaQH9s=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c83c656-247d-46a2-21bc-08dd08ad8433
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2024 15:19:09.6234
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1114



> -----Original Message-----
> From: Bartosz Golaszewski <brgl@bgdev.pl>
> Sent: Tuesday, November 19, 2024 8:43 AM
> To: Linus Walleij <linus.walleij@linaro.org>; Kent Gibson
> <warthog618@gmail.com>; Vincent Fazio <vfazio@xes-inc.com>
> Cc: linux-gpio@vger.kernel.org; Bartosz Golaszewski
> <bartosz.golaszewski@linaro.org>
> Subject: [External] - [libgpiod][PATCH] bindings: python: tests: replace
> LooseVersion with packaging.version.Version
>=20
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> Distutils are deprecated. Use the Version class from packaging.version in=
stead
> of LooseVersion from distutils.version.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  bindings/python/tests/__init__.py | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/bindings/python/tests/__init__.py
> b/bindings/python/tests/__init__.py
> index a0f22ae..d6275bb 100644
> --- a/bindings/python/tests/__init__.py
> +++ b/bindings/python/tests/__init__.py
> @@ -2,10 +2,11 @@
>  # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
>=20
>  import os
> -from distutils.version import LooseVersion
>=20
> -required_kernel_version =3D LooseVersion("5.19.0") -current_version =3D
> LooseVersion(os.uname().release.split("-")[0])
> +from packaging.version import Version
> +
> +required_kernel_version =3D Version("5.19.0") current_version =3D
> +Version(os.uname().release.split("-")[0])
>=20

I think these changes are "accurate", however, the challenge is `packaging`
Is not part of the stdlib like distutils was so it's very possible someone =
runs into:

vfazio4 /mnt/development/libgpiod/bindings/python # make python-tests-run
PYTHONPATH=3D/mnt/development/libgpiod/bindings/python \
LD_LIBRARY_PATH=3D/mnt/development/libgpiod/lib/.libs/:\
/mnt/development/libgpiod/tests/gpiosim/.libs/ \
/mnt/development/libgpiod/bindings/python/venv/bin/python3 -B -m tests
Traceback (most recent call last):
  File "/home/vfazio/.pyenv/versions/3.9.8/lib/python3.9/runpy.py", line 18=
8, in _run_module_as_main
    mod_name, mod_spec, code =3D _get_module_details(mod_name, _Error)
  File "/home/vfazio/.pyenv/versions/3.9.8/lib/python3.9/runpy.py", line 14=
7, in _get_module_details
    return _get_module_details(pkg_main_name, error)
  File "/home/vfazio/.pyenv/versions/3.9.8/lib/python3.9/runpy.py", line 11=
1, in _get_module_details
    __import__(pkg_name)
  File "/mnt/development/libgpiod/bindings/python/tests/__init__.py", line =
6, in <module>
    from packaging.version import Version
ModuleNotFoundError: No module named 'packaging'
make: *** [Makefile:691: python-tests-run] Error 1

It may be necessary to document that anyone doing development on the bindin=
gs prepares a virtual environment with a minimal set of required dependenci=
es and that it's activated when the build is configured... or the tests nee=
d to setup an environment with proper dependencies necessary for them to ru=
n.



