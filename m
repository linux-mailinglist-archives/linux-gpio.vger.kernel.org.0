Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1866C373C85
	for <lists+linux-gpio@lfdr.de>; Wed,  5 May 2021 15:40:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233045AbhEENlf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 May 2021 09:41:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230047AbhEENle (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 May 2021 09:41:34 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3B31C061574;
        Wed,  5 May 2021 06:40:37 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a4so2955105ejk.1;
        Wed, 05 May 2021 06:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=8DE9fNr9EuacMp+VfxXdaYtUegetqhQ1PCtV40q/ryA=;
        b=oa0M/vbKpWcQQuzRtJS243ok+9cbAB8dUGDZbI73dZZ4gJzRX8bUuO8fw4DnLgS/jM
         srsju6tx8pR6VXpNVF98+5RcrVB+3rmToGSQ75Yb0SqEguGf3GMBQub1rJmc5E5pJZgA
         898a3k1S1GpxqkJiAFK738ctwc45f4G5ldzyy4ckQbONGv9faGlpSqmBhmeVDFULNte7
         7C1g/wUqUIiOzfYVExgnZM5kbhwILN8gpR9jDnWsbyx3PGfZfe21YlHgl9/bGuJih/tD
         E2pjmcO+7l231DP1aoInrJmkTCbFo7d/lCa2ntyOY8sAGFqE5Pq0WKGrYvbD3Li2GeJ8
         NhxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=8DE9fNr9EuacMp+VfxXdaYtUegetqhQ1PCtV40q/ryA=;
        b=oS2qMxyNb8QN5ROC2l9vFxUCWfrjWiR1VgR9pA5L7gbsZpIyORKPN1898XXU7O80HI
         FdOIgKXAETwpvEL8ybO1HyXHTN585uZ/bQ5ADbwzLgt5Tw9FLF0ySYlEkvuwKa4xTsFC
         oY1SLdfF0Jc+drit6lqHTBgRzTP7UpfCk9LHhvE37t8CY826NEgjIH3AUfhVfhj+cmcS
         yf/cIpM/siIEnF5RcO43OqLgRp/edANRsbFK64JSdv4DGV3DgciHBtG9MWhYi5vx1Th2
         4ZonsjfoNAxwAHT0QrE+qxw8LqgQCtiAealRziP1cJz8CuwFWD1pZcjdP1+Oal4FEX9o
         PHqg==
X-Gm-Message-State: AOAM530jtM1ts7x5LLyoBRpCpIFtH+xVaR1Ch32SY8oySZsUa5R6V7KY
        TzD8TEln/4gX5VZz8cHRyWA=
X-Google-Smtp-Source: ABdhPJyWi/HIdyv4/qKEbV/r1BvCiys4IUqt6dqmOCQV5S/EJEKw1Fn1i/4ga8P8ag18sDXG3OiLpQ==
X-Received: by 2002:a17:906:4486:: with SMTP id y6mr27141527ejo.466.1620222036731;
        Wed, 05 May 2021 06:40:36 -0700 (PDT)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id t7sm15397264eds.26.2021.05.05.06.40.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 May 2021 06:40:36 -0700 (PDT)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, jay.xu@rock-chips.com,
        shawn.lin@rock-chips.com, david.wu@rock-chips.com,
        zhangqing@rock-chips.com, huangtao@rock-chips.com,
        cl@rock-chips.com, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] convert grf.txt to YAML
Date:   Wed,  5 May 2021 15:40:24 +0200
Message-Id: <20210505134028.13431-1-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Changed V2:
  add rockchip,rk3328-grf-gpio.yaml
  rename grf-gpio nodename

Johan Jonker (4):
  dt-bindings: gpio: convert rk3328-grf-gpio.txt to YAML
  dt-bindings: soc: rockchip: convert grf.txt to YAML
  ARM: dts: rockchip: add grf register compatible for rk3066/rk3188
  arm64: dts: rename grf-gpio nodename in rk3328.dtsi

 .../bindings/gpio/rockchip,rk3328-grf-gpio.txt     |  32 ---
 .../bindings/gpio/rockchip,rk3328-grf-gpio.yaml    |  51 ++++
 .../devicetree/bindings/soc/rockchip/grf.txt       |  61 -----
 .../devicetree/bindings/soc/rockchip/grf.yaml      | 280 +++++++++++++++++++++
 arch/arm/boot/dts/rk3xxx.dtsi                      |   2 +-
 arch/arm64/boot/dts/rockchip/rk3328.dtsi           |   2 +-
 6 files changed, 333 insertions(+), 95 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/rockchip,rk3328-grf-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/rockchip,rk3328-grf-gpio.yaml
 delete mode 100644 Documentation/devicetree/bindings/soc/rockchip/grf.txt
 create mode 100644 Documentation/devicetree/bindings/soc/rockchip/grf.yaml

-- 
2.11.0

