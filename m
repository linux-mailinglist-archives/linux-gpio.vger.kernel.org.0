Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF8E25392DB
	for <lists+linux-gpio@lfdr.de>; Tue, 31 May 2022 15:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344942AbiEaN6Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 May 2022 09:58:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243424AbiEaN6X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 May 2022 09:58:23 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2069.outbound.protection.outlook.com [40.107.220.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C2BF5931A
        for <linux-gpio@vger.kernel.org>; Tue, 31 May 2022 06:58:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kKYv0kWWTAXi9e2Rtz9bYZVU0Bm8E77KzzvlUEdtD68daecPoVu3SY1IXZa13hTRlayI4bUArT5XtaoK1ngBDr1lcUoB7xZdZ5gS6zI/QxB0mX8OwSorb4SEib4eWts6DhB8KrYHBNt0QElneJtlFFC58gegwlL1w2yMk9/u64hotMkD2We66qdOK6kl4JX5VqYZ6SyRIOcYpjoSMmiOkBZXmKGsDga8BU6FYpCbWKu5zZxjtbPc5VfTzw0bxXAS6y8W6yZmbxOUEYExQQaLEwW64+W+/3pU/O2POgq8le+9epVAGGAcpFCuPRLCrTh1l3908/TQ4iJRXQrCRx9/Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aoZxbwSCpv0z/lQxEpD0Cws0u3OEGGZZp1NZqI9RJPY=;
 b=I6IsHHHfzhbhoHFCeCNp8w6zQSTA8tcgJ1TmIn34R0U1ppX31Y0FSJfxG5PXkQsgLyCc7Ks/Pvuqs3GheSeuUfX7OfIKpQgygmF4TE2f0F5umpZGHecoJBybsFEpaf40LzrnK5jviSni9VOI+OrdHyuPlX0vQtyIzHQjdTH995PjrXbbpjXReZCzz95v4p44xDLxJlSIY0DB2jxqB9DLRYVM/XfVe+5pqZTjTNKSG0V/iK7y6p23/np8GKCm+LVR16OmwR+EnOwzV5MUVwlqqQdvM1FSHDX1DRvriSQm7CPLVrkclNAVYYXca4sn7txj3lY+dFBAXf+t2XQmucUo9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aoZxbwSCpv0z/lQxEpD0Cws0u3OEGGZZp1NZqI9RJPY=;
 b=plwzfxwxMkZF4DP+GT83dXUDQFSoh0jhskh60fWkGIakdPNhw8zDqpEZzVAClz+ioNs6VO0H3bP3ei/eBKgr9F0z+LmIDl54olCMz0PgMBiZbO1EtMwptn9KYaHBnmiRNPMpJuM/QEBEzbLBG3e28bjbIDW6mtE+JJT0ycl6pB0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by PH7PR12MB5830.namprd12.prod.outlook.com (2603:10b6:510:1d5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Tue, 31 May
 2022 13:58:20 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::b3:bdef:2db6:d64e]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::b3:bdef:2db6:d64e%8]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 13:58:20 +0000
Message-ID: <968dd586-afc0-691e-6701-3b031ffd43b1@amd.com>
Date:   Tue, 31 May 2022 19:28:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 4/6] pinctrl: amd: Define and use AMD_PINS macro
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     Shyam-sundar.S-k@amd.com, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com
References: <20220531084322.1310250-1-Basavaraj.Natikar@amd.com>
 <20220531084322.1310250-5-Basavaraj.Natikar@amd.com>
 <YpXsjDEkUVw/KXdu@smile.fi.intel.com>
From:   Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <YpXsjDEkUVw/KXdu@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0092.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::10) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66fbd934-8958-48e7-87d8-08da430d9e96
X-MS-TrafficTypeDiagnostic: PH7PR12MB5830:EE_
X-Microsoft-Antispam-PRVS: <PH7PR12MB58306399AC23CC98FAF5E474E6DC9@PH7PR12MB5830.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 12yMtQ411H/yK2bxUrnzLwpHAE4s6XHp+tACqSv6MLuVQ/gezyrjBvu1ggk656GCtZly/+HN4inws3SZMcr/PWLABbRKV3567jJkqvPh0aBccxbG9eTly2sjrNvAkcffq1tnGRz4lcHO3eEJn5s9CbIZh2yT9RGn8d+efSbDxWoa//q/HvWywxfkA2xooBFENP7wPfZyNmzh0rYF86xwEjDXFHF1FBBEEmbiRLEuIhk8xQeObSn9lHzGHplbgvh3YE2q+vzw3uiBKE3Z2li5NSbArs6VALV19wp+Jru8ExEfMogrFGBPTcGz2bfwt9jBlZAt+N0kTSkoqEfdCsXvZC75vBh/R6lKFZamXJJVZrgNf7VytGYNkcOW+9U6We6fv8dRcSYk90P1Qu8VK5cNZfztGl6hReYmUrAM7ikpFm5RipVX3PIKdsFjNHd0PI76k62ijhysM+7ZAWvHSQSwDxJLjnGTaW7xGZT1DWBE90uY5S1Y0gIwo9uk0r6tRS+krXXRNjfcPTgyTh3fAG0fC8ovtUgJLTXrdUr+tyZ+JHFHNf9ul4fkbfRVhUAEBCYLqHGPcbyEikYMJlXJLEX3m7aB1BHrShifchXQtHrjlcvR872B2eGw89c256YKciIvfjLSyYnhLh1Vvbb6X8XVlB/qrMCN5LzbJ/ipA263N4ICz6W/Hyc6ceAmjDRwRC/ZgT8KIh+9PPe7TdXdhazHmU4bGNoGibI+KKcmAZTh5e0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(186003)(31696002)(8936002)(6512007)(6666004)(2906002)(5660300002)(4744005)(2616005)(8676002)(316002)(110136005)(83380400001)(508600001)(6486002)(6636002)(4326008)(66946007)(36756003)(66476007)(66556008)(6506007)(31686004)(26005)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmZHZDFsenAzbGVzOTVieFVnSUF0NXp0K0Z5MzVvTzRmdDQvZW1pOTlZL1g1?=
 =?utf-8?B?WFNsK2UvN29PTHBFS1dkbEpPLzlkL0hTbzg2bDUwSDB2aTlHY0l0ZXJPUVpP?=
 =?utf-8?B?MXRDNUZGaFdqeWVObFBzcXRpaUpwZmx1M3M0U2NreDJ2WWtHdnpCTjNFTjds?=
 =?utf-8?B?bnA4aFRyZExKa096Ti9GdnBpZnNEaWlKK0g4Qk93RGhjU21HWFF3aUJSdDlQ?=
 =?utf-8?B?b2lXTWlza3JxS3l5eTZqbFZ5RnJCeE5GNzU4czNzZkE0Lzk3bk9tK2ttQXJv?=
 =?utf-8?B?UEdpMXRJR0NSaTF3R29FMmVQOEw0emd3Z25TeXlNZzlrcTBHaklhbGVBVld2?=
 =?utf-8?B?MGUxRzNseUNYYU1LaDBlalE0RENuN2lKL0tNM2NhdXFpakJaeEZOZllHclMz?=
 =?utf-8?B?ZTlTMi9UUmkxNVNoYmU1OVUxQjl0MW1objR1eGtHRDB0UmNnSFQvcmQ5Slls?=
 =?utf-8?B?SzZXeG9HMVUyK29BNXYrd3NTQ1Fzd1pNWDlYMFdFd3ZaZzlkMDM5WU5hNnNz?=
 =?utf-8?B?bEtRYnRXZUVtVitKcm1RUWxzYVk1ODhmVVJqcnVLU1YrZ2pjUXFxVjVRV2h4?=
 =?utf-8?B?dTBIam9Ydy93ZjlQeXVVWWdnQW1QbmRGYnBWSEtkNkxReXNmdW1Xd3N3LzZp?=
 =?utf-8?B?ZFFEY05mUnFXZEFXT1k4OHQyejFjZGpSZ0h5N1RoRWdMY2NleW5YNnNGRW1r?=
 =?utf-8?B?SlYxZ09BN1l0YWJ5Q3pCeUIxcm0yL1cvY2x0dUt4NkdyUUJadlhhbVQwSEdD?=
 =?utf-8?B?bnBSbW91KzNFWEx0Z1M3WmQ0NEE5V0l1N3pmTHRuUnpLQk14ZTlkeFBBUmI5?=
 =?utf-8?B?aDBZTUNQWFJWYU5rdE5rbHE1Qmc1TjZ5Q1FCa0ppSUFrMTBKNjhqVU5sQm5T?=
 =?utf-8?B?RUN1ay9qcjdmNTZwQTlWRzM0ajNRSnJxWWZNTWNtd3ZoSzVJU2F3ODNrTGUz?=
 =?utf-8?B?TDBsSjRTYndBZE4vNXcwZXNSYjl3QnYrMXlVOE1YRGUvZ1dneDc1NmR2eGRJ?=
 =?utf-8?B?U3BNaVlyWU9CdWdKWDBKWVR2cTFtWlhIVlZ0Z3BvV3NWSjNhL0JNdVgya2hv?=
 =?utf-8?B?a1N0L2gvRzFvYmJTV2hDYmx6dnVLRVZVMjZqMkE3Vk9Ld2UxZmxhRVlqeTZ5?=
 =?utf-8?B?eERCTXB2MkZHYW1rWENaWHhzUzNQU0VlTGIyU0Z1aTYxSWFOSTdWRjB1bWpQ?=
 =?utf-8?B?SzFDV3VFQW1kVjhhSDEvbENYYyttNGNNV2NBd0srMG9wRkxNenZjUlhoeE50?=
 =?utf-8?B?ODkybERUeWJ5cktTVnlCVG0welU0WHhRRHpwdm9UQ01jc0owd0hRM0RDeGNL?=
 =?utf-8?B?bDFub04wMUJnK1Z4SmxYU1VvNWJEcWJFUThhS05GV3RjZS9mK3dlbUVkVTZi?=
 =?utf-8?B?UUx2UnFxZE5qMmV3Yit5MUVvRnEzWGxCbVBCUEE0S0N4WUpNazk0c3ZTMitC?=
 =?utf-8?B?ZUg3ZFlsa29DRFRZYjhjQUllTmowZ2Q0cngvQlVRRXFuTTJKNHFFdjFCak1W?=
 =?utf-8?B?ZGpTRmlOMCtsYnF6VFFrN21Rdm1Pd1kzTEc2K3lnN3hhZVl6REc0U3JUQThG?=
 =?utf-8?B?dXU3MGRqVmw1QlVFc1ZNa2wzVWNUUW54WlJXOHhpSDhIZzZiR0ljY2Y0TS9C?=
 =?utf-8?B?QXpmUGttbEJ5bkFJRnR4dDZsMlBBUCsxM1prMXhHSWUwN3FxeE41UFZVT0NQ?=
 =?utf-8?B?YWJIUTNpWlV4NmE2RjFXQTZLTThheVJ0VDYvQnNZNnN4c0ZRSnJMdGNyRlpy?=
 =?utf-8?B?V2M1S3VyMDlndkNDa010enkwTktmRWJvTFlZblhIQWlRUnJOT1Q1cVlDeVNN?=
 =?utf-8?B?Um9XczNjM0hheFc4emxxMUlrNUFUZzVFUWZTeitId1RIem93QlJleUI3U05C?=
 =?utf-8?B?T3NXRGpxNVBtZlMwRXVualJ2Y3JEZ0NVVGNrOUdCVEg2ZTFnVVp2b0wycVE0?=
 =?utf-8?B?cWJmTVBBMHhQdFN5Z05aMUxXK0xvUmhvL3QzSlYxTCs4clhWOCtrWUdrQ0Z4?=
 =?utf-8?B?Vlp6dHNTeG53QklraEZkNEF2RDRELzhic09WSEtQQXgwYkRJTDZRRitONm1Z?=
 =?utf-8?B?N04vVEpxcTZEOEIwMEFjOUZ3UVlVamllQ002MUR0aGhYQVVnSnZ6MnMrcjAy?=
 =?utf-8?B?aUNKdFFzSGJzRlYrRjFzaGtnUlhBOXo0bmRqcWhrN05CTDZodVRpY0ppUnFU?=
 =?utf-8?B?c3RqUzJBWVJrelpTNXdZbHZ3L1l2Y29sWGV2RWRRc2NyYm9zaVNxWnhOZGVu?=
 =?utf-8?B?Y09zcldDTU40Q0JkN09ZdGFDK2pEdSt3NmpYU0VrZU0wbjZqSU9CdlZlMWlN?=
 =?utf-8?B?TGs1a1pCUndLK0dFNk4zUDlxRVozNlllbzZhTVdqaGdzODk2ZlRsQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66fbd934-8958-48e7-87d8-08da430d9e96
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 13:58:20.4552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PfH0fFwEuo1SrHcKluISSaRWGsqziwyBjGGdNfHtYgMY78lcQexj6WJKoYAAnc+r3sBfrQqWnc6jLRphFhFl3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5830
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 5/31/2022 3:53 PM, Andy Shevchenko wrote:

> On Tue, May 31, 2022 at 02:13:20PM +0530, Basavaraj Natikar wrote:
>> AMD pingroup can be extended to support multi-function pins.
>> Hence define and use a macro "AMD_PINS" to represent larger
>> number of pins.
> ...
>
>> +#define AMD_PINS(...) ((const unsigned int []){__VA_ARGS__})
> Do you need to have it as GCC expression?

yes, or else I will hit the checkpatch error as below
----------------------------------------------------
ERROR: Macros with complex values should be enclosed in parentheses
#31: FILE: drivers/pinctrl/pinctrl-amd.h:285:
+#define AMD_PINS(...) (const unsigned int []){__VA_ARGS__}

