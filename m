Return-Path: <linux-gpio+bounces-39062-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J3mBHFwyQWrRmAkAu9opvQ
	(envelope-from <linux-gpio+bounces-39062-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 16:40:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EEE6D41EB
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 16:40:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=izn2X3t6;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39062-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39062-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 440F23037DD7
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 14:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E83F03AB299;
	Sun, 28 Jun 2026 14:38:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023110.outbound.protection.outlook.com [40.107.162.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF543A7D73;
	Sun, 28 Jun 2026 14:38:03 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782657484; cv=fail; b=L56ol1tWOlrSNyMd+vyyNJVq27A+VU9VErRWgupxN7hl3UwQEjI8XrQtLLXV8+LltnuJgfyaU2Xxb0b1hisad75JghvC1LaAzC4w/Bq5YGhL4eIC1wXPEiEOBVBQpKqMrCGAWBRUawM+qdr5e9OAr1TgrLiFjoQR50lLZBkn8fk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782657484; c=relaxed/simple;
	bh=ZMgt64e8eLNGSxkGjmEspduyMTYLcXJT1B7FGXpEmUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lc6bDwx30mvPnFla7xbmLwTXJkM8Rf5KXJBmTsuutyys2m84S0fVradYtu7zHROggqP1nh6HaLdKJhOPjFRsLB27ctirOXLItwInkzX7gpYEIjYCx2JE4nU2wsqAxMnwdx4pwqhhy3NR2qYlMK9x55k9J/E3qTkrVn91v/i8f1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=izn2X3t6; arc=fail smtp.client-ip=40.107.162.110
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vys7yaidRoPYOQNqeB8OXXY22luA6u4MQZWLoH7L0Yf2fPpywqhwILZzAzbuGGXLmlQ3eVcjzb81iXW+TlanytPDcaUuxsPBSqwgJ1pVMyeb6wRuqaUF3q9NFIx8q0COxxBrq2Q0Hm6SIlOKOzo5JnpzSHRlw52XZ7l/HB1T8/N3+rx1dEzsWaCb1LYlDFVAoZ+g91WO8SIqJ0kNJGEp+EyLWTABMTspGPIbv1dq79Qbvf5iCz9UtQcwJHIOlLxCgPt8bL5i8kCb2ilJBXhqfz07bAF5hBhDbooKHLNtUJZXRmb71UDOyxez3oox82gN53cm6q3eY73N8gEImUiBcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BAIiz2UGf986pS4/52BCnYDXJ8MLJt4wcpB3YtAAcG8=;
 b=JtcpC5cK7FlnUVM0VO9V8ae9CuTZHYDW/WIhd08xWkhH4HHOPNas1iCf09IcU1V2LKhSG+Mm1i8pDxHwQaFjE8Ci1p1WTlVtYa4l5H+lwslZX6bVbEYkopPOxhD64iWwZBftQgg7NFq1wlxOfS5RYNj+lhlkzp99brLapdXaF9lESgBBHpBWPNm7hGIJ3NdH38ESkplSAMRh3tNkaguUBhwsHITwJ0V7PMQool7WSq+E5HA0iNngwYtQMBCkHYYXChsv8Cqj0ZapnlvtyRdt6M/HWBFPAvWEEE53H43Qeeb++uyiKIheyDKaWriyz5QDRfLIiy7oPjvxb/7+bLCCYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BAIiz2UGf986pS4/52BCnYDXJ8MLJt4wcpB3YtAAcG8=;
 b=izn2X3t6TSNgEGOGXMJgWhpCGJTJMjXNIN0FOydljhZ7ILGC9uPOtiP3Pny/p+jmFKHOKt1ChO0eEsZCdEuSvsJzq9xYBqs97mbK+Z+as243egK3vFeVeWlNlhcVQoAObuExzeLP6kSNNJxrRxyvMK/hNOcWKy74bU+5pC0bw/x37BESH8siy2293OPfs+LVpwiR7r8rYCUNj92Q6jTT5EuRotgdIkQVIbgftqAk87ypnv+81XXkGfC79ZXBoGssf7LB4H7N/nvb/M+9Vf2WQes7RTf9P+dBeANgF+GXPxuRWqptsjByG7hJZ1gnCNal77cvbainhYyqwK3KPKgu6g==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS2PR08MB10009.eurprd08.prod.outlook.com (2603:10a6:20b:64b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Sun, 28 Jun
 2026 14:37:54 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0159.007; Sun, 28 Jun 2026
 14:37:54 +0000
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
Subject: [PATCH v6 06/17] pinctrl: airoha: an7583: fix muxing of non-gpio default pins
Date: Sun, 28 Jun 2026 17:37:22 +0300
Message-ID: <20260628143733.273651-7-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: d13fe1a2-1580-45e3-f918-08ded522d6ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|52116014|3023799007|11063799006|56012099006|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	pUL9qAOrAe+Z39FtW47qq3NQTZi1/8V3DkF6MiCdLF3YiqOWYAsGi+cqdqY4IKd5ohoimgcTbJr/5NCwTQQJ9PtQ8RIVyJ9N3PMK0FceyNq6nVWCBfeOQZothfd1f9OlmBWaryv3kvgSXVQ7mgrSS21tT/ojTv8A2hEKrd5qTg/IhfhcBDlbjuk61oa/hjguWDj2ob+6IHWQdDLuMYes3FcsET+kKOjdx/Cev5Cnn1OM6yABE7CN81VFBaiDYdusk0APENh+pKOJmZ138HRRCzhzpjoCtUw/llCB558Q2HrXITZfzSbKDykjcLjFgfdURSr0RS1VhpInzCba6ERiROZb5tNwE2HEw6awfRNLzeA6G3F25T1eoWrYkcImWaja8gC8JNonbtaMC1zkmGDkaPmheDqWrLfNIYKeftcdF8EifErzCdXDctDSgs+tz8CScS4ahvFOYQFDvDvS4pGPH1WLOVPPEuKPtIMPHnALVYyE+QoESNoELLwR0dQ6zgZLiC9V7SJo1xEywN3FFyBH60JmANXIK9otDmb51DuZteFv2JQOTyBAyvY1BfAxc6t0LLZjuXF05/qBDv0hDWm+NI5OGBbE84oBKcvi3etNy0QDOQHFjfYP/zjv/tTrlUYJqVx4pI/6GldjvPevP+aZ5FRvCiaO5RlkMJYg/dpN+uJn3HkPK9PB1Zp4i++b1xHmcL7YcQtbaaLa4xoTda/S8OP6sdP5LmYvXxY0LAm/bJ8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(52116014)(3023799007)(11063799006)(56012099006)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ngkq1ttX62QZhJKLpl9U/02lDCyKFEng5VXa9n6jQ5Jety4UNwsarlRU82AE?=
 =?us-ascii?Q?5Ycg9AdWdsOtughxkPTTZqRpBZv0Wsg2P4tjIbH6J4R1juI4N3DcDoJzpvcO?=
 =?us-ascii?Q?C3AJGATXqVAgamyAITOA8XLg7rX53F9B+ALXh0z1YmGDBE6QVkpemHGpJYh3?=
 =?us-ascii?Q?bPRa9TR8pgOVVT4mX/ijGWjZHp8e7RkqkjV/gZlauQTLe+YzmQxlAr36GM+y?=
 =?us-ascii?Q?hulO2/xroidoKUVQuJjYlTZbbqYmchxLFsevH73lPqTrW0CkAEDcq/xOWrZQ?=
 =?us-ascii?Q?r+x+L49aLAvxt2tAeZKTlXl9sZ4ABfbCjk4uvBAIKoirsh04T1LJi1vQ33+t?=
 =?us-ascii?Q?/VMkTCM7tQ2k/5setmYh+h3M0iNrmDeWR+3R32LRzCjB95jJIYWguWMECl7d?=
 =?us-ascii?Q?lkyWHIxlXVrbitwqX4C/ddNFT8fUAm/ouQjmpJSZwBb7GGdKY415WYDl5qxH?=
 =?us-ascii?Q?cL9KchgohlpO/XV4MfQa7S87Ybpr/Ed8DjIL2N4YOQeKzl1wpWBt9Z3MYs6x?=
 =?us-ascii?Q?l34DNi85naq3Rj46Hu0IF8VfT6mqW6IQDUzIxKhc+8U6rujote4hBzH0O8GT?=
 =?us-ascii?Q?duz79fjvKehfJkjqKDH6JBDuUiCMxMSH9FxrQgn0N1pKsfMA71xMh7BWSHEv?=
 =?us-ascii?Q?hHJjmKhKh1v2DujwYDIazAMFEVpuBGMHWSR0yphaPgHdQzBBoKXKKY7ZG5zc?=
 =?us-ascii?Q?cKaFRxbAg2ArQFoRb0//RPzXSSnjBMwC5eU8Mz5BwQ4/jylLgL8cv5FIUs/y?=
 =?us-ascii?Q?v0u4SYXU+0Ow5ihMBOecBjznvSYcUtVysSopxRqKV7TvKSPm5ygQoz4diiap?=
 =?us-ascii?Q?Uv9Df8XOeSSF5m0M+pDAIt1JfJa9Nl07tskngbkGXHwn2lf5M2qAwE2HhbO2?=
 =?us-ascii?Q?RL1nxK9O1rbTqz34kiHSB9o2FY1lRJSqalP21kOFkmI4Q0QDzKjv7kWuqcQq?=
 =?us-ascii?Q?IQEeuru24gFgyAFwOPHLXuq8zmaPNjzDCM60vuDAV21cNvY45qIYrLRVG0Bv?=
 =?us-ascii?Q?C0yLr/ytyPU11z3Rz0gYPHVDv8oUnKaPGAeirk3UyDC5V08IWFs3mfevBbD1?=
 =?us-ascii?Q?UdH+KHXWjffR1FDzFzsBNbe9uBZyoHxC6wmWp1/Ypnl1a4Y2WH4sRB1lnNev?=
 =?us-ascii?Q?SaAaPslqzyTJ1r0VlD4wEFaI9qBYKhYFztlLjopkcKtSzi7O+mDZLcwRFcx0?=
 =?us-ascii?Q?/clpKM/pTV1raPdjnuI1+N3c+mcOORJiXsN1fdpK9evFaS0rL3b9Jd/4h8vW?=
 =?us-ascii?Q?7/EUVUK81Jpfj3IM4C0N6aBdvH8ETJzUvm/zilxREYRBuCuBNr04r9Hxcd+Q?=
 =?us-ascii?Q?yPv5UqUz/UEBzHVwIfDguqsMXSd3I+WY7PVQSMfs/XsB2SB8DEb1WvQ1jeTK?=
 =?us-ascii?Q?Eo82v4WM/SQ+pJbvCSfZiKfNcrTfNElGHI/ZwQvOBFxLu7iJauANmZs/Uk5n?=
 =?us-ascii?Q?RX/V+ihcElEdCpXRh35+5KuJF/wmXmunvNm16hmmNcHyKJpQiqKbtI2+LLYO?=
 =?us-ascii?Q?tKdKTbQw4d6NoKyaK0OMdiMYXdUuICDqpocJxqkHv9PQ/qZEOL9X01MfjXaB?=
 =?us-ascii?Q?rH4e2IijPrU02OnDhIIMmJi1hpyTCLNhrY3dnV4S8tEjdT61JvbiJChDfS9R?=
 =?us-ascii?Q?hV21FmyjWfwiI8HN4DjTsKkZCKgvpay2/QVCec1+wPMHwslpfpC1IuFZwROj?=
 =?us-ascii?Q?DqTRXbpIzzRf771hdEkISCQYrirzVAKd5MHtrBxfPDg3IV9tRyCdHzIvRfbG?=
 =?us-ascii?Q?F2bH7JzsL2QN6QGAPXBjVq6pedvet3I=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: d13fe1a2-1580-45e3-f918-08ded522d6ac
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2026 14:37:54.2103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QDGKpdMNJpmXuicnHWhvi96wF5+KvY8Z2oyIbXn6sDNcKYxBGXMgskpoH9oh6zOOFAHqYfLt+9ILSnH4RMWXcrS0nYVcortu31yMOlv0Fvw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10009
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lorenzo@kernel.org,m:ansuelsmth@gmail.com,m:angelogioacchino.delregno@collabora.com,m:benjamin.larsson@genexis.eu,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:markus.gothe@genexis.eu,m:srherobrine20@gmail.com,m:mikhail.kshevetskiy@iopsys.eu,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,genexis.eu,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39062-lists,linux-gpio=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[iopsys.eu:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B8EEE6D41EB

Current an7583 pinmux implementation have following issues:
 * pins 51 and 52 can't be set as pcie_reset, current pcie_reset code
   will sets pins to gpio mode instead.
 * there is no proper way to set pins 41--54 to gpio mode.
 * pins 41--53 can't be actually set as pwm pins. These pins must be
   muxed to gpio mode as well.

This patch fixes above issues. Also device tree binding schema
was updated.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../pinctrl/airoha,an7583-pinctrl.yaml        | 14 ++-
 drivers/pinctrl/airoha/pinctrl-airoha.c       | 99 ++++++++++++++++---
 2 files changed, 98 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
index 8d8ec6adb97d..bedcb6374f1a 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
@@ -61,7 +61,7 @@ patternProperties:
             description:
               A string containing the name of the function to mux to the group.
             enum: [pon, tod_1pps, sipo, mdio, uart, jtag, pcm, spi,
-                   pcm_spi, emmc, pnand, pcie_reset, pwm, phy1_led0,
+                   pcm_spi, emmc, pnand, gpio, pcie_reset, pwm, phy1_led0,
                    phy2_led0, phy3_led0, phy4_led0, phy1_led1, phy2_led1,
                    phy3_led1, phy4_led1]
 
@@ -169,6 +169,16 @@ patternProperties:
               properties:
                 groups:
                   enum: [pnand]
+          - if:
+              properties:
+                function:
+                  const: gpio
+            then:
+              properties:
+                groups:
+                  enum: [gpio39, gpio40, gpio41, gpio42, gpio43, gpio44,
+                         gpio45, gpio46, gpio47, gpio48, gpio49, gpio50,
+                         gpio51, gpio52]
           - if:
               properties:
                 function:
@@ -191,7 +201,7 @@ patternProperties:
                          gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
                          gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
                          gpio42, gpio43, gpio44, gpio45, gpio46, gpio47,
-                         gpio48]
+                         gpio48, gpio49, gpio50, gpio51]
           - if:
               properties:
                 function:
diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 4bbda392625a..4dae8c654f99 100644
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
@@ -782,6 +794,10 @@ static const int an7583_gpio45_pins[] = { 47 };
 static const int an7583_gpio46_pins[] = { 48 };
 static const int an7583_gpio47_pins[] = { 49 };
 static const int an7583_gpio48_pins[] = { 50 };
+static const int an7583_gpio49_pins[] = { 51 };
+static const int an7583_gpio50_pins[] = { 52 };
+static const int an7583_gpio51_pins[] = { 53 };
+static const int an7583_gpio52_pins[] = { 54 };
 static const int an7583_pcie_reset0_pins[] = { 51 };
 static const int an7583_pcie_reset1_pins[] = { 52 };
 
@@ -862,6 +878,10 @@ static const struct pingroup an7583_pinctrl_groups[] = {
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
@@ -891,6 +911,11 @@ static const char *const pnand_groups[] = { "pnand" };
 static const char *const gpio_groups[] = { "gpio47", "gpio48", "gpio49" };
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
@@ -937,7 +962,8 @@ static const char *const an7583_pwm_groups[] = { "gpio0", "gpio1",
 						 "gpio42", "gpio43",
 						 "gpio44", "gpio45",
 						 "gpio46", "gpio47",
-						 "gpio48" };
+						 "gpio48", "gpio49",
+						 "gpio50", "gpio51" };
 static const char *const phy1_led0_groups[] = { "gpio33", "gpio34",
 						"gpio35", "gpio42" };
 static const char *const phy2_led0_groups[] = { "gpio33", "gpio34",
@@ -1483,6 +1509,36 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
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
@@ -1490,7 +1546,7 @@ static const struct airoha_pinctrl_func_group an7583_pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET0_MASK,
-			GPIO_PCIE_RESET0_MASK
+			0
 		},
 		.regmap_size = 1,
 	}, {
@@ -1499,7 +1555,7 @@ static const struct airoha_pinctrl_func_group an7583_pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET1_MASK,
-			GPIO_PCIE_RESET1_MASK
+			0
 		},
 		.regmap_size = 1,
 	},
@@ -1636,16 +1692,32 @@ static const struct airoha_pinctrl_func_group an7583_pwm_func_group[] = {
 	AIROHA_PINCTRL_PWM_EXT("gpio36", GPIO36_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio37", GPIO37_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio38", GPIO38_FLASH_MODE_CFG),
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
@@ -1899,6 +1971,7 @@ static const struct airoha_pinctrl_func an7583_pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("pcm_spi", an7583_pcm_spi),
 	PINCTRL_FUNC_DESC("emmc", emmc),
 	PINCTRL_FUNC_DESC("pnand", pnand),
+	PINCTRL_FUNC_DESC("gpio", an7583_gpio),
 	PINCTRL_FUNC_DESC("pcie_reset", an7583_pcie_reset),
 	PINCTRL_FUNC_DESC("pwm", an7583_pwm),
 	PINCTRL_FUNC_DESC("phy1_led0", an7583_phy1_led0),
-- 
2.53.0


