Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5452125F1B9
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Sep 2020 04:42:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbgIGCmD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Sep 2020 22:42:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726352AbgIGCl6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Sep 2020 22:41:58 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF741C061786
        for <linux-gpio@vger.kernel.org>; Sun,  6 Sep 2020 19:41:56 -0700 (PDT)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 197FC891B0;
        Mon,  7 Sep 2020 14:41:52 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1599446512;
        bh=OBfpn6maBRdc+d/1QNwOPIf7KifJQ2fwNTTnwBpNbxo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=I1cpKEkCzS5NYU632TWvFBCgk0wE7ZDLSlJZl3q23KPXAAwkB0dxtevstfOiTDdqY
         P6yvNTZu0On7B6oECjqXmzTmmdXXEVCbOLFoztVOGQetoCJuaIUsAl27NNKmDqCVDV
         fJac4y+y6jgXc0ThSeBrr3uVmlSg9iWk9QkvgHKv5hcgsKtRKwT+9jp5MeQoSm5zKS
         Y6eZLgX7nPbvUqWsWAnIq374fJn7sp9cKp9hXtK9IKy9zKqFWXHynH5lvqdDQJoivU
         +c1FSf5+99j6lbOUl6/QV/FLGUEa2DVtcP5CWhgPSD22H1RYCcTdEpid/9dmPtGhRL
         ZjU8L6A0hYiZg==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5f559def0001>; Mon, 07 Sep 2020 14:41:51 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id A2EC913EEB7;
        Mon,  7 Sep 2020 14:41:51 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id E538E280060; Mon,  7 Sep 2020 14:41:51 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     jason@lakedaemon.net, andrew@lunn.ch, gregory.clement@bootlin.com,
        sebastian.hesselbarth@gmail.com, robh+dt@kernel.org,
        linus.walleij@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH 1/3] pinctrl: mvebu: Fix i2c sda definition for 98DX3236
Date:   Mon,  7 Sep 2020 14:41:47 +1200
Message-Id: <20200907024149.20001-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200907024149.20001-1-chris.packham@alliedtelesis.co.nz>
References: <20200907024149.20001-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Per the datasheet the i2c functions use MPP_Sel=3D0x1. They are documente=
d
as using MPP_Sel=3D0x4 as well but mixing 0x1 and 0x4 is clearly wrong. O=
n
the board tested 0x4 resulted in a non-functioning i2c bus so stick with
0x1 which works.

Fixes: d7ae8f8dee7f ("pinctrl: mvebu: pinctrl driver for 98DX3236 SoC")
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/pinctrl/mvebu/pinctrl-armada-xp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-xp.c b/drivers/pinctrl/=
mvebu/pinctrl-armada-xp.c
index a767a05fa3a0..48e2a6c56a83 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-xp.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-xp.c
@@ -414,7 +414,7 @@ static struct mvebu_mpp_mode mv98dx3236_mpp_modes[] =3D=
 {
 		 MPP_VAR_FUNCTION(0x1, "i2c0", "sck",        V_98DX3236_PLUS)),
 	MPP_MODE(15,
 		 MPP_VAR_FUNCTION(0x0, "gpio", NULL,         V_98DX3236_PLUS),
-		 MPP_VAR_FUNCTION(0x4, "i2c0", "sda",        V_98DX3236_PLUS)),
+		 MPP_VAR_FUNCTION(0x1, "i2c0", "sda",        V_98DX3236_PLUS)),
 	MPP_MODE(16,
 		 MPP_VAR_FUNCTION(0x0, "gpo", NULL,          V_98DX3236_PLUS),
 		 MPP_VAR_FUNCTION(0x4, "dev", "oe",          V_98DX3236_PLUS)),
--=20
2.28.0

