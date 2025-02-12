Return-Path: <linux-gpio+bounces-15877-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B24A32B6A
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 17:21:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 11BF07A1134
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 16:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01F4F2139DD;
	Wed, 12 Feb 2025 16:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=BLAIZE.COM header.i=@BLAIZE.COM header.b="JMwGlZO+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-0063e101.pphosted.com (mx07-0063e101.pphosted.com [205.220.184.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEB0211297;
	Wed, 12 Feb 2025 16:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739377263; cv=fail; b=k6ixh+xY+4nCYPdeEOdjFiqSTIxA0FpS7Dr7IJxbuEiOzlPxPeEth6LvhLsIAqXfVAdDGZfBPCx9tKoSnalNokGtyzaiA6OiB+g6kH3GIqx6yFTSzIiXQRj6c/0hWNQesGmW5KB0FrbmdcX+yT4OokM28hHmIbidEXaptt4+0D4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739377263; c=relaxed/simple;
	bh=c2osyWhrPkBTvB6xmBMifyfTO0sdwLUlxQr5xUVqaqQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Qyoikl1Sl0TmaGWMfe/oKBWQJM05/xl+U5IirADdeSeQWQbKNOAPPDrsIj3AHZJTGbzkbBMe358TtS+R4zuMSlFrKeMUDjw7WQExVzJpKlXVEV8YyKOpHPn55HRM2AqQUVohVWRBgtXrZHCbXr2632Hdbm4j7ieD1TETG/5PWto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blaize.com; spf=pass smtp.mailfrom=blaize.com; dkim=pass (1024-bit key) header.d=BLAIZE.COM header.i=@BLAIZE.COM header.b=JMwGlZO+; arc=fail smtp.client-ip=205.220.184.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blaize.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blaize.com
Received: from pps.filterd (m0247495.ppops.net [127.0.0.1])
	by mx08-0063e101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CGK2Ks002668;
	Wed, 12 Feb 2025 16:20:51 GMT
Received: from ma0pr01cu009.outbound.protection.outlook.com (mail-southindiaazlp17010005.outbound.protection.outlook.com [40.93.131.5])
	by mx08-0063e101.pphosted.com (PPS) with ESMTPS id 44qwtd8v1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 16:20:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVBFDxq6WPpN5hf1s9eJ8RPC0qzsFPlqZJEKPuY2wfD3eW/In8VV7IehoF6HZyT14DokTR54D26U1YvzCVsUYXIip47BGPTuCS0OinUhUradMuBYnFlTN7QOtH1KzA3n9VEqsfky58CmTzqbs3F4yNrR3pTwlArV7lwoesG5LEuht7Wt4wqahT2JbPyhNEauLbuu5eu5hMU90Zqpo7k55+r9Juem08mXeJqAN3pLFYK9b6b6aLMVkCgzCQI4oNtUrjh/JYYY+DdQggjBEfmt76y/sHrEXiM8nPeFmR/CIdYUShDqxuNMvTj7mCkIl3mP21i8vUI9b7u44kvX/QIMXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2osyWhrPkBTvB6xmBMifyfTO0sdwLUlxQr5xUVqaqQ=;
 b=md76zXvnFfP6MJVw7Aensi/uPntE9haoWL5ttgItuste+qiQ1ywHy+z61b7zdd/Cu36oNCyEpKhpyi7yLiTmRgv2pjgLy2cjHn5mQhwMc2yAaEYI/pdkKxceRYhlFyvshyFII1SWvjDcg6G85jlTXL4+3p1QmPpO1FuC7mGryBSHpy5DPiNpIP33iYl9n/pCx6ZZG2G0g4l1rCrTTaXgU/QjLclQ+ee3aebeCskt8sTKodOOlFxVvRwmVfLTuzQCEPa8/H2LFb/GBT1wET7jVvpgu0LJGEfOGnLitJMN5kz4O8he/OZXlaVTMEp+UfGePJtrZqeSN0Wlp4IoYUcKIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=blaize.com; dmarc=pass action=none header.from=blaize.com;
 dkim=pass header.d=blaize.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=BLAIZE.COM;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2osyWhrPkBTvB6xmBMifyfTO0sdwLUlxQr5xUVqaqQ=;
 b=JMwGlZO+xeGbqUH4QTNTIqqvY7RJxib34B9CbsxK2bYCVPfkun+E85n9I8KxPi0QEe+FqRk6RKr44WEOLCEHUlFcmJ66Xmgugce5nK8V0u7Vr+BfbAJ/kdYOJA9eWRyr+lmSO9andIbEK+dPgl+tJ8uODV5lwnmt6Ih35GTfmlk=
Received: from MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:12a::5)
 by MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:cc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Wed, 12 Feb
 2025 16:20:45 +0000
Received: from MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::309a:12cf:74a4:5655]) by MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::309a:12cf:74a4:5655%4]) with mapi id 15.20.8445.011; Wed, 12 Feb 2025
 16:20:45 +0000
Message-ID: <259dd121-8c49-44f7-b8f6-e0b68ab88304@blaize.com>
Date: Wed, 12 Feb 2025 16:20:38 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: defconfig: Add VeriSilicon GPIO driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        James Cowgill <james.cowgill@blaize.com>,
        Matt Redfearn <matthew.redfearn@blaize.com>,
        Neil Jones <neil.jones@blaize.com>,
        Linus Walleij
 <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20250212-kernel-upstreaming-add_gpio_support-v1-0-080e724a21f3@blaize.com>
 <20250212-kernel-upstreaming-add_gpio_support-v1-5-080e724a21f3@blaize.com>
 <9442a87b-ab61-40e3-bbf0-caae87c5731a@kernel.org>
Content-Language: en-US
From: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
In-Reply-To: <9442a87b-ab61-40e3-bbf0-caae87c5731a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0431.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::35) To MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:12a::5)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0PR01MB10184:EE_|MA0PR01MB9217:EE_
X-MS-Office365-Filtering-Correlation-Id: bb6a3d88-a96f-40f5-9e7b-08dd4b813406
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q0NNQW4rTVhYSG5GZko0dktGUW9zcURiQ0o3L2g5NXpxZlVXK1BmcmN3Z2FP?=
 =?utf-8?B?LzR3akNwYkdKL1pwVksweUFaTS9tcFpVN1RiTFlIMHZSQjhrdkdnUk1uVVQx?=
 =?utf-8?B?b25sQllVYkthMDUwWThMd3YvNHZhOGQxeGhLeXFQNkpxeVhYNndGZG5VTEhs?=
 =?utf-8?B?L2Q5MWxMSTFJSmhUMFJnQmZ4Qkx3UnpxZVBjc2QrUjE1NkhFalFNM3FtUkZo?=
 =?utf-8?B?aFRIYjB1ZWE2ZDNMRkNyVWxLaCs3ZVdJelJMaVJEU1NOYzhSaUoxampVZkx0?=
 =?utf-8?B?YWxTbjd0eVB3Nkp1UUNuZTMwbnMrSVl1cHluOVZTZGhtRzFWQUFZVGtpUElw?=
 =?utf-8?B?cUprKzRMczFGakNIZ0J3VHFWU1JFRUd1M2VBZzBUeTEybXd2OTVvUGh3bnhB?=
 =?utf-8?B?UllXKy84dm5odDVpU2M4WDF1SE56MEZLVVJVNkVrbGFwNXlJa2NqaWdPZzBo?=
 =?utf-8?B?NUZWVFp6T0hwakduMG9Bd0VzaWZlaG0yNGxDR1JKbFcxSldHanplY1dkTXpt?=
 =?utf-8?B?WXVrRnRVN3ZBOWtrTk5MVWhPMkViVHhyaC94Nml4ZE9IYWNEbWxyODZ4WFBV?=
 =?utf-8?B?ZWtOUE1vcnFEQjdyS0QvOGh6QldxSG4yOVJva05oSVdtTjBSTGFMSFYzMkl5?=
 =?utf-8?B?V21UNU5BeXk3Y0hWemxGT3VWL24yOWtnb0o4WmRpbWFnYVRrZThvWTJBSnoy?=
 =?utf-8?B?eTlLQWlLZFNlbTJjdENtR3FDZWZWYlp1ZEdIcWhibmE3NkVZK3hyenRLLysr?=
 =?utf-8?B?VDI5TzBZd0RYdE1DU28zYUhqeE52M2xGQUFvaTBiMm1nMjByR002ZkxISHI3?=
 =?utf-8?B?VXJFNFJqdDVJcy9pVDE3T3hTS3lJdGttKzNaVGQ2cnA0ajVxTTlod2VmZlpi?=
 =?utf-8?B?aDV0RlJZMSs3Nk1XU2psQWlTL2p1VWc4TUxaNzYwd3FIUlF5TldORytnU0lX?=
 =?utf-8?B?RlpxNzNxOVhzSTBsb2xiUmpxaTRTd3F1a1VES1NjKzFUT2xPM2xLMlFlbzMy?=
 =?utf-8?B?Y2VhRGtoOU0rU1U3QjhENTVUUGdHb3ZNYUlnSTJadmxUS2Ezell4S2F6aFpi?=
 =?utf-8?B?clQyK3c5UCtNVDJFckxrZzVpVklzRzdrTmxOcnU3ejZVNGNESXFZQnJwTU13?=
 =?utf-8?B?aW9oSFh1U3lDL3RPT0pKR3RKMjNCVU5hNm5yV0E1YmZsWEZPcEhESFdVK2Z4?=
 =?utf-8?B?YWdWSE9VMzdQczNVVGpVc1c1SEZ6bUtBTkNPNERZNEE4WjVnZnhBVWxXU1gx?=
 =?utf-8?B?c1NPa1JqZk1sWkczWkZzbnFPVk0zSU4yQW55Zlo4Qm03S09VNTFNVE9jckZW?=
 =?utf-8?B?TmRiSTgvQTliWUZoVERvMFJuRVZtY3lRRUtGY2gwam8yWGEza3l4M3l2a1ls?=
 =?utf-8?B?ZlhSNTlsdGpGZk1qUllBeEIzSlh2TUIwQ2dQVUZhOTBpSFM2YllQS3dVeEJY?=
 =?utf-8?B?OS9BZ2c0blViR1VrOG5TM3VDdVRvb0I3Y2JhQ2JqY1p2aDc3Z1MybDJLdkM0?=
 =?utf-8?B?S2xrQkR1QmZQNFp5WjNTWGp0OVRLVTM1SDFENGFlNHdxQ1dJLzFNUGRUQkUz?=
 =?utf-8?B?aDVSQVRaY2Y4V2k2aFhMMlBvaTVsVWUvVEtBbjk2eWwxQStlenZySXpCMGJN?=
 =?utf-8?B?TkF1WnNoYi9Tb2p4dTV1SW9lbWgzTWlWcTdDQnlKZm03dEc3UXZKbTNzV2gy?=
 =?utf-8?B?TXdESlh6UmxDUkpuZm1PTldnL2RRYkdwVVIvMENSR2RVZ05SR0RiR3BabkRO?=
 =?utf-8?B?OXlKbGIzWURrY3pXUGRiVXl0bXphQUliOGhHWEdhNzE2S1MyeEhHR0d5VUU5?=
 =?utf-8?B?L2wvRUdpNk1wcjhUVWE2RUpGMGNnRXkvS25iUjdOMFpWTHNXUUVuUSt3V2Ri?=
 =?utf-8?B?RFNWT2crc3VobTBEZU5QbDFVNXVsWDk0WmcxM2NrY0ljZVlIRVRUNWM0bG91?=
 =?utf-8?Q?XF0imbhLfME=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZW1iYTNPK01jcWJjUUhIcEc3bzZnRklWQkN1eFgxUFN3aEZKZDY1VGl0a2xM?=
 =?utf-8?B?OThiYXJCUGM0Vk1jcUgwY0tMSUtmSFR2M0RGNDMrelN0WmlkVEM4QnlPR2NO?=
 =?utf-8?B?T0ZOOFR3L2N0TFQ0SU9Hckd3UndhVnFGZWJ2TEdPb2hVelIveENjU29nWWN1?=
 =?utf-8?B?ckZsZy9tWVJ2TkNvM3JnZ0lWc2ZUZFNQSFNvTEtPczVXT3Z1eGhUMlk1bkk0?=
 =?utf-8?B?UWx6TFBCajAvU1A1TmhudWZKNTJzSUZCd3BGVzlTMElwMHoxOWRnWXg2WlFl?=
 =?utf-8?B?WGxNOElsc0lJcTV2MG5vdFdqb09BbWJROWpwZVZ6bGF5VmU4MUZxOG53VkdF?=
 =?utf-8?B?VHZ0QStSb291dko0N2dFT1BocnFpbC9BbmJwK09qc0xkVHdNWkVKS25NRHBS?=
 =?utf-8?B?N2NZeHJ0TGN1L0VqdU5pWW1hZjFMNlI5VkM3Q3drUW01eU51QWhUN1ByUFdC?=
 =?utf-8?B?TEZTVXZDL3I1SWNtRFRHYVNxZ1dQU2RTQS9UVFpZaS9tNWxDblRoMmJRNGdJ?=
 =?utf-8?B?a3dleXZmUFJPa3kzVTJ0SFBjNUV4ZWNmK0RDT0Z6VlRkemExcktHSFowMUNG?=
 =?utf-8?B?djFaMDBaZk1SZy95dmVnb0xUei9YbHdCazROUnpFbzNDVXNJMEloeVdXZXR6?=
 =?utf-8?B?cGxjOTQ3aGNMSDk3WGhmZmUwWDZ2TXRsN1BVeEFxUnludE9aaGtDVmxWMHVC?=
 =?utf-8?B?T2ltZXVGckVweC91ZkxmQXNNMzlEdWJWd0EwbmR1RUNxWVYzUUlWSG5qZ0o1?=
 =?utf-8?B?ZkE5R3JZSkVOUGZNNUErbDY0Wmo5Q0x2LzZTT0Z2THJOdm5NZU1STlh4VGdo?=
 =?utf-8?B?Q0pFTk1Ga3FpNWhaTExLMXEwNWdKUzhHQ2lHdjFNSmRqT3IvdTArV0JhYm1v?=
 =?utf-8?B?R0VnRnBCK1RVbWVZODF6R1VhYXkyYjJsaXBPWkp0WVpqbGpYNVlaMW5STkVN?=
 =?utf-8?B?YmlidklZUk5lNFZVcU1UbUZvR0JhMFdEZE1TT2hUQkVZVkNJVEFnUk0wUmNC?=
 =?utf-8?B?QmpZMm9paEhsYVpTK2xJRHYyTnZSdDJXY2RaSFJXVlV4dXo2K0d1WEE5N3NL?=
 =?utf-8?B?U2JZR1dEbDRINUk4eGxrNldkTlU4MjRDSDZPdmlJTkhFbkl2Smw2VnJzMDBw?=
 =?utf-8?B?OWRyZlNucGxHVVRNdE9xOWo3SVdvbkNpKzdMQ2ZielFuTTZYTGRHWlA4US9h?=
 =?utf-8?B?aUhjSmRLaFBYR21Wc0hVUXNtYXQ3dUlKYjdlRWlGOWxxclBQc1RHdjJMK2k1?=
 =?utf-8?B?SVlSdGMxWGJ4NVlTS21yajkrYkZiRzRRd2F2TXUyTmpzcjQzK3FYVGxrMkR5?=
 =?utf-8?B?MnF6ZHhWQ0F4NUtGN2JzRGtybUFoRXJoTU85M3AzMG5lb2dSZCtpdEgvYTVQ?=
 =?utf-8?B?Rkh1eUNsRGY2TXhNK21XUjJQYkloMWNTVW80QUYxWmZpUFJ4NFJqUStzRnNY?=
 =?utf-8?B?bjZta3RjRVBnb0VsaHBDazRxRGI3MktncGllOXJ5YlZzdElSWGhsckI2MUVy?=
 =?utf-8?B?Q3JHZWlxdktQZ1QrNndvY2RuZHIvNUJySW5ieVF3OE5LenpSV1ZuLzVZRDZQ?=
 =?utf-8?B?WTNKM1hmQjlIckVRL0Q0Y3JYTC92azFIWFdCMjJWaGttSy8wSnh5TXVWYUQ4?=
 =?utf-8?B?L0I0UG81dVRZWXM2aE1CMnJjbGdsTXM2YzNuV2xNNWFUK29qNE1rUDN1Q3F5?=
 =?utf-8?B?TUw0QmNWSzJvWmsyYnpKdFV0eSswaG43bFd5QWl4ME1jcXBMdXZzYUwwb2k3?=
 =?utf-8?B?eHZ4dFB0UlVqazU4MG11Z0srWXUxTjVtMXdvMXNrbDRCZk9BaWs5TmZWYzFI?=
 =?utf-8?B?ZEgydHJteHZvUmJXV3lUczh4T1UyQ2tQNS9mMjBxa2txSFpVdlpjTUprTERM?=
 =?utf-8?B?cncxVTFjU2hXcWN0K01QMldxcEFzMm9HZmtaZkRNQm5YZUI5ZVpHVnVuUks2?=
 =?utf-8?B?dmRaK1VJVk5nOW50MGQzVW1UT0pVNGJFeGxieEd6NmNWMVlXWFVKbFJENURF?=
 =?utf-8?B?VVFiblhQNllvaktwZ29XcFdvM1ViTXlQdHEvYzZFL3A2ZXRGWDhoTFRFTHpK?=
 =?utf-8?B?V3B2Qk1VTnJabzRxNEM2VDZzK0V0dDBjM1VDTWxaVHhpZHFyc0liRzF5NURk?=
 =?utf-8?B?STRNMlJseGswL1FHSmliVlFQd3dKNFgvWGVRZnRqcXlCVWhVbUh5U09pbHZm?=
 =?utf-8?Q?SUJYRXXn1r6uGvzfYLYDeUU=3D?=
X-OriginatorOrg: blaize.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb6a3d88-a96f-40f5-9e7b-08dd4b813406
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 16:20:45.5018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 9d1c3c89-8615-4064-88a7-bb1a8537c779
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3O1Q+vBFxQG+BEVV9e3pBHr216iV21VOaIV//EEizIz+ho3und/3R/7/OJTpWZ0Z6ZKAI3mVodWc8nZLPpLC9WfJfmXE8q8+dTINrjB6It0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB9217
X-Authority-Analysis: v=2.4 cv=ALxkcdDx c=1 sm=1 tr=0 ts=67acca62 cx=c_pps a=z1DpLKiO5LaG0b/iPMc9+w==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=4MthsM0t3ikA:10
 a=-5LYVjoNHPMA:10 a=wUrX77Sd921UbLplWH0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Z4MBOZlFEC73U5Ysfhol9MiDUFG55ikx
X-Proofpoint-ORIG-GUID: Z4MBOZlFEC73U5Ysfhol9MiDUFG55ikx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_05,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Reason: orgsafe

On 12/02/2025 15:25, Krzysztof Kozlowski wrote:

> On 12/02/2025 14:46, Nikolaos Pasaloukos wrote:
>> Add support for VeriSilicon GPIO controller.
> You enable not add support, but still the main question is: Why? Which
> devices needs it? Why this cannot be a module?

Hi Krzysztof,

Thank you for your fast review and apologies for the typo. I forgot to
mention on the commit message but I have mentioned in the cover letter
that the driver is needed for the Blaize BLZP1600 CB2 board which is
already supported on v6.14. I will fix the commit message on V2.

This driver enables support (controls) for multiple peripherals on
the board, like Ethernet for NFS boot, SD and eMMC to load modules from
these media. Without this driver build in the kernel, it will be hard to
mount a filesystem and load modules.

Kind regards,
Nikolaos

>
>
>
> Best regards,
> Krzysztof

