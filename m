Return-Path: <linux-gpio+bounces-38900-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1J5RO7lPPWqG1AgAu9opvQ
	(envelope-from <linux-gpio+bounces-38900-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 17:56:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A01676C738C
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 17:56:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=j3nFkM9G;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38900-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38900-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F4AD30517B1
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 15:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BC53396B73;
	Thu, 25 Jun 2026 15:54:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011025.outbound.protection.outlook.com [52.101.65.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE4D32BF44;
	Thu, 25 Jun 2026 15:54:53 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782402898; cv=fail; b=kEZ7Tnzt2s2699owEtCqu65O0Q6x45Ln3/YSktCXeydqeIL3Bh9pw8yF3tw9mAzqdEEAjSmSWuwbUmuzYkwBTXDkV7tNdmr6KZUw45j0f0DWb1Bpg2FAr1kR7uBzLGCZGzIxo0rrNfa6nPidIO/uKqurspg/unLNZwMNNKVnJgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782402898; c=relaxed/simple;
	bh=e9ZGF6IRzFD8d3pFGnMDoyPvQARRs5JcrHW2/JQKWZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T3D70X2Upj3myelzZcRb+QJRJjbBud7uWNYS+LRlmkvvo5HlDpo719V4zesNi5td5e142PvjkpJmbunibo7qf4FPHr8B0FOaVrDwHj/E7C5u1xXeOFQU5q18cW7rKZXtUeMMQbkjqnJlQ1JU+2wY4WFvaHI4r1QwjTx8SPfA2eM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=j3nFkM9G; arc=fail smtp.client-ip=52.101.65.25
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uwjP92ml9x70ytxU48/oiom5ELCTjJQogGuJXodrCOZLsaJaz7u0njasbYvsT8FT4opdPJDsZXF/YWDGYrga/Qgwm39AJT7aEWCbYuGIIr1U+XeJMuxkMuSBNpx+daJeE3Kj/eNOef2gUENlEtpSJOlBqQZhL1SxcajTNvD5bIbuwUaDEUCtc1j+Wg0L8Z0Muybf/X+qUk5pDuxYaH6MMWqbrZcG2zVq5lF1PFUN79n6+lSs10GnuveoQvjT3/IlZmg8F536vBlcmEHo/8ddg/z8tJkhfEo0OILnEENUJfs3Xqh8zwEaqYAzeMPnG6C0nnmT48GQpzHa/NMehSJKAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/EflOYNqqfJ9WzJdXDP641oU8Z1Cxge2c0KDWcs8lw=;
 b=PxLrqmmBRO/ndiFEC8PSZVYXyX8tdnsPPENfOdcS2fDXXQLoHPJks52RjLCpBXu822R5vcvdf6DReffGH7aDcCeIzE0o92NTjnH+x1znNyv2trJsXEZ48JoPBfCsbeeRdVZGtOzIyT8S+oX3tb3zaiS9rwtixGg9OLsPfGD9ZIfylUs+smB9SDM6zQ40Kqh+/xJCo2mw6NdW5d319ChDUdRPPjva44klidGhtoDxjzbOX/WoYNarN8LZY453mR7mClgJF7Lj+U8AFbS75YfLpBMGNlVSUiyrpQvuRhnYXBLjXesKue12+3sGEdT0hURTNQLvD/+sJfQuHiqH1q+rJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/EflOYNqqfJ9WzJdXDP641oU8Z1Cxge2c0KDWcs8lw=;
 b=j3nFkM9GjLzJvTrnMCspI77bmQ6c+dVyI5pIpy2MfnNCyWfc0IFqesqVFfnYLRCnoKynZyuPUiHwGYcJ8D57gn6VLKr/Z2ACe88HT5u3URAUHmWj1oaHVQJk8/CtTHzcf4el4LDYZ7mjW7wJNETFxIl0nJiMTHZ5zGNCylBLs1vOI18piIlEvz4pcortaCQ0DEHWUg1DeXpM7MENGukR4/MALyNHWQh4haBzVtcUQjamCeytFp2L5LCB6O9awSxAb0E39ksid+FAtTcL+h4vdx4E9OJm9xojOdWO0IjM+EhZx/lJwvHjb+BLW+yaImfcOHy6adhuSmG7GLLsaTG0zA==
Received: from VI1PR04MB7135.eurprd04.prod.outlook.com (2603:10a6:800:12c::22)
 by VI1PR04MB9812.eurprd04.prod.outlook.com (2603:10a6:800:1d2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 15:54:42 +0000
Received: from VI1PR04MB7135.eurprd04.prod.outlook.com
 ([fe80::322f:adc4:8d65:2ba4]) by VI1PR04MB7135.eurprd04.prod.outlook.com
 ([fe80::322f:adc4:8d65:2ba4%6]) with mapi id 15.21.0159.015; Thu, 25 Jun 2026
 15:54:42 +0000
From: Shenwei Wang <shenwei.wang@oss.nxp.com>
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
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	b-padhi@ti.com,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver over rpmsg bus
Date: Thu, 25 Jun 2026 10:54:26 -0500
Message-ID: <20260625155432.815185-2-shenwei.wang@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR13CA0029.namprd13.prod.outlook.com
 (2603:10b6:806:130::34) To VI1PR04MB7135.eurprd04.prod.outlook.com
 (2603:10a6:800:12c::22)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7135:EE_|VI1PR04MB9812:EE_
X-MS-Office365-Filtering-Correlation-Id: f9b0c928-b05f-4665-bcea-08ded2d211eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|19092799006|366016|1800799024|921020|6133799003|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	xKaCoNZUaih4Kyx+cWJ6ctNFmjAtYzwWqqvO+4vKYosSqQPD7qSLvAdmi+MXsglDbR8oO6XwIjA/TzkLpFZMp8rtYVVMba/r1EdH5Y8iMJ2sB0xxvsK3pTcF4euxtte9spvz7oEP0AuCgxU6HmKQx17qC0AT8iJgWMUQTWM+bMIZDMSisr4ArUd8V6rHXEiVf0IJUQ5cp5VrGCfvPfVDqKw0Ie9KpcTZRNxSEIjP1PERRG4gZ8OA5rJcRjSnC3+tVhteQW8QITTnPy2VJdVNdD5WqarzzAnFTMlT708H38GsfzcA+5AiAdAf3vMSzehtjuIxuVyGs9Dr89zC2szT7SsPUomYWBAwkLV8zSOHAxyV8vvHhOPq1jHmlAVKPBoGBW0iMhhpJCb/dHxJMC/KFfi3ylyRacsjYy1UDmaEcTTv3f9FxTfAairKPwBqfjK14iJ9cEB7o+OPEWqrr0ZLg/M/CvWMCWYb3zgotiWbxC6vaiC2odOwZ0MOhVKGfwnolfTAPDpRBrxKzrFOOkAUGupdQpYB+l9qXRqY+9+Mk97Vs81aIsi9i/mjpmNuTshfbg+4WF8H/CY3ptxfrz3H8CFmQX4y4N+8OsGmrHzpXu3iIpg5kZoDuVCmfVozOiyYLpYrADl+S9XkkRnuDR/MCk3uTko3BEYhh7iv4+yrlJJ+bKZiaMABbR6X2y5sF14V/kacm/SC4C0M8OIrXp0tdw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7135.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(19092799006)(366016)(1800799024)(921020)(6133799003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0NB2lHFM7m663S2AQoWpIr068kxh+xB2KIlmXbiY+Zcq7mp9bawf7gutMt+v?=
 =?us-ascii?Q?qTLvtHsGMr5sfVkNdlwq63iQrgmrOOzfcYuEfUid5DtGkeEnWSeBapgpWWV5?=
 =?us-ascii?Q?aCi3HBjCJqDAqE6fQS0e2W8BmM9xCpIhTtHwNFW7laKzR1oqZQmVED8iCgNV?=
 =?us-ascii?Q?2ViXYAYBI+h2158um253uY/+/adA3mJqqq6sDlprBP3xcWCjM3JRjppSgJLi?=
 =?us-ascii?Q?G3jqikaYEkWsR6WG902H1KU99Y8fwINsRjgOmYrRhjuVzz2kcgykpADc2ByY?=
 =?us-ascii?Q?ewnxvgzYeVb5aFXZiX1Z0TeSbx9zmpZUQnMSqWCsbSdld/B/AkWAumu6rZv8?=
 =?us-ascii?Q?PcbvSRNW4xpmlzNEBvbbcx+cDwvKmFcrlDpL7ePiwO0nucmJPxQzZwYLksC5?=
 =?us-ascii?Q?JZQhOS8e+3s0ts+Z980FUV6XJH6tCbXNAQ5GD1zLfXEntz/6xkex5rbtxe9h?=
 =?us-ascii?Q?Q5jzyAo4Y/k4WPYaoBsRIC5shQ6pcOUyxluPZrVWyUI66+JmSds2sBRXVrGe?=
 =?us-ascii?Q?JfZKiTsIjPtIhcjES3sW8SmOkCgDfg8f5zE9vc0aHdiSciyLQNt8GbeCQjAA?=
 =?us-ascii?Q?GZInZ/rs4aN5a2CUU8UqH61pWF4YbHSvui+y9VFNIbNghy1pCmOMRPPjTa5+?=
 =?us-ascii?Q?+n0JN1XAzNroClDCMlXpb4XMmVQ0T3ayPYPYTWS/JxGZtyGH2icUhn/9PFGE?=
 =?us-ascii?Q?ar8nrspE4rfgS60xJyUOeDje5P+fufl2YtdDgGGi2bXUxbLzIokFTYAJhnKn?=
 =?us-ascii?Q?DYgRqtSWtR95qS+8/PKZUS3dzQF2Y7GGzd+Dwsbedl4zR6lWYZosz3qRLkrj?=
 =?us-ascii?Q?mbFsiUHC2wMsOw3PkxOX6T7AuHMwTz3PzS+WM9Y79aoopy/A8W/Za6zCSrQU?=
 =?us-ascii?Q?vACYiLMpFNnjARv8+kSJ26rqIdUVtYowUUeivKr4SDn/5sgBNr5y0N7ma0j/?=
 =?us-ascii?Q?Muh5XBPssVhVfDIGRWCdlqaC9ykd/ylr5/e8aZB89xKVVyI/RdUAWNjvN1Oy?=
 =?us-ascii?Q?6ELrdafUcm5nyQ0vCXWsKWx8ZFbbvRGMI/53gcADvfclI058XknyZ5/+u/82?=
 =?us-ascii?Q?u0wSNrX6t31rWwnDD7RJ0FxTQrLVTAW0z04E29Ao1d9ovU1f8BiJbCofu/nG?=
 =?us-ascii?Q?IDaB+H8npRLipj2IqzpqXmdb7mKIHeLH3DrfMEy80tnm42Rn7vMzcmOQeiyH?=
 =?us-ascii?Q?HmdCu6q28VlYWbje+jXLzvHCh2qrKrcJ/hB/haGCqbKQr9lmKn6pPVFkuvoV?=
 =?us-ascii?Q?d2ItG1oojeabAQrBqSG5p7mFkUMCI9YPGwSS8qMxChrd3EynmIrfVyUFXG0W?=
 =?us-ascii?Q?OlgwLD7lRqkZXhYtUxoPYQZPndXyJ3pz4KAuTLr3NTwTpfGp65FP85gZoArW?=
 =?us-ascii?Q?Jea9IY4iZfdtbbScJWtMeD88LjzTgFId26veWAw7tw71zKdeH5Tvk7wl/mhq?=
 =?us-ascii?Q?cWpfCfP1mmmEUU9JzLkvkTEKncZXVRMfK8RelQcyVr7KM0DnAwDlSe24Kggf?=
 =?us-ascii?Q?m1iQChFrfNOI4IWe16zPUuGdV5/aexR/y+OLnl292ISImwphHe/rxYookCu+?=
 =?us-ascii?Q?5922lNyko+B9fn/8271M8t9wfU8a1xpN/+om+8/Qz94VkcUP7XyYPbfLLjrN?=
 =?us-ascii?Q?dhb0sb3FKwnzvHqAAhRDV5+vLssDRuqyWHYCDxnWOcxRDoL29hb7r3boYsuM?=
 =?us-ascii?Q?JVIj5c7ciaIdA3h0Gj5b0OF2ASYmCxs8j4Pd5Lqu9N2KhSecESFsiO8EcBLj?=
 =?us-ascii?Q?eMq/82btWNOsTok/3T0h02XJgTAfvWfuiD3RQTvbAPSpEazHFk5I?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9b0c928-b05f-4665-bcea-08ded2d211eb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 15:54:42.1776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HFlbkf3BPezo1/2DrDLrBQNAVKdd1BjsctexgpNYhquysDmHJ3iE8BzDmOFXJlkCzMQsY/m+YieQ1uJ0JfsdMErgQN5snEG0sFDrlADJ9xZv/0yT7GA16MFE+1dYsM4q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9812
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:corbet@lwn.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:skhan@linuxfoundation.org,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel@pengutronix.de,m:festevam@gmail.com,m:shenwei.wang@nxp.com,m:peng.fan@nxp.com,m:devicetree@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-imx@nxp.com,m:arnaud.pouliquen@foss.st.com,m:b-padhi@ti.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[shenwei.wang@oss.nxp.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-38900-lists,linux-gpio=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@oss.nxp.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org,foss.st.com,ti.com,lunn.ch];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A01676C738C

From: Shenwei Wang <shenwei.wang@nxp.com>

Describes the gpio rpmsg transport protocol over the rpmsg bus between
the remote system and Linux.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 Documentation/driver-api/gpio/gpio-rpmsg.rst | 271 +++++++++++++++++++
 Documentation/driver-api/gpio/index.rst      |   1 +
 2 files changed, 272 insertions(+)
 create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst

diff --git a/Documentation/driver-api/gpio/gpio-rpmsg.rst b/Documentation/driver-api/gpio/gpio-rpmsg.rst
new file mode 100644
index 000000000000..7d351ff0adb0
--- /dev/null
+++ b/Documentation/driver-api/gpio/gpio-rpmsg.rst
@@ -0,0 +1,271 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+GPIO RPMSG (Remote Processor Messaging) Protocol
+================================================
+
+The GPIO RPMSG transport protocol is used for communication and interaction
+with GPIO controllers on remote processors via the RPMSG bus.
+
+Message Format
+--------------
+
+The RPMSG message consists of a 8-byte packet with the following layout:
+
+.. code-block:: none
+
+   +------+------+------+------+------+------+------+------+
+   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
+   |     cmd     |    line     |           value           |
+   +------+------+------+------+------+------+------+------+
+
+- **cmd**: Command code, used for GPIO_RPMSG_SEND messages.
+
+- **line**: The GPIO line (pin) index of the port.
+
+- **value**: See details in the command description below.
+
+
+GPIO Commands
+-------------
+
+Commands are specified in the **Cmd** field.
+
+The SEND message is always sent from Linux to the remote firmware. Each
+SEND corresponds to a single REPLY message. The GPIO driver should
+serialize messages and determine whether a REPLY message is required. If a
+REPLY message is expected but not received within the specified timeout
+period (currently 1 second in the Linux driver), the driver should return
+-ETIMEOUT.
+
+GET_DIRECTION (Cmd=2)
+~~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +------+------+------+------+------+------+------+------+
+   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
+   |      2      |    line     |             0             |
+   +------+------+------+------+------+------+------+------+
+
+**Reply:**
+
+.. code-block:: none
+
+   +------+--------+--------+
+   | 0x00 |  0x01  |  0x02  |
+   |   1  | status | value  |
+   +------+--------+--------+
+
+- **status**:
+
+  - 0: Ok
+  - 1: Error
+
+- **value**: Direction.
+
+  - 0: None
+  - 1: Output
+  - 2: Input
+
+
+SET_DIRECTION (Cmd=3)
+~~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +------+------+------+------+------+------+------+------+
+   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
+   |      3      |    line     |           value           |
+   +------+------+------+------+------+------+------+------+
+
+- **value**: Direction.
+
+  - 0: None
+  - 1: Output
+  - 2: Input
+
+**Reply:**
+
+.. code-block:: none
+
+   +------+--------+--------+
+   | 0x00 |  0x01  |  0x02  |
+   |   1  | status |    0   |
+   +------+--------+--------+
+
+- **status**:
+
+  - 0: Ok
+  - 1: Error
+
+
+GET_VALUE (Cmd=4)
+~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +------+------+------+------+------+------+------+------+
+   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
+   |      4      |    line     |             0             |
+   +------+------+------+------+------+------+------+------+
+
+**Reply:**
+
+.. code-block:: none
+
+   +------+--------+--------+
+   | 0x00 |  0x01  |  0x02  |
+   |   1  | status | value  |
+   +------+--------+--------+
+
+- **status**:
+
+  - 0: Ok
+  - 1: Error
+
+- **value**: Level.
+
+  - 0: Low
+  - 1: High
+
+
+SET_VALUE (Cmd=5)
+~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +------+------+------+------+------+------+------+------+
+   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
+   |      5      |    line     |           value           |
+   +------+------+------+------+------+------+------+------+
+
+- **value**: Output level.
+
+  - 0: Low
+  - 1: High
+
+**Reply:**
+
+.. code-block:: none
+
+   +------+--------+--------+
+   | 0x00 |  0x01  |  0x02  |
+   |   1  | status |    0   |
+   +------+--------+--------+
+
+- **status**:
+
+  - 0: Ok
+  - 1: Error
+
+
+SET_IRQ_TYPE (Cmd=6)
+~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +------+------+------+------+------+------+------+------+
+   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
+   |      6      |    line     |           value           |
+   +------+------+------+------+------+------+------+------+
+
+- **value**: IRQ types.
+
+  - 0: Interrupt disabled
+  - 1: Rising edge trigger
+  - 2: Falling edge trigger
+  - 3: Both edge trigger
+  - 4: High level trigger
+  - 8: Low level trigger
+
+**Reply:**
+
+.. code-block:: none
+
+   +------+--------+--------+
+   | 0x00 |  0x01  |  0x02  |
+   |   1  | status |    0   |
+   +------+--------+--------+
+
+- **status**:
+
+  - 0: Ok
+  - 1: Error
+
+SET_WAKEUP (Cmd=16)
+~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +------+------+------+------+------+------+------+------+
+   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
+   |      1      |    line     |           value           |
+   +------+------+------+------+------+------+------+------+
+
+- **value**: Wakeup enable.
+
+  The remote system should always aim to stay in a power-efficient state by
+  shutting down or clock-gating the GPIO blocks that aren't in use. Since
+  the remoteproc driver is responsible for managing the power states of the
+  remote firmware, the GPIO driver does not require to know the firmware's
+  running states.
+
+  When the wakeup bit is set, the remote firmware should configure the line
+  as a wakeup source. The firmware should send the notification message to
+  Linux after it is woken from the GPIO line.
+
+  - 0: Disable wakeup from GPIO
+  - 1: Enable wakeup from GPIO
+
+**Reply:**
+
+.. code-block:: none
+
+   +------+--------+--------+
+   | 0x00 |  0x01  |  0x02  |
+   |   1  | status |    0   |
+   +------+--------+--------+
+
+- **status**:
+
+  - 0: Ok
+  - 1: Error
+
+Notification Message
+--------------------
+
+Notifications are sent by the remote core and they have
+**Type=2 (GPIO_RPMSG_NOTIFY)**:
+
+When a GPIO line asserts an interrupt on the remote processor, the firmware
+should immediately mask the corresponding interrupt source and send a
+notification message to the Linux. Upon completion of the interrupt
+handling on the Linux side, the driver should issue a
+command **SET_IRQ_TYPE** to the firmware to unmask the interrupt.
+
+A Notification message can arrive between a SEND and its REPLY message,
+and the driver is expected to handle this scenario.
+
+.. code-block:: none
+
+   +------+------+--------+
+   | 0x00 | 0x01 |  0x02  |
+   |   2  | line | trigger|
+   +------+------+--------+
+
+- **line**: The GPIO line (pin) index of the port.
+
+- **trigger**: Optional parameter to indicate the trigger event type.
+
diff --git a/Documentation/driver-api/gpio/index.rst b/Documentation/driver-api/gpio/index.rst
index bee58f709b9a..e5eb1f82f01f 100644
--- a/Documentation/driver-api/gpio/index.rst
+++ b/Documentation/driver-api/gpio/index.rst
@@ -16,6 +16,7 @@ Contents:
    drivers-on-gpio
    bt8xxgpio
    pca953x
+   gpio-rpmsg
 
 Core
 ====
-- 
2.43.0


