Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3E5D6E9DC8
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Apr 2023 23:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231206AbjDTVWe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Apr 2023 17:22:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbjDTVWd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Apr 2023 17:22:33 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B43DC30D3
        for <linux-gpio@vger.kernel.org>; Thu, 20 Apr 2023 14:22:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dhn0DxsiQ/gDUZecRwR2g2uEj3/IZ85W8Hv/GPslshgRvND4PugHxBc3LPEenXWpgrnA2A2UL/rk9dEnkXYRFVnIYmpEKpqlT7KQpsKIUgejZGGJCELBcyfdaT982M1BqBNuNH1m10FQVgG/3i6Lyk9kXQ9eku4IOm3dftInDC8+74tiJD9SM5Sm6ISUdUo97Pxy7qVdkbeiRjQJaaBEPuI6YdTrF0qNlzOUIGjXuKu3RA379FapvdAL1A7mWzK9uKIP/ZDS/51rjvF5Jkvc2NTH7nD/lwz1mNWjZg7BMcjPQ05s4UCaUyQmTrivdJmGFZPSMB4CX1l1t3xjmi97JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZeZGMmSsoIwG07OfJR65zKvvLSbDoOkAH0ftnRX2G0=;
 b=aYE/7okT8VZynsTeZbzuU91I/hodNLq+LdCFagwiSEgFa/A8voRkJxy2DrkDEhGMU3IJ2EKD+pNUuCHZF4J5+slwxNCM6BN22dpMTz3dcjdlyTVPpd6pGJHaJv5ie/j4GcYvIceDl8ANkWX6uIy7rrRY7YN3xFahxm+JPHTXCLAjRTpgLlYmHkQyNdTTRwP976wujSFsh+2rkIzPbx+7Fi/b1sIx8bqqCafhpsrMbU7CQlirfDtb+IehTfD16Jmd8bXL3iIyxXqqAlXVVTF1erTAb6LaWLlipMCEjz/s/pOASrMoASb1xvL5y1S2umxxYPj33CCgkqLq7dbiQWd0ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZeZGMmSsoIwG07OfJR65zKvvLSbDoOkAH0ftnRX2G0=;
 b=gVzse03YSbpNL0e0DTkGwDNpGpu2XcGjACUdOuJqAe5GizeYK/rTSfbP79cIdvBjM3WitU/8QpA2iqr8JmahHGuJC0p5HrebAS0xrrE+3dJ1IxubmmQZE1Mc4UTgEO4BBBEueJn4g20bZJ+Pqf8Viz8mm3lVuHMuRsdktcqkFiUByQRGPp+YTGp+r3fzn+6pNxkoeaw/k443EZgiD4ms3iXwKFp7jp/dqIKy3Mx9knNNmio0deCHzLtbRLUFw9upZawFr4uG943tj0j7xu0rFHlMoQd6oRbt+rLneCFRRmscq4ga89GF8ct8GAszz7+BrqAoR88zSG8owoF4OI6i9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB6604.namprd12.prod.outlook.com (2603:10b6:208:3a0::7)
 by MW6PR12MB8733.namprd12.prod.outlook.com (2603:10b6:303:24c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Thu, 20 Apr
 2023 21:22:29 +0000
Received: from IA1PR12MB6604.namprd12.prod.outlook.com
 ([fe80::265:64aa:fb3e:288]) by IA1PR12MB6604.namprd12.prod.outlook.com
 ([fe80::265:64aa:fb3e:288%4]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 21:22:29 +0000
Message-ID: <dbf568ba-22a6-3936-6acd-3a6e3260d9fa@nvidia.com>
Date:   Thu, 20 Apr 2023 14:22:26 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2] hte: tegra-194: Use proper includes
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
References: <20230117084159.485234-1-linus.walleij@linaro.org>
X-Nvconfidentiality: public
From:   Dipen Patel <dipenp@nvidia.com>
In-Reply-To: <20230117084159.485234-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0147.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::32) To IA1PR12MB6604.namprd12.prod.outlook.com
 (2603:10b6:208:3a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6604:EE_|MW6PR12MB8733:EE_
X-MS-Office365-Filtering-Correlation-Id: 2096e075-6ef6-45f0-320e-08db41e55864
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IAaOfm0Q1RqH6lb2PQKehd0bkt9ZXlQ+KzOzTSR3v37cCxRFdA20NCcUZvwzrhHZ0S6YC53iOANjnMjBtlsOfNuoI9Fo3DJxUbG01aqQV9YDpbt1Mt0M6dEaBBJiwU9HTNK4mbJWcVT7JY0Jn03wNet/8VHAeE0OxHn2HRsXU/Nav3COhcz5BZOQ5BSA/YeUdHXlPxIOYrFttfNWCVSPXdmYdeLeL1UuHg7dlEjvLk+FYJ5eo6ZUuIcCmsGWCjjVgjLJTHTTIjS/RZd1DGk5jrA6YIZPcwFDgYN6IhuWLHBKc4WjEjLz3AYyR686HSrtNEGPOrQrPvE6pAsROnRwtJds74zOpSpBey2L/6IXVAPN8MoMVKUhTGv1lv1jTYV3oB7STRh9pD7nWK13kuqHpwkiHbDnJT8V8YNjAzK0e9bUGHvF8R3wFQNEhiPWNTeqj1DEqs/4UCCo3F5WRlGFA4AkeZOIQ2JJ0XRu/ancEOazbM8NEHKM+1jW/n6eTO+k1pO7+iJkIoAfHz0th7WL221Pgto7R149aHmMIypdwPeEyMt8WoCVQubtV7RyQLWfQP4g2DJ3f3MeCr7LvyE47wMphMq2RbJD/ZUNawXGHETiGu75se54XqLnOMY/yA04AaHvfiXTu7I0ruSPifdJ1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6604.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(396003)(136003)(39860400002)(376002)(451199021)(6916009)(2616005)(4326008)(66556008)(66476007)(38100700002)(478600001)(6666004)(6486002)(8936002)(8676002)(41300700001)(66946007)(316002)(31696002)(4744005)(5660300002)(2906002)(53546011)(6506007)(6512007)(26005)(31686004)(186003)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEkwdFVQeFVGOXg0MkNYSVhpcHZKYy9UNkNFQ0pvQ0cvNElLakorUC9wWSsw?=
 =?utf-8?B?NHdPaGt6Ui9aRTdvd1QzbG5hRUlHeUZYaVZzTzIvV2NIZTY5S3BWWEcrbWVI?=
 =?utf-8?B?T1ZmMExmaC81d1VNbm9zNmhRTUdKYUg5MjkxcFZIdHpGUFExZXFBZWJWM0Vj?=
 =?utf-8?B?N2h3Vkk2WnV6OHlJMDVxaisvYTQyaGJOMzIxSmRiN29rWmFGamhPRkN4Z1V6?=
 =?utf-8?B?dVl0MGpxcU10QklSb2REdVB5ZjBRWDFsWWJ5T2xnZFRTVGhRU0NxWktGZGZ2?=
 =?utf-8?B?RW9KTTVHeWp5WEE4WXdsNXJBb1g3U3YyWi9zbWRhYXdTbEQ1bVhnRTF6RVlZ?=
 =?utf-8?B?cFB0T08ya3ZITnMwR2wzQ3hsRTZ4RGFuNzAvVlBRSkhrd2xpZElwZ3o4THUw?=
 =?utf-8?B?cHNFRGViYVUwMUxsTzNkYm5nR29UV1cvcHVsQjBCSmJNN3BGUk1Tak9icmJF?=
 =?utf-8?B?d1JXeSsxcHF2aEllekljWWlQNUNNQXhuY1A4TnNCUzhTR3NkMzVPaTh2M29H?=
 =?utf-8?B?MDZHSTQzV1NVOUlXWEo1RmVBeGVIOHhsY1B6ekZBN3hNaUhWY09LME9zNXF0?=
 =?utf-8?B?Ti9tYTRib3JaOVBSb0dFYjBnajFQb0pyUmJBZUl5YW5yZE55VTJIY1padlNx?=
 =?utf-8?B?TmEvbEpTcEJUU0thVGZpK21UUWVwUHEvR2JYeURkVUovdXgzUXZLaEMwTENx?=
 =?utf-8?B?a0RhWWk2TU1TaURnanBkRi95SFQxSFJQb1pvcjhVRkVxaW12Y2xyUG10RTU5?=
 =?utf-8?B?cEVNcmYxZm82SGc5djB3dk5IazZPU2k1OFZPK0xjV1gwWHFuTTZtTGxsL0Fa?=
 =?utf-8?B?TVIxZFI4YzRaQXNYZUk4VmNsU25QR2NZK05XOUQ0ZTIwcytYOW44NHhrSTdu?=
 =?utf-8?B?alpwUC9wQWtlT2krRXovaEQ1UzVHeURBeE1uR0ZIbHNhSVJWRDZwQ3o0REJn?=
 =?utf-8?B?YlFWUUlLcWcyLzIzclJsNkFFbWRURjA3SDhRZzIvWEtVNlVTdVhVOU1lVThR?=
 =?utf-8?B?UXZMODgzTjdBSHY1SWE3bng1ZEVLaVdTVU9CRStGY1RYN1haUUdvdFJFNHp5?=
 =?utf-8?B?alBEbEpwb1BkMUZ4dERPWm44Rk5lUzBIajhON05KaWZheDh1a2JHQk9LcFJQ?=
 =?utf-8?B?QzlyaWdxTEVLVWVHbzYzdk8zODNoYisxMHErU0I0MWZEcWVOMFgvbThpMStj?=
 =?utf-8?B?UFV6ek9VelM0OWd2dmlxVzk1cm1wczV4QWxOSlpIK0FRU3JYbFBwMDlkRCtZ?=
 =?utf-8?B?eWdRYmNzcTNxWE0rVkkzYkR1K0JCY1BTUFhVQlpFRWpZSllUeXRiamwxVTRR?=
 =?utf-8?B?TUZvRTcwYnZWN0Y5UlgxdUdJZG5GYzRkbVBEVDA1RktUaExlQXdYSW1teDZS?=
 =?utf-8?B?YWkyMVJtRWY1Q3RXK2xDVHpNZVl5aktDaEhxNlc2OFcvYW5wQy9SV0ZNV2t2?=
 =?utf-8?B?N3QyQzhsMWVqQnhzdFRwemRYellZMGV6cWhSdlpuemNPMXN5Wk90NncwRFJr?=
 =?utf-8?B?SXFJWW9Xcy9DMTcwMXNGWFB2bFZENEROWk5zdTgwN2FjQWVEUDRQMHk2aEtT?=
 =?utf-8?B?YzBOdDRSK0pzWXUxSm53YjNVdVpGQ2l2Qk41MGM2dklMVmx1aVJRWjBDOS9M?=
 =?utf-8?B?Y0RaajNhWkhKWVdtQTIyRGd3ekY5WVdBeUUrTUp5aW1CaHlrQmZ1UWcrNjFL?=
 =?utf-8?B?Wk5JekJpWWN0aWs1UFhJeTVtbjJNaEtFRndDd0gzeGRGUXlnOHBVaE52Q2FD?=
 =?utf-8?B?a1hRUm9qeXVKSXhVa3U5amZNdmhTL25BQnpZM2xRd250UUtvd2xpS0w3Vitj?=
 =?utf-8?B?djVuN2hyM1FUeGxsTEJOdG9FTGRsTkdrVWxNeFM4YUNHelBBTmNaRm9vclJE?=
 =?utf-8?B?RFYrTitKL2FjLzl4bUdVS29mQVpaaitmL0NKU203Z0VHbWFNbFY5bHpPd2Nu?=
 =?utf-8?B?K0RtRkQ4OGUyMzJOM1NWYXRnS2NONGY0Y2xxekgzMWFzUVhkaGU5Y0syVlJa?=
 =?utf-8?B?YUpOVVBpVDRnUHBDNlpWOXkyS3NhT1hWZmIvWmJtUkxlNEZIRU1CS0V3Qm8x?=
 =?utf-8?B?UlpxOE00Y0xqanhZUkMzZlJWWWtRb0tGVG9zZkhsdVhmYjRWZkpVUExOMEV2?=
 =?utf-8?Q?OYr/3Eig5QFlt3CBT/IanoO8V?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2096e075-6ef6-45f0-320e-08db41e55864
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6604.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 21:22:29.1793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9mP05DypuaIom7bVG5LjAnTP4CmKpPdeCnG7dLYQiZJPw7gHtW5vdz57G+7JfZFFCPh8xxq8L3rbG2U9HtKTZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8733
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 1/17/23 12:41 AM, Linus Walleij wrote:
> The test driver uses the gpiod consumer API so include the right
> <linux/gpio/consumer.h> header. This may cause a problem with
> struct of_device_id being implcitly pulled in by the legacy
> header <linux/gpio.h> so include <linux/mod_devicetable.h>
> explicitly as well.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
I will push this patch to HTE subsystem tree...

Acked-by: Dipen Patel <dipenp@nvidia.com>

