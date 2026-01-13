Return-Path: <linux-gpio+bounces-30505-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9EBD1A813
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 18:04:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80E3D309D9F7
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 17:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ADE12EDD50;
	Tue, 13 Jan 2026 17:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="KbaTvuQp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from USG02-CY1-obe.outbound.protection.office365.us (mail-cy1usg02on0086.outbound.protection.office365.us [23.103.209.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF84B35029F
	for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 17:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=23.103.209.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323627; cv=fail; b=joIGLpFF7ZiBvlYWt3oMrUBafOP2NpCC3N6gs7bH30b8vsi/NUw019I8chQRYLF6DDWSAortpzGLMrNpE5aATGRzIWaGmnG1Avoyd/ZdFQTkJR7wAJuWw3Dy+e24umaVfW/Ofy+iE6TRrTa3s7jVWN66Pd248T+7AYcRDQTVbHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323627; c=relaxed/simple;
	bh=KMGu9nepIjSV8rnf7wCrk1gPELTmagLLJuc9ZD4amAU=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=d+0yiAhPy4Bt8W1tMUhC9wmur42f9QqIYw2c1WSGtktzAv/UtGjm+gGetzQJdK2KkDEcIEn4jifMkbpFVlSnm+DYAb2klSVosf1l9g9GfhbIgCiBcgy9mIiVV45KzkEMeSYyDE6L8h39VKnxMaoDAQ0D1SXiRkTMYuR7umCtrH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=KbaTvuQp; arc=fail smtp.client-ip=23.103.209.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=fiwJkKmY6i+rgS3mOL29ztoevlrT8Rs6YIqRbAw0n5Wml1PD3NP5Dj0cdwASaZqoxod103H/+41Z2btYsnS1lyRqIHC16QStZmnafIY6z0MIm6xKyG5yMU1LGdvW446DuTuuqE4g5sXUE6PqrSjAs8XcOAUkTNQz5KQndxQjxHem9WhPEENpDBA+2KNLqEWRrV14NgL9IkoTUNp8Xlh5lh5jZ16eoShkWNcvqMzIynaTXosOI1OIDd0AuLhXYzUJAmCRU2yrf+Bov//LxShI0MkrNE+gErT+4OxQ3RexEbIgbq/NaEV6ivYIa27UAIYeXgzAv9nt1RNvuv8VvLOOnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z8FBUmuwHbvhMgUr/oy5JRHlQ92Cz81y7bn1IBqSfJQ=;
 b=BGsr4n3cx3vaJjudXBvqrApTTCagz7uGJD7rUC3wiGKwkJNAU7oUwaYij3Qn31FhqiK6KuJKPAz9odfAZPgfCrcUpFr7a1XLJTE0YbZU9FX2V7ps6M6eltOKDBKJEQkcmC+8cebq0vrbCnkv+k952eBQiHL/eCrIO8px/nM5MX7rpXFTULLM86loepfX9VynxJjpuwIKF+aFmqecODlrfdM43c9ioRD8BqoB0W6S7Hx067Cayw01dWTZZcfbktPqH2KOmaKaz9thEG90bJP3coM/qz7blTh2NbKROfiVnpjBLfmWo+L5at3KyipPec6vthyIIsp5Vkz1y4LRHzBliA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8FBUmuwHbvhMgUr/oy5JRHlQ92Cz81y7bn1IBqSfJQ=;
 b=KbaTvuQpDh6LLU4sKRTrEvHwmJsmfvLHPAN4h8NiICccRLmiv2I4GrGyQzULm9Sp7GqGw7xx/fJ2VAawzdFdrKd3hYkcSNBwlAI7dttPoWxgkbYAO44rJJS/IPSi1rLz258lZW6kSZmCjEW4hhFWzaa5KVKSNPsZCDaZiZCfE06zcn44o/ORzvi8rT6GtjqpcbS0uOBQiVbsukT4ErgZWAzuIJHifEGtJLvD7DmCFU89O4t2ysMMnTMP457h+KzHuoqxV31I2y1d8EGNvVyFkH4+ao2TW08YhOT4tr8s03vzeZ2vxe/ScVnSFmw5xqwWyQUYLid5fKl0yl4JeiqFbw==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by BN2P110MB1430.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:17f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 13 Jan
 2026 12:25:38 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%4]) with mapi id 15.20.9456.008; Tue, 13 Jan 2026
 12:25:38 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij
	<linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Pierre Gramme
	<pgramme@gmail.com>
Subject: RE: [PATCH libgpiod] bindings: python: add missing Py_None reference
 increment
Thread-Topic: [PATCH libgpiod] bindings: python: add missing Py_None reference
 increment
Thread-Index: AdyEh0IlM09zSavNRceLsNONhxEFVQ==
Date: Tue, 13 Jan 2026 12:25:38 +0000
Message-ID:
 <PH1P110MB1603BF38D24A598205A0BCA49F8EA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|BN2P110MB1430:EE_
x-ms-office365-filtering-correlation-id: f7ac71e6-c918-47d1-b752-08de529edc05
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|41320700013|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?PQR+uMdx8p6CNB7ppVFrD2iGoVE34VStWQwkIjejRTdtyiQJF0dt5v9/tCkW?=
 =?us-ascii?Q?yZ4qXi0ivlFlLAIfCP30bKzPy1F3AejAZg6MFPr6kFRQ3WCyNmxTYSwAq4wl?=
 =?us-ascii?Q?al4pvVMB+lFnumdGGM4LqFinkFLKfHsR0n3u8wcPxTO4l6kPWC5ihGUwjEjy?=
 =?us-ascii?Q?4G+qudkkIykC+cjktEqvGUNBt46y0mrSYAkh5cUdC5EItTQdS+QCe8hDp4y1?=
 =?us-ascii?Q?giH+6u/NZxkchP72gkPaF1Wezu/6JP7O0EEjVzhGww+OQZNrUiRv+Ut0uL0S?=
 =?us-ascii?Q?E49BnGiakEXDYG4cXuwy8tGFnQQAuuCthMC2udNFmXX9xKgEAPLMbrSCkFqS?=
 =?us-ascii?Q?wbrLPG9okBA2LdRX77UzlSYFItKBxaaoOke3Z3f/GPsRKWNDo4+J5HZoHnWC?=
 =?us-ascii?Q?LPLCHmBuw9jTFzeFm4AcylY9QI37dWmZ8NhAaeKLu8JJQLqlXuh5Q7fpit4F?=
 =?us-ascii?Q?t9s+JR3ECk8fF4CU7L0Cgwtxa6nHMG0wxjmFjPMVwPeniVyGm9dT7OVFORQ0?=
 =?us-ascii?Q?P9AYQr0x1KoAzPRwsCyLQ5dL6whtz+PMbKseia+1ar2J86q1qdzve0aNRMQc?=
 =?us-ascii?Q?8SXu73DitQs9L0S8ACMbHuhQtT9izlHoIDXhMGKYUiaoublE28sE+HPFux3L?=
 =?us-ascii?Q?k/1jgEVKxPyftYu89KvSuYwfG5TRyFe8BrYUHDevPipP5Al2tpwXyOck9Pt9?=
 =?us-ascii?Q?ag6T0T3etyI1pQSmdwic3+hmEJU3slh/D2WRNI8AuZscpBvTV+ng1iIECAqS?=
 =?us-ascii?Q?xS/IF8BiMx53+JHJcaxvQGIu3/6Ggex6opO+aGqHJBstE0Dn/gaALFacceqU?=
 =?us-ascii?Q?E2r0vYUr9cWQxJs4XGn7qJq7EtGSh0IDX5Gj4lvLKOUVjWjaNXZOr34WVrmj?=
 =?us-ascii?Q?ohS/HNpCb9+7IUDZj9DAngqXWxWj/kwHvrVWHtP+WnYflBHegSyQ20Q8T9La?=
 =?us-ascii?Q?60lFJz2M0E0L3JUJMeMzyXQfgarMrkYYVVAJjuAw5aH1H2XeiNWu6E6cNnO5?=
 =?us-ascii?Q?xYrTHcRQENJ/p/Ligua9YqGpanBYEWw6FqARO/IW32XP+TaDEWlP0ZiTajD0?=
 =?us-ascii?Q?tKiYxlJ1sqWLkZS9Qm1iPYqFIbGy0BUJKWcUZKyrWOl5HHnLWFZj+V88a1kT?=
 =?us-ascii?Q?n/uiCOvRg83+WJU+cbHKt1WhkGGFmeX8IbWh0sUcSKCoob6oSu+WJqBxYn08?=
 =?us-ascii?Q?cIgk7icVp3HyqR1Q4mYHkWtoHdJqqyqegbgOfyqQ12LE0XUSIeRpmzhbzVGl?=
 =?us-ascii?Q?giNnN9KVMaPSFfI8su9qWnSfQdhaS+OSLjgqGl4vE/z4H5/BLMn4zryIC3PL?=
 =?us-ascii?Q?iE/GRcoiS+1I2Bsw6i4fU1up3hCfeBIYGEsVrab8U06cgXcBfTw6CJ1FxUi9?=
 =?us-ascii?Q?GbgSS9fE7OP36Mbn0BHuk7lnnCT1fMa2dZg7Eu03y2tIwIc9QHCNTgTaB8uQ?=
 =?us-ascii?Q?MBMmRId7oeTC/xV8FHtw2chsmhPbxqkyT2xEzhe9c62C7rpDOoulEEfAoW+2?=
 =?us-ascii?Q?lCQqtDN++vhikg0WXu8PMBlagLguqR9NMU2o?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?QfZpEKtPAk7IsvSGxjrGfOGqZXaB8mwjuJm3ASgeQS2Q8SNm+f+OceSb3WbT?=
 =?us-ascii?Q?0sdVDk5Fo8Nb7rCPum2MxQlKAbt98CvKCI+AWiwWEpHwaj9/0p4s+MUtLvtm?=
 =?us-ascii?Q?jkLhxf12aYMEGl/4D+hkZhNS3KB9Pb/UrPbjCetXbckghpRYHZBuLD5KH1AG?=
 =?us-ascii?Q?LHrm452QfhE5D8swyFuPwVubaZ+6+0v8H2luOYHCGTuVCIUcIpQmkRE6nm+J?=
 =?us-ascii?Q?t1ttlba49brmHCUSNgv7WBEWLlmrEovgu+4zCgt6QZaF9dFTO/SNN80xMJzQ?=
 =?us-ascii?Q?xX10ItikVKleRQth34CxCfNXrCLKtyLG+tpYSXXi453jY5fWdgN0SM+l85Rw?=
 =?us-ascii?Q?hanMaVmI5nf4c9RomyM2cwhgclN9ryUFLElZQm5/9A8trkWDe1dAkpkCqpZ8?=
 =?us-ascii?Q?JRGTgBYYHLZ/CFYoXFI1qMNK2DVZpK2M696jfKVSMkEC1wSSc/CkNaQa51mb?=
 =?us-ascii?Q?YyrH+4IyHgjpVr+NNTuFkpGuhdC5Nft5Eymj9DJoHjYG1owxbY2TFh3dbcdA?=
 =?us-ascii?Q?gT7bSGARey0Tsu0FU3IdasWyjihPZofByXBMkQo5k1ileT7Uv3DdZaRQyz7E?=
 =?us-ascii?Q?5Q+hy0cIDw3SCtqdOhULjmfi8JGM0f+Nf+J6Zr6V1HvN1UXevUSuWO5YM/T8?=
 =?us-ascii?Q?6cODZ0sCGhQ7MBQ+MO4Af1QQfeIFIniR1NV5ZYj1u95Sjrti4Mbaw+o1/RaU?=
 =?us-ascii?Q?27nhGvij3NjNYTxovymID96zU3p1+CilB+fTc311dT+FhIixP9qnwolWyIUr?=
 =?us-ascii?Q?TDX0fP8uZZZCnG9jBc8sUBCULCTKqOUirJlOSj4Tz4jQV8Gz86hlCoPETO5f?=
 =?us-ascii?Q?1BkdKNegbvet1KT+41UQsUhjmY6g640WxPCK+nuY3TrcVA/IduLUKPxxZ0ek?=
 =?us-ascii?Q?jHC6cLFPaGgOUumDWCMy0FkxwgjznDevHnYZNjh2S6fPHD/DQpLFJz8l13SC?=
 =?us-ascii?Q?dWG4RCrTP+Mpa/SCYA84IVK3m8oABKURQ7rfAe6nQrw826uyYOj07+93eHWy?=
 =?us-ascii?Q?6AFH0MaKXCBEfgmDobuBe7z4DVbpzdNwaWI5hTSjB4SFHkxla7ZIBCYoNEvG?=
 =?us-ascii?Q?5omXgixbVbEpO8H72IjEDDRG5lKv5eFSE6jIhEZL81rEWxF4XNLAXbtEgTdF?=
 =?us-ascii?Q?5Vol3IksjtpkjOzkjUNSHYWkLJs/qqnPBU2Az13w/Nb6Y7ABFRRGaTibUOkK?=
 =?us-ascii?Q?K0YhlDz8XdGzIbN7WPPsihmCkwNoP0+MVDO3Q/QDNBoP6QzVZUU92TAFb00G?=
 =?us-ascii?Q?Hl6mwpjxUFKFlAfGuHaEyuVoSQnUL/Zv4VPo0UDamagB9iBqnhbC5rmaqUF7?=
 =?us-ascii?Q?wgv/n0U1wT7Q01vYdLLiDl+Xv29judBwHHLUc5OWw5phqhsGDJI8eYuheLYB?=
 =?us-ascii?Q?vq39Ye8csTWC6q3LfW0sHehUtjGBHqriLbpr+yTffkspMYxjrxeRoQLPRWO0?=
 =?us-ascii?Q?1E2TqB4BQdumOfbx0DFMUrSmTKcJZpu2lcm6p4w9qlAKJtK2OrcKFz51fa4Q?=
 =?us-ascii?Q?itmlGbwJiRZO2gk=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f7ac71e6-c918-47d1-b752-08de529edc05
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 12:25:38.2485
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN2P110MB1430



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


