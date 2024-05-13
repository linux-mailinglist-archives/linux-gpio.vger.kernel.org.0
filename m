Return-Path: <linux-gpio+bounces-6324-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 592AD8C3DDE
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2024 11:13:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C56F21F22378
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2024 09:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13B8D148842;
	Mon, 13 May 2024 09:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="haHILfpW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2084.outbound.protection.outlook.com [40.107.14.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0475F14882C;
	Mon, 13 May 2024 09:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.14.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715591583; cv=fail; b=Sh8WnDTdSWwTT5mh/hGj4pLzyGghqqcULyexpyooQoNnGdXP9r3YxZpSYo1jybOcCzC0qT7FCGC42mERKPii1o49oGJI35v8FC1FWJ9YhlOyHG2YVbDqmvkRQ94vuGDvldb1YW7ndI0HERuSs62UXwEJ4hosoLeDA0Q4xgB4HHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715591583; c=relaxed/simple;
	bh=rT8sEJEK3UQ9la01/mEtjfXFvtCn7Mp1sMFeloygQYg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Ssem60FdKu4MzSG+QmdIx39fxIT5+FDbPIzciLMYp1w9+YF3vNKQbL5Z2Eack8xfkviFdGLWSPtHC4UiMBGpvxorD3o6kM7bkk1p7D/sa1nNDXxSvLPlQfrAdFBEvaGjYG5QElfkzUFCGxNh1PY3jzdMvpsN8c8rdFEH44oQwSU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=haHILfpW; arc=fail smtp.client-ip=40.107.14.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FeKb0mJgrV8OH4pA9Nqwqn6SFYX1vWtrsa9NIe9leMJP5j1muX6KzI8ngLHJIsgxXLluEsM7ft1SdjGF8BqlelNVrwKHCUFuBNWEfDup90yHQo9ou16d+aaMu6lhywwpzcUWUX64jesUZOxSt4IdaHYKir6m441qB4WTNix0/5S8/pPtMicKq9Uur0Pe30rmBMCTou4r8/QbJD3CKdv9igek+Y8dUxfVEer+EOHKc0Hcf6xrSfe5j3MW116NVfdPzbmI+s3/8UfSjVFatTO53KUhJddp/0gevjbu3D5q3oBzq/LW1trxhT/VSKkjGmvUP2nW8mILZ3FQaIuSoh/PbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9j9ivJOIjo7H5LlQ0RHCh7+/Fj11lFRVDhUe+i4XIGM=;
 b=fuluBNJmKt4ZVYKeSNh5kQXYx4y+5rcDuKdoAMXDdzx3eFdsBcIgxpm3OKlzFZnrUnwRSqPw2hQP5F4jB4pnVM/JFIqqttEauPQaxS5i41UX8sFZIHBwQmrdDM9j6PBlequW/lH0BvW5LulrSi8OaOk1lY9gVk4OdGwRx+AzzuXYpP6Ug0GcQpiJzlYWgL7K6ndxv+D9y2Njl97udQacWPPjarUwrVQd1eHALKPG7bJdRwz+3DZOTbdmffp3zt2j5vSCa6XG06saxTJnrMVVHtEdWwT6IhbUEsYfTRmp1SGSZNTfZedDi1rTYfOGCI+q86gEO7hPHlM6FXxdkyeACA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9j9ivJOIjo7H5LlQ0RHCh7+/Fj11lFRVDhUe+i4XIGM=;
 b=haHILfpWfNuq2mNpR4Jn2FzOcaAgnpwEzZCJepTosoa04Kw+EMUmMYaUY5YHPs/2lVaCIyqXKnWfxc/tuzVFWLUGHDeQTu1lqz9yZnksvgtB6fLaTl/T9oABYG/ro6ddRUquGLW5CEbIjDbWVW78ipgHCJwIRvsEoTe+jy2tFvI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by PAXPR04MB8910.eurprd04.prod.outlook.com (2603:10a6:102:20d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 09:12:58 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 09:12:58 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 13 May 2024 17:20:46 +0800
Subject: [PATCH 1/2] dt-bindings: pinctrl: imx: Support i.MX91 IOMUXC
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240513-imx91-pinctrl-v1-1-c99a23c6843a@nxp.com>
References: <20240513-imx91-pinctrl-v1-0-c99a23c6843a@nxp.com>
In-Reply-To: <20240513-imx91-pinctrl-v1-0-c99a23c6843a@nxp.com>
To: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715592058; l=1487;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=PIjk/r5I8lJuO2cvKIasL+URDyxl5jPD+uKmarinY5w=;
 b=FNXM8Mx8oiMq9CpjjGMXRAaxjq7ATH+pwyPP08nPoMhT1DRgT3ytRvjwPl1EYa3GfJBfTR0EJ
 RJveNsF/W3qBiuJOoavZQJqFysvrPOhF7H9BrKnvjgWnvokSUx42xEM
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SGXP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::13)
 To DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|PAXPR04MB8910:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f82bdc7-2ec6-40dd-4ebd-08dc732ce1e0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|7416005|52116005|1800799015|366007|921011|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a0wvWHZBQ0x1NGlBTDNLRlM1czBGTklwa3pQVVhKVVd2RUh1dzViNDQyQnRJ?=
 =?utf-8?B?dTYyekx2QXBqbUFjT2FwTHhPUkl0L0Q0b1pqOUpiNkFEVkZxQUkwV3JkZkM4?=
 =?utf-8?B?bzFTaUxMc3AxNm1sSEdyQ0h4aUVybHZwZVpTOGlwbDByN2lnL1gxTytNMTc1?=
 =?utf-8?B?NHdlN2R6VW9zZ0d2OVJoeEw4Rk45ZXM3aFBOd29qVHNZU01QbHFySW80b0t0?=
 =?utf-8?B?YmQzNlVRdTN3SUVrdEFMYXR3NjUwdmkwTzY4Zm52ci9kaGpDQ2JvZTVBa2VB?=
 =?utf-8?B?YmhZa1gyT1dVbXhISndrcExVbE5wMndoQmhHWmZEMy9vaTNqUDhXRXVpcE8y?=
 =?utf-8?B?eUdMeFVnMjdhTkpRTWVEWGFnRG1rWm56QzFqWExuQ0ZwRGxVVURBbm1rUU9h?=
 =?utf-8?B?VTlTT3dLUzM5MjBkL0djUDNjUVVvd3JvcTFHMDVyait1SS9EZHRobXVmYnRp?=
 =?utf-8?B?bVREKzlOK3ZzQmc4dFJUMTZNWU5rOWRVeVd1MXdUR1JVK1hRSksvSSszMEcy?=
 =?utf-8?B?ZWdGb3hjdjkzMUR1REhUSUdOYXZpaE1ub1VQWjlOdWY1dnBCMUV3YUNXcGd6?=
 =?utf-8?B?TEdleDJkZGpFYnJ3bEI1SlF1Nm9LaXNPOGFkTkxmcStSMng5eFZTNEd6R3V1?=
 =?utf-8?B?bUx6VERtN1NCUlJCbFhWK3piYVR1UDRTSkRmZnVDZWdwMGF1b0c5eHdaWFhO?=
 =?utf-8?B?WURqd05VVGc0RVN5a1lEQ1lTS2Q1azVIaTczRXdqaW45NGo4NkxVeDBZQzht?=
 =?utf-8?B?USt0L2UwVXlic2hSVGlJT1dSaHUvcEZ0aWhiblZBU2FZWnkvVFFnaExPTzFt?=
 =?utf-8?B?S1ZGMVBwT1h2enlFRXBxcHU0bmhCWUtMd0pBR0ZxTWtYUkNnYTZ5WXZVaE81?=
 =?utf-8?B?S3pyWFNheHZodlFaZEMvNXdlcm1CVmIyTDcveXVVSVpsRHhpZ25sTHJKT2Vr?=
 =?utf-8?B?UENpQ09tWWdvWXcyaGJUc3FQbEVwRWh2QmZvS1RFZ3R4c3JjWHpJWVJ5ald2?=
 =?utf-8?B?UFdXZjg1R0gya20rUUt5MU9Wa2RqZXVDUjh2aWFQK2cxMkZUd0lsYlhBbm96?=
 =?utf-8?B?Q0xlYUE4N29SazIrdEx1L1lFL0pGcmw1ejV1MVY0VCtXN2Z0di9pUnJaWklt?=
 =?utf-8?B?NGJEUlBHaWVhSFhqcXpBRzFpSHErbHRsN25jWG9BSkM2M0lNVkMrdHMvZjN0?=
 =?utf-8?B?RWpWemdGNldKYVNQY3BlZE1SOHAzc2t3YUROMzVqVTZqeVZnN0lzanVFMGNU?=
 =?utf-8?B?c1VlYlhBT3kvTXNFRXI0NmNhVWdLQ3FYdUFMSGFWczFISDljTkJUa1Y1Tjly?=
 =?utf-8?B?SjJBTm1sSTdqWDJuWVprTnoxYkFPaVFtY1BMTGY0VVNCclBaU2VRaHpPZENx?=
 =?utf-8?B?dlN4aEdZR2lnZ0RrUWRHcjM3T1dsVlpqTTArcGQ2aWRxNmxZcDk4bnhoNjJB?=
 =?utf-8?B?ZVdRd3AydVZUbWlqNnhVL0RUYXh4MHZzUXhvRlBFTWR4Rm1qbXZnakhSbUJv?=
 =?utf-8?B?QUFaUmRPSVZvWGNpayszOXE5eU01aTVRNFdieHdPUnlFeVdIRjlhcHRGNGZY?=
 =?utf-8?B?RENLUk04UU5CSXZuUlpSYkd4RStkUThJNURtbENnczRZVHBtQUFJQ3hmcWE2?=
 =?utf-8?B?TnVraVRpdFZpRk1sbTJSQUVtb2hkbm5DMlNEbTNqKzB0TzQyRGJ3c3RKUEtN?=
 =?utf-8?B?eFQ5UmdqL1ZzS1dmQ1VvV2pWQXJKZjBPdVlrU3UyWlArRkJaLzBIZkJudFVS?=
 =?utf-8?Q?4NKt1PUjhZyF8PhT+k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(52116005)(1800799015)(366007)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFdqR3dMMFBRbEcwcWJyaWVNWjVQbGNESWFuWVRpdHVyZ0hOREFUTE13cHVB?=
 =?utf-8?B?bVNzK2dJSG9wVytlZk03SXgrOTBadHROYnhVZnVXTWJCYlN5YTdaNVNPYmFl?=
 =?utf-8?B?Z0FjY0huK2ZQcGxpWkpySndsajBSYVB0ajhuZEc4T2dpSVYyaFlUOHZ6bGZX?=
 =?utf-8?B?MHFDYjVvYU8rakZHTW5WTVhSUTlZdHhCeDR3NHllK1hQUnJXUkZpYTRHaXdh?=
 =?utf-8?B?Yk51dEg0bDJjS1NaUVBFcGFHVHJnMXFhVHFUdXppOU9vN0dMT1ZWeGkvcXNL?=
 =?utf-8?B?c2htWXVwdEpndzIxbUMwci90RWdISlJLT29ZV0pwMGcwL0NKa3hRMlprenJF?=
 =?utf-8?B?cERJemt0U3N3YnUyVEUxajFVcnhjdlFEZk9EVWNnbjhncGJ2YXF6dXVKMnpY?=
 =?utf-8?B?QmpQa041Rmx4K1RtcnRZRWlENDZGdVNHdnhyN2pWS2J6UGdwb2NuVmZiK3ZY?=
 =?utf-8?B?aldObGVJVlZxa3B6TTZhR0RVeGpVYjA5ZHl4SFBYNVJBRnd2QjlENzAvQ0Er?=
 =?utf-8?B?eGlFbDNWTjVVVk5hTWhxTVJXQmVXZEg3djh0S24zS3JMNUgwbmVVYWZWTllG?=
 =?utf-8?B?VUVwUVg4ZDEvQU8yR1h1dERKUEtpTmtrVUNQYVdka21yc010ZlM5UkFRd0ZL?=
 =?utf-8?B?a01YSW1xQ1B1bjUvT1Jyb05VMlVTM1FuQmVXMktSMzd2U081aGZoQUJOQmpz?=
 =?utf-8?B?NVBEZHFmMW5tWGp4amFZOEtJUlFwelRqaU1oN1VSemN5aGQvY2ViMW04ZmZ5?=
 =?utf-8?B?UFd3R20ySHNqNWhtTCtFa1ZFVUNsZysyUS9lZVNvR0t5ZkIyR3ZNNG1IaVkw?=
 =?utf-8?B?a0MwNlpqM1o3ZzM4RkcvaFJad2p1aXU2dTUxV0FIVFo2aDEzcmRBcWJLN0hD?=
 =?utf-8?B?aGZVaEpMalhwMW1yQWQ4WU5OVnduV1dMU1pNMXczUGkrY1JVRWN0N0sxM0pn?=
 =?utf-8?B?V3RZcmV2aHo4KzZBZ2JHNnVPd3ZnNmpIRXlLQklweitFbk5yWnZGQllONEVp?=
 =?utf-8?B?WmRWYy9laHVWS0RqNVRTNFpqdUVYdDRkRWpXTmFubjZJaVdhUmJjVTBFMEl6?=
 =?utf-8?B?WSs1MnBjeWErZmdaYzc1S2M3ZTJOVTZsOHlOOTBBbUFXQ3cveldiWEJUN2ZZ?=
 =?utf-8?B?NDN5aG5TR0J2elBVT01hWkFpR3ViL0xsNXRSY0xuNUdpZ3B5bVhuNWZjeUhn?=
 =?utf-8?B?TlM3dWtKUzViTE5jbnJrY3FkRjRLMGZGU2xzNmFBcHlOZ2FDMkhpK0MwM05h?=
 =?utf-8?B?TmNPTHNDL055T1FlbVA1WC9YNVgyOS8xbmFTL1NqcDFUSEV6dk1ENlpTUkR1?=
 =?utf-8?B?Q2FmVFltdHZtclB5Z0RPdzIxMTJkeDJNTE45Wk52akd3b1lUdHRFVlFuQ2Y5?=
 =?utf-8?B?ZVpDVk1VaWQ5UFd1aXprM1ZFeWcxQUFGT1lSK2RickY0dC94SHhqdUJ1N2hX?=
 =?utf-8?B?WE81ZzVRMzBoZWJhTEZOczhKL1VBNTdoek9tbWxCeDc3V0ZzNlROQ3pTbFBM?=
 =?utf-8?B?a3VVYk9YV0p4aWFUWjc1cEJYSk03T0lFaFc0N0t6dHBsRCtINXpTbXRVOUtU?=
 =?utf-8?B?cVk3OFpKN3V1R3o5RHYzNHZZR3Jmek5mdFR4TFVya0dMNUtnRWtCWXV5MzFW?=
 =?utf-8?B?R2ZyZmVzbTBwd1ZNYW9pajBUaUdObGtzTlpWYUxGRHpBSWNnU2RuS2c4VmhX?=
 =?utf-8?B?R0xtcUwrM3pUTGRWTUFDVUdtdDd1MlRNYjBITnkrVTlNQ0E4ZjNTOXVNRTI3?=
 =?utf-8?B?SGtjdC9adldNb0M5THVQS2h1Yi9tKzd4QStpNlNJOU1lb1k3M040RXJ3OG5K?=
 =?utf-8?B?NVU3ODEwbU0zVVNJcWQ0S2ZTazdKaVBsdGM3N0FVS0l6c2c4cWFtQm95VHpv?=
 =?utf-8?B?SkVZc1UwdXYvVW45aThnb1FSclk1U0lFdm84QkNFQVBWOVdKeVNVa2J3OFQx?=
 =?utf-8?B?Umd4QnJ4M1l5dEpjdmRaQUdqNm81V2tqQlJiRVJnYXRGcThCbFdyNTVEdVMv?=
 =?utf-8?B?RmdNSVpvUW1RazVHTUxsWWZ0ZWRjQnRJU2NORnNYVmtKWkMxUzFqeXBubjdF?=
 =?utf-8?B?QnFEVWlJMCtrcEhxT0JtZEtyMitkS2UwcldqSEJ4ZkdldFhBUUdNWjFHaGs0?=
 =?utf-8?Q?VLMdLkSdIjOcqzpGdgLYs0qMS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f82bdc7-2ec6-40dd-4ebd-08dc732ce1e0
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 09:12:58.6847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IFSAiO+aSB/p76UQRPbqpoqBoVSv5qMbehNpDrEFg62cEzrbwqdYH9GEIRnikL22nC6vkWWH7ohQcwiadfg2YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8910

From: Peng Fan <peng.fan@nxp.com>

i.MX91 and i.MX93 share similar design. They could share same dt-binding
doc, so rename fsl,imx93-pinctrl.yaml to fsl,imx9-pinctrl.yaml and add
i.MX91 compatible string

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../pinctrl/{fsl,imx93-pinctrl.yaml => fsl,imx9-pinctrl.yaml}     | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx93-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx9-pinctrl.yaml
similarity index 93%
rename from Documentation/devicetree/bindings/pinctrl/fsl,imx93-pinctrl.yaml
rename to Documentation/devicetree/bindings/pinctrl/fsl,imx9-pinctrl.yaml
index 2f2405102996..a438db8884f2 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx93-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx9-pinctrl.yaml
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/pinctrl/fsl,imx93-pinctrl.yaml#
+$id: http://devicetree.org/schemas/pinctrl/fsl,imx9-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Freescale IMX93 IOMUX Controller
+title: Freescale IMX9 IOMUX Controller
 
 maintainers:
   - Peng Fan <peng.fan@nxp.com>
@@ -18,7 +18,9 @@ allOf:
 
 properties:
   compatible:
-    const: fsl,imx93-iomuxc
+    enum:
+      - fsl,imx91-iomuxc
+      - fsl,imx93-iomuxc
 
   reg:
     maxItems: 1

-- 
2.37.1


