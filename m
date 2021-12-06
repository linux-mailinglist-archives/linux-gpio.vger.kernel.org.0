Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A918B469241
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Dec 2021 10:23:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240552AbhLFJ0V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Dec 2021 04:26:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240475AbhLFJ0V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Dec 2021 04:26:21 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8DBCC061746
        for <linux-gpio@vger.kernel.org>; Mon,  6 Dec 2021 01:22:52 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id j140-20020a1c2392000000b003399ae48f58so9889961wmj.5
        for <linux-gpio@vger.kernel.org>; Mon, 06 Dec 2021 01:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8KAEywa7+9RaUAEaQ8kpvoEbjrBvcpPvEdoPTbdrUcY=;
        b=pB+pqEmxzsGfC+sbmG8wyAD7ci3o0YnpXfSAmTE0ftJkyxez9Fs0iYoCa5tfpnBAz7
         WZkxyYzEOq6LoX73MI9qKHjvlGVlND//sP+J7iBxmcEDHXhASbu4uNi5I6R1o8W0OxTy
         9CUYbSm9fmlrq0tQLNpvX/Yak07pJNQXnVEPXc1vETzmZvZsv/SubVHPZiT37JuURC21
         xfLxphl9dtUoxxTC4Vuespr2P8xVaP/Ai784WPW/Uu6DslEfwTRBCmJdMzF/XYigtlBu
         OxvbuFb2snDb1IdEepWNJBnIgk2YRQxYTMxlbc1B2HZhE27TK8kpvKpKqjFtj8hmqpHf
         inFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8KAEywa7+9RaUAEaQ8kpvoEbjrBvcpPvEdoPTbdrUcY=;
        b=M6QCX2HDlGeO9hmfZrgwLWLcHU3/O5P8V8gGWu3IrrkhouqW0TigVRpm/d4hu2lG6i
         o5V0ImSQ3BnDS0kRGXuTfF/vIWyVKHtZ4MYEWwOdfwUIdhltfNVpQlRk8kcN59uh+ok2
         r0jBtbpG734e41VRzkAc9bCigS3eHp+VfOPvxFjmaqQ+5ww8u5QqrIcIQ9U2S/94pxN0
         4/2DZOCobskYvXI94XlxUlEqkkVfzQE7a3T2/JEPaOLxIsDw4WTxIzRVP2lhMshOyJQl
         RTH2HAjnVg8gdlKI2rxV8xp+Y1904A3ftbsY3iDQDDohVgqX3RPXhpVpCyqepMo4Uosp
         tZbg==
X-Gm-Message-State: AOAM530JZIcFxP08lxGerq4IXhIiPe+7OaZIoE949p7pFkybra9CqI5s
        4n5Io73D3aTGQR1oOJRi8myXz9I2uRgNwxcp
X-Google-Smtp-Source: ABdhPJx13sca9eiXP22ZWik+GhPvJAv/EYHZYgUTFK4uVujnCe6xDJhFGePT+V7pa3m2f45z+k4RYg==
X-Received: by 2002:a05:600c:3d05:: with SMTP id bh5mr37497004wmb.152.1638782571480;
        Mon, 06 Dec 2021 01:22:51 -0800 (PST)
Received: from buildbot.pitowers.org ([2a00:1098:3142:14:ae1f:6bff:fedd:de54])
        by smtp.gmail.com with ESMTPSA id b10sm10746365wrt.36.2021.12.06.01.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 01:22:51 -0800 (PST)
From:   Phil Elwell <phil@raspberrypi.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Phil Elwell <phil@raspberrypi.com>,
        Thierry Reding <treding@nvidia.com>,
        devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH v2 0/2] pinctrl: bcm2835: Fix gpio hogs and pin reinitialisation
Date:   Mon,  6 Dec 2021 09:22:35 +0000
Message-Id: <20211206092237.4105895-1-phil@raspberrypi.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Tackle two problems with the pinctrl-bcm2835 driver and its Device Tree
configuration:

1. The pinctrl-bcm2835 driver is a combined pinctrl/gpio driver.
Currently the gpio side is registered first, but this breaks gpio hogs
(which are configured during gpiochip_add_data).

2. Since [1], a "gpio-ranges" property is required in order for pins
to be returned to inputs when freed. Note that without patch 1, the
device never gets out of EPROBE_DEFER.

Note that the Fixes: tags are little more than hooks to hang the back-ports
on - no blame is intended.

[1] commit 2ab73c6d8323 ("gpio: Support GPIO controllers without
    pin-ranges")

Changes in v2:
* Removed wrapping of Fixes: tags.
* Added Reviewed-by from Linus, who asks that Patch 2 be merged through the
  Broadcom/SoC tree.
* Corrected Nicolas's email address.

Phil Elwell (2):
  pinctrl: bcm2835: Change init order for gpio hogs
  ARM: dts: gpio-ranges property is now required

 arch/arm/boot/dts/bcm2711.dtsi        |  2 ++
 arch/arm/boot/dts/bcm283x.dtsi        |  2 ++
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 29 +++++++++++++++------------
 3 files changed, 20 insertions(+), 13 deletions(-)

-- 
2.25.1

