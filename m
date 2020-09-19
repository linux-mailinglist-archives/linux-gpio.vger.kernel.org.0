Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00FDD27106B
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Sep 2020 22:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbgISUKY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 19 Sep 2020 16:10:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726511AbgISUKX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 19 Sep 2020 16:10:23 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56ED3C0613CE
        for <linux-gpio@vger.kernel.org>; Sat, 19 Sep 2020 13:10:23 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id z23so12488220ejr.13
        for <linux-gpio@vger.kernel.org>; Sat, 19 Sep 2020 13:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bIUgrI9VvUV3joqrWL0lDga1yejUz0t72Nx3sYu9s5I=;
        b=L9ZNoEf+xu48ppvnblmZrK2nJchaz2vEmWMEwk0swPeneNBWwlEvhh9K2LRJ4HX/Lr
         yaLd88oTJthtaQqxoTU6Bpq9MompSoGcLiUcNpIfeAA00igj+XiDykYLeLV/Jw8j1hhS
         INZQvLR3KlU5Mz4ouanoPhPkOE8DEebpwgHK1I4PX/UKjaA9eUPZ+znYNIZ1yQpacRBA
         0HOeF7HiDNqgNDI2rcBXnSTaJk5w+fymuI/a9RBVIXTu7CcWALUG5FTdeATk0vZ2Ud7H
         bROaU33aeRXMmpNvS74rrEVYF/PP54F9jib8fsmGcXYMFfhRBbqJE69KatbCAS7mm5Y+
         RIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bIUgrI9VvUV3joqrWL0lDga1yejUz0t72Nx3sYu9s5I=;
        b=DixB/W7c+q4SIvToyYptivmwFk6p2efVJX8K5kBE48lWlpdNEEHl1xiU4M7AmVXs1b
         lgiSdPdozfDu/rTOlScgl3tlKAvzY82Z+QsZrx0DuxYNd2Qm0Fd1HI/YaFJX3Yx+G55+
         Hg6ehF8ZGIIIby2im6ATMJ+y4kL1QOZGWOIYcT8QXGUwScR2X7eK0vq+hn4463ZvJSyZ
         M7hWrOPvujwF70pcWjX1kum6Xs3/Q32dhV5/JoHM25VolQE22yL8tVuVxtj692xMfIMi
         ZvDljJsP2sbDiJBEBCLM4En7+XaAcPGyjkGqoUSU58XUX3Z+e7gnLE24XzOeAb0RwiR5
         kXcw==
X-Gm-Message-State: AOAM531bHFEwjPRcx0Bf8FaJICLB40twP98XLS4U1tGeFzUclFKPXucY
        nIJRn9ZGNYJl3KzGUR51bDmQ/w==
X-Google-Smtp-Source: ABdhPJyXNqZQicq1ULAO60r8L8+AZhDK5qSHeRWT+5a8VqRkbjyQ+aQHZc7zHY/Lxi8bZlOvg+97sQ==
X-Received: by 2002:a17:906:4553:: with SMTP id s19mr41341473ejq.475.1600546220782;
        Sat, 19 Sep 2020 13:10:20 -0700 (PDT)
Received: from localhost.localdomain ([2001:16b8:5c3d:1401:6946:9f46:bd13:f4c6])
        by smtp.gmail.com with ESMTPSA id ks21sm5008761ejb.63.2020.09.19.13.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2020 13:10:19 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        Trent Piepho <tpiepho@gmail.com>,
        Christina Quast <cquast@hanoverdisplays.com>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH v2] ARM: dts: document pinctrl-single,pins when #pinctrl-cells = 2
Date:   Sat, 19 Sep 2020 22:08:37 +0200
Message-Id: <20200919200836.3218536-1-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document the values in pinctrl-single,pins when #pinctrl-cells = <2>

Fixes: 27c90e5e48d0 ("ARM: dts: am33xx-l4: change #pinctrl-cells from 1 to 2")
Reported-by: Trent Piepho <tpiepho@gmail.com>
Link: https://lore.kernel.org/linux-omap/3139716.CMS8C0sQ7x@zen.local/
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
v2 change:
- rephrase to make it clear that the pin conf value and pin mux value
  are OR'd together with #pinctrl-cells = <2>


 .../bindings/pinctrl/pinctrl-single.txt       | 21 ++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
index e705acd3612c..f903eb4471f8 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
@@ -94,16 +94,23 @@ pinctrl-single,bit-per-mux is set), and uses the common pinctrl bindings as
 specified in the pinctrl-bindings.txt document in this directory.
 
 The pin configuration nodes for pinctrl-single are specified as pinctrl
-register offset and value pairs using pinctrl-single,pins. Only the bits
-specified in pinctrl-single,function-mask are updated. For example, setting
-a pin for a device could be done with:
+register offset and values using pinctrl-single,pins. Only the bits specified
+in pinctrl-single,function-mask are updated.
+
+When #pinctrl-cells = 1, then setting a pin for a device could be done with:
 
 	pinctrl-single,pins = <0xdc 0x118>;
 
-Where 0xdc is the offset from the pinctrl register base address for the
-device pinctrl register, and 0x118 contains the desired value of the
-pinctrl register. See the device example and static board pins example
-below for more information.
+Where 0xdc is the offset from the pinctrl register base address for the device
+pinctrl register, and 0x118 contains the desired value of the pinctrl register.
+
+When #pinctrl-cells = 2, then setting a pin for a device could be done with:
+
+	pinctrl-single,pins = <0xdc 0x30 0x07>;
+
+Where 0x30 is the pin configuration value and 0x07 is the pin mux mode value.
+These two values are OR'd together to produce the value stored at offset 0xdc.
+See the device example and static board pins example below for more information.
 
 In case when one register changes more than one pin's mux the
 pinctrl-single,bits need to be used which takes three parameters:
-- 
2.25.1

