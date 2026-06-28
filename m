Return-Path: <linux-gpio+bounces-39067-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5jHoAvgyQWoCmQkAu9opvQ
	(envelope-from <linux-gpio+bounces-39067-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 16:43:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5660F6D4239
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 16:43:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=syeg2KON;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39067-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39067-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 914F13051CAD
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 14:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CC863AE6FC;
	Sun, 28 Jun 2026 14:38:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023110.outbound.protection.outlook.com [40.107.162.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D203AE718;
	Sun, 28 Jun 2026 14:38:17 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782657499; cv=fail; b=SndjA0RX+9mLCkJXZ9O75Pf0/L0gLdkiUp3EenOA9FZYYRYM1xwWrDKDZj3c7F3tDhcNOwsHHp3F71XdaDGyb6Wyp2lVCQcuBzl1gR5S/U8U8S1swW5Toqa5/hIH0bAezGJlhpoPek2Ro1IIDAiNDaIb4V+ZwxovCZzJXERWaOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782657499; c=relaxed/simple;
	bh=7uuOOQa4UY0f9PZ+Y4hz6MGLbxS9DoIyOfknNpDl79M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gVs3cnMNOUSaf496fSurVA2go5lBZf60RXZGBdgOC6f2UxNTtTtiTc5dSy79ozhjVicaTPrLHpLuvTjknZYF9sj8+2VA8zPnc/MGNzyzSg6DudfgUA296e3R25yBi5SA7onHBVPEjPnxyqhQo6i+F4VDqjaH5WcjbLpR+/sVBm0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=syeg2KON; arc=fail smtp.client-ip=40.107.162.110
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AHj+Ygw5qTYV0Z1rJzUdpwxjXalZQynjYtk+RQE75+DrZQvz5apnafqg9SJzAFaQY6M2a7BFch8eZq2edJ1Z63VFtxlpqn2/Xt2XhnWQ2FnLrjwb6KqXsbmgtB2Nh2nm6vXZ82hYrl9xSqBzoBXQo9Nt1bjzX1SzmVzjal60ZDlho9Z3W+zJ9n/gwYJv91eirc2upNVlwAlrXYRLb6JZVh9dyRysoBEu/46nHjm51nr5+rwxYKocNmyIRR8wrDJb6knGLX4h1VW1JG4VspIvTSLvAyAild1JPGGPLfkMCS0C0Kz/9fRiw718KPx8fgvCSgZBE2+64y8nIfYo1xpdKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CyH7rzvojjngtO4sdKlnMToPIzic1ihKog4W3fIQsJw=;
 b=mll8R6r+FaMxFfTgImW3qsYT0SB2OqT/qwrxeuV3acLbBhCHiIYcjZiFvHn+5nx3LrZhSGIf0WIknPii/Cg0fnligPriAmWazUaJ4mjzM8O0hIesTWXj1EvceAMFJcts/MJucfHU9FXirOm2LT4xWK6B2dFEXtcFdt4mjTmXEfBTdXP37Df7ZI4x9gHMPAhuYzPRflDZ+gDoM4mrcMH4dBujGGpSbyYKMqorHHzSIft7e+jlCCfn8suLyNU8GtoTS1ZM362q904yRvxgDeAaoD+qeyW9TXa5Wng5lBaQPeQnIcM5XtFinsoUpWzrEQHYSzvoisVuDoMR6+nI0Xfq1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CyH7rzvojjngtO4sdKlnMToPIzic1ihKog4W3fIQsJw=;
 b=syeg2KONi46jKshJ5kWZ0otI8Z/fJrAlCOW/ehKLnwjLA8l11tZFL7k635U+73rzxX2BaXubcY6zQpp2RPu5iPDblcn9X5HET1TptNl6HYkGEE3EgrAa2XsypOkukUikVcnRb4ngj/B0ErCavlxAZya4vwHGABZ6gxznYEVcoZ34jJvRTrgEHfoSWkwlx9LoIYYZIF55dooOz7MH+AhoIH8QpJWn9XKTcidgTC/ZgfN+6Cy4zHwo5ZWcYHVTegkcoWolRhR4Q3ff9jM8IK5rYpVavgJIC3rGS5Q1yDKNq7FZaZh0ftmyRCLLfboiVyb78ToMvW1gOFjuuXUff052BQ==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS2PR08MB10009.eurprd08.prod.outlook.com (2603:10a6:20b:64b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Sun, 28 Jun
 2026 14:38:00 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0159.007; Sun, 28 Jun 2026
 14:38:00 +0000
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
Subject: [PATCH v6 11/17] pinctrl: airoha: an7583: rename registers to match its an7583 names
Date: Sun, 28 Jun 2026 17:37:27 +0300
Message-ID: <20260628143733.273651-12-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 3eb82c6d-36b5-406f-78a8-08ded522da6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|52116014|11063799006|56012099006|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	Y0KC8o1vOpGpReeze1n5JNnhmKXHOGXWe036BBbHs3VHtd3V8BKpPkuWfzaUw3jbvO8SdxQ1P5fxECq+YAbKDygo7jBs7mJrlpbLLkjK1v8hc+jFpw2biv2PYehzwLsI7P0WlkkY1uEncMZPX+f28Q/T7o4zzis3DBwsuuGjYN+m/mzkBliKfmaWYE4N3Fh1FIIpR8XXOMa1SWjBzgi7SafUiTWT5KR85IUDQXPWi4RR4d6fA/Q/QWpWRHOGfk/C3Q2BVoU1EBT9vSDiLi8WIkOIdc9sKxMVI03rZAIYNP5iPxXUxHzxhbs9HEpqU+ULTzsmeMCGUD6S6ugtTBKcMqv4QDUqIPwgdhjvYj51TU1WWQlbGpljW27ZqkBN0sF64x7BZiJT2B6jr52DkbiKnl2XXuZ2Eb/v3B7dkGnDKCLN1ZHkstxrCFBMeEMcPYtfq6BRfmKj5ZYfzNbMUKcLLbrrvvG+MVDFbtxycd4gRGIJAC52Iaq9Dv74UyCGV2FOEG4A7BsrLN78WOfV6T5SlJQGuRPH7zgdJeRUpSq9ifhWwkaeRkZgPeSa7HmIFXb0WIqfCN0qjV/8pOToaE3R8EYsVL0Cdue20FXUIzuxdNjKOo9G5VuXmDUvirMFDeFK0wVxvVCoeK+hCi/TTldNs7mfU1JhvmJvKTSg02sbmiZua1x/uGJFOoTNXm6WnBfj6t9RgdXCglznvW2Pt+WBmuGX23LGjpYruLfi8J6hMO4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(52116014)(11063799006)(56012099006)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Zqt9Hf8mqzC26LA8g7Evvyp9Aqyw/QmOHewMBEnqOS6P06EPEysDeG9+wqkU?=
 =?us-ascii?Q?TScJm41E5dT15AANoXm3Ea5CavpeRvIJavGeg9R21WRU8N/4EH3KIb4JnCxW?=
 =?us-ascii?Q?KWOA6yzbLZ9ErWELYFZ7/KynpiqtBUMCgG4PXSoVyPm99szWVlRV1YfXSNce?=
 =?us-ascii?Q?SGlmz5N/FaWRXwphR2jneyMdn4Mqg/u76Rs/xY24J+XcqoIKRmRj2PZT1/mm?=
 =?us-ascii?Q?FAQmJWRP4E1epYYc1/iQ2x+GfG/Og2NlnDOcVOs+F3MioilgNeFbCx5FuDMT?=
 =?us-ascii?Q?V/kq+w450pIlktVFy4DRLU22jPez0JUj+G++K+OvgYLC15D4XAQYM25/Nume?=
 =?us-ascii?Q?Z0tFAyaX0oKWxUAOdw0NAbJBW3Mz1IOHvWwcjBhiaXS7cchRLIgi9Siet/WI?=
 =?us-ascii?Q?x6q+Ss3gCzKP75UJBW0QqIvRTu6MVqld3lD6oJOUbqK2UL5Jfh6rprs12fTl?=
 =?us-ascii?Q?38ZTFUSXNc7d1diRXeWv/tsbsPiWn9ZBnr7cB0eetw2KIVkwKWnNm6LpoZsD?=
 =?us-ascii?Q?dRJJ7gmlr8GtwGWNRbjpi1bEcN1PU/De6QwNSZgOtZksfpfdoMbiOy+yOJdN?=
 =?us-ascii?Q?mLvv1FHM51ZHBx8rlQ34+6USqloDnDU5phTzo8hQCvKyBb1D7UcJvRf/cpEb?=
 =?us-ascii?Q?hz54LJL1wmRkLhdBeXXzUzf5n6xO3jVejyU69lbnhz0X2E+nGY0f79WuoB28?=
 =?us-ascii?Q?8tq+amiJAHoOWXD3J38lnqInvNefVR/G3PNXGosikz2t6czXSOLoi6Kb6iuL?=
 =?us-ascii?Q?HLPLs+5GgYn+x455JYy4kIoD5uCNzK3Wcaf+wPaxLnWRFTGQyjxhUw4dZt98?=
 =?us-ascii?Q?KPvk0ZLe9XBkJFyiZgArC2IV+TgLhGdlo8OxqXuiFvIes4cbL35YaYGpMjHW?=
 =?us-ascii?Q?QlOOieN0r0COa2TGZ3q9ShSGIotXfKCj1fQ9kqVoQJlLohA8Qgk6HU5NmFvf?=
 =?us-ascii?Q?FzpLUwtgBcQBO5XlMsuGrLrC88q+eOxSikurEGgT53dlPlrkWedqjizHgiJ2?=
 =?us-ascii?Q?LJyRRJVs+3oV1wNhv+nuvb6vk6lKkXhRxbdAza4ysShn340ALEhCUUoG/HSI?=
 =?us-ascii?Q?un0UrA1ga3BBrOhW6r+SFe0KmF+IZkd+QneaYs193nPygpCD+uAwwDos1wOX?=
 =?us-ascii?Q?tJEnTo4Y/e++gqdZGLZsxFth/Ovx9s7fHmtFEyG93FEjIUUPJlbRRnf4Lnli?=
 =?us-ascii?Q?kBIHeULLEuuqw5DG5zBdQDFvZsdbSB8RQ5MvXf95EEpwyCp6CYFR9pQNFHS4?=
 =?us-ascii?Q?VXzUNhFN+B0aV9DXYO3AKFbYWv1wLGyCvzQgLIDAIlQ8Etp66xJJMUl8hC92?=
 =?us-ascii?Q?yo9+cfhrx9l6R1cRsFTiR/T5GxKaxaeJI6VcwArWr9o04HIJa4FSPOfAYJ3I?=
 =?us-ascii?Q?rWZP3YfYzT3Q3J7XQyxFOiDtNUAKr5YKPM7MH5ZctokwbB6ccHN1OpMnsVzi?=
 =?us-ascii?Q?WXZrXj9WXgJY+g+4SEtOiUz38mmpcvwWk/jpTkqPRwJ0fG8Kdlb2kgzCGvm+?=
 =?us-ascii?Q?W70wVE/g90fivg+Hq0s1z3ch+pfe+vF1XD7PgtMDasxIAr1qAN7OtFqPeJBe?=
 =?us-ascii?Q?qovcVm08oA0YT8NHEUA/5PESeK8vIxsUAHb7mW4+/iBOeerPTFye0bJQt8n/?=
 =?us-ascii?Q?dLnMusTTIPl82+B44XX6NbRC3V7y7r2eiFvHd7GeMKjeEio1yXr7GapYwUmN?=
 =?us-ascii?Q?ID+eDFizNKKn7SCQ5muWksw8+z8WIQWZ2yt+GOhMtLkrGc8n4d9WR6MvrUDA?=
 =?us-ascii?Q?YsXYoB6oR68QiSYQkR5y6jTWlqqN+eI=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eb82c6d-36b5-406f-78a8-08ded522da6a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2026 14:38:00.4194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w2EUzswH5kghcFYWCreY1TJ70srDuSo7LlvOx6VaeJmVTErimXaV1DSarBMPCD//N64igLugqJzhT2xHV0VL+waGKbvfWLXYJ23QDI0P/3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10009
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39067-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,iopsys.eu:dkim,iopsys.eu:email,iopsys.eu:mid,iopsys.eu:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5660F6D4239

In the an7581 case the register at 0x1FA20214 is called RG_GPIO_2ND_I2C_MODE.
The same register in the an7583 case is called RG_SW_TOD_1PPS_MODE.

Let's rename this register to avoid potential confuse.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-an7583.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index 637b9377ff8f..b0b1dbbb4d76 100644
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


