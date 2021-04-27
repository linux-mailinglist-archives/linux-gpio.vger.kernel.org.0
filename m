Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF47436C040
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Apr 2021 09:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235849AbhD0HjG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Apr 2021 03:39:06 -0400
Received: from mail-dm6nam12on2070.outbound.protection.outlook.com ([40.107.243.70]:32594
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235185AbhD0Hi6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 27 Apr 2021 03:38:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UbqOYGhi8BKQJSbG8J/pb5t3ix4xVr/DwyE2gst2IWt0eNImp8fT6W5+sSWjdu2k7QjuMH/DmLv7zllIXt+u6uGq3yAZyQVyjn27MEYYymccgPMZ5B33JONB7F65C4S9c8N6Fak3uuwjTVeApSmY2uM3SSggf+5EoIAWf1o42DmckTO0GL6dbvRXZKuodnoWqv3UqNbnBfDKDfWI9dmgHSYV0qCOPNgT6xad+bSLQVe8m8e8IkBuV5dqt+7DM4omikdSvDZbT6JmdE8KHwM2vhMnAXOM3yU+xroUdotiy1/iyfV1tHcmQcOLLaFkLrBXONsKrRDGc5pGoR68tjHzYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYBjNKcwG1M+7PJwl9raJnwT7lvaC2HHcmV6KeAcivg=;
 b=PYgvwg/sN6Uwn8QS9wWf0ceUHqPRNekJO6Vm7MZdVARJ6qgPZY8SufAOGRdKLUnssbHCxdHtZtiWsraXUJffz1CLdMJyLy8AQqwwgApv6qm8Dv6RiGbTrltZpoFunckW2X+E96+aPGit0DzXeHne2p6USpg2zsPA+bi93dlFlMpdyKfPHW/Dij8gkLh6JoG7rcKw/frCjbhwCGxOxnW/Fj9AxhVdV4GKwMyhLM0bWxf0unPWUpaxtHpklw+fs3aRn3nb/1r5A8onnVgvncw1nO6ZtoTvl0niacFoaoxGyPOV7VDsD+ZEb9jWB2L6iiYiIHG5L2mpQ3k9UG6rVYYMnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYBjNKcwG1M+7PJwl9raJnwT7lvaC2HHcmV6KeAcivg=;
 b=lHmkKKXvryN/PUK81oii/pP/hfZ5uw7G1R2yzTFN/YN17yixv76svb62nQgoYx4T2fwYjFEBF3c1zYlNozrdoA7UytgqBGvRU05PjfOojBsR+M8sUuqg32Gn3zAkRnRcZiC15BUcr7+reKQS8lIOp1O6BFZrbfE+IU8eBG1Dez4=
Received: from CY4PR15CA0023.namprd15.prod.outlook.com (2603:10b6:910:14::33)
 by DM6PR02MB5497.namprd02.prod.outlook.com (2603:10b6:5:7a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25; Tue, 27 Apr
 2021 07:38:13 +0000
Received: from CY1NAM02FT006.eop-nam02.prod.protection.outlook.com
 (2603:10b6:910:14:cafe::db) by CY4PR15CA0023.outlook.office365.com
 (2603:10b6:910:14::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25 via Frontend
 Transport; Tue, 27 Apr 2021 07:38:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT006.mail.protection.outlook.com (10.152.74.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4065.21 via Frontend Transport; Tue, 27 Apr 2021 07:38:13 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 27 Apr 2021 00:38:05 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 27 Apr 2021 00:38:05 -0700
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
Received: from [172.30.17.109] (port=40496)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1lbIIG-0003Qq-El; Tue, 27 Apr 2021 00:38:04 -0700
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Michal Simek <michal.simek@xilinx.com>
CC:     Sai Krishna Potthuri <lakshmis@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        git <git@xilinx.com>,
        "saikrishna12468@gmail.com" <saikrishna12468@gmail.com>
References: <1619080202-31924-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1619080202-31924-4-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <CAHp75VfCbbnN-TBJiYFb=6Rhf30jA-Hz1p1UORsubF7UG6-ATw@mail.gmail.com>
 <DM5PR02MB3877B234F85F3B4887DF3A95BD429@DM5PR02MB3877.namprd02.prod.outlook.com>
 <CAHp75VfugGqLNU8LKJ_K3dPr=-eh6LHx75eV=33jH9OnryBoGA@mail.gmail.com>
 <d1220d39-4be4-a375-042f-e7bb0264ed35@xilinx.com>
 <CAHp75Vejqe3r6s5eoOfza0DjXEwN-hK73FWkxx6VNpx0y1ms2w@mail.gmail.com>
From:   Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v6 3/3] pinctrl: Add Xilinx ZynqMP pinctrl driver support
Message-ID: <180ca47b-d627-2d7b-1d18-5557bfcf5875@xilinx.com>
Date:   Tue, 27 Apr 2021 09:38:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vejqe3r6s5eoOfza0DjXEwN-hK73FWkxx6VNpx0y1ms2w@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b48e05b5-5196-40a8-e640-08d9094f69df
X-MS-TrafficTypeDiagnostic: DM6PR02MB5497:
X-Microsoft-Antispam-PRVS: <DM6PR02MB54974247DF1224E89D36E2DCC6419@DM6PR02MB5497.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DCyT4lelql/jZHOq0YD4vd8GfSC2zDK4PmvbmITLiOiOizVioEWGWrQkOptyQnTQc7B4BcFuazMGYnGLdwVC6wF4j81Trnt/e7kx4KSdfFlsAmVYKt6uL/exDB721RABOGV3EAE/dkVeE5ZzQ+T0o7QyrwgCUWGBANM10z0hq16k2VOemXJNBpuso7CMJLFVPVS2wGT/yuVYVO2mO1kk1AqwtYGcjFs5wM4jr3AfeOf+GJpMVKKOb2ACLKjHDZBKTSs0a+eAIaih//6JS65CY72DbzBEHPlYZJ1KIUhoZ19H4awV6U89GsmNTfV0jlCdWHEBx1jpF95d2nWix523qpboDDfKJ3L3yy2rlLHRYf1bmI7kVN4OjEwRccc37v7SB3U7MJzOyzQypzt9kNrq4iL0H5ZWYj0Rj7kjk/MBTPu4BBxM1YAaEODthqVUVuB4VEoZVyGTlwgZ54cz+lNcCogG3VeYDWcjh1zeXMJSYUbLnj2/dMRsYloh6LJKT7uTFqHdimbBh6I7JzVifLctzXEM/5/ZfTTT0W7WEgPz7JSPJjUTr5TI+skF8rISROSiGdDeRgv4ngVho9ihw5ESjulM2lG/NSspQQfEhjfWeDb+NA1XcQG/3OHBYqZ6pre6qpLG51NiD1Gg+uCcVYdqr5/A7TCuyLhGbivwwdLEhqn5e/2eClJj1i/3OBviJM5kt2kubf4ON+Ij5KygSX8usg==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(396003)(39850400004)(346002)(376002)(36840700001)(46966006)(9786002)(478600001)(316002)(31696002)(82740400003)(82310400003)(8936002)(426003)(336012)(54906003)(186003)(26005)(70586007)(70206006)(53546011)(4326008)(8676002)(110136005)(44832011)(36906005)(31686004)(83380400001)(2906002)(2616005)(36756003)(5660300002)(36860700001)(47076005)(6666004)(7636003)(356005)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 07:38:13.2344
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b48e05b5-5196-40a8-e640-08d9094f69df
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT006.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5497
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 4/27/21 9:31 AM, Andy Shevchenko wrote:
> On Tue, Apr 27, 2021 at 10:23 AM Michal Simek <michal.simek@xilinx.com> wrote:
>>
>> Hi Andy,
>>
>> On 4/26/21 4:04 PM, Andy Shevchenko wrote:
>>> On Mon, Apr 26, 2021 at 4:20 PM Sai Krishna Potthuri
>>> <lakshmis@xilinx.com> wrote:
>>>>> From: Andy Shevchenko <andy.shevchenko@gmail.com>
>>>>> Sent: Friday, April 23, 2021 9:24 PM
>>>>> On Thu, Apr 22, 2021 at 11:31 AM Sai Krishna Potthuri
>>>>> <lakshmi.sai.krishna.potthuri@xilinx.com> wrote:
>>>
>>> ...
>>>
>>>>>> +config PINCTRL_ZYNQMP
>>>>>> +       tristate "Pinctrl driver for Xilinx ZynqMP"
>>>>>> +       depends on ZYNQMP_FIRMWARE
>>>>>> +       select PINMUX
>>>>>> +       select GENERIC_PINCONF
>>>>>> +       default ZYNQMP_FIRMWARE
>>>>>> +       help
>>>>>> +         This selects the pinctrl driver for Xilinx ZynqMP platform.
>>>>>> +         This driver will query the pin information from the firmware
>>>>>> +         and allow configuring the pins.
>>>>>> +         Configuration can include the mux function to select on those
>>>>>> +         pin(s)/group(s), and various pin configuration parameters
>>>>>> +         such as pull-up, slew rate, etc.
>>>>>
>>>>> Missed module name.
>>>> Is this (module name) a configuration option in Kconfig?
>>>
>>> It's a text in a free form that sheds light on how the module will be
>>> named in case the user will choose "m".
>>
>> Is this described somewhere in documentation that module name should be
>> the part of symbol description? I was looking at pinctrl Kconfig and I
>> can't see any description like this there that's why I want to double
>> check.
> 
> I dunno if it is described, the group of maintainers require that for some time.
> I personally found this as a good practice.

I don't think it is a big deal to add it but it is a question if this
information is useful because module names should correspond target in
Makefile which can be considered as additional information.

> 
>> Also if this is a rule checkpatch should be extended to checking this.
> 
> There was a discussion at some point to add a check that help
> description shouldn't be less than 3 lines. Not sure what the outcome
> of it.

This check is likely there because I have definitely seen these messages
coming but never seen any name checking.

Thanks,
Michal

