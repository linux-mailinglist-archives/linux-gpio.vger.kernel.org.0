Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 203BF3CC12E
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Jul 2021 06:57:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229918AbhGQE7j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 17 Jul 2021 00:59:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbhGQE7i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 17 Jul 2021 00:59:38 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8F55C061760
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jul 2021 21:56:41 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id x13-20020a17090a46cdb0290175cf22899cso2039077pjg.2
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jul 2021 21:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ziJ5YcGkSYbFL2uIt1IxWQA6HzWtHmBZYzfxdUp5I6c=;
        b=K7+Rv0oJRgRDFEpvFX6Ft5pXHMgu/hm0jwFUyb08BgQRjeav1m4xGAQtEa9jO33cq+
         n3OH/Dqx4ovhxBoTCdgoaxHsL9AX7PavBXWhlvufUoYp56h39PxBzdjBW6mV4MyYn0Rz
         +yse2idj2uxvPSI25vBIRJrddVfydfjvMv7Lc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ziJ5YcGkSYbFL2uIt1IxWQA6HzWtHmBZYzfxdUp5I6c=;
        b=tmV0p7/jtysGL3oyxklmCAbbONfEebY1cthDDQ/PzZSmgl+4xXohPuhGcrAIdy/Q3h
         jt1TX4eteplK47X8CazYoL9f21XIjmIvrEs9JSuKnB8ya+dNfmzThfxVTTBknHDeEazX
         dgeQEmwEIfzquRItqVrCIUJ0KM/wDa2jWIpEQCiQV6bCipoBAgISdEO3iMofnGXcwUae
         xQ/5cKZkocBBrtzJvG3KXmzWCe5BusHOZrEyQeFFKLDbvRc7y4Fi/biqBX/w07AwJF6f
         EikzteMJBUPJyoI6Z3MIDgdcX5z/eXchu5mzSrhm/xg2d6eEsBx83ndLwOMRLBPn7y2c
         Ts8g==
X-Gm-Message-State: AOAM5330UpvPu4/QK+8eUylNx7mr/FD3/uTdC4Ut1Oj1xuqb4aKCF6wd
        LbA7YJocVB0dRomIHEpnk+SORg==
X-Google-Smtp-Source: ABdhPJzgzeOYl4W876FC7nvH5fuQ1vgG4J02K3X92aZRMt4lEiA6u7OIuKU1IKl/46HEBWnaEBURgQ==
X-Received: by 2002:a17:90a:e54d:: with SMTP id ei13mr18752850pjb.187.1626497801110;
        Fri, 16 Jul 2021 21:56:41 -0700 (PDT)
Received: from shiro.work (p866038-ipngn200510sizuokaden.shizuoka.ocn.ne.jp. [180.9.60.38])
        by smtp.googlemail.com with ESMTPSA id w2sm12522885pjf.2.2021.07.16.21.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 21:56:40 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linus.walleij@linaro.org, robh@kernel.org, romain.perier@gmail.com,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 00/10] gpio: msc313: Add gpio support for ssd20xd
Date:   Sat, 17 Jul 2021 13:56:17 +0900
Message-Id: <20210717045627.1739959-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is a little series to add a compatible string for the Sigmastar
SSD201 and SSD202D to the msc313 gpio driver, add the specific offsets
for the pins on these chips, and then a bunch of DT wiring stuff so
that the LEDs on the M5 stack unitv2 work and it can control the
power switch for the USB connected.

Daniel Palmer (10):
  dt-bindings: gpio: msc313: Add compatible for ssd20xd
  dt-bindings: gpio: msc313: Add offsets for ssd20xd
  gpio: msc313: Code clean ups
  gpio: msc313: Add support for SSD201 and SSD202D
  ARM: dts: mstar: Set gpio compatible for ssd20xd
  ARM: dts: mstar: unitv2: Wire up LEDs
  ARM: dts: mstar: unitv2: Add core regulator
  ARM: dts: mstar: unitv2: Add io regulator
  ARM: dts: mstar: unitv2: Add DRAM regulator
  ARM: dts: mstar: unitv2: Add wifi switch

 .../bindings/gpio/mstar,msc313-gpio.yaml      |   4 +-
 .../dts/mstar-infinity2m-ssd202d-unitv2.dts   |  46 +++
 .../boot/dts/mstar-infinity2m-ssd20xd.dtsi    |   5 +
 drivers/gpio/gpio-msc313.c                    | 266 +++++++++++++++++-
 include/dt-bindings/gpio/msc313-gpio.h        |  71 +++++
 5 files changed, 387 insertions(+), 5 deletions(-)

-- 
2.32.0

