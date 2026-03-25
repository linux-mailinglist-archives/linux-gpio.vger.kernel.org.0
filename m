Return-Path: <linux-gpio+bounces-34177-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IL2dAvZqxGlEzAQAu9opvQ
	(envelope-from <linux-gpio+bounces-34177-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 00:08:38 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AF732D415
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 00:08:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDF4030C8164
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 23:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A91B390C95;
	Wed, 25 Mar 2026 23:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cLxCWWyV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013003.outbound.protection.outlook.com [52.101.72.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D42359A87;
	Wed, 25 Mar 2026 23:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774479880; cv=fail; b=i85HxCp2stOEZIolXGyDYDINoKkNPbSX6POp9AMOmOnj+Y98VvkaPSziVsXTTOmGVDCOxE7Qc5NgWyjQySEIawM59M6h//yzu6ZSfOPLlVqT3l3Q9UdfFHD6MrJSoDG2i06iq/t5lMS9wSiXTALzMv4Bq8G0Ldqpe1Vlv+aQb8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774479880; c=relaxed/simple;
	bh=1HiUv0+trc1za3XLSQH1k/TbH953Ru8k8yGxJSEYBSQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ZI9VL04OjkVZpJHEoyp7mf/em1RNtStR0kImxYvUu9r54LfDjQ5xUKo+H8xHKCeioLOnrDflOKeCf+mYBx2t9VmJnGkUs1pHa0dZfYQ0+qeMahWi8qOwSmHo9tdB7skWG23fQZxCDq19z8itIdp4idZHW6tWXWwDUm9q75x9St8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cLxCWWyV; arc=fail smtp.client-ip=52.101.72.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DUxhu9Pa7W3sY4dUMAFU2h0IbQ4fC7BL5YvSA5lRsFz2iomov72myrt/hvSLl2z2oN/8EREQ3Yz/cQDgboez/BFaFolFW9kmHVYXwR/Hg4ZUjEy2qkBxJ82P0Lq+hnlFZdTPoNJsWE7HiQbEct5e/+Jcclyw8HpygObwtdL1GLZp0+oYjyPhIATFiHqmy2q65X37sQeyw0maNXomYXMtrF6+A1jPYDucwUM4tTR2eoAECvrzMfW6aQkGx+TitQu68RUMCBVbkpkRpEsD7xCZZ+gON/qFUGUwynC/vWca+xLAfY8Kya3GTzChUeLlnHxgIlSRBW03TKPWwWmX9OQjdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWciR1RUkFpvo9H8MSFSSxWxZU0aJyIRmPJw/52YmfM=;
 b=G3CgPLiixdhMS58MC7Rie2fahGPqy5ujiDrP1FDq6IoaLVeS0o51sE9JZ4nZDTaJ38ENjcEtJ9vcN/mfrnKhcp4Uh1PGhQBKgMjLFRm+1XLXg735FNQgwx4FL/v/bQYQMaEMOG+7p70dxdz0380fXfEjUdO4/C8/+WNE2z5dUF+IniVSl0buQQx8ainamFMBKmFZnqTLxIRVLNtvCiTd/UBkSQyJuxJGzTcjLV2wgjHxafgXo5i51xF685qOXPXhaR0BkTNe7+0+7HQWdkR2tY9Hx0epv1FBBi5/EQvesHQ6qxOYopdwhHH41LJ5Ob/Swxy2IQC2cIqMR8dV7oML2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWciR1RUkFpvo9H8MSFSSxWxZU0aJyIRmPJw/52YmfM=;
 b=cLxCWWyVjV/ERNr4VQeaqtYdz9neM9JEbcLPUCMefLv1AwJLD7FTDJoN4c4OUscfcaoHolK+WiMFbf8/2GOwyscwZq5nW0CU2qAbzd8LKF3iHecfnXam9YkoE1PdRlikZGxWq/5qt8RgSOgyYtePIDNhzPjqmCJMy6RtEPaTW2ivDAd5uGaXvS38QGE4jWD7vHtvt8PQ3rkCWyWhqCLrXdCEvXvNX9GuTo6Rnh0i1r/iszD6BamfU5wAT/+Umpf14drHeGYtK+gs2BkHU71ch6fLhnLrUpkZDkZOuyKh/BgrbHtQ3nw+dz/58ICb8aevDoWAdCTb35xy3dkR2eTtjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by GV2PR04MB12140.eurprd04.prod.outlook.com (2603:10a6:150:30c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Wed, 25 Mar
 2026 23:04:35 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 23:04:35 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 25 Mar 2026 19:04:11 -0400
Subject: [PATCH v4 2/7] dt-bindings: pinctrl: Add generic pinctrl for
 board-level mux chips
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260325-pinctrl-mux-v4-2-043c2c82e623@nxp.com>
References: <20260325-pinctrl-mux-v4-0-043c2c82e623@nxp.com>
In-Reply-To: <20260325-pinctrl-mux-v4-0-043c2c82e623@nxp.com>
To: Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774479864; l=4615;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=1HiUv0+trc1za3XLSQH1k/TbH953Ru8k8yGxJSEYBSQ=;
 b=Sy28jYTtKb483A+velwCKMgoU++lbc9mVTZeyC0+qBwWslQJKap/OY9dDSlIc77G3w6eSRcxq
 lfx4CPINBXOCiwzWMmehatswFGI3BPT+gLwVSKNxijcYSEB3yC/movv
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR03CA0161.namprd03.prod.outlook.com
 (2603:10b6:a03:338::16) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|GV2PR04MB12140:EE_
X-MS-Office365-Filtering-Correlation-Id: 3594bd20-f270-402b-54c5-08de8ac2e23c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|366016|52116014|7416014|1800799024|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	4lKeiQQtdkE0CWps/GsjiFa5nKZzBnfvht/BbFO5zUQv2QNvHCklc5vi+rACP8CT5z/N2nUnW5zLo0Qkm45R4afcTbqf/35KCmUAUNshVSvbyp1k1p02/gxsz2TSpTedLYp813C7c2VKYCBDx25CNDw0FJhKoBGy01ZxCC9x1MomAeYhgkaOAcvuzEEEOIrqnAzquOCQrRNSyHCikx5eiKmHRojbByfJA2wuP8HZl1Ry694IpJXdy5d4u9Okvz9z/+GKiKFgZw0cQNWzfxjQKQKKuIO4X/03jqfsKqxo9bJU7Xh3eTk+T06NhQb6pVkXQWZjSr7Y9nkhEFo2PkAI6aP+edCKLj+GDXwqcZBM+qTvMPUfKHr17h704wPYouL6VoBiWKmafjdOMaE/zi51ZWFDb9rhI1fw3kSHgvWxtXH77FM8o8xVXmGowXRWue3ubIDihJ8PHTLKXYarwuLUjKqNh5BxZkirsfU2GZidz2PMML83jTWa24NrgjSZYFC2LvHHcE4Rv8pyMWyS9VJCjv63jN3okIe6dLxZcBpfA8UW5elRC811iBCOcmUnJiiCzJmZOGXt9YFIH+m1N3/XCBk5JbWsDpmsCez0GSAcqGSOsuz+dCL9MC5sy84URQZnpcS8fMHX4qoK6WZeqrH8QIhCAPa+lUfdpHON4WSc643X2cqbt+xrPL1e8+tQ8xwk5OqnlB5IWORzqW6gwlEFkl9AH2tOdm+/+n/5sf8AVoAGaKQk3OiZeuOLlPWBpbAn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(52116014)(7416014)(1800799024)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzB6OFFjZGVmUHFPVDVWeGhlWERMS1p6MkFMYjVYZ1BQWUxtY3B2K2Fvcklu?=
 =?utf-8?B?bTFnUVVnUXFZaHBmTDg0WDkyRFFsV0h6UGwvZ2dUNHpsY1JydXo1Y1hsTU5r?=
 =?utf-8?B?cWVrYjZZcHJmVHRhSmpLWDVNdTErV1hJd0lIK2drQlpDaGpveE12SnNoTGF1?=
 =?utf-8?B?T0JQbXpra2JCOVMvdzlTbWhqNWkzSVdWUFZoWU5VaVV5b2ZYTlk0UlpZYTg4?=
 =?utf-8?B?bHY4VVJUeTJQSmFkYWdOMUFxbmxUSEc5dEgyTW9kYzIwWVNXcHJVelVJeUUz?=
 =?utf-8?B?SGIyUEZDL1RGVGU0TU95T21qS1FTSUlxM0pHSXV2TVd5ZXkxdXBLWGJsNnNL?=
 =?utf-8?B?emFsekdiaWQvRUF5RVdBKzdCbE5saFVXd2dLcHNPRnFQcUdyNW5ETDRrQmFO?=
 =?utf-8?B?R3JWZGRpUTlielBJaExrajRQVHA1d0pPRmtUY3AwbEl0L3RPd1pSeDZrUExU?=
 =?utf-8?B?NktmaE1LbFFtRXpZL2RoeXdnK3h4Z3B1Mm9lY2xNS1RwOXNoZkhyZXN4Y3pE?=
 =?utf-8?B?Q1FseERmNmhpaVJINEpFY0kvVUJyNEpMSEl3YnJaSjlVRjF3WGQzY0hoNndt?=
 =?utf-8?B?eTRhUDlUMjdTZjVTUEtxU0s2V0dSYlFNMzFSTm54UFh0cHg4a2lGUXdGS2xZ?=
 =?utf-8?B?eThFQVJOVHYxb0tPTjQzZzY3akdhWWtnS3pJc29PMmw5SHpUZ1JNZHNVMTFw?=
 =?utf-8?B?c2pMVTIwQWpLZXBYVE1BZGVtSEVQVElPRkViOHA3dm9VMU9oSXFFR095Smh6?=
 =?utf-8?B?MEpzNzA5WmdBY2lzOXkrdEhNcEVTSDVoOENNNzlraCttT2FNN2xhelBmYWIz?=
 =?utf-8?B?YnM5R3BSei9pMUpMSThDMkRLZUtxWktFenAvNkNMU1FpU3RnVUlXY1ZZQ2gy?=
 =?utf-8?B?VDRTUVNiS1pDNlNvSzl1bm11S2ZnNGJSZlJVN0VXbzhRTTkvTDJWcHh1T3ZE?=
 =?utf-8?B?Y0c3MUxvM21jaDM4SmIzWWRWYUowYUdlMlcwdzBGTGV5U29Uc1RXTGo2eWxU?=
 =?utf-8?B?cVdyUnJoZnBlUXhQS1JmK2c2TnZWbE5KeXB5RU01ZFpheTMzZ2RXL2UvUkts?=
 =?utf-8?B?NHJVYmY5SG9NdWUyL2NBTUFoSms5b1VCeVppaUlMVzVUTzJ4NExmVnhOVUk3?=
 =?utf-8?B?N2dSTCtiUm9jVGM1RzlSU1ZZNmszcjFLMm13QzJ4RlR5L2tjMTdJNTdlazcx?=
 =?utf-8?B?MWNzSE5TaGhNclVCaFQ4Q2dXZlVOS3VCb3JlNTFPWGNoQlM4ZFBVWXVxdWhN?=
 =?utf-8?B?TlZ6dU0veXM1RVVZamdxa2tRWjFuSUMwbHZ4T3k4SVpOUDlWYVE1ZHhSdzBR?=
 =?utf-8?B?SDFqYk9nK1JtVHgrWDh1cmtWRXBDbjN4N1JOZHdPZ1BKeEt1YlU2TG5xSWRR?=
 =?utf-8?B?OE93bkJNM2l1WGNZVElHMkszc3hFV3Y3eUJxbmtYei85eVJ3blh6SDdWakh6?=
 =?utf-8?B?b012WnlxY0pTVmdBejJHOWZmS28reEEzZ1N6M3BLb0d0dnAzUVhETkxobTFl?=
 =?utf-8?B?MTZuZDJaS3c3ZUE4ZTFQRlhyMVZURDRKcHE4T2poQSt4V3RJMWlZdWtHemcx?=
 =?utf-8?B?cVFNZXhxSDJYVmUxcDVSM0E5T0ZSQktHcUErL2srcDVRMzhtVDZBSmZJc21h?=
 =?utf-8?B?TlhBbDMvdDJsejhDand2dldxWEhJRXZzSS9kTGR5dUJuZXI4a2RxSUNzNmVj?=
 =?utf-8?B?dDU0dUN4N0xiaHl3SEsreGhYdm5zS1lmUFdnQTJMWml4eFovTUxwUmxNSFlv?=
 =?utf-8?B?NU16dTgxeVpBcHYwdVdlVW9uTVVEMnBLY1hoYmg2L0hiVUI5bUVzZWxIQzlY?=
 =?utf-8?B?Q3JBK2hvc0ROTytpMUdLNG5TNUNaVjZMQmV2d0pRcGxVQlRuM3ZLNXgxamwy?=
 =?utf-8?B?K1JoZmNuUWkxQ1ppc1NFc1E2UjBKTUtHd0xPSWdNc3pCa2QrZUMvalRmTk1s?=
 =?utf-8?B?ZzJyMnludWV1dkI1alJ3WmV2eEd6VFVFeGphcitqS2lSWnVmTzJHcnhHNmhM?=
 =?utf-8?B?TGNNeTE2SDJMYlZWRGhrL3Ixb0g0bnpGeVUrSkgxNGx1VHMxRmM1TzRLNG1V?=
 =?utf-8?B?Y0xoNzdBeVVXMmYzNFB6V0tBeEpvS0lxMTVxQUZrL2xFYTBFUGQ2KzFGVGFm?=
 =?utf-8?B?QktBajdWbDFSVjQraDhLcnlXOVZQSVA3SjlyYWhKSDhRVXFkWVQrS2c3SWw1?=
 =?utf-8?B?VTBLcVVqQnBpdDJuU2o3UytuR2VweW0wMHdmcXQ0NUZWRUgvdWJrTHBLQXUv?=
 =?utf-8?B?akhaMDRhZTR0M3h0RUI1NlpMbnovUncrSHZ3cGUrVDlEOXVvb3JjbzlqVkhQ?=
 =?utf-8?Q?Qrv5gIe7bixBYSQF4L?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3594bd20-f270-402b-54c5-08de8ac2e23c
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 23:04:35.8514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Z5sCS7asj0Z378dr1QHUjG6gUDUCsI4wW2bCpBttcA1yfPIxS1RSEr+RHCUmHa2/cMtYWX0SA/Z8ECz0GbNNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12140
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34177-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: A4AF732D415
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a generic pinctrl binding for board-level pinmux chips that are
controlled through the multiplexer subsystem.

On some boards, especially development boards, external mux chips are used
to switch SoC signals between different peripherals (e.g. MMC and UART).
The mux select lines are often driven by a GPIO expander over I2C,
as illustrated below:

	┌──────┐      ┌─────┐
	│ SOC  │      │     │    ┌───────┐
	│      │      │     │───►│ MMC   │
	│      │      │ MUX │    └───────┘
	│      ├─────►│     │    ┌───────┐
	│      │      │     │───►│ UART  │
	│      │      └─────┘    └───────┘
	│      │         ▲
	│      │    ┌────┴──────────────┐
	│ I2C  ├───►│ GPIO Expander     │
	└──────┘    └───────────────────┘

Traditionally, gpio-hog is used to configure the onboard mux at boot.
However, the GPIO expander may probe later than consumer devices such as
MMC. As a result, the MUX might not be configured when the peripheral
driver probes, leading to initialization failures or data transfer errors.

Introduce a generic pinctrl binding that models the board-level MUX as a
pin control provider and builds proper device links between the MUX, its
GPIO controller, and peripheral devices. This ensures correct probe
ordering and reliable mux configuration.

The implementation leverages the standard multiplexer subsystem, which
provides broad support for onboard mux controllers and avoids the need for
per-driver custom MUX handling.

Allow pinctrl-* pattern as node name because this pinctrl device have not
reg property.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change in v4
- add Linus Walleij's review by tags

change in v3:
- collect rob's reviewed-by tag.

change in v2:
 - change descriptions for device, not for driver
 - add missed additionalProperties: false
---
 .../bindings/pinctrl/pinctrl-multiplexer.yaml      | 57 ++++++++++++++++++++++
 .../devicetree/bindings/pinctrl/pinctrl.yaml       |  2 +-
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-multiplexer.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-multiplexer.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..2b0385ed879b70b24ca9c39b098c3840d08d7482
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-multiplexer.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/pinctrl-multiplexer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic pinctrl device for on-board MUX Chips
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  Generic pinctrl device for on-board MUX Chips, which switch SoC signals
+  between different peripherals (e.g. MMC and UART).
+
+  The MUX select lines are often driven by a I2C GPIO expander.
+
+properties:
+  compatible:
+    const: pinctrl-multiplexer
+
+patternProperties:
+  '-grp$':
+    type: object
+    additionalProperties: false
+    properties:
+      mux-states:
+        maxItems: 1
+
+    required:
+      - mux-states
+
+required:
+  - compatible
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pinctrl-mux {
+        compatible = "pinctrl-multiplexer";
+
+        uart-grp {
+            mux-states = <&mux 0>;
+        };
+
+        spi-grp {
+            mux-states = <&mux 1>;
+        };
+
+        i2c-grp {
+            mux-states = <&mux 2>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
index 290438826c507ec6725f486d18cf686aa7c35e67..20176bf3074757de30f208e69b968a6bd6125273 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
@@ -27,7 +27,7 @@ description: |
 
 properties:
   $nodename:
-    pattern: "^(pinctrl|pinmux)(@[0-9a-f]+)?$"
+    pattern: "^(pinctrl|pinmux)(@[0-9a-f]+|-[a-z0-9]+)?$"
 
   "#pinctrl-cells":
     description: >

-- 
2.43.0


