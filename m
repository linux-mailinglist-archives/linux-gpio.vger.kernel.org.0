Return-Path: <linux-gpio+bounces-29095-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DC5C8AA56
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 16:30:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 494B64E57CB
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 15:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E761331A5C;
	Wed, 26 Nov 2025 15:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uN90rsMT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011016.outbound.protection.outlook.com [40.93.194.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DE1303A20;
	Wed, 26 Nov 2025 15:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764170960; cv=fail; b=hRumZCtdxllrkQap2g3gp7rulS1/EdKWQBc+XyoZNJPbaLuzMrvnfVOlJwgOkShrWJ5E8/ZQjDz9bg+JEO2FUtcqmYyKr5wn4PkUErQs2oiOVUyXEdxpfrgEliWGGQkO9NpIJuTj8CT4V/qqfzMnQPIPKnBhce6TVsfm62h6BI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764170960; c=relaxed/simple;
	bh=IMi+aCE5rnys9z1WgQ2oYUtXB8nUvxgnRfoQHbt1X8w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GrVpQD8mYJ5uuiSuqZ6vwfLfLXDHu6CIAVfFEHHED4mnDodZba4ZcuxZSvWOqWUnU/F2PwJQixVjrXJVMZaHWznJpoe1S2OwUj2MIheUo+M8kYgKGLIXeQVSPI7jFwtDM322jj/VHmdqjtURfQoor6gUKsYaZoaUGi1KcD+f0cA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uN90rsMT; arc=fail smtp.client-ip=40.93.194.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XHQE3GtjtXK59ju7FWaqN3Dj8OHmrxPbYUvHLLPWwdsFtCqbVLAKux8k3u8FZl9NzxVAWP/XDSL658py2tlWXm8jVKkE5gYwpv1jd5cT8YZhK3+LPGWquY4sMcyfxCSUUXqa6pi5f3GkMWfByi3vCQX+IpWQ9IsDWW5RFGGaFC/zrAt9Ytc4xXvwF0fUZjd8kqOB5bc19vnUt5iZvjODPui/tpB0EgclHdK45Mn0oi6LwhcB5ueGY877P5dDCZHYTjpgU3pOKf5P/eNb4Q10M71qRdIkGZMmc3lAJBhfGG09WoqyptWCA+6c6aaAmaEaws7YjwzyXEN8SWyVBf+zeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ROrOQFbEwHNqV+alHJJ410Ksj76oLH5LiVFlbIGYsnk=;
 b=HX3fkwwEvUjvjbtgnMe573e8PaCRJ+zCs4qo7xeNhjj1XKNqA3eLX39/zbLmQHINQJpfMVAjsZOMS0DV09Zdd2QK19QyRxnP3OoF1ojsNSCtNSpCVemwznis49yDCsZVj54VC15iz1vgJInOBtft1lRP6Nf4F7GZSxhP134xtYh1fSEpLl7IIRNI0XXvKtsWZ07NAr5HOz87Du+bO3yfBrs0WDQvdLBeeBtqjwFmFk4d1bGrWDL4sV/2Xlu4X3XjaRaoQngK3HPDbjc8juGm+rlFqjON2HYsuVkFurWWXoiSyYm0yik49F2B7UKY8ZI0o36yRB/J9esPI1X9kx6lyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ROrOQFbEwHNqV+alHJJ410Ksj76oLH5LiVFlbIGYsnk=;
 b=uN90rsMTcE8TU2oXfydGNCHKck5Uu3f6hrJDPaaH9rLZ5rysv/j6HHCezNlWbbMahWXGNol2q4yuJaGuGSImqpBfRCBp85D6G4NG5vyLxQj/lzvY7obJSW75hi7rQsdxtwZCHfaqdS/YJf+LgfCKIdpxWabP98kLfofyMFvivb2ujVHf5Szo9IEbLbsY+aWMnOquWz24pAJcaWJ0fNvzuz+ZlbbnQkBtM7spTvYQVlzSUD8Myv5QVyc7Z35nYFM75Jdr7899Z0F6MGiBivNamVKW9OPtC9Zl9XzVegeEj1HRcziLuvWJ38pt3y2zSyiEOzE5HDvt+9zlT9iYx8GhrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 15:29:14 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%7]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 15:29:14 +0000
Message-ID: <c4081961-0875-4a2d-ac84-40df128534e7@nvidia.com>
Date: Wed, 26 Nov 2025 15:29:05 +0000
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
X-ClientProxiedBy: LO4P123CA0328.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::9) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|DS0PR12MB7726:EE_
X-MS-Office365-Filtering-Correlation-Id: c58c94b3-673d-46d0-c0c4-08de2d008e12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SEpEYWxmNjdNR0xlbjBvNU1CRU9ZNTJhMlB1MFZRRlR0WEdOaGVjamRKcEJI?=
 =?utf-8?B?SE8vUGljK3RFSWgyaUxNMTZYYW9kck5iQWJNdUVrQmFpcDZLcktZb0NHbG1q?=
 =?utf-8?B?a3crL2V3MmJ3WGpobUlieHFhUS9iK01ibzJINWlqUzhPS216cGg3NU9hR0Rl?=
 =?utf-8?B?eDVNME9ob1kwMXoxRndDZUFIaWhYeXJPK1ZOa3Q4S3VXZ2puZFhSMFVmUVh4?=
 =?utf-8?B?UkZpcXI0dTVtR3Evc2NrVVAwY0lWR0swMWt4MmtDWFU1VTZzSU5hNFpPR0lo?=
 =?utf-8?B?MTRvbkdMdjJiMVNaQ1VsS2FnN3ZHdkhFNlNGQzlKOUpoVmVHVzZ2S0tQcWhL?=
 =?utf-8?B?RldaNVVqazUxOVhZOEwxNkZkK0pMdmo5MG42L3dzaVpHaVF2UzgwcUdvYnRR?=
 =?utf-8?B?ZWlaS2RPTEtKQnFBV0srVlE3c2hBOTJSM2l2OXdoN0RrTC9rOTdSdkpDZG1p?=
 =?utf-8?B?TDVQeVRObnUrdnN6T3c3WWpQbjNFQUlZbmV3WEM2UmRieUZLbnUrUm13b3NH?=
 =?utf-8?B?S0FyUjcrOHFieXFBZ0pFREx1Yk1yRXRQWDdnVWh4UFRYVjBWWTI2cmJ1dkpo?=
 =?utf-8?B?Y3V6Nm9jNDRxeXh3bHkwT1hMU2l6OFc5QmdRcm9FVTFuZ1JHdlM1WDMvN0M5?=
 =?utf-8?B?Vk1JRkZmZzl6aW9XR1BSTHVsV1ZPeVhleTNYOEpOVXNObWM2UG5hTGN3WXZl?=
 =?utf-8?B?Sksvb2dnczZKaTR6RnhxU2F2NDZOSWo1RlZPK1dXQXdCWHllakN4M0ttR09S?=
 =?utf-8?B?Nno1UVB6STVGR3RBWCtsZmhGTndLWk16d1FlUjZlUTBTTGxmdkxaVU5vV0R1?=
 =?utf-8?B?d0F0SVUyYU5nZ1NHMllqTWI1amVZR2loa0JrNlFIT0NhU0lSUHh0U3VKS1J2?=
 =?utf-8?B?NTR0QkRXN2xrTTB4c0VBazJmd3ZXNWc5VFZiMHk0cHl0Nk5XL3lJcXVwdGdv?=
 =?utf-8?B?cURGMERWU3AwV0lMSnNMZzVLdmVRL2dRaS9QMDUxS2ZWOGpsUWYzalVQRWRh?=
 =?utf-8?B?OXNkQ2NYRkZwUjQ1NFc4SStkYWFPdmxwbE9MN3NlcUJhZUdOTFVnOUFXUFh4?=
 =?utf-8?B?WjJsWFJ4RkVIR2lSa3A1ckFOaGRzUElsTWkyN3dOS1BxczdWZkdCbFBaWUdj?=
 =?utf-8?B?OXR3My9PcnBqMmJJSFhlSjFXbUk5U1FMekpXZEdOcGVpWlBHY3pxN24ydWZK?=
 =?utf-8?B?VzBjMzlPYzFxQnNWMGtobnNsU21kcnZDQnRSaW1OT3JhSzFqTnltOFNhUTQ5?=
 =?utf-8?B?QTN3dFV4eXl3Y0Nsd2NlZFBMUFN4VGhoTzdQTGlydllQN0N2OEZyVEFQcmlp?=
 =?utf-8?B?K0ZuOWRhendHT05DNUJpbERLRHQrVEFKb3VLTkF2V1ZSaUxqaElEdjMxeXVw?=
 =?utf-8?B?K0U0b3ZFMnZKa2tXcEx5YzZGQ0lnaVNSUVFPTkhqWWJ5dm9qWUwwbzNUSnJ4?=
 =?utf-8?B?QUt2eDNydGZGeFVjNWJOcTkrOCtiVEFYRTdBekJCVVc4bTNoZHlTWmlPTThP?=
 =?utf-8?B?bkJiQWRROHZKckoyY05tcmNPRDZGZEVBemthbmlKR1VQOFhkYnY3YVhpeGYv?=
 =?utf-8?B?WG84Z2NqRlEwaUJFK3Z2TGdGUUN3NGV1anVqM3NyVE13RWl1SCtpSHd3SXZQ?=
 =?utf-8?B?dlFBL2M1SkZjVWtJRmpJY01NMkQwekJ6MUJsc3ZVMGtBL3g1TzVIRjFMQ1V1?=
 =?utf-8?B?eEE2VGhFVC9jV1llS2JTeXdTZThMTlBScElERmh1UjZvc1lOMFc5RnBYVG9j?=
 =?utf-8?B?TXlEUHY2L1RBTjRWeXVFZEoybithZUhjZkFrR0tETWc0SUZWNHlxK242RXJ5?=
 =?utf-8?B?OERrUlo2bWxhMWdlMmtoSWpxcm4zWDFQTmxyREhjc1FJN1ZRaEEyWXBZejU0?=
 =?utf-8?B?cXRlSVNpQmE1SkFUOTE2OFR6QjQzN0VXS1VLVEU2cXEvRFBUdldzK2tzYncw?=
 =?utf-8?Q?6+qaaRPGFf0y7uLJJ8Pgdld5TbKbw9JZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEw5N3BhZ1VtZEJOM3A0Zk5VKzZ3SzZ2bVI5c0lkWnRrOFlyQUdBTlRjTVlu?=
 =?utf-8?B?ZVNRdXJTRkQ2Nkp3UEtxd05Fc1BBdStTb2dVUk52aVVReGhGWTRxZjk2RUZZ?=
 =?utf-8?B?L0VkTHRMSHZWUzF4cS9lR2N2MW5GU2N1RDVXdGxqMHBIT0lDWSt5TjZSL1dw?=
 =?utf-8?B?QU8ySTlGRTh0M3dPcVREWlhDdGR2WGRRQ3l3UHJRK3J6ZTZ4dDlabWFRWm9S?=
 =?utf-8?B?U1Riajh0ZW1EVWJDSEREU0gvaUZzTncyazJFS3U5YlBoZ1BCaTNCM0ZWMWhw?=
 =?utf-8?B?ZzdmdXdmR3ZibzRlZ0lqMjlJMkcyZi91SnpYdnZQOE9sSU5kR2hBZGFvYmgy?=
 =?utf-8?B?THVFYXprbnVmMG9makQrUHdab0hCNnA3UEs5WnJ4RGUvWk9wYzNBUEVQeXdz?=
 =?utf-8?B?SVYyVUxsb3JwNWVjczUySFlZWlZISHYyWDFkL0doWUNWS1RiQVdqUndvZGRZ?=
 =?utf-8?B?SVpIaktKWU1xb21lVkFqdVAwQ1hvNDhKQXlyNGZ6UDNoM2FYMDgxRlBoeDlO?=
 =?utf-8?B?TlZEYjVIQWVxRXNwZHFQbEx3SW5QTGluQWhjUWJJUGhIczlnU05jNWswQnJj?=
 =?utf-8?B?WVZyMWNsUUFiWXl1ZjVjb21wMnlHRHFkTzhOVzY1TFo0bkE3TkFMZ292WGxn?=
 =?utf-8?B?aEpyYVU3ZC9GTUNUalhvbWZVSmVHbTYvWGlqK0RmSkVJMzVsRDVpWVJIRDBF?=
 =?utf-8?B?eDFsUkxFU3pYMm9oa3pKeXpPN1JoMDdUaG1VN09wM0JPbmFaSzJKRTFSUStn?=
 =?utf-8?B?VXkzZEV2VjY5NE84RUJSMnZ0d0JDdms3Z2pFT2hoTDJuOFNnMENUcVhzZGJ4?=
 =?utf-8?B?U2EvUEpIZnRtUjRPTWtZemJMSDN1S3RlL0ZnL2VFMVZLV1hiUHVhRlRZdXlp?=
 =?utf-8?B?blloZ0piK2ZrMG5CM2RYd204aUhNR003TXM4TDVwQ0g1c3Vjb2FWRGIwQXlB?=
 =?utf-8?B?cHd5ZDV3YXJNK1U4Z0xKWjJad1Btamw0RkJxRGdUNlYrUTJSTzF1ZkFCak9R?=
 =?utf-8?B?LzBteVRNbCtYbXZHdnlCbWdLSmpXWk1jMDZyYnpVTGNXNE5KZHQ1dGR6ZkFs?=
 =?utf-8?B?RllNNXJpMURYaHBua2t3dUxmeGI3OEdXUGpPY2NTaHJ6RXF0cjVMMEhMNUQ1?=
 =?utf-8?B?MlBUWTd6YTlPOXJ2bVhDeUF1WlF1bDg2MFQ4WEQ2a1UwZkJqT0s4aGlXZEJh?=
 =?utf-8?B?ZGQ2OFd0eXBLMlo3VzBDQmpUQSt1ZzdVSTRHeFkwVGl1MTZNMnNqT2FtQzkx?=
 =?utf-8?B?WVRoN3R1Lzd4dzE0UG1PWjBrUzBYZFdsL3ZJTktIYVVjMFpPeEJVZE4zQmtW?=
 =?utf-8?B?OXkwODQ1Y1JCUUtCYzg3ZHErZG1QRU8rRWpNcDRtMzFkR3M0MTIzZ2ZzOFpU?=
 =?utf-8?B?OExjMTFheVlpd2FBKyt1UHN2eUwwMWU3OC90NUUzZ1YzcmVYYTUwYlFRTjA1?=
 =?utf-8?B?eG04U1lDeGRSNEJLbzhSZ0t0WXNxOWtCeXpuQlRvajljdkJNUnMwOFlOWEZo?=
 =?utf-8?B?cVlLTW52VTJmdE43M2JtR28zRmI2bXJRVVVlMW9tTW03KzljQTlDakRlMXl1?=
 =?utf-8?B?ZjBXSzNPQ2pLYUVlOHhBOXJiRlBMbGY2czRSaml3a3dXQ2JrMVo1YlljZW1o?=
 =?utf-8?B?UHNXSTF2eW1mZDAxZzZwTUVvbGtKanNtdFJ4V2JDUFF1QmFjeVlybkhVaS9w?=
 =?utf-8?B?MmI4MTB2SUJaWWltbnQ4QkxncWNoZEtSakRySHVTd2RvYTR2OFRpM1ZUaUVD?=
 =?utf-8?B?OWRBTkh5bWZCVmN0cFJBMXN1WFFuMmIxWkY2cHE3MW1JQWkyWFJSWjBqcm1U?=
 =?utf-8?B?dlJiL3Y4dGpnT2QxbGw5QUNvM3A2M1dzQzdXRkkzNzNTZEdnQ3RtVjFDUEJr?=
 =?utf-8?B?eE44WjY5aG9lK2RuL01NMGVnakNXb0Z2dGRsdGdyWUN3Nk5keVhqdXJHVDhD?=
 =?utf-8?B?SkdxQTNmeHQrd0E5OUttb2Y5Y0ZVU0lodG1IUTVQL2pRd0lTOHU5Y1VFdDhx?=
 =?utf-8?B?M1NVTmw5N1ZKdFRyTzR2V0N5V1dvQTZ0TVE0U2UvTkJmbllHalViRS8wSnRT?=
 =?utf-8?B?YlFXSXRIbm56M3c5UktXY2Z2d3AwVFhxR1Vmc0ppd2lRUjRXSXd1NTVmdy9x?=
 =?utf-8?B?eUVnb0RhSlpCc2JKTEE0cU04MFo3b2MyT0QwNFM2YzdOb0dEM3ozR3Q4cFo4?=
 =?utf-8?Q?p0ZXQuGeqnBtNOIivO6nn9T3So4Y7vum/BMrXnvkp87H?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c58c94b3-673d-46d0-c0c4-08de2d008e12
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 15:29:14.2816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ihq2RqnJ+G0Ehj+Uw/joFb7DzMb6D+gnTaEQrhJRp59pLlvQ/esEH9w7qTxSLRHy4C+yoZfWeh7ToMiQaQZtWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7726


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

The kernel log is here: https://pastebin.com/7rBh3T3T

Thanks
Jon

-- 
nvpublic


