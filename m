Return-Path: <linux-gpio+bounces-12430-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A619B8C90
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 09:07:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08CC5281B0B
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 08:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 879D1156F5F;
	Fri,  1 Nov 2024 08:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ThqB/pG/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2085.outbound.protection.outlook.com [40.107.103.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B966C156C70;
	Fri,  1 Nov 2024 08:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730448412; cv=fail; b=HucKEUuUSTmvaZNxBeIhCbc2bHWh4tycAa0qmpkaAXM52c5FtGXPq4NAIdu0OAesP2D5jPmQJhJcnBHhjcW8bo4G3kkkGlN8k0sxMJPcQrjkhRxRJIjmNkU01amzfHebuufYsNiE3UCqVs+miN9c7SvtvR5t6u/Eq3upu9K2SwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730448412; c=relaxed/simple;
	bh=4/mBf2ojP3Q01yet7Nty7Et5BM8SX1YFBMh4yIKquPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ubwwAgmpjC8XtZgidl4ji5FBzmAy89MjJTBDxA98DuK3B/K8MV3XFlOTpWc5eoRVr8XA7kOjzngxzDAc9oTwsSPnr+RLqpv8BCxiWZlQCPzyONpcfm51QMxudl6hWaL2m0azqub7LWMQTDaS0xZRWiPjZwvTWey6whDXsRpN/TU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ThqB/pG/; arc=fail smtp.client-ip=40.107.103.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IKPAQGTcTli8s3m0cSRN00GgaH+WIISTiCS3u+ntQHr4XHqd+Jt81NefVHF4QzHG1PwqmS4s+i6S8TRtmPd1efH4TICEA/3paEjEXvbdw+ICunsYJhyOH5QzQs5wAcZ8HyBVZbDzpbaT+j28tx3/byNqS9I3KcWSHgjBbuQHfj8m1j6h+I+Kuwp2taDgMTgtv+x5VBp8MlGCP6xD7+rV2K4mzd0oR9bi8fQk17mAslQLKbMkp4Fqq9yrEFsE0r3dNm6ebGRTagc73M1LEn/sTHZyu/4TrlS1RR9yDR/eCRc2amBCluNjD3G5koWoQZ81jNB1WkYcV1CeHzLPsWPdWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3jS3mLt5yrfyMvGXECiKNmzrPTHftT4HLVmMTtZ7mE=;
 b=BUxhNuwD2fXly+ynHaMM8F632MiWnA/SbHaqNlWqYc3/XJqB+l9b5P1lS42WqXyd+oyZt/FZZ5PGX6Bn/JTcCeQfyC2Ya89rAMS5TYOTHBXnpp0U6+WKSUhqkR6btVPHvj7EWOe9Ye8G6cq2Mr+jTibRqaegBkdtRLwCfR9Rv+J7DCJNxOgTFZLOtX9gHzH10wX2wJ6jmyQeb2OeVcdAuVNdoaMnDj458pMo5B0/x9HrTVm25eQPw5j+EAJdZ3364m1VHOjeIIk5toTwS8oFY3aj/zvmJz4rgw6BvYe6MPtN7Ly0F5jIuaNZFDWJvaelSxV1Dys9jMykXbYShvwPvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3jS3mLt5yrfyMvGXECiKNmzrPTHftT4HLVmMTtZ7mE=;
 b=ThqB/pG/TdKqItuq18Eq2RtGT0CYoWovzLHjEr/qy7rviScwOXEqUNGUftLtRZXiXEwPrpC7trbzcCJw38y3byexhZCm9gGL6ndQr3UCWRviemkI2vMtinP0vGK/ytwOenbZ0P2ZaIdCUYV7goJmLYLwUXpJUqSqp1lXPad9PduFCeBr4208+0i3RPNpiTCPGs9TdnH+Py7efDfF2iybK0HVh35EVcmSblWsad2KzXudetJpktaiP8iobyyMd9krlb0ZStLdjQIQaimg11bxsCH5zfFd/2paWK5Jz1TWc0ojrlUTp9VNK/+DWKWcsO5gyUY9Aq+15fdFC5WSuLXk6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by PR3PR04MB7225.eurprd04.prod.outlook.com (2603:10a6:102:83::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Fri, 1 Nov
 2024 08:06:44 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 08:06:44 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev
Subject: [PATCH v5 2/7] mfd: nxp-siul2: add support for NXP SIUL2
Date: Fri,  1 Nov 2024 10:06:08 +0200
Message-ID: <20241101080614.1070819-3-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241101080614.1070819-1-andrei.stefanescu@oss.nxp.com>
References: <20241101080614.1070819-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0115.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::32) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|PR3PR04MB7225:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ce377ff-71c4-4cf3-6a18-08dcfa4c203d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|366016|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?anNLcmFKc3RxajdyakNQeHAxdEZ5ME92d0RWSFlLdFdrRjQ2bXBXbStROUxq?=
 =?utf-8?B?UTJPYlM1NjVkWXRFdVhKUGIrckhKQmRBRm5QdHRZMEprOWRhRURsYVJpUVZZ?=
 =?utf-8?B?QUtLbVpsaVlhYUl6cEhpNk1ReC9hV2FxNjFXMFBHeTVxM1pJTVBvSVk3RVpp?=
 =?utf-8?B?WFdkeVRPTnFsQVdGd0hNWDZZdzBsTjNjU254WHBYSmt1dS9zc1ZmMXg4TEQ5?=
 =?utf-8?B?WjhSQUtPcFMzZ0d5VzhVL2g3U2V5OUozdlRJTUc5NUxQWEVvS3QzSGhRQUNR?=
 =?utf-8?B?ekZ0dnd3UDJzNC91aWxBeW8rSmJHcEFRbmk1T0MxL1YzRGtXUmtDdjFSMy9M?=
 =?utf-8?B?ZGU5V2dIL0RqSStRV0RWWTBNbHE1cHNpM3kzRmRzM2VSRkxGOHlNRmRMSGx1?=
 =?utf-8?B?RTlCVXBRSWo4cUEzWGM2aVdIUis0SFRsdmFFNzVrM094RGhUTSsxQkNVbUFF?=
 =?utf-8?B?dVM4bGpORHFBOUJxaGVwck9zVVpySzF6ZjNsY1pwUXQvd2ZGNWVYVk8zUlBr?=
 =?utf-8?B?UFQ2UnJoWk1qU0Z1bVJtdVk2TGt6SnJQSUJwV01XS0RKQXlEM3lYY21tVEF1?=
 =?utf-8?B?SDBrS2wxZlJiZmNDRldSb3lzNXNBQkMreEZsZnVKSUlwSDJjMUxKbllaaHNo?=
 =?utf-8?B?TGxxbnhLS3MySFUrck93WExZRDBHWjNTR2U4UDE2Q2U1RFFXRHdRMytqbHNR?=
 =?utf-8?B?c2JYWXEzdFY0dTVIdlJ6dWI2SkNQQjRHakYzTEpyWWFzdG5OYUpIenVIbkJ1?=
 =?utf-8?B?NFhGanFWdWFmNU9OYVlwT25hRFNiWWt6TUNzV2NWeDNKT25nQTc1VkhuSzVw?=
 =?utf-8?B?Zm9rZ0F5SDc4V253Uyt4Tmd5WEtlTDgvMW5mZEV6VkdQRmZ5aHNCWHVReGhq?=
 =?utf-8?B?eW44MXk1aFliN3BpY2RudXRJTVloTnlCa1VTZFNuYzY1TWdIOE5kVWtEZGtW?=
 =?utf-8?B?KzFlSkFuZkhDVXBydHoxcmRXRTVOR245Ym5MWFJzTjhaMDAyTklCU2tNU2NV?=
 =?utf-8?B?b1pqZzNRalZPYXdYTEdoNHRCRFhMbXpDZXVWV09QdithS2xlR3lvYkJDUTlj?=
 =?utf-8?B?SUFPeEVpTmFlN3krNmVDc1k5ZXhyOGtFbW1uYUtxWXErVUcvSDFlb2MzL3dm?=
 =?utf-8?B?R291d2xrL2xXZ2VJVmx2dVdvemc3Rlh0cUw5SGRsL3FDY2VnWXRCY1VnVmJK?=
 =?utf-8?B?YjNtVFVXcnR5UWQ4ZDFxOGNySWQ2S1VxTlJ1L3MrdWx2VzlEYzM5a1ovZk10?=
 =?utf-8?B?RVh0WGxvakpQU1hZTzJHSTRGUmVoQ3V5OXAyOG9FaXl0d2k5VFB4YmorejZP?=
 =?utf-8?B?c2ltTU9VZUduSFJXcTgyd0hpOTdEUVJsTmFwQXFleS9HeklKVWIzTWo5NVVw?=
 =?utf-8?B?WnRIL2FFNzlVK29KbnFLb0g0dmFCZ1Jxejlkb3EvTFRUM2FVUmNYQmVTekxQ?=
 =?utf-8?B?UEtJbU5nelZoWUF0YStwVGJlUmd6bVRxVS82UEg5RG5EcXlkWWVDdVVNNlU1?=
 =?utf-8?B?aS83elR4eEhzTzFGNTBRTEU1VVRvUEt3eVdhYStvc29tdk9Ib1hpOHc4cjJL?=
 =?utf-8?B?WUlTWkNxSW5QaXllL3FhMlQ4Z0xERmFDdnJOaW56YUNuOUx4MVNkaWd4VVRu?=
 =?utf-8?B?anh4OWs2a2kvNjlqV091TldDY1VJay80VXdOMk9NUjhpYWo2ZGNJK2JjdmdC?=
 =?utf-8?B?UWpCOEcyNG1nYlpLcUNWQUpyNGdDNldqMmhMTlo0aG52RWYrR2YzdlFYM1hI?=
 =?utf-8?B?Q3VjRnRTMlRxWjlWdHBudWJGdEN1MkQxdzAzcnFtNzd5c2FldW9mcUNWbnUy?=
 =?utf-8?B?ei8yaTZuM1VGSU1sMEJFa0ovSVB4U2NJcHF5MDRDcy82U2YwU2lkMVIxWWxa?=
 =?utf-8?Q?6UuxO8dHhgDUf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(366016)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2pNbkxlN1lLRTNja1huRFNoc0JjdDVrSmNZbjB6QmZwZ1B2eUg3QTZiaVp3?=
 =?utf-8?B?M2ZiUGJHdVVwM1QvQkp1L2dIai9uckN0aCtmUzliUkNodjkveFJYNnFKWkZ2?=
 =?utf-8?B?TGRTYm1XOVlGVmIzWU41V2VBUGhXVGo2THo1U0tubUF0eEJDYXl6VjJLbk5y?=
 =?utf-8?B?RjhIUGdEK3J1cVJPOXNUZDNGNGkwNEFkelNiblNjT0FuSzVlaGJKdFdoQndh?=
 =?utf-8?B?eXJKT2NmaGQ2b0RadStieXQyU3hlWXFZTUhkZG42emQrejFtbVRGNzFlTmZU?=
 =?utf-8?B?c3JSLytmRmQ5cjkxRXdGTEp4Q0NLSzBTeGlhK0d4WEJSekFOdmR4dVRCQ2x2?=
 =?utf-8?B?WkJqYWRiZC9RR1R0eWZVcDdWclFWQ2tUQ1dpN3VSUnR0YTJUbjlvRmYzb2Np?=
 =?utf-8?B?M05nUjVvbnZzcTAremo4SWRmN3gzbk52NnhNNHZNM2h0Q2V5QnZSU29VSitE?=
 =?utf-8?B?akRmam1WOEtZaytOOXZlemdveVhxTmk0dkhHUk92Slo3d2luUWltSmdlc1I2?=
 =?utf-8?B?TkhyVFptNDNSQ1RhdHFYY20yRWdGdEhJNzZsTFR4MUZNSGV6dldHbmxnUXJk?=
 =?utf-8?B?SHM2NHBHMEgzeDNONTkyS1RsZlhBNkJJMlUvWjRsbXBFUG1lc1BaQVFvMllx?=
 =?utf-8?B?Q3JndlN4c2VrbFpsK0NoTUNBRmF1YThqVEJ0MWVDWXYva3hsWUt2ZkFhWm52?=
 =?utf-8?B?WFJwK1VzeGxYZVJ3REtOakZHbE9KdVcvbmxMNVJwODM5V3JPMEhlYm5ueXkw?=
 =?utf-8?B?TFFwOU5mNW5vKzZWQkRzS0JQcTI3U0h1b0dJcmpBQkR2NXYzcURFQVlWU29P?=
 =?utf-8?B?Z2VXeWYxam9zakxhOG0xa09iZVU1WE5RR1hHNWVEL2JNQW13Q2I3eHRSd2cx?=
 =?utf-8?B?ckJYNmNudmozcVRSQ3h5WEVXNnFZU3BGRmFmdkg1aGkyMXl1MmRkU29CRlpY?=
 =?utf-8?B?WHIzKzdQWVFvWkVsMU5ERzFqVlp5b2p5TWJhTHdaTWRndmFwTEhWZWgxb1Jo?=
 =?utf-8?B?YVdtY2c1cFl2UlpBdEN3a2hiQW1pRWJ0S1pFT1plZU1JWDNFOVJkaVE2bWc4?=
 =?utf-8?B?UTNmYWkzUHFxNmUvVWdacE1TTDBkRGJTN3haeUhmVzZTYXJZNmt0WTRMb0w2?=
 =?utf-8?B?bkNtWDlsc1hFMGIzK2dJQUFEdXhwSWFpYkUvQXYzbzExYmQzSlV0LzhIdllM?=
 =?utf-8?B?RGVES3pkLytiTWluNnRyQW50QVNHNWZsK3RxTzFkM2dKeExxNkw3Q2d5KzdK?=
 =?utf-8?B?cDRNVTNBK2ROSURWNm5XeWtqUEFoeFZXQnNraHlOSW0rSXBXQUdvUW9aNWlI?=
 =?utf-8?B?cWZjNlJyUno1WlAyYm50bFljdzlKcURGQ1g3REdGTnFYV01FKzZ4MnY4bnVW?=
 =?utf-8?B?NDVIanJGNHphRXBEZnROb0VJNzhKM2JwUWxXWllsTkh1Ui95ZEpFRWsyd1RF?=
 =?utf-8?B?VG5sdVA1RjIrRkpVclc2K3pBWXBVR2tmTHBFU2xVVDI0MDhhNCtEOVFqSi9Z?=
 =?utf-8?B?K2ZKQTI1Q0I5aUlxclFpWVQyNkN5bkd6ZTY1STlMNG5TRUc4VXJSemZBY3Rt?=
 =?utf-8?B?ZStZbWU1QVhhVGZDVXNZNG5vQUVESUVGRHJRcy9ncS94RG5SQ3h1WVNJZEhx?=
 =?utf-8?B?cDZnMlNVSEpYRFNydXRmVnl5RlcrTTVHVzlDc1dXVDZxV2RxYnY2NWl0UTNX?=
 =?utf-8?B?STBFcWxzci9neVp5SlBlT0ZhZTB4Ym5ZT0FRWDlyQmVGc0Fhb3JvRkR0RXps?=
 =?utf-8?B?NlA3UVBDeFFiVU81ZzloTXpmWGJVNmFUYVUva0R0aWM5TE96UGR3VUdvekdY?=
 =?utf-8?B?L3BGdjRHeUd3ZDJLZmRHY2d2TmZ1NEZmbnc2Ukw1R09iK3Fzb3BZTGJYMlhU?=
 =?utf-8?B?VE1nVmdNaEdOV1pLaHVJSEVnMXdneW5PcG1oVVVJSnpBc0ZORFlzUFVuem1r?=
 =?utf-8?B?a2l1QUtJdlNrNC9MbFIrQVhLRTlZVk1ldTZ5a2FqWkpqNG5udS9yZk5TNWFn?=
 =?utf-8?B?ZUNZdkl3Y2o0eEpYRDhxNlNoUU1OKzMwQXZ6VEp4SXV6eCsxUW40TmpEd0dZ?=
 =?utf-8?B?eDg5aFd1d1BBazAwZ0tWTE5DanVpN0dGYXNuMExDRm5FUWdYTFJ2YS9vZjM4?=
 =?utf-8?B?RDJtREFFWTlOUVlGY0FKWmFoMmpxS0pFMm00RHBBVER5WDJPaStmQTJYOElI?=
 =?utf-8?B?TWc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce377ff-71c4-4cf3-6a18-08dcfa4c203d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 08:06:44.6891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 22NlKMb5bXWAEX5cyq6J4NnOXgGnxkCBsfGy4hIpTmsAKM3qX3/TrjgrhzzJWcdXhs6D6dLtcm6+kmjFKNYCXic+1gIXGxrU2XFAdTymhhk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7225

SIUL2 (System Integration Unit Lite) is a hardware module which
implements various functionalities:
- reading SoC information
- pinctrl
- GPIO (including interrupts)

There are multiple register types in the SIUL2 module:
- MIDR (MCU ID Register)
	* contains information about the SoC.
- Interrupt related registers
	* There are 32 interrupts named EIRQ. An EIRQ
	  may be routed to one or more GPIOs. Not all
	  GPIOs have EIRQs associated with them
- MSCR (Multiplexed Signal Configuration Register)
	* handle pinmuxing and pinconf
- IMCR (Input Multiplexed Signal Configuration Register)
	* are part of pinmuxing
- PGPDO/PGPDI (Parallel GPIO Pad Data Out/In Register)
	* Write/Read the GPIO value

There are two SIUL2 modules in the S32G SoC. This driver handles
both because functionality is shared between them. For example:
some GPIOs in SIUL2_0 have interrupt capability but the registers
configuring this are in SIUL2_1.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 drivers/mfd/Kconfig           |  12 +
 drivers/mfd/Makefile          |   1 +
 drivers/mfd/nxp-siul2.c       | 411 ++++++++++++++++++++++++++++++++++
 include/linux/mfd/nxp-siul2.h |  55 +++++
 4 files changed, 479 insertions(+)
 create mode 100644 drivers/mfd/nxp-siul2.c
 create mode 100644 include/linux/mfd/nxp-siul2.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index f9325bcce1b9..fc590789e8b3 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1098,6 +1098,18 @@ config MFD_NTXEC
 	  certain e-book readers designed by the original design manufacturer
 	  Netronix.
 
+config MFD_NXP_SIUL2
+	tristate "NXP SIUL2 MFD driver"
+	select MFD_CORE
+	select REGMAP_MMIO
+	depends on ARCH_S32 || COMPILE_TEST
+	help
+	  Select this to get support for the NXP SIUL2 (System Integration
+	  Unit Lite) module. This hardware block contains registers for
+	  SoC information, pinctrl and GPIO functionality. This will
+	  probe a MFD driver which will contain cells for a combined
+	  pinctrl&GPIO driver and nvmem drivers for the SoC information.
+
 config MFD_RETU
 	tristate "Nokia Retu and Tahvo multi-function device"
 	select MFD_CORE
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 2a9f91e81af8..7b19ea014221 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -226,6 +226,7 @@ obj-$(CONFIG_MFD_INTEL_PMC_BXT)	+= intel_pmc_bxt.o
 obj-$(CONFIG_MFD_PALMAS)	+= palmas.o
 obj-$(CONFIG_MFD_VIPERBOARD)    += viperboard.o
 obj-$(CONFIG_MFD_NTXEC)		+= ntxec.o
+obj-$(CONFIG_MFD_NXP_SIUL2) 	+= nxp-siul2.o
 obj-$(CONFIG_MFD_RC5T583)	+= rc5t583.o rc5t583-irq.o
 obj-$(CONFIG_MFD_RK8XX)		+= rk8xx-core.o
 obj-$(CONFIG_MFD_RK8XX_I2C)	+= rk8xx-i2c.o
diff --git a/drivers/mfd/nxp-siul2.c b/drivers/mfd/nxp-siul2.c
new file mode 100644
index 000000000000..ba13d1beb244
--- /dev/null
+++ b/drivers/mfd/nxp-siul2.c
@@ -0,0 +1,411 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * SIUL2(System Integration Unit Lite) MFD driver
+ *
+ * Copyright 2024 NXP
+ */
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/of.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/nxp-siul2.h>
+
+#define S32G_NUM_SIUL2 2
+
+#define S32_REG_RANGE(start, end, name, access)		\
+	{						\
+		.reg_name = (name),			\
+		.reg_start_offset = (start),		\
+		.reg_end_offset = (end),		\
+		.reg_access = (access),			\
+		.valid = true,				\
+	}
+
+#define S32_INVALID_REG_RANGE		\
+	{				\
+		.reg_name = NULL,	\
+		.reg_access = NULL,	\
+		.valid = false,		\
+	}
+
+static const struct mfd_cell nxp_siul2_devs[] = {
+	{
+		.name = "s32g-siul2-pinctrl",
+	}
+};
+
+/**
+ * struct nxp_siul2_reg_range_info: a register range in SIUL2
+ * @reg_start_offset: the first valid register offset
+ * @reg_end_offset: the last valid register offset
+ * @reg_access: the read/write access tables if not NULL
+ * @valid: whether the register range is valid or not
+ */
+struct nxp_siul2_reg_range_info {
+	const char *reg_name;
+	unsigned int reg_start_offset;
+	unsigned int reg_end_offset;
+	const struct regmap_access_table *reg_access;
+	bool valid;
+};
+
+static const struct regmap_range s32g2_siul2_0_imcr_reg_ranges[] = {
+	/* IMCR0 - IMCR1 */
+	regmap_reg_range(0, 4),
+	/* IMCR3 - IMCR61 */
+	regmap_reg_range(0xC, 0xF4),
+	/* IMCR68 - IMCR83 */
+	regmap_reg_range(0x110, 0x14C)
+};
+
+static const struct regmap_access_table s32g2_siul2_0_imcr = {
+	.yes_ranges = s32g2_siul2_0_imcr_reg_ranges,
+	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_0_imcr_reg_ranges)
+};
+
+static const struct regmap_range s32g2_siul2_0_pgpd_reg_ranges[] = {
+	/* PGPD*0 - PGPD*5 */
+	regmap_reg_range(0, 0xA),
+	/* PGPD*6 - PGPD*6 */
+	regmap_reg_range(0xE, 0xE),
+};
+
+static const struct regmap_access_table s32g2_siul2_0_pgpd = {
+	.yes_ranges = s32g2_siul2_0_pgpd_reg_ranges,
+	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_0_pgpd_reg_ranges)
+};
+
+static const struct regmap_range s32g2_siul2_1_irq_reg_ranges[] = {
+	/* DISR0 */
+	regmap_reg_range(0x10, 0x10),
+	/* DIRER0 */
+	regmap_reg_range(0x18, 0x18),
+	/* DIRSR0 */
+	regmap_reg_range(0x20, 0x20),
+	/* IREER0 */
+	regmap_reg_range(0x28, 0x28),
+	/* IFEER0 */
+	regmap_reg_range(0x30, 0x30),
+};
+
+static const struct regmap_access_table s32g2_siul2_1_irq = {
+	.yes_ranges = s32g2_siul2_1_irq_reg_ranges,
+	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_1_irq_reg_ranges),
+};
+
+static const struct regmap_range s32g2_siul2_1_irq_volatile_reg_range[] = {
+	/* DISR0 */
+	regmap_reg_range(0x10, 0x10)
+};
+
+static const struct regmap_access_table s32g2_siul2_1_irq_volatile = {
+	.yes_ranges = s32g2_siul2_1_irq_volatile_reg_range,
+	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_1_irq_volatile_reg_range),
+};
+
+static const struct regmap_range s32g2_siul2_1_mscr_reg_ranges[] = {
+	/* MSCR112 - MSCR122 */
+	regmap_reg_range(0, 0x28),
+	/* MSCR144 - MSCR190 */
+	regmap_reg_range(0x80, 0x138)
+};
+
+static const struct regmap_access_table s32g2_siul2_1_mscr = {
+	.yes_ranges = s32g2_siul2_1_mscr_reg_ranges,
+	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_1_mscr_reg_ranges),
+};
+
+static const struct regmap_range s32g2_siul2_1_imcr_reg_ranges[] = {
+	/* IMCR119 - IMCR121 */
+	regmap_reg_range(0, 8),
+	/* IMCR128 - IMCR129 */
+	regmap_reg_range(0x24, 0x28),
+	/* IMCR143 - IMCR151 */
+	regmap_reg_range(0x60, 0x80),
+	/* IMCR153 - IMCR161 */
+	regmap_reg_range(0x88, 0xA8),
+	/* IMCR205 - IMCR212 */
+	regmap_reg_range(0x158, 0x174),
+	/* IMCR224 - IMCR225 */
+	regmap_reg_range(0x1A4, 0x1A8),
+	/* IMCR233 - IMCR248 */
+	regmap_reg_range(0x1C8, 0x204),
+	/* IMCR273 - IMCR274 */
+	regmap_reg_range(0x268, 0x26C),
+	/* IMCR278 - IMCR281 */
+	regmap_reg_range(0x27C, 0x288),
+	/* IMCR283 - IMCR286 */
+	regmap_reg_range(0x290, 0x29C),
+	/* IMCR288 - IMCR294 */
+	regmap_reg_range(0x2A4, 0x2BC),
+	/* IMCR296 - IMCR302 */
+	regmap_reg_range(0x2C4, 0x2DC),
+	/* IMCR304 - IMCR310 */
+	regmap_reg_range(0x2E4, 0x2FC),
+	/* IMCR312 - IMCR314 */
+	regmap_reg_range(0x304, 0x30C),
+	/* IMCR316 */
+	regmap_reg_range(0x314, 0x314),
+	/* IMCR 318 */
+	regmap_reg_range(0x31C, 0x31C),
+	/* IMCR322 - IMCR340 */
+	regmap_reg_range(0x32C, 0x374),
+	/* IMCR343 - IMCR360 */
+	regmap_reg_range(0x380, 0x3C4),
+	/* IMCR363 - IMCR380 */
+	regmap_reg_range(0x3D0, 0x414),
+	/* IMCR383 - IMCR393 */
+	regmap_reg_range(0x420, 0x448),
+	/* IMCR398 - IMCR433 */
+	regmap_reg_range(0x45C, 0x4E8),
+	/* IMCR467 - IMCR470 */
+	regmap_reg_range(0x570, 0x57C),
+	/* IMCR473 - IMCR475 */
+	regmap_reg_range(0x588, 0x590),
+	/* IMCR478 - IMCR480*/
+	regmap_reg_range(0x59C, 0x5A4),
+	/* IMCR483 - IMCR485 */
+	regmap_reg_range(0x5B0, 0x5B8),
+	/* IMCR488 - IMCR490 */
+	regmap_reg_range(0x5C4, 0x5CC),
+	/* IMCR493 - IMCR495 */
+	regmap_reg_range(0x5D8, 0x5E0),
+};
+
+static const struct regmap_access_table s32g2_siul2_1_imcr = {
+	.yes_ranges = s32g2_siul2_1_imcr_reg_ranges,
+	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_1_imcr_reg_ranges)
+};
+
+static const struct regmap_range s32g2_siul2_1_pgpd_reg_ranges[] = {
+	/* PGPD*7 */
+	regmap_reg_range(0xC, 0xC),
+	/* PGPD*9 */
+	regmap_reg_range(0x10, 0x10),
+	/* PDPG*10 - PGPD*11 */
+	regmap_reg_range(0x14, 0x16),
+};
+
+static const struct regmap_access_table s32g2_siul2_1_pgpd = {
+	.yes_ranges = s32g2_siul2_1_pgpd_reg_ranges,
+	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_1_pgpd_reg_ranges)
+};
+
+static const struct nxp_siul2_reg_range_info
+s32g2_reg_ranges[S32G_NUM_SIUL2][SIUL2_NUM_REG_TYPES] = {
+	/* SIUL2_0 */
+	{
+		[SIUL2_MPIDR] = S32_REG_RANGE(4, 8, "SIUL2_0_MPIDR", NULL),
+		/* Interrupts are to be controlled from SIUL2_1 */
+		[SIUL2_IRQ] = S32_INVALID_REG_RANGE,
+		[SIUL2_MSCR] = S32_REG_RANGE(0x240, 0x3D4, "SIUL2_0_MSCR",
+					     NULL),
+		[SIUL2_IMCR] = S32_REG_RANGE(0xA40, 0xB8C, "SIUL2_0_IMCR",
+					     &s32g2_siul2_0_imcr),
+		[SIUL2_PGPDO] = S32_REG_RANGE(0x1700, 0x170E,
+					      "SIUL2_0_PGPDO",
+					      &s32g2_siul2_0_pgpd),
+		[SIUL2_PGPDI] = S32_REG_RANGE(0x1740, 0x174E,
+					      "SIUL2_0_PGPDI",
+					      &s32g2_siul2_0_pgpd),
+	},
+	/* SIUL2_1 */
+	{
+		[SIUL2_MPIDR] = S32_REG_RANGE(4, 8, "SIUL2_1_MPIDR", NULL),
+		[SIUL2_IRQ] = S32_REG_RANGE(0x10, 0xC0, "SIUL2_1_IRQ",
+					    &s32g2_siul2_1_irq),
+		[SIUL2_MSCR] = S32_REG_RANGE(0x400, 0x538, "SIUL2_1_MSCR",
+					     &s32g2_siul2_1_mscr),
+		[SIUL2_IMCR] = S32_REG_RANGE(0xC1C, 0x11FC, "SIUL2_1_IMCR",
+					     &s32g2_siul2_1_imcr),
+		[SIUL2_PGPDO] = S32_REG_RANGE(0x1700, 0x1716,
+					      "SIUL2_1_PGPDO",
+					      &s32g2_siul2_1_pgpd),
+		[SIUL2_PGPDI] = S32_REG_RANGE(0x1740, 0x1756,
+					      "SIUL2_1_PGPDI",
+					      &s32g2_siul2_1_pgpd),
+	},
+};
+
+static const struct regmap_config nxp_siul2_regmap_irq_conf = {
+	.val_bits = 32,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.cache_type = REGCACHE_FLAT,
+	.use_raw_spinlock = true,
+	.volatile_table = &s32g2_siul2_1_irq_volatile,
+};
+
+static const struct regmap_config nxp_siul2_regmap_generic_conf = {
+	.val_bits = 32,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.cache_type = REGCACHE_FLAT,
+	.use_raw_spinlock = true,
+};
+
+static const struct regmap_config nxp_siul2_regmap_pgpdo_conf = {
+	.val_bits = 16,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
+	.reg_bits = 32,
+	.reg_stride = 2,
+	.cache_type = REGCACHE_FLAT,
+	.use_raw_spinlock = true,
+};
+
+static const struct regmap_config nxp_siul2_regmap_pgpdi_conf = {
+	.val_bits = 16,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
+	.reg_bits = 32,
+	.reg_stride = 2,
+	.cache_type = REGCACHE_NONE,
+	.use_raw_spinlock = true,
+};
+
+static int nxp_siul2_init_regmap(struct platform_device *pdev,
+				 void __iomem *base, int siul)
+{
+	struct regmap_config regmap_configs[SIUL2_NUM_REG_TYPES] = {
+		[SIUL2_MPIDR]	= nxp_siul2_regmap_generic_conf,
+		[SIUL2_IRQ]	= nxp_siul2_regmap_irq_conf,
+		[SIUL2_MSCR]	= nxp_siul2_regmap_generic_conf,
+		[SIUL2_IMCR]	= nxp_siul2_regmap_generic_conf,
+		[SIUL2_PGPDO]	= nxp_siul2_regmap_pgpdo_conf,
+		[SIUL2_PGPDI]	= nxp_siul2_regmap_pgpdi_conf,
+	};
+	const struct nxp_siul2_reg_range_info *tmp_range;
+	struct regmap_config *tmp_conf;
+	struct nxp_siul2_info *info;
+	struct nxp_siul2_mfd *priv;
+	void __iomem *reg_start;
+	int i, ret;
+
+	priv = platform_get_drvdata(pdev);
+	info = &priv->siul2[siul];
+
+	for (i = 0; i < SIUL2_NUM_REG_TYPES; i++) {
+		if (!s32g2_reg_ranges[siul][i].valid)
+			continue;
+
+		tmp_range = &s32g2_reg_ranges[siul][i];
+		tmp_conf = &regmap_configs[i];
+		tmp_conf->name = tmp_range->reg_name;
+		tmp_conf->max_register =
+			tmp_range->reg_end_offset - tmp_range->reg_start_offset;
+
+		if (tmp_conf->cache_type != REGCACHE_NONE)
+			tmp_conf->num_reg_defaults_raw =
+				tmp_conf->max_register / tmp_conf->reg_stride;
+
+		if (tmp_range->reg_access) {
+			tmp_conf->wr_table = tmp_range->reg_access;
+			tmp_conf->rd_table = tmp_range->reg_access;
+		}
+
+		reg_start = base + tmp_range->reg_start_offset;
+		info->regmaps[i] = devm_regmap_init_mmio(&pdev->dev, reg_start,
+							 tmp_conf);
+		if (IS_ERR(info->regmaps[i])) {
+			dev_err(&pdev->dev, "regmap %d init failed: %d\n", i,
+				ret);
+			return PTR_ERR(info->regmaps[i]);
+		}
+	}
+
+	return 0;
+}
+
+static int nxp_siul2_parse_dtb(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct of_phandle_args pinspec;
+	struct nxp_siul2_mfd *priv;
+	void __iomem *base;
+	char reg_name[16];
+	int i, ret;
+
+	priv = platform_get_drvdata(pdev);
+
+	for (i = 0; i < priv->num_siul2; i++) {
+		ret = snprintf(reg_name, ARRAY_SIZE(reg_name), "siul2%d", i);
+		if (ret < 0 || ret >= ARRAY_SIZE(reg_name))
+			return ret;
+
+		base = devm_platform_ioremap_resource_byname(pdev, reg_name);
+		if (IS_ERR(base)) {
+			dev_err(&pdev->dev, "Failed to get MEM resource: %s\n",
+				reg_name);
+			return PTR_ERR(base);
+		}
+
+		ret = nxp_siul2_init_regmap(pdev, base, i);
+		if (ret)
+			return ret;
+
+		ret = of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
+						       i, &pinspec);
+		if (ret)
+			return ret;
+
+		of_node_put(pinspec.np);
+
+		if (pinspec.args_count != 3) {
+			dev_err(&pdev->dev, "Invalid pinspec count: %d\n",
+				pinspec.args_count);
+			return -EINVAL;
+		}
+
+		priv->siul2[i].gpio_base = pinspec.args[1];
+		priv->siul2[i].gpio_num = pinspec.args[2];
+	}
+
+	return 0;
+}
+
+static int nxp_siul2_probe(struct platform_device *pdev)
+{
+	struct nxp_siul2_mfd *priv;
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->num_siul2 = S32G_NUM_SIUL2;
+	priv->siul2 = devm_kcalloc(&pdev->dev, priv->num_siul2,
+				   sizeof(*priv->siul2), GFP_KERNEL);
+	if (!priv->siul2)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+	ret = nxp_siul2_parse_dtb(pdev);
+	if (ret)
+		return ret;
+
+	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
+				    nxp_siul2_devs, ARRAY_SIZE(nxp_siul2_devs),
+				    NULL, 0, NULL);
+}
+
+static const struct of_device_id nxp_siul2_dt_ids[] = {
+	{ .compatible = "nxp,s32g2-siul2" },
+	{ .compatible = "nxp,s32g3-siul2" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, nxp_siul2_dt_ids);
+
+static struct platform_driver nxp_siul2_mfd_driver = {
+	.driver = {
+		.name		= "nxp-siul2-mfd",
+		.of_match_table	= nxp_siul2_dt_ids,
+	},
+	.probe = nxp_siul2_probe,
+};
+
+module_platform_driver(nxp_siul2_mfd_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("NXP SIUL2 MFD driver");
+MODULE_AUTHOR("Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>");
diff --git a/include/linux/mfd/nxp-siul2.h b/include/linux/mfd/nxp-siul2.h
new file mode 100644
index 000000000000..238c812dba29
--- /dev/null
+++ b/include/linux/mfd/nxp-siul2.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * S32 SIUL2 core definitions
+ *
+ * Copyright 2024 NXP
+ */
+
+#ifndef __DRIVERS_MFD_NXP_SIUL2_H
+#define __DRIVERS_MFD_NXP_SIUL2_H
+
+#include <linux/regmap.h>
+
+/**
+ * enum nxp_siul2_reg_type - an enum for SIUL2 reg types
+ * @SIUL2_MPIDR - SoC info
+ * @SIUL2_IRQ - IRQ related registers, only valid in SIUL2_1
+ * @SIUL2_MSCR - used for pinmuxing and pinconf
+ * @SIUL2_IMCR - used for pinmuxing
+ * @SIUL2_PGPDO - writing the GPIO value
+ * @SIUL2_PGPDI - reading the GPIO value
+ */
+enum nxp_siul2_reg_type {
+	SIUL2_MPIDR,
+	SIUL2_IRQ,
+	SIUL2_MSCR,
+	SIUL2_IMCR,
+	SIUL2_PGPDO,
+	SIUL2_PGPDI,
+
+	SIUL2_NUM_REG_TYPES
+};
+
+/**
+ * struct nxp_siul2_info - details about one SIUL2 hardware instance
+ * @regmaps: the regmaps for each register type for a SIUL2 hardware instance
+ * @gpio_base: the first GPIO in this SIUL2 module
+ * @gpio_num: the number of GPIOs in this SIUL2 module
+ */
+struct nxp_siul2_info {
+	struct regmap *regmaps[SIUL2_NUM_REG_TYPES];
+	u32 gpio_base;
+	u32 gpio_num;
+};
+
+/**
+ * struct nxp_siul2_mfd - driver data
+ * @siul2: info about the SIUL2 modules present
+ * @num_siul2: number of siul2 modules
+ */
+struct nxp_siul2_mfd {
+	struct nxp_siul2_info *siul2;
+	u8 num_siul2;
+};
+
+#endif /* __DRIVERS_MFD_NXP_SIUL2_H */
-- 
2.45.2


