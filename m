Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BBEB689715
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Feb 2023 11:41:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230180AbjBCKlD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Feb 2023 05:41:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbjBCKlC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Feb 2023 05:41:02 -0500
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2080.outbound.protection.outlook.com [40.107.14.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BE7E272B
        for <linux-gpio@vger.kernel.org>; Fri,  3 Feb 2023 02:41:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O0VNCO7ckEEviWrMaQPBaZaL97KwBtTPSDuraDgM7XoCe7DM2xWqJCaX1vJWqAanpHu+WvJsuC72Pd9XZtKkWvF77LLXPk47Ut5/ncqZ8d//nHgCuXMtw56C/t1D7ffCPdsTKX/B1sig0/K7mIn1wjx2RgEmO/t2DTSkRXXcxveLRsU6JTLxbZNNDxWxo4YKx0W0bEzCITqTrCzCBVJcZsrbgIDNnZ5/TlEg2P8C5xQqtXYeVXPh6GQ6mVzNkxDXNPtnk4ehg025ofYWkGR9876JTCawlw91OSeJHzJFj254dTxGnH6syDrI6PP4erFE6GbsVJSV6kBjaBEK7pG5uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VEe6OZAJzEjZ82AxCmvm6HvfvFlNqrPiwrsamGYYYDM=;
 b=OJn8X3KlxysgA9HMtXc3enwZP4pGT9qNiIOor8qf19H1xchgKszO1gi+C/ZGqzZ1Z+SApqYIhuS4A84PwcrGE2vG8S17yBOkH4Z2M89DUKcvlkaT2868lTulYqhKHTrsbOb4ctWWHfbXlLKXaPT7grz/8fygUy/TZws3XPKzDt5+pvxttCvIzGRyFfV9RbfLI0cMxkUQzqXrSqxCTA/xSO3J11uqKpeVTfrPUF5rHdiiRU3tmEwk+KHkw7BipGK8bs1yS/DDVh2ENk3MHuPoX5gVQGuN2fs6oj2hJIjkKHnUz1Yratqu9Qbqdh7esGm8iHdDGy3jkuWUgoCVpS7Hjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eilabs.com; dmarc=pass action=none header.from=eilabs.com;
 dkim=pass header.d=eilabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eilabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VEe6OZAJzEjZ82AxCmvm6HvfvFlNqrPiwrsamGYYYDM=;
 b=Klhf+MA1ikC8TD8XioVjUEOk3p9fnaJC99cGN/YzIv04A1w405azl+Q/NBSwcuAGHLFHJX5l/4PQlAtjz6zqhO6gDLHkMTa82VAI7Ase3Y9MvRr9hLEoMvppR9yQJluddcQRuQgpjYsBfkuWHrhb5tPol0p7J1uwDNxfaRQpeQw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eilabs.com;
Received: from VI1P194MB0655.EURP194.PROD.OUTLOOK.COM (2603:10a6:800:147::21)
 by PR3P194MB1619.EURP194.PROD.OUTLOOK.COM (2603:10a6:102:172::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.24; Fri, 3 Feb
 2023 10:40:58 +0000
Received: from VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 ([fe80::6322:b35d:1369:be7e]) by VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 ([fe80::6322:b35d:1369:be7e%4]) with mapi id 15.20.6064.028; Fri, 3 Feb 2023
 10:40:58 +0000
Message-ID: <8c9dc414-9c15-26db-fcae-233c5ca0a171@eilabs.com>
Date:   Fri, 3 Feb 2023 11:40:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 0/3] gpio: pca953x: Redesign handling of chip types
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Martyn Welch <martyn.welch@collabora.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Haibo Chen <haibo.chen@nxp.com>, Puyou Lu <puyou.lu@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Nate Drude <nate.d@variscite.com>, linux-gpio@vger.kernel.org,
        Peter Robinson <pbrobinson@gmail.com>
References: <7b736829-414a-ba4f-59f5-bc78c27621e5@eilabs.com>
 <Y9vS1dsuMm5XxkdD@smile.fi.intel.com> <Y9vTQQlmMd+ZXO4/@smile.fi.intel.com>
From:   =?UTF-8?Q?Levente_R=c3=a9v=c3=a9sz?= <levente.revesz@eilabs.com>
In-Reply-To: <Y9vTQQlmMd+ZXO4/@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::20) To VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:800:147::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P194MB0655:EE_|PR3P194MB1619:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b429c8d-ead3-46d4-181e-08db05d32293
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wCVjGwj5J291zbeSl9LC9jdMFxFghIAS+2W2/zSEZDvAdu5MG1TVQBlQZeU4ezq90nkSEl2JOfObwVXj5wFYKMO4KgPiD9FrdyYo/UVK9hq8LNhd2AuJypjnhyaa3ciFMK3xE/n69FZvP6RRSlhhDjtlwQQWYiwJ5aHjBJnrDOX3ZfbmCP2ocOoGaABLkiji6jSYmyUkrBAMrN5EaDnVnb01Y+M/cJQfWXG8oHvt/Epkcdc0JUy2Labk5+/oItaCAEg7GXlv7fn9p44J0ZVDZgm3P1UYjPljDVBR6m8qqG6Y1PyGgPVC6UN9XXoqZT4cblkp9k7lPmoC6mYjcsrlMZYZDKlcfXqj2q2v274NLS+N64l20LFYUqRVyXQRnddwEvG/2cOPZg1q/4i6vFtsdtWVEqSLXqUbdgCGKgIDhd0C8Qnq9fe8eQJzJULIjVeaHryu3IblZlFAqZ6fiUG4xCYIhd4MSJqavUHJ6Mw77Pq/ut/p/jkqbdOOMw72RxfZintSB2I9IZuB5rxcOYvViRzaDNuWHZbLiK10qVG7Mhm0zXzX5FH2HK0bHM0qHjnGp0MmjvBgJ3b67/qJQ+abUK4PdiVqRBk8FlfJe13WLJpG6d3cMq3lnAZs7W886bamRlpwyiQqCMybzksi+fEvKUDFcIF4BuvWicLJPYkOmLBt7l7bbU2W7Fmh3nAy3Mgl8GF6RNtAHGI/Fe+oKyZLRKUPlTMeA4Htos6oMu1xkoE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P194MB0655.EURP194.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(366004)(396003)(346002)(39830400003)(136003)(376002)(451199018)(7416002)(36756003)(66476007)(6486002)(86362001)(66574015)(66556008)(5660300002)(66946007)(41300700001)(54906003)(316002)(38100700002)(31696002)(8676002)(6916009)(8936002)(478600001)(4326008)(186003)(6506007)(2906002)(26005)(31686004)(6512007)(4744005)(6666004)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YisvTi90YmUreVJiZnRmY2VsM1o3OVJwV3ppTnJXa3dXdWN4Tk92QmdZczdI?=
 =?utf-8?B?WE40cEdXbmUwYllEN3EyK1EzbUsyRGZXMDNia25HVnhPeTlyeU9BbFd2VFFo?=
 =?utf-8?B?cW5oTXhLcUh3Y2c4UmxzUkFFcFk3UnJaOUpBL1VIRVZ4YzJDWjd3RFRzNko1?=
 =?utf-8?B?QzdpMU5DSWlST21MYVNyblpQZXZQSWs0ZXVjQXRHdy9kMmsxTWlCK3lDMHlB?=
 =?utf-8?B?NDl5eCt3MGFGbzUrcDVjRnYySkJ5eTFjakYxWFZaWFYydTZaRzVQRDNxYkt0?=
 =?utf-8?B?OHBZeGk4MlpEQUhYdUZHclpFQ0QwdjFQVlBxeWpFK0FUbWJ2dG5ZWnZiam9w?=
 =?utf-8?B?VG5lVjRiNktIcVZ2bHpKbzgrZkdVMTlTamJlRDVwVUtvc2M3ZG0zM1ZvOWRP?=
 =?utf-8?B?Mk5hTG5TZ1g2MFBqbGlCN25uVlVvU0JHTVVpWWNXUGFFcGRLWkNxUDd5MTBG?=
 =?utf-8?B?eklkOXg1L095SUZobHp2TTI0WXJVMGY4U2wxTjcvdWRZbzlBUVUzdXVsc0c4?=
 =?utf-8?B?ZjJVeVVhSHVrK3NTcFRPWFhwdWpNR0ZzOEZvMTdEdVlCWHljaWEwR0hUd2xS?=
 =?utf-8?B?TnU0QzZUNUhBanlUNWQ5TFNPZGRVYXRUaG03NG4vNnZYcjJXRCtZcGRmSDFL?=
 =?utf-8?B?ZVVBSU1xM1I5anowWUFaWC9tc3BtSmZ1a2RGMS9ML2VxNERNaEZVVDFVaWlr?=
 =?utf-8?B?WENVd3JRWWhKQ3ZWckt1SHhNUUZLQWJaUTNnRndVRnBwdFYxaEJFekFvaXlD?=
 =?utf-8?B?bWNKeXJEUjNiamlZNExMVitGQmc0eWh5R2tPa0hLaDFWRHMySWxwbEY0L3Fi?=
 =?utf-8?B?VlB1NERYTy9lejRVcG5YVEc0bHVkbndqTHV0MnNqbkdwdFYvc1ZSQms3QnM4?=
 =?utf-8?B?TE8ySXpRRHUwcFpvcEZZd0o5R3RtQVQ3ZzVFUS9DbFZVMUhERTI2RXBOZGFR?=
 =?utf-8?B?RitkWUNMQ2lZbXRZN3ZFTVorNndLN21LT05qKy9TemR2MW1veXNYdEptUGtQ?=
 =?utf-8?B?RTJRb3B3cmpBZEdHckIrTVFnSWNPdFZhUm5HcHhRQWpzZFVycG5SVGJwRkFV?=
 =?utf-8?B?enJ6aGxjRDQwc1NwalBQVUgzWHZjU3FQeDNVQWRtVzdVSFJJWHVaUlM5MklQ?=
 =?utf-8?B?bzFWMlFVUDN4TW1PYWE4NWNhek04NFRpM1ZMNldMRkRhYmlLTjBqU291ZjJU?=
 =?utf-8?B?Qno1NkR4MEIySHlmTGpOdzcrUmppUDNDR1hnKzBMeDJTTklVc04vQ3VCQS9u?=
 =?utf-8?B?QnlEa2dxbFlkOGVpY2tTbjBXc1hzYlhDZm1uU1N0MG95ekF0Um13d0hwRFlq?=
 =?utf-8?B?YjJJZ2REZkZqWVlGU2ZuSTgzbW8vSDdPcGNvWWlIUUtuTUI2MjJReEIybTdY?=
 =?utf-8?B?UmtxU2FQcGQ2aWUwcklPMVk2bGYyQktYRmMyOGRCQmVqNk8vMmp1a1JGQ1BB?=
 =?utf-8?B?UHVjR2ZNYlNjbDVSZGRnU2ZlWXp1UVkxam0zaEk0eEs1TWkvZUpTa0xsWjl1?=
 =?utf-8?B?N0hmZ0NyR0xsWE5FVWllVnZTcTZhV2RBcEpDbThhYU5FaGtxdGFMWEU3MTZt?=
 =?utf-8?B?MlJ4VjZiR0RlYWRXSUFtVEtXTDAvcHM5Qzg3WklWdWtZaFd5dHdsQnkvYmEr?=
 =?utf-8?B?YWI0RFVnNkFyZGZrNlZ3b0pwM01ZNkJzbXRiYnhWeU8zdmtabGhQbEdiUnEx?=
 =?utf-8?B?ZUpSWlhxVGJXcFBFcjFkSEJOUXFoMUZ1dEt6TEJ5bjRBR3R4YWpLb0xxeER1?=
 =?utf-8?B?Z1g2Q1dFQXZsc3A4N3RGSFVQWjJYSHhHNkd6Vk5nNERwMXRVbGxjOHdaL1Ay?=
 =?utf-8?B?a0R4WXB3dVhuQ3BFY3dua3lMN3NKNDNnRTVlekErYjhPZWxmSUlwZ25Yd1M2?=
 =?utf-8?B?MXltV0IySjJZSmtqYnEwbGxCR3NLWTR1Zktlb0NVMUhWMlUzMjlqVlhLYXpi?=
 =?utf-8?B?ZytzOHdNWm4rblhUWnFBTk0wc25lZjNiUExhMjlENE1mendaVGw0ZG90aTZB?=
 =?utf-8?B?RW1nd05HVXpMRWxaajUxbGUxVXE2cEpIUmptNXNXeTFvSW9KaVBXcTdXT21O?=
 =?utf-8?B?TVVlV0lOemxjM3o4eDdjWGdFWGU4NHFoQjJMSlFYSTE2U1MzeFJMNlV5R3ZN?=
 =?utf-8?B?YkRqLzRnaDhEVXMyQXl2aWhnVDhjN28xOUYwaGxzd1RsVFZ3NXUxSW12MzlQ?=
 =?utf-8?B?NUE9PQ==?=
X-OriginatorOrg: eilabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b429c8d-ead3-46d4-181e-08db05d32293
X-MS-Exchange-CrossTenant-AuthSource: VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 10:40:58.1391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6ef6a9ce-c7b1-47cb-80ec-8c54be45d567
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hHzPbiq9xO420H1xWqVptPBo9CDgsGkKAAqTlwxSOgAyANPDdjl9VICHTqSedaM9vhAjNZ2J2OAeSiOE/GJ0nwNIqx5rwm9SEJXfA8Hk7vg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P194MB1619
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 02/02/2023 16.14, Andy Shevchenko wrote:
> On Thu, Feb 02, 2023 at 05:12:22PM +0200, Andy Shevchenko wrote:
>> Now as I'm thinking more of your nice job, it may be less effort to everybody
>> if you start from moving the driver to be a real pin control driver united with
>> GPIO handling.

I will look into this, it will probably take a few weeks to come up with something presentable.

Thank you for your review so far!

Best Regards,
Levente Révész
