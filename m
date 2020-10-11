Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 514E628A509
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Oct 2020 04:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730393AbgJKCso (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Oct 2020 22:48:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730366AbgJKCso (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 10 Oct 2020 22:48:44 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82FE1C0613D5
        for <linux-gpio@vger.kernel.org>; Sat, 10 Oct 2020 19:48:44 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id b26so10345377pff.3
        for <linux-gpio@vger.kernel.org>; Sat, 10 Oct 2020 19:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CRG92oMXy4E775EIK8O0DpmZIGdIMTpQqj/5ZSVtoLY=;
        b=weHpStTxuhYPS7lmPZL9/pJezwwh8vwwWkoW6OYqSbVgsTSXnrXBooo9Sk4tOL5x3P
         +mfDH6ATV9zyNC5hHUn2edNR+Z5+Q0RRNkweW7QjWgScac4PPlgLsgmAAXCCqnLEh3OP
         3lW437RBQZLGsCOK7W4+YS0hpVROGZ/Iy7v1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CRG92oMXy4E775EIK8O0DpmZIGdIMTpQqj/5ZSVtoLY=;
        b=rufArWIAS1SzgarVRuMHFfBkMBq9+veU4DGurLaOhw8NiM+mUzy7bXx9GDuySeW+P6
         yN0u0cUcILqvmKOniGV4xasLZRbNEZdeFVStU5HdOMi5NucCo7AWILEEWD4UfA9eyQBb
         FiQC8WomT3PticVruZTb9au41eW24vx0BiYniqEz9W/5qiCIMnB3orWPb0coCTUzG5QU
         V4FXM5gTJjJLhH/W62BsNHnERmyfbcU64l6A0n41bebMCas63ykCXCxP6jJcMzhq7SUR
         9Eooab3Vu99VW253E8qV55JNm0d5d6aYHZ/BVjIuELafzZmT/Q/JXc6AVTB3+DSld90F
         fXmA==
X-Gm-Message-State: AOAM530lFpOZvJ/I0241ONUQB/UceOwz6eoeAwLdLU9N6uyztzAiM60X
        2tMci9oQ9YkRz+8QRE5dh1C9k3BtnlwltQ==
X-Google-Smtp-Source: ABdhPJwrGvROYt9PDnRCZ4PKLbJHDLKQcNIcm4hxT8GdAjhU/1yIldti4tw2fiIbvwwvQMG0mp8Z5w==
X-Received: by 2002:a17:90b:128f:: with SMTP id fw15mr9908083pjb.107.1602384523344;
        Sat, 10 Oct 2020 19:48:43 -0700 (PDT)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp. [118.13.124.123])
        by smtp.googlemail.com with ESMTPSA id z25sm14832836pgl.6.2020.10.10.19.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2020 19:48:42 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     linux-gpio@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 0/5] Add GPIO support for MStar/SigmaStar ARMv7
Date:   Sun, 11 Oct 2020 11:48:26 +0900
Message-Id: <20201011024831.3868571-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

At the moment the MStar/SigmaStar support is only really
capable of shell from an initramfs and not much else.

Most of the interesting drivers are blocked on clock and pinctrl
drivers and those are going to take me a little while to get cleaned
up.

Clock and pinctrl aren't needed for basic GPIO to work (all pins
start off as GPIOs..) and it makes it possible to actually do something
so this series adds everything that is needed for the main GPIO
block in these chips.

Daniel Palmer (5):
  dt-bindings: gpio: Binding for MStar MSC313 GPIO controller
  dt-bindings: gpio: Add a binding header for the MSC313 GPIO driver
  gpio: msc313: MStar MSC313 GPIO driver
  ARM: mstar: Add gpio controller to MStar base dtsi
  ARM: mstar: Fill in GPIO controller properties for infinity

 .../bindings/gpio/mstar,msc313-gpio.yaml      |  69 ++++
 MAINTAINERS                                   |   3 +
 arch/arm/boot/dts/mstar-infinity.dtsi         |  16 +
 arch/arm/boot/dts/mstar-v7.dtsi               |   7 +
 drivers/gpio/Kconfig                          |   9 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-msc313.c                    | 341 ++++++++++++++++++
 include/dt-bindings/gpio/msc313-gpio.h        |  95 +++++
 8 files changed, 541 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
 create mode 100644 drivers/gpio/gpio-msc313.c
 create mode 100644 include/dt-bindings/gpio/msc313-gpio.h

-- 
2.27.0

