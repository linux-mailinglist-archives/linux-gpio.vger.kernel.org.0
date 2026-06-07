Return-Path: <linux-gpio+bounces-38046-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y0snJWG5JGrm+gEAu9opvQ
	(envelope-from <linux-gpio+bounces-38046-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 07 Jun 2026 02:20:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6E964E94A
	for <lists+linux-gpio@lfdr.de>; Sun, 07 Jun 2026 02:20:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=YYA2Bp3w;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38046-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38046-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4142130213B7
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Jun 2026 00:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 365252E2F1F;
	Sun,  7 Jun 2026 00:17:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021083.outbound.protection.outlook.com [52.101.70.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BCA2D97BB;
	Sun,  7 Jun 2026 00:17:29 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780791452; cv=fail; b=WKVYAyUSCCZ69WSP/TpmNWLhfgCACSLnOaqo8ml5fmvtbyEVsHKAppNI4RCWtfdlo7McrzwHtil3sXz6GRASI42NC6obsZ5GY45j22Ep9e7FV7Yq/lHwuM778f5B+2ORxLFhe279znSaRuDt16ucDWZxoTMlFFfLXtYjiX7w+xE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780791452; c=relaxed/simple;
	bh=m39a3Co95zHVbb9pTwWExZaQbMA55rB4o3HpzUw39mI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l3s3G9NyJfvCjIv4yXSjCXk9znKZdhR5z1TPMEoQzFsb8/ZHel3ltrcHdRzhTmlbtZyX2VFMA8EU7QdTOYIE7m0BsV93BmDLYjFeOKBFc4VpdiVYAnIReqh65NVhGYxQO9QLA9N8bnBkVW9W7J50YvqFrhjhJfYe71Sij88vg2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=YYA2Bp3w; arc=fail smtp.client-ip=52.101.70.83
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ax332SqyXwp2IOdSTrrS7zyvQoedWtF3aRKTMXMTkhSxN3HptMOAx+sqGKLAo0UFScJIjFwEh+lqrEfMXfaKlwLf7MmrjIBjbYuEEJsX9n60Z/fEZF8/GVYXYNbbYXoKwJSrI1MnOVQec+eIOPk2C8RvYo5YDs+Yr7EbO4NbS0i0c/zIpElqQ2I+EYNauqT4+vSYyOTnOARREqjg4ZX/Yx+5HE8PqvtIH1OlQwIo0ssF9/smWmdLh+MjqbP03bDEClcLHH/DpBf8uwNBGqpfkkkvE1DCj9opcSYtV0VzsBuYXMGXBFBxkxemeLqm9o51KkgocoOgIFIEU1DzJF379w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mF3qct0qtQCyEk/qoLctFcPUTkq3mocoPkQZ8UPK+58=;
 b=kbXCo2NryjGAKUlrFydlxGmQ1Lbeln3sQt4Ux/3szKCEdDV+G/lTk7Qs9FkxQ+SQST0JLPJqUYiMm6OsdkvkRmCCkBvHZpj2JQ63NfYpVNz7gnOqgH1AtChjgC7dVYIj3mmNZujmCxlJuHWWlMl2wLrVdaFMDDmpQdg+J85tNQLmekti7TZXLTBwQzbfRuPPrNgJtHVvl7YPGJj0nkweQ5rcFFxo0bbEzskQ+uANAUMCIBz1sjMvuLu645JdZIHoq1PG0yZj3KnvlFZB/0Z7Dq+26IxUhF0B8fsQo/9VDEBuQ/O5RNyaUE1DmfxvsiBdRG96Ix9B1i/vy2wsgmeGVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mF3qct0qtQCyEk/qoLctFcPUTkq3mocoPkQZ8UPK+58=;
 b=YYA2Bp3wzYrzE4waU0As2eMFR2XHgwGyY1x3+Fl08xXBtFe4KRWRiJ84lMnTqt9hnIxnhcLkKWmmnqQ/BtZl2LkXVk2B87kgydUgFvFISmzvRK0MzTYmaVURjSzJX0Bx+rborQtsaIVcLPDxZV4iHwXtxwFRMZMfDbSIuYIty4jC9/t/OOjHhVfmGBP0imd/3xCFhnz2mt30xHNcTMw7zB35gXHh3oegW3vKywiX9AnaQmWBh1uGsHrbSAxH44nJRoIlfccKF+8hSA8og8VMb7Ilpv1BMJ9UaE0+EArPHyC8mcfvee8A5470Iutp/aq5Bu8gFYmQYyQ6j+ajqG8G1Q==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by MRWPR08MB11707.eurprd08.prod.outlook.com (2603:10a6:501:9b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Sun, 7 Jun 2026
 00:17:21 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0092.007; Sun, 7 Jun 2026
 00:17:21 +0000
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
Subject: [PATCH 13/18] pinctrl: airoha: move common definitions to the separate header
Date: Sun,  7 Jun 2026 03:16:49 +0300
Message-ID: <20260607001654.1439480-14-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 964b2df7-6281-4c5b-a091-08dec42a2481
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|22082099003|18002099003|38350700014|921020|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	6W88UB35vxrNh+LE5AixxyZpohkZ6A3VIrCa9zoZNZvIxJefbPQVAiVmY/lGcSJrrLlnJuB2sM9xYYoriWx6MYibXnQB5Afi4teZUoJehloOgk2z9CeS6uUiqH2q3dHbPebxRIcgq5DvJyTWZNFSdSDkp4f6K9+Zx9ng6Wf+NoDWcXOHHzB0UyQnfAj4L5Qkr+eRwTXbix53HvGI9+DPvo9t3Y21FoHRPCt1ZrlSCp5XLwo9yMTxwlTxij6IyCXFgmhORqC1EUFNTOSAgOGt/91sd5Bj/5nBdPfR70KqpHp9nE041a9eZaixNrpTgTzYyNm07ftByA4aJey8Z8m8NQD2Cy/HxOWdD+nJrWJDuGC/fZumGQsx2qyrBYNoplCkbZHP2jPavyzjbfwaweda+IcidYSPuKnxRBbwWJboB4q2SiKe/QrlLhLTW3Tv9Ge0l2dmq5dbvf8lkR8J7kPo9lNnU2FvoOPgAJMUCU3SaqHXjcEZmWhQTR9ctg92LmL1/yKobNVSLG6sUTyRCf96SN/t5Yob0CRi8JGzATbM0FU6ATe7ht0lZeq02x+bA97z9R7L9sM0mjSSn/SSSxkSGTv08j6mt4Le0M+Salo9WrwyFqRZLZMCgSw/BFkTqGsXLzd1KVg67hoCniXuni+6Nc/0y+r4M+5CNP1E9a3dx/giMqGmu+Is7dtYCi8VK/9+AukisSdiButvZpc2ntyo+uFWNUqZxOr2lHxXA4akij9wf3QbNp9qI++u5FWMOGFua8+OB+ML0M0G34jKLhvD7Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(22082099003)(18002099003)(38350700014)(921020)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QIpSEBeuNEZojEoHsdbtdrLNDPfMal5abNeR+YO30n75KH8xPvGNMmUbVQnt?=
 =?us-ascii?Q?sX039UJ0ImMls3eSeuIl12uq/E9iD1kgLItm90so+0hKOP9uuyA1tVJkdz9c?=
 =?us-ascii?Q?6KF3YCX6ZGs6cNEAJgdDm7G6NL7iCMhNvHUAsjEYmwKMwN4gv+HjMY4Lm0/C?=
 =?us-ascii?Q?JRVn3T1WLoe6dr5jHpK0KgPyamVCrCbDoKMLzRfwLfHOhVaSNa9Q1wFnohkc?=
 =?us-ascii?Q?+ZZwtziDoRAhCU5yMxItffR4r72luNAjFiXAJ2DFpxIqbQi1DzyqkrFFtPJp?=
 =?us-ascii?Q?5gna3FCtn7N9Bl/BRNXiVIdR9kjJtuGBqu2zQgjxhmXKRaFE34hRNDiQi9qa?=
 =?us-ascii?Q?IyShfmLoZGmX1zqHgOZCRCzWAWaGVCEapYTEj9ZcFIcbh4mivZ/OuRrMFw9t?=
 =?us-ascii?Q?GHrxn1MTYRR4NplJW8WLbgqosLmfn8MwCu783dtBk510m+sW8w1ezRumx8N+?=
 =?us-ascii?Q?fsUjJsX6vfeg5drgyGvqJKR/E44z+72fMxtFBn/gZr0NUiX+PETP3oST8V4m?=
 =?us-ascii?Q?y8WxjpSnK8eDNMywkbRZ1Yc9ViCnT7F/0CIPu8VTm/ID8/418X13xIRQ4At1?=
 =?us-ascii?Q?7M+fT5VW3WreMh6pyufuf//pO2MLwjgYJ79M94W3qN0V02mJv/BeFWJp9UYI?=
 =?us-ascii?Q?BVHHE6XrsIom+db1AI18hAWYoBhhBl55pq3qXySC7wn4DfJUbLRiH3lflxqb?=
 =?us-ascii?Q?F9f4Me1x60vlR/+NZ2Ge0pRhXzKaSoWl2uNy83OjrOb2dN7TUYcASPVnXI/b?=
 =?us-ascii?Q?YdZc7wEHdE+jzpG1jhCcWpB5VB3FsU9+VnOdUzPD5jOavdFdVNvyuc2reK7a?=
 =?us-ascii?Q?ADKO5iEZ3WsIc9exkcPhGG/A4qKm0eDsNngscbYR0om/XZX/q++zuZSybxy1?=
 =?us-ascii?Q?uSWBRhbzVnjg9ZIifHn+S7m64LyPgRTe6W83ERFd2S+XrjOlTGO2BKLeu32C?=
 =?us-ascii?Q?ce6qtNa35LbX2WfX9ReFdtHoRlQPutAy2O34cqDCqqZo5+Qi/gwErw5phNiA?=
 =?us-ascii?Q?nFln4F3EwvtUyiWvK7waPOkzT6ozxBdiMdSPazcw2qaZybAH6avP6a51Drij?=
 =?us-ascii?Q?lXQHRDjNF0rckSAgxVaWLQ/tJd3d3sCMC5tTr4yFyvaVcl/xCUYVfmRKERig?=
 =?us-ascii?Q?c1zxJ3Dy4ZfFW4Qrm3y5Kmf9fltEw+FIcai/9zRZkhDDmR45aINTG6sKO8Oa?=
 =?us-ascii?Q?0NT0urGoDIwEABb/DOBJO8PBG3B3/oeI/dIjcaYxx4yYFoGQPmio4TAz52I+?=
 =?us-ascii?Q?kFbNu5uPpppAGkzygJxK4vhWttZ+/rj31hI1KZLJf0WxOyCFSbtSxooTvxsz?=
 =?us-ascii?Q?dJ1sYAKL93+u9O3WFO9XlE4E95UGI5P0zuWrKlpaI58AuH2peLi0+t6tLi5f?=
 =?us-ascii?Q?q27T8vkZp59/geR6PjcxaptA7RAcKlqUJlqkR34rORG7LoLsAGWvCS4Nh468?=
 =?us-ascii?Q?6WiXyd/lWdD8tTOjAuk+OmTIS73h/9LNBDJo+NwgEOvruM/l8RApMJC3cL+I?=
 =?us-ascii?Q?2+gD/yQqU+eNU7tD0cE6qy8Sq8n0m8TfJvJdykF2CTS3V9rTUvgcKYScI/7E?=
 =?us-ascii?Q?RjyU52CglXQjtSta37/P8bJU8RHsNc81ZkLl5+5U5eT6sxWfkJBsm012DZov?=
 =?us-ascii?Q?S19z3XX5xUyeN5ic4qKC1XHfjbUPaN1aznSrl9u2YKd5d3DehZtReiikhd+m?=
 =?us-ascii?Q?W+k+5oNVD9ez0vBWYQ7hrpQ+J1s0cWB4+dMxCy3vss3rSS4kcCuxvFcGALKF?=
 =?us-ascii?Q?Env5xoIeILuhn5zWMt9SvTBSh6PEyvM=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 964b2df7-6281-4c5b-a091-08dec42a2481
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2026 00:17:21.5382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LVFx/iE/mwsisiUYA596pImEjUJeGTZOY23bOsfZ2okhozZbKMlLAhJU5NtIo9O52mXaynyPjeDn0juNEXOU1B2DPC+vqsxNtVvIz54rCVA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR08MB11707
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38046-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,iopsys.eu:mid,iopsys.eu:dkim,iopsys.eu:from_mime,iopsys.eu:email,genexis.eu:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3F6E964E94A

Let's move the definitions and declarations of structures required for
Airoha SoC-specific pinctrl drivers to a common header. Later we'll have
several SoC-specific drivers, so this step is necessary.

No functional changes.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/airoha-common.h  | 479 ++++++++++++++++++++++++
 drivers/pinctrl/airoha/pinctrl-airoha.c | 464 +----------------------
 2 files changed, 480 insertions(+), 463 deletions(-)
 create mode 100644 drivers/pinctrl/airoha/airoha-common.h

diff --git a/drivers/pinctrl/airoha/airoha-common.h b/drivers/pinctrl/airoha/airoha-common.h
new file mode 100644
index 000000000000..3d70002213bd
--- /dev/null
+++ b/drivers/pinctrl/airoha/airoha-common.h
@@ -0,0 +1,479 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Author: Lorenzo Bianconi <lorenzo@kernel.org>
+ * Author: Benjamin Larsson <benjamin.larsson@genexis.eu>
+ * Author: Markus Gothe <markus.gothe@genexis.eu>
+ */
+
+#ifndef __AIROHA_COMMON_HEADER__
+#define __AIROHA_COMMON_HEADER__
+
+#include <linux/types.h>
+#include <linux/gpio/driver.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+
+#include <dt-bindings/pinctrl/mt65xx.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/gpio/driver.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/of_platform.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include "../core.h"
+#include "../pinconf.h"
+#include "../pinmux.h"
+
+#define PINCTRL_PIN_GROUP(id, table)					\
+	PINCTRL_PINGROUP(id, table##_pins, ARRAY_SIZE(table##_pins))
+
+#define PINCTRL_FUNC_DESC(id, table)					\
+	{								\
+		.desc = PINCTRL_PINFUNCTION(id, table##_groups,	\
+					    ARRAY_SIZE(table##_groups)),\
+		.groups = table##_func_group,				\
+		.group_size = ARRAY_SIZE(table##_func_group),		\
+	}
+
+#define PINCTRL_CONF_DESC(p, offset, mask)				\
+	{								\
+		.pin = p,						\
+		.reg = { offset, mask },				\
+	}
+
+/* MUX */
+#define REG_GPIO_2ND_I2C_MODE			0x0214
+#define GPIO_MDC_IO_MASTER_MODE_MODE		BIT(14)
+#define GPIO_I2C_MASTER_MODE_MODE		BIT(13)
+#define GPIO_I2S_MODE_MASK			BIT(12)
+#define GPIO_I2C_SLAVE_MODE_MODE		BIT(11)
+#define GPIO_LAN3_LED1_MODE_MASK		BIT(10)
+#define GPIO_LAN3_LED0_MODE_MASK		BIT(9)
+#define GPIO_LAN2_LED1_MODE_MASK		BIT(8)
+#define GPIO_LAN2_LED0_MODE_MASK		BIT(7)
+#define GPIO_LAN1_LED1_MODE_MASK		BIT(6)
+#define GPIO_LAN1_LED0_MODE_MASK		BIT(5)
+#define GPIO_LAN0_LED1_MODE_MASK		BIT(4)
+#define GPIO_LAN0_LED0_MODE_MASK		BIT(3)
+#define PON_TOD_1PPS_MODE_MASK			BIT(2)
+#define GSW_TOD_1PPS_MODE_MASK			BIT(1)
+#define GPIO_2ND_I2C_MODE_MASK			BIT(0)
+
+#define REG_GPIO_SPI_CS1_MODE			0x0218
+#define GPIO_PCM_SPI_CS4_MODE_MASK		BIT(21)
+#define GPIO_PCM_SPI_CS3_MODE_MASK		BIT(20)
+#define GPIO_PCM_SPI_CS2_MODE_P156_MASK		BIT(19)
+#define GPIO_PCM_SPI_CS2_MODE_P128_MASK		BIT(18)
+#define AN7583_GPIO_PCM_SPI_CS2_MODE_MASK	BIT(18)
+#define GPIO_PCM_SPI_CS1_MODE_MASK		BIT(17)
+#define GPIO_PCM_SPI_MODE_MASK			BIT(16)
+#define GPIO_PCM2_MODE_MASK			BIT(13)
+#define GPIO_PCM1_MODE_MASK			BIT(12)
+#define GPIO_PCM_INT_MODE_MASK			BIT(9)
+#define GPIO_PCM_RESET_MODE_MASK		BIT(8)
+#define GPIO_SPI_QUAD_MODE_MASK			BIT(4)
+#define GPIO_SPI_CS4_MODE_MASK			BIT(3)
+#define GPIO_SPI_CS3_MODE_MASK			BIT(2)
+#define GPIO_SPI_CS2_MODE_MASK			BIT(1)
+#define GPIO_SPI_CS1_MODE_MASK			BIT(0)
+
+#define REG_GPIO_PON_MODE			0x021c
+#define GPIO_PARALLEL_NAND_MODE_MASK		BIT(14)
+#define GPIO_SGMII_MDIO_MODE_MASK		BIT(13)
+#define GPIO_PCIE_RESET2_MASK			BIT(12)
+#define SIPO_RCLK_MODE_MASK			BIT(11)
+#define GPIO_PCIE_RESET1_MASK			BIT(10)
+#define GPIO_PCIE_RESET0_MASK			BIT(9)
+#define GPIO_UART5_MODE_MASK			BIT(8)
+#define GPIO_UART4_MODE_MASK			BIT(7)
+#define GPIO_HSUART_CTS_RTS_MODE_MASK		BIT(6)
+#define GPIO_HSUART_MODE_MASK			BIT(5)
+#define GPIO_UART2_CTS_RTS_MODE_MASK		BIT(4)
+#define GPIO_UART2_MODE_MASK			BIT(3)
+#define GPIO_SIPO_MODE_MASK			BIT(2)
+#define GPIO_EMMC_MODE_MASK			BIT(1)
+#define GPIO_PON_MODE_MASK			BIT(0)
+
+#define REG_NPU_UART_EN				0x0224
+#define JTAG_UDI_EN_MASK			BIT(4)
+#define JTAG_DFD_EN_MASK			BIT(3)
+
+#define REG_FORCE_GPIO_EN			0x0228
+#define FORCE_GPIO_EN(n)			BIT(n)
+
+/* LED MAP */
+#define REG_LAN_LED0_MAPPING			0x027c
+#define REG_LAN_LED1_MAPPING			0x0280
+
+#define LAN4_LED_MAPPING_MASK			GENMASK(18, 16)
+#define LAN4_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN4_LED_MAPPING_MASK, (_n))
+
+#define LAN3_LED_MAPPING_MASK			GENMASK(14, 12)
+#define LAN3_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN3_LED_MAPPING_MASK, (_n))
+
+#define LAN2_LED_MAPPING_MASK			GENMASK(10, 8)
+#define LAN2_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN2_LED_MAPPING_MASK, (_n))
+
+#define LAN1_LED_MAPPING_MASK			GENMASK(6, 4)
+#define LAN1_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN1_LED_MAPPING_MASK, (_n))
+
+#define LAN0_LED_MAPPING_MASK			GENMASK(2, 0)
+#define LAN0_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN0_LED_MAPPING_MASK, (_n))
+
+/* CONF */
+#define REG_I2C_SDA_E2				0x001c
+#define AN7583_I2C1_SCL_E2_MASK			BIT(16)
+#define AN7583_I2C1_SDA_E2_MASK			BIT(15)
+#define SPI_MISO_E2_MASK			BIT(14)
+#define SPI_MOSI_E2_MASK			BIT(13)
+#define SPI_CLK_E2_MASK				BIT(12)
+#define SPI_CS0_E2_MASK				BIT(11)
+#define PCIE2_RESET_E2_MASK			BIT(10)
+#define PCIE1_RESET_E2_MASK			BIT(9)
+#define PCIE0_RESET_E2_MASK			BIT(8)
+#define AN7583_MDIO_0_E2_MASK			BIT(5)
+#define AN7583_MDC_0_E2_MASK			BIT(4)
+#define UART1_RXD_E2_MASK			BIT(3)
+#define UART1_TXD_E2_MASK			BIT(2)
+#define I2C_SCL_E2_MASK				BIT(1)
+#define I2C_SDA_E2_MASK				BIT(0)
+
+#define REG_I2C_SDA_E4				0x0020
+#define AN7583_I2C1_SCL_E4_MASK			BIT(16)
+#define AN7583_I2C1_SDA_E4_MASK			BIT(15)
+#define SPI_MISO_E4_MASK			BIT(14)
+#define SPI_MOSI_E4_MASK			BIT(13)
+#define SPI_CLK_E4_MASK				BIT(12)
+#define SPI_CS0_E4_MASK				BIT(11)
+#define PCIE2_RESET_E4_MASK			BIT(10)
+#define PCIE1_RESET_E4_MASK			BIT(9)
+#define PCIE0_RESET_E4_MASK			BIT(8)
+#define AN7583_MDIO_0_E4_MASK			BIT(5)
+#define AN7583_MDC_0_E4_MASK			BIT(4)
+#define UART1_RXD_E4_MASK			BIT(3)
+#define UART1_TXD_E4_MASK			BIT(2)
+#define I2C_SCL_E4_MASK				BIT(1)
+#define I2C_SDA_E4_MASK				BIT(0)
+
+#define REG_GPIO_L_E2				0x0024
+#define REG_GPIO_L_E4				0x0028
+#define REG_GPIO_H_E2				0x002c
+#define REG_GPIO_H_E4				0x0030
+
+#define REG_I2C_SDA_PU				0x0044
+#define AN7583_I2C1_SCL_PU_MASK			BIT(16)
+#define AN7583_I2C1_SDA_PU_MASK			BIT(15)
+#define SPI_MISO_PU_MASK			BIT(14)
+#define SPI_MOSI_PU_MASK			BIT(13)
+#define SPI_CLK_PU_MASK				BIT(12)
+#define SPI_CS0_PU_MASK				BIT(11)
+#define PCIE2_RESET_PU_MASK			BIT(10)
+#define PCIE1_RESET_PU_MASK			BIT(9)
+#define PCIE0_RESET_PU_MASK			BIT(8)
+#define AN7583_MDIO_0_PU_MASK			BIT(5)
+#define AN7583_MDC_0_PU_MASK			BIT(4)
+#define UART1_RXD_PU_MASK			BIT(3)
+#define UART1_TXD_PU_MASK			BIT(2)
+#define I2C_SCL_PU_MASK				BIT(1)
+#define I2C_SDA_PU_MASK				BIT(0)
+
+#define REG_I2C_SDA_PD				0x0048
+#define AN7583_I2C1_SDA_PD_MASK			BIT(16)
+#define AN7583_I2C1_SCL_PD_MASK			BIT(15)
+#define SPI_MISO_PD_MASK			BIT(14)
+#define SPI_MOSI_PD_MASK			BIT(13)
+#define SPI_CLK_PD_MASK				BIT(12)
+#define SPI_CS0_PD_MASK				BIT(11)
+#define PCIE2_RESET_PD_MASK			BIT(10)
+#define PCIE1_RESET_PD_MASK			BIT(9)
+#define PCIE0_RESET_PD_MASK			BIT(8)
+#define AN7583_MDIO_0_PD_MASK			BIT(5)
+#define AN7583_MDC_0_PD_MASK			BIT(4)
+#define UART1_RXD_PD_MASK			BIT(3)
+#define UART1_TXD_PD_MASK			BIT(2)
+#define I2C_SCL_PD_MASK				BIT(1)
+#define I2C_SDA_PD_MASK				BIT(0)
+
+#define REG_GPIO_L_PU				0x004c
+#define REG_GPIO_L_PD				0x0050
+#define REG_GPIO_H_PU				0x0054
+#define REG_GPIO_H_PD				0x0058
+
+#define REG_PCIE_RESET_OD			0x018c
+#define PCIE2_RESET_OD_MASK			BIT(2)
+#define PCIE1_RESET_OD_MASK			BIT(1)
+#define PCIE0_RESET_OD_MASK			BIT(0)
+
+/* GPIOs */
+#define REG_GPIO_CTRL				0x0000
+#define REG_GPIO_DATA				0x0004
+#define REG_GPIO_INT				0x0008
+#define REG_GPIO_INT_EDGE			0x000c
+#define REG_GPIO_INT_LEVEL			0x0010
+#define REG_GPIO_OE				0x0014
+#define REG_GPIO_CTRL1				0x0020
+#define REG_GPIO_CTRL2				0x0060
+#define REG_GPIO_CTRL3				0x0064
+
+/* PWM MODE CONF */
+#define REG_GPIO_FLASH_MODE_CFG			0x0034
+#define GPIO15_FLASH_MODE_CFG			BIT(15)
+#define GPIO14_FLASH_MODE_CFG			BIT(14)
+#define GPIO13_FLASH_MODE_CFG			BIT(13)
+#define GPIO12_FLASH_MODE_CFG			BIT(12)
+#define GPIO11_FLASH_MODE_CFG			BIT(11)
+#define GPIO10_FLASH_MODE_CFG			BIT(10)
+#define GPIO9_FLASH_MODE_CFG			BIT(9)
+#define GPIO8_FLASH_MODE_CFG			BIT(8)
+#define GPIO7_FLASH_MODE_CFG			BIT(7)
+#define GPIO6_FLASH_MODE_CFG			BIT(6)
+#define GPIO5_FLASH_MODE_CFG			BIT(5)
+#define GPIO4_FLASH_MODE_CFG			BIT(4)
+#define GPIO3_FLASH_MODE_CFG			BIT(3)
+#define GPIO2_FLASH_MODE_CFG			BIT(2)
+#define GPIO1_FLASH_MODE_CFG			BIT(1)
+#define GPIO0_FLASH_MODE_CFG			BIT(0)
+
+/* PWM MODE CONF EXT */
+#define REG_GPIO_FLASH_MODE_CFG_EXT		0x0068
+#define GPIO51_FLASH_MODE_CFG			BIT(31)
+#define GPIO50_FLASH_MODE_CFG			BIT(30)
+#define GPIO49_FLASH_MODE_CFG			BIT(29)
+#define GPIO48_FLASH_MODE_CFG			BIT(28)
+#define GPIO47_FLASH_MODE_CFG			BIT(27)
+#define GPIO46_FLASH_MODE_CFG			BIT(26)
+#define GPIO45_FLASH_MODE_CFG			BIT(25)
+#define GPIO44_FLASH_MODE_CFG			BIT(24)
+#define GPIO43_FLASH_MODE_CFG			BIT(23)
+#define GPIO42_FLASH_MODE_CFG			BIT(22)
+#define GPIO41_FLASH_MODE_CFG			BIT(21)
+#define GPIO40_FLASH_MODE_CFG			BIT(20)
+#define GPIO39_FLASH_MODE_CFG			BIT(19)
+#define GPIO38_FLASH_MODE_CFG			BIT(18)
+#define GPIO37_FLASH_MODE_CFG			BIT(17)
+#define GPIO36_FLASH_MODE_CFG			BIT(16)
+#define GPIO31_FLASH_MODE_CFG			BIT(15)
+#define GPIO30_FLASH_MODE_CFG			BIT(14)
+#define GPIO29_FLASH_MODE_CFG			BIT(13)
+#define GPIO28_FLASH_MODE_CFG			BIT(12)
+#define GPIO27_FLASH_MODE_CFG			BIT(11)
+#define GPIO26_FLASH_MODE_CFG			BIT(10)
+#define GPIO25_FLASH_MODE_CFG			BIT(9)
+#define GPIO24_FLASH_MODE_CFG			BIT(8)
+#define GPIO23_FLASH_MODE_CFG			BIT(7)
+#define GPIO22_FLASH_MODE_CFG			BIT(6)
+#define GPIO21_FLASH_MODE_CFG			BIT(5)
+#define GPIO20_FLASH_MODE_CFG			BIT(4)
+#define GPIO19_FLASH_MODE_CFG			BIT(3)
+#define GPIO18_FLASH_MODE_CFG			BIT(2)
+#define GPIO17_FLASH_MODE_CFG			BIT(1)
+#define GPIO16_FLASH_MODE_CFG			BIT(0)
+
+#define REG_GPIO_DATA1				0x0070
+#define REG_GPIO_OE1				0x0078
+#define REG_GPIO_INT1				0x007c
+#define REG_GPIO_INT_EDGE1			0x0080
+#define REG_GPIO_INT_EDGE2			0x0084
+#define REG_GPIO_INT_EDGE3			0x0088
+#define REG_GPIO_INT_LEVEL1			0x008c
+#define REG_GPIO_INT_LEVEL2			0x0090
+#define REG_GPIO_INT_LEVEL3			0x0094
+
+#define AIROHA_NUM_PINS				64
+#define AIROHA_PIN_BANK_SIZE			(AIROHA_NUM_PINS / 2)
+#define AIROHA_REG_GPIOCTRL_NUM_PIN		(AIROHA_NUM_PINS / 4)
+
+/* PWM */
+#define AIROHA_PINCTRL_PWM(gpio, mux_val)		\
+	{						\
+		.name = (gpio),				\
+		.regmap[0] = {				\
+			AIROHA_FUNC_PWM_MUX,		\
+			REG_GPIO_FLASH_MODE_CFG,	\
+			(mux_val),			\
+			(mux_val)			\
+		},					\
+		.regmap_size = 1,			\
+	}						\
+
+#define AIROHA_PINCTRL_PWM_EXT(gpio, mux_val)		\
+	{						\
+		.name = (gpio),				\
+		.regmap[0] = {				\
+			AIROHA_FUNC_PWM_EXT_MUX,	\
+			REG_GPIO_FLASH_MODE_CFG_EXT,	\
+			(mux_val),			\
+			(mux_val)			\
+		},					\
+		.regmap_size = 1,			\
+	}						\
+
+#define AIROHA_PINCTRL_PHY_LED0(gpio, mux_val, map_mask, map_val)	\
+	{								\
+		.name = (gpio),						\
+		.regmap[0] = {						\
+			AIROHA_FUNC_MUX,				\
+			REG_GPIO_2ND_I2C_MODE,				\
+			(mux_val),					\
+			(mux_val),					\
+		},							\
+		.regmap[1] = {						\
+			AIROHA_FUNC_MUX,				\
+			REG_LAN_LED0_MAPPING,				\
+			(map_mask),					\
+			(map_val),					\
+		},							\
+		.regmap_size = 2,					\
+	}
+
+#define AIROHA_PINCTRL_PHY_LED1(gpio, mux_val, map_mask, map_val)	\
+	{								\
+		.name = (gpio),						\
+		.regmap[0] = {						\
+			AIROHA_FUNC_MUX,				\
+			REG_GPIO_2ND_I2C_MODE,				\
+			(mux_val),					\
+			(mux_val),					\
+		},							\
+		.regmap[1] = {						\
+			AIROHA_FUNC_MUX,				\
+			REG_LAN_LED1_MAPPING,				\
+			(map_mask),					\
+			(map_val),					\
+		},							\
+		.regmap_size = 2,					\
+	}
+
+#define airoha_pinctrl_get_pullup_conf(pinctrl, pin, val)			\
+	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLUP,		\
+				(pin), (val))
+#define airoha_pinctrl_get_pulldown_conf(pinctrl, pin, val)			\
+	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLDOWN,	\
+				(pin), (val))
+#define airoha_pinctrl_get_drive_e2_conf(pinctrl, pin, val)			\
+	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_DRIVE_E2,	\
+				(pin), (val))
+#define airoha_pinctrl_get_drive_e4_conf(pinctrl, pin, val)			\
+	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_DRIVE_E4,	\
+				(pin), (val))
+#define airoha_pinctrl_get_pcie_rst_od_conf(pinctrl, pin, val)			\
+	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_PCIE_RST_OD,	\
+				(pin), (val))
+#define airoha_pinctrl_set_pullup_conf(pinctrl, pin, val)			\
+	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLUP,		\
+				(pin), (val))
+#define airoha_pinctrl_set_pulldown_conf(pinctrl, pin, val)			\
+	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLDOWN,	\
+				(pin), (val))
+#define airoha_pinctrl_set_drive_e2_conf(pinctrl, pin, val)			\
+	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_DRIVE_E2,	\
+				(pin), (val))
+#define airoha_pinctrl_set_drive_e4_conf(pinctrl, pin, val)			\
+	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_DRIVE_E4,	\
+				(pin), (val))
+#define airoha_pinctrl_set_pcie_rst_od_conf(pinctrl, pin, val)			\
+	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_PCIE_RST_OD,	\
+				(pin), (val))
+
+struct airoha_pinctrl_reg {
+	u32 offset;
+	u32 mask;
+};
+
+enum airoha_pinctrl_mux_func {
+	AIROHA_FUNC_MUX,
+	AIROHA_FUNC_PWM_MUX,
+	AIROHA_FUNC_PWM_EXT_MUX,
+};
+
+struct airoha_pinctrl_func_group {
+	const char *name;
+	struct {
+		enum airoha_pinctrl_mux_func mux;
+		u32 offset;
+		u32 mask;
+		u32 val;
+	} regmap[2];
+	int regmap_size;
+};
+
+struct airoha_pinctrl_func {
+	const struct pinfunction desc;
+	const struct airoha_pinctrl_func_group *groups;
+	u8 group_size;
+};
+
+struct airoha_pinctrl_conf {
+	u32 pin;
+	struct airoha_pinctrl_reg reg;
+};
+
+struct airoha_pinctrl_gpiochip {
+	struct gpio_chip chip;
+
+	/* gpio */
+	const u32 *data;
+	const u32 *dir;
+	const u32 *out;
+	/* irq */
+	const u32 *status;
+	const u32 *level;
+	const u32 *edge;
+
+	u32 irq_type[AIROHA_NUM_PINS];
+};
+
+struct airoha_pinctrl_confs_info {
+	const struct airoha_pinctrl_conf *confs;
+	unsigned int num_confs;
+};
+
+enum airoha_pinctrl_confs_type {
+	AIROHA_PINCTRL_CONFS_PULLUP,
+	AIROHA_PINCTRL_CONFS_PULLDOWN,
+	AIROHA_PINCTRL_CONFS_DRIVE_E2,
+	AIROHA_PINCTRL_CONFS_DRIVE_E4,
+	AIROHA_PINCTRL_CONFS_PCIE_RST_OD,
+
+	AIROHA_PINCTRL_CONFS_MAX,
+};
+
+struct airoha_pinctrl {
+	struct pinctrl_dev *ctrl;
+
+	struct pinctrl_desc desc;
+	const struct pingroup *grps;
+	const struct airoha_pinctrl_func *funcs;
+	const struct airoha_pinctrl_confs_info *confs_info;
+
+	struct regmap *chip_scu;
+	struct regmap *regmap;
+
+	struct airoha_pinctrl_gpiochip gpiochip;
+};
+
+struct airoha_pinctrl_match_data {
+	const struct pinctrl_pin_desc *pins;
+	const unsigned int num_pins;
+	const struct pingroup *grps;
+	const unsigned int num_grps;
+	const struct airoha_pinctrl_func *funcs;
+	const unsigned int num_funcs;
+	const struct airoha_pinctrl_confs_info confs_info[AIROHA_PINCTRL_CONFS_MAX];
+};
+
+#endif
diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index bf5ebb31e635..0b4bbcf08ec9 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -5,290 +5,7 @@
  * Author: Markus Gothe <markus.gothe@genexis.eu>
  */
 
-#include <dt-bindings/pinctrl/mt65xx.h>
-#include <linux/bitfield.h>
-#include <linux/bits.h>
-#include <linux/cleanup.h>
-#include <linux/gpio/driver.h>
-#include <linux/interrupt.h>
-#include <linux/io.h>
-#include <linux/irq.h>
-#include <linux/irqdomain.h>
-#include <linux/mfd/syscon.h>
-#include <linux/of.h>
-#include <linux/of_irq.h>
-#include <linux/of_platform.h>
-#include <linux/pinctrl/consumer.h>
-#include <linux/pinctrl/pinctrl.h>
-#include <linux/pinctrl/pinconf.h>
-#include <linux/pinctrl/pinconf-generic.h>
-#include <linux/pinctrl/pinmux.h>
-#include <linux/platform_device.h>
-#include <linux/regmap.h>
-
-#include "../core.h"
-#include "../pinconf.h"
-#include "../pinmux.h"
-
-#define PINCTRL_PIN_GROUP(id, table)					\
-	PINCTRL_PINGROUP(id, table##_pins, ARRAY_SIZE(table##_pins))
-
-#define PINCTRL_FUNC_DESC(id, table)					\
-	{								\
-		.desc = PINCTRL_PINFUNCTION(id, table##_groups,	\
-					    ARRAY_SIZE(table##_groups)),\
-		.groups = table##_func_group,				\
-		.group_size = ARRAY_SIZE(table##_func_group),		\
-	}
-
-#define PINCTRL_CONF_DESC(p, offset, mask)				\
-	{								\
-		.pin = p,						\
-		.reg = { offset, mask },				\
-	}
-
-/* MUX */
-#define REG_GPIO_2ND_I2C_MODE			0x0214
-#define GPIO_MDC_IO_MASTER_MODE_MODE		BIT(14)
-#define GPIO_I2C_MASTER_MODE_MODE		BIT(13)
-#define GPIO_I2S_MODE_MASK			BIT(12)
-#define GPIO_I2C_SLAVE_MODE_MODE		BIT(11)
-#define GPIO_LAN3_LED1_MODE_MASK		BIT(10)
-#define GPIO_LAN3_LED0_MODE_MASK		BIT(9)
-#define GPIO_LAN2_LED1_MODE_MASK		BIT(8)
-#define GPIO_LAN2_LED0_MODE_MASK		BIT(7)
-#define GPIO_LAN1_LED1_MODE_MASK		BIT(6)
-#define GPIO_LAN1_LED0_MODE_MASK		BIT(5)
-#define GPIO_LAN0_LED1_MODE_MASK		BIT(4)
-#define GPIO_LAN0_LED0_MODE_MASK		BIT(3)
-#define PON_TOD_1PPS_MODE_MASK			BIT(2)
-#define GSW_TOD_1PPS_MODE_MASK			BIT(1)
-#define GPIO_2ND_I2C_MODE_MASK			BIT(0)
-
-#define REG_GPIO_SPI_CS1_MODE			0x0218
-#define GPIO_PCM_SPI_CS4_MODE_MASK		BIT(21)
-#define GPIO_PCM_SPI_CS3_MODE_MASK		BIT(20)
-#define GPIO_PCM_SPI_CS2_MODE_P156_MASK		BIT(19)
-#define GPIO_PCM_SPI_CS2_MODE_P128_MASK		BIT(18)
-#define AN7583_GPIO_PCM_SPI_CS2_MODE_MASK	BIT(18)
-#define GPIO_PCM_SPI_CS1_MODE_MASK		BIT(17)
-#define GPIO_PCM_SPI_MODE_MASK			BIT(16)
-#define GPIO_PCM2_MODE_MASK			BIT(13)
-#define GPIO_PCM1_MODE_MASK			BIT(12)
-#define GPIO_PCM_INT_MODE_MASK			BIT(9)
-#define GPIO_PCM_RESET_MODE_MASK		BIT(8)
-#define GPIO_SPI_QUAD_MODE_MASK			BIT(4)
-#define GPIO_SPI_CS4_MODE_MASK			BIT(3)
-#define GPIO_SPI_CS3_MODE_MASK			BIT(2)
-#define GPIO_SPI_CS2_MODE_MASK			BIT(1)
-#define GPIO_SPI_CS1_MODE_MASK			BIT(0)
-
-#define REG_GPIO_PON_MODE			0x021c
-#define GPIO_PARALLEL_NAND_MODE_MASK		BIT(14)
-#define GPIO_SGMII_MDIO_MODE_MASK		BIT(13)
-#define GPIO_PCIE_RESET2_MASK			BIT(12)
-#define SIPO_RCLK_MODE_MASK			BIT(11)
-#define GPIO_PCIE_RESET1_MASK			BIT(10)
-#define GPIO_PCIE_RESET0_MASK			BIT(9)
-#define GPIO_UART5_MODE_MASK			BIT(8)
-#define GPIO_UART4_MODE_MASK			BIT(7)
-#define GPIO_HSUART_CTS_RTS_MODE_MASK		BIT(6)
-#define GPIO_HSUART_MODE_MASK			BIT(5)
-#define GPIO_UART2_CTS_RTS_MODE_MASK		BIT(4)
-#define GPIO_UART2_MODE_MASK			BIT(3)
-#define GPIO_SIPO_MODE_MASK			BIT(2)
-#define GPIO_EMMC_MODE_MASK			BIT(1)
-#define GPIO_PON_MODE_MASK			BIT(0)
-
-#define REG_NPU_UART_EN				0x0224
-#define JTAG_UDI_EN_MASK			BIT(4)
-#define JTAG_DFD_EN_MASK			BIT(3)
-
-#define REG_FORCE_GPIO_EN			0x0228
-#define FORCE_GPIO_EN(n)			BIT(n)
-
-/* LED MAP */
-#define REG_LAN_LED0_MAPPING			0x027c
-#define REG_LAN_LED1_MAPPING			0x0280
-
-#define LAN4_LED_MAPPING_MASK			GENMASK(18, 16)
-#define LAN4_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN4_LED_MAPPING_MASK, (_n))
-
-#define LAN3_LED_MAPPING_MASK			GENMASK(14, 12)
-#define LAN3_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN3_LED_MAPPING_MASK, (_n))
-
-#define LAN2_LED_MAPPING_MASK			GENMASK(10, 8)
-#define LAN2_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN2_LED_MAPPING_MASK, (_n))
-
-#define LAN1_LED_MAPPING_MASK			GENMASK(6, 4)
-#define LAN1_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN1_LED_MAPPING_MASK, (_n))
-
-#define LAN0_LED_MAPPING_MASK			GENMASK(2, 0)
-#define LAN0_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN0_LED_MAPPING_MASK, (_n))
-
-/* CONF */
-#define REG_I2C_SDA_E2				0x001c
-#define AN7583_I2C1_SCL_E2_MASK			BIT(16)
-#define AN7583_I2C1_SDA_E2_MASK			BIT(15)
-#define SPI_MISO_E2_MASK			BIT(14)
-#define SPI_MOSI_E2_MASK			BIT(13)
-#define SPI_CLK_E2_MASK				BIT(12)
-#define SPI_CS0_E2_MASK				BIT(11)
-#define PCIE2_RESET_E2_MASK			BIT(10)
-#define PCIE1_RESET_E2_MASK			BIT(9)
-#define PCIE0_RESET_E2_MASK			BIT(8)
-#define AN7583_MDIO_0_E2_MASK			BIT(5)
-#define AN7583_MDC_0_E2_MASK			BIT(4)
-#define UART1_RXD_E2_MASK			BIT(3)
-#define UART1_TXD_E2_MASK			BIT(2)
-#define I2C_SCL_E2_MASK				BIT(1)
-#define I2C_SDA_E2_MASK				BIT(0)
-
-#define REG_I2C_SDA_E4				0x0020
-#define AN7583_I2C1_SCL_E4_MASK			BIT(16)
-#define AN7583_I2C1_SDA_E4_MASK			BIT(15)
-#define SPI_MISO_E4_MASK			BIT(14)
-#define SPI_MOSI_E4_MASK			BIT(13)
-#define SPI_CLK_E4_MASK				BIT(12)
-#define SPI_CS0_E4_MASK				BIT(11)
-#define PCIE2_RESET_E4_MASK			BIT(10)
-#define PCIE1_RESET_E4_MASK			BIT(9)
-#define PCIE0_RESET_E4_MASK			BIT(8)
-#define AN7583_MDIO_0_E4_MASK			BIT(5)
-#define AN7583_MDC_0_E4_MASK			BIT(4)
-#define UART1_RXD_E4_MASK			BIT(3)
-#define UART1_TXD_E4_MASK			BIT(2)
-#define I2C_SCL_E4_MASK				BIT(1)
-#define I2C_SDA_E4_MASK				BIT(0)
-
-#define REG_GPIO_L_E2				0x0024
-#define REG_GPIO_L_E4				0x0028
-#define REG_GPIO_H_E2				0x002c
-#define REG_GPIO_H_E4				0x0030
-
-#define REG_I2C_SDA_PU				0x0044
-#define AN7583_I2C1_SCL_PU_MASK			BIT(16)
-#define AN7583_I2C1_SDA_PU_MASK			BIT(15)
-#define SPI_MISO_PU_MASK			BIT(14)
-#define SPI_MOSI_PU_MASK			BIT(13)
-#define SPI_CLK_PU_MASK				BIT(12)
-#define SPI_CS0_PU_MASK				BIT(11)
-#define PCIE2_RESET_PU_MASK			BIT(10)
-#define PCIE1_RESET_PU_MASK			BIT(9)
-#define PCIE0_RESET_PU_MASK			BIT(8)
-#define AN7583_MDIO_0_PU_MASK			BIT(5)
-#define AN7583_MDC_0_PU_MASK			BIT(4)
-#define UART1_RXD_PU_MASK			BIT(3)
-#define UART1_TXD_PU_MASK			BIT(2)
-#define I2C_SCL_PU_MASK				BIT(1)
-#define I2C_SDA_PU_MASK				BIT(0)
-
-#define REG_I2C_SDA_PD				0x0048
-#define AN7583_I2C1_SDA_PD_MASK			BIT(16)
-#define AN7583_I2C1_SCL_PD_MASK			BIT(15)
-#define SPI_MISO_PD_MASK			BIT(14)
-#define SPI_MOSI_PD_MASK			BIT(13)
-#define SPI_CLK_PD_MASK				BIT(12)
-#define SPI_CS0_PD_MASK				BIT(11)
-#define PCIE2_RESET_PD_MASK			BIT(10)
-#define PCIE1_RESET_PD_MASK			BIT(9)
-#define PCIE0_RESET_PD_MASK			BIT(8)
-#define AN7583_MDIO_0_PD_MASK			BIT(5)
-#define AN7583_MDC_0_PD_MASK			BIT(4)
-#define UART1_RXD_PD_MASK			BIT(3)
-#define UART1_TXD_PD_MASK			BIT(2)
-#define I2C_SCL_PD_MASK				BIT(1)
-#define I2C_SDA_PD_MASK				BIT(0)
-
-#define REG_GPIO_L_PU				0x004c
-#define REG_GPIO_L_PD				0x0050
-#define REG_GPIO_H_PU				0x0054
-#define REG_GPIO_H_PD				0x0058
-
-#define REG_PCIE_RESET_OD			0x018c
-#define PCIE2_RESET_OD_MASK			BIT(2)
-#define PCIE1_RESET_OD_MASK			BIT(1)
-#define PCIE0_RESET_OD_MASK			BIT(0)
-
-/* GPIOs */
-#define REG_GPIO_CTRL				0x0000
-#define REG_GPIO_DATA				0x0004
-#define REG_GPIO_INT				0x0008
-#define REG_GPIO_INT_EDGE			0x000c
-#define REG_GPIO_INT_LEVEL			0x0010
-#define REG_GPIO_OE				0x0014
-#define REG_GPIO_CTRL1				0x0020
-
-/* PWM MODE CONF */
-#define REG_GPIO_FLASH_MODE_CFG			0x0034
-#define GPIO15_FLASH_MODE_CFG			BIT(15)
-#define GPIO14_FLASH_MODE_CFG			BIT(14)
-#define GPIO13_FLASH_MODE_CFG			BIT(13)
-#define GPIO12_FLASH_MODE_CFG			BIT(12)
-#define GPIO11_FLASH_MODE_CFG			BIT(11)
-#define GPIO10_FLASH_MODE_CFG			BIT(10)
-#define GPIO9_FLASH_MODE_CFG			BIT(9)
-#define GPIO8_FLASH_MODE_CFG			BIT(8)
-#define GPIO7_FLASH_MODE_CFG			BIT(7)
-#define GPIO6_FLASH_MODE_CFG			BIT(6)
-#define GPIO5_FLASH_MODE_CFG			BIT(5)
-#define GPIO4_FLASH_MODE_CFG			BIT(4)
-#define GPIO3_FLASH_MODE_CFG			BIT(3)
-#define GPIO2_FLASH_MODE_CFG			BIT(2)
-#define GPIO1_FLASH_MODE_CFG			BIT(1)
-#define GPIO0_FLASH_MODE_CFG			BIT(0)
-
-#define REG_GPIO_CTRL2				0x0060
-#define REG_GPIO_CTRL3				0x0064
-
-/* PWM MODE CONF EXT */
-#define REG_GPIO_FLASH_MODE_CFG_EXT		0x0068
-#define GPIO51_FLASH_MODE_CFG			BIT(31)
-#define GPIO50_FLASH_MODE_CFG			BIT(30)
-#define GPIO49_FLASH_MODE_CFG			BIT(29)
-#define GPIO48_FLASH_MODE_CFG			BIT(28)
-#define GPIO47_FLASH_MODE_CFG			BIT(27)
-#define GPIO46_FLASH_MODE_CFG			BIT(26)
-#define GPIO45_FLASH_MODE_CFG			BIT(25)
-#define GPIO44_FLASH_MODE_CFG			BIT(24)
-#define GPIO43_FLASH_MODE_CFG			BIT(23)
-#define GPIO42_FLASH_MODE_CFG			BIT(22)
-#define GPIO41_FLASH_MODE_CFG			BIT(21)
-#define GPIO40_FLASH_MODE_CFG			BIT(20)
-#define GPIO39_FLASH_MODE_CFG			BIT(19)
-#define GPIO38_FLASH_MODE_CFG			BIT(18)
-#define GPIO37_FLASH_MODE_CFG			BIT(17)
-#define GPIO36_FLASH_MODE_CFG			BIT(16)
-#define GPIO31_FLASH_MODE_CFG			BIT(15)
-#define GPIO30_FLASH_MODE_CFG			BIT(14)
-#define GPIO29_FLASH_MODE_CFG			BIT(13)
-#define GPIO28_FLASH_MODE_CFG			BIT(12)
-#define GPIO27_FLASH_MODE_CFG			BIT(11)
-#define GPIO26_FLASH_MODE_CFG			BIT(10)
-#define GPIO25_FLASH_MODE_CFG			BIT(9)
-#define GPIO24_FLASH_MODE_CFG			BIT(8)
-#define GPIO23_FLASH_MODE_CFG			BIT(7)
-#define GPIO22_FLASH_MODE_CFG			BIT(6)
-#define GPIO21_FLASH_MODE_CFG			BIT(5)
-#define GPIO20_FLASH_MODE_CFG			BIT(4)
-#define GPIO19_FLASH_MODE_CFG			BIT(3)
-#define GPIO18_FLASH_MODE_CFG			BIT(2)
-#define GPIO17_FLASH_MODE_CFG			BIT(1)
-#define GPIO16_FLASH_MODE_CFG			BIT(0)
-
-#define REG_GPIO_DATA1				0x0070
-#define REG_GPIO_OE1				0x0078
-#define REG_GPIO_INT1				0x007c
-#define REG_GPIO_INT_EDGE1			0x0080
-#define REG_GPIO_INT_EDGE2			0x0084
-#define REG_GPIO_INT_EDGE3			0x0088
-#define REG_GPIO_INT_LEVEL1			0x008c
-#define REG_GPIO_INT_LEVEL2			0x0090
-#define REG_GPIO_INT_LEVEL3			0x0094
-
-#define AIROHA_NUM_PINS				64
-#define AIROHA_PIN_BANK_SIZE			(AIROHA_NUM_PINS / 2)
-#define AIROHA_REG_GPIOCTRL_NUM_PIN		(AIROHA_NUM_PINS / 4)
+#include "airoha-common.h"
 
 static const u32 gpio_data_regs[] = {
 	REG_GPIO_DATA,
@@ -326,93 +43,6 @@ static const u32 irq_edge_regs[] = {
 	REG_GPIO_INT_EDGE3
 };
 
-struct airoha_pinctrl_reg {
-	u32 offset;
-	u32 mask;
-};
-
-enum airoha_pinctrl_mux_func {
-	AIROHA_FUNC_MUX,
-	AIROHA_FUNC_PWM_MUX,
-	AIROHA_FUNC_PWM_EXT_MUX,
-};
-
-struct airoha_pinctrl_func_group {
-	const char *name;
-	struct {
-		enum airoha_pinctrl_mux_func mux;
-		u32 offset;
-		u32 mask;
-		u32 val;
-	} regmap[2];
-	int regmap_size;
-};
-
-struct airoha_pinctrl_func {
-	const struct pinfunction desc;
-	const struct airoha_pinctrl_func_group *groups;
-	u8 group_size;
-};
-
-struct airoha_pinctrl_conf {
-	u32 pin;
-	struct airoha_pinctrl_reg reg;
-};
-
-struct airoha_pinctrl_gpiochip {
-	struct gpio_chip chip;
-
-	/* gpio */
-	const u32 *data;
-	const u32 *dir;
-	const u32 *out;
-	/* irq */
-	const u32 *status;
-	const u32 *level;
-	const u32 *edge;
-
-	u32 irq_type[AIROHA_NUM_PINS];
-};
-
-struct airoha_pinctrl_confs_info {
-	const struct airoha_pinctrl_conf *confs;
-	unsigned int num_confs;
-};
-
-enum airoha_pinctrl_confs_type {
-	AIROHA_PINCTRL_CONFS_PULLUP,
-	AIROHA_PINCTRL_CONFS_PULLDOWN,
-	AIROHA_PINCTRL_CONFS_DRIVE_E2,
-	AIROHA_PINCTRL_CONFS_DRIVE_E4,
-	AIROHA_PINCTRL_CONFS_PCIE_RST_OD,
-
-	AIROHA_PINCTRL_CONFS_MAX,
-};
-
-struct airoha_pinctrl {
-	struct pinctrl_dev *ctrl;
-
-	struct pinctrl_desc desc;
-	const struct pingroup *grps;
-	const struct airoha_pinctrl_func *funcs;
-	const struct airoha_pinctrl_confs_info *confs_info;
-
-	struct regmap *chip_scu;
-	struct regmap *regmap;
-
-	struct airoha_pinctrl_gpiochip gpiochip;
-};
-
-struct airoha_pinctrl_match_data {
-	const struct pinctrl_pin_desc *pins;
-	const unsigned int num_pins;
-	const struct pingroup *grps;
-	const unsigned int num_grps;
-	const struct airoha_pinctrl_func *funcs;
-	const unsigned int num_funcs;
-	const struct airoha_pinctrl_confs_info confs_info[AIROHA_PINCTRL_CONFS_MAX];
-};
-
 static struct pinctrl_pin_desc en7581_pinctrl_pins[] = {
 	PINCTRL_PIN(0, "uart1_txd"),
 	PINCTRL_PIN(1, "uart1_rxd"),
@@ -1458,31 +1088,6 @@ static const struct airoha_pinctrl_func_group an7583_pcie_reset_func_group[] = {
 	},
 };
 
-/* PWM */
-#define AIROHA_PINCTRL_PWM(gpio, mux_val)		\
-	{						\
-		.name = (gpio),				\
-		.regmap[0] = {				\
-			AIROHA_FUNC_PWM_MUX,		\
-			REG_GPIO_FLASH_MODE_CFG,	\
-			(mux_val),			\
-			(mux_val)			\
-		},					\
-		.regmap_size = 1,			\
-	}						\
-
-#define AIROHA_PINCTRL_PWM_EXT(gpio, mux_val)		\
-	{						\
-		.name = (gpio),				\
-		.regmap[0] = {				\
-			AIROHA_FUNC_PWM_EXT_MUX,	\
-			REG_GPIO_FLASH_MODE_CFG_EXT,	\
-			(mux_val),			\
-			(mux_val)			\
-		},					\
-		.regmap_size = 1,			\
-	}						\
-
 static const struct airoha_pinctrl_func_group pwm_func_group[] = {
 	AIROHA_PINCTRL_PWM("gpio0", GPIO0_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM("gpio1", GPIO1_FLASH_MODE_CFG),
@@ -1577,42 +1182,6 @@ static const struct airoha_pinctrl_func_group an7583_pwm_func_group[] = {
 	AIROHA_PINCTRL_PWM_EXT("gpio48", GPIO48_FLASH_MODE_CFG),
 };
 
-#define AIROHA_PINCTRL_PHY_LED0(gpio, mux_val, map_mask, map_val)	\
-	{								\
-		.name = (gpio),						\
-		.regmap[0] = {						\
-			AIROHA_FUNC_MUX,				\
-			REG_GPIO_2ND_I2C_MODE,				\
-			(mux_val),					\
-			(mux_val),					\
-		},							\
-		.regmap[1] = {						\
-			AIROHA_FUNC_MUX,				\
-			REG_LAN_LED0_MAPPING,				\
-			(map_mask),					\
-			(map_val),					\
-		},							\
-		.regmap_size = 2,					\
-	}
-
-#define AIROHA_PINCTRL_PHY_LED1(gpio, mux_val, map_mask, map_val)	\
-	{								\
-		.name = (gpio),						\
-		.regmap[0] = {						\
-			AIROHA_FUNC_MUX,				\
-			REG_GPIO_2ND_I2C_MODE,				\
-			(mux_val),					\
-			(mux_val),					\
-		},							\
-		.regmap[1] = {						\
-			AIROHA_FUNC_MUX,				\
-			REG_LAN_LED1_MAPPING,				\
-			(map_mask),					\
-			(map_val),					\
-		},							\
-		.regmap_size = 2,					\
-	}
-
 static const struct airoha_pinctrl_func_group phy1_led0_func_group[] = {
 	AIROHA_PINCTRL_PHY_LED0("gpio33", GPIO_LAN0_LED0_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
@@ -2679,37 +2248,6 @@ static int airoha_pinctrl_set_conf(struct airoha_pinctrl *pinctrl,
 	return 0;
 }
 
-#define airoha_pinctrl_get_pullup_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLUP,		\
-				(pin), (val))
-#define airoha_pinctrl_get_pulldown_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLDOWN,	\
-				(pin), (val))
-#define airoha_pinctrl_get_drive_e2_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_DRIVE_E2,	\
-				(pin), (val))
-#define airoha_pinctrl_get_drive_e4_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_DRIVE_E4,	\
-				(pin), (val))
-#define airoha_pinctrl_get_pcie_rst_od_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_PCIE_RST_OD,	\
-				(pin), (val))
-#define airoha_pinctrl_set_pullup_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLUP,		\
-				(pin), (val))
-#define airoha_pinctrl_set_pulldown_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLDOWN,	\
-				(pin), (val))
-#define airoha_pinctrl_set_drive_e2_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_DRIVE_E2,	\
-				(pin), (val))
-#define airoha_pinctrl_set_drive_e4_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_DRIVE_E4,	\
-				(pin), (val))
-#define airoha_pinctrl_set_pcie_rst_od_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_PCIE_RST_OD,	\
-				(pin), (val))
-
 static int airoha_pinconf_get_direction(struct pinctrl_dev *pctrl_dev, u32 p)
 {
 	struct airoha_pinctrl *pinctrl = pinctrl_dev_get_drvdata(pctrl_dev);
-- 
2.53.0


