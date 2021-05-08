Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B06A3771D0
	for <lists+linux-gpio@lfdr.de>; Sat,  8 May 2021 14:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231249AbhEHMjF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 8 May 2021 08:39:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231211AbhEHMiz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 8 May 2021 08:38:55 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52299C061756;
        Sat,  8 May 2021 05:37:54 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id n25so13397656edr.5;
        Sat, 08 May 2021 05:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=V6aLRfOO1B1ohRWCDcHhmocgBoD4D8Oa0X2F/UWU3rg=;
        b=e6vYdC/0tscyHByuE3PCugLPodyufEVoohEe8tWabjuvxLsrJOlZJsdxxstc8Fgx3p
         5GGkqGNvbtwI18/vU7HcmnX8+aQa8phYb7zLsD0e9CNZzhGdTm7jnJkAdm+7d/+Kbkm7
         XtObigQmeel0O1v23gc7yfmM0nkJXV63U0XNdQeW8z6c0Gt20haFrbgjGDH/xDQO9oN6
         u7J5QD4JWa2iqVdziUsTfyI6031Mq90RNt6cxudV4sSOqi7TSSIYTeMcveq+E7KX+qsz
         3uYOkFS2nPWrzluwDaYz4xSOEj2fhsKahB3jV/cTBT5a5c+rFA3QqoGWMPj91eYGO2qV
         4COg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=V6aLRfOO1B1ohRWCDcHhmocgBoD4D8Oa0X2F/UWU3rg=;
        b=F+fgIhokiwvfVZJi3hmuUmaXkbGUoyQwhcMx92JpkryTP1CoHi6CtbMWMW1KHXvTGu
         WFX3ojYRF2LKTXpYyjMDhTmKmHNJFRCqHT7SO+9miwI0GPON8lqjLiSO2GbIEBZDcQv4
         ljAVmwF+44R9JSdjRUsxfYx5M1atz0OHe4zMr8BSS9gJlituoh0FMDAnHeuVOSHXY/8/
         r1CAsYhQR2H11oYSzoKowb0exNLNKA2zlnL6f83yW69bdgp9MAO44GAuXJiJkTCg8QLJ
         pZwOkzMNpdZoLrSbvrpbt/UD8CXEuxPLY9fHiuQ7+hte4qNxhGeg687/7RduXkSZkfKb
         fv1g==
X-Gm-Message-State: AOAM531fDCXllD4Tnj0y5es+qJ9WzbHogbPKPzlheScdTp8EQ6ncicPK
        Ulcy+44EKKeVPNHIkdierhxbQC4jUqGNlg==
X-Google-Smtp-Source: ABdhPJyF86hB2/UGwESN0ylhg/ap4N2xW8De3BKKYA3uoVLX4r1aWDcy9BGzrUVY5z+4mnfQmyUndg==
X-Received: by 2002:a50:9990:: with SMTP id m16mr5042430edb.292.1620477472996;
        Sat, 08 May 2021 05:37:52 -0700 (PDT)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id q25sm6262618edt.51.2021.05.08.05.37.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 08 May 2021 05:37:52 -0700 (PDT)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, jay.xu@rock-chips.com,
        shawn.lin@rock-chips.com, david.wu@rock-chips.com,
        zhangqing@rock-chips.com, huangtao@rock-chips.com,
        cl@rock-chips.com, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] convert grf.txt to YAML
Date:   Sat,  8 May 2021 14:37:39 +0200
Message-Id: <20210508123743.18128-1-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Changed V3:
  remove select
  change unevaluatedProperties
  add separate schemas for each 'if' subset

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
 .../devicetree/bindings/soc/rockchip/grf.yaml      | 262 +++++++++++++++++++++
 arch/arm/boot/dts/rk3xxx.dtsi                      |   2 +-
 arch/arm64/boot/dts/rockchip/rk3328.dtsi           |   2 +-
 6 files changed, 315 insertions(+), 95 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/rockchip,rk3328-grf-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/rockchip,rk3328-grf-gpio.yaml
 delete mode 100644 Documentation/devicetree/bindings/soc/rockchip/grf.txt
 create mode 100644 Documentation/devicetree/bindings/soc/rockchip/grf.yaml

-- 
2.11.0

