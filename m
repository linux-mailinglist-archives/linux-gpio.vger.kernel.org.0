Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 511BA816A8
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 12:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727328AbfHEKQR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 06:16:17 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:58401 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727259AbfHEKQR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 06:16:17 -0400
X-Originating-IP: 86.250.200.211
Received: from localhost.localdomain (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id B1F542000F;
        Mon,  5 Aug 2019 10:16:13 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     <devicetree@vger.kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Antoine Tenart <antoine.tenart@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Nadav Haklai <nadavh@marvell.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, <linux-arm-kernel@lists.infradead.org>,
        Grzegorz Jaszczyk <jaz@semihalf.com>,
        Marcin Wojtas <mw@semihalf.com>,
        Stefan Chulski <stefanc@marvell.com>,
        Yan Markman <ymarkman@marvell.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/3] CP115 pinctrl support
Date:   Mon,  5 Aug 2019 12:16:04 +0200
Message-Id: <20190805101607.29811-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

This is the second batch of changes (out of three) to support the brand
new Marvell CN9130 SoCs which are made of one AP807 and one CP115.

We add a new compatible (and the relevant support in the pinctrl
driver) before the addition in batch 3/3 of CN9130 SoCs DT using it.

1st batch was clocks support and is independent from this one.

Thanks,
Miquèl


Grzegorz Jaszczyk (2):
  dt-bindings: cp110: document the new CP115 pinctrl compatible
  pinctrl: mvebu: add additional variant for standalone CP115

Konstantin Porotchkin (1):
  pinctrl: mvebu: Add CP110 missing pin functionality

 .../arm/marvell/cp110-system-controller.txt   |  4 ++--
 drivers/pinctrl/mvebu/pinctrl-armada-cp110.c  | 20 ++++++++++++++-----
 2 files changed, 17 insertions(+), 7 deletions(-)

-- 
2.20.1

