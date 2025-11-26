Return-Path: <linux-gpio+bounces-29092-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CB528C8A83F
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 16:04:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BB1314EB719
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 14:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C154D3093B5;
	Wed, 26 Nov 2025 14:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UQprDHTC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011044.outbound.protection.outlook.com [40.107.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176353090DD;
	Wed, 26 Nov 2025 14:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764168970; cv=fail; b=Kke6sFj9GRDkgNm2e3NNPdtHoNWxUP4VFRTnXL/o/88pAvI6V4ExRwhrz+2dmRl/6oDAh9vh5rNS5eHB2YgkMQMR83hN/l/Ez+fNulYlC2XZtJhpBLYylK328/PnPkbeK5svCwEBHyFf3/FcD0O5N0W7OM9B/5hGEevNW/XSSy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764168970; c=relaxed/simple;
	bh=c+tvVD9XkuvQSuhj1dXxt8ElBkpZiv2in9spaIsCRa4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YgRKew3qxTe8HtdftFk21ne6bcVA4pjLOlfZKiBO/ipG+ew16lerLIuYnhfwbZ8yWz7DHYbyfwoxvRc/MbgetWUUE59RTM8w2SkGzJZnlzfRKc8EedIu0W0iJbjk1ecQ/En0wvtlwrLqdWKppyZRjkAQ3XGdVnaTdIGdicUENu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UQprDHTC; arc=fail smtp.client-ip=40.107.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rYRxj70kTD1zHLrJLasaudVXMxdun3WLHlUZOo4YP/CljYdfj4x6gBNDk2RUQQb3qn+NheiC5lcvfUqx86uW4Lut39LzRcXgCqrOtPrOn4w4kBk8Jyg+Jk7HXT9UawgeZKOscoMOrNrAtrM6Ae3Qsq1kDX2DKtFOqnrRWGf86CF4mM14RKkHtXehSpwaiT25Q8fENdx0crAG9ZeppE0LyeFqEG+HDY8CJh41GEJO6LuRt6G4ZM6V+NqzfeT/4SOlh7rZnmrfXnf24ZK5ahfpR7ZTnQrP2poi+IUDgeQgluO0BuhDVwlH7KtLlSGIhLb/VR5Iiue+pwoq2WrLdfl45w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+DvicmPYhzh02ip+yVvamyCQPV9VD77RMkavKi3/Ihw=;
 b=xBmluwOVKfRGwjRTfkzwN/kluM+NdmNk2TAKkMKgokBbONEU/UPxJKqzuvCPLGRTJ5LYDVdWhSkLlIR5AvUhYo6RCWTqlObEqMwHDkN9zIgazr89MWUKF7G8Anbx/34Az21Ng4Ye6PulQqK7qlj39W38KX7TAON6uEHwaMwlXf0Oq3/fOzhBHc2m+Dx9nbOzK1krIOzApWehQuvHKaVQBt1IEORXN5ywfTVEmVX0fYjMFK7LSwsMa09MOiH4Eky92NRSdfWpkkCXn0Me1xfmVFUdTgmO5Hg1a7is1jYDLNBZVU5lhS/UUnP/M6Ij6WG+kXzkPBeY5A3SwGBN+A1Qug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DvicmPYhzh02ip+yVvamyCQPV9VD77RMkavKi3/Ihw=;
 b=UQprDHTCmTEfO+UIcQ02rk8/MBh3UgD5LMQ/h4ZVER3BavAW2AyB/8gR4WepV9P710mWjqXn6DWxkg5kyCUsMFtAEshoJnwaW0Sd83QoRZuWAtOYRPvp8IxS9/OCqdHlupUlnJXUOYo+P4BLhkHL6MvEdI7PvDz93NyDA9qn4VH0btCJDLIh2XVJ7cXrP+ORd/Bv9QiWi/YNt9mT2nanuQr4kCmQ/0/EXiZUOP1ywJItbgOZjJIphO5oEYvAC0ek9lX1pGvK2lOI+YkpmTDOoOqkeig9qKzEzu2/M7OrmT0exMistTelpCbKzat0HMIH5JfgpGa64IQDUZiF54Gjqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by MW4PR12MB7192.namprd12.prod.outlook.com (2603:10b6:303:22a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Wed, 26 Nov
 2025 14:56:03 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%7]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 14:56:03 +0000
Message-ID: <d56ac97f-24bb-4ea5-a46c-a07dfd0c9e62@nvidia.com>
Date: Wed, 26 Nov 2025 14:55:54 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>,
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
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org>
 <0829a21c-f97d-41b6-90bc-2acaec42caab@nvidia.com>
 <CAMRc=MdPvF+okfnRuwvAFG9UfyZ-araDsaaKMxKASEbc3rhyjQ@mail.gmail.com>
 <705186a9-a9db-46f0-bf2b-b499def050dd@nvidia.com>
 <CAMRc=MdQ8QgbdAd2sudZLgcDZu9DxBRJh5sfLeXwcTDEE0F7Uw@mail.gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <CAMRc=MdQ8QgbdAd2sudZLgcDZu9DxBRJh5sfLeXwcTDEE0F7Uw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0007.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::9) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|MW4PR12MB7192:EE_
X-MS-Office365-Filtering-Correlation-Id: d6afbd57-d86c-41f2-b112-08de2cfbeb32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NDVEMld5TnlZd1pPcEZmOXgyVE5kcWgwSUcxZitFOXpBdUY4Qk9DY0RXNk9V?=
 =?utf-8?B?cVRtMXErTGJCU0Z1SEFRdDUzcFU4aEdHK1M4ZEJkUm5hbWtlbGZ1VXE3ZFBi?=
 =?utf-8?B?ZitpZ0lGa3RDeWl1U2lXUEh3UElIdEVkamloUERObE5ueEhtajZmdHVqK3hi?=
 =?utf-8?B?T1lodVF5Snd3UnR0dk5CeGdOWUltNThCb2NhYjlSY2pJK010cjJqcXd1aG1H?=
 =?utf-8?B?d2pYVHNoYmw5dUFXSlRsTG0rdHFUVkZlNzJtM000R2FQbTB0cWtYTFNqbUdM?=
 =?utf-8?B?dFI4UzB0ZXFvTXIyVVN5dUFiREJzalI5QW9IblgzMlV0ZlB2UDB1ZjJVb21t?=
 =?utf-8?B?WmR3NE9BK2VhM2Y4MWNwWVlVd2R1eVJKRUZBU3N5SlRPOHU1a09TcUkyc0NH?=
 =?utf-8?B?ODBBZnRqZkYwcXpPWTJNTGkvYi9tQTlhQTkvcmx1bGNDb2dCSE42cTJNdThG?=
 =?utf-8?B?b2t0S3liY1oyTFh1d25BL2kvZjU0dWlydTllNllCeVBtM00vMzQyS29DUVk2?=
 =?utf-8?B?SlNMUDhxeTFKREVoTDBHSkZyV202L1p2ZW5tKzVmd1BCa1NDY3d1d3NVOGFZ?=
 =?utf-8?B?a0lhNXVxQURmaGxhZkk4OXMwemRIclRrMjlPSEtHaCtVamtESGY3Qyt4d2Q3?=
 =?utf-8?B?bUd1RXVNOHYxaCt6Mk5pdGtDL0VuWXZFeDJpeTlKV2VGa09MMDFrc21SMTZ5?=
 =?utf-8?B?UElsc3ZlTG9GYkpkaHJ4MkRwV1dTeW54TEc1S3NsMlRlc0E1NzljTHJ6c1JN?=
 =?utf-8?B?UG1ZZzF6NUdDWkpGbk9jNWlvcXZsUUpBeWtSdkZEUms5YlUzMzNNV3kvTUZa?=
 =?utf-8?B?c0FBejR6eUZDVDg5dFppWVdTRmVmNTVQSlJHbWFvcXRHaSt3NEVqSGwzNlVQ?=
 =?utf-8?B?WWdDaDhCNFd5Q0hXRzFoMXpSNTdaMFFOdzJWQVJXaXlGTzUwSFBhSHdlbk1m?=
 =?utf-8?B?NmxwdnhyOE9VT2RmalNvMzF0bTdhY2lIWGFxanpEWFBiMXBGTTloSWhoK09z?=
 =?utf-8?B?ZlUwQWhsSEFXM2dKcUhjbjdpaTFFRS85bTJFV1o0UmFPbXlHNjI1d2tOSmw0?=
 =?utf-8?B?NVB3aXY2YlBYZVl4b0FpSUpvV3R6Y0llVlBnUVdpQThobDNhUENwbHJnbFp6?=
 =?utf-8?B?WXVFbzNETzU0V3J3UEZwbHBHTnNyN3h5cTFlUitpSzNHczFIck9CWDV5Y3I2?=
 =?utf-8?B?aFZDRkxsbUJkTVZZYXZyR0JERWUxYkNxY2swZFduM2NXOVhmZkVZcUszTUVx?=
 =?utf-8?B?amV5RmFBN3l1STJsdHZaeEphTEdlSzFDNHNzRlhESzI5S2lUYjQxSWNkYVhT?=
 =?utf-8?B?SDJvbjByZ0psY2c5OFZiOGVLeG04VG12clpwV0s4TEgwSEhyMlE3ckJFbUhu?=
 =?utf-8?B?cW9lSHFOa3VzejZhUGh3cWJxcGdsZGpVQzVZMkxUakZ0NGh6TlpHMVhPYXoy?=
 =?utf-8?B?ektsK0RRZlQwL2swUjBlWGx2ZXV2dmJ3SVY5T2liWTVYT2UxQWxjaVMvVVU3?=
 =?utf-8?B?T2JkNkR6eHZLZHB1bmxjTVBudEdhR1dPS2k3VXFSajhoNTlYTHR2TGJmbzQ4?=
 =?utf-8?B?WTJidjJ5WHdJN2h4YWFRSmpXMk1VaEFBYnFzOUQ5czNTdXNKdnBSMDBPOGFE?=
 =?utf-8?B?Z21XSnhGcStiTSs2enBUMlR5bVNLOWNkanFyNWhtMTlwbzNJcWJlZmNaOW11?=
 =?utf-8?B?OXVaOG1mQ01paGJvdFA0NTVscTBNTkY4VGRJWmYxdTBUY0xob3ZBcFpha21T?=
 =?utf-8?B?K3hiTU42c29XY2VCUTdJYW1vU1ZlT0tsUStud2pOeTNmOVpRNmhBeENtclRR?=
 =?utf-8?B?Ujd1RzYwNVdHYTRtdEpPVUZXeEN6MGZ5aWdhdG9nNmRxSG5BTGVLQStjeTZ5?=
 =?utf-8?B?c1Rac0M2MXErQUdvVW9mVFloWDlmdVFScVZwOXVjOGoxcG5sZStTd2owbEFH?=
 =?utf-8?Q?HxWV3l2a0iEJE8xzyt3Ca5AfjRTi+Ziw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bG95NHl6bnJoQzl3MlJpZnlsYzROTklGQ2VYL1ZyWmdCbTcvWnpRN2I2cngr?=
 =?utf-8?B?M2hlcS8rTjZxNEY4QlIxeUlVSkNUV0VDa2RzQVBnRGJDdkV3TGJCS1NVV3Q5?=
 =?utf-8?B?akdMWEozZXV6T2pDMURUZTdpWFBUcjU3cTd4SG9Ld0lRWmJ1b0Y3NVRZSjV3?=
 =?utf-8?B?clFTQWdzbE44OWExSkJqbzRNYkNVZjhSVW05b0JCQ2tvUXdLQU5GRXVrZkUz?=
 =?utf-8?B?ZEpHLzA5NlhTb2pHTXZvQ3A3WXU5UDM4aUhDeHJVMTNTUlByZldJYkFDK0ND?=
 =?utf-8?B?V1FRRjNZUnNGek1QRWdjd2dhc2RNVWhKYnVtTE41VFBBZVJISCt2SjkvRHhC?=
 =?utf-8?B?WVoyYTJEU253cHpuUXhzK0hVN3VSVGp0dkZGRi9aRUVYSTZnZHZHVGVDMUtC?=
 =?utf-8?B?VDNZRGQ5QmFlQXJ5em9ubXUwclV3azJzSWFndUlvTmgrL3lpZ3dhTzFHMkdL?=
 =?utf-8?B?ODdFa2tXeGpWaXdRYkVUL25waExxdSszVWcrVHF6b1grNGZ3MXhCVnZ2cXZV?=
 =?utf-8?B?OUlqVTBTSlFkSjFiM1JhV25QSE45R0luMGlVZjlKTlhYRXlZck1XWGhYNUdZ?=
 =?utf-8?B?LzlvQXNTenNiZld4c2kvRFQ2Y0licjF6NjM5ZDE4MXFnL1pFaFVMNG43Q0I3?=
 =?utf-8?B?UWFDdk5OS0JvSkNTdk1ZMFlrNXhtcEs1ekJBV0YxdDYzMTBBKzNWYUhoTWs4?=
 =?utf-8?B?c1BUSkpBTk9xaWpLQnpjTUdxQ1JRSDVSdFQrV1VGTmo0NXdNV0xpcStaclp4?=
 =?utf-8?B?cjJsVkFycE9MbDhSU2JxcXo1KzNvYW5lWDhVWDFacG5hajlZQUhzbjJIMnBD?=
 =?utf-8?B?UnpwMlpZR1NYUTRIRzlTRDN3Mk9wUHIvME9JeW9NbzUzQXVSMmN6M0FEc3Zz?=
 =?utf-8?B?Q082dWd2M0kvRk5oeTJoYTBrSVJ2VGJXTTZLRGt2M3pMdEpWdjBXaEtJbitw?=
 =?utf-8?B?L0MvMHg2ZURaK2JDTmtBZk9JeU9xUkg0MGIvek1wajBHaGNPSDZjNUV3N0sr?=
 =?utf-8?B?WFJubkZCTFhORnNvZkZnR21KYWVaSTZ6elZoVmNvSzI5cENwMzJ5RFFuZG03?=
 =?utf-8?B?cC9QeEVreDlCR2h4dTdkOGZaVnptY1d2Wi9SbUcrdTNKSlFaQUVkcDVtZTBX?=
 =?utf-8?B?bnh0USt6Y2t5MVAvYTVKS3RVbUNLaGlFWW5FdmV1S1EvSEVtSGJLdzN4eksx?=
 =?utf-8?B?c3hCc2RaMjI1b1hOMEFhSFV0YU9CdVQrUmFIZzgzS1RzcjJLN1UxaWFDZzNT?=
 =?utf-8?B?MGxVR3ZRK29XeFFNMFJWYjdhajJXVmlSOHI4RWVzMWtBUUFYZ05nQ0ZSeE8v?=
 =?utf-8?B?ZkVqLysvOFc4NXZBT1JKY1FIREdJdmVBSGFJUFRQOXRNNUdFaTNwRkpBOElN?=
 =?utf-8?B?Y2tZSExiOFM5VllUTWdmQm1OVUdYVEtHaTYxVHhnUktEVkoxWTBHZ25JN3M4?=
 =?utf-8?B?eS9YMW9NWWRuM05MdWEzVG5tQXB0Qi9ybXg5MzRmdGtHc3dxVlR1ZjdsSTlY?=
 =?utf-8?B?Q0hLZW1zMndyMitMKzlNaVQwRldncFJOS2p0enU2NzVMN21oeVpUTllraDVj?=
 =?utf-8?B?dGUwRFM4d05VKzlPaGI5bWRWRXAvUW5qbnlRU3c0bC9KeGtmdGhPbDNJcnhS?=
 =?utf-8?B?WUQ4cU15a2xIclNJdzh3aGN2bGtPWXptVDRrZVg1NnpPMnlhUVRXQ1FVeVhq?=
 =?utf-8?B?WjZ5OTA1WjRrWXlUeWQ3WUI2UDlmUkxPS1dtOGFvQ0FvNkE1OFJSWjl1NTNI?=
 =?utf-8?B?RkNsWEZtTHJEK3drM0RWWVNGRC82N2dPN0VzVWxGeWg5YmVaYlU3M0hUdWRY?=
 =?utf-8?B?cEo5bTJDVVN4NkF2SWFtby9BYjR1MTIyUmlCdHI4SHVveEt6dG5SSnBhbm9s?=
 =?utf-8?B?YlgwQlBjS1dtaGNSRmphNmxLbWtlTjQrMkVpZWFwOUFmMnV6eGVETEoxajZG?=
 =?utf-8?B?dTVzWm5wc2g1SHhoTVBYc3ByVTlLYzhUSnZ0aTg1cFVBcUh3UVFuOEVkbFBC?=
 =?utf-8?B?Z3NYa2t4MnFKcDVxTThKSUNqYlBjOEF5NTF6Nkw1VitLUUx6aEhPdS8rclN1?=
 =?utf-8?B?UytCeUFPQ2JTN1NiR3I5c1o2b1plTFBKdnVKM1lySllLZFlEYmtiYnk0YjVO?=
 =?utf-8?B?MnRwRk91a1Q4cnAraXFkZ2o0RVFjMDVad083TkNOMitFN1d1Z0hYWXVRUHA5?=
 =?utf-8?Q?wfrywsoEgknVW/OSSX+nmeUoIY3PBURQiA0o0V8Jp/pK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6afbd57-d86c-41f2-b112-08de2cfbeb32
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 14:56:03.1217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qy5eNaXPbzBqTQSeDIBkUgxWwnETYKA3uP79xewcv3Ffg0PqRaU7G4awdpvkwq3xQpPytZHiXUm1FtlTKafRZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7192


On 26/11/2025 14:54, Bartosz Golaszewski wrote:
> On Wed, Nov 26, 2025 at 3:51 PM Jon Hunter <jonathanh@nvidia.com> wrote:
>>
>>
>> On 26/11/2025 14:28, Bartosz Golaszewski wrote:
>>> On Wed, Nov 26, 2025 at 3:24 PM Jon Hunter <jonathanh@nvidia.com> wrote:
>>>>
>>>> Hi Bartosz,
>>>>
>>>> On 12/11/2025 13:55, Bartosz Golaszewski wrote:
>>>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>>
>>>>> Some qualcomm platforms use shared GPIOs. Enable support for them by
>>>>> selecting the Kconfig switch provided by GPIOLIB.
>>>>>
>>>>> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>>>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>> ---
>>>>>     arch/arm64/Kconfig.platforms | 1 +
>>>>>     1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
>>>>> index 13173795c43d4f28e2d47acc700f80a165d44671..3dbff0261f0add0516d8cb3fd0f29e277af94f20 100644
>>>>> --- a/arch/arm64/Kconfig.platforms
>>>>> +++ b/arch/arm64/Kconfig.platforms
>>>>> @@ -316,6 +316,7 @@ config ARCH_QCOM
>>>>>         select GPIOLIB
>>>>>         select PINCTRL
>>>>>         select HAVE_PWRCTRL if PCI
>>>>> +     select HAVE_SHARED_GPIOS
>>>>>         help
>>>>>           This enables support for the ARMv8 based Qualcomm chipsets.
>>>>>
>>>>
>>>> I have noticed the following kernel warning on our Tegra platforms ...
>>>>
>>>>     ERR KERN OF: /__symbols__: could not find phandle 794981747
>>>>
>>>> Bisect is pointing to this commit and reverting this does prevent it. I
>>>> am not sure if anyone else has seen this?
>>>>
>>>
>>> I assume it comes from drivers/of/base.c:1295 - could you please post
>>> a stack trace of how you're getting there?
>>
>> Yes looks like it does and I see ...
>>
>> [    0.123356] OF: /__symbols__: could not find phandle 794981747
>> [    0.123401] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.18.0-rc7-next-20251126-00002-g1cd98992c487-dirty #19 PREEMPT
>> [    0.123418] Hardware name: NVIDIA Jetson AGX Xavier Developer Kit (DT)
>> [    0.123447] Call trace:
>> [    0.123453]  show_stack+0x18/0x24 (C)
>> [    0.123472]  dump_stack_lvl+0x74/0x8c
>> [    0.123487]  dump_stack+0x18/0x24
>> [    0.123518]  of_phandle_iterator_next+0x18c/0x1c4
>> [    0.123536]  of_count_phandle_with_args+0xa0/0xc8
>> [    0.123551]  gpio_shared_of_traverse+0xb8/0x47c
>> [    0.123566]  gpio_shared_of_traverse+0x158/0x47c
>> [    0.123578]  gpio_shared_init+0x110/0x1f0
>> [    0.123595]  do_one_initcall+0x7c/0x1c0
>> [    0.123607]  kernel_init_freeable+0x204/0x2e0
>> [    0.123622]  kernel_init+0x20/0x1d8
>> [    0.123637]  ret_from_fork+0x10/0x20
>>
> 
> Is the device-tree used here upstream? Can you enable DEBUG_GPIO in
> Kconfig and post the entire kernel log on pastebin?

Yes this is the upstream device-tree in 
arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts. OK I will get the 
entire log for review.

Jon

-- 
nvpublic


