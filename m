Return-Path: <linux-gpio+bounces-36053-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBvBDDGU+GnRwgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36053-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 14:42:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A86314BD0E3
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 14:42:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D2343018744
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 12:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D9843D5648;
	Mon,  4 May 2026 12:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KyfqP6dd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011022.outbound.protection.outlook.com [40.107.130.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C0C3D47B0;
	Mon,  4 May 2026 12:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777898531; cv=fail; b=XoR2oCaFwj8v0cOg4HMnSl/L0J1lrTK5BP4SbV73R/YjYIk8pHxTtyox5KuLTkNzjC2vnHFT9qsiE5KQ7ruugV9F9xVTOWWrxiDapu51oD6Xtnj7UMhiDRshaDt+djWG4jb/4v+pVN/8RYAPmpqQbxWjBSQioQuQ4cfHH9/7XL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777898531; c=relaxed/simple;
	bh=KNlUJqs/T7myctoNO8EFxETYpSLdFqvJ5S9vLCuMXIs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rFJsmdcISY8nn+4LgiMOf1dRYLzGC0JG7jTaimlAzhL46ZYlGLKDFa2PvwoqioC2c+0tvVIL8Y1sY0/8T05oreizVrKi/4LqofUrAoJyVO6sVu2sTpqp0t+vuI5HnrYtDx0cL4UME+G16qIgiBcIE7FWEa0ZYVQkbTXATnWZ3Ms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KyfqP6dd; arc=fail smtp.client-ip=40.107.130.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KCYkizqaPWk/0tjgDq9ReoXhiLLxYE4ah1I6nls3PY7QO870gCu9hMpNTOHG3WBXUn/iQv7m8aUSBZHXuiFdrOi9Bx9+knjurWRESDxvA8TPbog7hX/SdBq+e8vGxAgNsIDlDmcN3dUY4EhNDz1l0ILrzJvIMB3CYQRrHtePwuivFM1fPrJreuyH6j5Mfq3KLMDuXRPTAbTAS1lnzoevw4L5no5ZXUDd1gQpdq/3OTpgENKE5kKZo4r/EXfzCwIxanvdowjym026NS3TsA5QmC4MhhTXlUcQyI9EQ/JYmgRBJ7nfRVpYIqXyZ9vfotpSwe0XqH9ku+fPXPZzUfVjnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQXGZR3Uf+6AO+qsKAsGlMy2sQInX+agolBzCZHrAzE=;
 b=PmagMoIG8ewH9HMfxIq6g8Wcxo4RT7eAh0qb3yhwQrCgrdHfs/DMni6+C76vJZM+dkhrFuEenFJvArT3/E9Y/vUtOFdQUZR2ojLrSz6BFXky39CfcDA3B8EddXeX4uj4HXQxuc5qCpfX73e/V7e0poz1msT4CD8bpkV5D+miiTFX1PJtXvm8aBzDx5sip47bSkytQNZLHFCKhmcJuTUacYUI77+rn6SFxmKkOCsMkpbNUp+wlizEVVU3wllm0qc8Tbiys8bKjLHzc4ZtKDkut1Z1f5eQm/K35Glk6MZdedKjiSgPHe25xxjT1d+awfktNbbPWiDvDzibHqV4H0XKcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQXGZR3Uf+6AO+qsKAsGlMy2sQInX+agolBzCZHrAzE=;
 b=KyfqP6ddGPxZRX4kduSQ0Uwls+UrIAcusGrp5P4JzB9xrN56/Yr6zYzPGr2JUnGAZBMAkRmEhJrxB/PfhD9T+PNQoc6ev20Af4Wyf047zCUhAWFV/0meSXaO9IwNnW7pl9PQHmPag0PRGs1U3PefHERMNXI12l//LwKcU8dMMVHrpWovr1p/MFAxH+RP2tA5sLmHrSFLHaE2BUeO0KKeYmaORQJC4Fkb1squWP4GEmXNeqb2sMjXprDrHNpsU8K7NdstL33ULz07znCvXf8vmHz7SxqDBRraOTDb8GFnx0lFY7X5jx867XmsL1d4T62Mdpp3hKN1AkaMCgXAnHxQIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by PA1PR04MB10360.eurprd04.prod.outlook.com (2603:10a6:102:44c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 12:41:57 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 12:41:57 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: Alberto Ruiz <aruizrui@redhat.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	devicetree@vger.kernel.org,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH 1/7] pinctrl: s32cc: use dev_err_probe() and improve error messages
Date: Mon,  4 May 2026 14:41:49 +0200
Message-Id: <20260504124155.3615001-2-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260504124155.3615001-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260504124155.3615001-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P191CA0015.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d5::12) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|PA1PR04MB10360:EE_
X-MS-Office365-Filtering-Correlation-Id: 6352ea49-8b47-41fa-7746-08dea9da87a9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|22082099003|18002099003|56012099003|921020;
X-Microsoft-Antispam-Message-Info:
 v2AnZq0Xo18jc9m+641DR4yln14Rzm4k67QWGNoiCGtAifHPVMHPQp8PW5EJaf9fVmuxtBKBhsUm8AaAXdBLNqMY2ACHcDPSXnATd4OM56eGCxDGm3qSQDPmsjVtBJBu4PM1bsypRwPJbDvt2A279mEPZO+OrnRfWx6ph9m9bxsHqA7TymKCwG7WonpR6k1bNCSob/tXL/VQKrxl9JlUOuJ8ecz5fq49aFrZojhVFor+Orpw/MwT4XP2RSAK4/nSb0ZzB2kpgTvN08nC0ekKpNa72epKgN+7T5zS5OvqIRpcvTa9fVPciwZ1IyOomUjYKyvitsY5sNZg8J+Mx3A93cvkWrn6Ijb8VxplD28ebKdON1QVVdVSxuIoY1KiFeD0DxrYlbscqRmXDUw1V3t3Uu4+2ffZH3QZq8CizwD+s2QHratRxYmiAMS3e/2xUhT6+R2vNqb1FGuAzqezzviqYesVuhhkV/NVUM8YKwPX1rSkTC9Hhbi+sD4FJ3APgs26utautJwlHypnZnfrGn+f0TJdR0vn/0aSdpcmNlfkwIZN+RMsGwexs62nLSkKKUmaErX6BF/8iimy9ViyR6T+S7trDZvVnpmCJggc+3BRIpYuNBsOyr2YGQqrmYLqDJfVKG1hCgVJoAM/Xi97aEsfN2jui1/Tq1gf8drSaevSjCEKFW0uyqKvmHC+Rr8ALq5/OhDo8RaSZhAPfRSI2o/KfoCBksJGOz8YLaTg/vZHDJQ=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?XCTPDokPX4zlrCj+u7LnpqkX8mx5bUke9mIUXnvbGab6OzSuWhTSOhDxVxnc?=
 =?us-ascii?Q?TkQHmYcf3GcmS2P20b1Jmq1WtHZfvX5mn7+bok8eENPJvaQDrhmlQh62DL8k?=
 =?us-ascii?Q?LxNzgtO9RPhV2yZnO9bIznKcATJ19nc77aZZBwrX6tYLEwyzdbYaCqPJPIKX?=
 =?us-ascii?Q?IevABKls6bvzLfXEbdW/IC6wv88LduPF3Tj6VpJb1D1XgzHccRw2EVDC0cHi?=
 =?us-ascii?Q?a/OjHrpRxd28ZvHL9MO261mpoI+BkT8A8fztQdVkznLgfhsdy6UGM8nMFakN?=
 =?us-ascii?Q?Oyl3Nw/V8DU6xS9WWe/vqz6+4qIw3xdD9rsaamRSth4+dHQ2c3ZiGlLU0DT/?=
 =?us-ascii?Q?36iyXzKWDxWXqPlyFHNgI+95VIJst/+d/6HKy9ZUPnMV1+bqLyhbr8IUBFoV?=
 =?us-ascii?Q?OqpeLX+SFitSxdLCEtioa2xMh1GegdIhmyqw+mZIGLJOlMqDOoiwwuf4mTLN?=
 =?us-ascii?Q?SGCdVA54xnkmIFkDqU5vEitPSJ4K2LveW0OxquHYhPMWx8lFcnjJ1YN0Iz/n?=
 =?us-ascii?Q?YOjSo+OgGuaxZ/MkUvNx46po6GCvcrF6NO5IhvwhrAdGFqY2sJCz3p4ysqOb?=
 =?us-ascii?Q?DN86zXHrcTWWjIcncMf5kmien7W7C2Y3UbvnXDPdeGlFG1UzHbJ7/mZvy6oi?=
 =?us-ascii?Q?HPD6Ywbo8rvGBkZq341WCQ8R/lTVQLnQDuIlz0nvLyFnEJjfSDFKEpSYt+uv?=
 =?us-ascii?Q?W+uEKCRhIMWpOIsvJskEVNXCzjOM9h6xY7a+Y4SnNN2pNsCL5B6QPu1tZoWe?=
 =?us-ascii?Q?nekYu3k3n3H6C69YzMerfetrIAl5SaECtDy7TlHpBOpGk87D31qSl2eonnpu?=
 =?us-ascii?Q?OzcgDQuOR50aYYHv9Kb32/47N64ESFHJoDoTz2E4CC4NsTLb8Vu6vijo8Pa+?=
 =?us-ascii?Q?uCkjCww2HapHROty5t4uUMotr++3UHJadAcBdQRvZEN0hYSaqi8/ziiWmM1k?=
 =?us-ascii?Q?LE9EWQRg0NAdAYnvDuXLtQEVE39yecWixHL+PF+u16ScjOdcgn5U8fuiiypp?=
 =?us-ascii?Q?Jgj0apmTMc0sCzKamcsQ8fwHqwjjAyaZg+KyVxmgalgXsBAfFUlilvvYsWRg?=
 =?us-ascii?Q?WVEdb+Rh/8Q9QKLvZ5PNG+ZnMY8kxGYd2k2mssF8w0UGSVoNbqdwKmQIsyz0?=
 =?us-ascii?Q?SddNNtr8RaKOhkFI9HukI9HKyll0h4hLGbKwu4ol9Ogqc2kO69UX18G49CD5?=
 =?us-ascii?Q?sxCUxZ8C6O6hNWGGBhOuaAzbPwaKZ61Z5vIWjDR4f5RrFdLfrgtDQ0itjHzw?=
 =?us-ascii?Q?Aq3gzD6hnSERLNzkG5Fsw14mzymbWaQh9FCCOo8IcUYWXCoz8djXlF+kHwzG?=
 =?us-ascii?Q?BhaTH2P6KBr8kxENVV9hTQnQaCeWQSYrP8W9uSJXEEyl9aIFMAMXuFlU0VZt?=
 =?us-ascii?Q?SlcYbnKqzdlBypa2ASwb5UxZFefGXCLJD4n71RGToelaxxbfaZkX+Hpw+Dui?=
 =?us-ascii?Q?0cbitnl/LzAkHGWgLsb6FNhheCKDm63WUmzj114QP1vVL++WhV1nDp7Z5JI1?=
 =?us-ascii?Q?OUOMzhcoEck8hL8ebinFOIiBDMx0Fk6/lMOuvjkCRMGqh1Pm8wtH90xF/a7G?=
 =?us-ascii?Q?UM983fI/HFKJUYLQgLdVAEnDUdnwC4800sdmINhSxrAyRcI35X/HTF1ItAJs?=
 =?us-ascii?Q?ziDbPDIvsKghwabCxX7KX22YDo6ba3RDJqIZLCcmj7t4bHo0cybcaXKJ5IKa?=
 =?us-ascii?Q?bEzrheqBFyvuQRJv4ZErXKe8hig4iTgZQBWrN10zDsvF9pC9d0C+SHYAP422?=
 =?us-ascii?Q?st06JMKvJR3bbQKqODwXmN77hw99bdCbQhQKuCUCNbkxRToNQp9e?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6352ea49-8b47-41fa-7746-08dea9da87a9
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 12:41:57.8234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +kwEdqL5R/a774BqnI0bvcvws5mYFxmmaleuQNlkqt8S2kyn0d4RpRrT4YeRKwJLNodANU97bI9TI+w/exSn0mWljEz/NZe9QQlnj8QV+HdRhVIixwHq3vYzyci0TpYE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10360
X-Rspamd-Queue-Id: A86314BD0E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[30];
	TAGGED_FROM(0.00)[bounces-36053-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.nxp.com:mid,NXP1.onmicrosoft.com:dkim,nxp.com:email]

Change dev_err&return statements into dev_err_probe throughout the driver
on the probing path.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 64 ++++++++++++++---------------
 1 file changed, 30 insertions(+), 34 deletions(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index fe7cd641fddd..56be6e8d624e 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -2,7 +2,7 @@
 /*
  * Core driver for the S32 CC (Common Chassis) pin controller
  *
- * Copyright 2017-2022,2024 NXP
+ * Copyright 2017-2022,2024-2025 NXP
  * Copyright (C) 2022 SUSE LLC
  * Copyright 2015-2016 Freescale Semiconductor, Inc.
  */
@@ -236,10 +236,10 @@ static int s32_dt_group_node_to_map(struct pinctrl_dev *pctldev,
 	}
 
 	ret = pinconf_generic_parse_dt_config(np, pctldev, &cfgs, &n_cfgs);
-	if (ret) {
-		dev_err(dev, "%pOF: could not parse node property\n", np);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "%pOF: could not parse node property\n",
+				     np);
 
 	if (n_cfgs)
 		reserve++;
@@ -763,15 +763,15 @@ static int s32_pinctrl_parse_groups(struct device_node *np,
 	grp->data.name = np->name;
 
 	npins = of_property_count_elems_of_size(np, "pinmux", sizeof(u32));
-	if (npins < 0) {
-		dev_err(dev, "Failed to read 'pinmux' property in node %s.\n",
-			grp->data.name);
-		return -EINVAL;
-	}
-	if (!npins) {
-		dev_err(dev, "The group %s has no pins.\n", grp->data.name);
-		return -EINVAL;
-	}
+	if (npins < 0)
+		return dev_err_probe(dev, -EINVAL,
+				     "Failed to read 'pinmux' in node %s\n",
+				     grp->data.name);
+
+	if (!npins)
+		return dev_err_probe(dev, -EINVAL,
+				     "The group %s has no pins\n",
+				     grp->data.name);
 
 	grp->data.npins = npins;
 
@@ -812,10 +812,9 @@ static int s32_pinctrl_parse_functions(struct device_node *np,
 	/* Initialise function */
 	func->name = np->name;
 	func->ngroups = of_get_child_count(np);
-	if (func->ngroups == 0) {
-		dev_err(info->dev, "no groups defined in %pOF\n", np);
-		return -EINVAL;
-	}
+	if (func->ngroups == 0)
+		return dev_err_probe(info->dev, -EINVAL,
+				     "No groups defined in %pOF\n", np);
 
 	groups = devm_kcalloc(info->dev, func->ngroups,
 				    sizeof(*func->groups), GFP_KERNEL);
@@ -886,10 +885,9 @@ static int s32_pinctrl_probe_dt(struct platform_device *pdev,
 	}
 
 	nfuncs = of_get_child_count(np);
-	if (nfuncs <= 0) {
-		dev_err(&pdev->dev, "no functions defined\n");
-		return -EINVAL;
-	}
+	if (nfuncs <= 0)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "No functions defined\n");
 
 	info->nfunctions = nfuncs;
 	info->functions = devm_kcalloc(&pdev->dev, nfuncs,
@@ -919,18 +917,17 @@ static int s32_pinctrl_probe_dt(struct platform_device *pdev,
 int s32_pinctrl_probe(struct platform_device *pdev,
 		      const struct s32_pinctrl_soc_data *soc_data)
 {
-	struct s32_pinctrl *ipctl;
-	int ret;
-	struct pinctrl_desc *s32_pinctrl_desc;
-	struct s32_pinctrl_soc_info *info;
 #ifdef CONFIG_PM_SLEEP
 	struct s32_pinctrl_context *saved_context;
 #endif
+	struct pinctrl_desc *s32_pinctrl_desc;
+	struct s32_pinctrl_soc_info *info;
+	struct s32_pinctrl *ipctl;
+	int ret;
 
-	if (!soc_data || !soc_data->pins || !soc_data->npins) {
-		dev_err(&pdev->dev, "wrong pinctrl info\n");
-		return -EINVAL;
-	}
+	if (!soc_data || !soc_data->pins || !soc_data->npins)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "Wrong pinctrl info\n");
 
 	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
 	if (!info)
@@ -965,10 +962,9 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 	s32_pinctrl_desc->owner = THIS_MODULE;
 
 	ret = s32_pinctrl_probe_dt(pdev, ipctl);
-	if (ret) {
-		dev_err(&pdev->dev, "fail to probe dt properties\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Fail to probe dt properties\n");
 
 	ipctl->pctl = devm_pinctrl_register(&pdev->dev, s32_pinctrl_desc,
 					    ipctl);
-- 
2.34.1


