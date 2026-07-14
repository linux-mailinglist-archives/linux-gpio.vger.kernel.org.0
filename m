Return-Path: <linux-gpio+bounces-40088-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NGqCA7ibVmor/AAAu9opvQ
	(envelope-from <linux-gpio+bounces-40088-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 22:27:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E86758B9F
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 22:27:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=OM6Xv0t1;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40088-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40088-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D669E304B860
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 20:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6515B43551D;
	Tue, 14 Jul 2026 20:27:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011071.outbound.protection.outlook.com [40.107.130.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EAE427FB8;
	Tue, 14 Jul 2026 20:27:26 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784060848; cv=fail; b=Brw8E+6dsymCOP8yhOi+iDrxOgROl4qD56x1LzymjSzypRWswR549E3rIwGy4tAvA2ZYuVV6ni/7zjzydu+6bgaVReNkh0UeTyZuYeGq4PvJoqXg2qo8UfUjtlK06vMrl7Sje92npnOUcMokWjqfKEM4VZrJoJnQSKw5SvByQJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784060848; c=relaxed/simple;
	bh=hyUssi1urZw0Gi1vqMr+rs+N7+liarTA1JadPC2UBRQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Gx/I31nvi1SPTtbKSviKxG8EAbTUsKQ5JW54j2poAGoA5thPyFK9UjneqjJXs3gA22cm3YXyO3JukK5/worH/KAwZiFq46BhPlnm9rEerqq9tGRetpw+F1PJHazu0U2/J43qvKsebJpZ5jBZ3BX38JrRw5z4G6sR+vYjNgMsUyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OM6Xv0t1; arc=fail smtp.client-ip=40.107.130.71
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IuetzqCQ+MENEQyYZa7A6xmTuJdUaYk9yyZsuPq32pXnTUeZMB0P9USVRC2wnowCRaAlEifNvbsCpdEO6AHy8YXngpHyxsxkNRETb8knDInHwtAgx6TDcJIqKEPZELPco3n1tGVJA6as5Lc5IQPHgNyu9hWMLByysalFzHpdnx1wVpgy07tESVyWJnqQYbEh6pNVmBZSht+1aJ5Iy8EhB3DtDHYw/73a8/67rquI5f0sBq+Rb4cTpvb0E7mfVF40mAbznFk6lD76hJuVEThVsdnVrWbDAyMGF89jIA4K2kkaDkNDWQLWfXVp9oXfz0L1vHR77rkdBUSWx4eSimlvUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vlLgFHhvdO4zfUDdEP/XAyawtctH8Zu7W7hNfe8Jb8=;
 b=t5VXBNVVYtsIifQ7dq3hcnVbgll2Pcn05AEBdWE7bHABn2vpLIwsue+OELQuIaxp7QZXuEDvHDzO1cuxfaylxhqoixPJJ6i5Ia4misU3UFvE+b8dlW2ThGp2h9RQV4/SsXVtpb4qLxE+5zKCbxqn9a6OcVRWOOBurWT9zRzF8vni50ym+uNytkW02oGvbfhVJejJJ3qIgUmMLiqKmWll5aKjwmLEvcwGy2ZrIO2MRK+gAPAjw3e5GqPg1AFUeM0Fsf3RYuRDutxFu6y49xUcLOmcn5bzN1zlSzO2Qs5ubW42vYWWT/qvhVqXYYXJ3BEjD6oAPaPbVaQBR2McuqcEZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vlLgFHhvdO4zfUDdEP/XAyawtctH8Zu7W7hNfe8Jb8=;
 b=OM6Xv0t1ntu2XxmqDByot3uktSL1bhXy6ov+sxMyLiSobW4ZxUPE6KvqHv637X/O/rRCthXCNpkBc/+wNUhzI0DTx/dYXx5c/UTXCebHDFXt95cE5Qo8D7SgQl54m0pQA6t292EOVmMRf59zGSwNoOfoTlx/ebQW/EEQkcZcN09LOEKUN8TMR/bK/KeNcQLvST6qt2qwLroYcaugdd6XLACkcJ2qzTDzrs3Jixeoi3kKJSweZCFNCgFcf31YWelFmyNTJNyqRX4cIcZCCnYUAYB5TNu795gofdHGPzeSOAdyTkgUhAk2Ch/GS98A4IyG6Ivw5zJzxhL31DjuC1oOBg==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by VI2PR04MB10619.eurprd04.prod.outlook.com (2603:10a6:800:26d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Tue, 14 Jul
 2026 20:27:18 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%5]) with mapi id 15.21.0181.016; Tue, 14 Jul 2026
 20:27:18 +0000
From: "Shenwei Wang (OSS)" <shenwei.wang@oss.nxp.com>
To: Andrew Lunn <andrew@lunn.ch>, "Shenwei Wang (OSS)"
	<shenwei.wang@oss.nxp.com>
CC: Mathieu Poirier <mathieu.poirier@linaro.org>, Linus Walleij
	<linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson
	<andersson@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, "b-padhi@ti.com"
	<b-padhi@ti.com>
Subject: RE: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver over
 rpmsg bus
Thread-Topic: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver over
 rpmsg bus
Thread-Index: AQHdE88qeTK8lSZIe0KKnhDBBvYXJw==
Date: Tue, 14 Jul 2026 20:27:18 +0000
Message-ID:
 <PAXPR04MB91854BDD3FBE95DD5025AA0C89F92@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
 <20260625155432.815185-2-shenwei.wang@oss.nxp.com> <alUdg9iTysXCFUa5@p14s>
 <PAXPR04MB91852808D2C7491AEF98CF1589F92@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <680d0633-cdec-4545-9114-79bfd6eaac41@lunn.ch>
In-Reply-To: <680d0633-cdec-4545-9114-79bfd6eaac41@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|VI2PR04MB10619:EE_
x-ms-office365-filtering-correlation-id: d3d41eac-935d-43e5-699a-08dee1e64d2a
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|19092799006|376014|1800799024|366016|23010399003|38070700021|22082099003|18002099003|6133799003|11063799006|56012099006|4143699003|5023799004;
x-microsoft-antispam-message-info:
 bWA86XVvo5XaPRBlJAMeJ0qg1D9fKweP8KnkxwEIrRUqkumKbRnQPKKUXecCsp72EoGfynnZZpdW5SW1CdTk0JewBQGHIvmz+XIBOuYLaoE81ZwcAWJCLL7IDUWUeGFjDnlJma/eQToiMLuteZVRmxO+Y5vE5qx1mQF0dcLkVzWO2q5vSYHVFbuFpmY4xeb34BYTjwEp+fE8DcKPRqkkLJMFrXJ8b5u5BZHll7AI/v7/DYVBdRvu5YMI1cxP4eJVLnrsYPrdeNJTOS0ZlBkApyRPCscu4esWCEWqH6tecP2lKfPujyScLZJi7jqLHfBX44Xqxd5ZGehXphq9Ncffk+WVFDWmhZzp0KUNGUvwlC4WynGtX7LNHXQOujaLLbAo34kbWmUemBn3QGenOfRjtG1AadCM6iPkdLfoQDc0/2lSOi1rQktJ5mf0MXxS1bvGkmjVwHiLGZFZVgD/TPAqvgBBTS1nOReX+hBOEcuKmGcn7BgCdLXNCZf8gidH9A21+R++SsIhle7e2zC6639gB4Et5rNoBnWJur1SHiFYD9Xh/P6MITRiQaNINsehMIiA0tDLn4aUC1BouDgaD0B14f24+CDB3ObuNEOlNHULfUWEdniEyMOtwgA1PGz8d4VYXeHNnDK5zvCalnUqAbrDbQpxCX8VIux4RRGSsKdpfQdpionUMAXgPVlfXCH/Mkk+OCbbp2SHfbJE0s59MutzDw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(19092799006)(376014)(1800799024)(366016)(23010399003)(38070700021)(22082099003)(18002099003)(6133799003)(11063799006)(56012099006)(4143699003)(5023799004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?NGFjJTdP42ln6CEIEFq5yPPV/x1G/fVHBUtJ+FrwnpQfk1iRmF+rPqixRio9?=
 =?us-ascii?Q?GQ29g7lffIPH/fZM3mPXK0QoKfs/rBh9OdcyuNBAI9GNSJE4vHNU+s12oeA1?=
 =?us-ascii?Q?uuM11YY6RilOra101q/CiKYbNs6xyH2pMHCT9UpY0axtqa0UyJEdkHmbd/9v?=
 =?us-ascii?Q?YV8wHp/sEqII4VLLkWQxNYNZBkFcrsebCn9Uw83raXoYm6ZSJclWvagFhyDq?=
 =?us-ascii?Q?ZYjIJ4bdBWWcfKlZnSNPlvdWFKYPyUhgYcMFX4QbYebIzP4r+GcldfyMvRNa?=
 =?us-ascii?Q?dRnQgHhJ5e1yII3g+z0/633kbn5Zv2pxX1uFnl2n4h4ZhiwzCg+rMKHPPPaG?=
 =?us-ascii?Q?MznSUccFv0OB/CW401EmLUhDuDITGeciPNClpuWuMtL8UWLeC4vroYEmvadW?=
 =?us-ascii?Q?ip1q/r04T1LSIzel/y8kzdck+PduUxG2SpBarhLO70m0aS1heGY+fYeJxUxT?=
 =?us-ascii?Q?dRkaDNJuDIATDitwcrF4HROisWMpbKEQp1qtc7HvS+3cpPmkR99D4newNLb2?=
 =?us-ascii?Q?VDxTC8xOx7SHBYTNRrw9Pzm+bzcQ9PjU1LzMYbPt6dKHsSX6xDGlbmFZ90+8?=
 =?us-ascii?Q?91gLhLdUHt7gaqFq6R4YmLWFOo8PcC8j7Y/PzMMU/fSKnB4by6AnXRXeqEwy?=
 =?us-ascii?Q?12n31sS/e/38gXw0+X0KaAfelssr3LJOF3T79ew97t9SDNvkIgdt+lYiefAI?=
 =?us-ascii?Q?QkQYQvVCnZN/h4bqWwGYZ9AVgTdFZIqSZXwYlRGVhycJClibrT60640LGhGV?=
 =?us-ascii?Q?ng+F0JrKIL3IbfZVzvFqxOqMO4/bv9nN30yCilR7BlxGPVqMZBg8TIEdC7PK?=
 =?us-ascii?Q?YgiJRPBQdsoW37JpEIryOYEawadPEJi36ohZ7CbbEADYHg7yp8CkJb2ypv+B?=
 =?us-ascii?Q?sO+9WH02po5zArTy6yaNcazrCvwKdZ2cLd+AwzqNXNU8Ct//y86vvYua3SG9?=
 =?us-ascii?Q?rVVHH1Eq2DY+VmALUYEMIBzjrcUgxXFPTi5rUIO7jy5M9rFpmNhVmv8dw58I?=
 =?us-ascii?Q?FukbFLwWvEkelJkbw/gPpbvFgse09LV3q/3wsqDB+1wHuCMEeLZxsOICfEir?=
 =?us-ascii?Q?WDrM2vgX6pOyELuRBmW6x4d3kcGYetwg67XPFMb20BxHM8elI3ePZtBnJK7j?=
 =?us-ascii?Q?4OWloyFVZaojPTnYbtkIwUREXzn7t3qgvgC4k4JwuN5B1xpE+DpRmQF4tcEq?=
 =?us-ascii?Q?5a756/beeP9WKQ1+Acn6m9qARvgnOa3Ne8dOtfLCz4+JQ0x9iohJk8CbKtBG?=
 =?us-ascii?Q?t5lzxCLroWXfAH88mtOIr4GbnQehjKe3YxRohv5K8VsI9bIEMVrAtBrk8hna?=
 =?us-ascii?Q?7zZH5j3Buv3az4I9Uq6ZOJnOsFGqKFx2c/hXXF95aFGaLtqteVOmWydzEVNa?=
 =?us-ascii?Q?0cs+KRlibc+azLUBwspqK7Lm+IcLqwMs07WCQ5WYWXceuZjCcC/Go3OXBsDH?=
 =?us-ascii?Q?3nafgcE1rqfVAvq6eVaTnF3dqd96GpeC99EGRjU4SUdDh1tC/Ul7AvVi8EVX?=
 =?us-ascii?Q?4xq57n+7reZ05ynRo+Jy2rfjRc/Z2owGnVYpY6+aMaZipeLw7xLfpc6DElw3?=
 =?us-ascii?Q?ZwQo3kRXK7ojj5fEYhCjbk3kECHbmwNtSoZKaz1Ijm7U5MkbV1s9XPoepb5n?=
 =?us-ascii?Q?GoTtMIam3Kc5VmOEjCrS1+pGHOJNagC03YEvmhX1pBj11RrZmC/yjRHvQ1p/?=
 =?us-ascii?Q?Hfc/bsfr0maxXahMdH6u8XD8dOixn8AcFWCSXNi/+T8N0DIxaal5YLIfZUmu?=
 =?us-ascii?Q?7/fzTns5Ww=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3d41eac-935d-43e5-699a-08dee1e64d2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2026 20:27:18.5946
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qvl6fsR1BIaaiSkxwscKQGn6lew6ZNlqrIzGtQNL9cTsWKWMHmgAY1vI3chdAsUg5XhQPlskWFIyw0QRCoMtEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10619
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-40088-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:shenwei.wang@oss.nxp.com,m:mathieu.poirier@linaro.org,m:linusw@kernel.org,m:brgl@kernel.org,m:corbet@lwn.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:frank.li@nxp.com,m:s.hauer@pengutronix.de,m:skhan@linuxfoundation.org,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel@pengutronix.de,m:festevam@gmail.com,m:shenwei.wang@nxp.com,m:peng.fan@nxp.com,m:devicetree@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-imx@nxp.com,m:arnaud.pouliquen@foss.st.com,m:b-padhi@ti.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER(0.00)[shenwei.wang@oss.nxp.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,lwn.net,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,foss.st.com,ti.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@oss.nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B2E86758B9F



> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: Tuesday, July 14, 2026 3:13 PM
> To: Shenwei Wang (OSS) <shenwei.wang@oss.nxp.com>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>; Linus Walleij
> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan Corb=
et
> <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
> <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
> gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel=
.org;
> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> <festevam@gmail.com>; Shenwei Wang <shenwei.wang@nxp.com>; Peng Fan
> <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Arnaud
> POULIQUEN <arnaud.pouliquen@foss.st.com>; b-padhi@ti.com
> Subject: Re: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver ov=
er rpmsg
> bus
>=20
> > > 1) You did not include messages that mask and unmask interrupts at
> > > the driver side.
> >
> > Interrupt masking and unmasking are handled entirely on the local proce=
ssor.
> >
> > When an interrupt occurs, the remote system masks the interrupt and
> > then sends a notification to Linux. After Linux processes the
> > notification, it sends a SET_IRQ_TYPE message back to the remote system=
,
> which then unmasks the interrupt.
>=20
> Masking and unmasking an interrupt are orthogonal to the interrupt type.
>=20
> When the interrupt fires, the interrupt core calls the irq_mask() operati=
on on the
> interrupt. That should mask the interrupt. Once the handler has finished,=
 the
> interrupt core, will call irq_unmask() to unmask the interrupt.
>=20
> Edge, level, high, low, raising, falling has nothing to do with masking. =
Please don't
> mix concepts which Linux keeps separate.
>=20

That's how virtio-gpio is implemented. It uses a single command (MSG_IRQ_TY=
PE, 0x6) for=20
IRQ-related configuration, including masking, unmasking, and trigger type s=
ettings. Please=20
refer to gpio-virtio.c for the details.

Shenwei

> 	 Andrew

