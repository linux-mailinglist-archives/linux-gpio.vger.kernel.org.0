Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D6F53473A2
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 09:30:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233580AbhCXI33 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 04:29:29 -0400
Received: from mail-dm6nam11on2049.outbound.protection.outlook.com ([40.107.223.49]:11424
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233445AbhCXI32 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 24 Mar 2021 04:29:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RWv+UaUvbvBVKygnSqln4oQ8SGqZ0XpMeSMU1rbZLE3gnuuC4EAsZYIYG4ho/SiCi0xlTvXm1c9LBOhsbeAbD1QI0+uvLc3hcXyVNQuvH850kJa9ceovh3MnbM1LoKU3jUunsG6ph0ekARoiqJjFh+V5c+39vsP/B0itVH2ggR+vVJ+wR39lHtUHRIyl3ELCO7IdganPD0ePhi440gcsdT6fLAcZuFm/1zAZOGCn9Zmq19ncDLIoX5gZc7rClCQ9cM9RjdKPaw9jxRyTiOUSyGHV6tPIjXVSuEyo4/5tt3eRfmlIwUf4yC+MTwSqGRhkdlZLuPczVkCG++3xebfsjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AeCLMJdUc6yYv9Z02Dz3LWUkuNFkCAoXXZ61w8uCHJQ=;
 b=lrHYncDuTMPGbnPLcyN/qE2bQ2+YRkqaGWfrGoccTuDPE11wIvzalK3ZvN9eXl5x3M9Mxmppceig+xH89QwxKCgRpuFVTYsdS62ur7DAfv+hN7ZWOfuSfunLYojHqT4eQOm7uc4xJvlyyFAi86rwIFx48S06pDbQbry/tgDecBP2oNWWm8X3Y15pg+f7vz6jMTV6AHECgURkqm9WZ5MEb64CirddlUc2aKF7oUBxAowZQGbcU02aMOsy/xJU+MK35pExUO/PiCfpI6YyawoMH2anNnTekYaJbIjkJPwkpqiDIxpd+QR1EJnw+6ZzwpiXVvDYh4mOUPuV2CqWwTBzmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AeCLMJdUc6yYv9Z02Dz3LWUkuNFkCAoXXZ61w8uCHJQ=;
 b=dep+/Z5A9fsul0TdtCTdjvODfCvYhQXdQ8AXhX0xPsoWKPFOL3/XQpmGPbN7Rr/vriYyk63J+std0UasKj7nzF6AnSI7vyLfNbNP/nPsJgFJlnVsomFHDkATDE0uoXKbFi8ZanCziZS7vuoQRxW9Yg1pEzuh3NncVfRmIMaJeHc=
Received: from DS7PR03CA0047.namprd03.prod.outlook.com (2603:10b6:5:3b5::22)
 by MWHPR02MB2704.namprd02.prod.outlook.com (2603:10b6:300:112::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 24 Mar
 2021 08:29:26 +0000
Received: from DM3NAM02FT009.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:3b5:cafe::a8) by DS7PR03CA0047.outlook.office365.com
 (2603:10b6:5:3b5::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend
 Transport; Wed, 24 Mar 2021 08:29:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT009.mail.protection.outlook.com (10.13.5.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3977.25 via Frontend Transport; Wed, 24 Mar 2021 08:29:26 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 24 Mar 2021 01:29:17 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Wed, 24 Mar 2021 01:29:17 -0700
Envelope-to: git@xilinx.com,
 saikrishna12468@gmail.com,
 linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 robh+dt@kernel.org,
 linus.walleij@linaro.org,
 gregkh@linuxfoundation.org
Received: from [172.30.17.109] (port=36948)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1lOytA-0008TP-7b; Wed, 24 Mar 2021 01:29:16 -0700
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <git@xilinx.com>,
        <saikrishna12468@gmail.com>
References: <1615969516-87663-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1615969516-87663-4-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <YFnwN6mqXml5xdR3@kroah.com>
From:   Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v4 3/3] pinctrl: Add Xilinx ZynqMP pinctrl driver support
Message-ID: <e0a2c5b6-ff05-644c-8c88-b614a37b4929@xilinx.com>
Date:   Wed, 24 Mar 2021 09:29:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFnwN6mqXml5xdR3@kroah.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15d01e30-c927-4fd3-4993-08d8ee9eef9e
X-MS-TrafficTypeDiagnostic: MWHPR02MB2704:
X-Microsoft-Antispam-PRVS: <MWHPR02MB270467C955ED62AEEF97B77BC6639@MWHPR02MB2704.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0S4vtVY3mzbsVbZ4sYZEpu7z5AJf3HfKnH5++r6W59B0iG84xBhd1IccAMKDxNIGtzxjB6WvgwI6j/StN1bOJgKR3HSlixM2V1E5SyzbzmjLyKNJ98b2DyN9+WEKCs7CbvL7BpgpSRB3jMqAjPj3PDfJNVmFn0JHMPdJKXs8E/xikVaEeDJKuBzlF0PpUc/LOJiQyZMWeuwLJL1uhA0sBqT8BD+cR8dNfnDy+l61gfPxuGmEAk78ujm4gNj8Lcj/cEB5N9tXx7Dbk65Xn5vggL06B5ID7E/dumALSNPp6TR4WJmQ2mM3osxAsNtxE8FNfpeO/FGBxcUA1UX+P/Fb04zHtUBXp6DpUoqh94DgT20Vraod53zyyMEVQKNGPSCY0hVeiiVC2OIyhvwej7uxoRreGIEQxc012vh5blzd1sNsYqMvTWzd5ry+WIBKQQPThfIzp8z8DcQ9T5cwQS4h3UGTTqWJbh+BKyglopRz8h4uPzfpxAVQTo89gEnZgeH106Z1b4Ecx3U3qnZtDpFfU0t9AGao79pOoVVKHrNgD5GPNxBEzF8KOnHmoKjePbisvBi+IwQynt4eBAykF0p6fcu+bf2dMjgnKqol+AyYbrb7LmzdBmoC7UGRB27o8USgBpKB0iCCbk0L6rZkvfU9JzgzVRKqBzGFODYNqs+74W5H9WHvsmRsSn5WQxrLKe2WfVyA0pXYmtx3VPYqfQURWA==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(46966006)(36840700001)(5660300002)(8936002)(47076005)(82740400003)(478600001)(31686004)(356005)(83380400001)(9786002)(4326008)(7636003)(31696002)(54906003)(110136005)(70586007)(36906005)(2616005)(36756003)(8676002)(2906002)(6636002)(6666004)(36860700001)(26005)(82310400003)(426003)(53546011)(44832011)(186003)(70206006)(316002)(336012)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 08:29:26.4397
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15d01e30-c927-4fd3-4993-08d8ee9eef9e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT009.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2704
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 3/23/21 2:42 PM, Greg Kroah-Hartman wrote:
> On Wed, Mar 17, 2021 at 01:55:16PM +0530, Sai Krishna Potthuri wrote:
>> Adding pinctrl driver for Xilinx ZynqMP platform.
>> This driver queries pin information from firmware and registers
>> pin control accordingly.
>>
>> Signed-off-by: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
>> ---
>>  drivers/pinctrl/Kconfig          |   13 +
>>  drivers/pinctrl/Makefile         |    1 +
>>  drivers/pinctrl/pinctrl-zynqmp.c | 1030 ++++++++++++++++++++++++++++++
>>  3 files changed, 1044 insertions(+)
>>  create mode 100644 drivers/pinctrl/pinctrl-zynqmp.c
>>
>> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
>> index 815095326e2d..25d3c7208975 100644
>> --- a/drivers/pinctrl/Kconfig
>> +++ b/drivers/pinctrl/Kconfig
>> @@ -341,6 +341,19 @@ config PINCTRL_ZYNQ
>>  	help
>>  	  This selects the pinctrl driver for Xilinx Zynq.
>>  
>> +config PINCTRL_ZYNQMP
>> +	bool "Pinctrl driver for Xilinx ZynqMP"
> 
> Please make this work as a module.

The most of pinctrl drivers are builtin modules now which is not excuse
it is just fact.
$ git grep module_pla drivers/pinctrl/ | wc -l
40
$ git grep  builtin_pla drivers/pinctrl/ | wc -l
64

Also at least last 3 pinctrl drivers which have been merged are not modules.
d4c34d09ab03 ("pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA driver")
7e5ea974e61c ("pinctrl: pinctrl-microchip-sgpio: Add pinctrl driver for
Microsemi Serial GPIO")
a68a7844264e ("pinctrl: visconti: Add Toshiba Visconti SoCs pinctrl
support")

None is saying that it can't be done but that cases where you use
pinctrl as module are really very limited. When you start to use pinctrl
and its functionality you need to have it as the part of the kernel to
be to get console, mmc, ethernet, usb, etc.

That's why I would like to know what functionality and use case you have
in mind that this driver should be made module.

Thanks,
Michal

