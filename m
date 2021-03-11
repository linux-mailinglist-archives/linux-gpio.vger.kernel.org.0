Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B7FD3370A9
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Mar 2021 11:58:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232493AbhCKK5h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Mar 2021 05:57:37 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:54251 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232349AbhCKK5c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Mar 2021 05:57:32 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lKJ0U-0000MN-Ub; Thu, 11 Mar 2021 10:57:31 +0000
To:     Michal Simek <michal.simek@xilinx.com>
From:   Colin Ian King <colin.king@canonical.com>
Subject: re: pinctrl: core: Handling pinmux and pinconf separately
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-ID: <d66e78e3-2000-611b-cd74-8a61461153e8@canonical.com>
Date:   Thu, 11 Mar 2021 10:57:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Static analysis on linux-next with Coverity has found a potential issue
in drivers/pinctrl/core.c with the following commit:

commit 0952b7ec1614abf232e921aac0cc2bca8e60e162
Author: Michal Simek <michal.simek@xilinx.com>
Date:   Wed Mar 10 09:16:54 2021 +0100

    pinctrl: core: Handling pinmux and pinconf separately

The analysis is as follows:

1234 /**
1235  * pinctrl_commit_state() - select/activate/program a pinctrl state
to HW
1236  * @p: the pinctrl handle for the device that requests configuration
1237  * @state: the state handle to select/activate/program
1238  */
1239 static int pinctrl_commit_state(struct pinctrl *p, struct
pinctrl_state *state)
1240 {
1241        struct pinctrl_setting *setting, *setting2;
1242        struct pinctrl_state *old_state = p->state;

    1. var_decl: Declaring variable ret without initializer.

1243        int ret;
1244

    2. Condition p->state, taking true branch.

1245        if (p->state) {
1246                /*
1247                 * For each pinmux setting in the old state, forget
SW's record
1248                 * of mux owner for that pingroup. Any pingroups
which are
1249                 * still owned by the new state will be re-acquired
by the call
1250                 * to pinmux_enable_setting() in the loop below.
1251                 */

    3. Condition 0 /* !!(!__builtin_types_compatible_p() &&
!__builtin_types_compatible_p()) */, taking false branch.
    4. Condition !(&setting->node == &p->state->settings), taking true
branch.
    7. Condition 0 /* !!(!__builtin_types_compatible_p() &&
!__builtin_types_compatible_p()) */, taking false branch.
    8. Condition !(&setting->node == &p->state->settings), taking true
branch.
    11. Condition 0 /* !!(!__builtin_types_compatible_p() &&
!__builtin_types_compatible_p()) */, taking false branch.
    12. Condition !(&setting->node == &p->state->settings), taking false
branch.

1252                list_for_each_entry(setting, &p->state->settings,
node) {

    5. Condition setting->type != PIN_MAP_TYPE_MUX_GROUP, taking true
branch.
    9. Condition setting->type != PIN_MAP_TYPE_MUX_GROUP, taking true
branch.
1253                        if (setting->type != PIN_MAP_TYPE_MUX_GROUP)
    6. Continuing loop.
    10. Continuing loop.

1254                                continue;
1255                        pinmux_disable_setting(setting);
1256                }
1257        }
1258
1259        p->state = NULL;
1260
1261        /* Apply all the settings for the new state - pinmux first */

    13. Condition 0 /* !!(!__builtin_types_compatible_p() &&
!__builtin_types_compatible_p()) */, taking false branch.
    14. Condition !(&setting->node == &state->settings), taking true branch.
1262        list_for_each_entry(setting, &state->settings, node) {
    15. Switch case value PIN_MAP_TYPE_CONFIGS_PIN.

1263                switch (setting->type) {
1264                case PIN_MAP_TYPE_MUX_GROUP:
1265                        ret = pinmux_enable_setting(setting);
1266                        break;
1267                case PIN_MAP_TYPE_CONFIGS_PIN:
1268                case PIN_MAP_TYPE_CONFIGS_GROUP:

    16. Breaking from switch.

1269                        break;
1270                default:
1271                        ret = -EINVAL;
1272                        break;
1273                }
1274

    Uninitialized scalar variable (UNINIT)
    17. uninit_use: Using uninitialized value ret.

1275                if (ret < 0)
1276                        goto unapply_new_state;

For the PIN_MAP_TYPE_CONFIGS_PIN and PIN_MAP_TYPE_CONFIGS_GROUP
setting->type cases the loop can break out with ret not being set. Since
ret has not been initialized it the ret < 0 check is checking against an
uninitialized value.

I was not sure if the PIN_MAP_TYPE_CONFIGS_PIN and
PIN_MAP_TYPE_CONFIGS_GROUP cases should be setting ret and if so, what
the value of ret should be set to (is it an error condition or not?). Or
should ret be initialized to 0 or a default error value at the start of
the function.

Hence I'm reporting this issue.

Colin
