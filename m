Return-Path: <linux-gpio+bounces-31561-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHMQEttli2kMUQAAu9opvQ
	(envelope-from <linux-gpio+bounces-31561-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 18:07:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDBF11D950
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 18:07:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5862C307ACEC
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 17:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D51AD32AACB;
	Tue, 10 Feb 2026 17:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Dar9S8EM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010051.outbound.protection.outlook.com [52.101.84.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0888C326930;
	Tue, 10 Feb 2026 17:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770743153; cv=fail; b=JivROpRU3xToF3MUUAj60nBZpFvhGIjujd/nXjWDU80fAu480i482+Tgm+pxcN+f7LH5ggY/7kJ1RpZybz+UiupN+GX9vBd8FkH8ay9CAFwLZJvFExMOLRJ+Ph2ZRtkmjJ00hjVvHvf5frB8BViIxoo6JIS0XO85Yn+G4doOIAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770743153; c=relaxed/simple;
	bh=N38VAq6Arjr2X538y88r8z8OjYp8hHe1fL026vSh6Gw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hCoOIPaqj14KzVzEig+KzxDrPsK5bYVyIeVXB37b+dthpls8aq6XtSznsavjRzPD7UkGFoStK1re3sJb1ivuPVPMi9V1BQpWg5LjOBibl7V+x7Xiti2LKd3sUq42P2tS8LwiDOYUWR94P5ICTnQUTsefDaDDpmPUwO/5MIxWbzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Dar9S8EM; arc=fail smtp.client-ip=52.101.84.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pFpWfgNxDAfIeyWEYCmCmXFuXaahWE1SZu31h4iygznxBkhurYZcobiwvKsn/4HBA96MRGE9JR88z98wxXBD1zZgESkfH4rPSV8L7fDsSGAm1Gds2egcTv9lIrmZPQjydkVGT8oh5trSdKjAOgR5JQo9vUJwFatAPdQNMrk/c2Ia7lddjw5iVn26jkUyOxuVBwF8EkL+EAnIGhuSfCgtuaqkith8T9qcfi6aIap6E3DMX2AG18p3B8oI9yXZzqILfMHi7CBlTDbSlHvuU6ofk1ctDlez2L4wkWG3w3Isiccpbm6pcsG2v7XAV39ebObjWiPnyDv4GXjNEpRG7S0vCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zTr8k7wuw+cdbwhFl/Ngv2Gor4tOSzMKlKWMPISzeYs=;
 b=WbvvjfoVXEV0Lyx/ffld7iAnQWQQuGgOpZxJbE59Rebv9J8f4sOxNko+DtYSgZFOwtty1ydrEENNpndabJfqxsokDTrb2dfagHc9pxObBL6ddGsfQBJXtzcFT238U2B6Aybh+Na4l5GbPgPqAvigueDOT6l3gt98cHgH4azQ7G7q4N+fn/WPvKM6lCmdiNKaZLoQZAuz8XLPtlM3VlxtmrZKxCyU9C2/XRLHDfVqbMRpKu11t0al+NJGUm1CroAeWuYX54OFuOyFHc/JBgO1ZBp/JKNcFpmyxRI9kCXY6tpjNRiVd37WznXsqlgAmqWyOBBdgW+WuYYvshTp19Xrag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zTr8k7wuw+cdbwhFl/Ngv2Gor4tOSzMKlKWMPISzeYs=;
 b=Dar9S8EMG217+mJ7vQ5fJ5G8JBfmcfhPpfF1jQV2MXG0Nl4peA56vq7GtyRRw+Uvq4LyI66LCJF+C9A/3sNBZ5Y3CSpRJVAI10dKStjtWC7srBBK8Xr2YgKZFMZge4sL+Nw2Bf343AP6GB2TjLAyGYGrO4QoYsuI82RT3qOxvlcmpENth/2pRJvpK5rptJmlvxp6bFaYdbk+DSR2OxlKZnuk6ySrIg0qYm/7Zz2i4tu+t2UVMAri7l1CD4do00BErGyfcEmf4hDd20eIi+CG3oFd1hN62Adu2D2/3Su7VE0JojoFzECd9Yqca0LoNn8+No1McRv9BPvhC15IZMP1kQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DB9PR04MB8362.eurprd04.prod.outlook.com (2603:10a6:10:241::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 17:05:49 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9611.006; Tue, 10 Feb 2026
 17:05:49 +0000
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
Subject: [PATCH v7 2/4] docs: driver-api: gpio: rpmsg gpio driver over rpmsg bus
Date: Tue, 10 Feb 2026 11:04:37 -0600
Message-ID: <20260210170439.406513-4-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210170439.406513-1-shenwei.wang@nxp.com>
References: <20260210170439.406513-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR02CA0023.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::15) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|DB9PR04MB8362:EE_
X-MS-Office365-Filtering-Correlation-Id: d7dea314-e147-4215-eed4-08de68c6a401
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|52116014|7416014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2j4E+T414uY/8/NERA208Tsc5m0UYIhIQXmuAtdyZ6MrwQpZ+4EdOc5no/pC?=
 =?us-ascii?Q?RML9Ojvqhrr8c0Ux8rY3/PldVvswKkzIkEqTFS0AsTVmD1OadjfpL6rMCR7J?=
 =?us-ascii?Q?4xWfxJTROvBlx7jtmbzBTZf6fJAjth3xPaifOgynid+UQZszjtcDWWrYtUlT?=
 =?us-ascii?Q?+M2O8Bf8hhXlpwmAgUD0RC7lME/uXtPUKGS1nfGPBtJC9piP7oQ9SpTtQMij?=
 =?us-ascii?Q?FKB+JQTG+LxR1RAdZ8XvFR/fvWiV24Xds7PkmWY1b8mhqGRGJQf6DbcPx8qW?=
 =?us-ascii?Q?zALG2L8gj0mWmeZqjtpc/erJlRqm/k2zkx+jEAjgS+2oMGNTIVKFXuKWOcAp?=
 =?us-ascii?Q?EI9xSzlUbbeQDPWqh2/gzooDyptpbpcpU4BaEIOmI6Gc1cTCGFdgJqIn+VCC?=
 =?us-ascii?Q?3AaKMc17McFiA7pSXln/RtsedJJ3uByjYUWcj+wyJWy7bfrrp6m5/XMfr6XY?=
 =?us-ascii?Q?zFZ5yVO2Ixg0vL22kukH2S+o0WOjFd0NH0qn03IDl1O87gz5QaV0iTqlQClR?=
 =?us-ascii?Q?sUF5ZIaJiU/Qhrx80PnOsPAx0A/yjsqUPq9JdvFB/zFfbiwb79jV8PoMM5mb?=
 =?us-ascii?Q?EICsPL8zxrCQdGIjJOU0GnVOmvfXoRHx/tzgtF9xGKTFuGXSxbGGWFPyzhdJ?=
 =?us-ascii?Q?LOyteQVFZyRDffyXNo65sgAcVFr3dluB9bD7WqvAaRh4Gr4oepYYSNrBBNOy?=
 =?us-ascii?Q?U10EnGlirDuXroV1ukYNjIkRgT+Vc+wGvhNfvZ3ZZJ7E67mhcFusBrk6C2Ek?=
 =?us-ascii?Q?hU+217Th+iZkGAbslNeuA73NOdhi2DvWOoJ2f+YSUg4hdLRu+RkGgiKwi2Bi?=
 =?us-ascii?Q?K4PTve3QBfX7iTJJaYDkrcStbCjmW2SldaxOccnLQMSQ//BJsp0g+xpDqE8J?=
 =?us-ascii?Q?GY2V6qdUOuMvsDneTECJuT8fNCqHJIR6tS4HcgZXY6CNg/8yBDiFcDMUqtcX?=
 =?us-ascii?Q?NaMBpyrTDRxu1ihBspxu7maoQc1knR5R1qqYqOo1WPHm/CTMdSRrQVtKxoGK?=
 =?us-ascii?Q?jZXnC+G+YYPgVqCjAmyvZ6gEXgsMDtmiVgyON6LRaCcjqTYR5BG6TFRAo4kd?=
 =?us-ascii?Q?JhV5YG1HIQsjyT4DElFFdFtJVkf/relKccP6cNOSkAkL9fVHfA7pHNTolslh?=
 =?us-ascii?Q?DAaREuSOWu50yZWmwOTd9190OFq5mHJ4YPdjY3DCeBaFDQlCq8O0ClKakENG?=
 =?us-ascii?Q?TBbN5h8lKvX6QjA3VN0GEOEdVp82L12EyBWJHaO1O3BaWEo9hysQb1U0qu7l?=
 =?us-ascii?Q?9LMbfWwQ8nQjlssx4yPHjDW2jno5mTPhnUDkbs8DLO7r/ktZEMvG+ER1p/vL?=
 =?us-ascii?Q?Q3uKbtZUdNF4V+CTGdyH9RUiKBy9opSwepZIh7ZbrpECLyT1/DQJBA5CDSHl?=
 =?us-ascii?Q?Sm0kzze9+ioX3rBVucA8kBb7AbGtzZWbWqMJF88yo5EhB69ge+twpAK8SRk3?=
 =?us-ascii?Q?Yh8mXfAzbxTlKuHmvkMLu0VWv54ueyPoR0uAOeMBKz0jB0eQo4ICjNzlFtZu?=
 =?us-ascii?Q?dZ17ud7jktcL3wsGePbElOt9UIbJe4G1PtclT70aesbf14RvrTCJin4t28WV?=
 =?us-ascii?Q?YMoo0OF09DPwt2Yzh4RZiOIaMyOxfOdkbt9JkWkpY6s/rJo+ch3n/8OI6Y34?=
 =?us-ascii?Q?wBCs7pr1t8FCpv7Lg75QkDqre74sxAGa9olKxvijPqnL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(7416014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9aQgxzoQaBMbTW5Yh10pEyOZGgh5rE5rGOkZZCC2U5PSS6edAX7t8n1OzMUf?=
 =?us-ascii?Q?u8KqpFarv+Y0+BVOZgaooyRpu8wiujoT1JiNzkkd7QI1BIt8b3Uz1fJcDqs8?=
 =?us-ascii?Q?VgXJ6xgwKR9bEZ/9ca0I+vaEIprO0AoJLTQSGg48bD5Z/jng9fcDyvejKHnJ?=
 =?us-ascii?Q?cXa6PRjHCvThb/l1O1co1QfU47dvEBQUJ84QHXx1D7pH8VaqNnCU4nal5g4w?=
 =?us-ascii?Q?RFfLwrhc3hRzW4G4r1oslNQZJpKQS+p7OCnkJOsUN/HyHgR4G7yUHx9q9Bpp?=
 =?us-ascii?Q?xR35yDAu29qirzB9DyPsqePYZp2T9F0l4VZBoCYV3+fesjWYK5y6tWvp2ZSa?=
 =?us-ascii?Q?l+2QzLXCniQjF4DyRg2LPWAd7Ak5kG78xiZnLTTCcbr8XCgYEFWR5kmdFHF7?=
 =?us-ascii?Q?B3LYISvsA9eh3xK69YknrMgbEWFhWfIKOWGuGMmIc/u24Bryh8cYchcdG/i3?=
 =?us-ascii?Q?HXuT5Joi22P+zYlptIlxr/cbXCd+3+OpGyZP44EZhYDXU3ROsWW/842BKMwL?=
 =?us-ascii?Q?RcHR99V0jyY7opBEXmGZrnKkYILdfWThOTX33pc0ypuCPtDepFh8WoMYbQkq?=
 =?us-ascii?Q?efPaykpmz40FG68fekDofULuFbvTPolo/DeFWp/lae+RLH5w5dOHUtOcW4g1?=
 =?us-ascii?Q?Crax+fQcakhJvCeSgsWhZzEB43FkAo5ewffSu7Az2h0DS05btQazSmZkKMQH?=
 =?us-ascii?Q?AtuxHG/fBihtv6hVoW7qe6B/XprqHp+O8JIAn9P2+K/E2tKLmBKEXBM8uDrb?=
 =?us-ascii?Q?6FD/ewkgCLmXvED4wgJ6NOhjMmXyWKFY8iAM8oKEvJM56cnRH4ayvbn9/Mpn?=
 =?us-ascii?Q?fxg/C3IUcXOnT+/GRKy+UaAOzsyMUEpqE3+iI1Ukq1L0va/HIeyYeQlbk32R?=
 =?us-ascii?Q?f4WLQveFuV9SlCl+l4daPzgPqYczuLWWA32ZqlsCGzuNRusxvZMSAxaEK8Y2?=
 =?us-ascii?Q?DGfJnt9CJDTGfM7jUcAZ+yQpyRY6hnyQVjkS9TXqq2eHHmgc7hwUjupwres6?=
 =?us-ascii?Q?kgTXqeZBhTJZaKbMYRD25U3OMLTWahtX/42g8pC+cbcU8r/dwRLTRJ9Lfc1f?=
 =?us-ascii?Q?I9ruK63TQQzIE+erEh5q5xYQSYvN/4uRCtiNRd6vnF2eHvQi7LTaZO55kkRy?=
 =?us-ascii?Q?Egqay5KYi00XEwU8kTHhsS2pce/WpDTZyBZHfDi48vzFxpX/DAuV+8lRP4So?=
 =?us-ascii?Q?aYKTpTdzuAw1ir9SDGxED+5imGImMc7fqAlIO1NMg2ozLXZUxzvspH19XVRO?=
 =?us-ascii?Q?/y2q+5QTA+qkbWCcUYbRLa+ayhNh0z0ktAPUKAz1tpmJbaEl5w720qpL1ICi?=
 =?us-ascii?Q?EqqNQ1R7M5uJmx/jximozEONm1kkifsyXW9pPcXKWIFsirkcpZRlooOmS6Vc?=
 =?us-ascii?Q?0f3R9It74EAQ8Axb+bxonwU8U3dIil+DoU4tMFy5JdtTMlPQeH6GqXHzchzD?=
 =?us-ascii?Q?qGRR1v4UWKadN3AbkanWQYUY5akArHUWE9WjeXcfZA62FSjw69bD+3yyLNE/?=
 =?us-ascii?Q?M3MUkaHFrHPvp3Pz3kvag8VbesxjljM3j/MlAJUTmMkk4Dl3/EVTAchlzAOe?=
 =?us-ascii?Q?rcncWdYPk5U+ipdstCPplGDM+Y1VnWs9LhjQkIy/Bot7IHeU+x0918Jgvf1q?=
 =?us-ascii?Q?zoCt4JDRq097OpyQ099K2AXyIkz4YOmd67OZFSq3zbZ4TmFZ6bJf/P7nnVmy?=
 =?us-ascii?Q?ELr4a5jVJCi1+CHKHxHyEE0VPyMYVV87wyZo8uizQQoGnMutFET+qtF5/7i9?=
 =?us-ascii?Q?BPsesB48Vw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7dea314-e147-4215-eed4-08de68c6a401
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 17:05:49.8751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +44MiQKlrpFGPzGJdIniheOgc16aPf7DsWH2R81au9ALR2+vQrWroBgK0MO+reXQIMYtfpf4ma2hfUlIWKQSUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8362
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31561-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[pengutronix.de,gmail.com,nxp.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,foss.st.com];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DBDBF11D950
X-Rspamd-Action: no action

Describes the gpio rpmsg transport protocol over the rpmsg bus between
the remote system and Linux.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 Documentation/driver-api/gpio/gpio-rpmsg.rst | 236 +++++++++++++++++++
 Documentation/driver-api/gpio/index.rst      |   1 +
 2 files changed, 237 insertions(+)
 create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst

diff --git a/Documentation/driver-api/gpio/gpio-rpmsg.rst b/Documentation/driver-api/gpio/gpio-rpmsg.rst
new file mode 100644
index 000000000000..6964de309471
--- /dev/null
+++ b/Documentation/driver-api/gpio/gpio-rpmsg.rst
@@ -0,0 +1,236 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+GPIO RPMSG Protocol
+===================
+
+The GPIO RPMSG transport protocol is used for communication and interaction
+with GPIO controllers located on remote cores on the RPMSG bus.
+
+Message Format
+--------------
+
+The RPMSG message consists of a 14-byte packet with the following layout:
+
+.. code-block:: none
+
+   +-----+-------+--------+-----+-----+------------+-----+-----+-----+----+
+   |0x00 |0x01   |0x02    |0x03 |0x04 |0x05..0x09  |0x0A |0x0B |0x0C |0x0D|
+   | ID  |vendor |version |type |cmd  |reserved[5] |line |port |  data    |
+   +-----+-------+--------+-----+-----+------------+-----+-----+-----+----+
+
+- **ID (Message Identification Code)**: Must be 0x5. Indicates the GPIO message.
+
+- **Vendor**: Vendor ID number.
+  - 0: Reserved
+  - 1: NXP
+
+- **Version**: Vendor-specific version number (such as software release).
+
+- **Type (Message Type)**: The message type can be one of:
+
+  - 0: GPIO_RPMSG_SETUP
+  - 1: GPIO_RPMSG_REPLY
+  - 2: GPIO_RPMSG_NOTIFY
+
+- **Cmd**: Command code, used for GPIO_RPMSG_SETUP messages.
+
+- **reserved[5]**: Reserved bytes. Should always be 0.
+
+- **line**: The GPIO line(pin) index of the port.
+
+- **port**: The GPIO port(bank) index.
+
+- **data**: See details in the command description below.
+
+GPIO Commands
+-------------
+
+Commands are specified in the **Cmd** field for **GPIO_RPMSG_SETUP** (Type=0) messages.
+
+The SETUP message is always sent from Linux to the remote firmware. Each
+SETUP corresponds to a single REPLY message. The GPIO driver should
+serialize messages and determine whether a REPLY message is required. If a
+REPLY message is expected but not received within the specified timeout
+period (currently 1 second in the Linux driver), the driver should return
+-ETIMEOUT.
+
+GPIO_RPMSG_INPUT_INIT (Cmd=0)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 0   | 0   |  0        |line |port | val | wk |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+- **val**: Interrupt trigger type.
+
+  - 0: Interrupt disabled
+  - 1: Rising edge trigger
+  - 2: Falling edge trigger
+  - 3: Both edge trigger
+  - 4: Low level trigger
+  - 5: High level trigger
+
+- **wk**: Wakeup enable.
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
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 1   | 1   |  0        |line |port | err | 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+- **err**: Error code from the remote core.
+
+  - 0: Success
+  - 1: General error (Early remote software only returns this unclassified error)
+  - 2: Not supported (A command is not supported by the remote firmware)
+  - 3: Resource not available (The resource is not allocated to Linux)
+  - 4: Resource busy (The resource is already in use)
+  - 5: Parameter error
+
+GPIO_RPMSG_OUTPUT_INIT (Cmd=1)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 0   | 1   |  0        |line |port | val | 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+- **val**: Output level.
+
+  - 0: Low
+  - 1: High
+
+**Reply:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 1   | 1   |  0        |line |port | err | 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+- **err**: See above for definitions.
+
+GPIO_RPMSG_INPUT_GET (Cmd=2)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 0   | 2   |  0        |line |port | 0   | 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+**Reply:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+-----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D |
+   | 5   | 1   | 0   | 1   | 2   |  0        |line |port | err |level|
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+-----+
+
+- **err**: See above for definitions.
+
+- **level**: Input level.
+
+  - 0: Low
+  - 1: High
+
+GPIO_RPMSG_GET_DIRECTION (Cmd=3)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 0   | 3   |  0        |line |port | 0   | 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+**Reply:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+-----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D |
+   | 5   | 1   | 0   | 1   | 3   |  0        |line |port | err | dir |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+-----+
+
+- **err**: See above for definitions.
+
+- **dir**: Direction.
+
+  - 0: Output
+  - 1: Input
+
+GPIO_RPMSG_NOTIFY_REPLY (Cmd=4)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+The reply message for the notification is optional. The remote firmware can
+implement it to simulate the interrupt acknowledgment behavior.
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 0   | 4   |  0        |line |port |level| 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+- **line**: The GPIO line(pin) index of the port.
+- **port**: The GPIO port(bank) index.
+
+Notification Message
+--------------------
+
+Notifications are sent with **Type=2 (GPIO_RPMSG_NOTIFY)**:
+
+When a GPIO line asserts an interrupt on the remote processor, the firmware
+should immediately mask the corresponding interrupt source and send a
+notification message to the Linux. Upon completion of the interrupt
+handling on the Linux side, the driver should issue a
+**GPIO_RPMSG_INPUT_INIT** command to the firmware to unmask the interrupt.
+
+A Notification message can arrive between a SETUP and its REPLY message,
+and the driver is expected to handle this scenario.
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 2   | 0   |  0        |line |port |type | 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+- **line**: The GPIO line(pin) index of the port.
+- **port**: The GPIO port(bank) index.
+- **type**: Optional pamameter to indicate the trigger event type.
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


