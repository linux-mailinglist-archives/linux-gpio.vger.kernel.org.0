Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4624E327AD5
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Mar 2021 10:32:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233969AbhCAJcQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Mar 2021 04:32:16 -0500
Received: from mail-mw2nam10on2057.outbound.protection.outlook.com ([40.107.94.57]:57832
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233893AbhCAJcO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 1 Mar 2021 04:32:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D4aHAk4SHVAHxSE1+rDlQ827xBzVbhzB6tUOcYNPo38I2cQZTQvsvIruC1HYE/I6Ne4f9HnEVoVAsPhgR8wLUVArWxqj9zMo7JRzdEX1/ib/vYF2DLUCuvvG0vustZ3s9PMV7IBTsx8tHt+OTfwUrwIcUAJ182Lvq4SsdHJu+oWmyf51aH2ZnQEPxbQBhVKrLE/TCEuu0xxI1lOSsMu8ypD3lDwOn8Y1peegh/aAPvebsIPz0VJtfaXY1ZRc+cqY3WOZ/haEIWzwt0KKny2Oirt6pHjTqWajPEKQVv8mm4jH1pu8e9FbykWfXiJHpGgg+N10ZxByaMEOLMaC8l16rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bBKAieqS7ZIBNP2iVN6L6/u2dboXIroELkQ/hTsh+zo=;
 b=A4Y/m5OP8D/uGEBj4zqs9F+XG2k2jqECAAy3Jx+kLbTbD5Nvsm8FXJbtFP2Yyi/Kp37+bmB71OrhaHLMVnMt90LglOXAHKT3RCAxbglnsimuUxUEWpn3d5WmND9FxyQeGrvxiFYdtENtb4AGS6Hi1VPLx9Muka4iP4XP3KXCV0EOnaouInLz+aC84UFC6SiYxfdXDUaiejORgQh59Y4/FST9xLwTN5B9z/dPjHDowcw0DXhc5mrfo8E/i3rVFiOTLQYdvVuU/8JLMTEQaEOA6Ufq9F5x4n9rCHd1/eO1fyHkgeDkpVerYxkF4vuV+FXbaAcHuRTLaVbTYY66YOgZCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bBKAieqS7ZIBNP2iVN6L6/u2dboXIroELkQ/hTsh+zo=;
 b=ki0RXHJSMri9WFlmuHF8f/v8XMJhsfg/Pkd7ZGrGVCzG2x6CCXGREUjlhA01+TDDCI0qHK9025o03J4B26VmPH6n+wR94y704oBuXEVqCcvVFK+Cdk56VoPmySAN31/5Yq2Prpi/YAe3LE2REFyXgiXiXlDHOxHMeCUkGd7HABU=
Received: from CY4PR20CA0028.namprd20.prod.outlook.com (2603:10b6:903:cb::14)
 by DM6PR02MB6779.namprd02.prod.outlook.com (2603:10b6:5:216::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Mon, 1 Mar
 2021 09:31:22 +0000
Received: from CY1NAM02FT057.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:cb:cafe::a8) by CY4PR20CA0028.outlook.office365.com
 (2603:10b6:903:cb::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Mon, 1 Mar 2021 09:31:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT057.mail.protection.outlook.com (10.152.75.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3890.19 via Frontend Transport; Mon, 1 Mar 2021 09:31:22 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 1 Mar 2021 01:31:21 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 1 Mar 2021 01:31:21 -0800
Envelope-to: lakshmi.sai.krishna.potthuri@xilinx.com,
 michal.simek@xilinx.com,
 linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linus.walleij@linaro.org
Received: from [172.30.17.109] (port=41886)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1lGetd-0003XG-L4; Mon, 01 Mar 2021 01:31:21 -0800
To:     Linus Walleij <linus.walleij@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
References: <63d610ba-5f63-2be1-6215-f44bd88d94d2@xilinx.com>
 <CACRpkdZEYqPU6Zr+a6fivZiz-hKx6-KVdYVR7j--y+k2KXZaPw@mail.gmail.com>
From:   Michal Simek <michal.simek@xilinx.com>
Subject: Re: DT overlay applied via pinctrl description
Message-ID: <45cea3bb-6e5d-4005-ef2a-67b08772e0d7@xilinx.com>
Date:   Mon, 1 Mar 2021 10:31:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdZEYqPU6Zr+a6fivZiz-hKx6-KVdYVR7j--y+k2KXZaPw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 244bddb8-af2f-41bd-2538-08d8dc94c6da
X-MS-TrafficTypeDiagnostic: DM6PR02MB6779:
X-Microsoft-Antispam-PRVS: <DM6PR02MB67796382D0EA03247323641AC69A9@DM6PR02MB6779.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PckH0JCXXmXdSLrFYBjHx8rOSt45jx9/2x5AcbsQ4wpk/tm0J9k3EtCi+DqhekEOaBaEpxW9XnVx538S4i9KmkOROEsQZfObrxKMPZ7RubcRWDoPTchizKTzlfZAI326ATy7lJbSJUfl/w59l+/MszaDb74ZiF8lSPIb5C22lzWh5UKKe6G2FtAOTL7k/PC3BAX0bub/1cP2V3DVx1anhlF5f29rKUT+0fbKb+p/DXhmFZP0VqYvgVQiuV5Ea5PK42LJc5PGFGLZYsj/j9DsFY4EVqyAgegV7rsMhGEDijWpx9jsCtXd8D9uyijIyokD69dNopxc/ZGhGDCCFnL/fMaKxRfIjdpmuR9cVjtCjdxv2TbPGVBPdNzwtQJrA/Ia+BzyXPR1Hzf58clYTwi5MTB4x+K7S5nrh1rPEtbLhGjTgpJIWjbRyt/goc0YrRgk3Hbyzz7adiutpVqLRSbXNI9HDli+JI8fKDzziLvtc1W/gMEZR4QceaAIr5hLfwYK47Tc+/IGzHYSrPg9lgmH5bT3zg94HUhfsyof6VP5DFGnsccL5hHR7++VrFgVoYGvDpxSZOI64aTj4+uuLYOz7yULicMcrdmKmQkPnoDzIjZ2GQKttPuG1Lqr3csK7x31D6v5pozLdLfDqvG9rFlK3cDMmcFzC220qfdrHY7SmWmgnrLhquuEr+cOhCQTSE14dsKgsnTZ2tlIE/dD3KKzGg==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(39850400004)(36840700001)(46966006)(70586007)(47076005)(70206006)(110136005)(8936002)(54906003)(316002)(36860700001)(82310400003)(36906005)(4326008)(9786002)(2906002)(8676002)(107886003)(53546011)(7636003)(356005)(83380400001)(31696002)(36756003)(31686004)(44832011)(82740400003)(478600001)(2616005)(186003)(336012)(26005)(5660300002)(426003)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 09:31:22.1761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 244bddb8-af2f-41bd-2538-08d8dc94c6da
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT057.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6779
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On 3/1/21 10:19 AM, Linus Walleij wrote:
> On Tue, Feb 16, 2021 at 4:35 PM Michal Simek <michal.simek@xilinx.com> wrote:
> 
>> I have a question about expectations when pinctrl setting is applied. In
>> DTS all nodes are described in the order available in DT.
>>
>> uart-default {
>>         mux {
>>                 ...
>>         };
>>
>>         conf {
>>                 ...
>>         };
>> };
>>
>> I don't know if this standard description or not. I definitely see other
>> pinctrl drivers which are using different structure.
>>
>> Anyway when overlay is applied the order has changed to
>> uart-default {
>>         conf {
>>                 ...
>>         };
>>
>>         mux {
>>                 ...
>>         };
>> };
>>
>> which is causing issue because pin is configured first via conf node
>> before it is requested via mux. This is something what firmware is
>> checking and error out.
> 
> As Frank says the DT ordering has no semantic meaning, it is essentially
> a functional language, describes object relations not sequences.
> 
> The Linux kernel applies the mux and conf in that order because of how
> the code is implemented (this order also makes a lot of sense for the
> hardware). I would recommend to trace the execution of an overlay
> being applied and try to find the reason conf goes before mux and fix
> the bug there. I think it is a bug in how pinctrl handles DT overlays.

Does this mean that you prefer to fix how dt overlay applying instead of
fixing code to apply mux configs first before conf one?

Something like this? (just c&p patch below)

Thanks,
Michal

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 7d3370289938..cf56ee5d7e02 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1258,13 +1258,35 @@ static int pinctrl_commit_state(struct pinctrl
*p, struct pinctrl_state *state)

        p->state = NULL;

-       /* Apply all the settings for the new state */
+       /* Apply all the settings for the new state - pinmux first */
        list_for_each_entry(setting, &state->settings, node) {
                switch (setting->type) {
                case PIN_MAP_TYPE_MUX_GROUP:
                        ret = pinmux_enable_setting(setting);
                        break;
                case PIN_MAP_TYPE_CONFIGS_PIN:
+               case PIN_MAP_TYPE_CONFIGS_GROUP:
+                       break;
+               default:
+                       ret = -EINVAL;
+                       break;
+               }
+
+               if (ret < 0) {
+                       goto unapply_new_state;
+               }
+
+               /* Do not link hogs (circular dependency) */
+               if (p != setting->pctldev->p)
+                       pinctrl_link_add(setting->pctldev, p->dev);
+       }
+
+       /* Apply all the settings for the new state - pinconf after */
+       list_for_each_entry(setting, &state->settings, node) {
+               switch (setting->type) {
+               case PIN_MAP_TYPE_MUX_GROUP:
+                       break;
+               case PIN_MAP_TYPE_CONFIGS_PIN:
                case PIN_MAP_TYPE_CONFIGS_GROUP:
                        ret = pinconf_apply_setting(setting);
                        break;


