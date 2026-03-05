Return-Path: <linux-gpio+bounces-32594-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IH6jIvijqWl5BQEAu9opvQ
	(envelope-from <linux-gpio+bounces-32594-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 16:40:40 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CEB214B42
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 16:40:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74A9231203B0
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2026 15:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 419713C6A44;
	Thu,  5 Mar 2026 15:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pvGfxYX7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013069.outbound.protection.outlook.com [52.101.83.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799513C2786;
	Thu,  5 Mar 2026 15:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772725017; cv=fail; b=udQmpUNGb1/XmCFG2ZLSr0JNOI3asR6wgm2fCeLQxtp6xt+Zk2M7GTZ8KeLlkevQL4IQNA8nd+6+ngDIIwpIFuxlR5saDELx8bI/MusdTz4CipbHmB6vlAG0ohsoveKy9m61c5YIMVC6Rh6vKthgHNBddrLpY2X9N7ludq1/7pw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772725017; c=relaxed/simple;
	bh=WOTZbMJjw1i7YGgJjxM0t/VVuCVVl2WWGMyYeuxGzG0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=vGl2/a7X9r0SxL7XeYwALWVnIVpMxNbT1fsPHU2lkD/ILgHRAMoXzktnJQUwWqE0mpmvX032VGgXjx/alArVmzM9vH7sbaHsfcOlPNJJCO7qNGd4bl/TpxXwS8qA3ssfnQH8KtK6WQxEY2G+Bg60w0C9oaSHW/7GPEATBuGU/7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pvGfxYX7; arc=fail smtp.client-ip=52.101.83.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jBwxKc4yVhw5XQCaDiBUoOAGWvU1jpSEegdBBoD0LmlYnsQfbCaam96lXVeQhVuMk/P2NLMEapFUKj+OajKgs+UFgMtSNEz9l649UfBCvGb2FGpdXcvYDjTsM84OrsAsA+sVXER6jNh2KVSBU+a4d0e080RolvfRVSIUPoyIr3zwuFvJYnHOiF3kxg2bbC0kTVhvNDf2HXutQVwi1tICSrjlBVvGKuZbGilARs5fmLqW1OExAmgmK5V3Pvrz/AjyI347oYYhQRvm9/s1qddeqgdVKSSn+R+tIx0khD8M5/MiIUyQhyR8Q4Voz/4Xm45oczRpFCWG64+uvFBij00RMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7FLnrjtHtkTm3gDsK9QSPnZhS2xt8dN4MonrCmPC1yc=;
 b=N+9sFecMhaPlvT6f23NvaUZFLt4/TD1r6QLFmrtjAYG2iHlzOlY4GGrQKw7q7+YjKEk1w2XQmyLorwu9NJITR5HeXtibHpNLWTuD2EzYktxarsYljfsj61Lg/5Xgv9yxLfjhLDc34Nv73Q56nbftA4+aUEGghkjlsNWPookJjQHPcp04fSGr0hGn/LWVditLjA8DkW6znBxiTQW9bdPzS7OC3Gck6MGbDB1KLpcU/Gj9RLhQ/N04raYBu1j1QBQ/gtFNPO3snkyF8QDhzg0xCPAp9kQ4hGjmLfdLdRoC5OE7hcGbI97YeBBswIMbvSXGJ3z80RdeZBURcNCPa2q+uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7FLnrjtHtkTm3gDsK9QSPnZhS2xt8dN4MonrCmPC1yc=;
 b=pvGfxYX7sdTwp5mmcRTnpeKQ5KjxBFPP6w/VAB7hZI7k1qGg3nI6a3ap+kmq0FZ6Kj016XqF3QUm9tw8ctSJtmTRnkEh4J/lsCT+8z6T/3KM4pEtoE3VIbC8WvJ8b/Lx9UixP5GVqlkkL7D5I+3XXrqquW5SDn73C2TtEhz4w5mzghv4ewwpvfoqzprTuj7nFM2/igIlgax1hYyU7xbksSter4DY2okbskO517af1+ewj0ekCC1c+L+di3q6bwEIXwu7RpIhb6i6rfqxeDPPBMKgNXzrEbj19dYD5of0wktFzF3CWrG4oe/ZyBIMMhn2j2gQt1NpYq+GfhX1tqPy4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by DU4PR04MB10624.eurprd04.prod.outlook.com (2603:10a6:10:592::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 15:36:51 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 15:36:51 +0000
Message-ID: <7f66aa76-394f-4478-88a0-f2dbf3a19d45@oss.nxp.com>
Date: Thu, 5 Mar 2026 17:39:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/5] docs: driver-api: gpio: rpmsg gpio driver over
 rpmsg bus
To: Shenwei Wang <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, arnaud.pouliquen@foss.st.com
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
References: <20260304211808.1437846-1-shenwei.wang@nxp.com>
 <20260304211808.1437846-2-shenwei.wang@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260304211808.1437846-2-shenwei.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P195CA0003.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::9) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|DU4PR04MB10624:EE_
X-MS-Office365-Filtering-Correlation-Id: a3128f45-65d8-406c-4848-08de7acd03ec
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	tRWxib4ZZZrmDQ/WYK1Ev6MMoDDo512BbeE9FS5tP2l4GUFi1b0q1p4DcOjIEgoHL0iJqbRiUvCzBZ/CAEQD4Ca0he35nHx/mVXvcKf9jYpVy2PQ1b7JnrFRaBWPtE9Jp2/eUNYlF98m7S69yyUWZTyEec+CeN2ZWCbKnMvOfKN/Nng57O8sZxsTH/uxrKhxlUVl3c6jICkPj62LP69Z+3Yo+4ALmV8gu5MtWjKTS4GMQyq2Cl5TWsJ/PecR7jya2K+2jyDgbsisc7ro8Cb8fZ94+N1WqdH5ubhKAqT60viBfHmUcZCLIW77bpjxZjBkWR27EbO3a/xQPCfI15cOqxNTGDif7Qo1IrWd3o9D/U3OSrz17C1HxEJxh+BHzWC6wf1Ik/G1uzgfk5iubZLkyOLctyWAEwNzCvXs0LKF72QdJh9gsvkTP/md1jmiSyjAJyYetshntuV0qVlz4OEGai64K0/jK8T153mpxs+uEMaqQk7h+SUyldjMgn60yZhE5bSRUF//jlrnlUwKnR5ROqiXe9WmKCex9inZh+xvGMbjEGpM6ykjlUH3QD11YvxsAd252jSBjnX0Wmmi/VEB95R8RNupWBVGZ/0lLTerhNQ3OFvnUW7toYGr05AbJJ0HB6GExjT5fPqrFRl1eTCy+7iZH+YJaM1xX53c3V1bcpQFqv6vzDwVe6NU6//YYY9DEP9UjHoILWrYbfityXtzBy8U2faI2jp2Og0Eh0eHwD/lThm4Qk/4nDT7IMbnflvC8AlbJxTrWIDcMbIRLVri7g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVBqNHBzaUs1NFZWRDN5MHhHVEEvdGEvY1RBd3RnVkh6am9mNlVuSDRZcjh3?=
 =?utf-8?B?M0xBcFlCdW5pV0pOZGdQa1NHejJTcjdhamZZSXB5QlZSYnp3NEZkOUxjVVlQ?=
 =?utf-8?B?eXZuRUEzK09PbklkblN2ZWpHdXBqN0xZMlVxRjRsN1EvYnpHOWFmZnRnRFZE?=
 =?utf-8?B?V2ZhelR0QzJEWmJnK2d4MW9jUkNNcDJuRFZVMFVubHhNc01uZWtuZGNUbTda?=
 =?utf-8?B?RytoR3g0LzQxNUROeXhzK1VxNnc3K2hsazNqR3FKSGlZbDlLQTlCWTc0dmZ3?=
 =?utf-8?B?NVFvektVUTN2VzJob1BVeTkwZjIvMStXdnhReTJlZklqeEFhRk1rWVNkOXhS?=
 =?utf-8?B?QTJXZFRkTGRPcy92d0NGTmVwY3NMcVU0YWdGL2Y4OWkvUHoxc0xQd3Y2eS95?=
 =?utf-8?B?TDdiOU9iaGdISmZQZzdGbi9wNUtacjhvdWJBTzFsbkNCUlcvR3o4dzB4OTlX?=
 =?utf-8?B?aTJvM2lnQWU4UGNTQ0gvMk1oWDdBYXJZTzhVc3FhTzJOc0RWS3o5ZDB3M0Zo?=
 =?utf-8?B?ZzNvMVVpK3pydTByYVU2enBrZzRzek9FOWh4ZWJRbXZITlMwYVQrVmpqT1lB?=
 =?utf-8?B?V1N6d1VVeFJsVjd3bERPdWJ4TjFoQlVWcGRwV3lmaWl2aWcreXlabVlxbUZl?=
 =?utf-8?B?UzAyODRDZ2d4RU40QXpmOUNHOFZNT2NJQ1A4cWJlL2VXb3M4Ny9ranVCcTgr?=
 =?utf-8?B?dHMySUszakFSZy9OcWFjeHdFU0Q1aGlOQW90dWR0ZFE2ZWdCNGN4UE5yTmFk?=
 =?utf-8?B?elBJRmxxZmJUdXlPakFCY0Z5YzA4RXA5bmpyZ1lIYksweXZkQi9UbmQvdHZP?=
 =?utf-8?B?MUN6MENLcHBpRnp5dEJlaFBONU5zMGdGQlRuS1pUOTlCVytGcmg2YUhGU1Vj?=
 =?utf-8?B?QWRnRWlNNkR3cWFqWGpBMmJQVER4MWo2aTNHWTFjaGRhYjJxLytqc0JWcDBu?=
 =?utf-8?B?TjRkdjlYK1NOVkhSK1dFOEtWL2FMaUtQMU9rRlE2UVpNVTlPOWNoNGpvT0Jk?=
 =?utf-8?B?SXRqR3Z4bVByTnFWb0tOVHVzSm82czdxL2tZWjdLT0laRVRCVSs3VXdKdVBn?=
 =?utf-8?B?NS9qanlhZXViYmw2QTlLdGRzVHluTXI4VHo4QmFiZFdDVHRBZnNxditOYjhC?=
 =?utf-8?B?ZzJiMWVzd0xQK0dwaUVVYVk0TjlvdWxTTEdiYlc2UzJwQndtMFYyNUxSVXht?=
 =?utf-8?B?RWdqZ0hzTDQvSzJhSUFldEdwUVE2dk9lQ2FkMENrTVFxQ2JQYWxqSWZmUnVH?=
 =?utf-8?B?emdqOHlpTDdhNis4UG9EWWp2YUhTeng0cytTMzR1N1dXejdYcnlyeW5zWHNa?=
 =?utf-8?B?TDE5aGxITmQ2SFdwNlNtM2NZVWlhQTE5dlkwdHkyTG12ME1OMlp6aVVVelN3?=
 =?utf-8?B?akludXdIbVRTV1RGOW9ZTE1WL3V1QlB5czNJTFhhRWdKb0w0TjJBcUNMeUlq?=
 =?utf-8?B?aEI4clV5dFF4NjFBSW5LSzNtQ0JjS3RJeTBqSXhkTmdvanRjTWdEaUNoSXpr?=
 =?utf-8?B?b3Y1eDZUMTVjTlBOTksrT0NaZGovaFRKYzQ2SlJuYXhVSFVtRGpZWmc5S2Fs?=
 =?utf-8?B?dk0zaEprZHlvZWRVa0JpNnVlb1JUWk1NRWk0bDduZXp5MW5hckM4L1NONGRv?=
 =?utf-8?B?L2w2WVpYUy9YbFpYc01NSHYraVdQNU12Zmttb0lMZWRvd2V4NE5EQ2diTHdU?=
 =?utf-8?B?NXR4S0ZxSDhUTVljNUZYUmFWdzdLdnZzQk9MbWIrUlBPQm9MOVMzUmE2aWh5?=
 =?utf-8?B?NE1Wa0pqMFFYTmhVUzJKTkVWMzNXQ0xOOFdKZHBsQTFrWW1wNnl3eks5ZnVm?=
 =?utf-8?B?dWZGcXRDc2taeEZSL0x3Y2R0VGs0a0pLa1JmaUtuQk02OE1EbE91ekwyVGZL?=
 =?utf-8?B?a2RVOHJXaG5NMnpBcnViZHZjRlpXajdFSmFjT1A2ZTZuSkNvT0xPcERYeVo5?=
 =?utf-8?B?dFp0bVp4ODJja0dCSUhvaGNYMEo3OXp3YVJJM0lBeXpXMUM4T0luU2lCbjhQ?=
 =?utf-8?B?SncwNStIVU9UY0NZTXlhV3R5VFk3Q2hsZDIzRVFsUXk4RFo5NUNmcjZYaGQv?=
 =?utf-8?B?WGxZczJ1aHVFL0VBVFRscS9CVUI4R0s0Tkx5aTFSNFBPWVpxRFM4ZmNjVTA4?=
 =?utf-8?B?dys0Qy9XNEU4NjZhM2RMRFlwWWVPV1BsL1loUmwrRWVRb3l5cFpiUVQ1eXJ1?=
 =?utf-8?B?dlRDZ2hrUXpVZTdCTFRyYXZTTkZocDhzVGpYZm1BSzNQb0d4eHUwc3ZxZGI4?=
 =?utf-8?B?dG10aG1DL1ljbUQ1aE5GYTNETU1GSzcrbGo2SGhNL0pHSE5BbjB6ZDJaeUlU?=
 =?utf-8?B?eUx1QVJ3alhINzlzMmsyb2t4MFE5K0dJczZDanZGeDc5bWp1Zkt2QT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3128f45-65d8-406c-4848-08de7acd03ec
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 15:36:51.2931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q4Q87KxZHIw6hrUWApS9bAfxWthaLn5BelseZv+y2+XW+7bX763Jr3nc13RWEJlDB5f0KYvY+qTo3Ak2IbekPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10624
X-Rspamd-Queue-Id: 37CEB214B42
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32594-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.baluta@oss.nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Action: no action

On 3/4/26 23:18, Shenwei Wang wrote:


[...]

> +GPIO RPMSG Protocol
> +===================
> +
> +The GPIO RPMSG transport protocol is used for communication and interaction
> +with GPIO controllers located on remote cores on the RPMSG bus.
> +
> +Message Format
> +--------------
> +
> +The RPMSG message consists of a 6-byte packet with the following layout:
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> +   |type |cmd  |port |line |  data    |
> +   +-----+-----+-----+-----+-----+----+
> +
> +- **Type (Message Type)**: The message type can be one of:
> +
> +  - 0: GPIO_RPMSG_SEND
> +  - 1: GPIO_RPMSG_REPLY
> +  - 2: GPIO_RPMSG_NOTIFY

I think would make sense to display the type in hexa.  e.g : 0x00, 0x01, etc.

Also, would it make sense to display the byte index as follows outside of the boxes?
> +
> +- **Cmd**: Command code, used for GPIO_RPMSG_SEND messages.

Are there any specific commands? Also please either use upper-case first 

letter (e.g Type, Cmd) or lower-case letter (port, line) but do not mix them.


> +
> +- **line**: The GPIO line(pin) index of the port.

In message format line comes after port so switch the order here.

> +
> +- **port**: The GPIO port(bank) index.
> +
> +- **data**: See details in the command description below.
> +
> +- **reply err**: Error code from the remote core.
> +
> +  - 0: Success
> +  - 1: General error (Early remote software only returns this unclassified error)
> +  - 2: Not supported (A command is not supported by the remote firmware)
> +  - 3: Resource not available (The resource is not allocated to Linux)
> +  - 4: Resource busy (The resource is already in use)
> +  - 5: Parameter error

Is this part of the 6-byte packet? Are these standard errors or you defined them as is?

> +
> +
> +GPIO Commands
> +-------------
> +
> +Commands are specified in the **Cmd** field for **GPIO_RPMSG_SEND** (Type=0) messages.
> +
> +The SEND message is always sent from Linux to the remote firmware. Each
> +SEND corresponds to a single REPLY message. The GPIO driver should

Wouldn't be the other way around? Each REPLY corresponds to a single SEND msg?

> +serialize messages and determine whether a REPLY message is required. If a
> +REPLY message is expected but not received within the specified timeout
> +period (currently 1 second in the Linux driver), the driver should return
> +-ETIMEOUT.
> +
> +GET_DIRECTION (Cmd=2)
> +~~~~~~~~~~~~~~~~~~~~~
> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> +   | 0   | 2   |port |line | 0   | 0  |
> +   +-----+-----+-----+-----+-----+----+
> +
> +**Reply:**
> +
> +.. code-block:: none
> +   +-----+-----+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> +   | 1   | 2   |port |line | err | dir|
> +   +-----+-----+-----+-----+-----+----+
> +
> +- **err**: See above for definitions.
> +
> +- **dir**: Direction.
> +
> +  - 0: Output
> +  - 1: Input
> +
> +SET_DIRECTION (Cmd=3)
> +~~~~~~~~~~~~~~~~~~~~~
> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> +   | 0   | 3   |port |line | dir | 0  |
> +   +-----+-----+-----+-----+-----+----+
> +
> +- **dir**: Direction.
> +
> +  - 0: None
> +  - 1: Output
> +  - 2: Input
> +
> +**Reply:**
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> +   | 1   | 3   |port |line | err | 0  |
> +   +-----+-----+-----+-----+-----+----+
> +
> +- **err**: See above for definitions.
> +
> +
> +GET_VALUE (Cmd=4)
> +~~~~~~~~~~~~~~~~
> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> +   | 0   | 4   |port |line | 0   | 0  |
> +   +-----+-----+-----+-----+-----+----+
> +
> +**Reply:**
> +
> +.. code-block:: none
> +   +-----+-----+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> +   | 1   | 4   |port |line | err | val|
> +   +-----+-----+-----+-----+-----+----+
> +
> +- **err**: See above for definitions.
> +
> +- **val**: Direction.
Why is direction High or Low? Or I'm missing something.
> +
> +  - 0: High
> +  - 1: Low
> +
> +SET_VALUE (Cmd=5)
> +~~~~~~~~~~~~~~~~~
> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> +   | 0   | 5   |port |line | val | 0  |
> +   +-----+-----+-----+-----+-----+----+

So when getting replies val is at index 5, but when sending requests val is at index 4. Wonder

if we make this consistent? Or at least explain why did you choose this layout.

> +
> +- **val**: Output Level.
> +
> +  - 0: High
> +  - 1: Low
> +
> +**Reply:**
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> +   | 1   | 5   |port |line | err | 0  |
> +   +-----+-----+-----+-----+-----+----+
> +
> +- **err**: See above for definitions.
> +
> +SET_IRQ_TYPE (Cmd=6)

Is there a cmd for gpio polarity?

[...]
> +
> +NOTIFY_REPLY (Cmd=10)
> +~~~~~~~~~~~~~~~~~~~~
> +The reply message for the notification is optional. The remote firmware can
> +implement it to simulate the interrupt acknowledgment behavior.
> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> +   | 0   | 10  |port |line |level| 0  |
> +   +-----+-----+-----+-----+-----+----+
> +
> +- **line**: The GPIO line(pin) index of the port.
> +- **port**: The GPIO port(bank) index.
> +- **level**: GPIO line status.
> +
> +Notification Message
> +--------------------
> +
> +Notifications are sent with **Type=2 (GPIO_RPMSG_NOTIFY)**:

Here you should clarify who sends the notification messages.

... Notifications are messages sent by the remote core and they have Type=0x02...


[..]

