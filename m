Return-Path: <linux-gpio+bounces-31963-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aElVA8VymGkoIgMAu9opvQ
	(envelope-from <linux-gpio+bounces-31963-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 15:42:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 68861168797
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 15:42:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7547A30C34A5
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 14:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7DC427603C;
	Fri, 20 Feb 2026 14:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="THpkUIs0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013058.outbound.protection.outlook.com [40.107.162.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1680825A33F;
	Fri, 20 Feb 2026 14:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771598210; cv=fail; b=bAg8CSxi0bLtFceiDsWjHJGlqV5vRYxUiN+8+FwM88dYmJTCktHmrTmhGE2sxrZ2VWJWEnr8QVaNzZaulkASZqV0zPzmpaQl3B71SUdaGf4knUsPLX2JkDnA9y8z4wG/T3mjB6LXCteWNjiteMh9wNRZzhE5xoMbmIDBpbMWbQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771598210; c=relaxed/simple;
	bh=gSWb91XoYGfO6ojxQRjqvmKlnsHUn7rvkuyF0RH7kas=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BArEqr+23owI6+8iMjk1prUWbDHplXd68NezawzKpZ97eAP033Pf+EjhBA9MzbY4qS0QKydy0ebZtmoHt6sY7Zng7tXf5uc2ViJbmwziXPLMVJdQ/L+Mn3SgxgH3zhvTzLbifJlFyRgra2AIC06QdA5+Peoj8KgHl7kiz66nQm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=THpkUIs0; arc=fail smtp.client-ip=40.107.162.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G+o0ayvneGd+DTgRebCuv4w9MJIzCucqSoPZrCg6TE8LK44TO4snjJDqt3z7gl3776Nctc0caop0qgh9djhlMhmhiZ5V4JDZVYUY+Ux+MKmyCr4+BZk0zqw34kHoAfDB1i5i+CPjIGakthSDeevljY7mkwJEsjLj/I3rY/iNcXSeBTv5bTd27KSvQm4H/gEqz3V9UWqHA4Nr1pfCgF8dJtQsvoPJGc4hpJbDZcXUn6OT20tHb3Wpn48tHMP25slQpZAgbBrLBjCFXs9L02PxjSWFaPO3b1YipNusTPcd+bN4cNp4JZm/4EDGa5jQd/e6G0AqQTsA+prFNNR0jM7Xkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sqSSu9VspaIKA3MH/S/iuSmrsLYYefMmKqoO/KNWTWA=;
 b=X5Ckv87fIoWSMeFVD7joRSIcz+S7WK5uzCBCnvQowStj3O8orpYfPIlZbka6ZqFa72R6lTvCGyW/2rbIV5IyZ4PXYsHAXBY0MQCuia0AillfPv3qtMhv/LQAicTi5rSWJUOxPdhL66GJbB2hE+zl2TMTxq2U+pqmMu+F1FquIu5VrenJK6L6bVVkRxha9rXiRlYw0C4/SkYQcFbh9z2xRF3xuyWSNrPGsNFFmQbalbtoaPracgFMZN5cBhBu8mniM+6EFYP6rWX0msVHkBF4tEyFwHkN++EMSkT/1xfhHm0DV5S4SJqhVrM8Wm8me6EpTLwsUFzDEYomkRuRkmgjBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sqSSu9VspaIKA3MH/S/iuSmrsLYYefMmKqoO/KNWTWA=;
 b=THpkUIs0vjDn3W/fmH6sMjSNfBvRATrEXI2HMZOu1l4ZrSlKjsHLMg3mfToSj2ZRELrZ8ywo7HLWYO179u4oILwvwBgR4CoiylIh1x8sLDf1xYxDTIpjBlQmGAxcgg1R++kblaKb/NucxUZj8f6v5YY8qnydOjPqCoUSY0qwob7+v36Bnwqe2s55dHRlAlGUYwh4fjpJMAtPPHItAQ5zwTDaXGWSmX3oHPcZCeXQ3sc9oREE0QspyyXo/oYBsyINWVKP8ZDzptmYuZ/kuhJw54xmR8MAGcy0MEHHsbEUtAaonV/3YG7ylqUOrhZX5BpWQRp1V37knFgndVtSTsrUCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8190.eurprd04.prod.outlook.com (2603:10a6:102:1bf::23)
 by GV1PR04MB10478.eurprd04.prod.outlook.com (2603:10a6:150:1d2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 14:36:42 +0000
Received: from PAXPR04MB8190.eurprd04.prod.outlook.com
 ([fe80::4608:7dcb:899b:e4a1]) by PAXPR04MB8190.eurprd04.prod.outlook.com
 ([fe80::4608:7dcb:899b:e4a1%4]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 14:36:42 +0000
Message-ID: <7d200097-51bc-4404-be8b-f536d0ecfc25@oss.nxp.com>
Date: Fri, 20 Feb 2026 16:36:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/10] dt-bindings: mfd: add support for the NXP SIUL2
 module
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>, Lee Jones <lee@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>,
 Jacky Bai <ping.bai@nxp.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>,
 devicetree@vger.kernel.org, Enric Balletbo <eballetb@redhat.com>,
 Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "Vincent Guittot devicetree @ vger . kernel . org"
 <vincent.guittot@linaro.org>
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260120115923.3463866-2-khristineandreea.barbulescu@oss.nxp.com>
 <20260121021913.GA1704619-robh@kernel.org>
 <e956750b-0333-4465-b37e-5f460b5e092f@oss.nxp.com>
 <edc3a63a-8117-476f-9582-97ae31fefa96@kernel.org>
Content-Language: en-US
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <edc3a63a-8117-476f-9582-97ae31fefa96@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0189.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::26) To PAXPR04MB8190.eurprd04.prod.outlook.com
 (2603:10a6:102:1bf::23)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8190:EE_|GV1PR04MB10478:EE_
X-MS-Office365-Filtering-Correlation-Id: 83ab017b-0d8e-43a9-9939-08de708d7703
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UVdWaG9aQ0s5TVRidFVLVkxYd2N2SS93QlpKN3RoUDZVQkU0aldybG9FODcw?=
 =?utf-8?B?OXlEWG13cWdZSXh1bitNYmhvYks0aGlDaFFtQ0tRSHB4dFNmdXJmK3kyUjBE?=
 =?utf-8?B?bGlqZGd0Rkx2VmFZV3N5cXh4WXArNVgxNEVvV0tjTE5BNlBCUk1nR0toZy92?=
 =?utf-8?B?UzBhMS9mVk9nbmdod3NYK25TNEdSb1dWSTRYNVE0QXpwaitvcDJWbmQ2K24r?=
 =?utf-8?B?K2t1b0RPTE5QUDFBblJSdlY4M0R2ZndFRHAwbW83N2FkUjVzY291K1VmZnV3?=
 =?utf-8?B?VFdYNEEyb0wwVmk5MnBnNXVLSlhidXlsdjR6cy9zeUxzeHlrR0FReUVOVERp?=
 =?utf-8?B?eEIyNGlQUHJUc2txSis3MG5qQWl5dStwQ2dUR0p1SEhBMGErUmtLS0Q0TTdI?=
 =?utf-8?B?Q3gyMmRwMEc2eGRtWDNMS2F2dGR0QklvV2g4S29vYWIzSTl6ZllwQlhEOXZa?=
 =?utf-8?B?Q3lldll4azhCZ2lQR0xQZzA3UmdiaUdESDRYMWluMUlkc1dIcG5xem1jSjBK?=
 =?utf-8?B?RFVCYklwbm90ZE9qOXMvb2dDNXd2S0xOM3JrbFR4aElaa2JxQ0M2NU1YL2Z0?=
 =?utf-8?B?SFY4dU1melRmTTJjVTFERERWeXBNeURBM2VZL2ZNdm5Hd2JoOE9rU1E3UjY3?=
 =?utf-8?B?bW9qNkRoOHhKeXBnN0NLQXhiVnVORlFQTTY3Z2VmbEFQSEtFSUY3bVBHck8w?=
 =?utf-8?B?OHZ0NjFLL2ZNL2J4bkwrMDU0dXRqZ3F3eU41L282S0xQQU1wNC82dEFSM0Q5?=
 =?utf-8?B?aFRZVWdkUGpmTU5rQ2Jqb2ZiMUFsRWs1Wkh5VEJiZVl2Qjh3dnJZbWFoWFZ0?=
 =?utf-8?B?Q3gxbEplNklzbGl1T0k5V3B6NWlQVXFmaSt5SEUrNU1nOW9jMWNqM2h2MlZB?=
 =?utf-8?B?QmZkQ1Zqa2xZWU1xQW52cXpta0ZiNmtSck9NT0VrRDdTbkJMQnFJeXRTKzdi?=
 =?utf-8?B?NUwra3hmbGZ2SnA3NU9RSWFxQzlwYThNcXFWQ1VjTERnNFZNdkdSTWt3LzFa?=
 =?utf-8?B?TEJPRTNiaU1MekJmNHpwUk8yTXR6aWZMZ01kWFE2bUZ5ZjBFWFY3d0NVSHU0?=
 =?utf-8?B?TmtlU0tGTzVtSWhwMDRaelpYQ2NxZ2hBOElZRmFGVExONENZdUFKbHlEallu?=
 =?utf-8?B?TSttWEppcnVjZ3c2THZuYnE4eDZmck9Xa3pFMnFQUVc5K1c1Y21YdUZ0MHJK?=
 =?utf-8?B?K1pza2FXZEVVeEJKVnY3UHRQWGZPNGRaalY5bTdHK0trVnRMbDFuVlFsTXVY?=
 =?utf-8?B?dzV0MUZWYWFsR3lEaTFoQk1EYTlJeFZqS3A2T2Nhck0vcHdZRndveDJZUVJk?=
 =?utf-8?B?OUVnWFhjY2RpSnRQb09wZHFmbFZVUEJudkp3bXJyd3ltVGxjSWVLSE9lL0Nw?=
 =?utf-8?B?cVZsLzNjNUVDa0d0WC8zMmtBTVlybE5EK05KQmE2b1NzSXBUa0VXV20rQWdI?=
 =?utf-8?B?RVVuaGdqM2gvR3VCSDZyaXdhOXlXeEtYdG5IOUFBZ0xqRU9nUlFHbkdMb2V2?=
 =?utf-8?B?cjQ1aTNrd2crLy9jUTBqUjBYQ0UySlhGMGptekg5M284a0pHTU00bk01enFa?=
 =?utf-8?B?a3JhRWtYWmQ2RkNWME9MK2FuQWlRWmNrd2dnTnpPcmppV2ptS3lyTk9rRmpS?=
 =?utf-8?B?b0ZSYitlNUszRm84dkE5VlNhRWxwZEZNaFVmMGJCTlRrTXpFWE4wcXpTUnJD?=
 =?utf-8?B?WkZvWnhiK3p0QjNVdzlXRnBmck9aa2NLd042RVRjeHpXNUl1YlQxMTkxMVpt?=
 =?utf-8?B?WjhVT2xabTE2Q2NLMjl2RVNMNTJrOEJCZFlRWlJCY0l0ekhRWCs3YVBwaE9T?=
 =?utf-8?B?SEJsZHpTM0dCWDJ1eTNCeThxaXpzRWNybTNMNnREVmlkenhLeDZpNlAxcjZI?=
 =?utf-8?B?Ky85aTQveURyb2F0akJDQzZSWllTeGE4bjZ5ZDBmMUxJR0Z5UzF6a0N5THpE?=
 =?utf-8?B?SkNyQ2FmZytWRzBJcmZYWU9oc0swajZsRVAzY2d4endFYW43OWpuUnR5bURi?=
 =?utf-8?B?MjA2dTlpOEM4VjIzaWZZRDhOd1VZc2QwUFJjeWZldXgvRlNSSERBbEwwSWxZ?=
 =?utf-8?B?b0VQeG4rTlF2MUkrR3RKRjVjNWRQbHpibkEwUHZoK2FaaGtyMTg4a2cyZEVt?=
 =?utf-8?Q?iggc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8190.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlZYMXZuSmNaRXJQVStSOVlZT0w3S0ZJL2djczM3aVg2QWsxd1FoQ1Jma3FQ?=
 =?utf-8?B?d1ROMlMrRXdLS3NWekU0Sy9oN0h4UGlrb05vRzlick1kK0VncjgrYnFyQ3Vl?=
 =?utf-8?B?VU5pZGxnYWQ3SGhYckRVRGY1YjJZdWhaeHV1c044QmJubmlGMFp5cWQvQjVD?=
 =?utf-8?B?dGNsamtSNVVic2pZeGh3ZTMrWHlDdkt1R2ZGS2ZOVmtWK01NNldJY0FxaGpM?=
 =?utf-8?B?L2Y1ckVJTysxckwySkR2TEFOWit2MmNzcVhjSFJCOUYydWFMZ1VOZzk0ZjJD?=
 =?utf-8?B?U05HRFdmbTk2ZmwxaFNoTEV2dWIxcXZDUUpCL2h0YTE3WEZjL3dEMk53WHBX?=
 =?utf-8?B?YkZyVTZLR1ZHaGhralNVOU5JdXA4WWJFUFlmYXBLRmx5STFHN0NOY283QWs3?=
 =?utf-8?B?Ri9QQ3NkUi9XdkJOMUFmNEZ6dmRmNDZ3TVhudStVa2tZK3pKZGZFb2ZiVnlP?=
 =?utf-8?B?RVp1bFlsTm02WXkxUWpNYU1JS3lockJWbGlZT3N0QTk1b2tzOVVSRzA5NTA3?=
 =?utf-8?B?YStsaTBReUpRMmlQUXpQZXhMWEI4NGxWaVpYRGxlQ3FqcU1BRWRZV3ZqRmRX?=
 =?utf-8?B?MVExTTRtU1VScFVRS2tJUElqY3Fva1R1RFErTk5Ud3hzdjQ3cjFsaVdhRU5G?=
 =?utf-8?B?TmlEMEhCL0RnKzduZUx4cWxSVWpHbDZ4VGNYbkFOVG4vM0Y0eXJRSmxjNXAw?=
 =?utf-8?B?RTFlZHZYaGNIOVNzQ1FXMWphdGdVT2c3SHZ5cU1ycklWdDFNVTU4R0NWQUJQ?=
 =?utf-8?B?ZUNzREFxV29sTFlsbHpvTzhYSU84Vk14S1lNcTZPNzFVbCs4cE1sVkNTb0ND?=
 =?utf-8?B?Y3J4L1licWxNM2x3R05HOUpLSXh1dHExd0tnekZGZUhZdkE2S3IzMUZxSnQ2?=
 =?utf-8?B?NGFFdS9VcjRYeitFb2wwL3FNSG9lOTZIUmpVSlFJczRKZm9ZejZlQU5XZFdR?=
 =?utf-8?B?V0dEMmVONHJTcmJJTzRCRlNnMW9uT1J0M3M1cnorVnpFYW1aVU5OSGFrTGwv?=
 =?utf-8?B?Unc3UnlxeWErbEt1WTN4Y0N1UzFoS0o1eXQzNGdKcnpLOGJ6UjdIUlJCbXJt?=
 =?utf-8?B?S0NxT2tUQVl2Vzl6Z1Z5VnBZYXNiOUpNdEoydHMrL1pMSjdXS014elRzQkRk?=
 =?utf-8?B?UFpEVXg0WDE1Y3BuZnFGUjMzVThCYlQ5eUpMcHdLSUdHNkNUTkhMMkRMNkxv?=
 =?utf-8?B?aWlubmttWkhpVmFKZjhUd0Nqb0FIdk5nMnMwMWsvVWhkbVN2T3RMc2FCZ3ZB?=
 =?utf-8?B?OTRtVnFrRFlrSWFXcGZoN2xPR3hKbHZ4QXVMbzVHR2Fzb244eFhGOUk3QmRh?=
 =?utf-8?B?TFdpMHZUWTlsMjJSeUJzNjNmNzBSNlBVY2R3VjRjaThmdE9pU25WUTBzV1FO?=
 =?utf-8?B?Nk9scHRVY1VTUW1USXVjckNtcTlNendqcUNKY3o5NnZiV3FSSGl0bjkrcXk3?=
 =?utf-8?B?ejN4QTQ5KzlucWZlUExsR1liaFY1VnRGWTlsdVBha0hkTkJHQ0ZNNVEwRE0z?=
 =?utf-8?B?RjM0cC9RNDFRNmtnQmVjaHp0R3I0WWlSYWtWUnczUGxNWE8zb28zb1J2aU8v?=
 =?utf-8?B?OXNZT3FEaTZIenJJVTBHNjAvTkNNbi9qR2V4OTdTQ2tENk9wN3JlMXNoaDVt?=
 =?utf-8?B?dmpmTEpOT0VtQk0zYzBjc05Td2MvVzNPMUpuZUp4aUhXVTNsZHczQk10QURa?=
 =?utf-8?B?ZktFenByNUc4VXhIYU41TTJpOFE2ek80TGg5Z0VPWFlXNjZnWjRFUjVuSnIr?=
 =?utf-8?B?U1dOWTdCbWVDaUdNVTVZTHhxMUdqWXZyOUF6K01GYXNNbW10NS9EMVpiU0Q1?=
 =?utf-8?B?U3dvekt3L2JqeUpOb1BtRG9mQ0RlT1Y0Y1NvazVPU0VXbWU3dDR1T0ZUOFp0?=
 =?utf-8?B?cmltb0tyc2hMUDdGSTEyTVU3ZjUvMVhYMEg0V2Z6SVBDRGdVRTFLa0xUSlJT?=
 =?utf-8?B?bFpibE5vTFU5dTgwQU5sRkVTNTlSbE5Sc3Q4dXZacTdYUysrUlhrKzhjeDlx?=
 =?utf-8?B?bkkzeU43UEwzMHEwU2YwRXhGb2Z3ZlV4TFFKSWVDN0FPcC9QOENtSFdwSnZn?=
 =?utf-8?B?eEsrZFVOeWF6aFM5c1FPRldlemJOYzU0MlFNWVRxUGNCVktHUjJhWURmdnZV?=
 =?utf-8?B?akhXLzVzU1JXMm9IeHR3cWpUbDJjY1lTRG5NUXZTL0x4Y0JaMXk2WDZraS95?=
 =?utf-8?B?RVBiOGRQOWpUMklPZnk5Q24zTStEb2ZMdnJ6blpTVEs3WVlyVHkyL1pXOUt3?=
 =?utf-8?B?QzNBeWtoempvWDN3VkM1ZnAxWVhFalZrckp1Z2Nqc3NIWmN4d0lrblBDSnhr?=
 =?utf-8?B?c0R3VlY4cUFTNVRnZUhyWTl1YVhMMDhPUXpkSW4vRXBLTWx6dzJOdTg0ODZO?=
 =?utf-8?Q?a/3Jwa2CX1VLWCX0BOumgRrUToCERE+XluNvM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83ab017b-0d8e-43a9-9939-08de708d7703
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8190.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 14:36:42.4389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lSc4iUU9Jx8A4/s0mZvfKi7Zj/5iL/w/mh1qlGKHdd9VKaVZNqPlSDYdwHYvEdBb7rO30cYiqPn53pvdBauCCjOg+Ntf00LhncSr+XNzZZmA+FsFTMG7nJhMuEjJ2cli
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10478
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
	TAGGED_FROM(0.00)[bounces-31963-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FREEMAIL_CC(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org,redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	REDIRECTOR_URL(0.00)[aka.ms];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,nxp.com:email,2.159.138.16:email,aka.ms:url,4009c000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.nxp.com:mid]
X-Rspamd-Queue-Id: 68861168797
X-Rspamd-Action: no action

Hello Krzysztof,

On 2/20/2026 12:16 PM, Krzysztof Kozlowski wrote:
> [You don't often get email from krzk@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> On 19/02/2026 12:36, Khristine Andreea Barbulescu wrote:
>>>
>>>> +      reg:
>>>> +        maxItems: 1
>>>
>>> You have 'reg' so the node name should have unit-address.
>>>
>>> However, there's not any real DT resources in this child node, so you
>>> should just drop it.
>>>
>>
>> For context, SIUL2 exposes a set of platform‑capability and SoC identification registers that are split across the two discontiguous ranges: SIUL2-0 and SIUL2-1. These registers are the source of SoC information (e.g. identification and capability flags) that other subsystems are expected to consume (e.g. PCI Express). Because those fields are physically divided between the two SIUL2 ranges, consumers need reliable access to both ranges to correctly discover and configure the platform.
>>
>> Hence, my proposal is to keep the two 'syscon' child nodes.
> 
> Please wrap your replies correctly, so this will be easily parseable.
> 
> I do not understand the reasoning. If you have two register ranges, you
> have two <reg> entries and having a child node has nothing to do with it.
> 

I’ve reorganized the SIUL2 node with two syscon subnodes for the two
register regions used to read system info, and a separate
pinctrl/GPIO child (as discussed in the v8 06/10 thread [0]). The parent
SIUL2 node now carries the bus addressing and ranges:
 
    siul2: siul2@4009c000 {
        compatible = "nxp,s32g3-siul2", "nxp,s32g2-siul2";
        #address-cells = <1>;
        #size-cells = <1>;
        ranges = <0x4009c000 0x4009c000 0x179c>,
		 <0x44010000 0x44010000 0x17b0>;
 
        siul20: siul20@4009c000 {
            compatible = "nxp,s32g-siul2-syscfg", "syscon";
            reg = <0x4009c000 0x179c>;
        };
 
        siul21: siul21@44010000 {
            compatible = "nxp,s32g-siul2-syscfg", "syscon";
            reg = <0x44010000 0x17b0>;
        };
 
        pinctrl: pinctrl {
            compatible = "nxp,s32g-siul2-pinctrl";
            #gpio-cells = <2>;
            gpio-controller;
            gpio-ranges = <&pinctrl 0 0 102>, <&pinctrl 112 112 79>;
            interrupt-controller;
            #interrupt-cells = <2>;
            interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
 
            jtag_pins: jtag-pins {
                jtag-grp0 {
                    pinmux = <0x0>;
                    input-enable;
                    bias-pull-up;
                    slew-rate = <166>;
                };
            };
        };
    };
 
Could you please confirm this matches the intent of your feedback, or let me
know if I misunderstood any part? If this looks correct, I’ll move ahead
with the new patch set.

>>
>>>> +    required:
>>>> +      - compatible
>>>> +      - reg
>>>> +
>>>> +  "-hog(-[0-9]+)?$":
>>>> +    required:
>>>> +      - gpio-hog
>>>> +
>>>> +  "-pins$":
>>>> +    type: object
>>>> +    additionalProperties: false
>>>> +
>>>> +    patternProperties:
>>>> +      "-grp[0-9]$":
>>>> +        type: object
>>>> +        allOf:
>>>> +          - $ref: /schemas/pinctrl/pinmux-node.yaml#
>>>> +          - $ref: /schemas/pinctrl/pincfg-node.yaml#
>>>> +        description:
>>>> +          Pinctrl node's client devices specify pin muxes using subnodes,
>>>> +          which in turn use the standard properties below.
>>>> +
>>>> +        properties:
>>>> +          pinmux:
>>>> +            description: |
>>>> +              An integer array for representing pinmux configurations of
>>>> +              a device. Each integer consists of a PIN_ID and a 4-bit
>>>> +              selected signal source(SSS) as IOMUX setting, which is
>>>> +              calculated as: pinmux = (PIN_ID << 4 | SSS)
>>>> +
>>>> +          slew-rate:
>>>> +            description: Supported slew rate based on Fmax values (MHz)
>>>> +            enum: [83, 133, 150, 166, 208]
>>>> +        required:
>>>> +          - pinmux
>>>> +
>>>> +        unevaluatedProperties: false
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - gpio-controller
>>>> +  - "#gpio-cells"
>>>> +  - gpio-ranges
>>>> +  - interrupts
>>>> +  - interrupt-controller
>>>> +  - "#interrupt-cells"
>>>> +  - "#address-cells"
>>>> +  - "#size-cells"
>>>> +  - ranges
>>>> +
>>>> +additionalProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>>> +
>>>> +    pinctrl@4009c000 {
>>>> +      compatible = "nxp,s32g2-siul2";
>>>> +      gpio-controller;
>>>> +      #gpio-cells = <2>;
>>>> +      gpio-ranges = <&siul2 0 0 102>, <&siul2 112 112 79>;
>>>> +      interrupt-controller;
>>>> +      #interrupt-cells = <2>;
>>>> +      interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
>>>> +      #address-cells = <1>;
>>>> +      #size-cells = <1>;
>>>> +      ranges;
>>>> +
>>>> +      siul2_0: siul2_0@4009c000 {
>>>> +        compatible = "syscon";
>>>> +        reg = <0x0 0x4009c000 0x0 0x179c>;
>>>> +      };
>>>> +
>>>> +      siul2_1: siul2_1@44010000 {
>>>> +        compatible = "syscon";
>>>> +        reg = <0x0 0x44010000 0x0 0x17b0>;
>>>> +      };
>>>> +
>>>> +      jtag-pins {
>>>> +        jtag-grp0 {
>>>> +          pinmux = <0x0>;
>>>> +          input-enable;
>>>> +          bias-pull-up;
>>>> +          slew-rate = <166>;
>>>> +        };
>>>> +      };
>>>> +    };
>>>> +...
>>>> diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
>>>> index a24286e4def6..332397a21394 100644
>>>> --- a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
>>>> +++ b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
>>>> @@ -11,6 +11,8 @@ maintainers:
>>>>    - Ghennadi Procopciuc <Ghennadi.Procopciuc@oss.nxp.com>
>>>>    - Chester Lin <chester62515@gmail.com>
>>>>
>>>> +deprecated: true
>>>> +
>>>
>>> I don't really see why you can't just extend this binding with GPIO and
>>> interrupt provider properties.
>>
>> The existing SIUL2 pinctrl binding only describes the MSCR/IMCR registers and treats SIUL2 as a standalone pinctrl block. This is incomplete and does not correctly represent the SIUL2 hardware, which also provides GPIO control, interrupt configuration, and MIDR identification registers across two register windows. Extending the old binding would require incompatible ABI changes and would result in carved-out subregions, which is discouraged.
> 
> Can you just add missing register ranges to existing device? I really do
> not see how this is incompatible ABI or how does it result in carved-out
> regions.
> 

I’m also fine with your proposal to add the missing register ranges to
the existing device. But that would also mean extending it with the
GPIO registers and two syscon subnodes for system info, as they all need
to be provided by this SIUL2 device. This would effectively make the
existing pinctrl binding an MFD.

Is evolving the existing binding acceptable in this manner, or should
we continue with this new MFD binding and leave the old pinctrl
binding deprecated?

> 
> Best regards,
> Krzysztof

Best regards,
Khristine

[0] https://lore.kernel.org/linux-gpio/CAKfTPtD6LOMFGhzG3dhiSQCNbYrGLjBiT83eqz9mmwaDVpNV=w@mail.gmail.com/


