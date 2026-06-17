Return-Path: <linux-gpio+bounces-38603-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WDiqDqQkMmpxvgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38603-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 06:37:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C304A69671A
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 06:37:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=PzV6fkCC;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38603-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38603-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BC6130D8C1E
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 04:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E862A3164A9;
	Wed, 17 Jun 2026 04:37:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020139.outbound.protection.outlook.com [52.101.69.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410DA3101B2;
	Wed, 17 Jun 2026 04:37:14 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781671035; cv=fail; b=lvVCFto5hI0rI/+DQvxiRwwQj/F30fNOfIvi95uDcXVYDDes9lgT1sQWYYTNcqyJwrY/U+dm8zDIQW0N+I/OZ00GY+15IDn/7g5uyHkVfBMUTp51hd/B3x35zUb59DYmFm+zm7l40Pdz0pnlbR5COeEwNiYlJAdDSE8cQIXjpTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781671035; c=relaxed/simple;
	bh=5Nlwu5Qy9j4jVSPYL7aV+3OUgJDHo1h0nuQo0bbS5l0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iWst2RmO9oOjaMv6ZnCt6F5+DUy7Dl86ry1DmL3uE1yzIatM2ZJ0ZfqJj31LhleG4xvAWkDwcRuE9T6To21pyspRuSDPglzb9DC+SAdj+VlNM2mhuYr426hcI5c2/GKbevqT11gpbAv0aRX1M+omxi7RaEOxW15mbvzVnkDY1mE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=PzV6fkCC; arc=fail smtp.client-ip=52.101.69.139
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OjnxQXmTnGRHguExo80S7A+tI+LtoXI+6nmxejZLHFEPksbDxoGwFgUzkRGntFbnCkC/WjyDYCkpmkH9kjSAQL1uIsJho1pubLc5c5lxvY7yTac6w6nI8doj/fcfYxMIXpxQe4QRPLUo7KfaZQg1k8fx8050ZMnzWqArBJUB7YCoCDmS/77Lud7zXcBop07COC2kBNgKvf6Q9rsWZcpiaZR6bYpPsHZY1sZ5QFM7ts5tXJZXrlW1boRZ2d12TBhWBntCIZwUDaaj+1hLEnKZmzxXWvtY3CYDUUsoHcLxDYtNc3MWoRrIgHhqdTUrJnXGqp44gI+LGXGsYNLOiTK/4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4NnpCR8m5Q61vaQYwB+tHmg7AS31l7ZOwCdkgSO3cM=;
 b=EZ7oS4J3/pLZX6RDtYxzMihOFH9e9TWdK5N3McDknffQdMVa4izIgSVm/ixSQaLNeHj0ModDrLdpMY+3mTHc2Npmem/K+C7ZwVuC755T/6Kd6leGz1glDUsbLskD1KWGkvkwJY72R4847ge+lsfQB2Lw9HRyD14etVUkCL5mUhh+5PtueoVOu7pzKQTbvBz+OQksUzOGKu6lxCxrg5M7J5BWh+0d67xT9Mn/OWA7mPtW6HKuIjnL9GTiDS1xDEJU6eAEsVikXB59UmlYZBcyxZWgwCwQ/xwfn3fPAo1RQt2ehlvtuhCaXK5OSdWzuEzlNcohUvtxg3CNR4yBEzh7Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4NnpCR8m5Q61vaQYwB+tHmg7AS31l7ZOwCdkgSO3cM=;
 b=PzV6fkCCAWE7A1UYnNkBaU3cQ6kZKGIVBuwJXiVUWEhwz3VuXzAO6brfnnahn7+RzOyDnF5tDwW04mhOamrn/g4QDPkjOKf20hSNo989+t/IzqIhFrlIBktZlOxSmwLsCP/3gIuWrAwdXgf3IEguqLzyA7bNc/32KkeKsbJaC1tzOEjU3u9GW5CMdKXWjW9lFc+L7x6MwcHCJ7ng2Mrv6et+OrobpeJJ/PBtYcW0AnYOw+E4Qghvny6hauruClflmLvWBE1hSEkyoDNwcHqYzIvH1yFVyYuVwCRivJrHfKleGgK70EhemOLXu2FVp+x52eusxDYyLiXvPEtEurfAAw==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by GV2PR08MB10384.eurprd08.prod.outlook.com (2603:10a6:150:b2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 04:37:04 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Wed, 17 Jun 2026
 04:37:04 +0000
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
Subject: [PATCH v4 02/14] pinctrl: airoha: an7583: fix I2C0_SDA_PD register bit order
Date: Wed, 17 Jun 2026 07:36:42 +0300
Message-ID: <20260617043654.2790253-3-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 5afaab9e-27c7-41cc-a72d-08decc2a14ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|23010399003|38350700014|921020|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	0eIB0IeLV+Gfs1unVG+8j0STECppTq1OFTgXykjOlZ/GCtk74sxGQZYnY5mWbRfZi9VnURaPC+ZHMBzEJ0v2WymlYrHxYb6XQfjR8+lhpq1+RIxVs0uo0i2es2/NkHbvQT76eM5vc3gEGVqokLc4rq1sUgEZkCcoHMi/GlOtzmbL4CJF9PxfVQXH2dYZ+wx4hb/j4/1yENMxTJ3t0F3GZ4Y0aZTUoktdY+mu7DhlZDZrZ2wVAITvFZBnVkx9Me9RFhXi7UXf3IIKG5jm8E3CUdS7OfnaNiJpI/XU2ocCyGl/D10C+YcEpNNA9jLXxvaEqjFgnPN/k8Bksru2am+qVVYWyRreSrcReXNqicoNucsbvvZWrmBoUJsPTf6W85r6YmxTSgZfFOGfeARBynqIcRRC7b7EOtDOn0M6bSBAjnwl0YC4XHFqjcIXoI7wCGfQUS7s6xkesQLUT+U4CmZZJe/p7SDcRKkqnjjQRrhYEdyAxRyZnzyoA6tbMaCIe/khluOU21w4lh0zTibrSuBdneA2S6Ka5Qb3qLdN0VYD7+64yfKVqAnbvQTKatEXugXd9CBBqo9dU4K8QSb4LijWMf33TmQl9rRo9jGfjECZ56xAC13qDfSSyB0BdNawoK/pCowd1BMDq+quQqetwAw1rEG5AjE329sdreSKkrUYeGHHkl/Q4/UKrr5nepUTjtuylG1dOpuofJDn6lMAMdvu6QSYDrkcC/49e9uhg6aVyFWGIIh/uBIfkx4H/YEwU27DzVl9TncZj70VAzolFGLTiQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(23010399003)(38350700014)(921020)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SnqszdUsmQgGgS7XMz9L3LDkYmyyQbCIJiNfe6tZ1h4kmAenGvjppxT4+pKC?=
 =?us-ascii?Q?/Hn94V+wGVJQIzNUJsaGPR2CcdC+p3RYE0CojM+/saVPH7HDkcfN3iw5KBJd?=
 =?us-ascii?Q?dMyF2tLxg9I8GMGOQLxRy9ydQQtnBhPtoJCxzvKu50XupTpCZX4oRBDSXKx4?=
 =?us-ascii?Q?L+lTG+m5liBicKvNd6JlotYCjfsCCHzWZsVUvXIYRthLJQHgLWuHPkahnsYd?=
 =?us-ascii?Q?Hc0/jAt4qhAbe9LZdD1nVQ83L+D3h/07OYTvd/E72y6OkyLkLRjkiMui2g2d?=
 =?us-ascii?Q?luK9SqddCwoMnnrJR73VMzUlwt943xzTJZcDwxq6epKh3vTBVXUMllz7RjyN?=
 =?us-ascii?Q?XCvWMjUhd4H1Jew+WHQkBbZvGLJzuUvbBqDrKM+h/VNUpH/ajktFm4ok0m32?=
 =?us-ascii?Q?TIKb6g29QCVrK0iYHw2EP9WwICnBNATSoqb/6WNukqKNnl37FNrwsRjSEGsR?=
 =?us-ascii?Q?zZP929OxKmWQWHhua+y4ewJLWpGt0ubLraj6XmmfJo834jeJo7w8QsIqMwZt?=
 =?us-ascii?Q?Q98UrATU0qohJFaStaWZ+OEmgnTM50I4mVIdVxq0EM1ENn32sw6JSWy2of2Z?=
 =?us-ascii?Q?cSzxW6vcyyXEw8HPe91OgBQRg41vF9XQUhIlHyUIhluDsrfZTnIfy0KcGkki?=
 =?us-ascii?Q?nXy9lPa0dRtm8lxUCAVCTJHOEijRRY5b5Q4CK4wZV1OpH9gAqaWi/jmYWEf1?=
 =?us-ascii?Q?UxStk8yRPLS8u8kbCEBrBysWsI/VSUbs+EFOeMuQclWez2plP49I6hPvHYT7?=
 =?us-ascii?Q?PXd9z7NgYreg0Fotybk8aAnnqnQroeJzkekYMPcad5c0vdsBZHQlHmsE7rSr?=
 =?us-ascii?Q?bRveK56kwTqQSi71SyxYLIjv0HjEfUInCvMVVU7MSjy6NVnR2XzQEt0VAvqJ?=
 =?us-ascii?Q?Cbt4DAdaglAj43Hw0uJ8fg6zcGB4ONtDW+SAP9Ewgbat4sIOX2aCY4FBz6sr?=
 =?us-ascii?Q?7tfcHMj8x9cDxrX/bcQz/7+zoR5fOAxknrNTe5UuTXylQiU404inNZkNDjtZ?=
 =?us-ascii?Q?Qh6etqT6lMlcFmSCihgDxskp96A1+8y0hmRT5TBNCmbU94JeISTi/3qtQm7h?=
 =?us-ascii?Q?Vjp4ssP3wifaaV6QWQMC7hxltC1pEpxigwQQAHiE8ujPgbpCrQT/snyxIaCX?=
 =?us-ascii?Q?ojvcYK3W2yamUkMOQjdS5wsxyvzCY1EbC9lI51hqeMzXztxnCz4G0Wynhhk7?=
 =?us-ascii?Q?EvRnjfG3qYSgMJ2NsCTB0brI+iQANzbk5bcpsVD+KGXMrLulLv0rbaLuZcqM?=
 =?us-ascii?Q?zbLtR7m+VHjbrPEj9k0YvMdnDhYhSVxsPjLWmyTDV19F2ESiC5FDmpSbSCSJ?=
 =?us-ascii?Q?vSVyBro6MF4q+1+h4wsh5/UO+qn2T5fNzPrlT4/TNB/Dob9TUR1ngOTfnX5E?=
 =?us-ascii?Q?N3sEvsM+6e9TubzevI2jrsXxEaxoMk0oQmtxcd+UvK8A8BcBKaBMObGP+teE?=
 =?us-ascii?Q?h7NL5gcZHWPa7mPjXBvsL2uSWQHOrD3Any4BTqye5VrjmTp9t3P6RK61WyWs?=
 =?us-ascii?Q?qubdOGU4hmyqo+7UM9TE1pwIIsePDa5BzxBA46l4qJJHFklohpqJtoE/hF0l?=
 =?us-ascii?Q?rg8EV5NHxJBuh9IhxPHEWVnRJf+Dg6mnqET5OyJUhhn9il8W7CQXHWBExLWO?=
 =?us-ascii?Q?60zitfjMDuaN+5bdn5lnp/pqsAL49HkdVPUTEp2H8buIaTbGCxhlloY4nZzZ?=
 =?us-ascii?Q?12AUv3TTndGyF6orplVcJ5ofiT7qf3KFv2cIXvK4HZrU19j+OMf3zgpJtRnW?=
 =?us-ascii?Q?Dp8HAJY7U8uh/SayLFImpQrRnVO/fx4=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 5afaab9e-27c7-41cc-a72d-08decc2a14ff
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 04:37:04.7640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WyjMtAqGJXOsdHmyFQImLcS53Od//3NyoRscgq0pPZC0wLQzCQomQIkK8xA/m+qHN+kL2XpQa3dcooIQZW1Zr2cGm6hJ0AxE643c5YZt6Pk=
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
	TAGGED_FROM(0.00)[bounces-38603-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[iopsys.eu:dkim,iopsys.eu:email,iopsys.eu:mid,iopsys.eu:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C304A69671A

I2C1_SCL_PD and RG_I2C1_SDA_PD bits are swapped, fix it.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 63c82268aa82..4076bd0261d1 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -184,8 +184,8 @@
 #define I2C_SDA_PU_MASK				BIT(0)
 
 #define REG_I2C_SDA_PD				0x0048
-#define AN7583_I2C1_SDA_PD_MASK			BIT(16)
-#define AN7583_I2C1_SCL_PD_MASK			BIT(15)
+#define AN7583_I2C1_SCL_PD_MASK			BIT(16)
+#define AN7583_I2C1_SDA_PD_MASK			BIT(15)
 #define SPI_MISO_PD_MASK			BIT(14)
 #define SPI_MOSI_PD_MASK			BIT(13)
 #define SPI_CLK_PD_MASK				BIT(12)
-- 
2.53.0


