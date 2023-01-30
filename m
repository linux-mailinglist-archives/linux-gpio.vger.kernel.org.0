Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D966681BF1
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jan 2023 21:59:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbjA3U7i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Jan 2023 15:59:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjA3U7h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2023 15:59:37 -0500
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2084.outbound.protection.outlook.com [40.107.15.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77857305F6
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2023 12:59:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AXK0snzn0nEytK20r8trzrSKq9dDjvM9zOXYdHRJcDnji3IcLtlY25msSOTguTt//WJbmKTHMgruWpxgZf27DJXerIELonFwHqhYP0iMV3fn+e4sv3+5LUljkHaIj3tK964S5gdCoRe06DjXH+kKJCHIsVOimFCLI3Ikh+Wp7GGYsG4KcwWwURBBH1N5YO0u+wNNNE0NJnbQfTa9Q3tk+eO6aiyJ63n8e8D9TXJV3HZkK61WpyYswtPOthGlV3nzzc4u6VXfH0FLvUcyYJjHUVcqag4bbDZaUKxlkXufLV7zUbVJV6VIhdNNR20JHFxdD+bPCs6GBoY+ngfvnt93HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oITB2K0QxmqgA+c43sg/PQf/KojC/KJNKHUXkq7bAiY=;
 b=J3XkZUvW9qodqQUEUFZYbysI8WyxdJfQJx+2l5IcLAHO9mf7Jjz4z+EDLsSq9EIan2fMORRS3PJtCwqpX7eZ6KhO9SJPq2dP4XC6yo2u5YGfuo5rhFvdRoGDIfeRblfZt65rfkFiTIbh5d2C3Q/Nxp1t7HP02OxW85/0VStwzZxQkNhwryL1qGYZgRHZkuosxKqFHx/oG4/Zf4sXSD0cM0CgbqkZZIXGzvwtxlgjNXpW6Mpl6g5PZp2qlEgsNtyRmcERzNGqaoByDSWIjxLvuhAYKsWD23LjO8oVNoNwOiXpCyOMEihLlBDUyGwDebrgKmYOheYtwPxoA21FtWgjUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eilabs.com; dmarc=pass action=none header.from=eilabs.com;
 dkim=pass header.d=eilabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eilabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oITB2K0QxmqgA+c43sg/PQf/KojC/KJNKHUXkq7bAiY=;
 b=I56RxZAV4x3VyFUUHJkRgopx1BWle9kmHX9MZuPO7AOHOdx1FwB/g5fu3P+3yqoF45LTGGcDz36znh9+l5ytSpuZQvjdfoJxh7oMyI2rlSh0nueqjRpAMwkTrtxVPXaOz0O702qtF9DQCeTml8IG9H0Gb+MpQU8fYX+EgICzq8g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eilabs.com;
Received: from VI1P194MB0655.EURP194.PROD.OUTLOOK.COM (2603:10a6:800:147::21)
 by VI1P194MB2168.EURP194.PROD.OUTLOOK.COM (2603:10a6:800:1c7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 20:59:33 +0000
Received: from VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 ([fe80::6322:b35d:1369:be7e]) by VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 ([fe80::6322:b35d:1369:be7e%7]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 20:59:33 +0000
Message-ID: <7b736829-414a-ba4f-59f5-bc78c27621e5@eilabs.com>
Date:   Mon, 30 Jan 2023 21:59:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
From:   =?UTF-8?Q?Levente_R=c3=a9v=c3=a9sz?= <levente.revesz@eilabs.com>
Subject: [RFC PATCH 0/3] gpio: pca953x: Redesign handling of chip types
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Martyn Welch <martyn.welch@collabora.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Haibo Chen <haibo.chen@nxp.com>, Puyou Lu <puyou.lu@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Nate Drude <nate.d@variscite.com>, linux-gpio@vger.kernel.org,
        Peter Robinson <pbrobinson@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::9) To VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:800:147::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P194MB0655:EE_|VI1P194MB2168:EE_
X-MS-Office365-Filtering-Correlation-Id: bd73e4dc-f470-46c6-5b1d-08db0304e339
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P6HHT/UC7CkIrWmRCcZHyFaMAEDJcgh2r7P7VW6g2R4K6Klm9dzAW/bAi8CSBacag/j1leB2fDKvId8KjUsIy/Zn/WgfpxaHt7QYI3zxI09NUcR2sDesnoBMcLwGwSE7ikiF+QukJhKGdKgYqrMiN31VcXaGw7oSGXrvnsI5nQzdF+LXE+qUHrOyax27WbjW2FrXulKd0juhTDhhWJACgY7SOU+ES323hMEUhXrQ3q+wM6bQ3w8u890Rc4ao69HMqyvM5TaT6LuyBdB/Bv9kKI3vec/FeVezlruvrOLAIur+9Fe7tX4R5gkGk0enb3EdCu+JEVN21W7cS7w06Gy3/cJUX3X9/m0cUYm9/pqMnRRR2yntQqyGjY8xr07Aqiix8Y69rJ7zc742Mwu0yxFPbO5SjHPmLsXeB3urwtmpL3h/yV+LEdZg5QcrTFFdqENu5Dh1LqwkYWuUOsSdGje/UrLGKQi3RW786Eevldd82LRvuMxqoh9Ep9yycxSqW6yS+qM+HjrS1fTNCOawsM97S1pCWvFyP4zJa0LnmPmDDslC6302zQFEjZrwtBSCyFsIvysUQcv7gWAg0FQAXJCoiHvpUZQty9vkKB3WZWZZHQR5WRPh83ndfNogby6t6s3b5PDyxHkk4QgW2mlSsXwc8a95s9/3D+xZbV4e8AK4pPfbinn3RTb0/fXYMkGlEPfCkPbPUdewA7MLc+/v5HnqD+r7mQ9z6GCIXNEknNjDAEYX7vQXGu18ieH8EdlggzHt4kKU15Y07JdR1XAZDJAZag==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P194MB0655.EURP194.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(366004)(396003)(376002)(346002)(39830400003)(136003)(451199018)(7416002)(2616005)(31696002)(86362001)(38100700002)(83380400001)(36756003)(2906002)(6506007)(6512007)(26005)(186003)(6486002)(478600001)(966005)(31686004)(41300700001)(66946007)(4326008)(110136005)(5660300002)(8936002)(66556008)(54906003)(8676002)(316002)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVlURm9wdG1OTnNjUUtxbTJDR1VENTA1MTRhWFV4SGhTaVlyT0lPL21EOU1W?=
 =?utf-8?B?RlNITnY5czlaeEFEWkRST24yUHdiNjBQR2F6VUQzRFFDVk1CQWJvbUxtNmVa?=
 =?utf-8?B?dnlTbFZTaWRDdTQ2Y1J2L2QreUpTWnFMajY3MVFlazY0NTlUWlBvRmJwbXcr?=
 =?utf-8?B?ZWVCQlY1SndEY3pVWE5hWmVDWUZtSmk1dGcyQnlmV2gzZytFQnZjV2s0TXha?=
 =?utf-8?B?Rkt2Mlc5UktuQm5nWDhPNEppVlpsYjM0Zkh5RWdPT1dNVUpBTnRwUmtRV1lt?=
 =?utf-8?B?ZG1BMGVaUGZLZkl1aVpRWE9TL0FUNEZpSW9INGVLZ1hpYUJpejZ4WVJlQkhh?=
 =?utf-8?B?WG1DQWpLc01HVTExZDRSd1NIREZPa1RlVlJCM0RDWTNxcXdLWGdka3FHQ1ky?=
 =?utf-8?B?cWdmaWEvSnJQRnYyS05vRzhKQlBPZ3ZIek9vUW94NzRJVXByY3NsVjJXZlMy?=
 =?utf-8?B?ODk0QUJMbEtKY252dnlqc3h3dlVkcit2VDE0SGs3ZW5JaTlqQXlBaFpmYmh2?=
 =?utf-8?B?aXRESlgxM1AyQjliMTVrUGwvZFNhbU1wNnV4L3BDeXBFUXJvRGdOcjBWeDdy?=
 =?utf-8?B?WC90dVlUZ3V4YWliTWVQQjg0cFdxeUFWMncxT0VWUVY1RHVlNmhHVjdwY3Aw?=
 =?utf-8?B?bXFUcWZuRXUzVVdBMUpTcDFlSXlCUDFPRjJWUWNrTjRIb1drNGpjZlNPd1NJ?=
 =?utf-8?B?eklaTEp3QnhpMnBJaDBZSmZTSkVJR0lpYUZLdnlBbXlVbnJCc0dWTlRIZm13?=
 =?utf-8?B?Um5MSU5rQnhIRXRVemU2elg5UExRV2g3TXpkQWV4YnRVaEpaUlF5YmVaNkZz?=
 =?utf-8?B?U1c0NzRGcVZsZ0U1UDZ0b1RMOS9PN1pNYzNOWmhIRVNMV01MbGZhd2wzeS93?=
 =?utf-8?B?amlFYmtiNkswdHJWUTVkOXZtOVZMNlZ1UmZFRzZtZUR2VS8zajlHSENwcTVr?=
 =?utf-8?B?ODNTOGMra1VvNTBYa2tUblZuSU1qSktWSk9rUElJZkxRU0I4TzY1RWkwSUIx?=
 =?utf-8?B?NEIrZWFmdllFY3B0K0YyZU1ZeGpNb2NTdlZWRE9wZXlyNzJ1N2FONG1PUG9x?=
 =?utf-8?B?ai9heDBqd0hNRzhzQ3E5MFNTYStXQ0hubFMyVDlta2lOdnkwMm9wZzFMQ0dq?=
 =?utf-8?B?T2RPOTFYU29KRUI1SDIvUEJ2Njc2a05NYmhHY2VvQWtSVW9VL2dHaEVyRzU2?=
 =?utf-8?B?RmpBNnFGTHpqQlBmSXBRMVZ4NFJRSnlMYkZ4VzEvaEtDQ2VoQ1pDTkx3dFRX?=
 =?utf-8?B?NmQwUW5OSVBLb0ozUEZJOUx2eFcwMkNrd3pmT3hWMUFSZXNaeDkwV24vQVF1?=
 =?utf-8?B?dE12Q0ExWEJ3dDYwcGZNbGRXNjc2MDBLQWIxTE1SRGtnMnEwN29ORWE3dFI4?=
 =?utf-8?B?Y0ZlQnk2bTVxdTdZTnN0Ti9JeHVvNnR5Rlo5dUNUaXpDbFdaamNoVEk1T0Zj?=
 =?utf-8?B?aWxvVkc5akFyc3hZNXBFRVMzb0k5Nngxd2dlNUJqTE5ZM1QxOGJGUGxzOE5o?=
 =?utf-8?B?YnlhRHR2WHhkNjJiaGVLNi9sR3AyL01ObWIzelpYcnRXem14L1dKSnFFSzBk?=
 =?utf-8?B?SzBwZHNkWHpxa09Iem9uZURBVkpMSE1vWDl4a1dUUElkdDdpcVNGeUd2aTlr?=
 =?utf-8?B?akNhSzRjVllTN0JHdWcxUkpIYmU5ZEMwaEcyZUs3ZGQvejRvYzVBeHl2Ykxq?=
 =?utf-8?B?UVlYbDllYzdqSHRiUURCSXh0RGVCY2thYnByVFZiWWpKZm9mdHAvZWRSRjBt?=
 =?utf-8?B?NTM3eEswNWNKL083M0NEQzk1cVdDTDFEWDVENDJhdFdsaEpEMVJjRnF4a0Qw?=
 =?utf-8?B?UU9Vb0ZaeUFLVzdjUTI1SDNBWVIrekVjNlVreVYySTIzYnBML0NveGlaQ1U2?=
 =?utf-8?B?Q0psRTFKeTg5ejlJWVMxdVByNVJXWk1iNzBBdWxkUkVXK0xwMHlxM1hEYnlB?=
 =?utf-8?B?Y0kwc1NGU0VPN2puTzBxNExPM2lPQmw3QjhVMzJ6bWNWVTFYQ3d3ZGhNVlMz?=
 =?utf-8?B?Z2NGUGVyUllTc09yUEpTNVNaVk1ac2k3cm5kb0hueDMrVFRISjZHeWhyYlZJ?=
 =?utf-8?B?UmFpTHZ0RnhTQUpsQ01HbSs2eTZmSmc4NGRYU2VlRUQyT1dSYkNCTzJMTHVo?=
 =?utf-8?B?RGZXeW80UDBoSGdqYXdOaHhlUUQvcXBXUWdYVnBjYm9IMFFCWEUxYmVOU2Q2?=
 =?utf-8?B?THc9PQ==?=
X-OriginatorOrg: eilabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd73e4dc-f470-46c6-5b1d-08db0304e339
X-MS-Exchange-CrossTenant-AuthSource: VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 20:59:33.1714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6ef6a9ce-c7b1-47cb-80ec-8c54be45d567
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uAFmwFcFK7RNsDUfrvpw0667loSeNKC3w2FMLWgSN7j1gZtn0n6CBHwb4PiLDx8Wc5SfxajbUWJ9naYAiO7QpOio7p86OB2j66+NOFMKMt8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P194MB2168
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi All,

The pca953x driver supports many chips. These all have the basic 4
registers: input, output, invert and direction. Most of them have
additional registers for various functions, like pull-up and
pull-down control, interrupt status and mask, hardware debounce.

Different chip types have various register layouts. These layouts differ
even in the basic 4 registers.

This patch series

    1. Cleans up chip type handling, and
    2. Replaces register address calculations. The proposed scheme
       works with every register of every chip type.

These changes make it possible to add support for extended functions for
more chip types, including:

    * Interrupt mask for PCA950X, PCA9698, PCA957X and XRA120X
    * Interrupt status for PCA957X and XRA120X
    * Bias for PCA957X and XRA120X
    * Debounce for PCAL65XX and XRA120X

References:
1. Previous discussion about the chip types
   https://lore.kernel.org/linux-gpio/Y1q52efyv93%2Fz8BC@smile.fi.intel.com/
2. An overview of pca953x chip types
   https://lore.kernel.org/linux-gpio/67bba210-09ac-32fb-bb97-8bfc40c2c200@eilabs.com/


Best Regards,
Levente Révész

Levente Révész (3):
  gpio: pca953x: Replace chip type flags with a type enum
  gpio: pca953x: Describe register maps with enums
  gpio: pca953x: Redesign register address calculation

 drivers/gpio/gpio-pca953x.c | 1196 ++++++++++++++++++++++++++---------
 1 file changed, 894 insertions(+), 302 deletions(-)

-- 
2.38.1
