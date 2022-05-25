Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DDC7533A19
	for <lists+linux-gpio@lfdr.de>; Wed, 25 May 2022 11:42:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238483AbiEYJmX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 May 2022 05:42:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239915AbiEYJmU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 May 2022 05:42:20 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31CA32AF6
        for <linux-gpio@vger.kernel.org>; Wed, 25 May 2022 02:42:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y7s3l4+67Vj4L7Cv2IQKJ9IpIoPot9qqb5iMctSPikH3Z3PhJmzNGSb9b2AiKCagLagRP8+1vo20tXrpAp+tGn0VuZUmdH/JsPD4NN0MB/oc5BLrW+RSEmKz7F74bhaZiOM8TJ4sKaj46wiy2/MYnf/hbhjBJJhQxg4R4YycxS8MbsBebu98cZpAcYoxVF2+ItvfMUh2YCMvusOcQ7IdPxuivFAKErGT8ROvE51zMCx15ZUI9+ce6KZRahE/SYhbhtdhciBl0780+I/+Y5YgLO+URnYPqTOCeu807avSze/MpFarB3pVyPtYyZ48BojymKVwSfDHQq+kSBPGhh/2VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=baiaVsaLLgjbKXAvpjEI09w9mWzj1Purkhn67J7ywHc=;
 b=Zn2faVYH941TYerXO6OQ2tmj/JqdMphXRbIolmyjzDnUDzpYpD+SSRfbv/imF6IJLqaw7pHzrEK+pi7JrFdww4acYcJkgFoWwqW2b4TtEE0zRyrxmVeVEdc+gFgA2yLLqj1vSzOZBRKNye7Yl6vSow5Px5cccnW6zpgmLjHEpMkqIG84Vmw23P405Vkb2MvW8G3wziBcrNwRbUdDmx8vQytAHeiIJ8+es7pvCQf5mYAdFYpaXhPX94Z7mWAKZ0jPJ+N2g0SEh/Um/s5otH9N1NSTUx+jRzLWytZX7kfo2wOs5HtiqeE25D33aeXpEdQw0YwB8Xlnu+gtZpB+b/xL/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=baiaVsaLLgjbKXAvpjEI09w9mWzj1Purkhn67J7ywHc=;
 b=WoZyizCR8B9qtYcz4kTY6/Dn3Nm75a2KdaCz99OPhYIuIhoV3k/TS5TjN/SkxjHtP1pbaYDGm92Pvv/qpLBtk8sHV5dZ+0qdF7gkPvJAo1e1ofYh2+zks71YA8mlA1Hib8WPHAWQkgWAX4DjF/kgfkMeO0nUI0N7JEu+bepJPvI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by MN2PR12MB4374.namprd12.prod.outlook.com (2603:10b6:208:266::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 25 May
 2022 09:42:15 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::b3:bdef:2db6:d64e]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::b3:bdef:2db6:d64e%8]) with mapi id 15.20.5293.013; Wed, 25 May 2022
 09:42:15 +0000
Message-ID: <800030c9-8a74-9186-b329-8a3edff273ff@amd.com>
Date:   Wed, 25 May 2022 15:12:05 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 2/3] pinctrl: amd: Get and update IOMUX details
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Shyam-sundar.S-k@amd.com, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
References: <20220524074007.2792445-1-Basavaraj.Natikar@amd.com>
 <20220524074007.2792445-3-Basavaraj.Natikar@amd.com>
 <CACRpkdZ267_CjNoro4A+eBASjz=qCL4ixLnbsac5U+gCsBSGwg@mail.gmail.com>
 <e35efb44-6e74-690c-91b6-c8270f624894@amd.com> <YozDbugZc8vXPHU2@lahna>
 <8ba8857d-c3ab-8959-5bc3-a4e225459f61@amd.com> <YozKd+Zehnlg1s1p@lahna>
 <c79fc5ce-469d-a547-5485-aa00210db79b@amd.com> <YozQxvHzoiISqjob@lahna>
 <d14a0bae-c43b-f365-2fc9-873ca03eb87d@amd.com>
 <Yo0KNY55M7d+eli2@smile.fi.intel.com>
From:   Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <Yo0KNY55M7d+eli2@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0005.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::10) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 086dc0c0-2094-49d7-4a53-08da3e32d9b2
X-MS-TrafficTypeDiagnostic: MN2PR12MB4374:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB43746860EAEB76937FA8A53DE6D69@MN2PR12MB4374.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FRObGCeNCAYv5RNAD1dHsQmZxgrEo7DKfR28bNCSxGQE2wKZks5SeafTFLOBB03sn9wYKWE7+keksZDvdsWuPoAOujj5eCozSkNurl8CFU2AJASq1i69P3fegSMA0y1qbkzjb2o3+SY7jsYoLSvRUb0UZELraDPe4MP4JXoAT6cgSgLtaxlmet31OeulxeQ88lK0kVggPaA+AX1525FfWNxjaEPPYS35Klge8ODieORNyXFYmzJIs7ZVv7oIKI76sptQ1BHtA+H0Pt9iaygpClXXbA+cqlOMs+PS/cRDqkNDUqJDwFNOlTCYlSfwm28rske/Ts2bGuhMgTUVG9gq8LTgOYbXA4IHDPqlf2zBLwSlZULqr2hnuRDqHrVyEJxNMeGHkJ4BXyKkvXboBsY0lqatCkawfFqNOyo+j2Nt/npDu0aYGqa2lxonioc6biquVBV4Dfswk0CUnsJc8+HUZ62wSCeeMmWPZqfx6sbaiidDRKrTjavQqgnrskce63+ltSmB94fobu3upQ9OkoZrabxW/yOD9QQx+YQ/4ELQhFjyZAhOO/hwWDBQW2QbJQQLcA3AL8TiAoBHtvJcigwIOldYCRjewZ3eQK9E5ofwJgriOK6h7QdzWhnSkaakz48bPjW3dHCVTH2yJpDkEtbNFf7JM5gSdyaqYIRZerQnz3XygTUM4qWY5GoRCtNvcexJBv+yiTOrCqB+mZelkTSLzz1+kl5CVc/Wvud2Mak6p3A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(2616005)(508600001)(6512007)(6486002)(186003)(31696002)(36756003)(31686004)(6666004)(15650500001)(2906002)(54906003)(38100700002)(6916009)(5660300002)(316002)(6506007)(53546011)(83380400001)(66476007)(4326008)(8676002)(66946007)(66556008)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OCsvZnQ1d3RHcHA4M2hwYTNqYThreEpsbjRoM0VuSFZqS1JuTWpBcjVJTWVa?=
 =?utf-8?B?UU1vaTRMWm5tSXNMdTZ6c2xMVFlnZWZORllrK3pWK0JWdDc1NnYrRnJWblhS?=
 =?utf-8?B?eXRTNjg3YlNlcU1iMDZnUXAxd3k2aGJzS2FqRW5YUDFuUWUxZTJyOGJYcGFk?=
 =?utf-8?B?SVVmTmRKMU1EOGlqdTFjWCtnQUYxenE3Mm5CZG1BeDArd01jWk9RMXgwaytM?=
 =?utf-8?B?WkFPR0YyWUZ0ZEZscHNJR28wT21oZTNpS2lyOENuWUVuQjNBbmhNcUh4Q1RL?=
 =?utf-8?B?dDdzQ0NIZUd5YzVudDk1VC9STUk5Y2NPaW9MZXhRdHBhT0RmdlBENE1TbE5Q?=
 =?utf-8?B?a01WZlVYVUZpejYxUkx5bWQybUgyUlcxMDg4TWIwdUxKYnF5SmxkZzZrb29o?=
 =?utf-8?B?d2IwWXFySzZDMTJNNDdsRkpqbWZHREl0MmFSTForRXB1cnYzTitMa0ozOFZh?=
 =?utf-8?B?ZXM5Sm5sd0dRUUJyN3k1d3d2WVpRRkhFbjNrMkFPdGJBbWNGYi9ZQ0JnTFpC?=
 =?utf-8?B?aHB6eml0Q1Q5Z2ZySUFDMGtiazd0Q2loS2NHdUVKM1JxYjNBeEVyMTZPT05h?=
 =?utf-8?B?Q3BqMVRacDhYaUk2NUpjZXUzMDMrdkF5MEhSY0hhTzRVNHJuR2Izc09EbjJM?=
 =?utf-8?B?eFdCRzduMlZlSCtxSXBRR0V5cHk3MGZ4eXJlVGt1YXdMcFdnaVNCTG5BVCs1?=
 =?utf-8?B?RmxaUUFYN2RaR25VeDBsbzFhcDl4WEs5MFRMa09MTXNwR0NuUGFDQ2YxMlFN?=
 =?utf-8?B?TngyNzFLUGwxOFlGdDBiVENYM1orelp2cWlOS1Z2NXNqWjFYN2lFd1NPaVhB?=
 =?utf-8?B?WUdTdnNUekFabmdqaENDdXFEYWlYR1RjVUZSRjFmWEVScnY4Tk9kYVFRNERa?=
 =?utf-8?B?dDE5ek5MUk9BZU9YMkx0dXEyY1lOK1QrTlN3NHVWZmVCMGR3NHlJKzJxVzIy?=
 =?utf-8?B?eFBOZXZHb1pRc2Q1VEtjajJsK3I2RHFUU2NXOHlPY3pUZ0I5ZTl6d3BrZjFY?=
 =?utf-8?B?dnlYMm1SUUwyblhFNFNjSHJDRnNGdkFycUpydjIzbW9UOWdWVnZvSmNxZjZU?=
 =?utf-8?B?aG5qbGhYZk0yL0xGa3d2VFdxZFg4WnZKNVAxMmx5UDh1enR0NE05Y0RiWDBT?=
 =?utf-8?B?S0lBYlI2NnVwR1JPeUZtbHY1aFN4OWFJVWcvelBTRlRUN0d5ajlwSk5kZlg0?=
 =?utf-8?B?SGJjdmNOTkVOcW1zaldRUWMvd1o0QXRRQ0EwUnVWdmFNVGZrSGJzVVhySnhI?=
 =?utf-8?B?UTdrRDcva2VNRklRT08zeDFpMDJ5ZlI3bDhEaXJ0OUVpZWlCcTh4VDdiaXVQ?=
 =?utf-8?B?MHNsY2d6YVR0UWRZdWpUWTMwREltZWw1SVF5enRoWUNsUU1UcTFSQVpqTi8r?=
 =?utf-8?B?cnNWUTFUd2E0OTg1NzRJVmNYeXFvUmxaNGNxdUxDQ3E0M01xTkw4S3NsbElL?=
 =?utf-8?B?bHdPWllDdXQwclRramtYN2NBUWZpNkJOY25wSlowK2VYTU9HRVhvdXVxSmF1?=
 =?utf-8?B?QTRnU0hIZEY3Rlh2Q20xN2ttd1J2bWcwV2dGaUdRemFIczFiMkk4NjQxTENY?=
 =?utf-8?B?eklDT3NQOXVOOTA3RHBPTWVKK0N1U1B5R001MmRVNXdCc3NCTGwxSWEybzR2?=
 =?utf-8?B?RElQU21wazAyVk85ZkM4RkNBNlBadWVldFlzaERyUGw5cGpMNXQzUFZZTzJr?=
 =?utf-8?B?bXBTcnZ6RFg2TmVna3VJeGVLb0JSVk5wOHlXNll2a1Q5em56bHlQZHBmQ2N3?=
 =?utf-8?B?Vk9XNUxkVWZ4ZnVaU1R4TEpidmdBUGozeTM1WDY2Y2syL0FZb05SVmVveGhS?=
 =?utf-8?B?K0ZoOG0rak1TdjBjcktyUlU3dk0vSlEzNmJJc0dNRStzelUrYmZTN2l2MXNP?=
 =?utf-8?B?aEx2em1FTG95a0VENTYwK2RMeTNBNCtRUUgycW5Kc3pKWWxTaU5XN2dnRFk3?=
 =?utf-8?B?S0lMZ3hlUWV4ZytiWHRkV0dRaDhsRlM3SExBTk9iYnlCQXdHMDIxdURkODVj?=
 =?utf-8?B?bk1MWFRCdGd6RFI3bDRuOGVLRk9mbzVsTjluK3ZRaCtnY1licFdsQ0hhMEEv?=
 =?utf-8?B?SDhEbUtqTTljZzJoL1hFZ2h3aVhtOW53UzQrN1NIdkpZVjNPMjdpeEM3VHAx?=
 =?utf-8?B?VDBERkRtb3AxS2FiL3U5cUZkUDJMQmQvdllrQnB1NENuWDBIVFQ5dE94TGpT?=
 =?utf-8?B?Ym5KcFN2NmExeCs4YWJuRU5SMnp4MktkU3plWTBadFMvWHhZUmJYTzgzMHpB?=
 =?utf-8?B?ZjhNLytyemVaVU5KZVBHZjZ1ek1LMHJmNC9yM28rdUN2a0U2bVY3VHNrMi93?=
 =?utf-8?B?NGNUVFFwemtYbTF3eVNQV0gzRy9tcDlGNnN3MzJIbTFOVGFGRW02Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 086dc0c0-2094-49d7-4a53-08da3e32d9b2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 09:42:15.1879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S8Kjo2FPyLTmu3YDtVAJeRN+Yv2ByUGx/YpCnpgIa1cxWyOuqtLVShJ57jUuLsVIot5K5Fr++/7wF2LSDcRZxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4374
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 5/24/2022 10:09 PM, Andy Shevchenko wrote:

> On Tue, May 24, 2022 at 07:20:34PM +0530, Basavaraj Natikar wrote:
>> On 5/24/2022 6:04 PM, Mika Westerberg wrote:
>>> On Tue, May 24, 2022 at 05:54:47PM +0530, Basavaraj Natikar wrote:
>>>> There is no CRS method defined for IOMX/0xFED80D00 in ACPI namespace // IOMX Address Base 
>>>> Hence I added additional code to get IOMX memory region.
>>>>
>>>> since _CRS method is used to get GPIO pin base for AMDI0030 in
>>>> pinctrl-amd as below, same is not available for IOMX
>>>>  
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
>>> Is there something preventing you to add it here like below?
>>>
>>>                      Memory32Fixed (ReadWrite, 0xFED80D00 0x00000400)
>> yes few system has different entries already defined like below      
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
>>                 })
>>                 Return (RBUF) /* \_SB_.GPIO._CRS.RBUF */
>>             }
>>
>>
>>         Device (GPIO)
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
>>                     Memory32Fixed (ReadWrite,
>>                         0xFED81200,         // Address Base
>>                         0x00000100,         // Address Length
>>                         )
>>                 })
>>                 Return (RBUF) /* \_SB_.GPIO._CRS.RBUF */
>>             }
>>
>> if we add or in future some entries added. 
>> is there way to map particular entry for IOMUX? 
> Straightforward way is to add it always to the end and add _DSD boolean
> property ("amd,pinctrl-iomux-present") and act accordingly. More flexible and
> less error prone is to name all resources with DSD property and find resource
> by name: "amd,pinctrl-resource-names" = "bank0", "bank1", "iomux".
>
Idea of adding _DSD property looks good, we can add easily _DSD
"pinctrl-iomux-present" u8 property to return index or instance
value directly. 

But systems already in use or old platforms needs BIOS update to avail 
this feature and it may also impact existing windows OS functionality.

one more flexible way is to directly use _DSD property to get memory
region as below also works, which also needs BIOS update to
avail feature.

                    Package (0x02)
                    {
                        "pinctrl-iomux",
                        Package (0x2)
                        {
                          0xFED80D00,
                          0x00000100
                        }
                    }

How about adding generic new function in drivers/acpi/utils.h to avoid
using "../acpi/acpica/accommon.h" in pinctrl-amd.c like below.

acpi_status acpi_get_sys_mem_region(acpi_handle handle, 
                           const char *nname, struct acpi_mem_space_context *res); 

can be used directly in acpi_get_iomux_region by calling like 
acpi_get_sys_mem_region(handle, "IOMX", &res)
This can be generically used to get details like below Operation regions 
which is already present in dsdt table.
OperationRegion (IOMX, SystemMemory, 0xFED80D00, 0x0100)

