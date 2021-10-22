Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBAC44375E4
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Oct 2021 13:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232649AbhJVLUN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Oct 2021 07:20:13 -0400
Received: from mail-bn8nam11on2070.outbound.protection.outlook.com ([40.107.236.70]:8289
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232539AbhJVLUN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 22 Oct 2021 07:20:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hpVNsGSgl4RhW3yihFf2aVI6/83Kaj05nmuFgS2PS/rYjfK67s9M/qO2KjlYzSiBSpQLXAB8ptAnA/N43EwJNDXznrN5pPJMlpzWYD9oCNQPzaJXBVL5MEteIbkRjlKKb4C40RSXVVCEsDZW/l5D+NCF/rfEuvnXNIGGwPsvbpL3TkKHT5pPnDtm6L/kjF0ujr3/IqvijSr8y+0vxN8dgACt/KnGpKItSdCxAfRoa5CNwt/27/+Q4GSqFXWQSB0J7lse0EWpFj+b9sCT9PQjZCPecyOF2+011F9ob9G/HdRLF+222Zt/kASaue90S/xsJ1vrt8gKjRNWugwI5svhIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3jK2oUIIR+W4nxkUp5UdkHhXmEj7fpe7ifyQ75kHOGE=;
 b=TZr0wcIHiPDWsFR2S+cDOw6tVV4jtMIA4+kDu0kXXm5XEX626wbJeUa/tnSWgmI4hP2cdlaeHOxC9ZifiZOJrSTyv6nKAc8H2V5t9x6NvPW/FLGug9loENct1QzSRUc3ed897msZ+09fwlJBcr0WyrAJFpaZGNIPPF89RPCChPPyoxqZ8HxqIDprpe9aAS1h6SQQ6AGXTF90MTNZLXvyorbTktOmZ0hB9nsGEjlResNLClD8J1RlBs8bW9AKzhB/Ymj/wP9WjgDyaveutLIgNHQYB/vlDrIA8P6MTBvopff3KRS5gyhUbZkCiY2m6UjWXaOeHj3rCm6iphJ5ZEnKyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3jK2oUIIR+W4nxkUp5UdkHhXmEj7fpe7ifyQ75kHOGE=;
 b=TcRvug88h0mrHJcBmEkxEAr7MhksfeuyJAsVkMNTR6duBJfK+UhbOD+Qy3XJQf8aaiGW1DVATyq29dzAuG2ybWYJy99fy6hjttFuZ7pReBo/Q9NxZdt2rjThYcTXJORhixrrUidkvYQOjJjXH+WXzhMmyS4b++z9dwxkLymyMQk=
Authentication-Results: rjwysocki.net; dkim=none (message not signed)
 header.d=none;rjwysocki.net; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by DM4PR12MB5133.namprd12.prod.outlook.com (2603:10b6:5:390::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Fri, 22 Oct
 2021 11:17:54 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::9c06:d113:293:f09b]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::9c06:d113:293:f09b%9]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 11:17:54 +0000
Subject: Re: [PATCH v3 1/2] ACPI: Add stubs for wakeup handler functions
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc:     "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>
References: <20211019160401.8296-1-mario.limonciello@amd.com>
From:   Basavaraj Natikar <bnatikar@amd.com>
Message-ID: <b5aa53ab-2914-e7b7-6fb8-54a5891367da@amd.com>
Date:   Fri, 22 Oct 2021 16:47:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211019160401.8296-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: PN3PR01CA0133.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::15) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
Received: from [172.31.155.167] (165.204.158.249) by PN3PR01CA0133.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:bf::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend Transport; Fri, 22 Oct 2021 11:17:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8487ad0c-a7f0-4e5b-1221-08d9954d97bb
X-MS-TrafficTypeDiagnostic: DM4PR12MB5133:
X-Microsoft-Antispam-PRVS: <DM4PR12MB513332A9DDE5CF5151BEBD72E6809@DM4PR12MB5133.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:935;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fjdu9vNXY47s6TnBbuzUpqAiQSUnvEKl39BVuNH6f1JhfaxwDFHLokr4dDFcELqCLDl2GSA3AJ6MKI596pxeoKmp/pZ2UcpYPZ0slJpax0OojDyXVbwIPJgjf0prGUxsjlnOhN8GX1nLSaI4BEwLFtUckQVJeC6oXvjpEO4XnCYoV0gvuMvBs8Tzj0M20Qp9ETVHYpheVMVDMdh2ckXrvK7aJjXF8kAX0Am18K5+DD14z5H8lYOQZtMEMSBP8XUTr6rikgum+vlSyP9duywBcmiy1H822+8UDzkJvSN0pYJT5XQqSLgXkFsW5aR5cMhSlK6N0s/kq1Y9PRh5Ew78a6Iztz17T9BpBOuzrVFZPMMH4Kqsjo8jst8gRt3FquWn2kYDXQJFInjABooE4m7ALnLEiWInzQpV1Wyf4FD2cKIt84iM+LqmHRodZdCFXrEsCFhf1EBhcv32V2GtGvGuk8R85Bu5AkGmt/Vnczd9JuZZ3shm/3cNTRkLXtzktUZokfKTzxeAY0Pj6ijUZVGDWQPyFhpR1ygwTSGDuHdm8a3raZ2+6V8m8GK30tOaVvRa9r+9eO12Ms1I9dzdg3OkOSXtaIG9Xd7bUJlo+e78dP6TtKfFRFajfwymwbEyYt3d3oBo82i1/Kq5r7xNDdNA+cKI6Uymoe2b0W0/gwhk7O1rj5PMCIT3GmhyjcbpnjPLVQ6cVaQa0lsPDnw1LA7MUT8AWzu5+DnnOZ9xff6Jubc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(54906003)(110136005)(8676002)(53546011)(316002)(2906002)(8936002)(31696002)(16576012)(6486002)(66556008)(6666004)(5660300002)(31686004)(4326008)(508600001)(66476007)(186003)(66946007)(2616005)(26005)(36756003)(6636002)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVBjMW80TzFibncxZ2NnbkF6ZXR2YjBCcTBrKzYxWmY0WW9pM3lCUFNvdzNn?=
 =?utf-8?B?N2VHQnNjWXJCMlZrUEg2dEhiQXBndWQveWRONVZGajBlVTlBSlNpbTArbEY5?=
 =?utf-8?B?cU1XYXd2WHZxZTZHWHcrdVltejlUYXdMZzdyQVM4Z1dORnUvYW9OVThnM3B6?=
 =?utf-8?B?anZ3Y09zZjIxMXJ4RVRub3Btc1B3a1NuemVSNDJvMDRFKytHMjhWeTNxckdN?=
 =?utf-8?B?UlRneTRCUGl4bkQ4aGpTQ21neHgwNW90SGdNcUxhblkwWEpIWWxMY2k0U3E1?=
 =?utf-8?B?TTFoRllVaFNNTHIzRDIya1FrN2M1dFNmOHNyVmoyZ0VDTThFWUhCTDAxYmsy?=
 =?utf-8?B?Z2U5UDliRmZpTW5ZcVdIMGlRMUpWSFRPZHVFVGJOM2x0Q0Vxa01XemoyV0tj?=
 =?utf-8?B?d0MxUFZzOE54RE00akw2Tm1CK3cwN25sMjFJZUNXZFZMdVV4NDY1NUlxaVlW?=
 =?utf-8?B?L1M3RDFOUGE3ZCtLR0wwZTk1bVp3bi92bWVLZ1dmUjJjeWtlQWUxSW5vOHc2?=
 =?utf-8?B?cmRHSU1ZcFo4MFRqUmZYbTJBaWxsR1BybDRETzNROXd6bmdUMGhEOFFRdnN5?=
 =?utf-8?B?WTZqaTlGQlNvcUJXazZCTGI0MTQySlVES3dEQ1NCWmJFemZNWlc4dTdCY3l5?=
 =?utf-8?B?L2dDemFMYnFtaGJMOFltOUk2TUxycHdPT2Nib3F3Tmc5TWlXWmxuWGlGa3Fa?=
 =?utf-8?B?V2szZHVLSDQwL01YWDdrdWJSUlhvNFdIY204WGlTSnRqVUJ0eTZ1dmZFUHF4?=
 =?utf-8?B?SXpUV1gxR2ZUck1JeTdmbUhNa2lwbVNOcVhsOFZLbnNOcHBTaXVEWEx2WEFm?=
 =?utf-8?B?b2dtdVdReWpFZzkwQk9JbFlxQTFXSTd1d1ArOFE3VG85ZlNsZkxpOE03UTJl?=
 =?utf-8?B?bnN6TnJKWWwwbUtpdHFSYzU1emRaRkYrc0ZBeTliVFZUSTlJK2xjS0t0TVhl?=
 =?utf-8?B?a0RGWWVOMCtaZTR4RUhqSHJMSlBBVjRBRktDRDZXejBkZURJcVVmc2l5NnRj?=
 =?utf-8?B?ejNSQ2VFb2h3RVlBR1JJRGVEV2J0Sklmd1FUV3R1UzNzazRKSDVHb2twQStx?=
 =?utf-8?B?MDZxV2N6aVV0S0hwRlZZYU9tSVQ2b2dKTjEyZUtlZzVaT0FrWXkvRUlhMko1?=
 =?utf-8?B?czhpN056MGRwd2pIMXh5S09VdHd0RUd2blhMMnJPUEJGZ3hiM3I1Q1ZnN0Rs?=
 =?utf-8?B?cGJ2d0RlbjhLUTViQVhONlVzcmFacDFqRDhMcHBpWXJQNFpxSG5NMEEzMDFK?=
 =?utf-8?B?MWVmRVVrZVJhdE1jem9IR2k2dk00TVBYT21BVGFJRlZsRGp1SWRPc25LQVEz?=
 =?utf-8?B?dit1SmpUWlcvRCt5dVUzOE1WbGgySVEweVBPQlMrZ05CM3FUV2JyQlYvZlVz?=
 =?utf-8?B?bWJRbk10YndZQW5FbDZJd0lMREtqK0hEMDZkbjZqNmhQSGh3SW5SWXhGdDFQ?=
 =?utf-8?B?T3JoaEZFeFhXMkV1bE8yTkNJcFdrZFo1Y1NOSDhsQlhvTXkvNEljc1FhNXIy?=
 =?utf-8?B?c0RScTRhWXk2MDFvM05ZR0VxbWFxWU5NdDd5eHZCR3RTUHBQdzRzVzc4cjVv?=
 =?utf-8?B?MjM4d3JsRzZ0WTB6Yzd2ZE5sQ3lkSG5wZCs2N29mYU1DanZrK2sxN0lmbnc1?=
 =?utf-8?B?bFZPVFFOL0xrTHdIcHJHaUhYSS84K3hMRnRiZTNIdlFuMExUaGpuUlNyRFFt?=
 =?utf-8?B?VnF1ZFdISUpMUE83RDBVcm91M2Iwc3M3ZWFDdEhHYWs4WEZ2Y1FYSHJZTTZV?=
 =?utf-8?B?WWF2S1JleEY2c2lDTDhjNmtSdzBNVElmTnZPNTFNOGRxR3VxNEQ0MEdPdThs?=
 =?utf-8?B?SGhEZWZKc3VrZldCVm5EeVhtQml1VWJQVFBXbzJHSXRmZUowNFU2b0xWcDI0?=
 =?utf-8?B?dlZCMmNyWHBnZmlZWmQrVTFLN2dUS0g3WTVVWTFyN0YyZUtuYWFHbWF1eFBC?=
 =?utf-8?Q?OrhugQ/SqtM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8487ad0c-a7f0-4e5b-1221-08d9954d97bb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 11:17:54.1181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bnatikar@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5133
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 10/19/2021 9:34 PM, Mario Limonciello wrote:
> commit ddfd9dcf270c ("ACPI: PM: Add acpi_[un]register_wakeup_handler()")
> added new functions for drivers to use during the s2idle wakeup path, but
> didn't add stubs for when CONFIG_ACPI wasn't set.
>
> Add those stubs in for other drivers to be able to use.
>
> Fixes: ddfd9dcf270c ("ACPI: PM: Add acpi_[un]register_wakeup_handler()")
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  include/linux/acpi.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index 72e4f7fd268c..b31bcc0f4c89 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -976,6 +976,14 @@ static inline int acpi_get_local_address(acpi_handle handle, u32 *addr)
>  	return -ENODEV;
>  }
>  
> +static inline int acpi_register_wakeup_handler(
> +	int wake_irq, bool (*wakeup)(void *context), void *context)
> +{
> +	return -EINVAL;
> +}

line break is missing.

Thanks,
Basavaraj

> +static inline void acpi_unregister_wakeup_handler(
> +	bool (*wakeup)(void *context), void *context) { }
> +
>  #endif	/* !CONFIG_ACPI */
>  
>  #ifdef CONFIG_ACPI_HOTPLUG_IOAPIC

