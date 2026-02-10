Return-Path: <linux-gpio+bounces-31565-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AE7NzJni2kiUQAAu9opvQ
	(envelope-from <linux-gpio+bounces-31565-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 18:13:22 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7092911DB17
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 18:13:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33EA23084346
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 17:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB8763803FD;
	Tue, 10 Feb 2026 17:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="O6W3dl/j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012028.outbound.protection.outlook.com [52.101.66.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC41366809;
	Tue, 10 Feb 2026 17:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770743324; cv=fail; b=I6dc3ZUk/w+Q+jhuaroQcgAi699oZAo9lnGjbZ++8EmTd57OKwlgUYESzsR+p10dTkDn/7cTXLGzwNPZ6QqlUuIGI5EG3UPhne2czHnWKMmyLnV7O+XR3Gk3derEDLvP4txiQZy/c6A8vWNReUB2yc4tUIUIWBwojIP0g3Qyqos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770743324; c=relaxed/simple;
	bh=YaFy8U//g63jiK/g9ceATt2bvMSh8dsLNmutQmadfFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SbAyd3uEkcsizFE0CrAbnflesxcCbVMTh4KRygtL/14VcPSMXb9zx3R24Vwvd4qsvOOkB/6PiEos7+P8iqdkyFG4HRgYqw1wdBCYLT0Kez5BYMEJ6RFHLdDsoPKNNavOz5dQVrD1S3/tThgNm8o84l1oXtObH3ZPry4TfqcNflA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=O6W3dl/j; arc=fail smtp.client-ip=52.101.66.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KxViTU5TeM178gKavD4Q0oZ2lYd0/vczWqovSZkcJQqY8oPn39uvxp6wKDZizlZJH4LOGZniefuN6ukbrnfDmY+4lnEiz/vipnJHkZGh5Nwu/dnshpaLDknoPvNFlA6lKPAJH4yB1PXB23MHeNRM2qKEICt3KVT26qQuoNjD06LSsuwoB5AYefd+PAuPpYJd2iDraK34ydswZ5idlwz/Qhz2Py+AWSHCwRYbWCvzfucZPm5hfbnnUsMvu/8nz4mOP7jeQ7EPGxB6l5I3PaueXuXWXrywRSsTpsXIIHUS/bmM/q/MTa/tp2pGBw1NztCPcyx6chw0RzaqbAQ2OhgYVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bX2DQRbalsF8Wb/C8iJmTAngSv9xluSkqN2qTxXuKAw=;
 b=NrMJcIwbyIdWTTscxB1jvcSRAJU+6qnnCZ+d+kxXvVL906LsJOijMEj3SApo7PG6UvyPOnVqWO/sspcklgR0SMsMK+JSrQUwXQzIbyQVqgXrujJRmdIpZQjT+SW2VMTqZwZcqOmr/aimIhOg/RWcXlS6yCGmZyeVM6HoibQ44X1nwoQ6A4pDpjDQpd28qCWUyxLLsUyZO+rGFlI3bl2GdHDd0huvME0N4pyQkd0yUNWRA0Mju/skQRhtM+eVsB6qK6/A2XR23W8M8p/cgVQQ3NG3ZjGgyt6jxwBz/W6w2s8iN1V70dMxMVpyDgMiUNWliW+6oUYJFS2u/nVbwMzT2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bX2DQRbalsF8Wb/C8iJmTAngSv9xluSkqN2qTxXuKAw=;
 b=O6W3dl/jg2UbKVvnDQygvlxfanOFJDwI5uUvMYZLyY9bqLwRt+L6HXNw9GZ8Ljrnd6XrA1UJZzC9T+erlLoDbT6+4UYce4gGD0tJoLZcdkloQLK2wwMq2BNiF90nK5fH5UI9qIY+CtFtgTtqmabdJatbvQIdGb0WloKr00mhMro6AxYPPHkZHW5Lu/xM5MM8+yhREhWnXOeZ/gK1L+0T8d8LfD6oBzC8SIXoUkGXUtIC0QGrKQ+rzcxpvRIgome2GqrOpDi91LBh3Z00JbbPlL0xaBPHmQds9cVJyEY0E5xEy7oBbuPaKYOZD1hzmxdY3rgDca90PMbqMkpZ5YAZgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by FRWPR04MB11284.eurprd04.prod.outlook.com (2603:10a6:d10:19e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.8; Tue, 10 Feb
 2026 17:08:40 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9611.006; Tue, 10 Feb 2026
 17:08:40 +0000
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
	arnaud.pouliquen@foss.st.com
Subject: [PATCH v7 1/4] dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
Date: Tue, 10 Feb 2026 11:08:11 -0600
Message-ID: <20260210170814.406883-2-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210170814.406883-1-shenwei.wang@nxp.com>
References: <20260210170814.406883-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0121.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::6) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|FRWPR04MB11284:EE_
X-MS-Office365-Filtering-Correlation-Id: b0dcdc2a-52d0-4f8c-f332-08de68c7096b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|19092799006|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vViof2Yqj+IYehvpgtN7ACg4vIMT3wta99e5yrrNVLALuyDk5laIvpo9sXLE?=
 =?us-ascii?Q?oPydSPaqNKZKs6JYPN9ujPzjQcdZ10lq5ib1bXq7+rTUWwsw/UydpnPAUEv9?=
 =?us-ascii?Q?3yTtpzcNG+vGK7miWYzs6NNmdo3sGZ3epnip/rM6KdNPMy52w2keA1qc3HUz?=
 =?us-ascii?Q?VuY1AOpPebGt2FpSWR3V7AllfXa5/nK1EuHxrnDpo0bw61FKfCxVZMYteRBR?=
 =?us-ascii?Q?ENTfm0eChhrIhkiCGLlBAGsTDYWx7BpgtQ4MVTquh3J/g8LAWc7QmQDHljlb?=
 =?us-ascii?Q?xu2ZQEtxhf6fwvifLVXCj4/C7HZl2kuJ9eiTlEtaoV6AYvvB3Y28FW6DLT4q?=
 =?us-ascii?Q?rwQAOPUHvtWNfOqfwg3demsSX5jgD9pWOtsEbEUTnMzcr6azDuZDiNB91hp/?=
 =?us-ascii?Q?FPK1yMZmJNuRCA+NLHY3VNPA7jZiI95DNNXrLI/s3OLimmZCpmkkx+6jAaJN?=
 =?us-ascii?Q?XVuLdOUD2eKea7g1wQW+20V9Jd9Sun/oZIFw8d9WGQGIvsFb2tVNQwfrsX9N?=
 =?us-ascii?Q?Me/nk48CHhxOGFTcrL9GEtXTibtzhKQe0yrf3L8R0hsRTNqe0RBPLIbh63YK?=
 =?us-ascii?Q?iOc/oY38NrM5VxkFXeiqfgLetsrpcH39ZrmrSCKMQ7dFOK8R3txooG8VJfvw?=
 =?us-ascii?Q?BV4W+mzHO/2tD4dEZhhuHn1KSJWu/Mm3nE5sDIVncLOdoPLEceglW4bAEOZv?=
 =?us-ascii?Q?lx42l/wvAKjvZygrELM3KJEPq0Cfrx6WlhgllQxf2/3OsgB8PSp8Au0W/hi1?=
 =?us-ascii?Q?oR+d3raZ+GZqXDaau1r54kWrcr3IFzB4Xmb/hrFYTg+9wJTDoPOq55Q1XVZ1?=
 =?us-ascii?Q?AsxAaheSHzdAGlSpOnY5hM27twnmdRIOaa92yBK6LH1CQ+nQ2mkfNLW74Lgv?=
 =?us-ascii?Q?uO4DP788SfYfdMEVbg5iF2K66tnZpj5fL584kqkK8rPI+WnP3BlWdR9yJlXM?=
 =?us-ascii?Q?Z9wU/YTDGfONRxMy9CvHj27j1XfmBTvGJq+Hz6k5nbH2klgI3I+yMYu2HpuY?=
 =?us-ascii?Q?/gzaxMYVH0mbJ7zet2/z/C1evFTZznMCNsKbiBRxqt6/e3KlxtPH3FxUJiGg?=
 =?us-ascii?Q?WHzGFGBuvdeKMjjmcf2u6SbDA1zl+fWqF+l0FGJn9mwCRZQELxu0AV0pWQjB?=
 =?us-ascii?Q?x+GG9hG4wM55GAZV7A7wdXPj84JL54g11uryVECb2kAA5j972JfJuwqS0AfI?=
 =?us-ascii?Q?57PPyi1GyqhvqjcVWuuIeM/aAfnKxii6CC58bJv8HuxN14opjkBXWRf+aSv2?=
 =?us-ascii?Q?trYdMVq9ffAuUJGGxJAizUfNpxXeWFL1JTnFW95BgsHOs3YLUd6gjY2Oyx6l?=
 =?us-ascii?Q?EdiNCVEQmoqDmFCKJE7DrFInFnqKggrd77cAvAEisdeFOtl7hAgOqNGxSY72?=
 =?us-ascii?Q?BradVSs0XDoVJBU0Ms8W3K0TQoDwjdCh59RouQJbU3riSJaX9V19xRfa0PIW?=
 =?us-ascii?Q?yZDHRSVZQwtb/uMD63VasA4MUoCwTohUY3TDyeNYpQ+xsYj/QopMtPGzGmzL?=
 =?us-ascii?Q?Z3DwHvj7K1zsz+Dda3ARIRuo9NsQbDZXPnOJAosqt0ksnW6d0dI0QKNquD3o?=
 =?us-ascii?Q?2vHb+lbjMbwpUaLpv50xUGTBIYQrZ5C2LAgkzZj94fdU6VQrfc5VRg40QFc3?=
 =?us-ascii?Q?IDb1B6V6O6QuWzrLU7bRmDgEODqnfidQCis3twxKxjXw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(19092799006)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dRGxDtAZYV70ne+MT3cWsnF0hjC0IcVQlx0scUGE7Lt4rp8+W+bbv7xPVkIE?=
 =?us-ascii?Q?CvmiC+1WQaNoOJTcrNsUuomSOkS8Amqt7TMQ3KnKI/sx6KzNGt5tMuM29XY3?=
 =?us-ascii?Q?f6OvUSYTCmysYFs+Wn6+UBM+idRnFI5iOvJ8Rzx0zsSb2cvQ0ctZByOK9SyL?=
 =?us-ascii?Q?xKawUYjOKQYMkQpu82hYXhZuwrTjfe01kcIoEWx9WPSJwaygaAtBQB30EDLS?=
 =?us-ascii?Q?6c5NXpeaLc97Hik7hXa1Od68CHvF/opUiHP4uKOznxl4BVos84bHi0N9uz+l?=
 =?us-ascii?Q?n2/y2/jhKiVZYNTn2XykV+aMKX+HQWGLUlw6el7ehBVJvzirNRjGw8/m01WT?=
 =?us-ascii?Q?fz18P4wmP8zSSscAtdomY1z8SyMVSUjoZKuGmTri4BqwQMj3P4zZbMrur0zK?=
 =?us-ascii?Q?BHflSOnS5nViSMl2LLCirH08gJbjzql4omui/ptoVJOOElu1eWz4UPovDRkw?=
 =?us-ascii?Q?mFPXhXwg00f/ASzrpJgFxqPy13lRcytBFm9t3qsNf2sSk4viVfnVynuY+A7F?=
 =?us-ascii?Q?5BOY4+QejKSWlhucbCK7oL9N1eZ/TXMdxEEJOi5vN4ETgBI6JUmpyn4rsCIA?=
 =?us-ascii?Q?tBxK67H6pBpr97iz/PtrjPaSANeSk73smdIa63jdKTNfaPtyNyLRhsjvfVH0?=
 =?us-ascii?Q?e2Gi/oCL7Gg5tpg5iV3zUAfEQsN06HZ75Ch1uEsOIq9+rAyfGC4K+af1Djf2?=
 =?us-ascii?Q?RPWrCb6kM6KD6PUbhsl4EJx7eitjU6p/zteCKzUYCC3736OY3nR2mPMqZ35z?=
 =?us-ascii?Q?9sGGkr+bAcaaTTwsjhwyE8icUgKkjcmg14Xvn/sjgaZE2PrOK4OumJX/KcvL?=
 =?us-ascii?Q?Ub6epydEvOu99OTn7HF2CONysZrLkAz92Lzvt+n/8Fm9gMX1B9E8vQ1Udqth?=
 =?us-ascii?Q?0DSzRMI29TISOJoXstZV827lF3P1H4F7HW+WR8S5I8EOer5uL8FezYmWvd29?=
 =?us-ascii?Q?lqUKQhoDdieNHO4KbwVpWs+CD2Zf4rFK5JjNrD7F9WT3TgMKFIeC9uNoI265?=
 =?us-ascii?Q?S7sAr1EWGCBtLwbhHHBxrYZ9k7VsUG+/i1F2B5TeoB+PWxwnn+9Mr06ryT3F?=
 =?us-ascii?Q?lvBQ1BtQf58EpMO7jBjr/T1smtcKJ6/BtujkR0np2/uAwjR57rSpNKz7S1Uh?=
 =?us-ascii?Q?9Oo4Ab4LiekA9KS4ndzPV3WO/s2arSPI0fJbsrljOE8+aGAYIB/HSM0OdmDi?=
 =?us-ascii?Q?r4am4cY+38uvY2aAmSkneGaFPfa6+HfoJYNwmLdaKKArFcN0wfRgVBxqVq5j?=
 =?us-ascii?Q?YXAswsDZqUrYkbiyJs0Q2Xe/Al5X+lkZjPwErInifU8LPKb3zqaE7RxAV98s?=
 =?us-ascii?Q?1SxtDCYolLuQjrGLrIpN9qhwRYpY+50GgPYy09s0dVCjQm2lAAOIwPsmhcZv?=
 =?us-ascii?Q?4+GCPGCDOytiC5EsswDIaRWLECT6DEsVq8q+8cerSeDJzilcdTY81PENG80F?=
 =?us-ascii?Q?ChoijNQhTJZ68LV22OsclIoHSTuIe9b7yUvo0R/WElBKlXQbyGznXZqxqsw9?=
 =?us-ascii?Q?uqkHJNwfeUB3KLkcIndc39Y/FYlC5+GpOXf8WnhtakE1QkXkRZ40mklRSkRp?=
 =?us-ascii?Q?mwZ8lvhxdG/F9TKG7H1Keg3nhYseYeLb8kk2Xy6jJGad+qXg2NlPx9Wr2wCM?=
 =?us-ascii?Q?Uj/nhNHaB4DBJt++qa+93vEe3sz1chmM7Yi/TdVnjuUKeBPzIW7BLVPy/FYL?=
 =?us-ascii?Q?Ajgo8rykQ4aPht+GdSUjgg28guXnWcnwAJTdo/EUy7iel9PZ4Jocs2XZqh/6?=
 =?us-ascii?Q?um6sLmNeYQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0dcdc2a-52d0-4f8c-f332-08de68c7096b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 17:08:40.0595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l6iZuCpHaWunu+xK5JxtPpfr0QHsb2GzglsObGzofunmEFtaMVLK4Zx8T+eoyT3ovjL54t5T0dQygTPBAoYcdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11284
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
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31565-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[pengutronix.de,gmail.com,nxp.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,foss.st.com];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,0.0.0.1:email,0.0.0.0:email]
X-Rspamd-Queue-Id: 7092911DB17
X-Rspamd-Action: no action

Remote processors may announce multiple GPIO controllers over an RPMSG
channel. These GPIO controllers may require corresponding device tree
nodes, especially when acting as providers, to supply phandles for their
consumers.

Define an RPMSG node to work as a container for a group of RPMSG channels
under the imx_rproc node. Each subnode within "rpmsg" represents an
individual RPMSG channel. The name of each subnode corresponds to the
channel name as defined by the remote processor.

All remote devices associated with a given channel are defined as child
nodes under the corresponding channel node.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 .../devicetree/bindings/gpio/gpio-rpmsg.yaml  | 55 +++++++++++++++++++
 .../bindings/remoteproc/fsl,imx-rproc.yaml    | 53 ++++++++++++++++++
 2 files changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml b/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
new file mode 100644
index 000000000000..6c78b6850321
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-rpmsg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic RPMSG GPIO Controller
+
+maintainers:
+  - Shenwei Wang <shenwei.wang@nxp.com>
+
+description:
+  On an AMP platform, some GPIO controllers are exposed by the remote processor
+  through the RPMSG bus. The RPMSG GPIO transport protocol defines the packet
+  structure and communication flow between Linux and the remote firmware. Those
+  controllers are managed via this transport protocol. For more details of the
+  protocol, check the document below.
+  Documentation/driver-api/gpio/gpio-rpmsg.rst
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - fsl,rpmsg-gpio
+          - const: rpmsg-gpio
+      - const: rpmsg-gpio
+
+  reg:
+    description:
+      The reg property represents the index of the GPIO controllers. Since
+      the driver manages controllers on a remote system, this index tells
+      the remote system which controller to operate.
+    maxItems: 1
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - "#gpio-cells"
+  - "#interrupt-cells"
+
+allOf:
+  - $ref: /schemas/gpio/gpio.yaml#
+
+unevaluatedProperties: false
diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index 57d75acb0b5e..2f9dca2b71f7 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -84,6 +84,34 @@ properties:
       This property is to specify the resource id of the remote processor in SoC
       which supports SCFW
 
+  rpmsg:
+    type: object
+    additionalProperties: false
+    description:
+      Represents the RPMSG bus between Linux and the remote system. Contains
+      a group of RPMSG channel devices running on the bus.
+
+    properties:
+      rpmsg-io-channel:
+        type: object
+        additionalProperties: false
+        properties:
+          '#address-cells':
+            const: 1
+
+          '#size-cells':
+            const: 0
+
+        patternProperties:
+          "gpio@[0-9a-f]+$":
+            type: object
+            $ref: /schemas/gpio/gpio-rpmsg.yaml#
+            unevaluatedProperties: false
+
+        required:
+          - '#address-cells'
+          - '#size-cells'
+
 required:
   - compatible
 
@@ -146,5 +174,30 @@ examples:
                 &mu 3 1>;
       memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
       syscon = <&src>;
+
+      rpmsg {
+        rpmsg-io-channel {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          gpio@0 {
+            compatible = "rpmsg-gpio";
+            reg = <0>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            #interrupt-cells = <2>;
+            interrupt-controller;
+          };
+
+          gpio@1 {
+            compatible = "rpmsg-gpio";
+            reg = <1>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            #interrupt-cells = <2>;
+            interrupt-controller;
+          };
+        };
+      };
     };
 ...
-- 
2.43.0


