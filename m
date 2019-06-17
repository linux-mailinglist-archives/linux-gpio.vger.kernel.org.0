Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D12647F2A
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 12:05:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbfFQKFF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 06:05:05 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:50906 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728009AbfFQKEr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 06:04:47 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 5D8A3806A8;
        Mon, 17 Jun 2019 22:04:44 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1560765884;
        bh=9TpEGxHoVApXP2xLWWFd+WbRCiDRhmBeG+15sZtDkzI=;
        h=From:To:Cc:Subject:Date;
        b=egLGVkaJOy4SKnBeqUY9fYo6IV/6Ys5fal7z2qTJ/DlqBSCjr1hz6IJwJrNuY3EdE
         e9p7YxcLRCp9k1cKlcWJTo9QUUGejZrk5+GE5eyPtoDUJukOg19BVxUa6mLChv2tns
         LrATW1fxZWkBH7BVZ1NLuyIC4EKfxvaxHI9EgD0xgSjo0AmOe6UWC3Jz326GlOevjv
         iu/3fd3fyigLsNiaH6ius07s3i/bXxr7SvB6s5iQ/ZgKNiINH6Skq758URaQsF/w2A
         +psnuWVfbIo+gDvikFiuZZUl/Rgpb52CEHVB0MdnCEGICKpCrXeNgaatYGvG20X4+w
         1sQGPDKbgVIqA==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5d0765bc0000>; Mon, 17 Jun 2019 22:04:44 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
        by smtp (Postfix) with ESMTP id 4985E13EED3;
        Mon, 17 Jun 2019 22:04:45 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 1E69B1E04F0; Mon, 17 Jun 2019 22:04:44 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linus.walleij@linaro.org,
        jason@lakedaemon.net, andrew@lunn.ch, gregory.clement@bootlin.com,
        sebastian.hesselbarth@gmail.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 0/4] Add support for Marvell 98DX1135
Date:   Mon, 17 Jun 2019 22:04:28 +1200
Message-Id: <20190617100432.13037-1-chris.packham@alliedtelesis.co.nz>
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

