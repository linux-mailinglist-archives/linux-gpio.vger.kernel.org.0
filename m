Return-Path: <linux-gpio+bounces-21525-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD850AD8A6D
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 13:26:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34EB33AA32A
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 11:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5DC12D6627;
	Fri, 13 Jun 2025 11:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0K9hJi+h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2055.outbound.protection.outlook.com [40.107.100.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228BF26B745;
	Fri, 13 Jun 2025 11:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749813993; cv=fail; b=N/JkD1CGD+gY6eUOzTQ4NXutSwBSN6ECToR6l+/oNWaQr6XSM3M31jIURcCbQbHSdmVnhmqFc5UhaDPwU/zPRuQ9TjJINGcGpU+6hCDNiJiZoVFMAXMElW5QnXz9ahATauEO8MMXziYSo4vDU/8KQuacvUmcz5DnP75rqBqL5+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749813993; c=relaxed/simple;
	bh=fbIFoNIj5P2bz2fqKrfuhrV3KVy7x3wxi6otlFioSxk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IzLwtjGkHxg1Mlx+KA93a+SwDYorL3tJtVS+tMHdqRaou3I9SYIvYeRWPfs3M9xEAlZ4q+V+azUb10S/5bhJsRFBERdj53z+AD8IsY3nJupxOUSLZu0/+c9TvExZSxl5bopAHQMfohJFOjvA0d7ud6cvdXNffmoX0rA9qZ6VgyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0K9hJi+h; arc=fail smtp.client-ip=40.107.100.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RGpnJ0+YBDd3Pplkp7h6QJCYzUvZLsCUQPdjDGK7WL4y2W4DIun+dY/5+QQCuHg5jkXyaT8LNCKB7QLGkoTgTaybSyFXoDcLAfKHdeaoYr70ZF6oPGitIYGM0ZtxQYILfUNA4Y7MdcPzQzN0MG8Ap1xsKYWcDlkchukF5LT3bo6BRJwgGEX6aZNkOOYbZMzUhsbDcDf8jmAGTHIq65RNXBNTb8kZ2vWZclm6vFvZN+4Ch/5YZoE+6xsYnZYxb6VBVkEQzoJApl+7AWcJflToOGftH9fw5hitjF63deHn3P0um1BLAol4aE4uRuvnDIlnYSaTtJQILKW7wmZkHK2M3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gPmhoCVqHKe9oaEInAb/84CPw1mrsMLq3ozmkjynOHs=;
 b=IaQxR8MOoHeZhkMiCBp1HjzWpmfsGmUriLAgliAYYpNA59o1PwIPk2GQVQ4TTjtGyYoF8GKfLSUqxZ6CBb51nuqvYp+fYSgqOfbJXs2w2QZvGxXh9GBWJF8lQDTAY+3pDAt0927cmbxJCYgMm6iPbPdEEosGZHJCP3SuDtbm947izn+XV84B55RJe8/KmwGOxdOcHrhkXR6EJvvlO9nRTx6FpcIKdKqMmq5f9198nJBfOzknLtx8L6kyHmVYpqcvCtK1TpqwaNxoLbGbqgvkYgPft70PfdX6NPibhpWrU+Ae5w0KFv7eZfXSnmkDFsSvg/N78XpOkNyA478diUQjag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPmhoCVqHKe9oaEInAb/84CPw1mrsMLq3ozmkjynOHs=;
 b=0K9hJi+hU2Cjr7uRmlF60l3e1Neniwa+/RErMvpTOyRChvcB+PCUldI88Tz0tWyQYaylQCp54VdxluqZYEGIZ3v1z4TIqdz6bGnQVm4L5aKuTUiXD8SnDK2bZOuGM45L5+dPSQL2gmMFZx4I+a51aaE7YQp77vF2Aw9tOuhZLSU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by CH2PR12MB4038.namprd12.prod.outlook.com (2603:10b6:610:7b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Fri, 13 Jun
 2025 11:26:28 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%7]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 11:26:28 +0000
Message-ID: <9dc04095-e397-4a51-a75c-8a5577be197e@amd.com>
Date: Fri, 13 Jun 2025 13:26:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] dt-bindings: gpio: gpio-xilinx: Mark clocks as
 required property
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 monstr@monstr.eu, michal.simek@xilinx.com, git@xilinx.com
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 Srinivas Neeli <srinivas.neeli@amd.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <8407ef56b11632c1a7abfce8a4534ed8a8ed56cc.1749809570.git.michal.simek@amd.com>
 <cbde9b9e2b0f9d12fdd1ba24fddb1543159357aa.1749809570.git.michal.simek@amd.com>
 <2fb10aee-6610-43f4-9d12-88a97e0f66e5@kernel.org>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <2fb10aee-6610-43f4-9d12-88a97e0f66e5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0136.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::21) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|CH2PR12MB4038:EE_
X-MS-Office365-Filtering-Correlation-Id: 00f61eb1-3a88-4e09-2ba3-08ddaa6d23bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L2RpSHlrWXRhQ2lYWE43OTZxQ3VpeHVHZmNIdFVPV09HSENaaVJPeGRvRmgx?=
 =?utf-8?B?NkNWeG1hMWswYVVMTXBLbWoxSWZWZXpENC90MFp4cERObjhtU1ZZRkRCVXJa?=
 =?utf-8?B?L1V1N1p5ajBHVFk0TEhZeEVaSTRVRDdFOFBrMysxNytyZ05UM21LRWk5RTBj?=
 =?utf-8?B?YVB0TE1MVFJwbzE5RlRMVGs2Yk1nREVpSWFJN3N4bnZ1YXhhMWUzVnFBRFMv?=
 =?utf-8?B?bTZ0TUNuYkU1NjhiSXlHY2F4OXpTZG5zb3ZnTGYyU1hmK1VrSENqcndGdVNy?=
 =?utf-8?B?WS92bytsY01tVkxldzZVOS9DSUlJQTRJOVI0Mi85RllpSFQxbWRHYkt5Yksx?=
 =?utf-8?B?b3ZzYVd6OVNxWGtmb3RDdWhBcmd6MTQ5bHhqTjFNZ0NIZGQzRFpmdWJUZ09x?=
 =?utf-8?B?eXR3VGdiMWRpMVZoSTBFT0J3NWxORzdXTXhYU1p1Y0pzNWJEdWpTSVI3SWVt?=
 =?utf-8?B?WFNPWUpiUWRWd2syKy9lb3l2WmszOWMrcDJTaHIxR0hIdzlRek5HWWJKRHZm?=
 =?utf-8?B?NDAxYlp4TTArejA2MHBVcnFHKzk5SWFkZjlHekxDS2FQZGZsM3JDVkhHVE5H?=
 =?utf-8?B?ZzhQaUhYUGpzMGhNRmVyMkJndU9tRUwrSUU0eDdEYlhCdWNlUEN2Z01RdzRC?=
 =?utf-8?B?b29wVDZWekdESmxPY2hycWpFdVFjOXBWRWZOci85d3V4ZHgzbUk5ZWNhbWR4?=
 =?utf-8?B?NFFIRUxKa0ZjNFhsc0pYd2lsMXVpcDRTZ3F1dGFGK1IreE91NGtTVkFOMmZz?=
 =?utf-8?B?ZytQNWN0VG1meS9veVRQK05wVnBDUCtUZmp2YmNqTElnMk00ZDRvdk9YYlJQ?=
 =?utf-8?B?dUd3TmNUQmw2M0JWeFNWOEFvSHBpZHRGa292NkxsZnIySnZ2SDlVKzlwUWNy?=
 =?utf-8?B?QWxTV3RtNWExa0dMYUZLOGt1ZkpTaTF0aGg2YzF4SXp3SGxjdHlVRDZhK2li?=
 =?utf-8?B?RWtKcmFpbkxpeGcxZzYwaUVCaXVsRXJNZktKeW1xU0h6OCtXNS8wRWRXcy9i?=
 =?utf-8?B?WThjVms4WnRBcXZORzh2UkNqWVdCdnNBaWN3V1ltb0hVSWlyTkZBMXovN3JS?=
 =?utf-8?B?bXhCNUhGSkU2a3YrNlpRSTZvVHoyNmFZS3I0ejNnOXZ6SjBVeVlSNS9hcTY3?=
 =?utf-8?B?cFRSM0V1d05vSVZpT3RhTkJnUitRb0VwVXRpbjl1M04rQXIrYkV1VC9qZy96?=
 =?utf-8?B?cmlhQTg4OU8wUHY2SWU5T2tFNEZkVEN3eGpKTmFmNVVVb3pWblZZa1hvcmo3?=
 =?utf-8?B?REo0TWwxZXVUSXpSYWRtT1lrUWRCTGJDdlFHdTlsZE8xRFdBZzhOekFreVV3?=
 =?utf-8?B?bG52NUpPZXBMbUp6Mkg1bUhocC9SbXdEbC8vMXR5ZGdCZHR4dGlDQmNmU0tO?=
 =?utf-8?B?N0hyeGFwczEyVEpGYW03VmgyK2JqVCtnN0JHUXYyRTdZM1NySDBOUHNqTnZ5?=
 =?utf-8?B?VXhRbE5NZHdiNVdlalhGbHN0clhBMEhHd3RiNXpRU1J3WmJyTHJ1cEVueEpx?=
 =?utf-8?B?Z1VLVUFBLzlHRWNDL0xFT2h6cE9hNVR6MHF2RGlSc3Yza3NTVVdsNE1LMUF0?=
 =?utf-8?B?KzdxQlNaSHp0bkFxdVJabEhrUHZLemVvRHBTNW9QME9lMkhUdk9RL0p4Y0tj?=
 =?utf-8?B?ZGllN1ZQUDd0OVF3MnpndVA0bFREcVlQMyt0M3dnSWl5b2NYT0hQVjRuckly?=
 =?utf-8?B?WnVPWk5LSnRGaDV5OG00RWxybS9YSjBuUEFmRlN1NmlPRTI4bHhPaGNmY1Vj?=
 =?utf-8?B?NVhXT2lxK0NaZ2RTS0xCMVFnNWhhWElGeDVzZFZENHhML3pkZHJaTlZqMVlp?=
 =?utf-8?B?YlJka0FER3pKUkNzODUwSStLSjhYMGwzaGNFYzRiVm9tUUFXVDNNa01pZVJO?=
 =?utf-8?B?SlZrK3RscG5ZMHMrMDduckg2MklJUHVOejhhNG1oRHR6dVRxT3B1VDRsSXpk?=
 =?utf-8?Q?zJ9lPXm2O10=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWJsS0FodmJydVBPQXJSWDFuRU5MMnRXY0VMQ1MwRUNRTFhQVDMrZGd6Z1NI?=
 =?utf-8?B?anE4SVdDL1cwNXNvdEFZZFVNOERpOWRPRi9lTGpnbENvQWM1ZUdlZFB6RUhH?=
 =?utf-8?B?Z0I2VDRqTTljRnhMVDZiSGdIRXpXZXRBMWcyV2kxR0RadDRhcjNOVFF1dkdn?=
 =?utf-8?B?VVdIVDljVE11M2M0cVVFeVRrczdmOXdxTTdTVHpzc1lYeHJwNU9aOEtwZ0VP?=
 =?utf-8?B?T0ZuMmZvOWlTLzFWWVk4SHZ2bm1CQUhScitOY3JDTkM0b3drNHlwQ2hnY253?=
 =?utf-8?B?ZzJCUG0xeitZMW5TUmRkUXpwSS8yS3VmSlIzM1FXSzdqTEtrRk1rQnZCRWs5?=
 =?utf-8?B?eitoWkhhU0lrdzJrcStkSWtKUysybmt4b1pXTTNoMW5hZlZ1cUJCUjhTaWhV?=
 =?utf-8?B?ZmlaYmNpdEZWM01BdzlpN3J3K2dRMGJrUzF2K2VYQmx2dXJOWGdMS09Cc2Q1?=
 =?utf-8?B?OUpGeWtLQUJCMWJBMTZFUWozRlUwTXhoZnZsSXc4ckYvQlpDN1FteHlCQjY5?=
 =?utf-8?B?RzNsVEZsdGQrUEpTMkRDd2JWRTFnS096dWZOeUlLSmpvaUVTVE0xZlJOZUFD?=
 =?utf-8?B?SFM1bytEbUh1aVFrekxBdlpXK2RPcUZGeElMQXlKMWpYMys3cFplMm55a0dt?=
 =?utf-8?B?dmE5cDFtSy9iQWpCRmd6ekltZHdMbHJKOGxvU3JSZ1B2TjlBR1VKUmtNNkZt?=
 =?utf-8?B?bHozaEdSV2FLcjk4OTMvMFpyWVAxaGN5c0FZTnd6SU1LcXk2N3JnME1rSU5H?=
 =?utf-8?B?ZW5vaGk0ZzRVcTNwVTRCKzRrQks4R0xjbG5PTTFvL29Icnp6UmhHbWZtZnZa?=
 =?utf-8?B?bzZSUCt1ZnhSZXhxeWkreWYyQ29PTDZqajZKemRlSE1nVzdqRk9pTlpjaGZv?=
 =?utf-8?B?eEk5d1NDNCtJdU5JUkN6ZHFZNTNtNFFsWUhHTU9iK21oTERYQVE1d3NQaVdt?=
 =?utf-8?B?YkJqYm1ZTThsYi91LzJUcnJVY2RCeTkra0tvbGYvN1RiYVBUL1ZtY0k2Q3M0?=
 =?utf-8?B?VDVUeDdVc0xzd2VBNFhyMUtZeGltR01QVlhlVzAxR0h3eWtUQjNYaVBzVVdW?=
 =?utf-8?B?SExWYW5iSmc0UUdVUnFBaTM5bXloeUxHVE8rT3lsN0U3d3JNTjBncDRBY0po?=
 =?utf-8?B?YzJiZ2Ezd2JyaUxOenFDRUpYVVYxMHZ1S0JCdjdOdWVuU0luSHlPMjVjeVJp?=
 =?utf-8?B?WnpnaFBGbktKTVpLb29naUtNOXlNKys0d05pTDlLUHMya1c3dmc1V3hFaXRR?=
 =?utf-8?B?ZmU5blc4YkVmcWhmRGtWSGIybnhxb0VnSFZoNi8xV1J5T2xKQklUcmViSDhI?=
 =?utf-8?B?OXV3bU5WSU9vbFJjek41S0ZOVjU0UzBpa21NQS9VVWZNTVprYkRoMm4veWpQ?=
 =?utf-8?B?ZXBiN2lUd29Kc3B3OEpoOUgwYWZQTWVFY2ltMkNPQ1ozd3F5UWxZM1pQTGhP?=
 =?utf-8?B?STQ0YVJVemZsa29HVS94NFExZFFXOXJSZy9ZOHAwSVozZk5HaTZWUU9YWnRR?=
 =?utf-8?B?V0hVUmFiQlVCSy95WmRtcWpmQ2xsaGNuaDUzWTBFZDV0TWNUaGhKSzhQbXd3?=
 =?utf-8?B?ZXM0VVdVMndWa0RyeWcydHp6N3p1RVE5VVdVV3dnOW15ZzVPRlF3VUVuQUJL?=
 =?utf-8?B?QVV5Q3JuU0ZzREg5WU4vd0FVSlFrOEFwMUFxa3Q1MVBMQStCQ0haZkhLL3RS?=
 =?utf-8?B?SmkxQjdmNWpCUkpRanlJMTd4RG5mODFVeEpubmFVOERXTkoyenFEakFKNXg4?=
 =?utf-8?B?RzVoWWFhNzNVaW5kWWNHWkdRT1FlZXlvU01kTk9qb2IrOHEwWVJDQ0plWkFB?=
 =?utf-8?B?cGhBMnpNNUNRWVI2REQyM0pvQ3RpdUc3T245dGd2Q2dyeDNjMnVwUDM1NjNi?=
 =?utf-8?B?TEZueWlkMVR3andmV0JrbUlqMS9DRW9aSm9OOWZrVlY2dmRKK3dNSDdWWjU0?=
 =?utf-8?B?NlVFKzBVQk5NYm5lUUVIR2QxMDNKK1lSaU9LcWlrMGowLzV3ZmJFMEFLNS9y?=
 =?utf-8?B?dkxueGVZOGU0MVRSbElyTjVNaXZQOEpjYldzYllsU1Vjc2ZTaWZIaFhjbmhh?=
 =?utf-8?B?WWxoSnY5YkFaNnBDVWR0UEJ4aVlqZEx0YnZIV0M1eWw3c0FrS2JwN0JQMXY0?=
 =?utf-8?Q?rFnI4jHAupIek4GrPLsSQMHQ7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00f61eb1-3a88-4e09-2ba3-08ddaa6d23bf
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 11:26:28.5671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7OFLr8w/fjxcdw7siWPLO05NcTM66tyDtW44M5hJrd5DMUE5fHlgWAcp2J2EdezE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4038



On 6/13/25 13:07, Krzysztof Kozlowski wrote:
> On 13/06/2025 12:12, Michal Simek wrote:
>> On Microblaze platforms there is no need to handle clocks because the
>> system is starting with clocks enabled (can be described via fixed clock
>> node or clock-frequency property or not described at all).
>> With using soft IPs with SOC platforms there is mandatory to handle clocks
>> as is explained in commit 60dbdc6e08d6 ("dt-bindings: net: emaclite: Add
>> clock support").
>> That's why make clock as required in dt binding because it is present in
>> both configurations and should be described even there is no way how to
>> handle it on Microblaze systems.
>>
>> Signed-off-by: Michal Simek <michal.simek@amd.com>
>> ---
>>
>> Changes in v2:
>> - Add fpga region patch to fix issue which was introduces by this change
>>
>> Based on discussion at
>> https://lore.kernel.org/lkml/20241002-revivable-crummy-f780adec538c@spud/
>>
>> Actually this shouldn't be only targetting GPIO but also for example
>> xlnx,xps-timebase-wdt-1.00.a but I would like to check it first on gpio
>> before starting to check other bindings.
> 
> IIUC, patch #1 is a prerequisite, so you need to squash them. Otherwise
> dt_binding_check is not bisectable and we want it to be bisectable.

No issue with squash if necessary. I sent it as series to be applied together 
which won't break bisectability of tree and no new error is going to be reported.

Thanks,
Michal



