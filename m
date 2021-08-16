Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D3253ECEA0
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Aug 2021 08:28:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232958AbhHPG2i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Aug 2021 02:28:38 -0400
Received: from mail-bn1nam07on2087.outbound.protection.outlook.com ([40.107.212.87]:44929
        "EHLO NAM02-BN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233252AbhHPG2f (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 16 Aug 2021 02:28:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZN4P8/a104bENgDNFmJrNU6/AZGGGm9U3GNl+RdeW8FFycEDMmImZCBJYz9yI5DIi23uvLj2Pp0kmBTUE3GW547rDjX0MKStitEwVxxBA90LEFthARvID5QJPGg2s+LY3HKCFxhpq3t6LuvHX7qLrivKw0O88Oa0jckDpuVHiEDiClHjaEuSwacnnbYO6s8JTwt1w2Mu+Eoow4g0+OBU/+aeZJMuFCQxIOTko1AdGDtc7ApygNfUtswHuiENARLvacAJGH5uWUyQVYz93N7ETRUn3IkPORbaBT0EA7Npp0cCh49bLK6i/KjPCsB+2IHwXZOlmM4U4x45kn3fH5CTBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uioSGVnCtYlpbsoB0wjtpHulcp8uRTEqapSHGb8TJak=;
 b=bHKrHdQSQYzpc85atG723VrUjMNKth3A9I4xm8zuOL/bjbrlEueYWmtEQjEc4Y5LQw6hllNX8/YxOuXerIHvW5tP8MPzFpdC+vdNo8NjOmoODEzu4Cm2jfRlrd0ijZ30OgjYZnI5F3kg4g345EAKO8rXVe/YrbdC6kn3BalFvx3ddk41X/lQrlqKUtp5zBTVblWz5EH5PiLKBN3ThgjGL1KG2FrTFoudhjJRc7XrRgNKjHm7DLiCG2lyDrrPSKTn4KY140lWEdaqsle2BmzPeh2JJln+07p4nz+HvVA/Sgx/iFjEhS9sdoD61GhqY9RCGcVyWuHK6YFKykfnh24mQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uioSGVnCtYlpbsoB0wjtpHulcp8uRTEqapSHGb8TJak=;
 b=QZYlrXKHB3alxSVNLrOb/zTc9+/X/H3rn7Ts9skaufbTzfTJAiLfCpvm9ra58OThrio2UkghW4j4qcsOdQzYDOC2ayZYzCPV4AvvtPzz6xqlrM/tqYyLrgEBBFTBirFwbG77BjspmjS2LVTwHQ0Ch0QX2gmWdOJgjV6aexrDVd0=
Received: from SN2PR01CA0083.prod.exchangelabs.com (2603:10b6:800::51) by
 DM5PR02MB2347.namprd02.prod.outlook.com (2603:10b6:3:5b::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.13; Mon, 16 Aug 2021 06:28:01 +0000
Received: from SN1NAM02FT0016.eop-nam02.prod.protection.outlook.com
 (2603:10b6:800:0:cafe::92) by SN2PR01CA0083.outlook.office365.com
 (2603:10b6:800::51) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Mon, 16 Aug 2021 06:28:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0016.mail.protection.outlook.com (10.97.4.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Mon, 16 Aug 2021 06:28:01 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 15 Aug 2021 23:27:50 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Sun, 15 Aug 2021 23:27:50 -0700
Envelope-to: git@xilinx.com,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 bgolaszewski@baylibre.com,
 iwamatsu@nigauri.org,
 linus.walleij@linaro.org,
 gregkh@linuxfoundation.org,
 zou_wei@huawei.com,
 arnd@arndb.de,
 robh@kernel.org
Received: from [172.30.17.109] (port=39402)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1mFW69-0008W8-D5; Sun, 15 Aug 2021 23:27:49 -0700
Subject: Re: [PATCH V2 2/3] dt-bindings: gpio: zynqmp: Add binding
 documentation for modepin
To:     Rob Herring <robh@kernel.org>,
        Piyush Mehta <piyush.mehta@xilinx.com>
CC:     <arnd@arndb.de>, <zou_wei@huawei.com>,
        <gregkh@linuxfoundation.org>, <linus.walleij@linaro.org>,
        <michal.simek@xilinx.com>, <wendy.liang@xilinx.com>,
        <iwamatsu@nigauri.org>, <bgolaszewski@baylibre.com>,
        <rajan.vaja@xilinx.com>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <git@xilinx.com>, <sgoud@xilinx.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20210805174219.3000667-1-piyush.mehta@xilinx.com>
 <20210805174219.3000667-3-piyush.mehta@xilinx.com>
 <YRbBnRS0VosXcZWz@robh.at.kernel.org>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <d71ad7f9-6972-8cc0-6dfb-b5306c9900d0@xilinx.com>
Date:   Mon, 16 Aug 2021 08:27:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YRbBnRS0VosXcZWz@robh.at.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aacb8674-7152-4885-6c8a-08d9607eff58
X-MS-TrafficTypeDiagnostic: DM5PR02MB2347:
X-Microsoft-Antispam-PRVS: <DM5PR02MB2347B78CE5DE7BCEC0CFB8F2C6FD9@DM5PR02MB2347.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9Xgl56Osob751vjGxt3SG0MrSklvtImNyNeS3H65qSlKfluNi156En6GXZWI8FcM0pELHa97UHLX3dstvUlv5xytFZ/We6f2HUZi588btvF5Sfl/8ymp2BcbOgGvJUduvJWtcYfEJ6LoA7glhNFSOAZUDdgr2YkJonPjSGok1RLAltbTsF2iNIHZiBRy+chjZXl168tBQjnwtSEYBB22VHvcIyeJDVZriZWtgBmU5lMdT5YMGMbv+M3E6vuM6FUOPQmtFhcuEn8vOfhQsmLzoeCPN1OR/vvaf5GLWLTqZnz3TeSppumHb4kAf9h7idHK1stZX1K6r8Vu7w78pvOwoNFM2u8fWjLebnsra0AmgaRQ+3nYy3JduIq106+uRDp6EOouFP4dIrnex+FHsmZPcr8rW9pIALehe+wvdOHkwz34F2ehuBdYK/Exq9e5/yuiNkve3NHcg4v+x3WKpdPVA1Kp+t6HSLiXBEsudHnQtOGpZiNwOgHGKuxTzImNEYrmzuTK9xY6kaZjQU8cpBN8088Te8P7qdQ9KU+ISuIx3GFUGKmFSLlU3IOIajdbLuoed99piEowh1rojQkpvzseaZByCjJj9bVX6ZHqHWWxorc6Fwxrc7mcdb7oNkn6otqKCZYpJJK8FupgzWWk52VKz7AtTnXU8iszc4eEozstDPG/p/ASMsY57nx+l+rCBUtoOPWhbQrs93uDFsf5UKRFoOgfkO0/3MLzo63DGiVClwUjfQfYQenZfAB/+6cVCeoMnFu4uu3Yenp4VJPW4ng0/0bs7K5pKz01paHGzrtDOUd1PoWfdk4vekMeYJkbi24M+2fRizKkSxW87OfxNdiw9OdPcHzuW89n/w7BnsiZNLua6jH56+0+aU1KLqZgzAgP
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(39850400004)(346002)(46966006)(36840700001)(36860700001)(31686004)(6636002)(186003)(336012)(47076005)(356005)(54906003)(7416002)(26005)(82740400003)(426003)(9786002)(2616005)(2906002)(7636003)(5660300002)(83380400001)(316002)(82310400003)(4326008)(36906005)(966005)(8676002)(70206006)(36756003)(6666004)(44832011)(70586007)(31696002)(53546011)(8936002)(110136005)(478600001)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 06:28:01.4957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aacb8674-7152-4885-6c8a-08d9607eff58
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0016.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2347
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 8/13/21 9:01 PM, Rob Herring wrote:
> On Thu, Aug 05, 2021 at 11:12:18PM +0530, Piyush Mehta wrote:
>> This patch adds DT binding document for zynqmp modepin GPIO controller.
>> Modepin GPIO controller has four GPIO pins which can be configurable
>> as input or output.
>>
>> Modepin driver is a bridge between the peripheral driver and GPIO pins.
>> It has set and get APIs for accessing GPIO pins, based on the device-tree
>> entry of reset-gpio property in the peripheral driver, every pin can be
>> configured as input/output and trigger GPIO pin.
>>
>> For more information please refer zynqMp TRM link:
>> Link: https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-ultrascale-trm.pdf
>> Chapter 2: Signals, Interfaces, and Pins
>> Table 2-2: Clock, Reset, and Configuration Pins - PS_MODE
>>
>> Signed-off-by: Piyush Mehta <piyush.mehta@xilinx.com>
>> ---
>> Changes in v2:
>> - Addressed review comments: Update commit message
>>
>> https://lore.kernel.org/linux-arm-kernel/20210615080553.2021061-2-piyush.mehta@xilinx.com/T/#mbd1fbda813e33b19397b350bde75747c92a0d7e1
>> https://lore.kernel.org/linux-arm-kernel/20210615080553.2021061-2-piyush.mehta@xilinx.com/T/#me82b1444ab3776162cdb0077dfc9256365c7e736
>> ---
>>  .../bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml    | 41 ++++++++++++++++++++++
>>  1 file changed, 41 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml b/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml
>> new file mode 100644
>> index 0000000..39d78f8
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml
>> @@ -0,0 +1,41 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/gpio/xlnx,zynqmp-gpio-modepin.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: ZynqMP Mode Pin GPIO controller
>> +
>> +description:
>> +  PS_MODE is 4-bits boot mode pins sampled on POR deassertion. Mode Pin
>> +  GPIO controller with configurable from numbers of pins (from 0 to 3 per
>> +  PS_MODE). Every pin can be configured as input/output.
>> +
>> +maintainers:
>> +  - Piyush Mehta <piyush.mehta@xilinx.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: xlnx,zynqmp-gpio-modepin
>> +
>> +  gpio-controller: true
>> +
>> +  "#gpio-cells":
>> +    const: 2
>> +
>> +required:
>> +  - compatible
>> +  - gpio-controller
>> +  - "#gpio-cells"
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    modepin_gpio: gpio {
>> +        compatible = "xlnx,zynqmp-gpio-modepin";
>> +        gpio-controller;
>> +        #gpio-cells = <2>;
> 
> No way to interact with this h/w?
> 
> As it is part of the firmware interface, it must be a child node in the 
> firmware node schema.

Actually it is there. Only example is not showing this properly.
https://github.com/Xilinx/u-boot-xlnx/blob/master/arch/arm/dts/zynqmp.dtsi#L250

Piyush: Can you please do it as we have done with pinctrl.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml?h=v5.14-rc6#n301

like this

zynqmp_firmware: zynqmp-firmware {
    modepin_gpio: gpio {
        compatible = "xlnx,zynqmp-gpio-modepin";
        gpio-controller;
        #gpio-cells = <2>;
    };
};

That dt labels can be also removed because they are not needed in example.

Thanks,
Michal
