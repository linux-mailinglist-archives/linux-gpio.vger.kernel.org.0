Return-Path: <linux-gpio+bounces-38533-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BFnlLXnPMGpLXgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38533-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 06:22:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FBB68BDB5
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 06:22:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=l0iQ7Ix5;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38533-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38533-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F03D31393A9
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 04:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D80A13C819B;
	Tue, 16 Jun 2026 04:20:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022136.outbound.protection.outlook.com [52.101.66.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5142B3C81B6;
	Tue, 16 Jun 2026 04:20:08 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781583610; cv=fail; b=NxDm/HNUSTiGvSqxXaO+EOKdpUWFnWgr1Tynn2FaPl9zESViglZYWpwv0uVt8uNOsyZZvlMfzIIl2nGyVRKLO2OHbeZJeD9x2187HeVz8ONmAjsAskF3HLopbItsJIakOL8jqUMDeLS8uQXC7v+PUjDSX2GgsQEiwe6S4U+OvhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781583610; c=relaxed/simple;
	bh=ayaveoMKbTAtoUjdas+265sqgw2enZ7tyNfPij1QJKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sloF2yaXh7UmOBhEzA9XlpeY2EXv8Z6R0y34AAXX/6ZbI32f69flIFa5ngwiBbSz7iv2TdOzaSmJLzQs2JuNI5n1I6jvVepKSm4SW5A/sYVgbsFXLh4ee7vIyYpbtOeekwop54lJ66guZr2dfPTagPMzl21y29h7N5mgxxPlPEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=l0iQ7Ix5; arc=fail smtp.client-ip=52.101.66.136
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rPgry9AQ1sGfvsDaSUXhyPt2eAk2gj2D1UAlgyBY6QQmUOVEnBHv/iIeishZif+8d6m0lRpjq2XYA8APlkVQ4YEzrs0F6XKA6cVxxCtB+YG9IN1cySrwLpLf40wDSAiWtPRbTkMkZwoJ3Lo1UNy1gN0jp+z3lfeIwDcNrnSXMyQkK86+woeQn+2ibPCM1xe4Hb8nPSfwQxWPd0G5MsqsVsZjNmKZSM8oDw19zJkmlqvOorv0WR2JACEzijWcpCrGkV+3dB1jRNiqmBhpEJ/1SZf4VYZ/utDgLtMv0tf3kVgPfxS1/sMbqGgp5i2WNpJ0ooa5D9VwK2CWI7NqvJS9ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OvYivB+HAafyjsFetj/ARtikoXM8uhB5KaU55S+giwg=;
 b=bNSpxFiriforUySk8+E7BNT7/CxBJdmYVivKARhAJ8C2Rbcdl9wszfGvYzf4bsR2nCICN6anzdJDoNsDoutmzWEF/O6T+ISohF3jRzPX4dV8KWl6frMhVi8sdFAUNtW9BdHNvtAdTuLG/VauPbhNbJ+I4q60qDcBTFu1tNTsbUEoqBNfCugE+jitI2YVltTvg/C02M5C+5FcCXUskyhO98fXVwJi45zkHa36W3hjda5QNIHjZRANy0j7cJY8KwfOOJ2DJJKkdkXvYK9D0yBqeq7qBhNpZt/JF/mCEtJ4bva13BCGL+Esf2mRH0znbI6gSHn80LTkLyejzE1LX85HCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvYivB+HAafyjsFetj/ARtikoXM8uhB5KaU55S+giwg=;
 b=l0iQ7Ix5x0lNb+JL05PeAPOrroOpsFotSesm/hSOrqpIC3SWZ84Xu8RQGVlTq/8Dj7bQAKgQqCOy2J9dWCDXOkZlP18rVwVCaRGtyxuTuP6mCZlzgBExnliKDTKsNoSs9A4APFch3LaMcEAB0yu/1j7tj+lVWeX0CyL9+/XwiG8RZlTtb3PY2ra7SzRZC3SgKBa8tt44o8X5Vriqre2So8PzOEjvX4i7W0jEUPxCkCnUg4nuJJb3mHjMJSpevnJoMdAUFq0sF7nrGGLSC0xtIkp3ZElyco3r3r/L4XicbYNAzn0o247D/MjX+M2nXiEm6Tj38MmyroX1C1OSnyWFWg==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS2PR08MB10055.eurprd08.prod.outlook.com (2603:10a6:20b:645::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 04:19:58 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Tue, 16 Jun 2026
 04:19:58 +0000
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
Subject: [PATCH v2 05/12] pinctrl: airoha: an7583: fix muxing of non-gpio default pins
Date: Tue, 16 Jun 2026 07:19:32 +0300
Message-ID: <20260616041939.2587012-6-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 222633ec-7f07-4664-00b1-08decb5e86fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|18002099003|22082099003|38350700014|921020|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	wLnQr9OBzM5sGtiGuAls7wdNRSjGx1YluCK5Ml3Rfn5c7oejG4lCBzmI2PPwdu+MWdhk5/m6dspURZ1yeQD144AxUhoF4HWuA5qfgtPzhkwunOM+BGbawbOj4ZQx6S/x9dmiXN1Bdqb6YHSGb6+0OPxkRYA4zkFGUEtlxQ9K5fJ7lkx4YZLvzn5waMLkwv2B/gPb6yiwTiZ4SYBc5UZmwPrJh4oVy8N3E1j6o9QHEw9c/2KVSEnteJZQRPqJ9aiXvDTE/J+VZlQ4ebi4Oq4mqvxl0wPYobXvaq/0wa8wMdvsfi6edlkjTeN+/JwKD0lzav01ZNRcWXH78K93AH/i0Zwak5dpc9fv9Ky84F/aULL22pQBXaMQrhFTZHlRxdf6kThcVolr9nKzaa+u/Ju5BfQSKw9kXFSQGX6otOz3bFAubKenfiMVLZgjR5SHz+PeUeAGXRn9PgRyK4jDEOXTnlYjVfhpCL7LdtQQexvSFHTdjCl8ivOo0oh8fOLochVqz7ZwStNZ6sodpAXBLTTWHin8Wd3kiFpBavEcKaYD+tp3c2yng2zkcxFNyleuxMhiwap1mqbM7uPL+vQdrVC2u2tSSx7PTut7RUTerxQ8pYApTUMZvzP27Nbu1k/61xT4HhnG2nmvce93zfYH6sDBzx+lTDz6dzSLqBQbX0G1uzUwdp0n7mjjXVzk5r2sk/itJ/ssO5SNn8TZI7NO275zvPq82LC8nwUJJF7qaVjIJ5u7OiPSONUja+sCGp4kgRko7sySQDbRZizlGpeMbmcXPw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(18002099003)(22082099003)(38350700014)(921020)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VM82uoKfKqyfhIK/DkKEYgitUSE+V9noynMoGwO8/SwZyLaedwVM9iX2jZDG?=
 =?us-ascii?Q?WaQbj5dx4HGQdlpabBNMUf8iWTratgE6N0GHcxPkicM6Gl9jothxfQQWfZjh?=
 =?us-ascii?Q?F2P1/MIuNMMeGTxLWRo0rX5DRtCkASwTcZHYennt0yxtpSsn4B0lO3FwwgS9?=
 =?us-ascii?Q?Q1w+cLrWNRZpwEA5qQ4TCR0zhIB0jNHTpggiyz0ysqR2vUXRHmrga9xoFqpY?=
 =?us-ascii?Q?9US3hqgRHvtfPICe8FihNJrYCCgiABZeBP65DYoS3uONw+ubdpx+ThhSaep9?=
 =?us-ascii?Q?UAuyQytAPbu2Kx/s1Tp03k67Wn255AzO6nINHLZy6CuQHh/g0NOt1tOsPNKD?=
 =?us-ascii?Q?8/uBNCLCDmYHMc/Bkh49/KGVCovQ9ifpSL0qy4LWIfmD0Yhb3VeLh8kfmCOk?=
 =?us-ascii?Q?6nk7bThmcGeXJy5luSqAXeO7xrKol8C+VjKu2RLwzG4zYzjfxM/68SfyvK3p?=
 =?us-ascii?Q?PcMoPZpKUvaPjBut+VHRx0WpeZYHAvIHnnQuWafRR1ZFpTW1qEIRpGkUAdDu?=
 =?us-ascii?Q?IACRX6K203/9WFQGM5yKNA8Jsi0gT6qEoNRGnNq2KbAmhN5iHiDyMcsVNMzP?=
 =?us-ascii?Q?5pXp2MTJUZYz7Ahvd9E1FFXnM07eHSWVjZEwIq/Kl8GiurFEsLx5dLr9hzR2?=
 =?us-ascii?Q?28r3gqKKESHxkSbDNVFFORA8a+jmXK+27yr0M4f43JWZ7LVw2Hxv2qK7H4oZ?=
 =?us-ascii?Q?O7cxfzO9w9RVmvca1mRSYnIHHd1u77HSEq6ZEpTb8Lg+QfB/Nf2H3QGmLTtk?=
 =?us-ascii?Q?DxyuuG1r08kDgA8aATQHuypUTMgqU9YqgLzNu12qKLVyOWtWcAR6+y+tpwQ7?=
 =?us-ascii?Q?4cOzpENyc4oNudq1Jhs9xPL0o+STM7syLbDDBrWYyiWrvVixEICT8cBids/X?=
 =?us-ascii?Q?8Q6umAtMI+cDPuJoUzj1hhVb1c5zX+3q0wDigasvQ+wGnsiiaY1vsDsqMGQ/?=
 =?us-ascii?Q?14potorNqMwoc29YtL7acwnLOQeos87A4VQcxsNr9xv5Wyxv9r0sHBbAKPKH?=
 =?us-ascii?Q?JqNWClBysT1f42MTMoBj3WjwE7gN4+2O4FPEvP653GrZ11/aldZEIAG6AHkV?=
 =?us-ascii?Q?vGyiIjJ4mPMzF2ldnRVO1T4swd2pJITPkbxRMniovStehGoaBtxV3AySGqfe?=
 =?us-ascii?Q?0qCj5o/IvA/SDw2B3Y8fUfDgSQCnfC91OwnOz+UbP3QQiCcWkecdURWJLN0o?=
 =?us-ascii?Q?1oe9qp7A4u7PuvG0OTUJM/KKn03zV/R6Gnt1K/196InOfxrXGYH/EhVjKe8r?=
 =?us-ascii?Q?H4jsQoY9QPsWkpSzO783p9cMe3wBrM/tSv9qg3yQwGIxoyptJNHCOLa/sZV5?=
 =?us-ascii?Q?V1te3aX+4y10U/si/jgUJT8koziDSs6c8u6R6rBUOHOTclo4XGzIolMU4xWJ?=
 =?us-ascii?Q?rWyExrqWBc9Jjo796sYfmIgYZ89oHFgz9MQoFehkhS+KHDCjV04ulS2ZSghe?=
 =?us-ascii?Q?8TiY34a5pTtIAMzzpsQeB5OdvB99i0BBE3LXxiGBf5+m/4Zx2YOMuOtxteA9?=
 =?us-ascii?Q?f8yo6XiMQAG10sOnskODuHAKCqVUs3TYClX1fa9zhHoXRLEZx1a9Q8+eALqO?=
 =?us-ascii?Q?7Ab2Xd1PqViGjuq9D1q3SysTGpD3KpKqhZOSneIq7lfXOKHLleL1NmQYUhF0?=
 =?us-ascii?Q?8vEZjMUhUmb9awakJJtA6apyESefx+172CBg+abNs2YPynUnVSVGkWUhHsG6?=
 =?us-ascii?Q?j2FvG3e/XYY5IXw9w5XYjK5SwaitV2KEFlTHjwT0YkUds3Rwc4+fBY6cw162?=
 =?us-ascii?Q?bXheMp+5w5d9yCmN3gh18lx20v+tn2s=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 222633ec-7f07-4664-00b1-08decb5e86fa
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 04:19:58.6567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jXUC+OTtzWLMf2TPK6S3W2Gkme2h2W3GIUJK8cVJXdTfC1dxWhCMDQhWXg2DfqXDM1eOAGNqdrdYEXEKtDawRFJ13RltQCto1EAeC8FVNOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10055
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
	TAGGED_FROM(0.00)[bounces-38533-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,iopsys.eu:dkim,iopsys.eu:email,iopsys.eu:mid,iopsys.eu:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 18FBB68BDB5

Current an7583 pinmux implementation have following issues:
 * pins 51 and 52 can't be set as pcie_reset, current pcie_reset code
   will sets pins to gpio mode instead.
 * there is no proper way to set pins 41--54 to gpio mode.
 * pins 41--53 can't be actually set as pwm pins. These pins must be
   muxed to gpio mode as well.

This patch fixes above issues.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 100 ++++++++++++++++++++----
 1 file changed, 86 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 97b6d46ccb2b..e3a8ecbb20bd 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -84,6 +84,18 @@
 #define GPIO_SPI_CS1_MODE_MASK			BIT(0)
 
 #define REG_GPIO_PON_MODE			0x021c
+#define AN7583_MDIO_0_GPIO_MODE_MASK		BIT(26)
+#define AN7583_MDC_0_GPIO_MODE_MASK		BIT(25)
+#define AN7583_UART_RXD_GPIO_MODE_MASK		BIT(24)
+#define AN7583_UART_TXD_GPIO_MODE_MASK		BIT(23)
+#define AN7583_SPI_MISO_GPIO_MODE_MASK		BIT(22)
+#define AN7583_SPI_MOSI_GPIO_MODE_MASK		BIT(21)
+#define AN7583_SPI_CS_GPIO_MODE_MASK		BIT(20)
+#define AN7583_SPI_CLK_GPIO_MODE_MASK		BIT(19)
+#define AN7583_I2C1_SDA_GPIO_MODE_MASK		BIT(18)
+#define AN7583_I2C1_SCL_GPIO_MODE_MASK		BIT(17)
+#define AN7583_I2C0_SDA_GPIO_MODE_MASK		BIT(16)
+#define AN7583_I2C0_SCL_GPIO_MODE_MASK		BIT(15)
 #define GPIO_PARALLEL_NAND_MODE_MASK		BIT(14)
 #define GPIO_SGMII_MDIO_MODE_MASK		BIT(13)
 #define GPIO_PCIE_RESET2_MASK			BIT(12)
@@ -773,6 +785,10 @@ static const int an7583_gpio45_pins[] = { 47 };
 static const int an7583_gpio46_pins[] = { 48 };
 static const int an7583_gpio47_pins[] = { 49 };
 static const int an7583_gpio48_pins[] = { 50 };
+static const int an7583_gpio49_pins[] = { 51 };
+static const int an7583_gpio50_pins[] = { 52 };
+static const int an7583_gpio51_pins[] = { 53 };
+static const int an7583_gpio52_pins[] = { 54 };
 static const int an7583_pcie_reset0_pins[] = { 51 };
 static const int an7583_pcie_reset1_pins[] = { 52 };
 
@@ -853,6 +869,10 @@ static const struct pingroup an7583_pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("gpio46", an7583_gpio46),
 	PINCTRL_PIN_GROUP("gpio47", an7583_gpio47),
 	PINCTRL_PIN_GROUP("gpio48", an7583_gpio48),
+	PINCTRL_PIN_GROUP("gpio49", an7583_gpio49),
+	PINCTRL_PIN_GROUP("gpio50", an7583_gpio50),
+	PINCTRL_PIN_GROUP("gpio51", an7583_gpio51),
+	PINCTRL_PIN_GROUP("gpio52", an7583_gpio52),
 	PINCTRL_PIN_GROUP("pcie_reset0", an7583_pcie_reset0),
 	PINCTRL_PIN_GROUP("pcie_reset1", an7583_pcie_reset1),
 };
@@ -882,6 +902,11 @@ static const char *const pnand_groups[] = { "pnand" };
 static const char *const gpio_groups[] = { "gpio44", "gpio45", "gpio46" };
 static const char *const pcie_reset_groups[] = { "pcie_reset0", "pcie_reset1",
 						 "pcie_reset2" };
+static const char *const an7583_gpio_groups[] = { "gpio39", "gpio40", "gpio41",
+						  "gpio42", "gpio43", "gpio44",
+						  "gpio45", "gpio46", "gpio47",
+						  "gpio48", "gpio49", "gpio50",
+						  "gpio51", "gpio52" };
 static const char *const an7583_pcie_reset_groups[] = { "pcie_reset0", "pcie_reset1" };
 static const char *const pwm_groups[] = { "gpio0", "gpio1",
 					  "gpio2", "gpio3",
@@ -927,7 +952,8 @@ static const char *const an7583_pwm_groups[] = { "gpio0", "gpio1",
 						 "gpio42", "gpio43",
 						 "gpio44", "gpio45",
 						 "gpio46", "gpio47",
-						 "gpio48" };
+						 "gpio48", "gpio49",
+						 "gpio50", "gpio51" };
 static const char *const phy1_led0_groups[] = { "gpio33", "gpio34",
 						"gpio35", "gpio42" };
 static const char *const phy2_led0_groups[] = { "gpio33", "gpio34",
@@ -1473,6 +1499,36 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 	},
 };
 
+static const struct airoha_pinctrl_func_group an7583_gpio_func_group[] = {
+	AIROHA_PINCTRL_GPIO_EXT("gpio39", GPIO39_FLASH_MODE_CFG,
+				AN7583_I2C0_SCL_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio40", GPIO40_FLASH_MODE_CFG,
+				AN7583_I2C0_SDA_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio41", GPIO41_FLASH_MODE_CFG,
+				AN7583_I2C1_SCL_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio42", GPIO42_FLASH_MODE_CFG,
+				AN7583_I2C1_SDA_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio43", GPIO43_FLASH_MODE_CFG,
+				AN7583_SPI_CLK_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio44", GPIO44_FLASH_MODE_CFG,
+				AN7583_SPI_CS_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio45", GPIO45_FLASH_MODE_CFG,
+				AN7583_SPI_MOSI_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio46", GPIO46_FLASH_MODE_CFG,
+				AN7583_SPI_MISO_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio47", GPIO47_FLASH_MODE_CFG,
+				AN7583_UART_TXD_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio48", GPIO48_FLASH_MODE_CFG,
+				AN7583_UART_RXD_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio49", GPIO49_FLASH_MODE_CFG,
+				GPIO_PCIE_RESET0_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio50", GPIO50_FLASH_MODE_CFG,
+				GPIO_PCIE_RESET1_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio51", GPIO51_FLASH_MODE_CFG,
+				AN7583_MDC_0_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO("gpio52", AN7583_MDIO_0_GPIO_MODE_MASK),
+};
+
 static const struct airoha_pinctrl_func_group an7583_pcie_reset_func_group[] = {
 	{
 		.name = "pcie_reset0",
@@ -1480,7 +1536,7 @@ static const struct airoha_pinctrl_func_group an7583_pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET0_MASK,
-			GPIO_PCIE_RESET0_MASK
+			0
 		},
 		.regmap_size = 1,
 	}, {
@@ -1489,7 +1545,7 @@ static const struct airoha_pinctrl_func_group an7583_pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET1_MASK,
-			GPIO_PCIE_RESET1_MASK
+			0
 		},
 		.regmap_size = 1,
 	},
@@ -1622,17 +1678,32 @@ static const struct airoha_pinctrl_func_group an7583_pwm_func_group[] = {
 	AIROHA_PINCTRL_PWM_EXT("gpio31", GPIO31_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio36", GPIO36_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio37", GPIO37_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio38", GPIO38_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio39", GPIO39_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio40", GPIO40_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio41", GPIO41_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio42", GPIO42_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio43", GPIO43_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio44", GPIO44_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio45", GPIO45_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio46", GPIO46_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio47", GPIO47_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio48", GPIO48_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio39", GPIO39_FLASH_MODE_CFG,
+				   AN7583_I2C0_SCL_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio40", GPIO40_FLASH_MODE_CFG,
+				   AN7583_I2C0_SDA_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio41", GPIO41_FLASH_MODE_CFG,
+				   AN7583_I2C1_SCL_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio42", GPIO42_FLASH_MODE_CFG,
+				   AN7583_I2C1_SDA_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio43", GPIO43_FLASH_MODE_CFG,
+				   AN7583_SPI_CLK_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio44", GPIO44_FLASH_MODE_CFG,
+				   AN7583_SPI_CS_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio45", GPIO45_FLASH_MODE_CFG,
+				   AN7583_SPI_MOSI_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio46", GPIO46_FLASH_MODE_CFG,
+				   AN7583_SPI_MISO_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio47", GPIO47_FLASH_MODE_CFG,
+				   AN7583_UART_TXD_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio48", GPIO48_FLASH_MODE_CFG,
+				   AN7583_UART_RXD_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio49", GPIO49_FLASH_MODE_CFG,
+				   GPIO_PCIE_RESET0_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio50", GPIO50_FLASH_MODE_CFG,
+				   GPIO_PCIE_RESET1_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio51", GPIO51_FLASH_MODE_CFG,
+				   AN7583_MDC_0_GPIO_MODE_MASK),
 };
 
 #define AIROHA_PINCTRL_PHY_LED0(gpio, mux_val, map_mask, map_val)	\
@@ -1886,6 +1957,7 @@ static const struct airoha_pinctrl_func an7583_pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("pcm_spi", an7583_pcm_spi),
 	PINCTRL_FUNC_DESC("emmc", emmc),
 	PINCTRL_FUNC_DESC("pnand", pnand),
+	PINCTRL_FUNC_DESC("gpio", an7583_gpio),
 	PINCTRL_FUNC_DESC("pcie_reset", an7583_pcie_reset),
 	PINCTRL_FUNC_DESC("pwm", an7583_pwm),
 	PINCTRL_FUNC_DESC("phy1_led0", an7583_phy1_led0),
-- 
2.53.0


