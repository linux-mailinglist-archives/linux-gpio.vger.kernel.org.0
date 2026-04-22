Return-Path: <linux-gpio+bounces-35375-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHKjJww+6WmEWQIAu9opvQ
	(envelope-from <linux-gpio+bounces-35375-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 23:30:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4085C44AF07
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 23:30:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0928830C91F6
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 21:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB18E37104D;
	Wed, 22 Apr 2026 21:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lu94MRNK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013060.outbound.protection.outlook.com [52.101.72.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEF92D321B;
	Wed, 22 Apr 2026 21:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776893342; cv=fail; b=ka5b31UlfwGA7hmcNgbHFj9GO6pbHvUFUoZohoe/sPOHiUN8vhDNaRADgSWITCWJpKGPaVjodPgmB+Ax3isSRDLII5j8ada1nYGph+vEiy+Xkc24qlg1o6Vd7+6LHsTrI4DtKORLPSATm8ROfnbWklYQUPKSjwilYyDiC6JtQm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776893342; c=relaxed/simple;
	bh=nTF2z7PAtgx0YfXP1d2J2qLUtYV9XCSYOmcw6SL1I7U=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=HKjvAYIh7mkbEqoRfDO7HnkD9x5FNqBwICuWkkCs4gxjnpAZTfuSItfxFK93ZLpjPx7b2h29wb3eUzzALqf+VOSppvLK5DjxPjyh3V617NLfmnes2YgWK/hQsWorld3pYmu/t947wNYDedf45e3Xg7Rs7PmR83oOJdJ3QIwJqzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lu94MRNK; arc=fail smtp.client-ip=52.101.72.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dV8U80yJf6b5H6Fvp2lcJt8seBI0paF6cuiAXJLURlCmTbM/iPoPAemukbKLxO4EkPUhERTkop65wy4dYIVItM1qlzVWiyXqwjTDKPQYkvkAUA0mfGak00nk/YyyQDTar2QpvaQk/NJTLnuLCNtIRx7Z/R4K/A+1AQCjmz6i5OwWxzQkQ/6u/Iom6RYpTKUVTBslH3/uD87J4B0MYMYgMbpd2zhsfthd0TZuBrE0nCc1Yd1DotEpWP4EzaV2l+jxHVPrvXKu2h51jzo+zyimzMoF5/mF+hkWHlrSM449+UUW3vCdMgdKgavVr3xlDvjIyVUQJgszMD5VrNwzhfhPUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gOa0Awtoo4Tqe+7lHnsL9MFZW+Qbe9IRu7HpBlOlc8M=;
 b=tobiqU/000/OdXejPcIqbDoZ6zijioL6VWRknm88HGxUnZERx9OR3q/I/VednvKIvlVqCSxWkLXYrPazWG2Iprcjzma3gHcEyEGm/EwlAUBv9ahGqTcLrDRZmfs+0gayqFK0+CT22uKX8zTCwpJV7OJwaOlAG5HVjkmbmqsmJ+avPbzwTiVscAwjASOQqgkZ6/gtVKGcWE64ZUqci2IY18YJ+OZfkxKe2RMapkyC/vj502/KF1Bf4IYuvtpJeltxPgqFVMaL8kk6GXq5ijTFVJS6uNNUmocxmgXAWyBruhkGZ/PqV7jaAUrGx7W6Umi0hFtFa/7NADItG/ZyIx05/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gOa0Awtoo4Tqe+7lHnsL9MFZW+Qbe9IRu7HpBlOlc8M=;
 b=lu94MRNKvi14X6qESxxmvhyf5hBNLOV9JXZwsgSgfSt0vZeanh3vL4b6vzQcgFbgaVQL7rvND583RUAXFUfLHyOt+A30MVuHHlgA6YMVCoRSfXlY5BLqjNhOgSQ2GkKLPU3Uc/peeNcrMMXlbASmAy9e+pSXjotc5BAQB92yLdPtpIXmoe+juuHYNgON953ckn3+BEz8zct0wygvNQ469pcefdzeUOZtKFAg0fbRq6IhYwCv6bYM+WbFCIQaKDg1S3QxGLrkjIeggUhyz6JbF0dGR6zhtQ2PYA0UBBW0YWBlwnkRIitCvyhbiAi5br2LLL1wvhhPOj2NfEpVmjB6Sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9176.eurprd04.prod.outlook.com (2603:10a6:20b:44b::7)
 by PR3PR04MB7449.eurprd04.prod.outlook.com (2603:10a6:102:86::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Wed, 22 Apr
 2026 21:28:55 +0000
Received: from AS8PR04MB9176.eurprd04.prod.outlook.com
 ([fe80::ba87:1cd1:53d9:fcd7]) by AS8PR04MB9176.eurprd04.prod.outlook.com
 ([fe80::ba87:1cd1:53d9:fcd7%6]) with mapi id 15.20.9846.019; Wed, 22 Apr 2026
 21:28:55 +0000
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
	Sascha Hauer <s.hauer@pengutronix.de>
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
Subject: [PATCH v13 0/4] Enable Remote GPIO over RPMSG on i.MX Platform
Date: Wed, 22 Apr 2026 16:28:45 -0500
Message-ID: <20260422212849.1240591-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0063.namprd13.prod.outlook.com
 (2603:10b6:806:23::8) To AS8PR04MB9176.eurprd04.prod.outlook.com
 (2603:10a6:20b:44b::7)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9176:EE_|PR3PR04MB7449:EE_
X-MS-Office365-Filtering-Correlation-Id: daf015e9-2e57-49fb-844b-08dea0b627fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|19092799006|366016|921020|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Flli0DKa8/VpSNyInWYi5cOg039Uzlx0ldChUJ4ImzFxMXJYKlmeeQm6VkRroXkopvVl1EueLStBKdonHRKfYtg5Vp3vsoPYdbjGE9qvBjegom5jNqjnYHDD72ktd/ZxYb8OA7PffXCUDf+YO17krYJdILe39NZt4cbBo3TL2j2F9Kh2GTO0uJ3Z+tQyoFigIzNIwkL4ucdNR9t9yFjc9+zgDx5BjWopRDClK2d8hKDwvfXYsSSy7OFZr++g2SdVXXGeXPxOYRS7aHcp94aosunRX1Sj4HFZGC1bBi571QgvJY+Nyv+qWdNoNylVnNBGEiy4fg9AfJHwmLgyapIOXIcIYgTeKN8Wf7Q9RLhKOkOZywNBH46n7yqxEO1yXek2yNTFBSPqcNDGuk1SRLgNh6cRhjiXx3I97rN39kv+QVnhEYACHs0n7Tw7PoQDOnHAlth3NV5ysYZ4JAjb2EsExAKD7sHL3tq7bXbsweowWEigVVWBUZmE7GK5FxR3I7SNcdJSv3hk6bjnu3b5AIl6851r6HWxpJ4asUfj5YX7yzXXf8XAf6nT1huPiyoG1Xn7i4Mz5tQannSssjjLFT2IPsM2Gw/8j/QjCGLzg7fqqhAyb5xA7q9YFMRwsOVIUSzB0HKOwSoD/gHSY6+entDwpAdoJ/fZOmiwLasCIuoFI44iefIAEnv1dvR4dOR2aaM8jFzkXwHcZ4wcN8Rr3PJ3in8c9hw758A9CvRWXtO0ZiZA2u/09kBqDN5rdY2m8MelOQJyrMBGfLqxbH/8AnMuhwFEoWSU1OiOEeJEpdIdfP5hpc3eBBtN2p6WoK3IPXy0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9176.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(19092799006)(366016)(921020)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7jqZcojUuK0BJEtbQgivfZZ+HbdXp7ByYmSaj6/5Xp0CIimGOAiSYtWIsxxc?=
 =?us-ascii?Q?m9+BzBasVtqEnejS3SzUnapnL7s4GahL8q5k5WbCd1VMmqnDCA7FBMRNZjQm?=
 =?us-ascii?Q?hAnJtJ5ASblTjwHu/n75zJDw2UcxcNKBrGp779k5fTn0KSn+sOtj9hR+yNsG?=
 =?us-ascii?Q?5rkwQaknlJF3SgyaSmGl1nOE0bMlty8NntYPn9HqFrvHsueLO5G+tYBw41Xg?=
 =?us-ascii?Q?5bQKtU9zkqFHHQdTOWggFW00Jf8vyravvLSAx9ypZ4d5LOOeTovP22i28/79?=
 =?us-ascii?Q?7pKlygef2DD2aJnIDB4un9RDsQr+vjGnKsLr3f286p540ldye8wjwbuWUvKT?=
 =?us-ascii?Q?VE8wltMa6qUOlE9kDBldHRJxHRAddJNAZNtLOI+6wzfcD73j97tToaYSRwDO?=
 =?us-ascii?Q?aKQisSV9kAqt5f43Tx4T7mwDeYtumcXKsuIYB1+RCwzI25eP5yYVrvN5oxEm?=
 =?us-ascii?Q?VPHfIie+4RZ2V51/+2hRQQwfaU6xP8INTIeq92oSuPwCoym9zYiXxXjw+AVP?=
 =?us-ascii?Q?wTW71KNvdmPwHlSLLOHd6mfzyKhWqYPaN7VoLEFBDzvddVZG4l5MUlqy76Nx?=
 =?us-ascii?Q?IfFxoKNjoJNh4HN9gENhDKMXU0Mj+BG9cARq7V2Ne+/osXSnluFNyrIgeBAO?=
 =?us-ascii?Q?1Gghjj0zsRBSplULqGsIuWWg6IJOiNSWjKYp6YBVtpFsgy/ATLgBphX1FJFV?=
 =?us-ascii?Q?wSF9aRr7RJwCh7sx8bJ8SNrQ5WP/684kCe9xXs9vCEB+oe7IbWfufzM0eLxj?=
 =?us-ascii?Q?0+wrFkvrUyiZzVcY8jIVTSnrbHKLRxKu5NF0LHut0/HWltEuYJmnlT8U6Y1e?=
 =?us-ascii?Q?rCTSEHXhNm0F0ww+v4YQnkVeooWY/8Jkxpzdt4l35osIZ2a+VzPveYzYksLq?=
 =?us-ascii?Q?pvW/6Kn4oxlkstVVuxhpSdUZHYQSMcA04kvMaOYcrXfdK81rcC5ql/C1qdYd?=
 =?us-ascii?Q?YVEGvhxfiTLBedYukM7pMD2abyW/wjt2CoGGEAdoUAg9bTqE5iltEmXMtM+P?=
 =?us-ascii?Q?E50RnBbipVA7YxbNVjtiVqKwuutzFeEBSX090Nf1zkxv+a5V/EEMa8QIBR/5?=
 =?us-ascii?Q?wCehDgOmqazriMZ+qXFBOJO1eu0KFYZB+sWPp1R+z4Eu3ubVqanAMurmTO69?=
 =?us-ascii?Q?OzHUpVR7EMegotwJxDzR2GzYdML8g5gSYHtdRKEfWDx62ftrGbUtxsqVLAgg?=
 =?us-ascii?Q?At3tYhebDuYrgKfWxbxubOODdywIwKOH6d/rs1gshOlOQ2ipPH7ye4bAybPn?=
 =?us-ascii?Q?QAVRSaRnt4znI6iwhHYc0voT0ZFhhT8B93/7CvuhDo40hmgOneM+4GQWSzBM?=
 =?us-ascii?Q?+3+NKO3nQqAK/5MxaYLPaM4nwRd5A2KE+JTVMOLba9Pa0et7qkiSGAo24I8z?=
 =?us-ascii?Q?0g3uH8yJpGPj7Dx2n+prEPhsLtttx6i4YMGlcnUWE2Ksgg5WzVO5pf5Xoj4x?=
 =?us-ascii?Q?5MXfJe1L0EjMURYQOjsOZObjMPgPZYgLeY9QYjqjhro3no+6ZnTKCEJ2fzqj?=
 =?us-ascii?Q?fmi6pY7fxlt/HCj4ibuhzYYJBaGSERqqtcbeGgPENQwmb1JJHVXIV2Maf9bE?=
 =?us-ascii?Q?oOww/65xfIIn0aV+5gfLXdikpJreLQ/HLFQCYYSjEIZXCHHGKv9Pn223pej9?=
 =?us-ascii?Q?9JNKxOR6bBfzjObTVZXkP0ccfNNCaNR+IChFuKGSyXBBL3OmyzEhAgiViSWX?=
 =?us-ascii?Q?YMZ6Ui1fx4BEWce6sFGpKPhdWO/3Dmt3HeuozfMMdQ2YKb2284imHEX5WWUW?=
 =?us-ascii?Q?kq0WqSI09w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daf015e9-2e57-49fb-844b-08dea0b627fe
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9176.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 21:28:55.1791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N0cNQtttzVWhkeMNaKqJhpEpBwE1DIgc0/OEMvXCGdlRE2aI2fQ9nqMJWanPiSSZZnkhHKJdbCmn/GkpUjcqSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7449
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
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35375-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 4085C44AF07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Support the remote devices on the remote processor via the RPMSG bus on
i.MX platform.

Changes in v13:
 - drop the support for legacy NXP firmware.
 - remove the fixed_up hooks from the rpmsg gpio driver.
 - code cleanup.

Changes in v12:
 - Fixed the "underline" warning reported by Randy.

Changes in v11:
 - Expand RPMSG for the first time per Shuah's review comment.

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

Shenwei Wang (4):
  docs: driver-api: gpio: rpmsg gpio driver over rpmsg bus
  dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
  gpio: rpmsg: add generic rpmsg GPIO driver
  arm64: dts: imx8ulp: Add rpmsg node under imx_rproc

 .../devicetree/bindings/gpio/gpio-rpmsg.yaml  |  55 ++
 .../bindings/remoteproc/fsl,imx-rproc.yaml    |  53 ++
 Documentation/driver-api/gpio/gpio-rpmsg.rst  | 266 ++++++++
 Documentation/driver-api/gpio/index.rst       |   1 +
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  25 +
 drivers/gpio/Kconfig                          |  17 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-rpmsg.c                     | 573 ++++++++++++++++++
 8 files changed, 991 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
 create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
 create mode 100644 drivers/gpio/gpio-rpmsg.c

--
2.43.0


