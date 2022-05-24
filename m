Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F28E2532BA9
	for <lists+linux-gpio@lfdr.de>; Tue, 24 May 2022 15:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238024AbiEXNuy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 May 2022 09:50:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238064AbiEXNuw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 May 2022 09:50:52 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2052.outbound.protection.outlook.com [40.107.94.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 763899CC8B
        for <linux-gpio@vger.kernel.org>; Tue, 24 May 2022 06:50:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HgJToFpB6K2D/uoD7WF0nU3RNRmVCvxTN/LD5DTjPonidMfwghucwMwa8JmJrbCLxtA5/Tvylnypch3m0XuzEFjlk/vj0EaM3hABE6zPnCIgZewgNwjV2+x8+BIdqTlaeIssH0kCTpOUKXcSdScozO2IN3PJ+OynwvHUXALk7OCgoo8fll7Ybl6wtlosL/fgKlIBxLi+zqvRQwd1uhXRaMS15YK4o7HpRlHq7vdfiKgOIL5uB/a/SrXlGdj0gn0uEwntoOwO6uxGaEnuUmZZ4S0CnsWW2tBcV8RVELK9Szld0ZMGOm/D+h94/zrxCwJLBFFJECcPkuP5F7FFqRXeUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5mGj9ksHGaZ/SUtcIXwQukzCgJ3jg+3qH40A8BFj8xE=;
 b=QFOQWONw8N2yUL2MPmWuV8ELjMY7G2WvhX+QFG5etAN6UljCzTKfl31VTAGnnCkcmZ63mSUn8ZE0+MW+r/PU2B5Jzk+Uu2DLwXkMrj8qHHw0lExYijTCMB77UajUbNHkK63Na0soIv8YkUVDkZUZDEMF5NTXfjVxZzJEGMNuzlWNv6QM0o1KezSIjYf1AHZBK9dhXvb/0wq9vmVOgyAbfcWICMzS5PkGvxVWniuPLsfhuW2GTMHQMd8d8pzmk81rOaIim6quhlZaOOfQ19fX8ilsCiAKFOdc4+jBZqc5owdc4UbUN7DMglSWfmAWcTR+q/Q84L2GcTAVrvoxWDfL0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mGj9ksHGaZ/SUtcIXwQukzCgJ3jg+3qH40A8BFj8xE=;
 b=NOK6FVgLKoIbaOTwyiS24mmZnliRdDEqukWbmfLZGRXqA1z0EroQ90WshAJQql6xwNKIkhK2koIlrF1DuifmnaXAN2XmrEIIcmubo7e5E/R71NRBbPJls+cxM/07D5Hnqg84UktAOBW87XsbnA2DHJo/Ojtck2Djvm5p+aj9b9c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by MN2PR12MB4640.namprd12.prod.outlook.com (2603:10b6:208:38::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15; Tue, 24 May
 2022 13:50:43 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::b3:bdef:2db6:d64e]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::b3:bdef:2db6:d64e%8]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 13:50:43 +0000
Message-ID: <d14a0bae-c43b-f365-2fc9-873ca03eb87d@amd.com>
Date:   Tue, 24 May 2022 19:20:34 +0530
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
 <c79fc5ce-469d-a547-5485-aa00210db79b@amd.com> <YozQxvHzoiISqjob@lahna>
From:   Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <YozQxvHzoiISqjob@lahna>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0126.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::11) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90d7645f-bd9e-46aa-3c04-08da3d8c6545
X-MS-TrafficTypeDiagnostic: MN2PR12MB4640:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4640E2D730E88A1B0D2E91C4E6D79@MN2PR12MB4640.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h749SmQ4nXA7jB4PDYW/p718DKPy2XY5QnPxiom4/3a3Npg9d0nDBXSMfImLauALeaIc1LG4erv4gv0mfZ/gnW4PqvVq5IMkX3R2rIOv2WmmOfvmeMfRmjv+/NHl6NU2SU0BDbpebpO4uoyL0eqyMWVkEg8HMDH+z5zBlATH+z1nv5ZGuteMvzC0i6RqVpm/eluho4DBN35aChUP1Azw5SRp0Ko84s0plwFl7YWQiJomdzM2QT4VCbFVBqZcYsCUZXxlJaGvF17Dn9jMKKOKba0IMzNwXyiTgsVqwquoVV/AszrkyJ4azX4i0NCvQTFcN0X3K3hSSjD9JR9ynPfDG/ZkWfqv5/cQuTnveWgopkbPO/YS7r1uvB4tcfBEVC5b/cQDHkM3S/E/Ap6ZfaOx5jXpnPY85pa4HFis/gh8XSjAjEVlmgBGLSjCItuCZ6Ugg9iEPt+uTzc9sd27ri1JLb2q+5hBl01FUHyhk7Mg/KPjde4/fAxrCYhtR7dvnyZV1Ogtbz8YPO12OH1qvpiithq5DOUH48HujH31Wxn+ljLHeb4zs6YvgoEMXUGty84v13zqO4ZcE4IZh2AwK047B0lK1z4/xgVPfeAAwRaazImFyeygkY/OkTWvKHp/Sv3JnEqpJNQP4GMfCI+dGY1KccqRno059jeJcMCp8PKSsn/0kb37uxWE+bQ5P80zL+Qa8ty71PYw7rGwjP9Q7fX33HOEg3I/vMbtS+EMTpf1gfgEHAV4ssb9HS9L8uXuoZCW
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(6916009)(36756003)(31686004)(54906003)(6506007)(316002)(38100700002)(53546011)(2906002)(6666004)(508600001)(31696002)(66556008)(8676002)(4326008)(66946007)(5660300002)(186003)(8936002)(6486002)(2616005)(6512007)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVlaOUpia3V0cXlBRVBYU044TkQ3TzBTcU1sVW84ejZDdU5ncFZRQU83LzBR?=
 =?utf-8?B?TGVORHlUSXhOamRGVnZVUWE5dTlRV0V1S3M4VmZ6TUtBRHZUWXRkRmhKOGVS?=
 =?utf-8?B?ZXhjVTBKUWdkRTNZeUxTYlFKYitjKzk2Z1lWUlVPR29UdW1CUUNMaTlzYkE0?=
 =?utf-8?B?K1ltQ0xrYVRheHUydndlRmR1ZHJ2cTRlNmREbStzR2NQTmx0TTZZTmVOWi9w?=
 =?utf-8?B?WUI3bkQrRGVQM0NVb2dNbUw1M2JLOSttOFVDWGIwRGxwTCtkWnFmNWRIQkNV?=
 =?utf-8?B?WkI1U2xLc0lHdWR3WG8wTUxBRkF6RTJLRE9QdnJuMFR2Q3ZLWllldld3aC81?=
 =?utf-8?B?VVR1aTAvV05WTjVVQnBMOUVJdFdkNE4rRG8wbW1YU3ZqOW1aTVoyMjZEcTY2?=
 =?utf-8?B?bUtaQzA3YmRnTU5kL2UvSnVoOFR3aXgzV1hYbW1JL2QrRWJoeXQ4R2xlbFc3?=
 =?utf-8?B?WVhHaU44azRDR2E2WFZVTDYvYk4veDdFYlQrNmVHU0tmUDlGaGtXUng3Z1pa?=
 =?utf-8?B?RDVjWnVDZkloL2RJM1ZXWnZ1eUlNSUtqVjVBdVBaSU55Si9zRFoxMGxsQkR1?=
 =?utf-8?B?TXRPZ1VwbzZtclVsalk5UGYvT2JndFk1NkxmWkVRejgyUUJoL1A1akdMWFBH?=
 =?utf-8?B?OVlPLzBCRjR4SEhZcDNpZ0JpbmkzejFBTkkycGtZS3RRUklZa1V6LzZXc25I?=
 =?utf-8?B?R285OE5WK0hJUFJSd09qbHV3VWltVWI2RFJMS09WY0t3Slk5MGpZQmpPVTQ5?=
 =?utf-8?B?UG5pSW96ckRKMDZ2RzkzSXAreUNwUUFBZk5zNitmYjF6dkoxR3EyNWpzMDdm?=
 =?utf-8?B?d3podUdVWURGMnR1UGt4ZEFBTDI1NHdNY1BwM29sNERFWGd3S1ZWTWRJbGx4?=
 =?utf-8?B?cWhUNDVTVXN6TWIvZU1MZHdZMzBvNXdzWEo2SW4zanNIYUVUbEZVcHBncjY5?=
 =?utf-8?B?VmxmcmZXKzQwQjN2MFEwSm1qMUpTRWtLdmJVcFNrblUwREhhTHJMcXdoMDJv?=
 =?utf-8?B?VUNzd0VVNVI3R0ZUdUVKdVZLemR0djZaQnllVnZLMUh6YWlFQTNUZ1hEMVlY?=
 =?utf-8?B?Tm5pQVh6UHh5WVdyM1l1SmY3ZHJTV0ZFUGo1djI2M0o2bjlVM3hZUFhBejFx?=
 =?utf-8?B?UXdDMFpxM25ZeTRKWS9SL1dsTWQ2VnorVXc3cFhwODJBUzBKa1RabU1YNFFX?=
 =?utf-8?B?cHA2K2tkRmU0YmFuc0VFd1loTnVvaU5yRS85ZjJvK1dNMndhL3lCcVZJT01p?=
 =?utf-8?B?SDRZbnRiWVRyODdWbHBwNnB0cHNLd0ZTY2dpZUM1dlMvbElXSVNXOHRzK2tG?=
 =?utf-8?B?K25GYzB5NmRpSWNtOWlneGJTSjRrSlJVblVrdE1wdVNwZmZBMTRmZ3RvZmdK?=
 =?utf-8?B?QWpOYTF4T1JNRFFUeWtvdjRwVW12N3kxZVFrNTFTM3hZUjFMYW1KQStDa21r?=
 =?utf-8?B?S0kzeVFZbWpVQnRHZWlDa2ZrN2tzKzVsTTZIajJNdk1VZGxOUGZDaFZDVExF?=
 =?utf-8?B?a3p0czNGT0FvV1hqa3kvWldiMWNrOEd2bzdlR0hhSGRHQ2VNWkNaSHNDNnQ5?=
 =?utf-8?B?S212aFhLTUp3Rzh2eVU2NGJ3ZVVzZnFxbFh1OWNoZlRpS1hMTXg1UWdzU3lX?=
 =?utf-8?B?MFJDeGdheE9ETi9sVEFLYzBJZFJIWTgxVTVVaWY5S3N0ZUpnQ3U1RjBXUFdr?=
 =?utf-8?B?SnAwUEc2YWVxeTc1M01RWExhV3JuMk1YenpCL29UaTlnQTFnclRRTUovbTEw?=
 =?utf-8?B?OTRySVBuMUZiZUdINjdtMlpWek5CY2NNTFR5MGx1dEhNd054ektWRUl3S3o5?=
 =?utf-8?B?SWxMTGFVd3BpeExSb29lWkJyTnEydXQ3bWFUWVdFeHB5eXd2Qmo3eTVEUTM4?=
 =?utf-8?B?bWJrWHlYRlZBMmdrejJ5aHQ0ZVhTblhxUXl5Y3NPU04vMlZFcWlhR0lZUjQ2?=
 =?utf-8?B?OVhiemtIVUFmTVFNYlZGWFk2alJmS2ZId3IwcEZSdWhId0ZDY29SaDR6SStY?=
 =?utf-8?B?R2pWVlRNTGdSVmVRWm1zVjd3bFpGZW96VzRMck45eERXMkdrV1JIZ2dCQmpL?=
 =?utf-8?B?THdMMXMxTmRBY2FnK3p5cVNIWlBWdGE2K0l5V25ZWTRJbXhNZ2VrYm9ieUxR?=
 =?utf-8?B?ZUE4aE4ra1l6VGlqM0JpK0c0azdaRHN3M2FBZWJYcVJMMityUzF6VGxTNG8y?=
 =?utf-8?B?MnRMM0ZsaXBYZ1ZiQnQzUGxKZEpmbU8rYTFiQ0pGeFdUZmpIdVhrYUNXQTRQ?=
 =?utf-8?B?SktKbnZoeHVDcGsvU244WmRyeGlDWmhXeGtPYzFnTGdhcFd5NkRIL3NPTnpi?=
 =?utf-8?B?WHRGTlZuYm0weXoxdlVUdkpmZVFRTnFtT2ExeFZDUEcySlJzLzMydz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d7645f-bd9e-46aa-3c04-08da3d8c6545
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 13:50:43.4015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: re7xXDij/ymx183tVEe25hbs0v8O+w3e6rvdW9e5tPd4GGj0VULkjuLme95mOp5ShdsqyeTKJKJGvzHY6yg1QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4640
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 5/24/2022 6:04 PM, Mika Westerberg wrote:
> On Tue, May 24, 2022 at 05:54:47PM +0530, Basavaraj Natikar wrote:
>> There is no CRS method defined for IOMX/0xFED80D00 in ACPI namespace // IOMX Address Base 
>> Hence I added additional code to get IOMX memory region.
>>
>> since _CRS method is used to get GPIO pin base for AMDI0030 in
>> pinctrl-amd as below, same is not available for IOMX
>>  
>>   Device (GPIO)
>>         {
>>             Name (_HID, "AMDI0030")  // _HID: Hardware ID
>>             Name (_CID, "AMDI0030")  // _CID: Compatible ID
>>             Name (_UID, Zero)  // _UID: Unique ID
>>             Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
>>             {
>>                 Name (RBUF, ResourceTemplate ()
>>                 {
>>                     Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
>>                     {
>>                         0x00000007,
>>                     }
>>                     Memory32Fixed (ReadWrite,
>>                         0xFED81500,         // Address Base
>>                         0x00000400,         // Address Length
>>                         )
> Is there something preventing you to add it here like below?
>
>                      Memory32Fixed (ReadWrite, 0xFED80D00 0x00000400)

yes few system has different entries already defined like below      
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
                    Memory32Fixed (ReadWrite,
                        0xFED81200,         // Address Base
                        0x00000100,         // Address Length
                        )
                })
                Return (RBUF) /* \_SB_.GPIO._CRS.RBUF */
            }

if we add or in future some entries added. 
is there way to map particular entry for IOMUX? 


