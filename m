Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF819379EE8
	for <lists+linux-gpio@lfdr.de>; Tue, 11 May 2021 07:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbhEKFG3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 May 2021 01:06:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbhEKFG2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 May 2021 01:06:28 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1F0AC061574;
        Mon, 10 May 2021 22:05:21 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id gx5so27785380ejb.11;
        Mon, 10 May 2021 22:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=pi3/NFfh4P9X9GC09hvS2UeJKCy4lzkslaCKeUJUOwg=;
        b=u0+ImUl4+lah1bM6dsHAM2KbaGBBNcgQKIi793yudjXdbEo0vZWe4O+zd2CjnBNhCR
         8jAEJMSeJStylpaVbCfHjYRZ0WcVLDTR8bUl6IJQjUoAlCuBXmZX0I/wfQNKXDsDnOu5
         rfZ5sHY4ZUlWvM1pmtIJylNI+mFz0qMWSgrh0yCP7x4zWoEXhDjLte1DoWLgpTfMgU24
         E2Ti+yA+i3E4ih8OpGMP5vU/stA40yo/fl2N95JJynBQ/cmnlYRplMDG56IYqU8pBULk
         Fl19yin0hW10o02ZQqGI3L0tPW+6LWftoQERzXTDVu2uSUFKHBRy7ZwZAFeKQc4fYl/N
         MZ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=pi3/NFfh4P9X9GC09hvS2UeJKCy4lzkslaCKeUJUOwg=;
        b=jx3WCwVfW8bfZoPPBucPdQGyhGjXAspvh3wFBdJOibJQMdTsWwoYAYid2Cm7cVLCiI
         1z/DyN4T+IICcmoAt7t76CNOaEu2MNqW1AFtZWyr1YrxlzuMTpqvQ9HMXEoui46Supgl
         XWaF8DWMtmWDjzL6pNg2pMTi7LeQpZMhNQjD3fMbACrvV3xrukthbEUIgsccmsniyOol
         GkaLwuCnnlzDxoSdVyCeEcPpwFN0/QYvm2nHw7Q0CS70vnySpawbXya01+AbOx+aNOBx
         +Oj2cw+dgX76ofvL6dF+OeFl0YCWnj4zuzheOcpRea3ruHXvVG6BZBYh+3a9L+MFVRHZ
         g2HQ==
X-Gm-Message-State: AOAM531oT/rQbCLe79zcUwRKBK2AclWWucU9SujXwDlA5pp4w3t2VgHT
        lCAJTKTdql5D9padh8JyPYVecCcQDRc=
X-Google-Smtp-Source: ABdhPJxMtbJIPsrtfj8tO1vPEjLqtg1sBvhU/90sVjhlTluL3Lr6o9TVqNjmXrjykIXPUePv3FQppA==
X-Received: by 2002:a17:907:3d8f:: with SMTP id he15mr29129813ejc.22.1620709520484;
        Mon, 10 May 2021 22:05:20 -0700 (PDT)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id g24sm3620302eds.41.2021.05.10.22.05.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 May 2021 22:05:20 -0700 (PDT)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, jay.xu@rock-chips.com,
        shawn.lin@rock-chips.com, david.wu@rock-chips.com,
        zhangqing@rock-chips.com, huangtao@rock-chips.com,
        cl@rock-chips.com, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] convert grf.txt to YAML
Date:   Tue, 11 May 2021 07:05:07 +0200
Message-Id: <20210511050511.5973-1-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Changed V4:
  revert separate schemas for each 'if' subset
  add additionalProperties
  move properties to top level

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
 .../bindings/gpio/rockchip,rk3328-grf-gpio.yaml    |  51 +++++
 .../devicetree/bindings/soc/rockchip/grf.txt       |  61 -----
 .../devicetree/bindings/soc/rockchip/grf.yaml      | 246 +++++++++++++++++++++
 arch/arm/boot/dts/rk3xxx.dtsi                      |   2 +-
 arch/arm64/boot/dts/rockchip/rk3328.dtsi           |   2 +-
 6 files changed, 299 insertions(+), 95 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/rockchip,rk3328-grf-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/rockchip,rk3328-grf-gpio.yaml
 delete mode 100644 Documentation/devicetree/bindings/soc/rockchip/grf.txt
 create mode 100644 Documentation/devicetree/bindings/soc/rockchip/grf.yaml

-- 
2.11.0

