Return-Path: <linux-gpio+bounces-5927-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A318B5371
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Apr 2024 10:50:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E960B1C20E52
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Apr 2024 08:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9F081773A;
	Mon, 29 Apr 2024 08:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b="RO0oAwK3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2138.outbound.protection.outlook.com [40.107.21.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D075D14A98
	for <linux-gpio@vger.kernel.org>; Mon, 29 Apr 2024 08:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714380611; cv=fail; b=NH4gDqkxzH7EoxSPwRJWFMY89iNUSU5BWj6Da5eTgRggSJgVRQqybPH80XlJH8ga8S+eK2bKlWpgh+/CrGkCnLt8q1Mg07m5ggd18lpqoh/CbMx7PlkmGibkqgPtAW7Dsdcp01XsD1nzaQbZBXmoqavlPhqdqIqy4YjJfXWUNCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714380611; c=relaxed/simple;
	bh=g6sOCO4LIuv+aFavadprLUUzkBr89VfKGjUAeHGKSck=;
	h=Subject:To:Cc:References:From:Message-ID:Date:In-Reply-To:
	 Content-Type:MIME-Version; b=MqlFW18eSZ7IltLfszV3JzPNT7NCOdnm+Iu/T7Zn1gpjL8OiSUAs9iy23s7uOzbHQWHyHKV0um/hhoudSBAZVMNp9QAu4TQ8QrXnpjsQZO6el2eb9P7fuKRJeTf+V6h8rgPfizOrERCx/6gp1N9I/4brfOeHnMLkD/F3RGAJE10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kontron.com; spf=pass smtp.mailfrom=kontron.com; dkim=pass (1024-bit key) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b=RO0oAwK3; arc=fail smtp.client-ip=40.107.21.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kontron.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KITL0U6ccG0RccqeBMByaK5D3mpstqHlS9WFiwKiXChxsJJjIDPRIm6sJ6011J8XqTuVeJOMCkZCfkN6at0tA8Q5VVJ9i2VTy+Xey8pCIMhV0LSVM72aty8uaQFN+mS+3OSrKHdB+s5wVVvpAATrAqDt/T7orXEQ7HK51BUQMWvL0hDA0/eTaHg1TdEhq9wFmC5v2TKmNqom7ob13qiGVKQSDvxDREpgY4oDSI+UyA8uinVUne1Hp263psA+1JmMUPRZTsKlaY6vfhfLchc3G8BdeX6ZWUA0L0wWWbxvTmqPED5QtFs4bdHVgNKzLLs+aa4nIWJkNcYfyBVPK1PPFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjIRVwTn4cMvCSupTwgDtWJ8/xyIKD47t48msO+6VGk=;
 b=NGRm24Ba0jCkkPpxwdSD4EHsnvELmcnyQufgCxXhSS/vMHKjJ7RiK8vArudzFVIbf3SEYfpj6LE7e3satdOiR4q6xe6Qy6D/FACIzO22rMDIbdUxDf4syTiJUcx0b4M5yr2vMesnvcmZARjeVSWw3K6rW7iNPySiHUNCYxrKlLulmEmmvEvSW48WOsdtqmEbVqfn9jktlEvwnVh45VtTs+u7lttDitDZXd5hKSvcCrtAjBYj/zVQxXKzUd19rAr6HXdQGoI5yMa7ZbnEg/NgcxIT0K7m8LXBZTezykCR53EyzO73G0qW53FAPQw0ZCaa9oOI1Ir3tSKVauCVect97Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.com; dmarc=pass action=none header.from=kontron.com;
 dkim=pass header.d=kontron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjIRVwTn4cMvCSupTwgDtWJ8/xyIKD47t48msO+6VGk=;
 b=RO0oAwK3SpVFjiXFXoGseHlUkJ34yMNuKi01ZO8BbsKnu4VZ7hhx3aqtbGxyckySg+aAb7XLglrYP1/6ZP48AMz5es9HRdG95tsa9yhoRQDb6rCOaBSb0yFhqGA43ocUbu/xaNpJo6H0KGZ8f/kR+q9Zk5MxXD/jzbvpGDOLCMw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.com;
Received: from DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3ef::11)
 by AS4PR10MB5693.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4f0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 08:50:05 +0000
Received: from DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::142d:c1aa:6bc9:ca4]) by DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::142d:c1aa:6bc9:ca4%6]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 08:50:05 +0000
Subject: Re: [questions] : gpiolib and gpioset behaviour
To: Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
References: <a6492fca-e5f9-3f5c-6a61-d08c051f0ac9@kontron.com>
 <CAMRc=MdQ8CT7uxBRhPmttNhm5kzp1+Vij2LmVGO0QsA0xUPtNQ@mail.gmail.com>
 <04e6ac4e-0178-c910-2dcd-45a726f75c0d@kontron.com>
 <20240426020720.GA9777@rigel> <20240427120902.GA367260@rigel>
From: Gilles BULOZ <gilles.buloz@kontron.com>
Organization: Kontron Modular Computers SA
Message-ID: <0916be3f-8549-30d2-349d-642f850e0810@kontron.com>
Date: Mon, 29 Apr 2024 10:50:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20240427120902.GA367260@rigel>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR1P264CA0022.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::9) To DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:3ef::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR10MB6252:EE_|AS4PR10MB5693:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ef70589-54ca-4a41-902f-08dc68295db7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MGdnUHh3RmlwYXBHTnA1WWVaYmZLMW5KRUk5cVh5azlsd0s4dXpVRk0yYzhM?=
 =?utf-8?B?RXpFZ2lLa1p4MmpoV0ZIYWxlWmlDWG1leVh0ZDFHUWo2dno1T1d1KzFHZHFv?=
 =?utf-8?B?Qzh2YzRuVVlzWTl1Ymx4WHYwZUJIaExYQkZKUG1EZUtXOERsMGY1U2srTGRv?=
 =?utf-8?B?K1ZqOCtYQTdHU3VTbWJkNW9oUU5HRVdQUGNKYjJsYWhnRlhJOFZBQ2E1M0Fr?=
 =?utf-8?B?WG9EczlwT2ZTUk5RRDB2bHVIV09qTG0yblJiNXZBL1VuY3l6OW5WUVRHb0RE?=
 =?utf-8?B?eEp3azRzZVJYWUpDaVBSRzBWZlpXNXdhWm5aT0ZpbU1ZUlJxazZUUHFORGN0?=
 =?utf-8?B?bTJRV0J5YVB5b2lVbEE2MHlaWUg5WnBFTXJKeG56VG45SVk3d3hyNjliZ3R5?=
 =?utf-8?B?dDgrT3cwNkdpQy9CRkVFWWJtd2tIOFN3QVpCSVF5R2piQkxyS3BBZTlVZ2xn?=
 =?utf-8?B?UzJVbTRlU0FNTDhLbkpxSmRxWElGWGo0M2F5ek5ycjl1WXUra1ZmNjgvK1Ur?=
 =?utf-8?B?UFZnNEs4Nmt1NkdIUEtYL2RFZDFkOVdKNjNWWjY5a2RiMWhWQS9neDNSZVNq?=
 =?utf-8?B?VU5SQ2g2K1phU3daVmpLQkxSbHRHQldPaFdTNW5USFBrcnlYbGJHVk1TZ0dT?=
 =?utf-8?B?OVBvc2dXR0krYmxmc3MvMHFqOHY5THhYaWhvK1JzWmU3V0dJWUVFMWdVcEhx?=
 =?utf-8?B?dElaSXpjK2dQdjdoZGp2cnRna2p2cmNSQVZDa3VobVprT3RaQ3QrbU1OYUNs?=
 =?utf-8?B?YU5GR3MveDVNM1NEOGFzZCtFcHFWV2t3M2xuK2taUEF2MWdjZE9ob0Z3NG53?=
 =?utf-8?B?cUlvTFduZUVUQnc0b0hOOW5veitqWHVHOXJWdklLeW5OMUlRZStkcDU2SmZi?=
 =?utf-8?B?NmlwaE5jNVNYbzNDYlVCQnQ5elJzME9vRS9lK0h0UDE5UURZZ2g2eDRlM0xt?=
 =?utf-8?B?eXJ2TjhqSmJNOS9rZC81SVdQNXE2ekJJb0NWRXhCU0tIbVhKbkxwbWtSTmU4?=
 =?utf-8?B?czFuenNTYzdSR2VvNmNPT3VqVG9hU2wySmJnMkhPdkdoVWh6NTFYRXJqdnR6?=
 =?utf-8?B?YjQxRnhJTDBqNjhhMTVKOHA5elB2OVdWVXFSRWJVdmJHUXJkalNsMUZ3cmpB?=
 =?utf-8?B?eG04OHVNOXdNTFNCdzlXTVNWaVliaE1Ya2FHMXZIUTRjK3psa2gvajlaaUVP?=
 =?utf-8?B?Q2doNlJQQWlucFg4M0E5Vm9QeVUvS1pnVXFDdEdFOTBqMHJxazFIRk5DaERs?=
 =?utf-8?B?MDZ4VW9rN0FaRklyUFR0N3pmWC9DOEJFRzhKcmJLWEpMcVM2Vm5NUk16NjFR?=
 =?utf-8?B?UTk3MFMwaDQyRU92bzgyTDExMWhBL3pVV1MzTngvOWV3b2ZiZnQrYVg5THlw?=
 =?utf-8?B?WnordldOZXFQbDhFVVBEWUEwNFU2ZHduRWEzd1hIc3FKdmdZR09rNHBuY1Yr?=
 =?utf-8?B?blJEOThGcHIvcFhtcXFZU1dJMzcvS1IyZkRKY0d2bzYvWVc1U2l5a1d4djdt?=
 =?utf-8?B?TytnWXBHbnBBU2FCV3VPNTRyVGpxd2ROQ1dCZFpNenVkN2pmb3Zad3FJUUJC?=
 =?utf-8?B?VUFTUGVEdmtIVjdTbXo0dWFkamVhb1BPQTN6NnBLOUZYdGpiV05Xd0pRbktV?=
 =?utf-8?B?d3JleHpVSnNsbElKNXlCd1BSQU0rSUdyQ2l3ZmZoa3hDcDk1ZXZIRnU5djUy?=
 =?utf-8?B?ZmI4cnFaaEFHQU9LKzBlYk5CRWt2UnF5eG1JK0tSN0RaZE1wYW05UUR3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmR1NE1oLzFSQ2U3NGxxUm81RkhZR3dMZ3FmMDN4MnBPUk1mdnduakRhRlBK?=
 =?utf-8?B?OU92ZjBiVTVkVGlONmNFRmkvUzE1cHV1UlhLUUM0blZIOUFvemVhYzBGaHRI?=
 =?utf-8?B?ZnpSM1ZXM2dXeVU4Wk52Nk5oVGM5b0RsZmdreHFJQlhXTUJQcitOSlFUY3FJ?=
 =?utf-8?B?Wjg5bFU1UmY0U1N2c2dyWFNvQTFWQURGcDJCbU1DUGgwQmxCOThpSE9WQjV6?=
 =?utf-8?B?MElPV2ZhWnBpNzVFZjZxeEpMei81Z0wxSGdERjJ0UGN1WFFkWjFkZEdVQXZG?=
 =?utf-8?B?K0tOK3FUOWtJRUl6NDNGSVBQTHYvUG9mK3lsNlNwV2lPc09SOTNIYzc1VjhZ?=
 =?utf-8?B?L2ZId2JPMTRsMDFoMjl3L3NFZmVsK2g2c082YVN0VWdJMmc2WVJhWmJMZDYy?=
 =?utf-8?B?eEhxZ2NqeTd3UWxRQWplYTV3OTJtOU42amZuZWJmMytEdVFqV1VPSXNseDZ0?=
 =?utf-8?B?RDNkUEhLRVlxZXpyY3JwOXVwMDROMVdpUWpEVWpSc3ZUd2QzWDZyaG9wRU1C?=
 =?utf-8?B?bEhyT2NqNG4zdFIzQXJWMVNNOHNhVWdtRlVZRFNXdDJ2UlRyTW5ha0F6ZlVh?=
 =?utf-8?B?V2kvTy9rS01jZUZWSE5VeVhsay9RaStTd1ZIU05oM085MDlvYytuSUY4enYr?=
 =?utf-8?B?bXpHSU11WmVJclFhTmwyMmpZTWwzdGFEV0k1UzErcnZFMDV4bHNsam5lVjY2?=
 =?utf-8?B?OTNyZmhZUjNoeCt4SExNUk9mSzlqUzRWMk9sUEcrdW5MSmlnbXZDK0krc0Yr?=
 =?utf-8?B?RWV2d1NselVTbFVEUUdOWkFqZ2dJSWRWK05yeXNXVFVSMEdWSzlOTU93N2cr?=
 =?utf-8?B?K2lzcWVVQ25yWmN1amNkOC9JRm43WHFwK1BBTVBFc2p2TE9RdFliUHhvQ3Uw?=
 =?utf-8?B?bHdSVjVMUTZqR1h2bUloZlp1bkVRL0tpTEF4SFd5MnMwZmhQNVlPUXExUHNX?=
 =?utf-8?B?dFNIZFMrekZBZlV2TldkVVA3cCt1ciszTEtqcWdEVmkxejBWV3ZlQTgyWDZ4?=
 =?utf-8?B?RkxuR0xXMVBTY0JRUUtlNGZJZmxDWGpVVkdlWXJ6dDJLZXBjMFZ5Q243SE41?=
 =?utf-8?B?bjZvL3lycGl0T3cwL29vd0Vob3o0dGlEMUw5djlwaFRDSnpUaHh5NlN1aFNO?=
 =?utf-8?B?bmU5bGVZRUJHbWpkUnFXM0IwVW9kMUc5V2NtUU0xWXB5YzFZb2FZdFdQOGRx?=
 =?utf-8?B?ZFZMY1U4Tzl6dW1pTFVyLytyaGFtT2ZlRDF1V1djamJSZzQ5ZXdpRzU3bE9R?=
 =?utf-8?B?c0NjMlFyYStrdjVRanBOVXVPNDdRNFZWMVpvakdYbnVTMGFlUlJsSUErQ3Y3?=
 =?utf-8?B?VVBxK1JTdzF6eUF1TGt1cG9CVzVPY1U4V2xDUEdaSGNhUG52L2Y4aC9QRWlC?=
 =?utf-8?B?dG9yazMvQzZVK0R2cXRjcDNBdzRWdU5SQjF6SUZNcDk2TXlULzRRYzk4eHNQ?=
 =?utf-8?B?N2FkWXVCdmt0WkFzelB5QTh4L01TS3BKYzIvSG5CQVNPUVhPSkNSSzkvaXlJ?=
 =?utf-8?B?VHE0Y2MrcFBaVUd3K3VFN2pFTmtid1psdGE5UVJtbnJIWVhnVnFPOG1UdVpk?=
 =?utf-8?B?V1pNMlV1bG1BVXpyNzhpSEJPdjIxM2RZWTJlVTFDeGtDVGlwRGdidVMrQTgx?=
 =?utf-8?B?VGh1NCt1c0ZaWXk1ZzBTSGdIT043TFBBdVg0N3BxTHp5ZmY0U29ZUDFUdVAx?=
 =?utf-8?B?QWpDTTNaSGs2U2NvUzdqVTIvaHQ1YlVFMGF0eDdueUxjOTQrRGlXWUNwVFVY?=
 =?utf-8?B?ckt4VDJNSlJ5WkhoQUNKV202SEYvU1piTnFpQ1I4aWEzOGxIbGt1ZE1VM1ZP?=
 =?utf-8?B?aXhyblBXV0VPNmNUU3pqR2k3VlRRMVFKOGhCR3dmN0sydzFVOW5hQUM1N0dp?=
 =?utf-8?B?d0tkUVArQlFEYURhSUdYR2pieW5vODFhdHI2Z25sdGRIV0tzK1VRVkJmd1hY?=
 =?utf-8?B?Nm1xSjk3Y083VkdMVmV2RE9MMWdpY1MxYzNOa0hZcENsUFQyQTNMTnl5Z1Bs?=
 =?utf-8?B?VjRRMTBCOTRVS0I2V1JTN1RoMVBOMk5HNTZFNmZLTllGNW5oQnQ5ajBKMElz?=
 =?utf-8?B?SEwzR1N2QkdYQ2g2QTI0cXlpeGsyNlp3M1M0aVR1b254aW1GMWNNTDQ2cE5M?=
 =?utf-8?B?Nk5wZzk0bWNJSDJNbEh2YjBnZ2l1QnFIRjE0Q3RqWm9HTzNCNXVnaWFnSzBz?=
 =?utf-8?B?bWc9PQ==?=
X-OriginatorOrg: kontron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef70589-54ca-4a41-902f-08dc68295db7
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 08:50:05.6782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1suBl0Vg7GR99azDFSEXNwU6HY5i6WwJtNfSBzOBHn540byFnjXgoSftgiM5FkbgMmgDvExrT+p4dVPjPY2wiw29HDLMO+UqQJT7lup3Jlg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5693

On Sat, Apr 27, 2024 at 02:09 PM Kent Gibson wrote:
> On Fri, Apr 26, 2024 at 10:07:20AM +0800, Kent Gibson wrote:
>> On Mon, Apr 22, 2024 at 06:49:05PM +0200, Gilles BULOZ wrote:
>>> On Mon, Apr 22, 2024 at 3:55 PM Bartosz Golaszewski wrote :
>>>> On Mon, Apr 22, 2024 at 2:44 PM Gilles BULOZ <gilles.buloz@kontron.com> wrote:
>>>>>
>>
>> Note that the mask in gc->get_multiple() is unsigned long*, so it is a
>> pointer to an array of unsigned long.  Its width is not limited by
>> unsigned long, but by the bits parameter.  In your case the mask you pass
>> should contain multiple unsigned longs to achieve 112 bits.
>> Refer to gpiod_get_array_value_complex() for an example of building bitmap
>> masks to pass to gc->get_multiple(), in that case via
>> gpio_chip_get_multiple().
>>
>
> Bah, what was I saying here - both the mask AND bits parameters of
> get_multiple()/set_multiple() are bitmaps of width gc->ngpio, where the
> mask identifies the pins to get/set and bits contains the values.
>
> My bad - must've been before the coffee soaked in.
>

Yes, that's clear to me now thanks to your explainations.
I also understand now the allocation of these "mask" and "bits". I was
missing the fact that gpiod_get_array_value_complex() has two calls to
gpio_chip_get_multiple(), the first without new allocation (value_bitmap
directly passed as last parameter to gpio_chip_get_multiple() and the
second allocating "mask" and "bits" (on FASTPATH_NGPIO bits so 512 bits
by default as set by CONFIG_GPIOLIB_FASTPATH_LIMIT). The second call
is the one used in the path from ioctl GPIO_V2_LINE_GET_VALUES_IOCTL to
the driver so OK.
The same occurs for gpiod_set_array_value_complex() having two calls to
gpio_chip_set_multiple() where the second one is used for ioctl
GPIO_V2_LINE_SET_VALUES_IOCTL.

> Cheers,
> Kent.
>
> .


