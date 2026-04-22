Return-Path: <linux-gpio+bounces-35378-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6H6CGxU/6WmEWQIAu9opvQ
	(envelope-from <linux-gpio+bounces-35378-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 23:35:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D0244AF95
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 23:35:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21A773111C7A
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 21:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2048376BFB;
	Wed, 22 Apr 2026 21:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nzFGzh17"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011055.outbound.protection.outlook.com [40.107.130.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D05C3563E9;
	Wed, 22 Apr 2026 21:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776893434; cv=fail; b=nP1rlU4hnvv3i7sQuJs0pNuIBL8ENBmKAF8+kZjKtJQUxIwt0vFl8xM/Eq0LsOd1yxlDMDC/utauIomruk7hg56XY5vsMESMO97722+1VFX4BhQAD1JVHLYabM2xD2XHtFPwcYH8qS/JZW5U+lrgq7nG9qJW/MGS76urMFumORw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776893434; c=relaxed/simple;
	bh=SkTq4QJ30PXn2/e5G6drjnjsqF8t83xpiE9fzaCjN3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SqImyuw+U/10/1uJTJqNyb9osNb5B4oPISZ6Z/jWWD4mGOjpNZf+sPYcFB+VsPdl/3yPLWhNMriGWYQF5DTt4d+QlFTnh9Z1wdPgQIZ7twm22WsgIkTtV35DA7rIc8KLzFEjQqVyZ5tsv4VrfK2vKe1I/aUioCKFT32xFZN9KxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nzFGzh17; arc=fail smtp.client-ip=40.107.130.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SBV++Lvz4AlkNz0b5IwSu/AuFQa7frUk1uNMRAyUIFPvZgfiS//vVX+ZcxKUuY3O7GPZOWpD/kzo9mZcfK0Bqka2t2cS/b1DzKadCN6wULVVBYmMwEl4ZHq9OhHrZaLmsS4r2fo5Oo0SaV+Wy1DfoIOegF4eyYyXpJrDZP2gLkI09et/gMPrk09tbQzw9dtLhqRFiD9JkaHCIdKa3MYomjbMtutKjt2hvvYGN6FWpivg/x/BWWlfqIv+xTxI5gIiNscimYIBGFBYX4mEdpAMnhx9pzw6jhvi3n+tXFwY5K0y3Ns2Rhsy9mU7Pq8Ksyau2X5KbabyO8cmJXuavzsdcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+45WO4YLioPVc8iRFUZf4etxjvXpL1gi84/fEkrWQV4=;
 b=MGN36rib0didBnrF8eqj1Ncx/Zgi/tZfy2ylSZfRhBXOj4yNw8MSLqr7lQSpZyxVl35MuAb78OVaEIB6snVmTxeGB5eVGW6Qr5uEIMWGwMAeMR462+IrW+OzBx594uzKt7o9VaAQ0HwhGSD+EIMhkpIVF0y2ejbTtYCRXQObL5hrwAfbJExZGy8AkDqF9tf4MR9/XKulyDadPW0CvPPIywgLysfWLbhfw+NstuyX3hNvx2yjLzihuCGPsSlbG8RgAi+275Abt5eJWHAnGgrZLbuf/4AFWG3HlYrdkdwX5RwUh7FuMrJ5PGz6UkcoA4vvJTMUYYFSKXhCLCYuOM90cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+45WO4YLioPVc8iRFUZf4etxjvXpL1gi84/fEkrWQV4=;
 b=nzFGzh17TXW7BWKOmwJQ39mnL6R3ZAnolusMoeI1lfyakJBmgzPcl8O4o5xlVxkFTW4HjbZRZsN/i//P52zH3C5WbimsevKASaaS+Nw4sYMwVCdK4i2jB00VCfQEspeVyrPGR5TBjLQm+DdWn1Vx8x+ezbkoGJ8HBMhrNRMYOJVeF8GerSfTQQEed6awlk1zvDLHcyifb8fiDtmrzdb7lt6Im3BNS4RAd3tqeBFb2vrFH8+gP1wh4PsI3Af9ROO88ynBd2CMeS7c/JiQTcRkzUtJTk3dBxTse3UHtYkUKK0LrmoDivyJHrklfzWrJ1iPpw0vj6/LQvewHfwh7qDB3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9176.eurprd04.prod.outlook.com (2603:10a6:20b:44b::7)
 by DU2PR04MB8870.eurprd04.prod.outlook.com (2603:10a6:10:2e1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Wed, 22 Apr
 2026 21:30:29 +0000
Received: from AS8PR04MB9176.eurprd04.prod.outlook.com
 ([fe80::ba87:1cd1:53d9:fcd7]) by AS8PR04MB9176.eurprd04.prod.outlook.com
 ([fe80::ba87:1cd1:53d9:fcd7%6]) with mapi id 15.20.9846.019; Wed, 22 Apr 2026
 21:30:29 +0000
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
	linux-imx@nxp.com,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Date: Wed, 22 Apr 2026 16:28:48 -0500
Message-ID: <20260422212849.1240591-4-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260422212849.1240591-1-shenwei.wang@nxp.com>
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0086.namprd13.prod.outlook.com
 (2603:10b6:806:23::31) To AS8PR04MB9176.eurprd04.prod.outlook.com
 (2603:10a6:20b:44b::7)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9176:EE_|DU2PR04MB8870:EE_
X-MS-Office365-Filtering-Correlation-Id: d124421c-582d-4ebc-f4df-08dea0b6601a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|19092799006|18002099003|921020|38350700014|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7b4kJ6xmzQYQsWquskE6AadiGQWHgFyL0EBfNJ3YUidp4aDrrWiInpmIcAUepL2FYQof35zRyNbfVNoPrgbDKZFXsMXK2fBwoQnX6Z6+g9jICMQut/ixfhYOKUR7X4KLT3QfOmX2pkzFVOijgldwQVB6ZKoM9Wh5qG9inEX7SWC8Ps7JhitJpJr0QWCSjhYnN/U32Zfagm61oVfZvX+bY2HiHScK2ryRHzBV6DMvwoMTV6KjQjD6RnnPVPm/U366PF0rUK9VSDQT9vlZtfvbbiQNdekIyzFLeWRJYiA33QTCwYxVTXRruh+KNXkCUGblqpSOJV22gh9DvOx5T7hy5dIIIShccWjrzV3TnZMQAfu9GX5XG5d52pj7t+P8ThdFZJzM5i5aBXadsF+gKT01S5OzNEf/wr2FIODmo8aj3aDEDK3nQO9nfsEhv9XDl5cw166jaFhmFBrumizcwZBE/xyYIN7J0byIqnR56vtuQ3dD125b1JsTMfTM7CFOQW/KzCcuymdf9uTIELmdbpH8VuqJYrag1jb1P0iKUiIP/N7nvgEo9utIr1uMhpEWIfMY5JK174Rgq6T0FNueTYFXZaZVvm5HepF11AylpA4ML6d3MjAMV3h4zorRxaZ1VOAYT0YTvlOXJng5NNJOh0L9sRa5VPXDHh8g87McZpXjWVD9bBXFYB1W0ic19/V3r2tmiPj4vJAI0G+U/nfJk8wqQj1yf8cTcWz8kBqgEfiHcCzanZ5FN3dtIOndBFHUws+wbQLgrImgdUyRJi79jM+L6i7HmGMSAI4i8p7m7orF3X5FLHgVdmf4I8eaKqo8dppA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9176.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(19092799006)(18002099003)(921020)(38350700014)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TbtDboima5jyuGXKCD6iPIvYlYZoZPJxtcPQozSqsWns55IlXgfrgrHZUtCF?=
 =?us-ascii?Q?0LA4bFgrrRYC8dZy+WkjwD34SnbE64ZjItZ9d+JvbEGESfIv1DwNyawbAVbk?=
 =?us-ascii?Q?Id513o/4efxwUjSeW82Zo8jXjABQTttY5Knaf+A5ALcktkyNmPx3DvNFCJUQ?=
 =?us-ascii?Q?6fU5vyqVMMwjy+mNGJmfyUgpQd1d+8QcjRUorKQP8BSiKaPGvLnObnq37zft?=
 =?us-ascii?Q?J4meIIrR56ldA5QEC9KznCT2k3UUIfSlEzEAAl0Rcm2FrDDltFcF67GjilqY?=
 =?us-ascii?Q?2UBrRWk+UloCReTjyt/lfBis8HCrPqGq4TZEL0XLZxX9zK4mDT5+Y8VlOc2A?=
 =?us-ascii?Q?pWEvA/3NvEIXVSqRaBS+aM+/z+1SYrvoR3YaJvETRDOYbSthDHgIUGShlbQ+?=
 =?us-ascii?Q?joJ+TfFDcdOZwfihxDWHHx17o78m/AfrHy4FUiverN3Km2VOXsyQQAFTIO7d?=
 =?us-ascii?Q?x7yiZsaK82BEBOyy256Sv7QXllPZQrJMVn9qY50ZRIvqyXKh/wTQgJV8ZvR3?=
 =?us-ascii?Q?EaZb9l3f9v+ty18FzBDvs1ttPdZ/EW4yi73Wo0jIIdfS5cKS2Pm6JyClmske?=
 =?us-ascii?Q?fe6BPRrSdty3FqiOQK7o4gm04KyKEO3uBLqiGeTJ64scr/b6kszgA5rsgx+n?=
 =?us-ascii?Q?ffSKOJu5YhgW/AoV5jCyVeqA8SV0nmARVPtHui6VxtcWOEu8K3gNTRJRltn5?=
 =?us-ascii?Q?n4duK3BV7jU72QHfmhEw1OgmgvLINfWwqnYv/OI8FOnkIYyvQCUnhHK5tLOF?=
 =?us-ascii?Q?SGA+oaENCcHeq12edrsE0CTCtncM8oHOQQSTTZUGPU0B5KBMrjpVv+2re4rK?=
 =?us-ascii?Q?7v8IVSoVBfniGfQEn6Gx6oz6CD6SaayCLbemp8fAltfDgW3R67eyVMj8RUQq?=
 =?us-ascii?Q?st3OxfMqm/nw4yZYcZ0b/EljGZ8mrZcqhlNnZX6aq219tPALIP41o1ELGioa?=
 =?us-ascii?Q?eARcIRfRsia1/QsEaJTcaZQIOXeSfmLn6kunFBO320fDrpV7FcYgezhL6u+3?=
 =?us-ascii?Q?m/0xsRcbUsB5sGqVlV4ve5vA2P7/Vl3++TMI84hPTixG9TqUajKDbtBIQXW7?=
 =?us-ascii?Q?4M61CbqHSYWu6T9yfsFXb6qUIFbMvgacLbk6QDJ9bIFSXWG0vpe3waMiNjj9?=
 =?us-ascii?Q?C1wLinso7XF9sfnq+CM1LmMI+DFCl+CC63rQtPh/6zLv2dWyt2sxDho99H7F?=
 =?us-ascii?Q?Cw1+jFrDQ/kMkRpsJZncmtv75FngwPKuxyRZN/SvbZomL2cQcC2Dm6EweSn9?=
 =?us-ascii?Q?ZDHRuYg5j093fViqtejOs7DI8+4sctYrMDTEd3SmZlTU3NIrczlYaPR5D2nA?=
 =?us-ascii?Q?3yCPJpIxvFJTzeQSpgXxx9ZSkbNDHWcSrn5QLdg67etL8c5YrNFBqq5uOtyW?=
 =?us-ascii?Q?hew1r6aHlwS5TNInAdsJbIgt9wsnLozhyjZrbUgSLVHXzJfZK5asD89Ms1yJ?=
 =?us-ascii?Q?+VESwgemPV2C6DZuya4WDixSyBdF1noI4StckcySVSpxk7JGAq6Qombea5Qf?=
 =?us-ascii?Q?Kf4lFXD/7U2ogDk0iA23wpHgXHfE9vsgO+KSRCvTjOGUvDKNYGyWkWvekfHa?=
 =?us-ascii?Q?eN9SJJe8vuaXsllDppicprM1E02Z6M/cqiEbFa+t4lgZXKmUtGV7sf9q6TKt?=
 =?us-ascii?Q?5hawZuNKRbTOqYheIBi2rK5trJQi/ogHq0dj09Bif/r1eOcXCstPo/eNvzOa?=
 =?us-ascii?Q?mcT2KLJ8cqQ47gcEPuvHZqgTJj69p0kfXfjSRsXt1PIUIZJGs6IHpyQsSmUq?=
 =?us-ascii?Q?8KbMQ4Mp5w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d124421c-582d-4ebc-f4df-08dea0b6601a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9176.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 21:30:29.2375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dkTtDbMb9+ZlPxUXJbpMuAfvcjgJcZLSgCwWiLTmVQrfpTEgLkrQQiZk+YRqP988TBsu6B2FBLWb/fsS/tvKnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8870
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
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35378-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org,bgdev.pl,lunn.ch];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 07D0244AF95
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
 drivers/gpio/gpio-rpmsg.c | 573 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 591 insertions(+)
 create mode 100644 drivers/gpio/gpio-rpmsg.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 020e51e30317..4ad299fe3c6f 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1917,6 +1917,23 @@ config GPIO_SODAVILLE
 
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
index b267598b517d..ee75c0e65b8b 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -157,6 +157,7 @@ obj-$(CONFIG_GPIO_RDC321X)		+= gpio-rdc321x.o
 obj-$(CONFIG_GPIO_REALTEK_OTTO)		+= gpio-realtek-otto.o
 obj-$(CONFIG_GPIO_REG)			+= gpio-reg.o
 obj-$(CONFIG_GPIO_ROCKCHIP)	+= gpio-rockchip.o
+obj-$(CONFIG_GPIO_RPMSG)		+= gpio-rpmsg.o
 obj-$(CONFIG_GPIO_RTD)			+= gpio-rtd.o
 obj-$(CONFIG_ARCH_SA1100)		+= gpio-sa1100.o
 obj-$(CONFIG_GPIO_SAMA5D2_PIOBU)	+= gpio-sama5d2-piobu.o
diff --git a/drivers/gpio/gpio-rpmsg.c b/drivers/gpio/gpio-rpmsg.c
new file mode 100644
index 000000000000..993cde7af2fa
--- /dev/null
+++ b/drivers/gpio/gpio-rpmsg.c
@@ -0,0 +1,573 @@
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
+/**
+ * struct rpmsg_drvdata - driver data per channel.
+ * @rproc_name: the name of the remote proc.
+ * @recv_pkt: a pointer to the received packet for protocol fix up.
+ * @channel_devices: an array of the devices related to the rpdev.
+ */
+struct rpdev_drvdata {
+	const char *rproc_name;
+	void *recv_pkt;
+	void *channel_devices[MAX_PORT_PER_CHANNEL];
+};
+
+static int rpmsg_gpio_send_message(struct rpmsg_gpio_port *port,
+				   struct rpmsg_gpio_packet *msg)
+{
+	struct rpmsg_gpio_info *info = &port->info;
+	int ret;
+
+	reinit_completion(&info->cmd_complete);
+
+	ret = rpmsg_send(info->rpdev->ept, msg, sizeof(*msg));
+	if (ret) {
+		dev_err(&info->rpdev->dev, "rpmsg_send failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = wait_for_completion_timeout(&info->cmd_complete,
+					  msecs_to_jiffies(RPMSG_TIMEOUT));
+	if (ret == 0) {
+		dev_err(&info->rpdev->dev, "rpmsg_send timeout!\n");
+		return -ETIMEDOUT;
+	}
+
+	if (info->reply_msg->val1) {
+		dev_err(&info->rpdev->dev, "remote core replies an error: %d!\n",
+			info->reply_msg->val1);
+		return -EINVAL;
+	}
+
+	/* copy the reply message */
+	memcpy(&port->lines[info->reply_msg->line].msg,
+	       info->reply_msg, sizeof(*info->reply_msg));
+
+	return 0;
+}
+
+static struct rpmsg_gpio_packet *
+rpmsg_gpio_msg_init_common(struct rpmsg_gpio_port *port, unsigned int line, u8 cmd)
+{
+	struct rpmsg_gpio_packet *msg = &port->lines[line].msg;
+
+	memset(msg, 0, sizeof(*msg));
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
+	ret = rpmsg_gpio_send_message(port, msg);
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
+	ret = rpmsg_gpio_send_message(port, msg);
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
+	return rpmsg_gpio_send_message(port, msg);
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
+	return rpmsg_gpio_send_message(port, msg);
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
+	ret = rpmsg_gpio_send_message(port, msg);
+	if (ret)
+		return ret;
+
+	msg = rpmsg_gpio_msg_init_common(port, line, VIRTIO_GPIO_MSG_SET_VALUE);
+	msg->val1 = val;
+
+	return rpmsg_gpio_send_message(port, msg);
+}
+
+static int gpio_rpmsg_irq_set_type(struct irq_data *d, u32 type)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 line = d->hwirq;
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
+		dev_err(&port->info.rpdev->dev, "unsupported irq type: %u\n", type);
+		return -EINVAL;
+	}
+
+	port->lines[line].irq_type = type;
+
+	return 0;
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
+		msg->val1 = port->lines[line].irq_type;
+
+		if (port->lines[line].irq_unmask) {
+			msg->val2 = 0;
+			port->lines[line].irq_unmask = 0;
+		} else /* irq set wake */
+			msg->val2 = port->lines[line].irq_wake_enable;
+	}
+
+	rpmsg_gpio_send_message(port, msg);
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
+					    sizeof(*port->info.reply_msg),
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


