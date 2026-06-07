Return-Path: <linux-gpio+bounces-38034-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0uCuOtm4JGrP+gEAu9opvQ
	(envelope-from <linux-gpio+bounces-38034-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 07 Jun 2026 02:18:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 675FE64E908
	for <lists+linux-gpio@lfdr.de>; Sun, 07 Jun 2026 02:18:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b="jNyLmoW/";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38034-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38034-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 726E33017072
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Jun 2026 00:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 287241C3BEB;
	Sun,  7 Jun 2026 00:17:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021083.outbound.protection.outlook.com [52.101.70.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA30175A91;
	Sun,  7 Jun 2026 00:17:09 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780791430; cv=fail; b=sGFk+1dvvgqVViRo/AQTV2PyYmOXdcKGgmvt61x93eXZZ/pJeACAj4HdNeQCsf8c1KdLzy6mzpzPQhi3rXPiOso31KQiI52PUqZrcKpZjWomJRGeIZ4IeatPNJopFXu3Usq/rgEUPZ7L0YGsP4AbkchK26M+MnXKt5idk+oCMB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780791430; c=relaxed/simple;
	bh=SEvJvKEnn4eCU9A49n1qMYSVJPcphfz33i6DpG/U6/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eve76vQtYuIjU7sf/kv2s71kyB0i9z81Zj04rmFLwLUQsxqfWPLywtlhlGmmVg9sJp9EyHv0HjAMRAP0yBsDBP1EO72yUqoXsBMCghAYEsV8OJPXJRP9AsV8q+nOMjZAVwSzm4JkrgOC4arrZASmuhxikt8Kk0GgMaM5PEVQHBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=jNyLmoW/; arc=fail smtp.client-ip=52.101.70.83
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JWnXJ4aAjK4g+/x4cgV+X4wJXRQW1xrTRhzgFEbx2Nn1lxNc3jHDmt41su/Zv65aOKA60VzsedXLj2DGRqNMUAcD0aFTs8y62zgvV+8gh9oXVnXL6IE/p2oLvVIZ+fu+/k2y2EOz+B/wxmC1XB7Y7ODxtAxZoy8P9xPc+7mtBZdFKr5az/SkJmqTkm/B+fofOqjzPZ5jQ63g6nveFSP1BdvovWS+uYC95h+WSZvsLXFuO5NA8DJI+1i3tLB8NyO8vYfkJwSJ9ECRh9UhVLjrDVkn2/7ghd1tNl4WHYXIM8ZM3Hja1jGWSBMtP/f+uleQVRd/cOL5QVpZtbICUhPwNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yCMMJvjgLIbuZ48D1OsujID8nnO2MASZaeM/GANFcwk=;
 b=WDpczOLp8j1G9B3RpqPZoI315xyXnipDz2Qv5LOSmXHzaOeW6LaKgXlzDRpJo02qbaO85BVax18dhx2IVmtDr+2T2wZoZSPPiCvBI7t9GPNB1L4G8m1FAGYWWM3NUwOWnM+F65n+nt4fzKaVxPJngkOKrwKu+VJ9VNj3ndkGumC1ekHHVLgWQbc+2FurYF8KAndH4iI/wB2V/UvlM14XlfgwjU5VlUl0yBmRzpCSDgyCvSidTZsfoG9yVFQusGxROn/JNzBDOXf+DmxwblLXkS40JCAh/ZJOD7eDpB8kSQQtx4BTai7eUFIXsdobRu/4SXov9/Zd0XjTaysgiYTqwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yCMMJvjgLIbuZ48D1OsujID8nnO2MASZaeM/GANFcwk=;
 b=jNyLmoW/ZlqKf/QgPzJzLpquwQIymvzyK7YkoqDyoEGzuoxwqtXBrEqv6VReip80GxLy+UWGwjWuh0k1FqwFJtGowfrcqszIdSQTpTJ38N7gMXxI+NVEJitG7sGfaOjUnhhp2oodauiTQ5lP80lU6rhTXH07gZetqKAY7uzhe/wGJK6csL6tT3ePMy6mIbCqq5dcn0nFtq2LtKRvj9hegVKqfPERchsgTCluBzUM3LvEqAdFgQEtKliW7Ra9SzegyoYuD8GljIy0S5CI8faH26V/T/NFnmXWvBgzoxCI0H580IsozH3rrftx+M5KSiyowOiK+2UkQh+WTudbjRXJQQ==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by MRWPR08MB11707.eurprd08.prod.outlook.com (2603:10a6:501:9b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Sun, 7 Jun 2026
 00:17:04 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0092.007; Sun, 7 Jun 2026
 00:17:04 +0000
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
Subject: [PATCH 01/18] pinctrl: airoha: an7581: add missed gpio32 pin group
Date: Sun,  7 Jun 2026 03:16:37 +0300
Message-ID: <20260607001654.1439480-2-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 9a926d3a-7a77-4d18-9e7e-08dec42a1a0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|22082099003|18002099003|38350700014|921020|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	PtEDViGou8Js80djyPi3s53Mzm6YPzzC2BQtJVoZWQmozzlt4cg5UWpo0tmrdkQtq4LEjrBbJV0cdcoqvXOqBsBhc9rcezOn8Ls5b1isLQ3K3twMZpwZFSNUsy1RdYmOX0zzsFyeDAN2FTCYerXvNfcrn0IQRXpY1bw8kNGb30FO1A/zK4LsM9FQeVUYhPKzC/8J+WHHHrYlCAyw6bOFmFm5dCyap6sgHsKl/U0VzrlmbXhsKIVktVfrMsUCTjuEa6/UG8xopbdi+vlpy8tQrs3v9ofq7Ff9tEsLejN5WO6Cdgk9QnHfqiiD7+hRc8sYPvvZIOrTFi90pYxgk6A47uCRJE42EWPCjU1iwBxCigHgOPBisHT0n3guyeew64FPIYUv5a3FlEK4GPMZZQc2wAXg3syEhfFEui6VKIb1Hg0O4YZe2rQ8DfZas9siN2OePRB3ZXwFPFmtlbEyy7EVLcy/2bYaJazsB0C1bYekpwvIneTl+ekozPz9NgNzKkg95mTt/1CtjgpLhlAPEjl1xEt6O+0DNvubBedMqsMqJwvQpPb7wS+UknbfUNuPAXBQDn0uPm3qoMCgcH5g81VzyQOX9anjZ04IhujmGYXqesducvFJc/h8scuC8y0FGjDoPMlb0ZBnDofh2V72C0dp+K0AuWMzmcLOt6j1QFcC4hUQJlUMxFfkyoVqVMtSz2vDFqc6swdL1GCqWTCacwkbIL0BXX3MAxxRPHgOKnS6c14j5aIUW08eRfvxrP7BbjbdonFs9CPO1wq2JWZ1JdpQVQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(22082099003)(18002099003)(38350700014)(921020)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LS8F3f/aSMzM8sjTpd57oXAUISvTyyNNizaUiZtvFVROe397jXKtAHR4BkZ0?=
 =?us-ascii?Q?7Ztwkx1P1Z9PTbm86ntwsMyW1NGp7nId0BosTQaWXeQUUoD1dsgfaQmfKE0/?=
 =?us-ascii?Q?CHueGegoq7KgrWsFE9afPA/u/O43RXsnlL6KsLdOT+jNaoBdHXP2ZlXK/UoR?=
 =?us-ascii?Q?csZn8KGtlW4+5uGMVoolhxtKMjnFmugjc1Ax2LWHlCIfA1DAbaFDseedJBCS?=
 =?us-ascii?Q?jm1zqO1byZ/0R7ziv7ZgkTZOqvaUZQrcHU5Ar+YgHsKuvmlZkrG0yXZ4zb/m?=
 =?us-ascii?Q?x8+spdtHc5OIamh72ILCjfuBPXYylkoOCNNHHirhy5Vs/kM6qBkacxr/jKDA?=
 =?us-ascii?Q?Ajf7X+LG+LpY0Ex7K3D6hLFjpkR0E07PSm1ECKyWOj0GMqwDfFJ8kALUMTcS?=
 =?us-ascii?Q?D6LHMZJqIedct8MyuzA+qDBP+Ng77sxfmVfwR4t+TToUHe2NTHapmleC+emg?=
 =?us-ascii?Q?kOGUJGC+9foWCGT1i6c3RsfqqY4mABzr76E66wDzF93SoZmXnxkuj/67PDru?=
 =?us-ascii?Q?QBQ0RWrWWkC2e+7dbZLtp07YM1+FqCmflY70td56wVGmMyZRAiLM7xhs1t6m?=
 =?us-ascii?Q?RIWBX7axtZCJ50M8EPXtOIigfMKsLbjN4/pq4wGvWtdwFnmnD2sziArZKpt1?=
 =?us-ascii?Q?euO6cO9u0oLe/XwzJrUUBsKyMkncvWO8h37fBi1DZnyEN8iauwCwTq0aI7Az?=
 =?us-ascii?Q?7X/vBLCFjvBYs9sAj8HoJMBFpseWIhzH+56r6gQsRuMJZ1wmqA3KoSvhLe/W?=
 =?us-ascii?Q?7gYXo/G8YyLTBH91WILX1DI3e7B5e9+IgVlR0A/qelL7e5vSQgFiTe4BC2gt?=
 =?us-ascii?Q?eIg1WKW02ObF6ymbOi02ZH0WhX5/Bb+G2Huy2p4VotvZOl6/AddLzp7N8ggQ?=
 =?us-ascii?Q?4q3O4hSYeF9CFuAtCTFkGLEqZoCmTHfXrcGynKsRQ5ICHd6bdAqdWA6lMliz?=
 =?us-ascii?Q?Qg7qVQ3Iki94dP54GQGSG8W1MNh2ao4DTdYG5HV748MZFOxLrP7wOBtrIk4Z?=
 =?us-ascii?Q?KEochfKtsp28lE54YRimYB56o+Zikbhc47egXQNvG4c6Yu8AXghz6KmqE/US?=
 =?us-ascii?Q?06JalLOI/yz/HC3VoIPahofudJg3ifJtt3dQ6xAuJCZmP2Ma/4H5m47t977m?=
 =?us-ascii?Q?IQKLpVngQxd5opHJObtcyYF7NTo4wQjPSmjAU+02uBHPNgoaq5mkQ+w0ICPc?=
 =?us-ascii?Q?0muHhc2c4vfgpJsdYwiRiW8SL8BJLkydUaYifajkz2fiUnPDZ2Bo9fNanEFA?=
 =?us-ascii?Q?zRA2kftGVF2vT78AnKLlaYiFT91DYTFIVRdHNnPvWLHJ/vYJ2mhRnrVFkXbo?=
 =?us-ascii?Q?ezDphVWScUb1jwi2x1a5ZylWP3P0ADZOXhDX0tvQYiZ/LPDdUQHUFYeJ9+GO?=
 =?us-ascii?Q?re8Twkcmuxq8Yf13+yXQEMEzB7g23otuCpGJQZew9h0ia8WFNnOX7swhtZPU?=
 =?us-ascii?Q?OHUXqQS3tZaDrEeCOzMJD++EMhQMp576wr/0k8+Pob/tMEZBLgyErah7SvNG?=
 =?us-ascii?Q?qOf4afxJMMKUsaWFWI4V+nPrx2vE3bLPKtNyHNSw8MHFsPImqnicrDGck7D5?=
 =?us-ascii?Q?arXN7VEHamNc7MWE+YVzIx/mBjOD32zDqis9EjgGpEjSo9I+oiKyKkf1X2T8?=
 =?us-ascii?Q?cE0FibBVY7Rw9SQsgCvYrBxCKatXUMivERCK4fmdUNno3HS6z8gWeKbZA1WI?=
 =?us-ascii?Q?oCOopQkg+odC0Ti3vBo8o6LzyJcTbK9USlPuLU/qj9jB7CQRyT2O8+hFp6VN?=
 =?us-ascii?Q?OpLQJXxxqrfk2x2b/QPPEDd1BtZNBDU=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a926d3a-7a77-4d18-9e7e-08dec42a1a0f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2026 00:17:03.9752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +7XOiajQ0l+g9blb6pc+bWApIpztSHvNbPcQEG8wslnkVJ7R/3xOedLG+ltC3RsUa2JAhseuIXhsYoo1M5qOyVGBYEf0yD5MllWGHfnut5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR08MB11707
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38034-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,iopsys.eu:mid,iopsys.eu:dkim,iopsys.eu:from_mime,iopsys.eu:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 675FE64E908

gpio32 pin group is missed for an7581 SoC. This patch add it.

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 995ba6175c95..805166223228 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -539,6 +539,7 @@ static const int en7581_gpio28_pins[] = { 41 };
 static const int en7581_gpio29_pins[] = { 42 };
 static const int en7581_gpio30_pins[] = { 43 };
 static const int en7581_gpio31_pins[] = { 44 };
+static const int en7581_gpio32_pins[] = { 45 };
 static const int en7581_gpio33_pins[] = { 46 };
 static const int en7581_gpio34_pins[] = { 47 };
 static const int en7581_gpio35_pins[] = { 48 };
@@ -623,6 +624,7 @@ static const struct pingroup en7581_pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("gpio29", en7581_gpio29),
 	PINCTRL_PIN_GROUP("gpio30", en7581_gpio30),
 	PINCTRL_PIN_GROUP("gpio31", en7581_gpio31),
+	PINCTRL_PIN_GROUP("gpio32", en7581_gpio32),
 	PINCTRL_PIN_GROUP("gpio33", en7581_gpio33),
 	PINCTRL_PIN_GROUP("gpio34", en7581_gpio34),
 	PINCTRL_PIN_GROUP("gpio35", en7581_gpio35),
-- 
2.53.0


