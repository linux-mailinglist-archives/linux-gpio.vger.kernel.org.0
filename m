Return-Path: <linux-gpio+bounces-13112-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B86C9D299C
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 16:29:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BE8B2811C4
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 15:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70E11CDA0E;
	Tue, 19 Nov 2024 15:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="M2eI20le"
X-Original-To: linux-gpio@vger.kernel.org
Received: from USG02-CY1-obe.outbound.protection.office365.us (mail-cy1usg02on0078.outbound.protection.office365.us [23.103.209.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855491CF293
	for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2024 15:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=23.103.209.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732030146; cv=fail; b=LnXrQ2dB4Dg4bdbB7s9IhsExl76saggIEoTJjqIqaDnNr9cwh1G1CyCaj7htAhLacSYjbuLdCTIO2sdWaLcKOFtBlYQd24LoW3nMu62PR46rxqw3GcC9vfcBjyMmRaoqmTkFk+OgyUFKdcG5SugKhZ+HL5hHzqp1YaDVHo8rGrU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732030146; c=relaxed/simple;
	bh=iHIVF9zmoKj81Z3MSKm73zYhcke+5QgPo2cEWtOKcyE=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=EOSBZMHDYn/9jnvxMkKBI0ZX/e6M5cNg58zN9oy3TNsyw0wznhe5aDgyvA68SjNviR53NqgstiwIZWR0Y0gjyrIW16rouYhIOv70lJ5lVdUXrwZ8wGWRBAQ4gB3MSNF4+yUgIGUA7J4BIujmd/8MJCj28phGLKPkkttthC5TCc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=M2eI20le; arc=fail smtp.client-ip=23.103.209.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=xAVwdtMLQAKbtJYxa3KvkNc1wwBQJT2YxVyoswW3i1SZoLETqRCs20z0xKdG9k8WRbVgTGyS6+GP3WiHQbgfYH7Axq0KjH5gzh6PosvGu6Srypc3uAUWICcXzyJKkArFoKgC5PPW/e5XHs0C+tutBFxxhNe4qN1/sNbSsBA02b08vXmhtpBDFti4LqXIFGz+8TMQRyAOTTN6k+SicAXLCWlHMmPiANdqjpiQbufBuLrJZ9d0RjXMPRs5/TESff4ImFxu+pwcyLudtlARCIzqhWMuvDKI2zT2sOWfBuBumOgfADU+mAawpavSX6JdDEO2Z+2Rm/6uO9Sby5YQ76g1eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMVqpqCurHdXgy8rV0lHm6d7rQfdwx1+OJErsk/KW7E=;
 b=Dbu8gultt1eVz560uC8ztZ0jsNWNPxe+k8QmgvJozcepe/rPoRe/JbnAk5BGBz/k6rCDAXp2doDvJ5DQWHxQea1EKJWPcbKKWLNZji9Y5FqC+azB69wWbIsKA0ftY5ywyz66HXyRuo+SfBO9kl0m+i+9sXJHW8sCEHiTW/tIwJhTMogxncaPgkOwFkCEjmHayEQY4/opk573sXTgH+sRtuNKPmA4RE2m8/pC24vv9OWhiWp8vxXcRmOANa0ENhjk2Uy/ZDSxMfhJTp0ABXQYXbJh33BT+OzTvyQ2W/Zjz/CwZXupPX/s38XfRRLVvyH9e4pL1rgd2XCnI3VgM4hzVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMVqpqCurHdXgy8rV0lHm6d7rQfdwx1+OJErsk/KW7E=;
 b=M2eI20leOjqTNPzwBJvFS2RUXnkciU3pmSlcNe4h7Ufp1HuZ6HFZoVRKaWozjH94rN+nL8TKRGvlcK7nZtzQorQBi3aUFzHfX/i/mN769HYoSPojqZPPXhoRybvYMtI5Vcx7gY+1mJYWRhGX/doZ0w40ZI2St64GiOIZbje6Pfpag46OF7nKbxieVjzXOKxrV5Om35IfhZxjEUpnXjioUP9oYIELQvpO6x3cLl9rJP6zGTGWPBhbKnoV6jVpxcB1Yu+vK1IS8AKYfUHZUVLkmMpcHoBGsq/2oMikamKChBmda6pddToocC4LMSp8/XrqZQL59WwhV8/pd5tWnkBJwA==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1426.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.35; Tue, 19 Nov
 2024 15:29:51 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%4]) with mapi id 15.20.8158.021; Tue, 19 Nov 2024
 15:29:51 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
	<linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, Phil Howard
	<phil@gadgetoid.com>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>
Subject: RE: [libgpiod][PATCH] bindings: python: drop distutils from
 build_tests.py
Thread-Topic: [libgpiod][PATCH] bindings: python: drop distutils from
 build_tests.py
Thread-Index: Ads6lk2pI/6ineScQ++utx3aRacubA==
Date: Tue, 19 Nov 2024 15:29:51 +0000
Message-ID:
 <PH1P110MB16034EAD37BA0FC4A0EAC0E79F20A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1426:EE_
x-ms-office365-filtering-correlation-id: 108d9efe-301f-45b0-bd4b-08dd08af02d5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|41320700013|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?/BC7R++MKOwHKQR34QzIqzZmWJk5T+E9l8IZIiR/0qMK+RcN0zTfJF8h8x8s?=
 =?us-ascii?Q?0NSx1pJcVS/DAO9QypeBT3nCD5hZ1DMudhILdE3LhZ6wmCAKNdDFl5gGr/Di?=
 =?us-ascii?Q?w0UMWW4kdv81Y/sJO5gmTgPu+5TPB46+vktchBC9oLvlGdubwMvG6hSsNKse?=
 =?us-ascii?Q?QTV2qVDJf/HybWrOh0ybpNsqOSCxF/EdWaZI4DuthvR/4tI+AYC39eMB1zge?=
 =?us-ascii?Q?nrJ4nmHFvFnyJqfUMdrG0vOU3QOS/XnhrwWWLqpfDjhSl5OqmECGJrGBGLdG?=
 =?us-ascii?Q?3rSMEO1YIKADU6SAEiJAEmKvoKafolPJhcgRFBHsGDgXK0Hw/qNqfzOKd1gJ?=
 =?us-ascii?Q?nI/ApX0sB6/N6nzwCYfGcoqTeyFHNdDw4OH4Dkso/vjKOwMtc2S1xDQKsyuk?=
 =?us-ascii?Q?snqZRBA4xrg5qvYJV8U+TN2aww4lLBffM6AfXLybsLTODtrIw5ul6tSVKkd3?=
 =?us-ascii?Q?Fin1kEfyM7erAQSbnoY280wsHvQH69laLiscMXBHh29Owsz5rtlhH6619qm7?=
 =?us-ascii?Q?ZaLtW8grvXK/t0JKRckhrY04I9RiNcMZv/Bdf2q9q7f8P/PfQ/EZXVKbZHDt?=
 =?us-ascii?Q?5YeSpCPzDa6jDZ9JKXZJfnYNXasYpcrZq9jix8tSkm882ikBHOFFBSQY+02g?=
 =?us-ascii?Q?GcxQOMY0dUlbhc+VCK5vvvOip3MRP3EBmLabZz4SfLJJgeJDbXAZDK3Dk4OZ?=
 =?us-ascii?Q?5120F/IUFN5JcpzNlF5hL6SrntX7gV7KcqnVzC4TSHECEsEXlrF0KIY8WsHi?=
 =?us-ascii?Q?MHcyyFXi+H7KHTAY7jtqivp42yvgJNWhTTcbbpb61JnhunQs2IILdSHbAV+P?=
 =?us-ascii?Q?K37d2EtkAj0HPGQsBJPAB1KRu/71Gb9BDZkfHIrCm5Jhysy8LiwmAzN9xLNQ?=
 =?us-ascii?Q?fLqaqa9q7D0ZIqjcXCjYmkm/Q1NQ2Nng8P3Cy4wB7OmpDoW0vUDRXWmaoW+U?=
 =?us-ascii?Q?EYw8Kf77iIz6CrjZFGnlFeSLYqtFH4FuAqnXSBro7+7kDmtwo8AHJBEqTZEa?=
 =?us-ascii?Q?rWFbMDQsSLUtYoOCBd2ffqIx1TLodkJmVyrpEiIa3dGw5M6wkY6ZYcDGV9nD?=
 =?us-ascii?Q?EWdBXcwCta2NjVMv1MDjosMA/RI+QgNcM+YfRLIsf5uU2RzzETxc2Lp8Xvn3?=
 =?us-ascii?Q?P1ZLTc1+qV2O/L2G8xgkIC8nGX+L+z+BEuwF/OusuF6+Qp4IcAfbwfYnJajv?=
 =?us-ascii?Q?x6IvJrIth3XxshKXMR/OGE5qY+FWo3rfcwQR5Jdb21/w91/MmWQSx/LrWwzm?=
 =?us-ascii?Q?rNGCEyWg5GjxswSYJViDDkmV3nUobUgMRKAzRAv2Yw0V4QRozeTfhsEeS8r/?=
 =?us-ascii?Q?IEnOnYo0/bUiGsDVdZnDRSwPdMO6EvO8mgHD4TfyXkMB/uKFhp5M94QDcZYz?=
 =?us-ascii?Q?v4DVSY0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(41320700013)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?TCcgUNHb1cgWjsuM7QvElVsOXK3m1tXJsM1xNgYo/bhhJusn3N7FhZfl82bA?=
 =?us-ascii?Q?FRxsyMaCNpazVlHDT3AiBOLPNrIbubNTsEA3eKZ4i5q9sMFubAVrUpG+qgPV?=
 =?us-ascii?Q?A06NtV9JVoXf0RdnyNegb6IRXvt+cweH4aGmR8ARhTRQY4TWWo1iURDSBHm9?=
 =?us-ascii?Q?vKPLeUfDUnk0awxUPL4e985G46f0iznyq3GgtNgNjl6i/uXpHrXL5MXbgTT0?=
 =?us-ascii?Q?1DVoxoRx26div0m28Mlf6zELzsZ7t0/BG9pxZBsQW6h9ouCL8N91upLXvAUQ?=
 =?us-ascii?Q?VKL3MSwdced9b6dEl0TSpK7QhNBrC9E5Z+5Hc+AmdXgK3Ldv4Pq7TyAYsCGx?=
 =?us-ascii?Q?NWpP1KN++96vPa5EPdpgEic/OvyLbqSqWf/MSznAcnrWTZq8uIUTps8A0vIP?=
 =?us-ascii?Q?iwKTrPiUNne0/rUQTBhClqYOKJgpqyi6+hdwYve9um+4xcOG7GvFFvACg5Q7?=
 =?us-ascii?Q?m8EOT4wvF9vSkIbnbb1VgFcrKFeZcDb57RAPyWVfvVOhWIp4Cuxyy/H7oSay?=
 =?us-ascii?Q?wYL4ZDAK/2IYDgZvg3oHRbJgrHhmWxCd0c2d54iw16TKcFm7k/gRHyufAux2?=
 =?us-ascii?Q?33dRAmmqwf8+oMMtP+7NMCfhQMkV1w8Pm0HMQaiJazw6T8C4Rl597p5m8Bn0?=
 =?us-ascii?Q?xXhzXK81yd+TESLxmCigiuyBKvFvcpI7slIyMHljVBts8A3JvO1bFfwUkyD0?=
 =?us-ascii?Q?wZPUF2WSvGw1/8EXCGszOhkC103xIMRcrxL0r0zdtTI+F88WMNyW2ldchKAK?=
 =?us-ascii?Q?3L+IH5d6Ai5tKeTxQ9hN+DKjLk590su1VXXgD1Y6uGz6f9NHGcGTjsnntw40?=
 =?us-ascii?Q?LIpaf0qw9ls+5xjI4Kt7CTmeM3Njp9qTHxEzvdvJ8nGI7vl9V6RyQ361mNpW?=
 =?us-ascii?Q?4CNsm+53D34rbUgLsJYkGrwVBRPW+sd8arKyBCg/wBc0tolyWlOsxuI4qRIx?=
 =?us-ascii?Q?xOOVY/NMX/wPbVsTfaKfsiTwGKUltz1dECLAkVxkE/5xjB1jaovUdc9a4kFj?=
 =?us-ascii?Q?MRasu9QkaNmLSIG6/aQRYY9kI94UPV44hMzptfUxyp/wAMzak9kn2tZhTV9p?=
 =?us-ascii?Q?BtT0LyGpIaQ8NG+yMyJMLPsWxg1nJYHE2uJ7+ZTgZoI1g9z0AYAhJD91NIQB?=
 =?us-ascii?Q?8yZrnfXLlryi0A5ZNbhZYEYK0cD2fkLxnbTanYs7yvwoBOJyFjjgwasI746V?=
 =?us-ascii?Q?T5bBIelceqcExVc11DkDTbcxnzTvbUvri3PVuMbDOTAe3kKr1ROpnBpIq3o2?=
 =?us-ascii?Q?k+yh21WvaOyPUOYiMNyty7W1eG1ZEqQbw+nze5+a9uL52Gnvz1gxC7sc/1xw?=
 =?us-ascii?Q?5ATeFGD0cl7LOHIiQDJ9nz9ODR8ffKPL4Nkw8Q+Kyhun/QL19awp460hN+Av?=
 =?us-ascii?Q?bFl/F0HlMLGXYYUTb7NIcZqYjqAJicbwcR+8wSV+Kgmn5fImmLPDHjfu6CI6?=
 =?us-ascii?Q?w2MWB9+XMCYX5JyF4KvxZUttUolv+VHMQ2TY6QlvLlE7/ojWnJ4DsA7TJrR/?=
 =?us-ascii?Q?+DqrEZ7Earyw2xk=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 108d9efe-301f-45b0-bd4b-08dd08af02d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2024 15:29:51.6304
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1426



> -----Original Message-----
> From: Bartosz Golaszewski <brgl@bgdev.pl>
> Sent: Tuesday, November 19, 2024 9:00 AM
> To: Linus Walleij <linus.walleij@linaro.org>; Kent Gibson
> <warthog618@gmail.com>; Vincent Fazio <vfazio@xes-inc.com>; Phil Howard
> <phil@gadgetoid.com>
> Cc: linux-gpio@vger.kernel.org; Bartosz Golaszewski
> <bartosz.golaszewski@linaro.org>
> Subject: [External] - [libgpiod][PATCH] bindings: python: drop distutils =
from
> build_tests.py
>=20
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> The configure() function in setuptools.logging has been available since
> v61.0.0 release so for over 2,5 years. We can generally expect users of
> python bindings to be using relatively recent versions of required
> dependencies. At the same time distutils has long been deprecated.
>=20
> Let's keep the try: guard for setuptools.logging.configure but instead of
> importing distutils if the former is unavailable, just do nothing and dro=
p the
> deprecated import altogether.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  bindings/python/build_tests.py | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>=20
> diff --git a/bindings/python/build_tests.py b/bindings/python/build_tests=
.py
> index 1760257..bfdc4c0 100644
> --- a/bindings/python/build_tests.py
> +++ b/bindings/python/build_tests.py
> @@ -2,8 +2,8 @@
>  # SPDX-FileCopyrightText: 2023 Phil Howard <phil@gadgetoid.com>
>=20
>  """
> -Bring up just enough of setuptools/distutils in order to build the gpiod=
 -test
> module C extensions.
> +Bring up just enough of setuptools in order to build the gpiod test
> +module C extensions.
>=20
>  Set "build_temp" and "build_lib" so that our source directory is not  po=
lluted
> with artefacts in build/ @@ -81,10 +81,8 @@ try:
>      from setuptools.logging import configure
>=20
>      configure()
> -except ImportError:
> -    from distutils.log import DEBUG, set_verbosity
> -
> -    set_verbosity(DEBUG)
> +except:
> +    pass

Similar to the other patch, this requires setuptools >=3D60.2.0 which may n=
ot be the default on some distributions. For example, Ubuntu 22.04 which is=
 still under active support ships with setuptools 59.x. and the version of =
setuptools included in a version of python built by, say, pyenv to do regre=
ssion testing on earlier python versions may also not meet this requirement=
, so developers will need to prep a virtualenv with an updated setuptools m=
ost likely.



