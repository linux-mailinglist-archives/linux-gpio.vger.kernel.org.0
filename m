Return-Path: <linux-gpio+bounces-21675-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D273ADBBC3
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 23:13:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DA74188F3B6
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 21:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB735217F34;
	Mon, 16 Jun 2025 21:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="q/Yo+xdC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2135.outbound.protection.outlook.com [40.107.96.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E4E215F7C;
	Mon, 16 Jun 2025 21:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750108411; cv=fail; b=HNFxU0goPXiwLomtGKuH06zjTTwXmr9OTaOiJsfaG74D9j/kpThmlrWAka1KpuZinRbugxt+QX1Rw/aVBAoflN25zUUb6mDY3v41vhEWm9ZXKKsJcNJTdsXiIPHZpr5A3+s2NI+KjZq1y3IOZrUyJD6FrovCrRJjaJLPHWXKXMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750108411; c=relaxed/simple;
	bh=sG/aPL6jdlpOQAc6p0QRAs184i+CdOpIiDhb1jloNo8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=InFDbIdTAVCoDG/ZgdCLuVBNdr8sC3/936LoTEez2Lwurii1MfPtI4cf/6HzKt64MR74YpzIIszuztLo4W7wdNZLWlRhaWJIboFL/UgG+WlXWodBhUnbQL2DkK4cb5yaFjTAQaF4wMFZ6jjVT/y2vwPoe7j7OnA58GOncm2Tmc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=q/Yo+xdC; arc=fail smtp.client-ip=40.107.96.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qKxxQQm6f1i0ShfqZAyRxdSCPYqgo9ClbVdqumwTXPI+T4x9Fxz1TjC00iOhV/7up5uVOemor56NLi9hOYhwxQ9zlbbuqezA1/qatFyfc7Cv3GGZ3Xd65jI9Ivv5/HilwV/dqAY33uC9gLtB5eqsu3nnxsKI99jA9VyXPWL6aBBj8pHN60cPxkY23usfQLheBQdGnMshE0BqePeaGKBP6tGQ48yUuo2E7NvyW4cCo2QHdRfdyanOazVnAu6verKuDpCA6+O5Rh0C/rGDEexa06uV9KsRdq6Lm09rJl1ZyXbwM4jFCV0WfFFvS1EIxk3mGBPZjZKa2dGsTtWsTQIPyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sG/aPL6jdlpOQAc6p0QRAs184i+CdOpIiDhb1jloNo8=;
 b=t51332bIGcJ3qlSOUYCHsS43fqvK1jEu8fj1uZtGvRaLmAJsB0ZqYzfRmJ/qLvpmvDknc0YsqmumcDstOuvA1sCfzQvI3o/nDxgh+0WTFkJkfjCvESPu0CYV6Rl+GbYSed4VjDTwfwv3RxGIyzpXXpdi0X2gce7yOjv25mgPq3mSi0OhpW5yLtu0HRpiKyXgtuYy1AYeRmVeNlfu0m/0WggWV679O3vVtI4gZEwroz+ZagMONrSAyaP3+vmWwnJ7FTXP2UVn2jmD0FtIrYpFyuc0kwynNkEcjzZTH3Mju4M6QFrie+QpSicNcToaTYRPGEPphzi9DnnhqHIIrzIy6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sG/aPL6jdlpOQAc6p0QRAs184i+CdOpIiDhb1jloNo8=;
 b=q/Yo+xdChgl+YY0AhZjojIElQCWPVDmcO34Bum6SPQeebugNwRS1zvC16NKDPtHMobojcp2iVhthyFVvmrM4SrXPEQN9SP/pBkzgXWLVdbQTOELuEmmw4yuluqBWzbpubmKHFnSAS/tq5duPnXDXCMV16JuUGOut+RTf5A6P4x3C/fA6ZOmCo1LpZYEt2Re/DHGmnq6qK6cEjqUKJWnlMQOdDlX+Y66SaAazp4Py7p2odkpfb+SMtG6M1032c8vzK+Szk7b/W5CAi78TvGMAWO14Xb9LYSf+AZSHv1CrqJknFtcKWdTZf/tjoqrUlYRkW1zkUYZENf8JYwC2V25n7g==
Received: from IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 (2603:10b6:20f:fc04::c3d) by CO6PR18MB4098.namprd18.prod.outlook.com
 (2603:10b6:5:34b::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Mon, 16 Jun
 2025 21:13:25 +0000
Received: from IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 ([fe80::ca34:e235:13d9:3f5d]) by IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 ([fe80::ca34:e235:13d9:3f5d%5]) with mapi id 15.20.8769.031; Mon, 16 Jun 2025
 21:13:24 +0000
From: Harshit Shah <hshah@axiado.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
	<brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "soc@lists.linux.dev" <soc@lists.linux.dev>
Subject: Re: [PATCH v2 2/6] dt-bindings: arm: axiado: add AX3000 EVK
 compatible strings
Thread-Topic: [PATCH v2 2/6] dt-bindings: arm: axiado: add AX3000 EVK
 compatible strings
Thread-Index: AQHb3neVSyePKWzOg0ODy12vIh3RFbQFTH2AgAD9AI8=
Date: Mon, 16 Jun 2025 21:13:24 +0000
Message-ID:
 <IA0PPFBEC4B1F8E5727945AD33204C3AB18D570A@IA0PPFBEC4B1F8E.namprd18.prod.outlook.com>
References:
 <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-0-341502d38618@axiado.com>
 <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-2-341502d38618@axiado.com>
 <f4430b9a-3275-405e-becf-ff62ae16f23c@kernel.org>
In-Reply-To: <f4430b9a-3275-405e-becf-ff62ae16f23c@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PPFBEC4B1F8E:EE_|CO6PR18MB4098:EE_
x-ms-office365-filtering-correlation-id: 399ffac8-c25f-4677-23bc-08ddad1aa19a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ZrsQk4Q7BsmpXCVxocCkxAuIRgiLKKfyjBHsKMJ2E1LcJTg/cl7uw5OFfP?=
 =?iso-8859-1?Q?tDUb2btqnT42I+zIfY7PAj+VAeDYQbzrw084JCBr/slx7rwXcoz5H7SKkB?=
 =?iso-8859-1?Q?AzO2CB8HFGM8Wre6xCPzBOMLe0B72quc3QotRl45odzlIb54cthOWOA9e5?=
 =?iso-8859-1?Q?lv6EIcdxEdd/KrsDbhy0vfVgo6JDn18pEJAgqkfEI1gbBehax3xoikkFIt?=
 =?iso-8859-1?Q?pMUItm+CU94u7i+gkQwSDp2OUd8VpZbN/9HHJ0AG/hlhLgakIkuZguS8Sq?=
 =?iso-8859-1?Q?tffnhOFDnuxSBuaCFeNX3G6HlWvJpOF0kd2IqvafukaoXs2HiPCDtr8RJd?=
 =?iso-8859-1?Q?VntKAM95L8b3ifGCNZn13J9me79HCzAwBC1zQQg3Qglc56fx0NI/jZ4h3Q?=
 =?iso-8859-1?Q?D1HLFHgEiOcn+rX4keYhCiWP+gyHJjTmc6xorLigDEW6Z+H25KsPscHSYj?=
 =?iso-8859-1?Q?vgi9kbnHTGDuiTXakdUwe7rPM5wZzj80U5TGB5AUUBsCwhjNwWLLyrHdi0?=
 =?iso-8859-1?Q?XJURO4dHjO7D7XyMT1qvFU9zd5lq0p1X4SfiZn7SnjIjsjTMEFyEl1KMty?=
 =?iso-8859-1?Q?VpL1hon6EleMJE4b0aTT6Q7aFFjgs2bXeP761HfmqQsp+YCTIoXvbGbOt7?=
 =?iso-8859-1?Q?GUdx35uZxUP2QlbAjG0Wl8BT2ed61D69Qamuvdd6NobeOCswAJNFm9N9N8?=
 =?iso-8859-1?Q?TqF1udHe7XYM98inCWhOp5TobDHtk7B1uW6CQ+1gpCU8YduGmcQgwHgB4p?=
 =?iso-8859-1?Q?SDP6fKdcpDMp7UDU0GiMxyoub5HwokkkX58wwn52qb5vO2xws2HUx6jovh?=
 =?iso-8859-1?Q?JQgbu1xkxN0RX2HaGdbsawykblHgVqOlElf12FBgIroFTpiC8hINJmVKaS?=
 =?iso-8859-1?Q?tQpVy1+iqNLNItwTZtnqKjxqn6YYebkGrpQfsRJy7nKiXcigMpBTBI2XJ2?=
 =?iso-8859-1?Q?g0/rEznCtLZXQGjj/4CqgffP+hO7oR9RgQ5cTHIn+EKE0FbOzcaCcn5z7t?=
 =?iso-8859-1?Q?lsuM5VQsMHqJ68zHZR/MTPG7epJXiYdnR+/cbI7vOLhDYVMJ2qpgJUU1gg?=
 =?iso-8859-1?Q?J9I+OmtKWQKr2JA03AsdSNFQoRXpwo+TttS7ewhwOrlCcAI+ihNKrStVsa?=
 =?iso-8859-1?Q?hq3+e3ctW8X1j5RWjZleABA8LwfDtwyhnU3Q3KD3YcZxCbPjwVAjXv8Jl2?=
 =?iso-8859-1?Q?fi9ELSVhg4NruYi/qqq6h0KVfxpCxfENWIiP3T7KLZmZAlckLcziSUxyRb?=
 =?iso-8859-1?Q?+KfFyw3DJuQPhI2DRwNsGAixVnS4vtTGYHxgezKr0Utq80CDRa8eNOAUMz?=
 =?iso-8859-1?Q?Y96214ZYPD+32ybncpcNz6IUayyrty8YDSAUCaxk/JRMEXdjqkkiKKb2xX?=
 =?iso-8859-1?Q?c+01VeMdrUouQ3NQ3C1kdNeF/jr9O99itGsTilAw6DCvgyqhKSVYLIqowD?=
 =?iso-8859-1?Q?UClV9e19Ww/o0FLiGIioYyG+92dIhwbH/COooNZy4GP8Ro0MBRHYz3XkAz?=
 =?iso-8859-1?Q?Y=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PPFBEC4B1F8E.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?G3OW/RfNvX0sXDuhQ0Eah4Nvkh7Ef7FvJhqPq8/muoXM4VyADLOUURswhb?=
 =?iso-8859-1?Q?K3vMP7OIa8IM/GZYFmoJ7CcfqHVo1HOyds0pagGxWivA+H5t5CWHX1y6eZ?=
 =?iso-8859-1?Q?Fl1dAHXwxAghWQbWfBQDBpDTrEaAzrNo4qdk6WcIcAjjTzHb5Z5UrOQVWi?=
 =?iso-8859-1?Q?dYSp45lpEGL+GKS5ns8G0kywoUmhj0rrwOmajVGHXY///oZK8k0rH79/oD?=
 =?iso-8859-1?Q?H97PT4Hx1YWAvIJTtLE7PJHtq6X+XcKPguWm0riO3wey1zHsOpfJMt4fed?=
 =?iso-8859-1?Q?/l0YMlb/8HREQl03VbKEqX3IbpkzLNpMuzyATr8e6b26UJ3lC70qTqQzl3?=
 =?iso-8859-1?Q?rzUFklXaVdkJQPacpVHCE9zOth2jP3aR/0nLS53fgnK41HYzewyG/CCXnd?=
 =?iso-8859-1?Q?aGfwZJETJCKGXUkJndWWWe6vtGdabQbXHPCFgBqxwTdZY6fbN4cdunX7KW?=
 =?iso-8859-1?Q?0IJ8Aogqz3WW/YLPejycs19r8ZsegObp4MgvLZBUnY1+1278wlifwsS/X4?=
 =?iso-8859-1?Q?avqD+GoBkMNc3am6xI4sqtad3tLZPOU3MZ5y1OpTmm+3rM1MmQxIbqCnnQ?=
 =?iso-8859-1?Q?84ItaWIYffwzCbRCoS1iu0uQiNjylGGzNJS8a8sWgU2acjSg2QusehIckM?=
 =?iso-8859-1?Q?xz+JFoeiq48K8tpLaCVMceXaiuHnrwo9WlXgoix42zGXitPw5D1IhrkqwG?=
 =?iso-8859-1?Q?nt8lFkeVlxa9QD+d1k70eSTJiXTk/7WXwwZA0pSol+K+HmlsymbbTcxK+v?=
 =?iso-8859-1?Q?Vgez/Wkl6osYNOVfnuA+TyAjJ4snvnRbGLHj844I4zxUT/vRnOrXpl3rBB?=
 =?iso-8859-1?Q?pJbNbZotMApLNPnKD6bqkBpqNvMNpQLpFaD0PaXuYqM9LuLLlXpO6KT/IH?=
 =?iso-8859-1?Q?wVGtsnsGAcCQQ7Turcxq/Q8e1vpGV6QW71hIW48wqPR+5h9KW0z/CGekhl?=
 =?iso-8859-1?Q?Q74YikTRrDrVGyo12c9bqSK9EWYQu6b4JtI7dN3Y9xHVRe4CKXNyhgKgSG?=
 =?iso-8859-1?Q?Tbl5l0mN2akwOMgldPz2z/9i1PBxlkm8uALQww4H0pQD8OzLJdZS+ExcJQ?=
 =?iso-8859-1?Q?agEZla1bjEwgt707e/UN1vPmhMj7rBnN+0H/WRFwvPXyFOtA3jpRsjB6Zg?=
 =?iso-8859-1?Q?3NFnwG+qTHWOHPHIODj2sCOr8gENvANq5jJ95ImTX8eks+jkEG/L1bzgPf?=
 =?iso-8859-1?Q?JQjPL4kmo30FO6i2Mxw0/ASvMgeuNmLht1NFJ2jjE2kfEvlariShukqjEO?=
 =?iso-8859-1?Q?yc9mnLM0VPRqTukexbfshTF5e5pmvokHTV0F5AnP+lT5verOqq0VQyfbDw?=
 =?iso-8859-1?Q?YqcoTnE0MsYVadNxOjmo6D6DaFRhqDBURIIraWuJqXuzQzgTeLkIugoJJu?=
 =?iso-8859-1?Q?9WHz2p07SReDHft17irWSrlShpxKRcZdwkEinkxrTb2WhLVgG0ILBn+tfD?=
 =?iso-8859-1?Q?yZQziNL53oZRU2yAsXGZQRQjeedJUkfYMdkaeBTj7qyypYIwGkpkzpUNa2?=
 =?iso-8859-1?Q?V98AiQrwwaLGiUApWdth+g9PaeOHhJBaZ83cZjeYZpKY3VSD0XeUbDXe1t?=
 =?iso-8859-1?Q?kQbtfpahwlyltVR3R23crPJkcCFkv0FwSM7a2yr331BWBQxaEhhYnaXB/P?=
 =?iso-8859-1?Q?V/z09tkRrslfA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 399ffac8-c25f-4677-23bc-08ddad1aa19a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2025 21:13:24.8338
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rXU+PzbiLQO3elREf0mmnAowYtV5CmDK3XgtN6gD+UplPKCBmmI+k4HVs75Bb3W0Ao+Ao6Gye0d3P65RKlibIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR18MB4098

=0A=
________________________________________=0A=
From:=A0Krzysztof Kozlowski <krzk@kernel.org>=0A=
Sent:=A015 June 2025 23:05=0A=
To:=A0Harshit Shah <hshah@axiado.com>; Rob Herring <robh@kernel.org>; Krzys=
ztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Li=
nus Walleij <linus.walleij@linaro.org>; Bartosz Golaszewski <brgl@bgdev.pl>=
; Arnd Bergmann <arnd@arndb.de>; Catalin Marinas <catalin.marinas@arm.com>;=
 Will Deacon <will@kernel.org>=0A=
Cc:=A0devicetree@vger.kernel.org <devicetree@vger.kernel.org>; linux-kernel=
@vger.kernel.org <linux-kernel@vger.kernel.org>; linux-arm-kernel@lists.inf=
radead.org <linux-arm-kernel@lists.infradead.org>; linux-gpio@vger.kernel.o=
rg <linux-gpio@vger.kernel.org>; soc@lists.linux.dev <soc@lists.linux.dev>=
=0A=
Subject:=A0Re: [PATCH v2 2/6] dt-bindings: arm: axiado: add AX3000 EVK comp=
atible strings=0A=
=A0=0A=
CAUTION: This email originated from outside of the organization. Do not cli=
ck links or open attachments unless you recognize the sender and know the c=
ontent is safe.=0A=
=0A=
=0A=
On 16/06/2025 06:31, Harshit Shah wrote:=0A=
> Add device tree binding schema for Axiado platforms, specifically the=0A=
> AX3000 SoC and its associated evaluation board. This binding will be=0A=
> used for the board-level DTS files that support the AX3000 platforms.=0A=
>=0A=
> Signed-off-by: Harshit Shah <hshah@axiado.com>=0A=
> ---=0A=
>=A0 .../devicetree/bindings/arm/axiado/axiado.yaml=A0=A0=A0=A0 | 23 ++++++=
++++++++++++++++=0A=
=0A=
Just arm/axiado.yaml=0A=
=0A=
Noted. I will update the same in v3.=0A=
=0A=
>=A0 1 file changed, 23 insertions(+)=0A=
>=0A=
> diff --git a/Documentation/devicetree/bindings/arm/axiado/axiado.yaml b/D=
ocumentation/devicetree/bindings/arm/axiado/axiado.yaml=0A=
> new file mode 100644=0A=
> index 0000000000000000000000000000000000000000..f323162b7c3cf973754a3539b=
94a7534111886cf=0A=
> --- /dev/null=0A=
> +++ b/Documentation/devicetree/bindings/arm/axiado/axiado.yaml=0A=
> @@ -0,0 +1,23 @@=0A=
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause=0A=
> +%YAML 1.2=0A=
> +---=0A=
> +$id: http://devicetree.org/schemas/arm/axiado/axiado.yaml#=0A=
> +$schema: http://devicetree.org/meta-schemas/core.yaml#=0A=
> +=0A=
> +title: Axiado Platforms=0A=
> +=0A=
> +maintainers:=0A=
> +=A0 - Harshit Shah <hshah@axiado.com>=0A=
> +=0A=
> +properties:=0A=
> +=A0 $nodename:=0A=
> +=A0=A0=A0 const: '/'=0A=
> +=A0 compatible:=0A=
> +=A0=A0=A0 oneOf:=0A=
> +=A0=A0=A0=A0=A0 - description: AX3000 based boards=0A=
> +=A0=A0=A0=A0=A0=A0=A0 items:=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - enum:=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - axiado,ax3000_evk=A0=A0=A0=A0=
=A0=A0 # Axiado AX3000 Evaluation Board=0A=
=0A=
No underscores in compatibles (just look at any other example).=0A=
=0A=
Noted. I will update the same in v3.=0A=
=0A=
Best regards,=0A=
Krzysztof=

