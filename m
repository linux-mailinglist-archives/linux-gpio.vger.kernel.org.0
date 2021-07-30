Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B60703DB1BE
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 05:08:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233587AbhG3DI3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Jul 2021 23:08:29 -0400
Received: from mail-mw2nam10on2073.outbound.protection.outlook.com ([40.107.94.73]:54343
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230199AbhG3DI3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 29 Jul 2021 23:08:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mCxISTSGfD2yhgcuc4ICmZDetFLd5g+sYdxgfPwuhHo7PYLuHYaP+UbMaGD2EHH6zagCZQGUWjPK8KLAFLxXuwYoRpyFyuFoMFVe6xzLyVgY1VO9ODAe7+8BEB4EyMd0R/RjXE1Z1PL3dhuQU1LcqjZfOxj5RrFpBujbLoclG7a6+8JXAile9cH5R3XJxb0MwNcull3JLyxrOpXC71fV9+bfoApeJ22vFMhv+DfKZp5pM3t12Rw+9LaHnOWxkx+aNs/gRAcTXe+P9/AHTOdcOm0ky2gjgFRPkNB6a1J2k9ZUKR7YjqQSyetkmf5055HTj8uGNBFHlnjI5ryjfPvubA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qrjkqutmIfi7hXlEFlbngy7GtX/xSMLlhjU8w0Agf3M=;
 b=DxrjRhIbF/jSXlQHy9L6yqlEmxMMA+qBdnSI80hsEwE+2SKT0yI4Aj2c1n2/HtEjZ4wHS0hENLP/KqrOXFCyo4hzcLA19buMTjVWzqxNMsdwbCMz9kASXvwA02xkYVQV6bB8FDMTqowyBHKwDl+cct2H8EOYPtY+lkKE+aaPtEhFFowKXxm+nyZUjJug6wpv+Qrqau8TWsSqj+BP4nvjugO+9MeKcq8MIJJIUFEtD1mCJ3D1hdfIwAUL6ZdlFmHmjGRCta5Cv+vaHRIZvz1MpJn2uVN+0YtDJfVDF6kedcYoR349Tu8p+jzmx42PsJs5xpt8fTEeXXpuLX4mbBvmCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qrjkqutmIfi7hXlEFlbngy7GtX/xSMLlhjU8w0Agf3M=;
 b=AqayNUrVVKmqjilUye0X8lHxfP3qYvsqD8bV4kPbj/w7zu0FVFO+Ka1DqxAGAxAqvSYTpZTmwlAUM1cacf9k7SPE8csuWanvkLSadqpmK5xnAKkWQrYOHUsfyinAroWjp6nCDgUHBTppJ/PG6OTFqTzLhyk38cfKtd7QtuuqR90k0orUZI2qmwclEPBQZuaNd46nJS1xLuRu+jQr33x2mriubJUS1H3xwnuga2JhcgmXwo8CcqSqkOPgcDvZW3BRIatuSbWJeHSC3zcMKb3isUpM1CbUCTRxUqCjxG0Ggst70tvT1QePhJn3NjARVjh0Bm/yJAU7G8JrFeqoQC3+hA==
Received: from DM3PR12CA0127.namprd12.prod.outlook.com (2603:10b6:0:51::23) by
 CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.20; Fri, 30 Jul 2021 03:08:24 +0000
Received: from DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:51:cafe::93) by DM3PR12CA0127.outlook.office365.com
 (2603:10b6:0:51::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20 via Frontend
 Transport; Fri, 30 Jul 2021 03:08:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT034.mail.protection.outlook.com (10.13.173.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4373.18 via Frontend Transport; Fri, 30 Jul 2021 03:08:23 +0000
Received: from [172.17.173.69] (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 30 Jul
 2021 03:08:22 +0000
Subject: Re: [RFC 09/11] tools: gpio: Add new hardware clock type
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
References: <20210625235532.19575-1-dipenp@nvidia.com>
 <20210625235532.19575-10-dipenp@nvidia.com>
 <CACRpkdaqKJLUdf3NiFHaTgu6buyhMb_D1yKyHF4M=eTQ94pe-g@mail.gmail.com>
X-Nvconfidentiality: public
From:   Dipen Patel <dipenp@nvidia.com>
Message-ID: <b87fa5d8-bef9-9046-9747-d4428ddf58ea@nvidia.com>
Date:   Thu, 29 Jul 2021 20:17:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdaqKJLUdf3NiFHaTgu6buyhMb_D1yKyHF4M=eTQ94pe-g@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62d89e40-519b-46ad-40b4-08d953074af4
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:
X-Microsoft-Antispam-PRVS: <CO6PR12MB544452E0D0E171D7B9590E24AEEC9@CO6PR12MB5444.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7O8DdNptP8n48qd5NUoAWzzq6ESrFkPSc2cgX0bHy+oH3GxxjK/eKqMJi4Bv5UbBnzHxvvSCmryv1A9UTGhHeYetp3vccjZsScztUt0RM+KyAc/NmkJE92/7b8LY9uRCXFLsx9g4Q5PrbLrFId1a/F83a7XhtiZyT5gq8HDIqjQunrbGbHeuP7PcNJAmLWJzKOFuBdIza4k8X3KV98gFrD00NQJXKxlaifI1c54j1LHnd6jpwna84Y/pQlDj4r/fG/1AEQLwBtxmKu5rVNueQocVJfrGpvgo+UYHNK99kQ9z4djUg+tULT2NHULEC1tkd+LnWR5k+8LugPlr/EGE2le4BL33IiwuHi1LqKuLvC8Og/i9TJD/30wGR5Yih73LZaP37ugXVSwKTuoMzrl8/buGgh5sj5UbVGoLg3x5yzWkLbJbxWYQvn2bN6RKjBN7xuNwmJcXF/FI4oCGN06OIAYishP+N6b5mJTEA+xG6uPTEmBf73LAYDcDwO7loOx8PzFqHIXZ6pMofAQuTrHDxs7Ia/TEdmTWX+ZQK3nr+Mr8XIssQkPgXuj6TAadk4xQHn3QLLBs6qy4e971mFGOFjgcIfe7YxH1depk+TPJFM/9sGfu9gYDV/2rtaMq4d5SRB7MGaGFk3wXJsDsob7D4J+0yZpgtwFf9MWwGnR9dWujuKtTNb0DzjE5U96lwdVn0uDc9yPvHX85TLbLB8jurpGEa1pAf7wwx1kcUa8sAoA=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(36840700001)(46966006)(82310400003)(4326008)(16526019)(316002)(26005)(82740400003)(7416002)(31686004)(4744005)(53546011)(186003)(336012)(16576012)(8676002)(36906005)(5660300002)(7636003)(2616005)(54906003)(83380400001)(86362001)(426003)(478600001)(6916009)(8936002)(2906002)(36756003)(70586007)(356005)(36860700001)(70206006)(31696002)(47076005)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 03:08:23.6044
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62d89e40-519b-46ad-40b4-08d953074af4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5444
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 6/27/21 4:36 AM, Linus Walleij wrote:
> On Sat, Jun 26, 2021 at 1:48 AM Dipen Patel <dipenp@nvidia.com> wrote:
>
>> gpiolib-cdev is extended to support hardware clock type, this
>> patch reflects that fact.
>>
>> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> (...)
>>                 case 'w':
>>                         config.flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME;
>>                         break;
>> +               case 't':
>> +                       config.flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE;
>> +                       break;
> After the checking of the command line options we need a small sanity
> check so we don't try to enable both realtime and hardware clock
> at the same time, we will only be able to request one of them.

This will any way fail at gpiolib-cdev layer. Do we want to add it here

as well?

>
> Yours,
> Linus Walleij
