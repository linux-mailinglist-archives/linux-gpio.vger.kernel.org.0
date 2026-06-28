Return-Path: <linux-gpio+bounces-39071-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U9hxGDczQWocmQkAu9opvQ
	(envelope-from <linux-gpio+bounces-39071-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 16:44:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B104B6D4266
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 16:44:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=0augXYMR;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39071-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39071-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D16D30597A1
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 14:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8DD53B0AF8;
	Sun, 28 Jun 2026 14:38:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023091.outbound.protection.outlook.com [40.107.162.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0813AEF3F;
	Sun, 28 Jun 2026 14:38:21 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782657504; cv=fail; b=HQF5VcSMaupgzMaf0EVWrxtPWuKdPk6zL97+A6EvLktzMnST1Wtl4ZjpkEafNSu9hoIsJDhvSu35iUzl2r3gXTiD32YzyQy8uL4t3XMWgWE6B7Xq0Gt8v7SLRQE/n9CBl1ytp9xoPxMfIxSbK9BtOxmjhqYLFJ+mrykSaAcp5bo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782657504; c=relaxed/simple;
	bh=lGY1NCrqtV5tneuGP/9ydQEqNDUBHYmFdfcnJ7/zWjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YsMxrrS1S+NDrQWSh0kYDUS16IgC+hJ8lxPcXPuw6pK0ZH6chMbJqWeIkOijtUQxAtqnECjlprLiVIgLb0CFpr8O1bsLzM1D2QKeHDsDswwFU3h1yEUBh4FeX7o1BPMD0MIrcmSg4f3wk9p1ONqhDbJEyq0cOCNSegqKf3qu7/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=0augXYMR; arc=fail smtp.client-ip=40.107.162.91
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MwUhyw0dALO0V8YVpzLE3b56QTnNobhbCUbGGt57w9ykMr/+n31pudxuG+Sn/UHQwlEDCLErOw9gdICFhShS8TtiHcKfgtaL2AhtB0ovohm4UXqALmW+o3gvtfF2MT+3izfsspOlNWTVSy2CG11r4NcEwIBxYDI7L7DReUviXhe5zjbuXXEfSAuDZDDnYrBGuwYwB5hrl9aPF5g8RX1gAvN2J9WIs8QRo564SBkwOgX+0LmwGi1HfCTbmb09fhF97nZU5tvHaMDRURXpuCO6XOnV0K09iCUjKlIpoBMR9IGOH2b9ln1iYFOPmCd0rvkH1K/BudJaU72EAXh5XDpf+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRotRDX6ecCjl0J0+rneXNd/YiJ5mY2WUf8npavwQHw=;
 b=e9foEl6z2unShOyAqNQFgyJoaVpGijy/U+dnjATGTjMJ8NPWh8hbCHW0LtYfsCuPIeM8nrwn4vtqg5ae41CWI1ka8uXVT7eZUFxFCvqjfPe1AgTMAM4mzp0uKmhJhy6zI7AEqU4mP3dJNBu750MnlJSpeYs3ZA5R+E/bEX/tGxE7EmrqbbHeRMfumTw7dTku1xpYnfvyR//3iEFMrrc44ZGaieuKzctEHIHtCg8u9RSEozWiG0bW/8L6P53BfQTbOaYgEXm2ObtvbDSJ3HxWHXXzgls1pAuZytCiKztu3MlpFAGicUwTqvgAeLOSDrmx6a2v8a5n0J78p5MHqNXt7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRotRDX6ecCjl0J0+rneXNd/YiJ5mY2WUf8npavwQHw=;
 b=0augXYMRxxeblbB0Uz23L+sYqUsnFGX6P/FyhKX3+mEriLYeyT0tSK5bzvFKXhs2tUq5Wv8tFIwLHKSMjw4Rx5XwwdA6NkimKxfcxOmKy9TsThBGBb3DnztP2/gzf2xRsZK6aA7jKJmNRECadnEXhYeGV4dsXkQlUMHLQ+Khchtk3NqT8nZtULghJmOnxQ7wG6qZD31JTnDPG2ZGv3aYnVzzU8J/OUrZDBPHM5Wo+H9s1TjKfCS87iPzZ40EV6V9Vc6YzPpNHfwBEc2gATjcw6nKtio9AGf0frZMpl0u5ry38OOHc2gelZ1+cihJwhUeO41P1rXsUv0HiTmru45aIg==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS2PR08MB10009.eurprd08.prod.outlook.com (2603:10a6:20b:64b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Sun, 28 Jun
 2026 14:38:03 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0159.007; Sun, 28 Jun 2026
 14:38:03 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v6 13/17] pinctrl: airoha: an7583: add support for pon_alt pinmux
Date: Sun, 28 Jun 2026 17:37:29 +0300
Message-ID: <20260628143733.273651-14-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0006.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::12) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AS2PR08MB10009:EE_
X-MS-Office365-Filtering-Correlation-Id: 989aaf62-6a64-44d0-c27b-08ded522dbcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|52116014|3023799007|11063799006|56012099006|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	9W6HLHAL5Z2IxOCWnfXbHRzgqMfNm1N9jnbBJNUV3+gPrV0/rmb/BwGmWCUnuciEgkyYxAo9gV5pealSC0+ElQakNV0FIfyzwwmdRr9aawuS6HTaBW3SSd2gptYv3pJvfS+RHJfM8fffQaupeLhivFL5csKu6HfJg3F5r3NuarKe4DuoHl53BX24dwRUcSUgHR9Oy4nR+26xY4scScxPjww3Mp5aEM25ubh39tkGa1F+Tf93sbKCpbBj0+3dej22CtD4lextJg93T9XbEKaRFJ+vDJZ11i6dB2tITPIBKudQZACLLGNat984igSYGzq6L06NG3nafICLFRmyOQ55Ij/AAGzuxBADAg9XObZCe4R/bJZmMBkEZoDrihXhPQbLcDhTuSEpAFpIUW+BYPcgLswKGwXgJRTuyIuUKGDHjfAZqlT9SzHpUmXXp0I+65lzT1wZeLHVq9bmVE9uKu/lUuTrWfokBocgYjWdIxmRcCCO9o8T5RNuifAIWFvAjmo/gV5mVlSGQ5HFdHa9Z4egq15T7oB5uX/MjPZjFexP0wxVdTqJ55jFHbXjLjmCRFW4JdzFq2fX1JCO3lbJkw3Y2pC/plZp99CCTatqgfFffAJX+7OEZihmlotlxdYe6rZEQPvYZurzq7YFvk9B1efQiais9LMFhYYTdHCkcE3OhORgJlYiRyAGHYINl++VVYJggL3e+dEj+gT4dCGRYa8VVlK3gTFh4jNoNQyHWSEo+Iw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(52116014)(3023799007)(11063799006)(56012099006)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WQ7X3aKUOqj7XNZ35hxqN5koHVtLJEGGXIPcW3QJC/mx5kZaiq4l+NFYvh7o?=
 =?us-ascii?Q?rN3SZNlrlS0HT61CYqvb6vE+4/6hmvUfj6FDlzEpbQamLT5WBSulJoXo7DjJ?=
 =?us-ascii?Q?GocXLmgC2BfEu1Y/iIzN+A6fyTSqZ83mbBmLbVnqVeVH7BH0KZVdDX7UECL8?=
 =?us-ascii?Q?fVq7eNPJgLDfGjyCc/DALSZi2AZJNPpFh7A8uhkG7bnTA98LQtikJ6RWpBWK?=
 =?us-ascii?Q?shH9r7amFf4LhXDhAh0/gAOtLegRFCwBZ9cQxDdhtFx70IKcdbnchVHsGr+E?=
 =?us-ascii?Q?j8WPKUNrplUyGhSC0mhsWj/nAwgVI38flaPV2HM1SMkOUx8TK5zlmn/s8GSy?=
 =?us-ascii?Q?LBzwRq5OGPGzf5H9E+AuOBPd7usci0CGDG5UzdKDHYrHTgen7Vw+uw+AOTVc?=
 =?us-ascii?Q?bYNMmvSUa3XdaQt4Iil3y1biC1XkMsMI73TAruwZV3w44ND8HuGBlu5t3Uto?=
 =?us-ascii?Q?ov5MBnM7FMrtKEzU3EoquRPsdWWyiDzIXOiIuIiIE/r1Ed1+q76FomSQi0YP?=
 =?us-ascii?Q?FJAGllaDFOiNGSSKLUTFic+99SDjIvvE0jPleJ/oZcQrjl5a0Z8vZ9WsFzxe?=
 =?us-ascii?Q?uQT+7heYT0Dyh7swElBDvYIraqGj/0aDnEzkPIZI66LAXjEzO8xCgYncoQ/w?=
 =?us-ascii?Q?zb7fiGkyljFtEYfmSOHeVoPEaAbbnjG7+cLs9UwkQ4SziZErf6XYOnudfdlX?=
 =?us-ascii?Q?qnYI+L0b6Ff8QhM3s+7qOYr7fBzS9Y2i72GmAGwX+uYsnuUYfxNJGtVhBkeJ?=
 =?us-ascii?Q?6MnVh/bJQyzHB5DiAu+Dp72K9X95D7xAtaQYgH5kca9QtiUZtXL9uNA4BYou?=
 =?us-ascii?Q?aGlku+qQwI4o39opt3rHZW0GkioTeGZDCdDx2/ovdRAb4CbYtusKH+q3g75A?=
 =?us-ascii?Q?ToyYVwlubkHjpmZksP8aV6tGkV0ct4opzUTtyXVwiIACEakY7rUWMBB/rWwW?=
 =?us-ascii?Q?UJ7QV9Ns4QHqmlZqcTphTv0ZTHGN6YS60ZO0nAOsBu+7sWIAeBbIubo3DF70?=
 =?us-ascii?Q?mSkFIIKAPfXC7mwu0HFtsd0v+kLCP2eogXe3jOzuCO7zLHMwS80tz2RdYuhW?=
 =?us-ascii?Q?KfAJCDLCmXkRRRTvmS6mrapo2K1wToTpERdjSBgILtk5uKdlBJCtKjBWPB30?=
 =?us-ascii?Q?cfLAknYtS912p4SGfyfMC04yNWH/6FHawKWu3X/a7YmMQ0BmMxiX0Ejw6HFW?=
 =?us-ascii?Q?Isx7XaBeVf36I9onBjcRJymUpFq0Pybv0wDcvgRBBa85r9HIhd3vdbd0n1Uw?=
 =?us-ascii?Q?EeYEVOHQT+cRE1jS3Gz6YXHmtHhuHLNJvXDt7iVBnwtog8oAX1/qsdopiKzk?=
 =?us-ascii?Q?B9LIHBChEUex2TURYJldJg6D8YUfbq/eeY7lR8X3gqxHBeZUrdEhKu7fLhWT?=
 =?us-ascii?Q?0JH7AuZmJhFCVgAJ3+V4ADCH1X6ZxyRupTI/b+Ayk9vVbsJwGc1yrM9xvL+4?=
 =?us-ascii?Q?6BlLwILC64Rdh8fW1a3MN5811G5C3GhKfW31U34Q13lLVFl7LYwbyLOg0ho9?=
 =?us-ascii?Q?TJ9KfG7EszNXB92Gy+4yx20FGo/tPLO940MD9E1ykwT6ht792t9OCoJQzk6S?=
 =?us-ascii?Q?cgiD7DAZubQsUcGtoM6OpGNFU36xXu421ePuKOALEnnXS615fUoz/JijuQB1?=
 =?us-ascii?Q?IWP4Q71MaY5a/rZou/Tyjv5aKVukSFd2pqvr60nzc8ySpoZvgZdfQ9Ki4peA?=
 =?us-ascii?Q?/XCfpfevW+6FGmv3vq1eqpYGQK/fk7PR2A2ftOoJbU1lZe4Sv2pcsfB0gw1h?=
 =?us-ascii?Q?MCoh9W3mnGwCWcbqWculu4rNHUFmmW8=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 989aaf62-6a64-44d0-c27b-08ded522dbcc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2026 14:38:02.7849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SeCJyPf/8ZWHO5vSOy7YqUoL1v+5i6hbTMh7ZRFU6C1Ba2fa75CHc47GNN/WwRPn34sfaOJ4UL0165HYawK43kAglt9ABms1j9t4ZJhF9WI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10009
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39071-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,genexis.eu,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lorenzo@kernel.org,m:ansuelsmth@gmail.com,m:angelogioacchino.delregno@collabora.com,m:benjamin.larsson@genexis.eu,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:markus.gothe@genexis.eu,m:srherobrine20@gmail.com,m:mikhail.kshevetskiy@iopsys.eu,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,iopsys.eu:dkim,iopsys.eu:email,iopsys.eu:mid,iopsys.eu:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B104B6D4266

Add support for pon pin function for pon_alt pin group.
Also update device tree binding schema.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../bindings/pinctrl/airoha,an7583-pinctrl.yaml  |  2 +-
 drivers/pinctrl/airoha/pinctrl-an7583.c          | 16 ++++++++++++++--
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
index 0a217429b2cb..7deb48db52c3 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
@@ -81,7 +81,7 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [pon]
+                  enum: [pon, pon_alt]
           - if:
               properties:
                 function:
diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index 9b5c7ea5e547..7e94dcb3b61a 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -38,6 +38,7 @@
 #define GPIO_SPI_CS1_MODE_MASK			BIT(0)
 
 #define REG_GPIO_PON_MODE			0x021c
+#define GPIO_PON_ALT_MODE_MASK			BIT(27)
 #define MDIO_0_GPIO_MODE_MASK			BIT(26)
 #define MDC_0_GPIO_MODE_MASK			BIT(25)
 #define UART_RXD_GPIO_MODE_MASK			BIT(24)
@@ -391,6 +392,7 @@ static struct pinctrl_pin_desc pinctrl_pins[] = {
 };
 
 static const int pon_pins[] = { 15, 16, 17, 18, 19, 20 };
+static const int pon_alt_pins[] = { 36, 37, 38, 39, 40 };
 static const int pon_tod_1pps_pins[] = { 32 };
 static const int gsw_tod_1pps_pins[] = { 32 };
 static const int sipo_pins[] = { 34, 35 };
@@ -479,6 +481,7 @@ static const int pcie_reset1_pins[] = { 52 };
 
 static const struct pingroup pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("pon", pon),
+	PINCTRL_PIN_GROUP("pon_alt", pon_alt),
 	PINCTRL_PIN_GROUP("pon_tod_1pps", pon_tod_1pps),
 	PINCTRL_PIN_GROUP("gsw_tod_1pps", gsw_tod_1pps),
 	PINCTRL_PIN_GROUP("sipo", sipo),
@@ -562,7 +565,7 @@ static const struct pingroup pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("pcie_reset1", pcie_reset1),
 };
 
-static const char *const pon_groups[] = { "pon" };
+static const char *const pon_groups[] = { "pon", "pon_alt" };
 static const char *const tod_1pps_groups[] = {
 	"pon_tod_1pps", "gsw_tod_1pps"
 };
@@ -629,10 +632,19 @@ static const struct airoha_pinctrl_func_group pon_func_group[] = {
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
-			GPIO_PON_MODE_MASK,
+			GPIO_PON_MODE_MASK | GPIO_PON_ALT_MODE_MASK,
 			GPIO_PON_MODE_MASK
 		},
 		.regmap_size = 1,
+	}, {
+		.name = "pon_alt",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_PON_MODE_MASK | GPIO_PON_ALT_MODE_MASK,
+			GPIO_PON_ALT_MODE_MASK
+		},
+		.regmap_size = 1,
 	},
 };
 
-- 
2.53.0


