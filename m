Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B3E3203DF8
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 19:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729921AbgFVRcI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jun 2020 13:32:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729822AbgFVRcH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jun 2020 13:32:07 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4CE9C061796
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2020 10:32:07 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id i14so427529ejr.9
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2020 10:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bCAmII4vqMO96t6X95dj63747CKVWHh9SpN0EDHNpes=;
        b=hvQ1oySdzoTVBNsN+Qt+HaAMEdhMG3L+Uc9QrdJ1obT/L6trCvyS1+6ZzzR9xjtI4v
         7yQvnyViWU9NsYvAjZgHiUdsopYgkr4JULFpKxs9uzNeyp517EDsw/7+xgWfVuGlTNzK
         /Jezmi5Dac3fa+kZE2kq+Ms3CoNWr1xKVUtjIKQpg76kyAXtjDXDT0x4XIQc7JupEyL+
         p5/kDdJ1aWQ9X5JHEIbollPYf7vUoyO2EG7td/nOPrp1C8+hWPBjIrqVsYjxvgKDcxX1
         kS9KFRBFen4rc9+Y+nQEKwP73AxeOeldYP/JKjhAUgOpyyCMEHGtRT2Btw2yYP/3B/YC
         ST6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bCAmII4vqMO96t6X95dj63747CKVWHh9SpN0EDHNpes=;
        b=m4P6zRYQ3nbwtcwb+AT9V2TfWxFeG0pAP0q65rBn7GHLYiA70ScKmlg8keN3EoI7nf
         csz9pbDPjOXilBQUWTZOBr0Aeh8XuuMKZHF0NNBEcDDbL2e4BEwbUAv1uOuV3CCmd025
         XQrRuY7rRQSGv6ncu26MO1Sksd4+Jd3taGYNNaefhitx5ZwCARR46JsrStHbO8leNiQa
         nXaKGQFIM7n5tOPqT4MDTvM+/CIKKNZ3PQNQ6Y5p7Mzu1LYfxMOSdaoJ9BMv/POisX/c
         8LBy/0aRWgFhTFZ2Rag3s4WEk0+kmxvjKAGJTzVmMrca+as31nFx94VV4MKe7kePNxRd
         oKew==
X-Gm-Message-State: AOAM531/tjXLP0LdiV8m0kNSHbpwQOf4d67VKwKpCdIBo0EgXPal70Xl
        KzP5uTREqz9l78LGMhERmYeD5w==
X-Google-Smtp-Source: ABdhPJznEQZukuasHS/Zg0q2uZdeIDXrMqMHqbzNqvR2pj+yiY1x7DPMl+RtmNMaot0hcEZtE374dg==
X-Received: by 2002:a17:906:7208:: with SMTP id m8mr17339905ejk.544.1592847126281;
        Mon, 22 Jun 2020 10:32:06 -0700 (PDT)
Received: from localhost.localdomain (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id z1sm4747386ejb.41.2020.06.22.10.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 10:32:05 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        devicetree@vger.kernel.org, bcousson@baylibre.com,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH v3 0/3] pinctrl: single: support #pinctrl-cells = 2
Date:   Mon, 22 Jun 2020 19:29:48 +0200
Message-Id: <20200622172951.524306-1-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Currently, pinctrl-single only allows #pinctrl-cells = 1.

This series will allow pinctrl-single to also support #pinctrl-cells = 2

If "pinctrl-single,pins" has 3 arguments (offset, conf, mux) then
pcs_parse_one_pinctrl_entry() does an OR operation on to get the
value to store in the register.
    
To take advantage of #pinctrl-cells = 2, the AM33XX_PADCONF macro in
omap.h is modified to keep pin conf and pin mux values separate.

change log:
- v3: change order of patches to make sure the pinctrl-single.c patch
  does not break anything without the dts patches

- v2: remove outer parentheses from AM33XX_PADCONF macro as it causes a
  compile error in dtc.  I had added it per suggestion from checkpatch
  about having parentheses around complex values.

Drew Fustini (3):
  pinctrl: single: parse #pinctrl-cells = 2
  ARM: dts: change AM33XX_PADCONF macro separate conf and mux
  ARM: dts: am33xx-l4: change #pinctrl-cells from 1 to 2

 arch/arm/boot/dts/am33xx-l4.dtsi   |  2 +-
 drivers/pinctrl/pinctrl-single.c   | 11 +++++++++--
 include/dt-bindings/pinctrl/omap.h |  2 +-
 3 files changed, 11 insertions(+), 4 deletions(-)

-- 
2.25.1

