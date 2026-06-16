Return-Path: <linux-gpio+bounces-38529-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JqZ6Bw7PMGo7XgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38529-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 06:20:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7C968BD73
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 06:20:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=K8LVrnMW;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38529-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38529-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88A4930DE4A8
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 04:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 581913C8C52;
	Tue, 16 Jun 2026 04:20:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021138.outbound.protection.outlook.com [52.101.65.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39E43C8700;
	Tue, 16 Jun 2026 04:20:00 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781583602; cv=fail; b=av2JGtr/0tJlrvs3C3eps/CEtZ5h+01Ao0zeqx1j8rVsaJjF19OF9RES5hSfTgdz8PUq7Y6N5bXQv8ehVX7d7Si2LrhpdZV31tE/Eo9+7eA1QMEJQ0YqhV2+DDjjzw61ChRiKuy3gAr+lws+C0Ky7w4noJhBU5uNfDw4a8ef2HQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781583602; c=relaxed/simple;
	bh=5Nlwu5Qy9j4jVSPYL7aV+3OUgJDHo1h0nuQo0bbS5l0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MZmIUhAOHngUEgwgjQLdlJ5LoqdOf4wvq3Hsf4Rfn89EDsYU0zATupvW578bQiSgajGnqvLWb9hVABp3MEoyIcD7o3AYP/qe+UaB61K2P5oQX5vSGSTcDrHnLjywzlHBS5D6yEiSvC69V6wgKwovo2wDIU27w4a9YEtmPShfbys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=K8LVrnMW; arc=fail smtp.client-ip=52.101.65.138
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EckxZUVJZatNv8/JVDROP9HlVuNkUs/bgTvNrwUKpI63yEz1eVOJdsHXSJA0RHcRb8uZvVCfOraHDBT2un5iKtPKPBAsVymFhudNtaP6i2f0+aTm6BGoRZLTX7/6tZfAWoYfh2y46HszMj5M+YKH5VOw5uyba296y33ld3QZjx5YKhoRCBo3/bdyxCXVSqEKwo4kSSP/bfAIBrzA6Fd+bzfIQp3QOHYIzV6n2QXTE0TXuBdoZZOSPJUMAKqQdeAChDErrjOlx5C5dEyxCATuGXxwSRl9TxqBpKnXXw5mt9wZfL4diHbCvxBQHLPR5vhCSeA2MXEegmoxxW9IWA6zCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4NnpCR8m5Q61vaQYwB+tHmg7AS31l7ZOwCdkgSO3cM=;
 b=GZ7TcC/tzS4WCaomEUbeMDScs8IwZYjA6tn6FY401INV6QC41Jyo/UWl+5SCtP38p+/0MRrDHKUTW851TRlKhNsbF4ZkzdpLmfeH3h7JK9tmuiqbBHTCyqaAnd2GK3dfdo7NOwsD6p0j+HWrT+l2sQXuhCknPoQPgimtQ49IYg3vW2y0dzVB9bA6t+IU/6Bu9vzwXyV7KqBoS3CcLH1J7sstva12qAW4+2KixhNIrYbEaGBQMWWaPgqa+lx82aaIVNkFb+Ja7cargf3WdQcynzRwXwyOGcwYGhHQbg9/B/yTBKHHVSqb8P7hXPHMuznSH102bTAJAnPFnGwylQJT5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4NnpCR8m5Q61vaQYwB+tHmg7AS31l7ZOwCdkgSO3cM=;
 b=K8LVrnMWlnbiVb1nh42gdq7Bc5yJtgPo4II2XMowys04PLJNTeAbyN2jZyHYObVQebMqLdSJ4LyHI+nyWRjeB/Z3rATRmzFABKVL8Rc9gqWEpQTVSCcf/4MIxDDxKrlWi+y1cVs0ea5QVfcs03FWBPi4fTi3aBD/4cBy5CSZBt94XnVMLe2vf0cwvmR3iyG2hfYf7I9Dnx78fAn/JYAiepFeh398bBFRlYhvj48loTiMU7mH2qNomce19QZqy1JVkKkQHi8kdhiWmAp0f7gscTe1zvGEPaEJXh139/DYPcHylkay2HQujW1gbIrYYHDBCT/W3zmz/iQ+Mcyx2ofFzg==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS2PR08MB10055.eurprd08.prod.outlook.com (2603:10a6:20b:645::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 04:19:55 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Tue, 16 Jun 2026
 04:19:54 +0000
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
Subject: [PATCH v2 02/12] pinctrl: airoha: an7583: fix I2C0_SDA_PD register bit order
Date: Tue, 16 Jun 2026 07:19:29 +0300
Message-ID: <20260616041939.2587012-3-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 61c064c9-d2d2-4c57-93a6-08decb5e84bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|18002099003|22082099003|38350700014|921020|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	X6/QeoSNzGP5pV5/DH5R6wR65Iicko8ct/FVtwAs/T6u1mEpMLOXBTCKyB0qwiVMMYVO+/nH4FGVcTTwL+BM8UsLXFtozVoI1YcWIpiDGAaz4MtS2buUNiFb1dky8qQSe7Izyg40EetzPyEzeiSW7VDhRW7920YzZHM+704F5Q6VWkqVXAQNx/HdPRQZzZy7AspsIOpEJgbDoDkwTgZTw8mMi3uEZM6TstIWpOBUPV1W5vTLa45f9B7ZDEhmHmCphHpiRAn+S8fFfWfBjsMr8P9N0Ol7HwxyEOdlIeqCrCsrbHC8EMGdM/zRFXyzJSA4KjIR+sfNUfhSo5PkmSwlerGM1L5Ds4flwm8NqyXCm99nix6QXhMyi45BjhPa6+7qcSChXS6KEXA7wFlaWUwzDjEyfK2g+s3fal5npoNOF7nU45G3GlGw+I6FR8faH0fCW3fEJ9kJFMym634ZSqZtwdBVPf45brp6b/Y2UrifPrNddCV61hbBZQuqmK1AN19FW/1iW73MoBbZDdCH8Sjr1sOk9CRKGSGWkoSufZu4NE/mfv9OzH4kLZN+d41hZbwXYEKankKt3ZnH7SNduJ/64upzaLydXZBDprppgzD41mWTd9hm1/LWbgZwuPFkB7me7OQ1HLjsWHTgeYP+sJNzAFyNFQI7uWTfVgjbCQpDxa3j/ubnivbf9v5RUz7WXBoXwIjgLmf+sQ4VH3SvtyO2hBBo3xLsux5zrqUlgd0/5uqlxn03A2xIkVW/lhKKZCXpPSpaqZdCsHjUWTWOszM6fQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(18002099003)(22082099003)(38350700014)(921020)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MjQl4HJq7+EYlKasx53u7uTiOAuNJddSE0egrOK7TUQG807zEsIZoBCe8f+I?=
 =?us-ascii?Q?w6h9UqazT9Cpa/cFmuoPXkAa7eMp4segFjYjdVE9Q/p6VkHLAsSOrIAwS14p?=
 =?us-ascii?Q?A5XWFbGvu2eYncUbD78P/DlLbygwUjybWBjBT3tz5CGUqt2lOhO0P+BwUBBG?=
 =?us-ascii?Q?b0BcteSZ44WvlibNEp/1ZynFVZLekemLh7QQakAvS/kOYCzv+nDpHCnDo1D4?=
 =?us-ascii?Q?eDd1OT+oUiiR4BMXGoLil9JtfrJj/Y5f3jcRX840XGro0pC2ssE6biqujNOw?=
 =?us-ascii?Q?acb0ZL6kEOzOkcVvHY546CyYRuKuz4PW0CoWbtD3IPqSCcG+Z2nmx4FqMa0W?=
 =?us-ascii?Q?3U5ppPgQjjmklw7m+DqnbDI580vW7GT7LasUvpchyRQz3D+KGmstTrV8d4ux?=
 =?us-ascii?Q?X+Zt973h5QPHENbYWK5Hv1eHoDUlSv6Kl3yVNm1yUfIMnB6pnuZtreYu1dOB?=
 =?us-ascii?Q?ao0SuGkX5Yg8zFHCf6rfDuJKQdjhWSk6C3xE7E7iTOmdty77Cq1Ej4ocdvnC?=
 =?us-ascii?Q?QPBR+4Y5C9XrPQij/8QsW2wM7ZbCJQskXc1Agt+ZO3WREfrAc06LJGbFkF4S?=
 =?us-ascii?Q?DdMRH4t+hbBLolKsPJBQp6SVKdcAli5gvzwTGYke4pTRye+dlyU8sjzTuwN7?=
 =?us-ascii?Q?V47qU3cUyC2w95ezEKJyZEBErSCFuljm5Aojkqlme2UwEdY3MpCc9KSFutaJ?=
 =?us-ascii?Q?SHBteJw5PXXxEcJA3mfxBnKvimrCygGjHNrPfhTFMBNtX42lw2GXXj+3NLS/?=
 =?us-ascii?Q?6yshQ5H2WhhZKE4eeypkhkc7mYTBD03lGuLIu0LzBPl4qsbR5k2tv202hi6I?=
 =?us-ascii?Q?AeL+hHf1vXNDcs8QkiK4HjvWj4LkawLRJblx42VZqsskdpH5wgoStVTSVq5+?=
 =?us-ascii?Q?rQkjdsfOWOt3A/6rNHUeoeG1wxhrYu7FxCoTXfAyoxeB1I0XeuN7pBIVy2Ku?=
 =?us-ascii?Q?FktsXqcgPoat7SaTH604j1jagFjOEX5I3ZOB5Lsjd/fgFLfG2Eb1t7Pak/0K?=
 =?us-ascii?Q?iR7rShadbVe9sRM81J4j5/W9uPNCEZGJUcbwpFul9/iTcGZeoEpFVFM8fvAM?=
 =?us-ascii?Q?/ka4gCF13FPGMwtwiwN9cEFqfE7WLQbhmsbND28M5kp1ESIgX0geonqc4AC6?=
 =?us-ascii?Q?kIPGQvbo1BBv7PjZM2Q/bEh7utrUZhyKJd/2CmQlA8GZXzELDcgHgQyi2bG3?=
 =?us-ascii?Q?tIQtaCpgbiDr7A536cdCj/yWzX1PoAjlKiUkYT8QSh2SRz5p5TnW32z1/91I?=
 =?us-ascii?Q?yT1nVtdo8VvDMWkjeXZ0DNh+xiZv9Jd1L8nDB1Fub/63OswCGaViVRJGUoQ8?=
 =?us-ascii?Q?OjrZ82nRrO2CxrU7EM3QxJJ5qJLSEs3Yk8g/aRUR42yGMZ5/xUXMAwF148p5?=
 =?us-ascii?Q?HBXwY/ApdcsTARFzoB+CrS2KFZmWDUsTFS9Y9cSbaUJePdz0Qha9QmxmSAwd?=
 =?us-ascii?Q?xGsZ5DrMgdBlLLuflEl14GYNuBxj+RU5nm4iqEoUw/L7ncDH1eySseUJ6J+b?=
 =?us-ascii?Q?21uEhWLE/p14XC9OZOzYQ9RgzXEyr4wMTCFQZWM0UMg4o+CFFv4XMa/iJSB3?=
 =?us-ascii?Q?z3dfUklzohIacecbTjXGnd3fVDAbkproS2yVBYjk7zPvwnJsMHhE+mCiiAJw?=
 =?us-ascii?Q?rBtMksEdFuc3MnqH2eIIl3GRFS8hYpD+QnN4NVSNIH8cm9qD/zQW48GVv77r?=
 =?us-ascii?Q?9D1zawz7KSgbfkPqVKGK9E0uLuOLlifcyaZq2K/bARgIxGpdmW5z0h3cPVy3?=
 =?us-ascii?Q?a5eKcZ/JYMFTLDClXodEh+NMqQVvIuw=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 61c064c9-d2d2-4c57-93a6-08decb5e84bd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 04:19:54.9389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KCKxsrI7ZiLGh6iUYYTv+WJXndBU/XCfKjadLZpjXSTKvW46xnZuVg+hCGhMGKe2uXiLhxfkLJLvqDMVLzj3BDysCvFFhoN+X1zLdO4T97Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10055
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38529-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iopsys.eu:dkim,iopsys.eu:email,iopsys.eu:mid,iopsys.eu:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E7C968BD73

I2C1_SCL_PD and RG_I2C1_SDA_PD bits are swapped, fix it.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 63c82268aa82..4076bd0261d1 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -184,8 +184,8 @@
 #define I2C_SDA_PU_MASK				BIT(0)
 
 #define REG_I2C_SDA_PD				0x0048
-#define AN7583_I2C1_SDA_PD_MASK			BIT(16)
-#define AN7583_I2C1_SCL_PD_MASK			BIT(15)
+#define AN7583_I2C1_SCL_PD_MASK			BIT(16)
+#define AN7583_I2C1_SDA_PD_MASK			BIT(15)
 #define SPI_MISO_PD_MASK			BIT(14)
 #define SPI_MOSI_PD_MASK			BIT(13)
 #define SPI_CLK_PD_MASK				BIT(12)
-- 
2.53.0


