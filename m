Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00D393F00B3
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Aug 2021 11:38:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233192AbhHRJjW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Aug 2021 05:39:22 -0400
Received: from mail-co1nam11on2046.outbound.protection.outlook.com ([40.107.220.46]:48224
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234006AbhHRJjW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 18 Aug 2021 05:39:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lfWB8aIULQeR/IZEUgWkRaNaaF/gcjksEkhrjG5RK+aOvQQtTB5i0mZx0afMYVDNqqZGE/s/OdLtelOOGXLBeM59dhTqp7zt5k8jIBIw4dqFs4rqflbzpwZ5R6NjJ/ZZZJnDwJTAabTDjG+1FQmF0AV7KLY/79cHDlWXlljO19AYzQvfuxlQr9lv2rDZ0PaquOp4KuX6qG/fLqGDa+uCSUdqMrx1dg1Jhebf43UNLY7zbTWVs456/2OfI7Zt+BQUsqsoOBXY+8k+uFOexGyT0dr10ns+i34OM5s5SlASOgmx/mBcTSpZ+Dmxba/UWeqrEuNEzID7R05xOA5awT0iFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMIbYGIRWb9dLiKaXZkMS1aqBdx7eMZKLvBJaK6+hpw=;
 b=GsyuTkWrZAgU5MToy841rXbGUCEeRFdWXLbwMdQscRR5Jo7XNVW2E94CkkXovw0aDD2OvwDT70AwHWs6lbAXjt9fw1/uLm50EBWyVl6WtamUswwrfnt7wIfaiMEugrxE3rhI14x0oaCABNx7fayj9rHuqEIzru1PuXde/+aK8RPQ128Piyb2KnhDuUbQdyya3KLhIIxStB5kFS4CH6NmCRtEasVyY17NhIRzOYgsqkNQD0W5LwpYQK+IsJM+Uew1+2YL6AcB/t6v1GBEYsMfk3XloaQRDeGqYGnmxsJu/cwZ9Xj/U/02iSbJcaYw5wEh5te1sF7zyn5yCGeBvA6m1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMIbYGIRWb9dLiKaXZkMS1aqBdx7eMZKLvBJaK6+hpw=;
 b=BFvwxzOT5EDk4KuIvS4bVA8B9tQ00FUk48kVZ/+cfFMFJq9FMjZcZVIc3DFv3migNVKyEE7rJKv7/gnsnGpucOvlCybwRyS92THr+8DU4iDUKlFMvhTHzX/3lM7XTngBiXXaE9zi7DZ2pf7ntUHI6SgGgOpX1BqA8PXH3nXbQro=
Received: from DS7PR05CA0006.namprd05.prod.outlook.com (2603:10b6:5:3b9::11)
 by BL0PR02MB5620.namprd02.prod.outlook.com (2603:10b6:208:87::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.21; Wed, 18 Aug
 2021 09:38:45 +0000
Received: from DM3NAM02FT033.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:3b9:cafe::43) by DS7PR05CA0006.outlook.office365.com
 (2603:10b6:5:3b9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.9 via Frontend
 Transport; Wed, 18 Aug 2021 09:38:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT033.mail.protection.outlook.com (10.13.4.101) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Wed, 18 Aug 2021 09:38:44 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 18 Aug 2021 02:38:43 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 18 Aug 2021 02:38:43 -0700
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
Received: from [172.30.17.109] (port=35812)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1mGI1y-0006A6-CM; Wed, 18 Aug 2021 02:38:42 -0700
Subject: Re: [PATCH V3 2/3] dt-bindings: gpio: zynqmp: Add binding
 documentation for modepin
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Piyush Mehta <piyush.mehta@xilinx.com>, <arnd@arndb.de>,
        <zou_wei@huawei.com>, <gregkh@linuxfoundation.org>,
        <linus.walleij@linaro.org>, <michal.simek@xilinx.com>,
        <wendy.liang@xilinx.com>, <iwamatsu@nigauri.org>,
        <bgolaszewski@baylibre.com>, <robh+dt@kernel.org>,
        <rajan.vaja@xilinx.com>
CC:     <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <git@xilinx.com>, <sgoud@xilinx.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20210818081018.2620544-1-piyush.mehta@xilinx.com>
 <20210818081018.2620544-3-piyush.mehta@xilinx.com>
 <5e44ee87-f727-99fd-9860-d3d58a035dc4@pengutronix.de>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <50e468b1-9a32-0017-bd6a-8d47c3fa1a9c@xilinx.com>
Date:   Wed, 18 Aug 2021 11:38:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <5e44ee87-f727-99fd-9860-d3d58a035dc4@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c4c9b6e-eca5-4bf4-727a-08d9622bf906
X-MS-TrafficTypeDiagnostic: BL0PR02MB5620:
X-Microsoft-Antispam-PRVS: <BL0PR02MB562068589CF8A5F04254C4EAC6FF9@BL0PR02MB5620.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uYeEDh3Gb30utm1CW24qNLgI/K/EssY5rzg3yZyY7Mw9DIyM5tMiDUDVodaaIjMmyebK6vLl8b+VCtWBJIpCTYPrNemM7rbbThAfpJsNoLSn1dTBMmbG5L/GrjFYHF0ossIyWLgmaO01KIPbMe0L6qJPrTn1oM9LP3LO1962Qou74SYyxEfFYlC2JzBGpQqmLXQIjpGhg2BbPITWJGJB4C5R0W4yBJls7LvSXL9Q/05PDuM8CDqPTQ9HhR8lyGUMClJ1OXbfZxrZpOHODzFdfp1zcZyAKXXEseowYEuFRWCG/1uwBPBs8mToDVBwktK/0JCCUFN2z19fZ0nJLziasmOZG8b6sjjFbvbTr+YwntHYZ7HVGR2dFbq/CtyVpf9Qkt/KngVafNnh7wf/eIlOUaW4jrl0sETQSl4ozP8G/1szTjW5ZWebjWFjiIGY7pvPkYCbC4qcodUUeXXRagxzgK58WcuFI3wPJaqRoHZ9PVIa5TK/FXLkzHG0CvzB5r/aTVS35BS6cAt1qt0crwB1y+3yj2w0mbzFj7q2stD7EmH5Od1wEQ15Z9kEL65RLgi3AKc5JkKt1HUwswO5RuqqWu4d2fSYZjMjiUzFwXH1SNw3sasjj+a4pxxUhqByD9FUydx61p+k2VdfS3hSNczpOQNnocBHAHt1kdDfBA2l2AuMlGfN9pgxEFrSBHtBb/cPEAmd0AlyGQYdvBowtHvIleUmdt4VKnKSOuTyU4nhZlu+9xZ9Q8i2yOQcSuaIXJu68a/R3PE3zNnBNK3p+jIg5UqZSldNB4GUgyR1YUS3LZcuzzB7lnIN9uEWUR5CFkysISjHWWnSFXZ+Q0b7wEUWb+GW4Dpv21mlJ/rJ/5SwwvgNgiM3fF8JeaKS2AID2vYaTYNIwSCOCq06pymO0+YahoH+QWyRf8+BEAlDbrXH6vdz5bYlK1JAGJKQHq7oFXRK
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(46966006)(36840700001)(54906003)(7636003)(6636002)(82740400003)(82310400003)(8676002)(47076005)(316002)(36906005)(53546011)(31696002)(110136005)(426003)(36756003)(336012)(6666004)(26005)(186003)(356005)(31686004)(83380400001)(7416002)(44832011)(966005)(4326008)(5660300002)(921005)(70206006)(2906002)(36860700001)(9786002)(8936002)(478600001)(2616005)(70586007)(50156003)(43740500002)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 09:38:44.9791
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c4c9b6e-eca5-4bf4-727a-08d9622bf906
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT033.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB5620
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Ahmad,

On 8/18/21 11:00 AM, Ahmad Fatoum wrote:
> On 18.08.21 10:10, Piyush Mehta wrote:
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
>> Acked-by: Michal Simek <michal.simek@xilinx.com>
>> ---
>> Changes in v2:
>> - Addressed review comments: Update commit message
>>
>> Review Comments:
>> https://lore.kernel.org/linux-arm-kernel/20210615080553.2021061-2-piyush.mehta@xilinx.com/T/#mbd1fbda813e33b19397b350bde75747c92a0d7e1
>> https://lore.kernel.org/linux-arm-kernel/20210615080553.2021061-2-piyush.mehta@xilinx.com/T/#me82b1444ab3776162cdb0077dfc9256365c7e736
>>
>> Changes in v3:
>> - Addressed Rob and Michal review comments:
>>   - Update DT example. 
>>
>> Review Comments:
>> https://lore.kernel.org/linux-arm-kernel/YRbBnRS0VosXcZWz@robh.at.kernel.org/
>> https://lore.kernel.org/linux-arm-kernel/d71ad7f9-6972-8cc0-6dfb-b5306c9900d0@xilinx.com/
>> ---
>>  .../bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml    | 41 ++++++++++++++++++++++
>>  .../bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml    | 43 ++++++++++++++++++++++
>>  1 file changed, 43 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml b/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml
>> new file mode 100644
>> index 0000000..1442815
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml
>> @@ -0,0 +1,43 @@
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
> So, at Linux runtime, someone decides to boot the system into e.g. a USB
> recovery mode and then toggles the appropriate GPIOs and does a system
> reset?
> 
> If so, are you aware of the reboot mode[1] infrastructure?
> 
> A reboot-mode-gpio driver on top of this GPIO controller would allow you
> to describe the supported reboot modes in the device tree and instead of
> exporting GPIOs to userspace, users can then just do
> 
> 	systemctl restart recovery
> 
> to toggle the appropriate bits.
> 
> Also to be sure: PS_MODE are actual GPIO pins that you could toggle
> board level components with, right? i.e. it's not just a register that
> overrides the values read from the boot mode pins? (In the latter case
> a syscon-reboot-mode without GPIO controller would be the correct
> abstraction).
> 
> [1]: drivers/power/reset/reboot-mode.c

Thanks for these links. I wasn't aware about it.
But this device/IP is not working like this. Changing gpios to certain
state won't ensure that on reboot/reset (done in whatever way) won't
stay on values you chose.

modepin gpio driver is at BOOT_PIN_CTRL 	0xFF5E0250

(To be fair if you add additional external chip it could work like this
but I have never seen it).


But when you bring this up. Xilinx ZynqMP is providing a way how to
setup alternative boot mode which is done via
BOOT_MODE_USER 	0xFF5E0200
Bit 8 and 15-12.
Then you can setup any bootmode.

ZynqMP supports couple of modes listed here
https://source.denx.de/u-boot/u-boot/-/blob/master/arch/arm/mach-zynqmp/include/mach/hardware.h#L73

but again routing to this register needs to be done via firmware
interface but it should be done via separate driver.
Is there an option to setup whatever modes you like?

I mean to simply cover all modes like this?

mode-jtag = <0>;
mode-sd = <3>;
mode-sd1 = <5>;
etc

And then users/customers can say what normal/recovery/test modes are.

Thanks,
Michal
