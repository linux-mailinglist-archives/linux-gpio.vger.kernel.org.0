Return-Path: <linux-gpio+bounces-36070-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IfMBOSd+GnHxAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36070-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 15:23:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA524BDD21
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 15:23:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 946E7300A5A7
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 13:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E80A3DCDB5;
	Mon,  4 May 2026 13:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="WKBM/Alj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011019.outbound.protection.outlook.com [40.107.130.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E713DA7FC;
	Mon,  4 May 2026 13:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777900324; cv=fail; b=QoC1u7M9caWRbEuB/HnOFOYjsFGAPqL48DO11fF/rrGTSnJGS14Z5m4HKAc4Vj2FNpLpK6SwZI4LZ1B1d2vxBZNckbw9U9Q1aO5+XcbzBF51Uw0z1h8NgSPww3YCSdYkNaqZq90VUT74X7dJcr3gCIvPh15npWKj6Z44bmpNEvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777900324; c=relaxed/simple;
	bh=Ox13bXmiGq0kEx9928HWWCnLQOdYRHY0xe+WPZ20/3w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GBLQUJHmfNp3arZb329ZRNf1MQRLjaZLG1+Zr2qapIKHDkK2omCxglE1S5WitaXHl/dJ8lwqkJRjg3sT8HKD41BDT9afD+GOCosUVDvKn08abQgvVCHrlUJMXJL/tcxGxDl8mmnA+MpiBsAW5QMbBEg0GOe3KZNi+h8jvvZIDfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WKBM/Alj; arc=fail smtp.client-ip=40.107.130.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G2rHhF+ABgcWqB7574pmN+RVAvmXmwL1pAys2ynChnf6NISeAhx1f6Ztaabkpr/eYUbjjEUYxu/2LtKU+zdGXdDLFumhjVRNjDmhYW6ogHWX1pDTtxEfeioxwKE3ryK7bCk1p50wSqryp8ZNqxsRf3gbl+EPLIHbL2tJwKWB5ht+Z8Nfep4dknKRCzUoaiqy0QrYT46lf9y2g4oyrOJZqIH0vav/FelYLa+G7ZQpDL+nC0o1QFAGdCE9Jw1FLkH3SkMn574UG0y/fc4Xwz9ciCVUSQb6QwnCLfY5r6aeGq2za7FN2e+XR7e92bJ/z9U1K+65k5Y9q21Eq6TLEYyLWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dcsnrMXMi9+3PM0FGJdD7cbkFZiaA06BhxZj/d6lPzQ=;
 b=OLgmmkzigjzSYLmLfHdKZFdSyFfm6eKOAzMfYZd7Ht9ueO6q+35pO2DdGA6vYXGuiF1eEcb02hTJCrzUZAsz0B+WkoR3O+vdRfvzYD4qTskKBinYZHVHOiSDdR06I3jCXjlgO1u8bJ+D+8gIc0u1EcVuxPAnEh/lq1skgVB4mBuBkWEOgmtnuKY4pQ0Xw1iEv2i9BEc56rei+LCecoiw7l7FucIQjAa85Zq1OEsxuU2PQxofv04rqr+OP85PbclWxpilg129BlXQ1ftbyrJUyCJAF1dfKEh5seHeu6l35R4nl9KkTGrd+BDGEzjFe7mv59+2Cek9dfZPSYSm1S0O3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dcsnrMXMi9+3PM0FGJdD7cbkFZiaA06BhxZj/d6lPzQ=;
 b=WKBM/AljX6kh3UwNuXexRsB8UcGqzHez3Ve+1mA3E1ARygVIcd8tj0SXjVV/AQffqbgoe/yJsMc+3jm68K0SbImuiTE/bOGtHnucNv56qfLVfV3Wj36ETSrldLX/jpmUaxqiln+AOI7g/ntdau7W7C64odn7TPcIhbQKBSK+G4MmqfGOEseG00SkMThOAGKXM9bIriKPv8aZFTtjlEeca1zsu7EbHuLzwgV0yCEQMiWFvXFFJPYA3NCcVhrQ+nxoZQSt+NLim1VIwBlX+ovuP6BLXNA/EoteIOyUcfGg3Qw6FwKyC9i5gGxyuzkUOhDyehI2LmlDjM0O4Ki4jDVIqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by DU2PR04MB8583.eurprd04.prod.outlook.com (2603:10a6:10:2da::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 4 May
 2026 13:11:55 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 13:11:55 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: Alberto Ruiz <aruizrui@redhat.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	devicetree@vger.kernel.org,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v9 4/7] pinctrl: s32cc: change to "devm_pinctrl_register_and_init"
Date: Mon,  4 May 2026 15:11:45 +0200
Message-Id: <20260504131148.3622697-5-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0013.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::15) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|DU2PR04MB8583:EE_
X-MS-Office365-Filtering-Correlation-Id: 19baccf9-aff3-40c0-b03a-08dea9deb715
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|376014|366016|7416014|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 lgNe1tZBGZPVS9rgcamIlqecW/WcbRV2e/z6v4HMv0lSpG2ZNcy2HRnj6HyYMi/QXTVibQRhmqesSBuDou2WdSKPnmQIl1kNG7BNc6tVSk/1bNNbW66LG7WPP6J9H7S7+sYTFgu+0B56e9vhWfv2OR1z4uXh5La6Q5XfNfiDcBFByYBcMU0ax8ZI0d3JyedYXtfoxNBB3eClWtIvE0DSo88+L7rTd+qGMAAy+6DYxnzDF/vBBKPt0VB53A9R9NV7OqCDCz8ilKlSZpJnlCfs5JelOW5NC6LXCVYQhgtGqdB6tYy3mJsNSGWWzmIf3lQYvua36JLKU+kFG2aop+7ab0r2U8cd6Q41ggwfU+R8blHWGiq3SVr+TnFhUoluAnrqL5/msc7HWd6eXDXrarTaOSCr5PoYsus2tMeqnVgNlkW1hHt84YR8Xqg2tk8aKtP1+yuoUDMbsRKwOmYV9yqwkniH86xg0ju6DVGniiuTbngNaH+7cHJUEOH7LklLJv30/fJsgGKCtM+wh7a5+tgv+ePONUn1lH1XI3Oz5oXwyM5kcBpoB7JTIGe6W+UKj5Ei5tUCG1+oQh3HGL1DPXXmC2LaCm6NUEl0IuW7s33bCU8szYnvOfTaJ9615jAGW948o+tEgh1eMwurgR2bJ06rtna5uGrY+vMKR/v42iAlYBIabx4B85euAp4V6v83uQWw0bmJU6nkimwdgKjs3LLoHho3VpLzYzz4P37xSVZQwtY=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(366016)(7416014)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?QzhRQngvOGcxRFBPUlpGc05taXhwSmJMbWxvc05zeVQ0cTlHaDRaRmd1VTFv?=
 =?utf-8?B?eHVyamNFOGw3Sm9RbFRaemY0aHBIQmZUdzNYODJjNkZBcUxseUFFQU0rdTVZ?=
 =?utf-8?B?SzlxOVo4cWxsdm8yWmJFZkVrSkRmTnUxblN6TTFDcE1ZQUhnZ2g4NjVWZ1Mr?=
 =?utf-8?B?amdFNm9mbEhIMllqYnd1b2dnL2FPaVRKQnkwaXZhZXFVWUk2Tkx0U2hGYnhS?=
 =?utf-8?B?VGhZNDZkMmRvUVRmdFFQMmo4dEpMcXBDa0dvU2FwRkRBRkExMzZYRVBPc3Zr?=
 =?utf-8?B?UlBuT2YwZk1BZE5nNG1PbGlWeDRLUTJYOGs5Nkt1OVhKZFUzdnV4YW10aDdL?=
 =?utf-8?B?UnZHazZTaTV3V0x2VnhTVUpqVUVrcDZOUlZMSDVLK0o0dUVjbXdNTDNiUWJN?=
 =?utf-8?B?VEUvVmpqM3R3RlVtNzNLT24wcVlTRWZOY0hOMDhsL0RUTnpSUVdDY1dvdW9K?=
 =?utf-8?B?TzVIMExCUkd5RUIrVzhIU0NlV2VMMkkwamtxMHBBeGdTSEFDOTdZM0NadnFQ?=
 =?utf-8?B?SmpwN25rWDgxZ0RRbHo0R0FmTWxtMmF4UjFjWDFOQjRtVTg3UUJQbjZsZkFN?=
 =?utf-8?B?L0pNdXBOYnZIL3hQNktIYWM1VTVWRk5NUnFSSzc0b0MzNk1Lb2FXNTRMV1pM?=
 =?utf-8?B?ZHpuYnN6QjdmeGMzcUR6Q1FGUTgrdlhCUkNEbUZSbURTd0JkV2VmY3RJeU5k?=
 =?utf-8?B?OVMwOERkRU1GU1BHdm1MM0NpSkF6WW1OZXdHSVJQLzMvTTZIR0dwbTVkUXp2?=
 =?utf-8?B?TzFoTDBpR0hHSnR1bDhocERpOUZrLzhEdnJORFJWTG1LVEdCRG56clRGZFVo?=
 =?utf-8?B?d1NOMWRuK2xhUGFGc0pZcDk5alpNOEZCSlJRWm5KWmdOam0wajNac2twOWl6?=
 =?utf-8?B?cWxCOEo0WjQrdVZuVkNqTk00UzJLUFpyWTNldlRVa090OWdXYjFOcThRdkZJ?=
 =?utf-8?B?TzY0ME15Z2RJWEJwbGZZYVVpbkJyTDBXRTlIcExhNUtVL0FYNVlZVzh6bXFN?=
 =?utf-8?B?aDJBQ25kTGs1bGJ2TGlIMU83K2doNyt4K1gzRG1YNXFMNHdVS09XMGhyMDNS?=
 =?utf-8?B?Zk9yOEhQOXRKeFBKSXNDcXc4czRROVB0SGNkRG1Xc0M5bmxhNlhxdmFSM2NV?=
 =?utf-8?B?N0x5SHVSNDJuL2RVNyszTDNERXgrYkdYNmNiTWFnL0cwcGhBcTlyckc3Q2Fo?=
 =?utf-8?B?QUFrdjRxY29GeGltKzVVa0ZyQVVDTHZWK203SnRzZm5rdTIwK0tmZXhoNjln?=
 =?utf-8?B?NVA4UEhRRTJlR0FpTE1raUJyb2pvSnd4YVJYalA2R0ZZV1NxeWpYOHlPUnUx?=
 =?utf-8?B?OVlJVXluWlIzeGl3OXAzUlB0UzlSNi9MRGJWWnlEWjRWUGxNNU9tZEY0Tjlq?=
 =?utf-8?B?UlFZa3JsK2s0eUorQnpjMlY1SDNTQVBVQjM3cDBPQmNTMnhid05wY2tmTU16?=
 =?utf-8?B?Y3hHUjRTTytuZWgyQWhlYVVYd2RxNDdNdkI4V0gxeHVHWUdZT3o0NHRJTUJu?=
 =?utf-8?B?TENNVk5HeTJFaTkxSXA3dVVmaWNXVEhia2pHNGdIRlcxQndKUGgxY0F6c1FB?=
 =?utf-8?B?TU5Oak9qa0kxSjJsOHhpbzUwQVE4anloeTBHU3VSbEZKNkdtcFZkKzdROE5I?=
 =?utf-8?B?ck5IUlM0QlBjWlRobU5VVkxpSFEvL0ZrVlNBMHAyRUIvSmVXWEtPZEhLejJr?=
 =?utf-8?B?OTVrNkZVcktMWWJuWmVpbnFycTJCNUpKRWZUSGpPYWtlZzJWYmNXQUNOc2l0?=
 =?utf-8?B?REQ1M2VUV24zRWpkeUNkdW5EbENHaUt2emVJUmdsQzQzVGpYNkxiajIzMkpS?=
 =?utf-8?B?YnNKZVJ3Wm9QZkdCVnNtU1ZJTGRBdDRVdGtQb3o2c1duYkhsNkhvdGpCU1ZW?=
 =?utf-8?B?MzNOVEpuN0tzVGl1TWJnRXIwdU0vZVRUMlYzbVBMOFJrS2FQczRqRkdxemh6?=
 =?utf-8?B?RU4vbWM3VUxtditFZERWaklwS0t5QmYyRU5Va2tLTTlhN3ZNQ3U3OGVtRHZh?=
 =?utf-8?B?SkZVcjFQcDF5Wm5XckFoZ0c5b0ZOREJKdG9nZDc3d0N2K1ZGRWhhQlczV2pB?=
 =?utf-8?B?aTlmb3hKT1ZuZmlQejdrbUZURWRNL2c4Z2pvRFkxbXlkMENNMCthNE9mUVFw?=
 =?utf-8?B?SkJVWkM3Y1FjaFB2QlJEcnpocEN2WXMxWXNGRlFsVXFDNnBPYW90S1V3bXFE?=
 =?utf-8?B?QXFIcFZNWGoxMjlROXpSZlM1VFp2b1RoMmJycGgycG16REZGUEpMQTVIZHdE?=
 =?utf-8?B?Q2dBdUhLaGdiY01oMDFaZnFJbGU1OGx5Y090QXpIOFBjRDNYc08ycjVRYUZK?=
 =?utf-8?B?Q20vUU0zaFB5ZlhkbGhQaURORWxHL0lUOHVJOExRYlA0TTQyV1NtUVRHVFBr?=
 =?utf-8?Q?giEGFAWbRuiqfb9zCPwvKZZAJT2j/LGwOI0Ja?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19baccf9-aff3-40c0-b03a-08dea9deb715
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 13:11:55.3981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: crdYFmIVU+MmLSMyhcQYAMeuJ68v4Ou3uzmA83hImve02URcTTBruyUeGFP9tReV7bcuJNj86Wy1/BHMuHCy2FNAr51dmQ0L7wtqW65r5Jgn0Geq2CDVXhj7MGxv0AJr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8583
X-Rspamd-Queue-Id: 0EA524BDD21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36070-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,linaro.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim,qualcomm.com:email,nxp.com:email]

From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>

Switch from "devm_pinctrl_register" to "devm_pinctrl_register_and_init"
and "pinctrl_enable" since this is the recommended way.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index 1c95e0022020..27757f2c5570 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -974,10 +974,10 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 		return dev_err_probe(&pdev->dev, ret,
 				     "Fail to probe dt properties\n");
 
-	ipctl->pctl = devm_pinctrl_register(&pdev->dev, s32_pinctrl_desc,
-					    ipctl);
-	if (IS_ERR(ipctl->pctl))
-		return dev_err_probe(&pdev->dev, PTR_ERR(ipctl->pctl),
+	ret = devm_pinctrl_register_and_init(&pdev->dev, s32_pinctrl_desc,
+					     ipctl, &ipctl->pctl);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
 				     "Could not register s32 pinctrl driver\n");
 
 #ifdef CONFIG_PM_SLEEP
@@ -990,7 +990,12 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 		return -ENOMEM;
 #endif
 
-	dev_info(&pdev->dev, "initialized s32 pinctrl driver\n");
+	ret = pinctrl_enable(ipctl->pctl);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to enable pinctrl\n");
+
+	dev_info(&pdev->dev, "Initialized S32 pinctrl driver\n");
 
 	return 0;
 }
-- 
2.34.1


