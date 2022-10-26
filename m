Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFAEA60DF60
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 13:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231597AbiJZLR6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 07:17:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231877AbiJZLRu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 07:17:50 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2059.outbound.protection.outlook.com [40.107.21.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64E9ACF86F
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 04:17:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fE+U4Yq7UldIbeng/T86QdxV7EhY509GuOsLGf80PPHCld+eN0EpKhiOTajGj/BIFw0MynUADppehq+9Ecu/cXZn1WRrUH7VaWuoPZ2H3l8e5indb+SndMVHZtDOa+/2X+qBYzInEgoAWcVAZMQmdZLZ4eeZn6aRIKicBF/LTIFFyKI1HhoSc78fqkbp2eB1t/OweBuiaUJ6B5ghzjMISXTs9y/rzYwUvitICTNb2osSPD3fSns1zuxG2x3a1z/K7uyjDCmsx2vexaDUBFCSnBnUwtmGfZjeBau0Q38lV/27ksr5hlJTjiBU3QthBdK7WW+7wfBkAT923gIEr1cHug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oW550t8CmHK2Wce6+oq/ekK1y+RZ2w8meqc0qwH1+Q8=;
 b=PuuGlvdlsqoiazRWpMZNnBx6rI+4NryCNiuzvgTUPAAQbVHSGVvwt8IP8Yvs/+jvinzGPlnqV5K6wR49kcljSQlU9H1cOOsVy+gyD8VXWMJlAvD7UdUpwTGlx8Y6azAWeq4EGg3OzpGK5ctNOBb85ileRHVj0ncv2tg8KiqdXVgWBU6HVQ8Cb4qrYVXt6kA2OESekyoVZtta8dRq2aVdUiGqdeAuYidu9Bp1gv4d9s9sIiV1gQ6rYeSirA04BEW3mv3/Ui2lxaTDUEbHpWMiz80DN3QoDGF6a19x2cJA23x3ec9d8ASnX9boedL+pnCXaJ6e8qlCU/c0jlUmE9rSlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eilabs.com; dmarc=pass action=none header.from=eilabs.com;
 dkim=pass header.d=eilabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eilabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oW550t8CmHK2Wce6+oq/ekK1y+RZ2w8meqc0qwH1+Q8=;
 b=KhFSGztbP+nXDNF9CHVTInAmiuF937VDNWl+xJrO6bGupwxUYdlqaXJf3KfoZICY/0UFOGo1lQFCypY5WHtIwsy/Y4lds1s8GOMW5zlV+2Dqb+Ew5EH6BJBZnpaiCFtwoKA1FnRURh2pLDl7Y5xqkvvja63Glfvd+WkkP4DyZAE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eilabs.com;
Received: from VI1P194MB0655.EURP194.PROD.OUTLOOK.COM (2603:10a6:800:147::21)
 by AS8P194MB1541.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:358::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Wed, 26 Oct
 2022 11:17:46 +0000
Received: from VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 ([fe80::b164:96e5:86ce:3b9f]) by VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 ([fe80::b164:96e5:86ce:3b9f%7]) with mapi id 15.20.5746.027; Wed, 26 Oct 2022
 11:17:46 +0000
Message-ID: <cc987520-d95b-01b9-5b65-53442ce122f6@eilabs.com>
Date:   Wed, 26 Oct 2022 13:17:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Martyn Welch <martyn.welch@collabora.com>,
        Haibo Chen <haibo.chen@nxp.com>, Puyou Lu <puyou.lu@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        "Peter Robinson <pbrobinson"@gmail.com,
        Nate Drude <nate.d@variscite.com>
From:   =?UTF-8?Q?Levente_R=c3=a9v=c3=a9sz?= <levente.revesz@eilabs.com>
Subject: [PATCH v2 0/6] gpio: pca953x: Add interrupt mask support for pca953x
 chips
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR08CA0175.eurprd08.prod.outlook.com
 (2603:10a6:800:d1::29) To VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:800:147::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P194MB0655:EE_|AS8P194MB1541:EE_
X-MS-Office365-Filtering-Correlation-Id: fa9511b9-7a55-402f-fa1f-08dab743b5ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8/gODpxemDOdLaQbT7GogmrydykB/Xz8gBP/zt4PW3q0ig3kKM/7GTZFBA7Irxa8TejRzdb2WQrci+mEcQl3w8Opejjz5DsUhtYz/yiShiJJFEpwc5/sxHQ0uQIjF5At7JYxXMKqaenDSV97RnD5Xk661npUxvJxoyqeNSTprsSwvAQ1Eeg8a/0lVR8rsOkul2HVHgdVLWr0tujRqXfop0cLGvQu8u7OtRg/OBKU7jOOtJ5NbR5vT6vKg6tBuHcFgwtpu8Q0N1wLF0ax41lPASAdkd4IeIp8Bg8fIhxEeQqpPxYMQi/1NAqEa7bJvu7jowL/efaRIECZUKqRiG1ESqu18n30HwXgu1Aj8j1+fji4lpORFphd6PaLOQEPnwj9GY42rP/o+KjOGIx+/mDSTL5KDvEbm6nVv2oGSUqVmkKXfSZgWaubs/DxDHHQnHe4kqWwTTu4u54NAd1PbcOJjlBVr2hgny7FpC3fH8cSI1H9EvnrzXVaMgWi5ikIG9UvMndUMuPVs9Hw46YwrtxPrwsKA+4lmSJRZ8K48ps34aLMmlProB2A48flxqVYS2a8Rzop3D3ooeSez4O/9I9RvWon4kGLiIGiTXXD4Od2xJBBz8SesSgPZK/jvLtkJ+d7roc20hmDW2TiRLyPCJr3nA91qaZ/Te9g3uthBIYWXYK1waFRlCp8RkbFXlFUAIbzrWy8ME5M4yzep+oBj606kOhfc4H6q1uyxBTUWMTyOKZ/xLcR457F41IHEWIAMmUwaBSVt9sPjQIlNEI8ulYeDY7VA0MJJNH6CV0etPw+SLB+No4d/+G2fgKGYZgxkSSa
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P194MB0655.EURP194.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(346002)(366004)(39830400003)(396003)(451199015)(2906002)(31686004)(36756003)(8936002)(41300700001)(8676002)(86362001)(110136005)(66556008)(66476007)(66946007)(66574015)(31696002)(4326008)(5660300002)(7416002)(316002)(83380400001)(921005)(6512007)(186003)(6486002)(6506007)(26005)(38100700002)(478600001)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnJQOUtTQ2JmQ0NSUEFkVW1kSHJWbTBDenZzdUlpVW5uTUFvK3RIM0xZS2Vy?=
 =?utf-8?B?MW14Z2w3RVkxaGFudjdKcS9MZDBCU3lLbWxkUUcrTFV5VGRpeGRNYnRlbDZM?=
 =?utf-8?B?TUdwM2w0SWRLOUZqdW52YmVVaEo3NEhwdkRocFZqVjlZdllXb05KYmVvdi9F?=
 =?utf-8?B?TWVMTlQ5a1crU3Z2eGUxMWZwVi9rV3BnS05VMm84c1V1KzA5ZURvNWRybkh3?=
 =?utf-8?B?R2VKNEVqdy9WQklSay85UCtsRVpYaDlQZWk1YXRYTnQwNU01NWZ3UmpUNXA1?=
 =?utf-8?B?dUFjNnlHWExvdUl2bUhMWUR0cVlLNVdqUGdEN05YRWkzS2kyTmVrQU8zTmwr?=
 =?utf-8?B?QXEwWGFsMUJoc0VmTFpGMHBEZnB4SDFNUzRhSXFTOFowZDg0U3FxMi9YeEdm?=
 =?utf-8?B?RmI3bGlaL000NG1tU3pkZlRjU1VYRDRLS2h6dWltK080ZFVuZkl2Vkg3cTZj?=
 =?utf-8?B?cG1HK3ZPNWdLTFdTWnNiOXE1QVdzeHUvelNGVWpvdVovV3VPOUJEWjdYRUkr?=
 =?utf-8?B?ODRJaDZzQ1ZKdWdEVGRTSFI0b2JQRGlNSEtSNzFmSWwxeUV5MndkcVl0YkhM?=
 =?utf-8?B?OUZOMGVZc1Rkc21MKytMTFhITXoyb3RIbFh6ZmRlOW5YWklmYWErK2ZQNUt4?=
 =?utf-8?B?Ykd6bVppNk56aU16cVgzVEg3SDIydkh1TE1HSnlheWlJYythb1BpY1I4a0Rr?=
 =?utf-8?B?UTVWZllybGs5K1hCV3dpdjRnck9remRoN1FWMDBNeVdNZlUybk1HZmNtTW5n?=
 =?utf-8?B?UytKOElTSUlHU0tUZHYxUmVndGk0dFJlT1RDZHU3RjREN2NLQ1JxYkJmbHJr?=
 =?utf-8?B?ZENNeUNwVEJBdHFoQkljbVlkSGpHOE9QSk4vbkFXYU1PaVd5enE1eFdnaysr?=
 =?utf-8?B?ZFpzNERJZnZ1NllWWktDdWtJZG55bEpGYXVUNmF0blM3ZUF2L25RNXJxMjg3?=
 =?utf-8?B?VE13QXh5VHNjSXpadVVYTUthWUlsZnN5T1BIaGs2Q3I2NXhteFgvK0VlVkFF?=
 =?utf-8?B?azNOQTlkMWpuSHJjNzJLMEUveEVEQ21yMjRHUzRaVEhkUHV2YktNaUJVZ2xT?=
 =?utf-8?B?a3YvZnhGNllJb2hqTi9wV0VpcHYrUStTZ0w1SUd1NnhZVXQ0c1p4TUZLWUcv?=
 =?utf-8?B?MjAvL3dOZkFnYVlhdE1qa3lMTUI0anlUQWtWMnQ1a3JPN1F6MCsrSS9tTC8x?=
 =?utf-8?B?cjYyL3Z2dndxRm9oYWtJOElkK09xM1J6Vkh1cVVaR0c2MGpwN2J5MlVqVUp3?=
 =?utf-8?B?L1RhWDZhWXNuR2srMEVjci9tVWRvbGpERnVwRnR0c2NJUTlIcHVBZU4wcWdN?=
 =?utf-8?B?Qmd4N0lOUTFsTmhZbjNSWkJrVGRVZFdOZGpZY2Z0VE9SU3NUWnB4S1FvWUpW?=
 =?utf-8?B?M2x0RVMyWGxZdTFzd3dEL0JSQ1NLRkwvV2I4WVVEeEh3Sit5dkwwK01jMXpx?=
 =?utf-8?B?ZEY4czJ4aXNGb1dMRHJGZnBua1AwWSt5Tmh1NEhuQjVPczYxaTQzNUYvOENl?=
 =?utf-8?B?TGVLdkl5NFNpQnJYbkNwZ05wQ1RYbnlTQmdVWEJPTnhlaGxicXozVHJuRHV5?=
 =?utf-8?B?aS8zbUhOV2phQlNhd2pTRTlwWU41aTF0MElhRzkrM2lrM3lHR3VVa2JGNCs2?=
 =?utf-8?B?ZjY2aTlBVks0V3lLUEgxQk1qbFh5TEZrTDJCa0w2MS9UcTZxWmVRaDJ5UWZC?=
 =?utf-8?B?dmY4QXhZbVFxTnk1WlBmaUl0T3o4bzV3Z3RhdHBTNFlKUnZxLzBNQ2JuNEFm?=
 =?utf-8?B?Z0VqdjBUcnlOU1RBYlhEc3VlZFlUS2pZSFY0a2VMN1R0S1MvajNhNmpVV2VN?=
 =?utf-8?B?TGNUN1lkV3RvSEVaWFZUZmZxMFpld3pZVitNS0I0SDJxVEdpRGJZYkdXQy9j?=
 =?utf-8?B?aWJNOUc1NFB5ZXVPQitvR2M2UXVrbkhBOGtsT09hT250VnhWWmQwUHVLYUtZ?=
 =?utf-8?B?amwzMFRlSEFyYzFpSXhmVDcxbFFCeFV6S3ZET0M3RzRNK0xjMk5wWVgxQUNE?=
 =?utf-8?B?bWRpZFpVUjZ2ZzJXK3l4UHZ0SnNtemdkelR4b0N6NHlmZGM0Njh6MEZFK1ls?=
 =?utf-8?B?eWdQc0hzVUMxLytiQjY5YmFIM0VROGNSYWVuM0QzUWpQNmhQeGNtaWFiR2Rx?=
 =?utf-8?B?UlZScDl6R2hUWHpTTnp1M0tHU3IxOEVhd05QTmtsNGdKZ2VRZW9wRUhLKzR6?=
 =?utf-8?B?Z1E9PQ==?=
X-OriginatorOrg: eilabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa9511b9-7a55-402f-fa1f-08dab743b5ad
X-MS-Exchange-CrossTenant-AuthSource: VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 11:17:46.5897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6ef6a9ce-c7b1-47cb-80ec-8c54be45d567
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +V9tyN48fMI+fn4S3apAVNsSwmXNPpmHvccCszJEtASJkwhnRDTXoQ7tRNb0xzXiLHgb3z7o9T/p5Kkjvmu/b2Cdam9gtLI7q0EtlE6xSkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P194MB1541
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

Some chips in the pca953x family have an interrupt mask register in
addition to the standard 4 registers:

    0: INPUT
    1: OUTPUT
    2: POLARITY
    3: CONFIGURATION
    4: INTERRUPT MASK

Chips with this register:

    - pca9505
    - pca9506
    - pca9698

The interrupt mask register defaults to all interrupts disabled, so
interrupts are unusable unless the driver sets this register.

Interrupt masking is already implemented for pcal chips. That
implementation could be extended to support this register as well.

This patch series adds support for the interrupt mask register in
mentioned pca chips.

Kind regards,
Levente

---
Changes in v2:

    1. Implemented Andy Shevchenko's suggestions.
    2. Added pca953x_is_pcal_type(), pca953x_has_interrupt() and
       pca953x_has_int_mask_reg() functions.
    3. Included Martyn Welch's suggestion.
    4. Added interrupt support for pca9698 in a new patch.

Levente Révész (6):
  gpio: pca953x: Convert PCA_TYPE from bits to number
  gpio: pca953x: Add PCAL953X as a separate chip type
  gpio: pca953x: Add helper function to check if chip has interrupts
  gpio: pca953x: Generalize interrupt mask register handling
  gpio: pca953x: Add interrupt mask support for chips with the standard
    register set
  gpio: pca953x: Enable interrupt for pca9698

 drivers/gpio/gpio-pca953x.c | 212 ++++++++++++++++++++++++------------
 1 file changed, 140 insertions(+), 72 deletions(-)

-- 
2.37.3

