Return-Path: <linux-gpio+bounces-39796-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eE8JIMajUGoC2wIAu9opvQ
	(envelope-from <linux-gpio+bounces-39796-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 09:48:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D60B9738270
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 09:48:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=u7QnlMr6;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39796-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39796-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44EC9304D77B
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 07:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 825713D3327;
	Fri, 10 Jul 2026 07:42:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011050.outbound.protection.outlook.com [40.107.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23BC3C9456;
	Fri, 10 Jul 2026 07:42:29 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783669351; cv=fail; b=hVvwOA8ibSbWp+DjhdO6S8L9aOwlS/mZeD9Kk7R+IIma2sxPCLvs26mC32v3gJ7GVPM75MgUm5VE1xDJ936TD//Q9rIxqafan4x/T5btUL9DcnA5k0/3mwBdJA7oPPTEehawGTMUZw4HPyLB5VmOS/c/fb1RkB71gcLsecEkerI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783669351; c=relaxed/simple;
	bh=LvdC2kNvEdKbNVNVc0A3HDZ0wR7WEFopYEOWcgBWAJk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=T2lffGHTLtzWIEByDGNpXc48rrAYi7TgqL8THSKI2T37ZgFjvaOj9rLHVRHXysg49U/ppb3VwAHFP+rKujQJCXcc7HChKLUuI0uJap5BwCef+5Cs442i2WziidvdiO60p1oJUxuMfGziKZCw/rSoGWP1yWHoyKNcmGnqHOPEO/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=u7QnlMr6; arc=fail smtp.client-ip=40.107.208.50
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dn6COs9b7of7hbGi1DLSJkfRAPl3dS5nzJpb1b6TQv4w34dnJhR4NBrUJZXRZkAy2uokr4ZdI2/z/zCIM6WbCpHgw7KjYv4xi9ugW11632NqIkOJT7AIkm2JJlKdKW1NRLutzjzrGu+EMZTpMOa7CR+4jDF/RLmim7l3cb6JbTxSM30PFIPLjUw8mmyJqd9tuM6lv35FrhA2AHDx/7iAH5kFnaSE/Pe1jpNgRObHSIFfIv2TYODhjTg+u6Ygry1+bWmmJMx+yEuD5jxC4c+GewJzqQPj+Adyj4IsABEFlLJgkjMV4Dzdmardb0NU2V2upbHCgp8oUsJWVekztbtrKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AhFI37C3T/6HM9KOHIzXrWH317mKq34+wLHxKdP3upY=;
 b=iBMCRXpfEuXEajP7oEfILyXxBoEAlqaqpa5uxFKEQT4UyiA4u1uuPhs5ZdXYGsRJ43MF3GkRRTXUcMIXIXXkGcxseIPJuk2JSN1VIQt5xGS7ZlJEzWmW5iqD5v1rf9Zdd5qlsxIByjWTnFohUPhjt8ZS3HfrbO4Uewd5t/qKpkpckEWuCkhtvkQDeVRIGWbnsISZNGF6d7IPda70iqt4ZCWkcCdebJdUsshtJl01iHjQiVW/uw838c8CkbLt0bH8+DQWhLhxMCxyBmCy3UoOqT3JYRAkoC5BQ0DLegpisiAp/kqOhKln5RKfW0UnuJmBTU/fsPhRrHF17HIw195iWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhFI37C3T/6HM9KOHIzXrWH317mKq34+wLHxKdP3upY=;
 b=u7QnlMr6QnyzE7BbwhORz3CvJOugNut1nRtCjt2Dw8GkPDhC06E/kBS77qEss24l3vq0CtqbuFS3VetqShDKnC6o8BO5j+gWBL9BfgBFjGQDRhZydyQcW6qTbFgjrp8ZsurCarE6oFqvPS6S+28fx/L+KGnNivbEAD2UP7ihLPU=
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by MN2PR12MB4158.namprd12.prod.outlook.com (2603:10b6:208:15f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 07:42:24 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 07:42:23 +0000
Message-ID: <5f5e8341-dbcc-4467-976e-35d007ae148e@amd.com>
Date: Fri, 10 Jul 2026 09:42:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] firmware: scmi: Make SCMI arch independent
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
 linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com,
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
 Ulf Hansson <ulfh@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Yanteng Si <si.yanteng@linux.dev>, arm-scmi@vger.kernel.org,
 "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
 linux-arm-kernel@lists.infradead.org,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 "open list:ENERGY MODEL" <linux-pm@vger.kernel.org>
References: <d7f7e8c9589d937b60e43168845ab4fda15037a3.1783603600.git.michal.simek@amd.com>
 <ak_Eu_eQKalPMwo-@pluto> <77110e77-941d-4173-b2f5-6f3cf4858339@amd.com>
 <20260710-lemon-pogona-of-wind-b3a003@sudeepholla>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260710-lemon-pogona-of-wind-b3a003@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0089.namprd03.prod.outlook.com
 (2603:10b6:a03:331::34) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|MN2PR12MB4158:EE_
X-MS-Office365-Filtering-Correlation-Id: ebb0b412-1ee1-4220-48ab-08dede56c7e4
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|3023799007|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hpsZDuM3wVLbZBVJcueud2/kQmWFmyrD9wUS7EvV0i0kJfVIftKGTYt73juaK5J5RhtceUXrvP5A6VGB078ohKTcbJbnxDzZidZZRVf0Oiy5EKSzf7kGpJCbsyyxSfSxbwO3wf4TOZYS6IDITYOyjqUXVq28Z1mbOaQwTQx2lsynRQ3BluOJSIfqgCS7xs4o7vbjBSUGq+LrS19goRsC59Kn/9m3pGLnvA+WHZQSdRazGRo6YDGW2vyQ05By4CRVghj7KWED/LXaszRMBaUkq/0Zfk22TYxu/XQcBVkGCoo0cMgDD76BIWAgPg8JcHwxuhB/KQXSjT+JeI9AyBhux3/zhFBaAyJyHiIxHHUiqADp8De3TAV7L8ym3bHURRwWXmZqb78C8kGyhzHOE69ILFN0gTTbDtrPS7QtfLDX4k+z4T69iAClS9sq74etqYyd3skz6eEGDLrhzSBFKJq6LsxOCS0Av33GOldLhBEIKAK2a0TQVi0cqoxBDVvUWP5QOxcNSWuo35yPuWuN4k4FyhzrLzs+cXEssCglmexYn1Dykmnuf/R8fxXbMInwGdekH10gQIovPOJ8iH7AMVCQ2d6AYoX4tSd76ZV8KpP7a+yPMgQdJGUIau4NM1w8cKSWzotCtLQs14T0pJ0k5KGFV2/aLA20YKXh6pQitvGkutY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(3023799007)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEMyR0xmZFdXdUxNYm5uSTY4djV6dzNVWjJXK3VVU3liYXBwejFPWU82VjV6?=
 =?utf-8?B?UHQySE51ejY0SmYrT25lK05rdFJjM3FLdjZ4Q1RIdmVvWk1hajhjTVB4dmdI?=
 =?utf-8?B?aE1zeEE1MlJqVUdsa2hhS2kvMGZxMHo4dDBZaFliakYvZUs5a2QzUkpIRHpt?=
 =?utf-8?B?M1FiMnZzQjlDKzJNTW9FRkNCdFhGSHBRMkptZWczUDdwWTR5TlJScUJOZitV?=
 =?utf-8?B?bW9odklWcDBrRXVXVkxISE1tbnlLWXBWbXNhb2V1b0tod1lBM3I0R1ZKd0R3?=
 =?utf-8?B?UitvcEpsRWtBckJWOUw1WngyelduVEkwMWowQm55L29vT2VYcWdMM1FNMXN2?=
 =?utf-8?B?cUF6TWNrbVArdW9NQlBQU0o3eEdibXRIOXkyWkRCSW9Ra1NjbThzcFdoclRK?=
 =?utf-8?B?OG5FV241K2k2NlFQc1doMFlWUWlYNE5uMHdpZllFK2E0VnArLy9uajUybDQx?=
 =?utf-8?B?NXNYMGt5QWRyRmlPbzFPaDNqV2tHVU1ZNW9aUGVNVlFrbVV1WHpBRnM5MDc2?=
 =?utf-8?B?TVkzQWp5d2MxNkFPMlVrdE00QXZzTjd3RWkwVUFodUlKVjEwSUVCTHBPOW1r?=
 =?utf-8?B?OWpEb1NjdkdzZG9zdFNsWFZ3bUJyYzVFRytqdFI0TmlyWDFQVUIxN3NVUG0v?=
 =?utf-8?B?SURXUHZ5ZWRscDhaYXZGbXVORWFubzJ0SVdNZm1YeEMwOG1ZRitwYStuNlRh?=
 =?utf-8?B?Sm5acmVRVnhoYTVqOEJnUEpqalRBUElUNk5oc2EvQWUydmFhWkhTSUZOclJt?=
 =?utf-8?B?VnYwa2ZOQWRUTStnK0JiN1ppMEM0MUlIbXFIdElSbWNZNlA3Mmw1d2ZSZWJG?=
 =?utf-8?B?YWVHWGp1WStFalNTRklKRXJ3Q2dnU3lVaVovWTVXdUtkdGdxWmRwc2l4eGpa?=
 =?utf-8?B?cFhvUmY2NWtlM0MrMkFINXVpdmNlVDZUVWliREV1L3oxSFRqb3ZITUMxbDIx?=
 =?utf-8?B?ZVpJNVNyMmZiTjh4R1VUUDBiUzd2UkUrVGZ1Sy9sUFpSUy9lcHUwVHo2VlBa?=
 =?utf-8?B?N3hZaWFFNllSRHdMRXFzbVZVcndhRTZ3V09IZXVkWTlZeHBkMVU1MlhxTkpk?=
 =?utf-8?B?UHZsbTFZWjM2Ykx4RTNNSUVrUDZlNUU5ZitUc1RGV1lqUy9waURRa0hvRTJX?=
 =?utf-8?B?TDhXRlQrNG9sWHZZTGliZTBjQ2YxQXpDMW8wamk3eVo4NWJxWU0xeE1NYVRi?=
 =?utf-8?B?QkNURTRMSWNFMHlMNWZFUkh5WGRMbVJXMXVCZmJsQzlNMWlMNS91LzN6OXNK?=
 =?utf-8?B?RlFuRkJhbEplMEVJbzc1YjF5VUNseXRraXpoQWU4N1BHeEpKS1ZMMGdwK1cz?=
 =?utf-8?B?NTNISnJoSzNOb21yRGxQNk0wSzJOVnFlUlNFMVJkd0lWN3ROUktKUlVBRzEr?=
 =?utf-8?B?SDBNNU9yVEE4eElsNlNhZjEvNXZLa1IrZXZwbVlNTml4TEJ3UEx4WHUyb2ZX?=
 =?utf-8?B?RlM0NklpOE5jOXpqak1VZUlvcTlicXRrdFNjZUdJMXgxRUJJSUlRd1Vxdm5k?=
 =?utf-8?B?WWJ2cnlpVTJiaTZTeitubE8rK01WV0IwNmpYNTF2VTZGY005UUYrZGNaZFVF?=
 =?utf-8?B?VjM4YjRWNHE4YlVHc3UrTWtrdlQ0UEZaeW0yS3VMVUpicFJpb3NNZFhVU2xL?=
 =?utf-8?B?c2VwbzlQTkV0aFNORVFydWdYN2xqdlc2MWJLWkFvOHJhY3hoK0ErK0g1bHNz?=
 =?utf-8?B?b3lkYjM3M1VyMXJxd3Mxc0xoejR2SnNkaGRmdWxuZDZWTVc5ckN2RFo3Z1Zt?=
 =?utf-8?B?S09Mbnd3eVF6UVZxNFNlWnhILzhMbWJTWFRSQUFWMWFURi9tQkxsQ01nenNm?=
 =?utf-8?B?cGNoU2RxQ3RXU0U5ZmREMUtKamRxb0VhSDM5S2xpS0dtQTRIRGh2QUh5ZytQ?=
 =?utf-8?B?UFpTdWgrcFk4UkpOeU1lcERybjRIbXN1bTVuWmxvYzBsa2l6RWkyeVEyWHg3?=
 =?utf-8?B?ZU1JUFpsb0tmc2NUVTNjOC9DZFl0WWNaRzhOeThIbUtqc0FUQ2ttWTdvaHRw?=
 =?utf-8?B?WDQzd3BSclBaT1JvUHkydjR2RC9UdnJLVVVzQlpWYnBNSnN3bjRKWkFqYkNN?=
 =?utf-8?B?SWp1VGF2V2poaXZybysybXRDSldQZDM3cXowVG5nR0QvYm15MHBaOGlTdExu?=
 =?utf-8?B?WitGNjJ4Z0Ywa0NzNGIxZ3dNaVk4UXROd2xyVmtxTm8xeW92Y0I1ZUFGRjVM?=
 =?utf-8?B?TDArTDV0cm8wRm8xekthQjVjU2tJcnhCV0NWL0sxN1RISC9JdHBUd0RPVjFm?=
 =?utf-8?B?UzRQcGVlQk1jamlObFBReE9HUHl1ZlpvRUFrWW96Qk8wK3J2M3lOOFdUbHlw?=
 =?utf-8?B?bUF6eVBsSENRaHB4VzJFNU14VC9nTWRIMHpMbFYyN05hcHkzRCtUZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebb0b412-1ee1-4220-48ab-08dede56c7e4
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 07:42:23.7427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I+A6QGwOZpQEOYfOPNWntgCYRW/dUjXtu6Rn+i5cxVqQ0ceNKl00513SaNZ2CeQG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4158
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39796-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[45];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:linux-kernel@vger.kernel.org,m:monstr@monstr.eu,m:git@amd.com,m:vincent.guittot@linaro.org,m:Souvik.Chakravarty@arm.com,m:alexs@kernel.org,m:andy@kernel.org,m:brgl@kernel.org,m:bmasney@redhat.com,m:dlechner@baylibre.com,m:dzm91@hust.edu.cn,m:festevam@gmail.com,m:Frank.Li@nxp.com,m:linux@roeck-us.net,m:jic23@kernel.org,m:corbet@lwn.net,m:lenb@kernel.org,m:lgirdwood@gmail.com,m:linusw@kernel.org,m:lukasz.luba@arm.com,m:broonie@kernel.org,m:mturquette@baylibre.com,m:nuno.sa@analog.com,m:pavel@kernel.org,m:peng.fan@nxp.com,m:kernel@pengutronix.de,m:p.zabel@pengutronix.de,m:rafael@kernel.org,m:s.hauer@pengutronix.de,m:skhan@linuxfoundation.org,m:sboyd@kernel.org,m:ulfh@kernel.org,m:viresh.kumar@linaro.org,m:si.yanteng@linux.dev,m:arm-scmi@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-clk@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-hwmo
 n@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-pm@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[michal.simek@amd.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[arm.com,vger.kernel.org,monstr.eu,amd.com,linaro.org,kernel.org,redhat.com,baylibre.com,hust.edu.cn,gmail.com,nxp.com,roeck-us.net,lwn.net,analog.com,pengutronix.de,linuxfoundation.org,linux.dev,lists.linux.dev,lists.infradead.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,amd.com:from_mime,amd.com:dkim,amd.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D60B9738270



On 7/10/26 09:35, Sudeep Holla wrote:
> On Fri, Jul 10, 2026 at 09:03:32AM +0200, Michal Simek wrote:
>>
>>
>> On 7/9/26 17:56, Cristian Marussi wrote:
>>> On Thu, Jul 09, 2026 at 03:27:00PM +0200, Michal Simek wrote:
>>>> On heterogenious systems like AMD/Xilinx FPGA there is a need to talk to
>>>> SCMI server from different architectures than ARM that's why remove
>>>> ARM/ARM64 Kconfig dependency with also remove ARM from description and
>>>> rename folder to reflect it.
>>>
>>> While I understand dropping the dependency on ARM (I always wanted to do
>>> that and test if it worked at all on some otehr archs with QEMU), I am
>>> not sure about the whole renaming party ? why is needed just for
>>> cosmetic reasons ? it is at the end an arm originated protocol so I dont
>>> see it as a being wrong to be named as such even though used by other
>>> archs...I have not really strong opinion on this...
>>
>> I have been in CC on U-Boot RPMI patches which got to my attention because
>> I don't want to have another interface for MB-V(riscv-) running in
>> programmable logic and have another server in the system doing the same
>> thing.
>>
> 
> Ah that's interesting. I wasn't aware of that. I still agree with the move
> in principle, but how does that align with these:
> 
> drivers/clk/clk-rpmi.c
> drivers/irqchip/irq-riscv-rpmi-sysmsi.c
> include/linux/mailbox/riscv-rpmi-message.h
> drivers/mailbox/riscv-sbi-mpxy-mbox.c(Should be fine as it is just transport)

I am having separate discussion on u-boot mailing list about RPMI and it's usage 
on non riscv architectures because one raised argument was that it is community 
driver spec compare to SCMI which is owned by ARM. But IMHO only for riscv.

> 
> Now I feel we need some alignment before making $subject move.
> 
>> Based on that we had discussed about it with Vincent and Souvik (we missed
>> you there) about using SCMI on non ARM platform and both of them didn't see
>> the concern to be marked as ARM only protocol.
>> Truth is that some of protocols have ARM in description, file names, etc but
>> some of them not. That's why I think it is good time to sync it up and
>> enable
>> running this protocol on other SOCs.
>>
>>> ... my concern really is ... wont this full scale rename simply generate
>>> a lot of un-needed churn for future fixes and/or backporting ?
>> I don't think it is going to be a big problem because it is just git mv
>> which git is able to gracefully handle.
>>
> 
> Otherwise it may end up being unnecessary churn though I completely agree
> with the git/backporting aspects. Just don't want to churn things up until
> we have some plan and further changes/users of this move.

As I wrote above AMD/Xilinx platform with SCMI server where ARM RPU/APUs (with 
multiple VMs) and Microblaze-V in programmable logic acting as separate agents 
is going to be the first user. And for being able to run SCMI on Linux running 
on Microblaze-V I need enable SCMI on non ARM architecture.

Thanks,
Michal


