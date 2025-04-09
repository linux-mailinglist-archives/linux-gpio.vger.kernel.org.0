Return-Path: <linux-gpio+bounces-18548-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F339A820BA
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 11:09:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CAE91BA5CC5
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 09:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71A125C6FA;
	Wed,  9 Apr 2025 09:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=BLAIZE.COM header.i=@BLAIZE.COM header.b="MU9CQPhs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx08-0063e101.pphosted.com (mx08-0063e101.pphosted.com [185.183.31.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8EE42048;
	Wed,  9 Apr 2025 09:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.31.155
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744189724; cv=fail; b=q4CU/Ak1SrNOlUtonf6X1S1g4EyWgMRsMmR4m8/gs5AvK4wzMoZ7SydMeqM+PKDT5nI0lsFUZ0ebgmxqG70UEp/32hci+b8Sx5pwy144jPS57YY1C+cZaR7BpzE8ezurfcJZ+Tk9FgfKXOfg2EfvF+n95G8XovPHA6xQchcPhY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744189724; c=relaxed/simple;
	bh=d8FJR2WdY0/4YY8iFRHWHo1nNCLUHf3NmkiocE8S+aA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ku6L3Th2JqZGvRQMCT6zzloHp2xyanjbVqh/dJMLu61UXX4/GXnSOb23imTSHSLCsXgIEYhSHXsD64C1jWqxvYvHSWsM+zoXFmVyl7ZPzyykCpzba8LeXIYIn+2p8dC8aGLh7kfXLjENLg+kxLbUNsx8/8hrN5LLCMYshQpZYR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blaize.com; spf=pass smtp.mailfrom=blaize.com; dkim=pass (1024-bit key) header.d=BLAIZE.COM header.i=@BLAIZE.COM header.b=MU9CQPhs; arc=fail smtp.client-ip=185.183.31.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blaize.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blaize.com
Received: from pps.filterd (m0247494.ppops.net [127.0.0.1])
	by mx08-0063e101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5398ZROf012133;
	Wed, 9 Apr 2025 09:58:18 +0100
Received: from pnzpr01cu001.outbound.protection.outlook.com (mail-centralindiaazlp17011031.outbound.protection.outlook.com [40.93.132.31])
	by mx08-0063e101.pphosted.com (PPS) with ESMTPS id 45tsussqu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 09:58:18 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eV7WDKTgZQ4GMGiJ0LVK869zyeHeTR2wEFFJxe71YDPq7S/dTFvtX6knj/qRTs5Lb7yqFPK/ea13CnI8uKbF+/YlxWmSzjksNuNmT09qwDiW8nG7Swp84g612og8YPJD1mbIJtVPsU59FLtKKP+i8G0AOHC9K07ZlUEf4zkhO0ssodiwAi04owUCFdToGpgut0Joh4yKtLZCWy/izKzzuKu+HV9fslkiUtU2F7qqySS4RocEF30je0Cldg0NmswM1LCwi4NE2qh0agLdjQQDA+lIckZsEwQcaKZQkR67qggQzDYCyN82R47Y2XKcgWGDRDEIh7gk7A3fjYO2G3lk2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ederJYcrJn2OnAMJzL621zkPkHX+G9H/Q9hufda2hR8=;
 b=oeqO0urmUDYAGDk3Pp7kbPYJm8Y6xNT0ZP2sWnnekjhteBKJiw8aD428GL5bsy0wCmbBPzktUMY+oHGDuzaZBkeREIINqu/d4xEQBb/QjgKgcD0PbXdLcrXV2S0la9ZsEVXRgCvJW4U+impk66nPbA0JpAJ74lsjoNISnPuGRpuyF6G5cTr9Fw7o8m1DM4+pPj9tlw68IKMFwRknd8s3CKCfHwSVaheiKp2o3W0dBazwdv5VLJJwwRTriybmIftmmTnBvuBljy9Ii5At79dpifhLkAPP2aW630OEf7JNg7dyJXIoC6rWVZDCx5DzAgdfBg0Zf3BYOo2A5y5rKMU1vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=blaize.com; dmarc=pass action=none header.from=blaize.com;
 dkim=pass header.d=blaize.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=BLAIZE.COM;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ederJYcrJn2OnAMJzL621zkPkHX+G9H/Q9hufda2hR8=;
 b=MU9CQPhsFZdpIxKkEYwy2Pip8eKRXARBjzSTLyYhXSN6DNBejyR5qDiu6KW/K8Ee0mHSbSsuCBDMYnobC84F7D1rwMtISbukxOHaiKWQUGFbBT5qdPo5BUnoi0jsTTRUMaZSi05aygzKynSPzm+Yj2coDEEokbFqP+bqMbPyQ8I=
Received: from MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:12a::5)
 by MAZPR01MB8052.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:85::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.37; Wed, 9 Apr
 2025 08:58:13 +0000
Received: from MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::309a:12cf:74a4:5655]) by MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::309a:12cf:74a4:5655%3]) with mapi id 15.20.8632.017; Wed, 9 Apr 2025
 08:58:13 +0000
Message-ID: <fddbe517-db80-4957-a277-a6619cf50286@blaize.com>
Date: Wed, 9 Apr 2025 09:58:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: blzp1600: drop dependency on OF headers
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        James Cowgill <james.cowgill@blaize.com>,
        Matt Redfearn <matt.redfearn@blaize.com>,
        Neil Jones
 <neil.jones@blaize.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250408143629.125576-1-brgl@bgdev.pl>
Content-Language: en-US
From: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
In-Reply-To: <20250408143629.125576-1-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0239.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::13) To MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:12a::5)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0PR01MB10184:EE_|MAZPR01MB8052:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c020aad-df93-4148-dc34-08dd7744a899
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UXRnTUhBN0lFTmVuMzZEczRhZ0lRazE4ODRldW9ObE5QL0dvOTNJaldCdndk?=
 =?utf-8?B?dUh4Ui9OL01kaTIyQjl5ZHFmRTgyLzdtd3dGS0JkanozdlVrYm1vWnNXUmpC?=
 =?utf-8?B?RkdRSm96VGdUelQ1ZmNUWVFTNUVMakV2Tlc2dk5zWUk2SmFkSU1VVUtFUUZV?=
 =?utf-8?B?RGVOVGNZUXpQL1NNM0x6aHVJK1ZNMUpnTGhQdzYxV2RLNllWb0tUQ1RLYnRC?=
 =?utf-8?B?Nm5DekRsVTdSckZSR3FtZW91Skk2dm9hcGlxTFVyVUw3U2hSaUI5V1dSbjhZ?=
 =?utf-8?B?enFpUEdGUFkyRGsxTnlTOWNGalVmMDl5aENVNDFZRzIxdVczbFdlcFA1Qjc4?=
 =?utf-8?B?WnhWY3MvSVdZVGhhRTY4UFNhTG5JV251Z3RobmlYOTBOYisxaHkyY1BBeFZB?=
 =?utf-8?B?TmVORUxCVFMrM1BoUGQ4UzhNTnFocWVlOEN2cDh6cGhyVzZ3WG9CdnA1dW5B?=
 =?utf-8?B?SGU4TjgzMW9oYXZGQ3ZwT0dEVW5zTVlwSzVnbW1tQklvdUVLS3RhM1JUaXZX?=
 =?utf-8?B?WHdmK3h1OFBRR1JCTEpFQlBPdVhmeHhMR1NQRmg4d2hRWFcvancyR3lVM3h2?=
 =?utf-8?B?U3l6QTRJRGkxblJYQm12SC9VVlFMZEpFR1pNN1Z0OUxJc2dGZm9HUzZxWjhm?=
 =?utf-8?B?RlBNYnkrZzRJTUcvZy9xWHhKVjhGU0tXUVBUcHRYak5TMDRkVDdicE05bEZx?=
 =?utf-8?B?THJqSkY0NmJLeTlJa3U5dTlTaFZLY2tKcHlEbWdoaTJndU9NQ1Z3Rm9Ldk9E?=
 =?utf-8?B?bVhkbVFMREpERlllYStqTWU2OXU1dFpsNm84c1JmektscnNNNEVteTJNWWJ4?=
 =?utf-8?B?VXNJK3M0b0ZOVWFsaGtyanVYVTdmQlFOYXNsNzZiVVJiR1JYeFZqdmowQWIx?=
 =?utf-8?B?bFU5dDl6bExqNFpxOUpYeUpNWWo4MXlOc294VGdBUytoVUxiY0FCQUIrTk9Z?=
 =?utf-8?B?YmdMQlA3d3VaNGd1Z2FLRVRVRmpwWklEdDl1UDAySGhuRHBFSFpVTCt5Wk0y?=
 =?utf-8?B?UWRJRGhiWHlSTDhDNitHNDZJNTRoUXJZcGphS2xNVjVxSDlqSkViMFVHbVJX?=
 =?utf-8?B?NDFkSWVGVU9qWDNQcjJ3N3B6KytGSXRhZWZVSGpaR0EvWFZoS0M1SEw0TE40?=
 =?utf-8?B?MkFKWVVRWnpMeWVXdGJnM2tZeERPYU41UUt3T1A5ZGRxVy8yTjJJWXlIbEQy?=
 =?utf-8?B?WVdrSmhpeEk4U2VXcWh2TlN3aXFrUC9rdjJFZmJ6ZFZJRUZ6Wi9idmhoMkJS?=
 =?utf-8?B?VThMS2lpZVdzYTJoVkl3SWRxaUR4dzV1MjRYTW9ZUkRSUFNrOFVqVXBKVExY?=
 =?utf-8?B?YmkyOFNVVkpVWWxKaEQ4MzVsQ0owT0Q1QjVkUU9NU2Rjb1QrcnNOQ3pwUFEw?=
 =?utf-8?B?NzRNdzhUNXRCcE5GdGZRVHFUTlYyVk9HQU56cExRWGhLanJNRW1vUXhGTzls?=
 =?utf-8?B?bkMzTTEvdUMyWUpPaG9HZUpITlFxTFlSU3VFb09tN3l5bzVaYUFDOE5tclZD?=
 =?utf-8?B?di9WT1ZReGphYkh2L0hKbGtrNkQzMkljUzVndjlhSEg1WmQ3dXBjZlNzSHgz?=
 =?utf-8?B?cWdmTHhkZGhaVjM2S1E0ck9aMG9GZXFBd3QwS1poY2psNVJ0SnFteUxWYlBG?=
 =?utf-8?B?M2dncXRLdU9PblRDWEVvLzg3c0RRQWhaakxlc3VHQ2xURkI5MUplMWZVd1V0?=
 =?utf-8?B?N0pGRlQyNjA1TjN2OGViSmdlY28wREl6SjU3bWl2UWZEajNXNUxMNC9LemRY?=
 =?utf-8?B?NXdqblB2WkhQWUJYTjZySncvb0RrT3JjcFV1VkZuNk44bnB3NUU5MHo4Vmto?=
 =?utf-8?B?d3pCQmhyY3lDQXBOa3lrcEU5MVQzSTBuZmN1U0tGb3JTSmRPbFF0YUI5OGRL?=
 =?utf-8?Q?8DIGFh2s2fM0N?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEt0NnJOTExFbkgvdTRqcFZjamRKdzNQQks5bHpNTDZnTkdnVEVsMzZiNTJs?=
 =?utf-8?B?YTBmNUxNYVBTcjRma2RIbHVIb2lhR29JMlhwYU5DeUFEQ29wVlBiT2x4WUlr?=
 =?utf-8?B?SUZQRTY4bzJ4Vi9kQUFndzhlMExlZ3Jka3Vzd0Z5Tyt5TGtWSG4yaGJGZElt?=
 =?utf-8?B?Z3hjT1BTYWtKU01adDdDR3k5NUJKS2ZsdWJuaTNqTUxqWHB5c3p0TlZWdmNC?=
 =?utf-8?B?aDZ1cTkyVGxJazJCRDNsbm1UckFlSHRmUHdjTndLS29TYmFnckpUSGl3RFh5?=
 =?utf-8?B?VWpzUWt4bXhaR2FCczRZMW0zMm43ZDRqaHZacUE3Wm5yNG1ZNGlXUVBIT2xa?=
 =?utf-8?B?d3JJZ2hEZ2NGRkdKZ3QrQkoycnBrQXA4M211cFRqUTJHVHhkMHZ6VmFMcngx?=
 =?utf-8?B?OGNvU1BWbk1ORlA2ZHkrRkt3c0NkUHU2eVFvQTViQUpWV1lQS2ZSNWU5ZHJG?=
 =?utf-8?B?Y28xcmQxV1FTTHhmK1NNOWtadWxjVmE1MDhYbHVEUm4yOVZKYWFVNWNibzVZ?=
 =?utf-8?B?ZjJQOHA1Q1UzaVorajRuWmpvSWpDd3N6U1hzcm1WY1VVbUdhZVpVeGp4Skty?=
 =?utf-8?B?ZFc0SDBLa090YmgwSk9kR251S3dZRmhhRTdOUCtzOWdkbkQ4MGw4aitVMlJ2?=
 =?utf-8?B?Lzhob3d2K3o3U05XRGFpbEtFQ3NhNEgzSWZiQUZ6Nkg1bm04YjFWdHJxZDhL?=
 =?utf-8?B?Qld0cEpzbkY5d1ZSQ2ozazQ5U1RuMU5Lcnh1czVidkZDN2QrWEExRUdLUzlt?=
 =?utf-8?B?dys0R05CK0NUSDFmNDZaNk5GNWE3by9hVU1LYVRMeGgvTUhQdTZJVXM3bGFS?=
 =?utf-8?B?akhyYlZIdFo4c2szOW9rRHV3UERSQ1dtbm9NRWMxYjNPSWNHVktxbGsvTVhV?=
 =?utf-8?B?RDRBYVErcDJTVk5TR1h2dnFOL2ViaVFIcXBGQTU2cnRIVHNRSWNFd1JiN2tU?=
 =?utf-8?B?WW4ydnozMU1jYm9yS1d6b2lZdTErM0JxMjE4dlVvVFBWcFJmWUlaQStlYUk1?=
 =?utf-8?B?OEtVWGxOT0M4MG9BQXBIaDI1aUVnMzZuSTE4M3RWdVp0S21xelpIKzJOQmly?=
 =?utf-8?B?TUpqMG9pMkZLNkp1bXBvbzFIeE9pdEFRZVQvbFpGMVJmYXpFUTFueCtVcHQw?=
 =?utf-8?B?SVV5Mmo0WTExY0JQYytwbmJzbERnUUJSVlJyaGV3eEZIOUYzUE9CN3p1UFVW?=
 =?utf-8?B?WEwwMXdrOVlXR2lBNkthK1hFWmVXdm1FaXV2VStvY2VpRG9FRTh0OUpYT1k4?=
 =?utf-8?B?ekVZTjdrcnJJaW11dWZDNUZZNXdXRkRlL0ZsUWJNWEYyOHdobHpSRkpBRjdU?=
 =?utf-8?B?WXJOQXF3WmEyRkZxc2lPaHU1QWNPTVhTSVJad1NLaXBNaHhVb25aclpWT05p?=
 =?utf-8?B?VFJUOHc2TjdweHdtS2ZmOXUvMStFd1poT2RTVzNvQU1XSmRGRU5NZk41YVdL?=
 =?utf-8?B?bTI2WXNSTXhQZFRLSFUwOVpldWJYWTNDdzlkUXViNmlvYVNmWnQxVmF1RjRG?=
 =?utf-8?B?bk9KS0IzMm9pVExQaHM4UEY0RGwrUFNCUmVCbHZzcHh4ZnVxaU5HQUtvWjlF?=
 =?utf-8?B?OU9NZDR5SkRNYWRtUWxEb2xmSlNOSjJCZnIwa05RMm5JV3FUOFo3cThrU08x?=
 =?utf-8?B?UVhYNmI5bjFOK291RVVWNG1ITGtadXc0V1pjWDJHR2U2OHpVVW5OYWUwM2FL?=
 =?utf-8?B?ZWp3ejVXck55NzA5RWhjL3N3UWpWaFdXNkJqN3lDTzVyc1RlWGNDZnFDWHlZ?=
 =?utf-8?B?ZURqcFNPeUh3ZmYxN2Y0eHp3TEwxemxYSHZ3Z2JCSllJZ3AxbDAydXR4VVNk?=
 =?utf-8?B?cXZscVdpNVZyYjhYNm81TmVub2h4ZmFmNkJCS01QbjhsYm5ueFA3bXNQRmxu?=
 =?utf-8?B?Sm9UUEVnYk5HdUN1bkFadWFqc1Q5cVJGYXNCa2dLNFNpWFUxdU1NWVo3eFVj?=
 =?utf-8?B?WTJIQlMyNmNzeTBnNU91Y2VrUWdmWDNXQmxqajloRGVWcUZPQnNDZTdaTmZ5?=
 =?utf-8?B?c2RZMlZsR1JwQ3laNi9SMGFQWE9ncG1uWnl0SWVQTmJrT2xmMjJmZFo3Rmd5?=
 =?utf-8?B?aU9UUzhFNmdSeU9wd3VKQTBYa0E1K1F3dFVIQ04rb0E4T2M5bGxqeDNzK2Nk?=
 =?utf-8?B?YlNLaXg1UGVpbytLejFMdUE5aUZ0b3dzdnltMC9VVEpNR1Y4cUFuMlFWWEZV?=
 =?utf-8?Q?qJgx5lTdJrfX2R32/fj9Auc=3D?=
X-OriginatorOrg: blaize.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c020aad-df93-4148-dc34-08dd7744a899
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 08:58:12.9939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 9d1c3c89-8615-4064-88a7-bb1a8537c779
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EVEuXMfCSb4seLZbe3CuPKzmvfG2lEaYgSEyygWza4kAs3T3eS2oH23Qx5wH4xI+n/iTyMHTYzYmjIkw54okRCmYNA8zCyDTWOzIZLwXikg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB8052
X-Proofpoint-GUID: WAGoSduzrzoMxAdAdCPJekn4wLRUgdvn
X-Authority-Analysis: v=2.4 cv=AuPu3P9P c=1 sm=1 tr=0 ts=67f636aa cx=c_pps a=fZMYyGB11ZxAXgy8cNnk8Q==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=-5LYVjoNHPMA:10 a=KKAkSRfTAAAA:8 a=SrsycIMJAAAA:8 a=9vjL5g7GzHWEwis0LdkA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=zapPnUM7SFj2ezx6rUw-:22
X-Proofpoint-ORIG-GUID: WAGoSduzrzoMxAdAdCPJekn4wLRUgdvn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_03,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Reason: orgsafe

On 08/04/2025 15:36, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Use the generic boolean device property getter instead of the
> OF-specific variant. This allows us to stop pulling in linux/of.h. While
> at it: drop the of_irq.h inclusion as none of its symbols are used in
> this driver.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   drivers/gpio/gpio-blzp1600.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpio-blzp1600.c b/drivers/gpio/gpio-blzp1600.c
> index 77ad0e596f3e..2760a13c0801 100644
> --- a/drivers/gpio/gpio-blzp1600.c
> +++ b/drivers/gpio/gpio-blzp1600.c
> @@ -10,9 +10,8 @@
>   #include <linux/interrupt.h>
>   #include <linux/io.h>
>   #include <linux/module.h>
> -#include <linux/of.h>
> -#include <linux/of_irq.h>
>   #include <linux/platform_device.h>
> +#include <linux/property.h>
>   #include <linux/slab.h>
>   #include <linux/spinlock.h>
>   
> @@ -217,7 +216,6 @@ static int blzp1600_gpio_set_config(struct gpio_chip *gc, unsigned int offset, u
>   
>   static int blzp1600_gpio_probe(struct platform_device *pdev)
>   {
> -	struct device_node *node = pdev->dev.of_node;
>   	struct blzp1600_gpio *chip;
>   	struct gpio_chip *gc;
>   	int ret;
> @@ -240,7 +238,7 @@ static int blzp1600_gpio_probe(struct platform_device *pdev)
>   	gc = &chip->gc;
>   	gc->set_config = blzp1600_gpio_set_config;
>   
> -	if (of_property_read_bool(node, "interrupt-controller")) {
> +	if (device_property_present(&pdev->dev, "interrupt-controller")) {
>   		struct gpio_irq_chip *girq;
>   
>   		chip->irq = platform_get_irq(pdev, 0);

Reviewed-by: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>


