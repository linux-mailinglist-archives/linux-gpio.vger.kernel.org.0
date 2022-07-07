Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03D6E56AA85
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jul 2022 20:27:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236022AbiGGSZ1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Jul 2022 14:25:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236308AbiGGSZZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Jul 2022 14:25:25 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94FE02F674
        for <linux-gpio@vger.kernel.org>; Thu,  7 Jul 2022 11:25:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRblCTiidjM4p/XIjhXBvACZOQT/N0jH9tz6jf+ba9sP3fQcISL4oW62zEIa9UlGO0Sny4SEKTHAYxl6YCmdVklxheVwzbgoSxyLxcehniZCaIODDTjMe+sfa1S+MO6YRJ4Q27gDI1JORBtsyAkEeBin/PNOcrIsmmGD/Slep1LCHJsQjH8Hz+0NyKkfqdacw7gT7mCjEl0D3mdBVO08PfEWXYk3RAr+WC8RVbQx17Ot+aPkbNGOS8Uzc53EbELizE7Pn21ZTzzrv7YeHnTuzrIgbLf48qUTOVNF8EiCbgXmv4ooJMuAowhp5JW5vhBkXSrnwHk0kKw9kZKJ4vYcoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zmAKg967EC1uDeRCf71sTNoRd2GxQw1ShukBxTO7dPs=;
 b=ZVj5MeGqKq/nS6y71UtrB/vkujIdEE2fkTvP3fdxpJk5DRPrlkbwf7khcYfQaTfCpmXH0QHoM0JxSTvCXlCS0qKfVqTI8rDrlHzWytK1AuqRVOdnW09UWR3GJSIofsXTJmWGNAUbRFYLZ2h5Ay585yGumXcW0nFBX07jxcElpRwkEK2NyL4AurJm3NHMeU8O4/gAe8Ym5E74KQ0i10OWIG09s6NBkPePrI5TTUVMMRuPdW4y3//3Di4ikEWkIjLAOPcz6Skq5fo7eTl3PpDUePkQzcYoQ3xsO614qpAHWaJjwFeDs40S5WTvtgk0B+dqEQ94HlQr9K0OUZpaaSDcqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zmAKg967EC1uDeRCf71sTNoRd2GxQw1ShukBxTO7dPs=;
 b=1UeqRI7WBv5sHDlyECmFp+0c/kLz87jLLbabAOH8wFR+apO1EGDS1j+jNti7JWboc6P1Cz8nE0o6+0pTrBtjBHgLQVVciCpq5jo4eyOMz627sCa3cUNXqBP9C6+jKfXbUb9JDwiSyFCl9xAB20HBS6BRkILhX10JnAixnVTswqM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by BY5PR12MB4257.namprd12.prod.outlook.com (2603:10b6:a03:20f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Thu, 7 Jul
 2022 18:25:19 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::1143:10a5:987a:7598]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::1143:10a5:987a:7598%5]) with mapi id 15.20.5395.021; Thu, 7 Jul 2022
 18:25:19 +0000
Message-ID: <81a6c035-ff4a-aa3f-416f-fc9b337c8cf6@amd.com>
Date:   Thu, 7 Jul 2022 13:25:17 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/3] Fixes and updates to pinctrl-amd
Content-Language: en-US
To:     linus.walleij@linaro.org
References: <20220613064127.220416-1-Basavaraj.Natikar@amd.com>
Cc:     "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Shyam-sundar S-k <Shyam-sundar.S-k@amd.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <20220613064127.220416-1-Basavaraj.Natikar@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR19CA0042.namprd19.prod.outlook.com
 (2603:10b6:208:19b::19) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27587774-cf58-4952-ba67-08da60460c49
X-MS-TrafficTypeDiagnostic: BY5PR12MB4257:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: da+5b3SDaYuNOSqKV4m+ptuN17tiJaYsNiuP9f7Sr19gQy4dlTWQ6bWGXfbz/wRMlzfUGCesukY/0qQHsj20HgkVPVOXyLfl4MgNMf52G+r9St8+xFxwO0jWvxHSesAqEj+GLLTzO/S8gqa5LFwKNMJ1d6MJmPD7pUL0wYBYgRx43h/G6zo/RNPiwmYlyJSW+Wfp07blNfDHs2ohBBJxeKA+fShqkS9KRiIOdXmea3YhE8NeMTA+JP/eMsDiH40jLCz4Um+pDmNBDPUZEsJyiAmW3hDT9m/sMRMHYxKC15vjIx5L1ODfaVrpwyeW2uBA+6r45r8MHM6+rsIgCkAHhHjAAzlfu5zzs5wVn1/mmsMJFO0ubys6w83JfI7VDHWbiV/Ta/8HEvNg+BipY1C0Mq6VOdjfvUkRDy/xo+Bmw0+Y63A5XlYCpXHmKE5MFGTuqtI5S4QzCqYin+alY8R0bhf8zfcYSFk7L4RwnN1mQf3iXHRvV2qCT+eAkJyOqo3sLAXF91LJewJw9QDhd6PgzM/L4kyIlB7CLH/NNn/uVAQjTOs2upJTAKMSMAdw/Z/8D0aID/jve6ALS9FJKxflbKk+sr/HXJXGwlksoJ7+UzZKIzGDN2mw3y7DeC1HCrXJecRt4YuRCJ/G6MDlIi2OIv6x2TBP0anZpGTpzCLO7szeC6iGd4W/Csh2tpUJP9COhN4xhP4AJBayfiGjf322wLZHeQNoV0pAQ/rwdHZlV92gRGn9iIOROx49U0dA9SaKYenTIj+LaME3HrDiGcLTicwQt15KWiD1hEKrqnhaLPsxdc6FZZCnkCKbFJso6HfxgiAXGGC8HY6DOspRDfsnJyhnAujar82Cl5Tnid7sNQs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(396003)(346002)(39860400002)(136003)(2906002)(478600001)(41300700001)(8676002)(4326008)(66476007)(54906003)(316002)(31696002)(86362001)(6486002)(36756003)(31686004)(53546011)(6512007)(26005)(66946007)(66556008)(6506007)(83380400001)(38100700002)(2616005)(8936002)(6916009)(4744005)(5660300002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UW1IajlPTWdxR0p5d1NUaDJIU0pjOFFSd2JvTWdkcENBZjhwWXlFcmJqUHUz?=
 =?utf-8?B?b0FtMVpVa3RZSUNOZUFhd29mdnVXSzIxazA0VkgxazdXZW5Yd3d3YVZFeXhl?=
 =?utf-8?B?SUlvWDMvekpSYVVORmVFbVBBTHZvR0ZXQk5tOXRCVkNoU0hjeGhzemJ1cS93?=
 =?utf-8?B?WFZZNXFBRHgyOWZKWHJ2L01mdVl0Y0FsRzlrSE9LVzZIZVc3UndGbm5xb25z?=
 =?utf-8?B?bXg2S2VQaWZ4MlZMalRkRDIxZmgrQjUwS1QveHltbWExL1ErZ1YvbnMva0xD?=
 =?utf-8?B?U2ZEWUJSdWJrdVY5MGt4VW9yeGNUYUZnNDJaS2RycS9OckFQRktpVGpaUHNm?=
 =?utf-8?B?cEtmRmpUWFlqeEJWY3c3Mk9zbFVZbjI4cWpsSDZ6b2Mybk14bTRKQ0xaT1Aw?=
 =?utf-8?B?QmYzeVdHSEVYZXpMN1BqSEk0OHEzSHZqK05zM1dPbXIwS1NsQXh2aHBZc1Ry?=
 =?utf-8?B?TGdEYldqRW9VU1ZrazQzS3N4b3pQcTVXTktIQmg0SEltUEMvdFNZNlZHMHIz?=
 =?utf-8?B?TUpJMkEyRjZMUGQ5TmRrWURuazZ3aGJLcWM0eERzWURTRmduOUoyVVlvMVh4?=
 =?utf-8?B?bWJFRjJTZFJhcW42WGgwUXNCNzNFZ2h0YUR0QW1HQUFFZmdGeGtyQW1OOW5h?=
 =?utf-8?B?dGhBamRaS2lVRmx1Q0xGb3hQSlpteSs5aTlma2drQmpuSW5USGdOdXdVUlFH?=
 =?utf-8?B?RGdEcFFORkVCUGw3MUY3a2JyWURSd0hqZ3FSVUR6V2VjOExmanBsTlowMTgv?=
 =?utf-8?B?Qm1PdDEzRFpRQWY3eE9laHBOSmNJSFRpdXAyandBTVd5VWRoN3N1eHlRWVBL?=
 =?utf-8?B?TEhLalRCeHhaVXZjNUZPLzBaWTV3NGtwYUR6OFhFbjN5WVFPdThsRk14N3lP?=
 =?utf-8?B?dW9FLzhyblFKSVF0V2Q3NTdsOEMzS0JwWGZFcWZhS21yQlFKTUhvY3Z6SVQ2?=
 =?utf-8?B?YVk0RGRCRTBTNmtvTzVIUGhPN3BmVUY5d2JNYkFHaUdLWG9yV2hLbmUxMTRy?=
 =?utf-8?B?cEdpeFA4d3ZtbWVRQW9yWTEwckZOdXg1N0lISE51N2c3bTBwY3p3ejFUNVli?=
 =?utf-8?B?S3I0TzFMSlhSQktUTDF1QVlEU0RscHh4UGtXZGppc2xHS1BCdTY1bVduUjY1?=
 =?utf-8?B?d0ltTEozdXg3OVhLVFZlWmw4a0NpYUx2QXZqVno3R01jTzBiVTM3V2tNOUhC?=
 =?utf-8?B?OHVvWG04N3MrUzR0RmVOanAwWHlxUGNwVW83TUxucUtvek5TS1lQT3NxZlJ1?=
 =?utf-8?B?UzZueUVNRzlGelM2U1FFNE1ZVXRFY0hJWFRwRUMzMFNzM3AwMFJMU0Z4OHlK?=
 =?utf-8?B?R3ZpNzN1YkhlajJzMWlhTDRkdEFOa2FrMHNmSlVZR1U5RHdSYy8rRjJaQXRU?=
 =?utf-8?B?SDd0L3N3MGsvajUvWDM1dG1QOWFwSzdSZjdQZGdrK1h6NDNycmgxNWJpbGlE?=
 =?utf-8?B?VnJjS3UyYlNIWFlPZ2ZIRXlzZ1lJeDRTc2J3ZlBYeHVGdy9xbEcwL1JLSjN4?=
 =?utf-8?B?dXNaaDlpMVRvRXV6SHVlRy8xTi9ia0JST1FBTS9JaEYzQnlTOEEvZzVaMzZl?=
 =?utf-8?B?MmhFU2dkL3JEWjExQUNYRU5OY3Nhd3I0U0dTWUkyN1Q2ZTMyN3kzTWdkSkJ5?=
 =?utf-8?B?UXJrRGxXaW0xY2hSdFN3d241bWFPeFdjSmxsYUdEZzh1QlB4aHExQlBvZGhl?=
 =?utf-8?B?d2RxZGVUdTFYczMrQXhlaERKUVhMUG9Cdk9jenN3TGNJT1VseEZvaW5vQktE?=
 =?utf-8?B?YjVLQXNDaDkvaWJ2cVljSjdiWm1hQk0yMHZZSjVob2swUjFDVWNpemk1b0ox?=
 =?utf-8?B?Z1dqVlR4SmtKS1NIdDJScFMya2w5cnhNZzl4YXhPRll0alNUeTdUM0I1bnMx?=
 =?utf-8?B?K3lIaU9YVkNGK0VldjRZYjZmQXVIWGg2ekluSEhkT0NLQ2FHcHE2dStCcEtw?=
 =?utf-8?B?YkVQdWF1Q3lIVjZPaWFCVEtCU1l0aHprQXRSekFxMi83Z2hUbTN0MVhUbXpI?=
 =?utf-8?B?cExyeitxUklma0R4cW1TaFIwOFd0ejNwczcvRGl5ODlYNlhwSnhrTVZtRUl5?=
 =?utf-8?B?cEhBaC9KRFkycTllQXBKZmpibWJmdW4rRzVSN0YxcVg0dkxRVElrSHg2OURn?=
 =?utf-8?Q?DHSjmgTkhLfrg09+Nl4LyO2U0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27587774-cf58-4952-ba67-08da60460c49
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 18:25:19.7575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vq+NEHfi713rfU3YhO8SnezjPuWE4qO8Ogd/rOfuZ6ApJEeFgXshqE+N9EU38A33ldk0vD1lEV1MulBHLQs77g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4257
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 6/13/2022 01:41, Basavaraj Natikar wrote:
> Changes include use of devm_platform_get_and_ioremap_resource,
> save/restore pending irq bits and removing of
> contact information.
> 
> Basavaraj Natikar (3):
>    pinctrl: amd: Use devm_platform_get_and_ioremap_resource
>    pinctrl: amd: Don't save/restore interrupt status and wake status bits
>    pinctrl: amd: Remove contact information
> 
>   drivers/pinctrl/pinctrl-amd.c | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)
> 

Linus Walleij,

Just wanted to double check this series wasn't forgotten as you get 5.20 
preparations ready.  I didn't see it in ib-v5.20-amd-pinctrl.
