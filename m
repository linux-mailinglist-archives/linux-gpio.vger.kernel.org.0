Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 916AA62C01F
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Nov 2022 14:51:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231838AbiKPNvR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Nov 2022 08:51:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233183AbiKPNvQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Nov 2022 08:51:16 -0500
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60047.outbound.protection.outlook.com [40.107.6.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BB55205D3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 05:51:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V7B65u1MN4e1XxPGQ4obKN8kTco2uIduM+uNbY37vnnHbIKQOpHkXoRCGxa4gz49ak3sxZg6VIV2zEhtdv0SciNPDr+1SfrfNJfEIE0n4nJj/0KPhf19Z4jeVU+e3LVMZXDFlHN5ZsuzJqzdRsX9cnYk14+z/avQYHe0wLKaEAZUaCmMmWRyBLG9VlpdJbLtoWtSCejhmsULq0LX52RwDBIqQIMgt+57tIJ+VhTxj30qiU8M/4H9WgssHFOwXzsSLOwH3V6WuTKItQZCEJhNQsaxQev/AIbWNM3hQJ4cMy7xThyoH9q4qPWHtkQLgKJ5szZp0TjVMMawlhIYus9/NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u6GyiKnUgKv9Jg0LWH9ldSMOzFdbKNLn1sy8JUkdJnU=;
 b=QWMNHg19or7RLYbRkGrVk/R8eRy9wIKjszRCRT/xzaZn9ZB2pd2pAfXe4qqk2dEMoiYh8OpwdCGozGxq/cANhvN+LZRw0rJ78hIKOhevRUMTwoed1HThCELbQEcE73SlBmu/tgzsGghtR7uBXLPdCvd80gDe+/w8NRrPKBckTo5fxIP5KrBZRFrgqZFvkAiiU7VZLRgw7RswczGKkQPCMM6lD7jm0N7PXmorz1U7wjmZm5mgDjebtp9R1lHaXrbRZptF2vTC8sMVIbmkYMJ1g1KX+b3JG0xiD8GWvEpUUu9QH/jr+bWPo1twr++wv2WCYqcOqCSt71TYnLSOF4V5OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eilabs.com; dmarc=pass action=none header.from=eilabs.com;
 dkim=pass header.d=eilabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eilabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6GyiKnUgKv9Jg0LWH9ldSMOzFdbKNLn1sy8JUkdJnU=;
 b=xqexpSWs9z6wRtm4WYSilGkjrea6NCSWdp607Iu9at0/ImxqHEAIzn7WRvB2MDtYBtlMBObfc+r1dA3jFWm3tR80iz6NCbU/HYQiWi8MmvhzCrmICMIsxjnfX4DBTMi/V0Ubtzl8aS+DPwevsbTYjc5RwupAjuzZkedk+/QGfVo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eilabs.com;
Received: from VI1P194MB0655.EURP194.PROD.OUTLOOK.COM (2603:10a6:800:147::21)
 by VE1P194MB0751.EURP194.PROD.OUTLOOK.COM (2603:10a6:800:161::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Wed, 16 Nov
 2022 13:51:11 +0000
Received: from VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 ([fe80::b29f:dc93:5ae6:764d]) by VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 ([fe80::b29f:dc93:5ae6:764d%9]) with mapi id 15.20.5813.018; Wed, 16 Nov 2022
 13:51:11 +0000
Message-ID: <12c33c55-a0ec-3dc0-2416-f3dcd7f74f44@eilabs.com>
Date:   Wed, 16 Nov 2022 14:51:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 2/6] gpio: pca953x: Add PCAL953X as a separate chip
 type
Content-Language: en-US
From:   =?UTF-8?Q?Levente_R=c3=a9v=c3=a9sz?= <levente.revesz@eilabs.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Martyn Welch <martyn.welch@collabora.com>,
        Haibo Chen <haibo.chen@nxp.com>, Puyou Lu <puyou.lu@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Nate Drude <nate.d@variscite.com>,
        =?UTF-8?Q?D=c3=a1vid_Jenei?= <david.jenei@eilabs.com>,
        linux-gpio@vger.kernel.org
References: <cc987520-d95b-01b9-5b65-53442ce122f6@eilabs.com>
 <9bdc962c-1cfe-8240-963c-491f3992b2cb@eilabs.com>
 <Y1luUgS25ddeSCT9@smile.fi.intel.com>
 <8b94b5a6-fac8-5087-b4da-ddba098d2265@eilabs.com>
 <ea34ed6788923b8be496317f7a962d7073946ff4.camel@collabora.com>
 <Y1q52efyv93/z8BC@smile.fi.intel.com>
 <67bba210-09ac-32fb-bb97-8bfc40c2c200@eilabs.com>
In-Reply-To: <67bba210-09ac-32fb-bb97-8bfc40c2c200@eilabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR10CA0108.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::49) To VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:800:147::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P194MB0655:EE_|VE1P194MB0751:EE_
X-MS-Office365-Filtering-Correlation-Id: 12e39102-b559-47fd-4479-08dac7d99ed3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZNLV9opUsq1B+XqKOaLnmpybFbd59mbkv4f3xTNd5eXcauOXgkpCXSWrvP5lXffbssw+fuvS/7pWp/V4N2VUWzkiEH0i7jDBDx3sxWth88vMXS1wwAVCNaGjKzzTRCV3woGzALCJexSlTSUccIa0qwuNw6WjYz0GZGfwt3rdxT2C5s/+Vwb9I5deYWmSbbsAWrAOprfN8b8ncHD+GuVO07ZgtNUduC9q1ZrekKuAp/deTlhVyzLY2i3J1byCK+dSNi/fOH1n6VojMcrt3yOZhjqBjs5J7uMrBNaLOMw9rY/kVL+ys0f0qXaotLcQZPNz8V9JqF/wa6fsXzJtQQ1hWr1zcmPlkxOQ8doPvO6tY781a7x5FdtHrtYfZl5/pW/6114ZVPn/mdI5HSV7sHac125D/BUGZNLv9mxLmmP1LMLyiBRZ1ZAiofDAa1gJ7FMNPAVzYGGux/0V4qkx+/W29Dm31TqcMd/YyLBLgIqcDzysVdLUz896Q7oU4MUb30ITu+jMEcu5ZOpTeczlXRj/A7qadqMqbRdCdcheQN82u1OaVUv9bsgk8Jx3X2zyA5x22ibYxFSSMQ69TxmXa5dvc4K5iQRb2s19l4MTCcHy0YlJXPyn4j4uhmeGyTAW8JoI/4+ll5gcUPNbPUnQUdNh/QZOwKufgQ0e30Ho8fNaqkpYvSEJm4DfWm+qR0e7GxAKPqoLPz/D87kaJU556YRX9Hzz6p9QueY90aTc9s2k0JOHGkO8tnbIuvbv//R4NjPQHLAFOHtAJ7myyh41oI/yrG8meH0wpvUAe2T2kL1omzrV1fEpuCmZVU3PrtK+u2HR
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P194MB0655.EURP194.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(39830400003)(396003)(366004)(346002)(451199015)(36756003)(26005)(31686004)(86362001)(31696002)(38100700002)(186003)(83380400001)(2616005)(66574015)(2906002)(6512007)(478600001)(5660300002)(7416002)(8936002)(6506007)(6486002)(41300700001)(6916009)(54906003)(66476007)(316002)(8676002)(66556008)(4326008)(66946007)(437434003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0tZTEVVMzFtS2Vhd1dPTWUzc2h6b0NxSTdyTVR3NUI4MzZCa2F2TGYzeHha?=
 =?utf-8?B?NlNBY0pDdkNTd3FlWEN0Lzl1YW5maVJFb3Nnak5nTmh0dUNKZ29SVFU1ck96?=
 =?utf-8?B?KzJoN29Wa2lsRHdYOEhJSTdFMDdVQ3p3OFVFQnpLNVhleGpoeE1XdzlCM2du?=
 =?utf-8?B?Ry9nVDRGQUtHNWRZWVZ0SnR0OUNYMlFzSUVBekwzOUNRTnpHU0FYb0hNVzNL?=
 =?utf-8?B?TFB0ZkhneE5JTmR2ZitpclV2b3JOY2FYSU9pa0dsRzJwRnBPWnZ2NnMwVExy?=
 =?utf-8?B?WHZoTGplVE5SV2ZKaHBTdy9uZDR5Z2JzMWErbm13Vk5Ddk1FcmhpN1ZrM011?=
 =?utf-8?B?Nm9ZejA2ekdPR2NZU1ExRVFDUzQzTytIUkFDK3dySGxBcEZsOXozck1iUFBD?=
 =?utf-8?B?ZTFISHk2SGgwV0JvdVFSTnhud0VhaVpDQURHUXpRaEdWNCtPVHo2S3FWTURy?=
 =?utf-8?B?d2tWRjlFSWloNDNlNGYza25hc1Q2Z29BRTdaVzlGUWlBTlRpZ1RId2VweW9M?=
 =?utf-8?B?a0VsRWdOS1VTNWhCUzBSMTV1alJjWU5HaUt2NFhMVTZYS05QVkN5ZEJ1TFAx?=
 =?utf-8?B?THpyN01GTENYNG1GckMvZ1BZNDd6YU5hb3ZRcWlRWmNSVnVSVlVuSXgwSlpl?=
 =?utf-8?B?NWl3OGc0VHhCUEthZ2R4R2ZlNUxzaVhhNWNKSUNUNGgyaHUyKzRZZzU0bVNq?=
 =?utf-8?B?OTNiNVN6VzV0ZDk0MHh6SFlJMURLM01LSzlic01nUlZ2NUVTeVF4QWJ0UmZk?=
 =?utf-8?B?MWlYZmVZZkhkQVpuQUxhcE45Rys0elVQSkZnZE1xVHcwem51R2M1blFjMXMz?=
 =?utf-8?B?SjRiTko5YnpPV0JzTEt5b1REWG10NGhvWnhJWlpsY0IvVU54L2tiRlQ2MVR3?=
 =?utf-8?B?VllpTnp0RERiWTlQMTZYa3ZBK1ZtdFB6MmtZWXVJeUxnL0x0Ti9CbHQrZVVv?=
 =?utf-8?B?SklSQzh0aUx2L1FRSHZ4b3ZPUDdWci84Y1VYeGtJOFIwVm5hOFV0LzBVWkVK?=
 =?utf-8?B?MTJMQjlVYXFYY2ZocU5tdmJWZUdqWnRFMVgyVkFjUzJGRmdYSkhSbEZ0RXhW?=
 =?utf-8?B?RDVCT3NMMG9hZUcyVFpBYXN0Z1ZHWDJraFIveHpzczBGaFdWZXR0UVlYYm5y?=
 =?utf-8?B?b2ordWNtTFE0Z3lBQ2k4RTB5aUFQYXVLeFZwbHBMZ0M0dGtYeURMaHIyYlFj?=
 =?utf-8?B?WUdJcW10Z2NWZHhnU3A2Tnp0NStQd3NzU3dBUTVsc2tQNjdkZHJycUl5d0J0?=
 =?utf-8?B?bm16ckszOXZFOGVtZG82Z1NxQVVnd3FTYmY3TjNpdFpPYm9nOHNXdjBVNlFi?=
 =?utf-8?B?SyswRU9JSGdHRkdKL0pSQ3VqWWYrdFVTOHVqN3M3N1Y2ODN4cEoxSGdNb1pq?=
 =?utf-8?B?YVhVazZtRWRSdW1SenUzZG8vaU9XYy92SitiUWtDOTV6T1Q1VUIwbEFUVk9X?=
 =?utf-8?B?M04wV1dEQUFINnJkUklkVlYxWmFmeDllcGk4UVZWKzI5amx6M0hWYVpjUWZ4?=
 =?utf-8?B?Yk9PdVNVeUU3VlR0Z0Iwc3ZvSVpRbUxPejhBbDA1OWFKbmZ5ZDBhSDczdEZE?=
 =?utf-8?B?S1RPdktNSXlpSWNtNGQvVis1VmhJcDBEK05FN1JOK1gyVkVTbTE3Ui85VUd3?=
 =?utf-8?B?OUtrMUlFV2JOOVpqU2w4K2FSR0JRR3NaekM5WTRFcEFDZnVuRU44SS9VeW9u?=
 =?utf-8?B?NWh4aGJCTjQ5RHJJSEYrTU1OejBIT2dVcEh4TzRSRTZHa3gxZFNEVjBJcXV4?=
 =?utf-8?B?RHVyOTVSKys1RFp2cU0rODRkaWh4T2NWT21HVThzMWdYZUczNTZ6eUMweEc5?=
 =?utf-8?B?UlpPVEJpZE92RklpU0RvQjZtb3luRjdwcmhsOVJTTUl3dkkxSDBXZXNPd2lk?=
 =?utf-8?B?R05kNklsLzFkTEhxall5RUZvMkhvODlIV2MyTkVjZlRRWDI0Q1pFZXliaUp1?=
 =?utf-8?B?blVWZyt1Si82UG1aYklNYk9GbTFjZ3NEQWdERVFsSEFtejZ3a1RObE0rQXBw?=
 =?utf-8?B?amx4SEluT3p2QXRTYUIxMXV3WlBKTjF6OTd4dUNtTFF6QXU1WmR5ZjByS0hw?=
 =?utf-8?B?UGRpakpjTHROT0txaUcwdHZvNkM3QVpSdG5pajVpdXAxS1lSR3YxcnJ0VDFa?=
 =?utf-8?B?SGdBQmpoRmxZQ2NIakxuMWlUaXB1N0NzVjVsTmJuZUlub1Z3NWhrQzI3Ykk5?=
 =?utf-8?B?eGc9PQ==?=
X-OriginatorOrg: eilabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12e39102-b559-47fd-4479-08dac7d99ed3
X-MS-Exchange-CrossTenant-AuthSource: VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 13:51:11.4385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6ef6a9ce-c7b1-47cb-80ec-8c54be45d567
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UV4JsaDx2zoMZzVVp7TNy91la6NLhz7H/8NWLTgt0CeIg4Txx8oVxBz8QLsUhwT+RqOuoqYOAcqKpdze6MKJnKF6pfWA9Zd15QGYGEzHDkg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P194MB0751
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 28 Oct 2022 20:57 +0200, Levente Révész wrote:
> I went through all the datasheets and created this note listing
> chip functions and register layouts.

On Thu, 27 Oct 2022 20:03:21 +0300, Andy Shevchenko wrote
> PCA_PCAL is about having latched interrupts, it doesn't suggest
> the layout. So, somebody needs to take a pen and draw the current
> list of possible combinations of the features and layouts and then
> we can see what can be done as a type and what's not.

The note in my previous email lists the functions of each chip this
driver supports. The currently supported features are the following:

    - basic interrupt (no registers)
    - interrupt status and mask registers
    - bias (pull-up, pull-down)
    - input latch

Proposed chip types to allow implementing these functions for all chips
that have them:

    1. PCA953X without interrupt
        also covers some MAX731X chips
    2. PCA953X
        also covers some MAX731X chips
    3. PCA950X
        also covers PCA9698
    4. PCAL953X
        also covers PCAL652X
    5. PCAL653X
    6. PCA957X
    7. XRA120X

Other functions which could be used for pinconfig, but are not currently
implemented for any of the chips in the driver:

    - interrupt on specific edges
    - drive mode (push-pull or open-drain)
    - drive strength
    - debounce

Proposed chip types to allow implementing all of these functions for
all chips that support them:

    1. PCA953X without interrupt
        also covers some MAX731X chips
    2. PCA953X
        also covers some MAX731X chips
    3. PCA950X
    4. PCA9698
    5. PCAL953X
    6. PCAL652X
    7. PCAL653X
    8. PCA957X
    9. XRA120X

Should the chip type take all relevant chip functions into account, or
just the currently implemented functions?


---
Best Regards,
Levente

