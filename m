Return-Path: <linux-gpio+bounces-31559-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YABUN2xli2kMUQAAu9opvQ
	(envelope-from <linux-gpio+bounces-31559-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 18:05:48 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 722F111D886
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 18:05:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A4BAE3007506
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 17:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B75F432ABF1;
	Tue, 10 Feb 2026 17:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YnUkbugs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010001.outbound.protection.outlook.com [52.101.84.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA202328B6E;
	Tue, 10 Feb 2026 17:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770743144; cv=fail; b=cL+c29T6MC7vO1B9jHREfEcoqfpj6tyuwIxnQIiaV35NwzgvZu8IQ2r52ZQIz/+ieAwHYlIx92ZbzIGuA3JOErJbAUfUhsOTgokybc8eSO7zRXOCno6M1GZrfibHfGXfV+MndYkSMqR6nHtMwbi6rc5QnUVdGGsIce46IM0apRM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770743144; c=relaxed/simple;
	bh=YaFy8U//g63jiK/g9ceATt2bvMSh8dsLNmutQmadfFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iLYM6QyVxEsuz5dkRwkQamqRQh/sZ8SmcXEoaLp7sptzLkeMOlpnkLKFrKqBwpRB+y7rwM1zayAwLCRJEtkHuMpa+qmCLMqF3aOYHkLN5v/vD/7uWKBSYNiwNTYEaQq/2kcYgRBBgE+nPqDd1VeMSIOdxysy8Uc6PDVez0dCdzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YnUkbugs; arc=fail smtp.client-ip=52.101.84.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YMH5hgmfLS4N2AUSF3vEnZP7KkaRcRHDASsaPHetFjCVQo8jt0Os7X9Sft3KMxbgzqW9FdRKQ3/ZoCMTAT7/nCetRBaWGGGg/quw96LKw1lkYXRK1D974l7LD/Sz78fIjl5g3Ap6YjuDI1q6ZtYGXYjFEFr2UCimXVlbTMESfxzBSqvPLO9TrUcnhEf4oN8Rs60EHliW/Q0yctfX2Ztw1VGFFpHU1fuSBe2AyXtRRSqG5CYBcseGLfObTgN7sYCRWN3i8aCcJ/9CdBqUbCnUD/lhJ8XOiD5mTAkEZEbKaVRfJuVMezlM0Z+gJx8f13u1fZb+8wSmd7+/YhFOV/Nnlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bX2DQRbalsF8Wb/C8iJmTAngSv9xluSkqN2qTxXuKAw=;
 b=TtZx8vdNuzJ04e6GyEUeUQiPagO1lBIFycvX2xatoKYGBKsQ5gfUdMshya1fg9zUYzeCWzyPPwCiAkpzLKEzEdfbjioxaCYkKTRF8IHJ9Nd+28Abn1gS2xX3odkUznpohs69qiA6gvtgXlOqvf2SzBeHnrlVqAjsU6RlpJ2J4oWqFGslNwb2/HXo6wjp+3wbJ8RUCbHK8Mf36Ges63Qyags8vmuinfIkwst32AdlhXqgoDtjSy9kKAMacT455XBqT7DldECxgpTbHRpFAprYirJ9NnKw0Yd4JyEhKHnLdEh+T2R715AnnNAIjgNsFOxgTp5X/HA35fDgjGhDFt6f4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bX2DQRbalsF8Wb/C8iJmTAngSv9xluSkqN2qTxXuKAw=;
 b=YnUkbugsDj2CrfA0JN/fPPl0/tzkAvKvUYkNrhvWI4+k1X0H97P2rm326wnc1AmbvSaF3hZfVqD31Cpa5nvd5AanpnQHciegMfsff3uEcWWguxBf207hF6TgDQppr8H62q2N1KPvVoo7MY9xg9yoavQkutLEp7PiTQiLmpEBRO82drYUBqXb9QlFYIKxJJIihIOYEf+IOZOvssxshkZ+vABMKlro7Xchf8ncT77nGhWzLdZIKkr73CcdiNghygf9onJ1hGj0kuehgmX4BD9zqrVy1DJJKIDGHebi19hSKxLuyDlOABu9V8s2FmI7n81G7VNlH4lUTNY7GweGvq5blw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DB9PR04MB8362.eurprd04.prod.outlook.com (2603:10a6:10:241::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 17:05:40 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9611.006; Tue, 10 Feb 2026
 17:05:40 +0000
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
Date: Tue, 10 Feb 2026 11:04:35 -0600
Message-ID: <20260210170439.406513-2-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210170439.406513-1-shenwei.wang@nxp.com>
References: <20260210170439.406513-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P220CA0027.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::8) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|DB9PR04MB8362:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fc1514d-8696-45d6-1140-08de68c69e19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|52116014|7416014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VTP3ir24igQLwjWXxvMt4bX6lwjZzEXi6gnotQwHsAn2u4wY3C0zTk9HrfPq?=
 =?us-ascii?Q?dow4FoptG1R91lJZZuLe0exY12T15DE90HLxg+eri4mhgozgRVFcn5POdQxs?=
 =?us-ascii?Q?ad3zemMBgjxpG6KtdHhwEbZXKGXhxI4Wam9ZXaiQna2s/SUT1KEknLAqdRzx?=
 =?us-ascii?Q?n7DBFjXKFOjaujPL6NPU8p5LJIotlMJnWFQvK3FnY4RO8dXVWkzoAf9X7Gve?=
 =?us-ascii?Q?A3MzV1V1Lwhuu808z3bh4l3y/gOpxOhU8W5/cw+KMlS3k0UHa3mjb1Xv2VPM?=
 =?us-ascii?Q?YBVBFUF5xM/Cb5r1HYrLpb+3h7KGw5f0tG6oVmUHxWbPbgNGUOoYTMJErESm?=
 =?us-ascii?Q?/ZElQO2eRv9FiWaQJr2R29QBzEAAAptz5gujpirjA3mY2OvsfKeAatakibCD?=
 =?us-ascii?Q?79TZLEGFHyoXWfA2O5wpnPzjfkduQs/37Bsb3eqYDq5P/wNoFPs78IEfHsR1?=
 =?us-ascii?Q?7VAgdGEsgBbKyeQieTi88tP/gd/l9Mjvl8iq8wwa49rNdiggVdL0H8kyMytr?=
 =?us-ascii?Q?oYa0LpLcgG2bJiWUUsCYGRWEjoiEs4akvOmbI7zU330P3PsKCLHE7zlCtuEZ?=
 =?us-ascii?Q?mU5yfcD7qNEToOYJbIeHzF3EF+WXTTnug1fEwuKrnszuNHsaXgJjVinBZvIn?=
 =?us-ascii?Q?28xq/9BPD2tBgFvrb/TvMTJCPyiZgwkn8m/aG6EyoVefVihiIbWTalB2SdRF?=
 =?us-ascii?Q?uWCu122PaUWPcb460z4PdGurYiUFV4n1ncX6mN1zuWReanaNNZuUaLJcDZHr?=
 =?us-ascii?Q?g4ou6nyP1qys064jV35gaIJHW+D6ggAQyGm2s+qj/1622niKR7iOmxBNZPJj?=
 =?us-ascii?Q?oveblwEomsR7FR0zy8nBhpWg4c2LVcA+79FG1TAGnruxCfM1O5sAf/rSg4jN?=
 =?us-ascii?Q?QT2eq3uk8+PPXjb6eYKwzlEG9H9IvrCkrRousLnE2QV4wjq9HYrr8QxmzrYR?=
 =?us-ascii?Q?lXO2u2j5rbIkyPeBEEOM6QssxWfUryhaTEPI1qTmbyfqyyBQloxAuVzEbhYJ?=
 =?us-ascii?Q?08g7wUWziSsd+NkM8IpznsJvaKofNRZaOh3f2VULxvVVgyGQm/6Be1AtD+8H?=
 =?us-ascii?Q?k/rueaIguye3FZaSkskij4IWJFR5X1BvqnMu2J10M0H7m+6WL3VIXgLn2df5?=
 =?us-ascii?Q?IfYAImvbokVz1S7uewfhjzymG66nI4x6sdssn0fC5gM5Z62WmN9BWoUIMn0+?=
 =?us-ascii?Q?V+ii5f4i5emn63o2ker+hX6xJwcG22irKEm3CuPiXZnXlVby+AbphEf3MPdI?=
 =?us-ascii?Q?IbWdIK7Hp4ImzqYDet1cJOeAPS+RRCGaSiZrCi0Nx9wO1/CtSXMxwGrv6QtK?=
 =?us-ascii?Q?jh7P6LPNNEZqF74+5wCXz0ScYFCIcw9FIjfpXfqhAPn0gzr5tsYCssXBRxSA?=
 =?us-ascii?Q?cV4qTdR7bGj9FBuXr0ErUSf5zgOehx/PSqram3HVGGizDa1q14h3PkQ1AQso?=
 =?us-ascii?Q?3KZ/3sRWGBfMC6o4Qo8O2jMWfacudi2oACbAVMvu3/lHFy9xaoBl011kO4Fn?=
 =?us-ascii?Q?14DhMgPkcwjyO9nzvuH5t6n1U46+XIo+fW+9eoDRs/DKVrp19qa23K9zoHXy?=
 =?us-ascii?Q?5VoEawbaPy/i0LQfLTA0nDelr8WFTeqXd4Mj+SxtUTPNs8VsZXlaVZe8965i?=
 =?us-ascii?Q?EZSFX5RdSH4pMJuexX3VAVdq1EnwkFffQSV5bBs0L2mH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(7416014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RcO7VCYmwg0eWrLVPy7Ep9XWkDH3LzBPC1D/kjOFgGhe1fKjTm1gJ/8ybFyD?=
 =?us-ascii?Q?9214rXBob5R6tUoCx5GlCULY8kotK3H/wRg+rrxJGEOPuI9hhisQIuPkpTXg?=
 =?us-ascii?Q?GfBrQKErHjbzUWjh5El3JBVhe5c+1S62IcUImSQMLkpMebaVqLXKc3/mNxxv?=
 =?us-ascii?Q?bp1GinL2K8Y2cvv5HVN/1ASZs4XVBx17NtvOCbLPn0Nxhvqpj82G/a9CAH6p?=
 =?us-ascii?Q?XN00iwuUE/XaP9fH71tYhKr347XU/rKhpVIDAyhgWFKtbVUDoviVjQ/3eaaf?=
 =?us-ascii?Q?WBqIEVLgb8Jsw4ohF/Zu9Zql3wciJloa8OZGcQMqz+jTVVupiaYd+SlgaBix?=
 =?us-ascii?Q?XYYsC/Sz7luNRAP6wS5+hr61DanhVqOaYzviPzoCG5APO9T9LYRgqtFjOuAe?=
 =?us-ascii?Q?PgZZ0RKJvouimf6ZOU2aMbYS0Yj03RbPSEpnhFgcKZ0Ie636ePPf3njHuUuB?=
 =?us-ascii?Q?WSiejno/IQ5kARGFniYtpWLfrrvEdkoljzfJKZN6pH+DFKuDhkLzBYbL6PMN?=
 =?us-ascii?Q?TwYZDrwDJU285Wzcb8QNgw+lxsiwUIXWgMPTtkorE1Gb8fpwepoz6+iegsut?=
 =?us-ascii?Q?6C0gb3A1GVfE4lvabI7D886gkOiGV1up9MfigaQ5jvXGdfRoEY5EDWRvLjdA?=
 =?us-ascii?Q?wEVdpz9lBOHWB9eGznrVcGHIr5KXGFoax5K20jopPcIC9sfYLZHm4lQq+iRq?=
 =?us-ascii?Q?cxhU8BbrcR92MXzq25se+5DfKRiWsrzhjY2CXQfHN7/CSiVO8IQXUccypijw?=
 =?us-ascii?Q?sLcUwKJZfE5OeEIudXKlh8kCcszbovaDf07ATwFnSRfngYwXHl/fBkg1o3Yf?=
 =?us-ascii?Q?oPxxyfizYyp4eW+jF1BbBg6S3Tg9VFtPurOX7YSKLwilghU4kV3gC70dAoGy?=
 =?us-ascii?Q?nzQR+YMsYE5KcxNClQvj6eJr+wUt/yn4Xf5VYsgIwh1RStoWuOqTTrY3O78Q?=
 =?us-ascii?Q?B7C3iF3eVJ8ThygXy+DNkOWmsijQ56DPNIatZwyw6Js4wiRFzUG3Z2luwW8N?=
 =?us-ascii?Q?qSQVOHcBGNMNFjdaILnt+syUXBEG7mXjKfNS+WmhwYb3F7+KBqne/HsaP+7L?=
 =?us-ascii?Q?vSTEK9m8XPv2k/2kGk6pcce5bqHHpkL8MJoaKOUGM18Dy0vo2umcLHn3B8GD?=
 =?us-ascii?Q?1LtoMNKhf72ZzozrfzR/HEQ4cV+jPHjqLlg2b6ZwH26QiPAVWZRQlWXNBzts?=
 =?us-ascii?Q?vi7NBgm1SYhkxGdUWfgkefbLPwMGqAymKL7Jk1HeT0ayASGCU3atEPprzVuJ?=
 =?us-ascii?Q?l5T9H6ls8HOUGCl71vPnk2pOQbSlKlOlJJYoUzikwLl9uzn8ouqn87Z3ywG/?=
 =?us-ascii?Q?DIFTkr/nlxcnm295Xogqithf3G8IE58mjo42Nf26TeRcQeV4XpHEFHyRvUUp?=
 =?us-ascii?Q?p5v7HD88w/QIzbITBlANMdcHSLV0VpjF5zCef8hkDP4Pwzpwl//qzO6dd6g4?=
 =?us-ascii?Q?bv1hKQWnO9BwOuglJpFxzXN8O5Fxie8C+nYVI5ZhRws7qzqrHrVWElrxvJA1?=
 =?us-ascii?Q?hXovrU4P43447t0kFF1yikwH8gp1jg2ZJAuyeOs4mYqoAT8nTFJtlSAutACe?=
 =?us-ascii?Q?IlN7QnTu6j73heKclAwPeOoI7rkxhtJxeMmMMrvzwV7UrdVZjAujezRmCIL3?=
 =?us-ascii?Q?Ihu6D5aXDvocRg/ZUSfdOs4dGBftSjosA8PtBp+q+rLedKaSmBdhqRrt4mbg?=
 =?us-ascii?Q?8y3a2/XYi6NBYpeTvBbn0Z0YanFAoqOkfXr/NyViNh8lJXv4UIjMdCpHmCvs?=
 =?us-ascii?Q?Sd0vau+1gQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fc1514d-8696-45d6-1140-08de68c69e19
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 17:05:40.0040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O6tAE8DDj2zqKmW29kKKz4dgGGVgBT3a8yFAC8t8HFZyzr/sD/7tksyvCn4b0Nsmp5K2Pz8Ly7a4UNpCVo+rqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8362
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31559-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[pengutronix.de,gmail.com,nxp.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,foss.st.com];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.1:email,0.0.0.0:email,devicetree.org:url]
X-Rspamd-Queue-Id: 722F111D886
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


