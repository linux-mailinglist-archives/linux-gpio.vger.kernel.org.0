Return-Path: <linux-gpio+bounces-38601-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cJSuEnkkMmpHvgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38601-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 06:37:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D04C66966F3
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 06:37:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=Vzc8Jneu;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38601-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38601-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5055C300C32C
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 04:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBC89313E29;
	Wed, 17 Jun 2026 04:37:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020139.outbound.protection.outlook.com [52.101.69.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2612219E8;
	Wed, 17 Jun 2026 04:37:08 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781671030; cv=fail; b=Zb7yht9KlXrq2tHjfaTfspTIJOwH79CZMd4fkfrH1im89cN1BPLFszudA8/c5qtSYiAj56rXJhGSJqNZ6CPdr+T91oRf6wEmqDKShbXz+/WhmZfCk6PazG6fdUwJGcv+CyD9ySZ/PFiGKJ1SF/P1tXBp3oTNvTRLIuG3vGGIKxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781671030; c=relaxed/simple;
	bh=rDYhiYBCt+raupFRh1EyDQiIDMPchEtR2IEAVDrb+Ws=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=LKjtniM240urZioF5euIi5jhcpRYVrg5Z5KoL+4dor5fEuE+J2320faBC1emd2WYdhg+gZa4T+Md8b/tbOWT0wW33Y6ezT8MALL7Hn9SWNiuj+KHc2gvJLV+Ny0wNoYSF8HpkVB3YMrDShBWa0ARyTiOO2oBJu3Fw5LWf/sRaXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=Vzc8Jneu; arc=fail smtp.client-ip=52.101.69.139
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ewal0MX5GgNPE825t9RdJiM0FBpqwlacRtia1PuPELMKwmb/K2DV3iXcR0z02zCaK6kir2bk+7iRBiBHbbubh4KNV+als0iQHcxIXvErVq6OLod1ZxoO7a3Ogrxa+V2rjHSWRhcDScYrLj6bYFraddZkGzQ0bYo455DSJFd4w5Ct7UxWOnwUSsJrl3LYjRL5Fm/U5LqD1nYxpATzZtSA8bfrieiZG9FueBOGD8JQwk7Lk9ksh2IrnhMJO+4k3JCD6Bbdp35BRfEuf3bJqfaPPHPlm7244TK8Z/XNLs/PtydkWoXmZM6IfoANTDE8SV395mnNmGpL9GSkZhG0BpXBFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ArfuR8NVzI67YXUhdxR740JEig1V7jCMqGkhEx3XjpY=;
 b=XznsjydwX9ygsE7lG8qScCaT42Qhgq6qGOdKzrnnuclyD9+dNxR7Wxhq4SoNj9IMJIB2WQ1cwnKnZRZOWXRoJHLUlS1g/mc/6riIc3FtzeqR4j6FpI4metU7NP0jp/t77zuIaWHoTQM8DjZtGJZ9iXmpy6/yPV8UUqZRk+VSBfSAn5KMT1+UljDNEaOBP4QxWaWASF4+vupyZUSGW8NqNjoxHMc9IB3tv1P+3wunjHdoclF0NevuKxCC80XfPXw4qXPZbc8FxnjNjL8Qs3V6TEo0EphzHpE9rICHw2Wmc6FxDxYP1Iy5qzr2CgkI02EXuMWfh5cexQcQXIFjnIGioQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ArfuR8NVzI67YXUhdxR740JEig1V7jCMqGkhEx3XjpY=;
 b=Vzc8JneuarG4aZh819xQlEWXTcAORIFGZbQZbQOivAMBhZ6WNf1TA5reglXawk29L3ykgd00jyOFmkXTLF0mKXPy8ADqb9V5C/FUwINj9pz2C6idsqyOQ/y22QOBJrWocwQiZARAfD8//qWnF0JsAoqA8HIoM/I6PU0xYoeFKQG0aIGvVnI7M5ylNzceFw5emFBHOOiKjhjVI8HkESisjE71WwLa/wTYpcfl01O8sELYP7NAyI++Pxi+GQzoUQt7tHOqma98gFLwtBWJBsdVwDLbLb4WyOcyj7oEpiRiXkD6jLNaSP4PtPJqvQL7MVE5w5ZzB/xLZGwHfEvmfU7Zrw==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by GV2PR08MB10384.eurprd08.prod.outlook.com (2603:10a6:150:b2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 04:37:02 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Wed, 17 Jun 2026
 04:37:02 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v4 00/14] pinctrl: airoha: split driver on shared code and SoC specific drivers, add supporf of en7523
Date: Wed, 17 Jun 2026 07:36:40 +0300
Message-ID: <20260617043654.2790253-1-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::11) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|GV2PR08MB10384:EE_
X-MS-Office365-Filtering-Correlation-Id: e1733ffb-069f-44b1-fdd3-08decc2a137a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|23010399003|38350700014|921020|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Nut1nqFmkNkZYo+GBC6zQ5mpzN5dNFiWZpuE/G2ZOj14f59/eUhsIk6PAHjrmEYYXJ1tPLflE14agLgY/A6ploy7Z5qkHB8I6uolz5QHHfpU2cfO7b8aPpWZqDYwkEeHbB9hWauY/mXNEl3oNeFg+NWik79o43N6jtYe8gWgYNBOZyajw6XHus9iNzyvqpojdQAkhjLAMRsMokvjNKXazcQVN8YNlzgZIltKq+foFU0SttclXBQSXm81veM4fZ36MzdFedXA8PB7qFovao9A4EQXQy6PCjXgfbrP7lpDVLguOqes58+Eqazz7KSVo3kwI/OW7pJuSrrDZu4GsAUq4ewsDI35cFR/1zo6XqnhI8Dur+bJSIQcYO3MurDn1pB61VjnaaogcZ4+BEO9aB/41pPdap0TlgHoPs+xrR5F5tWL5G3WwY0c6qftaRkPV6Lfl+hDS+U23xMDBWUNhMwYWBcpVjE9KPLPP2yTN4ynKfsw4Zq1m/VSN1RwetXh1GXkjrqviqn1zktCPMIVl2rgs6alehFiyxd8zIH9lQAoF1Obg+Dx8bdWmI6luqtBNTtEs5gmDsiLdnQhiJXuorEzuLVvNBAauETdxVunWQVlJmugTywdniSEN4FN3zQ2uUink1oBg0egcxWcVQvFyfBu0Fg152ds93+IhpHmj0Khd2lj+f0iEqtdoU9vC7HN7lmt9CoOycO55GkgsVW0FZiqUw7TUwviZYBmq452RQcrAPOQBTjjHGwHb3knuRTMo87UZOZHSTkCf7xIU6lTvqyjCg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(23010399003)(38350700014)(921020)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZVh64S8JBE9PVXMDn6r+NzKKM29aE6RmY8Fxfw+sBMB/yjrp10k58cPGTAUr?=
 =?us-ascii?Q?LuhjOnTdJolnSfPkDahMkBL+VyRaWe7h500KWpUPF4n+3Kv6byo8Akit7Tdt?=
 =?us-ascii?Q?fzmJ7mlFHcBMSrweySGWpBspBKdu6HPaQJoE3duE1SRdfWXt8Io/o5Xl8cGL?=
 =?us-ascii?Q?kXJgVu+uDe3ECjBSmjEll4hz7DD4LcKjnELGK3vUYHWVEgdmvCt39uzbqZyR?=
 =?us-ascii?Q?e9XICi3tpWjRjILneflFwEvlZOg7Uvix5QHLm2ouFgaLGMz5e6IJUzOyLAFh?=
 =?us-ascii?Q?vwpcUjTfUXWZLGCytjCDxhWDOdXz0G11w1JhTYDGnoNB7I0grafhyT6WSrJ0?=
 =?us-ascii?Q?hOGzCHpwfIxoFYx1cMZqCfTCyciwFSO1PFyKRWDpUZegCwco57lEuPwyd2GL?=
 =?us-ascii?Q?/eA33Qgnbn7HmIWQnSzEgyu+25LZfappii+IDOAxPLgWcUWVrhtkYR2zZBK3?=
 =?us-ascii?Q?w1ka1flglIYyWuNFjbgwIRh43dB//YRPTMwZ2LpeTaoS/kIvUytPGCojw2pP?=
 =?us-ascii?Q?IJcMoxRHVEVrA++rs4esUqYg9uBk9DIU5Iq2Ft3OWcS0vuMHlt1nJpNDHyy7?=
 =?us-ascii?Q?SsW3787vFEHb2iC3EKe9mAi57JYpNOT5XVLXB0uuGiBCt22f66Q7aCTMrTbH?=
 =?us-ascii?Q?kQ73+PuaEhHIQv9ndrz0VQbD0uJzaLZdxoobpl0LAqsk6jdkGeU3L1PC7jfP?=
 =?us-ascii?Q?uPs1jBghjfZoOb4uLSTEku0YOwmNVO2SOZTjXay05AyPVW8QcnQDwImSVeop?=
 =?us-ascii?Q?kFfLZHMRiX4mz8tSbuv851A/xPB9qrm4kfOEulikkCxIwLjrKikj5gXfe0IH?=
 =?us-ascii?Q?ZhV/IchsDnA84vgaQb1w/KaZQLvZ4WpAky5S4hvdK8UaFMLKrNnoi5FmetGM?=
 =?us-ascii?Q?PMtRvidF6h4nNOkgEEke0M5GsHYDLlV15xmcZOUgivzelMxqrIjMGlOKsKyq?=
 =?us-ascii?Q?3bz07Gr2bwCm+A9XwLIiBn2ozBNGFTkVsQaJz71rSnpqQENDzL7pItMT+L+E?=
 =?us-ascii?Q?C0aE84Tn0YmeCp9q2m0krQ5Alz0tzJ+UEdIF7eDus+mNBsstwTS2b1REKa7t?=
 =?us-ascii?Q?y3f7/yr8us5U0MbtJaVv2dDCP37lKn95R+hwBKAtxC+53xIYGv1hOa2GNNxG?=
 =?us-ascii?Q?zwX3bYMoUwaqj21xnTOljXEFSoO6B9f5sNOpzen8x2KxyzikwZG0P0iFJXIm?=
 =?us-ascii?Q?h7LfUQd/UAAwkHb+bjjReBlVxR6abCpihW5M4K4r108/NV2ZLrkOjg9FN1k5?=
 =?us-ascii?Q?GLooZkGQ/qR6AGucPNuAT8QN/h77VTjonjmvH2hqi24GSS3gbDm5SWWzq8In?=
 =?us-ascii?Q?UATXQULtjo/RZqdqTGQ5uGvGaV/JoZSlmPhOfttZyq1EzjyvmUirrrpmi2A8?=
 =?us-ascii?Q?fMnmhja9trJkuqUOKE2O3hpWDdhFMKRpVR8N5H6GCp+uyz4V2GktM9+rhjel?=
 =?us-ascii?Q?0U8UTxglY+DCHM+A///XPzL7yKmLfqAbLxBghzDQx1O2HTY4M3gmhUqwHEnL?=
 =?us-ascii?Q?UvJ28mwmD/QHwZqYQt6VNNC80UwV6L/71iGo1vG3jb0vg4QUYm+O02BF1CMV?=
 =?us-ascii?Q?6aHfAtYt+GxUc6ovSDxa5gELWYhRH7oWw7h6sWq4Ln/hNUcAtRmOQ3k7Bamb?=
 =?us-ascii?Q?Hb3oNTHczNVkvBkuaruDOEZ1fS5a6gyKw5CKFxRe7JGxkSiNPlFbjqGiwHg2?=
 =?us-ascii?Q?6POAjGbOdgw6Er7LEUt6NQNQ9JwaVSulnZN8+jAiFT4yTOEp//gXe8o124L8?=
 =?us-ascii?Q?5tOGm+Cjv59nkIW6lK8wu2EFu2XVV8E=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: e1733ffb-069f-44b1-fdd3-08decc2a137a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 04:37:02.2412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BcZ/3olUUm8jJnVItK9UR0DafoDuhAQ6uy2pUJrBocVWgqXTxwhulbg9K6t5boSUGawVC6+JGBY0FlA7ufgNuwoFwELSUfxzlBqB4lHOaNM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB10384
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38601-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,genexis.eu,collabora.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:lorenzo@kernel.org,m:ansuelsmth@gmail.com,m:benjamin.larsson@genexis.eu,m:angelogioacchino.delregno@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:markus.gothe@genexis.eu,m:srherobrine20@gmail.com,m:mikhail.kshevetskiy@iopsys.eu,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[iopsys.eu:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,iopsys.eu:dkim,iopsys.eu:mid,iopsys.eu:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D04C66966F3

This patchset
 * fixes more airoha pinctrl issues
 * split combined driver on common code and several SoC specific drivers
 * improves an7583 pinctrl support
 * adds support of en7523 SoC

The driver split changes are based on Matheus Sampaio Queiroga work.

Changes v2:
 * more issues of airoha pinctrl driver was fixed
 * SoC specific register addresses, bitfields, macroses were
   removed from common header and placed to SoC specific file
 * fixed address of LAN LED mappings registers for en7523 SoC
 * improves support of an7583 pinctrl

Changes v3:
 * improve searching of chip scu regmap necessary for drivers
   operations

Changes v4:
 * an7583: add support of OLT pin function
 * an7581: do a proper fix of pcie_reset pins mux/conf.

Mikhail Kshevetskiy (14):
  pinctrl: airoha: an7581: fix misprint in bitfield name
  pinctrl: airoha: an7583: fix I2C0_SDA_PD register bit order
  pinctrl: airoha: an7583: there is no 2nd I2C bus via 1st I2C bus pins
    pinfunction
  pinctrl: airoha: an7581: fix mux/conf of pcie_reset pins
  pinctrl: airoha: an7583: fix muxing of non-gpio default pins
  pinctrl: airoha: move common definitions to the separate header
  pinctrl: airoha: split driver on shared code and SoC specific drivers
  pinctrl: airoha: an7581: remove en7581 prefix from variable names
  pinctrl: airoha: an7583: remove an7583 prefix from variable names and
    definitions
  pinctrl: airoha: an7583: add support for npu_uart pinmux
  pinctrl: airoha: an7583: add support for pon_alt pinmux
  pinctrl: airoha: an7583: add support for olt pinmux
  pinctrl: airoha: add support of en7523 SoC
  pinctrl: airoha: try to find chip scu node by phandle first

 drivers/pinctrl/airoha/Kconfig          |   24 +-
 drivers/pinctrl/airoha/Makefile         |    6 +
 drivers/pinctrl/airoha/airoha-common.h  |  204 ++
 drivers/pinctrl/airoha/pinctrl-airoha.c | 2401 +----------------------
 drivers/pinctrl/airoha/pinctrl-an7581.c | 1485 ++++++++++++++
 drivers/pinctrl/airoha/pinctrl-an7583.c | 1495 ++++++++++++++
 drivers/pinctrl/airoha/pinctrl-en7523.c | 1123 +++++++++++
 7 files changed, 4344 insertions(+), 2394 deletions(-)
 create mode 100644 drivers/pinctrl/airoha/airoha-common.h
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7581.c
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7583.c
 create mode 100644 drivers/pinctrl/airoha/pinctrl-en7523.c

-- 
2.53.0


