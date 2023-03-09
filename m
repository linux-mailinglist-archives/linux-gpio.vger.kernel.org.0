Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7F206B2BDD
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Mar 2023 18:19:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230099AbjCIRTU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Mar 2023 12:19:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbjCIRSe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Mar 2023 12:18:34 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2062.outbound.protection.outlook.com [40.107.244.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0970160AB1
        for <linux-gpio@vger.kernel.org>; Thu,  9 Mar 2023 09:17:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2LaC4B2hygmYnBj0Qt6h8esgbWGRk2ppuwzAvKW3xsTGncTBigDP7q+eCLkhiTZzxlYgxEa6+LGXRQL2TVNTf5DvagtM+uaYzzzqdhJAOq1k22bQr29LLFgbvADw+Tpo2BHlN8l7QhS2lq+T1mhsNFcZM2R1k7ukCWu0XeN4B2z2xPOO1i7TqkiB7JbM2r7IfegXzcpCrP3tQiAzbdCpxx/RTwsrTKu4vqH5MCfl8hQNTn5yH3h5Ox45IW9kCak2/n4PfD01RUHTIewPOo7TaY0eq88ywfY0pakoPbmpjGRCa8WddcnFiSPoA3iLgXnsIhdE7mtzr+RsPFif8PVTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v3+Z7Hh5p4b7gPDwlN05bMEUM1tJsdfHTbLw28juF7k=;
 b=JojtqpJO+N1mOpJUkQ6OzMAZMZGk/hHBEzLU212YpqRIffYPwLQJZ8y/qOV3knEBdngaZZ36Wf2uZOZhpQSD8DRCUV6DK6bmjVsUJ28BpQL2ZHSAQ6sLkh5PtelDn1PeUaMo4kjXWOqAu/OFU2y3+4MiqLMs8FH+E0w0FsM7RO6lPJdjgmFLQHdCwcDLvC9jcu/9n4K6bq/WQ7LT3SaOf8gnqZIkut2mw4a7Bv2XLILKpSDgf5Q30H6A9OLTqhR5Atb4aO/qWrRYA5BU+tObXQbElPleCT7tZdDehVzvFS2KZ3fHNccMonPCLwWB83jCkTpjzbYjriNzsJEl2SYBaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v3+Z7Hh5p4b7gPDwlN05bMEUM1tJsdfHTbLw28juF7k=;
 b=MAOfuK3GS4685csT5Th/9FGuYSULGUVe64aZoKUDNzH1i6XclsF9KRNBPABz9KLCI2dGpB3QKp9ecAHd5Hhaus7iBYqalqg6gDLyEa0o+3Occ6M1DDa7Ey5YYbtrMdG+5lnFpJHykHAYp3HOyHOkbna818y8sta5hmJTMrwSWrMfbVX4Iwmbdu1fp+uqR7RE+IgaNIBnzSDXeas70e23AT6vG4ZZLlT4NHcyALcRQjCrLPOZWZ1blzHigAn33rc3en+2TGrn/X5HKrIWkYIW0rE05U0RdUtzDnuhZl1/acbWxf12BFEE+JyZVEJjw/4TTORpg5wukSkJxJvmPja0Vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB6604.namprd12.prod.outlook.com (2603:10b6:208:3a0::7)
 by MW4PR12MB6897.namprd12.prod.outlook.com (2603:10b6:303:208::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Thu, 9 Mar
 2023 17:17:00 +0000
Received: from IA1PR12MB6604.namprd12.prod.outlook.com
 ([fe80::735c:fa9:2043:279a]) by IA1PR12MB6604.namprd12.prod.outlook.com
 ([fe80::735c:fa9:2043:279a%4]) with mapi id 15.20.6156.029; Thu, 9 Mar 2023
 17:17:00 +0000
Message-ID: <be486de4-dc42-a5d0-6ca8-3fb42e93dd10@nvidia.com>
Date:   Thu, 9 Mar 2023 09:16:55 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: gpiolib of_node removal
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     andriy.shevchenko@linux.intel.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-gpio@vger.kernel.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com
References: <760827e8-6e55-177a-851e-677f54edb3a7@nvidia.com>
 <CACRpkdZHXU7mrep-SnEYQiz0MFv4EaMpsnp_Q_AuwO4-s9iRhw@mail.gmail.com>
X-Nvconfidentiality: public
From:   Dipen Patel <dipenp@nvidia.com>
In-Reply-To: <CACRpkdZHXU7mrep-SnEYQiz0MFv4EaMpsnp_Q_AuwO4-s9iRhw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0062.namprd02.prod.outlook.com
 (2603:10b6:a03:54::39) To IA1PR12MB6604.namprd12.prod.outlook.com
 (2603:10b6:208:3a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6604:EE_|MW4PR12MB6897:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c86362b-1a57-4fe2-3e7a-08db20c21810
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rDdXdOr0tN1efs0neZ9MMhE12gfkzuDAp4xHCsTJ69WZ4clk8O6VK6NMEE3DdKigF4LHTx3iHj1JH6vfsFs6ikWt6RphajEBm7nntkNhRZkby4B7og+IgwXssypPnCVmpT41V8e2CZPXgHZoz1y31qII7oiTiZxPatZNbuFIB9o6Cr99q9kC/CXo9I8ogxDMfdjTEknl3rYGGwFgMxirELcZys2R+vua9A8D0pfeZMQsrTGfK313NqpeJp9FmMKPl/1i5gRT/lthaglKMSXT8HGw3qD4bj+X/GBjhNtjt3s5EcbJ+zKPlNUtcxwEvMW6L1SpnbU6zPUX5NMH1W4wFBJzgSclhv8t9xgEXBKilbFJWQ+KtjVc8yXkmE5LBhVH976ppo/C9kzOsgH6PHfQ3oa8TOcTHBLnpQ+0mri70NTFgxpoEvWZzh2/svcgQAFZwseL4Q3yfYaB2BJmu1tvRKL2SSdjsUj34Z9oPXyiNxjc8sz2IDseoyHAVn3tBnYBmRRc7y6r89jbhYYxcJ3munoSIqQRTg3/L2QG86fay3uZbpGS8Z2LXY1Siyuta9GYJNr6y7rR5oT6WI71oZJ9CYEMrvTHxGGll3YFhYfvqfUbK9jPfRR+xQJIQr904b1KsRzdUNEQhmbYjG5tT4JVoGiVKuTEGU8tiYywb53D4QFFNOKydhteGd6APwuO7NTVqV7Me3rA3OU7eMd/wOvDx61zBzvhdG4M56AKgKOcwcQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6604.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(346002)(136003)(396003)(39860400002)(451199018)(7116003)(86362001)(31696002)(38100700002)(6666004)(41300700001)(4744005)(36756003)(4326008)(66946007)(66556008)(8936002)(2906002)(8676002)(5660300002)(6916009)(186003)(2616005)(53546011)(83380400001)(316002)(6512007)(478600001)(6486002)(6506007)(26005)(66476007)(107886003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWJncmNIajlQNEhMdTlmbXpaSm1Ub1Y3WjVSSTk1Y2MwZHM3R3VjdThqSHdx?=
 =?utf-8?B?TUduWTZscGZlK2g4VlV2ay9QWSswanNTT2lpWG1BbkxsZWZ6cTZKc1FtVlo2?=
 =?utf-8?B?NWJ3T085anc5SWp1UVFYU3RHVkljV2tSZUM0MUhNVWlCWElZZzhNeFZFUDR2?=
 =?utf-8?B?VUpNOXE1dUlXN2JaMG81blZtUHhtZ0dWR1p5Sy9Jb003Ui9MMHJLT3VCaUhz?=
 =?utf-8?B?NHhJUFozOE9EV29DaVZTV2EwSnhvZXNJeFB4R3Y5MFRQMnJJa1BlaHhkanE0?=
 =?utf-8?B?Mit5bUc3Q05UL2Fmc25wRXVJY0RvcXphNlJZMkM0Q0dRbVAxSy84cmdVTFJK?=
 =?utf-8?B?dFc4OWh1VUdWbmJseEJ2dkdWN3BJM3VRdGRhOWdJWnhieDkzQzJJL0Z4QXNl?=
 =?utf-8?B?MWxPdUFHOCtGQTVBV29RbWY0ak1zMVh5Q09NSmZCNTNXR0xDdWN0cWpabWtv?=
 =?utf-8?B?NlRuamZKMmVkMVp5ZUdiK0dvN1czL0prM1N0OVA5ZlBjNlowRVVsZTVSRFc3?=
 =?utf-8?B?a0I0ZlJWMzNpVVhWTWR6TTh1a0JTTVFNNDdjdzhOVHFuSkRPT01NWUlycTJm?=
 =?utf-8?B?TEYwT3Boc29nR1lNRTVNWjAydjN5MytJQXZpQU1sZVgybUhMY0dZR1FKTHkv?=
 =?utf-8?B?QzhuQ2dGNFNnMDlTUEVacHNhSVZ0d2ZUdkZwRktpd0hmS2JzYWNRemhVd2wx?=
 =?utf-8?B?aUVZaGI4NDFXZTBxTjRBdUlpTVM5TWVUcDFRMktRZnY3SGNodlVkYkZYTStW?=
 =?utf-8?B?Q1lHWXE5RldBQ1Q5OStxOFc0RmRLdWtQdVg0Tyt5SnVjeFNBbzJrZzBqd2ta?=
 =?utf-8?B?SEpVSTVoR1RHdHJWMVJvQ05nSTI1VGFIeW0rWkhDbWVLN3pLb2JLSzRNRndF?=
 =?utf-8?B?MU55Q2FCZ092ampmZEh6U29Yd0JTZXhGd2RxVnVBNEttTkp4RUpXWE8rQ3NM?=
 =?utf-8?B?MjJ0RWQ1NVdPdjZGdkl4YS9KV2xweXJzQ3VYc3hla3dwZEdzWTJua0VzNk1Q?=
 =?utf-8?B?MHJqa3ZVZ1d0blprN3NlVTkrWVZmeEExL0VEOWRmS2Jweko5OHo3QlFaR2Nw?=
 =?utf-8?B?YWh3VzFLZDVrWEd0YUJ5emkxRHd6WXQ1alFiVTkyMnVNQTA4TTdpN1Aza1pu?=
 =?utf-8?B?SDVOVTUvYkcxdUpUNXhXQVRtYlpUYlBjWHhZU1hLZ2RuSE5GdUwzVzkzcFdm?=
 =?utf-8?B?RXpKWG5lTmF1bHlHNS9SUE5zSEIwSVB0WVl0QnFKelRtMWdOazZFRDE0UHNB?=
 =?utf-8?B?eEExZ0g4UW1DeXpJVjREM1RJTS8xa1gyVjk2N0FxbG5CRkpvMTZzeW9nMm9U?=
 =?utf-8?B?aVlYOWFIZEw1d3NiQy9hVDRqUzhiTTVrWTVhQkE3d2d0dHFnT3BtSlNCUjM0?=
 =?utf-8?B?Z1VNbE0xdHZ3S0prMGlpSmE2Mi9mSE00Sm4vUCt3VEdOdjFoWnlWNXVzSHh5?=
 =?utf-8?B?REQrVHJPTDZDR3FoalpjYUZlbFhZbVRWN29SMFUxL1dXRXpaR0ZmTWRRazNw?=
 =?utf-8?B?enFSb2pDSU42MTByVnFkNXhxYytVemdOOVU4RWozQlV0Qmh2VmROU081NTdF?=
 =?utf-8?B?M2dxbVp3QWVyME1USTNvV05kZHRmV2F6UVJKZW0xZlJvYUFZd0FRUjlEcWRG?=
 =?utf-8?B?bHBSNkUzb3R3ZkxsTVllRFBKQ1lUczJhZ1IyR0NvRWphSlk3TkZvbVZXamJX?=
 =?utf-8?B?MkVweWJvR2k5a2xGU3B3b1BSeWR1WjhzYlJTdEZZTVZrMmZxaVJiNGoyNVVD?=
 =?utf-8?B?V2NXeUNCSG9FZkd2Mk5oOU1OVVlQWlN4Y1lyeXVnUGd2TlNmaTUrVmNhVXFl?=
 =?utf-8?B?Q0ZsN2RoMEVwRkQ0VTgzQ1FkSjBXK0tKcTBVeHR6aWo5eDhHaCtkOGVOWllB?=
 =?utf-8?B?bytUVXhia3M1a0Exa3JJYnFJQklrRkRtZ1JFdXM0WDNpZFhBTlRzelI1dWdO?=
 =?utf-8?B?aEZ4aVl1YkRoMTNqTUZPa3NhRlA5NWdaVjRGaG1ZSWxkWHZnenpGSGlvNjcz?=
 =?utf-8?B?bWJNRTJMb2ZUN3pEUkFnVC9adDlqTFNhaHdXaGxtK0hhMGx6OVN3d0JDdXFx?=
 =?utf-8?B?Y2tWTktuMkNES0xvczIzbDdUM3hZdkdkdXdJYVZzU2FuQUZhSHNaK3ozQXoz?=
 =?utf-8?Q?cToueSRvAG9NDxzfbNtFBQIyt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c86362b-1a57-4fe2-3e7a-08db20c21810
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6604.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 17:17:00.6720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LocUfbJUacaeig8iNTLH5+b7cUS9BpiXRI7+acQznil7HgYu0U4KM0QEGQBEd3aq+MeIBDxyS3AvRYh65DdrNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6897
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 3/9/23 4:42 AM, Linus Walleij wrote:
> On Thu, Mar 9, 2023 at 2:17 AM Dipen Patel <dipenp@nvidia.com> wrote:
> 
>> Should I revert that patch and add it in my next patch series or is there any other way to retrieve gpio_chip?
> 
> So what you want is a function to pass to gpiochip_find() to match
> the chip corresponding to a certain OF node. You have this:
> 
> static int tegra_get_gpiochip_from_of_node(struct gpio_chip *chip, void *data)
> {
>     return chip->of_node == data;
> }
> 
> 1) Rename this function tegra_gpiochip_match() as that is what it does.
> 
> 2) Do something like:
> 
> static int tegra_gpiochip_match(struct gpio_chip *chip, void *data)
> {
>     return chip->fwnode == of_node_to_fwnode(data);
> }
> 
> I think that should work?
> 
> Yours,
> Linus Walleij

Thanks, I believe this will work.
