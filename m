Return-Path: <linux-gpio+bounces-6220-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAB68BF4F6
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 05:25:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E752F285DBE
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 03:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20CBF14F61;
	Wed,  8 May 2024 03:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UdFoAwyZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2047.outbound.protection.outlook.com [40.107.15.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF2117C60;
	Wed,  8 May 2024 03:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.15.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715138695; cv=fail; b=Gn44H2G/99Pa+iAV3czs+siVBXyyd3aDRjajzIcf15K9K8A5L2wxQQAICcmz/CmcACPVsFEH7KM9wn95x97yNquIlGiOV3VMdQcwePT3XMfDjQO1TFGIkKRziAWUVeQjKVpJbG3wZK45zK6HKysCx9edrTDTNMSYAwgRYWETaig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715138695; c=relaxed/simple;
	bh=i+e+L0T5AAjzGn+ThUn4C7d3xA/y7Of4Jynvv4/p5S0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=k/UZrL2UUHR5mIfwBJrpZ61MvMM4wVYqu2GFLID+2AslY7wY/hyu/1DZemMxAuLHHlQRt9YoAP5CBpwhIlwaGrlzY4tce/SRLt/bGCnSi7z/3FpuB0aeLi08gRrKSuhYJTvYXoo0ufSYOuNfX9c5t6/OQLq2lw2j6PMboQSwhOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UdFoAwyZ; arc=fail smtp.client-ip=40.107.15.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jHGYMNVFHV6YQnGlfz5ZE2EaU7rW/JfxnG7/szDhkFQ40Jq22bPTmDCq6Zg4AGdwUCPkOYQZtZAxlc1B58laFyamohZTK0SyFyIrEqJ1CrKhl2hGx1pXX+R9ZSo5cAfCyxWyKEqy+J+dhSFppqwxVcXGaCs0xaZ7OKnQXKxqjUIVnqMJaeo59z9LKRJOFfTNU7Ht3ifxKywPsTc4DgWqRz/kqFK8kLOb+hXuVHx/kx3NF6urXoDPPtBK7E4GLGpwGHpGpfJH1LWd4ZzXTAfLVMF4hV4bDOEAufiZ/LDQDogHsFB8iO67QsDPgrYRC62kDz+3tQj97VooeP31KBMJ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IP8DJKDCT8AHOAwIBQvaWJvyInV0GSFWq/RUIIagnYI=;
 b=flivgnI7GvOJ/r6X3kyjT57ddCQ8GOEKZaij37wWztWK5gKpBPZr2FZfgB3Q2JfIKDRd+uSZ4jUvHeZW80psQWlkoEu+JcQYQWfZPB+i0uNLHHFbdVZdi+gDd4k//sxAqon72ghTfSfOhreOYo2W3WFY69aggEbZBFKrYrNJ7C55XwvdqtUslwjP+V1Pa+3KMbFf8FC8QW37Fb/DPov014SwEh+lvdw4R/O2Pdn0AxgSQGHmmZuW4lRF26Y3ZGSJmkxwDvtIsuRk+JdFLJvw78lyOqI8n6Eui3rW+qh4LPFrjWHtavPAMIDXePHNVDE/mon9Qzhg7Xh3pe+qb3bxWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IP8DJKDCT8AHOAwIBQvaWJvyInV0GSFWq/RUIIagnYI=;
 b=UdFoAwyZemObQNmh7hc9l7koyKpRaHJnh6MwMY+zc+NToJi4bjY9OkNGRwcxZkZ3ee3AzXIgOmYt5DvukhkXestn8NgPDlSW4LboQTqSIi4t3VWXgOIr7XbKOgYxWnCoESYBdcb/r/wAtDmQHXgvhT3eqrwWsaPdsYQaaZB1leU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AS4PR04MB9243.eurprd04.prod.outlook.com (2603:10a6:20b:4e2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Wed, 8 May
 2024 03:24:50 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 03:24:50 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 08 May 2024 11:32:04 +0800
Subject: [PATCH v5 3/3] pinctrl: imx: support SCMI pinctrl protocol for
 i.MX95
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240508-pinctrl-scmi-oem-v3-v5-3-6f2b167f71bc@nxp.com>
References: <20240508-pinctrl-scmi-oem-v3-v5-0-6f2b167f71bc@nxp.com>
In-Reply-To: <20240508-pinctrl-scmi-oem-v3-v5-0-6f2b167f71bc@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715139159; l=17980;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=DPozEtOTpFEKh9oxsl2P/WL7u3Vut09AmXMYlBZ7shM=;
 b=yVQxjMd4albfUWWEbuxqPAeEoINTDQ1QL//vWN2TCSetirx/2yyFoDGkRDAoXk9HHKG2vMy5g
 ld1474UxmAUCMYaM5Vv2tAoucehb4bPYX3wAdxkDryZkRQfvs1sYcJH
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
X-MS-Office365-Filtering-Correlation-Id: 0d1df99b-f637-436a-dc40-08dc6f0e6ba2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|376005|366007|52116005|7416005|38350700005|921011;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d29OcHpKU0sxL0pHcmdmQmpaRGZ3bWJQNkkzRmRnZjhDZjM4WXEyVHRRcmdW?=
 =?utf-8?B?RlhYR29yNmdjU0ljUzFCV3pjeW5DSzRHZzlUeTFvUW1Jb1E0Tld1OWk2cTE2?=
 =?utf-8?B?SHpCU2VoemtuOTZtWXRrTG9XeXpjb0c4TjArRVJEMVdJS0hiTmlMcEc0bzVD?=
 =?utf-8?B?ZUowcHlpMVN6b010N0ZvU0hyTEVSRWhaR0VtZm9RRk9Scmw3ck1uS0FHQ1F3?=
 =?utf-8?B?cVd2S0Q4ZTRnbEh0Wm9ydy9nU2dqWnNONFhxMXhtTzFlV01ZcTZQQzhKRmpw?=
 =?utf-8?B?cUwybFN3aGxSNEhzU0dzWmM2QnErWkw3STNuUzVseXFTZjhmQ3N4dWhVdVdY?=
 =?utf-8?B?a3hKV3l4cmQwYWRRWDFXb29JeHpzeHBVR09Pd21LWUs0RllRd2JwVXhhamhV?=
 =?utf-8?B?ZHRjbGs1a3BlN3h4L0ZWdittaFhZK01wS3NJM21ZdEJUNUV2V0ZHY2trQ252?=
 =?utf-8?B?aVFEU0VGeHBoTVZKVlh3L0xRalR3bUJtRUliUmluZFp1K3R0NGtTRFVCMyts?=
 =?utf-8?B?TmwwVU90T0ZWMisxRklKSG1sZzRqRWRjRGZvQ2pWSVpPQXZja2VVc0I5R0Zu?=
 =?utf-8?B?dkdFQVMySGdEYWt2aUNIY1UyLzhCK3ZEcjRYZmZNWkxCS2hLUSswM2ZrUkNv?=
 =?utf-8?B?NmxaWE1ydHNpdTVWR3FLNjdZU2x5ZHVDMnFmSmlNLzFRcUNjVUtwVW9iRWMy?=
 =?utf-8?B?U2k5UWdLRTV3QWNYd2VRV293VmplZ2xVQkhoeklqQUp3QUlFY0VTaGs1NzEx?=
 =?utf-8?B?VnFZdk9vV2xrMHYrTWlqWFNVOFA2Qnd4S1BxZCtuTzdsSWhXdDErQTZFaEY0?=
 =?utf-8?B?bi82cUw1aUIzdm9UUUVkbFRxMTdxMkgvOXhTRkxRbEpXb1pPS21jczBTanpN?=
 =?utf-8?B?aDdGK1YyQzhISlJFVFkwYXJEdGJFRUNWU3JyTEdRVkcxaHMydEJFSGZQZk15?=
 =?utf-8?B?NHFTY0Erb0FSd0I2KzlhTGVZbTJJYnp2MEpFUXZhc3B4MkduTWZmVmVpcTVw?=
 =?utf-8?B?YU84NE02RTZlZGNxeEFlZmdHbGZNcVpCN1kxSEdxVHFQamFoMENHUms1eGNJ?=
 =?utf-8?B?VS9CVWVIUGhWcDBPcG1CcldETGZnbStpT2cyY3BmZm5Gb0lsVm9kK3MvdTVs?=
 =?utf-8?B?dk9TOXZUVDZaUkRoK2RiRzVDVHk5Zk54VUE3ZngyeXZvRFlxZ25hcDlkdUlp?=
 =?utf-8?B?THVra2xvRzhiVFhWaFdZc2ZIZDNzYy9qandYSkxWSWFNVUtHaXNoRXA5cUhZ?=
 =?utf-8?B?UFhTV2JsYzc0NkFyWUJlTGZnR1Q0MDBlRVBIeTF2bnpvdHlmS0hyaXdBclBo?=
 =?utf-8?B?a09lZ1lsWk9QekRjOEViK3RUZSs5T1lEZk44dWNPVXJkbVptTU5WRzZqTDZv?=
 =?utf-8?B?bUVSNmo2OTJjQnd6RTY0M3ltMUNGQVR0OS85MkpmZk5ETDlGam8wODVFT0t0?=
 =?utf-8?B?b3hQTHpjQ1NjbmJpZTNBNnhDc3FPaWQyeExPUkpndVdZVzlWZ056SC9KcGNl?=
 =?utf-8?B?bTlZQjdJbmdaZ090VHNPY1Q5ZWppekx4ZG4yUGF1bWluM2wvRWs5VCtkRmVs?=
 =?utf-8?B?MDZ4N3RIU2RlblJJM0hFMGZpZERodU1mQm5pVzE2M0dTbUVmcXI2Ykwzdy9o?=
 =?utf-8?B?c2swK3E0ZUJvbmIwMmswWnNZVWNPYnIvRTA1T29hbEUzWENpclN4dTBzTGpH?=
 =?utf-8?B?SWZOWWlOYkJCdVVQYm4zRDlESTN6SWlmRGlDbEgyWDdXZStFanprNlhMTS96?=
 =?utf-8?B?Y1Ivb2V1dkJ3SVpNMmVaYjMxZ3g5OFVESVRFT1FoamU3ZEV6U2dCUnVmNllq?=
 =?utf-8?Q?dS2pBBoHw4hB7QtQk8qly2deK8JmldRWSaius=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(52116005)(7416005)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUZoZFhOem9qcUEraVJuZ2J3THYzeENhVnFHTXBteFFBSjdWNWZEVDJseDU0?=
 =?utf-8?B?alQxcjlnSXhlWTgrVm80ZkovQ0V0SUwyQ2Z5VStUZWtUeDhJM0NEVjY4NGpK?=
 =?utf-8?B?cTRxcG81SzFRSGxWdFBNTExWRmFKTnZ3Z2FFOStPQXMzV1ZRYklsVUkwUVlK?=
 =?utf-8?B?WnNyVE1hVlBtNTZBTm16ZXNBenJJSHR0Zloxb0NHNkt5NURka0l6RW1wY0JF?=
 =?utf-8?B?T1NRZUphUEVPbmpGeGlnTklGL0NzbklOcStGdWxlbWx5cjlUMVZMU0kxMDFl?=
 =?utf-8?B?U1ZPbEhycnNpUm1Zb0NVRGw5cnVYZDFQNEN5TzgrZGlEdEduaUM1TWtNcnZX?=
 =?utf-8?B?SDR0QWRaZzlrTG1LeThzNkRIKzdMVXp3bFZLcVlwQk1ncTZaQW9jQUNZb1JI?=
 =?utf-8?B?Wi9YNTBDT2tRNldhSHV1N2tIYkpmdXdnVkdGNy9PMGphQ3VYZE5sR1QxZXBx?=
 =?utf-8?B?RzF2S3M2Mis0RXB4Z1A4SFJCR2plVXFsa0p3MVJrYmh1QlZOMWsrWjRjMk5J?=
 =?utf-8?B?QTFSa2Y2T05HNGErMmE4U29uZXZLTFplSnNXcWtCT3ZaT3RpTTNwaE5sd1dk?=
 =?utf-8?B?WVdTcmxNclpSRmhiamEweU9DaEtlbU1FbzBOME5nUDYrZFRLd09SZW1NdGZD?=
 =?utf-8?B?K3JlWGJjYkdXMGVjRklPZ2tRMU9nWm15ZVhXNy9ySUVBQjhuc1RkaVlJcGJp?=
 =?utf-8?B?dFNJU2FpNE9FOFUxcVNKeHphV1FRMmRhdXBNeTFSQXBqaFlkbThYMGtxcEJJ?=
 =?utf-8?B?Z3JxaEJFU0F6bm1iTUtRS0tRa1BxajluS3JDMUhZcTlhYTRpYXJOMGswdzd2?=
 =?utf-8?B?bTNYc2R5aWE4TkptM0lDb3FIVk5OOTE2WGF3S1BoRmJmZWgyelo3NkJHbE1B?=
 =?utf-8?B?UEVYV2lwM2JzUnFZMGlVK1NyU2JmRnMwcnFPaEtrYWYvMW9QZmRNakt3QUxl?=
 =?utf-8?B?ZUgrcE1KVnVJY0ZUaTl2RkZheWhacE5uZnhBNCtqd3R2cTNSRllXV3crTFZx?=
 =?utf-8?B?SFRGU2M4a2EyWFRtWmlwWXUrL1F1ZEJ0Zjh6clU1d1JtNGRqdXAzbzQxS0wx?=
 =?utf-8?B?Nm02dWY4Y1ViZ3BhNkx2U2dmL1JsQWprcThRdUhkd0g0RUZxdXh2LytMTmsx?=
 =?utf-8?B?K01PSENJMDZGM3ljcGFzQ091bWFGZS9Wei9PY2ZPUHFvSnNGNHBlTnZTNnpT?=
 =?utf-8?B?Wm94ZVJ0ZlozdGVMaHBpMlRQMGFuTVdnc0pLaVN4QkVVVTRqcDB1VW5zVmlZ?=
 =?utf-8?B?MytMRGxOa2xHK0V3eTNsYmJpVzc2a1pxUEJEUE5BSno2R0pSNFcwblgvSkpo?=
 =?utf-8?B?cnIwL2lXVEhJc01VdnI0NEk2Vk96aXhESm1OVjBROW1rOVUrazUyNzhIcGZ6?=
 =?utf-8?B?Y1o1VlU1TitubldLci9aN3VMeDVUWFcralR5TUtwT3dmckYyeEl5MDU2cGMr?=
 =?utf-8?B?cUozb2Z6T0JKL2FreTV6amVRSU4xS1FnVXlhbTg0ZjdaNXQ5RjgwTklRME5W?=
 =?utf-8?B?SVYvVlJGSzlQaHVxcTJ3SXY0TlVuZUxhS2k2dzBVaWJSclY5WG5ZTC9aUUFD?=
 =?utf-8?B?c3NnUFpLVHdEei9MWWg2ajBKZzgyVUdFY2tSaWxCQlpKS3FvWWoyMlpzdXRL?=
 =?utf-8?B?SlFGYW5LRUwrNzl4R2pjSksvazMyQXdqTWVqdFdYVEVlQkxXcG1kd3lRUUJs?=
 =?utf-8?B?M3Axb1hIRGpnZXVCanZIMTZOaFUxaVRBTlJZRG1HZFJ6RERmclJzZzR2SGl4?=
 =?utf-8?B?Q0tERHptTDFCL0tKRUdtRzhHeFlVVzVoVlZ3eC9kdWUrMWcwWjVjWEZLSHRs?=
 =?utf-8?B?dlNCdVlqcndPS2R6YUl6UjI0TkdwYlVNdDlXRGdIeVpNeGJZUlNuNmdNY0tF?=
 =?utf-8?B?V2cyUkhXRmtNNThKS1dQMVAybGRpYndiRG1TZmRhKys1djQ0SS9wMGtTYUVm?=
 =?utf-8?B?V3BRcUlEaXlhR1dwYVo4aC9wdm1IUW92MmluYlI1dHk5aWxCZUJKTlI1NW0v?=
 =?utf-8?B?ZnQ0US9uS2oxa0NIenJiSW9JaUdNTWtQRlVlcnlZVHVXQW04Y3o2QzZzNHFx?=
 =?utf-8?B?ajFhZUNyUzJzeDBRZFdRcEJUUm0vMjJlKzYxdW9hY1ZUbmRndUpPOXIrRFVM?=
 =?utf-8?Q?soM81B5jNV8CZssSSNTsSqWlt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d1df99b-f637-436a-dc40-08dc6f0e6ba2
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 03:24:50.6640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JwuOke3aKOgwq197PbEHphQDuiw4Pak25vtASI7X0Exo/uMw8+ocNGUKiBIDHq9V5UPrRqpXCl5iJ4bceO/AKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9243

From: Peng Fan <peng.fan@nxp.com>

The generic pinctrl-scmi.c driver could not be used for i.MX95 because
i.MX95 SCMI firmware not supports functions, groups or generic
'Pin Configuration Type and Enumerations' listed in SCMI Specification.

i.MX95 System Control Management Interface(SCMI) firmware only supports
below pin configuration types which are OEM specific types:
    192: PIN MUX
    193: PIN CONF
    194: DAISY ID
    195: DAISY VAL

To support Linux generic pinctrl properties(pinmux, bias-pull-[up,
down], and etc), need extract the value from the property and map
them to the format that i.MX95 SCMI pinctrl protocol understands,
so add this driver.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/freescale/Kconfig            |   9 +
 drivers/pinctrl/freescale/Makefile           |   1 +
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c | 585 +++++++++++++++++++++++++++
 3 files changed, 595 insertions(+)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index 27bdc548f3a7..711a5ab3ceb1 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -7,6 +7,15 @@ config PINCTRL_IMX
 	select PINCONF
 	select REGMAP
 
+config PINCTRL_IMX_SCMI
+	tristate "i.MX95 pinctrl driver using SCMI protocol interface"
+	depends on ARM_SCMI_PROTOCOL && OF || COMPILE_TEST
+	select PINMUX
+	select GENERIC_PINCONF
+	help
+	  i.MX95 SCMI firmware provides pinctrl protocol. This driver
+	  utilizes the SCMI interface to do pinctrl configuration.
+
 config PINCTRL_IMX_SCU
 	tristate
 	depends on IMX_SCU
diff --git a/drivers/pinctrl/freescale/Makefile b/drivers/pinctrl/freescale/Makefile
index 647dff060477..e79b4b06e71b 100644
--- a/drivers/pinctrl/freescale/Makefile
+++ b/drivers/pinctrl/freescale/Makefile
@@ -2,6 +2,7 @@
 # Freescale pin control drivers
 obj-$(CONFIG_PINCTRL_IMX)	+= pinctrl-imx.o
 obj-$(CONFIG_PINCTRL_IMX_SCU)	+= pinctrl-scu.o
+obj-$(CONFIG_PINCTRL_IMX_SCMI)	+= pinctrl-imx-scmi.o
 obj-$(CONFIG_PINCTRL_IMX1_CORE)	+= pinctrl-imx1-core.o
 obj-$(CONFIG_PINCTRL_IMX1)	+= pinctrl-imx1.o
 obj-$(CONFIG_PINCTRL_IMX27)	+= pinctrl-imx27.o
diff --git a/drivers/pinctrl/freescale/pinctrl-imx-scmi.c b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
new file mode 100644
index 000000000000..8793fb817fb8
--- /dev/null
+++ b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
@@ -0,0 +1,585 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * System Control and Power Interface (SCMI) Protocol based i.MX pinctrl driver
+ *
+ * Copyright 2024 NXP
+ */
+
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/of.h>
+#include <linux/scmi_protocol.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+#include <linux/pinctrl/machine.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+
+#include "../pinctrl-utils.h"
+#include "../core.h"
+#include "../pinconf.h"
+#include "../pinmux.h"
+
+#define DRV_NAME "scmi-pinctrl-imx"
+
+#define SCMI_NUM_CONFIGS	4
+
+struct imx_pin_group {
+	struct pingroup data;
+};
+
+struct scmi_pinctrl_imx {
+	struct device *dev;
+	struct scmi_protocol_handle *ph;
+	struct pinctrl_dev *pctldev;
+	struct pinctrl_desc pctl_desc;
+	struct pinfunction *functions;
+	unsigned int nfunctions;
+	struct pinctrl_pin_desc *pins;
+	unsigned int nr_pins;
+	const struct scmi_pinctrl_proto_ops *ops;
+	unsigned int grp_index;
+	struct imx_pin_group *groups;
+	unsigned int ngroups;
+};
+
+/* SCMI pin control types, aligned with SCMI firmware */
+#define IMX_SCMI_NUM_CFG	4
+#define IMX_SCMI_PIN_MUX	192
+#define IMX_SCMI_PIN_CONFIG	193
+#define IMX_SCMI_PIN_DAISY_ID	194
+#define IMX_SCMI_PIN_DAISY_CFG	195
+
+/*
+ * pinmux format:
+ * pin[31:21]|mux[20:16]|daisy_value[15:12]|daisy_valid[11:11]|daisy_id[10:0]
+ */
+#define IMX_PIN_ID_MASK		GENMASK(31, 21)
+#define IMX_PIN_MUX_MASK	GENMASK(20, 16)
+#define IMX_PIN_DAISY_VAL_MASK	GENMASK(15, 12)
+#define IMX_PIN_DAISY_VALID	BIT(11)
+#define IMX_PIN_DAISY_ID_MASK	GENMASK(10, 0)
+
+static inline u32 get_pin_no(u32 pinmux)
+{
+	return FIELD_GET(IMX_PIN_ID_MASK, pinmux);
+}
+
+static inline u32 get_pin_func(u32 pinmux)
+{
+	return FIELD_GET(IMX_PIN_MUX_MASK, pinmux);
+}
+
+static inline u32 get_pin_daisy_valid(u32 pinmux)
+{
+	return FIELD_GET(IMX_PIN_DAISY_VALID, pinmux);
+}
+
+static inline u32 get_pin_daisy_val(u32 pinmux)
+{
+	return FIELD_GET(IMX_PIN_DAISY_VAL_MASK, pinmux);
+}
+
+static inline u32 get_pin_daisy_no(u32 pinmux)
+{
+	return FIELD_GET(IMX_PIN_DAISY_ID_MASK, pinmux);
+}
+
+static int pinctrl_scmi_imx_map_pinconf_type(enum pin_config_param param,
+					     u32 *mask, u32 *shift)
+{
+	u32 arg = param;
+
+	switch (arg) {
+	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+		*mask = BIT(12);
+		*shift = 12;
+		break;
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+		*mask = BIT(11);
+		*shift = 11;
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		*mask = BIT(10);
+		*shift = 10;
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		*mask = BIT(9);
+		*shift = 9;
+		break;
+	case PIN_CONFIG_SLEW_RATE:
+		*mask = GENMASK(8, 7);
+		*shift = 7;
+		break;
+	case PIN_CONFIG_DRIVE_STRENGTH:
+		*mask = GENMASK(6, 1);
+		*shift = 1;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int pinctrl_scmi_imx_dt_group_node_to_map(struct pinctrl_dev *pctldev,
+						 struct device_node *np,
+						 struct pinctrl_map **map,
+						 unsigned int *reserved_maps,
+						 unsigned int *num_maps,
+						 const char *func_name)
+{
+	struct device *dev = pctldev->dev;
+	unsigned long *cfgs = NULL;
+	unsigned int n_cfgs, reserve = 1;
+	int i, n_pins, ret;
+	u32 ncfg, val, mask, shift, pin_conf, pinmux_group;
+	unsigned long cfg[IMX_SCMI_NUM_CFG];
+	enum pin_config_param param;
+	struct property *prop;
+	const __be32 *p;
+
+	n_pins = of_property_count_u32_elems(np, "pinmux");
+	if (n_pins < 0) {
+		dev_warn(dev, "Can't find 'pinmux' property in node %pOFn\n", np);
+		return -EINVAL;
+	} else if (!n_pins) {
+		return -EINVAL;
+	}
+
+	ret = pinconf_generic_parse_dt_config(np, pctldev, &cfgs, &n_cfgs);
+	if (ret) {
+		dev_err(dev, "%pOF: could not parse node property\n", np);
+		return ret;
+	}
+
+	pin_conf = 0;
+	for (i = 0; i < n_cfgs; i++) {
+		param = pinconf_to_config_param(cfgs[i]);
+		ret = pinctrl_scmi_imx_map_pinconf_type(param, &mask, &shift);
+		if (ret) {
+			dev_err(dev, "Error map pinconf_type %d\n", ret);
+			goto free_cfgs;
+		}
+
+		val = pinconf_to_config_argument(cfgs[i]);
+
+		pin_conf |= (val << shift) & mask;
+
+	}
+
+	reserve = n_pins * (1 + n_cfgs);
+
+	ret = pinctrl_utils_reserve_map(pctldev, map, reserved_maps, num_maps,
+					reserve);
+	if (ret < 0)
+		goto free_cfgs;
+
+	of_property_for_each_u32(np, "pinmux", prop, p, pinmux_group) {
+		u32 pin_id, pin_func, daisy_id, daisy_val, daisy_valid;
+		const char *pin_name;
+
+		i = 0;
+		ncfg = IMX_SCMI_NUM_CFG;
+		pin_id = get_pin_no(pinmux_group);
+		pin_func = get_pin_func(pinmux_group);
+		daisy_id = get_pin_daisy_no(pinmux_group);
+		daisy_val = get_pin_daisy_val(pinmux_group);
+		cfg[i++] = pinconf_to_config_packed(IMX_SCMI_PIN_MUX, pin_func);
+		cfg[i++] = pinconf_to_config_packed(IMX_SCMI_PIN_CONFIG, pin_conf);
+
+		daisy_valid = get_pin_daisy_valid(pinmux_group);
+		if (daisy_valid) {
+			cfg[i++] = pinconf_to_config_packed(IMX_SCMI_PIN_DAISY_ID,
+							    daisy_id);
+			cfg[i++] = pinconf_to_config_packed(IMX_SCMI_PIN_DAISY_CFG,
+							    daisy_val);
+		} else {
+			ncfg -= 2;
+		}
+
+		pin_name = pin_get_name(pctldev, pin_id);
+
+		dev_dbg(dev, "pin: %s, pin_conf: 0x%x, daisy_id: %u, daisy_val: 0x%x\n",
+			pin_name, pin_conf, daisy_id, daisy_val);
+
+		ret = pinctrl_utils_add_map_configs(pctldev, map, reserved_maps,
+						    num_maps, pin_name,
+						    cfg, ncfg,
+						    PIN_MAP_TYPE_CONFIGS_PIN);
+		if (ret < 0)
+			goto free_cfgs;
+	};
+
+free_cfgs:
+	kfree(cfgs);
+	return ret;
+}
+
+static int pinctrl_scmi_imx_dt_node_to_map(struct pinctrl_dev *pctldev,
+					   struct device_node *np_config,
+					   struct pinctrl_map **map,
+					   unsigned int *num_maps)
+
+{
+	unsigned int reserved_maps;
+	int ret;
+
+	reserved_maps = 0;
+	*map = NULL;
+	*num_maps = 0;
+
+	for_each_available_child_of_node_scoped(np_config, np) {
+		ret = pinctrl_scmi_imx_dt_group_node_to_map(pctldev, np, map,
+							    &reserved_maps,
+							    num_maps,
+							    np_config->name);
+		if (ret < 0) {
+			pinctrl_utils_free_map(pctldev, *map, *num_maps);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static const struct pinctrl_ops pinctrl_scmi_imx_pinctrl_ops = {
+	.get_groups_count = pinctrl_generic_get_group_count,
+	.get_group_name = pinctrl_generic_get_group_name,
+	.get_group_pins = pinctrl_generic_get_group_pins,
+	.dt_node_to_map = pinctrl_scmi_imx_dt_node_to_map,
+	.dt_free_map = pinconf_generic_dt_free_map,
+};
+
+static int pinctrl_scmi_imx_func_set_mux(struct pinctrl_dev *pctldev,
+					 unsigned int selector, unsigned int group)
+{
+	/*
+	 * For i.MX SCMI PINCTRL , postpone the mux setting
+	 * until config is set as they can be set together
+	 * in one IPC call
+	 */
+	return 0;
+}
+
+static const struct pinmux_ops pinctrl_scmi_imx_pinmux_ops = {
+	.get_functions_count = pinmux_generic_get_function_count,
+	.get_function_name = pinmux_generic_get_function_name,
+	.get_function_groups = pinmux_generic_get_function_groups,
+	.set_mux = pinctrl_scmi_imx_func_set_mux,
+};
+
+static int pinctrl_scmi_imx_pinconf_get(struct pinctrl_dev *pctldev,
+					unsigned int pin, unsigned long *config)
+{
+	int ret;
+	struct scmi_pinctrl_imx *pmx = pinctrl_dev_get_drvdata(pctldev);
+	enum pin_config_param config_type;
+	u32 mask, val, shift;
+	u32 config_value;
+
+	if (!config)
+		return -EINVAL;
+
+	config_type = pinconf_to_config_param(*config);
+
+	ret = pinctrl_scmi_imx_map_pinconf_type(config_type, &mask, &shift);
+	if (ret)
+		return ret;
+
+	ret = pmx->ops->settings_get_one(pmx->ph, pin, PIN_TYPE,
+					 IMX_SCMI_PIN_CONFIG, &val);
+	/* Convert SCMI error code to PINCTRL expected error code */
+	if (ret == -EOPNOTSUPP)
+		return -ENOTSUPP;
+	if (ret)
+		return ret;
+
+	config_value = (val & mask) >> shift;
+	*config = pinconf_to_config_packed(config_type, config_value);
+
+	dev_dbg(pmx->dev, "pin:%s, conf:0x%x, type: %d, val: %u",
+		pin_get_name(pctldev, pin), val, config_type, config_value);
+
+	return 0;
+}
+
+static int pinctrl_scmi_imx_pinconf_set(struct pinctrl_dev *pctldev,
+					unsigned int pin,
+					unsigned long *configs,
+					unsigned int num_configs)
+{
+	struct scmi_pinctrl_imx *pmx = pinctrl_dev_get_drvdata(pctldev);
+	enum scmi_pinctrl_conf_type config_type[SCMI_NUM_CONFIGS];
+	u32 config_value[SCMI_NUM_CONFIGS];
+	enum scmi_pinctrl_conf_type *p_config_type = config_type;
+	u32 *p_config_value = config_value;
+	int ret;
+	int i;
+
+	if (!configs || !num_configs)
+		return -EINVAL;
+
+	if (num_configs > SCMI_NUM_CONFIGS) {
+		dev_err(pmx->dev, "num_configs(%d) too large\n", num_configs);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < num_configs; i++) {
+		/* cast to avoid build warning */
+		p_config_type[i] =
+			(enum scmi_pinctrl_conf_type)pinconf_to_config_param(configs[i]);
+		p_config_value[i] = pinconf_to_config_argument(configs[i]);
+
+		dev_err(pmx->dev, "pin: %u, type: %u, val: 0x%x\n",
+			pin, p_config_type[i], p_config_value[i]);
+	}
+
+	ret = pmx->ops->settings_conf(pmx->ph, pin, PIN_TYPE, num_configs,
+				      p_config_type,  p_config_value);
+	if (ret)
+		dev_err(pmx->dev, "Error set config %d\n", ret);
+
+	return ret;
+}
+
+static const struct pinconf_ops pinctrl_scmi_imx_pinconf_ops = {
+	.is_generic = true,
+	.pin_config_get = pinctrl_scmi_imx_pinconf_get,
+	.pin_config_set = pinctrl_scmi_imx_pinconf_set,
+	.pin_config_config_dbg_show = pinconf_generic_dump_config,
+};
+
+static int scmi_pinctrl_imx_parse_groups(struct device_node *np,
+					 struct imx_pin_group *grp,
+					 struct scmi_pinctrl_imx *pmx)
+{
+	const __be32 *p;
+	struct device *dev;
+	struct property *prop;
+	unsigned int *pins;
+	int npins;
+	u32 i = 0, pinmux;
+
+	dev = pmx->dev;
+
+	dev_dbg(dev, "group: %pOFn\n", np);
+
+	/* Initialise group */
+	grp->data.name = np->name;
+
+	npins = of_property_count_elems_of_size(np, "pinmux", sizeof(u32));
+	if (npins < 0) {
+		dev_err(dev, "Failed to read 'pinmux' property in node %s.\n",
+			grp->data.name);
+		return npins;
+	}
+	if (!npins) {
+		dev_err(dev, "The group %s has no pins.\n", grp->data.name);
+		return -EINVAL;
+	}
+
+	grp->data.npins = npins;
+
+	pins = devm_kcalloc(pmx->dev, npins, sizeof(*pins), GFP_KERNEL);
+	if (!pins)
+		return -ENOMEM;
+
+	i = 0;
+	of_property_for_each_u32(np, "pinmux", prop, p, pinmux) {
+		pins[i] = get_pin_no(pinmux);
+		dev_dbg(pmx->dev, "pin reg: 0x%x", pins[i] * 4);
+		i++;
+	}
+
+	grp->data.pins = pins;
+
+	return 0;
+}
+
+static int scmi_pinctrl_imx_parse_functions(struct device_node *np,
+					    struct scmi_pinctrl_imx *pmx,
+					    u32 index)
+{
+	struct pinfunction *func;
+	struct imx_pin_group *grp;
+	const char **groups;
+	u32 i = 0;
+	int ret = 0;
+
+	dev_dbg(pmx->dev, "parse function(%u): %pOFn\n", index, np);
+
+	func = &pmx->functions[index];
+
+	/* Initialise function */
+	func->name = np->name;
+	func->ngroups = of_get_child_count(np);
+	if (func->ngroups == 0) {
+		dev_err(pmx->dev, "no groups defined in %pOF\n", np);
+		return -EINVAL;
+	}
+
+	groups = devm_kcalloc(pmx->dev, func->ngroups, sizeof(*func->groups),
+			      GFP_KERNEL);
+	if (!groups)
+		return -ENOMEM;
+
+	for_each_child_of_node_scoped(np, child) {
+		groups[i] = child->name;
+		grp = &pmx->groups[pmx->grp_index++];
+		ret = scmi_pinctrl_imx_parse_groups(child, grp, pmx);
+		if (ret)
+			return ret;
+		i++;
+	}
+
+	func->groups = groups;
+
+	return 0;
+}
+
+static int scmi_pinctrl_imx_probe_dt(struct scmi_device *sdev,
+				     struct scmi_pinctrl_imx *pmx)
+{
+	int i, ret, nfuncs;
+	struct device_node *np = sdev->dev.of_node;
+
+	pmx->dev = &sdev->dev;
+
+	nfuncs = of_get_child_count(np);
+	if (nfuncs <= 0) {
+		dev_err(&sdev->dev, "no functions defined\n");
+		return -EINVAL;
+	}
+
+	pmx->nfunctions = nfuncs;
+	pmx->functions = devm_kcalloc(&sdev->dev, nfuncs,
+				      sizeof(*pmx->functions), GFP_KERNEL);
+	if (!pmx->functions)
+		return -ENOMEM;
+
+	pmx->ngroups = 0;
+	for_each_child_of_node_scoped(np, child)
+		pmx->ngroups += of_get_child_count(child);
+
+	pmx->groups = devm_kcalloc(&sdev->dev, pmx->ngroups,
+				   sizeof(*pmx->groups), GFP_KERNEL);
+	if (!pmx->groups)
+		return -ENOMEM;
+
+	i = 0;
+	for_each_child_of_node_scoped(np, child) {
+		ret = scmi_pinctrl_imx_parse_functions(child, pmx, i++);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int
+scmi_pinctrl_imx_get_pins(struct scmi_pinctrl_imx *pmx, struct pinctrl_desc *desc)
+{
+	struct pinctrl_pin_desc *pins;
+	unsigned int npins;
+	int ret, i;
+
+	npins = pmx->ops->count_get(pmx->ph, PIN_TYPE);
+	pins = devm_kmalloc_array(pmx->dev, npins, sizeof(*pins), GFP_KERNEL);
+	if (!pins)
+		return -ENOMEM;
+
+	for (i = 0; i < npins; i++) {
+		pins[i].number = i;
+		/* no need free name, firmware driver handles it */
+		ret = pmx->ops->name_get(pmx->ph, i, PIN_TYPE, &pins[i].name);
+		if (ret)
+			return dev_err_probe(pmx->dev, ret,
+					     "Can't get name for pin %d", i);
+	}
+
+	desc->npins = npins;
+	desc->pins = pins;
+	dev_dbg(pmx->dev, "got pins %u", npins);
+
+	return 0;
+}
+
+static const char * const scmi_pinctrl_imx_allowlist[] = {
+	"fsl,imx95",
+	NULL
+};
+
+static int scmi_pinctrl_imx_probe(struct scmi_device *sdev)
+{
+	struct device *dev = &sdev->dev;
+	struct scmi_pinctrl_imx *pmx;
+	const struct scmi_handle *handle;
+	struct scmi_protocol_handle *ph;
+	const struct scmi_pinctrl_proto_ops *pinctrl_ops;
+	int ret;
+
+	if (!sdev->handle)
+		return -EINVAL;
+
+	if (!of_machine_compatible_match(scmi_pinctrl_imx_allowlist))
+		return -ENODEV;
+
+	handle = sdev->handle;
+
+	pinctrl_ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_PINCTRL, &ph);
+	if (IS_ERR(pinctrl_ops))
+		return PTR_ERR(pinctrl_ops);
+
+	pmx = devm_kzalloc(dev, sizeof(*pmx), GFP_KERNEL);
+	if (!pmx)
+		return -ENOMEM;
+
+	pmx->ph = ph;
+	pmx->ops = pinctrl_ops;
+
+	pmx->dev = dev;
+	pmx->pctl_desc.name = DRV_NAME;
+	pmx->pctl_desc.owner = THIS_MODULE;
+	pmx->pctl_desc.pctlops = &pinctrl_scmi_imx_pinctrl_ops;
+	pmx->pctl_desc.pmxops = &pinctrl_scmi_imx_pinmux_ops;
+	pmx->pctl_desc.confops = &pinctrl_scmi_imx_pinconf_ops;
+
+	ret = scmi_pinctrl_imx_get_pins(pmx, &pmx->pctl_desc);
+	if (ret)
+		return ret;
+
+	ret = scmi_pinctrl_imx_probe_dt(sdev, pmx);
+	if (ret)
+		return ret;
+
+	ret = devm_pinctrl_register_and_init(dev, &pmx->pctl_desc, pmx,
+					     &pmx->pctldev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register pinctrl\n");
+
+	return pinctrl_enable(pmx->pctldev);
+}
+
+static const struct scmi_device_id scmi_id_table[] = {
+	{ SCMI_PROTOCOL_PINCTRL, "pinctrl-imx" },
+	{ }
+};
+MODULE_DEVICE_TABLE(scmi, scmi_id_table);
+
+static struct scmi_driver scmi_pinctrl_imx_driver = {
+	.name = DRV_NAME,
+	.probe = scmi_pinctrl_imx_probe,
+	.id_table = scmi_id_table,
+};
+module_scmi_driver(scmi_pinctrl_imx_driver);
+
+MODULE_AUTHOR("Peng Fan <peng.fan@nxp.com>");
+MODULE_DESCRIPTION("i.MX SCMI pin controller driver");
+MODULE_LICENSE("GPL");

-- 
2.37.1


