Return-Path: <linux-gpio+bounces-19679-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E02AAAC143
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 12:23:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 050D3160985
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 10:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 095552750F1;
	Tue,  6 May 2025 10:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b="U+J6jc+a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11021129.outbound.protection.outlook.com [52.101.129.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D347027605F;
	Tue,  6 May 2025 10:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746527006; cv=fail; b=KqRfKCRQBXqk/SSvvoasmKFmlPRNVFWu6UTytBuHpGsXoROTvGJGv9L/mNzoy5Qmn0A31CK23hlbhOzanYqled59M7MUULn+qu9WVVKRbkEitcr8VhsF5R7s4bjUc0ntvQQm73xv1+wdSfgGYKuWyKvS4Y8GnBH61pr5BZ+5ZVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746527006; c=relaxed/simple;
	bh=bRPhMM2/HiTW+cxle+B8AsDbUwvCUm1Oafcvd66pQ+U=;
	h=Message-ID:Date:From:Subject:To:Cc:Content-Type:MIME-Version; b=I1YxAuM8/1LoO1YTJ0ecKHcm8YlIckzniU/W6SWav9V7I+unxNtQww453XWDjebxjWFGbnAshkNqVnshQuZpfWbpXFFvvqHu1QZMsDOV7BqZrJTMG7Jq3GNUjNZugVfvWscP378tpR8AwKnHvuptvz4LdxaElecA9REPjuF/xdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw; spf=pass smtp.mailfrom=portwell.com.tw; dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b=U+J6jc+a; arc=fail smtp.client-ip=52.101.129.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=portwell.com.tw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V6bxyt9TjgkqV9k95gnhHV3bw1S49UIFDJNJFxF/U1FYQK/1gOO2E8m9/Ca4Lo0Ny69lVkTRNmft2it1q2041aj2A9f1B3smC4dWS+qVFwCCvSQ+jUezokn5DkwI3vhVZbsoYlLf3202Uyg1tQdqdrT23aajvdNDW2lxOe5b6+dZmBkQA+LiUb0Ns6G6oqFRhZ5CIR/b06fq9Y63MKL5GZPal9lAL5Mg2wkbiYZSeCKhv3IccWTV0C/Y/sJ4kGbOrk/FpT2598K4FziQ+TtLF/BiJPtI/gOuy8458Fppt1fnPI6gygzOWB2Lp5JMW3m+XwiOM0b7hQCDF+iKFIk7RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qFcmUhLohpfr/jkxQN3Q8fux1SRpxxVvpBZK7T85Cg=;
 b=jhORY52XEL38g2ICzDe6bO8p3AMJl6eeOH6JZ15m4vSP/vk8vYts6eBqaECAXxjwLEhle4BtdqBPfkQlUGc7Isu4z+q3gNP+60VUufVr7CmaAYJ34nCrcr3MoBpS1gSv1HEEqRYtDjO1yiBmDZkdRAPxsfwS04BUqZtq9OsB3RNFP+jUaS9jepwAs1GScl6mswSuSmfUzJZK79aB8yd13bViMyN87yXWglHTuD2jKtLIwcphXxQUbiTOHlovqwvcjsAghzidptZiDNSoa2wu33qs7ITFaCr0O3DXzuySvX3G0wn2bfnL5uiKZ7o++0UUv36alV4ZEhxE+oywygrrFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=portwell.com.tw; dmarc=pass action=none
 header.from=portwell.com.tw; dkim=pass header.d=portwell.com.tw; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fetCA905017.onmicrosoft.com; s=selector1-fetCA905017-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qFcmUhLohpfr/jkxQN3Q8fux1SRpxxVvpBZK7T85Cg=;
 b=U+J6jc+a3g5+LMG+7K8CB3JORemyxw+mH9tYq69O+K/ivnhYSg+qO6aDxsAQyEXZKWXbJQ3QhnOnDrSgJ6esNvKXHHZ97K31jSFrhrP5OmAUNeZKb4irAEUyS49VWIUC/0K1g3skJxcJN0KCIbiHwhWX4Gpq90n9uHerjEGzoXfIbXtfhGldk8T98jKW0286jDkhCFROxUgktmN6gafjpv9pi7YG06tOzrGdGOxf9vYB1bwu7n9ohOF3hWXtWt4KF6PP1eYsuJQffZZf0jAvsVTInBkqDJfEUNkHPZrB9VdUT3Fj6F/JbhoOJv0ei8SNxQRAoS5quVlbS8lZUglO6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=portwell.com.tw;
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com (2603:1096:820:e7::10)
 by PS1PPF80815FF87.apcprd06.prod.outlook.com (2603:1096:308::259) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Tue, 6 May
 2025 10:23:17 +0000
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224]) by KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224%5]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 10:23:17 +0000
Message-ID: <a04be962-b207-4085-af5b-523f59bffcbc@portwell.com.tw>
Date: Tue, 6 May 2025 18:23:14 +0800
User-Agent: Mozilla Thunderbird
From: Yen-Chi Huang <jesse.huang@portwell.com.tw>
Subject: [PATCH v6] platform/x86: portwell-ec: Add GPIO and WDT driver for
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
X-ClientProxiedBy: TPYP295CA0039.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::10) To KL1PR06MB6395.apcprd06.prod.outlook.com
 (2603:1096:820:e7::10)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6395:EE_|PS1PPF80815FF87:EE_
X-MS-Office365-Filtering-Correlation-Id: 28f30191-4715-4ff0-320e-08dd8c88043b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UDZtZlN4Y0lkQUNURXArSEsxMkxUVnpFZjFuc2Y3Q1R2Tkcvb2huQkR5cWdq?=
 =?utf-8?B?SllJaWRhSnpZRVpHWlhrVUdRS0pTd0d0c0RlanNQNUtmY1pJaURqdmRZK3lr?=
 =?utf-8?B?UHV3RTBCWGJ1VllPOVNyTk9jbjBZMnNORWhPSlFrSlJZY0tqSDN0QjRDbHB1?=
 =?utf-8?B?ekNMM3JxYVdOR3dERkFoc2FJRlRleU9XaFlTY1FUMHh0Y3JmMlRrcC9CTG52?=
 =?utf-8?B?YTlyUnJKWitmZm5TNEhLSDc0UmcyUlVkaG4rQjRPQVZkdEdqbmQ4K3d5N0lj?=
 =?utf-8?B?YWdjTzFIMXgrRjZOd1YwbDhmalJzaytXY3BITXFjWkJNTXBHcVVIcWFtMjhX?=
 =?utf-8?B?Z3AyUXg3dllRVTg3emxyUmpOZ2VYbDNkSnJiWkp6Q3hOQVE0ZDhqemE4QU1a?=
 =?utf-8?B?N1JYaTRJNXZySUJ4UThKaUtTazAvaXRVOWFQcmRENitPRDA0Rlh3eHBPZURO?=
 =?utf-8?B?WTdwalJEdHZPNWxCdVk3OTdkRlJWS0JJN0w1Rm10dlFsaTE4TzVscGZQQkVU?=
 =?utf-8?B?SlBvZ0xKcGNiM0xNNFJ1VWRQTnBodTRRaFlwaTRUa0c5MUo0ZGFPT3ZKUUtZ?=
 =?utf-8?B?RUJtZUg4YWVOZzRDeG1KeXJzbUJKS2N6U2VEYUY4eUI4QXdTcU5yVDMycit0?=
 =?utf-8?B?T1NJZGZPcjhaMGlZcEsvRGQ1NXRISmlhaVgxMTBla0NqZk1Nc3dqeWRoT0U4?=
 =?utf-8?B?aUVSMm9raDhISWhrZlZqQWFHdERhdXVRZE9kOHBaVWFXY2x3UENZaEhmSXRY?=
 =?utf-8?B?ZTlJVnE5NFhtQkpJc0V1elNrQ1JqK0ltR1dreUwrUFpTUDVIMVUxSDY1THVC?=
 =?utf-8?B?bHg0YUd0UENrM1JRdEtha0cyaUhQdTJoc1hLakpxV25JNzBGRElnSzNoRmF3?=
 =?utf-8?B?b2g1VFJHYWZZdEZpYWhVaHZkZzZIM09nU1ppbVZBMmhPTHMrSHJyTGxGRkdJ?=
 =?utf-8?B?VFRZNzREVk15YlNCUlROcDh4K1Zac3lyV2ZYOTZURXQwVEhkUFFCckdnWFdN?=
 =?utf-8?B?Y0UrYmFGaFU5VUhoVkRDYWhTSjZQVHpmZVlDd29Zbi9DOUwrT3JReFNBNG9a?=
 =?utf-8?B?SGdBeFRTYy8zTkczamEvUUdWQVFtUmIxVHlUMFJtUGZFMjRYYUliejk2eWZv?=
 =?utf-8?B?NUROVlY4d3MrdkxGRUYrRVdKMDJjNDJlb0xCczdacExsbTRHRVY3SjVkQ1VC?=
 =?utf-8?B?dmd0elgybExnamtmVTV0ZzNWRUFOUktpTzhhajhGem5GemFiSWppOWN3OENI?=
 =?utf-8?B?THRiSFdSd2NQcFVTTzMrdWdNK0h5ZGU5ZFQ1ZzF1VkdyV2w5UjBWRGRlY1Bt?=
 =?utf-8?B?UFNPTEJjQ2g4T1Vxa1I5Tnp2alhPUUl0ajA3d3NWK29LeUFiZzJ6RW5rZUJY?=
 =?utf-8?B?VmVGeFl2TXFrTXNkOHBjQVY0Tk5KOURlZ1VrTDBVMERxR3UrNzYzU0xiM3dG?=
 =?utf-8?B?ZmVpejJhSkIvdmlkRzIrdjRteExTNVRhUFovSGRpc0t1S2xZeC9DT3dxaUJM?=
 =?utf-8?B?bGhHUzRwTGlReXRuNDEzK2R0QzlJOGhRYkl6Um1WRUc2bnAyMjF2eERYbms4?=
 =?utf-8?B?UThMT1BBTkRWeEJ0dmJrNjJzTVd1RXhaU2IwR0tPSHVHS2ZSdmFwQVBFTHoz?=
 =?utf-8?B?NVp4dm5uTmJaQVRKa0d4b1BCM04waGtYYktpMEZkd2xKa242RVJQOTN1SG1m?=
 =?utf-8?B?dXJTUmcwUXM5a05HSDFrWnlNYy9XTWdtb0lzVW54cEdncGl2cDJacy9PSW5Z?=
 =?utf-8?B?aENoMzNRcVBFNis2ZnhCVktIaGcvYnlVVjVlV3RENjBteE9TdWUrQmt2T3R5?=
 =?utf-8?B?d29QQzMrT3dKSDl6U1BoMVdKa2RWcWZnRGd5VGJHMzdTc1ZneVEzbXN4THgz?=
 =?utf-8?B?VWJqSnpxT0xpdmVJLytQTklDeW93U1dYQTJjOXEyOXFuRCt3VzlQSHZuVEFJ?=
 =?utf-8?Q?XXJ0k580VOk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6395.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YW9xeldSKzExeFVSZ0lidWJFWjN0dnRxcVphZnVjVnZocmRrNE85ZlhlNHBR?=
 =?utf-8?B?UndwODN6R2x2RG1IMTZ3dURua2IvcXp2b3FYb1FRdjhCOEs3eFZtSEZwUUJn?=
 =?utf-8?B?MVlEMGlLcy9rd2ZtNE1jL0VZeThkNkxudkdBWlhSaCtIVTQ0cVo4WG5aQVph?=
 =?utf-8?B?ZzRkamFzWWo2MGt5VVVtNHZRUDloRlRpeWx3bXB1REJITGJoeUtjUnV4TmZ2?=
 =?utf-8?B?SS9qOXpGcFgzMXdiNW85NTJSVEdQZnpQcUwxS3NvNzUwcHRXWERjQWlZZXJU?=
 =?utf-8?B?eUpsSjdHajVHdEtxa0dIa0wyelp6OXNqSi9CTkdiSGFPWUsxUVVvcms5M0FC?=
 =?utf-8?B?WGFhajU5eTJFdHhtbDJVU0MwYzY2T0Z1SGtIbEZDUG9qYStrcktyM3lsMnFs?=
 =?utf-8?B?SkIyTU0vVG1yZ25ZOThUQ3dNQmQ5UFpuOFQ1Rng4K3ViREJIZGNKblNLN2Vu?=
 =?utf-8?B?NjNiSGFEQ1l3eWVzSDIreE9WdWRPRUJYRVVRMTVwYUNHZzc2ekJjK0R6eTlH?=
 =?utf-8?B?N2hwa0I5NWk4Q1JYdVc4eTVPU3JyUmp1YzdOdG9FN2JHRlVpSjU0d0JKamlt?=
 =?utf-8?B?TGc0MVJNVTZQU1VFSUxSa2t0VEs2dVN0dUd2cW9KcW5pQk1pQUNRZUdQT3ls?=
 =?utf-8?B?UDZuS0lTS0FFL3o0elRWT05Yc3F3V3lTZ2RqSHNsYzZHcWpqc2VudFpuK2ZK?=
 =?utf-8?B?STJHL1dIN3Z1ckNERUovUkUyVHBlS2N2QVJlK3pMcS9KTFBNMVVRRWE1bWUy?=
 =?utf-8?B?MFZ6N2JGTWoxdUFxNnZ6OWZvSk1rZmMySWZpcmVCVGZhLzhRR3NUQlJpeWg5?=
 =?utf-8?B?M3ZUT1FuYlBVeUF4VUNnS1Q1WXQrZ1UxWHI1VnduNnpuT2FJMWVjNXN1MzVX?=
 =?utf-8?B?SXgzWGNhMkRVbllnMW9KaGxZQmdxQkhCbUhrVlFpdzNrbEE3aUxjRGNxREYv?=
 =?utf-8?B?Ymo4ZmpQZENHQTl6dmQ0VGRKL3VPNEU1SXliM1VzRW5jeUt0eURkMFhSMy8y?=
 =?utf-8?B?K3VHTllod2UzeE1jOTIvT3FiZUVXVmVWTHJ6ZHZ2eFJPcDByOEhiK01VQVlU?=
 =?utf-8?B?NldqTU5RdnpyMjVDdFFUMUxEK0d2cTF1SnVnQVAzWjZpSjRWVDBkYWRZVmE3?=
 =?utf-8?B?blhPMVFiM1l0VmJpdnhnd0xXbWMybTZBQVpCenVNd3lhUnNORmpBdVNZOTVL?=
 =?utf-8?B?aGhxalpzZlRWMDlvbWh0M3lNeWZ3QkVvc2Nhd3ZRRjBsZnNhYXBGN3JLRWF2?=
 =?utf-8?B?YTNYVUY0eEhUWlRpdDQ0SS9LekJpdnFYeDhOaVZGbDE5Skp5SmdQNXNpS3lT?=
 =?utf-8?B?dTZXanNhWlhieTBZOUZZbXQ4QWdkZFhsYkJOc1JDVFdvZHY3V3czWGpLQjZr?=
 =?utf-8?B?WHdkZ0xjaVR6M2o1aVNlc1FZdDZWdUVLRUorL3VpYitRVzBhMUxVTzdlcWNt?=
 =?utf-8?B?bmsybVhSVHhNVlQwRjNSSDUyWUEyeEZ0TGQ1ZXIzcEtneWtFNzFzYm43VU96?=
 =?utf-8?B?WDVieUNlSHRMcEVlMWJVbmdpWDR1RUZpamE3ZUY5eHFCT0NXME5pajg1RENJ?=
 =?utf-8?B?ckVqK2RnZDZNdEdpeXpUclZLeUpZVjNsR0E1OHAxVVdYNE1uL3hIditudzhQ?=
 =?utf-8?B?QzNGNkk3b2hhbCtJQzUvWjQyUDh4VElESXpZNXlQeFo4NHlLMU5ZNXpIdStV?=
 =?utf-8?B?T3B5WlpabElYblNwcmpRMXhoZEZRckpNb0N3ZUpBWU1IOVlxcXE3WVZWcEc1?=
 =?utf-8?B?UGNCaE9LR0wvYTkxWnh0dEVMem5RbWo4UWIrOUpMbXpmaEZMakN4U1psa2cy?=
 =?utf-8?B?MWVscWhzMEp0NEtQL1FuVFk5dFNNL3plYVd4U3dxcjZTWEs4TEhoZTY4Umww?=
 =?utf-8?B?aUdlT1M4OTlmd2dBZnZzdS9ndW9zKzJJTU44VWcvdGZIV3lQM3o2SkdGT1ly?=
 =?utf-8?B?YnpwVG94YjBsRVZMN0FsYWtRdkU3YjZIRE5UdmNJRlNoQ3FnQTcwUGg4VmdI?=
 =?utf-8?B?azVOWmo4SXFCNEFqenJYbTNZWWphcEtqbWxTZTlDWGZqcGVRdVh0aFZrSTNJ?=
 =?utf-8?B?QWFXdVJHSmMyY0duSHJZUnZGZEI3VkRlQmZuTlNuSHg0aUtVY0FuTlVqZFZM?=
 =?utf-8?B?THBpWW1Tb0ZQY3Y2VFJNb3JMVlBMWmIvVmVLaWRBcVpCMllpV04ra0NwYW4w?=
 =?utf-8?B?c3c9PQ==?=
X-OriginatorOrg: portwell.com.tw
X-MS-Exchange-CrossTenant-Network-Message-Id: 28f30191-4715-4ff0-320e-08dd8c88043b
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6395.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 10:23:17.4771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e309f7e-c3ee-443b-8668-97701d998b2c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e/f1BtaF1yEXAv8F3VDpVUN09N9GINMhZbhO+cM0wU6Oa6FLn2pBgApgCgKLQop+3M5iB54B/t58obkpCUOQKXLyFo+bO1HOzW7werAnk7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PPF80815FF87

Adds a driver for the ITE Embedded Controller (EC) on Portwell boards.
It integrates with the Linux GPIO and watchdog subsystems to provide:

- Control/monitoring of up to 8 EC GPIO pins.
- Hardware watchdog timer with 1-255 second timeouts.

The driver communicates with the EC via I/O port 0xe300 and identifies
the hardware by the "PWG" firmware signature. This enables enhanced
system management for Portwell embedded/industrial platforms.

Signed-off-by: Yen-Chi Huang <jesse.huang@portwell.com.tw>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
V5 -> V6:
  - Use BIT(offset) instead of open-coding (1 << offset)
  - Move portwell-ec entry to correct alphabetical position in MAINTAINERS
  - Rebase onto latest platform/x86 master

V4 -> V5:
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
index 5f8688630c01..5e647296c950 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19287,6 +19287,12 @@ S:	Maintained
 F:	drivers/pnp/
 F:	include/linux/pnp.h
 
+PORTWELL EC DRIVER
+M:	Yen-Chi Huang <jesse.huang@portwell.com.tw>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/portwell-ec.c
+
 POSIX CLOCKS and TIMERS
 M:	Anna-Maria Behnsen <anna-maria@linutronix.de>
 M:	Frederic Weisbecker <frederic@kernel.org>
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
index 000000000000..8b788822237b
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
+	return pwec_read(PORTWELL_GPIO_VAL_REG) & BIT(offset) ? 1 : 0;
+}
+
+static int pwec_gpio_set_rv(struct gpio_chip *chip, unsigned int offset, int val)
+{
+	u8 tmp = pwec_read(PORTWELL_GPIO_VAL_REG);
+
+	if (val)
+		tmp |= BIT(offset);
+	else
+		tmp &= ~BIT(offset);
+	pwec_write(PORTWELL_GPIO_VAL_REG, tmp);
+
+	return 0;
+}
+
+static int pwec_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
+{
+	u8 direction = pwec_read(PORTWELL_GPIO_DIR_REG) & BIT(offset);
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


