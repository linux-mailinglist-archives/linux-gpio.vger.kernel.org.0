Return-Path: <linux-gpio+bounces-12149-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CE79B1A92
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 21:25:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95D011F21B14
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 19:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FF481D271D;
	Sat, 26 Oct 2024 19:25:40 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01on2122.outbound.protection.outlook.com [40.107.239.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC386BE4E;
	Sat, 26 Oct 2024 19:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.239.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729970739; cv=fail; b=gbIkSZ7bgOajzSpLL7+Jj84PDIQu36d8SZsgbPNY4wINxbQPtfhoJt4Z32ktZKdb3mxgj9Dq5n9PxmZzLX0NQ536WUgWmUAwWmdrdZvrtTBzeBHR0W+zbNZmmkqI9FR4f9KVocu8CyU5Kyx2BpsXWPt5CUkIlWncEzvb/pQkNOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729970739; c=relaxed/simple;
	bh=869h5b2Yhom3WSyx0wY94cPsJl4Tlj0yAZ41PCXrUPs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=V+nmrOCmAxXyWAz/xCSAyiFmfE4F5ow6rzPI696OhNCR9nDMF3IUrJWB5MnEenYIU70X9C/F0Y/ioSp4zjOP78m7owWefbUNkQsgp6OnIIfwGGqej1Mc3A6CAR6oXrdUNb8WJbHj7bTZQEpR5cIwPtLewb7st7+MKsUJySmOG+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.239.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gGhBINTOW6E/bZgI9GMXwzJARgnBiQbEdmvg18Q6gRjunuDrDPaWpId8QSUpffBxglq6LCxcvB82cNCvh6+iKCfNmy6/G+MR3aF7uoxudNYlFo2YkGnc3U1eZjQ+EeEX8q05GFbtMsd5gvR/k4clUFnb09NVFFP5nJzGXFqoJ0NAFvW8qAOUKYkUB+0BO4TMorq6LlzbfPkOBxKfHDC+07ED7R7DlyPdQC8wFDCHqTHWt1Yd9GmAwJZIMIQlGM3fA54YLoM4vrWXUbL+LTBeCtyJzoM+Ih4zYkyq7kER3biBkimo5zKIeAeR+JbiHWU263snmybll7kJu99cF9BZIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=869h5b2Yhom3WSyx0wY94cPsJl4Tlj0yAZ41PCXrUPs=;
 b=W2zo73/rEGOwoZgtZlQHRY3HXqOG1GGAegi/RDS/hIXIh1/U3dpo9bTj7gKl0tTPxIA+VHae8I7DUixrE2BCTwzX03HPtXFW/fvlq5ZudPvJygoz9ycZRvfYXlO4XBubG38OUJwnS47L2nLy7YLoKUiBDMbLCJlH3q5OFsF5UBJgW4tXKv2GYqXbRisWXvtJyxhBSLxnW5wPXnaQ8olwG+5Wm6jd8b2pNFkDx4uFdzaPfC3hZpgPhzt1N3oiJ2Qmh3B3DzGd6Kgq0I8sWwF3rSKHEUKnNBB2a4PsLKJquzGJII/1BFLr+vBKq/rfUZ+/MvEvN8/6RHd8fHyIVMzLfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MAYP287MB3597.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:149::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Sat, 26 Oct
 2024 19:25:32 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%5]) with mapi id 15.20.8093.014; Sat, 26 Oct 2024
 19:25:32 +0000
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
Thread-Index: AQHbJhLcvG4Vz0BOQ0uMGPkY6V1e9LKY9kcAgAAOtQCAABTl3IAAPZKAgAANxCo=
Date: Sat, 26 Oct 2024 19:25:32 +0000
Message-ID:
 <PN3P287MB1829A71905108200B68353A68B482@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20241024124654.26775-1-himanshu.bhavani@siliconsignals.io>
 <usqmeunejf44l6wjw67ocv4idyxfpw5ivt5v4hqkputd7d7xsk@3ies2iwutzsz>
 <PN0P287MB20195CAFA249448F66D13B659A482@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
 <PN3P287MB1829C2FCE4C56325CD1DC8988B482@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <91a8d0ab-a6a6-4dfa-8613-8d4dbafeda40@kernel.org>
In-Reply-To: <91a8d0ab-a6a6-4dfa-8613-8d4dbafeda40@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MAYP287MB3597:EE_
x-ms-office365-filtering-correlation-id: fbccf0cf-124f-4ec5-ec2d-08dcf5f3f580
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|10070799003|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?iRvAubnMpCSPWCA7FXj0nirj2pzAXzV8TXXmmoi/zFNcM7KY0mRoTXgs?=
 =?Windows-1252?Q?BUZQXAbcyukx8C5iaM+Y0+GJ5zsSXQdjugNqHqGkU+ni3mPCCkH2tJdW?=
 =?Windows-1252?Q?szPKNcCm4mQ7gXS2pmJxBUsug5pDmaFfA/v8KjeXTfqn6YruvPs5CH6x?=
 =?Windows-1252?Q?8VE+YjiltCAcXXWxUtK/Kyn4cKGqLU4+AKRkaJfH/zDKH4BSiV5MulUq?=
 =?Windows-1252?Q?dgSif3BFgZkPWmmqsRsWXLVFeC9PTlaYZgPUBtsu0AVoGmAATAbvjJhk?=
 =?Windows-1252?Q?Z6ejlTOoL66CaB7an8esqdSQf9NDPZWf61qcGN5QamRW97BtISt9YEfz?=
 =?Windows-1252?Q?qGYac+2h5PxVuewt1rxwOQaa7UmmA3YdQWAHSJ/jPpKyb8+fJCEfIESb?=
 =?Windows-1252?Q?5inlQHYqZ9K2cOqdMkTkuFwkYpA9p/LofsmZmnxp5uzRv+Ivww+iaTzD?=
 =?Windows-1252?Q?TkLw41j/wSwQs5WF0zpTp17nClhntTzz7/AFGatVRE+j7O9f3VQ17ej7?=
 =?Windows-1252?Q?4u4+iWDth58WEHe9Ip8pGIe+LakPkkxybj4XF1JoA2IbjViud/CfKOP1?=
 =?Windows-1252?Q?yDQr+2Sabh43bb2/Ux6bOo1h9D5lDgpYoqmhBZsrMR6Z35KmIFZ8XXOA?=
 =?Windows-1252?Q?x7RsNsgtf3+7a1pZZWSQrGLmC7cmcgxnX9wajSWOS1wV9exKwspF6Fb4?=
 =?Windows-1252?Q?ejwd5kuVtss5Q0YN43RU4ORlyN5d0uArxLvmn/r0si+c6tyaZdx5bql2?=
 =?Windows-1252?Q?yoBl9rICCw14Qpc9+HR31AHt+wmxifW9vHYk0uwkdnydeWd7iIhohT4T?=
 =?Windows-1252?Q?EXH9/HeuSkKVetdEUecUHkf7Az7SyiNaul3iXC3XW2JXGDgEtOcXr9XB?=
 =?Windows-1252?Q?Jrm2lwhHkSkFGa07R0o/LJtBJnlRqlDw+zufAYhnE9vWp+Hdj6eO0ZWo?=
 =?Windows-1252?Q?iknzYqYljI+pwjV3Os22NmnQEDZEnHThDid6abZAY/lHd0iaU7PSTneq?=
 =?Windows-1252?Q?9/W3aXT4XlVZW761y7ZbGgNW71G0ogjJUJCkQacWGgoWHC8Mgt/+y7n7?=
 =?Windows-1252?Q?mGJFVDfesZIRdR+TwD2Frcq+gbjk01nlE3zpQFCd2giNFUDsXDrqmHGr?=
 =?Windows-1252?Q?9tO/2AYw5Fde1UvFyaWKvXre5c9Un3Zdw8g01fQjsFZasHQq98zl9+wn?=
 =?Windows-1252?Q?DF6BcBD8lwslEOGE9QyETRqJ2VpJcrFij+eNn/LWawIamiyVgn1XaUJD?=
 =?Windows-1252?Q?0oNn+dGBe3SJNF4tEk1k9NKFwGfLxwdTnITixv5LkuZMUjbcEqHB0cgz?=
 =?Windows-1252?Q?VR7GDNeh/WfklzBvV/LJ/m+g3e021EsRS7PMxcE2X8O0b7pybth1XfZT?=
 =?Windows-1252?Q?VJUHuZM7Gl1DeDeoQ1x2oIMtqJE2U3ZY5pjbEVX91hJMpjwJIV059/M0?=
 =?Windows-1252?Q?XRcpSv71VmwgzqpkCrLOa2PsR8dGDAEItBWCFDahS5E=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?9uNtXo7ZfvSHlW8NCTxAfEdU1A3V6Da4J6IW3K3vh8wqZ5F0LhcoxDSr?=
 =?Windows-1252?Q?oEArtYhk2sOfi9Sd4YjkRc1H07PcZMTCUQoivt6dSuMST2SwyrTmz2CL?=
 =?Windows-1252?Q?gHtbUhHVISdyRV498AlVnVMsqM03WIX6Ghawx54cdufvuwzubIPKiTN4?=
 =?Windows-1252?Q?vbOlPVl5LmUXC0wjczjdlWuFwpBcm25RtHC31z9WWJA6vIq02AJ96gSH?=
 =?Windows-1252?Q?qKjBXSdbTintzfER4kYvUwuhxto4OtO1LqtKbogwxVOp/BqD57F+bnnv?=
 =?Windows-1252?Q?Ufm/pex+yeW/C8DjYyUVzKLpugdOQ01Ynj35RPeGKjyi2cb07nY906TA?=
 =?Windows-1252?Q?n+7c1lNkFEu2U5RYvTkgytdIUkj8agQVmCl+i7sD2jsaRUhgX62xSd7l?=
 =?Windows-1252?Q?S70yGmYTbMbnTZACEJD5VGFG9RTRT7dp7syVvXM4hdTz/qWEHdb+SCrv?=
 =?Windows-1252?Q?FVi7WUdnW3nrODxagWDVmWc3u6UeRWW1Q8GRiCbUXPWKoTYyiM6eQX7a?=
 =?Windows-1252?Q?rwaYAYcvI1DI3M/RPJSk48Ex5AX9l1xhLt/Oupv130l8Dxw4nbMlay5g?=
 =?Windows-1252?Q?kY5SYsBDgPiQKURbkDhqMCXBD56Mm/SSLeVnmjOyez+JhKDStKTtJz5/?=
 =?Windows-1252?Q?F+cBAeyfTGzrgbgGK21grQ648Mefbu5e9kEWy5563NqUknvLNoJ9hc2Y?=
 =?Windows-1252?Q?bg3YaGqEL1ASqBL7AeluwL5LDRkOzC5b6YBUbELpUfwNXUjSp/uRlEwI?=
 =?Windows-1252?Q?Ga4zZTepGojOS8wy5eBnI4QosB/I/hMCTQ29NYLaJGF6yE1WJa7kI8jZ?=
 =?Windows-1252?Q?3qiZF05bRm3wHt/NBbYLb6eald6c/J9WUbICwI/biTdVzwvS++h4/MhP?=
 =?Windows-1252?Q?DKr/m4812KST9DpXhMGMVOGyHlBQQrWtvmTbP4fhtVbS+WGkm9YSMS4f?=
 =?Windows-1252?Q?O512zpUM3PfMP2MH3xV3qD8KQ/765IDDUhMmPkRFPXSsLePQV1hEY3xz?=
 =?Windows-1252?Q?YRmFCTkM9P7Mzl3MlgKcWHAtf/DBw4Wxf9m+A2K3sG7XElM6iXK4I4n8?=
 =?Windows-1252?Q?k1xsNIEUL5fh4Lff0RFrhUIOHwfys9jnyccnqtthgaAnzq8y98KwU90i?=
 =?Windows-1252?Q?cPzJBJUqCvnxYi9Nim8nvxMlGTnY9Trt0MCymQTK5u5MRLO/qj7Mr75Q?=
 =?Windows-1252?Q?IZO1QxnhP5nlWSKUguY9Ayy6EpHgngTB21ghqWnv+tcgPbJnu70LZUxU?=
 =?Windows-1252?Q?vuQEpv1fVnpBBQQX4CFFFK5/oCyusFkVD4VtmKGQVTx+4nneXvBOibeW?=
 =?Windows-1252?Q?dD7T7JVWNtd/Q+3ggnfBa8UEOew/NSv2PNFup8Q1pu6VQuA5+lf7u/mY?=
 =?Windows-1252?Q?PMYRozHGZLrmkQw3YvWHgTICQo1L9tptNiXKf2yW+RZUZzd9JzOSwdxp?=
 =?Windows-1252?Q?ro+yDOLNT6ML4kY4T5OVhXJadp51h14QxoqXLEtjxlQtSikvKhu3Mutv?=
 =?Windows-1252?Q?739KwPr8B+rcazUI7EC+VLSe0kV1uINmKQmLQ2+5Qv8RGaAz54L0FMv2?=
 =?Windows-1252?Q?CgJ3+jSAT3jQ5w83q4VEeDtek0ciVdTYq2GYfq+RStr0ubw93yk7e/Ci?=
 =?Windows-1252?Q?L2xmjRGh/C7WrLHYxg24gv/TH3xhaqzrcEF1LS/BxuAASHfFhAM/YkTR?=
 =?Windows-1252?Q?sAlsy68MQk2ekZDPp8vMiURUWfBVTNdRIcI/MsRObl5Nf+XDgcdXxlVg?=
 =?Windows-1252?Q?6mi9WbZ6yRBaCMyO+kpxiZsXQjp913iQOrwbwDQg/WEKyOkimCKmSjF3?=
 =?Windows-1252?Q?44mJjw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fbccf0cf-124f-4ec5-ec2d-08dcf5f3f580
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2024 19:25:32.4465
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zczs2O4WRTn0mZCcBf+FxHs7PHOEAXORdgVCDpk2FXlIG9bP0tF51SR6cxGdxKG6sVmz7M167pDyXVRE0pyoNBZzp7eEl8WpKn7N3mQCghQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAYP287MB3597

Hi Krzysztof ,=0A=
=0A=
>On 26/10/2024 17:02, Tarang Raval wrote:=0A=
>> Hi Krzysztof , Himanshu=0A=
>>=0A=
>>>>> +=0A=
>>>>> +=A0=A0=A0 i2c {=0A=
>>>>=0A=
>>>> Keep one complete example for i2c and one for spi. This was not in=0A=
>>>> previous patch and change log does not explain why you need three=0A=
>>>> examples.=0A=
>>>=0A=
>>> Okay, I will drop one example of I2C=0A=
>>=0A=
>> In ex1: use when you only need basic GPIO and interrupt capabilities=0A=
>> without additional pin control and in ex2: use when you need pull-up=0A=
>> resistors on specific GPIO pins or a reset line.=0A=
>>=0A=
>> Original bindings state that this node can be implemented in two=0A=
>> different ways, so we should maintain both examples for reference.=0A=
>=0A=
>Example is not the binding. If you claim conversion is incomplete, it=0A=
>must be done through the binding, not example.=0A=
=0A=
Understood, thanks for the clarification=0A=
=0A=
>> But it's up to you, I trust your expertise on this, Krzysztof=0A=
>>=0A=
>>>>> +=A0=A0=A0=A0=A0=A0=A0 #address-cells =3D <1>;=0A=
>>>>> +=A0=A0=A0=A0=A0=A0=A0 #size-cells =3D <0>;=0A=
>>>>> +=0A=
>>>>> +=A0=A0=A0=A0=A0=A0=A0 mcp23017: gpio@21 {=0A=
>>>>=0A=
>>>> Drop unused label=0A=
>>>=0A=
>>> May I know how its unused, AFAIK, Since it's an I/O expanded, it=92s re=
ferenced elsewhere, so keeping it is necessary for >functionality.=0A=
>>=0A=
>> I agree with Himanshu.=0A=
>> It's definitely used for reset GPIOs, LED pins, or something similar.=0A=
>=0A=
>So point to the specific line in this file. Really, it's no different=0A=
>than every other binding. If it is different, provide some arguments why=
=0A=
>this is different.=0A=
=0A=
okay, I get your point=A0=0A=
=0A=
Best Regards,=0A=
Tarang=0A=

