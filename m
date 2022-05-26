Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F4139534A5D
	for <lists+linux-gpio@lfdr.de>; Thu, 26 May 2022 08:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237562AbiEZG1Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 May 2022 02:27:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231466AbiEZG1X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 May 2022 02:27:23 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63F25BA9B1
        for <linux-gpio@vger.kernel.org>; Wed, 25 May 2022 23:27:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MWrmeJOBk/c9ms+D9D71EN9uAtAtk1TXuYdGK8wyqijCxO2PF87lgR5qe9kEGsN6NxL/hXMRPidNa2Bk5PTICavGzZtZWB+jNUjLan8Q8MLzQ6T+/FKBuXpMCPkqXJYS1nvml/tu0rOQH/DW9DLASCT0k8EjSrKkybS+7MnR4aJdLYE3xb4yeskNq640/W6EpKGrYQZiyq5XImePNcX1NXUgby2G/3kcJoT+9st/q0rbIeJ84XZG2AVyNFHJFXH2HgB0GAKaFjJ3G1bXWhM+wHyrLAmccSmMoqKSGzSHws0NNojTxZhWpWtMseRTJEUm3fAaDCadBn5qBkYG7iQUHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKpgguqjBQ8rxaJqzpkXt6GmXw+pEosMEx82fqFYbL8=;
 b=iigcOb3HbPKf4yuMkJCJ6Mb9do5uXv3hdr/7ltYelrD669Mbu0Ha7bFySkJyW+wO+YgfSUpnWmv4Hvq5DSY5IesRYr1m5skRpY5lsIa+YdkdOFFufvZmlHyE7uvt4jArtLGIDGNMzG+MspUUkfNYiWvb1fjXPqbL2lVzmu8IKeFOk44pZaIZrqZODM6fyMWiFGSz0SIGarScaKb74AC/XaazYtwR34WHa+zsutsdHUDmeCUmyNnwgGL0fTpBPGVg/d+60oYqlPONo/5JI3PygyUJgXfvMIKmSe22dTJ3R+9zLdySaYA7Nb4Z3FYQYZYGIgl0IooSIOFhVZTxLTy3Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKpgguqjBQ8rxaJqzpkXt6GmXw+pEosMEx82fqFYbL8=;
 b=LlWiI8r9W2u3E0ERrQxVnWvVvrvaOw9OfJy1zGdo6uNdLZHPJVD9n4ue9imbqzu3GKaIZQrH1xErkqltqmKZ34pcGKqiT7Xwnvt4XcC0Fhmx5/8fzQGBbQPym7MR3Cr42khkp2wN7jE2rLMmQOdkeihMs27Qh8KREv3XPNc1Mvg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by PH7PR12MB5926.namprd12.prod.outlook.com (2603:10b6:510:1d9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Thu, 26 May
 2022 06:27:19 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::b3:bdef:2db6:d64e]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::b3:bdef:2db6:d64e%8]) with mapi id 15.20.5293.013; Thu, 26 May 2022
 06:27:19 +0000
Message-ID: <2f1df198-36e8-36f4-4474-618013db73ca@amd.com>
Date:   Thu, 26 May 2022 11:57:09 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 1/3] pinctrl: amd: Define and use PINCTRL_GRP
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <20220524074007.2792445-1-Basavaraj.Natikar@amd.com>
 <20220524074007.2792445-2-Basavaraj.Natikar@amd.com>
 <CAHp75VfQgzMF7gZ+_NHpE5jb3EF8mOEjCr6DrghN2xyrTwKK7w@mail.gmail.com>
 <CACRpkdYQ1++WQEFa7tUAX3_B=-fb43UEU6AXyYgHZJhH73DQWw@mail.gmail.com>
From:   Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <CACRpkdYQ1++WQEFa7tUAX3_B=-fb43UEU6AXyYgHZJhH73DQWw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::20) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36d2f25a-30a5-40a7-434e-08da3ee0c8e7
X-MS-TrafficTypeDiagnostic: PH7PR12MB5926:EE_
X-Microsoft-Antispam-PRVS: <PH7PR12MB59264A10D3739AF45209993AE6D99@PH7PR12MB5926.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QI8TWvomCR2aOQfIsBJDIVhuoJhzzel1na9aMpWT5oeMFsZSrpf4Yrwz6PlZ15DbE1wUMz8lRS/x4q/ULPEy+GeUdQ99jwPd1sz4BPq0BhBZWQRndL7GtWuRmS7kbHZVdaRK8me/dkrrDCtEp7HaASj08I9glDagpFbaNt5a8hVjsU+Ca3u9EF5HPbgshQc2fKSwFpq0JhZSQVW1yEdVG3KCpy8f4VD2BwUSJdKLqIiptrQ1//KuF9fl6GcXaxEaHXc4lDrnWjDCdW9WUs6UHj4FkIEdjxJBqZbvQdn8fsuq5TEK70LWDjyMoYYNgVlN1m4GCH3M6oGm88q+M2r1l8XOw5l9rjnphPxdVDSRhBoOjZiyOvI56n3djSjXJeDUD6S60AuacoqheCLl9lIFr3C8q4aEokkneWYz2ZroF8QgtaDOqgfncRaZFc5hPJd6eNYRjnvaCdvHnNvWhCoW0nTKN4Dzsy2RbI+9rqIXVyi/Nox1sNiIK+n2Mvx3VSMT7rxrCTqoU/y1IKWVF/5qUzEnadu1XLNsXn3PctFmYH+H5htiq8FvPq3gKvd606H30+Js87ofOFdLbPOKK61wQRAchEmJjnKWM2RkL9FqKoi3EgvG7y+qj5MeAg76VCi+uU2Y+zTi2SX/CIcaaYclwRgOfL1HlS11dA5uCY0v68rz4cwyLY1tkDC+Z7uNOe8cZ7B8amv/uZRMVkcZEvAxl8IhxFfw1KUN2RiaG9A38+N2CgiVx5T1n7j8oqcbdB8r
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(8676002)(66556008)(66946007)(26005)(31686004)(110136005)(54906003)(2906002)(66476007)(316002)(4744005)(4326008)(186003)(8936002)(6486002)(6506007)(38100700002)(6666004)(508600001)(6512007)(53546011)(5660300002)(31696002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGxKczY5aHJPS3AraGptaDF6NFFWRWtSKzBuSjBzd0o3ay9Hb1NHWitwODRj?=
 =?utf-8?B?SFVncjA0L2VSZ0ZrcGR1Mk1BdnFTa25vTVNFem5WbDI0UkpvdGlTVWFyS3RN?=
 =?utf-8?B?OFU4K1J1ZlhIL2dIczd2Mit4dWUyeHBLTE1OMUJwZEh0M1NaVG42eVYybDFT?=
 =?utf-8?B?Sll3am1zekpzU2xRNno2TXF2K09yRXh6L1hrTmxRTk9SdDI3WklOMGxuQlIy?=
 =?utf-8?B?cytRZUdvcjBtT2UyUWxQK0hUVTRWRkJlMEN4SXh2dXJRdlZNZVplYUxUMDRD?=
 =?utf-8?B?bnUxcDMydnZLMnVpQ1BNdjQ0bjdVTDY3S2NMUEp6eitRNjg3OW5HSTRyUGJM?=
 =?utf-8?B?cXBGcEZZZUFDNC9XdjJvRzV4MkZpbDU3K01STVlsbFBMenZsNnNTMWtzRnRS?=
 =?utf-8?B?azl3M0FWT2VXZ0RseHY3SXRESUszTlhvOE9Jd0pBRUdkeEQ2SnZacy80UTd1?=
 =?utf-8?B?UkZjVkQ0cGdoUW80elY3b0JMbnQ3bzZJczBRMmRKZVkxUEROSzJEckR6Tk9L?=
 =?utf-8?B?S1JwR1B5M0NENGk5MlhGR3p4RVc4VzRjemNRUTBTbHh0ekVtVFJ6dEZUTjUy?=
 =?utf-8?B?SElSQXBnMm1MWVRvWXlIWUpsWmFGS3F1NElmOUVTR3pJak1aNGFjL0xGcTNN?=
 =?utf-8?B?U0dEWU1KNHl3bEU0NzV2SXBYQmlraHFiYU04ZzV2VnlSbEFGZ0laWEYrQ2dw?=
 =?utf-8?B?ZVpSMzIrQWhVRWptYTZPZUFibys3ZEM2SWtJSFVQUDYwS2hpSFQ0NmNSdFdT?=
 =?utf-8?B?cjNzaUlNZSt3QVhteDMxd1h6N1plaGMwaWJuQTg1WlcvZHZ3d0lmai9OOHRh?=
 =?utf-8?B?ZzQ1T1NZc0xIc2Nydmt0MnAxQ0Q0KzNRdUs2RGp0NEx5VHN3K1lBVHd6SzM0?=
 =?utf-8?B?cDZLOENreGxRVVhkVFNGVFBqQ3Z1c2ovVzVaWnA4VVNSaFF0aXFRWFp6dk4z?=
 =?utf-8?B?ZzNHTlZxa0lKb0xWQUcrTUpoV0trOG1OUml0OUtGMnAyNzBXU2Vyb2hBT2Z5?=
 =?utf-8?B?RHNxYkJYeThDNlZlWU9XdUNkdTIrTmhONjhYYUI2SVZIUlZjb3JvclB1ZFAy?=
 =?utf-8?B?cnhad0NnR2tQUU05RXF2MVFrUTFOdGNTRExoRmt3Y1NTRitteHBrRXZxKzk1?=
 =?utf-8?B?OG1GUm5IWktDbW0yaUlYTkVISzhQelo2MmczRG8zRE50ZHVmbGdhU3lVV1l4?=
 =?utf-8?B?dlZFdC8wQnZ6S2c1cXlQMFJxRSs3TE42MW42aE5pbFZVSEpqQkpYZ1JuRjJ1?=
 =?utf-8?B?N0tEbWV2RHFoc1hiTHpLbVdCa0IzY3N1eWlmaUtPMWc4Z0trMHVrdk9iSU9R?=
 =?utf-8?B?anRFWk1wOVlMTk1iUlNFWGVUK0dlbkZkRlZ3a3pRZUxDU0NpbDBJV05TQjMw?=
 =?utf-8?B?YkdOUEMwaHhYbHAvUVREY1FsYzVsNnlseFc2VHF6eThqQVdneUM1TTZZMFRT?=
 =?utf-8?B?ZkJyUEZxT0Rrc2xBbE4zNHNmVHZRL0h5T0tGRW81NndVVmM3Wi9aaUEzdkQw?=
 =?utf-8?B?RFRwck10NENKZlFmM0JYY2Z2amZ4VjJ4OFFtV2VvSStiaHlVMi80K05ZemlG?=
 =?utf-8?B?TXhjVUNaeWx4c2Z0S2lwMFJYeHdaZHdLUkc1ZWtUdElyUWpVNVdrVlc0ZXdY?=
 =?utf-8?B?T3p1ZkVtay9WQkhINHNFbU9sU2JRaWZwU3dFZWZ6eFpkZ1EyaDJ6eVJMNC9T?=
 =?utf-8?B?aE1sK2FSdFlvbE9GWVRiRkF0WmtUQ0M5T2RjT2IvRmhEYVNTWDVnd0ZoNk9C?=
 =?utf-8?B?cXZrUXUrYTlJeVhjdUxnV1JvSnVidm9xOVJhRW9GSFlENlQzT2lnT1RVZmg1?=
 =?utf-8?B?OEtlUnpQS1ZObktYN2tqL3RWNVYrU3YvNGJkNWdXbXRLTVdkT3lOOW93MkVP?=
 =?utf-8?B?NEVaYytSNTlyQVlSaHFRNUl4dzg0ei85Q01RQ2plZ1EyREV6V0hic2pnRjV1?=
 =?utf-8?B?eWIydzFWWUJaL2VLWjNxUGpDTnFjdThlSkhmTXJGYmtNVmFoa1lqa0M4aVMx?=
 =?utf-8?B?blFPUm95RU9nOGlNa3p2ckRCa29xMVFlaTBXVCtOdTMxdHB3M3R5OTduN2JQ?=
 =?utf-8?B?N0ZzNVR3alVtT2x0U1NtbkEybDdNdXo1emVGaVV0aG9aS3RuSURualVBdVFW?=
 =?utf-8?B?RXFuSEwxWmErd0hCYnNnMDdlVjlRZUhsL2drbkhGb05CeFkrUEc3M1J0K3RV?=
 =?utf-8?B?NXNqazNqUnRxV2lTaWNwSHFyQ1lRc25RczA3OGZKTGlzWDA4bTVGYWlJSGV1?=
 =?utf-8?B?UUNYK0Rkblp2dHJscHROYXlHck56K3NrQ2kyaVR5cUlPM1h0dUNDeDhsL0R1?=
 =?utf-8?B?dEpoeC9rRktwM211MjY1anM4VkJZZ0NGZDlFUnY3cEgxT2pweG45UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36d2f25a-30a5-40a7-434e-08da3ee0c8e7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2022 06:27:19.3822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zAM4s05fAaO2jhiAw7Njyej12SqTkzKhvgu8PAkc125W6wZhmdkB3BqTeTaRLeKlgS09dmQt+X7hzw8/Co8toQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5926
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 5/25/2022 11:35 AM, Linus Walleij wrote:

> On Tue, May 24, 2022 at 4:39 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>> On Tue, May 24, 2022 at 10:13 AM Basavaraj Natikar
>> <Basavaraj.Natikar@amd.com> wrote:
>>> AMD pingroup can be extended to support multi-function pins.
>>> Hence define and use PINCTRL_GRP to manage and represent
>>> larger number of pingroups inline.
>> This is good idea, but please make it available for all pin control
>> drivers, since the data structure like
>>
>>   pingroup {
>>     *name;
>>     *pins;
>>     npins;
>>   }
>>
>> is used in many drivers.
>>
>> That said, I think the AMD_ prefix will be misleading in this case.
> Aha you mean like a utility macro? That's useful, don't know where to put it
> though, include/linux/pinctrl/pinmux.h?

For me looks like we need to put this in include/linux/pinctrl/pinctrl.h for 
a generic usage. is this fine?

> Yours,
> Linus Walleij

