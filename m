Return-Path: <linux-gpio+bounces-14372-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E349FEDF6
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Dec 2024 09:26:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 928EE7A0F73
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Dec 2024 08:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A651F18D621;
	Tue, 31 Dec 2024 08:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="oarh8sT8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11020138.outbound.protection.outlook.com [52.101.128.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0DD2A1D7;
	Tue, 31 Dec 2024 08:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735633593; cv=fail; b=FGf5QlHYcdk5FUIZkebovmI9+CXHJFoXIW8r7QfxDrgOfedgu8IHGFwppIY72gBDbb/GoN8UJqm/S756tuwxMNNvhAYVNC/3zxf24pIVkvYHo0/aBR1BsZHVBpuBM8MbwfrPTdre1llYiQW2v4ut7/a36SlupXMz8e+KDlMOXUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735633593; c=relaxed/simple;
	bh=VbwUhq2/bvS9mGEcT6z4IHykNj8uOVKohxOkzSRIc9E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OOKVLypFVMtupKep7Ao0OmcI+HeaXz4L5t2X4vYSqI1r9VerkcQrmjY+R/cboD9uRNNxcGSqEXliHMQ+4Xy7uK6G94ABcg897wqI39GeNKAqeqt8WvW/jTdW1whtGL86YSERBjtHAFH0GDSM2vFYztqmWpkcmvrwc1dBd0klXJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=oarh8sT8; arc=fail smtp.client-ip=52.101.128.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qygXglab36AThAJ8Lmuk/ObIia00MZ0wk+Dhkvn6aqc0NTKOG5/v9XbhK2YyLF/O9I9MQ+bZIr6DrWKaujeqa0bqh8HkyWPqUoJ04lLxnELUwqpN2cKzIvaGVF7sKQohwcsM3GZ201flNbLl7Ow1Pc4Os8cieXXvwbvBvD4E3dz+0FZS985vtrAuzz7CSZO85I50w7u2bpd11EJWk9OM/qJT9dfFVRbIilvY8bVMrE07OZlMDLcBy7ao09/0GWatGBEGCN/YE4CroJTkiLSa2wn1bpvQpBNJ4YeYzvqouF17occIAPlNCjC8u2geEaNQF33dyUKFrB4/PMrYJTYSgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+pPClQ0EjatEVLB1gsxZ7ue6rWRJED1BOeQ7x8va0k=;
 b=lOPP1qRvsj91z6EFYNIpQNYTsjDeLfjpvMgsThi6VJlkzXtRt4SG2GkJ+/lscoIF2jhH+tFsQD68yYm60g6G3cBSls73aKtKB3NGCqplkIxKCKxKBntfsPyJa1P+UTa9Y2w4T/aGe6zm7lCLLBqqAdrzwDVURxNyUqGCiLdw3K9c2IfZs6a8w6VyewIi+5JIAiU3dnpTqX8oKs3L5vWruuLwX4weMiS6fU4Kh19rbjgSAN9vPnvU4giRMokofuGc/txv+BSPoi/zGkpaT6tNK7HwKYIYO6Q1C0Gl09dFW6DOqU8crqqelXCYtnwh9JcBKA4P7Od8xl8u4fGXGD9/ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+pPClQ0EjatEVLB1gsxZ7ue6rWRJED1BOeQ7x8va0k=;
 b=oarh8sT8kR+zMOhutfrQ6EemDVDIocl4cvqOSvDPGFW93Xt4lv/tb8EoeWJ3xm1kGb77JdGsU8AekH2Fpw1gIqaI231dZcHpjqXERy2y4iCXHvjyuTHyD6scfJ+vANpOY+ix7XRMg4oOpwvaxpAsO79r/OZlqjZKRNvNEoEKcLeG+BbGyFC3HUofnYBWaLc3i9L3R9K5+7OI0yQd94HB0xktGRbrT3VUYK1HD6S9GVqZzya9Lulq30oCGCk4y+x93L9SwhLLznP8hVq+I3rPooIwheFjZIocFSGxLGNWUxUTNYbX1kXrrt7PCxoLOZVUj/1vE8T4FTsfpbBIl9GrMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by TY0PR03MB6582.apcprd03.prod.outlook.com (2603:1096:400:21a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.20; Tue, 31 Dec
 2024 08:26:27 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%7]) with mapi id 15.20.8293.000; Tue, 31 Dec 2024
 08:26:27 +0000
Message-ID: <4647512f-5be8-4ebc-8897-8191e1fb5cff@amlogic.com>
Date: Tue, 31 Dec 2024 16:26:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/3] pinctrl: Add driver support for Amlogic SoCs
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>,
 Huqiang Qin <huqiang.qin@amlogic.com>,
 Qianggui Song <qianggui.song@amlogic.com>, Hyeonki Hong <hhk7734@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Carlo Caione <carlo@endlessm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20241211-amlogic-pinctrl-v1-0-410727335119@amlogic.com>
 <20241211-amlogic-pinctrl-v1-2-410727335119@amlogic.com>
 <CACRpkdbuj-_sPpdfcyg3_QNtzt9r7n-0HBGBKgy-rKUMhvGo4w@mail.gmail.com>
 <23899c54-14ad-4724-9336-2df6fb485fd6@amlogic.com>
 <CACRpkdZn75ks4Gc7rm8jzkKM6y0JeQmUF3qmbJA+O+cEA9r--Q@mail.gmail.com>
 <CACRpkdbd5HFzRhoC7qRAb-Kd89fa9sX67aqK9AAMoif3nw9qbQ@mail.gmail.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <CACRpkdbd5HFzRhoC7qRAb-Kd89fa9sX67aqK9AAMoif3nw9qbQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0023.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::17) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|TY0PR03MB6582:EE_
X-MS-Office365-Filtering-Correlation-Id: ff1a7958-4ff6-4f8b-3782-08dd2974d232
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ODk2aW11aWZqbEpoWDRRQU1PRkRxWnJWMjh6WkUvZjF6TmpsdEUvMVA0elVW?=
 =?utf-8?B?MFV4YmRFTGxnNWIrSGQ0Z0NHeDdTNjhLSU5BWjNLTjJNRmt6VlZzbm9WTCt3?=
 =?utf-8?B?NlhTRVdkakdEZ1JIbjk5a01GUVR5NjhZaWVDSnpTcnBDRkdYNlVEVUNLb1Fz?=
 =?utf-8?B?Tjg1UWMxcDFLSjh6cXFVVzZRMklOeFY2Sml5Q2djakZ4U0dWN1BRVXEyVld1?=
 =?utf-8?B?VHE3dU00WmthZFVEcVdoWjBldjAzZHFCZXlUSCt4VzAzMzYvNGVZcW94NU9G?=
 =?utf-8?B?Y0g0K2tqak5MUHJHNUQyeGtneXF0b1hPT0pOcElpWmlJRnhhalBGTG01aGo3?=
 =?utf-8?B?cW1BTjJmaTZiRXlRTzVUZUVVSWxBMUxkYnBhenFQN1MwOWM3QjBLZEF4eTFM?=
 =?utf-8?B?Tk84SjZvVWZoQnF5R2pFTHhYemxlN2VwK3MzOGgxZXJrcmJuSVRkc2dNNEFD?=
 =?utf-8?B?QjREUHhoNExhdzgxUTlqMGJRck43N1E0dFMySmpud2pOcEsrVUJBMnE2bWhY?=
 =?utf-8?B?NVBqeWFOeHppaDlvZnY2Y3RlUXRRRzJpM3ovMG9JWkRDRWRZVU83WlZHcmg5?=
 =?utf-8?B?UERPT1pUNVM2Z1lWVUxCc010Q3dZVmFLYnBnMlpzUWlzdVhNeXNQaWQwdVY5?=
 =?utf-8?B?V1pVWWlsZFVSQjZxc2pkSDJSZERYc0QyeU9wMDIwSTN0RzhSMHFrQVVZK0xi?=
 =?utf-8?B?OEZnU3Z5UC84S2piWUNyazRoSW9Ua3RUUTZoL1pwSEJ0ZkhSeG0xdGwyei9K?=
 =?utf-8?B?M3VpcElLelI3a2c4TXdXaUhmdTFCK0R2Rk9wUm5zeDREU2tTSXJvbklmVnR3?=
 =?utf-8?B?QnpsSEQwa3IzcFhRb2FkZUI4QmxMWlFmdXVCSFVSQUpzdE9CdmhzK0Q0eFI2?=
 =?utf-8?B?bDJkMkREWnZtTTN2QVJjUW03b0hwMjRMWmxSdG4vZWRndmxodXAvdWtuS3Nm?=
 =?utf-8?B?RVRDM2lSdGZ5aXpkQ09PeWNmVDdLRmxnMUtOczd0bHo2TTlmNGE3MVpoL2dz?=
 =?utf-8?B?QUtEbUJxWDBDOCs3akFOSFVnU0RmSWp5MlJab2tRenRCUHBUeHJEeUF4Y2xP?=
 =?utf-8?B?Mm00NWZtWjZDRURtWFpxNnE0TjR0T3Qza1EybG9aRTNCR3lTQkY2ajhGMTVh?=
 =?utf-8?B?bk84ZXlmQ0dwdWQ3MDhZV0Ewams3Z2ZDN0c5N29nM3FZWk9MVUF6RjV0dm12?=
 =?utf-8?B?czZid0d0cWZVdE42UVFOWGhpeW4xS3BDc09wMlBhQzZZSWl3TW54OFRPS2Rr?=
 =?utf-8?B?Z1RWK0tnbFpVY1k0Q1pRMm9zUDA1K09rOTdXVGVuY3RuRThKY0xtd0gra29Y?=
 =?utf-8?B?ZUttb2ZDWGM1bUpteGhqQzdjQ1I2UFVHalc2akZrTjZvRWc2L2VEU3FJVlNB?=
 =?utf-8?B?WUNBL2N5TWwxZk9jUmFFek9ScDN1dGNqWERGQnpmMUFWNVhBcVdpd0tWaUln?=
 =?utf-8?B?cG5qRjN1WFladDlPUVJseFFMZnR6NFdOQmlYWWRERUJFZmhtTWhhTmtqVm1F?=
 =?utf-8?B?MnQ3OUluSmFBSnl4Z3VKSHhVaC90UytQL2JUNjdwL1BiRVdNUy95K0FWRlAr?=
 =?utf-8?B?dDhHbElpUDQ0OEM3ZFA2WXNBVTFrMEpza085M2hVK3MyU3llS091ZERiNWRi?=
 =?utf-8?B?RGhTZk12bmJOL1pPemxvclR3U1o2VVFiQWUwR0piTnlleXMxeGpQVUFzOEZD?=
 =?utf-8?B?aXZjeCtqalFqMnJUeTMxNVhCRlV2bTl6YXhvamFaWWJob21Gc1l3b1FvT3Zo?=
 =?utf-8?B?VkFYTkVtTWpQWDJjM3NZeFJXSlZ2bEZEWThEMEFIRm4vZ2VGekVkeHBvSTBS?=
 =?utf-8?B?TnRueWtCMVV6cUtlYkM3b0kyajNLdDZ2N1A2eTVhbTdaeDJ1SDRxSG8rTXBk?=
 =?utf-8?B?dVE4dlJmM2JFQUF0WEpQYXljR05QdXMzK1M0Kzh2bVZQUGc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3psZldEK2VKUlJEcThLU2YwaVZYS2VSdUhiZ1VFL09XOWs2ZGdEQVd4Z3lr?=
 =?utf-8?B?amtJZ1cvYzBQTWp2WDVCZFVFaFhjQnlVRFVvcDkrZ0U2c3BpcUNGTEhESlVi?=
 =?utf-8?B?MExIdDZSTzlSWXJZUmF6VmI5TC8weUk1Z1ZlSkl0Tkc3T0gyZDBVZ0xabVRq?=
 =?utf-8?B?QlVuZmVmeEhLRkh6SGZGcnlXOG5sMGU2T002a2txeDk2NzNrV2pyRnArS2Z6?=
 =?utf-8?B?SzVyS1ZBVE5kdlAwTDc5ZGw3R1k5Y1ZqU3VMMUZwZkU1TUJ5a0Fjd3RVck4v?=
 =?utf-8?B?NjJ6SFRPdDdodWZUckhwL1NReVhLTEZYcksvT1lNRXltQytqRjJ4U2EwU1RG?=
 =?utf-8?B?b0dGNUY4RkhaVjh2cFJuQzI3Q1FaY2Z5Tk1ySzNOVm9UaDNNSTZ4Q3czelZz?=
 =?utf-8?B?cWFCdEZFbGtYZndhcFZZSU9OcitWWFdnZ2ZGcjN2cjhaRnJwazNsd09nSUZF?=
 =?utf-8?B?UFhLWHk2UDd0UW94L1lJdUoyMGNJc2RMbUw0R2lwbzNNMnFlM2RNd081bmFy?=
 =?utf-8?B?dTMySFFhZWJ4Z1dIYkR6bXMvM3BmUURyYk01Q3NLM3hNRUp5OUtKUjVmUVFs?=
 =?utf-8?B?WEZ5MEdTbWlhZFpkU2RQbStiYWZ2ZGVJS1B2ZmtBVW9SNW9PeXJJN0lXTGc5?=
 =?utf-8?B?MXNNa0E4MHlXc2tpV2taTExVQlA5VTQwb2FPRXBVYjlXaW4zR2NQVUtVQ0VI?=
 =?utf-8?B?MjZXTGJHV001c3FNVnE0MDBCVGMzSk90NTlocXBvZEhsUXMyc1MyZkgxLzV4?=
 =?utf-8?B?MThQWGd2cm9hVXZsbTJaY2RpM0F3ZkVPQmhleC9lSllNekxTbUdJcFFQc3Iv?=
 =?utf-8?B?MGkwYithU2VZaXpYZjlTZzBRcUNralFwSkxoaFlweTVHdEJER3pzSGJmMVhj?=
 =?utf-8?B?Qm1jU2g5WCtQYkwzN0dTV1haNEg4UU0xTWhEYjM5MHA2YkUwNC9WOHU4SjhN?=
 =?utf-8?B?eHJhVjFGQ3pnRlJ3b2t4OXU4bmhzSDZUYi9NS1IyU05LS2NFUU5FVUJCaG5K?=
 =?utf-8?B?akZsU3JFVGlHaEJSdmJwUkZBblZITGpxYW9oL1htaXJDQmhCRFBKKzNXZEk0?=
 =?utf-8?B?Ymk4N2pGY3p3NnpnNVZhQk5hNDQrcHdlWloxbFVUdXRleXRINDhoZVBOemp4?=
 =?utf-8?B?eE9kQUkwZXFXTlVpbDZHQi92N3NsZHZVRk5TaDVyMUFQMnhWeUxXOFltMk5X?=
 =?utf-8?B?Q0VBNkhqTGdJZE5mdjBoMHJvU29CeDJrMVBRN0hLaWJzR2x6UjFVSmRYY1Fl?=
 =?utf-8?B?Q1NrY3M0UDVUaDFXVW4yS3pkc0xQbEh6ZGcrUnhBb3FQRlNwVHgwaGphWmgv?=
 =?utf-8?B?WTVYSnVJWUFmaVNZazMrS3NRU2lIZTN0QUQwRlk0dk1QZXFIbnIzeHJLM1oy?=
 =?utf-8?B?OC9SV3NBRVJDM1p3N1hxaGN4RmNjZ3VPYklEa1FhMStpdyt1d2c5ZjNWcm5O?=
 =?utf-8?B?M0cwR0R6Y1VwYW1nSnhmQTBiQk5aOXJTZjRQTndFTzRaYlpvZWtGS0hMRHk2?=
 =?utf-8?B?bjkxSDVyeTlhaEh6OWlIZ1VJSnk5enAxMCtDOUVvcnFPOFRBcFVoQXNpc1Z5?=
 =?utf-8?B?SHlMd3kxSG9BclhyOE5FYWxrTlZyT1kvSE5SbzZaZXY1U2tPOG1jNGt6VDB0?=
 =?utf-8?B?d3N5b0JmWTkzUEFlU1F5SGRZK2ZTbUQ5ZjNOMFdkMHZRTlNESFUvOEYyMzE0?=
 =?utf-8?B?R0N5Q1pBc2ZhRzlWVnBUVmlpc1ZMZW01bGUxUDc4NGR6L2tJdzJmYTJhWHpo?=
 =?utf-8?B?cGg5eFVRNGhmV1plMGluOEFQMDFpd1BwM05LY2xWb3hoL1U3ZC9JWUwwQW5x?=
 =?utf-8?B?YmJtRXFVOXJGMmRCOWtVNW43Tktxa0JGODdpc0RlTmk1eGl0MlhYYW02SFFt?=
 =?utf-8?B?ckk1Vi9vVTYzZnRwZ3Z5cWk3OU1DZGFsMEVBckdkbys2K0ZHTVVZSTNCWE1u?=
 =?utf-8?B?dzRlSFQwZUVId0pMNnFtUjhSQitrcjRWNkVFS1pPWVhFVlF3eFFFbGJIWXRl?=
 =?utf-8?B?N2FjT0dpSzFUYUNDVFVmbE5XK05wVXVXM1ZCeGVkR2RxVUpqOHRpSkswaGNJ?=
 =?utf-8?B?V3VjUmZiYStQdEs4c0QvQi9CSDIwa0w4c1p3anNLRDVNcVZHdmNOTmZmYThD?=
 =?utf-8?B?YjBzdUdkMzNVdDRQWVQzazVyMVdRa204cWNMM0F0cFZzRlVrdnppbXBCRnVG?=
 =?utf-8?B?QlE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff1a7958-4ff6-4f8b-3782-08dd2974d232
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2024 08:26:27.7666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5HHo7yi+jyiiwEBftGLjLEhXjbD2206EG3vsBCNcfIBwusaf00lOMYSYoMURiWLiXogdT208+VXGfq6gl74cMvYp/21etO/BXQjU44PeDuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6582

Hi Linus,
    Thanks for your reply.

On 2024/12/28 01:19, Linus Walleij wrote:
> [ EXTERNAL EMAIL ]
> 
> Newcomers, latest patch set:
> https://lore.kernel.org/linux-gpio/20241226-amlogic-pinctrl-v2-0-cdae42a67b76@amlogic.com/
> 
> I included some of the prior meson authors on the to line to see if
> their mail addresses still work and if they have some feedback on this.
> 
> On Sun, Dec 22, 2024 at 10:08 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> 
>>>> - Renaming drivers/pinctrl/sunxi to drivers/pinctrl/amlogic
>>>>     so we keep this sorted by actual vendor, sunxi is apparently
>>>>     yours (AMlogic:s) isn't it?
>>>
>>> It isn't. Sunxi is Allwinner SoCs.
>>
>> My apologies. I mixed it up completely. :(
> 
> But wait a minute. I see there is meson. And in the "meson" subdirectory
> there is stuff named "amlogic" ...
> 
> $ ls -1 drivers/pinctrl/meson/
> Kconfig
> Makefile
> pinctrl-amlogic-c3.c
> pinctrl-amlogic-t7.c
> pinctrl-meson8b.c
> pinctrl-meson8.c
> pinctrl-meson8-pmx.c
> pinctrl-meson8-pmx.h
> pinctrl-meson-a1.c
> pinctrl-meson-axg.c
> pinctrl-meson-axg-pmx.c
> pinctrl-meson-axg-pmx.h
> pinctrl-meson.c
> pinctrl-meson-g12a.c
> pinctrl-meson-gxbb.c
> pinctrl-meson-gxl.c
> pinctrl-meson.h
> pinctrl-meson-s4.c
> 
>> What do you think of the idea of a separate drivers/pinctrl/amlogic directory
>> though? I think there are already quite a few amlogic SoCs that need
>> to be supported and more will come.
> 
> So what about renaming the existing subdir "meson" to "amlogic"
> and put the driver there.
> 
> Also I want to know if this driver and hardware shares anything with
> the existing drivers in that directory. It sometimes happen that
> developers start something from scratch despite the existence of
> prior art simply because of organizational issues, and we don't want
> that kind of situation to leak over to the kernel.
> 

Initially, I developed the driver for the A4 chip based on the existing 
framework (driver/pinctrl/meson/). Following the pattern of previous 
chips, I added the pin definitions directly to the bindings, but this 
approach was rejected by the maintainers ([0]).

I then attempted an alternative approach: adding the bank to the 
bindings and converting pin definitions based on the bank and offset 
within the source code. I moved the pin definitions into the source code 
itself, but this was also not accepted ([1]).

Realizing that the issue could not be resolved within the limitations of 
the old framework, I decided to introduce a new framework driver to 
address these problems.

In the new framework, I made significant changes to simplify support for 
subsequent chips. Now, after adding the source files and binding 
documents, the only required operation for supporting future Amlogic 
SoCs (such as A4, A5, as well as existing chips like S4, C3, and T7) is 
to add the corresponding DTS node.

[0] 
https://lore.kernel.org/all/20240611-a4_pinctrl-v1-2-dc487b1977b3@amlogic.com/
[1] 
https://lore.kernel.org/all/20241113-a4_pinctrl-v6-0-35ba2401ee35@amlogic.com/

> Yours,
> Linus Walleij

