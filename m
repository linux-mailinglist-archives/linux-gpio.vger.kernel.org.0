Return-Path: <linux-gpio+bounces-29098-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 597EBC8ABCD
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 16:48:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 99D1B359E8C
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 15:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA54A33B971;
	Wed, 26 Nov 2025 15:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HYrfLUSr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013004.outbound.protection.outlook.com [40.93.196.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1994833A6E5;
	Wed, 26 Nov 2025 15:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764172064; cv=fail; b=cj5nTJ+oYw1e9bvPvMnca+M/QmNIk3NGJPNKU9Z4j8Cmg/q/RN7c0frQuRd0uR13EPqbUMY5lsAi21KpM5fPz71GwzX7n3T3BjNANivhG/6uIxteOt5gsyOsZ1dPjOm7RSDohZFDqucC720A/X23DDicjzJU486oOQjNC8eZogI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764172064; c=relaxed/simple;
	bh=ux20kOAGLSdMxp3FAG7i6FRPAqmpwWIMTKOrVn9Db0s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Fg8W0DFkVb4BzdtAnGAKt6xowpquDJVABmSG8/KDnuPurlL7uXYdpu6g258C0iytWL6fKWljbeVr9jpMqNQ0VeUykemnG1mqqUbkYmWQF6cFGe/cENWZCPgorQkyVMXpFFXKEjgOMVN3wdf04fYmcjGfle+fLkJ9iKRuMVSW68g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HYrfLUSr; arc=fail smtp.client-ip=40.93.196.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c87G7idahMFIOCwAVaFQfvNPtwwaZW08WRHUFtXEQiv4FbFIGxFDMVPHIzImKd2D7pBzBtBYNr3OyfR+d2DUfQ2ZeDNzf1CYzHsSpPhFRKegRMP5a9PDYyQ95IgYOkUm9RdiPdZvADk2uC13R797ZdWEJ7qDfO7zk6IUI2St5Qv4No/vGHNj9XB73NNHeHUEfurG1SsqvkTjtsJs5St5IqxJxRYb9YTLZqiD1ADtAFE+O78HFx92+MMXVxhIgnFna8Sq53kGfR6X9Ubme4VMVJUOE+taRdzjGy7BoElgo3ZJQ7NCIPT9DzCBfwfvmaDUAMVZEqlXc03s180Q8F4EXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QXvTazOd+XkWGZAW04skcdntL2lR+h9zsTS9cUQsKKI=;
 b=ga+H0lZMhTjP0xrJnctvjHnvp20z5oZX39lrSIXG/OX3naLER4p8vRuhe6U7ZFjOoT7Nrt+ymEySejYGqBRFllRFEOCCrodWp9/rAU+dgwuF3W5V///x820TVYv5ZORNTmgFljf59V/0aqYmXAGi6AiLpr1csB37qWCYlEv09VsN7Js55/wuFkw6CBxfdLnHEg4vHzp+V+1HzYNUHhLik+Ql4xARYuV1O8KpWwaESZMYyqKIiBNbCnxDmqs/EUzkCx/zVNPnUxFl9eYoCqsCvE0OkFI0Rs8gks+EtEm7/8oZlFCWgNgHzE812/VsgSfCJk4NNtbMjnzXl27aSpoPmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QXvTazOd+XkWGZAW04skcdntL2lR+h9zsTS9cUQsKKI=;
 b=HYrfLUSr8mAtynkIXEqoVgPukidGSWuGUT4I3JFFwYOL9xCMfHUFmO9f9ivG5P6GvhTleG1AU/bYM2vaYrQqzEI1RAyJt5MJg6en9GKt297lo6lA3bv0wH/2cRqAZ+8ja16MzitJcWyXYPqxCDUaz0XPYXSSfZPzyQjtz/yInyM+vYNmM6i/4zxqImM8jultqC6hyTDGoOFGvw7womucj/nB1QCa8B3QCf7eKoal+aA/t9cgTFBb83nk1nrrGK1qCxZBoK8x9xlVuDImD0ElcslFXsAAt5Br8PfRGYjNyDHOYbAwI9EzJQJjnN8KmWTlDxDJvevmnlJxnJeoXwKCJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by PH8PR12MB6723.namprd12.prod.outlook.com (2603:10b6:510:1ce::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 15:47:38 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%7]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 15:47:38 +0000
Message-ID: <b166f160-e4e2-43a2-866a-3341cc91a13e@nvidia.com>
Date: Wed, 26 Nov 2025 15:47:28 +0000
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
 <c4081961-0875-4a2d-ac84-40df128534e7@nvidia.com>
 <CAMRc=McSrKgL=q8xfH_Vndg7rCfy1TVgRh+dFRqFCiBwT_J2yw@mail.gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <CAMRc=McSrKgL=q8xfH_Vndg7rCfy1TVgRh+dFRqFCiBwT_J2yw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0619.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::19) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|PH8PR12MB6723:EE_
X-MS-Office365-Filtering-Correlation-Id: 36bc498a-c47f-4a3a-21c9-08de2d031fed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VWVSc2U3STNGQ1hqM1ZHQWVNU2lobm5JMTlyQkE4QmxtTHlTbmNmanhlRlNB?=
 =?utf-8?B?eVk1bGNMczNvNXFVS0FWVzVKaWM1dDFLUG1wcEdMc2NIbHltd3o5R0tBMDdZ?=
 =?utf-8?B?d0NYTXR5NHVpalk4YTJzVCtMZ1NSaG9VNmxXQS9LVkNVcE9YK0FXeEh6Tzcy?=
 =?utf-8?B?R0RERnRWc3E5R3krdUxTNml5MUx2VjVUb3Bvdkt2Mm5ab2k2L2VEMmJ0MEQy?=
 =?utf-8?B?TGZUSlNHd0Ixc2xhU2t0ZW9lREhNSzcvVFlJczJISGNibUZ3WmhieWd0Qmlk?=
 =?utf-8?B?ZWZGRU5iZmpMdVlndGcxWjc4MmZzSWxIcnJIcXRPdXVqMzg4VHRyMHViVTFO?=
 =?utf-8?B?OHZlRkMrdkQvYm9JNzRsNVROUytKcmIyMkhXT3ZFT1ZOdkJKbStNVXdISk1u?=
 =?utf-8?B?dWE1V0NyMitYSTg2ZmxxN0ZISmdWM25RRVkxVWd5cGM0TVpJQTY0emMrclpp?=
 =?utf-8?B?Q0ozamc3VnNGUkI4K1drNXNIbE83a3hIQkcrWkhzZFVPN3lZc2pCNzQrVkZ5?=
 =?utf-8?B?OVppa1I0MDZyN0hSRDUyM0dtcnNWMXVtQklrQll5UENOSU5GanRWdUVkUDZU?=
 =?utf-8?B?ZWliL1lXYXZaWnVENmhVc2szYlc0dDdhOTR6LzNCQ2p2VlErTjh3R01DVEI0?=
 =?utf-8?B?M0NvSG84cm5PSkNabnIxenkwVXZUdEZpK3FpWlpGUERKa2lSaVkrb0g3UXVI?=
 =?utf-8?B?R2UyamhjajE4M20zeDVuVWZKS0F1ajl2YlNYMS9PNGRUcVRraVdGS1RMNCtF?=
 =?utf-8?B?ZkxWdGQ2Q1RvUHhab0V5TDZVcmhOMzlkNjhhdGx5dDE5Y0R2WVplV2VBVEdt?=
 =?utf-8?B?Q3J4eU1XOWQ0bUk3NU1vVmxSOFdjRm9FdnNOQVJWQzBOVlRpV0RnU3lXMnRM?=
 =?utf-8?B?SVgyRGoxZ3hiNkZ5WGlJbnU0c2tSSDQ4QnpqdUZQTTd0M01Mc0ZEOGFFajBS?=
 =?utf-8?B?U005Z2x3eTFoVE1XcjBDS0VJYWFxK2psUzVkS1hlSWlETWduSFNQMG01TTYr?=
 =?utf-8?B?bWRaUXNnODE2Rm9hN1N1UWtXZHFNZXNTQ0lyVWFyNGFWckU0SE5ISkdjODNa?=
 =?utf-8?B?cjh0cHl3Y011VkRHUHZkd09LT3czNXBJTmdQWFliMFIyUlJnOWphK0wwSVhX?=
 =?utf-8?B?U2lWSGlLM1JUS1llSHYxK1cwSTVyaDYzMUFLVUkvSzE2ekhNZmNSeVJLTWxP?=
 =?utf-8?B?bjRsaisvSUluNGdCNHFEelc4NDdqb2h5cnN1eWM3aVRVTEoyWWhMS21mMzY1?=
 =?utf-8?B?TzVIUUM5SThTY1UvK1oyUUpnaDNPMGpvMkNYYmsvUGNSbUlFaG8rUER3MlR2?=
 =?utf-8?B?UFI3VmZ1d25hS0hQdk1ZUzVHeEdZR3NrQkM5R0hpMXZMYTdjVFp2TVE2MU4z?=
 =?utf-8?B?d0Z2QUtveTl5VW1vTUM3RHZtQk5LOWQvck14ZHM1Tzc5WHQ2c2tibUpLQjl5?=
 =?utf-8?B?TnFUUTlLY2pUcnRwcndHaWFWSzNsbnA4d0c2WFVkZFI5U2s3d0p6dEp1ekVO?=
 =?utf-8?B?Z1F1ckR3MEF2NWEzaDlzRXdpRVk1NlBLcHhaT2dyYjZ2Q2llTkdFSEVCM1hm?=
 =?utf-8?B?VXdYVG1sY2Y3L3dRVFNnWktSTHhEaGM4UjluTVZFY2FUZGRha1RwVi9RK29l?=
 =?utf-8?B?NmxleHV5MWx3TE9mY3IzU0hkZzRDSlc5ZU1CV1RLalNzRUtVaGZmaTg3ZzBH?=
 =?utf-8?B?ZHU4S3o5R2ZDU0JoN1ZHcS9zNy92VjlxdGc3eWVuTWdaMVkrS3grdDNnWG9D?=
 =?utf-8?B?a0pjWnB2TC85eXYwdExxYjgvVGpCcUVuemhZeFNGV2hNbFdjeStSWkVoRklt?=
 =?utf-8?B?THh4U2xJWVpDYlIrMGQ4UStOYmwveE5INnZERVdJa2doN01HdmJ5RHRhV1Yr?=
 =?utf-8?B?UjUrdHNSNE8vOWphQjJzK2NjUmhnQUU3dFdFWCtyL29yUTJuQWZ0emdZeHJU?=
 =?utf-8?Q?eb7glFSr2caSTK9x6rp7qQMu5O6fp6bx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d29ORzN4Nmd4dFBCcW1RL1FpWFVwZXZIckVoT2JmdHVRcURDTDhjelM2QUg4?=
 =?utf-8?B?SkFFQ3h6SG9wWE1UZE8ydS8vNWdFSDBHV1prZkxkWEp4VHovdXFhbjFJMkh6?=
 =?utf-8?B?bml2dm45T0p1L0oyVlAvdDNVdGRHa2dlOUl4dkE3cGxFWERocmVKNDN5OTV4?=
 =?utf-8?B?MThJOW5tVDIwelJGSzhKbkZOU3g1RHYxOHlQQmVNZ2Nxd3pmaFVSRzhtZ3BZ?=
 =?utf-8?B?aDB3NHZ1eUMzWVVvdFhBcml5ME9yLzZwRUJ5TWJvNDJUOENGeEhpY2kzcUFj?=
 =?utf-8?B?dk5TSlRzYWVUOFdXZTVrT1h4eTc2RlFQeWR5N21hUGh6NjBLYXZRSFFwMnQ5?=
 =?utf-8?B?eXV5bDhlV0dqZlBOTVJjQWJRVU1jb2VlcWVvWEY0RzdqdTNMRlZCWWdISDAv?=
 =?utf-8?B?ZTNkbEZHamo0UVFrQlEwbWllczV4UTFqVWs0eCtCTkJKODcrdG80dUxPTlN4?=
 =?utf-8?B?TzJoME1kZUMwcWl3eGl4eVhBdWcrS2lWZUtnMU1XVUh1YkVTSzRUQ3Q0TnJw?=
 =?utf-8?B?c0F6amo3NG5Lb2ZCUTdqdTVBVXhMMUlrSUNXRGlHREhMcFJpVThIQmxEbE5s?=
 =?utf-8?B?ZG1YK002aW5veGxER1JzRlZFYmRvNnFHRXdkSVkrQUxtTUlzYlgraC9TMjlq?=
 =?utf-8?B?RUoyWXhWQmpaaGMyNnhtVzFSbnNhU0UwWE1uUUlkRUpxMmlCQWpJOHJpemtr?=
 =?utf-8?B?ZE9IRDZPcnBJSzFKMUVZQ0M2UER1eFhjZGUwRWpJMWVoTTQ2djVzU2VqSXBU?=
 =?utf-8?B?bEtlY21nUzVFek5nMzBoTUFBMDV5MVE2bm5lS0NUUGppc0dMUXJYVDV1Z1U4?=
 =?utf-8?B?bm1wanloTFRzTFlUTWhzWnhXZm56VG1zYmtEQ2JrKzNqUXpMeU1icGczNFFD?=
 =?utf-8?B?Q2Y1dXZhbzFzZnJ6L1htMTBLQlJ5TG1GMWIrWWx5dklIMG1EOUcyTzluWm9D?=
 =?utf-8?B?QmJYMFdwQWxaUWF3N3liRnh1K1VtY0lZZkw5bTNWTHRXMFkxOFpyaHZrOVZV?=
 =?utf-8?B?czhQeGlhRHJWaUpab0x4YUkrU1BLRVNrclhLQXFxak9HY1RVaWF1Q05LNGZ5?=
 =?utf-8?B?dTdpcXpMLyt4YUQzTVVhcitWbVlpTmFjWW9nelhacEZkbWZCRXRRaWRGdGw3?=
 =?utf-8?B?WmtPdUtLeTh5Wnc5aVZWa2FSQjd1d1V3TkdVSUxOZnpQSGNtWTh5RVBuMEh1?=
 =?utf-8?B?akljUGd0ZG1nNmQrWVA5WE1wUktLQmNjeDRtb1ZPMkVZTXJCWkJscmNqaDhZ?=
 =?utf-8?B?OVo0Qmt1S3ZTV0pQbC9GaWxqNnhaKzY2NEVaZkduSjMzTms5RFVUTitIR2V2?=
 =?utf-8?B?NDY1Q0JBZElEV1NlcjNUSEJlSlRxd3ZRVU41MEw2SmE2Y0hDUTRteDdZckFj?=
 =?utf-8?B?YU5VSVd5aHBxYzlhOUZvWWM3VzFNNDlPVUNYMFpoVm1iSXJWMVYvQmd4RDMy?=
 =?utf-8?B?Qm1wS3BOVzMvOXYwMGxsNGJOVlNrdXJCM0VuVDdvdXdkNEdqc1RCWGpxTGlt?=
 =?utf-8?B?OXJXUVBiNlZlSGlxSGpkdjJQNVpBSi9SWkhGdlBsd0czOE8xQlB4cW1wcVkz?=
 =?utf-8?B?d254OWE5QU1vdVVkbTY0b1hrMFpxaVlnaFRlVEQzRXpiU2dXKzEyZjFZS01L?=
 =?utf-8?B?WEdzZ2VNWHROc0VBeGF6WExXVGF4ZDQ1QWtVSjZLRm56V0h3WUh3ZXNWcEp0?=
 =?utf-8?B?UG1FQmNxU3RNS2tEM0NwYkZCNnhnNXlRUllZTHdQSmliRUdhWjA1Wm8xUHJG?=
 =?utf-8?B?dzZjSlVGQU5vS04rR3llTm1abi9sdXdjTVVJaStBUHA1ckRhOFA5dU5hVzhP?=
 =?utf-8?B?RjNYUVZITVdIUTA4VFdIYVRYZENSeHRwRkZlZmk0QVZIL1hKaWIzZlcvZGdY?=
 =?utf-8?B?dkJ3MEpEUFZBNzA0RERreEg5NFQ5d1ZIcFZpMmYyVVNHNlBGcUxEUy9qcjR2?=
 =?utf-8?B?KzE0REEySkJFcEJwYTBta1RBQlRiUVBKS3JLalpONjM3NnVKZ0I0SDFiNklT?=
 =?utf-8?B?cnF1aGkxRmlWdTVzT2tIZ3ErRmo0THpSVzczeXhWM0NIdTdxbUVZdDlxcWs0?=
 =?utf-8?B?VDNXLzFCZTNzZ2k3M0dQc041ZEhjRmN5TVNWVDh6Q2dmNzliN1Rkdm9pYnFB?=
 =?utf-8?B?QThzOTVYOHhOUkpRZDFoZGxhTmtmdmhaWUpleXp0RmFnS0d3cVovcG1UZzB3?=
 =?utf-8?Q?B0hLP8Ps2YMGwSajRmIgPEDkhvSNV5xYDLsigannR6H+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36bc498a-c47f-4a3a-21c9-08de2d031fed
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 15:47:38.0029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NPgjEFZNVkHbGoLZmBuhP/Zxa7y5zGFzK4Lx/4EkVACWV6anq+MuVc4wx+HYG8a/H736VWOzBbnoJrWTmhQyPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6723



On 26/11/2025 15:33, Bartosz Golaszewski wrote:
> On Wed, Nov 26, 2025 at 4:29 PM Jon Hunter <jonathanh@nvidia.com> wrote:
>>
>>>>
>>>
>>> Is the device-tree used here upstream? Can you enable DEBUG_GPIO in
>>> Kconfig and post the entire kernel log on pastebin?
>>
>> The kernel log is here: https://pastebin.com/7rBh3T3T
> 
> This is not telling me much, can you try again with the printk() I
> posted earlier, please?

Yes, sorry I missed that before kicking off the last test. With
this print I see ...

[    0.120432] gpio_shared_of_traverse: /bus@0/ethernet@2490000 phy-reset-gpios
[    0.121407] gpio_shared_of_traverse: /bus@0/mmc@3400000 cd-gpios
[    0.121891] gpio_shared_of_traverse: /bus@0/host1x@13e00000/sor@15b80000 nvidia,hpd-gpio
[    0.122035] gpio_shared_of_traverse: /bus@0/pcie-ep@141a0000 reset-gpios
[    0.122075] gpio_shared_of_traverse: /bus@0/pcie-ep@141a0000 nvidia,refclk-select-gpios
[    0.122342] gpio_shared_of_traverse: /regulator-vdd-hdmi gpio
[    0.122381] gpio_shared_of_traverse: /regulator-vdd-3v3-pcie gpio
[    0.122420] gpio_shared_of_traverse: /regulator-vdd-12v-pcie gpio
[    0.122453] gpio_shared_of_traverse: /regulator-vdd-5v0-sata gpio
[    0.122486] gpio_shared_of_traverse: /gpio-keys/key-force-recovery gpios
[    0.122551] gpio_shared_of_traverse: /gpio-keys/key-power gpios
[    0.122615] gpio_shared_of_traverse: /__symbols__ gpio
[    0.122672] OF: /__symbols__: could not find phandle 794981747
[    0.122701] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.18.0-rc7-next-20251126-00002-g1cd98992c487-dirty #21 PREEMPT
[    0.122739] Hardware name: NVIDIA Jetson AGX Xavier Developer Kit (DT)
[    0.122747] Call trace:
[    0.122753]  show_stack+0x18/0x24 (C)
[    0.122772]  dump_stack_lvl+0x74/0x8c
[    0.122788]  dump_stack+0x18/0x24
[    0.122801]  of_phandle_iterator_next+0x18c/0x1c4
[    0.122819]  of_count_phandle_with_args+0xa0/0xc8
[    0.122832]  gpio_shared_of_traverse+0xd4/0x4c8
[    0.122848]  gpio_shared_of_traverse+0x178/0x4c8
[    0.122860]  gpio_shared_init+0x11c/0x1f8
[    0.122878]  do_one_initcall+0x7c/0x1c0
[    0.122892]  kernel_init_freeable+0x204/0x2e0
[    0.122908]  kernel_init+0x20/0x1d8
[    0.122923]  ret_from_fork+0x10/0x20
[    0.123055] gpiolib_shared: Finished scanning firmware nodes for shared GPIOs

Jon
-- 
nvpublic


