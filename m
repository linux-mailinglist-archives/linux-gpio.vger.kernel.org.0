Return-Path: <linux-gpio+bounces-36252-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPYbJ/yu+mniRgMAu9opvQ
	(envelope-from <linux-gpio+bounces-36252-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 05:01:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1324D5C9E
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 05:01:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 90906302A7E6
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 03:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A177124A06D;
	Wed,  6 May 2026 03:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="kd3jwsni"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023092.outbound.protection.outlook.com [40.107.44.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A5521883E;
	Wed,  6 May 2026 03:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778036471; cv=fail; b=U3sfSgNBd/i01FXxp4kAkDWNcH0De8HuaXdQD/rlTcf/y18am6MP/V7gQ3QqHlyEXkH8Wnx4M7yZmQfXJQ+j4APrNueCGQfvVHTbms1L8qiRgvgUKDZ5Rkv2/xIAnOnAVuz3u6HHqV1yRqy8PKLvQh/jepzy8gonb5gn6NT4JIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778036471; c=relaxed/simple;
	bh=Apc+DJjD1MHAU6jHKum7PY8NeAZzp3m+rclcwLBzwgw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MztgncnVX5/1nP5+OJ749pKJDF23Sx33BQNctNpBQlXKgZSnKHe0I5EojiDhBrQntpiCyrcZr35j7PIN/ngcXzlx8KbBnQw9aO8eH8DBF8JhhpQXJcxymETOw10pbwTOoNIH/YzETsoyZKugSRg5HJrEMRPMbGYWhWM83Wc55eY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=kd3jwsni; arc=fail smtp.client-ip=40.107.44.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dCeUWrzEW/p6/gtrmL/ZKVjmYaU579mmxaMc+CAwd7QngDEvQl4nz/2Bu0tVKYUYEH+R0uHnkCub0AHLZQL7q5xvAsxxgT7gXFoA2MSdx4qgKEw6yfPUlNVkO9clF5HVluu9cch53swB4aho7XcnB2xyZvVb+qaMAxaVlq0Hw0MU3b8fN6mbkGa/zoN8sku6nmDARwBXijFZfAssekVmLgpfNKKzO1+c2NT9lcU9i6VIBd58MihtWsU+K+oLjHgonXhfbrBIFpxioIgsAKf7s8DHNdvNZ7SuP0l94cdk1dFZypYq0GWRvB/H7fkl9o6PyZPSc3WDS+HS40vuQu8sqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7eOBZwsrXFCTM4l3XtXY5lNGDZHI0rYvOXarCcz1Q4=;
 b=mj0Tr/VTRYO87nXgc3HSArsw5qFKKE31HH0lPFD+YxDT5PsBCZWsttAV5XGpHW5ooPSTO2UY4Ablq2HnbfSs9Q0lSK411exVS3noqz30rZnzrnjR7bZPkdBKmMjNWwEHKF7kknfuqiCJPu0hFd5CkcuaKBR5ljxjMXZNSyEwHkIItFypLba+G+TU3GJ7uDGhywyl5iGNtvn2YMoKmSqYCmIc2ieLFpHyE62SFebfZ9XYj2CJ+OF3U4qmmU5jC+/aJhbb64sN9zsLcTGO43qwhq9GuGRwqATDtU4AzSnSo3Zi3yok+7j+SKLfMta7nu4Gr9AzLbuDZKmOQTV1ssAU3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y7eOBZwsrXFCTM4l3XtXY5lNGDZHI0rYvOXarCcz1Q4=;
 b=kd3jwsniF6ulHyJaiV86ltsnJBkMZB7AbRn8tEGlAv3Mz5olm/XLcx34WzD6TMTzLxlu44jVHaHmu30Vi9ejzCaX3+BAK7OU6dNWmGjbDJku/1TwNi5+4APPbpxvyoBIvqBxCZUFFub4arb2agMEfBMZULGr9lL8wJ3j43qZgspTJsCxAc8UxYIfHVXPLrbOAUUHylS8dNDgCvDZVQfvIDxvm6z/DNuqZY1uYFHF08buC7sA6RfAGdLPICgxA0lZH0zi3IRsc3FijdRjneYyNbRZ69f/iGIpm/yuWyNRp+5neuJ3cXMHRF8cQqAPLWf8GIvDrvt2o23o/r2ZpM8/4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SEZPR03MB8156.apcprd03.prod.outlook.com (2603:1096:101:18c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 03:01:07 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%3]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 03:01:07 +0000
Message-ID: <a2dd374c-568d-4701-8197-14ba37acb3fd@amlogic.com>
Date: Wed, 6 May 2026 11:01:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for A9
Content-Language: en-US
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260428-a9-pinctrl-v1-0-cd611bb5f52d@amlogic.com>
 <20260428-a9-pinctrl-v1-1-cd611bb5f52d@amlogic.com>
 <CAD++jLkX27ceGQp4w9J=MDXmibo7h=Rzg4RdRJUGRvA67zj7vw@mail.gmail.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <CAD++jLkX27ceGQp4w9J=MDXmibo7h=Rzg4RdRJUGRvA67zj7vw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TP0P295CA0046.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:3::9)
 To TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SEZPR03MB8156:EE_
X-MS-Office365-Filtering-Correlation-Id: b65dfd89-58ee-43ed-2ea9-08deab1bb7e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	UsP9jTZvKCDp4PPti2YfcM8FbEo77Q/XQ98ctZprF03UvRajriXYhPIL+Wvr0yifwJmZRR4qJuwx5e4Q1J/0KKO9BbW8qciwX67tNJP59l8JKoD6fv0cJU7vQzgNWT9Jqz/T4xr84YLKANXm0WRc4JRC/JU0Z6T8UAB1ONiApd1H185tos6sSmvs2KGLPcIYBbpNyTWDfOiTF8GpLWGjujjkNrWoGPOS/yn/xsMG1TGo5bmI/sulck1iG5mKmlMO1TbrWgfM0gqfeFNlvD1hC+9OFqq6BbS0gGlSL4GyCBzQrtxhVatDo1Sh1TSJcmwj9FQiBqEYjEph3ROIvTQw2T408GDJVCAZE8RIKUofVtnXSS1OOsEYOe6M10qmG66hioMjjdrgKSMRFkQWwTiIiuVSO3NApALFQqkyGx+NMqlJMW7ihBHHRglM4P83Mi9tLqPonVNM19SniuqLvXEkU/EWAiX6o1J4vr16HrhBlGMCPPSgoiIL3k/dclwkKDD5xbZPPR7TPJ4vIvE6jkzdMTLwrEeq7ea14R0XM6ZADOD2HFlaAgYBeFN3MYKh5qigVJgPub+bLHyPIm1xA7PHOIuKkx7IWgbGmxEWYey//pwAjDyeW68F/xz519kBOKHv/+2K5nexFWDbtk4v17LvkwTOY2yPuAu3vOS1sImqNs6cQ/nkJt7jTOa16gPVA9RC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2F1cWRzQlJlTHZSeWNtWGV0a0xOSWtPSWN4eUF3SmhkYXA1aXVrZStJWmg3?=
 =?utf-8?B?NkVFT2R5WFMwZkZEQ0FyWnBFQnYxb1gzOTlxUUp1TXl4MmNGVEVkYWtvVkU5?=
 =?utf-8?B?ajFyWW02SFhyM0M5MHlwdnB1UDVoTHU5STcwcmNlWEVLdEZGZlEyc3gxTW9o?=
 =?utf-8?B?cmJHcmpSeDNnQVRraWVzeWU3bWtGTnZYZU1lcFJNb2Y4dDVyVmNtZkhqNGdz?=
 =?utf-8?B?d01WTWJzRitCWmJFWmxkdVVTNXB6T0RQMnF3TzEvTjVyT1VIOWZNa2pTcy8x?=
 =?utf-8?B?aGFuMmZqNzRaUlREY2pXaUFPdW5iYXNnbU1NM0tWeTQ3cEtsMXowRVJmRDVl?=
 =?utf-8?B?SmRWWUcrcTNSbW8zYmNONmdWRmF5NGJMR2hIRG5DcGc1YW8yZzN5ck8vdTVB?=
 =?utf-8?B?cW93VTJyZnphNHBKL1J5N1NOQjRIV1FtblBHUDRJR3NFYlRsSzRwL2t1L0Zy?=
 =?utf-8?B?elRqNktmMVdRazllYkFRZ3ZMMlJnZlVxZnBXb05yTWhVM3ZxQmFWU2phK21Z?=
 =?utf-8?B?a2tVSEk0bHB2cEFzYVNLUmlWZzYrT1VuMHh4NXIrRmNkUDFmWUtteHJrdDJa?=
 =?utf-8?B?Wmh6VUp4REl0UGkvcTU3Mm42bSsvQ3R4cnBrN3h2UE5GWGMxU1R0bnh0MGpi?=
 =?utf-8?B?UFFBek1ZNG9leHFzU3djTmk0L3o5Y1B6QUNENm9HQ0s1NGtSb0lpa0R5Ykxp?=
 =?utf-8?B?TUU5SDczUFk3dW1FaExnditiL2ZkSjVKRG0yK09DVnpkcERTRi9OazgvZHpy?=
 =?utf-8?B?dVhuTy9ENHVLT3o5L2tpNlVQam9EWmhBQVJlZTdnTmtyQjhNZmdoU083MG0z?=
 =?utf-8?B?QUV2bVRzM2hEU0dyZ3NBYWF5NFFHUFcweU5veWY5L1poU01tMnVXZElZOVpU?=
 =?utf-8?B?WkhEK29FdkcvOXA4U3ByWjlmWFZKQ0toUkdxTzB5Tk1xNENUaWp6cUVESE9y?=
 =?utf-8?B?U2JFdGplT3NxcEswQXlYVG1VWTQyUEFRbDcrMWFaV0lwazcvbjNXOC9mMytl?=
 =?utf-8?B?WTFlcU1LN0pvVWNpZ0gva3crTHd6M3ZjUnJ5UXBPOEQ5NjJsbndWVWtMUkVO?=
 =?utf-8?B?UWNZekdKdWdtY3dyWVR0TzREckRVSW9tNVdpRHA5UU82cUozY2lkcFZwZU5D?=
 =?utf-8?B?b2dVc2lXSGJlek1aT2drd2VVa3MrbjJtOHRpMHoxZlhsSHpMY0pRYU1ZS0Fk?=
 =?utf-8?B?Nm5sTFB3M1VUWXJ0MEVabVl4YVcvQTVHS09pdDBqam45N2orTHZjeHpNNXlB?=
 =?utf-8?B?Y1ZaUGlUOXFsSjFYVDB5SjZRcUJrSUNBK2xFdkF3c0p0azVic1htN3c2azlw?=
 =?utf-8?B?Mk1BMjJRdWpYY2dhRk9TMXVnNVdCM0lHazY4dGNSOWxSWFUxNlBDbGVBZlFS?=
 =?utf-8?B?QTV3R2RZbmhBOXpoQTdnaElNOFUzV1FJTjhDQWtwZy9Fb2Z0a2hwdXI4TG13?=
 =?utf-8?B?TTVCeHhvc05CWFMxVllBaTNIWXU1WS83ODFHUVo3ZTBFY3BUZ2g1YmEyQW5l?=
 =?utf-8?B?RE5VdlNuVUdBcU9VYnpCY0dVUkpDMUVPZ1MzM1k5QWxucExzMFhFWHdTaXVw?=
 =?utf-8?B?S045WSsycjhCdDZUSGk1RmQ5L2p6NEJUd0NYdXhxZ0dzaUdYeXNIak41OXlw?=
 =?utf-8?B?V2ltK2xLSFZiMGFjcHQ5UFNXYm5vckE0d0RCUUcza1pMbGlFZDFySnRNYkpG?=
 =?utf-8?B?bjRXaXRHNEVDd2tTblJHVjhEMWdzNGNZQWpUaVoxUWpVb2g3UUdZdWtHSlJP?=
 =?utf-8?B?RlhlWThVV0NqaXRTUWlpZDFENHJ5dTNObzZQTlpFNnYvUDdIc29pWDNObjBs?=
 =?utf-8?B?ZVFpUWZwL2M1eUtSNWVENlk2aStsT0VqdCtTdUZneHN6RUlBc1V2bW5hN3pt?=
 =?utf-8?B?OFZ0NGc4ZVhUUGVPMjlnclBJclBWd3RCM2tocjE1OCt5UXl3aExmenBmMThD?=
 =?utf-8?B?SmpxaGRTZnNvWlNxRE0wNVRabkJxU0ZqRmxDRklaNlpGcTVVTXY5aXNEK01H?=
 =?utf-8?B?NlhkK0I1MElnWVVUMCtOd0pCYXFucEROQ29jZnFuMXg1cW9rM0hxWDNyam92?=
 =?utf-8?B?TENXUnh6c0pJeEdCNGc4UEZRTUZGdnpibzhVUzkreUV6ZUNGUk5mNnJ2YVR1?=
 =?utf-8?B?NTVyd0dzV29UK08yRlVQQ3RoMGlvcGJNZkJlSDJtQ1VHd0ZVdkhTcGNnNEEw?=
 =?utf-8?B?enNEL0ZrWnBrMndMVjFNbWNLSkkyQkRpdlNucEI1dzZsRjZaWWxYb2lMUElm?=
 =?utf-8?B?TXVuVXpZUjhQYVZvU3ZwTnN0YW1BcTMwYStUa1hDbjY5SkNFUWs5TnRKRnpT?=
 =?utf-8?B?bGV0WWtpdkVHdVRmaVJXdnd1a1VUYmZDdms0Yk56N2IzQzh0VURLZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b65dfd89-58ee-43ed-2ea9-08deab1bb7e6
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 03:01:07.2186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LDMCwHEwHK8zFh1iPXHLV8akkjSISW5ljMPpfTpmNlaBNLKVdPCC7jvQzAmTi0iYcNuGZfSMz2jkWWalc5pCZvLrVtUSKsF0kldhb393yYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8156
X-Rspamd-Queue-Id: 1B1324D5C9E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amlogic.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[amlogic.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-36252-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,baylibre.com,googlemail.com,lists.infradead.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xianwei.zhao@amlogic.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[amlogic.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Hi Linus,
    Thanks for your review.
On 2026/5/5 17:21, Linus Walleij wrote:
> Hi Xianwei,
> 
> thanks for your patch!
> 
> On Tue, Apr 28, 2026 at 10:22 AM Xianwei Zhao via B4 Relay
> <devnull+xianwei.zhao.amlogic.com@kernel.org>  wrote:
> 
>> From: Xianwei Zhao<xianwei.zhao@amlogic.com>
>>
>> Update dt-binding document for pinctrl of Amlogic A9.
>>
>> Signed-off-by: Xianwei Zhao<xianwei.zhao@amlogic.com>
> Please update the commit message with the information the DT
> maintainers need to determine that a new compatible is needed,
> i.e. "registers are allocated differently" or "new hardware registers
> exist" etc.

Will do.

