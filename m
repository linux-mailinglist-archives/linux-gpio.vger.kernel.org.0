Return-Path: <linux-gpio+bounces-38301-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KKFKFOk6KmopkwMAu9opvQ
	(envelope-from <linux-gpio+bounces-38301-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 06:34:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 906D266E350
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 06:34:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=n+FkU+Ft;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38301-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38301-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5525B30A38EB
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 04:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2336349CF1;
	Thu, 11 Jun 2026 04:34:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011006.outbound.protection.outlook.com [52.101.57.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6757D283FE6;
	Thu, 11 Jun 2026 04:34:42 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781152484; cv=fail; b=VHw5qbHUsHuHymG+6edSl71vNNtXVyGCEynQxTO1fAxPjw796JkSR8phPo8TzkI3QEyfxXcrggsMpqY3RlgcaqoK/lfIc+rmp72ywO83CqtIb3pouviWn2V2oegSLM6A7F3jPOvKS9HGTISBirk4fDLK+f77iiZmGMn5H3lZYKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781152484; c=relaxed/simple;
	bh=Ju3qhDRjU3ETsn0O1vVZW2LtGsQQCaaR3AEwH8iC5YM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KTvpcBQHQIBZcM5O8ne4+sbADNWAjeRgtOBUklA9d1IvKK4KagncnWF/ZKqcmbRR2ZIJZ+110tUahA7WxfOjY4e2mP/r6YxiTHH+C8mzhzWGTlTIpQ/Q6IO9kQQRr445r8jHsxJz+sYsghEoSzmedFJll5P+xCqvMR1enoqpP3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=n+FkU+Ft; arc=fail smtp.client-ip=52.101.57.6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nSGsSPMnRSNHvwh8zWHkiIjeevuQS8OvHJa8IRbTQD9T8paVfKOEFnGa5aS2jsEk1WPmE1yE+VDSJJZ+WnRJ9HdR2yF9AE/A6/Klr5CU6Pz6o+TyYGRdNzGstngSyTuVGJcnnz4ocLnyS8j9sgd6BDFe65ZTEnzQGGC9GolVnLHzvqMrdqCXmptnUyDEAR38ANKofiMgr786o5g7wJx7fiDnLm7/pimclvCu6vqtIyUpd5P7zS+hlS0cBdipIFpSRsHhhpKMiVnC1xAaEsdixFqeIjOQqTiNR/uvmHJd1xmY3aosdSnJPUlZaM4BSdNzrPSbwwGMl6Gzd/bf/kjG9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cVCROw1sImVNnYge7zVYpzdAclPgpHmNFe0LYx/H85k=;
 b=inky6To6xTsECRCmwV0kl7uR9kxW42kg3cXfm6dA/+B+Sill1iu+k+KhOVJd6oa6G+6EJEIwpHDWJWf+0XBEzJFUzG8QBatEYp94hatMhBJgb4UqTbYOQKZXM/LX9SZnfz7L+pnzJlvegnmz4pEcsC8iU1vojnah8yp+lCIKX5lk4+SNwwhqWrPHqYKemj5wng4JTOjBtxu9xZ1xKGZd37l+RipHgtx6uby5mplAeSEGE0uxwQgOpHrjslRUodsO1vJEKc8vtd/gHdajDUN2VqO9BAdSVikCEqbwfXly1XK6xmxfikeWG8u5cReuQ/kfHvwRRzBq8jObz3ZXSXev+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVCROw1sImVNnYge7zVYpzdAclPgpHmNFe0LYx/H85k=;
 b=n+FkU+FthHwEBo5OPWd+leZ+0TDwuArwZCP20DjgsVny7uPV2ZYDC6YB7mnco/sqPvwUWODizyQKhHB6+lvya/t6LPLhp54Ur/0UiUp4Hi/aqWVL8JpAIjkYdX1V4Z5AF4WwerIQ1nzOBzETkPD4BLD4dzbcQIwcikV4TSUDeIE=
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by DM4PR12MB5745.namprd12.prod.outlook.com (2603:10b6:8:5c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.13; Thu, 11 Jun 2026 04:34:36 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%6]) with mapi id 15.21.0092.016; Thu, 11 Jun 2026
 04:34:36 +0000
Message-ID: <e098847d-fc71-440f-9572-5b3c99035c76@amd.com>
Date: Wed, 10 Jun 2026 23:34:33 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: pinctrl: amd: spurious immediate resume from S3/s2idle via
 BIOS-armed wake GPIO with no ACPI owner (Lenovo Legion Pro 5 16ARX8)
Content-Language: en-US
To: Lenart Kos <koslenart@gmail.com>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CAFdvZNt+mRTE9Q+utn=T8GzU7s_09ULhUtzTMMa9dgGCsE+r9A@mail.gmail.com>
 <c982caf3-f855-41ad-80cd-3ce9598913ab@amd.com>
 <CAFdvZNs9jNxnqqaPhDXBt555hqgTHQizV4ORPp_8xg1D=XD4TA@mail.gmail.com>
 <44bd3c12-b8d6-45c8-a7cf-12ea47716461@amd.com>
 <CAFdvZNvWSVCphSyQCVNHx7j0WApsbr0KekVsA-rVLO0eqV0X9w@mail.gmail.com>
 <ef1d3b86-f5c1-4ac5-ad09-821624044ca1@amd.com>
 <CAFdvZNvj2Gkik6de1Wtw1++S+MiVsRyyXwo7cPQ4RnDCnKYNDA@mail.gmail.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAFdvZNvj2Gkik6de1Wtw1++S+MiVsRyyXwo7cPQ4RnDCnKYNDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DSSP221CA0011.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:3d5::8)
 To PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|DM4PR12MB5745:EE_
X-MS-Office365-Filtering-Correlation-Id: 2579f2ba-c9ac-48a7-5310-08dec772be03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|13003099007|6133799003|3023799007|4143699003|5023799004|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Ngd7eoV7MqTpnUcfFwXc/w+HemWvqgVDfLVImEu85r+w+PTfDpvY36GzHQn7dRPSAVC4s/BxONlW6c+RnvpHF2FZfDdSwlWBxBDtC0Enn12ECliVI/HkRX2u6Sd38fZkCnYzYelqNYyR4REjPjg0HkddatfM2MXhjQ7CjrCPAZ8v8q5mg4DALZC9TJeQlqjdqrQepRPrCV/sp3AQXxfnms6/WG1VkMLW9GTAwdXvoSG5WZCII+f4Fx6f50SBVMo3ueDvPGA53ProwtDWJdJ9tLtII1TwTbzbdYLYUTKILjrjQ/F023aOxh3yPlQVIQwf5RUuV/52wACkzA4leyhisgm+REqfP4oCYHiF3esp02un3DEPpN8o3qCpFJsGOwPPs6e6xxiTPLXthOhOEgEY3+8rc90yc+y56LVa6L6vN1tW/LmoZ2JerFGGoKBv9K0nAlWdcdkuuH8q8IKsbUvm3pytXoKBZNwNADU7s3B1GN4MeO2XK9zbJyhmXmOwD3nImIpv0n/DVu2uZ526cOb4ob+yY4bWgH0lgaqvnZFz49mkd1oDv6JgP697SrnNG0udGSByrpRlfxCgRGs5mPDnv2lOOpq7Gvj+JqlFnLa0KotPNl0mZ1f2pgGAI5iWr0X6WGdng387LhMsAmXXn96J2GbBxTIlIHG7KeKHhnSPUdfV6RJYe0HBtgIywKFApjfF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(13003099007)(6133799003)(3023799007)(4143699003)(5023799004)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFZUQkJhMlhLOE9QQzdkODh6RWM1TG5OK09wSEpqYS9sY1dNcmFDTmx4aHlp?=
 =?utf-8?B?MDNWd0FUNE8vUVNYRlNvOThzeWU5NDhocDMvcDVPbUppSytrcFBjUnh5cXU5?=
 =?utf-8?B?b1VjVndHMkRiNGtMUnEwcmY3R3dQeCtIZk5Mdms1TUNGdW80U1JLMCtNTk1t?=
 =?utf-8?B?U29adGZuOXU3L3lTRThKRllNR0tmM3dJQVBPbUp6L2R3dXJDY0Y2eDJyYmhl?=
 =?utf-8?B?V0RUMmVlSVZQSjVLY1hQRUdwNExSdnhWQVM1U1p2SGR3OHJYK1k4bDFkY3hk?=
 =?utf-8?B?RkphOTVnMVhSM2tFblhrRWhKL2ZCai9FZUpqVUFnRGpmQWxVUUxQNkM2S0Ey?=
 =?utf-8?B?VGFLWFZxMllraVZFQ0V3WGdibFB6YzlSMlp0NG1IbWZ1UERSV3Z0dUZnK0oy?=
 =?utf-8?B?MVF3QlpmM0JNZi9jTlZPV1VKdU9uQXh3Rm80bVZaMkJ2azYwNy9lNVNkTDdE?=
 =?utf-8?B?NnVxRWtZeE8renFjalZMaW5FYURtRTNiTllRNFhQbEE5UjRYOGRzeUhJMW1D?=
 =?utf-8?B?WFo0T2o4aGpqUUkyTTQ1S1lGckozZEhZT1BlRFdaSG9BQkMveURrVjZobEt1?=
 =?utf-8?B?Y3pTeVdFRWZVRzhJcmlCNEtkMytrNk5DZmtvc1AraUlnMnBnQUw1b3J0SkZE?=
 =?utf-8?B?a1EvQ0NYeXA3S0t3dG95bXFFV1pQWWRGbklod0Fjb01DZmZZeE90ZUVvTmFs?=
 =?utf-8?B?SUwyd1ZSWnhEOHFiU3prOS8yTEZSQnp5Qm4vWExYRStPY1BZSUJ0TzdNWm9u?=
 =?utf-8?B?SUpwRk9lL2laSXp5Z1BkM25PTE9UbXV2VG5SMTdrRnM4a1VRcTZSbk42U1N0?=
 =?utf-8?B?UzJuR0w4Z01WTGpzY1EvRW1tUGVwbGpocFpaUDA0YU9YQ3FtOTVwd0RQOTVV?=
 =?utf-8?B?UEZRdVBKeVNzYmNTZUlEYkxqNjF6OWFwemh0QXQ1alkreERQQlN2RzRGMkhB?=
 =?utf-8?B?NlIzOWFSaWdFVXhOL3RJc2IzRlUyemp5T04wZkhTQWhRWHFUQlZSSThtdTVX?=
 =?utf-8?B?dnRydVFiMUhGRGVXRE8rWU52Vkc1ZldCRThUdmZ6dGp6d0xINGE0L28rZTFF?=
 =?utf-8?B?c0hNd0RBeTRrTkV5NTJHYklzUzk1dWovVzYveVRONU1QM1dWVXRQNlBQZ3pw?=
 =?utf-8?B?d01DbnJybU5NbDJham9sdE4rQkJvSDNyZExKcXZ3MWFHQW5DeUFVUEorVHhp?=
 =?utf-8?B?VHN4Um1pRlFkNFVjOFl4b1N0RlZ5VGlhdldqeUdYUlpHVzYrVEtZQVZYOE0y?=
 =?utf-8?B?cEppTW1VQi8zMGZLSUlMTlNHd0daeVJuSEl5a1RpeVFtemNnWXovVnpFZzZN?=
 =?utf-8?B?bFlzQ0YvcDF3MFdrMXFYU3AxN3J3K0M3Vk5YdWRFajYyZHFGc0xOSk14T3JK?=
 =?utf-8?B?YWs3ZXk0V3ZacGt1cHBWQlJLSmp5cm9ZeDdEOWZxakxRQ2ZZYXNVRmFaRzlj?=
 =?utf-8?B?WW56UjRVbnhZNmd0U0x1ZkRJbURXdE5oYlpjOWVKWEVBWjEwL1BCdGc3WWJZ?=
 =?utf-8?B?WTBDWFJESUJxKyswWG9iQTRUeU5aVFpyMjBJNXhFMk9FMW5DZnpVeVdiVll1?=
 =?utf-8?B?S2V1WGFRNWVLWnpIcnBZdzJWSDM5ZmY1TStTNEZJYWk4WjhGNjEzYlRuOGht?=
 =?utf-8?B?TU1vTjVCTVVnS05OdGFmcVQzQTlTU0VMMmEzTUUzb1REQW83dExlditDVlNv?=
 =?utf-8?B?UDBmNmRxN0FPb3ZNeUpISk8wSHUzTTVhTndnVE8rSEVpNUdJMGlqRllwcGcw?=
 =?utf-8?B?MmhLWGNwd0lscVlTdUVpaTB4ZG1YcDVFd09YbVNRUVYwby84OGcrVHkxcFlq?=
 =?utf-8?B?ODRWdjFaVTQ3ZS9XS1FzcFE5VFhxaFIrVGpHdUErV1BlNjhNYTdhUTJsbksv?=
 =?utf-8?B?YkhwODBSbzd1TmRHSk1CL3M5bzVPS1dQNktyY3VYeGNrQjk5REVFVVZic3Nz?=
 =?utf-8?B?Q2tLT1MxUFZJcFo3N0h2eTNzY2dwMHAxRndVNlZYSG96V0VzVlJGaHg1SXE3?=
 =?utf-8?B?dTFpM3ZkWk0wTGhhUHZtQkhXMzNENVp3YXU4NU1sOEVCaFBiWnpkdkVrTTlC?=
 =?utf-8?B?a29Rbzl5bWV0Y3N5eDB2SUtEZUw0alNGTE11dzZ4ci8zLzF6Q09rSjVTSXdX?=
 =?utf-8?B?dXJTSkNDdFJXbWJwQXp0Mkxmd2crWEZhQXFlNlVSOFpvTkYxM0tQMi93OEUw?=
 =?utf-8?B?QnRrejBXaFJ5T1lncXgxMjdwN3NncXQwbDR1WGMxdTNnaE40S2tNUGIxYVRz?=
 =?utf-8?B?Z0NCTDc3djdVM3dVMGlFb09iWDMwanZlS3M2REZadXU2UnM4SGNMMERrZ2xO?=
 =?utf-8?Q?fLwY2eEc8WgiTpV6r7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2579f2ba-c9ac-48a7-5310-08dec772be03
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 04:34:36.3768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9zAoGg15dFOVwn6iO9tpDNbwSPB6EaqejKNXfOMMtmZWrG0G/hV1jpe9N+9Q+QgwC0XPicOoyK5DulvFN1Omww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5745
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38301-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:koslenart@gmail.com,m:Basavaraj.Natikar@amd.com,m:Shyam-sundar.S-k@amd.com,m:linusw@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mario.limonciello@amd.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,fedoraproject.org:url,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 906D266E350



On 6/10/26 17:13, Lenart Kos wrote:
> While debugging with /dev/gpiochip I found out there is actually an
> acpi event attached to both #2 and #4 so the report about there being
> no _AEI resources was wrong...
> 
> The _EVT handler shows what pin 4 is:
> * Case (0x04): Notify(_SB.PCI0.GPP0.PEGP, 0x81) // "Information
> Change" -> dGPU (NVIDIA)
> * Case (0x0A): Notify(_SB.UBTC, 0x80) // USB Type-C status change
> 
> Testing with cmdline
> gpiolib_acpi.ignore_wake=AMDI0030:00@2,AMDI0030:00@4 it fixed the
> issue as well. Maybe this can be added to gpiolib_acpi_quirks or
> should this be fixed in Nvidia drivers? If you could kindly direct me
> in the correct direction since this does not look like an AMD problem
> anymore.

This should not be quirked, there is something wrong with the NVIDIA 
software stack if it's asserting this GPIO over suspend.

I would suggest you contact NVIDIA for a solution.

But you at least have a workaround now.

FWIW I do think that this debugging sequence you went through to 
determine the root cause and how to implement and discover this 
workaround is useful to add a paragraph to 
https://docs.kernel.org/arch/x86/amd-debugging.html.

If you're willing to write up a patch to the documentation, I'm happy to 
review it.

> 
> 
> On Wed, Jun 10, 2026 at 11:30 PM Mario Limonciello
> <mario.limonciello@amd.com> wrote:
>>
>> On 6/10/26 16:20, Lenart Kos wrote:
>>> I have checked all the bios settings and the closest to modifying
>>> sleep behaviour was a setting that enables opening the lid turning on
>>> the laptop which was already disabled, so no, there are no sleep
>>> settings.
>>
>> OK - then the LLM statement that this is a modern standby system sounds
>> categorically wrong.
>>
>> It sounds like this is actually a system that only support S3.
>>
>>>
>>> Regarding the HDMI port, it is connected to the Nvidia card. Only the
>>> built-in screen is connected to the AMD card with eDP. I have not
>>> reported this anywhere else yet, only here and the before mentioned
>>> forum post. If this is an Nvidia issue I can report it to them as
>>> well.
>>
>> As the behavior only happens with something connected to the HDMI port,
>> I think you should discuss this with NVIDIA before we make any quirk
>> decisions in the kernel.
>>
>> This really sounds like a driver bug to me if it's tied to that behavior.
>>
>> I personally would not be against more debugging infrastructure, but I
>> would think that /dev/gpiochipX is enough for users to debug with.
>>
>> You can work with an LLM to try to come up with a solution that uses
>> /dev/gpiochipX.
>>
>> I would certainly welcome a new section in
>> https://docs.kernel.org/arch/x86/amd-debugging.html to explain how you
>> used it if it's effective for debugging this problem.
>>
>>>
>>> The HPD theory is pure guesswork done by LLM. What I can be certain of
>>> is that disabling those specific pins
>>> (https://github.com/Lenart12/legion-nowake/blob/6b599aad7afd1431e81048273106c5526561764b/legion_nowake.c#L59-L62)
>>> did solve the problem, as to why and in what way, I would not bet on.
>>> So the statements about HPD and your questions about them are maybe in
>>> vain. What would be the best way to figure out if HPD is actually
>>> attached to those pins?
>>
>> You can add some debugging statements specifically for when those GPIOs
>> are firing interrupts.  Unplug/plug and see if/when those GPIOs change.
>>
>> Maybe they're monitor presence lines?  Maybe NVIDIA can tell you.
>>
>>>
>>> FWIW I think that it is in fact not HPD as I have checked the GPIO
>>> states when the monitor cable is connected or not and it seems to be
>>> gpio #131 not #2 or #4. I have asked Claude to expand on what it knows
>>> and what it assumes, this may be of help to you:
>>> ---
>>> What I have measured (facts):
>>> * The resume is triggered by the AMD GPIO controller:
>>> /sys/power/pm_wakeup_irq = 7 (pinctrl_amd), and the post‑resume log
>>> shows GPIO 4 is active: 0x30057c00 with the wake‑status bit latched
>>> and the S3 wake‑enable bit (bit 14) set.
>>> * In /sys/kernel/debug/gpio, pins #2 and #4 are the only pins with
>>> S0i3/S3 wake‑enable bits set and an interrupt enabled. (Pin #89 has an
>>> interrupt but no wake bits — not a wake source.)
>>> * These wake bits have no ACPI owner: decompiling the DSDT and all 16
>>> SSDTs yields zero GpioInt / GpioIo / _AEI resources. Nothing in ACPI
>>> references these pins.
>>
>> At least for AMD this is specifically more common in systems that
>> support S3 (no _AEI resources).
>>
>>> * Empirically: suspend instant‑wakes only when an external display is
>>> connected (reproduced over both HDMI and USB‑C/DP); with no display,
>>> suspend holds. In the HDMI case, pin #4 is the one that latches the
>>> wake.
>>> * Clearing the S‑state wake‑enable bits (13/14/15) on pins #2 and #4
>>> fixes it (verified across multiple suspends). Interrupt‑enable bits
>>> left intact; no other wake source touched.
>>> * GPIO #131 is the actual monitor‑presence line — its level cleanly
>>> tracks plug/unplug (active‑low: LOW when a monitor is attached, HIGH
>>> when not, confirmed across plug→unplug→replug). But #131 has no
>>> interrupt and no wake bits — it does not wake the system.
>>> * Pins #2 and #4 do not change level when the monitor is
>>> plugged/unplugged (both steady while awake).
>>>
>>> What I am inferring (not proven):
>>> * Because #4's level is steady while awake yet the wake only occurs
>>> with a display connected, my working model is that #4 transitions
>>> during the dGPU's suspend power‑down sequence, and that transition
>>> only happens when the dGPU was actively driving an external display.
>>> This is a plausible explanation of the display correlation, not a
>>> verified one.
>>> * The precise electrical function of pins #2/#4 is unknown without
>>> schematics or a scope. They are not the monitor‑presence/HPD line
>>> (that is the unarmed #131). I previously guessed "HPD"; the #131 data
>>> contradicts that, so I'm withdrawing it.
>>>
>>> Unknown: what #2/#4 physically are, and why the firmware arms them as
>>> sleep wake sources with no ACPI description.
>>>
>>> Net: a bare, firmware‑armed pinctrl-amd wake pin with no ACPI
>>> description, which no existing in‑tree mechanism can disarm
>>> (gpiolib_acpi.ignore_wake= needs an ACPI event; power/wakeup needs a
>>> device owner; /dev/mem is blocked by IO_STRICT_DEVMEM).
>>> ---
>>>
>>> I have not filed a bugzilla report yet.
>>>
>>> I hope I addressed your questions.
>>>
>>> On Wed, Jun 10, 2026 at 10:23 PM Mario Limonciello
>>> <mario.limonciello@amd.com> wrote:
>>>>
>>>>
>>>>
>>>> On 6/10/26 15:18, Lenart Kos wrote:
>>>>> Thanks for taking your time for this. To answer your questions:
>>>>>
>>>>> S3 path:
>>>>> AFAIK it was on [deep] since my system was installed and I strongly
>>>>> remember being it as so, although it is possible that I misremembered
>>>>> since I have been debugging this sleep issue since January. In any
>>>>> case I have also tried setting sleep to [s2idle] before and it did not
>>>>> fix the waking issue even if set in s2 sleep mode.
>>>>> The firmware is not modified, everything is installed from Fedora
>>>>> sources without modification.
>>>>
>>>> Can you please check in Lenovo's BIOS setup if there is a sleep mode for
>>>> this platform?  If there isn't that's fine, I want to confirm what
>>>> Lenovo actually presented before making further assumptions.
>>>>
>>>> If there is such a setting, what options does it offer?  If you change
>>>> it does the behavior change?
>>>>
>>>> Furthermore if this issue is only happening when connected to the HDMI
>>>> port, that's the one connected to NVIDIA, right?  Have you started a
>>>> conversation with them?  Assuming the HPD theory that has been presented
>>>> is correct their driver should be in control of HPD behavior.
>>>>
>>>>>
>>>>> Methodology:
>>>>> Yes you are correct about LLMs, I have thrown every bit of my
>>>>> knowledge and time that I have available for this without success and
>>>>> Claude has finally solved this after a few months being irritated by
>>>>> this. I had decided to forward most of the information I received from
>>>>> LLM in the hopes it was useful to an expert in the area, but in
>>>>> hindsight I can see this was a mistake without AI disclosure, I'm
>>>>> sorry. So for your other questions regarding why this assumption was
>>>>> made or why was something done a certain way - I don't know, but I am
>>>>> willing to assist with testing. Apologies for this mess, it's my first
>>>>> time filing a bug to the LKML.
>>>>
>>>> No worries; as long as I'm talking to a human about a problem not an
>>>> LLM, I'm fine to work with you to see what we can come up with for a
>>>> solution.
>>>>
>>>> I've got various inline comments/questions below.  Can you please
>>>> address them?
>>>>
>>>>>
>>>>> On Wed, Jun 10, 2026 at 9:59 PM Mario Limonciello
>>>>> <mario.limonciello@amd.com> wrote:
>>>>>>
>>>>>> First off -
>>>>>>
>>>>>> How did you get into an S3 path?  These systems that ship with only
>>>>>> Modern Standby / s2idle normally shouldn't be able to get into S3.
>>>>>>
>>>>>> ╰─❯ cat /sys/power/mem_sleep
>>>>>> [s2idle]
>>>>>>
>>>>>> Have you modified the firmware in some way to try to enable an
>>>>>> unvalidated path?
>>>>>>
>>>>>> I have some more questions about your methodology below because when
>>>>>> debugging a kernel issue an LLM can sometimes make WILD assumptions that
>>>>>> are totally a house of cards.
>>>>>>
>>>>>> On 6/10/26 14:32, Lenart Kos wrote:
>>>>>>> ## Summary
>>>>>>>
>>>>>>> On the Lenovo Legion Pro 5 16ARX8, suspending (S3 *or* s2idle) with an external
>>>>>>> display connected resumes the machine after ~1 second. The wake is delivered by
>>>>>>> the AMD GPIO controller (`pinctrl_amd`, IRQ 7) from GPIO pin **#4**
>>>>>>> (and pin #2 for
>>>>>>> the USB‑C/DP path), which the **BIOS has armed as an S0i3/S3 wake
>>>>>>> source directly
>>>>>>> in the FCH GPIO register**, with **no ACPI description**
>>>>>>> (`_AEI`/`GpioInt`/`_PRW`)
>>>>>>> anywhere in the DSDT or the 16 SSDTs. Because there is no ACPI owner,
>>>>>>> none of the
>>>>>>> existing override mechanisms (`gpiolib_acpi.ignore_wake=`, device
>>>>>>> `power/wakeup`)
>>>>>>> can reach it, and `IO_STRICT_DEVMEM` blocks any userspace register
>>>>>>> write. The pin
>>>>>>> is an external‑display HPD line, so the edge produced while the GPU
>>>>>>> powers down on
>>>>>>> the way into sleep immediately wakes the system.
>>>>>>>
>>>>>>> ## Affected system
>>>>>>>
>>>>>>> ```
>>>>>>> DMI sys_vendor LENOVO
>>>>>>> DMI product_name 82WM
>>>>>>> DMI product_version Legion Pro 5 16ARX8
>>>>>>> DMI board_name LNVNB161216
>>>>>>> BIOS LPCN62WW (2025-06-17) # latest available; does NOT fix this
>>>>>>> SoC AMD Ryzen 7 7745HX (Raphael), GPIO ctrl AMDI0030 @ 0xFED81500
>>>>>>> GPU NVIDIA RTX 4060 Mobile (HDMI) + AMD Raphael iGPU (USB-C DP)
>>>>>>> Kernel 6.17+ through 7.0.x (reproduced on Fedora 43/44)
>>>>>>> ```
>>>>>>>
>>>>>>> ## Symptom / evidence
>>>>>>>
>>>>>>> Failed-suspend kernel log (verbose PM):
>>>>>>> ```
>>>>>>> PM: suspend entry (deep)
>>>>>>> ...
>>>>>>> amd_gpio AMDI0030:00: ... Clearing debounce for GPIO #2 during suspend.
>>>>>>> amd_gpio AMDI0030:00: ... Clearing debounce for GPIO #4 during suspend.
>>>>>>> amd_gpio AMDI0030:00: ... Disabling GPIO #89 interrupt for suspend. #
>>>>>>> not a wake src
>>>>>>> ACPI: PM: Preparing to enter system sleep state S3
>>>>>>> Timekeeping suspended for 1.384 seconds
>>>>>>> PM: Triggering wakeup from IRQ 7 # IRQ 7 = pinctrl_amd
>>>>>>> ...
>>>>>>> GPIO 4 is active: 0x30057c00 # bit 14 (WAKE_CNTRL_S3) + bit 29 (wake latched)
>>>>>>> ```
>>>>>>> `/sys/power/pm_wakeup_irq` = `7`.
>>>>>>>
>>>>>>> `/sys/kernel/debug/gpio` (relevant rows) shows pins #2 and #4 armed for S0i3+S3
>>>>>>> wake with their interrupt enabled, while #89 has no wake bits:
>>>>>>> ```
>>>>>>> #2 😛| ↓ | edge |⏰|⏰| | | ... 0x147ae0
>>>>>>> #4 😛| b | edge |⏰|⏰| | | ... 0x57ce0 <- both-edge HPD, S0i3+S3 wake set
>>>>>>
>>>>>> How did you determine this is an HPD line?  Is that a pure guess?  Or
>>>>>> did you look at a schematic/trace etc?
>>>>>>
>>>>>>> #89 😛| ↓ | level| | | | | ... 0x151b00 <- no wake bits (red herring)
>>>>>>> ```
>>>>>>>
>>>>>>> ## Root cause
>>>>>>>
>>>>>>> 1. The external‑display HPD lines are routed to SoC GPIO #2 (USB‑C/DP) and #4
>>>>>>> (HDMI/dGPU).
>>>>>>
>>>>>> How do you know?
>>>>>>
>>>>>>> 2. The BIOS sets `WAKE_CNTRL_S0I3`/`WAKE_CNTRL_S3` (bits 13/14) on
>>>>>>> those pins in the
>>>>>>> FCH GPIO register block and **never describes them in ACPI** — decompiling the
>>>>>>> DSDT and all 16 SSDTs yields **zero** `GpioInt`/`GpioIo`/`_AEI` resources.
>>>>>>> 3. `pinctrl_amd` correctly preserves hardware-armed wake pins across
>>>>>>> suspend, so the
>>>>>>> HPD edge generated during the suspend transition wakes the system immediately.
>>>>>>>
>>>>>>> This is effectively an unvalidated firmware S3 path (the platform ships as
>>>>>>> Modern-Standby-only); but note **both** the S0i3 and S3 wake bits are set, so
>>>>>>> s2idle is affected too.
>>>>>>
>>>>>> So how did you get into S3?
>>>>>>
>>>>>>>
>>>>>>> ## Why existing mechanisms don't help
>>>>>>>
>>>>>>> - `/proc/acpi/wakeup`, PCI/ACPI `power/wakeup` — wrong layer; this is
>>>>>>> not a PCIe PME.
>>>>>>> Disabling wakeup on the GPP bridges / GPU has no effect (verified).
>>>>>>> - `gpiolib_acpi.ignore_wake=` / `ignore_interrupt=` — only match
>>>>>>> **ACPI-declared**
>>>>>>> GPIO events; this pin has no ACPI declaration, so they cannot target it.
>>>>>>> - `/dev/mem` register write — blocked by `CONFIG_IO_STRICT_DEVMEM=y`
>>>>>>> (the region is
>>>>>>> claimed by pinctrl_amd).
>>>>>>>
>>>>>>> There is currently **no way, in-tree, to disarm a bare (non-ACPI) firmware-armed
>>>>>>> pinctrl-amd wake pin.** That is the gap.
>>>>>>>
>>>>>>> ## Suggested fix (maintainers' choice)
>>>>>>>
>>>>>>> A working out-of-tree reference implementation (clears bits 13/14/15
>>>>>>> on pins #2/#4
>>>>>>> at probe and on `PM_SUSPEND_PREPARE`) is here:
>>>>>>> **https://github.com/Lenart12/legion-nowake** — please feel free to reuse.
>>>>>>
>>>>>> Why not use /dev/gpiochipX devices to change GPIOs?
>>>>>>
>>>>>>>
>>>>>>> Possible in-tree directions:
>>>>>>> 1. **DMI-matched quirk in `pinctrl-amd`** that clears the S-state
>>>>>>> wake-enable bits
>>>>>>> for the affected pins at probe (smallest change; precedent exists for AMD GPIO
>>>>>>> wake quirks).
>>>>>>> 2. **A generic override** for bare pins, e.g. a
>>>>>>> `pinctrl_amd.ignore_wake=<pin,...>`
>>>>>>> module parameter, analogous to `gpiolib_acpi.ignore_wake=` but for
>>>>>>> hardware-armed
>>>>>>> pins without ACPI events. This would help the broader class of AMD laptops that
>>>>>>> hit firmware-armed spurious wakes.
>>>>>>>
>>>>>>> ## Reproduction
>>>>>>>
>>>>>>> 1. AMD laptop where a display HPD is wired to a GPIO the BIOS arms for wake.
>>>>>>> 2. Connect an external monitor, `systemctl suspend`.
>>>>>>> 3. Observe resume after ~1s; `pm_wakeup_irq` = the `pinctrl_amd` IRQ;
>>>>>>> the offending
>>>>>>> pin shows `wake latched` in the post-resume `GPIO N is active` log.
>>>>>>
>>>>>> On the presumption that this is correct about being an HPD pin doesn't
>>>>>> this actually point at a GPU driver bug?
>>>>>>
>>>>>>>
>>>>>>> ## Public discussion / full diagnostics
>>>>>>>
>>>>>>> Fedora Discussion (complete diagnostic walkthrough, ACPI dumps, gpio table):
>>>>>>> https://discussion.fedoraproject.org/t/immediate-wake-from-s3-sleep-when-hdmi-is-connected-irq-7-pinctrl-amd
>>>>>>>
>>>>>>> ## Attachments to include when filing
>>>>>>>
>>>>>>> - `acpidump` output (or note: DSDT + all SSDTs contain no GpioInt/_AEI).
>>>>>>> - Full verbose-PM `dmesg` of one failed suspend (`pm_debug_messages=1`).
>>>>>>> - `sudo cat /sys/kernel/debug/gpio`.
>>>>>>> - `cat /sys/class/dmi/id/{sys_vendor,product_name,product_version,board_name,bios_version}`.
>>>>>>
>>>>>> Where is the kernel bugzilla that you attached all these artifacts?
>>>>>>
>>>>>
>>>>>
>>>>
>>>
>>>
>>
> 
> 


