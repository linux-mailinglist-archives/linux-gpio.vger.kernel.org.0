Return-Path: <linux-gpio+bounces-38078-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WKHwAXuCJmryXgIAu9opvQ
	(envelope-from <linux-gpio+bounces-38078-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 10:51:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09ACB654378
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 10:51:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=windriver.com header.s=PPS06212021 header.b=CxhRldhS;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38078-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38078-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=windriver.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 37A573043D73
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 08:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C1FA3B4E81;
	Mon,  8 Jun 2026 08:38:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058232E739A;
	Mon,  8 Jun 2026 08:38:15 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780907902; cv=fail; b=bX17ETe7t31o2xM9SjKzht4u57qDoq+SjqlyvuuvBCrM0MjWdw0XS3DNCDzWr0NmlzJZh40WGc6fI5BtW4GA/BeKaydPmMwGxdyyROubvj8g/V6cp4FMkWfpWZHX1/dTg5KhRo9N3Cdi//V4EEjLJ+UQ10S9WkWpMx6CJNWGXhE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780907902; c=relaxed/simple;
	bh=gSG/AS4chRy+feHMj6fxzJRMnlFcZAg0QPeYbGfxofo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gQkG24VmYy0+Mro4NA0QkLRs7pCPumpnWatpoxRIw49uO/RNCr/O5fMzVVLrgbd3w9NPo3ZM4dl0xEP/buZH/QMgvkC3wyoM+7iQDIFEsnpLhX4FSoOisFmoVgSOagYiN0E2Ogzd28pxFs9En4F6dUEXvOEJktPP5R0v/OsOWDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=CxhRldhS; arc=fail smtp.client-ip=205.220.178.238
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586TxFX3824010;
	Mon, 8 Jun 2026 08:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=K8uOW1K6YZsJ/LYlj+xKqtXx1XMNQxOErEIerpJyS14=; b=
	CxhRldhSAeI+eOI1fnbt0dN0EGb/Hoa3TrGTIIy/Klsby1bdDapD2tdfoeOtpzFv
	5J6OUef7Ayu8f+NtG2bJkHnP9opI89+G/I0MB+V7XmL7Tod7YwkheCiSCSyoWtJi
	TEuIoWK3LThApkzXh3pwEcbv0JiYDVGmpVO0WpdqMqELl8FOyiv5bMpzmV/zlMNX
	KEC8lFOFetmctHsyMScEjP0/Y/UN9P6W8yYOvUvNfb+ieeYs/WhwNFsGHCErQYdj
	EdqYsK+IDbPiGY7j3kjGPIvG4LUR6xkEWFy7UcPgmNw/TwEtF/dRIi8d/zVROC2+
	qRRtdw5bcVbcMtn6c9atAw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011024.outbound.protection.outlook.com [40.107.208.24])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4em8rxjh9h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 08 Jun 2026 08:37:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JqoOUPDDVYbCyYAvyUaFLUQUpN5Q6X2l76re6iCUZxUtdsP7uorBRXh9CkTCY/NY93TsJAkSNf9LeIYfG++KuGsy3fg8oWB2OMdYwOMeEO/LsP+/JgVo9spB4/THzT1m+WoC4D+tr0+36zO9T8+6RU9UzaIZO9Q+tFiQM95x9qg+F844MEbP0zziJflBLJ5/38PQH49hGfm//vM7kozY6Df/4AbRVZ7muPagIMRBqI9B3bdYXOcxaSYMBc/b1qNhhpwRQSXTOoDTwJr6ABH2GsUXPhd+7jV5xExahvq4xT3LVLOsotMn/lBTiF/OjvtEUnRMgrQnDg1fR9mwwhOPkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K8uOW1K6YZsJ/LYlj+xKqtXx1XMNQxOErEIerpJyS14=;
 b=Tr4G8s4IzMebm5rDIpRZWdsk4/3dqELtpeVEGeBnmDIqPI+mRD6UrgNw1baB0t+hTxShWkFIN5FElJF3p91J8JoTrNW5vwlkm93iPJmhjphKctEcvhTiUfvwqbTHaJ7YJ9PiEUW79Ua95Do77w61NFWl36ypLOnQoaGJ5IEFfH9Hatf+95BeizxE+5N16XynHtQdfLtLrv4Upl+1LDwOY7GnTMxjFWhxBDebwMfhmFKdaYQBwT3/HcXr8qtpAi1CBl5z5Oy4U3zQlfkwN3BuKK4ivzH0rRZKLAFnmbgN71Sgf67u8bFYa44ViQGNF+P6Wzhy51GWpy0LwByMupaR5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB5332.namprd11.prod.outlook.com (2603:10b6:610:bf::17)
 by SJ5PPF3D06B1BFF.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::822) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 08:37:56 +0000
Received: from CH0PR11MB5332.namprd11.prod.outlook.com
 ([fe80::8f86:8d08:45bf:ec13]) by CH0PR11MB5332.namprd11.prod.outlook.com
 ([fe80::8f86:8d08:45bf:ec13%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 08:37:56 +0000
Message-ID: <2a155eb4-315b-48c4-8889-7da854421fa2@windriver.com>
Date: Mon, 8 Jun 2026 16:37:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: mvebu: fix NULL pointer dereference in
 suspend/resume
To: Baruch Siach <baruch@tkos.co.il>
Cc: linusw@kernel.org, brgl@kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>
References: <20260608075742.2680700-1-yun.zhou@windriver.com>
 <87ik7t8mko.fsf@tarshish>
Content-Language: en-US
From: "Zhou, Yun" <yun.zhou@windriver.com>
In-Reply-To: <87ik7t8mko.fsf@tarshish>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SEWP216CA0107.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bb::12) To BL1PR11MB5333.namprd11.prod.outlook.com
 (2603:10b6:208:309::23)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5332:EE_|SJ5PPF3D06B1BFF:EE_
X-MS-Office365-Filtering-Correlation-Id: d2b36bd8-1289-4eb4-b865-08dec5393c8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|6133799003|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	VlgekP/k370UG6Z/LpqcL6ZA1G77uGVj8shiXSENlSAj0TrLKkW2zhjLtLAp4AT5de0xwU0EfsAQE9D7c2rpIk3pvllx2h2cf3CXVYZ3YsOdzuEDnt7KxmhXSr+Y8UKw0aW2jsrn2i92RXGKaLVnf2GBCnSgXKjYsiSHSnfXpv+Kw263p0EYyhFjsJexUuUN9Xth5m+rAhCG12owMjVhFft/KbRko2Q7HNeLqusdqZY2eozFUwQspn2+qmxN+aeAQNuvLRL3uvUjTAYJHr50JYjsc0iymvCtCIePXQweICfuv/Zdm5jrBMdy61XbCB6x1KOUlVcNRxHxx9GqcyyUZgJydswDnKnX08bCNXZBl1HrAikIq+joNBXcF87vPK+aw46u2Avti7x3H41DmiBcbMzVlXrtebCv9Byt/PhaNDofOQIEnpp7NVvDGRTAonyduoNxfKRXZ3WTLEbTSnIvxPL/SkJzK7IWPa6BZAmavLN7ITw8pyoeAgquWoGoqJ3awb4QkqY/GUfti7SVl6aFdGwqaGNyNgQ3RdrL9mf0r1DvOUeEpKAsQwJaMyO4xc336PKsWfrqH93qS16n9gUqHC0FKg4cbO624YN2OPjdR+mUo9Xm1ZfPLay6Zhg9A0NBujv8hixT42K2lk0B0pB0hZopGm/icQaKE0OEczM9mDLtHDMfl8AjuMsG4SNm12pc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5332.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mk9XSWU4MUdIVEtkUVRablhaY0tRQUx6aHJaYTVMWGIrNEVtclhrQXA2ZXBQ?=
 =?utf-8?B?bkZNRWY0cSsxSnkyQWJsaU5leHlzZFN2dFd2Tm9uMmVYVU9PWWJGcFNKUTdQ?=
 =?utf-8?B?U1BtQW1RWk5PN3hNUityTVZOeC9TMDdqdmE1eEp5Z3lHUlhyUW9xNnk5c1pU?=
 =?utf-8?B?R2t2cTFkUDAwUmxPYS9NZFNTdjhwOE1yUHl0eGx5NWlhVkJoZ2lTTzIxcEMz?=
 =?utf-8?B?N2lIemtWYjBXMjlkWktwYlFhYUM1ZTI0enZQUzAzK3pRekxTeGhDb3R0UjZK?=
 =?utf-8?B?Y253OFhYVUVXZlJWbm1Nb3hwTmtJOXcrdWpYK2ZRRUYvdXQydU40cERvQXVk?=
 =?utf-8?B?cmVlWkFwVDdEdVBzS0xBMVQwODc3WVh6VWVlbVMzb25aQ1pxdmhiRkpsUkNW?=
 =?utf-8?B?QzBBTE1lWnVpalM5V1dicnRBOTYyM1NmdlNyRVpHMVZOWG5STWNQUm52aGdE?=
 =?utf-8?B?Y2RBY3BxLzVYbmoyM3AzLzRyMHMybDdHdnVBRCtmQkJsT2N3U1BCTERRRWV4?=
 =?utf-8?B?Z2QwNm1BN3NpYlhJM1c1dHY3azFwQkoxMW53c0NrMGV3SG92RHhRSHlKRTcw?=
 =?utf-8?B?UHk1WWFpVDhWMDNXVkgzNlovVm5BeHdSMUIzMnphVG80SHlvZTMxa3dxd0RS?=
 =?utf-8?B?QkFhRklRMkJwRWxhajVobDdjMVdWbnJzWUxCU2pUOUlWVmtlcUFudGZSSWt4?=
 =?utf-8?B?NjB4eVdiT1cwWnEvSjZVbTlEVENCMUF1M3pUZHRLYVB3WSs5Rlo0NlpNNkxz?=
 =?utf-8?B?MSsyODBkVWo2MDRrVUR6RkZBa25ISEdRYlJtZFcvbmxJM0FidzdBaDRsd21N?=
 =?utf-8?B?N01PMSthTFhQWEF5cXA4VmZiRk1JNjc5eHhzcERZL3g0T2RoVHlzeDJYSlYw?=
 =?utf-8?B?R2pGVlRtNkZTMkdjNjRNdys0c3Ezd2xqZFlrUWozN25na2dVM0cvWkpTRSty?=
 =?utf-8?B?alVMWE9KdnRFYTZNd0NnOWdBU1VsaVBQK1duRUczaGhvNFU1ckZmcVRvdGNS?=
 =?utf-8?B?Zndtb1MzY3MweEZXbmQxV1hlRGFqR2dpZlczZFZndm1YNi9PUjQ1VS9VQksx?=
 =?utf-8?B?c0NWTms5N1J3SEoraXd2SGtISytmcGRncjc3VTMya3BleDdsU1AxWGJRWnpW?=
 =?utf-8?B?QzZiajU2SDRLd2JlQkhPc283L3JkLytGTTk4WG4yaHlSN0ZRem8vNTR0T3Bz?=
 =?utf-8?B?T0tLaVZXQThodTNIcHJLb2xwb0xLVkJIWE9ZdndMbDdxc0JsWVdJWjlqeUlr?=
 =?utf-8?B?anBJb1ViRVZjakIxVzZlNStaWTkveXFOLzhLdk90c1VvLzhxYS9FejExTno0?=
 =?utf-8?B?Ylp6NU9HTEhlUmtLbmd2RVozVEFpaHk1SHNQck12RnFQS2J3eDNKSGs1cjdo?=
 =?utf-8?B?UndqSzZSczNnNytvTjc2N1ZrSzJCdmRia3NzcSs4UnRaVHBzNG5KQ3owbHgy?=
 =?utf-8?B?MWdhbFkzYmxFem91bFN0ZFNPUmJRb21xNkpIRDgvRkNHYnFmbFZ3Y1Z3ZXI0?=
 =?utf-8?B?WFZLU3pYOWVnZW1oMDA1eXphK3RJMnRFS3RCZUZTWWducjlOMEpRTnNNZDI4?=
 =?utf-8?B?UTRxQnNjVHlzTlVKVHdGR095ZlYvUVYyV1hDbmhETW16aXZWTGF1MFk4L0p1?=
 =?utf-8?B?ekE3c2x3c2REZmgrNzBzUkhQVkxDSFpsL2hqSlk5WHg5ZG4vUkorZHU2SnBl?=
 =?utf-8?B?MThjS3hsUVVhbkVSOXFSdlpPUko3WmJDRlhtdWRwbmVqQkJSckpFVmZCSDFU?=
 =?utf-8?B?blBKNzA3dUFxdWNOOW5iZjBJbURidi85eTZWM2t6dHlQdUVPck5xZ3ZGNkpD?=
 =?utf-8?B?ZU5qK2RyeXZnNGtyRGlYTUpFak1RQ015U0VWLzRyR0dLakNkcGhHY3JseXFM?=
 =?utf-8?B?Q2tlUmdDZ0JDYkhPNk1BVC9NOUlyZDRhTTU0aWErUUVMcHFYTS9DWXVCR2R0?=
 =?utf-8?B?aHBWZjNNaDcvUFZvZjRPeWpOdWJOaStOMnhXOW1EVG1JMCtMK3hYZThlaXor?=
 =?utf-8?B?QlhhWDRPY0Ntb0duZTJHcnJaS0wwSGJ4Y3ArM2ZoS2llenRtMlNlY0hYU2hS?=
 =?utf-8?B?YXliQ2trR2wwZENUdzJIODZqQXBaSXlURkhacmUza2RYUEJQaXdmak5ZM2Vj?=
 =?utf-8?B?SURRT2pFY1cwOG9nNytjZmpLTWRjQnhPWmIyZE9HU0FSU2pmQVFkTHJ2eHlx?=
 =?utf-8?B?VGwzYk11cnlnUXY1V2xld1ptQWFYUUJYb2s0TGhYaURQVU9NTzZxdmlucjJH?=
 =?utf-8?B?djZqTDZ0TncwRWJrQktZQTVQWnJZTGgyYjFPMzJDN3dwdkdQZFR6WkNOTFE1?=
 =?utf-8?B?REY4dXdMakR1S09kdHlyckhuemJTSEhpV1huZjhsTnJ1VFhsS29yQT09?=
X-Exchange-RoutingPolicyChecked:
	o1y4UTWACacwMeGVS5M4S67Y28Rw+Ymke6K08x0l24oJssOXWHf/GQosKHKdzBnTVqw6D1CH5Cb1jFMADZ25ziHuOwxCAfxBQXJvBtOfxNXCiOSM1D0L5C/y5TjsncradklmthybAy0tUSPlxK1/C9epiKUY4GohRL1CqbXDs7K/XPqQVIGBR8OXRggSG7fS1cdYnDxTVOk2eij4d+HY4Es2NAGEP6dsBa6P6poxy8arFcuUYfhuoMZn8/yGdFmx5rvJfAUGkgUZHEIimZ97fbXptbz1f4F9ilIigT0Qt5UHBZkO+bGuwixvgf9lCX2P7+S0mQnhgIkO4t21YoNJtQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2b36bd8-1289-4eb4-b865-08dec5393c8c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5333.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 08:37:55.9977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5zdOFZbwnCo6oRUkYDHykFqyoBiUTlLx7YmNVAFnTn+tm3SVDCx8xqfj8cxgJ8OBucMuMEDTTJ3IQoJRpGjESA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF3D06B1BFF
X-Proofpoint-ORIG-GUID: mNPWz4xO8PsKEbOUyQcrxu0jyUe0qFDc
X-Authority-Analysis: v=2.4 cv=FP8rAeos c=1 sm=1 tr=0 ts=6a267f67 cx=c_pps
 a=DvLgf67dpzRpeCMgcWG2JQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=EW6Ic0heITPoz4DqQccA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: mNPWz4xO8PsKEbOUyQcrxu0jyUe0qFDc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA3OSBTYWx0ZWRfX3TatycSbI/H/
 0ADqcxRqkC/WBNUgxDRxIXHLgzoYFduqPs8DxjZeRP2RnWITqBRapfKDowwlwn/Zy84yLZtj6Zf
 bHEoAEU2hvi4h+1vJYPF2dKxjWdD/+q2ja7DQ42v8yhDA6rnRWuRAR2nWvKQP5M185sm6dZgEAU
 Tfu7ADRnOPNK2F5MBuMK8A0e8liobd5DHtJv6U7ahOIJO1H7dU7fE3xu1O5F5hOQTqZeq4ppuuk
 W3X1E5nXQAU4eV5V/De3qVtipr+tq96KVQAyIZ329OWcNTkiJ+hdv1+8hfWLhY3p4vIZN8nlWnH
 dHfsci7KFdb5cyNdUBWakeM/VhlPBiHFDznyw4G1YF0zeT6HdNz2xBRS4ttCU4SiGsxpsZPJN0I
 O5IOOe5Gq0oQSnxcCD/WxI3oK8TvlUUUmBbmlfgsjvfSzseu5Han6q0JRHZomrA+ayPTiQS9ZoB
 63kE8DCmKMxW+7x6Vlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1011
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080079
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38078-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:baruch@tkos.co.il,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[yun.zhou@windriver.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yun.zhou@windriver.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 09ACB654378



On 6/8/26 16:26, Baruch Siach wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Hi Yun Zhou,
>
> On Mon, Jun 08 2026, Yun Zhou wrote:
>> mvebu_pwm_suspend() and mvebu_pwm_resume() are called for all GPIO
>> banks during suspend/resume, but not all banks have PWM functionality.
>> GPIO banks without PWM have mvchip->mvpwm set to NULL.
>>
>> Calling mvebu_pwm_suspend() with mvpwm == NULL causes a NULL pointer
>> dereference when it tries to access mvpwm->blink_select.
>>
>>    Unable to handle kernel NULL pointer dereference at virtual address 00000020 when write
>>    [00000020] *pgd=00000000
>>    Internal error: Oops: 815 [#1] PREEMPT ARM
>>    Modules linked in:
>>    CPU: 0 UID: 0 PID: 406 Comm: sh Not tainted 6.12.74-rt12-yocto-standard-g4e96f98fb7db-dirty #353
>>    Hardware name: Marvell Armada 370/XP (Device Tree)
>>    PC is at regmap_mmio_read+0x38/0x54
>>    LR is at regmap_mmio_read+0x38/0x54
>>    pc : [<c05fd2ac>]    lr : [<c05fd2ac>]    psr: 200f0013
>>    sp : f0c11d10  ip : 00000000  fp : c100d2f0
>>    r10: c14fb854  r9 : 00000000  r8 : 00000000
>>    r7 : c1799c00  r6 : 00000020  r5 : 00000020  r4 : c179c7c0
>>    r3 : f0a231a0  r2 : 00000020  r1 : 00000020  r0 : 00000000
>>    Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
>>    Control: 10c5387d  Table: 135ec059  DAC: 00000051
>>    Call trace:
>>     regmap_mmio_read from _regmap_bus_reg_read+0x78/0xac
>>     _regmap_bus_reg_read from _regmap_read+0x60/0x154
>>     _regmap_read from regmap_read+0x3c/0x60
>>     regmap_read from mvebu_gpio_suspend+0xa4/0x14c
>>     mvebu_gpio_suspend from dpm_run_callback+0x54/0x180
>>     dpm_run_callback from device_suspend+0x124/0x630
>>     device_suspend from dpm_suspend+0x124/0x270
>>     dpm_suspend from dpm_suspend_start+0x64/0x6c
>>     dpm_suspend_start from suspend_devices_and_enter+0x140/0x8e8
>>     suspend_devices_and_enter from pm_suspend+0x2fc/0x308
>>     pm_suspend from state_store+0x6c/0xc8
>>     state_store from kernfs_fop_write_iter+0x10c/0x1f8
>>     kernfs_fop_write_iter from vfs_write+0x270/0x468
>>     vfs_write from ksys_write+0x70/0xf0
>>     ksys_write from ret_fast_syscall+0x0/0x54
>>
>> Add a NULL check for mvchip->mvpwm before calling the PWM
>> suspend/resume functions.
>>
>> Fixes: 85b7d8abfec7 ("gpio: mvebu: add pwm support for Armada 370/XP/38x")
> Commit summary for 85b7d8abfec7 is "gpio: mvebu: add pwm support for
> Armada 8K/7K". I could not find a commit matching the summary line above
> in upstream git. Commit 757642f9a584e ("gpio: mvebu: Add limited PWM
> support") introduced mvebu_pwm_suspend() and mvebu_pwm_resume(). I think
> that is the one being fixed.
>
> baruch
>
You are right. I will fix it in v2.

Thanks,
Yun

