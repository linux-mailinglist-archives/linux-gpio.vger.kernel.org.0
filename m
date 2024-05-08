Return-Path: <linux-gpio+bounces-6217-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE118BF4ED
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 05:24:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD3E91C22ED9
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 03:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C4913FEA;
	Wed,  8 May 2024 03:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jWDlNwE7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2043.outbound.protection.outlook.com [40.107.14.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B104211C94;
	Wed,  8 May 2024 03:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.14.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715138679; cv=fail; b=NDjVjQOmufWbt39dfVcGqEdO2Obsme3aXAKRTeEij75ogcck9A4oCvuhxGh/Z1+Zq9IDcEWmE8tXtFGpTsxALqL4K6c8lV7uGzY2HphYwT7vXhLHZAcASzoiLrxG1x2d/XW2IIQ6lXHnd055MBOr40o6uq8aioBPNMALWjn8LtI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715138679; c=relaxed/simple;
	bh=w6vuvA+joW134+3va2V+LhFIyJ6qR33gJVVoAplEiDg=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=ue18RxdnPfwGkIsxFRsKfJHO1PAro9iebRb53+cYEreRBp3rGw6rADCBVSkR5bSoGLvVeiGspiCqdAxm4RWQFiNG4JZDhYx4okbVL9/n0kkUby+HRoeyPLSZv7gnX2oKt1GyC2NMWUO8nCJRldIw3yw+icSnD7d2HjLF4HhpqYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jWDlNwE7; arc=fail smtp.client-ip=40.107.14.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IEVxo2odehs/FuKmDwKlit/SHx9uh+x06V0zZKUd2/0olH+GYh/g1I5eCd7VuVhK/+CQtuYGMCdDbNRvZjFt1oz5Sxa9J7H2UP78Esne/jdMSSodfLFIGaRtR42NhOjULmRk5y+LAp38FTuo550NrPAIRImkyYz6w0dAYrAy4JP9T27aXT9p/5KZ/uQjvNDdsMuwvE7tWaFJVoCC8rPTyxFezueBdQh0IHn3h2frYfbQ6mw5Li9j2go1DjJCVWkt3Nbyg4PcoFj7sjAVlKV20K9/AiMmoskxH2PeJNdmPmbSWaYAxXoxjryBB+SaCzueaD5Qj67/ySt8jhUpQwFmdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tck6u6Bt3DivsxpA2fKbKi4nA22xtzMv/ojU3JtYkMY=;
 b=AD7r8XjgKlraX4hB7PJWtQzBhy4NCAOdKlsbDtazg2sPFSeSwzzFLcSvWkx54XzQA5r95n9evmcNWK01jsjrMwgSr3yi9h7rXwAQP9hzMbQEdEsGSREeGR4QfgGR5CroHufk+4ih+OBPNH1Nk7HPLPKFvUd14qgLLWdm0DifO0li39alt89rFzXbY/WkWX4zKhfMRVsG0N6pxeanxy+XzA2eIppTCoOecme6ozFjcdawx9J8chD3b5eqb9YT2r/PaYQCoYuZy2RYWHh7lUh+1amzSZWDVeY7rD3iGVrAe1xmSSeiII92+BFK4g2IzBJezU1xI/aUdMSwkwSJ0LkaOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tck6u6Bt3DivsxpA2fKbKi4nA22xtzMv/ojU3JtYkMY=;
 b=jWDlNwE7ofNSkXutdts891LxtaoLzRJSg3e1VrbapCYKoHLrdZ2NkuTWIGa7VJ/aqm10C2QF5J9rOFSNWagf5uQiNGJj2N/Q6+SVhlHo9SPhtdGHCN/CQMyFj/MCKT7QvNRuAaMHLTV2gpiwQsk7QlRH+M4nGcwEZEpx3xuxCso=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AS4PR04MB9243.eurprd04.prod.outlook.com (2603:10a6:20b:4e2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Wed, 8 May
 2024 03:24:33 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 03:24:32 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v5 0/3] pinctrl: scmi: support i.MX95 OEM extensions
Date: Wed, 08 May 2024 11:32:01 +0800
Message-Id: <20240508-pinctrl-scmi-oem-v3-v5-0-6f2b167f71bc@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADHyOmYC/33NSwqDMBCA4atI1k3JSzRd9R6li5iMdaAmkkiwi
 HdvdOOmFGbzD8w3K0kQERK5VSuJkDFh8CXqS0XsYPwLKLrSRDChmBItndDbOb5psiPSACPNknL
 BJWOSm0Y5Ui6nCD0uh/p4lh4wzSF+jidZ7tv/XhlGwRmpOHSqAXf3y3S1YSS7ltUp1Kz+LagiN
 FbrXrcadGdOYdu2Lx1651P2AAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715139159; l=4220;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=w6vuvA+joW134+3va2V+LhFIyJ6qR33gJVVoAplEiDg=;
 b=6OVOe1BBC3lBsg1UBx6ZPIgLDDZ+lbWBhqv5ll8loyz6zCmuf8Du0B7HwR77OmswDkGib/pXN
 yvwvJlBG51dBqUNgdgJj26Uuq6YqlFGmzx3LVDOkaTELHRYfvT69WwW
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:3:17::22) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|AS4PR04MB9243:EE_
X-MS-Office365-Filtering-Correlation-Id: 0845db41-428b-4424-029d-08dc6f0e6103
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|376005|366007|52116005|7416005|38350700005|921011;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QUJrc0tEc1BZWEk0QzVnUDI0dEhRakRNYS9FNlBma0g2MnRNamliclpyZUYx?=
 =?utf-8?B?RmtFV0lHQW13NjVmUUJBOXJ3SjBPWmFqRTVsUXJSYkhQUHZZUjVPUDY5aWhj?=
 =?utf-8?B?eDM4RFhPV2REZVNLdTdJU1BRMVNxQk9sNkx5Vlc4MUd3OXVvYzNlZnkxUTJJ?=
 =?utf-8?B?dUlGZnhxQm9zbklOY3VqSVNqelcxeDkyK1RTOUhLVG9uNC9BUjN0ODhoYjl3?=
 =?utf-8?B?cUtVWmk0NWhwVWl2TzNSTnRmNXFtK3ZaWWRiMG5UUjhHUVVrT09uTHJXclJa?=
 =?utf-8?B?MmJsZTN0V01BOUw5em93d2U3dHpLanRoaGIrZmdHWjlFRGJBYU0vSWMxSDRt?=
 =?utf-8?B?b0FBL2NvaHVTc0hvQlJJMEY1RVB1UGhFaHRhc2dkQng5bFpyYkVFVjdwU1Ev?=
 =?utf-8?B?WEh0R0tjNTZEUXUrb0g0cXlsV0lNNFkzS3Vvb3pZbWdSOHhrSzJhc3JLRTVR?=
 =?utf-8?B?bU5mbGdkNW9weDg4N2Z5QzJnR2NvVTZkL3FBOVlKZS9EMkthVG85STRBT0J5?=
 =?utf-8?B?ZHhLdERaMWZpRXJkamtOWDlJcjc1UURXT3JXejB6Y293U01wc2oyRGZFYjFG?=
 =?utf-8?B?c3N6M1JDNWZ5M0VMWlFVcnJHL1V0MnNIY1AyTUdiZ2EyNzhnUjZ6MDVmZ3pp?=
 =?utf-8?B?UjNVRGVZQXRocGVhdWhiR04vRklxa2NRNmRaaFR6ZkhXOTB5NFpFNWp1aDR0?=
 =?utf-8?B?V3hRem8ybkwxQ0x6cU5RUFN2Y0ZtQ1Vvb0YzcnJhN1UxbUtGNzhGSEJCM1Z4?=
 =?utf-8?B?YkJjaWdxNHJQMGdFdVJxZjVBTktwS1VLUEttWVVhMmNEVGxRUlZZT0p2c0NZ?=
 =?utf-8?B?YkV1U0hnSTN3d2oyb2cvVkdCSUlpcG41YWp2RnYxYnRDWDZzWmxYV29rWEFa?=
 =?utf-8?B?OVlUQkRzc21VM2Z4c01MTHo1N3Q5dmVMTWY4SmRydDkzUUF1OXJwUW4rVzZY?=
 =?utf-8?B?ZElsZ2FhZnQ4cmMxaXNBT2N2STJaOGJVVnNURlM3YzlZZ2FEa1JEcU9VTVZX?=
 =?utf-8?B?NkJ5NnpHSFBlemFwaUw5RmNIMHI0YUxyOEN0cmRmMWtIMitIdURrT3E4Mk9k?=
 =?utf-8?B?cWZ6RVZad0xlY1pTak90Uy8xRXdYM2hYQkZrdmNPRUFmZjlQcGNlM0ZjZmhY?=
 =?utf-8?B?M05GNFdqQWs4THhiajJwakp1N0QxZnNJZENpWTd3NlU4a0JVclVwVURkdDhi?=
 =?utf-8?B?QUVsbUJ6dGNCZjB6RkM2MHY1OVV2LzhkenFjM2FUZEFuUHkyQ3NrTmRrcHRy?=
 =?utf-8?B?UHU2Q3ozbVpUZW53Zjg4N0VNSHM2ajQzUisrUDdBamRnb1ROZDhlc2FlNnB2?=
 =?utf-8?B?SVdJdmFQdGpIU0J2dXFmVmNzSXRFWVE1N00zaVI2OFhTNlhQdjhDd3owZlAv?=
 =?utf-8?B?aHhOaXZqK1NSbzlhSHVKZlVOTEZ0OGhQVUdIZUdmSUJRTFBRNEs2L0NlYmh0?=
 =?utf-8?B?M1BSRDRpaGZqZ3VkYTVKMVVzQzg5SVNyUGN0eUtnUlV4emttQzI1L3JrR2pm?=
 =?utf-8?B?bWRnaFFJTW52ZTIySlN1emlxSHNZZktmNWRPd2lZa0kyMGhTN0prU3hkcFFR?=
 =?utf-8?B?UG84aEE1UnF6VU1wYlJjdHBPZlMyUXJqNUloSzlNaGhIa29FV2VsRUZyN01J?=
 =?utf-8?B?d2N3OU00ZHlYbVdRc1dwZkZNVzI0K3ZQVDZuUGoxam9qYnc0RUZnZnJJWngr?=
 =?utf-8?B?UW9JSExxSkxuWmlhUUVFbmlkQTYya2hFUnRSeHEwWlJBTDdLS3Y3TWV5cHV0?=
 =?utf-8?B?V2VrSTVIbFJJOTUrWk1vZDJFN09QTDZCa0txU2ErS3BCeUxHVUE2MGNPMXpP?=
 =?utf-8?Q?t5a7ha79waotWG+89IFoXa0t+fMx6RHCOF070=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(52116005)(7416005)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mk5LNDBDQnZ0V2FCamZDaUs2WVBSRnh2dDFlQkRzMjRZMVVxVG9MRXpELzg2?=
 =?utf-8?B?cW1WM0JIMTlRWGU1MXhzbmJvRXJ4ZG5zZzNYRENlb20zSllEN1hNVlNPYXdk?=
 =?utf-8?B?VCtiN05IN0tVcjg1RG1OWlRJdURyMTdZSFo4RFBNaDM0UFp0cFNWcXdjWENq?=
 =?utf-8?B?cFVnVWw2RzhnNkJzT2VuWmFtalpqZDZaOUt1dWQrMWpkZXk4L2JyWnJGRENT?=
 =?utf-8?B?bHQ5cmFnS3Q4L0wrWUZvVHkxM0c2TUVqRlpHejZnZ3FqNWJaQXQ4elZrbFpM?=
 =?utf-8?B?KzhVNkRicy9GTHk4SVlwSGhHeUxXZlZPUGV6NEQ2WGRvSmxKVWlxTG1rYjR2?=
 =?utf-8?B?eHNwQXVjdmprcFB4UDhxQkJmS21mbTM4OVlocXFzQldrakIyZTdPbitlTS9v?=
 =?utf-8?B?cCtoUmZIZnNPVW1UZnVVa21ZR3AycGNJcTdJbzk3OEY0NUF4UzZmN24rOGZl?=
 =?utf-8?B?L0VRWU9EWWkyRnU2RUw5UDVDT216dVJFQVV5VDc1dHg4QkMxbDhGakNWS2dT?=
 =?utf-8?B?dzRvaUtEVmROK2lsclhWdVA3YVhEYWxyb0xJbDkvV3IyMVVoOHRJZkJGOFZV?=
 =?utf-8?B?NkQrM09TdDlxNHY5QlVmc0ZaL0hTakVBNndYT2hsQ1BlRzI3eEhXOXpIQjRV?=
 =?utf-8?B?WWlRZE9CVFNwR2tEMEp6RkFqdStaaEQ5eHVBcVFlenFmWm9oZkdHa1RoOFdv?=
 =?utf-8?B?L3JHVkVsWm5VVjlNMlQ2WFMydWlHKzdlM25MY28vSHc0aC9JRy9jL042c2Jm?=
 =?utf-8?B?S2Z2R3YrZGxTTnRUUVJSdm5LMWpKTlZzSzZRajNraWJFeHRYUG1ocmhoSUNN?=
 =?utf-8?B?eUNackJOdElSVGZYSXdUb0NkT1ZwVWhCUzlFV0VMa0tQNmx1dmU3SXpGd0xv?=
 =?utf-8?B?cWxDUDRkSkdBRkgrdWZhZmxpYm5sejQ2d01qTTFFNGRmbE51VU5VMHR6MGpQ?=
 =?utf-8?B?bWp5MnlFSEpGMVRPeTJ6bzBvTUNhbHV2Z2ZQajAxdDRCZ3pYWUZCQ0dtdjJD?=
 =?utf-8?B?T3hIZ2NVZ2FHY2VrMkRWb1FkNjV2eXk5M3g5OFhZUTBPWlVxVlpGbFFHd1I1?=
 =?utf-8?B?bVNYMU12NW43YnM1cnNGNmY1Q1pDT0xZWVE3MlNsS1hnN0taeDJucW9BUUwv?=
 =?utf-8?B?UTYwS00xcm9rUHprcEZmL0c5cHp2a2FubldJbkpOWHNlYjNKU3BlNDVCOFZk?=
 =?utf-8?B?Z2tkZ1pBWDkyWjBpc212b3phRXF3VkhiSjMwVzlTWE1NQnZpeUdhMnV5ZCty?=
 =?utf-8?B?eE1mS2RlVldjbWFRc09GZmprREZsMkNvTU1MQ2hzNUNoWjBuMTVuL2tBNzZq?=
 =?utf-8?B?U0N0eGcxZVJyZFpuSVF1THZvWHhXYzBaa1NKbStYYjZ2WU5aMmpzSFpkOVd2?=
 =?utf-8?B?c0d1eDR6dmZjdkhkYnFMd0xUU21nZ0dYVnlnV2VkVVNCN2pJaDdCTjdodi93?=
 =?utf-8?B?M2FWb2F6Mi8zdVFHODBkVjdKNFZUOWgwZ3puZnVsL21KRjBvZDhqVUNvZTQw?=
 =?utf-8?B?TWVpUEp1cVhMaXdNSVBwc3FXa2cvQXBXVDZ6VmZKWm1OYkluRWRaTCtnZWd0?=
 =?utf-8?B?emdnN2ZWSjZhb0lYNy9RSnBjcVh5dC84eFQrMmZqWHFFUlg2L3JuenFHUVFE?=
 =?utf-8?B?NGJrWVhiN1ZyRURUT2M1ek5ZMlVmU29rSVRVQkRWaStpa2JuRlEwQmExb05h?=
 =?utf-8?B?L1JEbmVRdkdBS1dQNGd4Ky9udlpaWFpMWVp5Y1hFRTUxWHBIckRwZHJOQUJ6?=
 =?utf-8?B?OGE5ekc3b3VmWmtUeXVOb3c1d3BkSzBGUzlCWlVNeCtPeU8zZ3dieURYaTYz?=
 =?utf-8?B?MDQ5bkdoRENKY2NTdFVWYWtROWxmQjQ2UGNqRFBFZVc0K1N5OTBsMnBQSVRV?=
 =?utf-8?B?R0ZzOGJLNm1Qb1pyNzh3a2IzN05kSHpZOHBEeXdSaVFBQ0xEN1h1amlvaTZt?=
 =?utf-8?B?QUxCT08rZmhrdzBVS205cWswL2cvM2VVRjBwc2J5elIycUJKdzRtRDV5enRB?=
 =?utf-8?B?Q05FSU56QWV5UnRRZENBMnZrQjMzZlllUjVDdG1mWHBIR29Za3hEeUw3a3F6?=
 =?utf-8?B?SE5wNW5raDJFOEhuTVNIbXVxSXFXMVROZDFFNFhHbzZhTVNkTDExZmlxSjlD?=
 =?utf-8?Q?qcKWTvirUiFoCybUotlft8Hfl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0845db41-428b-4424-029d-08dc6f0e6103
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 03:24:32.8951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Bt88ySPht1wN9FYQ3noniuw2q4TV6D1wtRgmmY7X45xxP3cfIdpABHSTf9Tpa6m1p4uSMMML5fQgnps2o+wuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9243

ARM SCMI v3.2 Table 24 Pin Configuration Type and Enumerations:
'192 -255 OEM specific units'.

i.MX95 System Manager FW supports SCMI PINCTRL protocol, but it has zero
functions, groups. So pinctrl-scmi.c could not be reused for i.MX95.
Because nxp,pin-func, nxp,pin-conf properties are rejected by dt
maintainers, so use generic property 'pinmux' which requires a new driver
pinctrl-imx-scmi.c

The node will be as below:
 pinctrl_usdhc1: usdhc1-pins {
         sd1-grp0 {
                 pinmux = <IMX95_PAD_SD1_CLK__USDHC1_CLK
                           IMX95_PAD_SD1_STROBE__USDHC1_STROBE>;
                 drive-strength = <0xe>;
                 input-schmitt-enable;
                 bias-pull-down;
                 slew-rate = <0x3>;
         };
         sd1-grp1 {
                 pinmux = <IMX95_PAD_SD1_CMD__USDHC1_CMD
                           IMX95_PAD_SD1_DATA0__USDHC1_DATA0
                           IMX95_PAD_SD1_DATA1__USDHC1_DATA1
                           IMX95_PAD_SD1_DATA2__USDHC1_DATA2
                           IMX95_PAD_SD1_DATA3__USDHC1_DATA3
                           IMX95_PAD_SD1_DATA4__USDHC1_DATA4
                           IMX95_PAD_SD1_DATA5__USDHC1_DATA5
                           IMX95_PAD_SD1_DATA6__USDHC1_DATA6
                           IMX95_PAD_SD1_DATA7__USDHC1_DATA7>;
                 drive-strength = <0xe>;
                 input-schmitt-enable;
                 bias-pull-up;
                 slew-rate = <0x3>;
         };
 };

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v5:
- Added Rob'r R-b in patch 1 after addressed the comments
- Per Rob, use of_machine_compatible_match for patch 2
- Use of_machine_compatible_match for patch 3, and enable COMPILE_TEST
- Link to v4: https://lore.kernel.org/r/20240505-pinctrl-scmi-oem-v3-v4-0-7c99f989e9ba@nxp.com

Changes in v4:
- Rebase to next-20240503 
- Add pinctrl-scmi-imx.c itself get pins and scmi pinctrl structure to decouple
  pinctrl-scmi.c and pinctrl-scmi-imx.c, so drop patch 3,4,5.
- Link to v3: https://lore.kernel.org/r/20240428-pinctrl-scmi-oem-v3-v3-0-eda341eb47ed@nxp.com

Changes in v3:
- patch 2,3,4,5 are new.
- Rewrite the binding, drop nxp,pin-x properties, use generic properties
  as Rob commented.
- Switch to using pinmux means pinctrl-scmi.c could not be reused, so
  add a new driver in patch 6 for i.MX95. But pinctrl_scmi_get_pins and
  scmi_pinctrl are exported for i.MX95 usage.
- Link to v2: https://lore.kernel.org/r/20240418-pinctrl-scmi-oem-v1-v2-0-3a555a3c58c3@nxp.com

Changes in v2:
- Rename nxp,imx95-pinctrl.yaml  to nxp,imx95-scmi-pinctrl.yaml and move
  to firmware
- Merged patch [1,2]/3 v1 into patch 1/2 v2.
- nxp,imx95-scmi-pinctrl.yaml only has patterProperties for subnode
  The pinctrl will be as below for i.MX95.
        pinctrl_usdhc1: usdhc1-pins {
                sd1cmd {
                        pins = "sd1cmd";
                        nxp,func-id = <0>;
                        nxp,pin-conf = <0x138e>;
                };
                sd1data {
                        pins = "sd1data";
                        nxp,func-id = <0>;
                        nxp,pin-conf = <0x138e>;
                };
        };
- Add pins enum, correct description.
- Link to v1: https://lore.kernel.org/r/20240412-pinctrl-scmi-oem-v1-v1-0-704f242544c1@nxp.com

---
Peng Fan (3):
      dt-bindings: firmware: arm,scmi: Add properties for i.MX95 Pinctrl OEM extensions
      pinctrl: scmi: add blocklist
      pinctrl: imx: support SCMI pinctrl protocol for i.MX95

 .../devicetree/bindings/firmware/arm,scmi.yaml     |   9 +-
 .../bindings/firmware/nxp,imx95-scmi-pinctrl.yaml  |  41 ++
 drivers/pinctrl/freescale/Kconfig                  |   9 +
 drivers/pinctrl/freescale/Makefile                 |   1 +
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c       | 585 +++++++++++++++++++++
 drivers/pinctrl/pinctrl-scmi.c                     |   9 +
 6 files changed, 651 insertions(+), 3 deletions(-)
---
base-commit: 4db57327adc359a3f9a3481d60104be67c42964f
change-id: 20240428-pinctrl-scmi-oem-v3-12130031a74d

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


