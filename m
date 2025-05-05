Return-Path: <linux-gpio+bounces-19609-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E180EAA9903
	for <lists+linux-gpio@lfdr.de>; Mon,  5 May 2025 18:33:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A259918999EA
	for <lists+linux-gpio@lfdr.de>; Mon,  5 May 2025 16:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A49D1A3146;
	Mon,  5 May 2025 16:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QfSJickM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BO4oCYvJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CB525569;
	Mon,  5 May 2025 16:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746462651; cv=fail; b=qyAu8WKRI/GAT27fIIHkmizy/OgdEhwsaAJnRkkXrSTnCIyEbuQyqrKJCk1MyyNGzcQwrs/43/RXQNOD2suGaNbMzWMZI8y2Vhc7P/fJ4W8Uz1dx8smmxAo859Kk3pZYClMDo9HhAGG9MG1Ss/EEHcoEuTQ7tVyiyhPsgO/imwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746462651; c=relaxed/simple;
	bh=F62/a2bdw+oi8SVYQGpUfbROZo/rL84MVSvIfEkCGS4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sBC13Dt+SDSy4xGEp/vWyKBHGCnEoE5b0gBLVhHxfHqbI8JW8uBsyphHoVO94n2lJNNP+KovK8avVeanvYfUolRSAxxiz7uj0JqRPfvmZeoqdORQgbzLGTVNCrmLWi1mMOGqvGBzlaQmlWvbq0bE+GQ5hJh2X+A9CmVRvKNrDac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QfSJickM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BO4oCYvJ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545G6iIb002464;
	Mon, 5 May 2025 16:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=oNONaGN3GWbVzCcBs9YGPInEhrDdwo5wIYX9wQg29og=; b=
	QfSJickMNbvcLt2C6yFOZTEhShr4AwJ/EGUSeExigBc1NULKs7h3YVgu5Pv4t5d0
	oUMgMs10apogPhjMfmi8Ab/tVQsKJL8lcBfl+KraIJldgL54bXy2CuVcmdGVSN2y
	EwONF64EpPp1XgfyUdAv3PdIAvGvo13lH9Z6/TSgHsf2jEgacmiKM3Nbf7CjGLou
	b9rdE7LIQwvBZx3hMdnTFBsKUflRNS9n77d7CAVZwhV75JKl9pMvlVYtb7cc+ki/
	x5SqMCSARmSXTbaw6fJBbWZKvtTC1L405OYI27kRro90mfH4nuEWJzBecfJYA5vf
	/R4MUEesh+zOMOQgOGmEiQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46f0jd81mq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 05 May 2025 16:30:46 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 545FLCi2036013;
	Mon, 5 May 2025 16:30:45 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazlp17010003.outbound.protection.outlook.com [40.93.1.3])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46d9k7wkpe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 05 May 2025 16:30:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z/QbexIgeC1Rm0yTKJvYNrkM/nOWTs2D3jue7Q4Ja9Yb3SzwmcebUjiLa8RTD8F3Zn/7NLM0v0ufssaUOrif+6joN281HVTvEVRSAP2eYxLsyPCQTkuuyThVy0MXaOEKEdLZbxJznJBiz+KGslClcenXOY1lHu1/XvJEALqA1GethzOfSsqm0Xmp1uQq3ueemV1x14J8y2gldcHwmGKKVTUtNhmVoccXhQqiX489JRTzHpaMpkPP4L03CZXSGmDKVlxUpyRdj4VKb1xWqsmbaShzueUGwvByrjEh0KPKnn+x4o304L8uf6q1GX3xRZGy43Vug8H8HUT7pP6+zGbPrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oNONaGN3GWbVzCcBs9YGPInEhrDdwo5wIYX9wQg29og=;
 b=KgOl1MhWLeGDlRaOwotLsPb8DIrfbc13gkDmjmAFEfNmGWOGW8WDxTGIX0kIGYOcXbeM16tkVGxMGbex94fcVP8iF2TKuI4tJEcKvwxNBNlSMXAWhw7mf5EgKa59OPZ88oZNrhzEzjHPU9asV2GaXIPoV+9aEU0Khckt57Trxkgik91Iafkbqtq8x4mix49S3NhWyrObFdBnvFXUmhktAzaliazr9frFeNPs+G5/0KYdjMepahC5AiCkMRzYq4QVdQWHnrHxYvM5xxqosmS5cDd7MyD+5wtOCSAUCaFk49h6lqcaYgwb4ulopXzhVM0SKAKSN/l6kHx6sko7cdyNHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oNONaGN3GWbVzCcBs9YGPInEhrDdwo5wIYX9wQg29og=;
 b=BO4oCYvJAKSsrH8Ps5y8ns7O9O7hlhfl4eBdOrWJGVLaV741tLENcjK93KD8MRGlDHsMNk19OMO70fMJmrLwChNf1UxvI7ZcucZx2Q0sCVcaJSKWCeKo19ENh/fd6NgZVk09yJ7UTnfoIr7zmeM78l08is0xqgswaEa4k7eNAOA=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by BN0PR10MB4901.namprd10.prod.outlook.com (2603:10b6:408:126::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 5 May
 2025 16:30:43 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%2]) with mapi id 15.20.8699.022; Mon, 5 May 2025
 16:30:43 +0000
Message-ID: <f59c3493-4630-4cf1-8d25-d4e9fbf23498@oracle.com>
Date: Mon, 5 May 2025 22:00:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 3/7] pinctrl: introduce pinctrl_gpio_get_config()
To: Dan Carpenter <dan.carpenter@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Takahiro AKASHI <akashi.tkhro@gmail.com>
References: <cover.1746443762.git.dan.carpenter@linaro.org>
 <0e982ace876920162d27a521f5f460b1dd6fc929.1746443762.git.dan.carpenter@linaro.org>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <0e982ace876920162d27a521f5f460b1dd6fc929.1746443762.git.dan.carpenter@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY2PR0101CA0029.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::15) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|BN0PR10MB4901:EE_
X-MS-Office365-Filtering-Correlation-Id: a0fc58d1-a8cc-4f00-6b53-08dd8bf22dd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UUpBNzlqSzlBbk1yK0RKZlNNbDJYQWVYcThUWmtvYXVZV09LNDVHSTJ2NlFn?=
 =?utf-8?B?ZjdpQzVRNlYyU3ZDaENETTBZRVloMlBSQytBYUcxdGJBYng0b1Q2a2xJWDRh?=
 =?utf-8?B?VmdGTkRrSi9zbWJ3WkNZdkV6OVZ1NGI2cWg4Q2hPaTZoSk9oYmlORlM5enhj?=
 =?utf-8?B?SFdpRzRodXNOTXFWaVowaXB5Z2dHcWlJRlZtZW9zMnkraGpJYi82dEFsbGN0?=
 =?utf-8?B?eGswNVBvekU3dlFtb0w0UGFTN2ZNVTNyUWRuVk5uRUJXc29BS0Z1UVcxMFVT?=
 =?utf-8?B?NlFDTnZJcTYyV1QwY0lWNDNTWWMrZFBJbzlsTjdrdjdLNCtLc0duTXVNbmdo?=
 =?utf-8?B?azBaRUtSSnVxdm4wM2xKVTZhNnJLa3RnSmJDNFVHRG8rUjdyOXVrbGZpQjAr?=
 =?utf-8?B?SUpmcnpYWHRveFZyRHI2bUFwcE9pUEZhZE5kbVIwMVY0Zkh4V0hQWFN1YUxn?=
 =?utf-8?B?eFphVDlsUDZPUDZKYm8xTHN2YTQwVHBWZlBwSXlGZ0JuNXhEaUFPbXVOaEIv?=
 =?utf-8?B?ZmNta05HY2l0aFE0VllDR1dKMDJjYTdRK0hjMEVTYlBJbkd0dUIrb3dRbk96?=
 =?utf-8?B?Tmg1WFpBMXl2djFHbFRwTEtFSGFiS3JpN1AzU2tEcERVRWRsMEZVbEpURFFO?=
 =?utf-8?B?THBOZFBzM1RqVjk1Nmd6VG1VVCs2UzhMaDZNQmpMVVpBeVlyMkxaRXdidHhS?=
 =?utf-8?B?RXM1YzhIYWx5NjVFRGwvOHg4K0Rzc1Z1d1M4UU8rckxYanloL2R5OWV1Vytm?=
 =?utf-8?B?ZDQwM0tJTmJVWlRVYkVzUnJDalRVZThtNDFHL3c1N2NoeHNDU2FsZkVubWIv?=
 =?utf-8?B?TWdVaWRUZEt3L0l2Z1NGSnBrK05yQWw0K1RYazl5d00raVZPWGFIN3dSYlVj?=
 =?utf-8?B?dHo5eDVjMXdwQWZ2WGwySWJ4RVFhbncrSGxYWVRBdnJiQW9kdTFVeEJYUEhn?=
 =?utf-8?B?UzRrbFRGQ21OUHc5VDJidm9yRzk1Qll5VVN4ajh6OGpvb0hoc20vRlVKMWdO?=
 =?utf-8?B?Zndlb0hKY0xXNjNyRDVGK296ZUN0WW1WM202b1ZqZ25HVnFQZFBKSG1GZUFz?=
 =?utf-8?B?MnBlUVBWbmR3ZHpyUGppQXdLZnV2aDZ5QUtXa0V0OHgwa1ljYmNsTkU5Ry9k?=
 =?utf-8?B?R2JwVlJadkVhcHVFbFplNmNHTGVJZlFGN0xlYlNjK1ltZGlPK3M0eG8xNElX?=
 =?utf-8?B?QUxyNHFWalFsMlNEU0NiN2oxaTBwa08wdFJ0a0FXUDZ4bVRzbGJ3UFp1RjZm?=
 =?utf-8?B?Ky9JeWZWazBCUStoUnliVWl1VWpnbFo3RHVIaDNOS2xqQmdiUXExellVSlhX?=
 =?utf-8?B?VWxmclFib3RKcm5hdjF3UzhhbURudlFCYkoyaEptVW5qbktWa09GRTZ5NUts?=
 =?utf-8?B?V3lIWEN4VmZlYU5PYjlPY2VFWHlsWVZuMnJyTUlJbFRZZFIxOWpwMmIzaHRT?=
 =?utf-8?B?bXIxYmExcW1sWFJQZ1lPdUQ5ODlQNktvUHhxWkNYWUV2cUp0ZmtscnFtZ2cw?=
 =?utf-8?B?Y09Cdmc3cG1BVUtUM0M0NjlWbVdmRnpmK2w0OE5HMzJMMU1TWEJ1NVdRMVV1?=
 =?utf-8?B?ZHhlNnphbXB0UHYxNFI1VnlsWDY5bEJHdk1kTXRyUW5tOEdrQjJuNFFGZDJo?=
 =?utf-8?B?eU16Q0NoN2JuRVBYOUlNU1QxNWRMVkV3WlU3RXhpRk9zM0k4ekFNQ2NmYk5B?=
 =?utf-8?B?U1FraGUrZ1FBaU9oZW02d1pMUGZWZkl0aDFGOGRhemJhZFJjZkoxWXdwSU1q?=
 =?utf-8?B?eTZ3ZlRsdUFVOFRoc3ZrdHJ6R2djZjBzRW1jSzBEb1F2RFNFR3R5cDZZQ2hw?=
 =?utf-8?B?TWR5Q1AyU3d4SWsrcWpvYUZFR3hmYmV4Z0V6a2I4dFNNaTR3bHg3TzRLUjNJ?=
 =?utf-8?B?KzlCR1NEeE9KS3d1bXpBaHhjY0E3aEdqMTlOY2hqbUpvSzFIVWNJR0h2eVFs?=
 =?utf-8?Q?jA86wCSVKIo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDlTL1Y2SGlzNm1FYW1xejN3OHBXdGF2MHpES1gxdEpTV2FETmJYSjlwaWRR?=
 =?utf-8?B?VkZCVmR6cWVTSnlGY2NZZER5UkFMTlFVOU1La0pkUms4YVNYV3FmZ2VTYjN0?=
 =?utf-8?B?dE5aQmpBVDgyTEhQOXRBK2FsOUJncytsZ2xuNEhuakpLVFdxc3ZHaFlvOWVO?=
 =?utf-8?B?UzFpeEpvNXpWeGNLcW83bXBDMW9SOERqN2pyQzlCYjZ2ZVBvbXBJNTcxUmNt?=
 =?utf-8?B?ZGlvNVkyZjFSeFdKYTNFaklrWHNDYlBPUUhWNHZUd3JhTFYrcHIxVFAvczNy?=
 =?utf-8?B?U0xLZW1mS2RvT01hdHZGM2FOWFBvaEQzY0JHVTdxMzVzbFRkcTM4UGtNWXUz?=
 =?utf-8?B?M3BFcGplbkowcU9uek94WWUzRXRIYkJkNzlYRXdmUnFYWGxFRlE5NHhFWnRO?=
 =?utf-8?B?N1Vob3JyNkRWQ3hadERVaFE2MVV0VDU5aVIyMGw5UmYzOVV6VjRmMW8rV2c5?=
 =?utf-8?B?VlpmV0l0WVRDNVBaMzgrY05FZkVtcEZreTRSQndIYk1oL1NIV0c3NTJ1TlpD?=
 =?utf-8?B?N1Z5dDFOWlplOFJqQlBDWDBrVFFmZWZnT29pVUdRRjhuUHZTdkQ0cVgxUHpo?=
 =?utf-8?B?dFRpdDU0YVRwRUFUUWF0cCswMnNGUjZYcEJzYWUySVhxNWNSenExdER3SGxG?=
 =?utf-8?B?ZUNvTUxrdFBsZ3RWekJ1UUFIUVVGMnNSQ1AvaXNrRDM2NjNOcUQrVnV6czdw?=
 =?utf-8?B?YWtvSmZUV2YreElqaWNvRlhwTnlHZTlRK0N2elZDM0EvWTg5bnFIdHM5eXNC?=
 =?utf-8?B?VkV0U2FsOWt4elRQZm1WaE54ai8rK2RzNTlyMHMvZUxFOXdlMGdoRWZMYVpr?=
 =?utf-8?B?L1cwdnh3OU1URXVNSTNITXBPOHBIcXNXSWxwNlJjNTMyOHl5dlFzWlFrSWNq?=
 =?utf-8?B?emgydGNSaUdzdlZPVFptcDY4d0FpbzBGZnZZMjdCYkxQUHVZbFRGcVh5Q0E3?=
 =?utf-8?B?ZHdDeDZnQW9SQTdZV0lIckZ0akxndVZLTWwrUzJkUC9sSEhnSUZpZTRkRm44?=
 =?utf-8?B?aVRMWDRMelNLK21EWWNvU2Z1TzJXajhvYzJJdnVPa3F4d09rV3RGcVRNbGFh?=
 =?utf-8?B?Zm9qcm9Dak1oQ0NEbU5LUkpOTzkvakVrSjFLNk5nR0N0Wk42MXJZZW1aZmNq?=
 =?utf-8?B?RnIrdXZ6ZmJncnpFT1cvOG9VS1J3SlFtR1h6MVowVXpNOVhKR2lOTDkrRWNu?=
 =?utf-8?B?V015MThISHNwUHlGZkdBRlcxYlRvckNkMHVoYVpNaUZWZU1ld1E5VHUwZlBq?=
 =?utf-8?B?SVdFZk9qcUlEUkwxUC9CRlgwb0VtS3pqeXRPc29DVmJnZDhBdDQ2UGRXUmw2?=
 =?utf-8?B?VG9hZS9SdVJ5UStWenVZc0dYSU93RDFTZ3VkVk8rQ1hNanlvMVNSci9DN3Q3?=
 =?utf-8?B?bCtWTXI2a09aUE9rNC9ST0NGNGdvTGVrQUo5dW9UeDREVC9GOVFTUkx0cFVa?=
 =?utf-8?B?Zjk5QUorMkgxQ3J3SkVFLzhCKzBpSzBRbFpEOEtMQlhIN3hORldXVjh2QnBk?=
 =?utf-8?B?dDVNN1A1L3Y1WXFja0V4YU8vUUVWT2xTb0FjUmw0WEE4RjI2REsrUjFEUUtH?=
 =?utf-8?B?SkVNZHgrQ0VNK3JCa3BVcjR0UTJoejhjRHBqNktPY2xQNTZtNW9ZOURYUWEx?=
 =?utf-8?B?SjNHR2JMRFNhaW54dE9lKzRhenNXSFoyWUpvY2hIazllNTNRVWg3TkcwMC9O?=
 =?utf-8?B?NFFLWXkrRG4weCt1VHg2aXZ0K2YrTy84Tk85Q2hpSG5iZ3JNcVgraTVVd0Vn?=
 =?utf-8?B?Q2h4dXU2eWt5Y2lwUkZhcTVYbXZFN3Y3enQ4ZkdDUEhLVGFKdXZqM3pjQThQ?=
 =?utf-8?B?S29jeUZDb3FPQjBZa1I0RzVZbUFlWHRmY2V2L0RXcXVZalgwQ0NzZ1ArR3JT?=
 =?utf-8?B?U2ZXaTc3TlBDOWMwNzM2ZGRDMTN2UUF0SXR1SEtUY1FSUjB5RWt4VnJrOWFv?=
 =?utf-8?B?YmlVYWN5a00yMFptc3ZJZUtiZjhjMGVuUlRza1RrWHVycHNGMmJzN0RwbXY1?=
 =?utf-8?B?dHNnb2VCVllzS0FnM3ViRWFIQVlITWFtb3ZQZzZwQkRtSlpzbnFLRURtcW4y?=
 =?utf-8?B?WnRuNWNPLzhtb09hWXNoNzROcUppUmdNUi9kSENjN1BzLzFiZEhEZmVxRitx?=
 =?utf-8?B?ejQ3UGtkU2lmdzVtM01jYTlSWDZIMHFiemZhajk2d0FWVHdsSENmTVdseHJE?=
 =?utf-8?B?Umc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	E3Kw/0nPqvMXYrcjH9w599Y/nunkJn/FZo1rFjKfUNQxl14qIZVLn1mpV20HY9RvO9C5CVgT+b60bZ3tpTWGxyNwdoPUjfToPo8HFOZFFeYd/fOIpiEbhgE2QPyKGtB3mFWBmfYe+YcnZnRIOlr5YlI3gz7D9hN2hBz6rKEnCiR20QBTCaUoLiuhJO7aNfVyRRxxd9BmkXPQx5OHE1E4D0FRCM+7Nri8W4Hya1qNamlk/NogojPoR19pbc22+6tph2CSTFESeZiBA6ncgTuzbtP5NyP6sUk4Gxq2X/BqjIfkwtP5bQtjYOuNFwDUG7akHPFwgLIfR9nAyn0+lxyR/hyYZaVaiGATc++QTV4ztOBkhPqiZvYBsRMXptOO8q8ajMxrgdGtGTUHWdvuixOFKZK/Nlgl1PJjaS1rnG16tNo4M7TmEV0VcTqGKTa2KINtPzI81bkW++/ImxBdiMW5uO0gzXnJLtg5zxwknbDbmtrDa7qnxe4hRz8hfWktIVtDtwjazdUNWTrLNiailT+9dm0mQPKIk1juYkILAommv+X8OB7KnZuLU0+mhxCvHu2bcBcMp71EYfFmRVxJX/sVwy6ai4pQPPzHbKbLGtKZqjk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0fc58d1-a8cc-4f00-6b53-08dd8bf22dd9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 16:30:42.9761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3mnDbJpQDD8Pwnkchmhbo7YBKfDqIqjpFu+uqVlJIKcpPFQjct309jrb3pqT85ZsC5gQ/7Vui1HuHPkyelB9/50RbX1uwxFCIZ39lAfMHXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4901
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_07,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505050156
X-Proofpoint-GUID: 7UfI3OKdeICJ_aFJlUKpGK6HeDZv4_9a
X-Authority-Analysis: v=2.4 cv=Paj/hjhd c=1 sm=1 tr=0 ts=6818e7b6 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=nuRK2ofwym4SabnzxIkA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 7UfI3OKdeICJ_aFJlUKpGK6HeDZv4_9a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDE1NiBTYWx0ZWRfX7NhF+SK08cZn xeLWzVWmf/0hsg+5lVZsojHP9eoyBB+tB81IxcuyRIxNwNuCK5bOGXM2Q5qLl+6DKcBe7RyPxqQ 1xONIKxNTw7YHJj2Hd3hMmp6geEimJjQmlCNE4pMkqk69ROeODWRS78CcRIIkdCAQApR6uRjVgf
 063Ptj8w/7qLplFFqfKC5Fo3vxW5vmtyOEkAgHPozfA3/PvtS37XPOLnL/Pgs6kH8G6FiJTysEa EMsZGChtmRTbB4jk6tox7Kq88u6AS21dCTC5Dsdied6DWo1LZ/YTqd/Z4ZEdpXK+yAezZf6K4ZO UDMRb4517daFWQGhKvdERAZEWbuLsG6G9hBvl3Ae2Hgbjj2DvFOCjNdSN/ZvTORITpUL7lk6G3L
 fVD7UyZOvLdkyyNy9Jma6GheWN+1CHzf2dws8RSaMJHn06SEIofLZC+9AeDQwNNMUP3Xzx2Q

Hi Dan,


Thanks for your patch.

On 05-05-2025 17:07, Dan Carpenter wrote:
> From: AKASHI Takahiro <takahiro.akashi@linaro.org>
> 
> This is a counterpart of pinctrl_gpio_set_config(), which will initially
> be used to implement gpio_get interface in SCMI pinctrl based GPIO driver.
> 
> Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/pinctrl/core.c           | 35 ++++++++++++++++++++++++++++++++
>   include/linux/pinctrl/consumer.h |  9 ++++++++
>   2 files changed, 44 insertions(+)
> 
> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> index 4bdbf6bb26e2..4310f9e2118b 100644
> --- a/drivers/pinctrl/core.c
> +++ b/drivers/pinctrl/core.c
> @@ -30,6 +30,7 @@
>   #include <linux/pinctrl/consumer.h>
>   #include <linux/pinctrl/devinfo.h>
>   #include <linux/pinctrl/machine.h>
> +#include <linux/pinctrl/pinconf.h>
>   #include <linux/pinctrl/pinctrl.h>
>   
>   #include "core.h"
> @@ -937,6 +938,40 @@ int pinctrl_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
>   }
>   EXPORT_SYMBOL_GPL(pinctrl_gpio_set_config);
>   
> +/**
> + * pinctrl_gpio_get_config() - Get the config for a given GPIO pin
> + * @gc: GPIO chip structure from the GPIO subsystem
> + * @offset: hardware offset of the GPIO relative to the controller
> +  * @config: the configuration to query.  On success it holds the result

remove extra ' ' before * @config and On.

> + */
> +int pinctrl_gpio_get_config(struct gpio_chip *gc, unsigned int offset, unsigned long *config)
> +{
> +	struct pinctrl_gpio_range *range;
> +	const struct pinconf_ops *ops;
> +	struct pinctrl_dev *pctldev;
> +	int ret, pin;
> +
> +	ret = pinctrl_get_device_gpio_range(gc, offset, &pctldev, &range);
> +	if (ret)
> +		return ret;
> +
> +	ops = pctldev->desc->confops;
> +	if (!ops || !ops->pin_config_get)
> +		return -EINVAL;
> +
> +	mutex_lock(&pctldev->mutex);
> +	pin = gpio_to_pin(range, gc, offset);
> +	ret = ops->pin_config_get(pctldev, pin, config);

can we add reason here, as now we are not calling pin_config_get_for_pin()

https://lore.kernel.org/all/20231002021602.260100-3-takahiro.akashi@linaro.org/

> +	mutex_unlock(&pctldev->mutex);
> +
> +	if (ret)
> +		return ret;
> +
> +	*config = pinconf_to_config_argument(*config);

a '\n' before return.

> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(pinctrl_gpio_get_config);
> +
>   static struct pinctrl_state *find_state(struct pinctrl *p,
>   					const char *name)
>   {


Thanks,
Alok


