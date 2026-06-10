Return-Path: <linux-gpio+bounces-38260-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5f3rNn1pKWquWQMAu9opvQ
	(envelope-from <linux-gpio+bounces-38260-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 15:41:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24840669D68
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 15:41:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=EeWR9O1Q;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38260-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38260-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16AD833F13F4
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 13:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C670408611;
	Wed, 10 Jun 2026 13:33:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011062.outbound.protection.outlook.com [52.101.70.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E136240BCB3;
	Wed, 10 Jun 2026 13:33:44 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098431; cv=fail; b=lBP+jLCP1m/VDGR6E6eDyP4PxFmiyx1lgoivnIayj3SWp4jR1M84kzYiZ6wpdkbXe4nYajFzzncSlFMIB7UpW6FedXBoY1bOg+YGcx9sxEqLhIDJpNvgoWD2PK5YRvQJ13ZTmv8CTfW6ysh+4r1/PP64wtXnZLl+2azppC/5wfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098431; c=relaxed/simple;
	bh=DuE2QnfZB5FI3k2wRaOl4sQhImeSrN4dq2eFyi6YCt4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=F5qBZcqCaBjW9AURQhLvmkX4qGVjWR7Z6dI2xri8AeMb8w/zOAF3HWZiX8g1e1SCLQmM91Y7TpgZv/27x6jgYFml/aD1jEAuT67NVDsXYzb21RvLpUE000n8W0FmkXKNmfMeHFUxrNLSUhLnHUJTXKpVq1uod58VQMg29X9COpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EeWR9O1Q; arc=fail smtp.client-ip=52.101.70.62
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gdGZhAKerJ0QENRIPJ8Zs3/jmBAbwmutypdiaQNYTWrUCX8R2/ntDOwUtJNnuU8VmcsDPrMVz/Zynl7O+TXCuRKKOWuiTMb+CppTV9O41QUYE26roH797AgQr+SmAvwTuwlm3aFnSB2OfY4P41HNg3au9rkroITK8O46vfRnAzv9e/9jhh5T0lL/JzZtBlZVTbwetlc1PRZ3bj7+OX/Trb3d4O80doQ8Ib4NTVRyur4XX+lB3ARUSTQ+8W3sJTlBb5tO9sQ0bKH048jlnaPq/w+LuyIO8Zt+vh45KCI68z858Qv3UIcLGno7nyeGg14X5EDNvEqqXYbPs/W39VhUlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Prw+j+TQ/NzJnmEq6UQEzPw6kjwHf00popsvoY0dUc=;
 b=e4Rz2pjkj/vuLgBvOowaV39emM7T9RY350ioDM4ysBXSdcuu12jzf8B47TDMeJIleMjXq8FppY0bNVhZyzdZT3pvyVtGuXw5xxlpo2QgP62/bate+bxkjYBOV+Mb/yjtrBoFvTLD6GSpsfhW1Ifau5+50JiaZgO7QpndpCgUUpRCSJvqoiq2bKCUCu3dlBGEvYryVV95K2xuJCGiMUNfky5IJiwcFChF+n2q1wsgttJDMKRlVQQHiQtuVFjH7H+rrlhGjwnFWHrwCZxCw9Rl3RJZZ/ssUKuK71rWFVA7kaDvZato2GOjSPNO81rK7ABr7Vu7ataWwUCv8RC9Qr0P/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Prw+j+TQ/NzJnmEq6UQEzPw6kjwHf00popsvoY0dUc=;
 b=EeWR9O1QkfczjNyQNtRIINEvQIPZGx4XvEsjBvSjG8TVFwpkMMXS6mOhEaCXWtD/n2r8cN0PAi9znsIc4/KZmWXJBnlL5oEJh4SNHvqK3RRgivndcRFCHB/D1my7EQdOh/UFPxgOBVbUEFXWYeL9W/54N2etcJVZq6DueJlwEgESlvN3rqAaHYXAmqAR1ao3QH/s2LXj5RgYyP3VUsgDPmL1J/m3IQaBN9Qs2wGsHmAwceLDAlcIztra/9lsMrIXrQMlBRurTGjaqEYwTV3FPStwVoqbsxujB0EwqDYxf2BL7wOw93APFM5wmaafVFwnSe7CfBpHQ644NI9L/vRJeA==
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 13:33:41 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 13:33:40 +0000
Message-ID: <be442821-34a9-42fe-8543-d04712dee0e1@oss.nxp.com>
Date: Wed, 10 Jun 2026 16:33:36 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/7] pinctrl: s32cc: implement GPIO functionality
To: Linus Walleij <linusw@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>, Lee Jones <lee@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>,
 Jacky Bai <ping.bai@nxp.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>, Alberto Ruiz <aruizrui@redhat.com>,
 Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org,
 Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 NXP S32 Linux Team <s32@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Vincent Guittot <vincent.guittot@linaro.org>
References: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260504131148.3622697-7-khristineandreea.barbulescu@oss.nxp.com>
 <CAD++jLnk4q7L_cFzz+1gKkAqwhv=TW1_XSepuii7b_PHF7EPqQ@mail.gmail.com>
 <704e9e7b-0f45-4ed3-a686-9e20056eab2a@oss.nxp.com>
 <CAD++jLk-7UqjCsM4jCdRmBMMaNNXe8Gi_E00fJ_MRMsEGQcMZQ@mail.gmail.com>
 <48494e7b-4cba-4372-9090-f40240d820c4@oss.nxp.com>
 <CAD++jLme25qcWpzVa44VwTmnAf+Rt7suF8DgUs5tGyM_UyNbyw@mail.gmail.com>
Content-Language: en-US
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <CAD++jLme25qcWpzVa44VwTmnAf+Rt7suF8DgUs5tGyM_UyNbyw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::13) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|MI3PR04MB12438:EE_
X-MS-Office365-Filtering-Correlation-Id: d47cce3e-f257-41fc-be69-08dec6f4e27d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|19092799006|7416014|376014|366016|18002099003|22082099003|3023799007|6133799003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
 IOAKBoi+bwI1de2qyyZytZkWE13B5Oh9rIxDg7pSeTB+f7cBZUHUKrkw/2owozMDUW14LS8vJWvC7Rex27h9Qu2GkYraYmyu70v7i1xs4GcLKic9otWyp4YV6PleHjRoIAhag0aI3q8W2H2XhrsNrl8NoaN9oxxkmCV6cSwh0zd9CQuM2HO11x4AtYFigJBq7haC+taTi7hVrgT1t1CfHad6aEUGa5Tc+vgPxjkhVEdI0uWAbEaMOPCy0Ykm/3HmzVEwUNMIPZtmva+RI7lLA8nyd49kr1RuOkIA+QRA4zZWWmzPALO5ZGuIOozcD7GH5roeFauMkW08lkjjW3iQBUmhDdE8eOkk5tXAQ9i/FTvZTvSb1+ljG//jtJ/Q3mWhiQfHyZLp9YFQYPke+7I3xcPU08s502DqW5+cfpS2QNmCMM6WiCZokxNw9WTlrrkrYQWNS5hEf5PG5DyJVKwWP1PhtegEsnG8uREwK89GKaE+b0j0O2ENFFOCWZdzcm4szhjQjWdS/SkQMfiTgrlOsyJlvtD9QzD4RXkbSB0y1xbamj6k6jjM2yw3yBEO+JzlKcczCNwEAxpicKTQQuqh2hielB6wcbNd1q4nerCtXr7w6pygN7CaNDdibRter7D3FRlz0eqNaLlRIvbXNVIVgK0Duif8hLcy4a5HjlkAZIVerjkldcGJYz3iaRY1bvXi
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(19092799006)(7416014)(376014)(366016)(18002099003)(22082099003)(3023799007)(6133799003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?YjZtSzNUSnZlT09BeGRJaXhjR0w3TWRhQVZBS0ZmM2krR0cxU3lkbXNXMEh2?=
 =?utf-8?B?bHR0M1RVU2hMcXM5UzFnNTNJZFN2QzJ1cUZ3b1lTUGlSRHFORmg4Tnp2RmQ1?=
 =?utf-8?B?Q2VjVktKcmw2dThLS3BLS0FVSHlMSzNRdHhyZ1lNOURrTXZiNEZjQlZMTWM5?=
 =?utf-8?B?SlhJaXJ5cmc1K3lhbG1WRWNqZkhKeGk4NTk0dHJ2L0dQU3hhaTIwL2dnUE5J?=
 =?utf-8?B?TVBlbmltOVFTWHNwMTVvQ3Vpc2FYTDlYNm1ZL0duMXlRVWs3b0I0d0xnNlpz?=
 =?utf-8?B?akRrMGFMN3JTTnVkRXR2OFU5VnFoRWJ2Z0FvSGhqNTRiTHJXUGh2eEwvaEtz?=
 =?utf-8?B?K24vOTlXM1lWdzJtQWIwRTRUSG5VQjBMWTRPUHo1TmRiOGxDQWFWaFJvSDl1?=
 =?utf-8?B?NGV0aHZkbmJjTXVzL0dMaVcrMno2VEc1ZGRIc2JSRjR2bU9UMTlJK1hTaGtq?=
 =?utf-8?B?bnBpaWRxQlpYY1FHUGxmamxPazBFYnVTQ1UyTms3b1c0c1lTMDFaNGRXZGRx?=
 =?utf-8?B?ajhTUG5WMlFoZTQ4Y1JwTlNyU2VBd3dBUzFjNWVCZGtpaXl0cnBhWnZnbTd3?=
 =?utf-8?B?QVViOU9XcUF3dEk4VmsvM0M2anFYdmRsWit6NzM1R0RoTlNKWXh5UDhUMjM0?=
 =?utf-8?B?RXdmMHdiSHgxQVRJNGhoMDdkeDZhbDRteXVaeXVoUHZFK0dLOTQ2NDVRdHZ3?=
 =?utf-8?B?RGFtaDdpaE45SnV0T3h3U3hmTzZYaW1ZRXJMQ0t6d21pNU5raGl6b0VXZ25y?=
 =?utf-8?B?bXhqdnFCNjhEYVQvb0tNQ0ZUMG1LV01PZzRadkFpa3pFNkJrZlloT1BxVFZ2?=
 =?utf-8?B?ZVdmS254TFdKd1UrcVZnNnBCLzJBYVJHWjA2RzBreXAranRlS2IvMGZVM3hN?=
 =?utf-8?B?VlpXRTY5aVhZejllNjdXb2cwbGx4SjBiVmpGU0QxMkgweDhGTEtFVCs3NWZz?=
 =?utf-8?B?S2pMUEw0MWdMLzFQQUp4bEdYZGVJRjdBTFVvdXJNZ2JGY21xNE1oRVBYSnVO?=
 =?utf-8?B?V2NVSnBwV2FEWjU0a3VWVkZ5QkFLa0lBYUxwYjBpdFc2ZTQ2ZlZDNVVKRnd6?=
 =?utf-8?B?VzdpMVpYVmtRdWxhZVZPbUJCL2pOTnh4Tk11ZWJFcHA2am1GeWdTTFZsVS8x?=
 =?utf-8?B?c216UjArT3Z0OGFDTzN5VTVtdTA1T3B4UWc0UTYwV0tYUENOV04xZDNJcmVE?=
 =?utf-8?B?N1A4cVBPVnkrYVB5ZWhIN2p1dVpiSjVINWZHMjM2RS9ETklYc3ljbWd2Vmxn?=
 =?utf-8?B?QkNIZ1dlRloya0dGTG5lK1QzbzBSM2M1c1pQcFNHN1JDVVBDcnZ2T0ZzeTB5?=
 =?utf-8?B?U0lkTlF6eitRUEFMMkZtd3BMaG5kdmxyRDdRLzAySjRVS0ZWT1BkK0U3NGpT?=
 =?utf-8?B?K2NZTlB0T0lZbDVtM2prNE50T0g4NEl3bmtGSkNYL2dkWWNFUyt4WUdXcnNT?=
 =?utf-8?B?MmhrYndQZDZ0V2hwSmpMZXhsQ0lwYmRsb1BZVThDeFo2eU5EL2MrWmRQM0t1?=
 =?utf-8?B?dTZTWG9CUE8zKzRLckd5dTFnVlp3SzNrM3dUbllrQjBUOW5xTldvMytTRHNv?=
 =?utf-8?B?b0VJM1o3WW9jV1lpU0F4L3dWeURTLzkvbGpRaXVwQmFucWdtdmxtbHJIRHZV?=
 =?utf-8?B?bEptSVd2QVl3Sm42WTdWTy9BUWRoU0xkckdxdW9neHZCSklTYkxFU0w5VmNw?=
 =?utf-8?B?eTVtTlhZcFVvYjZQd1V1T0h4cmtQUkRmUk9pbkhtd09oOEU1dDJ4K216RVJQ?=
 =?utf-8?B?bkt2eWlBZGRheXQvd3AweDNlUnR0My9pM29UdTdBU0JxSXU4VGc3d1ZwSFVC?=
 =?utf-8?B?b1Z1WHp5ZHcvL1FVSU0vSlRTekhzRkFnL2ZXLzgvWEpPK1ZNRjJ0N3ZCNU1z?=
 =?utf-8?B?TVNkb2MyU2JxU0tlUDd2Yld3T3Z1aVJwSlhqVms4cUxoUjU4TXpBYjlCMGFy?=
 =?utf-8?B?K1hTUUlSaml4SVZpby9neW43ckpxMnl1NlFXTDJkTU1rTW9LZGZMTW5Cbnpu?=
 =?utf-8?B?V1o1T1B6QS8wRjVnbjNRZnNnRzdPNTRwSGdTTHdDeDE1TXhkeVVzc2dOelZW?=
 =?utf-8?B?WHNQY1R4R1FPSFl4dEt5amdDOHVNOFdkc3h1ZUp0RDJKdjdhRGMrcEo2NkUv?=
 =?utf-8?B?bDd1MTZhMk5leW9FZmFnL3F3ZXVGZmo0clg4TmJMTUI1WWtmVFpDc2FFR21s?=
 =?utf-8?B?SlVIMWt6c0NhTVJxNmF4NVV0eXRZR1lCY1hCU3MyNG5ZNVVNVmFOd0VqNENp?=
 =?utf-8?B?eTdtandmcnpuNFNnd3lhcCtodzBrZTVTUG9LZC9Gck5GbDBmaVg4MjV5dlhu?=
 =?utf-8?B?OUM0WEZHRytPVXN4bGo5V1Q1ZmZ5b0QxazhVVmRRRjN2a3FWZFRENVgzdlRw?=
 =?utf-8?Q?z8IOaG/i4Mbg2DazzTaeIiRx6104sbba08KL2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d47cce3e-f257-41fc-be69-08dec6f4e27d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 13:33:40.8734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NMV75qxqimFlP2oJHOLXUII6Lue/49tN3PZqsIPsKwMhMNk8cFczGr3/HiycZ3Lw489HUrfU7zpZe/V3McpyW3Ca3U6nRzeL4J2n2hLdRF4Fb6q3fJ/vTvj10QqME54j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI3PR04MB12438
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38260-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:linus.walleij@linaro.org,m:brgl@bgdev.pl,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:chester62515@gmail.com,m:mbrugger@suse.com,m:ghennadi.procopciuc@nxp.com,m:larisa.grigore@nxp.com,m:lee@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:festevam@gmail.com,m:aisheng.dong@nxp.com,m:ping.bai@nxp.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:srini@kernel.org,m:aruizrui@redhat.com,m:clizzi@redhat.com,m:devicetree@vger.kernel.org,m:eballetb@redhat.com,m:echanude@redhat.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:s32@nxp.com,m:kernel@pengutronix.de,m:vincent.guittot@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org,redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,NXP1.onmicrosoft.com:dkim,nxp.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.nxp.com:mid,oss.nxp.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 24840669D68

On 6/9/2026 1:33 AM, Linus Walleij wrote:
> Hi Khristine,
> 
> On Tue, Jun 2, 2026 at 10:05 AM Khristine Andreea Barbulescu
> <khristineandreea.barbulescu@oss.nxp.com> wrote:
> 
>> The new version (v10) has been updated to use gpio-regmap, with a virtual
>> regmap bridge dispatching GPIO accesses to the underlying SIUL2 register
>> blocks.
>>
>> I am not fully convinced this is the cleanest model, though.
>> SIUL2 does not expose GPIO as one regular register space: direction is in
>> MSCR, input values are read from PGPDI, and output values are written through
>> PGPDO. These are backed by separate regmaps in the driver, while gpio-regmap
>> expects a single regmap.
> 
> OK I did miss that detail earlier, I definitely thought it was using a single
> regmap.
> 
>> So the current path becomes:
>>   gpio-regmap -> virtual regmap -> MSCR/PGPDI/PGPDO regmap
>>
>> The version was updated this way so we can review the approach on top of the
>> current code. If this is still the preferred direction, it can be polished
>> further. Otherwise, I think direct gpio_chip callbacks using the existing regmap
>> helpers might be a simpler fit for this hardware.
>>
>> What do you think would be the preferred direction for the next revision?
> 
> I'm pretty much happy with either version.
> 
> I see your point as to why you don't want to use gpio-regmap.
> 
> I also think the virtual regmap thing looks pretty OK, it's complex
> but the driver is complex anyway.
> 
> What could make the gpio-regmap approach is that it will probably
> get extended with get/set_multiple() at some point and then you
> will get that improvement for free.
> 
> But I think you are the best person to choose what to use here,
> if you don't think the virtual regmap looks good, then trust your
> intuition and go back to the old design.
> 
> Yours,
> Linus Walleij

Hi Linus,
 
Thank you for the feedback!
Since you consider that the current virtual regmap approach
looks fine and also highlighted the future improvement we
would get with get/set_multiple() in the future, I will
keep the gpio-regmap approach for now.
 
Best regards, Khristine

