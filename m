Return-Path: <linux-gpio+bounces-38797-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CYzVEfkdOWplnAcAu9opvQ
	(envelope-from <linux-gpio+bounces-38797-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 13:35:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C19B46AF213
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 13:35:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=2Q85zW1S;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38797-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38797-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6668306F9ED
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 11:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A2E72BE7D1;
	Mon, 22 Jun 2026 11:31:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020125.outbound.protection.outlook.com [52.101.84.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AA02C0294;
	Mon, 22 Jun 2026 11:31:05 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782127871; cv=fail; b=q+bgwRvE5FGY0EzwLwNTgbHcIpskaN4yQZfiZMwZpJqBvYRHVJhu9UQ63sfwj20tU3Ftp7e5gxqKQWGMf/aZeHInz7ASVrQ15gTr4Jjceojb8EPAij7cTX+iuXPoz6Vwq1n+tkfydBF6LXItx72pEeK6a1dgw7Nxfh66Z2K+IPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782127871; c=relaxed/simple;
	bh=UTWVShyI31drAi4eiU9olxTU2OleWZwTMkmjPc75obQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZGfl0EKKP+Ox/LtHPd7pBr5grJsrqEj15z1NMc2uqXmIRjYGHf3pNx89fPvuU4NhgcMBBJi8dHj4rsPhJpatvKZkudRLjYQaz1lgrjHq1jH9uVy8tK/7UlkDqZXa2vgIXXVeeXP+PVPS5XxriaBPkbgFuLpAD+l+69yFCZeuDI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=2Q85zW1S; arc=fail smtp.client-ip=52.101.84.125
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yoPOyCCh0ND4Q9MwGe3+A5fvIJMey1neNbda1qs6AywLb6GvFM5Lg3DAJiVitSRZDuw1PFyM29LRU4XVB0PnVeJysUXwidIdoHsWND/EuvWuCuWZ6lFaj4dwTbskY0B4iByEMyg9gO+m+FRtFk+fshnLZsv8eJE7cr9mPLJx8kETMkiJqV/NofEgdeYVfEo0gDZmz4EhFcF4dfZVOt2K4bIGQk+uQHTOEmxsjIoBcCppXuf5sciyixI5OD8kLSds4IW3rcrGLDz7xDrVCQgPSOiBOkx+0Esa4HkaWWu1GZCT2Fve89CdlvMsP7Usooft67oGqb7vA/ulk8YVpyvDZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/NT08RFTpKeOwV02DEaPcZQL3TN6800VaL17ktJGgzM=;
 b=DYPDHMy46druYhufNGjCTMugrGxlanM3CF85TgJnu1Bi+oTUST7l9sCgHzUsqj+l+AO0W4vkFVsoHuTPbsIF00/Vs/797qZugh8sOqIKhuY9WUGYDYEJbEhW7L4VLySX5DZTvCmIcwj/zhwj19FxXdPaUI0HzeQBAdkEDfx8N7/8H8873Lx/Cbfo+gVVevmcXWae57TC5JbG0KqSRNmd2C01vfxCfM000ZTK4JyqnUw0sqX6VzDj5koJ0MnZVc8resHkMOVuhSRfw7QcFfj/uudwpkY1yl+1NcjJ4jdUabUKruFYcsmUPCPfGYT54urGPN7o8wIPFYIN4YfA5Qbh8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/NT08RFTpKeOwV02DEaPcZQL3TN6800VaL17ktJGgzM=;
 b=2Q85zW1S4GbAwe4AXh+GTedK20xHESRrskKfZWybdCTWSQfSY4tuEw5JlK4teRwxuTwoZ6x0Hh3ELJOJQamuS7GmbOdpMIReLdZ5fXIEYt1Z5iVyndS19tN3XIVc4iH5+XkMq1cYD1EJyoSpsWHpCTOoPBGy0X4AGewyUsSsPg7q4VrGoS2prXUiG3JuUXDV5B5teSevXo1PEEmLLmYbRTK778TaXJJQlcCRaR6iM+LHnHWtPYl9ID1I4xr9euFr+y/9O2qEeN13C0mN7ygW0jvTV2XLwuaZBEKpFGHBeqAMwXewe/kSjklHWQ4++0e+WgwXbGSCaCsIF6EvOsJdAg==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM0PR08MB11754.eurprd08.prod.outlook.com (2603:10a6:20b:743::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 11:31:01 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Mon, 22 Jun 2026
 11:31:01 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v5 05/16] pinctrl: airoha: an7583: fix muxing of non-gpio default pins
Date: Mon, 22 Jun 2026 14:30:35 +0300
Message-ID: <20260622113046.3619139-6-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260622113046.3619139-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260622113046.3619139-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P250CA0021.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::7) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AM0PR08MB11754:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cbd2554-da79-4b0e-b242-08ded051bca2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|23010399003|1800799024|38350700014|921020|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	uHoD9PAHSOGPqSNJL8bsY8kM11h/GiLRaKhM4Qp8b3fcxxyRfXDivl3YjpAsa8GPSXorUbuSvZmEm1aV9cxjHUjrBZ91NMcVCB9BXkUbpm9DGNJwAWFN9bijjZjaTCdCG0tCbCKAFgcjvLGfRQRVqcALn4vToUADepY2v4GA9PTSVBAj+XqJSGYMA77bche9oW+g6b5yYsUEaKbK/0dDYWiueasTeC6jRoQj5l+gl7pzTrV4svQm5UlFpKb0n/04x3kfF5dAfS9t3bGAbkliOoqfcrSZqHPbRiz8M05Xk10LDtT9RWUh0bt8zZMI3Fo1JyrrkiaM3kCU4Q5At4bG23BH+8a0NFuAYA6IsHKLiCvxGtnFAZr9dHH3/0X55I6kI1DDFS6/ycH/Y+45OKYmuYznMhWksFXu35F2M5imhZGvidO1NuLijy4Vg2Dbi1kFFYIcYdtZ1QOOjV0Gwp6yMn5HPG8SNB7ZyHXIAX9QzLApCrQCsjzfSby4kn0n7zKoqKsKkzl9Jburn7Dkmd9yi4uBPBbFDCREb/GjXY1nhakxA7Z6QAZkzxYrkhhHm2/6Dp2lT2UEokNoSKV7e04uKML2xdy5doN/2eANbyzqc/Sl96IH/FRBvkOuRAXRoxoXPgc/WgrjZO0PzKldEdJ03lpMBErrTAycO3sMD/5Fyb9hn1z/0XK+4fi4VMiwp4RdNAlsYC1vhQ2t4dSD6tx5upqv6vZORRKPGWaK7/aitMk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(23010399003)(1800799024)(38350700014)(921020)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1prQTj5Aey80yKxvf5SD9dNz6DJynl7nROGjHMaynrJarsVMBFMusePdJ4Ir?=
 =?us-ascii?Q?7KK4sGUQiHd4UNhxLSsa1UZEJnl38pOR6rUyEUjit8OUkKP0L+Mi9NLVM8d8?=
 =?us-ascii?Q?uMlwdQfSHACTkJM8DTeBUUEYuUYgDH3wtuPmQ8BB496civeo9ripCKpjTKtr?=
 =?us-ascii?Q?p1QvLsuJEkgVK36oO7QkhnF3np8S1w2yB9h3ldBf2RDicUDlT/bAwNf45ZoT?=
 =?us-ascii?Q?/E6VcTWVXqTOT0EZhwCqMVkK8M5WUNwOLGiHSoTBw+gA5d4ZLvRq8uCvjCnp?=
 =?us-ascii?Q?5CnIcHg1C3WEgDSalrQjcdcZomuRctiiRnGcxHvcEB07WD5Z9Q+90gLwB1aw?=
 =?us-ascii?Q?0E3tyESMpNQBep8SfYrwJl+N8cWAFl0a0+osCY8Ml5benvkvZ4XwegK3MJwQ?=
 =?us-ascii?Q?c9oNnBYRwr9qVcWPyF2eECumZsJcYxA5qx8F0eD7lmElaITNbgQ/62yZuNde?=
 =?us-ascii?Q?iD/q8DGUhIBgY47ZCFtot6C/MYNq+UMT1INRJ9igQbXq+RdGx3pvOCgDZpZv?=
 =?us-ascii?Q?XAgZZD44/lhB3eYeB/6IMGDfslKlCFOGaIpnozRfVbnZ48Sdq/SXg+cEg2OY?=
 =?us-ascii?Q?itltVFiiFM7gvcYRq+Lyog8ARjTD+zgmDT+inGWbMGOXp6cq8empfJfYhj7l?=
 =?us-ascii?Q?QNw9JADq3pJ5LpHiTMOmiENOqKwVCXRVcOTsJoo/jVTIHTixhptILVep4mWr?=
 =?us-ascii?Q?fDhaQeRyVjSApW9FImXUG3/ssx4QZ13A06MPsbeVOkIcoeQZDWVS0H+0ntt9?=
 =?us-ascii?Q?wdyQ42nvdqZt46Pdd7fZec1nGbBvt6MHfr0r7uNFFr5TSPcRsguIqx/X7a9K?=
 =?us-ascii?Q?qsvtbNhLPnKVo566DxiF6APyrDheK/twelR5Pjo2PEIUaC7p+AtPKoK9VdrK?=
 =?us-ascii?Q?ZxKsnjx42ioSG71nUqLD3Ph66Tw9bq3GMEFWhhvZNEIDRfTH9VrQwahRy6Am?=
 =?us-ascii?Q?BrN1ByyVfSfkfaXdqLN3pFkeiv3HocJvRny3CmpYVi11d0qYvlVNU+PmI5L9?=
 =?us-ascii?Q?Eq9trDDMC+dVGNK8jSsX6kPeKJteHAw3NAyIVdswGX1Ga1tWa1Wr0O+MMOGT?=
 =?us-ascii?Q?X+RqPyt3l7KEYRWPOwdnAkHFxGj7r7CgWIjU6VnbMM6UTJJAFw0s8Fx1qZg8?=
 =?us-ascii?Q?vQwNpfkHN7a07Q8ic79p6Gcti60ZwIxHzYmDF6c62HbbqrdctgT6cXSOXVrT?=
 =?us-ascii?Q?Mr8uBsBWiuFW4FXbsxWfDD6YSAU5CuWPy8Sm00fg3Ey8BZUji9fi5tgJJaI9?=
 =?us-ascii?Q?xvhdKdLl3ehfVP02M+N2lq6guG0JMbE5KCC70Totkl+Shdcfqx1uBIKOUd07?=
 =?us-ascii?Q?ARIdYVKOoQMGXJfSxFseOQu+RdTEHskMK6hhTtnwvwjoImh1N17XIlf2nmjq?=
 =?us-ascii?Q?D61xwMc5B/hL4RCZrjkfFz4FWjxD2vQojO2m+DhFu4PojMAHdUdmNfkv8ftG?=
 =?us-ascii?Q?jVcmBPgfUU0oES6VSHXnNlKTnAU4McOooLiMF60TEGQqBGFs7Frg42Ay8SvV?=
 =?us-ascii?Q?Ggl9+mdumtejZv/Jyi/AwPcloE5vvyyPFYa80FZ0lC32eAj/cbeVaiSkxpvc?=
 =?us-ascii?Q?lk9dYoUdb708LYvnoCfSOnMDUOZmiq3ecNp+1WgwHrUdSOXbQCLVRUM0sDwd?=
 =?us-ascii?Q?Cd8cXt0wydC2kGuuueyZmgXO1zJBfwgf8osBXBcTzlG/PGxkML209HmQ2UpG?=
 =?us-ascii?Q?HnwBE0GA0kgBjHPWTGbWXJWntXc8GdsoCG4TR6l8kXwupojviGf47A7r39QJ?=
 =?us-ascii?Q?xTO2Atzx0zN6u6CsJiSDy7ZcbPvI4LA=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cbd2554-da79-4b0e-b242-08ded051bca2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 11:31:01.3477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sasxsvR6do2/oIFO7IQ3NiJKpWXFavbh9HBGezs57pdbCur6jwD9OGBPP22paSYwlow96lEGx1f6G+1rGya+nW3RieBVtdnzeXJDpVVtNcs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB11754
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38797-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,genexis.eu,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:lorenzo@kernel.org,m:ansuelsmth@gmail.com,m:angelogioacchino.delregno@collabora.com,m:benjamin.larsson@genexis.eu,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:markus.gothe@genexis.eu,m:srherobrine20@gmail.com,m:mikhail.kshevetskiy@iopsys.eu,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[iopsys.eu:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iopsys.eu:dkim,iopsys.eu:email,iopsys.eu:mid,iopsys.eu:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C19B46AF213

Current an7583 pinmux implementation have following issues:
 * pins 51 and 52 can't be set as pcie_reset, current pcie_reset code
   will sets pins to gpio mode instead.
 * there is no proper way to set pins 41--54 to gpio mode.
 * pins 41--53 can't be actually set as pwm pins. These pins must be
   muxed to gpio mode as well.

This patch fixes above issues.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 100 ++++++++++++++++++++----
 1 file changed, 86 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 4bbda392625a..10499e708f2c 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -84,6 +84,18 @@
 #define GPIO_SPI_CS1_MODE_MASK			BIT(0)
 
 #define REG_GPIO_PON_MODE			0x021c
+#define AN7583_MDIO_0_GPIO_MODE_MASK		BIT(26)
+#define AN7583_MDC_0_GPIO_MODE_MASK		BIT(25)
+#define AN7583_UART_RXD_GPIO_MODE_MASK		BIT(24)
+#define AN7583_UART_TXD_GPIO_MODE_MASK		BIT(23)
+#define AN7583_SPI_MISO_GPIO_MODE_MASK		BIT(22)
+#define AN7583_SPI_MOSI_GPIO_MODE_MASK		BIT(21)
+#define AN7583_SPI_CS_GPIO_MODE_MASK		BIT(20)
+#define AN7583_SPI_CLK_GPIO_MODE_MASK		BIT(19)
+#define AN7583_I2C1_SDA_GPIO_MODE_MASK		BIT(18)
+#define AN7583_I2C1_SCL_GPIO_MODE_MASK		BIT(17)
+#define AN7583_I2C0_SDA_GPIO_MODE_MASK		BIT(16)
+#define AN7583_I2C0_SCL_GPIO_MODE_MASK		BIT(15)
 #define GPIO_PARALLEL_NAND_MODE_MASK		BIT(14)
 #define GPIO_SGMII_MDIO_MODE_MASK		BIT(13)
 #define GPIO_PCIE_RESET2_MASK			BIT(12)
@@ -782,6 +794,10 @@ static const int an7583_gpio45_pins[] = { 47 };
 static const int an7583_gpio46_pins[] = { 48 };
 static const int an7583_gpio47_pins[] = { 49 };
 static const int an7583_gpio48_pins[] = { 50 };
+static const int an7583_gpio49_pins[] = { 51 };
+static const int an7583_gpio50_pins[] = { 52 };
+static const int an7583_gpio51_pins[] = { 53 };
+static const int an7583_gpio52_pins[] = { 54 };
 static const int an7583_pcie_reset0_pins[] = { 51 };
 static const int an7583_pcie_reset1_pins[] = { 52 };
 
@@ -862,6 +878,10 @@ static const struct pingroup an7583_pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("gpio46", an7583_gpio46),
 	PINCTRL_PIN_GROUP("gpio47", an7583_gpio47),
 	PINCTRL_PIN_GROUP("gpio48", an7583_gpio48),
+	PINCTRL_PIN_GROUP("gpio49", an7583_gpio49),
+	PINCTRL_PIN_GROUP("gpio50", an7583_gpio50),
+	PINCTRL_PIN_GROUP("gpio51", an7583_gpio51),
+	PINCTRL_PIN_GROUP("gpio52", an7583_gpio52),
 	PINCTRL_PIN_GROUP("pcie_reset0", an7583_pcie_reset0),
 	PINCTRL_PIN_GROUP("pcie_reset1", an7583_pcie_reset1),
 };
@@ -891,6 +911,11 @@ static const char *const pnand_groups[] = { "pnand" };
 static const char *const gpio_groups[] = { "gpio47", "gpio48", "gpio49" };
 static const char *const pcie_reset_groups[] = { "pcie_reset0", "pcie_reset1",
 						 "pcie_reset2" };
+static const char *const an7583_gpio_groups[] = { "gpio39", "gpio40", "gpio41",
+						  "gpio42", "gpio43", "gpio44",
+						  "gpio45", "gpio46", "gpio47",
+						  "gpio48", "gpio49", "gpio50",
+						  "gpio51", "gpio52" };
 static const char *const an7583_pcie_reset_groups[] = { "pcie_reset0", "pcie_reset1" };
 static const char *const pwm_groups[] = { "gpio0", "gpio1",
 					  "gpio2", "gpio3",
@@ -937,7 +962,8 @@ static const char *const an7583_pwm_groups[] = { "gpio0", "gpio1",
 						 "gpio42", "gpio43",
 						 "gpio44", "gpio45",
 						 "gpio46", "gpio47",
-						 "gpio48" };
+						 "gpio48", "gpio49",
+						 "gpio50", "gpio51" };
 static const char *const phy1_led0_groups[] = { "gpio33", "gpio34",
 						"gpio35", "gpio42" };
 static const char *const phy2_led0_groups[] = { "gpio33", "gpio34",
@@ -1483,6 +1509,36 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 	},
 };
 
+static const struct airoha_pinctrl_func_group an7583_gpio_func_group[] = {
+	AIROHA_PINCTRL_GPIO_EXT("gpio39", GPIO39_FLASH_MODE_CFG,
+				AN7583_I2C0_SCL_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio40", GPIO40_FLASH_MODE_CFG,
+				AN7583_I2C0_SDA_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio41", GPIO41_FLASH_MODE_CFG,
+				AN7583_I2C1_SCL_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio42", GPIO42_FLASH_MODE_CFG,
+				AN7583_I2C1_SDA_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio43", GPIO43_FLASH_MODE_CFG,
+				AN7583_SPI_CLK_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio44", GPIO44_FLASH_MODE_CFG,
+				AN7583_SPI_CS_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio45", GPIO45_FLASH_MODE_CFG,
+				AN7583_SPI_MOSI_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio46", GPIO46_FLASH_MODE_CFG,
+				AN7583_SPI_MISO_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio47", GPIO47_FLASH_MODE_CFG,
+				AN7583_UART_TXD_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio48", GPIO48_FLASH_MODE_CFG,
+				AN7583_UART_RXD_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio49", GPIO49_FLASH_MODE_CFG,
+				GPIO_PCIE_RESET0_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio50", GPIO50_FLASH_MODE_CFG,
+				GPIO_PCIE_RESET1_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio51", GPIO51_FLASH_MODE_CFG,
+				AN7583_MDC_0_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO("gpio52", AN7583_MDIO_0_GPIO_MODE_MASK),
+};
+
 static const struct airoha_pinctrl_func_group an7583_pcie_reset_func_group[] = {
 	{
 		.name = "pcie_reset0",
@@ -1490,7 +1546,7 @@ static const struct airoha_pinctrl_func_group an7583_pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET0_MASK,
-			GPIO_PCIE_RESET0_MASK
+			0
 		},
 		.regmap_size = 1,
 	}, {
@@ -1499,7 +1555,7 @@ static const struct airoha_pinctrl_func_group an7583_pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET1_MASK,
-			GPIO_PCIE_RESET1_MASK
+			0
 		},
 		.regmap_size = 1,
 	},
@@ -1635,17 +1691,32 @@ static const struct airoha_pinctrl_func_group an7583_pwm_func_group[] = {
 	AIROHA_PINCTRL_PWM_EXT("gpio31", GPIO31_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio36", GPIO36_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio37", GPIO37_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio38", GPIO38_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio39", GPIO39_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio40", GPIO40_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio41", GPIO41_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio42", GPIO42_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio43", GPIO43_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio44", GPIO44_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio45", GPIO45_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio46", GPIO46_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio47", GPIO47_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio48", GPIO48_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio39", GPIO39_FLASH_MODE_CFG,
+				   AN7583_I2C0_SCL_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio40", GPIO40_FLASH_MODE_CFG,
+				   AN7583_I2C0_SDA_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio41", GPIO41_FLASH_MODE_CFG,
+				   AN7583_I2C1_SCL_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio42", GPIO42_FLASH_MODE_CFG,
+				   AN7583_I2C1_SDA_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio43", GPIO43_FLASH_MODE_CFG,
+				   AN7583_SPI_CLK_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio44", GPIO44_FLASH_MODE_CFG,
+				   AN7583_SPI_CS_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio45", GPIO45_FLASH_MODE_CFG,
+				   AN7583_SPI_MOSI_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio46", GPIO46_FLASH_MODE_CFG,
+				   AN7583_SPI_MISO_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio47", GPIO47_FLASH_MODE_CFG,
+				   AN7583_UART_TXD_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio48", GPIO48_FLASH_MODE_CFG,
+				   AN7583_UART_RXD_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio49", GPIO49_FLASH_MODE_CFG,
+				   GPIO_PCIE_RESET0_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio50", GPIO50_FLASH_MODE_CFG,
+				   GPIO_PCIE_RESET1_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio51", GPIO51_FLASH_MODE_CFG,
+				   AN7583_MDC_0_GPIO_MODE_MASK),
 };
 
 #define AIROHA_PINCTRL_PHY_LED0(gpio, mux_val, map_mask, map_val)	\
@@ -1899,6 +1970,7 @@ static const struct airoha_pinctrl_func an7583_pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("pcm_spi", an7583_pcm_spi),
 	PINCTRL_FUNC_DESC("emmc", emmc),
 	PINCTRL_FUNC_DESC("pnand", pnand),
+	PINCTRL_FUNC_DESC("gpio", an7583_gpio),
 	PINCTRL_FUNC_DESC("pcie_reset", an7583_pcie_reset),
 	PINCTRL_FUNC_DESC("pwm", an7583_pwm),
 	PINCTRL_FUNC_DESC("phy1_led0", an7583_phy1_led0),
-- 
2.53.0


