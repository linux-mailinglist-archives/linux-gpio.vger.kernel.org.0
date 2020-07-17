Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A5C5224146
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 19:00:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727858AbgGQRAc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 13:00:32 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:58789 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727822AbgGQRAa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Jul 2020 13:00:30 -0400
X-IronPort-AV: E=Sophos;i="5.75,362,1589209200"; 
   d="scan'208";a="52419816"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 18 Jul 2020 02:00:28 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2592840061A0;
        Sat, 18 Jul 2020 02:00:25 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/2] Enable USB support on iW-RainboW-G21D-Q7 board
Date:   Fri, 17 Jul 2020 18:00:23 +0100
Message-Id: <1595005225-11519-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi All,

This series enables support for following peripherals in iW-RainboW-G21D-Q7
development platform:
* HSUSB
* USB2.0
* xHCI

Changes for v2:
* Added USB1 pwen pin and group
* Fixed pinmux pins for usb1

[v1] https://lkml.org/lkml/2020/5/27/1478
 * Rest of the patches from v1 have been accepted

Cheers,
Prabhakar

Lad Prabhakar (2):
  pinctrl: sh-pfc: r8a7790: Add USB1 PWEN pin and group
  ARM: dts: r8a7742-iwg21d-q7: Enable HSUSB, USB2.0 and xHCI

 arch/arm/boot/dts/r8a7742-iwg21d-q7.dts | 42 +++++++++++++++++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a7790.c    | 11 ++++++-
 2 files changed, 52 insertions(+), 1 deletion(-)

-- 
2.17.1

