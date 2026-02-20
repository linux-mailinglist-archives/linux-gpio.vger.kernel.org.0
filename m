Return-Path: <linux-gpio+bounces-31979-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPH3G3SxmGntKwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31979-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 20:09:40 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C58716A444
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 20:09:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F2F163004D00
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 19:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A37536683A;
	Fri, 20 Feb 2026 19:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XxtEn4oY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013063.outbound.protection.outlook.com [52.101.83.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1083176EB;
	Fri, 20 Feb 2026 19:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771614575; cv=fail; b=FZi+m+Odj47jYrrxYaW+CQxSGzIj7SlA89/dIg9S099x6nCPRYipQSRjiTpjvwuICjPcfIdafN9yqPEhzBGNXv5XB9qLt359BqrYGQvavmE/uy6Pmq+UhGsB7tQ4ZKS1f+vp6GBr64SXwc9DpO48MV8v64WQqZwPcsSQizyavXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771614575; c=relaxed/simple;
	bh=11GrTN75ypr7JMm2k6QXyhRWHem/rZQMMQGnS2NBt4U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BSjX8TdolLmHz7TU5j3FSug8QDx9KTJ9p1WgQeu02nCd57X5S4yntjQS51RwAkkm/NItM2Z4HN+8jvH6p452CsLK4kbtwWhxR4sIzqvxNJpJ1qaTUtJxuvpUUPqbz7FAyO7heamdl2jcYpqmPneVP/BY+spS2nVvklv5c6xtBDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XxtEn4oY; arc=fail smtp.client-ip=52.101.83.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PpJ2+gPAYEhREwsB/slTIxvZjx3BUUz5GhQ6/NtQMsDkUqruJwPGYAO9WMeAhoWuj5/Yd0ONqgRyLcN5JkSK9V6VQ+dX1AlDZWJjkgel4wG/O5Wlps6Lcsm0QqOBeV1gzitzejtO5DGsQjZvGtubbuDCTfIMovk9GyGoNivzrTRy5nWxovlYOEASoXJS4WEp0pb3w8AlFP4VzwJsgW5L45CzkzfOHtcfIjUJpxCfyFGVcicE6EQCXNK+FrESfPuBGxDHIYZW+OqjSjIxexyJDGaU+T/NLBZknwPSLKajN3mJoIsWFnOzrFBPO+pGzceWsvgZi24Qben/yxoh+5umcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=11GrTN75ypr7JMm2k6QXyhRWHem/rZQMMQGnS2NBt4U=;
 b=Y389l0OWnEEXBKUwUUIChwIQtEYi76MOhj9i8sACl7MI5j+VN4H1iDnl2Vrnl7UiFlth7+CYA5ytAZdXx7QVnhSYqT7GyIkwhrwfSg0fMdW6IFq2iUuGx/16bw22JLdYBFCmtdlzdWE9ebybf17gSGWypQfFCmqhxlfkEYduIL74nQvfibWQiCBcMdDqHIeCAbwOcw346XaHOr1AmVIwRk4eKBi2xqZ8xptrT1dwwJ506D0MnbuoMVBRfa+jkI2Tjtvvuvr0BF2eQh985cvPW9gWSHY6OiY/JrwN70QLcdlGZX9GMtVfOjKvZTMxBRmOUrALZTbveq7wFCwvMl9r2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11GrTN75ypr7JMm2k6QXyhRWHem/rZQMMQGnS2NBt4U=;
 b=XxtEn4oYbB4BEHTmCBcWSsIyhbJEMOGjpR0NbOvwvSUECN5eLktd/6LujvXKFsihUCfJv68Ab6ttlE2IIS+UklVINwG5I4MK+p9osWuRwJxs0PKgGOGGo4I2TTNKIwmhNiTFnbNBgqSDjoo/pjLtFcYcXFOUPoZXG6q5Tz57/Er4dial06a4XRe0DwQcWvgKx38KahelDVDjNpPprQW0Fkmrep/3udrG/kM8xS6kLS/WvPclEVNlUETzjIUIq5XCTyMkpyCuiVc6n6pP/1Vq6vuz/YHaYvsPxwC43rl4lg2ini6Xn+CtbtQTN8E+nswcoOBVgaWOrGasvZQY5nZuug==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by GVXPR04MB11541.eurprd04.prod.outlook.com (2603:10a6:150:2c3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Fri, 20 Feb
 2026 19:09:24 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 19:09:24 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Linus Walleij
	<linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson
	<andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Frank
 Li <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan
	<skhan@linuxfoundation.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan
	<peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Topic: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Index: AQHcopxsLou6iTsmQ0aBpSbcOFu4DA==
Date: Fri, 20 Feb 2026 19:09:24 +0000
Message-ID:
 <PAXPR04MB918503335D2349BCCFEC93848968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260212213656.662437-1-shenwei.wang@nxp.com>
 <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
 <PAXPR04MB918582EE33F7BD5C26259BB2896BA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <7669d7dd-96a5-48a9-b051-875e9fbdad58@foss.st.com>
 <PAXPR04MB91858E7125B2A4F21DDB78FD8968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <c9d73e40-ab27-4403-9ff6-a3503568fe3d@lunn.ch>
 <PAXPR04MB91851BF97AEF1C5B728865448968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <68c5f96c-124f-4d81-9dda-8e4b6bacbeab@lunn.ch>
In-Reply-To: <68c5f96c-124f-4d81-9dda-8e4b6bacbeab@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|GVXPR04MB11541:EE_
x-ms-office365-filtering-correlation-id: c5a2c1bd-0e80-4214-505b-08de70b38f7b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?STR0RDRFUkFQWUN2WVU4R0VEeVo5M3VRVk5sUURaMWZLWUMxVjZPb2VzN05u?=
 =?utf-8?B?TFpiMjVWU1pNUktPSU5EaFA0eGhRT0MyVDNaUTc2WisvN2dYMjlOWDNMWFpC?=
 =?utf-8?B?TXFWZTZhVTRUTHNySXV5VU9MM3VPTGhXQklRa25vWURCMmh3Tkl5VnVESWJD?=
 =?utf-8?B?RFQzZmJwVjExcUV2UW5nWjJGWElQbk03eFdkbm5LUkRQN3Exc1ZOZVdpRW1U?=
 =?utf-8?B?akZRWTBTdXVNTS9CbTUwZkdlUG14ZDkrTnFHeU13Y3ErZSs3cmlDQlRLbzNW?=
 =?utf-8?B?d0JiTHJaaERXUkxHdkRGQkNVVjZrMXl0d2o1TUtwWDZ5VGpSZlU3NTdOM0FF?=
 =?utf-8?B?YWI3S25pWUhvK3FxTWJpajAycVh1MjcxWWpCdjJDaUhTVCtDekUvSjZCenZw?=
 =?utf-8?B?SXlwVzQ5SEtkQmlHOVQ0RndxUjhsSXBRTWUyV2RQSkFPemlkSEd4eFg3UkZu?=
 =?utf-8?B?dkR3QnVLV2NrSUl5NkFpQ1VHdmlrMklySU45V3g1NWNraFhCRjI5eFlVam04?=
 =?utf-8?B?NytwM0NGaTRwcmhteGZkMk1CU2M5ekYxWUZ3QkhHNzdJRG1pSFZMWG1mQk9J?=
 =?utf-8?B?WFJsQnp5N3FDTTlaYTZGK0lzZWdjSENsWmFNYXV4ZzIweFQwdVNNMTlrRFBZ?=
 =?utf-8?B?YWJKK1F3cHlPUk5FQkdxQ3c5aVpHTExRT2FmQUhhamNsWk4zbnVpT04yaHlF?=
 =?utf-8?B?UDkvRDB2eGZ4Vi9ZcVkxZ1NNL2lMQkhnekM1MWUvQm1TTFFybE1WK3BTblk5?=
 =?utf-8?B?MmNqL2U1VkN2OEd5UEdtRlRCaGR2dVJZa25OQUFBajBlZHBvSW9UeldxN1dH?=
 =?utf-8?B?dFUzL1FvZHZsRkQrOFVmaGtGaTE3bkV4aXlpQWx0ZWg1Yng0c2phWGdLR1FO?=
 =?utf-8?B?LzNQTm5FYmR6cWFKOEdqU3I0TVNMZXZZOG1SMG5UYk1VRGlrYjFJRkV1ZXhq?=
 =?utf-8?B?OXI1Ym55WEtHZzk2ekhhR1lQMXVGWThhOXh3MktUeitCbFBkSXR0U3dVNnZQ?=
 =?utf-8?B?NHVJQ2tKUlU1RURubkFSL2l3ckQzSHFnTWtHVGhNTkdkMm5nK2xUSEpJSHJB?=
 =?utf-8?B?THRLMGZUYUZYejMySzVlNHhTZE9hbkdPYzFna3oxUGxnV3ozUVRWQ0N5UGND?=
 =?utf-8?B?R0l1d2tnZDdneWh6MGxSeENoQUpPOWMzU1huWVZLNlhPbi9mZlJHK1h4b3hw?=
 =?utf-8?B?QVRieFVRTGtFWVJzTkRHNGRNQ0xNdGxqdGR0VlRCa1c2M1BJeTJGS3RKbFVR?=
 =?utf-8?B?Ry8wMHp5OGY3a3FiUDN0TUM3cmtMUUU4c1E3aGtkWk5wL1NvKzFOcUtNT2U2?=
 =?utf-8?B?SWFlczE5ZjZPa3p1Y2pML1pQaW0vWjg0MFRtUXpCYUttTnlFUVR1QndmcjVr?=
 =?utf-8?B?VWg2L0Q1VmxTMjFocitLQk9NZjROdGRaZ25SSHdBaEQzZGZWTHROZEp4MEVz?=
 =?utf-8?B?MDI3a3lLUXBVaS9XQ2FRZnhsYVpQMWJxRTY1N1dzMTl1M1Bnd1lwbmVwY3Br?=
 =?utf-8?B?VE9WQ1d1clIwWDJlbktSK1RBNkx1aHliYXZmNTh6dHJWZjVnQVZoNXl6Ly8v?=
 =?utf-8?B?UEhsOUV1UUVWWmFleGFkRElqMGZrcEJ2UlFxNzI0QW05MjZIcE8yVzBCek5y?=
 =?utf-8?B?V1R0d3pNLzNkY1JRNVJJYTRBVWJMaytTWlNLMXY4ZkovSVcxTFFmTTFLKzhV?=
 =?utf-8?B?RTRZMTJSeFFmRUViZFFyUk0yR0RrSlBqa09hcWgzUXV0QmlHUGJaT0FzTjRq?=
 =?utf-8?B?VUNOWmVaYXBIK3RaVHRKU0UranRPbEp5Rld1LzVKdU9JbEdob1lhNThod2Vt?=
 =?utf-8?B?ZjBpNUJoSVlKR1A5cWxkWU8xKzdaS2o2TlZxeGhBY1pWMXFRT20veGU1RlpN?=
 =?utf-8?B?Ri8vWXEyb1ZWaWVRKzIrcXZSK1ZSazl3VkVYZFphTW9MSWhYdVZUSXI4Y0ZF?=
 =?utf-8?B?TGgxcTc4dlcxVFFpa3dvRFFKaVp3aG1wYkUxcytNTWdKVVE2TjczNFM5NjBH?=
 =?utf-8?B?dENPTUdaTFgzVHVxOHBBbmhpNU1wWU0wUXVidFJUYXFKcDFJekJXYTRBdnFQ?=
 =?utf-8?B?NCtkUUNwZHErVnR4dVVNSUt1TTNYWTR4MU42TnI3aUhpU0RCYWFnZG1OVC9C?=
 =?utf-8?B?Mm1HK2dwMXgvMUZnM2lrRlBkcGVZOEwxTEhpSFZ4YjNMNkRLaUdGS21mQlpY?=
 =?utf-8?Q?zMCq3tE996PgnQVXXA4roq0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RU16RXNNNFhHREFBcFY3ZzZRcXlLTVJweFFpdy9TN2piUE04YVM2OE5LYWNU?=
 =?utf-8?B?a0NXUEtna2JJeCttMjg2OE1QKzZPdkNZU1lhYS82MEhzRUc5TEZIRndWZC9P?=
 =?utf-8?B?WFZxcTB2ZkRSR2RzckhnbTJOMklhbTJSSThManJ4eXU1cDFITmQ3Q3JnM1FR?=
 =?utf-8?B?OHRuNlViQjJpUGI5VmhYejFESWxuQzRGMGJnZzc3NkQzWDliMHZDMTlPb09s?=
 =?utf-8?B?SS9iaGtScXIvYjdyZTJoaDA2Ukxlem9NRXBJeXVnTEcwM3J4STB0ZzNjMFNu?=
 =?utf-8?B?OWRXcFMzYURNZjlxQlFyMVVlYkFXRmxMUm01SDFkSmkwQXE3U28zNnhrc0Jt?=
 =?utf-8?B?NVp1c0dFb3pyeUdPaXRLTTgzb2hYSU4wNGk1eEt6REJYNytOWGcrYW9qQ056?=
 =?utf-8?B?cFIwYk8yOFBIbHNhZHViY3pSNEx0bU9CR3B0TWpZUmQ3Z1hjUEZrMGVRR0pr?=
 =?utf-8?B?ZE54WWg4bEJpS3hWc0xGS1JkTERYNk9OaGdTL0w2S3ZUd2V6ZUlMNG81SGRL?=
 =?utf-8?B?SjE1cmlGRWdMOFl3dTkybXFhUWRDWkk4YmlzVkZaRk5Za0dGU093VWVDcEFJ?=
 =?utf-8?B?bGZzNHc5ZDdMbWZrWlV0NFI0eFBxQkZ2TmRqaE9XSWtsZ3l1Y0xlMEFkbkY0?=
 =?utf-8?B?dmEreCtHb1hvbUxrNms0TGoybmRDZ0s4TnVjSW5nMHE1L2RROVdjK1dmK2Jm?=
 =?utf-8?B?b3hUcXhMMldTSFN6ckhkNnUxUHVDSUovMDFoUll0S1NJdmszY2J4YzMvMisw?=
 =?utf-8?B?ZkdJNEJBeVpXUmw4WTJKQ0UzRHEyMHMzeWprNUJYZzdsWmxybGx1NkZlRTdP?=
 =?utf-8?B?TGRoUjkvWkZMcnZMMXoyVmpoRmMwRUcwL05GNnUvUFo5cm1iQnJyQ05WOHZG?=
 =?utf-8?B?aHhiMWtjVThtQVNzUjF4aFVXVkIrMVVHWS9NUmtOaStIZDRTaHZMRkZ6bDJ4?=
 =?utf-8?B?WDFYSG9JcWxud3FoeHRVaElDdjZvb3BqV0xzMC9Wa2w5ZlVpNlFvMHVvcmpl?=
 =?utf-8?B?M2dvR05Id2p3Z0lzVXljcXRTeEhVdEFRVDdtWmlpMjc1YUhKc0VEbmU2VVBr?=
 =?utf-8?B?VHpvZnJHMFpsSVZEWm1GR3ErUlBsQThTbTdCK0hiMFEyamFqTnZPNkY1SWhE?=
 =?utf-8?B?Z2VYbUFHOS82TGFyUVQ0dFVuc0hKZXYvMGFId1dOa3VrdmM2Y290ZkwvUjVP?=
 =?utf-8?B?eVZ4RGlCZmJCZ09wK0pXZmExRVBMTW5oU0Z4NWh1UFN4MXlnN1Z3cUtjcmF5?=
 =?utf-8?B?MlhmWExCZW9IUkdnblpoU1V1LzVyZnBSWHVycnNLYW85WWpkdnZHNmxNbTY3?=
 =?utf-8?B?ZzJYYXprV3FibXdML25PNGR0bDVEaFZhajMxSWlOd2k2SS8xRlF6ekZ0YmpG?=
 =?utf-8?B?cERzUW1LREJIbFRXK0lTN3BMUEdSdkF0OC9GNTdmb2ZGaU14TVQ5WmRlcGF4?=
 =?utf-8?B?ZWZEVGpjZEttRDhvK2w2aWNucWRNL3IrTUUxZ2ZoMlBBMWpXZ3FCMVV5MzZC?=
 =?utf-8?B?eG10QUtUd1hVbHRaUWNhZ1dpQ3F6OGlJSVB5QXZsSWdENUh4U0Z6dldiZ3R0?=
 =?utf-8?B?anhTeFFLTk8rYXlnZ2NaNGZPTU1PS0QrdllxeVBoSll0TEJKMk10NldqRllH?=
 =?utf-8?B?eHMwVmtBQ3ErVVF1UURMZUR5L1V4dktEYW9WbmVTT0dNdmFxWjhDTHJobW1I?=
 =?utf-8?B?MkcrTFhFOXlFUzRTMnhtRjdZUk1qTFlHaEtCOFVhM1MxK002N1QwaE9WQXZM?=
 =?utf-8?B?eEJMNGhSNy9EaWtvejZLc1MxRGtiOWlLWFRRbWFmbWwrVURMN0t1blJJMFhF?=
 =?utf-8?B?VGxmZ2ZEazV2ZW1lSkFTU2pSclU3SHJ0TTlQd0JmWXlUeEtMVC8zR3dmN3pS?=
 =?utf-8?B?WGxmQjdRUzZLdE1Udkt1ZysyOHhUNUowY09HN093K3ZuWWpGSzlEMjU5M2NZ?=
 =?utf-8?B?VUVNTUhsK0YvekVXZW94ZUF3bnhyaENKYlpPS0wvSnJwckZTNmFmakU3WW1S?=
 =?utf-8?B?cFozRG9RU1JvNlUxd2lUb1RXRnNXWUVBaTJ1UmpDY0QrZy9LbTJNdHFIYVcx?=
 =?utf-8?B?aG9FNmdRTTBvVXdOQmlFemN4emwxcmhaakVxZE1ZeCtlajNuZXBMYXF0Y3ha?=
 =?utf-8?B?U00wOVk4STFXWnd2TVZVR3puWHd2TTRXR1htTStRbmFsQzlXY1pCVENoM1NY?=
 =?utf-8?B?Qkw0cEdSd0lieThQVEZ6ZGl2NDBPcW4vNVYvcmRjSkhDRU4wVGFnSk56bDRQ?=
 =?utf-8?B?dGFoSnFFK001ZzhmSUFleFBEa2M2bS9OL1kxS2hyMk42dGpEMmF3MHpYT0Vk?=
 =?utf-8?Q?hebP/ghzj+v6eZI2IN?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5a2c1bd-0e80-4214-505b-08de70b38f7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2026 19:09:24.1607
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9nGtRKnhC6yzf6Tjpm+/9KCxs3hkhb++//2pU8zXSaASBckB/NE7JensVni1yVKGi2yrjApi15FJd2LWReIMWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11541
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31979-lists,linux-gpio=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[foss.st.com,kernel.org,lwn.net,linaro.org,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.997];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8C58716A444
X-Rspamd-Action: no action

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmV3IEx1bm4gPGFu
ZHJld0BsdW5uLmNoPg0KPiBTZW50OiBGcmlkYXksIEZlYnJ1YXJ5IDIwLCAyMDI2IDExOjQyIEFN
DQo+IFRvOiBTaGVud2VpIFdhbmcgPHNoZW53ZWkud2FuZ0BueHAuY29tPg0KPiBDYzogQXJuYXVk
IFBPVUxJUVVFTiA8YXJuYXVkLnBvdWxpcXVlbkBmb3NzLnN0LmNvbT47IExpbnVzIFdhbGxlaWoN
Cj4gPGxpbnVzd0BrZXJuZWwub3JnPjsgQmFydG9zeiBHb2xhc3pld3NraSA8YnJnbEBrZXJuZWwu
b3JnPjsgSm9uYXRoYW4gQ29yYmV0DQo+IDxjb3JiZXRAbHduLm5ldD47IFJvYiBIZXJyaW5nIDxy
b2JoQGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpDQo+IDxrcnprK2R0QGtlcm5lbC5v
cmc+OyBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBCam9ybiBBbmRlcnNzb24N
Cj4gPGFuZGVyc3NvbkBrZXJuZWwub3JnPjsgTWF0aGlldSBQb2lyaWVyIDxtYXRoaWV1LnBvaXJp
ZXJAbGluYXJvLm9yZz47IEZyYW5rIExpDQo+IDxmcmFuay5saUBueHAuY29tPjsgU2FzY2hhIEhh
dWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPjsgU2h1YWggS2hhbg0KPiA8c2toYW5AbGludXhm
b3VuZGF0aW9uLm9yZz47IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4gZG9j
QHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgUGVuZ3V0cm9u
aXggS2VybmVsIFRlYW0NCj4gPGtlcm5lbEBwZW5ndXRyb25peC5kZT47IEZhYmlvIEVzdGV2YW0g
PGZlc3RldmFtQGdtYWlsLmNvbT47IFBlbmcgRmFuDQo+IDxwZW5nLmZhbkBueHAuY29tPjsgZGV2
aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiByZW1vdGVwcm9jQHZnZXIua2VybmVs
Lm9yZzsgaW14QGxpc3RzLmxpbnV4LmRldjsgbGludXgtYXJtLQ0KPiBrZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZzsgZGwtbGludXgtaW14IDxsaW51eC1pbXhAbnhwLmNvbT47IEJhcnRvc3oNCj4g
R29sYXN6ZXdza2kgPGJyZ2xAYmdkZXYucGw+DQo+IFN1YmplY3Q6IFtFWFRdIFJlOiBbUEFUQ0gg
djggMy80XSBncGlvOiBycG1zZzogYWRkIGdlbmVyaWMgcnBtc2cgR1BJTyBkcml2ZXINCj4gPiA+
ID4gc3RydWN0IG1zZ19oZHIgew0KPiA+ID4gPiAgICAgdTggIGlkOw0KPiA+ID4gPiAgICAgdTMy
IHNpemU7DQo+ID4gPiA+ICAgICB1OCAgZmxhZ3M7DQo+ID4gPiA+IH07DQo+ID4gPg0KPiA+ID4g
VGhhdCBpcyBqdXN0IGEgYmFkIGRlc2lnbi4gVGhlIHBvaW50IG9mIG5vdCBhbGxvd2luZyBfX3Bh
Y2tlZCBpcw0KPiA+ID4gdGhhdCBpdCBmb3JjZXMgeW91IHRvIGRlc2lnbiB5b3VyIHN0cnVjdHVy
ZXMgY29ycmVjdGx5LiBNYXliZSBBSSBoYXMNCj4gPiA+IG5vIGlkZWEgb2YgdGFzdGUsIGJ1dCBN
YWludGFpbmVyIGRvIGFuZCB3b3VsZCBub3QgYWxsb3cgYSB1MzIgdG8gYmUgdW5hbGlnbmVkDQo+
IGxpa2UgdGhpcy4NCj4gPiA+DQo+ID4NCj4gPiBMZXTigJlzIGtlZXAgdGhlIGRpc2N1c3Npb24g
dGVjaG5pY2FsIGluc3RlYWQgb2YgdGFzdGUuIPCfmIoNCj4gPg0KPiA+IE15IHBvaW50IHdpdGgg
dGhlIGVhcmxpZXIgZXhhbXBsZSB3YXMgc2ltcGx5IHRvIGlsbHVzdHJhdGUgaG93IGxheW91dA0K
PiA+IGRpZmZlcmVuY2VzIGNhbiBoYXBwZW4gYWNyb3NzIGFyY2hpdGVjdHVyZXMgb3IgY29tcGls
ZXJzLiBJ4oCZbSBtb3JlDQo+ID4gaW50ZXJlc3RlZCBpbiB1bmRlcnN0YW5kaW5nIGhvdyB5b3Ug
d291bGQgcHJlZmVyIHRoaXMgc3BlY2lmaWMNCj4gPiBzdHJ1Y3R1cmUgdG8gYmUgZGVmaW5lZCBz
byB0aGF0IGl0IGF2b2lkcyB1bmFsaWduZWQgZmllbGRzIHdoaWxlIHN0aWxsIG1haW50YWluaW5n
IGENCj4gc3RhYmxlIG9u4oCRd2lyZSBmb3JtYXQuDQo+IA0KPiBzdHJ1Y3QgbXNnX2hkciB7DQo+
ICAgICB1MzIgc2l6ZTsNCj4gICAgIHU4ICBpZDsNCj4gICAgIHU4ICBmbGFnczsNCj4gfTsNCj4g
DQo+IFRoZSBjb21waWxlciB3aWxsIGxheSB0aGlzIG91dCBhcyB5b3UgZXhwZWN0LCBpdCB3b24n
dCBhZGQgYW55IHBhZGRpbmcgYmV0d2Vlbg0KPiB0aGUgZmllbGRzLg0KPiANCg0KWWVzLCBtb3N0
IGNvbXBpbGVycyB3aWxsIGxheSB0aGlzIG91dCB3aXRob3V0IGluc2VydGluZyBwYWRkaW5nIGJl
dHdlZW4gdGhlIGZpZWxkcy4gDQpIb3dldmVyLCBmb3IgYSBjb21tdW5pY2F0aW9uIHBhY2tldCwg
d2UgY2Fubm90IGZyZWVseSByZW9yZGVyIG9yIHR3ZWFrIG1lbWJlcnMgDQpqdXN0IHRvIHNhdGlz
ZnkgYWxpZ25tZW50IHJ1bGVz4oCUdGhlIGZpZWxkIG9yZGVyIGl0c2VsZiBiZWNvbWVzIHBhcnQg
b2YgdGhlIHByb3RvY29sIGRlZmluaXRpb24uDQoNCkV2ZW4gd2l0aGluIG5ldGRldiwgd2hlcmUg
eW914oCZcmUgdmVyeSBmYW1pbGlhciwgdGhlIGNsYXNzaWMgZXRoaGRyIHN0aWxsIGNhcnJpZXMg
dGhlIHBhY2tlZCBhbm5vdGF0aW9uIA0KZGVzcGl0ZSBiZWluZyBuYXR1cmFsbHkgYWxpZ25lZDoN
Cg0Kc3RydWN0IGV0aGhkciB7DQoJdW5zaWduZWQgY2hhcgloX2Rlc3RbRVRIX0FMRU5dOwkvKiBk
ZXN0aW5hdGlvbiBldGggYWRkcgkqLw0KCXVuc2lnbmVkIGNoYXIJaF9zb3VyY2VbRVRIX0FMRU5d
OwkvKiBzb3VyY2UgZXRoZXIgYWRkcgkqLw0KCV9fYmUxNgkJaF9wcm90bzsJCS8qIHBhY2tldCB0
eXBlIElEIGZpZWxkCSovDQp9IF9fYXR0cmlidXRlX18oKHBhY2tlZCkpOw0KDQpUaGFua3MsDQpT
aGVud2VpDQoNCj4gWW91IG5lZWQgdG8gYmUgY2FyZWZ1bCB3aXRoIHNpemVvZihzdHJ1Y3QgbXNn
X2hkcikuIE9uIDggYW5kIDE2IGJpdCBtYWNoaW5lcywgaXQgaXMNCj4gcHJvYmFibHkgNi4gT24g
MzIsIG9yIDY0IGJpdCBtYWNoaW5lIGl0IGlzIHByb2JhYmx5IDguDQo+IA0KPiBJIHdvdWxkIHNh
eSBoYXZpbmcgYSA2IGJ5dGUgbWVzc2FnZSBpcyBwcm9iYWJseSBhIGJhZCBkZXNpZ24sIGFuZCB5
b3Ugc2hvdWxkIHRyeQ0KPiB0byBtYWtlIHRoZSB1MzIgYSB1MTYgaWYgeW91IGNhbi4gQWdhaW4s
IG5vdCB1c2luZyB0aGUgX19wYWNrZWQgaXMgbWFraW5nIHlvdQ0KPiB0aGluayBhYm91dCB0aGUg
ZGVzaWduLCBhbmQgcHJvYmFibHkgbWFrZXMgdGhlIGRlc2lnbiBiZXR0ZXIgYXMgYSByZXN1bHQu
DQo+IA0KPiAgICAgQW5kcmV3DQoNCg==

