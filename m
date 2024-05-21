Return-Path: <linux-gpio+bounces-6490-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F56E8CA608
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 04:01:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDCE51F216C5
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 02:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA16BD51D;
	Tue, 21 May 2024 02:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RW5xxWIh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C9033C5;
	Tue, 21 May 2024 02:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716256868; cv=fail; b=ctfQQvOZjwOur41+8qOZ+x26SbDiXeMQ6WkLb7B62i4aB2fidVdLSkLJGYHvaCzGN54aYaqYoz/C07wqVxN8iH2jBVptU62QBziCBFEBlaPiPy+UI1XCq3E1MqBL8A5pOF8Hx7s4xTZXIqfOiftYcz742KAFLTUPgpoLsBdCP9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716256868; c=relaxed/simple;
	bh=kpnDp7uQbNMdy9eEZk6g64GL+l+Rs/xnT5wkBjgRfNw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eGo1iw6QwFQll4Z4OLOPJ9VFdaT6tCPrKzCBMAKjxPw5gKixRW1NYXRGyt5mlFPycUlD2TyhncpswHzGN32ZORjJGMu0h0G/tSS+R17g047hOoaBP78vVQXPh4RB6fw6zRO85fP70UKVr0BpPfIuyv8Lb3WKidQ1qQ44r7KQGMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RW5xxWIh; arc=fail smtp.client-ip=40.107.220.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H8v0JSNFyppNXO2PR3nvs3z2MRyW4wIUNcf5DrmeHFXGmNY9/JMPeVmaPA18Kf0bIfdIpuHQR1F6VBb5kZ3jUxcqw3VlC4PeAUsaEgAiywjD49utPqUfeZRnMzVdv2piG8hL4+SfIhOo7hlwHhGzEMeV7KN/Pv98+5B9bX1yGN20CLQcgjN71IKHjB4WGE5is/D3IEDa07E1Bz2t26aWIA2Swwe7CFXS1sJmKzN1R1K1r3Yg+BMqhDdBdaZk6/UYNl8I3mtvSxjHhFTIuO9m5sr/KPTbm65ylLuig/7xs2f1qa93y8ONiN/vMhhvQsS6N1MVzrGQPxTXzgppTybLJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sXxF3GvbqYOeEVx2lzK4yLyhFu0Ult1+/w3jTxE0BBI=;
 b=Zrhul7gZQbhmcz4da3AM8VFfl9DgPt5qXVjRFXHaG6yt8ZE6YPqeGojr03RjNtHeHP7Io0qBvuhOcLiVuqu689Cerwq84FN5PddI4Z+qBBB5jCoVKK8oWoYRwyrTi1iZG4RspoghXQfzjkYVkzBVJcOqsGLpVcz61FF+/zZLht7OVoN2bEamsRvfap3TFQDcG08ECnTxpxDXSeSY+3jrE8CZKKePB8/KSH3BmNQtZst0a9DTpbH8vzea4G4gC11EGpmjHlH1ok76RKvGFQz6WL47xdHsNxNjDu5EToWF0xfdN6z39Dx22Lwa1MXC7guw0QUvkU0VkTzXYl2wspGdgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sXxF3GvbqYOeEVx2lzK4yLyhFu0Ult1+/w3jTxE0BBI=;
 b=RW5xxWIhwOGG+5lBeilciQxh1fjHwYa+/QTjGtTsdeSmwa+FgOMX10JqQuRchfRx9SJN1FBpLEAaTrrSLF83qFI0pNnAL7IiG2Pb9IPEbEMNoejmTMoDajVpRimWsBGKxQauhK5QuPifa+wJLMtKW3Rti9SXScGWo8UgpcgmWDY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA0PR12MB7697.namprd12.prod.outlook.com (2603:10b6:208:433::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 02:01:04 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 02:01:04 +0000
Message-ID: <4ee142f5-7e21-4fdb-aadb-7328407e7c42@amd.com>
Date: Mon, 20 May 2024 21:01:01 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: amd: Set up affinity for GPIO lines when
 enabling interrupt
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Shyam-sundar.S-k@amd.com, linus.walleij@linaro.org,
 Basavaraj.Natikar@amd.com, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Kieran Levin <ktl@frame.work>
References: <20240519124109.1523-1-mario.limonciello@amd.com>
 <ZksaCG3Q5qHthNcN@smile.fi.intel.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <ZksaCG3Q5qHthNcN@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR18CA0027.namprd18.prod.outlook.com
 (2603:10b6:806:f3::22) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA0PR12MB7697:EE_
X-MS-Office365-Filtering-Correlation-Id: 71107c5f-5c76-4803-1ee4-08dc7939df02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U1lBSUlCb2NYSHRtZEU5RGVLNmVsamVkaHE4clhFOGJ5WkwxN1JKK0Z4bkpj?=
 =?utf-8?B?cUkzbHdYQ2hrNUdBS0lwSnBmNHpVMm4vR1RCQktaMDRpQThSamlEYVh0Wmhj?=
 =?utf-8?B?TFhPSjREU0lJQ2NHTWN2Vm1UZCtCamx3SkF0K1dPMCtnV1dCampyTmgrTHV5?=
 =?utf-8?B?YUZLT0prOHQwM0JzUldzcVNXSlVUaUQwU3JGRW1ucll0U0NqaTQ1dnhyc0lZ?=
 =?utf-8?B?VHUxSit6SUVWRnJzU25VK0RxMTFNN1dObmF0VU45ZE9zU3ZLWW9uVzFmY2FP?=
 =?utf-8?B?VGVaMEtiTHhxRFpjdEJONlFYNFZRQi9XYnFwZXhIY3dZVzMrMTk4aStpanVJ?=
 =?utf-8?B?TGNUaGRERmppMTFvQk9PM005VHYwa25HK0lxcXNqT1pGZitjcm5wYm1UaWli?=
 =?utf-8?B?UVY4SzdKMTA3YnBIbHBaOXI5SGlaWU1udlFLbm5lcklJRnAzUWV0Y0VrVmty?=
 =?utf-8?B?YllOZVlyUURSOUFXQ3BURFNiSjRFVHFLT2xtekEwV1lTOWJ3NWQ3NjlzeVA1?=
 =?utf-8?B?dzFVaG1xMk14Wk5ROXg3dW1XNmNlTmRjeXNCTitFOFFyZ0pTSDFJZUQxWUo5?=
 =?utf-8?B?NFVyRWQrOHI0djFuU1JGYlpQMXlNQzUvNm1SSVVualBEYzVLMG0xMFFMVzdS?=
 =?utf-8?B?VWxzZ3FwYzFrSVUvV2VnQzZCb2hmZUJsODRJWlVqcFEzMmwyUjRMQytTdUlm?=
 =?utf-8?B?dytzcWxOLy9yQ2FEWFRqYXhyeG82MHVyU3hsNUE2bUtvSjFrOGN0bUVRRGRG?=
 =?utf-8?B?Z0VBRjFUZkltUksvVTU0VGxsVHBGeWI5WFhGdmtLQmhZdDhKbnZzbVA1Zmg1?=
 =?utf-8?B?NnVVLzFmZ3dxcWZOclppTE1ZdU91M2JKclhaWFFOa2JtMll2K1U4VG1YTWVR?=
 =?utf-8?B?TDlmU09zeS9acllXbTd0R3VWSXl5dFZKbVAwZXNQY3o1Uy8xVHRoWVh3bTVn?=
 =?utf-8?B?cXRQZEs1WkhvRG9iMXVMN1dIa3ErMHNVdHJJWHE0TjVkMmhwR3JoVVlrQWpy?=
 =?utf-8?B?Qi9WaklGLy9xOExNRWplRjk5Zi9VVjQ0dUliK0FsUXRpVmRrVDNPUHBITTAw?=
 =?utf-8?B?ZW1KZjZqTjdBUW1nVmtvQ1p1N20ySmRMSVFZWHFCenBSSCthUGpQTDZrNVY1?=
 =?utf-8?B?UVB4U25DNURRY1F3cWJuSWQ0UFpxeDN1U0NXUXhEZWZwWVRuRVBpL0hlT0Q5?=
 =?utf-8?B?NHRVU24vNGRkcWVLV0x0bTdIN2k4cnJzMHZvU2MrR3dzbkRhUXBMRzhxUEh6?=
 =?utf-8?B?N3U4ZElKSTBiK3E1cmU0WWtRZzhCUjlGc2NSRG42c1NtNlUrM2U3akFhSE5u?=
 =?utf-8?B?NnhBSVNZYXZMK3IxR3hzMEtqVVBIM0ZJNE8vc3h5T2MrbkdlWitRVnJnR1Bs?=
 =?utf-8?B?NWNXdFc5SXFXYzFsNjhNSGNMMCtLYlptQU9qTGhQclpHZXdZUTF5a1FjQ0lU?=
 =?utf-8?B?SG1TcXdic0wvSVZlMUFqaUs0M1pVcVg3bnBUZWZ4dXIrSmQvM254WVY1bkFY?=
 =?utf-8?B?Z29MYmc3M2wwQ2loejRZR3hvQktMVWU1cmUxd3lqUFoxTTdnY1NpU0lWaGFQ?=
 =?utf-8?B?bW1PMGRpV1Q0d0E2TVFLSE10RzZCaWJsWGo3QlAzME1lUkJUc1ovR2kxNDJS?=
 =?utf-8?B?WU1nSjRld013c1FFcExPdlU1eWUwOEx6cU0vQkZMRG5RcTVDUG5YZWdTYTJP?=
 =?utf-8?B?WHZQY3M2OE43cVVCSFVUV2V3NkEvMHd4dzRkZWtLQ0xtUjErRGNOSTJRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFJIV1VjWnBPL0lReWJ4Z2VhRWRGWmhuZWxOT3JBdjY2dkh6cHFHdXpSazcv?=
 =?utf-8?B?dU1VNDRwaXI3NUNVZXNTbkU0NnAyb1p1cmVZZncvRFpEYWVIRVFXWTllMS9K?=
 =?utf-8?B?OXdmUzlsdXY5VXNYbW5ucnNPeHZ1QnMxOUNCNDZlVCtmRHczZVk0WjRZYU80?=
 =?utf-8?B?NHkyUjRXVTJDVTJlY2QwVXhwYnIvNFB0UWZLcjJRV3QvbjFYNWhad1RHd1Vm?=
 =?utf-8?B?S3hta3ZsSmY1Q0ZrUVZ6WXlvRGRTL0pVM0FaVG9pZkw5TjlQNC9KTE1BWkZU?=
 =?utf-8?B?dGcxSXFBU0xNZWVSSkhDbGhuMTM2V0luZ0RudGlvRlh6OENNb08wYnQ5N0lo?=
 =?utf-8?B?QnNSZEVldHhwaVhqVVBUN1A2dTVDRlBnYTdYTnpBUTQ1RU8xelRpSldUdVJv?=
 =?utf-8?B?K1g4TFE3M3lwRUJ2MHBwYlRzSEMzYnF2TWxMdSttMjhwR2xBbnVqWW1FK1hK?=
 =?utf-8?B?MFJzWkpyV1Ayem4zbktkVk5BeVZ6Tnk2cVJNdGVYODJmcUMwWWFma001Snk5?=
 =?utf-8?B?R3RUVTZWTWdWcmNTTmpJYmxLaVVGeE01RUs5cTlOajdHSis0aVZqVkVsTFIw?=
 =?utf-8?B?eTVTRmIyemNtQjJFUnBPZnIvR2dReXdaUTNzTElHeURjcmgwOW9PNHNMK09V?=
 =?utf-8?B?M3piem9wU1JYU3pUZzNxeG85YnZzaGRlZHJVM20reG0vRUt6b2lpcjJwZkdY?=
 =?utf-8?B?NGw3U2ZDZ21tUkJxSjhvZXFCWm9RaElPRWpmc3kyb05acXdydXl4UmgrUC9x?=
 =?utf-8?B?b0IzNkR4NHNDNWd2K1ZERUZPYWFqMjZTSFRUOGxibjMrRythM0krZDNuQ0tU?=
 =?utf-8?B?NmR2SlV1dkhSZjJmSHFaNis1NXNxSnZVbi9vTHQxQnNKOFF5ZWI3R015SWE1?=
 =?utf-8?B?bjJnMGQ1c1RuN3RrK2pVYkdCam1zbWRGcTA0aXh0MEYwZmhGTW95ekRHY0hy?=
 =?utf-8?B?VmRGcnBJSnpoV3RhdlFmRWJZdGo0WVgyeGYvREprNEkxeW12UjNNOG1RUUNX?=
 =?utf-8?B?blFiZllKSDBzNDc3Tk9QUCs2QUNpMWNmK1hlbjJPanpORXkvZC9LVDh4bGRq?=
 =?utf-8?B?ZVJzdEh3TEdBL3MySzhwRkVjTFBsQ29FaDltd0IyaFM4d3BNTWNockhWRlpC?=
 =?utf-8?B?d0FXQjNBVFFaZTZXT2kwbkJGU0VjemNhTDhybHVYMHpwMTh5WnlmVk5lZ3JR?=
 =?utf-8?B?SUNubTVDRDE3R1pUQ0NLV1Fmc2IzMmtEbzduZWdQalpiaVFQTEdpMDFpTXlh?=
 =?utf-8?B?OU5KWFcwTXJTSXhLL2pyaHNOV0ZlaDh1ZWxJbHFpQUhudXBaL2tZdmwzVEpl?=
 =?utf-8?B?TGN2YnNkK2FYYjlzZDN0Yk1ENDJTdStrejM0NG5abEZpRWhBVzdNUU1HMkNx?=
 =?utf-8?B?YzI3dGFzczhCZzF4SkQrS3QxbmxibElWQTE2M2lwUzc1L3RPQllPdEM0WmM0?=
 =?utf-8?B?ejQ2RGtRMitqbm1tZkYrMTBwcXg3THJaSXMrMzVGWnhqbWNNOGZBUmNiS1Ex?=
 =?utf-8?B?NXpiTGhpWis5b1dJbk9mczBGaE83UjVEd0FEemttOFlUMXZlWU02c04yZzZl?=
 =?utf-8?B?blhkTW9qcTR2cDFZeXlhRVRxTHczenBKekRFZmVGQjdPVkRtYTAzak1yZnIz?=
 =?utf-8?B?T3ZrcGNjUnU2ZzdpenNxOUliSlJ3OGFjV3hIbXZsZjVONitBL3hnNU81UFJH?=
 =?utf-8?B?THZuVWFkV0FTaWlZQmtvZXNQbWFKOHBRRVRjRWdSWkwwUGcxUnBPbnBBeGRT?=
 =?utf-8?B?Tk5oWGZwTEV4MWVHVDNLbVpPTlp4ZUI0STVWVmNIWmFuQ0sxeHVuVmhEa29r?=
 =?utf-8?B?cnQ1V2F6WkFEZitVTTBseG1DSXJNM3FoVi90Z25uMkFrbFA1ZEFhcG8xaldw?=
 =?utf-8?B?cjA5V2NQVVVjNmRzK0oxOTk5RVRHK1JRN2d5b0VINWZEVVZGZWlnYTk1VE5w?=
 =?utf-8?B?a2JvMUNWQkFmb2F6ZnFMOTNhaytwVlkzNU5pNUJ1ZmcyVFQzT2IxZXU3ZWZi?=
 =?utf-8?B?OTBDNmFMWHRYcm9tTTZZV29YUVhtb3U5S1IyTlVEVml3OVJwMEFRMkIwZi8r?=
 =?utf-8?B?RG42UGcrOWRaK0xKbGRESW5Ra3dvMnlEdWY1enE2bmFMRFRNcHlJMkRVUVdu?=
 =?utf-8?Q?tq56QH1gvkObL/Vj4cL/DBgZF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71107c5f-5c76-4803-1ee4-08dc7939df02
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 02:01:04.2825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FbKEXSXnRsGGuXoDMRQM/n9MQRWiSncF4XH8mCl9Ew0r/x+SrQh+FtHYD+VKsp6+sVjhMG8GiTZ2AlPgvWHAKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7697

On 5/20/2024 04:38, Andy Shevchenko wrote:
> On Sun, May 19, 2024 at 07:41:09AM -0500, Mario Limonciello wrote:
>> When a touchpad's attention interrupt is triggered on a different
>> CPU than the GPIO controller interrupt multiple CPUs wake up the system
>> and can cause higher power consumption than necessary for operating
>> the touchpad.
>>
>> Waking up the additional CPUs is especially unnecessary as the
>> irq_ack() callback for pinctrl-amd doesn't do anything.
>>
>> To solve this save the affinity of the GPIO controller interrupt when
>> it's set up and assign that affinity to the GPIO line IRQ.
> 
> I do not much care about AMD :-) case but I think this is quite a big hammer
> with possible undesired effects. It will basically put _all_ GPIO IRQs on
> the same CPU which may slow down other peripherals, like UART, with potential
> of buffer overrun (on the high speed modes).
> 

Yeah I see your point.

> Ideally it should be done in a way that exact consumer may ask for this from
> its driver. Yet, I have no idea how to achieve this, but it would be really
> nice to have something in I²C HID to
> 
> 	set_the_same_affinity_as_parent/GPIO_irq()
> 

You know I think this is only half of the problem.  The interrupts need 
to be aligned but so does the I2C traffic.  This was something else that 
Hans mentioned in the linked thread.  It's a lot more complex to sync 
everything up.

I'm tempted to have a helper that i2c-hid uses after everything is setup 
to go and align the affinities rather than at probe.

> ...
> 
>> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> Cc: Hans de Goede <hdegoede@redhat.com>
> 
> You can move these (Cc lines) to be after ---, that they won't pollute
> the commit message with the same effect made on email, i.e. Cc'ing to
> the listed people.
> 
Right; thanks.

