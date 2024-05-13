Return-Path: <linux-gpio+bounces-6333-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE378C3FEF
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2024 13:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6CB4B24192
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2024 11:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0C3714F11D;
	Mon, 13 May 2024 11:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AMEW9hYw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2089.outbound.protection.outlook.com [40.107.21.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A30914F106;
	Mon, 13 May 2024 11:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715600266; cv=fail; b=Psi51Lc15+3NSCdzl1cV3kmoKN8GGdeUzIrNTIWLPlZY4p9YtPq9Q2/iUZxbnodsfhEXn2MZgGZypAZek+MLwVku6UgoF9+tNu0IUSI0DAnMgajPpiTNUj1xKJ0c4RYk9aWabwFaeL+DHDEA84dZbtEJTOYnKKnNNrz5qoMhAdQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715600266; c=relaxed/simple;
	bh=6vI6esihawUEAsMpS5AmmUzpDZmYxlKj+KMmJXgWIqo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=YKHbM3xraM2yL4hcjpDvudb4C5gL142BMF8Avc9AeLtRadQ/xWRJTe/eEAeZtA8ODMk37HzznGmwp9Xo128+EIPwEciH1AUgx9sIWKhT+42QV+NDltlX+zyPoQ/1YGEmV3ygZm6Tj0LXJ4WiBjr1pNvh4/BZVv9XW5TdwHw7uHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AMEW9hYw; arc=fail smtp.client-ip=40.107.21.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GexCZOM27I+JEegX69g84sKSjynLHS70YN6jS5uAZixwDIFRJ2QrGr0tfPbHIDz4+E0lwUIvZIZjx3WsWvJbBbNqToTm0CFuV34pW4JtdUSvkvcVt1v1Vsn5/uY9kCHgcvzmxbejOO4YpKn1ku7uG1reDDe78cHw1CGUcri7EaySA5prOlhTU7IkY5uFcFCDTGL3ZMHk+GxjUGMFQbWnd1t2ysiDCikIhIORCLzA+jfYIkr4+mDkoIOrgDoKpJ4F0oQIz4xlqkJvPm6TcTXMdz2NNFyRlTXO7zJheCYHC/NRgfmTIetwTL9RkqhK9Oad8eEEJefZpBekmoV0BpdOLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BSpuIAfuDc9u8B2QwCMoSNaXFE4wvMyesjB0lNEUwr0=;
 b=NU0TP3uxl+UFI2YMQsTyREePaP4+WLxjZd7RtzjFm7Ke+45IEwF/G91tQja+I05x0G+OI8qz+L4mLSMx2Q863Ux4rPlTyltm4wvnCO96ZLri6GkGXgCAK5iSmGIyEG15pe7bawiNlC2NZENjogqH46mLormbk7yZCVnV0punWxjBS3Cdmf5bIhMpzrQyh1vmPdmhic27U472PKdxDiNJjKHROTdJOf9Ef9zD/WhEflPhNX7sFS4R+mw19iCTQ4E+eOotfkCBbgPrLbVDlsGV64cIuwLb1t/SW89Z3GJwHw2Q/XAMr/YlJNMpCLFsiRbo2HGGEFTHEZhmnyeibQHV2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BSpuIAfuDc9u8B2QwCMoSNaXFE4wvMyesjB0lNEUwr0=;
 b=AMEW9hYw8MVvMdnJQiNW3nY68BaPGnngsaBidUpu+KK1nnXRH2o9H5u8bXHMHctZUnDHcoz1vhDhLUAKdpPmUzRPMhk+HeVavnDYrUXNPVVo0EKv80dCOPraIoBZjCNw8NH8qLs23q2n0GMCjbfTHwe5OTcYFD5SIINAzXlDBK0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DU2PR04MB9116.eurprd04.prod.outlook.com (2603:10a6:10:2f7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 11:37:41 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 11:37:41 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 13 May 2024 19:45:25 +0800
Subject: [PATCH v6 2/3] pinctrl: scmi: add blocklist
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240513-pinctrl-scmi-oem-v3-v6-2-904975c99cc4@nxp.com>
References: <20240513-pinctrl-scmi-oem-v3-v6-0-904975c99cc4@nxp.com>
In-Reply-To: <20240513-pinctrl-scmi-oem-v3-v6-0-904975c99cc4@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715600734; l=1313;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=gKhGtuOf4rXyBBJYl1QLNqh0NrD/5voNP3TjnJqoeg4=;
 b=PT9fuNeAg28LPF2WPAHMyR8igYZ0Kvvt7jiphFEHqnUDyDI0iikMC2n8A3b/DAMnBiDP92Ruk
 nUtikJfi7d5D0oq1SQyopgXHBRHZDk64/6Msg7EzpiFEW95tk1+tpXj
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR03CA0089.apcprd03.prod.outlook.com
 (2603:1096:4:7c::17) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|DU2PR04MB9116:EE_
X-MS-Office365-Filtering-Correlation-Id: f938c3a4-74a5-4984-2a37-08dc73411913
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|7416005|366007|52116005|1800799015|376005|921011|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YUdCMWpscGx5ejNCUDVIN3dXNkxMYlN4WnVlcTNxRmtwMFROV0NoTEluYkhC?=
 =?utf-8?B?YVBRTHZZQ0l1eDE0a3NTZWRKelpWbUsrZUpnNE9Nc01IZ0t2cVdJbmd4emR6?=
 =?utf-8?B?S1d1MVV2R0U3RjRwRUVxNmJ3S3FXNm9odzI2MnFZMzZvYk80Y25EQmJUNFR6?=
 =?utf-8?B?Q1VTVXk0THp4YnVFazZnSWlyZGltR3V3RVN5bDZrZG9PTzNDcTVSRGloN3JI?=
 =?utf-8?B?QzlGMWhmR1RxY2s1V0tzaDE3UndabWhWN3Bvbm1nZ0RFZW0rVXY0UlBCbG9y?=
 =?utf-8?B?VFNpc1RXQlBWTXFWNng1YWk4bW53MDlrRERQaVBhVnptWCtFY0VSVWdDS0FV?=
 =?utf-8?B?Uno5TWZycHQ1SzQwNjRuY1ZPa0JyNlI1YVhqV3FEazl5UVFWSXVhTFB3VG9E?=
 =?utf-8?B?STUvaXBucnVMcnd4ZTBJODNQK2FWYWpIc0pxTmtHK200S3Z1WDdUaURRTnFj?=
 =?utf-8?B?cXNJM3NXcUNteitlQmdxRTllL2pERGJ4Wkhmdk1TQTBWQWR5ZXBnSWIzSnA1?=
 =?utf-8?B?UHdYY2dUc0dtM2tyUTZtYVg0UjF6SXNrSzcxSTJBa1EzV1JqU285K1VhTGFI?=
 =?utf-8?B?RWpYYUpFYzJzRnhhQlhSTXc4ZHRyWHNHT2J1TnJrSUZpcVhrWnl0TFcvaEl3?=
 =?utf-8?B?WHEybEd0RnAwOVgxcjlkME0vZW1GaXJoajZSbFp2c2dCcGR1QlFmS0Y2V2VZ?=
 =?utf-8?B?MGdXVDkrWVdZalBMR3NCdmlqQ2kyd0Z2ZFFjUGZ4ZE5zcXhaazVOV0xhT3cz?=
 =?utf-8?B?bHZqQi9rblBJeU5sQTVlMkxGaUx2RkN0dExmSWZFQVdiTVkvdExoMUJuSG16?=
 =?utf-8?B?NDV6SVo1YXB2WHE5YWFXQ2t5d1lCRm56UnZxTy9HVmE0Umh4aUlrMjZJUHls?=
 =?utf-8?B?U0pMMVdUcXRScU5NWDRaOFJ3M0srVWhWWUZGZVVnR0UrSmJKcmJ3bWMzSGNE?=
 =?utf-8?B?U2c5NjR4a3VuTU15SWxISVBDMDcva1JFd0kzRURKeHdxRFJCZFMwNkJDdVln?=
 =?utf-8?B?bGVKN2FyRVVYMGE1R01KQktsU0pDazFPWi9VV01JYkZJNlJveEFIY3hTL2dN?=
 =?utf-8?B?eTNTV1YwSXFoL2hNRGx0TitkaENMelNrZmNjWXNvTy8yS1NXT1p6anA4QTkz?=
 =?utf-8?B?SjZHaDJpMFFLbmZIZHRGbFFYM3UrTVpKcElTSFRJL0lkVG4yQjZZVm8wMlg3?=
 =?utf-8?B?OHJHMDNhejFhc2hlL2FuUjFIWmdQR1dzNWRndVgvVnlHRmlLK0txN0FydENi?=
 =?utf-8?B?Q2oxTnpRWXlQb1BHU1VBTDRrTTUvSWJrSExzV0Y5VXFMNEV1SC9ERFY3djRl?=
 =?utf-8?B?Y2hrdy9Tem5QdzF5UHU2TXRWcHd0ZW9DV2g5b0FpOHNucGZxRm5tK254dmVi?=
 =?utf-8?B?ZmFxeUErNmNQdjJleGVwbXUvTUduY3k4WnFFeXZXTHU3Y3d2UjRzVUM0eGtP?=
 =?utf-8?B?Smo3RGRSRklaaFFqY1MvZVRFaDlZK2JTQWlhcGZRRjRpenNNTlNEelBGUFJD?=
 =?utf-8?B?Yk45RFlDb1QzRHg2QURyMXFrVEwyQVpSbVcwOEMrcW4wQWJ1Smx3R0hucy9C?=
 =?utf-8?B?SWhiTmxwcnV4ZG9qTjdHcThtTlpPdVpLUTJraFF5WmlGS2RadWNQdXpmOGNO?=
 =?utf-8?B?MWlkR0hoamlFZ0NUTWZkUUxYams1UHRxRmtYY09rVC8yU2UyK0srQkJsK3A5?=
 =?utf-8?B?WXVyL003OHl1QVBCY1VHaXFteXA1aktndkc2dkxTWE00cVI0bGNyUjM0anFY?=
 =?utf-8?B?NnUvdXc2L09WaG5uMkFpTERXQ2FwYlZXTmFBN0w0b3RKMGNYc0JUVk1oczJQ?=
 =?utf-8?B?Y2c5TkVYZ1dRcnlscVcrdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(366007)(52116005)(1800799015)(376005)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YStqU3p0Sk9ZTlByRUVpSExlUkxsY1dMUytGczliakoyalN0MS9ZTWNpVFhV?=
 =?utf-8?B?V1JielJLOTJzQTFFcTc3YitXb3JTOVRHbnZjL1VkZ2g4cmJTU2J6d1NvaHdG?=
 =?utf-8?B?a05QS01zczhCaTJBMVBGMk54OHZPZWRSeW9iQzhCYkxzRmJzR1ZMWmdzNlBS?=
 =?utf-8?B?U2ttMWsxanJYbkppa3lJZjdlMEE3eEd1UjhwR0o1KzNUMm9SVm1qVDRXY1VJ?=
 =?utf-8?B?WUlOTklmRzdQeTBOWW83bVRncUdIQU1YSVd6RkNvaEE0SzFYbmtuT05MRGVy?=
 =?utf-8?B?SlFRYVlhQlZ0VUF3ZWlSTmlhWEI4djhvQ3dmTnVJaDMwZWlHOEtzMjI5blRs?=
 =?utf-8?B?NlNuSmJESGx6MVhISE10dkFyNEFkTjNCWFJTZTNDVHdJTnBuWGhCWGpyTzFL?=
 =?utf-8?B?U0t5NzlocmVEbWplblJzdEZxQTI0TDBDbyt0ejhpUEFvK2E1SDVuZVZvMXNn?=
 =?utf-8?B?M21lTkc4dmlLcDdVZCtDT3oxbzQyNGtwdmhHRDh4WlRJdzVzY2N2RjA3azVY?=
 =?utf-8?B?Vms4VEpGSTNIS2orNzVITkVUR0tCUjRndWdlbkdVcnRQQ0NyR2hISjhwS0w4?=
 =?utf-8?B?QmtoWEloZ0tRaWlYODdsN3dmazlFS1ZWQys0QldCM000YUFkOGh4L0lKcEFj?=
 =?utf-8?B?Q0FwK1NlTHN1MGxQcVFBcWxIbEZISXNXY2JNbitYWGVEYkNBTkhJVnZHcytj?=
 =?utf-8?B?WmtwL0tDTTI0WkNxUVdWbzQvQjZXMlFINFdvRlIwYTBpTXlLM3BtK1lya25R?=
 =?utf-8?B?MjQ0N0dRNURKcklHTVJDeXJyaGNZQy9aeWRhb2EzeWlFcGxnS0JBR0p1V3hW?=
 =?utf-8?B?OGVHc2RBWEFuUzhDUExpcWhTZ3pmU0hhWHJpdEVJVXdNRHcwcGZCU0lzRUlS?=
 =?utf-8?B?MysweThMQUw4N0lzRW9IS2g5Z3BYK0ZIeEEwUldZd3p4OWxtNVNXV1JQV01Y?=
 =?utf-8?B?WGs2cW5uN242TERyNEVFaytOUzNqdmgyVnVjTjI0RjJFeTNrdW5LOUQ1b1dV?=
 =?utf-8?B?ZEV1cnhPS1NEM0E4Z2xSRXd1Nkk1WWV0ZWRPUG9jbUxXSllEc0FQM1YvUTR1?=
 =?utf-8?B?aXFEcW9vWTQrdTdraFBYTGtNQUhUcXVIMnU1WXduWU9PbjZnRGhjTnBZVEN3?=
 =?utf-8?B?OGtKN2wrQ1hMclRzNkdnYnhwSzFKMU9LRHlIVEl3b3FBMy84cEpRNDJXdVBZ?=
 =?utf-8?B?MGkwSEUyV1VGUC9WNHNtQ2RGTlZvdTFKbXpSanVycVhHaWd1WkxpeUl2ektr?=
 =?utf-8?B?eUVyWkJmQUtXZzJLT05zMWFlNnh3ckJKbVhYaGFhY0tHbHIzbk5ocVhxMGFB?=
 =?utf-8?B?UVpTQmREMWNXK3FvMU9XeFVOWmI3TkxYT3JYNC9SMktZUlhtMHVBWVBhNDBv?=
 =?utf-8?B?SHgvNVdZRHBIVko4UlB1UnZ6bk5sWGhSUzd2YUlSK0hzbVI4Um1kbkVYTGhw?=
 =?utf-8?B?eGNOdU85ZTg0UW5ER0dVUjQrVDUyT25aWnpCSHVLQlpIYW1kWEJqSEkrMXpK?=
 =?utf-8?B?MFkwZndnYTRmU09YbGI4a1J5RkJ6aTFTWGd1Mjd4dWFaZzg3ZTZGSUNoYStQ?=
 =?utf-8?B?SDFyMkcwaEVZdkpjWGFqNVFQTk43MHQxRjdVR0l6YXRCQ0tUVWdKaWdzeEda?=
 =?utf-8?B?NWt1ZzhVQVVLUnkrczA0VndMTkYvS2pjNWtmTVQzakthWVVQbTNCcmcvQVRP?=
 =?utf-8?B?LzJvL3BTbGhvc0pGODR6eDZSeDVzQ1NtUExmcDlIMU83VzRyL3puNXg1cjh0?=
 =?utf-8?B?cUJ0VUNKeGU2Y3htMTBLRmJqUEFLZ0d4V0Q0b2Z2MTg5NUJDcWlwQ2x4QWRR?=
 =?utf-8?B?T0pWN3YzYlhiem43MGdPaVBidWtRNHk3R2ZVc0ZtOW50K2ZNUTZEZXJ2RGcy?=
 =?utf-8?B?L0RsUHpqWFNXbTV5TU1uK2JIb0NXR3pVUEtxM0NsRHFER3YwREREdkhWeGp6?=
 =?utf-8?B?TnFQZGo3TklUY1hWVHN0VmVSdkhGOG8wNW9HdDM5MjdVNXlvUG4vTjEySkZC?=
 =?utf-8?B?RzZQcHNxM3BCS0NSbThEU2FJN0xXZElnSkFPc042OU02WmkxR1FKTUhTeGMr?=
 =?utf-8?B?RUx0V3Z5cTFqR0RtSFJoY3dkTXBiRTA0QnkwNnJHR1F0TmFmVDlkeWk1b0NJ?=
 =?utf-8?Q?4xU7GrN7QwwlOGF3GgZlXUwIH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f938c3a4-74a5-4984-2a37-08dc73411913
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 11:37:41.1533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2yfW6Jr73Q2AD1DL2P2x+0eLkSGeF97sXSRFYsDxIpePvyILCpC0qNlz5tRmf0ddLDnktW+sTFUD9hkAtz0NbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9116

From: Peng Fan <peng.fan@nxp.com>

i.MX95 will have its own pinctrl scmi driver, so need block
pinctrl-scmi driver for i.MX95, otherwise there will be two pinctrl
devices for a single scmi protocol@19.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 036bc1e3fc6c..df4bbcd7d1d5 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -11,6 +11,7 @@
 #include <linux/errno.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
+#include <linux/of.h>
 #include <linux/scmi_protocol.h>
 #include <linux/slab.h>
 #include <linux/types.h>
@@ -504,6 +505,11 @@ static int pinctrl_scmi_get_pins(struct scmi_pinctrl *pmx,
 	return 0;
 }
 
+static const char * const scmi_pinctrl_blocklist[] = {
+	"fsl,imx95",
+	NULL
+};
+
 static int scmi_pinctrl_probe(struct scmi_device *sdev)
 {
 	int ret;
@@ -515,6 +521,9 @@ static int scmi_pinctrl_probe(struct scmi_device *sdev)
 	if (!sdev->handle)
 		return -EINVAL;
 
+	if (of_machine_compatible_match(scmi_pinctrl_blocklist))
+		return -ENODEV;
+
 	handle = sdev->handle;
 
 	pinctrl_ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_PINCTRL, &ph);

-- 
2.37.1


