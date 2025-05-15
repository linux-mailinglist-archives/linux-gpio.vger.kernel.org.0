Return-Path: <linux-gpio+bounces-20187-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC0FAB7C06
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 05:05:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BBC71BA7CB3
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 03:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D052296D34;
	Thu, 15 May 2025 03:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="B62zWYMh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022121.outbound.protection.outlook.com [52.101.126.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2341D29551F;
	Thu, 15 May 2025 03:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747278293; cv=fail; b=uzbinXpEOdCKZUbEP9J06yOLBdFAS6AHNTV8SsHJe/DjJM43YC0iXqdArX/5tuxGpuZfbJjbCD2JcSdIE/IzXEY8mrGnzStprhnrEUSiVjFlZXcnIBULmTz0Vlu0Bl1MpFFXZOwuUwvPb8MJgkZJUy1wDphfK6pXf6Q7jP+ztGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747278293; c=relaxed/simple;
	bh=58WZjlOuscMCz+IO/8ILnxmU7yA420IUBi0kIhAs40M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bro+4mPhh80CxxWVeRpdnwRmcwzJFl/CFenyFJ4PHo/NDrduDwB4pONwgoEjcy9MuiS95yHFTEqtwQlAH24sDcYrrdCqJNjKP+0w7Vm7ShCykIRYrmMpVkLmokY1k7nKfQDOwAFs70H2lTr+2jJKxEmOisDeQ/030DtdqYQ0oTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=B62zWYMh; arc=fail smtp.client-ip=52.101.126.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQ5BL3aVJYoT6xasnO+LwFh+diz9t7hlrZ5GFeKTfWcuDt4qX8C28kveMyiO3piyVFRZVuVFRuQxc9H9qY1Yc+hnl4Jl+UguCD/LYAYM/pIld3yK3iWUoJ+xweeKSXFVjJ4ETgI7qZFXD5hVhIPkhueRWz62D6UJdBEwvM2VhImdd7BRUaM/O2ZSYOuNPv73Hb4yRvH3MteYJnUfnWeH0S7YeRhkudP0QYP7MSbDEIySvd7X/X31tPMvpEOsZnCe7c8yj5LVaZcC0NKBawdRje6BXmbn6+ijoPdJg1/d+s0u+ysDSLklF18IONgGg3dZnYjnJihZ6Zj3A1kpxHV1Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJRbNLHuset5EmFyBR2PGEnrx1PE0gUkTiMVLdrtVos=;
 b=ylfBLKSBSztuIji2D0oLa3ze+K6iYZVombUF7lBcOF0X5CoKOUMpPJmn7jJYnRrMYVFvC68PUGT5C4uKsUfQC8HIxjcq08cXoAZGu8FSFJ1tRXPe/d7E/4DJnCXywEpTUn4OwqUjgjv5XR/1yN1KwKaeg7ItpKzhd1KNXjAdfLlCs2M6kkhZUlTphCdSY9XN7pwA/TANqSCHV1+EpMca17jWK9Fn0Ph6fOXnPj9hbDFQcPTgI4OBQ9q5posF6vu2piaORXX/Ka9t4OK3t5kftDOFS+kgJt+rXwH8IH0yqCfPlav1q8YcBdkzsxYaixzFjwKZkWCrsoKLq6IZO4gUow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJRbNLHuset5EmFyBR2PGEnrx1PE0gUkTiMVLdrtVos=;
 b=B62zWYMhdxI88U1xu/JRXCJ2snZyiCLs0q2KdYucyNnBkm7MUteR7g8LUBtbkPJb6xJwf+RcGXLAqhwYYXzoqg6Y/Hua59REuXUB849v5mwLLn6CwO28PeuoLJaaA33SXOSy00zX+NAbCUZhoWP7cHc0/6QINOXBTom573rP6PGOuqund1r9CXev7E2mLD9aqs70cyQL/Td79nfmz53LuGesvZypu1Qr8SnR/7wQIc2hTDDcf+0J5h8E6wmn507JvEcFdqdFpkDgsLLztsfC9m4f9ccw8F8UH1p5IRqR4A3Fn1sYYCyvITtyGR4U1iG9mMt8eplv5YSlgande2+oUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by PUZPR03MB7016.apcprd03.prod.outlook.com (2603:1096:301:f0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 15 May
 2025 03:04:48 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%7]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 03:04:47 +0000
Message-ID: <b58ce27b-6e32-4fa6-ba31-7e1b25e1bdd6@amlogic.com>
Date: Thu, 15 May 2025 11:04:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] dts: arm64: amlogic: add S7 pinctrl node
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250514-s6-s7-pinctrl-v1-0-39d368cad250@amlogic.com>
 <20250514-s6-s7-pinctrl-v1-6-39d368cad250@amlogic.com>
 <20250514131022.GA1833633-robh@kernel.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20250514131022.GA1833633-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4P301CA0034.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::11) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|PUZPR03MB7016:EE_
X-MS-Office365-Filtering-Correlation-Id: 4097c65d-641d-492c-8f86-08dd935d4048
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZThNNS9hKzNzVk1tRGRHYW9vdktpNW1YODQ2M3VYYkJQUjViZUVHUFh1akNt?=
 =?utf-8?B?WTdmNXhEazFQS2FRNmowWEU1YUc2SGNqVlF5MU04bi9rNkZ6d3NpYllxY2xN?=
 =?utf-8?B?Vzg3cm9GM2thZ1E2ekR5M1dJdjcwdlFqeE5Ua2YvVm5VNnNzeEFVeDF1R1Na?=
 =?utf-8?B?RTVtQWxpV0xiaE9LaUJRanpKZzZHcXNkWVlLRDJBYW0vSGJobTRVS2VuZG44?=
 =?utf-8?B?S09wT0hUSTlzaUhSZWx5WEJpNlBGNDNINmdNUUUrS1Z0ZStXY2pTWUYyc3dj?=
 =?utf-8?B?cTFaS3RXOWF1OTVJSzdSN2JDbzdyZlpCVXFNOG1KZVNPbXJMR2xreWUyc3RG?=
 =?utf-8?B?M0U0R3VEbyt1bVAxSzU1UnVyVDN2a2oxcUhsREcxL2FNTVZJdkMrV1RrZ1U0?=
 =?utf-8?B?WkNRS1FObWZ1cFdDK2VIOUQyWWdVMHpMYnFha1Vqd3hzeGYweDF1VDhYODRU?=
 =?utf-8?B?TXhVMGc3UnBpNnlRd2JBL01yMjN0U2hEZFZ4MTN6S0VXaVhZWFM1Y3Q4dUwy?=
 =?utf-8?B?V2ZibXJQbHVsZzg4alI0WThmWEVIOUNXL1paSlh5a1F1WnMwbkE3QmQzS3M4?=
 =?utf-8?B?eHliQkg3Uk1hb0hJMHNCMlRhMFEwRXJCa3krandBempVMkZKWkZyUWpBaVpu?=
 =?utf-8?B?NG9jczQyYnZOSkIvZVB2Q1V4ZjVHYTA4OWNVb20yTEJvZ0hZYmdFalJBQXRi?=
 =?utf-8?B?U3UxSGhvZjJtck5YdTNKWGlLcFlkbmNHYm04eHhRT1BkZWY0endPTlBWb2xO?=
 =?utf-8?B?a0dBcVc2bi9vcWFrcnpYWkE1NW9Sa2k2SG1LZHV2aGJOeEhpeHdjRStBekpF?=
 =?utf-8?B?T294SGRnMW13T01uUmNUR2x0MFR1Z3ZvRXNrYkgvQVhONmZEQ0g3YUdySU83?=
 =?utf-8?B?d0lwU3c4b2lQdEtLR21La29BUm1seGxLSVB2WnhMdVZ3cmYyZm1Ockt2MTg4?=
 =?utf-8?B?UlhjNFZLcDcrMzVPS2RHVzdiT1pKcTJDQ2k3RUdGbzVkTVNtM2xNaTV1T3R4?=
 =?utf-8?B?RUhyUGZ4NWVjNTJtZ2FRSExCUjNXcyswQlpHelJEcmYzTU5Sa0ptV1Z0THhy?=
 =?utf-8?B?YkNhWHVoOEFHeEJtMjdnWmxjUDJOL205ZVZZaDN0SzI3RFgrL2RsS21IYmR3?=
 =?utf-8?B?bUkwU0pQVUVNcnN2dDBxTklmaWlpb3dUNnVCWjBENU1PTUVRVldmLzUzeVF4?=
 =?utf-8?B?MUZ6eTEwRlFITGNOb3J2d1dtOWtEa3MvTTN4OVB5Nm15eUNpOENPZXZWL0Fs?=
 =?utf-8?B?SGFQNzlTd29vS1dVelNyRnNzc1k2QzNRU216d0MzQmdMK3pmQVczSkFUL1Zu?=
 =?utf-8?B?c0ZuaWtoTmFhcmpPdUdIckJRMEpBbkIwTkNPWE1qMG8yVDVmWG10SHdLWUNC?=
 =?utf-8?B?UE9sbG43TW9GckFtNWxZcnF3S2JMamIrQXpSMzhHS1FJMElCaVRadlRVR216?=
 =?utf-8?B?aXdJNFd0MC81M1B4YkJ2TFVMOTA0c1VlbzFjZ3creHN2eFpuNk55SkRyMUdD?=
 =?utf-8?B?VVZLaW9ud2pBT0ltSlU4dnptMDRNbkgwb0p0eDV0aElndWpuSjZVSHNTVjJh?=
 =?utf-8?B?aktpRmFybHFsWndZQzM0eTVvT1VaYTJMYkIvZ3JEelFBOUg2eERacC9wdHJM?=
 =?utf-8?B?bHlac3NuazNVVzZBSG43aGlUK2EzQ2dRUGFzbStXVGZjU3ZxYnZQSnEwM0Y5?=
 =?utf-8?B?aEpGUkpJM0pYeDFSbGVmRE8yUFlmakxCNVhmaWFPWkpzQThBSW5kVUJXNUZS?=
 =?utf-8?B?YW5zQ011dEo3R09WWUxURlBUditTVjlwKzNGRVZCVnZrK1lpZWFvQWhvQW9V?=
 =?utf-8?B?cmZpVUFWWFkzVXRES3hrY3NoK2RzNEhGV0tMYmJtUFE1aU1TckxMTTlHU1l5?=
 =?utf-8?Q?PUY03YMSsAAnV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UG1GQzNMTlZpdXJGQ3pscnZ2T2oxNVhQTXFRS2c2K002d3Y3dDhKU3BqNzlU?=
 =?utf-8?B?MHhkRzdNRk56WXJZVzAxL2VaL2FHbFk1d1lyd1ArRVBmTThSVmVoMEg5VlNz?=
 =?utf-8?B?VWtjekw1TlZ3RE54M29oYllPN1k1T2VKcG5oQWZHRTFoOHpGd1BPbk9XUXI5?=
 =?utf-8?B?R0xPMnE0Mm1JZW5aNUdzeVhyS0U5Qm5udXFFdjI5ZjdsVW9zWDhrd3Rsd3pv?=
 =?utf-8?B?NGRYNU05Z3NKTWh4VGNEalR0cnVjZUVJNmZ6WXFPS0owLyttU0FuNjVMbEVQ?=
 =?utf-8?B?RUd4QkZnclV1QmM4d3NrYnpaL0dPWktvSHNaNUV5aHpBOUQ3dms1UXc2YnYx?=
 =?utf-8?B?WmhGY0NFMzhCL09pOUI0d3NmVDVMck1ZdkZCUG5ZKzZTSlpkVmZaTmV6N3p5?=
 =?utf-8?B?cnZ4U1EyQWpHL0djZmNLRHlaWUh3WUJaM3QvR1dEVkxsMGpKaVkwTjRPdlh3?=
 =?utf-8?B?UEIvdUt1cFJGbHIweEl6ZlBsMFJ2V2wwQ1BRZ0ZrZ2hGWnRub2pYUXl4TlQr?=
 =?utf-8?B?cVlYbVJNc00zWDBzVnVFaWJLRGRFMmcwZHViWTB0b0MzVzlqcGh5Q2ZHMFFO?=
 =?utf-8?B?N3VZZzJjTU5kSHVERXZuRGpUZmtEa2NxbWVpck9oMEl3aVppVDg4Wjdzazgr?=
 =?utf-8?B?NDFNNzlWK3RNckRrYllNODhCaHhFam1qNEsrdGh1SzRnSVZBMnY0d3V1TGdC?=
 =?utf-8?B?STZGWE9KZlpiQ3l2ZllTbEFGSytwWWJWYUpoTGIvUlpiOGJkS1hYR2lVSk5i?=
 =?utf-8?B?NXJSMjV2TW9yV3h2MU5VWUlSNTB3UmZFYWpwMlZLY0JINTFCNFIrRGswVzVp?=
 =?utf-8?B?TG5zeHo3aFk3N0l2TmFzOFhLU0xvUUV1NlFRSmhYelZqTUoxTVZGYkhZWDVJ?=
 =?utf-8?B?QlBlMHpCbHo2a3BMakVoTWFCVjJDbjR5ZVRRZTZHQmFxejU4OGFIQjgxQzgy?=
 =?utf-8?B?UXdxclVrU3NSQUUzRk1zTzFGUHNINTlWWExrZFIrUXZxbFUxSUhrMjZyV2Nw?=
 =?utf-8?B?b0xoZW5KdEVmSW1RSnZtdHJBS1k2NVZ5aEpadlY1NzgxRU5Qdmt4ODNwTGt2?=
 =?utf-8?B?Q3BQMDV4YjlhNjFtUmw0M2JIWEZXU09LS2FDUjRIdVFHRlMwdGRyUjcvNjJM?=
 =?utf-8?B?b2Q0WUJOUHRON1pnbzkwSldONTZSS2dJNXZheGFTcGZ4VVJiUUJHUGVFY0oz?=
 =?utf-8?B?ekYrVjhjQlpTTDJjcnlxSnNqdnptZDNudHd3c0hQdEdMd3FjeWR1anFYRTJO?=
 =?utf-8?B?NTZyd21FRzhEem40VWFOdE4zMGJZTDY2V2Z6Zi9mbmltblZEZXhGM2UrKzh0?=
 =?utf-8?B?VTJCcUl0RE1Tb3FzTnZ2UkNVZmtyT3RpbjljRDdMUW93QVBROERkYnBkSEhL?=
 =?utf-8?B?VEswYlVrc1ZVZWorUlVOd3Y4THB1VUdVMG4yTDUvZjJJTkJrOEJWMlZZZkkx?=
 =?utf-8?B?c0lWYmdFWDNCWWx4MTdaQWtiT2d4ZzhDR1BIejc1M2dTMWZlejg0aGZuR094?=
 =?utf-8?B?aFBzVUlKVnNxeVlUSUZFb2x0disva29wVTNOZTZPejZwdmNHQkhiYmROQS9n?=
 =?utf-8?B?NUZ5em5kTG9EVk5WdEw5MzcxVEpmRFhXZXhQQ3VROFlTeXc3Rm9iZ0RMcGpC?=
 =?utf-8?B?a2JSa2o5QTFTMkUzN0U5VjBLbENaQzNkekpSMGtKMkd6MDZqdS9oM3Faa29T?=
 =?utf-8?B?TkJadVlGcUxoVDFEaXVhNHNCeVpNMFNNVnROZnhrY0Y3dGJXQ3NWTkJ4MW9E?=
 =?utf-8?B?clcraThGU2pPNExKVi9kakJCTXBLaGtMOXU0dnhLenJidUNuZTU5cW9tTXZD?=
 =?utf-8?B?aEYxWTJKaVYvN0hla0FuZlh3NFVaRDFwZ3E0MU8yQ3BHK3hvbnlaVWY0VThq?=
 =?utf-8?B?R1hyYjRQZ2RCdTJ4MHNiSEZlYUxUcXg5OWpSb1N2UjJDRFRoRkMwelFnd0Jn?=
 =?utf-8?B?cWdaWDRGY0VrUTB4eEMvKzZSL3FJbGpHRVBOK1k4VFIzVWhRRGFmK1ZzcWpV?=
 =?utf-8?B?NlZwOGk0TUd4MDJLWU9yTkJjM1pYdVJxbHE0SkhqZUg0aWVnbi9aM3FvRG1M?=
 =?utf-8?B?RTYra3VkVDhQM0pQWDNnelRUeDJxK0ZRNllwU1dKYkt4ZTJmU0NNWGFGc2Nm?=
 =?utf-8?B?WmVoNDRpcXdFemZ5bmNhWVRidzBUS2JBMzE2c2h5WE1ncWV5VU1xUDVjdXlW?=
 =?utf-8?B?Q0E9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4097c65d-641d-492c-8f86-08dd935d4048
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 03:04:47.7923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e3puW92dOlOCwZEll1R2bE9cqx5x9NQqm/oe82GV8P2G5QJCLDesoKyeoo/gnTCMqybN9L0YmqDC/rcQXUP5pCzpFblh0tt/b8od5jr2Buc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7016

Hi Rob,
    Thanks for your reply.

On 2025/5/14 21:10, Rob Herring wrote:
> [ EXTERNAL EMAIL ]
> 
> On Wed, May 14, 2025 at 03:01:33PM +0800, Xianwei Zhao wrote:
>> Add pinctrl device to support Amlogic S7.
>>
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> ---
>>   arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi | 81 +++++++++++++++++++++++++++++
>>   1 file changed, 81 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
>> index f0c172681bd1..924f10aff269 100644
>> --- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
>> @@ -6,6 +6,7 @@
>>   #include <dt-bindings/interrupt-controller/irq.h>
>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>>   #include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/pinctrl/amlogic,pinctrl.h>
>>
>>   / {
>>        cpus {
>> @@ -94,6 +95,86 @@ uart_b: serial@7a000 {
>>                                clock-names = "xtal", "pclk", "baud";
>>                                status = "disabled";
>>                        };
>> +
>> +                     periphs_pinctrl: pinctrl {
> 
> If you have non-boolean ranges, then this should have a unit address
> (@4000).
> 

Will add a unit address for node.

>> +                             compatible = "amlogic,pinctrl-s7";
>> +                             #address-cells = <2>;
>> +                             #size-cells = <2>;
> 
> Doesn't look like you need 64-bits of address and size. 1 cell is
> enough.
> 

Krzysztof raised this question in the definition of binding stage.
https://lore.kernel.org/all/012cfaca-e8f5-4614-9393-a4a46a797adb@amlogic.com/

>> +                             ranges = <0x0 0x0 0x0 0x4000 0x0 0x340>;
> 

