Return-Path: <linux-gpio+bounces-22838-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F1FAFAC11
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 08:46:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B48F53A3B27
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 06:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D95FF2798F8;
	Mon,  7 Jul 2025 06:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SUitDBBH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011023.outbound.protection.outlook.com [52.101.65.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE1713AF2;
	Mon,  7 Jul 2025 06:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751870776; cv=fail; b=idXnMwXUuWj3k33u4xd1nmbNS3lvzw7VW2vEwvk6+IaihkarVjqVHJBnH9Ggfq8WsT21Ls/gyQK06vfcm4PSDimsiBJHVVKq46hKH/bSULpM5gBfRyXdI5Fy+Ui2H0QOqt/so1KFfHTwjCStrX3C3B2+al27/0O1rS7QDuDxRjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751870776; c=relaxed/simple;
	bh=84Orh20fw3V8TcYL5nXBwYDrejnYrcjz3BDLoE2fboM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BLOK3LWFEtO7cMRALU7MpQGbhqhcQIjwi9e4IKTpI2Y+kGg21IrQ85Q8HBXefdxcgr6Q/iqe3zh28QbYD1GiE0i/FRYm+I3h+NbH63wfVIgGLWuPLOKkGx8IQx5wGuawwXZ4pINc44vAOsrB7ACxTn2Vjt6XqDLs7NEST7orGGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SUitDBBH; arc=fail smtp.client-ip=52.101.65.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ClIjy7EbS9A9Ure4Q0T1g8IEokRwO6mMI2HIHVmZTk4BLr3WsfD9DHdAjPChbo/v/JKRcd4QIxpJNMVjCx8nSmFkAu1s2Yjvbyaj05mRH8NgFfYYFrsMM43vpSQPTrJ7RGvKWXvuktX6Z1plV3iGo/0S8j3h8EXbyJA1dxTKFinvuhygCWl+G095Hem0C8qUs8OPmaC08f6cW0vSDDqvFk4+UV7Hk9+/5l77pMucC01TmkUfbN5E9alT6Xhy/ss4nwl468+6OlO14PYUmyPqp9K0KM9yAzxC9v7QQE5/LFAdt534jqb2cTlKQCg61ODC5WvcNLRTB+ZTnXKUmH9HXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xCDS98HSmCTO6rNXrFRWxOyKCgOHFGRfEEIVuRsrr8A=;
 b=Y23RXJ+pWuWHA6hu3hkB0wqAzKz9fzNQC6UcqwLn1xirxw5eZK/hibjfq3f1gOHuq030SJzaPPHEt+ifKw4Wo7XoJggxbQJWn9OcgXFo8bkNTCKCaNxsARnhQrcj+uNM+4wGsi+SZ0bHyFy1pmrrv+e7WR5PDQSVLe9v6wZOyaV5ovTvrGKPPoa8ZkczgM8eZSE0BhN1aq4RYSN2biJTbgKnJRq6YYFEQZlkZ+ViqTA0/4RVw81+MFcg/zENY2U4Lfwh6dLGCAJWyqsCkmwGJosTrIZGkiTyw+vWkEmfu0Wm5cv2j98Wa2+7wnOKTsnqwVdgWjDY8noHDhTmXHxoYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xCDS98HSmCTO6rNXrFRWxOyKCgOHFGRfEEIVuRsrr8A=;
 b=SUitDBBHxzDv8HYrEv0cqsdPMfVbA12l3T1EGod5LugurFwrghwnHw+hlLfPbhnHF7uWi767lCCXjaCRuP9P+X2wTAxkwRwTx0pDgUKb8mJEdFX3ejfysuk7t6KyaL/FrGuzAaA68ewjKncRuIEQNVsDaDdUtam458FgxmF0yKB2bsmcBQx6yMh9B8b+9Zjrgo09JgxTTik093IB5V9rFWR5S5ClM+8jV8G2e6jWynCljhwS1MXl5olvoDeo07BX1Is8VfdPQ3APtOcaT6CNQCOU+0bi1gEfyu9azL/OEGOJ3BxekV4r0H4LX6lEN8qoz8tzNCNas5TkfaRfx0B0Mw==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU4PR04MB10696.eurprd04.prod.outlook.com (2603:10a6:10:590::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 06:46:09 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 06:46:09 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>, Shenghao Ding
	<shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu
	<baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Markus Niebel
	<Markus.Niebel@ew.tq-group.com>
Subject: RE: [PATCH 2/2] ASoC: codec: tlv320aic32x4: Convert to GPIO
 descriptors
Thread-Topic: [PATCH 2/2] ASoC: codec: tlv320aic32x4: Convert to GPIO
 descriptors
Thread-Index: AQHb7hI4TV7TfIaSMUCvi05VKVrQh7QmIkCAgAAEfqCAAAGOgIAAELIw
Date: Mon, 7 Jul 2025 06:46:09 +0000
Message-ID:
 <PAXPR04MB84591BAFB9FC7E1326C062B0884FA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250706-asoc-gpio-1-v1-0-f0912095e923@nxp.com>
 <3372384.44csPzL39Z@steina-w>
 <PAXPR04MB8459091FD195321E9E39851A884FA@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <10691994.nUPlyArG6x@steina-w>
In-Reply-To: <10691994.nUPlyArG6x@steina-w>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DU4PR04MB10696:EE_
x-ms-office365-filtering-correlation-id: 7889ecf7-885d-4627-c0a4-08ddbd21f4ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|366016|38070700018|921020;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ikUVe7IprSTUF5KyDI8XQ/iXlfhWQvD0z7HaftDAfCilCwLfMR9QcN8iVe?=
 =?iso-8859-1?Q?vETVNRhpWcDpvuNVjIRkv/QLeVUOl0j8pbaRicGNm/ftAVq9u/Ae1yT4T8?=
 =?iso-8859-1?Q?em95W7iKg+6K9nzhW/I3OvEXX8MRw92l8E/TxGoIslUfEUm436rDkIuFFX?=
 =?iso-8859-1?Q?Xu1vwjYrknaj6aUHPrYCloZh2NoZUYcmfMlRvBPbNWdQTqe/PPhGTrD/Rh?=
 =?iso-8859-1?Q?ungJGaiojmRfNWjBlvQMiPKNErxVMDO5bzRLeSnnqJkbXcvpTdICIDrO6s?=
 =?iso-8859-1?Q?w6ltqdVXMrIrmh9UeQhhujz1v8LOpL9biC8fhumQsKOT+6/QU2Kzs7XMXJ?=
 =?iso-8859-1?Q?o7chIvPqX1onl8gSSHTpavFLHmjDhJ20K+wsmLUErBIQwrOJEIzwSFUh4F?=
 =?iso-8859-1?Q?QJSarKK0yL5z5ag7lHIthyUzLuwluv6/Y1n9ku/vthVRGPhVuZmgXvVj0W?=
 =?iso-8859-1?Q?g4PEOgmxsr8dlnhBqh6q+RRnWairwsGDf+IE/ZQG36RlYJVpXoRiDc5eyv?=
 =?iso-8859-1?Q?cFC/GJdl8SvkxdDDUFvyb35AqLFLjcDNjsLMWFSxCWTAmGfujFeRIDZPSL?=
 =?iso-8859-1?Q?MDxTORMwGO26gVMVte89lI6BuGTtQ+rZPxbO9HNVuLUGMDk1IxAWCw0g2+?=
 =?iso-8859-1?Q?4tPQNSf8uj5I9pimeol5J/Uw+kdTIXqQN2GwHlQR4ZWGOFH9VwyNs8JT4Z?=
 =?iso-8859-1?Q?D4g8hNztSDczoniCDgx0eHViLf5JC+0XBHE/lfmCZrI4mbNYjzIS1wHF5G?=
 =?iso-8859-1?Q?y1ozvvqp2YHQHJVQkmFz5UXqR9Vj/mwM9DERodjiOJLrIvfrr5MIC3iBIy?=
 =?iso-8859-1?Q?DQR+unjd+gS/jKGvf3XkP3+yUhCZzRObpNGV96Pti3f5YsaFfifB4vK89l?=
 =?iso-8859-1?Q?ivqBXLVFDVcd01TXqznED2BoFzqLu9ioHV22+IUizTi031Xsz/CAUC4cvV?=
 =?iso-8859-1?Q?9PCOi57eK58fYMB4CajFOKHvF7/3pnXTpn5DvH2pBbKa55PdmvcllRPsEp?=
 =?iso-8859-1?Q?vc+eu8JnS4nQ884+hr3NcQJBfypRDQyGItZ802FFGnvBYBl3kHv29xh8Rt?=
 =?iso-8859-1?Q?ZIh5FfjWT/lOZcUr9id0SOTaFCEKTcY0z+k9n3nmmTFrMXT918AOQSZ5zT?=
 =?iso-8859-1?Q?ebzHTtaz0KjxoZVKz5oDwDy4LLcLZSkYsB9YXmFqOEME1bBRfyUNmghL2v?=
 =?iso-8859-1?Q?1L+ofrcJV4hAREsS72EfKNKsyOUs8nUtUT/gKVAAo6JDL5x1xoqhhRH0ml?=
 =?iso-8859-1?Q?7avkN9rpGR6JEb/Soe/AVTL1RcLIyJYm+pfYDUtA0LieSZMp5P6tww0Vfe?=
 =?iso-8859-1?Q?FVKa1+hafTWCoiL+FR6Blbt0u74Tn/NTzLtAw1XbaZBkRRp46rgjjrhja5?=
 =?iso-8859-1?Q?He1ID3EcmrV5wpw0dJuDH78UK/I0UyOuaPuZ4uJXkvjo/Aql7AgFaAVlOv?=
 =?iso-8859-1?Q?8HvNvyt+WBCmFKZ78aKoHl276czB6flTHT7R8G11/R0iSgNfI4Hls0UfI5?=
 =?iso-8859-1?Q?bXSdie8ZT6Rzkx42OLqVzw?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?fBgr4pGP326qdXIh9g+haX6jw3Vp6AaSMKwkb4L6mmGrwlihLDqE3xgSic?=
 =?iso-8859-1?Q?AxSAMvocoib6KcBVpaFoYiIBsPCASXG/zL+XwER8OgqYk9gnTeQuPLI0Qh?=
 =?iso-8859-1?Q?JPKwvxQvA1Ik5DHFIQLb/9SBRA+MHItlstWgecsaLIhzhbgBdBo4FdihgQ?=
 =?iso-8859-1?Q?bYyettupKLfS1cZ/OU0NacjpUXpMn05Tuy7eLThM/SoY6ZEQNiugSQFRj4?=
 =?iso-8859-1?Q?mGIqPZID04tXnOkySHWDbauy4C1BN7lgu66gZqVPhU5XnkzwahPh+v4yDI?=
 =?iso-8859-1?Q?MSGr2xfr2dRDiTZPtM6BOvvhPNj2CxKgkn23Usn/gbfsQaDxv56/MoW9xk?=
 =?iso-8859-1?Q?ZTVdk6YZKWKM0rzsqzpRpqdgCZfr3CCwGC8O/wTAygst4ewnvksxkt/Gs5?=
 =?iso-8859-1?Q?D8pqPYsgHWORXiQKzSXCiQZZ8SDwTSerbz6FgZQl9x7YBgVS+Rd4jbey36?=
 =?iso-8859-1?Q?FjR9TePVCZ6QXTpn02flTBayTM7KsRVZN8QQwy7Ae86RS0y+p92JvZyiNt?=
 =?iso-8859-1?Q?mgbxN42g2Du3bu6Z02rbVRB7AyB6qqetG02pQVgp9qIKo1oZT3GqmmVEye?=
 =?iso-8859-1?Q?gTScbx/spZbFkVj3uheOB7xknxdlzsg+G/kBgcTJXmE4lbjfeSZ+gGzheO?=
 =?iso-8859-1?Q?hmHYG3Nn7z4Y0wqUw6C1MxlJQk1m4ma2PHoSiT6Ll7zNARW9Dmley0ZVV7?=
 =?iso-8859-1?Q?G1nZM40ufGhM8ArGNfDPrkRlmvwCqQkBu8NOPtBn0fTIq3PQc9UdR0jvo0?=
 =?iso-8859-1?Q?jQWhhfSymwhKWb9wKecEYh/cR8XHuzSjpeX3bztxgGtFawaSaKH5xrKlA9?=
 =?iso-8859-1?Q?yhJ0n1hTrn2/pwB/ntc6ywInaV1wRsF3GL0SFKstANPIcInr91QC2aO++F?=
 =?iso-8859-1?Q?B66MKbpLUWxwKI4WUnQpPT18vtHEfVttFPBH8Z0MN1KWXw9yRXeHsePANV?=
 =?iso-8859-1?Q?9Ev/cGdJ5yimTrpv937yHSqx0rw4tAoRDzFU9wnuGuSZrs9PcaWpo8Ndyd?=
 =?iso-8859-1?Q?bU020h88hKzErkA5+uN/mhXC0W8NDyLmbBGbvc0xCV5ODtA11SpoGVh/zp?=
 =?iso-8859-1?Q?2fA256g+Uj3YXdgsSbDrSWnH2CEKxe/tOJah1ThDsYXxpdQI8L1nDA4Qo5?=
 =?iso-8859-1?Q?c0Ro+mvRu15s4iiJWlzW2Ue1NgTYYykFwV0PWaH9RoNO2Afu25oMBbo+tz?=
 =?iso-8859-1?Q?bw5h/vWUeNAAo89YZspcRy2feTEOBnMB5UZAfc9FyduLogJwVlSjWhNbv+?=
 =?iso-8859-1?Q?/vfGBT/OvIbo4GMyWjNTDtSdmFMfiI0+jG7qIhfw3hYoZtrmh2ciNYQp/V?=
 =?iso-8859-1?Q?cKSVSaooKOV3n8fLo+6iuUw8Sqd/4XxoKu4Sg2elye3ZMigI8i5aNPoB8q?=
 =?iso-8859-1?Q?7WE/CphmlPMNcAr8NDooTkpq7862sggYFcu3k7+9PcuBQP8wOkm/jnO/qR?=
 =?iso-8859-1?Q?ejK0b3llA2OiNXkvjf4HDsjVFNYTvI0+qABwEKlB3T0el1gJsbyd8qmT7a?=
 =?iso-8859-1?Q?bjY1mQua4UjoE85WJew23WyTJCZsCAmTSeUzIttEsQQCoi2zyUhc5s3+qF?=
 =?iso-8859-1?Q?Gz6TYxXp3zahPzqKq4UsiTtsIJOWDsUkR8DVt/9pzgzUtOxnaug+WS0L19?=
 =?iso-8859-1?Q?2BdVZ3JODc4YY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7889ecf7-885d-4627-c0a4-08ddbd21f4ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2025 06:46:09.6878
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mQPYN6AzlHysS69Z/MF84MOAor7j9a7BBB37jsGmYN1COxypQ/bLS3ETo9iDru5liuxtGVIFvaDmmVbLEEpgqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10696

> Subject: Re: [PATCH 2/2] ASoC: codec: tlv320aic32x4: Convert to GPIO
> descriptors
>=20
> Am Montag, 7. Juli 2025, 07:40:58 CEST schrieb Peng Fan:
> > ********************
> > Achtung externe E-Mail: =D6ffnen Sie Anh=E4nge und Links nur, wenn Sie
> wissen, dass diese aus einer sicheren Quelle stammen und sicher sind.
> Leiten Sie die E-Mail im Zweifelsfall zur Pr=FCfung an den IT-Helpdesk
> weiter.
> > Attention external email: Open attachments and links only if you
> know that they are from a secure source and are safe. In doubt forward
> the email to the IT-Helpdesk to check it.
> > ********************
> >
> > > Subject: Re: [PATCH 2/2] ASoC: codec: tlv320aic32x4: Convert to
> GPIO
> > > descriptors
> > >
> > > Hi,
> > >
> > > Am Sonntag, 6. Juli 2025, 03:04:24 CEST schrieb Peng Fan:
> > > > of_gpio.h is deprecated, update the driver to use GPIO descriptors.
> > > >  - Use devm_gpiod_get_optional to get GPIO descriptor, and set
> > > consumer
> > > >    name.
> > > >  - Use gpiod_set_value to configure output value.
> > > >
> > > > While at here, reorder the included headers.
> > > >
> > > > Checking the DTS that use the device, all are using
> > > GPIOD_ACTIVE_LOW
> > > > polarity for reset-gpios, so all should work as expected with this
> patch.
> > > >
> > > > Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> > > > Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > > ---
> > > >  sound/soc/codecs/tlv320aic32x4.c | 44
> > > > ++++++++++++++++++++--------------------
> > > >  1 file changed, 22 insertions(+), 22 deletions(-)
> > > >
> > > > diff --git a/sound/soc/codecs/tlv320aic32x4.c
> > > > b/sound/soc/codecs/tlv320aic32x4.c
> > > > index
> > > >
> > >
> 7dbcf7f7130b04a27f58f20beb83eb3676c79c3d..1423186f5a6c181a2
> > > 0dd2dd55267
> > > > 9d33174edaee 100644
> > > > --- a/sound/soc/codecs/tlv320aic32x4.c
> > > > +++ b/sound/soc/codecs/tlv320aic32x4.c
> > > > @@ -9,27 +9,26 @@
> > > >   * Based on sound/soc/codecs/wm8974 and TI driver for kernel
> > > 2.6.27.
> > > >   */
> > > >
> > > > -#include <linux/module.h>
> > > > -#include <linux/moduleparam.h>
> > > > -#include <linux/init.h>
> > > > -#include <linux/delay.h>
> > > > -#include <linux/pm.h>
> > > > -#include <linux/gpio.h>
> > > > -#include <linux/of_gpio.h>
> > > >  #include <linux/cdev.h>
> > > > -#include <linux/slab.h>
> > > >  #include <linux/clk.h>
> > > > +#include <linux/delay.h>
> > > > +#include <linux/gpio/consumer.h>
> > > > +#include <linux/init.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/moduleparam.h>
> > > >  #include <linux/of_clk.h>
> > > > +#include <linux/pm.h>
> > > >  #include <linux/regulator/consumer.h>
> > > > +#include <linux/slab.h>
> > > >
> > > > -#include <sound/tlv320aic32x4.h>
> > > >  #include <sound/core.h>
> > > > +#include <sound/initval.h>
> > > >  #include <sound/pcm.h>
> > > >  #include <sound/pcm_params.h>
> > > >  #include <sound/soc.h>
> > > >  #include <sound/soc-dapm.h>
> > > > -#include <sound/initval.h>
> > > >  #include <sound/tlv.h>
> > > > +#include <sound/tlv320aic32x4.h>
> > >
> > > Mh, maybe create a single commit sorting these headers.
> >
> > ok. Let me do a v2 for this.
> >
> > >
> > > >
> > > >  #include "tlv320aic32x4.h"
> > > >
> > > > @@ -38,7 +37,7 @@ struct aic32x4_priv {
> > > >  	u32 power_cfg;
> > > >  	u32 micpga_routing;
> > > >  	bool swapdacs;
> > > > -	int rstn_gpio;
> > > > +	struct gpio_desc *rstn_gpio;
> > > >  	const char *mclk_name;
> > > >
> > > >  	struct regulator *supply_ldo;
> > > > @@ -1236,7 +1235,14 @@ static int aic32x4_parse_dt(struct
> > > aic32x4_priv
> > > > *aic32x4,
> > > >
> > > >  	aic32x4->swapdacs =3D false;
> > > >  	aic32x4->micpga_routing =3D 0;
> > > > -	aic32x4->rstn_gpio =3D of_get_named_gpio(np, "reset-gpios", 0);
> > > > +	/* Assert reset using GPIOD_OUT_HIGH, because reset is
> > > GPIO_ACTIVE_LOW */
> > > > +	aic32x4->rstn_gpio =3D devm_gpiod_get_optional(aic32x4->dev,
> > > "reset", GPIOD_OUT_HIGH);
> > > > +	if (IS_ERR(aic32x4->rstn_gpio)) {
> > > > +		return dev_err_probe(aic32x4->dev, PTR_ERR(aic32x4-
> > > >rstn_gpio),
> > > > +				     "Failed to get reset gpio\n");
> > > > +	} else {
> > > > +		gpiod_set_consumer_name(aic32x4->rstn_gpio,
> > > "tlv320aic32x4_rstn");
> > > > +	}
> > > >
> > > >  	if (of_property_read_u32_array(np, "aic32x4-gpio-func",
> > > >  				aic32x4_setup->gpio_func, 5) >=3D 0)
> > > @@ -1372,26 +1378,20 @@ int
> > > > aic32x4_probe(struct device *dev, struct regmap *regmap,
> > > >  		aic32x4->power_cfg =3D 0;
> > > >  		aic32x4->swapdacs =3D false;
> > > >  		aic32x4->micpga_routing =3D 0;
> > > > -		aic32x4->rstn_gpio =3D -1;
> > > > +		aic32x4->rstn_gpio =3D ERR_PTR(-ENOENT);
> > >
> > > Shouldn't this be NULL similar to when devm_gpiod_get_optional()
> > > doesn't find any reset GPIO?
> >
> > There is a check in driver, so NULL not work here.
> >
> >         if (!IS_ERR(aic32x4->rstn_gpio)) {
>=20
> I don't like the fact that both paths have different values for rstn_gpio
> for the information there is no rstn GPIO. How about setting NULL in
> the without DT node case and checking if (aic32x4->rstn_gpio) here?

That's ok. V2 will cover this.

Thanks,
Peng.

>=20
> Best regards
> Alexander
>=20
> >                 ndelay(10);
> >                 /* deassert reset */
> >                 gpiod_set_value_cansleep(aic32x4->rstn_gpio, 0);
> >                 mdelay(1);
> >         }
> >
> > >
> > > Despite that, looks good and works as intended:
> > > Tested-By: Alexander Stein <alexander.stein@ew.tq-group.com>
> >
> > Appreciate!
> >
> > Thanks,
> > Peng.
> >
> >
>=20
>=20
> --
> TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld,
> Germany Amtsgericht M=FCnchen, HRB 105018
> Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2F
> www.tq-
> group.com%2F&data=3D05%7C02%7Cpeng.fan%40nxp.com%7C119e001
> 7ac9344b010b208ddbd196353%7C686ea1d3bc2b4c6fa92cd99c5c30
> 1635%7C0%7C0%7C638874638907645114%7CUnknown%7CTWFpbG
> Zsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXa
> W4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata
> =3DCZqJLhaQG1HSnEYnfg3v83dmZO9huNeEDCK2SZhKYho%3D&reserved
> =3D0
>=20


