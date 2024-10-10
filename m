Return-Path: <linux-gpio+bounces-11155-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 010289991F6
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 21:12:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B218F282ABE
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 19:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B35211B5328;
	Thu, 10 Oct 2024 19:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="C66Wghoq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="aFnGuTQH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39FB188A08;
	Thu, 10 Oct 2024 19:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728587531; cv=fail; b=Gv1cSjkkDnlmINNrDcGpkQRKE/zOLma3i1+rUBHeeY28mj8TTdyWArac0OB3wbXsLkdw8VLlMQG01U4zldlNjFX6f7HTLy3YxH8SCj1zHgd2Quaba+kLqNZ2e5TyRpfgBxbBzhKK0AFOQeG9LVWOzYtuouAL23Eygf2kBdZwqs8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728587531; c=relaxed/simple;
	bh=WvOHjgMkWxMmbFwXUdztkhtl4S06m7WcSFO2zteZ3DE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FCemGNZM5Un/fK1Nj7f/St9b9d7xYYqEqNB78kno1vOiIqAQrDtAtjc6dEsiMzvrP5AS/A12dvwd0O8ggqWGWswTUEEPs4JBHkTySd1pZxk5OKt84RxrUfWr9i1iGHZPe53vNX4V7HTVGneRb/0AsJWcdCCsVs7wXGheCkrMUPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=C66Wghoq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=aFnGuTQH; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49AJBj83029544;
	Thu, 10 Oct 2024 19:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=HFdnBN65ZGk9IFbjmdeOpVRhA0CmbCwrS1vG2nmy/O8=; b=
	C66WghoqEO63SNOTBzX3fQnl8DTeCLnyXrYpUvxyURPohEGyBcgZt92hsRFz+o8u
	4Bg/+bpAhy471Uz2y8gPRsW+fW0yTsWAfqypsjx4VRwJznnwZQ+YBCaint0Kh7LS
	trP9HIiEiY9cwoc1uV3FTfT54aSwvCXb2A9vk9waKvrFf1m+daujtpOWfxfVSpkb
	mXqRdX2vmjouKhaIg1wZlz74cJa9rbQWfiSrx+BWq+BaIi/3Ahh+JKc9Xpyc9G0G
	XawIMYJUmDsGp473TIEbtiYX49qkOLeXfJEuHJwoaNW8fotd3odzHd6Qv8Z3ayiq
	hxiaCp3QMjnRvmCvEyhlRg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 423063uh50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Oct 2024 19:12:01 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49AImlwI005779;
	Thu, 10 Oct 2024 19:12:00 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 422uwgswa6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Oct 2024 19:12:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DETL8E+yTGi0bY3Vz1WbQYUk8GvvQEP/t6LTfDwAx0abe9BYwm86bbHbuWx5sZ//ql0cEL/FjCzzvR3SrkfdFnLtBa5Qn7idqn204EsHyztocnbgaZmfcmdXfP/hjJcF1iOMKZkiAEVBqzQ5N9nCdr63fOtuF5fXQBw1aDhql9Mms9ztXspIiqrPQTh1E752I7klWeaYFAng0nGNae1+e/vbrB9OHaGdYk8n1cghvdA9P7jt6Ty/JRPbtySgjraA3/ahfoQj5Qb7KJy78Wdmz1pg6GO0Nfch0yRWtarEW5HJLHAScRO1sDuBtGl4ULrHVy+ItQ8AOjG1omEFNhalxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HFdnBN65ZGk9IFbjmdeOpVRhA0CmbCwrS1vG2nmy/O8=;
 b=r8amzBPmLFzFELx95xY717gImQpGXmedArsB08QqZ4jNHoKfiWirJ0dtI5fXN76c2BEnUgunPlGH5yPcJIvVtD20Dn64XTQb28CHUN7si+PuyFApVQC7zd1L70RHIPJQDA8c1Ikj8wJBsUj5m2pTzQL5+UeMk9i/tmZ1YHDdGgE9IgDdP+E0WEFNzTQPAanMwaL+1ky5yij/IOgOf2W+YVPjBIw1F/i7DZ6DM5pR8mThQgGsm7ZueASJheLOtpYnXLRx27sscdc4P7fdD+AX80I9del95IVsEgPLwb+uLy3vbXo0eguabP/IP35qSrZR5ps7hcmH+EH5+qUUrlFRVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFdnBN65ZGk9IFbjmdeOpVRhA0CmbCwrS1vG2nmy/O8=;
 b=aFnGuTQH512uHbHaJH3/q7kqq1bwxxG7Ddxxu5lCiQuyceyhXZKIiciUwW5V+OYNVcuir6WZo5ctIWFxhftOULEsXAcljIEGrRKN3o0XJBhWDn1L9YbzA9I6P7o5VuuNHfCxQmKXqETYyhPCOtJeTDt8Q8jv6kBULb1hhc7ygBo=
Received: from PH8PR10MB6290.namprd10.prod.outlook.com (2603:10b6:510:1c1::7)
 by CH0PR10MB7534.namprd10.prod.outlook.com (2603:10b6:610:190::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 19:11:59 +0000
Received: from PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::309b:26bb:11d5:cc76]) by PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::309b:26bb:11d5:cc76%3]) with mapi id 15.20.8048.017; Thu, 10 Oct 2024
 19:11:59 +0000
Message-ID: <cde6a7d0-807d-4301-96d0-12660115ebff@oracle.com>
Date: Fri, 11 Oct 2024 00:41:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: sophgo: fix double free in
 cv1800_pctrl_dt_node_to_map()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Linus Walleij <linus.walleij@linaro.org>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@outlook.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
        error27@gmail.com
References: <20241010111830.3474719-1-harshit.m.mogalapalli@oracle.com>
 <41acfc55-9741-4cef-9254-f9e4be4da956@wanadoo.fr>
Content-Language: en-US
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
In-Reply-To: <41acfc55-9741-4cef-9254-f9e4be4da956@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYAPR01CA0047.jpnprd01.prod.outlook.com
 (2603:1096:404:28::35) To PH8PR10MB6290.namprd10.prod.outlook.com
 (2603:10b6:510:1c1::7)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6290:EE_|CH0PR10MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: b70e9d4e-f71f-4700-4dac-08dce95f69ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VTdLQnB2M3R0NlROS1ZpRGdteFVXbmYxWGRMNU1wK0UycTJTOVRRUnJHU3Q4?=
 =?utf-8?B?MlRXQWl5R0xwVmxhMk1yVGE1RERyOHJyUmUxdmhhNkNMbDVQeE5rN09wVnVK?=
 =?utf-8?B?WFFVL1c1VkhGVElSRnZGajV5ZWJDNnB2Y0JPakdRU08ySXJGVkRsTWh3RXZH?=
 =?utf-8?B?eUVGa1hqOUJ5Y0VVdEFzTVlTMFVLU1lYMkJuSHlzeldQeXhHdlQ3RzhZSUpJ?=
 =?utf-8?B?em9KT09XNmVNQ2FadTFJOWk2eVZOZ01uUi9MaXlOSUJ0bUdCbnVMTTkyUWNn?=
 =?utf-8?B?RzQrQVRaaXo0MXgvM3FUZEY4cThIa2JueDNsS2ROMGFON2haRE1GZ2tGRFlD?=
 =?utf-8?B?eGE0alFKRG8yVHgvUzI1dmJzQ3RCYXdzTVBLREJ1N1NPQVdodWZSSlFUZkww?=
 =?utf-8?B?a2txcGpPdjZ6T3gyd1Nrd25WZ004Yjl4ZVZ2Z0NPaEMzTVpaa2tsRXI4bStv?=
 =?utf-8?B?NDBtbVdEZ1VKMjZyM0FoelRBVEV6VnN5MFp6L2dKV0NsYnlqQ2NXUEtPU2gy?=
 =?utf-8?B?STlWS3ZIckFwdmF3YU1TUW5yMU1taWQrdEJLbllRQWVMdktzbTdsNVlUZHBV?=
 =?utf-8?B?MTQ5VklIOFpBYVNvSU5ValB5RzBscXRFQnpCM0p4cERWQm9EekNnRUpJWEtW?=
 =?utf-8?B?R0dGc2hNNlR1NW5iVUJmTHhFUDBmV0dMc3BCZnBTOVpnQjZTRSt3a3ZxTmEz?=
 =?utf-8?B?d0lGaGpaamxVMkkweUFnb25Bem9uRnRFc25VRmhuVzVnUktGRUs4M3JJemdx?=
 =?utf-8?B?eXdmOVgxOHlET0NnblF0QzFJU0N5enNiVjhtZk1Ib1pHd0hCRmdWYThRNTVu?=
 =?utf-8?B?NWl6cXNWMlFqRXZ4RnZzRTNQMTVObnI2TmovdU1pem5JT2dtOTJBNlBCU3dV?=
 =?utf-8?B?aXRrV2g0VW1ia0xHenAvWWhYYVRzVkhpVlppTzRNeVdBejBhY2IzdUdJMFBB?=
 =?utf-8?B?VXlVdDhGWlBpSi9pYzB2NGZWdVpmNjBlOUhSSzZZVCtBNGZUT1lSSitiaE0z?=
 =?utf-8?B?RlVSWGlEVzBLTEJCVldSUVBTQUxxU1BZQUZCVXZ3VFRkV3U3RWkxOUtwV1lp?=
 =?utf-8?B?MXlYbWtLTDFMWG1HYmlqanhUaVlmOU5ycHo2UGFPNnFHTC9BVGd3SWpnTFA2?=
 =?utf-8?B?YjR5TUlQdjRyTzlQUk9jN1V6eDVSVFVTSEYrSTB5d1N0bTJRSm9EY3Voc2U4?=
 =?utf-8?B?QUlBUUtQT1BqQm1DNm05a2hMc25rbVorcTV4K2cydU5Cc08xRitPTHJ5TUJS?=
 =?utf-8?B?NEFKMjM5aDhtdzN4dTlMSzArWE13dElVN0VRZzUwUXdTVDdXY1FOaWpFWjd2?=
 =?utf-8?B?WDNlbi8vVTNEZjRtOTJGWXZ2K0ZnY3EvTTM3RmZVOEFmK2ZiQ2xUVHlPQThm?=
 =?utf-8?B?anZ3bTk4UGdEeXc2TkhCUnB6VGYveEF2T0tmUXR0MEZLL09xV1NVVnB1SjdW?=
 =?utf-8?B?bksvMjVOWlk5K3VLN2JIQnJiMnFQRERDUHl3ZnM5NDJqMmhkNHNoMktjanRM?=
 =?utf-8?B?N2pMWHF2SjV1dHFjSjlMOXZQOXpYVUEwVExZL1dRbFI2emFsVGVPZy9GdElZ?=
 =?utf-8?B?Wi9peEJIOVZpenlCRlBNcGpJbTlFZ28yRisyQ0VXVTh4MTJ0bVp1T0hxMmNs?=
 =?utf-8?B?SXl1QVN0L0w1U0tjeFRMSXYybUpJbjE4U2JCZWFhUHFPaDlHcks5ejV3T2N4?=
 =?utf-8?B?T2taL3FYd0NIQjdYSTlvOERORHBMOHU5YmZJclREeHhhc2JyS2hSdDJRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6290.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkRka1dWajMvSkQ0bVZVYUlRVjBpeGpHbjFKUHRCd3FzY3ZDVjZ1ajBhU05R?=
 =?utf-8?B?d0xmZ2k1SHhmTmQ4K0puZWZkZzM2ZFY0N1UydmRtcThGbGlqbHZUUFlnbHN3?=
 =?utf-8?B?ejB3eHhzYW9xMXA0T2hOdDJlM0JQa2h3YkxTbU5qRE5iZERaNGV5T1o1WFpx?=
 =?utf-8?B?L3BpaEJJTXRsYmNTVkN4bjJSWHhjam9Ub2dWaFZXazZIUHJmZTRTeVUvR21Y?=
 =?utf-8?B?TEQ4UGtVRC9QS2pZMlhCMElUbVd6TlM1bTd1Rmp6eks3TEV1TklBTEdqWnhp?=
 =?utf-8?B?SlhldlUwdWE3cy85M2YxQzlLa3h1V0t0V05YQWNIMHMyTVJtODBGaEJSUUFI?=
 =?utf-8?B?S0RSWDlKN01vcGZWb250VlhnckVKSGhQSHFFdzVrUTFuTzFBaGs5ak5aaEZ0?=
 =?utf-8?B?cjJtQlZUQ3BONTBOdDdLSjhXcGxzK1V4NkxUbWxHR2lzZ25KT1BJdEtiMGFT?=
 =?utf-8?B?NGw1VmlnUUdtTVh0YkhhaEt3OVRLSFA5SXNtZ09jNzVnNnViUGduMm5QNndS?=
 =?utf-8?B?WmlhSWMrT2hLRnpBUUI0ZnZ3QzFUZ2d6VWJsNXpKTlFoTndJWitRd1BTUkZv?=
 =?utf-8?B?cldzcTVmREdXM1lqWUF3M3Y3UTlTeXM5VkR5U1hFRlNzOVM1VGQwMGZ5QzIw?=
 =?utf-8?B?a0cwMTNDTkZOcmZTR210ejNZQW1wckJVU3BFMm5aREZWVGZXYit5TW1JajJR?=
 =?utf-8?B?U3dvSkd1UStSR0RFY3k5Sit0Vkdidzl4YW40blE5WWZoYm5ZdDNWZFlpUUt2?=
 =?utf-8?B?d0k0b2dXbWEwdUltSlBrU1p0OTdNYU5QRnpKZW1nZ1VNUGJ5ZFp5cmowQ3U4?=
 =?utf-8?B?dGFCVnlZZzkyR2UrWWtsZE9ic01YSmdteVNWR0NSVWp6VHBMM3BhcktHb09k?=
 =?utf-8?B?VUFDNU8rRUtNdUpuNnlzN1k5Smttb2VzdnhtaWRnWHNHbDlHOFg2SVJpc3A3?=
 =?utf-8?B?SG5LM1ppZzZHQSsvV3hjb0ZlVVMxdWdOZURYeVhIdE9QbTR1MjE5ZUhtUCtF?=
 =?utf-8?B?NmJ3WlptNUJ0T2cxZnV1WmRIRE1LUmdkYzZIUFRBTEd6MHBqQVNvZU9EYnZ4?=
 =?utf-8?B?eVFWOUdaVjl5ODNYVkZJTmJiUFhjRzd3MWM0YUFPNTRhRTlmQUtSSi9USThI?=
 =?utf-8?B?K3M1NjJqdUMvdEViOUtqQlE3ZlE3UUZNWGlzMkhnanJTMVJ6eTZEMm53Q2Vo?=
 =?utf-8?B?Mmljc2wvT0xQZXUyelIxZk5nTEtrMFRZZDI0VFBJV081TlFwS0FDeVRwcnNC?=
 =?utf-8?B?bEE3Z1RIMGJJYW1rSE1OdklhWW5wMFg5TytGZ0RscmdLV0VvWGU1RWlJcUhv?=
 =?utf-8?B?TTdiZVFOMkNRT2dwTzFqQU5MSTRSV2MxOWUvSDRpakhSQlRTY2IrWk5sQXF6?=
 =?utf-8?B?RXAzRVRDeFlUeWYxRDVCbjFRSFdEeEdoSEM3TTkzRkpidkRkRHlzSVFDcTlj?=
 =?utf-8?B?NS9NczFGRUY1RkZVcjFPRjQrV3J6VklxWHlzVmpZb0ljenU3V1ZBM0U3U1Bt?=
 =?utf-8?B?ZDJOUHFwOU9DeXllU3R2Q1dHTjJDaVkwUGtjd1JCOHU5ZWUvTkl2RjhzdXJP?=
 =?utf-8?B?MW1jV0pPK3VjNlBraFFZSnN0Z3BJb25rcllxVjF4Q2czR3JNNEJUajRRVUVU?=
 =?utf-8?B?RHBLcFFhUVk0NHVGRWc0WTd3WlVCbk9iOVpuSkZQYVF5VGpUQUhsZS9yZng1?=
 =?utf-8?B?VGV4enJYQXlNd20zRWFpdVRFb3cydk8rWU1DOENXditBckxUR3E3R0FnTmdS?=
 =?utf-8?B?YTQ0UDB5UnkxSHdNZnI3Z2NNZXpzQ1MvV3cydEp0L1AzSHM2L1NIMnA1UVl6?=
 =?utf-8?B?SEJMb3EwZWx5RW5Dd2lFVXprMHJLY3E0TlZwMk5FSXZnK3U2eTBJRWhEUUJ0?=
 =?utf-8?B?VTByT3A0eUU2M3BmRlk2QktTMU1RMGx5ZlREZ2J2b1ZFM3hpRHpNeGtXYUlp?=
 =?utf-8?B?MW0wY2kvK2gxQnVjaWM3c2VNT09WZVQvdDB5ckszbnpCaGhNRmN5bGFwRDlM?=
 =?utf-8?B?WXNMeXhEaFNvb2VkUnZsbEY2VTQ5YUlqbFEzVHlXV2NWRmxpVFFvWGpmWmZY?=
 =?utf-8?B?bVFGSExHQmljVkhkeDM3Zm9GVnhZNXllR20vRS9LU3dGZGhKK0NxcU9mektq?=
 =?utf-8?B?WmRWdEliK0laRlJDemYrb2xVVnVCZUF0VmFKT1VNV1VJWTIvNFRiWStnZlFv?=
 =?utf-8?Q?7+Zfi1eRajdxwQqmn6U0yT8=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9IjFPMRte3IBrvMEAxyqf+Oc+1KwPcssZ5uZFQSp2QTcsff9todo8VBC5pzyTV4iK5xxAT7yJgaB9nyvnHwhxPzT8tjbJnJ6blJJLhMZ9qFaEBXSQaI+kMOGgpU2+J/RAT9QgeMYAXa3k7kpoSuJQjPCp5NxQkS5ShDI7c4TqdVumhFXl4StMOM5ifRk2HyfhMKMwVWkOgMTqHTPddctwTKJozTX1GnrVm22uADtmvwJOKUaM01Ecl2jfBSvFfa7ETjTITAjfUa8YRlhY7GSj6UPpsasF/r/9WfKMj302d6+AXx4rbhksNBKkcq7HzQwu9jy7//9OpPe3j8TqU6c6/D9epZloSRJ5M9UaEJzYGXrtKnVD+FsTN2YpLKIhHKZvWZLhpIL/oryKiTu+Fmr28oNbJY3v15hKY2z7GRBATSQMgtw2s6aaZReMNcKRgtFU/6E+t20DHz/PZlf2L05+7V7O8dTv3hPx5DQTYX2bGsZmAiWG0xh1omucrhsi/PJ//maZlrunXwbnl8BufgZoFc6eCR5Mh74+etmgLLJAtmtHpozOTtgS/yBKbzDzW0M8G1OqoWWQTI7SbeWMO6nlQ3K4WASL0HPNIvulCxGtkU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b70e9d4e-f71f-4700-4dac-08dce95f69ea
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6290.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 19:11:59.0472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a9WM87AhaRpuCtGjruJh61sbvB+vuM7Tz7DEEAxpvzest+zYF3nbfJ94yxejSjOUJdeLyx9f8FcuM73V3CHn7jeRMImDIce+LgR85nnb/vhfO6trEtjONHVcSXMiDdRa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7534
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-10_13,2024-10-10_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=917 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410100126
X-Proofpoint-ORIG-GUID: ABPNR5N_5g0XPTOJ6vHYDH_KzJO1PrrV
X-Proofpoint-GUID: ABPNR5N_5g0XPTOJ6vHYDH_KzJO1PrrV

Hi Christophe,

> 
> Hi,
> 
> drivers/pinctrl/nuvoton/pinctrl-ma35.c seems to have the same issue.
> 

Thank you!

I will work on fix for this, thanks!!


Regards,
Harshit

> CJ
> 
> 


