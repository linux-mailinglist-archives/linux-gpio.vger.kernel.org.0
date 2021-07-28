Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC34A3D8FCE
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 15:55:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235427AbhG1Nz4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 09:55:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232441AbhG1Nzz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Jul 2021 09:55:55 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62051C061757;
        Wed, 28 Jul 2021 06:55:53 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id b20so2259868qkj.3;
        Wed, 28 Jul 2021 06:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pGfwAbdRt78qHTO96TNHse01yCgrSXx0nBQE1K40Z9k=;
        b=oqxg8mVy/V6nu+jVSAFy/QCDzw4popNFWi0oMDsYaEG6drkfVexNbdx+GFQOcSCAgK
         Q4I4iOETyduykRRnpF/1yZQ1S8r0gplh47RkJE8o61uTRV+O0qGHSZqaefM1+kFWwXJr
         7fw1crb4tbEyYGRNKho8iLHDRLTTEjMVau7riZJi7ulD3ZWPtgh9jyEchpDYCktXY0NQ
         wlX31YlIfnfKq264A0Wjoazr5fvy1CufiUQQ7oPI1IdlWLWCDjkRAZV4cq8vtudg1Med
         hXemtX53BEFNnO34o2AAev56iHoUmsN7Y/zVokRyBFuT05FGteJHS+wpstmNVhCb/16N
         xvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pGfwAbdRt78qHTO96TNHse01yCgrSXx0nBQE1K40Z9k=;
        b=OTIxNHrgUmy8cKZlm2KjmPP1slDHldS5JMGoS+o7YOgkYRw7d2Ey51DujePpYsmLbN
         6IdUOpWWkedbVpgqMCegRu25qCiowuPd49hi4NsLTbTYuUFuuIVlKpWzA0qAlH/fZAo1
         Yke9L2vfbHz4dLaS5l7WzbmtpoCVT4whjGX3UviOn5V8eEUBxrKl1USokynyfm32ibzR
         85CMb8anCeurIQqMMOgyH3b9XS5mwkmqxCtqVC1UF3CvtI22bo44v14uu81CWNH0bzkZ
         +1YAlPkiF/5KZPQMXr2XaG1pf495Kmj+edbJ5rYADRtfxfLuGZlW9OFYsVFPXL3csIvA
         HktA==
X-Gm-Message-State: AOAM5313D9vPSnJqJr3k5uTJeGq7wh8MxDTor0B77sXQo6Ij9fFIG64B
        LIaJ9WrAHbgDTsohsQYi3e8=
X-Google-Smtp-Source: ABdhPJwFOefvh7nvrQLkSCRfqcRb4dWBL8gmNm47o675Elqgo8EaaKtcFOiaHI58yZ4EhsJVPVQQHg==
X-Received: by 2002:a05:620a:a19:: with SMTP id i25mr27119975qka.426.1627480552482;
        Wed, 28 Jul 2021 06:55:52 -0700 (PDT)
Received: from master-laptop.sparksnet ([2601:153:980:85b1:b58:2ae8:d75f:660a])
        by smtp.gmail.com with ESMTPSA id t64sm27202qkd.71.2021.07.28.06.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 06:55:51 -0700 (PDT)
From:   Peter Geis <pgwipeout@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peter Geis <pgwipeout@gmail.com>
Subject: [PATCH 0/9] fixes and enablement for rk356x
Date:   Wed, 28 Jul 2021 09:55:25 -0400
Message-Id: <20210728135534.703028-1-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Good Morning,

This series aims to fix some early issues with the rk356x and enable
nodes that are currently supported by the available drivers.

1. increases the max clocks in the dt-bindings to permit patch 3.
2. fixes the mbi-alias, which points to the wrong location
3. adds the gpio debounce clocks which are necessary for gpio to bind
4. adds the common gmac1 node
5. adds the tsadc nodes
6. adds the missing cru and pmucru phandles necessary to reclock
7. adjusts the gpll and ppll clocks to better support hardware
8. enables the gmac1 on the Quartz64
9. adds thermal support to the Quartz64

Peter Geis (9):
  dt-bindings: gpio: rockchip,gpio-bank: increase max clocks
  arm64: dts: rockchip: fix rk3568 mbi-alias
  arm64: dts: rockchip: add rk356x gpio debounce clocks
  arm64: dts: rockchip: add rk356x gmac1 node
  arm64: dts: rockchip: add rk3568 tsadc nodes
  arm64: dts: rockchip: add missing rk3568 cru phandles
  arm64: dts: rockchip: adjust rk3568 pll clocks
  arm64: dts: rockchip: enable gmac node on quartz64-a
  arm64: dts: rockchip: add thermal support to Quartz64 Model A

 .../bindings/gpio/rockchip,gpio-bank.yaml     |   2 +-
 .../boot/dts/rockchip/rk3566-quartz64-a.dts   |  66 +++++++++
 .../boot/dts/rockchip/rk3568-pinctrl.dtsi     |   6 +
 arch/arm64/boot/dts/rockchip/rk356x.dtsi      | 136 +++++++++++++++++-
 4 files changed, 203 insertions(+), 7 deletions(-)

-- 
2.25.1

