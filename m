Return-Path: <linux-gpio+bounces-8196-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA7392F322
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jul 2024 02:41:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CCC01F22F40
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jul 2024 00:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F1E123C9;
	Fri, 12 Jul 2024 00:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.b="YCqdmDHK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SINPR02CU002.outbound.protection.outlook.com (mail-southeastasiaazrln10222016.outbound.protection.outlook.com [52.103.193.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D3C20E6;
	Fri, 12 Jul 2024 00:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.193.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720744885; cv=fail; b=Tee5cWIlFukWkEAOoFgqPHr+gCoB5XF5585R6udxeW4wzX1loSujEpsGHElRW5APMa0H3rupd2a4u26c8cZrJjsdEh550NywZYwFxMTxvXyVuBwuxDwQKRXccGaz7rNARZFTkTimkbRUSsLj+Jc3OVUSGSXooiughHShzhTdw0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720744885; c=relaxed/simple;
	bh=HXTaTnO7Cz/NhxsO2sOdQ3oZvjIRhhtLV97PvT8kfg0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Hk6ySVzuP0L8+B3GuGQJKDDidyjis75cy/3rq4VQGPSpsux16EiVRD2/MwdLgxOq6PJtHxabLvyyeqyT+QQFmPlLFq9S4w5CP6Ys+DFbXPtNaQHdSc0KrqfOfTGcv+E+d3oOtmyaIcWRRgQUMaoV3vkYfmy/aDZbRnc2ywbrC3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=none smtp.mailfrom=taln60.nuvoton.co.il; dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.b=YCqdmDHK; arc=fail smtp.client-ip=52.103.193.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=taln60.nuvoton.co.il
Received: from SEYPR03MB8127.apcprd03.prod.outlook.com (2603:1096:101:165::14)
 by SEZPR03MB7374.apcprd03.prod.outlook.com (2603:1096:101:12d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Fri, 12 Jul
 2024 00:41:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lZ+pkc2FVWXfe9h9OwjdaKdyM8BGv+NNAw7DPAjG0dtsP0XkEzstXVkeqLmWH/a8a80ecCHTJUVThvv4tq7ynov/UCXkBcFHmpgvZcZonP2mWuzl+0G5t9/EMxgW13NjvKgcBtvHR7M3ag+MQ0WYk/p9nTI8veCADRv9Tn5Y7XubIlbIJ9bAMBDSyBKXqzM3WCrT/a5cEp2FxoGnxPt82VmQu+JcxboG7r/xXQ+AbvDjASgN3FlSQMH+OQaoW649Yl3NM41i3xDwwz6FgTiFOh/BS/QgyonUqwAIGHHJi3rttfZHK6Y6UzAHqEe80zGeHGsSzGSS3akG87d4DOad+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VN0rAmqtSR+5kos7IlkgtstO7mq9ZJ1jiyJqKqvXeS4=;
 b=aM/qRFNcURXZWO3yZiqD7gtEWVbpoUOqX1KIoSB+2rw3QQgL1hxPdKOt8ufS/B3RWvvJKjG2hbdPp3c4ruWz6V94UojaX5HSiKhxVQZ7ngLjIJ9nuoDItnOmdrUtYwnkVIItwTsbtlllMrCpS9cRc4xiEd+rlMVB2CZ28vCZlzzYjNQKO5I1eYMBkh28BwGFhNI++gqzgn9oiwTLOnbxn2cykoNYuo+labSi+hVDJ/9VlRo1GYVrBMlYntCYlqWAoKP8J+bixVTpQTVDQVRF3J4SUv2HcCANZkRDJk4RGS1P3DShQ3vQeX6DCZPGAEwIx+b0drzOZduvNo7ImSErzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 175.98.123.7) smtp.rcpttodomain=gmail.com smtp.mailfrom=taln60.nuvoton.co.il;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VN0rAmqtSR+5kos7IlkgtstO7mq9ZJ1jiyJqKqvXeS4=;
 b=YCqdmDHK5FRPG37m0QssNwMjlK2ONg3lyZLrSETxczKpdiny0Q4Pkn/inaBLF65RGcsOwpa59VitzAOS+vxIVSEUAe73uI8iFeR40mLF2fDSa1dq0MeGdDt7G3QlGK9NX3wa3Dxa5o/CehoZWuKxkFTXz194ivvkK2P3gsMWzTA=
Received: from SI2PR02CA0003.apcprd02.prod.outlook.com (2603:1096:4:194::13)
 by SEYPR03MB8127.apcprd03.prod.outlook.com (2603:1096:101:165::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Thu, 11 Jul
 2024 19:37:58 +0000
Received: from SG1PEPF000082E6.apcprd02.prod.outlook.com
 (2603:1096:4:194:cafe::76) by SI2PR02CA0003.outlook.office365.com
 (2603:1096:4:194::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22 via Frontend
 Transport; Thu, 11 Jul 2024 19:37:57 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 175.98.123.7)
 smtp.mailfrom=taln60.nuvoton.co.il; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: None (protection.outlook.com: taln60.nuvoton.co.il does not
 designate permitted sender hosts)
Received: from NTHCCAS02.nuvoton.com (175.98.123.7) by
 SG1PEPF000082E6.mail.protection.outlook.com (10.167.240.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Thu, 11 Jul 2024 19:37:56 +0000
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 12 Jul
 2024 03:37:55 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 12 Jul
 2024 03:37:55 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 12 Jul 2024 03:37:55 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 4743E5F66E;
	Thu, 11 Jul 2024 22:37:54 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 372A7DC0F7F; Thu, 11 Jul 2024 22:37:54 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <linus.walleij@linaro.org>, <avifishman70@gmail.com>,
	<tali.perry1@gmail.com>, <joel@jms.id.au>, <venture@google.com>,
	<yuenn@google.com>, <benjaminfair@google.com>
CC: <openbmc@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 0/7] pinctrl: npcm8xx: pin configuration changes 
Date: Thu, 11 Jul 2024 22:37:42 +0300
Message-ID: <20240711193749.2397471-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic:
	SG1PEPF000082E6:EE_|SEYPR03MB8127:EE_|SEZPR03MB7374:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b58f4bf-1c8c-4291-e02f-08dca1e0f6de
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 1
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7093399012|61400799027|7416014|48200799018|82310400026|35950700016|35450700002;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?RjGciAUdtxNB/bwoifRm5nh9eRAKyDmTPaSRBHki//Rej1vWcBWJ0sFrSAAk?=
 =?us-ascii?Q?c7aa2E+9ONROofC+QW0b6tBtLQNdXsT5IVdRxZ/eu25qunMj0BwRQzP28OGa?=
 =?us-ascii?Q?Cp9SJTIDt+FC1UByQRAJRSWKnsfrkx/YQrkrdmq9GpdHPq0l8gQKAdgXWxua?=
 =?us-ascii?Q?T68L4CM+IClRNp12gEccyBPh/4i+liHiV4NWQTwUyWLx+usHBUr02kecP+my?=
 =?us-ascii?Q?VIdjS0UdfQJD+vCiCxhImWFkUCzI1fbqoU+8K16fHUmSPoipk7gK6hNT8Tt6?=
 =?us-ascii?Q?OtJYjilMMpkOjC5RuvWgc6bsIJTN21KDq9W90bnxONUMhpKBFCKZExIP9wf8?=
 =?us-ascii?Q?GPCKuM8Ovmtz7x0zGSQ+YrlKEHddqKbuyYgzHX7/6ZyTuYee+LvTJTfMsLxt?=
 =?us-ascii?Q?brmG9ErfWxpxrzFEhxcMtRze2DpmFcqfZZQyxfzOK3sfsTC55tuSWRMdZvqO?=
 =?us-ascii?Q?JernhY38GjiVhKwUdUhtRlvyTkDn4Lkp99XT+XTlRZ5FkoKkP30bMzuV/yzi?=
 =?us-ascii?Q?gSvTQEqp5AkPhvTNsrWmLeIxDvgpabPJ/lVI+mZMLHoKV9p6Jcidqjz+Cfrz?=
 =?us-ascii?Q?5vWg9OJ1NSDNGAhDWM2/jGkG/H8f9y/jkAvg7uGb5CFjjbgqQy9b4zlBOB97?=
 =?us-ascii?Q?SVUAl9ihqnM/1dZW4ItZ5MqRBMMq+g+pFgFFn01Kq9OInBrSuLa76azEAN1J?=
 =?us-ascii?Q?vRWO4NWjpfM/6TGRsIO+WUVXgPXBVCundzpdA/OgHfaEEmv4MBhV1X+B5cim?=
 =?us-ascii?Q?ziPz8QIvj0UNlvNHPDcP8a3ebuZcSqESYq1EkSUBp+GfswcntfaznLwDg5Xd?=
 =?us-ascii?Q?HbgQzw4iDZrnZfnIdkg83063adi82aPhfqhVNQboT37qgJpZua2laqrywiGD?=
 =?us-ascii?Q?I63QYreY25N5vWnYLBB005wIYTq1NBjEcsDe1THYKQp4PCREor+VKMmtXtUW?=
 =?us-ascii?Q?cqzQYU3D42I27rehO+ZQKxBWUtBC4wh5ZQ9SZk1HKl47h21mrvTA8RUerIL7?=
 =?us-ascii?Q?CeAcYR3a6vqy/pBNUAr94XHN+eEojys3jnqxN4sq8Ci7xtj5x41EIzMxUAO9?=
 =?us-ascii?Q?yURFMn7T/8BUrEs1jJvetxVZK1KDq+mTie6gJjRfIf727iOs6K9/hRbuhbGj?=
 =?us-ascii?Q?EHg0SIMKNwhulKFEp6Yly9icmIU9FdeuMNQnHKRDXggXib2cdbIdZJ5UsjMA?=
 =?us-ascii?Q?UbxWIIV0fWqJpyRf+cB5JJiSdDpZh0iWN+r/hFozKKIXErjs2zh0wIhDz63C?=
 =?us-ascii?Q?SKyfDkGi+oSQva80YD4O0BiBQB1xJLL/kPMTq5NMad+Zin3DD2zoUC1XVOR4?=
 =?us-ascii?Q?vVxRGDfNSDFmYy3r1D6uDigkq36tZwpysha49oBaeNxQuBgRrO/HDAPbngA3?=
 =?us-ascii?Q?IZBUoxLCyWmI7JRJIZ9msBJ8PRIRV1QgJ3xAb+48xVQwS59svZMPxmQjKGVV?=
 =?us-ascii?Q?hvkB1V5JHkN2lVs5ZUzNIeDkM384+uBDUwPS3UtQN8ngKVffw2T+Lg=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:175.98.123.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS02.nuvoton.com;PTR:175-98-123-7.static.tfn.net.tw;CAT:NONE;SFS:(13230040)(376014)(7093399012)(61400799027)(7416014)(48200799018)(82310400026)(35950700016)(35450700002);DIR:OUT;SFP:1022;
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 19:37:56.5378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b58f4bf-1c8c-4291-e02f-08dca1e0f6de
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[175.98.123.7];Helo=[NTHCCAS02.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource:
 SG1PEPF000082E6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8127
X-OriginatorOrg: nuvoton.com

This patch set addresses various pin configuration changes for the 
Nuvoton NPCM8XX BMC SoC. The patches aim to enhance functionality, 
remove unused pins, and improve overall pin management. 

Tomer Maimon (7):
  pinctrl: nuvoton: npcm8xx: clear polarity before set both edge
  pinctrl: nuvoton: npcm8xx: add gpi35 and gpi36
  pinctrl: nuvoton: npcm8xx: add pin 250 to DDR pins group
  pinctrl: nuvoton: npcm8xx: remove unused smb4den pin, group, function
  pinctrl: nuvoton: npcm8xx: remove unused lpcclk pin, group, function
  pinctrl: nuvoton: npcm8xx: modify clkrun and serirq pin configuration
  pinctrl: nuvoton: npcm8xx: modify pins flags

 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 64 +++++++++++------------
 1 file changed, 31 insertions(+), 33 deletions(-)

-- 
2.34.1


