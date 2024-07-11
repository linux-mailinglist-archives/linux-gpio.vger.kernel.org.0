Return-Path: <linux-gpio+bounces-8187-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B67C92EFC8
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2024 21:38:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E35EAB21C7C
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2024 19:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83024187351;
	Thu, 11 Jul 2024 19:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.b="bp/AacsS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SINPR02CU002.outbound.protection.outlook.com (mail-southeastasiaazrln10222017.outbound.protection.outlook.com [52.103.193.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7048A186293;
	Thu, 11 Jul 2024 19:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.193.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720726686; cv=fail; b=qujOhU+BdOjLd2BiIZvL18lt1CDLxhPSdfHaf6TCWTpUON1kOW7P6x4jBqHoQ+6pkwt4A3rIVhfYnxTogUMZVlnH+ZpjrCcqn19dE+6YAAKUv/3hV8+uC7ZKzABuW4DM0YgUPslRcsfBagyH/93DP/ZFZHs/mtH9BiwCYflgxcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720726686; c=relaxed/simple;
	bh=MCOYO1KztBKwB/5rsGY+cGuZsfeg16+nCsOKU2OPlFs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mLp80PZgQ7elHBQxWRQdKvzMk0jkMkE7/xeNtubYEie7PtpiQxz/+elAlKxYfHxFKU6YLl6I/J8adSVBmhHldIUOWpYmCGlrEajiv+yeD86GRyxFWJqQE9fdaoUis46YxVcr1nxw5UU+Jnyo7kNyYH+JAZfeat++l+HTTMVUGM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=none smtp.mailfrom=taln60.nuvoton.co.il; dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.b=bp/AacsS; arc=fail smtp.client-ip=52.103.193.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=taln60.nuvoton.co.il
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LVvy2PtjysZOP8awn5/+8JE+H8WjC36PDFG/JNqFfjJazZYdfD8nd4xj3DvqCX26VoSD/btbdGUxmUQe+xnWJID8raClKk7GgsVVtDU4VeeH39PThoO8Lop3ptGkPqJp/GyK6JUaLay5yvEvE6gqLam/jOJKcTOQ5UtdHVKIHZXu/SzC4cwR+wPPSzMF0AOkSMkmhc20UUgxOZN/aCBPf+8yItwzUp0AWyH4WR9NeHdcan4uF15hPpE3r3EQowITCotJEtQTkaR3r3i9O9qD+7HeJSLL76vjd5smqG2P8TV/v0dii0RKBzLlsNX94gXEqqbIWWwEhTLkUuS4XaQtEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEd+JYGErg5g3QHkndSIiKI8xFgOmugh+X22Goveaqo=;
 b=ANTVx+y9ocgAXIA9/jqc8SD+kfTJTzFvAJP1DXwsiW156a0pFq4lFs3t06Kohpjgn5bTkSqImLjgslQEUmAMlRUa2tVt4co3nHe7m5zNvuVHKOU5flyKpX07gcbIWpyMZl3Z5F3wxNALb8ysirA/9TZ7U72GYjErvQ2dEVzP/u0zpNqf4iwL0dko8NJGncdSc6jnIpmzW0AHfC+/EEYKPIayxw9+T9q4J0jhNCZUM3TRH8uXrqCCZRPfCC0eEoUyGrj/nElvled+OMRYYtXqKmGOObLj5aG7yMHB1mATczeW4WQqnULdNs325CPcdsxXdK1RORxNVPgWFSC6INuXoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 175.98.123.7) smtp.rcpttodomain=gmail.com smtp.mailfrom=taln60.nuvoton.co.il;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KEd+JYGErg5g3QHkndSIiKI8xFgOmugh+X22Goveaqo=;
 b=bp/AacsSdiNqjJ/kscXu5m40n5lAoDEXYo5TMAj9lEaAKgoQ1FPd0WF3neKzdwOY2CCIFWKhDARKlY4wivvImBxoxk4+u2zwSRfTJg0LW3WTIp4GMkizDrsttYLBONzrsuSQ3R1sszXWCcQ6A5ogI75yGwHioq1KI2lp5zco3X0=
Received: from SI2PR02CA0018.apcprd02.prod.outlook.com (2603:1096:4:194::18)
 by KL1PR03MB7647.apcprd03.prod.outlook.com (2603:1096:820:e7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Thu, 11 Jul
 2024 19:38:01 +0000
Received: from SG1PEPF000082E6.apcprd02.prod.outlook.com
 (2603:1096:4:194:cafe::a7) by SI2PR02CA0018.outlook.office365.com
 (2603:1096:4:194::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23 via Frontend
 Transport; Thu, 11 Jul 2024 19:38:01 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 175.98.123.7)
 smtp.mailfrom=taln60.nuvoton.co.il; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: None (protection.outlook.com: taln60.nuvoton.co.il does not
 designate permitted sender hosts)
Received: from NTHCCAS02.nuvoton.com (175.98.123.7) by
 SG1PEPF000082E6.mail.protection.outlook.com (10.167.240.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Thu, 11 Jul 2024 19:38:00 +0000
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 12 Jul
 2024 03:37:58 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 12 Jul
 2024 03:37:58 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 12 Jul 2024 03:37:57 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 8F6785F66E;
	Thu, 11 Jul 2024 22:37:56 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 8F4C6DC0F7F; Thu, 11 Jul 2024 22:37:56 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <linus.walleij@linaro.org>, <avifishman70@gmail.com>,
	<tali.perry1@gmail.com>, <joel@jms.id.au>, <venture@google.com>,
	<yuenn@google.com>, <benjaminfair@google.com>
CC: <openbmc@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 4/7] pinctrl: nuvoton: npcm8xx: remove unused smb4den pin, group, function
Date: Thu, 11 Jul 2024 22:37:46 +0300
Message-ID: <20240711193749.2397471-5-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240711193749.2397471-1-tmaimon77@gmail.com>
References: <20240711193749.2397471-1-tmaimon77@gmail.com>
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
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E6:EE_|KL1PR03MB7647:EE_
X-MS-Office365-Filtering-Correlation-Id: 88f15a46-2988-4516-76d6-08dca1e0f8fe
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|7093399012|35950700016|48200799018|82310400026|61400799027|35450700002;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mz2w7+JEJkSk/8aeHqfd4B+Lr31sMO+WVKOxZ1tLId6NWbssJnJHBb0d0vUg?=
 =?us-ascii?Q?8FkbW7keePao+DghpcTxQrNvXgqLyt+tmGJtxmPBPTXzGRuZom1qQp/i7aEv?=
 =?us-ascii?Q?9btbIo50RFDQHkZ4OwY1MJqO/sV4qxybKID2rXn0k32BpmrD7Z86xat3cRd4?=
 =?us-ascii?Q?9BZyMUcRF1oeKBJv4XOpzrubO2T3qxPieM/CMR6HKUkP9RTQ/NBZcrPuEOk8?=
 =?us-ascii?Q?HgvBssEAVZrunact2vWL/A/tharmpZU5IUDMGtg8WHiMZ9N+ysZcL4TEilc6?=
 =?us-ascii?Q?sbVtDbNhBN3HwnV2GuOysj19xXTRTqAifvSUqJQu+cmFuVpWA+IdR2V/tH2a?=
 =?us-ascii?Q?6kZbhaOzv/Dm50j7jcLHGN8qgyzQkRrx+d3lE4kwxeieU9zUVhr+UeZbZEyp?=
 =?us-ascii?Q?+kJfX99GwFCTGZEsPuVHdQiNHhAL1Ua/LPDUbcbsuMnDnIQaYkg5PoycqReg?=
 =?us-ascii?Q?FlnNHpw5pnTb8uEzVuri6yL4qc9egRrvlC56+VDVAD/56LIb4juFhA8ewvku?=
 =?us-ascii?Q?Zp7GydniV8td7kPBB2Va4zd/nZ7UkT469hsGzHa7rgZb6TSZry08eQ6TzsM1?=
 =?us-ascii?Q?I99SFoa0ztDRw+B0MvqE3De34W2NU9igsbOAE5d1ehgZvLz0wdxdLPTBZNcb?=
 =?us-ascii?Q?Y/cqkvN3iqTgI8ylkuUjMIwJt1oYKrMWVAdoa/m3uJgrW360dNsVSVZGEBMd?=
 =?us-ascii?Q?rLH3wudpRpiTHIOYHW40TkYyJZ496R5QpvJCSF2Xzbu/+Btgz5lyBT4/wKCg?=
 =?us-ascii?Q?75ktE+1AQx6uCMiYY1biTUYNMYciI1RpWNVQwLwBv2RpDpopPPM64/I7dAej?=
 =?us-ascii?Q?wyxI9IqTfPI6CQXNJ1KGxN2nATlsKodgCXE3h7Q8mDJRmSHkpn4u1dUzAFUh?=
 =?us-ascii?Q?I3avq09hJpV7FdZuP6e6iyzHYymfvLzCcT4nogqIj87m5Y7w+umVPr8S6slu?=
 =?us-ascii?Q?NHh46wyTqwtkHVkMsWIq2mEmRWENC6M4cHh8U1g+HC3MHL94phF4M9ucDq1F?=
 =?us-ascii?Q?97pVXie4F4+0Oszt4wcSvoTlk0vJSMLMBCyLN5YiZC2ZGzH1u6LkETC7uwX0?=
 =?us-ascii?Q?AP3fUK4EWrQJYmu/XA/+JMtluc9C4K0HqkZsFKPADVQ4uwNS7S1KPKwD4MVh?=
 =?us-ascii?Q?/jlVloR/Yk1+gVLUP4WsaWptR6FarvqbwPmGaaXWAeDT3ORHsHqKYGmLTBhE?=
 =?us-ascii?Q?MZf9c/i3oSPCDSjRN0axq6bASVXmjrXc1nRwsIAWclTSRnEhGz76N19Lita9?=
 =?us-ascii?Q?2z8v6amwyHf1fTIPUiYH5K7+IjDAZAq3agvtpuXWbzLJpeW2X7FOMcNMRViZ?=
 =?us-ascii?Q?F+PTY8QHy+0XZS4ns48iMAaIjZ5WjQQIJOcw3r3YlQcA6OYWq2zxWKRPmx0T?=
 =?us-ascii?Q?1MNtjuyCaWeb+zZUMA3kBGiprRqCIvTGxQ6oTtBLFHtL5WgdRrHKHgB+pSxD?=
 =?us-ascii?Q?N50VhHPO1+WesiFhlqXH3z6eWH+xwWLeeALKFF4zl7Zlku3+4gj/Ow=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:175.98.123.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS02.nuvoton.com;PTR:175-98-123-7.static.tfn.net.tw;CAT:NONE;SFS:(13230040)(7416014)(376014)(7093399012)(35950700016)(48200799018)(82310400026)(61400799027)(35450700002);DIR:OUT;SFP:1022;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 19:38:00.1002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88f15a46-2988-4516-76d6-08dca1e0f8fe
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[175.98.123.7];Helo=[NTHCCAS02.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7647

Remove unused smb4den pin, group and function on the Nuvoton NPCM8XX BMC
SoC.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index f342aec3f6ca..396bd07e7c74 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -438,7 +438,6 @@ static const int smb4_pins[]  = { 28, 29 };
 static const int smb4b_pins[] = { 18, 19 };
 static const int smb4c_pins[] = { 20, 21 };
 static const int smb4d_pins[] = { 22, 23 };
-static const int smb4den_pins[] = { 17 };
 static const int smb5_pins[]  = { 26, 27 };
 static const int smb5b_pins[] = { 13, 12 };
 static const int smb5c_pins[] = { 15, 14 };
@@ -700,7 +699,6 @@ struct npcm8xx_pingroup {
 	NPCM8XX_GRP(smb4b), \
 	NPCM8XX_GRP(smb4c), \
 	NPCM8XX_GRP(smb4d), \
-	NPCM8XX_GRP(smb4den), \
 	NPCM8XX_GRP(smb5), \
 	NPCM8XX_GRP(smb5b), \
 	NPCM8XX_GRP(smb5c), \
@@ -949,7 +947,6 @@ NPCM8XX_SFUNC(smb4);
 NPCM8XX_SFUNC(smb4b);
 NPCM8XX_SFUNC(smb4c);
 NPCM8XX_SFUNC(smb4d);
-NPCM8XX_SFUNC(smb4den);
 NPCM8XX_SFUNC(smb5);
 NPCM8XX_SFUNC(smb5b);
 NPCM8XX_SFUNC(smb5c);
@@ -1173,7 +1170,6 @@ static struct npcm8xx_func npcm8xx_funcs[] = {
 	NPCM8XX_MKFUNC(smb4b),
 	NPCM8XX_MKFUNC(smb4c),
 	NPCM8XX_MKFUNC(smb4d),
-	NPCM8XX_MKFUNC(smb4den),
 	NPCM8XX_MKFUNC(smb5),
 	NPCM8XX_MKFUNC(smb5b),
 	NPCM8XX_MKFUNC(smb5c),
@@ -1348,7 +1344,7 @@ static const struct npcm8xx_pincfg pincfg[] = {
 	NPCM8XX_PINCFG(14,	gspi, MFSEL1, 24,	smb5c, I2CSEGSEL, 20,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(15,	gspi, MFSEL1, 24,	smb5c, I2CSEGSEL, 20,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(16,	lkgpo0, FLOCKR1, 0,	smb7b, I2CSEGSEL, 27,	tp_gpio2b, MFSEL7, 10,	none, NONE, 0,		none, NONE, 0,		SLEW),
-	NPCM8XX_PINCFG(17,	pspi, MFSEL3, 13,	cp1gpio5, MFSEL6, 7,	smb4den, I2CSEGSEL, 23,	none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(17,	pspi, MFSEL3, 13,	cp1gpio5, MFSEL6, 7,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(18,	pspi, MFSEL3, 13,	smb4b, I2CSEGSEL, 14,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(19,	pspi, MFSEL3, 13,	smb4b, I2CSEGSEL, 14,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(20,	hgpio0,	MFSEL2, 24,	smb15, MFSEL3, 8,	smb4c, I2CSEGSEL, 15,	none, NONE, 0,		none, NONE, 0,		SLEW),
-- 
2.34.1


