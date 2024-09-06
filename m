Return-Path: <linux-gpio+bounces-9892-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BBD96F39D
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2024 13:53:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 31E14B25111
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2024 11:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42EF81D0963;
	Fri,  6 Sep 2024 11:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Y2T9zalC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011028.outbound.protection.outlook.com [52.101.70.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00521CC8BC;
	Fri,  6 Sep 2024 11:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725623442; cv=fail; b=JdlBVGd70eiAtZhDfYN+aelLqgN4Q6k5GUgRhdyE4DldogPaLddvrtirT2CgfpQAzX+BVML6aAhIUgRq+M2rrS2iLPmS6D//ayk2K1o1EVfUZry+iy4AxysI6Wd0yfHPIgIOwkjvp7+9gT3iBjtx4oI2jgc7pRSf9LmkdaK3hqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725623442; c=relaxed/simple;
	bh=668vttL5tK83Io/zl339S4ODGy4KF/yum198y+j4myk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pv1BYHb68BzsGRD3rL2KTuyVr0LPyXlPr15KWceZ13ORxaH/jZJeP0GyQ6v6+cUxAcBH7Ae+gzUcXdHVQ5/11s4ca8pIZVmNhgxsAbNZrrfF8vEHVlA3E7VpmPmZJ4Ni3kd8b8/De5DBymnU3rKT7j7O6woBOrA4Yf5SXoxlZnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Y2T9zalC; arc=fail smtp.client-ip=52.101.70.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rEJ2zgeaQVdNq8zhl5wz9k2HKyyzoUOq2f0nXf2W6Y/R9ENIYRmOorhL2rckyR0rlaF6h+CWYfKijoqG/iEOuOe5q27GiHbTH1buPK0Bup7dHBVfqpEKHc08Dmuezvj4fsxvy12EgqYNkB0gVbxWnq6Zw013VjtHL3pi5j//ZZEc2xjlSVssH/+/2+Xa7ZMEw1s4VjDxSq7czTMUUwVyaHmG427kcDksbg/+vMZ3ifeGNz1yaLgaMSCRvSxt+2cLkGUibWqNNH2yYqk0adx/xDhky8QrHERYmU7mVqDY1CTC0A9uikb7WdEpBJm2leq1SWQ5m+C+MkpsHRt2wrPqHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JNw5y110xDjKtR5EOWT7AdUC6ma241A0+cOffn/Vk3A=;
 b=oLkTT8FvXfwXmOFkih7Vxpd8db+22O0jBdWDQnHgJeWQA7CS2V3YvxPPQwDhpLepTZ9syMgTx6AChVWrIKjghszSVhN1Wk8B25TowFe00C0ECU3AUzvE7+J+S849KUlpKOpeC/FaR8SyxTWvPXn8A5kd3wAknxjKrGpwnuNyhOYfiHHeNI4esz6Tes6H+M6wj+PL/aYFDRB62cg6+sifzxdKki8ASasD/rLDqKIZ8BeJXr9JAkvmdr15hMg46/4qZD5/Db2baiGJSvZEqiDWXWQSF6ChUmiIjBNFqWxkSrK57urmh32SYyVu+Hk2DmoX4VRpP/qlHXKyTTJ64x/8mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNw5y110xDjKtR5EOWT7AdUC6ma241A0+cOffn/Vk3A=;
 b=Y2T9zalCFgsykYNSQFOOM1/OxazxsYaG8Ww/S7n9j0S5EPuXF2Z17EMyMnmpdCURO2AONprfz07BHQP3T1mgasq5jfnMpcdpFL6Ki8mnua6QDtsdTtdlsWxdBqb/XwvNCBZtwuUrDQRP1jLcqEjPJ4ruoKKBZFoQb+JCAJuoy0gSBoUDgWQVBfM6yhy5+tZD+V64E8EqAT7W3NfQTN/Zvb8xzDcLwMUHmBGr4QWpRNlOLx69yLWg4QFdQH/+NlaeVpfk6t9k8KwoMJWN8+BoLUgXjZ8NSGpBWWroyCs6Eat7V2af+wu5zt3T8BqHypIvUmLEcdSqKqo9MUb4BCSryw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by AS1PR04MB9359.eurprd04.prod.outlook.com (2603:10a6:20b:4db::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 11:50:36 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%4]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 11:50:36 +0000
Message-ID: <d934d026-92dc-4832-bb0f-556fe12947a4@oss.nxp.com>
Date: Fri, 6 Sep 2024 14:50:31 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drivers: gpio: siul2-s32g2: add NXP S32G2/S32G3 SoCs
 support
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux Team <s32@nxp.com>
References: <20240826084214.2368673-1-andrei.stefanescu@oss.nxp.com>
 <20240826084214.2368673-3-andrei.stefanescu@oss.nxp.com>
 <fd18295c-6544-4da6-aab0-6d6b9c12581a@kernel.org>
 <6a65f608-7ca4-44f1-865c-6a1b9891b275@oss.nxp.com>
 <3ab4c235-c513-4dce-8061-b8831ea548a3@kernel.org>
 <0ba90fcf-60b8-478c-bd9d-487acacdc988@oss.nxp.com>
 <d1f9d323-0f66-484b-a5dd-3ea1fc690c6d@kernel.org>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <d1f9d323-0f66-484b-a5dd-3ea1fc690c6d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P195CA0020.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::7) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|AS1PR04MB9359:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ee1f804-b732-491d-e3e7-08dcce6a1ebd
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TXVSWXhwR0lON2c0amhKV3p3R2NCTnZWY1pqR1NKUTI3bDgzTFdqS0pyNnpS?=
 =?utf-8?B?YU5kdXFqT2lBd3lHeWFaS3ZQY0tTY2pWRFA1Nzk3eXlJU0F6blZmQjV0OUNt?=
 =?utf-8?B?dFBHeVR5bjl1YkM1bHdMWThiZHl6aUgyaWFyejEva3Vxc0dZY29mcDhuUVhl?=
 =?utf-8?B?aW00bnFOT1lmbElIS3FlbEVITVRrcktQZ2tSQjRYT25IMHNjVnd2VktsMkdl?=
 =?utf-8?B?VTBsMWR5alRIcUoxRVBuTENZdXFQbUNUdWswZTRseHJpOVVFWjFIclhJYmFk?=
 =?utf-8?B?TGY4SU1NNDBEaGdMSFlhUWtwZ0F6VDlONVovTzgxK252ZkdlQnpBRHNLNmtW?=
 =?utf-8?B?Rko2aWNUeU42UWxKbWpwL2lxMEhYWUVZQUV2UEdhQldOQVUvWC9keFJoTkh6?=
 =?utf-8?B?Rk5Ed0lEU0RrdVEwZ01vWnBQR2F3MkVJaFpYeWtqU1B4T0FnNnBSalFpQjJl?=
 =?utf-8?B?TTU2bzZNam56TFFOd3F3WXVzVlhJWXpqYlRGYUxldGk2T1k2WXBKWldua2Y3?=
 =?utf-8?B?U3ZvcVdMaTZ6QWxIMk5uMkg3ajhkZjE0SlhOaFAybkZCY21FVktIcnlIcVZH?=
 =?utf-8?B?MTBCbXBCdHJsb2JEdDBtN3F6aUIwUytncmt6dzVDNjhpdkM4MFZJREJVRklk?=
 =?utf-8?B?SGhyQ0o3U0tjMys4MjJWRHpaQ1B5WXM3ZFN6NG1TenZXWGIrdDFQeVhIODV1?=
 =?utf-8?B?d3l6TlhvSUp4a2lYT2N1Tk1rTkFKNTBRN1I5V1kzYTNkSHFXZkh6ZFhJZzNR?=
 =?utf-8?B?STJZbTAyVFZ3bjFNblJkcDlUYUNWeXRMZ09QcnBTc2UwMEpmbTFPSVV4TGFv?=
 =?utf-8?B?QXVJYmF0VGduN25KMUR6b0oxTGY1a3FnSWVZaVBRTTZGMXUrYkdIZDJnV3M3?=
 =?utf-8?B?cnhhRE1kVzlhUGsxU3g4c2pzcWpOUVlrVmpHbHh0c3RIRm9zcy9mSjZyVG9h?=
 =?utf-8?B?ckI1OEFHYmsyUGFURjQvMGJMNy81Q0hrQTZveUVyS2s0a1BTMnNQd25SdjBx?=
 =?utf-8?B?cEtYU0RqZ2o2dk5FR1FKZUlMYVBSeTdhb3o5YVN1SFpqa21GdlJRQXJHQzdu?=
 =?utf-8?B?My9GTTEvRm5NTWNONm5iU1I2QXdEOVJTVWlNWmJoVm9CL2Rady9DeGdReFB2?=
 =?utf-8?B?UGpFWjFtbDdHZUJ3dGM0aUtJd3pOYW1hS1lwUHp3c25OSlM5bHNPM2ZLTm12?=
 =?utf-8?B?VjZmZkViSEJtN0ptNDQ5S1Q5MTM2TjQrYnNvRk4vWktQRlU1RHhiZmtGQnVw?=
 =?utf-8?B?ZGsyVkd4NkoxNzF0ekJoWWJRd0pOWWxKZlFrQnVYbE0yQUU3eUR3ZW91SDNX?=
 =?utf-8?B?UzY0aEMwV1ZrN1ZQQ0xZNkluZ0JZell2NWg5YXVmOXpJWnFrTUdJNXRoZ3lm?=
 =?utf-8?B?bSsxMDBMdVAxWU0vd1F0cDArcmU0NjFLTFlSTUV4Q3dqN3A1aEhhTDNLRGxo?=
 =?utf-8?B?R3VEQmRwaEtlRjF0aUNRSUF1UWxCNXlNT1EvZXo5b1FLUVo0UXhvbExpdTdz?=
 =?utf-8?B?SFZVN2J0RTQ3a0VBalNpSEpWSXZyaGVwS3JwT21QMlZieTBHLzJmNjBJZVRU?=
 =?utf-8?B?MWxWT2xlNnJjVE12N0ZrU0VHVVM2UnB0VHQyNlRZd3IvUFVEeGlVVFZaZm9R?=
 =?utf-8?B?eHUwRGM4V1pFSW9DQ25BY0I5V1hVdW52cHVlZWZzOE9KeXI2ZE5DTlZNT3Ro?=
 =?utf-8?B?S0FJRDA3MTBvdklacTNwOGN3NGN4MEY5Vk4ySnJwVmMrZVFYTzBHbTNzRTla?=
 =?utf-8?B?RkljMjhDa2FVcDRlT3JmQjhPemN6cUdvK3N2ekxYcTl5NDF6S2FFODhBUVBu?=
 =?utf-8?B?eGorcGl4SUt1cXVWOG5HZ3VMVXh0ZHhsV0QwNXhYZnpVbzZHYUZpeGpYZEUw?=
 =?utf-8?Q?KLHVccpuRM3O1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUNxcXdZRmFXYm5mQnBlY2ZIaWZxRlp4Q2ZrU215V0h2a0dJVFdpSG1qMkc5?=
 =?utf-8?B?ek1IVXBjNGxhK0FzQVlWV2p1WWFuL1paSlovclBRVS8xYkpDOEF2RGFRcVFa?=
 =?utf-8?B?TEpZVzV5UldET1pnZnpUZjBabGFJQ3NTRXRqSHFRVkFIZkVlTEFoeDV6dFlx?=
 =?utf-8?B?UVRkUTFReGx4bnJ4elMxRUxYRGEvNkt6dXdMZFlBVVE1SmRKTXBKN3o4R2Vy?=
 =?utf-8?B?c3RlSDI4c1NRL3BENnVqYWFzWE9IZUgzYVV4NUx0MVdMcGNiUmJpOHZvZ3Rl?=
 =?utf-8?B?b1FZMkI4R1F3cHRsWXZOVGFsc2NWQlFxSlFsZmlUUWFVNFMvcnpTZ2JFcm1J?=
 =?utf-8?B?Q1J3MmttWmQzRGQ1WC83MkRVeHU3SW50cDJONS9WV2RRbXJiNzRSRy9WUThJ?=
 =?utf-8?B?L3FvQ1g0TU82MWpBcGM0N2ZOVlZYOTljL1E4RjJubUVCUE9sOUZOU3VhRkpy?=
 =?utf-8?B?Y3E0a3prSXQ3WVdySk8vZlJjb2htaFVWTGY4eU1GL2NMTFVMTFJtYmlzc0Qy?=
 =?utf-8?B?K2J1UUt3TDZ5ZktIS0Uwc2dhbTNMdEZUbUYybWlEVHJiUFFFMTRpNjJ1elhl?=
 =?utf-8?B?WURITzJvWUpUUHR6T3d2YmsybEZFL1h0UkF4Nk1keGhvMDY2OFVtWkIreFl0?=
 =?utf-8?B?RGI5REFrbVVLNGdIVXB1c3R4RlZXM3dUMEsvaUIydmVWL1BCQkhielpOOUtx?=
 =?utf-8?B?ZXNHMFlVMFJoK2cycDNMTVp2SnJWVXFYK3FsS2ZXOE02SXhEVS9Ed2xXM1ov?=
 =?utf-8?B?VWVmNHZ4cG4xeCs2b3FTZzVRSTVUS1lkd3ZqOEIrZWgxRzZrQXZPS0dIa0o2?=
 =?utf-8?B?b2hSQTJta3JiWE50N1djR3FwQXp6ZFNKcWRjcnhPV1dzNnRvSUpzTDk2emVi?=
 =?utf-8?B?bXpUWVJZT1BXbXpkZnljRjU1VW15V1VaeHNBbWMvM2ZDM3M0ZGVaeDlMYTlT?=
 =?utf-8?B?VDA5QnJmcEV2WFpuNXR2dUxoczVORUlQL0h3K0JoYUVvbXBlNXFOQ0ZuUzZa?=
 =?utf-8?B?NGQ2VlI1Tko1RGpnWURGeFVvVFFNL25TY2tualFSYTNrTWg3UlA5bk9jbGsv?=
 =?utf-8?B?U2w1Zis2ZjNPR3VaYW1MSmlDQkdBa2o0d3RLdWJ2RzlOeXJsdTZUMkUzcVh6?=
 =?utf-8?B?V0pNR3ZobDhnSXFjVWVnbW1DcnhmMWloL3dRV1k1R2V5bE1XT1FlSWtPcURM?=
 =?utf-8?B?QzA2QnlsbzZpN08raExQNDNVQ3BNYU5QQm5CUldiQ3M0bTFKMy8xaUtHdkxk?=
 =?utf-8?B?ZkFUaTN4QTMxZ2JDbFFhbHdGdEdLblN3VGFzajRGanE4SEFYNVV4VitZQStY?=
 =?utf-8?B?TUFUUzhoOWgydkQ3bnoxWWVCL3VuSTlIUVJiek9uaEwzYTg4blBQOEhFQlAv?=
 =?utf-8?B?bk1QcHhISkl2bEFzRWhvVHhUaWpiSXNiZVpXRUFnei9veXZLaXE0c2lnSUFE?=
 =?utf-8?B?TWtJRG1ldm9DamR4d2pJbWc0aU9pOGVham41UGFNY2RUcU5vNmJlL2kvUGVy?=
 =?utf-8?B?TlRNRklVaVpOSmpScU9CTHRpbXRzZWRSMGZsRE1JVTVEZm96UmgrQTYrbER6?=
 =?utf-8?B?ZWdJb0pYL2Z5cnA5MFFheCtrdUs1WFlYdktKQTR5ZXVDUTVuYWNEVmtFQmxq?=
 =?utf-8?B?MEhSMDBOMllRUlVlWi9tUWVQVDdETTRNNURDMWxqYTA5bm83N1JpWVNPU1FI?=
 =?utf-8?B?Njh3WmJBY3RNRW8wZ3JxRXJROEZrd3I3MWRaMWY3eXM2UTFHS1JtK0Z3MllN?=
 =?utf-8?B?RXphTERtRGp2YU5IdXB3aTJya3VxNnZKUnRXRGpXcjlyVlFyczJTRkdJYTc5?=
 =?utf-8?B?dzA3VFdPV21rRFVNa3c1bTlWZFNvbzNjOXhGTE5yeXRWNW5WT1ZzT2NQZFRS?=
 =?utf-8?B?UHZlQW1QM3RQbWdTOFYxUFlrTUZXSUtYaGVqQWZJRVdDa1VTRWxManVJMnJH?=
 =?utf-8?B?eDVBV2hPL0ErN1M4TFBPLzl3WVNoWFN3Qm9PVEFJWk1TWkgwRERLT1VFYVJv?=
 =?utf-8?B?VTI1OGtlNk1zVHdScjRTNGdQSEEvdUhDczJYZ2h5Mkcyb0Ryb2U5R1dmbURR?=
 =?utf-8?B?TEdnOEROUXhlNzQydTNOMStBays2dU1ieTRySVRsV2U0WXZ2QkprbXE2WDZN?=
 =?utf-8?B?L3pKYnFkamdFVEZMWWtpN014Ry9VdmljcWZpRU4vUHpiSVUrWHpWc3VOeGQ0?=
 =?utf-8?B?MUE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ee1f804-b732-491d-e3e7-08dcce6a1ebd
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 11:50:36.0507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fC4cb/ZD6x8Nd8G4pOWN8Q/ZhIH4Mr/pVVxC4anVBT1uEDp7v7fmAjEt6Dy6i/xO3V9+0OhEge6ujNkCZE2Q/ocgGuNGaZjItoHVmjuvjQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9359

On 06/09/2024 12:53, Krzysztof Kozlowski wrote:
> On 06/09/2024 11:45, Andrei Stefanescu wrote:
>> On 06/09/2024 12:39, Krzysztof Kozlowski wrote:
>>> On 06/09/2024 10:43, Andrei Stefanescu wrote:
>>>> Hi Krzysztof,
>>>>
>>>>
>>>>>> +static struct regmap *common_regmap_init(struct platform_device *pdev,
>>>>>> +					 struct regmap_config *conf,
>>>>>> +					 const char *name)
>>>>>> +{
>>>>>> +	struct device *dev = &pdev->dev;
>>>>>> +	struct resource *res;
>>>>>> +	resource_size_t size;
>>>>>> +	void __iomem *base;
>>>>>> +
>>>>>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
>>>>>> +	if (!res) {
>>>>>> +		dev_err(&pdev->dev, "Failed to get MEM resource: %s\n", name);
>>>>>> +		return ERR_PTR(-EINVAL);
>>>>>> +	}
>>>>>> +
>>>>>> +	base = devm_ioremap_resource(dev, res);
>>>>>
>>>>> There is a wrapper for both calls above, so use it.
>>>>
>>>> I am not sure I can change this because I also use the `resource_size`
>>>> call below in order to initialize the regmap_config. 
>>>> Unfortunately, `devm_platform_ioremap_resource_byname` doesn't also retrieve
>>>> the resource via a pointer.
>>>>
>>>> I saw the `devm_platform_get_and_ioremap_resource` function but that one
>>>> retrieves the resource based on the index. I would like to keep identifying
>>>> the resource by its name instead of its index.
>>>
>>> So add the wrapper. Or explain what's wrong with indices?
>>
>> There's nothing wrong but I prefer to not force an order. I will
>> add a wrapper then.
> 
> Order is forced. You cannot change it. I don't understand your rationale.
> 
> Best regards,
> Krzysztof
> 

By order I mean the order in which the memory region descriptions are laid out
in the reg property. Currently, there is no issue if we, let's say, swap the order
of opads0 and opads1(as long as we keep the same change for the reg-names).

Just to double check, this would imply adding a new wrapper named
`devm_platform_get_and_ioremap_resource_byname` which would basically be
very similar to `devm_platform_get_and_ioremap_resource`. Is that ok?

Best regards,
Andrei


