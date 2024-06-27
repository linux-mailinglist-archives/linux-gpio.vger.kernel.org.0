Return-Path: <linux-gpio+bounces-7750-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDCB91A765
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 15:10:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 010661F22169
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 13:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5019319066B;
	Thu, 27 Jun 2024 13:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HlJnz3dK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2057.outbound.protection.outlook.com [40.107.21.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED18D18FDCC;
	Thu, 27 Jun 2024 13:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719493712; cv=fail; b=FYgvR1h/2qSQQC66i5hA6QM3cpZOJUiPHUpWh5SIuh9e9Q5n1ZE9DJOZe09ida0r2Vdsor6kJ3VFpHhqxcjaozQVd+4ZJ5nUK9knUOXSnaGVglC3VZT/6f2purmGvteRlivGMlaUIlVpcJUMfbpfJSqE4aZQPlDftxUeu6lG1G8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719493712; c=relaxed/simple;
	bh=X8KKYsRsGINum6FiNFl3xk6UPwIvGxda52ug+prNIS8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=QcphAGtbFxaObfdSiDQLf8zs/rhwaGm9Fu/W0MTGrsubwWKoOEjZPbWo8Y07SjQgp9Wif6D6suAiQBFWd00+ACta+D+SKOAvcIbXPEHn/dBfwSzNd416VKWPoELbafYnfaoLlDL8x6PZd/cdcD9EC8m805dfkOndei6UiT52d9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HlJnz3dK; arc=fail smtp.client-ip=40.107.21.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F4Z6+dZPqPnZ12J+GjH4V+deqCWXGtvyBZtMRw9MmBKQHPk4wKxgsEZPiFtTu9Cp5zkk8sPbftI78C9qA+zQW8fgN5wK41YD+qqv+KRhvjQxq7ULKxbBMOrjNm/JpZf1ERvfxUfg/2RnnJnnUGAROYUQimNugxRmsrwGCNToSxhAanUKM/wjjQjr7B4+jmSRL/UmPWuiFfCmPQJWybvFMi+hknmCLbP/rAeX98sG07fh3t5L8WBLwX6CArJuAm7YimL2cesr2th6UadbiB2gyTSpuoRTXBCp9YLJiNo06frSG3SYJ/ZBMTinKVViAbWW9ddupgAcJfcwTEyje58a+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFzy44jWnmNVh1o142jDdDzh8UKx4oJi2/F3B+0W3Qs=;
 b=FAQmQbpMPO5PJYe8wLM7jp8v22Fvmr2z0/BxuchjmX9q/RqDOkLQA0ddSpnbmwKrUVyfkbhmgF0peXYEJOP7X8hTK35kKWGArs8cxoaL9ewQtbjOETt1vDsGZArot0Qgbp3ViOwhUilnfDakWH9FXdiTEJzlDAx50yPncnihiU4diG5qNSOlM7yn+ukPcV8MEVdp7jFB877kwXHI7K5bjYEwAnF91Q8k5IqnVzVSbum6nUJUzNYRyilwLiIWMoCJjUxxvhvnU3dszxz1AsN1PgQSRYGHEc4AhwAyq9awviJp7Jg2b/+IpWgiVKmIyI7N00dTcsZo2VAid0GqqXIdcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFzy44jWnmNVh1o142jDdDzh8UKx4oJi2/F3B+0W3Qs=;
 b=HlJnz3dKEGQ4zhuQS0LiyQRvRSO2gCjSxaLz9mKc+I1yp7MHsEW9YEyu6dZ0ZcMSzenqpCrAN0A0FNy9APJOI6Bw14xcq1+hRTO/1xCumxrJqZPPMYWnaw/sMldD8Oec/c/3ygAP3Ju3VTR2cTAzN+t/3A1G81QxZet43iVPsWU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com (2603:10a6:20b:9e::16)
 by PA4PR04MB7549.eurprd04.prod.outlook.com (2603:10a6:102:e0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 13:08:26 +0000
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256]) by AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 13:08:26 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: linus.walleij@linaro.org
Cc: dan.carpenter@linaro.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	aisheng.dong@nxp.com,
	festevam@gmail.com,
	shawnguo@kernel.org,
	kernel@pengutronix.de,
	u.kleine-koenig@pengutronix.de,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V3 0/3] pinctrl: use scope based of_node_put
Date: Thu, 27 Jun 2024 21:17:18 +0800
Message-Id: <20240627131721.678727-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0050.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::21) To AM6PR04MB5941.eurprd04.prod.outlook.com
 (2603:10a6:20b:9e::16)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB5941:EE_|PA4PR04MB7549:EE_
X-MS-Office365-Filtering-Correlation-Id: 73b1eeec-d956-4d1c-3337-08dc96aa3b28
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YlZ4vX2G6Wev7zKILk+/CKPSkfmSnhB9q7SPv4ZicqtMZfjiYKbASavurHL1?=
 =?us-ascii?Q?0+JTAi7nhG46PxGBG0/laRjzvw6uId3O+Hcrh3LZ86/EOGqF9RzOID9FnTmj?=
 =?us-ascii?Q?Zd7wy7LlPOG06hXi29mheRWAoGuSmBONUEseIhzoqijKo6ZhtOGQM5UWAkH+?=
 =?us-ascii?Q?bKV0eF3YYvFZHQ/GJsibNsHR3APhEOibBb2TSPV2UnLK1WwD2/1QxOTNwNMv?=
 =?us-ascii?Q?jRi+YU++vful4MdfTNh/eLIIzMzLbdJ8S2dmfk3l6FQFfU5OypYxIdjDih7x?=
 =?us-ascii?Q?4mYV9AwPAMTiP1IrjLKiMbTlM/nftRMpyRwkLWCmGkReC6d/6Hi16O8oo21u?=
 =?us-ascii?Q?AE5hboiLWQIsdGnnBNESKMp49wl4q+DEx8d363GrY37+U54P7B07DiemKr3c?=
 =?us-ascii?Q?leWQV/uI8voNNxzg8Mp30LhuiCVjAY3d0vDpf9Tq4Uz+risNxrUiuBPJz5hO?=
 =?us-ascii?Q?wWRD2SQ/ZD/ryNCzJ+194rojZnSYcbXIek6BECCxzPnxwtWWvBtmrscS4wmg?=
 =?us-ascii?Q?PRM5KQonqg9OBgpPYprHeuR+WViNrgQkjDbueqS2WbLgqXS+9fbPVWfklCu4?=
 =?us-ascii?Q?ILppuQSRSOd/iUoBCE1nnP0isZtqcxjsVm+nXt3L/Lqq/qfsQRp7HIoMxMhe?=
 =?us-ascii?Q?TbKhL70nXkj1LGUileQ9nwVLa1r7+H0ecC7wRC7+YP2d2zUIEHk28M0ik8FX?=
 =?us-ascii?Q?M1X7smr1Mfj5zraFFcTybOEOQ+p/hE8D4bkCLKQWM7G6WjZWFlnduHZRVGi4?=
 =?us-ascii?Q?3MNYgCvJsSPOitkqieqp1Kb1Lv/AqRtcZZvXPaGSINXnjS9hQ7VfzAuxURbm?=
 =?us-ascii?Q?OQ8m/6aEhf7M4jRpcp62iRC2EQjqpFpqZYfxNv3xuiUdOSmmxmEdDNZQLu5S?=
 =?us-ascii?Q?szNdTHhReFVr8fpuztjhtaISBPYJc355yqsEYAdlaVR04netStmH4tXcYrl7?=
 =?us-ascii?Q?CcjquZ0mC6JFNGcSvOzkEnq8YZMMa0iiYjP6qKanOtBLGAauRTN2m0LSlM9N?=
 =?us-ascii?Q?l39Nzdm4425T8W84W3XMrwpJshdcRKQHHn6qiX9QUW2/1a1JmwZwx3U+1Jew?=
 =?us-ascii?Q?tUK5mOj25Z5vdbUCZexK745wnEGfKCvMYbbxWAJStTCO2GJ3yb8GCDZkg+pV?=
 =?us-ascii?Q?VQNctTqKTLmJuKC8Ty7afKVrMik0WoQE3Q0mEoHNeb45mr6ceiFasY87tiL3?=
 =?us-ascii?Q?3HeeAWMKzFXTonTkLmH1vw1jeldwR6hYrF4cKHowir5CPtTx9UbpdHoOBb+b?=
 =?us-ascii?Q?hU63ZAwni/vcvX7ApkZoD2wDQUlq5n93VV88MJPM7UQDieQi5R/d8F7/UvbU?=
 =?us-ascii?Q?x+gY+uAygte09SyAJXejRxmAMmch/ZVaVdijt86CFDaNMA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5941.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1QcwBTYEuPoRCsaELLRbkTpr7g4wUdLAqTS8nVgzEIoOtxx2SZbgaRrhoUUZ?=
 =?us-ascii?Q?56VItTUpc6KISacunQ8tejUHVTicqYDi2IIN+CzERYyHsuS/Wy6+deWdp6FM?=
 =?us-ascii?Q?f0bPxCWnkX61ga8IaksNrHH3P1U9mJWO7B8/DkYbpA5FSF7EgAZhUhKNj3XI?=
 =?us-ascii?Q?VwUFUELxwlfA4O77uQHiiEdr60M+ozVjvbyzchp669VKLX97KYExxB6OuEW9?=
 =?us-ascii?Q?EJV11QZJe0NgOMs19evf1SdEFm8zptBS3NLS4/NlHejyNFpcpiBj4f7Ppo0I?=
 =?us-ascii?Q?VOjvETQ0A9ekYGbobbXdztedmLmFbVslTFYmE6VHfTwGzZPaobae/uFFiT/K?=
 =?us-ascii?Q?8sCIvEW0T+h+89Qa0EhRWjtz/gPICe86Q/8g88q9L114pjfu2oKqaxY6OP+6?=
 =?us-ascii?Q?Z2N5cj7gjOmLvECx8BAyetaVoTB7+JcdnFIxuBlZFVcl0OdUNC9ZN47hSFtS?=
 =?us-ascii?Q?JkrTCtXps23v/4dQDYjHy9jMDGEmBA/fZWZ9pA6U97SG6pfKoz1K2+85a0DF?=
 =?us-ascii?Q?7uf86QmlBGdzgBbh8zWjwANm4i5letdpQfQZQ6J+rrxxJU7/Fn7cbUeXmZ+m?=
 =?us-ascii?Q?tg/vEgFvB63Il6SYzn2gI5ky4CKtB3PYGKyX4dUCnztySjoCCP5pUkeqTrA3?=
 =?us-ascii?Q?68Xh1fXWH5Rn6LhY16AuyYJHnafGDqI6A94bB4zhzPzgF83+dhO35mriCstx?=
 =?us-ascii?Q?qXix7p9rZ91PKcf8dZiBFTMZ2HZ/Ut+OqHydGHETGjFICSgVeTseNInPCFWC?=
 =?us-ascii?Q?lVRPRVX2Pn2csAtpEjqRb6S8Bh6MkDOhbFJUhuu2f1TbYkw1KEClIkW4c47m?=
 =?us-ascii?Q?b3T+t7TKwJYifEgQ35TSaDSgTp1KPnWn4b3tj6EPLMBos5PTbS8vsXBMJo27?=
 =?us-ascii?Q?wHuaJxxvvZx19p8vXtiI8olQZLsfCk/a2blg82K6D2Ucw3QnxoPRYoB+tYre?=
 =?us-ascii?Q?yrlXXQ3TL/5+NuAyatsA/IPceUHFx+v+ec6+N6RMy/JIhfalZVU4nxsAkBjV?=
 =?us-ascii?Q?ziuMNd8Sq6n1DNc8gsTgyy04C1Zl2Rw2U06QnttHWO5nYQIlnCXV8+2FpQN1?=
 =?us-ascii?Q?ZYGugzwo/I6tytjJvLN2Qr0eb4HkU5YWWOJSDwHYj6jnm6p2uIm7jgwztBII?=
 =?us-ascii?Q?2I1pmPN29l27h7KlyN6x3oNNdGPFRg6h68fxgjommvg+Jj+0f8swi9MRJbJe?=
 =?us-ascii?Q?nUoel8CndlMYnsXb+tagdNpdc99uaDjz3omvguLlxPfbWOfKk0/0VZdLg7BP?=
 =?us-ascii?Q?V6PCRYVfOnxMij8gOMw7ni3a0UyDIZJh3hF01rz9t3qdvBjnZ1n5PSF0kU48?=
 =?us-ascii?Q?fvngqA5y5yS1p2Izy6Z9ck9xMPpCKaszIt55sVeDzG+rpcKHBH0bZjA1/uvk?=
 =?us-ascii?Q?QiMGrRlACuxZbXjgrk9hLhUzixaqFi/6B4+WmlD42LiWmHOKhG16r4y/l08d?=
 =?us-ascii?Q?b0D3obe1p73w4qqFbNWXqekkqPOOA4yk9T5Kr3DKrFg1hC2S4n89EIdAGsK0?=
 =?us-ascii?Q?l6X5SAZ4soHtZJgm1xhXG4ZPT1q9hDmmy2GlCpL1bmPkzb+oGjnRN8oUHIKQ?=
 =?us-ascii?Q?EmWTblQ6YHLf4c0XrIRqS0ZdWfqcLqDu5w2ZhQvH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73b1eeec-d956-4d1c-3337-08dc96aa3b28
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5941.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 13:08:26.4739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tUTsQ/xa1UHyFnWqadn//igjKNkwRZzBFK+7aTVxpa3ZW5KbQLaw8hCrjcRp02IWMZsRM/zTOM5FIwzslT2Udg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7549

From: Peng Fan <peng.fan@nxp.com>

This is to send the non-applied ones of [1] after rebase, no more changes

[1] https://lore.kernel.org/all/20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com/

Peng Fan (3):
  pinctrl: ti: iodelay: Use scope based of_node_put() cleanups
  pinctrl: equilibrium: Use scope based of_node_put() cleanups
  pinctrl: freescale: Use scope based of_node_put() cleanups

 drivers/pinctrl/freescale/pinctrl-imx.c       | 25 +++--------
 drivers/pinctrl/freescale/pinctrl-imx1-core.c | 16 +++----
 drivers/pinctrl/freescale/pinctrl-mxs.c       | 14 ++----
 drivers/pinctrl/pinctrl-equilibrium.c         | 21 +++------
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c       | 43 +++++++------------
 5 files changed, 36 insertions(+), 83 deletions(-)

-- 
2.37.1


