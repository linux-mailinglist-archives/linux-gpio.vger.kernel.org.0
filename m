Return-Path: <linux-gpio+bounces-35809-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KI7H4tQ8mlGpgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35809-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 20:40:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2052F4993D0
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 20:40:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4FF8F307C837
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 18:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517AD41C2EA;
	Wed, 29 Apr 2026 18:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nOlu+i5l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013037.outbound.protection.outlook.com [52.101.83.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2C43FE356;
	Wed, 29 Apr 2026 18:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777487756; cv=fail; b=Vvnudi2uIsrekyfDk28WkKkkcU3Wf3N1D62RCKkWF14kOE+14VxfL8+S/lPBluaZf6Rvv+bgi7WercjqPcrPZUhrJp9X5wx+PtPGu3loupBAsfAtoFuVMyT8id+ZRb65v10OaUc4dcFe7voR7yJ8ibJx/3aPRIZvSKBXDJNX5LA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777487756; c=relaxed/simple;
	bh=sO2Fy1rNDw9WrUntnjWn7nQz7cA2UhPAXGbDD6VF/Wk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=by01XFVAKKycOq+KuzIdWPa7ho0zFlVtISiC3wePL5z16OYPJ50Q/FUnz4hlsZKc7Q0WQwvEaP5hcTAqvIcsXt8Wx2iU6b+J/b380W/vXFVOiTx3FR/YCU6WQTqAiu2lp4HGTtUhMHFCf0BGGtamVy5c1q9HxArVnQC8/A3S9ew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nOlu+i5l; arc=fail smtp.client-ip=52.101.83.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pkCgUMd4aR2eV8eYCLJ1QOyhObD068KIJmYB3rGW2d77aug/1V5vK7jP5YmlupMrHrSnE2oKCK6SuDiC7hgXFyYs5arDer9nblRfiRHM89PwNvm8i6E0DwrKlukthRzTLL11ttJyYLaT/jZahdcnTNje02QbscBoaKzY/O2fRoz8bMru4vwK/YzrY4pL5Ih2GL+8cVvgpIVUjohiGCTzFF13CqeNQrjICz9KNWxNLt4xi18wXs5d3Rg8Jyj0j6pPL9qU24ma5B36P8J329zHWb3B6PKBFzmzer2PSRtC43feHGiFNu+YYKDKrQmfYm1bHglF10oV06uZG+UEfHn5cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/JJTvb3vhk6xWYYD2Cr+khjCdpL7i8HUIwblOyxPyY=;
 b=cODy2JVJR5eodAztfr/mLC//oGE9LU4RgBnzEDL2psuW9BXVDeF/t1MaTeSoBohIeO5xJlp0pUOpU7u2EQpaBnRlNzL/39G6QUDDojUwnXgtbZ4EhGC6qW88OxDRsq/y7TYBMEwLGAL74DYptHCupgqaq0SmnbefwGJBNSsJbEoPVIW7n7zpUVk6CSx0PvVhKPGSJAEICU5arFwFN+NIU90q7UFo42+46yi8GW7L8EDiTnkXvdwUJ3CoU6w2rk1oxjf7VRP+60FxogMMjLWxrHRj/z1bxIsPkHmRn3w6HNGkjQJF+gpG30Kp2Yfv5FNlh525F6upXJnS+dT52HF60Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/JJTvb3vhk6xWYYD2Cr+khjCdpL7i8HUIwblOyxPyY=;
 b=nOlu+i5lG3MLod42tyfetIbE/VRfNNEcjetJUqVFeRpw3imQ1nGF2oDhntygvAYq04t5CGGDXk0WVq6wMS6GTCovgBHXfSgQNzMe/8p3IrCFoOcSpV8OfjBAbm9Uh0YtX296zoJcvLP57gD1SKo3dD4//4zC2IeCg6a94JpWuro4niSjF68CkP4bcljS2uXgP3QCb9SRsbnpppnRgFqaqmTxxlZgUQK1QIU0Auz4CfTgs2nfsEUTxGIRmBVjKQuH9F8YOox4lLtZHCx4YnGT4t5BdubvvIiVwdxDhKzgKkRTa+/qQkIH0ZyI5N8wc+Zn+p+n7FHEUr8iJFoy/4iHXw==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AS1PR04MB9431.eurprd04.prod.outlook.com (2603:10a6:20b:4d9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 18:35:49 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 18:35:49 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: "Padhi, Beleswar" <b-padhi@ti.com>, Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: Andrew Lunn <andrew@lunn.ch>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Frank Li
	<frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan
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
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Topic: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Index: AQHc2AcAk5SKamcU7UqUwYvVlk/VOQ==
Date: Wed, 29 Apr 2026 18:35:49 +0000
Message-ID:
 <PAXPR04MB9185EB2DA65F8851CA16CE3489342@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <20260422212849.1240591-4-shenwei.wang@nxp.com>
 <22fb5fac-2568-42be-a7e3-7e89d0017eb3@ti.com>
 <PAXPR04MB91850A11C58419C03909145F89362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6412a758-4560-4cf1-a0d0-5b24d1a715f1@lunn.ch>
 <PAXPR04MB9185009A17DFDF3D6C8B44E789362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6e01e114-e336-4744-b6b4-563ec42e321b@lunn.ch>
 <PAXPR04MB9185A098D894B6A6EBCC13F889372@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <afImuoeHolxGgw3H@p14s>
 <PAXPR04MB9185F2F6DDB55AC56C92D63B89342@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CANLsYkwvL0Z3+12MD=J+Dc2yAU2T8ypizyG=6AhYoWOh55odHA@mail.gmail.com>
 <472f85bd-42c2-40c6-abfd-b76924797069@ti.com>
In-Reply-To: <472f85bd-42c2-40c6-abfd-b76924797069@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|AS1PR04MB9431:EE_
x-ms-office365-filtering-correlation-id: f1e809d2-f153-4ca2-5e58-08dea61e2291
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|19092799006|366016|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 6+2h5FTmit7ZnlDoXepdxq8UnZe9My5SPRb+u2MfHU4VjcBgKj8cVo0WK6ftebXH4MYsDH8oJq9lNnmjkQptit7IcTe/C8mNy8ONbkPAH1q8yZQFuzvl5LTXYChMtjjSEyubMd1EQ/ijfdH9OwTH6+CpvyuOVlGIweuRCbc6U/biJlBHrnBH+oIL1rPb5ADRqjXLvWNPCMa1mlOQqQsiAKaFvgf0AqY/8r8OyVr4dfJ+hxJpo4yGZ4Lfh0fC8PhDldVzXa6y/o414MuP/g8BQhQ3y8wSMsSK2Mto1cKYTuLAd89HBFgkYRHuWotw8rzTmq72v3RBW3F6EHnV0GzANxLsSqIOwYghgcoO3I6GkvuhZcVkHXzBigVhyhX2p3CshD4PIFbaKe1OAczG02kuAS47FMM4JVEQ808T9YaSLz6gz7v6rBTu1zR+jFBrYo3hubgTZzCZQ6Vx3RMMEJIVPtnUnZjqDetAZQA0AP/FOFRPvrV2weZ2yCXKoNQfyADI5bRby39V8O5EvDNQ7uWDaSMi1JvWpddeluhv1FbWxtcQ162DgXYhatJBBsobGo7uxzXDEynT6/wlFbDrjdZb4U8nLh3NqC8ZaNE641zReib3y6/sfH9LQkYH8fsCBYKNae8H/xToAW1s3EdWnK15ePWFCiGlGCSwAX2dT+yYEQw+NueipXndXQ6FJxjlNgIEKX5U3WTaC4h6upeRtfn6vLydU9F57Rgb84Bc/MkBBjo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(19092799006)(366016)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?G0hYW8SwZFhpZQ4eS9UBY9bzZWY4I6pUvhAePvHd6fELrU6Tjzr02iVrFmlQ?=
 =?us-ascii?Q?yzSOeBlq3OyBvdh8hqGrIcpkBw0CnlhEPp+EZEdMS634UpZaHcLg9lbHSgJY?=
 =?us-ascii?Q?eWgB3wUdssfzsNpX/0BAxtB4tp74Feyys9fNin4aLuU40KXCGSn/HAzbVMX2?=
 =?us-ascii?Q?oqsjtjj7r2xav81TfQ0wmvWsQDY76hRzaVpb31BVoQb26iTThCzppqRiEAYg?=
 =?us-ascii?Q?FkgTpEwf/Q29mYPIuqVWTTtiIVbldKFwpvgd8ttW3lQ5qi35A13THbMtSBNR?=
 =?us-ascii?Q?FovZuM2Y8C4ndaNBuq6XmBVf1hZlqSd7t2Ku0Okfi3mCKFAqJi1N88sNDIkY?=
 =?us-ascii?Q?LuxWb5Bde02vaFgAJTp57ZJbY4+o07zhlJpgCwux6/MahQdqzuCNya1FBlSE?=
 =?us-ascii?Q?gutspIm/wqK17U8Iiu9EHCoX1Rcwxf5w1j6+ha9V/SoMEyjtxoSWkEkTJea4?=
 =?us-ascii?Q?56/N+DFDyQiyBRdbhw4ksFWvYKCoQ17g7ss6KNfYVWWZVx8QUwKN4ehnV7V7?=
 =?us-ascii?Q?Wof+8dhp6bnxHubY5u1IVBqhpyhO2e9TAQ9Jg6F4kYa4P0AVv0XR9iLenuJ9?=
 =?us-ascii?Q?C1mAURfsyzHbTlU7tNQ1lbxO2oN4ZeqGsYXi8o2m75DS5E64b/Q8HOQEKkVV?=
 =?us-ascii?Q?5kecRWRWgRcTsjJZgtHDtA+ii9Zzg2JbuBeTkOu4BE0MuVHhW1ERRhKkq3Rb?=
 =?us-ascii?Q?nmMTR6MVvjrAShiZksXVjmV4nhw9LKpIGAKZCBh/9Ovm1Qy35NC/y1d37Vbj?=
 =?us-ascii?Q?AuQcXq/Ue6RrpjPs0uWaRoDEgJZ6tn6UIPfO/+v1gtpI/c7nibhJ2CIuumvQ?=
 =?us-ascii?Q?Z0mJSKIeNmaSUgccBSlY78QsF+4MuXtmlE6wpC8MpfB3xzlxdBVc8Pi5YAFy?=
 =?us-ascii?Q?EZOYsPL7mrl4FHBAF7eQZh5bdzET0ZOyI9IJIsjCS7I44Dbg0Qr5e3RO/ajc?=
 =?us-ascii?Q?J2CplOrlNw3PjhfmDvmgHbfii3HjmNlY79gpgOdYtat9Cfl6ACG5snpQLw2O?=
 =?us-ascii?Q?hg+673D2oqR51bM16cZVxSJETo9WifT5LjzTs/sHvowBb/zovhvtPwySjOYP?=
 =?us-ascii?Q?/NfFWLjMUZ7gFGPTEdTOSiHBvmTnhHCTJSty9XQl9DdHFfAEaRN3fZU2DDO0?=
 =?us-ascii?Q?Yno0cNN8cF0qqFD6WgjwCDr1SMQxvf0QcvMTfAOBOawtPrqzWC6nTJEMo2ds?=
 =?us-ascii?Q?g+7Fzctp9BHBm1chcPzU4tKkeYf4KroS7f0KkyknIG/EnfKuciT4+qHlN9kX?=
 =?us-ascii?Q?AjR9NEoZ18e4rS7b3lh5a54Mv37+Qu5OHcF6AOlH6t8M0y/IW7GeHuG+uLAn?=
 =?us-ascii?Q?HDIuih9WFTd1UizlQUsmL5OFZTPDPNQAgAEwoB2CIKjrpvlWHF971YHudpKK?=
 =?us-ascii?Q?RQY1e9qws+Lq44LYZADAQDXW65kNDeH2obhEsc+QQYiXW6111AmtgldtxqHj?=
 =?us-ascii?Q?alaBjiIii9WhYywVCa0lOg2yjIlR0OhCpY8a6SktXGak/LAB4OOr9rDuLb6s?=
 =?us-ascii?Q?WrbuMQBKLeOW5KDtV2niAlELDuCp7d8nQAkUD8Dc9+RFgOKVw+CHHILItER0?=
 =?us-ascii?Q?amDjQgHy2EW5cJTz/ZYTwWkyQ8E+NY1h+iDHX8nvJddLKG8dJO7B4SjP18ju?=
 =?us-ascii?Q?lNGW+CMk9qZjNlcD8Tb+sx5/vxo4baWzbgqGWw9pQtIDl0QB4mmNOL2zlwTP?=
 =?us-ascii?Q?2mwAGy3NB6GhTEoqrAEpJjp/vy11Rmv/gf6KKOfqw3OfInq9?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e809d2-f153-4ca2-5e58-08dea61e2291
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2026 18:35:49.2344
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q/r8LGGkINcWSv13QRGvuOjFT2hgjw4QN9p3C0V23HKeNw8YpNrBbK//0UA9A5TpdYJeW9zdQnKhCzU0xzifkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9431
X-Rspamd-Queue-Id: 2052F4993D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35809-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[lunn.ch,kernel.org,lwn.net,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]



> -----Original Message-----
> From: Padhi, Beleswar <b-padhi@ti.com>
> Sent: Wednesday, April 29, 2026 1:07 PM
> To: Mathieu Poirier <mathieu.poirier@linaro.org>; Shenwei Wang
> <shenwei.wang@nxp.com>
> Cc: Andrew Lunn <andrew@lunn.ch>; Linus Walleij <linusw@kernel.org>; Bart=
osz
> Golaszewski <brgl@kernel.org>; Jonathan Corbet <corbet@lwn.net>; Rob Herr=
ing
> <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; Bjorn Andersson <andersson@kernel.org>; Frank Li
> <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>; Shuah Khan
> <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel Tea=
m
> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
> Golaszewski <brgl@bgdev.pl>
> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO dr=
iver
> Hi Mathieu,
>
> On 4/29/2026 11:03 PM, Mathieu Poirier wrote:
> > On Wed, 29 Apr 2026 at 10:53, Shenwei Wang <shenwei.wang@nxp.com>
> wrote:
> >>
> >>
> >>> -----Original Message-----
> >>> From: Mathieu Poirier <mathieu.poirier@linaro.org>
> >>> Sent: Wednesday, April 29, 2026 10:42 AM
> >>> To: Shenwei Wang <shenwei.wang@nxp.com>
> >>> Cc: Andrew Lunn <andrew@lunn.ch>; Padhi, Beleswar <b-padhi@ti.com>;
> >>> Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski
> >>> <brgl@kernel.org>; Jonathan Corbet <corbet@lwn.net>; Rob Herring
> >>> <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor
> >>> Dooley <conor+dt@kernel.org>; Bjorn Andersson
> >>> <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> >>> <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>;
> >>> linux- gpio@vger.kernel.org; linux-doc@vger.kernel.org;
> >>> linux-kernel@vger.kernel.org; Pengutronix Kernel Team
> >>> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng
> >>> Fan <peng.fan@nxp.com>; devicetree@vger.kernel.org;
> >>> linux-remoteproc@vger.kernel.org; imx@lists.linux.dev;
> >>> linux-arm-kernel@lists.infradead.org; dl-linux-imx <linux-
> >>> imx@nxp.com>; Bartosz Golaszewski <brgl@bgdev.pl>
> >>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg
> >>> GPIO driver On Tue, Apr 28, 2026 at 03:24:59PM +0000, Shenwei Wang
> wrote:
> >>>>
> >>>>> -----Original Message-----
> >>>>> From: Andrew Lunn <andrew@lunn.ch>
> >>>>> Sent: Monday, April 27, 2026 3:49 PM
> >>>>> To: Shenwei Wang <shenwei.wang@nxp.com>
> >>>>> Cc: Padhi, Beleswar <b-padhi@ti.com>; Linus Walleij
> >>>>> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>;
> >>>>> Jonathan Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>;
> >>>>> Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> >>>>> <conor+dt@kernel.org>; Bjorn Andersson <andersson@kernel.org>;
> >>>>> Mathieu Poirier <mathieu.poirier@linaro.org>; Frank Li
> >>>>> <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>; Shuah
> >>>>> Khan <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org;
> >>>>> linux- doc@vger.kernel.org; linux-kernel@vger.kernel.org;
> >>>>> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> >>>>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> >>>>> devicetree@vger.kernel.org; linux- remoteproc@vger.kernel.org;
> >>>>> imx@lists.linux.dev; linux-arm- kernel@lists.infradead.org;
> >>>>> dl-linux-imx <linux-imx@nxp.com>; Bartosz Golaszewski
> >>>>> <brgl@bgdev.pl>
> >>>>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg
> >>>>> GPIO driver
> >>>>>>> struct virtio_gpio_response {
> >>>>>>>          __u8 status;
> >>>>>>>          __u8 value;
> >>>>>>> };
> >>>>>> It is the same message format. Please see the message definition
> >>>>> (GET_DIRECTION) below:
> >>>>>
> >>>>>> +   +-----+-----+-----+-----+-----+----+
> >>>>>> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> >>>>>> +   | 1   | 2   |port |line | err | dir|
> >>>>>> +   +-----+-----+-----+-----+-----+----+
> >>>>> Sorry, but i don't see how two u8 vs six u8 are the same message fo=
rmat.
> >>>>>
> >>>> Some changes to the message format are necessary.
> >>>>
> >>>> Virtio uses two communication channels (virtqueues): one for
> >>>> requests and
> >>> replies, and a second one for events.
> >>>> In contrast, rpmsg provides only a single communication channel, so
> >>>> a type field is required to distinguish between different kinds of m=
essages.
> >>>>
> >>>> Since rpmsg replies and events share the same message format, an
> >>>> additional
> >>> line is introduced to handle both cases.
> >>>> Finally, rpmsg supports multiple GPIO controllers, so a port field
> >>>> is added to
> >>> uniquely identify the target controller.
> >>>
> >>> I have commented on this before - RPMSG is already providing
> >>> multiplexing capability by way of endpoints.  There is no need for a
> >>> port field.  One endpoint, one GPIO controller.
> >>>
> >> You still need a way to let the remote side know which port the
> >> endpoint maps to, either by embedding the port information in the
> >> message (the current way), or by sending it separately.
> >>
> > An endpoint is created with every namespace request.  There should be
> > one namespace request for every GPIO controller, which yields a unique
> > endpoint for each controller and eliminates the need for an extra
> > field to identify them.
>
>
> Right, but this can still be done by just having one namespace request.
> We can create new endpoints bound to an existing namespace/channel by
> invoking rpmsg_create_ept(). This is what I suggested here too:
> https://lore.kernel/
> .org%2Fall%2F29485742-6e49-482e-b73d-
> 228295daaeec%40ti.com%2F&data=3D05%7C02%7Cshenwei.wang%40nxp.com%7
> Caba62d7a899849fd57f708dea61a1d8b%7C686ea1d3bc2b4c6fa92cd99c5c3016
> 35%7C0%7C0%7C639130828278097401%7CUnknown%7CTWFpbGZsb3d8eyJFb
> XB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpb
> CIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DNLLYQ0NZCnYKLT%2F2OMDZE
> SKgC%2Fme3FoUNqqEGBOIY2k%3D&reserved=3D0
>
> My mental model looks like this for the complete picture:
>
> 1. namespace/channel#1 =3D rpmsg-io
>     a. ept1 -> gpio-controller@1
>     b. ept2 -> gpio-controller@2
>
> 2. namespace/channel#2 =3D rpmsg-i2c
>     a. ept1 -> i2c@1
>     b. ept2 -> i2c@2
>     c. ept3 -> i2c@3
>

The GPIO nodes will act as providers.
Mapping the port index into the service name is a possible solution, but I =
don't believe it's better than
embedding that information in the message. A stateless approach feels simpl=
er and cleaner overall.

Thanks,
Shenwei


> etc...
>
> This way device groups are isolated with each channel/namespace, and inst=
ances
> within each device groups are also respected with specific endpoints.
>
> Thanks,
> Beleswar


