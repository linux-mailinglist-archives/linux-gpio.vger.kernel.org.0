Return-Path: <linux-gpio+bounces-8779-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C94DC955C76
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Aug 2024 14:48:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74191B2108C
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Aug 2024 12:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0CA940BF2;
	Sun, 18 Aug 2024 12:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=genexis.eu header.i=@genexis.eu header.b="ejchrgz8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2100.outbound.protection.outlook.com [40.107.22.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485AB5C8EF;
	Sun, 18 Aug 2024 12:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723985295; cv=fail; b=XTQ8/htGcdpujxK9syoGaMGjcogKAp626oLkBKUzTnOYDwhN4mxhfDVzixz0O5faZgnREw4TC1+IDGTikXGDesSzKQ4FtJ5WSMyS4M5wSIrIwybSxHEHeVoVZcTx3YB4keriFhi2nyEtRJaW3GSq5nCusvvMGStSDl6Bpw5xUvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723985295; c=relaxed/simple;
	bh=hKyIdUzoFklUfDxYoQ6E+vd8VFGFB4KoMIIHn2KPCMY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=k1FK3olQLE3O8qKzTOriNXTp7wNaRzCtgauxvEXhPY1ffRbpw1KGr04vRMEjv0lcf4ZU4/CIySFoMdkvK8v3f5pg+XL2/01kraoSgFX6WaDJfiQWD2ccDvEX2hB7ZTtAq0pwFnQveWSglnIZBHySMZOXRm9AR0cgRGuQ6pJq+k0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=genexis.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (1024-bit key) header.d=genexis.eu header.i=@genexis.eu header.b=ejchrgz8; arc=fail smtp.client-ip=40.107.22.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=genexis.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t3Wdu3M+wS6jjU+w9PrSrT3to5beBkVVfRSJTpKvF65WZ/bjEYA7Xiy6pwmrzNFm8sfKVDHZIvaOBRkQv9mYzt8/dxycvtOgYeg1gVAY7Ltnx2mlMSUhxUVglTK5MkntCGhLMF0evg3Rvtl9Y1TVf05lDaAAdYsq1ebyjXCoT9quAzFYSzb7fjwFbQqA8hNC+zDo2ifDkh11YfXwNfWLoWOz5UxhtXiNU8DfyT7L65QwqWq0sBeECNQgCYNgvcwTqIBSpuoFjLUff4VJY+Ks3u0aUYD6aejQ96j4h3YIf/9j7dwIJiVcmXjm/NzwrbGFhelszwHqXRPys4ySA7E1Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g82O+L8gnOva2tEQOpho5EA+rWmUcEycjTRTTx4LduE=;
 b=vWq7Nxn+OutKI0GKSlBYptDehuHXJPXX4Puv91HdClLL7Vr6T2KL/Rtwq3JM9m/aA7GyXSdQcWmw5nNwxD2sg8TbPRUvxMKHhJKX0qvWhJaFeQi5FBAOOWj77vvxCb6O8SXlQKUz9QZ1a2mQmOhf+VKlCgyeNvJ/RAOkwN9qmrZbaHKOdIiOpE0A/0/+CS6BNTtr+LEeo5QtiQ/B28zRZwsim+v5viRDMvaYGZfoIG/zS4K5Ahlw9Dcn+TSKvLYatC4AQK42vvj4tjab9VeMdSyo93u+Imr3FioNLywWwQLuxH4rRLuMWrOd7fbqTy41N6P/2Dy4MbhIRm7yqkxT5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=genexis.eu;
 dkim=pass header.d=genexis.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=genexis.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g82O+L8gnOva2tEQOpho5EA+rWmUcEycjTRTTx4LduE=;
 b=ejchrgz84SZ56bnIvSRyIeqsYkKBamM/33wAzBcpefk+u+FIjCMEW+NnrskUt20k2C/QFoWa/mm+LyFMGTOi/YdvkoMmzu3yVGPOzOve2eoBx5kInSs4DEHB88TUKxL4oWwdh8eQipEUKFnvJaIYi8HmICrDz2LhXKldsuQtPi8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=genexis.eu;
Received: from AM9PR08MB6034.eurprd08.prod.outlook.com (2603:10a6:20b:2db::18)
 by AS8PR08MB7308.eurprd08.prod.outlook.com (2603:10a6:20b:443::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.13; Sun, 18 Aug
 2024 12:48:07 +0000
Received: from AM9PR08MB6034.eurprd08.prod.outlook.com
 ([fe80::9ead:b6bc:10eb:ef35]) by AM9PR08MB6034.eurprd08.prod.outlook.com
 ([fe80::9ead:b6bc:10eb:ef35%4]) with mapi id 15.20.7897.010; Sun, 18 Aug 2024
 12:48:07 +0000
Message-ID: <3a52e550-1bb1-40fc-b7dd-b454d7c97f97@genexis.eu>
Date: Sun, 18 Aug 2024 14:48:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
 controller
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, linux-gpio@vger.kernel.org,
 linus.walleij@linaro.org, sean.wang@kernel.org,
 linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com,
 krzk+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, upstream@airoha.com,
 angelogioacchino.delregno@collabora.com, conor+dt@kernel.org,
 ansuelsmth@gmail.com
References: <cover.1723392444.git.lorenzo@kernel.org>
 <0d537e88b64847bc4e49756b249b2efdcf489b92.1723392444.git.lorenzo@kernel.org>
 <22144671-fc7c-4cb2-8bb6-ee7d3fbfcb0e@kernel.org>
 <c8a74be4-be63-477d-9460-1d5ef5e3d84a@genexis.eu>
 <20240816225257.GA2411475-robh@kernel.org>
 <1d223ae5-cd2c-4883-b293-bb182e90222b@genexis.eu>
 <6da7acc8-f77e-453c-b2fa-4eb9161f637c@lunn.ch>
Content-Language: en-US
From: Benjamin Larsson <benjamin.larsson@genexis.eu>
In-Reply-To: <6da7acc8-f77e-453c-b2fa-4eb9161f637c@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0049.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::32) To AM9PR08MB6034.eurprd08.prod.outlook.com
 (2603:10a6:20b:2db::18)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR08MB6034:EE_|AS8PR08MB7308:EE_
X-MS-Office365-Filtering-Correlation-Id: a2251b3b-1bab-45a1-100d-08dcbf84025a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q1FkZHpnSjYxSW91WmpUZ0dHQ2QzUWJZaDVkNE94M1pmUzBZOWk2MXZkd1VT?=
 =?utf-8?B?NFdML20zbDZ0RVIxaDU2VVk4Z0FVYk1lemozMDJ1eUs2dFVCRGVnZm55bFBC?=
 =?utf-8?B?ZWEvOXJiK3NHZlJ6aXA5TDlteFc3L01rdWVUSVgwcmF3NHdGYjFTQjFtUWF4?=
 =?utf-8?B?a0lZSUprWWNwU2ltOHFxR0dlNkVxOVZqME9IdHBqMHdyUVoyM2RGSVM1eVU5?=
 =?utf-8?B?VzZ2SGwxVXh1T3ZEbnl2Z2JKdm04MnlQQkd6am5QK0Q5OXJNb2wwbk8xZDRU?=
 =?utf-8?B?Qk93aVZwK3hmWlg3YVJ6dVA2QkZRWjAzd0hmcjhldU5PZ0lrTldyQ0VhSmFa?=
 =?utf-8?B?dnRBZHUwK0t1NmNKT1lId2FwSVdZT0dMT2V2ODE0VnRsL010Nkp2ZFlPUkNZ?=
 =?utf-8?B?QTIrb09SRUVNdmQrUXUrRmFHRnVNanFWT0xuUnN5eTIrT2F4eEJ0V3MzM29x?=
 =?utf-8?B?MzFkL1VPYUgwSVA5OS90STRhRThMd1FRdXg4MzBNQVlHT1NDS3NZaU5NV3NO?=
 =?utf-8?B?ZzlRZFhJdEptQndiTlBZNGI1YTQxcGxxbWd0TzhtbVpVNEJCeDFmampKaDFn?=
 =?utf-8?B?QXN4MXNWMXkrNm5nRXQweUZhNXFKbmNLOGg3RytSWjNLZ0oxY0NzUE9XMHk4?=
 =?utf-8?B?amt1WFBKNUlsU2RSZVBFaVV5OGk5SXlaOEpMRVIrM08zWlJmSUFNWnpLMXVF?=
 =?utf-8?B?UldCMHNiM0I3RVZyVk94QlRSQm5NMVo1NlNJSzJnRXN0aHo3Wkc0TWRSZG00?=
 =?utf-8?B?U3VKNDRvVzJHOVVBS1dCV0pmSVlybzk3WFBOSDNzTldoMk4wZGJjcGZKNWU5?=
 =?utf-8?B?dnl5Z3EvS1hyVjdHSFlHS3lhN3paNURKcVZaYVFGanJ4di9IUUdkUG81S1kv?=
 =?utf-8?B?R2x1WExLVWYyMjljaE1XSXJSK2JMQUZ6NFA5QjdGRi85ZnQzMmhxcW9JTWVS?=
 =?utf-8?B?dkMxeVc5WmlGWitSd0ttK1ZCTjVUaWRlaTQxbTdHZU9GdlZnNU0xeXJPNUZW?=
 =?utf-8?B?TUpqbVU2cXcxdzV4dEVYY1lsQi9ZUjdsam85LzJQczFCRXluTWJGbXdjaGJD?=
 =?utf-8?B?KzJRZUhqdFBISEZxczhMTlBQVXFIUVo4bGtqUEk3eHYwSE9GNEJvNHB1a2xN?=
 =?utf-8?B?KzVFc0dFamNSNFByZjF2N2lCTUZPTEl4bzJreTV3RG5oM2dZcWRPaVkvY1RJ?=
 =?utf-8?B?RVUrZkMxTlJhWEwzdlpFbVpwK1hVWVBZcWhwMHQ1L1F6UWYrZjgvZllETFFB?=
 =?utf-8?B?Y204Mncxc1hnQkZrS3JzRGtqR0piTU5tblBjb3RRQ29teGRCTGdQVlN2NVdk?=
 =?utf-8?B?b1JpdDh4TXFNY1BHeUxSNUJIL1QyOG56S1QraDVnZHdvYkN0bHdMaGxFeUkx?=
 =?utf-8?B?eVZGVzhmMFdmaGJJejlZaEM4WCtkRFBseE5ZYUFjMWNKWmxmZ1grTHo4RFp4?=
 =?utf-8?B?dFZHTDdKclM1MWJkVFBsUHhvd3NEbFNuaEx5akNCdG03SW5vbzAwdTVadE9m?=
 =?utf-8?B?cXNJaXVldGx3VGZmblVwU1V0ZzYySVlUL214SXExWUZwMHdpWEM2ckk0V1Y1?=
 =?utf-8?B?Y01DSFJiVVFZc3pWaTJnMmVBVzlZQkY4QlNudERwNmRDVkZyUEYrME9KRm9U?=
 =?utf-8?B?bkYrYy9wT0VsY1djZFFKSWx3SWg1U0lOWE9PU3E2Qm00SlFITWp2QkpHOW16?=
 =?utf-8?B?aGtLR2FTWU1DMU1tM3RUT2FkenFEbWxnTDlpQW8ycXpBRWZiaTZrZjNkdk9F?=
 =?utf-8?B?RkZhenFrM2ZycGw0cTlENEMwWVEyZ0JEWnhWYVZIRjJ5MlRWWUxvaHpONHlG?=
 =?utf-8?B?RElVQTBSczFuc1FYaitVUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6034.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3JtRER2MFlwWUpXVTNoT1AwU3l0T3dHaVVWdVd2U0ZYTXVFMVVOczZqWm5y?=
 =?utf-8?B?UVh4NGtvUnAzUUVtYVdZbWFtaGJqT0sra0NUZ0RDQWE0ZjBIVUR5cmVLZW10?=
 =?utf-8?B?MU5FK29PekFBaXp5NHlxeVpEdndOcXR6aTBIbXk0bnpaMTUvV0tvbExNeXlo?=
 =?utf-8?B?c0oxOWppaEoxdDUxQm16eGdkalJnQnN3REZ0RnZiZFhGMXZJOE9HYTZWcGg1?=
 =?utf-8?B?RHQ0SWVIYzdieG1sSURrWmJmL3FCT01vNVUzcVJUNGt1YTNvUDg2Nng5bWZa?=
 =?utf-8?B?NVhqb054R1hzVEFhMWVWcjllVHM5SldzUXNtRHB3bkJmNlhXbTB3QlM2Q08v?=
 =?utf-8?B?MWk5RHdjSnhMT01OM3l2aXJLcC91U3k4SzVoSC9LUnVaSkpUbEF5RWxLMll3?=
 =?utf-8?B?dnhtMGQ3RldjbjFQTHJFWjVuMUE3Skh5N3VTcDhQckZxOFMrV1JkL01lTXhv?=
 =?utf-8?B?ZGx3R0tSa1FLQjdFcjdEZGNqdzY0d3ByNGJ3S00vbnBXQUwyU3E2NUVTdHI3?=
 =?utf-8?B?aEg3NGtWSUhpRXl1L0hia25kMnB4OGhtczhXU2N1UXBtMmF1YUFVWEx4d3Vi?=
 =?utf-8?B?azAzMTdFV3VwNU00ZnYxcG5jaVVsR3l5N21WNnRrOWNQa1diazl0V3B1Q0Nz?=
 =?utf-8?B?Y0tqZVJicXhwQUZreWt5QVFNN05LRDBqb2l4NkVIOVFFMSs5ME96alVMb1U4?=
 =?utf-8?B?M3FWTDhHTk1ENGUwRytHS1FxU3MyWFVEUEhTQXZSL0QzNDVOM2M5dlBBTllj?=
 =?utf-8?B?TldkZ2I4OFZlT1ZGbTI3d1NNQkhDaWhBTVNQWUlDYmlYelpLR01sdWF4U2VE?=
 =?utf-8?B?TXp6dWF3bDk1c3hXQ0MrSmRhMXlDRnBvNmd5MytOSngwYXoyRnk1TmFmcmJ1?=
 =?utf-8?B?OFdVZ2p6SWVyeCtSdTdWV0F1SFlXMm92RCtpTHlnWU82U21wVEZRc2l1VGRB?=
 =?utf-8?B?MDlzQW00aS9zazdMUXU4ZTlnYk56TU1FVWZNTWpDcVg3YUU3aHdJVXdBRUpp?=
 =?utf-8?B?eWM3TXBTemNYZnNzdEMvVHRZQU5IMDFSVHQvK2JUUnROUE9kYTUyZmJpb2ZM?=
 =?utf-8?B?cmo1OFRmMlpEUFBnVmtyWjhQUVFpdmRPeFMrUDI4MVhONFNPUzdyUVNRQ0M3?=
 =?utf-8?B?elFlZEkyZk1seHo0Wkd5RENPeDBHdU0wQXErMHRzbkVHdW8vVEF5TW41clc3?=
 =?utf-8?B?dnJiTjMwSXZkYUNrL1pPeHJaU0M4K0hPdW9KMEVSTklIYmZxM2FqRVA2Mi9l?=
 =?utf-8?B?OFVPK1Iva1ltQmZONzBLVk13eEZzV0d5bVVaZnFVWDNMRm5iRmRRbzFSTWtQ?=
 =?utf-8?B?RldLL25xYTh2UG90WE1aUFdRRE1XK3NnNjI3aG5Wby9SbkdRMUJkUnZQNEVo?=
 =?utf-8?B?Zm5aUFRVM0szYzNMblBEWTRwb3ZUUVVSVzhnbUVianpkTzBHQ2NIWVR3RHlu?=
 =?utf-8?B?MCtIUVMwK1hZMVBDWjVzN2l3ODEzUCswZ01lS3RjT2taWjRkamgycjFCdmJT?=
 =?utf-8?B?aDk2NWpSdGlOMFM0aldxZU5RKzFSS0gvZ0Eyc2N0MlNDdzlrbEh2S0c2dlZw?=
 =?utf-8?B?M2UwUUFyMlJLS09CZnNqdG1BT2VQdG5PR3M0dlc1c2RhKzFtcWwvWVFncCsw?=
 =?utf-8?B?b0t6L2FOQmNhek82SExKSkdqSXY2bFViLzkvdHpxUEVJeXA4dlZneTVTOENr?=
 =?utf-8?B?VjNuRy9jQWRYcHRVOGlNZnVndkZBOTB6SXYzRnQ0Tk5yd082a05TdTlFenF0?=
 =?utf-8?B?ZGM2WmVZdzZ5OXVoUlJXTHNIc2RMUVR1eEkvSEVTTU1oZUxLcklhdkdaaE5L?=
 =?utf-8?B?T3ZCNnFkL1JvSDJ3N284RndOSmxmRjJqVm1xenlpb3hwNmhnVUZNRWtKaTc2?=
 =?utf-8?B?OGg4NlF5NUZ1a2hnM1psTUFtWmpib2k5cThIS2ZzQlV0L05GV1k3WllCdFJw?=
 =?utf-8?B?ZTArZG9oM0pFd3FwaldzMHF6UHhUaTVUTFFoTnZ2NlBZKzMvQ0dKV2M4NHlO?=
 =?utf-8?B?MXkzVTIwMEJURS8zTVBCRjRKQWFlWFdiUnBwT1I5dm9MOVo5dHdzOE5XVWQ4?=
 =?utf-8?B?VUVwMEgvZXQ5MTVOTU1NajB0OXJlVlFDZTJlTjVWcFExR3JkZll0SWtSaDBI?=
 =?utf-8?B?WllmVmJ1VXRQY25oekVheDBObksxUGRBK21SQzFDaC9uYitiUEVmVjh3cFoy?=
 =?utf-8?B?cmc9PQ==?=
X-OriginatorOrg: genexis.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: a2251b3b-1bab-45a1-100d-08dcbf84025a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6034.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2024 12:48:07.7781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: in4JgTsM6GtSpuf5wHi2iSFyunBF2mxD/XgYll2ws4gACycej3b3T3/xQ69qWVg3B1BaVEZYN1BCIGD/nhq89b3hg9SQ7rKRbqCvL6aDy/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7308

On 17/08/2024 23:39, Andrew Lunn wrote:
> How messy are the GPIO and PWM registers? Are there N blocks of
> independent GPIO registers? and M blocks of independent PWM registers?
> By that, does one block of GPIO registers contain all you need for one
> GPIO controller? One block of PWM registers give you all you need for
> one PWM controller? Or are the registers for one GPIO controller
> scattered all over the place?
>
> Could you point at a public datasheet?
>
>        Andrew
>
Hi, per my understanding there is no public datasheet/register reference 
manual.

But here is the division of regions of the registers in the gpio block 
and how it is currently divided between the drivers (according to my 
current understanding).

1FBF0200, gpio/pinctrl
1FBF0204, gpio/pinctrl
1FBF0208, gpio/pinctrl
1FBF020C, gpio/pinctrl
1FBF0210, gpio/pinctrl
1FBF0214, gpio/pinctrl
1FBF0218, unclaimed
1FBF021C, pwm
1FBF0220, gpio/pinctrl
1FBF0224, pwm
1FBF0228, pwm
1FBF022C, pwm
1FBF0230, pwm
1FBF0234, pwm
1FBF0238, unclaimed
1FBF023C, pwm
1FBF0240, pwm
1FBF0244, pwm
1FBF0248, pwm
1FBF024C, pwm
1FBF0250, pwm
1FBF0254, pwm
1FBF0258, pwm
1FBF025C, pwm
1FBF0260, gpio/pinctrl
1FBF0264, gpio/pinctrl
1FBF0268, gpio/pinctrl
1FBF0270, gpio/pinctrl
1FBF0278, gpio/pinctrl
1FBF027C, gpio/pinctrl
1FBF0280, gpio/pinctrl
1FBF0284, gpio/pinctrl
1FBF0288, gpio/pinctrl
1FBF028C, gpio/pinctrl
1FBF0290, gpio/pinctrl
1FBF0294, gpio/pinctrl
1FBF0298, pwm
1FBF029C, pwm
1FBF02A0, unclaimed
1FBF02A4, unclaimed
1FBF02A8, unclaimed
1FBF02AC, unclaimed
1FBF02B0, unclaimed
1FBF02B4, unclaimed
1FBF02B8, unclaimed
1FBF02BC, pwm (but currently unclaimed)

The gpio functions are split in 2x32bit register banks. The pin-io and 
interrupt support for these are split amongst the regions.

MvH

Benjamin Larsson


