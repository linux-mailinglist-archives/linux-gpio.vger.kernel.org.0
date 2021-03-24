Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FBEB34741F
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 10:06:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234223AbhCXJF6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 05:05:58 -0400
Received: from mail-bn8nam11on2059.outbound.protection.outlook.com ([40.107.236.59]:25728
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234439AbhCXJF0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 24 Mar 2021 05:05:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R+a3XZQ8xlthpFd5BbVtPGgon2AN5bGE2q5Ge983sox9fjZZaEphJnzCZg6+mNaTkMXsgEoedxA6YKaQvtd15l0qKb8BasY1yww4H0mDlz9eTUUYwCsvxVww5b6mgbv93nKnJMDPzaHJEvq/qX1sXs4DMYSTFfiyoGyryFY1ilA5bgZMAAhTYGdsC37SNplm5CsAxbWC1PfnwfkoakaxGNzbJwBoHPcC0jMwtLjLVqBm10LloXvt0FFazFH2Q/090uP6Mpg9tSLg8wQQXuqS2r50pR6uNwXCJ3kDJRmQ3k7gxyDmp41ouQvXiyT1fdTnFJn00inypNCBbWlGl0sS7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xdkamxj2OeEmRdbLPqwrFPH0JsOH6yfL9o3BfTV30zQ=;
 b=MaGMiUmSoAZ9XJJPJ03JRGcsbfqONyPiIkLZqvlaVVMhoeY4dDAr/fRqzg7knqQwMNvstcq7IxuGXw7PJYaOz3NM/2yytjSYfJK3VH60psM102P49q6nt/jOPDH3IUIqLofBc0gz0qv9tkz9m+3UJP57Jo/a8eN8TmrdIDm5tKuvSd3QBTsFSSXk89gpkHqfQ6nMpAEXj/x+aEVa7iPTCup8eTzWxEx1L7eGGMp+j/ygKwUKpOK9O7poPJDs59fKKx29Jv00Rr5XhhlNusqGS1+cGP20259NHB1C9pXuHvlCHYZkCldrJsBzU1ZL6intCBSjifZiMvPG4hG9WMJ6QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xdkamxj2OeEmRdbLPqwrFPH0JsOH6yfL9o3BfTV30zQ=;
 b=ZMU7uFaiNFvsVQjXjoc8AuJGdeEHOvaJTtzUs69IuAK72t1QzITeCrcSE1vYbmoZOY6NLuKoHzXrc4I7uCunEDL6H1BYYkRJUmcodxL5LDNgxqpwDUqBS5oRzHz2XIrRGki6KTlIr1Hia3cvuVo/bN7e4Hv2SgCQVk0u+2c+p/s=
Received: from SA9PR13CA0154.namprd13.prod.outlook.com (2603:10b6:806:28::9)
 by SA0PR02MB7308.namprd02.prod.outlook.com (2603:10b6:806:d8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 24 Mar
 2021 09:05:23 +0000
Received: from SN1NAM02FT060.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:28:cafe::41) by SA9PR13CA0154.outlook.office365.com
 (2603:10b6:806:28::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.10 via Frontend
 Transport; Wed, 24 Mar 2021 09:05:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT060.mail.protection.outlook.com (10.152.72.192) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3977.25 via Frontend Transport; Wed, 24 Mar 2021 09:05:23 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 24 Mar 2021 02:05:19 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Wed, 24 Mar 2021 02:05:19 -0700
Envelope-to: git@xilinx.com,
 saikrishna12468@gmail.com,
 linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 robh+dt@kernel.org,
 linus.walleij@linaro.org,
 gregkh@linuxfoundation.org
Received: from [172.30.17.109] (port=40276)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1lOzPk-0003tk-Iu; Wed, 24 Mar 2021 02:02:56 -0700
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michal Simek <michal.simek@xilinx.com>
CC:     Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <git@xilinx.com>,
        <saikrishna12468@gmail.com>
References: <1615969516-87663-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1615969516-87663-4-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <YFnwN6mqXml5xdR3@kroah.com>
 <e0a2c5b6-ff05-644c-8c88-b614a37b4929@xilinx.com>
 <YFr9GqNmYuEG2OvZ@kroah.com>
From:   Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v4 3/3] pinctrl: Add Xilinx ZynqMP pinctrl driver support
Message-ID: <dabcfe43-568a-66c1-642e-eef065f9b5ab@xilinx.com>
Date:   Wed, 24 Mar 2021 10:02:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFr9GqNmYuEG2OvZ@kroah.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97a4a484-64d1-43e1-4ee1-08d8eea3f573
X-MS-TrafficTypeDiagnostic: SA0PR02MB7308:
X-Microsoft-Antispam-PRVS: <SA0PR02MB73086DA4BD7B5C43398357E8C6639@SA0PR02MB7308.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NBdelFtQiHCo7zjGjCbNCGgRl14NOG9gtq246sncX+tKvU4MrOQmVIfYeUZFwtKx3qDjUxZs8hU7wP6DsEcsrhc30YV7E4MwnXQwukWjjxItSnw+928XY3Hhd7lBoCbzttWDnoUixfeGu7LxtWxo7rhjgHQ29rIoxf8XPoNnl93DsPzoZ8FSZBCNLwPjKZxSFY+zAVQeFESx1kby7pf7NV9m1E9JBUItoxnun+cnx/efd82rQrIyYSBgEHMxCspaesNRpeWRJE+7L7GE41w0+UFlBJ0/G+DdPbi8XiEGTMJ4zt/fDClpRXKbes0AK+UArudPONHw4ASrl089VDr6ZUOTk0C7P0BZdrg2k8KDh4tapJfJLoxDFKg7y1D3MGxXWO33K5M15uqIwM3QHimCu/tYsGNMaW5w7dZX3tBH3/q9+tJ5Q5X2qYkuXqBbtkHCq5g6Mp0LW7mIK1RjLazn+cWHwr5EQqatufntNj4Vfgi00QYw84CqUg/K8i7K3Zrb7Lh07xsrSIHcSeM7+oLZYp6c0TVVP9Yt5uutmvlFUEkexGhLSc0vtQuJtbmsIU9qQoZfxKpvcplb9rCkT9M2T2kz9r82CovQ8JYJ7XA/31sTcQJ1XRm8kGGDpEdqMMLxZvVPGIR9C0osrswPPwNNbTmwjm2v8TbUTcvi50U+qUr5rA8WkVkE6mABp74jL86a44XvP/REzS2byWaT5Xe42A==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(376002)(39860400002)(346002)(396003)(36840700001)(46966006)(54906003)(336012)(316002)(4326008)(53546011)(426003)(110136005)(44832011)(186003)(356005)(26005)(82740400003)(5660300002)(7636003)(36756003)(2616005)(6666004)(9786002)(36906005)(82310400003)(70586007)(8936002)(31696002)(478600001)(83380400001)(36860700001)(8676002)(2906002)(70206006)(31686004)(47076005)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 09:05:23.7176
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97a4a484-64d1-43e1-4ee1-08d8eea3f573
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT060.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7308
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 3/24/21 9:49 AM, Greg Kroah-Hartman wrote:
> On Wed, Mar 24, 2021 at 09:29:12AM +0100, Michal Simek wrote:
>> On 3/23/21 2:42 PM, Greg Kroah-Hartman wrote:
>>> On Wed, Mar 17, 2021 at 01:55:16PM +0530, Sai Krishna Potthuri wrote:
>>>> Adding pinctrl driver for Xilinx ZynqMP platform.
>>>> This driver queries pin information from firmware and registers
>>>> pin control accordingly.
>>>>
>>>> Signed-off-by: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
>>>> ---
>>>>  drivers/pinctrl/Kconfig          |   13 +
>>>>  drivers/pinctrl/Makefile         |    1 +
>>>>  drivers/pinctrl/pinctrl-zynqmp.c | 1030 ++++++++++++++++++++++++++++++
>>>>  3 files changed, 1044 insertions(+)
>>>>  create mode 100644 drivers/pinctrl/pinctrl-zynqmp.c
>>>>
>>>> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
>>>> index 815095326e2d..25d3c7208975 100644
>>>> --- a/drivers/pinctrl/Kconfig
>>>> +++ b/drivers/pinctrl/Kconfig
>>>> @@ -341,6 +341,19 @@ config PINCTRL_ZYNQ
>>>>  	help
>>>>  	  This selects the pinctrl driver for Xilinx Zynq.
>>>>  
>>>> +config PINCTRL_ZYNQMP
>>>> +	bool "Pinctrl driver for Xilinx ZynqMP"
>>>
>>> Please make this work as a module.
>>
>> The most of pinctrl drivers are builtin modules now which is not excuse
>> it is just fact.
>> $ git grep module_pla drivers/pinctrl/ | wc -l
>> 40
>> $ git grep  builtin_pla drivers/pinctrl/ | wc -l
>> 64
> 
> For new ones, we can do better, don't make us have to go back and fix
> this up later.

As I said not a big deal. If this is the way to go then I these rules
should be followed which is not what it is happening based on 3 latest
pinctrl drivers below.

> 
>> Also at least last 3 pinctrl drivers which have been merged are not modules.
>> d4c34d09ab03 ("pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA driver")
>> 7e5ea974e61c ("pinctrl: pinctrl-microchip-sgpio: Add pinctrl driver for
>> Microsemi Serial GPIO")
>> a68a7844264e ("pinctrl: visconti: Add Toshiba Visconti SoCs pinctrl
>> support")
>>
>> None is saying that it can't be done but that cases where you use
>> pinctrl as module are really very limited. When you start to use pinctrl
>> and its functionality you need to have it as the part of the kernel to
>> be to get console, mmc, ethernet, usb, etc.
>>
>> That's why I would like to know what functionality and use case you have
>> in mind that this driver should be made module.
> 
> The "functionality" of building a kernel image that works on all
> hardware types.  Just like x86-64 has been for a very long time :)

ok.

Thanks,
Michal
