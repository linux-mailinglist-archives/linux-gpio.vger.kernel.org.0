Return-Path: <linux-gpio+bounces-13329-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 119799DACA5
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 18:42:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C537B21862
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 17:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2A5201017;
	Wed, 27 Nov 2024 17:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="Hh5V3fMX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from USG02-BN3-obe.outbound.protection.office365.us (mail-bn3usg02on0046.outbound.protection.office365.us [23.103.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CD982D66
	for <linux-gpio@vger.kernel.org>; Wed, 27 Nov 2024 17:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=23.103.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732729340; cv=fail; b=puRX5Dbze8EL8WV9R/HImt0yMCRay3a0ibpwTJCKxrFz+9uPc2NIecE0JyftKXmpXUt/gW/HqlXS9u9fGDgGrX8hx/CeKIjYw3EJZ9SL/nVz6JmOQrUWRLKYZ2pBfa/IYUhBnHzO4Cr60+7Btvn1mLf6BzY43igTrAISVMbYOgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732729340; c=relaxed/simple;
	bh=AhiYUEGJTP6ShcD5W0o+2pd4z8nsrxwfw0gw4Atb0K4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lBaoTsXOWeg3SYoGrkUheThtVn1h6rvyY54SLxciWWVe+vkNCxFsiDfYkj4tf78tH3y3tJhOqrsM/wKmdiww82H8Hx0/wqmiU0VJvJyUW3RCQsoIjJqAzK4kePxHg3Mu2w3N8ZjSlol4s6UAVe/caArsmHKuG7CS8QLFVhUynl0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=Hh5V3fMX; arc=fail smtp.client-ip=23.103.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=HgYvub9VYsUSyG0+m90y8TXXy4X5sK7w9WNoWhsUOxNQ08Y3LXDQfdvBrffUbqy2uHTft01B5JZfHzID+v5AKDmNHjzMTOzDh3yS+j2MtyudbuU7gErWdnmjqdtthl2D0OqqmjUtveSQH7UPZCsDQfFgJvCzFMdEvTfnIVTHSSGJrfLwGem3MtqzeByJPPodO6g9py82VH+OnvUgfKEQ7RDdX/RenbPQ0RP/uafkkZPrsWV5W1zAXmLWRJ1hQe5AUINJlaUweJcRlmxi74PQD6lDYp/FefOOr7t9nt9fyhzutYg2GD5z5bba06SryTt1d651nL4xk4BO6VWt4SQApQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3icwYTSuSDBusSGCyN9ipxPDseHke1e1Bv/1rakjk8=;
 b=s2weJDKIZd8r4t09NsNG8Qru4khmJ7Pksfo0Bul7bZifMMUq7QpGmB5AwnqIk6pBAG54kSqiZVkBEBXApdY6cYGXCUX3IUx3YBrbT7Dc8CeG5FBvSwV7oEQQuPajJggUi3LEK/NCXwNR7Rnzp5/K2zMWpOQ8W+l0LtOOpJF4WB5pUW5tBDU6LqSG/cc+hEKkRXe/3LGd4uc6sasffsVFYwDzGwkNbkMDgyuxlDlEFOKijNbpQTqmn8gdApdA3opgFAh9b9UirMdYb1LEWaTpcMEnZJCTzZ1e8a2wc4QthBYuQlqDVdDKQaRfdOfZ2B22PrB5HCgEAmFDivJaYWKDoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m3icwYTSuSDBusSGCyN9ipxPDseHke1e1Bv/1rakjk8=;
 b=Hh5V3fMXuCBuRrOpsnUnDF9lQxWw+pPmjcSZt4HQ6cfDCEBArU8V3KE/3gjp2Fj9bdiq+wEAqxON7zXWa75RvNMqFj8ekatTqgXCWdhNAQ0bNJ4AbQUXsuGuD4f+yTyOh4BhzwNrqAY/2UUtEMLGvU8bpp/PSQptixGh8FWRP5ADsmmwv+ugcGLM6qhYoNHRCQ3G12cQvlpFoBFU0oc2oUyVqCtIJSTsiP3HkiM0XRDITFZ4cAkRxxBBLs8Z3cZorcp36qhBDi8yoNRmYMVUcBZnytbCgZ5Yjo5EX167ZnBMfy4U63TP8g5McEGSIrGgbOLnGTBXj9l9CcoKVJuv8Q==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1235.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Wed, 27 Nov
 2024 15:10:07 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%4]) with mapi id 15.20.8158.024; Wed, 27 Nov 2024
 15:10:07 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Phil Howard <phil@gadgetoid.com>,
	Kent Gibson <warthog618@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>
Subject: RE: [External] - [libgpiod][PATCH] bindings: python: fix license tags
Thread-Topic: [External] - [libgpiod][PATCH] bindings: python: fix license
 tags
Thread-Index: AQHbQN2sN9gqqCVJ70qJxkt1lJOg4rLLOxMQ
Date: Wed, 27 Nov 2024 15:10:07 +0000
Message-ID:
 <PH1P110MB16034D59F26D1C4A54BE81039F28A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20241127150529.126896-1-brgl@bgdev.pl>
In-Reply-To: <20241127150529.126896-1-brgl@bgdev.pl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1235:EE_
x-ms-office365-filtering-correlation-id: 08f6f360-b914-4519-7b0f-08dd0ef59460
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|41320700013|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?uZ0eM8BXyZxulZbsbz8lyMtHsP3bKHEqdqo+us/8iTyUTUbmXWyJurFCK0U4?=
 =?us-ascii?Q?s4bKH4Ko4p1fL1OXCj4zVUjnF/GOzzuNL6zuE9sclj0qn7WA9fqDFuCnKLIH?=
 =?us-ascii?Q?wAIHF+6G2vGaMCyw0XgBRxtb58Dw/7wSwHHEIW1WsV2XqNEPvbr75wa/fZON?=
 =?us-ascii?Q?m4pMoLdY3d2XA7jZmZWo/ncjoz2iV4qOaXrvE63sGkfyUB7XNv70BtKeaA9R?=
 =?us-ascii?Q?JcGgd3btYq0E19H0rtu+iJAYoKDjgrcVxwAcD+LprBwpyBCBkRJrQegOm5VH?=
 =?us-ascii?Q?F7HthhbAfif/7dXDVxgSwxqU17ps/T1exqz6m4bT554xElMRojixmkl284jn?=
 =?us-ascii?Q?/cnHE8TGrUOBERxBB/JH0UkoAqYEOX77mlRSU9uvEoQnsZp4U7ZoqQt6iM0C?=
 =?us-ascii?Q?e+HuCojiDrXkFiB/ipLfxKScU4YA9jThPTXu8OSDwKfPDSBE3ecj9MeMN84/?=
 =?us-ascii?Q?BborxQoOZFOS45d/wdnii6fVxidzfW49ePpm5ZPrLBtET7KXByVGP5y9yJ+d?=
 =?us-ascii?Q?f+NLl26bZIePQ51F7seXtO4sxm0R0tgX3wvLvXYGUYUG17Co6WpC3o/gkZ5O?=
 =?us-ascii?Q?spolSbhTAnJkoAOEnswwtgdl301DwE1O4UGVARAxmbWUSMCmW54h2tutlJH9?=
 =?us-ascii?Q?yIisikCRKRjkl6y7y3vTn9zFZ0Qbycux/tec7qyBU7qN+2lgFgsT/yRxoME0?=
 =?us-ascii?Q?5JwtJ5WGMioETjrckNqTii4bRC7QDUAvCfXAbAFuuakzgntLq5YtDMrM8+uE?=
 =?us-ascii?Q?VyznmpAYFtclefR1JLp/AJ+Je/MM1mWuB6O8SR3fWaUnYL5/QRyYxcnQNurJ?=
 =?us-ascii?Q?W7G+z8uZpVr3DHdkb6M3fbzh1ECk3nthfodLokezO4j3VMY5YJXBbwAlZBcJ?=
 =?us-ascii?Q?l2K8xC042r+LDBo4qgSX2+SpaLdF76XShZhcGqcgwVsd/YivTlIjHslD/4j1?=
 =?us-ascii?Q?BTPLTljz4IC3YmXBS88hDEtkldtEZxh2LBItCljHzO59BQawAUQivgkJYzbC?=
 =?us-ascii?Q?48aEt4mxOaxUmo42r6WuvKR6lzqXDVTmbgRpYqN52HgBfLfv+emPA8+aoqx8?=
 =?us-ascii?Q?ThV1C8KCDDQJ5L1N/ZfWWzm0mjshj20PUffasmmSdwDpOFCsH9LEaSctubLf?=
 =?us-ascii?Q?Val/pMTQ4Sum0F4ejQix0vqfhm7Fi0+SjwveBYuoDq2FlEDTw/ZnDn3vLXKx?=
 =?us-ascii?Q?epVvOqN+r+vtb6osPnnMXb29OCvJVYvEQrWWgtpYVKnRNdlZGD9t83UeLd7Z?=
 =?us-ascii?Q?zKsFCp3ipP+N5Re1GzeZeuBIiSWcQPUMwIwvrL9SCjBGs7EpTGR+YT3W/iBH?=
 =?us-ascii?Q?Nm2+b4YkYEp6TZ0ngyAWujdqKTO5CbHAqyC8vajc9kPmbxU6EP8H8pJfYMRs?=
 =?us-ascii?Q?P7n3scwEc8zR9NeS43RIb8Nz9qxmaU4xS0NDsIjeUGTn/OMkDQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(41320700013)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?5adrdSlJu/mtDxYSfvWy8MqJj67G2UHEX/7k6PBkI51GX0McjFR84900WJLE?=
 =?us-ascii?Q?+/9Qn9QqpcbMIvdLRz0keC00IZndVeNVWVwQE1/NGkGBFNOeRZlBd0GAp/db?=
 =?us-ascii?Q?L+/+KZWHtWCIz+ZsUNUhzKJvHIS7k6flshVKtJbjygi41r1J+jXrejn2KADw?=
 =?us-ascii?Q?DSuN+4WH4uo+n3R0mtTagN33ePMER9pNkg6oAU/2UjXwvbzVEXTzyyuEzXEJ?=
 =?us-ascii?Q?fVJKQcw/I4cFSDaVNw90Fq0MJIa7ZAdyv3/MFc8XzjoZdSbI64epcYII1IeS?=
 =?us-ascii?Q?gnABICsqPjYH8R/CA7Vuwxr5qGECLLSEaUIkKpWV2/12g8LC0rx1KNq0/0tu?=
 =?us-ascii?Q?8N6vWwRroRlRkUsmRUpqXG82VLWRonfASNTySmGBTAqW5mu6YpAwffeF/UGB?=
 =?us-ascii?Q?KxGIpouyFXNQhIPmEMSarlVto+DumZoyx58L2una55sbIeBZ5ljfG3rtvjKV?=
 =?us-ascii?Q?6OwOcg0DdMskjWIy1+VWkp7QAQlLMQgZG2/IfuQ243zRTXeLAyuwyRGD/+rK?=
 =?us-ascii?Q?3r7K1R/pwTs4amk1gr1OXG+joYywR7QMZ33I2aSujKzLzr02gm3b5aLMPFPZ?=
 =?us-ascii?Q?Ak/W4j/hWjo1aFnABYK/MNy/S5x4DVUJl6UZ/6iOfX7ExuvztNq/t/ok9WmO?=
 =?us-ascii?Q?cX3ZJiVIWmoRxNYr2pR3n3OtAtCf5PmtJLyC7dqy97E3fjI7dIc9zatXCtvt?=
 =?us-ascii?Q?mtDJ0uH5d+7wqSzyCK1E46T6cy9iKTltzCkYKdC5Jdul3kdwphGhcnjtlQaA?=
 =?us-ascii?Q?ciQh2Q6Vd9sq/gFLCpraz+PQCb7JrBW2nX9yhygFFCSd3K5dq0qksTgLPpln?=
 =?us-ascii?Q?PmuUvpVJjCy1zGCvQC7NZvvrqtHe1qpXzkWuC4YLvAAotCOcCva+LC9Q4kaF?=
 =?us-ascii?Q?VdjUFzvLwoBkoLZe2Tm7pSnrtYLtKH1CuLKj2zt9+DekuJ+h7xPfhGHag1hB?=
 =?us-ascii?Q?gX5ijSQ5G4DwUfsCJx4sBl8pSgRxJA4WYePGtTLRQTSnRW7tX3yCuMZO+EY2?=
 =?us-ascii?Q?UVKMWcS8J1vo99zB6DGn4sgUp8EZ3LFuJmbnQ4yrmGZgwqvPIQunh4e0/BFh?=
 =?us-ascii?Q?rQBghn6tULQk/8RM2iNYKJxi/p9dia4ZWphGTwwAXGdcsNg0oEDowyqEj5Wp?=
 =?us-ascii?Q?Q8cudi3f2U+2eG1ZGKDcj94lK3kKCsYbCu0cG0/lDr0t2y7ddC8eerUwNv9h?=
 =?us-ascii?Q?X2CbhvwybqUxTr0cs7y7vhLKVJ/oFuYsOyO3LizWV2xAVwe6/QmFnt+k2lJU?=
 =?us-ascii?Q?dTlJvBvSiHsyTHeAx8bicmhWyI+TFwlTQ3I5xA5DUXBS76JoLrEwV/ieAW+9?=
 =?us-ascii?Q?EX/5qbi6m0ZjieH37D6HIxQ99tnXQMjt/pH0XZM1dL6rJHoDhBySsOUzFBMW?=
 =?us-ascii?Q?zZg6VwIah97iy/N+Gbd82vgkF1xagf7ZsXVzdsz0nAUe0y/bpNrk94aiczMz?=
 =?us-ascii?Q?N9chkCt2Pxua2+LDd5569hiOHaO8qiMaZGIX0gHOO87hpZKOVt/wiGpm99wu?=
 =?us-ascii?Q?Umxtw4F6pholzo8=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 08f6f360-b914-4519-7b0f-08dd0ef59460
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2024 15:10:07.5581
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1235



> -----Original Message-----
> From: Bartosz Golaszewski <brgl@bgdev.pl>
> Sent: Wednesday, November 27, 2024 9:05 AM
> To: Vincent Fazio <vfazio@xes-inc.com>; Phil Howard <phil@gadgetoid.com>;
> Kent Gibson <warthog618@gmail.com>; Linus Walleij
> <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org; Bartosz Golaszewski
> <bartosz.golaszewski@linaro.org>
> Subject: [External] - [libgpiod][PATCH] bindings: python: fix license tag=
s
>=20
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> Several files under bindings/python/ have wrong license tags.
>=20
> In general:
> - Makefiles should be covered by GPL
> - all python sources under bindings/python/gpiod/ and
>   bindings/python/tests/ that are part of importable modules should be
>   licensed under LGPL
> - executable examples should be licensed under GPL
>=20
> Reported-by: Vincent Fazio <vfazio@xes-inc.com>
> Closes: https://github.com/brgl/libgpiod/issues/110
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Kent, Vincent:
>=20
> This patch doesn't really relicense the code. It just makes the licensing
> consistent across the python bindings. However - as the only two authors =
of
> the affected files other than me - could you please leave your acks?

Acked-by: Vincent Fazio <vfazio@xes-inc.com>

