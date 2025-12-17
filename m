Return-Path: <linux-gpio+bounces-29721-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5759CC9881
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 21:56:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD6603034EC0
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 20:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FE5430B518;
	Wed, 17 Dec 2025 20:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eFAWShri"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011015.outbound.protection.outlook.com [52.101.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897D926C385;
	Wed, 17 Dec 2025 20:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766004966; cv=fail; b=ASwHC6HiSTLBS1LFUtcBPY4kTFbqQBxiTb1SmlZhYkLNN6FHcRDZrY/aMiHYugBNN1g11FrHzoUJguS/kmLPoxN1TkLPZz4gtaN5jidygBQzZCb69auLB6GwQtT1+qhJf/iiq0xm4fmrvdOE9vfltds+h8tX4j/0c59sr1Ju/ig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766004966; c=relaxed/simple;
	bh=aZUtHP8KQc74V1Yj5hdNOFN3devmsICHrxFym4h6LJE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ls3pwXhH7pOIlwAijDsfPQ3tmRAjanXCfiV1yxMxR+P83n2lRlKU9DdSaWuyk5t2hwHb3c0xNToIDjR859xEGk6EopIHjit0jkbLX9/Pvfkj4Jd1IIWlnRN17aOZqXOhL1hU4NpAabGmQyFtI/HQ/FDyXJ+01fNLMf9d4oseB18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eFAWShri; arc=fail smtp.client-ip=52.101.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from VE1PR04MB7344.eurprd04.prod.outlook.com (2603:10a6:800:1a1::10)
 by AMDPR04MB11608.eurprd04.prod.outlook.com (2603:10a6:20b:717::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 20:22:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aJYbeeu841DC8frGe+YvhdJ0xAnOMfsPYaGWyX6R0FuKbmnZbyKQbtOIIsAUPp4b1OLmKJFZgie5tDpFNqllBVor+JY5NY6i1P99UlSZ5szhwrI0aPJyF2xVS6JPYZ1W2JE9g7fEi5MkmM09c2ix4flLR6PORLbXUZGMfirMxTGwpj++wKoYnwR3NUziYxfGyJyUWPPcAOxedyUu0db5u5OrH90B0Kqw1vyzlAUfhokLlDJNieDWbWXJmD0h1QkCxODWOomjKj+U4PNaQFs2v5WJIupeNl6J12K4yoSBpEEIXxnjtD1LULF9R1aJGtdCoaGq3Oh1Gfe9tqaLUXPueA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sfACWLHp3df4sJIZvQAd9/UNu9AkArwbM4B04f0+SxI=;
 b=sF720XE4f/L7CYStIlCszjjhVyskaqdoDMkyy1DhcSipnWroUK1mY0xjnDR0PVXvZ2kx3vTBtuVkFMvyejMDbiuN64QQqtOsXi3CtCSzUrcD7JJH4OOfyww1hEZXOP0+gfP7OOXT1+SdBSuYx/WME1ETmx8QndGdmYZOIvP3BIJ2GDfdesU/9jdBrWkK3ZLdj81sV3cHmsD/xPY5Df4enP2FWSkIU04tsENNbNm22Uf6tnKVTTo0AkQYx1+s5w19Ao5anGt8dAqyZlXWpqnayS/2h8DxQLeAKk133IJQ9U+Wz8bQxFEpBEAp/EuxcB8vtSR+2aVMr5crtj4Uyj1flQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfACWLHp3df4sJIZvQAd9/UNu9AkArwbM4B04f0+SxI=;
 b=eFAWShriqgmMYLa20gAHZ4i60xMVLN3iWgiFaxANBceDL912XE6p+2N4OiQrQ3l7YAhHMR9VGM9Wgvn2HYmzJT52vmIJqWS2+ChIoQC4cjJJS2dY3k+0SPQ04tKsKWAegSQHX6W1Vg9JKvUbuixSa8GyXjjJV1NubkobpPMGfPJvJ8HcSnmXh0bBr3YHKXDsyAYzH+ud8iAvPWhZJLoQVVHI+/U/tpjrclyZoDk380N0jMqSFmaFqpgtlAwRTxPwCrcY1EfAQs16QJJKIq+bqwPBe8xyqHi78Ragv+yh3ef8DuPAUMCsySC1jJgavmbV615hRaSj+NkeyzSyrAnW+A==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by VE1PR04MB7344.eurprd04.prod.outlook.com (2603:10a6:800:1a1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 17 Dec
 2025 19:45:11 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%5]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 19:45:10 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Rob Herring <robh@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng
 Fan <peng.fan@nxp.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v6 1/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Thread-Topic: [PATCH v6 1/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Thread-Index: AQHcb42nD0vV/FZ/cEahrrMlv9mXGw==
Date: Wed, 17 Dec 2025 19:45:10 +0000
Message-ID:
 <PAXPR04MB9185E86CB81C111DAB5B329D89ABA@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20251212194341.966387-1-shenwei.wang@nxp.com>
 <20251212194341.966387-2-shenwei.wang@nxp.com>
 <20251217005758.GA3452672-robh@kernel.org>
In-Reply-To: <20251217005758.GA3452672-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic:
	PAXPR04MB9185:EE_|VE1PR04MB7344:EE_|AMDPR04MB11608:EE_
x-ms-office365-filtering-correlation-id: c10af08c-1e1d-44a1-90b7-08de3da4ca1e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|376014|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ASk2nHi1s63vFuGMc7ka9p+JaT+euGcfSH7YKkL3p44ALDawwX4+2quemlQd?=
 =?us-ascii?Q?QApxCDWVr8r8bhgEO5jTkdNCBTGIp+/Rh2a4SsM6ojXmpnvPy7ylCGGU3cL2?=
 =?us-ascii?Q?Y+GUYzZJT/FIElBtJKxbo4v2qGnvkFZgDBW1TTcdQLXqLhrn3qSyNhqep2kO?=
 =?us-ascii?Q?fspNxmPh8KzC6YxdW5KRfsEKvNMMoDMrUE8BWmaa5+w9r/Oih7NcwJW+id5n?=
 =?us-ascii?Q?r4botM7SuzmLwz9rBZ8k158jVjYvJD26ow+ysGz+hFr4M8D2WwFW/NsFdRUE?=
 =?us-ascii?Q?ATMFXOWMhNHKHfh5jW7LgWbXTebvgPBO73nWC6bQs/505IVje7kaN3BrwVg/?=
 =?us-ascii?Q?r9HsmZ163tT2/aJyt4FjcmCXTyQoagFtbz218M0rr7aBoMgjN44V5dXQ8ewT?=
 =?us-ascii?Q?jnW+nNZ0Ze5iSIJl5Tl3k0d9o2jPP3viEBjHo+EF0itoQHLdRUINswAFXfB/?=
 =?us-ascii?Q?oP8AtnKbdfvEpyLEnEQEQD9f1Zrb4TKOt5YGEDs7BLV8hw++45Z/Y64eT44M?=
 =?us-ascii?Q?eVMoEmcl5Pg8YQ6LIO2QoM/VNBqAeDrU2EaX0vD+4N3H9sIlnk1e+2LPmRH1?=
 =?us-ascii?Q?VTVTux3eEhfdoa6EkCw09OhpigRtib76Je2QZopa+2UgDHY/VOuMgacWR0Kz?=
 =?us-ascii?Q?6dpuQ98CWie04TorJ3ncuQ5iebMQS8/Nc+ZY/VknkfGNxSwRzlvzP131sm+Y?=
 =?us-ascii?Q?x9+U7WGlB+6C1spteYd/BY9e7BXLbmI9d8kIERIpy0aE8CZ5/SLxN74NN7R9?=
 =?us-ascii?Q?I4wXgmDwRkyWoocnmL4byccN6IYJTJpmAu3bEwQBeiy68tGUrMMXRUVKWPhz?=
 =?us-ascii?Q?+EalXGhy/UFbizQjrkNn7dN69n4uKDtSlQC8kihNpBizF9EHflcWVyFsikfy?=
 =?us-ascii?Q?Q7CrA3BJnHiNirzRs+Q/94cIzCulDFvtwTAaSzWNv5yU1K2Y7HcM9+iq2k3o?=
 =?us-ascii?Q?pGg4Sxgl5tNTcGDo5Xw1QA3Am8ECfWTCPLJ6fnz3aLgQG5sQ3MxxWsYjq1vz?=
 =?us-ascii?Q?Q9Bkl+Mrx/5a1+0TkQGuvUyT29muZ7CLlzBMzrEWKGwZkhLhmu8yQGAVNMQN?=
 =?us-ascii?Q?pM/2ucknebT2VlhNSeJ7VRAatqzLGN2pJ9b8MhC8V2gEqmDxIKfYAoAxlC6b?=
 =?us-ascii?Q?2+T/eZofWRNzN6Uxmi+jJIaq9+U4+x6GERBHDYTYTf3iSeW+j3MBwkKlNhJa?=
 =?us-ascii?Q?Q4AKc/UVlpyW58mXXIa/TX3f7i7UJYE9BoXo2CaPXDLuJ/fiTv6STe/vi689?=
 =?us-ascii?Q?GpjvozFKP0XLYKyOVinE1vpbr9zohkp0in7l+nkzy8foOgKuv6Xm1/oj8ikT?=
 =?us-ascii?Q?zDHN4v9+xb7jkH2CfJJVkyJNbiw6jKHiz+omuoB4MGmCMV1UxdKeOx2C9yEz?=
 =?us-ascii?Q?ZnIKHeonTPL5p3xC418HvQXsbE48gNrNYPTyh+0Y2Y3t94I4iG2IL12jEDiM?=
 =?us-ascii?Q?n/5EJm2qNSnpbwt+uSwddqOhGZkjtyOq0tr7Q8a3Lqm30nnSKQm4UKJObbR8?=
 =?us-ascii?Q?gaI1eKSXKC+ud1vdt3dXWOk01rybZmSLDlo6?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?rrLsLs+Qi1OCwP7DhBAWjKnBJMXbbSvytitYsGzC8PjymB5qZ50J2NfDhSec?=
 =?us-ascii?Q?wZb4HsGu4rmqbdFL1j4k8zKdBA+gvefUDM7VltgLlJgCeiatOvVdo8F9E1UK?=
 =?us-ascii?Q?HBuJUzuzNsjyzj2ucXcHd9O+XesUE6Hlz8eTjKFAfhL+A9q0Wt7qK+lPAZSO?=
 =?us-ascii?Q?nr5GDHkSn6o9p/OSK77D6LTEKp8f6sSsgIar1f0VghalqmBoyViMxvUO+wNJ?=
 =?us-ascii?Q?hQ6Ok9lLWmak9Yn+nmruvbEhkP7p3Cmuc8/s8XHIQTjtzeassP+2q7mtNUVF?=
 =?us-ascii?Q?gejNsLA89Qy6nztzRzEnQ9pVC9YhYXx99p94vS19Yx80YisVMimEuctSSPnA?=
 =?us-ascii?Q?1An56UTNkk0zZ53tGr6A6dQ3x2O1UPeCXpfvzz6avA0Ha9XHuMgWQ3Jr+KDT?=
 =?us-ascii?Q?DgUpqyaVnu6VBuhR6o95kiNNMelPtuoATcif1rHxb0tuS6R3YT73oas3bJaW?=
 =?us-ascii?Q?TFyvsTTCV7zOUyGNHwkswbGmnZD9kDTXZL+DsezCIV5E/OXLvr41pUIXOucj?=
 =?us-ascii?Q?52wvl3D0CU7vCtto2cIe3fsxqmr3lF9iVz+1Zxya9QCDPLjybeHUdKUG/BAY?=
 =?us-ascii?Q?oPflazdwq4O8fcM03vn0qaen2hq3Zy5szMFpgmpdGqb7j2cULyWe1HqxXeNl?=
 =?us-ascii?Q?o2g4gwxhWAKbK8FSwDmjcxwTtLwu4DaJQ/3AsWZ4Br+gMKReW0qwEBVpvQ3J?=
 =?us-ascii?Q?Cvzu2XCS6+yx+TX0igWkmIE/cWuRhAIewFlO3ANR7i3VLb0CASg3kOSWm5Ip?=
 =?us-ascii?Q?X5155fkl3HIGrOfDiRvd2l002xWdq2uMUJOqqDPlgcA5L0O2kfNHlGDAarC6?=
 =?us-ascii?Q?mclW0/2HDp8Ra771FIuzx7D4QGsqTbC0ho6nzROyoJ0aQobWly06HT1qr65C?=
 =?us-ascii?Q?YWNgRCRRIeSOb2Eaj56rDKJLPoFTDSRr3sV19Ta67Fr66Lg4NFj9BUtF0ECE?=
 =?us-ascii?Q?4/zf6xEQETb4P+Eu4sqG/jNpr9lHu4su5COJjfTLEszSThZ0fwqM0Z6UZ+AQ?=
 =?us-ascii?Q?RLiG6gQWLiKIZav3yGTp/hNVK3UTo4uvPWQzgFpnaOgaAkRcWpU6bbVth7Yg?=
 =?us-ascii?Q?u2t9LIHQZuLl1aWjgehHrdvsN55OCrVY76qlVJMy9c7laPJ14CG0azLP4Ytq?=
 =?us-ascii?Q?BpBTG19zXdTCEIsKgJ1eFDyGHLp8weAyzza33Js0PrS1HcfTN9HEpWYAjuBf?=
 =?us-ascii?Q?OnrSSWxzstFF68H/5hYkC0rXNNLVZSf3u2mcxiUqUvjlYfXoAEfdo8rFljeL?=
 =?us-ascii?Q?aeKrCePvO1ED5Wop6wewUDalGWTa60KZ9G4jLHEXfNnt1dYcjPWc7thL1XU0?=
 =?us-ascii?Q?7VdHwcM7WPBnCWAkjAYsDTy8tf9rhppcaPldn5r22oAIyKj8KAsFMufH6EFE?=
 =?us-ascii?Q?JqNqJk/qfSQhGMCcRwkbeA5/LgNce7bGEM7GPUMQ5TKz2Q6AEoE+fCiAo7Sd?=
 =?us-ascii?Q?AompyvA33FgA/OUt1iAvpxc3EUc6aAiFQQPBPNgVpTenGmbiON0JuQYiKAVw?=
 =?us-ascii?Q?01umVFQUw3jozLh/+t9sVwNslYcA5xlA52EbfVQ0AQC0Suin50gT6OOMyx7c?=
 =?us-ascii?Q?6Xq8RBt71d8SzJdQtgA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c10af08c-1e1d-44a1-90b7-08de3da4ca1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2025 19:45:10.7995
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: keBMDMAVJ6m9P82fUO9jGGdoUMiih5PhnT59MTvQoq4EVDfTBseiir7F9WNTg8ickAbww24+Nf+7/mIudjTtgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7344
X-OriginatorOrg: nxp.com



> -----Original Message-----
> Subject: [EXT] Re: [PATCH v6 1/5] dt-bindings: remoteproc: imx_rproc: Add
> "rpmsg" subnode support
> On Fri, Dec 12, 2025 at 01:43:37PM -0600, Shenwei Wang wrote:
> > Remote processors may announce multiple devices (e.g., I2C, GPIO) over
> > an RPMSG channel.
>=20
> Which channel does that happen on?

It runs on the RPMSG  Control channel.

>=20
> > These devices may require corresponding device tree nodes, especially
> > when acting as providers, to supply phandles for their consumers.
> >
> > Define an RPMSG node to work as a container for a group of RPMSG
> > channels under the imx_rproc node.
> >
> > Each subnode within "rpmsg" represents an individual RPMSG channel.
> > The name of each subnode corresponds to the channel name as defined by
> > the remote processor.
> >
> > All remote devices associated with a given channel are defined as
> > child nodes under the corresponding channel node.
> >
> > Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> > ---
> >  .../devicetree/bindings/gpio/gpio-rpmsg.yaml  | 49 +++++++++++++++++
> >  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 54 +++++++++++++++++++
> >  2 files changed, 103 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
> > b/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
> > new file mode 100644
> > index 000000000000..b3e1a5dbf731
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
> > @@ -0,0 +1,49 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +
> > +title: Generic GPIO driver over RPMSG
>=20
> The driver doesn't go over RPMSG. It's a GPIO provider or protocol.
>=20

Yes, it might be clearer to phrase it as 'Generic RPMSG GPIO Controller,' s=
ince this is=20
a GPIO controller driver that operates over the RPMsg bus.

> > +
> > +maintainers:
> > +  - Shenwei Wang <shenwei.wang@nxp.com>
> > +
> > +description:
> > +  On an AMP platform, some GPIO controllers are exposed by the remote
> > +processor
> > +  through the RPMSG bus. The RPMSG GPIO transport protocol defines
> > +the packet
> > +  structure and communication flow between Linux and the remote
> > +firmware. Those
> > +  controllers are managed via this transport protocol.
>=20
> Got a reference to where any of this is defined?

Will add a ref to the gpio-rpmsg.rst doc.

>=20
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - fsl,rpmsg-gpio
> > +          - const: rpmsg-gpio
> > +      - const: rpmsg-gpio
> > +
> > +  reg:
> > +    maxItems: 1
>=20
> I still don't understand how 'reg' is determined. You may have explained =
it
> previously, but *this* patch needs to make me understand.
>=20

I see. Will add a description for this item.

> > +
> > +  "#gpio-cells":
> > +    const: 2
> > +
> > +  gpio-controller: true
> >        memory-region =3D <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>=
,
> <&rsc_table>;
> >        syscon =3D <&src>;
> > +
> > +      rpmsg {
>=20
> What's the purpose of this node? Is it going to contain things other than=
 "rpmsg io
> channels"?

It represents the RPMSG bus between Linux and the remote processor, and wil=
l eventually=20
host additional channels such as rpmsg-i2c-channel and rpmsg-pwm-channel.

Thanks,
Shenwei

>=20
> > +        rpmsg-io-channel {
> > +          #address-cells =3D <1>;
> > +          #size-cells =3D <0>;
> > +
> > +          gpio@0 {
> > +            compatible =3D "rpmsg-gpio";
> > +            reg =3D <0>;
> > +            gpio-controller;
> > +            #gpio-cells =3D <2>;
> > +            #interrupt-cells =3D <2>;
> > +            interrupt-controller;
> > +            interrupt-parent =3D <&rpmsg_gpioa>;
> > +          };
> > +
> > +          gpio@1 {
> > +            compatible =3D "rpmsg-gpio";
> > +            reg =3D <1>;
> > +            gpio-controller;
> > +            #gpio-cells =3D <2>;
> > +            #interrupt-cells =3D <2>;
> > +            interrupt-controller;
> > +            interrupt-parent =3D <&rpmsg_gpiob>;
> > +          };
> > +        };
> > +      };
> >      };
> >  ...
> > --
> > 2.43.0
> >

