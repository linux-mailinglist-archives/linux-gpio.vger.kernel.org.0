Return-Path: <linux-gpio+bounces-38552-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y2nKNpTpMGqZYgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38552-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 08:13:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E3D68C683
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 08:13:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=OtTnXcXc;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38552-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38552-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4B5EE302184E
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 06:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3AE13DE42E;
	Tue, 16 Jun 2026 06:11:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021101.outbound.protection.outlook.com [40.107.130.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DC83DCD90;
	Tue, 16 Jun 2026 06:11:09 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781590271; cv=fail; b=qtTfZ8z1jNr3WHKVBuGTQJlvN0L033Qoxb+uZec28DontWZ+s+8wP+3CxGIHDiN41cHI4FxxgPEsL+RUdPIMjMLa9vZ8OaXx+i16Wjdp9Cg/1VtH9l7XvuClw8rbEPB0uoiPKBmIJ2XqN0miY6dHS37XyAA4hAvc18yZHvSS5hU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781590271; c=relaxed/simple;
	bh=LLEzSzGJnuvba43cbWokPzvQ2ePHvl2LAnrRMyrsfVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WVni9B98oEanFLrz+Kc1lWxJgO8BtGhfkaVt2YxydxQn52lPbPa5KVfxKcqObyPMbX1XC3BhYVgfbu3sGWW+Qf1hwtGGRDx4A2d7wvFmVw7QjEKs1XHW8gxnF6F6nRPSbxqusI4WKrzk0Mi1pqkJwDV1zSttgj1/aEK0zzZ0mw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=OtTnXcXc; arc=fail smtp.client-ip=40.107.130.101
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s6lW8q9Rr4MFu5kxMboh21FL2M9cg3HlpV0o8pogJgLNV5fKBLdDFocJpo2Zac8Wkx2SKQpQSqYGJwXsvOGkCkZvXljVSCc0z3rApr7LoS3bwpJ9/a5Vpbrqe1zkrgHvTfcpoeTJgFwmAP3n1WU5e0VwAeEmzUW7BKmIjR6Neoe5EiW/X2tHjQm9zdDMpQaiDbGsrCLrfrAXtIhohoiZ7RaBWb5Pd9PhBpe7Vrixtz2QoqHW0SbHvWcBWmLKfh8+fW1AWmz4ENB/Ex6P0lTlLofViWVAkzFrM/Ha/xowjYjpHbbmqF9MVgJOoFs0dpHlszk9hljaErk2l7wqR2pJqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ga/F6AZmcx3r+ni2DUQPvuoSrfK5eDa7tQNcn/bicoA=;
 b=DzCCnA/6xEGEVC0nvw/hNA5V9hjSDZa+p+6UR04tCxIiRCpnQg18/Mq6tH14Ja5A8ykk/YdPjYxzpu1DyVV+goIq0yqj1ndsVps8TFfovh884N/Qm90O3WACKVfny+AFwe7F43hbgfUr2U/NHNpnWUFIe6JF2znKhOHyGk9jTTtSEBqoj/Xmw+kKsBzf6uu7A2GMf82wIVALe8N4oLBzLVPuPDwZJvZOCMQ76lLHl0ETSb/0ZdQASJIz7MPF6rVliylDteBKBBjpO+z22Cyb2WH4qFI5/0kebTHgdaix3cSa0+wEoekAhDnZvUQuPmNDpB8VgqseQ/NteWCQOrbtFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ga/F6AZmcx3r+ni2DUQPvuoSrfK5eDa7tQNcn/bicoA=;
 b=OtTnXcXc0p8LrOrk73BIf4qqMBmpOSfVKPIJgkLhSaSN8gUD5cb3r04yPc452azke1Unecj+r2vxFkVa3du7VbsegPOzG9yVJ88CTp3pUsLKh6b8FS4uOiJ2T34+7+cGzH8eMo2Gb8bKEFxHotk3FZAr5o369Re9KJ1nKINzbzDcyHJCzM5wN5P2BkA/4H6zKIBJXj5gUEfhhuuZfU9NsXT47Ygaff/STmXCx7U5FG7xggs/rgoIEGlA5ZKfPpKh4ADohvXtsQmlrHO7XyHx2XurMv2pleyxImZIb3yHA8G+p4R+VGzfaaX7SpJwNlDgMkB3NILa/sgwKZlZcVIfWg==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA4PR08MB6206.eurprd08.prod.outlook.com (2603:10a6:102:ea::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 06:10:57 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Tue, 16 Jun 2026
 06:10:57 +0000
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
Subject: [PATCH v3 13/13] pinctrl: airoha: try to find chip scu node by phandle first
Date: Tue, 16 Jun 2026 09:10:29 +0300
Message-ID: <20260616061029.2630777-14-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260616061029.2630777-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260616061029.2630777-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF000167ED.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::672) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PA4PR08MB6206:EE_
X-MS-Office365-Filtering-Correlation-Id: e0a1f29c-69b4-41ac-0cea-08decb6e07c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|921020|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	BjptT29IMDLcuzFBXfNJyb9s8AGrwyf3R8CoqMmS7eYtxS+/hcMzCsUvzqt2qGWlD/uJZK1o1rqk/CD1AlGQVc1L0AycZlTpw4+cm4Viyq/0Ow/qtpxRApVRj1IHq5fvNifoANxGzes0PLbjCDGrdYkrma7EMSeEkSa+yHlPxLyo4bJswnO9bBFPQbZ+bZLQ4MkeeVFENqJBBDO9AK+nZNC/UfjaV5hl6iO8sr3PtlAI/a4TzJ/bXA60geZntJubmCcd79DFw4eMu/pN8gwh2P73fmvOFU6BDirsBkTQ9/yvrw9IfVqI5IhKjBTmamyv1s91d151Buysxo6DnRlF2FW5sW+okgW5lZPhcQRWPkrdidLf0+eJy2iI9MQA967ROoD/HdaeE/GpQ9QWjxB1/k4REe7wFdIrFJ3nkUWjNJ9dwCRLq6YyVSeTN4R+lhmoo8eQCpE3LHOMJ9J3tvYDUPraac7e8Tv13lkfXp7AXlnsG76agHrxDeioALtf2q9rkS4i8Qd0GFVyXcmFSXnSojeeAukTUndaY64re0Q5CII6UrrjCer2Lc8aXRkLMVQ6uL12pCRABRzzeXWcVYMYXD/BRLRTGjPOXkFLwMBLsT2y+Fau8sBgoN5U2VBUfFyCSkKaCx7qcq6S6B+KYY/+hbaFEBwlVonUGrKpbJ2+uyKwgNVto5mORtqaNxnpOTuvUDP/itbXrCJSePNErjjPQ/NokNKzmeXu8P+SjtjlvG8LYHMUd2ZncVv2WwpMawKzF+axSmCWU7bL3XEo55os6Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(921020)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IV3CUnHDNDSSqOrvjKyJldefmJAKmPtuhEfeoJGWcO7fZ86AE48E4nUOarsr?=
 =?us-ascii?Q?TqYVxEkJF1tH7feWUjRTaOGv0+FVG9XFsZysS194hkTIUQ10qG9Kkk2aN52V?=
 =?us-ascii?Q?CDEyc+PdGnHe4KOE3Xeu3qFEhju8wWXilFHFi2Jg8rZafo+HWccIhXlBxSTn?=
 =?us-ascii?Q?wS1XS8gYbusIimPpk9x+M8qOk+9VjUKm9C8YbroXap8+Unrx+GghNOhSEQQL?=
 =?us-ascii?Q?0ZbmP4EkKrcyJ7u6z6tWILrf7MuhRpjhTSfhtQsxcmN99zwDZmG7fRMfKUvm?=
 =?us-ascii?Q?crmWkihUHsL37po0h5eeuBV7PGqgGBveIl+h53z3B7rOg5xatbVAW9TDgD18?=
 =?us-ascii?Q?Wm5x9VOBm4dO5w8V7dPFzsiGkVogZMzH3ZpV6DPMrOq5jdZ+aEZGt/JGrxo3?=
 =?us-ascii?Q?DO1iwG2VC7Io+FxedUlIzVO0Sl2fMkZxVO7zDmyU8hHf1WCVaiGw+6/aByq2?=
 =?us-ascii?Q?iQPzO48kP/fMmmPY9WqcJNyOH5CyINzy/cDTSCRFnFoB1uQvQdnbAD2vFv6D?=
 =?us-ascii?Q?V5hj+TLfcteoWReE3umXCcOVbNScFYkvKVY26/UDXxW5ey2FTtV9RwaIJ/57?=
 =?us-ascii?Q?S1bbKt+iJLASyBTHil6yFdVZOCuPmYssu7fD93OtzVza+2KgRJT/BmLXXfzG?=
 =?us-ascii?Q?moAOSi79GHyHf4vvTwENRjyVIVt7/Z2+7pK7MJOCI0trwrYWKA7N5ZOo5OrI?=
 =?us-ascii?Q?Q3K13bUzf4i/gVzCR3UOyGYSO0t5BOQEgDixRs5arr7wAer+D+EGfQTYwSpd?=
 =?us-ascii?Q?2za4PVTqG9/DQLNJ0BWaYwybuPJLvf3mOCy8GdVbXyJVmpOFOLGIhi0is8Oa?=
 =?us-ascii?Q?Xmiciu+cA0R/5GbUhJ1+SEu6eFLkSdRdGBdHC+gFalaaesZfZ2wnyZC9eFsd?=
 =?us-ascii?Q?ygVTDTjbSGK78XEQluuKb4kNRmhgu7i/+xVH/p7Xz8xMbtBel3Aobndp0nMC?=
 =?us-ascii?Q?Lq7msaoViwVCfR9P3TuNqWHpdjv//ICfibdHzCRRjgeb33zFVrypk4NM35S8?=
 =?us-ascii?Q?Bb5cDiUevre9oijQbwFxeEUrur3sW0dX/+Rx2I6INmybVNEZ2C/gPcczsls0?=
 =?us-ascii?Q?HFofWwfK8W607CxGU6qnklTO4KPEB38MWS2Ly39+iKBJNhVW7UUGAviMisVF?=
 =?us-ascii?Q?dX7utEGDLFu04U2Ltc9YWER7bzxnIRJS4nT8Ff949pLUESl77WtMffs0ofx4?=
 =?us-ascii?Q?uKLh1YKxhrSWqIQA1hLZhPUjynCK1n8hiNIR2RtHDbj7ZKUzjXz4aZYcDHNf?=
 =?us-ascii?Q?mf7r0qLuOCJBa4txLPo6tvl3U3UucDIQWcscSrcf9GOw96OgBRYBYGZM/NoN?=
 =?us-ascii?Q?UTjYEIWchnMWgd3R/EI8lRql1qEioXYay9W+XhzD0wVyrY0vcyk+Yhr0Nlxm?=
 =?us-ascii?Q?oUD18kJ2+IX3sbRUcfaZgJ8bHe1r20R77w1oTVuAlhd92Ldd1WBzw4UdztuH?=
 =?us-ascii?Q?BzzPhbAIbxsYB6KkKzRtyZnwCCxMUjFAXXT8KTOjIopYtQ8sarbSknVlz7UC?=
 =?us-ascii?Q?SBPxgLRa07Miu5SD6o98IFc9GlFh4vuJcqnunFpMO/sLUq4v1Y5OfK08CJRo?=
 =?us-ascii?Q?xsQ/JTgsZIhBqbGwjlAtpzYUZEEqbB74UkM0mrbCnBnzJezLttSJatl/6yO2?=
 =?us-ascii?Q?mxVimsM+/yL19X5kUbUr/LZe83nC29fgK5us3Wo7OlhokH/ByI+IdUGJiw4h?=
 =?us-ascii?Q?lTJKwABXgUrj1setBqtQ/5Z0oayGpC8z9Yd2w3cZEivPEmI011UitPTGjBlm?=
 =?us-ascii?Q?gdnHnzkNDVcg0n2sHIcSzSJPjm6QwIk=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: e0a1f29c-69b4-41ac-0cea-08decb6e07c2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 06:10:57.1838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uiLsuj55J2az0jsgjd5aPnZuiAeSNiu8drVRc5kvfAAvVqomGucDF7PqQiwLfrdkkGH7JQRc0J+ep1L9eWtPKWrDk6ABIA/mk7aufBCPrn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6206
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38552-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iopsys.eu:dkim,iopsys.eu:email,iopsys.eu:mid,iopsys.eu:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D4E3D68C683

The "airoha,en7581-chip-scu" is not a good compatible string in the en7523
case. Let's search chip scu regmap with "airoha,chip-scu" phangle first
and fallback to SoC specific chip scu compatible string on failure.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/airoha-common.h  | 1 +
 drivers/pinctrl/airoha/pinctrl-airoha.c | 9 ++++++---
 drivers/pinctrl/airoha/pinctrl-an7581.c | 1 +
 drivers/pinctrl/airoha/pinctrl-an7583.c | 1 +
 drivers/pinctrl/airoha/pinctrl-en7523.c | 1 +
 5 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/airoha/airoha-common.h b/drivers/pinctrl/airoha/airoha-common.h
index abd4d2fcd227..79ece49b0c48 100644
--- a/drivers/pinctrl/airoha/airoha-common.h
+++ b/drivers/pinctrl/airoha/airoha-common.h
@@ -189,6 +189,7 @@ struct airoha_pinctrl {
 };
 
 struct airoha_pinctrl_match_data {
+	const char *chip_scu_compatible;
 	const struct pinctrl_pin_desc *pins;
 	const unsigned int num_pins;
 	const struct pingroup *grps;
diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 6f7e65b7792b..2513fe210e03 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -651,9 +651,12 @@ int airoha_pinctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(pinctrl->regmap))
 		return PTR_ERR(pinctrl->regmap);
 
-	map = syscon_regmap_lookup_by_compatible("airoha,en7581-chip-scu");
-	if (IS_ERR(map))
-		return PTR_ERR(map);
+	map = syscon_regmap_lookup_by_phandle(pdev->dev.of_node, "airoha,chip-scu");
+	if (IS_ERR_OR_NULL(map)) {
+		map = syscon_regmap_lookup_by_compatible(data->chip_scu_compatible);
+		if (IS_ERR(map))
+			return PTR_ERR(map);
+	}
 
 	pinctrl->chip_scu = map;
 
diff --git a/drivers/pinctrl/airoha/pinctrl-an7581.c b/drivers/pinctrl/airoha/pinctrl-an7581.c
index d31de7ebbdf9..1b0a3c19f023 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7581.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7581.c
@@ -1420,6 +1420,7 @@ static const struct airoha_pinctrl_conf pinctrl_pcie_rst_od_conf[] = {
 };
 
 static const struct airoha_pinctrl_match_data pinctrl_match_data = {
+	.chip_scu_compatible = "airoha,en7581-chip-scu",
 	.pins = pinctrl_pins,
 	.num_pins = ARRAY_SIZE(pinctrl_pins),
 	.grps = pinctrl_groups,
diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index 6e1746ac0ce5..5acd76224699 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -1424,6 +1424,7 @@ static const struct airoha_pinctrl_conf pinctrl_pcie_rst_od_conf[] = {
 };
 
 static const struct airoha_pinctrl_match_data pinctrl_match_data = {
+	.chip_scu_compatible = "airoha,en7581-chip-scu",
 	.pins = pinctrl_pins,
 	.num_pins = ARRAY_SIZE(pinctrl_pins),
 	.grps = pinctrl_groups,
diff --git a/drivers/pinctrl/airoha/pinctrl-en7523.c b/drivers/pinctrl/airoha/pinctrl-en7523.c
index d23aa8f826d6..9ef93d87d444 100644
--- a/drivers/pinctrl/airoha/pinctrl-en7523.c
+++ b/drivers/pinctrl/airoha/pinctrl-en7523.c
@@ -1072,6 +1072,7 @@ static const struct airoha_pinctrl_conf pinctrl_drive_e4_conf[] = {
 };
 
 static const struct airoha_pinctrl_match_data pinctrl_match_data = {
+	.chip_scu_compatible = "airoha,en7523-chip-scu",
 	.pins = pinctrl_pins,
 	.num_pins = ARRAY_SIZE(pinctrl_pins),
 	.grps = pinctrl_groups,
-- 
2.53.0


