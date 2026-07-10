Return-Path: <linux-gpio+bounces-39792-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XJUBIvKZUGoa2QIAu9opvQ
	(envelope-from <linux-gpio+bounces-39792-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 09:06:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D84C3737ECD
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 09:06:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b="2OW3+/nQ";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39792-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39792-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F19F303EF45
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 07:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A29D03BFAF5;
	Fri, 10 Jul 2026 07:03:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010045.outbound.protection.outlook.com [40.93.198.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FC12773CA;
	Fri, 10 Jul 2026 07:03:56 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783667038; cv=fail; b=H7szlLI+K3fpOHcVdNy+4p8GxHpq/is0Fr7zafmw03EwSCkcyYLsTmB6WWwC/F59VpuY1X3XIQ1KfS7Y4tr00rLa/Fe1iU/k1fzGmoL6qC4u8UJQgXMeU5MeWKQWgVn+D7OakkDZMxfIhJJgOKzhZQqD2cv6FJxxbfeetr5In0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783667038; c=relaxed/simple;
	bh=HRP5XkjkjuzQTjk+eP5uMoAuwNn6Pvg6YUI2tYffSSs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EsEHHOPoxoVe3lqTdkt5ks87/cWifkGdUf8h3UcmeF88VrkyH6d/0nQXtkPFD3nFSzHm+ZdnOe3hTeJJTRH7VwLH9jbLNTHStGR5Fo/xt4yBKYR7A0Tn82626aQ1V/jKPw0qN2SOPAjKHnrZrHuMk4EhqL9rEsLG7F14rGbhBnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2OW3+/nQ; arc=fail smtp.client-ip=40.93.198.45
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j7CmXrmQSuPKAlMM2qLpVUdnqSXPxCGxZv2twkoSdLZeEDHEviVbn0nYqA0DXDgjkjAEfcwiQA/nZrjVc+gH4rEOG1bwtcyUaTdSVwCjgcMV3ZL6+Gr/sYULlnNo0IUCcNXg5Q5FkYqtum0iaYW/HNHgcM6uQ9ToGS37Kv7LDlaD1hpb8zBoFU3xtr55wrAx0qpXRVQ3RMavVWollWuh4i1EFmbnYQ0DKlVmtuzXO7wP/RA0QEYcOv/6ptMU3jfo2deQwUnMvsjyqTjhqjf2Xj6ArAvrBDQVg9zMPEl+XZPnd6kwAs5OIxUpxoHHcn3tUZSCVuEIHHNbGqi7MJl6jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1OIwrCYbbWa3eDjyIl5rIHpqqyiUCgUqfof/Df9KBrw=;
 b=k0Ums5P8+2AbEvakyeAxmZHHJDMbA8twbXoy/OgEbZcdDtfp0pz1Bm5qEJHKnTEia+JOcprdsLNZ3e45PAOkgQIrwGNaT/xSQW0kcV8NtwLcc123b4OUEIYuXMm63ojfVkMWA0GT8GwgXbB3gXIgxw+Byosb9vMcTDWCJIWmOh0ZKyX6A5H4uS8qqVSAQOk+MjuqlUDhXKxnC0pbmnqmw9hx9XEjcjMp+QDvkvJ4qXIgHhBdNqQOfyNR3ASOxTkWV5XpbPDrynnSdIBY8/nK8zd014glBOiLpYQ/LA/jASDF0FGcrhOBgsza52uYPDLtKSleJVtvbTkkTTOx+zBhKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1OIwrCYbbWa3eDjyIl5rIHpqqyiUCgUqfof/Df9KBrw=;
 b=2OW3+/nQ1u/5ZeUtaUzenrqZIOwfW9mlgBN/q5rIGVNgtE2E8y0bVggqzxk8PcF/yaDYc2mwHBlcfogxLmr+lq/+4j6oxAU0duExX+KKgtG8XppVSMgRghb/ItKmRc7JtKSOg27OreDqNFrjGV6COLHX+pc3tJ6sVxr/+p55j0c=
Received: from IA4PR12MB9788.namprd12.prod.outlook.com (2603:10b6:208:5d5::11)
 by DS0PR12MB7679.namprd12.prod.outlook.com (2603:10b6:8:134::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Fri, 10 Jul
 2026 07:03:47 +0000
Received: from IA4PR12MB9788.namprd12.prod.outlook.com
 ([fe80::aac5:ae06:3bf1:36db]) by IA4PR12MB9788.namprd12.prod.outlook.com
 ([fe80::aac5:ae06:3bf1:36db%5]) with mapi id 15.21.0181.014; Fri, 10 Jul 2026
 07:03:47 +0000
Message-ID: <77110e77-941d-4173-b2f5-6f3cf4858339@amd.com>
Date: Fri, 10 Jul 2026 09:03:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] firmware: scmi: Make SCMI arch independent
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com,
 vincent.guittot@linaro.org, Souvik.Chakravarty@arm.com,
 Alex Shi <alexs@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Brian Masney <bmasney@redhat.com>,
 David Lechner <dlechner@baylibre.com>, Dongliang Mu <dzm91@hust.edu.cn>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Guenter Roeck <linux@roeck-us.net>, Jonathan Cameron <jic23@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Len Brown <lenb@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Lukasz Luba <lukasz.luba@arm.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Pavel Machek <pavel@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan
 <skhan@linuxfoundation.org>, Stephen Boyd <sboyd@kernel.org>,
 Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Yanteng Si <si.yanteng@linux.dev>,
 arm-scmi@vger.kernel.org,
 "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
 linux-arm-kernel@lists.infradead.org,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 "open list:ENERGY MODEL" <linux-pm@vger.kernel.org>
References: <d7f7e8c9589d937b60e43168845ab4fda15037a3.1783603600.git.michal.simek@amd.com>
 <ak_Eu_eQKalPMwo-@pluto>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <ak_Eu_eQKalPMwo-@pluto>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH1PEPF000132EB.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::2f) To IA4PR12MB9788.namprd12.prod.outlook.com
 (2603:10b6:208:5d5::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA4PR12MB9788:EE_|DS0PR12MB7679:EE_
X-MS-Office365-Filtering-Correlation-Id: 7edd8c88-10db-46e8-1e23-08dede51635b
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|22082099003|18002099003|56012099006|11063799006|4143699003|3023799007;
X-Microsoft-Antispam-Message-Info:
	TcucLGMdAsF0T58YXs/YEYscMD4qevO8ie9QnpSi8c7frQ/1vlFaoe3xJiilkma8Dtu6XijSfQxkx3UGw4vlCYEqTu8xv1ASL+R/+qcTY1DMHZknSU1AYG10j1BRT9C+yiFZJJLxMHIFqSBtTqnfLi/yYRgWww0XvrXWMeiwqGY62DkQUPW1/cVBzE6FfWHiI+iesRLH/kY25QPzeI6+js5yFSF8SIdNQm6nKm/WiMeyCJgG/I4MuXNbWL8syB+/Kr0aFtc/vBB2MfG5s7JqJagvlzT7W4c9VoCX1sgX67+y4O3XeUkJCXQTNwHS18DAzf3GtV+HbBE4UtCrYlLAweksIcWnrD8EZCgdh1X4OcYgB/LgDGkbSbDYMpKEweOKXDuF8IBSzjvKUiDicFj0VCJ2HCB71tmpPwcI/kXmhhYYaEej3GogzoS46Hol6rWNOrTEEunrs96Qya0jpP3hkqP98znMRPzvpgMlczub+dNT+14TP7Az6U+fRx0MnIv4ZQ3/Ln+d38KOlUMrvo8/forwF53YfaLGqmA+dUPPUdTaJFh2EbnuH5T8iFgeZiNiL12kKuPT606/Lxu6kBotZB4ikQhegWn0/CHlhMfRMmTk9Vobh/HLzMsA/c75c28xojQAQUEVuXWpc300wnYSyV49u+gzIbme+xlVCAIoxBM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR12MB9788.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0lSNVNzVDdHQXNjZTRTamZ2bnhTVXVwUm1tci8ySmtabElZUE8xYWlKbW5j?=
 =?utf-8?B?dDRXVU9ZRkFwTmFuV2Npa0I3WGFYdkZocmpJdHY5dUlmTmJ3Z2ZLZXJnb3Na?=
 =?utf-8?B?V2hoTXJkWUlqQ1VNOFZhMzJ6M1h3R1hUWlgvSGtSS0JtVnV6WG45YmR0L0Nv?=
 =?utf-8?B?RUY2UExCZTFKQXhETGF4NUxKRVJVbVR1czQvVDMwQXNlQ05iUi9LUSthajVO?=
 =?utf-8?B?N2ZycVUrdXhwZEFoczVheTk3ajBTZTc3MEdZRUV6OVE0anRDTXVHQTdiaVRm?=
 =?utf-8?B?aHRaK282Qk50WTNKT1ZRUTBQOTVOMkdXc1dWcTN0SDNIWVlBSjRYb3IwcGRM?=
 =?utf-8?B?TEJ4UktrRTFpc3RVZ2EremdQZmVjUEp6M3VKQkdQY1o4eUZBVDNIU2FWbnlX?=
 =?utf-8?B?M0o0WDFGeE1ycVd4SkJreTNITXl3c2lpUEwrR1EzWjBINUt4Yitla3ZaYmd6?=
 =?utf-8?B?OFhaVU5neTZzaW5ONW9zbVN4Rk1pcmpzV3Q1aFYvZjREeWp2S01IdjFpSVh3?=
 =?utf-8?B?ZGVGWEZvR2dtSlFLMGE5eDVFZm5xWVRZbmZMSm1WTHkxZUR5VVkrN2E0MU1V?=
 =?utf-8?B?TGRGeGZ5Y1RGczd4UE5xUXVCUWNwUmpMb0ZSem5DeEdZbEhwVHhEVStKQVRG?=
 =?utf-8?B?R0NxVytCZjdrbm5HSmxnUDZONzRUOS9WV3VlaTgwWU9pOHFjMU5ISW1mVkFm?=
 =?utf-8?B?dFdxc0JtMU1TaWFlNUVuVUVlSkhsUlJxTCt4cHFveFVzeFBwSlhNdmpjNlhV?=
 =?utf-8?B?ZTVPbUZlWHp5MENhbXM4WWdZUm1lSUNSK3ZQYXJCcmgvbFpTZHo5MG1VeTNx?=
 =?utf-8?B?c1podlEyaklLQkdWc3VIejdOblRpVnNPZDNsNDUxbmNvVm40K01RbW9IbjNF?=
 =?utf-8?B?SEhodU1EbkVtQ0NXbk8vaUt1aFZ5eWZ4a2JrY3EwTnpyNWZ0ZU9YTlBnZU5B?=
 =?utf-8?B?bEdxb3NVVjhFd21aR0VnbFFnVnhXTHAvcXBUQjhpdS82L3QwdHJsY0JaaGZN?=
 =?utf-8?B?MTkyY1R4VEhoODRUUWFFbHRxMU5FNG4xcmNPQ0dCOEduL3VoKzNVTHE5UHhL?=
 =?utf-8?B?d29TaGRDN3o3OXBRaTJlT1g1OHRZd2doWGc1R2VhS1o2OXBWd3JKT2pYQTNy?=
 =?utf-8?B?QTZuZmpFV2VHREpPeHJhb0lSTmcxKythYXN2Syt3MUU0NktIdDdhSmFUUTRy?=
 =?utf-8?B?RDdYaFR5RU5wUVU0VnMyQWE4WU5EaWpTMFZnNGlhMW9Zci93UWt4RkoyYkhM?=
 =?utf-8?B?VWRPMytGUnlPZGxMcmU5WUtRcHBoQ2hZNHh3eCsvWTdTMEJ4NW1FcGlKT0cw?=
 =?utf-8?B?eXZpT0VJcFJDRU9KVUV4YWNsdGNVWWMwOVo4aEFpbi9ld1E4a0xQb1krVy95?=
 =?utf-8?B?b0dJd1I0cUVoK1YrV1d1VkJQcDZWZ3NyN0plV1NiaXUwYzlHQSt5UHh5QnRS?=
 =?utf-8?B?Z2lMNzJOS0pNNXVYbUsrQURBTEtwTmI1RUtLeFVvVjRHME9UVHRZbitwUWw2?=
 =?utf-8?B?RDgrUWZadklOV3BTQ3VlUjhua1NwSU1QUXNpdEUrY0R5YXBnaktrS2lQd0N3?=
 =?utf-8?B?Y24zVnF4bEQ4UTNDd2hQMEhFbDlPYUtBY2ZscjJRbjd5QTRaV1VZKzh1ZGdY?=
 =?utf-8?B?SUx0RGtkT0RFenRyV2RudUJ4RWEzWmVSeXIvUXM1bDU4enBYWGxRaVA4Q3NW?=
 =?utf-8?B?UkRYcnluN3BGRnlHbEovU3RxbU9rTnJNbHBLU1BwR1JrOHJ1TDdIOEFFYUNh?=
 =?utf-8?B?SHh2SlBiZml1MnJFTUpxT21mdHFIVml1NkJXWGdzRTF1OS9NenZhU2ZXS2FI?=
 =?utf-8?B?MjVMT09rYW1SVCtjaVBTMWtOUXF5dGU2TTgwbk9temlLTXJadlhnWS9sa2RR?=
 =?utf-8?B?YXJjSWJNUDd6b2lIM041bm9EVnF3TUhTaGJ2QWF5UURLcHNYeURiSjRPZkZS?=
 =?utf-8?B?K2NHank1ejU3bGpTemdVTFRCakVpbmpPbDRUNGtQUVhPTXFSUzVDcXhSVXhR?=
 =?utf-8?B?MXIvMVJ1UkJQaTVMTjNDNjk4a2R6b2I2NkhyWXZHSzV2UEJkQTY1UlpYNlZX?=
 =?utf-8?B?VklZblZxK3k0em9NdmM1N0NBc3VxQk5uUXM0Y0NXYnMvNW0xejNaeUtTKzly?=
 =?utf-8?B?SEZYTms1cklNNzZCNEd0TW5KMUp6UDJBUVJ0L2tOdTcyQ0E2aEtpeVZydUpR?=
 =?utf-8?B?Z296c01aUzcwWHpQWjgxT0hIRXNvamVCYWsxRkFIOW5NY25HN3JxUE9SVVRu?=
 =?utf-8?B?THExRzBJMXFVdmwrcU53ZjBTMFlJUzhtMW5yUWQrOWN2c0xxUXFwRXRacVBO?=
 =?utf-8?B?SzFMU0wrWWlOcUEwbFFjbmlMZlBRL29RUFpuMElRcTRTMHppZUphQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7edd8c88-10db-46e8-1e23-08dede51635b
X-MS-Exchange-CrossTenant-AuthSource: IA4PR12MB9788.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 07:03:47.5143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pGwg4Zmxlxv1kUOzO/wGqChYPeeGvG3JXJCTnPQX/8IERJ2m9qGUZvEO01wTMf7i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7679
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39792-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[45];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:cristian.marussi@arm.com,m:linux-kernel@vger.kernel.org,m:monstr@monstr.eu,m:git@amd.com,m:vincent.guittot@linaro.org,m:Souvik.Chakravarty@arm.com,m:alexs@kernel.org,m:andy@kernel.org,m:brgl@kernel.org,m:bmasney@redhat.com,m:dlechner@baylibre.com,m:dzm91@hust.edu.cn,m:festevam@gmail.com,m:Frank.Li@nxp.com,m:linux@roeck-us.net,m:jic23@kernel.org,m:corbet@lwn.net,m:lenb@kernel.org,m:lgirdwood@gmail.com,m:linusw@kernel.org,m:lukasz.luba@arm.com,m:broonie@kernel.org,m:mturquette@baylibre.com,m:nuno.sa@analog.com,m:pavel@kernel.org,m:peng.fan@nxp.com,m:kernel@pengutronix.de,m:p.zabel@pengutronix.de,m:rafael@kernel.org,m:s.hauer@pengutronix.de,m:skhan@linuxfoundation.org,m:sboyd@kernel.org,m:sudeep.holla@kernel.org,m:ulfh@kernel.org,m:viresh.kumar@linaro.org,m:si.yanteng@linux.dev,m:arm-scmi@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-clk@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-hwmo
 n@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-pm@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[michal.simek@amd.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,monstr.eu,amd.com,linaro.org,arm.com,kernel.org,redhat.com,baylibre.com,hust.edu.cn,gmail.com,nxp.com,roeck-us.net,lwn.net,analog.com,pengutronix.de,linuxfoundation.org,linux.dev,lists.linux.dev,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.simek@amd.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,amd.com:from_mime,amd.com:dkim,amd.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D84C3737ECD



On 7/9/26 17:56, Cristian Marussi wrote:
> On Thu, Jul 09, 2026 at 03:27:00PM +0200, Michal Simek wrote:
>> On heterogenious systems like AMD/Xilinx FPGA there is a need to talk to
>> SCMI server from different architectures than ARM that's why remove
>> ARM/ARM64 Kconfig dependency with also remove ARM from description and
>> rename folder to reflect it.
> 
> While I understand dropping the dependency on ARM (I always wanted to do
> that and test if it worked at all on some otehr archs with QEMU), I am
> not sure about the whole renaming party ? why is needed just for
> cosmetic reasons ? it is at the end an arm originated protocol so I dont
> see it as a being wrong to be named as such even though used by other
> archs...I have not really strong opinion on this...

I have been in CC on U-Boot RPMI patches which got to my attention because
I don't want to have another interface for MB-V(riscv-) running in programmable 
logic and have another server in the system doing the same thing.

Based on that we had discussed about it with Vincent and Souvik (we missed you 
there) about using SCMI on non ARM platform and both of them didn't see the 
concern to be marked as ARM only protocol.
Truth is that some of protocols have ARM in description, file names, etc but 
some of them not. That's why I think it is good time to sync it up and enable
running this protocol on other SOCs.

> ... my concern really is ... wont this full scale rename simply generate
> a lot of un-needed churn for future fixes and/or backporting ?
I don't think it is going to be a big problem because it is just git mv which 
git is able to gracefully handle.

Thanks,
Michal


