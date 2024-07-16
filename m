Return-Path: <linux-gpio+bounces-8236-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 994579332D0
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2024 22:15:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D300B235A6
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2024 20:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F6361A0AF3;
	Tue, 16 Jul 2024 20:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.b="WDMikzlX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01rlnn2081.outbound.protection.outlook.com [40.95.53.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741291A073B;
	Tue, 16 Jul 2024 20:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.95.53.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721160878; cv=fail; b=E+YOXaEbyBsCqSf+4cOApkOJ8im6scI+em9MLPK1fFwEQQY0rt7+dWhsleQJQto8L75TJEiqE/I4R8kUTL4QZXm3TWDBwKTe04bb7XwimYZXJVzk4g6GKT/v5G5x+8bSN6qypkpgMXfaswKsaV8BQ/xZf+d6tiLHP/AO6bgI3YM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721160878; c=relaxed/simple;
	bh=3dAC5y8+6OL9pE1QpHrnfg/pEtWvlFh6n/5G0wiH0tE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p10yseo86NXEe5KrPZQb1M961VeQ770gmEtzzhAXDcvLR+Lff3Ei/kt8E94UzP8OA47236kj7oMDEyJJIgfJk5/H9/2rz+P5rtu6is21L1ZmX9JOCpmmLiPw3iSUSsfPHN7KieAOXqio9O05PuiHDG5OwUN82mme4Rbve3TWzdw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=none smtp.mailfrom=taln60.nuvoton.co.il; dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.b=WDMikzlX; arc=fail smtp.client-ip=40.95.53.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=taln60.nuvoton.co.il
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lIC8Hfujnx+1pJbJcfizJbh8pRiGsEAheFV3ET9nDfuBL+h38HqqMteWtUVj96ZP89FfZEnQNpf9utBDay/KeyUlx1+V10/12CYX0VD6CL49/VpPK5VmFxKE/Y6gJkk+vt7vTZjEaKyDfWw96WAmEzuL2cPPAj94YCYyAUGK3AzZPalFVsdo5wujnOdnYNwcwpPWalnf4fc2BIkRqe1paSDpAQwrFanc4WMNuy1DRbl2HonV3+jJi583AnAtPuFrRVkUP1WLLAUOpVrQD8wm/gD3hH73v4eCtM+mQbT3vvIGjnkPM8NtHMIihe1igNW1/dYmBvHIgMJVM+vvvzP7qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+zLNPTmquDUunMIRKR6AmnCCF3TgcZYUvYh5g0pwRUk=;
 b=j5zRh0YtRbxDfoYNP0FtkAFqk5FFipoYXB6meH1yE6HThsnL6TZ0ZASGI7DfcdpDYXW5DXgUDPvlIFnkZoU6Fi+CZKYZvEliVcO6XQEbcSLa5ThuyNG34NU9iBNSUjXAabb+nYqpq4wwaJxqIwjmCh0RYEesBneaweFpw02+EMz2d8CD4wDZaLW8Xtrp9K0bonWUtuR701HP+8vHQrXhpY1UwR+2nWwfNII6hQsQ+I/zyWJX/KodH//+3JA9AWAK3krWfLOcnLOvqRkQ75mqMlsuviuZLEelP06kQzCkqu1yULmCU4NB8q9hsZNAkUV0jDLs4yVhan8U/MK17C5Vww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 175.98.123.7) smtp.rcpttodomain=gmail.com smtp.mailfrom=taln60.nuvoton.co.il;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+zLNPTmquDUunMIRKR6AmnCCF3TgcZYUvYh5g0pwRUk=;
 b=WDMikzlXbtAKSvR0FwKxB9muwBKsWk4a+d7Fgdmf0kVy+GnvD1XM3I9TWD8R84YBzd97X64rWvJc3YTB92851+0bJvp5d70+kf89AJEuCj6AndyiaEAwSgZk5yJ3RaK3NAo+QRdut3w4dnIJ011n4H1som9n+ZHieO6ng42OpJY=
Received: from SG2PR06CA0199.apcprd06.prod.outlook.com (2603:1096:4:1::31) by
 JH0PR03MB7511.apcprd03.prod.outlook.com (2603:1096:990:14::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.29; Tue, 16 Jul 2024 19:40:16 +0000
Received: from HK2PEPF00006FAF.apcprd02.prod.outlook.com
 (2603:1096:4:1:cafe::25) by SG2PR06CA0199.outlook.office365.com
 (2603:1096:4:1::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Tue, 16 Jul 2024 19:40:15 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 175.98.123.7)
 smtp.mailfrom=taln60.nuvoton.co.il; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: None (protection.outlook.com: taln60.nuvoton.co.il does not
 designate permitted sender hosts)
Received: from NTHCCAS02.nuvoton.com (175.98.123.7) by
 HK2PEPF00006FAF.mail.protection.outlook.com (10.167.8.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Tue, 16 Jul 2024 19:40:14 +0000
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 17 Jul
 2024 03:40:12 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 17 Jul 2024 03:40:12 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 62A0C5F63E;
	Tue, 16 Jul 2024 22:40:11 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 5EB0BDC0BCE; Tue, 16 Jul 2024 22:40:11 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <linus.walleij@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <avifishman70@gmail.com>, <tali.perry1@gmail.com>,
	<joel@jms.id.au>, <venture@google.com>, <yuenn@google.com>,
	<benjaminfair@google.com>
CC: <openbmc@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>, Tomer Maimon
	<tmaimon77@gmail.com>
Subject: [PATCH v2 3/7] pinctrl: nuvoton: npcm8xx: clear polarity before set both edge
Date: Tue, 16 Jul 2024 22:40:04 +0300
Message-ID: <20240716194008.3502068-4-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240716194008.3502068-1-tmaimon77@gmail.com>
References: <20240716194008.3502068-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FAF:EE_|JH0PR03MB7511:EE_
X-MS-Office365-Filtering-Correlation-Id: ec83368f-c81d-44f9-5209-08dca5cf1d6a
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35950700016|82310400026|48200799018|376014|7416014|7093399012|61400799027|921020|35450700002;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EVUlWFRz3jE+NW6PohRCmWe/Ms6KAiJ6rY4o0fKQclejObQktB9lcqRQlwJL?=
 =?us-ascii?Q?s4imNPtSSH2II8M07Pyywa5oMtKa7bcjZ/sZ9stOLMhNXdbwhu+A1X4RPABS?=
 =?us-ascii?Q?K4KrUtujFgj69q1jTGwMoB/HO3NyssyT69c5jBBFl/tANCws2bItNRLAc4Da?=
 =?us-ascii?Q?so+sOt3hprV1q9N5qo9NkrBAhfp5IzZDgV3mtUudP9dbCVSw5YrCzS53gSkM?=
 =?us-ascii?Q?xONfkd7TFnK88pcIarT3vhm5MpBvaZuzMdjhs5v9CrkoQ9zzRqLPjEPTPdFu?=
 =?us-ascii?Q?FF4Heq9bnq6bVHufGjsRwtAsABZlJQsbDNi2Qgt7GK3QWrh/SkDscEkVUWQO?=
 =?us-ascii?Q?YbhkcjOOAIoXfjPdq4jYYZe/CLvVzbJeMvdnIfUd0SuOxs2c79KRIBQ1IrEc?=
 =?us-ascii?Q?JNvE6wygVVe4YjrZRVFCA3EH1BWbNxWTP205X2gNBV+j7vq094icilLHHkao?=
 =?us-ascii?Q?hCOpqXJxTUbp+fJ2TkRcKNnJI6oTIf3EVVLAsEB9QwMxdWHkybJgv5ufHBdl?=
 =?us-ascii?Q?UQtzlEmcwcvozlVnw64NXblmFkDJqSEqaqikSa0dyZDztdPbENjFd8zRXvtW?=
 =?us-ascii?Q?PkMAK5qg5bGl4Ipkn7qug3gMp2qqwHXGvKsYIyLns0OtFeXUWTvby0vMe5hN?=
 =?us-ascii?Q?fHUGN5LsVi8NHdG/RQuA2psmhHrG3Whxkx0KNBVXIMOWFkCXG0ZnSxSS2w/c?=
 =?us-ascii?Q?4hVNdy8UYKEPOcoTfrYJ405HnCzJJvPZ3l9OEWMm8LcGRDBdBV1KQ92BijBF?=
 =?us-ascii?Q?XCTDZnNCt02iB8W8aSpfSdRk66qr+6w7kax19ENWto28sVWhs6F6UysMcrm9?=
 =?us-ascii?Q?9RkWhUUXRkZlUTZntJhn8hlwLrnWqBznsUb+ofa5oBve3s7ZdQGhiDC+gCLv?=
 =?us-ascii?Q?jwjaY4jeE9Z3kuy4upPFcL4h6V8R3/45Bfmmavb+ZIfLMJsdUjACz+GwT5oz?=
 =?us-ascii?Q?D5X8PlPr87fu/FPcVRy/NI0NPmrFuuByAJHrIahxs9iKnWURatoKcGu7CUdw?=
 =?us-ascii?Q?Di3R54T/kdMs95F3jQ7XnJwMjAUGjrxNsx7cCJqXek9FUXknvCQyqmeiF4eM?=
 =?us-ascii?Q?o+wU2GXOSIOJ617lCsC7/EqWgbzFAEHwvluM/MIcZIO0CKTtZf9q/0DVad9a?=
 =?us-ascii?Q?yMQjUEPKZFrPXF1fMhssHVgDxNrhOTNHap+HprWM/acsGw7Q/ZJkdYTERPu1?=
 =?us-ascii?Q?CJdYflh9fafrukdoaWdRdWf9gOdQ43X+w2kl034SEJtaAdEHeGBRzlJ46Ui7?=
 =?us-ascii?Q?zwLqJ1em3cD6nh5cswguP5jpcfEmUPRKH7lILSphVsyLlWg0Kixziag4/EkN?=
 =?us-ascii?Q?l87UpFC1QHzdj/EkCzWjsxGpfD2k8+EErbAdaiZIU+Md5kwHVHUQMMjuU7Aa?=
 =?us-ascii?Q?SBHKwnB0TcgSnxPUDe1whRvBhhzweC1cTjiRy841WqXp5Rciy8dzS8rZQmqi?=
 =?us-ascii?Q?J0iByJ0rCWbzMtviCB+d5VPXIh3ijcYcm+VHf8WqdKC/X5dMyEo5dtNA863V?=
 =?us-ascii?Q?+b5ds46Nw0Ksftc=3D?=
X-Forefront-Antispam-Report:
	CIP:175.98.123.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS02.nuvoton.com;PTR:175-98-123-7.static.tfn.net.tw;CAT:NONE;SFS:(13230040)(35950700016)(82310400026)(48200799018)(376014)(7416014)(7093399012)(61400799027)(921020)(35450700002);DIR:OUT;SFP:1022;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 19:40:14.9775
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec83368f-c81d-44f9-5209-08dca5cf1d6a
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[175.98.123.7];Helo=[NTHCCAS02.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource:
	HK2PEPF00006FAF.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7511

Clear polarity before setting both edges to ensure that the polarity is
in the same state before configuring events for both edges

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index 2df735947d86..7985400de12a 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -241,6 +241,7 @@ static int npcmgpio_set_irq_type(struct irq_data *d, unsigned int type)
 		npcm_gpio_set(&bank->gc, bank->base + NPCM8XX_GP_N_POL, gpio);
 		break;
 	case IRQ_TYPE_EDGE_BOTH:
+		npcm_gpio_clr(&bank->gc, bank->base + NPCM8XX_GP_N_POL, gpio);
 		npcm_gpio_set(&bank->gc, bank->base + NPCM8XX_GP_N_EVBE, gpio);
 		break;
 	case IRQ_TYPE_LEVEL_LOW:
-- 
2.34.1


