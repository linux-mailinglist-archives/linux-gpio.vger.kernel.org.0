Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B97143CB02
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Oct 2021 15:45:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242227AbhJ0Nrm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Oct 2021 09:47:42 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:39947 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S235360AbhJ0Nrl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 27 Oct 2021 09:47:41 -0400
X-IronPort-AV: E=Sophos;i="5.87,186,1631545200"; 
   d="scan'208";a="98620551"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 27 Oct 2021 22:45:14 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id AE5724010727;
        Wed, 27 Oct 2021 22:45:12 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/4] Add "output-impedance" property to pinconf-generic
Date:   Wed, 27 Oct 2021 14:45:05 +0100
Message-Id: <20211027134509.5036-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi All,

The first two patches of the series add "output-impedance-ohms" property
to pinconf-generic and the last two patches add support to get/set
drive-strength and output-impedance for RZ/G2L SoC.

Cheers,
Prabhakar

Changes for v1:
* Fixed review comments pointed by Geert and Rob

RFC: https://patchwork.kernel.org/project/linux-renesas-soc/cover/
20210930121630.17449-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Lad Prabhakar (4):
  dt-bindings: pincfg-node: Add "output-impedance-ohms" property
  pinctrl: pinconf-generic: Add support for "output-impedance-ohms" to
    be extracted from DT files
  dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Add output-impedance-ohms
    property
  pinctrl: renesas: pinctrl-rzg2l: Add support to get/set drive-strength
    and output-impedance-ohms

 .../bindings/pinctrl/pincfg-node.yaml         |   3 +
 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |   2 +
 drivers/pinctrl/pinconf-generic.c             |   2 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 284 +++++++++++++-----
 include/linux/pinctrl/pinconf-generic.h       |   3 +
 5 files changed, 221 insertions(+), 73 deletions(-)

-- 
2.17.1

