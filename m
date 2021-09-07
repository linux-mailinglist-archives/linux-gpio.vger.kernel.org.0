Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF81F40249C
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Sep 2021 09:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242493AbhIGHoG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Sep 2021 03:44:06 -0400
Received: from mail-bn8nam12on2072.outbound.protection.outlook.com ([40.107.237.72]:37601
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S241896AbhIGHnp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 7 Sep 2021 03:43:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sl3/orb4NsuLb7TICWFc4QHbtKJXscKkiIq7cCvaxdiXj2apaeSB/ZosP/wt1C+VYx4MRoPoVx7oNIOnHMD3kjbqnMeYpSZsmiQRsQcJ8l73BrviNZYGrUMmW4uTfyLJL7uG1BheNdlatQL9popWMqJLbXXmqS4r6V7DdxGXQ2gWs1Fet51KGY/uh+eJRT5fqKpvp95/Y4clJQe17nBYzktiDU3ou5Wk9k3n0B6Lgv9nFVeudPNcNuegRCIzRYWs3qtbQGwMsI1ibQqWjDjz6xCMkW3cdFay3Y44sgBFZGLVdyXmFWHdbRHLN2nmtNIUAjptTldRWANfao7vi1abzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=3HRSgEvsxJ/2MrD9JoE3n/Om9TSX+BLUCxz3QFIDgiw=;
 b=GQmyp5vON6cr6I3TjXYHcNS0okZZT9DbM86HvZVEzgbk6df0ZNy4TNsx1Ys3kAO8TeoQUN9bWWg6yuc65odm2+v/ZM33IuOFqzIpArztR1AdxdM10r+fkkt6mSyWd5SAgMXMRJPkRaL9Nkao30fZCojTwKSbaGHoQjtcwFzn4gwPna/9dZb0oHjf1+GIue8tQ3Yt8SXPBWMAd3sX+MNKq3AZ/kgGdQCGR+tnkTlrQwV0MQBum+F4NOCzuYKFEWiYFgGA5/1Vq+h16/UUL3YJ65jSR2yq7em28QDwUKDvtHfG+hzVr7/8tSYAnP9Z2jIRzW248B/eeBIjKpM5oOIBHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3HRSgEvsxJ/2MrD9JoE3n/Om9TSX+BLUCxz3QFIDgiw=;
 b=sLeP7jH9zzPUbvLSBvIURBbmR+lzCaICDmCeXWCquyR4sz65CbVg39AKRhP8EoUhHvLbBMXCAtE2hs1NHNH5bQm7jbMGK1Bf5KwjDgQja4yQt1AkxkapYGdiN34TEnn7XMbTz9PUykDSDv0GksZdvp0NejMYVZeQggrao8uy168=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by BL1PR12MB5317.namprd12.prod.outlook.com (2603:10b6:208:31f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.25; Tue, 7 Sep
 2021 07:42:34 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::888b:8deb:3f8b:8d61]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::888b:8deb:3f8b:8d61%5]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 07:42:34 +0000
Subject: Re: [PATCH 0/2] Add irq PM wakeup
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        linus.walleij@linaro.org, linux-gpio@vger.kernel.org
References: <20210831120613.1514899-1-Basavaraj.Natikar@amd.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Message-ID: <65cb2134-c209-6381-fccd-43f252af6f9f@amd.com>
Date:   Tue, 7 Sep 2021 13:12:24 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210831120613.1514899-1-Basavaraj.Natikar@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN1PR01CA0078.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:1::18) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
Received: from [172.31.152.48] (165.204.158.249) by PN1PR01CA0078.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:1::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 07:42:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf558a33-de8c-4cb1-1709-08d971d30e78
X-MS-TrafficTypeDiagnostic: BL1PR12MB5317:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5317A9782E7342DCE38096199AD39@BL1PR12MB5317.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RWf/Y8SEDRpynp19sPCJgqikuqF1/BZCfaqR+8DoxDzYvrE60CbSbUd1MOWyUro7GUfmpJsrDOQZjM0Ci/HRv+HPfM9WOaEr8bcEXC4XYXWatDKOe+Eno0+YvRcxxseiKmD2Zrf+VPXBaGwHOc1ka/xXnb08Np8J9+xQQdewnSH6t99KLohJl24TBfmGELsUxB0d4HkvzTu/75btVmcCKk1TDgyHlvHLopOhi3/mmm3MrWolJe4n3rBw0+1OR+urW7UxNKXmKKwAhSVJq7Mg9TdAzxCGyal3xpT1BKC8d0uc15FMhCZZtxTAGVIV/2hHgcZRCVaxOtKo3afcP5xx7CJGKU2iP9R3nAIcY5Aop1JvFn5cU2joiXx17LY5j5KfAG1NuWrXzui5PqZ1wPB1GSQhW4gj7XvzOM4WpNnXsJNGciIibZt/QP+r8vkcOPPX4bFjrrYniePk1ozpRrAIhQ55TgJRagqjq3DHmxjJlLca8McsX/iR55IM0HPUS2h2WpkGulqBbmh96++MXL1TPHtJWhMkp/iPUw7oGJaVsPtJJiQeWONYIRqxQiP90DqXNLg1Ez0JGykOoBM/m6nQ7Zp7isHcERcFMoG3K7/+i/Fa/n8ls3QXxmhsvx5wMqk1I/vfviRNciyFh3rkmYDgVHWsXanAwWsLDK6Cx+3Hrx9IVZkMEr7X1SAIbHa95yp5jdCq2W48eLnyUqm+0tGZXOEbOxr1PCOZovVEWoFzaOw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(5660300002)(53546011)(4744005)(8676002)(86362001)(83380400001)(31696002)(478600001)(26005)(2906002)(8936002)(186003)(36756003)(956004)(2616005)(6486002)(66946007)(66556008)(66476007)(6666004)(31686004)(38100700002)(16576012)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3YzOHRKbjlGUlBWdEtoWDk4TTR1Q21nNWFPTHNDUHFIaVVNV1FZRVZuODN1?=
 =?utf-8?B?elhOYU4zaGJHZFhWdmtJMWd0SWM2ajBnUWlSMFd4Um5JYXlEZmVnNjJrdUxU?=
 =?utf-8?B?NCtnY0F0UnJCTno2T0JSRVB2ZXRlVkFYYUlEZk9sVDE1WmZpcCtWTWNhb3c0?=
 =?utf-8?B?WWZWd3N5ZlYrdENHR3dEWEVOZEV1U3R5UEw2VmdPV2x3V2V2czYwTHFLNGdS?=
 =?utf-8?B?aFl6UzFXZ1h2Z3FPMldDM001LzZIWkFLd1VIQ3UyVVNqOHhSbjdjc0FMQ0Q1?=
 =?utf-8?B?RW01bi9qaXYzaGVjK1hrdDVnU2tTL2cwSDhCa3FWem5HeUg4NmpCZkl5eXBl?=
 =?utf-8?B?eVRiZHdqQW5mZ0dRaUpzL1pJZVN2K2VvVkdQMHVBeGtJNnR4WkYrQkdEOTZF?=
 =?utf-8?B?MUwxcTRzdzEyTUJhc3ErL2RkVWJIV3U3U2dZenpCaStqVlFrMDBQamFpT3dt?=
 =?utf-8?B?Q051dVNsNHZxeUdiWHVUb3FjakdtSENGanZ6amVzb2NPN2lacjBjaStESE5K?=
 =?utf-8?B?S3NkTHJ3RExrU09VcVVXMEZUVW0xR0xrTmhxbXpVVUVJWXBQdUlKSDlLYlIx?=
 =?utf-8?B?Y0tDSVExN2FzRDVEZ1RxWTJhdzVLY3ptUHlBKzR5U2EvR3hsNVZNZTUxZ2Ix?=
 =?utf-8?B?eW1rMDZLaE11eTlJVStlN2xFNUthZlhQekdneVc3U3d0VHhVM2NkNlI2NUlj?=
 =?utf-8?B?WDZwL3hkaDBOL3Y1SlVGRC9iZUxSTDBmUytPNXZDdVpTd2xDUEhIdFl5ZEhq?=
 =?utf-8?B?SFNWWlRJMFlBdUVUV0lacGhVWVpTdEVMSEg3R3FJSG1qbXNkZ2RzZGsvTWZF?=
 =?utf-8?B?bFlGbWJpeC9Ca0VmOVFmaStUaThDSi83TlNoR1JiN1pYMC9GNXNpMWxmdnZp?=
 =?utf-8?B?NklkR014V1ViSGlCOGkvTXhSdmczMU5VaWJNa1JZdnNQUkFKZzBrRG5oS202?=
 =?utf-8?B?N3lUU2VaVUdveUZVcitvY0VMcVNzWk4vSmN4K3VyZU4xbUJXVHBQYmluNW1P?=
 =?utf-8?B?RmdlUUUvbDNKNHMzRWtuTThnRllWcUpnTis2Qmk0MlluODFhRGFjc0JNMSt1?=
 =?utf-8?B?UHpNMGR6MTI3ZElFU3g3cll4Wk80OEdiNUxEbzFoT2JDVjJzYVRtYmFZVDV5?=
 =?utf-8?B?N2NVZ1gyVncraVNEMU9nTUFVRlk1M0VCejA4N003L2x2MVV5ZFdLWS85NjhD?=
 =?utf-8?B?VFlTb3E3d0xDMEhvY3R3UC9FY2NSeUdLcldNdHFPVU5rb2N3NDZOblhybFpr?=
 =?utf-8?B?SFhrNWs2eHlpRFErZXdNKzZJNW83YU1tbGtxQkRPWmphOUc1RjcvUmI3NVEw?=
 =?utf-8?B?UXFlNlJ2NG9OWkR2ZUVKM0dwRnNUNDJuRlZKNDVDVTFVcHA1dWFjUTE5VThm?=
 =?utf-8?B?S2lkL2RGNElFWlVGeVRwazk5NWZsaWJZUVhrQkdMdmI5cXFaOGxWVEQ3V3pG?=
 =?utf-8?B?YzlkamF1Tk9nN1FIaytBS0c3OUdSVS9YVThuVHlTK29RUUg0RmZIRVJoMi9h?=
 =?utf-8?B?NmxRWjZqMDB2QzRTejV2dHlPVkd4RytmaFp0aitFU3ZLcGNMZ3ZFWTlaY3NG?=
 =?utf-8?B?K0pGZ0htRUNkMjdKSDZWYnlnQVJrcXBrMUd1NGRNWWZNUk5INk0xK2hhc0FV?=
 =?utf-8?B?STVTVkFkNFZETUdieWFlSGsyYlRpWW44a1JWQW9mTGUyeTRxVG0xK09GZmhI?=
 =?utf-8?B?Qkx3eTlDT3hlQm4rUHk5OXAyYTY2RnFQc0YyeHREOE5ENzUybGZsbkcvSDFB?=
 =?utf-8?Q?kXXt9XGo/iXT/1kaXxoz6AmuorLAWMkRgc+yF4B?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf558a33-de8c-4cb1-1709-08d971d30e78
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 07:42:34.5998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e6TmWKswYg/68pB+i4yTimevjS2wG8iqLZfXMAAD22mQF0pVOlc4OxEfMe8peOYEx8kvwk8OojKSduAIqlrkFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5317
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 8/31/2021 5:36 PM, Basavaraj Natikar wrote:
> Changes include to handle IRQ wakeup mode wake the system from sleep
> states like "suspend to RAM".
> 
> Basavaraj Natikar (2):
>   pinctrl: amd: Add irq field data
>   pinctrl: amd: Handle wake-up interrupt
> 
>  drivers/pinctrl/pinctrl-amd.c | 19 ++++++++++++++-----
>  drivers/pinctrl/pinctrl-amd.h |  1 +
>  2 files changed, 15 insertions(+), 5 deletions(-)
> 

Series Looks good to me.

Acked-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
