Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C1882D250A
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 08:56:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726334AbgLHH4I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 02:56:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbgLHH4I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2020 02:56:08 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC379C061749;
        Mon,  7 Dec 2020 23:55:27 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id c198so1332551wmd.0;
        Mon, 07 Dec 2020 23:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y5t5X3T+9uiPlHL+SyLoVu8rBUqMKyK7LwZogvfh9xQ=;
        b=M0fx6VEn+BwLdieI5HZxETdtfhHwE6+xayRvMAyhaeey3fxefvmxZeXnMn6DUF1cs2
         7e5+R5Mj4y8lb8VAjmbV0sA94yeIrTXw0yAhPs8yRT+svhhfD6MgYgK7H3XMKcKsJrUI
         xgb5QIqbWJlv9NGc7QGydzgeiY8lw81hAF2dVJwZAJzl12tzkITSgKSY71TGwtt4sGk4
         ZTsRibdqxRYKHOWP1EfZlVPFqc1YhLBB8vUyxFXKkdoigrwi4Hy/zxaT1LVXwosKDiBd
         AzYCDQQwDavkaBhksJmfch0aLjdQi72eZEODGFarzm+PWg8PTxZRPg2bA13trV7O7j2j
         J6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y5t5X3T+9uiPlHL+SyLoVu8rBUqMKyK7LwZogvfh9xQ=;
        b=WZQc7WyGuIQOwZpyc7MePgyqryllQsFoJVI5HNy4g6NXYPUjcLdo6nZjdg1jnKZfWJ
         0BTJz1MaHYJU+zDbe3RSAHHy9DZMyJVRJlQX0h6VTxstpABwE+/92Uv2ybEUeJc6BCJL
         pBcQYnUk1YQeReWx0IMPnH7zVmC/z8rF6AuBbIJp5aGLuHqj9o66mCmCOLmOqDji9KJm
         9hK9cNPg9L/OY6yG7ZPvQESv1jUDGCtTPHZMiMhJH78i+w4vrKoWhY894s1f0HKn9BnJ
         n0IYcDsJzgXHMzE1BndTyHiLW6dDTUR38kxX8qdSApSifb6GPebb+53vGqheyx3LTJU0
         KIRQ==
X-Gm-Message-State: AOAM533RaZwDYvx9TFbE53NyqXl3pK6joYzeyVF0SfPPIfh6cnvBBJSy
        On1XPvDq5kZBSvn7oDm7OHc=
X-Google-Smtp-Source: ABdhPJyAo8FAQ+FtdXkUzZb1YmqUvO0sIrjFeLfPOYPK971E4HkYcRn1akpF/3iXZ3r3RISicNfU5w==
X-Received: by 2002:a1c:7218:: with SMTP id n24mr2586630wmc.186.1607414126696;
        Mon, 07 Dec 2020 23:55:26 -0800 (PST)
Received: from localhost.localdomain (188.red-81-44-87.dynamicip.rima-tde.net. [81.44.87.188])
        by smtp.gmail.com with ESMTPSA id h184sm1620735wmh.23.2020.12.07.23.55.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Dec 2020 23:55:25 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linus.walleij@linaro.org
Cc:     robh+dt@kernel.org, gregkh@linuxfoundation.org,
        yanaijie@huawei.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, devel@driverdev.osuosl.org
Subject: [PATCH v2 0/2] pinctrl: ralink: pinctrl driver for the rt2880 family
Date:   Tue,  8 Dec 2020 08:55:21 +0100
Message-Id: <20201208075523.7060-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series adds a pinctrl driver for ralink rt2880 SoC.

After last cleanup in staging I was told [0] this driver is ready to be
promoted from staging.

This series are rebased on the top of staging-testing.

Thanks in advance for your time.

Changes in v2:
    - Squash PATCH 2/3 and PATCH 3/3 in only one.
    - Put driver inside 'ralink' subdir of pinctrl.
    - Add Linus'Acked-by for driver after squashing two patches. 
    - Make changes suggested by Linus in bindings doc: [1].
      NOTE that I simplified but not removes if-clause because without
      that I am not be able to validate using 'dt_binding_check' with errors
      in all pinctrl nodes because are not of type 'object'.

Best regards,
    Sergio Paracuellos

[0]: http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2020-December/149178.html
[1]: http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2020-December/149204.html

*** BLURB HERE ***

Sergio Paracuellos (2):
  dt-bindings: pinctrl: rt2880: add binding document
  pinctrl: ralink: add a pinctrl driver for the rt2880 family

 .../pinctrl/ralink,rt2880-pinmux.yaml         | 70 +++++++++++++++++++
 drivers/pinctrl/Kconfig                       |  1 +
 drivers/pinctrl/Makefile                      |  1 +
 drivers/pinctrl/ralink/Kconfig                | 14 ++++
 .../ralink}/Makefile                          |  2 -
 .../ralink}/pinctrl-rt2880.c                  |  4 +-
 drivers/staging/Kconfig                       |  2 -
 drivers/staging/Makefile                      |  1 -
 drivers/staging/mt7621-pinctrl/Kconfig        |  6 --
 drivers/staging/mt7621-pinctrl/TODO           |  6 --
 10 files changed, 88 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinmux.yaml
 create mode 100644 drivers/pinctrl/ralink/Kconfig
 rename drivers/{staging/mt7621-pinctrl => pinctrl/ralink}/Makefile (66%)
 rename drivers/{staging/mt7621-pinctrl => pinctrl/ralink}/pinctrl-rt2880.c (99%)
 delete mode 100644 drivers/staging/mt7621-pinctrl/Kconfig
 delete mode 100644 drivers/staging/mt7621-pinctrl/TODO

-- 
2.25.1

