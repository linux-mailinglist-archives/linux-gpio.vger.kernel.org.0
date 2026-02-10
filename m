Return-Path: <linux-gpio+bounces-31562-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IfgIS5mi2kMUQAAu9opvQ
	(envelope-from <linux-gpio+bounces-31562-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 18:09:02 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF4D11D9BA
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 18:09:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA37D309949B
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 17:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2922B32AAB4;
	Tue, 10 Feb 2026 17:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iQP7Mw/B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013015.outbound.protection.outlook.com [40.107.159.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D535C3254AC;
	Tue, 10 Feb 2026 17:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770743161; cv=fail; b=CD9HNWoCkus8BYQdFt5icfKBS+SjYWmRH8Vr7iXCEtiNQlK7u7qnk4sx6OTYFGOJ5ocjVG7kRzpRhqe4A9bGPOxHOr7/xYS9OVgU411nn3FmUHLFFFJrcx2dcTMAU4HDleElP5/tKxNT5srbLy9g1jzI2K9ci3XKzVq+BkX4OQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770743161; c=relaxed/simple;
	bh=IUbXczJdUryHr3ghtGFlioWLWNHknfNVsDIEVGSmIBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gbyiM0jbNtxaUY0KVFv+bWbdCucAL5JbpcG6/3FYOAxj5nNwZ+b1hDKaNloaVNtSrtojKk98p7T/ugXbtRtYZ2RAZAK+Lf9NwxCOZeEycXAVFp4RICPIMm7JTFjKwWED9m4yLUPHxs8FPLMypoyOz5/0WUcryDbMF5ElavaRS30=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iQP7Mw/B; arc=fail smtp.client-ip=40.107.159.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cFz3FIGd8NV6kJHJEM4qSVUqML2CMS0miTROlXfcV2ajqnLn2hILuhbpXvRIIaBO6H8g9ni+ZoLxj2qPsqmIm0oiIT7ef+5AiWVct3VbU0bOu/09BOtukZgROHnt07hhAJk7UmdrGduT7HBQu5CtcPtDfAPl6OIhF0yA5/W3v0b5A92w4ceiuELdfovCmLFZ4oL8sbbn15UXDAhNoSCqfofWm4DhcvEVDHawFz0QT1OrOmjQcXjZJtZEe9aMpwekifWnPtxX4JOa9U1RXODzg36FUKZUCDhdIGrKrCvRM2oD4XIZWj81LGA5uc/snKgOOmCC5zrDLzzYwHfLzPsr7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pcN7mSi9E44BPAMmSWYuMLIpJiui0LAfPQmHKjLFiVg=;
 b=UIS+7vH5rY87VXdcDsSKfZmvxwJRwkxUa7HYCMU8VBmNtihYyBj/VFJdGfEneeveyD+CAqvmAg7bRMzOja8sIu89O4fgdMH0P2PSwyIcEdqkfSe/6+xUsnU4pJZXhdI0Z1wX6ulY65328qzAXtPK320a7yCDSt9yanFOYVWxvVUHl4feAKmPNf3K2xiM7ap+UrnLT8zxx5Y/b/ii00lhYzrA+WXVAp5tvBpE2yEF/SXV/zDDMnC4pnnX3tRAy41u+UV7664/+d00jDjQ9rsyqas7ndcgtlZvoNngXGD2up0CU96c2ck4JikqHiX+BJElPUweC+XxB4egtBWtD3JbYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pcN7mSi9E44BPAMmSWYuMLIpJiui0LAfPQmHKjLFiVg=;
 b=iQP7Mw/BG0TDcS7VUvJYZpVoWspJ7J7Aus0TUNAdR/mqCzNsmF0lTG4UeIUi5Kv+PTnbA+tAkRN7Ck6eButclnGwwBVxVpo94zy67JJjWreGTu3oD78llKlbeoUGwpoCPe8yhQ8vGdbZvkyZXetZprbxWFA0tXepmzjgOENgrc2QXjK/fBYuUTm946tqEwf7O7ne28joUYguRRboGtw7KvUK6dT4w5socG55Tz/LRMMoiPbfTxJMJlFcffo2HuGw18O/dzllyrt6uyfGlNvhW+MMpgn5oalakNI2h+1bZuBK9IHIIol06CKDB2NRnYPz7D++aD9KOniJ2EH3h6B59g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DB9PR04MB8362.eurprd04.prod.outlook.com (2603:10a6:10:241::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 17:05:54 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9611.006; Tue, 10 Feb 2026
 17:05:54 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-imx@nxp.com,
	arnaud.pouliquen@foss.st.com,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v7 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Date: Tue, 10 Feb 2026 11:04:38 -0600
Message-ID: <20260210170439.406513-5-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210170439.406513-1-shenwei.wang@nxp.com>
References: <20260210170439.406513-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0092.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::28) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|DB9PR04MB8362:EE_
X-MS-Office365-Filtering-Correlation-Id: 004994a5-c3e2-4dfb-a5f2-08de68c6a6d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|52116014|7416014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Pt/LcEeVXPEZ/2i75qorhhrIMOnMDNcjlfpcOajv/Q9Cp4NBwvDtSqOm/147?=
 =?us-ascii?Q?XD25/ZJetDr46B/wyfvEG5itnvhEsp+DxuiRusq1fnK70X92Ouwq9qeHgLU7?=
 =?us-ascii?Q?098u41hLumB3yUcsFJEPZf0cZqo0z7KfYi1LKHWVng+sNmOugwNtEvirkXPt?=
 =?us-ascii?Q?/y6RP9fveNQcxqDGPiKrybDxnpfoapd5u4u8/urCvaStQ3IlPMrNKZDaqg/v?=
 =?us-ascii?Q?y0d6Mb/T8R6GioS2NmaCkKd+HcRmdy5ORqrSRPlu2WvKVE9S7KKhO/zpfztS?=
 =?us-ascii?Q?n/No+rVxOVRhq3cOVJ3+Gliv3W43SPJ0pcDbLSR0zNE/XVQ0ZnM0rbdKj/vh?=
 =?us-ascii?Q?KJa0FWGDbuTZ2Xc/69qHimenhdlo9HRnvR1VcTIcBvOYAEB/pCD2BIseYOmC?=
 =?us-ascii?Q?/KkXDt/6CPL73MjMc0m84krjZQo77nRN28amDHChYgyqqinni80YlbDliWkj?=
 =?us-ascii?Q?rIu+lP/jJNLDLn7php020JhifsnzVFE1vxVOPEDQYQyWy3ZoBnkboonmA9nG?=
 =?us-ascii?Q?T3bRHlLJvVsAO2UBbshrEuXUZV4c5crjJbV8TcXAgR0tmeMl9aK200OPSBOS?=
 =?us-ascii?Q?pm1MplEtKfpC2PGN0YnG/orXEMSdFhIOhadF3m33IdMjvkCC5bNBRF7MxStW?=
 =?us-ascii?Q?vz6VNjAExKN1TG3onUA679A1kqu/TkB0YKK3zo7M2EAyRvgCzLd3w/lFm8WK?=
 =?us-ascii?Q?LDrpS1kRkkLHPSFl/RzvjkgdQ2SeKTH9AXZRW5W3drsdTOjknoowuzEeQtJM?=
 =?us-ascii?Q?V8rbQKYny5/1mEp+Y141Rkr6PGwb6W1RsG9fYOrLdSSzGyW4JRV4/7NookQg?=
 =?us-ascii?Q?WHVZWVH70yjA1oOySNZTikwwmMZNAENHtFBB90+o8ny7mr322S6CdESsVP6G?=
 =?us-ascii?Q?3ASkDh/LrNw8qR+AuzGrowGJe4Z8vKcOFE7yQWjLuDe7FhK3OZ7DOj+cJtkT?=
 =?us-ascii?Q?/JDrQWK6Bp5aPn9pwyzVfCVXV+I3qSzm0JQuyMtZbPMGC90jdVzTU0SyFIa6?=
 =?us-ascii?Q?m36KM7Xhk61zGgCx0C4mcOdWRHtHZEIwEdG8txiQ7QSFSVAd7goNVa3FCa9/?=
 =?us-ascii?Q?aUMZmMnw4oFrffFSUxu5ieLb3LqfqbMv1cHlkr/ugXpkSnUEeGygU/AZgd1g?=
 =?us-ascii?Q?9x+xMNJkU6MMjLxVxKoewFk52s7ofJnJ1PEcnKA9zLFbrRl+6fGeg5lNmLxu?=
 =?us-ascii?Q?AKZULlYEUimZ82na45Lcfyf1Dc6iv6qSXiuAZ3lx5W7VqvsCoAvYLCXjCCne?=
 =?us-ascii?Q?KuEO39CbclG/KbacYJmWGiOQVeQz/x8NuBulaeO5NdW3e78fLlFP0WZMB0qY?=
 =?us-ascii?Q?HbZXR9xx3HS+zAeyOUgnP51I9fZunZ24zi+UzbU24IkJa9rgCcNGHM9mKX5g?=
 =?us-ascii?Q?1Nf6ILOe/n2RREAfCWvTkE7YPxlyWrcuCBW8y2jK0XgOQb0+mxaTmGpNvLRi?=
 =?us-ascii?Q?CX/k7URlqRVohjRqOTUWnrvv0XmBWKcjjr3wIkGvWkkTtydC1xowlIjr+RFy?=
 =?us-ascii?Q?+EC4juTXIIuz3Vin1tuFfVWua2JKS1/DaYH5I2YPeaIBdC5EjhHwtfo30Byx?=
 =?us-ascii?Q?fMlWKx4fhuP9quM/MbnUSbTlSsNTOWoraGRWh5LSKutDvAQMSHJrbqyFPOVS?=
 =?us-ascii?Q?hMSfUfNdzTk+kiOqjin395R202UsWSREDK4KN+MRYjmt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(7416014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?leuVC8nfHzbkB0RO7QM/gKoe4/McIm9xVQPlR+ZiAyx+mBhASpcSfX64eMpd?=
 =?us-ascii?Q?jHiAbSLDUmr/rndSfMWT0UXzrqfUxmleEFJk/cFj+uSrvfYp0F2aud3IFX7T?=
 =?us-ascii?Q?PMJwJpF2gcb0zyEgAlPABqwtfC+TfeTANT5fYVh+4OpxZkkO1Y7IDwHqraLy?=
 =?us-ascii?Q?QLw0EPRg2OXMdpmyQBLFoLLLFpQKlYtVMuofOp6cSQhVVo2oEv87e4mKbiz7?=
 =?us-ascii?Q?gEAydi85M7/a1SOWv73IeQtLBB6VvZGWCrN5oLFcAIJikUVAZHueFqvgx8Jg?=
 =?us-ascii?Q?lIXQLuinKHLQrs/KgUA/4L2FwzmN9J/T66sbECvPScc4NDIL/NbxTSvsmS3t?=
 =?us-ascii?Q?OJX0eOa8edYQowydMBOE65wKJRHNrZnYPw2cH52VtXBx+pJA8v2gW2ufkilC?=
 =?us-ascii?Q?5SeHEWTxQkI+50KulfdFQ+lWZswux5y5PtUq4cDtqZ474brguIMZtShkC93Z?=
 =?us-ascii?Q?BPdqM5uChmiU+AONlHXDLE/Ys2fBfUIOhsI/UkyY3PGaOVEnMd0myWN01whN?=
 =?us-ascii?Q?iItxpqfUcU7QAAFY7doweVxz48mrOzW8eBgfcZGHKHKnC9pEDo7S96Dbqni4?=
 =?us-ascii?Q?78v2874onvYXoegRGONdrOAtc0T4tpOhiBDRyN2gIyZMOa+bXl+2d3Q8YBnl?=
 =?us-ascii?Q?GUrsIQMhR7XGxnRpfTnTmr3QFXqfAKeJ/vPEXcWdxbWwkhcftgsyBgVOuc4P?=
 =?us-ascii?Q?KComfttOzghD98G2SvkqrdEhPLlYDVl7wOQ28xI7+WsyTp5vkx12sZilcazw?=
 =?us-ascii?Q?28pw16QHYgVLbEdcPqC0p92t4jG6NBjUlQPopH4RZACYWbA163or/qYNf5Vs?=
 =?us-ascii?Q?Gs9sz0FG9X9+Cd+2i/njlu18W1Gb/6aP2FLX3v0eDMoxQw6bdQcBx9yUBQ1l?=
 =?us-ascii?Q?BSqNJqzjBC1Kvne31ak3+JwGqp95sNzYw5+y/g/tMERxgvn8WdV8WW3i91ge?=
 =?us-ascii?Q?QGAiay0Dob7ip1hyX3yNcIdADI5b72uPnyuZ9/Ub0HwUCO3BTznCeDzJxdD8?=
 =?us-ascii?Q?pyp0CGUfjjxst5Jhe3lsMZm6hsV7JrFBAVfM+Ayzjvkb3R6oDXCkMy/28cFz?=
 =?us-ascii?Q?hAlU0do+ZW1zmUr1cFFt1p0z2M2J9fh3jVC/hJkd5yZHC+l/9LEq4qiQ2Ur6?=
 =?us-ascii?Q?2qJFF0jh398ssgwKe9aE2KJwcOlNqF5kATde/AtGm7s+22z4KT7YhVikUN5+?=
 =?us-ascii?Q?ByjSaftoVgUGo1BpqgqvheiUH/lNcCkFljM4IG0r/NaNTy+MfkhJfsh5jlKQ?=
 =?us-ascii?Q?qC0tAzihW7UDOjwjeDnbmFpUEH79bIhlfATVBOZ9C68NE0W3ikMmc4hRpidm?=
 =?us-ascii?Q?XpFtKTyWlPITInpKMo+C8EhbpqiDyLNfWlNQqri2tC0Xp15zscB8KyVMX0Vm?=
 =?us-ascii?Q?s0w8vJ/Eaw4CCm2NItiQ3Gnhs1JHumNtW2+pCek/PWuXAqyu/uGNb/X3ce+3?=
 =?us-ascii?Q?vwkyduxrCISaaMl9QbkrNbvP0lSn4bvN3Qo4tikDP/RxMt6yRWGzVFF+lGlZ?=
 =?us-ascii?Q?R3Wb37lks7wFiaDpXTaV1S3HdLBURiDfincCbEYwlS5+2M3M4vlkjfKNRlT1?=
 =?us-ascii?Q?/LzP3m9BJcU0Geyu0j1OrTqW8QfCxyEfuEto2uYxgaBws2nHknBxCw4g9h1Z?=
 =?us-ascii?Q?UpKb+SUxZvMT9uvg5pW5GiIi8h8YzjYAR94CZRYucPanxF9KhCCSWX5Z0eOh?=
 =?us-ascii?Q?A9HvFsmMnw4GlZNSuJgNpNG+cEo2c1lOto1zqNZuNdW/pL2TrIiOPHRPAkEC?=
 =?us-ascii?Q?iADkws9RSQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 004994a5-c3e2-4dfb-a5f2-08de68c6a6d1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 17:05:54.8244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D+0Ee8mdMYyhy/wiCwBl6g6SmoD5tXl3qef6gZDwV7xL0li36U5FKPZubv8+ZqLAyveUiu6PjKvEeyWD2TrRTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8362
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31562-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[pengutronix.de,gmail.com,nxp.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,foss.st.com,bgdev.pl,lunn.ch];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bgdev.pl:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lunn.ch:email,nxp.com:mid,nxp.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: 2FF4D11D9BA
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
 drivers/gpio/Kconfig      |  16 ++
 drivers/gpio/Makefile     |   1 +
 drivers/gpio/gpio-rpmsg.c | 583 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 600 insertions(+)
 create mode 100644 drivers/gpio/gpio-rpmsg.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index bd185482a7fd..00ea0c1d8035 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1883,6 +1883,22 @@ config GPIO_SODAVILLE
 
 endmenu
 
+menu "RPMSG GPIO drivers"
+	depends on RPMSG
+
+config GPIO_RPMSG
+	tristate "Generic RPMSG GPIO support"
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
index 2421a8fd3733..b1373ec274c8 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -156,6 +156,7 @@ obj-$(CONFIG_GPIO_RDC321X)		+= gpio-rdc321x.o
 obj-$(CONFIG_GPIO_REALTEK_OTTO)		+= gpio-realtek-otto.o
 obj-$(CONFIG_GPIO_REG)			+= gpio-reg.o
 obj-$(CONFIG_GPIO_ROCKCHIP)	+= gpio-rockchip.o
+obj-$(CONFIG_GPIO_RPMSG)		+= gpio-rpmsg.o
 obj-$(CONFIG_GPIO_RTD)			+= gpio-rtd.o
 obj-$(CONFIG_ARCH_SA1100)		+= gpio-sa1100.o
 obj-$(CONFIG_GPIO_SAMA5D2_PIOBU)	+= gpio-sama5d2-piobu.o
diff --git a/drivers/gpio/gpio-rpmsg.c b/drivers/gpio/gpio-rpmsg.c
new file mode 100644
index 000000000000..8c235d9dc336
--- /dev/null
+++ b/drivers/gpio/gpio-rpmsg.c
@@ -0,0 +1,583 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2026 NXP
+ *
+ * The driver exports a standard gpiochip interface to control
+ * the GPIO controllers via RPMSG on a remote processor.
+ */
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
+
+#define RPMSG_GPIO_ID		5
+#define RPMSG_VENDOR		1
+#define RPMSG_VERSION		0
+
+#define GPIOS_PER_PORT		32
+#define RPMSG_TIMEOUT		1000
+
+/* GPIO RPMSG header type */
+#define GPIO_RPMSG_SETUP	0
+#define GPIO_RPMSG_REPLY	1
+#define GPIO_RPMSG_NOTIFY	2
+
+/* GPIO Interrupt trigger type */
+#define GPIO_RPMSG_TRI_IGNORE		0
+#define GPIO_RPMSG_TRI_RISING		1
+#define GPIO_RPMSG_TRI_FALLING		2
+#define GPIO_RPMSG_TRI_BOTH_EDGE	3
+#define GPIO_RPMSG_TRI_LOW_LEVEL	4
+#define GPIO_RPMSG_TRI_HIGH_LEVEL	5
+
+/* GPIO RPMSG commands */
+#define GPIO_RPMSG_INPUT_INIT		0
+#define GPIO_RPMSG_OUTPUT_INIT		1
+#define GPIO_RPMSG_INPUT_GET		2
+#define GPIO_RPMSG_DIRECTION_GET	3
+
+#define MAX_PORT_PER_CHANNEL    10
+
+/*
+ * @rproc_name: the name of the remote proc.
+ * @channel_devices: an array of the devices related to the rpdev.
+ */
+struct rpdev_drvdata {
+	const char *rproc_name;
+	void *channel_devices[MAX_PORT_PER_CHANNEL];
+};
+
+struct gpio_rpmsg_head {
+	u8 id;		/* Message ID Code */
+	u8 vendor;	/* Vendor ID number */
+	u8 version;	/* Vendor-specific version number */
+	u8 type;	/* Message type */
+	u8 cmd;		/* Command code */
+	u8 reserved[5];
+} __packed;
+
+struct gpio_rpmsg_packet {
+	struct gpio_rpmsg_head header;
+	u8 pin_idx;
+	u8 port_idx;
+	union {
+		u8 event;
+		u8 retcode;
+		u8 value;
+	} out;
+	union {
+		u8 wakeup;
+		u8 value;
+	} in;
+} __packed __aligned(8);
+
+struct gpio_rpmsg_pin {
+	u8 irq_shutdown;
+	u8 irq_unmask;
+	u8 irq_mask;
+	u32 irq_wake_enable;
+	u32 irq_type;
+	struct gpio_rpmsg_packet msg;
+};
+
+struct gpio_rpmsg_info {
+	struct rpmsg_device *rpdev;
+	struct gpio_rpmsg_packet *reply_msg;
+	struct completion cmd_complete;
+	struct mutex lock;
+	void **port_store;
+};
+
+struct rpmsg_gpio_port {
+	struct gpio_chip gc;
+	struct gpio_rpmsg_pin gpio_pins[GPIOS_PER_PORT];
+	struct gpio_rpmsg_info info;
+	int idx;
+};
+
+static int gpio_send_message(struct rpmsg_gpio_port *port,
+			     struct gpio_rpmsg_packet *msg,
+			     bool sync)
+{
+	struct gpio_rpmsg_info *info = &port->info;
+	int err;
+
+	reinit_completion(&info->cmd_complete);
+	err = rpmsg_send(info->rpdev->ept, msg, sizeof(struct gpio_rpmsg_packet));
+	if (err) {
+		dev_err(&info->rpdev->dev, "rpmsg_send failed: %d\n", err);
+		return err;
+	}
+
+	if (sync) {
+		err = wait_for_completion_timeout(&info->cmd_complete,
+						  msecs_to_jiffies(RPMSG_TIMEOUT));
+		if (!err) {
+			dev_err(&info->rpdev->dev, "rpmsg_send timeout!\n");
+			return -ETIMEDOUT;
+		}
+
+		if (info->reply_msg->out.retcode != 0) {
+			dev_err(&info->rpdev->dev, "remote core replies an error: %d!\n",
+				info->reply_msg->out.retcode);
+			return -EINVAL;
+		}
+
+		/* copy the reply message */
+		memcpy(&port->gpio_pins[info->reply_msg->pin_idx].msg,
+		       info->reply_msg, sizeof(*info->reply_msg));
+	}
+
+	return 0;
+}
+
+static struct gpio_rpmsg_packet *gpio_setup_msg_header(struct rpmsg_gpio_port *port,
+						       unsigned int offset,
+						       u8 cmd)
+{
+	struct gpio_rpmsg_packet *msg = &port->gpio_pins[offset].msg;
+
+	memset(msg, 0, sizeof(struct gpio_rpmsg_packet));
+	msg->header.id = RPMSG_GPIO_ID;
+	msg->header.vendor = RPMSG_VENDOR;
+	msg->header.version = RPMSG_VERSION;
+	msg->header.type = GPIO_RPMSG_SETUP;
+	msg->header.cmd = cmd;
+	msg->pin_idx = offset;
+	msg->port_idx = port->idx;
+
+	return msg;
+}
+
+static int rpmsg_gpio_get(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	struct gpio_rpmsg_packet *msg;
+	int ret;
+
+	guard(mutex)(&port->info.lock);
+
+	msg = gpio_setup_msg_header(port, gpio, GPIO_RPMSG_INPUT_GET);
+
+	ret = gpio_send_message(port, msg, true);
+	if (!ret)
+		ret = !!port->gpio_pins[gpio].msg.in.value;
+
+	return ret;
+}
+
+static int rpmsg_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	struct gpio_rpmsg_packet *msg;
+	int ret;
+
+	guard(mutex)(&port->info.lock);
+
+	msg = gpio_setup_msg_header(port, gpio, GPIO_RPMSG_DIRECTION_GET);
+
+	ret = gpio_send_message(port, msg, true);
+	if (!ret)
+		ret = !!port->gpio_pins[gpio].msg.in.value;
+
+	return ret;
+}
+
+static int rpmsg_gpio_direction_input(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	struct gpio_rpmsg_packet *msg;
+
+	guard(mutex)(&port->info.lock);
+
+	msg = gpio_setup_msg_header(port, gpio, GPIO_RPMSG_INPUT_INIT);
+
+	return gpio_send_message(port, msg, true);
+}
+
+static int rpmsg_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
+{
+	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	struct gpio_rpmsg_packet *msg;
+
+	guard(mutex)(&port->info.lock);
+
+	msg = gpio_setup_msg_header(port, gpio, GPIO_RPMSG_OUTPUT_INIT);
+	msg->out.value = val;
+
+	return gpio_send_message(port, msg, true);
+}
+
+static int rpmsg_gpio_direction_output(struct gpio_chip *gc,
+				       unsigned int gpio,
+				       int val)
+{
+	return rpmsg_gpio_set(gc, gpio, val);
+}
+
+static int gpio_rpmsg_irq_set_type(struct irq_data *d, u32 type)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 gpio_idx = d->hwirq;
+	int edge = 0;
+	int ret = 0;
+
+	switch (type) {
+	case IRQ_TYPE_EDGE_RISING:
+		edge = GPIO_RPMSG_TRI_RISING;
+		irq_set_handler_locked(d, handle_simple_irq);
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		edge = GPIO_RPMSG_TRI_FALLING;
+		irq_set_handler_locked(d, handle_simple_irq);
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		edge = GPIO_RPMSG_TRI_BOTH_EDGE;
+		irq_set_handler_locked(d, handle_simple_irq);
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		edge = GPIO_RPMSG_TRI_LOW_LEVEL;
+		irq_set_handler_locked(d, handle_level_irq);
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		edge = GPIO_RPMSG_TRI_HIGH_LEVEL;
+		irq_set_handler_locked(d, handle_level_irq);
+		break;
+	default:
+		ret = -EINVAL;
+		irq_set_handler_locked(d, handle_bad_irq);
+		break;
+	}
+
+	port->gpio_pins[gpio_idx].irq_type = edge;
+
+	return ret;
+}
+
+static int gpio_rpmsg_irq_set_wake(struct irq_data *d, u32 enable)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 gpio_idx = d->hwirq;
+
+	port->gpio_pins[gpio_idx].irq_wake_enable = enable;
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
+	u32 gpio_idx = d->hwirq;
+
+	port->gpio_pins[gpio_idx].irq_unmask = 1;
+}
+
+static void gpio_rpmsg_mask_irq(struct irq_data *d)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 gpio_idx = d->hwirq;
+
+	/*
+	 * When an interrupt occurs, the remote system masks the interrupt
+	 * and then sends a notification to Linux. After Linux processes
+	 * that notification, it sends an RPMsg command back to the remote
+	 * system to unmask the interrupt again.
+	 */
+	port->gpio_pins[gpio_idx].irq_mask = 1;
+}
+
+static void gpio_rpmsg_irq_shutdown(struct irq_data *d)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 gpio_idx = d->hwirq;
+
+	port->gpio_pins[gpio_idx].irq_shutdown = 1;
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
+	struct gpio_rpmsg_packet *msg = NULL;
+	u32 gpio_idx = d->hwirq;
+
+	/*
+	 * For mask irq, do nothing here.
+	 * The remote system will mask interrupt after an interrupt occurs,
+	 * and then send a notify to Linux system.
+	 * After Linux system dealt with the notify, it will send an rpmsg to
+	 * the remote system to unmask this interrupt again.
+	 */
+	if (port->gpio_pins[gpio_idx].irq_mask && !port->gpio_pins[gpio_idx].irq_unmask) {
+		port->gpio_pins[gpio_idx].irq_mask = 0;
+		mutex_unlock(&port->info.lock);
+		return;
+	}
+
+	msg = gpio_setup_msg_header(port, gpio_idx, GPIO_RPMSG_INPUT_INIT);
+
+	if (port->gpio_pins[gpio_idx].irq_shutdown) {
+		msg->out.event = GPIO_RPMSG_TRI_IGNORE;
+		msg->in.wakeup = 0;
+		port->gpio_pins[gpio_idx].irq_shutdown = 0;
+	} else {
+		/* if not set irq type, then use low level as trigger type */
+		msg->out.event = port->gpio_pins[gpio_idx].irq_type;
+		if (!msg->out.event)
+			msg->out.event = GPIO_RPMSG_TRI_LOW_LEVEL;
+		if (port->gpio_pins[gpio_idx].irq_unmask) {
+			msg->in.wakeup = 0;
+			port->gpio_pins[gpio_idx].irq_unmask = 0;
+		} else /* irq set wake */
+			msg->in.wakeup = port->gpio_pins[gpio_idx].irq_wake_enable;
+	}
+
+	gpio_send_message(port, msg, false);
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
+	init_completion(&port->info.cmd_complete);
+	port->info.reply_msg = devm_kzalloc(&rpdev->dev,
+					    sizeof(struct gpio_rpmsg_packet),
+					    GFP_KERNEL);
+	port->info.port_store = drvdata->channel_devices;
+	port->info.port_store[port->idx] = port;
+	port->info.rpdev = rpdev;
+
+	gc = &port->gc;
+	gc->owner = THIS_MODULE;
+	gc->parent = &rpdev->dev;
+	gc->fwnode = of_fwnode_handle(np);
+	gc->ngpio = GPIOS_PER_PORT;
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
+	if (np) {
+		/* Balance the of_node_put() performed by of_find_node_by_name(). */
+		of_node_get(np);
+		np_chan = of_find_node_by_name(np, chan_name);
+		of_node_put(np);
+	}
+
+	return np_chan;
+}
+
+static int
+rpmsg_gpio_channel_callback(struct rpmsg_device *rpdev, void *data,
+			    int len, void *priv, u32 src)
+{
+	struct gpio_rpmsg_packet *msg = data;
+	struct rpmsg_gpio_port *port = NULL;
+	struct rpdev_drvdata *drvdata;
+
+	drvdata = dev_get_drvdata(&rpdev->dev);
+	if (drvdata && msg && (msg->port_idx < MAX_PORT_PER_CHANNEL))
+		port = drvdata->channel_devices[msg->port_idx];
+
+	if (!port)
+		return -ENODEV;
+
+	if (msg->header.type == GPIO_RPMSG_REPLY) {
+		*port->info.reply_msg = *msg;
+		complete(&port->info.cmd_complete);
+	} else if (msg->header.type == GPIO_RPMSG_NOTIFY) {
+		generic_handle_domain_irq_safe(port->gc.irq.domain, msg->pin_idx);
+	} else
+		dev_err(&rpdev->dev, "wrong command type!\n");
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
+			dev_err(dev, "Failed to register: %pOF\n", child);
+	}
+
+	return 0;
+}
+
+static void rpmsg_gpio_channel_remove(struct rpmsg_device *rpdev)
+{
+	dev_info(&rpdev->dev, "rpmsg gpio channel driver is removed\n");
+}
+
+static const struct of_device_id rpmsg_gpio_dt_ids[] = {
+	{ .compatible = "rpmsg-gpio" },
+	{ /* sentinel */ }
+};
+
+static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] = {
+	{ .name	= "rpmsg-io-channel" },
+	{ },
+};
+MODULE_DEVICE_TABLE(rpmsg, rpmsg_gpio_channel_id_table);
+
+static struct rpmsg_driver rpmsg_gpio_channel_client = {
+	.drv.name	= KBUILD_MODNAME,
+	.drv.of_match_table = rpmsg_gpio_dt_ids,
+	.id_table	= rpmsg_gpio_channel_id_table,
+	.probe		= rpmsg_gpio_channel_probe,
+	.callback	= rpmsg_gpio_channel_callback,
+	.remove		= rpmsg_gpio_channel_remove,
+};
+module_rpmsg_driver(rpmsg_gpio_channel_client);
+
+MODULE_AUTHOR("Shenwei Wang <shenwei.wang@nxp.com>");
+MODULE_DESCRIPTION("generic rpmsg gpio driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0


