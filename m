Return-Path: <linux-gpio+bounces-19431-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57ACCA9FF5C
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 04:03:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4DA31B60C67
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 02:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A66D321506D;
	Tue, 29 Apr 2025 02:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b="J2THgwAL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023085.outbound.protection.outlook.com [52.101.127.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6864812CDBE;
	Tue, 29 Apr 2025 02:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745892196; cv=fail; b=KK+fb614vMV6L0bsQhwOQTxCQmWq8t9cJw70mlMVaorAsoWmE+ZwjqkIMFHhNgGanVdgO/Dk+DTysgwBH4zGvmHn1LxmoHlBkHEBsgE4IX9FkWU49wsK1fQyQfqIduNYX/fp8oWaN5Xv0xMncwPrjFpWNQm5eSwM8LwiaS6sPMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745892196; c=relaxed/simple;
	bh=oSdhqxRuDq4I9e/87HiUwvgdK25Z4xqyZDa9/DlDCCI=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OFJSRxUXRmMm/c5gXtWtq2Hy93bhC8Hh9QC8HoeqClz3kDmR8pikVpL+VaGqsfgJkOopuu2POwpsMIUb/+l3c8XYriNnzJ8quZq06ySxvyeRXiP+0E4J8qgXKFC+Fzb84Oh3eYHGQf5xXBICKHTahvYDrlYUMQo2BFVBEhD8bBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw; spf=pass smtp.mailfrom=portwell.com.tw; dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b=J2THgwAL; arc=fail smtp.client-ip=52.101.127.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=portwell.com.tw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Re7P4o5XSKVhKZHZhLHiMYQDvjRH80MayPX7zVRPYKJDeDk1bY3SaraZOQGX5/ZBCszM/Cldct0Xx80hQHfYki228wHjggGXXkKYDvb78uX4KckVH1qyABC9ipcvf3EcaTmtc6audISqXqEJs13FKbVxnJmP5tz8FneSqBwe+ZBRTeFuFvHYlmkzFNzcajb43z0UvcvbjoOBQE3yS2/o0u443eGz/Pf6hKIGfIUBAD8INOPeE9j8aaDZ3utqvvnI2RFgRgD5i/vPLYca3+Hnzbq4LEBJfcy8tfHFOf8lII3878RaBru99J89mx8fj0SvJt+QHNmtCz8tRO0sBKOQQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qGHdO7s87lZCzz6jVzY0YwewfZXPyXouf2ITlfeSsU=;
 b=lgSqjFh5UMGSGxRUeWD2lUW0QbxNi2C76cL6ntekL8KxPa4Ik2x/doe4gaUqG+SO167JV5vW9c+uxo3MnMxpr3ZD+HhkChRX81EdeWxFVXtsHdAlTphGeWJalvPN3SF4kw5MnsiThQM+ptGBBaygzKyUnqHAzFC9g4EU1GX9EE4oP4w3EjXsODT0LjPo59xCdw/dHu+tSSTR6EruIgImLYSA70h6yAJXpYsbDQBAxKNMjPPJNJeHxrN4SJ15w7VGJqYEPUF/uGcE/dIAhK7Fdb+Xzy94zCSeOPjhlXLMAjgc3L00D4BG8DM00XRiQ+qiHshrX1cGtLrVOAggnFlwag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=portwell.com.tw; dmarc=pass action=none
 header.from=portwell.com.tw; dkim=pass header.d=portwell.com.tw; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fetCA905017.onmicrosoft.com; s=selector1-fetCA905017-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qGHdO7s87lZCzz6jVzY0YwewfZXPyXouf2ITlfeSsU=;
 b=J2THgwALCzKVL6oJjaiDaUQYUm/RLRK5ZeG2T5HO/qda/yBxQTsZixgiF1BJpED9I92DxBHmD+AYU4MMqgleT4gpwpSzxOiGtvWnZ8E0+MlnVXHgnV1clFwaQwe7KMFmA5MzVYMWBIEWR+oaCapM22toD733OG6TsNZ8aT1mC21xfRvbU0vGlkMjQMGsFfT3Dh+bsZZoDzLNTnEaqSdtfNvtoX+Hv05TxttVVXW1KutPnjBvYkO1d6w3rjWM2f8ZHnmu7tioXbcxXDpPHd11ychYQiT7ILP1lKN5SBQmCNq8kcr6kS0uH/H+7PgePJRWgrnWx1A7IpcfWZggNU6Hlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=portwell.com.tw;
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com (2603:1096:820:e7::10)
 by TYZPR06MB6281.apcprd06.prod.outlook.com (2603:1096:400:425::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 02:03:08 +0000
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224]) by KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224%5]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 02:03:08 +0000
Message-ID: <7abab768-359e-4067-9587-6ca6caabc7f9@portwell.com.tw>
Date: Tue, 29 Apr 2025 10:03:04 +0800
User-Agent: Mozilla Thunderbird
From: jesse huang <jesse.huang@portwell.com.tw>
Subject: Re: [PATCH v5] platform/x86: portwell-ec: Add GPIO and WDT driver for
 Portwell EC
To: Linus Walleij <linus.walleij@linaro.org>
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, brgl@bgdev.pl,
 wim@linux-watchdog.org, linux@roeck-us.net, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-watchdog@vger.kernel.org, jay.chen@canonical.com
References: <3fc723de-c7e9-4a03-852b-93d5538847d7@portwell.com.tw>
 <CACRpkdZKuiR7jaa-gsVTc=w64yhXv_Pny9u_zOkHDjcyXaXSeA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CACRpkdZKuiR7jaa-gsVTc=w64yhXv_Pny9u_zOkHDjcyXaXSeA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0034.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::14) To KL1PR06MB6395.apcprd06.prod.outlook.com
 (2603:1096:820:e7::10)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6395:EE_|TYZPR06MB6281:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b5cc680-ee47-45ee-ac70-08dd86c1fc8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WGZlbWdyQTdHV1FXLy9xbllqQytnN3hoZmdUNEc5NEs3cU9hbVpvWU85cHM4?=
 =?utf-8?B?emlCdlRLaXZDTnVDVEo0SnNOdHBnTmowSWxpVkgrSDkvRktVRVhHTmczeU02?=
 =?utf-8?B?ZEFDK2ViVGZSWmNLWHRsLy91QU4rcGVCRVFHSHR1bzNzR0ZGOUNKNzVwYUt0?=
 =?utf-8?B?d0tBTlFHMzIrRHI1RUJwSXR1OFpFYncwd0pXZVhZdUs5eVpNb2pVcVdRM3ll?=
 =?utf-8?B?NDFYeU1idThyVGRWSEtRL1BSU21YVXd3U2ZzMnRRaGR5K01kdlA2MXM3N0RV?=
 =?utf-8?B?NmdVdGxCd05aOURVdXpsSUpMSHZ5UXZlbEJUK0tsTHdaY01TamI0OFg0OU1T?=
 =?utf-8?B?SEJyZkRuUC9VZXBFY1YvTzlZV2FiUDRHS1pXOUY5STRXUksxdTBJZ3YxeVlW?=
 =?utf-8?B?QWl5d2UxaU5aWXZtVDAvYkV3aFdnRWVxV0xKZnpUSXBLN3BQZXFHTEdrWjNt?=
 =?utf-8?B?WURiZ0I3UzlReXhsWDNDeWI3VWU3bEdBQ3RsWGU4WDM5cldIa09XcEZNQms0?=
 =?utf-8?B?TzdNZmZOaTd1WCtBRkVIdXRieUVlLzhic3R0OEdCR09CU3JZNUV2Y01oTUFu?=
 =?utf-8?B?SkFQQjg2WUhXYnNsUjNtVFZ4T1JlY3hLYW8rTitGZ1Iwd3ZzeDhTNkd0cE8w?=
 =?utf-8?B?ZFlEcXgyOVpzT3pVSnR2T3BwOWEyQWdyYUxybWFwV3BwMWNlazRFWjlQUWtV?=
 =?utf-8?B?L1RQZFhYOVQxMm4yWFl4NW5JbEh0SXlZR2JGM1NQeGVtOFYzbjR1QWhkbzRV?=
 =?utf-8?B?VjF5cm5pZGoyRzBLbVlEaXFrZTM1OTh3WlJ4amYwYkp0bG1pZy9NTmo2NXFm?=
 =?utf-8?B?aUFCdUJYeFJqT2Mrend3Zlh2U08wdm15SnhWMWo5c1ZzZnUzakxIRGgrck5l?=
 =?utf-8?B?bjd4NHNGNnRwZXBCd2RralJaalMwVVpRd1lQK016T29WYjAwTmgrSE44bkZ4?=
 =?utf-8?B?TW44Tm9VVkU3bGljZlJXdGVvZ3ZpazVYNDhQUVdPeFZvY2JFM0V1QTVGdko5?=
 =?utf-8?B?aG1SeFdpMitMS3ZUSHUzRlcwcHhIV0JqNm50T2dhVkVTdlpQQnRoU3FGQTlx?=
 =?utf-8?B?emdRbnozSVZKdnhXS0loMmZTaDFaTnZmQnd3Q3puSlZ6WjE4WWdXM05DOWJM?=
 =?utf-8?B?TVdmTk5ZemFZdHR5SzluVVdwSzdsTzh1aWJWeVJNdUJxbVV4a0ZHSVFCSDJV?=
 =?utf-8?B?ZHJCYjdvMWl4QnJ4MUg5M1ZOMTI5SkZtNEh2alZ2SUhGcnQ3Yk45d0VnTk52?=
 =?utf-8?B?YTladUZWWnEydm94a0dJOFFaYXkrU2pYb0krelF4VlpURmwrdFcwWFZzREQ2?=
 =?utf-8?B?WVVlNVQrc0R0K0pRSjg5M25aS1JBaXJ3WXpobklFQjQxT3Y2VjJYYWIrajVF?=
 =?utf-8?B?RWhJSjcrL05Wa2N3RXJScVB1WUpqRk5KNHNQT0RmbER2SXZEWi8zd21jTUZV?=
 =?utf-8?B?Uk1XcGh0ZTIxQzEzcHBNQTFsd2xFajFwVjdReG16OWR2U08rQjc5YW1xeTY1?=
 =?utf-8?B?SEx3ciszOGhROTdhTTNEbjdNR1FxUWdNTUY1R2w5ZVlqUFY1b3lYRnFSRzRp?=
 =?utf-8?B?QTVtRmNBTUhiQkxoL09aVU1sYlpYT0lCc2lTbUs2elVTakVoMWI0NlRvYlhj?=
 =?utf-8?B?djNJWmxBd3QyTHkvdXF2N3RBbVRiVUFDTjNxeTNmRnFXVUdkYTRmRmx4a2Rz?=
 =?utf-8?B?bHJ2a3c3REw5KzBLQ095RFdMYjRNR2VSQnV4RkcycTdSamdwY2JabVg4blIw?=
 =?utf-8?B?cGRKRjJNVklhWFVSTGdUK1VvclVOYmJYMXpldXROazUrRStaMVo4U3U5Wjk3?=
 =?utf-8?B?OXNwTEtDc3lxRmxaTmpEV2EwZVNPL09DY3g0b25NcFdiSXF1U3U1MUh3RHRz?=
 =?utf-8?B?U2JLbkZqMzVQU0xQbjh6d2FHWXI2ZEt0T1hEbkRETERwVk5oWGh6T0NiVkRa?=
 =?utf-8?Q?DV0xEP/pMtM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6395.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QStJT3pJTmRwQ3o0TFM5ajg1Z3JhL2Rzand3aVRYWm9tb2svcmZvejdkV2JM?=
 =?utf-8?B?eisyNXNPcVM4T3dZdGhtazduVmdlRVdtVzJnaDNPNGxzNFUySXlLWWszdXpJ?=
 =?utf-8?B?OURrcElNWnhsV244K2ZYaUV3aWFHYW9vYk1BemdiVUpudHRlNXRXZTVVR0Y0?=
 =?utf-8?B?U2xrZHUrVFBhamU1OCtWRHkrMjhZaUJJaXZ5TVJEOWM2em9DL1hnaG0xNEtV?=
 =?utf-8?B?eUM2bkdwblBrN3FBSjcxNmVqMG93UmlTYlZHUFE5d1p5MjE4blBTNWNBeXlz?=
 =?utf-8?B?dENRc3BOSlBHaHh6OGJOdXUraTF2VEovaGRSb1ovdlRTeDRaa3NJak40K25J?=
 =?utf-8?B?NXJCS0JyNVVDbU16TER1MUJTaGZvbXJ0QW9uYUI3OGc5SmN3a3ZyZTMvL0pM?=
 =?utf-8?B?S08rWU1JbjQ2ZzFGR3dKeE1xMHRhUjQxT1VJNWJvbmp6T3l4amRBeTNqS1Mv?=
 =?utf-8?B?YUpQa3dPbWNkN09mMzVxQk52QkpZR092Yy9KcEhtem42allOaVphK0htdU5Q?=
 =?utf-8?B?V3FGeGpjV01DME1CenFQd24vYTZMMWI2Rk90LzAzR2wySjNFbmhKd0JRcXFQ?=
 =?utf-8?B?OFdJaTE2VDhib3VrTkF4ZWJnaEE1WHR2SFpPVDZzWTZiYkRRSVdDTE9tNVd0?=
 =?utf-8?B?TFc1clpVdkxOL1RsdlFUd2txK3JwTDAzQTNoZjYwbDZYTXV1YTViMlprazFm?=
 =?utf-8?B?Y1RYS2NQNGJKamVIUWRjMm5HbXplakt4WE9GRDlVd042THhLYUJqTFhDOGJ2?=
 =?utf-8?B?WldNRC85NlFWbGRnY1NRby9BVGJOZ3ZnWk9UemRmcHA3K0xyMHFEeFB1aVhU?=
 =?utf-8?B?NUJRRFdoTENxWStSVmU2TUxVdUt4aDVsTjEvWVhJOVlka3JGd1NZV3lmeFhT?=
 =?utf-8?B?MlpqTGZLZTM2a05zSkNqRDMxM1JzL2k4b3BlSkZKakFVUTRzbWVIVXhwQUZw?=
 =?utf-8?B?cE02RnNUU2RJZkZCOERxY25VMStRZVdKVEFzeTVLTWVnQmFDQzNzVllscGsz?=
 =?utf-8?B?R0ZwMWNrZVpUdEtzeXUwMkhUN29MdE80ZnFwdzJvcWEzVkpEWXRPN3FIMU51?=
 =?utf-8?B?NVNFVnBJRnUzQWhRaUxWNWlRNDl5ZjZDdUw5TDRsUng2VE1tY2hNQmRKeWhP?=
 =?utf-8?B?TnBzZkRlMGJETmZHRFl3SWFIK0JTcklWbWFmM09GWmt1cHpCM2tFTk1LYnBv?=
 =?utf-8?B?OWh5Uml5Z3pUZVI0WnNXK1l1OE1ldGZWU2RMdlRpTlc2YlpaSGtkVEJjTTFw?=
 =?utf-8?B?cGY3QTVzbVRITjUyNytoK01WWXhQWCs1bnBwaXRsd3RWdW92QmtZalFkUHpW?=
 =?utf-8?B?VUY2SlBkTmFmdk5SNU5TM1IzbW1FWnpMWWYycnVqWVFtRlF4MFhBdVpjanBp?=
 =?utf-8?B?K3o1eVJaK2pzOFp1TlYydXJwK0FEMC9KYS9kMTlYYmdkbWpXT1ErUW9zNlRz?=
 =?utf-8?B?RGpwbFB3Z2V3SCtsdTRYd3NMSG9Xckp0QjQ4WTZadXd1N1VsdC9RT1VCVUFB?=
 =?utf-8?B?WFhWeVhqMDF0SXBBQzNtdkFoZ1ZMaHE0TW95ZWp2UUpVanloaFRnNFdsbVll?=
 =?utf-8?B?MHBFZmMrSEVhVElLT0tWKzNnbDZmQmthZCtMK2FMYk5Ic05vTnZiQm0rekpY?=
 =?utf-8?B?Qm13U0x3eHpkMUl4UWQ3NUdKU01qcVV0MFl3eFh0S2pUWlNmRXN3SVR3dkJC?=
 =?utf-8?B?SGZ0Z1lreUphZEZkSHlLZTM2RzFicHlXY1FsUWtqOTZrRUJla3p0bVNuZlNJ?=
 =?utf-8?B?WEpLcnpTN0pKeXYrcjhKNmZuV3Aya1pEVTUySlpwVUZnY1BCbVRjRkVlc3N3?=
 =?utf-8?B?cjh3ejRtWXNKVWVhdG55dE1taVd6WDFhOXZsUGxQMTJ4TW41Q0MxL2JRTlh4?=
 =?utf-8?B?YjJ2UXF2YW9sOTFBMHY5a0ozTEtGeXFoRjRyS0x6SjZ6TmlxbjR0MDBXQ0FL?=
 =?utf-8?B?NmZJQUxkOVUvSXJHNGRycTR5NmlwS25hYlpMK3lEZHEzUDFOdnQxVFdnYk9Q?=
 =?utf-8?B?NWhydjJBSVNIdWJ6REV1bVpjSTRreEZKSURiRjVvNEZiS2grUUlncWFMSXdS?=
 =?utf-8?B?clg2SUlldUxTRnJjbFp2SW96clJlbG8xZm1wbEpjOEx2NERYeERVMEdPZlVL?=
 =?utf-8?B?OFlpeTBkVWRTODVvblM1OHhVTHlDZXg1STVnV0MweHZuUmlKc0N2MHNiTDBT?=
 =?utf-8?B?V3c9PQ==?=
X-OriginatorOrg: portwell.com.tw
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b5cc680-ee47-45ee-ac70-08dd86c1fc8d
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6395.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 02:03:08.3024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e309f7e-c3ee-443b-8668-97701d998b2c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6vhX24x0FLPaNinY2fRto8ZTIbOt9bju7rBfRV3tlbb9huecBm8aTTPaZDPyt1CrUBfVc0nuic91HjlWP596pnz8gJ6R1aJQPg/eS2eN5QY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6281

Hi Linus,

Thank you for your review and for the Reviewed-by tag.

I will use BIT macro in v6.

Best regards,
Yen-Chi Huang

On 23/04/2025 4:38 pm, Linus Walleij wrote:
(...)

>> +static int pwec_gpio_get(struct gpio_chip *chip, unsigned int offset)
>> +{
>> +       return (pwec_read(PORTWELL_GPIO_VAL_REG) & (1 << offset)) ? 1 : 0;
> I would use BIT(offset) instead of open-coding (1 << offset) in all of these
> instances.
> 
> The main reason we use it is that the BIT() macro hardwires U (unsigned)
> to the parameter so no mistakes can be made (even if you have
> no mistakes here obviously, it's a good habit).
> 
> Either way this is not a big deal so:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Yours,
> Linus Walleij
> 

