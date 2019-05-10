Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E037199A8
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2019 10:24:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726991AbfEJIYZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 May 2019 04:24:25 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34126 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727210AbfEJIX2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 May 2019 04:23:28 -0400
Received: by mail-wr1-f65.google.com with SMTP id f7so6709335wrq.1
        for <linux-gpio@vger.kernel.org>; Fri, 10 May 2019 01:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=Wj+JuMQUbdyPmxQe7yGb3on4JCnRF2E0EfoUvV/8+mo=;
        b=hrgSnmEZP5o845QntWaqkMqOVqNtfRnJYedwIUiR8aPv3ToBQClvXus+4pijKIphJ+
         mju28gpMrnOTM9z7MYRAGPici4FVfNz+TShfe8r6CyXky1Ih8JmxTScix+E04B3sRfgF
         L3sOCzpOZYj3Hj6jMrWSqj2mYH1+2j8ov41RmXVBFaIT8wzFffPWwZwgOV7i4PKIOUAu
         sx1JH1zTJ0iq1IMsKAEDgdLfFPFQMcxKwPiS0HPEdq5cSPMfiNDzbDWf/j4mdhHdvlbe
         q/XV9JO1MbM5xRpaD1ZZqFZLCvUFqFfZg1q7sGkEv9avADAEmB0W3DQP4LoUQDeN/ea/
         0Xqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Wj+JuMQUbdyPmxQe7yGb3on4JCnRF2E0EfoUvV/8+mo=;
        b=l3HAQk87ZUFKCVYUWxZirMugGyW34IYO1QTclWk/I1dJ2wXl+dS7P5NQjJfgwxoftd
         hD/qEYfqgKsejQ/bBky2x5C0YL2rFORSQ7A1XWeCeClicq28cqHf1RGkDfFrLUxoMMAE
         NRGbSPtx1yIs0Wp8mmO0ubYqoHhnJ75d60Q+mwpcauT4fOYdB105btjqbESObB8PZrdS
         xNYOnC6G10K66quBoRIO4aRJikNIVTbDIqHhVtbc7dnKNEalRbY87DjhW5gpFbL99C9n
         r2sgioWBAcIEYBSVB31ZClRTPi1YDyfCAaBzHnyvsvbHnWCUAQ82SroxznMtJUCeJ4mI
         ZRvA==
X-Gm-Message-State: APjAAAUQQ1I1wK2FvhtpyVIHwwUkYCFv8sb4ep9K3ohtSkvJQBOs2Mtd
        FM9G8wq+ThsS69s7zJMEwIGagQ==
X-Google-Smtp-Source: APXvYqwecEWs+XfLMKppQZEk1BrPP3H3rvwtOqtfnWYTx6JqWQTAaqAiGxF1JGoGfM272vY60No63w==
X-Received: by 2002:a5d:68cf:: with SMTP id p15mr6684597wrw.105.1557476606633;
        Fri, 10 May 2019 01:23:26 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id z4sm3790285wmk.5.2019.05.10.01.23.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 May 2019 01:23:25 -0700 (PDT)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     linus.walleij@linaro.org, khilman@baylibre.com
Cc:     jbrunet@baylibre.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/6] Add drive-strength in Meson pinctrl driver
Date:   Fri, 10 May 2019 10:23:18 +0200
Message-Id: <20190510082324.21181-1-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The purpose of this patchset is to add drive-strength support in meson pinconf
driver. This is a new feature that was added on the g12a. It is critical for us
to support this since many functions are failing with default pad drive-strength.

The value achievable by the SoC are 0.5mA, 2.5mA, 3mA and 4mA and the DT property
'drive-strength' is expressed in mA.
So this patch add another generic property "drive-strength-microamp". The change to do so
would be minimal and could be benefit to other platforms later on.

Cheers
Guillaume

Changes since v4:
- fix dt-binding documentation
- rename drive-strength-uA to drive-strength-microamp in coverletter

Changes since v3:
- remove dev_err in meson_get_drive_strength
- cleanup code

Changes since v2:
- rename driver-strength-uA property to drive-strength-microamp
- rework patch series for better understanding
- rework set_bias function

Changes since v1:
- fix missing break
- implement new pinctrl generic property "drive-strength-uA"

[1] https://lkml.kernel.org/r/20190314163725.7918-1-jbrunet@baylibre.com

Guillaume La Roque (6):
  dt-bindings: pinctrl: add a 'drive-strength-microamp' property
  pinctrl: generic: add new 'drive-strength-microamp' property support
  dt-bindings: pinctrl: meson: Add drive-strength-microamp property
  pinctrl: meson: Rework enable/disable bias part
  pinctrl: meson: add support of drive-strength-microamp
  pinctrl: meson: g12a: add DS bank value

 .../bindings/pinctrl/meson,pinctrl.txt        |   4 +
 .../bindings/pinctrl/pinctrl-bindings.txt     |   3 +
 drivers/pinctrl/meson/pinctrl-meson-g12a.c    |  36 ++--
 drivers/pinctrl/meson/pinctrl-meson.c         | 180 ++++++++++++++----
 drivers/pinctrl/meson/pinctrl-meson.h         |  18 +-
 drivers/pinctrl/pinconf-generic.c             |   2 +
 include/linux/pinctrl/pinconf-generic.h       |   3 +
 7 files changed, 193 insertions(+), 53 deletions(-)

-- 
2.17.1

