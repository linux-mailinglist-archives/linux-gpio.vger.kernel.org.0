Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 403DF3DB8DC
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 14:47:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238945AbhG3MrI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 08:47:08 -0400
Received: from mail-dm6nam12on2051.outbound.protection.outlook.com ([40.107.243.51]:5963
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238808AbhG3Mqj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 30 Jul 2021 08:46:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bpqv/P7ih+AUAXSu1SSW3EVwtLvV3o8eZ+DK9Sb/Tw3YGK6eLsD7PAvVCcE1U7XOVnOMN4d564i30iarHduzQQCQvL7A4eXCCGp/SchSBCa+iMpGv6uwC5bJmL95mo3widwBA7++UIoXe8A/8Ej8Jgu5Tre/dTZzVg7k53Qf45gtmHFdmDXxEKFja2/O8l7CE7VCG13Kz+18em32RhFqqsG2MHighd8CL9XRyVw+XmD8AU0TB5dlczeU1Y66o9Zmg7+ChX2QHdEfDLUjwNoN77iVIfvsC4EMdaY/HRmETYyF9/OMrMjIYInOr6mohjrPldoxC6Qyi07lFn8nZ4CmsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aq6NbivVzk1sIwx3aNRin6QZnbearQwKpnJoD3W1IS8=;
 b=Uk/NyTDVQ3Zs2jeSEAj3bzUAIG1xXhK1Ei3okaffL6uMYE+sTe8Jh3J1RFvKLFfeX8l4VgS83Ed0v6qnPmj3EuB1SllP4hMzjCrVu/V1ehLHh/bJpR3IoYSaJ2hNmROFlnaABhosZBc3KXVEya9nLWvU+qYNrJA01Y0PF/mfZv5bbVilmYfZzM+GoTdyFoHEUjrZfla9dUJNLaVncgHE34rIC/njAcuBFl22mZ2HGz15ROZGBZyiSYCcnZO8alX3VO4z/eJsZ8VAHPCFkiiBJHFzMXqU/b3bfUBRbev+mwNDw/1vdxD20iK/EGhsnjjLlQlrTQpETkW5CPs2Oi9IrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aq6NbivVzk1sIwx3aNRin6QZnbearQwKpnJoD3W1IS8=;
 b=qTNqJBRlM41iV2JKm/nKNSfOzRVa7aa+XhYdTKcyGTT0+uECrwfZAM/mc23+uKjqoJB8K7zZ4noKGcZt+VT6oev2S4qCtRToPr+TMdahfjI8Dd8nr6YrLbRLB2RcdM11aiNvyIMabQBTA1ReuMDRSG4glZqHxNUzfADoDE2cKyk=
Received: from SN7PR04CA0042.namprd04.prod.outlook.com (2603:10b6:806:120::17)
 by DM6PR02MB4393.namprd02.prod.outlook.com (2603:10b6:5:29::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Fri, 30 Jul
 2021 12:46:33 +0000
Received: from SN1NAM02FT0014.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:120:cafe::e6) by SN7PR04CA0042.outlook.office365.com
 (2603:10b6:806:120::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20 via Frontend
 Transport; Fri, 30 Jul 2021 12:46:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0014.mail.protection.outlook.com (10.97.4.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4373.18 via Frontend Transport; Fri, 30 Jul 2021 12:46:32 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 30 Jul 2021 05:46:28 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Fri, 30 Jul 2021 05:46:28 -0700
Envelope-to: git@xilinx.com,
 saikrishna12468@gmail.com,
 linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 gregkh@linuxfoundation.org,
 robh@kernel.org,
 linus.walleij@linaro.org
Received: from [172.30.17.109] (port=36954)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1m9RuE-0005re-TD; Fri, 30 Jul 2021 05:46:27 -0700
Subject: Re: [PATCH 4/4] arm: dts: zynq: Replace 'io-standard' with
 'power-source' property
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>
CC:     Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>,
        "Michal Simek" <michal.simek@xilinx.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        git <git@xilinx.com>, <saikrishna12468@gmail.com>
References: <1626868353-96475-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1626868353-96475-5-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <YQMIhBPwcNw1YqMq@robh.at.kernel.org>
 <CACRpkdYrHTMLL_CQi0BoNZsXV3=2dBK38pkvd+EEkuPrzoG_Cw@mail.gmail.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <2f5d9197-4a5e-08b5-7e47-595d337478d2@xilinx.com>
Date:   Fri, 30 Jul 2021 14:46:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdYrHTMLL_CQi0BoNZsXV3=2dBK38pkvd+EEkuPrzoG_Cw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cc50e28-05be-458f-b21a-08d953580f4f
X-MS-TrafficTypeDiagnostic: DM6PR02MB4393:
X-Microsoft-Antispam-PRVS: <DM6PR02MB4393591817C38BC420ED9705C6EC9@DM6PR02MB4393.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YmyVJw7TevHGcJBWvfvXbOqcEYQonKpzFhhsQ/PynkYdYZECtjH/WOJ5HDOdZEsEIi9LTq3s/xDapsv8Oa1N+m6+ixjURg09qnpMs+GbjSwjiAt2B/yf4R82O885HVgW8PN506fKtLXJbEDD9YF7PX7StS8wbam/hA2Hi7xLm+41ERZnFRhOKoULqsIXyxrM7pfy1rK4YsSoRlph2utd/LvX1cgX8Ae2lgkc1ZIPmSxXma8QJmuy0F53BTiFJv0eb5Ran/KS6B6WYFiPO85yKOK1L2I+XkDh0j78v4GXI1jevUvDMbsjJH6lxmk5p2MMeWIkSDxLtbE/0epE1c4qLSWgjCib4ZhYzswTf7YKnjuH9OvnaReYb+6cqgTQiZZbo2UCADj+1cHuv92OXwxuH2bb2byxTmQoGQ1U6/thLpQwXa1W6DJlJbZd+QM/3VQBPvzy0QrK7fJDrIpfl28hjFnBmpcza78vpJokslx2MG52Vu1O+icVqUZ8ZEhRQpZOaouaBV8/CbOw0QBEx1o0Zd4t0FuLp1e6uBo4n+hzVJCL+GFVjfAthqQPudsJtcKRbbIEnNj+W68QAaTE1uAaqg1Du3WlZd8BXSTgqYMasW9gS+eR/EevjeZDp1G348X5NMQ06daiQupk6jnPUe2Esp7+LSqTbKxG6CVgNr6S+cfdMP5fvqO+RM3wXhmRue/XX6S+bGUWmJVbRmJENwioH4RAUX7xNO0D1MTcPas9ek1tu65U2xA05IrzIsFG/vUb8sItCPQd7VKPm8K1C/+H4Q==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(136003)(396003)(376002)(36840700001)(46966006)(82310400003)(47076005)(82740400003)(8676002)(4326008)(36756003)(83380400001)(26005)(36860700001)(186003)(54906003)(110136005)(7636003)(5660300002)(316002)(53546011)(36906005)(31686004)(9786002)(70586007)(8936002)(44832011)(426003)(2616005)(356005)(2906002)(478600001)(6666004)(336012)(31696002)(70206006)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 12:46:32.7924
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc50e28-05be-458f-b21a-08d953580f4f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0014.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4393
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 7/30/21 2:43 PM, Linus Walleij wrote:
> On Thu, Jul 29, 2021 at 9:59 PM Rob Herring <robh@kernel.org> wrote:
>> On Wed, Jul 21, 2021 at 05:22:33PM +0530, Sai Krishna Potthuri wrote:
>>> Replace 'io-standard' property with 'power-source' property in all zynq dts
>>> files to be in sync with Zynq pinctrl driver.
>>>
>>> Signed-off-by: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
>>> ---
>>>  arch/arm/boot/dts/zynq-ebaz4205.dts |  8 ++++----
>>>  arch/arm/boot/dts/zynq-microzed.dts |  2 +-
>>>  arch/arm/boot/dts/zynq-zc702.dts    | 20 ++++++++++----------
>>>  arch/arm/boot/dts/zynq-zc706.dts    | 18 +++++++++---------
>>>  4 files changed, 24 insertions(+), 24 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/zynq-ebaz4205.dts b/arch/arm/boot/dts/zynq-ebaz4205.dts
>>> index b0b836aedd76..be7eae611fb7 100644
>>> --- a/arch/arm/boot/dts/zynq-ebaz4205.dts
>>> +++ b/arch/arm/boot/dts/zynq-ebaz4205.dts
>>> @@ -57,7 +57,7 @@
>>>
>>>               conf {
>>>                       groups = "gpio0_20_grp", "gpio0_32_grp";
>>> -                     io-standard = <3>;
>>> +                     power-source = <3>;
>>
>> This will break using a new DT with a kernel without patch 3.
> 
> The old (Linux) kernel never supported the "io-standard" property
> anyway.
> 
> Unless someone is running som BSD or Windows with support for
> this property it can be merged by the quality of zero real-world
> impacts (no-one there to hear the tree fall in the forest).
> 
> Sai Krishna: correct?

Linux Zynq pinctrl driver and in tree dts files are using io-standard
properties at least from 2015.

M

