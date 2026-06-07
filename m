Return-Path: <linux-gpio+bounces-38048-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5A+NJi+5JGrf+gEAu9opvQ
	(envelope-from <linux-gpio+bounces-38048-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 07 Jun 2026 02:19:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C51564E936
	for <lists+linux-gpio@lfdr.de>; Sun, 07 Jun 2026 02:19:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=ibD8iJpQ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38048-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38048-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5DA16303DEB9
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Jun 2026 00:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B67F1FF1B5;
	Sun,  7 Jun 2026 00:17:40 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023088.outbound.protection.outlook.com [40.107.159.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFAB23D283;
	Sun,  7 Jun 2026 00:17:36 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780791459; cv=fail; b=bDybkSRnMMtGYnBllo9zFeHb+I0kEWp9iUlf6XnCRsi1F3ans4kHw/YZdlWoFs3nzKCwn7ltgD8aSHuVhpp+6qnauCymEVvkAvoBHGJtwExB0wzBsznj9kQsyqn1g68cMCcEMA++FJQ1G9h4xuZHFxhhL1VdncV5uh52bX/8pms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780791459; c=relaxed/simple;
	bh=NY+o9R1UhC72f7rbB3z4lP3OldR7gdq6gM8Mt4YsrVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oHt1SEMfFuBwA657o/Jw16VimTA4HbwXPbZKwX0TUeGsQVtoLy6LCeLe3P+muF+oreOpbNnRwIM+64J15FQfPcp+K+8NqPwR4XAqqbDrzbDM0Ppr9zmAY9wGz+Rl/hdPGB/I2eS3QmDfKfn9gY/cLt4Gi770u63eEb6Vg24Stow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=ibD8iJpQ; arc=fail smtp.client-ip=40.107.159.88
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QHH0WoZ9b+rLr7CpcL0oyq8GUsQqkf2hIVXiY7LBbTQ5JM1D2hzKmq2EWFxpnohFUW6qjEIDNh7CeSsgSy1yCUCMABN4Wz/YtgNf4KpKaPsTtp5+MA/1swJkGQ08H/mdTc9jWZBOCtpy6P8sEbze/gtr2MMoCBB5VbtM8kmst7P6x2hJaOz+Rx95xFaEoDjQW7GEWQ0t2zeguQYVPi6w5ZXcwOuKDYjucd8kCuDpH+cV3Te1X6eLMutM/fRBqFgQis70ZePs8uYKdtrAyp0Lcbteo449dTI/kLeU8c/3Na655hvfvF8G2C5ANHyYAphc9r2z6sC92bR3WZN6WHvpqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yyFH5oWl1mVeIkIHEmDBnAZUKC1LRF53RzZASjhYzw4=;
 b=tQYDzZf/0GOWGVL7Ddy60BHiSWP5liU25UETsMwUha49/lylErf/nQdgwOpJ7oWKLEzWNYTsJ2ULEsF/rfWBSiXClVHL8ius16Eqm25aqHApXX+eeTv4xMZcoUgmeI+TTDzb9mSEqnmJUV6LLaU5VlUd3mCogN84lD+nrREeTnFyciaIIMEonXJ6ugxicrVduAsHK18Tl0DoRSzZ5k9DIN1lpB7bRKC8XOOXGEuVN58fX5Vv05nOVMrzxwRMoiR/DTMflr2JtY6QfA2G5fX0fbg4ERRnOEcbTCFym9cFy5x3VYmnqYMKXMFgrTZ9sy49qLS50m0Ylgiany2eii9raA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yyFH5oWl1mVeIkIHEmDBnAZUKC1LRF53RzZASjhYzw4=;
 b=ibD8iJpQax0JmPkfQnPXUxE50MBlFizxGb9Kl5VT/nPk51QhN3xqe4X68VOYsBTl7jW8FOYy53deF8yUjsHjKg+RuCw47ZKdn2q1vkmmm8hsMV+d3Hy54pAdpqHTCuJ9PYifqf5XN5gDLVmncNKIqBY24fp1wmkInjP/Vxw5jDkk7cLh9ODj+NSK/RwyvoACnFslFuP1Q4hIenGWO99x3K/L6MO+0iGF0zqqcevv5bWZlQNvpZ4s7po1LU/1+PUjRQKBXav7NmIYcwQVkzB8cjYX764lO0g0P7GH99uV4/noWfrPfHwpnqzsUfFMNOOThmi0U0doRkXZWmNpRtVDcw==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by DU2PR08MB10016.eurprd08.prod.outlook.com (2603:10a6:10:49e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Sun, 7 Jun 2026
 00:17:29 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0092.007; Sun, 7 Jun 2026
 00:17:29 +0000
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
Subject: [PATCH 18/18] pinctrl: airoha: add support of en7523 SoC
Date: Sun,  7 Jun 2026 03:16:54 +0300
Message-ID: <20260607001654.1439480-19-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|DU2PR08MB10016:EE_
X-MS-Office365-Filtering-Correlation-Id: 08bded2c-481f-449e-78b9-08dec42a2912
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|921020|38350700014|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	47FGTdiTyfsXRqWy5ELc3h/WaId5M9eHkthSGCX0zRhnAEPMuikPm/bmao9hr1ZVoSu8r8MpfdVhWu0Dv8aSWgbRyMLnE5Kr5p0WmpPYC6unzOwWb5d0VnZeW/pqT7Uc/IPyhKHYEjcm1BGsQYIdkwCYeMnziMwDIA44/dEJIfxWKqb3H3RS6V7wqU2+VX/psn/6/JP/m0YpZzAQ3j1YilVXqof0O8k2B/bL3+qT3qPbU2OHJrAmKt5CFliIuwoTd/8NMSDo7IYPGE5boqAzWt6Hthr5rWJjLM+/uMIp7QE7e5rA+WNAysXGxFZiWhi82gEkqjXhBua9sLljvkLZsyITg7yoIl2I4Tt6g7fdAHcyUJdw2cq4trxGetGhRvurqpUMVcWFfNtBVA+JZZ28BmJOp9vSF4Zs74dJdpSZBTQa5mgRlhsHQ+ZdW4EaZMf1t2EZXGh/NOO4onUBnw4AKGeEDWpXgnIAtH5LBLQZnvdxXPpSjgG3REEzrsm6wJs36z/h9d0NExPlEIDWMNzulcotg6seFXOeZ7E9VL1A6LAD++ugbliL361gkxx5L+3bEeKtOhE86egFsRuhzJziVhgKj1Irc+DL/UWLIv0grOzZ+j/6+CMP9p/CuNL12RNGwEKW66laXtd4n7a6J2jsk+8ouND8IDkTHArD0nm/9Tn0d6C83uS14/s8yTFyf/1YL1ihkkRLfd2mjaqUPrhB5OB2Fndst1MXU5FPb8dy56o8rioPFwUHeJaj0P20WV+fe6d9OtTB9wsuvW3TSWY1KQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(921020)(38350700014)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KgW+ocrMyXzq/41LHyM5OK6lAM4GBWLPItkAmPg9qL2PGC25dsVSBwgaUYV3?=
 =?us-ascii?Q?xlSf95GpcrnBOiBuD3+iA5o2ex4+IZj+rxwQn7QCOIOqSHGRzvV4IoInYmSA?=
 =?us-ascii?Q?cp3ugsTnF3H4JyvXG2LAq2EhkIoVVliti69nNPVrIMwYhJrfwlpT2q/23lLI?=
 =?us-ascii?Q?D+7apEVQIkyxnKBZ9All8dn8pEnGKi5umnNIyD+Sp2LXMqYR7wuaS429g6YA?=
 =?us-ascii?Q?kO/dD2i5xmJUNA6EO3Clg6t5usrMPkssP/6qqrMZJXNSysfrJEe/6XQaGoSr?=
 =?us-ascii?Q?ffB/yqeraHlNVpOmc0sff8HqS/+Vi8IDQZ4l2XeKpLV27U/hY2b24MVxC9HF?=
 =?us-ascii?Q?f9z1xnuzgvzH95IK3hIC/xly69bz9ymm+byRMr1RAfeFZWzjXB26H0deivlk?=
 =?us-ascii?Q?WvpxdkPMCxmujGyxKCadmnlPGYcJxjPxtMm53vBuKBjs+wleBz6mJuAVO18s?=
 =?us-ascii?Q?DpM0pXn9lhsI3mn581cjbtgzgwTWIn/5TYGM+g+zEn45e3JFF7DmxBJW303C?=
 =?us-ascii?Q?peY1cEtFpxTTTKdXVzAlPOAZktVyowtaOz5WQ2tccgc4yEjIT2fP1LUY7rWR?=
 =?us-ascii?Q?OZNxT+EApFsTbPfe4fwNUDHlOLZ21LfYQ8POLgIaGFOxFP+0as0cSQ9uAZfQ?=
 =?us-ascii?Q?CQWi0Iv8L3RJZludhS0bd2I+BV4b+tu+fBil9wlJuNKVAbtHxITqLbYMf/YF?=
 =?us-ascii?Q?7tOEzDy5UK9AovUyHDVzICYxEhKNWC6imz7Y+TOFW6TZnAkZF7eTglL3bASc?=
 =?us-ascii?Q?oT3vBd8DsTzRGcppTSvgO5S8rylq/haUohTqVI/ImANL4KAFxbhs3iNQ5q4H?=
 =?us-ascii?Q?7n8qVj3Xidkwd+uQnkN3omtNHW3I7vyiQjdYCyprhZp+kAWc8ATwupBJYwPP?=
 =?us-ascii?Q?pPsICa3QzAfdKT2p0kKlG0QbnCOkkdGmA20kDD52REKGc5OxOsQWcrB8Kkd6?=
 =?us-ascii?Q?a+k2MIa98TeVSsANPU0LvUh0n516vwuTdzbzHUK3DD55Skzr8zHc5M9QOHnJ?=
 =?us-ascii?Q?x0KX2wqzGiBfp7XDrHJr9Be664uDQ2Su6vxj8WPjdWtZlPWx/DVRV1Xqcdkd?=
 =?us-ascii?Q?oaQcd0hqlckwhSd7rf8MdoqvVcxmF5wcQ4QbTudEZXPfIWw9WhkO1xRCB/Tc?=
 =?us-ascii?Q?52pD8GuZ8vBjsldGjpAPBYaQ6FgmKFzvzI4GHh4RZpvOc5VYFj3QRppnsnVC?=
 =?us-ascii?Q?1eDoaQm1NXNoIt/h7PnYJ0irx5VRchDWBKLeastB7nWOuYde/4t8g0XpXvQh?=
 =?us-ascii?Q?494j3m/kdsq0HGqON91o0UgwpKwrrsI6+X25+IlMF9Y8fXV2RtnSXZr1IMNZ?=
 =?us-ascii?Q?cllSh6Xhmt2yLpIeOVU2RP1BemE/cn95bpkeAc/pK135WbmO3jRlqXypRKGX?=
 =?us-ascii?Q?9JfdT2eio2O1pOSZ1Vk1Yi39saLFGz8AWNvDMqDyv69lww0D0saCESpATL0X?=
 =?us-ascii?Q?o/WcRpzsb6tE1JY22RBkyzzALu/8SEHGMIP6lQGtk6ArOkiklZl/D991QuLb?=
 =?us-ascii?Q?QkMPjz14gjJR2jY8ZkitVItjrR8H8iO1q+yb+FQ2fbvttT+BR0yhR26Mq+AM?=
 =?us-ascii?Q?W/sEZZi1BPl3jSHzpxFnB7QtXQM6NWWn12iSj5KV3Uw84Cin+u6kz36heqn4?=
 =?us-ascii?Q?m+Fu7bPuoFmGHNYMfxcdY/rv0Zuwok4ugyS69F7C08M5/Ztcg0BFiTLUYR39?=
 =?us-ascii?Q?k0JLOEqfCbsvArnZbPPb21wmwiMAtoq/9yB+1tjrpHXKhrpBKiDpBQEXBOvS?=
 =?us-ascii?Q?omDNSeO2SHoDBTY9XcbRxfmkHUDTzG0=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 08bded2c-481f-449e-78b9-08dec42a2912
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2026 00:17:29.1585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3sJ7iiGtuhTtqc9ypP/JFSLHlBVKAOTSu88JhssnALz7dS+vLWD0BcF1LbiQWv05DKKaOA2meHKAgWW5O8fadswMCdE+iXaj1M1xZRTH4So=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10016
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
	TAGGED_FROM(0.00)[bounces-38048-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,iopsys.eu:mid,iopsys.eu:dkim,iopsys.eu:from_mime,iopsys.eu:email,genexis.eu:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6C51564E936

This patch adds support of Airoha en7523 SoC pin controller.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/Kconfig          |   6 +
 drivers/pinctrl/airoha/Makefile         |   1 +
 drivers/pinctrl/airoha/pinctrl-en7523.c | 850 ++++++++++++++++++++++++
 3 files changed, 857 insertions(+)
 create mode 100644 drivers/pinctrl/airoha/pinctrl-en7523.c

diff --git a/drivers/pinctrl/airoha/Kconfig b/drivers/pinctrl/airoha/Kconfig
index 08038a5b11c6..159b4496f64a 100644
--- a/drivers/pinctrl/airoha/Kconfig
+++ b/drivers/pinctrl/airoha/Kconfig
@@ -15,6 +15,7 @@ config PINCTRL_AIROHA
 	select REGMAP_MMIO
 	imply PINCTRL_AIROHA_AN7581
 	imply PINCTRL_AIROHA_AN7583
+	imply PINCTRL_AIROHA_EN7523
 	help
 	  Say yes here to support pin controller and gpio driver
 	  on Airoha SoC.
@@ -29,4 +30,9 @@ config PINCTRL_AIROHA_AN7583
 	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_AIROHA
 
+config PINCTRL_AIROHA_EN7523
+	tristate "EN7523 pinctrl"
+	depends on ARM || COMPILE_TEST
+	depends on PINCTRL_AIROHA
+
 endmenu
diff --git a/drivers/pinctrl/airoha/Makefile b/drivers/pinctrl/airoha/Makefile
index eac0f376b590..68ef023b7725 100644
--- a/drivers/pinctrl/airoha/Makefile
+++ b/drivers/pinctrl/airoha/Makefile
@@ -5,3 +5,4 @@ obj-$(CONFIG_PINCTRL_AIROHA)		+= pinctrl-airoha.o
 
 obj-$(CONFIG_PINCTRL_AIROHA_AN7581)	+= pinctrl-an7581.o
 obj-$(CONFIG_PINCTRL_AIROHA_AN7583)	+= pinctrl-an7583.o
+obj-$(CONFIG_PINCTRL_AIROHA_EN7523)	+= pinctrl-en7523.o
diff --git a/drivers/pinctrl/airoha/pinctrl-en7523.c b/drivers/pinctrl/airoha/pinctrl-en7523.c
new file mode 100644
index 000000000000..b77792c44dfc
--- /dev/null
+++ b/drivers/pinctrl/airoha/pinctrl-en7523.c
@@ -0,0 +1,850 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Author: Lorenzo Bianconi <lorenzo@kernel.org>
+ * Author: Benjamin Larsson <benjamin.larsson@genexis.eu>
+ * Author: Markus Gothe <markus.gothe@genexis.eu>
+ * Author: Matheus Sampaio Queiroga <srherobrine20@gmail.com>
+ * Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
+ */
+#include "airoha-common.h"
+
+static struct pinctrl_pin_desc pinctrl_pins[] = {
+	PINCTRL_PIN(2, "i2c_sda"),
+	PINCTRL_PIN(3, "i2c_scl"),
+	PINCTRL_PIN(4, "spi_cs0"),
+	PINCTRL_PIN(5, "spi_clk"),
+	PINCTRL_PIN(6, "spi_mosi"),
+	PINCTRL_PIN(7, "spi_miso"),
+	PINCTRL_PIN(8, "uart1_txd"),
+	PINCTRL_PIN(9, "uart1_rxd"),
+	PINCTRL_PIN(12, "gpio0"),
+	PINCTRL_PIN(13, "gpio1"),
+	PINCTRL_PIN(14, "gpio2"),
+	PINCTRL_PIN(15, "gpio3"),
+	PINCTRL_PIN(16, "gpio4"),
+	PINCTRL_PIN(17, "gpio5"),
+	PINCTRL_PIN(18, "gpio6"),
+	PINCTRL_PIN(19, "gpio7"),
+	PINCTRL_PIN(20, "gpio8"),
+	PINCTRL_PIN(21, "gpio9"),
+	PINCTRL_PIN(22, "gpio10"),
+	PINCTRL_PIN(23, "gpio11"),
+	PINCTRL_PIN(24, "gpio12"),
+	PINCTRL_PIN(25, "gpio13"),
+	PINCTRL_PIN(26, "gpio14"),
+	PINCTRL_PIN(27, "gpio15"),
+	PINCTRL_PIN(28, "gpio16"),
+	PINCTRL_PIN(29, "gpio17"),
+	PINCTRL_PIN(30, "gpio18"),
+	PINCTRL_PIN(31, "gpio19"),
+	PINCTRL_PIN(32, "gpio20"),
+	PINCTRL_PIN(33, "gpio21"),
+	PINCTRL_PIN(34, "gpio22"),
+	PINCTRL_PIN(35, "gpio23"),
+	PINCTRL_PIN(36, "gpio24"),
+	PINCTRL_PIN(37, "gpio25"),
+	PINCTRL_PIN(38, "gpio26"),
+	PINCTRL_PIN(39, "gpio27"),
+	PINCTRL_PIN(40, "pcie_reset0"),
+	PINCTRL_PIN(41, "pcie_reset1"),
+};
+
+static const int pon_pins[] = { 28, 29, 30, 31, 32, 33 };
+static const int pon_tod_1pps_pins[] = { 21 };
+static const int gsw_tod_1pps_pins[] = { 21 };
+static const int sipo_pins[] = { 13, 38 };
+static const int sipo_rclk_pins[] = { 13, 30, 38 };
+static const int mdio_pins[] = { 20, 21 };
+static const int uart2_pins[] = { 20, 21 };
+static const int npu_uart_pins[] = { 13, 38 };
+static const int i2c0_pins[] = { 2, 3 };
+static const int i2c1_pins[] = { 14, 15 };
+static const int jtag_udi_pins[] = { 34, 35, 36, 37, 38 };
+static const int jtag_dfd_pins[] = { 34, 35, 36, 37, 38 };
+static const int i2s_pins[] = { 16, 17, 18, 19 };
+static const int pcm1_pins[] = { 24, 25, 26, 27 };
+static const int pcm2_pins[] = { 16, 17, 18, 19 };
+static const int spi_pins[] = { 4, 5, 6, 7 };
+static const int spi_quad_pins[] = { 14, 15 };
+static const int spi_cs1_pins[] = { 21 };
+static const int pcm_spi_pins[] = { 16, 17, 18, 19, 24, 25, 26, 27 };
+static const int pcm_spi_int_pins[] = { 15 };
+static const int pcm_spi_rst_pins[] = { 14 };
+static const int pcm_spi_cs1_pins[] = { 22 };
+static const int pcm_spi_cs2_pins[] = { 39 };
+static const int pcm_spi_cs3_pins[] = { 20 };
+static const int pcm_spi_cs4_pins[] = { 23 };
+static const int gpio0_pins[] = { 12 };
+static const int gpio1_pins[] = { 13 };
+static const int gpio2_pins[] = { 14 };
+static const int gpio3_pins[] = { 15 };
+static const int gpio4_pins[] = { 16 };
+static const int gpio5_pins[] = { 17 };
+static const int gpio6_pins[] = { 18 };
+static const int gpio7_pins[] = { 19 };
+static const int gpio8_pins[] = { 20 };
+static const int gpio9_pins[] = { 21 };
+static const int gpio10_pins[] = { 22 };
+static const int gpio11_pins[] = { 23 };
+static const int gpio12_pins[] = { 24 };
+static const int gpio13_pins[] = { 25 };
+static const int gpio14_pins[] = { 26 };
+static const int gpio15_pins[] = { 27 };
+static const int gpio16_pins[] = { 28 };
+static const int gpio17_pins[] = { 29 };
+static const int gpio18_pins[] = { 30 };
+static const int gpio19_pins[] = { 31 };
+static const int gpio20_pins[] = { 32 };
+static const int gpio21_pins[] = { 33 };
+static const int gpio22_pins[] = { 34 };
+static const int gpio23_pins[] = { 35 };
+static const int gpio24_pins[] = { 36 };
+static const int gpio25_pins[] = { 37 };
+static const int gpio26_pins[] = { 38 };
+static const int gpio27_pins[] = { 39 };
+static const int pcie_reset0_pins[] = { 40 };
+static const int pcie_reset1_pins[] = { 41 };
+
+static const struct pingroup pinctrl_groups[] = {
+	PINCTRL_PIN_GROUP("pon", pon),
+	PINCTRL_PIN_GROUP("pon_tod_1pps", pon_tod_1pps),
+	PINCTRL_PIN_GROUP("gsw_tod_1pps", gsw_tod_1pps),
+	PINCTRL_PIN_GROUP("sipo", sipo),
+	PINCTRL_PIN_GROUP("sipo_rclk", sipo_rclk),
+	PINCTRL_PIN_GROUP("mdio", mdio),
+	PINCTRL_PIN_GROUP("uart2", uart2),
+	PINCTRL_PIN_GROUP("npu_uart", npu_uart),
+	PINCTRL_PIN_GROUP("i2c0", i2c0),
+	PINCTRL_PIN_GROUP("i2c1", i2c1),
+	PINCTRL_PIN_GROUP("jtag_udi", jtag_udi),
+	PINCTRL_PIN_GROUP("jtag_dfd", jtag_dfd),
+	PINCTRL_PIN_GROUP("i2s", i2s),
+	PINCTRL_PIN_GROUP("pcm1", pcm1),
+	PINCTRL_PIN_GROUP("pcm2", pcm2),
+	PINCTRL_PIN_GROUP("spi", spi),
+	PINCTRL_PIN_GROUP("spi_quad", spi_quad),
+	PINCTRL_PIN_GROUP("spi_cs1", spi_cs1),
+	PINCTRL_PIN_GROUP("pcm_spi", pcm_spi),
+	PINCTRL_PIN_GROUP("pcm_spi_int", pcm_spi_int),
+	PINCTRL_PIN_GROUP("pcm_spi_rst", pcm_spi_rst),
+	PINCTRL_PIN_GROUP("pcm_spi_cs1", pcm_spi_cs1),
+	PINCTRL_PIN_GROUP("pcm_spi_cs2", pcm_spi_cs2),
+	PINCTRL_PIN_GROUP("pcm_spi_cs3", pcm_spi_cs3),
+	PINCTRL_PIN_GROUP("pcm_spi_cs4", pcm_spi_cs4),
+	PINCTRL_PIN_GROUP("gpio0", gpio0),
+	PINCTRL_PIN_GROUP("gpio1", gpio1),
+	PINCTRL_PIN_GROUP("gpio2", gpio2),
+	PINCTRL_PIN_GROUP("gpio3", gpio3),
+	PINCTRL_PIN_GROUP("gpio4", gpio4),
+	PINCTRL_PIN_GROUP("gpio5", gpio5),
+	PINCTRL_PIN_GROUP("gpio6", gpio6),
+	PINCTRL_PIN_GROUP("gpio7", gpio7),
+	PINCTRL_PIN_GROUP("gpio8", gpio8),
+	PINCTRL_PIN_GROUP("gpio9", gpio9),
+	PINCTRL_PIN_GROUP("gpio10", gpio10),
+	PINCTRL_PIN_GROUP("gpio11", gpio11),
+	PINCTRL_PIN_GROUP("gpio12", gpio12),
+	PINCTRL_PIN_GROUP("gpio13", gpio13),
+	PINCTRL_PIN_GROUP("gpio14", gpio14),
+	PINCTRL_PIN_GROUP("gpio15", gpio15),
+	PINCTRL_PIN_GROUP("gpio16", gpio16),
+	PINCTRL_PIN_GROUP("gpio17", gpio17),
+	PINCTRL_PIN_GROUP("gpio18", gpio18),
+	PINCTRL_PIN_GROUP("gpio19", gpio19),
+	PINCTRL_PIN_GROUP("gpio20", gpio20),
+	PINCTRL_PIN_GROUP("gpio21", gpio21),
+	PINCTRL_PIN_GROUP("gpio22", gpio22),
+	PINCTRL_PIN_GROUP("gpio23", gpio23),
+	PINCTRL_PIN_GROUP("gpio24", gpio24),
+	PINCTRL_PIN_GROUP("gpio25", gpio25),
+	PINCTRL_PIN_GROUP("gpio26", gpio26),
+	PINCTRL_PIN_GROUP("gpio27", gpio27),
+	PINCTRL_PIN_GROUP("pcie_reset0", pcie_reset0),
+	PINCTRL_PIN_GROUP("pcie_reset1", pcie_reset1),
+};
+
+static const char *const pon_groups[] = { "pon" };
+static const char *const tod_1pps_groups[] = { "pon_tod_1pps", "gsw_tod_1pps" };
+static const char *const sipo_groups[] = { "sipo", "sipo_rclk" };
+static const char *const mdio_groups[] = { "mdio" };
+
+static const char *const uart_groups[] = { "uart2", "npu_uart" };
+static const char *const i2c_groups[] = { "i2c1" };
+static const char *const jtag_groups[] = { "jtag_udi", "jtag_dfd" };
+static const char *const pcm_groups[] = { "pcm1", "pcm2" };
+static const char *const spi_groups[] = { "spi_quad", "spi_cs1" };
+static const char *const pcm_spi_groups[] = {
+	"pcm_spi",     "pcm_spi_int", "pcm_spi_rst", "pcm_spi_cs1",
+	"pcm_spi_cs2", "pcm_spi_cs3", "pcm_spi_cs4"
+};
+
+static const char *const i2s_groups[] = { "i2s" };
+static const char *const pcie_reset_groups[] = {
+	"pcie_reset0", "pcie_reset1"
+};
+
+static const char *const pwm_groups[] = {
+	"gpio0",  "gpio1",  "gpio2",  "gpio3",  "gpio4",  "gpio5",  "gpio6",
+	"gpio7",  "gpio8",  "gpio9",  "gpio10", "gpio11", "gpio12", "gpio13",
+	"gpio14", "gpio15", "gpio16", "gpio17", "gpio18", "gpio19", "gpio20",
+	"gpio21", "gpio22", "gpio23", "gpio24", "gpio25", "gpio26", "gpio27"
+};
+
+static const char *const phy1_led0_groups[] = {
+	"gpio22", "gpio23", "gpio24", "gpio25"
+};
+static const char *const phy2_led0_groups[] = {
+	"gpio22", "gpio23", "gpio24", "gpio25"
+};
+static const char *const phy3_led0_groups[] = {
+	"gpio22", "gpio23", "gpio24", "gpio25"
+};
+static const char *const phy4_led0_groups[] = {
+	"gpio22", "gpio23", "gpio24", "gpio25"
+};
+static const char *const phy1_led1_groups[] = {
+	"gpio7", "gpio6", "gpio5", "gpio4"
+};
+static const char *const phy2_led1_groups[] = {
+	"gpio7", "gpio6", "gpio5", "gpio4"
+};
+static const char *const phy3_led1_groups[] = {
+	"gpio7", "gpio6", "gpio5", "gpio4"
+};
+static const char *const phy4_led1_groups[] = {
+	"gpio7", "gpio6", "gpio5", "gpio4"
+};
+
+static const struct airoha_pinctrl_func_group pon_func_group[] = {
+	{
+		.name = "pon",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			EN7523_REG_GPIO_PON_MODE,
+			GPIO_PON_MODE_MASK,
+			GPIO_PON_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group tod_1pps_func_group[] = {
+	{
+		.name = "pon_tod_1pps",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			EN7523_REG_GPIO_2ND_I2C_MODE,
+			PON_TOD_1PPS_MODE_MASK,
+			PON_TOD_1PPS_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "gsw_tod_1pps",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			EN7523_REG_GPIO_2ND_I2C_MODE,
+			GSW_TOD_1PPS_MODE_MASK,
+			GSW_TOD_1PPS_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group sipo_func_group[] = {
+	{
+		.name = "sipo",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			EN7523_REG_GPIO_PON_MODE,
+			GPIO_SIPO_MODE_MASK | SIPO_RCLK_MODE_MASK,
+			GPIO_SIPO_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "sipo_rclk",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			EN7523_REG_GPIO_PON_MODE,
+			GPIO_SIPO_MODE_MASK | SIPO_RCLK_MODE_MASK,
+			GPIO_SIPO_MODE_MASK | SIPO_RCLK_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group mdio_func_group[] = {
+	{
+		.name = "mdio",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			EN7523_REG_GPIO_PON_MODE,
+			GPIO_SGMII_MDIO_MODE_MASK,
+			GPIO_SGMII_MDIO_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group uart_func_group[] = {
+	{
+		.name = "uart2",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			EN7523_REG_GPIO_PON_MODE,
+			GPIO_UART2_MODE_MASK,
+			GPIO_UART2_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "npu_uart",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			EN7523_REG_NPU_UART_EN,
+			NPU_UART_EN_MASK,
+			NPU_UART_EN_MASK
+		},
+		.regmap_size = 1,
+	}
+};
+
+static const struct airoha_pinctrl_func_group i2c_func_group[] = {
+	{
+		.name = "i2c1",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			EN7523_REG_GPIO_2ND_I2C_MODE,
+			GPIO_2ND_I2C_MODE_MASK,
+			GPIO_2ND_I2C_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group jtag_func_group[] = {
+	{
+		.name = "jtag_udi",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			EN7523_REG_NPU_UART_EN,
+			JTAG_UDI_EN_MASK,
+			JTAG_UDI_EN_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "jtag_dfd",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			EN7523_REG_NPU_UART_EN,
+			JTAG_DFD_EN_MASK,
+			JTAG_DFD_EN_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group pcm_func_group[] = {
+	{
+		.name = "pcm1",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			EN7523_REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM1_MODE_MASK,
+			GPIO_PCM1_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcm2",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			EN7523_REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM2_MODE_MASK,
+			GPIO_PCM2_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group spi_func_group[] = {
+	{
+		.name = "spi_quad",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			EN7523_REG_GPIO_SPI_CS1_MODE,
+			GPIO_SPI_QUAD_MODE_MASK,
+			GPIO_SPI_QUAD_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "spi_cs1",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			EN7523_REG_GPIO_SPI_CS1_MODE,
+			GPIO_SPI_CS1_MODE_MASK,
+			GPIO_SPI_CS1_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "spi_cs2",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			EN7523_REG_GPIO_SPI_CS1_MODE,
+			GPIO_SPI_CS2_MODE_MASK,
+			GPIO_SPI_CS2_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "spi_cs3",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			EN7523_REG_GPIO_SPI_CS1_MODE,
+			GPIO_SPI_CS3_MODE_MASK,
+			GPIO_SPI_CS3_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "spi_cs4",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			EN7523_REG_GPIO_SPI_CS1_MODE,
+			GPIO_SPI_CS4_MODE_MASK,
+			GPIO_SPI_CS4_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
+	{
+		.name = "pcm_spi",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			EN7523_REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM_SPI_MODE_MASK,
+			GPIO_PCM_SPI_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcm_spi_int",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			EN7523_REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM_INT_MODE_MASK,
+			GPIO_PCM_INT_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcm_spi_rst",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			EN7523_REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM_RESET_MODE_MASK,
+			GPIO_PCM_RESET_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcm_spi_cs1",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			EN7523_REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM_SPI_CS1_MODE_MASK,
+			GPIO_PCM_SPI_CS1_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcm_spi_cs2",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			EN7523_REG_GPIO_SPI_CS1_MODE,
+			AN7583_GPIO_PCM_SPI_CS2_MODE_MASK,
+			AN7583_GPIO_PCM_SPI_CS2_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcm_spi_cs3",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			EN7523_REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM_SPI_CS3_MODE_MASK,
+			GPIO_PCM_SPI_CS3_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcm_spi_cs4",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			EN7523_REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM_SPI_CS4_MODE_MASK,
+			GPIO_PCM_SPI_CS4_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group i2s_func_group[] = {
+	{
+		.name = "i2s",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			EN7523_REG_GPIO_2ND_I2C_MODE,
+			GPIO_I2S_MODE_MASK,
+			GPIO_I2S_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
+	{
+		.name = "pcie_reset0",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			EN7523_REG_GPIO_PON_MODE,
+			GPIO_PCIE_RESET0_MASK,
+			GPIO_PCIE_RESET0_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcie_reset1",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			EN7523_REG_GPIO_PON_MODE,
+			GPIO_PCIE_RESET1_MASK,
+			GPIO_PCIE_RESET1_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
+static const struct airoha_pinctrl_func_group pwm_func_group[] = {
+	AIROHA_PINCTRL_PWM("gpio0", GPIO0_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio1", GPIO1_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio2", GPIO2_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio3", GPIO3_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio4", GPIO4_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio5", GPIO5_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio6", GPIO6_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio7", GPIO7_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio8", GPIO8_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio9", GPIO9_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio10", GPIO10_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio11", GPIO11_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio12", GPIO12_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio13", GPIO13_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio14", GPIO14_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio15", GPIO15_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio16", GPIO16_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio17", GPIO17_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio18", GPIO18_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio19", GPIO19_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio20", GPIO20_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio21", GPIO21_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio22", GPIO22_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio23", GPIO23_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio24", GPIO24_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio25", GPIO25_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio26", GPIO26_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio27", GPIO27_FLASH_MODE_CFG),
+};
+
+static const struct airoha_pinctrl_func_group phy1_led0_func_group[] = {
+	AIROHA_PINCTRL_PHY_LED0(EN7523, "gpio22", GPIO_LAN0_LED0_MODE_MASK,
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED0(EN7523, "gpio23", GPIO_LAN1_LED0_MODE_MASK,
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED0(EN7523, "gpio24", GPIO_LAN2_LED0_MODE_MASK,
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED0(EN7523, "gpio25", GPIO_LAN3_LED0_MODE_MASK,
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
+};
+
+static const struct airoha_pinctrl_func_group phy2_led0_func_group[] = {
+	AIROHA_PINCTRL_PHY_LED0(EN7523, "gpio22", GPIO_LAN0_LED0_MODE_MASK,
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED0(EN7523, "gpio23", GPIO_LAN1_LED0_MODE_MASK,
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED0(EN7523, "gpio24", GPIO_LAN2_LED0_MODE_MASK,
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED0(EN7523, "gpio25", GPIO_LAN3_LED0_MODE_MASK,
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
+};
+
+static const struct airoha_pinctrl_func_group phy3_led0_func_group[] = {
+	AIROHA_PINCTRL_PHY_LED0(EN7523, "gpio22", GPIO_LAN0_LED0_MODE_MASK,
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED0(EN7523, "gpio23", GPIO_LAN1_LED0_MODE_MASK,
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED0(EN7523, "gpio24", GPIO_LAN2_LED0_MODE_MASK,
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED0(EN7523, "gpio25", GPIO_LAN3_LED0_MODE_MASK,
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
+};
+
+static const struct airoha_pinctrl_func_group phy4_led0_func_group[] = {
+	AIROHA_PINCTRL_PHY_LED0(EN7523, "gpio22", GPIO_LAN0_LED0_MODE_MASK,
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
+	AIROHA_PINCTRL_PHY_LED0(EN7523, "gpio23", GPIO_LAN1_LED0_MODE_MASK,
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
+	AIROHA_PINCTRL_PHY_LED0(EN7523, "gpio24", GPIO_LAN2_LED0_MODE_MASK,
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
+	AIROHA_PINCTRL_PHY_LED0(EN7523, "gpio25", GPIO_LAN3_LED0_MODE_MASK,
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
+};
+
+static const struct airoha_pinctrl_func_group phy1_led1_func_group[] = {
+	AIROHA_PINCTRL_PHY_LED1(EN7523, "gpio7", GPIO_LAN0_LED1_MODE_MASK,
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED1(EN7523, "gpio6", GPIO_LAN1_LED1_MODE_MASK,
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED1(EN7523, "gpio5", GPIO_LAN2_LED1_MODE_MASK,
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED1(EN7523, "gpio4", GPIO_LAN3_LED1_MODE_MASK,
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
+};
+
+static const struct airoha_pinctrl_func_group phy2_led1_func_group[] = {
+	AIROHA_PINCTRL_PHY_LED1(EN7523, "gpio7", GPIO_LAN0_LED1_MODE_MASK,
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED1(EN7523, "gpio6", GPIO_LAN1_LED1_MODE_MASK,
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED1(EN7523, "gpio5", GPIO_LAN2_LED1_MODE_MASK,
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED1(EN7523, "gpio4", GPIO_LAN3_LED1_MODE_MASK,
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
+};
+
+static const struct airoha_pinctrl_func_group phy3_led1_func_group[] = {
+	AIROHA_PINCTRL_PHY_LED1(EN7523, "gpio7", GPIO_LAN0_LED1_MODE_MASK,
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED1(EN7523, "gpio6", GPIO_LAN1_LED1_MODE_MASK,
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED1(EN7523, "gpio5", GPIO_LAN2_LED1_MODE_MASK,
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED1(EN7523, "gpio4", GPIO_LAN3_LED1_MODE_MASK,
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
+};
+
+static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
+	AIROHA_PINCTRL_PHY_LED1(EN7523, "gpio7", GPIO_LAN0_LED1_MODE_MASK,
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
+	AIROHA_PINCTRL_PHY_LED1(EN7523, "gpio6", GPIO_LAN1_LED1_MODE_MASK,
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
+	AIROHA_PINCTRL_PHY_LED1(EN7523, "gpio5", GPIO_LAN2_LED1_MODE_MASK,
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
+	AIROHA_PINCTRL_PHY_LED1(EN7523, "gpio4", GPIO_LAN3_LED1_MODE_MASK,
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
+};
+
+static const struct airoha_pinctrl_func pinctrl_funcs[] = {
+	PINCTRL_FUNC_DESC("pon", pon),
+	PINCTRL_FUNC_DESC("tod_1pps", tod_1pps),
+	PINCTRL_FUNC_DESC("sipo", sipo),
+	PINCTRL_FUNC_DESC("mdio", mdio),
+	PINCTRL_FUNC_DESC("uart", uart),
+	PINCTRL_FUNC_DESC("i2c", i2c),
+	PINCTRL_FUNC_DESC("jtag", jtag),
+	PINCTRL_FUNC_DESC("pcm", pcm),
+	PINCTRL_FUNC_DESC("spi", spi),
+	PINCTRL_FUNC_DESC("pcm_spi", pcm_spi),
+	PINCTRL_FUNC_DESC("i2s", i2s),
+	PINCTRL_FUNC_DESC("pcie_reset", pcie_reset),
+	PINCTRL_FUNC_DESC("pwm", pwm),
+	PINCTRL_FUNC_DESC("phy1_led0", phy1_led0),
+	PINCTRL_FUNC_DESC("phy2_led0", phy2_led0),
+	PINCTRL_FUNC_DESC("phy3_led0", phy3_led0),
+	PINCTRL_FUNC_DESC("phy4_led0", phy4_led0),
+	PINCTRL_FUNC_DESC("phy1_led1", phy1_led1),
+	PINCTRL_FUNC_DESC("phy2_led1", phy2_led1),
+	PINCTRL_FUNC_DESC("phy3_led1", phy3_led1),
+	PINCTRL_FUNC_DESC("phy4_led1", phy4_led1),
+};
+
+static const struct airoha_pinctrl_conf pinctrl_pullup_conf[] = {
+	PINCTRL_CONF_DESC(12, REG_GPIO_L_PU, BIT(0)),
+	PINCTRL_CONF_DESC(13, REG_GPIO_L_PU, BIT(1)),
+	PINCTRL_CONF_DESC(14, REG_GPIO_L_PU, BIT(2)),
+	PINCTRL_CONF_DESC(15, REG_GPIO_L_PU, BIT(3)),
+	PINCTRL_CONF_DESC(16, REG_GPIO_L_PU, BIT(4)),
+	PINCTRL_CONF_DESC(17, REG_GPIO_L_PU, BIT(5)),
+	PINCTRL_CONF_DESC(18, REG_GPIO_L_PU, BIT(6)),
+	PINCTRL_CONF_DESC(19, REG_GPIO_L_PU, BIT(7)),
+	PINCTRL_CONF_DESC(20, REG_GPIO_L_PU, BIT(8)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_PU, BIT(9)),
+	PINCTRL_CONF_DESC(22, REG_GPIO_L_PU, BIT(10)),
+	PINCTRL_CONF_DESC(23, REG_GPIO_L_PU, BIT(11)),
+	PINCTRL_CONF_DESC(24, REG_GPIO_L_PU, BIT(12)),
+	PINCTRL_CONF_DESC(25, REG_GPIO_L_PU, BIT(13)),
+	PINCTRL_CONF_DESC(26, REG_GPIO_L_PU, BIT(14)),
+	PINCTRL_CONF_DESC(27, REG_GPIO_L_PU, BIT(15)),
+	PINCTRL_CONF_DESC(28, REG_GPIO_L_PU, BIT(16)),
+	PINCTRL_CONF_DESC(29, REG_GPIO_L_PU, BIT(17)),
+	PINCTRL_CONF_DESC(30, REG_GPIO_L_PU, BIT(18)),
+	PINCTRL_CONF_DESC(31, REG_GPIO_L_PU, BIT(19)),
+	PINCTRL_CONF_DESC(32, REG_GPIO_L_PU, BIT(20)),
+	PINCTRL_CONF_DESC(33, REG_GPIO_L_PU, BIT(21)),
+	PINCTRL_CONF_DESC(34, REG_GPIO_L_PU, BIT(22)),
+	PINCTRL_CONF_DESC(35, REG_GPIO_L_PU, BIT(23)),
+	PINCTRL_CONF_DESC(36, REG_GPIO_L_PU, BIT(24)),
+	PINCTRL_CONF_DESC(37, REG_GPIO_L_PU, BIT(25)),
+	PINCTRL_CONF_DESC(38, REG_GPIO_L_PU, BIT(26)),
+	PINCTRL_CONF_DESC(39, REG_GPIO_L_PU, BIT(27)),
+	PINCTRL_CONF_DESC(40, REG_GPIO_L_PU, BIT(28)),
+	PINCTRL_CONF_DESC(41, REG_GPIO_L_PU, BIT(29)),
+};
+
+static const struct airoha_pinctrl_conf pinctrl_pulldown_conf[] = {
+	PINCTRL_CONF_DESC(12, REG_GPIO_L_PD, BIT(0)),
+	PINCTRL_CONF_DESC(13, REG_GPIO_L_PD, BIT(1)),
+	PINCTRL_CONF_DESC(14, REG_GPIO_L_PD, BIT(2)),
+	PINCTRL_CONF_DESC(15, REG_GPIO_L_PD, BIT(3)),
+	PINCTRL_CONF_DESC(16, REG_GPIO_L_PD, BIT(4)),
+	PINCTRL_CONF_DESC(17, REG_GPIO_L_PD, BIT(5)),
+	PINCTRL_CONF_DESC(18, REG_GPIO_L_PD, BIT(6)),
+	PINCTRL_CONF_DESC(19, REG_GPIO_L_PD, BIT(7)),
+	PINCTRL_CONF_DESC(20, REG_GPIO_L_PD, BIT(8)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_PD, BIT(9)),
+	PINCTRL_CONF_DESC(22, REG_GPIO_L_PD, BIT(10)),
+	PINCTRL_CONF_DESC(23, REG_GPIO_L_PD, BIT(11)),
+	PINCTRL_CONF_DESC(24, REG_GPIO_L_PD, BIT(12)),
+	PINCTRL_CONF_DESC(25, REG_GPIO_L_PD, BIT(13)),
+	PINCTRL_CONF_DESC(26, REG_GPIO_L_PD, BIT(14)),
+	PINCTRL_CONF_DESC(27, REG_GPIO_L_PD, BIT(15)),
+	PINCTRL_CONF_DESC(28, REG_GPIO_L_PD, BIT(16)),
+	PINCTRL_CONF_DESC(29, REG_GPIO_L_PD, BIT(17)),
+	PINCTRL_CONF_DESC(30, REG_GPIO_L_PD, BIT(18)),
+	PINCTRL_CONF_DESC(31, REG_GPIO_L_PD, BIT(19)),
+	PINCTRL_CONF_DESC(32, REG_GPIO_L_PD, BIT(20)),
+	PINCTRL_CONF_DESC(33, REG_GPIO_L_PD, BIT(21)),
+	PINCTRL_CONF_DESC(34, REG_GPIO_L_PD, BIT(22)),
+	PINCTRL_CONF_DESC(35, REG_GPIO_L_PD, BIT(23)),
+	PINCTRL_CONF_DESC(36, REG_GPIO_L_PD, BIT(24)),
+	PINCTRL_CONF_DESC(37, REG_GPIO_L_PD, BIT(25)),
+	PINCTRL_CONF_DESC(38, REG_GPIO_L_PD, BIT(26)),
+	PINCTRL_CONF_DESC(39, REG_GPIO_L_PD, BIT(27)),
+	PINCTRL_CONF_DESC(40, REG_GPIO_L_PD, BIT(28)),
+	PINCTRL_CONF_DESC(41, REG_GPIO_L_PD, BIT(29)),
+};
+
+static const struct airoha_pinctrl_conf pinctrl_drive_e2_conf[] = {
+	PINCTRL_CONF_DESC(12, REG_GPIO_L_E2, BIT(0)),
+	PINCTRL_CONF_DESC(13, REG_GPIO_L_E2, BIT(1)),
+	PINCTRL_CONF_DESC(14, REG_GPIO_L_E2, BIT(2)),
+	PINCTRL_CONF_DESC(15, REG_GPIO_L_E2, BIT(3)),
+	PINCTRL_CONF_DESC(16, REG_GPIO_L_E2, BIT(4)),
+	PINCTRL_CONF_DESC(17, REG_GPIO_L_E2, BIT(5)),
+	PINCTRL_CONF_DESC(18, REG_GPIO_L_E2, BIT(6)),
+	PINCTRL_CONF_DESC(19, REG_GPIO_L_E2, BIT(7)),
+	PINCTRL_CONF_DESC(20, REG_GPIO_L_E2, BIT(8)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_E2, BIT(9)),
+	PINCTRL_CONF_DESC(22, REG_GPIO_L_E2, BIT(10)),
+	PINCTRL_CONF_DESC(23, REG_GPIO_L_E2, BIT(11)),
+	PINCTRL_CONF_DESC(24, REG_GPIO_L_E2, BIT(12)),
+	PINCTRL_CONF_DESC(25, REG_GPIO_L_E2, BIT(13)),
+	PINCTRL_CONF_DESC(26, REG_GPIO_L_E2, BIT(14)),
+	PINCTRL_CONF_DESC(27, REG_GPIO_L_E2, BIT(15)),
+	PINCTRL_CONF_DESC(28, REG_GPIO_L_E2, BIT(16)),
+	PINCTRL_CONF_DESC(29, REG_GPIO_L_E2, BIT(17)),
+	PINCTRL_CONF_DESC(30, REG_GPIO_L_E2, BIT(18)),
+	PINCTRL_CONF_DESC(31, REG_GPIO_L_E2, BIT(19)),
+	PINCTRL_CONF_DESC(32, REG_GPIO_L_E2, BIT(20)),
+	PINCTRL_CONF_DESC(33, REG_GPIO_L_E2, BIT(21)),
+	PINCTRL_CONF_DESC(34, REG_GPIO_L_E2, BIT(22)),
+	PINCTRL_CONF_DESC(35, REG_GPIO_L_E2, BIT(23)),
+	PINCTRL_CONF_DESC(36, REG_GPIO_L_E2, BIT(24)),
+	PINCTRL_CONF_DESC(37, REG_GPIO_L_E2, BIT(25)),
+	PINCTRL_CONF_DESC(38, REG_GPIO_L_E2, BIT(26)),
+	PINCTRL_CONF_DESC(39, REG_GPIO_L_E2, BIT(27)),
+	PINCTRL_CONF_DESC(40, REG_GPIO_L_E2, BIT(28)),
+	PINCTRL_CONF_DESC(41, REG_GPIO_L_E2, BIT(29)),
+};
+
+static const struct airoha_pinctrl_conf pinctrl_drive_e4_conf[] = {
+	PINCTRL_CONF_DESC(12, REG_GPIO_L_E4, BIT(0)),
+	PINCTRL_CONF_DESC(13, REG_GPIO_L_E4, BIT(1)),
+	PINCTRL_CONF_DESC(14, REG_GPIO_L_E4, BIT(2)),
+	PINCTRL_CONF_DESC(15, REG_GPIO_L_E4, BIT(3)),
+	PINCTRL_CONF_DESC(16, REG_GPIO_L_E4, BIT(4)),
+	PINCTRL_CONF_DESC(17, REG_GPIO_L_E4, BIT(5)),
+	PINCTRL_CONF_DESC(18, REG_GPIO_L_E4, BIT(6)),
+	PINCTRL_CONF_DESC(19, REG_GPIO_L_E4, BIT(7)),
+	PINCTRL_CONF_DESC(20, REG_GPIO_L_E4, BIT(8)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_E4, BIT(9)),
+	PINCTRL_CONF_DESC(22, REG_GPIO_L_E4, BIT(10)),
+	PINCTRL_CONF_DESC(23, REG_GPIO_L_E4, BIT(11)),
+	PINCTRL_CONF_DESC(24, REG_GPIO_L_E4, BIT(12)),
+	PINCTRL_CONF_DESC(25, REG_GPIO_L_E4, BIT(13)),
+	PINCTRL_CONF_DESC(26, REG_GPIO_L_E4, BIT(14)),
+	PINCTRL_CONF_DESC(27, REG_GPIO_L_E4, BIT(15)),
+	PINCTRL_CONF_DESC(28, REG_GPIO_L_E4, BIT(16)),
+	PINCTRL_CONF_DESC(29, REG_GPIO_L_E4, BIT(17)),
+	PINCTRL_CONF_DESC(30, REG_GPIO_L_E4, BIT(18)),
+	PINCTRL_CONF_DESC(31, REG_GPIO_L_E4, BIT(19)),
+	PINCTRL_CONF_DESC(32, REG_GPIO_L_E4, BIT(20)),
+	PINCTRL_CONF_DESC(33, REG_GPIO_L_E4, BIT(21)),
+	PINCTRL_CONF_DESC(34, REG_GPIO_L_E4, BIT(22)),
+	PINCTRL_CONF_DESC(35, REG_GPIO_L_E4, BIT(23)),
+	PINCTRL_CONF_DESC(36, REG_GPIO_L_E4, BIT(24)),
+	PINCTRL_CONF_DESC(37, REG_GPIO_L_E4, BIT(25)),
+	PINCTRL_CONF_DESC(38, REG_GPIO_L_E4, BIT(26)),
+	PINCTRL_CONF_DESC(39, REG_GPIO_L_E4, BIT(27)),
+	PINCTRL_CONF_DESC(40, REG_GPIO_L_E4, BIT(28)),
+	PINCTRL_CONF_DESC(41, REG_GPIO_L_E4, BIT(29)),
+};
+
+static const struct airoha_pinctrl_conf pinctrl_pcie_rst_od_conf[] = {
+	PINCTRL_CONF_DESC(40, REG_PCIE_RESET_OD, PCIE0_RESET_OD_MASK),
+	PINCTRL_CONF_DESC(41, REG_PCIE_RESET_OD, PCIE1_RESET_OD_MASK),
+};
+
+static const struct airoha_pinctrl_match_data pinctrl_match_data = {
+	.pins = pinctrl_pins,
+	.num_pins = ARRAY_SIZE(pinctrl_pins),
+	.grps = pinctrl_groups,
+	.num_grps = ARRAY_SIZE(pinctrl_groups),
+	.funcs = pinctrl_funcs,
+	.num_funcs = ARRAY_SIZE(pinctrl_funcs),
+	.confs_info = {
+		[AIROHA_PINCTRL_CONFS_PULLUP] = {
+			.confs = pinctrl_pullup_conf,
+			.num_confs = ARRAY_SIZE(pinctrl_pullup_conf),
+		},
+		[AIROHA_PINCTRL_CONFS_PULLDOWN] = {
+			.confs = pinctrl_pulldown_conf,
+			.num_confs = ARRAY_SIZE(pinctrl_pulldown_conf),
+		},
+		[AIROHA_PINCTRL_CONFS_DRIVE_E2] = {
+			.confs = pinctrl_drive_e2_conf,
+			.num_confs = ARRAY_SIZE(pinctrl_drive_e2_conf),
+		},
+		[AIROHA_PINCTRL_CONFS_DRIVE_E4] = {
+			.confs = pinctrl_drive_e4_conf,
+			.num_confs = ARRAY_SIZE(pinctrl_drive_e4_conf),
+		},
+		[AIROHA_PINCTRL_CONFS_PCIE_RST_OD] = {
+			.confs = pinctrl_pcie_rst_od_conf,
+			.num_confs = ARRAY_SIZE(pinctrl_pcie_rst_od_conf),
+		},
+	},
+};
+
+static const struct of_device_id airoha_pinctrl_of_match[] = {
+	{ .compatible = "airoha,en7523-pinctrl", .data = &pinctrl_match_data },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, airoha_pinctrl_of_match);
+
+static struct platform_driver airoha_pinctrl_driver = {
+	.probe = airoha_pinctrl_probe,
+	.driver = {
+		.name = "pinctrl-airoha-en7523",
+		.of_match_table = airoha_pinctrl_of_match,
+	},
+};
+module_platform_driver(airoha_pinctrl_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
+MODULE_AUTHOR("Benjamin Larsson <benjamin.larsson@genexis.eu>");
+MODULE_AUTHOR("Markus Gothe <markus.gothe@genexis.eu>");
+MODULE_AUTHOR("Matheus Sampaio Queiroga <srherobrine20@gmail.com>");
+MODULE_AUTHOR("Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>");
+MODULE_DESCRIPTION("Pinctrl driver for Airoha EN7523 SoC");
-- 
2.53.0


