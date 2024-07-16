Return-Path: <linux-gpio+bounces-8232-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8485F93324E
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2024 21:40:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 390D02844DB
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2024 19:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 842CC1A0AFB;
	Tue, 16 Jul 2024 19:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.b="jPrGyubq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01rlnn2073.outbound.protection.outlook.com [40.95.53.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C541A08B2;
	Tue, 16 Jul 2024 19:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.95.53.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721158828; cv=fail; b=qHRhYt+g4vO7T+uE17o0jk4RROY7eAHBHPrwM2s+rqhPy6DskRxQQkd01aUMFnG7b79jdikgUWujO/PBus8w29gFfMtiDSOjfNt5GNcaBLLuk1osn//Y5D4En8UEF01dIiu2d3ZickCBLaHvvEX2rBJwlkrwAWQoRQnzX3V83g8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721158828; c=relaxed/simple;
	bh=ejC2X1EemjadUL+Zwsm0AM56r4tfCQ7koeUF+HV17Qs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pANSetr90ruHpqxPbkrsVBvWVNEX3deq0ONq2TymIajbjwTLf8xnc9Y1X0JtHOpjl5beIqWH5fTUukWYJ3pwyuDk5+LQIwtpPOSSGoAPUX9VslcRrKJ1Z3dZ49rEhnzIVQbXwpavdnBDMoiejILyFeV/FT6lC/N2ky6sgJsiKhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=none smtp.mailfrom=taln60.nuvoton.co.il; dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.b=jPrGyubq; arc=fail smtp.client-ip=40.95.53.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=taln60.nuvoton.co.il
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oHwP4STiyc58W7jNv2HYjlefQHruHHxmlXJFQETdU5jvVtxH7mZ89BQrsOD5rtXNze44TEmn/WIGTpMhqM6SEvIR4TDk/PGJpGG4MsyRjYyIXt65JHLER4wldsTiEcFzAmJO05B1Va0GJkiWWnfw900hOP3SCTjBCPbHDF0V3dATWFzqhRMbd3RVAMljzOrVEPArlObWSxb0GxbUYrGQXOc+gRNT3AX6fpUgcIWMzCTxLfYWJx11UGBmuh51DAUrUQiqVMpqMQHVuknXQSVgtdHLN1o92UvKAm8Tk8UDH1/pA7TjIFDnHoaUYBZQPcrHMb5xzvZ/4TC2Oc7h8TO6vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRLjeeVD0N6SLH64QcEcyhfgfptn49nbeH+Tfis54ec=;
 b=WMCDChAtZvcvIV4ZGj187HqE2A1BzKMa3TzHRcgDiZoookwLMEZFFyMgyQfS55k46+yCxB/ZdxlPbCamMsEug87n3Oc8O304Mj4MvZbLxQqc8R8nBbXynvuELVTe2f+myFAPRyiKibKTd42+MTX3WUeDJjzaez3hDi3NGdiRW3esuopIyVG0psmXjc7r8qJSJ7RbwjxnmeNHTIwX3GzyKqaW4fozPeekjKYHzmqUcMieoag+KBnJPNfnETXwvLuElxoY865djAPLaxZchHnwcHTlLF+rr71i0y2Htv62nM1KjaCLOY8teBp19QqG6F6LMFMXsaGI2jRi44Z5U8gIYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 211.75.126.7) smtp.rcpttodomain=gmail.com smtp.mailfrom=taln60.nuvoton.co.il;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRLjeeVD0N6SLH64QcEcyhfgfptn49nbeH+Tfis54ec=;
 b=jPrGyubqeW3d0qG4ASy+fPI2eC7xYFMzJqcEsi6idfMKzb0kqPEKOqb36i6rC2IlDQ3bxZicISxDvk6ORWAdZiS1TFCzhb+1WIqwySM4L7rn7wT7jr8BqnQLn8JJhIwl5wVQ85hImka+jrbMmuU7jM/Hi1xfe9CaevUqh8NtSd8=
Received: from SG2PR01CA0132.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::36) by SEZPR03MB8382.apcprd03.prod.outlook.com
 (2603:1096:101:21f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Tue, 16 Jul
 2024 19:40:17 +0000
Received: from SG2PEPF000B66C9.apcprd03.prod.outlook.com
 (2603:1096:4:40:cafe::ce) by SG2PR01CA0132.outlook.office365.com
 (2603:1096:4:40::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Tue, 16 Jul 2024 19:40:17 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 211.75.126.7)
 smtp.mailfrom=taln60.nuvoton.co.il; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: None (protection.outlook.com: taln60.nuvoton.co.il does not
 designate permitted sender hosts)
Received: from NTHCCAS01.nuvoton.com (211.75.126.7) by
 SG2PEPF000B66C9.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Tue, 16 Jul 2024 19:40:16 +0000
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 17 Jul
 2024 03:40:13 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 17 Jul
 2024 03:40:13 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 17 Jul 2024 03:40:13 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 9045E5F65C;
	Tue, 16 Jul 2024 22:40:11 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 8C343DC0BCE; Tue, 16 Jul 2024 22:40:11 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <linus.walleij@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <avifishman70@gmail.com>, <tali.perry1@gmail.com>,
	<joel@jms.id.au>, <venture@google.com>, <yuenn@google.com>,
	<benjaminfair@google.com>
CC: <openbmc@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>, Tomer Maimon
	<tmaimon77@gmail.com>
Subject: [PATCH v2 7/7] pinctrl: nuvoton: npcm8xx: modify pins flags
Date: Tue, 16 Jul 2024 22:40:08 +0300
Message-ID: <20240716194008.3502068-8-tmaimon77@gmail.com>
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
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66C9:EE_|SEZPR03MB8382:EE_
X-MS-Office365-Filtering-Correlation-Id: d3d9c0d4-c356-41ae-a0cd-08dca5cf1e88
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|7093399012|48200799018|7416014|35950700016|61400799027|921020|35450700002;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?khAggtLyzo1Dr7PPbI26w/8qWS2mOHbri+iM9Tzg/2B2aCJ6bItY5RqQbZuk?=
 =?us-ascii?Q?Su2VqlEzoz6GCIp8Nfk9yPPS0lJK7ZKuf/hfbTpOhnBzet3eFDj4Tnn/Inel?=
 =?us-ascii?Q?wGQTSPDp06hBWzh0AKXXiL27lIoR8chGpFoXf9y7Ebd2X2AuIqHANZpPFOLJ?=
 =?us-ascii?Q?AQv515fZUIF7WD4q9GZhup+bAUHViRn1HQ0uyt3Bl4M/+R5idEEAkr4lphPK?=
 =?us-ascii?Q?MuXM4ZpGwfzOhxaheiEM8bI0GoVzz2erQSnkimXXwhM7ROlF6xvtUwHMLA6a?=
 =?us-ascii?Q?rnN8ztG3rN5TF+xy2ocA7prbCldQ43vTJ87si/UliH2o1N6mlqZdaiTWTrLz?=
 =?us-ascii?Q?bFshQYZkM44LHigV8MF0nQgxtA+mon5AtBzJ1Ba5SN2VsQ8Bk6kTcPefVk2f?=
 =?us-ascii?Q?gF+qt9PKgtMyhcgN2cOkTcT515HihEx2Z0rVmAF7rfbZabN0IviHqBLKGvud?=
 =?us-ascii?Q?uLNiGgw725fRGJpSZQPXvYp0Tkz332TC8Tlxrfs9nb5RVX/SHXk/ftXimiHl?=
 =?us-ascii?Q?1quA7oubo+TWlxaiwJoF7HiB7A5KDYX37F1imJtSSLSIyuCo/RYvlUJFRgq/?=
 =?us-ascii?Q?jZNXqRmVsK0bNQkG1N7ic6IYOqtm/sk6qQNiziihRB31FsAjd2I+w/4N0yas?=
 =?us-ascii?Q?dUuF1sCuw5F937rpZB/UeVlkTjza03l3q/iNw4WEQnW8mJE6skXyBdX+n6Lp?=
 =?us-ascii?Q?AIGBEsfBdU/MmmiYRQXQ4Ck/a3EA2VH0F+VZmXF+LLlna+6FocAjCAzZtb8D?=
 =?us-ascii?Q?euMxALbrTvzmtNaCYGMvUz3BZbmYHQ69nZksJKHJHIOCmGJXmRtiEy3kscAh?=
 =?us-ascii?Q?f/0o9kzEL0gtjy8T8nClZ51nCpAwONI4JscRFbEOCIt1bVT6lUR9Mk5fDnat?=
 =?us-ascii?Q?4+2F/tLbMGHLImrTh/NR3AoG6j3jmYJr50lsD2u/KCMc5zapeiqZzJMVSJRj?=
 =?us-ascii?Q?sEW4XBOe6lGP6bLZ5gwt3Jcz1Tz6/L93z1a3/kSUN7Lz/irzJ3dJAPFvc9w/?=
 =?us-ascii?Q?KCeiT4ER1xhXGRVZio11+5WqWiXq01200LWNgktGFqtg4J/Pg5koGbdl+FD5?=
 =?us-ascii?Q?z8QR93fs8GQoGBkh9KWAXOjY4HAdm5CJm4RTx5KzF5iYCSyNTRTgejfmCFwa?=
 =?us-ascii?Q?p20e9IbktFVg07HfffqqVKzS5LT3Fa0XNlciN/x3/kEo1Ttva9qClQRWWDZ1?=
 =?us-ascii?Q?aHVTnzfOfKUgoY3NT5bbk6jh21aDXtTIVB3X4iFOCg8P7bkOj+683OL3xwbh?=
 =?us-ascii?Q?nA1Y7UbW2jz6nAeEuTXWwl98qCH70l/DjNzZSKqzP2sJEw09DNw0fdmL9p39?=
 =?us-ascii?Q?BUne9QLN8M/wZKk8hVE/5ZHYhU7WwA/CMYU2U9TrdOgM47wswZCm3hYGPNjM?=
 =?us-ascii?Q?mV5Z4JE4JTFeG4eqsVFh77q9mEMOmoDW6lWKunbdolrUkMzshh06fPOf7j0S?=
 =?us-ascii?Q?3Wq1tr6hJa0zR/AZt1dRNmpE/WvP3ONDhU5l8/JaL8lAwIylMqlZKx1ULxR4?=
 =?us-ascii?Q?p44NL2D50R0fyMU=3D?=
X-Forefront-Antispam-Report:
	CIP:211.75.126.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS01.nuvoton.com;PTR:211-75-126-7.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7093399012)(48200799018)(7416014)(35950700016)(61400799027)(921020)(35450700002);DIR:OUT;SFP:1022;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 19:40:16.7757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3d9c0d4-c356-41ae-a0cd-08dca5cf1e88
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[211.75.126.7];Helo=[NTHCCAS01.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66C9.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8382

Modify the following pins flags on the Nuvoton NPCM8XX BMC:
- Add pins 110-113, 187, 191, 192, 194-199, 202 SLEW flag
- Add pins 229 and 230 GPO flag.
- Remove pin 233 SLEWLPC flag.
- Remove pin 251 SLEW flag.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 36 +++++++++++------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index 2cc433a74ad2..471f644c5eef 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -1433,10 +1433,10 @@ static const struct npcm8xx_pincfg pincfg[] = {
 	NPCM8XX_PINCFG(107,	i3c5, MFSEL3, 22,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(108,	sg1mdio, MFSEL4, 21,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(109,	sg1mdio, MFSEL4, 21,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
-	NPCM8XX_PINCFG(110,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	rmii3, MFSEL5, 11,	none, NONE, 0,		none, NONE, 0,		0),
-	NPCM8XX_PINCFG(111,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	rmii3, MFSEL5, 11,	none, NONE, 0,		none, NONE, 0,		0),
-	NPCM8XX_PINCFG(112,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
-	NPCM8XX_PINCFG(113,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
+	NPCM8XX_PINCFG(110,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	rmii3, MFSEL5, 11,	none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(111,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	rmii3, MFSEL5, 11,	none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(112,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(113,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(114,	smb0, MFSEL1, 6,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(115,	smb0, MFSEL1, 6,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(116,	smb1, MFSEL1, 7,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
@@ -1510,22 +1510,22 @@ static const struct npcm8xx_pincfg pincfg[] = {
 	NPCM8XX_PINCFG(184,	gpio1836, MFSEL6, 19,	spi3, MFSEL4, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
 	NPCM8XX_PINCFG(185,	gpio1836, MFSEL6, 19,	spi3, MFSEL4, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
 	NPCM8XX_PINCFG(186,	gpio1836, MFSEL6, 19,	spi3, MFSEL4, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12)),
-	NPCM8XX_PINCFG(187,	gpo187, MFSEL7, 24,	smb14b, MFSEL7, 26,	spi3cs1, MFSEL4, 17,	none, NONE, 0,		none, NONE, 0,		0),
+	NPCM8XX_PINCFG(187,	gpo187, MFSEL7, 24,	smb14b, MFSEL7, 26,	spi3cs1, MFSEL4, 17,	none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(188,	gpio1889, MFSEL7, 25,	spi3cs2, MFSEL4, 18,	spi3quad, MFSEL4, 20,	none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
 	NPCM8XX_PINCFG(189,	gpio1889, MFSEL7, 25,	spi3cs3, MFSEL4, 19,	spi3quad, MFSEL4, 20,	none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
 	NPCM8XX_PINCFG(190,	nprd_smi, FLOCKR1, 20,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(2, 4)),
-	NPCM8XX_PINCFG(191,	spi1d23, MFSEL5, 3,	spi1cs2, MFSEL5, 4,	fm1, MFSEL6, 17,	smb15, MFSEL7, 27,	none, NONE, 0,		DSTR(0, 2)),  /* XX */
-	NPCM8XX_PINCFG(192,	spi1d23, MFSEL5, 3,	spi1cs3, MFSEL5, 5,	fm1, MFSEL6, 17,	smb15, MFSEL7, 27,	none, NONE, 0,		DSTR(0, 2)),  /* XX */
+	NPCM8XX_PINCFG(191,	spi1d23, MFSEL5, 3,	spi1cs2, MFSEL5, 4,	fm1, MFSEL6, 17,	smb15, MFSEL7, 27,	none, NONE, 0,		SLEW),  /* XX */
+	NPCM8XX_PINCFG(192,	spi1d23, MFSEL5, 3,	spi1cs3, MFSEL5, 5,	fm1, MFSEL6, 17,	smb15, MFSEL7, 27,	none, NONE, 0,		SLEW),  /* XX */
 	NPCM8XX_PINCFG(193,	r1, MFSEL3, 9,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
-	NPCM8XX_PINCFG(194,	smb0b, I2CSEGSEL, 0,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(0, 1)),
-	NPCM8XX_PINCFG(195,	smb0b, I2CSEGSEL, 0,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(0, 1)),
-	NPCM8XX_PINCFG(196,	smb0c, I2CSEGSEL, 1,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(0, 1)),
-	NPCM8XX_PINCFG(197,	smb0den, I2CSEGSEL, 22,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(0, 1)),
-	NPCM8XX_PINCFG(198,	smb0d, I2CSEGSEL, 2,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(0, 1)),
-	NPCM8XX_PINCFG(199,	smb0d, I2CSEGSEL, 2,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(0, 1)),
+	NPCM8XX_PINCFG(194,	smb0b, I2CSEGSEL, 0,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(195,	smb0b, I2CSEGSEL, 0,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(196,	smb0c, I2CSEGSEL, 1,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(197,	smb0den, I2CSEGSEL, 22,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(198,	smb0d, I2CSEGSEL, 2,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(199,	smb0d, I2CSEGSEL, 2,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(200,	r2, MFSEL1, 14,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO),
 	NPCM8XX_PINCFG(201,	r1, MFSEL3, 9,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO),
-	NPCM8XX_PINCFG(202,	smb0c, I2CSEGSEL, 1,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(0, 1)),
+	NPCM8XX_PINCFG(202,	smb0c, I2CSEGSEL, 1,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(203,	faninx, MFSEL3, 3,	spi1cs0, MFSEL3, 4,	fm1, MFSEL6, 17,	none, NONE, 0,		none, NONE, 0,		DSTR(8, 12)),
 	NPCM8XX_PINCFG(208,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW), /* DSCNT */
 	NPCM8XX_PINCFG(209,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	rmii3, MFSEL5, 11,	none, NONE, 0,		none, NONE, 0,		SLEW), /* DSCNT */
@@ -1548,10 +1548,10 @@ static const struct npcm8xx_pincfg pincfg[] = {
 	NPCM8XX_PINCFG(226,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO | DSTR(8, 12) | SLEW),
 	NPCM8XX_PINCFG(227,	spix, MFSEL4, 27,	fm2, MFSEL6, 18,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
 	NPCM8XX_PINCFG(228,	spixcs1, MFSEL4, 28,	fm2, MFSEL6, 18,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
-	NPCM8XX_PINCFG(229,	spix, MFSEL4, 27,	fm2, MFSEL6, 18,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
-	NPCM8XX_PINCFG(230,	spix, MFSEL4, 27,	fm2, MFSEL6, 18,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
+	NPCM8XX_PINCFG(229,	spix, MFSEL4, 27,	fm2, MFSEL6, 18,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO | DSTR(8, 12) | SLEW),
+	NPCM8XX_PINCFG(230,	spix, MFSEL4, 27,	fm2, MFSEL6, 18,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO | DSTR(8, 12) | SLEW),
 	NPCM8XX_PINCFG(231,	clkreq, MFSEL4, 9,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(4, 12) | SLEW),
-	NPCM8XX_PINCFG(233,	spi1cs1, MFSEL5, 0,	fm1, MFSEL6, 17,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEWLPC), /* slewlpc ? */
+	NPCM8XX_PINCFG(233,	spi1cs1, MFSEL5, 0,	fm1, MFSEL6, 17,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0), /* slewlpc ? */
 	NPCM8XX_PINCFG(234,	pwm10, MFSEL6, 13,	smb20, MFSEL5, 28,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(235,	pwm11, MFSEL6, 14,	smb20, MFSEL5, 28,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(240,	i3c0, MFSEL5, 17,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
@@ -1563,7 +1563,7 @@ static const struct npcm8xx_pincfg pincfg[] = {
 	NPCM8XX_PINCFG(246,	i3c3, MFSEL5, 23,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(247,	i3c3, MFSEL5, 23,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(250,	ddr, MFSEL3, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
-	NPCM8XX_PINCFG(251,	jm2, MFSEL5, 1,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(251,	jm2, MFSEL5, 1,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(253,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPI), /* SDHC1 power */
 	NPCM8XX_PINCFG(254,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPI), /* SDHC2 power */
 	NPCM8XX_PINCFG(255,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPI), /* DACOSEL */
-- 
2.34.1


