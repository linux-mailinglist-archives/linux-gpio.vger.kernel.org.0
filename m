Return-Path: <linux-gpio+bounces-27209-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E54DBE3F9F
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 16:45:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 302E95825B6
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 14:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FFC6342C84;
	Thu, 16 Oct 2025 14:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OomDDAen"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011036.outbound.protection.outlook.com [52.101.65.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDC8341AAA;
	Thu, 16 Oct 2025 14:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760625944; cv=fail; b=H1J64x8VMmr5/q3ciCgOcgRW6qMcAN2XCsvQTNZ61FxmqH43wXjIv3Xp5FJAJ+ae+GJK3CWQJ+yPyU/wIDBe+dcNRLdhysnfCNo7SzS8e7Yb5gb0t/Wne0VygAq5bWCkKYBaQsJUyYXuOM4Gt6Pzrf9JCE3az1t2Ro7RHEvB7hg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760625944; c=relaxed/simple;
	bh=fOQ3EYLjRT/t7/2Mfv3fdW5You8ih1JIo9Uq4AwgsOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nuflqu8mtMGBSqinUZpjrzhZpYYxWiF1Lzhcn21BVE4Kvra24oYflh/QDJN6wUb/t3S+o7cGjs6dHh81x1Z1feNtd9ffvetu7z+O3g1h4/e9IQ91QCP5ctekqViGNF3qXjKNDT9Gyx3rIZoY0pCXWscmpNHoUZQ3fewHy1VAJr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OomDDAen; arc=fail smtp.client-ip=52.101.65.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zq5q/KqILAKiEf3jLwVGCRl+iqs1TrlTHk11wHZQVdirjcMHKhG7xwOLJsj/3hQCDS1rOzBj47t97y09Ae5Rpia8x/qV0Sbx8gwX2sIsBPvSXensnL/2Z6IskvU1pAmwgvKZVaA7WUpZX9bWGZyxyPl/HzN9S6BIZd5hwGmN1raDyLSRNjeLFz3jdMXabWktECSqzXV/7gVLfpz7pVcu32VgJtJEAn+pew+cfGEcUNCJASKXXh//x/yoM9201zloAlCsUbxDFNUmevj9Dx5WkwhIJDId5mkFE/Gzhcj2z/4OnFOu93DQzWl5dboymhMFsbMzxMa6TaCclicZgQFt8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D02eRr7SQYfKrw8p3YPOCLyNtiBUhf0JuznHMR2gmZk=;
 b=f3TEjJfXg4QeVy42RlRrm6LmdFjBPrk3We5HrItAYZskXcVbH6VqOiU8clmkJIoKvK9HIWYJrXKIUXGLt636Gj72FOHTFLlUDeawspim72GUu44oVj2IYy6ELTaoFvxJ2gTUg/FaERy1kDfd3EnPV3tA3cfJIr846pPbWHETsiQD+LuAuiWIwriKA687U9J2R/sIM8wcBPNFUn6PrP5/3Ed3Wt8wC1tsVssesl/DoZYnxWmEvBqYUIe5xkNVgOg5UiT8h2XSiBoXr6XyBaYC0V7JOPIUNglRS6XbQM8hDBbrmL1En5CJFrlKqq7kudx5AwcrEaln9oQdrlLS2FMfOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D02eRr7SQYfKrw8p3YPOCLyNtiBUhf0JuznHMR2gmZk=;
 b=OomDDAenZUqIJOFiqEP0lQNqUEiShhZpqExMXSPCTPfWYi4JdNJFsVGz/8uVTok+M+ab/NIpkV8C7+Fw7VcGejhmngzLjTXivFh5toedIcX0JkfBDUv7RNRG3G6t9aXMpLh42l/Nlb2XReWLpCWDVoX7k814xlCARIC2rvIrCac6BOveWr9M2jvxmEEjkK2IbDD6HjRx+JH/GnQ5Jn2BEgEdmJzOEhXh5OgiMlyRebBET88GE2fxc2b8eGDe4MW1qN8gy1avaKYsnnpWrexJmiPpq4/K98xFRowq7QwA6jlN8MwNOLWjlu1KBeROEp3Sy81KTZTPhQqOrigifiFSGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PA4PR04MB9485.eurprd04.prod.outlook.com (2603:10a6:102:27d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 14:45:32 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 14:45:32 +0000
Date: Thu, 16 Oct 2025 10:45:25 -0400
From: Frank Li <Frank.li@nxp.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v6 0/9] drivers: gpio: and the QIXIS FPGA GPIO
 controller
Message-ID: <aPEFBXwDUTwJK4us@lizhi-Precision-Tower-5810>
References: <20251014155358.3885805-1-ioana.ciornei@nxp.com>
 <176060910602.64650.7023197009719546944.b4-ty@linaro.org>
 <o3oknl2onntkl2dgzpzsjm6xeunqxrq3j5afo5zb5gdy6xyo2r@4ctlictxhdlv>
 <CAMRc=Mepg=Cw0yUouEi9sJw+rPh3xRCQsbgYc=GVCsLXr3GAXg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mepg=Cw0yUouEi9sJw+rPh3xRCQsbgYc=GVCsLXr3GAXg@mail.gmail.com>
X-ClientProxiedBy: PH8P221CA0015.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::20) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|PA4PR04MB9485:EE_
X-MS-Office365-Filtering-Correlation-Id: c14d5fae-cac2-46a5-6122-08de0cc2a83b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RngzdllValFvblpvZlliMkpQMWFFY2dOMmIxOGg3TXNSWmVnTVVEb1JsSmFR?=
 =?utf-8?B?YThmdkNRL1gwSWVLWS9xZVNJNFdRMWttc1VrYVdUUyt6dEdWS0xyaEhWM2gr?=
 =?utf-8?B?RnF1VEhVeEk5L2xXUGh4NnhLYTcvV1l4TWVuWU95dFhUQTIxSGFvcm91NnVl?=
 =?utf-8?B?SGpnL3lKS0hyRGlwSFdUcEluZmZzSGQwUXFpK1V2ZGdIWTVwVWlLc3VPWHpr?=
 =?utf-8?B?Wk9SeVlRTWRRVHBzMGcwaThUcFljMGFhNXdmMnJ0ZERmVkdSWkY5b281VGNO?=
 =?utf-8?B?M1dlWDF6VU1xWnRHSTBYNTNkR0Y2aUpqRll5QVlJeW5zZFloYWZGemd2Qyt2?=
 =?utf-8?B?YXFwaEJDU29BWGFOelFFbHNTVFVFOGlwd3pEQVlXUGZwNjl6UEdDQ3ZIOGhv?=
 =?utf-8?B?NXNFZUlqeFQwdlhyelBRTUhyUFZGZ3FMdm5kSVFSdktiYUpCMEcxeHIyR0ZC?=
 =?utf-8?B?cFA1b3V1TzhOdWVEbjdKMnFWQ3k2Zzk1SlorRCtzQnp0dEpwbndpRG15bDJw?=
 =?utf-8?B?M3JyalJKZ2pCOWxtQk5vN2VGUXBvVEhodzV3dVBwTE03eUNTRkowK3B3MUhH?=
 =?utf-8?B?aXl3azV2VEJ4MkZQVHdhV1FLbldHOTFPRHlQTjZoZVBiaWJ1aW1BNGdDMFZD?=
 =?utf-8?B?NEpZVjVweXEwSjBxTzVuRDloV05FODJaL2NVVUhZNUxVUno2NklaWkJmUFoz?=
 =?utf-8?B?bXJHV2V4YWtMWkcrc3BhemdXTlJlMGVuYXJXTzNIQ0VxREZyWWxQUldva09R?=
 =?utf-8?B?M2s0MFErcDE5Rzcza2xna0F3Nzg5MGRZMzkxbnllS1d5WHozUUV0cXZwdC9O?=
 =?utf-8?B?TjREODBJTWFwYlNVdGhhVlBtaUFTYnFXUm84cGt2VTNHWGlmVkMxc2tScWdy?=
 =?utf-8?B?VEVhRzdVaFV5YnkrUDN6WXQyWFZSVTA2RWNOUEJRK3NGZVlBUzg4UGhUUW93?=
 =?utf-8?B?TktHeUZWTVMwTzVGSldsQmZhSVJyUjVlZVBsdjdaRjZJOHlNbWsycHBEcEt1?=
 =?utf-8?B?WGdmdXZId3N5dllkSXBWWDJRallLK0xjTFJVOVZFZGRDajJuVDVXbVJXNmls?=
 =?utf-8?B?c01EditrKzR6aU5PMUNOOU40SzJyaGwxdTF5QnRCL0hzaVdPdXVORWY4WnFw?=
 =?utf-8?B?ZnAvam9UTStmNVdpRGE5cEVORkFrd203S1N3WFk5VmhGbnE4NGdIVzBncVdm?=
 =?utf-8?B?aUI5T0NHVlNuUjEzV2E1eVNlbjBjejB5WFhGRWpCZnNyU29pT1RZUTdRQUZ1?=
 =?utf-8?B?MEhkZkNtazZ3dWwzSEtQNTMzUWV4UFpMNlM4ejVmWDFNUDVRWElIbmkzOXRB?=
 =?utf-8?B?djEwR2NrdlBCSFA1Zm1oUDZXeUhUS01Tekw1Tzl3VjIvSTNTT01wOEd2VlZv?=
 =?utf-8?B?V215UVM5NzlIRlI4T0dzQTNqMzlkRW52RW5lUllwblBubFJybUw4dHYrT3pY?=
 =?utf-8?B?cnNBb01DQSt1MUI5eldtcjd5ckZtVXJwUnFSOThtVDdCRGJ2QUZlcHhHSWJM?=
 =?utf-8?B?RWZjWGJpZmpGL3BlMnFweGF4dXdnbFpnZ2hCV2h2MDNnNytPVy9PQThXMUVR?=
 =?utf-8?B?NGp2eGFKaGo1dU13YUlwQlNhT1N3U1JJZCtlS21IVzJPZUZZeWthMjc1b2Q5?=
 =?utf-8?B?NTU2VytsRnRPbU5jZXI3Vk5SM3VuRW9pSVZHNUl3UlhKVzRYVnJNditkdi9z?=
 =?utf-8?B?SWdaWm52OWNRWDFpQVJXZGN6VDlwMkpIR1RyOHBxcXhndWFQK3ZSTW02YXRH?=
 =?utf-8?B?YWs5L1dzbldiMUJOY0tBRGpEaE9zeFpyQ0FRTTVmZGRBQ0IvVUVDUkVnTGF5?=
 =?utf-8?B?WGFGOUNnamozVEd4T3FmUy9WOXZnQU00ZE1TVmdVejJmWHFFaVdpeEFuNWlX?=
 =?utf-8?B?cGFua1JBUFlTQ3lXMU96UEFYV0tUYi8vdHAyZDcrWmNWQTBOeXloc3d4ay9H?=
 =?utf-8?B?aDJmRXdoTm5oTWc1UnVZdC8zTFZGV3JOV3ZSby91TGwvZzlIQVBjWmM3NHFs?=
 =?utf-8?B?TC9GRzdBTjVPV05SVkVGaEV2Vk9YY3paMTRnMnIyVDh2cE4wMm5DejgrV3BP?=
 =?utf-8?Q?UUUqX6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3BRMjczcG83OVRWUFZNNDlGSVE5S25oUm4yQnJ1RFRGME9wWTZHZWJoTytk?=
 =?utf-8?B?cEVaNTdzbGl1bDRYOWp3RmQyQUNGWmNBTzIyclZJdXdycDBxeHRtdVEwL0Fk?=
 =?utf-8?B?RW55QWtwamJoNHNHUzYwblZnaFdTaFJGamZEckFqOHBCUDJ1MUZNRDliZWJC?=
 =?utf-8?B?VUI2MjNSVE1BOEFwaEE5aU5Sa2tPejBuMkhyU25VYmw0NUVDV2xSemlJRURy?=
 =?utf-8?B?RmtjSmdRWUZ6dGt0RTB0T3FSczdLWlFuWkZmSlFuS1VDSnlORk45TUlFVlZt?=
 =?utf-8?B?WE5TN0FzK1lmeHJQOGovdUNSbkx5NDlpT0g1TStjcFQweXJRZ2FuMUordEZT?=
 =?utf-8?B?TUJFaFc1SXhXZy81NnV1U0pxRXNjY3ptLy9NUkV2SzFhUzU4VXJYK2FHcWh6?=
 =?utf-8?B?QjF4T29XMTZoYVlFM0dYZjJFdzBWMkd3cktKOTVNZUIyeWhFQlBtR2t4bU1J?=
 =?utf-8?B?V3JybVRKeVB1ajgrYmpiNi9UMWhwOEdjemFFb3FaM01YV2NTT3ptNFR6MTdu?=
 =?utf-8?B?cHFkUmxCdHg3TGJPRzFWWTlMeVN2NkhFT3BPM05RT1Y0cWdhVFFnRHVMekQx?=
 =?utf-8?B?K21IMmtQQUc3VFFDaVNYUEZEUTFFbmxpTWxnV3NDRm9lMVE2RTJxM1hudUZZ?=
 =?utf-8?B?NCsxM1dmRVVWNVZVcFVoTkhHTFo0U3J2U21xYmsyWWZtOGxyUUZrZnJMRkVu?=
 =?utf-8?B?SUJTeHI5a0R2UDV5RUhEckZJMWw3ekUwem9Nei8ranVLRDdIa2JxRnhPQmtz?=
 =?utf-8?B?ZnFsejE2OVpySlY3Y3dkN3FIQi9Mb295cUpHVkx0L09NL3RXdDVvOHJDNXhF?=
 =?utf-8?B?cUdCYllDQ09LbDA4YU5DT3lxbGtjNTNBV3lLTTlzTUMxNlJKUTJTOW94UTlJ?=
 =?utf-8?B?S21QdWRvdFNUdzYzVWZaZmxmTlVOS2E5cHNMdFhiSkw4ZWNRcHJSbWU1ck92?=
 =?utf-8?B?dVloMm1ISWhJN3libGZaWGhyak9pSHRzWVNMTkN6QmFkbEdNdnpRWk9kNjhH?=
 =?utf-8?B?SDlHUVBHWGdrR2VjcUQ5Vm03SDhFclFyNndXdXo5blJxMGtRb0RINDZQdkt1?=
 =?utf-8?B?dXF2TnRBTlMxYkJwaytHT3luR3l5ZWJjdU82cVM5NWduT2F6R0FxTUlacW9Y?=
 =?utf-8?B?T2pZeUoyTzhLZWFadENCVXNua1BoV2xyNXoyS0VMbEpyelVlRy92Qlk3ck5v?=
 =?utf-8?B?Zk1aRnNPWW80d0xZS2pFK2xPc0lVMlJpZ2NhTWo3eHE2a1JaNDA1aDltUUFj?=
 =?utf-8?B?VWZ2eXRLU3hoQWhQdGNPS2xTb2JWSjA3Vmpodk1tM2RPaUJKaUwrZ09ma2FY?=
 =?utf-8?B?Vk1zNkFvYXZPTnkrQTVNb2hLVmkwdXZzdVBvWkE0SmQzZ3VsZUZzK0QrcllZ?=
 =?utf-8?B?MGNhbkYyWk80KzF5NWthSlhDQURoMzRKQjRpdnNaV250S0l6RXJkWDZCQnIy?=
 =?utf-8?B?azJFeVVxVk5HVHJlbFI2dFYrZEpOOVZWUit4MSs2Zi9xZHpLV08xQ0NCdzRm?=
 =?utf-8?B?bDQzam9RNWlvcVhSaVJWTXhYYWFnSDkzVkNZNUVjU2dWUS9MWWtORkNpVWdx?=
 =?utf-8?B?QWErRzZONkwzQS9ZblVoL0ZKSUZQWFFqanhYYjRkUmFRUytsdzdKeXd6eEg4?=
 =?utf-8?B?ODJyQVdvSjBNUk00WWZEMXVFNDlyanlnRTMwbFFnL3pmS3pLYzlwTnF2WWxP?=
 =?utf-8?B?eG9ua2NBOERlQit5ZWMwZDZDUGZUeFhpeFdVM3c0YjVtUlVTNmlQMlRYNmN3?=
 =?utf-8?B?bHRHTm1vOTFmY20rVno0Mm5SMHBSMnV0Ui9FM2ZtL3RmaDhPUTVvM1JNYzhr?=
 =?utf-8?B?eUhHQW1yWkNadGxETzRGT0tQSUZpR3l6eHJHMktkQmdLS0QyL3RaL2xsaUVs?=
 =?utf-8?B?WUNRZXM0TjRGZXQyYmpNelNtOHh2ZzFrQUROYnU0Q3V6T0NxRC9QOFc2UEFs?=
 =?utf-8?B?L05xbk1DMEpENlJhNTdidkJMT0lVOGh6R3R6b0lKTzJMWHJqNXlXRVlCK1NG?=
 =?utf-8?B?VnNvYXl5WFhOdHZvbDhOQ0tjc1FsWGgrcGNydlNoNm9NdVQ1WThLMTBQWWFu?=
 =?utf-8?B?SXdnTWkzdlRQeTN5RnRrZlVGWFdaRDJIVDNVdWJ2djBWVGJFRGUvOHdHblVO?=
 =?utf-8?Q?Q/PI=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c14d5fae-cac2-46a5-6122-08de0cc2a83b
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 14:45:32.0679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c/El+FB3gPW7S7k5QmuKbkda69wvD+VWJOKq7fwNhivSkSDEVdz83G67bpsB2otjOYKY7S3uV/I8FEdLYrr/Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9485

On Thu, Oct 16, 2025 at 03:47:30PM +0200, Bartosz Golaszewski wrote:
> On Thu, Oct 16, 2025 at 3:25 PM Ioana Ciornei <ioana.ciornei@nxp.com> wrote:
> >
> > On Thu, Oct 16, 2025 at 12:05:13PM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > >
> > > On Tue, 14 Oct 2025 18:53:49 +0300, Ioana Ciornei wrote:
> > > > This patch set adds support for the GPIO controllers on the QIXIS FPGAs
> > > > found on some Layerscape boards such as LX2160ARDB and LS1046AQDS. At
> > > > the same time it describes the SFP+ cages found on these boards, which
> > > > are the users of those GPIO lines.
> > > >
> > > > Before actually adding the GPIO driver, patches #2 and #3 add and
> > > > describe a new compatible string - fsl,lx2160ardb-fpga - which would be
> > > > used for the QIXIS FPGA found on the LX2160ARDB board. As opposed to the
> > > > other compatible strings found in fsl,fpga-qixis-i2c.yaml, the
> > > > fsl,lx2160ardb-fpga imposes a unit address for its child devices. This
> > > > will be used in the next patches when the gpio controller node will
> > > > define its unit address as the address of its underlying register offset
> > > > inside the FPGA. This requirement is described in the yaml file and it
> > > > only affects the newly added compatible.
> > > >
> > > > [...]
> > >
> > > Applied, thanks!
> > >
> > > [1/9] dt-bindings: gpio: add QIXIS FPGA based GPIO controller
> > >       https://git.kernel.org/brgl/linux/c/d5896130a8781de5ac8970dbb7083ce4cd6fe57a
> > > [4/9] gpio: regmap: add the .fixed_direction_output configuration parameter
> > >       https://git.kernel.org/brgl/linux/c/ae495810cffe29c3c30a757bd48b0bb035fc3098
> > > [5/9] gpio: add QIXIS FPGA GPIO controller
> > >       https://git.kernel.org/brgl/linux/c/e88500247dc3267787abc837848b001c1237f692
> > >
> >
> > Thanks!
> >
> > How are the two remaining dt-binding patches going to be handled?
> >
> > The driver changes for the new fsl,lx2160ardb-fpga compatible were
> > merged but not the associated dt-bindings changes in patch 2/9. And for
> > patch 3/9 there are no associated driver changes.
> >
> > Ioana
>
> I would assume Frank Li will pick them up? Ping me if that doesn't
> happen in the following days, I'll pick them up into the GPIO tree.

I think Shawn Guo can pick it.

Frank

>
> Bart

