Return-Path: <linux-gpio+bounces-6323-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D12848C3DD8
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2024 11:13:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E72301F2230D
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2024 09:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ED3F1487E3;
	Mon, 13 May 2024 09:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MIWsUMdr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2072.outbound.protection.outlook.com [40.107.14.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9D11474A2;
	Mon, 13 May 2024 09:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.14.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715591579; cv=fail; b=UYF4ruU6hy6HzXMaml+Kzzv+3ppRUFauUzZMTu9fpNXF7cIPofS2gcxhXQQRNPM9/mL4Hm2lJA3p9ZWwkhTE0h28FduZXg3tM7XCC2ttjdRnc7St5DHtR6ECPiusM0vR2ooVD5MNdKt21t2Y0HrWESrk1fbULKO8EqHeJiHGf3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715591579; c=relaxed/simple;
	bh=/Z76iyOQ1wIo8j9RKuLIbGGQezgHmTwO+JZ8P+lAPrQ=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=MPe10yJkFwoRMy6CM6oQYP4Pp0KJrL6QtIFqVZ/gqO28fSfYPgLV46mgDbzLPUkrCZL30SsLs3sSmmz7J8Vyt9jSdgzYfxYv5dADYnneSoCjG+RWx2m5PuXzdSQAW62TgsZSxutjvEy+yjSUEf8gA+huLQjuph5tkq8dO9SEyTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MIWsUMdr; arc=fail smtp.client-ip=40.107.14.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cGHZw2pnQmXCwU3WunGp3s9/7WlF3JdkjPrigzH2b/t7bo1m7JQpSBPVsBpW2g0dd25ChPBhXHDTM41mSESo13iXbnu+tuPasVrO3TfH3B6I/XGVYHxkKA8rcGQ0VLY+uDYEtRug+bVJHz8WfEganYtFhlSoWL57hA5o+Y7tJiudxR2mfjnHOJndUecZ35S3BMfd2R8gjYZySlmE4Pq/a9KjqaHd4JS76xVF95yY/b0zoKa5G3YzLHMdyL//pVBJ1h5eAI3acq2N9WFxmRMr3nkyHzYYWI+EXRVCsQpvvVe83/zxpuiMzaXBfAx7eiO/MhZ0TknNg+CyYC/cTFmZWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQWJ3j11npIVkxd0lTNpftF0OmycudbkET0FkNKcUC4=;
 b=T2+6fpUMLBLibygupfbFub11Xgi/V5N8Sg/X9R9DvpmGBNNqfTDVwtSRY5LpMXZC0VmbAjoRndDxCCpT62IagXmvW+94XQlFqR52dpUunFMFtBT7FOjpT6ZrnERkV45bfuUEIuj0Pe57R0exKfVGrr8RhBNC/j8j4S5J3TwqVOwniWbKUguVtrq21Ck4fjpQQ3OswRUf7OIwgVFiSZynUHpZfYr3VQar6+ZG1/6uFPnVBkVjVByjeEwZ+80JAXfVcdPW69zCOOrff42pNzzfG3DkFPNbUq6Bmkhe2m6PN4TBO7u7h40g96lBSt1a3ny7TFm670A0mnkgaX5dXtyyHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQWJ3j11npIVkxd0lTNpftF0OmycudbkET0FkNKcUC4=;
 b=MIWsUMdr7WKNhdGnoAaRb4H0KbXPPbwep5rdVWuhK7CD2pOF0y2xHuJZGtCL6tgv2cWyYIa/11fouzPvosYdW21QckNjiSFwcPz+Lx9BHdtRU+UfsA0zDPSXwLyFLWFzglKDqgaf/9WGLJ91qrrT4yN8ALCCcAonU0nIBKHU/Zo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by PAXPR04MB8910.eurprd04.prod.outlook.com (2603:10a6:102:20d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 09:12:53 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 09:12:53 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/2] pinctrl: freescale: support i.MX91 pinctrl
Date: Mon, 13 May 2024 17:20:45 +0800
Message-Id: <20240513-imx91-pinctrl-v1-0-c99a23c6843a@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG3bQWYC/x3MQQqAIBBA0avErBNUNKirRIvSsQbKRCME8e5Jy
 7f4v0DCSJhg6gpEfCnR7RtE34E5Vr8jI9sMkkvFteCMrjwKFsibJ57MuAG1Quu03qA1IaKj/P/
 mpdYPC7JrDl8AAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715592058; l=793;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=/Z76iyOQ1wIo8j9RKuLIbGGQezgHmTwO+JZ8P+lAPrQ=;
 b=omOTFEjmX9wy5Lr8zmV5fFDOKcmqSA9U4Yff3RMpQA/+lbOI8y3rOUhFnQI4SMzi0+z5YhAyo
 WPMhHAosXwUDlx2nTRU1Xb9HstUcGDCH0jMCOHUdoFmX1BbfmnAl/YU
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
X-MS-Office365-Filtering-Correlation-Id: e555a884-b381-4cbc-475d-08dc732cde75
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|7416005|52116005|1800799015|366007|921011|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWRnc2Q1dmRBbVhFaGREQzY5ZVNOZWlwL0J6OTBVays1emQ2NUM2UkhZWXZO?=
 =?utf-8?B?QW9MV0x3VFpLY3JaTUd4dFhGY3I2ZzJ2b1RhVnd3dXRJTDVKQ1RIV2ExZ3lY?=
 =?utf-8?B?NXArL1dNdXRJSjlkLzVMWlM1TVZGS3lYVHVVM3ZWYjJjenByaW9zYmlmT2ZH?=
 =?utf-8?B?am01OHR0TlhYSk4vdVBVTTVuSnRqVk5KK0dybEh0akJLTkdQMnVQdDdpMnQ0?=
 =?utf-8?B?bXVaeFcvVXltUC9zYy9KcEFkcTJSRE9OMUovL0U0NDd1Y1BuT1hiU042WFU4?=
 =?utf-8?B?eVM3MHE0S291T09hTm5YWnhiajZxWFRPQ20wT0RRbkY1Nm1xVFprc1lTN3JW?=
 =?utf-8?B?RXJYb2IxRVArdDMxMGZJbTg1dmxBSitJL0NkVlpmUStZK3ZLV0NsYWFkOHVD?=
 =?utf-8?B?ZTVscXorVXF0YW1ra2p0KzRabU9LMC9GZ01GbHBQQ0NOMElLOFEwUnIwWnNY?=
 =?utf-8?B?TWRmckt1QXJnQjFibGFicXFHNEN0Z1cvT2VVZThnZHA4aG81YThNSCtScEl3?=
 =?utf-8?B?cUlpTmtURHBiRlJ6aml1Sks2RGRaMVVJTkNFWXFXbFBmT0lGSVFtY1BkSW9m?=
 =?utf-8?B?UWhjMlFPYURDTnBlV01sZ0hnSFZBYjF5WWI2WUczN0VnTXFoTWxtcEh2c3Nu?=
 =?utf-8?B?MVNVd21UeEd1TWtFcjBXVk9mb0ZBenNRN1pUTTNJNVNtUGg1MkIvV3VJVGNW?=
 =?utf-8?B?endoZjVoTWFKT3ZZNmRZRWdzQmlsUkRWQlh2UzB3QXpSVFd3cnlOUmh1SHgw?=
 =?utf-8?B?a0greUVqTHZTZ282RVNQdi9hS2NWTmViTU5YN2hUT2RLWjBCVjIvdkFwaDM1?=
 =?utf-8?B?eUhWd2NueFlVRHI2TDBycGN2UmVFcXNVVWNVa0k0Ym9UY0RvNlVxUzhweVha?=
 =?utf-8?B?L3piODA3U0FPN3ptQnN6ejUwekFqWVBubWhnMTg5cEs4NFM1N1Bqd3cyaVl1?=
 =?utf-8?B?RlVBa3JWeDVGZldQSm03RU5WQWhPQXJQS2FvNDhMTnRBMjJ6cndackcrMkNC?=
 =?utf-8?B?TzFFQXRnV1I2RlBCekpsUlFuS29tb1I5NWMwUVI0eC81OWtZTnI4TENKMVBC?=
 =?utf-8?B?dkJQWFd0R1dkMCtjOFVpb05hN0ZsMEVOYStDL3lwT3d6NjlGTTEvQkxSMWkx?=
 =?utf-8?B?YUJLa1lwRHZEUHVFS1ZDZzdkUklCOElJZlR3ZXgvbm0rNWxKT2ZLWVRZMUxz?=
 =?utf-8?B?ZUpoeUtRSUNzVnhJZ21zTmVBRXphSUsxVjFCdm04RUZTVS9Ud1NxUUJNR25L?=
 =?utf-8?B?OHNnNi9uTk8zcVJ6b1J1RmVrU0hJdGRPQnI1bXIvVy9vaXBwUjdBK1ZTR3B4?=
 =?utf-8?B?RXJNVTNzTXM4U2lMMkdoT0JKYSswM2hOa3RxNXdSdHFhazdzYkZaYjQ2Q3NY?=
 =?utf-8?B?VUdCVldiS2xPS2NrSE5pSHdwMjVOZjVrV1FYRkY4Q3RFOEJWWWNYTnRrc0px?=
 =?utf-8?B?TGdBa1RuSnRMZ2tHNURUUFFIT3VzTXhpRTRxZHJVOVJRQ2JrWEN1M1ZRQkFX?=
 =?utf-8?B?RE9KZFdoK1hWcWJSR25OZmx6MCtCaEJWb2FUbkNuQ2JtY083bUxSQnhwaUx0?=
 =?utf-8?B?L3B2QWs2VlJPM3FmZVJ4S0JsemZIT3BnQmRPaWhRbXRGMlYrbGMrVGZkL0Z0?=
 =?utf-8?B?V1BvWktsMWtBcnRYNlFVTElmcmhYREFqZGtoVUVCc2hyNU5iejZxUUhoQTJa?=
 =?utf-8?B?bGY0OEhmKzlIMVFnVWFLeHFUUHZvM01yMmxybWMxUFlPbTV4WitIWDhRbjNS?=
 =?utf-8?B?cUtZWkJpT0ZES0IxZm5qVUJiVi9nNTZtazNJTE5pY0ZQM3pDRjBZcnc0SEcy?=
 =?utf-8?B?cGU0eTAwNnMvS3ZCN3ZlUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(52116005)(1800799015)(366007)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zmw3d3p4VE1qaTFwZmRWRWxvRDkweXk0ZEN3RnpiTlBuei8ycm9hWDlzRHh0?=
 =?utf-8?B?TGh5T1lEMEh5ajd0WEc5bXlsb1VQb01ZOGZkWGlwMWx1NnF4cWhPVXBacHYy?=
 =?utf-8?B?MHdhYkp3WlFUQTlqYnA3VGtXTGQxLzJnVTZibDUzR2phQmxWN082bWphRVRX?=
 =?utf-8?B?Q2ZVOUZNL2NlZkJDZmlOSGZ3V3pYbFltMFZXS25DNjVWUGtBdWNPNmlTMDl4?=
 =?utf-8?B?bDRkUVZZUXBKVkwzYjNFTVBTeEt6VHZhOXFja01McDMxRG11V3IxS2wzclNX?=
 =?utf-8?B?aURjbmR2cFkvRFFTVzFtWllTR25COG51QSt0WnJCcS94ZjdSdVErTmVwdDVp?=
 =?utf-8?B?NUM0eFluSUUyamJVV1VYam9JN1lacGM4cXptTktySXNnRUVBSjVrSGd3VzIw?=
 =?utf-8?B?UWVZVm45eXF5cW1PSnpaMFJUTXkvMzJFaERoUmpYQytzZTEzWGM4WnV3ejhD?=
 =?utf-8?B?azFiejlWdndQYWhjYWV6ZkFncHROSGhHZ2g1RFcrREEwcGs4enNQYXozdGlh?=
 =?utf-8?B?TTd1QWlvVlluckRwKy9jak5Nbkx3RDhCUVFhNWx6UGlrTUkyL3dCZEptc29i?=
 =?utf-8?B?N2RnTnlHblVvc2trNjdaRmlkQkZpS3ErOWJPRUZncHM3eE43WkIyMXdmWlRy?=
 =?utf-8?B?UmR3UzRJZXBtK2YvOURVMlp5dnBZUktrd0FPZnh6QUw5TFRpZ1FQTEVlRFVu?=
 =?utf-8?B?THcyU3FFdzVQRGFkT3ZZdlc0WjFSbHJXNm5wT0lCcm5oVWIxNml5MElrNTVP?=
 =?utf-8?B?SExvcXphaStOaXR6SkVOQ3lDMU15WkdUVHN3ZVZEY1UyYjhzRUZwb0dScmhW?=
 =?utf-8?B?UW5kRk8yTnk4VndzeGpPZzNLUFhxRWtjNlQ4Nzk4VWVEMVBWZkptS3pWV0xx?=
 =?utf-8?B?TEVodWVWekJFS012V0RSOStJYUlMV0dlY0JsVEhHNE1GeE9kSEhhR0lFeXc4?=
 =?utf-8?B?VDdPc3hHak4rZXhmektDRmFKSjBYZDBheTlQNVJEMDNoV0l5Vkp5SnU2SW9w?=
 =?utf-8?B?aWRnalJXYmJQMWpEVXNZcW04UVI5eUQ2czdGZHFGdTVrR1d5d2dvNk5WMmZt?=
 =?utf-8?B?bm9SZmg4RjhCczh1QTNPazhkdGJ2aThMb1Z5TkVRTDVMOVhqN3h3T0RhUTl0?=
 =?utf-8?B?VElRK3dzczhvRFBNcjBaQnFOdzJDUzgwTDUwdWFIelVkZDgvWDZiMTlYQWd4?=
 =?utf-8?B?TUpaRTdvV1hBdVN0NmRwYnR0OG9IRjA3NFFhUnppVTNJMXNXVTFEbXV5TkRJ?=
 =?utf-8?B?aTVaVE80UnBpZ0czTTVuUXVkWkVJRjU4aGV4V0pnWDFZNjFNTFFHQWtRend5?=
 =?utf-8?B?cXFLZHZJMERpM2pBZ1BQU0UveUN2ekhWMU9CcFZESitFU1NjNXhsSVJaRFZu?=
 =?utf-8?B?cnhWbCtQbDIvc1U3bEtmcnBoUkIwSmtSaUZobUNTd3dLc1MzNjQyZkcweTQx?=
 =?utf-8?B?amI1Zk1xUkU1bTA1Z0owODF6U3NLdDhCQ1dXVEtGdjh4ay93SE9QTGZPYml0?=
 =?utf-8?B?ZEFyRmNnTWJ6ZVZ5Rk5LUUtTZEZMcDcwSkZVb0ZpNEdWUUd5R29aWDNYYmVv?=
 =?utf-8?B?MmRlY0FrUlpqWjJ3QTB5OEVraTVmUmNPaEdHcDNQVlpCTVBTZllMMFN6bVNR?=
 =?utf-8?B?bXVBdWNqcEYrRVVHSmxCd2FObzR1RkdFWms0aEcyQ25qclFtUCtFbkRRTkRR?=
 =?utf-8?B?YkJqeEZJVldoTGkvc3I3QVBhd2NrZ3VJMWtucDhZLzdkVnlSSXdKczcycUtT?=
 =?utf-8?B?aDZVR1FuaXJWRCszRTJNTkNkcURZTHNNLzZIeDBxL2x3Q0ZGU20xSnNMNHk4?=
 =?utf-8?B?SkdhQnhxaDAzZGZPTTlyWHZDNjJiWWFQWHVuYkxBQ1JaOW02L0dUY3B3SFgr?=
 =?utf-8?B?Y09HcjJ6T1d3ajhIYkpJYldqS1FnTUszVEhZOTYrdU90dlpFQ0V5dGgzdHUv?=
 =?utf-8?B?SGg2QzhxZzJOM09GTnVGckpCQVBhdWZqVDNpQ2FCMGhKTnJxai9taTcxcUZE?=
 =?utf-8?B?ZlIxN092TklRT2lMaG94YURNeDk4SS8reWNVak5sM29HMjNXNlBnU0ZhZzBY?=
 =?utf-8?B?elBkVWRucTI5ZEFDNEdYOGVhTzNCZFQ5SnFwVU42cEJudXVHaFJObUw3dkRR?=
 =?utf-8?Q?1HUU4wFYWJnf4FanHeBobXVv3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e555a884-b381-4cbc-475d-08dc732cde75
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 09:12:53.0732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wBKJ4nHBmhq72hfzKzdVbXoYe3Ds4t2J4np9co3SjbhXuJp4hmuZwCO5XfIf0nhDPODRwWTP9YvYwTIENOoTog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8910

Add i.MX91 IOMUXC binding doc and driver.
i.MX91 IOMUXC has similar design as i.MX93 IOMUXC, so reuse the
i.MX93 binding.

Cc: 

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (2):
      dt-bindings: pinctrl: imx: Support i.MX91 IOMUXC
      pinctrl: imx: Add pinctrl driver support for i.MX91

 ...sl,imx93-pinctrl.yaml => fsl,imx9-pinctrl.yaml} |   8 +-
 drivers/pinctrl/freescale/Kconfig                  |   7 +
 drivers/pinctrl/freescale/Makefile                 |   1 +
 drivers/pinctrl/freescale/pinctrl-imx91.c          | 271 +++++++++++++++++++++
 4 files changed, 284 insertions(+), 3 deletions(-)
---
base-commit: 75fa778d74b786a1608d55d655d42b480a6fa8bd
change-id: 20240510-imx91-pinctrl-cf6e54edf55b

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


