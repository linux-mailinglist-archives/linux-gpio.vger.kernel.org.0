Return-Path: <linux-gpio+bounces-18905-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DBDA8AED5
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 06:10:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46EDD18954B3
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 04:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7593A227EB9;
	Wed, 16 Apr 2025 04:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b="NXbtdUVm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023095.outbound.protection.outlook.com [40.107.44.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3EB2DFA49;
	Wed, 16 Apr 2025 04:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744776628; cv=fail; b=NSzsMKAyiwcMk8s72571PyvrbL/QyzVfz1IpELiCK1w2cRlTctZDsOe2INiCzGcS+WAH+R5fq2qGIcrzpXgrnhpg6Gdu2pyBA7pglESlYEv50KdDR3x+XugDI6ZaRqZ/gmtM1/CeLRgs85sx93khMkoCL5JRCubrbDSKxQ/X3rY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744776628; c=relaxed/simple;
	bh=vHVSjwi7mTKnV0Gyz6DqTuOohw4sBhv9WoRY2kxbKrQ=;
	h=Message-ID:Date:From:Subject:To:Cc:Content-Type:MIME-Version; b=dSoKWWEXs/DytTuLaJyMiSi24GyyN1scpI+Qn+jTeh9DIno+IPzkMnb7EUXutT9JNPEI+kSqVun24jdrBI1uPraZM4GqED4komU1q1bvKRF2ZMxzNHOpkq6+uApJxAZ+K4x9YY1vHsmdbj4oNJAhmDHtygphuvWs/3ZNCy8Viok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw; spf=pass smtp.mailfrom=portwell.com.tw; dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b=NXbtdUVm; arc=fail smtp.client-ip=40.107.44.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=portwell.com.tw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z8WrwFzgR1YBGxlmG6a09WVkdboBNmvAWGglg748Idx50majXdmm0CBLipFPVY5unGtey0NUpfIMjsY4tgh5Bh7aNowhLTLg5Vxfb6VehedeLqAiraUElPiGo3hSUNeeP6Ib0VwZwpqbvxkJeaL1O2wllyCyEgW9hdFbIy4wHBUbhr+GVvdsNkgSWGqzueUVbw8swYXnaGEnKXlBQ5Qe6YoTHT7UTlhI3zRaDz8W+tRGG9RSOSQXBnVS6xb7qpZKbSgO6WDHRSKxIftFd3SN0Kv+3a6U9w7X+0v4zwmj9rCrlheWOrwCWJoo38b3qrPswx8itPzuHHWczZzUFQOPUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m6S0bh4b2LTOA3gLYzp1dK/s4AlwcUkTx7ulpmZCixA=;
 b=hKYU89nb/Ck7cc1rI1W0ce57XnpMAsYYuB8mVcTUzQ84/CdvQrzRZQxJm1KfPwPDpnkLwhgdEvfBpXmnyoSYMvoqIPuUIsLZYWSKQpIyv2grsToTkVBSHj+Ei+wpeMojq+s5OlcccZG5FE8Q0A3tl3XH3uad75M3GJ6/R3+61czA29uOpLgJWvECiserC2/J27qDB3uWFytvzTZQzXVQIAD7ebG1ggIv6oVgF14j3FSZzv2yVUUN3uL6nWZtHX1/SJu56Pjm3gCnZV9A91XRKzOJoAtTnZvSeJ+lYoaoRopSq2vHaeBN7ck73qKkbGJLUhDbr44kKhZobkU18J+vlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=portwell.com.tw; dmarc=pass action=none
 header.from=portwell.com.tw; dkim=pass header.d=portwell.com.tw; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fetCA905017.onmicrosoft.com; s=selector1-fetCA905017-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m6S0bh4b2LTOA3gLYzp1dK/s4AlwcUkTx7ulpmZCixA=;
 b=NXbtdUVmeO8Odr0LfHzK+JGBidFA+Bbd2ZiyU/j7kW88TC8zTvVIclV954TSckX/V4Q+lw5tQFxNg6aj57j2N59SZikrgHUcrchNbfSwbcEfOZGkUPfLXZjG1Jyvxo5nbS9ZOPtqv/RMGqto3LYXqqS/wOcCNY2JxYC+7uAoRwhiudU8BX9Esg7pHft3Fg6CUSO4Pg01l6LjhQ38P62xb2k1ohqzvC99pWsvMcVLCRXvEmptLTyvTv/1LErFLWs87EjI64JbQJenR+EjHohdF5JqL+dVRLgdUIeDPGOb7JVe5AfAQZWzEegccfd3dKIuzr3B9uva+caRlHBsmALiyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=portwell.com.tw;
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com (2603:1096:820:e7::10)
 by TYSPR06MB6970.apcprd06.prod.outlook.com (2603:1096:405:30::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.29; Wed, 16 Apr
 2025 04:10:19 +0000
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224]) by KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224%3]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 04:10:18 +0000
Message-ID: <3096e0c7-f215-4a51-9a84-b2b64514ffd6@portwell.com.tw>
Date: Wed, 16 Apr 2025 12:10:16 +0800
User-Agent: Mozilla Thunderbird
From: Yen-Chi Huang <jesse.huang@portwell.com.tw>
Subject: [PATCH v4] platform/x86: portwell-ec: Add GPIO and WDT driver for
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
X-ClientProxiedBy: TP0P295CA0003.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:2::9)
 To KL1PR06MB6395.apcprd06.prod.outlook.com (2603:1096:820:e7::10)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6395:EE_|TYSPR06MB6970:EE_
X-MS-Office365-Filtering-Correlation-Id: 759253fc-665f-4267-f17a-08dd7c9c9945
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RDR1STdpMnZzbVZSdjhDTi9wVmZpN2VGbDZQbjI4cUlqb3M4UURZS1Y0N1hr?=
 =?utf-8?B?TXhlMmx5MVRPQ3phMmtpOC80Z3VTV2dSRFQ4Um94RFZreXNzQlBqOUY3bGVj?=
 =?utf-8?B?cDRwZk9NM1RqTGtoM1dOWW5WWFZKRzhJQXRpYksraHVvbTN0VTJDZG5MQ3ps?=
 =?utf-8?B?Z0F1MlhLU0dIQy80VmFTbExPTzlBOVhORjBJR1pCRTRVS3BpUjVlOXVIYUti?=
 =?utf-8?B?UnNNbHd1SVdvK25acENPWHNVWXhhQTVKejdGVDlmZHFVRlpLc0haRTJXVHFq?=
 =?utf-8?B?Y1diTmY5U0lMd1RlblAwSlVMSDhkSUFxOXM4K21zU2tmZW1IRDdWRmxHMWow?=
 =?utf-8?B?OWhNOVZadXpZaUpDRUpxbGlGL0VCZDI0b1dDKzJia3c0c1p6QzU0cVcvVTZv?=
 =?utf-8?B?RWgydCt6bml4dXR3aEVtaGpibmpuWTFEaXJabkg1ODlkZ1l5b2VFQktQN0JM?=
 =?utf-8?B?N0F3Nk5UbnVONUtCRFNrWEFGWThjU1dDRkZTSjJLRkg3aEZLUzFOMUlvWDlD?=
 =?utf-8?B?OVVYK2d5Z3lTQi9KaDZVcXJmLzY1d0dRVWhKZXBYbnZSSzA3QWNzN3VyRmpr?=
 =?utf-8?B?UnUzV2RnQ3VwZWVVWlYrbFhGTEkwQWI1MWpOTUVqcHhKbW5HQUowZ0drR1hP?=
 =?utf-8?B?eFI4ajg2MDYzN0dSbnE4RnhHUHJmSDRMUjhhbEQvMkJ1UUxXR3lUSTQvWjhq?=
 =?utf-8?B?RlE4aDNrYUxtYjRYdnlIOWdkWG10d0g3Ui96d0c1V3dwOEVDV3F3aGd6TmZj?=
 =?utf-8?B?d2R6aXpESmk1cVBPeVNJL29iZS8zSTFUYTlPa3RsU2ZmQkdIbXF2T0t5OTJm?=
 =?utf-8?B?SmVGUStNTFBRUTNRcVJOb1k4LzRyNk1lTVlucjJXM2RhUjlqRU0vNmMrMjFR?=
 =?utf-8?B?WURDMHp0UUdyWi8vTmpsWnYxdkdUKzFiNThGeUdLTUxwa0U4WGxpa0FaUDRx?=
 =?utf-8?B?OVJ6T0IzNkFpbEFsOElwWU9FUCtjYzI4RmRQNlpIS1hNNGI5L0dlRlFqZEpI?=
 =?utf-8?B?L2pGVkgza05Ka3plSFBEUllreElVNHlpUUs5NDhCYkQvU2dFaVAwWjh0TFNZ?=
 =?utf-8?B?M1ZqU0dCOVd6bGZiK0l6d2NIeGlaYzFKdnNnblRRMUsvZlMwTmhqQzdUdDBD?=
 =?utf-8?B?Vk80OVNFN3N3QVkzbUxsejBHM1B1TFc4REN4L0FTQ0RWc0gxU2FSWGRKWEJt?=
 =?utf-8?B?TU03TDhXV1hLSXVuVW1pdUszUWd1bWdiaUN0RXNWYm1kbVBYQTc4aUsyNUZN?=
 =?utf-8?B?ZDcrQnhhYW9xTk9zZ0hjZjFqcm03UnEzL29jVEh4WkpjWmVVblhvQnVvcXhE?=
 =?utf-8?B?WHR3NFZFWVgvWHFScVJ0VHJRRTdLR2xpUEMwRjFHRzVSRFd6UFloTU9oc2hr?=
 =?utf-8?B?S3RxRFlEaHIybUIvb0g1WERNb0duT1UzbnhyZHBlWWs2bW5RMjdHUG9kS1FG?=
 =?utf-8?B?dUlUQ0hsYXQvYTdmT0l5bmMvUXRlbHQ3TjZFKzJwd0FxTW4rZzZjaWQ3d1VL?=
 =?utf-8?B?OW9scFBSNVBtZEFQOTN3eGxDSUxWeWpxMFpqbDh5SElLVnRON29oQXpOZFhs?=
 =?utf-8?B?MjhFUW5FeEs2ZTVwZEpOQWhEdmFEei9iVkY1Zm1YWTc1LzhJbnN4WldFRVlY?=
 =?utf-8?B?K0xsT3ZJazFyaEF6SXFkU0hVbHZna2RlWm8rcUlBV2Y1TExlQjBSc0F1NENY?=
 =?utf-8?B?NlZ6YWtlMnFSNWNHbFc4ZWZxNUtDZ2UvWmlmd1ZZUWlURnpVSTZ1S1VSM3Zo?=
 =?utf-8?B?K080VkpWWER1RnAybGk2TW9ESVhLblB1ODExK0daeXk2Z2tDcjB0bTFVSDJE?=
 =?utf-8?B?bVlKbkRNU2JsVWtSN0hOMCt0bFNRQ25vekhKUVoyM2Q2NTRiZitEeWFvNWc1?=
 =?utf-8?B?dklrejlYdDdzQ0ZGMkQ5czVmVmxEdHR0YVRNb0VzUU5FU2RvY0JUWEVCQUh6?=
 =?utf-8?Q?TNz4ESN6JcU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6395.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elFZdXV0bGpINFVOdWVSVy9jaHorSUpoK1JvSkdwN3hOS0JBTFY5Q3NCTzk5?=
 =?utf-8?B?SE0yaVd6RlZJajVxTzI0b2lpT2FvM0ZQNkgwbUtJR0dWa0pQcHBnVjVNYnVJ?=
 =?utf-8?B?L2RmN0VHeTNEUGNnZXU3OXQvZEpoZkY4c2pzZmE2ZmhLUFZlU1hkZmZ2dDVH?=
 =?utf-8?B?TVJSZzVaQnFMWHFaM1ppSVpTSlI4VTVqd2xleFhnQVhJa1ZWY1pKTE54WUFD?=
 =?utf-8?B?R2FaK1lVaWxPdDhRTThWUmlQTkxGMXltN093MTBIMGtRNnJKMldoSGxoRjli?=
 =?utf-8?B?dWZOeEZERStROUx4di9kZlFzb0hZaHV3Qk5ZV25uWFdJV2IvOWRXMjZqRk5u?=
 =?utf-8?B?eUZhOTZ3QmhzKzU4UWVBRG5KRXNZYlk0cmJWdzhqT1E5ZlBpQmd2RnlTRnJI?=
 =?utf-8?B?alVzNG9PMVVYUFJkS21jT2Z6U1Z6bXlueE9jTFhyWWZLcXovUWVSUStDYkpi?=
 =?utf-8?B?VythYzR5T0Y2VStrcUFkOFJXK3VQcCt3ZGF6MUhSZmlsZzFsTlJjekcrSzlL?=
 =?utf-8?B?M0djZ1BqODc1V2dheHJYMWFvVmVvVUFDa1RmcUxUd0hlM3BONEtNN2FlVmFG?=
 =?utf-8?B?dDU4UGZ3ajJUZkhKSjVtM1puNHlRMlRNMEM0Slh4RVlETlp5aE9IUnNpUVh1?=
 =?utf-8?B?N2lVVDkwcFE2UDkrM2ZDT0o3a3ZDSXJtaTlXRGx0UTZSRXZzVWhCVDluWWo2?=
 =?utf-8?B?Y3YyWG9pTmNla1RXMGJPY3ZDRytsZ1N5M2hyenRva0dkdit2SkRlc1ovZTY0?=
 =?utf-8?B?UFBDTGRxbU0rVWxPZjFqWnJRRkVHNmpBVWdab3MxeW9JWlVENDJEeVp1TWl5?=
 =?utf-8?B?aGRwOU9MK3ZnZFEzbkRNYkp4STB6WTN6QnVuZzRpaVVIbmkvRGJTQXhVRHQx?=
 =?utf-8?B?TmlSRGtpTk9ocXFXaXk2eVAwWGZuUWhYb2xaeHc2OXBhcnlUVUNRd3Y3WVVh?=
 =?utf-8?B?R05aZ3NnTW1Calc2QmdTY3E2TXZjVFhuckM3eTFTS04yM2pGQmhkZjNJMWdN?=
 =?utf-8?B?MDA1aTl3Zjh3aTBlQ2NTNExrM284ci9ZbjhmWXQ5R2YybTFCUjU1WkV2REF6?=
 =?utf-8?B?dzZINURpTmlGNzVOWWNVbWRldnpsZTVuUHkxWUVTbnpPT0Y1akpUNFpFc3pK?=
 =?utf-8?B?S3NHbTg2Nk9HcUcrTGYwZGtiTTNhalFSODhtaEJXOU0yY2ZMcnVGV2sxNUE4?=
 =?utf-8?B?amxmaWRwem96Z3pHNzBRT2VGZ0RDb0sxUjlTU0VlUEZQNU9uWGpwQTYwZktU?=
 =?utf-8?B?aVZwS1RLaWFoK0hlTWxGSVR6TnkxeTc2MUtrZmRobXIyNVZsaXpVK2hFMjk1?=
 =?utf-8?B?dFFhV1FrU205L2l6Q3dTUHJEWkZzMVlZY01uUVNnM3pjTVZiRGtYRmIrNkZB?=
 =?utf-8?B?dVRCRUxRamNBeThRUjNlSFM2RWxFSytYdDdCUlZkejErbjBYZjhzZStSYXlU?=
 =?utf-8?B?MUlmdjhpVmVpWUZ1UG5tdlQ5cEJJRW9VdSs4Q3JhN3h1Q1YrQ1RwSzVCNDdo?=
 =?utf-8?B?Mmp6bzRWeTVxeURIS2tzNmgwbjBPMWVZT1lVUVVXVUkxSHVVb3ZYeEdhSmNk?=
 =?utf-8?B?OW51RHoxTExYWnJtT2NjMnMwQ1R2UjdTYUNHTkVWZ1Q3RXJKNmQwK20wNTcy?=
 =?utf-8?B?OGt4QmdmelJMUmNnNFdZM0N2emF5TU82UWJvUkZnN05NelU1L3BWcU9XTGJY?=
 =?utf-8?B?MmJ5MFkwbitnckVFbW51cVYrWXJWZ2dkV0NTVHptZHdkandXNEFRdkFkM2k4?=
 =?utf-8?B?aFlaMVFUcXZjVVBqcTBPREFObWZud0IxUWdJTWVXRjVRbmEzL2h3c2xKb082?=
 =?utf-8?B?ZGNqRUlKODAyWnFyVTZiVjhmam5ld0lzOGpjeXUyMTRlZ0tDN0NXeisvbDVQ?=
 =?utf-8?B?ZWZvNUxqcGhRVnJKMDBFV3MxNERCdmMvaVlsVCtKZHRDRVAwa0QyUndYRzdy?=
 =?utf-8?B?aEZ6QVZ1TmZjVGIvTXpRUi9NTlhWeldDdVJnR2szNXBhd3RYSzZYSkJPRVlH?=
 =?utf-8?B?dnF2TTdHUCs3cEZ6ZEt5eFR1RHpvdjhBS2xtNFBOam9oTGg4N1NMYkVEZ3Vn?=
 =?utf-8?B?Yno2aUNxRnZyZVRES2trcVdGUGtDZUdpTnRrMkJra24vN1djQnB0TFkrRGpr?=
 =?utf-8?B?N0ovMWNvUXZqZklSS1BNTVNWdGJUODJDeXFyVThURWE1RUx5aFhxblkwNldt?=
 =?utf-8?B?dFE9PQ==?=
X-OriginatorOrg: portwell.com.tw
X-MS-Exchange-CrossTenant-Network-Message-Id: 759253fc-665f-4267-f17a-08dd7c9c9945
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6395.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 04:10:18.8136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e309f7e-c3ee-443b-8668-97701d998b2c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W1R0oG9N0T7EVDA+hi2yzvyRv0lcRBbYnWo+YZv5rEyiitKe9p0mPwrY5zR24hFD+BNY677iR3FF4TTT2Eg48ezPHEFXWKjegq31+HACh/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6970

Adds a driver for the ITE Embedded Controller (EC) on Portwell boards.
It integrates with the Linux GPIO and watchdog subsystems to provide:

- Control/monitoring of up to 8 EC GPIO pins.
- Hardware watchdog timer with 1-255 second timeouts.

The driver communicates with the EC via I/O port 0xe300 and identifies
the hardware by the "PWG" firmware signature. This enables enhanced
system management for Portwell embedded/industrial platforms.

Signed-off-by: Yen-Chi Huang <jesse.huang@portwell.com.tw>
---
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
 drivers/platform/x86/portwell-ec.c | 298 +++++++++++++++++++++++++++++
 4 files changed, 322 insertions(+)
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
index 000000000000..a16dcd96eab2
--- /dev/null
+++ b/drivers/platform/x86/portwell-ec.c
@@ -0,0 +1,298 @@
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
+	else
+		return GPIO_LINE_DIRECTION_OUT;
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
+	if (timeout == 0 || timeout > PORTWELL_WDT_EC_MAX_COUNT_SECOND)
+		return -EINVAL;
+
+	wdd->timeout = timeout;
+	pwec_wdt_write_timeout(wdd->timeout);
+
+	return 0;
+}
+
+/* Ensure consistent min/sec read in case of second rollover. */
+static unsigned int pwec_wdt_get_timeleft(struct watchdog_device *wdd)
+{
+	u8 min, sec1, sec2;
+
+	sec1 = pwec_read(PORTWELL_WDT_EC_COUNT_SEC_ADDR);
+	min = pwec_read(PORTWELL_WDT_EC_COUNT_MIN_ADDR);
+	sec2 = pwec_read(PORTWELL_WDT_EC_COUNT_SEC_ADDR);
+
+	if (sec2 > sec1) {
+		min--;
+		sec1 = sec2;
+	}
+
+	return min * 60 + sec1;
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
+	return (!strcmp(PORTWELL_EC_FW_VENDOR_NAME, buf)) ? 0 : -ENODEV;
+}
+
+static int pwec_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	if (!devm_request_region(&pdev->dev, PORTWELL_EC_IOSPACE,
+				PORTWELL_EC_IOSPACE_LEN, dev_name(&pdev->dev))) {
+		dev_err(&pdev->dev, "I/O region 0xE300-0xE3FF busy\n");
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
+	.probe = pwec_probe
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
+	if (pwec_dev)
+		platform_device_unregister(pwec_dev);
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


