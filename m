Return-Path: <linux-gpio+bounces-33398-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QP3sEepstGmWnwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33398-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 21:00:42 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DA60D28984B
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 21:00:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 775083262FC0
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 19:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E17C73E123E;
	Fri, 13 Mar 2026 19:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GQfG3skY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013028.outbound.protection.outlook.com [40.107.159.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2641A683D;
	Fri, 13 Mar 2026 19:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773431934; cv=fail; b=jPBUQYBhWJDpe2rZmCs7RQROjkYQXYJX0K1+eNkBu8lTkGIHcrk4sYlcUFn/E7Qcp3D9RsE3zGHmREFKsUSlfIGqwQqEWRjy7Vx+Y8rr+MU0UyrZSuNF85tJ5sYbs/OvMnWaD1awwWXKove0WXLi/dy5aZxiTF9IN+7AIcnrvmk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773431934; c=relaxed/simple;
	bh=42qrrPFZN447gOdu57uvW2fMqKaXO0goBcZHJNkOzsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f2YJwZuIlNBkmZfUBP/16SAyoRjhxk/rE9jhywS6LXkr/OT+o14K9245F1TllH3tHUuJ15hgiVXKJScXwxwvCEDBoKqEM6YHUr2528OiOlaHfqiak4SxT7kQmXToSM6LjEKgzmvwvmiabDT/uJZMa2oKk4dRGvxA4h1srC12E5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GQfG3skY; arc=fail smtp.client-ip=40.107.159.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=or42BPCMMOH3/mPz4cdt4ZbeveuOzQtviK/ksHuzBxy9xduzgUWwsRH4mu54T+1DsVwBiuQ3Q/GG8xxlafDFnkW1G8XjwuXBC9LHHiQYwVirRb9DvF6WjAQXIo6kPPwNq8MMcshm5iCHjuhjrSMS+xfdKt5CHX1YmQXpXSMM1YLVQMnMhVtSxqrBkXjMiKEENgHJ6D0rqi6WQafYP9RzTq7j/OehbUlgn6pgcReRHlMAqFTNKpXVGZ8CsgNfAoSNfdnVZxV9fVcBnjLnm7oGBbd6+op07akfKwECDtNqSLmj9DlmNM5g/dEARV/XtThZ+OJovtbXTbUuArVOu/3Nyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5bmtcR7bVXN1iiCY+yw0WNRhUOLkt1prkpCXAQSLeLc=;
 b=jjNrYXkV6OaUKSAqpbcacfgwMJ7fOQ+GH3LzMKVYFNw/RC60hkGj5L2xw2xoLmc6AKOWMXvOovEPiVCm47HsezE3zEzc33OBlXccA0fAbrULSDZ9FDN552bkdDWkiFwJcDuIQ0/tBhQqb5zYH7VvU6A0nrs/9McO1gc52cRpRiqdW2lEyonvdyyulfs8177m0AMx9CRiJrsGPhgtrGfaKab5nfUR6DKVxoALk9+2EXlHCfVZN/vjiYGEFxD8QVlmyuFfCuq/Mgh2Lr24lVGSaXoke3QLHVSy2zwS1n0qBLfHaWfb92ylUjneuIzn8DJDdpS6mCyR0iFQa8sj5o3Vgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5bmtcR7bVXN1iiCY+yw0WNRhUOLkt1prkpCXAQSLeLc=;
 b=GQfG3skYxvHUgVJKqMpTy/rrEd7Me2kVOlaQBgZaspDBolRNHBCdhagSd5/fD5Ah8qcRtzCD0mTwZgLpCXr7Q+HZQ3glHoys4OErssQOG2QxkLpdpEjbyoMzLUTEs3k8bZo1icmiXKGr4pLmzfdTB0axV8nGXoBP3QG8/6UVA5wx7rQgPUsx9Xzim/EZc2IHmGM60oMafkXgs6qCDgGgtHrC59ahqbYEdROIK2Gi/nPiAmbTxtYVYgHk40D1FEYPgMH//2TCShZJfRlWSMwK+Irx0slwErDSC1Pa47H2KmOXZY1WSIzdKDdIw77Zk8N6MkYm6x+UAoiIn4Jt7Zc73w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AS8PR04MB8755.eurprd04.prod.outlook.com (2603:10a6:20b:42e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 19:58:47 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9700.013; Fri, 13 Mar 2026
 19:58:45 +0000
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
	linux-imx@nxp.com,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v12 3/5] gpio: rpmsg: add generic rpmsg GPIO driver
Date: Fri, 13 Mar 2026 14:57:59 -0500
Message-ID: <20260313195801.2043306-4-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313195801.2043306-1-shenwei.wang@nxp.com>
References: <20260313195801.2043306-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0019.namprd21.prod.outlook.com
 (2603:10b6:a03:114::29) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|AS8PR04MB8755:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f350ac3-9122-4112-22ec-08de813aef2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|1800799024|366016|18002099003|22082099003|56012099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	gtwY44t4A4/H1jpLPvGAMdmiozDj6TRQ/se9kl19afA2HQoFr+bs3s6ObNAc/bvKo+ysVnQRv6uYwf3D+vg1ddUqcGU1ig4BXLVxOkbZ+7xa+aZF5wCC97oUcPnXCFDFk7dbmP5F6QSuVi7RB8c9gWsu8tmmHGvB0czpPqfnIRkO8mb/VGuGqBPOQRPMH7UFjwzZlEKpB/A+WvD2ytO33FmfzIAOGDr2Ao30SBT1AQwqC6V04+zCVa2sf1+yMRV2Hm3tELUNbuF0tBwHGFgY0uRqUzi2gZABotATJoxuVDzWmrjNJav7pCCrWHD/2FvdLitQFd8n+v+HNWhgu4hZCUNHpR5qnQalEXN6pp4W/sqEV/rwsHtMF+AIEq+gWNmqb/11pc9IUeGOoZGWc3b25niqDCwmK22DmrK5NhlSxVVznMuBLzH/FB9JyIrOh11nnOvePu/HFa2n13squIqNAZIrMn0/wgf88ZeTY+587rpEWO3IhPU2FYLmzcOuANJ6b47mkgrMpbCL+Srhh1ERMclFJ+RmhApQFommO/TpHtD0YyqLHr0lImR+STenCTbsMAGRu+YJr9LKYJJufgpgZgkC/ws0JWoJZBOIonpx0pBU1ZXuETBjcZA07CM0V24D4CWgE+wQUzeIDVrRwhZCWyNkLYAnja6DlS8LQiDHGeGYNU3dUFzGcu1EoNGyP5fJa5XdRKNqlhdrlOoRGMnDy2vYzy+VNlUDmdWpmNNHE3cum7Qns59t+6TbYs74Baeij++3K9uKJkUz5hxBPvLHAQSAfhUEuUErksmFEcWoplLGDcFpzDpOJh+feTE5VF94
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(1800799024)(366016)(18002099003)(22082099003)(56012099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HyA8+zTbCNTEQJkZFNWLjVwbR201PcZPNd0GWxJZIB5DWYkXjZTOK1ZtEAbP?=
 =?us-ascii?Q?KpA9nkEyFy4U8jCaBrViD6IuvPgvMSs+evTmmJ4Sm4nP9OQzxtZhEkWoT0I8?=
 =?us-ascii?Q?PsfgEu2pXgrEp8ADWA/ha3a9UGWfzOZZWW9Qi1BINcDQouGeOvzB4eP1n3No?=
 =?us-ascii?Q?5Wzhe5V5T3jCzP2yttpSPyhhcESl7ZKh2HhKnBcUHjquQnpYXvQDxaAI+CSF?=
 =?us-ascii?Q?Y6hGtGrlMewr3gqsjYrOk8BNz7ya7F3zNI7N1fi8SdbAKa1YMVZzik9pDdV7?=
 =?us-ascii?Q?0+SAUQ7B54DgPusyQB+HwGG4r7a67nEGO4VyZkAaVyODe5vbGYPXqD48u7q8?=
 =?us-ascii?Q?74yyQ7IzH8PjtmphFgzO/CCUnVAYFxu7Gv8vh1dq/2zzYcBhW2jc01Ai//zV?=
 =?us-ascii?Q?S44Iyf/5pKuaD0zFJvy+jUE00rJSGdpYzVy4pi5U0QsxdtfWpRr7tYn+VS3g?=
 =?us-ascii?Q?9o7vXIL+b0OPOlKZyaKY5Nnb2uICKLoUGiMUs8RB33RMPXD8ZkaqbdPkMG+r?=
 =?us-ascii?Q?ExZu6ryBzF9NEhRzFFYfc3z4kQ+zeMvmO46b17qqJ1AyXLlNzABmyGIesk8u?=
 =?us-ascii?Q?l27MdNuTbKqFIhl2HS1h67UGrvRR1+6fiHjinOmhZCIhAQFdL4JmKyz0P99s?=
 =?us-ascii?Q?NqhtFJZzDiK9gQwLqunIwbWZiDLgy+lwCxT3XZ9nys4zf3XeXhdmWcmAjUIp?=
 =?us-ascii?Q?57XoSoynz23aW7s0+pPy8CTfKqihd6UQ+oKoDBy1Q+unKOJn9J8qX8n3SdKg?=
 =?us-ascii?Q?WJvOVZSN0PrkgM188sl3b0qMXp8p0rusvR/wOp4NDhBbxOLe1NWXrmCQgzmt?=
 =?us-ascii?Q?watkeN4bapPxCiczt8QQwhvenvkpr6Za/lNQSPCPgBg30PjaJoyOcBhXE99Q?=
 =?us-ascii?Q?xl2o8e0v+sGOzu3e62lO33o4cjzHDgZDmCNKQtVzQCRFQ0fjut9wEWQq7YSN?=
 =?us-ascii?Q?dATdKUiPg+LQs6NEGpH3si2U5IVnhPEMpzr8NgTI85AuiTgog55rkGe3x4mQ?=
 =?us-ascii?Q?0LzZtTdm2ne8twc5zsH3G9nT5JtOS7yFI9tObLz/FqGdyotYCxf0TRzamJ3f?=
 =?us-ascii?Q?LfzJ+XFT0tx+0+CLmCImoYD/erPlJQL+vvAQG1hHLEcH135e0wQGFShFiidw?=
 =?us-ascii?Q?ZbdDUk1QeW/5zuFgIlVBytolzr0SuxCBc3NWLyX+BCNGmSiORnQjJMdkjXaM?=
 =?us-ascii?Q?10xxT2TJecYoBkoBUwdQv5EyQQL3i2y0NiVSRxCfcPZ2SN/+Co9JClcnOfDq?=
 =?us-ascii?Q?xK9NPpUSiboNIHxTD2Wn41lFjKrSPr7Rq1iAp8LiK4DlMIoMFIfIsU7KOVq8?=
 =?us-ascii?Q?7J6sueRFs3NXhMCczH7ZxI2XLoZQyeC7Ie44mj6fa7nxkN/XCCSDLW+2oySC?=
 =?us-ascii?Q?o6MZ7GOXMxd6dZ64LwEaVkxn2Fehn61rsVHcm1NhSRyW0lxdfnd0zKONQmnm?=
 =?us-ascii?Q?LBLzljC+7+5atR0QpbiwJVKNMh66vH6Hr26xn7NNbnv6s0QBKl6E3jrN81+i?=
 =?us-ascii?Q?TXRblNXuxbhI0iJnk8BvIULrd9rgXADfBCZIcvEVO4RxoTuRmgF+k7Uj8AK5?=
 =?us-ascii?Q?PgIGmWfFgZYoQNAulIivZ+fjkA0J2TMyNkGTuCv8LvckpyYPkxihvm3ilE64?=
 =?us-ascii?Q?/6RZT21cTIlO5idRpdtrOiPGSxogJ/F6lWbHu3EirQkmlVCjcNDyeh0mQD+E?=
 =?us-ascii?Q?wr7MNy5zr1VJ2qNgnpDlW3++D7GMYQvfvRXgEMO+T/pfAZ+0jRn3acIX67A1?=
 =?us-ascii?Q?G8LKvmT/Gw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f350ac3-9122-4112-22ec-08de813aef2d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 19:58:45.7724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ojMjcgtHqsKEh/v9Es6VZmcH3X3AdLll0A+cDjq1DZ0P2/LsQiV5tvFs5jhAUvTSGB4oibYsv0zz58gJ8BGJFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8755
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org,bgdev.pl,lunn.ch];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33398-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bgdev.pl:email,lunn.ch:email,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: DA60D28984B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On an AMP platform, the system may include two processors:
	- An MCU running an RTOS
	- An MPU running Linux

These processors communicate via the RPMSG protocol.
The driver implements the standard GPIO interface, allowing
the Linux side to control GPIO controllers which reside in
the remote processor via RPMSG protocol.

Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 drivers/gpio/Kconfig      |  17 ++
 drivers/gpio/Makefile     |   1 +
 drivers/gpio/gpio-rpmsg.c | 596 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 614 insertions(+)
 create mode 100644 drivers/gpio/gpio-rpmsg.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b45fb799e36c..cff0fda8a283 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1892,6 +1892,23 @@ config GPIO_SODAVILLE
 
 endmenu
 
+menu "RPMSG GPIO drivers"
+	depends on RPMSG
+
+config GPIO_RPMSG
+	tristate "Generic RPMSG GPIO support"
+	depends on OF && REMOTEPROC
+	select GPIOLIB_IRQCHIP
+	default REMOTEPROC
+	help
+	  Say yes here to support the generic GPIO functions over the RPMSG
+	  bus. Currently supported devices: i.MX7ULP, i.MX8ULP, i.MX8x, and
+	  i.MX9x.
+
+	  If unsure, say N.
+
+endmenu
+
 menu "SPI GPIO expanders"
 	depends on SPI_MASTER
 
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index c05f7d795c43..501aba56ad68 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -158,6 +158,7 @@ obj-$(CONFIG_GPIO_RDC321X)		+= gpio-rdc321x.o
 obj-$(CONFIG_GPIO_REALTEK_OTTO)		+= gpio-realtek-otto.o
 obj-$(CONFIG_GPIO_REG)			+= gpio-reg.o
 obj-$(CONFIG_GPIO_ROCKCHIP)	+= gpio-rockchip.o
+obj-$(CONFIG_GPIO_RPMSG)		+= gpio-rpmsg.o
 obj-$(CONFIG_GPIO_RTD)			+= gpio-rtd.o
 obj-$(CONFIG_ARCH_SA1100)		+= gpio-sa1100.o
 obj-$(CONFIG_GPIO_SAMA5D2_PIOBU)	+= gpio-sama5d2-piobu.o
diff --git a/drivers/gpio/gpio-rpmsg.c b/drivers/gpio/gpio-rpmsg.c
new file mode 100644
index 000000000000..9c609b55bc14
--- /dev/null
+++ b/drivers/gpio/gpio-rpmsg.c
@@ -0,0 +1,596 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2026 NXP
+ *
+ * The driver exports a standard gpiochip interface to control
+ * the GPIO controllers via RPMSG on a remote processor.
+ */
+
+#include <linux/completion.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/gpio/driver.h>
+#include <linux/init.h>
+#include <linux/irqdomain.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/remoteproc.h>
+#include <linux/rpmsg.h>
+#include <linux/virtio_gpio.h>
+
+#define MAX_PORT_PER_CHANNEL    10
+#define GPIOS_PER_PORT_DEFAULT	32
+#define RPMSG_TIMEOUT		1000
+
+/* GPIO RPMSG Type */
+#define GPIO_RPMSG_SEND		0
+#define GPIO_RPMSG_REPLY	1
+#define GPIO_RPMSG_NOTIFY	2
+
+struct rpmsg_gpio_packet {
+	u8 type;	/* Message type */
+	u8 cmd;		/* Command code */
+	u8 port_idx;
+	u8 line;
+	u8 val1;
+	u8 val2;
+};
+
+struct rpmsg_gpio_line {
+	u8 irq_shutdown;
+	u8 irq_unmask;
+	u8 irq_mask;
+	u32 irq_wake_enable;
+	u32 irq_type;
+	struct rpmsg_gpio_packet msg;
+};
+
+struct rpmsg_gpio_info {
+	struct rpmsg_device *rpdev;
+	struct rpmsg_gpio_packet *reply_msg;
+	struct completion cmd_complete;
+	struct mutex lock;
+	void **port_store;
+};
+
+struct rpmsg_gpio_port {
+	struct gpio_chip gc;
+	struct rpmsg_gpio_line lines[GPIOS_PER_PORT_DEFAULT];
+	struct rpmsg_gpio_info info;
+	u32 ngpios;
+	u32 idx;
+};
+
+struct rpmsg_gpio_fixed_up {
+	int (*send_fixed_up)(struct rpmsg_gpio_info *info, struct rpmsg_gpio_packet *msg);
+	struct rpmsg_gpio_packet *(*recv_fixed_up)(struct rpmsg_device *rpdev, void *data);
+};
+
+/*
+ * @rproc_name: the name of the remote proc.
+ * @recv_pkt: a pointer to the received packet for protocol fix up.
+ * @protocol_fixed_up: optional callbacks to handle protocol mismatches.
+ * @channel_devices: an array of the devices related to the rpdev.
+ */
+struct rpdev_drvdata {
+	const char *rproc_name;
+	void *recv_pkt;
+	struct rpmsg_gpio_fixed_up *protocol_fixed_up;
+	void *channel_devices[MAX_PORT_PER_CHANNEL];
+};
+
+static int rpmsg_gpio_send_message(struct rpmsg_gpio_port *port,
+				   struct rpmsg_gpio_packet *msg,
+				   bool sync)
+{
+	struct rpmsg_gpio_info *info = &port->info;
+	struct rpdev_drvdata *drvdata;
+	int ret;
+
+	drvdata = dev_get_drvdata(&info->rpdev->dev);
+	reinit_completion(&info->cmd_complete);
+
+	if (drvdata->protocol_fixed_up)
+		ret = drvdata->protocol_fixed_up->send_fixed_up(info, msg);
+	else
+		ret = rpmsg_send(info->rpdev->ept, msg, sizeof(*msg));
+
+	if (ret) {
+		dev_err(&info->rpdev->dev, "rpmsg_send failed: %d\n", ret);
+		return ret;
+	}
+
+	if (sync) {
+		ret = wait_for_completion_timeout(&info->cmd_complete,
+						  msecs_to_jiffies(RPMSG_TIMEOUT));
+		if (ret == 0) {
+			dev_err(&info->rpdev->dev, "rpmsg_send timeout!\n");
+			return -ETIMEDOUT;
+		}
+
+		if (info->reply_msg->val1 != 0) {
+			dev_err(&info->rpdev->dev, "remote core replies an error: %d!\n",
+				info->reply_msg->val1);
+			return -EINVAL;
+		}
+
+		/* copy the reply message */
+		memcpy(&port->lines[info->reply_msg->line].msg,
+		       info->reply_msg, sizeof(*info->reply_msg));
+	}
+
+	return 0;
+}
+
+static struct rpmsg_gpio_packet *
+rpmsg_gpio_msg_init_common(struct rpmsg_gpio_port *port, unsigned int line, u8 cmd)
+{
+	struct rpmsg_gpio_packet *msg = &port->lines[line].msg;
+
+	memset(msg, 0, sizeof(struct rpmsg_gpio_packet));
+	msg->type = GPIO_RPMSG_SEND;
+	msg->cmd = cmd;
+	msg->port_idx = port->idx;
+	msg->line = line;
+
+	return msg;
+}
+
+static int rpmsg_gpio_get(struct gpio_chip *gc, unsigned int line)
+{
+	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	struct rpmsg_gpio_packet *msg;
+	int ret;
+
+	guard(mutex)(&port->info.lock);
+
+	msg = rpmsg_gpio_msg_init_common(port, line, VIRTIO_GPIO_MSG_GET_VALUE);
+
+	ret = rpmsg_gpio_send_message(port, msg, true);
+	if (!ret)
+		ret = !!port->lines[line].msg.val2;
+
+	return ret;
+}
+
+static int rpmsg_gpio_get_direction(struct gpio_chip *gc, unsigned int line)
+{
+	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	struct rpmsg_gpio_packet *msg;
+	int ret;
+
+	guard(mutex)(&port->info.lock);
+
+	msg = rpmsg_gpio_msg_init_common(port, line, VIRTIO_GPIO_MSG_GET_DIRECTION);
+
+	ret = rpmsg_gpio_send_message(port, msg, true);
+	if (ret)
+		return ret;
+
+	switch (port->lines[line].msg.val2) {
+	case VIRTIO_GPIO_DIRECTION_IN:
+		return GPIO_LINE_DIRECTION_IN;
+	case VIRTIO_GPIO_DIRECTION_OUT:
+		return GPIO_LINE_DIRECTION_OUT;
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
+static int rpmsg_gpio_direction_input(struct gpio_chip *gc, unsigned int line)
+{
+	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	struct rpmsg_gpio_packet *msg;
+
+	guard(mutex)(&port->info.lock);
+
+	msg = rpmsg_gpio_msg_init_common(port, line, VIRTIO_GPIO_MSG_SET_DIRECTION);
+	msg->val1 = VIRTIO_GPIO_DIRECTION_IN;
+
+	return rpmsg_gpio_send_message(port, msg, true);
+}
+
+static int rpmsg_gpio_set(struct gpio_chip *gc, unsigned int line, int val)
+{
+	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	struct rpmsg_gpio_packet *msg;
+
+	guard(mutex)(&port->info.lock);
+
+	msg = rpmsg_gpio_msg_init_common(port, line, VIRTIO_GPIO_MSG_SET_VALUE);
+	msg->val1 = val;
+
+	return rpmsg_gpio_send_message(port, msg, true);
+}
+
+static int rpmsg_gpio_direction_output(struct gpio_chip *gc, unsigned int line, int val)
+{
+	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	struct rpmsg_gpio_packet *msg;
+	int ret;
+
+	guard(mutex)(&port->info.lock);
+
+	msg = rpmsg_gpio_msg_init_common(port, line, VIRTIO_GPIO_MSG_SET_DIRECTION);
+	msg->val1 = VIRTIO_GPIO_DIRECTION_OUT;
+
+	ret = rpmsg_gpio_send_message(port, msg, true);
+	if (ret)
+		return ret;
+
+	msg = rpmsg_gpio_msg_init_common(port, line, VIRTIO_GPIO_MSG_SET_VALUE);
+	msg->val1 = val;
+
+	return rpmsg_gpio_send_message(port, msg, true);
+}
+
+static int gpio_rpmsg_irq_set_type(struct irq_data *d, u32 type)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 line = d->hwirq;
+	int ret = 0;
+
+	switch (type) {
+	case IRQ_TYPE_EDGE_RISING:
+		type = VIRTIO_GPIO_IRQ_TYPE_EDGE_RISING;
+		irq_set_handler_locked(d, handle_simple_irq);
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		type = VIRTIO_GPIO_IRQ_TYPE_EDGE_FALLING;
+		irq_set_handler_locked(d, handle_simple_irq);
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		type = VIRTIO_GPIO_IRQ_TYPE_EDGE_BOTH;
+		irq_set_handler_locked(d, handle_simple_irq);
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		type = VIRTIO_GPIO_IRQ_TYPE_LEVEL_LOW;
+		irq_set_handler_locked(d, handle_level_irq);
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		type = VIRTIO_GPIO_IRQ_TYPE_LEVEL_HIGH;
+		irq_set_handler_locked(d, handle_level_irq);
+		break;
+	default:
+		ret = -EINVAL;
+		irq_set_handler_locked(d, handle_bad_irq);
+		break;
+	}
+
+	port->lines[line].irq_type = type;
+
+	return ret;
+}
+
+static int gpio_rpmsg_irq_set_wake(struct irq_data *d, u32 enable)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 line = d->hwirq;
+
+	port->lines[line].irq_wake_enable = enable;
+
+	return 0;
+}
+
+/*
+ * This unmask/mask function is invoked in two situations:
+ *   - when an interrupt is being set up, and
+ *   - after an interrupt has occurred.
+ *
+ * The GPIO driver does not access hardware registers directly.
+ * Instead, it caches all relevant information locally, and then sends
+ * the accumulated state to the remote system at this stage.
+ */
+static void gpio_rpmsg_unmask_irq(struct irq_data *d)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 line = d->hwirq;
+
+	port->lines[line].irq_unmask = 1;
+}
+
+static void gpio_rpmsg_mask_irq(struct irq_data *d)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 line = d->hwirq;
+
+	/*
+	 * When an interrupt occurs, the remote system masks the interrupt
+	 * and then sends a notification to Linux. After Linux processes
+	 * that notification, it sends an RPMsg command back to the remote
+	 * system to unmask the interrupt again.
+	 */
+	port->lines[line].irq_mask = 1;
+}
+
+static void gpio_rpmsg_irq_shutdown(struct irq_data *d)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 line = d->hwirq;
+
+	port->lines[line].irq_shutdown = 1;
+}
+
+static void gpio_rpmsg_irq_bus_lock(struct irq_data *d)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+
+	mutex_lock(&port->info.lock);
+}
+
+static void gpio_rpmsg_irq_bus_sync_unlock(struct irq_data *d)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	struct rpmsg_gpio_packet *msg;
+	u32 line = d->hwirq;
+
+	/*
+	 * For mask irq, do nothing here.
+	 * The remote system will mask interrupt after an interrupt occurs,
+	 * and then send a notification to Linux system. After Linux system
+	 * handles the notification, it sends an rpmsg back to the remote
+	 * system to unmask this interrupt again.
+	 */
+	if (port->lines[line].irq_mask && !port->lines[line].irq_unmask) {
+		port->lines[line].irq_mask = 0;
+		mutex_unlock(&port->info.lock);
+		return;
+	}
+
+	msg = rpmsg_gpio_msg_init_common(port, line, VIRTIO_GPIO_MSG_IRQ_TYPE);
+
+	if (port->lines[line].irq_shutdown) {
+		port->lines[line].irq_shutdown = 0;
+		msg->val1 = VIRTIO_GPIO_IRQ_TYPE_NONE;
+		msg->val2 = 0;
+	} else {
+		/* if irq type is not set, use low level trigger as default. */
+		msg->val1 = port->lines[line].irq_type;
+		if (!msg->val1)
+			msg->val1 = VIRTIO_GPIO_IRQ_TYPE_LEVEL_LOW;
+		if (port->lines[line].irq_unmask) {
+			msg->val2 = 0;
+			port->lines[line].irq_unmask = 0;
+		} else /* irq set wake */
+			msg->val2 = port->lines[line].irq_wake_enable;
+	}
+
+	rpmsg_gpio_send_message(port, msg, false);
+	mutex_unlock(&port->info.lock);
+}
+
+static const struct irq_chip gpio_rpmsg_irq_chip = {
+	.irq_mask = gpio_rpmsg_mask_irq,
+	.irq_unmask = gpio_rpmsg_unmask_irq,
+	.irq_set_wake = gpio_rpmsg_irq_set_wake,
+	.irq_set_type = gpio_rpmsg_irq_set_type,
+	.irq_shutdown = gpio_rpmsg_irq_shutdown,
+	.irq_bus_lock = gpio_rpmsg_irq_bus_lock,
+	.irq_bus_sync_unlock = gpio_rpmsg_irq_bus_sync_unlock,
+	.flags = IRQCHIP_IMMUTABLE,
+};
+
+static void rpmsg_gpio_remove_action(void *data)
+{
+	struct rpmsg_gpio_port *port = data;
+
+	port->info.port_store[port->idx] = NULL;
+}
+
+static int rpmsg_gpiochip_register(struct rpmsg_device *rpdev, struct device_node *np)
+{
+	struct rpdev_drvdata *drvdata = dev_get_drvdata(&rpdev->dev);
+	struct rpmsg_gpio_port *port;
+	struct gpio_irq_chip *girq;
+	struct gpio_chip *gc;
+	int ret;
+
+	port = devm_kzalloc(&rpdev->dev, sizeof(*port), GFP_KERNEL);
+	if (!port)
+		return -ENOMEM;
+
+	ret = of_property_read_u32(np, "reg", &port->idx);
+	if (ret)
+		return ret;
+
+	if (port->idx >= MAX_PORT_PER_CHANNEL)
+		return -EINVAL;
+
+	ret = devm_mutex_init(&rpdev->dev, &port->info.lock);
+	if (ret)
+		return ret;
+
+	ret = of_property_read_u32(np, "ngpios", &port->ngpios);
+	if (ret || port->ngpios > GPIOS_PER_PORT_DEFAULT)
+		port->ngpios = GPIOS_PER_PORT_DEFAULT;
+
+	port->info.reply_msg = devm_kzalloc(&rpdev->dev,
+					    sizeof(struct rpmsg_gpio_packet),
+					    GFP_KERNEL);
+	if (!port->info.reply_msg)
+		return -ENOMEM;
+
+	init_completion(&port->info.cmd_complete);
+	port->info.port_store = drvdata->channel_devices;
+	port->info.port_store[port->idx] = port;
+	port->info.rpdev = rpdev;
+
+	gc = &port->gc;
+	gc->owner = THIS_MODULE;
+	gc->parent = &rpdev->dev;
+	gc->fwnode = of_fwnode_handle(np);
+	gc->ngpio = port->ngpios;
+	gc->base = -1;
+	gc->label = devm_kasprintf(&rpdev->dev, GFP_KERNEL, "%s-gpio%d",
+				   drvdata->rproc_name, port->idx);
+
+	gc->direction_input = rpmsg_gpio_direction_input;
+	gc->direction_output = rpmsg_gpio_direction_output;
+	gc->get_direction = rpmsg_gpio_get_direction;
+	gc->get = rpmsg_gpio_get;
+	gc->set = rpmsg_gpio_set;
+
+	girq = &gc->irq;
+	gpio_irq_chip_set_chip(girq, &gpio_rpmsg_irq_chip);
+	girq->parent_handler = NULL;
+	girq->num_parents = 0;
+	girq->parents = NULL;
+	girq->chip->name = devm_kasprintf(&rpdev->dev, GFP_KERNEL, "%s-gpio%d",
+					  drvdata->rproc_name, port->idx);
+
+	ret = devm_add_action_or_reset(&rpdev->dev, rpmsg_gpio_remove_action, port);
+	if (ret)
+		return ret;
+
+	return devm_gpiochip_add_data(&rpdev->dev, gc, port);
+}
+
+static const char *rpmsg_get_rproc_node_name(struct rpmsg_device *rpdev)
+{
+	const char *name = NULL;
+	struct device_node *np;
+	struct rproc *rproc;
+
+	rproc = rproc_get_by_child(&rpdev->dev);
+	if (!rproc)
+		return NULL;
+
+	np = of_node_get(rproc->dev.of_node);
+	if (!np && rproc->dev.parent)
+		np = of_node_get(rproc->dev.parent->of_node);
+
+	if (np) {
+		name = devm_kstrdup(&rpdev->dev, np->name, GFP_KERNEL);
+		of_node_put(np);
+	}
+
+	return name;
+}
+
+static struct device_node *
+rpmsg_get_channel_ofnode(struct rpmsg_device *rpdev, char *chan_name)
+{
+	struct device_node *np_chan = NULL, *np;
+	struct rproc *rproc;
+
+	rproc = rproc_get_by_child(&rpdev->dev);
+	if (!rproc)
+		return NULL;
+
+	np = of_node_get(rproc->dev.of_node);
+	if (!np && rproc->dev.parent)
+		np = of_node_get(rproc->dev.parent->of_node);
+
+	/* The of_node_put() is performed by of_find_node_by_name(). */
+	if (np)
+		np_chan = of_find_node_by_name(np, chan_name);
+
+	return np_chan;
+}
+
+static int rpmsg_gpio_channel_callback(struct rpmsg_device *rpdev, void *data,
+				       int len, void *priv, u32 src)
+{
+	struct rpmsg_gpio_packet *msg = data;
+	struct rpmsg_gpio_port *port = NULL;
+	struct rpdev_drvdata *drvdata;
+
+	drvdata = dev_get_drvdata(&rpdev->dev);
+	if (drvdata && drvdata->protocol_fixed_up)
+		msg = drvdata->protocol_fixed_up->recv_fixed_up(rpdev, data);
+
+	if (!msg || !drvdata)
+		return -EINVAL;
+
+	if (msg->port_idx < MAX_PORT_PER_CHANNEL)
+		port = drvdata->channel_devices[msg->port_idx];
+
+	if (!port || msg->line >= port->ngpios) {
+		dev_err(&rpdev->dev, "wrong port index or line number. port:%d line:%d\n",
+			msg->port_idx, msg->line);
+		return -EINVAL;
+	}
+
+	if (msg->type == GPIO_RPMSG_REPLY) {
+		*port->info.reply_msg = *msg;
+		complete(&port->info.cmd_complete);
+	} else if (msg->type == GPIO_RPMSG_NOTIFY) {
+		generic_handle_domain_irq_safe(port->gc.irq.domain, msg->line);
+	} else {
+		dev_err(&rpdev->dev, "wrong command type (0x%x)\n", msg->type);
+	}
+
+	return 0;
+}
+
+static int rpmsg_gpio_channel_probe(struct rpmsg_device *rpdev)
+{
+	struct device *dev = &rpdev->dev;
+	struct rpdev_drvdata *drvdata;
+	struct device_node *np;
+	int ret = -ENODEV;
+
+	if (!dev->of_node) {
+		np = rpmsg_get_channel_ofnode(rpdev, rpdev->id.name);
+		if (np) {
+			dev->of_node = np;
+			set_primary_fwnode(dev, of_fwnode_handle(np));
+		}
+		return -EPROBE_DEFER;
+	}
+
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	drvdata->rproc_name = rpmsg_get_rproc_node_name(rpdev);
+	drvdata->protocol_fixed_up = (struct rpmsg_gpio_fixed_up *)rpdev->id.driver_data;
+	dev_set_drvdata(dev, drvdata);
+
+	for_each_child_of_node_scoped(dev->of_node, child) {
+		if (!of_device_is_available(child))
+			continue;
+
+		if (!of_match_node(dev->driver->of_match_table, child))
+			continue;
+
+		ret = rpmsg_gpiochip_register(rpdev, child);
+		if (ret < 0)
+			break;
+	}
+
+	return ret;
+}
+
+static const struct of_device_id rpmsg_gpio_dt_ids[] = {
+	{ .compatible = "rpmsg-gpio" },
+	{ /* sentinel */ }
+};
+
+static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] = {
+	{ .name = "rpmsg-io" },
+	{ },
+};
+MODULE_DEVICE_TABLE(rpmsg, rpmsg_gpio_channel_id_table);
+
+static struct rpmsg_driver rpmsg_gpio_channel_client = {
+	.callback	= rpmsg_gpio_channel_callback,
+	.id_table	= rpmsg_gpio_channel_id_table,
+	.probe		= rpmsg_gpio_channel_probe,
+	.drv		= {
+		.name	= KBUILD_MODNAME,
+		.of_match_table = rpmsg_gpio_dt_ids,
+	},
+};
+module_rpmsg_driver(rpmsg_gpio_channel_client);
+
+MODULE_AUTHOR("Shenwei Wang <shenwei.wang@nxp.com>");
+MODULE_DESCRIPTION("generic rpmsg gpio driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0


