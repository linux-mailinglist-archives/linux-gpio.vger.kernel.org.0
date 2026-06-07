Return-Path: <linux-gpio+bounces-38043-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ypMxMw+5JGrd+gEAu9opvQ
	(envelope-from <linux-gpio+bounces-38043-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 07 Jun 2026 02:19:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1D864E928
	for <lists+linux-gpio@lfdr.de>; Sun, 07 Jun 2026 02:19:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=ycbCH9xW;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38043-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38043-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 852E73014779
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Jun 2026 00:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 161022C0303;
	Sun,  7 Jun 2026 00:17:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021083.outbound.protection.outlook.com [52.101.70.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900EF2874E6;
	Sun,  7 Jun 2026 00:17:24 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780791445; cv=fail; b=NtdEx2seAdClT+Lc12UoRvO4Mfe1uFm971cabaRuRuIIx8+I0pG0RmCM/UwrYoN83LQVr8/VCzpz/FzDhahZHUFDuDfnN2zVVbN96p3Bfo0c2dsZgcm/j1OEAYE75FqLOtZX1MYeLgJMKGKBW4+8YWrAq4cDf+udKzN+01e3q30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780791445; c=relaxed/simple;
	bh=MNjMOzD8E5VqacGxtvcqyxQ6LzfEZuekqzF1NHrSXaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DBVsj69cInGUEkfgnmR6ow0eADUe3ZQy6vK9BPg9BJh2Q1dpgIO+SR0ItsdyF1hayrmozFcfFUTCo9/HbBP37igOtjL0+jiP/tu4z+2i3rfOWKynCSVpuawFcKAcnzzYf/DgrCqFrLaP2nv8rW5fqHkARnrHhV4Ps+e+AT9z10A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=ycbCH9xW; arc=fail smtp.client-ip=52.101.70.83
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lOup/LjUz6g9eLqgpUKjtLiQJ6bDQpP6Z//McBdfWl408dGoOfzh459SvnGQaYg7iT7AZGE+tsyVBQe6UOwKIg6XzWp3f1Du0CXRHzRbLcT6s0eKYvbcuSIqoBgzKoLEsKy0lbaMxy0ZqUCK+m+AtGoB5EaP/dEQlEO4ZR1T/FvxFwOYszSS8EZDm3lPcPtjcrAWwLHUL905VKz6jvatGYcV4ZMWP7zvaCyQ1K4dXPcr7OKmFblb/tSOZ/XrvwIg0cTQ2uGRNZJ5pSosCA4EiT7+9B4B0apNMAnoszoDzFvbiYl1XapRjx6xB21KOGaUBMlnxFpAEv/yyN9/aghUCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rwx3SsW5XXXJS3P+97HKeelH/SS4xsMtaWYYAJYZswc=;
 b=qyOdPp0Uf2kN9hEr4TpyhtcwLGp5K4O2B3ie3TI0eO6H0q3CYzDoRXna2e4Gsh9ZhYzAACjlc7VcyaB4mE4jYohZOy/RJZhRd4QtfnnNJWaBBKO179Uo7ETNJr4L3zdZ2PYDMnkxvxr3jJC0Eo3YUK63tjTRIC4Rlt3jLdSoOtQespLobwe44veAvSqqKBcgON5ICr2KjcYNri3G+nZ2AZDwL5GYZ8vp6bf/yEpBvHJT9m+ZjtP6ScfSG+sWvfwawN0h5Ir0MtBSkViAx7jS4L5Wsj4WenlzdIOC3SsgwpjuRYMc8ewdtOg49l3d6Njvew1Bk+Jy+XboZe5sgBpCjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwx3SsW5XXXJS3P+97HKeelH/SS4xsMtaWYYAJYZswc=;
 b=ycbCH9xWMdezXmPiMzeSkX5h4ttE0bd9dhU8E+cuecqW1cqfa8AxRZx15gsVPsfdK7Hjq44zo9xZV1ymPFGtN7znnE7vV42rWOYmAoLt6bbNGx/mIblrBHhT5QkMdrpga3bdXsRusaV7gLWBWpafS9g6GMDUlaRbKLRJjcrAtgwXvgslEFkOSCSU/kBziDs8w8KwITvWloBzBlB4J1SfXgo5nOKjL0XRymw5YDsNBNqi99fS2V+A7XvvePPlnKXiT1n8eDgBQJQmPZUP/3moNjNrLIotnogpRXT0m0+WLlj1G0odRttETCarzmtT1LVCkP6QEnhiXXBpedausOftJg==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by MRWPR08MB11707.eurprd08.prod.outlook.com (2603:10a6:501:9b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Sun, 7 Jun 2026
 00:17:17 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0092.007; Sun, 7 Jun 2026
 00:17:17 +0000
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
Subject: [PATCH 10/18] pinctrl: airoha: an7583: fix phy1_led1 pin function
Date: Sun,  7 Jun 2026 03:16:46 +0300
Message-ID: <20260607001654.1439480-11-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 5c491798-a9fc-4ad2-d123-08dec42a21e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|22082099003|18002099003|38350700014|921020|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	74ctCzighXRyYxJFiX466AbZIQodfp1j8F8ywBBl1o62wf/7yGB14JQHqbKgAtcBhntlSyjdU+a3MUusOL/XXNhq8BaUGgYXhgEP3vPwIOE5CS54bp6BehBJwobDJnySlArewCg18+/MruvNIIh8+pCwcbJzpSsGRvBMFYPtvdTu7KjCqoKJbp5Tc4F5hwPd1QzsDGuYnhFmO+mL5Jm31POL0G6kYig2ZSiI6ETgDGI7vdOEmKn3YOBh0xXLzd0N5TNgE/VenFMxHzIzLG2m2IqfjER7E1JPOsFSq2JOfH3yuXqkpARAguwQIziiO4Hw/j1DiJEPPXLquNn0hual7CtcZi9rk1dBaPI5DjBGgjuDquoQoDN8yjcXmvw+PXcpx2ANKwUgTB7VT7SuGhs6WiMmMJyhJCHpvFrcqUZ7TW8kLyN1Rx6QUPb02FDrTdlXRR+SKVuQSib2kfnU8TkaXK81q7EwOMmSJ4Mw7Ril+7GqCZCHFsnKiG42ellBEC6WGs6xcCkbzTl2vhAuc3uLxqelcqILxITe6/y1rAECoskjL0tuq3/ejQIW8Cs9FjuSCRhb2LGFcTIpwGP3l2y6+q/b9u4Z4ZAzEq2WdkfwCe0rJiWYS/hdXi+QKy294hxrOgO83hyPKMHX7bNuGghWNh2FqaCxCGdj1IedlQH7Sw8YHEeWcPuq5hgXzpLLdxnPL/jX1BxiHSA4Tf8M76z6spE+M4TnEE1qC2CXgPXKmwta76OmwiYi+V8rkd63a73Y2aj5OYyTpsRG2jFi28MsDg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(22082099003)(18002099003)(38350700014)(921020)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l71Vk7VLfrl77l03CFP1nJ1gPTimV2+Z6NutNyoAlmkRnOJcc/ulUf3CpbN5?=
 =?us-ascii?Q?UzSdCJ0lqoT5mtZEeHnBpbL5YtulVO5nu6uQQ6peHuvulE01piEsfWXxya60?=
 =?us-ascii?Q?npRJ2ieYLZSTt57E7A7W7fn6pVXjvewGVnn4VB4mPtasDyNQpWzNhyK50cpQ?=
 =?us-ascii?Q?j1ncyQdi+K+BBR4kN01vfB6L98XiiOsZDr4gSWMhfW2AkF27MvdAA2e+FKIo?=
 =?us-ascii?Q?Vs7kMICBBDVQskgBNvD4lqwMOJqpjVOv6n1WN/y47/qbIhaH74XlDmea10wd?=
 =?us-ascii?Q?Swkxt+GebqpsHg2Dh/CdG9aIvdDrTJOY4oMwlGTscEFHfz9Hzk4Drs8n28FQ?=
 =?us-ascii?Q?1lFPERiMLMEfePBPmaAtIidKgBpQsnbAM9UJObZB+d5uwhltugwfO6O0zUKb?=
 =?us-ascii?Q?roPV/z7/wLfhxu00Zc/J5IHhW78leG3WQXMJPFkgDUUa6AwyarYqym32eMXo?=
 =?us-ascii?Q?qQBszMXdXWu7or5g9R5ekUN3FTLENmXMfMvhWODgIjkCsKga347kCjpAygCB?=
 =?us-ascii?Q?EbbUCepv3Fi/7WlY8beDiEfyX1weZnLNrxCCcD2uijRyTvNZPaMEWm03whl7?=
 =?us-ascii?Q?SQmqSNVsVFu/8EPrH2uBg0FXsVODjEONYwXUkt1MimtZdc9PM0ucsA6Ls0LD?=
 =?us-ascii?Q?5jSnmBt1a3t4LF61oX8VTNxN6jujs3zzkxBAScfcBNuCO5tWpXBX2nHM9EZc?=
 =?us-ascii?Q?UpmOdUVuyKWKetC6ZjxBf13ifg1Y/R3aGT3R5WjrOawLDpULoAjX4Diwv50K?=
 =?us-ascii?Q?Ue/pJUL3Dro/vNbmrytSMrE5aQHWken+w/elbGqHBu0+q6w39ggypszA3nI0?=
 =?us-ascii?Q?AUBJjcA3Gotxr2munXNHJgHKXS5/KDdhE+q6A6XYYuO+THFXj4JO1BrmFjyz?=
 =?us-ascii?Q?uwznz44Tg3g3Fbeuet9q03s6FZEr2VKj+lKjJRso40hfsami2g7CGgkg/aWY?=
 =?us-ascii?Q?0kEVm/ntzhO1FdLU9xPFbY2UIBYH8b5tdhzdZEEY3JaUSNlSoCfUgsVqXuzi?=
 =?us-ascii?Q?wmAjErC1Ek6ccNRsYE8YQRBL+CFsA/V6S0rplQwkjVD2SWnYM1vvu9+8W2Z1?=
 =?us-ascii?Q?wLIuobcTUQaLLdpbm4ad6XqOqHsZMefy0ImcxZBxal7Tp66ppIypaa1eNdjx?=
 =?us-ascii?Q?wtmjAduRGUrF2DwSPgJtH+PRcAjztOOs17lkGDpL9aIF7OTqir47qQHxK4bq?=
 =?us-ascii?Q?XsxO8068JoZP26kgHd0Rzh3DtNuNRtyiI9r8ovzYSif0wi9WTbleG96tnXLL?=
 =?us-ascii?Q?vLguFn9cfDg3pYLHlzjxKmKugHi0IUTUBhXVaNd8fBHG/wyr2bmVybriofzj?=
 =?us-ascii?Q?rbKcbOwjbhYCW4+vV5Oz/J5NwYddMqrlppx6VX1SL57KzCMHSY08eqDpz3y7?=
 =?us-ascii?Q?9IX7HCb6ndcZwPd7mGUbMvlbSCg6J1iqIFqwPIZNOTkQ8VPg3QRNQACdviYi?=
 =?us-ascii?Q?DfLW3DMXvBZkjwUd3NM8UpYCpiWQN/NwGnds1rQ4EX7ldU6nmOprpRgMgO+X?=
 =?us-ascii?Q?b14XQGCyWYKJr8JyQBsCrE576f10Qtf9i/c+x4L+Z95yIqVPC1svs8f2uYFk?=
 =?us-ascii?Q?KQO9aFMH8inb1GG2tis4w4YNyppCQ8uCnL6V1Cww3dqj2A/kWHP77iK0DLqP?=
 =?us-ascii?Q?xJxulHWM9A9/t0mhZ7PZ0XbAQcu0mK5Kw5Dzm/u4FcLRSjv1wzY+hiGkAVwH?=
 =?us-ascii?Q?1n2JneiuInC5k05rgcWwt1bHcQmuA0VV3djYwMRe0Qxbyq9fk5uKYDmy7PW0?=
 =?us-ascii?Q?Lwb1xgb0F78mP1CXzI6cI7uN8a9ymak=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c491798-a9fc-4ad2-d123-08dec42a21e1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2026 00:17:17.0920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vCwVkqXKMvdkwdBl4M+Yjd+Au2HXwN07rrkmI77Pld8e6UmKMzXORzvUNztlagob2+DVKR5WLhWCaWklz0czk0hNv+xSgG6RJ48EiSd/FGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR08MB11707
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38043-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iopsys.eu:mid,iopsys.eu:dkim,iopsys.eu:from_mime,iopsys.eu:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6C1D864E928

phy1_led1 pin function wrongly refers to gpio1 instead of gpio11.
Fix it.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index e66b608c4803..b73ab60d0065 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -1754,7 +1754,7 @@ static const struct airoha_pinctrl_func_group an7583_phy1_led1_func_group[] = {
 				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
 	AIROHA_PINCTRL_PHY_LED1("gpio10", GPIO_LAN2_LED1_MODE_MASK,
 				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
-	AIROHA_PINCTRL_PHY_LED1("gpio1", GPIO_LAN3_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1("gpio11", GPIO_LAN3_LED1_MODE_MASK,
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
 };
 
-- 
2.53.0


