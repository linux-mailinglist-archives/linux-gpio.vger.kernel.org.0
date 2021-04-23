Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56F9736962F
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Apr 2021 17:32:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242623AbhDWPc7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Apr 2021 11:32:59 -0400
Received: from mail-eopbgr40129.outbound.protection.outlook.com ([40.107.4.129]:23523
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230294AbhDWPc4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 23 Apr 2021 11:32:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QhYQlqXvsHx9CqaryV/XLVMLDA5xr4ll7qx0aifYn7J9PIUevCKHZ8KkoFTFFOWXpviLqop0THZkzY2kEJKh9hi8N/+6xuY1XXiRAukcUxxRxuoahfuiShLyOr+jF6tcqBV8HEvxYLfJYy6T/5BOyTVsiIu3lfINVSTQNhKjow+PDCoKqdGE5H8zcgafGAzCni8V2ntNxmbyqGlUbJLoJxnwz+feV/fESLZvaGrn+3qkV/x0oQRVMbfyDNMtJj0Wje0VJQfeWMZU1JykdgMoPiztc0MhuaAe9CUlkHCs7Meu4o0CrQpbe4n6FxtGzIxa6iSR5f5eMe7sbLngxkaTuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPhDBxeXNCkgHVSNNkjBctvh2lue06AqyMLQBfO93As=;
 b=ASOvWpfppbn8FBm8z5reTjfXQxo0BwQwT8W17a0GPiSSDH/cn6skTW5rfAaHKkepxD50gsL4qJV0OHUaLW/uSfsjNSyk+BjbE/UPcgeR3l12+FCBff44TZ3TG8p73/dUjWqJY7fEfPVnQHcN35a2nP7sENepuLGoRtFwBPlR073ttORjl3IFwv7eLtiNlFJe/lCY9pom3ZV5CzXoTYebNMzk/1qYR7KBa5aZxSTQPoV7Z8LnsOg/5NouCHplrDDOpIsEiA1GHl8n2CxwU45qEYSPpGWqTaS7zsez6Wx6c79AC+O/9WbB49o6Hir2MKt4iu/DWauqwHi7Gf5dYgCBHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPhDBxeXNCkgHVSNNkjBctvh2lue06AqyMLQBfO93As=;
 b=kDLs7susjhf3ZmQSWhYK0RlTI6b2VbNCyhfzaLNSRmtu3VzTw4AGp9DIIJ6hxhboSXCUK+L5omlUyi8pTzHG5VVEowVw8NYk8049OKeklpFcif4icrO3nno3EsxXQpbqD/aR/LGWVSKjNO2zgHWGBv4qEzg3fHYZPIc7d5EomYM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB7PR02MB4790.eurprd02.prod.outlook.com (2603:10a6:10:53::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Fri, 23 Apr
 2021 15:32:17 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::d47d:ca8c:4fe6:3908]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::d47d:ca8c:4fe6:3908%3]) with mapi id 15.20.4065.020; Fri, 23 Apr 2021
 15:32:17 +0000
To:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Subject: Request an output line, without modifying the value
Message-ID: <6e26b4e5-277b-459f-29e7-7eb7e949e6a5@axentia.se>
Date:   Fri, 23 Apr 2021 17:32:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
Content-Type: text/plain; charset=utf-8
Content-Language: sv-SE
Content-Transfer-Encoding: 7bit
X-Originating-IP: [85.229.94.233]
X-ClientProxiedBy: HE1PR0301CA0013.eurprd03.prod.outlook.com
 (2603:10a6:3:76::23) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.229.94.233) by HE1PR0301CA0013.eurprd03.prod.outlook.com (2603:10a6:3:76::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend Transport; Fri, 23 Apr 2021 15:32:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7156191f-4e4a-4e10-41be-08d9066cfa4b
X-MS-TrafficTypeDiagnostic: DB7PR02MB4790:
X-Microsoft-Antispam-PRVS: <DB7PR02MB47909FF11A01EB82EBE8636FBC459@DB7PR02MB4790.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jANmQfcTD7iutyj5++tXJVMx9IKoJADmytgIjiMq33TjjP3nBG/xn1ZpjS2TWAgOjGfxlhBEUbV341pCJ8AYdnEBQ2oT0p5cqnxbfq2DA6X0Gm72UECAYLPoBIj4x03mrO+YBPl8ViPSgyNdySKBMxSV2szrkDkSsL0P/V81hqUoe+NtuI77IASccNTVH8nIB15zM73ODKcskwypGpUysTwj8+mu3oBkqRBaTBs3kHEpCnknLWhvA6y0dcQbvMhaCiFEAOjaAqsPEPODnjCe0pdWmUtmeG347sE5o0QMlC5AWG/G3rAA7l7mgx4oLaJnfjpe9x/WGgrBIQtc6qYPdOXx/u3WyoKlwWh2n0XeKRcnPSLvDqorYPkVFlKEJnR0+r63a+n+0/gFMqoxuXm9O3BeVqRP0ArPrsjSmMsa3NTBynuOYJONqsPaSjPhNqfLbfBqwfDq8HjLttQ75HUi7vCcRqAcbfmmF3eU9/7stHBPPsZlbh1ndmGwZFplOcsO5VCkJ+BhqUEDu275AKfGK4nZGnzadKsp88Xl5efge4BMpwCRvLb8y0RJrUylA+xHUyclZm/jtDz1JXTKuXusoolLr1Oi5LvByaszfyxS0f3lAws0yndWoHCGcyzV8+cHcFhBAEXnK2wVJTO3KVuklgi0s/a1C+EUvUTNeqt1Rgb0VXIlQFcAZVewjcRia6J7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(39830400003)(376002)(366004)(346002)(956004)(16576012)(66556008)(38100700002)(36916002)(66476007)(66946007)(31696002)(83380400001)(8936002)(36756003)(2616005)(316002)(478600001)(6486002)(6916009)(26005)(5660300002)(8676002)(558084003)(86362001)(31686004)(2906002)(16526019)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RW4xVU91RzE3QXpXZ1ZYaGw2ZFBVSlEwNWVKTkhrRmVLLzlCZWxaUGpOR2ox?=
 =?utf-8?B?bEJHZUl0TDdENzhGTGpUMXdiYnd4M2I5cjl5YjlDdHgrRmNxWktpUCt2SWhC?=
 =?utf-8?B?QnNqR1Y4ZHNaeEhRcTJPVzN2azBJT0wvcS93bnMzTGRLbFdRQUVKZFNZbGtE?=
 =?utf-8?B?WktUS09OYm1DN2hLTk14cUZMdit2STNiYjMycjlPT2NiYWduV1dISFBxTzIy?=
 =?utf-8?B?bjlRQjNvK0hqdGNpT1R4ZTFVa2ZFUFVqMGRMM3JWOXJ0aE9WRE9RanBsdERu?=
 =?utf-8?B?YjVSVzVqZlpFSFZFVXNzeHNYVjl6M0tMRDBDdTRaZENzUkpicTBRaW9mK3pi?=
 =?utf-8?B?NHpiZTN5Ym5FQ3l3SGpLdjNqcU94c2tITGxFMENMV3AxMWUyZmdlZ0c2eEg2?=
 =?utf-8?B?QWIrUjNyL2pocGNqSElsL0VCbFFoeC85SUpYTWhLcTdHZHZsdEp4N1Y0L3hv?=
 =?utf-8?B?NEwwVzhzelhlSWFtQ3dCREhoeEU2L2JlaDZOWEpDZ0hXcnUrQW5lUFVpOTBB?=
 =?utf-8?B?ZW1BalROYWVXYTBSZHZqUVBYRFNTVSt5N3owVExvOWxreVNISk43Z2taalFo?=
 =?utf-8?B?RVRaYXZDZTZ0TTdHb1BReWIvYUlXTXYwUWhybzFpYTBZTjIxWjhLalRVUXhq?=
 =?utf-8?B?QXVCaFJpK2tUZDlKM2sweU1VdHRiZkJwRWNJSDl6anVadENXOE1BcGw2dVo2?=
 =?utf-8?B?U0RqZVRNRG5abWJTZTc3a0hCQWFYLzYwNGladFdRcTloYVFkbXc0UDVXclY0?=
 =?utf-8?B?VVpBdzFROEFJMmlQNTUyNStTWVloR2V1SmNGaHhxaTI4akQvZlBJRUZkUXpP?=
 =?utf-8?B?MmlwRHREQmdlRFllK1ZIRC9wY2xSdTBteHdlaFhDQ3h0OWJJOEtERVZxVDNk?=
 =?utf-8?B?b1czeG44ZGNWSitVdXdsSUcyQlVLcGg5ZEVJeDN6VnpYeVFteHhFZER4alls?=
 =?utf-8?B?Nk9FSFlhaVoyK21tTGYyREppSGZ2WExtOTg1bjlHc0Ztam0va0N3RUxtblQv?=
 =?utf-8?B?cGVDbVFuTVFrTmpxY216MWxRSldqMU5NV1kyTU5JZGdWMGJjZ1h4TmJyWjJZ?=
 =?utf-8?B?RWFBMUpBTkgzZ2ZXNHlEanRHcEFUbnhxdW1HWlliSzlzSm5MaVpONGJaZ252?=
 =?utf-8?B?SzJyQ0lqbjQ2NDdKMSt0M0ROclVsS0ZUYjZmT3lsU3BZWlVYMmRqYTFzcnp0?=
 =?utf-8?B?NkdiWGw0ZW0rbEpqMHpKNHEvZTlHVm8zZDZMZ1pLMkl2c2RvM0RXenlacVo0?=
 =?utf-8?B?M1NoY2VlWk1wNFBzbjJwS1JMbXdBQk4yQVM5Rmk1b3dkWTJNeWY2cDRqcURi?=
 =?utf-8?B?Q0RGWjJSMVlwZmx4bU5tWUxocUNDOTZKVXd1WXA5eXhjMXR0UDBCYWJzeVN0?=
 =?utf-8?B?amZxVmtnOXpQS1o5Y0VMUk1abXRYZnpUSmJLR2R6emxWQVkyZjNtaEc5djJt?=
 =?utf-8?B?RG5OM2hNOWZvSnJUdlprdjdtUDZPeDZJMGdDMGxkc0dNVkNybzBVb1hSdzBj?=
 =?utf-8?B?SDgyUHJmWnNDTHRVKzlmSlBjek1NNTZnc3RsWXhwTjhMRlZ1ZnFFS09GaFE3?=
 =?utf-8?B?WUdtVWRnUkdQMDhNcTFQcDhFR1I0cGp0ZjliblUxdncxUHA2STJBVGFaaEJl?=
 =?utf-8?B?RTFkUkN3WldVRis4U3QwUHphVm44SFdab3FTcS9pZHE0aTZJeXZHQ0NBSjg1?=
 =?utf-8?B?bi9zTUVvSVRRRmpYQ0JzcHc1SU0xQVc2L1phaXJibmJORmVRcTY0V2FlM0pj?=
 =?utf-8?Q?eBJf7W66Z2ZiAGVBEVBZ/I7hhmYelh8I5fVNt08?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 7156191f-4e4a-4e10-41be-08d9066cfa4b
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 15:32:17.6265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mF7yHn/OlT4mSKkdknKLVSyo5aMizMq3VMUVn2dgoXrBoMbnGo45lO9ADaUhuPQH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR02MB4790
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi!

I'm wondering if there is a way to request an output line using
libgpiod without clobbering the previous value. I would like for
an application to take a peek at this previous value of an output
gpio and behave slightly different for 0/1.

Cheers,
Peter
