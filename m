Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEF02337159
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Mar 2021 12:29:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232562AbhCKL3H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Mar 2021 06:29:07 -0500
Received: from mail-dm6nam10on2085.outbound.protection.outlook.com ([40.107.93.85]:60672
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232502AbhCKL2p (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 11 Mar 2021 06:28:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cX56yNedxC4kbE5xM0RZB7Ka0TvD/kLWH5pbvkGAQioCXAnyIoQHcfClDRBzUKg5i3tWkJnwhqOr3Bgj/AHZmP53In7o5ueTjl+lFvf1UXjgWyAst+DDbsr9asNahLueHjVudOPCyAXk6MqRFYcN93+1xHc+O1+ElRzcjXKfED/Jkpg5TI944eEhIXJVv/U+71L77tGPSpeNWa0C0fLjEb4klFG+YFpnGYjT96Z88Yc8p6inmkA7DRuDfqjvtUlfARcl0cBTBYCxp5mWfcOuXBB5jk1SHVCrMNnM1AH1nSjLfdCfRcIlc41ZbqC20zGg8B0qGcGxOsVyVkkuvgppzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UmytcdBKQNGbY5HA9Ke5AL/nz9roDTq+NvqqtD5XFBg=;
 b=Hiv67m953oi5OTS6cnnwJR2NDgjwVv7hPFrNPq9GpT58xlCTB+LYBQoH9gFEM6qJpZiKIvIbzr4AkmetfFdWoSQaivbPC01eHLVWuAWkw3AU1YeyHrqg5lSXArs8fbYj08X1Xury/e+yz7UDT7paeCr3HQckd0da29c7YT2hToZs49lpDvBnkf+Bu2iYkEZGyxqMq+B2n4KD0RUk+htvmhfN0ImcdaDY+WXAbNfTyYaBHeMbnzhApFy8nN6Dx8k4HNd+3x3RAB/FmLfiX+n+foFXcOibleYhQhvBFEdA8K7dbw/cfyItqIKq4/cb26Ky4Nv7gTKaVBrD9jhyZYpQJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UmytcdBKQNGbY5HA9Ke5AL/nz9roDTq+NvqqtD5XFBg=;
 b=GzjCZqHi26yydnSLis6DaXbAmbaPrCQB71HU7Z6/jfEIegsZmU/I46fdzrhrJ9MSBJvyLXHYY/IEid+ehj8QDUMf1GrFh5RcrBvzKW26R2BLJQZuiy3GNS0NMP0zVpJhteGrdHpwXU4PA+L/uwrWfbHxt2fkre+3DpE5XbYD0H0=
Received: from CY4PR21CA0021.namprd21.prod.outlook.com (2603:10b6:903:dd::31)
 by BN6PR02MB2257.namprd02.prod.outlook.com (2603:10b6:404:29::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Thu, 11 Mar
 2021 11:28:43 +0000
Received: from CY1NAM02FT044.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:dd:cafe::18) by CY4PR21CA0021.outlook.office365.com
 (2603:10b6:903:dd::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.3 via Frontend
 Transport; Thu, 11 Mar 2021 11:28:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT044.mail.protection.outlook.com (10.152.75.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3912.25 via Frontend Transport; Thu, 11 Mar 2021 11:28:42 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 11 Mar 2021 03:28:42 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Thu, 11 Mar 2021 03:28:42 -0800
Envelope-to: linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 linus.walleij@linaro.org,
 colin.king@canonical.com
Received: from [172.30.17.109] (port=48638)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1lKJUf-0008Tb-KH; Thu, 11 Mar 2021 03:28:42 -0800
Subject: Re: pinctrl: core: Handling pinmux and pinconf separately
To:     Colin Ian King <colin.king@canonical.com>,
        Michal Simek <michal.simek@xilinx.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <d66e78e3-2000-611b-cd74-8a61461153e8@canonical.com>
 <5c08bd61-688f-e95b-5fa3-584f190ed4bf@xilinx.com>
 <bf508c29-4a51-5f97-8459-06c1fe74b60f@canonical.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <f6cd3eb3-c8ce-9b40-e5dc-82b6748d4084@xilinx.com>
Date:   Thu, 11 Mar 2021 12:28:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <bf508c29-4a51-5f97-8459-06c1fe74b60f@canonical.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7fd4c13-d9fd-4749-eb44-08d8e480d39e
X-MS-TrafficTypeDiagnostic: BN6PR02MB2257:
X-Microsoft-Antispam-PRVS: <BN6PR02MB22575ABE4ED35CD55D062D98C6909@BN6PR02MB2257.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tRy+/1i7N95c38vRnOK9JJXyTExM8kyS0Em6uTdPUM7g1lugSGisdoD8PvUvLwg+FwQS6KdKpflY0YQsVhteuCqoK04fHx0gXrkgKXjwfX3KvvKRZtatQOBeBG6ypOBavfMB0wYfYEaXWyDRs+2lukLw6uepGiKQo/9Qyk/DeACUudYX5uMg/gI7vLN/RzdlOZgH7i9qM+0JcDUXj8kpJmGMmwHWfhR07RRDkiDLSU4LytpRm2Y2OOIJzrnFtMnV6dRchLcWf4wIRmXdsDJ6c5fUGMTY/LHOd9TC3ltd1TXv/6ZcUVgCdSRv8bN7ZBOn+mUq1j78CzXrAxCgt2mxCLSOo8VjFRTTcEH5KI6sWDujINGaLxjwpUNNqPanaexrCmf/8gzOJ/YJ0F+/GcxtlFaW67JqOic/kNczcDYGgX1e3PYgzyQeL+Pr9pM8RZK/xKOM3FwNl75Nowrpr9KUan0XueUMLjC1+4+386+YjEMykNZLgmBqtTHg//7opYYfk/PzGd4c7r5ZNEHhu0jBeNOY5ILzFb2vSm5WPDKcIvn9n03aJgfPuiQI/SNCKGBINKS/m8cuxm+u9voveOtaE9sDLz38VO2aw2WrcEKU6JNBOD+WU+TvFoiR47K+M3VEgPOuiQXwBsQNVcmDpOHVsIim9hgcI4JJd2nzbdWyzXbXAq9wGFuNXYVBuQZeuU5mZQGO5aiewC+PI+4JP4wRTA==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(396003)(136003)(46966006)(36840700001)(47076005)(336012)(8936002)(2616005)(356005)(36906005)(5660300002)(6666004)(4326008)(36860700001)(70586007)(82310400003)(31686004)(70206006)(9786002)(36756003)(186003)(110136005)(8676002)(83380400001)(316002)(82740400003)(26005)(54906003)(31696002)(426003)(44832011)(2906002)(53546011)(7636003)(478600001)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 11:28:42.9659
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7fd4c13-d9fd-4749-eb44-08d8e480d39e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT044.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2257
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 3/11/21 12:24 PM, Colin Ian King wrote:
> On 11/03/2021 11:16, Michal Simek wrote:
>>
>>
>> On 3/11/21 11:57 AM, Colin Ian King wrote:
>>> Hi,
>>>
>>> Static analysis on linux-next with Coverity has found a potential issue
>>> in drivers/pinctrl/core.c with the following commit:
>>>
>>> commit 0952b7ec1614abf232e921aac0cc2bca8e60e162
>>> Author: Michal Simek <michal.simek@xilinx.com>
>>> Date:   Wed Mar 10 09:16:54 2021 +0100
>>>
>>>     pinctrl: core: Handling pinmux and pinconf separately
>>>
>>> The analysis is as follows:
>>>
>>> 1234 /**
>>> 1235  * pinctrl_commit_state() - select/activate/program a pinctrl state
>>> to HW
>>> 1236  * @p: the pinctrl handle for the device that requests configuration
>>> 1237  * @state: the state handle to select/activate/program
>>> 1238  */
>>> 1239 static int pinctrl_commit_state(struct pinctrl *p, struct
>>> pinctrl_state *state)
>>> 1240 {
>>> 1241        struct pinctrl_setting *setting, *setting2;
>>> 1242        struct pinctrl_state *old_state = p->state;
>>>
>>>     1. var_decl: Declaring variable ret without initializer.
>>>
>>> 1243        int ret;
>>> 1244
>>>
>>>     2. Condition p->state, taking true branch.
>>>
>>> 1245        if (p->state) {
>>> 1246                /*
>>> 1247                 * For each pinmux setting in the old state, forget
>>> SW's record
>>> 1248                 * of mux owner for that pingroup. Any pingroups
>>> which are
>>> 1249                 * still owned by the new state will be re-acquired
>>> by the call
>>> 1250                 * to pinmux_enable_setting() in the loop below.
>>> 1251                 */
>>>
>>>     3. Condition 0 /* !!(!__builtin_types_compatible_p() &&
>>> !__builtin_types_compatible_p()) */, taking false branch.
>>>     4. Condition !(&setting->node == &p->state->settings), taking true
>>> branch.
>>>     7. Condition 0 /* !!(!__builtin_types_compatible_p() &&
>>> !__builtin_types_compatible_p()) */, taking false branch.
>>>     8. Condition !(&setting->node == &p->state->settings), taking true
>>> branch.
>>>     11. Condition 0 /* !!(!__builtin_types_compatible_p() &&
>>> !__builtin_types_compatible_p()) */, taking false branch.
>>>     12. Condition !(&setting->node == &p->state->settings), taking false
>>> branch.
>>>
>>> 1252                list_for_each_entry(setting, &p->state->settings,
>>> node) {
>>>
>>>     5. Condition setting->type != PIN_MAP_TYPE_MUX_GROUP, taking true
>>> branch.
>>>     9. Condition setting->type != PIN_MAP_TYPE_MUX_GROUP, taking true
>>> branch.
>>> 1253                        if (setting->type != PIN_MAP_TYPE_MUX_GROUP)
>>>     6. Continuing loop.
>>>     10. Continuing loop.
>>>
>>> 1254                                continue;
>>> 1255                        pinmux_disable_setting(setting);
>>> 1256                }
>>> 1257        }
>>> 1258
>>> 1259        p->state = NULL;
>>> 1260
>>> 1261        /* Apply all the settings for the new state - pinmux first */
>>>
>>>     13. Condition 0 /* !!(!__builtin_types_compatible_p() &&
>>> !__builtin_types_compatible_p()) */, taking false branch.
>>>     14. Condition !(&setting->node == &state->settings), taking true branch.
>>> 1262        list_for_each_entry(setting, &state->settings, node) {
>>>     15. Switch case value PIN_MAP_TYPE_CONFIGS_PIN.
>>>
>>> 1263                switch (setting->type) {
>>> 1264                case PIN_MAP_TYPE_MUX_GROUP:
>>> 1265                        ret = pinmux_enable_setting(setting);
>>> 1266                        break;
>>> 1267                case PIN_MAP_TYPE_CONFIGS_PIN:
>>> 1268                case PIN_MAP_TYPE_CONFIGS_GROUP:
>>>
>>>     16. Breaking from switch.
>>>
>>> 1269                        break;
>>> 1270                default:
>>> 1271                        ret = -EINVAL;
>>> 1272                        break;
>>> 1273                }
>>> 1274
>>>
>>>     Uninitialized scalar variable (UNINIT)
>>>     17. uninit_use: Using uninitialized value ret.
>>>
>>> 1275                if (ret < 0)
>>> 1276                        goto unapply_new_state;
>>>
>>> For the PIN_MAP_TYPE_CONFIGS_PIN and PIN_MAP_TYPE_CONFIGS_GROUP
>>> setting->type cases the loop can break out with ret not being set. Since
>>> ret has not been initialized it the ret < 0 check is checking against an
>>> uninitialized value.
>>>
>>> I was not sure if the PIN_MAP_TYPE_CONFIGS_PIN and
>>> PIN_MAP_TYPE_CONFIGS_GROUP cases should be setting ret and if so, what
>>> the value of ret should be set to (is it an error condition or not?). Or
>>> should ret be initialized to 0 or a default error value at the start of
>>> the function.
>>>
>>> Hence I'm reporting this issue.
>>
>> What about this? Is this passing static analysis?
> 
> It will take me 2 hours to re-run the analysis, but from eyeballing the
> code I think the assignments will fix this.

would be good if you can rerun it and get back to us on this.
I will wait if something else will pop up and then will send v2 with
this that Linus can apply this one instead.

Thanks,
Michal



