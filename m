Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FDFF346709
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Mar 2021 18:58:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230378AbhCWR5o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Mar 2021 13:57:44 -0400
Received: from mail-bn8nam11on2054.outbound.protection.outlook.com ([40.107.236.54]:52193
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231626AbhCWR5b (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Mar 2021 13:57:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fgto3Q4McVu6W+co8e+wHZ1ILkzu8X50gjgjSimP8tfdAmE8DSsDQe5HSRc/6driZfsTHRwExGrkWfcX+1dStCt26JBqdlsj7LGYmBNGFsZDJREUpWmD7xjUZp+vni2FuNqJQnSs2ofsXzZqrj6nHbrH6wX2igeFk0Hh6YLOyuvZOdGJXCjCZ8kkvEzhrawRSDayb7+DzzFsqOx9EulvxxUo0jXs+5BNjML/ocYGtrCtUcufkKuRy/S/SiJ2Zu9lduHK9pfLPn4OwQd+2jErBmj82pYnmsKkqOpuagRaH9dJoALPVFkr4hNRl0QXcaJeicMzCZEB9tJauI85cya8Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/rikkWTSZx2A+z5G3jQdFLECzs9f/BjwmKOhaXFBRA=;
 b=HTIkGDEafCypRpOko2haXBIPxjM+3yrPjJyiIa6R1U20ObK7/M8wufmyuLe4Sk4bFvpSqss4LMODO7arRJL2Ep/x5RVEvjQ0UAUwGW42xvsi9acaIIvk7lXm96itjLxhOZ55Fmrn/WgF5Sqb0WSH02xQJ96+DawaLHzkPcrvVP0TX+3oQefzoWAPnKG44vJeLWPS1G6DG7CXLi0eYFOuRj83t2fSsKckcNGbic2f8UT3FD+pGHILw1Sl3EqmFa98kzFoWKaDfxyUcIb2hfOCP0rM2b3Gl9Nc1c3zL4iGtVjv87JytFXGsNdgsaHp0lDKBfXu7ETsellw5D2P7hmiiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/rikkWTSZx2A+z5G3jQdFLECzs9f/BjwmKOhaXFBRA=;
 b=Ts/D573dhgcR0SWV+Te+RHBnZY+n5pMoPYBj2a42nU6EQVmA+wdnStEThtYqjB5kE4qT4G6mQbz6LsAwvrM29OWUXgE/lCNRwrVgAZok35t0h5L+zVtP1O7hrF+Ns0WVK6upBgzJxQCorKxTTPdmC4nSwzqBCWJgabHkRiT5PVPxKUUmQSKu5g4pbKh22eyJ6Md/9WYb9A4BGqJSOYwwws9b/hgLv1IPs+OD0WDeLEtZt8i7ysNGwLt/44T28VQammkdFrjE+foq22B+b80CF9EogpOh1KXleGOuYMHjxrU8e712FyXw69EyM53r4Fkach+6Vq1OKn2uYsBSbLh8XQ==
Received: from MWHPR17CA0067.namprd17.prod.outlook.com (2603:10b6:300:93::29)
 by BL1PR12MB5287.namprd12.prod.outlook.com (2603:10b6:208:317::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 17:57:29 +0000
Received: from CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:93:cafe::b2) by MWHPR17CA0067.outlook.office365.com
 (2603:10b6:300:93::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Tue, 23 Mar 2021 17:57:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT047.mail.protection.outlook.com (10.13.174.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 17:57:29 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 23 Mar
 2021 17:57:28 +0000
Received: from [172.17.173.69] (172.20.145.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Tue, 23 Mar 2021 17:57:27 +0000
Subject: Re: GTE - The hardware timestamping engine
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Kent Gibson <warthog618@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        "Richard Cochran" <richardcochran@gmail.com>
References: <4c46726d-fa35-1a95-4295-bca37c8b6fe3@nvidia.com>
 <CACRpkdbmqww6UQ8CFYo=+bCtVYBJwjMxVixc4vS6D3B+dUHScw@mail.gmail.com>
 <20210322060047.GA226745@sol>
 <d48fa7b5-8c17-c3d7-10a9-a9811c410a39@nvidia.com>
 <CACRpkdbkmwuAJzD-CpWKqmL3_n1xkvv_2M_DsNs+ZquiaRkKgA@mail.gmail.com>
From:   Dipen Patel <dipenp@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <378e2d1b-9b38-605b-c20f-fbfeefb07c6d@nvidia.com>
Date:   Tue, 23 Mar 2021 11:01:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdbkmwuAJzD-CpWKqmL3_n1xkvv_2M_DsNs+ZquiaRkKgA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01886351-f6e1-4842-9772-08d8ee25201b
X-MS-TrafficTypeDiagnostic: BL1PR12MB5287:
X-Microsoft-Antispam-PRVS: <BL1PR12MB52875C28900B87B3A5FCA5ABAE649@BL1PR12MB5287.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CDhSTkrQiNyIlytrCI0f5IMvv3u1SzPMtMrccTA++ICZE0VhD38tRHFQB3mSCqju9nyls4uoHKBJOQlMH1mmrQDVod/udzeVa6yGdBUg4Z1wQxCMuaLFWhVTMimcbyp3VsZ1W8l/IF8kvtPAjhxvMaJyIoIZNVvEvsTPHmLUSIdzK7XApaXYMHexKuT98vRD1r5VrTstUS7Blb/3j6QLB8kle2KyWsgXVCuLsc/TLJ9S/bQGy6fbzg1fh5FNBzBG3Bm6WEnJZtiZYOg772FZgraOF8Yfw37KJOSsjsu/n4hhAJXGDj9RQMQvwGlcSp/Y8TnpMwVwoUO+jOvqP714D3ZAH5WScmGYy0QpLHwBuWvHglF/jeMBZp3WSTB2IrivpdsWUtDmHGM/HJRSNyxULYDga98Ho+8FE6MC9TpEK0dzhvmqBZ+8yRPMWezlJ+3a1whLOaKnf4WT/ViuM5e3Bu5asECamc03U5SsmMN0pokgn4rd3C84hO767VYaDCGYv72ZaZBVzJ2pXKoF6iGLj6vsrkrOzdZVE7L9mXE5NK9oRz2G5xYyYF/TCjcnODcTHy1GNLqQ/I7JKdH/pbqgNjIOxI9OxQCnjaLMzJeTn7Viqij6LNGo1AwGvz0hJQn49unNsBnm/Tc57BEtLQOOTfKzPL6GjLjZKDxCCb5AVOq8/v+oSyeZ1TmwUDUmvkUg
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(346002)(39850400004)(396003)(136003)(376002)(46966006)(36840700001)(8936002)(6666004)(7636003)(36906005)(4326008)(7416002)(6916009)(8676002)(336012)(31686004)(36756003)(26005)(54906003)(186003)(2616005)(316002)(36860700001)(70586007)(82310400003)(426003)(5660300002)(70206006)(2906002)(47076005)(86362001)(356005)(16576012)(31696002)(53546011)(82740400003)(478600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 17:57:29.1705
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01886351-f6e1-4842-9772-08d8ee25201b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5287
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 3/23/21 2:08 AM, Linus Walleij wrote:
> On Mon, Mar 22, 2021 at 9:17 PM Dipen Patel <dipenp@nvidia.com> wrote:
> 
>> My follow-up concerns on both Linus's and Kent's feedback:
>>
>> 1.  Please correct me if I am wrong, lineevent in the gpiolib* is only
>>     serves the userspace clients.
>> 1.a What about kernel drivers wanting to use this feature for monitoring its
>>     GPIO lines, see gyroscope example somewhere below. In that regards,
>>     lineevent implementation is not sufficient.
>> 1.b Are you also implying to extend lineevent implementation to kernel
>>     drivers?
> 
> I was talking about lineevent because you mentioned things like
> motors and robotics, and those things are traditionally not run in
> kernelspace because they are not generic hardware that fit in the
> kernel subsystems.
> 
> Normally industrial automatic control tasks are run in a userspace
> thread with some realtime priority.
> 
I mentioned those two use cases as illustration purpose as GTE is not just
restricted to robotics and vehicles. I agree that those applications run
mostly from userspace with RT priority but there most certainly some
kernel drivers they interact and it may want to use GTE, for example,
BMI088 devices mostly used in drones and robotics, it could be extended to
use GTE for its GPIO hw timestamping, GPIO is used to indicate data ready.

> As Kent says, in-kernel events are exclusively using IRQ as
> mechanism, and should be modeled as IRQs. Then the question
> is how you join the timestamp with the IRQ. GPIO chips are
> just some kind of irqchip in this regard, we reuse the irqchip
> infrastructure in the kernel for all GPIO drivers that generate
> "events" in response to state transitions on digital lines.
> 
>>>> And certainly you will also want to use this timestamp for
>>>> IIO devices? If it is just GPIOs and IRQs today, it will be
>>>> gyroscopes and accelerometers tomorrow, am I right?
>>>>
>>
>> Gyroscope, accelerometers or any IIO are built on top of i2c/spi and/or GPIOs.
>> So they are covered as long as they serve as client to GTE framework, For
>> example, if gyroscope uses GPIO as an interrupt to indicate frame
>> ready, GTE could timestamp that GPIO as well any IRQs like i2c transaction
>> complete IRQ. To this to happen, gycroscope then register itself with
>> GTE framework and enable required signals that it interfaces/interested with.
> 
> I think there are IIO devices that provide their own
> hardware timestamp and as such they might want to use that,
> so the mechanism need to be generic enough that a certain
> hardware timestamp can be selected sooner or later.
> But let's not overcomplicate things for now.
> 

I agree, above BMI088 has its own timestamping engine. I have to look into
that aspect for bringing its TS engine into GTE framework as one of the possible
off-chip provides besides in-chip GTEs. We can defer that part for later. Thanks
for pointing that out.

> Yours,
> Linus Walleij
> 
