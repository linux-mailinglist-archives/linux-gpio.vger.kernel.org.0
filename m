Return-Path: <linux-gpio+bounces-31725-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cC/oLGpSk2nA3QEAu9opvQ
	(envelope-from <linux-gpio+bounces-31725-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 18:22:50 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA9C146AF5
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 18:22:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2236D3019067
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 17:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5112D2D9798;
	Mon, 16 Feb 2026 17:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="M7088/u4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010030.outbound.protection.outlook.com [52.101.56.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21E8248F72;
	Mon, 16 Feb 2026 17:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771262547; cv=fail; b=e+GVtOLo/TGM7MzyHX+WFs95hgdykJfyhD6zgqWFhHpo2x6k+3YcoXpk3942wKHLJ5UN+XO1LoQ4c/oeHUGjoJDbNbfu0j/Kgi1Ihv8jfhD23EQyT1yPMA3RVzx2ZwuT5D75t+wiA3ATEuRAAwa7FSHrYod2wU5Q77vnylZ5O74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771262547; c=relaxed/simple;
	bh=FhGuCH93B+ruA/2v+kcevmNOOjJxbVN3P4YzI+x6Kb8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HSwtbSdLCMRcmovy3i7yE+evM0MgG4g5QHEvHVsOFG12J9MnW5rk7D5D1Yo5JzNK49BQR9RuLiZNjlepXPJYrgX4UG0WophhqLF3ItKwz25CAeC9xgtbdmDi76FRSiKIxSS5X7qpRgTyFiA9vpmK5HmHhCGrZXxTxXg+Vvh2YWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=M7088/u4; arc=fail smtp.client-ip=52.101.56.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CCJ0doelMWlsN5c0yYpGWWPusfUGM/qAIpnBi8mTXYDxTNUZOCk1c/HF0hq1tBbtWFtND1M/y+me6T1UDWxptEuxQ/VZpnyoYMHlh04o0xOdnTdSs1h6irfc8YroOjSeCQHqgqSY1SykxJmywPOC87X+0Uw27PlTBpDcJi3uO0yAUr5wtp1so49CfIT6hziw73NvRV50ev/ppMFLviqALNCzFtUEvSA0Yi3L6ixxQ4eZ/pPzvBfvqcL1KI9ExzDH6LX2mpGM2JBswfb7eq7lUhnKs+uleQQGpJzeVTzxKpPUEFuKwfpCYRDIA9gCC2TCDQs4xzsjlGLVsJatNrSbHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hhozdtygDzCyr5nHm8bqbfWc//LuggpXllxqmw9OfYw=;
 b=kC4XJxt9YcGBdCuxKR27uuQ1VCH6LTt0i4nY2zAd1JFH1L7xH03JSGEZRlmMATi8WELpeL7msED2/YokvMBusfdUljnnrRM53J1lU/biRsr7K2jGz5Krn8WBb6RbYvQtAOpOi+eCMsRzYxqoPLPL0gdpsbpssb/nXPOab/rSp+Eh8AVoXCQW95E2i0kNDLe05yJpAIOAUJHt2iUmP7ZjBWB2CIBCYT68nGCJ466LnDG7hEs6jW1z8dYARbeorvG8IeG0J2N1KT5bOvPrYWB2Vp6LA3dVQpSHUFw8IESvuv+JIsbq7LSRlKew5YG0FVPpTpAw3SHXbp94DWtGa2bmWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hhozdtygDzCyr5nHm8bqbfWc//LuggpXllxqmw9OfYw=;
 b=M7088/u4lZuhTx7Wb47fIy9w2GHqSuNQYWUUcAknACcTe82DJVOKJ2momX1auurM5wRGxCumUfhl57KXTXn6HqspfqLVZAyrFyd5HG6iFLqRVtdsT6+u+CSW4P+SOTIu/14BO0N3I5rvinJRqpnt7Lw7ypEaERJm/O9ZY+kic3LPgj8h1hi+VZjJ7lRh5DmjNbtJYx0TgWUGmG/7ZGmBpIXYOt+UUyXqrUE6x5L+4xSD3gsenTudf4fGRd3yFh2IBEb7bO5IwcRJMp1Iv6r4j5DTZoqCkHAg+mohKqm5N4VtFGdzgBcjfkLxiDQjlhrrD2Lr8t4SqXjjPFkHnSU9hw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by PH8PR12MB6819.namprd12.prod.outlook.com (2603:10b6:510:1ca::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Mon, 16 Feb
 2026 17:22:19 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 17:22:19 +0000
Message-ID: <63919a9c-39f3-4cdd-8372-8d63929c49b4@nvidia.com>
Date: Mon, 16 Feb 2026 17:22:15 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: tegra186: Support multi-socket devices
To: Bartosz Golaszewski <brgl@kernel.org>,
 Prathamesh Shete <pshete@nvidia.com>
Cc: linusw@kernel.org, thierry.reding@gmail.com, linux-gpio@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260216045842.1206350-1-pshete@nvidia.com>
 <CAMRc=MdRL=_nRF5g4MukNjgeYGh=Bz3zN7bXEp7RPsLHHyq8xA@mail.gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <CAMRc=MdRL=_nRF5g4MukNjgeYGh=Bz3zN7bXEp7RPsLHHyq8xA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0058.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::22) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|PH8PR12MB6819:EE_
X-MS-Office365-Filtering-Correlation-Id: f7f52bb1-678a-406d-5bbb-08de6d7ff04f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SnFtSkpHY204NjNtelkyT09ZNXRtSW50c05mL2FXcy9Yamw1R3NQdktqZ25Q?=
 =?utf-8?B?ZysxQTBkTlNCbjFMZVdZM1dQWmVBQkZwTDY1WXZ4elIydmZlYkxvU3V2OTJh?=
 =?utf-8?B?eTY2MXFlVWZBT2UvaXprSHE4azRVR3lJK1BwZks0clU1UDJQZ200Uk53WUdt?=
 =?utf-8?B?enJLVm1CcG9zNTlXRGx0K25tQTdzSTBPZTBMbTlnSGJTUVZVMHZBVytWeEw5?=
 =?utf-8?B?QnJkL3JxUlJaeGtHQjc5bkR5T0R1cHB0ZnpuWXdqRXZQQWFRM0NDR01RZTB0?=
 =?utf-8?B?ZFB0ejJaSDNTVG5YUFk1OUpRbnBjMi9JRllvTUN4Vm5GenFSMXZsdFBWSzFo?=
 =?utf-8?B?UXh1WnpZdEhURzR0QWhBQkJxbkJ0dFpMMzI4bmlTcEdWZzgzRkJjY0hpNld1?=
 =?utf-8?B?aE1MaGh6UCt1WkxpaXgxNUYxVklPWUFMcC9Fdm1EeC9VYWx2bVdXcDhZMkRz?=
 =?utf-8?B?M0JUcnlKaUEyK3FmMkgvNHdOb3Eyc0tjS1MrcVpHRkRDZ3g0dGl5cDZBVGhZ?=
 =?utf-8?B?MDhqSDBrblcxU09xaXZTY0xkYnljc2dleXBNdWtmR3ViMjB6aFZEMTk2a2FX?=
 =?utf-8?B?VUd2cXJOTHg3T3F3N0lPZ3F5bEZUNjJqZ2ZIL3NTSld2SW5jdTNRNE12ZmhY?=
 =?utf-8?B?MUI1Y29ONjByd3NyWDRyYTVsazEzM2pXWm5WSWR6TlpnZWIyZk82S3Zxekdo?=
 =?utf-8?B?SHJkUktHdDlQZ0tGbFpjUEVmVndjRlI4RUxia2Y0OEdqVmhKTVlkQjg0ak1G?=
 =?utf-8?B?VjJ4RndGTU1oOWxXNE9PZXlrN05GUzRDWlBKMWtGd05mYTNSQjRDd0pjdmNK?=
 =?utf-8?B?N2JCN29RNm1UODJ6aHpZMW5aak05WE5KczJ3alhaanhkczAyUzVoR0hYeG1q?=
 =?utf-8?B?Tm9BQTZ6RmZkQmlTQ0FObStnalBLK3dSaThVT2lzZmlYNDY2K1RyQ1YvcXRT?=
 =?utf-8?B?b1MvVWRER2VwbkE5cVV5ZWpXVEp6VDg0bUM5ZDlsV21SWmFFekoxOFc0MFZs?=
 =?utf-8?B?UGczbzd2ZUROUlI3RktlVVE4dEdSbDdBUXpBL0Z5Yi9EUE43RDc2ano4RTJ4?=
 =?utf-8?B?NVhWSE53S1FMcml5eVRVdVRsMGt5MTF6V0haam90TkU1SVNHam13aEovVDlT?=
 =?utf-8?B?SURFOWhKZkQrTEk0b0dFV1U1bzNYV2hYSDZIQlV4U00xUFR0UkFFUHpBVS9J?=
 =?utf-8?B?UThkRndEMGM2aUppOUgvOUhSVWYzNm84aGM5dDUxT2FYQ0U2MnBvMUhxcjA3?=
 =?utf-8?B?VjJGTlJrNGFBZ1haRFo2ZGkxM3Y1OHBOcFhkWVB3YTMwcGtzd1l0czhwSkdV?=
 =?utf-8?B?bHMrQktlUWthdU1JZlluQ3BTQ3dON0VCSi91WkVFVWNEV2ZDb2diVy9qSmlj?=
 =?utf-8?B?SHh6S2pmUmlsT2Y3SUdENCtZaG4xb3ViSGI1cWNHbnlzcE9aMVZiWVhMYy9L?=
 =?utf-8?B?aENUbkp4alNOTDVURVI5Ui8ybW1wR0hvMWprM05UTWM5Mmw5N2NBdHU2L0JY?=
 =?utf-8?B?aXNKb1dmc1NDUEZuRlA5dm9nOFFiNHVRajdlYzFIb0lTZlZlV3hGaUxuYWcr?=
 =?utf-8?B?SVRCUXJkb1d0aVRzR3N4WDFkSm5WdlRFV0lNY1p6eFB6TTlyYWxFY3grRDY1?=
 =?utf-8?B?NW5CRmRYV2xmR3hIckJsRUI5akhIcGg5Tkx5eWxTSmpSMXJ0aWpETzF6WnhX?=
 =?utf-8?B?Zm5BOWpmRmhpL0g1Z3NYMTcvOVNiRWNuUVRDTCtSUWF3NW1EQ0s0Tno5SU5l?=
 =?utf-8?B?blFZZG1YemJRQzc4ZEdsQmRlcHZwbG11YzhOcmV3NXViMU1yNE9vZHZYSjJy?=
 =?utf-8?B?VC9vZi9KVm5NZkkyaFY4VVY1OGhXY0U5Nmh5L3NHc2IxK0w3L1Fyd2M0NEVa?=
 =?utf-8?B?UE44UG5VWU9BOVFMRTNWdHdpR0I5UVdLZmZ6YXlRRmg0eEtWNGlFYXdGcnRy?=
 =?utf-8?B?cjJ2NmxnaXRIb21ZVGxkb1NKTGRMWjJsamMxdW14L0hNWGJlRkgzL21iNXB1?=
 =?utf-8?B?R3FmdU1ycDdFOHhHWmM5YTR1d0U2SEVDSEtPL2xkRHRxOU54aCtzS1UvdHdq?=
 =?utf-8?B?ZHJQTXVxWUxDc1g0L29GYjRkQlRxWHF4akhodzNUWnl1cHJFN0NrWW5qQlRa?=
 =?utf-8?Q?RZgY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZS8zcFRMZXNlUG03ay9KNjVFbVE4K3ovRXU3TWI3TXFkYUZLYldzckVoNXV5?=
 =?utf-8?B?dUhBRUs1amNDeEsrRjFxZ2NPN1U0WllFK0I3aUpGNWFTaEJnbnVselhocC8y?=
 =?utf-8?B?VkEzZFY1MFd3Ymp0c21zam03SEhxWkRRREE3K1NRdWZHWG1oKy9xOHdrZ0hM?=
 =?utf-8?B?NWUrandGbEVrMytsblhQUnFYUVJvRDRITjRsLzNUVENRTkRxZmRtRnZpazZV?=
 =?utf-8?B?TlVPY1B2My9JWS9EVWMxcklJdHlHUkdWTFFvLzQrYmpXUkFOMnFHOGtCcFM2?=
 =?utf-8?B?TUdCNHBGTWZBcEhKV1ptU2JpMjFhRVd0QWtEN1JEQlFuT1RIVmlxUWIvUWJp?=
 =?utf-8?B?YWl0TGc3SE9SZ0xPK2NKUVdISzBxdGowZlF5bzBobFVtdy9uOG1NNzNGZFNO?=
 =?utf-8?B?R0MxcHFCTExlbUNISDFHckdJMmsvRU9qdVZQYzB1azNqaEJDRTEwNlpiam5J?=
 =?utf-8?B?YVlMZlRzTjUxTWNpaEt4VituQVNCT1NQdG1MNjZBNG1HRFJZTlhLVmZGc2NO?=
 =?utf-8?B?a0x0YTV3UHo5RUpYNFlJRW80ZVJMVHpXWUxhUG02elRzb09FdC9uVFkrbDVL?=
 =?utf-8?B?WlRLdm1ITjJEdDRpdGpQK3RwVzlvckV2allvUTN0aWRsckU2Q2cvZEFPV05Y?=
 =?utf-8?B?RGRuQWtHK0x1U0pRazlNR3p4N0IwQnZaRlBBN1E0RENwM3FNNWZjWWVxTTJr?=
 =?utf-8?B?UjBjMyt0cmxNWFdEbUFBTEIwVXprQ3poZWgvYm1wemZaS2lLeDhTd2pBYVU0?=
 =?utf-8?B?NW9PUmcyc0RuYXVBTTZNQ1JYSWQ1SExUSTNRaXB1MGV0Y2xmT2tpcnhQMTha?=
 =?utf-8?B?dlR0dUVPd29MZ2RMenZkTGlaTWh2UDNJOEJRbnpUcFNzeEsvVGYzRStLMkhZ?=
 =?utf-8?B?Y0ZmNG1yVXlDbjdINHdtQjZBb0hoTWUyY3ZEclZSR0R2RUl0blBIYjAzRndQ?=
 =?utf-8?B?bTZSc1NBaGNhcXhyNUtLQWNCRnE0Tk5jVHZpTzBzTWZCS002YlBZSU9KVlhI?=
 =?utf-8?B?Z041TGVnWXoxT25ST0o4WUhkdDJkV1VJTEFOZG9hc2h2LzloNFdnMVdFdllO?=
 =?utf-8?B?U0xjMlhoc0VWcmtEQ25tSE0xV2tTejl4SEc2dGxqa0w3cDV1cm1nU3ZwNDN2?=
 =?utf-8?B?dSticmlUOEIwazRCa0JUb3lhMURUNFRVVUNjUytNalZsQTVFNXI5bkUwVkhD?=
 =?utf-8?B?L3JPWWQ0L3hvWERLMko0emgvYkpBMk96ekxNTFdXbGF3c0RQWVE3SS9laUlj?=
 =?utf-8?B?U0l2L2x0U1g3bS85aVJaZjlNcEd1Qk5oY0g3UzJtK3liRzRrbmttUVJOS0Fk?=
 =?utf-8?B?NHBhcFBtNmdpeGo2NllXRTdEVEltMkJBRy84bUZyQU5vd2R3dllNV05XMWpv?=
 =?utf-8?B?Y3c4WWwxZFhyRU44K3NJZXNwbjM0cHZCWHBMNDQ5Q3ZyZVIydzdyZ3g4RHZV?=
 =?utf-8?B?dVdSeEJ6MEtrZ0hxYm40TkVUWFF1c21CTmVNNXcrSGMwYnhNcjBKdjYxeTZo?=
 =?utf-8?B?WXcydDViN0t2R0xYalZUVFAwL0kwa3BuTmRiM2dqcWgrRmdncHdCeDFGSDN5?=
 =?utf-8?B?cFVRcE5lckdWOUJwM2ZiT1VobFBPSjN2NjdkMEpjZnR3SzJ2S2lnVGpjNnIv?=
 =?utf-8?B?TXZKWWxpekdNQ21TUWswSDljYlBWWHFJQ0o2V1hCUUdoRVYzMTkyaytHNmxi?=
 =?utf-8?B?YjE3eC8zVUJzelUxMWt5bkR1T1dNR1FGT2g1dktXRE9iTHNXTFJaQmdzdzBJ?=
 =?utf-8?B?bjZlODVDc000NHc5SDc1czFteTlENDZyZzdPcHhRS3owK21va21naWM5UHlu?=
 =?utf-8?B?cU84Z1NjUmV5NjNNbmo3dVpYSU45cjkxY2pSbkdqdXdiSzNEa0pPYXBXY3Bj?=
 =?utf-8?B?TDB5Q1R0SUVmR1lnbWZqY1UxelFWZkR2ekJCVmZaNjVuOEx4QnVyUHovdmkz?=
 =?utf-8?B?aVJmVXVmajgzM3pLc1NUUnFFNjMyRmpLOWtQbDJVUm5TK29vK0Z5QjUyVFF3?=
 =?utf-8?B?THp1WnoyamNRSnE0WTMrTW1TZm1vbUt4OXdLM3orWDhwNEE0eW96ZlZwK3RH?=
 =?utf-8?B?V0hNNENISFkzZGJuT2M5OXJYMXlpSmtMdnFsWkZaL0x3dG0yOWJvdU1memFr?=
 =?utf-8?B?bUVuZG12b3dyd1h2SDZZWVRRYkE1UmlRZDBWWm1FSXpvZnI4NDFlUjA1YUZJ?=
 =?utf-8?B?ZWIzbG1obW42OGh1YmZJY0tOWmJVVmtRYUNzWjkyNldTa1VpR2JRQ3l2dFdm?=
 =?utf-8?B?SHByaUttRzRpZTdENmFEUXNQMFpkMVF5cW1ReU1PQnNsTVhiUEtjbUJkSXVS?=
 =?utf-8?B?VHEvdkQ5c1RoYXVzb0kvbGhES1VpOGhOaS9DQ1A2Y0dTVEo1VWdHZ1dHQ2V5?=
 =?utf-8?Q?FPyG6OP2gxqyIquVxoyNql0cXywu6MUNXg2bYG2D5yo/Y?=
X-MS-Exchange-AntiSpam-MessageData-1: PptNtt7JZs9Ezg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7f52bb1-678a-406d-5bbb-08de6d7ff04f
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 17:22:19.5460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WEYc/CD86w219nsyr8z2q7jrnmnO3P4qDR/2RuqjtAI8G/jXbFRf+8df53+HDS38Su/dgWYoy+88ZyjNPH85/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6819
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31725-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathanh@nvidia.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1CA9C146AF5
X-Rspamd-Action: no action


On 16/02/2026 11:29, Bartosz Golaszewski wrote:
> On Mon, 16 Feb 2026 05:58:42 +0100, Prathamesh Shete <pshete@nvidia.com> said:
>> On Tegra platforms, multiple SoC instances may be present with each
>> defining the same GPIO name. For such devices, this results in
>> duplicate GPIO names.
>>
>> When the device has a valid NUMA node, prepend the NUMA node ID
>> to the GPIO name prefix. The node ID identifies each socket,
>> ensuring GPIO line names remain distinct across multiple sockets.
>>
>> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
>> ---
>>   drivers/gpio/gpio-tegra186.c | 26 +++++++++++++++++---------
>>   1 file changed, 17 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
>> index 9c874f07be75..daf5aaffa28a 100644
>> --- a/drivers/gpio/gpio-tegra186.c
>> +++ b/drivers/gpio/gpio-tegra186.c
>> @@ -857,7 +857,8 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
>>   	struct device_node *np;
>>   	struct resource *res;
>>   	char **names;
>> -	int err;
>> +	char *instance = "";
>> +	int node, err;
>>
>>   	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
>>   	if (!gpio)
>> @@ -937,17 +938,21 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
>>   	if (!names)
>>   		return -ENOMEM;
>>
>> +	node = dev_to_node(&pdev->dev);
>> +	if (node >= 0) {
>> +		instance = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL, "%d-", node);
> 
> I've never noticed it before (and it's not introduced by this patch) but I
> really dislike the child device registering devres nodes with its parent...

While it looks a bit odd, the parent is initialised as ...

  gpio->gpio.parent = &pdev->dev

> 
>> +		if (!instance)
>> +			return -ENOMEM;
>> +	}
>> +
>>   	for (i = 0, offset = 0; i < gpio->soc->num_ports; i++) {
>>   		const struct tegra_gpio_port *port = &gpio->soc->ports[i];
>>   		char *name;
>>
>>   		for (j = 0; j < port->pins; j++) {
>> -			if (gpio->soc->prefix)
>> -				gpio->gpio.parent, GFP_KERNEL, "%s-P%s.%02x",
>> -						      gpio->soc->prefix, port->name, j);
>> -			else
>> -				name = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL, "P%s.%02x",
>> -						      port->name, j);
>> +			name = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL, "%s%sP%s.%02x",
>> +					      instance ?: "", gpio->soc->prefix ?: "",
> 
> instance can't be NULL here, can it? Either print it unconditionally or
> initialize it to NULL.

Probably best to drop 'instance' altogether and just ...

  if (node >= 0)
        name = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL,
                              "%d-%sP%s.%02x", node,
                              gpio->soc->prefix ?: "",
                              port->name, j);
  else
        name = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL,
                              "%sP%s.%02x",
                              gpio->soc->prefix ?: "",
                              port->name, j);

> 
>> +					      port->name, j);
>>   			if (!name)
>>   				return -ENOMEM;
>>
>> @@ -1373,6 +1378,9 @@ static const struct tegra_gpio_soc tegra256_main_soc = {
>>   	.has_vm_support = true,
>>   };
>>
>> +/* Macro to define GPIO name prefix with separator */
>> +#define TEGRA_GPIO_PREFIX(_x)	_x "-"
>> +
> 
> This doesn't look like it belongs to this patch, why are you doing it

Yes we should split this into two patches; one to simplify the prefix 
handling and one to handle the socket.

Jon

-- 
nvpublic


