Return-Path: <linux-gpio+bounces-6492-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8698CA7E2
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 08:17:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 753B0282339
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 06:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E55214776E;
	Tue, 21 May 2024 06:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ItDc4xAR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2040.outbound.protection.outlook.com [40.107.22.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB084654D;
	Tue, 21 May 2024 06:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716272233; cv=fail; b=DKRdMeR2gA7CDNCjjI5/UTnD8g+yH8FjL82yCjjaWF4mgtcFvTDw/FZaDR6+CNFBHLrExsD93x01f6j2gWDpQyGj/1Z5VYlRNBpFghib4JDXSq/QCkG5EMvNpOZvwvT99DAoN0l6V56OHSv3Fqq9u7zfXd2ealskTxRv0f0plg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716272233; c=relaxed/simple;
	bh=kUDyfShYF7JrZDUmxwzTe1qPj5uz10mA2YNteMnGVgU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ox84uCE8wGopGzvR4yj4DWadqRR+C4LpGRzlhY4lZPFg18MKJzKraT1jX99QzHevirVmDYWwYdBIFwaW+TPUq+9gwCWfzMhxpz9IAlEeusdoz7kKNCeq5sKXHTkgMCvyfnNSbObpfAmU3rdA2ZFkE6OZFKY/VQbrxXeHMQt0QNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ItDc4xAR; arc=fail smtp.client-ip=40.107.22.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YP7FG3b3Int0usDXZ+yEm6G6m92ZKsqfDpweiWHwMFAx32vZ85Ux0p6VR+TLfvPLp5xBXlHdCbFNfyQNRGKk8pbRidqwB9if0NALrHpzbTmOy34/kT0bWPWzdF22oWszQoRHo4bHE7lM2suI93IqjBCp1269zokpsGtRBuItbNFFNVmfRYE2bZzJe0GMY4CIgT0bqTapiRrUqyCitdgiEzw4gJwO+h4vC1XqzQU5AqShl84l0iCgTB+UklUUm2C7hUi3RInRw24Xcs3OeV8NWYESj0qNQls2k6NNZlcI7Q45ASQjrLEXfCmAToHirsKyykCFg6GtQ+aiHpE4zbhGEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MpXBiIgbYCAtKoFhcnbORe050Lv/JcH44XQ+lBbuE8k=;
 b=U+5WzpMqEeuMYp2NSIKyxsEbZ497MNTEqkSWXYjQXq5Di5ewTHA7ydJsR0q5bO9XFwIT93AyTBPOrfYRWBHQQt7CkkyproddgLBxOFKZUJ2U4BxJ6/x8bwcRK+WthWq/rOopFkOwZMIK6rxMjtSAb30M41zm+x0fMa8O4t1BrbO4pSTguXPGLK1MjxIHkwDakReREZlI350AXat5Yrd3AljgtSUKuDLQpCqne9rJhso8KQBWniTutrA8BabdjJCX9yRBPYZ+4FczGKxkAKYmd4736FL1L6BAoB7Dr6gy+DMoK1Smn/Tun2cad1xLLKTTo41ARu5e4s94e9MTSk2Hwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MpXBiIgbYCAtKoFhcnbORe050Lv/JcH44XQ+lBbuE8k=;
 b=ItDc4xARlShgDMALGaMrDWAdQm6XEM9eHmThMH2e03Sc18smlY/ehfpBK+9wNoVulBs+CfUyUHsIpJft1YotqGurms0zLhobvLsBv0/SW4hmoRa9p0J68dFnP/MC/3E9rVovrdERuOG46LXu9RJzuPodHuh8J8TuuqvpdN7K178=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by GVXPR04MB10705.eurprd04.prod.outlook.com (2603:10a6:150:223::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 06:17:08 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::557f:6fcf:a5a7:981c]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::557f:6fcf:a5a7:981c%6]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 06:17:08 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 21 May 2024 14:25:57 +0800
Subject: [PATCH 1/3] dt-bindings: firmware: arm,scmi: Add properties for
 i.MX95 Pinctrl OEM extensions
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240521-pinctrl-scmi-imx95-v1-1-9a1175d735fd@nxp.com>
References: <20240521-pinctrl-scmi-imx95-v1-0-9a1175d735fd@nxp.com>
In-Reply-To: <20240521-pinctrl-scmi-imx95-v1-0-9a1175d735fd@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716272771; l=3521;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=4NBdBZb+JxQbTSMhFLS6V2WIVMWWZosI0xnylrS5Bzc=;
 b=GrnP8BNxanU4hAKt8btQRr5rEaMDHu/6804ktSa4QBb0nc5C2UA2BfumGLOMGinmQsE9qvn1L
 I+uPTui6NN6Da2rl5Wxs6DtjS8lLARBRQPL0DemfesmsCwu5kxEhLKr
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR01CA0157.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::13) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|GVXPR04MB10705:EE_
X-MS-Office365-Filtering-Correlation-Id: 745f14f9-9f82-44f3-7893-08dc795da4df
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|7416005|1800799015|52116005|376005|921011|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UksvSldjQlkyaGxFai90dW8rRnhnQ3B2ZVpTK2ZmdXFlSlg1Vy9wR2lrSElK?=
 =?utf-8?B?TDJYVHV6eHhXUlB0ZjJFT0xQbGh5WnVTMlMrRk1PSldRMThhdFE0aFlXbUMw?=
 =?utf-8?B?YUphNVk0SGZuNWpnNEs4eWxuMlVrUElvenhJL0tBb0twc3lqOEIzaVhJRXFl?=
 =?utf-8?B?Ty9SYm1XNEZ0NDNrWHp5UGRZZ0IwOXJRNXY2ZG5PbVVKUnV1T1lKaUNJMXUv?=
 =?utf-8?B?aVl3RVB3TnF4NENmQzZmZjU3cXlCV2kveE1iT0xoNm9uZXBseGdDSUQzZGZY?=
 =?utf-8?B?ejBWVTdlTEtLYWhvbzRXWU9YOUIzV2NxTTZ5S2t4VjR2MGZ3OUtKK0JQbUhK?=
 =?utf-8?B?SC83ZnJpVEVPNUlPenZRUGh1aVRJcUN4czZONDJLQTBzYnNkeDQ1Yk5IUzUx?=
 =?utf-8?B?dG9KWTJUUHQzWkIwbFZ0d3hETm40aXBXZzlBNkd1aUVuS3A2OXVJQVBzbk5U?=
 =?utf-8?B?MnBVcWVIYWExemN0UVd2K3piZHRGZmJIYko0dXZjeGFaMlltRlBZSDBTWEJz?=
 =?utf-8?B?N2FaOEVvY2gvSTlwMXpxK05ZWVE2TWtPdGs1amxoN1FYeG50Zm15TlZmVDJu?=
 =?utf-8?B?NXdQcmZXTnRPbkVUR1ovTlVKWEN4ZUtoOEhOZnlNbGxib3l5ZHN2VEhKd1JR?=
 =?utf-8?B?VGVLV3lhSXFHWnNZTkVjdTZmTDUzejN2c0t2SUdRYVRSRmVsNTZKVHJOTkpj?=
 =?utf-8?B?NytUaCtOQjVQcVdlb1g2SDEwQ2FWaHZwRmtCK3lReENWYzBrUWY0MFo1bHFM?=
 =?utf-8?B?Ulhwd2hPa0o2R1BDYmxEenZ2UnFjQ0x6STRNRndhTGtmaHA5SXQ1aXRucTA2?=
 =?utf-8?B?QW5pWmNoTjVrSFEyUExXQ3oxNlVkWmRFV0ZTUDVIZUkzVHB2RjUwMWlCOFRx?=
 =?utf-8?B?WjFWUTlUQjAydElCemhMRkhzakZZdEo2eThxWFE2eUxzMVpIakp4Uk1nUHRr?=
 =?utf-8?B?OEVwWGxzTU9YUHVsQTdxb3VIbjE2blVBaksrRUZkVHJjcXZWK0FNbnhRRTQv?=
 =?utf-8?B?Z1MzS1RrTmhBWDh0azFDWEo1UUVVRTlCeE1ZcGZYMGFIVVZ0bUEwcDlMSHZU?=
 =?utf-8?B?NURjenhQMG42MnlxWjV3TmltNWh4UHpVVStPdnM1UFh0dTR2Y3BwS3R2dVBV?=
 =?utf-8?B?WWd0NmRKdlFja2NIU1FpOHNPTHRxbUtBcFBSY1Y3RkFpb0lWNmpjY3RGVkRi?=
 =?utf-8?B?QUVPOFRGNDExSVdXajd1ZXd0Q3FzNi85WHJTQlZjSnh5eExsakttcy9QWFZa?=
 =?utf-8?B?eUcxZzFlbW9TNFAwOHVndkhvM29zU3RTdlMrYnJJczNLSm5ndVpyZXUxeUpP?=
 =?utf-8?B?eTFmazlDNmdoSk5uQi80cmxJaGd4OUpBblZnZXNFbm51WDJWcE93SjRpaGZY?=
 =?utf-8?B?WnRuaU5hTG1GOHNNdUNtM3AxOU5uS3ltdkJ3MTQ5SE56cTNWUlVkSlZ0N0lH?=
 =?utf-8?B?cXBscDI0c2E2aGRVTHAxNmZrSm5nbWNpaE1yQ3EvTXhyaWxtMzBuaGVTTWE2?=
 =?utf-8?B?UmpxRGdlT1VzbWdhMC9GSFQraHJUMXpva1Bxcy9peUE5dTRrV09KTHduTi9q?=
 =?utf-8?B?YkJWYnlid3lsT2Vmd0c5WDBhdU1NWkxxa1diQU1iR09ESHFNSURLVHZTc3B3?=
 =?utf-8?B?L1FRZCtYbm5WMzI3M0Ezdy9CcnowcXJFcS9DUHNUNzhEKzRneHNyb0wzdUJ5?=
 =?utf-8?B?alpHRW0xOGdCSzlRNjVLTUZwMFhaSktua1o2bGdIaTJHWDg0VDFDZUJMeHpH?=
 =?utf-8?Q?hrJdQ1iccNOLODsDpw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(1800799015)(52116005)(376005)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVFWRFFadThhTnc2amRicE1FYkhKa3V0bDZWMVV6TjNSdEdDK3BPcElDMGJo?=
 =?utf-8?B?MlF4dGZoY0loakJzZ0JoYllHZ3I2VVQ4b0E2ZFc3cHFIMmhVOG1ST1ZCUEx2?=
 =?utf-8?B?SXdhNjFSQ3BreHkvNUR5SG1NNGZyRWxKNGFpeTU5ZlF1VlFYdXZQaXVLb1ly?=
 =?utf-8?B?dDNUcElQbXQyblh5bzB2M2ViNXNxaDVrZytXM0RHU2p6UWtPeTF2OUEwMktk?=
 =?utf-8?B?UkIzSnRvWkc1VElONllseEg5ZFQ2NXRPS2Q0NnYxSWJuS0lkRHZpd1JibGlw?=
 =?utf-8?B?RGg2TXRXOW1pL2NsdzZ5Mkx4WkVYbExOY3g1YVJyZm9NQ3I5bURSL0hEL21P?=
 =?utf-8?B?bnpKemRYMjV1a3c5ZS9RN1RxbjBhdFEyY0duNG43eUxjSk1uRXlHNGZSNnlr?=
 =?utf-8?B?aHphSXRPTDBmcXZZRnNmUUljOFdYRHdoT3BlYVl0bjVmeWU0OWNwUC9aSk1L?=
 =?utf-8?B?WDBWTVIybExaVlZCQU1sZnNZK0NJdGNYWjQ1TzZNNkFPMkhqelBUUWE1a2xI?=
 =?utf-8?B?QW5qaWtjTnB6b0ZQWVBGZjVERFE3WERweUlJU3NIRXJHV3RUV3FScTUrcUxa?=
 =?utf-8?B?S3daOCtaTmU1dTdqekdxV3B5YUdiYW9UbDAzYnludFlEVDV0emJveHNZNFVR?=
 =?utf-8?B?TU9pcEl1Ty9QRzQwQkNMbW1wU3Qrb0kzTFZvQndMdW5aUXpSRkVrNzVJTVFj?=
 =?utf-8?B?cGR6SVFFQlQrdkRkRWIxOS9jL1Z6cTFqZFZTVi94V0l1NGpiMTdPWi9TNTEx?=
 =?utf-8?B?RER5SW1namhySitGZHRWQlA5dzRLZG12U05seW5mOElYdTBEOW16YzRsbzlU?=
 =?utf-8?B?Wk9lVllQWHRHT0VKS3kzRFpablJ2TGliOWN2R0dudXBFQ3o4aTZvUmE2SklY?=
 =?utf-8?B?WFJrcXRoRGhZYlNHYWtYNWVaNDRGMm9QQUpxRE4vT0R4anU1ZTYzNXZ5L2Zl?=
 =?utf-8?B?VjF3ekJNejJ6VG55VGkxRkNZVmVmZkhvc0RlbTQ3Um1TSTk1QUZuWUdqUUg5?=
 =?utf-8?B?cXFiUXg5bkNhZVd4ZmdrUVRZU1Z1QUpSK0VnY0Nnd0tIWC9oZ1hJWnZXNzNr?=
 =?utf-8?B?em5ZZytlS1NHZWNUQVFVZGlXb2l5a3RYQVJWdUI2aDdWZk5JbUdNRS9BdHRo?=
 =?utf-8?B?WlltdnErRG9SUDFybzBlWUF1c0dDZEtjek1ES0VYdHMyOUFHVFJ0RFRsdWNC?=
 =?utf-8?B?aFppK3BnZ0ZVRCtCT29sSWdzQ1BUMnFHNVdYN0RidmNtb2dKTEJKbDkvWFM0?=
 =?utf-8?B?MG9pOE1OQVBrNW1nMWo0c05jZm1oUTJvdDVzMCtveS9HMzVENitSWGN1S056?=
 =?utf-8?B?dDJWVS9mT2dhek8xS21ER1BQZjNYQVBaWDVhaGY0MkltUnQvUVYzVmQ0TTI4?=
 =?utf-8?B?VHhLTnJMM2wvV2NjL3NPelptSUVsM0s4cVBvc001R1NINFZoWXFERHZiMjRM?=
 =?utf-8?B?VkhBN1NRdzZqOENKSDdFdjJwMmxPNVBVY1dQc2Q1b2VieDhrdE1sMkR6WUxE?=
 =?utf-8?B?dHJNUmlRQmY3d3oxV1lsYjRIRS91RTNDa0lTc3NMVmN5Sm1FaVV3Mm9NUXVw?=
 =?utf-8?B?V1JVWWVsU0dCSjI2Ym0zc0JzbzRsYTFMRzdRK2RjdU1WYjFNTnFrVEdjZU5p?=
 =?utf-8?B?QmkyRWJsTG9vZ2J2UDRWNURYYnRyZFRsdXNFbG1FOXJXM2NXWmRMOEhTSDJy?=
 =?utf-8?B?SGJxTmtPL3BYSHdJMjR0dTBWTnBUN0ZrMjl2RDdhY3ZEdkUxTlhtY0p1bllj?=
 =?utf-8?B?b1NOVlk2UVFVMGxxZWoyYVZTUURqa0hjb1VjemY3Z1NuK3E3blR2VE9ERWhh?=
 =?utf-8?B?bWowOHdWT0lLdURSdFI3N3UycmlGbWtnaVpvQ3JKdmNGVFA0WG1iYk5iOFEr?=
 =?utf-8?B?dHpZcEpWRXRqRDZZRmthcGdzb29XYnlpSStvODEvTzNBaktKOUpDVEJsNkoy?=
 =?utf-8?B?QXJsVkFvcHBVQkJJazBkQ2lpUjZMQVM5aWd6QldtaThKaWo0UDlBWm5BRzJm?=
 =?utf-8?B?K0UzN2FMZXBkd0xrKzlzNlhBczg1TjFwQ0k5amp2eDJYNVhkVG04SUNzaW9p?=
 =?utf-8?B?a0E2TGp4N2JXYk5wbEpFTXNFMXJ0c056bUVYc2l4NEM3SmZ2cmNDakdaKzB1?=
 =?utf-8?Q?d6RzBGiNX/3zKdtIjMV73mHFp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 745f14f9-9f82-44f3-7893-08dc795da4df
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 06:17:08.6297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: quMTld/tXhScsPICEJDsNp5SME8hxm5iOezp66f9Yw8+cmCL7SZRwjAWNojccWTHAxyWfCfDyK904duTkV1KCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10705

From: Peng Fan <peng.fan@nxp.com>

i.MX95 Pinctrl is managed by System Control Management Interface(SCMI)
firmware using OEM extensions. No functions, no groups are provided by
the firmware. So add i.MX95 specific properties.

To keep aligned with current i.MX pinctrl bindings, still use "fsl,pins"
for i.MX95.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../devicetree/bindings/firmware/arm,scmi.yaml     |  4 +-
 .../bindings/firmware/nxp,imx95-scmi-pinctrl.yaml  | 53 ++++++++++++++++++++++
 2 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
index 7de2c29606e5..f7a48b1e9f62 100644
--- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
+++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
@@ -251,7 +251,9 @@ properties:
     type: object
     allOf:
       - $ref: '#/$defs/protocol-node'
-      - $ref: /schemas/pinctrl/pinctrl.yaml
+      - anyOf:
+          - $ref: /schemas/pinctrl/pinctrl.yaml
+          - $ref: /schemas/firmware/nxp,imx95-scmi-pinctrl.yaml
 
     unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi-pinctrl.yaml b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi-pinctrl.yaml
new file mode 100644
index 000000000000..a96fc6cce502
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi-pinctrl.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2024 NXP
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/nxp,imx95-scmi-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX System Control and Management Interface (SCMI) Pinctrl Protocol
+
+maintainers:
+  - Peng Fan <peng.fan@nxp.com>
+
+allOf:
+  - $ref: /schemas/pinctrl/pinctrl.yaml
+
+patternProperties:
+  'grp$':
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+
+    unevaluatedProperties: false
+
+    properties:
+      fsl,pins:
+        description:
+          each entry consists of 6 integers and represents the mux and config
+          setting for one pin. The first 5 integers <mux_reg conf_reg input_reg
+          mux_val input_val> are specified using a PIN_FUNC_ID macro, which can
+          be found in <arch/arm64/boot/dts/freescale/imx95-pinfunc.h>. The last
+          integer CONFIG is the pad setting value like pull-up on this pin.
+          Please refer to i.MX95 Reference Manual for detailed CONFIG settings.
+        $ref: /schemas/types.yaml#/definitions/uint32-matrix
+        items:
+          items:
+            - description: |
+                "mux_reg" indicates the offset of mux register.
+            - description: |
+                "conf_reg" indicates the offset of pad configuration register.
+            - description: |
+                "input_reg" indicates the offset of select input register.
+            - description: |
+                "mux_val" indicates the mux value to be applied.
+            - description: |
+                "input_val" indicates the select input value to be applied.
+            - description: |
+                "pad_setting" indicates the pad configuration value to be applied.
+
+    required:
+      - fsl,pins
+
+additionalProperties: true

-- 
2.37.1


