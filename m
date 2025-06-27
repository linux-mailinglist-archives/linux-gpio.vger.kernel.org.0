Return-Path: <linux-gpio+bounces-22317-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F36AEAD2F
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 05:09:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45ED9566EA1
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 03:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4539660DCF;
	Fri, 27 Jun 2025 03:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="h/OYDXWg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010049.outbound.protection.outlook.com [52.101.228.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4B623DE;
	Fri, 27 Jun 2025 03:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750993777; cv=fail; b=OWb8nyNUNaypYhDCWOSMDs/ZXs9hWdkOeMkLcdXUQbES2tlYgBaLR+xvy4TedSCK9BvsQF+qwq65ey261ZJUCzpg5kzytHxTJ8dR2/x6y9ZdVoZXKf01QfgE9j/wOrNOe/Ej27rAqotC5tqnKtylQE34LdSLNL0KqWsdBwL9gTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750993777; c=relaxed/simple;
	bh=D+kDFGdBbbnwoaakysH0iLuZSTKLCmn5CGNUMJVxZcY=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=pLterOfKHLyViJ5N87lQ2m6Ncym8VdOv/oBTuR4hzC4ZH6NFatd96RKNaBpZ9nbSDLn16eLtXxyh3GTjYpktZGr+RzO4R1QRKQorsYrUqqOPgeCvp9q0Gj/0/RGudqwNfhAI2NmGqpogfu250IQNBTX2avCw7l9tmh1WT05vV+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=h/OYDXWg; arc=fail smtp.client-ip=52.101.228.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=so2deON4Elo4yr9GKdCSU9rka9d7gy3IIguc/U5pRaXGPWqKK2Fy0A8aBkh/rLIwF/V3iaWyTNe8A5/qY21cDhBZblIB+rhUcAcSg53H8j/5/M9Qqe31eJ62W+LFeejc16bwz3+JiJi2nQrNIrLVs5uFuDBwd/PnHSz3ymxYZGTLEVj5DigQmrFVMrApbLj8acSqCzqdBoRca4s7OsbKWSabkJqmN8dXegy7kXFm7svuh3otuQlH6lde3oPqH6NmkSw9ey6rwHw7IaKFW5OShRsiQqfbojZ59YcCOl8LcRvNunIsmRXRAYwPB6K3MRqNrrRPP3yWB587M576cl1sVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTD2FR1wZCfmoB4FsX5yGZDuvi9pCOyBscl8gNDXSY0=;
 b=I6v3OlqC+tbzlXKkzjCa8sJbUwvXtzbQ3IFDp3n7Hm+AgydHDxPcYW7uzoY+Lx0bVaYCcl8jahaSRIvhvkX12TEYpeAZKuS+NnsWJFv3EduzzoZ6ZV8EZL0mrMnnDG0Te5DuDkrrvqd097/egVMvTlItig79bW8VR5rNiSomTI1035Do/8q6/POlMos+9mkmWJ0GEDmAHjT1nFKhur98zFTauB0idAH2CYX68gBcyYfDeI1vQznApH9vsUnzwK5Q/uF9S+ddL1utAre2fEfmNY/d1K/pE5IBCaJuoQfKFWgjrQT9+44z7VU8W8Klv/Iub+A8EHAWxdjpaHGPacY1Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTD2FR1wZCfmoB4FsX5yGZDuvi9pCOyBscl8gNDXSY0=;
 b=h/OYDXWgJORdO6g5u4GR302Rvw1N5SfzuHXIWHN+O+XO+PKBD+X8BbJxWdjzcUyJ5871F5++NaJxfE6ir8Ss0MZd1hZOpMy0/HILvYi7L0uTpdKFGgNyI8n+3/kRZwcT4Vx3Vi8eddFOtdIURtirfNL6gG63MxBqRX+TFgMAJcs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS0PR01MB5569.jpnprd01.prod.outlook.com
 (2603:1096:604:bf::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Fri, 27 Jun
 2025 03:09:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8880.021; Fri, 27 Jun 2025
 03:09:31 +0000
Message-ID: <878qldhod1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 0/2] pinctrl: renesas: tidyup Kconfig
In-Reply-To: <87a55thpu1.wl-kuninori.morimoto.gx@renesas.com>
References: <87ecv9ragd.wl-kuninori.morimoto.gx@renesas.com>
	<875xgk4j9l.wl-kuninori.morimoto.gx@renesas.com>
	<CAMuHMdWst5fhcUgWbTqzG_DQmuL8tWtUuCpg4BoeqhnCfo_MVw@mail.gmail.com>
	<87a55thpu1.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 27 Jun 2025 03:09:30 +0000
X-ClientProxiedBy: TYCP286CA0360.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS0PR01MB5569:EE_
X-MS-Office365-Filtering-Correlation-Id: f5216ce3-0ad3-4238-88aa-08ddb52808ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6Z8BOlnNvkobCEJyZqjwTwhZa7FUB7gFpWqjjrJqEGoULvucrZ6K25GB7W8j?=
 =?us-ascii?Q?fepY6jtFvMaxG7g5XiruLw1S/BsHMR1lzhM5OlZbVR3wwzFLkXnsfRrYeaK3?=
 =?us-ascii?Q?czDA4C5TC0Q5VvUY2VAqH/xiWL2RL/NZzzdqdwdVUdFuZAJHKUhlC9I0Qve+?=
 =?us-ascii?Q?FsMrw4kwEcyZcRv3DiButmpYJ3Tm4NZ89WFAI4Q/VYy7yaXGS4hbZi9RYnWN?=
 =?us-ascii?Q?AkudBML273PTRdOVaEjKR7yYB2IFvozCUFEWCLPIFUZy8GBmS2oLcQidmFni?=
 =?us-ascii?Q?40MQES4tNW6JKZHnnrct33mUVNPoUFI80j8iiChZWKeR7eITHpgK+ruwQ2FO?=
 =?us-ascii?Q?XLtEkzaet2cylqqqSPYgr8qyjI5cnV2mjPsbyVScaDb7QtrGRGrTGp5JU0l9?=
 =?us-ascii?Q?fnqWbUSo7LV5rw1wvgz9okZWtPru13+JtIkbugZArvm3TFu5sRFQFtnSesDQ?=
 =?us-ascii?Q?Fg0jCDqSH9Z5TVZeuQd+WmquZPt5d9So7QwzBkhNpUuQFRKNQPfGIvp/fPzh?=
 =?us-ascii?Q?/fA7Nq60r05Gsng6n1g+KYHNILluQ3HNAdydCZ0+HzYhNoXggeeP5K0Ld/VA?=
 =?us-ascii?Q?+Y5txaxu5uI8Bc7IFope1XU0xrtPEq33YYQP+UJd3+Owu+/EFoCU1n0sfb8l?=
 =?us-ascii?Q?3iJ2fQcZZ+z+1D2q/WWCwGmbG9LdqXXSdBH0DHxS8l3x05I64zDcJOYM3Ogd?=
 =?us-ascii?Q?NAwHpVNJhZCggA+g43chIkMinjsPCUTgBFt1mNAOds+cd2HX7Tz58Luq+RoY?=
 =?us-ascii?Q?g694LkUoZ87GNmifXz7ybfS9NrMx/AfLMPwAJ5FhjwqXVD7rsKGTER2WRBAj?=
 =?us-ascii?Q?8JW4VRAFSBJBi+mOfBomYIThp4AxUkgp4fZep2nS0Hw9FNOYXklYijyecapc?=
 =?us-ascii?Q?ReQQHaT3J2psiIBw6k7gwmCmJMs1mPFDgU3AdrzIxWPlIWVPkDejkCc4qCZc?=
 =?us-ascii?Q?JFhBSyhSRcYKa2RFqTEs+xczLLzxA5N8UhoF1dbQgbztQ9u/gattOtezI4Qo?=
 =?us-ascii?Q?A3VdGqaTtEnBHWkPt5MiBBsuoLRJcg5AEvlZdxPirS4sPOfOV5wgsQXdiM/X?=
 =?us-ascii?Q?HHIz+WAsnwVQRxboBX8NNLwMyXoLDrJHnn1425W9V62pBmZQxexNXHeUGe1t?=
 =?us-ascii?Q?X+OIBzKV+UwSz4iag+BucBwiuKpBC7xnu7AM9LdH4K7tOldT7aUdR7ttJBfe?=
 =?us-ascii?Q?6zSCoKj0HmY9fnfOoh3TG7wD5pgNp9WUq10bMN2NPYNCJbkhY604YhMlmQl5?=
 =?us-ascii?Q?xDIalytLG9VcFC+up7bcJ3vPgK1Sgv/P8lM3nJfThiFbrqCrWIDdPV1Oxihi?=
 =?us-ascii?Q?tB0OxD7P1XmvP+JhOmki5Clpd5mlDUN8a7w6rxc7jAItRDlWpvP+CrO7xWm1?=
 =?us-ascii?Q?Vht3baFl3RdPjN7K+oXSEc0EukPf/T/n+kElWZjM/xKFXsJ2hENqJt7+Jflu?=
 =?us-ascii?Q?tvU9RGWtxIMT0h5QD8PpN70pztFH2zeU/fVwOpshQ6fpXnDEdvuioA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LOAwAga0jtku+8mPXGcgtJZhcs85j2fgyyEQ43ggpJ7cINBIQM9LVXz7N6CJ?=
 =?us-ascii?Q?1w6dhLWicJ4Veb63OS7tCnJkpAS3DIHohVNzawktR+WmG2eAfHWtKAFwhiy9?=
 =?us-ascii?Q?9u9uk+50UyGGZRwmcIWobsGEX6IEzGga/chexFKTpsTjF6Re/7rHVw7smrGd?=
 =?us-ascii?Q?s0eAmfWAffPeV6EE0R2SNmb5+aRpvOKmJeIoZS9zIjqj1ayC8q+eVYe5hMIg?=
 =?us-ascii?Q?agjL/GXxHvdZDEgT+uVMW5hCu94d4QbIUQO4BiViobX27MJz0sgmWoUUHGry?=
 =?us-ascii?Q?jej2SS12Nc7DZY/wxmnOjEPspgHRUvd6e/WqVglt5QJvAk7hDquxjB6s8Mwa?=
 =?us-ascii?Q?VSd9NVMv4w72R0Xe3Gb4poLPg2Q4Qr87ULk8G5cJHxF0Am3e8cD7ShF3zz3n?=
 =?us-ascii?Q?WuVG4ROqSRJYyqnvnCW4qit6KRHhk9vEyFVZiZX6R9q8GSco/8jGouYIqKWY?=
 =?us-ascii?Q?Tt8gUphFgHtrNzCJ89o47k1XoZ6a5d+SQpy9BwIxynHeuspKgxpaDvW7+9hg?=
 =?us-ascii?Q?ZSYm0f36TM9MQMerrEYf3Lk6oQIeDClfRf8CsGQzt2wHgd8UtcJZeMmqUlUH?=
 =?us-ascii?Q?2z73PpcR/gGMjbeeYXA1t1DUUuIKtznCl4WOT7GEOCuCKPWPiOrQCxPSFtHu?=
 =?us-ascii?Q?MW4feELlfpEioOdnB7Z5xgqyhtaq+GBPjQn0uXXRocyGmaakm8TDqtc9E1Kr?=
 =?us-ascii?Q?Esm9lGAlflWvbDZ6QebZNIkWERNJ58U8mLui2UCe3L5I3xXMlv0UV6B8eYlW?=
 =?us-ascii?Q?9/yRv883HkaqV07joufCCZ96CotGLD0THktvce7q6iHrsQj14z1u+iiYv5pe?=
 =?us-ascii?Q?TLbKP7ZLNTuH+fDncfgI7tYS8v5DZsfpUs0Zu9xyvpAYpi4REYsNQr/YRBqS?=
 =?us-ascii?Q?SV00Pnh20JUxm5P5EX4R5sfJxNIV9PAwm+BqhVVUAvNul5aItpYs28652vSY?=
 =?us-ascii?Q?mX6LjN3mavwKftT7aQCb/s/aV4jIvH/vO1twV2gWNXFqqC8z9LlSyh7zOQpl?=
 =?us-ascii?Q?WDM5kvttfF1mJ0Zn/IHyeQzcQ6dP2lE2xcFK+3EPY4DVx4Ai9OM/9RpVW2/h?=
 =?us-ascii?Q?avRZymmuJtta3ZTmCCO3RzVrVyBqycgD1VfmcV2P9MPbJ4dqyySW4ON6hvg3?=
 =?us-ascii?Q?iF3TPGd85laQ28fCJm4YSyD1dIDZDXT9eEu3N95in7skJrT5D9nmVL5HXG9C?=
 =?us-ascii?Q?1o5XNpgljgZGvIEQHLkAYmaBR2NvZAFMr4iCIN4SQIA/pVFtOrtGoXFgNuSk?=
 =?us-ascii?Q?BWMKWzXO9fmyboG57RGh5heHHMt24Xb8fWMN0MblnBc/bGDA3/LPZtJ6rV7G?=
 =?us-ascii?Q?+QDV2Bn5nvqVV82giISWvd24wyIaoQSlo7chjsHEcSFIa+5arhQla1uwK+fT?=
 =?us-ascii?Q?XacviSMExqcGIL3w7h/0WYexc4v9/T+QuRiQxpbaY5cb0+xuwe4RkcZGZ++a?=
 =?us-ascii?Q?bXV+sXXer2Oc9enL1wbtEQEWtFzaMZU6tgAZiJ7NG7uS6f/PP+QvznWB2sZb?=
 =?us-ascii?Q?etS2cQMMwiEkrpupMFx06GnVc3mdWqC/mKgwOj9zTQb/zayZtSGf6wJ0gziy?=
 =?us-ascii?Q?WwXjIldCuOQbLR5G5STlbvNrQiUpEml6lYC7HD+vdylh2V0ZXrOhwJ6Lpe8v?=
 =?us-ascii?Q?zWVhzVIKlfu0pynr68gX2PA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5216ce3-0ad3-4238-88aa-08ddb52808ca
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 03:09:30.9201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j5FJTXJyEB+iNdxj/W+0tfuf3s846eiHh/C7KZoH9AlhoiIiGgivrKKEEjheH+ixwSIWOja/79uqBlxLjSRo4pt2PRjq7i5xow8+T0rFPLldY7v3ylXlFdfFjeAsIdQj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5569


Hi Geert, again

> soc Kconfig is categorizing ARM32/ARM64/RISCV by if ARM. It can avoid
> unnecessary compile, and makes distinction clear. Can we use it on pinctrl
> too ?
> 	[ ] pin control support for R8A7745 (RZ/G1E)
> 	[ ] pin control support for R8A77470 (RZ/G1C)
> 	-*- pin control support for R8A774A1 (RZ/G2M)
> 	-*- pin control support for R8A774B1 (RZ/G2N)
> 	-*- pin control support for R8A774C0 (RZ/G2E)
> 	-*- pin control support for R8A774E1 (RZ/G2H)
> 	[ ] pin control support for R8A7778 (R-Car M1A)
> 	[ ] pin control support for R8A7779 (R-Car H1)
> 	                                   ^^^

Ah, sorry, it is not ARM32/ARM64 issue...
Sorry for my noise.

Thank you for your help !!

Best regards
---
Kuninori Morimoto

