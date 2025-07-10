Return-Path: <linux-gpio+bounces-23099-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5032B0051F
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 16:24:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DBDA54601E
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 14:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B46127587F;
	Thu, 10 Jul 2025 14:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="S0CQduyt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012040.outbound.protection.outlook.com [52.101.66.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3452C273D66;
	Thu, 10 Jul 2025 14:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752157352; cv=fail; b=dudlcGoNLPs0zbOWhDBWn2STxXf/Xnh8kkrePVMTcQ56So6xGR+kBltAkKm2b6KBo6DCynzSaJvI1Fo4vdZcdYBWeUwpinJsEvAO9YwefPOger9V+m+z9CtznpUyUCLUKIGLN8xwLtsooIKoRFN/Q75NZBfz4qz2ObfQhvzvTSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752157352; c=relaxed/simple;
	bh=2WpvwCXuHCtv1TmtLqX1JjyvKtDp+OfQBZ8jOxd5Kw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f3PTRc2P7Yzne0KV2a8l3nNzK9/V49gaa2N8pcdMNYY3blZv8F5++SAiHtpWwL9tWRY7lt2hngoGs9vJ1viSQmjg4eXtV2BLYX7QbLnVXQkj9fkyEFrYh9yz27yWtDcLLIRom6fjjZ86D9EXueiDDQmsUBJ6Dl6C7qK5rSp7/D4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=S0CQduyt; arc=fail smtp.client-ip=52.101.66.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QAxTbn+b4IQSM0G93sEdk3O5oTjdOVqkqV3pLC4JuFMIdsasETueFDzpTX/bdBDSvkld01dxpc7wJ61PWqxhqvru90cn9Mr22I1I6j/SQqZBZ7MUpXWrNiuT3tbWlcUsDo/suCt4iYbfclMru+ERKoCMJ6Ryrovr4NN8yZzLgAqVpp4et52NXELqbjElstYPTMQ2yQiJ41vQKcViTI/qT6alxT4OKPn2/poMMZpN5i2l9fRLZjddtOVMnYyMVNuf2ajlicS+mOO1bSRtDWrM5Ttx4iQHcEoE+aynrB0gpLvr/GdCw+nlaJ+X03cFYqNNZYJX+9+dHdvQKEmUJHh5mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14z1nlJopZxNVxVi15Gc2f7BaPWJFrTuWa6VYc8a2uY=;
 b=kAVE+ATUAkZhpC7xHdllmFANU/38fVQkoN54SMAFUKxz4nWA3/OIe+YOkFl/k7IBImixn8UM0V9gu6Kf50gbyDiVzs7ar0Qazco8wzKUvbJXWPgOODUFLObASI5Hl16KWqTyiO0ch5t1YNvlNUGxYKQpgwxGtJpyQrauxlL/t3MlsT/yzwTrmwOiOg3fHauEiBVUNkPbv9zBUWAxeOwg1Mpbd26imQGJ69Bkz9BOL8LWNaOCcR01OTXSrKceJRhGPTs2bWt0uMlr8M/Gph1OTF3LwSV06F6V4Low23GdU1Mwsev4fbXXBan2o9V2s9EXZVYdeh2wR0MynO2qBNav0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=14z1nlJopZxNVxVi15Gc2f7BaPWJFrTuWa6VYc8a2uY=;
 b=S0CQduytJV8U+4lDeTYeRItN4fA2/8PjlqPrzj4F5r/AsDRGc+GB5dmpmugRR/HIVj59roPf2whupDpePrmqeZ37OuicAPenSbWv6AguTUNhaL5+hTkbcwOEynD6MGM78z5zTkzTtD1ZB19BOxTrD3RgIVimFC7gZ3J8wbQIhbsTHImwx5LaMZbNN1/1xXQTruQHeDV126Y4pxEFoCiIsvFLWcBqcHdZSnf08S3nGsPDnbAKyNDoMPmPP9/LDCkVkV9Fem/1KJhvraL67lxFBN67HBgiPPrynu/m66nmS1mD6hncbhyOgEHfQUIrT5xqW4MnOFKNAzWm92ReX2KH2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by DU2PR04MB8952.eurprd04.prod.outlook.com (2603:10a6:10:2e3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Thu, 10 Jul
 2025 14:22:24 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 14:22:24 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chester62515@gmail.com,
	mbrugger@suse.com,
	Ghennadi.Procopciuc@nxp.com,
	larisa.grigore@nxp.com,
	lee@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	aisheng.dong@nxp.com,
	ping.bai@nxp.com,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	srini@kernel.org
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	s32@nxp.com,
	clizzi@redhat.com,
	aruizrui@redhat.com,
	eballetb@redhat.com,
	echanude@redhat.com,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	vincent.guittot@linaro.org,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: [PATCH v7 10/12] nvmem: s32g2_siul2: add NVMEM driver for SoC information
Date: Thu, 10 Jul 2025 17:20:33 +0300
Message-ID: <20250710142038.1986052-11-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
References: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::16) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|DU2PR04MB8952:EE_
X-MS-Office365-Filtering-Correlation-Id: b7b73bc0-7ca9-44f6-efe2-08ddbfbd30bc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|19092799006|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WFBXVm1XU00vd2U0emJJYUF3cGE5dGRlMkxwU1VNR2RYQi84L1paNWR1by8w?=
 =?utf-8?B?UkE3SG9SZy9QN1c3WmtVWW4vdmRyNnExSTJiZmhtTEx4VEpPVHlvV2xjRXh6?=
 =?utf-8?B?ZUMwdEtsazVqek1DSnVNZFFuNituTTNyTUtqZWNWeUtxdG8xN09sbzQwUGVY?=
 =?utf-8?B?MjNxcVBkYUFqR0FIUzVtUi90UVg4bVhkcDJWRE9HZGFZdy9tMG9RcVQxNmR0?=
 =?utf-8?B?NmI5Si9aYTM2WjUycldVcnNua3lRRDRXeWpYWnh1OFpGUzRCSWtuSndvdy9o?=
 =?utf-8?B?eE9zOThXY3JpR2pkVHNLQnk2QnRkc3oxNHB2Y3dYbE4rei9OMVNFdDJ5OVoy?=
 =?utf-8?B?dW0wVkhIY0grQWkvSE5jZXRPZnNBNW85TzZXT3dqVlc5NFZYSG1EK1g4dDVX?=
 =?utf-8?B?d3dWb0puRXlCM25jWUZ4VzJqdEp1djZ0TCt2WTdPQWUrMEw1RmRHNkZrQlJw?=
 =?utf-8?B?bEFYaXBnM20rMW5WRXNaa3ZKYlkyUDBlZjd4eUdxRzdBZ1BXY0NhamFiV3NK?=
 =?utf-8?B?UEQwNFdocysraC91aTJ5ZTF1eTNHaDgzNThFYnk1QVNPUHZrRnEwWUxNSkcx?=
 =?utf-8?B?L1pUa0lDVVN6Q0dDa3dFWWlTcGZUWmIzbE5HeGVPZVVBQUo3dzVlZVhmMlRN?=
 =?utf-8?B?MGduRjhGdFZZZWJPY2dWV3JHNTdLU1IxSnZMRllPSlNFN1BLbXVFbDMvRFFS?=
 =?utf-8?B?bWIvMkFtMGlaclJ0WHQ5dVlhc2hweXJQd1V6ZExoM0VabHIvTER3TTVhcFhH?=
 =?utf-8?B?ZHZVUzNqZWxwU3dWaGk2RGZxam93bEsxSWlwcDFUR1d1MUI0aDNsL3ovU0dS?=
 =?utf-8?B?WDY2Sk93WjA3NlNLMVBwQ2UvODdZNVBRdkN4anRFL2dheFdzN2hOUnhZcVJ5?=
 =?utf-8?B?UnRkTk1sNDRWUW5kQ3p0V2pTNXBHNTJNbndONlpHRnAyUHhSTEU5ZEx6bEdI?=
 =?utf-8?B?RUdGRm5sWjNBN1VQeXhqeS9LQTFKL0xhMnQrYVJkUk9DZFZFT2V6QlJ2eEYx?=
 =?utf-8?B?TERORGhXTVFUbUFjNTNaeDlKRHU0NjRHK3RLL1R2ZzdOU0krQUl0MzkwMWg5?=
 =?utf-8?B?WnJEOUNiK0JRL0dDSlAwMXVHa0dyRzRPWm9xYWJNVmtpWlJHZXlSZDNLY1VT?=
 =?utf-8?B?WFNzY0pWdjFhNWZySHkxR2xaSjBYcHFHNEVmOStla2FDMFhrWVlBYmNmYVUy?=
 =?utf-8?B?VlZ3REU0bWlsSTJOSjdiK3ZxU2NUc0FNRWJxL2J1MUtEcTNoV1RCZitrVzZ0?=
 =?utf-8?B?dk5Ca2h1M0RtQjJiNWxVem5XZjdUdGcrUm9mdmJHTWhuYWFoeHJHUVNLSzRG?=
 =?utf-8?B?ekFtVmdqVWRNR1ZzdEVWQ3BXUHZacDZlUTdrN0Q4OXQvT2ovWjQ4UTZJUDda?=
 =?utf-8?B?ZWtwb243WDBjUnRaaHA1NFUvcUF3ZW9UVG5ESVgvKzJ0bGN1Vm1FR3gvSVd6?=
 =?utf-8?B?ZmJGaWlEV0pmVkJ1SjJwdzROZGFVZUhwQy9jZ2RmVm9QdzlVRU5xZXF3cFR0?=
 =?utf-8?B?SnhXajlPV1pkY21WM1RHSTFBRnVOU2ljd3lGSFM1NVFPNWoyWXBuWnhvQjIr?=
 =?utf-8?B?RlZGblZtcmNSczBLWnVzZVF1L2RKNU14T3NFSUQ3WHpoeVRnVzc5ME9JaDNM?=
 =?utf-8?B?S3pPTW8reGxBbUJVdVlIQXVKUVV4RE9sR1JwL0ZYL3VJVVhwT3lDNEthZ25E?=
 =?utf-8?B?WXY1MzFmZFUzNlRKK3Z5Vi9BYVI5MEwxd0hCNS8xR0pBYjNkdjFqL2hpN0FB?=
 =?utf-8?B?WUVpTGlTNGkxTjRINHd5bFBHQk5FcjhWUEtCTE9MblpQRkthSkhVZjQ4MzdU?=
 =?utf-8?B?eHN1WGtTK1BEOVYwZHhLeXNHNldHY3VNdENESXlYdnFRSHJaVzh1ZVI2eVho?=
 =?utf-8?B?U0NoandnbHVheFJGR0tLeWJoa2pmMzlCcGdwblBMajFlclF0aGlIejA5WG1m?=
 =?utf-8?B?MzVwVVN0dUFJZzJLSjJnaUtUUGdVU0hNTDcvd1FmdVpqRlVMTkRkRFJaMVc3?=
 =?utf-8?Q?YPvnVBC9XeNbO75/CJyj7zbBFXfqNc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(19092799006)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzgwMjk4NU93ajlPS0VpY2hlUGdoSXhMZ2hRQ2hDNkN5RGRSQkpaQm40dWIz?=
 =?utf-8?B?dkZSUllYM3pndlVkYmFhOHladStGYnJqSFY0TEoxTXdld2diTHh1blgzN3BW?=
 =?utf-8?B?RnlwR1M0QWF3d2cwNncySW9PbFg3SGJNNmlVODlKaUFsZGgxM3VGMHcrYmdC?=
 =?utf-8?B?TXJ5Ump0eXFucnBCZ0t3T1p6VHRsY0dmdzRWK2hxakhFZXBrT0QzMEZxYjdS?=
 =?utf-8?B?YzVMSFRKRTVwZyt3eTA2c3JmRW9vaUlhYk9VZk1YUTNXb3dMSTdyRlVUdFhx?=
 =?utf-8?B?cXFsQmVFNzJnVDZwT2hjNDJIY2ZrNTBXcGV6ZWJwZjZPVGQ5UHE4Uld1YVBC?=
 =?utf-8?B?VnZHeEZDQ1FrYUY2L1AxQlRxQjZINnZJQ2NxbXlHNXBRRXBvTFdTbkNhZCtl?=
 =?utf-8?B?MzVnTXNHbko0eVpNanRSdUJES1pveXFzZnNLeDRkcjZTYmdqVllwZUxvbko5?=
 =?utf-8?B?ZW1NZytzVlFkRnhESUxvK0xjNENEcnhDTm5xSFp2Wi8vZGlYM0hvUUMvMUJu?=
 =?utf-8?B?aVJGYktOeVJsZE80ZUZ4ZzV6NVZrSm5JajQ3azFhdHpmdHR2NW1UbEE5Mkhr?=
 =?utf-8?B?UWRRaU1ZRHNnV3BPZzlKNUxXakJSakY2aEZ3NDJLNEN3bzdOUXBkdmVUQ3FV?=
 =?utf-8?B?aTZ3Y0IycVQ2M1p4Vk8rZ3hVWFJUYUY3dFhTQVJMbjZpKzFUdGFIN2JiM0RK?=
 =?utf-8?B?M1FMUFJSOEVTaUhHSk1oSFBncEowc2Z1UnA3bUdEQlM0VlBqMndkVWNJVDVV?=
 =?utf-8?B?SkMyNVlOdHM1ZTV1VjN1T0lQcUg5Y2x3T3czd0k1NUgreHlVeW1jelNKS2RQ?=
 =?utf-8?B?ZkJxamUwWEw4TWFpczRmN1pkNEJvZ2RVZWhRWU1BR1ZOc3RUQWhEaE9pMytC?=
 =?utf-8?B?YWhtbDFTUmFSbWNEOHh6NHJjV013OHhXbzEyeE9SUGV6WHk3RDhuZkU1a1Rp?=
 =?utf-8?B?V0FhWjJDNStaR2RTUTZCZlZMZzdyNWRvdlJzQ3p3Q3ppRlBBaTZpVWFhb0k2?=
 =?utf-8?B?QnNNY1U1YXBrcFRzQjFsUUZVMTdYK2FOanI3QTZvZHREdnhMR3dTMDJMNHVS?=
 =?utf-8?B?NVVrck1DNXUzaTJSS1F2MlNUeU9NTkpxai9WTWZVYzRrRjJWOGtlZm1YWXlj?=
 =?utf-8?B?ZmZ0cXhXdngrREVBY1R4OVV4VitTUzdGbXFCbjB4YUxSNG1BajdYWUFBeS9o?=
 =?utf-8?B?MzlTT3ovTGhHWlpkV1BCSmdCUkp4NTVwcmhSTzlqaEhvYjBiS1ROdkw2cUFE?=
 =?utf-8?B?ZTlNRGhRaEdsWTFwN0F6VDR4RDVCZEZ1UkZZS1hSRjB1M0pDRXJkbE52ZG55?=
 =?utf-8?B?Q25HTDdCeUZOUDZmVGdKR2NOcVpESk5jUzZHbmtFTVpyV2lkMkRXUW5BUjRD?=
 =?utf-8?B?emJ0T0RRTXJhK2lkVmd6QXlDMnBiT1dGR2pJNk9iNEJKOFF0d2J6TTgzaDBB?=
 =?utf-8?B?NDVRaFlTMGJXSVY2Vzh0Qlo5U3ZoZDRaSXdPVWkvODJncHVKU2JwRFNrQkE2?=
 =?utf-8?B?VXlxcHpWQzlpS0liYzBOV1ZuMWd1aWdYaVh6S2dmMkxaRUg5OCtUNmNYL2JB?=
 =?utf-8?B?NHNGRU00SXlxcjljT3c3QUh0dEtFcVJiQ3pQeTcvb1NFeFd1M0UxNzgxa04x?=
 =?utf-8?B?RTN6QWE5cFQrZXphc2NNNzRDVDAyNkxJeXNZOUlWVHhrNkFmSVJ5a2hzM0F4?=
 =?utf-8?B?YTlZejVRR1JnMlJURmozbmphWVNaTkZ6NEpZQnJSdE9pR3lOQm91a3Z0SXhN?=
 =?utf-8?B?SFFjMWRCQ3V3c05KZ290Nk50VUZPWFRsTkdGNms1VE00M0tOU3ViR2JwU2tT?=
 =?utf-8?B?SHgyRStzeENFVGxoTzR3Uy85UzhBTkVaQUlLR1RDckJoNnhjNVJyMlJyaTUw?=
 =?utf-8?B?UzNLRE8vY3J3L3ltWXNMc2xaeVk4bURQR3hKeFRHTE1SdkltV2FNWVhpUVdW?=
 =?utf-8?B?RlM1VjU1bzZjYUpSQm5tWk1hLzMyR04wVEF3NTNnNHFoOUFVY0JiL3BTeVpt?=
 =?utf-8?B?dkl5NDZrNndHR3RkVFB3aUpCYnh0ZjVvbTNCMURmQWpJamhFOUtPMmMrU1k4?=
 =?utf-8?B?UVVKYnpVdVpyaW5wbUJ3Y1djVVZqWHd2c1VsOXhZYVdmRDlIanBUdmhGaWww?=
 =?utf-8?B?dEdwanp1OG9rM3Fzd0ltL0VEdEpYMnJVR01IYllQWDltMVg0djJ5MmpHb2h4?=
 =?utf-8?B?Z0E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7b73bc0-7ca9-44f6-efe2-08ddbfbd30bc
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 14:22:24.5426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wXQaYJre9unPn5fykmSFErodD1IQuAY+RMdsiug0w87fg2DbKYU0TQm32HYPZH4sHrN3P+gTn+BopHiuwN9yk5uP5jbsOlxMBMc2s9/PAog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8952

The SIUL2 hardware module has registers which expose information about
the given SoC (version, SRAM size, presence of some hw modules).

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 drivers/mfd/nxp-siul2.c           |   6 +-
 drivers/nvmem/Kconfig             |  10 ++
 drivers/nvmem/Makefile            |   2 +
 drivers/nvmem/s32g2_siul2_nvmem.c | 232 ++++++++++++++++++++++++++++++
 4 files changed, 249 insertions(+), 1 deletion(-)
 create mode 100644 drivers/nvmem/s32g2_siul2_nvmem.c

diff --git a/drivers/mfd/nxp-siul2.c b/drivers/mfd/nxp-siul2.c
index 904f41b3c61b..edf643e4bcba 100644
--- a/drivers/mfd/nxp-siul2.c
+++ b/drivers/mfd/nxp-siul2.c
@@ -31,7 +31,11 @@
 static const struct mfd_cell nxp_siul2_devs[] = {
 	{
 		.name = "s32g-siul2-pinctrl",
-	}
+	},
+	{
+
+		.name = "s32g2-siul2-nvmem",
+	},
 };
 
 /**
diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index d370b2ad11e7..6efd23a2ee17 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -454,4 +454,14 @@ config NVMEM_QORIQ_EFUSE
 	  This driver can also be built as a module. If so, the module
 	  will be called nvmem_qoriq_efuse.
 
+config NVMEM_S32G2_SIUL2
+	tristate "S32G2 SIUL2 nvmem support: SoC revision"
+	depends on ARCH_S32 || COMPILE_TEST
+	default y
+	help
+	  This is a driver to access hardware related data like SoC revision
+	  for S32G2/S32G3 SoCs.
+
+	  The revision information is retrieved from the SIUL2 module.
+
 endif
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 2021d59688db..84fef48b7ff6 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -89,3 +89,5 @@ obj-$(CONFIG_NVMEM_ZYNQMP)		+= nvmem_zynqmp_nvmem.o
 nvmem_zynqmp_nvmem-y			:= zynqmp_nvmem.o
 obj-$(CONFIG_NVMEM_QORIQ_EFUSE)		+= nvmem-qoriq-efuse.o
 nvmem-qoriq-efuse-y			:= qoriq-efuse.o
+obj-$(CONFIG_NVMEM_S32G2_SIUL2) 	+= nvmem-s32g2-siul2.o
+nvmem-s32g2-siul2-y 			:= s32g2_siul2_nvmem.o
diff --git a/drivers/nvmem/s32g2_siul2_nvmem.c b/drivers/nvmem/s32g2_siul2_nvmem.c
new file mode 100644
index 000000000000..bf62c8885ff5
--- /dev/null
+++ b/drivers/nvmem/s32g2_siul2_nvmem.c
@@ -0,0 +1,232 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2021-2025 NXP
+ */
+
+#include <linux/mfd/nxp-siul2.h>
+#include <linux/module.h>
+#include <linux/nvmem-provider.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+/* SoC revision */
+#define NVRAM_CELL_SIZE			4
+#define SIUL2_MIDR1_OFF			(0x00000000)
+#define SIUL2_MIDR2_OFF			(0x00000004)
+
+#define SIUL20_CELL(c)			(c)
+#define SIUL21_CELL(c)			(100u + (c))
+#define SOC_MAJOR_CELL_OFFSET		SIUL20_CELL(0)
+#define SOC_MINOR_CELL_OFFSET		SIUL20_CELL(1)
+#define PCIE_DEV_ID_CELL_OFFSET		SIUL20_CELL(2)
+#define SERDES_PRESENCE_CELL_OFFSET	SIUL21_CELL(0)
+
+/* SIUL20_MIDR1 masks */
+#define SIUL20_MIDR1_MINOR_MASK		(0xF << 0)
+#define SIUL20_MIDR1_MAJOR_SHIFT	(4)
+#define SIUL20_MIDR1_MAJOR_MASK		(0xF << SIUL20_MIDR1_MAJOR_SHIFT)
+#define SIUL20_MIDR1_PART_NO_SHIFT	(16)
+#define SIUL20_MIDR1_PART_NO_MASK	GENMASK(25, 16)
+
+/* SIUL21_MIDR2 masks */
+#define SIUL21_MIDR2_SERDES_MASK	BIT(15)
+
+#define SIUL2_QUIRK_MIDR1_DECREMENT_VAL	BIT(1)
+
+struct s32g2_nvmem_drvdata {
+	u32 quirks;
+};
+
+struct s32g2_siul2_nvmem_data {
+	struct device *dev;
+	struct nvmem_device *nvmem;
+	struct regmap **regmaps;
+	struct s32g2_nvmem_drvdata drvdata;
+	u8 num_siul2;
+};
+
+static int needs_minor_decrement(const struct s32g2_nvmem_drvdata *data)
+{
+	return data->quirks & SIUL2_QUIRK_MIDR1_DECREMENT_VAL;
+}
+
+/* 3 digit part number */
+static int get_part_no(struct s32g2_siul2_nvmem_data *priv, u32 *part)
+{
+	int ret;
+
+	ret = regmap_read(priv->regmaps[0], SIUL2_MIDR1_OFF, part);
+	if (ret)
+		dev_err(priv->dev, "Failed to read SIUL2 PART_NO!\n");
+
+	*part &= SIUL20_MIDR1_PART_NO_MASK;
+	*part >>= SIUL20_MIDR1_PART_NO_SHIFT;
+
+	return ret;
+}
+
+static u32 get_variant_bits(u32 value)
+{
+	/*
+	 * Mapping between G3 variant ID and the PCIe Device ID,
+	 * as described in the "S32G3 Reference Manual",
+	 * chapter SerDes Subsystem, section "Device and revision IDs",
+	 * where: index = last 2 digits of the variant
+	 *        value = last hex digit of the PCIe Device ID"
+	 */
+	static const u32 s32g3_variants[] = {
+		[78] = 0x6,
+		[79] = 0x4,
+		[98] = 0x2,
+		[99] = 0x0,
+	};
+
+	/* PCIe variant bits with respect to PCIe Device ID update
+	 * applies only to S32G3 platforms.
+	 */
+	if (value / 100 != 3)
+		return 0;
+
+	value %= 100;
+
+	if (value < ARRAY_SIZE(s32g3_variants))
+		return s32g3_variants[value];
+
+	return 0;
+}
+
+static int s32g2_siul2_nvmem_read(void *context, unsigned int offset,
+				  void *val, size_t bytes)
+{
+	u32 major, minor, part_no, serdes, midr1, midr2;
+	struct s32g2_siul2_nvmem_data *priv = context;
+	int ret;
+
+	if (bytes != NVRAM_CELL_SIZE)
+		return -EOPNOTSUPP;
+
+	switch (offset) {
+	/* SIUL20 cells */
+	case SOC_MAJOR_CELL_OFFSET:
+		ret = regmap_read(priv->regmaps[0], SIUL2_MIDR1_OFF, &midr1);
+		if (ret)
+			return ret;
+		major = (midr1 & SIUL20_MIDR1_MAJOR_MASK) >> SIUL20_MIDR1_MAJOR_SHIFT;
+
+		/* Bytes format: 0.0.0.MAJOR */
+		*(u32 *)val = major + 1;
+
+		return 0;
+
+	case SOC_MINOR_CELL_OFFSET:
+		ret = regmap_read(priv->regmaps[0], SIUL2_MIDR1_OFF, &midr1);
+		if (ret)
+			return ret;
+
+		minor = midr1 & SIUL20_MIDR1_MINOR_MASK;
+
+		if (minor > 0 && needs_minor_decrement(&priv->drvdata))
+			minor--;
+
+		/* Bytes format: 0.0.0.MINOR */
+		*(u32 *)val = minor;
+
+		return 0;
+
+	case PCIE_DEV_ID_CELL_OFFSET:
+		ret = get_part_no(priv, &part_no);
+		if (ret)
+			return ret;
+
+		/* Bytes format: 0.0.0.PCIE_VARIANT */
+		*(u32 *)val = get_variant_bits(part_no);
+
+		return 0;
+
+	/* SIUL21 cells */
+	case SERDES_PRESENCE_CELL_OFFSET:
+		ret = regmap_read(priv->regmaps[1], SIUL2_MIDR2_OFF, &midr2);
+		if (ret)
+			return ret;
+
+		serdes = !!(midr2 & SIUL21_MIDR2_SERDES_MASK);
+		*(u32 *)val = serdes;
+		return 0;
+
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int s32g2_siul2_nvmem_probe(struct platform_device *pdev)
+{
+	struct nxp_siul2_mfd *mfd = dev_get_drvdata(pdev->dev.parent);
+	struct s32g2_siul2_nvmem_data *priv;
+	struct nvmem_config econfig = {
+		.name = "s32g2-siul2_nvmem",
+		.add_legacy_fixed_of_cells = false,
+		.owner = THIS_MODULE,
+		.word_size = 4,
+		.size = 4,
+		.read_only = true,
+	};
+	int i, ret;
+	u32 part;
+
+	if (!mfd)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "Invalid SIUL2 NVMEM parent!\n");
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(struct s32g2_siul2_nvmem_data),
+			    GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->num_siul2 = mfd->num_siul2;
+	priv->regmaps = devm_kmalloc_array(&pdev->dev, priv->num_siul2,
+					   sizeof(*priv->regmaps), GFP_KERNEL);
+	if (!priv->regmaps)
+		return -ENOMEM;
+
+	for (i = 0; i < priv->num_siul2; i++)
+		priv->regmaps[i] = mfd->siul2[i].regmaps[SIUL2_MIDR];
+
+	priv->dev = &pdev->dev;
+	econfig.reg_read = s32g2_siul2_nvmem_read;
+	econfig.dev = pdev->dev.parent;
+	econfig.priv = priv;
+
+	ret = get_part_no(priv, &part);
+	if (ret)
+		return ret;
+
+	/* S32G2 SoCs have a special case. */
+	if (part / 100 == 2)
+		priv->drvdata.quirks |= SIUL2_QUIRK_MIDR1_DECREMENT_VAL;
+
+	priv->nvmem = devm_nvmem_register(pdev->dev.parent, &econfig);
+	if (IS_ERR(priv->nvmem))
+		return dev_err_probe(&pdev->dev, PTR_ERR(priv->nvmem),
+				     "Failed to probe SIUL2 NVMEM!\n");
+
+	dev_info(&pdev->dev, "Initialized S32G%u SIUL2 nvmem driver\n",
+		 part / 100);
+
+	return 0;
+}
+
+static struct platform_driver s32g2_siul2_nvmem_driver = {
+	.probe = s32g2_siul2_nvmem_probe,
+	.driver = {
+		.name = "s32g2-siul2-nvmem",
+	},
+};
+
+module_platform_driver(s32g2_siul2_nvmem_driver);
+
+MODULE_AUTHOR("Catalin Udma <catalin-dan.udma@nxp.com>");
+MODULE_DESCRIPTION("S32G2 SIUL2 NVMEM driver");
+MODULE_LICENSE("GPL");
-- 
2.45.2


