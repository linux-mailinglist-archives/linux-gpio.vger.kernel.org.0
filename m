Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39EA52B9337
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Nov 2020 14:13:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbgKSNJk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Nov 2020 08:09:40 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:39606 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727429AbgKSNJj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 19 Nov 2020 08:09:39 -0500
X-IronPort-AV: E=Sophos;i="5.77,490,1596466800"; 
   d="scan'208";a="63036279"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 19 Nov 2020 22:09:37 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id C6C954005E1A;
        Thu, 19 Nov 2020 22:09:35 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/4] Renesas add QSPI{0,1} pins to r8a77{96,951,965,990} SoC
Date:   Thu, 19 Nov 2020 13:09:22 +0000
Message-Id: <20201119130926.25692-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi All,

This patch series adds QSPI{0,1} pins to r8a77{96,951,965,990} SoC.

Patches are based on top of [1].

[1]  https://git.kernel.org/pub/scm/linux/kernel/git/geert/
     renesas-drivers.git/log/?h=renesas-pinctrl-for-v5.11
Cheers,
Prabhakar

Lad Prabhakar (4):
  pinctrl: renesas: r8a77990: Add QSPI[01] pins, groups and functions
  pinctrl: renesas: r8a77951: Add QSPI[01] pins, groups and functions
  pinctrl: renesas: r8a7796: Add QSPI[01] pins, groups and functions
  pinctrl: renesas: r8a77965: Add QSPI[01] pins, groups and functions

 drivers/pinctrl/renesas/pfc-r8a77951.c | 75 +++++++++++++++++++++++++-
 drivers/pinctrl/renesas/pfc-r8a7796.c  | 75 +++++++++++++++++++++++++-
 drivers/pinctrl/renesas/pfc-r8a77965.c | 75 +++++++++++++++++++++++++-
 drivers/pinctrl/renesas/pfc-r8a77990.c | 75 +++++++++++++++++++++++++-
 4 files changed, 292 insertions(+), 8 deletions(-)

-- 
2.17.1

