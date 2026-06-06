Return-Path: <linux-gpio+bounces-38021-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gAM3L3qAI2q0ugEAu9opvQ
	(envelope-from <linux-gpio+bounces-38021-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 06 Jun 2026 04:05:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B2D64C2BC
	for <lists+linux-gpio@lfdr.de>; Sat, 06 Jun 2026 04:05:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=r2x6djSu;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38021-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38021-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B6748305FB1E
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Jun 2026 02:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4928C2765D7;
	Sat,  6 Jun 2026 02:04:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021103.outbound.protection.outlook.com [52.101.70.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922EA26F289;
	Sat,  6 Jun 2026 02:04:07 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780711449; cv=fail; b=FJZrfA4WYC9j6CLKryTMSrRP3M2cqMv4AizuOpwLhKqfcSZhOlcbeWXjYHLIWXFVE0op7Zf7xg4vWpSsZL/ivWH4f2OZugxHYMrQWXUF8gJ6Zt7l7dYL5962tpX8Ie8TpBJKiVkURbZrS1jmx9W5nsiZl8ijPt/w8KUMiHXIx5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780711449; c=relaxed/simple;
	bh=XgK8My/H9pK1DZeMWlQajEq+1uo9zvddyK4iP/ryRBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MAyp0z3AVutzKglIJivry70st3vzrqzZ2zb9ki/xcbtrBZhZYA41nwUI/rSM26LzSI4/SMkjlhAENuwwfnaIDnLk/99WKN050kVf8LaUv2VQjmeCe9uazCfk5DAuLjJZW/iiXLsDY9B14vdfex118p+CpdRYN4vIqnHw7KFC56Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=r2x6djSu; arc=fail smtp.client-ip=52.101.70.103
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A2BtaNPIhmhJGKEvV2lY/5XOKV88d0o+0vKIaFBID22VKFbJ2EeJAqc+lcJj/3vfAGRzZkWd8HwtVakecimwc5/YGCQSX7uxULLbw0aoCUgGn6HXtP76Iucdhh60aGHmxhvGV3YJsfZyqTrt8YubK87PkF15AFdNaekmyONKbu9pmtK3ILee19DlG3cKVPc1e/Iv7ZhU1rm3T1Qa8z/XiQXzb604EhtetVxsd6Lj6KhqoP5ScV+EHRMgA3XsdeBr1xMgH6RSMUBpwtJmvdpVDVcuQlDd/q2ImLr9tGM1PrIB2rskpIUkjUvrtW17C1pnBeM2QaPp/t3XUePnN+EYLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1SindAhp+XmYFFoCsHoEZJEhj8mwp0oObOYHELj6D0=;
 b=xBtwCBW8LH1b57ISxzDXHovUvewmZw8n7nd5k4B3rpN8NM3gROEohJDVQJucFK51uGtoWHSsILryj6aHfR2Jm9Y6Ee44yicdhUncpSOlmj5Wy8IdiwfOTCzI7HcdLat/ns4uZoH55cWap7I0aeSs68WloLg+r1vv1IUYT0wVBDmgMwpoQkBvU7pLpVK3B2ubTxwvWMLDJQRViMlNuXh/mh94hqkxiWEvBQIqTAwBF5SVecpgdnRYJjnbAY0lTbJrLAP/ItAfGiN/2D7IDPsDNxVWA9aHbD4XBDtKRsvvLLaxKBsm2GHuvPRV0xmy2zqVlK/3MRbZVzE+/LLsPRD1ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1SindAhp+XmYFFoCsHoEZJEhj8mwp0oObOYHELj6D0=;
 b=r2x6djSu5hRtCpn+DciK2QNr4cUEgZKLcgGTF7/wkdiDMYCzs5gBo96cytEIbfI6WY5MwUUOjEXILVUtr+2leA0Jh3ilolnGJ4ed9M+juaK1GZVUHm+Cd/CftuJR/r5Eb5yHuvZaz3w44s5Iw0ekJPWuTfVZPXOkOnEr0TYST7p/gOjQ47nbXCD42LOKcPZAlcqyiHQxItckQmRjMzatZDWSriXQZfSTzaaxa2pTxQKkDVAphJCoKrw+MaUuEutQ2gnH9ly1H3+46Gtg+yr+8rNjBg6Xfu3prWq7iCOm1qbh5H7XjH/kFQjiu4EZxH4m88hLmhefxuEVH4kYcyU/Hw==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by DU0PR08MB9558.eurprd08.prod.outlook.com (2603:10a6:10:44d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.10; Sat, 6 Jun 2026
 02:04:02 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0092.006; Sat, 6 Jun 2026
 02:04:02 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH 04/11] pinctrl: airoha: an7583: fix misprint in gpio19 pinconf
Date: Sat,  6 Jun 2026 05:03:35 +0300
Message-ID: <20260606020342.1256509-5-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260606020342.1256509-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260606020342.1256509-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::16) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|DU0PR08MB9558:EE_
X-MS-Office365-Filtering-Correlation-Id: b8702552-17b4-4112-8c75-08dec36fe182
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|11063799006|56012099006|6133799003|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	pwGxREQtAVOvVrqPhmqDLv/MfxgWEzGzSomqLwtj8k/+CiCuFnw/UkB428k9ZqHvhXX0vmzUrGRbnIPY3X7bcIDycNeqF/ho7zIzhdwDaD1hCop0ByaySsjegYcEOpjTKhTCdk/dl/2OXuTf9hOACl26vMQM8ynQ7MU5nN3JFxhj27hQI/1mdVLKYqp2hirnLFKaOEr2xrLJ/sJdb8QpPtQKYnOppLtkqniPCHuc4F9/JMmMUvqf+UqVTqmMwyJ0WRmO0IkWfNxIqWvetZhJ8AJ8K6BVSb0t8Wb59/UT3nezjCztHu1RzB5XyrtNJLqtCKJAVERyEnH0e0tYWWcFUZmNImBXTNwLJnI5t6xdPiVzbzi5x5tLnpCYpHHm+N96vyYApRqgjOxQ+XAgvekG1DKJsLg+xJ76vM9Kj+7o/s24eWs7MniPWArSRPrk8aj2hrmVHXqsXhyMwtasBVD6mTT2dsm5UdG4eIsQcAzdkf9rYLjFLsvhOrMqutHf8lZVUOcOkDb65m9tdVBOuer//Hi68kYU2hIGzQaBEs2Rrg5iwRZxHcBkJF4guNN0NS4w3HQeIrUUF7jsjHqcp+kkXujaVJhbQQrLJIRVcVoTvIjQlL4VhhSrSCtuBVE/zhgViY3WvBZVy46/v31/dilaPw4A2gN+uqGAVnTwwPxxJEOFVsE3iX75kO5Oo/RhfeTE/Zwhoh3pKu1u6IEY4XmSJmeCpT3F8zscfxgqRHQUiRsN0f+W9ihgCa5f73Yj1xHp+NcpfwGVzCnI6aReYHm+nw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IjSUkQVRNklNjlOKlhwq3E3a1PQU+G+DYZzx0kVWO4t1zpy5pXyZj2p3absv?=
 =?us-ascii?Q?/1w+YSL5PipdXHWke8Z2FQ97WNjSJwi/7WnKZwRbCDafUbRIUtfDLEAQ70Ys?=
 =?us-ascii?Q?uXoJdiXShYjOMiqBENNA6hsNcF19IWXwQs3JmxUWnIexTflpiQskc0Rp6DaU?=
 =?us-ascii?Q?rLxuTLkcfWszD5PdItRy1Kqgjn7oeCuyUqhs34NFRt/4sNtswiYseO4SCuH8?=
 =?us-ascii?Q?Xhez4uP1GmtsN9YeDurap+aEZ32CSe0c4YGeg4f3nSLe6g/7o8Vqsxu9GvA1?=
 =?us-ascii?Q?szBAsYNk9jAezY5Fu0tkypJ2+zH2Hc5XJqxM13f+SJO5MAAPggpxN4HSDT32?=
 =?us-ascii?Q?zgm7d0hS5kEFlcDwFeHJw0tB/OBTJrt7LGH92TkaaHeralneWyKeOg3yqC1M?=
 =?us-ascii?Q?qkvoDdMSdT9BG83fwC6dSfb2u6W5N3/E0gzkamTcU7j/rUIbojDQVRNeh5VA?=
 =?us-ascii?Q?0s/ly8uBPcom5zVCGSiakL25E97F/UP/5ZHknzRBYecM94kyr7Xjwgoc6WAQ?=
 =?us-ascii?Q?aH5QquinY0/dhFVqbNmvA4Nz/CX+zHyFxbXu8UUaIUWB29bO8Gpi1Www7S0V?=
 =?us-ascii?Q?9PszOpBPfGQvELquD5/oGmzhs+hKX5r+uyv9hCL4O3kVF/TvuM8lBJhJaqHd?=
 =?us-ascii?Q?9cDwgeGHSRQp4UCeNH5pr5afg3SDn2TofiaHC74zk/CNtOStVHRQ3zRYIhKf?=
 =?us-ascii?Q?9ibmHCcvGre29l3QH8Ukz5ydjlysIGX67EOGDOaX6H9Wf/wqPyxxdUytr2YZ?=
 =?us-ascii?Q?tdbdg84AytM122omva1q4eq4vqJ4Y4Zd6fYvhwuUAzLAa6P3UAFmdEwE6dIV?=
 =?us-ascii?Q?vjipny3xbb+cJhPWTCFBl1T2vy6DWtSwfyrf5+i9SeZcm88EwWFQppy49UeK?=
 =?us-ascii?Q?DQd3FX0eUJQB2UG04U1zC8GVkUsG1ilyagGlReptTlkkT2GOjyIPPUqJAWh0?=
 =?us-ascii?Q?K4YiST3VEkOla1T252GElR3x3HX5OI1lx+qUhlMAS/iOtaDh5DnfR0VuQIKF?=
 =?us-ascii?Q?5eBzDuPCl+OGgdD0t+s7tYgtlnzdcW7v0FQugePPJO3/uYuy1mHygA08BnYg?=
 =?us-ascii?Q?EygXasVJN8+Z9aul1qOYffQs0MAczkoxfTbIhcKlBssZOFA0So7HYan6ZJVc?=
 =?us-ascii?Q?Sy+JL5Nsbj+Kg2gFsNRbz+/XuvLBsWua+2jrJ06H5+sgoKEAXnvXQi6pAxxS?=
 =?us-ascii?Q?K5osX+Czj17LlEgt7veJU89sr872Ck7ETqOawKRJvlX5h6ZsAJ+HvYte0muk?=
 =?us-ascii?Q?2wxBQDU3OCpBz0yBo1O/LMbcX9XBS9Y8D/HvHXAEiQ280h9lP6Nrqn7BGcdZ?=
 =?us-ascii?Q?U3OsMrxbeSCch2iYwscVPeFvyLrcBiWigMXPV9t3WMwiXnVlyf4el4owjn2v?=
 =?us-ascii?Q?YRRhivDoQ5cvzxHQ5GMiENHU4FBNlSnFvZjhTJO7R97vCycaDXTrt2wHQY/I?=
 =?us-ascii?Q?nu7YRvYOnlrsiOIGe2mhZiaRWC2MJeF5v22SCSeYswNXWV2s5ZQBQH9dbOqr?=
 =?us-ascii?Q?0qVMTU2PM6FQzbRo7GxVXN2TIBcgyipLl4Zp2aa784vLCURkEPRQxxXZGsKm?=
 =?us-ascii?Q?GMDFeXCwsLkC9hoqZRVC0lSNSqn3EiTOuvF6NIT3546SrhtNk0gIIyKWz6GD?=
 =?us-ascii?Q?NzeZLOxTwuSvZ2EkFDe8PxJkK1Wn8NGShnwBXflv+9SsapJ3Cp8u4XV7jOBy?=
 =?us-ascii?Q?7jxAh+izQ0yALnUnFgNLVQH83BDzA7Jm4BiuZJL4+G8uXevYjYzHuy9U0DAo?=
 =?us-ascii?Q?5sxrq8C0TFntuAxIG2tyUKoFWDG2HqE=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: b8702552-17b4-4112-8c75-08dec36fe182
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2026 02:04:02.6905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yDtqC1RVfLfHXFMaTXKwCEcJ13iMdftFyw1e1xGGhl8x0d7oaCoxIGizJZTGivmvL/a9Cxp3JVvGVrohEZN7/MtVOBu1txkKHzx0jZSEAG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9558
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38021-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,genexis.eu,lists.infradead.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lorenzo@kernel.org,m:sean.wang@kernel.org,m:linusw@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:benjamin.larsson@genexis.eu,m:ansuelsmth@gmail.com,m:linux-mediatek@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:markus.gothe@genexis.eu,m:srherobrine20@gmail.com,m:mikhail.kshevetskiy@iopsys.eu,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iopsys.eu:mid,iopsys.eu:dkim,iopsys.eu:from_mime,iopsys.eu:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 42B2D64C2BC

Pin 21 (gpio19) duplicate pinconf settings of pin 20. Fix it using
a proper bit number in the configuration register.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 14b235727736..34eef79d058f 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -1851,7 +1851,7 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_pullup_conf[] = {
 	PINCTRL_CONF_DESC(18, REG_GPIO_L_PU, BIT(16)),
 	PINCTRL_CONF_DESC(19, REG_GPIO_L_PU, BIT(17)),
 	PINCTRL_CONF_DESC(20, REG_GPIO_L_PU, BIT(18)),
-	PINCTRL_CONF_DESC(21, REG_GPIO_L_PU, BIT(18)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_PU, BIT(19)),
 	PINCTRL_CONF_DESC(22, REG_GPIO_L_PU, BIT(20)),
 	PINCTRL_CONF_DESC(23, REG_GPIO_L_PU, BIT(21)),
 	PINCTRL_CONF_DESC(24, REG_GPIO_L_PU, BIT(22)),
@@ -1968,7 +1968,7 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_pulldown_conf[] = {
 	PINCTRL_CONF_DESC(18, REG_GPIO_L_PD, BIT(16)),
 	PINCTRL_CONF_DESC(19, REG_GPIO_L_PD, BIT(17)),
 	PINCTRL_CONF_DESC(20, REG_GPIO_L_PD, BIT(18)),
-	PINCTRL_CONF_DESC(21, REG_GPIO_L_PD, BIT(18)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_PD, BIT(19)),
 	PINCTRL_CONF_DESC(22, REG_GPIO_L_PD, BIT(20)),
 	PINCTRL_CONF_DESC(23, REG_GPIO_L_PD, BIT(21)),
 	PINCTRL_CONF_DESC(24, REG_GPIO_L_PD, BIT(22)),
@@ -2085,7 +2085,7 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e2_conf[] = {
 	PINCTRL_CONF_DESC(18, REG_GPIO_L_E2, BIT(16)),
 	PINCTRL_CONF_DESC(19, REG_GPIO_L_E2, BIT(17)),
 	PINCTRL_CONF_DESC(20, REG_GPIO_L_E2, BIT(18)),
-	PINCTRL_CONF_DESC(21, REG_GPIO_L_E2, BIT(18)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_E2, BIT(19)),
 	PINCTRL_CONF_DESC(22, REG_GPIO_L_E2, BIT(20)),
 	PINCTRL_CONF_DESC(23, REG_GPIO_L_E2, BIT(21)),
 	PINCTRL_CONF_DESC(24, REG_GPIO_L_E2, BIT(22)),
@@ -2202,7 +2202,7 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e4_conf[] = {
 	PINCTRL_CONF_DESC(18, REG_GPIO_L_E4, BIT(16)),
 	PINCTRL_CONF_DESC(19, REG_GPIO_L_E4, BIT(17)),
 	PINCTRL_CONF_DESC(20, REG_GPIO_L_E4, BIT(18)),
-	PINCTRL_CONF_DESC(21, REG_GPIO_L_E4, BIT(18)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_E4, BIT(19)),
 	PINCTRL_CONF_DESC(22, REG_GPIO_L_E4, BIT(20)),
 	PINCTRL_CONF_DESC(23, REG_GPIO_L_E4, BIT(21)),
 	PINCTRL_CONF_DESC(24, REG_GPIO_L_E4, BIT(22)),
-- 
2.53.0


