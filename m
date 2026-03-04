Return-Path: <linux-gpio+bounces-32513-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MB6kMJ6iqGnKwAAAu9opvQ
	(envelope-from <linux-gpio+bounces-32513-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 22:22:38 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 28908207EB4
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 22:22:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C3493046523
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2026 21:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A513845B4;
	Wed,  4 Mar 2026 21:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cGVM6Kp+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010023.outbound.protection.outlook.com [52.101.84.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2CD37267B;
	Wed,  4 Mar 2026 21:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772659148; cv=fail; b=d10LZBSQQDe7BuphFZc3L3GCBGOv2GF4V2rnDUcUOm8dHkLOntdOOvxfFfk41hy6F4KMdEpIFlgiv7PJqBKctzMGdcSktDIesT1UH2jws1YKG1FgLMozQ2uUS/0DNkpeU2ySeMub4Z5j9dp8dj5tfCg8U8OM58Uv6k5lXuswWn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772659148; c=relaxed/simple;
	bh=4vBZkkiMLIcLmfWzp1SV4nAG52njrldmCTy7ilo9HRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nTEUgN21xOVSj09nLvyXlBaN21UXCXjGXzb5XK9Ls7hRuk7kWN3D0g0NRF7sU0gA0FKuJy1/82KKqHMiSPsr/eqYmoaoAU+Tg1CUnqcxqlKcM1uX2S/xCYaxRu4MQok2x7HqK0jK5Kq8ZxwKJoWlwDbw5mZDxMwAMzw/VtVZ+F0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cGVM6Kp+; arc=fail smtp.client-ip=52.101.84.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rOMh0NxzPPlMiwgJk7ElwsN+NfvtX+thbOTW6eobBYW0qBv+m6J6xFgCirYVlgcTzeR7HuojmYq9U49Zdq8UXOIUt62GXIdD/eSuTkzZagLS4c4vHyrhd2dFjgTUtzOZAO9Ps+kVV798wmxUAb+79jHqMozV9Ii33FpyTE0TX77F9n1948EY04dPneUNnsYYB8pg8oUb8fuBvrLyuqEZxUyd4Kwoeb3jp9cVU2HQ7ucUtS7W92qFcowolLjLfAWuvHHiZyAm03BqL7R6Tfd7v2HtrdPUs5zgC+CeIldRUlJ3N8aGh6c7EYWoz4dWSPfVw0ZJlPAJJM9syFtObTawvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IDaegMKUB18VJeGoP5cjBQTr6bLnIHGXPnngfkOE1+Y=;
 b=sqzrsEMdJWcOO/T2EruF4eGOC1QjbXm2+IEwqOEX2MzwcRcnCBe5XzTeUMUoadbXAa3fZ4ubj4RNOmotNJG8M9NKt7Pf42SvEH5y8jXQ4jPh9BO/vLebMkCBNU9DOBp8wNwo6JTwNvS4O0CMgCwOlrrDnQuc+nRa1SKN6TMCU5zbWHxezRuRCqLwKAWgJ2FTT5NhbPuoNlBisRxXHkZ3MrDRkx6zXD/w2Hvrc9/I8Go6WXmwp/0M0J7xP5Ruh8T2tOSB5/RgYn+O72R3H9QiTjdpwuWDqyONmtW1JczNO/S7UoPg5MAncw+0djimik2QdL5BcU7mdEYwHGoF4+ZB+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDaegMKUB18VJeGoP5cjBQTr6bLnIHGXPnngfkOE1+Y=;
 b=cGVM6Kp+mlIqAMGfqhobHrIjzcEIxKZoakvuHCI1wchpxwXJcATS4h6m3zGm2VQB5wpVrbu50Jduw5HYVQUMNcVa8EVjia7PJpaaXmwjmyTrT+RhWeR1PcGPlcQoeDUm0jdNl7zoo/kpJRyVb68warZG33Zx+SkwmwzPbVDYvJkby3ySFT4xW9VeRgNHpJVBG/U5t/TeUIVtTTqrU/4bOiPQUjIKoKocRJGLbHsx0AhC1n6tGyAGdWbuzvenQmFSCHyqv6N5fj/lMNsUHPkFodL81ONPBa8Nf5KoCyb5yzRBAkofq7TPrPcUk+Vcy9GafxJfSVfuPXEzpxwPJBPnIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PAXPR04MB8206.eurprd04.prod.outlook.com (2603:10a6:102:1cb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 21:19:02 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 21:19:02 +0000
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
Subject: [PATCH v9 3/5] gpio: rpmsg: add generic rpmsg GPIO driver
Date: Wed,  4 Mar 2026 15:18:06 -0600
Message-ID: <20260304211808.1437846-4-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304211808.1437846-1-shenwei.wang@nxp.com>
References: <20260304211808.1437846-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1PR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::29) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|PAXPR04MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: 89dd0a0e-81ce-4119-e587-08de7a33a851
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|19092799006|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	by3rmQ+akvNWQCJdF3EgOMUbx34PNPERi+ebW1cuHAuD4NO2JR81iBmHPHk6t4DuxIbdN80gs1Me/A1skLObF9a1hUWWhy3ZDbWObFhGLUU1PWUzCfVy84ZTGCFltnBIc0tC2jcBSEylxYgyD7ZzOFG0RwQibF2p+/BZ7NmOySFJwg6c3GPC1aoeO/QC8JCBI72rSm2nvmMZTW6IAwU+X8HlRFNpEVMCnrFHuCs9ECVK7W7VqFWQPW2M0C4TA28y783R9Lvw1n7KuspSL6ymdxnCe75rz6fFBYPV8zZFJlw0ot83AvJeAlBuSYcLXeDPR/iAN3L3NJkro7q+QxlFu/zubTo16YcvrWyayuTnUaM/6+7fxRAk28a3k/FdHF9bV8yJd9AqGcRpa53d6ZTlof0P6mUCEus5USQU8RJR7SOTaWgaIpiFGZv64wxtAgYZfb1qN6tKwrTN7UgVy5ZeeHf4kLLgEzslvv158E7isoH1JbiA5FdWGQdQ+TOyioM0illmuauaYHaJYV9d5Mm0ke6qumhQHDO9oaqdyJSp1N+JUm04a2cj9xGYTJ/hA3hykrOTScx8Vo5Q1EkCeOYhH5LTnBtc40i8HNBaYyozXohYJ9z4c9IcaK7C0DorMy5rWo9ScsqpO58vSGTpxTYbssufr1ehEdUFJCKQ3/U1gyTfB7xOkXyguK89gIicHh3bQQJ+mGrWD4qGkk2LpJ8dESneKLLVnkSk6kDzxJiX7oH7Z2UDgB7jZaMP7haHQqsP6z2/XLqhDDrxnI7k9mQTzvEB+OULumgQ0KTzI8b4HR4dgbPoX+sN84YbTgcRW2+O
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(19092799006)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JbaF9yBYGXzynvFExfFyDh5dMEq86hceFGdnvnOam2rbgoSihsbzDlQWshx8?=
 =?us-ascii?Q?MMMe83N+VAX96rooL+qw+cpIWYOhe7A4rGLDBuQGLfUCaMYWzbujN5hr8cqI?=
 =?us-ascii?Q?N+a3gwV6/KQhTw0k7oqRgJFrocO1mWMeck+QxAq+U8OJtLIwEGge1y/rNMzB?=
 =?us-ascii?Q?uKCYtlsTgzd8tebuFtmh4R2nHNYuexKmzrnftHI1xURlLSgjsHsyL1h07eL7?=
 =?us-ascii?Q?aW2MU3yHUwyZstJmZhYRRNI7/jIQ+7X8ZGlwYgGF1Q4XMM2csdol61iOBruc?=
 =?us-ascii?Q?CPFXfOwkvzr/M7GxLUH/McjgHKaDkgjvTGfFh8nBKHidyAxkjAPd4eGrKE+W?=
 =?us-ascii?Q?G5kFw1FRwPh1mpbocAXA4UhmIR2tZuw1KJXgDB61TvX5IfQ5j3XG0PZvLcd5?=
 =?us-ascii?Q?Z7Vv3UFu0WGBdj+mGgZHPgDKLbGAeEl/G/8PHrhtWsTA+w5bdNoersIiYyzl?=
 =?us-ascii?Q?+C8XbwbHSILSy6yiK0kQV0OxYVW96ExgU56NPaR/90ocMtWp9vAOVxJu/96K?=
 =?us-ascii?Q?VXWcYckzR9TMf9lgJavj1pe9ySuu1ipYO+t46paZYpqANuWNBwCjLSTNqX7d?=
 =?us-ascii?Q?nwiHAWNWQQNTxfhkMlDajnMpaUYi3j6jPhVbEiwAaKWW2USxlsx8XUNfDaxd?=
 =?us-ascii?Q?rIHz7tNwqb5PQmj1NhzQao2DJEI456Qw/ZWJjXfOAx+dbhmU1dN5XfqryzCH?=
 =?us-ascii?Q?9PXX+iol13gFYkw+mcALeeHMl3VtbALvNZb4gkVaBVpbvLUpwefGncrE6fDp?=
 =?us-ascii?Q?ZX28Gjw9bwfDCHQdHf7BnfeUDHGeFJAmwpoQdeZpAhk3aX7Hub6Px4VlF2WI?=
 =?us-ascii?Q?jArol/FXc8GJqGsaTGLkGfSxguK6s70yxLH2eIlP7toWvOu4cIrWl6ZCJ50H?=
 =?us-ascii?Q?ih1QcKt+GRa5UiGpDze4RM84hymyKTO09iTOClE92+XciiYvEwvSmJCwdPbd?=
 =?us-ascii?Q?N9tuk42SczdHCC5FK67a0RD5KKSiYXrsLWaNDDFiT4sy1ntaS6PsOiVInbFD?=
 =?us-ascii?Q?mH8CK/kF/OY4HwFkix9CvPrVzVlQ/UrKdhGR+w1oNAeY00GXKwvGWcq2voXG?=
 =?us-ascii?Q?bSdztG7B1Or1Y6nzjse2lmyoPec9iyUKCawpGCCug2+zmnhnkKw8s0eoaB5T?=
 =?us-ascii?Q?NhT67GvybaQIa9zfuNYtK1MP0NtNtQ8mNxFnJTo47mj7wPaq8M0IzA7E30wg?=
 =?us-ascii?Q?F1jgNo/xMMAWjYn6Du4euBdZIp+e5wPOONBa4ukSG8c0wdaHUXmW8ycrnvqL?=
 =?us-ascii?Q?yzqZhfOgExiWSJVeinW4pbfiomlJs7HYuKr3bgM8fELTV319DvXRYlEVzWEE?=
 =?us-ascii?Q?OUbCCGwCEXAWAYsG8MSCwN4d9pO0U5j5t2SCZ/LXPYaTJ7UWnjaA/sjf6nQv?=
 =?us-ascii?Q?WZvo+qVSvdvFrlaIviBLR7wbCLa+UzMRiEAFfXYmblOo5JkCUPVIp1Oeu9YW?=
 =?us-ascii?Q?Wfpk4ro/OzJTAixvvj+98bP0zEjAPZ2Mx57PQD3rdA/ptcsimBrjvGxv7KLD?=
 =?us-ascii?Q?veynNBowGLpbTKwKVjHDGy948ceJdW9+uRuo1/KI9JUVvLAfoTXxQBFjVohf?=
 =?us-ascii?Q?cEA2uLczIjhSY4cjqhkf83zfuUx5naij10qTdsl53Imc5VWO4cDkSWCG8fq7?=
 =?us-ascii?Q?S5umZv0MeldkGw7JOhRKlkq8s1o0hcv4RuHYT+x4H6TSMVM1jNQZUXE+tiIq?=
 =?us-ascii?Q?AlTLiDlq5JwGtrt/Fq5o00vaIoUE7mYwQE5oKLSLH6J1He7vyU+fwCbQ05eW?=
 =?us-ascii?Q?MiPJB4V8rQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89dd0a0e-81ce-4119-e587-08de7a33a851
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 21:19:02.2035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dD4h7lo9gsBCqwX/37bSakyrXO1MfVUov2TIWi9lIzsqhVV4pZb5W+4J4LNwMZhypie3gM/+hiYJmPO/ichflw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8206
X-Rspamd-Queue-Id: 28908207EB4
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-32513-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bgdev.pl:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,lunn.ch:email,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Action: no action

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
 drivers/gpio/gpio-rpmsg.c | 592 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 610 insertions(+)
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
index 000000000000..1accf56a0f79
--- /dev/null
+++ b/drivers/gpio/gpio-rpmsg.c
@@ -0,0 +1,592 @@
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
+	struct rpmsg_gpio_packet *msg = NULL;
+	u32 line = d->hwirq;
+
+	/*
+	 * For mask irq, do nothing here.
+	 * The remote system will mask interrupt after an interrupt occurs,
+	 * and then send a notify to Linux system.
+	 * After Linux system dealt with the notify, it will send an rpmsg to
+	 * the remote system to unmask this interrupt again.
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
+		/* if not set irq type, then use low level as trigger type */
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
+	init_completion(&port->info.cmd_complete);
+	port->info.reply_msg = devm_kzalloc(&rpdev->dev,
+					    sizeof(struct rpmsg_gpio_packet),
+					    GFP_KERNEL);
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
+
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
+static int
+rpmsg_gpio_channel_callback(struct rpmsg_device *rpdev, void *data,
+			    int len, void *priv, u32 src)
+{
+	struct rpmsg_gpio_packet *msg = data;
+	struct rpmsg_gpio_port *port = NULL;
+	struct rpdev_drvdata *drvdata;
+
+	drvdata = dev_get_drvdata(&rpdev->dev);
+	if (!drvdata)
+		return -EINVAL;
+
+	if (drvdata->protocol_fixed_up)
+		msg = drvdata->protocol_fixed_up->recv_fixed_up(rpdev, data);
+
+	if (msg && msg->port_idx < MAX_PORT_PER_CHANNEL)
+		port = drvdata->channel_devices[msg->port_idx];
+
+	if (!port)
+		return -ENODEV;
+
+	if (msg->type == GPIO_RPMSG_REPLY) {
+		*port->info.reply_msg = *msg;
+		complete(&port->info.cmd_complete);
+	} else if (msg->type == GPIO_RPMSG_NOTIFY) {
+		generic_handle_domain_irq_safe(port->gc.irq.domain, msg->line);
+	} else
+		dev_err(&rpdev->dev, "wrong command type (0x%x)\n", msg->type);
+
+	return 0;
+}
+
+static int rpmsg_gpio_channel_probe(struct rpmsg_device *rpdev)
+{
+	struct device *dev = &rpdev->dev;
+	struct rpdev_drvdata *drvdata;
+	struct device_node *np;
+	int ret;
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
+	drvdata->protocol_fixed_up =
+		(struct rpmsg_gpio_fixed_up *)(uintptr_t)rpdev->id.driver_data;
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
+	.drv = {
+		.name	= KBUILD_MODNAME,
+		.of_match_table = rpmsg_gpio_dt_ids,
+	},
+	.id_table	= rpmsg_gpio_channel_id_table,
+	.probe		= rpmsg_gpio_channel_probe,
+	.callback	= rpmsg_gpio_channel_callback,
+};
+module_rpmsg_driver(rpmsg_gpio_channel_client);
+
+MODULE_AUTHOR("Shenwei Wang <shenwei.wang@nxp.com>");
+MODULE_DESCRIPTION("generic rpmsg gpio driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0


