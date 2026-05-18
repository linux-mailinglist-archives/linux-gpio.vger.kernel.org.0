Return-Path: <linux-gpio+bounces-37087-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDEVLw9QC2o7FQUAu9opvQ
	(envelope-from <linux-gpio+bounces-37087-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 19:44:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B6A571B96
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 19:44:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4808230183DA
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 17:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1DEF480DC6;
	Mon, 18 May 2026 17:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kNXds/k3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012060.outbound.protection.outlook.com [52.101.43.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359C73890F1;
	Mon, 18 May 2026 17:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779126282; cv=fail; b=crQ4Opcc+B4mG+DAEwdYdyJ77H6S8upC4qL763beMXyfUPA3aLYHx0lXfCIMKAhpkkBuiVrkeNKrFZ02U25/c7JU+ZbXS+bDhwqz4NsbdyI+PN2Y6t2aBOxGRxgUuGWCXurpApS0wo6t+AXoXFnTiXoErppfvXOJXv2x8+W13z4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779126282; c=relaxed/simple;
	bh=vVjGtbyOnM6TqjI0P60J4s5fMJmXU7yVby+vAaJhrUg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UWvp37mk6sSJcABSEeL27g56hIjOucRY4OSb9txB5yZhx1AX+4u814O7ss0IjxKXgAHNjcX9EP5Q98YWZSuo4JJnXetKuRtJoAvlUIIzzYj+IVGvic7MWiBXq92PnMqeeFdVFnN67oHXJsvzs0GZpjKu51EL1gfJ/eW/Nbo8Y1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kNXds/k3; arc=fail smtp.client-ip=52.101.43.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VALZyRbeSgcUGvSJlkWiwd6ETnJDS0q5NNPnVs0urN63XeZNH0VjD5Fy+1MVbZgHDVgzZQbE5Mi3NR7naMY2Z/+xNUScC6FLH+j9AdTmKGZ8NR/4EuvzrredGpHQ+iqrEIzxgsVfPEg+1uheD0GCswLvQzPffy5G+RCQD41lCo+r2EFHwlGG53Nm21JzhEqb3ieAKm5QiURkWlg/YbkxyrcttmrLH36tEdZm93WnPMoa1CbtuVTuxY/d+ZoFv1qVJS4jxfbODu30di8NilTSNNG7nVZjAUI4/Fag6NmM7rXGV3jsplhM/H1fzkCORiZqmaKTqtTxjL+4TYE2KGLQDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VoScmzkJXKns8I4yzRAbqOPSGZN9jEPlfrYiihfwFrg=;
 b=fHFwLkSFoFLS2gIbHtrlW+s4NkPNv7jullDvtNFg85LAP55CTeFmBbGWCS2EK08yn4S+ECuuKDDW7RP3M+JfdHaL8RsjbNFAzFNc9wuiOI2o9QrYoShs8Y8uPI/ps4Yi48u6c7WEmybo12/9aLYykKy9T6h4gw2J8GvXYeKoNHtMbu6p4ptpo3GkdoEqJ2/ctGQTdx/2yD3h5Y64NPFA3/gRVVS34fxatgfB4V5y7Loo8x8cGWk/7FOYRbyO8NJ78S+Zc6ukW7KtrxiSbS9NNFl0pDwHDsAuy/IrfDdrt2NDqrAS8bcjOWCFwxUGfc14qkBCb8lNVIa8TE9iWpMK3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VoScmzkJXKns8I4yzRAbqOPSGZN9jEPlfrYiihfwFrg=;
 b=kNXds/k3DKE0fJSWV8nZhiaGqyix9mRjmxIZMdEaV5zZp/+bShtAahbA44MtxlDmsm3bZke2sf8c4dRTGh3MrneYp/h1dLlRqI9rbUYsOOJ5aAfcu/FxRNoaQDxlH/CtaYANLNiXi3bSFSG3AZszQ6pGqsW2Im5JIMGUdLln+zA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DSVPR12MB999147.namprd12.prod.outlook.com (2603:10b6:8:38b::11)
 by DS2PR12MB9798.namprd12.prod.outlook.com (2603:10b6:8:2b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 17:44:38 +0000
Received: from DSVPR12MB999147.namprd12.prod.outlook.com
 ([fe80::98c5:8206:6a4:c445]) by DSVPR12MB999147.namprd12.prod.outlook.com
 ([fe80::98c5:8206:6a4:c445%3]) with mapi id 15.20.9870.023; Mon, 18 May 2026
 17:44:38 +0000
Message-ID: <f0ee2722-1e56-41b1-b70c-5503a2495853@amd.com>
Date: Mon, 18 May 2026 12:44:35 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/1] i2c: designware: fix probe ordering for AMD GPIO
 on Lenovo Yoga 7 14AGP11
Content-Language: en-US
To: Hardik Prakash <hardikprakash.official@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
 linux-gpio@vger.kernel.org, wsa@kernel.org, basavaraj.natikar@amd.com,
 linus.walleij@linaro.org
References: <20260518122814.8975-1-hardikprakash.official@gmail.com>
 <d57dd297-6be1-43a9-a38d-e40c8949e23a@amd.com>
 <CANTFpSWGC7GsAY-3UvPtBZzqjNek-T5haiDb59QYRoRgwuQf1w@mail.gmail.com>
 <7d0f0cf9-1936-4cf6-a425-228a37f83137@amd.com>
 <CAMRc=MdS_BVKb=FQLhky=8dpghBSoHeBhUk0LM5hROFxmJeyGQ@mail.gmail.com>
 <9d5da93e-bbe0-4359-9f17-e3c6b3a5cb34@amd.com>
 <CAMRc=MfT_WVMxPnYZW=mg52PHew0O4VQMGFrfo6G9vxZDDoArw@mail.gmail.com>
 <CANTFpSUX5rYhuTQH3dTTvzW+_yhW8Gs0U=A1t_8LDzKz4dzzAw@mail.gmail.com>
 <agsh652HlC4rg1_1@ashevche-desk.local>
 <CANTFpSU7XaNKwe_FPsTCkxQYeq78Tqusr-nsB-Ww0_teuiWdEA@mail.gmail.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CANTFpSU7XaNKwe_FPsTCkxQYeq78Tqusr-nsB-Ww0_teuiWdEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0115.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::24) To DSVPR12MB999147.namprd12.prod.outlook.com
 (2603:10b6:8:38b::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DSVPR12MB999147:EE_|DS2PR12MB9798:EE_
X-MS-Office365-Filtering-Correlation-Id: 04afda9a-7d11-4fb5-972e-08deb50521c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|11063799003|4143699003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ZhbHKQIIZsAf8BLFUJI3DvrHkKpTz+o8+ZxxAvJEdtc97u6NVnAdh6ymh+o8Cv0X6OdnLpvrYg1Samnet09rs5XhXXviTBpiTMKKRojIkZbHpQhLbEpC19PNhWwvt1BCzdTkRfOZJNtL8aIUp7wfJL6K1DHPwSJ/NLd7rZn+OsiUYIFXQT67eHVjwzkQPTJLOOyvc7ty4EPpLWKgTPs4TLlbHlxNo6ffR0iF0nfJRH6G8WGb4K3zIhMBxOGx9o6aONy7CysgGWFXU34sCzYOerID5Ir8lR8ZlEsS2biZ3QvfQAtfBOa4mwPAcgZUAtihs/NswrWNH/5npgatiPEsxlbWVPk/oO/glZPN4PPtI8Fe/dN44wZBwZE4Vpi8V2Du1tAbAhCuWYQDI/407O+0dcuwRqove9HpxJgBP+fbF0UJ+RfuloaRMesI+rYYDANC6ZPcMSEB/ECudx0S1c0ZLLfk1BhaokIgK21BOydPJ7vpGmfY4L9OfW0HXNvrbhz7DFoXeK4JSrIrBZt6joWtmUCMsIL/SZbDGhs8FcmfgOCSLrLKSj1W+yx+PVmlG5ioRQg40Jq0mTrSolRD3qQ3F1Drx+QJBvOqs6ZNpFSJGNUGEcZr57EdSJEo+sdG5qn/7jofeR2rQknq5+GNXmm5xuPXo4k++Jmre1E8G7deEI8db1AKDqUqkri6JwliviRa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DSVPR12MB999147.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(11063799003)(4143699003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q281Mmh6dmhjN1dpWFBnUHJtamZaMHBpcjQ3L3MwazNoMWR2MTNHbEdIQytP?=
 =?utf-8?B?ZnR1eEJUSjdnUlNnTjFybG5yVEhlRW53Y0FGaEZRcDRudkE1YldqeUVvdjFU?=
 =?utf-8?B?bnBpTXplR0VhdldwOTQrWVpIalduK21xLy9VS3M4SlJwWEZ2TVgxSzBrSU0y?=
 =?utf-8?B?cVFmcFVyakNOOUQ4ZHoyUnM4UTFKdXB3dnY1amd0d1VKZzkvRlJQMGlRWkRE?=
 =?utf-8?B?N29EbEdyNmZMV0hJcTVaUWRzZWZvL3FOdFRqc0pIZm5UTWpzelJEUGpWY001?=
 =?utf-8?B?T1pHZWdmWEI2V25ZaVYySm9uemZTV1Rrd2NNS280R0RjVVdVak1HQ3VTMGJn?=
 =?utf-8?B?VUxlQm1qZU1xMXFEYTJRR2dONFFFOURlQ2k4MVZ2UHFKS1pCUVhaRENmblNy?=
 =?utf-8?B?UUJ3SFgycWJQcDhsNmJjZTJJRTJjaVNEL00vSGpHamxXbVhCZ0QzV1U2cjRG?=
 =?utf-8?B?dC9vRzUvVFRObWZRVFhRZDVIWVMvZHd5UnpucndOU0c3S29WazlQVjM2aitC?=
 =?utf-8?B?azI0RUFxQzNHalVDc29pVE1VRUtFUWpzN21NV2MvcUV2aXQ1Uk5hK0xjZnlh?=
 =?utf-8?B?RTFHMloyRHoxTGVsMW5odXU5NHpKRkJtbUE3QTZhSW11OFh6b3pxQ2pvT1dy?=
 =?utf-8?B?Q3NHNDUybjc5d1VsdTI2bjI5T0NIZ29EVkpJdGI3dWEwSXgvSEhKeERtQlRi?=
 =?utf-8?B?bkcwZEh1ei90N0FhQkFkeVl0ZXJLRXQzWU5VNEZGRFVQQnl2QzkxZmxuMlJ5?=
 =?utf-8?B?VkpPU290cjJvVU11QmtLS09CNjVORmNIRlBuSk1NcFZmaWVrNjJlclpRWU9M?=
 =?utf-8?B?Yjk2dFdDR2wxb3p4SlVpV082Q3hsUkpwRnhQTkZtc3VoN2I4V2xBZ2ViOTh0?=
 =?utf-8?B?OURjWG1mb1JZVnZibi9IbEFIR0xKOU9KSkJUMGxva2JMWm9jYm9aRWg4b2dH?=
 =?utf-8?B?dnFVWXYyUC82Y0huZmlrR2F0RjArbGJteEZpNStadEFlL1FuYzBHSWN5bmxx?=
 =?utf-8?B?eDRSM2JjT1FTWGZ1c1dsUVZYcGFGRzlmODFIMGlUVXRLQ0JISmxKdzlJYTI2?=
 =?utf-8?B?Z1hKSEw4LzJpejlKT0RyK2JHTDNoOXM5MTkza0FSbmtFbW1jZ2d6MlFIZEox?=
 =?utf-8?B?SkhRNjM5RW1hWFVYUlRjb0hpNC9TRHlMQlZSdXhsRURjT0dNWVVVTjVWSUha?=
 =?utf-8?B?TFdkZnZrUlM3YW9RaHQyclhFSm4vc25ISXpMbi81S1RucHZyZ1RIOHEyanVv?=
 =?utf-8?B?a0ZwQ29UaFJpVHU4bkE1RWhJd1AyUFpRRGlzQVpJdnY3eGFRVzhGeFhram0y?=
 =?utf-8?B?ZzFjQ1BLSit4dW9HNHlPSVRRUjJuV3phTXhiVUpYbWgzOUZ1TE1UKzZtNTJW?=
 =?utf-8?B?UExsMERZKy9vMFpBVE93WktzbmJrYWRyRFMvazE2cFo3dDVvVzRsbkJkUlVq?=
 =?utf-8?B?NE9qT1llL2ZYZU5tSTlHTFdjYmQxdldLLzQ2VW4zRWo5QUxRSm15UE1Gd0gw?=
 =?utf-8?B?MDRlVUhySytxOW9rcUhVRjI5UUdRUWdxUHFnNHpvRERLVDhienlLZDBYYXMy?=
 =?utf-8?B?WUJhM1BwUlNtQVMveUNnV0oxVXQvTnpNcjgzZlV0WGF0enY0TmxVdHdGSStV?=
 =?utf-8?B?L3RwdEdkVk5BcklaN3BBRWcyUElqeDVZZE5Jb1NzOTgwQjgwemliYXZEK1BI?=
 =?utf-8?B?RW5jTHo3MDVtMTJaK3I2bVRsYkZxOCsyTlkrYkJYcXhWTDJCa2FBNXBCK0gz?=
 =?utf-8?B?Qlo0ZWlaZFFUUURTMzYvTjhoTlEyUXJLVDRsOEhId0tHZThVcXRodUlnVllt?=
 =?utf-8?B?UldMLzNqblQ2SGZENXFGWEZFSGl5cDZkMm5xZGFqbysweUxaMjJmSEVPYko1?=
 =?utf-8?B?bzNYZEgzWVpOQVVBWjlnaWVKaS8zcldUaEtOZi9LNTkrcmdLYmJSdFd6UlZk?=
 =?utf-8?B?Tmd6dGw0RmpUMVdBYjdITll2NWVTSzN4cCtGTWlVN1lOVDM5b21SalZMMkVZ?=
 =?utf-8?B?Q0t3MUZYUVRpQzZvRjNnTmpBZklDeEFOL2dUb211ZXNPZ29DRXU2NkVSYlNV?=
 =?utf-8?B?ZEFqSm40TDh1MzJURnhSV00xZEpkNURVVkVGdkVmRUs3TkZVNGNNWTBZR0x3?=
 =?utf-8?B?NDkza2dmcnpaQ0FIMDVEYjJ0clM4UW01di9UT1ZOM1piSjNPMHFsZW1yUGdj?=
 =?utf-8?B?NU5XbitkQnFMRmZqbjluSzNobnIvSUt5K1V5L0ZxMUdDTndHb0NCREZJOWJL?=
 =?utf-8?B?bDc2SklGR252d2xnOGtpdERPNlZXbXd4Wktnam5xK1hIN2IwNS9kcVhxdmhj?=
 =?utf-8?B?bTdoNHhERitvYVlQT3ZadnZLRmdNZFNJWGZVU3paRC9mTHNMM3lqZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04afda9a-7d11-4fb5-972e-08deb50521c4
X-MS-Exchange-CrossTenant-AuthSource: DSVPR12MB999147.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 17:44:38.0623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3iT/u7Ec6NpItycDjKZO0eBtk1zS1SBPJzl4qYSh3UgfhQ+Q2WiEaVKmgEgT+BhK9dwNXJGgrH2b5JWZsWRyNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9798
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37087-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,intel.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,amd.com:email,amd.com:mid,amd.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 53B6A571B96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/18/26 12:22, Hardik Prakash wrote:
> On Mon, May 18, 2026 at 19:57, Bartosz Golaszewski wrote:
>> If you added wait_for_device_probe() right before requesting the
>> interrupt, does it help?
> 
> I'll test this. One concern: wait_for_device_probe() waits for all
> pending probes to complete, not just pinctrl-amd. Calling it
> unconditionally in dw_i2c_plat_probe() would affect every machine
> running i2c-designware, potentially adding boot latency broadly.
> 
> Would it make sense to guard it with the same DMI check, or is the
> intention to make this unconditional?

Our general aim should be to avoid DMI checks where possible.  If you're 
finding a timing problem on your system there can very likely be a 
timing problem on another system from someone not as willing or able to 
report it.

So let's leave DMI hacks for fallback if we really can't figure this out.

In an ideal world we would have a _DEP in the ACPI entries, but I don't 
think I've ever seen that for the GPIO controller.

I'm still confused though.  Are you saying we're actually racing with 
amd_gpio_probe()?  Like the GPIO chip gets set up before the interrupt 
is ready?

There is a dynamic debug statement already in amd_gpio_probe() for when 
it finishes, maybe you can sprinkle a few more around the start of probe 
and amd_gpio_irq_enable() to confirm?

> 
> Thanks,
> Hardik
> 
> On Mon, 18 May 2026 at 19:58, Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
>>
>> On Mon, May 18, 2026 at 07:53:28PM +0530, Hardik Prakash wrote:
>>> On Mon, May 18, 2026 at 19:35, Bartosz Golaszewski wrote:
>>>> What is blocking the pinctrl driver from probing? Does it return
>>>> -EPROBE_DEFER for some reason? Pin control core is ready at
>>>> core_initcall() so it should work in theory.
>>>
>>> On Mon, May 18, 2026 at 19:16, Mario Limonciello wrote:
>>>> Please try arch_initcall instead.
>>>
>>> Tested arch_initcall + patch 1. GPIO 157 now fires at 0.255s (earlier
>>> than any previous boot), but arbitration errors still occur at 2.309s:
>>>
>>>    subsys_initcall + patch 1:   GPIO 157 at ~0.310s, arbitration errors
>>>    arch_initcall + patch 1:     GPIO 157 at ~0.255s, arbitration errors
>>>    patch 1 + patch 2 (v5):     no arbitration errors, touchscreen works
>>>
>>> The driver is not returning -EPROBE_DEFER. The problem is that
>>> amd_gpio_probe() hasn't completed by the time i2c_designware fires,
>>> even with arch_initcall. Promoting the initcall level gets the driver
>>> registered earlier, but probe itself takes time, and i2c_designware
>>> catches it mid-probe regardless of registration timing.
>>>
>>> This is why device_is_bound() works where initcall promotion does not
>>> — it waits for probe completion, not just driver registration.
>>
>> The alternative solution is to have a registered notifier for the device in
>> question. But not sure if it will be less-invasive than given solution.
>>
>>> On Mon, 18 May 2026 at 19:41, Bartosz Golaszewski <brgl@kernel.org> wrote:
>>>> On Mon, May 18, 2026 at 4:08 PM Mario Limonciello
>>>> <mario.limonciello@amd.com> wrote:
>>>>> On 5/18/26 09:05, Bartosz Golaszewski wrote:
>>>>>> On Mon, May 18, 2026 at 3:46 PM Mario Limonciello
>>>>>> <mario.limonciello@amd.com> wrote:
>>>>>>> On 5/18/26 08:40, Hardik Prakash wrote:
>>>>>>>> On Mon, May 18, 2026 at 18:17, Mario Limonciello wrote:
>>>>>>>>> I'd still like to avoid a quirk if we can.
>>>>>>>>>
>>>>>>>>> I know my proposed patch to try to probe at an earlier stage didn't
>>>>>>>>> work, but could you perhaps try pulling pinctrl-amd even earlier?
>>>>>>>>>
>>>>>>>>> Maybe fs_initcall()?
>>>>>>>>
>>>>>>>> Tested. fs_initcall + patch 1 still produces the same arbitration
>>>>>>>> errors:
>>>>>>>>
>>>>>>>>      subsys_initcall + patch 1:   arbitration errors persist
>>>>>>>>      fs_initcall + patch 1:       arbitration errors persist
>>>>>>>>      patch 1 + patch 2 (v5):     clean boot, touchscreen fully functional
>>>>>>>>
>>>>>>>> The initcall level does not appear to be the determining factor on
>>>>>>>> this hardware. i2c_designware is still probing AMDI0010:02 before
>>>>>>>> pinctrl-amd finishes regardless of how early pinctrl-amd registers.
>>>>>>>> The explicit device_is_bound() deferral in patch 2 is the only
>>>>>>>> approach that has worked.
>>>>>>>
>>>>>>> Please try arch_initcall instead.
>>>>>>
>>>>>> What is blocking the pinctrl driver from probing? Does it return
>>>>>> -EPROBE_DEFER for some reason? Pin control core is ready at
>>>>>> core_initcall() so it should work in theory.
>>>>>
>>>>> Currently it's module_platform_driver() IE device_initcall().
>>>>>
>>>>> That's why I think we "should" be able to move it a lot earlier.
>>>>
>>>> I mean with fs_initcall() change - what's blocking it now?
>>
>> --
>> With Best Regards,
>> Andy Shevchenko
>>
>>


