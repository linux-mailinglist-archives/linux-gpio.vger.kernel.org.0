Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 124FE347458
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 10:17:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbhCXJRT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 05:17:19 -0400
Received: from mail-bn8nam11on2089.outbound.protection.outlook.com ([40.107.236.89]:7937
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231810AbhCXJQ7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 24 Mar 2021 05:16:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J/f74B1r5il/iQpSRoo1uqkBVWfDln7G3zmvbvap9ZYALqmTwwbyK0aGlmykcbYHX/MoSOELLGPC+NmVXcBSYV/bdXWRYaxdIjJWHJRbpK5DG3f3gQfCHFQpqV5hLWHgQ48E61M8VoUS9LhHjKFcdKF3+4yWJLIR6LBe5ual+QyWR6hWE+bqHZU/zDLqtZndGuSrEWN6n2h1dIV0D0tlTa4sRwYzkc787GAHQEbahK9/Hzb+rwslngmUCeODs/20C3Ka6F9BUtDrNnrib3ZbLwkVsB6rOMyoG3lspb3aYQPG8wX5F07BYosVXMxih3tdkyjAF6T5d3ETqOJhLnBaeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btDLk4nsag6tY6O9Rvn/TgSeNZHj6iJHjseqtf4kKc0=;
 b=kKrjjuyKRmcycZ08PQPreOAGBS4K/R58GiwZuvyOJl7YqWMBgiwuvQAGXYq9tyeqTB6foUIX4pKyGo/2ka+wGNziwkFrGb1kwDVo6ET8LqwitUylhhdjrT8rqYtBmjq/bjbD90bjdLo3w2o6eJhIHdzDTBqOPmCdA3XP4yrEjxkLG+cJsfW4nee0b13cVM+cQ7hE0mvYQjQlqp6Wkd8H8U2AAztfs5kiA2dtfEDKm0pHb0Ch6so1ZOOW36hH+0DP6A9w1EeL0sKxZmVIOeNEN77EBB4CJVeuUHO5yP3hVLLNDoi8CbPbSRp2ITjmO8RJyG0GK9ynoWm5Cw0MJ9SPqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btDLk4nsag6tY6O9Rvn/TgSeNZHj6iJHjseqtf4kKc0=;
 b=nMNquOPnbvylxWtASiTmkA9mag7SFn8cEW7u2zXGtfUPBoSpDHfCfhFhM1vpDTFI0ubEvslxraP6/94Pk3gNDIYggNtuVV+uDAwB/wkCVDhrKGGRNuMpcbDHANnJGIf0wLkDcVZuMolgzIkAVnR+B3Y+geT+HGCh5rd+SuCPEf4=
Received: from SN4PR0401CA0017.namprd04.prod.outlook.com
 (2603:10b6:803:21::27) by BL0PR02MB4900.namprd02.prod.outlook.com
 (2603:10b6:208:5d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24; Wed, 24 Mar
 2021 09:16:55 +0000
Received: from SN1NAM02FT004.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:21:cafe::72) by SN4PR0401CA0017.outlook.office365.com
 (2603:10b6:803:21::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend
 Transport; Wed, 24 Mar 2021 09:16:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT004.mail.protection.outlook.com (10.152.72.175) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3977.25 via Frontend Transport; Wed, 24 Mar 2021 09:16:54 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 24 Mar 2021 02:16:33 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Wed, 24 Mar 2021 02:16:33 -0700
Envelope-to: git@xilinx.com,
 saikrishna12468@gmail.com,
 linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 robh+dt@kernel.org,
 linus.walleij@linaro.org,
 gregkh@linuxfoundation.org
Received: from [172.30.17.109] (port=41536)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1lOzcu-0006Pn-1U; Wed, 24 Mar 2021 02:16:32 -0700
Subject: Re: [PATCH v4 3/3] pinctrl: Add Xilinx ZynqMP pinctrl driver support
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
 <dabcfe43-568a-66c1-642e-eef065f9b5ab@xilinx.com>
 <YFsCyGO1cLcM7IG0@kroah.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <eb4b54c7-4a90-b1fc-b946-b2ad555dd522@xilinx.com>
Date:   Wed, 24 Mar 2021 10:16:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFsCyGO1cLcM7IG0@kroah.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34ba11a2-9ac7-4d86-780a-08d8eea59148
X-MS-TrafficTypeDiagnostic: BL0PR02MB4900:
X-Microsoft-Antispam-PRVS: <BL0PR02MB490051AC408ACD7B50442EA5C6639@BL0PR02MB4900.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5MOTqmjuyoeFnsADVAqfRbrjz/jybXYG6rd4EXKPQOWJxV/bMyaMhyu5UjpelxyVFMdc95onK2FfPn64phdwb5vJRl8XstRcPfPGQN3TClYC8uQOdse3XBE07+tNrYgSx6WMC6UaPz0xxNQFeZw8iV3rxImt8aN4+/pmd4gTCf6s0ZaMp2N3KE/rUIBqSwwKLadDmOxTtWJMI7dQInTwqAGeq/MXP4FdcrSAaQh8MPE0RVH7ZZDLem5ktJrUpKIE2NLOtaDiZ0rwoXzFWsNpct1xnh4/1s/xF/4lNbzPDh6xtDp7E3M0ziFpYLH0Zq7mUYSvVibaJOP95B3TDzfM1b3GSic/dJt4sgOPRw3bmf0f1uHq5vMEP68bT6yTH3Wgal1K9vmbJddgkxIW2qOXeV7K+CKEupv4rdrMZeFeq8gMgw6UZnzZLAHabC6p7I3wke/RwqmmLV2fj71WgbqAEkTsplNQ40r2DJteiAwtvPkmtRlkbQNDjAav7FgBz52GS44OI2QzTEIqvGhzrQjo4SYc8YoH05HVY/m2ThL6zhdd6/abjOgtjkAJGeomDPR86TyoJ29MNZw4JIxvFDKhPeeh+AyNRdSRfsMuKwT8iyRwWf1rxgov4zMsMMImmP8Nsa9l/PHyuu0tZZcfFIaQ+nGHwaGGPj5ynfnLYErlxlptrXXFA0ISNvLA+dFtvLxfDTgLEcQ/6GOeprSHYxLwEA==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(46966006)(36840700001)(110136005)(36756003)(26005)(5660300002)(7636003)(8936002)(316002)(31696002)(336012)(9786002)(36860700001)(8676002)(6666004)(31686004)(426003)(82310400003)(47076005)(2616005)(356005)(53546011)(70206006)(186003)(82740400003)(44832011)(54906003)(478600001)(4326008)(70586007)(36906005)(2906002)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 09:16:54.6585
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ba11a2-9ac7-4d86-780a-08d8eea59148
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT004.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4900
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 3/24/21 10:13 AM, Greg Kroah-Hartman wrote:
> On Wed, Mar 24, 2021 at 10:02:53AM +0100, Michal Simek wrote:
>>
>>
>> On 3/24/21 9:49 AM, Greg Kroah-Hartman wrote:
>>> On Wed, Mar 24, 2021 at 09:29:12AM +0100, Michal Simek wrote:
>>>> On 3/23/21 2:42 PM, Greg Kroah-Hartman wrote:
>>>>> On Wed, Mar 17, 2021 at 01:55:16PM +0530, Sai Krishna Potthuri wrote:
>>>>>> Adding pinctrl driver for Xilinx ZynqMP platform.
>>>>>> This driver queries pin information from firmware and registers
>>>>>> pin control accordingly.
>>>>>>
>>>>>> Signed-off-by: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
>>>>>> ---
>>>>>>  drivers/pinctrl/Kconfig          |   13 +
>>>>>>  drivers/pinctrl/Makefile         |    1 +
>>>>>>  drivers/pinctrl/pinctrl-zynqmp.c | 1030 ++++++++++++++++++++++++++++++
>>>>>>  3 files changed, 1044 insertions(+)
>>>>>>  create mode 100644 drivers/pinctrl/pinctrl-zynqmp.c
>>>>>>
>>>>>> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
>>>>>> index 815095326e2d..25d3c7208975 100644
>>>>>> --- a/drivers/pinctrl/Kconfig
>>>>>> +++ b/drivers/pinctrl/Kconfig
>>>>>> @@ -341,6 +341,19 @@ config PINCTRL_ZYNQ
>>>>>>  	help
>>>>>>  	  This selects the pinctrl driver for Xilinx Zynq.
>>>>>>  
>>>>>> +config PINCTRL_ZYNQMP
>>>>>> +	bool "Pinctrl driver for Xilinx ZynqMP"
>>>>>
>>>>> Please make this work as a module.
>>>>
>>>> The most of pinctrl drivers are builtin modules now which is not excuse
>>>> it is just fact.
>>>> $ git grep module_pla drivers/pinctrl/ | wc -l
>>>> 40
>>>> $ git grep  builtin_pla drivers/pinctrl/ | wc -l
>>>> 64
>>>
>>> For new ones, we can do better, don't make us have to go back and fix
>>> this up later.
>>
>> As I said not a big deal. If this is the way to go then I these rules
>> should be followed which is not what it is happening based on 3 latest
>> pinctrl drivers below.
> 
> I do not disagree, but I point out issues when I see them, you got
> unlucky :)

I feel we were lucky that our driver got your attention and we do it
properly from the beginning. :-)

Thanks,
Michal
