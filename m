Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9B4A2F0071
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Jan 2021 15:11:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbhAIOKw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 9 Jan 2021 09:10:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725850AbhAIOKw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 9 Jan 2021 09:10:52 -0500
X-Greylist: delayed 467 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 09 Jan 2021 06:09:56 PST
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1799C06179F
        for <linux-gpio@vger.kernel.org>; Sat,  9 Jan 2021 06:09:56 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 43C463EEB7;
        Sat,  9 Jan 2021 15:02:08 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     linux-gpio@vger.kernel.org
Cc:     konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, linus.walleij@linaro.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH 0/2] Add Awinic AW9523(B) I2C GPIO Expander driver
Date:   Sat,  9 Jan 2021 15:02:02 +0100
Message-Id: <20210109140204.151340-1-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds support for the Awinic AW9523/AW9523B I2C GPIO Expander, as
found in the F(x)Tec Pro1 smartphone (there, it's used to drive a
keyboard matrix).
This driver was tested on the aforementioned smartphone.

AngeloGioacchino Del Regno (2):
  pinctrl: Add driver for Awinic AW9523/B I2C GPIO Expander
  dt-bindings: pinctrl: Add bindings for Awinic AW9523/AW9523B

 .../pinctrl/awinic,aw9523-pinctrl.yaml        |  111 ++
 drivers/pinctrl/Kconfig                       |   17 +
 drivers/pinctrl/Makefile                      |    1 +
 drivers/pinctrl/pinctrl-aw9523.c              | 1070 +++++++++++++++++
 4 files changed, 1199 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml
 create mode 100644 drivers/pinctrl/pinctrl-aw9523.c

-- 
2.29.2

