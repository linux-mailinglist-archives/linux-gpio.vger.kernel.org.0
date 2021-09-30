Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3075741D986
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Sep 2021 14:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349446AbhI3MTB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 08:19:01 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:10230 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1349389AbhI3MTA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 30 Sep 2021 08:19:00 -0400
X-IronPort-AV: E=Sophos;i="5.85,336,1624287600"; 
   d="scan'208";a="95682441"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 30 Sep 2021 21:17:16 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5F4B8437F0DD;
        Thu, 30 Sep 2021 21:17:14 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 0/4] Add "output-impedance" property to pinconf-generic
Date:   Thu, 30 Sep 2021 13:16:26 +0100
Message-Id: <20210930121630.17449-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi All,

The first two patches of the series add add "output-impedance" property
to pinconf-generic and the last two patches add support to get/set
drive-strength and output-impedance for RZ/G2L SoC.

Cheers,
Prabhakar

Lad Prabhakar (4):
  dt-bindings: pincfg-node: Add "output-impedance" property
  pinctrl: pinconf-generic: Add support for "output-impedance" to be
    extracted from DT files
  dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Add output-impedance
    property
  pinctrl: renesas: pinctrl-rzg2l: Add support to get/set drive-strength
    and output-impedance

 .../bindings/pinctrl/pincfg-node.yaml         |   4 +
 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |   2 +
 drivers/pinctrl/pinconf-generic.c             |   2 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 181 ++++++++++++++----
 include/linux/pinctrl/pinconf-generic.h       |   3 +
 5 files changed, 159 insertions(+), 33 deletions(-)

-- 
2.17.1

