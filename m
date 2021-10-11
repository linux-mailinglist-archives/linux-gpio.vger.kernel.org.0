Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D15F54298B5
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Oct 2021 23:14:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235209AbhJKVQH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Oct 2021 17:16:07 -0400
Received: from mail-bn8nam12on2041.outbound.protection.outlook.com ([40.107.237.41]:28512
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231994AbhJKVQG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 11 Oct 2021 17:16:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bcjcGjs47Ov++9m1tWtmuTCzICHdqdyQ516E0yaXWWX0O8LWUa249Tr3BdqnXNdhpEXCIwRQVH6kWnW67CYccAnikIjimWl/WFpP7x/AqxBuOyRtqw27v/wEr/38xmsiFy2pySYpzdMQ5kXa/sI3qKvIIpq/0uyAOBdutSX2iOqkUP8XMn4Bdf196wPD1kilnR4G3jeTw+xWVNTD4+Oq8MhlSkAJZ+WELX/73mdp6AZSgDBkEk93KLzF4daqA8DmjxSEH5bv525d4SRrtoKRs4uM76NpyOJsTlhOWXQ0KetE0WpjSA4Xdt4J0qLIycH8dhs7NdS8GjkSHYBJFn2JQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1sX5ZNpazDg+CYt7/hc1vcoxwrYj2TnDJfSpll5Y5rA=;
 b=giHYGj7i+f1HZuQqVAJyfFoSVgVtePkbtJ8CFO9sxn6RLtkg6HaGS/ICB1iV5LAzab7TFom9nLPyV7/FgeIQbq7+Ki64pAakrCjsuXDCubSKraix6UTBlBfHcN0GG57OFq8MwJ915+rfMC6bN50qGmu9Gqn7NEFj9h2oCJ0SiazGS0RxT2KsgbNijcn2SRu7OEhsWBQbNzFcf7LCZHY8Ac1hFxwydyndtZD3aKym/aCiDV7vo/tUwIVABrZ1pMTMzeb/obwT9HDCqUKk8wjjBQLx6bTq5Y9zke7HMX9cU7nWmqoaNA+JAFYTfn7pVboZK+gyYytpyxuqybSS9Bo/2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1sX5ZNpazDg+CYt7/hc1vcoxwrYj2TnDJfSpll5Y5rA=;
 b=qxfimY30DfFRnoJkexpezwKQ74IJrC7L1FCxSHJmphxnD6bDeevN6IL2clCYbb5hefXpxzN4k5TQaWv4h18c4AOY8LgKwfC7zz252JUsfx3ujVQXAM4C8Gxv2qBAMBLeaZfZSIhG9rBVms12mJnQwpKi+Lzce4bF6kESFn4DfDBErqeqhiEOA9w9g27h9itO6LGMsSH2HfO1rx+PGZsr8IWo3S2vdl/BWv3B160grJLrIA7iWvc1DZGP+DbR3TVp0hhL4Hhsn1+D5+nYMSNKpxe6jYx3oxXU/WHvRejZmdfixtR/CBoMoo0hcZ6bXczwhmpqeJ2zIUlgE466Cl49PQ==
Received: from BN9P221CA0008.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::30)
 by DM5PR12MB2488.namprd12.prod.outlook.com (2603:10b6:4:b5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Mon, 11 Oct
 2021 21:14:04 +0000
Received: from BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10a:cafe::ac) by BN9P221CA0008.outlook.office365.com
 (2603:10b6:408:10a::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Mon, 11 Oct 2021 21:14:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT022.mail.protection.outlook.com (10.13.176.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 21:14:03 +0000
Received: from [172.17.173.69] (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 11 Oct
 2021 21:14:02 +0000
Subject: Re: [RFC PATCH v1 00/20] Review Request: Add support for Intel PMC
To:     Linus Walleij <linus.walleij@linaro.org>,
        "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>
CC:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Saha, Tamal" <tamal.saha@intel.com>, <bala.senthil@intel.com>
References: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
 <CACRpkdZEp0FZOefBPP_sR4g6rKzeKQhpdL-XHYO+CRt5MfTrYg@mail.gmail.com>
X-Nvconfidentiality: public
From:   Dipen Patel <dipenp@nvidia.com>
Message-ID: <f5f97c30-2b4e-2490-2197-1d5a108992d1@nvidia.com>
Date:   Mon, 11 Oct 2021 14:14:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdZEp0FZOefBPP_sR4g6rKzeKQhpdL-XHYO+CRt5MfTrYg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 618fba30-ef3b-43f4-c81b-08d98cfc0dc1
X-MS-TrafficTypeDiagnostic: DM5PR12MB2488:
X-Microsoft-Antispam-PRVS: <DM5PR12MB2488D123D9124418CFAFBE08AEB59@DM5PR12MB2488.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l6mlhXK+B3rqq9pkgNpgmopOaT/5Kwy1zfZAhb3LIPDyvf43jqQDxeD9YtVz/6Ki3EQ1fiHzpnO6xcKannQ0E65X3wD6YQnoJLYhbOwU497ZJQOslpChI0zIUs+DVTDcQs5p7J9n1/etd14SqCuwXtU5HkF0UHm3W/QQNG2bQb7X0J4+ruBQyJ2e+wldtGEAobUWPUj8zkhcC7ZdrSUahG3NSl6BQaPuHrPqXH9BzEn4pMe1j+HSFZhACFpodSq9FDquKCEkmRIcR0ZrdaSmo3ChFcjJ5T8ZdIK91sEBqNVvr6KJT3Zey2/lo7rMl8WbpkKjn3uUzZSCfhB0loKosuTH0RO9qyk2u9KaV4RHAdlGxYm1UfekDBx4n7f8xyMvgbmD0usiKU1N8/TTKxliR2nQQSz5bAKepJCw5ZSE6ltZ4uww452DbHjL+zM4gnrYczPJR2MvJPqYIrYQr803FbAUu0/BB+yiGW686rD98edVwGaU95Ht8T8RWiVuK7HpXnPoGc0HwwNVZtgDfrXwcr+POrXFukkubUCZpceEpUbxq5m3tuMoyTVA0EzNQSvHmQoq13QjWOvd2mlZ36bbGEVSKuvg1yZOgFSYrUANCJV2dhD8goyN8U1aE36ZopUGtRWm+hLXxrEsZ445KOh8PeuYmd4ASTeyHXHJI+cMf97uB0As/omXHyeWdW7uUjGIYhp2ch0XKKP+hRe37suSvexgCBniOSZK+ttJzmGVAFPRv2PVX9sCJIkY5ncRVVYSLSK5eJ9SeMVyQKLDLh5Ywt/Z06cWN3dFPcGf/J1kBXreHM6Gy/w1HX8LtGyzsi/yS+EW65nSvmC+2KAMU4hWl0k7KbQDLSUTLXNAgL2yQFk=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(82310400003)(83380400001)(336012)(8676002)(16576012)(31686004)(7636003)(6666004)(966005)(5660300002)(36860700001)(186003)(16526019)(316002)(86362001)(508600001)(426003)(110136005)(70206006)(36756003)(31696002)(2906002)(70586007)(356005)(2616005)(26005)(47076005)(54906003)(8936002)(53546011)(4326008)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 21:14:03.8467
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 618fba30-ef3b-43f4-c81b-08d98cfc0dc1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2488
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thanks Linus for referring. I will take a look.

@Sowjanya: I have recently sent out the RFC v2 of the HTE (https://patchwork.ozlabs.org/project/linux-tegra/list/?series=264896).

Please have a look and see if you can add TIO as one of the provider. That patch has necessary GPIOLIB and GPIO-CDEV changes

which can help userspace and in kernel driver retrieve GPIO realtime timestamps.


Best,

Dipen Patel

On 9/16/21 2:21 PM, Linus Walleij wrote:
> Hi Sowjanya,
>
> thanks for your patches!
>
> On Tue, Aug 24, 2021 at 6:48 PM <lakshmi.sowjanya.d@intel.com> wrote:
>
>> From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
>>
>> Starting with Intel(R) Tiger Lake and Elkhart Lake platforms the PMC
>> hardware adds the Timed I/O hardware interface.
>>
>> The Timed I/O hardware implements some functionality similar to GPIO
>> with added timing logic that is driven by the Always Running Timer
>> (ART).
>>
>> The Timed I/O Hardware implement 3 basic functions:
>>   * Input Timestamping
>>   * Single Shot Timed Output
>>   * Periodic Timed Output
>>
>>  Please help to review the changes.
> This looks very similar to the usecase proposed for the HTE
> Hardware Timestamping Engine, proposed by Dipen Patel
> for the nVidia 194 and which is currently in RFC:
> https://lore.kernel.org/linux-gpio/20210625235532.19575-1-dipenp@nvidia.com/
>
> Please review this new subsystem and see if you can just
> make a slot-in driver using Dipen's patches instead.
>
> Dipen: please have a look at Sowjanya's patches to see
> if this hardware is similar to yours.
>
> Sometimes several vendors come up with similar hardware
> around the same time, because of industry trends, so I would
> not be surprised if these two hardwares address the very
> same usecase.
>
> Yours,
> Linus Walleij
