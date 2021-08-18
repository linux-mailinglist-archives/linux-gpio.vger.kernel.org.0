Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60ED73F0123
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Aug 2021 12:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232885AbhHRKCH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Aug 2021 06:02:07 -0400
Received: from mail-bn7nam10on2060.outbound.protection.outlook.com ([40.107.92.60]:31841
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232720AbhHRKCF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 18 Aug 2021 06:02:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMyjyBnw5A9yQ9cBMPvY3qMoft14PkvuioMrX2AXAKtJCCz41YSoJ+/ILNVHLTg7JbpTabEIyQ4/uy/HS/AX5rjySkguAxQzsasiNf2EPNL83AsJI9mT/LwMJxAtSjXKsu2VpBeh1tVSGMkhk9rngVbTYsVnw2hP4FuXhGL0Hx6p82iO5+19X/AYpHpIMNkxROa2x6PJrRW/cUGkHCuZkXLA1IL8fw2KCiRRSHMJOCS8Ud0Mh28qvVpBrVGWeeFpjsc2scvIgF57QYwUsfJs4ImFqUHQ9uLstNJgKEdKzbOjdQFUItt9ofQwvWTJCUtGKerR505+HdzfKYws5+N7YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5o/LzcW6Lie+m5TeOEKBABhUPOocM7W0zepGR9pHjQk=;
 b=kiHjVLPJ2EgU8ybdC45GpIVUlI0bJ4y+53d4h8oVSaGWFmIAUlwRn1l+gezNEcFOtvDw9oBE2Cw1zTNgKBuAJCFu9AC15KRNq8kBBqjVqDrQxHDo+CGmelcMzfXzHsGuOthPiYn3bbu96Dx3K5NLaFga9rYsa94eeFGAc5Xh9hT98ODVs3HWMZCjHPBsWZer5ph5xijLU2Cs3iR+IompEGhhlNZkTC1QTQF7Vd6qkENS6VkIt1hNIdETEaxxRu43gsY1UyWUpPqr9IHT9FFw31Ud8YTBrPzttl5nN1fDDH/HGbFfCQp0T8VOXK6avumA6fxJspJyNQJfoGuOvzgXNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5o/LzcW6Lie+m5TeOEKBABhUPOocM7W0zepGR9pHjQk=;
 b=m1UDW88F9E6EV2jh4w6Iy28/wHgqklZOBXxo1AyNFkR84uh6MI/DGKf0t8Z5C1L2fxd5w2lEthSmTqvLqTcRHkLkrRd9x0gtPMV+zhfHYC82nArltDOjoVycBFhKGIGDKOG9KqsNvW/MM+08FdsUuqAU1exA1pIitkh3ZvoTl+I=
Received: from SA9PR11CA0021.namprd11.prod.outlook.com (2603:10b6:806:6e::26)
 by DM6PR02MB4411.namprd02.prod.outlook.com (2603:10b6:5:25::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.18; Wed, 18 Aug
 2021 10:01:27 +0000
Received: from SN1NAM02FT0033.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:6e:cafe::ee) by SA9PR11CA0021.outlook.office365.com
 (2603:10b6:806:6e::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.18 via Frontend
 Transport; Wed, 18 Aug 2021 10:01:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0033.mail.protection.outlook.com (10.97.5.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Wed, 18 Aug 2021 10:01:26 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 18 Aug 2021 03:01:25 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 18 Aug 2021 03:01:25 -0700
Envelope-to: git@xilinx.com,
 kernel@pengutronix.de,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 robh+dt@kernel.org,
 bgolaszewski@baylibre.com,
 iwamatsu@nigauri.org,
 linus.walleij@linaro.org,
 gregkh@linuxfoundation.org,
 zou_wei@huawei.com,
 arnd@arndb.de,
 a.fatoum@pengutronix.de
Received: from [172.30.17.109] (port=37904)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1mGINw-0006KG-0p; Wed, 18 Aug 2021 03:01:24 -0700
Subject: Re: [PATCH V3 2/3] dt-bindings: gpio: zynqmp: Add binding
 documentation for modepin
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Michal Simek <michal.simek@xilinx.com>,
        Piyush Mehta <piyush.mehta@xilinx.com>, <arnd@arndb.de>,
        <zou_wei@huawei.com>, <gregkh@linuxfoundation.org>,
        <linus.walleij@linaro.org>, <wendy.liang@xilinx.com>,
        <iwamatsu@nigauri.org>, <bgolaszewski@baylibre.com>,
        <robh+dt@kernel.org>, <rajan.vaja@xilinx.com>
CC:     <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <git@xilinx.com>, <sgoud@xilinx.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20210818081018.2620544-1-piyush.mehta@xilinx.com>
 <20210818081018.2620544-3-piyush.mehta@xilinx.com>
 <5e44ee87-f727-99fd-9860-d3d58a035dc4@pengutronix.de>
 <50e468b1-9a32-0017-bd6a-8d47c3fa1a9c@xilinx.com>
 <4a724736-8bb9-a21d-974c-d9598c3d7b37@pengutronix.de>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <c53d7b06-e619-45c5-8b93-d1688792f270@xilinx.com>
Date:   Wed, 18 Aug 2021 12:01:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <4a724736-8bb9-a21d-974c-d9598c3d7b37@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca20d63c-8de6-4cfc-a2c5-08d9622f24ba
X-MS-TrafficTypeDiagnostic: DM6PR02MB4411:
X-Microsoft-Antispam-PRVS: <DM6PR02MB4411786568EFCC4B7F70FCB1C6FF9@DM6PR02MB4411.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Xifg4RRhiaDvLeGtHtEy/yuWZfiKYVWK4v9LTZ8TEeyHZUc4aCzxveh72ojmJWXr5MqLUE8sHv7LiDfRSRR2GXCUIetP8ZlpyR2iOgfvD39fWPh0U3TFitiVLjdI/qRIv4MA3CS5CTbKnU2wJ5FnzjgndYgfWpMmnKCx2jn/cydv2z+WkpL+ggEPJqN3WHodHNo6CNGdICwJaYLdxmpCJZ4m4UhKbSbSBBmXWn7F2KAS4dUvVLKdlC4AuLjZIJtuhe+eMGyKScFoyZvkCryJEq86p4WtV6dcWTYmjOyK6+ZKnlHnO7htfaaBm62sPWSdqHisFYYBZT4vXS1OPRDgyjZq2GFoWp3RZxQ8rjfjaS6+gplfohgbPpNYBBaTnjwm/TJEch9F9ol1nPlpsuQpGQd0Qje0GqgVwoI9PJ37nbvp4NBsc6JFweRaNA/stOGX5uFlOWt6U6DZ5F0cfhAJUfL0fEVHzD9ylr3xFGzviq8TU/K9te0VYw53oYxodY6e0/GYhpHGUI3TJiXrK2MzRdGspQEhCTPwRgxnL8o49+U8f/uKVbzr0J3y8vHmnf9qwPUr5Blmfp7iMC9Z+UbGynrC3eYvqPIpjHI/vOU3vERTSz2SzR0Qeip7EiXrAeZp8GPjY1Z0jWCCR9LpWxTJ2ikA1cPqQwu6JMMogfzN5vde2jgIsWnnUYKsS6kOB6+zn1Ks89dooUdvjPUaULMEoQdA+3L+CuWPfr3Ir24Vhc9/pT5QwwaIoSCr17T78aOTUADUL59iuCol7GtrRSpo2eaUS6DfHO0R3h+A/rz1BAWDjgtw1RkqEHfNRj82ZG8763NEIdYFSFTNR6yMgCkS5jql2SLdswA7ejHNwNUKxHvb+VFYy5ej1MV2J8MGXcwazNV6osP05Bpvlv7w6m5wJHblqRBrw64S+nf0gaCa9focRZwPJ85FYPe8ZcayhCz
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(346002)(396003)(36840700001)(46966006)(8936002)(316002)(356005)(83380400001)(53546011)(70206006)(26005)(44832011)(7636003)(8676002)(54906003)(82310400003)(6636002)(36756003)(36906005)(478600001)(6666004)(2906002)(7416002)(110136005)(5660300002)(4326008)(921005)(186003)(31686004)(426003)(70586007)(82740400003)(2616005)(336012)(47076005)(36860700001)(9786002)(966005)(31696002)(50156003)(43740500002)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 10:01:26.8022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca20d63c-8de6-4cfc-a2c5-08d9622f24ba
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0033.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4411
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 8/18/21 11:55 AM, Ahmad Fatoum wrote:
> On 18.08.21 11:38, Michal Simek wrote:
>> Hi Ahmad,
>>
>> On 8/18/21 11:00 AM, Ahmad Fatoum wrote:
>>> On 18.08.21 10:10, Piyush Mehta wrote:
>>>> This patch adds DT binding document for zynqmp modepin GPIO controller.
>>>> Modepin GPIO controller has four GPIO pins which can be configurable
>>>> as input or output.
>>>>
>>>> Modepin driver is a bridge between the peripheral driver and GPIO pins.
>>>> It has set and get APIs for accessing GPIO pins, based on the device-tree
>>>> entry of reset-gpio property in the peripheral driver, every pin can be
>>>> configured as input/output and trigger GPIO pin.
>>>>
>>>> For more information please refer zynqMp TRM link:
>>>> Link: https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-ultrascale-trm.pdf
>>>> Chapter 2: Signals, Interfaces, and Pins
>>>> Table 2-2: Clock, Reset, and Configuration Pins - PS_MODE
>>>>
>>>> Signed-off-by: Piyush Mehta <piyush.mehta@xilinx.com>
>>>> Acked-by: Michal Simek <michal.simek@xilinx.com>
>>>> ---
>>>> Changes in v2:
>>>> - Addressed review comments: Update commit message
>>>>
>>>> Review Comments:
>>>> https://lore.kernel.org/linux-arm-kernel/20210615080553.2021061-2-piyush.mehta@xilinx.com/T/#mbd1fbda813e33b19397b350bde75747c92a0d7e1
>>>> https://lore.kernel.org/linux-arm-kernel/20210615080553.2021061-2-piyush.mehta@xilinx.com/T/#me82b1444ab3776162cdb0077dfc9256365c7e736
>>>>
>>>> Changes in v3:
>>>> - Addressed Rob and Michal review comments:
>>>>   - Update DT example. 
>>>>
>>>> Review Comments:
>>>> https://lore.kernel.org/linux-arm-kernel/YRbBnRS0VosXcZWz@robh.at.kernel.org/
>>>> https://lore.kernel.org/linux-arm-kernel/d71ad7f9-6972-8cc0-6dfb-b5306c9900d0@xilinx.com/
>>>> ---
>>>>  .../bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml    | 41 ++++++++++++++++++++++
>>>>  .../bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml    | 43 ++++++++++++++++++++++
>>>>  1 file changed, 43 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml b/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml
>>>> new file mode 100644
>>>> index 0000000..1442815
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml
>>>> @@ -0,0 +1,43 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: "http://devicetree.org/schemas/gpio/xlnx,zynqmp-gpio-modepin.yaml#"
>>>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>>>> +
>>>> +title: ZynqMP Mode Pin GPIO controller
>>>> +
>>>> +description:
>>>> +  PS_MODE is 4-bits boot mode pins sampled on POR deassertion. Mode Pin
>>>> +  GPIO controller with configurable from numbers of pins (from 0 to 3 per
>>>> +  PS_MODE). Every pin can be configured as input/output.
>>> So, at Linux runtime, someone decides to boot the system into e.g. a USB
>>> recovery mode and then toggles the appropriate GPIOs and does a system
>>> reset?
>>>
>>> If so, are you aware of the reboot mode[1] infrastructure?
>>>
>>> A reboot-mode-gpio driver on top of this GPIO controller would allow you
>>> to describe the supported reboot modes in the device tree and instead of
>>> exporting GPIOs to userspace, users can then just do
>>>
>>> 	systemctl restart recovery
>>>
>>> to toggle the appropriate bits.
>>>
>>> Also to be sure: PS_MODE are actual GPIO pins that you could toggle
>>> board level components with, right? i.e. it's not just a register that
>>> overrides the values read from the boot mode pins? (In the latter case
>>> a syscon-reboot-mode without GPIO controller would be the correct
>>> abstraction).
>>>
>>> [1]: drivers/power/reset/reboot-mode.c
>>
>> Thanks for these links. I wasn't aware about it.
>> But this device/IP is not working like this. Changing gpios to certain
>> state won't ensure that on reboot/reset (done in whatever way) won't
>> stay on values you chose.
> 
> Ah, the "PS_MODE is 4-bits boot mode pins sampled on POR deassertion" part
> misled me. These pins are sampled on startup, but can afterwards be reused 
> via talking to firmware. Thanks for clearing this up.

yes

>> modepin gpio driver is at BOOT_PIN_CTRL 	0xFF5E0250
>>
>> (To be fair if you add additional external chip it could work like this
>> but I have never seen it).
> 
> Ye, that would've been strange, that's why I asked. :)

No issue at all.

> 
>> But when you bring this up. Xilinx ZynqMP is providing a way how to
>> setup alternative boot mode which is done via
>> BOOT_MODE_USER 	0xFF5E0200
>> Bit 8 and 15-12.
>> Then you can setup any bootmode.
>>
>> ZynqMP supports couple of modes listed here
>> https://source.denx.de/u-boot/u-boot/-/blob/master/arch/arm/mach-zynqmp/include/mach/hardware.h#L73
>>
>> but again routing to this register needs to be done via firmware
>> interface but it should be done via separate driver.
> 
> Yes.
> 
>> Is there an option to setup whatever modes you like?
>>
>> I mean to simply cover all modes like this?
>>
>> mode-jtag = <0>;
>> mode-sd = <3>;
>> mode-sd1 = <5>;
> 
> Yes, you can define the supported modes in the SoC dtsi
> and boards inherit that and can extend it as necessary.

ok.

> 
>> And then users/customers can say what normal/recovery/test modes are.
> 
> Yes, that would be nice. But after your clarification, I see that it's
> unrelated to this patch series. Binding is fine. Question on driver
> is still applicable.

I remember any discussion about it between Piyush and Linus and I will
let Piyush to handle it.

Thanks,
Michal
