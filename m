Return-Path: <linux-gpio+bounces-38037-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1PgpJNC4JGrK+gEAu9opvQ
	(envelope-from <linux-gpio+bounces-38037-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 07 Jun 2026 02:18:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2733E64E8FE
	for <lists+linux-gpio@lfdr.de>; Sun, 07 Jun 2026 02:18:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=w1v30PIy;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38037-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38037-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5BDF930182E5
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Jun 2026 00:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AAC7233927;
	Sun,  7 Jun 2026 00:17:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021083.outbound.protection.outlook.com [52.101.70.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2651D220F2D;
	Sun,  7 Jun 2026 00:17:15 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780791436; cv=fail; b=meVtKYvGkYyHAZRTwrfbnO6L04zLqWwUSPjXbELM2xOhDYkc8IyGWAMl4Ub2UjE0X+WT8XGIJ8MWrTV3bV2np6ec7OeEShTOcnU/KvzsjW+Y3pKvavTOSmI1uvoqUkrd2jsYL3raVU4UhS6QSYgTHiyYEOIc79BcMJiZ6qDwXiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780791436; c=relaxed/simple;
	bh=XgK8My/H9pK1DZeMWlQajEq+1uo9zvddyK4iP/ryRBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r98xmAZkUsjM/imAYCodgFT4Ovb3uQtI58YYvfus6P1I1qZ0YkKooPi0Jgjl8gs7RXVU38VtE9pePgEBIL15av4FscmmV/Q5u7uQDbZ1QedSzDZrlWCTYYylV1qIA3Y1mswfC4kAtostfvrbmiPhEgRaDWboWZoxV+BhMHG1PIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=w1v30PIy; arc=fail smtp.client-ip=52.101.70.83
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CExKO0X74Yhpr97J0qXIxfkAFXxarybgOZGDa+Ec6yNtDkY0wN8Gx+XrJzxlnZSFr6sTpLofQvugul3GhQqX2cIMjHa33GnkdYJNpkFlMS+8a40qHgO1CPEEnUXdk0nsTQkXvv4d3ID+W31B48eYRejRd9k+n6hAFTx2F8IH462MHO1K1aZejHPHWzi9P4Z7FbqIsHT6FuJJs9CPs5ysqyyoG/peD18wvgI82vrjN3Op5PNcMgdiARjrKNFOdfcPrqzWYzGyAU2JsOyeFTRu4pBstun65lBnYZncsGbJh36AtW/v/klXTG61bGnsclwvasfWHPlRdE0vTzyDsISHeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1SindAhp+XmYFFoCsHoEZJEhj8mwp0oObOYHELj6D0=;
 b=jFHGPnGDzjCsz60emDiI6UIj0+6kLeUwk6Jm2JoU/JosUVn+71I4BEPNjlP5D+6S2wq/wjzT6WVMF+5ZsqNIklBdqR0SO0SQSAoyQlngea0y91ReQ11PcZZCl4pd674utvDJWZ1QbrZ9eRf0fCdSVypMVuJz6MGqvsT+0PljCSlLmyIU9h5yUkldQvifBVTuAvS4JWqV5ot248mkSmOuGJmrJ9Rc3ZwkFGXq1cDJjfnP83gMEJWyPBLeZfC1GXDMybd1ke1GJbknkR1A3sssSowcoYevyGigtgS7pbllJmSiAwegtyYQp8wNYrSLI+1VKYuqo1ycXNu3pwKf7M9+Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1SindAhp+XmYFFoCsHoEZJEhj8mwp0oObOYHELj6D0=;
 b=w1v30PIyPZWysjtOLlLlVXxISAIKo3JFNpUvExaPPacmjVo7cwLc881bnesOaZekUvk5UKd8Ok13cBJ+GHAcLlN6GX1i756s2I0WMOpUlEvpX0qNVfwqKmyhDZzU3xkFOj4ap8Bd91MYnUuV6tLJ8usJ2MAH8bGGocg3aATrdtbfwxVA4nH/NfKZxcX360hHN5fbh74mE1O77bW7TohAhYdxgDAQHzvbytdXLp3kreeCW4X8DHWQEGrxqkLTBLh3H2N58NcDrr4tLCI4y7mVM8clb7WXfvsHUFwd8XUe/daTfVjSyiG89b1H6HyTNPG+2REVdQslDPHrldkt0JZcNQ==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by MRWPR08MB11707.eurprd08.prod.outlook.com (2603:10a6:501:9b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Sun, 7 Jun 2026
 00:17:08 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0092.007; Sun, 7 Jun 2026
 00:17:08 +0000
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
Subject: [PATCH 04/18] pinctrl: airoha: an7583: fix misprint in gpio19 pinconf
Date: Sun,  7 Jun 2026 03:16:40 +0300
Message-ID: <20260607001654.1439480-5-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 79f8150a-df65-49d2-3702-08dec42a1cad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|6133799003|22082099003|18002099003|38350700014|921020|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	iLdr1+byZZaUCcwb4JEOVMD23GEedP6b1EkMjbM/sKE7o3tMAW8GRPRJRaMA08LuxNStCT4vdNYOO25XRMWzzpx10OR6VOOy+LGb9httlvoXuTKXbxkYdI+0suCWRvU/+ViyPLM4QZ9YV/vLfRHc0PqrbknLQKLB+hiU+uPkViCaZP4IPohWenNL8toyYuxXAkH7/1JZpjALhop3euibl1SUF1OV8Bl64EJEHPUDeSZ7031jhc+Jr4tbg8uUDuVU3a/T7dOHlQRHQiN5XwQorUXA+eigFHIhVuTdXqQTeMe4HOKK9miUx1h08hl2CJdtmOwJmOZYZ9AMvqUudLa9d8fQzUbXvgQFLH5Amd8yF21x6KzGc9UjBUKkKLa0JXmh+L8ZDWlLBXycZTsxajCrvKykAeDNuR+t7cK48J8qASY/vvJLkPm7loujJGxVeqYRZByzha5fx8kQ5U9Ysj9+rju0iZ8A5YiFUUL7A5qcg/0vhWQIiOgO3df33/WxEJPqQg4en2qwFjPQX0RUfgrnGwQQnDVfH6dBNdL5n/1bRPcDffU47zKeWr/1Z3GycmDxtzUWGsnm5aDVJulMMy496+ZLz8G3XkjJkEtSxOf8OgIRC0uMvQMr7HRDwUpTSeAMN8FUngbLJf5ZPMXqFUe6LDcDYRtGeofisR5XdYSFNVGkq4wvUJi7R7qE+Us5OADTTOr/i38l5Z0ZkFB0VrYNX79OBLdlpl+PyDRVdSBEY9WtmuNn7orWbQ894s46CJ+23qgUhomIDI+Ju2cFS9071Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(6133799003)(22082099003)(18002099003)(38350700014)(921020)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PmgLQwtQN+IUOHLRhAz/nTQ3cc7EXcVL0mgSE21ZRArvhijW9qSysGnmeTyr?=
 =?us-ascii?Q?LIaOU5ex5VAfsJkXiCPxjRhy0DA7Ps8oEKmcByTVbIiuQZ1Gj/tHaLtey/nC?=
 =?us-ascii?Q?ct+PPOv+x9ttkGgGHzCCTiV/RmGZaL7/erLGXCuclEN0aehu6S7a/WobMEt4?=
 =?us-ascii?Q?q/nEYYy/1+nx+kyKpy9q9Tvdax1GdHZkKpQZUf1935homfjz73l8SUYG2opT?=
 =?us-ascii?Q?quNnqX9MU0CYiN3kQzlilu2vUAFRpdA3zrgd/L/YPiEs2G2a+yOw98TioCk2?=
 =?us-ascii?Q?RFo7LkkB1rLnUfbGny1gGWo1VKD1VouSO0bBYfnUfT6+YvUrPZEpAApB3XX0?=
 =?us-ascii?Q?flpCgCSoUrYtvPe+WN1u/ha8x8/Mrl93s9YoTok8Mc12T4Fbx8sTzr+n5uG0?=
 =?us-ascii?Q?B+Ph6/GxDos+B3B+E/UqegK9/S6WZnhUGWj9Bm/lufSEXlYmKZN7QJq/qfNL?=
 =?us-ascii?Q?dJu1zzgIszLpTEiljMTqrkTRsGAPwMUdG6LmpWsU/MQGaM5H0OTdUxOQbiqN?=
 =?us-ascii?Q?BOFCEBe2wcz6WUWx3jZzCtCZldmt7gZc5SRpR41maj4DrV/6bdFkrOqKvwnr?=
 =?us-ascii?Q?gNABaZKoY+w/jmEquJs+RyCUNBVUOHBXrCI+Zk4vL0JiQI4LynI1GcmI7JX6?=
 =?us-ascii?Q?2wsD2OWuyompg96Ji9Tj9vXV/vyysJ6uRoPcONCM2xm/FoTMFNxFCN6IzCq1?=
 =?us-ascii?Q?QG7E55T+/lxPQs7J+6dwhlFu1sWP+a08WifZuJuo/0EiQ8HXDmdd/Jx1ggyV?=
 =?us-ascii?Q?R3vtAlJgN9PQRtqj7E2BxfIrWHDqnPZh5IaBJmKIVJraQRwsm7Lpe7v83Smq?=
 =?us-ascii?Q?V5cEogF4VbFZDsFDhlRVQ2wcOPYzG5vp0poUS6ghpfqvrhogYAxeIdGBooWX?=
 =?us-ascii?Q?A/1CZJqY49b/35bG701ZzcWsKbRltO334zpS+sB3i3VL7xOBtThQ/t24sR1a?=
 =?us-ascii?Q?6NqlyNxFsdfd3JHZDT2LfcMewZsIaZ5UBvEeV5XKDkAjtJ371QhLbY3hgrL5?=
 =?us-ascii?Q?V1nAxuz1tsljYQ4XF9Yw/ss0YCTZF/2dgO5qq11nOHQe7zt9+L5FnaBlB8jP?=
 =?us-ascii?Q?FAW9Pb61tDxFpFuA048k9vyTNeQI+wlktdBpChHpqCQ3tqJrzTAWMv+/1/rZ?=
 =?us-ascii?Q?lnT0qpBfEYD/F2ITxuguxgkdjtkzK9UzGLqaM7K5kHvQ4snrcLyNNc9PUbKs?=
 =?us-ascii?Q?axWDxnsidJb6DqTxLtPh3d5SEjsasDvOO0A5DW6YTlMCdQTp0rUZC+uxtrjE?=
 =?us-ascii?Q?2RpE6/SNQk6rvEI0OaC6TL3+cZYoXsO8haf/A8e0qkzFPSMfQ4GPZNhoVa13?=
 =?us-ascii?Q?jJWAnuYEsk8FRSontP4yTDuQV65oRC8c5jRgNcJDY2GZcyn739yUBwg7YhKs?=
 =?us-ascii?Q?tzOkf4t3+GQERhCnyFq13MCWTWR7aZ3w8WdibOlSkAEF8DxvTMoVguWPR2FO?=
 =?us-ascii?Q?L9NXUnldWuqpT9eLOtnBzPAjgprv/S0CR6a1IJrt7afn6NmYBFK/lnkUTf7G?=
 =?us-ascii?Q?W3+5JZmYIn9lUiAIsrqqb3XJaWAfcjq/ygNL+bskX/Sqwt7BZ1AfwlyBLPFO?=
 =?us-ascii?Q?mNcjbTJXWkrlYLFW2ARw0BVqdZx34Ayy7AK3cRHjvTlm9yzEG6TPh26TcNdw?=
 =?us-ascii?Q?z+YLUhN7Zx2QkNS2h76LXIdv+Gu2ZtQWoMhp/tCuDrlIc9CQka8LhAAetvZm?=
 =?us-ascii?Q?IjNKFD4ptHH12vD+wnjJwYVbPf0B87mVrBw2CfLLWxg7blpXiJ3cRIobhDdv?=
 =?us-ascii?Q?ghXu58TmeEmcDFx6YuXYexTWodgTzAc=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 79f8150a-df65-49d2-3702-08dec42a1cad
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2026 00:17:08.3499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eOxJo1alXNJakESGRyP1BpeXi0Gx/81S7qHcjVzEM6rMmp3NZ15AsAGFcDu85NxePxikRiQkASWRrM3X3Xp9tKppGcIvIZMrEAusBcuqALM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR08MB11707
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38037-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iopsys.eu:mid,iopsys.eu:dkim,iopsys.eu:from_mime,iopsys.eu:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2733E64E8FE

Pin 21 (gpio19) duplicate pinconf settings of pin 20. Fix it using
a proper bit number in the configuration register.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 14b235727736..34eef79d058f 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -1851,7 +1851,7 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_pullup_conf[] = {
 	PINCTRL_CONF_DESC(18, REG_GPIO_L_PU, BIT(16)),
 	PINCTRL_CONF_DESC(19, REG_GPIO_L_PU, BIT(17)),
 	PINCTRL_CONF_DESC(20, REG_GPIO_L_PU, BIT(18)),
-	PINCTRL_CONF_DESC(21, REG_GPIO_L_PU, BIT(18)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_PU, BIT(19)),
 	PINCTRL_CONF_DESC(22, REG_GPIO_L_PU, BIT(20)),
 	PINCTRL_CONF_DESC(23, REG_GPIO_L_PU, BIT(21)),
 	PINCTRL_CONF_DESC(24, REG_GPIO_L_PU, BIT(22)),
@@ -1968,7 +1968,7 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_pulldown_conf[] = {
 	PINCTRL_CONF_DESC(18, REG_GPIO_L_PD, BIT(16)),
 	PINCTRL_CONF_DESC(19, REG_GPIO_L_PD, BIT(17)),
 	PINCTRL_CONF_DESC(20, REG_GPIO_L_PD, BIT(18)),
-	PINCTRL_CONF_DESC(21, REG_GPIO_L_PD, BIT(18)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_PD, BIT(19)),
 	PINCTRL_CONF_DESC(22, REG_GPIO_L_PD, BIT(20)),
 	PINCTRL_CONF_DESC(23, REG_GPIO_L_PD, BIT(21)),
 	PINCTRL_CONF_DESC(24, REG_GPIO_L_PD, BIT(22)),
@@ -2085,7 +2085,7 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e2_conf[] = {
 	PINCTRL_CONF_DESC(18, REG_GPIO_L_E2, BIT(16)),
 	PINCTRL_CONF_DESC(19, REG_GPIO_L_E2, BIT(17)),
 	PINCTRL_CONF_DESC(20, REG_GPIO_L_E2, BIT(18)),
-	PINCTRL_CONF_DESC(21, REG_GPIO_L_E2, BIT(18)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_E2, BIT(19)),
 	PINCTRL_CONF_DESC(22, REG_GPIO_L_E2, BIT(20)),
 	PINCTRL_CONF_DESC(23, REG_GPIO_L_E2, BIT(21)),
 	PINCTRL_CONF_DESC(24, REG_GPIO_L_E2, BIT(22)),
@@ -2202,7 +2202,7 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e4_conf[] = {
 	PINCTRL_CONF_DESC(18, REG_GPIO_L_E4, BIT(16)),
 	PINCTRL_CONF_DESC(19, REG_GPIO_L_E4, BIT(17)),
 	PINCTRL_CONF_DESC(20, REG_GPIO_L_E4, BIT(18)),
-	PINCTRL_CONF_DESC(21, REG_GPIO_L_E4, BIT(18)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_E4, BIT(19)),
 	PINCTRL_CONF_DESC(22, REG_GPIO_L_E4, BIT(20)),
 	PINCTRL_CONF_DESC(23, REG_GPIO_L_E4, BIT(21)),
 	PINCTRL_CONF_DESC(24, REG_GPIO_L_E4, BIT(22)),
-- 
2.53.0


