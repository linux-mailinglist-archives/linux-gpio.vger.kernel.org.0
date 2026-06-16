Return-Path: <linux-gpio+bounces-38536-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6KH6DMvPMGpZXgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38536-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 06:23:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C30768BDD3
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 06:23:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=cc9eNqTc;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38536-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38536-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 730623171341
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 04:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DF6C3C81B6;
	Tue, 16 Jun 2026 04:20:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021138.outbound.protection.outlook.com [52.101.65.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7593C9889;
	Tue, 16 Jun 2026 04:20:18 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781583620; cv=fail; b=G4dvIxS0ir1vyVi5+BB1sfHADLuN48lDc/O2JAaBuzjvFCzPG2QxPRhgP92ekS1e0uBS4ChowNxVAsxaHlHFJoFqG0Bn6YKGUujpQZpfJ1rndzaTZuDhYK9ck884CAcWElxWXXnLDD6JR7YAAcYNFXpjQ8RsOEV+nrwXoFYOk+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781583620; c=relaxed/simple;
	bh=BVlxZY5D0v3NaPv19z62dUKrIXUtaF63mmFBMkq9cCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P2ddmwouxOIsdwc+kt+vaBzNIV+tzGgXpjVgMGjvoiXi/8BQXBPrE7aC5Mj8Y/vWnWuQy7QtXnDM+iJBm7bQ3KewmyWDw4RC6HFWlQtb0dH2J0KEhKHaE+3KH7Q9Ox5gULvPpgbmD3Gn91Pz9Oz6Z7CIBU8WT1hXaPs4Dvh6RbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=cc9eNqTc; arc=fail smtp.client-ip=52.101.65.138
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x3IbH6WmIo5YW4V4JMrrt0b64tcXTNwv+DRPo3IfQYv06sh95KPlWE01qB0NC4mb7Mkdd52Ur6Pp7FGSINcXkeJFHGX0qqxSy7ejQvKGcwskj8mcpuBOFPHoGDO1sPP57yAHMeHJMOs+rJBtgitIQeQnGQJ2yixrgEgY+ydJ1ua3DFr7vBHkjv8JvjIWoNpneu4LdhYsCXrKABgVTI+Y3Ko/R9xNMe35gCMKYjzbQoxCILoGSEJn+m71GmQeVLZVHYaGdeiNPTsnj/6h3VC7Ionf+a9uzm41JqNS+oF3uCbRq8AhswQ0y0v8PrtZaenXsQJ7cX49vLJMXxMlYYmEsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WEZqaIeaMkDZTa3VVdkBUl+UfVD+FZ4iH6LW1+maZQ8=;
 b=VYPOaIOK4xEJPPyI2FCRUYFTna9P0pdLhT3fkDAe0IVEbpQMPe48PhYWfSGSCvosm1sm6V4sphgH3Zf1F4KpcV2a2AaFGil64aglozwyX0MJqMREks0VfYAFVL5Hbx0jwSkqJGbsEqDu1H/vC39kquOosSJHqgfqmzrNVKN//MLs9CTgOnnMSd7624/UAv0rzfqhYelLD9T5wwgaLs5YtCqp727Mzn0EjhykJWcLOPiYbwNMA7OmUqjHL9gqojbFRHkMXBoFruZpL7nWQ/t6A3q770gTJy8NNzswztkltvmvsdipGyjLnFofSUW1X4yjL2+9sa/Djltn/cR12eO4+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEZqaIeaMkDZTa3VVdkBUl+UfVD+FZ4iH6LW1+maZQ8=;
 b=cc9eNqTclZaaJOaXpdtabjYHDlbz9PNZFd7sDHB5KE6aLadI+T7yHN4P72D5Uga/vKlyJRHFfNoKYAH8rA7rm5kp3qBhpbqjcLNrU7JQGhcVHjxjEfw5FNJTdu9ZuXh4ajdG86BnZg4R0k9MTznGfhvm4tP5h+gzs1K8KpBcVgsm+PBBtjbyRUZJbtMVVLB0IjNdWu/WSVQPD5xyfxEyUAEHXMEzC780/XkD5XZWuyoyBkxhlLB1WmAD93z2Bk7Q6S3n6BqGqZjy2/GKUkBv9bdYFQ4saHxx6K6E4OnC4LYGW0kg1c1raCBKnvzXNRJnNCFBi7GhYdnIt/ChvmFczw==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS2PR08MB10055.eurprd08.prod.outlook.com (2603:10a6:20b:645::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 04:20:05 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Tue, 16 Jun 2026
 04:20:05 +0000
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
Subject: [PATCH v2 10/12] pinctrl: airoha: an7583: add support for npu_uart pinmux
Date: Tue, 16 Jun 2026 07:19:37 +0300
Message-ID: <20260616041939.2587012-11-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260616041939.2587012-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260616041939.2587012-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0231.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::11) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AS2PR08MB10055:EE_
X-MS-Office365-Filtering-Correlation-Id: 64a1ce45-cb95-4d8c-a060-08decb5e8ac7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|18002099003|22082099003|38350700014|921020|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	c1ROzFVYDjqBezqJR2ffS3OSOEXD0rbSWwG5SV5iZ+/5ctwdc0ko/y54LxKFza5YjCpMaOpm3Tqer6cdc4L0wS2rkx+8KDu8y9bpqInVqnEqC9MrowS7E+bn7f+l8n4gqElJf8gytUbDTzW022yLZU0zQtFsyeYKabB4ERj0epjglv+ZDRp9VewacbRtmKjW+J6+SK1oxHuR8tmH8pCklIszhSQqoy6Vu/HMza7aJUWsnM1YRj/Wg++1VET3zzJiMwUOEKAHaQM5KjOaPTCna1cNM8w40znG9RDopxDqb6MLz4C29ZzCStg2CM4Bq/Oj8LblQJtfiln0W+sT5mDvA0F+EqT8btmVj8E6O8Lca/3CFwkzGzw0EiLxlxSdgSgc2QjOT8XcZm9uVUNYRT6EGVD+W/DW8f5BIfJHfXddyby2kC6AZfEC2n44j3dx5xhUbzDxOOo8x7sIS1zZbJ5sYlpvGph692y28QYiqKByptjmrqHrcxZiwQ5DpaGOsZVwxUyh7w45eDkZKKwZRu4v/NdbuAXB/3+E+eRm4HbX+1xJYLEglA0nXmAxiYZaJGrOV/pSDmC4zUlqxsZY5j0dXDyVhxks2Lq29Qpq27yxYvum2/oKN+x6Tu+BlPgd8kb6z/Xjs3NhiEfNKfWxUn1QG4pvOswJ6PdiApGl+DhfRMnQSNY0IBZxTm6/Fm87I2AC5DdcwNUD+reH+YKus1Uwp9m07q1OhWCTfCHCN/J0AkGa8hb9PBk2K0KmIrCPTqAxwE4kH5ILczJz0hpxSOfGbw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(18002099003)(22082099003)(38350700014)(921020)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U2bO1ncCTbDG6Bmqgvw6OAwTgxdjFz/P9B7MEBqvx2PlBuIP6heEGY82TLZ2?=
 =?us-ascii?Q?eRD5o73kj05UKlnrHJI2U1CrOLIUdWHcFh/4H2oZ+4CQ9gHmD9cJnU8ygcRl?=
 =?us-ascii?Q?mMzNaPu+azXA5n+WXkUN/9eoRS0mi4jAcCcOk2spkD+LrQe4NmC4v6vdPPDF?=
 =?us-ascii?Q?00whVhXpSrSaMTT5Wo9nL8CtSRns/n2oO19+zNmU35cBc6Q+S4jbgPtmuoLk?=
 =?us-ascii?Q?4ntAM3Hbw7I2Al0xEuhcBGq+hjswRSGHuJ0YUo9RqQDCGMkMbowSjB2bkFYy?=
 =?us-ascii?Q?vZvaVWL20dm7Wak+VwHN9sz+X8xMUy4fED9e7jeEGucmJWN9amV+zjJX7O4D?=
 =?us-ascii?Q?HqLGmyeJrHBWlro7Jgm/aI3xeSqGy0tD3up9xG6LyTI6lWKq76+b0IFkZPeE?=
 =?us-ascii?Q?RaiLuLHawGxDaqh3SokRIH3/sXd3QGKGrQUkgl4V17DxDoFLpRPL/ySLxi+w?=
 =?us-ascii?Q?FkMRG6o55GsFfCBrxNkremDj5TukAH4hhozurWe9+OCz9qa7L/Og4GQuEuMo?=
 =?us-ascii?Q?/sp2gkB67bC5AjPBPHrZQRFG+82L+VeZuaRWVkk4ERheAcAZnAhZtRIGxWQO?=
 =?us-ascii?Q?pGtFh3Ruuf2oiuuNe5M+PMK412CP+wb2rl1NbT0ve049cUXEgvyn28jKKeSf?=
 =?us-ascii?Q?vCBBz3xssWRHazi4ljxSCjydnLEf4bF0YIZfGnH0kyYvqkIsmDEQkfSl3Vo0?=
 =?us-ascii?Q?qY4+mcJgrm2sBGNLxx3yMloh/0syGKtuXIxPHbb1Uo7S5/1qXmbr2GR5Gjza?=
 =?us-ascii?Q?aD0NOyJlBSEZhcBCNtl/hfCxx06C4Et1yH4M1LTlKpCotRxhAm+k0OV8wGsF?=
 =?us-ascii?Q?hdjrgZproggUfsOgIxdLiMnHwbFUmIdqOXT+nEW2j2cTQXODzTjIC8r06pwd?=
 =?us-ascii?Q?M2MuOMRpfz2b5dVfz4NYUw6fD2B9yeRLmmdENCokiPXK0hPed1dkRoslHHCm?=
 =?us-ascii?Q?kMVl79kcUYZI1NH1AJ9yEsJZeJDq/usjP0CTMV1Uu7iYaOeZqsApUVfgooP0?=
 =?us-ascii?Q?8apLMz5n66x7kuSF6lMdhdoT8mrlmX6qp5U14onr6bhzptsnW70oc6zVK6XE?=
 =?us-ascii?Q?BPp7EVlSVKioaRHNNVtLt0nmkKioTUsMR1xEx3o3oIBBdc4E/3+drb6eWnWA?=
 =?us-ascii?Q?sr7Ot4bfkn4zwSZKJiXgtjEDdpgWrE1VzUwWsva057vEV67pz/OIb9/0ZfwM?=
 =?us-ascii?Q?EfuC+ATTI2UpueiyvTPitm6GYPR+xFwx5b8pHs2ju1rNaSZfD2ydtK14vEl6?=
 =?us-ascii?Q?qaKFlMyyObOWNhzc/3sun7AKi4gD2I7IPYcs/3yobXaVH8qffBQHxoiA/q08?=
 =?us-ascii?Q?TO1GrlwSWOT9hyC0ElFFXXPS5P67LcIE1At7sFxpAeJ+xZI/r+iXxSymchKe?=
 =?us-ascii?Q?fApLE33O4OwMmbKSXpxdFu6/Nb2bpZndryUY0YANmexGgx8b6L0fQ+zMsg19?=
 =?us-ascii?Q?7ACDiLoxa9ckAX0Uzfz483d7RnYxV4aE9Fp3STk1MD+j3XMgLssErOfW4pM1?=
 =?us-ascii?Q?dAo3qvtvDz4+6iFHSQO8a+ArxOVJQ0QFsQdFrD09Er2P3kMARtIdIYfLyoXD?=
 =?us-ascii?Q?bC2tttT4m9t6q3FvLQB/9cNslpjhuVw8SIzGhJL4NWEK6u0JLYK4brMtM/jA?=
 =?us-ascii?Q?W+3V0NkOyIx/C6jvE1CN6PouFXfNxe0wC4Qq1+TejkE1Lvw4JcqHNi4u8/jH?=
 =?us-ascii?Q?RpPF/O6KCZdtAH02itXELuX+6jyj01kusfHiMRHphkKttAo0XKglQ1dODz4m?=
 =?us-ascii?Q?38WM+qgGoXyjAGSlapYMwsT4m8TxBOc=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 64a1ce45-cb95-4d8c-a060-08decb5e8ac7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 04:20:05.0240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MKKA+EJz/L152iZ3uikaK4jgMCfpV7KJC9N526TPu9f6BfJowwynglsdc7Y9LQAgOCKWXKk0v78YfFHLt5ZIDV41rRmlmwmMBX30sLKKhIY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10055
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
	TAGGED_FROM(0.00)[bounces-38536-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,iopsys.eu:dkim,iopsys.eu:email,iopsys.eu:mid,iopsys.eu:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C30768BDD3

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


