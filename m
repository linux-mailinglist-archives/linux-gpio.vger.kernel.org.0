Return-Path: <linux-gpio+bounces-33221-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBBjCEZrsmnSMQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33221-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 08:29:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7474A26E5D2
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 08:29:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D728F3051D2A
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 07:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80A3D3AF66D;
	Thu, 12 Mar 2026 07:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WwwYzV5w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012000.outbound.protection.outlook.com [40.107.200.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B2A33F5B5;
	Thu, 12 Mar 2026 07:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773300542; cv=fail; b=OuuZwyrkTStrolbRj5EKuYZmuIRWHr2cN3kkl1MXEhH0YX0yaUmWhXo3eLgtgbTtPoGuCqamJlc5fmRPxoc8jNaylMu8ZEqNQcPtl/iJ7q/S3CtEgGnHPHbCt2bSeoI2pBxaZVw4y8DDMyQDCssIjYaS0EIg+66lPKBcfVvKPFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773300542; c=relaxed/simple;
	bh=6BOY+3ZsKs0sOgT7hraalxagCJw6IueaBtVYR5tkjnc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TZnEWLUp2Py2P7nilH+Na6RO7vxddApc2FUDkKnpPJAu283EW7VbOva8rjEJtKo0+BM09Jl43u1pjvLUkaVbPlIGfzJEPBxb42cO4G91altCyVjTCH1y4KNKTKk1vrPVKESrjbVWFPHT6UOIPMLZkn43sEPsXKdZaCjzh8qnOXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WwwYzV5w; arc=fail smtp.client-ip=40.107.200.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YI8BWaJb+o5+GYvupMsMFWbx+BG7maYD2F4LMKMc16M9IQoiUiCicEZ+RHcF70MTS3FtDBN+CCYE9jUr76+FBv2a/lagRchl/M2BevMRNoJdAG4rKMNOnmSnAOFXWKXgzREuTSZEpzzhmo+atTZbN9QAp9v7TrB4EJoKB1RxGSgwtHr5IOqP82VGAKbdlC5XPaNZi79Y66iWKyXvPaEergztww/h2SS0kisxuzcoz/IkdfcnB2PRO//mefmY0b+3BV3E5ZQVeIu0pELueEM0r1S+EhIkk3+muzZHQClj2Og0LILPbK15gujV0HeL6T7eqcdP3vK7c50DrTYtRbgpcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/9azDxvxlyu0AGAWR/wtM/stY/3N4uFIPlGbGd0i2Z0=;
 b=Dsp14UvPpKxtvL8KfC9xMssG4+DSSwdPsZkO7jMZp2xYSRjTBswJw3suH9Seg8Xzed30KMi7rZOuUzQkl7utU4veIvrqbk2/vjzlZS3LDGUmknRC8acQ+OFfg8hubX0DMJxxNK7QJ501GdomylP/5p53Q7h31fL4288JRZqQcAxcU5oOpH4aixUuHDVH1psI5mrHzwQshatJxNngfOYvbwvBUxWvpqKBM32LGA/DONUc4Dkq9s6he2/DUEu/yLC9FQYjksRJSZiP7yal0GXxF4ksQPIeiziepJ59K8nzmPpAx4VG6BIpe36o0UjE4JS5t/ifIjiSrZxTnumzU+ghBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/9azDxvxlyu0AGAWR/wtM/stY/3N4uFIPlGbGd0i2Z0=;
 b=WwwYzV5w6UKzdSoEzVhxRsX6/Q+s30kTzYybgTKrYEsPZC0KZfdJgaIxGfPjG4lAXi2eYTpytSvkHRWYpj+scanf4zzLqi85J9dswpVxyXowwTPDPNtTyBkoRgiHzyErng293tDn7OcCFgVJVAj7xMy6jN99WPtqkR3T4D0UIvyoJuGRmUF8a9GJubj7a8IG0FDTs6WgkUkofND1NxkJwfDlOJkqw3c4YlX2QGCPQ+RtmnN22yFEhEGIR2FJHlUWG6C7f9SJgBygy/t7TqLpDd6K6qvJMw8eueAl9EEASKe101f34VJkVxFTtOBsWvrbTNvz6H0xrCmzcC7+CtxbgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by SN7PR12MB6910.namprd12.prod.outlook.com (2603:10b6:806:262::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Thu, 12 Mar
 2026 07:28:56 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9723.000; Thu, 12 Mar 2026
 07:28:56 +0000
Message-ID: <64f6e02d-c7cb-40cb-b1fb-2d3523433c66@nvidia.com>
Date: Thu, 12 Mar 2026 07:28:49 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] gpiolib: implement low-level, shared GPIO
 support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>,
 Mika Westerberg <westeri@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andy@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Alexey Klimov <alexey.klimov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-3-b51f97b1abd8@linaro.org>
 <921ba8ce-b18e-4a99-966d-c763d22081e2@nvidia.com>
 <CAHp75VevThmDMm6VoVB9P0YbUGGGsmgnzr2gn9=1xtJZt-kuQw@mail.gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <CAHp75VevThmDMm6VoVB9P0YbUGGGsmgnzr2gn9=1xtJZt-kuQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::9) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|SN7PR12MB6910:EE_
X-MS-Office365-Filtering-Correlation-Id: 58178983-a39c-4c15-5c8e-08de8009051a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|1800799024|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	j3qQHS6GXcDs5HW7SCLqmzDtzZqODgydlf0deYoOYI3zulaSDcvWmMEhKg64Rq+65jyUyezsdyp+ORqtWoQEOcsM1LhQVL8d60S8U3ZpAPIFEEZ3wwJMFUnPop5vRDzrVJcCAYxeEkT69SOib4AZnWWDS5VsttVo+eOe6lIzxT4shTXHaj9WOiRgoREPk1IlUlCAqV7IZtP/4MzuzU/zb3Z9gyi3xImyZEQjDPEzqUNYafhvT7vxHWAWQ7DR6RhOvuUPCPSLg85GR4itbXdamP8OVSnT1Le+9esKnqhVX2FILEuaGSYGx5LB4z3S3e82oPqgSfTq1vzgI59Ha6yghGsJ6LWdGNd4HzjceZ+Jpo4yGop1l2GobNcoo0QGkhxMsKEwDoT+lplVfuirMy/Hrnt4RHDgBZozZIErZPHItnDptjD0K42Zy1dFCjIpo0kNjFmUBgnoPc4eSCe5SUscabuVL7FHjV9B37Spe8Bui2ZrLBIymOHnPZksZeRyZx8oL3AgzlVp1nMdA185KlwwA95SQ0dzm6GgPt0/8C1Ec0FrPTc+QeE6rEQvFMOq6dwP25LS2xX9tXycdYkuMwKFYWbBmPKF+83qTieOaOdU6lrs+rj6ES5B6kJR5hOSgeIfFBlCksS582TS2N64SQQ51zCCn6mouSm1z0u7EWoJIfbO7C/AOb1YQk18rWubpGSkLTuGcJNT/SVydKx15RRB4G+gKVjEIzXFJ+05jQi8TqQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWhLbXhBN2FmUW0rQnRuOVY4UXR4ZDlNUTNWN1EvclpLNWU3TFprZitCTXov?=
 =?utf-8?B?VVFsN1lqUWRCWUhTRFE0akFpT2NQK2hkYUllZ0NmcHFMVnoxNUhjMHVnc3px?=
 =?utf-8?B?YkZQYUdXRm9DNlI5VVpMazVpdnhuSENxYjB6ZDRJSkd1RmVlaXBBV1FhMysv?=
 =?utf-8?B?ajJRWFRwN1VVaUFtc0I3dmYxVUxsQS9jb3Jtcm1UWkJOc1VGU1pXTkpMczRS?=
 =?utf-8?B?MFVnV1NDZWh3NkNvU0F1WVFlWisyUUNsUTdyMWlXZ3M4aElpL25qbUZRWXFw?=
 =?utf-8?B?TmhTVWVYRHJxL0Rwc1hIcnJMc3VTTFJCL01xMHZVWTQ2RUxDQ1BGd3djZEZm?=
 =?utf-8?B?R2Y4OTZMQ0pBNjFjSnNRckxJZzM5SFVMOGFkc0dkeEl4b2FremN3UVBNT285?=
 =?utf-8?B?TkM4YkZsblJ4eEFDKzMvODViL1Q3cWk1dGc1U0dMa1VuUkJUYzBaOXlyREZZ?=
 =?utf-8?B?Y1RSMTdVZHhqTis0OHAwd3ZwMEVyQ1hEanViNDB3T3VWdHpxcktja0ZRZy80?=
 =?utf-8?B?eXBaelVUaDczczhSMFlOU0VvaXBxRDZDOHZJNVViZ28xZGVQb2dBWXZjakNm?=
 =?utf-8?B?YndkT3R0b0VOc1lCUVoybkRJZWpiUHJTYmJjR3dnNnRUZC9naGJCYVVaYy9K?=
 =?utf-8?B?RGt3RzdMNTl1ZkZzT0pLSzhLOUI0QWl4WU5QWTZTbHR4cmRUWXZJNy91N0dN?=
 =?utf-8?B?VEFYampYenUxeGs1bmI2dVY5ajlsZ3VxL2NRMUNxc2tsNkRReGpoRWNWREVw?=
 =?utf-8?B?OW8raUFVdU9URHdTQlovK20yQzFOUXd2aUE1T3ZPNmFZMTlPY0lYei90RU82?=
 =?utf-8?B?My9YQmhNVzNTaVAvVHR3OUVPdTlKQUNCRmNmengrN1FpNmszaVVnTWR0Q3d1?=
 =?utf-8?B?NHd0RCt0TjgwaGVsLzllb0U2TC9vZkZKdU5xQjJ6b0tqOVY1WWlNb25PRWZz?=
 =?utf-8?B?MmZKcmlPR0tZWEVKc3FLdnIxYjRYRnZ0VkZjL0ZNM3p3bDVTZHZSbWRyb0dl?=
 =?utf-8?B?VnpoZlA5Ull5MGRFYnBMS2h6WDFFYzBjZWR4aXlacy9ZTk9LSm1kRHhQUVpl?=
 =?utf-8?B?R2M3TjZrWEhyN1hPaCs4YUllOVFHTWZQSG9VVExSaFdMQ0R5Kzk5QU13R1Zl?=
 =?utf-8?B?RDJveDdtdFFwa1Raa0twVGdiekZQU1dIcGdYMlZPb2g3Y2UzalREYWJpdXhM?=
 =?utf-8?B?MmZqbG9wQUNiTlF5cGxWMjJrUEY4cU90WEN6UXlrL1ZhTjhKaWZibzRWZDlK?=
 =?utf-8?B?VUpFVHRBQkNRYThaQWhnYnRJeU1tSkFob3pnWDRJRzZWWVI3UmVvQ0FGc3JB?=
 =?utf-8?B?ZnczMjZ4YnBRa3VUUjU5LzVkTGpBY24zSklQeUJKTkY1Z3lsMHlqOWx2RG9y?=
 =?utf-8?B?dVJEeWNpeWRpenFYS2ZTRVY3MFlKK2hyK2h5SGdPNjk1NFJuQXRZS2RCMFl3?=
 =?utf-8?B?ZnZ5Qk1qV2xWNUNsNks5SmdXOG50eEJKQlQyWWRSeUltdVZuQWZ2M1R4MFpE?=
 =?utf-8?B?Z0VkNWd0aUg3UHBSMXBMcmx2VndjQVo0Q3dOUVJkZ085RTlLaGR5S2xWSVlo?=
 =?utf-8?B?cDBGajJxYmFCUEd0b1hjWkRoeWs1K3dEQmpvUXJLbldHaUg4ZS9ZazRIWXpu?=
 =?utf-8?B?NWZ3bWdNYTF5TXpwQWtDZTJPYVZUSkNKNUNYNUNlYi9WQlhaM05xVENHRUZj?=
 =?utf-8?B?eXRmcDAxSVo4SUZweC9maExLaGowREcreVBuRTdQYk9OSUgvMW1Ta09EN2ox?=
 =?utf-8?B?ZlVmUGZyaGozMjI0cE1XNHFFcVdJSEo5aCtNQ2RleVpTREtmSGFoOENnMWJP?=
 =?utf-8?B?cTVNWWYwdWdoMDJkQXlKQnQwMitZQnQ0VUV1VDNQd3dSaWRGRXhQZWRQWThE?=
 =?utf-8?B?VWZRYjROanZkcThVSkNXK0wvN0E2Y3ROTjkwMlZTRy9aMXpnc2l4VnVCRTBH?=
 =?utf-8?B?ai9rUFBSak9BOFg1ekd3SUJBL1Z1VzhSSkRIVHN6aUg4SUhQeUI3NjRFSFAw?=
 =?utf-8?B?N09kdUR6VTYxTlBucmdMYnJMbHh5cVRKU0IvZmNxSW5TSzJDQ0RPOVBOYzVl?=
 =?utf-8?B?KytBTEZjYkNUTGpGSm1mRlNBYVlNRG80ckcwSnFQNW1ORVlZUXBCM2hTSVBX?=
 =?utf-8?B?SWg1L2VUODlNQ1krc2FSK2FDSW1reUN6dFZpdWYzK1lJYXR3UFpDWUR3UElZ?=
 =?utf-8?B?NlFVRy9SVHhqbDZSQ0M4eXdvV2E0K25FTG9aallsVUczb2orUkQ4cTFBZ1lO?=
 =?utf-8?B?VS8xa3VTc3pObW1xb2RWN3g5bVJhVEU2ckE4ME9SaWRwL3hLZHRmb3ZHdS82?=
 =?utf-8?B?dC9SQ3BCeDF5SkhINVZNcFdPL2E0THUrbG5CdCtlZVowZ0JCMWlhQk5MVlVw?=
 =?utf-8?Q?tSl0D79KlTYu8kTwcaAt0wbaK9JEJ0VOl9InoO9hWJEzk?=
X-MS-Exchange-AntiSpam-MessageData-1: 8z6zpuqrEyFIdQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58178983-a39c-4c15-5c8e-08de8009051a
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 07:28:56.3638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7pZRk0elVgnf4CyIHDvkAAR0Ek8GM1Re7fVwXYHDK245izDoPYgjDhq3Dsti5fDjhLJ0ERU8c5iZxyyqOSxmJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6910
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33221-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bgdev.pl,kernel.org,gmail.com,linux-foundation.org,linaro.org,google.com,linuxfoundation.org,arm.com,perex.cz,suse.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathanh@nvidia.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,Nvidia.com:dkim,nvidia.com:email,nvidia.com:mid]
X-Rspamd-Queue-Id: 7474A26E5D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 11/03/2026 20:14, Andy Shevchenko wrote:
> On Wed, Mar 11, 2026 at 8:38 PM Jon Hunter <jonathanh@nvidia.com> wrote:
>> On 12/11/2025 13:55, Bartosz Golaszewski wrote:
> 
> ...
> 
>> On Tegra234, the main gpio controller has a total of 164 GPIOs (see
>> the tegra234_main_ports in drivers/gpio/gpio-tegra186.c). The GPIOs
>> are assigned a index by the kernel from 0-163, but these GPIOs are
>> not contiguous with respect to the device-tree specifier.
> 
> If I may ask...
> 
> Why? Is it sparse because there are pads that can't be used as GPIOs?

It is purely how the different port for the GPIO controller are 
configured in h/w ...

static const struct tegra_gpio_port tegra234_main_ports[] = {
         TEGRA234_MAIN_GPIO_PORT( A, 0, 0, 8),
         TEGRA234_MAIN_GPIO_PORT( B, 0, 3, 1),
         TEGRA234_MAIN_GPIO_PORT( C, 5, 1, 8),
         TEGRA234_MAIN_GPIO_PORT( D, 5, 2, 4),
         TEGRA234_MAIN_GPIO_PORT( E, 5, 3, 8),
         TEGRA234_MAIN_GPIO_PORT( F, 5, 4, 6),
         TEGRA234_MAIN_GPIO_PORT( G, 4, 0, 8),
         TEGRA234_MAIN_GPIO_PORT( H, 4, 1, 8),
         TEGRA234_MAIN_GPIO_PORT( I, 4, 2, 7),
         TEGRA234_MAIN_GPIO_PORT( J, 5, 0, 6),
         TEGRA234_MAIN_GPIO_PORT( K, 3, 0, 8),
         TEGRA234_MAIN_GPIO_PORT( L, 3, 1, 4),
         TEGRA234_MAIN_GPIO_PORT( M, 2, 0, 8),
         TEGRA234_MAIN_GPIO_PORT( N, 2, 1, 8),
         TEGRA234_MAIN_GPIO_PORT( P, 2, 2, 8),
         TEGRA234_MAIN_GPIO_PORT( Q, 2, 3, 8),
         TEGRA234_MAIN_GPIO_PORT( R, 2, 4, 6),
         TEGRA234_MAIN_GPIO_PORT( X, 1, 0, 8),
         TEGRA234_MAIN_GPIO_PORT( Y, 1, 1, 8),
         TEGRA234_MAIN_GPIO_PORT( Z, 1, 2, 8),
         TEGRA234_MAIN_GPIO_PORT(AC, 0, 1, 8),
         TEGRA234_MAIN_GPIO_PORT(AD, 0, 2, 4),
         TEGRA234_MAIN_GPIO_PORT(AE, 3, 3, 2),
         TEGRA234_MAIN_GPIO_PORT(AF, 3, 4, 4),
         TEGRA234_MAIN_GPIO_PORT(AG, 3, 2, 8),
};

Each port can have upto 8 pins, but some don't. Note the last number in 
the column indicates the number of pins for a port.

>> For example, in device-tree, if I have a shared-gpio with the
>> following specifier ...
>>
>>    gpios = <&gpio TEGRA234_MAIN_GPIO(AF, 1) GPIO_ACTIVE_LOW>;
>>
>> The macro TEGRA234_MAIN_GPIO(AF, 1) evaluates to (23 * 8) + 1 = 185.
> 
> To me it sounds like a bad design of the driver for this SoC/platform.

I am not sure why you think that. Assuming a 1:1 mapping of the kernel's 
GPIO index to the GPIO controller + h/w port + 1 GPIO number seems fragile.

Jon

-- 
nvpublic


