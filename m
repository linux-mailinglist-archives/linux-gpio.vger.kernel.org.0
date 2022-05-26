Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 457EA534A62
	for <lists+linux-gpio@lfdr.de>; Thu, 26 May 2022 08:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239969AbiEZGa7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 May 2022 02:30:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231466AbiEZGa6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 May 2022 02:30:58 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2082.outbound.protection.outlook.com [40.107.236.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54F31BDA37
        for <linux-gpio@vger.kernel.org>; Wed, 25 May 2022 23:30:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HWjE/otwojoiwZgEjfZcHoNm5GOnlWiYd6uVnikzR6hjBcyfTZJXuH6DBecqX1rG/IBkLoVrAKuv9IFSg0dU+tNPBltVbHl1wQ2zPniIpTqrh3YdrymBaf8T8u6ttoC4/34kZYSfFIXruS4dJDhSBp2H9pK392q7tq0NeTEiubGhJTMSwKjTfMyHsREc2+WSBaZwyTalDq3MlTl8KZ/9WWTW6jTzTcNMV0/+8W1Y4JlmJtQcImvQ1ws83UqMagklDl45Y8l0qYtT1dT8Bjpv6O0r+Ixm32DAe4lWjaLOWJjUDxN+NDMZ1ZukKrITY97U0mMK2i8zzdrszZqHBM+YIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38LltYXZH7xz8Cy65n0CuklhMxS5H2cueZ7VvyQYpfY=;
 b=kPVCtr7yKYbMEf41JWd+hNHg+qXyO+5FVnHZBtQonAeUFUhHcdr017u5URfaKtgYXOa73R1RcqQuw+c01qi2PPTTndvpR4C8aDpmbPKvgGP9+YAnFq+M3o4rW5SBYXzEKWDLt4T1QzBwR9vZY+KWOHFq40JooCcm/Yi9vJl+OjYvYOBMZSsFf54hZzMmLAupBHOJlFSmi3Or6mT36ujr7hbuA6iK+W+UVw4Hs6iCACO1aIUAQmYUG77Xbhyvbgx10knNerJqZkICpn/hntrIeheSBYcZrjuWReiyL0HW3pLRFnkoY+EjwuFLgsMa1QnGEMaA0AQkNV18xlKU92jZSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38LltYXZH7xz8Cy65n0CuklhMxS5H2cueZ7VvyQYpfY=;
 b=DWOnxsa8mUAe9cxFskBA6zy3orOUqBnZFKRRW5nVGL3HVpcH32J7/4/XuMlBuPPcjSjOAbALYZuGZvu7RLRYEwnTvJyw/qep3quP6AIsS/OLhpLaPZH31B3o0Qf4zsjcYxKqUfI5JaIPCaikWO/mF0O90U4vz9UmNuu78ktI4wM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by BYAPR12MB3381.namprd12.prod.outlook.com (2603:10b6:a03:df::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Thu, 26 May
 2022 06:30:53 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::b3:bdef:2db6:d64e]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::b3:bdef:2db6:d64e%8]) with mapi id 15.20.5293.013; Thu, 26 May 2022
 06:30:53 +0000
Message-ID: <cf722a7c-2144-c53a-a186-8ed5d5c83e9d@amd.com>
Date:   Thu, 26 May 2022 12:00:43 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 2/3] pinctrl: amd: Get and update IOMUX details
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Shyam-sundar.S-k@amd.com, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
References: <CACRpkdZ267_CjNoro4A+eBASjz=qCL4ixLnbsac5U+gCsBSGwg@mail.gmail.com>
 <e35efb44-6e74-690c-91b6-c8270f624894@amd.com> <YozDbugZc8vXPHU2@lahna>
 <8ba8857d-c3ab-8959-5bc3-a4e225459f61@amd.com> <YozKd+Zehnlg1s1p@lahna>
 <c79fc5ce-469d-a547-5485-aa00210db79b@amd.com> <YozQxvHzoiISqjob@lahna>
 <d14a0bae-c43b-f365-2fc9-873ca03eb87d@amd.com>
 <Yo0KNY55M7d+eli2@smile.fi.intel.com>
 <800030c9-8a74-9186-b329-8a3edff273ff@amd.com>
 <Yo5dIqADnv/puBrb@smile.fi.intel.com>
From:   Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <Yo5dIqADnv/puBrb@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0055.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::10) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e4b84d7-98a1-4e51-ed96-08da3ee1483e
X-MS-TrafficTypeDiagnostic: BYAPR12MB3381:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB3381F285D39B1176A66AC081E6D99@BYAPR12MB3381.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s3rYQuXvxyXrp2MWXtdQShdoNFfNXUIl5EdUNkHaYEEBHsFuoglR9jv71lUEydNroUFW+8CNxlkyDgrh8dywKoQW3MbMMwyGZzjj/tIKKGiMNnIKEcvwo5qt/xnW37yu212/j/aedf3CYqSf8dzwNKFCaNvP6C+qcAvql7oS56a1uqzzfbNG5O0uFkuOqHa8T73xSBZZ0Dg+YeJNlFourN0wF7sGq5cuJsk8GM0JrMuhwaQkEu+cRJjY5gp9p1URqCzDHFJ+iIxDWaUGjuYlCD0qWFrMkfVV77P36Dzkiswgzq7WYAE9R4OWMjd1IfHay/8QsmVVL9WsSETtVJWUKDGkg8D/FJsvXr0i1HljBSAplBw/O9J4tXgJLR0YpSa0rOD6Q1O8EXaOQbxzSmFTFH5vexniX0oF4Zh4mG07lDRTmkbkb3gGFhNJuFpWp7Sd6IyWNwpP5bakGXSdBpUxGr5qn2SMk7ez66sZ+cAVp6aHKBnzqVegSH5+RhlP6aXwmgisIWQgLTmjnT9rVUYXnR0qFv4p3qbCjKrwbz3aJZHvhD8+O+D43iwSK8nJR3fvhThTdTLsFAgdMCLh1dS4LYt3C/OAOs1xod0BwZ6/FhA2M64bu2tYOeQbvMo7AHDCewKG8ZBwmkU02AOBV8q6qOsIplKMAu+iOS2J/QxBcNx0UaVbNzKUIkVJ6H7hbnJYGwdeWiu6YQQ/pJVKjAaaS2tVPiw4mRgVx8MEVyoSw2BymTs+EbnvGnP+DlivIdr1
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(316002)(6666004)(15650500001)(31696002)(508600001)(6916009)(54906003)(38100700002)(8936002)(66946007)(31686004)(2616005)(6486002)(4326008)(53546011)(36756003)(186003)(8676002)(6512007)(26005)(66556008)(6506007)(83380400001)(66476007)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wm01b1NqWW95MXppUzlKUXNRbWhrbm53QkFuY1h5WGNOYzNNT3pYZm0vZlc3?=
 =?utf-8?B?QWVnYTh6bXdCSzJxbS95RUR3RWk1SzBnYy9tbnlXTFU4cllCMjR6andiZEdP?=
 =?utf-8?B?akZpUWlPNXRuc0hzaHMzS0ZlNVJJUWh3d3pBK09MVkNmQ1YySkZDTDRJWHV0?=
 =?utf-8?B?S21Ea00vM0drMndRZCtxSHdlbUFLeDRVMnQ1Qk95OWZDK1RyNVRZWDNlRzFx?=
 =?utf-8?B?bFV6dmxkUkhVRVhDd0NKcXV0dEtRa3JDVHVOOTJmaDBKcHlUYTJXUXY5dGQ1?=
 =?utf-8?B?MmdFU0h3cUdFY0dIV1d5RGc3RVBHY3pqQ3F1RGZtdDVxQlVMUkwrc0o3ZU82?=
 =?utf-8?B?S0dKQnRKcFZSUVpacC9BdWk0ZFlsMnNVQi9wd2NYU29UWUJpV1VKMGZiaERj?=
 =?utf-8?B?M1ptK3RMMHN2dzU4emhTQkU5L1hLc1kxSTJkQ2RTUVh2M0dhdmU1NDI1dnZs?=
 =?utf-8?B?YXRQbDduU1hQTWlGRGVIL3duc0NEUGZhRHBibGliWWFPN3E2c2NyYkR6YlR3?=
 =?utf-8?B?azJBcS82SmNNL0VIZVZPbElpRDFzTWQyMlZGdEs2UmJ6aXV4anllOGJDVzZT?=
 =?utf-8?B?dU9SV3VKWWdiVEx4cXh1cno0QVNPZ2h3WjJRTXlZZ1RUOGNXb2ZWaEFiaGU5?=
 =?utf-8?B?SUQ2bUZRamh3WnArb3BIcFFBL0l1VnZCTFJDeXB3MFRGdzVKb1hYZ0x0Z001?=
 =?utf-8?B?d2RTNTNmcHZ5TjJBa0RXZjg4SlBkTGNoNWJ6MHE1V2lMSFppV0hiY0JXR29n?=
 =?utf-8?B?cENHQThwTEJaQVpaSHhheGtNaEVuald5eThLVTBETTkvSUhsQnkwYXlRVktp?=
 =?utf-8?B?a0tLeGQ4b0hGMjQrOHlPSklJNlE2N1JTUHg4TEdLSWZUcVF6UzBtZ2p2STla?=
 =?utf-8?B?dHVEbkU5WnBmMjVDU0lBNWorQlljMmdSdW55NnlOTStDL3JldXFIMTZEMDdl?=
 =?utf-8?B?bk5td3FsU2NzZzI2Rkw2L1l0amlha3J5eG9ldkduVVVnSHBjWjVURE5hMEhP?=
 =?utf-8?B?bFhEdXZQd05vd1ZnMEk2RG9LWFV2UEk5STNhN0dBb0xqdlZSZjhFMk5iM0NS?=
 =?utf-8?B?N3NZTWFxWTlWbkpSRll4ZStXd0hGZ2I2UFhqaG9VZytqSXpUd3Z5dERtWFlj?=
 =?utf-8?B?K2RSSkJ0d3djNHhUVmhYMnRGUmVwYjRyNGlrQkkrZzFLcUtMWE1XVEFGOVBJ?=
 =?utf-8?B?ZnNnYll0UExTS3E4bEVLVWlYUkpjaWo3T3d6SG9tNmJIaXpqd29tb3FaWTJC?=
 =?utf-8?B?c25wVEVhQmxaaU9lSHBGMGc0SFFteDJiR1ZoekwvS2cvU2pLQTNSVXYxTDFu?=
 =?utf-8?B?enNiMUhtSnUrOTdhZUxkUkRKR2ZYcXh5NzdPbmpPa0ZMTnRHcWtEODVQSDNX?=
 =?utf-8?B?TWtZOUt5d2xCYjgvOTlQTlJXNURMb1I3MHBEV2dkU3JBaWpYWEdWeC9oZU8r?=
 =?utf-8?B?UUxOMFFnMmsxZ3AwUnVpTnEvVENtaUEyYlB1VHpTRmw3WkpGb1RjeW83NHA5?=
 =?utf-8?B?YUdndEZPeTVyNE1yM0RFR3pUTGoyVGplNCtKSTFncGxiWnI0OUNOUzM4L1Bi?=
 =?utf-8?B?SUFrN2VKa0tSYW56MlBYamZ1MUtDOHBTQndEbDhmb1Z3a2JqeFZxaFZudXRz?=
 =?utf-8?B?eWErbXFPWTNtdmlpMjRVYnc5Z0IxaEZOYnBrMGY2NGI3eVNrek1KcU9VQkRt?=
 =?utf-8?B?Z1BnRE4zQjloM0UwZHpWNldhMHhMbkZYSEh5VlJya0VDWTlpOUNJT29FUFYv?=
 =?utf-8?B?d3VEZU1rdjFtYUplQVM5dzN1RlRPV2VUMG80TFpJeDRRUGNKMjNoUExpS3Bp?=
 =?utf-8?B?Q25FL3ZySjR0dURoZWFaVElEOERUQ0lyR2Z3dnRUQVRxL1ZqWllETWt5UjZD?=
 =?utf-8?B?Q2ZmZ0VDWTFURHQ0aGVNYkZrQzVPSUJEMkZaLzRkT3pVRldEQndGcU5lT2tY?=
 =?utf-8?B?bitBbVBrZFc1cVJHaWNsSWxZN2xNbHBBc0FhZDhTTG9YZU1sZ2F6T1dWd2Zq?=
 =?utf-8?B?QkFRTUZxUVN4NGp2S1Q0ekQwdHFvUDM0dGg2SU40bWswR1ZIZWg1VVlpdEhH?=
 =?utf-8?B?QlJ6bW5tc09KeFBpb0E4WjB6QmhWM0VrWTBkSC9mekFiWXRRNmg1aVBWamlr?=
 =?utf-8?B?R3N3RnVjbDlCZGFIbkpKeTdQZGNEWHZNVVFTTjdDKzJTdXRLWUFSMDJ3aDdP?=
 =?utf-8?B?ekx3YytYNjlPNEJ3QmxJY045VUdYekorbFNHMFlXWDlZVENueGJTU09vMy9Q?=
 =?utf-8?B?WlFiOWVhY3BWQXNxK1RYN3VMam1TVm1NRUo5Q1FkUElYaXdPbE05Y2plU25a?=
 =?utf-8?B?djRVNHd0QzdPSklaNGVkZys2V0IzeEN2Rjl2V2hkOXdETTBBZFRUdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e4b84d7-98a1-4e51-ed96-08da3ee1483e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2022 06:30:53.0118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4146H+PE0EUHoKyrhFQVxOTH0jD228pyJzKJL9pAR1QhpTUyZM31yuf4MjV0HVQy+Yt750v0gVzrwKsHTy7CKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3381
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 5/25/2022 10:15 PM, Andy Shevchenko wrote:

> On Wed, May 25, 2022 at 03:12:05PM +0530, Basavaraj Natikar wrote:
>> On 5/24/2022 10:09 PM, Andy Shevchenko wrote:
>>> On Tue, May 24, 2022 at 07:20:34PM +0530, Basavaraj Natikar wrote:
>>>> On 5/24/2022 6:04 PM, Mika Westerberg wrote:
>>>>> On Tue, May 24, 2022 at 05:54:47PM +0530, Basavaraj Natikar wrote:
>>>>>> There is no CRS method defined for IOMX/0xFED80D00 in ACPI namespace // IOMX Address Base 
>>>>>> Hence I added additional code to get IOMX memory region.
>>>>>>
>>>>>> since _CRS method is used to get GPIO pin base for AMDI0030 in
>>>>>> pinctrl-amd as below, same is not available for IOMX
>>>>>>  
>>>>>>   Device (GPIO)
>>>>>>         {
>>>>>>             Name (_HID, "AMDI0030")  // _HID: Hardware ID
>>>>>>             Name (_CID, "AMDI0030")  // _CID: Compatible ID
>>>>>>             Name (_UID, Zero)  // _UID: Unique ID
>>>>>>             Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
>>>>>>             {
>>>>>>                 Name (RBUF, ResourceTemplate ()
>>>>>>                 {
>>>>>>                     Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
>>>>>>                     {
>>>>>>                         0x00000007,
>>>>>>                     }
>>>>>>                     Memory32Fixed (ReadWrite,
>>>>>>                         0xFED81500,         // Address Base
>>>>>>                         0x00000400,         // Address Length
>>>>>>                         )
>>>>> Is there something preventing you to add it here like below?
>>>>>
>>>>>                      Memory32Fixed (ReadWrite, 0xFED80D00 0x00000400)
>>>> yes few system has different entries already defined like below      
>>>>   Device (GPIO)
>>>>         {
>>>>             Name (_HID, "AMDI0030")  // _HID: Hardware ID
>>>>             Name (_CID, "AMDI0030")  // _CID: Compatible ID
>>>>             Name (_UID, Zero)  // _UID: Unique ID
>>>>             Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
>>>>             {
>>>>                 Name (RBUF, ResourceTemplate ()
>>>>                 {
>>>>                     Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
>>>>                     {
>>>>                         0x00000007,
>>>>                     }
>>>>                     Memory32Fixed (ReadWrite,
>>>>                         0xFED81500,         // Address Base
>>>>                         0x00000400,         // Address Length
>>>>                         )
>>>>                 })
>>>>                 Return (RBUF) /* \_SB_.GPIO._CRS.RBUF */
>>>>             }
>>>>
>>>>
>>>>         Device (GPIO)
>>>>         {
>>>>             Name (_HID, "AMDI0030")  // _HID: Hardware ID
>>>>             Name (_CID, "AMDI0030")  // _CID: Compatible ID
>>>>             Name (_UID, Zero)  // _UID: Unique ID
>>>>             Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
>>>>             {
>>>>                 Name (RBUF, ResourceTemplate ()
>>>>                 {
>>>>                     Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
>>>>                     {
>>>>                         0x00000007,
>>>>                     }
>>>>                     Memory32Fixed (ReadWrite,
>>>>                         0xFED81500,         // Address Base
>>>>                         0x00000400,         // Address Length
>>>>                         )
>>>>                     Memory32Fixed (ReadWrite,
>>>>                         0xFED81200,         // Address Base
>>>>                         0x00000100,         // Address Length
>>>>                         )
>>>>                 })
>>>>                 Return (RBUF) /* \_SB_.GPIO._CRS.RBUF */
>>>>             }
>>>>
>>>> if we add or in future some entries added. 
>>>> is there way to map particular entry for IOMUX? 
>>> Straightforward way is to add it always to the end and add _DSD boolean
>>> property ("amd,pinctrl-iomux-present") and act accordingly. More flexible and
>>> less error prone is to name all resources with DSD property and find resource
>>> by name: "amd,pinctrl-resource-names" = "bank0", "bank1", "iomux".
>>>
>> Idea of adding _DSD property looks good, we can add easily _DSD
>> "pinctrl-iomux-present" u8 property to return index or instance
>> value directly. 
> Better to name them all, it will be more consistent and robust.

Thanks. Sounds good, will make this change.

Thanks,
Basavaraj


