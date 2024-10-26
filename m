Return-Path: <linux-gpio+bounces-12144-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F959B18E8
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 17:02:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F8B51F21C59
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 15:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA5DF1CA9C;
	Sat, 26 Oct 2024 15:02:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01on2094.outbound.protection.outlook.com [40.107.239.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D16AA947;
	Sat, 26 Oct 2024 15:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.239.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729954950; cv=fail; b=Gj5y1388kLQD+Vi641JzYSKE5PFMK/cNn8uCFcqAuagU5ALXUp4JayJUJd7CxmliMH6UG7/j+OmL4FlpmTEAlaFliolh6eAHwPWGYy4kQ22xaJ4HQhRbchBLnuOMQaXaRpnDK0CKgzfFW1MK7KLuVptk1X+IqfWD1SlyuTCsxeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729954950; c=relaxed/simple;
	bh=kiPOGk6gjBJGRQifEuziIlVJRsa4LnoTj8Ab3kKRjrA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OGcDNiaq83LRv6XwW8qJd/81SBjm49FhYzfy+aFNmydHx/509sDN+QEyJq3Ax0pq1NU7H2oeVG0t4OCUiKEh/HohZP8VQCm2Z9hoQxvH8OucJe7N4g4D6STVmBOdcqiD40x3r31mkkqEm9D/zYjIYGI9UP/xClx7BF2j7lkiZKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.239.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q5NZzZ4sDaQhIrXMTgJclbkLvh3b2aIT7Wz1TavRzgf7vsQbVpkEFm6w5SICQ1B9ilzfXzdZ3AhnV4LnOR7VNDdgxpas8E/bLad1qNL+r8AbTqb0/c2/bQe4LC56E8J0ovXJD/Mb8yZ/5IpdmJN4AsK1wTZwrmw8Jjkg5qh1jOJXDEc69KPBFI3HQ6NWXCKGrbI8ACLUAzBU7FInTiEUfqsXAfaRSFlaMwzKf2gvWSKAyaFddXC5KGRXm2keBWSKTr3q80oDu3OUYvolYXdenUVEHwIrRNKRmuR6riQoTAyzZZvd1ab2GX+oVdNDFSaqbeYZkc4mYFW3Sww8NLsqkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kiPOGk6gjBJGRQifEuziIlVJRsa4LnoTj8Ab3kKRjrA=;
 b=lnfpwOpdif3bR2Z744qKSMUPZZTSvMcbtaSowjobzsbCYtg2AxBG5vZs57Qq6wW0n2HgResAR35hataipeRvKpOB+c5rb+Dh0L6NMubV3aGy4HakNH7Q92ltzmE3HClTKZsLJa01wR/bDRcQeOagsQ/p9IKUwOwpbbn8bvhKZpGwyoCT8r7Teit+j2GNXS1pov+FpvSnmpxEjXg7KskAyw5Zr2MMJQnetyEOntZjGIum6FS5aHYNFIs8VcTe8Ul6dsqi8K+h8b7E5khk+GSHeHRrI/HTy/DixZaMPByARBWGjTeLyLJzmRVK4jcYHqh2X+rzFtLOJIUuV/QxcfnvjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA0P287MB1834.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Sat, 26 Oct
 2024 15:02:23 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%5]) with mapi id 15.20.8093.014; Sat, 26 Oct 2024
 15:02:23 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Krzysztof Kozlowski <krzk@kernel.org>, Himanshu Bhavani
	<himanshu.bhavani@siliconsignals.io>
CC: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] dt-bindings: pinctrl: convert pinctrl-mcp23s08.txt to
 yaml format
Thread-Topic: [PATCH v2] dt-bindings: pinctrl: convert pinctrl-mcp23s08.txt to
 yaml format
Thread-Index: AQHbJhLcvG4Vz0BOQ0uMGPkY6V1e9LKY9kcAgAAOtQCAABTl3A==
Date: Sat, 26 Oct 2024 15:02:23 +0000
Message-ID:
 <PN3P287MB1829C2FCE4C56325CD1DC8988B482@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20241024124654.26775-1-himanshu.bhavani@siliconsignals.io>
 <usqmeunejf44l6wjw67ocv4idyxfpw5ivt5v4hqkputd7d7xsk@3ies2iwutzsz>
 <PN0P287MB20195CAFA249448F66D13B659A482@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
In-Reply-To:
 <PN0P287MB20195CAFA249448F66D13B659A482@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MA0P287MB1834:EE_
x-ms-office365-filtering-correlation-id: 0c6ba55f-cfe4-4d0c-9305-08dcf5cf32ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?SKLNhEeG5ZKVcr3gSIgG0p+fGq8OjE6+G/8esmr07yfHJFOO0vymdUau?=
 =?Windows-1252?Q?lZx+KhqpaVYbz4/qFeFnyVGxYG5+tRcL2aVGXGCR+FmWjgpMVyAl0TAV?=
 =?Windows-1252?Q?QsaJ9cVdbLboDIap/C+2LSWx07qInPqoH2FWpd8a514kvWr6NovyZ43O?=
 =?Windows-1252?Q?CJggXdm5jS+VS3/YoiIWqSryxIgng2f6x/OxgguqXfK1NKwMizmm3/IU?=
 =?Windows-1252?Q?QoISmJzRnT8dt3OTDwgeZ7QYVgl82tZ6hUDmmYfaONK9xvF0J2Xt8D1L?=
 =?Windows-1252?Q?4aNKY5iLStK7CHJSRAiixxWXftotl7H9AgAXWTcgJ6w5Eqyvh/B21e99?=
 =?Windows-1252?Q?Z+LakHZElyhcfKkNDlO4D2mMx1PUV2x/gwVeQ/IgJGAsw3FlDjqpiWdC?=
 =?Windows-1252?Q?szp7DWb9V6oYBERuHQR8ikRFHgx2149svo6fTprrMyRjIwgizTAy/ZTv?=
 =?Windows-1252?Q?xZAnRLqbG6RghrmpMEvFEy1m6Fkx82ahPRIgFabXYcNsqwxoxfdogA7b?=
 =?Windows-1252?Q?plqdOobsB0RZqzovxgli90vKrQ8MeH05gNNZwQJx5NtuuuTEwBtFORit?=
 =?Windows-1252?Q?6PMgll1WSoyKRctzYh/zBo5oK0lhccpwYy3V+GeLGCIBP1ZtpW9wQpEP?=
 =?Windows-1252?Q?lGaQRLr5gqaSyvZX1JWx2BCrjvPZ+pa3bPkFS0B9xmiGEUYcIWHYwg7N?=
 =?Windows-1252?Q?NDZTDEk4zDbyc9j76ApBoSdHfNxT0Icfo0ZFpZeH4a6skzm1dZasxubX?=
 =?Windows-1252?Q?PwEZ9OJJPNMyzSBC+FVZW217wKja54fc8JnBjMGe3/ZP8RY9QGh3jk38?=
 =?Windows-1252?Q?QkRtmyARaMEIOrAxNFIdE8SqvzwDb9OtCra43SzGyWQ6JdUorzqalNs0?=
 =?Windows-1252?Q?T8a+8MlRk2xdMTvCesTuzsqZ/s/BUg749VQBmgZNR9sWR2OGC9ZMJOfy?=
 =?Windows-1252?Q?3KV31hrqiz17YGbbYlXo4LUPh09psyOST13JbQTpVKHgSVlMIycrxO7j?=
 =?Windows-1252?Q?PepDLk6XWtZOcFSnBmAf/Ntm4KJHJmrN4QDoXISGXnNK1WXNHcIdYDSt?=
 =?Windows-1252?Q?iskIKIYMPqMJkG9jH7oYZE3e8h8nEXta2DTUQtu7MPpy409CG588Jwx9?=
 =?Windows-1252?Q?EGzbHN0ZzRb3GndIiduFtGPFrMFxu5hyIDaVpYnguyPTPBTkl6fE0CRt?=
 =?Windows-1252?Q?5jb2JzJpsslmGXlUX0wItKdaEbod6lDBLungEzklilnoP4tehestDpkO?=
 =?Windows-1252?Q?hLDyMqOYh27Ilmt0q9WxOL5lShVB0QFwGSwS0tM1XByFgFoQBG5Uf3X4?=
 =?Windows-1252?Q?1QGRyEkoWgzIFquybNzYh0xXKvQzzCNac0W3ClDzjfpTvRVY6uwe/vn5?=
 =?Windows-1252?Q?y8L0f4NMpOuIDne+pPm9S07KCN+RUk3CyZEFXW+4kVoKtuTeFviu9FoW?=
 =?Windows-1252?Q?8NXfJogDX1441Ea8wiNZyYYVJmr504SCaJYz3gd3mj4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?6xS6ILVIZgmcpoeXnAHQ3pqwOp/8EL3OVShn/A8CqXQAf5DBITs4/Fac?=
 =?Windows-1252?Q?50gTj2SWFev1M2bEjq5zd7i9603hmE3C2FZUmDU31oDn6o3MMnFcEWkN?=
 =?Windows-1252?Q?UTcrHKN2Q8ocDlQjEImi3Q9Hs9C9nUSKrtvFZwVLTRAXlGWTGPgyG2iW?=
 =?Windows-1252?Q?RyiXJAqxKY2qpPMyzXkpPNceKQJdURlxiskkYjaD7qBMkhRoVyDjlj0C?=
 =?Windows-1252?Q?0gm+GfbV8yGenSa8dgQxT++RSO6gob7cgyN9q9+IzR9RjSqRc3kdf6f3?=
 =?Windows-1252?Q?2t5XYzzQBEEL9F7Vzpy5FyJ7oXVUA8CawNe22nh/Z/Qsd013f928SQ2o?=
 =?Windows-1252?Q?lqL7vVjsmAeOtbKFM+zUpqd8yeS9H0osi1E4F8dVedWwjmiCTK40TI4L?=
 =?Windows-1252?Q?+Xiyj1tQ+BP3v22rx8awe6HnOOrRDWp55CKF2eeFe2ElaD8MkvmtqT1n?=
 =?Windows-1252?Q?9t0NmVn+oR9d06zsm2cdUnn8N8JayyRI8NUYuhLNwi6HqVAVVCnhTuqu?=
 =?Windows-1252?Q?X4/qMU5bP3fzgUcQzmvSZ0ZAO/hU0z5uVdZFjZBGYTDETs1sYxWOpW0c?=
 =?Windows-1252?Q?m9Ptr0lB2ldQoyyzeieknf+guarK5RomJfGPnbCh87im0Bqbc0kiqE8V?=
 =?Windows-1252?Q?7U0Nf7rueXKNRZW5UQ5U61Cx+DIjj0xqpz7hkchj3KPNNQ2b/ozsKjns?=
 =?Windows-1252?Q?E6dfhCuROeLTTDsZ+RVhubeDIi94tke6LXQQK4Lr+OKAO7bW7lpQjSzz?=
 =?Windows-1252?Q?31cjNWx20U4Lz1V9kLYCcZl/pbvieYIaO33EvLqKu9J3U7qoxnfYE2xy?=
 =?Windows-1252?Q?vfJ3VJOqLWHcqZeFjyWwzZVkKQwJ4eSOqXpuFd7nDEIzyDyHX/BGGVmA?=
 =?Windows-1252?Q?we/kjUA0qmn1ZJVWJjXf6AsqwY2c7Hh+K4G7A+1W9QgYb+S/bod6sclF?=
 =?Windows-1252?Q?RhoHrhW4UOSjmjZtpBNiStPeTYPnblKs31gER5M9z4P/EOkP1SeKDYIO?=
 =?Windows-1252?Q?dmVOYNxY6P/xn/zsm7pHykmWmLlLUX/gXOZJqf4U0Em2BlO6MAGptqUZ?=
 =?Windows-1252?Q?Dvv7j64+BX33Jy3Vp07ZYz9L35/1yxxehMHEEv6zQ4+k+Scw6UfShnVS?=
 =?Windows-1252?Q?bH6HVDT1EOsuVOKW2hzzdo3kUnOYrLychxx1OWlIJ0zsIJ4nxMQRn1xV?=
 =?Windows-1252?Q?stBP3yqFxH5wSvZX8WxkDttJ2w2JQ/gyjgY/cUUVpttN0rV/cvbfQ0Fe?=
 =?Windows-1252?Q?51iMdmHuyKSDMW1xDiOk6mV0+FQOvBnj0JT60fNiCK43p0XrMiQOy24X?=
 =?Windows-1252?Q?icVnm8/gE4LESbqi2Vl151sZebuyN/TLIxEUDDaHTIcuAgj+k/ZLW44b?=
 =?Windows-1252?Q?I4/PlvlV4YQ1+Jtt12NPGaoFnJLko3YbrOljJ4L/dA7sSPcRNugKT8Se?=
 =?Windows-1252?Q?EGxFL9WpCCvBDzeKE2MfnZvTilXmWU7Gq7ODdC3aXw22z/aCYqf4DSHO?=
 =?Windows-1252?Q?hTKH1QBBxK0Cp3wNwOI/YKtA2EDQO/mh3kZhfapSwMqcS+DRwZfPl7LW?=
 =?Windows-1252?Q?91F5jGRsA2HuVI+rOYFcPx9sklbKs5Xa8sc4VcRnHgE2+U41xgvROiAy?=
 =?Windows-1252?Q?AaK3vEpkjhBYRjjstJUBbPnzQJb7RksqO9RSgCVn5g49V9lLbPdwZE5C?=
 =?Windows-1252?Q?Jw0xfpJnxHaxpqu3DybMPkahxG6t4DMBBfM1oONNlEyuvBZSHSgD3Q?=
 =?Windows-1252?Q?=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c6ba55f-cfe4-4d0c-9305-08dcf5cf32ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2024 15:02:23.7723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qWIH0sWwof/mLpRZvDofuXRKOBeV3Mm0KyWHWoul+0SK+l2Sn1R7OsAR7TgxCJxbNgH2NiPoWSiAlddZD8LZkfE+lhkRIi99clS8FlBWfcA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1834

Hi Krzysztof , Himanshu=0A=
=0A=
>>> +=0A=
>>> +=A0=A0=A0 i2c {=0A=
>>=0A=
>>Keep one complete example for i2c and one for spi. This was not in=0A=
>>previous patch and change log does not explain why you need three=0A=
>>examples.=0A=
>=0A=
>Okay, I will drop one example of I2C=0A=
=0A=
In ex1: use when you only need basic GPIO and interrupt capabilities =0A=
without additional pin control and in ex2: use when you need pull-up =0A=
resistors on specific GPIO pins or a reset line.=0A=
=0A=
Original bindings state that this node can be implemented in two =0A=
different ways, so we should maintain both examples for reference.=0A=
=0A=
But it's up to you, I trust your expertise on this, Krzysztof=0A=
=0A=
>>> +=A0=A0=A0=A0=A0=A0=A0 #address-cells =3D <1>;=0A=
>>> +=A0=A0=A0=A0=A0=A0=A0 #size-cells =3D <0>;=0A=
>>> +=0A=
>>> +=A0=A0=A0=A0=A0=A0=A0 mcp23017: gpio@21 {=0A=
>>=0A=
>>Drop unused label=0A=
>=A0=0A=
>May I know how its unused, AFAIK, Since it's an I/O expanded, it=92s refer=
enced elsewhere, so keeping it is necessary for >functionality.=0A=
=0A=
I agree with Himanshu. =0A=
It's definitely used for reset GPIOs, LED pins, or something similar.=0A=
=0A=
Best Regards,=0A=
Tarang=

