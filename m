Return-Path: <linux-gpio+bounces-36054-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id PiDtGTaU+GnmwgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36054-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 14:42:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F22444BD108
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 14:42:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C4F9F300827A
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 12:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AA7C3D5674;
	Mon,  4 May 2026 12:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GRhzlWo9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011061.outbound.protection.outlook.com [40.107.130.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C8D3D5254;
	Mon,  4 May 2026 12:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777898533; cv=fail; b=r3FDQN41JcpM/KYXsH8X6A1AKzm0otwQDPoSTRB7jQ7aQ3AC2ufOXI+1bBy5NdN3KpcrN+foOJkkh6wYPuI8YXZgaHvHmUXikpZr31B3GXd3XxXqPfIWddK7+h6Z0fOxrXVs0fHatVJSF3UWTt45rDfHoxi7v11bbfJjH/m8vcg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777898533; c=relaxed/simple;
	bh=jc0+MD27whEeuSyWunj7hx7uD0i0tYvrtelFerLYemA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sPHFkKSdNuitcwWvUCSgTOxn1/Zul645EeIYxooUzcGm54/2QkmgAw7bU8wFJgDgyO9D7tFBGAdifi4DZDKDUiSOeMvMf7rhJ/Ew+BCwBowDl4Z53I2UqMmVq8zlYrBtCJ7EplHAsLzNDbC6/Z6OwV+/34G87lhfGLEJsJWqT1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GRhzlWo9; arc=fail smtp.client-ip=40.107.130.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jT0Oh0VX8X1XJx8ssU+dITv4MOsw4sPbl68tTPuylzOBpoPP+aPp750QUYYvVZrNIy+r16wpsvPP6F62VsauNafog8l+nQybemWN+fz5adtVGIM+sIupZLBvExESKiF6G+eawcXpTNR1d3hjtj6fgC735vATUUdv1MNyLGbQXFHUDN97coDxsqjVckMCCus/8PJpMWyFfNBRaeCXIgy4lO0pGBPhm1yDXpPnuyz1+Cpp5rteNOsLbxddEtrb034QYi+mWX9jFZJUcTozAY93f1mpQvxGKa4xQrhnTnUCrHa+/BpE+r5GljM8bXt722U0MSDqP/sFFuIhIfRyKAobUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwIjFPM+W6uPMSHOmuAZcqqOoIUlorblCFe1v+NRf3E=;
 b=mfpcnAxJbpX+D+iPLCHY7tTugBfMLqo+ua0mbC/I1feO+l/d5LYOZo7EhLjvI6gK8t96VvvavtU9nMkDnGoKGl1ySuR5Bg2wR/IrDVnTpOYwLRqRd+iFUvmnnN8iulIqkqdrNJGZKBPMh8bGL8gc+xEsSLBkwTy16ovw44YY5hbDpzkUMhIbIMyqIruoBA7kixPZ/4HkkkEDQKzCzMObaQcQxPgkcMa6TP73slx3DfW0+LJs0I0UnrGt8co6khpNDasbJMuEk5hoxtOPhoSW8GU7MOwkztac02pnq5A1IrqLXNHyxdgjI4cOA5feHLriU4RSW/XoSmROjvI9dTmlUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwIjFPM+W6uPMSHOmuAZcqqOoIUlorblCFe1v+NRf3E=;
 b=GRhzlWo9pZAklywjzQ4fgamgMMrrKH9Fdh67jI0sqxD8S7xytXSZLb1zGvm6/5nF9paj9pjgLNgrHpBO10yRPEZhd1kPnk0xw5eFcGUK8nrkFotGPC0EZCMCmX8O3Wc+Ob+8NiNO8ZKYnEwip/85ODVM9+aR6Qjem1+m31PVo82BenIhBNisrLBrBByEGrBEwDHdCG1w72wf8CReEz0D8w+khYwa3B5dxtaNirWJm14KBEOdHFtheOq5PcSILOH1LSP5h8UdLqa0O0DBWctAyxiWZRXEJDsptjn354Tk8bDjpldRk3IyYCHO2dYAoJnysbMwb1cDGfI8sKh0n1snXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by PA1PR04MB10360.eurprd04.prod.outlook.com (2603:10a6:102:44c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 12:41:59 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 12:41:59 +0000
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
Subject: [PATCH 2/7] pinctrl: s32cc: add/fix some comments
Date: Mon,  4 May 2026 14:41:50 +0200
Message-Id: <20260504124155.3615001-3-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260504124155.3615001-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260504124155.3615001-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P191CA0012.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d5::11) To AM9PR04MB8179.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 4c571434-5c18-4af6-d8f9-08dea9da8864
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|22082099003|18002099003|56012099003|921020;
X-Microsoft-Antispam-Message-Info:
 0qoN8YWFrkvi6MQ4LJGvoLRLeFoO3yv7jL579z+EpJMs3c/BFlgjIIJqoEadcRBTRUT28iXMBUz2xnzUl6fjbeRgXPbB3hwIR+niPr9QcBOBz70tD7Y8Z61rfL4XOkvy7NbJqkmoLd7ZSUXwPFyyyLnepIhmDaM9lDaioSDzhBstzIiZyZViSt8feiEhf/FnsmpCCD0tf/7zXKjCdZ3wA+8S6jgblQTdLyPqDsTyGZpjGJ/mXk9zUgZGmmR9i08q8TJR8nf1TcHxySfgWxLpnMpmaUAlc1TD2NP7jFesdUy8np/HlGKFUzTMmFHzUd9Hi8+st/41xOQA1OUlnuFpJiAQcQ8BznzMIgjvu6tsL0NIcqJHPVgEsevchFpB3Trj1NUUrkIcTpAJb5dGMc0pTG8Ek8xKFMsptTJcsJuJIDBkip0dCwFTuf9pjNygOrRZq5c/3nKskpuGRh8O9SZKy4B3uJzLyoaNaJSUO2uufxO7WWA/J+Q0gqlaiToYsl259V/p1K7ryCwogvhDzPEmwHjkllJOasY3U+EMpBHZ+nBjrBYEL30Ww3kLRUeySY2DUCEuM5982kkYCLdHAJZgXs4ui5blC1t/dlhhH/KU+YM0t53BvsE3b43HXDMKMF5ggv0Yv6ODT84D/ZBDxlSIuMbHa8DV/2RKOaReIfvjtqb7VJRA5s/cuz46uRMTR4j3VwMmQ2L/VpHSXPyPGFL9nmhHDm5AW7GxSnY5HSgbldE=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?c5/lTEjOxvDOa8Y5T4QMFEITcSAJK35TamNOYlXgGdZNlxkjIaXHuRwxgBjM?=
 =?us-ascii?Q?DZW7pZwMyWSq3AdIRRrRqI1h6k1DOpYlxEUDk0douPF+WCFTS3hqkYsTQtw0?=
 =?us-ascii?Q?p7P+CP5VBlW/6akjw6aG9LM1EiCoMj6fa/r1zdf7UYhDhd35cqgzB/tYbyKq?=
 =?us-ascii?Q?TqjN7NO2xoYpJASN/BvtRtkhp+WJgRWKLCtQhhXvXg2aLMWoxQtT1pv/IZcU?=
 =?us-ascii?Q?HniYKhbtCtDtPrCrrMeeaNJ4ZTY5Z1X8IsGSvjqQeGBCTfkXb3QwMv/64fy/?=
 =?us-ascii?Q?egU1nDIn04LFr3A6ECzTSw2MnECAB34iiIWf1FZvCI2dU3p+hn4GaCFnYT7a?=
 =?us-ascii?Q?7yKN687lJfL988FQqFHP4BGYMsLb5HCii5/hyFbJx2zDUZWJu4C8+YXydwoF?=
 =?us-ascii?Q?fOqnV24Xg4Wgh/WJ4TcDjznvbbC72ih4wetxhAclxFM9BdAvdwkonlsFQ3sB?=
 =?us-ascii?Q?7oLRtbuOrXyb290WGMZcCOVaiA9UF3WBOFAc1n3gXKpqBVE6XqVDvobFsemf?=
 =?us-ascii?Q?5SZediBEjsj8wpvVqfhhUTquaoZZw/gHpcA2XJ9MXreopGicPCLbpNABwDMJ?=
 =?us-ascii?Q?RDvFtBmUoTmLEFcBjTI1CFLU5LIur9HXkVqSD5rdCeUgfhJZw2V78BNx/3MW?=
 =?us-ascii?Q?4QXe6LGB9SWqT93JJKlFeiV+KFkOLaPGtGz6jhXEXzbkKDrrRyznj+d4VYMp?=
 =?us-ascii?Q?rHgO7rK8FrOZkBB5vlAaWcaJ/3ky+ihAtcy29Hz7LM7pySfySJMFizZ1dE3p?=
 =?us-ascii?Q?1GBTyRRqvagPh7F1h1sZYgrZzQ8Y3vj8sYYRrIcSXQp51WxvcGO2B/Dg3ZWl?=
 =?us-ascii?Q?bpIb/9MnKrdMwaIv9dtGigOCk6fXHtdVOoBmxSNuDhQ1+6Yt8T618hTFElDO?=
 =?us-ascii?Q?nMreo/CrdutvtVJ2I2Pp3LoRCc/CUq6AyWZ3V860NEPGDPjBuZd4aADctGjj?=
 =?us-ascii?Q?05oInpVSYdsIp0jaKBcGWCqefPVIY+ZE7R3k7YURD9IYKCIWeq24wsIKpA+X?=
 =?us-ascii?Q?l8pUOeh5ZozLQpJk20FCmtbMcryslDVJDNjCJzfbsfbYMe04QYqB+RqtqPKy?=
 =?us-ascii?Q?Ul5tuDh6qJY+fepOba5damFvsuqp9nh0GMii8BO8LtfCJrXcXGmtlg/771g+?=
 =?us-ascii?Q?8qZ/xKT6YANGApbDqqG22yfYCGVKYxTfgjkOM+9EML/KOAreSgxuaWjWVjrx?=
 =?us-ascii?Q?7ev/fH7v2eyNzqTX7wCT9jt72cSwJACYmqM9pGQeWYkPaGgH7Iu8AI1S7i97?=
 =?us-ascii?Q?N0xwcP7n9MVHnumQRgk/Xd7VESylln5Ks9UW1GrQLsO3q64ZUPyPD/1CAje3?=
 =?us-ascii?Q?kf2/oW1GjyhCS74fzzovbWG0kmGNbNM49N48INMgtO6TkWfn7qrnzmklVRhz?=
 =?us-ascii?Q?QU9qMN7Xg4z+Jk6DoHg9CDJTR08bPsimZ49Eyhx2g++h0dS7e187cGORZaL9?=
 =?us-ascii?Q?iPqDcR+Adrom3wQA0oeGc0JpnfuiZzBwpbUUBVScpqQPM/eP85hboAvxRrH9?=
 =?us-ascii?Q?sZQa9Ctol5jMedzI9/CBe5FycCCggN+YjGZ0PnTGVbZdEaOLiBe194RRqzQp?=
 =?us-ascii?Q?6qKr8/yI2OzRK0XiFF8LpBw0jYudGIPxWN3dHSgSLQQGWQseJlzN6WSjYoM4?=
 =?us-ascii?Q?cZ5LXiiX+lvbgJ/T8TG+O8E7ZUvr8vobQfNeO4Qg6Zq4n+E2eG2pZY9s7M+2?=
 =?us-ascii?Q?tsWR43qpbh1cY1hICiyvRdJ6J/ETYyjAb9NvrREwBKLY7BnNzZENejofCcvr?=
 =?us-ascii?Q?KH53DD4qIB7J5fwU0SzeD0gyN4C3Pwn4AtJqJlHAJNqhobY0A9P/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c571434-5c18-4af6-d8f9-08dea9da8864
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 12:41:59.1022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +NLC13BsByobEK6aSL9GFWm4+B0MQCBsuGoTwabsRjPH3fmXemcIME4qAtaGmBUfXCagLKD7IJrKzDyFIfoxPbFuDQHK8NiuD0tbWUqws8ssg8U9gGVgj6sWGQIhbont
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10360
X-Rspamd-Queue-Id: F22444BD108
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[30];
	TAGGED_FROM(0.00)[bounces-36054-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim,nxp.com:email]

Add/fix some comments and print
statements.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index 56be6e8d624e..558d9ae1fa0c 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -60,14 +60,20 @@ static u32 get_pin_func(u32 pinmux)
 	return pinmux & GENMASK(3, 0);
 }
 
+/**
+ * struct s32_pinctrl_mem_region - memory region for a set of SIUL2 registers
+ * @map: regmap used for this range
+ * @pin_range: the pins controlled by these registers
+ * @name: name of the current range
+ */
 struct s32_pinctrl_mem_region {
 	struct regmap *map;
 	const struct s32_pin_range *pin_range;
 	char name[8];
 };
 
-/*
- * Holds pin configuration for GPIO's.
+/**
+ * struct gpio_pin_config - holds pin configuration for GPIO's
  * @pin_id: Pin ID for this GPIO
  * @config: Pin settings
  * @list: Linked list entry for each gpio pin
@@ -78,21 +84,23 @@ struct gpio_pin_config {
 	struct list_head list;
 };
 
-/*
- * Pad config save/restore for power suspend/resume.
+/**
+ * struct s32_pinctrl_context - pad config save/restore for suspend/resume
+ * @pads: saved values for the pards
  */
 struct s32_pinctrl_context {
 	unsigned int *pads;
 };
 
-/*
+/**
+ * struct s32_pinctrl - private driver data
  * @dev: a pointer back to containing device
  * @pctl: a pointer to the pinctrl device structure
  * @regions: reserved memory regions with start/end pin
  * @info: structure containing information about the pin
- * @gpio_configs: Saved configurations for GPIO pins
- * @gpiop_configs_lock: lock for the `gpio_configs` list
- * @s32_pinctrl_context: Configuration saved over system sleep
+ * @gpio_configs: saved configurations for GPIO pins
+ * @gpio_configs_lock: lock for the `gpio_configs` list
+ * @saved_context: configuration saved over system sleep
  */
 struct s32_pinctrl {
 	struct device *dev;
@@ -321,7 +329,7 @@ static int s32_pmx_set(struct pinctrl_dev *pctldev, unsigned int selector,
 	/* Check beforehand so we don't have a partial config. */
 	for (i = 0; i < grp->data.npins; i++) {
 		if (s32_check_pin(pctldev, grp->data.pins[i]) != 0) {
-			dev_err(info->dev, "invalid pin: %u in group: %u\n",
+			dev_err(info->dev, "Invalid pin: %u in group: %u\n",
 				grp->data.pins[i], group);
 			return -EINVAL;
 		}
@@ -970,7 +978,7 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 					    ipctl);
 	if (IS_ERR(ipctl->pctl))
 		return dev_err_probe(&pdev->dev, PTR_ERR(ipctl->pctl),
-				     "could not register s32 pinctrl driver\n");
+				     "Could not register s32 pinctrl driver\n");
 
 #ifdef CONFIG_PM_SLEEP
 	saved_context = &ipctl->saved_context;
-- 
2.34.1


