Return-Path: <linux-gpio+bounces-12223-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 576D59B2C2C
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 10:59:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 417C1281457
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 09:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C6431D278C;
	Mon, 28 Oct 2024 09:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="vi9YNJch"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2131.outbound.protection.outlook.com [40.107.255.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF9B1CC89D;
	Mon, 28 Oct 2024 09:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730109559; cv=fail; b=cTiW+bhRYewDhGPGsqckOr/f30zbN0Yw0V/Us3bcOtiBSRmMaifN7129co0vMHeF1syerNVYMLCLru+35gppZJblTRePD/hO0lYtM7yEs3esPGzMQNa/zGB0AhSYzATQjUYEXnFtRaSyw2HCNwGYp3WARMsGT/AeNA8lkLRfy90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730109559; c=relaxed/simple;
	bh=/GBhEnIGUyhK+dQX9aNsc2/ALhkIUd/CFCLt4FAznQg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IkQyAi+qrgNtwCEEO7v0wh2egAbO9lssgj6X5ciIUKpaUBARiwS5UYbEbcC1llpYqErjG8L8HLWR4JvKYKcIKdD8qO4tRIw1Rwrpr4v4sYU0Q7M31NhhRqkCHBfQ74b/oOIMKmWttMDsdEGluyGsoc2dwYr7Vip5/4V+MQ9jcnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=vi9YNJch; arc=fail smtp.client-ip=40.107.255.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dziV1KwjOkzDlANZnu4SMX09v+t3gfCqtKm9fn1C1j7G3y+SwLreaKCQD6sTQI3GCoLDyHry812XGU9/B1vF/9INkbfd48nK8+Cs+NpnPLyiKgrK6ByeNisocRhxcqyMgRNAxlD2o50qP9HHb0NDl6qdEZZqa+s3A9NjJDCqs6F0tjAO7s+3FVrKViYJkAbBNfIWsrexO9rhQXC3GeK3zbuM8WcEmd/ueEZhaDmx8C8VupoJSiS5DtRie2WNcWqjTLp3nUL5qISUWPQFe0wVm0+p59jWfv0VCBud52A8pi0kYqC+qnsjZYftWwAjg38Mr65bXsFAXFoulYDJ7fiMBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vf8HsF+UTj3qiIO3I7OSedTMS1L3A4ztyJ+MZ3ONqog=;
 b=HcoJGVtVWCDSpk1fR7ePlkaFDJMpZxdNGqZnUMUK4tocahkCz2zCCfFu1Jr3J/PCWkNAO+rN+6jt4FDPzmEk3Dh5YNe+1H6QCD7n2cjCE7xZOcvHQnM64jkDwdB0+1r3x+J2Gk44IGWweqHdu1zVDBp7JCRAXnR/3xqpwzSGrY7/24N9k8PtKLV2BiN9ZXDodFKSg2OSl0R0jXbWy4FuaG95MkOhRyhF400ZLu+/GRLLr8MHoe1OVtALhnnKeDL2EL7UUTWSeA875p/PVG5pqm4qcNM/cp6j/SEcaSVa+qpXaC18Q7IfmZFljwgCkJUfiQVA01g/zb7nXDc8t3Afyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vf8HsF+UTj3qiIO3I7OSedTMS1L3A4ztyJ+MZ3ONqog=;
 b=vi9YNJchOg6bGU17v9gbPxZdpHjFCjj7bx/5DSSpLS70YHqd0+EhA+h/w8GU6HiORwQWAX0E9uhtRgojtKeVWxQKwKCvGdBujv54HBw9oFge5vhGyClt7XSGjG2T1qx9xTgEY5PlWjkazvnrtn+kNwoX2MPtebrsLhydQ17NXqu5zJp0bggR69Nb2Lp2T6QOmpGw51RPWdYRQdQlS0BoiELcMA5/x2KuN/OoJfY7oQorvCdhn36B7oorT7rg/abtBxUcJfXJI4e1oLVfrCnuoFb1dMA0P8RgoeZOcFummVxDaZ9hkT90WScDHgK05eEUPOUnVXZCagEHWmurlvbJnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PUZPR03MB6888.apcprd03.prod.outlook.com (2603:1096:301:100::7)
 by KL1PR03MB8320.apcprd03.prod.outlook.com (2603:1096:820:10e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Mon, 28 Oct
 2024 09:59:12 +0000
Received: from PUZPR03MB6888.apcprd03.prod.outlook.com
 ([fe80::57d0:f9e6:1d9f:91f]) by PUZPR03MB6888.apcprd03.prod.outlook.com
 ([fe80::57d0:f9e6:1d9f:91f%3]) with mapi id 15.20.8093.021; Mon, 28 Oct 2024
 09:59:12 +0000
Message-ID: <7c069b82-c31b-45cc-8cf3-a2181a56c2f5@amlogic.com>
Date: Mon, 28 Oct 2024 17:59:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: Add support for Amlogic A4
 SoCs
Content-Language: en-US
To: neil.armstrong@linaro.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241018-a4_pinctrl-v3-0-e76fd1cf01d7@amlogic.com>
 <20241018-a4_pinctrl-v3-1-e76fd1cf01d7@amlogic.com>
 <4a79f996-9d82-48b2-8a93-d7917413ed8c@kernel.org>
 <1jttd9rein.fsf@starbuckisacylon.baylibre.com>
 <4127b448-a914-4c69-b938-29512995326f@amlogic.com>
 <1jmsj1rclh.fsf@starbuckisacylon.baylibre.com>
 <d654d2b2-977b-44c0-8b01-b26f5eb0a3fe@kernel.org>
 <5ad8f396-84a5-486d-b90d-98fbf8882d1b@linaro.org>
 <e6cd13b5-2f7a-4ab1-899c-5867bc0ea64f@kernel.org>
 <fdb4d0eb-a5e5-4061-b3cc-14958473baf3@linaro.org>
 <c8a03fa6-9ac5-434f-ba13-78e47ad341b8@kernel.org>
 <f6c4cee8-dd22-4b30-a3b2-aee48e2c3611@linaro.org>
 <91bcc765-2e56-433d-a629-c5255fc8d256@kernel.org>
 <24acd645-4094-48aa-82e3-42d30a340884@amlogic.com>
 <78e6ca30-9fd6-4384-9583-440c485fb8ed@linaro.org>
 <d4ae04da-d841-49e8-be88-b0fe0c7b3de5@amlogic.com>
 <a0c30691-ad28-4217-bf46-924fca5f48de@linaro.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <a0c30691-ad28-4217-bf46-924fca5f48de@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0218.apcprd06.prod.outlook.com
 (2603:1096:4:68::26) To PUZPR03MB6888.apcprd03.prod.outlook.com
 (2603:1096:301:100::7)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR03MB6888:EE_|KL1PR03MB8320:EE_
X-MS-Office365-Filtering-Correlation-Id: 457c2115-b14c-48b3-eeb2-08dcf7372c6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c3FJOTJ2cUwxNi94cE1Yb2w0WnZWc0hCOWhtMWd6NXovdmhPSDhqWCt0b1Vx?=
 =?utf-8?B?aHFXUlAyQVA3OSt2SnAzNHJZeWNjSWI1WStXS1VyVUxBaXBOVTFvOUhZRkcv?=
 =?utf-8?B?R1ZiR3lObUYzUGxhQ2FGU1hSbi9ETUdrR3NEcnJ6dGx3UmdKbGlDMTZybit2?=
 =?utf-8?B?LzJGcnhvaDlDMWxVQUVLS2Y2T0JVWVZHMTlIZTZWVmFYK2g2SWRjWVVTT1lt?=
 =?utf-8?B?RlZlN08zVjN2RS9WeGNxZWhOWGZCV0NGdXVKbnhBSHVBWmdCZXZDbjhZZnAw?=
 =?utf-8?B?bFZjYmQ1TVliNU1ZNEE5YWg2RFBwamk4d2J0bk9tQWNCZnUvMFpCK0VudnJh?=
 =?utf-8?B?bU0yY0cxVkZQOGJOMm5wc29XdjVQZ0czZ2VreCs3ZExvb1E0ZUZZYjJ5Yk04?=
 =?utf-8?B?ODJqbXEwNm8rVEdqdEo1dmVvQjMrK2lNUmtPZFhTTkhWNGEvMVo2S00wVmZ1?=
 =?utf-8?B?SHkyQmtodzdVMDJiZ2F2cUFJbWV1ZFVIZ0p2TG5Mc3hMT1llV2NKS0pQNDlZ?=
 =?utf-8?B?bWh4WTlhbW0yb2E5QjFKdkttVWQzQTJPWlBjRUxxWGJEQU9LNmhaZW8rQWJv?=
 =?utf-8?B?aFJuM0JGZ1VsRnJwZE91VWJhdU1ZYlVaTkVEVDh5RHNnb2lwSklUOU5qbXlv?=
 =?utf-8?B?SThObGFqa2dqNVJWQWFRc0tEVzZsb3plSitELzUyR2Nwc3VHTXphcWxQeEFN?=
 =?utf-8?B?d3VBSnlORThJbFl0WEg2WUsxd3lkUUx5UDVVbDhxYkRibU15dzBHNjJMMGdv?=
 =?utf-8?B?My9XaHd3TTB2dGEwL0w4WkZhUXlieFJEOWQ3cUhKVFE1cjB1YSs5akZaTEZk?=
 =?utf-8?B?THVJUU9hblNaZ1dWaFR2NXM3bW1ydWdEcHo3anJFNFdodmxjTFdHMmREK2RU?=
 =?utf-8?B?VWNqcHRKVi9Vemlycm5kb3U4UlZYWUlSQUg0WnFmR2wvdWU2bEdVOXZidmc1?=
 =?utf-8?B?OHVCekZwazlGMWMrK045VXNQTllmVnZWN0QvQTR5RkNHSncwSWRUYVNTSk0w?=
 =?utf-8?B?WFN0N3gwdnFXZlg1UjBtbXk2Z1UwVWVIQXp5a05vRy9PWUNONE5ac0JHYW1Z?=
 =?utf-8?B?d3lKeXUrWEhGUGk3ekFMNzVxZjNzMnEzRTdyM0J3MkJKbU5SNWZpL1hFWFZC?=
 =?utf-8?B?RWNlSjdmdjU5ejI3NG1mQTI5akNZcVV0ZTJ4UkZ5RjlIbXQ5R21tK1Q1d3pC?=
 =?utf-8?B?UEhNQWZiL2JWUXFSYkVwZllSVi84dmg5a05ZSHZYdVFSNDRpbGJHczJoYmU3?=
 =?utf-8?B?NE11VEpSY2ltUnhyTGptOFNkZE0yTWNoQ1VWWlA4aEh2R1AydCtobnFTcVA2?=
 =?utf-8?B?emxhNDMzWUdqSkcvNDZuVWswNkpKRSszMkxzaGRQQ1RIWG1vVHdqdjRESnl5?=
 =?utf-8?B?Y1YwVnZPNkJVbG9hTVA4RHhUMFo3UkhGVnhqeExoa1M1UGpkZ3VaSlcwbXFp?=
 =?utf-8?B?SmduYXhRM0FTa2FtRVJqZHYxRmRCM2NqRjJ4VWxOcW1jUHZnNmZhaDNWVUV3?=
 =?utf-8?B?b2hiT0N3SW5vT2sxSnZkdERtQVNFWWlIMFkyWnpSZXZ6VVlnWXZOQjErVEdD?=
 =?utf-8?B?dzQwd1Y2ZkJVaVZaeVlxcEgvMTRKYUtUeGd4bHpiRnlDZWpHQnZ6Q3BMdDNu?=
 =?utf-8?B?UUN3aGJZd0FSN2pITEpBS2I3dVpOcU9TT3FXaTN6UFJyaE9LVUF2Z1RRVytn?=
 =?utf-8?B?WVR4dnZFekxiVUtwZXBKdmlSaHFYdHp0YXF1b2lJWE9UTHRLQnJzUEQxN1lN?=
 =?utf-8?Q?J5dVsyxkVXHdbR2elmuexxvZs3SJ0MenDpXEm/a?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6888.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anMrdnZJMTRUbnFseTRsUFNsTFhjUzhoUU1YOHNScE5LMzFYMk9qNGRDMmxj?=
 =?utf-8?B?MEs2dVo4NWx6N3BKM2hjLzFPeXVLQ2pWbFhVcE9NcnZ4RnBmNzR1MFlDVFhO?=
 =?utf-8?B?Sk9GSHFNem5iVCtMQnhoNVIzdjNvM1FsZFlESjJqRWFJN2hlcGZMdlVGVVVH?=
 =?utf-8?B?M2ZOVDZUbmczODJqYzR1MGVjYnlmOTUyMkZJRHBxclN6SDV2RFlIRkRxeW5N?=
 =?utf-8?B?NkRFZ0tIeUlzZlMwYWo3cVFsZG9uY1gxZVp0NmZFVUUzczZ2S0VvTDI3VDFM?=
 =?utf-8?B?TU4wclliaFpwWVpUS0dpUHBndFVpcllHTlUrVmJKKy9iR2phYVNmSEVxYnF2?=
 =?utf-8?B?MGV6Y21LUDJRWE5BOGh6Ym83WCswUmJSNDg5endRMFc1Tjk2UmprTTJRNXhy?=
 =?utf-8?B?cE1LWGQ0blBoQmdValNYNUg0NlVkUFBhQklCSFpVek1WNDdwK3ZzSDhZZWlr?=
 =?utf-8?B?b2lUYUNlOXJyMEY2Y0NldUwrNkdkcHV2bGt6cHZ1S1U3NEp2cnhjMG85TGhM?=
 =?utf-8?B?c2RQT0pVaHdMK2lIeXR0T2hvUzhmTEs2TFhhL1YwdzdNbVQwNVlxdCt2czYz?=
 =?utf-8?B?U3k0RVdWbTZmdTVVTi9NNDNVa0o5ZlFkL1p0ZlAxS1MrV1BjN2sydjhVcFg0?=
 =?utf-8?B?VWs2YUhXUCtOdFlMUC9wd21wRXlMNmRLcWdZRlFuQk9UZmNtMUtEMzNueUpl?=
 =?utf-8?B?aDhpeTlwT2d2bytKdmlVcjZyU2VJNVZkNS9VMjdPZ2Rua285azBkMG5xSUxa?=
 =?utf-8?B?ZkQrYlhRM1Jtb3BWQzNpcGlRaWRsMXN0cXB6TlNHTnIyNnl6c2gxNHhuQzlG?=
 =?utf-8?B?amQ0U1JiNHg3Zk9nR2NUdHRWZ1J1V3B4aVJVcUpoTWQ1QkJmdTB4UHA1bE1J?=
 =?utf-8?B?UXVRNjhXaUFOUlZqRWkrZkxhdEJmNmRBcHd2Wm4zaFlJTjVSTmxWMENIZG5P?=
 =?utf-8?B?SEFoQnhxdzlRY0syTGdpbU5SY0xVVmU1OXR1TlhGeE5DRGh2aGxOdW8vazNl?=
 =?utf-8?B?ZTNJd0xZdll2MXNnYVFHS2JxMS9XNE92MXlQWXU0c0p2TmFIdjVaNVdPeFJ4?=
 =?utf-8?B?cDVQVTZSQ3ZaSHZpTEVTdmE2bU1GQ1VJYVFPZWdpM2VpSmtqem12bzBtS1pn?=
 =?utf-8?B?aWJNMERMTzlRTVhQelB6dTdHY2xZbFZiVGlEdHZtQkcxZHBnQVVCWnNzM094?=
 =?utf-8?B?TlZudWNOYXhXNlhYemxhSWd3dHBBRHJ3eExJUmQ3Y3hEVUx0QTZqdHdBUGV1?=
 =?utf-8?B?Rk94VnNGUUdma0ZmSmtyeEtWYlBKMWJGVGVUK3luUEg5WlVSaHhjMkZVY21E?=
 =?utf-8?B?VFVxdFVKdGR5NG9WS09PZTlGTVBJTmhLLzJsdUJSQUtydXNkV2tMN3lsWGlF?=
 =?utf-8?B?YTgzR3dTZEltTzVpQ1FYYy9mWm1ibEZ2SmV1VTlWVFhuTGthTGhJNldsei91?=
 =?utf-8?B?cGpLNzlvcDd4VEhyRTRuay81RXZsODZmYUtjSTJGR3pCa1NQOFRXdGdDcU9S?=
 =?utf-8?B?cDM5azZ4M0MzN0ExbmNoZFp6cElSWlk4MVBEVW9ZdjlLVWJ2b2pSU1YwOWx6?=
 =?utf-8?B?c0k3QnpKanI5cmFib2dUMFIrR3BtMG4xNk9Qa3RHWGczL2pLc2lSMkptZlRH?=
 =?utf-8?B?bmdVVzE4RjM4M0MzbjBtb3BQU2ZmZ21SdmM0bWQzRzhiVFRmTDNWVzhqdUoy?=
 =?utf-8?B?NW5PQ1pSSkdKa1llb0dsT1J6aXFTcmpGNlhjcnR5bm1LQkoyWTVpb2xyVG10?=
 =?utf-8?B?M0ZybUtIWmxxK1N6ekY0YWQwMFNXRGk2c0NoY3EvK3IwQmZJV08yT1U5bUt2?=
 =?utf-8?B?YlFpcXNBaTl6TkM5cGJBbzhDRHRLRHhSWkhmM00zc2dvVnVtUE5tNk9ZQW9W?=
 =?utf-8?B?OXlxK2pIVzIyUU1SajhLdDQwUnpzekRXdnRyUzhOZFhkcDZQM2t1MXFpNUVV?=
 =?utf-8?B?SC9KM0lzY2laa2tmQkZjNlJzalZxdjdVTTNCNDl1N0RYUmNpMUlFbzZUeUdr?=
 =?utf-8?B?V0ZYMGFMMThhK0g5TTIzNjFWQzRvNWh3azIxY2llRU1saHd1VmJhcktNRzFB?=
 =?utf-8?B?cGRxdDlUWTNOd3dUSVR2R0VQdGhsd05TbzJzc05DWWVLM0E3SHMrcm0rYnRx?=
 =?utf-8?B?enlNeWVBMEE5SXlMWTNtbDc3QmpKZHJWWEFpdWZyTGp5RiswSGcrL1ZEYzJr?=
 =?utf-8?B?VlE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 457c2115-b14c-48b3-eeb2-08dcf7372c6f
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6888.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 09:59:12.2596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hfsg2QqbOA4ZcHGNl+Gzo3czxxXSuFaS8ac+ctkF1HUiaHA6IDfeRqv016bBzuIL5IZGgQehEhsdfurCyYuhW8SlGEZS1/es7uWmtjYxog0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8320



On 2024/10/28 17:46, neil.armstrong@linaro.org wrote:
> [ EXTERNAL EMAIL ]
> 
> On 28/10/2024 10:36, Xianwei Zhao wrote:
>> Hi Neil,
>>     Thanks for your advice.
>>
>> On 2024/10/28 17:09, neil.armstrong@linaro.org wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> On 28/10/2024 10:07, Xianwei Zhao wrote:
>>>> Hi Neil,
>>>>      Based on the current discussion results, GPIO index macro 
>>>> definition does not belong to bindings. If so, the pinctrl driver 
>>>> keeps the existing architecture, and use numbers instead in dts 
>>>> file. Or the pinctrl driver use bank mode acess, this may not be 
>>>> compatible with existing frameworks. This is done by adding of_xlate 
>>>> hook functions in pinctrl_chip struct.
>>>>
>>>> What is your advice that I can implement in the next version. Thanks!
>>>
>>> Keep the driver as-is, but move the header file into 
>>> arch/arm64/boot/dts/amlogic like it was done for the last reset 
>>> controller support:
>>> arch/arm64/boot/dts/amlogic/amlogic-t7-reset.h
>>>
>>
>> I don't see examples C file applies dts header file.
>> C file need to be defined once, and this needs to be defined again in 
>> dts header file.
> 
> Sorry could you rephrase, the sentence isn't clear.
> 

I'm sorry I didn't describe it clearly.

The pin index definition is used in driver C file and in DTS files.
It's not like reset definition only used in DTS files.
If the pin definition header file place arch/arm64/boot/dts/amlogic, so 
the driver C file needs to be defined again. I don't see examples of how 
a C file applies a DTS header file.

> Neil
> 
>>
>>> Neil
>>>
>>>>
>>>> On 2024/10/21 23:27, Krzysztof Kozlowski wrote:
>>>>> [ EXTERNAL EMAIL ]
>>>>>
>>>>> On 21/10/2024 12:38, neil.armstrong@linaro.org wrote:
>>>>>>>> ====><=================
>>>>>>>> +/* Standard port */
>>>>>>>> +#define GPIOB_START        0
>>>>>>>> +#define GPIOB_NUM  14
>>>>>>>> +
>>>>>>>> +#define GPIOD_START        (GPIOB_START + GPIOB_NUM)
>>>>>>>> +#define GPIOD_NUM  16
>>>>>>>> +
>>>>>>>> +#define GPIOE_START        (GPIOD_START + GPIOD_NUM)
>>>>>>>> +#define GPIOE_NUM  2
>>>>>>>> +
>>>>>>>> +#define GPIOT_START        (GPIOE_START + GPIOE_NUM)
>>>>>>>> +#define GPIOT_NUM  23
>>>>>>>> +
>>>>>>>> +#define GPIOX_START        (GPIOT_START + GPIOT_NUM)
>>>>>>>> +#define GPIOX_NUM  18
>>>>>>>> +
>>>>>>>> +#define PERIPHS_PIN_NUM    (GPIOX_START + GPIOX_NUM)
>>>>>>>> +
>>>>>>>> +/* Aobus port */
>>>>>>>> +#define GPIOAO_START       0
>>>>>>>> +#define GPIOAO_NUM 7
>>>>>>>> +
>>>>>>>> +/* It's a special definition, put at the end, just 1 num */
>>>>>>>> +#define    GPIO_TEST_N     (GPIOAO_START +  GPIOAO_NUM)
>>>>>>>> +#define    AOBUS_PIN_NUM   (GPIO_TEST_N + 1)
>>>>>>>> +
>>>>>>>> +#define AMLOGIC_GPIO(port, offset) (port##_START + (offset))
>>>>>>>> ====><=================
>>>>>>>>
>>>>>>>> is exactly what rob asked for, and you nacked it.
>>>>>>>
>>>>>>> No, this is not what was asked, at least according to my 
>>>>>>> understanding.
>>>>>>> Number of GPIOs is not an ABI. Neither is their relationship, 
>>>>>>> where one
>>>>>>> starts and other ends.
>>>>>>
>>>>>> I confirm this need some work, but it moved the per-pin define to 
>>>>>> start
>>>>>> and ranges, so what did rob expect ?
>>>>>>
>>>>>>>
>>>>>>> Maybe I missed something, but I could not find any users of these 
>>>>>>> in the
>>>>>>> DTS. Look:
>>>>>>>
>>>>>>> https://lore.kernel.org/all/20241014-a4_pinctrl-v2-3-3e74a65c285e@amlogic.com/
>>>>>>
>>>>>> So you want consumers before the bindings ? strange argument
>>>>>>
>>>>>>>
>>>>>>> Where is any of above defines?
>>>>>>>
>>>>>>> Maybe they will be visible in the consumer code, but I did not 
>>>>>>> imagine
>>>>>>> such use. You expect:
>>>>>>> reset-gpios = <&ctrl GPIOAO_START 1>???
>>>>>>
>>>>>> No I expect:
>>>>>> reset-gpios = <&ctrl AMLOGIC_GPIO(B, 0) 1>;
>>>>>>
>>>>>> but the macro should go along the dts like we did for the reset 
>>>>>> defines,
>>>>>> so perhaps this is the solution ?
>>>>>
>>>>> OK, so I said it was not a binding:
>>>>> https://lore.kernel.org/all/u4afxqc3ludsic4n3hs3r3drg3ftmsbcwfjltic2mb66foo47x@xe57gltl77hq/
>>>>>
>>>>> and you here confirm, if I understood you correctly, that it goes with
>>>>> the DTS like reset defines (I assume non-ID like defines?), so also 
>>>>> not
>>>>> a binding?
>>>>>
>>>>> What are we disagreeing with?
>>>>>
>>>>> Just to recall, Jerome asked whether you have to now use arbitrary
>>>>> numbers in DTS and my answer was: not. It's still the same answer.
>>>>>
>>>>> Best regards,
>>>>> Krzysztof
>>>>>
>>>
> 

