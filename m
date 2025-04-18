Return-Path: <linux-gpio+bounces-19051-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB46A93494
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Apr 2025 10:24:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F7971B66302
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Apr 2025 08:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68D9D26B2A9;
	Fri, 18 Apr 2025 08:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b="hWZwqAPi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023078.outbound.protection.outlook.com [40.107.44.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0A28462;
	Fri, 18 Apr 2025 08:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744964658; cv=fail; b=F+QRkalUzu0pwDcCTLBCHYw9eTggmJiWkpbZ+7F3FENY8TdgoBJGWQ8uwTsqQUC0RdZh1gSccUQjsfXCWzeo4nnO6lKj31W7d6NwjXHRw7Ai1n5+PPdG+QHzM0DN/UrdlfWR3enmtDnfgMYhQXcPHYFnouKNumApRT3L5Ajfwac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744964658; c=relaxed/simple;
	bh=vkK3x84FTj8ngZqlnVqXwETSXk+CcCOiYxx38/kXXvI=;
	h=Message-ID:Date:From:Subject:To:Cc:Content-Type:MIME-Version; b=HmnFPE3QR8lCAvHHQfYlwmo/K0v/clc71s7ZaNi2D9K1g1p56ipLj4UQ5sjhVn6yoJUQBX153AgHBrAazVX1UxNQH01iLpfWC9iqX9f3Nqvb7hm58wLM3li9HeusMspwb0ssk4IegVuM+gmuVOsQiBTk/0112jd0NYf3E1iRSNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw; spf=pass smtp.mailfrom=portwell.com.tw; dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b=hWZwqAPi; arc=fail smtp.client-ip=40.107.44.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=portwell.com.tw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQooCDrReXtXR/jlUFInEuLVmkyJKl0Q/IWl2nVVAP2bnVIs5XxbnEGrQS2YD452xGPw0sDSonw7HIPglo5vYrAG+Utk0r4EOlCDGJnHl0ogjwnr5aIggM6amTNJQnFIRmHKqMfch8En9PVhhbsjK626KFhTpqCt+4zQ0AXg/iNuEs9HQvvjFgtLOJk5js/hTPeAj0H4kz+tYOn7sqO0B/rmJearThFkD9dqpu8zw2qhj/MQIYrhN8Qvj0Rnu19Z3/XkBS1WXt17obQGq+7SPjIzcxqoRWbhuR5MIsvz9KpOnYlYR3x9niC4Zvv1rEazzZFBx74Lgnl7/wP8F8ONHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QATOYv5yj+J+eH/5zpl2t0KmMS4nYy3yLUEt9+UFrDg=;
 b=hIPlR+ucVxWRUieCwmaGWG2joM+tCix0I/tDQNbaeVp0JPSREyNgGKzFA1+bGmsEmaQyCB5gnAyoVnlp13UH4y2238Eazn9sLnB+LdJP1Ie4j5uHFEjRhTFa8bxRvqaWX3GYKeov0CkzvhHh+zE0SROnUYaNyNURJiSNjuWe2ZvcPYPKmz2NMfxoPgetr/9DSRXN/Yy5meA/gVTCo82lzsQGy9apyB0VFw3ZJHNhQEz6ZkFU0tlKtWWJzBeeKyqF3Z+DRB8aUqHLKcCrjvh72bZ4Vblijx9GMSBpNlyj6PTs3HmRjbnY28jowb3asiewbrJ4LHddv/NhsVKirsxCYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=portwell.com.tw; dmarc=pass action=none
 header.from=portwell.com.tw; dkim=pass header.d=portwell.com.tw; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fetCA905017.onmicrosoft.com; s=selector1-fetCA905017-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QATOYv5yj+J+eH/5zpl2t0KmMS4nYy3yLUEt9+UFrDg=;
 b=hWZwqAPimrkgH8/JXvwfSqWByUhkTKrU1UBny7Iun9tqmw5aNNwVUhB3kx023pmfSCbbQcuXrSGUGa9fQRfn14S2UBREKggJUaKj92FjT+HQfgjkT5xSdae3NHAEov0kqRiAPONlbG/2m3PAFy/l2lAzxvTkE+Ix+IRUtYjw8im9XVxq7kk3TJEYc2aLmfHKMSHkkShpL9h7Rnlv+2Ip2YnG/JLQHYKNEvSeTow7Yf6NV5lOuCyC0DSHMB51d1buEcmtwcfXZUzBEW+CXCYfx5PB2cr+PEs7q64ZjiWm0XZsRnB/VXT95zUaS7wvjGhx2Hc5v4yLElEnJMDgFfg7XA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=portwell.com.tw;
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com (2603:1096:820:e7::10)
 by PUZPR06MB5675.apcprd06.prod.outlook.com (2603:1096:301:f9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Fri, 18 Apr
 2025 08:24:10 +0000
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224]) by KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224%4]) with mapi id 15.20.8655.025; Fri, 18 Apr 2025
 08:24:10 +0000
Message-ID: <3fc723de-c7e9-4a03-852b-93d5538847d7@portwell.com.tw>
Date: Fri, 18 Apr 2025 16:24:06 +0800
User-Agent: Mozilla Thunderbird
From: Yen-Chi Huang <jesse.huang@portwell.com.tw>
Subject: [PATCH v5] platform/x86: portwell-ec: Add GPIO and WDT driver for
 Portwell EC
To: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 linus.walleij@linaro.org, brgl@bgdev.pl, wim@linux-watchdog.org,
 linux@roeck-us.net
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
 jay.chen@canonical.com, jesse.huang@portwell.com.tw
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PS2PR02CA0058.apcprd02.prod.outlook.com
 (2603:1096:300:5a::22) To KL1PR06MB6395.apcprd06.prod.outlook.com
 (2603:1096:820:e7::10)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6395:EE_|PUZPR06MB5675:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b166aeb-2e34-43ab-e0ee-08dd7e5264bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MllvSmxPNk9YTjFma3JNV1FoTmRtRnpiNkZTSDNRMndoZmZxZFhta1JBbkxl?=
 =?utf-8?B?eVRMZE1mYjBpOU1QNHRDMnQxRGJDWW1XQTRobk90KzdwVEdkT3g1VVdlZFNQ?=
 =?utf-8?B?WlY3eGJEWXpjZi9YMEsxcVZURDh4UFpVNFJUNkhOR1I5dHYvU29DQUx1UXRQ?=
 =?utf-8?B?Y3RjNk5FakFJWGJIdnhQVW1iUkcybGJ2MEJtbnZ6SzA4dkEyYkZXaDY4OFRn?=
 =?utf-8?B?VkRWYTUrZW5LNmxDMEJYZVlubDUzdUFKait6eU5nSnZaSlRaOFpxRE5Zbm1h?=
 =?utf-8?B?d0FGL2ZVTm1PK05jOGtxL0RqOU1WWUhFTkxBSG96a2lpTlhBc3REdXlFRU5Q?=
 =?utf-8?B?UStvM2ZWcm5IRlJJZ2lGSFg1ckJHVjNBTkVxL2crMFdGR1ZxMzU3bzV6ZHJ0?=
 =?utf-8?B?V2syUHVKL0ZKT0NwK2U3Qm45NUtwR3hTNTRYQnJSZkJpTWs1QzVPRnFiU1RM?=
 =?utf-8?B?VHp1cW5rcG42RFIrNUZEdzVDS1lmQnJQSG5mYS9wZ1RxcmcvNG9IWEdYNFVL?=
 =?utf-8?B?bFpjQ3hVMW9ZMU01eWN2OExpRUtHTERJYmsyUFFOQ09XTDlZeHZNU28xejdN?=
 =?utf-8?B?UUczcVFvZEpoY2JQdDNydGRycVhDYmRVMlVza0lyTVhIRERXUWRJcUxlVUdp?=
 =?utf-8?B?Ym92d3VuQnJvZDliV3B1SEFndVFpQU5Bcy9VcHRhcXJDMUhpeXc2Wjc2S3BJ?=
 =?utf-8?B?R01uVklKSXRvTUR1V1ljOWpZYnJjUjNQcHhhS2ZRUFlsZUZKQWZYQnBzdENR?=
 =?utf-8?B?Tmg4b1VOR2xFTWt6cDIzWXpQT0g5TnFYTjBaTERLUVVBZTljTlhDcWpSUi9W?=
 =?utf-8?B?Z0d4UWxLQjlCUjREbEV3NzY1Y3dRNGVKV2VLU1c0eUxCVUVFcTVFZHowSElw?=
 =?utf-8?B?Nkx2WE4yTzFjTkR4c01EcFpIeXpTWXptUnljYkdnbHBvMlZPbW9tdGRiS201?=
 =?utf-8?B?QU1peEJZdFUzcFB1WHl1NmQzejlRQnlZODRtNnJpeEdoQXlBaGlSZnZjcHZV?=
 =?utf-8?B?c2d5T3RiNGpkV09mdXNhZWFzRUFCSVVMZU1ITFJpamcxRnJ4eVJ3TXZBNGwy?=
 =?utf-8?B?MVlSS3dXMloraml1WHcrQ3ZaR1RIZGd0U3FLNm5NaWNqODg2cnAwck9iTXhF?=
 =?utf-8?B?bFpUcnRreXI5c2ZUditVRTZiSmYzcXNodXlZbFlrUmUzeUQxMG1kbnZNbGNQ?=
 =?utf-8?B?dnY3WnZ5VTVrVng0Q3lUR1NwTlBWcVYzVFhxbzMvWVdjWmJmRVVrYmVDWUJw?=
 =?utf-8?B?TWxvWi8xWk56eE81Sm1ISWdsOENXSkIrdkJZMnpvMGtRVHoxeXRlaGM3bUh6?=
 =?utf-8?B?dlVDR1pCUzg1STdaanM1dVUrdHpLTUtKM04vOUZvT25VTGhOeUtKamVXaGhC?=
 =?utf-8?B?T09yd2ZNOFNpcXhwaHhHN2xMSEVMdDFob0QzcTR3Wk05S281WG9kQnN5dDFG?=
 =?utf-8?B?eHYwZk03Y0gxdWVPbUxrd1hCTjFWYVR4QXFsaTBBSGFkYzhwR3RCWFloN1hX?=
 =?utf-8?B?SVdmcDlGTTQ0L2NwOVVPc05ocGRmZENsVlZYcjJISXh1OWwyTmlqZ0JDQ2pK?=
 =?utf-8?B?dC9OKzV1a21DR2FycTFaRTR3eWhweFEzSXZ1Vm1FQTQ2Q3B3M2NwV0lpY1hl?=
 =?utf-8?B?ZHFkOFVuK3FJdEpVdjlUUk0yblovYk1hWXNTZENCeDc5VDZOQ0lCcGtLYnUy?=
 =?utf-8?B?NGRza2ViZG5NMm83a0ErL3RuVDVSaGVpUzRkQjdlOUY3VFFoTmF2ZXQ3cTRQ?=
 =?utf-8?B?cDYvUlEwR2NjbktqU1c1NU5ZMjhoZzVLZzF1azBJNy84akxpUG9TdXA1TTRh?=
 =?utf-8?B?Y2F2RnpFa1hIa3BPNEhwUnAyTDY5Y1IvZFNwMVBEQTVad2wzQ3FxYkk0VTFn?=
 =?utf-8?B?d0x3dkdTbm10SXBETjRZcVlLZjgraWpyNEtSUHpsSGtjQW82dTBpdmxsdXAx?=
 =?utf-8?Q?YpIrcahna6w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6395.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjhOa1RPcGF0ZjhZMW9pMUk3WWtVNEFwTXUyaDBlamU5bEdFdnVlRWtyYkhL?=
 =?utf-8?B?VE5FNm9BVEp1dWgyOHZWMFhNdXBuVFBFM2ZrWnM0Zk1FSmZHSWhjcEg2UXpR?=
 =?utf-8?B?NmRxNGM2WFZEUWx3dG84MTE4a0hyWnhsR2J0KzJxbkI4ZExRdkVBQXZ5WVZD?=
 =?utf-8?B?V0FaNWd2TEN2ZUlHWVlYWEVrWmpRVnpvOVJJRlN1WW9OaU1BSmZEdFZOOTJi?=
 =?utf-8?B?QkI4VUNiMWRTSE4relNYQ3ZHQ3gwa0t5aEhpdDdEZEp4dkNVanhaTGNpM3dF?=
 =?utf-8?B?MWJFNDVWQzhJWlhuV005Z25aVGNITU45RE8xWG1zNTBuN1dhMHpNNEVFWVQw?=
 =?utf-8?B?c0xHeHo2ZDMvQU1YUTNvdXlmOFlGaFdXeDU5TjdXQm9pRmZDMmkvQ2RaRXYx?=
 =?utf-8?B?dGdFQnNUdXRZcUR6NzZ1TWFmcENlajNXQTM2RXJkL0libTdEYy92UFNZVTlO?=
 =?utf-8?B?TlMrd1F0ODM2ai9kaTNGY3dmY0JuYnNsZFJFQkFLaFdWVFNtOVBkbnlQWGdk?=
 =?utf-8?B?Z3FhOXdSMTFoSXJ3RTJZSFdhaHZFMHJQSUcrSkFqQkM5cWsyVVIzanpyMkM2?=
 =?utf-8?B?d1FFRTZ5UmYvd0lhNlgraktzYlVNcUJVbUtmTUxHWWpRbUlYRk1hMXlMU04x?=
 =?utf-8?B?YmFMdnphM2o5aU05ZWx2ajJtN3lnNmRqVWhsUmxyTWZJc2s4Vjcva1ZrdzlS?=
 =?utf-8?B?cy8vVHhsbXpuV1VseFd4dnVFZ29ObTQvQ3VLaFhuSm5DajE4WVJ6aWZlYzNG?=
 =?utf-8?B?ejRhVUgyWXZDVlIyVW8rZG8zQmNsMHZSRDRoeGMrMVZ2MEdqNHJmTjh6UjFU?=
 =?utf-8?B?TCtpZW8wNUU3aFhDSW85MENVVWl6ZDN4YU9ORVV4R3NBd292ZUwyQmdNcEQx?=
 =?utf-8?B?RENXNXhPWDVWQldnQURsaW8yR0VpY0tLYWp5bkp4YjRpS1htSjA5Vkpwa2sx?=
 =?utf-8?B?TzVZTDk4QkZWOTZzVm9GUDB3UmhGeVRSbFhzUSs1empUcXBzbFV5UHZRWS9Y?=
 =?utf-8?B?QVN5YmdFR3BnNmdmYnZ5U00vdmFzcWZhZEtUT25uaytncEFRKzlVSUJGbUlS?=
 =?utf-8?B?clZLblQ3MWhQRHBUTkFNUVBjaW4yaTJobm5QdWllTEV5NndJM253Qkh4NE5L?=
 =?utf-8?B?aGtENEhPV0Zsc1JlaVdaeUZBY3JJc3ZLcUtCQnF1Z1Y2bVpLb2ZHQWxPUFdh?=
 =?utf-8?B?QngwNi8rTll5Sm9VbW41ZDVvcUlDSjNJeFg3aERxOWtXMGtxRWhMYVBrMDFG?=
 =?utf-8?B?b1RuQnFqMVRXUFJlaUhuSk4yK3BkS2V6RGdydStkTURiRkJVYUVoRmc5ZkZS?=
 =?utf-8?B?eGt3NWxxamZ1bUROdG1Yck5HNmk0empJVmtHditITkcrK0NLU3lSR2VXa0tZ?=
 =?utf-8?B?dVpQZW9TN3hGZCtRQ29USENla29FKzNBNmNRdjU2d04velZNSmdvZTBRekNx?=
 =?utf-8?B?QW1jVk94cWJoc2NHYkFNSWZkOXEyd0F3bDl6MElXVkgzbm83VkhEVURyUlps?=
 =?utf-8?B?MUFYOWpDcWRiYnBUY1BTMkh6N1Ard2VIVXZ5eXNqWVZGTTNmNUh5Njd5YTdv?=
 =?utf-8?B?V1dHdG5OK005UzFuSW9OMHRMN01ENzBBZ1dETWFXNS9rVUJQem40d21Oc0hN?=
 =?utf-8?B?WnNEcFYwR0crUjFPOUJMeVdxKzBPQ3RaOU5QZGdVdTJFTy9nTXNCQzVQeDdp?=
 =?utf-8?B?UlZqZEVjYlFRVUJaaW5QcGxIeDEwWGlqamI4NkhsL3dIMzJTbGdGbDk0K1du?=
 =?utf-8?B?UUxxZ2NSUlNZalhQZ0txNTQ0eDJDWXBKclh5RjlPQ0Vqdm50NXR4UHN4bTh6?=
 =?utf-8?B?UlpoTXhqZUVJMm14WTJUVHlYRS91bm9KTitSdmd1UWlBMlgzMUhGdEZzY3Zy?=
 =?utf-8?B?R0YrWllMRkpPWERUMm82a01jbVRRRmpuN2F6TzVTOXRSQU45S1RDU3ZndjFI?=
 =?utf-8?B?U3dvUVk5Nm5yTU5lOWxsMDcxV3BnU1BicWJ4Tlo0aWRLZndOMHV5eTRwSk5C?=
 =?utf-8?B?TitnczBYOU14UlU0YkUvK21PbGxNNzJnRTdEQ2szSitOSzh2Y2ptemZ5b2dF?=
 =?utf-8?B?VTlPbGZhdTZ4ekdXNjdZUkxMMFZId2ZIQWYza0g2aXJDeHVTOU9YdGkwSjlr?=
 =?utf-8?B?QUxjSTVSUXM3dVN5dDgyVTNOOHJpUHpzcGFHZFBERGxqUisrVjRsU3lQQUZJ?=
 =?utf-8?B?Unc9PQ==?=
X-OriginatorOrg: portwell.com.tw
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b166aeb-2e34-43ab-e0ee-08dd7e5264bd
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6395.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 08:24:10.1565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e309f7e-c3ee-443b-8668-97701d998b2c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TpJXGaPPYWqzfPCGbf4gPMBTY/K5p/P+6IIoV6QNdJLb7BaAVvEOhEgQIWeBFpQqWZvnu+N3DJgKCPfGtxJ+fBJW8IA1yMt0+m454XMSg40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5675

Adds a driver for the ITE Embedded Controller (EC) on Portwell boards.
It integrates with the Linux GPIO and watchdog subsystems to provide:

- Control/monitoring of up to 8 EC GPIO pins.
- Hardware watchdog timer with 1-255 second timeouts.

The driver communicates with the EC via I/O port 0xe300 and identifies
the hardware by the "PWG" firmware signature. This enables enhanced
system management for Portwell embedded/industrial platforms.

Signed-off-by: Yen-Chi Huang <jesse.huang@portwell.com.tw>
---
v4 -> v5:
  - Remove unnecessary `else` in pwec_gpio_get_direction()
  - Remove redundant watchdog timeout range validation
  - Rewrite pwec_wdt_get_timeleft() for rollover safety
  - Add missing comma in struct platform_driver and remove dummy parentheses
  - Fix devm_request_region() error message
  - Remove redundant pwec_dev null check in pwec_exit()
  
V3->V4:
  - Added select WATCHDOG_CORE in Kconfig
  - Removed redundant retry logic from pwec_wdt_trigger()
  - Added pwec_wdt_write_timeout() helper
  - Handled second wraparound when reading min/sec in get_timeleft()
  - Reworked DMI check and force parameter logic
  - Fixed error handling for GPIO and platform device registration
  - Fixed typos, log messages, and formatting issues
  
V2->V3:
  - Reworked based on review from Bartosz Golaszewski
  - Changed to use platform_driver and platform_device
  - Updated GPIO to use .set_rv() instead of .set()
  - Used devm_ helpers for request_region, GPIO and watchdog registration

V1->V2:
  - Addressed review comments from Ilpo Jarvinen
  - Add DMI system check to avoid running on unsupported platforms
  - Add 'force' module parameter to override DMI matching
  - Use request_region() to claim I/O port access
  - Extend WDT timeout handling to use both minute and second registers
  - Increase WDT max timeout from 255s to 15300s
  - Use named defines for WDT enable/disable
  - Remove dummy pr_info() messages
  - Fix several coding style issues (comments, alignment, spacing)

---
 MAINTAINERS                        |   6 +
 drivers/platform/x86/Kconfig       |  15 ++
 drivers/platform/x86/Makefile      |   3 +
 drivers/platform/x86/portwell-ec.c | 291 +++++++++++++++++++++++++++++
 4 files changed, 315 insertions(+)
 create mode 100644 drivers/platform/x86/portwell-ec.c

diff --git a/MAINTAINERS b/MAINTAINERS
index d5dfb9186962..c52f819786dc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19132,6 +19132,12 @@ F:	kernel/time/itimer.c
 F:	kernel/time/posix-*
 F:	kernel/time/namespace.c
 
+PORTWELL EC DRIVER
+M:	Yen-Chi Huang <jesse.huang@portwell.com.tw>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/portwell-ec.c
+
 POWER MANAGEMENT CORE
 M:	"Rafael J. Wysocki" <rafael@kernel.org>
 L:	linux-pm@vger.kernel.org
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 43407e76476b..3ceeb70897eb 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -779,6 +779,21 @@ config PCENGINES_APU2
 	  To compile this driver as a module, choose M here: the module
 	  will be called pcengines-apuv2.
 
+config PORTWELL_EC
+	tristate "Portwell Embedded Controller driver"
+	depends on X86 && HAS_IOPORT && WATCHDOG && GPIOLIB
+	select WATCHDOG_CORE
+	help
+	  This driver provides support for the GPIO pins and watchdog timer
+	  embedded in Portwell's EC.
+
+	  Theoretically, this driver should work on multiple Portwell platforms,
+	  but it has only been tested on the Portwell NANO-6064 board.
+	  If you encounter any issues on other boards, please report them.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called portwell-ec.
+
 config BARCO_P50_GPIO
 	tristate "Barco P50 GPIO driver for identify LED/button"
 	depends on GPIOLIB
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 650dfbebb6c8..83dd82e04457 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -92,6 +92,9 @@ obj-$(CONFIG_XO1_RFKILL)	+= xo1-rfkill.o
 # PC Engines
 obj-$(CONFIG_PCENGINES_APU2)	+= pcengines-apuv2.o
 
+# Portwell
+obj-$(CONFIG_PORTWELL_EC)	+= portwell-ec.o
+
 # Barco
 obj-$(CONFIG_BARCO_P50_GPIO)	+= barco-p50-gpio.o
 
diff --git a/drivers/platform/x86/portwell-ec.c b/drivers/platform/x86/portwell-ec.c
new file mode 100644
index 000000000000..fd01bb1bc69b
--- /dev/null
+++ b/drivers/platform/x86/portwell-ec.c
@@ -0,0 +1,291 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * portwell-ec.c: Portwell embedded controller driver.
+ *
+ * Tested on:
+ *  - Portwell NANO-6064
+ *
+ * This driver provides support for GPIO and Watchdog Timer
+ * functionalities of the Portwell boards with ITE embedded controller (EC).
+ * The EC is accessed through I/O ports and provides:
+ *  - 8 GPIO pins for control and monitoring
+ *  - Hardware watchdog with 1-15300 second timeout range
+ *
+ * It integrates with the Linux GPIO and Watchdog subsystems, allowing
+ * userspace interaction with EC GPIO pins and watchdog control,
+ * ensuring system stability and configurability.
+ *
+ * (C) Copyright 2025 Portwell, Inc.
+ * Author: Yen-Chi Huang (jesse.huang@portwell.com.tw)
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/acpi.h>
+#include <linux/bitfield.h>
+#include <linux/dmi.h>
+#include <linux/gpio/driver.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/sizes.h>
+#include <linux/string.h>
+#include <linux/watchdog.h>
+
+#define PORTWELL_EC_IOSPACE              0xe300
+#define PORTWELL_EC_IOSPACE_LEN          SZ_256
+
+#define PORTWELL_GPIO_PINS               8
+#define PORTWELL_GPIO_DIR_REG            0x2b
+#define PORTWELL_GPIO_VAL_REG            0x2c
+
+#define PORTWELL_WDT_EC_CONFIG_ADDR      0x06
+#define PORTWELL_WDT_CONFIG_ENABLE       0x1
+#define PORTWELL_WDT_CONFIG_DISABLE      0x0
+#define PORTWELL_WDT_EC_COUNT_MIN_ADDR   0x07
+#define PORTWELL_WDT_EC_COUNT_SEC_ADDR   0x08
+#define PORTWELL_WDT_EC_MAX_COUNT_SECOND (255 * 60)
+
+#define PORTWELL_EC_FW_VENDOR_ADDRESS    0x4d
+#define PORTWELL_EC_FW_VENDOR_LENGTH     3
+#define PORTWELL_EC_FW_VENDOR_NAME       "PWG"
+
+static bool force;
+module_param(force, bool, 0444);
+MODULE_PARM_DESC(force, "Force loading EC driver without checking DMI boardname");
+
+static const struct dmi_system_id pwec_dmi_table[] = {
+	{
+		.ident = "NANO-6064 series",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "NANO-6064"),
+		},
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(dmi, pwec_dmi_table);
+
+/* Functions for access EC via IOSPACE */
+
+static void pwec_write(u8 index, u8 data)
+{
+	outb(data, PORTWELL_EC_IOSPACE + index);
+}
+
+static u8 pwec_read(u8 address)
+{
+	return inb(PORTWELL_EC_IOSPACE + address);
+}
+
+/* GPIO functions */
+
+static int pwec_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	return (pwec_read(PORTWELL_GPIO_VAL_REG) & (1 << offset)) ? 1 : 0;
+}
+
+static int pwec_gpio_set_rv(struct gpio_chip *chip, unsigned int offset, int val)
+{
+	u8 tmp = pwec_read(PORTWELL_GPIO_VAL_REG);
+
+	if (val)
+		tmp |= (1 << offset);
+	else
+		tmp &= ~(1 << offset);
+	pwec_write(PORTWELL_GPIO_VAL_REG, tmp);
+
+	return 0;
+}
+
+static int pwec_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
+{
+	u8 direction = pwec_read(PORTWELL_GPIO_DIR_REG) & (1 << offset);
+
+	if (direction)
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
+}
+
+/*
+ * Changing direction causes issues on some boards,
+ * so direction_input and direction_output are disabled for now.
+ */
+
+static int pwec_gpio_direction_input(struct gpio_chip *gc, unsigned int offset)
+{
+	return -EOPNOTSUPP;
+}
+
+static int pwec_gpio_direction_output(struct gpio_chip *gc, unsigned int offset, int value)
+{
+	return -EOPNOTSUPP;
+}
+
+static struct gpio_chip pwec_gpio_chip = {
+	.label = "portwell-ec-gpio",
+	.get_direction = pwec_gpio_get_direction,
+	.direction_input = pwec_gpio_direction_input,
+	.direction_output = pwec_gpio_direction_output,
+	.get = pwec_gpio_get,
+	.set_rv = pwec_gpio_set_rv,
+	.base = -1,
+	.ngpio = PORTWELL_GPIO_PINS,
+};
+
+/* Watchdog functions */
+
+static void pwec_wdt_write_timeout(unsigned int timeout)
+{
+	pwec_write(PORTWELL_WDT_EC_COUNT_MIN_ADDR, timeout / 60);
+	pwec_write(PORTWELL_WDT_EC_COUNT_SEC_ADDR, timeout % 60);
+}
+
+static int pwec_wdt_trigger(struct watchdog_device *wdd)
+{
+	pwec_wdt_write_timeout(wdd->timeout);
+	pwec_write(PORTWELL_WDT_EC_CONFIG_ADDR, PORTWELL_WDT_CONFIG_ENABLE);
+
+	return 0;
+}
+
+static int pwec_wdt_start(struct watchdog_device *wdd)
+{
+	return pwec_wdt_trigger(wdd);
+}
+
+static int pwec_wdt_stop(struct watchdog_device *wdd)
+{
+	pwec_write(PORTWELL_WDT_EC_CONFIG_ADDR, PORTWELL_WDT_CONFIG_DISABLE);
+	return 0;
+}
+
+static int pwec_wdt_set_timeout(struct watchdog_device *wdd, unsigned int timeout)
+{
+	wdd->timeout = timeout;
+	pwec_wdt_write_timeout(wdd->timeout);
+
+	return 0;
+}
+
+/* Ensure consistent min/sec read in case of second rollover. */
+static unsigned int pwec_wdt_get_timeleft(struct watchdog_device *wdd)
+{
+	u8 sec, min, old_min;
+
+	do {
+		old_min = pwec_read(PORTWELL_WDT_EC_COUNT_MIN_ADDR);
+		sec = pwec_read(PORTWELL_WDT_EC_COUNT_SEC_ADDR);
+		min = pwec_read(PORTWELL_WDT_EC_COUNT_MIN_ADDR);
+	} while (min != old_min);
+
+	return min * 60 + sec;
+}
+
+static const struct watchdog_ops pwec_wdt_ops = {
+	.owner = THIS_MODULE,
+	.start = pwec_wdt_start,
+	.stop = pwec_wdt_stop,
+	.ping = pwec_wdt_trigger,
+	.set_timeout = pwec_wdt_set_timeout,
+	.get_timeleft = pwec_wdt_get_timeleft,
+};
+
+static struct watchdog_device ec_wdt_dev = {
+	.info = &(struct watchdog_info){
+		.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
+		.identity = "Portwell EC watchdog",
+	},
+	.ops = &pwec_wdt_ops,
+	.timeout = 60,
+	.min_timeout = 1,
+	.max_timeout = PORTWELL_WDT_EC_MAX_COUNT_SECOND,
+};
+
+static int pwec_firmware_vendor_check(void)
+{
+	u8 buf[PORTWELL_EC_FW_VENDOR_LENGTH + 1];
+	u8 i;
+
+	for (i = 0; i < PORTWELL_EC_FW_VENDOR_LENGTH; i++)
+		buf[i] = pwec_read(PORTWELL_EC_FW_VENDOR_ADDRESS + i);
+	buf[PORTWELL_EC_FW_VENDOR_LENGTH] = '\0';
+
+	return !strcmp(PORTWELL_EC_FW_VENDOR_NAME, buf) ? 0 : -ENODEV;
+}
+
+static int pwec_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	if (!devm_request_region(&pdev->dev, PORTWELL_EC_IOSPACE,
+				PORTWELL_EC_IOSPACE_LEN, dev_name(&pdev->dev))) {
+		dev_err(&pdev->dev, "failed to get IO region\n");
+		return -EBUSY;
+	}
+
+	ret = pwec_firmware_vendor_check();
+	if (ret < 0)
+		return ret;
+
+	ret = devm_gpiochip_add_data(&pdev->dev, &pwec_gpio_chip, NULL);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to register Portwell EC GPIO\n");
+		return ret;
+	}
+
+	ret = devm_watchdog_register_device(&pdev->dev, &ec_wdt_dev);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to register Portwell EC Watchdog\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static struct platform_driver pwec_driver = {
+	.driver = {
+		.name = "portwell-ec",
+	},
+	.probe = pwec_probe,
+};
+
+static struct platform_device *pwec_dev;
+
+static int __init pwec_init(void)
+{
+	int ret;
+
+	if (!dmi_check_system(pwec_dmi_table)) {
+		if (!force)
+			return -ENODEV;
+		pr_warn("force load portwell-ec without DMI check\n");
+	}
+
+	ret = platform_driver_register(&pwec_driver);
+	if (ret)
+		return ret;
+
+	pwec_dev = platform_device_register_simple("portwell-ec", -1, NULL, 0);
+	if (IS_ERR(pwec_dev)) {
+		platform_driver_unregister(&pwec_driver);
+		return PTR_ERR(pwec_dev);
+	}
+
+	return 0;
+}
+
+static void __exit pwec_exit(void)
+{
+	platform_device_unregister(pwec_dev);
+	platform_driver_unregister(&pwec_driver);
+}
+
+module_init(pwec_init);
+module_exit(pwec_exit);
+
+MODULE_AUTHOR("Yen-Chi Huang <jesse.huang@portwell.com.tw>");
+MODULE_DESCRIPTION("Portwell EC Driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1


