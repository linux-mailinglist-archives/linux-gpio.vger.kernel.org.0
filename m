Return-Path: <linux-gpio+bounces-31616-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BamIby7jGmIsgAAu9opvQ
	(envelope-from <linux-gpio+bounces-31616-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 18:26:20 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97265126962
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 18:26:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E0F13013EF2
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 17:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECDB22E0920;
	Wed, 11 Feb 2026 17:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FAeK+BGS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013053.outbound.protection.outlook.com [52.101.83.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654332DCF6B;
	Wed, 11 Feb 2026 17:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770830776; cv=fail; b=h3RMKBaOCWjNuvFx2Lq8PIf+PJ2zG2gSQcA8Vd9Z5l0+tlguk0IHO/nKwMEkIsGcFGV4T2JteZWj706wT5jCcV45wzNnVjKZ6EQQbQeO8R2n/euAXr3QX75wicXUpojYSZcsp4Y2Gc71SocDeY/XZNr5ambBZIwz6V5hvGlPh5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770830776; c=relaxed/simple;
	bh=H2T5veiBtH7pA+ok+L2XkJfeEW7zNXWei1VVKP2knq8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nLk8DYZj34iH1NfEzzTCqZROdBNyKnHz7Mgt5HouULDlXdhlyynCkd6DObwioAku0cu/AFjByc9d1IvfVTYymh7DGbGzjMLp41jeVoxh9b66lzsPA8cxqp6mbFNAAk6Mlb4AaKPI7wKFwesPibEmKf9io9Sq9ZkRsiMhCjWj+Ko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FAeK+BGS; arc=fail smtp.client-ip=52.101.83.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8VLPxC1jnI6K6hqSvd1KDmSqkd2ffSmntOuN4D/fVymR2SElEDXUMYTl+T+JXEbrju4Z5qZAMzyTxafZgspdLM2yK5jUPWPqjHdcvzy10CpR16X+E92wjATDqVb8mVHdytcKOckkZ5RSc7TI7c6OnUfHz5uPiQcfN+a/mkTnSu6wq5A/AByD716qh2DM4hXeyF3ue9RBDOI/ahsKm8wY7wzYF+uSEHZk9vUZYtd7baaqjiU5ikPClBKXQwOPS2OCrygv/V8zLhAvArU2WvVvxLweypBZuz3zp9M2vMlW/n+txaF5m/MyRgvZxImGQi1WkSWXkvAU6IQqNZJ9HD4cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdNEUK7gYV9cOAYg17PPwK93reK7lyIZyOUIxkDOhGs=;
 b=qmQxav8DqV7JT2CtY4KGV12oQrdfxYmzo6F1YmAMhg4uZXjWfcP5JXcPqBl7ijViXjsl186s7DvS1ed6Zy/dMnmfPvBsjBEyxN5xL4ZDhav6rLohF2px1N9SdqHR3j1oOc4FeLjObTJObNiNkL4XbbP7F06tTFRjCoRytX0kQXS+oYeQKwgfvhAM5saYBKSWRBqwj8uDAIgIC4v1fK8AGVjY6RXWXb0AoPBgzFfrnFAU2l3O07wKLQuPEhsY8Co6PhkuYuHAqkYuoIa1B7wAqdT3rMHGXcT4bYAScP7H0KHRf3GwxXf+4HU3psATfoWVt66/Yh7s6PyAZL3XZxqPag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rdNEUK7gYV9cOAYg17PPwK93reK7lyIZyOUIxkDOhGs=;
 b=FAeK+BGSVyeKHBRzhms3Q1fFaTdaaJPhxBEzEhlGxSBGhgoMGGzp1wKNZNwWV7oUar3Jk+aDuBtXzGj3aDvt6+5R9hg91/eJD565pJalC1qUqu3rSzEMEI7Ov3Uf3x9FLHJmMVNvV/uZkOyikvvExdWTaQOqM6wL8zJZn4YfRdDr7Fn4D+S3J66O6kl8vik1E+dbA4wb8ZDkvu7d8VOuVigu6Ib4+pQeyK48ZDrrw9VPQzR/s61SZ9RpwLym5zUdqtUWNYI/HUcHRaNhPLOIChqBzEli0zeSvD+HnEw+j10z6TQqgKBmqxhevF7bLLBSGQPU6PsaX5RVIv4MdUYp8w==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DU0PR04MB9418.eurprd04.prod.outlook.com (2603:10a6:10:359::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 17:26:07 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9611.008; Wed, 11 Feb 2026
 17:26:06 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: Bartosz Golaszewski <brgl@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linus Walleij
	<linusw@kernel.org>, "arnaud.pouliquen@foss.st.com"
	<arnaud.pouliquen@foss.st.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Bjorn Andersson
	<andersson@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>, Conor Dooley
	<conor+dt@kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, Jonathan
 Corbet <corbet@lwn.net>, Mathieu Poirier <mathieu.poirier@linaro.org>, Fabio
 Estevam <festevam@gmail.com>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 1/4] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Thread-Topic: [PATCH v7 1/4] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Thread-Index: AQHcm3uBP1ZHczU6NUihndFI7Bn0qA==
Date: Wed, 11 Feb 2026 17:26:06 +0000
Message-ID:
 <PAXPR04MB9185556E1A3DD990697E721A8963A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260210170814.406883-1-shenwei.wang@nxp.com>
 <20260210170814.406883-2-shenwei.wang@nxp.com>
 <177075649333.2817738.5507371747833844104.robh@kernel.org>
In-Reply-To: <177075649333.2817738.5507371747833844104.robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|DU0PR04MB9418:EE_
x-ms-office365-filtering-correlation-id: 51ca123c-f900-49a2-427b-08de6992a3d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?uaLfBx38r5eCXMQuaHMDCwe/Y/aYPV0UdzKASEENd44D5YPyepudvGbEiqzt?=
 =?us-ascii?Q?2hsuePn1K7JJ9995AMhq8UKk/lhBmjunH7rg6unbYEwhjW0GfhTvrwdqADFp?=
 =?us-ascii?Q?/eiB6ZIHgS+P83FhfeBTQPJORPVFNa+hEK1Fi4UT/O/ZK6HK0OtsdSALzbmv?=
 =?us-ascii?Q?iDSVOEusbKUnLDcIdt/05C+6wqbemj643pgsA8X5lwbS/LlTGjU2dBBZputs?=
 =?us-ascii?Q?O0nPGCbr/19iNaAM0TY4Y3ILKNml32XYGtsPJiWi3LQ28hDFJXq7eQ0P0bPJ?=
 =?us-ascii?Q?wiWYW7b+G8oA1640nJD+iYkGNSZRfu0J757/6aFaZrjTa5dldORRBLrykur+?=
 =?us-ascii?Q?CqfmZ23/VGUJYBDJT0Lwql2+X4xesUaZq9w4lkWw1MlKdEEAzNBpAnlsfbba?=
 =?us-ascii?Q?t0UhsC9qpyAmsnBa+/0yts74MA+WuSFJExHJFMCbjipGsFYFJgY2x6DoJLtd?=
 =?us-ascii?Q?xl0AMHB4LwIe5F8xgc+WSeEd+04bupeUBTmVs7XGNK7vALah0cqOHH2c31nD?=
 =?us-ascii?Q?tGnIkegSXLlX0jccFbY+J1TZag4JiZzN1S0BvsZXvztR7JOkNooRRv7/FPeH?=
 =?us-ascii?Q?YntVMMU1gpaBp1F6PjPetSMRgwaL4hC8j4Yx8ixxshOk6t+FDGOPb3v98ipf?=
 =?us-ascii?Q?VEEGHGAkfDT0mkpC7pFFtXFrWaEJB7DOUahPT98u7R/FLYxJvE4uX2Qq/eU3?=
 =?us-ascii?Q?1sEQihC0NndO621LV5ShJ2sCWVGahwVJiX4Cw19uXFbskEQKnvNe0iSGC4Ro?=
 =?us-ascii?Q?iYzPmPfrnuY8tr49uHTHMPsfaxuEfbHKfe5j0gldMDUWvFaYhlXHTYbmhnqD?=
 =?us-ascii?Q?rOD1yJ9VzqnGW68BFkQDaNdO+YEHZ8QVHDM1BCFwjE/lbTSKi/rN320Ao7V5?=
 =?us-ascii?Q?hXLh1dOroV8hinFynKV/UFK7ZgIAr1fPSiNBWVktVwYkWe3Y9ciriRVxSkCI?=
 =?us-ascii?Q?Dt5bBvlPAvPTpOS8OdPhcwr4e3S35+9VRwt7n0+5jM2aTM63RlvXEtN4t9ZU?=
 =?us-ascii?Q?8M//uAuVJtcUZfue1z5VjHdYblcxHYOzAOOcAK/ZT4hv4AIuFskXtFMyL8NK?=
 =?us-ascii?Q?t7vwPGxoP8rEM3HH7kw76QTzTOq2FKln+859VuHKNNwRpilr105luEoUT0xt?=
 =?us-ascii?Q?N3zCpE8C/prMCV9GpxsIR1PRFREWw+IMIipJoRTBpcuUE5/Io0xRt3/GVUPH?=
 =?us-ascii?Q?YUPAJJP7vzPOUP/Zbu1ryvjWts9t6G2yP+RT9zgKx6gzFx9/QOyoa6ihTPa1?=
 =?us-ascii?Q?qmjuCDQGY4aoBFjGSyIEf+Nse+PhhzdQUDngJ8ZKdMOWTqngDMAT9q04ARCW?=
 =?us-ascii?Q?p/DVRcL0RgWZeGe59hKjaN+s/GJikSdTeXHNKOercgXrim0+ZOD+A7RQe9of?=
 =?us-ascii?Q?GxSFWjvQiSXx78uc9Ez3bgCylCWGLdr5kHClaAyhpmZrPB8J+QBKOcqVmmiD?=
 =?us-ascii?Q?Be3mBuwCbXwYw3GVhUS+SRY5AL6jupiHq8ePWJ9Tow7DQT8dFr+hQhFdjrS0?=
 =?us-ascii?Q?+O5R/8PelvM0GFx6/2fi7JFHAFk8fk4dTtPxrrsD2wqkuMznT9Cqmi+co7VU?=
 =?us-ascii?Q?t3hV7IkSCjMKQCEd1yuhOmd12SQSpgh6oShIu2Aur4TBMIX0tQ+InICxnlYr?=
 =?us-ascii?Q?2Q6UlZyyfP8mGqspx/e6q8Q=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?aBe2jqaT9+pfrLXazuFITHhr2+W6DjPAbRXwIc9GRg+/gRf2NsRC6NZmi7Fu?=
 =?us-ascii?Q?+PkUFPcbZj2dN5oEvICv+NiPYn7DaTu5OtCzQcK5hxilxl0FGY5m0gx1i+PB?=
 =?us-ascii?Q?SIIkQ29KPvS5nQ37dyztsTjV+GRyxWFKGl5CnfmT7Wk4PCSzC1muMq+o/bmW?=
 =?us-ascii?Q?2cUAtQ2JFfeyQrmwVOyDJAdes8eD3HWAEtloJuzmPnP3sFg0IajKQN72L1Ce?=
 =?us-ascii?Q?fhPBbYNX9dy0yzCB2iZjtQWpikxYMsF8d0C32XsMNz/yd8j7XOmDl6/LNSca?=
 =?us-ascii?Q?eVSDMnQY4uSqEb6IWJJ2dtqHcufkK42E0YpJ0kv1AcLJ42nqVIXYXtLLHzUn?=
 =?us-ascii?Q?dd5aIMWVYGs9iNSAl7uApIVTTaTf7VA5/cGgqrgzTjwWw92zgwGXcn0DPpDt?=
 =?us-ascii?Q?Q5yc5Cs4O2PWeCIXETdikf+mzhNOqDEkl/kCdUK9YTrT8UdePsSC1slRtPSz?=
 =?us-ascii?Q?RkszNeOnHVNDphJ6t/A87R0Jzkpke/qsAq1bbZ+HJSR+d5GaG7CuV4m+ybWw?=
 =?us-ascii?Q?nRdyMr5GC6lq6mDmrdKhSY0gEIsj1PoJpv0HMe8EWfbxGJXl/S4oeKi06F5s?=
 =?us-ascii?Q?OOdADxpW+hu/QzPwaetXHS3CCA574+pU7luNEtAZz/PGeGpm3jXLGPD0dDOq?=
 =?us-ascii?Q?sT25uLMoKkphcLh8TfI5+GEXn4IkoB7Ihfss+fpHBWpWhHlaZF8U8kjIQyVZ?=
 =?us-ascii?Q?7AGIvxDyK0i/c+oer6B/DjrR3AiZQlK4AajglMaPFvtqele9nhwprOhJxdtm?=
 =?us-ascii?Q?fl9yBZXCGrbr+sFn+tTGBtsPU+pwBZsS3Nn+RCblpfXWarYSyP3Nvo1Swvz6?=
 =?us-ascii?Q?FgPJueFV/0JxXLe20TbWf0/CE38H8s5kX3TNPBnlnkeR7GkGmUl63MCHTS2G?=
 =?us-ascii?Q?A4jeMexhMWcsHFE7L1+mlTbF+aFaz4p+BaAArXr0sOSJ4chMaTfF1vftuQy5?=
 =?us-ascii?Q?o+lQwDrGeeaV3nfwnFHjrRZg+RvApYtDiJ5GOMf886r3tPF8x7f6Qrl3u4Pi?=
 =?us-ascii?Q?a4BbWEgl0GKHs7x6ekfJSneQ75zUSCRXlX+KVhsXrQ3jxG3AIDDaxHXHpyTo?=
 =?us-ascii?Q?lU6lhSPnSHDx+JFJY4UMGPswST2wB/U15g46+W7QALR/v0ehcAYr9sGDCDaN?=
 =?us-ascii?Q?jqKZ3FPN9FGwnLoe1G2tYrYA40DQvb3lfHEhWMzclf+Ybe3NP567W03OvPYE?=
 =?us-ascii?Q?1Tb+lGdXNRHu+XLMcS6mzcaVwhzwah1e2aeShtegbPT6OAA9/0b1Y98mj5r6?=
 =?us-ascii?Q?tgcL+x9FKTWB7b4z7VpkBRuTijPViBqU3dwyACRz7CkpPJz3mwG4lM+aa3Iz?=
 =?us-ascii?Q?BcANQN1hhXqZQIiD2O1h7WZH5Tz5FJ7vwHt0RaJC0p5qS66FUox/dEybV4Bz?=
 =?us-ascii?Q?MKFdiOfF/lVqgR38DdXo90cDaPyMz1NVu45iAyuwkQ3m8TEpdsoC7drfvcTY?=
 =?us-ascii?Q?ndYfPthXw6o3TvS2Pyjlz+uHQHpHJbEsko1qLxE0Z7gQXeGHTfV5OCk8Nuxw?=
 =?us-ascii?Q?EKfQnoJHREkeEfW9MW4TOfxOjLT/D4zBcmJySOs8elV/d7nOwnzGNDtyMf4R?=
 =?us-ascii?Q?370WZsx3WIz+hOt78aTH7I2aqeM7RxteyLfWtu4jYFENsVaWRrh4HryOT3Cx?=
 =?us-ascii?Q?VeaYp49DOwfhx396RHo1RYiq6tcZ17xRpgmHDftrFti7RSEHHVbCNfmN2qSH?=
 =?us-ascii?Q?slO8Mo91ha7bnjccfVF1K0iWBCo5uxP0EZq0sLCOERy+rroR?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51ca123c-f900-49a2-427b-08de6992a3d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2026 17:26:06.7435
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ETqcsaYtJ1rzGgXtl81doWUJX3q5X18+aZHgGfo+3ul0GnAfTce5GmXtRNwwxWxGJY9paJm14XAkRv7sHui10g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9418
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-31616-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,nxp.com,vger.kernel.org,foss.st.com,pengutronix.de,lists.infradead.org,lists.linux.dev,lwn.net,linaro.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 97265126962
X-Rspamd-Action: no action



> -----Original Message-----
> From: Rob Herring (Arm) <robh@kernel.org>
> Sent: Tuesday, February 10, 2026 2:48 PM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: Bartosz Golaszewski <brgl@kernel.org>; dl-linux-imx <linux-imx@nxp.co=
m>;
> devicetree@vger.kernel.org; Linus Walleij <linusw@kernel.org>;
> arnaud.pouliquen@foss.st.com; Krzysztof Kozlowski <krzk+dt@kernel.org>;
> Sascha Hauer <s.hauer@pengutronix.de>; Shawn Guo <shawnguo@kernel.org>;
> linux-gpio@vger.kernel.org; Bjorn Andersson <andersson@kernel.org>;
> Pengutronix Kernel Team <kernel@pengutronix.de>; linux-arm-
> kernel@lists.infradead.org; linux-remoteproc@vger.kernel.org; Peng Fan
> <peng.fan@nxp.com>; Conor Dooley <conor+dt@kernel.org>;
> imx@lists.linux.dev; Jonathan Corbet <corbet@lwn.net>; Mathieu Poirier
> <mathieu.poirier@linaro.org>; Fabio Estevam <festevam@gmail.com>; linux-
> doc@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [EXT] Re: [PATCH v7 1/4] dt-bindings: remoteproc: imx_rproc: Add
> "rpmsg" subnode support
>=20
> On Tue, 10 Feb 2026 11:08:11 -0600, Shenwei Wang wrote:
> > Remote processors may announce multiple GPIO controllers over an RPMSG
> > channel. These GPIO controllers may require corresponding device tree
> > nodes, especially when acting as providers, to supply phandles for
> > their consumers.
> >
> > Define an RPMSG node to work as a container for a group of RPMSG
> > channels under the imx_rproc node. Each subnode within "rpmsg"
> > represents an individual RPMSG channel. The name of each subnode
> > corresponds to the channel name as defined by the remote processor.
> >
> > All remote devices associated with a given channel are defined as
> > child nodes under the corresponding channel node.
> >
> > Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> > ---
> >  .../devicetree/bindings/gpio/gpio-rpmsg.yaml  | 55 +++++++++++++++++++
> >  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 53 ++++++++++++++++++
> >  2 files changed, 108 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
> >
>=20
> My bot found errors running 'make dt_binding_check' on your patch:
>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
>=20
>=20
> doc reference errors (make refcheckdocs):
> Warning: Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml reference=
s
> a file that doesn't exist: Documentation/driver-api/gpio/gpio-rpmsg.rst
> Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml:
> Documentation/driver-api/gpio/gpio-rpmsg.rst
>=20

The .rst file mentioned in the description is included in this same patch s=
et.

Thanks,
Shenwei

> See
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatch=
work
> .kernel.org%2Fproject%2Fdevicetree%2Fpatch%2F20260210170814.406883-2-
> shenwei.wang%40nxp.com&data=3D05%7C02%7Cshenwei.wang%40nxp.com%7C
> ec16fbf197124fe4a79408de68e5b709%7C686ea1d3bc2b4c6fa92cd99c5c301635
> %7C0%7C0%7C639063532995959644%7CUnknown%7CTWFpbGZsb3d8eyJFbXB
> 0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCI
> sIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3Dif3xgNzIUU4Abj9FiShAH8aJ9LU9S
> OcBUbKqAn%2FcUbw%3D&reserved=3D0
>=20
> The base for the series is generally the latest rc1. A different dependen=
cy should
> be noted in *this* patch.
>=20
> If you already ran 'make dt_binding_check' and didn't see the above error=
(s), then
> make sure 'yamllint' is installed and dt-schema is up to
> date:
>=20
> pip3 install dtschema --upgrade
>=20
> Please check and re-submit after running the above command yourself. Note=
 that
> DT_SCHEMA_FILES can be set to your schema file to speed up checking your
> schema. However, it must be unset to test all examples with your schema.


