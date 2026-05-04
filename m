Return-Path: <linux-gpio+bounces-36058-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ExMI4WU+GnRwgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36058-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 14:43:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 026B14BD1A4
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 14:43:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D4DF83025A52
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 12:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B928B3D7D89;
	Mon,  4 May 2026 12:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sNGPyi7r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011022.outbound.protection.outlook.com [40.107.130.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C493D6CBE;
	Mon,  4 May 2026 12:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777898542; cv=fail; b=A5/+i39Textsy8HcS+wq2rhjHf2t4YsZxYhveC1CVRIIvPXFwf/n7L8iVPzyCk7fMJ5lKSy92GsxxonKJxLT6ryumhEO66G3fMmyvmEYQbBBVp5s7BljSFiPvHpqN/gh0mSshVvkADv3qxSWOidtXVGdktwsoin4QjRVMAPiCc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777898542; c=relaxed/simple;
	bh=cFbFlplHesLR5wBOyODwsoIl1AkJzR4ar9j+NuYc4RA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m01HhXzLcNdzfhLLgKaWC8ldbyb4ezldTuC0dwrIvtzuewjamJEGiETVra/KncyLNXjPx7QNOnT6xAQqyiXeSMdvdNcWOzPvqmxhkVerzZGToW0WiACy2NKO8aOr4uVVSqr2y7hwwljIT6P3hTb/eMDJuSCVHS2sTEnLg8Q6VRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sNGPyi7r; arc=fail smtp.client-ip=40.107.130.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XRhmhgKO99P1rAFr3Wl7TzRWU1R/DSakRkma6ttf+bAgE/EhmQN4NEegdJ+ZpAYhCPKZVcXAhjYtkNxmLYSVVL8DZiU7Wy0ezbol1CPjfGB6A5TR6WO7ivkUZ8s9hLUlHaMiCneLjdnUvbsFT/8qB9bCM5D+E3OsKLlH3LhRawVxY+6yAKp/5rnsS/+I/2lAJY/AesqzDrZSiWt8lCqn/V4Oby+Mh/UNPlzGlxENdIlQkYwdWqrvYV+JDfsXcVluznrJPWxsSsajQ2huCmrx+Y16Nr5Xtj/cXVPzwf18u1DFSVEulDN1Mz+m2chQRsKq/ov763HDwdReA3UwfeYZyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5UPQXBjaVJqxkbADk3hIiu2fwFER/itTPSLkusFe+U=;
 b=vOYHE2T7vb7JSK2KvWplnuD2NcLP5rRWLip8ix6xINnbVDedq361hBUvXHcXdE2p+47MCosqCtEhVept1HoHDzAHDEXo01FPd9wI8Mh11bcqWhEriuCBCGiO2WvfFtubZI26wolLPgGdPh0+CpCwfLUEKV4kMJY2U4MMKrQhWaiu6R5xiYoTzg7eon0pY30a9YM5BGh9gyT1sIK8R+gPVisfERlqrisPaQXTIeDLkCdF1p/fOZjj6CB/YxvL7h4hzrdCyc6S76AlzsNTVPR/LtwGpgprp8tF+DbsOBZ4/qphwtmCU+o54Qqhv9kraanJ0ScYWgP3kB3glLGsoGGClA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5UPQXBjaVJqxkbADk3hIiu2fwFER/itTPSLkusFe+U=;
 b=sNGPyi7r6r1OAnUb0ktjQFCan9Iq2hYx2vPYd63ObozS8wZjrQ8SjBMeKYTD7ynVrYlYTRNR2QYOjn5K+9gx0xbBD+nkGp63U2vt8/A8CJ/tTC5wBQCOot3qKsxru+CVQ0zowa2YNnMxE/FbdSNTdVdkdM4v+qOiPkDKR/fbK+miiYIYU5UZqz/+G+YFDAQpZWOPK3oRD865CjK8n/FMINBne1v/dpQNzHQyOYEwyIVXYneUyB0HOfoxApZYTMUxFGaAwam1PKf1GVbJ995zIG63xnPAFWG+Zxw5AC/umZSo3TRv6u6oajll0rFjGkPcCIemL4vekBflfVMqyVJ7IQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by PA1PR04MB10360.eurprd04.prod.outlook.com (2603:10a6:102:44c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 12:42:06 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 12:42:06 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: Alberto Ruiz <aruizrui@redhat.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	devicetree@vger.kernel.org,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH 7/7] arm64: dts: s32g: describe GPIO and EIRQ resources in SIUL2 pinctrl node
Date: Mon,  4 May 2026 14:41:55 +0200
Message-Id: <20260504124155.3615001-8-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260504124155.3615001-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260504124155.3615001-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P191CA0005.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d5::15) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|PA1PR04MB10360:EE_
X-MS-Office365-Filtering-Correlation-Id: d395e6e9-2560-4d24-4809-08dea9da8ca9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|22082099003|18002099003|56012099003|921020;
X-Microsoft-Antispam-Message-Info:
 DyBpY0Af+iiUDdwE1fWYZ56hDqg83EL9tkS1m6QbmTnevx8JKZpGhUSjYxiPziGMZ+QAk60LhlqhbCxEe69ex1DgvLo5XUNt8XucM8OSOUilhrHcGNU1I4Mu92w++iAtYqxRokLNi+TS8pX9XDxiVWs9XXupBHQkz9hS7VaaSdDR7KmEg0ze7PqUUPzD8tUpnLsTJKqSeGjnOszud27Yj4OTPRe/PWTp3SkYlXafzStkLwymiZAXjfg6G0wKF37hl0bDdDnBZr0PsipGRZa39ASHvsewqcfsGV4165Eb6a2HuLV5Ob7zqcVqrq0cZbMk6XZMEnzWpueEEX4ux9mw+YPxJURkfgsocKzTSbAsEpZzx5MEfZJXS2VobpB8skfJyNSyk6aeoqKxMPE/TqKwA1mIeo4+vZgfWPtKSbMLOoJSln2weghCu3G4oXwxtbiKWZyewQOGvjNTrxMGl8NCxExx16URyH//V4b7a7GA4EvLE9Py3hZtG1F3oZEtbsYQpiMmAmfGts3hG/zA1vEt0kSznfdVNA8y2+QH3mCU7iyZwV3vTStRH69C3qhk7fYtC4kZH59bRJILSIsUD5zAEMIdPSEfhc9CX5FUcs7VtLwYaNG+jIrKz7iN7LLkpyL9ohiSE4trMbLLGT5QvlNgMEavYyG9dJg/UXkDaoCAAN0esS0xGWC2l/CY8Wt1bCyPdxYHClj2izKT114xrW5PTa/WX3/OmgDtvxnDq+yVlic=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Lao5QCCSdx8cEOFBDuScAouMw3M50zrdnNCA5P2blln5KqOQfZLfsaiaMN23?=
 =?us-ascii?Q?laVyAcjc0K0OcrfH93oB6tcmKVflTwqpUWP5vcaZ1UN5SMzPskKiq5bDZcFt?=
 =?us-ascii?Q?9EKouQyAi+7WCRjxsOfdayQOzfvuW0GmYbiCow3EiJ/JC6yhWEAmT7ZgKIyQ?=
 =?us-ascii?Q?RJSSfQyRC/sN5oKjgMDP/uFU9a55Fxq2FAOBRPfAxp+oP/FZlxbI9v3vIvZi?=
 =?us-ascii?Q?h8vjFERoiJB/8RbYldC/CdAXvxFUtRQEumSwNW2ueewDXBR7EkJE3L8BuYOk?=
 =?us-ascii?Q?Wn5Pbf/XufZv/hj31bQwfnhz+mMk0vDSD2bsB4XRN2uVF0HA81dOTdP/8p+4?=
 =?us-ascii?Q?fYYOtJ3UplHHi2pUN9gNjY2BxUo1/R7K+ObPZQgaS+NzCOk3zlqXoDYYW2dV?=
 =?us-ascii?Q?ZtHr72KWFFQ48Czxh/0q5GzYTuqWuPxSp4cdkB2s2zvVCkKoRORMCB14tyo9?=
 =?us-ascii?Q?wgvPFF+/kXGqq5fWbZjqEkNIvlpscPrjlq+fZ0fFPJsw0YTGio0n/PPV8c6E?=
 =?us-ascii?Q?qVp6YETRkEvA4rR2vXwZQgxythMRu3/Cv/5IkJDFLFaSiKJ3bStUsDlUD2OY?=
 =?us-ascii?Q?vPmw41eNPRjPTG3FX7f2uYNtQsp/UxP3zW55F/h4YBiU8soqi3TQsYJgxWed?=
 =?us-ascii?Q?Jpo1hVT7RB07ZHVW05ERGNNji6T1EA8B7TnqKtBH4enl5G8E2o2I/QxeHOLJ?=
 =?us-ascii?Q?ULX0YYUGU7J1EBjOF2RXybcCV9asWcohmpzEKvgvIooN5m3mYelPGizjXiAK?=
 =?us-ascii?Q?eioOuPR2Cs1kI7cd/nhHEWWSlGQx5cflFjkf2mAovswqvXWHyz3r+2+aOUki?=
 =?us-ascii?Q?BiG/MNL+Z5vj6SxmHDHlFRawbG4AUuPdOLtIB7RZ6cLV/L/dNEIBjDwLDs5j?=
 =?us-ascii?Q?NvSua9MGvx3T3jIG8fLJ8YbaVYfPuY83M93i9geOtxkmSDCz5iYaVG5qsJtC?=
 =?us-ascii?Q?P09X534cqhd6BkQ/+GAGxy0tUj7dfeQuvWJCpPWSbpBwjK4N/Jp8VfRl9CGD?=
 =?us-ascii?Q?DxbH7N0eNnk8xnpAc5S05naqG+aK+WkY/cIUZtOm4QzP7TW0cdS1rGyM9wLG?=
 =?us-ascii?Q?i2bW5Huy/MZGDpT9K1afNazux2A9ATF5KXDYZzfOh7EfjOTQPxhikRZgaaei?=
 =?us-ascii?Q?fG4K3oePBJlqcoi+YotUwoojLgGR8qKh0pCpg6rtJFOKQd+h14KbcvBnPxmd?=
 =?us-ascii?Q?VlEKX+wix+pY7vs31ATwug5sIvM1hGHIfiD/PqSAdyklhZfZZSXcsozDYI+L?=
 =?us-ascii?Q?+l4vdiFN/OafZ7jY73UIy3xyZLkJQqlYpAFM15iJUgvJNUQmPXNRjRdiOWha?=
 =?us-ascii?Q?cZYil8zX/LAzDoH2wsCWr+i4Bj4Qn6LZ8xPbOiwUAVF/aXN6WWDdY0lq2pv9?=
 =?us-ascii?Q?DqglbHFX+LUzO2OCjXVYnEigfTk+Sgfy1m6z57ycQiDuvYlFPrN1k1ny3qsb?=
 =?us-ascii?Q?iI/Mwj1wzl6BA+XbV1AgxPDPxbg64xOMI7EwKHIxW9avqsuchtfMcvPXiPNU?=
 =?us-ascii?Q?KgljfRIxgl+bGjy7OLv+qcnC5MPbvkO+CX+yC6aOwFml/7JuahtXsbbDLdGb?=
 =?us-ascii?Q?HIDRSeD9JDEtAhYPV4YwOkE3md5Zfmeh445x6mZXiFXsuS5qVrQKcxM+sMYW?=
 =?us-ascii?Q?hYzTb9isHHnS53MoygRh+9rcJz5EB14uDqvLqdMaZMRrt6P3iMU82LQqYaZT?=
 =?us-ascii?Q?t/paiIepum+K3bIrSvvkgSWhK/782a0SKROwFgebaC7UuHjkfwQ4P73ZUxMg?=
 =?us-ascii?Q?N1L1Tt1614mIh4Bh48hl3eCuSuumnpqQEdOqMBAEcF8yodGEezfc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d395e6e9-2560-4d24-4809-08dea9da8ca9
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 12:42:06.2879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R5ncUWVtll9VlWgP/egatVtXVJsN9EDvnwvaIqrvquGuuz3hCgxfY8OseL/rWNYVGg2FXLNJ9Hw4Xj4gyltWhI92SRexJviIrWHKxftkXFh3DdU0/DOR7tuI/CSxPhfi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10360
X-Rspamd-Queue-Id: 026B14BD1A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36058-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_PROHIBIT(0.00)[2.99.68.96:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,4009c240:email,nxp.com:email,NXP1.onmicrosoft.com:dkim,oss.nxp.com:mid]

Update the SIUL2 pinctrl node to describe the additional register
ranges and DT properties used by the updated SIUL2 driver.

Besides the MSCR and IMCR ranges used for pinmux and pin
configuration, the SIUL2 block also provides PGPDO and
PGPDI registers for GPIO output and input operations,
as well as an EIRQ register window for external interrupt configuration.

Add the new compatible string for SIUL2 pinctrl nodes
that describe GPIO and EIRQ resources and keep the existing
compatible to maintain compatibility with legacy bindings.

Reflect these resources in the SIUL2 pinctrl node by adding:
  - "nxp,s32g2-siul2-pinctrl-gpio" compatible
  - the PGPDO and PGPDI register ranges
  - the EIRQ register range
  - gpio-controller, #gpio-cells and gpio-ranges
  - interrupt-controller, #interrupt-cells and interrupts

Keep the hardware description aligned with the updated SIUL2
driver, where pinctrl, GPIO data access and the EIRQ register
block are described under the same device node.

Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 26 +++++++++++++++++++++---
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 26 +++++++++++++++++++++---
 2 files changed, 46 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 51d00dac12de..b3bef4ee559d 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -3,7 +3,7 @@
  * NXP S32G2 SoC family
  *
  * Copyright (c) 2021 SUSE LLC
- * Copyright 2017-2021, 2024-2025 NXP
+ * Copyright 2017-2021, 2024-2026 NXP
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -123,7 +123,8 @@ rtc0: rtc@40060000 {
 		};
 
 		pinctrl: pinctrl@4009c240 {
-			compatible = "nxp,s32g2-siul2-pinctrl";
+			compatible = "nxp,s32g2-siul2-pinctrl-gpio",
+					 "nxp,s32g2-siul2-pinctrl";
 				/* MSCR0-MSCR101 registers on siul2_0 */
 			reg = <0x4009c240 0x198>,
 				/* MSCR112-MSCR122 registers on siul2_1 */
@@ -135,7 +136,26 @@ pinctrl: pinctrl@4009c240 {
 				/* IMCR119-IMCR397 registers on siul2_1 */
 			      <0x44010c1c 0x45c>,
 				/* IMCR430-IMCR495 registers on siul2_1 */
-			      <0x440110f8 0x108>;
+			      <0x440110f8 0x108>,
+				/* PGPDO registers on siul2_0 */
+			      <0x4009d700 0x10>,
+				/* PGPDI registers on siul2_0 */
+			      <0x4009d740 0x10>,
+				/* PGPDO registers on siul2_1 */
+			      <0x44011700 0x18>,
+				/* PGPDI registers on siul2_1 */
+			      <0x44011740 0x18>,
+				/* EIRQ window: DISR0..IFEER0 */
+			      <0x44010010 0x34>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 102>,
+					<&pinctrl 102 112 79>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
 
 			jtag_pins: jtag-pins {
 				jtag-grp0 {
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index e314f3c7d61d..3b38500d7d05 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
 /*
- * Copyright 2021-2025 NXP
+ * Copyright 2021-2026 NXP
  *
  * Authors: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
  *          Ciprian Costea <ciprianmarian.costea@nxp.com>
@@ -181,7 +181,8 @@ rtc0: rtc@40060000 {
 		};
 
 		pinctrl: pinctrl@4009c240 {
-			compatible = "nxp,s32g2-siul2-pinctrl";
+			compatible = "nxp,s32g2-siul2-pinctrl-gpio",
+					 "nxp,s32g2-siul2-pinctrl";
 				/* MSCR0-MSCR101 registers on siul2_0 */
 			reg = <0x4009c240 0x198>,
 				/* MSCR112-MSCR122 registers on siul2_1 */
@@ -193,7 +194,26 @@ pinctrl: pinctrl@4009c240 {
 				/* IMCR119-IMCR397 registers on siul2_1 */
 			      <0x44010c1c 0x45c>,
 				/* IMCR430-IMCR495 registers on siul2_1 */
-			      <0x440110f8 0x108>;
+			      <0x440110f8 0x108>,
+				/* PGPDO registers on siul2_0 */
+			      <0x4009d700 0x10>,
+				/* PGPDI registers on siul2_0 */
+			      <0x4009d740 0x10>,
+				/* PGPDO registers on siul2_1 */
+			      <0x44011700 0x18>,
+				/* PGPDI registers on siul2_1 */
+			      <0x44011740 0x18>,
+				/* EIRQ window: DISR0..IFEER0 */
+			      <0x44010010 0x34>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 102>,
+					<&pinctrl 102 112 79>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
 
 			jtag_pins: jtag-pins {
 				jtag-grp0 {
-- 
2.34.1


