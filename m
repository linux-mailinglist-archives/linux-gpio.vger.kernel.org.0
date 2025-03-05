Return-Path: <linux-gpio+bounces-17121-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E0CA50345
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 16:15:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECB6E161187
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 15:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CEEC24887F;
	Wed,  5 Mar 2025 15:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jHha/W5G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2054.outbound.protection.outlook.com [40.107.220.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72B28460;
	Wed,  5 Mar 2025 15:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741187742; cv=fail; b=TpnBl0gOZpBJB9xa+iMQ69b9uWq60NeKhOiD/KBMlfraJceVM1rsZ040y+4PU1zfXXWdbN2PAUuVoLu6viHu70ujj4qHGctFxTbr3MSzFUJS/EnO35KIaqJA6ic2GM7nfjfYglENjD8EeFAi7EX7ED4HXZzvfzyHG/tdyF4QMVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741187742; c=relaxed/simple;
	bh=W6iI4ATSAG3xXXJbx6hemJ3YUYar0RTp0IdB9pbsACM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hB5sQ74l3Ydm5Bbyw8FIBi51wvQYf7rbl3s+YQDm5dlANqUWJmz6QjKR2epn3oZZbknOwEwAajfNdCaoLbbRk0EMnQS8KqdcLVQU3FiAvywc6VcWngbgGkLCxFFG/YJOa8ZqW/qEzA0XmaBLML/PXr9OhiSwv5npEV2woMCbE4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jHha/W5G; arc=fail smtp.client-ip=40.107.220.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PIllcHziPsLJji77iut92bSbJfG+CnRQBpj0QlJ3LcPVW64cuYuftlpcuoyx3aBG1vgQHZdJxxYPC97gjB4MCF6MEde0DL1lcYH4dyURjdqlu5oSeMtLWfQd7vCavCToVXSB56+OjtHE9n+jwHKfaOPrs+J01lZxcfb8Jh9UkM8EY/vLBFNxqupxDlThkXL6AlFE0LF3IKvo7weucsZ9/GwFTO22sk5I2MB5yOw2eoJ/Y9+CWhQCNnc6yhsegE8XSnEwfFSVPltrq/TNjPu4wW5h6z8B8Y2ZfsBvhEvmgTn9f2oXWvpNd6aByB6NVBHu7hF4ZW2CuHX3fBHO7N5DNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kymCgK3NvIaf6QowlTPvn4v9eUicJdDJxOnSnnTmGk=;
 b=CzRTaWLv5Q0xT9NBnNYKbkSf7C8J7hYTx0aK3OKYd9vIpbMu1yqLtVfHvne9sXM4LEmq3MNuSSUv2WGxgatnG6+WT9J/PqYXP2vlIG5h8aID4waEu8rKC+Z92UEWXGTrksxEMlQaRSvdH5ajAjaZYlQtMvZZAgOOTNH9Q4b7H8lnnW/tJvoZDF5nM8mFpTl9+1h7Fj2GKtGBdjcZg390LsCEBqdOFEsoYOypqNdeGnn2oS/L5Se4oGu8wZrpwqu5g/m5HG3KQoD6OYuevQdQWKWj1nJ92b20NxrOgADvMEkb4OsKdk651ccRtfgPMr07shWGyO3kEvun6G4zvA93kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8kymCgK3NvIaf6QowlTPvn4v9eUicJdDJxOnSnnTmGk=;
 b=jHha/W5GRHdtufF7b4MNeQInsKcQ1klra8IllZtVuUUw7AOXzYd9pytxvSmPHeqmRX79yGdc/1/vioeK2uR0A+NFxf3G/8Ekw82qQuSZZv4J0dyI8dilQ90vDOwYzgPDitjf43J1ztZcZvLKhb60yiWfIUtupjqWPcKcEMam6Io=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by SA1PR12MB6994.namprd12.prod.outlook.com (2603:10b6:806:24d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Wed, 5 Mar
 2025 15:15:37 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%7]) with mapi id 15.20.8489.028; Wed, 5 Mar 2025
 15:15:37 +0000
Message-ID: <7f88cd4c-7e62-4d49-bc84-dafc94f4c200@amd.com>
Date: Wed, 5 Mar 2025 10:15:35 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pinctrl: amd: isp411: Add amdisp GPIO pinctrl
To: Linus Walleij <linus.walleij@linaro.org>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: krzk@kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.chan@amd.com, bin.du@amd.com,
 king.li@amd.com, gjorgji.rosikopulos@amd.com, dominic.antony@amd.com
References: <20250304232051.2936557-1-pratap.nirujogi@amd.com>
 <CACRpkdYxZ=7RRvjKpQW9_mZG_KDXuAt6kdDZDKWJxx-f1BRvCA@mail.gmail.com>
Content-Language: en-GB
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <CACRpkdYxZ=7RRvjKpQW9_mZG_KDXuAt6kdDZDKWJxx-f1BRvCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0057.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::34) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|SA1PR12MB6994:EE_
X-MS-Office365-Filtering-Correlation-Id: d201eef8-1a2f-4814-5eb3-08dd5bf89555
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L3RyZFhMakdXL2pUNktyS3RldHV5UjRqZ2o1NW50SkNOWit0YUcvTjAzOGFQ?=
 =?utf-8?B?a0Z6RTJ2TzQ4ak9JcURJaEhHbHNUT21saEMyOXJLTzBYVEk5MmxCMjZXYlV3?=
 =?utf-8?B?d3pDdFE0aWN1NGhyOWN1UWlVa3lkNGZxRlo0Z0E2MCsrdVc1Sk5TeG9zb25S?=
 =?utf-8?B?NUltRkJya2YrSTNQSzRQMTlCbjBucFVEY0ErWUxMRTFQbzZyellubGVWRzNF?=
 =?utf-8?B?c2lCNFplTFdPNDU3VzFJOTRsVm5iSHRXc0UrVTZtTzE3dkh2NzdRTE16UUdH?=
 =?utf-8?B?QStuYlpwVEpMN3V0azJJOUxUQ0tFTG5id1pncnlMclRWWm5TSjgrQ0N2WHBY?=
 =?utf-8?B?RGRmOTZrczEvMWJEUkxzRnh0dms3ZFAwQUsrWE9OZVZpSlVYd041SGxsbVdS?=
 =?utf-8?B?MjF4WVo3TVhPbGg2UTc5emhhRnBWaitNZmRQZEcrb0ZDSFN3TkVpUFJLd3VB?=
 =?utf-8?B?TE40UGZiaWM1U3JkVGtGbXg1ak44ckM2ZXpWOXdNSUlGNWVaWWdJMVozMkRF?=
 =?utf-8?B?WUJpbXVlT1ZSM0tVa25Lb3BMMXlVS3phZ3o5akU0bER0OGVLNnczeDJhVjB6?=
 =?utf-8?B?ZFBxY0EwMXF5QzNBOVBtTWV5T0ZZd2FEMEpjZThWeG9QbUJOQWh2cUZ2a21o?=
 =?utf-8?B?cTZab3ZnS3lJam91WEdFMDFTL1FZZFVQODNJRkc5ZUlKMDVUUWt5bTVhTTFw?=
 =?utf-8?B?a3A5T2dSWDRGam1vaDgyM1A5OXFXUGczbVRSeWRHVm9Na0VpUWh0UC9WRkxw?=
 =?utf-8?B?QllIQUxGWFRMSGFlWVdhV1p6M0VZQklRcElnWllFME1uWktGNEZGcEpsNGRm?=
 =?utf-8?B?TVBKRnJSbHF2dUM0Qittbkc0YTlTRXdvVHFHSUYwY1UvVUVIbUQrTjE5TCtR?=
 =?utf-8?B?cU5SS0lRT1RJS1RFblA4blNzNk5oK09pN2FPTmtUM0lwbGQ5YkUxT0wySGFD?=
 =?utf-8?B?OHFrTlVMQlhOSFpiL0NqZGhVNkU4S1Y4MVM3Y3FOVlIxRjdrem9uL3dqMktH?=
 =?utf-8?B?ejd3YmhWYzM2MWg3UFBXTzZxU0pFcTdnTEZySXNNT1kwUFAweXhJUGFDTFNN?=
 =?utf-8?B?WElZbWhFQXpnQk9ENjJMV0RFaG1PakE2V0J6TURnMC8rQ3VFNmN2Q0puZ3Y5?=
 =?utf-8?B?bVNjb2pjU2lScnYwcnE0MzVjMkcxT3JkV0ZhVFhuQVMwRTBrdmhSQUEzRytE?=
 =?utf-8?B?QllFeGNlTngyS1FFMUM5NlB2ckdxczg3S1ZKSjFEWFVvaXdkaG93WjQ3L21U?=
 =?utf-8?B?Q2draUlHT0ZXaHVFbFIrWFdYNWhya3oxWnYxVFNVaUs5bERKVU1VQjc5UnlK?=
 =?utf-8?B?enYxVjk2YmRpT2RhcGNSdnVockljZUp4eVBlM2M1akp6NUJvN1V6MEZDZVA0?=
 =?utf-8?B?K3dtYnp0cTFDYVhTajRYemM3VFlTcWJGY3J0dUZyd014cTFUK3hGVHYvL2U0?=
 =?utf-8?B?cFhJaGJaN2VMdGRzM0ZkZnJNRGQxUE41TDkwMlFlbytYM2gwa3hQUmN3RWtN?=
 =?utf-8?B?bTlpNDdrQzR5emZ0TGV4blFDeXI0dkROc1V0cFJuaUpzTlVjTWNVemhxYTZt?=
 =?utf-8?B?YWRqYWxZTWdZL01UZXJFQWxMQkhGQlI0bmpvb21yazk5Ym9pQ2JhOGMzUHNp?=
 =?utf-8?B?blFYb25ESGhhVFlmYm8xS3gxSmdFRTZWMjloejFjWXMxOFpaNFVqRDRWbFpo?=
 =?utf-8?B?VFpiVnU2UWRpSSs3MDdGNjVJeW9NdTZwbFVWZTAxdEkzTXN3Z2JhZTRBejg3?=
 =?utf-8?B?cEk4N2FDM015OEhOcmF0SHhqR2ZDZ0dvUUdIVkFmY1pJV3JORzE3OUdVY1gz?=
 =?utf-8?B?QWZBemVFbkRncytEdnBJUFFsK2hsbnN3OHFRR3dXbGN4N290M2RXbUFsWERD?=
 =?utf-8?Q?4d9EglsvUIVd1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MStvU2lvQUdRbm9rdG55STFsdzJzTUl6eTROTVNOMlZtd0g4UHp5eGRadGo3?=
 =?utf-8?B?eUF1RFBXbTlXWUdxR1h1bGtHVnVMUy85ZjZnamJRSmNwKzk1emkzalUvMjI5?=
 =?utf-8?B?T0pLelU2cHNFbWxsZmMxWWdrelBsYldhRExXM21vYmdJK09Vd2VtR3Q2RE1R?=
 =?utf-8?B?SHA0U2JMTTllbzNnYUM1VE5ZcTZiTlhsWlgzdk51d2ROVXhlMm5LODVtY1JO?=
 =?utf-8?B?UUlrczBiZHp2bmdFV0NJaEJOeWxLVDQ3UERxeGZQWTZ4cVZIVk4zajFsaEMz?=
 =?utf-8?B?R09ncU5kVjJqSXhoNk5vbXJxTTZ0c1lIUk9WVDBkbTkxUmN0WmZKdXhrcU5W?=
 =?utf-8?B?MXNTTVJKbm5IMzRCQTZ1d2xQajZ6YmhBTnpJREkvL0YrZmxQZEhDajlnemN1?=
 =?utf-8?B?ZzQ0L2ViQ2dUeThWbzcyeTV0R1lFV3Z2QktmbUZSNS9hZy9OZzJKcmJWVEVy?=
 =?utf-8?B?UWU3OVhUdTY0bmZ0ck9NeFhjM1RxTVNHajVmVDcxaXV4VFBFWmM5amZJcXN3?=
 =?utf-8?B?aHNkbnZCRGNCUHdMcmlTeGxLTmpMUVhGQTh1U25mMC9lWGg4RHVob2VHaFoz?=
 =?utf-8?B?eUltcHAzSG9KQkw5emFUVnEvN09NWnBNQi9jK3ZUVlFETDRzUkVvUGw4cHc2?=
 =?utf-8?B?d1RhdndJRHREdUsxaTMrdEE5ZGhFRXhqam9ERVRhNlBQVjMzRnM2dUlTRlFY?=
 =?utf-8?B?NXc0MnM3anc0L0tVeUpVc2ozYU8rTVlQcTlIM1FmeWJ5b2VwamJVUXBVV3NS?=
 =?utf-8?B?NVFad2pRVmpmb2JqcG1IOGkySkZ1ZnVNZzAwczVxSmlQUHFZWXFUZktjWks0?=
 =?utf-8?B?ZlhzMGh6dlpyWkJEeUV3NkhZQ3UxVFlJZmsxVTRtajZ3NFI4VHV1UXBJMWNt?=
 =?utf-8?B?Rm05YUdJV2NmRjZ3MlM3MDNrT1ZFdHZKRlBydmd6ejlNSmZCK21CK0RnSHc4?=
 =?utf-8?B?clhkRkNndGRTeSswMiszdm1XREQxTFhtS3ZVU3oxd1ZCcnBxeEhkYVdoNTlO?=
 =?utf-8?B?aWxtUTF5S1ZqRGtvMm9OcVI0VWVCQ2ljV2VtTTYvaGF3TnZnV24zeGhNU2pi?=
 =?utf-8?B?L0RxbExxMWdvZ1cyd2RvSzVFUHlSMU5JcXovbGowd2gyMmcyWmxSNVFEcGxC?=
 =?utf-8?B?SGdoM0FvN3BiTjFMZnNmQ0N5cDN4WHdDcDhVbkZWZllTQ01rVnBCNlVpZWNW?=
 =?utf-8?B?WG9oL0I5WnI0WXJ1T1AvZkloOXozL0wzcDZHYkNHRFFqdjI3d2ZQZFJyUEo2?=
 =?utf-8?B?L0ZvYm9SZ2NYNXdsZVBFRmF2cVU3dEJxNU5IYzNBSTY4UDd4ckFGTDZDN3Nx?=
 =?utf-8?B?UjNoWTFRZDN4ejNOemZ4b1dlVEpodldBZVQzWmVVQmNXNno5SFZkdmpTdXIv?=
 =?utf-8?B?ZU1JbjN6cHBCK0VvTStpTm9OQWN3ZXFqSWJaZlF2dE9Rb05NcGduUjM2ZTlo?=
 =?utf-8?B?SklPUmVNWThESHA3b01KUEhEcWI0WkZEZktxTVZaVGRaV3FkZmVJbUlkSldF?=
 =?utf-8?B?Q1hMWkluREJSZWtYMFZuaG41dW5yYnRjU0c4NDY3eEkzRTJaSnp6c01kUml5?=
 =?utf-8?B?Q1hBbTlsNVFMeUlqKzZPRUJjQnIxeThsZWFBYjlJSXMrRXExempzTTBOcHJ1?=
 =?utf-8?B?TUwwZ0p3TVhwanRSRlN1UTRBOU5QanJmK1ZLYUFuWTJldnBOQWhKakhIUjNF?=
 =?utf-8?B?VWdHYmVJMFppNTREYnRURXNzVm13Yks5M0J3Z092eWJnclFuQ1JaWnNKNXA0?=
 =?utf-8?B?Q1dRektvSWhDby91M3RBWUs2QUtzcFFPWU04TGxyUGx2aUlIZS9zeWNEQ2N6?=
 =?utf-8?B?UUhtVHBnM1kxOEtFRGNmT2ExbS9uZ0JpWEtDUHo4cmVpQnBueHE1bnpuQVd5?=
 =?utf-8?B?ejFZYTlvNkp4aTUreitDWTZzZ1doMEQ3d1pPamU3Nm1xUWsvRWhBd0Z5anFr?=
 =?utf-8?B?MGk4Q05ESG9hSWdjYXR6aEJTd0o2Y29KT2pOU3oyODJGOFB6bFFLbHE3Y29W?=
 =?utf-8?B?VnFlbU5hY2VvWUFUaW5sNFh4di9iK0c2M2FMTTk5UkxGejh4d2tIeG5KclZH?=
 =?utf-8?B?R0YwaHRqcXdWd1BEKzFqemFGYVgyd3FyN2oyNmE3QjNBM1IvODlORExQM0kv?=
 =?utf-8?Q?+EzI+i4CAwl7uXR82U82Y63ZO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d201eef8-1a2f-4814-5eb3-08dd5bf89555
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 15:15:37.4473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FOetjpulsilQJ9Fu9GreY6WGTBuQJwXtofP1NuZsryVsR12zE6nbsB0a1QcWbexaKIVsEy8R9lBQPZM8vgQaZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6994

Thanks very much Linus!

On 3/5/2025 2:48 AM, Linus Walleij wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Wed, Mar 5, 2025 at 12:21 AM Pratap Nirujogi <pratap.nirujogi@amd.com> wrote:
> 
>> Add pinctrl driver support for AMD SoC with isp41 hw ip block.
>>
>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> 
> OK, driver looks really good after the fixes, it's also simple, elegant
> and self-contained.
> Patch applied!
> 
> Yours,
> Linus Walleij


