Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAE644949E
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 23:55:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726001AbfFQVzG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 17:55:06 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:51462 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727399AbfFQVzG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 17:55:06 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 16968891A9;
        Tue, 18 Jun 2019 09:55:01 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1560808501;
        bh=hMGkfofcp3Y5IvOC7/IuqFMk2ddLSIWy+00ffvgz630=;
        h=From:To:Cc:Subject:Date;
        b=Ke/V8OCav3k/c2C8Nsapp1G5nBaMhbwDz/3rdEVmHvCe4W+iQbODyVYuCUG/ALlVy
         T97hrgA6uJy5xCqOD2xrhMg3w7kkav0befvCHDW9GfqInRG6oMNMBR7USkhU54mjst
         iT/cMHX2ecy0abrfvGf9+Hbj+tDWGxWBSMvk9XnMI/bZNx9CHpmuy5utfVJ3LZSQ94
         JRJMEBzjuNLDWlONcfuJONmRQDJvFlVBk4JtsK+NnZaGYhKuJGo2Jq1Z+J821JgCcH
         K3rYmjg2T+WDWjaTjaFDEN1Mte6r219q4tlPwGdcVUzGXvCqlA7WY09itzA96rnq4u
         W/JUP/10Tbhdg==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5d080c340004>; Tue, 18 Jun 2019 09:55:00 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
        by smtp (Postfix) with ESMTP id 35BA413EF89;
        Tue, 18 Jun 2019 09:55:01 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 0B8B21E04F0; Tue, 18 Jun 2019 09:55:00 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linus.walleij@linaro.org,
        jason@lakedaemon.net, andrew@lunn.ch, gregory.clement@bootlin.com,
        sebastian.hesselbarth@gmail.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 0/4] Add support for Marvell 98DX1135
Date:   Tue, 18 Jun 2019 09:54:54 +1200
Message-Id: <20190617215458.32688-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The Marvell 98DX1135 is a switch chip with an integrated ARMv5 CPU, it is
similar to the 98DX4122 with differences in clocking and pin control.

I haven't added a separate dts for the SoC since it would be so similar t=
o
kirkwood-98dx4122.dtsi.

Changes in v2:
- Update description of mv98dx1135-core-clock
- Collect review from Andrew

Chris Packham (4):
  dt-bindings: pinctrl: mvebu: Document bindings for 98DX1135
  dt-bindings: clock: mvebu: Add compatible string for 98dx1135 core
    clock
  pinctrl: mvebu: Add support for MV98DX1135
  clk: kirkwood: Add support for MV98DX1135

 .../bindings/clock/mvebu-core-clock.txt       |   1 +
 .../pinctrl/marvell,kirkwood-pinctrl.txt      |  44 +-
 drivers/clk/mvebu/kirkwood.c                  |  17 +
 drivers/pinctrl/mvebu/pinctrl-kirkwood.c      | 576 +++++++++---------
 4 files changed, 357 insertions(+), 281 deletions(-)

--=20
2.21.0

