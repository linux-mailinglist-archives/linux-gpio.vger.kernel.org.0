Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52959532A51
	for <lists+linux-gpio@lfdr.de>; Tue, 24 May 2022 14:25:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233958AbiEXMZC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 May 2022 08:25:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231758AbiEXMZA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 May 2022 08:25:00 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2046.outbound.protection.outlook.com [40.107.243.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B42F9939DA
        for <linux-gpio@vger.kernel.org>; Tue, 24 May 2022 05:24:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwr6Sde8P2msYDIWXP0wUuLUzcX79NfpYAvTRNxdPIdiX0H07Fa/GWjk6+8Qv3aZRHTNXTak57Rq6+vcmyysaq5UZgVBvmjfHp93W+sH3M9yhnjCojuF1y/LxomADYEPgQaO1Vn59fAG+pBIBrwzFRIXgC03VlTTrRS4PWYw0TdHA5fzDuSEfLnH6FG7C9GhzgF3cfrVcCi4zkWbq+6cVj0PeqSOG3RQUi7mjS2kQJYEPDZUD28Sv1qnRj8bs2sBH9Kw1YB8N3WTKgtv3sHLKfAuQgP9AB7ZTEDaW4BroxSu26hkquWMeiyS80WPL1a7qfs3i68701ZOBLxYLIx+NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMDy4LsVU+hF7xGFjxt4AbewJgD2MmgOIe+2LRJJn2Q=;
 b=U96mfw+OYpFLEnEpptkCGSXmGOpJHAmdhABc65rjb4e/DNS/K9O9aRDx4zb8kBwV597yuoNmDII1lvwnCANMMMFNxps8oabex0AIJFbOC4flysNRn+q9bNprNCHkXYDA8HUSO+pD8F0FvT5ulPSVDUDhY6d2aTCnpiLhHWfxNlIAbwPVjx/BJo+JB0JGP4umnm3D8lEtpyLqR7Ux3hgfOWcCf/ZkGfkZxmRZcwhlUPH8ymb4g6OpmOCdtiO2wYkGIggbwsdaootOZGfh/Emue4PSdkfIhG2tRZaefYV8J4eHAr5gNX1P8KoKelq3H/mb2poULmlbxSRAVG4kcz1dkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NMDy4LsVU+hF7xGFjxt4AbewJgD2MmgOIe+2LRJJn2Q=;
 b=pb3OWuXe0pUAaFoXgNKYgsTB1ePxfmmrR5UdL7pqhaySawgyoc6iyjmnio6czaS0x4Cja69xQ/FSwT1SiD3d1y1hs9EBrQoHQAS/H5nvTlPqos1X5zFyDtutMYyuWQsJKy6426DHNGPH0lqxACimZ+5TM4WCVwGsbyU7gejz4Zg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by BL1PR12MB5079.namprd12.prod.outlook.com (2603:10b6:208:31a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 12:24:58 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::b3:bdef:2db6:d64e]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::b3:bdef:2db6:d64e%8]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 12:24:58 +0000
Message-ID: <c79fc5ce-469d-a547-5485-aa00210db79b@amd.com>
Date:   Tue, 24 May 2022 17:54:47 +0530
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
 <8ba8857d-c3ab-8959-5bc3-a4e225459f61@amd.com> <YozKd+Zehnlg1s1p@lahna>
From:   Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <YozKd+Zehnlg1s1p@lahna>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0007.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::13) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1aa8510-0c43-44e3-1e82-08da3d806a7c
X-MS-TrafficTypeDiagnostic: BL1PR12MB5079:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB5079F7AE0712801219C16469E6D79@BL1PR12MB5079.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +8jIygAGfmX2M/R7yiL/YMPcungC8rDbx1P1tHOEF3zdnkRxpouYUV/GOwnuYmb9k4q0pqgxuji5aKY5Dvg8EeTE/6ovxY0GrGVgqyy7v6vx8nl6I580YwspHHU9ZmG2O03DGqmPUCOs1yvzaiZRLoaey61XnPGm/qPqvxlaOkKooULUQPIfUPFmH6SUVLXxeW9yT06vF4O2N3XyrVlh20lmtyPdyCVrALgCpUuiGPyF/ZdgYuB7nFECwn0PJhuxikiGsTwzywHUTJfxbGTUanw7z6aCoVovxBwX1qq4XkGZkrP0pEc4nW+YQBB6aD8SSSPFJjsy7D1NWGDXm2X//lSOrw+kQLJuiI2Uy3YbGX2ffcj8BNcPAkhpkOnJYqfdNFB1tcZ+GO+n4nLz8Gq+AAPWFjzbTeLTa6+FVdI5JXSgXv5F15uydY84pfhXB7OI1ZbXHUyHqEfNh4P+n+h2r/5mC4VsQaMsTtOXcxJW7C27yAOa1w6e6F8RAjpN4BBYqJgHu9KzbWEjtOK3uYU7vEGz6EaIh7hi9TYATf6zZM160lSZo/FIz6zrEg4JW6C+ujcG2EkIRDvgi3aUmIXLANOOUIQogw70kyufyNvsgtMoC0USV6diF9oa14DMK4PU0pjOx73rKqqTzXAxRYYTIqq1i/H+6dk6SLF6GIntBpj1fOwGkdMN2f4ijRTbCqbOZa3naDsspVokBFMrC377XKjw/IhVIvAGed+EJjYtrW5L8IzcKTRCMPRX83CFR6Hc
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(2616005)(6916009)(186003)(54906003)(31696002)(6666004)(508600001)(4326008)(6506007)(53546011)(316002)(66946007)(8676002)(26005)(6512007)(8936002)(31686004)(36756003)(66476007)(66556008)(38100700002)(5660300002)(2906002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzFpbUphVVdHMWRTd2xYcVlxNVV2RFJ6NGFNaGFTS2N4TkQ5b2ZBQjRySDB3?=
 =?utf-8?B?Q0JsSEwvZURUZmw2N3I1dWVKOUZUc012aTg5UUhFSkwwR2F3QmFEd2g5RjhD?=
 =?utf-8?B?dDMwNW44MlZ3SWFYUTZsRFZtMHJHd0V5WllUbmp1dGh3VVVhQzVtSGFXaldG?=
 =?utf-8?B?M09ISHk5R3VpYW5nR0hUVlpKVmdCcFBpV2d3T3IyNjdCY2o4WThKOXRTQ3JV?=
 =?utf-8?B?RHBEK0k2Y0Jrdkc3Rml5NGROVDA3bnVlTEh1dkUzUk5LMGt2VW13czdlZ3NB?=
 =?utf-8?B?cS9qWnFNTnNsd0k1VTlEYndBdnJSR1Z4SEVnMDU5TjNXVjM5Tktlb1lGMWgv?=
 =?utf-8?B?WHZ1bzBtVEF6VGNQdkcrWVZCbkozejZhdVlxOTBlN01CRU95WjQ0YzdERFdp?=
 =?utf-8?B?RnA4ZzJnSVZ2bm9wZ2xLTzl6T3lRQXZkNUFxQkc3VVNHRjF0NXVHeGhrUFhK?=
 =?utf-8?B?Zy9XVkc3a09ZZEx4KzlMb2tqa1YreUkzVkRjS0JMOHRXR3h1UngzUERFaEJh?=
 =?utf-8?B?MG15KzNqYTlINVQ1c3hrU3hKamQzSUQ2bEszSkc2K3hoeGt6cUNDaFM1eGJL?=
 =?utf-8?B?NUVQd2tKcVQyQ002UTBZTk9OckduaHZ4QjZCUkFwYmxzWlVEQWx1UDZlQ21H?=
 =?utf-8?B?ZFpqa0VIOWY2RVNrc2E0aUVQck5PSmVWYnJ4MnBQYTZzSDRYL3V1N1kybzdr?=
 =?utf-8?B?NVpoNFVmQzRVa0F4NUJyMjdtanpEc1VTNXcxZGdMcGlmbjQzQzFMa3ZGOVBj?=
 =?utf-8?B?WXpPV2pFdUpsZWdnenV0MDQrSFp4NWxuZFRKeUJpeUVvd2lpSDIrRHAxaW53?=
 =?utf-8?B?WEVQTW83RlQ2RUw1T1lvMDU1bGNyVmxTblVxTWdyQVNiVWZ4L1dyaHExOGdL?=
 =?utf-8?B?S2Y2eHJ3LzBENHcrb3lRT1dRRUNPd01EUDJNTHRFR0MxNUI3SVU2RHRDTFRi?=
 =?utf-8?B?VzVHdnZvZDRjR281WFVVa0g2NW1lYWhoamx6elluM3hxdFMxTFNjSEU5WTBm?=
 =?utf-8?B?MjQ2b2NYT2VLMGpNaGVuckdESUVTeDREV214YzJsdm9oUThYWUNISWZqMk1L?=
 =?utf-8?B?YXUwU0N1MVYrNzd3TnE2ZWplaElPbHR5dlBDRERvaURlT0NDNW54SHlpMDkw?=
 =?utf-8?B?dkpidlRmZmwyb3pjMXFWSithNEViUno3MlVPc1owMDBhazl6a1dSOEdjdkdv?=
 =?utf-8?B?M3FtMGVQcjAwcU9yblF0Nk9VbGU4eVFpYjZWcW5JS2pXcFhwOUlLU2R4cHVt?=
 =?utf-8?B?T2hJVkZxRExadFYrY0l0UVJrY0VLTXQ5Y2l6eDJ2b3FTdVRJWWlTTjJ5TVR4?=
 =?utf-8?B?T3ViSm45czRVdDNlU2FRZE50NmRvcmpiRWFCZnZpRVdTQWtzUWFURFFaNis0?=
 =?utf-8?B?bzlkbkk0MHJtOUJuRzlGMk1nY25yQnhhZncxQnEzSW5Rc2NWR1hRNFBKaVlR?=
 =?utf-8?B?SE1wNDdWcUhWVUZ6MXZsRkZGTmx3RVQyUHZpTHZ3MER1T0NKa0w0VmJkeWxU?=
 =?utf-8?B?dmdEQlJGUWt2dkRVejJrcDRBbHZOREhHUll1SC9ZeFRIajNwMWI1RVFaZ1ls?=
 =?utf-8?B?ODJ3RUpRWVY5M3dISlBLK1NJSkV4Z3hWOXZHOFpLZGhaQ01EZGduVlRPNis2?=
 =?utf-8?B?aGlkNlVaODIxdkc5THZiRG1tSnhlaUlGREdDVFg0bEZUQlNIdnNmWDM4VTIw?=
 =?utf-8?B?bDROUjFnb2Y5NmpKOUtlbVVkWG5VdG1SK2dkL0xkQ0JGTnVRRDNTSjRBOEVD?=
 =?utf-8?B?WmtGWGswdDBOV1RJdTIzN1FTNGw1V1Q3ZFZiN2ZmTVZXaW1mWktZeHpiQ3Zx?=
 =?utf-8?B?WFd2SUpYMU9xN21mMlNlaWFoR29KT3JvRGRjTmk3eDlGejljZzNNVXJsSEp4?=
 =?utf-8?B?OW82TEt6UFdSZ0JJWUF5Q1pVcTJscndBZlR2YS9XcFhiQXB4ZmhycWo0enMx?=
 =?utf-8?B?YTBDMnR6aE9QMXhCaFl4MWpsdFpsY3k1NmNYNDJBSzhKMkZEa2FIS25idURz?=
 =?utf-8?B?UnJCOWVCeTczVkdkZkk3RnAxMStZcGQycGFacWpKK0taTFNXdlNqSnBFQnRo?=
 =?utf-8?B?bERmVlg2Qlg1UUFZYkN1REVpMUJkeDBIT3lCbmNHVjdiVVRWUTFrdnV4TTk3?=
 =?utf-8?B?Y1hRRlVHNlpmQzBVemRpWm5nendtVkpyT1o4Z1FpZ3ZYOENQaEFTZUU2T3Mv?=
 =?utf-8?B?T2NoNTdWRkgrOGlvVW5ncVcyeWsxbVZnUmJaUTJjdnU1d2RqcjZ2ZjBiQW1m?=
 =?utf-8?B?V1JSV0dZbHJXZW1aRjNKdHNwSTkyMk4rUitIT212c0paa3k2QmsyNmZpQW4y?=
 =?utf-8?B?ZThYZEJEN0ZIT2Q5cDFFR014TkdWRTQyM2V1d0ZHWDlBUEJ4RTlQZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1aa8510-0c43-44e3-1e82-08da3d806a7c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 12:24:58.1410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i9HUibcygMMEB7O4GuZeRFOPcr0NVKIOtW7C1XG0nnO2vhKPpfPSgvQ8wDgqyWfwyBf3xVoOYmJT9XqNT5SvVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5079
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 5/24/2022 5:37 PM, Mika Westerberg wrote:

> On Tue, May 24, 2022 at 05:22:47PM +0530, Basavaraj Natikar wrote:
>> On 5/24/2022 5:07 PM, Mika Westerberg wrote:
>>
>>> Hi,
>>>
>>> On Tue, May 24, 2022 at 04:48:03PM +0530, Basavaraj Natikar wrote:
>>>>>> +
>>>>>> +       status = acpi_walk_namespace(ACPI_TYPE_REGION, sys_bus_handle, ACPI_UINT32_MAX,
>>>>>> +                                    acpi_get_iomux_region, NULL, gpio_dev, NULL);
>>>>>> +
>>>>>> +       if (ACPI_FAILURE(status)) {
>>>>>> +               dev_err(&gpio_dev->pdev->dev, "Failed to get acpi_get_iomux_region\n");
>>>>>> +               return;
>>>>>> +       }
>>>>>> +}
>>>>> Oh this looks scary to me, make sure you get the review from the GPIO
>>>>> ACPI experts, Andy Shevchenko and/or Mika Westerberg. (Added on the
>>>>> To: line)
>>>> Thanks Linus for the feedback.
>>>>
>>>> Hi Andy/Mika,
>>>>
>>>> Please provide your suggestions for this patch.
>>> If this is about muxing pins, have you looked at the ACPI PinFunction ()
>>> and related descriptors?
>> This is about finding below IOMX (pinmux region) from ACPI namespace.
> Yes, I know but you use it for muxing pins, no?
>
>> OperationRegion (IOMX, SystemMemory, 0xFED80D00, 0x0100)
>>
>> I did not find any other methods to get IOMUX system memory region.
> It seems to be standard BAR so simple memory descriptor in _CRS ()
> probably works too and does not need any additional lines of code.

There is no CRS method defined for IOMX/0xFED80D00 in ACPI namespace // IOMX Address Base 
Hence I added additional code to get IOMX memory region.

since _CRS method is used to get GPIO pin base for AMDI0030 in pinctrl-amd as below, same is not available for IOMX
 
  Device (GPIO)
        {
            Name (_HID, "AMDI0030")  // _HID: Hardware ID
            Name (_CID, "AMDI0030")  // _CID: Compatible ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
                    {
                        0x00000007,
                    }
                    Memory32Fixed (ReadWrite,
                        0xFED81500,         // Address Base
                        0x00000400,         // Address Length
                        )
                })
                Return (RBUF) /* \_SB_.GPIO._CRS.RBUF */
            }


