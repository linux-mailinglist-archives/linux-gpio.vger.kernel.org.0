Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F63B77C1B6
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Aug 2023 22:50:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230258AbjHNUtv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Aug 2023 16:49:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231997AbjHNUtj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Aug 2023 16:49:39 -0400
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C6FFC3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Aug 2023 13:49:38 -0700 (PDT)
Received: from localhost (88-113-24-87.elisa-laajakaista.fi [88.113.24.87])
        by fgw20.mail.saunalahti.fi (Halon) with ESMTP
        id 13e58e89-3ae4-11ee-b3cf-005056bd6ce9;
        Mon, 14 Aug 2023 23:49:36 +0300 (EEST)
From:   andy.shevchenko@gmail.com
Date:   Mon, 14 Aug 2023 23:49:35 +0300
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        stable@kernel.org
Subject: Re: [PATCH 2/3] pinctrl: renesas: rzv2m: Fix NULL pointer
 dereference in rzv2m_dt_subnode_to_map()
Message-ID: <ZNqTX4E3J7SW1RkX@surfacebook.localdomain>
References: <20230814072436.3757-1-biju.das.jz@bp.renesas.com>
 <20230814072436.3757-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230814072436.3757-3-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Mon, Aug 14, 2023 at 08:24:35AM +0100, Biju Das kirjoitti:
> Fix the below random NULL pointer crash during boot by serializing
> groups and functions creation in rzv2m_dt_subnode_to_map() with
> mutex lock.
> 
> Crash logs:
> [ 9.215283] CPU: 0 PID: 104 Comm: systemd-udevd Tainted: G D 6.4.0-next-20230628-g9d42909cfd05-dirty #1
> [ 9.226128] Hardware name: RZ/V2M Evaluation Kit 2.0 (DT)
> [ 9.231555] pstate: 40000005 (nZcv daif PAN -UAO -TCO -DIT -SSBS BTYPE=-)
> [ 9.238557] pc : __pi_strcmp+0x20/0x140
> [ 9.242428] lr : pinmux_func_name_to_selector+0x68/0xa4
> [ 9.247688] sp : ffff800082c1b630
> [ 9.251018] x29: ffff800082c1b630 x28: 0000000000000002 x27: ffff000143ee35c0
> [ 9.258201] x26: 0000000000000002 x25: ffff000143ee6100 x24: ffff000143ee35c0
> [ 9.265385] x23: ffff80008120ecf8 x22: ffff0001bfab8e88 x21: 0000000000000007
> [ 9.272569] x20: ffff0001437ee9c0 x19: 0000000000000006 x18: 0000000000000020
> [ 9.279751] x17: 0000000000000000 x16: 0000000000000000 x15: ffffffffffffffff
> [ 9.286933] x14: ffffffffffffffff x13: 0000000000000038 x12: 0000000000000040
> [ 9.294117] x11: ffff0001430d4db0 x10: 0000fffe40547178 x9 : ffff0001437eea08
> [ 9.301300] x8 : 0101010101010101 x7 : 0000000000000000 x6 : 0000000000000000
> [ 9.308483] x5 : ffff0001430d4db0 x4 : ffff0001430d4e08 x3 : 0000000000000000
> [ 9.315666] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0001bfab8e88
> [ 9.322850] Call trace:
> [ 9.325308] __pi_strcmp+0x20/0x140
> [ 9.328821] pinmux_generic_add_function+0x34/0xcc
> [ 9.333643] rzv2m_dt_subnode_to_map+0x2e4/0x418
> [ 9.338290] rzv2m_dt_node_to_map+0x15c/0x18c
> [ 9.342672] pinctrl_dt_to_map+0x218/0x37c
> [ 9.346795] create_pinctrl+0x70/0x3d8

As per previous patch.

-- 
With Best Regards,
Andy Shevchenko


