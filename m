Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7615337102
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Mar 2021 12:17:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232369AbhCKLRY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Mar 2021 06:17:24 -0500
Received: from mail-dm6nam11on2045.outbound.protection.outlook.com ([40.107.223.45]:17377
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232670AbhCKLRH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 11 Mar 2021 06:17:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ASHCdo28gbYYoYxlMY48GEXHP1QGtJ+jPOD/lZlrVKQTuSDHnk0HAV+oJzq+G2ahVkubQsS8QcGRbcPO7/kwFxr64VjKszNHjoa1i6mt7CO9Gw7CPcmqAT1LbK6KCoe9faRJnbg4T6p0NBbvTzSmD+BPfaUmhUTvu0lflWY+S2ks+8k8AjwViJzBJWkRFtG1qYMqaCny3hTa0lu7zB9I79WIAwYiFWoSHAn+al+dSdrVUbq0EwtUNMtfHIynsjGOM0A397jANlj7RJM++GYhNfaM/QUHmMYqOkGgxXpHcz97x/kCf2xxx/lxBmr5FAiucDnV70uCMYphVkPC4gUXow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=805/cUcJsCNnzgqqEa3qpKrDqgO7NlH4aBe+h0A9Rdc=;
 b=SqGUv/uszKfkVCZ5GvnNBX6pciLm0z7Db0c86N1WZ5ae0uvJ1ovTqkQMMfJIiGKiqOpsfR5163Drri7kNRyFgnmFXOPAt/IOnyw66g9Hv4lYpanG9a0uJTktz+gDYkyBjnaopZae3IGRAkHI7AY/bLny6OEa9J0GPBWCuVN5tHQFgXf3DyCBrcfj8VS8bkvApohcgG5R/C8LywXtsqmFOmdfmCM8ltWMEe+huePdqwqFpLIx+Q3MvqtLJSVYsqi1bJB4G4lwqNYeTqBkufl++94tEfrboMG+c4JSD52xiM5gm49VlyqwQoz3W6NdFQwydXD50sLMxbBbh4UwTf8Cig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=805/cUcJsCNnzgqqEa3qpKrDqgO7NlH4aBe+h0A9Rdc=;
 b=BQhyXyT+kCgV+Hx8eCfcxwP0pkYVjiY1EbU+TICdKZW3jBgDOY3pg3ZtifzHMazAz+5vnCBqGnxHP0IYWlt+gsQgnL3eO9y21g0DaGlU484FFcVZp8VfOcM+iUeMkeZO+Ix5sn5fdmriy3PBJA+IyFWdJDeJqv+YZr1K6mGNC94=
Received: from CY1PR03CA0010.namprd03.prod.outlook.com (2603:10b6:600::20) by
 CY4PR02MB2741.namprd02.prod.outlook.com (2603:10b6:903:128::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.27; Thu, 11 Mar
 2021 11:17:04 +0000
Received: from CY1NAM02FT059.eop-nam02.prod.protection.outlook.com
 (2603:10b6:600:0:cafe::8b) by CY1PR03CA0010.outlook.office365.com
 (2603:10b6:600::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Thu, 11 Mar 2021 11:17:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT059.mail.protection.outlook.com (10.152.74.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3912.25 via Frontend Transport; Thu, 11 Mar 2021 11:17:04 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 11 Mar 2021 03:16:59 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Thu, 11 Mar 2021 03:16:59 -0800
Envelope-to: linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 linus.walleij@linaro.org,
 colin.king@canonical.com
Received: from [172.30.17.109] (port=46834)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1lKJJL-0007bz-85; Thu, 11 Mar 2021 03:16:59 -0800
Subject: Re: pinctrl: core: Handling pinmux and pinconf separately
To:     Colin Ian King <colin.king@canonical.com>,
        Michal Simek <michal.simek@xilinx.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <d66e78e3-2000-611b-cd74-8a61461153e8@canonical.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <5c08bd61-688f-e95b-5fa3-584f190ed4bf@xilinx.com>
Date:   Thu, 11 Mar 2021 12:16:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <d66e78e3-2000-611b-cd74-8a61461153e8@canonical.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 943b0537-eb32-4a38-63fe-08d8e47f332b
X-MS-TrafficTypeDiagnostic: CY4PR02MB2741:
X-Microsoft-Antispam-PRVS: <CY4PR02MB27418A0D4A965AF747F9342AC6909@CY4PR02MB2741.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oy+lDoqSsKM916ztYOfj0c/EUGhPkOTqvxjG3jqXoEje1duHd7Wao5ejXUtveyED9wh0dfG7s/pDU7foZKTV/M2hVCtzYGkkcI0EaWg+hv1v8ZLccL1LDMjfjzzIeGCCq33Cm4Bun1++jK1McNNiYoUNJSVUToqmHlD0zA+R3RpMMmKtUQjw1pLqGKVzafkvTiphrN4rUv/PwaFVR9xYjyVgdcoNA8/FyZqGyraSEQUSUlbhOyraQ9WwCb0EajXYoXf4ecMezLTpDnWIFQ3OQMdcCr7dkrEm8D9AB8QX64wAOIAlQRvCdRhtTXs+BN3h5vr5I/6QupWd8Xzv7gcgU5QIlHKkAthDBI4TBum05YzBAr9zqZl/u5XVtCQZvs44u5M7FprJsQrVgruGyvPizEe8+7CE7p5AMzw3IXBrnVDdTUa6g9J+iB4LRAKkBSWS2enHGbyTzsDEVkYT+wUOT1N+Mk4HdC2kFR6TRg8xotdItr8gtkSqsj5PBAvqF0OKc6xhqhR0hdSrWgnU4SnS3BCagVVKJoCl7Nj1EXzeB6SSdlEhXedeaRYZNZ2YxnmLnaZztw02Trgb7uYEfXMmK4qG8c4FGLvOiVMHwh2PJsySsEGoOZ5wcwCxZQuMX3sgA/p6iH02dpmuPxUf5yE2PZF0/zakRmoCg0uawdOKRi3zhbN3vqsnCbr6WlidZC6JomsOE9+kjLqOolMUEaZK6g==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39850400004)(136003)(346002)(376002)(396003)(46966006)(36840700001)(26005)(70206006)(36860700001)(6666004)(2906002)(44832011)(36756003)(36906005)(53546011)(5660300002)(31696002)(31686004)(70586007)(9786002)(8936002)(316002)(478600001)(8676002)(110136005)(54906003)(426003)(336012)(2616005)(82310400003)(82740400003)(4326008)(356005)(47076005)(83380400001)(7636003)(186003)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 11:17:04.2752
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 943b0537-eb32-4a38-63fe-08d8e47f332b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT059.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2741
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 3/11/21 11:57 AM, Colin Ian King wrote:
> Hi,
> 
> Static analysis on linux-next with Coverity has found a potential issue
> in drivers/pinctrl/core.c with the following commit:
> 
> commit 0952b7ec1614abf232e921aac0cc2bca8e60e162
> Author: Michal Simek <michal.simek@xilinx.com>
> Date:   Wed Mar 10 09:16:54 2021 +0100
> 
>     pinctrl: core: Handling pinmux and pinconf separately
> 
> The analysis is as follows:
> 
> 1234 /**
> 1235  * pinctrl_commit_state() - select/activate/program a pinctrl state
> to HW
> 1236  * @p: the pinctrl handle for the device that requests configuration
> 1237  * @state: the state handle to select/activate/program
> 1238  */
> 1239 static int pinctrl_commit_state(struct pinctrl *p, struct
> pinctrl_state *state)
> 1240 {
> 1241        struct pinctrl_setting *setting, *setting2;
> 1242        struct pinctrl_state *old_state = p->state;
> 
>     1. var_decl: Declaring variable ret without initializer.
> 
> 1243        int ret;
> 1244
> 
>     2. Condition p->state, taking true branch.
> 
> 1245        if (p->state) {
> 1246                /*
> 1247                 * For each pinmux setting in the old state, forget
> SW's record
> 1248                 * of mux owner for that pingroup. Any pingroups
> which are
> 1249                 * still owned by the new state will be re-acquired
> by the call
> 1250                 * to pinmux_enable_setting() in the loop below.
> 1251                 */
> 
>     3. Condition 0 /* !!(!__builtin_types_compatible_p() &&
> !__builtin_types_compatible_p()) */, taking false branch.
>     4. Condition !(&setting->node == &p->state->settings), taking true
> branch.
>     7. Condition 0 /* !!(!__builtin_types_compatible_p() &&
> !__builtin_types_compatible_p()) */, taking false branch.
>     8. Condition !(&setting->node == &p->state->settings), taking true
> branch.
>     11. Condition 0 /* !!(!__builtin_types_compatible_p() &&
> !__builtin_types_compatible_p()) */, taking false branch.
>     12. Condition !(&setting->node == &p->state->settings), taking false
> branch.
> 
> 1252                list_for_each_entry(setting, &p->state->settings,
> node) {
> 
>     5. Condition setting->type != PIN_MAP_TYPE_MUX_GROUP, taking true
> branch.
>     9. Condition setting->type != PIN_MAP_TYPE_MUX_GROUP, taking true
> branch.
> 1253                        if (setting->type != PIN_MAP_TYPE_MUX_GROUP)
>     6. Continuing loop.
>     10. Continuing loop.
> 
> 1254                                continue;
> 1255                        pinmux_disable_setting(setting);
> 1256                }
> 1257        }
> 1258
> 1259        p->state = NULL;
> 1260
> 1261        /* Apply all the settings for the new state - pinmux first */
> 
>     13. Condition 0 /* !!(!__builtin_types_compatible_p() &&
> !__builtin_types_compatible_p()) */, taking false branch.
>     14. Condition !(&setting->node == &state->settings), taking true branch.
> 1262        list_for_each_entry(setting, &state->settings, node) {
>     15. Switch case value PIN_MAP_TYPE_CONFIGS_PIN.
> 
> 1263                switch (setting->type) {
> 1264                case PIN_MAP_TYPE_MUX_GROUP:
> 1265                        ret = pinmux_enable_setting(setting);
> 1266                        break;
> 1267                case PIN_MAP_TYPE_CONFIGS_PIN:
> 1268                case PIN_MAP_TYPE_CONFIGS_GROUP:
> 
>     16. Breaking from switch.
> 
> 1269                        break;
> 1270                default:
> 1271                        ret = -EINVAL;
> 1272                        break;
> 1273                }
> 1274
> 
>     Uninitialized scalar variable (UNINIT)
>     17. uninit_use: Using uninitialized value ret.
> 
> 1275                if (ret < 0)
> 1276                        goto unapply_new_state;
> 
> For the PIN_MAP_TYPE_CONFIGS_PIN and PIN_MAP_TYPE_CONFIGS_GROUP
> setting->type cases the loop can break out with ret not being set. Since
> ret has not been initialized it the ret < 0 check is checking against an
> uninitialized value.
> 
> I was not sure if the PIN_MAP_TYPE_CONFIGS_PIN and
> PIN_MAP_TYPE_CONFIGS_GROUP cases should be setting ret and if so, what
> the value of ret should be set to (is it an error condition or not?). Or
> should ret be initialized to 0 or a default error value at the start of
> the function.
> 
> Hence I'm reporting this issue.

What about this? Is this passing static analysis?

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index f5c32d2a3c91..136c323d855e 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1266,6 +1266,7 @@ static int pinctrl_commit_state(struct pinctrl *p,
struct pinctrl_state *state)
                        break;
                case PIN_MAP_TYPE_CONFIGS_PIN:
                case PIN_MAP_TYPE_CONFIGS_GROUP:
+                       ret = 0;
                        break;
                default:
                        ret = -EINVAL;
@@ -1284,6 +1285,7 @@ static int pinctrl_commit_state(struct pinctrl *p,
struct pinctrl_state *state)
        list_for_each_entry(setting, &state->settings, node) {
                switch (setting->type) {
                case PIN_MAP_TYPE_MUX_GROUP:
+                       ret = 0;
                        break;
                case PIN_MAP_TYPE_CONFIGS_PIN:
                case PIN_MAP_TYPE_CONFIGS_GROUP:

Thanks,
Michal
