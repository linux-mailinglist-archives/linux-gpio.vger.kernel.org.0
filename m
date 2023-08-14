Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73FB277B24E
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Aug 2023 09:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbjHNHY6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Aug 2023 03:24:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234072AbjHNHYp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Aug 2023 03:24:45 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B1A1EE71;
        Mon, 14 Aug 2023 00:24:43 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,171,1684767600"; 
   d="scan'208";a="176575841"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 14 Aug 2023 16:24:42 +0900
Received: from localhost.localdomain (unknown [10.226.92.104])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id C5EB8419AC8E;
        Mon, 14 Aug 2023 16:24:39 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH 0/3] Fix NULL pointer dereference in RZ/{G2L,V2M,A2} pinctrl driver
Date:   Mon, 14 Aug 2023 08:24:33 +0100
Message-Id: <20230814072436.3757-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix NULL pointer dereference in RZ/{G2L,V2M,A2M} pinctrl driver due to
a race condition during boot. We have seen issues with RZ/{G2L,V2M} boards.
Based on the code, RZ/A2 will also hit this issue. So fixing RZ/A2 aswell.

This issue is reproducible with 1/200 reboots.

Biju Das (3):
  pinctrl: renesas: rzg2l: Fix NULL pointer dereference in
    rzg2l_dt_subnode_to_map()
  pinctrl: renesas: rzv2m: Fix NULL pointer dereference in
    rzv2m_dt_subnode_to_map()
  pinctrl: renesas: rza2: Add lock around
    pinctrl_generic{{add,remove}_group,{add,remove}_function}

 drivers/pinctrl/renesas/pinctrl-rza2.c  | 11 ++++++++++-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c |  8 ++++++++
 drivers/pinctrl/renesas/pinctrl-rzv2m.c |  8 ++++++++
 3 files changed, 26 insertions(+), 1 deletion(-)

-- 
2.25.1

