Return-Path: <linux-gpio+bounces-38545-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4vYjN0fpMGqKYgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38545-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 08:12:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCC868C645
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 08:12:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=woP+l43h;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38545-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38545-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F40233043C06
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 06:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 092823DA7D4;
	Tue, 16 Jun 2026 06:10:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020111.outbound.protection.outlook.com [52.101.84.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421323DD532;
	Tue, 16 Jun 2026 06:10:51 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781590252; cv=fail; b=m2KjonfDkECihFWpXNkGrCkDyPdEKr76H8XL647UD4SPhxbC97AH1ZqD3w6lt8WjUJrflflqU2SDAK5UPWSbR0SC+CvDW1g80VhzokRy1cfswrOInSV85Zp+nM+Xa39oxSNZ9z4tTFX0vRiIzjDnYOmpm2J+VQTC+PQiXGVZPJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781590252; c=relaxed/simple;
	bh=ayaveoMKbTAtoUjdas+265sqgw2enZ7tyNfPij1QJKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=shxSHGCLUG+BuSjNjKDfKD2He3D2QucXsTLB9VRjew/0SmATRF59KW3mXlCT/Xae4dKqSkeOX9Eo4JkuZdSJkKikStrXsm8eGKiCthuw/TKvuKO+GTB27C+XeOYTBSr6C/CQXdmuP7spJjH8vjGAfFd8JqVK4OFpkWDVrQn1P4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=woP+l43h; arc=fail smtp.client-ip=52.101.84.111
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rtjJ1WyiD4/6V2CTp4F3OPnGjSkUNUN1H3YNm+8RhhHKl9mQNi9854ORzFfHL67AXbFEK0nMmGXNP8yDLFxqUUIGvxEzpUlcD+FOaIbDETd5vH30LCsIT5Gp/NklV8A1k8cC4xfjiqy+slLROlndoGAumJLcbj8amIptMBgNn/3pMXgmrMpIlZqf6v2b0HedjuG4L/Kx54lT3HDl61mamVQJWBOUiPcZFwa3zYJZcXaX/2Fzk0hfEr1ujx85R3APy2A1HO/iXtX+K2Wjwo6Oj5E+Ugo1tV8KzqPloypLHhUsQFsZ13179pINSoBoZ8A5jg/1O6N9IxZ7yitaIBYhDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OvYivB+HAafyjsFetj/ARtikoXM8uhB5KaU55S+giwg=;
 b=Phq4ItNeXRy49WZ2UxYnuZq88KrgncKE0MSJYzVFOpiaZyuHVPn5caRGioKDuCxCdN99V76zt5oKrI76Q+p8qHBhEKGqJ/KtlLFdZSw8Cx9KaAozsvkgyTpkv605QUcZU2Yr9bo3UuueyXhWZBeoMxgtSIcjPZtV3fXdpHW0hcNuaw2RSmT2lXNkYYHvMPEWJh5pvgU71o29HXJYuvDvd/zsM49F6e4f8FXzCVYznPwXE1AUyK8Mfx4mbkzwOHZyvX3R6NmzKnuxYJ7e7ahMc0ebyC1m22EOgh8HV3JAn4eBnajMTiG+Cz0O2F9CZs2p8N6oWjhnGPKPd+VdeVutjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvYivB+HAafyjsFetj/ARtikoXM8uhB5KaU55S+giwg=;
 b=woP+l43htgGQVFhFpdhOhs16jWShSy9oI67irjomLw/HCIP3Bhnp/Bl3n66qI+SzXf0U2RHe2uOShE0/Umgkl3tUqTiqMktVA/qgVx/Pwq9eiVxuxH27FOCdT8FF4U5QfpCxZYw7g4CqYR4f3VQ7B077rhpJHAj2I8zjOtZtUg9pgWNQAgHScOw6qOGck9njBv5dmAEh2580BEKwT1VzDQWgLev/HxlnXT4JRKgvfwx1DCA6+97lnsKUGU1u/wenH9EDicw4OKpdbthl4oUcPtg/cKJggHPzLnOCMdiamMFG6md7VB5ldqfhjIfwWshy7OBJwj4vTZRQyWjr5J5kWg==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA4PR08MB6206.eurprd08.prod.outlook.com (2603:10a6:102:ea::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 06:10:46 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Tue, 16 Jun 2026
 06:10:45 +0000
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
Subject: [PATCH v3 05/13] pinctrl: airoha: an7583: fix muxing of non-gpio default pins
Date: Tue, 16 Jun 2026 09:10:21 +0300
Message-ID: <20260616061029.2630777-6-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: d53579ed-6d48-4266-73b1-08decb6e0103
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|921020|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	5MIfU/eV6z5tcUUxGtL9eN7QqPx2JxOBdr0VAaPuG8pzDJm0gDoqiStvW36hWrWu3Zx+mvFGa/crenuCbBdImrZ1lTu/3iCLnD04wWKQ10xF1WmCS+TlCR1/ftxHLaKOvOF1vSOvmN/y7uerhqtO+c4QOvLRtXchmipal41kFJ4WBEJiVbWFtWrNE7VqtC2kDXJL7MG1xSRIyZ/XwCcjVq63qu386rm8E4dMfJ5AZeC24OoeeR4DAKkluDBW4YZ+4HIK/8MJQrYBqtvX9FEXAVinCRQ6zVXjaxzyKjU6NCPz+gMcxeQIbERU+waUcHV1PR1pmw4XuIwdV+smOQjTcUAWP+bVIfmtpKrcC4AUGzkBknXhcodgftbJ2KroQMmmeUQJjyznzrORPzUWtiSu2/Yiz91ydeGs7yT/nL/ES6YSINF6byh0+RAkNih/6CCjgF5idfchZslMCa6qqtFxIl9ClPbvASr5Ze7uhGwbQcJfCEwDbYmG+9S0ktYg7gckh8YfQ6jdZ9k9sdspLmWiLDAoCnBXmzixHDY2y+0sjaZiwAtURJ+PuDmtLfiBXWM0rPx+kQeE1y8Fg13DcL1kX0RLOzpf+B2/7nsVMuPGeMEjDHLBcbclTzyEJjhEoiIK1qsI62crFdXm8u+ibETm44V6+ujUH9BqEBQ577KWZsLDnx6QuRLGLszSpp2nQyFalJJRDh5+hataTkwXkvuwgCOH4sHVJRR0ulge0h5Ig2GtQaO4YZ9YO5JgXceo0ywuQspkK7Ohbm5mlQIVS7mxzA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(921020)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LMZlSvx31GTCDdqimNzFV88zgzlBy5ZfeXanSRrsiNYZeHrCkkSvwHRxZxAv?=
 =?us-ascii?Q?vK7yB07sm6xTuGghqOb4q+rUWAZ5ooqkz4s2tj4/dNvVHO8YiF2JAwkmEy4Z?=
 =?us-ascii?Q?czrPeMDCzexv5JJuWh6q5Jq7AWO6b+gqLT2EXS8rVFDfM/+FKrVh70p3rfdD?=
 =?us-ascii?Q?G4+TiClx2XNQtrq+Quv2qNWI1DFgNQ3OFgPm1gcWbQvdF92e6N94mCG/vmmn?=
 =?us-ascii?Q?uitgH7NirYbcYpJsQxF22i7rjS8OrAldJhCngS5vLwpltr+993bANu+u8vft?=
 =?us-ascii?Q?KpyrpY1nEScLaWqogkxJRtsIhE4AptISADN1ATrPU6UuRkVD6C6/q2Ej9ci9?=
 =?us-ascii?Q?KXHpn/Ui/hwfoyvZFqAcrb3qsA/QmPxJGovV4mh6CZJicDwgd1pMTSWKU6aI?=
 =?us-ascii?Q?ZbCK3kfZpYBDowf9Ij3XwpXOhnFp/a8TiH4UUkU43zYanRAq0n17/esRNB0L?=
 =?us-ascii?Q?1DrczjidbEDjy51DN/XOZOnmpxymoD/UM68t4fX0lg8jlkYI40kt7OUq+OtI?=
 =?us-ascii?Q?L0tFBSKNq8IJryMXv4exYxh8Tp0BkJrFQCeCaiHccWfm2aaDNAVD0aLvxV7R?=
 =?us-ascii?Q?MS/uZTNHKoQKDnRVXiOeilSCDvVNxvd2CK74l/LufqWd2zR5medaCmR6YRnK?=
 =?us-ascii?Q?P+cjUNRVk0QDWPNJF3oBNN11fogl8/wNcQ8qkH0QwuwwKunEosJAuuijlgbF?=
 =?us-ascii?Q?cmEpz7Wesy/taeJ4Iq0zmmzvjPQ5JAsfEUA8IXGs4OAIRjcmGz8cGR8USwRD?=
 =?us-ascii?Q?cBKuyHktTWS8ME5ZM8bLOE64rcpbiYyWhkpNXbDCCO/CzQvgkD+apb+6ZKzX?=
 =?us-ascii?Q?aI18jrB12r9+v8UqxbrNlQy5K8cCbf/Onq2PcgRQPY/m6IGtiI+JeeGeRHXV?=
 =?us-ascii?Q?B3qLqTRwSfzMd+eZZK5cmbTqHjwcTMRA1cRRtp+mgh6/VaYiJivvHF74t0CY?=
 =?us-ascii?Q?AZumdlg3sP3EFZg0W3QmYW5mAcF9BltCMLztAvyVclCk9HQS/0z0GVJPeHrz?=
 =?us-ascii?Q?/yKvt0BqiWmAtF+Eu14duack2AOiVMVV0JqDE9cFRvuDWKe0UlCZui+57A6S?=
 =?us-ascii?Q?RTS7WFr2x7w0n1LmxEcJ7q2gISk+63xq+TkRgjKi9PLzJbvEGV3jMENGZY8E?=
 =?us-ascii?Q?C6Fv4R0N/kLuzSFj+SClskA0n+vwwa3TNHlqi6L18SMMteQBbMAPOo062oAv?=
 =?us-ascii?Q?OIl9nUoVajp5Hvfs7N5UXg+nVRcaW74bXVfZMv+oxMHlDY/9IcWyYuLtWtgT?=
 =?us-ascii?Q?22u17Nor3rMWIjvYeqrmfJEOoJdXghVAevX6FVi8qYzr+nRLjWjrUguEYbem?=
 =?us-ascii?Q?Drrtdb/uret288ytRB0zUv0ds3OezGbEsrRgbcR1keJRxjEQLtNCw2hreHAw?=
 =?us-ascii?Q?I3LRP/xa0pRBUTIuXEeNwGos3JEyTfN1ooExNm8F0AlE2Ut9D8PvOluPRt/S?=
 =?us-ascii?Q?WWg4twr4rLxXR9CH7FXnvIMvEjif5g7zl8x+Xl5fgG27CLlX1P/LOpD30SRH?=
 =?us-ascii?Q?8Ew4R1AHyLTTbVbI2sCCz85yAqdRqZX4g9Bfti/2tT/ixjl1Y35qL3N9sicy?=
 =?us-ascii?Q?/goN+XucPEfJclWZ2orpc4KCznRabwZfFVN5zFTl9Ucu5FUrFodZy3xIkHur?=
 =?us-ascii?Q?BZR+gKdn+JdMitMqKsZ/ZmgodwT1KbIB5V1ALpdLYoDsYFuCbfeOWvwL6VR4?=
 =?us-ascii?Q?TbEzB1iXekjIIxbSna2NUVxTJyiEG/M4cAfjapxZpDt9YC/LMSPERg6jPWPY?=
 =?us-ascii?Q?jkNR9wDHl537/HA7Z1vvOFVrh0tUlNg=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: d53579ed-6d48-4266-73b1-08decb6e0103
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 06:10:45.8332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XfyZYwXxhUg3lpNbBvfJtD45JtuuH/bNBHvVlmHvApvcnW4vHOhjL+wCPWcQUBUmSQZ0Pb4dwra+QLQ+zr8diBuPaVc2/MxNFC1gn0+oxIQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6206
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38545-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,iopsys.eu:dkim,iopsys.eu:email,iopsys.eu:mid,iopsys.eu:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4FCC868C645

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


