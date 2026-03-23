Return-Path: <linux-gpio+bounces-34030-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OI5dO+RGwWnpRwQAu9opvQ
	(envelope-from <linux-gpio+bounces-34030-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 14:57:56 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F419B2F382C
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 14:57:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7C0E305D5D6
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 13:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 714033AE6EE;
	Mon, 23 Mar 2026 13:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UfNa2jjb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010044.outbound.protection.outlook.com [52.101.84.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C55A3AE1B1;
	Mon, 23 Mar 2026 13:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774273879; cv=fail; b=cBRNyO289JJPtAMe8UZWMFeb5gAy212rcsA1rsM3cCFcNB1do41okYy9xIlt08d7iN7b+Jjz57HhGMv/UrQV79PM1o1c9MrNC1IYsOGKk/fKbj8FSjgRx/n41bq9Xli9+odGgVeu0yCQa5TS07wfLpYKUKTQQeLj7S1v+yWEK18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774273879; c=relaxed/simple;
	bh=EMLxheDAf5W/XBeTrSPwGPwXlfEpFEdxDDay9gHu2yM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UoSPIkqBk7yYPVVE4iE+ZLznPjOH4WnnKUiwzbUYcOzV5Msve3rEJVqZ2i12dedIuyqmTWHaYzW4satE2F/B1qA/cgwN0Vv5C8fZ5B8O6gpAXx/Pz5wPWEgFnn+5iMVyrxf9baEIg+iiwbncmBUD6I0icbww8RKCuOL0lbBiXrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UfNa2jjb; arc=fail smtp.client-ip=52.101.84.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vsaPT76XfV6M+VogFC/TTh0kRdwSYKz7f/SCL4vXPkErmZZA8BTS0QhGCyvPA4Pa95Whyn8xpekNGm2GXFZZM7qOb0hS+S3bMuT7ZjUkh/Ag9jih7Bi12CUCKrSl45sjz2jdcE+U9TeB19Oltp5wm4h9+JZP86aKiZbwmu3bmNiVmtEJDRyU7wTerwncX5UP+3JABpFkHPUOMMqTHKdwXqlIz8YFjVKv4JPogXgHe36DYKA9bRkQsrOm8xtTHLBUlx3lYPxpvS0D4CLxcT06LXI8Fo47BC6T5BmojkMAbUbAbvc5yfcyAwYOnB4RzEVxExqSXLjnOTqbcJtmdpRrQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3GOWPIVljvKJN7KNFT2U0PYatgsfRiQD1Y7YM77qG8=;
 b=oTUfAn58S+5zXNOxdNMkvc3yH6eCydKq3b56YE1WKyJLnoAIFG60UdG58e/OYzm26ulToUCisCwGh10QQa4shK5BEncz9uDqK91VU6uizU071DMaeF2aytbAlg5PNTy/BVVV6O2OAynePi4FlRpAlhNG/9Ak0WFhnEHPoGXH6AheyX+JW4zBzzoaJ6r5gJFQtRG5w68BNHUtipih7f7j154itIDiBzp9g4LsNEh7iF8nmb/19W183zTyLJrllzOuVp6IWiUAQ0qru57g11AHV/Q/4f1JxEEiZKxEfSn8J82HquTK6aN4nZNixvbx4flNmT+np8dDH/6bZbsPHK8Ang==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+3GOWPIVljvKJN7KNFT2U0PYatgsfRiQD1Y7YM77qG8=;
 b=UfNa2jjbw5XC11gXUP9Asoa8P8zxtNXq2Ziq+UuDBMcLpIyRFMcvqKUadRvNPnNw19FNP6pXjHNwYQFLnVhUQIX2QNys5hpbyu4EUqWmkqRgDM4frYZsj8SlIjxISbCaFE+J4BI+k9cQnt83LKBMdkgryU0ZiQ7uJfYSD2LOL8xxIDcT8roAXayyn3WelihmOjyfu3rJVJpelk/o5+aXlMQn6ps1FKxiUYOZ/NX7KLE0Nw/R7wGkCX0Lxf7+6S6hvcWcJ+YH3mFuUOnNomBIoquOoPntdy34l1mXSEhCi1he5bErO/vKg0j7VkZK29nBXpAbf60gnrP5wePZgrph9Q==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DU2PR04MB8613.eurprd04.prod.outlook.com (2603:10a6:10:2d8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 13:50:55 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 13:51:15 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, "arnaud.pouliquen@foss.st.com"
	<arnaud.pouliquen@foss.st.com>
CC: Shuah Khan <skhan@linuxfoundation.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan
	<peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Andrew Lunn <andrew@lunn.ch>
Subject: RE: [PATCH v12 3/5] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Topic: [PATCH v12 3/5] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Index: AQHcsyPMkrsH1v1X8EObP4AwJRt0+bW8L85w
Date: Mon, 23 Mar 2026 13:51:15 +0000
Message-ID:
 <PAXPR04MB9185BAA70595FB4BE85F8362894BA@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260313195801.2043306-1-shenwei.wang@nxp.com>
 <20260313195801.2043306-4-shenwei.wang@nxp.com>
In-Reply-To: <20260313195801.2043306-4-shenwei.wang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|DU2PR04MB8613:EE_
x-ms-office365-filtering-correlation-id: 223e4322-4d2a-425b-52cd-08de88e3409a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|19092799006|366016|921020|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 4jBgwbXoBXxk0QsVuiu4H3DuiG7O+ez14fBjgZ4O3rM57fF3AmIW+x6xV4tpeBeGWw3jaJLSrh1ftsFL3tFBj8AtuOgUShZCiKAyQrakFS1/I/0OAmB2OHoDz+h5rFDtQa513VfAwl6g6y7eeP4uvEMebzqOuPDEqfr+V6flypdWDxOFOYeUl9yoZGuzCUxeDlML5Jha7zjOAGFp1GbAbR+94ykBPcfZLF/m5BUZe4bBZocIog+lKJDOACm0A7AdYwogZk+eSJt/Pm6zu7MhqOQHSmkQHVXkJfS3eaoIa/gMMVogR3KDun54y5KnfWBwBn97S1lKeuky5F58daFmc/u6vFfkQPIPbj/lF4OP1NUm1Np4NIVNNislgypCVBN+hLOjEThpFb4caEXC4SWpysE9fQZp+w1QF2yX3euu46apFVn2EVdezhyQqD+ISB7jUDBB1BdLTy9rV+vrKVXusINdW8B6vdDJBqmEZR1JQd6x+hionLSjtrG7d5YNSRyl+AszKwJ7osq1fIxLmgKoPlzKc8jjiVkCtxoVlRq8p0xTNcUntRgucSi9aUQdpYYsKWQJHAMsvwW6xQ8NiXw3bAcK4rNXXg0ihdP6zyackw3on5S+K9h0i/OEJ8k4TiU1sk638DXMG/fzbluUw7GM6337ikCr6upns61YUbVyPW2BgSZs+k3X7p6ZPjncgC36LulVj2vEVzuI5FrebS6BS7KCxGghDtFN6+gywqpAoZtFCLn7LgQIigQRzOM0FfGAvTnwUXBmzYaqWz5vj6dux9AyAEXSs5nsOSHQlYFODDFJVzIDTDHwAWa72bSqBkeP
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(19092799006)(366016)(921020)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?J/kTa1zOjBVyJEvDi/NeqC+VoNgs96PuNLy9bIScK4mSUTh6bb9wnpRLcKCT?=
 =?us-ascii?Q?xvxuRMWTAAzTxonH5nYAsXWJ6ODtBK01sYOfATTeCNUJi8SBFHNa91IqSxF7?=
 =?us-ascii?Q?aV9phS/BNJg0alc2DG46vXD8bfaCLYlK+IvsBKuYl8jNYo6A/lVSKQMabD/t?=
 =?us-ascii?Q?g+U7yQ373SAwGu86r+pimgrH8YF03Peg8cWgVrErByuxXGKPoKCzm0/G2igR?=
 =?us-ascii?Q?nTGFuYYc5m5inqnUHEIww2cpd31QTvI+CcX2qTxRy3VzqGTIdx6/DYRnEkKv?=
 =?us-ascii?Q?1odFLNR/CSQ9IZ2HIKgkG1tajnD+Vprg/suARwlHIKQo/uDI7Aav/E1VdJEC?=
 =?us-ascii?Q?ix/adUkg9HfgLU56EJROyutIdCf6AzPVMMu0UljXm+nmPVh0x18uXdEkGT1r?=
 =?us-ascii?Q?oQZv4btwqlb3pJ7SMQl5BXt1/7ep4rK1pFpCq6vAEZYfapf3z/rtP9GL7+9P?=
 =?us-ascii?Q?MaCnjXG6dJEOiBpF+/2U9C+16vAAjUbgQSpF0dklAufiRXfMbFt8PYhOUMRC?=
 =?us-ascii?Q?8nyc+grmxu0QZK5ke7eKzTYmQErXYuFwAN0bsuAu8RlELeCuytiM7c/dSa63?=
 =?us-ascii?Q?RClgXuUF0EpKBLqMkWsONuKgwmCAOMnz0cEo2Gcqs64OcN7YtZ5pnbKPaXf6?=
 =?us-ascii?Q?HoB6RYK9IuCcFt65nZR1nIlJ8/+PNfB/jyYv4MdUbOXiLBeyFgABJkCWRkUs?=
 =?us-ascii?Q?1Jw5TyuwrMiPfiGu5OmJ87tBbz8Q3F/iwvNkRzrWU97Q8YfMWCHOmEN3VbGF?=
 =?us-ascii?Q?FgRoGGPAYWhT1PyYED1JbAZKoXPpqeDgi7i6rjc6kM9XyI05pSjb5MibEkd+?=
 =?us-ascii?Q?Srzonn4VBqTPXoveWI+iMOoUFfDBELNDlmiS83k5eDQsqyvOBBjf0R9KXC5G?=
 =?us-ascii?Q?pCURpZuPHsPQzzLrjDDe32KADgeSS6z49g3PZwsO1oOb+Lm2W4iKw/W2S1Od?=
 =?us-ascii?Q?FafV+583UjFdScJqnlfMiHOF2MXZ2aAlD+2RMdX83LT/mR/TgGbWmYfbgDG1?=
 =?us-ascii?Q?34Wb1r+mFAZZ/vZhiOxzkuKWyNZ9IX7wVtWdefayEy4u87ccoTlLfwgMjlo5?=
 =?us-ascii?Q?8HUmw4jy2NmgN4YYt4ri0+Qg6kzsMU+HAkKRFkKGTbPnjN1hTXPLuVTLECqE?=
 =?us-ascii?Q?omCb3r12wF5qToyq00azlnZ7bFckRQn9xl6vEfUN6SlavJc6Pbi2ySaZPudQ?=
 =?us-ascii?Q?okJL8EBKqulbr2UtKs6zJvI6v7g4J6bxPBMk5FXF3xP2LI3xOk+n0YdQ/DHt?=
 =?us-ascii?Q?7gfCJpSisM3M1yyv6GH1NWxvzsiZ36KKtE5rBNJDwTlRgpklDlGste+CJLF2?=
 =?us-ascii?Q?j76gfhpju/cbe/+APC1KDHyQ5CyjJGgj2yIBzWvj9dRUICkHtSmXa+DfQtdI?=
 =?us-ascii?Q?u94kKSE0B9xiuaN/g7nP/qdca51maxjbj1VpcfClipowLImHcemXatf2LuLm?=
 =?us-ascii?Q?OT2iJE5lPPGPabmGa8x6cyXxNuiqHx7I3OkQ+ze5PlJhMQ4lmBEH7CCE7+0l?=
 =?us-ascii?Q?sjvxgKMJiyav2Qa6UBREP7zk67Bpl1RfizwHwG96yfdkaLM7/2FS4e9DKCBi?=
 =?us-ascii?Q?P/bH8eqtcQrZYVdO1b0uh/+HREPXd3+lyYtV1XBxeVwKpHawPzCNKvNws6Y/?=
 =?us-ascii?Q?7z4kLPhFdhGnG/KIiZ+FtB7RLdcJEtWrOdyHlzRcHBVBTQkApQ1Y2omgVrzV?=
 =?us-ascii?Q?ad6+gZhm0i4KQQk+Kz6jlIcIjjfu6OfLmiTvoD8OFX0c4XWC?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 223e4322-4d2a-425b-52cd-08de88e3409a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 13:51:15.5640
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hFIUx9M3hFwnGOwehCjDnNel6QvH8CTlk1s1S10OXxTPHnniBGGtvovQM9k/aZ0/TLjDzZGkCMLic2nx5Hc+xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8613
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34030-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org,bgdev.pl,lunn.ch];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F419B2F382C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bjorn,

> -----Original Message-----
> From: Shenwei Wang
> Sent: Friday, March 13, 2026 2:59 PM
> To: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.o=
rg>;
> Jonathan Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzyszto=
f
> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn
> Andersson <andersson@kernel.org>; Mathieu Poirier
> <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> <s.hauer@pengutronix.de>; arnaud.pouliquen@foss.st.com
> Cc: Shuah Khan <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; l=
inux-
> doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel Tea=
m
> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Shenwei
> Wang <shenwei.wang@nxp.com>; Peng Fan <peng.fan@nxp.com>;
> devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; dl-linux-imx <=
linux-
> imx@nxp.com>; Bartosz Golaszewski <brgl@bgdev.pl>; Andrew Lunn
> <andrew@lunn.ch>
> Subject: [PATCH v12 3/5] gpio: rpmsg: add generic rpmsg GPIO driver
>=20

Since I rewrote this version based on your earlier feedback=20
---
"My expectation is that it will be better to just have two separate
drivers - but reuse all the design-work done in the gpio-virtio."
---
I'd glad to hear what you think about this patch.

Thanks,
Shenwei

> On an AMP platform, the system may include two processors:
> 	- An MCU running an RTOS
> 	- An MPU running Linux
>=20
> These processors communicate via the RPMSG protocol.
> The driver implements the standard GPIO interface, allowing the Linux sid=
e to
> control GPIO controllers which reside in the remote processor via RPMSG
> protocol.
>=20
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  drivers/gpio/Kconfig      |  17 ++
>  drivers/gpio/Makefile     |   1 +
>  drivers/gpio/gpio-rpmsg.c | 596 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 614 insertions(+)
>  create mode 100644 drivers/gpio/gpio-rpmsg.c
>=20
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig index
> b45fb799e36c..cff0fda8a283 100644


