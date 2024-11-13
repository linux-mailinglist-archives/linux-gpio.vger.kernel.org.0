Return-Path: <linux-gpio+bounces-12928-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A059C6C8D
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 11:13:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 058D3281DF3
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 10:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 928B21FBF62;
	Wed, 13 Nov 2024 10:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="uAfgl4za"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012060.outbound.protection.outlook.com [52.101.66.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BC01FBCB4;
	Wed, 13 Nov 2024 10:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731492766; cv=fail; b=JGjAQtx/GXaf2uydeFsyUitFy4+9/mmkZbr5ZQaoLiG+jZD6JnYXd2fWWs/HfVXnfbLfAOEOa2RcU5z8UsOdpL+GsmTiNUMbayhiHG4tXa5eg5K87a4l8yz8tM91N5tAChH40Aep6QcQ4HPqiTfAHNygwTdO29DWmLYVQztrpgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731492766; c=relaxed/simple;
	bh=3bSU/+/WEI2ll/hwHogFmrw+KjzUx9DhteQpkl9m5hc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=orRv4ly6YRj9amjuSqBMmo5m5ZcWclVYu1hfr83JYsJozjx36T0sA7AcvoiRydLKnYfCgjCsRpsmyU7CDDjqO51DclDI+Ww2guvYMTC/GeBYig04C3QaH4HpWNOYrzcq7/EV+y3DnHzxiY+qk6TxTCwAd4LHn/Ur6hyPvX5rzu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uAfgl4za; arc=fail smtp.client-ip=52.101.66.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nSNC1+Xi8XpBxLcl4OKPhRshaTPWgiTIUaOvqRWJOkA+RNW0JssTMu17JriFjFowC1ZEDfYr1blSBaMIulhyX0Rz32J/jyC8098NkCniOMUXNXXXJOETU7pPjzK3NXApgfIBC7v/1VWALxETaIXmNsgSkCTVjFTFAGnO4xuNMIDwXLKxyPbxMlraa0ikUf8hVs4fZphJpq7QLxPA4L8FpPkUYC+L51E/oQ6R5nmrJWe8PVLmb0w6x+EJtSlAX2mR3gfwiErtcwhTIGTx9y7yZTETNVpxfRHOPLi1AJmbNZRzdfxiq/ZJqhJg7EnVtP9PaKHVivvSEaWWaJe3q3U/3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZEz9b3B1i1ILao0v9v90lW1lAX8gf1SnYxp2LX+RRs=;
 b=GHE6zC0t5AZ6Jz0subwe25Vl2wt27adUuiGefC+Bct2nqvIAJ9Wao3WK0akqELJxAq4OftuJQsOV2542OqNzPutN6fAghEQsP60Um7r0oGcKYRoZBA4eOv7MRyM7aitG1BVPOLlJ/Pz4JCvx7s7qMwwnRrLNJby25x++N4/IeKYDu1XvbvaOHzxqo0hNu8uLkH3Cjt/5gxMiv/YD+s9pL51e785ilGo4Bq1WkF78WTrUD8VEVxjFXv0wd+jcQ0slA4BREaYnKAGwnnsEPiyFXIOfal7XOL9QOkw8Fk0yt2kXXo0UpssCs977swqkw+dt/RHq7rw12ktJYbqKMuKlyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZEz9b3B1i1ILao0v9v90lW1lAX8gf1SnYxp2LX+RRs=;
 b=uAfgl4zaJsFZGxQ7+JwPBfniGm11WgXuc1YwtSoEwwiFB5iK0TE6wO2qWhTzfndEnfYCQYvEDyMEmJu5izcldxSrEzwENfsqPxYtdhpeLrQeAX/K4ncbq/kohykHWt/w1hnq0B68lPQvZp8BSJnvLsdoGfBDwQmL5IVLf/Pk07n73ok6GRnEJJEUnyDEYKU1/+rS0sw1W5gYdMncQ6muojvDgiXNG2Z+ieW3XTGxIzcS5Ei/r+4pZsdm3nnlUWmqSkQpPFaYnA0SUJQmyZYkX+SvvXZWrMVlOwXfNtREKeUlyoTD1XPB8NuF9LkDfYxoVdi+YCEeegWi8p3/ZWRpqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by DBBPR04MB7739.eurprd04.prod.outlook.com (2603:10a6:10:1eb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Wed, 13 Nov
 2024 10:12:39 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%4]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 10:12:39 +0000
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
	imx@lists.linux.dev,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: [PATCH v6 4/7] pinctrl: s32: convert the driver into an mfd cell
Date: Wed, 13 Nov 2024 12:10:56 +0200
Message-ID: <20241113101124.1279648-5-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241113101124.1279648-1-andrei.stefanescu@oss.nxp.com>
References: <20241113101124.1279648-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P251CA0005.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::10) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|DBBPR04MB7739:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a8deaf5-cd19-4692-0620-08dd03cbb458
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L3UrTXpMdFhKSFZXYmJaK3VqZjVudVNHbzMrQy9sS0tUZk9ramFjbkxGL2Zq?=
 =?utf-8?B?TXRqUE1TZFZLSW1mbVZKcml0Vm1XY1JrV0xxNzJ2Q1BJMzVOR0lYbzQ0VXFS?=
 =?utf-8?B?YjNVRnRvak5qQkFtcmhoNGJlYXVOR3pxbCtXSC9pYktWcnU5UmtWRm1sSEVX?=
 =?utf-8?B?bmFFOFNlVzE0NzhUclV5SDJDSll0Y1VHMGppeXllWjdlSk1yVU9JcEwvbFlN?=
 =?utf-8?B?QStUQXEzampyZkJHaDB6QzdoUGdDdmpSZVNVSE1WSGhPeXdFVkRNaUw3N3Rw?=
 =?utf-8?B?VDROekxMR0QrUFBkSFc0cjdCZnlLdDJYL25FWVhaTXRnUm1uVFdWMTBwYVRq?=
 =?utf-8?B?MTlwNjEybmRJcnI1WlR5YUpQZWNqVWJYMXN4amFRZ1VuNDU4Rk9hYkJPcjVH?=
 =?utf-8?B?VmIvaTdWaTlpdVV5RlBwdXVkcVFRZGtVdFpCRmxaUkNqMitST2F6Z2o2QUFj?=
 =?utf-8?B?bEUzNWUzUG1JZ2FHQlM0YlQ4bE1KRkUvT01HODFSVC9NK2R0NkJVQWh2ZlFZ?=
 =?utf-8?B?L01RaG1QVUN2QW5ndE4yaDAvOXo3VFNiMFhOaEYrTTkwdEZsdFZ1WHJBWWdP?=
 =?utf-8?B?dWxtL1U3UFNCSEMxVmpFbkEycy9mMDc3OGk5RFZYZSs2ZUQ3YUtXbXhFUkZ4?=
 =?utf-8?B?UVU0U25IYTYwOUNvTTRmOGEvT1lseHhVZ3YvRWJKSHEzNmd5R2Z3QmZGZWQ3?=
 =?utf-8?B?aDlhYWk4clNYaW1haGJMdm53TjdGMXNucDY0MXA0N0EvNDdQN242VlRpVHhJ?=
 =?utf-8?B?NW4wVDNWSVdkbTdwQ3VLbUZINHhOdE4wWXNtd3ArYkZ1Mnd2RGhDM0p3M210?=
 =?utf-8?B?QlBBQ0VPeko3c3o1NlpEcG1nYXFPZUMxZFNEUWptV2pzRkhleGNlb2ZmbFlx?=
 =?utf-8?B?OGpUNENtSW9yNEZQS0UvRFp1d1k3YW83ZzdHTURZaHQ0RkZBUEVSc2FKbThX?=
 =?utf-8?B?SXJwaFVzRENObmhpd2tyT05YZzQ5eVZobDVScGhTazBvN1ZYa2FMK0pBVkk0?=
 =?utf-8?B?SnU5Yk5YVXdIKzkyZGh1R3M1blBtc1FhRzdQazhsMDlTYUxTaE4raExua3pq?=
 =?utf-8?B?b1ltb2xvdlk1cHFac2dJVjJtSXdiZWsyZEJaQ2pPc1phWlBqUzJLUjRxU25B?=
 =?utf-8?B?bEh6QktPdGFxOWtEY0E0bk1XVnJTUDBzWThnK0F1T0NJMllzdnhKVi9hMVZz?=
 =?utf-8?B?ZnJCSUt4M3JzZDJ2YjVBekZRbHVEcFhla1dIZ1dBTDdHQzZLclhYVVhZUEt1?=
 =?utf-8?B?aE5EeTlDRStFZ1B2V2ZCSkdyaUhIaUlXRkRoMkVObXNLdm83VndxSC9Yck9E?=
 =?utf-8?B?SGNPZ0xDaFRqS3hpWDJrYWIzeHNmVUlPVXR3UU1NMTNTSXlGbmxFNjJtVS93?=
 =?utf-8?B?STJ1Uzk0d0VTT3hhaERmdjdJVElQSHFEM01YQ1pRY1R6L0lsODFGcVA2MFM3?=
 =?utf-8?B?eXNJRGN1bkhjVjd5bFRrZThlRHpJWU9mSVRSdVBnRTZEQS9LOHNQTDVHQk94?=
 =?utf-8?B?ZEFjK1cxRWpKOEtKUGNHRkh3N0lYcUVBMzJqRGEvK0RCY3pGMXJWNlJ1S2FN?=
 =?utf-8?B?NzZVdlRKMVJUcGowbnVDcnoxT2JuZnVJbzdqZCtVTzB3VFdsd0xjckJ5VEJS?=
 =?utf-8?B?UHVvSEcvNHNvdVNJckpXZWNvQk9FdXBqekppbStKVGVpcW9Bc2M2RVB4Wmlq?=
 =?utf-8?B?SDl4MGNROTVydU5ndmV2RDc1OGRPMENFODlyYW5SZlBUVUxrbTduTUpFTXRC?=
 =?utf-8?B?K0YvYSt6V0hCMU5UZHJMazBZWENDRUoyWGNXWGc3RDVMcDF6eUhhNjZlbFU1?=
 =?utf-8?B?U2lDUkF4eW9SODFLLzdaT0V3ZExWOCtqcCs1c0ptdGlZcTdvSnlvRCttMjB6?=
 =?utf-8?B?ckRrTVhSZnJmVnpFeFpzbkcvbFpzbmR1T0JwNmdpdVBNN3c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlAzcWhPNzdxb2l1aGh6SGxkelUxL08wc2FrSG4xVlI2SElLTkM3RGhRbCsx?=
 =?utf-8?B?YW9rdStERXJTQlNKN0pBckhielNIa00vdEtoUjRGQmF2L3lRd0dvbmR4ZGZJ?=
 =?utf-8?B?NXpGTUgvRXp4VnlETmk1TE9DWFFXakxjb00rUkRjVjlkZFg0YkFod1ArVy9J?=
 =?utf-8?B?VTM0UzloY1JQN3RoL1hiSithR29waS81RnRBZEJrY3FQdmd3dkwvQXdoRkU0?=
 =?utf-8?B?Kys1ZFpJVCtETnFoVHRPdnVuNkRwN2Vya20xbVB3NzIyM05UdWpleHlaNEta?=
 =?utf-8?B?d2ZYanVsaTQzdVhadWpXSkJFTDNZVHZpcTNDNWlONXFnYjNDaUNCOG1LVGw0?=
 =?utf-8?B?OEhwakM2VzJ2cStjWlUyRWM0YnRRay9GZExBcy82Z2FUblNvVXBkcXhNOGZC?=
 =?utf-8?B?dE1Ya28xYjdZSHJXMmkwZ3BuSUxyVWl3bW8rQ2N6VTluTitDR2hpc1ZkREJn?=
 =?utf-8?B?NnVqSGVPU0swVWN4b3htdGcvZ1VsYWFlbVFIelNXdHZ2ZjFYOUorUDRUUGpl?=
 =?utf-8?B?UEh1Y0tqKzRLcUQ1V3pXOXZKTHRuN0ZVVnhaS0lIZG9PTWVFaEIyWnEvMGk1?=
 =?utf-8?B?Q1JKN3NZcGNrams4U2ZDVmFQcEF2OWlodUxZam1QcFlqcmpJTHJLK0JYNEtB?=
 =?utf-8?B?VTc2YXZUMVZSRjNTaSs2YnZheGdNM1lUTmhYNlJDZ1dzVVZnT1VmV053cmYv?=
 =?utf-8?B?OGZaQ2RzWlVlYzVRWjJ5WUVRN29YWTRkM21OMHhMdnFFYkJSUXZlQnB4WVBa?=
 =?utf-8?B?cVNFa2xUNTFSQTZBVGVUdDJRNXBmYlowWTFhZ2dQaXhoQ1RaRDhOdFc0U2J1?=
 =?utf-8?B?M3A4c01rSUV1VjhtOVVBMGk0dCtsaHltUkdWMWR3c1h4R01SOVRwTjBoVkM3?=
 =?utf-8?B?YlBheU1Ba1hwcXVKaTZPaDF6MEhYRmpMTnNMWWlMeVZTSVBjVjdUU2J0dzZk?=
 =?utf-8?B?VmRXK0pxNTlONy9ic0xrWmFodTd1Wm8vZnZJTkpKMmFGaXRlckZadVdIV1NV?=
 =?utf-8?B?UDhwNDd4ZlhQZlFYMGNPcDh2M3BjNTUwRWo5UWI0c2JDdlRoNmdqa2VaQXZN?=
 =?utf-8?B?ZjhRUitaalp3bURKWDhTaWZZUmxVQ3lkOXRGOFFQVGloNXlicVZlcmxZWVN5?=
 =?utf-8?B?R2hwdGlCcGoyalozemxDaVRoRlNJRDBxOFdYQkJKa1g5R3ozL0IwdnVneENG?=
 =?utf-8?B?K3NPOStOTXVCQjB0dVpRNktHbmlWNGNSTWxEZGdabWFLSmZmbTVRa1hUZHIv?=
 =?utf-8?B?Z0VPZDFOa2RlV0F6c2x5Y0RiLzNnWjJkYjM4S05lNWhPcGFYdnpLZnBNWW1n?=
 =?utf-8?B?cmtNNjl5Z3liR1lvVWlzdnJPbUxCRElpTDVCNncwZHpsY1lsbEhKUk5FcUV3?=
 =?utf-8?B?RVByZlU3Y1VZTDYxd29CZ0xmaFBoZUtEamVqSWtJU0pMM0NvbTNOVWZkRm95?=
 =?utf-8?B?WTRkekhGL2JBUlQrV3hOMzU2ME5vTGNyUVdHdjdLM3lRSGJMNjdiUFI0dUla?=
 =?utf-8?B?UmlGMjhVSEx1TjU3QmRlSUYwOHJWNTRndkFWNHJFWFlCbUtmVGY4dlRheG85?=
 =?utf-8?B?Q1FVdGY3bkZXNitZTi9FWnhUejZhdjYra0RPZXpLMWpZVThPVUw3ODllQUNG?=
 =?utf-8?B?cm1pQnpJaksxbmxMdWpwbmN4bjl5eDdsVGdFWkpnNTRqUVU5Wm9WYk92Z0N2?=
 =?utf-8?B?cEdVSGo0a1h0dHVwakV5enREaGUrQmlsczduQklKVnIwM2dpR1pCdEwrNUt4?=
 =?utf-8?B?RmkzTllHTkxsVjRZSHVjaUNLdDRTdEI1WVlMMUF6dDA2Y3BCUUl2ZWQzTEVj?=
 =?utf-8?B?UlNVN3Z6MU91Nmd3MnJUUXBaTEhqOEM1WHEvQjgxUHVDaDhqSFZFZzRBUWxZ?=
 =?utf-8?B?MU0xT3NBZDFReUliTHZncklTQitxNVlaVEthZ3AyUlF4bkJoRlBrUVRoSHho?=
 =?utf-8?B?NmdxUTBBSFV3QTVTUDdJbXVtLzlvT003NnUxd3FYRThCZEdqdU0xS3Y3TVkw?=
 =?utf-8?B?Sy9xeGx2YU13QU54eHhsK1A2R1Zna1BhSTM5RWFCQUprRFRPYTFYOWNuTFN1?=
 =?utf-8?B?bkVkckJIdGlvZDl6QjJkVVpvOEh5WkgyWVBDRHpSakUxc2V2Z0FWcFl0bUlj?=
 =?utf-8?B?b1RrV21JbmRnVm9rKzRLK3dIdC90RnZMN0YxR1hxMmdIUHhTRlNsZ3JRMzRG?=
 =?utf-8?B?T3c9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a8deaf5-cd19-4692-0620-08dd03cbb458
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 10:12:39.7823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /OiMOghpUL9OMQJawkpIYjyziNr+0GdT5RTBLZscsRvJwVQkpT7MgQyNrY2iXcUEF/IBmPpJe2h8gda2wgj0XIvBhem3uL8+hSX10QIDWyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7739

The SIUL2 module is now represented as an mfd device. The pinctrl driver
is now an mfd_cell. Therefore, remove its compatible and adjust its
probing in order to get the necessary information from its mfd parent.

This change came as a result of upstream review in the following series:
https://lore.kernel.org/linux-gpio/a924bbb6-96ec-40be-9d82-a76b2ab73afd@oss.nxp.com/
https://lore.kernel.org/all/20240926143122.1385658-3-andrei.stefanescu@oss.nxp.com/

The SIUL2 module has multiple capabilities. It has support for reading
SoC information, pinctrl and GPIO. All of this functionality is part of
the same register space. The initial pinctrl driver treated the pinctrl
functionality as separate from the GPIO one. However, they do rely on
common registers and a long, detailed and specific register range list
would be required for pinctrl&GPIO (carving out the necessary memory
for each function). Moreover, in some cases this wouldn't be enough. For
example reading a GPIO's direction would require a read of the MSCR
register corresponding to that pin. This would not be possible in the
GPIO driver because all of the MSCR registers are referenced by the
pinctrl driver.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32.h   |   3 +-
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 143 ++++++++++++----------------
 drivers/pinctrl/nxp/pinctrl-s32g2.c |  25 +----
 3 files changed, 66 insertions(+), 105 deletions(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32.h b/drivers/pinctrl/nxp/pinctrl-s32.h
index add3c77ddfed..d52c6f814de8 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32.h
+++ b/drivers/pinctrl/nxp/pinctrl-s32.h
@@ -2,7 +2,7 @@
  *
  * S32 pinmux core definitions
  *
- * Copyright 2016-2020, 2022 NXP
+ * Copyright 2016-2020, 2022, 2024 NXP
  * Copyright (C) 2022 SUSE LLC
  * Copyright 2015-2016 Freescale Semiconductor, Inc.
  * Copyright (C) 2012 Linaro Ltd.
@@ -38,6 +38,7 @@ struct s32_pinctrl_soc_data {
 	const struct pinctrl_pin_desc *pins;
 	unsigned int npins;
 	const struct s32_pin_range *mem_pin_ranges;
+	const struct regmap **regmaps;
 	unsigned int mem_regions;
 };
 
diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index 501eb296c760..bb2f8127c2b7 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -12,6 +12,7 @@
 #include <linux/gpio/driver.h>
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/mfd/nxp-siul2.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -44,12 +45,6 @@ enum s32_write_type {
 	S32_PINCONF_OVERWRITE,
 };
 
-static struct regmap_config s32_regmap_config = {
-	.reg_bits = 32,
-	.val_bits = 32,
-	.reg_stride = 4,
-};
-
 static u32 get_pin_no(u32 pinmux)
 {
 	return (pinmux & S32_PIN_ID_MASK) >> S32_PIN_ID_SHIFT;
@@ -85,14 +80,15 @@ struct s32_pinctrl_context {
 	unsigned int *pads;
 };
 
-/*
+/**
+ * struct s32_pinctrl - private driver data
  * @dev: a pointer back to containing device
  * @pctl: a pointer to the pinctrl device structure
  * @regions: reserved memory regions with start/end pin
  * @info: structure containing information about the pin
  * @gpio_configs: Saved configurations for GPIO pins
- * @gpiop_configs_lock: lock for the `gpio_configs` list
- * @s32_pinctrl_context: Configuration saved over system sleep
+ * @gpio_configs_lock: lock for the `gpio_configs` list
+ * @saved_context: Configuration saved over system sleep
  */
 struct s32_pinctrl {
 	struct device *dev;
@@ -123,14 +119,13 @@ s32_get_region(struct pinctrl_dev *pctldev, unsigned int pin)
 	return NULL;
 }
 
-static inline int s32_check_pin(struct pinctrl_dev *pctldev,
-				unsigned int pin)
+static int s32_check_pin(struct pinctrl_dev *pctldev, unsigned int pin)
 {
 	return s32_get_region(pctldev, pin) ? 0 : -EINVAL;
 }
 
-static inline int s32_regmap_read(struct pinctrl_dev *pctldev,
-			   unsigned int pin, unsigned int *val)
+static int s32_regmap_read(struct pinctrl_dev *pctldev, unsigned int pin,
+			   unsigned int *val)
 {
 	struct s32_pinctrl_mem_region *region;
 	unsigned int offset;
@@ -145,7 +140,7 @@ static inline int s32_regmap_read(struct pinctrl_dev *pctldev,
 	return regmap_read(region->map, offset, val);
 }
 
-static inline int s32_regmap_write(struct pinctrl_dev *pctldev,
+static int s32_regmap_write(struct pinctrl_dev *pctldev,
 			    unsigned int pin,
 			    unsigned int val)
 {
@@ -163,7 +158,7 @@ static inline int s32_regmap_write(struct pinctrl_dev *pctldev,
 
 }
 
-static inline int s32_regmap_update(struct pinctrl_dev *pctldev, unsigned int pin,
+static int s32_regmap_update(struct pinctrl_dev *pctldev, unsigned int pin,
 			     unsigned int mask, unsigned int val)
 {
 	struct s32_pinctrl_mem_region *region;
@@ -236,10 +231,10 @@ static int s32_dt_group_node_to_map(struct pinctrl_dev *pctldev,
 	}
 
 	ret = pinconf_generic_parse_dt_config(np, pctldev, &cfgs, &n_cfgs);
-	if (ret) {
-		dev_err(dev, "%pOF: could not parse node property\n", np);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "%pOF: could not parse node property\n",
+				     np);
 
 	if (n_cfgs)
 		reserve++;
@@ -321,7 +316,7 @@ static int s32_pmx_set(struct pinctrl_dev *pctldev, unsigned int selector,
 	/* Check beforehand so we don't have a partial config. */
 	for (i = 0; i < grp->data.npins; i++) {
 		if (s32_check_pin(pctldev, grp->data.pins[i]) != 0) {
-			dev_err(info->dev, "invalid pin: %u in group: %u\n",
+			dev_err(info->dev, "Invalid pin: %u in group: %u\n",
 				grp->data.pins[i], group);
 			return -EINVAL;
 		}
@@ -475,8 +470,8 @@ static int s32_get_slew_regval(int arg)
 	return -EINVAL;
 }
 
-static inline void s32_pin_set_pull(enum pin_config_param param,
-				   unsigned int *mask, unsigned int *config)
+static void s32_pin_set_pull(enum pin_config_param param,
+			     unsigned int *mask, unsigned int *config)
 {
 	switch (param) {
 	case PIN_CONFIG_BIAS_DISABLE:
@@ -762,15 +757,15 @@ static int s32_pinctrl_parse_groups(struct device_node *np,
 	grp->data.name = np->name;
 
 	npins = of_property_count_elems_of_size(np, "pinmux", sizeof(u32));
-	if (npins < 0) {
-		dev_err(dev, "Failed to read 'pinmux' property in node %s.\n",
-			grp->data.name);
-		return -EINVAL;
-	}
-	if (!npins) {
-		dev_err(dev, "The group %s has no pins.\n", grp->data.name);
-		return -EINVAL;
-	}
+	if (npins < 0)
+		return dev_err_probe(dev, -EINVAL,
+				     "Failed to read 'pinmux' in node %s\n",
+				     grp->data.name);
+
+	if (!npins)
+		return dev_err_probe(dev, -EINVAL,
+				     "The group %s has no pins\n",
+				     grp->data.name);
 
 	grp->data.npins = npins;
 
@@ -811,11 +806,9 @@ static int s32_pinctrl_parse_functions(struct device_node *np,
 	/* Initialise function */
 	func->name = np->name;
 	func->ngroups = of_get_child_count(np);
-	if (func->ngroups == 0) {
-		dev_err(info->dev, "no groups defined in %pOF\n", np);
-		return -EINVAL;
-	}
-
+	if (func->ngroups == 0)
+		return dev_err_probe(info->dev, -EINVAL,
+				     "No groups defined in %pOF\n", np);
 	groups = devm_kcalloc(info->dev, func->ngroups,
 				    sizeof(*func->groups), GFP_KERNEL);
 	if (!groups)
@@ -838,57 +831,42 @@ static int s32_pinctrl_parse_functions(struct device_node *np,
 static int s32_pinctrl_probe_dt(struct platform_device *pdev,
 				struct s32_pinctrl *ipctl)
 {
+	struct nxp_siul2_mfd *mfd = dev_get_drvdata(pdev->dev.parent);
 	struct s32_pinctrl_soc_info *info = ipctl->info;
-	struct device_node *np = pdev->dev.of_node;
-	struct resource *res;
-	struct regmap *map;
-	void __iomem *base;
-	unsigned int mem_regions = info->soc_data->mem_regions;
+	unsigned int mem_regions;
+	struct device_node *np;
+	u32 nfuncs = 0, i = 0, j;
+	u8 regmap_type;
 	int ret;
-	u32 nfuncs = 0;
-	u32 i = 0;
 
+	np = pdev->dev.parent->of_node;
 	if (!np)
 		return -ENODEV;
 
-	if (mem_regions == 0 || mem_regions >= 10000) {
-		dev_err(&pdev->dev, "mem_regions is invalid: %u\n", mem_regions);
-		return -EINVAL;
-	}
+	/* one MSCR and one IMCR region per SIUL2 module */
+	mem_regions =  info->soc_data->mem_regions;
+	if (mem_regions != mfd->num_siul2 * 2)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "Mem_regions is invalid: %u\n",
+				     mem_regions);
 
 	ipctl->regions = devm_kcalloc(&pdev->dev, mem_regions,
 				      sizeof(*ipctl->regions), GFP_KERNEL);
 	if (!ipctl->regions)
 		return -ENOMEM;
 
+	/* Order is MSCR regions first, then IMCR ones */
 	for (i = 0; i < mem_regions; i++) {
-		base = devm_platform_get_and_ioremap_resource(pdev, i, &res);
-		if (IS_ERR(base))
-			return PTR_ERR(base);
-
-		snprintf(ipctl->regions[i].name,
-			 sizeof(ipctl->regions[i].name), "map%u", i);
-
-		s32_regmap_config.name = ipctl->regions[i].name;
-		s32_regmap_config.max_register = resource_size(res) -
-						 s32_regmap_config.reg_stride;
-
-		map = devm_regmap_init_mmio(&pdev->dev, base,
-						&s32_regmap_config);
-		if (IS_ERR(map)) {
-			dev_err(&pdev->dev, "Failed to init regmap[%u]\n", i);
-			return PTR_ERR(map);
-		}
-
-		ipctl->regions[i].map = map;
+		regmap_type = i < mem_regions / 2 ? SIUL2_MSCR : SIUL2_IMCR;
+		j = i % mfd->num_siul2;
+		ipctl->regions[i].map = mfd->siul2[j].regmaps[regmap_type];
 		ipctl->regions[i].pin_range = &info->soc_data->mem_pin_ranges[i];
 	}
 
 	nfuncs = of_get_child_count(np);
-	if (nfuncs <= 0) {
-		dev_err(&pdev->dev, "no functions defined\n");
-		return -EINVAL;
-	}
+	if (nfuncs <= 0)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "No functions defined\n");
 
 	info->nfunctions = nfuncs;
 	info->functions = devm_kcalloc(&pdev->dev, nfuncs,
@@ -918,18 +896,17 @@ static int s32_pinctrl_probe_dt(struct platform_device *pdev,
 int s32_pinctrl_probe(struct platform_device *pdev,
 		      const struct s32_pinctrl_soc_data *soc_data)
 {
-	struct s32_pinctrl *ipctl;
-	int ret;
-	struct pinctrl_desc *s32_pinctrl_desc;
-	struct s32_pinctrl_soc_info *info;
 #ifdef CONFIG_PM_SLEEP
 	struct s32_pinctrl_context *saved_context;
 #endif
+	struct pinctrl_desc *s32_pinctrl_desc;
+	struct s32_pinctrl_soc_info *info;
+	struct s32_pinctrl *ipctl;
+	int ret;
 
-	if (!soc_data || !soc_data->pins || !soc_data->npins) {
-		dev_err(&pdev->dev, "wrong pinctrl info\n");
-		return -EINVAL;
-	}
+	if (!soc_data || !soc_data->pins || !soc_data->npins)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "Wrong pinctrl info\n");
 
 	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
 	if (!info)
@@ -964,17 +941,15 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 	s32_pinctrl_desc->owner = THIS_MODULE;
 
 	ret = s32_pinctrl_probe_dt(pdev, ipctl);
-	if (ret) {
-		dev_err(&pdev->dev, "fail to probe dt properties\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to probe dt properties\n");
 
 	ipctl->pctl = devm_pinctrl_register(&pdev->dev, s32_pinctrl_desc,
 					    ipctl);
 	if (IS_ERR(ipctl->pctl))
 		return dev_err_probe(&pdev->dev, PTR_ERR(ipctl->pctl),
-				     "could not register s32 pinctrl driver\n");
-
+				     "Could not register s32 pinctrl driver\n");
 #ifdef CONFIG_PM_SLEEP
 	saved_context = &ipctl->saved_context;
 	saved_context->pads =
diff --git a/drivers/pinctrl/nxp/pinctrl-s32g2.c b/drivers/pinctrl/nxp/pinctrl-s32g2.c
index 440ff1879424..27669991c339 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32g2.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32g2.c
@@ -3,13 +3,14 @@
  * NXP S32G pinctrl driver
  *
  * Copyright 2015-2016 Freescale Semiconductor, Inc.
- * Copyright 2017-2018, 2020-2022 NXP
+ * Copyright 2017-2018, 2020-2022, 2024 NXP
  * Copyright (C) 2022 SUSE LLC
  */
 
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/mfd/nxp-siul2.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -713,12 +714,10 @@ static const struct pinctrl_pin_desc s32_pinctrl_pads_siul2[] = {
 static const struct s32_pin_range s32_pin_ranges_siul2[] = {
 	/* MSCR pin ID ranges */
 	S32_PIN_RANGE(0, 101),
-	S32_PIN_RANGE(112, 122),
-	S32_PIN_RANGE(144, 190),
+	S32_PIN_RANGE(112, 190),
 	/* IMCR pin ID ranges */
 	S32_PIN_RANGE(512, 595),
-	S32_PIN_RANGE(631, 909),
-	S32_PIN_RANGE(942, 1007),
+	S32_PIN_RANGE(631, 1007),
 };
 
 static const struct s32_pinctrl_soc_data s32_pinctrl_data = {
@@ -728,22 +727,9 @@ static const struct s32_pinctrl_soc_data s32_pinctrl_data = {
 	.mem_regions = ARRAY_SIZE(s32_pin_ranges_siul2),
 };
 
-static const struct of_device_id s32_pinctrl_of_match[] = {
-	{
-		.compatible = "nxp,s32g2-siul2-pinctrl",
-		.data = &s32_pinctrl_data,
-	},
-	{ /* sentinel */ }
-};
-MODULE_DEVICE_TABLE(of, s32_pinctrl_of_match);
-
 static int s32g_pinctrl_probe(struct platform_device *pdev)
 {
-	const struct s32_pinctrl_soc_data *soc_data;
-
-	soc_data = of_device_get_match_data(&pdev->dev);
-
-	return s32_pinctrl_probe(pdev, soc_data);
+	return s32_pinctrl_probe(pdev, &s32_pinctrl_data);
 }
 
 static const struct dev_pm_ops s32g_pinctrl_pm_ops = {
@@ -753,7 +739,6 @@ static const struct dev_pm_ops s32g_pinctrl_pm_ops = {
 static struct platform_driver s32g_pinctrl_driver = {
 	.driver = {
 		.name = "s32g-siul2-pinctrl",
-		.of_match_table = s32_pinctrl_of_match,
 		.pm = pm_sleep_ptr(&s32g_pinctrl_pm_ops),
 		.suppress_bind_attrs = true,
 	},
-- 
2.45.2


