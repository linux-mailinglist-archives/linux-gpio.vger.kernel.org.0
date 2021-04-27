Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7FCB36C007
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Apr 2021 09:23:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230255AbhD0HYJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Apr 2021 03:24:09 -0400
Received: from mail-co1nam11on2071.outbound.protection.outlook.com ([40.107.220.71]:60769
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234960AbhD0HYI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 27 Apr 2021 03:24:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DFRv7BDyyvHzBbA2ECu8rUu7apk6s7kQ0JyNjU3eaZFMRkB9he5eKlbqq2j2OUmKqAq3n0dTu67/P9OobKIoVuvDvrIeFaj89HMZxf4TJn46zEEA+B6BMK3xdXxYnKUc/FB5ukiffeCgO+Ez22Te2IsJTNWvlHF5AU4HnwACZvlv2QBwQPiB3xtl00uDeLYkoQk7fk8Xk0HiTCByYdz0PDvs83gDDg5KJSJj/Jc2myBxC7r72pTT0s33mhfOEop5Kmx69WG+9ErPxqqFA+DwqgtmgeuFFDLrP/lOjih1AjXoNZ/SML6ObI42B/GnqF2Sy5U5DuB45bb+/dXSrdl4Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kch0o5QLB5xjW9LEEKJTKVIdqgheb4Z1xj8Oy4Nxu8I=;
 b=Lzy+Nnn1rTFYAQTwndYW6i4MePMrCmgeUSvpnplxYVPk6xzC6UAxMFq2HN0fiP1z8e7cibnuvOCpLQ4jfFHrjkJgo1NSyqp/ib4iSjzHEEpNj/E2R6y7iLBI3/hm3lZRNp69C6ZNH4e482hGH4SwC0oqD0UFJBBscePEOKJfAwCsKEJCj9NZ0dtxhPCR96x89tNEv94yQrTn4lleTOhogjfIuhcEzlnqU0DyuEAvmHOGXGDrnvZYLbLEPxuS4BpMrvrS71eYG4aIHU9JOZYj9XEReHU/J2aSrY+nRyz0q1HRSDP2nev1QsqGixN3+T1GzEdrQyK9GZt1RHY8sv7A1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kch0o5QLB5xjW9LEEKJTKVIdqgheb4Z1xj8Oy4Nxu8I=;
 b=o6yMZP301jvUzM9P2HNhqIni7QMkJv2sZ7qt7ejHUCmwbaVS3kMNJPrMvSRK5vKRWcKqRV/CnF96TQcYDo4VZh6eFCrBiOQDY7p+4NaA2WubJ9jMTagdf+qJkDUSWn5ZPa8DNYKecCh8MUdtZ3lPwW2Z4gIlxT8C+gj2eFTKCXk=
Received: from DM3PR12CA0108.namprd12.prod.outlook.com (2603:10b6:0:55::28) by
 BY5PR02MB6642.namprd02.prod.outlook.com (2603:10b6:a03:20c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Tue, 27 Apr
 2021 07:23:23 +0000
Received: from CY1NAM02FT051.eop-nam02.prod.protection.outlook.com
 (2603:10b6:0:55:cafe::4e) by DM3PR12CA0108.outlook.office365.com
 (2603:10b6:0:55::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22 via Frontend
 Transport; Tue, 27 Apr 2021 07:23:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT051.mail.protection.outlook.com (10.152.74.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4065.21 via Frontend Transport; Tue, 27 Apr 2021 07:23:23 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 27 Apr 2021 00:23:21 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 27 Apr 2021 00:23:21 -0700
Envelope-to: git@xilinx.com,
 saikrishna12468@gmail.com,
 linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 gregkh@linuxfoundation.org,
 robh+dt@kernel.org,
 linus.walleij@linaro.org,
 andy.shevchenko@gmail.com
Received: from [172.30.17.109] (port=39096)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1lbI40-0004gl-IF; Tue, 27 Apr 2021 00:23:20 -0700
Subject: Re: [PATCH v6 3/3] pinctrl: Add Xilinx ZynqMP pinctrl driver support
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Sai Krishna Potthuri <lakshmis@xilinx.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        git <git@xilinx.com>,
        "saikrishna12468@gmail.com" <saikrishna12468@gmail.com>
References: <1619080202-31924-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1619080202-31924-4-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <CAHp75VfCbbnN-TBJiYFb=6Rhf30jA-Hz1p1UORsubF7UG6-ATw@mail.gmail.com>
 <DM5PR02MB3877B234F85F3B4887DF3A95BD429@DM5PR02MB3877.namprd02.prod.outlook.com>
 <CAHp75VfugGqLNU8LKJ_K3dPr=-eh6LHx75eV=33jH9OnryBoGA@mail.gmail.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <d1220d39-4be4-a375-042f-e7bb0264ed35@xilinx.com>
Date:   Tue, 27 Apr 2021 09:23:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VfugGqLNU8LKJ_K3dPr=-eh6LHx75eV=33jH9OnryBoGA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8c230e0-206e-4234-fb4d-08d9094d575e
X-MS-TrafficTypeDiagnostic: BY5PR02MB6642:
X-Microsoft-Antispam-PRVS: <BY5PR02MB66423752EBC60B8EB3981BC0C6419@BY5PR02MB6642.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b2lT/IzRMYNpKV0L/g188IgqV0MU5AdAaxt26wrgOKrr9IFyGjdcjBXGxWSXLiL99uz6mmoCW2/06nphZcWQIvl9W2j7dgtNTiOci9bKOMJs/sYzt0NL4eaHufNNix9GZvllCA44Li+QgKQdlUBlrswHcPk0FPqdU43kIosGtQpgUc3ie0N15bcSA97BE+35NYp5MEVirwDrcQi+l+oPh0dWA4aKWJZYNDa4gkZZHTTJq+V/SNULqxjxG0o97fdlBELfN7gi9Nj6Gl6EHviAjZaKIABDw7rd168M9O6Ji0B+4f7OdQFFKZnguv31xQGSgEZjNebN1hs/VUKn+NiaHu9Yhx/TVQVHEBZ5blNkvk2CDUkyGqwvi5J4f3GPz+RiYiNWf9aidK/8FEH4ixRJVjkrQ7pUopPQVIjUidljPiYvWr0O6Um+FaoFfZKI8JcjAoGzYGrcYg6jFwMb8UpTU1JrpW1mxLTrBLegeAwtakUHuRkN/5sCaQB7MhH6A9jXMnFpPofUzlPE45TkYWuWaPUKDkfmVhaNOvnUoRaD1cZhncjQPmU9htglWB5w75AUCHVBrqDrgvRB69oBbQBLXroz+9WUfF9ZgiOhghFcTP5nh48B0dZCrN/grtO/o2wVWzpyI1YId127Bc6AbOpW1IO4kPJsFagIZwEashzzAlc49PnSbgDVGXuDNuM3+rXq0Or/Oqedhbm2cWdeCfr5Kg==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(346002)(39850400004)(396003)(376002)(46966006)(36840700001)(336012)(70206006)(426003)(70586007)(36906005)(186003)(31696002)(44832011)(2616005)(2906002)(36756003)(26005)(82310400003)(47076005)(5660300002)(54906003)(356005)(8676002)(9786002)(4326008)(6636002)(6666004)(8936002)(53546011)(82740400003)(110136005)(31686004)(7636003)(316002)(478600001)(36860700001)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 07:23:23.1980
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8c230e0-206e-4234-fb4d-08d9094d575e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT051.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6642
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

On 4/26/21 4:04 PM, Andy Shevchenko wrote:
> On Mon, Apr 26, 2021 at 4:20 PM Sai Krishna Potthuri
> <lakshmis@xilinx.com> wrote:
>>> From: Andy Shevchenko <andy.shevchenko@gmail.com>
>>> Sent: Friday, April 23, 2021 9:24 PM
>>> On Thu, Apr 22, 2021 at 11:31 AM Sai Krishna Potthuri
>>> <lakshmi.sai.krishna.potthuri@xilinx.com> wrote:
> 
> ...
> 
>>>> +config PINCTRL_ZYNQMP
>>>> +       tristate "Pinctrl driver for Xilinx ZynqMP"
>>>> +       depends on ZYNQMP_FIRMWARE
>>>> +       select PINMUX
>>>> +       select GENERIC_PINCONF
>>>> +       default ZYNQMP_FIRMWARE
>>>> +       help
>>>> +         This selects the pinctrl driver for Xilinx ZynqMP platform.
>>>> +         This driver will query the pin information from the firmware
>>>> +         and allow configuring the pins.
>>>> +         Configuration can include the mux function to select on those
>>>> +         pin(s)/group(s), and various pin configuration parameters
>>>> +         such as pull-up, slew rate, etc.
>>>
>>> Missed module name.
>> Is this (module name) a configuration option in Kconfig?
> 
> It's a text in a free form that sheds light on how the module will be
> named in case the user will choose "m".

Is this described somewhere in documentation that module name should be
the part of symbol description? I was looking at pinctrl Kconfig and I
can't see any description like this there that's why I want to double
check.

Also if this is a rule checkpatch should be extended to checking this.

Thanks,
Michal
