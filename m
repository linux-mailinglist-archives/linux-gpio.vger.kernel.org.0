Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55C1121017B
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2020 03:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbgGABdf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jun 2020 21:33:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725868AbgGABde (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2020 21:33:34 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E4F3C03E979
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 18:33:34 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id a8so16890474edy.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 18:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/VYml6MLvVnH67ofYRYqVd160Mf/rDTxD1O5uDA9s3c=;
        b=0JTT3bwG/3G71Kq+zgpc6slp9fDtHbqeAZXEqcX5hauhtzWEnqI/CV0G2PuXoTzq6Q
         qpb34SgQD7+KNt//LUpiB5uK7fPW72OfRraXvy21ADOypcUqUVSeyngLagnFGXEKE1Qs
         Y+evYWYMZrGSR7/jCCQOJbnlEikeyGCZrotPgjfh7vrI+eWtXRjZKXddpOuhYlChfJRr
         EAFyaKlTvigdR8bQn9FnT+eGHUx/dOf6DUy57YBHDl00N5RdS8FjW8bUJZENylPSPqzO
         h4VOBtgYi5kizz3gOnvSHbcpFA46ecZ6Fjr1uTYTSgpzNywTCueRBaU1VwcCn7a0CoHw
         /VDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/VYml6MLvVnH67ofYRYqVd160Mf/rDTxD1O5uDA9s3c=;
        b=FVmJSACaxIPSOr9U9sHmGcxf9qBobybiC77XmeS/z1uv3OsoEUjveZQN3q7/Y+luQG
         nfuHwIxAM2tv2TG2ssvGe6FNFijtucLgi00l24aqKLVbrEgxvJILgJAlcC8vQN/X2Fyu
         /WMOS3ogujzqve9D+4YxBRF0ciy+GDERvI1pnPGHSyGEudrp3dSbQWuhz5kq2T0JTYZv
         QrjEvrB/DkCwqyj+mMjsN5oouq0dhzlhOYMgF+rSp8G2ziDnXcDsVj4TWdgBdNZ9X5an
         sGB8igK/noADZazSN6l86fNUmmlk8ddjwyqqvvVoNArNBcHFYAaJOHKx8ggwcaLiyoCZ
         4mHg==
X-Gm-Message-State: AOAM531Z4lsYYv95rFMqOObVpkj0qfslmvs5B0DBcRTZDepL2cxRC+DO
        AVujeWLLuRsL5erC/yh6AwebIA==
X-Google-Smtp-Source: ABdhPJxUV3RPX54vZQ0QT0VrM5ktf5G9tcfaBT5ASwITZJ8pLiOxiO7nQqq6vhAytpCs66H7qUKwAw==
X-Received: by 2002:a50:e8c9:: with SMTP id l9mr19125444edn.272.1593567213062;
        Tue, 30 Jun 2020 18:33:33 -0700 (PDT)
Received: from localhost.localdomain ([2001:16b8:5c28:7601:2d3c:7dcb:fbf0:3875])
        by smtp.gmail.com with ESMTPSA id d23sm3348571eja.27.2020.06.30.18.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 18:33:31 -0700 (PDT)
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
Subject: [PATCH v4 0/2] pinctrl: single: support #pinctrl-cells = 2
Date:   Wed,  1 Jul 2020 03:33:18 +0200
Message-Id: <20200701013320.130441-1-drew@beagleboard.org>
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
pcs_parse_one_pinctrl_entry() does an OR operation on conf and mux to
get the value to store in the register.
    
To take advantage of #pinctrl-cells = 2, the AM33XX_PADCONF macro in
omap.h is modified to keep pin conf and pin mux values separate.

change log:
- v4: squash patches 2 and 3 together so that git biesct will not result
  in a boot failure

- v3: change order of patches to make sure the pinctrl-single.c patch
  does not break anything without the dts patches

- v2: remove outer parentheses from AM33XX_PADCONF macro as it causes a
  compile error in dtc.  I had added it per suggestion from checkpatch
  about having parentheses around complex values.

Drew Fustini (2):
  pinctrl: single: parse #pinctrl-cells = 2
  ARM: dts: am33xx-l4: change #pinctrl-cells from 1 to 2

 arch/arm/boot/dts/am33xx-l4.dtsi   |  2 +-
 drivers/pinctrl/pinctrl-single.c   | 11 +++++++++--
 include/dt-bindings/pinctrl/omap.h |  2 +-
 3 files changed, 11 insertions(+), 4 deletions(-)

-- 
2.25.1

