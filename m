Return-Path: <linux-gpio+bounces-38615-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zAMrFPIlMmrFvgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38615-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 06:43:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E520C69678C
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 06:43:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=KrJbwwY6;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38615-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38615-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D94831D978C
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 04:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE22631B833;
	Wed, 17 Jun 2026 04:37:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020139.outbound.protection.outlook.com [52.101.69.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB74631B824;
	Wed, 17 Jun 2026 04:37:37 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781671059; cv=fail; b=UzA1r1C6K0PNxF8yWLXugAhqUYmAp3azqengKXXtFAmuXivzwyXyHnm5i1RENf+qdWwbdymkGNNpb87aTyL1sE/WHTSSix1VzwhVCv//ihopuDatSxIur3RhTwgmahPYc228DqJI0QKOk4fINOtskL1J+lm1eT7ib0SljUNtvkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781671059; c=relaxed/simple;
	bh=BVlxZY5D0v3NaPv19z62dUKrIXUtaF63mmFBMkq9cCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NX6EJ8YLoJXVr/XIM2k7TSKnvR3gOp6mjZgJgobE/JgFplFWMjSkbSYxA/u3uzl1uvgd69y5FnGfskDxrP+kNTDVayg4fi1fpsdI5zCLToLr2mUJOQL6RuMx9vEyBug0UPHkvtuAGIqKnx9RYpQg5uYq3peaI4Q9OxibBRpDLhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=KrJbwwY6; arc=fail smtp.client-ip=52.101.69.139
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YJeYV35uS4MI5GUz8XD5pXJGyxCGDBz5Zs58jyfQOWh6RUL1QXo2w/ZMgZsQcC+/ly0JkazV1Np+4FK3Xl/IerFj9V8kaLgaFAgAzedTOUGysIf3sxfkHYRXupanTgzTxaCPPj5J9MBTNm3MBTw6BMyvmaGlivSa7YeDpi8PZwAH2eYHQaL68G8uEeeEE+eS69IDGPRhbCoTm2gzqi/ScRpz3v0mztk4DkVzoWoPBqVcTSz+rHfbYtmWi457jeD1JfOmITWeJjGOLuc0u66i14df0C3fVTHwm1+5rOuAC1wU/upwixSMvGtfy4V8WP3v/KgzZG6ghE9TmIMsn6ufGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WEZqaIeaMkDZTa3VVdkBUl+UfVD+FZ4iH6LW1+maZQ8=;
 b=w78xq4hmc+OgVC8pzGQlTIXED4jIj5EUMFRxndycNgEQLGNwc52Sj3z5//AVBknjYgmyl2DjBxdZwq488AOSF5NkJu0+yTnEzbb0YNhbjWmwOJBgezOZlAtd5T68SSZ5euN2zVzOVy38T3V+9HTFKooztxT1vf0ksDSsB7gesMYj3MEuEdHE0YpDEAKDmLYFoP4rjCffS1TkvrhlctSFRSFltHDRo1LMLCFSWNx4nXKQyD0EfrVTLKyIDF72922HdqhJxqpjvhQ19nE3IrySfq6XhCEddimHCo5yzuOKSDO77Yu7ZlLPIhqPbBq2c/PwqA3AG9+IiyypDuMfdkfMCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEZqaIeaMkDZTa3VVdkBUl+UfVD+FZ4iH6LW1+maZQ8=;
 b=KrJbwwY60NRtsOxk3YKaJZcUpyZGGMRkNpB00CxuRV8PPF/Y7AuQZE+Woqic9zwmYeZlqOqwD7uhlrki8aD6XdH0toVF+2d9j16S49Jj8Wg05KBMUv9b61wstaMVrhMOe80pnYHZsXzHjHXki+vp/9zA5M9EiGgPQ52VAkj8U8RtJRBCexRz7sqeBDJprGNW+yCergEESMWJF8FBk8z5ahH4vTMJvqCWyBQ/4LX9B/7KJbfT9gmpVdhwTbrz0//H8Yx748y/mNm0IdNkbOSCUx1+lhZK+ha4BtlelO5V2IAFjATxbSt7YdKby86AZbgk/S6lgMpMcdjwc8+a6Y9c9A==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by GV2PR08MB10384.eurprd08.prod.outlook.com (2603:10a6:150:b2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 04:37:15 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Wed, 17 Jun 2026
 04:37:15 +0000
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
Subject: [PATCH v4 10/14] pinctrl: airoha: an7583: add support for npu_uart pinmux
Date: Wed, 17 Jun 2026 07:36:50 +0300
Message-ID: <20260617043654.2790253-11-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617043654.2790253-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260617043654.2790253-1-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: a21f5486-707e-4287-fd52-08decc2a1b67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|23010399003|38350700014|921020|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	mZEQSDfE8qKKttWZKllJ4Uu592P/eOj9zfzDXebNli7l5JiobNYi6y+Yu/pD+U++RehaBtZVsi4GfKuylfXN/RispdxHHXF+RRhuXCSYy+An8Ng1jQI8+Fd6VtiA95DZaYOAISPXN7YZZIr3cvfznsOLOO0iubjpJoOSfr2fqY/injgM4juRjzQ5b0s9tR0yrGh1Ww9/kmgHzQMXUTpvCir/67cS0OLdWjW1sKdTAly+w1b3hNVqc/2No7roACADQgZTm4RZdjhlv/3uu4iqkms+MoHKVI4i/Frf43DFuVWODp79e+CEFu8J19MQ89J7oQq8luc3ZxckYHOz7qDkTX0zNs32ER4lrFK65j0bDJs413WG+gDOg5HEM8Bm2UE2lXuww8rJJb4bj7dEpGDhioB8XLZ/8e7SiO9TuXBZN4B+p0+61xEH9tXx/51N52jG4njKmk4TYqu9HOKDJME9cDRxKD6cMY0tcWeQJNsYnv+l6Zftld+Golq45Iyo35ptqKqR/DrclNFajygaVxEY9V4n7HBIdJk5heUEG55LARAHXv0ZO6bIsDLvcLVdK4lFnuyoJR/4b4yulhy5hrvW14EZuyn+dbyWSAQLGg/NhILwimYTOqdW18qumzetS7yyKjQ1RbJNBiUyBw0AQXNvDcnjty3CjULxEtEFDNxBGbM3RRNJkktnfJFYKOZCAdEn651pvtOLPbfNOWMjbfqEBUVsRk6L/Dewy0g9+bCNmfcZkasitjUAld48FSMgwKMOWoeT9x/oc0bWRinAAJ88uQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(23010399003)(38350700014)(921020)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aAytnPdZhwT2oe4/Lll7re58ZQNVEBLFZBb4i82UwJftkVSz1qZryXoOM6LF?=
 =?us-ascii?Q?uDHI+y7iXOby+rrgbRNN1PHLPjg0EU2uxU/jIxLpHXym1w4E06dW6emQ49Bb?=
 =?us-ascii?Q?5RRrVBx9HgULgr6VbGsO5Y5HkhEqLm9FvCNmulHrQxb7kh9SfLkQ+KzbLj0U?=
 =?us-ascii?Q?eZim+MkjlZ6BdzQGnuoDVAXtHa2nrI3ndZcckmGDKBoKYphK4AoChRe4gkcT?=
 =?us-ascii?Q?XaaVTP/2BGFsMvXVWQydAI0tyNQh70y+JnWox8YrUsvzVa3zPVaDHNEJUjmJ?=
 =?us-ascii?Q?Iib/P4cP+S1SAfP02MqdCOPyqQsIWO7X0NjcNRgP+HtyQ8Jz9p3QTt9xbk4E?=
 =?us-ascii?Q?f/m30ngdBMyobUFrasZJOMFPH2ZqWWuxTFrtU3JKmifWTeoHWzmeWXwOzqSp?=
 =?us-ascii?Q?dOV4MUNEd6WFa05PknDx3EFXTDno0s8/ZcysyjYJHOuxeZ697uPsqGBPGWWG?=
 =?us-ascii?Q?CrgZzIJY+Pw6JEAtzxDm3pHvs4GkzsHG742qVyNjMaP19g+EMTf0b+Buuff9?=
 =?us-ascii?Q?vpoi1CC6bR7Swo9K+JufTtTAukqlemxiRB+LXpaeeyjAW0wauueclKLQ5U5s?=
 =?us-ascii?Q?eNlFhL6gUDu6P1t00V9z/Q3dzHwF9V5jUnz3Zo/tEgF+VlE0MOsZUGlqyboh?=
 =?us-ascii?Q?7x1MOHHMNwKx9J0e9VneZT0zsp8thwDGlzT8KFZc+m8SbCa1rL/NYkSHAzd5?=
 =?us-ascii?Q?U/1FJFb6CDjEDxULsiQZAAgkUKJKCJqvkbOfI41H3gdOfs7XMhXYzzMQNQzk?=
 =?us-ascii?Q?2jq3/iCgdzyrgGztPjMUPdbEyn6rl7km3P9nPKzcalTkjxc2k2vS0//zvnOP?=
 =?us-ascii?Q?1LG1ILvqG/IHkdYERs7bKII8XdyrafviaKfDvr8aIMjtiiQ673QQjlChWMVG?=
 =?us-ascii?Q?Jk9fq1uYMTuIpIod5GjdkF21U+UqF8YlAS3o+5vSUTolIprKxuR4jzUshT4J?=
 =?us-ascii?Q?A77+EwxZkqOw1jLfdQEri86mFVFsB/CSZXuWPE93e0KZpR7D9kD9Vt1BenwW?=
 =?us-ascii?Q?TBj5cWL+cyVS/aCCCm4xWzX8qlC08HZq0PDoshhXj9vxdkhODzRtqIXhkuGW?=
 =?us-ascii?Q?BKYQmrWSR4ehtX8g5Hy1qfSTK9dOwgJhbQOh+2qenQoKOgLyWuoP2u/JMn9E?=
 =?us-ascii?Q?k2dFH10dn7i8PxzWi3M2QRu2Cl2zUy2gvKK2sQbpsgLM7KMoXqwVYNAM+oaZ?=
 =?us-ascii?Q?oJ7p2HNENxXnfqWKesrx97vwwh0M2cKzi7QvCjPHO3AzaIRwXOkKLI1XoYhD?=
 =?us-ascii?Q?YZmO5bVOp3jEpZ/z6bU/VVF9D/MPyyj4Uz465qvqL6jslNTAj7NPUsy+tCxr?=
 =?us-ascii?Q?xYOjG9rHPygC1pSZ9qRtb0dmJxk8JvqunXqdtsT16DT0/xSukFcbbxMjKkdU?=
 =?us-ascii?Q?2HNzsp8IG/2RoYApoQFHnynWj1s1HSgvlBeDuG6qasz7G14W4Giym0gOU1w0?=
 =?us-ascii?Q?9m4blkB81RXcJ1V+e7XIABjBy1IkjCwmlB3jp+MVIODXiJmFxZGQsseJz+a7?=
 =?us-ascii?Q?8rbxnKoD+EiQmHambvQ7eTnkR6pdEqtEdYZXOf9MqVGPjOi7E5wVpjabZAov?=
 =?us-ascii?Q?RBBWG0KWgwQWkVjf9GVwig2kFJjni9JlSJAc2lR7hpO69wboXt3Br0OodaG8?=
 =?us-ascii?Q?2t1fcjDBplQAtu0RVNUKtuTbjsKFUZqW2hTKTomMQrZResXdTZdVEID+qdoW?=
 =?us-ascii?Q?N48RyfaT8hUXitVxUW4c20Hsbxyc26IuUaP6/Pi6+x6DscLnn5Sc8Ck3sBIP?=
 =?us-ascii?Q?D63gvmQxS0PzfvEldSRDKihQ3olH7tQ=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: a21f5486-707e-4287-fd52-08decc2a1b67
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 04:37:15.4890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2rq1WkhfziIZZysKQnLeU33EOBvKjDM4JLNc7dycT702k1NqLEMeIsIUFEaJ2Tc7tQIQ9BoG0sDB52Ra2fTUZS3E+gm79oWFx1qfp5Kl7zY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB10384
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38615-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,iopsys.eu:dkim,iopsys.eu:email,iopsys.eu:mid,iopsys.eu:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E520C69678C

add support for uart pin function for npu_uart pin group.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-an7583.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index d4fbb12fc639..959eed06fead 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -68,6 +68,7 @@
 #define REG_NPU_UART_EN				0x0224
 #define JTAG_UDI_EN_MASK			BIT(4)
 #define JTAG_DFD_EN_MASK			BIT(3)
+#define NPU_UART_EN_MASK			BIT(2)
 
 #define REG_FORCE_GPIO_EN			0x0228
 #define FORCE_GPIO_EN(n)			BIT(n)
@@ -569,7 +570,7 @@ static const char *const sipo_groups[] = { "sipo", "sipo_rclk" };
 static const char *const mdio_groups[] = { "mdio" };
 static const char *const uart_groups[] = {
 	"uart2", "uart2_cts_rts", "hsuart", "hsuart_cts_rts",
-	"uart4", "uart5"
+	"uart4", "uart5", "npu_uart"
 };
 static const char *const jtag_groups[] = { "jtag_udi", "jtag_dfd" };
 static const char *const pcm_groups[] = { "pcm1", "pcm2" };
@@ -754,6 +755,15 @@ static const struct airoha_pinctrl_func_group uart_func_group[] = {
 			GPIO_UART5_MODE_MASK
 		},
 		.regmap_size = 1,
+	}, {
+		.name = "npu_uart",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_NPU_UART_EN,
+			NPU_UART_EN_MASK,
+			NPU_UART_EN_MASK
+		},
+		.regmap_size = 1,
 	},
 };
 
-- 
2.53.0


