Return-Path: <linux-gpio+bounces-33169-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFhUOQy3sWl0EwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33169-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 19:40:12 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C0B268B9B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 19:40:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B1273043BCA
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 18:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA1883E9294;
	Wed, 11 Mar 2026 18:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rsBM2xyl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010038.outbound.protection.outlook.com [52.101.193.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3864E3E0231;
	Wed, 11 Mar 2026 18:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773254315; cv=fail; b=LvlWFpUbcqd1vEFtwjpXXcWdV6F2SDZk+6vqlBEqa8vN0kUW6kEeKsVX8zpf+SCONIPBZvGjhOjioH7a2FaQgYXeCz66fKT+vBebuBu3+xJMn++6364lD5i2TqCU4muJPdyn0quyJJ7dE9Y1X5PU2Q7Qe8/dybaDi8S38hJeHG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773254315; c=relaxed/simple;
	bh=5INCWb2zlwSibmiZWpMl9q/8H8EzIwleOsHw8kW58WM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Nc3mwETZF9GU6dP5NSBNY/ZSodqX4kjPVEEtqEBej3p6FXCovwsRFwTXatXObovxs4opecNjZMYrTlN9vv3FHflpg+Iri57ysgTosrEs18A2Owc/pIqPq270CLqB261ZSROuP+pg63m9BBJxAKscT02BSgNI3u3hw3bRR8vVWwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rsBM2xyl; arc=fail smtp.client-ip=52.101.193.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FsKI6EExbVXZJRH7KYkidwucks6VY34zAiie53I+e4Winymm8z/jGPMMwNaZI1xSDs5R0QaxXIZ1F/QszmgPK3b3NT2fPhKHc7h3P23x8GzCufno7tzS7IVuewwKdzW81viK/jYX0n0e9JkTZN50OPXsfPhRFYVIHQNCF6AFA6yMVy2EulVaf6B8LbxT6lVhikgxJDjZdFPmlembq1QmLAV6ZKj4w5Y8Y67J+qeAkrouuVP5vIj09NPiw7azNIV3jdVaBaOD4frOrzlZdrJNcKyzvVXb6oUdqWieyzVWN64EW8bsV2uPd4l2tG1Ae/vSAU6+rhlEqHe6qyAUt76vtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MqmTOBkKMDblSWxVTCsVJrBWdxluHSK2WPdKkVP8M9A=;
 b=vJ+Oyc10Sp4YjXwAN/OU0l8YfSUL1WUIDrT1SVar46G2tEEmOMT+sjLy6VFvtQKpGNpqvw8tud7g9hXPJotWNf8f/M2sE538YStz9QlZx2Kd06tObiaM6yaSgoA1C1gayCn+LZuksLmxr7VUjuMi9MyWNTSwCGZ1fmFyops0n/ZbJmCvjjzIaxrdgTEygoSHnjYnrTc58Vnaq3Ls3krU6nDu/dHlDfDkxk9G58uAQY73BLfyGRZ0wtc8Hh3C5N3fGNZ1nEi0HLfMnJD0WIeY+3qdqmctFu9I8rYWpC7kY9waKU71bm7cMOAf1df9YhcDRRdrtjE0TLyJILj9RjXZHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MqmTOBkKMDblSWxVTCsVJrBWdxluHSK2WPdKkVP8M9A=;
 b=rsBM2xylS0BiWLUWv1nP+zNOLjC/BK5r0XsKkZJ0ptRPDi47AEUhvI1YI6dp8Id++TqltMMBKVl5W2kox8ixyDHLIfQs9Ar17xWlD6i4//pe2LJInxlSl2mKYBtbw0YazlXsJzJ6rbwyPbzsVvAi798RdMXmLJwI/gj/sCotA7TQb9yQi84okn6pL87uGDvsgnIyQ3+/EgwJvCPGVE/wHgAmHqb4oe8cMYxYeZa5hKR//QscpA9oDPiryz0Fz8sn1y3R7Or94s0QiKSPNkvsrM9eNsO8yZ4ClfI4pAGcAM8U8oA5pBs3+J8JPcoxptFL0/DvPSZLkdHde7GNfbgIaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by CH2PR12MB4326.namprd12.prod.outlook.com (2603:10b6:610:af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 18:38:23 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9723.000; Wed, 11 Mar 2026
 18:38:23 +0000
Message-ID: <921ba8ce-b18e-4a99-966d-c763d22081e2@nvidia.com>
Date: Wed, 11 Mar 2026 18:38:16 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] gpiolib: implement low-level, shared GPIO
 support
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>,
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
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-3-b51f97b1abd8@linaro.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251112-gpio-shared-v4-3-b51f97b1abd8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P265CA0021.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::14) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|CH2PR12MB4326:EE_
X-MS-Office365-Filtering-Correlation-Id: 674d41c5-a0bd-4db1-ff6d-08de7f9d6029
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|7416014|376014|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	m81+NI3K8a5xFCit7m9xO5Dn5hs7SlDPAU9We2aZNpyoDdcjyjnMi+shsNPZelBboQ65be7yFiVT/ccleWkIUe63N4yyQFifTdqMI0KJg5J5ddzmIKn5zd3GRDKkN1ZUgVWIufS8In1hVjYc0VWMbNoDDHHoHew+PMmsAumP9wC6Ee+ur0PZyGoeb1EIVlZNN6zoNoCkqYi8P47RuAsd6vPUj8r96HIqpoSP5EWQlJsmCo2m5J59J+Zl+w4I4VirmC/wA6n/5mKob0SLKUWL40Vq9k87R3acI2KkN5SxK8PlhqjUJs3nQ8EOVR/YcW4saJkgXEyvde4Zs0SArIo/uevudykOmOBRmmSXjyNj491ON8hohDvG+y/5qBHbRp0kv+lXDOApts3fIgJfZ45FcaupNjk5i8ar40UDrrkA3vkb6i60mNFkXub1cJPdAcEEqNylxf82n8dHzYOrqW4pkOwge7zZ9TVNDkkMAPviqdCHUOYst/F3hwcIysAu02B/7dkjxQzuvvkhOQmyxV23i0IzCj6j1hdCFpm2a3x06PdyqnsFjs/SD3rWB8iyZYHi8BJ3VisyXqHAuCLcVg4s60bIZsHQa1OU8VSEBkC3BgxnFdz8wHHs09XEyflct7RWlNJfBbM0TgoK8V44HRMPkfdr3bCbpJYZl/WFvi1hZVDiH0YTtUdOxhQlHan7GAz9/Rc2LXh8BP9MarJydjK1a5x8ClWKmTm+rPxi8bzuEQK6CNJXpoYib+jtvR6+cmBaitaoZ2uHnLmD1a6yq4HPrA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cktRZkx6Rzh4Wkd2dW5kWFk1d0dicDdHN00reU15UlloZXpYdVhYVTBvYmJS?=
 =?utf-8?B?L1FDc2xMdmsxa1FKMmtTQkxMVHFTd29sbVl1OWQrdXRhaW5yRE1Mb1RjVXZW?=
 =?utf-8?B?Qzg4MCtVUHZQRWk4SFlSTUJiRDJ4aHFEQnBNVGszUTlpZXFpTFg3MTNrb2sx?=
 =?utf-8?B?QVBSME5zbDU1RFVkWTBEZDkvRnJEczFCdUZueStPY1djbnpFc3VPdjVwdlVy?=
 =?utf-8?B?a1lWWkdrZjFxbVQ2VTFqZzBkdUtoejNwMUhVcnZ6UGtQdThXQnV5dUh5TW94?=
 =?utf-8?B?ZW8xSGdGVWgwdkpldi83THBsazUyM0dqeWo3TWhUbkpJYXJVczMxdzJSWEJl?=
 =?utf-8?B?TVNwcWZEN1c0YmtIOXZmNUthQi9QM0RPT2cvTC9SWWFHcWUvd2ducFQ0M01v?=
 =?utf-8?B?M0lYcWIrUU4rNTBoUXptR3F6ZHNrUVhvaW1kTjlvS2djYVdCUEd0bnllOEx4?=
 =?utf-8?B?SndvZEVLb0t2Y2tGVHdVYTN2MWYwbmN4UnBKSmtiT3RrL0pnWUVVTVF6R2Rp?=
 =?utf-8?B?M1FDMUxPR1dydDkzVTk1RWlkK0pMVGJHeU0zNDNaMngrN3JkVElXWDJVK2ZY?=
 =?utf-8?B?SDFDSVpRdSs0MC9pUWRBVm9uRFJmaTJvTStWV1pRZ3hjd05PRnJjSW9CQStm?=
 =?utf-8?B?ajR1Z2VoRG5iajIvZlAydVZWMmhISDFadmh2aWJhSGV4bFBLR1AwQzBFZUk5?=
 =?utf-8?B?NHI1bmFQNzVSMkxaZTJ1T1BTc3FyZmZLbUVjKzNNUDJZMGJSK2l3bEpHemZX?=
 =?utf-8?B?UVlqViszUXR6WVFzZnQvbUtXaWliZ1dyeG1mTm02c21mTGZzYnlqRW9RUnhw?=
 =?utf-8?B?Wk1UVlBlRWZWTDl5SVc5MTdKUlJzd1dWb2RXWnNiU3dsdHR1djFUK1loNzh6?=
 =?utf-8?B?ZUx0SGpSbGtlbk1CQ0xMNzZXQnM1U0lFc1RGQ1BZMk53TmhFdFQ3RTMrdnY3?=
 =?utf-8?B?Q0JQRFExZTI1RzI2elNaZmFKbXdrNHhzdGxvWm1lWmI1T3RoQUYrMjJDdlJn?=
 =?utf-8?B?eTNUcWhxSkxtMnRFdEYzUHhCVzNvMzVjcVNxcnE3YUU0NTdjK2RLalRCR09D?=
 =?utf-8?B?b005WXFyenduMUJ0Z3FhY2FrVnlZRzRYSnZZQlNXR2QwWGpIai9lSk5kYXp2?=
 =?utf-8?B?amJXV0ErdHNwVDJnNUhHbVJXN3lVVDlicFVkakhpK2JrYWZUSU5mY1JKSEtu?=
 =?utf-8?B?WGJHZ1dUTmhKMjB6bnNSV3dwVmxvSVF3dGc0UkNRdEtNN3dtTTZqVThhakhu?=
 =?utf-8?B?MjhPNXRPT3BiUjZZelcrM1Y1bStLdjdlV3VLN2tvRkhVWEVzZ3VKVXF6UUVp?=
 =?utf-8?B?Rk9lZ1J6azVRWlZ0UlVEN0NHZTVHTHJjcGRLQkJoU3BMN00wUUxPTGdkUmFY?=
 =?utf-8?B?eWhsd1dZSU1lblZvbk1PRXRwQ2dDcjRFT3lMODBteG9wTi90Ky8vT0RsUVh4?=
 =?utf-8?B?bnpnN3hsR3R4dXVCd3hWRkdzdHdWMmhlMHpsSHhGWU11dE9jTkovUnVvZGRP?=
 =?utf-8?B?TnpRTC9HL1J1MXJMbFF5NzNNYWpIRWJTSmZtUnBHZVZYWkpjU2U0ZWJxcy9G?=
 =?utf-8?B?dW00WjhqOWxQT3dSMUhNSmM1NWdxalNYYzJUcDd0YThpQlFGY2JLVk9yL1c1?=
 =?utf-8?B?Rk9FV0EzbHJGcUFNWjdWaTFiby80NGh1Z1p0WE1RNkZpUXBHZElLS01QUFV4?=
 =?utf-8?B?Z1pqU0s5Z2ppaXlVaXdkOTBwclNvQ2pvNE9ZaUxyeFlsMkszaXhrMjY2UU51?=
 =?utf-8?B?cmxua2ZHUWhXVzF3TDdFVlU5OVdSeXhwbUIrMWlnRUoxekhUcTBoRXYxRE9V?=
 =?utf-8?B?aWd6YTRDdG9rekJUd21WU2NJUVVjN1IwanhCQy9SL3hPK0hpenpKU3FDenR0?=
 =?utf-8?B?aStkMU9majFldnhXcStLdlJRN1pMbGc1QmJQODZpSndadHVGaGw3Y1MrYWJJ?=
 =?utf-8?B?NTA5M1plRzd5aGRkcnpyYkFNV25rZVBvVTJPSkgwUGxBR3J6R3BGTUhqdVFr?=
 =?utf-8?B?V3hvRHNqelNZOEFlKzczV0VjVkwrS3pTSXd5bzNZcVE5ZlBsZklNV2R6TjZm?=
 =?utf-8?B?ejNjOFBNMzlDdCtxVTNlbjdScW1KMlZvZUtmd2luT3FEdWFHODQ2eEpvS3V0?=
 =?utf-8?B?bkpodUY1aGNvMHNjVzJ4dnVXSElRbnV0bmRrbEhnZ3NaTHBram9PQWQzTm1a?=
 =?utf-8?B?RUJIVnYvcHZPNmViSVM2REp0dUxCWk01OHB4Y3hPU0RnaGo5OThYY3BZRkxQ?=
 =?utf-8?B?V1BOdkYvMXpPTElkRGE1S2xFdEcyYWV0QzZIME5Tbmh5UUh0VG1jdUV2THdJ?=
 =?utf-8?B?bkxheXI5NUpOQjRPT1YveElyMjVIWDZIZzJCK0dtamxLZFZBcG1ROW1tbDcx?=
 =?utf-8?Q?mPxboAuBCPjSO1uhF+TpGF5uiITGRWslVG2xlIAJVvRvW?=
X-MS-Exchange-AntiSpam-MessageData-1: Kwgm3dLcYDmWdQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 674d41c5-a0bd-4db1-ff6d-08de7f9d6029
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 18:38:23.5270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /NNUnTeP11vdpxPtHaFIcE9Y54VSsNFeQXME7yVmA9mJLDptNZxMGxyKViLXGumNb5tEzF9aUwPMtZBGPUWaTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4326
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[31];
	TAGGED_FROM(0.00)[bounces-33169-lists,linux-gpio=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bgdev.pl,kernel.org,gmail.com,linux-foundation.org,linaro.org,google.com,linuxfoundation.org,arm.com,perex.cz,suse.com];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,nvidia.com:mid,Nvidia.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 44C0B268B9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bartosz,

On 12/11/2025 13:55, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> This module scans the device tree (for now only OF nodes are supported
> but care is taken to make other fwnode implementations easy to
> integrate) and determines which GPIO lines are shared by multiple users.
> It stores that information in memory. When the GPIO chip exposing shared
> lines is registered, the shared GPIO descriptors it exposes are marked
> as shared and virtual "proxy" devices that mediate access to the shared
> lines are created. When a consumer of a shared GPIO looks it up, its
> fwnode lookup is redirected to a just-in-time machine lookup that points
> to this proxy device.
> 
> This code can be compiled out on platforms which don't use shared GPIOs.
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


I have observed a crash on one of our boards with Linux v6.19 and I was
able to reproduce the same crash on a recent -next. The crash log I see
is ...

  Unable to handle kernel paging request at virtual address f0f21322a6ad56c5
  Mem abort info:
    ESR = 0x0000000096000004
    EC = 0x25: DABT (current EL), IL = 32 bits
    SET = 0, FnV = 0
    EA = 0, S1PTW = 0
    FSC = 0x04: level 0 translation fault
  Data abort info:
    ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
    CM = 0, WnR = 0, TnD = 0, TagAccess = 0
    GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
  [f0f21322a6ad56c5] address between user and kernel address ranges
  Internal error: Oops: 0000000096000004 [#1]  SMP
  Modules linked in:
  CPU: 9 UID: 0 PID: 95 Comm: kworker/u51:4 Not tainted 7.0.0-rc3-next-20260309-00004-g34a79c0d58ea-dirty #13 PREEMPT
  Hardware name: NVIDIA NVIDIA Jetson AGX Orin Developer Kit/Jetson, BIOS buildbrain-gcid-42974706 11/20/2025
  Workqueue: events_unbound deferred_probe_work_func
  pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
  pc : __srcu_read_lock+0x18/0x84
  lr : gpiod_request_commit+0x30/0x174
  sp : ffff8000843fb8d0
  x29: ffff8000843fb8d0 x28: ffff800081e12000 x27: 0000000000000200
  x26: 00000000000000b9 x25: ffff000080ad92d8 x24: ffff000085cdd940
  x23: ffff800081e12cc0 x22: f0f21322a6ad56c5 x21: ffff800082df0528
  x20: f0f21322a6ad5295 x19: f0f21322a6ad56c5 x18: 00000000ffffffff
  x17: ffff000080c04d80 x16: 1fffe000101809a1 x15: ffff8000843fb530
  x14: ffff000080b17192 x13: ffff000080b1718e x12: ffff0007a1e468b8
  x11: ffff80008199ccf0 x10: 0000000000000000 x9 : 0000000000000000
  x8 : 1fffe0001014ec41 x7 : 0000000000000fff x6 : 0000000000000fff
  x5 : ffff800082df0538 x4 : ffff000081011410 x3 : ffff0000825b82b0
  x2 : ffff0000816daf40 x1 : ffff800081e12cc0 x0 : f0f21322a6ad56c5
  Call trace:
   __srcu_read_lock+0x18/0x84 (P)
   gpiod_request_commit+0x30/0x174
   gpio_device_setup_shared+0x144/0x254
   gpiochip_add_data_with_key+0xc38/0xeec
   devm_gpiochip_add_data_with_key+0x30/0x7c
   tegra186_gpio_probe+0x5cc/0x844
   platform_probe+0x5c/0x98
   really_probe+0xbc/0x2a8
   __driver_probe_device+0x78/0x12c
   driver_probe_device+0x3c/0x15c
   __device_attach_driver+0xb8/0x134
   bus_for_each_drv+0x84/0xe0
   __device_attach+0x9c/0x188
   device_initial_probe+0x50/0x54
   bus_probe_device+0x38/0xa4
   deferred_probe_work_func+0x88/0xc0
   process_one_work+0x154/0x294
   worker_thread+0x184/0x304
   kthread+0x118/0x124
   ret_from_fork+0x10/0x20
  Code: d5384102 910003fd a90153f3 aa0003f3 (f9400014)
  ---[ end trace 0000000000000000 ]---


On Tegra234, the main gpio controller has a total of 164 GPIOs (see
the tegra234_main_ports in drivers/gpio/gpio-tegra186.c). The GPIOs
are assigned a index by the kernel from 0-163, but these GPIOs are
not contiguous with respect to the device-tree specifier.

For example, in device-tree, if I have a shared-gpio with the
following specifier ...

  gpios = <&gpio TEGRA234_MAIN_GPIO(AF, 1) GPIO_ACTIVE_LOW>;

The macro TEGRA234_MAIN_GPIO(AF, 1) evaluates to (23 * 8) + 1 = 185.
This is greater than 164 and this is causing the above crash because
'entry->offset' in gpio_device_setup_shared() is greater than
'gdev->ngpio' and this causes us to access invalid memory.

This is what I have been able to determine so far and wanted to get
your inputs.

Thanks
Jon

-- 
nvpublic


