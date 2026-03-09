Return-Path: <linux-gpio+bounces-32853-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GH5CIvIzr2kPQQIAu9opvQ
	(envelope-from <linux-gpio+bounces-32853-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 21:56:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDE524132E
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 21:56:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3AD153009503
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2026 20:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8C2638F941;
	Mon,  9 Mar 2026 20:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="K5NN88uk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010066.outbound.protection.outlook.com [52.101.69.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA8836BCC5;
	Mon,  9 Mar 2026 20:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773089768; cv=fail; b=QJZ42gbiUJypTyT34RRBZwFIthfIRxDZUPjHlT8FyHhUy5zaA+cPJI8/3jF/CQJcL4DhegvzQFAB0ZcrqYh3gUonxb4ClT7W9O8rK/Q8TdkmZ3khhVa4WqUr9eFO95mds0gGQ7tGzACzklZPKMnLG76b00PpGLhwcMeWqIfHHFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773089768; c=relaxed/simple;
	bh=1BNpoz7yCgckBSgzGLL1gAPmsYh8SkxOVnaSSr0rgo8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=kcQLMz8K01C8VQfu9YtoLkmxGIYcYjnycLy+pp94wsBJjL4DW0hne/6is95XFFVqVhusNYECjcBsQfy6a4mynWTpksXY6l4SrlTZhhEzNfR1dEHQKgApyDvLoUKc8cWHhsJYprRVrHw+sQBVjJW2KH9dba3J9rNUdQ7c9ApgpDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=K5NN88uk; arc=fail smtp.client-ip=52.101.69.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CRfVLBjkc2qwd/QWCaEcKh2ysT2JeMsvZRjy2t9eSVp9YlBOhuGrPe8/AgAhpMXMYj7h8AGjCrbiANOswHi6jfDMGIA3VViDHlPJ3nV/omLvPuCcAi1nF3tW7rNJ0AjN16nYuNWGd+AW81qurFXTaPX7qG0oT8+8iAuK6iEXYX731RZtGvLRnPGd1cT5pRcs1yEWnod+kOyHlS6dpk1TXDD0EWh9yF9JkLXwtrZ8MtKFiZLN1eqQrcqhPCycdPRO7nLYpzLVoLXmdelg2/pHUohFYdgMpCzG6QMjz7rLSA/W6lKXhMAoeTVtb4aRXS3upDXHRK4EuElJ7D/skF7ytg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yo4Iu7pqNqeY18plYbnsoXWkHfxiMtT6Jwt3m7mNkjo=;
 b=DbspywBXP0m2kC287sz5N6qwl7KYHKtwUHtSWd2tWT1iW9ZDxw/0R/a6Gl0kbtSqB5BH5KCVgDThP67Z5ABjkOI9Mx6qY0DFQKH4r6wEcSEJ/EhzpRT+8Io64BmN/O+c42b31jd2nsWMuxEclBU5hSPjaP2wP6+pKGNQUIaW6tD7Ml0RQqgVHeFs1SuZwiWU3k2LfNKiJDoONnP4JkS/S1q4EcBgos7WexAkrvvPsE5GD6AKDit+qHge8Jdh0gFXma+mSgAD35jw6I1DgcM7RRMGgs6oZ2MmPrt5rxmjuZ8nN8HfgK3SZAINbbvinyFAfAX6Nfs3En8HOww+sIg4Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yo4Iu7pqNqeY18plYbnsoXWkHfxiMtT6Jwt3m7mNkjo=;
 b=K5NN88ukVgQvTwvov8ogBfvusRmrfOUugBf/O87jBFfkm9iDqQunLq2YBYEEwueBIkEMZMtER+IgXkbZU/ERPrBos64sjj5l1OFDzyE2QVQZWtL7CQR3T6MorhnGGNi/JNvScJJ3MSot4tA3YHVZMDZf7NAcTdJXA8J359EVfvRgj8HNyZcawZWzAP1O/Fuefa99GJJWIkjvhgABpzOu83E8WIhO/k+bwKEMFVQtiRJAnuHkEnm9w89hF4NeoWb5+7hDUepQgUcmyAK+uKfkr6lJg4bU0bcv3DXrptNTvwJA9nu/fSYBaBZoR75nMloTUEvzXM5a7k3YB3uiFhZe/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DBAPR04MB7335.eurprd04.prod.outlook.com (2603:10a6:10:1b1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 20:56:03 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9678.024; Mon, 9 Mar 2026
 20:56:03 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	arnaud.pouliquen@foss.st.com
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com
Subject: [PATCH v10 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
Date: Mon,  9 Mar 2026 15:55:27 -0500
Message-ID: <20260309205532.1794202-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR12CA0016.namprd12.prod.outlook.com
 (2603:10b6:806:6f::21) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|DBAPR04MB7335:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b8e03b6-6aa1-479c-580d-08de7e1e46ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	yG7cJ96dM+YyAv+wgW/0EU5AizpyOr2e7QMAgTs3ngTHX/17kRfWYrRwDF1yZsJmQkCGxYFnZvSBbkmc/dJVpPmiVysbi71bZCKbfjcnQ9efy6ZUfqZlBqJaIuzBxoqy67U/71DulL6UjUEv7ErZhTLtdD5JSeZuAcgqVLRFPRhME4aigbIvqmE5SycdsU6LQuFRYbeagyY72pr/gCaJiXMms++hjWPzX4kIi+2VqisDVj7g4EGkoFX96VyCUw3nfeO3wALD81Wvd60G+BkhphbC0MjdTmrYWKOo8kCEMAkqfQmq5oxZwFWB/pAcs4d7x69MfqZJ/i29IUXHkI63Xx0Jt2NrhwBiNYJevYgxVjg4k+upev8qEzGGDYw70sgU/04MC5xV7lm7ChYNvcwTebijqpWDKoe5nml7Kd3Cb9qzu0ilLPL1xCHtLZ+M8ZFfsT5j9C+03ovCRx1JVMle50t1GOrWlIro674C04ePz2fFR8K+JxxtoPcG1IijPbgkOm7zg/Knr6T14lWj4bBlpo3AfH2E13plLmvcGV0+9kTy9QAUJGTH3B/mGJIhLXjcErjO7o29D3KqmFHmaBP/MKcg4Z8RTviE2/3moAaO3TkS6BrwWgvN12y7eLoPLi0kI9oVEeVFy0OmvMiGuo3qG9Nhs7AxULXU2uympIwrpy7shR9zPlvur1D5Yzz42wNcZMPnLkQo6S0tJvXRkwZVOaK/tOjczS8vLsIJTLY63d0iFsAwhzzrOV3RoyKRWJmmG82TMYWiK6vUEaJ5NLwOtnPBMK5ZpoxQ5+UJV8tnHH6jPPXnJ/jMP6HTy5K9B6qy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WpvzUtPj5FC6CCUlocKFNuMErUIWeSOjSO5rvbclWShkHH2uUfLryI5NfTna?=
 =?us-ascii?Q?AOegN6VDrUntSnzok0HDYdcZRE+TcLxd76oW8RuojfQA4Fk0VpCP9y57sL/l?=
 =?us-ascii?Q?bcSDO29sy7onnMFbaWTIRZ8XlxGjcSDW0tL5h9TIGpMglh/x+nvwWutuyrM+?=
 =?us-ascii?Q?8Ywpq4tzjlj0qreq1mcuU1CpLAzMx1ZB1DovtCcM0R4ihbru7P5Ikjbn+Pm0?=
 =?us-ascii?Q?pbFHrDOw2AJ27vmmc+x5oTj0PkCeagOBjl998SG+HaLFZiW7i2vKs6WgEXlU?=
 =?us-ascii?Q?aD0XuWOJIvhOYg9oXFqaAcL00s5BalbhN4htLYKKcgltJqQT7hftacYr4FBk?=
 =?us-ascii?Q?WC83gBPBt9qsNXVidYAntX9WNb8ui99xyMHDGNewQzIEbjOydfsE88VMY1vx?=
 =?us-ascii?Q?C7iIrJXVfpY7w8hknIqruzsiqaIFwL8Cb6fHbH/EAoDTC1U0g1CGqktKsdUj?=
 =?us-ascii?Q?OujuNxKLraKdzf68FlCZLSyzS3e69WBSLAIRqa4CKlcSsa03i6kbyKDocUG5?=
 =?us-ascii?Q?h1kU/ZNM9EczeIXnEG8kEBVvMhxMGyBfYygw36MO8r+GNaRHJyfNaehAFaHU?=
 =?us-ascii?Q?iulpn+0Odbd9ebTAINMJlU/4X8WgbEgjZ2L/Cvgq5R7A/jrbcdfyjXPuEpEc?=
 =?us-ascii?Q?ZeA3ua1WVpBmWgXKFtQxjeMJyho1ldQIt8EMxNwHayjlDYHxRffpQxDqnZBi?=
 =?us-ascii?Q?uVFS4i04XEnkTNKzZr66CaLTzrv1Ueir4PwNjTWPbiI7YBS+Pcxf81uLkxwd?=
 =?us-ascii?Q?uj9vF/WlKWQd6TRIYOmE2np5QbCBtWcNCSZ/bxA0l7iozdrMbtq/PhXThg1Q?=
 =?us-ascii?Q?7AaC61weRCptmgIh5decI4+2SF/h2pdTp7NG3GA+T11I+edCgfcgllMKQhlO?=
 =?us-ascii?Q?0NQ8b3ErqLBtYWQnELtraXNOOXpoNH5ruOygEn8duzX7Wl4LpUNcv/RrLK0q?=
 =?us-ascii?Q?vUfr4ZVn40fdEZIaoHmcD7YsTGDbqcRgPn4ea8r4GYjg+LvEbws4WgKmXQs/?=
 =?us-ascii?Q?cH2LqL4+Cn9eJJyUClciKqeJoDEbhN0r/UXZX5qPC/k21OyRly7KtaYeOcfm?=
 =?us-ascii?Q?SVd1ZVcrFVmBpTPsgb1mOSKwLLZCXOX5bW1OjbLgEeMPhdQov8dkyp0egu/Y?=
 =?us-ascii?Q?Sc1E8EDbzccCOGEpvqtYMnDYUSpnXvm8KJ2SeVVU6bGU2IqyE0JCjyBuXpP4?=
 =?us-ascii?Q?MUdTvX+/EsXMnVzUW3Wg/bD3SyETfK3YYiP+HRo3DtfNyGlIHND3hM3BK2KP?=
 =?us-ascii?Q?zeDzvCGmlLtaoF0sIMmom4GPWbIhH4kAKc6ZyahbTcXfAIuMfrJ2MVlHqlcx?=
 =?us-ascii?Q?Qe1rre5TvaCMF14UqYckdQ+VMHaLZQ4YAf08pNWcUyUuJeSOHXDOVzFHi7cr?=
 =?us-ascii?Q?XATHjqkyMSBqyQuOtcn61m8xvRxdhijeSk0Yt8Mq43laOJA26DRGhG7SqGik?=
 =?us-ascii?Q?USbI5VK4CexHmzUdBL93rprcyvbqKPpEOGzmC456DGZIz29acTVgCeZ+aW5/?=
 =?us-ascii?Q?gAiQAa3me8apVWCTvVHNixtt1FrCEqUGEGtT91rnO6X2AXRE1oeY1JSah+Qi?=
 =?us-ascii?Q?7QvWADnGoBquFgS7q5aE/wVSetEj5tPABS7nNymotQ4kzV222jP/SIHs/YEd?=
 =?us-ascii?Q?6pRpum8L+t6J3E0poEPSBldTJu8uAWumTnTi4obzrQSgSyVtSWQzx9DkwUWQ?=
 =?us-ascii?Q?ChlgYKLvPdfM9WyBYRpE/1U4RW3NNof9RwLwynvcL18wx+fXN4GxjTboQb7Y?=
 =?us-ascii?Q?XYFCEQ6TPA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b8e03b6-6aa1-479c-580d-08de7e1e46ab
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 20:56:03.5333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vf2JSWHzkwCXlXLIhzIToMxtu8mHERSHBUU2taR+oqvA5mz80rR0RYzsrsbjv+w3XKcw1RgXjrLz7gOT/tI1hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7335
X-Rspamd-Queue-Id: DDDE524132E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32853-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Support the remote devices on the remote processor via the RPMSG bus on
i.MX platform.

Changes in v10:
 - Update gpio-rpmsg.rst according to Daniel Baluta's review comments.
 - Add a kernel CONFIG for fixed up handlers and only enable it on
   i.MX products.
 - Fixed bugs reported by kernel test robot.

Changes in v9:
 - Reuse the gpio-virtio design for command and IRQ type definitions.
 - Remove msg_id, version, and vendor fields from the generic protocol.
 - Add fixed-up handlers to support legacy firmware.

Changes in v8:
 - Add "depends on REMOTEPROC" in Kconfig to fix the build error reported
   by the kernel test robot.
 - Move the .rst patch before the .yaml patch.
 - Handle the "ngpios" DT property based on Andrew's feedback.

Changes in v7:
 - Reworked the driver to use the rpmsg_driver framework instead of
   platform_driver, based on feedback from Bjorn and Arnaud.
 - Updated gpio-rpmsg.yaml and imx_rproc.yaml according to comments from
   Rob and Arnaud.
 - Further refinements to gpio-rpmsg.yaml per Arnaud's feedback.

Changes in v6:
 - make the driver more generic with the actions below:
     rename the driver file to gpio-rpmsg.c
     remove the imx related info in the function and variable names
     rename the imx_rpmsg.h to rpdev_info.h
     create a gpio-rpmsg.yaml and refer it in imx_rproc.yaml
 - update the gpio-rpmsg.rst according to the feedback from Andrew and
   move the source file to driver-api/gpio
 - fix the bug reported by Zhongqiu Han
 - remove the I2C related info

Changes in v5:
 - move the gpio-rpmsg.rst from admin-guide to staging directory after
   discussion with Randy Dunlap.
 - add include files with some code improvements per Bartosz's comments.

Changes in v4:
 - add a documentation to describe the transport protocol per Andrew's
   comments.
 - add a new handler to get the gpio direction.

Changes in v3:
 - fix various format issue and return value check per Peng 's review
   comments.
 - add the logic to also populate the subnodes which are not in the
   device map per Arnaud's request. (in imx_rproc.c)
 - update the yaml per Frank's review comments.

Changes in v2:
 - re-implemented the gpio driver per Linus Walleij's feedback by using
   GPIOLIB_IRQCHIP helper library.
 - fix various format issue per Mathieu/Peng 's review comments.
 - update the yaml doc per Rob's feedback

Shenwei Wang (5):
  docs: driver-api: gpio: rpmsg gpio driver over rpmsg bus
  dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
  gpio: rpmsg: add generic rpmsg GPIO driver
  gpio: rpmsg: add support for NXP legacy firmware protocol
  arm64: dts: imx8ulp: Add rpmsg node under imx_rproc

 .../devicetree/bindings/gpio/gpio-rpmsg.yaml  |  55 ++
 .../bindings/remoteproc/fsl,imx-rproc.yaml    |  53 ++
 Documentation/driver-api/gpio/gpio-rpmsg.rst  | 266 +++++++
 Documentation/driver-api/gpio/index.rst       |   1 +
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  25 +
 drivers/gpio/Kconfig                          |  32 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-rpmsg.c                     | 743 ++++++++++++++++++
 8 files changed, 1176 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
 create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
 create mode 100644 drivers/gpio/gpio-rpmsg.c

--
2.43.0


