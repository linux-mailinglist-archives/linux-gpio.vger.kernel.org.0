Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D483343C1A
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Mar 2021 09:52:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229893AbhCVIwX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Mar 2021 04:52:23 -0400
Received: from mail-eopbgr60121.outbound.protection.outlook.com ([40.107.6.121]:33521
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229840AbhCVIwS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Mar 2021 04:52:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bl9CGi+4shqISRCjNaxbwmAO5xKtpQhFKDmCk/Q9z4y74T7Tn7TDimwUxFmsAy8rfdE4oXKhC6hyJFHExYVATAxP3V5BvaicdRbbV+XIHOVWDIrbAufnB5RybWnwHn3UuK8W24D71hEc+uw865Q47kvSYCFUJpB8D1PRpPAl0qKARVuIhtdLWbam051s0FKRO3Hg72IWMXXSo4lFVH9BdDX3yG+lBJbkFuLBOwv+qRG8yf/bY608+i3evP7TdFaLkmaIYbat01fctKkK/b9YiJXjNSz/FJdtZ6Q79dMuUM0LCZiBcZ5YoHv0R6Di+WVDgVWvNHnhxC1VgBP69qnnHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qpX73LkMjcGASeZGaqsze718grfRIYMVv+SagUrrATU=;
 b=Bs+onL6Ug8Gv5nCxar6JxQVaK4gj4ECh7VwI4xn1RQz4CJC9STrVbNKoFgd2h8pEfFW1LYdwNsDEO55JqNibsK7xmt5LWF+48h36dakZ6/XbPILLC48+5GaP/KC6MM8XbLsLQEVEHi1QNilfPCf2v3J87r4tkkZlX7fsq4MU98vz4MbjkZq+3y9yLALPSNHrXAizbDqL//ty7v5yCAEjPC9S4gJR0XZgRFaGhe77lhYDnpl1YlUGcvrs60n3WXW3qLqqvo/mQnMoWu2sPXQRe3m7JL/fG4yLo8sQMFdvqFqIix87lXmBeI50RvnyEBhcdBt8EVxs+MLLkT9tbilbmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qpX73LkMjcGASeZGaqsze718grfRIYMVv+SagUrrATU=;
 b=Oh5q010p+eEHk3Ui56ceLMl3XgV19roCNSA6L4HJJuiLtDR309aQ9B9GY+LzIq2+smsfcd/K8D3LlE86ZDVhyOOBdDHS39B/DyP8VqiUzq1WBv8bv0Ytyk+f3+xk2KX+tbnvIpHdwI4HU6JvuFDcT6pNCeImSvfEtS2qcHz0eKU=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=nokia.com;
Received: from AM0PR07MB4531.eurprd07.prod.outlook.com (2603:10a6:208:6e::15)
 by AM9PR07MB7185.eurprd07.prod.outlook.com (2603:10a6:20b:2cf::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.9; Mon, 22 Mar
 2021 08:52:16 +0000
Received: from AM0PR07MB4531.eurprd07.prod.outlook.com
 ([fe80::7c49:66bd:9795:1a3f]) by AM0PR07MB4531.eurprd07.prod.outlook.com
 ([fe80::7c49:66bd:9795:1a3f%3]) with mapi id 15.20.3977.019; Mon, 22 Mar 2021
 08:52:16 +0000
Subject: Re: [PATCH] gpio: pl061: Support implementations without GPIOINTR
 line
To:     Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20210317155919.41450-1-alexander.sverdlin@nokia.com>
 <20210317155919.41450-2-alexander.sverdlin@nokia.com>
 <CACRpkdbnc2UHM8w85DjsoMKoim-pSX7-7c2YOUnUDdthNc9Vpw@mail.gmail.com>
From:   Alexander Sverdlin <alexander.sverdlin@nokia.com>
Message-ID: <5a163661-ec37-c8d0-24ce-440336e32c33@nokia.com>
Date:   Mon, 22 Mar 2021 09:52:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <CACRpkdbnc2UHM8w85DjsoMKoim-pSX7-7c2YOUnUDdthNc9Vpw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [131.228.32.167]
X-ClientProxiedBy: AM9P193CA0025.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::30) To AM0PR07MB4531.eurprd07.prod.outlook.com
 (2603:10a6:208:6e::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ulegcpsvhp1.emea.nsn-net.net (131.228.32.167) by AM9P193CA0025.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 08:52:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 57050f8b-aa10-416e-0d93-08d8ed0fcb2c
X-MS-TrafficTypeDiagnostic: AM9PR07MB7185:
X-Microsoft-Antispam-PRVS: <AM9PR07MB718500B4F870419D5CE8A01A88659@AM9PR07MB7185.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 53byVdVUs9qnDZu3vnNPohcYc8+D+f4uAwWQRZkgeKxDuyqwpoHvAvTC+tq/zTcGzWs1ros/7gpfkjZw8VUS9mU8dGEv304tC4KJv5Na3MkWiECF9C4mzKUqhddsfsKYsTSnx76Mk3wzQyFhVGNUL9zXZGnfu9j7pxvI6cyUAVh6EEuj16Du+pNv/tEO4Y2u6ZDPTsH/brop1tYKpQD15uaQ8Rd6cY+Oy2YmVk1xKF7UE2DrFGyF1M+ZgaVp+V/hMLw2nqQ8ScKkt+GcgGGFRFgYNambwq+yWcgk2caJObUqKpKG4Mckb++YDxZsErLxeE/26fnpWxpucs5KYd/VLoTngfufGYga6AovB9HNiDLOPxHpaaW3RFLByYyEbC6dECiMma+yYXKhMSPV8y0iXZppFHdhaG7HtQsp5Sao5THNuqMIoryQE6x3k1/7T5tkHE9OmTGxZLn+QSOkTAvQ5mTR3P6KCJPZTJmPFHKg3xMFbRwC5vhO4YtCwNsry4yKR4UIv5OSMWw56LxURHfl0Ta8iTOQpRi3xoPa/O3d8iwx7jalDi747zXbsjMIo3wFhHo+qJg3obx4WI7OZ07Ll6mSAuF8AmFJnVhLv9GuW9qF6w7m89kzWnNMtuLKmHVCxieApako5Kiwo5YjrH8hImelQZ08hMh7UFiV4rJEPFJZwgTCFRM6Mzs6wvsTQu1Z+TbibRE0mpwmFdmCFmyBN9opn2pUIZtVkzqzFI206Yg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB4531.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(366004)(376002)(136003)(956004)(2616005)(478600001)(38100700001)(4744005)(44832011)(8676002)(53546011)(52116002)(2906002)(5660300002)(8936002)(6512007)(6506007)(66476007)(110136005)(16526019)(54906003)(66556008)(186003)(36756003)(31696002)(26005)(66946007)(31686004)(86362001)(6486002)(4326008)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZGQ3TEJIWjZWeEFCV2E0aFFwNmY5Rk5yY3A0bm1LMmZ5VDVxaGZ2ejFrRWxR?=
 =?utf-8?B?Y3NDaEJiZTAyTjAzWmcvVDhjdVQ4TU81ellmNHRUUEJCUUNyRWJqMEJJT1Zw?=
 =?utf-8?B?YVduWUh3NG41V2RGTlp2OFFPc2wyYS8zdlBTVTMzNGVhQURJcnRFb3ZNdGUy?=
 =?utf-8?B?dEl3UkNJZ01jOFlwQXRVOUN0S2FlWlRzeHhUcko5UkZRSVpPeXVodjJPOTVr?=
 =?utf-8?B?bnVqNmdWQ2w2TWg2UGFqaEhxbnI2eTRBZkpGS1BnMnVnQlk3cFFEVW1acjlU?=
 =?utf-8?B?cU1hdlpGZnQrVnllNjdmT1VaeUdUcGNOT090SEg1RzBoQTFuZ2VzMUs1Unlo?=
 =?utf-8?B?NW54RzlJV1BRMWEwMUxyaXRjdHBFM0pqa2dwdy9iNlRMVHo0a1h1eTZPRzFP?=
 =?utf-8?B?Q3ZLMXBkK1BJbjdjUXd4NnhEeWJzK2wzTXF3WTRpcnVoK3FNbGJlS0pEZ2F4?=
 =?utf-8?B?TWF5c05ManJicjRvamdYcHlYenBFR2VIalBPQ0YxRVJ5UklxTG9tSGh2OGwy?=
 =?utf-8?B?bm1LVkNNQ3ArQVptTUtkQ0FWRXhVWEQwWVFlazVETkt3dHc0VWdrT29LTzVM?=
 =?utf-8?B?NUtoS0VwbUl0WWdNZEZEdGZGN2NDaXBvUHJqa2o3ZDUwbzF4Yi9LU09DdnBD?=
 =?utf-8?B?M3FzcXZpam1hcExEc3lmeTYxaGoyQmVjc3REN3dyUWw5WXlnS1lKS3VXSVU3?=
 =?utf-8?B?aEpXM1hoNVdtNkU0ek1JSk5idUhJb2FqU0NyRTl5SVBPeGQ3bVF2Uk8ybm5q?=
 =?utf-8?B?QjZBa24wL2t1RitKNEVjOXVXMjB3MStrT2VsT0ZuNGdlcG9GVGNMTXNmVzN3?=
 =?utf-8?B?dktkaGN1NEQ1NThCaUJCY3ZTRUpuR3o5aUhDTUpEMnQwY0tTVFYwdklaWm5T?=
 =?utf-8?B?SDE5bUk3ZnVCVmh3N3F2dENWSTNpSnpuOW1zQklFZHNWcEE0MldKeVU3d1hi?=
 =?utf-8?B?SnU1eWIzNnEyYjFNT2VJVVdtTXhiV015aTc1YlRTaUwveDZGUUtBOTc3K2tO?=
 =?utf-8?B?ZWVFcW92aEdZSDI2WXowQVgvaG5lVlFkL0k5V09PVUpJQkc0M0pTSlU3QmJt?=
 =?utf-8?B?UCtUT0JWMzczWE0yL1lOK3pubURTM1BhMlNnN2FFT0ZQRllQb0ZCckNGQ3Rj?=
 =?utf-8?B?NzArZXFwR1h3ei82UWNrSVJHVkdPL3h2aDBIY1dDSGZPc2k2VG5YKzNwOUhI?=
 =?utf-8?B?WUtSay9IemN3R0cvdzBqVkZwZXRvamxlVDdyaWxab0xpdTFVd1pIc0Y1NWFn?=
 =?utf-8?B?UDdRMmN0TUErMWVWaFE5N1hwWXhiSUhCcjEzcXM3VS9BYUo2eS9pMUtPSVN5?=
 =?utf-8?B?VWp6aHNYMzZJc1NwVGU1M1prTHV4OTZTK0lCMHpkVStUaHM0OFEyREh0QThD?=
 =?utf-8?B?d1B5UHhKUm1HbTZmZmZOU1ZPWkdBcWg5UEJua0pNNEg2ZkZyMTZmMmJvelRt?=
 =?utf-8?B?NHJQaE00WEhreTh4TU1VRmFKcGVOTVB2d0ZYS3dCVUxlU2F4bWFWdlBtNXU5?=
 =?utf-8?B?Vkd2eHkwRnFmU1NoWXJvTEhLTVlURElQcU43clA5Q3ZINUo2OEFVWWNId1J6?=
 =?utf-8?B?cXAwLzNYZVV5U2J4OEc0L2VHazRjWFFjTm9JRWkrMVJCRFd6MmdJb0YzUE1v?=
 =?utf-8?B?MGpORlRUVWkzT1lkLzVOR2tvS3pjRXdISGp5VGRRaStGMDFiYWlZZHBxbnFJ?=
 =?utf-8?B?dTk2Mld4dDl1cnVSVWNoWnF0ZnMxT3JiaFVSL2MyNGpyYjBxRFRrd0xiM2FB?=
 =?utf-8?Q?Edioj4Sxpu5l373s71y2xTiozEZZxgg1dZIzoJl?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57050f8b-aa10-416e-0d93-08d8ed0fcb2c
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB4531.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 08:52:16.3706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MNSln8/18/ER9eoVcQC0Bu/QIJN+TxKOA7MqdWooR2jAXUNFsJaAzEkwnGIXO9MqMCZL//jngt+zJjUsh9NSFbtD5RzovSWZrf2+mLK0b5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR07MB7185
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi!

On 20/03/2021 12:28, Linus Walleij wrote:
> This is starting to look right :)
> 
> But use the top-level board DT compatible to determine that
> hiearchy is needed, and implement a per-soc child_to_parent_hwirq()
> and do not attempt to get the IRQs from the device tree.

No! We have all 3 variants on the same board (without IRQs as well)!
Even AXXIA has 1-parent and 8-parent variant in the same upstream DT!

-- 
Best regards,
Alexander Sverdlin.
