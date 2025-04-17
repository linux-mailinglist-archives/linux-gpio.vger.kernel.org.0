Return-Path: <linux-gpio+bounces-19010-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3F7A91914
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 12:18:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C7BC3BE35F
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 10:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A569226D09;
	Thu, 17 Apr 2025 10:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b="D/apJYsq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022125.outbound.protection.outlook.com [40.107.75.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FB91CAA97;
	Thu, 17 Apr 2025 10:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744885120; cv=fail; b=U6wvqzbEzboZP18LuPV8sB6MUpl2C6YvAr1OhsElNaepqtEF2QExGp9TVAvtBeg4fD9c1assV1GihdU5ecyc/Ut3En+u8Si+qHpyNI4x453296HITNr+3n/Sekl+9pxeq9p+hKOE0AC4KH8ag5Tt9D/cYVg2Gmryq95EmGtfdmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744885120; c=relaxed/simple;
	bh=wf83LsYLDDW86/fnSumQr4B//zemI7gVWLI4WGcnm80=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rhGcOxpF+YDY53w8m0HJpdHaHHQPyiJUU8N2TjXLzC6Vu/RosSAWCUjRW3tViT6k3A+x4RQed9YiczNaJNR6Lp+vrcLQQheqlZpcP6dqwuuXUTiml1xhUnxDo2I9OjfyO3YLJzNZD+fDBhZoopS5JfIDIu1XW4Gp+xmxlTdyOzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw; spf=pass smtp.mailfrom=portwell.com.tw; dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b=D/apJYsq; arc=fail smtp.client-ip=40.107.75.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=portwell.com.tw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yiryzmC/cgMDn5b941+zIpOFi9AOae7LBZ0hQ0gRpHFvnkdsxTq3nT57tPcqNo9nsXwoScrWcBCjkQWWGm6YNTERedduTA1w5DajPoSkGl0dhZTfgwriISjosmmDJOJbpyssyOtJ54ZX6V+KWbX1nJcIER5De4aaT3rTiER1m4UGB+J3NVQ2AdccsssCBfp6eUUGZW2w01TL2oE1g6IIJ7XjplqcZKj7CISeX17ocxkYpxmWYgDuaW2bUAPCOZII5+Cu7ukZGvC/AxuFLJU5CVU0I4TCW5TRH2F3y2YCABKkSjMqN8RVBWsyKD01V/QW2lea1JbYidDIfp0W9Wwlog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6EwR3Qo2KoHhEJZl1irRGZKGdiTEchFEcLmJQIXNaIE=;
 b=C3sby3sL996b2IyXwfeA9W4b7KSHRRdo++GIQXbmxtGY76w7Ljk/h2JkBtZ0kZhfh2KtXB609ka4EO7LB02zAoqqjdA2G4/VkhCvgAwBYdIuiHhPoGOX85uwmZj1McMZ7CyVB/kjP+XCXwxXIrwXtIKIf5q3cWWK20cak7kTz61ZBkXQgRC26n1GKJ8S1Axd3zoXOv7gIWy52itzmN1WWo02bScWFv6tKozQJyNsMywrTJ79EHzi/tfDxFY9ExoHIt5XUz7gFpcfUKDeyhjaLpd26Qwa6VeLM6C3nkjgQreoprfFeZp0KeJxMK/k/0eCnwfYJ+I7Q8KpUwFF8+fjcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=portwell.com.tw; dmarc=pass action=none
 header.from=portwell.com.tw; dkim=pass header.d=portwell.com.tw; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fetCA905017.onmicrosoft.com; s=selector1-fetCA905017-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6EwR3Qo2KoHhEJZl1irRGZKGdiTEchFEcLmJQIXNaIE=;
 b=D/apJYsq40vOzaG6zzZwV6KPmdKdialyrle3O+8DKS0SNdI7rg19uf96ZvkwkatjRKIxkiXUU/OF+rAU+JBwanZCx0Ec9Svgi1s3dYWwY49RZ5VsKptY77RfsPZE/l73H2ZhC06XgNgE4EGgkxgRy3OaclVIk7orY9UHxiTgOJhwsEvufiaXvs+peA1tG853t6O9CME5llEuwTA9j/Epr9LRHrxyTnfMmWag/SjlstISqjVju66FsO4BIfB0nSwigu8a2K0p8Ga9CdvsLeHqzR691OKMvQjfPhWu/axMKm1msZh4ZQyv9Gt5MCjGxK8Y2AfECMPcK08KI1UBTAJEng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=portwell.com.tw;
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com (2603:1096:820:e7::10)
 by SEZPR06MB6139.apcprd06.prod.outlook.com (2603:1096:101:ea::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.24; Thu, 17 Apr
 2025 10:18:30 +0000
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224]) by KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224%3]) with mapi id 15.20.8632.030; Thu, 17 Apr 2025
 10:18:30 +0000
Message-ID: <a77a4e1f-7eb6-4194-923d-f8b19000bcf6@portwell.com.tw>
Date: Thu, 17 Apr 2025 18:18:26 +0800
User-Agent: Mozilla Thunderbird
From: jesse huang <jesse.huang@portwell.com.tw>
Subject: Re: [PATCH v4] platform/x86: portwell-ec: Add GPIO and WDT driver for
 Portwell EC
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, linus.walleij@linaro.org,
 brgl@bgdev.pl, wim@linux-watchdog.org, linux@roeck-us.net,
 LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
 jay.chen@canonical.com
References: <3096e0c7-f215-4a51-9a84-b2b64514ffd6@portwell.com.tw>
 <35bcd82d-c417-0b93-f2e7-03fa8fe1e0c4@linux.intel.com>
Content-Language: en-US
In-Reply-To: <35bcd82d-c417-0b93-f2e7-03fa8fe1e0c4@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PS2PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:300:2d::18) To KL1PR06MB6395.apcprd06.prod.outlook.com
 (2603:1096:820:e7::10)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6395:EE_|SEZPR06MB6139:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f42a368-a279-4934-198d-08dd7d99336f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ak1YTnlBOVk1Zko2akp2a0pVdnVtOFJyMzFTSGQ3aTBJNXBXcEJnbjNwb1dn?=
 =?utf-8?B?ZGg5K3RtdmtCODhVMWZDaVdqUkppeGpUL2RJbzEwMzRlMVJ2TkJ3V2RlbkVn?=
 =?utf-8?B?dUJROHlhdHJRem5oZ21MZmtqZkV0U1Z1ZVN6M25LMy8xengyY2czSVM5dG1Y?=
 =?utf-8?B?ZEs3SjlwcFVwOUVZTUNrYkFoSk5mZ2U2aU5NcDJILytrSGI2dEVQcWIyem40?=
 =?utf-8?B?UEhsS3Vkam82dXp4VTBOUDA1cS94RUR1eGxJNHVOZzVhdjh2dFl4ZDFpQnZH?=
 =?utf-8?B?K3ZxSGYyODJaaXJTVkQvNlNBK2toQkFTM1NJL0dYZUszWTJyK044NHRVNlEz?=
 =?utf-8?B?SURzRmhWUHIzNEFrYmVHYnFCdE9kVXAxakpmRENvdnV5SlZOSzlKMzJIV3Zx?=
 =?utf-8?B?ZXNabEwyMVhyMmt5aGxWeVVSSGU0MERTUTJPZmxxQjFDWDdpVzNDZXRGTVdl?=
 =?utf-8?B?TC9yUzBCdDdDMHI4cmVQZ2puUEUyODZPTEZCS3hrTjBiTFp0c0VvbXNIQVAw?=
 =?utf-8?B?NExIdlVldDR0LzZtUkpRdHJ1TW5qY2RZd3pNTHV6TStPSldBdGMzd3NUNnJV?=
 =?utf-8?B?WXlKL1oxMUU3ZEJQTFlZNUNVWldSckdPcGxwUHVqMktWdlhZRWFWTGpiRFYw?=
 =?utf-8?B?QlZBeUxFRkxTTFM0U1R3RnA3VWx4aUVwbHRCM2VxQ0RHZW5hTk5FVmc5emxX?=
 =?utf-8?B?bldlcU00MittU0xlVVVCSzNZaEpqZlN4eHNYZUg1c2taMUd3MkNwamd2a2gy?=
 =?utf-8?B?MTJJWlFlL2JlOUovQUhTU09GaFBRTzAzY0N1RFYvckNSNC8zWEdBd2FXKzJT?=
 =?utf-8?B?U1Rxd2lIeXI2dDBuNkpOb1huVW9IcTN2STBCVll3Q1lGcnRua3NPUkxUTUZo?=
 =?utf-8?B?UWVLdG5GWGxwbzBUajlTSzFwOU9DQjFFSHY0L1lnK3JzaEFzMWRqV1FOUnly?=
 =?utf-8?B?a3R3bndiakZocDFhb3ZRc0I3RUJnK1l5Q1A3WHV0SHVKaEpXMlhLR1FoTit2?=
 =?utf-8?B?RVNmVG41Y2RqNGpQNUdyb280anB5Vkh0b1haUTdFeTAva2YrcXBtQmdmR3Rq?=
 =?utf-8?B?dlhrNVBISllidFRmZzE5NGx4YXIxWlVRMVZ6Y01peEF6MFVIOFVZWjRpZUZR?=
 =?utf-8?B?QUFZTkpIRFlPajcwa2gray9QQ1IwbnAzYmExaTVESVIzeXdpcG9xN2x3c1l1?=
 =?utf-8?B?WjVXVWU1b2ZNMmNoOC9yeTBld3VTdm1SNVB4SDBlQmVYbjNrbDRSajRJZDJT?=
 =?utf-8?B?ckZNcjJxcnFGZTI0MGJjMytvR0VxUThwaWJDbHY2dHpKWTBDVDFEQ2pkZFRL?=
 =?utf-8?B?VjZlKzE3VEFvYW9UbDZyRzZPb0gzcXRZSjV4WTZVS0doMzJUMjVqYk52aTBy?=
 =?utf-8?B?dy8wbml4RXl1VGkySTBJbUVoRVRTc3VIVTltYVZCaDA2RHY1WkhzSlVJUysv?=
 =?utf-8?B?SHRrSDE1OWhhQTY2S0liSDJWYXQvZEJONFJZUWxpMjVLYlVXVWducmUyeGxJ?=
 =?utf-8?B?WktqU2FpZGJPelk4UjhHYmhOVWZFQmYyZmFHcXhpdWdzS2ZJQ2hDRDcvSzRP?=
 =?utf-8?B?NU12VlNWbjFyc0QzWUtPSi9ySGFTK0doa2lKSWpQbmFadExCMnpIYWltN29N?=
 =?utf-8?B?MUxNYUFjb1kwellwaXcxRm5iRmZTZXkyWWxvT3loMTh4NVZoa2dlU0FUOG9l?=
 =?utf-8?B?RTUxTGFQVi9KeHpjS2tFWk12RXlwRVZFRGd0SnU0TnJpSHFYSGpOYnl1THQ5?=
 =?utf-8?B?dDY2RUxnSXVDRm5kSUMrVFM3ZWRNZmhseEJBR01tY1hoMlh2RGNDUDVGeGpG?=
 =?utf-8?B?OC9WM1hmN3VJZWpjUHFTSnF4UjNGbmhVZDkrOUxQTE9qZUNMT1Nra3N1MzBk?=
 =?utf-8?B?TDRNeXh6NTBSOHBCTmc0R0VqeVdOM0hGTTJIWHFYTGRNOUlsZDUxZlRvM0Nr?=
 =?utf-8?Q?Xika6LqqzP4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6395.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THdabkxYdFBDcS9ndW01UU45UjVreUtZUG9rRmJWS3c1Tmg2KzcyMWRZVHJZ?=
 =?utf-8?B?TXZZaitNeEtKRUxPMWpLUXkwamNRWllHaW1vRzYrQnlnMW05OG9XaVRNUDl2?=
 =?utf-8?B?Sm9zeVRTbm1PMmhPek5IVjBBZFhEQWRYejNPMjB0TU5SZG85eThWYnNBZTM1?=
 =?utf-8?B?NFNNelFML0VqUnZjdUpCWHFROHI2RWU4V2ZzRnh2NjkwV1VoNTZIcVE3NTZz?=
 =?utf-8?B?ajRiLyt6akZSaGEyL0hOaFl2ZnlxUUNEVE1tdDJ3ZnpFTTR5VHR4Zk1JNU1H?=
 =?utf-8?B?Y2ZHM2llM1l3eG5YdWdTeThxLys1RC9PMm83VmRZTHJOeFZpd0hiZFE5M05F?=
 =?utf-8?B?K2ovM3YyQWJ5UXVmUHFYSVdDMDE1RGNIS1YxdDFEZkpEcnpBd1NLcGlMOC9w?=
 =?utf-8?B?SVhBQWhmc1JBMVZTb3VKdXY2d0lzV0hBZFJPQ2tsM0wzdk90MlRJc0hXUTJE?=
 =?utf-8?B?WlNsOUtOTHU3d3NMeXByQ3ZLb2RIR0RXWmM2SjdmVkorcnNsRnV4cklCUGY2?=
 =?utf-8?B?bHRFZWZ2OTZLdlowbnVXNkNaL0hmKzM1SXVnSW90SGNsL25wWGhiUVpIWFI5?=
 =?utf-8?B?SnR1Qzd2WEhLWHRGK0Z6cDRNOTB1UEU2YlNDZ3M5Vm9xMHMrWktQYTR4Zm0y?=
 =?utf-8?B?TGdVUVBqbjBQQmh6WmJiWG9Qa1I0VHg2YzkyTTI5c1lzdGN3eDg5S2k5TFMv?=
 =?utf-8?B?ak5xaWF4ajArQllZbWg0T1J2QzFlbDhKSFllQUVrM0tIeHR3dTY2OEo0T3No?=
 =?utf-8?B?WVFrV0hvd0l1RlBZMEhUb1N0RXd6V0YyYkR5d0E2TUowVnl1a0svTjM2Wmxr?=
 =?utf-8?B?NG5jaUdVUFRHcUY1elRLSlhER2kySnYzK25FRVo0NmJRKzlSR1N0cGRGU3k0?=
 =?utf-8?B?ZjNSWWw0U2xPMlZlL0hUL25hRTc1VkorUHpET3B4NEd0ZVhZa2R2Q01tcU5V?=
 =?utf-8?B?YnVwaVNLdUVnNHozYWlvU2wwZzNpSmc5dVVIR05XVEVLM3pjWEZuSk5VZktI?=
 =?utf-8?B?M0Z0SGF6alk0M2E5YkFHQUM2Wk5jVlQ3L3k0aXd2SUtIMWZieUhlZHd2OWVK?=
 =?utf-8?B?ZEZsUDFHbkJ6UDVuc2czeHVXamRrTDlqVWU1R2dMZ3IvUEhqckNIRVJ4MG8x?=
 =?utf-8?B?cXRraHN3b0M0emR3cWdtTC9HWGVmdFBmQUFIWUxrN29MVDYwNVp4SFhTbVVX?=
 =?utf-8?B?VU1rV0lmUjR1LzJHTVVUL1E1bVlxZkRkWjdTL0hwUUNNZnpOTi84ekdxRWVR?=
 =?utf-8?B?MGZibFNUcFVIZ0ZDN2k1Wi8vWnpRc3h6WktaUUVUbk1zZnVLVjdXZnpLRytt?=
 =?utf-8?B?d002aGZQRVNpWVJNNTNUT1NONHQ1VmxQREdWQzV6ODdaSDdCeWdyMjNRWHhv?=
 =?utf-8?B?SWI4MTRxbTZScDhJOUN5VmY0Zno3Uis3UEdFbncvWlNjT0NkR1JwaEQxMlVv?=
 =?utf-8?B?OHNyZ2pGYXp5OGlQbkl5SkhXVjErOUZpNGYzaXdFUllwWXl2bW1JNE5tVUw1?=
 =?utf-8?B?dmJ2L2pPMysrY1pTNERhMlVvaVR3Y2dMRm1NdW0xRm10aWNSL2ZqOEkycVA1?=
 =?utf-8?B?aFRwVFdqc1J1QTZqdEtnU1Y3L1lpTmxRbmRIN0hwczlVS3hsQk9FNGZ3am91?=
 =?utf-8?B?aXEvdUw3dnNyYmd5aDczdS8wT2ppVWd4RUJIM3hMT3BnYVJKb1lseFg2d2xK?=
 =?utf-8?B?ZlRwWFNCU0s3MWk3eFQxYU1ULzJNdUNoT1JjeW9JK2NRbGJ5SklvU3BPdkt2?=
 =?utf-8?B?K3lCWFdzdnJpK2I5TUEzVzVZWmI4K2RHZno4Tno3blg1d3FqWDRXYk1mUEpY?=
 =?utf-8?B?MEZqVndZZHJWYVpMTm9zWDFxNzZwQy85UVVZckFtTFJZOXJENnR2aWtIbWZr?=
 =?utf-8?B?Q2JFUDNDNHl5OGoxK2RWTWNJZkttVS90bi9yYis2ZkhIYXVKR1JlTjhqUHBk?=
 =?utf-8?B?bmIvN05zbUpkbjA4WDhwYXJlYmdWRUpGVmE1SFZqUlJ3LzFTWlZza3BVeGtw?=
 =?utf-8?B?SU5QOCs2Zkx3Y0pWZ0JSZEE1Ums1dHF1SlZ2end3bGNaMXFZWVBrZXZJQkNt?=
 =?utf-8?B?ZzNrRXBHeXFwR2dmeG9WNXNNZVFYVzFKcUIwcUdITnpuRGNLZjdxU3BvZUxa?=
 =?utf-8?B?UnVSMVhrZ0c4UDJyNnVqc0N0bCtqdXNsWWFjOWZseXQ2aXZFejM1R0RZQmo0?=
 =?utf-8?B?N2c9PQ==?=
X-OriginatorOrg: portwell.com.tw
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f42a368-a279-4934-198d-08dd7d99336f
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6395.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 10:18:30.6523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e309f7e-c3ee-443b-8668-97701d998b2c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KJZ2DNbLVIV0hK3JOZmkG6ZxV995Ao3i/OJoXnoHCdaI8d2dDSun4a4YuAiZ3QUbNdMOXzgqNv/MyEdAYTv8/agPPkiXhl72kx0VLxbgUAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6139

Hi Ilpo, Guenter,

Thank you for the reviews and the patient corrections.

On 16/04/2025 12:30 pm, Guenter Roeck wrote:
> On 4/15/25 21:10, Yen-Chi Huang wrote:

>> +static int pwec_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
>> +{
>> +    u8 direction = pwec_read(PORTWELL_GPIO_DIR_REG) & (1 << offset);
>> +
>> +    if (direction)
>> +        return GPIO_LINE_DIRECTION_IN;
>> +    else
>> +        return GPIO_LINE_DIRECTION_OUT;
> 
> Just a side note, you'll get a static analyzer warning telling you
> that else after return is not necessary.
> 
>> +}

Will remove the else in v5.

>> +static int pwec_wdt_set_timeout(struct watchdog_device *wdd, unsigned int timeout)
>> +{
>> +    if (timeout == 0 || timeout > PORTWELL_WDT_EC_MAX_COUNT_SECOND)
>> +        return -EINVAL;
>> +
> 
> Below:
> 
>> +    .min_timeout = 1,
>> +    .max_timeout = PORTWELL_WDT_EC_MAX_COUNT_SECOND,
> 
> This means the watchdog core validates the range. Why check it again here ?
> 
>> +    wdd->timeout = timeout;
>> +    pwec_wdt_write_timeout(wdd->timeout);
>> +
>> +    return 0;
>> +}

Will remove the dummy check in v5. Sorry, I didn't study the core handling closely enough.

>> +    if (!devm_request_region(&pdev->dev, PORTWELL_EC_IOSPACE,
>> +                PORTWELL_EC_IOSPACE_LEN, dev_name(&pdev->dev))) {
>> +        dev_err(&pdev->dev, "I/O region 0xE300-0xE3FF busy\n");
> 
> ... or failed to allocate memory.
> 

Will simplify the message to "failed to get I/O region\n" to make it more general.

---

On 16/04/2025 3:45 pm, Ilpo Jarvinen wrote:
> On Wed, 16 Apr 2025, Yen-Chi Huang wrote:
> 

>> +/* Ensure consistent min/sec read in case of second rollover. */
>> +static unsigned int pwec_wdt_get_timeleft(struct watchdog_device *wdd)
>> +{
>> +	u8 min, sec1, sec2;
>> +
>> +	sec1 = pwec_read(PORTWELL_WDT_EC_COUNT_SEC_ADDR);
> 
> This is not a safe way to do rollover correction. Lets say rollover 
> happens at this point.
> 
>> +	min = pwec_read(PORTWELL_WDT_EC_COUNT_MIN_ADDR);
>> +	sec2 = pwec_read(PORTWELL_WDT_EC_COUNT_SEC_ADDR);
>> +
>> +	if (sec2 > sec1) {
>> +		min--;
> 
> ...This is subtracting from the post-rollover value.
> 
> This is roughly how drivers/clocksource/ drivers handle rollovers:
> 
> 	min = readmin();
> 	do {
> 		old_min = min;
> 		sec = readsec();
> 		min = readmin();
> 	} while (min != old_min);
> 
>> +		sec1 = sec2;
>> +	}
>> +
>> +	return min * 60 + sec1;
>> +}
>> +

Will rework in v5.

Appreciate the reference and the guidance, and sorry
for not getting it right the first time.

>> +	return (!strcmp(PORTWELL_EC_FW_VENDOR_NAME, buf)) ? 0 : -ENODEV;
> 
> Those parenthesis are unnecessary.

Will remove the parenthesis in v5.

>> +static struct platform_driver pwec_driver = {
>> +	.driver = {
>> +		.name = "portwell-ec",
>> +	},
>> +	.probe = pwec_probe
> 
> Please include the comma to any entry that is not a terminator entry to 
> make diffs cleaner if another member is added here later.

Will add the comma in v5. Apologies for missing it in the previous version.

>> +static void __exit pwec_exit(void)
>> +{
>> +	if (pwec_dev)
> 
> How can pmec_dev be NULL if init always sets it or returns error?

Will remove it in v5.

Best regards,  
Yen-Chi Huang

