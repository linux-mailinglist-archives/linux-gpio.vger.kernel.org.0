Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C162C45D7D6
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Nov 2021 10:59:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345599AbhKYKDJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Nov 2021 05:03:09 -0500
Received: from mx.socionext.com ([202.248.49.38]:39795 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348778AbhKYKBJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 25 Nov 2021 05:01:09 -0500
Received: from unknown (HELO kinkan2-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 25 Nov 2021 18:57:57 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
        by kinkan2-ex.css.socionext.com (Postfix) with ESMTP id EA3E6205A544;
        Thu, 25 Nov 2021 18:57:56 +0900 (JST)
Received: from 172.31.9.53 (172.31.9.53) by m-FILTER with ESMTP; Thu, 25 Nov 2021 18:57:56 +0900
Received: from yuzu2.css.socionext.com (yuzu2 [172.31.9.57])
        by iyokan2.css.socionext.com (Postfix) with ESMTP id 8B3E2B62AB;
        Thu, 25 Nov 2021 18:57:56 +0900 (JST)
Received: from scorpio.e01.socionext.com (aries.syh.socionext.com [10.213.112.88])
        by yuzu2.css.socionext.com (Postfix) with ESMTP id 6E60D10D20;
        Thu, 25 Nov 2021 18:57:56 +0900 (JST)
From:   Sugaya Taichi <sugaya.taichi@socionext.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, orito.takao@socionext.com,
        sugaya.taichi@socionext.com,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>
Subject: [PATCH v3 0/2] pinctrl: milbeaut: Add Milbeaut M10V pinctrl
Date:   Thu, 25 Nov 2021 18:57:54 +0900
Message-Id: <1637834276-10466-1-git-send-email-sugaya.taichi@socionext.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This third patch adds a pinctrl driver a part of basic support for
Milbeaut M10V.  At v2 patch, I tried to add basic pinctrl support and
IRQs pin mapping additionally.  Here v3, to be a pure basic pinctrl
support patch, I dropped the function about IRQs pin mapping.

v2:
https://lkml.org/lkml/2019/2/8/301

Changes:
 v2 -> v3
  - add bindings
  - change author
  - drop functions about IRQs mapping
  - refine whole of the code
 v1 -> v2
  - none

Jassi Brar (1):
  pinctrl: milbeaut: Add Milbeaut M10V pinctrl

Sugaya Taichi (1):
  dt-bindings: pinctrl: add bindings for Milbeaut pin controller

 .../pinctrl/socionext,milbeaut-pinctrl.yaml        |  51 +++
 drivers/pinctrl/Kconfig                            |   8 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-milbeaut.c                 | 406 +++++++++++++++++++++
 4 files changed, 466 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/socionext,milbeaut-pinctrl.yaml
 create mode 100644 drivers/pinctrl/pinctrl-milbeaut.c

-- 
2.7.4

