Return-Path: <linux-gpio+bounces-38018-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Qx8tLyGAI2qaugEAu9opvQ
	(envelope-from <linux-gpio+bounces-38018-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 06 Jun 2026 04:04:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FA364C28A
	for <lists+linux-gpio@lfdr.de>; Sat, 06 Jun 2026 04:04:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=YqpYLjVO;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38018-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38018-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 80062303319A
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Jun 2026 02:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67E1B24A07C;
	Sat,  6 Jun 2026 02:04:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021103.outbound.protection.outlook.com [52.101.70.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768C6207DF7;
	Sat,  6 Jun 2026 02:04:02 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780711444; cv=fail; b=q/igRAAv7Mwh5Ol+oMi9hoOqQdKuQaVQ/TGpRwsKf6gJJARLDUlpkEo0D6SMqXvx2a8doV+N/bDXryTUXPi0mLaY3ZikeXsQiablB5YLCIn3UjHhXBNyy3k3Eh2Eyr5IZxJruRKu++2dpUgIUHUNutj0ADx3jGr44MMWVQ52Lsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780711444; c=relaxed/simple;
	bh=Jz8QfvOKa1O6e+F/17SjF7iOoYXHvrCjTUQbdJ+SkFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EPk/ESfO/oQV00m3kubSZOBFd1n99YNh5XbzE12w6iw6tl30uXJlF7u8XgK5wmcuPyapE+u2omxcUN+OboMcGxMjfP4o6O9jb/avi6g6URn6z0ITOy0XjeorPq49Qdh8QwWqYMWMAS90JQTxIQKGfYfNTiRa18WBJ+PuoYLAohA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=YqpYLjVO; arc=fail smtp.client-ip=52.101.70.103
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oqNuDK0C1zrNOIi5Tt+sxY0oY4ytJAumWn/ZgGjtmsNc1zrAdW4C0E6P1CJFKcsIcrPlM6V6qWI2/KTfFFiCtYWIvC1aGqGrFHPyGEnRSxsvaGA1AUAanx+DzIVqOzynMe+C2im3Tnq3aEuerxxRY9Yb+vBgf6KmDL1cmZmsIeQhj6u4PdO4zGEUabMFSZ97Mg4ooMMZYRKL/Tx4o/9tLZzZw61T5SG8u7BQbWr0ueSNpnx9mMdaaApi7asryg64cwflWcXYtRUCRqtugh3OJbr+a2Qaqs3cpi04Dffx34s4E9Ca46DDYTabmHfNa/zinb5VNlTlhXGstKHx7TIr+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iYHpywDiWIA84+PeTmbyRbi5q8wAIgzI2jK56gjrznc=;
 b=ewmlgSk7A3vBVryXdko8WIp7HB/jFm3FtZfElYrXR6hxEtsLmigrKvZkP6FG48HwlaCCX6a+xtkVlV255EhHrR7gPWMx3OID0HFzzxcEaDKqkx44D/FvxQO5ylnT22PTx1klAV8ZmwEdk3e0eSBCau+yd0Ti+nFoXCBpvtJ6jFGBl7ZeyqpvQ5dYo/Z9xvJCi5nhZkSkoXqLXNo+A0/KBL6J4DmrKjL/cV/WtrEuVzy7hmqz6WM3iQY32jx9Fg9mO43HAogX7gbHPCpH49YUSUI2/0R0FPwQ9Ju42EpPJy/IRbRF97OEE1fAn8Tef02UO3PBgyQG01MngOzGg4oMTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iYHpywDiWIA84+PeTmbyRbi5q8wAIgzI2jK56gjrznc=;
 b=YqpYLjVOKtzgRSWHCSCxQ9PTLpyKALf9Gl6Mggwsbky0u6LD9v7CzLzzipcO9r/+Ts/3hc80EGtQxNuhdCbyRlDTN6d3b5gR7BgiZQBPlrwfIINHdmLrxzX0tweHTZt9sVfmOGbjABSLOouvNJp5Ntjm/YEu4I5lA9F4t7RoH+Aj/nhyYWV8rCJWajaWWVf+Jt7IyZd5nXK5Iv1DHhpHQaM4N4FbOiR82KFF+CUMrI9MzfBe+w5aoG4N8fiqBs+3HOR2z5f+SBkVU5s6z01y8G8f0Yp/F3NL0ZM/iWuZfmhvjLIxPNIcX+pmp6n9WYGIEc5Kesm4ddmHrQtxSwD4dA==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by DU0PR08MB9558.eurprd08.prod.outlook.com (2603:10a6:10:44d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.10; Sat, 6 Jun 2026
 02:03:59 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0092.006; Sat, 6 Jun 2026
 02:03:59 +0000
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
Subject: [PATCH 02/11] pinctrl: airoha: an7583: add missed gpio32 pin group
Date: Sat,  6 Jun 2026 05:03:33 +0300
Message-ID: <20260606020342.1256509-3-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 59e22959-59c7-4ad9-8be1-08dec36fdf94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|11063799006|56012099006|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	qWZAVJG7Nj6yvmWAOOBTFiea9PUBf/i8tvj4RBQec3n/Wore06809LlFDoARSroG9X1HmVmgJJ5j3byDRd0T9AoNF/4EclNZ66cL3d4RKsVJw0h8GlrBhmKtjfxUyN7RrdJSmL57ohxWuWavA+TsaaEvT+0ctLDDeAMTTYr0dS1G0ARqOvhs1nBJcZS99uchkrGKey8q5Gy/3zL0nfBAw1JiT3HvGy8isnOoHikDK1VOuGH7foLCxdKSJK2C+MmhehyIKe4dNLCdDIRFquBPtehrioDOvg1Riux+W2pzhlmN+K0G8eN8gbpNwBqaaIwmHGZjap8vzGb/NqYFV7bTbgZMNW5W1sqQKJS7VBd8sKhajoa/X9ogrZV1q2fx2ZidNXN8nIlp4dFRpSwPzS6G2RcLgf2cPm2qZwIutHsA5SPYi3NkD4rOh5kA20ytg/RRXYcO90kXQ64//55E18FmH8pg6LRl1WPSAdsedHewg8LCWGm/kBjq/YJen8kMDRaV7cLOhqtrS2paWTKKsUiVMuwuGCvI/8UovZkvnwjW4Oz6AjtGShhv+C1wPWscf9/WgwOiZF8XQV6nFyeMT9+56rSi3wZBdT9xv5FTf1Y+CLYLjHB8mMpwIRldAyp2XivIuTaZScMwNy3HjSBoghcyKbaM0GLU4SOMBxFaBR3jnYzvfcTvZ2jxA6SnJFRfGZ+s2cukj6CwCmGzK12eaUP8Pc1N3ZXkeTDCJjmdyGxrWt7m7lkg1r8POWlMQq5LCJpN3mKc7anOHRNuBhWRSENLyQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(11063799006)(56012099006)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qKk0ptHpiJQ+gkmuOpILsoINCDtG2Zjb2yQGPi8sfyk8Y8kgS/i7LrrhDhAL?=
 =?us-ascii?Q?KleRh/hLDku9ql5NVktDU4HyqUZIYlWn/nV0+rlcaRWzC150Q+lBmJ0ShFf/?=
 =?us-ascii?Q?Vsk4kFfHXiLjyqWEZJbq6RL6FbwS87J3xj1TJOz3raYI94LAn6/URB6kSCp9?=
 =?us-ascii?Q?5b5ni2Gc05wWGn2QXsXIUA8eTgNWBmAxzH3BansgnH0c8fd62OIEhlu5lDBq?=
 =?us-ascii?Q?PxoCGEncn+ZyTID+N2KjC8+X+RJmZm1KmgkWW9UGZ527+vCSWG50hHh2rFB3?=
 =?us-ascii?Q?+PDYfxN5D5p5eqAnz2VE+kEK2Pe+LzmrWe8GKHecLn9GtGSrW64EzduH8nXs?=
 =?us-ascii?Q?96IQsrNFGzVermwT/fvwc+aevV7vbe3UQdb6xxgxoOYMVR1zW0e69zKWVco4?=
 =?us-ascii?Q?yYqxWDaVgs8EMFG2RCre6gyR+hKpV+gul3yR9fLuXnd9H+HaVRPEIYh9h6Vg?=
 =?us-ascii?Q?1N2T4t43FNy4+GxtOZwOpfcTlW7fNJ85Yq9f0Bu1gffYgnnuNzbh5KfNHbYz?=
 =?us-ascii?Q?0w3JbZk7pD33jdd9h5of205BDxDQEGg/YJa3z6QFNQwaFVbwv4GVWTMloQWv?=
 =?us-ascii?Q?uCE/0yWqtPBJabw9+eC1E+a+ItB8JVa51uqtj1Ht/APUq02LmDAAYqAKaG/B?=
 =?us-ascii?Q?K1/oZds71F82AD1VOCWdWaEsCOoB64ZZ0/j7dID45uI2bG1qnWLZVz7694Fd?=
 =?us-ascii?Q?v0r/sMomXi+7PPvhZm4RLltCd6WNSdDN36wKouLSGv7HFRh03IQd3PFvOtIL?=
 =?us-ascii?Q?WcT8eVf5C55Rm25XrHVRe8TEHkFOlxdECZA5PVl6/QuCWk3zHkzPEs4y8ohV?=
 =?us-ascii?Q?oob5l6HolXi2+eBE4ctEcjASD4rxIO9ATORhf2Uut2IPmaSa33EWobrPtVMF?=
 =?us-ascii?Q?xB+f4H2OTCejEDvobPAXly7Qhgr+HKhg30UYLMdZgYXrgBNpck4wRqKytR8f?=
 =?us-ascii?Q?Wd1ggM1FfWIffYpY/JiNxtWw/1mvQKX+HVLV//I6rOKqSwQPg2VYe4xa1K0F?=
 =?us-ascii?Q?vpDFiZR4bqFfRj1hk+mxLJWERdvQHMaguAI9rou9oGEqllcUH89Y1KdYldmA?=
 =?us-ascii?Q?BQGfcBLe+bkI11wU2Vbak8cTfKBt1MebgFxanIiugyREN4GBjwuw6CVptHHU?=
 =?us-ascii?Q?0EIA8F58kDQVELrcMUIZE/tO3zM7Otm68X34d4ImbUSuLzBVm8Yk4iKK8HF0?=
 =?us-ascii?Q?UkHUnHTbJ9yibEtBNAliYjrPVuPgfEw6J4nrJaUmecQTqa2IhuzfLT0CIjBf?=
 =?us-ascii?Q?ClHzhw78QEKipQ7dJU4+GdfXTrHZ+Xq1ArDzDCbiJsg4GfQwYWGlK02mD2k3?=
 =?us-ascii?Q?KReKVRdXRlVA434wkc4mjhoN0igUjtUefyQMwnwjtrVfue2lOmjnc26ANyeD?=
 =?us-ascii?Q?Ul7GsZCkdpAExOENBvfgbiO1N65NYRVVGf1q8uNi1y8oDTqO/CYviga3xWck?=
 =?us-ascii?Q?TB4bn8KJ0SlHjyA4AnJx8rOT8a8UPWZhUUHv3Mnwd3Hqd6jAcXC2gZz7Ldj8?=
 =?us-ascii?Q?lIxGw0C9QsYwKjE9QLciSYK3kfLuxjzUSpdWTaKBdVer85/BfbryWAr2ImMi?=
 =?us-ascii?Q?tjANRMAva3FguHn9xoaPZjhtDK8T3HbjPJw4dWV4qZM5mTzgTLt8BrkrgDuB?=
 =?us-ascii?Q?ANrfWL7FxPc+DIOkg26yucsw6e0Exjd4FOL8Q+tWTF+zKGyL6GUL+VjMHczy?=
 =?us-ascii?Q?hj7xH+U0LpqVfp7EY4BGHi7qLES4dicrOqXIEqtsl8x6mtC6wBrwbRNQdACh?=
 =?us-ascii?Q?gTMvCAR/5i/ir2WF9hVY4pW6fOX+ad4=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 59e22959-59c7-4ad9-8be1-08dec36fdf94
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2026 02:03:59.4408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n+QAt5rDbO8gWi8NVv9ksejTbW4sZtSBWBzuvDDi8RUzOkB5z4wjeRRvsNynOliWcpQmCu0AtIWli+KUlw7R1iBlSasR45pLpo5fAwPmym8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9558
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38018-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 32FA364C28A

gpio32 pin group is missed for an7583 SoC. This patch add it.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 805166223228..c0aed1b60792 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -758,6 +758,7 @@ static const int an7583_gpio28_pins[] = { 30 };
 static const int an7583_gpio29_pins[] = { 31 };
 static const int an7583_gpio30_pins[] = { 32 };
 static const int an7583_gpio31_pins[] = { 33 };
+static const int an7583_gpio32_pins[] = { 34 };
 static const int an7583_gpio33_pins[] = { 35 };
 static const int an7583_gpio34_pins[] = { 36 };
 static const int an7583_gpio35_pins[] = { 37 };
@@ -836,6 +837,7 @@ static const struct pingroup an7583_pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("gpio29", an7583_gpio29),
 	PINCTRL_PIN_GROUP("gpio30", an7583_gpio30),
 	PINCTRL_PIN_GROUP("gpio31", an7583_gpio31),
+	PINCTRL_PIN_GROUP("gpio32", an7583_gpio32),
 	PINCTRL_PIN_GROUP("gpio33", an7583_gpio33),
 	PINCTRL_PIN_GROUP("gpio34", an7583_gpio34),
 	PINCTRL_PIN_GROUP("gpio35", an7583_gpio35),
-- 
2.53.0


