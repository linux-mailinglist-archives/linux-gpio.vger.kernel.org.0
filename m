Return-Path: <linux-gpio+bounces-38035-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HU73Gp64JGrB+gEAu9opvQ
	(envelope-from <linux-gpio+bounces-38035-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 07 Jun 2026 02:17:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FC164E8ED
	for <lists+linux-gpio@lfdr.de>; Sun, 07 Jun 2026 02:17:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=2s+i9Dr6;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38035-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38035-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A04513009834
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Jun 2026 00:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EFD51EDA32;
	Sun,  7 Jun 2026 00:17:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021083.outbound.protection.outlook.com [52.101.70.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7441AC45D;
	Sun,  7 Jun 2026 00:17:11 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780791433; cv=fail; b=O+sItBENEGDs9StvYXgDyoO/TSIbc9rvG/V1h3jL0Zkw7eZgEYnKI2m5m4UDVAzdbj3a5eW6Ac4Du7XUgz45n80q21unxQAQa2D9qJheronBiX98nnNrK8ea5X+C93eyPAC0nYEHLpSVgMC+f16Gd6/+iQjdgjO93UX8quQid6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780791433; c=relaxed/simple;
	bh=Jz8QfvOKa1O6e+F/17SjF7iOoYXHvrCjTUQbdJ+SkFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dDRUi3wn2nN5bgzBqg1UeuRX0adOckm1wrtPJSIgJUUCbTeAqW6UX8HZf2f5qHQxv5D2/UNc6Y2i8TofVPUQInCuGJEyXNkbo7c+KkNDdvnU0DpFNH2MeAY14gpOP48Ls3YUl3I5Z5OhdYZpx/HGax8DXBJDoCijmJQGIGu02dM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=2s+i9Dr6; arc=fail smtp.client-ip=52.101.70.83
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pbh3oXCvvbtVLXW0jnqEWPNIJK/DFzUYeBSoJoNbVGDlQWOksA9eHmkDYngpZw0bJhFqvSMfkv3BLAgwOna/pCyJPExbQK32INFISazTocPgr7zTzPGmaMsir8BxJ5K901BSWO3MdDt7uIwiqhVfAFR/xaDCf1AXCqirRaXoSlVHjPuUnvW11adThHVe9SMc/R6CHkH4vGcd7hHsKRuZio6IFU2ULyf1ai+tUMa3zDAbE9hE18mU9ZVoDnsDMX/k14pGlwsNANKRmoeArroCDldfxkNUQNRL/2jtIfqFeqY/u8T4ikgnNPgAEIGwmry7GEocHV6kRsozocCiNiXOLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iYHpywDiWIA84+PeTmbyRbi5q8wAIgzI2jK56gjrznc=;
 b=FRLyWIk92L+pu9c3ubORudmebiwmlDG7sqoqYAEcTq6tCYYO+z++vzuoZjZQrhC4G/DpekeI0ZZHtCgu9YaPJuKGV7P73Jsl1jehD8K8RulFUkKYhWMScb91hA8AiVUxJsvMA6ftdnYCIFetbptGM55yCj+fhVNx2VLOfJSH/9No0reWu+hXOXWKqij4Bz1L57E9O7PX4esdWD0BR4KGqnRG2a+leynhYQz2PDLGt5fGvhywAtvPKZdAyymwGHpi5iJHxSiwZFflmLGG57JJEJZq/Q2nc7UDcAKG/2WGaeDKTJTe4ssRMZjQjjC8qGwqdcOd3OGttJ9/Cpf/4FA+vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iYHpywDiWIA84+PeTmbyRbi5q8wAIgzI2jK56gjrznc=;
 b=2s+i9Dr6tAcdxBEuzZfvVivi+Wk0NKOctuL/n1unoV+f4m064hh6ZxFj2m4+2FLkUof3sOts0kQ2LGlBb0plMyfKXtFyCHCfClRG+Qsi/2899qIrVyiwcDVkeccA5lU7dbW7a6CBghtZzpZQHa+93rjKPMAAjirvDyAsyszPBXJla0CacCE51ZxoSeLPGEc9Yn5ytAWpvn4uWbKAsQ7Y36gAfj/1pcbYR4lvLDc9RQ1OaQK5LrGT4rpbu0nLPiYC39zJSr52z3q+cN1qMBxqUofk6Aqb9LastsbP0S6stlgKuAgOjeb8bnzBonIrUm/wFDS31evgRKK+r9IP6pEfcw==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by MRWPR08MB11707.eurprd08.prod.outlook.com (2603:10a6:501:9b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Sun, 7 Jun 2026
 00:17:05 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0092.007; Sun, 7 Jun 2026
 00:17:05 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>,
	Markus Gothe <markus.gothe@genexis.eu>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH 02/18] pinctrl: airoha: an7583: add missed gpio32 pin group
Date: Sun,  7 Jun 2026 03:16:38 +0300
Message-ID: <20260607001654.1439480-3-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF0001DBFE.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::319) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|MRWPR08MB11707:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aef2f54-b7ed-42ed-273c-08dec42a1af1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|22082099003|18002099003|38350700014|921020|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	xfQJzKDVkf6Dhwtmk6nRlFPXzMVEwwJ+HFmP64vfdX7dwYLLONNvCQ0gS19nsnblN4sobBKzIwcQeOstYGNqS7SjglgrNrYIdsGTRDORHbn/TYgCCuCZ/ZeqWU5BsKJet23C5uTIlzfyKTh8TJO1U4wplnQdHWSv6rTkqBTik62CDFVDF9Wd51OZ1R6P94LdBH+JmD2omz14y1+OqE+vpiw6F9ldPRb6WbbB22BrGC0pSZpHwsRwmdK6rkgyF4ADZIUlkeiAZs4077miCw4c5cNp0MbcARL9cbXWw/dQwnHS3hSnN30z8ut8V8q4k3CFYzc5thcsv00MrMg0L9+LwbwtDLjI0M/YCVXZ0sZ3bnHQ1AtWg7jUNpK2fcRGcNBh9otZu0lq3j7UjVkM9ZmuX7cRA9uisuZWO14auqlZdwLu6W3Tp96YVSrfYrm/V+uXuQ2RRzod5XtupmQqgCLOmt74gBKXGxKAct3GJEVgoFkGABaonH0Mwf2cdVBoFUAE4Cd7I24aIGnndpxNu5hZ/brFiF406eejPFGJetsThzlShE+r4OyoKGqPWtbX7VTCEutUEc35QRnElyhuta7T98gGnlypBeuOcEClhRckc5ybuVIoV4PWaAgTpkwylf46mAf/PIzO6iSn9AQXYhfr6mpSfNOfK1KkbelQBga5iiIzaIXzLx3SsGjsed3hGsQIRIvZeH3ddPW+h/h5TjOhnOPeqtNYiBQJ0H9cHWlInGygNbJpCZSROk2RRFMBzyXP1KLETIpzFTBK40uMm3GLzw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(22082099003)(18002099003)(38350700014)(921020)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QBE2FydKZJO4sJsnheSooDp/MwrUalMvVtiauKJtM6H5lhRY0nQORDeoYjSV?=
 =?us-ascii?Q?uEh6dfCFwqVpOSs5cy8F/G3qyODEMqRHvHeW4Gx/BEB6Pc1UPT17cVK67oAW?=
 =?us-ascii?Q?6PES+pbng5EwGxNkPjauMwFQ27HGS8Gyt9JMO67VIIcKM8sgyQG04FjEJ/2b?=
 =?us-ascii?Q?5xS8lr8CJDaJggBjnuX4qDQGl5YZNcIlxOuyKUXoI5lvPomB/ovEDRUl07lJ?=
 =?us-ascii?Q?R8Yv5YrErzOLOr73oYiRGo0WzJ9X5EaGXlwuCConk8VXwQTTyojlC8CkYbCK?=
 =?us-ascii?Q?PSMtxYDa3BtSZbxrqpb7m6FhpDoamKSScEir/IvcRoPLvFkFZ4Kk4BCqqTzF?=
 =?us-ascii?Q?nFHxTAbfn945R0pfjuebhiGKoBocu6FqNyrC75254vXbBTJP9pNf7ffbKwIt?=
 =?us-ascii?Q?zqy9PEOXdSCwGGqjjIK01wqbD2DtKUYMW5a0C0y2/w0S3ZF+7bhSVvrVEBjp?=
 =?us-ascii?Q?gNscGwaENCQ4IrYBRnJDb4Wsaes4rL1Yi/Lsz4Krxhdq8ToVgFnVoXXdDQoo?=
 =?us-ascii?Q?yNWaqrVXblBbQMpj5WGS24IwpBRq+9oINgIj5PxB/5hnaAInAMFli3VrW0/n?=
 =?us-ascii?Q?Tn2rm/16LHKOuZ0CE6f/GHosltCi4s/cbxj58xOJI9YdBit2/LFHXP2GnJk+?=
 =?us-ascii?Q?i6vHzK6dg9AisMcG0W3SaGlgBZI4E1ULt1RXJwkMl9iQBIE6EBYs04nlWBTQ?=
 =?us-ascii?Q?tPK5bbipywsg0VLW9GIlEXFuWpBGx4eWHPyULxzTmi060hOcxZ/CU40kPlaW?=
 =?us-ascii?Q?3d59M0p+AMi1L4cdps+C2tj/n1pSrRHzZm2eGMFCzEfxYcLtTpNp/Oznba6o?=
 =?us-ascii?Q?fMKlh0db1yEop0jS4TAhhXkemZnAE3W0+uLJideLBJ7+YZrxAjZflI3x8rUn?=
 =?us-ascii?Q?R/nmBndVNoqnnTx4d8qwe6+eu05R+ovXguAhDNmcmszFZIzKYUhMebxOP9os?=
 =?us-ascii?Q?0pGgPRlwb61Kadrj6H4rvNIHyBGbJDFP1OzVz9EhP4+CREKNTOL2K/6e5MLu?=
 =?us-ascii?Q?FicQKFlu5geyZ3hnVVBBqvc/GPavH7I0lR1nHuJeekQGYZ9ESarJRPoLoaxN?=
 =?us-ascii?Q?9EHOVNind6uTLwfmR2RgLGONaQ9azsbW7+NMXKOuYjoKtZ1C9c2C0kH56vj5?=
 =?us-ascii?Q?UmdlVjqV95xxVLs3OYYnqP7bAa8ap680pOdFA/S2GAJQlRgwjA1xzFLGGgrh?=
 =?us-ascii?Q?Oltl1lHhfyv/mStp8+XC0FxYcUaPQuR5bjs+Tt2rc9D+2SXhGsTuFN/9uFdf?=
 =?us-ascii?Q?VBNePTGMaBJB9eA+tV1G60ao4SVgowshcpmnFVMf23BzO7a5hdqxhI8hcBHp?=
 =?us-ascii?Q?VATDSUg9SJNHLefCCDUugaLrNu+4ro4UZN6f2FkehoDWUkO+Ecd+Ps62s3AD?=
 =?us-ascii?Q?bwLhdT+x/oqeE8NS8UxdKOUbw95cRek8m4ddkj/qSAaCluVHTboqdr+asnvv?=
 =?us-ascii?Q?YRNqD6ZqcJyXLhZofGANh3pOlu4TNe80QVl1XpYLj4sV+WfKanLY+EpWBxY7?=
 =?us-ascii?Q?/fxMDD9Typ26orAWcDIUia5XY1L3PO/7xGjvty7E+XJj642OHZD28jOobM7W?=
 =?us-ascii?Q?v+BgmNbL1figsSWtZc/GADAvDHaDuR4Vd3LdKnPnn5YJE8UW7FVITYZWWKwi?=
 =?us-ascii?Q?K+Gg81L3Qa+rYqGsZoGlpt1+M1WZHhOieDzVi0gGRYxKAyEzNaY7CMLLzzub?=
 =?us-ascii?Q?rJ1LMdVPcRlKHRE1KQ0f4vWZbytU9SXPgMCKviBCnkUuSMHAGAuWkWfvUh56?=
 =?us-ascii?Q?vsbMxL0skbkfKpUi9j3Nkp8FEcaeLMk=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aef2f54-b7ed-42ed-273c-08dec42a1af1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2026 00:17:05.4450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mr9ksA8FwKMGRbF492kunftpGbDiQOHkQVIXeIbyTxNYS/5TyxjkjsebOL3Q/aAzTEzz3ynWKcNcyd9zGeFF/TNVUniWcfj8p42QhcpNbLE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR08MB11707
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38035-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,genexis.eu,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:sean.wang@kernel.org,m:lorenzo@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:ansuelsmth@gmail.com,m:brgl@kernel.org,m:benjamin.larsson@genexis.eu,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:srherobrine20@gmail.com,m:markus.gothe@genexis.eu,m:mikhail.kshevetskiy@iopsys.eu,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[iopsys.eu:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iopsys.eu:mid,iopsys.eu:dkim,iopsys.eu:from_mime,iopsys.eu:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 55FC164E8ED

gpio32 pin group is missed for an7583 SoC. This patch add it.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 805166223228..c0aed1b60792 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -758,6 +758,7 @@ static const int an7583_gpio28_pins[] = { 30 };
 static const int an7583_gpio29_pins[] = { 31 };
 static const int an7583_gpio30_pins[] = { 32 };
 static const int an7583_gpio31_pins[] = { 33 };
+static const int an7583_gpio32_pins[] = { 34 };
 static const int an7583_gpio33_pins[] = { 35 };
 static const int an7583_gpio34_pins[] = { 36 };
 static const int an7583_gpio35_pins[] = { 37 };
@@ -836,6 +837,7 @@ static const struct pingroup an7583_pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("gpio29", an7583_gpio29),
 	PINCTRL_PIN_GROUP("gpio30", an7583_gpio30),
 	PINCTRL_PIN_GROUP("gpio31", an7583_gpio31),
+	PINCTRL_PIN_GROUP("gpio32", an7583_gpio32),
 	PINCTRL_PIN_GROUP("gpio33", an7583_gpio33),
 	PINCTRL_PIN_GROUP("gpio34", an7583_gpio34),
 	PINCTRL_PIN_GROUP("gpio35", an7583_gpio35),
-- 
2.53.0


