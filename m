Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5FFB5329BC
	for <lists+linux-gpio@lfdr.de>; Tue, 24 May 2022 13:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236518AbiEXLxA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 May 2022 07:53:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236302AbiEXLxA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 May 2022 07:53:00 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2072.outbound.protection.outlook.com [40.107.236.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AFE35C746
        for <linux-gpio@vger.kernel.org>; Tue, 24 May 2022 04:52:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XhZjmZVm6d1R6e1T+zPsZbkWkTYAA1KVYnsfXnsLZrhcJYVUM5lL7QO5SxELClydTqcNnbQgOAh+fVLJzAIN4sX61L5axCxR9ona62Ntef6SSTnohanDN9lv5NvDvGTCvKN0lWDZiUeDndCSQzup1i79mgrAzrXWCFvto51nETVSHZSinHpIZOYlt5Fu8SpCDArnptjosPAscAGvZByaBwCZsPJOxeeLtfzCuD5rIjQyo2rdigwGij7eR64a4Spc+/c2oT/7F+g75MYQXsBGjMW3vGa0yQtetzbfdWwAIxeOqzVsPvOMJK4CdWLiEL2KXS7I7ptl6JXx7WF93ApV2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wskJ95MhP6eiXvQ2q0NQTapQBaIYUrexNshYyIaYVtA=;
 b=lUSSCBsSFjoXkxwyQzV/9Pd6hmrCxCIKpJaiJ88YSULZGvcGOFucxRIK82T6zRTudktjhOZyuJksBgmTMNTiMIJlXQRHbDCfWQFy1jPrXQ8m53C+/dRUV1v3KlLsHUxs0DRYB6c2j0PCOAwOQ2w2kDp41Tm/jeBseMdR+5hLF9M3wya7bkgEqepq2UXlC7NQbT+roifVrrLnsEUgtkiNDnLJHyDtzIhhaCKrfHlEfVcasBZ2pkHTuVLAxz/JCBwj6iyDxlbbpFA+nT++wsqe1ZWXzirfGh3lsTOqGqygoBe6q1wFNVi+qLBWEfOvJ52ir5W9HeI1KI8ngB7BF3Acpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wskJ95MhP6eiXvQ2q0NQTapQBaIYUrexNshYyIaYVtA=;
 b=1LP24auuzeANzuwe8ZyAPEP4Yptq13/CXArOsOGjwGfLDCXClHRANzHkcXnVVqgMaDvYJ1f7WLcJXkT+qrznjgmMZpn+jSEvaVIYW0lPJceFOH2WMBLx+88FpqUNdDPbR3A30x3C14FncQ+bDP7kpMRjA9XLQ1Ffj832Ekrk5vI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by BN9PR12MB5381.namprd12.prod.outlook.com (2603:10b6:408:102::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Tue, 24 May
 2022 11:52:57 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::b3:bdef:2db6:d64e]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::b3:bdef:2db6:d64e%8]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 11:52:57 +0000
Message-ID: <8ba8857d-c3ab-8959-5bc3-a4e225459f61@amd.com>
Date:   Tue, 24 May 2022 17:22:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 2/3] pinctrl: amd: Get and update IOMUX details
Content-Language: en-US
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Shyam-sundar.S-k@amd.com, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
References: <20220524074007.2792445-1-Basavaraj.Natikar@amd.com>
 <20220524074007.2792445-3-Basavaraj.Natikar@amd.com>
 <CACRpkdZ267_CjNoro4A+eBASjz=qCL4ixLnbsac5U+gCsBSGwg@mail.gmail.com>
 <e35efb44-6e74-690c-91b6-c8270f624894@amd.com> <YozDbugZc8vXPHU2@lahna>
From:   Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <YozDbugZc8vXPHU2@lahna>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0134.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::22) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 373c1994-8eec-43ea-d645-08da3d7bf15b
X-MS-TrafficTypeDiagnostic: BN9PR12MB5381:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB5381EAC6F4160B57A9DA10DEE6D79@BN9PR12MB5381.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y49jvdufAKe/9JKnUvf/cL0SSkrCpmfw8lFxKpZUbwF6Rz5R8xs3cgVIG15lYJuj7FzD77d6OlWc46wT+PxTil6t38GOq3ZmA0NFibRbHCKRDJ9Iy+i1SczW4PDMrHU53/By2/sXPKeorkV8KWhL4qGrwCHVkfZXwEJlelMHxWPe1VU+BtVMSbAsSA11JIm0NygSTjWVu8UUs0ouOHDnSbAS3lAsTbslMAcSTgfhjUBHjlHI0g+yGyvEgW0x6X7rZuz/ZjGRYY1dQWFYNgeZMKm6KgiKdOItQbtvQOukCX4++CuiVP+xgseSZLza/P2NjC5Fy3e9ipRTFD2Vz0pZZ4/6yrsfbkJt4xvV+h3yCBpLjZED6LdQl4ulkOB1mtUz5H35xZtLh19pd4L2s8r4gvLx/3lkR6WLwjIIlmiwwild9LSAG56HopQGzFwPgba+KMIKl2cxm3Fd50hI5CxPXYZhz2HUHJLfS7huozBPBcm+Vkmnwf5d/pacdo3McYLIocoTprH5nmUJCdnSJAeAP74WBrUeRS7wbv3TQE4T5nnnDVhL1jg+O8H3XoNy9QWcKbOVTzLxeH9f+H82RhtZ8VQ6PtRvF+U5zusXCwbae+MK+mnF44uQfKKT/15t7LLCpiPFjk/8oq58bZNXGTqtb/aObc8ApL6JbkXFUDoIzO+OxoxDOD84fez2VdSd1lqBlkXNTVDwql500t8kvO0DHBZU5GmaEYQLOLcZYpfIhv1vVfSiJjqJv+HPuQOgJyix
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(31696002)(186003)(316002)(6506007)(6916009)(54906003)(2616005)(8936002)(6486002)(6512007)(66946007)(8676002)(66556008)(4326008)(66476007)(26005)(6666004)(508600001)(38100700002)(36756003)(4744005)(31686004)(83380400001)(2906002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3pFRDNqQXBXNktURytVTmEwRkJHZ3NYVWZFb2JodWpXWFAvWkJjbWlVM3FC?=
 =?utf-8?B?TVZCZDRkejVoSWIyampoYXdUUkNoNnU0WmdmbFJNTVAxc2dseVV0dng4ZHg2?=
 =?utf-8?B?WU14MGw4dm1tUnZTTTJKVEdhL3krS3hyTUhqRitjWUlaejYxY1dQWVFacHYw?=
 =?utf-8?B?YUROYjgrY3Zqci8xN1lOQnlOL25vNEhGQkw3Z1d1VzZyQWRiK3ZlTUNGTDJL?=
 =?utf-8?B?WmVJT3RkMzZkTlRVbVYzcTZHbVJVOWVuRUR1OGJoc0RZb3ZuUzdaMHBPeWRN?=
 =?utf-8?B?aFBVbktwK3hvTTZZRG82YjN2dVVSQXNRUzIzN2tGTUliUkhmZmpqUi9qaTZn?=
 =?utf-8?B?WWVqN2RpUnY5VE9HSkZKb0h1QVhIOTRGZzVha3hqUTJTUHVycExFWURGcWd3?=
 =?utf-8?B?bnNNUFlFZ0Nxb1BVelBQWjlzWTBzV0JLbXo2RFVBdWJJelBKVHFzWFJwUW8v?=
 =?utf-8?B?cW8wcG1teURkbEdXOHVycjQ0ejdTQ0doV1JMSlVONDhhb1hMVWFObUllaDly?=
 =?utf-8?B?SkhFUEIrbjdlT0oxd3JUMUJ5cHQ3cmtkRXVoVVpnQ2t6bnhvNlNwTjc4MStI?=
 =?utf-8?B?bFZEZEJKcVRlZkFJaDZ0bWVLdzEwNmI1Q3ZkRk0ya0pjRXVXMnF3MVR5QVVs?=
 =?utf-8?B?dHB2NXcrTFg2eG1ydDVZL2kxODNEam16aDZpRm1oTW1BbG80dzRKUm5BZVMz?=
 =?utf-8?B?ZkJTK3lBRjlBTW1HYUFuRlJmekdMQWRKN2FnNXd3QlQ1OTZNeHdqQUFjMzBF?=
 =?utf-8?B?NEkxYVc4MGlrWXBGRVJlOFlvRTd5WGd6K2lkV1dFUFhjN1kraHd5anZvcEJQ?=
 =?utf-8?B?cVlvdzA1UEZMbEhYTlRUaTZrOE8zWkZqb3FTYjVLa1RHdWRFNlYvYjhIT28x?=
 =?utf-8?B?ZlZGazJsSmgxdC9jMHcvbHo5c1F4NGs5bFZiYjM2dWNmQnJrS1pWK3ZSeEZ2?=
 =?utf-8?B?Uk0vMmVSRUt6T2F6c2szT1lIUy96MzhGMUY2MkYyQklSSWdMRUI5cm1tWStm?=
 =?utf-8?B?cVNjb3VhZ2FISVhhMU1FS3RISnRQUWNxSUVscDRNRXoybGI5QXJ5MzY1clRL?=
 =?utf-8?B?MEt2QTRxR0w4UzQyUlhuc0JiZ21sYVh0cmU3OUlOR1dtOVZ0eDNkNGNsWDND?=
 =?utf-8?B?d2FUTVU5bHFuL0E0V0VhWXI1Q2hSNnZFbzQ4ZDE3bUUydHF3M1B6OVByV01K?=
 =?utf-8?B?RitsZEc4K3RKUjJUTE9mTFRYa1QyRDN5MURGdXRZTUFSK3pLRVFtMWdjWjNQ?=
 =?utf-8?B?aEhDd1AyNWxPclpGMDdCQXRqeWlqYVlXN05rTzl2alhxTTkyTk5BMGw4S0Jy?=
 =?utf-8?B?bU9oaVhNVXBKOEE2VVIxcUVnOUlmSS9IY3E4dE15aE5nTjVnUmdpdFJ1VHNy?=
 =?utf-8?B?ZE5TWTVIaVFaREVGMWRkcW1HQ1Z5ZWV2alNHZzN4SC83QUVjT3NCODh0SzFv?=
 =?utf-8?B?aDVKdjUrM1l4d0ZnWFgwN0ozNVFrbys5cHlxOXI3a242WDU1NHBESkZkbGg1?=
 =?utf-8?B?QVdJQVdud1JoNTg5MXdRTWI2UVlndXMrV245TTE4MUU4dXVlSDhjenFITkxM?=
 =?utf-8?B?aTl6aEtoZTZURWJqMWEybDN0dTljeEprR255OWN2S0hSNHlHNnFZemFuc2wr?=
 =?utf-8?B?Mi82U0xtc0E3MXBJdTlqc3FOblFoeVl0RVR4QTVVQ2NrZHBkVlo4S2xlMWpV?=
 =?utf-8?B?TVZpZUgwMkxmWklSbHhBTmRzc09XNkpOVW1QcG9lbDJJQ3gxQXJEWCs1amwy?=
 =?utf-8?B?ekRGQkNGOW5VUUVZSHJHS0xLUU1XY3Y5R3BIY0llMXlvN29STktZWHhvSVhV?=
 =?utf-8?B?WS9sdDJjb0NQaHdab2llS1UvSDQ3SzB1TXVKM0Zyb2YvL3ozWFUra3FURUpX?=
 =?utf-8?B?UERQdUxRb3BKV3lpV2xGVndUeVM0K2xZeU4rb0FORlgzRnNWeURlTVU4R3Fx?=
 =?utf-8?B?VklkVFZYS2tCL3RLK1YxSVNFYkllWktzeDR2K21iV2NkYU9WQ0d5N2o1d1gv?=
 =?utf-8?B?TFl1elV5ckVIa3d3STlFSlZ4dkxwZHJjWWlzVHlmbzVnalZqZzk2RUF6UTll?=
 =?utf-8?B?MmJEMTR1OVJia0JYcGtKYXkrNWhoVEd2SE9XUDZJOE5ZWWg5dlB4NUh1K09a?=
 =?utf-8?B?R3pYdWkxKzBOWWdXd2ZCWWlXOURpbWtMWGh2WFlMYkFtZ3dpVjJGakpuNVFM?=
 =?utf-8?B?UTNIaUtnRXFhWDZDR0xFcHJ6U3B3a0NtemwxOWh0MHRVcmpiOFVQUUFKVitm?=
 =?utf-8?B?QnRncmVZUXZEdEpleGk3UVBTaU5DMGlENExZTU1lVjJsdjVQazQydXNObno1?=
 =?utf-8?B?TVkyVC9JMUYyRTRlenFDZjZxRW4xUEN4SmZrV2dtb3JnenZWYWxoUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 373c1994-8eec-43ea-d645-08da3d7bf15b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 11:52:56.9695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V5toK9vEFQkoOiUCpe8i09A98hfort9IgjhRBqKM8K4hmd5ChDjYRXOiindXAo87e7+Q4M1yShFfXjb7MFBVSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5381
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 5/24/2022 5:07 PM, Mika Westerberg wrote:

> Hi,
>
> On Tue, May 24, 2022 at 04:48:03PM +0530, Basavaraj Natikar wrote:
>>>> +
>>>> +       status = acpi_walk_namespace(ACPI_TYPE_REGION, sys_bus_handle, ACPI_UINT32_MAX,
>>>> +                                    acpi_get_iomux_region, NULL, gpio_dev, NULL);
>>>> +
>>>> +       if (ACPI_FAILURE(status)) {
>>>> +               dev_err(&gpio_dev->pdev->dev, "Failed to get acpi_get_iomux_region\n");
>>>> +               return;
>>>> +       }
>>>> +}
>>> Oh this looks scary to me, make sure you get the review from the GPIO
>>> ACPI experts, Andy Shevchenko and/or Mika Westerberg. (Added on the
>>> To: line)
>> Thanks Linus for the feedback.
>>
>> Hi Andy/Mika,
>>
>> Please provide your suggestions for this patch.
> If this is about muxing pins, have you looked at the ACPI PinFunction ()
> and related descriptors?

This is about finding below IOMX (pinmux region) from ACPI namespace.
OperationRegion (IOMX, SystemMemory, 0xFED80D00, 0x0100)

I did not find any other methods to get IOMUX system memory region.

