Return-Path: <linux-gpio+bounces-30787-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJrrJ+xQcGlvXQAAu9opvQ
	(envelope-from <linux-gpio+bounces-30787-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 05:07:08 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E2750CB9
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 05:07:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 37709649F4D
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 12:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7DF42849D;
	Tue, 20 Jan 2026 11:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="WQuSVlIf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011045.outbound.protection.outlook.com [40.107.130.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDFB427A15;
	Tue, 20 Jan 2026 11:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768910388; cv=fail; b=hjai43ICrWPJDLvD7pavZGZBotKQ5Fha549hFXcT9bxtZNNQSviU+QZT8bIFG+CtNesvCzfDXa4fDH1TDN7CjAQL0UYqPvni2DRIO4LIvWF32RkcD1xFhzpg2MAoMXnZh0B9OSTd2rl6l5zd5yf/hr5Vbpq8O9y0MGTNzXismPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768910388; c=relaxed/simple;
	bh=D+gs2KKKg9KqFLGTh/Jvke3pnSJaMoMamZhoxZZnlA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AF6V0G34nvklAVcHcN56Y50pZG6jrZHxXQrkfAZGkW7Qyp1dgDmjUocumQXJ2FAvqond9TteJAnoXI6AmMlbkFpDOtbvVoV1gHp1XfpPK4+0S5RrUZ8k5/eMlEZBTuIvCY6xh2bu680nuEHfKYZahcIdTpL60ACTjECBTAhDfVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WQuSVlIf; arc=fail smtp.client-ip=40.107.130.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wqXGp/lqI21gh/wfdnkVMJyZ6rnBzNtKoOgEM5PmremCuZa0dG0rjJPjUbVGBWeep5G10dR52Ov8uxzwIMwJd5S5hkmOMSaDP0rLTzTDthYg3/7Ia9s830j5usukJwmBywwbtLGcbdBXgyB4+05oZgWioOUBGjE0/o30Bfzv5sk/JYHB4gkfWZ7FcxKyyeaPXZ8+jArB4xSIyDTdiuiBwvKE4ne7MdeEaQw7CHoR525mn2EkcYFRXD+ij3JccIsGzggK+RLpG1ejXE3KA1E6DQpDRBB4tmq6XCIXyziZVE1SZm2rWG/Q4PZcuzI928d+1rFgMWq0M3Pb9xEdkJkFaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QkHBKpjEpKe85aGE/TqLRkuRrpIcPOt2InecexWcYos=;
 b=ZK5W2mYbhhmqrlyZN7AzlOm3yN+dxnWydBofBAlrAcUZBNsGSdSS07s/VbuEyv8eB0Pf0EPlbUlPSJHlrohfkwsjrvoBzyXCHj6ZNxksPAAiTMEAP28fxQizqd+h6/vFu/s6GQNTN2aF7dTg+MGt0NNGHCQYFxrD7S4eoslnpm/avvJECruYty+GHTq2NCmw157uOy8dAKtSh3qEYI5RZcalywM78EzjBldDFxcrzboRfi9/6U5fJ8Lw1x6oin7dR7r4uMy2FOLanEw/5GThvoHSlnu0WqTn8i7nZcKpxXrPoxq+eS94Pc8bk8yyFG46hYv7aA3dGxEgq7omshe+nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QkHBKpjEpKe85aGE/TqLRkuRrpIcPOt2InecexWcYos=;
 b=WQuSVlIfwhe1YHRZarMK5/T3HSIl6skvBtxTc/68krHsTv3XVcintqoEASefC0lGUVn1nI4L1EiHeTyY8NzKF0trgd+NJiDwkUGGrP3P/zrvnQgLXAhZ355Wji7vEz3DYIYLUqW/MYauVnuqjv2tFAPCQ73CxA05/cW3LundWEEag5uU5unA/KMmuCeTeljzuxH/tWlg74NCbXzq4tT4uXR1UrX0K3qWapYiv0Mvx94gq3mTx1wes/t/p0oo+YHw1rCJf/76oNaO60qwq9oVilx2IbW3C61jCUpm6wliwfVVp2P9BWQee++ScqQmXll0Y1qGA2xSdocGfw+pBHQflA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8190.eurprd04.prod.outlook.com (2603:10a6:102:1bf::23)
 by PA1PR04MB10769.eurprd04.prod.outlook.com (2603:10a6:102:488::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 11:59:41 +0000
Received: from PAXPR04MB8190.eurprd04.prod.outlook.com
 ([fe80::6720:8c00:7732:fc42]) by PAXPR04MB8190.eurprd04.prod.outlook.com
 ([fe80::6720:8c00:7732:fc42%7]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 11:59:41 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: Alberto Ruiz <aruizrui@redhat.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	devicetree@vger.kernel.org,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"Vincent Guittot devicetree @ vger . kernel . org" <vincent.guittot@linaro.org>
Subject: [PATCH v8 06/10] pinctrl: s32g2: change the driver to also be probed as an MFD cell
Date: Tue, 20 Jan 2026 13:59:18 +0200
Message-ID: <20260120115923.3463866-7-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0449.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::9) To PAXPR04MB8190.eurprd04.prod.outlook.com
 (2603:10a6:102:1bf::23)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8190:EE_|PA1PR04MB10769:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a5a4a7f-a046-4a5b-52ce-08de581b64a4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NsdK+kpD+WeWo9N+KxTuAsjVQDeQseauoUqxMs17bNw7WC3Xbd2E6G+vpQPf?=
 =?us-ascii?Q?7M8cliTKig5DsfTATT3PP9OifWKlZFoeWys/9f491b/PGX7MrWJtxVvBXwhM?=
 =?us-ascii?Q?zgGQCUWnASdX4zVoNR7dekS6v937pI4Ri4Rn1VKxk3JZcnzDvY8kOp2+vGwq?=
 =?us-ascii?Q?SM9eM/2MzZYlRIXOjZnGVXp8qGMT5VqkUFFejTtXkSuzm1T4gQuaZLMJ+Hkz?=
 =?us-ascii?Q?xiNGjkzINkGQFXspLDaekSiy1Nk50YGTa+5o8veFrUO+nwC2Gr+hizYNRj9n?=
 =?us-ascii?Q?F4wwuyEzOGnuJShFCnpqVDa2kHO5cVEVA00hBDEpns4gkWRvB/ORFj7CXsPB?=
 =?us-ascii?Q?LiyfubY2fBBD4PThIDJmZmKGHFThxKqPsKc3PMhdGfnacdlBIve2tNuSghbg?=
 =?us-ascii?Q?qWn23vXHvE3Ct5WbqpLJJQlVd1RBmBegs6pyfkaFsrGh35KTSZWkKvaTHR0L?=
 =?us-ascii?Q?z8E/Rop/l0CCZKNpM5PYNc2s2w6TCccVUKCp/amzu6G0Kv6rbvhX6nZEYE4W?=
 =?us-ascii?Q?m9LveWw/oIf21o5RsA2p3/uU+Tz8QuOEcutvDilAhvVyl87i00IFhfOS+h5E?=
 =?us-ascii?Q?qwPAAXPaNpNbChaxjQr6HblTCxwtKD6oTkGtMgb8WCnoy4UgkX3/C+qPfgUn?=
 =?us-ascii?Q?XNdlS0fCeUytnVRfge85asqI244EMAfLMjiGHuGWoZTuN6GfGmHwDrlD1d/H?=
 =?us-ascii?Q?qCuGSuxrGss8dyROGoW94a1K0bV8FF07WFODfbSs5SGjampVIj1R2k1ET3jc?=
 =?us-ascii?Q?1/4G0yjuvYn4872h0mi/HTLeh1/UpMQDh8pF5JhHD6HhloN6UlqmqP5UD0pE?=
 =?us-ascii?Q?loAw7jWeqED0qbAslQgNJIC4bNHZo1ar/dZk69WhZAY8zPKxvUNrJx1P9DzR?=
 =?us-ascii?Q?3VYY3N2smqAEDzWJhSYa57uuy5DgniYlujR0Ueu7z0igAU59r1efDWKx836H?=
 =?us-ascii?Q?uAF/x4njT8kPbYnaXiUIVdvOU8Wn9w+bE2gMfn/2+XlSngE5wyE38wf6LKHl?=
 =?us-ascii?Q?VFAvjX/t5MUQxDlX6v0pYIAUzpphHRDdWUNszBiOLqMfqaLeVGer17QOpVM+?=
 =?us-ascii?Q?uOJYwyoo1qEq3bzjJBP7HnqUzMBpa4qdC2U2smnCIvcZWyLa01U5a1dhNHsQ?=
 =?us-ascii?Q?NXn3PTrguhEXPELoW1OA0SglmHJ9npYgRRORJ30RYo9db1SUb5V//IHG+Yds?=
 =?us-ascii?Q?n81Ids76Gu4h1BDTRiTq+57LnTxwVF3IhkMDmhxMjqMwcEM+rDzVQpWxZYkN?=
 =?us-ascii?Q?HoKIBt8xKkwfILiQQjgE3v8XB1vYbH9FS2BFv+JUIQNqVVMaCHOUjWZNnLBw?=
 =?us-ascii?Q?BrvBql7+3WAsogUtVH+FEunIs9OF8cavkV2qyRznp5VlATMb60eCXQVgMmRg?=
 =?us-ascii?Q?7znFvZDf9M8LPsPEn2pOSSttnwWwAssTxyN6vRDq0S9K+Lzqyv2mi9FSF3uh?=
 =?us-ascii?Q?BKScSyVRsEyrIIHW3bXx6vmNp1BQdxMLLbYzvqcVU52LqM5CAKnR1LslDpgD?=
 =?us-ascii?Q?CdbiRFHzn3QI9FrgkMLRbILEwPm2BdMuUTSD5zxPPeKcUGDaEbBrnpiMvGD1?=
 =?us-ascii?Q?dG9d0WRPvydsD2jkCF0IPTT3Oht0sQE1404IuTI9kIP2XWitgrsd5QINcLxe?=
 =?us-ascii?Q?QA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8190.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JEUpfvA7Gn4P3Uz1izKW2eWP3AZXgcItZXCXcQ/Xs1ZX5/II/Xrq8x15xJcC?=
 =?us-ascii?Q?YPl6kRo3DUs+/SsViHUixmK0c3stb9ma/0R1VaJCFfGdTU7aqLCSJeBuFvGY?=
 =?us-ascii?Q?P3SwQqLjxSMXR9FO6au93tF6/VzVdYbHOCIa9U2Whme2UqR8E1Vmffsu1uT7?=
 =?us-ascii?Q?TXFf7ys2zrB3q09AOnqAAnwGBVUaIgOMvgvkMtsVc7RapO5+5KeQdXvoJBvI?=
 =?us-ascii?Q?lGhFfOqa8twvIIyqapQS7xM0yBiFjJfose7a6HdQJ68i1UFoSKoWHwIm7H3D?=
 =?us-ascii?Q?ibvI1x0ZRaJ5uSxDBqI4Np0ufeJBp4EcZSsQBevCq8Qp6Wasxt15j0adxQ11?=
 =?us-ascii?Q?Axa5VNzicgjMGaOmpWzCM1LxcLOKc6SyIPf4BJqA0eLuCCjoqX7l3tVM+s95?=
 =?us-ascii?Q?U6cCAW6Hk60EXCu4FPYgwIsSEMXbDAVD1qWcvrg+HpxNdspLhp7foxab4ILH?=
 =?us-ascii?Q?zOUmMcx4PmBPYR6WnyAA6QZydxby9qxXSfiXWJrh5y9oLu2LPbpSMiS2I82X?=
 =?us-ascii?Q?5orbFpBh/Vj26J9ZJ3Yewyqhrf8ko8Jic7lt4aNgBTiXFx6uhkge3RZ7bGER?=
 =?us-ascii?Q?StbaTY6uBTZRnJf2m6s/OuXWNJosJIdwfDjj1280oInIJMI8VP6LRY5NvPRe?=
 =?us-ascii?Q?PH+CRHyguBWWC+dHRntbk+iWI23evwl8e7anlDqosqs2SIHHWS88fL+zqCvl?=
 =?us-ascii?Q?hzOTg7XhjjIZFIxvub/0EWS37T8P5a6yACtjHvdkMVIXUjUkLOT8YsqvUezF?=
 =?us-ascii?Q?OGefCTz6C3P+5RxUW4N+1zqao52fNpTyvkGFnFewwEgDg12Bfqwx6SsYAHdO?=
 =?us-ascii?Q?9YTzV7O1nIbuwoVwYFudM4v4JEbbdofpAZllsgHSdBMAOgFS7DWV6Xu7801x?=
 =?us-ascii?Q?2lvem94ed0Pjt9mno8g/fK/ohTaLr1qhYVhFDGt7v4peYcjNovmiKxyInzqe?=
 =?us-ascii?Q?4SX2qom1hLFfy47Lk/lzbALRw2O8VZ6dc6LOW1hAJfO7hCPrWySY00LyYhVe?=
 =?us-ascii?Q?C0+ZVxD+5VJphYJliDTkDuzjI1qzaXAogPA50OgUMR5b3TGqZpe8NMN8kqdx?=
 =?us-ascii?Q?Eww9cqeQKlIYhbCAkAnoNQDhoH7wdOARiwpj6R+ZmI0M1GVb7GU+3WNdBEmJ?=
 =?us-ascii?Q?ChyPXBw1Ka0HM99FkqHuokWaa1OvsOIAwBfpdgzUjw25OkDnjPQrxCIwS/ha?=
 =?us-ascii?Q?X1YMKxpmMZa2ycDt1oKoTiZ13SIGHhfYkun3rx7mPBq70jxWZME5Jt1dLTvE?=
 =?us-ascii?Q?upe0U1eFgVuCSuHR9JQQRs0udtgvsGY0HZ//VUrfI8ZVI74Ilz11zR+/arR4?=
 =?us-ascii?Q?oPHUaRQMLFZ9N0Zv+VE437t5k7cSZLCWtc76Kf7iHkQvhIMWWoeuxI04+zSM?=
 =?us-ascii?Q?6sEDe998Dygsu6YbHH0ZbqvATd0+Rk0R/WQejMMVOdJCPp6QG3aeqlD5ip49?=
 =?us-ascii?Q?OjLeXOHNpd23elIN/7E3+rscFSeuagqhDiP2LvSiskYqs64QR8c0wXokvEpp?=
 =?us-ascii?Q?6YvHMpDeJzhrJQPR2YmE8BqYpiKfUU1//87e57J7fY9XzG4G0bmbkFd7MDRs?=
 =?us-ascii?Q?Lbg03lY3BL3BMG9n5XVN63W/YQgd4Z9fyCGGHQAIW2QAdgKCNyTCB52BZZzd?=
 =?us-ascii?Q?yxgGrMddiTVRv+EV0ndYXnx+JrP7dHwos9Q4+BSKQjlgMMA+5lkVUKCyHlJc?=
 =?us-ascii?Q?UhlrTqcGdprr8JTv186mkyaaOCiUBuzQZBSL680c6AVUdMFlHqnubm/C+75A?=
 =?us-ascii?Q?Cw6HJD2/OyzDxpvUtlV1wXkEoF0FY0dXLr/YyvO41GBWX7k0dQ+t?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a5a4a7f-a046-4a5b-52ce-08de581b64a4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8190.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 11:59:41.1405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RK81okZAHjvyrZrcnTTlXU7+tZCOkx57iI7sQb3pv8SRt2NNIOmhMQ8TLABTn/mICvJIsM6CVaGO45ALfKKKuilb4dQwmICC+DLRFS0M0xAeCP0FH0SAqWV840/mcWLo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10769
X-Spamd-Result: default: False [3.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : No valid SPF, DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	TAGGED_FROM(0.00)[bounces-30787-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,nxp.com:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 52E2750CB9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>

The old pinctrl bindings for SIUL2 are deprecated by a previous commit.
The new bindings for the SIUL2 represent it as an MFD device:
- one cell for combined pinctrl&GPIO
- two cella acting as syscon providers for SoC registers access

This commit allows the existing driver to also be probed as an MFD cell.
The changes only impact the way the driver initializes the regmaps for
accessing MSCR and IMCR registers.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32.h   |   4 +-
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 114 ++++++++++++++++++++++------
 drivers/pinctrl/nxp/pinctrl-s32g2.c |  32 ++++++--
 3 files changed, 118 insertions(+), 32 deletions(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32.h b/drivers/pinctrl/nxp/pinctrl-s32.h
index add3c77ddfed..6ce7981208c7 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32.h
+++ b/drivers/pinctrl/nxp/pinctrl-s32.h
@@ -2,7 +2,7 @@
  *
  * S32 pinmux core definitions
  *
- * Copyright 2016-2020, 2022 NXP
+ * Copyright 2016-2020, 2022, 2025 NXP
  * Copyright (C) 2022 SUSE LLC
  * Copyright 2015-2016 Freescale Semiconductor, Inc.
  * Copyright (C) 2012 Linaro Ltd.
@@ -28,6 +28,7 @@ struct s32_pin_group {
  * struct s32_pin_range - pin ID range for each memory region.
  * @start: start pin ID
  * @end: end pin ID
+ * @legacy: legacy standalone pinctrl driver or MFD cell
  */
 struct s32_pin_range {
 	unsigned int start;
@@ -39,6 +40,7 @@ struct s32_pinctrl_soc_data {
 	unsigned int npins;
 	const struct s32_pin_range *mem_pin_ranges;
 	unsigned int mem_regions;
+	bool legacy;
 };
 
 struct s32_pinctrl_soc_info {
diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index 4767916dbcab..cdd3a1cd4fe5 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -12,6 +12,7 @@
 #include <linux/gpio/driver.h>
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/mfd/nxp-siul2.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -101,6 +102,8 @@ struct s32_pinctrl_context {
  * @gpio_configs: saved configurations for GPIO pins
  * @gpio_configs_lock: lock for the `gpio_configs` list
  * @saved_context: configuration saved over system sleep
+ * @legacy: true if the old pinctrl bindings are in use
+ *	    instead of the newer MFD based ones
  */
 struct s32_pinctrl {
 	struct device *dev;
@@ -112,6 +115,7 @@ struct s32_pinctrl {
 #ifdef CONFIG_PM_SLEEP
 	struct s32_pinctrl_context saved_context;
 #endif
+	bool legacy;
 };
 
 static struct s32_pinctrl_mem_region *
@@ -131,6 +135,19 @@ s32_get_region(struct pinctrl_dev *pctldev, unsigned int pin)
 	return NULL;
 }
 
+static struct device *s32_get_dev(struct s32_pinctrl *ipctl)
+{
+	if (ipctl->legacy)
+		return ipctl->dev;
+
+	return ipctl->dev->parent;
+}
+
+static struct device_node *s32_get_np(struct s32_pinctrl *ipctl)
+{
+	return s32_get_dev(ipctl)->of_node;
+}
+
 static int s32_check_pin(struct pinctrl_dev *pctldev,
 			 unsigned int pin)
 {
@@ -231,7 +248,7 @@ static int s32_dt_group_node_to_map(struct pinctrl_dev *pctldev,
 				    const char *func_name)
 {
 	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
-	struct device *dev = ipctl->dev;
+	struct device *dev = s32_get_dev(ipctl);
 	unsigned long *cfgs = NULL;
 	unsigned int n_cfgs, reserve = 1;
 	int n_pins, ret;
@@ -804,8 +821,8 @@ static int s32_pinctrl_parse_groups(struct device_node *np,
 }
 
 static int s32_pinctrl_parse_functions(struct device_node *np,
-					struct s32_pinctrl_soc_info *info,
-					u32 index)
+				       struct s32_pinctrl_soc_info *info,
+				       u32 index)
 {
 	struct pinfunction *func;
 	struct s32_pin_group *grp;
@@ -843,31 +860,21 @@ static int s32_pinctrl_parse_functions(struct device_node *np,
 	return 0;
 }
 
-static int s32_pinctrl_probe_dt(struct platform_device *pdev,
-				struct s32_pinctrl *ipctl)
+static int legacy_s32_pinctrl_regmap_init(struct platform_device *pdev,
+					  struct s32_pinctrl *ipctl)
 {
 	struct s32_pinctrl_soc_info *info = ipctl->info;
-	struct device_node *np = pdev->dev.of_node;
+	unsigned int mem_regions;
 	struct resource *res;
 	struct regmap *map;
 	void __iomem *base;
-	unsigned int mem_regions = info->soc_data->mem_regions;
-	int ret;
-	u32 nfuncs = 0;
 	u32 i = 0;
 
-	if (!np)
-		return -ENODEV;
-
-	if (mem_regions == 0 || mem_regions >= 10000) {
-		dev_err(&pdev->dev, "mem_regions is invalid: %u\n", mem_regions);
-		return -EINVAL;
-	}
-
-	ipctl->regions = devm_kcalloc(&pdev->dev, mem_regions,
-				      sizeof(*ipctl->regions), GFP_KERNEL);
-	if (!ipctl->regions)
-		return -ENOMEM;
+	mem_regions = info->soc_data->mem_regions;
+	if (mem_regions == 0 || mem_regions >= 10000)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "mem_regions is invalid: %u\n",
+				     mem_regions);
 
 	for (i = 0; i < mem_regions; i++) {
 		base = devm_platform_get_and_ioremap_resource(pdev, i, &res);
@@ -882,7 +889,7 @@ static int s32_pinctrl_probe_dt(struct platform_device *pdev,
 						 s32_regmap_config.reg_stride;
 
 		map = devm_regmap_init_mmio(&pdev->dev, base,
-						&s32_regmap_config);
+					    &s32_regmap_config);
 		if (IS_ERR(map)) {
 			dev_err(&pdev->dev, "Failed to init regmap[%u]\n", i);
 			return PTR_ERR(map);
@@ -892,7 +899,49 @@ static int s32_pinctrl_probe_dt(struct platform_device *pdev,
 		ipctl->regions[i].pin_range = &info->soc_data->mem_pin_ranges[i];
 	}
 
-	nfuncs = of_get_child_count(np);
+	return 0;
+}
+
+static int s32_pinctrl_mfd_regmap_init(struct platform_device *pdev,
+				       struct s32_pinctrl *ipctl)
+
+{
+	struct nxp_siul2_mfd *mfd = dev_get_drvdata(pdev->dev.parent);
+	struct s32_pinctrl_soc_info *info = ipctl->info;
+	unsigned int mem_regions;
+	u8 regmap_type;
+	u32 i = 0, j;
+
+	/* One MSCR and one IMCR region per SIUL2 module. */
+	mem_regions = info->soc_data->mem_regions;
+	if (mem_regions != mfd->num_siul2 * 2)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "mem_regions is invalid: %u\n",
+				     mem_regions);
+
+	for (i = 0; i < mem_regions; i++) {
+		regmap_type = i < mem_regions / 2 ? SIUL2_MSCR : SIUL2_IMCR;
+		j = i % mfd->num_siul2;
+		ipctl->regions[i].map = mfd->siul2[j].regmaps[regmap_type];
+		ipctl->regions[i].pin_range = &info->soc_data->mem_pin_ranges[i];
+	}
+
+	return 0;
+}
+
+static int s32_pinctrl_probe_dt(struct platform_device *pdev,
+				struct s32_pinctrl *ipctl)
+{
+	struct s32_pinctrl_soc_info *info = ipctl->info;
+	struct device_node *np = s32_get_np(ipctl);
+	u32 nfuncs = 0, i = 0;
+	int ret;
+
+	if (!np)
+		return -ENODEV;
+
+	for_each_child_of_node_scoped(np, child)
+		++nfuncs;
 	if (nfuncs <= 0)
 		return dev_err_probe(&pdev->dev, -EINVAL,
 				     "No functions defined\n");
@@ -912,7 +961,6 @@ static int s32_pinctrl_probe_dt(struct platform_device *pdev,
 	if (!info->groups)
 		return -ENOMEM;
 
-	i = 0;
 	for_each_child_of_node_scoped(np, child) {
 		ret = s32_pinctrl_parse_functions(child, info, i++);
 		if (ret)
@@ -969,12 +1017,28 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 	s32_pinctrl_desc->confops = &s32_pinconf_ops;
 	s32_pinctrl_desc->owner = THIS_MODULE;
 
+	ipctl->regions = devm_kcalloc(&pdev->dev, soc_data->mem_regions,
+				      sizeof(*ipctl->regions), GFP_KERNEL);
+	if (!ipctl->regions)
+		return -ENOMEM;
+
+	ipctl->legacy = soc_data->legacy;
+	if (soc_data->legacy)
+		ret = legacy_s32_pinctrl_regmap_init(pdev, ipctl);
+	else
+		ret = s32_pinctrl_mfd_regmap_init(pdev, ipctl);
+
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to init driver regmap!\n");
+
 	ret = s32_pinctrl_probe_dt(pdev, ipctl);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret,
 				     "Fail to probe dt properties\n");
 
-	ret = devm_pinctrl_register_and_init(&pdev->dev, s32_pinctrl_desc,
+	ret = devm_pinctrl_register_and_init(s32_get_dev(ipctl),
+					     s32_pinctrl_desc,
 					     ipctl, &ipctl->pctl);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret,
diff --git a/drivers/pinctrl/nxp/pinctrl-s32g2.c b/drivers/pinctrl/nxp/pinctrl-s32g2.c
index c49d28793b69..2d56ffb1a109 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32g2.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32g2.c
@@ -3,7 +3,7 @@
  * NXP S32G pinctrl driver
  *
  * Copyright 2015-2016 Freescale Semiconductor, Inc.
- * Copyright 2017-2018, 2020-2022 NXP
+ * Copyright 2017-2018, 2020-2022, 2024-2025 NXP
  * Copyright (C) 2022 SUSE LLC
  */
 
@@ -762,7 +762,7 @@ static const struct pinctrl_pin_desc s32_pinctrl_pads_siul2[] = {
 	S32_PINCTRL_PIN(S32G_IMCR_SIUL_EIRQ31),
 };
 
-static const struct s32_pin_range s32_pin_ranges_siul2[] = {
+static const struct s32_pin_range legacy_s32_pin_ranges_siul2[] = {
 	/* MSCR pin ID ranges */
 	S32_PIN_RANGE(0, 101),
 	S32_PIN_RANGE(112, 122),
@@ -773,27 +773,47 @@ static const struct s32_pin_range s32_pin_ranges_siul2[] = {
 	S32_PIN_RANGE(942, 1007),
 };
 
-static const struct s32_pinctrl_soc_data s32_pinctrl_data = {
+static const struct s32_pinctrl_soc_data legacy_s32_pinctrl_data = {
 	.pins = s32_pinctrl_pads_siul2,
 	.npins = ARRAY_SIZE(s32_pinctrl_pads_siul2),
-	.mem_pin_ranges = s32_pin_ranges_siul2,
-	.mem_regions = ARRAY_SIZE(s32_pin_ranges_siul2),
+	.mem_pin_ranges = legacy_s32_pin_ranges_siul2,
+	.mem_regions = ARRAY_SIZE(legacy_s32_pin_ranges_siul2),
+	.legacy = true,
 };
 
 static const struct of_device_id s32_pinctrl_of_match[] = {
 	{
 		.compatible = "nxp,s32g2-siul2-pinctrl",
-		.data = &s32_pinctrl_data,
+		.data = &legacy_s32_pinctrl_data,
 	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, s32_pinctrl_of_match);
 
+static const struct s32_pin_range s32_pin_ranges_siul2[] = {
+	/* MSCR pin ID ranges */
+	S32_PIN_RANGE(0, 101),
+	S32_PIN_RANGE(112, 190),
+	/* IMCR pin ID ranges */
+	S32_PIN_RANGE(512, 595),
+	S32_PIN_RANGE(631, 1007),
+};
+
+static const struct s32_pinctrl_soc_data s32_pinctrl_data = {
+	.pins = s32_pinctrl_pads_siul2,
+	.npins = ARRAY_SIZE(s32_pinctrl_pads_siul2),
+	.mem_pin_ranges = s32_pin_ranges_siul2,
+	.mem_regions = ARRAY_SIZE(s32_pin_ranges_siul2),
+	.legacy = false,
+};
+
 static int s32g_pinctrl_probe(struct platform_device *pdev)
 {
 	const struct s32_pinctrl_soc_data *soc_data;
 
 	soc_data = of_device_get_match_data(&pdev->dev);
+	if (!soc_data)
+		soc_data = &s32_pinctrl_data;
 
 	return s32_pinctrl_probe(pdev, soc_data);
 }
-- 
2.50.1


