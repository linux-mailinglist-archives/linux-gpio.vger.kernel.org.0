Return-Path: <linux-gpio+bounces-28055-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23654C33B0E
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 02:43:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA1943B42E9
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 01:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 683272222C8;
	Wed,  5 Nov 2025 01:42:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022118.outbound.protection.outlook.com [40.107.75.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787871F03EF
	for <linux-gpio@vger.kernel.org>; Wed,  5 Nov 2025 01:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762306949; cv=fail; b=AOXp3Yk2DVxN2igBlMeCqLDAznvU+WxSApEdROmXc7xxPCbiLx3xAml4n++j65ofYlKHNJ5PA8emlinQBQOUz5DutN+p9mQHtvsDkGwlmM6IXJjS2XzH0btDxlBvO8UZAy3uxJpR7lm9gCsZ37jsbPfQ6kSlp2M5KJa73M7wTW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762306949; c=relaxed/simple;
	bh=AVKiVQ82oC1u1RfESiIrigJO0A6sVt6QSwjtDQqhaII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BkGWtad1yTTWpKPFMS/JDxnMmdObos6fggIVSlUv/weCL5yy0AJCMJdVxpr2GcuZzX2ZjyR37m/UkNKF85KGfy1tpEXtnxMpFeLAQ03zoKkO23wgoOMuk+mpvdOxmfC7e3fcBoN0uH+pOy+CKms03z/5mig84jaqY+2Wf9VXTHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K54yfP23h1gKdYiraHsyxFJbYAqdnfie32BPYE71+8If7DN5a5zx8ajv3oHlQLlP6KIpqYzX+ZaqH068U1RH4n3IvAXfEYrYjnuDwkC0oe2c8Hvn2k3gM10MkYWmt/do9FYFQ/IoNooozwByRDleK0SqAepmNXph4rNP+tU+VWBFXkPeVyXcxt2zqVCKh2Uc0wjdCJwOqiqzrUgZVPx9uFqEwWWe8F0fZG8QqFoc3GNrFNHnn3v3lVKLO53/gVik29v+E/FLGjvT5uPg3XcnGHHTT1kvUNYF/9KeggTNTcxuPT/RhvhqVp3k2sKViy8tw5+oVlCp5V7/+OJ9Xsoi2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9uTl7kz4+bs4W5qvZ9/T9gee+q4FhYmD4wKCzfHqKLU=;
 b=KkvYYqmMd9NFpTTB+kmku9L7t9cYXfnKPPWbaAkJqW+o2etqSPEJH8AmJ5iRIqEvqJjZ+rTX7lqyULY9Jz2NcSRGlxHMvFnixu5JIgnhLBB3jLALwboZAxJ9H1whbHV00HuAi1soldnLJnCm/VtyjzR3yBvbJvBLjQfaRfOEjvQ/DT+oYlnbxiiV3vM0WMT2bMGGV3129rcT1hPMlbjDfX8e4ZwqOh4YUWRliuEfsqZEFP6XDlmAzssbbXdaSqGLZvOOdVGNDSIIdaSlKljKrZiQ7ehGgnkYTaRLq4O1dGXbpbweZrQ0kAHiu3UshsO7YscUt5lGBq2AvdjHUEGifg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SE2P216CA0202.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2c3::15)
 by TYQPR06MB8261.apcprd06.prod.outlook.com (2603:1096:405:374::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 01:42:22 +0000
Received: from TY2PEPF0000AB83.apcprd03.prod.outlook.com
 (2603:1096:101:2c3:cafe::78) by SE2P216CA0202.outlook.office365.com
 (2603:1096:101:2c3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.8 via Frontend Transport; Wed, 5
 Nov 2025 01:42:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB83.mail.protection.outlook.com (10.167.253.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Wed, 5 Nov 2025 01:42:22 +0000
Received: from [172.16.96.116] (unknown [172.16.96.116])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 4930141C0145;
	Wed,  5 Nov 2025 09:42:21 +0800 (CST)
Message-ID: <d2191ba6-a6b0-46c4-ac30-950426fb8f0a@cixtech.com>
Date: Wed, 5 Nov 2025 09:42:20 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: cix: sky1: Provide pin control dummy states
To: Linus Walleij <linus.walleij@linaro.org>,
 Gary Yang <gary.yang@cixtech.com>, Peter Chen <peter.chen@cixtech.com>,
 Fugang Duan <fugang.duan@cixtech.com>,
 CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>
Cc: linux-gpio@vger.kernel.org
References: <20251104-cix-dummies-v1-1-331fc0c71115@linaro.org>
Content-Language: en-US
From: Hans Zhang <hans.zhang@cixtech.com>
In-Reply-To: <20251104-cix-dummies-v1-1-331fc0c71115@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB83:EE_|TYQPR06MB8261:EE_
X-MS-Office365-Filtering-Correlation-Id: 102a35ac-aadf-49bd-7c7d-08de1c0c909c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cTBXQlR3eSsrS0NJcWNGT1A3eGZWQUwxUzVrcVVyRjUxS3RPamMxTFRJMTJW?=
 =?utf-8?B?Vi9MSDFjTmczbFVpaS9nS0ZwMTJZRnZBb1ljeFp4WEVxcTBoT040eFh2S0VK?=
 =?utf-8?B?MEVQM2JUbEVveW1vRFBJeWhUM2tJZS9QbTFWN204bkdEdTNKSzRPUGgxeVpB?=
 =?utf-8?B?T2pUVlNncG8raG1sUWdZeHgwMVk2dStXck5qRFdMbWtRSHFYK3RrNWxocE9M?=
 =?utf-8?B?TjF6K3B2SHcwbHl4YWsyK3NJOEMxM2htMzJZbGtFZG1KVDlRcHQxWWJLc2Yr?=
 =?utf-8?B?eG1Ob0hyRXRzNHVRV0FzWVA4RStHV0ZacmFsZjhKV1ZNSnNKYk1QVEFNTzNu?=
 =?utf-8?B?dGdqYTNSVk9FYXJUSlNPM21NZnRaTStTZXNCamJpOVg1aUd3NlNwc3FwWERn?=
 =?utf-8?B?U2w0R2JuYWhyTXhzTVNrMC85T0tnb3haWVV4Sm5FdjU4eTJvTEZ3cGVZR3F1?=
 =?utf-8?B?RG9GZXFha3p4Q2dVUWxXWk5zV1JLTWVxeGVtSjkrdjdKOTY5czZhY3daenhK?=
 =?utf-8?B?TnZvQUhCa05wdVZSbTJRTlZ4S3RDTk1Vc0F3NWsxSXBGdGZTTW1XblpOSXpv?=
 =?utf-8?B?SlZEVllJSlpzYVR0MlJZaWRCM2hialFQVndWMUh3cUNmUmdjaU5mV2tQS0Jv?=
 =?utf-8?B?ekJQTk1ORU1hMVZDcHg5ek9FRG1oQ25zRGM1UDk2cTNJYUk1dkRUVFNCYVJ3?=
 =?utf-8?B?OUZvbzhnWFdLS3VFYjVmZm1RU3gvTGliQUd0akhXS2JVdVpubjBiR3lQRHlU?=
 =?utf-8?B?UXhDMGpSejRaQTcrNVJscThXS0FqTStMbk5XUXNVcWkwUEhncHRFb1p2clNj?=
 =?utf-8?B?eVlXN1RSb1c4WVRFUHpuOHdId3E1Vy9jczRkNmxtREhqeDRqZVIwMDkzNXNp?=
 =?utf-8?B?TTZjRUxscUxINFFDVnhteHZnUDRhcTQ5ZG5Rb2w4aXBxenVqNTFUeGM3NGdD?=
 =?utf-8?B?YVIrNXU2dkRyR1hvTnR2TFgvem55d3VsaHlKQ1dRN09CQXJkeDh6Zzhaa1BR?=
 =?utf-8?B?OE9PU2RsSThTaVVVMzZyRURlc241M0U5Z2hpdFg0QlE3SHJnaXRvTnhEdFdM?=
 =?utf-8?B?cUkxMjZ1RFp2T0JQL3IwVWc2QWRoM0xYeUltOExnTWo3QVpEUDU2Y2pSc3VP?=
 =?utf-8?B?SFA4M2hROEtFcGxTaWwrR2YvaDBjM0xRdm5rZ29RQnlTZWh5dXVXeVRqYXRT?=
 =?utf-8?B?SWhERFZSZ1F4ZGtZbFpRcnVSWU9TVHpPYkxRcU9OS3p0d0crNVZ3NlJQQkFE?=
 =?utf-8?B?cG1hT1BIaU1UYTRkM3BCQ1dJZVc1ZGY3TnhybGo5dzFhcGNNKzZiaHdpVXdp?=
 =?utf-8?B?cGFDMisrc2l4ZzIvM2NLbWhIa2pmMWQxMDlCRHdjaFArVVAwRDVtbHczMGdN?=
 =?utf-8?B?T2hWUUtuV05qVDlDZmZTZ1ZFUzRzZjhDQkVPVDRPTjBoV0FDSC9pS3ZOZzNV?=
 =?utf-8?B?VHhFcVFYS3RVTzlWQlluSjlidCtwK2tyYmQ1V05QYlVscURiZGJzWVpqVTdQ?=
 =?utf-8?B?TGRLNUZaRVhvZ3g3TitrdTNIelAzaUVaSk1pR0Q4K1hsL1lkcG5YWkJJQmtQ?=
 =?utf-8?B?M2dEeHJzdFFSR2l4dG9OUUhlMU1rU0NzejVvS1d3VGJHazZHL29lMlE4ckhO?=
 =?utf-8?B?dEc0V3lqc29lbGtoMitMY3ZXODNlZm0vcmsyUlNjdHlmenRZSTJ1TG1TVXND?=
 =?utf-8?B?NWltYTloU2V2djM5UVdSWmhQWHkvMFpUMzlzM1dYVXNFbUFUcEZSQ21DRFMw?=
 =?utf-8?B?aXpoTWtjMHh0QUdEVmZxbC9iSlVValRUSThRRUo2MmtLZ0N5emt2TzBIekc4?=
 =?utf-8?B?cUZYMzZFVi9Na1EwTU5aamtXQUxnd3ZPdm4zeXRLbkFYazQxVUNTaFF5YVVw?=
 =?utf-8?B?Mm5sQ0JHMzNMVG5xUnA3aS9yUm55R2xMQnlmZnVLU0R2VjJtSHE4OWdxN3hT?=
 =?utf-8?B?YkQ0bkl4SmJmamo5b0tPOHQ3R3hTVGFBaDBmTkhHTE4xWU5NcDd1RUNFS0V1?=
 =?utf-8?B?Z0t4VjE0OEtYbGtNdVJTczJhZko3V2o5b3RrVDhPNnBBdno2U3ZoeElsL1U1?=
 =?utf-8?B?VzRkanN6Zjd3Mi9ucS9MNWN6b1ZyRXFvSXdTZG1oRmxNeWlnYVQzbm5CMjR5?=
 =?utf-8?Q?F/+w=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 01:42:22.2087
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 102a35ac-aadf-49bd-7c7d-08de1c0c909c
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB83.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYQPR06MB8261



On 11/4/2025 9:01 PM, Linus Walleij wrote:
> EXTERNAL EMAIL
> 
> This exports and calls the pinctrl_provide_dummies() function from
> the CIX SKY1 driver.
> 
> The reasons are explained in a comment in the commit, in essence the
> two pin controllers need to go through explicit state transitions
> default->sleep->default despite they only handle one single state
> each.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Hans Zhang <hans.zhang@cixtech.com>

> ---
>   drivers/pinctrl/cix/pinctrl-sky1-base.c | 15 +++++++++++++++
>   drivers/pinctrl/core.c                  |  1 +
>   2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/pinctrl/cix/pinctrl-sky1-base.c b/drivers/pinctrl/cix/pinctrl-sky1-base.c
> index b03e10147b09fc4b69593d5cd9851b74ba1aaac1..a5b583f10441e42cea34c275bc61fb36b949c0e4 100644
> --- a/drivers/pinctrl/cix/pinctrl-sky1-base.c
> +++ b/drivers/pinctrl/cix/pinctrl-sky1-base.c
> @@ -560,6 +560,21 @@ int sky1_base_pinctrl_probe(struct platform_device *pdev,
>                  return ret;
>          }
> 
> +       /*
> +        * The SKY1 SoC has two pin controllers: one for normal working state
> +        * and one for sleep state. Since one controller only has working
> +        * states and the other only sleep states, it will seem to the
> +        * controller is always in the first configured state, so no
> +        * transitions between default->sleep->default are detected and no
> +        * new pin states are applied when we go in and out of sleep state.
> +        *
> +        * To counter this, provide dummies, so that the sleep-only pin
> +        * controller still get some default states, and the working state pin
> +        * controller get some sleep states, so that state transitions occur
> +        * and we re-configure pins for default and sleep states.
> +        */
> +       pinctrl_provide_dummies();
> +
>          dev_dbg(&pdev->dev, "initialized SKY1 pinctrl driver\n");
> 
>          return pinctrl_enable(spctl->pctl);
> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> index 157510157d47aad96b459abf68cc0e4eed957f2d..83254a95ef1741eaf4784ba4e5a95176af497845 100644
> --- a/drivers/pinctrl/core.c
> +++ b/drivers/pinctrl/core.c
> @@ -70,6 +70,7 @@ void pinctrl_provide_dummies(void)
>   {
>          pinctrl_dummy_state = true;
>   }
> +EXPORT_SYMBOL_GPL(pinctrl_provide_dummies);
> 
>   const char *pinctrl_dev_get_name(struct pinctrl_dev *pctldev)
>   {
> 
> ---
> base-commit: 99224c151c19b74e1930d236dd348b6b22a607a5
> change-id: 20251104-cix-dummies-f5f400e3ce94
> 
> Best regards,
> --
> Linus Walleij <linus.walleij@linaro.org>
> 


