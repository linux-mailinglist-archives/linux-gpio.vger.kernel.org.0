Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73E67260623
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Sep 2020 23:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727927AbgIGVRV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Sep 2020 17:17:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727869AbgIGVRT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Sep 2020 17:17:19 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC651C061755
        for <linux-gpio@vger.kernel.org>; Mon,  7 Sep 2020 14:17:18 -0700 (PDT)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 9DAF6806B5;
        Tue,  8 Sep 2020 09:17:16 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1599513436;
        bh=+FPj6Py6+yK51QkVI24N9KESTL802Kuzy9arE9yuwb4=;
        h=From:To:Cc:Subject:Date;
        b=SIr4NBwqbpMZ18MPYNB+ayNhznmbbgO2lsBtVirFnVYd1uAi/Avxku8MeYG7mkZim
         Rc9MQ3z8PQ+awobR440kRWppwdwMx1YJ+3q1fTDsmpyj6vwKLOPQQpivaHNT3Kd1hJ
         RftjEHpgciDrAw8MF2ZP40cqdKH/WwLwjylPid5ojxijOy+aIAHETVP0hDjpL3VvGk
         GYuEbkouo5uePrscbjPfwpYnysFxh8vfUUH6yhciRhyOKXSSjADVyPeYOX3IbbRuGr
         IFpjvyeygZEDZTz/GszvbV9quabZP0YbjXH1UKmxzty1JPk2P3pKQ62t/vVNJb1gOH
         /DPR1WCtZ394g==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5f56a35c0000>; Tue, 08 Sep 2020 09:17:16 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 4460C13EEBA;
        Tue,  8 Sep 2020 09:17:15 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id E98A5280060; Tue,  8 Sep 2020 09:17:15 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     jason@lakedaemon.net, andrew@lunn.ch, gregory.clement@bootlin.com,
        sebastian.hesselbarth@gmail.com, robh+dt@kernel.org,
        linus.walleij@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 0/3] 98dx3236 i2c related fixes
Date:   Tue,  8 Sep 2020 09:17:09 +1200
Message-Id: <20200907211712.9697-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I noticed these while adding support for i2c recovery for a couple of our
boards. They date back to when I initially added support for the 98dx3236=
. They
probably haven't been causing a problem because the HW defaults are corre=
ct and
unless you attempt to use the specific pinctrl functions there won't be a
problem.

Change in v2:
- Fix grammo in patch 2/3
- Add r-by from Andrew

Chris Packham (3):
  pinctrl: mvebu: Fix i2c sda definition for 98DX3236
  ARM: dts: Remove non-existent i2c1 from 98dx3236
  ARM: dts: Add i2c0 pinctrl information for 98dx3236

 arch/arm/boot/dts/armada-xp-98dx3236.dtsi | 12 +++++++-----
 drivers/pinctrl/mvebu/pinctrl-armada-xp.c |  2 +-
 2 files changed, 8 insertions(+), 6 deletions(-)

--=20
2.28.0

