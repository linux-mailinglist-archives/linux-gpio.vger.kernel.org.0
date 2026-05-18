Return-Path: <linux-gpio+bounces-37059-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wE8kK54LC2pN/gQAu9opvQ
	(envelope-from <linux-gpio+bounces-37059-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 14:52:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AF156D11D
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 14:52:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0527C3012572
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 12:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BF8442EED0;
	Mon, 18 May 2026 12:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GG5UjOIa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012048.outbound.protection.outlook.com [52.101.43.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FBB409DFC;
	Mon, 18 May 2026 12:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779108467; cv=fail; b=aK1JsDYZt1XBzwp6vrvopEHpovNNm1HRR4UWeiJvtfz0xrvd2f2sQsfdapVs7d81WDLcHHDG/r1GFIv/iRfdxyBhw8xbrsakfumlCUtbyY+kdtkPXEbyamhCrumWnv2rmcyfXL/JX/NFP3bB8gslMC0Oi7nItELifR6EenDXJvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779108467; c=relaxed/simple;
	bh=Os6nAzeJA8mtb53+ZdnmRbJenH0wZs8p19ARdZ4Ij0c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=g0oZOYhcTwbn/xhwmVybXAqVYeMFq0enrEJ2wrGuqimtvsBDfuNMC3nmoGdqMfKWz9ue3oUqB5QP8y3IQgBHOrFlWzaAoPDasfiXhba9gC1LQ6WK6Q+3bNPjdjJSlUt0kcXuZ6owHOeip7RXtLG2TKbjgiK4IMEUwqo4h2oMSPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GG5UjOIa; arc=fail smtp.client-ip=52.101.43.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RfG04sVJK4QuZ4dqyb/jQY4qEEDtGcYgsGJMCYM48Hs+NGXqLf470JTO0EzaVvVSd/jtL5W99YuU5C65snKWAq+yaIEsuHT9Skg/sMWwxUy0c/J+kWgux3eyS7pcLRAYIAfwb0sF5nvpOStHsRmyv1xPQHpL6bbPJ5Aq8fpQJw3oa8b33t3RWkhFZGhxgDgb7o6pkpxZGkRGqwCK7OyGjEQ6Ojf9H0xdt1nyzY8MYuz/4ZrjlXnRmeH1AaJSPyPKpCe12dQu+vWS1rnVffD2JdDvEqjSWfegxd7S/nbKxKsSLP2eizVgDRs15nrt/Hx8WfyMmvmsjuHwY87DEwrowg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uTUOMSTl1oUnoVnJY23oHtjURyLiJGAcyprZyKFTH7k=;
 b=XefonQZCShAtG9zjZcQ04pZ1si2XmamIF2596UXmsB1iYhAYByxMrinG1P6AT9mXqhOmu8hIT3fRFPAQbEdNlN1A1Mbcwtk+jgauM4d3WBZInv2Ts6riMaNd75V6PgVvPuusFwlp7oMZuPimU4OrgwAg1e7uuAJeIRu2KPorQuepq2UklxEFHXRaTwuWTbzmOXDonmPblkJXaf5VaPF9WbdC5MKndaf+GNSdCUp7l9lKQ5VW51klE/SRODk5OFn9PCxt4QToySohpoNWj4ndNrbv7t/6F65Q+ZsNd6lVjhFmIH30TN9um2WyH1/hNjNJ0Oj77DW5WMfjaG9z5tN6QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uTUOMSTl1oUnoVnJY23oHtjURyLiJGAcyprZyKFTH7k=;
 b=GG5UjOIaCGRZkLzhok3p20hpE9sr1lqfzGIs81PfmeQ239tWAVV/zBfa8D4PPAxulhs8BTmZ+vK9DWBx6hCfWhJGJgBLof5O3sWSN/45yx4VAzkjYmMC6d7C9/VlRBvAg/hrwzQB+C2Vc1i1VO9iqP9wXKbteVFRMfNo2ovONug=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DSVPR12MB999147.namprd12.prod.outlook.com (2603:10b6:8:38b::11)
 by PH7PR12MB9074.namprd12.prod.outlook.com (2603:10b6:510:2f4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 12:47:39 +0000
Received: from DSVPR12MB999147.namprd12.prod.outlook.com
 ([fe80::98c5:8206:6a4:c445]) by DSVPR12MB999147.namprd12.prod.outlook.com
 ([fe80::98c5:8206:6a4:c445%3]) with mapi id 15.20.9870.023; Mon, 18 May 2026
 12:47:38 +0000
Message-ID: <d57dd297-6be1-43a9-a38d-e40c8949e23a@amd.com>
Date: Mon, 18 May 2026 07:47:35 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/1] i2c: designware: fix probe ordering for AMD GPIO
 on Lenovo Yoga 7 14AGP11
To: Hardik Prakash <hardikprakash.official@gmail.com>,
 linux-i2c@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, wsa@kernel.org, andriy.shevchenko@intel.com,
 brgl@bgdev.pl, basavaraj.natikar@amd.com, linus.walleij@linaro.org
References: <20260518122814.8975-1-hardikprakash.official@gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260518122814.8975-1-hardikprakash.official@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN6PR2101CA0005.namprd21.prod.outlook.com
 (2603:10b6:805:106::15) To DSVPR12MB999147.namprd12.prod.outlook.com
 (2603:10b6:8:38b::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DSVPR12MB999147:EE_|PH7PR12MB9074:EE_
X-MS-Office365-Filtering-Correlation-Id: 85f78c1c-921a-418a-1a05-08deb4dba3ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	lLHKxJPpXkh2xxtZi0iZHiwyfRvCyZ5kcANjOPCL/fFXYRi8f0yA5ViDWI//QfIymsBTkedRVIJ8YLSj0gd2E4wY5exQjcIdXAc96kEs8xZQR146FBTgJWy39lBcwuA7f8UdLrafwVZT3qc59yH0M7Ss904TQRsuUlN612COWdiHKTaI8++LUppVFB2Ajc686zQmdcydjY4fxjkYgzmdiR11YUFme/fWKIftCvUV/iRyNI9GJrvCCx1oYIfO1ogCD8MkaZeqQBo1NOihlc29a5wrHDcr1X4C9W44SwNOC00hnY4pAt8+kIuZfT6FDM4AjJV3M39ol792Qnouti/qqIs/RAYwAgDHixHBNh6NhM7tqldxJQH5pcxtK0OR4ET6hfaLMUyuDaatV+OthIM6zW2QC1UWoMgeTd1RHvZpLVKKwusF1MXMe4AdcZTl3voqA3ppgh9Uviyj32SI7cV8bpC4uV6+G7LeX6Fokv0r0CPM9oByAy5wAYV/3r/8AhoUqLvcXfrYQnOxOyWn5gWJQ980Obq/wmFa31yHuR/psP8shJHsfywfK/RYGF98PWELq3i5sMpUbNd0kVQSUhHKB6wucl6eSc6lQG9a33U6V5aseOETzcLQg8p62pPexJcYujLSBhtSgLZyN96S4qK3WjUyUbzLuBKxTqrJ/xevsdCW/m+Sl2qMHePmZfxD7Pm4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DSVPR12MB999147.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YU82cGdFVlJTaytsMW1UL0g0ZTlCYnF3emZNaVYwMm1VL3NyZHcvY21rQXNY?=
 =?utf-8?B?VDVBMm81N2tMUkNXN0srd3NkS1V5MmZ3VjgwcEc5dVIzTDJBUzNLeDUwWGNv?=
 =?utf-8?B?bjZxMHlxNTZ4cVhYc0VhNU5FVkVsbU9OYWU5RUVnWmQ4TzNBVDhBaW5KSXdZ?=
 =?utf-8?B?NHpkZUdlMEhZUVM2WWlIanNwaUNML29vaHN3dTVrNk9mTVJMWHZjQzhnQlpv?=
 =?utf-8?B?OHhETzYxSFp5MGpUOU0vcEVYbVY4R09vZkhQVXM1YTc5VVNYcm1tNjBJcGt6?=
 =?utf-8?B?dEJBVkpyc2d4RVEwNkF3M0pIWDYxbmJzTjdYamdlaTV4Vi9xTUxtY2FkOG1p?=
 =?utf-8?B?aDlWRExZd0Q3STFrYjdGejZOODVsdmJtVUJmd212TE40K3VxUGhtZVpURGRq?=
 =?utf-8?B?SmtJN0VMUlZodjJhdDVaKysrNFA2c2FnZVc0RUhTTGVwQk5ucitxM1pZajlv?=
 =?utf-8?B?aDVwV0JvWUhCUmhNVzJSeHduM05WdmErUERkMHB0bUROYXpSMDk4bGpEL0Nr?=
 =?utf-8?B?Q1c3UGxMUW4vSXVoYmRYSzJsUlF1WHF5VjV3VEdrZU1abTlPOUFXZVRtSFlv?=
 =?utf-8?B?L3o4KytTTURnYVRlMlRlZ0dveXZENTJGNy9KSWw4WXZ0aUpPdE45Qjc2UkRj?=
 =?utf-8?B?bFhFV3lKNjZhemdiS1l6QXFvSUt4a2tiV1hYM280THVRcFBIMC92K3FMZ3BP?=
 =?utf-8?B?VXBHbFlSS0RFRUFIU3pnMnY5MVh2OXExZjFFUkxsK3hhaTNDRnBwZ3JKMUJK?=
 =?utf-8?B?VGtMZFpxN1FUYlMyOS8weGE0bm5pcXRCR0owR1NlWFpnYVN4bWtNMmpLMHNs?=
 =?utf-8?B?Vy9BNGRMQzR6b1dZSVA4azMzRjlIME9TTEgxWC8reVhnU3l3NjJ4S1J4bHpo?=
 =?utf-8?B?aldndHlpS1pvaHJrenA4VW5rMnNGTEtZOTBtcGd0Q3IrcWRLOERpOHFKLzV4?=
 =?utf-8?B?aytkLzN6bWZ2bytIeUlPSlBkWGE0d3U5SnU2VDN0Rkk0SVp3T3NzcHlMZDEy?=
 =?utf-8?B?cW1TWjk3cXdRWWV4NDRJYk96QW1iZCszTXgvUTl1T0ttaFdaTEpsVlRadVYv?=
 =?utf-8?B?bzQ5Rks2eTNacHh6OEk4aERtR3QrNnZrTlRYYWpENlpKMldPWHpLbHVEY2R3?=
 =?utf-8?B?NGpCeXYrejFJZXZuUFFrdW1RSXNNbEhEZ1Q5dzlYdjJNYm96K1BmWTB4VzdI?=
 =?utf-8?B?RkpXTXB5U3M0YlBOQ3FWOC9oeTBCMFJEWHpld2o4bUp4eUVnVDl2bVpGVnl3?=
 =?utf-8?B?MVoyajNNeEcrQXJZcXkvQ2ptNHFwb3pPdDk1bGtOMHh0dUgxaUFkL1lWN0dE?=
 =?utf-8?B?dmpMcTNDd2ZDek40cjN1cldYczdMR1EyamJFSm93dDF0bWhFV0pRWTRYcTVw?=
 =?utf-8?B?R2hHK2ZZUXg5YjJPN3VXcEQyODBGdkpoMW5XUUowN1ozakRuZGJNeHVvUVNv?=
 =?utf-8?B?QWJRUEVwWFVhYXhpSVJGQTZldGNxNEpHSGE1WENzb0FWQXZvMnFham0zRmU2?=
 =?utf-8?B?Vmd0dTVYWXRqVGE5akF6Ui9uWUYyeFo3cEl6ZjB1OEpyVkl1MU10alRwWjFG?=
 =?utf-8?B?d2RkYjF6QVE0SWVrRzVrY0c5UEI3SUFmOTBvN0xSUUtjRGQ5UzFyS2taTkZZ?=
 =?utf-8?B?MXY3OG1jTm5ZUGhhZCs2UHdKWTNhVkFSQ1N2Uk94UzB4eW9iU28yT0NVWDhZ?=
 =?utf-8?B?a1VWQkd0cmlPUGttd3prdXhRL241Vis3MFB5NEhTN2M4UkJ2dHRmNmc4djAw?=
 =?utf-8?B?Ky9kSUdPMkZuam9Hb21WbnNDMHhLUlpUMS9QSEtDM21xdUswSG5OR0xzc00v?=
 =?utf-8?B?cGt5WENCanRKQ0hsOGpEU3hxa0xIV1o1UGZXTGMwdGJ2OUsvaGtBYWZieVRl?=
 =?utf-8?B?bWVja1gramphSERuNXQvdWFvZnpmRzAxVTRLK1JUclVIa1FackJVNGRnbk9Y?=
 =?utf-8?B?M0NHTkZzZWtCZmlXQjJ4Zk11dHUraExDMEpyV0NjYkxiMUVCTGN0Z0xiY3dH?=
 =?utf-8?B?a29JQUJmVGFLSU05UEVlbUF6Q0d5c2tjWE8rSjdZK25PMmEwRWQ1MU9OaHFH?=
 =?utf-8?B?Q1phczk4NWdORUdjMC9ZRUFnUURTb1dSdVFqeHJtR3pPMWlNeGlTOUJwWXBx?=
 =?utf-8?B?QVNKMnJiQXVqOEJsVVJrR3VHNHBRcWNZTUY2bW40cXl0QUlqenIwc0dxcjVj?=
 =?utf-8?B?V2c0aCtZNDJwQUZBWTFRSG5mZkY1UWhPc3RCb2pFMG13WmRickNVYUxianRV?=
 =?utf-8?B?RjhHMkcyenhrSXV2YVpUdkd1eEJmdnY2YTA0VlFvMTJDdmYvVDZOL3JMWGdL?=
 =?utf-8?Q?0JPU6TC09U+s84wk6v?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85f78c1c-921a-418a-1a05-08deb4dba3ef
X-MS-Exchange-CrossTenant-AuthSource: DSVPR12MB999147.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 12:47:37.6590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 43o5pLcmdhyRxWQRgUzTR4KXCHwZrRwF9ywKMl34Augj2bZb11WA7eDp6KDslTUhNWcgsERjNkufIYYFdLMx+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9074
X-Rspamd-Queue-Id: 59AF156D11D
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
	TAGGED_FROM(0.00)[bounces-37059-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action



On 5/18/26 07:28, Hardik Prakash wrote:
> Patch 1/2 (pinctrl-amd GPIO IRQ fix) is already in Linus Walleij's
> tree. This series contains only the i2c-designware probe ordering fix,
> based on top of that commit.
> 
> The root cause: i2c_designware probes AMDI0010:02 before pinctrl-amd
> completes, so GPIO 157 (WACF2200 GpioInt per ACPI _CRS) has its
> interrupt bits cleared when the first I2C transaction is attempted,
> causing lost arbitration errors.
> 
> A higher-level ACPI devlink approach was investigated in response to
> Bartosz Golaszewski's suggestion. The DSDT has no _DEP object linking
> AMDI0010:02 to AMDI0030:00, so fw_devlink has nothing to act on.
> Setting this up at the ACPI layer would require either a firmware
> change to add _DEP, or a DMI quirk in the ACPI scan path — equally
> quirk-based as the current approach.

I'd still like to avoid a quirk if we can.

I know my proposed patch to try to probe at an earlier stage didn't 
work, but could you perhaps try pulling pinctrl-amd even earlier?

Maybe fs_initcall()?

> 
> v5:
>   - Add blank line before #include <linux/acpi.h> (Bartosz Golaszewski)
>   - Use scoped_guard(device, gpio_dev) (Bartosz Golaszewski)
> 
> v4:
>   - Rebase onto Linus Walleij's tree (patch 1 already there)
>   - Use --base so series is correctly 1/1 (Andy Shevchenko)
>   - Add subsys_initcall test results (Mario Limonciello)
> 
> v3:
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
>   drivers/i2c/busses/i2c-designware-platdrv.c | 76 +++++++++++++++++++++
>   1 file changed, 76 insertions(+)
> 
> base-commit: 3812a9e84265a5cdd90d29fe8d97a023e91fb945


