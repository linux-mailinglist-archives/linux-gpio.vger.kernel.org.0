Return-Path: <linux-gpio+bounces-38800-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mDgtMjIeOWptnAcAu9opvQ
	(envelope-from <linux-gpio+bounces-38800-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 13:36:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EC26AF234
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 13:36:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=e6+ilu3Y;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38800-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38800-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77CD7308523A
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 11:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EC2028F949;
	Mon, 22 Jun 2026 11:31:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021119.outbound.protection.outlook.com [52.101.70.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBAC2BE630;
	Mon, 22 Jun 2026 11:31:17 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782127879; cv=fail; b=b/8Mr04DWALQe4K9Xysru9bqR/wy+DNLykrB8YkDa6s0W2ZsyOvVQI08ysHCOXYMh5+CVhEVJgE9PVWP392q8Lb1BDl92DlXACNuufPGplWhFzpuPopIJSMK6HlbPkAaXvs+N5oup1G8SWdPA0p6VtRJfm2lZc1haeNsuEcigfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782127879; c=relaxed/simple;
	bh=oXMmm5QPMbLkF9s/J7Ws3w+Q+iQZ9ltpQf7dHiYI/CQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jULxp0yidMX8mdskkv7D5eiqk5Cd8Sbgb7xjcKlpi2ULnCbFWPQ2rFCisqi/DnhLl1d2t2eygaSXJ7+9ZFZayTBWZUr4u9ruYSBSuDdvT2kUHwhRctUpG4jA9C0anAlMG2SuHv7wQGTYF8jmF0fjZX5o4AjLZHzK4QXB4L9jMjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=e6+ilu3Y; arc=fail smtp.client-ip=52.101.70.119
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vPXDhif7tLWUCULQGD/ZKkJGQ2KAmvkvg96kcWF4exBQkyKglHkhmh5hxJdsaEXE8JFEO8zR4qLv5Myrd4ZC3iZVAEBI/SG+ch9f5OjIC7iVSnO8s6ccEymztKSvv16C5CbMIQp6kt09yzEMicW8MBUaEMl6s2QdJV86/Xuw1F2P5TZx92/h20BiAuaasKY+FIOZ/HrcNvWwqjdxUuPeI6HTLUmT4rucarl63y2o/42jP8NYngSTmTY/XnDCYakyeiQM6tYKuioawAXoODzGIiZEWzD9psCBWg1+NO8Z0U8xC1LMMGvkQqntYFGRNPGyW3iBwNUvPNM/61jFVNloyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIk4uJD+uiOIdEPql6c4kq8qdSpisKJS6pkA2Z0nKWU=;
 b=y4NR7OnpMl7acAQJD0lX1Quez0PzL72olhKMRy2jdcJQhaneHI+t6CGriQlOlmzJdwPEXNevIkVGgRg2ZhOhTC+vvi2WS8Ise05b03w8Alz8xTIE196EF49tz0U4tff7PMvJKziPgltdj/4EsYBTyUtm/XfzgC0uU1LECgrvU7fhDGSHUYR1WBYkfSC4m4IkshvafcuW2Pxg9W/mdUrQVni+73DEGorr6S4x03533TMIMg8M0s2sw8woS0EefmxVfmEEviy1smkJ9AJOxzqBNe/BJKqMH0SFBALSlolxegU3f/y0I4psV+ZfUbnw5F/bfZ1tUtzm2laVIwORljOr7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIk4uJD+uiOIdEPql6c4kq8qdSpisKJS6pkA2Z0nKWU=;
 b=e6+ilu3YVOayR5GRlWcnw5/sKASojqTwR8idfjRWSN1t0eEunjgAfZ8VcKd8Na7125a1ewK3MnAIqdgGfbCV9LrkN++PYMOLRI6fmgG0azUw0V1UPbQ5sJkt57BbM8DE21iDkvULtwVPAwSuzwNRmr21T891sbboBFitgGGhWY8lpJkb4rhODxHfB7/w3YjrUawp5FW7JdrkRs/glbxDc00oXpHpgYquXz16UiP4GDFr71VupDwf+ly8yV7Bx2oPy4lOkpebwqiMG9FsPj6EfCkVIRh/AtHU8farWHU1fx8PJ5YLB22bLnH/gHz6UYl1vHZrFnzglz9ejimyAVPpxg==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS2PR08MB8334.eurprd08.prod.outlook.com (2603:10a6:20b:556::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 11:31:08 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Mon, 22 Jun 2026
 11:31:08 +0000
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
Subject: [PATCH v5 10/16] pinctrl: airoha: an7583: rename registers to match its an7583 names
Date: Mon, 22 Jun 2026 14:30:40 +0300
Message-ID: <20260622113046.3619139-11-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AS2PR08MB8334:EE_
X-MS-Office365-Filtering-Correlation-Id: 09421fc2-a5f1-4dca-def1-08ded051c110
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|23010399003|1800799024|38350700014|921020|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	I7SHVT3A13mBWiiOrd9O2m5Ffwe6KLV6eTP+dWPIx+IconqvfnkKlt3ebtFdEJ8KLGrLfAeXA7lz6Yupj5VqYFK46oJr/zO/2WXp2wtoJ/7IIF8Ni0oRBx5a42Q7X/tBEy0bx+Y9N4S361KpRRX08h3faA4yfdHwux4SKHYDQMKly1jZBUDVK/9QN7c8Lt8oQkBD9as+P7sJ1WME81wZ8wtap/H6Nwyl92GCDV68je3NwF9vMU51tPOJRTAkRrtWfNTkAziqzDsmCbcTTXlkB5Lu97RHLtZ6TSKllrCMbHrXhrj8GsoytzdwGQ5aIIGzFg07LyfIF3hq999DnxL5fUVxUYzBJx6Qn5TVeqWab//xk4puflj3JU8AhBqzf+1oggI9fh8EZ3TDvb5OkX5US3sVx0x3NKs02jWVz253I44Wg5LR9o5kF7vNAPYG1QY9cmS1WLW+qfsHrXmFgLdwHE3B7MwSFJCO+ldTuE6qDMUiDHGvFXZFgfzCix8UxlVmhnVkXd5xxCy0JkicRd5Amsk7JxB3W4/DLSnTnRbpNWaDrZqXBUPaUN4gou8hUPTv4XlMkG+XLu5UwDy04Ld33OwXPNvSEmeTNAJ2btKjTbH0QVORXZ957/dsD6ENzidmWu9Z7CctKA1US5eIFRC6gHngraq9WXlkfNnTGDmq8Iqn8OTeO+GrM/q/rBmmgHWFRUmCikHOquAeuPIMff4GbTR9F0WQ0fkWfNIM3/RBBDc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(23010399003)(1800799024)(38350700014)(921020)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W4p8exkvuKNOqnqfU3sXTNH4XBNm/p1Ft4+s55sODln55hyF47DHAMQ4vnK2?=
 =?us-ascii?Q?mXiSOdNpY1+K2+uh+t6nhN3uwKmiKg0ux2Q9fjOxXwPwynJ+fcImq/T9pmAi?=
 =?us-ascii?Q?pFkPhiSlErrWu0vYwDvlC+VLW50oVYFBYDVK9SzOggFBzXiXcajhAxynqlLN?=
 =?us-ascii?Q?7CGdnKqzUQpUcFO6w3AT2lfmh0EafT2d+P1kLBgSS9SETC/RvEJ0spfDL2Uj?=
 =?us-ascii?Q?MEgr/0lxWZx2HGsG8AZ3DmLHkXuCkYFfe6uLQzgUbD7XcIYUEJb+BGoCAtWh?=
 =?us-ascii?Q?NS7FfbLujjzoAOfzgbS4x91mulzvKTNZmp9/zNqfj6QGcGS8UTYzKlljWDzE?=
 =?us-ascii?Q?hsseScaprNstpqS72bArzlUBjTLz8v1TzNcArk9OJO3h+iPlTy4co6Ley5wG?=
 =?us-ascii?Q?e8yXecuiFG68tT8mW02lt9rJ7QMU5wdh2yIBV+VaYMApAw5Q1b2sJBOhoBEK?=
 =?us-ascii?Q?6SKzEJmzHa7vp+zFcapS8eoy2PWEv0htk0eTD9UEWCusj9s0lscRT1txAMqM?=
 =?us-ascii?Q?HTjMBphecSaaZydN3dSYUv7EVXerV9wSbNIp4CXpqOwlxAubHgyWpMqpCkda?=
 =?us-ascii?Q?dwxDITASyXkAoal+Nx2e1IE0b/0R91SxVR+0759B0WARwwMp+vO/eNaWRsKu?=
 =?us-ascii?Q?oMZ0AtKuQfMRuYtX3JEKs/51t8pD4iS+NpOY8w8tPifjLHREecAFBQ/bIu4V?=
 =?us-ascii?Q?knvuHRBPGYbKKt2JHptGuUtjktlaM3tbhFGQ9GBLxD+Nz2NehIkpSk0JCynI?=
 =?us-ascii?Q?rlGSKF4cVtjaOJ+6desdn0Slfqw/uGXXOYGQdlOwYYApt1bvR7QMG5UhuU20?=
 =?us-ascii?Q?y/oQBRZ5dKBqxX/UWP/nNH+DYJyqHlzq6/HyMkIBnuxEe5Uqt5Ct67XqA0Y/?=
 =?us-ascii?Q?089ET1XQF9RYz4qsxbMjv8MPX2iUv4yxaFptAahZNyTozfJmc/IwT88iWHNV?=
 =?us-ascii?Q?jxzd/xAGXBeV8i8Pg6yg9dCLfYADTa+LaPaMa+sMHMW4nmm1Kheg9LUpJCY+?=
 =?us-ascii?Q?kCcvjn4KpV0BzKFIjhdpVl/HpbkL0CKnf2IC/fZL0KMwdgMjBPt9CBw/R7G4?=
 =?us-ascii?Q?fl66pfwrSIfL9/zhvNOcfr2266eQ01McUOOlbXkglMGWZHKGbRbSk2FeKWdI?=
 =?us-ascii?Q?xWYDX9g4H9CkSb2280s40IPIg+Hr0AcntbaycUVnW8KZc37D6X+PmWa/AB0t?=
 =?us-ascii?Q?CuyyizMvbHEgzzZuDRM5ajUkDGgz19JSHTojrlu64pDp/DCGVlU158JWaSxp?=
 =?us-ascii?Q?GkeKlX9rg0EBt7sqgRNOBUJEVyWKDIghQC7R+FRe5zQUthQeq1DorEl7gozX?=
 =?us-ascii?Q?yznVpyUoVlTrgKKay3uYrXLteGhlFYD24WvqsynMWrGCwfDAVGHoPQ2EZoFr?=
 =?us-ascii?Q?ievShXyJflZbT0LrmdNUMwqUI3XxJ18SIOfz1aw5dCVOkqFkSPTDZ0TIm4uB?=
 =?us-ascii?Q?v6xdeR/vhXu5sXJVFMbxZoLwk2AT/s7dMa0IXHO/wwasO2xtEbP+5cm9WsVg?=
 =?us-ascii?Q?jXLYnCJSVkVqWH8jTK7TLbK8WKokmigEM/8jUmU2P1DNtPcZ7MOngoGZxEB+?=
 =?us-ascii?Q?KUs3PiPfr+i2Lqta5vKpEXBrxH35ygnjMlNrQRLu6DmVnSJxDzaMjDFEM2bN?=
 =?us-ascii?Q?eo+yKIMk0nWh+V7s0FcNIIo4FZgYOhlnPw6FUJUUJMRpSmswx7FX0hN2UNcG?=
 =?us-ascii?Q?8nNr2IDgOoaJIrSvKtEpTnqMUQssyr7NmRcmNpkd3ahb/u+tqLeEUoGDf57N?=
 =?us-ascii?Q?SasS3dAp1awjgLptCLJrsEkeKLLM9gM=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 09421fc2-a5f1-4dca-def1-08ded051c110
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 11:31:08.4960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1wHSY3dpalf24pdZ4FJjp3ru+4eNQSRNJvBZbsqAnP04us8R8Xx5aW/zi4JZepWdNSTvr+2yQJIu2pixCdHgkOCbroGMSHxqFEgwsDdCnGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8334
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38800-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,iopsys.eu:dkim,iopsys.eu:email,iopsys.eu:mid,iopsys.eu:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 23EC26AF234

In the an7581 case the register at 0x1FA20214 is called RG_GPIO_2ND_I2C_MODE.
The same register in the an7583 case is called RG_SW_TOD_1PPS_MODE.

Let's rename this register to avoid potential confuse.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-an7583.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index d4fbb12fc639..2f2dbba50b76 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -8,7 +8,7 @@
 #include "airoha-common.h"
 
 /* MUX */
-#define REG_GPIO_2ND_I2C_MODE			0x0214
+#define REG_SW_TOD_1PPS_MODE			0x0214
 #define GPIO_LAN3_LED1_MODE_MASK		BIT(10)
 #define GPIO_LAN3_LED0_MODE_MASK		BIT(9)
 #define GPIO_LAN2_LED1_MODE_MASK		BIT(8)
@@ -302,7 +302,7 @@
 		.name = (gpio),						\
 		.regmap[0] = {						\
 			AIROHA_FUNC_MUX,				\
-			REG_GPIO_2ND_I2C_MODE,				\
+			REG_SW_TOD_1PPS_MODE,				\
 			(mux_val),					\
 			(mux_val),					\
 		},							\
@@ -320,7 +320,7 @@
 		.name = (gpio),						\
 		.regmap[0] = {						\
 			AIROHA_FUNC_MUX,				\
-			REG_GPIO_2ND_I2C_MODE,				\
+			REG_SW_TOD_1PPS_MODE,				\
 			(mux_val),					\
 			(mux_val),					\
 		},							\
@@ -640,7 +640,7 @@ static const struct airoha_pinctrl_func_group tod_1pps_func_group[] = {
 		.name = "pon_tod_1pps",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
+			REG_SW_TOD_1PPS_MODE,
 			PON_TOD_1PPS_MODE_MASK,
 			PON_TOD_1PPS_MODE_MASK
 		},
@@ -649,7 +649,7 @@ static const struct airoha_pinctrl_func_group tod_1pps_func_group[] = {
 		.name = "gsw_tod_1pps",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
+			REG_SW_TOD_1PPS_MODE,
 			GSW_TOD_1PPS_MODE_MASK,
 			GSW_TOD_1PPS_MODE_MASK
 		},
-- 
2.53.0


