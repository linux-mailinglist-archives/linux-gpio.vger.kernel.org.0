Return-Path: <linux-gpio+bounces-30883-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJj1LeKXcWngJgAAu9opvQ
	(envelope-from <linux-gpio+bounces-30883-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 04:22:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2737E61471
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 04:22:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7EB35503AE5
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 03:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30EFC3191D6;
	Thu, 22 Jan 2026 03:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OHic14Ax"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011019.outbound.protection.outlook.com [40.107.130.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C9930E0F9
	for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 03:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769052100; cv=fail; b=fYGeSei9HGigc+I/NXoYGDdctk/tIozjQt/ucfZCem9d+4rWgZMS5k61mgy2KEIQSdN+AEnxwEqxzf1RPxx8NbDt0SSbHJHvZRNiasm5hMBEtKWPg33dPNkCPXI6BMFqtY26tDhupf5k2xG7KZQSH753iICCglmaeJYW/Yjjqqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769052100; c=relaxed/simple;
	bh=qZ+0lhyGc25b9q1bz02E5KTaJwTcYNLXBj/fyIW6rkg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PKrQOQ5UjB7Xy1YreTI2cIVBXESxkUkn6argZSVRlkCy2AUDq+1hAzm2i9g1jBNvbcIerVQw5KF6sXVbKSm5VnOuC2quHuxMv56Yio1b6fkYtMpfhYnv53rJW0aKDGPWvFt+oTYJgh8aM39zWuyhp8Wm2fl3CJcHW9K71+/CFWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OHic14Ax; arc=fail smtp.client-ip=40.107.130.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OuKQy8zKJizz9BkovI8crx39mWGBcpJ7QvjdN9dwt/eWvk7ClvH4SHvtg0pzxtgASjbKbOJOGsEFrTGma+aqVcWuAXzqvuGBmuiMBhxlfkmuqyDycnjgcq25emZmIzRub9gK6zLKdWVi4+BHQKdA1fiEQn+eNXL0Ijh6LxTynE7m/CO1fFQT9Qo4G1dwsnOhDq4ED1OS2lnmZdEQHKIcw5mZM2WMoGWhh4KC4FBsrLac5ccni2w9dRZCPqGBydHTqW6EyxjcTzr70ERO1U5bGqBvrqmcPgXAxCimOabO4zuKpPFgC3vWryarLjbulweMzCJhAqpKolnwAdUdo9qZng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+LWtgMOgDYtXgoNLe9pUjBEXIW6P0UStS9ZjWXnrtM=;
 b=uDWxN8KLZu+7MHpmOUDQKH+bf5UxinjAYDQm9IPqkrErqGjPmwCpxuGX8BxvxzHfpARjiuV9sZD9kyBDKHtrvaO893GakQChE/Iz891xFr2BY33lMYSiDyDnBhtkuVR8wn1Tv2ZsbOaAyqThtKflSoO0JeeU6WbbioaDjWp59WMxQqhS6sFEVJ+3NBxheSgRHsCVDIwwBCIGwbPeBUWTPkUs3jWwEFbIxNBuaLA3iwc0mbITaX1ETMzSFUYhnERoCFchwWbJMp7cwnTzadMMMzZyoK0Dr9iaDiQBwiJQvMTGEY/xh7DLRtOgiP5iXq3vQ5hCnDUaB4YuzYZSj987eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+LWtgMOgDYtXgoNLe9pUjBEXIW6P0UStS9ZjWXnrtM=;
 b=OHic14AxP8/L7UUqnojD83yaQrK0E8v3Yp434y6O6ScS9XwGnwph7wK6Y4cEsnhuiMnvn4AxBGM3/WMjPqFmDexswtO856quyVwu+IzrDTzXtl56GXdR9qsXeTwwhaK41KeXZaOTmLdan30BiffH+NMeAjc8QtbqRQvSmypdWq7+YlWfdubd4yTDkSOhdIOJ9DXzAmJ66qMCG+QA5jl4RvyMQKbv0ggz5gvl6lx/2pDYO/u9iPcGfZ3JAnaxZymB+amnM68lFxqUJ2k5swTxxTn+j47OAA7rSS88ABrMTnIcZm0ch1oHJcwrD+iS+Mw70IIS2Q0E7FHmqoIUyU3HJQ==
Received: from DU0PR04MB9299.eurprd04.prod.outlook.com (2603:10a6:10:356::7)
 by PA1PR04MB10914.eurprd04.prod.outlook.com (2603:10a6:102:480::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 03:21:35 +0000
Received: from DU0PR04MB9299.eurprd04.prod.outlook.com
 ([fe80::43b2:647b:5320:225a]) by DU0PR04MB9299.eurprd04.prod.outlook.com
 ([fe80::43b2:647b:5320:225a%4]) with mapi id 15.20.9499.002; Thu, 22 Jan 2026
 03:21:35 +0000
From: Aisheng Dong <aisheng.dong@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>, Arnd Bergmann <arnd@arndb.de>
CC: Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Linus Walleij <linusw@kernel.org>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
Subject: RE: [PATCH] MAINTAINERS: Replace Shawn with Frank as i.MX platform
 maintainer
Thread-Topic: [PATCH] MAINTAINERS: Replace Shawn with Frank as i.MX platform
 maintainer
Thread-Index: AQHciuuZGKi5HZBtP0qzwttGWq9ZD7VdgsDw
Date: Thu, 22 Jan 2026 03:21:34 +0000
Message-ID:
 <DU0PR04MB92996C610694D92F55F2C3F28097A@DU0PR04MB9299.eurprd04.prod.outlook.com>
References: <20260121142047.10887-1-shawnguo@kernel.org>
In-Reply-To: <20260121142047.10887-1-shawnguo@kernel.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9299:EE_|PA1PR04MB10914:EE_
x-ms-office365-filtering-correlation-id: fba75a29-e455-4af7-0ded-08de596558d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?5B+L/COlIQICRq8QqrHsKP4dYeZRY+c8wv5GpMFSg/XBd0xFRPIeVUOI3sDw?=
 =?us-ascii?Q?xuptMQgDqgoEFSOKrynyGkY6PrN1Hz83V+DqgUc+IBZqlLq8AeYS6JulChZa?=
 =?us-ascii?Q?03miYfOc8ZRzb/FPtpEP42cf6X+f+XUIZ9OejqLnLQiWnFmxzup1WsNaQRoc?=
 =?us-ascii?Q?3QR22yE0gNuUm99BAUHwcJkdggl7/3QRh02SB5VB34cnZ+Osb5kSS0NPSAff?=
 =?us-ascii?Q?fde/gI7r098FGlfwpwNWgiE6U5+VLs5WbptCOI/HI4cW5gv9ZKMVHDcLs/U0?=
 =?us-ascii?Q?j0yVzeWpoNmlwmmlxCBzRt1dWw0to0CKQo82V3u8pIB9cyFEB/I+ikJ61HpJ?=
 =?us-ascii?Q?Xxz45i4rKLr/yfgbMz4/cA5aC/8jARG5L9Ak9YTVos91qzb16hDycaughfpH?=
 =?us-ascii?Q?wM2ADDSiy2BIIHIdu/XsU3Ig5QQ9Vx9RivWtmuuuYtIcuFB7gMk40Nn237Qu?=
 =?us-ascii?Q?GjU/NE94moszkY4qG+cDymREeEkSZkXTLD5P5PhiLnbYRKbKbNmyndkKEucj?=
 =?us-ascii?Q?4KIeE7RBR4JOL+tqxEXYkCgg8pX0ZMrSOQmqcOJSNYYk+SVUohmFlBqeAeId?=
 =?us-ascii?Q?xuon0bXvli0fQVWQPWd+bpbFZBIJuorIyHtj6hVIwv2EVA/oNDUbXecxn7xc?=
 =?us-ascii?Q?3omcdccavkyyI1S0Nndb96R/+GJ/WiSWAHbS+LBt9RzA5VQv+g81RXJCKfHE?=
 =?us-ascii?Q?waTx200AwUrZoZtdad14/mn5xuYtRkcaz3/lRQlWq1/GWt0P/cogUw7rNvdo?=
 =?us-ascii?Q?7Rp//FGt64OOUDCf4MDavebS2u+GL/AGDqTtm3eTgUW7t5I48y2ipYHdvu0t?=
 =?us-ascii?Q?qIPuAV1pNRaREmwfPjTtcK9ZiO9v1idiC19vjgDs5nxc5LJAO7GmsUUc7m06?=
 =?us-ascii?Q?v4tx4/bOaE/QUkkWEMQWoYZnD4n2yP2se4ptO9LeYIhGysvzs/kaFZ2shiPR?=
 =?us-ascii?Q?jAILIJV1FsSp6AH88ecj0VyhNH3Dlk6t4kfU7bQkVjNg3F4lJrbmYRH1LgUn?=
 =?us-ascii?Q?4mQnZp+LR7uCrlqDyZCT0jDrjJy8GLP5NVusi5gs4hPSwJX/zNBJMOma8Fyq?=
 =?us-ascii?Q?y0Mw/HuOvmDpqSeqHPGu4Wx+UrpZt/N0oZ7NQFnnBZ/zgHBFyweLGuigEdim?=
 =?us-ascii?Q?snuqAO47Y41ZDrOZk6iHyFaDQrdQmYFTvJdtESNRfsShfXxvSG6tgmfo/owL?=
 =?us-ascii?Q?id2PwOGSoL+KlISbeZtLuEW/X1m+9BnUe/Yn+xDJFxuyOGNJju1IkO5KzNPH?=
 =?us-ascii?Q?RqUFN5YSdCoYlo7WvR4247gyhXOkZDRnWdVQ9/sYZ8NVBEIgaZ2JS1K3Jj3V?=
 =?us-ascii?Q?GgePA5EwF/OFhySOxbmTmXaBljYWMER695/bqHr6QjqI3o5DPsOrF65mr4iO?=
 =?us-ascii?Q?zIzg6Dq0uJOoN2ArALA4Dg2i0idR0YY5NSYpwD0qvD97y5uM7OMsHxBozu/0?=
 =?us-ascii?Q?WgK52Dx3ivUAuHliqrDBXSCMFLT4+Jos9rH8zW9kjCKeXZb18X2FQXG6bbAq?=
 =?us-ascii?Q?9mpaIkDmBVtmGRxoM4V26XQgyivz4y9eD3ezQl/LuWhJOPKCO/205aEMiZBg?=
 =?us-ascii?Q?fakKCa0q38/E7x3acQqumb9c/7nyh5OEy+ZYSh+LNFiWM1O+wP+DQ+aSQ6dt?=
 =?us-ascii?Q?xZYGtIlpA3beq7gn5YHFgvU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9299.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?BdXbkHa2LxYO7PftuWcyb+Neo6cn4x6nhlFSxJhpSzyU+qVoG6mExPmy1qBy?=
 =?us-ascii?Q?C3kDLB//tQW0U9P9uzoCjDc9kK39imuTMBkxgOTqVXZ13rbKF49mrWHIKPt9?=
 =?us-ascii?Q?6L01QyqZb8MZqQHjlV1hf5AFoHdaO3KDkmt52TuNlXKjOWbrSwALmaPRHxpO?=
 =?us-ascii?Q?4DqTbxhqgo/oG9BLG9mnkxV5oGJefcW35f0i6JhzoKg9AmxoGdkWKO3yzlPi?=
 =?us-ascii?Q?3oOWdr13Fydr+RtdCuLptI2OAZxfd99o+6GaOOVWawC8aRPtOjzeCoMyy+Ow?=
 =?us-ascii?Q?fxBlFPXvHyPxtoJ6FhinUlWzRqoNjiUt2p66CvrjWeSYIZDX8+pub4v8V59E?=
 =?us-ascii?Q?z+ULWt3pAP1NDEARHn1Ela5ZKwqpFrHzu39GveI87G/QHJ0CbAWKYqg3KCOp?=
 =?us-ascii?Q?CtO50HuJBj0NItsWefFK+F0BF8GKYTFfClL4dwukMG1ekRfjxEEnBH56t2ZP?=
 =?us-ascii?Q?rD9rbAhuQKYRsgZYY4iPcepgE9ga6xV+H/Is2KpcNhqQrB1rFwKsejXsbsrt?=
 =?us-ascii?Q?tCWDhO9VxFHXHf0aNSqq09vqhWScomNzQS9/PiM5pSR9GBU8/zhulSFRYKL/?=
 =?us-ascii?Q?eZ0ZFsrw8UTAXp7IuwzEAEKqCK4GOzqqgOxgK4s88wMPujGgSMkTfyntHSO2?=
 =?us-ascii?Q?CnsvhftsCpEqERvjbcfU+aod8bTfrfD7A5c/Pd+1ZUDovJ19h2UzE4AQb49G?=
 =?us-ascii?Q?esVJiUy/lQFR8K2sbB3SKb4BeqB+4WXEuw+O5W6+RJZ08NKSx5vvseT46lLi?=
 =?us-ascii?Q?X20Xrc9DBcEzjmwYlr2Lf3kRfSMufXqLGOa4ogdrDQ/eZvi2YtHsyeeWuo6o?=
 =?us-ascii?Q?bqw3zd3V3EoTHmMIATi+Tc2xjeZbSYiV0SRHsYqnqhGsGeYhuwRbL6kzSzE3?=
 =?us-ascii?Q?FfvVK5HLYNflJnYMJBl8fJ9GAnLxCRLq83FF8FmGHvfB1nVCXErLobzd+SH8?=
 =?us-ascii?Q?1xnBBSdjOzcJDQ4dEVICxagHcTvfQF5Zr18ytLC4NF0GWgVSXHxc/hTdN3hK?=
 =?us-ascii?Q?SnAZWBwRkukoQ4HffFhttzq3X7f0yonJTg+l7rkEmVw1yg8sV2H5YJJiPh71?=
 =?us-ascii?Q?0/z0t4Rposkf3rwBKHIdHmS4uwKlv1zQOJo1KuopxJ89HDlwfu9dzxmkg/QM?=
 =?us-ascii?Q?HUKfhHHUbRUFH2hbZY7XoHo8MHsfZog+MXr8MC3F1DYV+9hawRrovf9kfjQS?=
 =?us-ascii?Q?USWB6R6DnaDmqpCo7p0RwsLPyz0vO604JH2xD1NLUaQnsqQ2cTwzdUIZR7dT?=
 =?us-ascii?Q?PDq84j7CxIoTssLacx3VGEe3//90idDwvYgRGFTyCP+bMU3PaeVq/dawoniF?=
 =?us-ascii?Q?Zusy5STHBcAAXTs80+5+EU/4VzkgB1DH6HOq3uZ2pp2u+QudHPGUHDG9U8ZI?=
 =?us-ascii?Q?oxvQuBjo9itevjVYmlo9xP6qMDDofidfUMlzC45M8wmuKKGzmyug869GdGi/?=
 =?us-ascii?Q?VZXqo7WRaPl+2t25hsma+TiteKNMO5MKxzPcZjVNzSjBN0wN8iGLXjtKvdpw?=
 =?us-ascii?Q?HMDTqG/1ZqAf4Vd8hU88isbfeAJhTjRIgjA7BRgbAYOChyW9ASzgk8ciTyuh?=
 =?us-ascii?Q?7Zhu+YgRgBGHXztp7nHnYK9OZ4RP88DrIuOFH6XrSf8UjYDi+htqEjpB97aO?=
 =?us-ascii?Q?BpbDsymtde2AQGJIr8j7pe4hMbzkZ2cIAr/+mACy7a33oPIEjOQ2lTawSeqT?=
 =?us-ascii?Q?jWdDmyx5lhfI0LBQzuUDyfrI1S+eKAVzhAPaLiS8e6kaj/GF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9299.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fba75a29-e455-4af7-0ded-08de596558d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2026 03:21:35.0325
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q+EfuC2e5PQkokK8Ed0FIFM7EkRNdw0Xr4zXZ8HWvH76Z760Fkv9txxmTiKXIJz4+au89/6jlU2eJ5uEuQ2ESg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10914
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[pengutronix.de,gmail.com,kernel.org,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[nxp.com,none];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-30883-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aisheng.dong@nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 2737E61471
X-Rspamd-Action: no action

> From: Shawn Guo <shawnguo@kernel.org>
> Sent: Wednesday, January 21, 2026 10:21 PM
> Subject: [PATCH] MAINTAINERS: Replace Shawn with Frank as i.MX platform
> maintainer
>=20
> Shawn is no longer interested in maintaining i.MX platform, and would lik=
e to
> step down.  On the other hand, Frank seems to be the best successor for t=
his
> role.
>=20
>  - He has been one of the most outstanding contributors to i.MX platform
>    in the recent years.
>=20
>  - He has been actively working as a co-maintainer reviewing i.MX
>    patches and keep the platform support in good shape.
>=20
>  - He works for NXP and could be the bridge and coordinator between
>    NXP internal developers and community contributors.
>=20
> Signed-off-by: Shawn Guo <shawnguo@kernel.org>

Really appreciate your outstanding contributions as an i.MX maintainer over=
 the past 15 years.

Acked-by: Dong Aisheng <aisheng.dong@nxp.com>

Regards
Aisheng

> ---
>  MAINTAINERS | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5b11839cba9d..a294b4e952a9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2745,14 +2745,14 @@ F:	arch/arm/include/asm/hardware/dec21285.h
>  F:	arch/arm/mach-footbridge/
>=20
>  ARM/FREESCALE IMX / MXC ARM ARCHITECTURE
> -M:	Shawn Guo <shawnguo@kernel.org>
> +M:	Frank Li <Frank.Li@nxp.com>
>  M:	Sascha Hauer <s.hauer@pengutronix.de>
>  R:	Pengutronix Kernel Team <kernel@pengutronix.de>
>  R:	Fabio Estevam <festevam@gmail.com>
>  L:	imx@lists.linux.dev
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
> -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git
>  F:	Documentation/devicetree/bindings/firmware/fsl*
>  F:	Documentation/devicetree/bindings/firmware/nxp*
>  F:	arch/arm/boot/dts/nxp/imx/
> @@ -2767,22 +2767,22 @@ N:	mxs
>  N:	\bmxc[^\d]
>=20
>  ARM/FREESCALE LAYERSCAPE ARM ARCHITECTURE
> -M:	Shawn Guo <shawnguo@kernel.org>
> +M:	Frank Li <Frank.Li@nxp.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
> -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git
>  F:	arch/arm/boot/dts/nxp/ls/
>  F:	arch/arm64/boot/dts/freescale/fsl-*
>  F:	arch/arm64/boot/dts/freescale/qoriq-*
>=20
>  ARM/FREESCALE VYBRID ARM ARCHITECTURE
> -M:	Shawn Guo <shawnguo@kernel.org>
> +M:	Frank Li <Frank.Li@nxp.com>
>  M:	Sascha Hauer <s.hauer@pengutronix.de>
>  R:	Pengutronix Kernel Team <kernel@pengutronix.de>
>  R:	Stefan Agner <stefan@agner.ch>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
> -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git
>  F:	arch/arm/boot/dts/nxp/vf/
>  F:	arch/arm/mach-imx/*vf610*
>=20
> @@ -20562,7 +20562,7 @@ F:	drivers/pinctrl/pinctrl-amd.c
>  PIN CONTROLLER - FREESCALE
>  M:	Dong Aisheng <aisheng.dong@nxp.com>
>  M:	Fabio Estevam <festevam@gmail.com>
> -M:	Shawn Guo <shawnguo@kernel.org>
> +M:	Frank Li <Frank.Li@nxp.com>
>  M:	Jacky Bai <ping.bai@nxp.com>
>  R:	Pengutronix Kernel Team <kernel@pengutronix.de>
>  R:	NXP S32 Linux Team <s32@nxp.com>
> --
> 2.43.0
>=20


