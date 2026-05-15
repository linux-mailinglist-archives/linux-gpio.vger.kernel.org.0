Return-Path: <linux-gpio+bounces-36953-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLdUAF5aB2orzwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36953-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 19:39:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A3F555632
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 19:39:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C5B0E30028AC
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 17:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E5D740312C;
	Fri, 15 May 2026 17:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="i2zk2CFO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010040.outbound.protection.outlook.com [40.93.198.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7E3403122;
	Fri, 15 May 2026 17:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778866468; cv=fail; b=DU6Lqcx60cAyFUCJCm6HFF8Wc7Nvjphakk2gC6QkYnZGBvTDrrD3Jb09QLvvQojdyg9WpfzLZWEvAc/xLfZGjl2tYTIo40TiWatmY9AId+K+2gZwLzgeMyg4CIXlYZ9tCnlJK74VezgtPz3FDg/gSudOul+lKsh2oVD6YlIzyO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778866468; c=relaxed/simple;
	bh=g/t7ZGyL8DpTXdenkj6kV11t1xDw1T0WFV3C4kDpOMU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=benDkREapOnO0xcbj8KvXllCCcWE0rfHoiajbGVofX6hbgdGYaoD9vnrQ2UUfcR6QgrBRlz9gUHzaOV6UaSkovRwqYzpLSCYWVpSHiKkVZaPeMl89jXRXh+cO1bqYsbrbLyEBRdwBO+Qw84oDpPqNDnmf5a0Zv4Nbo6dKfI/P5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=i2zk2CFO; arc=fail smtp.client-ip=40.93.198.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kmGH8pOiFP7C4A51Q4dC0+ILG5hIRAz6ar4AjwuDR9wfXf1kI+aV6Suw33CDI57j4D4AxLBvYi6ZVjRIGKTPIjeYnGDZOGUGneipFVswYNcdFuMc0MJyuuYnRa0d8HV3garuXzIKe+ISo2+5LfuaWb9PVf9Q13gkywb7Jt8oHb5eLFlsgCiOpNI7jvxNGGTRUFrNQnxZS6UhGidcABTuMZtvJN/g9VM4MA2PL2QaFY1NQ8FaXfZl9XFmGdFg/Q+1lQF2R+vz63tzlSVzdiA5IvOrSKQtC2OvLFSHxAHjiC+ypkWu+PwJ1KVl+LWeBy2vy4Y8z3sK1jxI4DVYg48YvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1sRMKqEMzY2afn0CdbkgyclzfPHan1qDJvlDYI66+jA=;
 b=nOk+w77HnRaMjMB0RsW7gG6Yl2rihc394HKUSDGaKV+JOt5S8GZNLIEqTQGvTg9XVXLO7FOMapEX1oil75lArGtZh89nOCOcFgRduzsGn9zvS4iPSqC4dnN+GETb7LXIzLxOgUzX8YRn/bBPF+zfP4w2LK4aNR47LZP/O5uNBZ6lISiiWNoRVFEBq4PWiyCK85mAGpXwR79GqAeBIJAxL/sKlMtNars51uu6BjIjyhXNrEZjXHtqYOJ83qFw16jPcHlTEJWy4ufDNM1+zf/WFfh3uxG27vU122vndb2C62+iAkNuAY2Xeb5cngaDDRJrwXW76vypSEYmtvGkn7GPuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1sRMKqEMzY2afn0CdbkgyclzfPHan1qDJvlDYI66+jA=;
 b=i2zk2CFOBCMsTj297SvObfeqh1t/qmjHYvdecQZXqAdLLk1sRA/iaYJB/P236HXt4r7ceCN7NwTM0tZL9GLFr2M87CvgggD752qXpSP4gN8fjINVA1+7sfqwQ2Ui0kaObEhe1++4CBKMGNq1rD/KZlK4U6y+vBeE8GB7uoOaytw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DSVPR12MB999147.namprd12.prod.outlook.com (2603:10b6:8:38b::11)
 by CY5PR12MB6273.namprd12.prod.outlook.com (2603:10b6:930:22::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.19; Fri, 15 May
 2026 17:34:24 +0000
Received: from DSVPR12MB999147.namprd12.prod.outlook.com
 ([fe80::98c5:8206:6a4:c445]) by DSVPR12MB999147.namprd12.prod.outlook.com
 ([fe80::98c5:8206:6a4:c445%3]) with mapi id 15.20.9870.023; Fri, 15 May 2026
 17:34:23 +0000
Message-ID: <32e96be9-a987-4847-b02d-d288f3fbeeb2@amd.com>
Date: Fri, 15 May 2026 12:34:20 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/1] i2c: designware: fix probe ordering for AMD GPIO
 on Lenovo Yoga 7 14AGP11
To: Hardik Prakash <hardikprakash.official@gmail.com>,
 linux-i2c@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, wsa@kernel.org, andriy.shevchenko@intel.com,
 brgl@bgdev.pl, basavaraj.natikar@amd.com, linus.walleij@linaro.org
References: <20260515161516.10474-1-hardikprakash.official@gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260515161516.10474-1-hardikprakash.official@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:13e::8) To DSVPR12MB999147.namprd12.prod.outlook.com
 (2603:10b6:8:38b::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DSVPR12MB999147:EE_|CY5PR12MB6273:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d8361c2-e1f0-40fa-3fed-08deb2a83449
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	LeiGtOuOFPx6fpra2R3ksOTtfJWjwkmhfvmgD70tdCq4dBdEfH1/gfmpbePtrlVUDRgHnh7Pn15Hc1N0y4CpWIM70KPuZu7DVCa3ku955R6lt3CwApcss5zKNzJVmoAKIE7Xm+YCCuDkA98Rk/et2zrdeyA9PlxV/1TP4l3AiKN10bG1FDJ8TACKZ7dsG5SVyCA/HKMEXQc/F+uo0WNoWojIxmlVrepKDkj+pyDLA5ViLpFoTyzK4S8qb1xayy0dR0OuLaMtcIZvXwOuNizhaHVtU86KCE+5RWF9UNkdbBjdgaERzCEWDWS6TkL0AicnqdM3DKDGjbSTIbrONrvyeyBtqkf5QO0Vv+pEukF01w+jSSvI2j4TKmV6ahDFC9qa898IXNJFGBTFekJuY8JsDEZo/gNH+enoQDA4e5+hPyp71Q2r5YtJlpJ7G5JH+nTfDPrE3jskCoYmG1Zcvm2l2QyydPIcgnxSrPo2Fh3lx21i7ZIsFF60eMtOumBxpSmLDTteIAxzoJXa64wEJOChsWk71LlEOmtqyFFMk/Cg2j7ayH+mlg6wTqiBOv9uO1Lytd99c+Dfh+w4uPPTEBBO7r+gnDdGrDLdutiyfcBcWPenIqsLWMYyIihoZwmhiHB/j1A/mh/ehtv66p1hKxsH4uKpDhisOm0+ARGAGu+J5rkQ5Jd7z7D3/JzBtM/OSLFfXxqWg1ukxJjP+uZ5URY2iQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DSVPR12MB999147.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3FscnF6cTFFVDhCQ0tqa3VPc2M3Umx0Sk1CVVVuRFFqcW8zcXlRQ1FSdE9Y?=
 =?utf-8?B?TmRXc3h0NVo2SGxENWdubFkvWENKdWFDNmpuWjZqSm1xYmZ2U0N6ZDEvY1h3?=
 =?utf-8?B?R1RYM3lmUDcvY3M3dHdYa05rdUE5bFZiNGlEUTFHMmVyUGR4MFRqdXpqcVVG?=
 =?utf-8?B?WFdCb3JoWnorNUVvVXhEb1V4RklodnpsRC9qNXI3S20xR2NFS3lWb085Nldt?=
 =?utf-8?B?UUk0Ymp5ZXhKOXNjYldqOVpxbHhabHY0bm9id2QrQXZsMHBtc0FXaEszVk5a?=
 =?utf-8?B?TmxTWHJqaW9BM2R3Y2t5MEJWOTloZ255SmgrWElKYnJIZHppTkdaeWpHdUY2?=
 =?utf-8?B?NWlsU1FFTzFMalc5VGh2WmZDSjJ5cU1vMlZWRDdkcnM5U1REakt6NWRTYkl4?=
 =?utf-8?B?RFQ0RG0vQ2VWaGFSMzYvL3pNYkZDelBJVmFNaVNUOG5NdFRMSFpzeG40V0Rq?=
 =?utf-8?B?ek8rRGZkaXlVSGFnYkl3aEhDRUJMaVIvTmNwdEtTcEhFMkNacWgycGtqUGs2?=
 =?utf-8?B?L2lSTnRBbXBOSytseDh5YkNqSSs0YTgraG5KRHNFYW0vb09RSXVPek9VWmJq?=
 =?utf-8?B?emNhdmhyeUtlejliNDlMK1BTWmU5MWgrY3NHUXdCYkROcmhxalVQL2dLY2Ro?=
 =?utf-8?B?U3gwZFRqZXdKRXIvZzhKMHVGdm1Ma3lDdGZiSDltL0xJcnRyS1lSOVpFK0k5?=
 =?utf-8?B?Tkc4ekF4RG9vZVgxUjIvMlFjRGVCbVhxK3ZyWTk3aUg0WUJyMlZpSjZHbXpX?=
 =?utf-8?B?Vko0dHJ0bUZqaFIvWWhTUnY0M1pJSmRjS3pvaFkrZEpuaHhyMEorditKSjd6?=
 =?utf-8?B?R1N5RGRMQnJHUWllNmwzcGp2Z1lpclRiempvcmg5UFJwR1JURjJQelFJWU5l?=
 =?utf-8?B?Qnd1RTgwckVqbURabHh0VlhXVzJSWVg3OER4aVpEZlpuTnNmVkxpcHF4UitM?=
 =?utf-8?B?cENjUjhKWUkvVmRhSTY2dUVVQ01yeVpyWEZuTk1SSElSbHVnbzR5eVFBSEdK?=
 =?utf-8?B?bWRtM3FNQXlZcmhWQVlHZ042VzdVRHVLaGFtejR6KzBpbHR2UlhqRW9DWkhw?=
 =?utf-8?B?cFpEb1V5KzNZZFI4Y2IvMy9lbW5UamhNMS95Znp4T1dxZUpHOVVBdnBDajNF?=
 =?utf-8?B?TE9EbHc1c01pWDNjem9xTDJpNVdDeW1yYW1EbitNWFoxVDB2Kzd2Sm9adHhE?=
 =?utf-8?B?MmdxY1VEQmxvN0dIU2RLczQvYlJsY3ZGNVgwNW14SkF0dkh1WThVRk52ZmRP?=
 =?utf-8?B?TlZuOUtOb0dyb2FuMTdaZnExYkZvdnhpRHZxdWlxMDZITER1d3c3VFlBUk43?=
 =?utf-8?B?TDNwOGhYeGJONVFRRitmblprQmxTVzkzcDZ3eGUvUTN4WWRoR3VVYXdCMXRY?=
 =?utf-8?B?OVpPOHZjU05oRTNBKzVLZ1I0NklvL2liTElNUE9XZFJleTJXVSs0S25JMEg5?=
 =?utf-8?B?Wlg5L3c2ak5tUHducElCRWRuMFNWazV6d2tYeDJNRi9TeDRIQWU4UFZETEk0?=
 =?utf-8?B?NFNoOFltRWFVY0lCTC9sWUV6WFpIVjA0NDFwMVBMSnFaaHVkeUw0b3B1ODdZ?=
 =?utf-8?B?NTJtSlR1dHJlZlZuTFlMVG9zUFFDNkZKT2tORm5NdmhFaWk5eWVuYitER0Jq?=
 =?utf-8?B?b2YycVJNRlB2ejllVXRWRW5tSmJrRVF3dXRVblBVL1JFK1dMYkJGTklseFRX?=
 =?utf-8?B?N2JSR3lJQVJTV1ZQaVMwb2dRNmNkTUdidDc3NE5FbS9heTRNUTgwaC9IYjBC?=
 =?utf-8?B?M1VXekxTaHp6YTJ4cmMydWFoTE1SSG9BbWpRTFdvNE5MRDZNaFBlcWMvNE9K?=
 =?utf-8?B?eVJWajJyVDkzcm9adlNTMVEzTnozRm9yK2tGWUtHb05aS1JmU0M1OGNqOC9t?=
 =?utf-8?B?V3RMMUNhdThzTlRsUWk4MVhJVXFnUnMrRlNxN2NXOHZ6b3F3emw1Tm9QN2FW?=
 =?utf-8?B?a2lLb0VqSWtQV0lPbmdXbXFmQ2N4MjY3VjhSaTVrTmRLU3I1Qk1WNmxvblhp?=
 =?utf-8?B?Y0dzTVBoNFdtTElYd0dOUnVSOVR3Tm9yOGROYXFyc3ZOZU9CRGx3SUFlUmNB?=
 =?utf-8?B?bmhIeTF3RkZDb3RPcW5WZ2xQd0tzZ3JJZklObkl2V2wvVmhLTHZtRkMrYTE5?=
 =?utf-8?B?N1lVNmduQUpRTy8yZkZjVElzOGZlM2YyZkg3WG43SEl2c2kzdWxKQTV5KzA1?=
 =?utf-8?B?MzZKcmhpT1B1S1hqUlVtUHVmZ1ZiekNnN0IvdWtNL25xdzZ1ZCtqeHhrUTdW?=
 =?utf-8?B?Q3RNVlladTdPYTVLVVBNQTZHbER2WDlLNS9MRGNWNnBtSHpHR0s2d3U5NGNs?=
 =?utf-8?Q?RB4xwCPdM7ZY4rAU5M?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d8361c2-e1f0-40fa-3fed-08deb2a83449
X-MS-Exchange-CrossTenant-AuthSource: DSVPR12MB999147.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 17:34:23.6813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sSYO4Kj4RiW1Qn6/s/XWdeITSlXchYsgeBGt0CHbJmKOl7s77rEH0G0XHcWrYxmkl/vkB3AGaTbFobjg+qAk2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6273
X-Rspamd-Queue-Id: 96A3F555632
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36953-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action



On 5/15/26 11:15, Hardik Prakash wrote:
> The Wacom WACF2200 touchscreen on the Lenovo Yoga 7 14AGP11 (83TD) is
> non-functional on Linux due to two bugs. Patch 1 (pinctrl-amd GPIO IRQ
> fix) has already been taken into Linus Walleij's tree. This v3 resend
> covers patch 2 only, addressing Andy Shevchenko's formatting feedback.
> 
> Root cause: i2c_designware probes AMDI0010:02 before pinctrl-amd's
> probe completes, so GPIO 157 (WACF2200 GpioInt per ACPI _CRS) has its
> interrupt bits cleared when the first I2C transaction is attempted,
> causing lost arbitration errors. The udev rebind workaround (which
> works because pinctrl-amd has finished by userspace time) confirms
> probe ordering as the root cause.
> 
> Note: the dual-master hypothesis raised by Mario Limonciello was
> investigated. TPNL's _DSM (UUID 3cdff6f7-4267-4555-ad05-b30a3d8938de)
> is a pure query method returning a constant HID descriptor address with
> no side effects, making firmware acting as secondary I2C master unlikely
> on this hardware. Awaiting Mario and Bart's technical verdict before
> any further approach changes.
> 
> v3:
>   - Patch 2 only (patch 1 already in Linus Walleij's tree)
>   - Fix variable declaration style in dw_i2c_needs_amd_gpio_dep (Andy Shevchenko)
>   - Add BugLink tag (Andy Shevchenko)
>   - Add -v3 subject versioning (Andy Shevchenko)
>   - CC AMD engineers (Andy Shevchenko)
> 
> v2:
>   - Replace custom HID/UID lookup with acpi_dev_get_first_match_dev() (Andy Shevchenko)
>   - Use acpi_get_first_physical_node() for platform device lookup
>   - Use device_is_bound() under device_lock() with explanatory comments
>   - Fix dev_warn to use dev_name() instead of hardcoded suffix
>   - Fix commit message (removed incorrect "existing" reference)
>   - Add Assisted-by tags per coding-assistants.rst
> 
> Kernel bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=221494
> Related: https://bugzilla.kernel.org/show_bug.cgi?id=221454
> 
> Hardik Prakash (1):
>    i2c: designware: fix probe ordering for AMD GPIO on Lenovo Yoga 7
>      14AGP11
> 
>   drivers/i2c/busses/i2c-designware-platdrv.c | 77 +++++++++++++++++++++
>   1 file changed, 77 insertions(+)

I have another idea.  Why don't we just move pinctrl-amd to initialize 
earlier?  That should avoid the problem without more quirks I think.

Something like this:

╰─❯ git diff
diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index e3128b0045d22..56a189082351b 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -1292,7 +1292,18 @@ static struct platform_driver amd_gpio_driver = {
         .remove         = amd_gpio_remove,
  };

-module_platform_driver(amd_gpio_driver);
+static int __init amd_gpio_init(void)
+{
+       return platform_driver_register(&amd_gpio_driver);
+}
+subsys_initcall(amd_gpio_init);
+
+static void __exit amd_gpio_exit(void)
+{
+       platform_driver_unregister(&amd_gpio_driver);
+}
+module_exit(amd_gpio_exit);

  MODULE_AUTHOR("Ken Xue <Ken.Xue@amd.com>, Jeff Wu <Jeff.Wu@amd.com>");
  MODULE_DESCRIPTION("AMD GPIO pinctrl driver");
+MODULE_LICENSE("GPL");


