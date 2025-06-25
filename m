Return-Path: <linux-gpio+bounces-22114-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35282AE750C
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 05:01:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 984F517A9AB
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 03:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D980978F2F;
	Wed, 25 Jun 2025 03:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="aO76Twib"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010005.outbound.protection.outlook.com [52.101.229.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B87C3074BF;
	Wed, 25 Jun 2025 03:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750820479; cv=fail; b=K7oyA1aU7tOpgj41ZZ5bQU9sjBSFTDubMoLt5DBndAi/qO2Nqrl2UGq0pH4rLT/lw1xrwsqaZ/GYrn0980hFsPIRBFuFWKclbWK8EhRy3Up/SmKAZeefg4IwMvwrr1HUqdA+T1r1Q+Vh7lYWLg0pytoBBMT6JJ/6GMivPszY8eI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750820479; c=relaxed/simple;
	bh=pXd3Sr3y80l0W6Nh14H41kL6p2bLOsNa2AGf3kLCNtw=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=YRPDilfBzTJvMNV8v1rmrce0+kGzvIZpn6mjx7k0zFAdD1uv9JtHvMT/tjzARZN0oR4E4cclJ4uarT3y6/h9iRaKXW0GQp/OrJM0I9sywwXovMgjRlDe5rvAKqICAfhBGOIkqllPMZMnRlvcvkWpldf2jSMSzoigmt2ghTdCYTQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=aO76Twib; arc=fail smtp.client-ip=52.101.229.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ib0mPQunAKy674GTjR//p9vZGeht3vVym3n0XsFZ2/+vJrOBTTP9d0Qo3W24mYFgMJr6467PUmhrz6AQ/hWXcqb683I9I+JoowTDl57KgsUyVY9A9REa3ushI0xZBI9QtPjbOew9p/yupduYNDywwPYByIR+Bj0Gbj2yS2mali1YNAolY7XdPaKV3hUlNiaXcM0EqelDuN4Nw+W8abtrOSq+PrVp7o1pZOBoxRkbNcmySMTtBDwfvY4pk8z5c+6Ea1Xx6obKcq6SMrh6Wnaygi9cL6b46qYWO8JZT5MsscH/ILwQ2TBu7l+zkOchpOKZF4HpGeJrBNcZQAjBr8GQaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pXd3Sr3y80l0W6Nh14H41kL6p2bLOsNa2AGf3kLCNtw=;
 b=sU8kxSoHQyEfw+ZHaossgGWiqMQjJuJESBiA8WWn1WLctVeonkcgxb42l/1DGeJ9VPxlsXLsNK3NribWGEgT/hTowWYp/AAp3kgavS1DISojkcN8kacqa5HeONkGy7nqIv2bm6Aq0nS2MQMmmqSE1lNhIFfuZWPFATBvNT1K0WMtEzY4CEJ/UnSeCqCSp/pUh3J3pzJgH4/+RM/sK2VzQGpHcMG2S2DWE7O4KAleIasJYVVOA76K1NTJVWJtgO8wwcCbVLh6/yDhDE6xI+3EpBoOZ2SIVAk96dLqC16WC7DQ2Q2VttRIWg35fj8ne41sPsrBfc+CJ7FJT/POPZILUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXd3Sr3y80l0W6Nh14H41kL6p2bLOsNa2AGf3kLCNtw=;
 b=aO76TwibN/exL1I2VlRhgx0tl4yt5ojbok1fFq0ut9fD4YmyYo0QgL7fdT4MzYxzTpWr4mNkRpEd9lqil1HZlZR79odzt+/30XBY/r6l+Zlfu9e1PRq3BG/yNxi/ESTDCx8AsjAmVryGlsN2fY7a21P/xdP57f7kVguQ6nGNs3c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8285.jpnprd01.prod.outlook.com
 (2603:1096:604:1a0::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 03:01:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 03:01:10 +0000
Message-ID: <875xgk4j9l.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 0/2] pinctrl: renesas: tidyup Kconfig
In-Reply-To: <87ecv9ragd.wl-kuninori.morimoto.gx@renesas.com>
References: <87ecv9ragd.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 25 Jun 2025 03:01:10 +0000
X-ClientProxiedBy: TYCP286CA0074.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8285:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ae4170d-46f8-43f8-e9a3-08ddb39489c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C8L+En05Bn+YuRKZWlQ/e6Oi8skyk60pvjmrCHWZ/wfGtaqcY/atNVPfLRbM?=
 =?us-ascii?Q?0clXIk1YK9ypZoqwpbWN/+uuHjBiYnI+yoI+XBMnQAdcm2zIrJ56NY+34WVh?=
 =?us-ascii?Q?obCZ7TrsHbGi+6cxn1FsjUyie+zJt8m6ebWtTEpVoCrC38vKqMbKkTllwrqe?=
 =?us-ascii?Q?O1kDJSItvMzN4o5qQr0l2zysMZORE5TImQKHnkV6NfyKNpFUiccFaGLlGb8z?=
 =?us-ascii?Q?DRVbUTb7ze6IFOpMJkef2YOaYKyzCrxWLOSPd+Vqx169zq8k3Fnls82gbk3D?=
 =?us-ascii?Q?u7FdIZ+xqfMc1whYs0RwSk62VyGZ5jWutUJyHZpIFf6XM970WR7xIFxBadL7?=
 =?us-ascii?Q?RQGmAyTVs3ZgZlzhLC8xGZLagTwLmN4ZWUQzDne3uKEM8s0ErE/qo9KODm+U?=
 =?us-ascii?Q?N/ACmTgsmCwl/zOHf4XGEQSov9DgbyF91N3II4D3SqtOcuOVsdZ/hgeW4WHt?=
 =?us-ascii?Q?5XeublHOxjxiMgSXhfWZ7RTGE6Q6CFcpVB5FzDK9+qMvT7d1H5FyUbLUOigo?=
 =?us-ascii?Q?6q3AH5x+Tg8I/Eb+N/B4iBwI6A0vWFckm/Fr//y7fAxms8jBbOLdYjGTgghV?=
 =?us-ascii?Q?K3RPluIR8ZxO+JQf7jUQTWwg4CFleZYHPm3jW8dMLPmX5pMdP65j5IoUKSZl?=
 =?us-ascii?Q?jQC9CnK3NJwZuRw8OzIBOBzo67gfJDsslQHMUZ17kv2jiPKPS/gmfyN3CNHM?=
 =?us-ascii?Q?ucaYENI0AnMx5EU7Mvt7dcKTPOOCUaD5mnE53aiZCk4c4CrcwzcgywZLgzlL?=
 =?us-ascii?Q?/RTEwmilYjBIGDDzgNvHI04eYx6anBHzoQldRBZyZ1iNR5faWrco+o6+6zJm?=
 =?us-ascii?Q?Ksy3Qnb/3g8W5+v46RxR80iHi+ERCr10WIZIGsGo5ylPidDMGU+lS4BvMKI9?=
 =?us-ascii?Q?+44Hsb1R6uKnLvAiuljMn8/LJy51kNFc8BI7aQb2gBqK0hQJX1Lgdsyg7yR0?=
 =?us-ascii?Q?CI9bR7F8Lel/r26Y6Uht7tLpJjzGrmkBjypPfYIHoZpIEu9H2LRnlKTcUiUV?=
 =?us-ascii?Q?TgGBTZXwvk+wXRFI7SKqm5iYoTG9SJc9k2xlp9nbbBHy0prD+72wlirAQxxx?=
 =?us-ascii?Q?RTXKs5CLgZIS/uKQxwYhLt9pPiGNtyqYYHWc6gzomiifCnWSuP1JSBLcjlfn?=
 =?us-ascii?Q?JJzOiO0vO0r2M6KlSni4wlRB+cuGOIuYymfjNuf1qDPFy3R0izL5kIHsIkdi?=
 =?us-ascii?Q?SpVNb54FY3+ryM0QVyyCsz6EO3vEqgahCNV0qApHUK1zOfMFxZAWxo3t3FPO?=
 =?us-ascii?Q?d0gpIroL34UFCXuGsESvMee/ytcwgchfU/7NMs+VHSH7fIf5lroJs7wxoRzR?=
 =?us-ascii?Q?DihsReyvsZ9j2pk6mvC86OqhARLr8KJPtRw5igtsn65rZCgP5VPBPLgZtJYJ?=
 =?us-ascii?Q?pHAvYpqFnwe52gPuxY2FDvsxPVSOcQ3cxKgtJv/Pp9AzemfVjpSPdTCJ9KkO?=
 =?us-ascii?Q?FNe7EIB8SLdK6zAP/aHGBfYE0bTH8xzOB5R5qCQPGxa7VDuu5OvuEbKsPwCv?=
 =?us-ascii?Q?FFxVcK/HC61hj7I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gomOyHRULRv5Nw3Ga6645H9C1T+UhRNQ7reK4xAjxFQl6TeJnMRZHLxvraFA?=
 =?us-ascii?Q?VNBTxaRTEEHPsy/ee3y9mPMMvwRiA+IEFyd/dqrO9R6v6xWL3ztZqJtTia1P?=
 =?us-ascii?Q?r88dHaZXWLn7hg3dSZwps7FcvKaDH7ygYte/ud2Spx3CWmsYiV80/JZuSMzc?=
 =?us-ascii?Q?BlYeE1VkOEStZcEd+MnbwGtj1gnkyHhyPFiuK5s4953LHoIfLQYaSBbKTK1L?=
 =?us-ascii?Q?cnZ9T9igw1edNo+vuoLJfHDhFP+5gi1Wbmp/SxSbrJ6slip0h5loO1CIIgEJ?=
 =?us-ascii?Q?8aT+JvUYuqmOExFIX2MwkFReWLKVzPHXpLxusfYNBz1DFmkMWFWTSNlwGi0B?=
 =?us-ascii?Q?L43Hpts646LzY3GU3G4xYBGDKLEVYveoobqPydmxK/iqDrweo8Qjnb+svsUh?=
 =?us-ascii?Q?rs4DMQB5yPfy0MlgZZzl+y0obCQz/Je20tTzyJPYvHKkesftoC2NMYtJU+4S?=
 =?us-ascii?Q?3xy7U3ArNLs4mDM34DtXtTdpeMBwh+VGeqwHAs3AlE677ikBG69qdE0aM7Nf?=
 =?us-ascii?Q?9EHwxLibfCLKlCnQQTqdERSwHzHHHUr6DKbw+DwDTP24sS3SLqDMo/jmKmnj?=
 =?us-ascii?Q?Bks1l8uplrNO4NsJvvrTWX31jZxHpTFQ6ruTFwPPO8Q+lAYcj4NrJiRE/0Be?=
 =?us-ascii?Q?EInGEXIDn9kJS9hxOaN0fgEuiJEUTIn+cnfQs5Unfa41vIDHCODAtq5y1YpX?=
 =?us-ascii?Q?I4orAiO4vmWAAW7wAAIgtk77kJ+wEHyokjltdPpOihyfIinC9IFVs9Hx+3Hb?=
 =?us-ascii?Q?7zmuvckMDdgNH0QCyPaL3HmSY66ma5dtjJia/KoMeHESbZT8jAHT0qejXud6?=
 =?us-ascii?Q?F45iChQ89cXUpqYBFs3wmmUGyvdsZIyTvQJVuCYBX3SrKIFIdcrzZYDOP+zp?=
 =?us-ascii?Q?uyn6jV4F5UVCCrBozKKJbi8oI7hL+SeZb6qTWsc5fM0RqX07J0hphypNlg24?=
 =?us-ascii?Q?B9pfaal535e3xLlMA4nb6lGpfn28zGUrC8aywvPX0AVLt+RSweSdj1CC4wOQ?=
 =?us-ascii?Q?8hs3NM5pXm1ctBykorme/ZnBrkjuvO0ZF5ngIf2PPZEz4jYM2EgQpBWIzqU9?=
 =?us-ascii?Q?vOqnXgaBgzskDrWIYQDmo9YmDQqtDBxhvjeoQfW49q5uPD+eDEeKm0KZ0nas?=
 =?us-ascii?Q?8qLjcZYbG5udz2LzFu9sDTvIqNWemf+Fx76hw3fX2YL7jRP/6PMgr3RF/av0?=
 =?us-ascii?Q?3BTnukS8rqn8WGWZIkyemDEqFn06sWCPR3etyunE7p7Gi+gziNjmHRzWutja?=
 =?us-ascii?Q?jc9O8HZsAnBAs5DnzP0GwK8H8nn3qeWgYjwE9QoD39LOqHmVzcQl7NJpMGdX?=
 =?us-ascii?Q?fnMbhPNzhvHaoJQPXv/TzIWbYOS+v3r4w9gluvsw9yJ504DbuEKd/IWaGHdq?=
 =?us-ascii?Q?OiXopzXpgqmriT+1BZGDWA7+k1UiDaoNq7r4I6veVd+WpPtd5eNRnF9OeGfO?=
 =?us-ascii?Q?SfEB7tRf8eJ4gFGWqSAcisaGTTEexY1p7FdUsUHJJuay3o/Wphx0I/ajObjS?=
 =?us-ascii?Q?hO0B2RGq7mWCaje1C3bSGgeNjD5u24Ueck8iAY0BkFYGky6MtPVpe7hdQRgy?=
 =?us-ascii?Q?dL2bWGseQIUf2UfpN/Jtykn0wbbKGKydieWWASXzeHBVy6j/WxquQvCrPevu?=
 =?us-ascii?Q?vXbH9NBxUfb3yqLuA7rJDyE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae4170d-46f8-43f8-e9a3-08ddb39489c2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 03:01:10.5621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XC/UVIgmxywKG0Lwv399pZOQRlBhkft7Ci2FmeN7M2NHPzXPjJxFkZ5IsbCRHdSDkVJvotv4k8pXkdHlh5c7dO30kyuboOttnhkPHmXlrgDldVkcPqmic1u+Fbte7JKf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8285


Hi Geert

> Current Renesas pincontrol Kconfig is randomly sorted.
> And, the menu prompt is also ramdom.
> This patches tidyup these.

Ah... this is menu alphabetical order, instead of SYMBOL...
OK, please drop this patches.

Thank you for your help !!

Best regards
---
Kuninori Morimoto

