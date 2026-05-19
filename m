Return-Path: <linux-gpio+bounces-37156-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGovLA51DGqihwUAu9opvQ
	(envelope-from <linux-gpio+bounces-37156-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 16:34:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1215E580A28
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 16:34:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4990B30F0E39
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 14:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C336480DFC;
	Tue, 19 May 2026 14:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FReCyd6c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012036.outbound.protection.outlook.com [40.93.195.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205594968E1;
	Tue, 19 May 2026 14:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779200898; cv=fail; b=ba3Vm++3FM2XbsJqZLXICf9hM/yuCAj3if25wPeBKuPU4jRAZi6UWjb4izUU9eI69B1MSInxVA+4lIEskB1dtxBXfgtsdAEdZ9D6meeJ4Qk9iLS/ZH6IXenZBkn4luSj9DobBrUcU3MBf/I+fITLisM2IGcNkomfjA/bQpFeN+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779200898; c=relaxed/simple;
	bh=RvddpjQto72YLBNreFg3st/pm1D++xJ1l5qYbWMZFEo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=J0FyR1MDhQSGttlNqq/Sx7fqsqqFrQ1n0CvdO1I54zhrPRYLVRJzYxqSPFIc9zC6OV4SUpfJu39bNztJytWtA3tw/ccH9OyCAIaNv96zDPGdDZjda8/ZAlizlk6/Mc7V6ZnmNTGU3+x0qK+QVyS2X2zYkHO91hzda1gOb3AlGpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FReCyd6c; arc=fail smtp.client-ip=40.93.195.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jlREwxpV4BMmxWvkEmSqY+A7tkACoLsJMMjgNLXk4ksREtTPPMzXdb4HzzsHscrggOHQmuT0Nd2T4gJxlZ9qxUUS0lRPnEKkK81CecN/wvRidT8mI29YfFZUe7Vg4thQ84hd0SI2eSPewuhkjYOFWQ3XtxmxO4JFQJ7ZJIl5LTznQI6wrcnktnJIj1GrMhUCC6jlwTxZi+vLRSzY9nfskqHp3fISM5qk4Ls2Xwf61pwgw8GI0QGqRkBd9ICbVRwk+2/9Nr/XQRWFE1vxT1PhsH62WzN4n7aj2G8nAe88qhef/0pkaoYakDd39vEq+f5EOTQLruQJbb1Nv+vA5s414g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cqr5TvD3/u1lBFLIrayWM54KaIdn+Lc3mhl2zDtdE9Q=;
 b=J3GMRkP3qjw+Jdtok2j1h8rXB14X9YcbVCifvLMlkXufN5N8fvc2n/6tZiV1vfH4AJG8hCIM8u/CplZr8aseJpVy1stc8azIrlnwRwf2Avv2IXF5j44M42oiEyn8sZbmNwAfwT8DqKou2OUa1pyEQRQos6COxTzhDoZ95ktuvDY18RI+sN+19xx/q02bXFT4jiPb817ueb4Z/281Bw2sTGgE6wZDuDCGcy5e7PF0T/6fw5sX0RVfc4B1ykNMtU2xsHgPlvyVDcqIgpQvDveLOHeUObZK/01cjPzYiYY/sZLE5XjRMmWqwFd5i8YsZSPi5JK3vgWMzVdVAkwFx8/Nhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cqr5TvD3/u1lBFLIrayWM54KaIdn+Lc3mhl2zDtdE9Q=;
 b=FReCyd6cOaqUwprMQPZLiAwuJuHkiWVSq0oqvF4V9PVrGQtm0Ai5drU/AfjW0IV5w9kGAlR7hfMywICm4t2Na2GpDoysHoK/1iSHmtae0dRuQYoSpdqbZqompkGa2uoeg8ASvPoOhArSMi3GEWCPq6XzTxFYktflFeWULFA2OTE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DSVPR12MB999147.namprd12.prod.outlook.com (2603:10b6:8:38b::11)
 by PH7PR12MB7968.namprd12.prod.outlook.com (2603:10b6:510:272::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 14:28:11 +0000
Received: from DSVPR12MB999147.namprd12.prod.outlook.com
 ([fe80::98c5:8206:6a4:c445]) by DSVPR12MB999147.namprd12.prod.outlook.com
 ([fe80::98c5:8206:6a4:c445%3]) with mapi id 15.20.9870.023; Tue, 19 May 2026
 14:28:11 +0000
Message-ID: <c4993bce-5d39-416f-90ed-d870f4ac9254@amd.com>
Date: Tue, 19 May 2026 09:28:08 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/1] i2c: designware: fix probe ordering for AMD GPIO
 on Lenovo Yoga 7 14AGP11
To: Hardik Prakash <hardikprakash.official@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
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
 <f0ee2722-1e56-41b1-b70c-5503a2495853@amd.com>
 <CANTFpSWT+cR8Yxyr5jrB2MUidqKteWuPjHOyK_rpSkDUN6SWQQ@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CANTFpSWT+cR8Yxyr5jrB2MUidqKteWuPjHOyK_rpSkDUN6SWQQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0046.namprd11.prod.outlook.com
 (2603:10b6:806:d0::21) To DSVPR12MB999147.namprd12.prod.outlook.com
 (2603:10b6:8:38b::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DSVPR12MB999147:EE_|PH7PR12MB7968:EE_
X-MS-Office365-Filtering-Correlation-Id: d99072e1-aa2c-4101-47f9-08deb5b2da9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|11063799006|18002099003|22082099003|56012099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	xxQOdkDQRx8N4HEUrEMDZavQt882UhMm1dvOV71y0TTqbqdGpccc19I3MwP6TQqLawXlfe4WCE/GwxzfGCUS1smPOBQuErzqbiqRPrJAcjX6dotxFsHUMObF8v+R+/OACfBc713bFK3/uHMYgeuJkJE0jRCX9MDZOp5IpJ9lCozTWLs92IwfifRmos8k6B0oZJtV8pm+PuJmiXXc04gZxM0KAVz+lbavmVq3A3bPd6K4K43k5e5l384fyfY6Fapye/70WHTZTyiATMU7dRGV8bybGcs6qAgtgoVAz4cxZsQ355d4S0Swax9tJnkkCifj1nrxr9akoxEeZNoPSz1v0haFI2I3o0aGOm0qi/2kv6tPAUF7Nuovpv+zsTlBxzT2hF00SEeJRUNN7jFckusx6gK2jP0JefSH/WRx6R8cMOcljs72nQc+i27WVNqLGesreLWkGiHyjXHNiKPiieXPlv2s14VYOGCnEaDvf96GODuvVf6Lf73SNLpP9puvb00QORxzIlpa1hDXw/8aPMnJ+XENMo6RZJTD3PG3ldepgGUHg3B9k32/VE24/4tHxMiY6m+px3mKEC1qcdrNJdcy3lqxkwgDOiGbwrAGZY6pLl1uWAW0VzGiWKD1Ps1gTslFhElpPhyGQBT3Q+RPwSoqHIbBAVeWUXgacYYbQYxD+7u0FC7LWGmXpnBZA7nWHbwk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DSVPR12MB999147.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(11063799006)(18002099003)(22082099003)(56012099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGd5b2JaT3I4MFpXTTRXalJTT3RSQjFQS2NBUGdRbHpjeUh6ZG9wTEtBRFZD?=
 =?utf-8?B?R3FBTXZqS0Qra1lxU1ZpY0JPQXVkRHFkd0EzREppTVNVZVQ3aEpWR3hoQU8w?=
 =?utf-8?B?SDMwVXJDdTd3aE5WeWczNkFMbFF0SytrZTVlTDhJUklyZVl3cWJEd1NmRFFy?=
 =?utf-8?B?czhCR1U4eXFvZzRnUUQraWh5Wk82YThEQ1FGU1p0ZmpRYTRJeVNkSGNNYmh3?=
 =?utf-8?B?SXJIL2F2SmxuZEpYSk12UDBTdElSMTJyRFdNTm5hYjhoemd6QXRaRzBMMTVX?=
 =?utf-8?B?bkFPMk50R21UQVc1VjliTmdka2plSWpVQTFlb1Z2TG9pdTVkTWxvbmw4dk5k?=
 =?utf-8?B?eUtQOXRhZHB2ZEk2NG9KUXJrVEFHMGllR3k5Y2g1MW5NZzRITHU2WGZlaGNH?=
 =?utf-8?B?N3p6MXZGU1QrWHhTbXU1QkV4TDNyUXVZMmdTWnd6QVhwSmNaR0g1TUVSbzlU?=
 =?utf-8?B?OGVRakJuVThrS2VIdk9KNEN2cENyd1ViOGRFbW5rT1RTbW85WmpIWXJPQW1V?=
 =?utf-8?B?aWZMWkZlZFFic010TTdTd1VvRGN3NG1mbWpFK0ZpdlBhREJKTWhFSlZuYW56?=
 =?utf-8?B?UUw4OWFwT3A3ejZ5VEFyd3I5NlVMNWNISUJlR01DR2dVdHZ3dVNmK24xNVRl?=
 =?utf-8?B?M0RiZUNJclRmNWk0WDBIaVAyNzJaN29taUFvc1NtNm5OZldhMFVrd09wbUhz?=
 =?utf-8?B?eUR1WTVEaURwNnR4ZGp2SmlNeU1QNHRpWnMyVHVVaWVmcU4vYlNhS3RnRW8w?=
 =?utf-8?B?WW91b3V2V3FqR21ndmdRMitKb2lsQWoyN3JzZEhrQjlaRG50TDFBS2U4M2d1?=
 =?utf-8?B?ckY4NGNIcFVNKzA0S2RIa1EzVHFkOFR4MXk5TWRkeDliVW9HTU1VRnFOUURH?=
 =?utf-8?B?UFlNNWZrMlp6MlY3eThqNkx4UDVLaDFkVjhrTnQrZkhFcXRVYWJiSkVzVUtW?=
 =?utf-8?B?c2h4KzhzeFJ5ZjBkK2VoVTZPNGoybi92VGIzQTlLL3pGNVR1dmU2VEJYM0Vs?=
 =?utf-8?B?RExJQ0l2TmtzcUNmWk9hYVJTcmVnazlQQ0FvRzRNbXdORFRjVHZIQ2JtTFhz?=
 =?utf-8?B?VFcrd2hvUGFxTGVoY3VwdHJ3WVdzM1Q2Q1JlWSt5amJSVGljWDVjMlZWMVBY?=
 =?utf-8?B?NFRaRC9Vc3ZFeGJFUVhjU3pJOTlWUjNLVTRUVUdiNU5HYmxjOFd6SmVtQkZF?=
 =?utf-8?B?NEkzRk5OazlZeW9yVG1OTDMvOTNVSFNNSXZLZXRNZ3U3S1ZjK2FTdVhGKzcr?=
 =?utf-8?B?elJvbm9uWmo4NUk4K1hpdjYyRCs1czRRczN6Q0VHV2MwZ3g3MEhkMEZQb0Nq?=
 =?utf-8?B?RmE4TlY0am92azRRTTBSUW5tSEhneW40Sjc5a2ZYZEpUeXdJcjQycDk3bmlO?=
 =?utf-8?B?TWZWOXFuamdCMjlKbWhZajdXYWsvSzJXcHQrK1BOR3gxYmtmYkxpMWh5MHp2?=
 =?utf-8?B?OTlmbUwrSXR3akhVRS9ZUkVjekNqUmdOcXJocnhLOWJvSWRCajNSWTZTR3dH?=
 =?utf-8?B?Ly9RdnQ1dXU1L0xkT3pJS1Z2bHZvdWR2YW0rVGQwN3YvMEJkL0ozbVRhSFcz?=
 =?utf-8?B?Wnl4N0MzbTBuM1BWbUhROTNQcVFVNXlpYlYxM2NIRUdPVVFtd3VrMmxiMEhP?=
 =?utf-8?B?b0dCYlg4c09HbjB0RGJMcnRPdTdEemZhUEJqZE9aU2lwa2tna3p1eSs5eUNB?=
 =?utf-8?B?bzdRMWs4MWZ1cjQwZVp4RUo5TEpQYm9aemd3WUwvSklDZVUwL1VPeXJSdWpa?=
 =?utf-8?B?M1NPUzlINmRpdDVoUDFOU0lyd0c5UGhsZjhqV3ZYa1A3dEdsMDBHUWd4ajdU?=
 =?utf-8?B?QnBTeHBTdDhnclh4T25WZHdIOERYa3J0NHY2ZDJ1UUJWVGpyZEdVSG05Qk9Z?=
 =?utf-8?B?NEtNZHpvYUFwa2lOeEJoM3M4MUV0cFhxc2YyNEtpN0VRdjBMTG1vNW1NRS9W?=
 =?utf-8?B?eENObnZwUWViajI4a2w1RzFNckJpOFE1VS9PcFhFUWt4alJvYUdzMFhmMUti?=
 =?utf-8?B?cVgwSTNmdHZ0T2lwNy91aEcrMTBadTRoUVU4eDdkMGYwd1pmSUI2aytDbDdV?=
 =?utf-8?B?ZTlUaVM3WGJ3c1c0VVNOTTJ4L0QxV09IZHBBK1hSUWdwclNTb0xOUzBXMS9p?=
 =?utf-8?B?QTd5Vk1iYWxiQzkrQS9sS0t2UVQ4MjlaT1U5TXBYZnA3T1k3Yk5XZEVpUTZ0?=
 =?utf-8?B?WmNDTm52NHJoSGc5L0tDRTZxZ2NJVG5Nais4MFp3VlA1SDlqcXpoUlNKcHFp?=
 =?utf-8?B?MGN6Uk5wUlBVYVpBcVFMNjhWSVFGSU9YZDVudFhyVzBpS2t3NmdTRUROZ0lH?=
 =?utf-8?Q?MqNgJedpRqme90svWC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d99072e1-aa2c-4101-47f9-08deb5b2da9f
X-MS-Exchange-CrossTenant-AuthSource: DSVPR12MB999147.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 14:28:11.1995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oxa82LlfcbziuLmIJdmDP1f343aj7QttU0shl/pYHB3AgF6CLS0CfzWTmsNRduLIZW1grsE8j/9U7BjBtc9FNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7968
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37156-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email,amd.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 1215E580A28
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/19/26 02:21, Hardik Prakash wrote:
> On Mon, May 18, 2026 at 23:14, Mario Limonciello wrote:
>> I'm still confused though.  Are you saying we're actually racing with
>> amd_gpio_probe()?  Like the GPIO chip gets set up before the interrupt
>> is ready?
>>
>> There is a dynamic debug statement already in amd_gpio_probe() for when
>> it finishes, maybe you can sprinkle a few more around the start of probe
>> and amd_gpio_irq_enable() to confirm?
> 
> Added debug statements and enabled dyndbg at boot. The trace confirms
> the race:
> 
>    0.285415  amd_gpio_probe: start
>    0.285496  amd_gpio_probe: calling irq_init
>    0.285947  GPIO 157 enabled (quirk fires)
>    0.285950  amd_gpio_probe: quirks applied
>    0.285952  amd_gpio_probe: registering gpiochip  <- GPIO chip visible
>    0.287121  amd_gpio_probe: requesting parent IRQ <- probe still running
>    0.290248  AMDI0010:00 dw_i2c_plat_probe: start
>    0.295928  AMDI0010:01 dw_i2c_plat_probe: start
>    0.301454  AMDI0010:02 dw_i2c_plat_probe: start <- races here
>    0.306905  AMDI0010:03 dw_i2c_plat_probe: start
>    2.348157  lost arbitration

You add a debug statement to amd_gpio_irq_enable() too right?  Can you 
please share your debugging messages patch and full log?

I had expected that the interrupt should be enabled before it starts 
getting used.

> 
> gpiochip_add_data() at 0.285952 makes the GPIO chip visible to the
> system before amd_gpio_probe() has finished. AMDI0010:02 starts probing
> at 0.301454 while amd_gpio_probe() is still completing. This is why
> device_is_bound() works and initcall promotion does not -- it waits for
> probe completion, not just gpiochip registration.

What is the boot time impact to adding device_is_bound() check?

Bartosz, thoughts?

> 
> Thanks,
> Hardik
> 
> On Mon, 18 May 2026 at 23:14, Mario Limonciello
> <mario.limonciello@amd.com> wrote:
>>
>>
>>
>> On 5/18/26 12:22, Hardik Prakash wrote:
>>> On Mon, May 18, 2026 at 19:57, Bartosz Golaszewski wrote:
>>>> If you added wait_for_device_probe() right before requesting the
>>>> interrupt, does it help?
>>>
>>> I'll test this. One concern: wait_for_device_probe() waits for all
>>> pending probes to complete, not just pinctrl-amd. Calling it
>>> unconditionally in dw_i2c_plat_probe() would affect every machine
>>> running i2c-designware, potentially adding boot latency broadly.
>>>
>>> Would it make sense to guard it with the same DMI check, or is the
>>> intention to make this unconditional?
>>
>> Our general aim should be to avoid DMI checks where possible.  If you're
>> finding a timing problem on your system there can very likely be a
>> timing problem on another system from someone not as willing or able to
>> report it.
>>
>> So let's leave DMI hacks for fallback if we really can't figure this out.
>>
>> In an ideal world we would have a _DEP in the ACPI entries, but I don't
>> think I've ever seen that for the GPIO controller.
>>
>> I'm still confused though.  Are you saying we're actually racing with
>> amd_gpio_probe()?  Like the GPIO chip gets set up before the interrupt
>> is ready?
>>
>> There is a dynamic debug statement already in amd_gpio_probe() for when
>> it finishes, maybe you can sprinkle a few more around the start of probe
>> and amd_gpio_irq_enable() to confirm?
>>
>>>
>>> Thanks,
>>> Hardik
>>>
>>> On Mon, 18 May 2026 at 19:58, Andy Shevchenko
>>> <andriy.shevchenko@intel.com> wrote:
>>>>
>>>> On Mon, May 18, 2026 at 07:53:28PM +0530, Hardik Prakash wrote:
>>>>> On Mon, May 18, 2026 at 19:35, Bartosz Golaszewski wrote:
>>>>>> What is blocking the pinctrl driver from probing? Does it return
>>>>>> -EPROBE_DEFER for some reason? Pin control core is ready at
>>>>>> core_initcall() so it should work in theory.
>>>>>
>>>>> On Mon, May 18, 2026 at 19:16, Mario Limonciello wrote:
>>>>>> Please try arch_initcall instead.
>>>>>
>>>>> Tested arch_initcall + patch 1. GPIO 157 now fires at 0.255s (earlier
>>>>> than any previous boot), but arbitration errors still occur at 2.309s:
>>>>>
>>>>>     subsys_initcall + patch 1:   GPIO 157 at ~0.310s, arbitration errors
>>>>>     arch_initcall + patch 1:     GPIO 157 at ~0.255s, arbitration errors
>>>>>     patch 1 + patch 2 (v5):     no arbitration errors, touchscreen works
>>>>>
>>>>> The driver is not returning -EPROBE_DEFER. The problem is that
>>>>> amd_gpio_probe() hasn't completed by the time i2c_designware fires,
>>>>> even with arch_initcall. Promoting the initcall level gets the driver
>>>>> registered earlier, but probe itself takes time, and i2c_designware
>>>>> catches it mid-probe regardless of registration timing.
>>>>>
>>>>> This is why device_is_bound() works where initcall promotion does not
>>>>> — it waits for probe completion, not just driver registration.
>>>>
>>>> The alternative solution is to have a registered notifier for the device in
>>>> question. But not sure if it will be less-invasive than given solution.
>>>>
>>>>> On Mon, 18 May 2026 at 19:41, Bartosz Golaszewski <brgl@kernel.org> wrote:
>>>>>> On Mon, May 18, 2026 at 4:08 PM Mario Limonciello
>>>>>> <mario.limonciello@amd.com> wrote:
>>>>>>> On 5/18/26 09:05, Bartosz Golaszewski wrote:
>>>>>>>> On Mon, May 18, 2026 at 3:46 PM Mario Limonciello
>>>>>>>> <mario.limonciello@amd.com> wrote:
>>>>>>>>> On 5/18/26 08:40, Hardik Prakash wrote:
>>>>>>>>>> On Mon, May 18, 2026 at 18:17, Mario Limonciello wrote:
>>>>>>>>>>> I'd still like to avoid a quirk if we can.
>>>>>>>>>>>
>>>>>>>>>>> I know my proposed patch to try to probe at an earlier stage didn't
>>>>>>>>>>> work, but could you perhaps try pulling pinctrl-amd even earlier?
>>>>>>>>>>>
>>>>>>>>>>> Maybe fs_initcall()?
>>>>>>>>>>
>>>>>>>>>> Tested. fs_initcall + patch 1 still produces the same arbitration
>>>>>>>>>> errors:
>>>>>>>>>>
>>>>>>>>>>       subsys_initcall + patch 1:   arbitration errors persist
>>>>>>>>>>       fs_initcall + patch 1:       arbitration errors persist
>>>>>>>>>>       patch 1 + patch 2 (v5):     clean boot, touchscreen fully functional
>>>>>>>>>>
>>>>>>>>>> The initcall level does not appear to be the determining factor on
>>>>>>>>>> this hardware. i2c_designware is still probing AMDI0010:02 before
>>>>>>>>>> pinctrl-amd finishes regardless of how early pinctrl-amd registers.
>>>>>>>>>> The explicit device_is_bound() deferral in patch 2 is the only
>>>>>>>>>> approach that has worked.
>>>>>>>>>
>>>>>>>>> Please try arch_initcall instead.
>>>>>>>>
>>>>>>>> What is blocking the pinctrl driver from probing? Does it return
>>>>>>>> -EPROBE_DEFER for some reason? Pin control core is ready at
>>>>>>>> core_initcall() so it should work in theory.
>>>>>>>
>>>>>>> Currently it's module_platform_driver() IE device_initcall().
>>>>>>>
>>>>>>> That's why I think we "should" be able to move it a lot earlier.
>>>>>>
>>>>>> I mean with fs_initcall() change - what's blocking it now?
>>>>
>>>> --
>>>> With Best Regards,
>>>> Andy Shevchenko
>>>>
>>>>
>>


