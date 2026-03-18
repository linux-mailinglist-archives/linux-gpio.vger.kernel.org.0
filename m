Return-Path: <linux-gpio+bounces-33773-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJRVFdsLu2kSegIAu9opvQ
	(envelope-from <linux-gpio+bounces-33773-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 21:32:27 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2FD2C281D
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 21:32:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 869B130547F2
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 20:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7284C3559F5;
	Wed, 18 Mar 2026 20:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YafgB2lH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012030.outbound.protection.outlook.com [52.101.66.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFB61F192E;
	Wed, 18 Mar 2026 20:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773865901; cv=fail; b=YKzydwpZxeIvTDwBxkatgKMZBw0h4g4dLQWPnXfA+7WUNitl2Z2j6Mae7Odgb7lBgvkPHVU709UO6JNuz8GSkjHVea63rtBj9GCSVJJgBBed49Lb5fyt5mRYDDyWGuEQpMTZCACizcs5kTneN9xm3r8ICeppQ0BJb89PRx0nkFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773865901; c=relaxed/simple;
	bh=xqU9nIRbFtP30Ff3s5jmciQ8rMaqL5AJIkkr2DLUzoE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TkOHpU2gQPXGLZ6C3dSWOQ1CyZgQXdwvFa91mXk3xt8JdiqcNQtDby9HMWbxjHHozVa6TJnIfLgNzDa3aUzWR5Gq+wmK27854yqFalO+JkWy3S4yhicEGK9s7OO/Z7kbqgGhz7MzdmuL8LFGcqw1xviHJKjslYrobnjoVqXJA0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YafgB2lH; arc=fail smtp.client-ip=52.101.66.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bqTS/RcNmXzx8/RwSq2oSn8LiQqzdZinW9hx+mPDT9PRBHJWK469Xk8eFQNzx7msZFeCmxPlyu7oJn2oVwUabxkdD3ZVx8kR5kiuOXo9idu7Hk4HxF4r6FGWe13SewQklyp50Wj0hCRgGBCBtoen/EYDzT7a9hS1lyKOAE2MQU/YIyXtsNBfOOh8D/m/DpNMw1u/gZWPFsc4uptmFQBl++fmCrDk+m4/85G5FYiwZL5dghWak2AEyA2RJbRVVe9QaiS0kNgnfoUvDPkWdQHH+70l3qAtDHJ5TPG6YWdFymihUWlEKC3HKoY7il5q0+gX8U56x2uBfVQ3vSspXPuWlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pLhJYlxCJgDWRjAQUzzveso2sf/La7jmNEom+59cfCQ=;
 b=eJ7dvoy2EvBeBEjOxRAedUrEXLz1xClxtjEh64VWAj8KV12cLz6o5shLUt0iJNxL2wdcr/rr84Ag1e3l6leo3LDKhf4AZvM/6y55rSo45lEIBgCXnKUafrFI2g9JtRyO6V/3QNuPf1AAPJvYrlhHMO9x6ktb5A0kIBpNzdFtrw03K6plom4ie+tZ6lDmBVhDpZVaCtXvnzT6gmIuJDDr+qdRX4ROguzSuDYjfe52xSISSG5u2yb7SUskqMsrmEwySyLvExJ3PlK7TGGvqdby3j6UPFUQzbsFsai6pwq++coLTp4AFDpUej+s49cbF3bUBn7NAYTG8SvQwS4ZiNvCag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pLhJYlxCJgDWRjAQUzzveso2sf/La7jmNEom+59cfCQ=;
 b=YafgB2lH+bF1NG6oQwnZV0DDhCxglh26s0MoQMZm+c/7omHuin1sSsN5cJ6sgM2BGp+Z+vLiJDiJWIAWuDlgLvZBS0w0jkWhGDLE8AfFHrlDDK2tsTtN5XLyqWJ+2WHs9ku25g6Y1WpQkL8ww/NN72WTFYnTlPPSUk30x1F72jFMk2hq2H6ln3iRvqHiDaZAVBeWgnPmdnV98GkZO6tPRUVpefhbdbOD967il98nOHZT+QeH/Bo+VU51CxGZBWi51nGUvll989CXIBITfJNmQjLzbhlnsds+QvX5DptDsWO9b1RhqK2H1rudCQphVhxJu7yaEZGfU3EEuD5/lg7Ecw==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AM8PR04MB7267.eurprd04.prod.outlook.com (2603:10a6:20b:1df::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Wed, 18 Mar
 2026 20:31:21 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 20:31:33 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Mathieu Poirier <mathieu.poirier@linaro.org>, Arnaud POULIQUEN
	<arnaud.pouliquen@foss.st.com>, Linus Walleij <linusw@kernel.org>, Bartosz
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
Subject: Re: [PATCH v12 3/5] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Topic: [PATCH v12 3/5] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Index: AQHctxY1ed+Ftf2mHkid8IKFzlYzOA==
Date: Wed, 18 Mar 2026 20:31:33 +0000
Message-ID:
 <PAXPR04MB9185B4663623FED129A90A4F894EA@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260313195801.2043306-1-shenwei.wang@nxp.com>
 <20260313195801.2043306-4-shenwei.wang@nxp.com>
 <2aa1d063-181f-4145-9f1f-7e3012c4d0af@foss.st.com>
 <104e9861-bfd4-4e0f-8967-a849edf7e6fb@lunn.ch>
 <CANLsYkx6KhspTjzpk51ywfgWcf-FR7-3XrH=MmBi_W6yZmMukA@mail.gmail.com>
 <PAXPR04MB9185E1D7543DB60DE089423B894EA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <ba563541-f6c8-451b-8967-2c5c9199b231@lunn.ch>
In-Reply-To: <ba563541-f6c8-451b-8967-2c5c9199b231@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|AM8PR04MB7267:EE_
x-ms-office365-filtering-correlation-id: 90bd49b4-1fd4-43ad-26fa-08de852d5879
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|19092799006|1800799024|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 SNL1vIsgBjBeWdt83gbqOsDNfzhLf46OTZTkt/yW7cSyBut5iVQj2cH80OukNr7o7subIJh59aWFsjAajAtfbweOHYtISoQQtWpg47n1kSmnM++T3FcWKsNQvWOqSZzYQoOSq/RGk8Yr36/dIG4zV1AfM3wFSk6MQaMtRntn2nLHrVywKIYXGSTEfhasbjQ59VCspLP+LjXmD9bVhvsshKiLij6wvEUUTfoQsbsEPOphCVSdfTjLO1/3A8wNJ+8jVA7LpyX8xb1QagvWdwQrYSteT/04qBf7ZmvCQ5LotFYhCN7XyNHiMCCHsf6IxfzB9JBZT8ad2wcxQbYubJh51zVbM5qL+gi6qpjXIQzdAYBbh4phFUHZiqlAD5ZriOnukfP908ymM+iTp8fptlGhQ9pwfmR6DhvOsoguw7SWyVMDS5u4WZTA1td2eINcKrDBMnRWaAD4UUzboKG+L34nm/zvLqQ6jV5hFcIcuYjttQK1unsvyBLzERr7LHSLvAgk9J01VAQjlZTcYw60VjpMFwnx8Tmb1lNA0whCl3VrBVRa3bKH8ve+hVdek2uRdxHsTw6VRFguNZy9ai8kdEVQMgkkzuKtuMOiz1GCBqYbcckCblihAFN5pVSLZblan3DeNsFQCA98LZutIN1W7EMc8qn+6Kr8V0ceTutBMzW88sa8OQNTQlydRSar1sa3DY2mXNmm5d5/DPgGyR35bx3cQ33+0iz53sYJsETOtIaBkGpA1otmLWYgPs+Z1dhGtjg51fsaPzqN620WaAUWbK5UDcLUeZIF0K/OfBi3TChnsjA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(19092799006)(1800799024)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Jbg7EnObsTJhuTvWL1XFQCwBUBIJ/WMw0Ja+TormiojI7tvvwayvUgvb1Tie?=
 =?us-ascii?Q?DqRG12TQD2CiM/K2lKo01bqhKFYH2rVV/l1HkhlGm4b6tlPcA1H1JVQcb2Z4?=
 =?us-ascii?Q?Y/DQA2bdl8SvwXrGC1IGSW1UeE9ZmbB+z69JYQ2j5+SbXFanT5+QokW5+g1B?=
 =?us-ascii?Q?Hzo7C9+8AoEx1An8FcV/RBhlFKWowDju1WlMetBThtZL0RKZdCSWMRBevrXk?=
 =?us-ascii?Q?tKUTxksZjkPrH3g6vA8XU2t3nSCNN4xBQxIxqO0UbO7l3LNfJVd0ORrEkZRo?=
 =?us-ascii?Q?gCyyTjzlIDb7p98oTWGNrdCcCt1YUUJkrX5oD73lXfZwb//XUF98WOWKUxB/?=
 =?us-ascii?Q?YfrFBqyuUGdIFjv4Vtm0c0CM+Z8FJ47zJhZSdr5GOoamYD0YCwFQtmdHYQVS?=
 =?us-ascii?Q?OsWI48pbY5y5CWWHsGUfx2po6CrTnsGFz4c5iUscJcm11lAgmeKhvZHAK6mo?=
 =?us-ascii?Q?aCyIy/ByqjF8/ZvwUTnju7iakYdlPdtiQzloQb0H46JELZMrBYnlSDmsQp0K?=
 =?us-ascii?Q?UpF0OhzsC6YsBq9v73P7W/qi41/vefck3lBvVUphb2pKTCpnYOKSgErWYJll?=
 =?us-ascii?Q?wa8FgsDi+JEVFX35ptnozCgwWm7ZYMRCpjsOPXv0tA0FDxvb193xny5WKQvI?=
 =?us-ascii?Q?94Nm+hccDqsltEL5yGjPV7GneJ8BPe1pngmHmAj45NzSyiryf282EqwnLIZ0?=
 =?us-ascii?Q?oE9jkbxs2dgCcGnvBVUJXSyQae/D8pa56vr02js3bO2Mdipa2PRac4HVkLoo?=
 =?us-ascii?Q?iYZtJESipEujlOvIRpBUrod0mwsa79IHVXwpvJSm72gLYR1Vmkv0kej9QMwD?=
 =?us-ascii?Q?vh54whWKfLEOib6ozm5jv4/YRdWtBg85asUR7/3tiZBueD7QpDvNhngGBElt?=
 =?us-ascii?Q?dzm/Esxbf4KT6oB9hbHiUB8bz0WvdXC81tvjvmYSQoA/gShgfTLRbxWBsdXm?=
 =?us-ascii?Q?+n1RqrbqWJwcdAQL7jMEjpFNAr1kdA8wZBc7HaeSsfex1uffPoPA6kgq8uB7?=
 =?us-ascii?Q?lf3neK96yqx9tC2B6Ny5xaak0B9BXwOBvWY3A7fi7RZA3hDc9HVTdyinFj/w?=
 =?us-ascii?Q?mVVeZte0ZJvUqQUfhuW/XMsQx50nM8Gm6psT9Kg0vyr3tJc3CEGKNmskaiKg?=
 =?us-ascii?Q?bxDc8FPmL/M/FJwJhP88FwMQqKrxUKF1mS88asETk5zaohLUO0MWYSB2wc/j?=
 =?us-ascii?Q?brGQoy9hECVKo8pLx5NH/zGGhQU+46nBiAOWbvyTjtmhKXWSPV+yxncaIeRE?=
 =?us-ascii?Q?GlvnPDj6FET6yNkZ5KgLQk0cF5IJRgCt3Fb0Hrj048rIxrq8jZk5nV1kbWXJ?=
 =?us-ascii?Q?7M4x/Lb0oLy6wMIjdNUkfNYFLisaG+g7neHvxf0tglzBanb5/ZzZ89jcFdth?=
 =?us-ascii?Q?su8G1kmJmPoFowzaG/V7Qj/t6yFsOPlno5NXvH1v4UtSKazenAqM3Yw5fKFv?=
 =?us-ascii?Q?APVZa5W8bT4V0Wi3wF1VMsLKJBU5SmvSGC2xuI5CY9DfHrGrn4SxIIUF+Iza?=
 =?us-ascii?Q?qy8CiTEHm2eg2CH7xJ/6pOdJkczZ6sRfAv7wNOxg05NAHWENrLH2xXeQq3OK?=
 =?us-ascii?Q?6Lzb5CBKX2X3oJadiIkTVdyfS92mYs1q9RPQzUrB06mCY0XHl0YLcyPHZPv5?=
 =?us-ascii?Q?2fUD4330QqPj65pWIR+/CSvafaBKjqK9Vxg5eAcnD5Ideu2G6geDV3B5TK2Q?=
 =?us-ascii?Q?sp8udOOEWevNSxCLm/ZCO8X5JUd7kXTRuRyD+IBhmilhRRTS?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 90bd49b4-1fd4-43ad-26fa-08de852d5879
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 20:31:33.7062
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6AVogjeFqIl3wkTQaiiTy5Hqv8r9Qhh/jKwmPvl7x1h/KysneYXkpuxmuJYwayYFONFMKVVOmaehNeJLmN4jKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7267
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
	TAGGED_FROM(0.00)[bounces-33773-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linaro.org,foss.st.com,kernel.org,lwn.net,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.955];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EB2FD2C281D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: Wednesday, March 18, 2026 3:11 PM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>; Arnaud POULIQUEN
> <arnaud.pouliquen@foss.st.com>; Linus Walleij <linusw@kernel.org>; Bartos=
z
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
> Subject: [EXT] Re: [PATCH v12 3/5] gpio: rpmsg: add generic rpmsg GPIO dr=
iver
>=20
> > @Linus Walleij,
> > From a technical standpoint, this GPIO driver is no different from
> > gpio-mxc, gpio-omap, or gpio-rda.
>=20
> Yes it is different. The example you list are all silicon GPIO blocks.
> This driver is not for silicon, is a protocol spoken over rpmsg.  The con=
cept of two

A GPIO driver only needs to follow its defined interface, whether that inte=
rface is exposed=20
via registers or via rpmsg. It doesn't need to know whether the backend imp=
lementation is=20
hardware or firmware, and stable firmware can behave just like hardened log=
ic from the=20
driver's perspective.

> CPUs connected by rpmsg in a SoC is used by a number of vendors. Look in
> Documentation/devicetree/bindings/remoteproc you see:
>=20
> amlogic, fsl, ingenic, mtk, qcom, reneses, st, ti, wkup and xlnx.
>=20
> We want one generic protocol/implementation of GPIO over rpmsg which all

If you believe the current GPIO driver isn't generic, could you point to a =
real example=20
that shows where it doesn't fit?

Thanks,
Shenwei=20

> these vendors will use. That means we have one GPIO driver, not 10 driver=
s to
> maintain for the next 10-20 years. It also means those 10 vendors have 1/=
10 of a
> driver they need to maintain for the next 10-20 years. And likely less bu=
gs to deal
> with, since the driver is more heavily tested by 10 vendors, etc.
>=20
>      Andrew

