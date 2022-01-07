Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27FD2487BD2
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jan 2022 19:09:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240666AbiAGSJW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jan 2022 13:09:22 -0500
Received: from mout.perfora.net ([74.208.4.194]:45167 "EHLO mout.perfora.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240468AbiAGSJW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 7 Jan 2022 13:09:22 -0500
X-Greylist: delayed 311 seconds by postgrey-1.27 at vger.kernel.org; Fri, 07 Jan 2022 13:09:22 EST
Received: from localhost.localdomain ([194.191.235.54]) by mrelay.perfora.net
 (mreueus004 [74.208.5.2]) with ESMTPSA (Nemesis) id 1N4QTi-1mPWJn3EeM-011U6n;
 Fri, 07 Jan 2022 19:03:50 +0100
From:   Marcel Ziswiler <marcel@ziswiler.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Marek Vasut <marek.vasut@gmail.com>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Frank Rowand <frowand.list@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 02/14] dt-bindings: gpio: fix gpio-hog example
Date:   Fri,  7 Jan 2022 19:03:02 +0100
Message-Id: <20220107180314.1816515-3-marcel@ziswiler.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220107180314.1816515-1-marcel@ziswiler.com>
References: <20220107180314.1816515-1-marcel@ziswiler.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ytzex8uojCkbk04+1zET92x9o8utwdOsZlxdHCWAqyylkF7JRec
 5en/28PTW12sX2ELW105nbTInJ0ckaVkDg5gFrDzrUX/ky5wwkRPASV09P+gOFWbRhH5XJI
 iBRXFX0HIRES2+ke9DCfPC7QjX87TBQ4wPAkg2B4yZftkpvlcnxRJsLswUarAWiP7IFtUZ2
 DkAMICIUlhc7XmpbS/4vg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dPQPHq2+jdU=:HdJpFX2AVtj/lTOcF895Tt
 zEtlZeYfK9NQ0YJ4xMhze8cJdu3HS2UnOek9ZjrW1ohSpVlSwcj+nxsxAsc7aUaF7a6g054GF
 VtgPqtvMXt6/DN4i5NSM9AGAwitr4hJGePX4Ih0HqzYdewsRX6f+E9J8R8TMPLekhfHQYfxGz
 gTHlOWv/WNoYBCEIisrZRzspqpJqru8t97Isbe2ND1C36+Y4AUhqKpaRDlu+4+tMTgPNAw4Xz
 d6ZzMBvGmbIFwOq8JQBH1hrsV+JKOiCGTMKUgG178KwW1F8lPYJ87zfrcPxjrAc3O/h9FIzqX
 ikBoEHbHTaNcYxzVP7pArp65ws/ifIJljrlTQH6VY+AH5ghMlHKA0Q+SF6AgEMXN4YN8IsPGi
 sK18L4ct43CTrX5DDWDjRXtO2YEsNcbWDlrSR/JhHUoSfZG1YE/BwfUbiUd3Of9iFMh7YyQjn
 QSeraX/AI4imGrM6nQOAjW4cTPaYiU7PY52aIs3HuhB8tDVGns3Y03MJWbzqJereCn5LRw76Z
 jN4+PXNkULOsUEwVbXb0K9r556E1EG2oKqcQfjGB6xFa2r6J3BKpIQfp21BxfR8uIds+qOmnE
 2zltW7VkLeFT7bC2+cHqOnF0duJQ0zteShyKO3Pg1ra8UJmFxBC1wANb1JU93IoHWZz345k3p
 0Tj0bNDAMD7js16yj9WSuy5BsVSffJrk1k/jNiwp346rBllz0I96Tx0rZ0tDtcvVHjQ4=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Even if this is no yaml yet at least fix the example to be compliant to
later schema as e.g. found in gpio-pca95xx.yaml, fairchild,74hc595.yaml
and gpio/fsl-imx-gpio.yaml.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
---

 Documentation/devicetree/bindings/gpio/gpio.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index a8895d339bfe..5663e71b751f 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -213,7 +213,7 @@ Example of two SOC GPIO banks defined as gpio-controller nodes:
 		gpio-controller;
 		#gpio-cells = <2>;
 
-		line_b {
+		line_b-hog {
 			gpio-hog;
 			gpios = <6 0>;
 			output-low;
-- 
2.33.1

