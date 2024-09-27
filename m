Return-Path: <linux-gpio+bounces-10486-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C37987F44
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 09:20:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EB3E1C22D7C
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 07:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F55017E000;
	Fri, 27 Sep 2024 07:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lc/wKUky"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2047.outbound.protection.outlook.com [40.107.241.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF5A1D5ADE;
	Fri, 27 Sep 2024 07:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727421612; cv=fail; b=WKEbiGy4/r4ooDSvE5EVbdk4+F+Dll/84TluAP1qAExX2B1qNyd7kLFYdIhOCTTEu/ttoJj54Aqy95+2DUX+5qonw4d90R+W+5Qxwm8t4Plc8/UYFCVvQQ6occYPkm0Njf9v/2B5YjzTLPnfb1grjYdFPaw6XI6yJphki7reG5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727421612; c=relaxed/simple;
	bh=yvwBVEVfL60FT4XC0FOeoSlTZ5KAIogDCGx708pQK1I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CeGrhSy6NUf7Lfl1kkbgbXYVwq+WidBj19iaTYL1hlAyO96aN52NpaWXRQmkh2Myv983/SYwA6n8HdHQWmPe5Zxz7LqVa0OaSOdwJHLOW0+W0A6maSjmF9fr0n9YzJAbwBUtVJEIe8wn0FxzjmlOT9n0YgCzMxYJG474d08mDmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lc/wKUky; arc=fail smtp.client-ip=40.107.241.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IabowfnQ0KuwEb8EMDCHxJePlQxmgMTp3uqc7A69ysTkuZ1PhfOZfft/rzTP5iZwd4bklMj/q8X+bXH5WjdqhiGEOInQXUrQi3uU6T8f3elA3FbfM95Vqj4NC97iZruS4t6mi6NWyhRcBlXVmlFGwelaQtaDKVFXm6hNeCMp29Ema6l0SJtuCqLGeAT3t7Y635cqR2NZ6XLiC8C04eppILulznEenRMOFUbrvA1+zfve6tASzruHjRxpurV47cK5XgYpqq7owqIxwXDmMeISbpma/IJbyvpLLmn4vHe6Kf54dMNFr+ziVglTCHB2WwM/GlfFyJcKCVV4QJBr1+s+Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4CvyRDFKNYwZwedg0OEZmCxfeGX81gSuaIz18bgWQQ0=;
 b=k8/CZKZGcTlYzemqj5YeNwLXKNkeOgyegrtEke9AK9UwqJIDnCf5GE7VBAmpmskdaT2ZlFZACivzPWt8kLVjC0pSYEv9/TKfMFDnI8EnTP76RGyZagcmg+oLj6Mnv1ZLtUw2lKADxDOpMpdPGGKNRD8Nh/jlsr3WkbGqSD1rfgRoclO3HFnvw5VieUeQayqF7ga6eAa6nQ107dbwn9DdwWVBlr5NSkF9V/powqjS6HFj5UcpVZvMG5TJudX9dWvYh8q5BuiurWddMg7QUArkWIl1F1p/c2IXZhpkDcEVjt1ppH6BIrSzBlt2h01pH2wTw4jWlfnF49kodqLCLBWMrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CvyRDFKNYwZwedg0OEZmCxfeGX81gSuaIz18bgWQQ0=;
 b=lc/wKUkyMomzDjOupx+7Z3fGm6PDoLO5r3ryQbvJLtxZj3lG5hkNfYgNnyr+LKJGXfI97UXHWs/1JH2MFTzOQnb4r/3iJE2yayYbIFQnJGvbEcbw4SWovIDbX3PWTCc5G5amVVQQKBcVIX6KQtNN3Or3/UmLQaJNucXxqvgAgKjJ6k4BWK/bneyoNmhxFFirLLLfHz5gJfVkzuq8TRBD2A78JavVlYlpXsUBay3es9YbI6ZL6r2ToP3OfnFw6051hK32bp1L3CMTcX/yIItSuDMcticEz7nuYKhhgFZ+om5zYEZZzCZfbLTEbiHsn6oWJvdbU62Dmlk62AfW2Ik+uQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by AM0PR04MB6787.eurprd04.prod.outlook.com (2603:10a6:208:18a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.21; Fri, 27 Sep
 2024 07:20:06 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.022; Fri, 27 Sep 2024
 07:20:06 +0000
Message-ID: <0db056b9-f420-40b7-8757-ed572c65c817@oss.nxp.com>
Date: Fri, 27 Sep 2024 10:19:55 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] dt-bindings: gpio: add support for NXP S32G2/S32G3
 SoCs
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Matthias Brugger <mbrugger@suse.com>, NXP S32 Linux Team <s32@nxp.com>,
 Chester Lin <chester62515@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Christophe Lizzi
 <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>, linux-gpio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org
References: <20240926143122.1385658-1-andrei.stefanescu@oss.nxp.com>
 <20240926143122.1385658-3-andrei.stefanescu@oss.nxp.com>
 <172737263813.2649710.12417820280324530724.robh@kernel.org>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <172737263813.2649710.12417820280324530724.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P195CA0046.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:65a::27) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|AM0PR04MB6787:EE_
X-MS-Office365-Filtering-Correlation-Id: 5000bdbe-74be-4fe7-1a1a-08dcdec4cfb3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S3RsVjFiL3d4bGZLaGw3eS95OHFrQkFIdzRxdlk2eXluKzhWVVAvc3UwQmVD?=
 =?utf-8?B?NmRTVXlJN2hXTEVIaGVaaFRTQ2tBWFR1OEFHdjQvUnRFUWw5QWZjdkhIb0U0?=
 =?utf-8?B?Z1dyWHEwRlVWYytwYXZjQzNBa2hhVW1kdWZ4b1QydHpmUjVNMnpMK2lWVWRk?=
 =?utf-8?B?NDRKQTdDc3l2MFBtNU9Xb0NkY1Z0aUxUaEdIam5HYjlHWlU5aitIM2pXWXc0?=
 =?utf-8?B?bVdlVEJMVVQzeS9adlhNMVFuWlFRRWErRHd5M0ZmOHNsMXZyQ2JydzFSUEVy?=
 =?utf-8?B?elhVN3hkNll6Ny9PWDhidHo0UUNUM2J3MklmdHNZMHpOQWcwdU9Rb25HYTVZ?=
 =?utf-8?B?MVppODBmdmpCMVNkeHFwTW5YOUFleUxVNHhEMmsxOXVuNkJjeVB1dVVoeHUv?=
 =?utf-8?B?UzA3aDNtdW9mdjFlVVhkcitobUw0eEN1T0FlcGRMZGQwZ0JIaDZJME92VXIv?=
 =?utf-8?B?MHRUL3hOaUpPdDJJTm1SY2hBSG1iYVRWRkRCODljZjRBbnBqcFlqNXNlTlhj?=
 =?utf-8?B?TW14QlNtOFpHVkdWbVdZaG5QWGp2blA4M1RTTTloNEtmWTVNVmxhWjh5K2Y0?=
 =?utf-8?B?R1cwMVMyNnI0VTNBZ1ZBcExYUDd0R3cvYkx6ZUxjb1BMc29QQTk1Nkt2dDFL?=
 =?utf-8?B?eUJ3ZzM3VzFtUWxGVGVMR3hyWU5qRkx3R1BQQUFiM2h5SGwrTXoxdmtOUTJX?=
 =?utf-8?B?M2NCaXFJRmdyL2luekRQUktETkIyRnVUUkVlVXlyaDJrT3VoaURNckVscTZD?=
 =?utf-8?B?Zjk1WWVXYkZsTGR0VXdHRGljdzhUZUhIWHpQWWZzdktFWEo5V3V5QVhmTm5j?=
 =?utf-8?B?N2oyV2c4Zy95d3drMzBLTFRMNUFMMFNQb21vT0xPREw1WGhydUZEYWZ4MEpB?=
 =?utf-8?B?VlVUSTlHKzJPRjlNWkd2alpqL3pFUmtBQnNFS2hQbTV2ZXhFUTZuckJER1Zy?=
 =?utf-8?B?bjY1cTBaQVhsMTV3anRRemxNTmhaSEJvK2Q5Y0t2NjVXR2dNQTdxRE9jemww?=
 =?utf-8?B?SW5iY2ZGSUpkQkZmQlFsZTV5cGxGZHlqMERmWjY2b3NKSmxUd0M5QTBVUWlr?=
 =?utf-8?B?bVVCRnoyR1RTWlQ5N3c0bkVkZUt6V1h5MEswQnFqRjM3eHNrTXdtbTZ4K2k4?=
 =?utf-8?B?QkJoaEdLRVpLZUVTM0x1YmZGRGNPTWpQUnA3dUxwTi9FNTdEaWY4NVVBVFNX?=
 =?utf-8?B?ZjdqWDJqVFl3MS9DVHpjMFNrcEFIZ1huUVl5aCtUaytaZ3ZuNWx0WWJPY21w?=
 =?utf-8?B?SmE2QTQySktFWU53UXZuRW1UUmdLM3RzdjJoeGp6L04yaFpaNXl5eUZVWmRy?=
 =?utf-8?B?c2JERjgyV0lFY2s0dkFsQ1hOZ2RCZGhLcDJmTFk0ditzODNwSDRXQ2dyMXd3?=
 =?utf-8?B?MlhVYk5MZmxhdC8wdzhqUVd4bTh5MkxxV21xaU9pTE1yQ0l6c3l3Sk9uOEtQ?=
 =?utf-8?B?b294YlUvYWpya1ozQ1hObWRicXFWK1VPQi8wZnJCS1A2Y09TNGZzTVR2S1V0?=
 =?utf-8?B?WUl0SWVOa3F3bFcwUDlUNHo1cE8ySk0xb1FlanB0MWVsSWRoR2dGTlB6SUF4?=
 =?utf-8?B?aVdDMFh0b0oyVnBXeEF5ajRBd2JRKzBTUkQ5czNlVThQazc0a1ZFNzJJK1Rk?=
 =?utf-8?B?WWRpWmhlN3pGTmsveUFMdGNBTlRjMUhhUG9nOUplcGxkbjZhbjJjelNpQzBm?=
 =?utf-8?B?UkNiL3BNcVhYbVMzV2hXUWVEQmRFdWNSa0p5WXVOL05vWkxNZnJwQzJ3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFQ4NURRUWd6WkdHeTRQUExsdS9kakhSYnFDRHRoMDZ4Y2k1VzY5ZW9qUkVM?=
 =?utf-8?B?aU53aHRHS2dtTHloVk1YMFZuTmxMV3Qrd1VKR1cvUkdjUGR2UkdrcC9ReVNv?=
 =?utf-8?B?aVpwQ1dHSkg1K1FmSU53NnI4OG5UVVR5WUkzMzNjK2RtSkVDc3RYYzFpQUhO?=
 =?utf-8?B?Yzh6OGFxYzErdEJyaFZLck9pRzAwV0k4dEFMVDlScU1oWHNBdVlrZzdPdWNL?=
 =?utf-8?B?NlZjbXV6YXlobWR6MHRRbU9LVUVlRFV4QllRYlg4cXQ2cWdlc3BTTXVRc2xu?=
 =?utf-8?B?OTVDSmRTa1puTXBzYUlOeDduUVdTSUE3SEM5OXlqNHhza3hNR2lGK3dET2NZ?=
 =?utf-8?B?bWxDRkR1dHJGMWFXZlU4MEN1RXF0N0RLd1J2a0MzN3hzektaT1EvRHRpQUhv?=
 =?utf-8?B?VXJFSnE5YXdaRkwxRzZFVWowYXgxd0QzL2VOMkpzNjVFM2I3akx5eHJwb0cr?=
 =?utf-8?B?NFJFYVg4QnM0dnNuK2lDcmdYbnFhSG5OeFZzS1h3ZUF6K053YldZQmVVNHlq?=
 =?utf-8?B?SXdReGZqTzBJZVJRZElONjZCWGhRYWs4dGVZejFYZXAyakhmWHRpU3Zac0VS?=
 =?utf-8?B?QWFDb1d2Yjh4Zm1CcHcra1lxcXp5aHAzTTl6WGpwSHJWK0ZoR1hUT3ZNVGZ0?=
 =?utf-8?B?WktWVWJsaWMyL3dyUXlMaXp2dFVlN0k5ZU9uc0VXSjBCUWl6SDFCcHl1cHkw?=
 =?utf-8?B?Ly9KME1DT0dNRGlkQWdJM0RVUklFRW93ZkN0NXdrQ0M3bStmK2pXWmlPaFZz?=
 =?utf-8?B?bWYvMFU2bURtVnRmYkVQR05ZSytRYTBseFdKUnFSTE9mUjR2REM3RGd5SDhO?=
 =?utf-8?B?ajFKK1dNNmZyYktYcGJPVUtKZVVkMGhLSjBTOXF0blpDMEhYSHVPcVBuWkZp?=
 =?utf-8?B?TXdSNDRPRklyK25lMmNYZFcyRXlQbGNPQ0hadWc0TXpWR0JXQzM1eWxqNlFk?=
 =?utf-8?B?dzUyZ2RERnNPWW8yL1JmbzBUSGhzOEpPZ1dleXZ0YmtVRGo3L0pMcVViVXRY?=
 =?utf-8?B?WW5sVkR2ZklkSTV0cHFTVDhUS25WWmN1UXl4YkY0anNUTnR4TDhxRVp0OFNS?=
 =?utf-8?B?eFFaNGQ4MFQxTXFOeTNKbVBIWGVpV29DZEQ2aUI1bVFyTldpcm42d0dBd2xi?=
 =?utf-8?B?cmRwSTZEYWZ0Mk03dHREc1ZsV1h6YVkxSXBWanIvTXd0NU4vb0F3by9lVG81?=
 =?utf-8?B?QzRJZDlldVo2Y09MWGt4dCtpakFxMDJTaHhJUTBVVE1GalpUenZ1a1N3V3Zm?=
 =?utf-8?B?U0pJK3ZDbUlYVko5NkExY2htbTVQY2xkM1ZGV0l3THFMWmc4aUc2dWExS2hn?=
 =?utf-8?B?K0xWVHVubU9DcVVpVmVYNkZXMmZLQ1dEaXc0WDVnb1pUNHBxc2xpVlcwM29P?=
 =?utf-8?B?dVQ5T2U3UE9NSGlBTXh3ZUdDTytDWENyRmdnMDVGS25uOFhlZndxVmw0Vmw2?=
 =?utf-8?B?TUVVaUtrYlhQa0oxYjluZlpsMlBWaVZRSUpIUGs0b2Ftc0liL3FEZ3pLSHor?=
 =?utf-8?B?d29PMUpTRXlNY1FBY2FKK3puWjVDVjkxVnNiUGRYU3lXaVZNZjBrWUMzK0Fi?=
 =?utf-8?B?Sm1rS1lOZSt2VTlFV21kbURGaGZwRklXU3Q3cllGWkYrdTc0cFlhQkpCa2du?=
 =?utf-8?B?dnNETktTbFE5TTBPQUQ3Rlpab2NsRUlBMkFwUWhZTWRLYTh3S3l4ejJmaTNp?=
 =?utf-8?B?SFphdjhWS0gxRFA2RzBoMmZCTnFOcm10akl3bDdBTjZjTW4yUjh5TUcxc1dv?=
 =?utf-8?B?bFdKakcxdW05eXQ5ajcwbExvbnNDb0tpcE5NenNBZnl4bytXZGh6SGNrN280?=
 =?utf-8?B?UTlNZGVKamdsZ1pmQytYU0F6VWhvZ3hFQkJrWllRRERYSEc1bmlpeVZJcU9p?=
 =?utf-8?B?V0RNelYrQm1tRGx0VzNDTEcycXFOaUUvNkVITnV3dDZaV3F1Z1VDamFsYWpR?=
 =?utf-8?B?N0FVY1p3c04wbXdrS2phd3FwekNjTVg2azVZTVhVcHNHTTJKaDh1emNuVG40?=
 =?utf-8?B?YlRrNDUxaGY4MEk1dktZSDMzeUtPdzR3ZzJIZytDOGtzT0hadnZ1R1BhQXYr?=
 =?utf-8?B?b09rWExzdGhJMTJ0M3V4Q09sVTBNeTM4eXlaT0FCRy8wenJ4eW1tWUJUbkZQ?=
 =?utf-8?B?UHVZWnhlOHA3UHBkenJiT29oUThhUzZOellkK3JFNEh5azhYSThYdVYzdGlM?=
 =?utf-8?B?SUE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5000bdbe-74be-4fe7-1a1a-08dcdec4cfb3
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 07:20:06.0897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TpCtOAOPf0MOUEVFUu64FdG1UfdLPwpB9hYqf1RYz81Qbw9gvyYONoSLZuESA4OdNjQCc3ml0mLnIrfigWkNCNmJNnbN1UnFiE8UoTMjLDo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6787

Hi,

On 26/09/2024 20:43, Rob Herring (Arm) wrote:
> 
> On Thu, 26 Sep 2024 17:31:19 +0300, Andrei Stefanescu wrote:
>> Add support for the GPIO driver of the NXP S32G2/S32G3 SoCs.
>>
>> Signed-off-by: Phu Luu An <phu.luuan@nxp.com>
>> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
>> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>> ---
>>  .../bindings/gpio/nxp,s32g2-siul2-gpio.yaml   | 110 ++++++++++++++++++
>>  1 file changed, 110 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml:25:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

I don't get this error locally:

$ make DT_SCHEMA_FILES=nxp,s32g2-siul2-gpio.yaml dt_binding_check
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
  CHKDT   Documentation/devicetree/bindings
  LINT    Documentation/devicetree/bindings
  DTEX    Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.example.dts
  DTC [C] Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.example.dtb

$ pip3 show dtschema
Name: dtschema
Version: 2024.9

$ yamllint --version
yamllint 1.35.1


Lines around 25:

 20 properties:
 21   compatible:
 22     oneOf:
 23       - description: for S32G2 SoCs
 24         items:
 25           - const: nxp,s32g2-siul2-gpio
 26       - description: for S32G3 SoCs
 27         items:
 28           - const: nxp,s32g3-siul2-gpio
 29           - const: nxp,s32g2-siul2-gpio

I initially had the reported error but I fixed it locally by adding the following:

- description: [..]
  items:

Any ideas?

Best regards,
Andrei

> 
> dtschema/dtc warnings/errors:
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240926143122.1385658-3-andrei.stefanescu@oss.nxp.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 


