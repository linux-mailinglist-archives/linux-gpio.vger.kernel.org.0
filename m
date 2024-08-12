Return-Path: <linux-gpio+bounces-8718-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E7994E8C3
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2024 10:41:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81F37280C9E
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2024 08:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 701BA16B750;
	Mon, 12 Aug 2024 08:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UXBpfi+7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011034.outbound.protection.outlook.com [52.101.65.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FE216B38E
	for <linux-gpio@vger.kernel.org>; Mon, 12 Aug 2024 08:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723452078; cv=fail; b=MCl8kWMoqOt1QVISJw2JNz2szwNqKWcnlMKr0XwApNvaHyZvxH0WpNa1ZnC1OI5EgScirvtbf7r1WjBpdyjo7rm55M3v898b40T86U2iHXyRg4BgYNMmJWp2T2HNLut8tJKHwH4ZIyrxD7VLOw4AX/F9elYKFS0ZRQOiJc6cNnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723452078; c=relaxed/simple;
	bh=eOy1yPpfenAEyVGZBTX2pubSSl78gCZ+By605ASrtVE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XXSHiL21C53NrC/rV5yVYmgEvD229Y812fl7jS+gNr/AOV+Wf0E/7Vglgdpp75glOxekdQWsGdQ2YZBM2iF2c5f8fLNJGZOhsp3nw9z377iEIQau9ZvPT+Fn5hso56mPdkc00nQsQkjWanphU0NAk2KdP0qBU5FLNKTzNaJSqiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UXBpfi+7; arc=fail smtp.client-ip=52.101.65.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WJyNNUT32uEEzlU2ICYmm/2DOlK6b59/Q9reZ3TvWcu0NHK8MdYKkaRJvL+XozJifoN/WGa+4QP98+x1EecKWLvEuEbz0er/XPoS+vUJZnMN7gxxGjBKLHDkEVFhPl4dqSAf4gztPlGCJilwtbjjHUcC387NNhfec94yRN7K21Ooy7HXtFLaUqapD43LnUQXoZYvlyRQAr2vJ6DSMVRAb/gye9JemMAvNutjXfo8NMVFI4kR6m2Yki84eouoEoQHWGIVlIVpBgFeFLgHDaPoIgsAOQf4leo4KUFkfOv0xuxSl8cO6xucySyfj3A3p1wkQuDjt6CulZjkVTuLFY79YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eOy1yPpfenAEyVGZBTX2pubSSl78gCZ+By605ASrtVE=;
 b=KzoFyr9uY30wnnSM28DHQc02xx1UTUgrHQaWGDd9wqcnXwCmmAHUKqhT5UmMTKwGGa2bm6YkRUVFMSAHPU5+69iFOtlLfcky2Su5cqg7yPDHcfvLBdSD6Bh08z2zVVkwSN/j51SVmRXECB/7tFSGwXLIrrIHo41bDdrACctq9ZGwKrF2QgYhLBHFTuqej5pjhzNGtUMzPr6pM0U/yR63TyRtlkmmEFTLUJLRQucRHKvnSZXqjVn/s+0j3jLxqftFy64V3OOG+i9XJrY6UZ5E8tB9FYvAIj9U2tp8lAIBiZBL0fL0zfTKcg5n9U7ZpYj7naMMDqomJ7gT3XO4xPvz6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eOy1yPpfenAEyVGZBTX2pubSSl78gCZ+By605ASrtVE=;
 b=UXBpfi+7nZ3UqeziENVec2/UkLUv0H7UNqtcnXRNu54gzzQRG20SSB4mfVe+fC98zAdcRByqcWhtxfwOaMCiZdHzNY1zKvdFJV9Z5L/xp3CX6Mpe6/2A6xFfddI3Lrxe0+D3hyuxqijjWf8LY5HCBbSy/lOSA4dwZnQIjeUWb4dvP4UXJkcHfk0cY/rd07/74nDpyhvSgCN/hHOAXbdUUmkaW94O06SPnoL5+l+wb5TUGNRLGHLU8Jnjzs5GZs3fVdFMArcWfTu5ZzSN06sVkTgX2PpI5ZYmTNXNIPRYmzeq7bxI7fFq4Woj37wB1oLXnkbotkwpZ7EzCy2ZUMFkgg==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS4PR04MB9433.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 12 Aug
 2024 08:41:12 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.7849.019; Mon, 12 Aug 2024
 08:41:12 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Fabio Estevam <festevam@gmail.com>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>
CC: Aisheng Dong <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, Fabio Estevam <festevam@denx.de>
Subject: RE: [PATCH v3] pinctrl: imx: Switch to LATE_SYSTEM_SLEEP_PM_OPS()
Thread-Topic: [PATCH v3] pinctrl: imx: Switch to LATE_SYSTEM_SLEEP_PM_OPS()
Thread-Index: AQHa6a/zmJW1SWCotEGNFItbYHycSbIjU0gA
Date: Mon, 12 Aug 2024 08:41:12 +0000
Message-ID:
 <PAXPR04MB8459E65998D6AE46B083315E88852@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20240808162750.244092-1-festevam@gmail.com>
In-Reply-To: <20240808162750.244092-1-festevam@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AS4PR04MB9433:EE_
x-ms-office365-filtering-correlation-id: 2907bb10-7ea5-4b70-037a-08dcbaaa8585
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?s7069P690+etpE0B3LEKx1wMQmz0srXuO6WUDbk7WevY5Jp/Yu5+9gDAA3It?=
 =?us-ascii?Q?preNSt9iDH1DROa9TOKCK+9y8Q9yL/zFmwE8y0YrklCKmHAYC3GK/qBoVgAp?=
 =?us-ascii?Q?NlaTJmT5NYsFFGaWb2mVYHIyW+bXyA7MEdxE9CErHxKhOzbAvtNi/ckMW6gz?=
 =?us-ascii?Q?NW+tYnuh+UxmI8/CmLEM0aIzsnZH8LpA7VSZHrNyiXEkBS1Nm5L62Vr24ZYD?=
 =?us-ascii?Q?U8WBE3aP69xdISQhVnT7+k9sU23m/rr8lP2KFXpLhWNrCL3hvW+jV9XMj2lI?=
 =?us-ascii?Q?KkwWU7fT3bATe0PsfGpV1WVpZ/AKIgA2pJ/dehrgADqLB2L28DgIJ1IwL3V0?=
 =?us-ascii?Q?hCk+MTEOZ5ZbW3S6mx6OE/JgnNDOUi3SbUYtG4SLI1LSlvqLVGAbe/HVN1AJ?=
 =?us-ascii?Q?r3yL5O7KKEv0ZLltbdiaFDi3DSdLzRU+svYKUcx3MMTA2SHSI7PXW8dHQka5?=
 =?us-ascii?Q?DAKoAZ6Jfnu8jZ/v5dmS0tPa9bhferyAogJ2CVXKem/LtrinxfZG4X3+aL1S?=
 =?us-ascii?Q?dE6kq2OaZV5BpyZzyBTQXkpy1FPfdkvFGI+DSFbeqFxmd1pw+cHj3zvvXRKn?=
 =?us-ascii?Q?pnTzTU6zR2AnZk2uiEWo4hHcJcrdJkR5dL6bv0/S4JFcB67Jwv8QXdtqMCp2?=
 =?us-ascii?Q?kmXenWCbc57N9kJBRx2kkMBs7o0Jxv7AKJ5bnfKm0Ngi76xJ4p77lxqOkya3?=
 =?us-ascii?Q?nq/YBIFgyCMhNDIXlDDxR7ZJxzB4ywj81gCfhVrXnIKDp3gK6C5f5BfV5Uta?=
 =?us-ascii?Q?vPHZriesB2SDqjQaaE5afV6K/DdZsH2E5xVHGQ8YjY9hmU30pLjY5iuQDKl4?=
 =?us-ascii?Q?iaauSCCoQFuK4pPCx2Z4CVQqYYrfjE3ncJtHQd+t0nm+y6PXXRLFXuF/3cAk?=
 =?us-ascii?Q?wYNQpU/MOoJsJ05TLp+Gu/LVm/evqCzbuN59bZDXYQsIlhp3oePwC/ag2049?=
 =?us-ascii?Q?xgCtSdIpae5Gaynp2pDQoFywA+z6XlZ7V9ppJHHzAFufUEXv+7qKYZkDd/5A?=
 =?us-ascii?Q?OGFUpTBaAaVLkaeIxKhWOASE/koYy/2PZRApQ3aN/SRV9qQ3VDQgkyVj4dfn?=
 =?us-ascii?Q?6b2DWgnVFC0O+PbX4bAbPWnk0RhWDiEzIIxSLZ29bwr4xapk7hX+BsyN7Y8P?=
 =?us-ascii?Q?e1NNJCTyICblq3LKtpJ6Nv2E/HYrGEVzvaT2khrQchtDgRccUkHx0aCwfUzu?=
 =?us-ascii?Q?DMQkS5sX78C2xm9Hzr7e1SomsN0C/dzvo0iDXf5RoJJ0kOzcTnfQNbr2sHkn?=
 =?us-ascii?Q?2JUy1aH0e3v/ZJox+Hv3IpUsmGnV29nytqjwkaVy9OmacLuFOvEsjbUH1b2Q?=
 =?us-ascii?Q?zQYQVBA8v5TsxYcNT+bibKZxxtk0XhflD0dfc3M8BPcoj/hRYHTwZ+LsHplE?=
 =?us-ascii?Q?yaLimf6YNnDZhdbfmKrFtPtnUyc/zTqf240P6gZIklTO57BVBw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Ujngw97KHPU6Bh/+kSuY2XaZ7n2iNWemdLGgdAZkE3iDZpHZx9fpVCjUE22p?=
 =?us-ascii?Q?KHj2WuxUk1yBkgTy62yF8NpDt0mUYoEU2i5BnIwJ/RC+e4O2PtZjseZhI/1Q?=
 =?us-ascii?Q?+FzThJUWrvTlZ1lxv9rzdtY0Ri/IxVcKEUyO4XTCl/uwg4reFnlKNIz3YdE4?=
 =?us-ascii?Q?shD1sal3doWVykp+CnS3GAII2XR/IAjGIu17Cm7dPFQ+0y1C9HMKa2lOI+7p?=
 =?us-ascii?Q?QQ50y6QOpJBE/wbqDZ63KXJQ5wDqXbzPq2YnE5WVpi54JYfbGR0ftwV0zRN7?=
 =?us-ascii?Q?zkQHhA/QedQjVbIb7pFq2qGeLv9puDaYZBSgmJNV9q3Y/v2v5wk2EIvZgNno?=
 =?us-ascii?Q?DZCCKVJmnwGvfXIwrlLgrNR85MbguPlc9PQki0CuO+2cpMbOJ/WWpYzpGVA8?=
 =?us-ascii?Q?iy51ZL+Qu7bSwE4oSMsL9hZ7McLDzbMfUEEV1r5mRyH3RCJ9x8H0L5RcrcSI?=
 =?us-ascii?Q?MhGgg6AJpIY8UsGRX9K1cpaIpR0Bjv+25qvVRpv/EwYN894za0Ij7NntkUdi?=
 =?us-ascii?Q?YfvionbKMjwYASIZBhLvSXafxwAKcNR7LjXXN5bhLRbBASG/I1SEdZb09ozq?=
 =?us-ascii?Q?MOHN9OnnbsAbxaDFh6aPAFUrDXtlgjdL11ToK6GoNwHB1WGa/RRykNnchc1j?=
 =?us-ascii?Q?a9ggCNu0JSQEy3UXV8GkZwr2qkjFP9raoIutYdBX6k+soUg4U0vmffFUo5qf?=
 =?us-ascii?Q?yZ3A0KoNX9gC0ZumkMKhCkNTwk1H4UAp30RTVFd6WfpC7oNXbXvzzeAFIlYc?=
 =?us-ascii?Q?q89VcqCXNhFra0reXpcO321ym4/lY0UMVQWLqASTgxoUNXsx+rF53pOeXb6p?=
 =?us-ascii?Q?CzNaHZZL02OVwIsJKFiZi5Ods2aN5LNg9aPSbQBSKG6+P1GVHZ9HOHjtpND/?=
 =?us-ascii?Q?Rurt0OjDPA+q5hfFb6YNkK1YDNa5DWoAgzQHAW1MdxXh3IIucuHtMkNvf7EC?=
 =?us-ascii?Q?/S8cqUmIcTyW9p20QabI8U3CAj/c0j8m5ngh2PK6OEC2ax3hiaRbEBPolbcr?=
 =?us-ascii?Q?kPiz1IN9BXTiqbVclmaiUVqOhPAPPZb2NoxeoVQ6iibGYkkyUk2JFdPIp/7g?=
 =?us-ascii?Q?Dl2DjEOJNmuqPxBgqyHECmusZz8U9w8SCKSZcO6+FxbDaUPI7IePI5ZaWOwi?=
 =?us-ascii?Q?90lCHlp2avniz0n9zhzwnBTsYowH6kfVNcd/FhldCNw+EeIeR2R00PJRqivE?=
 =?us-ascii?Q?34Y0UnIjGjOuaOPRzm2QSSo9uWspATLlJNJhD2sBexRUOOYzuP7biHcwOibv?=
 =?us-ascii?Q?ZyzYFQ6l+QU2PjDDkdFWUfdJtuLSZuTsETjoCSGdJQGbTRCRMStbtyc3cjVj?=
 =?us-ascii?Q?03KpEiiBw+Klsb6MZMfCDZRGCsv+y4Hq5RNsOgFHuR/xxSNLkmUkGObWkF8U?=
 =?us-ascii?Q?84fdhw3JsEptVF7tOeosKNbmEL4Wt7b6dUimvAx7Qh1BqvxUH2Npd03BF+bS?=
 =?us-ascii?Q?Gc+z7RB/UiVlAapkK0sBGry+N9jLx4T04y4PxT6/Jmp9rI61hZwL425Oq/Ej?=
 =?us-ascii?Q?asjOc1xaY2Q8kAxgQdiFJaGM5ql4k2MQu3z3iW2YKwMWuPE0lmTtzsGOV2+j?=
 =?us-ascii?Q?npSjAhNRwr/OAjYJa2U=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2907bb10-7ea5-4b70-037a-08dcbaaa8585
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2024 08:41:12.6853
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rw7nW/UVS+Izn3CRKC5yUVLgmbdUA+iDXphU5vT7fmuhgwNMYQpKvLo3g5DnHZslAxdZxciBFPPdLEC3EaaERQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9433

> Subject: [PATCH v3] pinctrl: imx: Switch to
> LATE_SYSTEM_SLEEP_PM_OPS()
>=20
> From: Fabio Estevam <festevam@denx.de>
>=20
> Replace SET_LATE_SYSTEM_SLEEP_PM_OPS() with its modern
> LATE_SYSTEM_SLEEP_PM_OPS() alternative.
>=20
> The combined usage of pm_sleep_ptr() and
> LATE_SYSTEM_SLEEP_PM_OPS() allows the compiler to evaluate if the
> runtime suspend/resume() functions are used at build time or are
> simply dead code.
>=20
> This allows removing the __maybe_unused notation from the runtime
> suspend/resume() functions.
>=20
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---

Reviewed-by: Peng Fan <peng.fan@nxp.com>

