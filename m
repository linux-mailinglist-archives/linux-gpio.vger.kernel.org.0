Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4A5414617
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 12:23:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231960AbhIVKZD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 06:25:03 -0400
Received: from mail-mw2nam10on2063.outbound.protection.outlook.com ([40.107.94.63]:11392
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229651AbhIVKZD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Sep 2021 06:25:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b8pH48V5c3uixJ1plzn7mCjD9SvgNzUw+e1cO4WbvFqHKydMNqw6gCC6v4gZQt2jANma5O049+l9GGkdghbheraC+M+sa8rcxU90uiBU9wovMEOhtxNUsFraWCfUYCDt57Cz4PghTD15EQEtcOwK/8r/IY5zUQ0Jgv9Pa30gZvI0sEqCOMbD+JHv4ICpQp71UMQMz0zj7Tc3+3WrJn+gvGQgwf78+AIyqs7TSNNoF7pXqjAMxtft7wtjl6IrcRp7ggjMTZSRS/IUXW+JUMm8RZvQ38HonDhV/uie/qE4fYJiM+CZjyCOHeW+PcX1Xzqy65tRnQscpgGbZthhkVa4MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=tu16lSpW6/c6/4En4bsZKZm/1szWizAvDfaPMIrXJ7E=;
 b=ETQiIn4vhg7TEu9RhVpeH8BXgGx3WcQxg1n1JvQ3q/MfVnlenwPKEBRV9i7INyUlNlWVkQKpMsH3vLPPpQZ8GhUalEyPbtr/WSfZTm09rcwNc1/JvmjnEZozDptflOguXL2LbuUI5uTbsNV/MKxGq9frr2JSnyAzrVLouw+5NJtz8YFHMdShFrg1GHxR/Zxrl5NlJQe7/KHCnHG0I9g3NsplgULlH6Mu39XgdLG+CoOKn63Kbht3s7BFPpr6xKpE1Ijvq88v2cMxkGe0PU04pcXxgs2284ypE9W1nt5VofElfU3ssD32GPKBJIEeF04V2BiJIEQLfuonHUEPBtTgNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tu16lSpW6/c6/4En4bsZKZm/1szWizAvDfaPMIrXJ7E=;
 b=PtXS4Rb5mwsuD50xcp3N/m1+QjUGcwWCa+foKoTfp5W2lP49HLNmakMxtIdXtR9SKD3TxCSJAa0j3Mr2UqQbq2WL8Zc8qyxs4gWrnoIT3mLEeuz0rz3nLLSfWCuRlJ776xA+0tuvI2pSTUyqsvWRvOvTw4yt88wVyRmQEkTGMWQ=
Received: from BN0PR02CA0053.namprd02.prod.outlook.com (2603:10b6:408:e5::28)
 by SA0PR02MB7244.namprd02.prod.outlook.com (2603:10b6:806:ed::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 22 Sep
 2021 10:23:30 +0000
Received: from BN1NAM02FT055.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:e5:cafe::ef) by BN0PR02CA0053.outlook.office365.com
 (2603:10b6:408:e5::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Wed, 22 Sep 2021 10:23:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT055.mail.protection.outlook.com (10.13.2.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4523.14 via Frontend Transport; Wed, 22 Sep 2021 10:23:30 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 22 Sep 2021 03:23:28 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 22 Sep 2021 03:23:28 -0700
Envelope-to: git@xilinx.com,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 robh+dt@kernel.org,
 iwamatsu@nigauri.org,
 linus.walleij@linaro.org,
 gregkh@linuxfoundation.org,
 zou_wei@huawei.com,
 arnd@arndb.de,
 bgolaszewski@baylibre.com
Received: from [10.254.241.49] (port=60448)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1mSzPT-000Fu1-Ag; Wed, 22 Sep 2021 03:23:27 -0700
Subject: Re: [PATCH V3 3/3] gpio: modepin: Add driver support for modepin GPIO
 controller
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>
CC:     Piyush Mehta <piyush.mehta@xilinx.com>,
        Arnd Bergmann <arnd@arndb.de>, "Zou Wei" <zou_wei@huawei.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        <wendy.liang@xilinx.com>, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
        Rob Herring <robh+dt@kernel.org>, <rajan.vaja@xilinx.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        git <git@xilinx.com>, "Srinivas Goud" <sgoud@xilinx.com>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <20210818081018.2620544-1-piyush.mehta@xilinx.com>
 <20210818081018.2620544-4-piyush.mehta@xilinx.com>
 <CAMpxmJUvPg3LvT1EJa-ZecXMWpR82EQMr8vhTjBpO3_6iiGecQ@mail.gmail.com>
 <2286343a-e061-d5bb-b266-6f657cba63e2@xilinx.com>
 <CAMpxmJVUTy5iOoTuDTY8-7z-brLJwkv_a82tU47ZXsJjM_Vp1A@mail.gmail.com>
 <CAMpxmJU7+QEumAbN=2JY_ywFyhzS6tn4JKRGnoEy=mbYp6ZjXg@mail.gmail.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <554508f5-8cb5-3840-9f61-f6cd6e5745d2@xilinx.com>
Date:   Wed, 22 Sep 2021 12:23:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAMpxmJU7+QEumAbN=2JY_ywFyhzS6tn4JKRGnoEy=mbYp6ZjXg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a90620e-db2c-491c-9c43-08d97db30650
X-MS-TrafficTypeDiagnostic: SA0PR02MB7244:
X-Microsoft-Antispam-PRVS: <SA0PR02MB7244402821435F248E40F77AC6A29@SA0PR02MB7244.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zKnAGUg5Oj+sq5VIaiMX+6nK04iQ9zBQv+XxDHYy+P3LgiIWF7XKZEHolZnFNNTee39XVSBp73XP8/7lcrIJLAN/mKIrHkcxdch5EmzTrnBDrKX4R5maqX6jepfZQen2hGoMX0NsoNBdpo2sOnROHucnfyElyzTANOYR6f6ozBOcW2jJk+JeyClMAAOWgigrWnssGTSVoX71GQ0hNW5w2YHUJztjna++saQgt92GVqN9nknCXG//UnI5QMOSeTFI3LKwj0I9mF9K8xky7WiZ+Ush71IeNy/Ig20Ogy8UilSKHLAgv/c/E2nTkdUch0GFnCpwK8Vrryjh/ZoRC78DCY7n2Qx4ZCAElP76Oxe97dulG95MsX4Ti0JXagOgz6Kl5EvlhH2MyfugVshMs4Re2iDVr7UbyPPrh3WHm/sT6NjCW2QVAYM1mB+TKsOJbnGc8bwXWpCci7jVZ4Jgu7b8ch3nnN4y50vMpHaAc1C/EuMuTi1XQyDvdmMpNPALlFKsbAf7BowEJ336ffypo5YhUjBK+ZJfxPvCKQRk0VdKjKMXkUEi2kmw/N+EaBGVgyt9fUoEUGGtKX6pRqQuS2zSqXKnz//XaGVqEjaR5sh5FZm1XWrxr5lnteJDXKVLUtF7Hn4slDae/lNDjZwWH8oRbJ6YiTj87wcorHZ6WGKbaaZWGdu+IqFP5TojuvLntja2UrA8VhPFC+L/pYwd35TZhlwxDEDlTeianT2HA27+wENg6fStrhhoB1p8UJPLEt836GNrXEMr9oR5Ec+VcWccMQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(2616005)(8676002)(31696002)(7636003)(36756003)(7416002)(426003)(9786002)(6666004)(2906002)(36906005)(186003)(8936002)(4326008)(316002)(356005)(336012)(508600001)(31686004)(53546011)(36860700001)(70206006)(70586007)(110136005)(54906003)(47076005)(82310400003)(26005)(44832011)(5660300002)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 10:23:30.6720
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a90620e-db2c-491c-9c43-08d97db30650
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT055.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7244
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 9/22/21 12:21 PM, Bartosz Golaszewski wrote:
> On Wed, Sep 22, 2021 at 12:18 PM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
>>
>> On Mon, Aug 23, 2021 at 10:14 AM Michal Simek <michal.simek@xilinx.com> wrote:
>>>
>>> Hi Bart,
>>>
>>> On 8/23/21 10:02 AM, Bartosz Golaszewski wrote:
>>>> On Wed, Aug 18, 2021 at 10:11 AM Piyush Mehta <piyush.mehta@xilinx.com> wrote:
>>>>>
>>>>> This patch adds driver support for the zynqmp modepin GPIO controller.
>>>>> GPIO modepin driver set and get the value and status of the PS_MODE pin,
>>>>> based on device-tree pin configuration. These four mode pins are
>>>>> configurable as input/output. The mode pin has a control register, which
>>>>> have lower four-bits [0:3] are configurable as input/output, next four-bits
>>>>> can be used for reading the data  as input[4:7], and next setting the
>>>>> output pin state output[8:11].
>>>>>
>>>>> Signed-off-by: Piyush Mehta <piyush.mehta@xilinx.com>
>>>>> Acked-by: Michal Simek <michal.simek@xilinx.com>
>>>>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>>>> ---
>>>>
>>>> Which tree should this go through?
>>>
>>> I would prefer to go this via gpio tree.
>>>
>>> Thanks,
>>> Michal
>>
>> Sure, just make sure to get an Ack from Rob Herring on the DT bindings.
>>
>> Bart
> 
> Nevermind - it's already there.

yes. that's what I thought. :-)

Cheers,
Michal
