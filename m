Return-Path: <linux-gpio+bounces-17889-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0BBA6D344
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 04:14:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64C64188C996
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 03:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4547115CD78;
	Mon, 24 Mar 2025 03:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="r2qW74s4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011046.outbound.protection.outlook.com [52.101.70.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C9313B2A9;
	Mon, 24 Mar 2025 03:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742786042; cv=fail; b=r+XVL8wZ6YLmu/gD+mpBUGBMXlvuXQkwQZJ7zlAiX/j/wsxCJqIkGMy7db1iKbtO3r4xUxcUqisrqjehcmO+tq7/WRDYc1TD29ujpLWZZ2x6enJB7wbRdwcIlmQDzebAfqtq/aR4Qb8zc0fru6YSy7Vj2r2Tibv2OR/Qk+yGzM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742786042; c=relaxed/simple;
	bh=O8EqO1cID5pLuc5YpYgjDVfS5JEyxQBJ74LIkLDBA8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=itnRcixYeFMXrjkVziAclzKIeH7jv2s+Ow1KDDqt7ptIBdJvbBi54gbPVbOru1KWtnmPQxUtSWYJzmvdPepbIRvuTJpoADaMGUCpeZTL6gpW2zGg+LfufNIZEyHzdeQckgV8DITd4Fz5Edgx2yobqWFDOj2hZt4BT030yfAYKWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=r2qW74s4; arc=fail smtp.client-ip=52.101.70.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s4h0l+5hBdgWpTDlfIafcZ1guO7SL3JZlCxKv91+He6xPWOMNkbQUoyYH8+PK7NGVXe3rSjI8UPigqY5RJ/lELvl7SaQLn6H/5PI6esgd21t2KpyKRDlpWzKj8/3pv2yQXKbkwSTBbu5/SMjnBj8Hk2ToOFb2xlf6JNb7Krx78aLef1uwBLTdV5Pw7aLxh6fg+2gQdvPvUWA+2zkMRDLYxT4lRRcntNUjEztZrQiXNjiDK3ydedVpB4qZkVG8cHvMDghGufEv18j4pAmZGMVLk2/1DEIDHylsVUFJ86jgjkkqvs2rOmsnH8gAZSkhV7ai0VMlKo9gq6YeBlAGaJycQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UKSP6l58XV+0QW62ZYY7IbfO/ZA8bC/QoDp89Txj/uI=;
 b=aWuM0+xsplzapeR468JV79fDsYr7bxgJNh9vVSduaGkLYkKGKwdsN/4U66+bsCh+T2L9bsMz0SnxCp1i3y/qUk777mNR+4XVJ9J69ggOHz5GX9at8SC16XXpqI3FAM3PWedl7m2uXFiZRS55jklMK2+fpqUVoaQNW3kpOlwc3UhnAZuC4V/WAkminOuDQ+5vAo+F4dm1k6uLy2zqWqTkTe00EHpIxdk2ZDJChDlIxnuaZndcBvjYfszBILH8rleN3nuzT3DB36hSbdMMgy2T5GLyVuXl1d1h7Lm2aLGS4wsaLC2H2bK8531xve2oZb4OXOq8g1oA+TZ4ZVHpl8CiDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKSP6l58XV+0QW62ZYY7IbfO/ZA8bC/QoDp89Txj/uI=;
 b=r2qW74s4DSooSsi4ZBtohz8HODWWuF1u4QauSxc3nYqGu85iRwfNfrrH4RRC+BXqYdsCVXT47EthaIEuJ9PGH4y4w4j+Nl3j8uSDpHpL09HNZ+rSC7qYt3Od4LCSMP2b2/LaqGYqOYwCNYYTOYQmtsedPxpfG9wfGtNW/Y95U1YBkc3Yd6lz118IShaDQ8ecklOgE49vNj9WqbOExmyN3iSeBvzmETjPmdase2FFn1C8i1IVnJgcSo7bW+k5eyQ2uIoeLrhkfQ+B5Hen7ya/j0ms330jB8p3X89GvuzPqBqyf4D7p5Mx7WxJTempcccU1W2fIZdnYUzPEfCgB282TA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8865.eurprd04.prod.outlook.com (2603:10a6:20b:42c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 03:13:56 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 03:13:55 +0000
Date: Mon, 24 Mar 2025 12:21:52 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Peng Fan <peng.fan@nxp.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"brgl@bgdev.pl" <brgl@bgdev.pl>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH] regulator: s5m8767: Convert to GPIO descriptors
Message-ID: <20250324033038.GA9886@nxa18884-linux>
References: <20250318052709.1731747-1-peng.fan@oss.nxp.com>
 <Z9lJETLh2y27934q@black.fi.intel.com>
 <PAXPR04MB8459A44864B9213E8265137188DE2@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <e3abe8cc-357c-471f-b489-e1a8625933e0@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3abe8cc-357c-471f-b489-e1a8625933e0@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR02CA0055.apcprd02.prod.outlook.com
 (2603:1096:4:54::19) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8865:EE_
X-MS-Office365-Filtering-Correlation-Id: f9e5a561-332b-4b03-ffc1-08dd6a81e968
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mJi2G2vp1xPJE6lll3NiSseUMVD8qKqu7muB8KQDdTKQRD1OdzfiPXBohpUk?=
 =?us-ascii?Q?lUGWHmF8Gq/tyHkTiVvuxoVbM0a0zi+nHpg+eD9iT6pY7egY/9NVi9DKHkZh?=
 =?us-ascii?Q?rLZgIspVCNR3yX/KD9kODa6Aoc9vOG1RnccXoMfxI8uwRtMWEh+hEJSF/c0z?=
 =?us-ascii?Q?rcL2+88jqpsUKEGdlqOlRkdfx5FJ8N/UyoEgeegfcHKEuDH+Kjm9u3EwzHGi?=
 =?us-ascii?Q?FeSADPOPGW5uqXx6i6j4/I20Vpo/XXHVwmx6DHpmBGFMk4Z5MAhT4AXW4k49?=
 =?us-ascii?Q?y9UJ3iDOs2GbPgxSojkS98vmkiKln05Z1wV51hEWYoC1O9oCa/71pP5V+Ib2?=
 =?us-ascii?Q?hgBuVq+0f9fb8OwXVvquAWIfEEabacwz7NnSHkvZZ2D/3Umxeob9lOUCcRn3?=
 =?us-ascii?Q?140na42h8XNqNI6roWhvMuANKNNEYEGG2LwcyiM0X+47DxQNUsusC2WprM8b?=
 =?us-ascii?Q?zijdPl83QBMdCo+WnhwDjWdRy55LXFvwvsLfEKgT89ApYP49qcwppE7O2dV4?=
 =?us-ascii?Q?L6bPEb06lrZy7r1UF/QYUYNZJRKkf1BruW69Hc8S8MhbJ4XIbU2VLQOSzZo5?=
 =?us-ascii?Q?1X0rLL2xFPIkiKDtYOBboCoZ7+BvTMqkRgfrJ3Mm1xmrbkksndlWwkzhHRwo?=
 =?us-ascii?Q?WyGQN2UT7XgvubDF3BigKytgfx/S+bFkw1y48TilvHT4mG7w3Nz1pjOfLe5T?=
 =?us-ascii?Q?p3domVkQUiY3xRSghOSnNqOcP1KO7r4YYpktQAM7exS2J51HpCUM0WN/hVf+?=
 =?us-ascii?Q?yMATZmuPe+qkSPv+WrK2SWFq9cYZwX8ab57TICIAqKb02/2Ttjl47j2VzvEs?=
 =?us-ascii?Q?PkAnn6df4FZP3Z4avMqL5Aiz6bJdtwi4VIu5cZ2/2DmH0VSNgy1rnjC3+sE2?=
 =?us-ascii?Q?d+bfgK5rnmIIlwDPTl4hXROxQBJHMgWfD99duf59bNpKTBEckr4s9pLZmvHb?=
 =?us-ascii?Q?YijnoFBOkVTnAfNLqBDK/LoFwM/K3OTKAqJlt6VgMNXThfzz6nrZ7lf0t9kP?=
 =?us-ascii?Q?s9R4bS2E3Ii9FIv5IZkR0pCAloOhQfLJ2zN0byfY/JcE6bTOu3FxX3W6NLnj?=
 =?us-ascii?Q?uCkZF7FEv/y4chBl++NhLHUPmTEhujZ5daxeNiRdqdUaw5qSTlHg1OY1nBZa?=
 =?us-ascii?Q?WkE2Znve993QjeWVRlrp/YRmm1gSea/MSFgNyeR0CA0/vTg+bAoaNAjEDAp/?=
 =?us-ascii?Q?+zUt0ZV0uyWFl+h20ekPl2JNx8UEU7TTtEGFOZRUM2CLIZLnQZm8DDvQ3IB1?=
 =?us-ascii?Q?rP5cDpu1B82Y15dzDn71DMati7lceqW+412usMaDFTw5u2qEXchqkbkN+m7F?=
 =?us-ascii?Q?8sym46+ut0L/Y53n28pI31ggyeenYx85YAA3KjAXjzHiciSTiwMFOYBCajtc?=
 =?us-ascii?Q?G7Vle8fnAX79EyUhdmgzAUZMuE+62i7dRnLJZKv7vF4usz/d0AAJAhcYI5Pz?=
 =?us-ascii?Q?wKBvih2yTczy5L6rluNhTZ6ebxqadeqp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xX3MNzbCRcwmURZMpr627mhT0G3IO52Em/tNqhM/7z4TWH+y87K2ebcoKArT?=
 =?us-ascii?Q?lVWbjXP/3e7r6AH3rt6xDqND+7RPFqQSi9+PzjEmub140h16qC9iqUvY91/f?=
 =?us-ascii?Q?o4y11V9uRvAR85ruTk/WWPEwz4DW7TnOk/PQpWFmzApowM5XFnU/YNbbSAzc?=
 =?us-ascii?Q?Ux6UABX3A8YZOFP+2/fvO/kvYSpluXSaLk6IJfzMb8tT9ytq3conHwCNBDPj?=
 =?us-ascii?Q?oZluSnOrjiKAdExIyRIYNUsWJq83+VxgB8UB5zVK4aw2znzCLSQqFVASV4GT?=
 =?us-ascii?Q?a0C3sxXUPqYwMqeBLH5eYaFAseX+pgRaIttzqzfq01+tFxMozToel3RbTrG1?=
 =?us-ascii?Q?RnGsUD+pC2VWogPpx9eQdGLwJBgE2XqkHGfoD4o3Um707uq5wk3LU9xdO8+K?=
 =?us-ascii?Q?ZF15cNW1+G8zrkIbMod76oGRMgUTg1d4jdiqr2j1gY3BxHXBKN5RW+4ygDUq?=
 =?us-ascii?Q?pjSEc4hzS5xN6v5VP48geVPkBbVEEFN9M5eR9K4gXfy5E6N+mj+ny/neIRRV?=
 =?us-ascii?Q?0iuEAFXIaiP6mTPsnDYYcIZfbBlfKSTm3x8xiWnlh4yf9X6iAuSZIEG0EZoL?=
 =?us-ascii?Q?6wEMtUogadb5lUxrDVh1fyP7Z7UUxOmDZlGsHo1qj0RgIyBVfKxnOlDlcrnE?=
 =?us-ascii?Q?oegS6STWOQsB0giuwFKISIJ9onsnC6E8640FMc+oj+SbJO+TXcOrnuR5kJpF?=
 =?us-ascii?Q?yFY2oyIkL/+hrOs4yHX1RfB7To7weG+qT7v6sssV5O31yZcK5XfneSHy3A16?=
 =?us-ascii?Q?XQf/gq+iqh/M+gDt+JTSeHeJmd5t0n3Vf7shj2HiQjTIpbqOeH9ZjKtR2kBi?=
 =?us-ascii?Q?84GN2ZYodlGU/wk3DtkzmMhKBbiKPI1ZAiYw9VEYyH/1qyxEQgZWrsJ3XRzF?=
 =?us-ascii?Q?ycPHKB+PQJoC9mzru7Po5nW/loz2M28ydMsmXghstDJ94NJiCA+ujHk9QT5p?=
 =?us-ascii?Q?C8JwT2jaxJ25m0Mu+80cffJyl3HcbywGsu9iFoCPjvaO7ApPBvU+UyFK6tP7?=
 =?us-ascii?Q?PquT43UP2ggKjWuzFUVshI0doKJCMG5LabKtNs7IHUHn4/2Jpv9LEIMz2Itq?=
 =?us-ascii?Q?BuSpQEu+6N9V85kDqFTS5bahE0xxEx48IjLH7KQ7GZwyp8k9UQfYMiiYO5Dy?=
 =?us-ascii?Q?gJS9oAONmCR1f8xym8jEvYnvr+GgphobixcBXflm1zeXpvQ8nn3b4NQ4dAqz?=
 =?us-ascii?Q?v1jn+AGuj+vAJ+dxh60CKl2+xAeWoFkFNKAop0u9csFjnFrHDHzIetSLn8GN?=
 =?us-ascii?Q?aKHU+WBrkF148/jSmWDIlzc3LynWX7ROETUx6S6Ey/+jbCEtbje6O7x6z1+i?=
 =?us-ascii?Q?VEIRZ132nrsHUkUkjJ+qv519wRmryGwuKXJk9z0ngD9EqNHPtQuEIkg0xoMz?=
 =?us-ascii?Q?hMEswu5dYghzmqyZgHmySAbDstbHR6WSYgk18uKDJoMvDPeWc7a+XUi5ZADA?=
 =?us-ascii?Q?7st28X6/GoYBZWXj9T1SnaRtYyqyfbYqbd1p3+1yBGmnEIfgio1jBNNu01Au?=
 =?us-ascii?Q?15hslgKlYuGPY8w5+TfD193N2HDSrSKq130mnqcNOdXVkQTQt1wzM4LG4tk4?=
 =?us-ascii?Q?zX78RhLqe5k0NT6itYnyetA7dWHXYF/t1RkAuI6u?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e5a561-332b-4b03-ffc1-08dd6a81e968
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 03:13:55.8472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +kJh1AEPydHIX170NfcC+NsG0UnBsEc3BVmRUXxbekY1HEPCE+hcmh5oNIuQ3WQNiMsLDDOOWtiMvCU+h2pQQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8865

On Tue, Mar 18, 2025 at 02:48:05PM +0100, Krzysztof Kozlowski wrote:
>On 18/03/2025 13:38, Peng Fan wrote:
>>> Also the commit message doesn't tell anything about the existing DTS
>>> files.
>>> Do we have this device described in any in the kernel? Do we have any
>>> googled examples? Why I'm asking because often the issue is the
>>> incorrect setting of the polarity, which needs to be carefully checked,
>>> esp. for the voltage regulators case.
>> 
>> 
>> Under arch/arm/boot/dts/samsung/, a few dtsi files have the property 
>> with results from output of
>> `grep "s5m8767" ./arch/arm/boot/dts/samsung/ -rn | grep gpios`
>> 
>> Exynos5250-spring.dts uses GPIO_ACTIVE_LOW.
>> Others use GPIO_ACTIVE_HIGH.
>> 
>These are old devices and not many people are actually providing tests,
>so you need to preserve existing ABI. IOW, if previously GPIO flags were
>ignored, meaning "1" is ACTIVE_HIGH, then you must preserve this behavior.

Per google,
Manual Reset function is for Hardware reset in the Active mode.
If MR1B and MR2B is kept low during the VLDO3 is active state, the
system makes all internal presetting registers as default in the
active mode (automatic power on sequence). If this hardware reset
function is not required, connect MRB pin to high.

So the reset is ACTIVE LOW if my understanding is correct.

To keep DTS unchanged, we need update polarity in gpiolib to
force GPIO_ACTIVE_LOW.

please see whether this is ok for you.

Thanks,
Peng

>
>Best regards,
>Krzysztof

