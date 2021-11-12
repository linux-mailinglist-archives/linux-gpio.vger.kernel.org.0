Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35D7844E6EA
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Nov 2021 14:02:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234918AbhKLNEx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Nov 2021 08:04:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234881AbhKLNEx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Nov 2021 08:04:53 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 521F4C061766;
        Fri, 12 Nov 2021 05:02:02 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id p16so22214802lfa.2;
        Fri, 12 Nov 2021 05:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q2HyZYTQ7EbqiqJLZ/fJPymguB4W3L3Q6K0iVJgrRec=;
        b=AD1WjOvmJ5OGsRkjWxHMArNQQmli8CQBqT6jVuTBfHpRh4mwRb/AcNbOerrijPL2t0
         WCSJC7Meb/gJ5j53ZDP6TYR7uoJ22yzEK5FBGmqojrX+dKUGoRuhJS6aihemTtiCOLyo
         nkGZl1UhDk1PmK3ruq5tJFz3DdNYYkPTlVZnKzsCCz1rgPwIteUs+nyc43njp11RC9L3
         P58eszCaT1ZgCsC27ePeeSvL5ryURGPXY4mBzOFMpEsJm72aUM8a3wbeR5yxXBZz4uUv
         MjK99lzEjOOF+Lod0QMs0Nx8wqgD80hky7WdWz+PMj9+Fhx+HojF71hA2qEq8GPQtF+7
         sw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q2HyZYTQ7EbqiqJLZ/fJPymguB4W3L3Q6K0iVJgrRec=;
        b=7sta+ESPDuVUBLLndxdohJ8nZyFyYa7Uc872wElg+sW+1eEXWlZUN/+n8CfwvkiOXz
         /EQnjwiO5WMNIMtvUM1NL4WZLSjn+zcFIcP2MdobkXBPhl/GpMLdk4Qcy2o1rx7rs+8K
         YKhUAdNxa58ECjN69F1N4qXoZfcmx7Z1kE3qT/TawrvBYu6i2ISdunlSVNBUJ0CR2CJ5
         RBEcgTkA6MQPJbh3Qx6T0yp6X6UFz/0KJ8IUB6JFdv1xXA1LQmmjtlDoofsQGFK4Lp1z
         q1uhQu1LGGYqqIjPqSsRgwXgqjXATArwF9UahhIo8+yLiCsARjLdRu7AbbRkcfyTTVER
         xnZg==
X-Gm-Message-State: AOAM530ymjumexQCINJ3OxRqFsezYRQ5RmOU915L0XqcKJ834ghjIzp4
        SY1nNUg/mCimQo6fGXz28fg=
X-Google-Smtp-Source: ABdhPJzYaPA3JKwGAcY5THVI6paIpZMH4z61Aj1RLDgiMEzvn8vYxIAFJH8F4346bv1Pk1aQDpygVQ==
X-Received: by 2002:a05:6512:3213:: with SMTP id d19mr13830336lfe.519.1636722119174;
        Fri, 12 Nov 2021 05:01:59 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id s14sm563413lfe.14.2021.11.12.05.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 05:01:58 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v2 0/5] gpio: tegra186: Add support for Tegra234
Date:   Fri, 12 Nov 2021 14:01:47 +0100
Message-Id: <20211112130152.3682556-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi,

this set of patches converts the Tegra186 (and later) GPIO device tree
bindings to json-schema and adds support for the GPIO controllers found
on the new Tegra234 SoC. This also adds a gpio-keys device tree node to
the Jetson AGX Orin Developer Kit device tree to allow events from the
various inputs to be received by the system.

Based on work by Prathamesh Shete.

Thierry

Prathamesh Shete (2):
  dt-bindings: gpio: Add Tegra234 support
  gpio: tegra186: Add support for Tegra234

Thierry Reding (3):
  dt-bindings: gpio: tegra186: Convert to json-schema
  arm64: tegra: Add main and AON GPIO controllers on Tegra234
  arm64: tegra: Enable gpio-keys on Jetson AGX Orin Developer Kit

 .../bindings/gpio/nvidia,tegra186-gpio.txt    | 165 --------------
 .../bindings/gpio/nvidia,tegra186-gpio.yaml   | 215 ++++++++++++++++++
 .../nvidia/tegra234-p3737-0000+p3701-0000.dts |  31 +++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi      |  75 ++++++
 drivers/gpio/gpio-tegra186.c                  |  76 +++++++
 include/dt-bindings/gpio/tegra234-gpio.h      |  63 +++++
 6 files changed, 460 insertions(+), 165 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
 create mode 100644 include/dt-bindings/gpio/tegra234-gpio.h

-- 
2.33.1

