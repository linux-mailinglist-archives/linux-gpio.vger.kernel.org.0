Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 779E960F930
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Oct 2022 15:36:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236101AbiJ0Ngb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Oct 2022 09:36:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232844AbiJ0Nga (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Oct 2022 09:36:30 -0400
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-eopbgr150074.outbound.protection.outlook.com [40.107.15.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80D2017F98A
        for <linux-gpio@vger.kernel.org>; Thu, 27 Oct 2022 06:36:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H195VcFtXGc7YtiSpgRNXoW51jex7bXML7R3EWUauXUBCcmeq5k68vsZaKvjPW373FFZ9q6SIilAOeNz8QosTuIfWuf7zQHGVq6KHMpE6fiInqN1a6NesYIfvQtIJTkj2S+qwCeh7kVaGVVUDvqPSDbh+ra4Rbs73yMiGTsYEHUIaTHztkAORwSGhFZD3aKHjf4K62Fu6z8LXV+guAZ5pdv7m062uPe2wQhMx4higPRqabc0BcDEXpZhGXIsul6etcih8S9dEvx7ClMEsOJpN3KCk/9ddOpkaAJNhBLuX1vpCfIPI2Tg6qJt/+t6PGdjJ7QEuOeqmUiwRaPd4nwJzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=az0pNIyVonveLwptthBMPRFjWORiCP/79mW0JPEeByA=;
 b=dNBGvELp5I1M2rtBl9Q2oAMos5vMTtfHyEEeJHm1anBbB0G2EAc8b7mM4ox/REhe7/3R9e4MIxVhb9roUZJfB8P6BYOeWbBp7DplGFOnm3MrzjLnoQS5M0RNXG5rRUNUaX4fLmDz5oImudwHoVyV7LdPdgLlXebsdZeZ0Q4FxxNan3bcosUUhHo2uthFEqmGxBv8kRMoqQPnInj7seowHgWSecYieRDP5o34Ot4jMol+pjTVCfiEIvtJ6uN52bcg9KZrK4s90pyBemUu80i6U3HLUbzo1/dAb/Zl+pLF3pvDTbwSDW69gQhGKNCC8X4EQXo8ClHlH+aOwhmo50eYIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eilabs.com; dmarc=pass action=none header.from=eilabs.com;
 dkim=pass header.d=eilabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eilabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=az0pNIyVonveLwptthBMPRFjWORiCP/79mW0JPEeByA=;
 b=PYXaNBQcU7L6IsxQ2BUarICzCVgMRyA8aFTH46Gfmd+F9XlDOV/xHPRc3zOjyZPyc2CWW0GZyjm1ECnJH1ELHgwJLIpyOfk1o/41geUaWsvBd7Qar+kV5s9NcrkKI1S1ERubF/O3Cjs2SfBXysfRCqG+C8KQWZNXojn/PdKxX6k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eilabs.com;
Received: from VI1P194MB0655.EURP194.PROD.OUTLOOK.COM (2603:10a6:800:147::21)
 by AS2P194MB1936.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:553::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Thu, 27 Oct
 2022 13:36:27 +0000
Received: from VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 ([fe80::b164:96e5:86ce:3b9f]) by VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 ([fe80::b164:96e5:86ce:3b9f%9]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 13:36:27 +0000
Message-ID: <8b94b5a6-fac8-5087-b4da-ddba098d2265@eilabs.com>
Date:   Thu, 27 Oct 2022 15:36:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 2/6] gpio: pca953x: Add PCAL953X as a separate chip
 type
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Martyn Welch <martyn.welch@collabora.com>,
        Haibo Chen <haibo.chen@nxp.com>, Puyou Lu <puyou.lu@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Nate Drude <nate.d@variscite.com>, linux-gpio@vger.kernel.org
References: <cc987520-d95b-01b9-5b65-53442ce122f6@eilabs.com>
 <9bdc962c-1cfe-8240-963c-491f3992b2cb@eilabs.com>
 <Y1luUgS25ddeSCT9@smile.fi.intel.com>
From:   =?UTF-8?Q?Levente_R=c3=a9v=c3=a9sz?= <levente.revesz@eilabs.com>
In-Reply-To: <Y1luUgS25ddeSCT9@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0200.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::21) To VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:800:147::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P194MB0655:EE_|AS2P194MB1936:EE_
X-MS-Office365-Filtering-Correlation-Id: 05260c21-8c54-4e20-f377-08dab8203f9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GAz9sgt6HqvRk7tOTt+dBhU2sC+/a1sU1cK3F4T80wPbsjZAtXYqFcSCNU2EzIwFUEd1hzTWseMew0cZ+Nmf3+SyyXwYCaGjO62Ggcyl+e6kw/Ggv62VK8zjq74w8QI9rJw7B6PFHId4ce2+ZnGdtFawaTQCtYTTy5DyAeTsZi0h1pI3OD3In+bI+LFHwSpVJTE7TujEiVWHZnoBmIBBpMx075mGFpj6cHcFJ4SgDC80fnO1ywhp+tGkmdJy+UviW3GzRPyw1wgiEYmbmgFTXzBKQi9Hvgy1Hz7kkv5e2J56rXjZqI9ro1XwFp8Q7umlXb0dNxo4KIg8C45FmwM0Yt0rfcQwAzx9iEwOHHswFCcpZPPzqW7Pw+TOTllKBN3PX2cSkb1cm5LaQwees+OP0cBcVq97GBlv+xI4iluGU9lBgtgopoyuRx6uuj+HSMonG30uThPdCnLsUBIa39yzu5hWww9ACZwd4CyKoB0rBLZqSeV1vAl4KQdOsjWP8xyxrQD51mIAgy5yf5Gsg6TC+vh4p9JMLD3YS4T3CY+brE9pBZFjEmqWfYx5VW75Itg2Idy4QVBN01q41xV+G9G0FkvhFrlsTKsnkFxlDR91uOqKoj3kfF1qBA6lvRmpzhaEkXOl0f6bGMVd43JmqDd7YprvxwJ/MKFXv2ZUSBIE3c5KVBkwaP3HPfuWtiWP0A0+ABZ5WmPWIQM1JprjROfYnPxL2ThOr6AozT//BudspQCsJXAaRgW9BraoCOVuQ0zcijdxsbryjy3f2xrEfhuATzppBJCIfZ64T0azX1SOw5s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P194MB0655.EURP194.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(346002)(136003)(39830400003)(376002)(451199015)(316002)(26005)(31686004)(6512007)(36756003)(6506007)(31696002)(86362001)(2616005)(2906002)(38100700002)(186003)(4326008)(66946007)(66476007)(6486002)(8676002)(6916009)(66556008)(54906003)(8936002)(478600001)(7416002)(41300700001)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UktXeGZOK2pBdUlrazNjWGQyVjdwVmpkVVdNZHQwK292dXZYL1MxeDFHcEJN?=
 =?utf-8?B?K1hmYVVoUzR6TFZLV214WW9EMHFKdnFZdGNIT2VYS2xJMXNtOE90STFGcVNZ?=
 =?utf-8?B?NVN2cVI3SXRyTjUwa2JVVkgzc3NkRWJYVmU2a2xFYnJGSklTazVUSEQvODJY?=
 =?utf-8?B?eWdyTFV0ckNqeWFFWk85WE1uUEZhaVJCMVVUeUVIS0o3cXAydzZDdzUzTEJk?=
 =?utf-8?B?VHhOUFBwdGI3L2lWbmFmOTJ5OTBkeW02QlAzbjd0T2NIS1FPSGFGcE12dVdU?=
 =?utf-8?B?akNoRzRIS3VKR0xXM0pvUGJCRENoM1J5UWNlTFJlNkUrZEl4b3FMMFhRRVVi?=
 =?utf-8?B?U0xtT2NuOFBUNlIyS1QvNTZhSHFlUFJ5Qzk1eGcvZjVoYVBnQnRObFBLY0tI?=
 =?utf-8?B?STRxSjAvVnhLTE0zSWJJaWlFdUlJeTNjdTdQM0VJMlNkV2dJdUo2aUh6TDkr?=
 =?utf-8?B?MWg4dkQ3Vll6a092OTNDWWJiUmMwb2VxampWWTd6aGF5Mmw2eTd2Ti8zSEtN?=
 =?utf-8?B?eEVTa3dZMVZoT3hWaU9UTmd5WGJsQjkrRG1yMStkRkx3Q0pGWlFFSDZoc1gz?=
 =?utf-8?B?cndNNk9rOTlEak5oTzg5UGZLanp3U0pMeVpQbDFpa3RMNmR6ci8zUWFxU0Rz?=
 =?utf-8?B?QVdXWkYreHF4aXNBY3JLNEl1QWxvb3FFbTdpNVpPbkpXSEY0OEMxSDBReTBL?=
 =?utf-8?B?Z0lKY2hTUkU5aERDNFVkZ21MYzh0eDR6VXkzUVZMVXZsVlVOelYyT2RuZVJX?=
 =?utf-8?B?MTVaOXloYWdnRzNheXB5NjBtdHBLUGY2TU9HOUkrejNPS0diSjU5TGtKZFVH?=
 =?utf-8?B?Tm1NT0V1clo5VEk4T3E4dWdjTWF0My9oWlk3R3p6WlpOMCt3Y3V2TkFndnI4?=
 =?utf-8?B?dHoxYjFkVDB0WHV1M1ZZVllkMHF3WHlpUnowTUY1WnRjMjBwb0hjVlpOVmFN?=
 =?utf-8?B?UFF5ck1Yek1PRWRFWUc1NkhEWmJjWFNOUnRZR0RCWEticUVDZ1NYMVFKOEFo?=
 =?utf-8?B?aTBFd1BOTm5Qek1oY282ekxMTlpoTTRPRGZoREpmZC9tN3Nka2FPa0tNQVBt?=
 =?utf-8?B?YW4wNE44Q0ZWemhucmJPcWNiY0dLR1VkTXBXZEdhSnRCSFhLR1h4MG9oQU94?=
 =?utf-8?B?aXVlR1BmS2k1bW1ZZzZIL0dlWlNvbnVFa1RBcmlYTGJIa0FxcGVQanJYSEtt?=
 =?utf-8?B?YUZOdnJhNEI5SUNOWmEwZFMwcmJSRS9CanBOSHNvKzZZYzhVK1JXWHlsdSt6?=
 =?utf-8?B?OEtlcEwvVUFlYzA0bEhVbjl2S0pZSVJjNnBLWmdLd3haQ05oU0ZuY1ZYQ2x4?=
 =?utf-8?B?bkFCcjFEdkR3QTNoYXhXVnV6Yk1iVUFMbXZxTHBja3BsaVZ6aDVyUEdkZXRH?=
 =?utf-8?B?QVZpSEw1L0VnUGhiTTFMMEQ0enFOb08ydS9ROVMzYWRoRWdUQ2lJYW1qUTBR?=
 =?utf-8?B?M214VmRnYm5wbEhCM2Zrek5QRVpDYjl0Q1Nzd2VTVjNNSlplOFBuM3ROSUJn?=
 =?utf-8?B?VzUzQ1JOMkdSNWVwaE4wZ2NvNEZyTk1PNkYxSGJDVHVIWm0rUWVpNHZ2a09m?=
 =?utf-8?B?eWdjWEU3dkNmK3ltTlY1a1NiUDlGdWxlODZwbXpEODdpSmJTY0o1T3VtL2dx?=
 =?utf-8?B?eEw1N1VtUDZYQktGbi9pbk9FTkNnR1lQdERGa1phNjAzVVg1Z3pmeG9qcEJq?=
 =?utf-8?B?NUtwOVdCcUczYXF3YXdsdnUxZjc4QTBMb3FJT3FNT2ZBZ0FKd091bVYvZnZO?=
 =?utf-8?B?UHVFVDNiZnFwT09qUVJMaFBKNk5ZdGc2TGpKMnBLZDlyNytneGNmbHlvdDlp?=
 =?utf-8?B?MGYxcWdZelVkRHJHcWpFMjhHUjNHd2dXMm11ZWNvOGFqcmowdGRoZjZ1Y1Uz?=
 =?utf-8?B?K1lEQS9RSXZyQzRHYjlTZktsOTkzcGpjcEh3Q1I0TjRVTTJyNFlESWxrZkpa?=
 =?utf-8?B?eVZ0Y1VndTFxRC8vcEIzRTRpTjJVN2psRlQ4aHJjQ1JGelpJeVZIZ3JTc0l6?=
 =?utf-8?B?RHJhQTZOQ0ZWNjdWdmJsUUhkZU1EazZPejZlL0dKbzAzZ2E2dkJJWjZ5QTFs?=
 =?utf-8?B?OFJBbElSOHhqT0RjdkgzSklJSFptWXpEek1KWURwbnE1L2tkMHpWRkQvY3Qr?=
 =?utf-8?B?R0dPY1JReWlmN2VGa0hmUUtvSG93aGlOTjF5T0FrclJJM3o4a3pVdEt3OGRq?=
 =?utf-8?B?ekE9PQ==?=
X-OriginatorOrg: eilabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05260c21-8c54-4e20-f377-08dab8203f9b
X-MS-Exchange-CrossTenant-AuthSource: VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 13:36:27.2933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6ef6a9ce-c7b1-47cb-80ec-8c54be45d567
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x1WLULaAiGKwPy1IXYMkG6G+9ph+PxZ9OgrQl/YkrxQ7ua3B72AuaPtdftsK0zs1xnEyUvvGys/0EpuAZnzrw3WN4sF09aYZqy5irZCy3LY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P194MB1936
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thank you for your guidance, it is much appreciated.

On Wed, 26 Oct, 2022 at 17:29:17 +0000, Andy Shevchenko wrote:
> Looking at this again, why not to make PCAL bit as a part of the type,
> so you will have the check below much easier, like masking for PCAL bit
> and that's it.

On Wed, 26 Oct, 2022 at 17:32:03 +0000, Andy Shevchenko wrote:
> Consider avoiding the change of the ID tables in almost every patch you
> have. This can be achiever by carefully allocating bits for types and
> define the actual HW via bit ORed masks.

If I understand this correctly, this should be a sufficient solution:

 #define PCA_PCAL		BIT(9)
 #define PCA_TYPE_MASK		GENMASK(15, 12)
-#define PCA_CHIP_TYPE(x)	((x) & PCA_TYPE_MASK)
+#define PCA_CHIP_TYPE(x)	(((x) & PCA_TYPE_MASK) >> 11 | ((x) & PCA_PCAL) >> 9)
+#define PCA_SET_TYPE(x)	((x) << 11 & PCA_TYPE_MASK | (x) << 9 & PCA_PCAL)

Use 5 bits to encode chip type: bit 15..12 and bit 9.

PCA_SET_TYPE() shifts bits of the TYPE to the correct positions in the id.
PCA_CHIP_TYPE() gathers the bits from the ID to form a nice decimal number.

-#define PCA953X_TYPE		BIT(12)
-#define PCA957X_TYPE		BIT(13)
-#define PCAL653X_TYPE		BIT(14)
+#define PCA953X_TYPE		2
+#define PCA953XM_TYPE		6
+#define PCAL953X_TYPE		3
+#define PCAL653X_TYPE		9
+#define PCA957X_TYPE		4

Types are decimal numbers. Values are carefully chosen to leave existing
IDs unchanged.

    * 2 instead of            BIT(12), ID mask remains 0b0001'0000'0000'0000
    * 4 instead of            BIT(13), ID mask remains 0b0010'0000'0000'0000
    * 9 instead of BIT(14) | PCA_PCAL, ID mask remains 0b0100'0010'0000'0000
    * 3 instead of BIT(12) | PCA_PCAL, ID mask remains 0b0001'0010'0000'0000

PCAL chips have odd IDs, which means the PCA_PCAL bit will be set.

It seems more natural now to have a separate type, PCA953XM_TYPE for pca9505,
pca9506 and pca9698 with the [M]ask register. Only PCA953X type chips can have
this register anyway.

What do you think?

---
Best Regards,
Levente
