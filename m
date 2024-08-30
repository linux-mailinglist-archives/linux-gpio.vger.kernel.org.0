Return-Path: <linux-gpio+bounces-9432-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2349F965BB7
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 10:47:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A50B51F25529
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 08:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC71B15FA92;
	Fri, 30 Aug 2024 08:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Q/QYfmFB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10olkn2030.outbound.protection.outlook.com [40.92.40.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA3A16E860;
	Fri, 30 Aug 2024 08:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.40.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725007648; cv=fail; b=BbbgTGUlRFKXLnLbAyR1qRi/keM3/N5+DtT2zpHlf0mPD5LDxKEd3k8QFKpPLNmiavg1cp7fjT1T3Wen1LrrdSgJJNRYL5FNHYBHY81igpsUylmGI6rr/D0msmx1Qw1PAU5aSnkjHOUmq2jAsJAs4ddQzc7hkaN3hGoxYIfYN7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725007648; c=relaxed/simple;
	bh=bgiwgGCvhjynFZS0idYVoTnDwgLMfYFwfxd1L67Tgbk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=CkhIJDT6lJoNs9S4Acx/jvsq4fl1bdA+RSCy40Uoa8tMQ97a6B2bx0CKLwMjelQsVIZUOMjMUQa5728uqGR4ZKbAtIF1VOQ1Nxl4OA6C3CzpY/4I8Sf2rA41muNBr3lXQ/cBhsgI/PyMJ/G8i8l0giGb1e92mjJDTQ5A530JqMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Q/QYfmFB; arc=fail smtp.client-ip=40.92.40.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FQyGzzGbkTWxrdVGKDFNi8H32u1mXBy5knoghs96HZ3cPEP3inHVgdP8rk33dByDnwydn5GvD0a9h74f9lE1DkdXf18q7MCcdapUFJjaNmpAVBHY4HLCK8wVHpBxyFrKsqOLRkd4WmnaSPPHueijtYdfVRqR9SaK1gmmflw2nA/GqbwViubfxyKhBAXY/xrPFXz7LS+5IHlrwyst38Rl5sNptl6ifj1QngT5oUq/qDcSIlxdRRdUB0lnbX6mp/MjezSn64Y4ug1QEQ/alRObfIY63M3z6ZiqMtV4czhSWQ8En+BPL2+0+QCnzHATgx14D+S/J2MDiVwqI8cDkRuK3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ilJx08NBn6vET/t0CttEzGaDL1dVaX7dOIoYmMY40Ls=;
 b=oa1dSRbs+1sCtxjiKRY7or7o4sHylRq+6R4le+t3MdU2l1bHudIhj7Xdj9N7S/lJyyp+2zXSwy8m2QX08h/S5D7R+WMP0Gxvk08u5u/ygrANgOBFi7nfI626avJH+bRYBrC6mYuh+XzN+xK+eT2SBd/cF0XZJQVm7f3e3SZSrgo7twJFViaYWBNA/oWooZDeqrA8i284rA5tuifwbsqbEQdDNMkoYdzmC/tRWZlNT9SCmtAqZOzKsBrYOL4U5OXh6v2AsDJrTx+84QsgSvMPhfKbxyX46Pb/CBjshISFychnfPQENSJVKYyoxbCTVWM8vSrDWGzHA2ngQKd0SglHng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilJx08NBn6vET/t0CttEzGaDL1dVaX7dOIoYmMY40Ls=;
 b=Q/QYfmFBeSWh8/rZtAE0YNeYU+CGYpWgaBGyC7ZWmyTGULhsAgddQDtYZ+SlenRWIqYuumAvoxprNYX9lkxONvwNyhuxPfU1HQLRNrjiEHwN+Cn2B7gasH0lcAeMRWmMmZP5r2PjPQ6zSWZxBUHgLavEwIJjdiroDy1vU8XE489XU7mRT8YAhz3bUeIpeF6YgxRhfH9OWC3vjJA0MspCDmPCkBNChpMH/05hiSTStEtC/vJ9y15EAxcBc1FcVHWIkxB8kYOT1uiy7ydCUIgOd0c3a+Z4hd7G/1cP/GbOv+d/pzY3XJWAD8bVJ3u2tLlNqNEY0uLzstW3FYTMNAJwLQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by PH8PR20MB5218.namprd20.prod.outlook.com (2603:10b6:510:1c6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Fri, 30 Aug
 2024 08:47:23 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%4]) with mapi id 15.20.7897.021; Fri, 30 Aug 2024
 08:47:17 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] pinctrl: sophgo: cv18xx: fix missed __iomem type identifier
Date: Fri, 30 Aug 2024 16:46:16 +0800
Message-ID:
 <IA1PR20MB495307A3CFAFD79188CED3B9BB972@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.46.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [mnrp5Go1/v/m2SWVMCCdo7UINeHgvWu16jLa97MdD3A=]
X-ClientProxiedBy: SI2PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:194::9) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <20240830084616.867276-1-inochiama@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|PH8PR20MB5218:EE_
X-MS-Office365-Filtering-Correlation-Id: 04ffb759-83c3-4fec-b66a-08dcc8d05a7e
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|15080799006|19110799003|8060799006|5072599009|440099028|4302099013|3412199025|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info:
	uwg/taWsKC66V19WFhiaQL2g34JZ7Vt3kQmjTqIRZbbEVg4tHyVD7qNQohKPxsWPURGISH3Mf8EsR6Q73fIRayF+tkqQJgQUqfVAbSEr0xErb359hOAoqs9WYOj6HJQSmavoeBdsimo/Rdojz6ct2EIyPaH/QYhK4mmm+Xtr3PkE3jElvURAYxWlEfhsxU6LRn/OGg5MR77T6zT6wKkKS2L60lP/fS6mW4oqPRzviDuSkRWjwmSOnzfodkXlOGNZ32rqoLUzCsbxMMwTsNJ3db8ldI9n+N9xAnk4Y3rPuihJlA9jDCMXnck7GXaIzYDBtZvw9l6eN/k/KrbflW6eeJdiYxkyJ0oXDxsAr5Wsk5t/Mwndgp75Kf/KtjTNEvxyZJ5r4fZrAFg+bT4azl6H72lIoqIq+DtGAG5Ob8xdj7wij5/WjwYF5TkNMe1gE0wT+zoEgEfUUYIM5nHe4kpXB2fAq1sDqUbUrPpCg5LhfuE6AcdARLt4GeCnjqStH2ud4bqtmd2lNUD3UwI/Ap7RUDufB7tu7obPh5Dw+XbRF1jst2KXD7Wll94XZ71bySK/DtRE7Gba/FfvxnNFxhoHfyfsTx2pZkd86TpcagRokXBG1+uS6Hqq45f2ao8Jc8QJMQyhRP29WNgOSoskU4TDmk3lNgR7RyycBCN1tMlegntm94s98SQirt8TMNJ9XDWl0eT5M5hB2M+JkzDKLm3VX/4Y/LSwRYELOQOlPyKqGMKCOmtTA5CSKfRcbNJ9Ywv7AKE7KOxBSMroxNVD93Rm1Kt57+01c7ujHSeI8pliPOgJe7fBwYKn22QWwwwI6SiI+NEc31V2ltAjdD/qGBQOE5QxIArj2nEIHf9sEnWHT78V8LwFX1tWu/F9XAQOsctq4YqZnrbNQzt1M6YRnADLWg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1EeS9sNawR3bI2G5oi2rd1rt2GMPYFpeY2WW6lqPogDcDNJjajezvQyJec3b?=
 =?us-ascii?Q?q8rkVkUH4eF7I1ILCZFXNOBwc95lLZNz+wJCt3PO4xEcZB3A4VhpaPmAiJ2G?=
 =?us-ascii?Q?4tDu1wOBVl0J1VtXWfIEAnJG7VTz+EBI7LMGTI9gyLuBXsHxCM3q7Ou1n6LE?=
 =?us-ascii?Q?FGTJwUpK/8zdD2ZmYopZr9wrr2RZL11Ud4j5S3FZRDPywkdEgwJTBw4SsZms?=
 =?us-ascii?Q?zWJuSJupTIJ+Px2x+lC2dtyNmX/xsWRnRD/nND4dwuWd2Qq5BcbrxwGCrbCI?=
 =?us-ascii?Q?xmSMPgU05f7oSL0ElD03S23fMUoKw4qogoqYpQTB4tDn21haA+8ixWQRcMxu?=
 =?us-ascii?Q?BaTCkWFnaLonlYFlKnu+R1WzvvMM+S7hH3dptkIBK37sP/5TeZLa9bDCdfgV?=
 =?us-ascii?Q?lErX1D6sueVKJmkpOZ9eT7lSmUSALRrbyWoa7rkc3XRe2NQUEggfiTSuN8wX?=
 =?us-ascii?Q?16FgoMIpE43xNN26D5hkoW4ngTDbStS9GrLDaSwOVviw75ZogQvig+bg4y9g?=
 =?us-ascii?Q?wYsGeNYro8D8+JsTAWYdwOdjfrNREcFkETrvJrGU4svAtEX50XU25iGlcTYe?=
 =?us-ascii?Q?pIuz13LQoYknf7M2QOG62PINcdOT16hzXdXk4acIzJKI+TB83eQklc4oKgje?=
 =?us-ascii?Q?JCUjvAhf9/JaVVx2669JrKIISYwD9cdiDHntKyeaqHk8rH4sI2xPc5aOUPbk?=
 =?us-ascii?Q?e6wvlh93/UoXFT30hwk/ifjD4xZaKTcci4+Kvj+297gNjM2jlik4jLTPrChf?=
 =?us-ascii?Q?IBgC9S22SQ6H62zLvyDJ3V2E0QGWaUNmPrkKHCqbr/gc1RhiPRbnltgoZ2QK?=
 =?us-ascii?Q?SPH8+7CSoM3HPfdJXy4ee6/T2ZTv70N3rO+JtbwldbvPIsmHWshq+RTK+ZK6?=
 =?us-ascii?Q?gEaMxUfDhxXBBoISIRGvxNge4H7T6z/k2YTlsEcEI3aj1ceu3WR8+rEqmIYF?=
 =?us-ascii?Q?qU06TPFHkNVp4Hd0KtjlZwkF4deulwoZd2+wCL4MP58QGZxika9Q6FlmqsRT?=
 =?us-ascii?Q?dyD5VFAHB6m8gW7rt5Vg++vUASeP/j8xs4OM3/8mZYz8g6wI0uwTBMz8VmiG?=
 =?us-ascii?Q?bSwzALVAezbWJlia/W/t3rW508I8ZIJwgoiZzCCNy73lPwQoTVpoXKFbK7Xx?=
 =?us-ascii?Q?mu3u+XLb5aM7HphKTCkoseAzLp98tcSPNsoaPIa6PEhHpksPIBWrKKb6thHG?=
 =?us-ascii?Q?fGMkEJFQg7D127Di6fDb/erU/vR69gHjKFf6TLtbAjgVAr199VsfM1WpPcW6?=
 =?us-ascii?Q?l7dmxnO1aYXlnY/8v3HD?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ffb759-83c3-4fec-b66a-08dcc8d05a7e
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 08:47:17.8461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR20MB5218

As the variable reg in "cv1800_pctrl_dbg_show" misses a "__iomem"
type identifier, a warning will be issued by the compiler. Add
this identifier to avoid this warning.

Fixes: a29d8e93e710e ("pinctrl: sophgo: add support for CV1800B SoC")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202408271555.kpOmi9I8-lkp@intel.com/
Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 drivers/pinctrl/sophgo/pinctrl-cv18xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sophgo/pinctrl-cv18xx.c b/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
index e63cfcc37377..d18fc5aa84f7 100644
--- a/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
+++ b/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
@@ -125,7 +125,7 @@ static void cv1800_pctrl_dbg_show(struct pinctrl_dev *pctldev,
 	struct cv1800_pin *pin = cv1800_get_pin(pctrl, pin_id);
 	enum cv1800_pin_io_type type = cv1800_pin_io_type(pin);
 	u32 value;
-	void *reg;
+	void __iomem *reg;
 
 	if (pin->pin >> PIN_BGA_ID_OFFSET)
 		seq_printf(seq, "pos: %c%u ",
-- 
2.46.0


