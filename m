Return-Path: <linux-gpio+bounces-38544-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ml7ZFgHpMGp9YgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38544-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 08:11:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E2168C624
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 08:11:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=ggxtkQ3L;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38544-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38544-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 08C2B3019007
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 06:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AA9B3DA7D3;
	Tue, 16 Jun 2026 06:10:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020111.outbound.protection.outlook.com [52.101.84.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBB43DC4A0;
	Tue, 16 Jun 2026 06:10:49 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781590251; cv=fail; b=oDq2sLenNje7KSNnyEGwbDaA0lVWR7wsrBV8Lp00hswd3qf2iFnT/T2Lb39KIAX1jTwMjoH607kSs1Orl0+vp83yXkU9jkErcRRB2OuqUGnK6c8bm0R3e4cplxzJuWjyHm/q0IMEC918r03gmy15CVXsryvaetAspbHEMymYRgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781590251; c=relaxed/simple;
	bh=5KQj6q+MpOzVE4myLDMv+nmHKjegoWdIPWcWcgAmh1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tyTlW/P3D3Z0cQRSb/xXn1/jNhTgX18Pt7WpUbFPay4H0AarLQJM/EpsD1z4G50CpzDAO9laqs3hh2I6RuEVzKJztAOvXX8s1Bu6r3Gju/7KeDLniYQDdznoPiOmsPvAssyuOrENDFj2pbfHclKJ16CTeBIjOzxzsDctnjdNLIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=ggxtkQ3L; arc=fail smtp.client-ip=52.101.84.111
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oAf68O0rsjTwzhWuM36lj5kR/ZF5qjXcVawSjw3lR9m82E5lnF3w1mojcxStlSxxwkQY/XUhpqGxgatwKiEBCWvmscOB7QmQWw12B6N73PK5JRNaueFnvA30Nu2oa+X80g4EW7BaC6Nn+45VnXLiPHtTx0rUG+JzoXXU13arZSo2FeRl7kpPn1c8U4bFkDs00gsk6pd5kI+cR2szdxGFGTrkb75xXubZDGqX2kPLyYV7sQtnNMt6kUy1JaEhS7BnWixHjLhU18pVkqZW5kQS1BXfX/fiMEvjFGaP/pVeVDDACJGSqWXeE8kX3uJFQh4asuV0PlMheSi1FbAJUx9EOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CuhwFMoSnGWiixivEEK5jNoGfJdAxYBb39Rky5491S8=;
 b=CZeRen9u5EtMuOw7AcFSeZEXxGNL+pHHOM/vcSPSq79aSC1silqfwmwF9fqC2u0qAL09IjZCd+MeENWhC+iymi4w25oqXCp9wF+V5Gae57b8hU1L7tREEdVJBEEFUnAvGK30O2Xn2UPxZtGvC4+F7cll1WJhyweroueAY0wJlb6PtZkAUydD++P6Jj/0PoTJVoDuhvHyt1v+fEI/2ZJLFvlADYs4Thj2tYeBrs3bxU8+1KhNZ4SgSyeEaIUlEBsAp71zsZ3de8O9gYbQLfpVj9IJV2E4YzmyxUovGBubqJESgwkGUUMC6KGXZTdJECZp9bpJy2lRmX3f0TWKfdSSzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CuhwFMoSnGWiixivEEK5jNoGfJdAxYBb39Rky5491S8=;
 b=ggxtkQ3Lmp642ZnV8lqUQoK2DgwzSCPlLXARCW7xIsb8XLXQBFkK+gfXk/KdlIXDe+scPr7ByhtbjMLut7uHGwOTrtZnUBWk7xSQvYrrT6oMdX68QvOs+TUWGxgOhiIexld/TVcyxkjnWELHau5fHx8kWJjSEbwcioI8We6p4cWdogB1i8izOK+QyazaqUNzFDSTCwR8AOlKWEjF4+6xRTLhkKYd0K8EPPsY6MVSjIunq4ZaMwt6Hd78hfwkzz80RuLs4+ywtvOecyKXnOBvkRGINLgvCNar3Cl7CPu9PhryrGf1fW2OnqonSNyErwGMANEYEMqReub0wAKRN+hmtA==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA4PR08MB6206.eurprd08.prod.outlook.com (2603:10a6:102:ea::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 06:10:44 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Tue, 16 Jun 2026
 06:10:44 +0000
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
Subject: [PATCH v3 04/13] pinctrl: airoha: an7581: fix muxing of pcie_reset pins
Date: Tue, 16 Jun 2026 09:10:20 +0300
Message-ID: <20260616061029.2630777-5-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 23229915-6034-4553-c4f4-08decb6e002b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|921020|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	ZQhKi4nkHBcoCLeJfCdVBjIIKa5QVD57itwaPGShr02f0vy9McecQSEUuCDHPVSRRPuNZ4IYx0S/LknB5dtaUm08zg1e37j/x/kJOOtubmITPv5oGMgC2beS8bphGq/JWHv1iV2G2ue9HVTdTLW4epo2N83nfGyzPcVie+AukbwFXhb5WvOwBQCmJmdJYUCRYNFhOGhzqLOR1a11HRPaYy9G7icUMf50U5rJ8rM3KHzfACvdGCiZ4cOC5kgmjBoh6qFu02lSbbU/l8EDBXO8dBTQEG7N9oolZr8LVw5ntHAYJWtV+QFZ2agRIIzfeOl7Iwc/ceLOzi89IwTqh9hv7xEPk30aVie7OsXt9O+SyYCCk9dAYHvSlG8dfhKYUkMyjAVjyH9lHF+xYn+LAPKIX0hOS3W7lkUD0PC81YjvcB1E7hsYQJlfI+aYpk6480iagWvu6AhK3bus4R+XhB4qJCbeXLHEcdDrotDESIHEJULsta4HzdOEJ//5HG1agDNxudOJgMxhmLVxjY53k8hLWICpiNF4JXniTcchyn0wGCiaWsWEOGLxDpNcc5emTpUEzd1LIrZ5XMaPGRGKfX39mZ3Ka7bl7ZLgV4kfhVzME66+XGkQXzEyE5E5AWFgyKgOR78mEeCHXclJGcIXQbTvCJgrZ2HmJ52OPkLjYQJ0JgBlximWuE0UbGkvUNGYSQv1ErBajcWjoBmVDgy0gFVAYZrMs06nDPrDJI+u0g7XwRBfBmh6gXCMV5ygBIsmY67/BYoC4V9/UghZ0nN4WRXmVw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(921020)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uD+XQdD1i7XwtWVmKMLZ9wo6fXNEC3zu6xM+KdqBisLtZ649Nva+eVeW7Q/6?=
 =?us-ascii?Q?Bju4Dfz+eYwVakOAnwwkTPJoOglqL4iLb2ImP/QS0rGIZQNgkFa/4I/FYJbi?=
 =?us-ascii?Q?XBR6agjdR2lfG2JWRz8uTqRZseZaZbKkKPv6DBzwGUHSwvvtiR0DGlRrh7O7?=
 =?us-ascii?Q?2pai5+juKUrEX27Z3H0cc72NMhmDIN6NGw3KIRansPOCapUvV0nVMRYzCQVE?=
 =?us-ascii?Q?PxcaiObYBfH4MwY+EI9W6HkOql6sMpAYxgR8wboHpw7wTID/97qETILsKexe?=
 =?us-ascii?Q?ony9+185ydLpasH00IgPbl8a2hVxUTGDvnFKqnunaba+OxB2/yPApSPTqwor?=
 =?us-ascii?Q?XAimoUGZkO+DDSV7Yw6qq5XHFSPAb8+DQiitU3YtYfyZdD64L6YJhaaoXzp3?=
 =?us-ascii?Q?J18ry+l/7FsedN9Qj2MtHhVRzoWxlgTmDsa8BSrwI0btQzVc+sVerNHnNhbY?=
 =?us-ascii?Q?2Tfe920wke77ybcKVrfNAGZkkxCXFtpgqPRqOOylJDGOxmoswgM//Lzz9vhM?=
 =?us-ascii?Q?+zZpG2sHX/E9rCIW5r6GH6KsCfhfjrnoaWuR2EpjVEUzm7blhU65D2MbapbF?=
 =?us-ascii?Q?WMGMyICwZ7NCiczWEeyTrX5gpFY0Q9hRdVyq0IMTlj0/5C3lh6yw2NUYwBVF?=
 =?us-ascii?Q?Nf1DD7nP5pQM1wBytY9BQFp1hRQgqu68S2srhxghyW+Q/g8Y/ex9hCH9az8+?=
 =?us-ascii?Q?kbPxA59Y++tcOiw68xV7ChvIuoBEyty97kiXy8hwHSeqqTw17aEr+3oS/4wm?=
 =?us-ascii?Q?xWXVC/ZdhYne0pwYN82NclxbcFvezDl8VZQI7PXE4uR392maxFnAZffUPqDc?=
 =?us-ascii?Q?LH9hH09Ci9e9dnDfBroT3YeATph2/ya4wFNmMp/sFd9BTqASZ5/cByZ/ZRR5?=
 =?us-ascii?Q?Dfeb4PyRiOrXoOQA0O10SyVGJFfrJPMCvhJoBqazAqg1ZrbCkikonpYI9soP?=
 =?us-ascii?Q?AKAhsfzvwsDTh+dzrL1H707sR6eutEb9vsTBvuubMxZc08q2xjn6HHLTjhyW?=
 =?us-ascii?Q?pXlnD3df27CEgJTTjj8QWlLmDN+9Pk6dc0RLESshPrq72xSYhT7FkdUjI7wG?=
 =?us-ascii?Q?2Mt9pvdxlcJKMwbG6sE7o1HgUXrTGBO0TiVnBkbGJjZZnElRk9k3T0JO5A8b?=
 =?us-ascii?Q?H74x9oiLell6JOt//V1jw/p5ftSrr6T4inxzZoyIXOv0Qh6zlXliGCltgUEA?=
 =?us-ascii?Q?eIsanLM58+GewzQg46HJof9yoS+1qO6LBzq5f/YqSJrCdWOkh0xpgJpRsMuF?=
 =?us-ascii?Q?rZwTKrXAnduMYWUiQkoxXhaa451yI3noK+lPTHvy+/G6x1N4y3pglPpGl+KS?=
 =?us-ascii?Q?Osx6aJk1RUXFhR9DG9IKrqh4y9kdwAPPul2c8ZyaFfOR5UZsdIgAkS1ge6lr?=
 =?us-ascii?Q?zZmqpTRCVR0taeUxh6wVG3nYd3dhIZBTaU5JgSX0AFWs+KVH3j685lm8SHbK?=
 =?us-ascii?Q?1rIQWwrIV3BfB/U4Xxq1sx4vCDLSqd6WjovUK0QV1TLqmh1x9ArXoqG7F31A?=
 =?us-ascii?Q?HhohxWyEBeeLcyuREm/VURDyuFN7J4rG7DOQ5BgkCmgEsM0dyYY+qy+C6Ydr?=
 =?us-ascii?Q?WJ1kMFg7wYqh4wCSNuXOc8JAs1LrsznIvbKb4NPv+cwl0EfT9wl00MNJdr6W?=
 =?us-ascii?Q?H5xwf3lZXV3kKOwQPtDKk5pl0khcPwOevdiXTk8ryTsX+jdGzpscBG1RwhG1?=
 =?us-ascii?Q?+XYrjfVqgtD56/xv5DyoQ75pVMhLdvyelsbhriHnxUQBYeSw4as5Qx364kod?=
 =?us-ascii?Q?Ug6iFlG3UZxRU6kvv7QM+HL47osIhcU=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 23229915-6034-4553-c4f4-08decb6e002b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 06:10:44.4861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rTaTGJHnF7k0Q2/X9i3GErxg1NdfwqLpIJWhCEHiKUa6HbIDLOYL1BZgyEyJ0Pw5/1hSs3fF9/7pmQN2zS99S3YmM2IC3NMPEYEkjoZGKe4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6206
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38544-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 31E2168C624

In the an7581 case
 * gpio44 and pcie_reset0 shares pin 57,
 * gpio45 and pcie_reset1 shares pin 58,
 * gpio46 and pcie_reset2 shares pin 59.
but current driver treat them as different pins. This is wrong.

Also current an7581 pinmux implementation have following issues:
 * pins 57--59 can't be set as pcie_reset, current pcie_reset code will
   sets pins to gpio mode instead.
 * there is no proper way to set pins 57--59 to gpio mode.
 * pins 57--59 can't be actually set as pwm pins. These pins must be
   muxed to gpio mode as well.

This patch fixes above issues.

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 89 ++++++++++++++++++++-----
 1 file changed, 74 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index cad56ac3c061..97b6d46ccb2b 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -466,12 +466,9 @@ static struct pinctrl_pin_desc en7581_pinctrl_pins[] = {
 	PINCTRL_PIN(54, "gpio41"),
 	PINCTRL_PIN(55, "gpio42"),
 	PINCTRL_PIN(56, "gpio43"),
-	PINCTRL_PIN(57, "gpio44"),
-	PINCTRL_PIN(58, "gpio45"),
-	PINCTRL_PIN(59, "gpio46"),
-	PINCTRL_PIN(61, "pcie_reset0"),
-	PINCTRL_PIN(62, "pcie_reset1"),
-	PINCTRL_PIN(63, "pcie_reset2"),
+	PINCTRL_PIN(57, "pcie_reset0"),
+	PINCTRL_PIN(58, "pcie_reset1"),
+	PINCTRL_PIN(59, "pcie_reset2"),
 };
 
 static const int en7581_pon_pins[] = { 49, 50, 51, 52, 53, 54 };
@@ -554,9 +551,9 @@ static const int en7581_gpio43_pins[] = { 56 };
 static const int en7581_gpio44_pins[] = { 57 };
 static const int en7581_gpio45_pins[] = { 58 };
 static const int en7581_gpio46_pins[] = { 59 };
-static const int en7581_pcie_reset0_pins[] = { 61 };
-static const int en7581_pcie_reset1_pins[] = { 62 };
-static const int en7581_pcie_reset2_pins[] = { 63 };
+static const int en7581_pcie_reset0_pins[] = { 57 };
+static const int en7581_pcie_reset1_pins[] = { 58 };
+static const int en7581_pcie_reset2_pins[] = { 59 };
 
 static const struct pingroup en7581_pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("pon", en7581_pon),
@@ -882,6 +879,7 @@ static const char *const an7583_pcm_spi_groups[] = { "pcm_spi",
 static const char *const i2s_groups[] = { "i2s" };
 static const char *const emmc_groups[] = { "emmc" };
 static const char *const pnand_groups[] = { "pnand" };
+static const char *const gpio_groups[] = { "gpio44", "gpio45", "gpio46" };
 static const char *const pcie_reset_groups[] = { "pcie_reset0", "pcie_reset1",
 						 "pcie_reset2" };
 static const char *const an7583_pcie_reset_groups[] = { "pcie_reset0", "pcie_reset1" };
@@ -1405,6 +1403,45 @@ static const struct airoha_pinctrl_func_group pnand_func_group[] = {
 	},
 };
 
+#define AIROHA_PINCTRL_GPIO(gpio, mux_val)			\
+	{							\
+		.name = (gpio),					\
+		.regmap[0] = {					\
+			AIROHA_FUNC_MUX,			\
+			REG_GPIO_PON_MODE,			\
+			(mux_val),				\
+			(mux_val)				\
+		},						\
+		.regmap_size = 1,				\
+	}
+
+#define AIROHA_PINCTRL_GPIO_EXT(gpio, mux_val, smux_val)	\
+	{							\
+		.name = (gpio),					\
+		.regmap[0] = {					\
+			AIROHA_FUNC_PWM_EXT_MUX,		\
+			REG_GPIO_FLASH_MODE_CFG_EXT,		\
+			(mux_val),				\
+			0					\
+		},						\
+		.regmap[1] = {					\
+			AIROHA_FUNC_MUX,			\
+			REG_GPIO_PON_MODE,			\
+			(smux_val),				\
+			(smux_val)				\
+		},						\
+		.regmap_size = 2,				\
+	}
+
+static const struct airoha_pinctrl_func_group gpio_func_group[] = {
+	AIROHA_PINCTRL_GPIO_EXT("gpio44", GPIO44_FLASH_MODE_CFG,
+				GPIO_PCIE_RESET0_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio45", GPIO45_FLASH_MODE_CFG,
+				GPIO_PCIE_RESET1_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio46", GPIO46_FLASH_MODE_CFG,
+				GPIO_PCIE_RESET2_MASK),
+};
+
 static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 	{
 		.name = "pcie_reset0",
@@ -1412,7 +1449,7 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET0_MASK,
-			GPIO_PCIE_RESET0_MASK
+			0
 		},
 		.regmap_size = 1,
 	}, {
@@ -1421,7 +1458,7 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET1_MASK,
-			GPIO_PCIE_RESET1_MASK
+			0
 		},
 		.regmap_size = 1,
 	}, {
@@ -1430,7 +1467,7 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET2_MASK,
-			GPIO_PCIE_RESET2_MASK
+			0
 		},
 		.regmap_size = 1,
 	},
@@ -1483,6 +1520,24 @@ static const struct airoha_pinctrl_func_group an7583_pcie_reset_func_group[] = {
 		.regmap_size = 1,			\
 	}						\
 
+#define AIROHA_PINCTRL_PWM_EXT_SEC(gpio, mux_val, smux_val)	\
+	{							\
+		.name = (gpio),					\
+		.regmap[0] = {					\
+			AIROHA_FUNC_PWM_EXT_MUX,		\
+			REG_GPIO_FLASH_MODE_CFG_EXT,		\
+			(mux_val),				\
+			(mux_val)				\
+		},						\
+		.regmap[1] = {					\
+			AIROHA_FUNC_MUX,			\
+			REG_GPIO_PON_MODE,			\
+			(smux_val),				\
+			(smux_val)				\
+		},						\
+		.regmap_size = 2,				\
+	}
+
 static const struct airoha_pinctrl_func_group pwm_func_group[] = {
 	AIROHA_PINCTRL_PWM("gpio0", GPIO0_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM("gpio1", GPIO1_FLASH_MODE_CFG),
@@ -1524,9 +1579,12 @@ static const struct airoha_pinctrl_func_group pwm_func_group[] = {
 	AIROHA_PINCTRL_PWM_EXT("gpio41", GPIO41_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio42", GPIO42_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio43", GPIO43_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio44", GPIO44_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio45", GPIO45_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio46", GPIO46_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio44", GPIO44_FLASH_MODE_CFG,
+				   GPIO_PCIE_RESET0_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio45", GPIO45_FLASH_MODE_CFG,
+				   GPIO_PCIE_RESET1_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio46", GPIO46_FLASH_MODE_CFG,
+				   GPIO_PCIE_RESET2_MASK),
 };
 
 static const struct airoha_pinctrl_func_group an7583_pwm_func_group[] = {
@@ -1803,6 +1861,7 @@ static const struct airoha_pinctrl_func en7581_pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("i2s", i2s),
 	PINCTRL_FUNC_DESC("emmc", emmc),
 	PINCTRL_FUNC_DESC("pnand", pnand),
+	PINCTRL_FUNC_DESC("gpio", gpio),
 	PINCTRL_FUNC_DESC("pcie_reset", pcie_reset),
 	PINCTRL_FUNC_DESC("pwm", pwm),
 	PINCTRL_FUNC_DESC("phy1_led0", phy1_led0),
-- 
2.53.0


