Return-Path: <linux-gpio+bounces-26925-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 70958BC82C5
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Oct 2025 11:06:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 51ACE4EA9CA
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Oct 2025 09:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F16552D3A70;
	Thu,  9 Oct 2025 09:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nutanix.com header.i=@nutanix.com header.b="fBuOWZ9w";
	dkim=pass (2048-bit key) header.d=nutanix.com header.i=@nutanix.com header.b="wUo6Kwl0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-002c1b01.pphosted.com (mx0a-002c1b01.pphosted.com [148.163.151.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE781FBCA1;
	Thu,  9 Oct 2025 09:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.151.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760000785; cv=fail; b=pCRM4G7IS4I9o74ldqcvE5tJkAg72JNkGRjt0pm/1YsSeIG4DPL2l7aatKpb1i+pZSKc12tvnzUmgDdiR6eRvQAVlnWS0xMpJZNBQ7ibaNj+9xn3lmhawvRVQbjK3cOEcejykad2h5p12MWX1THG2bsqDGLg3KawTeEz4K9lgMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760000785; c=relaxed/simple;
	bh=EJO0ymzceLA3u82ywajGrvSzddYUFyOPml5UaOo6kX0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Gwj2h8tIKE6aic3MsLhMuf6ICyQ0vIWkVx5qi8j9MA50vX7lZNjoJW9/1NxwUh0D1R/22xVDribwKlbfocypocVkQeDdWecfGy9ELONK3rGSD67UcsjosHVO3WCFEN3lyy1cQaJW0s2+wreXOx4v6Ptn0CfpajVUOqZ9Ltn0Bl0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nutanix.com; spf=pass smtp.mailfrom=nutanix.com; dkim=pass (2048-bit key) header.d=nutanix.com header.i=@nutanix.com header.b=fBuOWZ9w; dkim=pass (2048-bit key) header.d=nutanix.com header.i=@nutanix.com header.b=wUo6Kwl0; arc=fail smtp.client-ip=148.163.151.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nutanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nutanix.com
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
	by mx0a-002c1b01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5997nodw636420;
	Thu, 9 Oct 2025 02:06:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint20171006; bh=ikukN3Qd2Lj1aOv+gAzvdY0gIc1Qe0hjdfymnItjo
	RY=; b=fBuOWZ9wSlYZET92Zkf09eqxItjKuHv6w1hVDnItHVgEjfeaIYXU/dTIk
	/M1ZXvPSD9dm9IQAlxgZj8tprJkyxJgjcU8++/mOV2aF2Mrz9XdseZlcIkmofG75
	R8kW0Ek22madJ2kPcjiSXw7Amw8ifb7KkjRHB3dN62oLZAwmbj+wC/A2seT1URN5
	QG419mm6q+1466977wODsACwAINRWA21UYQUZD62QYFTvsHHFG9zDCrv1utsdrgr
	Gu7p/2UemRObFvTNaVx0JFtKBL6dnS7RgV72joxg0dwgFRXkc+by+CoYveoZkEcP
	nkcP+UbnM3VQvlwO8MUNOr1BTo86Q==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021129.outbound.protection.outlook.com [52.101.62.129])
	by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 49nx1s1erb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 02:06:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jIVm+3gDdb6YZrVCpj4kf/XHOZJn3o/HU/XHuNMEtyeI5qvKffpbvewr5sXNh7rI45EiX03XifNzjgjQenuRlW1byAMWVmj1et74JKQ2o68Pl+JOO8ti8pNRwIproT+KaWyW2ry1IxogtWKR90Afc2Jo1cUomBXSlqJzbd0aSZmu0ix/GnlwzLbaxr2vBpy6Y9TDqbpnYpKlN5bYF6IYfHThymMNsg01jfrLnECFzv4cZjtSKTfjQOYGE5qXf4VGoVYevfOuzLxlWcogCnhTicOVJhREEYlG3eThk1BddKNJaSCKEqoPsqlhDUlWyjVPX8NTVsB++i71yIbplEY+hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ikukN3Qd2Lj1aOv+gAzvdY0gIc1Qe0hjdfymnItjoRY=;
 b=dY57jFeirp2QigFo63SDfPfGs2hk0PbUWD+C4M+ef6w5WgZLPqLjltp/d2Ogufdn1kd42dbM7Itayaaoe1wI5KrHxUTKAKFgyzSb5pW+Mdp9qPapXMMGDZwoXHBhXc3AY/VbbE3k7bLd8WHcJ6JmZrZLQWpE4LA/p+OL0jqYmOxzRn2sT/MVa4A6ufTJ0GM2f0WcCXSF8f5Z9WNnV7ZHre1Na62x7aAtNoTQuCNb6Bd7gNTFuMi+QS6n0JIsOfTWIrouiZ86DV/O2LXrbr4cdvq+dP7beDSzkC4VFmEDI0+Nh34qSj+gW0BNCd3pPwvurKPi44ynqLqeRJP6oKrehQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ikukN3Qd2Lj1aOv+gAzvdY0gIc1Qe0hjdfymnItjoRY=;
 b=wUo6Kwl03aRFH7jKvAMfgrIs9QK4GnbQnrcRm9QzwFxwT0eM5vutXnBJtf4G9GHfrbWIA/XYXYyWf45192wkGE6Nzb8MCEC7y15maXsYNusTHyf/xawIdTrPv5jCETowThGBuePvW5rkN8ySDgfp0ZTBbeBlLClvVP/XKIWVW7ixFGG5IO5stq9CMHNnKVT3tm/ZYpFLpcVw71Fro30a2FfKIxjfz/lGb+SLmszn3NYdzzv/UUtmXVGgGWeTy8BDcClm5OQMiFn9REhF2A3jtBsazq+1CM3Pwz0e+/JMIO9D3XRiMSyA8z+8wakbLW2KgNu5CQgrTpC2mmGFgoo5vg==
Received: from PH0PR02MB7159.namprd02.prod.outlook.com (2603:10b6:510:16::8)
 by CH0PR02MB8289.namprd02.prod.outlook.com (2603:10b6:610:fe::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 09:06:02 +0000
Received: from PH0PR02MB7159.namprd02.prod.outlook.com
 ([fe80::6cf9:b35c:b143:bb88]) by PH0PR02MB7159.namprd02.prod.outlook.com
 ([fe80::6cf9:b35c:b143:bb88%3]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 09:06:02 +0000
Message-ID: <df4857cb-daae-4428-bd93-5878564624c5@nutanix.com>
Date: Thu, 9 Oct 2025 10:05:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: gpio: gpio-pci-idio-16 regression after LTS upgrade
To: William Breathitt Gray <wbg@kernel.org>, mwalle@kernel.org
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, andriy.shevchenko@linux.intel.com,
        broonie@kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251007081657.30422-1-wbg@kernel.org>
Content-Language: en-US
From: Mark Cave-Ayland <mark.caveayland@nutanix.com>
In-Reply-To: <20251007081657.30422-1-wbg@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR01CA0007.prod.exchangelabs.com (2603:10b6:805:b6::20)
 To PH0PR02MB7159.namprd02.prod.outlook.com (2603:10b6:510:16::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7159:EE_|CH0PR02MB8289:EE_
X-MS-Office365-Filtering-Correlation-Id: f3345679-36f0-485d-4183-08de07131244
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?blREVG93ejhLem9DSG5kMmZxcU1qTEtJRGd1QUpiT2dPNlJrOFdWcTdYWkJ0?=
 =?utf-8?B?bkNBRm9zdjUydDBEelVjT2wreU0xNTBkODhVNkZza09tWFBTVGRRM2plRlRW?=
 =?utf-8?B?QlMxbktwOXZobFA3ME9XeitudWNSRjgxbzBLamViNVpjUUNySGV6WlM5V0pU?=
 =?utf-8?B?VjFTeHRjcVZkV2Q3U0JVVzRkMGt2TWFKREdBM1NZcmJtc3o5WkhEVWd0TzFM?=
 =?utf-8?B?TWFPekx2RWlDMUJvcnZkYzlYRm53Tm13TW5QdmNxM3FjN3EwTUoyeFpvYlB0?=
 =?utf-8?B?OWh0ZzhIMjRsTXpJbUo5eWZCNHBQUUh3amtvcjRybXRuUEM3WXIzU1pBUUlS?=
 =?utf-8?B?aVY2WUc5RlYvVERuVnk0U012a01ZTmpxc01CS0plRWtXa2Z0d09YYVphR3Vp?=
 =?utf-8?B?ZXpGeHR1MnZsYlNJcWR2aG9JR1dKRWtKVGNlcXhNU0NQZ3RvRHVFSmhCWFlp?=
 =?utf-8?B?K0lxUEJQam9oclZONjRBYnFsMFhkVG5KcWZXRW4zUzFyelZXeWxKakVCaHl3?=
 =?utf-8?B?NzZ2V1NQU1NoMkhMeHlTYzI3MHd1YXc0ZGY4NzlIOFlaUngzK1BsbGhadXFJ?=
 =?utf-8?B?eUZoUC9nRUJBeHdwbXA1bnNYTEh5QjVBNW44S24wcmZ0ZktiTHlJQTFvM3Fz?=
 =?utf-8?B?SXNycEhvUTFnVXZVMVlnWnQrcHpPWmJ0czlCR2VyQjFmZHNmQ1k0YTQ5Q0I0?=
 =?utf-8?B?L3JSZ2FyQnBtOTY2cHlZdGR0OTZrMjg2MUZYQ1F3ajhkT2hJMEQ1VmJRbjdx?=
 =?utf-8?B?SHJVZTIxcmxkNGEwV3JrNFFoWC9wdXRMaWQyb2NkSFVyeEVvanFCSDJuYUU3?=
 =?utf-8?B?cVA3bm5SbitkSzdrN2JudkpWUGJiQzJKcTR2SG5qdnBLVEdYY3ZwQ2JjNHdu?=
 =?utf-8?B?TDR1cU9NUFY3Mkd5OWU5SGpicjhyNUVibzdKVmVOSUdsVWxTUnpHYWtUU210?=
 =?utf-8?B?bENKN0xqeVZxVDR5UStZQ3JhdFhUMFF4a2FYbEtpbU1ZZzl5YzZXV0NiY290?=
 =?utf-8?B?a0VrWkJya2UxaE56RE5nM2dqbUJ6N0w4NXl4V1lxUUFBRlVrMDhteSttRlpN?=
 =?utf-8?B?aHVLdlNBWWk4ZTNUeTVzZzVubG9FY3IwYTJNdVlUMCtVTlhDWlNJb0pVZndi?=
 =?utf-8?B?Y2M0OXlYYzI1Unk3VkZONXhiazVUbStyQ29MNmRGZGNNbERwcXE3WmFGcXlt?=
 =?utf-8?B?SlMvZUxLK0RMZ3BJNVhyeW5PelZwVkRhNGVLLzVNVEc0dS84cTdSWFJPa1gv?=
 =?utf-8?B?SVB0OXVxdWdZWitoVTdCWmEvOFJhY0ZtT0xDY0FyU29LS2EzbWVUTThWUU40?=
 =?utf-8?B?bkJtNW10cTROeFhyU25qMlNScllDYlVNK1NnWXBpV0dJZmN1RHBzYm1zWHBm?=
 =?utf-8?B?TDJxdExWSGNoK1FRbWk2UCswM2ZkRGNkSUdYT2hBMnpKdTViajZpWit3UzQy?=
 =?utf-8?B?RWJheFNLa1JlYUFwRU5CRlR0VXRCN2szZTZUS01hWUxEcGVPeGdLSWp0Ukxt?=
 =?utf-8?B?d1AvVnJGakowVUZ3Zm05RTU0RE13S3FrVjZaZTI1WENrZjhsVWFqd1RwWDl6?=
 =?utf-8?B?Zng1dzNDT3RmamFZQzd3dXRDVUtHSlB5TWF3V1RPazlobU92SnFrWnV4TXEr?=
 =?utf-8?B?YyswYU44a25ETWppT3BBRmpaNExOcXVmb0ZBNVlONmo0YmFHcGF1M2dwS2E0?=
 =?utf-8?B?T0xJMk44b0JqVEpmZVRxMXZmbWpQd2pRMzNLcVFPMG9NN3RzTXUwN1RncFFX?=
 =?utf-8?B?QnRKUTVwS25iV2RyVE5rc2V5NkJ2S3RldUFRWThtMjhEN1V0dndOZ1RBcWxR?=
 =?utf-8?B?dWFuR21JeHB6QUp4czNwbmd0RXNhZnJnU0c1bDJFbUdOaUE2TUVKY0thdEht?=
 =?utf-8?B?WXpzMHg5UWxlcFB4VkRINHRXVjJ4aXpZcVpEWENsSnY2cllpT3FIL1VlYzBt?=
 =?utf-8?Q?j0AlRv0emx1+b/PC4Bw1213MgcJSygJQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR02MB7159.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3IvYStnblVPTFl0TTFobUpHWG1UQm9DREFHLzN2cE5NNHlyaUsxcFVYb0RB?=
 =?utf-8?B?b3VtQWxYaDZjMzJkM25FcXlMVlhqQmg3WWJUUTBjMXhjUlNNbGZGcnVIR2cw?=
 =?utf-8?B?T0RSMFlKRlJxU0R4S3p3ZkRMNDNPUzVXMEg5bjhSdE53Q3NteU9xQ3NmK00z?=
 =?utf-8?B?QmVJc0Q3MGVGSWtFazhXM0wvQjQ2alJlZVhyczlENGh1NEV5Y2Q5OWNIRzU0?=
 =?utf-8?B?NmVISHFMbVB0Y0lCNHJBOFd4eU1ySHdHTTErOW9EbVVPeEFUQzdMV2tGSWNL?=
 =?utf-8?B?M3dzeGJVSGJ0V1NvQkc1M0VhOWFxejUyRzRGSHhybU43UlFxSnVRRVJrY29L?=
 =?utf-8?B?UVRZVDJQZDlmdDF5K09zME01UTlvbnN6VFpRS0pvN0xOcC9xaXJkejBTSUNn?=
 =?utf-8?B?NGFkRUp2UWx5MU1ZZTdRY2l0SW4zTHNsL2N6RVJyK29obndNUi8wbjdYQllW?=
 =?utf-8?B?VWFOWlNsc1N1MU5SaGRjblNRSGNVWWQ4dTJ0ZmYvOFZqNy9wcDVhK0xMTS9w?=
 =?utf-8?B?dTFFM2UzN3dNNVoxUHhwWklSb0xSUWdFSWhXYjdrbFdRaTZucDl2L0FraVhm?=
 =?utf-8?B?azJsRXgyYmRoY2NBTUcrNm9mbTY2ZTd5V2tjVDMyek1yT1F5elcvazZSSEpW?=
 =?utf-8?B?TTBOMGJlYVJQR1c1Y0JMSEJFMmxtMzZyNWNRUzhEWU9qT09tMFVKOWt2U0Za?=
 =?utf-8?B?WElIeXZLSzRueDJtMVorc1VqYUVGcDYrVkk4WDI2NEhacjhMcyszMFJRbm14?=
 =?utf-8?B?WXVJcStwbFpMQ1VHV01kN0cvTUpuNnR1YmhsbklLNTY1Mm1QVUZKcG81MHQy?=
 =?utf-8?B?UnVUcllkUmR1QzRKRGQ2QXhUb2QxZW9uU0JLOWxjU2xZaFdYZWwvWkZCSVlj?=
 =?utf-8?B?L2pDaE5LYndpRTFpZ0lLSk5QdVBDVGkyV2JDSXlHeWJoQkVDRUorZGViUHJK?=
 =?utf-8?B?TENxcS81U2pOdXdFMTVjVWtEY0FFeWg4czhjUDNEbHlZRzhyK0Y2NGlVTjBz?=
 =?utf-8?B?R1J0N3lkamd3emU2MFN6OG5RdytnYUtaMXEzNTFsLzhRUVdHZkEyMWxNS24v?=
 =?utf-8?B?dTlIZ21zS2o3djlTUnFGN0ZQU2h1Sk9wbVRlOGVJdm1xdEdYSU5Ta0Vya0tq?=
 =?utf-8?B?ZDFzNjJrcEdGTUkzd3prN2NUYmFHTEFEQzRocjU0R0Z3SUI4dURwN1dLb05P?=
 =?utf-8?B?N3h0OXlsc1lmVGlWbmhVWlM0RXlUbUJUYWlZQ2RPOXBWOS9rUk4vZVV5WFZ5?=
 =?utf-8?B?am9uRjdsTVhnQVZxMWtFVkxHRVZEeFV3ZGdqUUJmVDY1QnY2VC9hbVdwL3o1?=
 =?utf-8?B?ZlhReUMyWEdKTDNEdFBMY09nV1A2NSt3ZWxtc0g4QitNRmVLM3JvMHU0aUh1?=
 =?utf-8?B?ZmovRDJGU1pJZ0p0Mmd2Ykc0UnRjRHN4dlVvNEJWSGtsV2hjM2orWDJmT3BN?=
 =?utf-8?B?NVoxVDlhT0FsMGJlSlNsSzFlZGpGNTVvNy9vSEtEdWlRZWlZQzNuRkl5Q2dR?=
 =?utf-8?B?SGpmVERVTkIrQUdYc0dZeUhPZDFqME04Qm91dWFCMjROQ09XZE5CVFg2ZzdB?=
 =?utf-8?B?a2tSeUk2MWpSdWRMeU1hL3haZG9IYWxxWExKckI4MTdNcm0ydHZFQzl3aW5F?=
 =?utf-8?B?Snl4ZWxDSU9IcUlRYStwM2ZCU0tHOHRLSmZ5WVpIcjVBRVFXRCtsQWRSL0Vn?=
 =?utf-8?B?cU1vL1g2UTBmWUJROTNqSEw4QUF1WTRkVlFrTVI4NTRZV3h0VXlKRGFKUVZ5?=
 =?utf-8?B?amIvTkMrVmxwTVJwYmV1c3M1UlVYeUxDSWFubUNMVzNMekJXQ1ZRMFV0cDZL?=
 =?utf-8?B?QU1Cck50VlBmQlNIZlIwM3RjUXEwWUtsOVFwK0ROK2p2ODVBYmpSU1I5RzJC?=
 =?utf-8?B?WmZTVXBFU0VVY09nTXEyemNRUjNqTWl3aFpNWXlpd2YyZGlqbVBGS2JUdnNO?=
 =?utf-8?B?N202Z1cyT2V5bmtmU1NQY0NJdFpyaEFESFhUQjZzbG1ZU1Nua05rM0J4ODBQ?=
 =?utf-8?B?aEdKSVhwWVpXWlV2Mno4NjJCTEFXQmJ1L3ppeThUWW9OMkJkZnk3K3UrQ3Y3?=
 =?utf-8?B?T3BKR3dDRDRENU9rR2N2VFUwS2w4WGpXV0E3U1J4OTZWakhGV05TZ2R5ejBQ?=
 =?utf-8?B?TzRTOGowMm1QSUsxZU5GeW1VcWFFLzBuNTBjaDNoU1RoUkNRNVR1ZHlFb0RN?=
 =?utf-8?B?NHNIdnVQN0F4NGEyYjllOCtlQ21QVy9CcW4vSGR5cFpZN2paVVpNWWJpYjNv?=
 =?utf-8?B?WDJraUtkUzBVeDZiOUJTdzMzS1BBPT0=?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3345679-36f0-485d-4183-08de07131244
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7159.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 09:06:02.8080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kpOksHwqyN1RP8tofNiKmvVV+Ngkar5E1dhBvhDJ83KxPFV/uVyeRBEsaFZ/Czs+bLWo71XXWGoN3RihCS3tCSvio6SFb1SLVLOf5iWlslc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8289
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA5MDA1MSBTYWx0ZWRfXytLg+h2f/m8E
 Txc0TlrHBFp9zgLp8u94tyHfkyBPWMrkzQh88rKKx6rdyV0TYVETAqvnCAnNxYd8uwA0KckCR0G
 5cw2DwUwd6e6woSrixuU7zAyQ4igv6AOMRtiD7gfCzmuRjno8J6IjKHx++tt/oRe/SpAyDBC/1O
 lZVeyctXT+UOQkPplpUBqBmXxfn8aAqXqF4se0C8EY2ty7IRT0p1kEmssnQ2i7lXMDvIbo16JFy
 5hWRwpVU9gFY1q1DiT6guHzx6nbkJTekn8nxKX3iSmxuncB4s2ZupNqbxdR4nKC2Us0oRGZwUX1
 XKEEYgdwwktAk5CoEj0uMYpT5kilk4AmQXSGWXvXZX/jdJgv1pdJiAi24ABVHdZnU5S3i8La0+G
 8NX9Iulp/327L7rkd8IQj/1XSc1PmQ==
X-Authority-Analysis: v=2.4 cv=bsFBxUai c=1 sm=1 tr=0 ts=68e77afe cx=c_pps
 a=CEL0Ro9GVPysLTgZBAX40A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=0kUYKlekyDsA:10
 a=Q_xIXm_HfvAPT17zsnQA:9 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: NdE4S2vHGaNtEnWmL-QzubO9qPX-7ivB
X-Proofpoint-ORIG-GUID: NdE4S2vHGaNtEnWmL-QzubO9qPX-7ivB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Reason: safe

On 07/10/2025 09:16, William Breathitt Gray wrote:

> On Mon, Oct 06, 2025 at 09:37:14AM +0100, Mark Cave-Ayland wrote:
>> root@debian12:~# gpioget 0 0
>> gpioget: error reading GPIO values: Input/output error
>>
>> which also output:
>>
>> [  329.529321] gpio-512 (gpioget): gpiod_direction_input: missing
>> direction_input() operation and line is output
>>
>> My guess is that this is because
>> drivers/gpio/gpio-regmap.c::gpio_regmap_get_direction() isn't able to
>> can't handle the situation where lines 0-15 are outputs and lines 16-31
>> are inputs, compared with the old idio_16_gpio_get_direction() function
>> it replaced.
>>
>> What would be the best way forward? Possibly add the .get_direction
>> callback to the gpio_regmap_config? Or is there another way to have
>> mixed inputs and outputs with the gpio_regmap API?
> 
> So the intention I had with gpio-idio-16 was to provide reg_dat_base and
> reg_set_base to define the input and output bases, and then
> reg_mask_xlate would do the translation between input and outputs. I
> think this design is allowed by gpio-regmap, is it not Michael?
> 
> In theory, gpio_regmap_get_direction should call gpio->reg_mask_xlate()
> which is mapped to idio_16_reg_mask_xlate(), and thus set reg and mask
> which then is evaluated at the end of gpio_regmap_get_direction() to
> determine which direction to return.
> 
> Is it possible idio_16_reg_mask_xlate() is returning the wrong values
> for reg and mask?
> 
> William Breathitt Gray

The only logic around .reg_dat_base and .reg_set_base in 
gpio_regmap_get_direction() is this:

	if (gpio->reg_dat_base && !gpio->reg_set_base)
		return GPIO_LINE_DIRECTION_IN;
	if (gpio->reg_set_base && !gpio->reg_dat_base)
		return GPIO_LINE_DIRECTION_OUT;

Otherwise it attempts to use .reg_dir_out_base and .reg_dir_in_base 
which are not set for gpio-idio-16 because the GPIO directions are fixed 
and not controlled via a data-direction register. And as these are not 
set, gpio_regmap_get_direction() returns -ENOTSUPP.

Were you thinking that gpio_regmap_get_direction() should have some 
additional direction logic if both .reg_dat_base and .reg_set_base are 
set, based upon their comparative values?


ATB,

Mark.


