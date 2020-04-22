Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 530501B4152
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2020 12:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728536AbgDVKK6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Apr 2020 06:10:58 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:57691 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729105AbgDVKK5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Apr 2020 06:10:57 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 64B203C004C;
        Wed, 22 Apr 2020 12:10:54 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id oguoUnbPx3nK; Wed, 22 Apr 2020 12:10:49 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 69CC13C057F;
        Wed, 22 Apr 2020 12:10:49 +0200 (CEST)
Received: from lxhi-065.adit-jv.com (10.72.94.60) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 22 Apr
 2020 12:10:48 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     <linux-renesas-soc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Yusuke Ashiduka <ashiduka@fujitsu.com>,
        Torii Kenichi <torii.ken1@jp.fujitsu.com>,
        Fukui Yohhei <yohhei.fukui@denso-ten.com>,
        Yasushi Asano <yasano@jp.adit-jv.com>,
        Yuichi Kusakabe <yuichi.kusakabe@denso-ten.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Jiada Wang <jiada_wang@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>
Subject: [RFC PATCH 0/3] gpio: rcar: Add support for GPIO alternative interrupt
Date:   Wed, 22 Apr 2020 12:10:23 +0200
Message-ID: <20200422101026.9220-1-erosca@de.adit-jv.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.72.94.60]
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The motivation behind this series is described in commit
("gpio: rcar: Add support for GPIO alternative interrupt").

The reasons for which RFC tag is attached are:
 - Have Renesas/linux-gpio communities been facing GPIO interrupt
   partitioning questions in the past (specifically AP vs RT)?
 - Is it a no-go to have mandatory DTS dependencies like updating
   'interrupts' on specifying the new 'use-alternative-interrupt'?

Many thanks for your comments!

Eugeniu Rosca (1):
  [LOCAL] arm64: dts: renesas: ulcb: Showcase 'use-alternative-interrupt'

Torii Kenichi (2):
  dt-bindings: gpio-rcar: Add optional use-alternative-interrupt property
  gpio: rcar: Add support for GPIO alternative interrupt

 Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt |  3 +++
 arch/arm64/boot/dts/renesas/ulcb.dtsi                        | 40 ++++++++++++++++++++++++++++++++++++++++
 drivers/gpio/gpio-rcar.c                                     | 22 +++++++++++++++++-----
 3 files changed, 60 insertions(+), 5 deletions(-)

-- 
2.26.0

